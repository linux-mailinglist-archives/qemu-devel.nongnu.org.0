Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3EF6A0FDC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:55:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGiE-0007Ix-Kg; Thu, 23 Feb 2023 13:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhk-00077P-Sl
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhi-0003Ho-OC
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2M2MMnWHpNbaUsLgPJyxj1jwZlYF526syKi6HFUx+g=;
 b=cNth8ma4SrDncj9926P1Tf9x58C+jeoTUsoUGscgC5RHUgJA+0WJvVCn+tLcTgoS2VEjBF
 nLnNeepAPB+t3763EAoaQeK3JZOKaggrpPWYVd56juDXzGcafu2LL3yLs2JKl7OqJE4TMG
 +xn9p2rTVl27ZPBHchQ73kT2s/NAazk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-smYG0xdNNmy5aiSd5XVWVw-1; Thu, 23 Feb 2023 13:52:14 -0500
X-MC-Unique: smYG0xdNNmy5aiSd5XVWVw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75BD1185A78B;
 Thu, 23 Feb 2023 18:52:06 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1EA81121314;
 Thu, 23 Feb 2023 18:52:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 16/29] block: Mark bdrv_co_create() and callers GRAPH_RDLOCK
Date: Thu, 23 Feb 2023 19:51:33 +0100
Message-Id: <20230223185146.306454-17-kwolf@redhat.com>
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
bdrv_co_create() need to hold a reader lock for the graph.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230203152202.49054-17-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-global-state.h | 14 ++++---
 include/block/block_int-common.h   | 11 +++---
 block.c                            |  1 +
 block/create.c                     |  9 ++++-
 block/crypto.c                     |  7 ++--
 block/file-posix.c                 |  7 ++--
 block/file-win32.c                 |  7 ++--
 block/parallels.c                  |  7 ++--
 block/qcow.c                       |  6 +--
 block/qcow2.c                      |  7 ++--
 block/qed.c                        |  7 ++--
 block/raw-format.c                 |  7 ++--
 block/vdi.c                        |  7 ++--
 block/vhdx.c                       |  7 ++--
 block/vmdk.c                       | 63 ++++++++++++++----------------
 block/vpc.c                        |  7 ++--
 16 files changed, 84 insertions(+), 90 deletions(-)

diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 447176414e..399200a9a3 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -58,13 +58,15 @@ BlockDriver *bdrv_find_protocol(const char *filename,
                                 Error **errp);
 BlockDriver *bdrv_find_format(const char *format_name);
 
-int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
-                                QemuOpts *opts, Error **errp);
-int co_wrapper bdrv_create(BlockDriver *drv, const char *filename,
-                           QemuOpts *opts, Error **errp);
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_create(BlockDriver *drv, const char *filename, QemuOpts *opts,
+               Error **errp);
 
-int coroutine_fn bdrv_co_create_file(const char *filename, QemuOpts *opts,
-                                     Error **errp);
+int co_wrapper_bdrv_rdlock bdrv_create(BlockDriver *drv, const char *filename,
+                                       QemuOpts *opts, Error **errp);
+
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_create_file(const char *filename, QemuOpts *opts, Error **errp);
 
 BlockDriverState *bdrv_new(void);
 int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 7d8309ba5a..6b8fd22c71 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -246,12 +246,11 @@ struct BlockDriver {
                           Error **errp);
     void (*bdrv_close)(BlockDriverState *bs);
 
-    int coroutine_fn (*bdrv_co_create)(BlockdevCreateOptions *opts,
-                                       Error **errp);
-    int coroutine_fn (*bdrv_co_create_opts)(BlockDriver *drv,
-                                            const char *filename,
-                                            QemuOpts *opts,
-                                            Error **errp);
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_create)(
+        BlockdevCreateOptions *opts, Error **errp);
+
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_create_opts)(
+        BlockDriver *drv, const char *filename, QemuOpts *opts, Error **errp);
 
     int (*bdrv_amend_options)(BlockDriverState *bs,
                               QemuOpts *opts,
diff --git a/block.c b/block.c
index 31f13092cb..484f48ae2d 100644
--- a/block.c
+++ b/block.c
@@ -533,6 +533,7 @@ int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
     int ret;
     GLOBAL_STATE_CODE();
     ERRP_GUARD();
+    assert_bdrv_graph_readable();
 
     if (!drv->bdrv_co_create_opts) {
         error_setg(errp, "Driver '%s' does not support image creation",
diff --git a/block/create.c b/block/create.c
index 4df43f11f4..bf67b9947c 100644
--- a/block/create.c
+++ b/block/create.c
@@ -43,6 +43,7 @@ static int coroutine_fn blockdev_create_run(Job *job, Error **errp)
     int ret;
 
     GLOBAL_STATE_CODE();
+    GRAPH_RDLOCK_GUARD();
 
     job_progress_set_remaining(&s->common, 1);
     ret = s->drv->bdrv_co_create(s->opts, errp);
@@ -59,6 +60,12 @@ static const JobDriver blockdev_create_job_driver = {
     .run           = blockdev_create_run,
 };
 
+/* Checking whether the function is present doesn't require the graph lock */
+static inline bool TSA_NO_TSA has_bdrv_co_create(BlockDriver *drv)
+{
+    return drv->bdrv_co_create;
+}
+
 void qmp_blockdev_create(const char *job_id, BlockdevCreateOptions *options,
                          Error **errp)
 {
@@ -79,7 +86,7 @@ void qmp_blockdev_create(const char *job_id, BlockdevCreateOptions *options,
     }
 
     /* Error out if the driver doesn't support .bdrv_co_create */
-    if (!drv->bdrv_co_create) {
+    if (!has_bdrv_co_create(drv)) {
         error_setg(errp, "Driver does not support blockdev-create");
         return;
     }
diff --git a/block/crypto.c b/block/crypto.c
index 0ebb846534..e77790ac8a 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -664,10 +664,9 @@ fail:
     return ret;
 }
 
-static int coroutine_fn block_crypto_co_create_opts_luks(BlockDriver *drv,
-                                                         const char *filename,
-                                                         QemuOpts *opts,
-                                                         Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+block_crypto_co_create_opts_luks(BlockDriver *drv, const char *filename,
+                                 QemuOpts *opts, Error **errp)
 {
     QCryptoBlockCreateOptions *create_opts = NULL;
     BlockDriverState *bs = NULL;
diff --git a/block/file-posix.c b/block/file-posix.c
index 13da095efa..5760cf22d1 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2607,10 +2607,9 @@ out:
     return result;
 }
 
-static int coroutine_fn raw_co_create_opts(BlockDriver *drv,
-                                           const char *filename,
-                                           QemuOpts *opts,
-                                           Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+raw_co_create_opts(BlockDriver *drv, const char *filename,
+                   QemuOpts *opts, Error **errp)
 {
     BlockdevCreateOptions options;
     int64_t total_size = 0;
diff --git a/block/file-win32.c b/block/file-win32.c
index 200d244116..c7d0b85306 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -613,10 +613,9 @@ static int raw_co_create(BlockdevCreateOptions *options, Error **errp)
     return 0;
 }
 
-static int coroutine_fn raw_co_create_opts(BlockDriver *drv,
-                                           const char *filename,
-                                           QemuOpts *opts,
-                                           Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+raw_co_create_opts(BlockDriver *drv, const char *filename,
+                   QemuOpts *opts, Error **errp)
 {
     BlockdevCreateOptions options;
     int64_t total_size = 0;
diff --git a/block/parallels.c b/block/parallels.c
index a7e9cad146..013684801a 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -622,10 +622,9 @@ exit:
     goto out;
 }
 
-static int coroutine_fn parallels_co_create_opts(BlockDriver *drv,
-                                                 const char *filename,
-                                                 QemuOpts *opts,
-                                                 Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+parallels_co_create_opts(BlockDriver *drv, const char *filename,
+                         QemuOpts *opts, Error **errp)
 {
     BlockdevCreateOptions *create_options = NULL;
     BlockDriverState *bs = NULL;
diff --git a/block/qcow.c b/block/qcow.c
index 58a0b4e2f0..490e4f819e 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -921,9 +921,9 @@ exit:
     return ret;
 }
 
-static int coroutine_fn qcow_co_create_opts(BlockDriver *drv,
-                                            const char *filename,
-                                            QemuOpts *opts, Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+qcow_co_create_opts(BlockDriver *drv, const char *filename,
+                    QemuOpts *opts, Error **errp)
 {
     BlockdevCreateOptions *create_options = NULL;
     BlockDriverState *bs = NULL;
diff --git a/block/qcow2.c b/block/qcow2.c
index c318f41f38..30fd53fa64 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3816,10 +3816,9 @@ out:
     return ret;
 }
 
-static int coroutine_fn qcow2_co_create_opts(BlockDriver *drv,
-                                             const char *filename,
-                                             QemuOpts *opts,
-                                             Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+qcow2_co_create_opts(BlockDriver *drv, const char *filename, QemuOpts *opts,
+                     Error **errp)
 {
     BlockdevCreateOptions *create_options = NULL;
     QDict *qdict;
diff --git a/block/qed.c b/block/qed.c
index c969b31e2c..ed94bb61ca 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -754,10 +754,9 @@ out:
     return ret;
 }
 
-static int coroutine_fn bdrv_qed_co_create_opts(BlockDriver *drv,
-                                                const char *filename,
-                                                QemuOpts *opts,
-                                                Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_qed_co_create_opts(BlockDriver *drv, const char *filename,
+                        QemuOpts *opts, Error **errp)
 {
     BlockdevCreateOptions *create_options = NULL;
     QDict *qdict;
diff --git a/block/raw-format.c b/block/raw-format.c
index 9913cb8174..646606e223 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -430,10 +430,9 @@ static int raw_has_zero_init(BlockDriverState *bs)
     return bdrv_has_zero_init(bs->file->bs);
 }
 
-static int coroutine_fn raw_co_create_opts(BlockDriver *drv,
-                                           const char *filename,
-                                           QemuOpts *opts,
-                                           Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+raw_co_create_opts(BlockDriver *drv, const char *filename,
+                   QemuOpts *opts, Error **errp)
 {
     return bdrv_co_create_file(filename, opts, errp);
 }
diff --git a/block/vdi.c b/block/vdi.c
index b50c0b7277..f2434d6153 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -898,10 +898,9 @@ static int coroutine_fn vdi_co_create(BlockdevCreateOptions *create_options,
     return vdi_co_do_create(create_options, DEFAULT_CLUSTER_SIZE, errp);
 }
 
-static int coroutine_fn vdi_co_create_opts(BlockDriver *drv,
-                                           const char *filename,
-                                           QemuOpts *opts,
-                                           Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+vdi_co_create_opts(BlockDriver *drv, const char *filename,
+                   QemuOpts *opts, Error **errp)
 {
     QDict *qdict = NULL;
     BlockdevCreateOptions *create_options = NULL;
diff --git a/block/vhdx.c b/block/vhdx.c
index ffa4455e82..81420722a1 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -2059,10 +2059,9 @@ delete_and_exit:
     return ret;
 }
 
-static int coroutine_fn vhdx_co_create_opts(BlockDriver *drv,
-                                            const char *filename,
-                                            QemuOpts *opts,
-                                            Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+vhdx_co_create_opts(BlockDriver *drv, const char *filename,
+                    QemuOpts *opts, Error **errp)
 {
     BlockdevCreateOptions *create_options = NULL;
     QDict *qdict;
diff --git a/block/vmdk.c b/block/vmdk.c
index c601ca85f4..f5f49018fe 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2277,11 +2277,10 @@ exit:
     return ret;
 }
 
-static int coroutine_fn vmdk_create_extent(const char *filename,
-                                           int64_t filesize, bool flat,
-                                           bool compress, bool zeroed_grain,
-                                           BlockBackend **pbb,
-                                           QemuOpts *opts, Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+vmdk_create_extent(const char *filename, int64_t filesize, bool flat,
+                   bool compress, bool zeroed_grain, BlockBackend **pbb,
+                   QemuOpts *opts, Error **errp)
 {
     int ret;
     BlockBackend *blk = NULL;
@@ -2359,14 +2358,10 @@ static int filename_decompose(const char *filename, char *path, char *prefix,
  *           non-split format.
  * idx >= 1: get the n-th extent if in a split subformat
  */
-typedef BlockBackend * coroutine_fn (*vmdk_create_extent_fn)(int64_t size,
-                                                             int idx,
-                                                             bool flat,
-                                                             bool split,
-                                                             bool compress,
-                                                             bool zeroed_grain,
-                                                             void *opaque,
-                                                             Error **errp);
+typedef BlockBackend * coroutine_fn /* GRAPH_RDLOCK */
+    (*vmdk_create_extent_fn)(int64_t size, int idx, bool flat, bool split,
+                             bool compress, bool zeroed_grain, void *opaque,
+                             Error **errp);
 
 static void vmdk_desc_add_extent(GString *desc,
                                  const char *extent_line_fmt,
@@ -2379,17 +2374,18 @@ static void vmdk_desc_add_extent(GString *desc,
     g_free(basename);
 }
 
-static int coroutine_fn vmdk_co_do_create(int64_t size,
-                                          BlockdevVmdkSubformat subformat,
-                                          BlockdevVmdkAdapterType adapter_type,
-                                          const char *backing_file,
-                                          const char *hw_version,
-                                          const char *toolsversion,
-                                          bool compat6,
-                                          bool zeroed_grain,
-                                          vmdk_create_extent_fn extent_fn,
-                                          void *opaque,
-                                          Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+vmdk_co_do_create(int64_t size,
+                  BlockdevVmdkSubformat subformat,
+                  BlockdevVmdkAdapterType adapter_type,
+                  const char *backing_file,
+                  const char *hw_version,
+                  const char *toolsversion,
+                  bool compat6,
+                  bool zeroed_grain,
+                  vmdk_create_extent_fn extent_fn,
+                  void *opaque,
+                  Error **errp)
 {
     int extent_idx;
     BlockBackend *blk = NULL;
@@ -2609,10 +2605,10 @@ typedef struct {
     QemuOpts *opts;
 } VMDKCreateOptsData;
 
-static BlockBackend * coroutine_fn vmdk_co_create_opts_cb(int64_t size, int idx,
-                                            bool flat, bool split, bool compress,
-                                            bool zeroed_grain, void *opaque,
-                                            Error **errp)
+static BlockBackend * coroutine_fn GRAPH_RDLOCK
+vmdk_co_create_opts_cb(int64_t size, int idx, bool flat, bool split,
+                       bool compress, bool zeroed_grain, void *opaque,
+                       Error **errp)
 {
     BlockBackend *blk = NULL;
     BlockDriverState *bs = NULL;
@@ -2651,10 +2647,9 @@ exit:
     return blk;
 }
 
-static int coroutine_fn vmdk_co_create_opts(BlockDriver *drv,
-                                            const char *filename,
-                                            QemuOpts *opts,
-                                            Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+vmdk_co_create_opts(BlockDriver *drv, const char *filename,
+                    QemuOpts *opts, Error **errp)
 {
     Error *local_err = NULL;
     char *desc = NULL;
@@ -2814,8 +2809,8 @@ static BlockBackend * coroutine_fn vmdk_co_create_cb(int64_t size, int idx,
     return blk;
 }
 
-static int coroutine_fn vmdk_co_create(BlockdevCreateOptions *create_options,
-                                       Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+vmdk_co_create(BlockdevCreateOptions *create_options, Error **errp)
 {
     BlockdevCreateOptionsVmdk *opts;
 
diff --git a/block/vpc.c b/block/vpc.c
index 1f0f26c0c4..b89b0ff8e2 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -1087,10 +1087,9 @@ out:
     return ret;
 }
 
-static int coroutine_fn vpc_co_create_opts(BlockDriver *drv,
-                                           const char *filename,
-                                           QemuOpts *opts,
-                                           Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+vpc_co_create_opts(BlockDriver *drv, const char *filename,
+                   QemuOpts *opts, Error **errp)
 {
     BlockdevCreateOptions *create_options = NULL;
     QDict *qdict;
-- 
2.39.2


