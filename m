Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3418160FC7B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 17:55:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo5Bd-0000rY-PL; Thu, 27 Oct 2022 11:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo5BY-0000ci-H9; Thu, 27 Oct 2022 11:52:48 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo5BU-0002Jg-Jp; Thu, 27 Oct 2022 11:52:46 -0400
Received: by mail-pg1-x52d.google.com with SMTP id s196so1875289pgs.3;
 Thu, 27 Oct 2022 08:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DqMfDLVQb6KW3GUhA5mdqOBzr6JRgJt4lHM65uuaYlk=;
 b=YrzKbVIvGWaalx0+ihHkW+7VqSXElLiYOirzU748QD4QcVCRJQrncJwFjmfJb1OWU1
 KVfai3H3e1ipkfXTPPAhFpfOZ/jmzTtoExn7ZDrQPa8BXLlPY7IZ8HX7dW/5Z8lyRKb7
 h+hRUTDQqwryQQwMVYTMWLbUlXiLns5WggAuecUT7LfTSFHoKBhAsbt9jC6uEKptf2Yy
 E48S12r+vmdZwwF4vhlLS9zEAboENs3cLG653E4TF7Il44l3ysS/otpf3y9dockt6cQQ
 1ZAR4d/iF0cYSmtU1JHJxf1G9V63KosMCGuKCq5dadQrUdd1a3g+3PFQ2XNCjOCjmIH2
 AIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DqMfDLVQb6KW3GUhA5mdqOBzr6JRgJt4lHM65uuaYlk=;
 b=Vf7Kkso//DqOEbTwPPTvnkOCi6Y+SDQcewa0YuV/iptRF9uZ2NiW0ns7RCnUMcHPug
 +aa0F0GdhWa3rGkdWvtNTKibYZGSxipb2Yke2YEP5WvMu26buPi87YvEjw81978Z/lIc
 SOVZF1gWkMwplzYwS9cYTaP1AYGkQy1DiB1qIDEODkUuMbefzRbluNxbzI32qMGC/VCm
 1gioQPm2nlDsBw/rR+xBIGHJ6zfypJknX0lsiSvosk2LoN5VdhIeJM7Z5LJjQ7EtulfU
 Oj1inloGEx+QL/UE1r8+D1Fl26DUWvgYrTnlCqJFa5LCpYvpzhZs4N2QKBt2VIDWh2IR
 eaBg==
X-Gm-Message-State: ACrzQf29d4mqn5g7+ShWTgDKuXE24S6R99GD2XPARmt3xXpGRDtllj2F
 0E1GXpa+xRn2KE+Dbpw8nJBCIOQ3GJNvxUaq
X-Google-Smtp-Source: AMsMyM59qM9S9NoyeT0tybl7uM7iOa4tWyDPtmz2eApmfbOz1y+EvSNuBrBCfxpKZe1R+IWBpqtA9A==
X-Received: by 2002:a63:2bd4:0:b0:451:5df1:4b15 with SMTP id
 r203-20020a632bd4000000b004515df14b15mr43488411pgr.518.1666885962027; 
 Thu, 27 Oct 2022 08:52:42 -0700 (PDT)
Received: from roots.. ([112.44.202.248]) by smtp.gmail.com with ESMTPSA id
 f21-20020a623815000000b0056c058ab000sm1327744pfa.155.2022.10.27.08.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 08:52:41 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Stefano Garzarella <sgarzare@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dmitry.fomichev@wdc.com,
 qemu-block@nongnu.org, Julia Suvorova <jusual@redhat.com>, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v5 2/4] block: introduce zone append write for zoned devices
Date: Thu, 27 Oct 2022 23:52:13 +0800
Message-Id: <20221027155215.21374-3-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221027155215.21374-1-faithilikerun@gmail.com>
References: <20221027155215.21374-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

A zone append command is a write operation that specifies the first
logical block of a zone as the write position. When writing to a zoned
block device using zone append, the byte offset of writes is pointing
to the write pointer of that zone. Upon completion the device will
respond with the position the data has been written in the zone.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/block-backend.c             | 65 +++++++++++++++++++++++++++++++
 block/file-posix.c                | 60 +++++++++++++++++++++++++---
 block/io.c                        | 21 ++++++++++
 block/io_uring.c                  |  4 ++
 block/linux-aio.c                 |  3 ++
 block/raw-format.c                |  8 ++++
 include/block/block-io.h          |  3 ++
 include/block/block_int-common.h  |  5 +++
 include/block/raw-aio.h           |  4 +-
 include/sysemu/block-backend-io.h |  9 +++++
 10 files changed, 176 insertions(+), 6 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 731f23e816..26cc8f9722 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1439,6 +1439,9 @@ typedef struct BlkRwCo {
         struct {
             unsigned long op;
         } zone_mgmt;
+        struct {
+            int64_t *offset;
+        } zone_append;
     };
 } BlkRwCo;
 
@@ -1871,6 +1874,47 @@ BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
     return &acb->common;
 }
 
+static void coroutine_fn blk_aio_zone_append_entry(void *opaque)
+{
+    BlkAioEmAIOCB *acb = opaque;
+    BlkRwCo *rwco = &acb->rwco;
+
+    rwco->ret = blk_co_zone_append(rwco->blk, rwco->zone_append.offset,
+                                   rwco->iobuf, rwco->flags);
+    blk_aio_complete(acb);
+}
+
+BlockAIOCB *blk_aio_zone_append(BlockBackend *blk, int64_t *offset,
+                                QEMUIOVector *qiov, BdrvRequestFlags flags,
+                                BlockCompletionFunc *cb, void *opaque) {
+    BlkAioEmAIOCB *acb;
+    Coroutine *co;
+    IO_CODE();
+
+    blk_inc_in_flight(blk);
+    acb = blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
+    acb->rwco = (BlkRwCo) {
+        .blk    = blk,
+        .ret    = NOT_DONE,
+        .flags  = flags,
+        .iobuf  = qiov,
+        .zone_append = {
+                .offset = offset,
+        },
+    };
+    acb->has_returned = false;
+
+    co = qemu_coroutine_create(blk_aio_zone_append_entry, acb);
+    bdrv_coroutine_enter(blk_bs(blk), co);
+    acb->has_returned = true;
+    if (acb->rwco.ret != NOT_DONE) {
+        replay_bh_schedule_oneshot_event(blk_get_aio_context(blk),
+                                         blk_aio_complete_bh, acb);
+    }
+
+    return &acb->common;
+}
+
 /*
  * Send a zone_report command.
  * offset is a byte offset from the start of the device. No alignment
@@ -1922,6 +1966,27 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
     return ret;
 }
 
+/*
+ * Send a zone_append command.
+ */
+int coroutine_fn blk_co_zone_append(BlockBackend *blk, int64_t *offset,
+        QEMUIOVector *qiov, BdrvRequestFlags flags)
+{
+    int ret;
+    IO_CODE();
+
+    blk_inc_in_flight(blk);
+    blk_wait_while_drained(blk);
+    if (!blk_is_available(blk)) {
+        blk_dec_in_flight(blk);
+        return -ENOMEDIUM;
+    }
+
+    ret = bdrv_co_zone_append(blk_bs(blk), offset, qiov, flags);
+    blk_dec_in_flight(blk);
+    return ret;
+}
+
 void blk_drain(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
diff --git a/block/file-posix.c b/block/file-posix.c
index fbab23f450..9c1afb7749 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -159,6 +159,7 @@ typedef struct BDRVRawState {
     bool has_write_zeroes:1;
     bool use_linux_aio:1;
     bool use_linux_io_uring:1;
+    int64_t *offset; /* offset of zone append operation */
     int page_cache_inconsistent; /* errno from fdatasync failure */
     bool has_fallocate;
     bool needs_alignment;
@@ -1484,6 +1485,11 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
             bs->bl.max_active_zones = ret;
         }
 
+        ret = get_sysfs_long_val(&st, "physical_block_size");
+        if (ret >= 0) {
+            bs->bl.write_granularity = ret;
+        }
+
         bs->bl.wps = g_malloc(sizeof(BlockZoneWps) + sizeof(int64_t) * ret);
         ret = get_zones_wp(s->fd, bs->bl.wps, 0, bs->bl.nr_zones);
         if (ret < 0) {
@@ -1664,7 +1670,7 @@ static ssize_t handle_aiocb_rw_vector(RawPosixAIOData *aiocb)
     ssize_t len;
 
     do {
-        if (aiocb->aio_type & QEMU_AIO_WRITE)
+        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))
             len = qemu_pwritev(aiocb->aio_fildes,
                                aiocb->io.iov,
                                aiocb->io.niov,
@@ -1694,7 +1700,7 @@ static ssize_t handle_aiocb_rw_linear(RawPosixAIOData *aiocb, char *buf)
     ssize_t len;
 
     while (offset < aiocb->aio_nbytes) {
-        if (aiocb->aio_type & QEMU_AIO_WRITE) {
+        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
             len = pwrite(aiocb->aio_fildes,
                          (const char *)buf + offset,
                          aiocb->aio_nbytes - offset,
@@ -1787,7 +1793,7 @@ static int handle_aiocb_rw(void *opaque)
     }
 
     nbytes = handle_aiocb_rw_linear(aiocb, buf);
-    if (!(aiocb->aio_type & QEMU_AIO_WRITE)) {
+    if (!(aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))) {
         char *p = buf;
         size_t count = aiocb->aio_nbytes, copy;
         int i;
@@ -2426,6 +2432,10 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
 #if defined(CONFIG_BLKZONED)
     if (bs->bl.wps) {
         qemu_co_mutex_lock(&bs->bl.wps->colock);
+        if (type & QEMU_AIO_ZONE_APPEND && bs->bl.zone_size) {
+            int index = offset / bs->bl.zone_size;
+            offset = bs->bl.wps->wp[index];
+        }
     }
 #endif
 
@@ -2473,9 +2483,13 @@ out:
 #if defined(CONFIG_BLKZONED)
     BlockZoneWps *wps = bs->bl.wps;
     if (ret == 0) {
-        if (type & QEMU_AIO_WRITE && wps && bs->bl.zone_size) {
+        if ((type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))
+            && wps && bs->bl.zone_size) {
             int index = offset / bs->bl.zone_size;
             if (!BDRV_ZT_IS_CONV(wps->wp[index])) {
+                if (type & QEMU_AIO_ZONE_APPEND) {
+                    *s->offset = wps->wp[index];
+                }
                 /* Advance the wp if needed */
                 if (offset + bytes > wps->wp[index]) {
                     wps->wp[index] = offset + bytes;
@@ -2483,7 +2497,7 @@ out:
             }
         }
     } else {
-        if (type & QEMU_AIO_WRITE) {
+        if (type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
             update_zones_wp(s->fd, bs->bl.wps, 0, 1);
         }
     }
@@ -3495,6 +3509,41 @@ out:
 }
 #endif
 
+#if defined(CONFIG_BLKZONED)
+static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
+                                           int64_t *offset,
+                                           QEMUIOVector *qiov,
+                                           BdrvRequestFlags flags) {
+    assert(flags == 0);
+    int64_t zone_size_mask = bs->bl.zone_size - 1;
+    int64_t iov_len = 0;
+    int64_t len = 0;
+    BDRVRawState *s = bs->opaque;
+    s->offset = offset;
+
+
+    if (*offset & zone_size_mask) {
+        error_report("sector offset %" PRId64 " is not aligned to zone size "
+                     "%" PRId32 "", *offset / 512, bs->bl.zone_size / 512);
+        return -EINVAL;
+    }
+
+    int64_t wg = bs->bl.write_granularity;
+    int64_t wg_mask = wg - 1;
+    for (int i = 0; i < qiov->niov; i++) {
+        iov_len = qiov->iov[i].iov_len;
+        if (iov_len & wg_mask) {
+            error_report("len of IOVector[%d] %" PRId64 " is not aligned to "
+                         "block size %" PRId64 "", i, iov_len, wg);
+            return -EINVAL;
+        }
+        len += iov_len;
+    }
+
+    return raw_co_prw(bs, *offset, len, qiov, QEMU_AIO_ZONE_APPEND);
+}
+#endif
+
 static coroutine_fn int
 raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
                 bool blkdev)
@@ -4270,6 +4319,7 @@ static BlockDriver bdrv_zoned_host_device = {
     /* zone management operations */
     .bdrv_co_zone_report = raw_co_zone_report,
     .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
+    .bdrv_co_zone_append = raw_co_zone_append,
 };
 #endif
 
diff --git a/block/io.c b/block/io.c
index 88f707ea4d..03e1109056 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3230,6 +3230,27 @@ out:
     return co.ret;
 }
 
+int coroutine_fn bdrv_co_zone_append(BlockDriverState *bs, int64_t *offset,
+                        QEMUIOVector *qiov,
+                        BdrvRequestFlags flags)
+{
+    BlockDriver *drv = bs->drv;
+    CoroutineIOCompletion co = {
+            .coroutine = qemu_coroutine_self(),
+    };
+    IO_CODE();
+
+    bdrv_inc_in_flight(bs);
+    if (!drv || !drv->bdrv_co_zone_append) {
+        co.ret = -ENOTSUP;
+        goto out;
+    }
+    co.ret = drv->bdrv_co_zone_append(bs, offset, qiov, flags);
+out:
+    bdrv_dec_in_flight(bs);
+    return co.ret;
+}
+
 void *qemu_blockalign(BlockDriverState *bs, size_t size)
 {
     IO_CODE();
diff --git a/block/io_uring.c b/block/io_uring.c
index 973e15d876..f7488c241a 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -345,6 +345,10 @@ static int luring_do_submit(int fd, LuringAIOCB *luringcb, LuringState *s,
         io_uring_prep_writev(sqes, fd, luringcb->qiov->iov,
                              luringcb->qiov->niov, offset);
         break;
+    case QEMU_AIO_ZONE_APPEND:
+        io_uring_prep_writev(sqes, fd, luringcb->qiov->iov,
+                             luringcb->qiov->niov, offset);
+        break;
     case QEMU_AIO_READ:
         io_uring_prep_readv(sqes, fd, luringcb->qiov->iov,
                             luringcb->qiov->niov, offset);
diff --git a/block/linux-aio.c b/block/linux-aio.c
index d2cfb7f523..1959834156 100644
--- a/block/linux-aio.c
+++ b/block/linux-aio.c
@@ -389,6 +389,9 @@ static int laio_do_submit(int fd, struct qemu_laiocb *laiocb, off_t offset,
     case QEMU_AIO_WRITE:
         io_prep_pwritev(iocbs, fd, qiov->iov, qiov->niov, offset);
         break;
+    case QEMU_AIO_ZONE_APPEND:
+        io_prep_pwritev(iocbs, fd, qiov->iov, qiov->niov, offset);
+        break;
     case QEMU_AIO_READ:
         io_prep_preadv(iocbs, fd, qiov->iov, qiov->niov, offset);
         break;
diff --git a/block/raw-format.c b/block/raw-format.c
index 18dc52a150..33bff8516e 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -325,6 +325,13 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
     return bdrv_co_zone_mgmt(bs->file->bs, op, offset, len);
 }
 
+static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
+                                           int64_t *offset,
+                                           QEMUIOVector *qiov,
+                                           BdrvRequestFlags flags) {
+    return bdrv_co_zone_append(bs->file->bs, offset, qiov, flags);
+}
+
 static int64_t raw_getlength(BlockDriverState *bs)
 {
     int64_t len;
@@ -629,6 +636,7 @@ BlockDriver bdrv_raw = {
     .bdrv_co_pdiscard     = &raw_co_pdiscard,
     .bdrv_co_zone_report  = &raw_co_zone_report,
     .bdrv_co_zone_mgmt  = &raw_co_zone_mgmt,
+    .bdrv_co_zone_append = &raw_co_zone_append,
     .bdrv_co_block_status = &raw_co_block_status,
     .bdrv_co_copy_range_from = &raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = &raw_co_copy_range_to,
diff --git a/include/block/block-io.h b/include/block/block-io.h
index f0cdf67d33..6a54453578 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -94,6 +94,9 @@ int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
                                      BlockZoneDescriptor *zones);
 int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
                                    int64_t offset, int64_t len);
+int coroutine_fn bdrv_co_zone_append(BlockDriverState *bs, int64_t *offset,
+                                     QEMUIOVector *qiov,
+                                     BdrvRequestFlags flags);
 
 int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
 bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 4effff3aa1..43ae78171e 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -701,6 +701,9 @@ struct BlockDriver {
             BlockZoneDescriptor *zones);
     int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, BlockZoneOp op,
             int64_t offset, int64_t len);
+    int coroutine_fn (*bdrv_co_zone_append)(BlockDriverState *bs,
+            int64_t *offset, QEMUIOVector *qiov,
+            BdrvRequestFlags flags);
 
     /* removable device specific */
     bool (*bdrv_is_inserted)(BlockDriverState *bs);
@@ -857,6 +860,8 @@ typedef struct BlockLimits {
 
     /* array of write pointers' location of each zone in the zoned device. */
     BlockZoneWps *wps;
+
+    int64_t write_granularity;
 } BlockLimits;
 
 typedef struct BdrvOpBlocker BdrvOpBlocker;
diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
index 877b2240b3..53033a5ca7 100644
--- a/include/block/raw-aio.h
+++ b/include/block/raw-aio.h
@@ -31,6 +31,7 @@
 #define QEMU_AIO_TRUNCATE     0x0080
 #define QEMU_AIO_ZONE_REPORT  0x0100
 #define QEMU_AIO_ZONE_MGMT    0x0200
+#define QEMU_AIO_ZONE_APPEND  0x0400
 #define QEMU_AIO_TYPE_MASK \
         (QEMU_AIO_READ | \
          QEMU_AIO_WRITE | \
@@ -41,7 +42,8 @@
          QEMU_AIO_COPY_RANGE | \
          QEMU_AIO_TRUNCATE | \
          QEMU_AIO_ZONE_REPORT | \
-         QEMU_AIO_ZONE_MGMT)
+         QEMU_AIO_ZONE_MGMT | \
+         QEMU_AIO_ZONE_APPEND)
 
 /* AIO flags */
 #define QEMU_AIO_MISALIGNED   0x1000
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 1b5fc7db6b..ff9f777f52 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -52,6 +52,9 @@ BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, int64_t offset,
 BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
                               int64_t offset, int64_t len,
                               BlockCompletionFunc *cb, void *opaque);
+BlockAIOCB *blk_aio_zone_append(BlockBackend *blk, int64_t *offset,
+                                QEMUIOVector *qiov, BdrvRequestFlags flags,
+                                BlockCompletionFunc *cb, void *opaque);
 BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
                              BlockCompletionFunc *cb, void *opaque);
 void blk_aio_cancel_async(BlockAIOCB *acb);
@@ -173,6 +176,12 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
                                   int64_t offset, int64_t len);
 int generated_co_wrapper blk_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
                                        int64_t offset, int64_t len);
+int coroutine_fn blk_co_zone_append(BlockBackend *blk, int64_t *offset,
+                                    QEMUIOVector *qiov,
+                                    BdrvRequestFlags flags);
+int generated_co_wrapper blk_zone_append(BlockBackend *blk, int64_t *offset,
+                                         QEMUIOVector *qiov,
+                                         BdrvRequestFlags flags);
 
 int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t offset,
                                       int64_t bytes);
-- 
2.38.1


