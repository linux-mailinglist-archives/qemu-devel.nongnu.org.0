Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 539395EF2FC
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 12:05:14 +0200 (CEST)
Received: from localhost ([::1]:50898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odqPp-0002QY-1J
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 06:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odpti-0007Cn-9S; Thu, 29 Sep 2022 05:32:03 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:43666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odptf-0001fs-Sq; Thu, 29 Sep 2022 05:32:02 -0400
Received: by mail-pl1-x62d.google.com with SMTP id z20so764957plb.10;
 Thu, 29 Sep 2022 02:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nS+fePgPb9l9LKYDgQQ1IG+bFtMMGO1bmW7YKgJvXrU=;
 b=jGtvTKyjWjU4WCiMzCkOGESbVOZOv4GdYxnCicC6sumR5dpj7AN5gjiWmMf5ZuFYkj
 PXgZLKF4ncyFIzGOMr0Km6/l9BIFEjpEV/p77LemXIVTeqR/Ij3GSbkVLzz1aPp2sbhv
 A/TnvLZ5nQLvCVXJ/08ha9r5G8iMm4BgRctXBTN94TdI/YieKWi3DfjMotKyr9bMPkRP
 aIZfrfs17hzAnOEY6mINuIRyRNDIX3XjapbXrnu0Y8GmaGy+ADg3kt9zd2NkM5W5bhPw
 3UPtj/PJtQl+wUq0O9jlgoFpr9qgz3XaB67fDX+rFS5gibGNy1+uDizmjNGWX6R4L2v6
 zA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nS+fePgPb9l9LKYDgQQ1IG+bFtMMGO1bmW7YKgJvXrU=;
 b=sEuRsdEDSrZj20t1obkuyB9n468V1Q8T8bj1PNo7rbubF3RWVzramJ6UD4sa15uyI5
 JbwUYcjPmfhenht8W9q77NjqldYOi7yJ3nmt+FxblCaIhN2IvkX/voQe+a2+qsuQF1Ra
 H3Hr9rFQyzRUKospg81CRX0veNOAbaSMjYX3ubSBAxsHPzyxh7v7UY0PqOk3QCbUZlf7
 ufDja0MOrljxIyogVhpf7OXvawFPfOalEosMCBSSzN4xtz9D+QrUFUqPOtjBPRgDhp/O
 oX7SNqYnRe1QeoebWrBB5Vxql1WvaBd7ftjjgWDiPW78fOYbeDlxoTHdsKU+UkcOsKMH
 MKpA==
X-Gm-Message-State: ACrzQf1k2DWw5SAWoO+SXXxFNB23xQOEcsJa6mKT7QGRxThrZHT7KlAT
 aDX3Makfdd084k3HHRPSS784/IazJ6MfnQ==
X-Google-Smtp-Source: AMsMyM734F3QOJo4QChNi/OBQEQ7O2arscDtJuGa4Lwcqekd+yM60SYwFNb4wAKaFZoaFZzyzaeSIg==
X-Received: by 2002:a17:902:82c9:b0:17b:46e6:88d with SMTP id
 u9-20020a17090282c900b0017b46e6088dmr1548776plz.85.1664443917259; 
 Thu, 29 Sep 2022 02:31:57 -0700 (PDT)
Received: from roots.. ([112.44.202.63]) by smtp.gmail.com with ESMTPSA id
 f4-20020a623804000000b0053e669cc845sm5570537pfa.190.2022.09.29.02.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 02:31:57 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, damien.lemoal@opensource.wdc.com,
 Fam Zheng <fam@euphon.net>, stefanha@redhat.com, dmitry.fomichev@wdc.com,
 hare@suse.de, Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v2 2/2] block: introduce zone append write for zoned devices
Date: Thu, 29 Sep 2022 17:31:34 +0800
Message-Id: <20220929093134.73974-3-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929093134.73974-1-faithilikerun@gmail.com>
References: <20220929093134.73974-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x62d.google.com
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
block device using zone append, the byte offset of the write is pointing
to the write pointer of that zone. Upon completion the device will
respond with the position the data has been written in the zone.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/block-backend.c              | 65 ++++++++++++++++++++++++++++++
 block/file-posix.c                 | 51 +++++++++++++++++++++++
 block/io.c                         | 21 ++++++++++
 block/raw-format.c                 |  7 ++++
 include/block/block-io.h           |  3 ++
 include/block/block_int-common.h   |  3 ++
 include/sysemu/block-backend-io.h  |  9 +++++
 qemu-io-cmds.c                     | 62 ++++++++++++++++++++++++++++
 tests/qemu-iotests/tests/zoned.out |  7 ++++
 tests/qemu-iotests/tests/zoned.sh  |  9 +++++
 10 files changed, 237 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index f7f7acd6f4..07a8632af1 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1439,6 +1439,9 @@ typedef struct BlkRwCo {
         struct {
             BlockZoneOp op;
         } zone_mgmt;
+        struct {
+            int64_t *append_sector;
+        } zone_append;
     };
 } BlkRwCo;
 
@@ -1869,6 +1872,47 @@ BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
     return &acb->common;
 }
 
+static void blk_aio_zone_append_entry(void *opaque) {
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
+        .blk    = blk,
+        .ret    = NOT_DONE,
+        .flags  = flags,
+        .iobuf  = qiov,
+        .zone_append = {
+                .append_sector = offset,
+        },
+    };
+    acb->has_returned = false;
+
+    co = qemu_coroutine_create(blk_aio_zone_append_entry, acb);
+    bdrv_coroutine_enter(blk_bs(blk), co);
+
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
@@ -1921,6 +1965,27 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
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
index 33e81ac112..24b70f1afe 100755
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3454,6 +3454,56 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
 #endif
 }
 
+
+static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
+                                           int64_t *offset,
+                                           QEMUIOVector *qiov,
+                                           BdrvRequestFlags flags) {
+#if defined(CONFIG_BLKZONED)
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
+       iov_len = qiov->iov[i].iov_len;
+       if (iov_len & wg_mask) {
+           error_report("len of IOVector[%d] %" PRId64 " is not aligned to block "
+                        "size %" PRId64 "", i, iov_len, wg);
+           return -EINVAL;
+       }
+       len += iov_len;
+    }
+
+    acb = (RawPosixAIOData) {
+        .bs = bs,
+        .aio_fildes = s->fd,
+        .aio_type = QEMU_AIO_ZONE_APPEND,
+        .aio_offset = bs->bl.wps->wp[*offset / bs->bl.zone_size],
+        .aio_nbytes = len,
+        .io = {
+                .iov = qiov->iov,
+                .niov = qiov->niov,
+                .wps = bs->bl.wps,
+                .append_sector = offset,
+        },
+    };
+
+    return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
+#else
+    return -ENOTSUP;
+#endif
+}
+
 static coroutine_fn int
 raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
                 bool blkdev)
@@ -4229,6 +4279,7 @@ static BlockDriver bdrv_zoned_host_device = {
     /* zone management operations */
     .bdrv_co_zone_report = raw_co_zone_report,
     .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
+    .bdrv_co_zone_append = raw_co_zone_append,
 };
 #endif
 
diff --git a/block/io.c b/block/io.c
index 5ab2d169c8..b9dfdf0709 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3239,6 +3239,27 @@ out:
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
index 9441536819..df8cc33467 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -325,6 +325,12 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
     return bdrv_co_zone_mgmt(bs->file->bs, op, offset, len);
 }
 
+static int coroutine_fn raw_co_zone_append(BlockDriverState *bs, int64_t *offset,
+                                           QEMUIOVector *qiov,
+                                           BdrvRequestFlags flags) {
+    return bdrv_co_zone_append(bs->file->bs, offset, qiov, flags);
+}
+
 static int64_t raw_getlength(BlockDriverState *bs)
 {
     int64_t len;
@@ -628,6 +634,7 @@ BlockDriver bdrv_raw = {
     .bdrv_co_pdiscard     = &raw_co_pdiscard,
     .bdrv_co_zone_report  = &raw_co_zone_report,
     .bdrv_co_zone_mgmt  = &raw_co_zone_mgmt,
+    .bdrv_co_zone_append = &raw_co_zone_append,
     .bdrv_co_block_status = &raw_co_block_status,
     .bdrv_co_copy_range_from = &raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = &raw_co_copy_range_to,
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 65463b88d9..a792164018 100644
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
index 59c2d1316d..a7e7db5646 100644
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
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 6835525582..33e35ae5d7 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -51,6 +51,9 @@ BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, int64_t offset,
 BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
                               int64_t offset, int64_t len,
                               BlockCompletionFunc *cb, void *opaque);
+BlockAIOCB *blk_aio_zone_append(BlockBackend *blk, int64_t *offset,
+                                QEMUIOVector *qiov, BdrvRequestFlags flags,
+                                BlockCompletionFunc *cb, void *opaque);
 BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
                              BlockCompletionFunc *cb, void *opaque);
 void blk_aio_cancel_async(BlockAIOCB *acb);
@@ -172,6 +175,12 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
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
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index e56c8d1c30..6cb86de35b 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -1855,6 +1855,67 @@ static const cmdinfo_t zone_reset_cmd = {
     .oneline = "reset a zone write pointer in zone block device",
 };
 
+static int do_aio_zone_append(BlockBackend *blk, QEMUIOVector *qiov,
+                              int64_t *offset, int flags, int *total)
+{
+    int async_ret = NOT_DONE;
+
+    blk_aio_zone_append(blk, offset, qiov, flags, aio_rw_done, &async_ret);
+    while (async_ret == NOT_DONE) {
+        main_loop_wait(false);
+    }
+
+    *total = qiov->size;
+    return async_ret < 0 ? async_ret : 1;
+}
+
+static int zone_append_f(BlockBackend *blk, int argc, char **argv) {
+    int ret;
+    int flags = 0;
+    int total = 0;
+    int64_t offset;
+    char *buf;
+    int nr_iov;
+    int pattern = 0xcd;
+    QEMUIOVector qiov;
+
+    if (optind > argc - 2) {
+        return -EINVAL;
+    }
+    optind++;
+    offset = cvtnum(argv[optind]);
+    if (offset < 0) {
+        print_cvtnum_err(offset, argv[optind]);
+        return offset;
+    }
+    optind++;
+    nr_iov = argc - optind;
+    buf = create_iovec(blk, &qiov, &argv[optind], nr_iov, pattern);
+    if (buf == NULL) {
+        return -EINVAL;
+    }
+    ret = do_aio_zone_append(blk, &qiov, &offset, flags, &total);
+    if (ret < 0) {
+        printf("zone append failed: %s\n", strerror(-ret));
+        goto out;
+    }
+
+    out:
+    qemu_iovec_destroy(&qiov);
+    qemu_io_free(buf);
+    return ret;
+}
+
+static const cmdinfo_t zone_append_cmd = {
+    .name = "zone_append",
+    .altname = "zap",
+    .cfunc = zone_append_f,
+    .argmin = 3,
+    .argmax = 3,
+    .args = "offset len [len..]",
+    .oneline = "append write a number of bytes at a specified offset",
+};
+
 static int truncate_f(BlockBackend *blk, int argc, char **argv);
 static const cmdinfo_t truncate_cmd = {
     .name       = "truncate",
@@ -2652,6 +2713,7 @@ static void __attribute((constructor)) init_qemuio_commands(void)
     qemuio_add_command(&zone_close_cmd);
     qemuio_add_command(&zone_finish_cmd);
     qemuio_add_command(&zone_reset_cmd);
+    qemuio_add_command(&zone_append_cmd);
     qemuio_add_command(&truncate_cmd);
     qemuio_add_command(&length_cmd);
     qemuio_add_command(&info_cmd);
diff --git a/tests/qemu-iotests/tests/zoned.out b/tests/qemu-iotests/tests/zoned.out
index 0c8f96deb9..b3b139b4ec 100644
--- a/tests/qemu-iotests/tests/zoned.out
+++ b/tests/qemu-iotests/tests/zoned.out
@@ -50,4 +50,11 @@ start: 0x80000, len 0x80000, cap 0x80000, wptr 0x100000, zcond:14, [type: 2]
 (5) resetting the second zone
 After resetting a zone:
 start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80000, zcond:1, [type: 2]
+
+
+(6) append write
+After appending the first zone:
+start: 0x0, len 0x80000, cap 0x80000, wptr 0x18, zcond:2, [type: 2]
+After appending the second zone:
+start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80018, zcond:2, [type: 2]
 *** done
diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-iotests/tests/zoned.sh
index fced0194c5..888711eef2 100755
--- a/tests/qemu-iotests/tests/zoned.sh
+++ b/tests/qemu-iotests/tests/zoned.sh
@@ -79,6 +79,15 @@ echo "(5) resetting the second zone"
 sudo $QEMU_IO $IMG -c "zrs 268435456 268435456"
 echo "After resetting a zone:"
 sudo $QEMU_IO $IMG -c "zrp 268435456 1"
+echo
+echo
+echo "(6) append write" # physical block size of the device is 4096
+sudo $QEMU_IO $IMG -c "zap 0 0x1000 0x2000"
+echo "After appending the first zone:"
+sudo $QEMU_IO $IMG -c "zrp 0 1"
+sudo $QEMU_IO $IMG -c "zap 268435456 0x1000 0x2000"
+echo "After appending the second zone:"
+sudo $QEMU_IO $IMG -c "zrp 268435456 1"
 
 # success, all done
 echo "*** done"
-- 
2.37.3


