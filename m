Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7755483EB2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:03:13 +0100 (CET)
Received: from localhost ([::1]:53084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4fiq-0004C3-RR
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:03:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4fbA-0008PV-4O; Tue, 04 Jan 2022 03:55:16 -0500
Received: from [2a00:1450:4864:20::42e] (port=37717
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4fb8-0007tc-A5; Tue, 04 Jan 2022 03:55:15 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t26so74658437wrb.4;
 Tue, 04 Jan 2022 00:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cmRogI84P91nfa98uvr8BVtfhjiiaopdbhNVSNNRvB0=;
 b=fdt7f+u7weJnQkVIu0YXI61TyINqw72SzElzqUN2S5S0x5J2VYiZzuAp5/qpOZSAeo
 HOUk3vBIIPBZFwmZpL5lYOcvbPmnaOmIwamO4li+k4D1DvVw1FwDalcvUEwozi/VMYZm
 DSHnPZ7/zRNH+egQc5OfoIf0iZJsgDz/VyIFVseUQjytU+cP3peGOzZf8DnP0by1F7as
 6Jk6Zd927wrUIu99qaFZxJ2Oy2c/SQecgwGIKi2aVha71Ycblkk/SjcPUZiiQ57qB5oV
 FYz1TmGtQUkI8zhvnyfuu3C5GoWHZcPTE6CLuK85pOsNcOyiMEP7pn3r0DDd9uNw6Rxy
 satQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cmRogI84P91nfa98uvr8BVtfhjiiaopdbhNVSNNRvB0=;
 b=Mdz9me6Rq4mA1HwY3o2CVlQ10byaT5VWrxA9qxzyEzd/PipVR4Zb4/UE0wbZyF8b3i
 He9sU8oG3Xxw8BBzauVaRh8l0Eu/6Wo03etV1+h6QFOtOlsvhBK3MdIjx3hk+InWFDGs
 syODCUW6ql3stFfsT3ZiRhSy2zmGsObP8zDK10K9gQtP3g+QPiIt2q+zDAGKnnnBX7+T
 H7Qr5S3NP4uInesQAfNxrKIXdPyhA54idgJzOARUZjVVpkrdjqPnYb8DPHQ7fcl3u3ml
 VucYHsXEPezDWMk12wmjXFA33R4+pqod1wmbmkW6gMJ53ZFdVKeh7sLNYuHLOyoLsdJz
 xkug==
X-Gm-Message-State: AOAM5306EIyeFkhfWDAKgoJiWIKdQdLy4bmDCxPXDdzLSBr02Dcx5iOl
 Tuh6ShzryWRsJ4+M2q4sftdkcY6p8d82Qw==
X-Google-Smtp-Source: ABdhPJw4VD+Lh1xY1ONSK7Viorw3are6FsQWtoyCIBq7qbNnmbkeBKtTJMbAJqrdrfOSqM43RXwWFw==
X-Received: by 2002:a05:6000:1188:: with SMTP id
 g8mr33361315wrx.134.1641286512710; 
 Tue, 04 Jan 2022 00:55:12 -0800 (PST)
Received: from x1w.. (26.red-83-50-86.dynamicip.rima-tde.net. [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id j13sm42334745wmq.11.2022.01.04.00.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 00:55:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/9] hw/dma: Use dma_addr_t type definition when relevant
Date: Tue,  4 Jan 2022 09:54:30 +0100
Message-Id: <20220104085431.2122999-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104085431.2122999-1-f4bug@amsat.org>
References: <20220104085431.2122999-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Update the obvious places where dma_addr_t should be used
(instead of uint64_t, hwaddr, size_t, int32_t types).

This allows to have &dma_addr_t type portable on 32/64-bit
hosts.

Move QEMUSGList declaration after dma_addr_t declaration
so this structure can use the new type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/dma.h  | 22 +++++++++++-----------
 hw/nvme/ctrl.c        |  2 +-
 hw/rdma/rdma_utils.c  |  2 +-
 hw/scsi/megasas.c     | 10 +++++-----
 softmmu/dma-helpers.c |  6 +++---
 5 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 0db2478a506..7a8ae4fcd0b 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -15,22 +15,11 @@
 #include "block/block.h"
 #include "block/accounting.h"
 
-typedef struct ScatterGatherEntry ScatterGatherEntry;
-
 typedef enum {
     DMA_DIRECTION_TO_DEVICE = 0,
     DMA_DIRECTION_FROM_DEVICE = 1,
 } DMADirection;
 
-struct QEMUSGList {
-    ScatterGatherEntry *sg;
-    int nsg;
-    int nalloc;
-    size_t size;
-    DeviceState *dev;
-    AddressSpace *as;
-};
-
 /*
  * When an IOMMU is present, bus addresses become distinct from
  * CPU/memory physical addresses and may be a different size.  Because
@@ -43,6 +32,17 @@ typedef uint64_t dma_addr_t;
 #define DMA_ADDR_BITS 64
 #define DMA_ADDR_FMT "%" PRIx64
 
+typedef struct ScatterGatherEntry ScatterGatherEntry;
+
+struct QEMUSGList {
+    ScatterGatherEntry *sg;
+    int nsg;
+    int nalloc;
+    dma_addr_t size;
+    DeviceState *dev;
+    AddressSpace *as;
+};
+
 static inline void dma_barrier(AddressSpace *as, DMADirection dir)
 {
     /*
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
index 4563a775aa7..54340929334 100644
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
-- 
2.33.1


