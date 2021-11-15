Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6F744FDFF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 05:56:52 +0100 (CET)
Received: from localhost ([::1]:33852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmU30-0007ur-MJ
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 23:56:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yadong.qi@intel.com>)
 id 1mmU0a-0004yO-IL; Sun, 14 Nov 2021 23:54:20 -0500
Received: from mga17.intel.com ([192.55.52.151]:4464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yadong.qi@intel.com>)
 id 1mmU0W-0008OU-N7; Sun, 14 Nov 2021 23:54:20 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="214101233"
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; d="scan'208";a="214101233"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2021 20:54:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; d="scan'208";a="644710439"
Received: from yadong-antec.sh.intel.com ([10.239.158.125])
 by fmsmga001.fm.intel.com with ESMTP; 14 Nov 2021 20:54:10 -0800
From: yadong.qi@intel.com
To: qemu-block@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 stefanha@redhat.com, fam@euphon.net, mst@redhat.com
Subject: [PATCH 1/2] block:hdev: support BLKSECDISCARD
Date: Mon, 15 Nov 2021 12:51:59 +0800
Message-Id: <20211115045200.3567293-2-yadong.qi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211115045200.3567293-1-yadong.qi@intel.com>
References: <20211115045200.3567293-1-yadong.qi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=yadong.qi@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kai.z.wang@intel.com, yadong.qi@intel.com, luhai.chen@intel.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yadong Qi <yadong.qi@intel.com>

Add a new option "secdiscard" for block drive. Parse it and
record it in bs->open_flags as bit(BDRV_O_SECDISCARD).

Add a new BDRV_REQ_SECDISCARD bit for secure discard request
from virtual device.

For host_device backend: implement by ioctl(BLKSECDISCARD) on
real host block device.
For other backend, no implementation.

E.g.:
    qemu-system-x86_64 \
    ... \
    -drive file=/dev/mmcblk0p2,if=none,format=raw,discard=on,secdiscard=on,id=sd0 \
    -device virtio-blk-pci,drive=sd0,id=sd0_vblk \
    ...

Signed-off-by: Yadong Qi <yadong.qi@intel.com>
---
 block.c                          | 46 +++++++++++++++++++++++++++++
 block/blkdebug.c                 |  5 ++--
 block/blklogwrites.c             |  6 ++--
 block/blkreplay.c                |  5 ++--
 block/block-backend.c            | 15 ++++++----
 block/copy-before-write.c        |  5 ++--
 block/copy-on-read.c             |  5 ++--
 block/coroutines.h               |  6 ++--
 block/file-posix.c               | 50 ++++++++++++++++++++++++++++----
 block/filter-compress.c          |  5 ++--
 block/io.c                       |  5 ++--
 block/mirror.c                   |  5 ++--
 block/nbd.c                      |  3 +-
 block/nvme.c                     |  3 +-
 block/preallocate.c              |  5 ++--
 block/qcow2-refcount.c           |  4 +--
 block/qcow2.c                    |  3 +-
 block/raw-format.c               |  5 ++--
 block/throttle.c                 |  5 ++--
 hw/block/virtio-blk.c            |  2 +-
 hw/ide/core.c                    |  1 +
 hw/nvme/ctrl.c                   |  3 +-
 hw/scsi/scsi-disk.c              |  2 +-
 include/block/block.h            | 13 +++++++--
 include/block/block_int.h        |  2 +-
 include/block/raw-aio.h          |  4 ++-
 include/sysemu/block-backend.h   |  1 +
 tests/unit/test-block-iothread.c |  9 +++---
 28 files changed, 171 insertions(+), 52 deletions(-)

diff --git a/block.c b/block.c
index 580cb77a70..4f05e96d12 100644
--- a/block.c
+++ b/block.c
@@ -1128,6 +1128,32 @@ int bdrv_parse_discard_flags(const char *mode, int *flags)
     return 0;
 }
 
+/**
+ * Set open flags for a given secdiscard mode
+ *
+ * Return 0 on success, -1 if the secdiscard mode was invalid.
+ */
+int bdrv_parse_secdiscard_flags(const char *mode, int *flags, Error **errp)
+{
+    *flags &= ~BDRV_O_SECDISCARD;
+
+    if (!strcmp(mode, "off")) {
+        /* do nothing */
+    } else if (!strcmp(mode, "on")) {
+        if (!(*flags & BDRV_O_UNMAP)) {
+            error_setg(errp, "cannot enable secdiscard when discard is "
+                             "disabled!");
+            return -1;
+        }
+
+        *flags |= BDRV_O_SECDISCARD;
+    } else {
+        return -1;
+    }
+
+    return 0;
+}
+
 /**
  * Set open flags for a given cache mode
  *
@@ -1695,6 +1721,11 @@ QemuOptsList bdrv_runtime_opts = {
             .type = QEMU_OPT_STRING,
             .help = "discard operation (ignore/off, unmap/on)",
         },
+        {
+            .name = BDRV_OPT_SECDISCARD,
+            .type = QEMU_OPT_STRING,
+            .help = "secure discard operation (off, on)",
+        },
         {
             .name = BDRV_OPT_FORCE_SHARE,
             .type = QEMU_OPT_BOOL,
@@ -1735,6 +1766,7 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
     const char *driver_name = NULL;
     const char *node_name = NULL;
     const char *discard;
+    const char *secdiscard;
     QemuOpts *opts;
     BlockDriver *drv;
     Error *local_err = NULL;
@@ -1829,6 +1861,16 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
         }
     }
 
+
+    secdiscard = qemu_opt_get(opts, BDRV_OPT_SECDISCARD);
+    if (secdiscard != NULL) {
+        if (bdrv_parse_secdiscard_flags(secdiscard, &bs->open_flags,
+                                        errp) != 0) {
+            ret = -EINVAL;
+            goto fail_opts;
+        }
+    }
+
     bs->detect_zeroes =
         bdrv_parse_detect_zeroes(opts, bs->open_flags, &local_err);
     if (local_err) {
@@ -3685,6 +3727,10 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
                                &flags, options, flags, options);
     }
 
+    if (g_strcmp0(qdict_get_try_str(options, BDRV_OPT_SECDISCARD), "on")) {
+            flags |= BDRV_O_SECDISCARD;
+    }
+
     bs->open_flags = flags;
     bs->options = options;
     options = qdict_clone_shallow(options);
diff --git a/block/blkdebug.c b/block/blkdebug.c
index bbf2948703..b49bb6a3e9 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -717,7 +717,8 @@ static int coroutine_fn blkdebug_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static int coroutine_fn blkdebug_co_pdiscard(BlockDriverState *bs,
-                                             int64_t offset, int64_t bytes)
+                                             int64_t offset, int64_t bytes,
+                                             BdrvRequestFlags flags)
 {
     uint32_t align = bs->bl.pdiscard_alignment;
     int err;
@@ -747,7 +748,7 @@ static int coroutine_fn blkdebug_co_pdiscard(BlockDriverState *bs,
         return err;
     }
 
-    return bdrv_co_pdiscard(bs->file, offset, bytes);
+    return bdrv_co_pdiscard(bs->file, offset, bytes, 0);
 }
 
 static int coroutine_fn blkdebug_co_block_status(BlockDriverState *bs,
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index f7a251e91f..d8d81a40ae 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -456,7 +456,8 @@ static int coroutine_fn blk_log_writes_co_do_file_flush(BlkLogWritesFileReq *fr)
 static int coroutine_fn
 blk_log_writes_co_do_file_pdiscard(BlkLogWritesFileReq *fr)
 {
-    return bdrv_co_pdiscard(fr->bs->file, fr->offset, fr->bytes);
+    return bdrv_co_pdiscard(fr->bs->file, fr->offset, fr->bytes,
+                            fr->file_flags);
 }
 
 static int coroutine_fn
@@ -484,7 +485,8 @@ static int coroutine_fn blk_log_writes_co_flush_to_disk(BlockDriverState *bs)
 }
 
 static int coroutine_fn
-blk_log_writes_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
+blk_log_writes_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                                       BdrvRequestFlags flags)
 {
     return blk_log_writes_co_log(bs, offset, bytes, NULL, 0,
                                  blk_log_writes_co_do_file_pdiscard,
diff --git a/block/blkreplay.c b/block/blkreplay.c
index dcbe780ddb..65e66d0766 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -105,10 +105,11 @@ static int coroutine_fn blkreplay_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static int coroutine_fn blkreplay_co_pdiscard(BlockDriverState *bs,
-                                              int64_t offset, int64_t bytes)
+                                              int64_t offset, int64_t bytes,
+                                              BdrvRequestFlags flags)
 {
     uint64_t reqid = blkreplay_next_id();
-    int ret = bdrv_co_pdiscard(bs->file, offset, bytes);
+    int ret = bdrv_co_pdiscard(bs->file, offset, bytes, flags);
     block_request_create(reqid, bs, qemu_coroutine_self());
     qemu_coroutine_yield();
 
diff --git a/block/block-backend.c b/block/block-backend.c
index 12ef80ea17..f2c5776172 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1597,7 +1597,8 @@ BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 int coroutine_fn
-blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
+blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
+                   BdrvRequestFlags flags)
 {
     int ret;
 
@@ -1608,7 +1609,7 @@ blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
         return ret;
     }
 
-    return bdrv_co_pdiscard(blk->root, offset, bytes);
+    return bdrv_co_pdiscard(blk->root, offset, bytes, flags);
 }
 
 static void blk_aio_pdiscard_entry(void *opaque)
@@ -1616,15 +1617,17 @@ static void blk_aio_pdiscard_entry(void *opaque)
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
 
-    rwco->ret = blk_co_do_pdiscard(rwco->blk, rwco->offset, acb->bytes);
+    rwco->ret = blk_co_do_pdiscard(rwco->blk, rwco->offset, acb->bytes,
+                                   rwco->flags);
     blk_aio_complete(acb);
 }
 
 BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk,
                              int64_t offset, int64_t bytes,
+                             BdrvRequestFlags flags,
                              BlockCompletionFunc *cb, void *opaque)
 {
-    return blk_aio_prwv(blk, offset, bytes, NULL, blk_aio_pdiscard_entry, 0,
+    return blk_aio_prwv(blk, offset, bytes, NULL, blk_aio_pdiscard_entry, flags,
                         cb, opaque);
 }
 
@@ -1634,7 +1637,7 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
     int ret;
 
     blk_inc_in_flight(blk);
-    ret = blk_co_do_pdiscard(blk, offset, bytes);
+    ret = blk_co_do_pdiscard(blk, offset, bytes, 0);
     blk_dec_in_flight(blk);
 
     return ret;
@@ -1645,7 +1648,7 @@ int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
     int ret;
 
     blk_inc_in_flight(blk);
-    ret = blk_do_pdiscard(blk, offset, bytes);
+    ret = blk_do_pdiscard(blk, offset, bytes, 0);
     blk_dec_in_flight(blk);
 
     return ret;
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index c30a5ff8de..8d60a3028f 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -64,14 +64,15 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
 }
 
 static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
-                                        int64_t offset, int64_t bytes)
+                                        int64_t offset, int64_t bytes,
+                                       BdrvRequestFlags flags)
 {
     int ret = cbw_do_copy_before_write(bs, offset, bytes, 0);
     if (ret < 0) {
         return ret;
     }
 
-    return bdrv_co_pdiscard(bs->file, offset, bytes);
+    return bdrv_co_pdiscard(bs->file, offset, bytes, 0);
 }
 
 static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 1fc7fb3333..52183cc9a2 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -201,9 +201,10 @@ static int coroutine_fn cor_co_pwrite_zeroes(BlockDriverState *bs,
 
 
 static int coroutine_fn cor_co_pdiscard(BlockDriverState *bs,
-                                        int64_t offset, int64_t bytes)
+                                        int64_t offset, int64_t bytes,
+                                       BdrvRequestFlags flags)
 {
-    return bdrv_co_pdiscard(bs->file, offset, bytes);
+    return bdrv_co_pdiscard(bs->file, offset, bytes, 0);
 }
 
 
diff --git a/block/coroutines.h b/block/coroutines.h
index c8c14a29c8..b0ba771bef 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -98,9 +98,11 @@ int coroutine_fn
 blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 
 int generated_co_wrapper
-blk_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
+blk_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
+                BdrvRequestFlags flags);
 int coroutine_fn
-blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
+blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
+                   BdrvRequestFlags flags);
 
 int generated_co_wrapper blk_do_flush(BlockBackend *blk);
 int coroutine_fn blk_co_do_flush(BlockBackend *blk);
diff --git a/block/file-posix.c b/block/file-posix.c
index 7a27c83060..caa406e429 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -160,6 +160,7 @@ typedef struct BDRVRawState {
     bool is_xfs:1;
 #endif
     bool has_discard:1;
+    bool has_secdiscard:1;
     bool has_write_zeroes:1;
     bool discard_zeroes:1;
     bool use_linux_aio:1;
@@ -727,6 +728,7 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
 #endif /* !defined(CONFIG_LINUX_IO_URING) */
 
     s->has_discard = true;
+    s->has_secdiscard = false;
     s->has_write_zeroes = true;
     if ((bs->open_flags & BDRV_O_NOCACHE) != 0 && !dio_byte_aligned(s->fd)) {
         s->needs_alignment = true;
@@ -765,6 +767,7 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
             s->discard_zeroes = true;
         }
 #endif
+
 #ifdef __linux__
         /* On Linux 3.10, BLKDISCARD leaves stale data in the page cache.  Do
          * not rely on the contents of discarded blocks unless using O_DIRECT.
@@ -1859,6 +1862,35 @@ static int handle_aiocb_discard(void *opaque)
     return ret;
 }
 
+static int handle_aiocb_secdiscard(void *opaque)
+{
+    RawPosixAIOData *aiocb = opaque;
+    int ret = -ENOTSUP;
+    BlockDriverState *bs = aiocb->bs;
+
+    if (!(bs->open_flags & BDRV_O_SECDISCARD)) {
+        return -ENOTSUP;
+    }
+
+    if (aiocb->aio_type & QEMU_AIO_BLKDEV) {
+#ifdef BLKSECDISCARD
+        do {
+            uint64_t range[2] = { aiocb->aio_offset, aiocb->aio_nbytes };
+            if (ioctl(aiocb->aio_fildes, BLKSECDISCARD, range) == 0) {
+                return 0;
+            }
+        } while (errno == EINTR);
+
+        ret = translate_err(-errno);
+#endif
+    }
+
+    if (ret == -ENOTSUP) {
+        bs->open_flags &= ~BDRV_O_SECDISCARD;
+    }
+    return ret;
+}
+
 /*
  * Help alignment probing by allocating the first block.
  *
@@ -2953,7 +2985,7 @@ static void raw_account_discard(BDRVRawState *s, uint64_t nbytes, int ret)
 
 static coroutine_fn int
 raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
-                bool blkdev)
+                bool blkdev, BdrvRequestFlags flags)
 {
     BDRVRawState *s = bs->opaque;
     RawPosixAIOData acb;
@@ -2971,15 +3003,20 @@ raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
         acb.aio_type |= QEMU_AIO_BLKDEV;
     }
 
-    ret = raw_thread_pool_submit(bs, handle_aiocb_discard, &acb);
+    if (flags & BDRV_REQ_SECDISCARD) {
+        ret = raw_thread_pool_submit(bs, handle_aiocb_secdiscard, &acb);
+    } else {
+        ret = raw_thread_pool_submit(bs, handle_aiocb_discard, &acb);
+    }
     raw_account_discard(s, bytes, ret);
     return ret;
 }
 
 static coroutine_fn int
-raw_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
+raw_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                BdrvRequestFlags flags)
 {
-    return raw_do_pdiscard(bs, offset, bytes, false);
+    return raw_do_pdiscard(bs, offset, bytes, false, flags);
 }
 
 static int coroutine_fn
@@ -3602,7 +3639,8 @@ hdev_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
 #endif /* linux */
 
 static coroutine_fn int
-hdev_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
+hdev_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                                       BdrvRequestFlags flags)
 {
     BDRVRawState *s = bs->opaque;
     int ret;
@@ -3612,7 +3650,7 @@ hdev_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
         raw_account_discard(s, bytes, ret);
         return ret;
     }
-    return raw_do_pdiscard(bs, offset, bytes, true);
+    return raw_do_pdiscard(bs, offset, bytes, true, flags);
 }
 
 static coroutine_fn int hdev_co_pwrite_zeroes(BlockDriverState *bs,
diff --git a/block/filter-compress.c b/block/filter-compress.c
index d5be538619..aced5d6c8f 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -94,9 +94,10 @@ static int coroutine_fn compress_co_pwrite_zeroes(BlockDriverState *bs,
 
 
 static int coroutine_fn compress_co_pdiscard(BlockDriverState *bs,
-                                             int64_t offset, int64_t bytes)
+                                             int64_t offset, int64_t bytes,
+                                             BdrvRequestFlags flags)
 {
-    return bdrv_co_pdiscard(bs->file, offset, bytes);
+    return bdrv_co_pdiscard(bs->file, offset, bytes, 0);
 }
 
 
diff --git a/block/io.c b/block/io.c
index bb0a254def..b6ff244795 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3054,7 +3054,7 @@ early_exit:
 }
 
 int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
-                                  int64_t bytes)
+                                  int64_t bytes, BdrvRequestFlags flags)
 {
     BdrvTrackedRequest req;
     int ret;
@@ -3139,8 +3139,9 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
             ret = -ENOMEDIUM;
             goto out;
         }
+
         if (bs->drv->bdrv_co_pdiscard) {
-            ret = bs->drv->bdrv_co_pdiscard(bs, offset, num);
+            ret = bs->drv->bdrv_co_pdiscard(bs, offset, num, flags);
         } else {
             BlockAIOCB *acb;
             CoroutineIOCompletion co = {
diff --git a/block/mirror.c b/block/mirror.c
index efec2c7674..d91a6fe2ac 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1440,7 +1440,7 @@ static int coroutine_fn bdrv_mirror_top_do_write(BlockDriverState *bs,
         break;
 
     case MIRROR_METHOD_DISCARD:
-        ret = bdrv_co_pdiscard(bs->backing, offset, bytes);
+        ret = bdrv_co_pdiscard(bs->backing, offset, bytes, 0);
         break;
 
     default:
@@ -1516,7 +1516,8 @@ static int coroutine_fn bdrv_mirror_top_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static int coroutine_fn bdrv_mirror_top_pdiscard(BlockDriverState *bs,
-    int64_t offset, int64_t bytes)
+    int64_t offset, int64_t bytes,
+    BdrvRequestFlags flags)
 {
     return bdrv_mirror_top_do_write(bs, MIRROR_METHOD_DISCARD, offset, bytes,
                                     NULL, 0);
diff --git a/block/nbd.c b/block/nbd.c
index 5ef462db1b..54fc433c0f 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1296,7 +1296,8 @@ static int nbd_client_co_flush(BlockDriverState *bs)
 }
 
 static int nbd_client_co_pdiscard(BlockDriverState *bs, int64_t offset,
-                                  int64_t bytes)
+                                  int64_t bytes,
+                                  BdrvRequestFlags flags)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = {
diff --git a/block/nvme.c b/block/nvme.c
index e4f336d79c..217523438a 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1363,7 +1363,8 @@ static coroutine_fn int nvme_co_pwrite_zeroes(BlockDriverState *bs,
 
 static int coroutine_fn nvme_co_pdiscard(BlockDriverState *bs,
                                          int64_t offset,
-                                         int64_t bytes)
+                                         int64_t bytes,
+                                         BdrvRequestFlags flags)
 {
     BDRVNVMeState *s = bs->opaque;
     NVMeQueuePair *ioq = s->queues[INDEX_IO(0)];
diff --git a/block/preallocate.c b/block/preallocate.c
index 1d4233f730..4a098747d1 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -235,9 +235,10 @@ static coroutine_fn int preallocate_co_preadv_part(
 }
 
 static int coroutine_fn preallocate_co_pdiscard(BlockDriverState *bs,
-                                               int64_t offset, int64_t bytes)
+                                               int64_t offset, int64_t bytes,
+                                               BdrvRequestFlags flags)
 {
-    return bdrv_co_pdiscard(bs->file, offset, bytes);
+    return bdrv_co_pdiscard(bs->file, offset, bytes, flags);
 }
 
 static bool can_write_resize(uint64_t perm)
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 4614572252..6a81dfd13a 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -738,7 +738,7 @@ void qcow2_process_discards(BlockDriverState *bs, int ret)
 
         /* Discard is optional, ignore the return value */
         if (ret >= 0) {
-            int r2 = bdrv_pdiscard(bs->file, d->offset, d->bytes);
+            int r2 = bdrv_pdiscard(bs->file, d->offset, d->bytes, 0);
             if (r2 < 0) {
                 trace_qcow2_process_discards_failed_region(d->offset, d->bytes,
                                                            r2);
@@ -1169,7 +1169,7 @@ void qcow2_free_any_cluster(BlockDriverState *bs, uint64_t l2_entry,
              ctype == QCOW2_CLUSTER_ZERO_ALLOC))
         {
             bdrv_pdiscard(s->data_file, l2_entry & L2E_OFFSET_MASK,
-                          s->cluster_size);
+                          s->cluster_size, 0);
         }
         return;
     }
diff --git a/block/qcow2.c b/block/qcow2.c
index d509016756..258f4f94e0 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3996,7 +3996,8 @@ static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static coroutine_fn int qcow2_co_pdiscard(BlockDriverState *bs,
-                                          int64_t offset, int64_t bytes)
+                                          int64_t offset, int64_t bytes,
+                                          BdrvRequestFlags flags)
 {
     int ret;
     BDRVQcow2State *s = bs->opaque;
diff --git a/block/raw-format.c b/block/raw-format.c
index bda757fd19..d149982e8e 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -302,7 +302,8 @@ static int coroutine_fn raw_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
-                                        int64_t offset, int64_t bytes)
+                                        int64_t offset, int64_t bytes,
+                                        BdrvRequestFlags flags)
 {
     int ret;
 
@@ -310,7 +311,7 @@ static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
     if (ret) {
         return ret;
     }
-    return bdrv_co_pdiscard(bs->file, offset, bytes);
+    return bdrv_co_pdiscard(bs->file, offset, bytes, flags);
 }
 
 static int64_t raw_getlength(BlockDriverState *bs)
diff --git a/block/throttle.c b/block/throttle.c
index 6e8d52fa24..d7e6967296 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -145,12 +145,13 @@ static int coroutine_fn throttle_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static int coroutine_fn throttle_co_pdiscard(BlockDriverState *bs,
-                                             int64_t offset, int64_t bytes)
+                                             int64_t offset, int64_t bytes,
+                                             BdrvRequestFlags flags)
 {
     ThrottleGroupMember *tgm = bs->opaque;
     throttle_group_co_io_limits_intercept(tgm, bytes, true);
 
-    return bdrv_co_pdiscard(bs->file, offset, bytes);
+    return bdrv_co_pdiscard(bs->file, offset, bytes, flags);
 }
 
 static int coroutine_fn throttle_co_pwritev_compressed(BlockDriverState *bs,
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index f139cd7cc9..dbc4c5a3cd 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -600,7 +600,7 @@ static uint8_t virtio_blk_handle_discard_write_zeroes(VirtIOBlockReq *req,
             goto err;
         }
 
-        blk_aio_pdiscard(s->blk, sector << BDRV_SECTOR_BITS, bytes,
+        blk_aio_pdiscard(s->blk, sector << BDRV_SECTOR_BITS, bytes, 0,
                          virtio_blk_discard_write_zeroes_complete, req);
     }
 
diff --git a/hw/ide/core.c b/hw/ide/core.c
index e28f8aad61..47c6cf116d 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -483,6 +483,7 @@ static void ide_issue_trim_cb(void *opaque, int ret)
                 iocb->aiocb = blk_aio_pdiscard(s->blk,
                                                sector << BDRV_SECTOR_BITS,
                                                count << BDRV_SECTOR_BITS,
+                                               0,
                                                ide_issue_trim_cb, opaque);
                 return;
             }
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 6a571d18cf..45c45b83c7 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2325,7 +2325,7 @@ next:
     }
 
     iocb->aiocb = blk_aio_pdiscard(ns->blkconf.blk, nvme_l2b(ns, slba),
-                                   nvme_l2b(ns, nlb),
+                                   nvme_l2b(ns, nlb), 0,
                                    nvme_dsm_md_cb, iocb);
     return;
 
@@ -5429,6 +5429,7 @@ static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
     uint16_t status;
 
+
     iocb = qemu_aio_get(&nvme_format_aiocb_info, NULL, nvme_misc_cb, req);
 
     iocb->req = req;
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index e8a547dbb7..b83ab3e471 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1634,7 +1634,7 @@ static void scsi_unmap_complete_noio(UnmapCBData *data, int ret)
         r->req.aiocb = blk_aio_pdiscard(s->qdev.conf.blk,
                                         r->sector * BDRV_SECTOR_SIZE,
                                         r->sector_count * BDRV_SECTOR_SIZE,
-                                        scsi_unmap_complete, data);
+                                        0, scsi_unmap_complete, data);
         data->count--;
         data->inbuf += 16;
         return;
diff --git a/include/block/block.h b/include/block/block.h
index e5dd22b034..bfa26de835 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -87,6 +87,11 @@ typedef enum {
      */
     BDRV_REQ_NO_WAIT = 0x400,
 
+    /*
+     * Request for secure discard
+     */
+    BDRV_REQ_SECDISCARD = 0x800,
+
     /* Mask of valid flags */
     BDRV_REQ_MASK               = 0x7ff,
 } BdrvRequestFlags;
@@ -122,6 +127,7 @@ typedef struct HDGeometry {
 #define BDRV_O_NO_IO       0x10000 /* don't initialize for I/O */
 #define BDRV_O_AUTO_RDONLY 0x20000 /* degrade to read-only if opening read-write fails */
 #define BDRV_O_IO_URING    0x40000 /* use io_uring instead of the thread pool */
+#define BDRV_O_SECDISCARD  0x80000 /* guest SECDISCARD operations */
 
 #define BDRV_O_CACHE_MASK  (BDRV_O_NOCACHE | BDRV_O_NO_FLUSH)
 
@@ -134,6 +140,7 @@ typedef struct HDGeometry {
 #define BDRV_OPT_READ_ONLY      "read-only"
 #define BDRV_OPT_AUTO_READ_ONLY "auto-read-only"
 #define BDRV_OPT_DISCARD        "discard"
+#define BDRV_OPT_SECDISCARD     "secdiscard"
 #define BDRV_OPT_FORCE_SHARE    "force-share"
 
 
@@ -370,6 +377,7 @@ int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
 int bdrv_parse_aio(const char *mode, int *flags);
 int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough);
 int bdrv_parse_discard_flags(const char *mode, int *flags);
+int bdrv_parse_secdiscard_flags(const char *mode, int *flags, Error **errp);
 BdrvChild *bdrv_open_child(const char *filename,
                            QDict *options, const char *bdref_key,
                            BlockDriverState* parent,
@@ -513,8 +521,9 @@ void bdrv_drain_all(void);
                    cond); })
 
 int generated_co_wrapper bdrv_pdiscard(BdrvChild *child, int64_t offset,
-                                       int64_t bytes);
-int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
+                                       int64_t bytes, BdrvRequestFlags flags);
+int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes,
+                     BdrvRequestFlags flags);
 int bdrv_has_zero_init_1(BlockDriverState *bs);
 int bdrv_has_zero_init(BlockDriverState *bs);
 bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
diff --git a/include/block/block_int.h b/include/block/block_int.h
index f4c75e8ba9..773e5131d4 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -303,7 +303,7 @@ struct BlockDriver {
     int coroutine_fn (*bdrv_co_pwrite_zeroes)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, BdrvRequestFlags flags);
     int coroutine_fn (*bdrv_co_pdiscard)(BlockDriverState *bs,
-        int64_t offset, int64_t bytes);
+        int64_t offset, int64_t bytes, BdrvRequestFlags flags);
 
     /* Map [offset, offset + nbytes) range onto a child of @bs to copy from,
      * and invoke bdrv_co_copy_range_from(child, ...), or invoke
diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
index 21fc10c4c9..d9138277e3 100644
--- a/include/block/raw-aio.h
+++ b/include/block/raw-aio.h
@@ -29,6 +29,7 @@
 #define QEMU_AIO_WRITE_ZEROES 0x0020
 #define QEMU_AIO_COPY_RANGE   0x0040
 #define QEMU_AIO_TRUNCATE     0x0080
+#define QEMU_AIO_SECDISCARD   0x0100
 #define QEMU_AIO_TYPE_MASK \
         (QEMU_AIO_READ | \
          QEMU_AIO_WRITE | \
@@ -37,7 +38,8 @@
          QEMU_AIO_DISCARD | \
          QEMU_AIO_WRITE_ZEROES | \
          QEMU_AIO_COPY_RANGE | \
-         QEMU_AIO_TRUNCATE)
+         QEMU_AIO_TRUNCATE | \
+         QEMU_AIO_SECDISCARD)
 
 /* AIO flags */
 #define QEMU_AIO_MISALIGNED   0x1000
diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index e5e1524f06..53630ff791 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -179,6 +179,7 @@ BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, int64_t offset,
 BlockAIOCB *blk_aio_flush(BlockBackend *blk,
                           BlockCompletionFunc *cb, void *opaque);
 BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
+                             BdrvRequestFlags flags,
                              BlockCompletionFunc *cb, void *opaque);
 void blk_aio_cancel(BlockAIOCB *acb);
 void blk_aio_cancel_async(BlockAIOCB *acb);
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index aea660aeed..fa0a1b0fed 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -48,7 +48,8 @@ static int coroutine_fn bdrv_test_co_pwritev(BlockDriverState *bs,
 }
 
 static int coroutine_fn bdrv_test_co_pdiscard(BlockDriverState *bs,
-                                              int64_t offset, int64_t bytes)
+                                              int64_t offset, int64_t bytes,
+                                              BdrvRequestFlags flags)
 {
     return 0;
 }
@@ -164,16 +165,16 @@ static void test_sync_op_pdiscard(BdrvChild *c)
 
     /* Normal success path */
     c->bs->open_flags |= BDRV_O_UNMAP;
-    ret = bdrv_pdiscard(c, 0, 512);
+    ret = bdrv_pdiscard(c, 0, 512, 0);
     g_assert_cmpint(ret, ==, 0);
 
     /* Early success: UNMAP not supported */
     c->bs->open_flags &= ~BDRV_O_UNMAP;
-    ret = bdrv_pdiscard(c, 0, 512);
+    ret = bdrv_pdiscard(c, 0, 512, 0);
     g_assert_cmpint(ret, ==, 0);
 
     /* Early error: Negative offset */
-    ret = bdrv_pdiscard(c, -2, 512);
+    ret = bdrv_pdiscard(c, -2, 512, 0);
     g_assert_cmpint(ret, ==, -EIO);
 }
 
-- 
2.25.1


