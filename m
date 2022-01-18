Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D931849265F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:03:21 +0100 (CET)
Received: from localhost ([::1]:37534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9o8t-0006dv-T7
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:03:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEN-0006CN-Ck; Tue, 18 Jan 2022 07:05:05 -0500
Received: from [2a00:1450:4864:20::32e] (port=43813
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEC-0005tN-Qt; Tue, 18 Jan 2022 07:04:51 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so4586624wmq.2; 
 Tue, 18 Jan 2022 04:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8wo73c9dZDc7RaZjwKEQssROsQfwZbADgI/fn6bB0Nc=;
 b=WY/ttxZZYOodkmJCYCoahRlUu8XVIftShWyRMyhqu8YEfagBjmSPdfFzk/HfQHKqyk
 xXSk9VDgrRljFnR9RqfY4AWvFGE8RzRYBWPI8dSqFZjMVniilNbt8MehaI5l2qfEfH9a
 Zb8WsKNJER2hAx5c8F8vjT2rvTwASWie5f71ZIwIf3sNdSKtamhJNOQ8LcFHykGsFKrK
 LMKkgB4o7l5vG9MSIHFhH8tys1VCvLfSCeUadkgH7GSm2cjPL2ZItoYBfxeeZEAkTeKR
 R7YrwTXFXQr30yNKhMFdle+JRj55lnAG13BDGT5NzREPk38ecu6fastCg8bZc3tLLvw0
 OD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8wo73c9dZDc7RaZjwKEQssROsQfwZbADgI/fn6bB0Nc=;
 b=kZbVuCXYHJnazVYWOzH5SUoC6SWRfa/n4SY4vDkARIVlIcgr7Tg8wiv3aYJdjBNiQu
 1I+eV+nP+GymaGrhxAoDNQFmD0urrp9gfLaMZ3vLxa90+QrHrAQ4urxhfu8Duky4FRRX
 iOEehjqxJJTqzBTGWcbueJXm27pt4w+wzZO6Uu3brhXX8abrh+8G/e1zyp0ucum4+2Bi
 loe0X4goAW14NgHa9hfmWTvjRrhDm5cLthh0qPgCefCJxOiT94fhESha2bWo9cxB71Id
 BeY/1FN0Ex7IvS9ezd9C0Ppb7BEyLbtxumSoAkAv8TxTtBQLtFrYfeLtTwbFKO3jfvbo
 B+LA==
X-Gm-Message-State: AOAM532593X9iNTD6UXmYoWwVSk4CPUJjAQapWOfsshHd/gJ2UuILjwf
 0+FgNTj4P7NvRyQz3LS2jVqnqOk0Fek=
X-Google-Smtp-Source: ABdhPJyxl+LEYm9aUb6LykG+WMQYJTCE4yQHm+i6yjTHkEO3W0xgghLThhdvqmmwO73NawpZ2goKPA==
X-Received: by 2002:a05:600c:219:: with SMTP id
 25mr29195455wmi.71.1642507418722; 
 Tue, 18 Jan 2022 04:03:38 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 9sm15064256wrb.77.2022.01.18.04.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 04:03:38 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 14/19] hw/scsi: Rename SCSIRequest::resid as 'residual'
Date: Tue, 18 Jan 2022 13:02:24 +0100
Message-Id: <20220118120229.196337-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118120229.196337-1-f4bug@amsat.org>
References: <20220118120229.196337-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The 'resid' field is slightly confusing and could be
interpreted as some ID. Rename it as 'residual' which
is clearer to review. No logical change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20220111184309.28637-8-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/scsi/scsi.h |  4 ++--
 hw/scsi/megasas.c      | 42 +++++++++++++++++++++++++-----------------
 hw/scsi/scsi-bus.c     | 10 +++++-----
 hw/scsi/scsi-disk.c    |  4 ++--
 softmmu/dma-helpers.c  | 26 +++++++++++++-------------
 5 files changed, 47 insertions(+), 39 deletions(-)

diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 2ef80af6dca..b27d133b113 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -30,7 +30,7 @@ struct SCSIRequest {
     int16_t           status;
     int16_t           host_status;
     void              *hba_private;
-    size_t            resid;
+    size_t            residual;
     SCSICommand       cmd;
     NotifierList      cancel_notifiers;
 
@@ -125,7 +125,7 @@ struct SCSIBusInfo {
                      void *hba_private);
     void (*transfer_data)(SCSIRequest *req, uint32_t arg);
     void (*fail)(SCSIRequest *req);
-    void (*complete)(SCSIRequest *req, size_t resid);
+    void (*complete)(SCSIRequest *req, size_t residual);
     void (*cancel)(SCSIRequest *req);
     void (*change)(SCSIBus *bus, SCSIDevice *dev, SCSISense sense);
     QEMUSGList *(*get_sg_list)(SCSIRequest *req);
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index dc9bbdb740e..cb019549371 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1045,7 +1045,8 @@ static int megasas_pd_get_info_submit(SCSIDevice *sdev, int lun,
     uint64_t pd_size;
     uint16_t pd_id = ((sdev->id & 0xFF) << 8) | (lun & 0xFF);
     uint8_t cmdbuf[6];
-    size_t len, resid;
+    size_t len;
+    size_t residual;
 
     if (!cmd->iov_buf) {
         cmd->iov_buf = g_malloc0(dcmd_size);
@@ -1112,9 +1113,10 @@ static int megasas_pd_get_info_submit(SCSIDevice *sdev, int lun,
     info->connected_port_bitmap = 0x1;
     info->device_speed = 1;
     info->link_speed = 1;
-    resid = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    residual = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg,
+                            MEMTXATTRS_UNSPECIFIED);
     g_free(cmd->iov_buf);
-    cmd->iov_size = dcmd_size - resid;
+    cmd->iov_size = dcmd_size - residual;
     cmd->iov_buf = NULL;
     return MFI_STAT_OK;
 }
@@ -1149,7 +1151,8 @@ static int megasas_dcmd_pd_get_info(MegasasState *s, MegasasCmd *cmd)
 static int megasas_dcmd_ld_get_list(MegasasState *s, MegasasCmd *cmd)
 {
     struct mfi_ld_list info;
-    size_t dcmd_size = sizeof(info), resid;
+    size_t dcmd_size = sizeof(info);
+    size_t residual;
     uint32_t num_ld_disks = 0, max_ld_disks;
     uint64_t ld_size;
     BusChild *kid;
@@ -1184,8 +1187,9 @@ static int megasas_dcmd_ld_get_list(MegasasState *s, MegasasCmd *cmd)
     info.ld_count = cpu_to_le32(num_ld_disks);
     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks);
 
-    resid = dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
-    cmd->iov_size = dcmd_size - resid;
+    residual = dma_buf_read(&info, dcmd_size, &cmd->qsg,
+                            MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size = dcmd_size - residual;
     return MFI_STAT_OK;
 }
 
@@ -1193,7 +1197,8 @@ static int megasas_dcmd_ld_list_query(MegasasState *s, MegasasCmd *cmd)
 {
     uint16_t flags;
     struct mfi_ld_targetid_list info;
-    size_t dcmd_size = sizeof(info), resid;
+    size_t dcmd_size = sizeof(info);
+    size_t residual;
     uint32_t num_ld_disks = 0, max_ld_disks = s->fw_luns;
     BusChild *kid;
 
@@ -1233,8 +1238,9 @@ static int megasas_dcmd_ld_list_query(MegasasState *s, MegasasCmd *cmd)
     info.size = dcmd_size;
     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks);
 
-    resid = dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
-    cmd->iov_size = dcmd_size - resid;
+    residual = dma_buf_read(&info, dcmd_size, &cmd->qsg,
+                            MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size = dcmd_size - residual;
     return MFI_STAT_OK;
 }
 
@@ -1244,7 +1250,8 @@ static int megasas_ld_get_info_submit(SCSIDevice *sdev, int lun,
     struct mfi_ld_info *info = cmd->iov_buf;
     size_t dcmd_size = sizeof(struct mfi_ld_info);
     uint8_t cdb[6];
-    ssize_t len, resid;
+    ssize_t len;
+    size_t residual;
     uint16_t sdev_id = ((sdev->id & 0xFF) << 8) | (lun & 0xFF);
     uint64_t ld_size;
 
@@ -1283,9 +1290,10 @@ static int megasas_ld_get_info_submit(SCSIDevice *sdev, int lun,
     info->ld_config.span[0].num_blocks = info->size;
     info->ld_config.span[0].array_ref = cpu_to_le16(sdev_id);
 
-    resid = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    residual = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg,
+                            MEMTXATTRS_UNSPECIFIED);
     g_free(cmd->iov_buf);
-    cmd->iov_size = dcmd_size - resid;
+    cmd->iov_size = dcmd_size - residual;
     cmd->iov_buf = NULL;
     return MFI_STAT_OK;
 }
@@ -1617,13 +1625,13 @@ static int megasas_handle_dcmd(MegasasState *s, MegasasCmd *cmd)
 }
 
 static int megasas_finish_internal_dcmd(MegasasCmd *cmd,
-                                        SCSIRequest *req, size_t resid)
+                                        SCSIRequest *req, size_t residual)
 {
     int retval = MFI_STAT_OK;
     int lun = req->lun;
 
     trace_megasas_dcmd_internal_finish(cmd->index, cmd->dcmd_opcode, lun);
-    cmd->iov_size -= resid;
+    cmd->iov_size -= residual;
     switch (cmd->dcmd_opcode) {
     case MFI_DCMD_PD_GET_INFO:
         retval = megasas_pd_get_info_submit(req->dev, lun, cmd);
@@ -1865,12 +1873,12 @@ static void megasas_xfer_complete(SCSIRequest *req, uint32_t len)
     }
 }
 
-static void megasas_command_complete(SCSIRequest *req, size_t resid)
+static void megasas_command_complete(SCSIRequest *req, size_t residual)
 {
     MegasasCmd *cmd = req->hba_private;
     uint8_t cmd_status = MFI_STAT_OK;
 
-    trace_megasas_command_complete(cmd->index, req->status, resid);
+    trace_megasas_command_complete(cmd->index, req->status, residual);
 
     if (req->io_canceled) {
         return;
@@ -1880,7 +1888,7 @@ static void megasas_command_complete(SCSIRequest *req, size_t resid)
         /*
          * Internal command complete
          */
-        cmd_status = megasas_finish_internal_dcmd(cmd, req, resid);
+        cmd_status = megasas_finish_internal_dcmd(cmd, req, residual);
         if (cmd_status == MFI_STAT_INVALID_STATUS) {
             return;
         }
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 2b5e9dca311..3466e680ac7 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -760,7 +760,7 @@ SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
     }
 
     req->cmd = cmd;
-    req->resid = req->cmd.xfer;
+    req->residual = req->cmd.xfer;
 
     switch (buf[0]) {
     case INQUIRY:
@@ -1408,7 +1408,7 @@ void scsi_req_data(SCSIRequest *req, int len)
     trace_scsi_req_data(req->dev->id, req->lun, req->tag, len);
     assert(req->cmd.mode != SCSI_XFER_NONE);
     if (!req->sg) {
-        req->resid -= len;
+        req->residual -= len;
         req->bus->info->transfer_data(req, len);
         return;
     }
@@ -1421,9 +1421,9 @@ void scsi_req_data(SCSIRequest *req, int len)
 
     buf = scsi_req_get_buf(req);
     if (req->cmd.mode == SCSI_XFER_FROM_DEV) {
-        req->resid = dma_buf_read(buf, len, req->sg, MEMTXATTRS_UNSPECIFIED);
+        req->residual = dma_buf_read(buf, len, req->sg, MEMTXATTRS_UNSPECIFIED);
     } else {
-        req->resid = dma_buf_write(buf, len, req->sg, MEMTXATTRS_UNSPECIFIED);
+        req->residual = dma_buf_write(buf, len, req->sg, MEMTXATTRS_UNSPECIFIED);
     }
     scsi_req_continue(req);
 }
@@ -1512,7 +1512,7 @@ void scsi_req_complete(SCSIRequest *req, int status)
 
     scsi_req_ref(req);
     scsi_req_dequeue(req);
-    req->bus->info->complete(req, req->resid);
+    req->bus->info->complete(req, req->residual);
 
     /* Cancelled requests might end up being completed instead of cancelled */
     notifier_list_notify(&req->cancel_notifiers, req);
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index d4914178ea0..9c0dc7b9468 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -420,7 +420,7 @@ static void scsi_do_read(SCSIDiskReq *r, int ret)
 
     if (r->req.sg) {
         dma_acct_start(s->qdev.conf.blk, &r->acct, r->req.sg, BLOCK_ACCT_READ);
-        r->req.resid -= r->req.sg->size;
+        r->req.residual -= r->req.sg->size;
         r->req.aiocb = dma_blk_io(blk_get_aio_context(s->qdev.conf.blk),
                                   r->req.sg, r->sector << BDRV_SECTOR_BITS,
                                   BDRV_SECTOR_SIZE,
@@ -580,7 +580,7 @@ static void scsi_write_data(SCSIRequest *req)
 
     if (r->req.sg) {
         dma_acct_start(s->qdev.conf.blk, &r->acct, r->req.sg, BLOCK_ACCT_WRITE);
-        r->req.resid -= r->req.sg->size;
+        r->req.residual -= r->req.sg->size;
         r->req.aiocb = dma_blk_io(blk_get_aio_context(s->qdev.conf.blk),
                                   r->req.sg, r->sector << BDRV_SECTOR_BITS,
                                   BDRV_SECTOR_SIZE,
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index b0be1564797..4563a775aa7 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -294,49 +294,49 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
 }
 
 
-static MemTxResult dma_buf_rw(void *buf, int32_t len, uint64_t *residp,
+static MemTxResult dma_buf_rw(void *buf, int32_t len, uint64_t *residual,
                               QEMUSGList *sg, DMADirection dir,
                               MemTxAttrs attrs)
 {
     uint8_t *ptr = buf;
-    uint64_t resid;
+    uint64_t xresidual;
     int sg_cur_index;
     MemTxResult res = MEMTX_OK;
 
-    resid = sg->size;
+    xresidual = sg->size;
     sg_cur_index = 0;
-    len = MIN(len, resid);
+    len = MIN(len, xresidual);
     while (len > 0) {
         ScatterGatherEntry entry = sg->sg[sg_cur_index++];
         int32_t xfer = MIN(len, entry.len);
         res |= dma_memory_rw(sg->as, entry.base, ptr, xfer, dir, attrs);
         ptr += xfer;
         len -= xfer;
-        resid -= xfer;
+        xresidual -= xfer;
     }
 
-    if (residp) {
-        *residp = resid;
+    if (residual) {
+        *residual = xresidual;
     }
     return res;
 }
 
 uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
 {
-    uint64_t resid;
+    uint64_t residual;
 
-    dma_buf_rw(ptr, len, &resid, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
+    dma_buf_rw(ptr, len, &residual, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
 
-    return resid;
+    return residual;
 }
 
 uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
 {
-    uint64_t resid;
+    uint64_t residual;
 
-    dma_buf_rw(ptr, len, &resid, sg, DMA_DIRECTION_TO_DEVICE, attrs);
+    dma_buf_rw(ptr, len, &residual, sg, DMA_DIRECTION_TO_DEVICE, attrs);
 
-    return resid;
+    return residual;
 }
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
-- 
2.34.1


