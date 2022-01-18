Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4C44926BB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:13:11 +0100 (CET)
Received: from localhost ([::1]:50378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9oIQ-0007nn-5w
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:13:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEX-0006G2-LU; Tue, 18 Jan 2022 07:05:07 -0500
Received: from [2a00:1450:4864:20::32b] (port=34495
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nES-0005tz-7G; Tue, 18 Jan 2022 07:05:05 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so2047296wmb.1; 
 Tue, 18 Jan 2022 04:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EB1E6GjOT965H1546eRI7MAYmLzsPxdyv9nPv4t3lfs=;
 b=HcbGOWVmaC2G2Dufl5xmxx17M0entBkI3dSD5MyXXe7+ceSdtMlxqP1jLedeW2rqI0
 HmUv0tazGlETjG/ZmCKS1j1a+j/IOabHsyLtJgLo3kR08zg7pkolaU0KnAtCrnjO/rTH
 /DFqUu1i8uQdRcWdiONvEpNY1FojkvRu9swiROUtiI0pMkKpxvfHvhjg2x02uzPwrlDX
 VfV4Vjt1Ip70yxs3kDYrFvw5u0NiKB2DV9n6CN1+zzjkC9U5IxLEDtnTwZaFZ7a/HnAr
 BoW6r8MAFUtzqqrUz7aEzypZ3zsWPCPgW4kR7xrdBJneOeBFaXXaPCf0xZfmX8sFafZ6
 9/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EB1E6GjOT965H1546eRI7MAYmLzsPxdyv9nPv4t3lfs=;
 b=LVp0/ToeWE2QQk+Fv9zcJSZ6+QLUgaakBCks+8lax4PIMoBwy1oREebspHRy/NrWIn
 BhVtW9p4uKyBDpkxfBzvU5OI+T2KsdmoNqueiwT0xcIuk0IDRg0U1eEwdgzc653NOYlM
 BgZWw0UeeOJRxqmkDrpiZRI2nCeQAWLPPdqgOQHzTmKADSgc3sj3RqQ6aeRyM3LHcMYN
 5U4h5ndwXi1AOd9OJVsCZAGXl19HrnLx9bmEtpCgeS1pOD5ZworLTymLyXxGQjhzE6Ky
 MpWB5P8cgAUEYvkrjUs/2kPTjBYfsprASTaXL76ux1Mzyad7J+f0NVyE+2JSkoly76Iz
 Hv8w==
X-Gm-Message-State: AOAM530i4GrpqEJboxlkzQv79XVf3590ahld6K2hHscMM1HyaoAzTpmv
 huDAIpWc2UpAufl1xMYqj5m1LBG40xU=
X-Google-Smtp-Source: ABdhPJy3Rshjmbxuc8TEMhQsZ51xhukuzz1DefY2bvAZB+RNf4NsV1pReDGzutQCoZYQ51cfWVGF7w==
X-Received: by 2002:a05:6000:144c:: with SMTP id
 v12mr24124345wrx.218.1642507433042; 
 Tue, 18 Jan 2022 04:03:53 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 1sm7656390wry.81.2022.01.18.04.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 04:03:52 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 17/19] hw/dma: Use dma_addr_t type definition when relevant
Date: Tue, 18 Jan 2022 13:02:27 +0100
Message-Id: <20220118120229.196337-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118120229.196337-1-f4bug@amsat.org>
References: <20220118120229.196337-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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

Update the obvious places where dma_addr_t should be used
(instead of uint64_t, hwaddr, size_t, int32_t types).

This allows to have &dma_addr_t type portable on 32/64-bit
hosts.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220111184309.28637-11-f4bug@amsat.org>
---
 include/sysemu/dma.h  |  8 +++++---
 hw/nvme/ctrl.c        |  2 +-
 hw/rdma/rdma_utils.c  |  2 +-
 hw/scsi/megasas.c     | 10 +++++-----
 softmmu/dma-helpers.c | 16 +++++++++-------
 5 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index c992d9d5d6b..36039c5e687 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -38,7 +38,7 @@ struct QEMUSGList {
     ScatterGatherEntry *sg;
     int nsg;
     int nalloc;
-    size_t size;
+    dma_addr_t size;
     DeviceState *dev;
     AddressSpace *as;
 };
@@ -301,8 +301,10 @@ BlockAIOCB *dma_blk_read(BlockBackend *blk,
 BlockAIOCB *dma_blk_write(BlockBackend *blk,
                           QEMUSGList *sg, uint64_t offset, uint32_t align,
                           BlockCompletionFunc *cb, void *opaque);
-uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
-uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
+dma_addr_t dma_buf_read(void *ptr, dma_addr_t len,
+                         QEMUSGList *sg, MemTxAttrs attrs);
+dma_addr_t dma_buf_write(void *ptr, dma_addr_t len,
+                          QEMUSGList *sg, MemTxAttrs attrs);
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
                     QEMUSGList *sg, enum BlockAcctType type);
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 462f79a1f60..c3c49176110 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1147,7 +1147,7 @@ static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
 
     if (sg->flags & NVME_SG_DMA) {
         const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
-        uint64_t residual;
+        dma_addr_t residual;
 
         if (dir == NVME_TX_DIRECTION_TO_DEVICE) {
             residual = dma_buf_write(ptr, len, &sg->qsg, attrs);
diff --git a/hw/rdma/rdma_utils.c b/hw/rdma/rdma_utils.c
index 61cb8ede0fd..5a7ef63ad28 100644
--- a/hw/rdma/rdma_utils.c
+++ b/hw/rdma/rdma_utils.c
@@ -20,7 +20,7 @@
 void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t len)
 {
     void *p;
-    hwaddr pci_len = len;
+    dma_addr_t pci_len = len;
 
     if (!addr) {
         rdma_error_report("addr is NULL");
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index cb019549371..6c1ae6b980f 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1046,7 +1046,7 @@ static int megasas_pd_get_info_submit(SCSIDevice *sdev, int lun,
     uint16_t pd_id = ((sdev->id & 0xFF) << 8) | (lun & 0xFF);
     uint8_t cmdbuf[6];
     size_t len;
-    size_t residual;
+    dma_addr_t residual;
 
     if (!cmd->iov_buf) {
         cmd->iov_buf = g_malloc0(dcmd_size);
@@ -1152,7 +1152,7 @@ static int megasas_dcmd_ld_get_list(MegasasState *s, MegasasCmd *cmd)
 {
     struct mfi_ld_list info;
     size_t dcmd_size = sizeof(info);
-    size_t residual;
+    dma_addr_t residual;
     uint32_t num_ld_disks = 0, max_ld_disks;
     uint64_t ld_size;
     BusChild *kid;
@@ -1198,7 +1198,7 @@ static int megasas_dcmd_ld_list_query(MegasasState *s, MegasasCmd *cmd)
     uint16_t flags;
     struct mfi_ld_targetid_list info;
     size_t dcmd_size = sizeof(info);
-    size_t residual;
+    dma_addr_t residual;
     uint32_t num_ld_disks = 0, max_ld_disks = s->fw_luns;
     BusChild *kid;
 
@@ -1251,7 +1251,7 @@ static int megasas_ld_get_info_submit(SCSIDevice *sdev, int lun,
     size_t dcmd_size = sizeof(struct mfi_ld_info);
     uint8_t cdb[6];
     ssize_t len;
-    size_t residual;
+    dma_addr_t residual;
     uint16_t sdev_id = ((sdev->id & 0xFF) << 8) | (lun & 0xFF);
     uint64_t ld_size;
 
@@ -1625,7 +1625,7 @@ static int megasas_handle_dcmd(MegasasState *s, MegasasCmd *cmd)
 }
 
 static int megasas_finish_internal_dcmd(MegasasCmd *cmd,
-                                        SCSIRequest *req, size_t residual)
+                                        SCSIRequest *req, dma_addr_t residual)
 {
     int retval = MFI_STAT_OK;
     int lun = req->lun;
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 4563a775aa7..916cf12ed42 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -294,12 +294,12 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
 }
 
 
-static MemTxResult dma_buf_rw(void *buf, int32_t len, uint64_t *residual,
+static MemTxResult dma_buf_rw(void *buf, dma_addr_t len, dma_addr_t *residual,
                               QEMUSGList *sg, DMADirection dir,
                               MemTxAttrs attrs)
 {
     uint8_t *ptr = buf;
-    uint64_t xresidual;
+    dma_addr_t xresidual;
     int sg_cur_index;
     MemTxResult res = MEMTX_OK;
 
@@ -308,7 +308,7 @@ static MemTxResult dma_buf_rw(void *buf, int32_t len, uint64_t *residual,
     len = MIN(len, xresidual);
     while (len > 0) {
         ScatterGatherEntry entry = sg->sg[sg_cur_index++];
-        int32_t xfer = MIN(len, entry.len);
+        dma_addr_t xfer = MIN(len, entry.len);
         res |= dma_memory_rw(sg->as, entry.base, ptr, xfer, dir, attrs);
         ptr += xfer;
         len -= xfer;
@@ -321,18 +321,20 @@ static MemTxResult dma_buf_rw(void *buf, int32_t len, uint64_t *residual,
     return res;
 }
 
-uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
+dma_addr_t dma_buf_read(void *ptr, dma_addr_t len,
+                         QEMUSGList *sg, MemTxAttrs attrs)
 {
-    uint64_t residual;
+    dma_addr_t residual;
 
     dma_buf_rw(ptr, len, &residual, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
 
     return residual;
 }
 
-uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
+dma_addr_t dma_buf_write(void *ptr, dma_addr_t len,
+                          QEMUSGList *sg, MemTxAttrs attrs)
 {
-    uint64_t residual;
+    dma_addr_t residual;
 
     dma_buf_rw(ptr, len, &residual, sg, DMA_DIRECTION_TO_DEVICE, attrs);
 
-- 
2.34.1


