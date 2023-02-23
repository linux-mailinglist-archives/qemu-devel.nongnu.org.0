Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4F06A0FEA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:56:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhX-0006vL-4o; Thu, 23 Feb 2023 13:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhM-0006pA-Ib
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhJ-00038B-4J
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R5Q/VvFwkATjpQ4YPFTOVd38AhVyK7rV+eBNuMfX2SM=;
 b=bdG1s25xZvvoIS8SeWZzOGnr2fc2QVMYYfmLJpo861iQV3ddjgPpVlFE6ZEIsMffw/0VqQ
 JveXx+3FnI/R4xCANKfSIwiC7twMUsCSJJY5Pn+uEo8BTnwRMeKfWOqKaIk+U6aQ3gL1NK
 ovrc1dlVDKqA/BTlG7aTQRUb3srSSfw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-Pd6vDK5YOYGvDDX2tVA6hg-1; Thu, 23 Feb 2023 13:52:01 -0500
X-MC-Unique: Pd6vDK5YOYGvDDX2tVA6hg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E12F4857A88;
 Thu, 23 Feb 2023 18:52:00 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3207D1121315;
 Thu, 23 Feb 2023 18:52:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 10/29] block: Mark read/write in block/io.c GRAPH_RDLOCK
Date: Thu, 23 Feb 2023 19:51:27 +0100
Message-Id: <20230223185146.306454-11-kwolf@redhat.com>
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
bdrv_driver_*() need to hold a reader lock for the graph. It doesn't add
the annotation to public functions yet.

For some places, we know that they will hold the lock, but we don't have
the GRAPH_RDLOCK annotations yet. In this case, add assume_graph_lock()
with a FIXME comment. These places will be removed once everything is
properly annotated.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230203152202.49054-11-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2.h                    |  5 ++-
 include/block/block_int-common.h | 40 ++++++++++---------
 block/io.c                       | 66 +++++++++++++++-----------------
 block/parallels.c                |  8 ++--
 block/qcow.c                     | 20 ++++------
 block/qcow2-cluster.c            | 10 ++---
 block/qcow2.c                    | 37 ++++++++++--------
 block/qed.c                      | 14 +++----
 block/quorum.c                   |  8 ++--
 block/vmdk.c                     |  4 +-
 10 files changed, 101 insertions(+), 111 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 82cd1664cf..46dca53e45 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -921,8 +921,9 @@ int coroutine_fn qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
 void qcow2_parse_compressed_l2_entry(BlockDriverState *bs, uint64_t l2_entry,
                                      uint64_t *coffset, int *csize);
 
-int coroutine_fn qcow2_alloc_cluster_link_l2(BlockDriverState *bs,
-                                             QCowL2Meta *m);
+int coroutine_fn GRAPH_RDLOCK
+qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m);
+
 void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m);
 int qcow2_cluster_discard(BlockDriverState *bs, uint64_t offset,
                           uint64_t bytes, enum qcow2_discard_type type,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 21b4cb1101..192841f040 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -471,12 +471,14 @@ struct BlockDriver {
                                       Error **errp);
 
     /* aio */
-    BlockAIOCB *(*bdrv_aio_preadv)(BlockDriverState *bs,
+    BlockAIOCB * GRAPH_RDLOCK_PTR (*bdrv_aio_preadv)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, QEMUIOVector *qiov,
         BdrvRequestFlags flags, BlockCompletionFunc *cb, void *opaque);
-    BlockAIOCB *(*bdrv_aio_pwritev)(BlockDriverState *bs,
+
+    BlockAIOCB * GRAPH_RDLOCK_PTR (*bdrv_aio_pwritev)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, QEMUIOVector *qiov,
         BdrvRequestFlags flags, BlockCompletionFunc *cb, void *opaque);
+
     BlockAIOCB * GRAPH_RDLOCK_PTR (*bdrv_aio_flush)(
         BlockDriverState *bs, BlockCompletionFunc *cb, void *opaque);
 
@@ -484,7 +486,7 @@ struct BlockDriver {
         BlockDriverState *bs, int64_t offset, int bytes,
         BlockCompletionFunc *cb, void *opaque);
 
-    int coroutine_fn (*bdrv_co_readv)(BlockDriverState *bs,
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_readv)(BlockDriverState *bs,
         int64_t sector_num, int nb_sectors, QEMUIOVector *qiov);
 
     /**
@@ -502,16 +504,16 @@ struct BlockDriver {
      *
      * The buffer in @qiov may point directly to guest memory.
      */
-    int coroutine_fn (*bdrv_co_preadv)(BlockDriverState *bs,
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_preadv)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, QEMUIOVector *qiov,
         BdrvRequestFlags flags);
 
-    int coroutine_fn (*bdrv_co_preadv_part)(BlockDriverState *bs,
-        int64_t offset, int64_t bytes,
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_preadv_part)(
+        BlockDriverState *bs, int64_t offset, int64_t bytes,
         QEMUIOVector *qiov, size_t qiov_offset,
         BdrvRequestFlags flags);
 
-    int coroutine_fn (*bdrv_co_writev)(BlockDriverState *bs,
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_writev)(BlockDriverState *bs,
         int64_t sector_num, int nb_sectors, QEMUIOVector *qiov,
         int flags);
     /**
@@ -529,12 +531,12 @@ struct BlockDriver {
      *
      * The buffer in @qiov may point directly to guest memory.
      */
-    int coroutine_fn (*bdrv_co_pwritev)(BlockDriverState *bs,
-        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
-        BdrvRequestFlags flags);
-    int coroutine_fn (*bdrv_co_pwritev_part)(BlockDriverState *bs,
-        int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset,
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_pwritev)(
+        BlockDriverState *bs, int64_t offset, int64_t bytes, QEMUIOVector *qiov,
         BdrvRequestFlags flags);
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_pwritev_part)(
+        BlockDriverState *bs, int64_t offset, int64_t bytes, QEMUIOVector *qiov,
+        size_t qiov_offset, BdrvRequestFlags flags);
 
     /*
      * Efficiently zero a region of the disk image.  Typically an image format
@@ -695,11 +697,13 @@ struct BlockDriver {
     BlockMeasureInfo *(*bdrv_measure)(QemuOpts *opts, BlockDriverState *in_bs,
                                       Error **errp);
 
-    int coroutine_fn (*bdrv_co_pwritev_compressed)(BlockDriverState *bs,
-        int64_t offset, int64_t bytes, QEMUIOVector *qiov);
-    int coroutine_fn (*bdrv_co_pwritev_compressed_part)(BlockDriverState *bs,
-        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
-        size_t qiov_offset);
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_pwritev_compressed)(
+        BlockDriverState *bs, int64_t offset, int64_t bytes,
+        QEMUIOVector *qiov);
+
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_pwritev_compressed_part)(
+        BlockDriverState *bs, int64_t offset, int64_t bytes,
+        QEMUIOVector *qiov, size_t qiov_offset);
 
     int coroutine_fn (*bdrv_co_get_info)(BlockDriverState *bs,
                                          BlockDriverInfo *bdi);
@@ -764,7 +768,7 @@ struct BlockDriver {
         BlockDriverState *bs, const char *name, Error **errp);
 };
 
-static inline bool block_driver_can_compress(BlockDriver *drv)
+static inline bool TSA_NO_TSA block_driver_can_compress(BlockDriver *drv)
 {
     return drv->bdrv_co_pwritev_compressed ||
            drv->bdrv_co_pwritev_compressed_part;
diff --git a/block/io.c b/block/io.c
index 00843362e9..2dda1cf5c2 100644
--- a/block/io.c
+++ b/block/io.c
@@ -160,6 +160,7 @@ void bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp)
     bool have_limits;
 
     GLOBAL_STATE_CODE();
+    assume_graph_lock(); /* FIXME */
 
     if (tran) {
         BdrvRefreshLimitsState *s = g_new(BdrvRefreshLimitsState, 1);
@@ -961,10 +962,9 @@ static void bdrv_co_io_em_complete(void *opaque, int ret)
     aio_co_wake(co->coroutine);
 }
 
-static int coroutine_fn bdrv_driver_preadv(BlockDriverState *bs,
-                                           int64_t offset, int64_t bytes,
-                                           QEMUIOVector *qiov,
-                                           size_t qiov_offset, int flags)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_driver_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                   QEMUIOVector *qiov, size_t qiov_offset, int flags)
 {
     BlockDriver *drv = bs->drv;
     int64_t sector_num;
@@ -1030,11 +1030,10 @@ out:
     return ret;
 }
 
-static int coroutine_fn bdrv_driver_pwritev(BlockDriverState *bs,
-                                            int64_t offset, int64_t bytes,
-                                            QEMUIOVector *qiov,
-                                            size_t qiov_offset,
-                                            BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_driver_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                    QEMUIOVector *qiov, size_t qiov_offset,
+                    BdrvRequestFlags flags)
 {
     BlockDriver *drv = bs->drv;
     bool emulate_fua = false;
@@ -1043,8 +1042,6 @@ static int coroutine_fn bdrv_driver_pwritev(BlockDriverState *bs,
     QEMUIOVector local_qiov;
     int ret;
 
-    assume_graph_lock(); /* FIXME */
-
     bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
 
     if (!drv) {
@@ -1114,7 +1111,7 @@ emulate_flags:
     return ret;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 bdrv_driver_pwritev_compressed(BlockDriverState *bs, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
                                size_t qiov_offset)
@@ -1149,9 +1146,9 @@ bdrv_driver_pwritev_compressed(BlockDriverState *bs, int64_t offset,
     return ret;
 }
 
-static int coroutine_fn bdrv_co_do_copy_on_readv(BdrvChild *child,
-        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
-        size_t qiov_offset, int flags)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_co_do_copy_on_readv(BdrvChild *child, int64_t offset, int64_t bytes,
+                         QEMUIOVector *qiov, size_t qiov_offset, int flags)
 {
     BlockDriverState *bs = child->bs;
 
@@ -1172,8 +1169,6 @@ static int coroutine_fn bdrv_co_do_copy_on_readv(BdrvChild *child,
     int64_t progress = 0;
     bool skip_write;
 
-    assume_graph_lock(); /* FIXME */
-
     bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
 
     if (!drv) {
@@ -1315,9 +1310,10 @@ err:
  * handles copy on read, zeroing after EOF, and fragmentation of large
  * reads; any other features must be implemented by the caller.
  */
-static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
-    BdrvTrackedRequest *req, int64_t offset, int64_t bytes,
-    int64_t align, QEMUIOVector *qiov, size_t qiov_offset, int flags)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_aligned_preadv(BdrvChild *child, BdrvTrackedRequest *req,
+                    int64_t offset, int64_t bytes, int64_t align,
+                    QEMUIOVector *qiov, size_t qiov_offset, int flags)
 {
     BlockDriverState *bs = child->bs;
     int64_t total_bytes, max_bytes;
@@ -1484,10 +1480,9 @@ static bool bdrv_init_padding(BlockDriverState *bs,
     return true;
 }
 
-static coroutine_fn int bdrv_padding_rmw_read(BdrvChild *child,
-                                              BdrvTrackedRequest *req,
-                                              BdrvRequestPadding *pad,
-                                              bool zero_middle)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_padding_rmw_read(BdrvChild *child, BdrvTrackedRequest *req,
+                      BdrvRequestPadding *pad, bool zero_middle)
 {
     QEMUIOVector local_qiov;
     BlockDriverState *bs = child->bs;
@@ -1626,6 +1621,8 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
     int ret;
     IO_CODE();
 
+    assume_graph_lock(); /* FIXME */
+
     trace_bdrv_co_preadv_part(bs, offset, bytes, flags);
 
     if (!bdrv_co_is_inserted(bs)) {
@@ -1898,10 +1895,11 @@ bdrv_co_write_req_finish(BdrvChild *child, int64_t offset, int64_t bytes,
  * Forwards an already correctly aligned write request to the BlockDriver,
  * after possibly fragmenting it.
  */
-static int coroutine_fn bdrv_aligned_pwritev(BdrvChild *child,
-    BdrvTrackedRequest *req, int64_t offset, int64_t bytes,
-    int64_t align, QEMUIOVector *qiov, size_t qiov_offset,
-    BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_aligned_pwritev(BdrvChild *child, BdrvTrackedRequest *req,
+                     int64_t offset, int64_t bytes, int64_t align,
+                     QEMUIOVector *qiov, size_t qiov_offset,
+                     BdrvRequestFlags flags)
 {
     BlockDriverState *bs = child->bs;
     BlockDriver *drv = bs->drv;
@@ -1910,8 +1908,6 @@ static int coroutine_fn bdrv_aligned_pwritev(BdrvChild *child,
     int64_t bytes_remaining = bytes;
     int max_transfer;
 
-    assume_graph_lock(); /* FIXME */
-
     bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
 
     if (!drv) {
@@ -1987,11 +1983,9 @@ static int coroutine_fn bdrv_aligned_pwritev(BdrvChild *child,
     return ret;
 }
 
-static int coroutine_fn bdrv_co_do_zero_pwritev(BdrvChild *child,
-                                                int64_t offset,
-                                                int64_t bytes,
-                                                BdrvRequestFlags flags,
-                                                BdrvTrackedRequest *req)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_co_do_zero_pwritev(BdrvChild *child, int64_t offset, int64_t bytes,
+                        BdrvRequestFlags flags, BdrvTrackedRequest *req)
 {
     BlockDriverState *bs = child->bs;
     QEMUIOVector local_qiov;
@@ -2079,6 +2073,8 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
     bool padded = false;
     IO_CODE();
 
+    assume_graph_lock(); /* FIXME */
+
     trace_bdrv_co_pwritev_part(child->bs, offset, bytes, flags);
 
     if (!bdrv_co_is_inserted(bs)) {
diff --git a/block/parallels.c b/block/parallels.c
index 36c9de8a8a..2cf5061524 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -320,17 +320,15 @@ static int coroutine_fn parallels_co_block_status(BlockDriverState *bs,
     return BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
 }
 
-static coroutine_fn int parallels_co_writev(BlockDriverState *bs,
-                                            int64_t sector_num, int nb_sectors,
-                                            QEMUIOVector *qiov, int flags)
+static int coroutine_fn GRAPH_RDLOCK
+parallels_co_writev(BlockDriverState *bs, int64_t sector_num, int nb_sectors,
+                    QEMUIOVector *qiov, int flags)
 {
     BDRVParallelsState *s = bs->opaque;
     uint64_t bytes_done = 0;
     QEMUIOVector hd_qiov;
     int ret = 0;
 
-    assume_graph_lock(); /* FIXME */
-
     qemu_iovec_init(&hd_qiov, qiov->niov);
 
     while (nb_sectors > 0) {
diff --git a/block/qcow.c b/block/qcow.c
index 2d19a78818..1e1d1792d0 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -617,9 +617,9 @@ static void qcow_refresh_limits(BlockDriverState *bs, Error **errp)
     bs->bl.request_alignment = BDRV_SECTOR_SIZE;
 }
 
-static coroutine_fn int qcow_co_preadv(BlockDriverState *bs, int64_t offset,
-                                       int64_t bytes, QEMUIOVector *qiov,
-                                       BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+qcow_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+               QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVQcowState *s = bs->opaque;
     int offset_in_cluster;
@@ -628,8 +628,6 @@ static coroutine_fn int qcow_co_preadv(BlockDriverState *bs, int64_t offset,
     uint8_t *buf;
     void *orig_buf;
 
-    assume_graph_lock(); /* FIXME */
-
     if (qiov->niov > 1) {
         buf = orig_buf = qemu_try_blockalign(bs, qiov->size);
         if (buf == NULL) {
@@ -715,9 +713,9 @@ static coroutine_fn int qcow_co_preadv(BlockDriverState *bs, int64_t offset,
     return ret;
 }
 
-static coroutine_fn int qcow_co_pwritev(BlockDriverState *bs, int64_t offset,
-                                        int64_t bytes, QEMUIOVector *qiov,
-                                        BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+qcow_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVQcowState *s = bs->opaque;
     int offset_in_cluster;
@@ -726,8 +724,6 @@ static coroutine_fn int qcow_co_pwritev(BlockDriverState *bs, int64_t offset,
     uint8_t *buf;
     void *orig_buf;
 
-    assume_graph_lock(); /* FIXME */
-
     s->cluster_cache_offset = -1; /* disable compressed cache */
 
     /* We must always copy the iov when encrypting, so we
@@ -1048,7 +1044,7 @@ static int qcow_make_empty(BlockDriverState *bs)
 
 /* XXX: put compressed sectors first, then all the cluster aligned
    tables to avoid losing bytes in alignment */
-static coroutine_fn int
+static int coroutine_fn GRAPH_RDLOCK
 qcow_co_pwritev_compressed(BlockDriverState *bs, int64_t offset, int64_t bytes,
                            QEMUIOVector *qiov)
 {
@@ -1058,8 +1054,6 @@ qcow_co_pwritev_compressed(BlockDriverState *bs, int64_t offset, int64_t bytes,
     uint8_t *buf, *out_buf;
     uint64_t cluster_offset;
 
-    assume_graph_lock(); /* FIXME */
-
     buf = qemu_blockalign(bs, s->cluster_size);
     if (bytes != s->cluster_size) {
         if (bytes > s->cluster_size ||
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 870be106b6..a22607d90d 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -491,10 +491,9 @@ static int count_contiguous_subclusters(BlockDriverState *bs, int nb_clusters,
     return count;
 }
 
-static int coroutine_fn do_perform_cow_read(BlockDriverState *bs,
-                                            uint64_t src_cluster_offset,
-                                            unsigned offset_in_cluster,
-                                            QEMUIOVector *qiov)
+static int coroutine_fn GRAPH_RDLOCK
+do_perform_cow_read(BlockDriverState *bs, uint64_t src_cluster_offset,
+                    unsigned offset_in_cluster, QEMUIOVector *qiov)
 {
     int ret;
 
@@ -886,7 +885,8 @@ int coroutine_fn qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
     return 0;
 }
 
-static int coroutine_fn perform_cow(BlockDriverState *bs, QCowL2Meta *m)
+static int coroutine_fn GRAPH_RDLOCK
+perform_cow(BlockDriverState *bs, QCowL2Meta *m)
 {
     BDRVQcow2State *s = bs->opaque;
     Qcow2COWRegion *start = &m->cow_start;
diff --git a/block/qcow2.c b/block/qcow2.c
index 89c3edbd61..8f5ad75984 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2137,9 +2137,8 @@ static int coroutine_fn qcow2_co_block_status(BlockDriverState *bs,
     return status;
 }
 
-static coroutine_fn int qcow2_handle_l2meta(BlockDriverState *bs,
-                                            QCowL2Meta **pl2meta,
-                                            bool link_l2)
+static int coroutine_fn GRAPH_RDLOCK
+qcow2_handle_l2meta(BlockDriverState *bs, QCowL2Meta **pl2meta, bool link_l2)
 {
     int ret = 0;
     QCowL2Meta *l2meta = *pl2meta;
@@ -2617,9 +2616,10 @@ static coroutine_fn GRAPH_RDLOCK int qcow2_co_pwritev_task_entry(AioTask *task)
                                  t->l2meta);
 }
 
-static coroutine_fn int qcow2_co_pwritev_part(
-        BlockDriverState *bs, int64_t offset, int64_t bytes,
-        QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+qcow2_co_pwritev_part(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                      QEMUIOVector *qiov, size_t qiov_offset,
+                      BdrvRequestFlags flags)
 {
     BDRVQcow2State *s = bs->opaque;
     int offset_in_cluster;
@@ -2629,8 +2629,6 @@ static coroutine_fn int qcow2_co_pwritev_part(
     QCowL2Meta *l2meta = NULL;
     AioTaskPool *aio = NULL;
 
-    assume_graph_lock(); /* FIXME */
-
     trace_qcow2_writev_start_req(qemu_coroutine_self(), offset, bytes);
 
     while (bytes != 0 && aio_task_pool_status(aio) == 0) {
@@ -4160,6 +4158,7 @@ qcow2_co_copy_range_to(BlockDriverState *bs,
     uint64_t host_offset;
     QCowL2Meta *l2meta = NULL;
 
+    assume_graph_lock(); /* FIXME */
     assert(!bs->encrypted);
 
     qemu_co_mutex_lock(&s->lock);
@@ -4591,7 +4590,7 @@ fail:
     return ret;
 }
 
-static coroutine_fn int
+static int coroutine_fn GRAPH_RDLOCK
 qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
                                  uint64_t offset, uint64_t bytes,
                                  QEMUIOVector *qiov, size_t qiov_offset)
@@ -4655,7 +4654,13 @@ fail:
     return ret;
 }
 
-static coroutine_fn int qcow2_co_pwritev_compressed_task_entry(AioTask *task)
+/*
+ * This function can count as GRAPH_RDLOCK because
+ * qcow2_co_pwritev_compressed_part() holds the graph lock and keeps it until
+ * this coroutine has terminated.
+ */
+static int coroutine_fn GRAPH_RDLOCK
+qcow2_co_pwritev_compressed_task_entry(AioTask *task)
 {
     Qcow2AioTask *t = container_of(task, Qcow2AioTask, task);
 
@@ -4669,7 +4674,7 @@ static coroutine_fn int qcow2_co_pwritev_compressed_task_entry(AioTask *task)
  * XXX: put compressed sectors first, then all the cluster aligned
  * tables to avoid losing bytes in alignment
  */
-static coroutine_fn int
+static int coroutine_fn GRAPH_RDLOCK
 qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
                                  int64_t offset, int64_t bytes,
                                  QEMUIOVector *qiov, size_t qiov_offset)
@@ -4678,8 +4683,6 @@ qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
     AioTaskPool *aio = NULL;
     int ret = 0;
 
-    assume_graph_lock(); /* FIXME */
-
     if (has_data_file(bs)) {
         return -ENOTSUP;
     }
@@ -5296,8 +5299,8 @@ static int64_t qcow2_check_vmstate_request(BlockDriverState *bs,
     return pos;
 }
 
-static coroutine_fn int qcow2_co_save_vmstate(BlockDriverState *bs,
-                                              QEMUIOVector *qiov, int64_t pos)
+static int coroutine_fn GRAPH_RDLOCK
+qcow2_co_save_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
 {
     int64_t offset = qcow2_check_vmstate_request(bs, qiov, pos);
     if (offset < 0) {
@@ -5308,8 +5311,8 @@ static coroutine_fn int qcow2_co_save_vmstate(BlockDriverState *bs,
     return bs->drv->bdrv_co_pwritev_part(bs, offset, qiov->size, qiov, 0, 0);
 }
 
-static coroutine_fn int qcow2_co_load_vmstate(BlockDriverState *bs,
-                                              QEMUIOVector *qiov, int64_t pos)
+static int coroutine_fn GRAPH_RDLOCK
+qcow2_co_load_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
 {
     int64_t offset = qcow2_check_vmstate_request(bs, qiov, pos);
     if (offset < 0) {
diff --git a/block/qed.c b/block/qed.c
index bdcb6de6df..a4a74e59ef 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -1404,19 +1404,17 @@ qed_co_request(BlockDriverState *bs, int64_t sector_num, QEMUIOVector *qiov,
     return qed_aio_next_io(&acb);
 }
 
-static int coroutine_fn bdrv_qed_co_readv(BlockDriverState *bs,
-                                          int64_t sector_num, int nb_sectors,
-                                          QEMUIOVector *qiov)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_qed_co_readv(BlockDriverState *bs, int64_t sector_num, int nb_sectors,
+                  QEMUIOVector *qiov)
 {
-    assume_graph_lock(); /* FIXME */
     return qed_co_request(bs, sector_num, qiov, nb_sectors, 0);
 }
 
-static int coroutine_fn bdrv_qed_co_writev(BlockDriverState *bs,
-                                           int64_t sector_num, int nb_sectors,
-                                           QEMUIOVector *qiov, int flags)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_qed_co_writev(BlockDriverState *bs, int64_t sector_num, int nb_sectors,
+                   QEMUIOVector *qiov, int flags)
 {
-    assume_graph_lock(); /* FIXME */
     return qed_co_request(bs, sector_num, qiov, nb_sectors, QED_AIOCB_WRITE);
 }
 
diff --git a/block/quorum.c b/block/quorum.c
index 02ae0d8343..ef6cda2868 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -718,16 +718,14 @@ static void coroutine_fn GRAPH_RDLOCK write_quorum_entry(void *opaque)
     }
 }
 
-static int coroutine_fn quorum_co_pwritev(BlockDriverState *bs, int64_t offset,
-                                          int64_t bytes, QEMUIOVector *qiov,
-                                          BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+quorum_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                  QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVQuorumState *s = bs->opaque;
     QuorumAIOCB *acb = quorum_aio_get(bs, qiov, offset, bytes, flags);
     int i, ret;
 
-    assume_graph_lock(); /* FIXME */
-
     for (i = 0; i < s->num_children; i++) {
         Coroutine *co;
         QuorumCo data = {
diff --git a/block/vmdk.c b/block/vmdk.c
index d074f696aa..8b844300f4 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2128,12 +2128,10 @@ vmdk_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
     return ret;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 vmdk_co_pwritev_compressed(BlockDriverState *bs, int64_t offset, int64_t bytes,
                            QEMUIOVector *qiov)
 {
-    assume_graph_lock(); /* FIXME */
-
     if (bytes == 0) {
         /* The caller will write bytes 0 to signal EOF.
          * When receive it, we align EOF to a sector boundary. */
-- 
2.39.2


