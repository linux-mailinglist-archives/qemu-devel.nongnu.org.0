Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111C317B795
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 08:41:40 +0100 (CET)
Received: from localhost ([::1]:60514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jA7c3-00026G-3N
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 02:41:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46319)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jA7ZI-00055h-9I
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 02:38:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jA7ZG-0008LC-96
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 02:38:48 -0500
Received: from relay.sw.ru ([185.231.240.75]:37966)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1jA7ZC-0007wt-He; Fri, 06 Mar 2020 02:38:42 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1jA7Z8-0002Qu-M7; Fri, 06 Mar 2020 10:38:38 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 7/9] block/block-copy: rename start to offset in interfaces
Date: Fri,  6 Mar 2020 10:38:29 +0300
Message-Id: <20200306073831.7737-8-vsementsov@virtuozzo.com>
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

offset/bytes pair is more usual naming in block layer, let's use it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block-copy.h |  4 +-
 block/block-copy.c         | 84 +++++++++++++++++++-------------------
 2 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 039cf7c908..c46b382cc6 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -19,7 +19,7 @@
 #include "qemu/co-shared-resource.h"
 
 typedef struct BlockCopyInFlightReq {
-    int64_t start;
+    int64_t offset;
     int64_t bytes;
     QLIST_ENTRY(BlockCopyInFlightReq) list;
     CoQueue wait_queue; /* coroutines blocked on this request */
@@ -86,7 +86,7 @@ void block_copy_state_free(BlockCopyState *s);
 int64_t block_copy_reset_unallocated(BlockCopyState *s,
                                      int64_t offset, int64_t *count);
 
-int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
+int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
                             bool *error_is_read);
 
 #endif /* BLOCK_COPY_H */
diff --git a/block/block-copy.c b/block/block-copy.c
index 4c947e548b..2b29131653 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -25,13 +25,13 @@
 #define BLOCK_COPY_MAX_MEM (128 * MiB)
 
 static BlockCopyInFlightReq *find_conflicting_inflight_req(BlockCopyState *s,
-                                                           int64_t start,
-                                                           int64_t bytes)
+                                                          int64_t offset,
+                                                          int64_t bytes)
 {
     BlockCopyInFlightReq *req;
 
     QLIST_FOREACH(req, &s->inflight_reqs, list) {
-        if (start + bytes > req->start && start < req->start + req->bytes) {
+        if (offset + bytes > req->offset && offset < req->offset + req->bytes) {
             return req;
         }
     }
@@ -40,21 +40,21 @@ static BlockCopyInFlightReq *find_conflicting_inflight_req(BlockCopyState *s,
 }
 
 static void coroutine_fn block_copy_wait_inflight_reqs(BlockCopyState *s,
-                                                       int64_t start,
+                                                       int64_t offset,
                                                        int64_t bytes)
 {
     BlockCopyInFlightReq *req;
 
-    while ((req = find_conflicting_inflight_req(s, start, bytes))) {
+    while ((req = find_conflicting_inflight_req(s, offset, bytes))) {
         qemu_co_queue_wait(&req->wait_queue, NULL);
     }
 }
 
 static void block_copy_inflight_req_begin(BlockCopyState *s,
                                           BlockCopyInFlightReq *req,
-                                          int64_t start, int64_t bytes)
+                                          int64_t offset, int64_t bytes)
 {
-    req->start = start;
+    req->offset = offset;
     req->bytes = bytes;
     qemu_co_queue_init(&req->wait_queue);
     QLIST_INSERT_HEAD(&s->inflight_reqs, req, list);
@@ -161,26 +161,26 @@ void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm)
  * Returns 0 on success.
  */
 static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
-                                           int64_t start, int64_t bytes,
+                                           int64_t offset, int64_t bytes,
                                            bool zeroes, bool *error_is_read)
 {
     int ret;
-    int64_t nbytes = MIN(start + bytes, s->len) - start;
+    int64_t nbytes = MIN(offset + bytes, s->len) - offset;
     void *bounce_buffer = NULL;
 
-    assert(start >= 0 && bytes > 0 && INT64_MAX - start >= bytes);
-    assert(QEMU_IS_ALIGNED(start, s->cluster_size));
+    assert(offset >= 0 && bytes > 0 && INT64_MAX - offset >= bytes);
+    assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
     assert(QEMU_IS_ALIGNED(bytes, s->cluster_size));
-    assert(start < s->len);
-    assert(start + bytes <= s->len ||
-           start + bytes == QEMU_ALIGN_UP(s->len, s->cluster_size));
+    assert(offset < s->len);
+    assert(offset + bytes <= s->len ||
+           offset + bytes == QEMU_ALIGN_UP(s->len, s->cluster_size));
     assert(nbytes < INT_MAX);
 
     if (zeroes) {
-        ret = bdrv_co_pwrite_zeroes(s->target, start, nbytes, s->write_flags &
+        ret = bdrv_co_pwrite_zeroes(s->target, offset, nbytes, s->write_flags &
                                     ~BDRV_REQ_WRITE_COMPRESSED);
         if (ret < 0) {
-            trace_block_copy_write_zeroes_fail(s, start, ret);
+            trace_block_copy_write_zeroes_fail(s, offset, ret);
             if (error_is_read) {
                 *error_is_read = false;
             }
@@ -189,10 +189,10 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
     }
 
     if (s->use_copy_range) {
-        ret = bdrv_co_copy_range(s->source, start, s->target, start, nbytes,
+        ret = bdrv_co_copy_range(s->source, offset, s->target, offset, nbytes,
                                  0, s->write_flags);
         if (ret < 0) {
-            trace_block_copy_copy_range_fail(s, start, ret);
+            trace_block_copy_copy_range_fail(s, offset, ret);
             s->use_copy_range = false;
             s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
             /* Fallback to read+write with allocated buffer */
@@ -228,19 +228,19 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
 
     bounce_buffer = qemu_blockalign(s->source->bs, nbytes);
 
-    ret = bdrv_co_pread(s->source, start, nbytes, bounce_buffer, 0);
+    ret = bdrv_co_pread(s->source, offset, nbytes, bounce_buffer, 0);
     if (ret < 0) {
-        trace_block_copy_read_fail(s, start, ret);
+        trace_block_copy_read_fail(s, offset, ret);
         if (error_is_read) {
             *error_is_read = true;
         }
         goto out;
     }
 
-    ret = bdrv_co_pwrite(s->target, start, nbytes, bounce_buffer,
+    ret = bdrv_co_pwrite(s->target, offset, nbytes, bounce_buffer,
                          s->write_flags);
     if (ret < 0) {
-        trace_block_copy_write_fail(s, start, ret);
+        trace_block_copy_write_fail(s, offset, ret);
         if (error_is_read) {
             *error_is_read = false;
         }
@@ -358,7 +358,7 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
 }
 
 int coroutine_fn block_copy(BlockCopyState *s,
-                            int64_t start, int64_t bytes,
+                            int64_t offset, int64_t bytes,
                             bool *error_is_read)
 {
     int ret = 0;
@@ -371,64 +371,64 @@ int coroutine_fn block_copy(BlockCopyState *s,
     assert(bdrv_get_aio_context(s->source->bs) ==
            bdrv_get_aio_context(s->target->bs));
 
-    assert(QEMU_IS_ALIGNED(start, s->cluster_size));
+    assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
     assert(QEMU_IS_ALIGNED(bytes, s->cluster_size));
 
-    block_copy_wait_inflight_reqs(s, start, bytes);
-    block_copy_inflight_req_begin(s, &req, start, bytes);
+    block_copy_wait_inflight_reqs(s, offset, bytes);
+    block_copy_inflight_req_begin(s, &req, offset, bytes);
 
     while (bytes) {
         int64_t next_zero, cur_bytes, status_bytes;
 
-        if (!bdrv_dirty_bitmap_get(s->copy_bitmap, start)) {
-            trace_block_copy_skip(s, start);
-            start += s->cluster_size;
+        if (!bdrv_dirty_bitmap_get(s->copy_bitmap, offset)) {
+            trace_block_copy_skip(s, offset);
+            offset += s->cluster_size;
             bytes -= s->cluster_size;
             continue; /* already copied */
         }
 
         cur_bytes = MIN(bytes, s->copy_size);
 
-        next_zero = bdrv_dirty_bitmap_next_zero(s->copy_bitmap, start,
+        next_zero = bdrv_dirty_bitmap_next_zero(s->copy_bitmap, offset,
                                                 cur_bytes);
         if (next_zero >= 0) {
-            assert(next_zero > start); /* start is dirty */
-            assert(next_zero < start + cur_bytes); /* no need to do MIN() */
-            cur_bytes = next_zero - start;
+            assert(next_zero > offset); /* offset is dirty */
+            assert(next_zero < offset + cur_bytes); /* no need to do MIN() */
+            cur_bytes = next_zero - offset;
         }
 
-        ret = block_copy_block_status(s, start, cur_bytes, &status_bytes);
+        ret = block_copy_block_status(s, offset, cur_bytes, &status_bytes);
         if (s->skip_unallocated && !(ret & BDRV_BLOCK_ALLOCATED)) {
-            bdrv_reset_dirty_bitmap(s->copy_bitmap, start, status_bytes);
+            bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, status_bytes);
             progress_set_remaining(s->progress,
                                    bdrv_get_dirty_count(s->copy_bitmap) +
                                    s->in_flight_bytes);
-            trace_block_copy_skip_range(s, start, status_bytes);
-            start += status_bytes;
+            trace_block_copy_skip_range(s, offset, status_bytes);
+            offset += status_bytes;
             bytes -= status_bytes;
             continue;
         }
 
         cur_bytes = MIN(cur_bytes, status_bytes);
 
-        trace_block_copy_process(s, start);
+        trace_block_copy_process(s, offset);
 
-        bdrv_reset_dirty_bitmap(s->copy_bitmap, start, cur_bytes);
+        bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, cur_bytes);
         s->in_flight_bytes += cur_bytes;
 
         co_get_from_shres(s->mem, cur_bytes);
-        ret = block_copy_do_copy(s, start, cur_bytes, ret & BDRV_BLOCK_ZERO,
+        ret = block_copy_do_copy(s, offset, cur_bytes, ret & BDRV_BLOCK_ZERO,
                                  error_is_read);
         co_put_to_shres(s->mem, cur_bytes);
         s->in_flight_bytes -= cur_bytes;
         if (ret < 0) {
-            bdrv_set_dirty_bitmap(s->copy_bitmap, start, cur_bytes);
+            bdrv_set_dirty_bitmap(s->copy_bitmap, offset, cur_bytes);
             break;
         }
 
         progress_work_done(s->progress, cur_bytes);
         s->progress_bytes_callback(cur_bytes, s->progress_opaque);
-        start += cur_bytes;
+        offset += cur_bytes;
         bytes -= cur_bytes;
     }
 
-- 
2.21.0


