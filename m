Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3211B64B195
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 09:56:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p512x-0006QC-T6; Tue, 13 Dec 2022 03:53:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p512u-0006NS-9v
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:53:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p512r-000319-Sv
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:53:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670921628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ofQsHMVEKqYjNoxBrvrtpbtIpDKuJEhBWsOUKD5ta+g=;
 b=YAVJzMSGg1fAax3zpMsOR9rg1D39ygfGZdtiNVWPpTSVYtHISt2e6HERYmBTLsV9qD3gGt
 +QzC+0GHP4cRDggx0yMru/AqYy9GISUaE94lZ4LgYemjoMCcYTMG+ApvhrSIB7FtHEa+6B
 sDksaqWgWUHF/mS+bN3JBvS8fBFUlaM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-9_wbktHgNoGwQWZjeqdiHw-1; Tue, 13 Dec 2022 03:53:38 -0500
X-MC-Unique: 9_wbktHgNoGwQWZjeqdiHw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3BED800960;
 Tue, 13 Dec 2022 08:53:37 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB189492C14;
 Tue, 13 Dec 2022 08:53:36 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH 05/14] block: Convert bdrv_refresh_total_sectors() to
 co_wrapper_mixed
Date: Tue, 13 Dec 2022 09:53:11 +0100
Message-Id: <20221213085320.95673-6-kwolf@redhat.com>
In-Reply-To: <20221213085320.95673-1-kwolf@redhat.com>
References: <20221213085320.95673-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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
---
 include/block/block-io.h          |  8 ++++++--
 include/block/block_int-common.h  |  2 +-
 include/block/block_int-io.h      |  5 ++++-
 include/sysemu/block-backend-io.h | 10 ++++++++--
 block.c                           | 26 +++++++++++++++++++++-----
 block/block-backend.c             | 10 ++++++----
 block/commit.c                    |  4 ++--
 block/mirror.c                    |  4 ++--
 hw/scsi/scsi-disk.c               |  5 +++++
 tests/unit/test-block-iothread.c  |  3 +++
 block/meson.build                 |  1 +
 11 files changed, 59 insertions(+), 19 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 3bf201f7f4..fe1fa339be 100644
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
index adccb4e540..0e705e08f4 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -684,7 +684,7 @@ struct BlockDriver {
     int coroutine_fn (*bdrv_co_truncate)(BlockDriverState *bs, int64_t offset,
                                          bool exact, PreallocMode prealloc,
                                          BdrvRequestFlags flags, Error **errp);
-    int64_t (*bdrv_getlength)(BlockDriverState *bs);
+    int64_t coroutine_fn (*bdrv_getlength)(BlockDriverState *bs);
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
index d8cc8d74f5..8ad8854ecb 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -57,9 +57,15 @@ bool blk_is_inserted(BlockBackend *blk);
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
index fdcd06d05d..e1a8f7af4d 100644
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
diff --git a/block/block-backend.c b/block/block-backend.c
index 5a357f504a..0194d86113 100644
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


