Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 661C717B79B
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 08:41:55 +0100 (CET)
Received: from localhost ([::1]:60521 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jA7cI-0002jM-DZ
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 02:41:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46287)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jA7ZH-00053t-Lb
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 02:38:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jA7ZG-0008KI-2U
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 02:38:47 -0500
Received: from relay.sw.ru ([185.231.240.75]:37984)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1jA7ZC-0007wq-HZ; Fri, 06 Mar 2020 02:38:42 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1jA7Z8-0002Qu-BU; Fri, 06 Mar 2020 10:38:38 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 4/9] block/block-copy: use block_status
Date: Fri,  6 Mar 2020 10:38:26 +0300
Message-Id: <20200306073831.7737-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200306073831.7737-1-vsementsov@virtuozzo.com>
References: <20200306073831.7737-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, andrey.shinkevich@virtuozzo.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use bdrv_block_status_above to chose effective chunk size and to handle
zeroes effectively.

This substitutes checking for just being allocated or not, and drops
old code path for it. Assistance by backup job is dropped too, as
caching block-status information is more difficult than just caching
is-allocated information in our dirty bitmap, and backup job is not
good place for this caching anyway.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 block/block-copy.c | 73 +++++++++++++++++++++++++++++++++++++---------
 block/trace-events |  1 +
 2 files changed, 61 insertions(+), 13 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index ddd61c1652..b075dba206 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -155,7 +155,7 @@ void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm)
  */
 static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
                                            int64_t start, int64_t end,
-                                           bool *error_is_read)
+                                           bool zeroes, bool *error_is_read)
 {
     int ret;
     int nbytes = MIN(end, s->len) - start;
@@ -165,6 +165,18 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
     assert(QEMU_IS_ALIGNED(end, s->cluster_size));
     assert(end < s->len || end == QEMU_ALIGN_UP(s->len, s->cluster_size));
 
+    if (zeroes) {
+        ret = bdrv_co_pwrite_zeroes(s->target, start, nbytes, s->write_flags &
+                                    ~BDRV_REQ_WRITE_COMPRESSED);
+        if (ret < 0) {
+            trace_block_copy_write_zeroes_fail(s, start, ret);
+            if (error_is_read) {
+                *error_is_read = false;
+            }
+        }
+        return ret;
+    }
+
     if (s->use_copy_range) {
         ret = bdrv_co_copy_range(s->source, start, s->target, start, nbytes,
                                  0, s->write_flags);
@@ -230,6 +242,38 @@ out:
     return ret;
 }
 
+static int block_copy_block_status(BlockCopyState *s, int64_t offset,
+                                   int64_t bytes, int64_t *pnum)
+{
+    int64_t num;
+    BlockDriverState *base;
+    int ret;
+
+    if (s->skip_unallocated && s->source->bs->backing) {
+        base = s->source->bs->backing->bs;
+    } else {
+        base = NULL;
+    }
+
+    ret = bdrv_block_status_above(s->source->bs, base, offset, bytes, &num,
+                                  NULL, NULL);
+    if (ret < 0 || num < s->cluster_size) {
+        /*
+         * On error or if failed to obtain large enough chunk just fallback to
+         * copy one cluster.
+         */
+        num = s->cluster_size;
+        ret = BDRV_BLOCK_ALLOCATED | BDRV_BLOCK_DATA;
+    } else if (offset + num == s->len) {
+        num = QEMU_ALIGN_UP(num, s->cluster_size);
+    } else {
+        num = QEMU_ALIGN_DOWN(num, s->cluster_size);
+    }
+
+    *pnum = num;
+    return ret;
+}
+
 /*
  * Check if the cluster starting at offset is allocated or not.
  * return via pnum the number of contiguous clusters sharing this allocation.
@@ -308,7 +352,6 @@ int coroutine_fn block_copy(BlockCopyState *s,
 {
     int ret = 0;
     int64_t end = bytes + start; /* bytes */
-    int64_t status_bytes;
     BlockCopyInFlightReq req;
 
     /*
@@ -325,7 +368,7 @@ int coroutine_fn block_copy(BlockCopyState *s,
     block_copy_inflight_req_begin(s, &req, start, end);
 
     while (start < end) {
-        int64_t next_zero, chunk_end;
+        int64_t next_zero, chunk_end, status_bytes;
 
         if (!bdrv_dirty_bitmap_get(s->copy_bitmap, start)) {
             trace_block_copy_skip(s, start);
@@ -343,24 +386,28 @@ int coroutine_fn block_copy(BlockCopyState *s,
             chunk_end = next_zero;
         }
 
-        if (s->skip_unallocated) {
-            ret = block_copy_reset_unallocated(s, start, &status_bytes);
-            if (ret == 0) {
-                trace_block_copy_skip_range(s, start, status_bytes);
-                start += status_bytes;
-                continue;
-            }
-            /* Clamp to known allocated region */
-            chunk_end = MIN(chunk_end, start + status_bytes);
+        ret = block_copy_block_status(s, start, chunk_end - start,
+                                      &status_bytes);
+        if (s->skip_unallocated && !(ret & BDRV_BLOCK_ALLOCATED)) {
+            bdrv_reset_dirty_bitmap(s->copy_bitmap, start, status_bytes);
+            progress_set_remaining(s->progress,
+                                   bdrv_get_dirty_count(s->copy_bitmap) +
+                                   s->in_flight_bytes);
+            trace_block_copy_skip_range(s, start, status_bytes);
+            start += status_bytes;
+            continue;
         }
 
+        chunk_end = MIN(chunk_end, start + status_bytes);
+
         trace_block_copy_process(s, start);
 
         bdrv_reset_dirty_bitmap(s->copy_bitmap, start, chunk_end - start);
         s->in_flight_bytes += chunk_end - start;
 
         co_get_from_shres(s->mem, chunk_end - start);
-        ret = block_copy_do_copy(s, start, chunk_end, error_is_read);
+        ret = block_copy_do_copy(s, start, chunk_end, ret & BDRV_BLOCK_ZERO,
+                                 error_is_read);
         co_put_to_shres(s->mem, chunk_end - start);
         s->in_flight_bytes -= chunk_end - start;
         if (ret < 0) {
diff --git a/block/trace-events b/block/trace-events
index 1a7329b736..29dff8881c 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -48,6 +48,7 @@ block_copy_process(void *bcs, int64_t start) "bcs %p start %"PRId64
 block_copy_copy_range_fail(void *bcs, int64_t start, int ret) "bcs %p start %"PRId64" ret %d"
 block_copy_read_fail(void *bcs, int64_t start, int ret) "bcs %p start %"PRId64" ret %d"
 block_copy_write_fail(void *bcs, int64_t start, int ret) "bcs %p start %"PRId64" ret %d"
+block_copy_write_zeroes_fail(void *bcs, int64_t start, int ret) "bcs %p start %"PRId64" ret %d"
 
 # ../blockdev.c
 qmp_block_job_cancel(void *job) "job %p"
-- 
2.21.0


