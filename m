Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F20483EB1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:03:00 +0100 (CET)
Received: from localhost ([::1]:51974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4fid-0003RU-8C
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:02:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4fbG-0000Ax-BQ; Tue, 04 Jan 2022 03:55:22 -0500
Received: from [2a00:1450:4864:20::433] (port=38545
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4fbE-0007uS-7y; Tue, 04 Jan 2022 03:55:22 -0500
Received: by mail-wr1-x433.google.com with SMTP id e5so74681018wrc.5;
 Tue, 04 Jan 2022 00:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8N7FtTlMliBuDLbCkXxIHdoBmGQFWFeFdYuVc9U6SuA=;
 b=eO/qW9gmxS41uZBW+yACIFqs0pEXvo67JMBTX5V10NSR86N664i8dIXXeECt6WWna0
 nxpytdiJjUXnLihiH7RcNKyPlUPtczsOOlsTfcZnheRiLxpVWXnxOjDOGMbzhjo38jNY
 cC+yDxLfLqhn0Z0h/aJp1nUJZuaGNnmBt8jQ81FRK6fSHq97NiJE0IfOYnka+ZgJDe3O
 WOa0K3s6eSQGJVW9fuLwQAsSwpmi9G1CVmTgnLSdlBPnjDcREPdfqXeKtFxVHbvHXIG9
 CuYSbXiBmtU93vj9qxcGZbyPntn2qszDRFyd2QQPoaTpeQjCGqPaVcsC/0QYOlbP54Lr
 Wipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8N7FtTlMliBuDLbCkXxIHdoBmGQFWFeFdYuVc9U6SuA=;
 b=CVBF+n5vzchBR4eIQvfBKIE0Jm/XytbKIvz4loc4QdePqUGNu7g4FapMDEzAc7v4bd
 ahc36rqPtI0zWthNk8H2to3HI/Q++eMCzTPJ+iTnspIxw1frojx9GXIemkmcvfrqw35l
 7aqnZwiA9LsRyk6sAYfcUUPWdnTFuIFj1tFMRSkTAV+5IRvsnB7jbSpepeEcr4jUVUHP
 eRAXSQoqwD0r7Fld3awcF0w4mq/JmvWpLQmgaEQktahMapjerxZGyeYhzXm7CGqzImpf
 +411YT6X1rray9W6182rIvJqf4fuTbY5Rkvob93EosfIccPELlwkuf0VAYnZScuk3LVo
 zNkg==
X-Gm-Message-State: AOAM533eklzBo5MFbK59fKZZDQXkJH46/3fFdHlqAqfHjXZd9CsaQTiW
 bj9MlSD5GWeEuENVi6quFiBcEw5dWTQGJA==
X-Google-Smtp-Source: ABdhPJws7b5B5cggrySe8rNVumVno6GMuKYCsIV7y7FABkKR2gnbN6xjU608T1C3x+5hAVS8eWiOxQ==
X-Received: by 2002:adf:eb87:: with SMTP id t7mr34596294wrn.147.1641286518315; 
 Tue, 04 Jan 2022 00:55:18 -0800 (PST)
Received: from x1w.. (26.red-83-50-86.dynamicip.rima-tde.net. [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id f16sm49194947wmg.27.2022.01.04.00.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 00:55:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 9/9] hw/dma: Let dma_buf_read() / dma_buf_write() propagate
 MemTxResult
Date: Tue,  4 Jan 2022 09:54:31 +0100
Message-Id: <20220104085431.2122999-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104085431.2122999-1-f4bug@amsat.org>
References: <20220104085431.2122999-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since the previous commit, dma_buf_rw() returns a MemTxResult
type. Do not discard it, return it to the caller.

Since both dma_buf_read/dma_buf_write functions were previously
returning the QEMUSGList size not consumed, add an extra argument
where the unconsummed size can be stored.

Update the few callers.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/scsi/scsi.h |  2 +-
 include/sysemu/dma.h   |  6 +++--
 hw/ide/ahci.c          |  8 +++---
 hw/nvme/ctrl.c         |  4 +--
 hw/scsi/megasas.c      | 59 ++++++++++++++++++++++++++++++------------
 hw/scsi/scsi-bus.c     |  6 +++--
 softmmu/dma-helpers.c  | 18 +++++--------
 7 files changed, 63 insertions(+), 40 deletions(-)

diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index b27d133b113..1ffb367f94f 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -30,7 +30,7 @@ struct SCSIRequest {
     int16_t           status;
     int16_t           host_status;
     void              *hba_private;
-    size_t            residual;
+    uint64_t          residual;
     SCSICommand       cmd;
     NotifierList      cancel_notifiers;
 
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 7a8ae4fcd0b..a1ac5bc1b54 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -301,8 +301,10 @@ BlockAIOCB *dma_blk_read(BlockBackend *blk,
 BlockAIOCB *dma_blk_write(BlockBackend *blk,
                           QEMUSGList *sg, uint64_t offset, uint32_t align,
                           BlockCompletionFunc *cb, void *opaque);
-uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
-uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
+MemTxResult dma_buf_read(void *ptr, dma_addr_t len, dma_addr_t *residual,
+                         QEMUSGList *sg, MemTxAttrs attrs);
+MemTxResult dma_buf_write(void *ptr, dma_addr_t len, dma_addr_t *residual,
+                          QEMUSGList *sg, MemTxAttrs attrs);
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
                     QEMUSGList *sg, enum BlockAcctType type);
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 6c727dd0c08..7ce001cacdb 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1384,9 +1384,9 @@ static void ahci_pio_transfer(const IDEDMA *dma)
         const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
 
         if (is_write) {
-            dma_buf_write(s->data_ptr, size, &s->sg, attrs);
+            dma_buf_write(s->data_ptr, size, NULL, &s->sg, attrs);
         } else {
-            dma_buf_read(s->data_ptr, size, &s->sg, attrs);
+            dma_buf_read(s->data_ptr, size, NULL, &s->sg, attrs);
         }
     }
 
@@ -1479,9 +1479,9 @@ static int ahci_dma_rw_buf(const IDEDMA *dma, bool is_write)
     }
 
     if (is_write) {
-        dma_buf_read(p, l, &s->sg, MEMTXATTRS_UNSPECIFIED);
+        dma_buf_read(p, l, NULL, &s->sg, MEMTXATTRS_UNSPECIFIED);
     } else {
-        dma_buf_write(p, l, &s->sg, MEMTXATTRS_UNSPECIFIED);
+        dma_buf_write(p, l, NULL, &s->sg, MEMTXATTRS_UNSPECIFIED);
     }
 
     /* free sglist, update byte count */
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index c3c49176110..1f62116af98 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1150,9 +1150,9 @@ static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
         dma_addr_t residual;
 
         if (dir == NVME_TX_DIRECTION_TO_DEVICE) {
-            residual = dma_buf_write(ptr, len, &sg->qsg, attrs);
+            dma_buf_write(ptr, len, &residual, &sg->qsg, attrs);
         } else {
-            residual = dma_buf_read(ptr, len, &sg->qsg, attrs);
+            dma_buf_read(ptr, len, &residual, &sg->qsg, attrs);
         }
 
         if (unlikely(residual)) {
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 6c1ae6b980f..de613c8b355 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -750,6 +750,7 @@ static int megasas_ctrl_get_info(MegasasState *s, MegasasCmd *cmd)
     size_t dcmd_size = sizeof(info);
     BusChild *kid;
     int num_pd_disks = 0;
+    dma_addr_t residual;
 
     memset(&info, 0x0, dcmd_size);
     if (cmd->iov_size < dcmd_size) {
@@ -860,7 +861,9 @@ static int megasas_ctrl_get_info(MegasasState *s, MegasasCmd *cmd)
                                        MFI_INFO_PDMIX_SATA |
                                        MFI_INFO_PDMIX_LD);
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, dcmd_size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= residual;
     return MFI_STAT_OK;
 }
 
@@ -868,6 +871,7 @@ static int megasas_mfc_get_defaults(MegasasState *s, MegasasCmd *cmd)
 {
     struct mfi_defaults info;
     size_t dcmd_size = sizeof(struct mfi_defaults);
+    dma_addr_t residual;
 
     memset(&info, 0x0, dcmd_size);
     if (cmd->iov_size < dcmd_size) {
@@ -890,7 +894,9 @@ static int megasas_mfc_get_defaults(MegasasState *s, MegasasCmd *cmd)
     info.disable_preboot_cli = 1;
     info.cluster_disable = 1;
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, dcmd_size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= residual;
     return MFI_STAT_OK;
 }
 
@@ -898,6 +904,7 @@ static int megasas_dcmd_get_bios_info(MegasasState *s, MegasasCmd *cmd)
 {
     struct mfi_bios_data info;
     size_t dcmd_size = sizeof(info);
+    dma_addr_t residual;
 
     memset(&info, 0x0, dcmd_size);
     if (cmd->iov_size < dcmd_size) {
@@ -911,7 +918,9 @@ static int megasas_dcmd_get_bios_info(MegasasState *s, MegasasCmd *cmd)
         info.expose_all_drives = 1;
     }
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, dcmd_size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= residual;
     return MFI_STAT_OK;
 }
 
@@ -919,10 +928,13 @@ static int megasas_dcmd_get_fw_time(MegasasState *s, MegasasCmd *cmd)
 {
     uint64_t fw_time;
     size_t dcmd_size = sizeof(fw_time);
+    dma_addr_t residual;
 
     fw_time = cpu_to_le64(megasas_fw_time());
 
-    cmd->iov_size -= dma_buf_read(&fw_time, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&fw_time, dcmd_size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= residual;
     return MFI_STAT_OK;
 }
 
@@ -942,6 +954,7 @@ static int megasas_event_info(MegasasState *s, MegasasCmd *cmd)
 {
     struct mfi_evt_log_state info;
     size_t dcmd_size = sizeof(info);
+    dma_addr_t residual;
 
     memset(&info, 0, dcmd_size);
 
@@ -949,7 +962,9 @@ static int megasas_event_info(MegasasState *s, MegasasCmd *cmd)
     info.shutdown_seq_num = cpu_to_le32(s->shutdown_event);
     info.boot_seq_num = cpu_to_le32(s->boot_event);
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, dcmd_size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= residual;
     return MFI_STAT_OK;
 }
 
@@ -979,6 +994,7 @@ static int megasas_dcmd_pd_get_list(MegasasState *s, MegasasCmd *cmd)
     size_t dcmd_size = sizeof(info);
     BusChild *kid;
     uint32_t offset, dcmd_limit, num_pd_disks = 0, max_pd_disks;
+    dma_addr_t residual;
 
     memset(&info, 0, dcmd_size);
     offset = 8;
@@ -1018,7 +1034,9 @@ static int megasas_dcmd_pd_get_list(MegasasState *s, MegasasCmd *cmd)
     info.size = cpu_to_le32(offset);
     info.count = cpu_to_le32(num_pd_disks);
 
-    cmd->iov_size -= dma_buf_read(&info, offset, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, offset, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= residual;
     return MFI_STAT_OK;
 }
 
@@ -1113,8 +1131,9 @@ static int megasas_pd_get_info_submit(SCSIDevice *sdev, int lun,
     info->connected_port_bitmap = 0x1;
     info->device_speed = 1;
     info->link_speed = 1;
-    residual = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg,
-                            MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(cmd->iov_buf, dcmd_size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= residual;
     g_free(cmd->iov_buf);
     cmd->iov_size = dcmd_size - residual;
     cmd->iov_buf = NULL;
@@ -1187,8 +1206,8 @@ static int megasas_dcmd_ld_get_list(MegasasState *s, MegasasCmd *cmd)
     info.ld_count = cpu_to_le32(num_ld_disks);
     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks);
 
-    residual = dma_buf_read(&info, dcmd_size, &cmd->qsg,
-                            MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, dcmd_size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
     cmd->iov_size = dcmd_size - residual;
     return MFI_STAT_OK;
 }
@@ -1238,8 +1257,8 @@ static int megasas_dcmd_ld_list_query(MegasasState *s, MegasasCmd *cmd)
     info.size = dcmd_size;
     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks);
 
-    residual = dma_buf_read(&info, dcmd_size, &cmd->qsg,
-                            MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, dcmd_size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
     cmd->iov_size = dcmd_size - residual;
     return MFI_STAT_OK;
 }
@@ -1290,8 +1309,8 @@ static int megasas_ld_get_info_submit(SCSIDevice *sdev, int lun,
     info->ld_config.span[0].num_blocks = info->size;
     info->ld_config.span[0].array_ref = cpu_to_le16(sdev_id);
 
-    residual = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg,
-                            MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(cmd->iov_buf, dcmd_size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
     g_free(cmd->iov_buf);
     cmd->iov_size = dcmd_size - residual;
     cmd->iov_buf = NULL;
@@ -1336,6 +1355,7 @@ static int megasas_dcmd_cfg_read(MegasasState *s, MegasasCmd *cmd)
     struct mfi_config_data *info;
     int num_pd_disks = 0, array_offset, ld_offset;
     BusChild *kid;
+    dma_addr_t residual;
 
     if (cmd->iov_size > 4096) {
         return MFI_STAT_INVALID_PARAMETER;
@@ -1410,7 +1430,9 @@ static int megasas_dcmd_cfg_read(MegasasState *s, MegasasCmd *cmd)
         ld_offset += sizeof(struct mfi_ld_config);
     }
 
-    cmd->iov_size -= dma_buf_read(data, info->size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(data, info->size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= residual;
     return MFI_STAT_OK;
 }
 
@@ -1418,6 +1440,7 @@ static int megasas_dcmd_get_properties(MegasasState *s, MegasasCmd *cmd)
 {
     struct mfi_ctrl_props info;
     size_t dcmd_size = sizeof(info);
+    dma_addr_t residual;
 
     memset(&info, 0x0, dcmd_size);
     if (cmd->iov_size < dcmd_size) {
@@ -1440,7 +1463,9 @@ static int megasas_dcmd_get_properties(MegasasState *s, MegasasCmd *cmd)
     info.ecc_bucket_leak_rate = cpu_to_le16(1440);
     info.expose_encl_devices = 1;
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, dcmd_size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= residual;
     return MFI_STAT_OK;
 }
 
@@ -1485,7 +1510,7 @@ static int megasas_dcmd_set_properties(MegasasState *s, MegasasCmd *cmd)
                                             dcmd_size);
         return MFI_STAT_INVALID_PARAMETER;
     }
-    dma_buf_write(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_write(&info, dcmd_size, NULL, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     trace_megasas_dcmd_unsupported(cmd->index, cmd->iov_size);
     return MFI_STAT_OK;
 }
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 3466e680ac7..4057e04ce89 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -1421,9 +1421,11 @@ void scsi_req_data(SCSIRequest *req, int len)
 
     buf = scsi_req_get_buf(req);
     if (req->cmd.mode == SCSI_XFER_FROM_DEV) {
-        req->residual = dma_buf_read(buf, len, req->sg, MEMTXATTRS_UNSPECIFIED);
+        dma_buf_read(buf, len, &req->residual, req->sg,
+                     MEMTXATTRS_UNSPECIFIED);
     } else {
-        req->residual = dma_buf_write(buf, len, req->sg, MEMTXATTRS_UNSPECIFIED);
+        dma_buf_write(buf, len, &req->residual, req->sg,
+                      MEMTXATTRS_UNSPECIFIED);
     }
     scsi_req_continue(req);
 }
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 54340929334..1c6fba6a112 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -321,22 +321,16 @@ static MemTxResult dma_buf_rw(void *buf, dma_addr_t len, dma_addr_t *residual,
     return res;
 }
 
-uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
+MemTxResult dma_buf_read(void *ptr, dma_addr_t len, dma_addr_t *residual,
+                         QEMUSGList *sg, MemTxAttrs attrs)
 {
-    uint64_t residual;
-
-    dma_buf_rw(ptr, len, &residual, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
-
-    return residual;
+    return dma_buf_rw(ptr, len, residual, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
 }
 
-uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
+MemTxResult dma_buf_write(void *ptr, dma_addr_t len, dma_addr_t *residual,
+                          QEMUSGList *sg, MemTxAttrs attrs)
 {
-    uint64_t residual;
-
-    dma_buf_rw(ptr, len, &residual, sg, DMA_DIRECTION_TO_DEVICE, attrs);
-
-    return residual;
+    return dma_buf_rw(ptr, len, residual, sg, DMA_DIRECTION_TO_DEVICE, attrs);
 }
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
-- 
2.33.1


