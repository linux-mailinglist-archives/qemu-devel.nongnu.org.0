Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977876A0FED
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:57:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhR-0006rD-T5; Thu, 23 Feb 2023 13:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhJ-0006np-Vc
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhH-00032A-AK
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9IinxE0ZJHYLBpHdPljOF/TZJjN/xClaWSlZqHeDK24=;
 b=FfJA967fH0A0IgM9RQFpWJDtCfuDQyJhDx14YPrLnkR3X28Fu3OSCyRZ8F2oUHGjOTiajL
 IrJxRGnVJoiUr0AU5E2FXz41Q3S/W+6BbNBT2BU5hTYcKb2u3qYOEXL/GB//Qw67ZnCzFU
 wFvLXselRFzoUDUI5KYp7R+MkWoKh1c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-g_hTaun4PpuM_Z0niJ2Mrw-1; Thu, 23 Feb 2023 13:51:59 -0500
X-MC-Unique: g_hTaun4PpuM_Z0niJ2Mrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C59F811E6E;
 Thu, 23 Feb 2023 18:51:59 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57B871121314;
 Thu, 23 Feb 2023 18:51:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 08/29] block: Mark bdrv_co_pdiscard() and callers GRAPH_RDLOCK
Date: Thu, 23 Feb 2023 19:51:25 +0100
Message-Id: <20230223185146.306454-9-kwolf@redhat.com>
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

This adds GRAPH_RDLOCK annotations to declare that callers of
bdrv_co_pdiscard() need to hold a reader lock for the graph.

For some places, we know that they will hold the lock, but we don't have
the GRAPH_RDLOCK annotations yet. In this case, add assume_graph_lock()
with a FIXME comment. These places will be removed once everything is
properly annotated.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230203152202.49054-9-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h         |  5 +++--
 include/block/block_int-common.h | 15 +++++++++------
 include/block/block_int-io.h     |  2 +-
 block/blkdebug.c                 |  4 ++--
 block/blklogwrites.c             |  5 ++---
 block/blkreplay.c                |  4 ++--
 block/block-backend.c            |  1 +
 block/copy-before-write.c        |  8 ++++----
 block/copy-on-read.c             |  4 ++--
 block/filter-compress.c          |  4 ++--
 block/io.c                       |  2 ++
 block/mirror.c                   | 14 +++++++++-----
 block/preallocate.c              |  4 ++--
 block/raw-format.c               |  4 ++--
 block/snapshot-access.c          |  4 ++--
 block/throttle.c                 |  4 ++--
 16 files changed, 47 insertions(+), 37 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 7e96506138..627061fd5f 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -103,8 +103,9 @@ bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
 /* Ensure contents are flushed to disk.  */
 int coroutine_fn GRAPH_RDLOCK bdrv_co_flush(BlockDriverState *bs);
 
-int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
-                                  int64_t bytes);
+int coroutine_fn GRAPH_RDLOCK bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
+                                               int64_t bytes);
+
 bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
 int bdrv_block_status(BlockDriverState *bs, int64_t offset,
                       int64_t bytes, int64_t *pnum, int64_t *map,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 51eaabd9d1..c52190abdb 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -479,8 +479,9 @@ struct BlockDriver {
         BdrvRequestFlags flags, BlockCompletionFunc *cb, void *opaque);
     BlockAIOCB * GRAPH_RDLOCK_PTR (*bdrv_aio_flush)(
         BlockDriverState *bs, BlockCompletionFunc *cb, void *opaque);
-    BlockAIOCB *(*bdrv_aio_pdiscard)(BlockDriverState *bs,
-        int64_t offset, int bytes,
+
+    BlockAIOCB * GRAPH_RDLOCK_PTR (*bdrv_aio_pdiscard)(
+        BlockDriverState *bs, int64_t offset, int bytes,
         BlockCompletionFunc *cb, void *opaque);
 
     int coroutine_fn (*bdrv_co_readv)(BlockDriverState *bs,
@@ -543,8 +544,9 @@ struct BlockDriver {
      */
     int coroutine_fn (*bdrv_co_pwrite_zeroes)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, BdrvRequestFlags flags);
-    int coroutine_fn (*bdrv_co_pdiscard)(BlockDriverState *bs,
-        int64_t offset, int64_t bytes);
+
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_pdiscard)(
+        BlockDriverState *bs, int64_t offset, int64_t bytes);
 
     /*
      * Map [offset, offset + nbytes) range onto a child of @bs to copy from,
@@ -632,8 +634,9 @@ struct BlockDriver {
     int coroutine_fn (*bdrv_co_snapshot_block_status)(BlockDriverState *bs,
         bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
         int64_t *map, BlockDriverState **file);
-    int coroutine_fn (*bdrv_co_pdiscard_snapshot)(BlockDriverState *bs,
-        int64_t offset, int64_t bytes);
+
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_pdiscard_snapshot)(
+        BlockDriverState *bs, int64_t offset, int64_t bytes);
 
     /*
      * Invalidate any cached meta-data.
diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index 4430bf4c4a..4bb6ccaa34 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -40,7 +40,7 @@ int coroutine_fn bdrv_co_preadv_snapshot(BdrvChild *child,
 int coroutine_fn bdrv_co_snapshot_block_status(BlockDriverState *bs,
     bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
     int64_t *map, BlockDriverState **file);
-int coroutine_fn bdrv_co_pdiscard_snapshot(BlockDriverState *bs,
+int coroutine_fn GRAPH_RDLOCK bdrv_co_pdiscard_snapshot(BlockDriverState *bs,
     int64_t offset, int64_t bytes);
 
 
diff --git a/block/blkdebug.c b/block/blkdebug.c
index 5ba3766a2c..8506004707 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -712,8 +712,8 @@ static int coroutine_fn blkdebug_co_pwrite_zeroes(BlockDriverState *bs,
     return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
 }
 
-static int coroutine_fn blkdebug_co_pdiscard(BlockDriverState *bs,
-                                             int64_t offset, int64_t bytes)
+static int coroutine_fn GRAPH_RDLOCK
+blkdebug_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
     uint32_t align = bs->bl.pdiscard_alignment;
     int err;
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index 5ec1d23f29..3033f5035b 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -450,7 +450,7 @@ blk_log_writes_co_do_file_flush(BlkLogWritesFileReq *fr)
     return bdrv_co_flush(fr->bs->file->bs);
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 blk_log_writes_co_do_file_pdiscard(BlkLogWritesFileReq *fr)
 {
     return bdrv_co_pdiscard(fr->bs->file, fr->offset, fr->bytes);
@@ -483,10 +483,9 @@ blk_log_writes_co_flush_to_disk(BlockDriverState *bs)
                                  LOG_FLUSH_FLAG, false);
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 blk_log_writes_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
-    assume_graph_lock(); /* FIXME */
     return blk_log_writes_co_log(bs, offset, bytes, NULL, 0,
                                  blk_log_writes_co_do_file_pdiscard,
                                  LOG_DISCARD_FLAG, false);
diff --git a/block/blkreplay.c b/block/blkreplay.c
index ce13fa5ba5..c18d3a755d 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -102,8 +102,8 @@ static int coroutine_fn blkreplay_co_pwrite_zeroes(BlockDriverState *bs,
     return ret;
 }
 
-static int coroutine_fn blkreplay_co_pdiscard(BlockDriverState *bs,
-                                              int64_t offset, int64_t bytes)
+static int coroutine_fn GRAPH_RDLOCK
+blkreplay_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
     uint64_t reqid = blkreplay_next_id();
     int ret = bdrv_co_pdiscard(bs->file, offset, bytes);
diff --git a/block/block-backend.c b/block/block-backend.c
index 3e58b95b8a..b4d2387947 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1719,6 +1719,7 @@ blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
     IO_CODE();
 
     blk_wait_while_drained(blk);
+    GRAPH_RDLOCK_GUARD();
 
     ret = blk_check_byte_request(blk, offset, bytes);
     if (ret < 0) {
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 4ba72c6309..42b46e746a 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -149,8 +149,8 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
     return 0;
 }
 
-static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
-                                        int64_t offset, int64_t bytes)
+static int coroutine_fn GRAPH_RDLOCK
+cbw_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
     int ret = cbw_do_copy_before_write(bs, offset, bytes, 0);
     if (ret < 0) {
@@ -322,8 +322,8 @@ cbw_co_snapshot_block_status(BlockDriverState *bs,
     return ret;
 }
 
-static int coroutine_fn cbw_co_pdiscard_snapshot(BlockDriverState *bs,
-                                                 int64_t offset, int64_t bytes)
+static int coroutine_fn GRAPH_RDLOCK
+cbw_co_pdiscard_snapshot(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 3280eb2feb..b564f1ca3f 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -200,8 +200,8 @@ static int coroutine_fn cor_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 
-static int coroutine_fn cor_co_pdiscard(BlockDriverState *bs,
-                                        int64_t offset, int64_t bytes)
+static int coroutine_fn GRAPH_RDLOCK
+cor_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 2e2a65966c..083aaef53c 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -92,8 +92,8 @@ static int coroutine_fn compress_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 
-static int coroutine_fn compress_co_pdiscard(BlockDriverState *bs,
-                                             int64_t offset, int64_t bytes)
+static int coroutine_fn GRAPH_RDLOCK
+compress_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
diff --git a/block/io.c b/block/io.c
index cfc93dc912..e97adb5ba4 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2971,6 +2971,7 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
     int head, tail, align;
     BlockDriverState *bs = child->bs;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     if (!bs || !bs->drv || !bdrv_co_is_inserted(bs)) {
         return -ENOMEDIUM;
@@ -3577,6 +3578,7 @@ bdrv_co_pdiscard_snapshot(BlockDriverState *bs, int64_t offset, int64_t bytes)
     BlockDriver *drv = bs->drv;
     int ret;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     if (!drv) {
         return -ENOMEDIUM;
diff --git a/block/mirror.c b/block/mirror.c
index d1d79f2319..b67e8b14f8 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1443,9 +1443,10 @@ static int coroutine_fn bdrv_mirror_top_preadv(BlockDriverState *bs,
     return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
 }
 
-static int coroutine_fn bdrv_mirror_top_do_write(BlockDriverState *bs,
-    MirrorMethod method, uint64_t offset, uint64_t bytes, QEMUIOVector *qiov,
-    int flags)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_mirror_top_do_write(BlockDriverState *bs, MirrorMethod method,
+                         uint64_t offset, uint64_t bytes, QEMUIOVector *qiov,
+                         int flags)
 {
     MirrorOp *op = NULL;
     MirrorBDSOpaque *s = bs->opaque;
@@ -1503,6 +1504,8 @@ static int coroutine_fn bdrv_mirror_top_pwritev(BlockDriverState *bs,
     int ret = 0;
     bool copy_to_target = false;
 
+    assume_graph_lock(); /* FIXME */
+
     if (s->job) {
         copy_to_target = s->job->ret >= 0 &&
                          !job_is_cancelled(&s->job->common.job) &&
@@ -1547,12 +1550,13 @@ static int coroutine_fn GRAPH_RDLOCK bdrv_mirror_top_flush(BlockDriverState *bs)
 static int coroutine_fn bdrv_mirror_top_pwrite_zeroes(BlockDriverState *bs,
     int64_t offset, int64_t bytes, BdrvRequestFlags flags)
 {
+    assume_graph_lock(); /* FIXME */
     return bdrv_mirror_top_do_write(bs, MIRROR_METHOD_ZERO, offset, bytes, NULL,
                                     flags);
 }
 
-static int coroutine_fn bdrv_mirror_top_pdiscard(BlockDriverState *bs,
-    int64_t offset, int64_t bytes)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_mirror_top_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
     return bdrv_mirror_top_do_write(bs, MIRROR_METHOD_DISCARD, offset, bytes,
                                     NULL, 0);
diff --git a/block/preallocate.c b/block/preallocate.c
index 483b596280..c2c2dc8a8c 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -234,8 +234,8 @@ static coroutine_fn int preallocate_co_preadv_part(
                                flags);
 }
 
-static int coroutine_fn preallocate_co_pdiscard(BlockDriverState *bs,
-                                               int64_t offset, int64_t bytes)
+static int coroutine_fn GRAPH_RDLOCK
+preallocate_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
diff --git a/block/raw-format.c b/block/raw-format.c
index 202acb1232..7f1036ebed 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -305,8 +305,8 @@ static int coroutine_fn raw_co_pwrite_zeroes(BlockDriverState *bs,
     return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
 }
 
-static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
-                                        int64_t offset, int64_t bytes)
+static int coroutine_fn GRAPH_RDLOCK
+raw_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
     int ret;
 
diff --git a/block/snapshot-access.c b/block/snapshot-access.c
index 0a30ec6cd9..009cc4aea0 100644
--- a/block/snapshot-access.c
+++ b/block/snapshot-access.c
@@ -49,8 +49,8 @@ snapshot_access_co_block_status(BlockDriverState *bs,
                                          bytes, pnum, map, file);
 }
 
-static int coroutine_fn snapshot_access_co_pdiscard(BlockDriverState *bs,
-                                             int64_t offset, int64_t bytes)
+static int coroutine_fn GRAPH_RDLOCK
+snapshot_access_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
     return bdrv_co_pdiscard_snapshot(bs->file->bs, offset, bytes);
 }
diff --git a/block/throttle.c b/block/throttle.c
index a0db840927..b07d853c0a 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -144,8 +144,8 @@ static int coroutine_fn throttle_co_pwrite_zeroes(BlockDriverState *bs,
     return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
 }
 
-static int coroutine_fn throttle_co_pdiscard(BlockDriverState *bs,
-                                             int64_t offset, int64_t bytes)
+static int coroutine_fn GRAPH_RDLOCK
+throttle_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
     ThrottleGroupMember *tgm = bs->opaque;
     throttle_group_co_io_limits_intercept(tgm, bytes, true);
-- 
2.39.2


