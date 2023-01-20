Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC96675461
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:28:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqUE-000372-9Q; Fri, 20 Jan 2023 07:27:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqU6-0002sN-QO
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqU1-0000Mv-8m
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ChDy4mIiyIvqxv+Kc04UwWfGHkRUcuTT06oxRedmnU=;
 b=acdqJlZFchsgXbZ7iOQw5/olWA/gtCsUr3i8utyAWEAioLsh14+NZqysZUDikNQPcZs6B0
 qt0qkl0W6PAH4y68FMANH8j3fA8VbT7dKNmVTnZiaPMAZGHq+v4wbFjuAn+D1sD+RPZ+WG
 o1YS3EyNdfOiXmEHcmgN4yjulV9ttIg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-Qe7krEtgPQCHKOqI1XY-UA-1; Fri, 20 Jan 2023 07:26:56 -0500
X-MC-Unique: Qe7krEtgPQCHKOqI1XY-UA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D78332801E50;
 Fri, 20 Jan 2023 12:26:55 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD86840C6EC4;
 Fri, 20 Jan 2023 12:26:54 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 17/38] block: Convert bdrv_refresh_total_sectors() to
 co_wrapper_mixed
Date: Fri, 20 Jan 2023 13:26:12 +0100
Message-Id: <20230120122633.84983-18-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

BlockDriver->bdrv_getlength is categorized as IO callback, and it
currently doesn't run in a coroutine. We should let it take a graph
rdlock since the callback traverses the block nodes graph, which however
is only possible in a coroutine.

Therefore turn it into a co_wrapper to move the actual function into a
coroutine where the lock can be taken.

Because now this function creates a new coroutine and polls, we need to
take the AioContext lock where it is missing, for the only reason that
internally co_wrapper calls AIO_WAIT_WHILE and it expects to release the
AioContext lock.

This is especially messy when a co_wrapper creates a coroutine and polls
in bdrv_open_driver, because this function has so many callers in so
many context that it can easily lead to deadlocks. Therefore the new
rule for bdrv_open_driver is that the caller must always hold the
AioContext lock of the given bs (except if it is a coroutine), because
the function calls bdrv_refresh_total_sectors() which is now a
co_wrapper.

Once the rwlock is ultimated and placed in every place it needs to be,
we will poll using AIO_WAIT_WHILE_UNLOCKED and remove the AioContext
lock.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230113204212.359076-7-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h          |  8 ++++--
 include/block/block_int-common.h  |  2 +-
 include/block/block_int-io.h      |  5 +++-
 include/sysemu/block-backend-io.h | 10 ++++++--
 block.c                           | 32 +++++++++++++++++------
 block/blkdebug.c                  |  6 ++---
 block/blkio.c                     |  6 ++---
 block/blklogwrites.c              |  6 ++---
 block/blkreplay.c                 |  6 ++---
 block/blkverify.c                 |  6 ++---
 block/block-backend.c             | 10 +++++---
 block/commit.c                    |  4 +--
 block/copy-on-read.c              |  6 ++---
 block/crypto.c                    |  6 ++---
 block/curl.c                      | 10 ++++----
 block/file-posix.c                | 42 +++++++++++++++----------------
 block/file-win32.c                |  8 +++---
 block/filter-compress.c           |  6 ++---
 block/gluster.c                   | 12 ++++-----
 block/iscsi.c                     | 10 ++++----
 block/mirror.c                    |  4 +--
 block/nbd.c                       |  8 +++---
 block/null.c                      |  6 ++---
 block/nvme.c                      |  6 ++---
 block/preallocate.c               | 10 ++++----
 block/qed.c                       |  4 +--
 block/quorum.c                    |  8 +++---
 block/raw-format.c                |  6 ++---
 block/rbd.c                       |  4 +--
 block/replication.c               |  6 ++---
 block/ssh.c                       |  4 +--
 block/throttle.c                  |  6 ++---
 hw/scsi/scsi-disk.c               |  5 ++++
 tests/unit/test-block-iothread.c  |  3 +++
 block/meson.build                 |  1 +
 35 files changed, 161 insertions(+), 121 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 3ad053d60c..3677d445a4 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -73,8 +73,12 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
                                   PreallocMode prealloc, BdrvRequestFlags flags,
                                   Error **errp);
 
-int64_t bdrv_nb_sectors(BlockDriverState *bs);
-int64_t bdrv_getlength(BlockDriverState *bs);
+int64_t coroutine_fn bdrv_co_nb_sectors(BlockDriverState *bs);
+int64_t co_wrapper_mixed bdrv_nb_sectors(BlockDriverState *bs);
+
+int64_t coroutine_fn bdrv_co_getlength(BlockDriverState *bs);
+int64_t co_wrapper_mixed bdrv_getlength(BlockDriverState *bs);
+
 int64_t bdrv_get_allocated_file_size(BlockDriverState *bs);
 BlockMeasureInfo *bdrv_measure(BlockDriver *drv, QemuOpts *opts,
                                BlockDriverState *in_bs, Error **errp);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index e6229c64e6..6336c7239a 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -684,7 +684,7 @@ struct BlockDriver {
     int coroutine_fn (*bdrv_co_truncate)(BlockDriverState *bs, int64_t offset,
                                          bool exact, PreallocMode prealloc,
                                          BdrvRequestFlags flags, Error **errp);
-    int64_t (*bdrv_getlength)(BlockDriverState *bs);
+    int64_t coroutine_fn (*bdrv_co_getlength)(BlockDriverState *bs);
     int64_t (*bdrv_get_allocated_file_size)(BlockDriverState *bs);
     BlockMeasureInfo *(*bdrv_measure)(QemuOpts *opts, BlockDriverState *in_bs,
                                       Error **errp);
diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index 6b285fb520..d1559a501f 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -120,7 +120,10 @@ int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
                                        BdrvRequestFlags read_flags,
                                        BdrvRequestFlags write_flags);
 
-int bdrv_refresh_total_sectors(BlockDriverState *bs, int64_t hint);
+int coroutine_fn bdrv_co_refresh_total_sectors(BlockDriverState *bs,
+                                               int64_t hint);
+int co_wrapper_mixed
+bdrv_refresh_total_sectors(BlockDriverState *bs, int64_t hint);
 
 BdrvChild *bdrv_cow_child(BlockDriverState *bs);
 BdrvChild *bdrv_filter_child(BlockDriverState *bs);
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 4358fc6476..a1eac6c00a 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -60,9 +60,15 @@ bool co_wrapper_mixed blk_is_inserted(BlockBackend *blk);
 bool blk_is_available(BlockBackend *blk);
 void blk_lock_medium(BlockBackend *blk, bool locked);
 void blk_eject(BlockBackend *blk, bool eject_flag);
-int64_t blk_getlength(BlockBackend *blk);
+
+int64_t coroutine_fn blk_co_getlength(BlockBackend *blk);
+int64_t co_wrapper_mixed blk_getlength(BlockBackend *blk);
+
 void blk_get_geometry(BlockBackend *blk, uint64_t *nb_sectors_ptr);
-int64_t blk_nb_sectors(BlockBackend *blk);
+
+int64_t coroutine_fn blk_co_nb_sectors(BlockBackend *blk);
+int64_t co_wrapper_mixed blk_nb_sectors(BlockBackend *blk);
+
 void *blk_try_blockalign(BlockBackend *blk, size_t size);
 void *blk_blockalign(BlockBackend *blk, size_t size);
 bool blk_is_writable(BlockBackend *blk);
diff --git a/block.c b/block.c
index 6529e5a238..c8c3e42080 100644
--- a/block.c
+++ b/block.c
@@ -1034,7 +1034,8 @@ static int find_image_format(BlockBackend *file, const char *filename,
  * Set the current 'total_sectors' value
  * Return 0 on success, -errno on error.
  */
-int bdrv_refresh_total_sectors(BlockDriverState *bs, int64_t hint)
+int coroutine_fn bdrv_co_refresh_total_sectors(BlockDriverState *bs,
+                                               int64_t hint)
 {
     BlockDriver *drv = bs->drv;
     IO_CODE();
@@ -1043,13 +1044,13 @@ int bdrv_refresh_total_sectors(BlockDriverState *bs, int64_t hint)
         return -ENOMEDIUM;
     }
 
-    /* Do not attempt drv->bdrv_getlength() on scsi-generic devices */
+    /* Do not attempt drv->bdrv_co_getlength() on scsi-generic devices */
     if (bdrv_is_sg(bs))
         return 0;
 
     /* query actual device if possible, otherwise just trust the hint */
-    if (drv->bdrv_getlength) {
-        int64_t length = drv->bdrv_getlength(bs);
+    if (drv->bdrv_co_getlength) {
+        int64_t length = drv->bdrv_co_getlength(bs);
         if (length < 0) {
             return length;
         }
@@ -1600,6 +1601,11 @@ out:
     g_free(gen_node_name);
 }
 
+/*
+ * The caller must always hold @bs AioContext lock, because this function calls
+ * bdrv_refresh_total_sectors() which polls when called from non-coroutine
+ * context.
+ */
 static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
                             const char *node_name, QDict *options,
                             int open_flags, Error **errp)
@@ -3795,6 +3801,10 @@ out:
  * The reference parameter may be used to specify an existing block device which
  * should be opened. If specified, neither options nor a filename may be given,
  * nor can an existing BDS be reused (that is, *pbs has to be NULL).
+ *
+ * The caller must always hold @filename AioContext lock, because this
+ * function eventually calls bdrv_refresh_total_sectors() which polls
+ * when called from non-coroutine context.
  */
 static BlockDriverState *bdrv_open_inherit(const char *filename,
                                            const char *reference,
@@ -4083,6 +4093,11 @@ close_and_fail:
     return NULL;
 }
 
+/*
+ * The caller must always hold @filename AioContext lock, because this
+ * function eventually calls bdrv_refresh_total_sectors() which polls
+ * when called from non-coroutine context.
+ */
 BlockDriverState *bdrv_open(const char *filename, const char *reference,
                             QDict *options, int flags, Error **errp)
 {
@@ -5799,7 +5814,7 @@ BlockMeasureInfo *bdrv_measure(BlockDriver *drv, QemuOpts *opts,
 /**
  * Return number of sectors on success, -errno on error.
  */
-int64_t bdrv_nb_sectors(BlockDriverState *bs)
+int64_t coroutine_fn bdrv_co_nb_sectors(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
     IO_CODE();
@@ -5808,7 +5823,7 @@ int64_t bdrv_nb_sectors(BlockDriverState *bs)
         return -ENOMEDIUM;
 
     if (drv->has_variable_length) {
-        int ret = bdrv_refresh_total_sectors(bs, bs->total_sectors);
+        int ret = bdrv_co_refresh_total_sectors(bs, bs->total_sectors);
         if (ret < 0) {
             return ret;
         }
@@ -5820,11 +5835,12 @@ int64_t bdrv_nb_sectors(BlockDriverState *bs)
  * Return length in bytes on success, -errno on error.
  * The length is always a multiple of BDRV_SECTOR_SIZE.
  */
-int64_t bdrv_getlength(BlockDriverState *bs)
+int64_t coroutine_fn bdrv_co_getlength(BlockDriverState *bs)
 {
-    int64_t ret = bdrv_nb_sectors(bs);
+    int64_t ret;
     IO_CODE();
 
+    ret = bdrv_co_nb_sectors(bs);
     if (ret < 0) {
         return ret;
     }
diff --git a/block/blkdebug.c b/block/blkdebug.c
index ca65b043f0..2294b0227b 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -965,9 +965,9 @@ static bool blkdebug_debug_is_suspended(BlockDriverState *bs, const char *tag)
     return false;
 }
 
-static int64_t blkdebug_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn blkdebug_co_getlength(BlockDriverState *bs)
 {
-    return bdrv_getlength(bs->file->bs);
+    return bdrv_co_getlength(bs->file->bs);
 }
 
 static void blkdebug_refresh_filename(BlockDriverState *bs)
@@ -1074,7 +1074,7 @@ static BlockDriver bdrv_blkdebug = {
     .bdrv_reopen_prepare    = blkdebug_reopen_prepare,
     .bdrv_child_perm        = blkdebug_child_perm,
 
-    .bdrv_getlength         = blkdebug_getlength,
+    .bdrv_co_getlength      = blkdebug_co_getlength,
     .bdrv_refresh_filename  = blkdebug_refresh_filename,
     .bdrv_refresh_limits    = blkdebug_refresh_limits,
 
diff --git a/block/blkio.c b/block/blkio.c
index 1ff51ff4f3..2a3ab5a570 100644
--- a/block/blkio.c
+++ b/block/blkio.c
@@ -837,7 +837,7 @@ static void blkio_close(BlockDriverState *bs)
     }
 }
 
-static int64_t blkio_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn blkio_co_getlength(BlockDriverState *bs)
 {
     BDRVBlkioState *s = bs->opaque;
     uint64_t capacity;
@@ -865,7 +865,7 @@ static int coroutine_fn blkio_truncate(BlockDriverState *bs, int64_t offset,
         return -ENOTSUP;
     }
 
-    current_length = blkio_getlength(bs);
+    current_length = blkio_co_getlength(bs);
 
     if (offset > current_length) {
         error_setg(errp, "Cannot grow device");
@@ -996,7 +996,7 @@ static void blkio_refresh_limits(BlockDriverState *bs, Error **errp)
         .instance_size           = sizeof(BDRVBlkioState), \
         .bdrv_file_open          = blkio_file_open, \
         .bdrv_close              = blkio_close, \
-        .bdrv_getlength          = blkio_getlength, \
+        .bdrv_co_getlength       = blkio_co_getlength, \
         .bdrv_co_truncate        = blkio_truncate, \
         .bdrv_get_info           = blkio_get_info, \
         .bdrv_attach_aio_context = blkio_attach_aio_context, \
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index cef9efe55d..6cb48d6ada 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -266,9 +266,9 @@ static void blk_log_writes_close(BlockDriverState *bs)
     s->log_file = NULL;
 }
 
-static int64_t blk_log_writes_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn blk_log_writes_co_getlength(BlockDriverState *bs)
 {
-    return bdrv_getlength(bs->file->bs);
+    return bdrv_co_getlength(bs->file->bs);
 }
 
 static void blk_log_writes_child_perm(BlockDriverState *bs, BdrvChild *c,
@@ -497,7 +497,7 @@ static BlockDriver bdrv_blk_log_writes = {
 
     .bdrv_open              = blk_log_writes_open,
     .bdrv_close             = blk_log_writes_close,
-    .bdrv_getlength         = blk_log_writes_getlength,
+    .bdrv_co_getlength      = blk_log_writes_co_getlength,
     .bdrv_child_perm        = blk_log_writes_child_perm,
     .bdrv_refresh_limits    = blk_log_writes_refresh_limits,
 
diff --git a/block/blkreplay.c b/block/blkreplay.c
index 76a0b8d12a..fa1073fe4a 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -39,9 +39,9 @@ fail:
     return ret;
 }
 
-static int64_t blkreplay_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn blkreplay_co_getlength(BlockDriverState *bs)
 {
-    return bdrv_getlength(bs->file->bs);
+    return bdrv_co_getlength(bs->file->bs);
 }
 
 /* This bh is used for synchronization of return from coroutines.
@@ -135,7 +135,7 @@ static BlockDriver bdrv_blkreplay = {
 
     .bdrv_open              = blkreplay_open,
     .bdrv_child_perm        = bdrv_default_perms,
-    .bdrv_getlength         = blkreplay_getlength,
+    .bdrv_co_getlength      = blkreplay_co_getlength,
 
     .bdrv_co_preadv         = blkreplay_co_preadv,
     .bdrv_co_pwritev        = blkreplay_co_pwritev,
diff --git a/block/blkverify.c b/block/blkverify.c
index c60a2dc624..acd730906d 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -154,11 +154,11 @@ static void blkverify_close(BlockDriverState *bs)
     s->test_file = NULL;
 }
 
-static int64_t blkverify_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn blkverify_co_getlength(BlockDriverState *bs)
 {
     BDRVBlkverifyState *s = bs->opaque;
 
-    return bdrv_getlength(s->test_file->bs);
+    return bdrv_co_getlength(s->test_file->bs);
 }
 
 static void coroutine_fn blkverify_do_test_req(void *opaque)
@@ -313,7 +313,7 @@ static BlockDriver bdrv_blkverify = {
     .bdrv_file_open                   = blkverify_open,
     .bdrv_close                       = blkverify_close,
     .bdrv_child_perm                  = bdrv_default_perms,
-    .bdrv_getlength                   = blkverify_getlength,
+    .bdrv_co_getlength                = blkverify_co_getlength,
     .bdrv_refresh_filename            = blkverify_refresh_filename,
     .bdrv_dirname                     = blkverify_dirname,
 
diff --git a/block/block-backend.c b/block/block-backend.c
index 7ba436811b..d698cc3f33 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1599,14 +1599,15 @@ BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                         flags | BDRV_REQ_ZERO_WRITE, cb, opaque);
 }
 
-int64_t blk_getlength(BlockBackend *blk)
+int64_t coroutine_fn blk_co_getlength(BlockBackend *blk)
 {
     IO_CODE();
+
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
     }
 
-    return bdrv_getlength(blk_bs(blk));
+    return bdrv_co_getlength(blk_bs(blk));
 }
 
 void blk_get_geometry(BlockBackend *blk, uint64_t *nb_sectors_ptr)
@@ -1619,14 +1620,15 @@ void blk_get_geometry(BlockBackend *blk, uint64_t *nb_sectors_ptr)
     }
 }
 
-int64_t blk_nb_sectors(BlockBackend *blk)
+int64_t coroutine_fn blk_co_nb_sectors(BlockBackend *blk)
 {
     IO_CODE();
+
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
     }
 
-    return bdrv_nb_sectors(blk_bs(blk));
+    return bdrv_co_nb_sectors(blk_bs(blk));
 }
 
 BlockAIOCB *blk_aio_preadv(BlockBackend *blk, int64_t offset,
diff --git a/block/commit.c b/block/commit.c
index b346341767..41e3599281 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -123,13 +123,13 @@ static int coroutine_fn commit_run(Job *job, Error **errp)
     QEMU_AUTO_VFREE void *buf = NULL;
     int64_t len, base_len;
 
-    len = blk_getlength(s->top);
+    len = blk_co_getlength(s->top);
     if (len < 0) {
         return len;
     }
     job_progress_set_remaining(&s->common.job, len);
 
-    base_len = blk_getlength(s->base);
+    base_len = blk_co_getlength(s->base);
     if (base_len < 0) {
         return base_len;
     }
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 815ac1d835..41777b87a4 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -120,9 +120,9 @@ static void cor_child_perm(BlockDriverState *bs, BdrvChild *c,
 }
 
 
-static int64_t cor_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn cor_co_getlength(BlockDriverState *bs)
 {
-    return bdrv_getlength(bs->file->bs);
+    return bdrv_co_getlength(bs->file->bs);
 }
 
 
@@ -249,7 +249,7 @@ static BlockDriver bdrv_copy_on_read = {
     .bdrv_close                         = cor_close,
     .bdrv_child_perm                    = cor_child_perm,
 
-    .bdrv_getlength                     = cor_getlength,
+    .bdrv_co_getlength                  = cor_co_getlength,
 
     .bdrv_co_preadv_part                = cor_co_preadv_part,
     .bdrv_co_pwritev_part               = cor_co_pwritev_part,
diff --git a/block/crypto.c b/block/crypto.c
index bbeb9f437c..6d6c006887 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -531,10 +531,10 @@ static void block_crypto_refresh_limits(BlockDriverState *bs, Error **errp)
 }
 
 
-static int64_t block_crypto_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn block_crypto_co_getlength(BlockDriverState *bs)
 {
     BlockCrypto *crypto = bs->opaque;
-    int64_t len = bdrv_getlength(bs->file->bs);
+    int64_t len = bdrv_co_getlength(bs->file->bs);
 
     uint64_t offset = qcrypto_block_get_payload_offset(crypto->block);
     assert(offset < INT64_MAX);
@@ -953,7 +953,7 @@ static BlockDriver bdrv_crypto_luks = {
     .bdrv_refresh_limits = block_crypto_refresh_limits,
     .bdrv_co_preadv     = block_crypto_co_preadv,
     .bdrv_co_pwritev    = block_crypto_co_pwritev,
-    .bdrv_getlength     = block_crypto_getlength,
+    .bdrv_co_getlength  = block_crypto_co_getlength,
     .bdrv_measure       = block_crypto_measure,
     .bdrv_get_info      = block_crypto_get_info_luks,
     .bdrv_get_specific_info = block_crypto_get_specific_info_luks,
diff --git a/block/curl.c b/block/curl.c
index cba4c4cac7..d60596e57f 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -957,7 +957,7 @@ static void curl_close(BlockDriverState *bs)
     g_free(s->proxypassword);
 }
 
-static int64_t curl_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn curl_co_getlength(BlockDriverState *bs)
 {
     BDRVCURLState *s = bs->opaque;
     return s->len;
@@ -1001,7 +1001,7 @@ static BlockDriver bdrv_http = {
     .bdrv_parse_filename        = curl_parse_filename,
     .bdrv_file_open             = curl_open,
     .bdrv_close                 = curl_close,
-    .bdrv_getlength             = curl_getlength,
+    .bdrv_co_getlength          = curl_co_getlength,
 
     .bdrv_co_preadv             = curl_co_preadv,
 
@@ -1020,7 +1020,7 @@ static BlockDriver bdrv_https = {
     .bdrv_parse_filename        = curl_parse_filename,
     .bdrv_file_open             = curl_open,
     .bdrv_close                 = curl_close,
-    .bdrv_getlength             = curl_getlength,
+    .bdrv_co_getlength          = curl_co_getlength,
 
     .bdrv_co_preadv             = curl_co_preadv,
 
@@ -1039,7 +1039,7 @@ static BlockDriver bdrv_ftp = {
     .bdrv_parse_filename        = curl_parse_filename,
     .bdrv_file_open             = curl_open,
     .bdrv_close                 = curl_close,
-    .bdrv_getlength             = curl_getlength,
+    .bdrv_co_getlength          = curl_co_getlength,
 
     .bdrv_co_preadv             = curl_co_preadv,
 
@@ -1058,7 +1058,7 @@ static BlockDriver bdrv_ftps = {
     .bdrv_parse_filename        = curl_parse_filename,
     .bdrv_file_open             = curl_open,
     .bdrv_close                 = curl_close,
-    .bdrv_getlength             = curl_getlength,
+    .bdrv_co_getlength          = curl_co_getlength,
 
     .bdrv_co_preadv             = curl_co_preadv,
 
diff --git a/block/file-posix.c b/block/file-posix.c
index 02a8703767..ef1fce3782 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -188,7 +188,7 @@ static int fd_open(BlockDriverState *bs)
     return -EIO;
 }
 
-static int64_t raw_getlength(BlockDriverState *bs);
+static int64_t coroutine_fn raw_co_getlength(BlockDriverState *bs);
 
 typedef struct RawPosixAIOData {
     BlockDriverState *bs;
@@ -2279,7 +2279,7 @@ static int coroutine_fn raw_co_truncate(BlockDriverState *bs, int64_t offset,
     }
 
     if (S_ISCHR(st.st_mode) || S_ISBLK(st.st_mode)) {
-        int64_t cur_length = raw_getlength(bs);
+        int64_t cur_length = raw_co_getlength(bs);
 
         if (offset != cur_length && exact) {
             error_setg(errp, "Cannot resize device files");
@@ -2297,7 +2297,7 @@ static int coroutine_fn raw_co_truncate(BlockDriverState *bs, int64_t offset,
 }
 
 #ifdef __OpenBSD__
-static int64_t raw_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn raw_co_getlength(BlockDriverState *bs)
 {
     BDRVRawState *s = bs->opaque;
     int fd = s->fd;
@@ -2316,7 +2316,7 @@ static int64_t raw_getlength(BlockDriverState *bs)
         return st.st_size;
 }
 #elif defined(__NetBSD__)
-static int64_t raw_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn raw_co_getlength(BlockDriverState *bs)
 {
     BDRVRawState *s = bs->opaque;
     int fd = s->fd;
@@ -2341,7 +2341,7 @@ static int64_t raw_getlength(BlockDriverState *bs)
         return st.st_size;
 }
 #elif defined(__sun__)
-static int64_t raw_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn raw_co_getlength(BlockDriverState *bs)
 {
     BDRVRawState *s = bs->opaque;
     struct dk_minfo minfo;
@@ -2372,7 +2372,7 @@ static int64_t raw_getlength(BlockDriverState *bs)
     return size;
 }
 #elif defined(CONFIG_BSD)
-static int64_t raw_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn raw_co_getlength(BlockDriverState *bs)
 {
     BDRVRawState *s = bs->opaque;
     int fd = s->fd;
@@ -2444,7 +2444,7 @@ again:
     return size;
 }
 #else
-static int64_t raw_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn raw_co_getlength(BlockDriverState *bs)
 {
     BDRVRawState *s = bs->opaque;
     int ret;
@@ -2829,7 +2829,7 @@ static int coroutine_fn raw_co_block_status(BlockDriverState *bs,
          * round up if necessary.
          */
         if (!QEMU_IS_ALIGNED(*pnum, bs->bl.request_alignment)) {
-            int64_t file_length = raw_getlength(bs);
+            int64_t file_length = raw_co_getlength(bs);
             if (file_length > 0) {
                 /* Ignore errors, this is just a safeguard */
                 assert(hole == file_length);
@@ -2851,7 +2851,7 @@ static int coroutine_fn raw_co_block_status(BlockDriverState *bs,
 
 #if defined(__linux__)
 /* Verify that the file is not in the page cache */
-static void check_cache_dropped(BlockDriverState *bs, Error **errp)
+static void coroutine_fn check_cache_dropped(BlockDriverState *bs, Error **errp)
 {
     const size_t window_size = 128 * 1024 * 1024;
     BDRVRawState *s = bs->opaque;
@@ -2866,7 +2866,7 @@ static void check_cache_dropped(BlockDriverState *bs, Error **errp)
     page_size = sysconf(_SC_PAGESIZE);
     vec = g_malloc(DIV_ROUND_UP(window_size, page_size));
 
-    end = raw_getlength(bs);
+    end = raw_co_getlength(bs);
 
     for (offset = 0; offset < end; offset += window_size) {
         void *new_window;
@@ -3320,8 +3320,8 @@ BlockDriver bdrv_file = {
     .bdrv_co_io_unplug      = raw_co_io_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
-    .bdrv_co_truncate = raw_co_truncate,
-    .bdrv_getlength = raw_getlength,
+    .bdrv_co_truncate                   = raw_co_truncate,
+    .bdrv_co_getlength                  = raw_co_getlength,
     .bdrv_get_info = raw_get_info,
     .bdrv_get_allocated_file_size
                         = raw_get_allocated_file_size,
@@ -3692,8 +3692,8 @@ static BlockDriver bdrv_host_device = {
     .bdrv_co_io_unplug      = raw_co_io_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
-    .bdrv_co_truncate       = raw_co_truncate,
-    .bdrv_getlength	= raw_getlength,
+    .bdrv_co_truncate                   = raw_co_truncate,
+    .bdrv_co_getlength                  = raw_co_getlength,
     .bdrv_get_info = raw_get_info,
     .bdrv_get_allocated_file_size
                         = raw_get_allocated_file_size,
@@ -3816,9 +3816,9 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_co_io_unplug      = raw_co_io_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
-    .bdrv_co_truncate    = raw_co_truncate,
-    .bdrv_getlength      = raw_getlength,
-    .has_variable_length = true,
+    .bdrv_co_truncate                   = raw_co_truncate,
+    .bdrv_co_getlength                  = raw_co_getlength,
+    .has_variable_length                = true,
     .bdrv_get_allocated_file_size
                         = raw_get_allocated_file_size,
 
@@ -3884,7 +3884,7 @@ static int cdrom_reopen(BlockDriverState *bs)
 
 static bool coroutine_fn cdrom_co_is_inserted(BlockDriverState *bs)
 {
-    return raw_getlength(bs) > 0;
+    return raw_co_getlength(bs) > 0;
 }
 
 static void cdrom_eject(BlockDriverState *bs, bool eject_flag)
@@ -3946,9 +3946,9 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_co_io_unplug      = raw_co_io_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
-    .bdrv_co_truncate    = raw_co_truncate,
-    .bdrv_getlength      = raw_getlength,
-    .has_variable_length = true,
+    .bdrv_co_truncate                   = raw_co_truncate,
+    .bdrv_co_getlength                  = raw_co_getlength,
+    .has_variable_length                = true,
     .bdrv_get_allocated_file_size
                         = raw_get_allocated_file_size,
 
diff --git a/block/file-win32.c b/block/file-win32.c
index ec9d64d0e4..aedee695dd 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -525,7 +525,7 @@ static int coroutine_fn raw_co_truncate(BlockDriverState *bs, int64_t offset,
     return 0;
 }
 
-static int64_t raw_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn raw_co_getlength(BlockDriverState *bs)
 {
     BDRVRawState *s = bs->opaque;
     LARGE_INTEGER l;
@@ -763,7 +763,7 @@ BlockDriver bdrv_file = {
     .bdrv_aio_flush     = raw_aio_flush,
 
     .bdrv_co_truncate   = raw_co_truncate,
-    .bdrv_getlength	= raw_getlength,
+    .bdrv_co_getlength  = raw_co_getlength,
     .bdrv_get_allocated_file_size
                         = raw_get_allocated_file_size,
 
@@ -932,8 +932,8 @@ static BlockDriver bdrv_host_device = {
     .bdrv_detach_aio_context = raw_detach_aio_context,
     .bdrv_attach_aio_context = raw_attach_aio_context,
 
-    .bdrv_getlength      = raw_getlength,
-    .has_variable_length = true,
+    .bdrv_co_getlength                = raw_co_getlength,
+    .has_variable_length              = true,
 
     .bdrv_get_allocated_file_size
                         = raw_get_allocated_file_size,
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 305716c86c..1515fe5103 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -54,9 +54,9 @@ static int compress_open(BlockDriverState *bs, QDict *options, int flags,
 }
 
 
-static int64_t compress_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn compress_co_getlength(BlockDriverState *bs)
 {
-    return bdrv_getlength(bs->file->bs);
+    return bdrv_co_getlength(bs->file->bs);
 }
 
 
@@ -134,7 +134,7 @@ static BlockDriver bdrv_compress = {
     .bdrv_open                          = compress_open,
     .bdrv_child_perm                    = bdrv_default_perms,
 
-    .bdrv_getlength                     = compress_getlength,
+    .bdrv_co_getlength                  = compress_co_getlength,
 
     .bdrv_co_preadv_part                = compress_co_preadv_part,
     .bdrv_co_pwritev_part               = compress_co_pwritev_part,
diff --git a/block/gluster.c b/block/gluster.c
index 7efc296399..469cdf01d4 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -1317,7 +1317,7 @@ static coroutine_fn int qemu_gluster_co_pdiscard(BlockDriverState *bs,
 }
 #endif
 
-static int64_t qemu_gluster_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn qemu_gluster_co_getlength(BlockDriverState *bs)
 {
     BDRVGlusterState *s = bs->opaque;
     int64_t ret;
@@ -1509,7 +1509,7 @@ static int coroutine_fn qemu_gluster_co_block_status(BlockDriverState *bs,
          * round up if necessary.
          */
         if (!QEMU_IS_ALIGNED(*pnum, bs->bl.request_alignment)) {
-            int64_t file_length = qemu_gluster_getlength(bs);
+            int64_t file_length = qemu_gluster_co_getlength(bs);
             if (file_length > 0) {
                 /* Ignore errors, this is just a safeguard */
                 assert(hole == file_length);
@@ -1558,7 +1558,7 @@ static BlockDriver bdrv_gluster = {
     .bdrv_close                   = qemu_gluster_close,
     .bdrv_co_create               = qemu_gluster_co_create,
     .bdrv_co_create_opts          = qemu_gluster_co_create_opts,
-    .bdrv_getlength               = qemu_gluster_getlength,
+    .bdrv_co_getlength            = qemu_gluster_co_getlength,
     .bdrv_get_allocated_file_size = qemu_gluster_allocated_file_size,
     .bdrv_co_truncate             = qemu_gluster_co_truncate,
     .bdrv_co_readv                = qemu_gluster_co_readv,
@@ -1587,7 +1587,7 @@ static BlockDriver bdrv_gluster_tcp = {
     .bdrv_close                   = qemu_gluster_close,
     .bdrv_co_create               = qemu_gluster_co_create,
     .bdrv_co_create_opts          = qemu_gluster_co_create_opts,
-    .bdrv_getlength               = qemu_gluster_getlength,
+    .bdrv_co_getlength            = qemu_gluster_co_getlength,
     .bdrv_get_allocated_file_size = qemu_gluster_allocated_file_size,
     .bdrv_co_truncate             = qemu_gluster_co_truncate,
     .bdrv_co_readv                = qemu_gluster_co_readv,
@@ -1616,7 +1616,7 @@ static BlockDriver bdrv_gluster_unix = {
     .bdrv_close                   = qemu_gluster_close,
     .bdrv_co_create               = qemu_gluster_co_create,
     .bdrv_co_create_opts          = qemu_gluster_co_create_opts,
-    .bdrv_getlength               = qemu_gluster_getlength,
+    .bdrv_co_getlength            = qemu_gluster_co_getlength,
     .bdrv_get_allocated_file_size = qemu_gluster_allocated_file_size,
     .bdrv_co_truncate             = qemu_gluster_co_truncate,
     .bdrv_co_readv                = qemu_gluster_co_readv,
@@ -1651,7 +1651,7 @@ static BlockDriver bdrv_gluster_rdma = {
     .bdrv_close                   = qemu_gluster_close,
     .bdrv_co_create               = qemu_gluster_co_create,
     .bdrv_co_create_opts          = qemu_gluster_co_create_opts,
-    .bdrv_getlength               = qemu_gluster_getlength,
+    .bdrv_co_getlength            = qemu_gluster_co_getlength,
     .bdrv_get_allocated_file_size = qemu_gluster_allocated_file_size,
     .bdrv_co_truncate             = qemu_gluster_co_truncate,
     .bdrv_co_readv                = qemu_gluster_co_readv,
diff --git a/block/iscsi.c b/block/iscsi.c
index a316d46d96..df110dd1d2 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -1126,8 +1126,8 @@ static BlockAIOCB *iscsi_aio_ioctl(BlockDriverState *bs,
 
 #endif
 
-static int64_t
-iscsi_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn
+iscsi_co_getlength(BlockDriverState *bs)
 {
     IscsiLun *iscsilun = bs->opaque;
     int64_t len;
@@ -2154,7 +2154,7 @@ static int coroutine_fn iscsi_co_truncate(BlockDriverState *bs, int64_t offset,
         return -EIO;
     }
 
-    cur_length = iscsi_getlength(bs);
+    cur_length = iscsi_co_getlength(bs);
     if (offset != cur_length && exact) {
         error_setg(errp, "Cannot resize iSCSI devices");
         return -ENOTSUP;
@@ -2433,7 +2433,7 @@ static BlockDriver bdrv_iscsi = {
     .bdrv_reopen_commit     = iscsi_reopen_commit,
     .bdrv_co_invalidate_cache = iscsi_co_invalidate_cache,
 
-    .bdrv_getlength  = iscsi_getlength,
+    .bdrv_co_getlength   = iscsi_co_getlength,
     .bdrv_get_info   = iscsi_get_info,
     .bdrv_co_truncate    = iscsi_co_truncate,
     .bdrv_refresh_limits = iscsi_refresh_limits,
@@ -2472,7 +2472,7 @@ static BlockDriver bdrv_iser = {
     .bdrv_reopen_commit     = iscsi_reopen_commit,
     .bdrv_co_invalidate_cache  = iscsi_co_invalidate_cache,
 
-    .bdrv_getlength  = iscsi_getlength,
+    .bdrv_co_getlength   = iscsi_co_getlength,
     .bdrv_get_info   = iscsi_get_info,
     .bdrv_co_truncate    = iscsi_co_truncate,
     .bdrv_refresh_limits = iscsi_refresh_limits,
diff --git a/block/mirror.c b/block/mirror.c
index 251adc5ae0..c7d7ce2f8f 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -909,13 +909,13 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         goto immediate_exit;
     }
 
-    s->bdev_length = bdrv_getlength(bs);
+    s->bdev_length = bdrv_co_getlength(bs);
     if (s->bdev_length < 0) {
         ret = s->bdev_length;
         goto immediate_exit;
     }
 
-    target_length = blk_getlength(s->target);
+    target_length = blk_co_getlength(s->target);
     if (target_length < 0) {
         ret = target_length;
         goto immediate_exit;
diff --git a/block/nbd.c b/block/nbd.c
index 7d485c86d2..bf2894ad5c 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1992,7 +1992,7 @@ static int coroutine_fn nbd_co_truncate(BlockDriverState *bs, int64_t offset,
     return 0;
 }
 
-static int64_t nbd_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn nbd_co_getlength(BlockDriverState *bs)
 {
     BDRVNBDState *s = bs->opaque;
 
@@ -2124,7 +2124,7 @@ static BlockDriver bdrv_nbd = {
     .bdrv_co_pdiscard           = nbd_client_co_pdiscard,
     .bdrv_refresh_limits        = nbd_refresh_limits,
     .bdrv_co_truncate           = nbd_co_truncate,
-    .bdrv_getlength             = nbd_getlength,
+    .bdrv_co_getlength          = nbd_co_getlength,
     .bdrv_refresh_filename      = nbd_refresh_filename,
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
@@ -2152,7 +2152,7 @@ static BlockDriver bdrv_nbd_tcp = {
     .bdrv_co_pdiscard           = nbd_client_co_pdiscard,
     .bdrv_refresh_limits        = nbd_refresh_limits,
     .bdrv_co_truncate           = nbd_co_truncate,
-    .bdrv_getlength             = nbd_getlength,
+    .bdrv_co_getlength          = nbd_co_getlength,
     .bdrv_refresh_filename      = nbd_refresh_filename,
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
@@ -2180,7 +2180,7 @@ static BlockDriver bdrv_nbd_unix = {
     .bdrv_co_pdiscard           = nbd_client_co_pdiscard,
     .bdrv_refresh_limits        = nbd_refresh_limits,
     .bdrv_co_truncate           = nbd_co_truncate,
-    .bdrv_getlength             = nbd_getlength,
+    .bdrv_co_getlength          = nbd_co_getlength,
     .bdrv_refresh_filename      = nbd_refresh_filename,
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
diff --git a/block/null.c b/block/null.c
index 75f7d0db40..05dde6d9ab 100644
--- a/block/null.c
+++ b/block/null.c
@@ -99,7 +99,7 @@ static int null_file_open(BlockDriverState *bs, QDict *options, int flags,
     return ret;
 }
 
-static int64_t null_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn null_co_getlength(BlockDriverState *bs)
 {
     BDRVNullState *s = bs->opaque;
     return s->length;
@@ -283,7 +283,7 @@ static BlockDriver bdrv_null_co = {
 
     .bdrv_file_open         = null_file_open,
     .bdrv_parse_filename    = null_co_parse_filename,
-    .bdrv_getlength         = null_getlength,
+    .bdrv_co_getlength      = null_co_getlength,
     .bdrv_get_allocated_file_size = null_allocated_file_size,
 
     .bdrv_co_preadv         = null_co_preadv,
@@ -304,7 +304,7 @@ static BlockDriver bdrv_null_aio = {
 
     .bdrv_file_open         = null_file_open,
     .bdrv_parse_filename    = null_aio_parse_filename,
-    .bdrv_getlength         = null_getlength,
+    .bdrv_co_getlength      = null_co_getlength,
     .bdrv_get_allocated_file_size = null_allocated_file_size,
 
     .bdrv_aio_preadv        = null_aio_preadv,
diff --git a/block/nvme.c b/block/nvme.c
index eb940f2846..6958715758 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1001,7 +1001,7 @@ fail:
     return ret;
 }
 
-static int64_t nvme_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn nvme_co_getlength(BlockDriverState *bs)
 {
     BDRVNVMeState *s = bs->opaque;
     return s->nsze << s->blkshift;
@@ -1485,7 +1485,7 @@ static int coroutine_fn nvme_co_truncate(BlockDriverState *bs, int64_t offset,
         return -ENOTSUP;
     }
 
-    cur_length = nvme_getlength(bs);
+    cur_length = nvme_co_getlength(bs);
     if (offset != cur_length && exact) {
         error_setg(errp, "Cannot resize NVMe devices");
         return -ENOTSUP;
@@ -1642,7 +1642,7 @@ static BlockDriver bdrv_nvme = {
     .bdrv_parse_filename      = nvme_parse_filename,
     .bdrv_file_open           = nvme_file_open,
     .bdrv_close               = nvme_close,
-    .bdrv_getlength           = nvme_getlength,
+    .bdrv_co_getlength        = nvme_co_getlength,
     .bdrv_probe_blocksizes    = nvme_probe_blocksizes,
     .bdrv_co_truncate         = nvme_co_truncate,
 
diff --git a/block/preallocate.c b/block/preallocate.c
index d50ee7f49b..94aa824e09 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -441,7 +441,7 @@ static int coroutine_fn preallocate_co_flush(BlockDriverState *bs)
     return bdrv_co_flush(bs->file->bs);
 }
 
-static int64_t preallocate_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn preallocate_co_getlength(BlockDriverState *bs)
 {
     int64_t ret;
     BDRVPreallocateState *s = bs->opaque;
@@ -450,7 +450,7 @@ static int64_t preallocate_getlength(BlockDriverState *bs)
         return s->data_end;
     }
 
-    ret = bdrv_getlength(bs->file->bs);
+    ret = bdrv_co_getlength(bs->file->bs);
 
     if (has_prealloc_perms(bs)) {
         s->file_end = s->zero_start = s->data_end = ret;
@@ -536,9 +536,9 @@ BlockDriver bdrv_preallocate_filter = {
     .format_name = "preallocate",
     .instance_size = sizeof(BDRVPreallocateState),
 
-    .bdrv_getlength = preallocate_getlength,
-    .bdrv_open = preallocate_open,
-    .bdrv_close = preallocate_close,
+    .bdrv_co_getlength    = preallocate_co_getlength,
+    .bdrv_open            = preallocate_open,
+    .bdrv_close           = preallocate_close,
 
     .bdrv_reopen_prepare  = preallocate_reopen_prepare,
     .bdrv_reopen_commit   = preallocate_reopen_commit,
diff --git a/block/qed.c b/block/qed.c
index faa606618e..c8f9045b72 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -1480,7 +1480,7 @@ static int coroutine_fn bdrv_qed_co_truncate(BlockDriverState *bs,
     return ret;
 }
 
-static int64_t bdrv_qed_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn bdrv_qed_co_getlength(BlockDriverState *bs)
 {
     BDRVQEDState *s = bs->opaque;
     return s->header.image_size;
@@ -1653,7 +1653,7 @@ static BlockDriver bdrv_qed = {
     .bdrv_co_writev           = bdrv_qed_co_writev,
     .bdrv_co_pwrite_zeroes    = bdrv_qed_co_pwrite_zeroes,
     .bdrv_co_truncate         = bdrv_qed_co_truncate,
-    .bdrv_getlength           = bdrv_qed_getlength,
+    .bdrv_co_getlength        = bdrv_qed_co_getlength,
     .bdrv_get_info            = bdrv_qed_get_info,
     .bdrv_refresh_limits      = bdrv_qed_refresh_limits,
     .bdrv_change_backing_file = bdrv_qed_change_backing_file,
diff --git a/block/quorum.c b/block/quorum.c
index 7f21c03f1f..d1dcf2eaba 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -754,19 +754,19 @@ static int coroutine_fn quorum_co_pwrite_zeroes(BlockDriverState *bs,
                              flags | BDRV_REQ_ZERO_WRITE);
 }
 
-static int64_t quorum_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn quorum_co_getlength(BlockDriverState *bs)
 {
     BDRVQuorumState *s = bs->opaque;
     int64_t result;
     int i;
 
     /* check that all file have the same length */
-    result = bdrv_getlength(s->children[0]->bs);
+    result = bdrv_co_getlength(s->children[0]->bs);
     if (result < 0) {
         return result;
     }
     for (i = 1; i < s->num_children; i++) {
-        int64_t value = bdrv_getlength(s->children[i]->bs);
+        int64_t value = bdrv_co_getlength(s->children[i]->bs);
         if (value < 0) {
             return value;
         }
@@ -1283,7 +1283,7 @@ static BlockDriver bdrv_quorum = {
 
     .bdrv_co_flush                      = quorum_co_flush,
 
-    .bdrv_getlength                     = quorum_getlength,
+    .bdrv_co_getlength                  = quorum_co_getlength,
 
     .bdrv_co_preadv                     = quorum_co_preadv,
     .bdrv_co_pwritev                    = quorum_co_pwritev,
diff --git a/block/raw-format.c b/block/raw-format.c
index 28905b09ee..ccf23fe0b2 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -316,14 +316,14 @@ static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
 
-static int64_t raw_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn raw_co_getlength(BlockDriverState *bs)
 {
     int64_t len;
     BDRVRawState *s = bs->opaque;
 
     /* Update size. It should not change unless the file was externally
      * modified. */
-    len = bdrv_getlength(bs->file->bs);
+    len = bdrv_co_getlength(bs->file->bs);
     if (len < 0) {
         return len;
     }
@@ -621,7 +621,7 @@ BlockDriver bdrv_raw = {
     .bdrv_co_copy_range_from = &raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = &raw_co_copy_range_to,
     .bdrv_co_truncate     = &raw_co_truncate,
-    .bdrv_getlength       = &raw_getlength,
+    .bdrv_co_getlength    = &raw_co_getlength,
     .is_format            = true,
     .has_variable_length  = true,
     .bdrv_measure         = &raw_measure,
diff --git a/block/rbd.c b/block/rbd.c
index 3aa6aae0e0..c67d30160a 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1429,7 +1429,7 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
     return status;
 }
 
-static int64_t qemu_rbd_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn qemu_rbd_co_getlength(BlockDriverState *bs)
 {
     BDRVRBDState *s = bs->opaque;
     int r;
@@ -1653,7 +1653,7 @@ static BlockDriver bdrv_rbd = {
     .bdrv_get_info          = qemu_rbd_getinfo,
     .bdrv_get_specific_info = qemu_rbd_get_specific_info,
     .create_opts            = &qemu_rbd_create_opts,
-    .bdrv_getlength         = qemu_rbd_getlength,
+    .bdrv_co_getlength      = qemu_rbd_co_getlength,
     .bdrv_co_truncate       = qemu_rbd_co_truncate,
     .protocol_name          = "rbd",
 
diff --git a/block/replication.c b/block/replication.c
index c62f48a874..a27417d310 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -179,9 +179,9 @@ static void replication_child_perm(BlockDriverState *bs, BdrvChild *c,
     return;
 }
 
-static int64_t replication_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn replication_co_getlength(BlockDriverState *bs)
 {
-    return bdrv_getlength(bs->file->bs);
+    return bdrv_co_getlength(bs->file->bs);
 }
 
 static int replication_get_io_status(BDRVReplicationState *s)
@@ -758,7 +758,7 @@ static BlockDriver bdrv_replication = {
     .bdrv_close                 = replication_close,
     .bdrv_child_perm            = replication_child_perm,
 
-    .bdrv_getlength             = replication_getlength,
+    .bdrv_co_getlength          = replication_co_getlength,
     .bdrv_co_readv              = replication_co_readv,
     .bdrv_co_writev             = replication_co_writev,
 
diff --git a/block/ssh.c b/block/ssh.c
index 8508710f2f..c374129c9a 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -1252,7 +1252,7 @@ static coroutine_fn int ssh_co_flush(BlockDriverState *bs)
     return ret;
 }
 
-static int64_t ssh_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn ssh_co_getlength(BlockDriverState *bs)
 {
     BDRVSSHState *s = bs->opaque;
     int64_t length;
@@ -1363,7 +1363,7 @@ static BlockDriver bdrv_ssh = {
     .bdrv_has_zero_init           = ssh_has_zero_init,
     .bdrv_co_readv                = ssh_co_readv,
     .bdrv_co_writev               = ssh_co_writev,
-    .bdrv_getlength               = ssh_getlength,
+    .bdrv_co_getlength            = ssh_co_getlength,
     .bdrv_co_truncate             = ssh_co_truncate,
     .bdrv_co_flush_to_disk        = ssh_co_flush,
     .bdrv_refresh_filename        = ssh_refresh_filename,
diff --git a/block/throttle.c b/block/throttle.c
index 88851c84f4..80b6395899 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -104,9 +104,9 @@ static void throttle_close(BlockDriverState *bs)
 }
 
 
-static int64_t throttle_getlength(BlockDriverState *bs)
+static int64_t coroutine_fn throttle_co_getlength(BlockDriverState *bs)
 {
-    return bdrv_getlength(bs->file->bs);
+    return bdrv_co_getlength(bs->file->bs);
 }
 
 static int coroutine_fn throttle_co_preadv(BlockDriverState *bs,
@@ -245,7 +245,7 @@ static BlockDriver bdrv_throttle = {
 
     .bdrv_child_perm                    =   bdrv_default_perms,
 
-    .bdrv_getlength                     =   throttle_getlength,
+    .bdrv_co_getlength                  =   throttle_co_getlength,
 
     .bdrv_co_preadv                     =   throttle_co_preadv,
     .bdrv_co_pwritev                    =   throttle_co_pwritev,
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index e493c28814..d4e360850f 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2332,10 +2332,15 @@ static void scsi_disk_reset(DeviceState *dev)
 {
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev.qdev, dev);
     uint64_t nb_sectors;
+    AioContext *ctx;
 
     scsi_device_purge_requests(&s->qdev, SENSE_CODE(RESET));
 
+    ctx = blk_get_aio_context(s->qdev.conf.blk);
+    aio_context_acquire(ctx);
     blk_get_geometry(s->qdev.conf.blk, &nb_sectors);
+    aio_context_release(ctx);
+
     nb_sectors /= s->qdev.blocksize / BDRV_SECTOR_SIZE;
     if (nb_sectors) {
         nb_sectors--;
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 8ca5adec5e..e444aa707d 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -831,7 +831,10 @@ static void test_attach_second_node(void)
     qdict_put_str(options, "driver", "raw");
     qdict_put_str(options, "file", "base");
 
+    aio_context_acquire(ctx);
     filter = bdrv_open(NULL, NULL, options, BDRV_O_RDWR, &error_abort);
+    aio_context_release(ctx);
+
     g_assert(blk_get_aio_context(blk) == ctx);
     g_assert(bdrv_get_aio_context(bs) == ctx);
     g_assert(bdrv_get_aio_context(filter) == ctx);
diff --git a/block/meson.build b/block/meson.build
index 90011a2805..3662852dc2 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -139,6 +139,7 @@ block_gen_c = custom_target('block-gen.c',
                             input: files(
                                       '../include/block/block-io.h',
                                       '../include/block/dirty-bitmap.h',
+                                      '../include/block/block_int-io.h',
                                       '../include/block/block-global-state.h',
                                       '../include/sysemu/block-backend-io.h',
                                       'coroutines.h'
-- 
2.38.1


