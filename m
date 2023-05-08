Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E3A6F9EEF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 07:17:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvtE4-0001bW-JS; Mon, 08 May 2023 01:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pvtDw-0001Yv-Ho; Mon, 08 May 2023 01:15:49 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pvtDu-0002AV-7t; Mon, 08 May 2023 01:15:48 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6435bbedb4fso4469266b3a.3; 
 Sun, 07 May 2023 22:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683522943; x=1686114943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YMU/hXb8V1SxTPlJ/NMVf1kELQeyYx5TK71MFC/i+OA=;
 b=ngXHoSjB4ZkpjD0+P/2tM68ap72CcJeG1+CNi+vvTf4rfQC/DQ8c2slJc1v4ymDB6S
 f0aE2Gt6Y9bRuX9AC44A2PWnBNIdGLG74jeHxGpIr2hG7MLDRb5iuOtgven9cZ7Gymi7
 y6j1EDZFIDYCbEUHdBwOE4oPNmaLxyIZonPdtXld+GQNjglMpZEQR4b944IAzW46jjpc
 2v/zjIv+oTy/3VgdL5+VygdEaBuI7XX0XZguPj+uz6TYxPp0xRaJBhna6DMMLhO8qdys
 jAR7SspbZ00sxf7OUyFyfV8bXWfL996cjULzSnwsmKIbv18Bo0j3gmMtaWZgU2bOkrU7
 /J6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683522943; x=1686114943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YMU/hXb8V1SxTPlJ/NMVf1kELQeyYx5TK71MFC/i+OA=;
 b=LiuI2N/jKaDS5l7MDa/V0NuCgSCmFFor5n0chqu2x41TU3yFQdaAqlUKSVLpj4WpEJ
 PJCOfh4CgDjrM+3dPaUP0usHMcIkOcr5Rpcbrn6rjpSRZ6rtd12LCWZe8O33Ia7gWYp1
 PDyzeXfI14vr9pySil5u1LJ/QKJ0SQVTBGGjzCxlGLtvhmrvrttmmcN7jY8uVRXYRYB+
 qUiaLcwOwKyj9h5xTANIfn6wjma3Z6QlyNRWHO/BTSBT7qGWnDGDnd9KCgw+3b27H9Wx
 ejSs3f0KSKUW+C78rJpuCwxIBVQMCbXXbifndI4a9hvYTBbQYH+z72LslcN22HA6urkI
 h+zQ==
X-Gm-Message-State: AC+VfDyY5o9/C1u36DS4ysj5YfmWSrNsLaPiofwTE5TzrFhzh69Vq2eN
 kSik4F+EOAKeVBBRE2DKzlBXkarZNpXtFguO
X-Google-Smtp-Source: ACHHUZ58w5kyqtchkqv6A3BxqSlH+ke4ASEvqJU9/rG+yL0dkIYWdAYNb0rOBOi/T7oNMJyQ88Fgiw==
X-Received: by 2002:a05:6a21:8dc2:b0:f0:558b:8fbb with SMTP id
 ti2-20020a056a218dc200b000f0558b8fbbmr10043324pzb.34.1683522943168; 
 Sun, 07 May 2023 22:15:43 -0700 (PDT)
Received: from fedlinux.. ([106.84.128.239]) by smtp.gmail.com with ESMTPSA id
 fh11-20020a17090b034b00b00246aba3ebabsm3407140pjb.45.2023.05.07.22.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 22:15:42 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: dlemoal@kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 dmitry.fomichev@wdc.com, Fam Zheng <fam@euphon.net>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v11 2/4] block: introduce zone append write for zoned devices
Date: Mon,  8 May 2023 13:15:08 +0800
Message-Id: <20230508051510.177850-3-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230508051510.177850-1-faithilikerun@gmail.com>
References: <20230508051510.177850-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

A zone append command is a write operation that specifies the first
logical block of a zone as the write position. When writing to a zoned
block device using zone append, the byte offset of the call may point at
any position within the zone to which the data is being appended. Upon
completion the device will respond with the position where the data has
been written in the zone.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/block-backend.c             | 61 +++++++++++++++++++++++++++++++
 block/file-posix.c                | 58 +++++++++++++++++++++++++----
 block/io.c                        | 27 ++++++++++++++
 block/io_uring.c                  |  4 ++
 block/linux-aio.c                 |  3 ++
 block/raw-format.c                |  8 ++++
 include/block/block-io.h          |  4 ++
 include/block/block_int-common.h  |  3 ++
 include/block/raw-aio.h           |  4 +-
 include/sysemu/block-backend-io.h |  9 +++++
 10 files changed, 173 insertions(+), 8 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 67722eb46d..aa8657e5c8 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1929,6 +1929,45 @@ BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
     return &acb->common;
 }
 
+static void coroutine_fn blk_aio_zone_append_entry(void *opaque)
+{
+    BlkAioEmAIOCB *acb = opaque;
+    BlkRwCo *rwco = &acb->rwco;
+
+    rwco->ret = blk_co_zone_append(rwco->blk, (int64_t *)(uintptr_t)acb->bytes,
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
+    };
+    acb->bytes = (int64_t)(uintptr_t)offset;
+    acb->has_returned = false;
+
+    co = qemu_coroutine_create(blk_aio_zone_append_entry, acb);
+    aio_co_enter(blk_get_aio_context(blk), co);
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
@@ -1982,6 +2021,28 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
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
+    GRAPH_RDLOCK_GUARD();
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
index 9b97ef110b..aacb50d5aa 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -160,6 +160,7 @@ typedef struct BDRVRawState {
     bool has_write_zeroes:1;
     bool use_linux_aio:1;
     bool use_linux_io_uring:1;
+    int64_t *offset; /* offset of zone append operation */
     int page_cache_inconsistent; /* errno from fdatasync failure */
     bool has_fallocate;
     bool needs_alignment;
@@ -1698,7 +1699,7 @@ static ssize_t handle_aiocb_rw_vector(RawPosixAIOData *aiocb)
     ssize_t len;
 
     len = RETRY_ON_EINTR(
-        (aiocb->aio_type & QEMU_AIO_WRITE) ?
+        (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) ?
             qemu_pwritev(aiocb->aio_fildes,
                            aiocb->io.iov,
                            aiocb->io.niov,
@@ -1727,7 +1728,7 @@ static ssize_t handle_aiocb_rw_linear(RawPosixAIOData *aiocb, char *buf)
     ssize_t len;
 
     while (offset < aiocb->aio_nbytes) {
-        if (aiocb->aio_type & QEMU_AIO_WRITE) {
+        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
             len = pwrite(aiocb->aio_fildes,
                          (const char *)buf + offset,
                          aiocb->aio_nbytes - offset,
@@ -1820,7 +1821,7 @@ static int handle_aiocb_rw(void *opaque)
     }
 
     nbytes = handle_aiocb_rw_linear(aiocb, buf);
-    if (!(aiocb->aio_type & QEMU_AIO_WRITE)) {
+    if (!(aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))) {
         char *p = buf;
         size_t count = aiocb->aio_nbytes, copy;
         int i;
@@ -2453,8 +2454,12 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
     if (fd_open(bs) < 0)
         return -EIO;
 #if defined(CONFIG_BLKZONED)
-    if (type & QEMU_AIO_WRITE && bs->wps) {
+    if ((type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) && bs->wps) {
         qemu_co_mutex_lock(&bs->wps->colock);
+        if (type & QEMU_AIO_ZONE_APPEND && bs->bl.zone_size) {
+            int index = offset / bs->bl.zone_size;
+            offset = bs->wps->wp[index];
+        }
     }
 #endif
 
@@ -2502,9 +2507,13 @@ out:
 {
     BlockZoneWps *wps = bs->wps;
     if (ret == 0) {
-        if (type & QEMU_AIO_WRITE && wps && bs->bl.zone_size) {
+        if ((type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))
+            && wps && bs->bl.zone_size) {
             uint64_t *wp = &wps->wp[offset / bs->bl.zone_size];
             if (!BDRV_ZT_IS_CONV(*wp)) {
+                if (type & QEMU_AIO_ZONE_APPEND) {
+                    *s->offset = *wp;
+                }
                 /* Advance the wp if needed */
                 if (offset + bytes > *wp) {
                     *wp = offset + bytes;
@@ -2512,12 +2521,12 @@ out:
             }
         }
     } else {
-        if (type & QEMU_AIO_WRITE) {
+        if (type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
             update_zones_wp(bs, s->fd, 0, 1);
         }
     }
 
-    if (type & QEMU_AIO_WRITE && wps) {
+    if ((type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) && wps) {
         qemu_co_mutex_unlock(&wps->colock);
     }
 }
@@ -3516,6 +3525,40 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
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
@@ -4277,6 +4320,7 @@ static BlockDriver bdrv_host_device = {
     /* zone management operations */
     .bdrv_co_zone_report = raw_co_zone_report,
     .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
+    .bdrv_co_zone_append = raw_co_zone_append,
 #endif
 };
 
diff --git a/block/io.c b/block/io.c
index 74bab69b0f..20d1da8dc9 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3156,6 +3156,33 @@ out:
     return co.ret;
 }
 
+int coroutine_fn bdrv_co_zone_append(BlockDriverState *bs, int64_t *offset,
+                        QEMUIOVector *qiov,
+                        BdrvRequestFlags flags)
+{
+    int ret;
+    BlockDriver *drv = bs->drv;
+    CoroutineIOCompletion co = {
+            .coroutine = qemu_coroutine_self(),
+    };
+    IO_CODE();
+
+    ret = bdrv_check_qiov_request(*offset, qiov->size, qiov, 0, NULL);
+    if (ret < 0) {
+        return ret;
+    }
+
+    bdrv_inc_in_flight(bs);
+    if (!drv || !drv->bdrv_co_zone_append || bs->bl.zoned == BLK_Z_NONE) {
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
index 989f9a99ed..82cab6a5bd 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -350,6 +350,10 @@ static int luring_do_submit(int fd, LuringAIOCB *luringcb, LuringState *s,
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
index fc50cdd1bf..442c86209b 100644
--- a/block/linux-aio.c
+++ b/block/linux-aio.c
@@ -394,6 +394,9 @@ static int laio_do_submit(int fd, struct qemu_laiocb *laiocb, off_t offset,
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
index 1a1dce8da4..9816f1af80 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -332,6 +332,13 @@ raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
     return bdrv_co_zone_mgmt(bs->file->bs, op, offset, len);
 }
 
+static int coroutine_fn GRAPH_RDLOCK
+raw_co_zone_append(BlockDriverState *bs,int64_t *offset, QEMUIOVector *qiov,
+                   BdrvRequestFlags flags)
+{
+    return bdrv_co_zone_append(bs->file->bs, offset, qiov, flags);
+}
+
 static int64_t coroutine_fn GRAPH_RDLOCK
 raw_co_getlength(BlockDriverState *bs)
 {
@@ -637,6 +644,7 @@ BlockDriver bdrv_raw = {
     .bdrv_co_pdiscard     = &raw_co_pdiscard,
     .bdrv_co_zone_report  = &raw_co_zone_report,
     .bdrv_co_zone_mgmt  = &raw_co_zone_mgmt,
+    .bdrv_co_zone_append = &raw_co_zone_append,
     .bdrv_co_block_status = &raw_co_block_status,
     .bdrv_co_copy_range_from = &raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = &raw_co_copy_range_to,
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 58f415ab64..f44e524a1c 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -119,6 +119,10 @@ int coroutine_fn GRAPH_RDLOCK bdrv_co_zone_report(BlockDriverState *bs,
 int coroutine_fn GRAPH_RDLOCK bdrv_co_zone_mgmt(BlockDriverState *bs,
                                                 BlockZoneOp op,
                                                 int64_t offset, int64_t len);
+int coroutine_fn GRAPH_RDLOCK bdrv_co_zone_append(BlockDriverState *bs,
+                                                  int64_t *offset,
+                                                  QEMUIOVector *qiov,
+                                                  BdrvRequestFlags flags);
 
 bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
 int bdrv_block_status(BlockDriverState *bs, int64_t offset,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index e552302cb0..27d32e723d 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -722,6 +722,9 @@ struct BlockDriver {
             BlockZoneDescriptor *zones);
     int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, BlockZoneOp op,
             int64_t offset, int64_t len);
+    int coroutine_fn (*bdrv_co_zone_append)(BlockDriverState *bs,
+            int64_t *offset, QEMUIOVector *qiov,
+            BdrvRequestFlags flags);
 
     /* removable device specific */
     bool coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_is_inserted)(
diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
index afb9bdf51b..0fe85ade77 100644
--- a/include/block/raw-aio.h
+++ b/include/block/raw-aio.h
@@ -30,6 +30,7 @@
 #define QEMU_AIO_TRUNCATE     0x0080
 #define QEMU_AIO_ZONE_REPORT  0x0100
 #define QEMU_AIO_ZONE_MGMT    0x0200
+#define QEMU_AIO_ZONE_APPEND  0x0400
 #define QEMU_AIO_TYPE_MASK \
         (QEMU_AIO_READ | \
          QEMU_AIO_WRITE | \
@@ -40,7 +41,8 @@
          QEMU_AIO_COPY_RANGE | \
          QEMU_AIO_TRUNCATE | \
          QEMU_AIO_ZONE_REPORT | \
-         QEMU_AIO_ZONE_MGMT)
+         QEMU_AIO_ZONE_MGMT | \
+         QEMU_AIO_ZONE_APPEND)
 
 /* AIO flags */
 #define QEMU_AIO_MISALIGNED   0x1000
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index eb1c1ebfec..d62a7ee773 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -53,6 +53,9 @@ BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, int64_t offset,
 BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
                               int64_t offset, int64_t len,
                               BlockCompletionFunc *cb, void *opaque);
+BlockAIOCB *blk_aio_zone_append(BlockBackend *blk, int64_t *offset,
+                                QEMUIOVector *qiov, BdrvRequestFlags flags,
+                                BlockCompletionFunc *cb, void *opaque);
 BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
                              BlockCompletionFunc *cb, void *opaque);
 void blk_aio_cancel_async(BlockAIOCB *acb);
@@ -208,6 +211,12 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
                                   int64_t offset, int64_t len);
 int co_wrapper_mixed blk_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
                                        int64_t offset, int64_t len);
+int coroutine_fn blk_co_zone_append(BlockBackend *blk, int64_t *offset,
+                                    QEMUIOVector *qiov,
+                                    BdrvRequestFlags flags);
+int co_wrapper_mixed blk_zone_append(BlockBackend *blk, int64_t *offset,
+                                         QEMUIOVector *qiov,
+                                         BdrvRequestFlags flags);
 
 int co_wrapper_mixed blk_pdiscard(BlockBackend *blk, int64_t offset,
                                   int64_t bytes);
-- 
2.40.0


