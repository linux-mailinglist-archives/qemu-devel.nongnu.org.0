Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D331A6A0FDD
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:55:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhQ-0006r7-C1; Thu, 23 Feb 2023 13:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhM-0006p9-Ea
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhI-000364-HA
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gZWadILoWUksiS0KjCZg8zbq9RgX0lVki/lMxezM3Gg=;
 b=FWJGgLIcLjnX12HXyBimAAdRLJUBqaCp39AFRHSMSkt1DG3ndNpmgtl4GZVp7RiOqHVmBX
 vbllogUQ9KBYZL18q6PKL2lzVT0nxQPSDwgFAm26rWrjHEySrHm/fSDokNaLw75+fcscMX
 yVQbM/EsD4IJ8RxeoSmshfJ1KE0/Zqs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-7iTi1N8-M--Kiwho4n0X2w-1; Thu, 23 Feb 2023 13:52:00 -0500
X-MC-Unique: 7iTi1N8-M--Kiwho4n0X2w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9A7B86C165;
 Thu, 23 Feb 2023 18:51:59 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42B231121314;
 Thu, 23 Feb 2023 18:51:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 09/29] block: Mark bdrv_co_pwrite_zeroes() and callers
 GRAPH_RDLOCK
Date: Thu, 23 Feb 2023 19:51:26 +0100
Message-Id: <20230223185146.306454-10-kwolf@redhat.com>
In-Reply-To: <20230223185146.306454-1-kwolf@redhat.com>
References: <20230223185146.306454-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This adds GRAPH_RDLOCK annotations to declare that callers of
bdrv_co_pwrite_zeroes() need to hold a reader lock for the graph.

For some places, we know that they will hold the lock, but we don't have
the GRAPH_RDLOCK annotations yet. In this case, add assume_graph_lock()
with a FIXME comment. These places will be removed once everything is
properly annotated.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230203152202.49054-10-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2.h                    |  6 ++++--
 include/block/block-io.h         |  9 +++++----
 include/block/block_int-common.h |  5 +++--
 block/blkdebug.c                 |  6 +++---
 block/blklogwrites.c             |  5 ++---
 block/blkreplay.c                |  5 +++--
 block/block-copy.c               | 13 +++++++------
 block/copy-before-write.c        |  5 +++--
 block/copy-on-read.c             |  6 +++---
 block/filter-compress.c          |  6 +++---
 block/io.c                       | 12 +++++++++---
 block/mirror.c                   |  6 +++---
 block/preallocate.c              | 11 +++++++----
 block/qcow2.c                    | 30 ++++++++++++++++++------------
 block/qed.c                      |  9 +++------
 block/quorum.c                   | 15 ++++++++++-----
 block/raw-format.c               |  6 +++---
 block/throttle.c                 |  6 +++---
 18 files changed, 92 insertions(+), 69 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 7a02699bfa..82cd1664cf 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -927,8 +927,10 @@ void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m);
 int qcow2_cluster_discard(BlockDriverState *bs, uint64_t offset,
                           uint64_t bytes, enum qcow2_discard_type type,
                           bool full_discard);
-int coroutine_fn qcow2_subcluster_zeroize(BlockDriverState *bs, uint64_t offset,
-                                          uint64_t bytes, int flags);
+
+int coroutine_fn GRAPH_RDLOCK
+qcow2_subcluster_zeroize(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
+                         int flags);
 
 int qcow2_expand_zero_clusters(BlockDriverState *bs,
                                BlockDriverAmendStatusCB *status_cb,
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 627061fd5f..ec26f07d60 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -69,8 +69,9 @@ int coroutine_fn bdrv_co_pwrite_sync(BdrvChild *child, int64_t offset,
  * function is not suitable for zeroing the entire image in a single request
  * because it may allocate memory for the entire region.
  */
-int coroutine_fn bdrv_co_pwrite_zeroes(BdrvChild *child, int64_t offset,
-                                       int64_t bytes, BdrvRequestFlags flags);
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_pwrite_zeroes(BdrvChild *child, int64_t offset, int64_t bytes,
+                      BdrvRequestFlags flags);
 
 int coroutine_fn GRAPH_RDLOCK
 bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
@@ -133,8 +134,8 @@ int bdrv_is_allocated_above(BlockDriverState *top, BlockDriverState *base,
                             bool include_base, int64_t offset, int64_t bytes,
                             int64_t *pnum);
 
-int coroutine_fn bdrv_co_is_zero_fast(BlockDriverState *bs, int64_t offset,
-                                      int64_t bytes);
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_is_zero_fast(BlockDriverState *bs, int64_t offset, int64_t bytes);
 
 int bdrv_apply_auto_read_only(BlockDriverState *bs, const char *errmsg,
                               Error **errp);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index c52190abdb..21b4cb1101 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -542,8 +542,9 @@ struct BlockDriver {
      * function pointer may be NULL or return -ENOSUP and .bdrv_co_writev()
      * will be called instead.
      */
-    int coroutine_fn (*bdrv_co_pwrite_zeroes)(BlockDriverState *bs,
-        int64_t offset, int64_t bytes, BdrvRequestFlags flags);
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_pwrite_zeroes)(
+        BlockDriverState *bs, int64_t offset, int64_t bytes,
+        BdrvRequestFlags flags);
 
     int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_pdiscard)(
         BlockDriverState *bs, int64_t offset, int64_t bytes);
diff --git a/block/blkdebug.c b/block/blkdebug.c
index 8506004707..eed03bfe7e 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -679,9 +679,9 @@ static int GRAPH_RDLOCK coroutine_fn blkdebug_co_flush(BlockDriverState *bs)
     return bdrv_co_flush(bs->file->bs);
 }
 
-static int coroutine_fn blkdebug_co_pwrite_zeroes(BlockDriverState *bs,
-                                                  int64_t offset, int64_t bytes,
-                                                  BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+blkdebug_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                          BdrvRequestFlags flags)
 {
     uint32_t align = MAX(bs->bl.request_alignment,
                          bs->bl.pwrite_zeroes_alignment);
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index 3033f5035b..bdaa2a57a2 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -437,7 +437,7 @@ blk_log_writes_co_do_file_pwritev(BlkLogWritesFileReq *fr)
                            fr->qiov, fr->file_flags);
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 blk_log_writes_co_do_file_pwrite_zeroes(BlkLogWritesFileReq *fr)
 {
     return bdrv_co_pwrite_zeroes(fr->bs->file, fr->offset, fr->bytes,
@@ -465,11 +465,10 @@ blk_log_writes_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
                                  blk_log_writes_co_do_file_pwritev, 0, false);
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 blk_log_writes_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
                                 int64_t bytes, BdrvRequestFlags flags)
 {
-    assume_graph_lock(); /* FIXME */
     return blk_log_writes_co_log(bs, offset, bytes, NULL, flags,
                                  blk_log_writes_co_do_file_pwrite_zeroes, 0,
                                  true);
diff --git a/block/blkreplay.c b/block/blkreplay.c
index c18d3a755d..2703a0c8c6 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -91,8 +91,9 @@ static int coroutine_fn blkreplay_co_pwritev(BlockDriverState *bs,
     return ret;
 }
 
-static int coroutine_fn blkreplay_co_pwrite_zeroes(BlockDriverState *bs,
-    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+blkreplay_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                           BdrvRequestFlags flags)
 {
     uint64_t reqid = blkreplay_next_id();
     int ret = bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
diff --git a/block/block-copy.c b/block/block-copy.c
index d299fac7cc..e13d7bc6b6 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -469,10 +469,9 @@ static coroutine_fn int block_copy_task_run(AioTaskPool *pool,
  * value of @method should be used for subsequent tasks.
  * Returns 0 on success.
  */
-static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
-                                           int64_t offset, int64_t bytes,
-                                           BlockCopyMethod *method,
-                                           bool *error_is_read)
+static int coroutine_fn GRAPH_RDLOCK
+block_copy_do_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
+                   BlockCopyMethod *method, bool *error_is_read)
 {
     int ret;
     int64_t nbytes = MIN(offset + bytes, s->len) - offset;
@@ -558,8 +557,10 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
     BlockCopyMethod method = t->method;
     int ret;
 
-    ret = block_copy_do_copy(s, t->req.offset, t->req.bytes, &method,
-                             &error_is_read);
+    WITH_GRAPH_RDLOCK_GUARD() {
+        ret = block_copy_do_copy(s, t->req.offset, t->req.bytes, &method,
+                                 &error_is_read);
+    }
 
     WITH_QEMU_LOCK_GUARD(&s->lock) {
         if (s->method == t->method) {
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 42b46e746a..61854beae2 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -160,8 +160,9 @@ cbw_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
 
-static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
-        int64_t offset, int64_t bytes, BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+cbw_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                     BdrvRequestFlags flags)
 {
     int ret = cbw_do_copy_before_write(bs, offset, bytes, flags);
     if (ret < 0) {
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index b564f1ca3f..ebf6864dd3 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -192,9 +192,9 @@ static int coroutine_fn cor_co_pwritev_part(BlockDriverState *bs,
 }
 
 
-static int coroutine_fn cor_co_pwrite_zeroes(BlockDriverState *bs,
-                                             int64_t offset, int64_t bytes,
-                                             BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+cor_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                     BdrvRequestFlags flags)
 {
     return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
 }
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 083aaef53c..7a632f47fe 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -84,9 +84,9 @@ static int coroutine_fn compress_co_pwritev_part(BlockDriverState *bs,
 }
 
 
-static int coroutine_fn compress_co_pwrite_zeroes(BlockDriverState *bs,
-                                                  int64_t offset, int64_t bytes,
-                                                  BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+compress_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                          BdrvRequestFlags flags)
 {
     return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
 }
diff --git a/block/io.c b/block/io.c
index e97adb5ba4..00843362e9 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1172,6 +1172,8 @@ static int coroutine_fn bdrv_co_do_copy_on_readv(BdrvChild *child,
     int64_t progress = 0;
     bool skip_write;
 
+    assume_graph_lock(); /* FIXME */
+
     bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
 
     if (!drv) {
@@ -1692,6 +1694,7 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
                         bs->bl.request_alignment);
     int max_transfer = MIN_NON_ZERO(bs->bl.max_transfer, MAX_BOUNCE_BUFFER);
 
+    assert_bdrv_graph_readable();
     bdrv_check_request(offset, bytes, &error_abort);
 
     if (!drv) {
@@ -1907,6 +1910,8 @@ static int coroutine_fn bdrv_aligned_pwritev(BdrvChild *child,
     int64_t bytes_remaining = bytes;
     int max_transfer;
 
+    assume_graph_lock(); /* FIXME */
+
     bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
 
     if (!drv) {
@@ -2159,6 +2164,7 @@ int coroutine_fn bdrv_co_pwrite_zeroes(BdrvChild *child, int64_t offset,
 {
     IO_CODE();
     trace_bdrv_co_pwrite_zeroes(child->bs, offset, bytes, flags);
+    assert_bdrv_graph_readable();
 
     if (!(child->bs->open_flags & BDRV_O_UNMAP)) {
         flags &= ~BDRV_REQ_MAY_UNMAP;
@@ -2602,8 +2608,6 @@ int coroutine_fn bdrv_co_is_zero_fast(BlockDriverState *bs, int64_t offset,
     int64_t pnum = bytes;
     IO_CODE();
 
-    assume_graph_lock(); /* FIXME */
-
     if (!bytes) {
         return 1;
     }
@@ -3241,7 +3245,7 @@ void bdrv_unregister_buf(BlockDriverState *bs, void *host, size_t size)
     }
 }
 
-static int coroutine_fn bdrv_co_copy_range_internal(
+static int coroutine_fn GRAPH_RDLOCK bdrv_co_copy_range_internal(
         BdrvChild *src, int64_t src_offset, BdrvChild *dst,
         int64_t dst_offset, int64_t bytes,
         BdrvRequestFlags read_flags, BdrvRequestFlags write_flags,
@@ -3330,6 +3334,7 @@ int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, int64_t src_offset,
                                          BdrvRequestFlags write_flags)
 {
     IO_CODE();
+    assume_graph_lock(); /* FIXME */
     trace_bdrv_co_copy_range_from(src, src_offset, dst, dst_offset, bytes,
                                   read_flags, write_flags);
     return bdrv_co_copy_range_internal(src, src_offset, dst, dst_offset,
@@ -3347,6 +3352,7 @@ int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
                                        BdrvRequestFlags write_flags)
 {
     IO_CODE();
+    assume_graph_lock(); /* FIXME */
     trace_bdrv_co_copy_range_to(src, src_offset, dst, dst_offset, bytes,
                                 read_flags, write_flags);
     return bdrv_co_copy_range_internal(src, src_offset, dst, dst_offset,
diff --git a/block/mirror.c b/block/mirror.c
index b67e8b14f8..a6f4ec6282 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1547,10 +1547,10 @@ static int coroutine_fn GRAPH_RDLOCK bdrv_mirror_top_flush(BlockDriverState *bs)
     return bdrv_co_flush(bs->backing->bs);
 }
 
-static int coroutine_fn bdrv_mirror_top_pwrite_zeroes(BlockDriverState *bs,
-    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_mirror_top_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
+                              int64_t bytes, BdrvRequestFlags flags)
 {
-    assume_graph_lock(); /* FIXME */
     return bdrv_mirror_top_do_write(bs, MIRROR_METHOD_ZERO, offset, bytes, NULL,
                                     flags);
 }
diff --git a/block/preallocate.c b/block/preallocate.c
index c2c2dc8a8c..91d73c81c6 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -269,8 +269,9 @@ static bool has_prealloc_perms(BlockDriverState *bs)
  * want_merge_zero is used to merge write-zero request with preallocation in
  * one bdrv_co_pwrite_zeroes() call.
  */
-static bool coroutine_fn handle_write(BlockDriverState *bs, int64_t offset,
-                                      int64_t bytes, bool want_merge_zero)
+static bool coroutine_fn GRAPH_RDLOCK
+handle_write(BlockDriverState *bs, int64_t offset, int64_t bytes,
+             bool want_merge_zero)
 {
     BDRVPreallocateState *s = bs->opaque;
     int64_t end = offset + bytes;
@@ -345,8 +346,9 @@ static bool coroutine_fn handle_write(BlockDriverState *bs, int64_t offset,
     return want_merge_zero;
 }
 
-static int coroutine_fn preallocate_co_pwrite_zeroes(BlockDriverState *bs,
-        int64_t offset, int64_t bytes, BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+preallocate_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
+                             int64_t bytes, BdrvRequestFlags flags)
 {
     bool want_merge_zero =
         !(flags & ~(BDRV_REQ_ZERO_WRITE | BDRV_REQ_NO_FALLBACK));
@@ -364,6 +366,7 @@ static coroutine_fn int preallocate_co_pwritev_part(BlockDriverState *bs,
                                                     size_t qiov_offset,
                                                     BdrvRequestFlags flags)
 {
+    assume_graph_lock(); /* FIXME */
     handle_write(bs, offset, bytes, false);
 
     return bdrv_co_pwritev_part(bs->file, offset, bytes, qiov, qiov_offset,
diff --git a/block/qcow2.c b/block/qcow2.c
index e06ea7b5ff..89c3edbd61 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2450,7 +2450,8 @@ static bool merge_cow(uint64_t offset, unsigned bytes,
  * Return 1 if the COW regions read as zeroes, 0 if not, < 0 on error.
  * Note that returning 0 does not guarantee non-zero data.
  */
-static int coroutine_fn is_zero_cow(BlockDriverState *bs, QCowL2Meta *m)
+static int coroutine_fn GRAPH_RDLOCK
+is_zero_cow(BlockDriverState *bs, QCowL2Meta *m)
 {
     /*
      * This check is designed for optimization shortcut so it must be
@@ -2468,8 +2469,8 @@ static int coroutine_fn is_zero_cow(BlockDriverState *bs, QCowL2Meta *m)
                                 m->cow_end.nb_bytes);
 }
 
-static int coroutine_fn handle_alloc_space(BlockDriverState *bs,
-                                           QCowL2Meta *l2meta)
+static int coroutine_fn GRAPH_RDLOCK
+handle_alloc_space(BlockDriverState *bs, QCowL2Meta *l2meta)
 {
     BDRVQcow2State *s = bs->opaque;
     QCowL2Meta *m;
@@ -2532,12 +2533,10 @@ static int coroutine_fn handle_alloc_space(BlockDriverState *bs,
  * l2meta  - if not NULL, qcow2_co_pwritev_task() will consume it. Caller must
  *           not use it somehow after qcow2_co_pwritev_task() call
  */
-static coroutine_fn int qcow2_co_pwritev_task(BlockDriverState *bs,
-                                              uint64_t host_offset,
-                                              uint64_t offset, uint64_t bytes,
-                                              QEMUIOVector *qiov,
-                                              uint64_t qiov_offset,
-                                              QCowL2Meta *l2meta)
+static coroutine_fn GRAPH_RDLOCK
+int qcow2_co_pwritev_task(BlockDriverState *bs, uint64_t host_offset,
+                          uint64_t offset, uint64_t bytes, QEMUIOVector *qiov,
+                          uint64_t qiov_offset, QCowL2Meta *l2meta)
 {
     int ret;
     BDRVQcow2State *s = bs->opaque;
@@ -2603,7 +2602,11 @@ out_locked:
     return ret;
 }
 
-static coroutine_fn int qcow2_co_pwritev_task_entry(AioTask *task)
+/*
+ * This function can count as GRAPH_RDLOCK because qcow2_co_pwritev_part() holds
+ * the graph lock and keeps it until this coroutine has terminated.
+ */
+static coroutine_fn GRAPH_RDLOCK int qcow2_co_pwritev_task_entry(AioTask *task)
 {
     Qcow2AioTask *t = container_of(task, Qcow2AioTask, task);
 
@@ -2626,6 +2629,8 @@ static coroutine_fn int qcow2_co_pwritev_part(
     QCowL2Meta *l2meta = NULL;
     AioTaskPool *aio = NULL;
 
+    assume_graph_lock(); /* FIXME */
+
     trace_qcow2_writev_start_req(qemu_coroutine_self(), offset, bytes);
 
     while (bytes != 0 && aio_task_pool_status(aio) == 0) {
@@ -3974,8 +3979,9 @@ static bool is_zero(BlockDriverState *bs, int64_t offset, int64_t bytes)
     return res >= 0 && (res & BDRV_BLOCK_ZERO) && bytes == 0;
 }
 
-static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
-    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+qcow2_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                       BdrvRequestFlags flags)
 {
     int ret;
     BDRVQcow2State *s = bs->opaque;
diff --git a/block/qed.c b/block/qed.c
index cf794a1add..bdcb6de6df 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -1420,15 +1420,12 @@ static int coroutine_fn bdrv_qed_co_writev(BlockDriverState *bs,
     return qed_co_request(bs, sector_num, qiov, nb_sectors, QED_AIOCB_WRITE);
 }
 
-static int coroutine_fn bdrv_qed_co_pwrite_zeroes(BlockDriverState *bs,
-                                                  int64_t offset,
-                                                  int64_t bytes,
-                                                  BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_qed_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                          BdrvRequestFlags flags)
 {
     BDRVQEDState *s = bs->opaque;
 
-    assume_graph_lock(); /* FIXME */
-
     /*
      * Zero writes start without an I/O buffer.  If a buffer becomes necessary
      * then it will be allocated during request processing.
diff --git a/block/quorum.c b/block/quorum.c
index 3fe3791ab2..02ae0d8343 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -683,7 +683,11 @@ static int coroutine_fn quorum_co_preadv(BlockDriverState *bs,
     return ret;
 }
 
-static void coroutine_fn write_quorum_entry(void *opaque)
+/*
+ * This function can count as GRAPH_RDLOCK because quorum_co_pwritev() holds the
+ * graph lock and keeps it until this coroutine has terminated.
+ */
+static void coroutine_fn GRAPH_RDLOCK write_quorum_entry(void *opaque)
 {
     QuorumCo *co = opaque;
     QuorumAIOCB *acb = co->acb;
@@ -722,6 +726,8 @@ static int coroutine_fn quorum_co_pwritev(BlockDriverState *bs, int64_t offset,
     QuorumAIOCB *acb = quorum_aio_get(bs, qiov, offset, bytes, flags);
     int i, ret;
 
+    assume_graph_lock(); /* FIXME */
+
     for (i = 0; i < s->num_children; i++) {
         Coroutine *co;
         QuorumCo data = {
@@ -745,10 +751,9 @@ static int coroutine_fn quorum_co_pwritev(BlockDriverState *bs, int64_t offset,
     return ret;
 }
 
-static int coroutine_fn quorum_co_pwrite_zeroes(BlockDriverState *bs,
-                                                int64_t offset, int64_t bytes,
-                                                BdrvRequestFlags flags)
-
+static int coroutine_fn GRAPH_RDLOCK
+quorum_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                        BdrvRequestFlags flags)
 {
     return quorum_co_pwritev(bs, offset, bytes, NULL,
                              flags | BDRV_REQ_ZERO_WRITE);
diff --git a/block/raw-format.c b/block/raw-format.c
index 7f1036ebed..007d7f6e42 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -292,9 +292,9 @@ static int coroutine_fn raw_co_block_status(BlockDriverState *bs,
     return BDRV_BLOCK_RAW | BDRV_BLOCK_OFFSET_VALID;
 }
 
-static int coroutine_fn raw_co_pwrite_zeroes(BlockDriverState *bs,
-                                             int64_t offset, int64_t bytes,
-                                             BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+raw_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                     BdrvRequestFlags flags)
 {
     int ret;
 
diff --git a/block/throttle.c b/block/throttle.c
index b07d853c0a..3db4fa3c40 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -134,9 +134,9 @@ static int coroutine_fn throttle_co_pwritev(BlockDriverState *bs,
     return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
 }
 
-static int coroutine_fn throttle_co_pwrite_zeroes(BlockDriverState *bs,
-                                                  int64_t offset, int64_t bytes,
-                                                  BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+throttle_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                          BdrvRequestFlags flags)
 {
     ThrottleGroupMember *tgm = bs->opaque;
     throttle_group_co_io_limits_intercept(tgm, bytes, true);
-- 
2.39.2


