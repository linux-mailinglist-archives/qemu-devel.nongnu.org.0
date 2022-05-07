Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C57E251E957
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 21:12:34 +0200 (CEST)
Received: from localhost ([::1]:39594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnPqz-0004oC-Qx
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 15:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlI-0004nI-TY; Sat, 07 May 2022 15:06:41 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:41934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlG-0001Xa-Tt; Sat, 07 May 2022 15:06:40 -0400
Received: by mail-oi1-x22c.google.com with SMTP id e189so11090614oia.8;
 Sat, 07 May 2022 12:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6P23p6FAimkXNsBW+WQzIt8dc/hF9eVgZPNlKok1Qsg=;
 b=GLjq98jJKySDfsT+I4DEejnJp483/r3QUPzIcHv4SvVt3jJKIhf3Dc32r/z1S7PfUk
 bDMNNJL35eh5STR0qGL2oa8NrkTzMRcT9eLnz7C4YQfMyqOqwN7YaDVQaZmR4bFHIPTM
 tHUqVsda1lnSCLo1FrBNdePHG+m+WlDG03HBFMZeyPHp7vj0bfFNNrg5yL4aWknV3Wvh
 7Youa1u3YMd20kMwKhyD6P98S3ncQjmZnmpYwp1QG3cQ19RlP6A2WKELjibaPXBEfF/0
 JOeePo61j0IP1m5ZkkN7BcTMeeImuzI7Rn2igi/2SDr8khw+kgvEn+DjNlBQLIRD7uOe
 feTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6P23p6FAimkXNsBW+WQzIt8dc/hF9eVgZPNlKok1Qsg=;
 b=ErGsHPY/iU0uuQBKG2/jwdmzoy7OxCVcVlwT7yDjtkodQpH3EqQBn4EGmQUOxyMQxY
 MvfGl8KJ29fPwcMIimBlVdmuGRAvXAq/PYqi7kZPFkmHxpfoEf7UsepJMBl3W8yxGEgH
 8UkL6HYwNHFL63dks48KHs2sKQge7yJ/7V5ael3BRS3f1751QNe4Q8vkX+ZT+W9qbF5B
 T4SH2aZ8WZct3MzVecQmlZ340KQQ3Dbpu44NhRgAWr8pI1lzbZOuFI/vvtF1SNNjBDrN
 c0h+bl4B4ozvu1AoMcV395teFjUSKIDrWwyNv8D9MKNUUNhLThpgH1t0Tcn8S+po8iqZ
 2lzg==
X-Gm-Message-State: AOAM530DI1Qz/ABwK5ErIYO8zbcZlJaQzNPOFsYfUQDGlBa8nwEP9l85
 nwxcXlRLbhCXy2o3MICj9nDM53YOpg0=
X-Google-Smtp-Source: ABdhPJw9e+a0aKCk/DJDeZMr9nf/aMGErgj/tdZ+gMG8JNrzOxngyS1v3XtunMxSlj1El5f4pm62NA==
X-Received: by 2002:a05:6808:1aac:b0:325:aa52:5d58 with SMTP id
 bm44-20020a0568081aac00b00325aa525d58mr7559714oib.279.1651950397044; 
 Sat, 07 May 2022 12:06:37 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 p1-20020a0568301d4100b0060603221270sm2907397oth.64.2022.05.07.12.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 12:06:36 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 02/17] ppc/pnv: rename PnvPHB3.regs[] to PnvPHB3.regs3[]
Date: Sat,  7 May 2022 16:06:09 -0300
Message-Id: <20220507190624.507419-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507190624.507419-1-danielhb413@gmail.com>
References: <20220507190624.507419-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Another redundancy between PnvPHB3 and PnvPHB4 that we should take care
before merging all together in an unified model is the regs[] array.

Rename the regs[] array used by the PHB3 code to 'regs3'.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c         | 54 +++++++++++++++++-----------------
 hw/pci-host/pnv_phb3_msi.c     |  6 ++--
 include/hw/pci-host/pnv_phb3.h |  4 +--
 3 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 860f8846df..77ee2325be 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -27,7 +27,7 @@
 static PCIDevice *pnv_phb3_find_cfg_dev(PnvPHB3 *phb)
 {
     PCIHostState *pci = PCI_HOST_BRIDGE(phb);
-    uint64_t addr = phb->regs[PHB_CONFIG_ADDRESS >> 3];
+    uint64_t addr = phb->regs3[PHB_CONFIG_ADDRESS >> 3];
     uint8_t bus, devfn;
 
     if (!(addr >> 63)) {
@@ -53,7 +53,7 @@ static void pnv_phb3_config_write(PnvPHB3 *phb, unsigned off,
     if (!pdev) {
         return;
     }
-    cfg_addr = (phb->regs[PHB_CONFIG_ADDRESS >> 3] >> 32) & 0xffc;
+    cfg_addr = (phb->regs3[PHB_CONFIG_ADDRESS >> 3] >> 32) & 0xffc;
     cfg_addr |= off;
     limit = pci_config_size(pdev);
     if (limit <= cfg_addr) {
@@ -89,7 +89,7 @@ static uint64_t pnv_phb3_config_read(PnvPHB3 *phb, unsigned off,
     if (!pdev) {
         return ~0ull;
     }
-    cfg_addr = (phb->regs[PHB_CONFIG_ADDRESS >> 3] >> 32) & 0xffc;
+    cfg_addr = (phb->regs3[PHB_CONFIG_ADDRESS >> 3] >> 32) & 0xffc;
     cfg_addr |= off;
     limit = pci_config_size(pdev);
     if (limit <= cfg_addr) {
@@ -122,14 +122,14 @@ static void pnv_phb3_check_m32(PnvPHB3 *phb)
         memory_region_del_subregion(phb->mr_m32.container, &phb->mr_m32);
     }
 
-    if (!(phb->regs[PHB_PHB3_CONFIG >> 3] & PHB_PHB3C_M32_EN)) {
+    if (!(phb->regs3[PHB_PHB3_CONFIG >> 3] & PHB_PHB3C_M32_EN)) {
         return;
     }
 
     /* Grab geometry from registers */
-    base = phb->regs[PHB_M32_BASE_ADDR >> 3];
-    start = phb->regs[PHB_M32_START_ADDR >> 3];
-    size = ~(phb->regs[PHB_M32_BASE_MASK >> 3] | 0xfffc000000000000ull) + 1;
+    base = phb->regs3[PHB_M32_BASE_ADDR >> 3];
+    start = phb->regs3[PHB_M32_START_ADDR >> 3];
+    size = ~(phb->regs3[PHB_M32_BASE_MASK >> 3] | 0xfffc000000000000ull) + 1;
 
     /* Check if it matches an enabled MMIO region in the PBCQ */
     if (memory_region_is_mapped(&pbcq->mmbar0) &&
@@ -179,7 +179,7 @@ static void pnv_phb3_check_m64(PnvPHB3 *phb, uint32_t index)
     size = GETFIELD(IODA2_M64BT_MASK, m64) << 20;
     size |= 0xfffc000000000000ull;
     size = ~size + 1;
-    start = base | (phb->regs[PHB_M64_UPPER_BITS >> 3]);
+    start = base | (phb->regs3[PHB_M64_UPPER_BITS >> 3]);
 
     /* Check if it matches an enabled MMIO region in the PBCQ */
     if (memory_region_is_mapped(&pbcq->mmbar0) &&
@@ -233,7 +233,7 @@ static void pnv_phb3_lxivt_write(PnvPHB3 *phb, unsigned idx, uint64_t val)
 static uint64_t *pnv_phb3_ioda_access(PnvPHB3 *phb,
                                       unsigned *out_table, unsigned *out_idx)
 {
-    uint64_t adreg = phb->regs[PHB_IODA_ADDR >> 3];
+    uint64_t adreg = phb->regs3[PHB_IODA_ADDR >> 3];
     unsigned int index = GETFIELD(PHB_IODA_AD_TADR, adreg);
     unsigned int table = GETFIELD(PHB_IODA_AD_TSEL, adreg);
     unsigned int mask;
@@ -300,7 +300,7 @@ static uint64_t *pnv_phb3_ioda_access(PnvPHB3 *phb,
         index = (index + 1) & mask;
         adreg = SETFIELD(PHB_IODA_AD_TADR, adreg, index);
     }
-    phb->regs[PHB_IODA_ADDR >> 3] = adreg;
+    phb->regs3[PHB_IODA_ADDR >> 3] = adreg;
     return tptr;
 }
 
@@ -364,7 +364,7 @@ void pnv_phb3_remap_irqs(PnvPHB3 *phb)
     }
 
     /* Grab local LSI source ID */
-    local = GETFIELD(PHB_LSI_SRC_ID, phb->regs[PHB_LSI_SOURCE_ID >> 3]) << 3;
+    local = GETFIELD(PHB_LSI_SRC_ID, phb->regs3[PHB_LSI_SOURCE_ID >> 3]) << 3;
 
     /* Grab global one and compare */
     global = GETFIELD(PBCQ_NEST_LSI_SRC,
@@ -412,7 +412,7 @@ static void pnv_phb3_lsi_src_id_write(PnvPHB3 *phb, uint64_t val)
 {
     /* Sanitize content */
     val &= PHB_LSI_SRC_ID;
-    phb->regs[PHB_LSI_SOURCE_ID >> 3] = val;
+    phb->regs3[PHB_LSI_SOURCE_ID >> 3] = val;
     pnv_phb3_remap_irqs(phb);
 }
 
@@ -429,7 +429,7 @@ static void pnv_phb3_rtc_invalidate(PnvPHB3 *phb, uint64_t val)
 
 static void pnv_phb3_update_msi_regions(PnvPhb3DMASpace *ds)
 {
-    uint64_t cfg = ds->phb->regs[PHB_PHB3_CONFIG >> 3];
+    uint64_t cfg = ds->phb->regs3[PHB_PHB3_CONFIG >> 3];
 
     if (cfg & PHB_PHB3C_32BIT_MSI_EN) {
         if (!memory_region_is_mapped(&ds->msi32_mr)) {
@@ -501,16 +501,16 @@ void pnv_phb3_reg_write(void *opaque, hwaddr off, uint64_t val, unsigned size)
         break;
     /* LEM stuff */
     case PHB_LEM_FIR_AND_MASK:
-        phb->regs[PHB_LEM_FIR_ACCUM >> 3] &= val;
+        phb->regs3[PHB_LEM_FIR_ACCUM >> 3] &= val;
         return;
     case PHB_LEM_FIR_OR_MASK:
-        phb->regs[PHB_LEM_FIR_ACCUM >> 3] |= val;
+        phb->regs3[PHB_LEM_FIR_ACCUM >> 3] |= val;
         return;
     case PHB_LEM_ERROR_AND_MASK:
-        phb->regs[PHB_LEM_ERROR_MASK >> 3] &= val;
+        phb->regs3[PHB_LEM_ERROR_MASK >> 3] &= val;
         return;
     case PHB_LEM_ERROR_OR_MASK:
-        phb->regs[PHB_LEM_ERROR_MASK >> 3] |= val;
+        phb->regs3[PHB_LEM_ERROR_MASK >> 3] |= val;
         return;
     case PHB_LEM_WOF:
         val = 0;
@@ -518,10 +518,10 @@ void pnv_phb3_reg_write(void *opaque, hwaddr off, uint64_t val, unsigned size)
     }
 
     /* Record whether it changed */
-    changed = phb->regs[off >> 3] != val;
+    changed = phb->regs3[off >> 3] != val;
 
     /* Store in register cache first */
-    phb->regs[off >> 3] = val;
+    phb->regs3[off >> 3] = val;
 
     /* Handle side effects */
     switch (off) {
@@ -605,7 +605,7 @@ uint64_t pnv_phb3_reg_read(void *opaque, hwaddr off, unsigned size)
     }
 
     /* Default read from cache */
-    val = phb->regs[off >> 3];
+    val = phb->regs3[off >> 3];
 
     switch (off) {
     /* Simulate venice DD2.0 */
@@ -628,7 +628,7 @@ uint64_t pnv_phb3_reg_read(void *opaque, hwaddr off, unsigned size)
     /* FFI Lock */
     case PHB_FFI_LOCK:
         /* Set lock and return previous value */
-        phb->regs[off >> 3] |= PHB_FFI_LOCK_STATE;
+        phb->regs3[off >> 3] |= PHB_FFI_LOCK_STATE;
         return val;
 
     /* DMA read sync: make it look like it's complete */
@@ -704,7 +704,7 @@ static bool pnv_phb3_resolve_pe(PnvPhb3DMASpace *ds)
     }
 
     /* We need to lookup the RTT */
-    rtt = ds->phb->regs[PHB_RTT_BAR >> 3];
+    rtt = ds->phb->regs3[PHB_RTT_BAR >> 3];
     if (!(rtt & PHB_RTT_BAR_ENABLE)) {
         phb3_error(ds->phb, "DMA with RTT BAR disabled !");
         /* Set error bits ? fence ? ... */
@@ -861,7 +861,7 @@ static IOMMUTLBEntry pnv_phb3_translate_iommu(IOMMUMemoryRegion *iommu,
     switch (addr >> 60) {
     case 00:
         /* DMA or 32-bit MSI ? */
-        cfg = ds->phb->regs[PHB_PHB3_CONFIG >> 3];
+        cfg = ds->phb->regs3[PHB_PHB3_CONFIG >> 3];
         if ((cfg & PHB_PHB3C_32BIT_MSI_EN) &&
             ((addr & 0xffffffffffff0000ull) == 0xffff0000ull)) {
             phb3_error(phb, "xlate on 32-bit MSI region");
@@ -1032,7 +1032,7 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
     }
 
     /* Controller Registers */
-    memory_region_init_io(&phb->mr_regs, OBJECT(phb), &pnv_phb3_reg_ops, phb,
+    memory_region_init_io(&phb->mr_regs3, OBJECT(phb), &pnv_phb3_reg_ops, phb,
                           "phb3-regs", 0x1000);
 
     /*
@@ -1060,14 +1060,14 @@ void pnv_phb3_update_regions(PnvPHB3 *phb)
     PnvPBCQState *pbcq = &phb->pbcq;
 
     /* Unmap first always */
-    if (memory_region_is_mapped(&phb->mr_regs)) {
-        memory_region_del_subregion(&pbcq->phbbar, &phb->mr_regs);
+    if (memory_region_is_mapped(&phb->mr_regs3)) {
+        memory_region_del_subregion(&pbcq->phbbar, &phb->mr_regs3);
     }
 
     /* Map registers if enabled */
     if (memory_region_is_mapped(&pbcq->phbbar)) {
         /* TODO: We should use the PHB BAR 2 register but we don't ... */
-        memory_region_add_subregion(&pbcq->phbbar, 0, &phb->mr_regs);
+        memory_region_add_subregion(&pbcq->phbbar, 0, &phb->mr_regs3);
     }
 
     /* Check/update m32 */
diff --git a/hw/pci-host/pnv_phb3_msi.c b/hw/pci-host/pnv_phb3_msi.c
index 2f4112907b..d8534376f8 100644
--- a/hw/pci-host/pnv_phb3_msi.c
+++ b/hw/pci-host/pnv_phb3_msi.c
@@ -20,8 +20,8 @@
 
 static uint64_t phb3_msi_ive_addr(PnvPHB3 *phb, int srcno)
 {
-    uint64_t ivtbar = phb->regs[PHB_IVT_BAR >> 3];
-    uint64_t phbctl = phb->regs[PHB_CONTROL >> 3];
+    uint64_t ivtbar = phb->regs3[PHB_IVT_BAR >> 3];
+    uint64_t phbctl = phb->regs3[PHB_CONTROL >> 3];
 
     if (!(ivtbar & PHB_IVT_BAR_ENABLE)) {
         qemu_log_mask(LOG_GUEST_ERROR, "Failed access to disable IVT BAR !");
@@ -188,7 +188,7 @@ void pnv_phb3_msi_ffi(Phb3MsiState *msi, uint64_t val)
     pnv_phb3_msi_send(msi, val, 0, -1);
 
     /* Clear FFI lock */
-    msi->phb->regs[PHB_FFI_LOCK >> 3] = 0;
+    msi->phb->regs3[PHB_FFI_LOCK >> 3] = 0;
 }
 
 static void phb3_msi_reject(ICSState *ics, uint32_t nr)
diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index 73da31fbd2..486dbbefee 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -133,8 +133,8 @@ struct PnvPHB3 {
     uint32_t phb_id;
     char bus_path[8];
 
-    uint64_t regs[PNV_PHB3_NUM_REGS];
-    MemoryRegion mr_regs;
+    uint64_t regs3[PNV_PHB3_NUM_REGS];
+    MemoryRegion mr_regs3;
 
     MemoryRegion mr_m32;
     MemoryRegion mr_m64[PNV_PHB3_NUM_M64];
-- 
2.32.0


