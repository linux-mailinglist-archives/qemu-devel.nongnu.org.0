Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381AA51E960
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 21:16:12 +0200 (CEST)
Received: from localhost ([::1]:51886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnPuV-0004VL-A9
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 15:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlY-0005fo-DG; Sat, 07 May 2022 15:06:56 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:34657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlV-0001ZF-LL; Sat, 07 May 2022 15:06:56 -0400
Received: by mail-oi1-x233.google.com with SMTP id j12so6181859oie.1;
 Sat, 07 May 2022 12:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bYqOp8k1rU+dDA9esCZEbvwm9fn+nB2WYshFxo7Yl0U=;
 b=KZsf0dCARPjwqew2Vh9TSW0A9E9qAhe2SF+QXg8QTMSjsmcryGrMh+2mec5tSKfogl
 3tqqcax9RgXvWhmRx0M9q/QC+WgHElVEvDqcwR4/MGyafbtJCw7xfVz4keEQYQuXCu5L
 G8Lz6w4fVnMQz2Hfzmi60QNEai1WLwug4fYoL2pQGo0em+FT2vRBWtYUF6+Sd6NhlPGM
 xIWtS1vsf/B1JF5F4hRr2NAPgRF7zwqasNgNLTrLRgyP7ue/sBGJg45rsC712FASFhuX
 DJdEra0QPl2dfkzuQJmwQSuvKoDfmqHrA6611rkvcnntIaXCudJK6okavxkGbwwyw35G
 0hCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bYqOp8k1rU+dDA9esCZEbvwm9fn+nB2WYshFxo7Yl0U=;
 b=m3atUxTnhErIpAGD/VewBa761ZS1H63wY77o/PvY3MwzNapHo5DMmjHG4n3MHt5etr
 4Lu+WK5WciVZOk9962DeVN4hewUF9dxrZ1jFODZnBY3y5pBWTVBAdk83knucl/hXxDBE
 O+J/XcBOy3djF8kiyiUDSxBe2rY1raxHC4UxNZOxDFp9Ze5R8xJrx+a8Uhebc7zngY4E
 1aw75BwBmmDL8agceEEz1ZL1NJ/iQ4FxHvmAN8Z9qpc4sksGCiXD4RvvxxTX7BN1OS6y
 kIJ2qlvXYeIUUj9XG0aQS4VXGGVVgOkeqrIKjZ0LaL0fVkh9An5/IeKy48vpX3M6ZyU2
 xR9w==
X-Gm-Message-State: AOAM531VdiSkUueNFOy97gVgh/5ortWO3Tgjv5fgcj1W+F3ZfnZJlizU
 fLVO+OMfscRfixYavpk0tmHzt+VHeHI=
X-Google-Smtp-Source: ABdhPJxd1LODqxYyZj43Y2NlPEgkNaDzrpucubExJmeHr27FaOXA7rHXZQjaJqBbF934w4toyXujUg==
X-Received: by 2002:aca:ead4:0:b0:2ec:ba66:12df with SMTP id
 i203-20020acaead4000000b002ecba6612dfmr8054176oih.194.1651950411765; 
 Sat, 07 May 2022 12:06:51 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 p1-20020a0568301d4100b0060603221270sm2907397oth.64.2022.05.07.12.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 12:06:51 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 08/17] ppc/pnv: remove PnvPHB4
Date: Sat,  7 May 2022 16:06:15 -0300
Message-Id: <20220507190624.507419-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507190624.507419-1-danielhb413@gmail.com>
References: <20220507190624.507419-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
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

The PnvPHB device is able to replace the PnvPHB4 device in all
instances, while also being usable by the PHB3 logic.

The PnvPHB4 device wasn't user creatable in any official QEMU release,
so we can remove it without breaking ABI.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c          |  15 ++++
 hw/pci-host/pnv_phb4.c         | 138 +++++++++++----------------------
 hw/pci-host/pnv_phb4_pec.c     |   4 +-
 hw/ppc/pnv.c                   |   2 +-
 include/hw/pci-host/pnv_phb4.h |  98 +++--------------------
 5 files changed, 75 insertions(+), 182 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index e4c4cca311..9583c703d4 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -55,7 +55,10 @@ static void pnv_phb_instance_init(Object *obj)
         !strcmp(chip_typename, TYPE_PNV_CHIP_POWER8E) ||
         !strcmp(chip_typename, TYPE_PNV_CHIP_POWER8NVL)) {
         pnv_phb3_instance_init(obj);
+        return;
     }
+
+    pnv_phb4_instance_init(obj);
 }
 
 static void pnv_phb_realize(DeviceState *dev, Error **errp)
@@ -69,7 +72,10 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         !strcmp(chip_typename, TYPE_PNV_CHIP_POWER8NVL)) {
         /* PnvPHB3 */
         pnv_phb3_realize(dev, errp);
+        return;
     }
+
+    pnv_phb4_realize(dev, errp);
 }
 
 static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
@@ -86,6 +92,8 @@ static Property pnv_phb_properties[] = {
     DEFINE_PROP_UINT32("index", PnvPHB, phb_id, 0),
     DEFINE_PROP_UINT32("chip-id", PnvPHB, chip_id, 0),
     DEFINE_PROP_LINK("chip", PnvPHB, chip, TYPE_PNV_CHIP, PnvChip *),
+    DEFINE_PROP_LINK("pec", PnvPHB, pec, TYPE_PNV_PHB4_PEC,
+                     PnvPhb4PecState *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -93,12 +101,15 @@ static void pnv_phb_class_init(ObjectClass *klass, void *data)
 {
     PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
+    XiveNotifierClass *xfc = XIVE_NOTIFIER_CLASS(klass);
 
     hc->root_bus_path = pnv_phb_root_bus_path;
     dc->realize = pnv_phb_realize;
     device_class_set_props(dc, pnv_phb_properties);
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->user_creatable = true;
+
+    xfc->notify         = pnv_phb4_xive_notify;
 }
 
 static const TypeInfo pnv_phb_type_info = {
@@ -107,6 +118,10 @@ static const TypeInfo pnv_phb_type_info = {
     .instance_size = sizeof(PnvPHB),
     .class_init    = pnv_phb_class_init,
     .instance_init = pnv_phb_instance_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_XIVE_NOTIFIER },
+        { },
+    },
 };
 
 static void pnv_phb_register_types(void)
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 13ba9e45d8..becfd366f1 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -47,7 +47,7 @@ static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
     return (word & ~mask) | ((value << ctz64(mask)) & mask);
 }
 
-static PCIDevice *pnv_phb4_find_cfg_dev(PnvPHB4 *phb)
+static PCIDevice *pnv_phb4_find_cfg_dev(PnvPHB *phb)
 {
     PCIHostState *pci = PCI_HOST_BRIDGE(phb);
     uint64_t addr = phb->regs[PHB_CONFIG_ADDRESS >> 3];
@@ -70,7 +70,7 @@ static PCIDevice *pnv_phb4_find_cfg_dev(PnvPHB4 *phb)
  * The CONFIG_DATA register expects little endian accesses, but as the
  * region is big endian, we have to swap the value.
  */
-static void pnv_phb4_config_write(PnvPHB4 *phb, unsigned off,
+static void pnv_phb4_config_write(PnvPHB *phb, unsigned off,
                                   unsigned size, uint64_t val)
 {
     uint32_t cfg_addr, limit;
@@ -105,7 +105,7 @@ static void pnv_phb4_config_write(PnvPHB4 *phb, unsigned off,
     pci_host_config_write_common(pdev, cfg_addr, limit, val, size);
 }
 
-static uint64_t pnv_phb4_config_read(PnvPHB4 *phb, unsigned off,
+static uint64_t pnv_phb4_config_read(PnvPHB *phb, unsigned off,
                                      unsigned size)
 {
     uint32_t cfg_addr, limit;
@@ -142,7 +142,7 @@ static uint64_t pnv_phb4_config_read(PnvPHB4 *phb, unsigned off,
 /*
  * Root complex register accesses are memory mapped.
  */
-static void pnv_phb4_rc_config_write(PnvPHB4 *phb, unsigned off,
+static void pnv_phb4_rc_config_write(PnvPHB *phb, unsigned off,
                                      unsigned size, uint64_t val)
 {
     PCIHostState *pci = PCI_HOST_BRIDGE(phb);
@@ -163,7 +163,7 @@ static void pnv_phb4_rc_config_write(PnvPHB4 *phb, unsigned off,
                                  bswap32(val), 4);
 }
 
-static uint64_t pnv_phb4_rc_config_read(PnvPHB4 *phb, unsigned off,
+static uint64_t pnv_phb4_rc_config_read(PnvPHB *phb, unsigned off,
                                         unsigned size)
 {
     PCIHostState *pci = PCI_HOST_BRIDGE(phb);
@@ -185,7 +185,7 @@ static uint64_t pnv_phb4_rc_config_read(PnvPHB4 *phb, unsigned off,
     return bswap32(val);
 }
 
-static void pnv_phb4_check_mbt(PnvPHB4 *phb, uint32_t index)
+static void pnv_phb4_check_mbt(PnvPHB *phb, uint32_t index)
 {
     uint64_t base, start, size, mbe0, mbe1;
     MemoryRegion *parent;
@@ -248,7 +248,7 @@ static void pnv_phb4_check_mbt(PnvPHB4 *phb, uint32_t index)
     memory_region_add_subregion(parent, base, &phb->mr_mmio[index]);
 }
 
-static void pnv_phb4_check_all_mbt(PnvPHB4 *phb)
+static void pnv_phb4_check_all_mbt(PnvPHB *phb)
 {
     uint64_t i;
     uint32_t num_windows = phb->big_phb ? PNV_PHB4_MAX_MMIO_WINDOWS :
@@ -259,7 +259,7 @@ static void pnv_phb4_check_all_mbt(PnvPHB4 *phb)
     }
 }
 
-static uint64_t *pnv_phb4_ioda_access(PnvPHB4 *phb,
+static uint64_t *pnv_phb4_ioda_access(PnvPHB *phb,
                                       unsigned *out_table, unsigned *out_idx)
 {
     uint64_t adreg = phb->regs[PHB_IODA_ADDR >> 3];
@@ -336,7 +336,7 @@ static uint64_t *pnv_phb4_ioda_access(PnvPHB4 *phb,
     return tptr;
 }
 
-static uint64_t pnv_phb4_ioda_read(PnvPHB4 *phb)
+static uint64_t pnv_phb4_ioda_read(PnvPHB *phb)
 {
     unsigned table, idx;
     uint64_t *tptr;
@@ -355,7 +355,7 @@ static uint64_t pnv_phb4_ioda_read(PnvPHB4 *phb)
     return *tptr;
 }
 
-static void pnv_phb4_ioda_write(PnvPHB4 *phb, uint64_t val)
+static void pnv_phb4_ioda_write(PnvPHB *phb, uint64_t val)
 {
     unsigned table, idx;
     uint64_t *tptr;
@@ -419,7 +419,7 @@ static void pnv_phb4_ioda_write(PnvPHB4 *phb, uint64_t val)
     }
 }
 
-static void pnv_phb4_rtc_invalidate(PnvPHB4 *phb, uint64_t val)
+static void pnv_phb4_rtc_invalidate(PnvPHB *phb, uint64_t val)
 {
     PnvPhb4DMASpace *ds;
 
@@ -458,7 +458,7 @@ static void pnv_phb4_update_msi_regions(PnvPhb4DMASpace *ds)
     }
 }
 
-static void pnv_phb4_update_all_msi_regions(PnvPHB4 *phb)
+static void pnv_phb4_update_all_msi_regions(PnvPHB *phb)
 {
     PnvPhb4DMASpace *ds;
 
@@ -467,7 +467,7 @@ static void pnv_phb4_update_all_msi_regions(PnvPHB4 *phb)
     }
 }
 
-static void pnv_phb4_update_xsrc(PnvPHB4 *phb)
+static void pnv_phb4_update_xsrc(PnvPHB *phb)
 {
     int shift, flags, i, lsi_base;
     XiveSource *xsrc = &phb->xsrc;
@@ -518,7 +518,7 @@ static void pnv_phb4_update_xsrc(PnvPHB4 *phb)
 static void pnv_phb4_reg_write(void *opaque, hwaddr off, uint64_t val,
                                unsigned size)
 {
-    PnvPHB4 *phb = PNV_PHB4(opaque);
+    PnvPHB *phb = PNV_PHB(opaque);
     bool changed;
 
     /* Special case outbound configuration data */
@@ -656,7 +656,7 @@ static void pnv_phb4_reg_write(void *opaque, hwaddr off, uint64_t val,
 
 static uint64_t pnv_phb4_reg_read(void *opaque, hwaddr off, unsigned size)
 {
-    PnvPHB4 *phb = PNV_PHB4(opaque);
+    PnvPHB *phb = PNV_PHB(opaque);
     uint64_t val;
 
     if ((off & 0xfffc) == PHB_CONFIG_DATA) {
@@ -752,7 +752,7 @@ static const MemoryRegionOps pnv_phb4_reg_ops = {
 
 static uint64_t pnv_phb4_xscom_read(void *opaque, hwaddr addr, unsigned size)
 {
-    PnvPHB4 *phb = PNV_PHB4(opaque);
+    PnvPHB *phb = PNV_PHB(opaque);
     uint32_t reg = addr >> 3;
     uint64_t val;
     hwaddr offset;
@@ -805,7 +805,7 @@ static uint64_t pnv_phb4_xscom_read(void *opaque, hwaddr addr, unsigned size)
 static void pnv_phb4_xscom_write(void *opaque, hwaddr addr,
                                  uint64_t val, unsigned size)
 {
-    PnvPHB4 *phb = PNV_PHB4(opaque);
+    PnvPHB *phb = PNV_PHB(opaque);
     uint32_t reg = addr >> 3;
     hwaddr offset;
 
@@ -868,7 +868,7 @@ const MemoryRegionOps pnv_phb4_xscom_ops = {
 static uint64_t pnv_pec_stk_nest_xscom_read(void *opaque, hwaddr addr,
                                             unsigned size)
 {
-    PnvPHB4 *phb = PNV_PHB4(opaque);
+    PnvPHB *phb = PNV_PHB(opaque);
     uint32_t reg = addr >> 3;
 
     /* TODO: add list of allowed registers and error out if not */
@@ -876,14 +876,14 @@ static uint64_t pnv_pec_stk_nest_xscom_read(void *opaque, hwaddr addr,
 }
 
 /*
- * Return the 'stack_no' of a PHB4. 'stack_no' is the order
+ * Return the 'stack_no' of a PHB. 'stack_no' is the order
  * the PHB4 occupies in the PEC. This is the reverse of what
  * pnv_phb4_pec_get_phb_id() does.
  *
  * E.g. a phb with phb_id = 4 and pec->index = 1 (PEC1) will
  * be the second phb (stack_no = 1) of the PEC.
  */
-static int pnv_phb4_get_phb_stack_no(PnvPHB4 *phb)
+static int pnv_phb4_get_phb_stack_no(PnvPHB *phb)
 {
     PnvPhb4PecState *pec = phb->pec;
     PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
@@ -897,7 +897,7 @@ static int pnv_phb4_get_phb_stack_no(PnvPHB4 *phb)
     return stack_no;
 }
 
-static void pnv_phb4_update_regions(PnvPHB4 *phb)
+static void pnv_phb4_update_regions(PnvPHB *phb)
 {
     /* Unmap first always */
     if (memory_region_is_mapped(&phb->mr_regs)) {
@@ -921,7 +921,7 @@ static void pnv_phb4_update_regions(PnvPHB4 *phb)
     pnv_phb4_check_all_mbt(phb);
 }
 
-static void pnv_pec_phb_update_map(PnvPHB4 *phb)
+static void pnv_pec_phb_update_map(PnvPHB *phb)
 {
     PnvPhb4PecState *pec = phb->pec;
     MemoryRegion *sysmem = get_system_memory();
@@ -1010,7 +1010,7 @@ static void pnv_pec_phb_update_map(PnvPHB4 *phb)
 static void pnv_pec_stk_nest_xscom_write(void *opaque, hwaddr addr,
                                          uint64_t val, unsigned size)
 {
-    PnvPHB4 *phb = PNV_PHB4(opaque);
+    PnvPHB *phb = PNV_PHB(opaque);
     PnvPhb4PecState *pec = phb->pec;
     uint32_t reg = addr >> 3;
 
@@ -1099,7 +1099,7 @@ static const MemoryRegionOps pnv_pec_stk_nest_xscom_ops = {
 static uint64_t pnv_pec_stk_pci_xscom_read(void *opaque, hwaddr addr,
                                            unsigned size)
 {
-    PnvPHB4 *phb = PNV_PHB4(opaque);
+    PnvPHB *phb = PNV_PHB(opaque);
     uint32_t reg = addr >> 3;
 
     /* TODO: add list of allowed registers and error out if not */
@@ -1109,7 +1109,7 @@ static uint64_t pnv_pec_stk_pci_xscom_read(void *opaque, hwaddr addr,
 static void pnv_pec_stk_pci_xscom_write(void *opaque, hwaddr addr,
                                         uint64_t val, unsigned size)
 {
-    PnvPHB4 *phb = PNV_PHB4(opaque);
+    PnvPHB *phb = PNV_PHB(opaque);
     uint32_t reg = addr >> 3;
 
     switch (reg) {
@@ -1172,7 +1172,7 @@ static int pnv_phb4_map_irq(PCIDevice *pci_dev, int irq_num)
 
 static void pnv_phb4_set_irq(void *opaque, int irq_num, int level)
 {
-    PnvPHB4 *phb = PNV_PHB4(opaque);
+    PnvPHB *phb = PNV_PHB(opaque);
     uint32_t lsi_base;
 
     /* LSI only ... */
@@ -1407,7 +1407,7 @@ static void pnv_phb4_msi_write(void *opaque, hwaddr addr,
                                uint64_t data, unsigned size)
 {
     PnvPhb4DMASpace *ds = opaque;
-    PnvPHB4 *phb = ds->phb;
+    PnvPHB *phb = ds->phb;
 
     uint32_t src = ((addr >> 4) & 0xffff) | (data & 0x1f);
 
@@ -1444,7 +1444,7 @@ static const MemoryRegionOps pnv_phb4_msi_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN
 };
 
-static PnvPhb4DMASpace *pnv_phb4_dma_find(PnvPHB4 *phb, PCIBus *bus, int devfn)
+static PnvPhb4DMASpace *pnv_phb4_dma_find(PnvPHB *phb, PCIBus *bus, int devfn)
 {
     PnvPhb4DMASpace *ds;
 
@@ -1458,7 +1458,7 @@ static PnvPhb4DMASpace *pnv_phb4_dma_find(PnvPHB4 *phb, PCIBus *bus, int devfn)
 
 static AddressSpace *pnv_phb4_dma_iommu(PCIBus *bus, void *opaque, int devfn)
 {
-    PnvPHB4 *phb = opaque;
+    PnvPHB *phb = opaque;
     PnvPhb4DMASpace *ds;
     char name[32];
 
@@ -1488,7 +1488,7 @@ static AddressSpace *pnv_phb4_dma_iommu(PCIBus *bus, void *opaque, int devfn)
     return &ds->dma_as;
 }
 
-static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
+static void pnv_phb4_xscom_realize(PnvPHB *phb)
 {
     PnvPhb4PecState *pec = phb->pec;
     PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
@@ -1534,9 +1534,9 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
                             &phb->phb_regs_mr);
 }
 
-static void pnv_phb4_instance_init(Object *obj)
+void pnv_phb4_instance_init(Object *obj)
 {
-    PnvPHB4 *phb = PNV_PHB4(obj);
+    PnvPHB *phb = PNV_PHB(obj);
 
     QLIST_INIT(&phb->dma_spaces);
 
@@ -1544,9 +1544,9 @@ static void pnv_phb4_instance_init(Object *obj)
     object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE);
 }
 
-static void pnv_phb4_realize(DeviceState *dev, Error **errp)
+void pnv_phb4_realize(DeviceState *dev, Error **errp)
 {
-    PnvPHB4 *phb = PNV_PHB4(dev);
+    PnvPHB *phb = PNV_PHB(dev);
     PCIHostState *pci = PCI_HOST_BRIDGE(dev);
     XiveSource *xsrc = &phb->xsrc;
     int nr_irqs;
@@ -1602,22 +1602,12 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     pnv_phb4_xscom_realize(phb);
 }
 
-static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
-                                          PCIBus *rootbus)
-{
-    PnvPHB4 *phb = PNV_PHB4(host_bridge);
-
-    snprintf(phb->bus_path, sizeof(phb->bus_path), "00%02x:%02x",
-             phb->chip_id, phb->phb_id);
-    return phb->bus_path;
-}
-
 /*
  * Address base trigger mode (POWER10)
  *
  * Trigger directly the IC ESB page
  */
-static void pnv_phb4_xive_notify_abt(PnvPHB4 *phb, uint32_t srcno,
+static void pnv_phb4_xive_notify_abt(PnvPHB *phb, uint32_t srcno,
                                      bool pq_checked)
 {
     uint64_t notif_port = phb->regs[PHB_INT_NOTIFY_ADDR >> 3];
@@ -1657,7 +1647,7 @@ static void pnv_phb4_xive_notify_abt(PnvPHB4 *phb, uint32_t srcno,
     }
 }
 
-static void pnv_phb4_xive_notify_ic(PnvPHB4 *phb, uint32_t srcno,
+static void pnv_phb4_xive_notify_ic(PnvPHB *phb, uint32_t srcno,
                                     bool pq_checked)
 {
     uint64_t notif_port = phb->regs[PHB_INT_NOTIFY_ADDR >> 3];
@@ -1679,10 +1669,10 @@ static void pnv_phb4_xive_notify_ic(PnvPHB4 *phb, uint32_t srcno,
     }
 }
 
-static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno,
-                                 bool pq_checked)
+void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno,
+                          bool pq_checked)
 {
-    PnvPHB4 *phb = PNV_PHB4(xf);
+    PnvPHB *phb = PNV_PHB(xf);
 
     if (phb->regs[PHB_CTRLR >> 3] & PHB_CTRLR_IRQ_ABT_MODE) {
         pnv_phb4_xive_notify_abt(phb, srcno, pq_checked);
@@ -1691,45 +1681,10 @@ static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno,
     }
 }
 
-static Property pnv_phb4_properties[] = {
-        DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
-        DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
-        DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
-                         PnvPhb4PecState *),
-        DEFINE_PROP_END_OF_LIST(),
-};
-
-static void pnv_phb4_class_init(ObjectClass *klass, void *data)
-{
-    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(klass);
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    XiveNotifierClass *xfc = XIVE_NOTIFIER_CLASS(klass);
-
-    hc->root_bus_path   = pnv_phb4_root_bus_path;
-    dc->realize         = pnv_phb4_realize;
-    device_class_set_props(dc, pnv_phb4_properties);
-    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    dc->user_creatable  = false;
-
-    xfc->notify         = pnv_phb4_xive_notify;
-}
-
-static const TypeInfo pnv_phb4_type_info = {
-    .name          = TYPE_PNV_PHB4,
-    .parent        = TYPE_PCIE_HOST_BRIDGE,
-    .instance_init = pnv_phb4_instance_init,
-    .instance_size = sizeof(PnvPHB4),
-    .class_init    = pnv_phb4_class_init,
-    .interfaces = (InterfaceInfo[]) {
-            { TYPE_XIVE_NOTIFIER },
-            { },
-    }
-};
-
 static const TypeInfo pnv_phb5_type_info = {
     .name          = TYPE_PNV_PHB5,
-    .parent        = TYPE_PNV_PHB4,
-    .instance_size = sizeof(PnvPHB4),
+    .parent        = TYPE_PNV_PHB,
+    .instance_size = sizeof(PnvPHB),
 };
 
 static void pnv_phb4_root_bus_class_init(ObjectClass *klass, void *data)
@@ -1779,14 +1734,14 @@ static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
     PCIDevice *pci = PCI_DEVICE(dev);
     PCIBus *bus = pci_get_bus(pci);
-    PnvPHB4 *phb = NULL;
+    PnvPHB *phb = NULL;
     Error *local_err = NULL;
 
-    phb = (PnvPHB4 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
-                                          TYPE_PNV_PHB4);
+    phb = (PnvPHB *) object_dynamic_cast(OBJECT(bus->qbus.parent),
+                                         TYPE_PNV_PHB);
 
     if (!phb) {
-        error_setg(errp, "%s must be connected to pnv-phb4 buses", dev->id);
+        error_setg(errp, "%s must be connected to pnv-phb buses", dev->id);
         return;
     }
 
@@ -1856,14 +1811,13 @@ static void pnv_phb4_register_types(void)
     type_register_static(&pnv_phb4_root_bus_info);
     type_register_static(&pnv_phb5_root_port_info);
     type_register_static(&pnv_phb4_root_port_info);
-    type_register_static(&pnv_phb4_type_info);
     type_register_static(&pnv_phb5_type_info);
     type_register_static(&pnv_phb4_iommu_memory_region_info);
 }
 
 type_init(pnv_phb4_register_types);
 
-void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon)
+void pnv_phb4_pic_print_info(PnvPHB *phb, Monitor *mon)
 {
     uint64_t notif_port =
         phb->regs[PHB_INT_NOTIFY_ADDR >> 3] & ~PHB_INT_NOTIFY_ADDR_64K;
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 61bc0b503e..3eed560e44 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -116,7 +116,7 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
                                         Error **errp)
 {
     PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
-    PnvPHB4 *phb = PNV_PHB4(qdev_new(pecc->phb_type));
+    PnvPHB *phb = PNV_PHB(qdev_new(pecc->phb_type));
     int phb_id = pnv_phb4_pec_get_phb_id(pec, stack_no);
 
     object_property_add_child(OBJECT(pec), "phb[*]", OBJECT(phb));
@@ -262,7 +262,7 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
     pecc->stk_compat = stk_compat;
     pecc->stk_compat_size = sizeof(stk_compat);
     pecc->version = PNV_PHB4_VERSION;
-    pecc->phb_type = TYPE_PNV_PHB4;
+    pecc->phb_type = TYPE_PNV_PHB;
     pecc->num_phbs = pnv_pec_num_phbs;
     pecc->rp_model = TYPE_PNV_PHB4_ROOT_PORT;
 }
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index d9e7530cd3..34a200a29c 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -676,7 +676,7 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
 static int pnv_chip_power9_pic_print_info_child(Object *child, void *opaque)
 {
     Monitor *mon = opaque;
-    PnvPHB4 *phb4 = (PnvPHB4 *) object_dynamic_cast(child, TYPE_PNV_PHB4);
+    PnvPHB *phb4 = (PnvPHB *) object_dynamic_cast(child, TYPE_PNV_PHB);
 
     if (phb4) {
         pnv_phb4_pic_print_info(phb4, mon);
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 19dcbd6f87..65a16f2067 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -12,12 +12,12 @@
 
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pcie_port.h"
+#include "hw/pci-host/pnv_phb.h"
 #include "hw/ppc/xive.h"
 #include "qom/object.h"
 
 typedef struct PnvPhb4PecState PnvPhb4PecState;
 typedef struct PnvPhb4PecStack PnvPhb4PecStack;
-typedef struct PnvPHB4 PnvPHB4;
 typedef struct PnvChip PnvChip;
 
 /*
@@ -36,7 +36,7 @@ typedef struct PnvPhb4DMASpace {
     uint8_t devfn;
     int pe_num;         /* Cached PE number */
 #define PHB_INVALID_PE (-1)
-    PnvPHB4 *phb;
+    PnvPHB *phb;
     AddressSpace dma_as;
     IOMMUMemoryRegion dma_mr;
     MemoryRegion msi32_mr;
@@ -55,11 +55,9 @@ typedef struct PnvPHB4RootPort {
     PCIESlot parent_obj;
 } PnvPHB4RootPort;
 
-/*
- * PHB4 PCIe Host Bridge for PowerNV machines (POWER9)
- */
-#define TYPE_PNV_PHB4 "pnv-phb4"
-OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB4, PNV_PHB4)
+struct PnvPHB4DeviceClass {
+    DeviceClass parent_class;
+};
 
 #define PNV_PHB4_MAX_LSIs          8
 #define PNV_PHB4_MAX_INTs          4096
@@ -77,85 +75,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB4, PNV_PHB4)
 
 #define PCI_MMIO_TOTAL_SIZE        (0x1ull << 60)
 
-struct PnvPHB4 {
-    PCIExpressHost parent_obj;
-
-    uint32_t chip_id;
-    uint32_t phb_id;
-
-    uint64_t version;
-
-    /* The owner PEC */
-    PnvPhb4PecState *pec;
-
-    char bus_path[8];
-
-    /* Main register images */
-    uint64_t regs[PNV_PHB4_NUM_REGS];
-    MemoryRegion mr_regs;
-
-    /* Extra SCOM-only register */
-    uint64_t scom_hv_ind_addr_reg;
-
-    /*
-     * Geometry of the PHB. There are two types, small and big PHBs, a
-     * number of resources (number of PEs, windows etc...) are doubled
-     * for a big PHB
-     */
-    bool big_phb;
-
-    /* Memory regions for MMIO space */
-    MemoryRegion mr_mmio[PNV_PHB4_MAX_MMIO_WINDOWS];
-
-    /* PCI side space */
-    MemoryRegion pci_mmio;
-    MemoryRegion pci_io;
-
-    /* PCI registers (excluding pass-through) */
-#define PHB4_PEC_PCI_STK_REGS_COUNT  0xf
-    uint64_t pci_regs[PHB4_PEC_PCI_STK_REGS_COUNT];
-    MemoryRegion pci_regs_mr;
-
-    /* Nest registers */
-#define PHB4_PEC_NEST_STK_REGS_COUNT  0x17
-    uint64_t nest_regs[PHB4_PEC_NEST_STK_REGS_COUNT];
-    MemoryRegion nest_regs_mr;
-
-    /* PHB pass-through XSCOM */
-    MemoryRegion phb_regs_mr;
-
-    /* Memory windows from PowerBus to PHB */
-    MemoryRegion phbbar;
-    MemoryRegion intbar;
-    MemoryRegion mmbar0;
-    MemoryRegion mmbar1;
-    uint64_t mmio0_base;
-    uint64_t mmio0_size;
-    uint64_t mmio1_base;
-    uint64_t mmio1_size;
-
-    /* On-chip IODA tables */
-    uint64_t ioda_LIST[PNV_PHB4_MAX_LSIs];
-    uint64_t ioda_MIST[PNV_PHB4_MAX_MIST];
-    uint64_t ioda_TVT[PNV_PHB4_MAX_TVEs];
-    uint64_t ioda_MBT[PNV_PHB4_MAX_MBEs];
-    uint64_t ioda_MDT[PNV_PHB4_MAX_PEs];
-    uint64_t ioda_PEEV[PNV_PHB4_MAX_PEEVs];
-
-    /*
-     * The internal PESTA/B is 2 bits per PE split into two tables, we
-     * store them in a single array here to avoid wasting space.
-     */
-    uint8_t  ioda_PEST_AB[PNV_PHB4_MAX_PEs];
-
-    /* P9 Interrupt generation */
-    XiveSource xsrc;
-    qemu_irq *qirqs;
-
-    QLIST_HEAD(, PnvPhb4DMASpace) dma_spaces;
-};
-
-void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
+void pnv_phb4_pic_print_info(PnvPHB *phb, Monitor *mon);
 int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index);
 extern const MemoryRegionOps pnv_phb4_xscom_ops;
 
@@ -214,7 +134,7 @@ struct PnvPhb4PecClass {
 
 #define TYPE_PNV_PHB5 "pnv-phb5"
 #define PNV_PHB5(obj) \
-    OBJECT_CHECK(PnvPhb4, (obj), TYPE_PNV_PHB5)
+    OBJECT_CHECK(PnvPhb, (obj), TYPE_PNV_PHB5)
 
 #define PNV_PHB5_VERSION           0x000000a500000001ull
 #define PNV_PHB5_DEVICE_ID         0x0652
@@ -223,4 +143,8 @@ struct PnvPhb4PecClass {
 #define PNV_PHB5_PEC(obj) \
     OBJECT_CHECK(PnvPhb4PecState, (obj), TYPE_PNV_PHB5_PEC)
 
+void pnv_phb4_instance_init(Object *obj);
+void pnv_phb4_realize(DeviceState *dev, Error **errp);
+void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno, bool pq_checked);
+
 #endif /* PCI_HOST_PNV_PHB4_H */
-- 
2.32.0


