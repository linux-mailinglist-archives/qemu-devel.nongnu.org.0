Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF01A6A0FEB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:57:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhO-0006ob-86; Thu, 23 Feb 2023 13:52:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhH-0006lj-BS
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhF-0002xS-9I
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bak/FlvANa78AZhSestxHeGPA9VbPJ0w1GZ6s1tM5KE=;
 b=U/cc/LB8FJWte6iceQys+F4IKLHS/RTDKVwJ9tNCBKe1eo+Ev6Xvr7emyLd34jXdqjQZyE
 UdwaxOwDxdRSQnoLF+iD0tE2kCuUbMiSY6lVxPqt6Kn5nQa6Sg8O/iByGwIjHZWcgUFAiP
 8VlvzukNezig/7wQwK+KfAJOROYCzn8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-1RG4dhEwNHakt8RTKwPSvQ-1; Thu, 23 Feb 2023 13:51:54 -0500
X-MC-Unique: 1RG4dhEwNHakt8RTKwPSvQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 604681C17427;
 Thu, 23 Feb 2023 18:51:54 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACAD31121314;
 Thu, 23 Feb 2023 18:51:53 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 03/29] block: Mark bdrv_co_truncate() and callers GRAPH_RDLOCK
Date: Thu, 23 Feb 2023 19:51:20 +0100
Message-Id: <20230223185146.306454-4-kwolf@redhat.com>
In-Reply-To: <20230223185146.306454-1-kwolf@redhat.com>
References: <20230223185146.306454-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
bdrv_co_truncate() need to hold a reader lock for the graph.

For some places, we know that they will hold the lock, but we don't have
the GRAPH_RDLOCK annotations yet. In this case, add assume_graph_lock()
with a FIXME comment. These places will be removed once everything is
properly annotated.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230203152202.49054-4-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h         |  6 +++---
 include/block/block_int-common.h |  7 ++++---
 block/block-backend.c            |  1 +
 block/crypto.c                   |  2 +-
 block/io.c                       |  1 +
 block/parallels.c                | 14 ++++++++------
 block/preallocate.c              |  2 +-
 block/qcow.c                     | 17 ++++++++++++-----
 block/qcow2.c                    | 14 ++++++++------
 block/raw-format.c               |  6 +++---
 block/vmdk.c                     |  2 ++
 11 files changed, 44 insertions(+), 28 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index f9fa88204d..9a09ec2bdd 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -72,9 +72,9 @@ int coroutine_fn bdrv_co_pwrite_sync(BdrvChild *child, int64_t offset,
 int coroutine_fn bdrv_co_pwrite_zeroes(BdrvChild *child, int64_t offset,
                                        int64_t bytes, BdrvRequestFlags flags);
 
-int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
-                                  PreallocMode prealloc, BdrvRequestFlags flags,
-                                  Error **errp);
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
+                 PreallocMode prealloc, BdrvRequestFlags flags, Error **errp);
 
 int64_t coroutine_fn bdrv_co_nb_sectors(BlockDriverState *bs);
 int64_t co_wrapper_mixed bdrv_nb_sectors(BlockDriverState *bs);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index ba2e0fce25..eaf62beaff 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -677,9 +677,10 @@ struct BlockDriver {
      * If @exact is true and this function fails but would succeed
      * with @exact = false, it should return -ENOTSUP.
      */
-    int coroutine_fn (*bdrv_co_truncate)(BlockDriverState *bs, int64_t offset,
-                                         bool exact, PreallocMode prealloc,
-                                         BdrvRequestFlags flags, Error **errp);
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_truncate)(
+        BlockDriverState *bs, int64_t offset, bool exact,
+        PreallocMode prealloc, BdrvRequestFlags flags, Error **errp);
+
     int64_t coroutine_fn (*bdrv_co_getlength)(BlockDriverState *bs);
     int64_t coroutine_fn (*bdrv_co_get_allocated_file_size)(
         BlockDriverState *bs);
diff --git a/block/block-backend.c b/block/block-backend.c
index ef512f7c48..f25f3ba5e7 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2372,6 +2372,7 @@ int coroutine_fn blk_co_truncate(BlockBackend *blk, int64_t offset, bool exact,
                                  Error **errp)
 {
     IO_OR_GS_CODE();
+    GRAPH_RDLOCK_GUARD();
     if (!blk_is_available(blk)) {
         error_setg(errp, "No medium inserted");
         return -ENOMEDIUM;
diff --git a/block/crypto.c b/block/crypto.c
index 72ac30568c..a15f77521f 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -359,7 +359,7 @@ block_crypto_co_create_generic(BlockDriverState *bs, int64_t size,
     return ret;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 block_crypto_co_truncate(BlockDriverState *bs, int64_t offset, bool exact,
                          PreallocMode prealloc, BdrvRequestFlags flags,
                          Error **errp)
diff --git a/block/io.c b/block/io.c
index d2be37b11e..35025fc11b 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3380,6 +3380,7 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
     int64_t old_size, new_bytes;
     int ret;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     /* if bs->drv == NULL, bs is closed, so there's nothing to do here */
     if (!drv) {
diff --git a/block/parallels.c b/block/parallels.c
index d4378e09de..36c9de8a8a 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -165,9 +165,9 @@ static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
     return start_off;
 }
 
-static coroutine_fn int64_t allocate_clusters(BlockDriverState *bs,
-                                              int64_t sector_num,
-                                              int nb_sectors, int *pnum)
+static int64_t coroutine_fn GRAPH_RDLOCK
+allocate_clusters(BlockDriverState *bs, int64_t sector_num,
+                  int nb_sectors, int *pnum)
 {
     int ret = 0;
     BDRVParallelsState *s = bs->opaque;
@@ -329,6 +329,8 @@ static coroutine_fn int parallels_co_writev(BlockDriverState *bs,
     QEMUIOVector hd_qiov;
     int ret = 0;
 
+    assume_graph_lock(); /* FIXME */
+
     qemu_iovec_init(&hd_qiov, qiov->niov);
 
     while (nb_sectors > 0) {
@@ -414,9 +416,9 @@ static coroutine_fn int parallels_co_readv(BlockDriverState *bs,
 }
 
 
-static int coroutine_fn parallels_co_check(BlockDriverState *bs,
-                                           BdrvCheckResult *res,
-                                           BdrvCheckMode fix)
+static int coroutine_fn GRAPH_RDLOCK
+parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
+                   BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
     int64_t size, prev_off, high_off;
diff --git a/block/preallocate.c b/block/preallocate.c
index c0dcf8c346..42da9cb9f1 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -370,7 +370,7 @@ static coroutine_fn int preallocate_co_pwritev_part(BlockDriverState *bs,
                                 flags);
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 preallocate_co_truncate(BlockDriverState *bs, int64_t offset,
                         bool exact, PreallocMode prealloc,
                         BdrvRequestFlags flags, Error **errp)
diff --git a/block/qcow.c b/block/qcow.c
index 20c53b447b..5eb1ab5e59 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -350,11 +350,10 @@ static int qcow_reopen_prepare(BDRVReopenState *state,
  * return 0 if not allocated, 1 if *result is assigned, and negative
  * errno on failure.
  */
-static int coroutine_fn get_cluster_offset(BlockDriverState *bs,
-                                           uint64_t offset, int allocate,
-                                           int compressed_size,
-                                           int n_start, int n_end,
-                                           uint64_t *result)
+static int coroutine_fn GRAPH_RDLOCK
+get_cluster_offset(BlockDriverState *bs, uint64_t offset, int allocate,
+                   int compressed_size, int n_start, int n_end,
+                   uint64_t *result)
 {
     BDRVQcowState *s = bs->opaque;
     int min_index, i, j, l1_index, l2_index, ret;
@@ -536,6 +535,8 @@ static int coroutine_fn qcow_co_block_status(BlockDriverState *bs,
     int64_t n;
     uint64_t cluster_offset;
 
+    assume_graph_lock(); /* FIXME */
+
     qemu_co_mutex_lock(&s->lock);
     ret = get_cluster_offset(bs, offset, 0, 0, 0, 0, &cluster_offset);
     qemu_co_mutex_unlock(&s->lock);
@@ -630,6 +631,8 @@ static coroutine_fn int qcow_co_preadv(BlockDriverState *bs, int64_t offset,
     uint8_t *buf;
     void *orig_buf;
 
+    assume_graph_lock(); /* FIXME */
+
     if (qiov->niov > 1) {
         buf = orig_buf = qemu_try_blockalign(bs, qiov->size);
         if (buf == NULL) {
@@ -726,6 +729,8 @@ static coroutine_fn int qcow_co_pwritev(BlockDriverState *bs, int64_t offset,
     uint8_t *buf;
     void *orig_buf;
 
+    assume_graph_lock(); /* FIXME */
+
     s->cluster_cache_offset = -1; /* disable compressed cache */
 
     /* We must always copy the iov when encrypting, so we
@@ -1056,6 +1061,8 @@ qcow_co_pwritev_compressed(BlockDriverState *bs, int64_t offset, int64_t bytes,
     uint8_t *buf, *out_buf;
     uint64_t cluster_offset;
 
+    assume_graph_lock(); /* FIXME */
+
     buf = qemu_blockalign(bs, s->cluster_size);
     if (bytes != s->cluster_size) {
         if (bytes > s->cluster_size ||
diff --git a/block/qcow2.c b/block/qcow2.c
index ee0e5b45cc..e06ea7b5ff 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3183,9 +3183,9 @@ static int qcow2_set_up_encryption(BlockDriverState *bs,
  *
  * Returns: 0 on success, -errno on failure.
  */
-static int coroutine_fn preallocate_co(BlockDriverState *bs, uint64_t offset,
-                                       uint64_t new_length, PreallocMode mode,
-                                       Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+preallocate_co(BlockDriverState *bs, uint64_t offset, uint64_t new_length,
+               PreallocMode mode, Error **errp)
 {
     BDRVQcow2State *s = bs->opaque;
     uint64_t bytes;
@@ -4209,9 +4209,9 @@ fail:
     return ret;
 }
 
-static int coroutine_fn qcow2_co_truncate(BlockDriverState *bs, int64_t offset,
-                                          bool exact, PreallocMode prealloc,
-                                          BdrvRequestFlags flags, Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+qcow2_co_truncate(BlockDriverState *bs, int64_t offset, bool exact,
+                  PreallocMode prealloc, BdrvRequestFlags flags, Error **errp)
 {
     BDRVQcow2State *s = bs->opaque;
     uint64_t old_length;
@@ -4672,6 +4672,8 @@ qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
     AioTaskPool *aio = NULL;
     int ret = 0;
 
+    assume_graph_lock(); /* FIXME */
+
     if (has_data_file(bs)) {
         return -ENOTSUP;
     }
diff --git a/block/raw-format.c b/block/raw-format.c
index 0dc469b629..f39e1f502b 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -384,9 +384,9 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
     }
 }
 
-static int coroutine_fn raw_co_truncate(BlockDriverState *bs, int64_t offset,
-                                        bool exact, PreallocMode prealloc,
-                                        BdrvRequestFlags flags, Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+raw_co_truncate(BlockDriverState *bs, int64_t offset, bool exact,
+                PreallocMode prealloc, BdrvRequestFlags flags, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
 
diff --git a/block/vmdk.c b/block/vmdk.c
index 171c9272ca..3fcb75319f 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2130,6 +2130,8 @@ static int coroutine_fn
 vmdk_co_pwritev_compressed(BlockDriverState *bs, int64_t offset, int64_t bytes,
                            QEMUIOVector *qiov)
 {
+    assume_graph_lock(); /* FIXME */
+
     if (bytes == 0) {
         /* The caller will write bytes 0 to signal EOF.
          * When receive it, we align EOF to a sector boundary. */
-- 
2.39.2


