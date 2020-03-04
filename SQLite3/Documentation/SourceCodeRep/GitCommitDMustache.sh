#!/bin/bash

echo FossilRepository=$1
echo GitRepository=$2
echo GitExe=$3
echo DescFile=$4
#echo DevPath=$5
echo
echo
echo dmustache repository
echo --------------------

cd $2
cd ../dmustache

$3 pull

rsync -av --update --existing $1/* $2

# wait a little, otherwise git fails to commit all modifications
sleep 1

$3 add .
$3 commit -a --file=$4
$3 push

