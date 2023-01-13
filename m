Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 851E366A43F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 21:43:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGQt3-000070-6Z; Fri, 13 Jan 2023 15:42:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGQt0-00005t-JP
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:42:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGQsy-0006CS-B9
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:42:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673642567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dh+y4/C7RIJtnMBasw9aix/sWKPREPMgdAW5/aFDiKk=;
 b=hPrm8hamdwGJ/FdYcubloQszwRoc+w74gY0XmDQ15UPskVa4ZjQ3mEeJSS6C5j3S9yuosI
 18mgDcHwGeuq2pNH9+iavGFrpIFkIwgdC92mO7vyXDsOF0C8vP2S5jeb5kC+nqvlSFy0s1
 tSYc0L7EYt8qORm27vfiEAOGXQioyew=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-cC8IKU7fMFSnMoZueYBplQ-1; Fri, 13 Jan 2023 15:42:44 -0500
X-MC-Unique: cC8IKU7fMFSnMoZueYBplQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57C731C01B21;
 Fri, 13 Jan 2023 20:42:44 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 260392026D68;
 Fri, 13 Jan 2023 20:42:43 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH v2 09/14] block: Convert bdrv_get_allocated_file_size() to
 co_wrapper
Date: Fri, 13 Jan 2023 21:42:07 +0100
Message-Id: <20230113204212.359076-10-kwolf@redhat.com>
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

bdrv_get_allocated_file_size() is categorized as an I/O function, and it
currently doesn't run in a coroutine. We should let it take a graph
rdlock since it traverses the block nodes graph, which however is only
possible in a coroutine.

Therefore turn it into a co_wrapper to move the actual function into a
coroutine where the lock can be taken.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h         |  4 +++-
 include/block/block_int-common.h |  4 +++-
 block.c                          | 12 ++++++------
 block/file-posix.c               | 14 +++++---------
 block/file-win32.c               | 10 ++++------
 block/gluster.c                  | 11 ++++++-----
 block/nfs.c                      |  4 ++--
 block/null.c                     |  7 ++++---
 block/qcow2-refcount.c           |  2 +-
 block/vmdk.c                     |  9 +++++----
 10 files changed, 39 insertions(+), 38 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 4dcb5f73fa..0718554590 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -79,7 +79,9 @@ int64_t co_wrapper_mixed bdrv_nb_sectors(BlockDriverState *bs);
 int64_t coroutine_fn bdrv_co_getlength(BlockDriverState *bs);
 int64_t co_wrapper_mixed bdrv_getlength(BlockDriverState *bs);
 
-int64_t bdrv_get_allocated_file_size(BlockDriverState *bs);
+int64_t coroutine_fn bdrv_co_get_allocated_file_size(BlockDriverState *bs);
+int64_t co_wrapper bdrv_get_allocated_file_size(BlockDriverState *bs);
+
 BlockMeasureInfo *bdrv_measure(BlockDriver *drv, QemuOpts *opts,
                                BlockDriverState *in_bs, Error **errp);
 void bdrv_get_geometry(BlockDriverState *bs, uint64_t *nb_sectors_ptr);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 6336c7239a..cc03c599e7 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -685,7 +685,9 @@ struct BlockDriver {
                                          bool exact, PreallocMode prealloc,
                                          BdrvRequestFlags flags, Error **errp);
     int64_t coroutine_fn (*bdrv_co_getlength)(BlockDriverState *bs);
-    int64_t (*bdrv_get_allocated_file_size)(BlockDriverState *bs);
+    int64_t coroutine_fn (*bdrv_co_get_allocated_file_size)(
+        BlockDriverState *bs);
+
     BlockMeasureInfo *(*bdrv_measure)(QemuOpts *opts, BlockDriverState *in_bs,
                                       Error **errp);
 
diff --git a/block.c b/block.c
index dd22a206f9..82c6cb6dcd 100644
--- a/block.c
+++ b/block.c
@@ -5719,7 +5719,7 @@ exit:
 }
 
 /**
- * Implementation of BlockDriver.bdrv_get_allocated_file_size() that
+ * Implementation of BlockDriver.bdrv_co_get_allocated_file_size() that
  * sums the size of all data-bearing children.  (This excludes backing
  * children.)
  */
@@ -5732,7 +5732,7 @@ static int64_t bdrv_sum_allocated_file_size(BlockDriverState *bs)
         if (child->role & (BDRV_CHILD_DATA | BDRV_CHILD_METADATA |
                            BDRV_CHILD_FILTERED))
         {
-            child_size = bdrv_get_allocated_file_size(child->bs);
+            child_size = bdrv_co_get_allocated_file_size(child->bs);
             if (child_size < 0) {
                 return child_size;
             }
@@ -5747,7 +5747,7 @@ static int64_t bdrv_sum_allocated_file_size(BlockDriverState *bs)
  * Length of a allocated file in bytes. Sparse files are counted by actual
  * allocated space. Return < 0 if error or unknown.
  */
-int64_t bdrv_get_allocated_file_size(BlockDriverState *bs)
+int64_t coroutine_fn bdrv_co_get_allocated_file_size(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
     IO_CODE();
@@ -5755,8 +5755,8 @@ int64_t bdrv_get_allocated_file_size(BlockDriverState *bs)
     if (!drv) {
         return -ENOMEDIUM;
     }
-    if (drv->bdrv_get_allocated_file_size) {
-        return drv->bdrv_get_allocated_file_size(bs);
+    if (drv->bdrv_co_get_allocated_file_size) {
+        return drv->bdrv_co_get_allocated_file_size(bs);
     }
 
     if (drv->bdrv_file_open) {
@@ -5768,7 +5768,7 @@ int64_t bdrv_get_allocated_file_size(BlockDriverState *bs)
         return -ENOTSUP;
     } else if (drv->is_filter) {
         /* Filter drivers default to the size of their filtered child */
-        return bdrv_get_allocated_file_size(bdrv_filter_bs(bs));
+        return bdrv_co_get_allocated_file_size(bdrv_filter_bs(bs));
     } else {
         /* Other drivers default to summing their children's sizes */
         return bdrv_sum_allocated_file_size(bs);
diff --git a/block/file-posix.c b/block/file-posix.c
index d70e4ec95a..a22f93e4b2 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2468,7 +2468,7 @@ static int64_t coroutine_fn raw_co_getlength(BlockDriverState *bs)
 }
 #endif
 
-static int64_t raw_get_allocated_file_size(BlockDriverState *bs)
+static int64_t coroutine_fn raw_co_get_allocated_file_size(BlockDriverState *bs)
 {
     struct stat st;
     BDRVRawState *s = bs->opaque;
@@ -3328,8 +3328,7 @@ BlockDriver bdrv_file = {
     .bdrv_co_truncate                   = raw_co_truncate,
     .bdrv_co_getlength                  = raw_co_getlength,
     .bdrv_get_info = raw_get_info,
-    .bdrv_get_allocated_file_size
-                        = raw_get_allocated_file_size,
+    .bdrv_co_get_allocated_file_size    = raw_co_get_allocated_file_size,
     .bdrv_get_specific_stats = raw_get_specific_stats,
     .bdrv_check_perm = raw_check_perm,
     .bdrv_set_perm   = raw_set_perm,
@@ -3700,8 +3699,7 @@ static BlockDriver bdrv_host_device = {
     .bdrv_co_truncate                   = raw_co_truncate,
     .bdrv_co_getlength                  = raw_co_getlength,
     .bdrv_get_info = raw_get_info,
-    .bdrv_get_allocated_file_size
-                        = raw_get_allocated_file_size,
+    .bdrv_co_get_allocated_file_size    = raw_co_get_allocated_file_size,
     .bdrv_get_specific_stats = hdev_get_specific_stats,
     .bdrv_check_perm = raw_check_perm,
     .bdrv_set_perm   = raw_set_perm,
@@ -3824,8 +3822,7 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_co_truncate                   = raw_co_truncate,
     .bdrv_co_getlength                  = raw_co_getlength,
     .has_variable_length                = true,
-    .bdrv_get_allocated_file_size
-                        = raw_get_allocated_file_size,
+    .bdrv_co_get_allocated_file_size    = raw_co_get_allocated_file_size,
 
     /* removable device support */
     .bdrv_co_is_inserted    = cdrom_co_is_inserted,
@@ -3954,8 +3951,7 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_co_truncate                   = raw_co_truncate,
     .bdrv_co_getlength                  = raw_co_getlength,
     .has_variable_length                = true,
-    .bdrv_get_allocated_file_size
-                        = raw_get_allocated_file_size,
+    .bdrv_co_get_allocated_file_size    = raw_co_get_allocated_file_size,
 
     /* removable device support */
     .bdrv_co_is_inserted     = cdrom_co_is_inserted,
diff --git a/block/file-win32.c b/block/file-win32.c
index aedee695dd..6ff576b20d 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -558,7 +558,7 @@ static int64_t coroutine_fn raw_co_getlength(BlockDriverState *bs)
     return l.QuadPart;
 }
 
-static int64_t raw_get_allocated_file_size(BlockDriverState *bs)
+static int64_t coroutine_fn raw_co_get_allocated_file_size(BlockDriverState *bs)
 {
     typedef DWORD (WINAPI * get_compressed_t)(const char *filename,
                                               DWORD * high);
@@ -764,8 +764,8 @@ BlockDriver bdrv_file = {
 
     .bdrv_co_truncate   = raw_co_truncate,
     .bdrv_co_getlength  = raw_co_getlength,
-    .bdrv_get_allocated_file_size
-                        = raw_get_allocated_file_size,
+    .bdrv_co_get_allocated_file_size
+                        = raw_co_get_allocated_file_size,
 
     .create_opts        = &raw_create_opts,
 };
@@ -934,9 +934,7 @@ static BlockDriver bdrv_host_device = {
 
     .bdrv_co_getlength                = raw_co_getlength,
     .has_variable_length              = true,
-
-    .bdrv_get_allocated_file_size
-                        = raw_get_allocated_file_size,
+    .bdrv_co_get_allocated_file_size  = raw_co_get_allocated_file_size,
 };
 
 static void bdrv_file_init(void)
diff --git a/block/gluster.c b/block/gluster.c
index 469cdf01d4..7b4e1dd795 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -1330,7 +1330,8 @@ static int64_t coroutine_fn qemu_gluster_co_getlength(BlockDriverState *bs)
     }
 }
 
-static int64_t qemu_gluster_allocated_file_size(BlockDriverState *bs)
+static int64_t coroutine_fn
+qemu_gluster_co_get_allocated_file_size(BlockDriverState *bs)
 {
     BDRVGlusterState *s = bs->opaque;
     struct stat st;
@@ -1559,7 +1560,7 @@ static BlockDriver bdrv_gluster = {
     .bdrv_co_create               = qemu_gluster_co_create,
     .bdrv_co_create_opts          = qemu_gluster_co_create_opts,
     .bdrv_co_getlength            = qemu_gluster_co_getlength,
-    .bdrv_get_allocated_file_size = qemu_gluster_allocated_file_size,
+    .bdrv_co_get_allocated_file_size = qemu_gluster_co_get_allocated_file_size,
     .bdrv_co_truncate             = qemu_gluster_co_truncate,
     .bdrv_co_readv                = qemu_gluster_co_readv,
     .bdrv_co_writev               = qemu_gluster_co_writev,
@@ -1588,7 +1589,7 @@ static BlockDriver bdrv_gluster_tcp = {
     .bdrv_co_create               = qemu_gluster_co_create,
     .bdrv_co_create_opts          = qemu_gluster_co_create_opts,
     .bdrv_co_getlength            = qemu_gluster_co_getlength,
-    .bdrv_get_allocated_file_size = qemu_gluster_allocated_file_size,
+    .bdrv_co_get_allocated_file_size = qemu_gluster_co_get_allocated_file_size,
     .bdrv_co_truncate             = qemu_gluster_co_truncate,
     .bdrv_co_readv                = qemu_gluster_co_readv,
     .bdrv_co_writev               = qemu_gluster_co_writev,
@@ -1617,7 +1618,7 @@ static BlockDriver bdrv_gluster_unix = {
     .bdrv_co_create               = qemu_gluster_co_create,
     .bdrv_co_create_opts          = qemu_gluster_co_create_opts,
     .bdrv_co_getlength            = qemu_gluster_co_getlength,
-    .bdrv_get_allocated_file_size = qemu_gluster_allocated_file_size,
+    .bdrv_co_get_allocated_file_size = qemu_gluster_co_get_allocated_file_size,
     .bdrv_co_truncate             = qemu_gluster_co_truncate,
     .bdrv_co_readv                = qemu_gluster_co_readv,
     .bdrv_co_writev               = qemu_gluster_co_writev,
@@ -1652,7 +1653,7 @@ static BlockDriver bdrv_gluster_rdma = {
     .bdrv_co_create               = qemu_gluster_co_create,
     .bdrv_co_create_opts          = qemu_gluster_co_create_opts,
     .bdrv_co_getlength            = qemu_gluster_co_getlength,
-    .bdrv_get_allocated_file_size = qemu_gluster_allocated_file_size,
+    .bdrv_co_get_allocated_file_size = qemu_gluster_co_get_allocated_file_size,
     .bdrv_co_truncate             = qemu_gluster_co_truncate,
     .bdrv_co_readv                = qemu_gluster_co_readv,
     .bdrv_co_writev               = qemu_gluster_co_writev,
diff --git a/block/nfs.c b/block/nfs.c
index ece22353ac..cbf742661e 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -731,7 +731,7 @@ nfs_get_allocated_file_size_cb(int ret, struct nfs_context *nfs, void *data,
     bdrv_wakeup(task->bs);
 }
 
-static int64_t nfs_get_allocated_file_size(BlockDriverState *bs)
+static int64_t coroutine_fn nfs_co_get_allocated_file_size(BlockDriverState *bs)
 {
     NFSClient *client = bs->opaque;
     NFSRPC task = {0};
@@ -884,7 +884,7 @@ static BlockDriver bdrv_nfs = {
     .bdrv_has_zero_init             = nfs_has_zero_init,
 /* libnfs does not provide the allocated filesize of a file on win32. */
 #if !defined(_WIN32)
-    .bdrv_get_allocated_file_size   = nfs_get_allocated_file_size,
+    .bdrv_co_get_allocated_file_size = nfs_co_get_allocated_file_size,
 #endif
     .bdrv_co_truncate               = nfs_file_co_truncate,
 
diff --git a/block/null.c b/block/null.c
index 05dde6d9ab..aa5931effa 100644
--- a/block/null.c
+++ b/block/null.c
@@ -264,7 +264,8 @@ static void null_refresh_filename(BlockDriverState *bs)
              bs->drv->format_name);
 }
 
-static int64_t null_allocated_file_size(BlockDriverState *bs)
+static int64_t coroutine_fn
+null_co_get_allocated_file_size(BlockDriverState *bs)
 {
     return 0;
 }
@@ -284,7 +285,7 @@ static BlockDriver bdrv_null_co = {
     .bdrv_file_open         = null_file_open,
     .bdrv_parse_filename    = null_co_parse_filename,
     .bdrv_co_getlength      = null_co_getlength,
-    .bdrv_get_allocated_file_size = null_allocated_file_size,
+    .bdrv_co_get_allocated_file_size = null_co_get_allocated_file_size,
 
     .bdrv_co_preadv         = null_co_preadv,
     .bdrv_co_pwritev        = null_co_pwritev,
@@ -305,7 +306,7 @@ static BlockDriver bdrv_null_aio = {
     .bdrv_file_open         = null_file_open,
     .bdrv_parse_filename    = null_aio_parse_filename,
     .bdrv_co_getlength      = null_co_getlength,
-    .bdrv_get_allocated_file_size = null_allocated_file_size,
+    .bdrv_co_get_allocated_file_size = null_co_get_allocated_file_size,
 
     .bdrv_aio_preadv        = null_aio_preadv,
     .bdrv_aio_pwritev       = null_aio_pwritev,
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 81264740f0..487681d85e 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -3719,7 +3719,7 @@ int coroutine_fn qcow2_detect_metadata_preallocation(BlockDriverState *bs)
         return file_length;
     }
 
-    real_allocation = bdrv_get_allocated_file_size(bs->file->bs);
+    real_allocation = bdrv_co_get_allocated_file_size(bs->file->bs);
     if (real_allocation < 0) {
         return real_allocation;
     }
diff --git a/block/vmdk.c b/block/vmdk.c
index 8894dac2d4..04f50d2e49 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2856,14 +2856,15 @@ static void vmdk_close(BlockDriverState *bs)
     error_free(s->migration_blocker);
 }
 
-static int64_t vmdk_get_allocated_file_size(BlockDriverState *bs)
+static int64_t coroutine_fn
+vmdk_co_get_allocated_file_size(BlockDriverState *bs)
 {
     int i;
     int64_t ret = 0;
     int64_t r;
     BDRVVmdkState *s = bs->opaque;
 
-    ret = bdrv_get_allocated_file_size(bs->file->bs);
+    ret = bdrv_co_get_allocated_file_size(bs->file->bs);
     if (ret < 0) {
         return ret;
     }
@@ -2871,7 +2872,7 @@ static int64_t vmdk_get_allocated_file_size(BlockDriverState *bs)
         if (s->extents[i].file == bs->file) {
             continue;
         }
-        r = bdrv_get_allocated_file_size(s->extents[i].file->bs);
+        r = bdrv_co_get_allocated_file_size(s->extents[i].file->bs);
         if (r < 0) {
             return r;
         }
@@ -3124,7 +3125,7 @@ static BlockDriver bdrv_vmdk = {
     .bdrv_co_create_opts          = vmdk_co_create_opts,
     .bdrv_co_create               = vmdk_co_create,
     .bdrv_co_block_status         = vmdk_co_block_status,
-    .bdrv_get_allocated_file_size = vmdk_get_allocated_file_size,
+    .bdrv_co_get_allocated_file_size = vmdk_co_get_allocated_file_size,
     .bdrv_has_zero_init           = vmdk_has_zero_init,
     .bdrv_get_specific_info       = vmdk_get_specific_info,
     .bdrv_refresh_limits          = vmdk_refresh_limits,
-- 
2.38.1


