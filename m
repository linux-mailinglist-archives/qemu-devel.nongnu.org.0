Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 193E966A443
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 21:44:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGQt7-0000BJ-MM; Fri, 13 Jan 2023 15:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGQt2-000075-ME
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:42:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGQsz-0006D8-Rc
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:42:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673642569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2cw9DUCz5zZIydjHbNSWPOx3q2dCSUllateEZBK3pcI=;
 b=FY7Rq0Z+LunR08HUy8MS6PdN1hh0kICeqVRfLXEj0KgZK28WI+ELN4VwziiUVcBOinTYyk
 l9iwkXikr0uqgQeyK3tiKJMsWcNYm4biYLvh32PyJzifX90D8Wjq/mX9A4P1TO5EEBb8dJ
 eDo4DNrxF8dYYUMhlqADp2fDvmsdZ9Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-1n-kqsc7MPaRptBS5KzYKg-1; Fri, 13 Jan 2023 15:42:46 -0500
X-MC-Unique: 1n-kqsc7MPaRptBS5KzYKg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF55D2A5956F;
 Fri, 13 Jan 2023 20:42:45 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9612F2026D68;
 Fri, 13 Jan 2023 20:42:44 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH v2 10/14] block: Convert bdrv_get_info() to co_wrapper_mixed
Date: Fri, 13 Jan 2023 21:42:08 +0100
Message-Id: <20230113204212.359076-11-kwolf@redhat.com>
In-Reply-To: <20230113204212.359076-1-kwolf@redhat.com>
References: <20230113204212.359076-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

bdrv_get_info() is categorized as an I/O function, and it currently
doesn't run in a coroutine. We should let it take a graph rdlock since
it traverses the block nodes graph, which however is only possible in a
coroutine.

Therefore turn it into a co_wrapper to move the actual function into a
coroutine where the lock can be taken.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h         | 5 ++++-
 include/block/block_int-common.h | 3 ++-
 block.c                          | 8 ++++----
 block/blkio.c                    | 5 +++--
 block/crypto.c                   | 8 ++++----
 block/file-posix.c               | 7 ++++---
 block/io.c                       | 8 ++++----
 block/iscsi.c                    | 7 ++++---
 block/mirror.c                   | 2 +-
 block/qcow.c                     | 5 +++--
 block/qcow2.c                    | 5 +++--
 block/qed.c                      | 5 +++--
 block/raw-format.c               | 7 ++++---
 block/rbd.c                      | 5 +++--
 block/vdi.c                      | 7 ++++---
 block/vhdx.c                     | 5 +++--
 block/vmdk.c                     | 5 +++--
 block/vpc.c                      | 5 +++--
 18 files changed, 59 insertions(+), 43 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 0718554590..e27dc9787b 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -151,7 +151,10 @@ bool bdrv_supports_compressed_writes(BlockDriverState *bs);
 const char *bdrv_get_node_name(const BlockDriverState *bs);
 const char *bdrv_get_device_name(const BlockDriverState *bs);
 const char *bdrv_get_device_or_node_name(const BlockDriverState *bs);
-int bdrv_get_info(BlockDriverState *bs, BlockDriverInfo *bdi);
+
+int coroutine_fn bdrv_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi);
+int co_wrapper_mixed bdrv_get_info(BlockDriverState *bs, BlockDriverInfo *bdi);
+
 ImageInfoSpecific *bdrv_get_specific_info(BlockDriverState *bs,
                                           Error **errp);
 BlockStatsSpecific *bdrv_get_specific_stats(BlockDriverState *bs);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index cc03c599e7..a6ac8afd5b 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -697,7 +697,8 @@ struct BlockDriver {
         int64_t offset, int64_t bytes, QEMUIOVector *qiov,
         size_t qiov_offset);
 
-    int (*bdrv_get_info)(BlockDriverState *bs, BlockDriverInfo *bdi);
+    int coroutine_fn (*bdrv_co_get_info)(BlockDriverState *bs,
+                                         BlockDriverInfo *bdi);
 
     ImageInfoSpecific *(*bdrv_get_specific_info)(BlockDriverState *bs,
                                                  Error **errp);
diff --git a/block.c b/block.c
index 82c6cb6dcd..2707069ab6 100644
--- a/block.c
+++ b/block.c
@@ -6300,7 +6300,7 @@ void bdrv_get_backing_filename(BlockDriverState *bs,
     pstrcpy(filename, filename_size, bs->backing_file);
 }
 
-int bdrv_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
+int coroutine_fn bdrv_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     int ret;
     BlockDriver *drv = bs->drv;
@@ -6309,15 +6309,15 @@ int bdrv_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
     if (!drv) {
         return -ENOMEDIUM;
     }
-    if (!drv->bdrv_get_info) {
+    if (!drv->bdrv_co_get_info) {
         BlockDriverState *filtered = bdrv_filter_bs(bs);
         if (filtered) {
-            return bdrv_get_info(filtered, bdi);
+            return bdrv_co_get_info(filtered, bdi);
         }
         return -ENOTSUP;
     }
     memset(bdi, 0, sizeof(*bdi));
-    ret = drv->bdrv_get_info(bs, bdi);
+    ret = drv->bdrv_co_get_info(bs, bdi);
     if (ret < 0) {
         return ret;
     }
diff --git a/block/blkio.c b/block/blkio.c
index 2a3ab5a570..fc83e0fe13 100644
--- a/block/blkio.c
+++ b/block/blkio.c
@@ -878,7 +878,8 @@ static int coroutine_fn blkio_truncate(BlockDriverState *bs, int64_t offset,
     return 0;
 }
 
-static int blkio_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
+static int coroutine_fn
+blkio_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     return 0;
 }
@@ -998,7 +999,7 @@ static void blkio_refresh_limits(BlockDriverState *bs, Error **errp)
         .bdrv_close              = blkio_close, \
         .bdrv_co_getlength       = blkio_co_getlength, \
         .bdrv_co_truncate        = blkio_truncate, \
-        .bdrv_get_info           = blkio_get_info, \
+        .bdrv_co_get_info        = blkio_co_get_info, \
         .bdrv_attach_aio_context = blkio_attach_aio_context, \
         .bdrv_detach_aio_context = blkio_detach_aio_context, \
         .bdrv_co_pdiscard        = blkio_co_pdiscard, \
diff --git a/block/crypto.c b/block/crypto.c
index 6d6c006887..b70cec97c7 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -737,13 +737,13 @@ fail:
     return ret;
 }
 
-static int block_crypto_get_info_luks(BlockDriverState *bs,
-                                      BlockDriverInfo *bdi)
+static int coroutine_fn
+block_crypto_co_get_info_luks(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     BlockDriverInfo subbdi;
     int ret;
 
-    ret = bdrv_get_info(bs->file->bs, &subbdi);
+    ret = bdrv_co_get_info(bs->file->bs, &subbdi);
     if (ret != 0) {
         return ret;
     }
@@ -955,7 +955,7 @@ static BlockDriver bdrv_crypto_luks = {
     .bdrv_co_pwritev    = block_crypto_co_pwritev,
     .bdrv_co_getlength  = block_crypto_co_getlength,
     .bdrv_measure       = block_crypto_measure,
-    .bdrv_get_info      = block_crypto_get_info_luks,
+    .bdrv_co_get_info   = block_crypto_co_get_info_luks,
     .bdrv_get_specific_info = block_crypto_get_specific_info_luks,
     .bdrv_amend_options = block_crypto_amend_options_luks,
     .bdrv_co_amend      = block_crypto_co_amend_luks,
diff --git a/block/file-posix.c b/block/file-posix.c
index a22f93e4b2..f128071231 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3090,7 +3090,8 @@ static int coroutine_fn raw_co_pwrite_zeroes(
     return raw_do_pwrite_zeroes(bs, offset, bytes, flags, false);
 }
 
-static int raw_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
+static int coroutine_fn
+raw_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     return 0;
 }
@@ -3327,7 +3328,7 @@ BlockDriver bdrv_file = {
 
     .bdrv_co_truncate                   = raw_co_truncate,
     .bdrv_co_getlength                  = raw_co_getlength,
-    .bdrv_get_info = raw_get_info,
+    .bdrv_co_get_info                   = raw_co_get_info,
     .bdrv_co_get_allocated_file_size    = raw_co_get_allocated_file_size,
     .bdrv_get_specific_stats = raw_get_specific_stats,
     .bdrv_check_perm = raw_check_perm,
@@ -3698,7 +3699,7 @@ static BlockDriver bdrv_host_device = {
 
     .bdrv_co_truncate                   = raw_co_truncate,
     .bdrv_co_getlength                  = raw_co_getlength,
-    .bdrv_get_info = raw_get_info,
+    .bdrv_co_get_info                   = raw_co_get_info,
     .bdrv_co_get_allocated_file_size    = raw_co_get_allocated_file_size,
     .bdrv_get_specific_stats = hdev_get_specific_stats,
     .bdrv_check_perm = raw_check_perm,
diff --git a/block/io.c b/block/io.c
index fdc5ba9fb6..c43637f5c1 100644
--- a/block/io.c
+++ b/block/io.c
@@ -721,14 +721,14 @@ BdrvTrackedRequest *coroutine_fn bdrv_co_get_self_request(BlockDriverState *bs)
 /**
  * Round a region to cluster boundaries
  */
-void bdrv_round_to_clusters(BlockDriverState *bs,
+void coroutine_fn bdrv_round_to_clusters(BlockDriverState *bs,
                             int64_t offset, int64_t bytes,
                             int64_t *cluster_offset,
                             int64_t *cluster_bytes)
 {
     BlockDriverInfo bdi;
     IO_CODE();
-    if (bdrv_get_info(bs, &bdi) < 0 || bdi.cluster_size == 0) {
+    if (bdrv_co_get_info(bs, &bdi) < 0 || bdi.cluster_size == 0) {
         *cluster_offset = offset;
         *cluster_bytes = bytes;
     } else {
@@ -738,12 +738,12 @@ void bdrv_round_to_clusters(BlockDriverState *bs,
     }
 }
 
-static int bdrv_get_cluster_size(BlockDriverState *bs)
+static coroutine_fn int bdrv_get_cluster_size(BlockDriverState *bs)
 {
     BlockDriverInfo bdi;
     int ret;
 
-    ret = bdrv_get_info(bs, &bdi);
+    ret = bdrv_co_get_info(bs, &bdi);
     if (ret < 0 || bdi.cluster_size == 0) {
         return bs->bl.request_alignment;
     } else {
diff --git a/block/iscsi.c b/block/iscsi.c
index df110dd1d2..b17b86cffd 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -2170,7 +2170,8 @@ static int coroutine_fn iscsi_co_truncate(BlockDriverState *bs, int64_t offset,
     return 0;
 }
 
-static int iscsi_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
+static int coroutine_fn
+iscsi_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     IscsiLun *iscsilun = bs->opaque;
     bdi->cluster_size = iscsilun->cluster_size;
@@ -2434,7 +2435,7 @@ static BlockDriver bdrv_iscsi = {
     .bdrv_co_invalidate_cache = iscsi_co_invalidate_cache,
 
     .bdrv_co_getlength   = iscsi_co_getlength,
-    .bdrv_get_info   = iscsi_get_info,
+    .bdrv_co_get_info    = iscsi_co_get_info,
     .bdrv_co_truncate    = iscsi_co_truncate,
     .bdrv_refresh_limits = iscsi_refresh_limits,
 
@@ -2473,7 +2474,7 @@ static BlockDriver bdrv_iser = {
     .bdrv_co_invalidate_cache  = iscsi_co_invalidate_cache,
 
     .bdrv_co_getlength   = iscsi_co_getlength,
-    .bdrv_get_info   = iscsi_get_info,
+    .bdrv_co_get_info    = iscsi_co_get_info,
     .bdrv_co_truncate    = iscsi_co_truncate,
     .bdrv_refresh_limits = iscsi_refresh_limits,
 
diff --git a/block/mirror.c b/block/mirror.c
index c7d7ce2f8f..26db3ad0d7 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -956,7 +956,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
      */
     bdrv_get_backing_filename(target_bs, backing_filename,
                               sizeof(backing_filename));
-    if (!bdrv_get_info(target_bs, &bdi) && bdi.cluster_size) {
+    if (!bdrv_co_get_info(target_bs, &bdi) && bdi.cluster_size) {
         s->target_cluster_size = bdi.cluster_size;
     } else {
         s->target_cluster_size = BDRV_SECTOR_SIZE;
diff --git a/block/qcow.c b/block/qcow.c
index 5d99f00411..5f0801f545 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -1129,7 +1129,8 @@ fail:
     return ret;
 }
 
-static int qcow_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
+static int coroutine_fn
+qcow_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     BDRVQcowState *s = bs->opaque;
     bdi->cluster_size = s->cluster_size;
@@ -1198,7 +1199,7 @@ static BlockDriver bdrv_qcow = {
 
     .bdrv_make_empty        = qcow_make_empty,
     .bdrv_co_pwritev_compressed = qcow_co_pwritev_compressed,
-    .bdrv_get_info          = qcow_get_info,
+    .bdrv_co_get_info       = qcow_co_get_info,
 
     .create_opts            = &qcow_create_opts,
     .strong_runtime_opts    = qcow_strong_runtime_opts,
diff --git a/block/qcow2.c b/block/qcow2.c
index bafbd077b9..460579b70a 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5142,7 +5142,8 @@ err:
     return NULL;
 }
 
-static int qcow2_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
+static int coroutine_fn
+qcow2_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     BDRVQcow2State *s = bs->opaque;
     bdi->cluster_size = s->cluster_size;
@@ -6076,7 +6077,7 @@ BlockDriver bdrv_qcow2 = {
     .bdrv_snapshot_list     = qcow2_snapshot_list,
     .bdrv_snapshot_load_tmp = qcow2_snapshot_load_tmp,
     .bdrv_measure           = qcow2_measure,
-    .bdrv_get_info          = qcow2_get_info,
+    .bdrv_co_get_info       = qcow2_co_get_info,
     .bdrv_get_specific_info = qcow2_get_specific_info,
 
     .bdrv_save_vmstate    = qcow2_save_vmstate,
diff --git a/block/qed.c b/block/qed.c
index 16bf0cb080..4473465bba 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -1486,7 +1486,8 @@ static int64_t coroutine_fn bdrv_qed_co_getlength(BlockDriverState *bs)
     return s->header.image_size;
 }
 
-static int bdrv_qed_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
+static int coroutine_fn
+bdrv_qed_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     BDRVQEDState *s = bs->opaque;
 
@@ -1654,7 +1655,7 @@ static BlockDriver bdrv_qed = {
     .bdrv_co_pwrite_zeroes    = bdrv_qed_co_pwrite_zeroes,
     .bdrv_co_truncate         = bdrv_qed_co_truncate,
     .bdrv_co_getlength        = bdrv_qed_co_getlength,
-    .bdrv_get_info            = bdrv_qed_get_info,
+    .bdrv_co_get_info         = bdrv_qed_co_get_info,
     .bdrv_refresh_limits      = bdrv_qed_refresh_limits,
     .bdrv_change_backing_file = bdrv_qed_change_backing_file,
     .bdrv_co_invalidate_cache = bdrv_qed_co_invalidate_cache,
diff --git a/block/raw-format.c b/block/raw-format.c
index ccf23fe0b2..08f5c74838 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -367,9 +367,10 @@ static BlockMeasureInfo *raw_measure(QemuOpts *opts, BlockDriverState *in_bs,
     return info;
 }
 
-static int raw_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
+static int coroutine_fn
+raw_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
-    return bdrv_get_info(bs->file->bs, bdi);
+    return bdrv_co_get_info(bs->file->bs, bdi);
 }
 
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
@@ -625,7 +626,7 @@ BlockDriver bdrv_raw = {
     .is_format            = true,
     .has_variable_length  = true,
     .bdrv_measure         = &raw_measure,
-    .bdrv_get_info        = &raw_get_info,
+    .bdrv_co_get_info     = &raw_co_get_info,
     .bdrv_refresh_limits  = &raw_refresh_limits,
     .bdrv_probe_blocksizes = &raw_probe_blocksizes,
     .bdrv_probe_geometry  = &raw_probe_geometry,
diff --git a/block/rbd.c b/block/rbd.c
index c67d30160a..2c03ab8408 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1239,7 +1239,8 @@ coroutine_fn qemu_rbd_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
 }
 #endif
 
-static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
+static int coroutine_fn
+qemu_rbd_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     BDRVRBDState *s = bs->opaque;
     bdi->cluster_size = s->object_size;
@@ -1650,7 +1651,7 @@ static BlockDriver bdrv_rbd = {
     .bdrv_co_create         = qemu_rbd_co_create,
     .bdrv_co_create_opts    = qemu_rbd_co_create_opts,
     .bdrv_has_zero_init     = bdrv_has_zero_init_1,
-    .bdrv_get_info          = qemu_rbd_getinfo,
+    .bdrv_co_get_info       = qemu_rbd_co_get_info,
     .bdrv_get_specific_info = qemu_rbd_get_specific_info,
     .create_opts            = &qemu_rbd_create_opts,
     .bdrv_co_getlength      = qemu_rbd_co_getlength,
diff --git a/block/vdi.c b/block/vdi.c
index 479bcfe820..9c8736b26f 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -327,9 +327,10 @@ static int coroutine_fn vdi_co_check(BlockDriverState *bs, BdrvCheckResult *res,
     return 0;
 }
 
-static int vdi_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
+static int coroutine_fn
+vdi_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
-    /* TODO: vdi_get_info would be needed for machine snapshots.
+    /* TODO: vdi_co_get_info would be needed for machine snapshots.
        vm_state_offset is still missing. */
     BDRVVdiState *s = (BDRVVdiState *)bs->opaque;
     logout("\n");
@@ -1049,7 +1050,7 @@ static BlockDriver bdrv_vdi = {
     .bdrv_co_pwritev    = vdi_co_pwritev,
 #endif
 
-    .bdrv_get_info = vdi_get_info,
+    .bdrv_co_get_info = vdi_co_get_info,
 
     .is_format = true,
     .create_opts = &vdi_create_opts,
diff --git a/block/vhdx.c b/block/vhdx.c
index 4c929800fe..ef1f65d917 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -1161,7 +1161,8 @@ static void vhdx_block_translate(BDRVVHDXState *s, int64_t sector_num,
 }
 
 
-static int vhdx_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
+static int coroutine_fn
+vhdx_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     BDRVVHDXState *s = bs->opaque;
 
@@ -2245,7 +2246,7 @@ static BlockDriver bdrv_vhdx = {
     .bdrv_co_writev         = vhdx_co_writev,
     .bdrv_co_create         = vhdx_co_create,
     .bdrv_co_create_opts    = vhdx_co_create_opts,
-    .bdrv_get_info          = vhdx_get_info,
+    .bdrv_co_get_info       = vhdx_co_get_info,
     .bdrv_co_check          = vhdx_co_check,
     .bdrv_has_zero_init     = vhdx_has_zero_init,
 
diff --git a/block/vmdk.c b/block/vmdk.c
index 04f50d2e49..1bba61ad7d 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -3012,7 +3012,8 @@ static bool vmdk_extents_type_eq(const VmdkExtent *a, const VmdkExtent *b)
            (a->flat || a->cluster_sectors == b->cluster_sectors);
 }
 
-static int vmdk_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
+static int coroutine_fn
+vmdk_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     int i;
     BDRVVmdkState *s = bs->opaque;
@@ -3129,7 +3130,7 @@ static BlockDriver bdrv_vmdk = {
     .bdrv_has_zero_init           = vmdk_has_zero_init,
     .bdrv_get_specific_info       = vmdk_get_specific_info,
     .bdrv_refresh_limits          = vmdk_refresh_limits,
-    .bdrv_get_info                = vmdk_get_info,
+    .bdrv_co_get_info             = vmdk_co_get_info,
     .bdrv_gather_child_options    = vmdk_gather_child_options,
 
     .is_format                    = true,
diff --git a/block/vpc.c b/block/vpc.c
index 6ee95dcb96..cfdea7db80 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -598,7 +598,8 @@ fail:
     return ret;
 }
 
-static int vpc_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
+static int coroutine_fn
+vpc_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     BDRVVPCState *s = (BDRVVPCState *)bs->opaque;
 
@@ -1240,7 +1241,7 @@ static BlockDriver bdrv_vpc = {
     .bdrv_co_pwritev            = vpc_co_pwritev,
     .bdrv_co_block_status       = vpc_co_block_status,
 
-    .bdrv_get_info          = vpc_get_info,
+    .bdrv_co_get_info       = vpc_co_get_info,
 
     .is_format              = true,
     .create_opts            = &vpc_create_opts,
-- 
2.38.1


