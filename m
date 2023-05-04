Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB486F6AAC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 14:00:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXbW-0003MX-Ak; Thu, 04 May 2023 07:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puXbO-0003Hz-Q3
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:58:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puXbL-0004Ez-9Z
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683201502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DF4i67+jE0B+7rPzv4KwH9kOencdv/UJ1i01ycr3cgs=;
 b=JaBt7ZK6uHAcbZrETO6/CRtFzJTOPG8/SDgjWCwsIcbE+DxqCG/T7n43XaBP0OktSi8BMP
 DaeBiywIiYIiWcbppqlmW69akpyYElpPW818u9nfDktY1RhrQmryWm/jPVH6RZFn8jK+Ly
 sOD8vJ/SjIL1v9+Ws093ocoY27glmtI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-tl2pPeWcOXq_rjRkiFdTYA-1; Thu, 04 May 2023 07:58:19 -0400
X-MC-Unique: tl2pPeWcOXq_rjRkiFdTYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59A5C109DCE7;
 Thu,  4 May 2023 11:58:19 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F7A2C15BAD;
 Thu,  4 May 2023 11:58:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, eblake@redhat.com,
 eesposit@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v2 14/20] block: Mark bdrv_co_get_info() and callers
 GRAPH_RDLOCK
Date: Thu,  4 May 2023 13:57:44 +0200
Message-Id: <20230504115750.54437-15-kwolf@redhat.com>
In-Reply-To: <20230504115750.54437-1-kwolf@redhat.com>
References: <20230504115750.54437-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
bdrv_co_get_info() need to hold a reader lock for the graph.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/block-io.h         |  7 +++++--
 include/block/block_int-common.h |  4 ++--
 block.c                          |  2 ++
 block/crypto.c                   |  2 +-
 block/io.c                       | 11 +++++------
 block/mirror.c                   |  8 ++++++--
 block/raw-format.c               |  2 +-
 7 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index fb2adb31c7..bba7f957e1 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -167,8 +167,11 @@ const char *bdrv_get_node_name(const BlockDriverState *bs);
 const char *bdrv_get_device_name(const BlockDriverState *bs);
 const char *bdrv_get_device_or_node_name(const BlockDriverState *bs);
 
-int coroutine_fn bdrv_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi);
-int co_wrapper_mixed bdrv_get_info(BlockDriverState *bs, BlockDriverInfo *bdi);
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi);
+
+int co_wrapper_mixed_bdrv_rdlock
+bdrv_get_info(BlockDriverState *bs, BlockDriverInfo *bdi);
 
 ImageInfoSpecific *bdrv_get_specific_info(BlockDriverState *bs,
                                           Error **errp);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 6e0365d8f2..ee77903f72 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -699,8 +699,8 @@ struct BlockDriver {
         BlockDriverState *bs, int64_t offset, int64_t bytes,
         QEMUIOVector *qiov, size_t qiov_offset);
 
-    int coroutine_fn (*bdrv_co_get_info)(BlockDriverState *bs,
-                                         BlockDriverInfo *bdi);
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_get_info)(
+        BlockDriverState *bs, BlockDriverInfo *bdi);
 
     ImageInfoSpecific *(*bdrv_get_specific_info)(BlockDriverState *bs,
                                                  Error **errp);
diff --git a/block.c b/block.c
index 3ccb935950..a6deaf8ad1 100644
--- a/block.c
+++ b/block.c
@@ -6349,6 +6349,8 @@ int coroutine_fn bdrv_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
     int ret;
     BlockDriver *drv = bs->drv;
     IO_CODE();
+    assert_bdrv_graph_readable();
+
     /* if bs->drv == NULL, bs is closed, so there's nothing to do here */
     if (!drv) {
         return -ENOMEDIUM;
diff --git a/block/crypto.c b/block/crypto.c
index 8fd3ad0054..30093cff9b 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -736,7 +736,7 @@ fail:
     return ret;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 block_crypto_co_get_info_luks(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     BlockDriverInfo subbdi;
diff --git a/block/io.c b/block/io.c
index 6fa1993374..3bf9ef9d87 100644
--- a/block/io.c
+++ b/block/io.c
@@ -727,10 +727,9 @@ BdrvTrackedRequest *coroutine_fn bdrv_co_get_self_request(BlockDriverState *bs)
 /**
  * Round a region to cluster boundaries
  */
-void coroutine_fn bdrv_round_to_clusters(BlockDriverState *bs,
-                            int64_t offset, int64_t bytes,
-                            int64_t *cluster_offset,
-                            int64_t *cluster_bytes)
+void coroutine_fn GRAPH_RDLOCK
+bdrv_round_to_clusters(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                       int64_t *cluster_offset, int64_t *cluster_bytes)
 {
     BlockDriverInfo bdi;
     IO_CODE();
@@ -744,7 +743,7 @@ void coroutine_fn bdrv_round_to_clusters(BlockDriverState *bs,
     }
 }
 
-static coroutine_fn int bdrv_get_cluster_size(BlockDriverState *bs)
+static int coroutine_fn GRAPH_RDLOCK bdrv_get_cluster_size(BlockDriverState *bs)
 {
     BlockDriverInfo bdi;
     int ret;
@@ -1800,7 +1799,7 @@ fail:
     return ret;
 }
 
-static inline int coroutine_fn
+static inline int coroutine_fn GRAPH_RDLOCK
 bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, int64_t bytes,
                           BdrvTrackedRequest *req, int flags)
 {
diff --git a/block/mirror.c b/block/mirror.c
index b5c4ae31f3..e48ed0af31 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -576,8 +576,10 @@ static uint64_t coroutine_fn mirror_iteration(MirrorBlockJob *s)
         } else if (ret >= 0 && !(ret & BDRV_BLOCK_DATA)) {
             int64_t target_offset;
             int64_t target_bytes;
-            bdrv_round_to_clusters(blk_bs(s->target), offset, io_bytes,
-                                   &target_offset, &target_bytes);
+            WITH_GRAPH_RDLOCK_GUARD() {
+                bdrv_round_to_clusters(blk_bs(s->target), offset, io_bytes,
+                                       &target_offset, &target_bytes);
+            }
             if (target_offset == offset &&
                 target_bytes == io_bytes) {
                 mirror_method = ret & BDRV_BLOCK_ZERO ?
@@ -966,11 +968,13 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
      */
     bdrv_get_backing_filename(target_bs, backing_filename,
                               sizeof(backing_filename));
+    bdrv_graph_co_rdlock();
     if (!bdrv_co_get_info(target_bs, &bdi) && bdi.cluster_size) {
         s->target_cluster_size = bdi.cluster_size;
     } else {
         s->target_cluster_size = BDRV_SECTOR_SIZE;
     }
+    bdrv_graph_co_rdunlock();
     if (backing_filename[0] && !bdrv_backing_chain_next(target_bs) &&
         s->granularity < s->target_cluster_size) {
         s->buf_size = MAX(s->buf_size, s->target_cluster_size);
diff --git a/block/raw-format.c b/block/raw-format.c
index 06b8030d9d..fd9e61f58e 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -369,7 +369,7 @@ static BlockMeasureInfo *raw_measure(QemuOpts *opts, BlockDriverState *in_bs,
     return info;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 raw_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     return bdrv_co_get_info(bs->file->bs, bdi);
-- 
2.40.1


