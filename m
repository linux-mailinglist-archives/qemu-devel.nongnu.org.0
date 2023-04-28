Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FA16F1857
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 14:43:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psNQ2-0000pT-5e; Fri, 28 Apr 2023 08:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1psNP9-0006xs-OJ
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:40:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1psNP5-0000rV-AU
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682685645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kV2zWPGuK8k4CzzrslCllCo66hc9AmkTXdFYc+wQU0A=;
 b=VCT6vCdt01wIqL8zh/b2/l0LFY5eVtvwMCeyUqRevKGDjY4vhukIkS/MK5/QEGgtWC6jV1
 3uEZprzf1g62INSbCUfnPkKgB7DaNlghfAFPRjNyBeVUyiKHnktWdmHG6rUumb77us33TL
 FTcDvAWVfxwnquYgatDYLPPwBZRd83w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-hcOszpRuOVK59f7GcLJfcQ-1; Fri, 28 Apr 2023 08:40:38 -0400
X-MC-Unique: hcOszpRuOVK59f7GcLJfcQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A957238237CE;
 Fri, 28 Apr 2023 12:40:37 +0000 (UTC)
Received: from localhost (unknown [10.39.192.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCE4D1121314;
 Fri, 28 Apr 2023 12:40:36 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Julia Suvorova <jusual@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PULL 15/17] block: add accounting for zone append operation
Date: Fri, 28 Apr 2023 08:39:52 -0400
Message-Id: <20230428123954.179035-16-stefanha@redhat.com>
In-Reply-To: <20230428123954.179035-1-stefanha@redhat.com>
References: <20230428123954.179035-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Sam Li <faithilikerun@gmail.com>

Taking account of the new zone append write operation for zoned devices,
BLOCK_ACCT_ZONE_APPEND enum is introduced as other I/O request type (read,
write, flush).

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20230407082528.18841-4-faithilikerun@gmail.com>
---
 qapi/block-core.json       | 68 ++++++++++++++++++++++++++++++++------
 qapi/block.json            |  4 +++
 include/block/accounting.h |  1 +
 block/qapi-sysemu.c        | 11 ++++++
 block/qapi.c               | 18 ++++++++++
 hw/block/virtio-blk.c      |  4 +++
 6 files changed, 95 insertions(+), 11 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index c05ad0c07e..44a70aad21 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -849,6 +849,10 @@
 # @min_wr_latency_ns: Minimum latency of write operations in the
 #                     defined interval, in nanoseconds.
 #
+# @min_zone_append_latency_ns: Minimum latency of zone append operations
+#                              in the defined interval, in nanoseconds
+#                              (since 8.1)
+#
 # @min_flush_latency_ns: Minimum latency of flush operations in the
 #                        defined interval, in nanoseconds.
 #
@@ -858,6 +862,10 @@
 # @max_wr_latency_ns: Maximum latency of write operations in the
 #                     defined interval, in nanoseconds.
 #
+# @max_zone_append_latency_ns: Maximum latency of zone append operations
+#                              in the defined interval, in nanoseconds
+#                              (since 8.1)
+#
 # @max_flush_latency_ns: Maximum latency of flush operations in the
 #                        defined interval, in nanoseconds.
 #
@@ -867,6 +875,10 @@
 # @avg_wr_latency_ns: Average latency of write operations in the
 #                     defined interval, in nanoseconds.
 #
+# @avg_zone_append_latency_ns: Average latency of zone append operations
+#                              in the defined interval, in nanoseconds
+#                              (since 8.1)
+#
 # @avg_flush_latency_ns: Average latency of flush operations in the
 #                        defined interval, in nanoseconds.
 #
@@ -876,15 +888,23 @@
 # @avg_wr_queue_depth: Average number of pending write operations
 #                      in the defined interval.
 #
+# @avg_zone_append_queue_depth: Average number of pending zone append
+#                               operations in the defined interval
+#                               (since 8.1).
+#
 # Since: 2.5
 ##
 { 'struct': 'BlockDeviceTimedStats',
   'data': { 'interval_length': 'int', 'min_rd_latency_ns': 'int',
             'max_rd_latency_ns': 'int', 'avg_rd_latency_ns': 'int',
             'min_wr_latency_ns': 'int', 'max_wr_latency_ns': 'int',
-            'avg_wr_latency_ns': 'int', 'min_flush_latency_ns': 'int',
-            'max_flush_latency_ns': 'int', 'avg_flush_latency_ns': 'int',
-            'avg_rd_queue_depth': 'number', 'avg_wr_queue_depth': 'number' } }
+            'avg_wr_latency_ns': 'int', 'min_zone_append_latency_ns': 'int',
+            'max_zone_append_latency_ns': 'int',
+            'avg_zone_append_latency_ns': 'int',
+            'min_flush_latency_ns': 'int', 'max_flush_latency_ns': 'int',
+            'avg_flush_latency_ns': 'int', 'avg_rd_queue_depth': 'number',
+            'avg_wr_queue_depth': 'number',
+            'avg_zone_append_queue_depth': 'number'  } }
 
 ##
 # @BlockDeviceStats:
@@ -895,12 +915,18 @@
 #
 # @wr_bytes: The number of bytes written by the device.
 #
+# @zone_append_bytes: The number of bytes appended by the zoned devices
+#                     (since 8.1)
+#
 # @unmap_bytes: The number of bytes unmapped by the device (Since 4.2)
 #
 # @rd_operations: The number of read operations performed by the device.
 #
 # @wr_operations: The number of write operations performed by the device.
 #
+# @zone_append_operations: The number of zone append operations performed
+#                          by the zoned devices (since 8.1)
+#
 # @flush_operations: The number of cache flush operations performed by the
 #                    device (since 0.15)
 #
@@ -911,6 +937,9 @@
 #
 # @wr_total_time_ns: Total time spent on writes in nanoseconds (since 0.15).
 #
+# @zone_append_total_time_ns: Total time spent on zone append writes
+#                             in nanoseconds (since 8.1)
+#
 # @flush_total_time_ns: Total time spent on cache flushes in nanoseconds
 #                       (since 0.15).
 #
@@ -928,6 +957,9 @@
 # @wr_merged: Number of write requests that have been merged into another
 #             request (Since 2.3).
 #
+# @zone_append_merged: Number of zone append requests that have been merged
+#                      into another request (since 8.1)
+#
 # @unmap_merged: Number of unmap requests that have been merged into another
 #                request (Since 4.2)
 #
@@ -941,6 +973,10 @@
 # @failed_wr_operations: The number of failed write operations
 #                        performed by the device (Since 2.5)
 #
+# @failed_zone_append_operations: The number of failed zone append write
+#                                 operations performed by the zoned devices
+#                                 (since 8.1)
+#
 # @failed_flush_operations: The number of failed flush operations
 #                           performed by the device (Since 2.5)
 #
@@ -953,6 +989,9 @@
 # @invalid_wr_operations: The number of invalid write operations
 #                         performed by the device (Since 2.5)
 #
+# @invalid_zone_append_operations: The number of invalid zone append operations
+#                                  performed by the zoned device (since 8.1)
+#
 # @invalid_flush_operations: The number of invalid flush operations
 #                            performed by the device (Since 2.5)
 #
@@ -972,27 +1011,34 @@
 #
 # @wr_latency_histogram: @BlockLatencyHistogramInfo. (Since 4.0)
 #
+# @zone_append_latency_histogram: @BlockLatencyHistogramInfo. (since 8.1)
+#
 # @flush_latency_histogram: @BlockLatencyHistogramInfo. (Since 4.0)
 #
 # Since: 0.14
 ##
 { 'struct': 'BlockDeviceStats',
-  'data': {'rd_bytes': 'int', 'wr_bytes': 'int', 'unmap_bytes' : 'int',
-           'rd_operations': 'int', 'wr_operations': 'int',
+  'data': {'rd_bytes': 'int', 'wr_bytes': 'int', 'zone_append_bytes': 'int',
+           'unmap_bytes' : 'int', 'rd_operations': 'int',
+           'wr_operations': 'int', 'zone_append_operations': 'int',
            'flush_operations': 'int', 'unmap_operations': 'int',
            'rd_total_time_ns': 'int', 'wr_total_time_ns': 'int',
-           'flush_total_time_ns': 'int', 'unmap_total_time_ns': 'int',
-           'wr_highest_offset': 'int',
-           'rd_merged': 'int', 'wr_merged': 'int', 'unmap_merged': 'int',
-           '*idle_time_ns': 'int',
+           'zone_append_total_time_ns': 'int', 'flush_total_time_ns': 'int',
+           'unmap_total_time_ns': 'int', 'wr_highest_offset': 'int',
+           'rd_merged': 'int', 'wr_merged': 'int', 'zone_append_merged': 'int',
+           'unmap_merged': 'int', '*idle_time_ns': 'int',
            'failed_rd_operations': 'int', 'failed_wr_operations': 'int',
-           'failed_flush_operations': 'int', 'failed_unmap_operations': 'int',
-           'invalid_rd_operations': 'int', 'invalid_wr_operations': 'int',
+           'failed_zone_append_operations': 'int',
+           'failed_flush_operations': 'int',
+           'failed_unmap_operations': 'int', 'invalid_rd_operations': 'int',
+           'invalid_wr_operations': 'int',
+           'invalid_zone_append_operations': 'int',
            'invalid_flush_operations': 'int', 'invalid_unmap_operations': 'int',
            'account_invalid': 'bool', 'account_failed': 'bool',
            'timed_stats': ['BlockDeviceTimedStats'],
            '*rd_latency_histogram': 'BlockLatencyHistogramInfo',
            '*wr_latency_histogram': 'BlockLatencyHistogramInfo',
+           '*zone_append_latency_histogram': 'BlockLatencyHistogramInfo',
            '*flush_latency_histogram': 'BlockLatencyHistogramInfo' } }
 
 ##
diff --git a/qapi/block.json b/qapi/block.json
index 5fe068f903..5a57ef4a9f 100644
--- a/qapi/block.json
+++ b/qapi/block.json
@@ -525,6 +525,9 @@
 # @boundaries-write: list of interval boundary values for write latency
 #                    histogram.
 #
+# @boundaries-zap: list of interval boundary values for zone append write
+#                  latency histogram.
+#
 # @boundaries-flush: list of interval boundary values for flush latency
 #                    histogram.
 #
@@ -573,5 +576,6 @@
            '*boundaries': ['uint64'],
            '*boundaries-read': ['uint64'],
            '*boundaries-write': ['uint64'],
+           '*boundaries-zap': ['uint64'],
            '*boundaries-flush': ['uint64'] },
   'allow-preconfig': true }
diff --git a/include/block/accounting.h b/include/block/accounting.h
index b9caad60d5..a59e39f49d 100644
--- a/include/block/accounting.h
+++ b/include/block/accounting.h
@@ -37,6 +37,7 @@ enum BlockAcctType {
     BLOCK_ACCT_READ,
     BLOCK_ACCT_WRITE,
     BLOCK_ACCT_FLUSH,
+    BLOCK_ACCT_ZONE_APPEND,
     BLOCK_ACCT_UNMAP,
     BLOCK_MAX_IOTYPE,
 };
diff --git a/block/qapi-sysemu.c b/block/qapi-sysemu.c
index 7bd7554150..cec3c1afb4 100644
--- a/block/qapi-sysemu.c
+++ b/block/qapi-sysemu.c
@@ -517,6 +517,7 @@ void qmp_block_latency_histogram_set(
     bool has_boundaries, uint64List *boundaries,
     bool has_boundaries_read, uint64List *boundaries_read,
     bool has_boundaries_write, uint64List *boundaries_write,
+    bool has_boundaries_append, uint64List *boundaries_append,
     bool has_boundaries_flush, uint64List *boundaries_flush,
     Error **errp)
 {
@@ -557,6 +558,16 @@ void qmp_block_latency_histogram_set(
         }
     }
 
+    if (has_boundaries || has_boundaries_append) {
+        ret = block_latency_histogram_set(
+                stats, BLOCK_ACCT_ZONE_APPEND,
+                has_boundaries_append ? boundaries_append : boundaries);
+        if (ret) {
+            error_setg(errp, "Device '%s' set append write boundaries fail", id);
+            return;
+        }
+    }
+
     if (has_boundaries || has_boundaries_flush) {
         ret = block_latency_histogram_set(
             stats, BLOCK_ACCT_FLUSH,
diff --git a/block/qapi.c b/block/qapi.c
index c84147849d..2684484e9d 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -533,27 +533,36 @@ static void bdrv_query_blk_stats(BlockDeviceStats *ds, BlockBackend *blk)
 
     ds->rd_bytes = stats->nr_bytes[BLOCK_ACCT_READ];
     ds->wr_bytes = stats->nr_bytes[BLOCK_ACCT_WRITE];
+    ds->zone_append_bytes = stats->nr_bytes[BLOCK_ACCT_ZONE_APPEND];
     ds->unmap_bytes = stats->nr_bytes[BLOCK_ACCT_UNMAP];
     ds->rd_operations = stats->nr_ops[BLOCK_ACCT_READ];
     ds->wr_operations = stats->nr_ops[BLOCK_ACCT_WRITE];
+    ds->zone_append_operations = stats->nr_ops[BLOCK_ACCT_ZONE_APPEND];
     ds->unmap_operations = stats->nr_ops[BLOCK_ACCT_UNMAP];
 
     ds->failed_rd_operations = stats->failed_ops[BLOCK_ACCT_READ];
     ds->failed_wr_operations = stats->failed_ops[BLOCK_ACCT_WRITE];
+    ds->failed_zone_append_operations =
+        stats->failed_ops[BLOCK_ACCT_ZONE_APPEND];
     ds->failed_flush_operations = stats->failed_ops[BLOCK_ACCT_FLUSH];
     ds->failed_unmap_operations = stats->failed_ops[BLOCK_ACCT_UNMAP];
 
     ds->invalid_rd_operations = stats->invalid_ops[BLOCK_ACCT_READ];
     ds->invalid_wr_operations = stats->invalid_ops[BLOCK_ACCT_WRITE];
+    ds->invalid_zone_append_operations =
+        stats->invalid_ops[BLOCK_ACCT_ZONE_APPEND];
     ds->invalid_flush_operations =
         stats->invalid_ops[BLOCK_ACCT_FLUSH];
     ds->invalid_unmap_operations = stats->invalid_ops[BLOCK_ACCT_UNMAP];
 
     ds->rd_merged = stats->merged[BLOCK_ACCT_READ];
     ds->wr_merged = stats->merged[BLOCK_ACCT_WRITE];
+    ds->zone_append_merged = stats->merged[BLOCK_ACCT_ZONE_APPEND];
     ds->unmap_merged = stats->merged[BLOCK_ACCT_UNMAP];
     ds->flush_operations = stats->nr_ops[BLOCK_ACCT_FLUSH];
     ds->wr_total_time_ns = stats->total_time_ns[BLOCK_ACCT_WRITE];
+    ds->zone_append_total_time_ns =
+        stats->total_time_ns[BLOCK_ACCT_ZONE_APPEND];
     ds->rd_total_time_ns = stats->total_time_ns[BLOCK_ACCT_READ];
     ds->flush_total_time_ns = stats->total_time_ns[BLOCK_ACCT_FLUSH];
     ds->unmap_total_time_ns = stats->total_time_ns[BLOCK_ACCT_UNMAP];
@@ -571,6 +580,7 @@ static void bdrv_query_blk_stats(BlockDeviceStats *ds, BlockBackend *blk)
 
         TimedAverage *rd = &ts->latency[BLOCK_ACCT_READ];
         TimedAverage *wr = &ts->latency[BLOCK_ACCT_WRITE];
+        TimedAverage *zap = &ts->latency[BLOCK_ACCT_ZONE_APPEND];
         TimedAverage *fl = &ts->latency[BLOCK_ACCT_FLUSH];
 
         dev_stats->interval_length = ts->interval_length;
@@ -583,6 +593,10 @@ static void bdrv_query_blk_stats(BlockDeviceStats *ds, BlockBackend *blk)
         dev_stats->max_wr_latency_ns = timed_average_max(wr);
         dev_stats->avg_wr_latency_ns = timed_average_avg(wr);
 
+        dev_stats->min_zone_append_latency_ns = timed_average_min(zap);
+        dev_stats->max_zone_append_latency_ns = timed_average_max(zap);
+        dev_stats->avg_zone_append_latency_ns = timed_average_avg(zap);
+
         dev_stats->min_flush_latency_ns = timed_average_min(fl);
         dev_stats->max_flush_latency_ns = timed_average_max(fl);
         dev_stats->avg_flush_latency_ns = timed_average_avg(fl);
@@ -591,6 +605,8 @@ static void bdrv_query_blk_stats(BlockDeviceStats *ds, BlockBackend *blk)
             block_acct_queue_depth(ts, BLOCK_ACCT_READ);
         dev_stats->avg_wr_queue_depth =
             block_acct_queue_depth(ts, BLOCK_ACCT_WRITE);
+        dev_stats->avg_zone_append_queue_depth =
+            block_acct_queue_depth(ts, BLOCK_ACCT_ZONE_APPEND);
 
         QAPI_LIST_PREPEND(ds->timed_stats, dev_stats);
     }
@@ -600,6 +616,8 @@ static void bdrv_query_blk_stats(BlockDeviceStats *ds, BlockBackend *blk)
         = bdrv_latency_histogram_stats(&hgram[BLOCK_ACCT_READ]);
     ds->wr_latency_histogram
         = bdrv_latency_histogram_stats(&hgram[BLOCK_ACCT_WRITE]);
+    ds->zone_append_latency_histogram
+        = bdrv_latency_histogram_stats(&hgram[BLOCK_ACCT_ZONE_APPEND]);
     ds->flush_latency_histogram
         = bdrv_latency_histogram_stats(&hgram[BLOCK_ACCT_FLUSH]);
 }
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 8b6030b1a5..a9d3168770 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -919,6 +919,10 @@ static int virtio_blk_handle_zone_append(VirtIOBlockReq *req,
     data->in_num = in_num;
     data->zone_append_data.offset = offset;
     qemu_iovec_init_external(&req->qiov, out_iov, out_num);
+
+    block_acct_start(blk_get_stats(s->blk), &req->acct, len,
+                     BLOCK_ACCT_ZONE_APPEND);
+
     blk_aio_zone_append(s->blk, &data->zone_append_data.offset, &req->qiov, 0,
                         virtio_blk_zone_append_complete, data);
     return 0;
-- 
2.40.0


