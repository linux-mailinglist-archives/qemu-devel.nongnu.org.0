Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F138600085
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 17:15:16 +0200 (CEST)
Received: from localhost ([::1]:56150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok5MB-0000Th-Ev
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 11:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok54S-0006NZ-2o; Sun, 16 Oct 2022 10:56:57 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:33414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok54P-0005of-30; Sun, 16 Oct 2022 10:56:55 -0400
Received: by mail-pl1-x62c.google.com with SMTP id 10so8770425pli.0;
 Sun, 16 Oct 2022 07:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oOG0UwHq0Tw3b72KKWnJqOGeIfxqMCqHJE3pfRQZ40g=;
 b=ovfART7DjeFpj8uGquQBOggZbrK4HBZcFS551qrKT8cJGtAVYCAIJu5wv8/mzn3cxY
 YsjqsI7PCJ1hEwShYYLZzsFAeXioR27wTmEitotf7zTgVsZsK2fiWh6vuzQzDmRx/zHq
 vhB73cKW02PLCnSc+7xpdEgRYcP+JSbULZooQnDXIgzAKTb1eI3v1ah0vjA5yrNwAHOF
 J+2nhegXPzc2ijZ1uKKLvzSs66Rbzm+JlGj8XQhw7vW/0OQyzqynvFxUL16T+5Zghn3D
 QCMAdHnjOUji/Pz77e8QfuVbEB9VgA17OFoOf1Iu6ZT4ZbMXQaaL4QDiA8C5PyD350CZ
 frsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oOG0UwHq0Tw3b72KKWnJqOGeIfxqMCqHJE3pfRQZ40g=;
 b=JzMbVjLN23EWmevgoy7+9b2HOiSc/qMSjq0gAniAlj/HeCiNUswq8JGX84UmjykjDU
 2x4Tx9MbyNiMFAyDfA8/3dZyqJWNHEKuA6AULA9olgSepwmp4mODSg3V0u2OF4iGDeNT
 LUee9A7MFu6kIrFxA87OrsYf+IlRjTyktsuEDbile/Gv3V9kt9xq9p4J1ElMRbFnmz+1
 fdrTKmkSCLaricmrx6FM4pUH+ACG0yW1XYH1VLBWNHNbYRnrmoyLY+4a0agjkKqPR/rr
 YC4KIsH5ZAsJuO5HFAh88g97LZhW4JgXCLDd6LLz5ladG1DLAobyHXvRWFa3ogHVIQGa
 I5Jg==
X-Gm-Message-State: ACrzQf0aXaKjcIVtzYHvbOn4tRYQ6TkLhE+Gw9kXXf3FwnkHofQusjJZ
 R5kQcqOlxGd16gNAebTT60aB9TOIFIoHmQ==
X-Google-Smtp-Source: AMsMyM5hcB1MoS6dJWfO9e679BEbX2EcSC+6uxw5Ma1UmJ/AqVF21EZeytRc9QIKLtds3LH2q8QcrA==
X-Received: by 2002:a17:90b:4f4b:b0:20d:1fe8:dce5 with SMTP id
 pj11-20020a17090b4f4b00b0020d1fe8dce5mr27634830pjb.224.1665932210936; 
 Sun, 16 Oct 2022 07:56:50 -0700 (PDT)
Received: from roots.. ([183.221.93.248]) by smtp.gmail.com with ESMTPSA id
 75-20020a62154e000000b00562a8150c08sm5070380pfv.168.2022.10.16.07.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 07:56:50 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, dmitry.fomichev@wdc.com,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, damien.lemoal@opensource.wdc.com, hare@suse.de,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v4 2/3] block: introduce zone append write for zoned devices
Date: Sun, 16 Oct 2022 22:56:25 +0800
Message-Id: <20221016145626.171838-3-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221016145626.171838-1-faithilikerun@gmail.com>
References: <20221016145626.171838-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A zone append command is a write operation that specifies the first
logical block of a zone as the write position. When writing to a zoned
block device using zone append, the byte offset of writes is pointing
to the write pointer of that zone. Upon completion the device will
respond with the position the data has been written in the zone.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/block-backend.c             | 65 ++++++++++++++++++++++
 block/file-posix.c                | 89 +++++++++++++++++++++++++++++--
 block/io.c                        | 21 ++++++++
 block/raw-format.c                |  8 +++
 include/block/block-io.h          |  3 ++
 include/block/block_int-common.h  |  5 ++
 include/block/raw-aio.h           |  4 +-
 include/sysemu/block-backend-io.h |  9 ++++
 8 files changed, 198 insertions(+), 6 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 1c618e9c68..06931ddd24 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1439,6 +1439,9 @@ typedef struct BlkRwCo {
         struct {
             unsigned long op;
         } zone_mgmt;
+        struct {
+            int64_t *append_sector;
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
+    rwco->ret = blk_co_zone_append(rwco->blk, rwco->zone_append.append_sector,
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
+            .blk    = blk,
+            .ret    = NOT_DONE,
+            .flags  = flags,
+            .iobuf  = qiov,
+            .zone_append = {
+                    .append_sector = offset,
+            },
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
@@ -1923,6 +1967,27 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
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
index 5ff5500301..3d0cc33d02 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -205,6 +205,7 @@ typedef struct RawPosixAIOData {
         struct {
             struct iovec *iov;
             int niov;
+            int64_t *offset;
         } io;
         struct {
             uint64_t cmd;
@@ -1475,6 +1476,11 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
             bs->bl.max_active_zones = ret;
         }
 
+        ret = get_sysfs_long_val(&st, "physical_block_size");
+        if (ret >= 0) {
+            bs->bl.write_granularity = ret;
+        }
+
         bs->bl.wps = g_malloc(sizeof(BlockZoneWps) + sizeof(int64_t) * ret);
         if (get_zones_wp(s->fd, bs->bl.wps, 0, ret) < 0) {
             error_report("report wps failed");
@@ -1647,9 +1653,18 @@ qemu_pwritev(int fd, const struct iovec *iov, int nr_iov, off_t offset)
 static ssize_t handle_aiocb_rw_vector(RawPosixAIOData *aiocb)
 {
     ssize_t len;
+    BlockZoneWps *wps = aiocb->bs->bl.wps;
+    int index = aiocb->aio_offset / aiocb->bs->bl.zone_size;
+
+    if (wps) {
+        qemu_mutex_lock(&wps->lock);
+        if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
+            aiocb->aio_offset = wps->wp[index];
+        }
+    }
 
     do {
-        if (aiocb->aio_type & QEMU_AIO_WRITE)
+        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))
             len = qemu_pwritev(aiocb->aio_fildes,
                                aiocb->io.iov,
                                aiocb->io.niov,
@@ -1660,6 +1675,9 @@ static ssize_t handle_aiocb_rw_vector(RawPosixAIOData *aiocb)
                               aiocb->io.niov,
                               aiocb->aio_offset);
     } while (len == -1 && errno == EINTR);
+    if (wps) {
+        qemu_mutex_unlock(&wps->lock);
+    }
 
     if (len == -1) {
         return -errno;
@@ -1677,9 +1695,17 @@ static ssize_t handle_aiocb_rw_linear(RawPosixAIOData *aiocb, char *buf)
 {
     ssize_t offset = 0;
     ssize_t len;
+    BlockZoneWps *wps = aiocb->bs->bl.wps;
+    int index = aiocb->aio_offset / aiocb->bs->bl.zone_size;
 
+    if (wps) {
+        qemu_mutex_lock(&wps->lock);
+        if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
+            aiocb->aio_offset = wps->wp[index];
+        }
+    }
     while (offset < aiocb->aio_nbytes) {
-        if (aiocb->aio_type & QEMU_AIO_WRITE) {
+        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
             len = pwrite(aiocb->aio_fildes,
                          (const char *)buf + offset,
                          aiocb->aio_nbytes - offset,
@@ -1709,6 +1735,9 @@ static ssize_t handle_aiocb_rw_linear(RawPosixAIOData *aiocb, char *buf)
         }
         offset += len;
     }
+    if (wps) {
+        qemu_mutex_unlock(&wps->lock);
+    }
 
     return offset;
 }
@@ -1772,7 +1801,7 @@ static int handle_aiocb_rw(void *opaque)
     }
 
     nbytes = handle_aiocb_rw_linear(aiocb, buf);
-    if (!(aiocb->aio_type & QEMU_AIO_WRITE)) {
+    if (!(aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))) {
         char *p = buf;
         size_t count = aiocb->aio_nbytes, copy;
         int i;
@@ -1794,7 +1823,7 @@ static int handle_aiocb_rw(void *opaque)
 out:
     if (nbytes == aiocb->aio_nbytes) {
 #if defined(CONFIG_BLKZONED)
-        if (aiocb->aio_type & QEMU_AIO_WRITE) {
+        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
             BlockZoneWps *wps = aiocb->bs->bl.wps;
             int index = aiocb->aio_offset / aiocb->bs->bl.zone_size;
             if (wps) {
@@ -1802,6 +1831,9 @@ out:
                 if (!BDRV_ZT_IS_CONV(wps->wp[index])) {
                     uint64_t wend_offset =
                             aiocb->aio_offset + aiocb->aio_nbytes;
+                    if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
+                        *aiocb->io.offset = wps->wp[index];
+                    }
 
                     /* Advance the wp if needed */
                     if (wend_offset > wps->wp[index]) {
@@ -1824,7 +1856,7 @@ out:
     } else {
         assert(nbytes < 0);
 #if defined(CONFIG_BLKZONED)
-        if (aiocb->aio_type & QEMU_AIO_WRITE) {
+        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
             update_zones_wp(aiocb->aio_fildes, aiocb->bs->bl.wps, 0, 1);
         }
 #endif
@@ -3478,6 +3510,52 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
 }
 #endif
 
+#if defined(CONFIG_BLKZONED)
+static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
+                                           int64_t *offset,
+                                           QEMUIOVector *qiov,
+                                           BdrvRequestFlags flags) {
+    BDRVRawState *s = bs->opaque;
+    int64_t zone_size_mask = bs->bl.zone_size - 1;
+    int64_t iov_len = 0;
+    int64_t len = 0;
+    RawPosixAIOData acb;
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
+    acb = (RawPosixAIOData) {
+        .bs = bs,
+        .aio_fildes = s->fd,
+        .aio_type = QEMU_AIO_ZONE_APPEND,
+        .aio_offset = *offset,
+        .aio_nbytes = len,
+        .io = {
+                .iov = qiov->iov,
+                .niov = qiov->niov,
+                .offset = offset,
+        },
+    };
+
+    return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
+}
+#endif
+
 static coroutine_fn int
 raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
                 bool blkdev)
@@ -4253,6 +4331,7 @@ static BlockDriver bdrv_zoned_host_device = {
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
index e3136146aa..a7e7db5646 100644
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
@@ -860,6 +863,8 @@ typedef struct BlockLimits {
 
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
2.37.3


