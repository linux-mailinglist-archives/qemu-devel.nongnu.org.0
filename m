Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3854909B9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 14:48:31 +0100 (CET)
Received: from localhost ([::1]:34894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9SN3-0004ot-RV
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 08:48:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9RW7-0000Io-Vo; Mon, 17 Jan 2022 07:53:57 -0500
Received: from [2a00:1450:4864:20::32d] (port=33650
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9RU9-0003GS-Lc; Mon, 17 Jan 2022 07:53:20 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 o7-20020a05600c510700b00347e10f66d1so7989997wms.0; 
 Mon, 17 Jan 2022 04:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZGBtWBK1EhR9MCoW1CsZDgrWxEUJPAn+9HE32S1AlJI=;
 b=ZVMFuyBmA0SKMaaqDAM/P+59/dtT2Yq4uax9GBru9cTIbM35b5eFX0vXKCq1Y4bVdf
 UOa4LGPBwJAaz8CIc2FGeH8X0I/Q/mqVBtNeL53Fym9foPNrAYHJ2tSARretnqnbSnO6
 5fqGmffODq1NiT8nEKi4BKg2qc2p9+fbEXnRb0MuH3dmkl37bK4Svdx+55iQOvTarhn1
 BtJ0G4DvPpWQ7kZ29R8HuCpr9NPX4JtZvsxvsK+vDmkZquw0utMCQ6+Y960NFeH/meZW
 r7sV3UTwMs3inB1SZZOAqT4uV7JJ2MRT6+6OvzJYRHshN+JCezMw7ttZSlBc5LBtyDLJ
 0G/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ZGBtWBK1EhR9MCoW1CsZDgrWxEUJPAn+9HE32S1AlJI=;
 b=ZTOn5oSUv4CVomWZ8BWRSAwNgp5lpdJ0hxB8w+WKRnyIWAGWQbwZrl2K1lqngiocbd
 EwK/+Pi6BFp8UgkaG7CiTL0dno0dnSzz+CGZzsl3evU7tyKyR81irL/PO3W2T6F30jbU
 Mym+m7V/A/VDjJf3Txbm4F8OQcdj9VBOMeA+l8AHiv1QWqDt66YvRp0os3At1RB74e18
 mqM7isU3BmEWvitPs8QfON+JSHGneCe5Nt0aY8jtqr32K/q//rNd77iNaUpGG0DVZKIH
 7gCBImPdDFXtaB5okFYO+rd45Ijo5hoBoptgzaZlsTgf598xDxnIJSBFykXnZ/wBOFMM
 jg0w==
X-Gm-Message-State: AOAM532iADiHO1hu4zLLWUlvZNDeLDvpQCi7jr06quserW54BDKfu9O/
 bDbP57iEALUOBVWQuMlsXOLgV/llvXfwP8F9
X-Google-Smtp-Source: ABdhPJzqrRqc1aBoKTKh4wpzJg/NB7hu7uiMAhv+KDVWCAFKNmDA7rA4rlgs7gAsNC9qQbJRqCTJJw==
X-Received: by 2002:a05:6000:1ac7:: with SMTP id
 i7mr2021011wry.491.1642423892508; 
 Mon, 17 Jan 2022 04:51:32 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 w6sm13781795wrq.86.2022.01.17.04.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 04:51:32 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Klaus Jensen <its@irrelevant.dk>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v3] hw/dma: Let dma_buf_read() / dma_buf_write() propagate
 MemTxResult
Date: Mon, 17 Jan 2022 13:51:30 +0100
Message-Id: <20220117125130.131828-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

Since commit 292e13142d2, dma_buf_rw() returns a MemTxResult type.
Do not discard it, return it to the caller. Pass the previously
returned value (the QEMUSGList residual size, which was rarely used)
as an optional argument.

With this new API, SCSIRequest::residual might now be accessed via
a pointer. Since the size_t type does not have the same size on
32 and 64-bit host architectures, convert it to a uint64_t, which
is big enough to hold the residual size, and the type is constant
on both 32/64-bit hosts.

Update the few dma_buf_read() / dma_buf_write() callers to the new
API.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3:
- Reworded to precise the SCSIRequest::residual type change
- Posted out of the "Use dma_addr_t type definition when relevant"
  series (dhildenb)
---
 include/hw/scsi/scsi.h |  2 +-
 include/sysemu/dma.h   |  4 +--
 hw/ide/ahci.c          |  8 +++---
 hw/nvme/ctrl.c         |  4 +--
 hw/scsi/megasas.c      | 59 ++++++++++++++++++++++++++++++------------
 hw/scsi/scsi-bus.c     |  6 +++--
 softmmu/dma-helpers.c  | 16 +++---------
 7 files changed, 59 insertions(+), 40 deletions(-)

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
index 36039c5e687..a1ac5bc1b54 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -301,9 +301,9 @@ BlockAIOCB *dma_blk_read(BlockBackend *blk,
 BlockAIOCB *dma_blk_write(BlockBackend *blk,
                           QEMUSGList *sg, uint64_t offset, uint32_t align,
                           BlockCompletionFunc *cb, void *opaque);
-dma_addr_t dma_buf_read(void *ptr, dma_addr_t len,
+MemTxResult dma_buf_read(void *ptr, dma_addr_t len, dma_addr_t *residual,
                          QEMUSGList *sg, MemTxAttrs attrs);
-dma_addr_t dma_buf_write(void *ptr, dma_addr_t len,
+MemTxResult dma_buf_write(void *ptr, dma_addr_t len, dma_addr_t *residual,
                           QEMUSGList *sg, MemTxAttrs attrs);
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
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
index 916cf12ed42..1c6fba6a112 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -321,24 +321,16 @@ static MemTxResult dma_buf_rw(void *buf, dma_addr_t len, dma_addr_t *residual,
     return res;
 }
 
-dma_addr_t dma_buf_read(void *ptr, dma_addr_t len,
+MemTxResult dma_buf_read(void *ptr, dma_addr_t len, dma_addr_t *residual,
                          QEMUSGList *sg, MemTxAttrs attrs)
 {
-    dma_addr_t residual;
-
-    dma_buf_rw(ptr, len, &residual, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
-
-    return residual;
+    return dma_buf_rw(ptr, len, residual, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
 }
 
-dma_addr_t dma_buf_write(void *ptr, dma_addr_t len,
+MemTxResult dma_buf_write(void *ptr, dma_addr_t len, dma_addr_t *residual,
                           QEMUSGList *sg, MemTxAttrs attrs)
 {
-    dma_addr_t residual;
-
-    dma_buf_rw(ptr, len, &residual, sg, DMA_DIRECTION_TO_DEVICE, attrs);
-
-    return residual;
+    return dma_buf_rw(ptr, len, residual, sg, DMA_DIRECTION_TO_DEVICE, attrs);
 }
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
-- 
2.34.1


