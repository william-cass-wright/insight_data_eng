#!/bin/bash

rm -r __pycache__
rm -r tmp

start=`date +%s`
mkdir tmp

spark-submit \
--packages org.apache.hadoop:hadoop-aws:3.2.0 \
--verbose \
--conf spark.shuffle.consolidateFiles=true \
spark_app.py

end=`date +%s`
runtime=$((end-start))
echo process runtime in seconds
echo $runtime