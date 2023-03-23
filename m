Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C436C5EB6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 06:22:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfDNN-0005RR-EJ; Thu, 23 Mar 2023 01:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfDNJ-0005Qu-Pn; Thu, 23 Mar 2023 01:20:33 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfDNH-0000ZN-4W; Thu, 23 Mar 2023 01:20:33 -0400
Received: by mail-pl1-x631.google.com with SMTP id z19so10884039plo.2;
 Wed, 22 Mar 2023 22:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679548829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xi3NG5tcv7Qr/lamvwQe6Nr9U/Nj0QaUBFwgMPLy2mk=;
 b=JZk/0AgZDJVTicKnn/Iu32hIMpz2BFAAqNDaTulhQguWdc5Uy6NUIW7LYKj3Nog0RL
 mxIsbDsldV43XKk9gQWfNkaKy/wzwCHJDm77CInF2QEZC+lell5SnIr5cBpD1VQSi+Qq
 HZS2XYwfEzqceEOzO4huMZkYiDWGxDuIV2H46DAOgCtMwbhJmmdv/+Qn4AwQvEDn24W7
 63gkOqsaSRvynm+okAlcGiDIbnNc76aKSQoMJAmVIDZ0bNy/jWwZTd6GxyqPXfhaWzV9
 zMVLGaJY9UNtnXe5gHbQIHUL7uajASmU1Vvh+ZhNQ6/YFuDmoZS039V09SGSn9oPt2BR
 PjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679548829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xi3NG5tcv7Qr/lamvwQe6Nr9U/Nj0QaUBFwgMPLy2mk=;
 b=sE2Wja9mdbaENIktnkZaTsDLOjwkDennD7Fa2oyBgW9+xLoDLiKsqP+dKRuZDMe7Xd
 xcjlGldbbhg4uGZwfxUdyM8Wuszfydrsjt5qIP9+eECf52aIx/kWXmwlEwoVOcObZoxH
 TslsH6lkh5+/V7eBwtT016/igKe/qvX5wDo5WpMvKAfl6gJo9cA1jrL0asG72YY0Xmrz
 8fNfNWO4KOOHqIIecdNJYW0+ycCI1X+HSjICaUls7KPpTPvEx5aIhMbRXDFldYjaij+o
 I4dY+j5BiHHxtTBzvSDnASdMSohu/BLA11uAy6su3WAWGRIr9LiFp9pCMwd1rKVBMs7y
 73vQ==
X-Gm-Message-State: AAQBX9cyhLhmys8VUiy+ryNaxBbxSDcF7eik8lblIgQClFuLvI8Sw4wQ
 gxm/VkiohSdCNPkHzH9xcDrMRsMaEv3fmse+xZM=
X-Google-Smtp-Source: AKy350YKRdedxnMV/ehVXz8ccC+kC2bVnY10/o1UchFb//gTtn/WBZB3f8qKiJyzhg9Q6Dj3cRYeLw==
X-Received: by 2002:a17:902:f684:b0:1a1:3320:be35 with SMTP id
 l4-20020a170902f68400b001a13320be35mr4961817plg.29.1679548828390; 
 Wed, 22 Mar 2023 22:20:28 -0700 (PDT)
Received: from fedlinux.. ([106.84.129.82]) by smtp.gmail.com with ESMTPSA id
 c10-20020a170902b68a00b0019edf07eb06sm11428073pls.122.2023.03.22.22.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 22:20:28 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 hare@suse.de, Fam Zheng <fam@euphon.net>, dmitry.fomichev@wdc.com,
 damien.lemoal@opensource.wdc.com, Julia Suvorova <jusual@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-block@nongnu.org,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v7 2/4] block: introduce zone append write for zoned devices
Date: Thu, 23 Mar 2023 13:19:05 +0800
Message-Id: <20230323051907.5948-3-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323051907.5948-1-faithilikerun@gmail.com>
References: <20230323051907.5948-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x631.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

A zone append command is a write operation that specifies the first
logical block of a zone as the write position. When writing to a zoned
block device using zone append, the byte offset of the call may point at
any position within the zone to which the data is being appended. Upon
completion the device will respond with the position where the data has
been written in the zone.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 block/block-backend.c             | 60 +++++++++++++++++++++++++++++++
 block/file-posix.c                | 58 ++++++++++++++++++++++++++----
 block/io.c                        | 21 +++++++++++
 block/io_uring.c                  |  4 +++
 block/linux-aio.c                 |  3 ++
 block/raw-format.c                |  8 +++++
 include/block/block-io.h          |  4 +++
 include/block/block_int-common.h  |  3 ++
 include/block/raw-aio.h           |  4 ++-
 include/sysemu/block-backend-io.h |  9 +++++
 10 files changed, 166 insertions(+), 8 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index f70b08e3f6..bcb3a1eff0 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1888,6 +1888,45 @@ BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
     return &acb->common;
 }
 
+static void coroutine_fn blk_aio_zone_append_entry(void *opaque)
+{
+    BlkAioEmAIOCB *acb = opaque;
+    BlkRwCo *rwco = &acb->rwco;
+
+    rwco->ret = blk_co_zone_append(rwco->blk, (int64_t *)acb->bytes,
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
+    acb->bytes = (int64_t)offset;
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
@@ -1939,6 +1978,27 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
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
index 0fb425dcae..60ad3970f3 100644
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
@@ -1680,7 +1681,7 @@ static ssize_t handle_aiocb_rw_vector(RawPosixAIOData *aiocb)
     ssize_t len;
 
     len = RETRY_ON_EINTR(
-        (aiocb->aio_type & QEMU_AIO_WRITE) ?
+        (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) ?
             qemu_pwritev(aiocb->aio_fildes,
                            aiocb->io.iov,
                            aiocb->io.niov,
@@ -1709,7 +1710,7 @@ static ssize_t handle_aiocb_rw_linear(RawPosixAIOData *aiocb, char *buf)
     ssize_t len;
 
     while (offset < aiocb->aio_nbytes) {
-        if (aiocb->aio_type & QEMU_AIO_WRITE) {
+        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
             len = pwrite(aiocb->aio_fildes,
                          (const char *)buf + offset,
                          aiocb->aio_nbytes - offset,
@@ -1802,7 +1803,7 @@ static int handle_aiocb_rw(void *opaque)
     }
 
     nbytes = handle_aiocb_rw_linear(aiocb, buf);
-    if (!(aiocb->aio_type & QEMU_AIO_WRITE)) {
+    if (!(aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))) {
         char *p = buf;
         size_t count = aiocb->aio_nbytes, copy;
         int i;
@@ -2437,8 +2438,12 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
     if (fd_open(bs) < 0)
         return -EIO;
 #if defined(CONFIG_BLKZONED)
-    if (type & QEMU_AIO_WRITE && bs->bl.wps) {
+    if ((type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) && bs->bl.wps) {
         qemu_co_mutex_lock(&bs->bl.wps->colock);
+        if (type & QEMU_AIO_ZONE_APPEND && bs->bl.zone_size) {
+            int index = offset / bs->bl.zone_size;
+            offset = bs->bl.wps->wp[index];
+        }
     }
 #endif
 
@@ -2486,9 +2491,13 @@ out:
 #if defined(CONFIG_BLKZONED)
     BlockZoneWps *wps = bs->bl.wps;
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
@@ -2496,12 +2505,12 @@ out:
             }
         }
     } else {
-        if (type & QEMU_AIO_WRITE) {
+        if (type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
             update_zones_wp(s->fd, bs->bl.wps, 0, 1);
         }
     }
 
-    if (type & QEMU_AIO_WRITE && wps) {
+    if ((type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) && wps) {
         qemu_co_mutex_unlock(&wps->colock);
     }
 #endif
@@ -3505,6 +3514,40 @@ out:
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
@@ -4266,6 +4309,7 @@ static BlockDriver bdrv_host_device = {
     /* zone management operations */
     .bdrv_co_zone_report = raw_co_zone_report,
     .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
+    .bdrv_co_zone_append = raw_co_zone_append,
 #endif
 };
 
diff --git a/block/io.c b/block/io.c
index 5dbf1e50f2..fe9cabaaf6 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3152,6 +3152,27 @@ out:
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
index 72e23e7b55..64e7d48d04 100644
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
@@ -635,6 +642,7 @@ BlockDriver bdrv_raw = {
     .bdrv_co_pdiscard     = &raw_co_pdiscard,
     .bdrv_co_zone_report  = &raw_co_zone_report,
     .bdrv_co_zone_mgmt  = &raw_co_zone_mgmt,
+    .bdrv_co_zone_append = &raw_co_zone_append,
     .bdrv_co_block_status = &raw_co_block_status,
     .bdrv_co_copy_range_from = &raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = &raw_co_copy_range_to,
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 19d1fad9cf..55fca02991 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -120,6 +120,10 @@ int coroutine_fn GRAPH_RDLOCK bdrv_co_zone_report(BlockDriverState *bs,
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
index 69d1c3e6dd..ccd8811919 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -724,6 +724,9 @@ struct BlockDriver {
             BlockZoneDescriptor *zones);
     int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, BlockZoneOp op,
             int64_t offset, int64_t len);
+    int coroutine_fn (*bdrv_co_zone_append)(BlockDriverState *bs,
+            int64_t *offset, QEMUIOVector *qiov,
+            BdrvRequestFlags flags);
 
     /* removable device specific */
     bool coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_is_inserted)(
diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
index eda6a7a253..fb9c9f5a01 100644
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
index f575ab5b6b..e716591a1a 100644
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
@@ -201,6 +204,12 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
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
2.39.2


