#!/bin/bash

# usage = ./enumurl.sh <some url>

#set $target to first param passed to this script
target=$1

# grep pattern for processing the index.html file
pattern='[A-Za-z0-9_\.-]*\.*'$target

webpage=$(wget $target -q -O -)
for url in $(grep -o $pattern <<< $webpage | sort -u)
 do host $url | grep "has address" | cut -d " " -f4
done
