Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D738C51E95C
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 21:14:54 +0200 (CEST)
Received: from localhost ([::1]:49118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnPtF-0002eK-Vg
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 15:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlS-0005LG-Hm; Sat, 07 May 2022 15:06:50 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:41520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlQ-0001XM-1h; Sat, 07 May 2022 15:06:50 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-edf9ddb312so9612740fac.8; 
 Sat, 07 May 2022 12:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BMxmlRSpWApzoOGJfheDKJR1ipl94PWBoN9qT7EWdW8=;
 b=f81fDAvx8HEU05ElFal6DGOUSq24kGtPEe8bpIvmT7onVAMcpGSER1Mys9K6qmhj7o
 FvcJxmupN7FtJVMnUnbFPVErP5tT5L8Z5l6Z0IDBUJQnjZDlNiS68HZ5QvgPXXBStx72
 LUFIaalQQVmRQWYygAPOlQHwpestKPERj4puGZUDWJdIb1yhkbu3hxeTAIRRGIaNOpfR
 ykAkvQ/c2iw3pX1by1fVzkBK2rjR+9Jh7l+E156C6zmLZukiPfiynYcy8zMYIjYOvLFZ
 IoNexWnAxR1pUjxWYfniqSq6V1C/kFWbp9vkAkyoBtpMspnUsl35V2HbJEaSHRLLlN91
 ixvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BMxmlRSpWApzoOGJfheDKJR1ipl94PWBoN9qT7EWdW8=;
 b=SadEtJUZK+PYlJM/QpX8GyupnAChYOJi/mt4SpwCsn4xJB6iHLw1gRbJHOBef63yex
 jLW+3y9yPhcft2qto73iASJY8WwyGvsnkyD0WkEUYgFXjx9ZYKFb44NfTJ/rjaZ4J7qh
 OoG2MrqUH7TFHp8555XVaZ6NBmkrMnVxHcSfgTiOHY0rDeX7IsWtfTywt8Tt/S0a9xQd
 yxtq09fDDMfq2asB/uKtwQs4q8D2vGDFYr4ijBto3+sYLraGJCTDge4E0v7hF3p0u32Z
 ZsOn59n8L3UHsa/m1UbM2V597keRcS9nuuExNH0X8cNNZjPDVtcOuW2ClrR27D3p6v42
 Ch8g==
X-Gm-Message-State: AOAM531L82GFS1EOZxn95Swn4jBJjTN0QpR4cPO9d3jVAuRgHqJhLEeC
 MvEymFUWW92mp0wsym5Hq0xeFsu0H6w=
X-Google-Smtp-Source: ABdhPJwvbrzpnBc4bkO0UI09bKeaj+1dwQEcVJ9aPtsMLWW96+uFTK8Os7/WBelke4SHpq356Mg8Jw==
X-Received: by 2002:a05:6870:8907:b0:e2:a4fd:7539 with SMTP id
 i7-20020a056870890700b000e2a4fd7539mr6968801oao.56.1651950406814; 
 Sat, 07 May 2022 12:06:46 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 p1-20020a0568301d4100b0060603221270sm2907397oth.64.2022.05.07.12.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 12:06:46 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 06/17] ppc/pnv: remove PnvPHB3
Date: Sat,  7 May 2022 16:06:13 -0300
Message-Id: <20220507190624.507419-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507190624.507419-1-danielhb413@gmail.com>
References: <20220507190624.507419-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
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

The unified PnvPHB model is able to replace PnvPHB3 in all PHB3 related
code. Let's do that while also removing the PnvPHB3 device entirely.
The device wasn't user creatable in any QEMU release so there's no ABI
concerns in doing so.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c          |  1 +
 hw/pci-host/pnv_phb3.c         | 92 ++++++++++------------------------
 hw/pci-host/pnv_phb3_msi.c     |  6 +--
 hw/pci-host/pnv_phb3_pbcq.c    |  8 +--
 hw/ppc/pnv.c                   | 12 ++---
 include/hw/pci-host/pnv_phb.h  |  9 ++--
 include/hw/pci-host/pnv_phb3.h | 43 +---------------
 include/hw/ppc/pnv.h           |  2 +-
 8 files changed, 48 insertions(+), 125 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 3dd08f768f..e4c4cca311 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -85,6 +85,7 @@ static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
 static Property pnv_phb_properties[] = {
     DEFINE_PROP_UINT32("index", PnvPHB, phb_id, 0),
     DEFINE_PROP_UINT32("chip-id", PnvPHB, chip_id, 0),
+    DEFINE_PROP_LINK("chip", PnvPHB, chip, TYPE_PNV_CHIP, PnvChip *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 8e31a69083..d2405d4f5a 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -24,7 +24,7 @@
     qemu_log_mask(LOG_GUEST_ERROR, "phb3[%d:%d]: " fmt "\n",            \
                   (phb)->chip_id, (phb)->phb_id, ## __VA_ARGS__)
 
-static PCIDevice *pnv_phb3_find_cfg_dev(PnvPHB3 *phb)
+static PCIDevice *pnv_phb3_find_cfg_dev(PnvPHB *phb)
 {
     PCIHostState *pci = PCI_HOST_BRIDGE(phb);
     uint64_t addr = phb->regs3[PHB_CONFIG_ADDRESS >> 3];
@@ -43,7 +43,7 @@ static PCIDevice *pnv_phb3_find_cfg_dev(PnvPHB3 *phb)
  * The CONFIG_DATA register expects little endian accesses, but as the
  * region is big endian, we have to swap the value.
  */
-static void pnv_phb3_config_write(PnvPHB3 *phb, unsigned off,
+static void pnv_phb3_config_write(PnvPHB *phb, unsigned off,
                                   unsigned size, uint64_t val)
 {
     uint32_t cfg_addr, limit;
@@ -78,7 +78,7 @@ static void pnv_phb3_config_write(PnvPHB3 *phb, unsigned off,
     pci_host_config_write_common(pdev, cfg_addr, limit, val, size);
 }
 
-static uint64_t pnv_phb3_config_read(PnvPHB3 *phb, unsigned off,
+static uint64_t pnv_phb3_config_read(PnvPHB *phb, unsigned off,
                                      unsigned size)
 {
     uint32_t cfg_addr, limit;
@@ -112,7 +112,7 @@ static uint64_t pnv_phb3_config_read(PnvPHB3 *phb, unsigned off,
     }
 }
 
-static void pnv_phb3_check_m32(PnvPHB3 *phb)
+static void pnv_phb3_check_m32(PnvPHB *phb)
 {
     uint64_t base, start, size;
     MemoryRegion *parent;
@@ -152,7 +152,7 @@ static void pnv_phb3_check_m32(PnvPHB3 *phb)
     memory_region_add_subregion(parent, base, &phb->mr_m32);
 }
 
-static void pnv_phb3_check_m64(PnvPHB3 *phb, uint32_t index)
+static void pnv_phb3_check_m64(PnvPHB *phb, uint32_t index)
 {
     uint64_t base, start, size, m64;
     MemoryRegion *parent;
@@ -202,7 +202,7 @@ static void pnv_phb3_check_m64(PnvPHB3 *phb, uint32_t index)
     memory_region_add_subregion(parent, base, &phb->mr_m64[index]);
 }
 
-static void pnv_phb3_check_all_m64s(PnvPHB3 *phb)
+static void pnv_phb3_check_all_m64s(PnvPHB *phb)
 {
     uint64_t i;
 
@@ -211,7 +211,7 @@ static void pnv_phb3_check_all_m64s(PnvPHB3 *phb)
     }
 }
 
-static void pnv_phb3_lxivt_write(PnvPHB3 *phb, unsigned idx, uint64_t val)
+static void pnv_phb3_lxivt_write(PnvPHB *phb, unsigned idx, uint64_t val)
 {
     uint8_t server, prio;
 
@@ -230,7 +230,7 @@ static void pnv_phb3_lxivt_write(PnvPHB3 *phb, unsigned idx, uint64_t val)
     ics_write_xive(&phb->lsis, idx, server, prio, prio);
 }
 
-static uint64_t *pnv_phb3_ioda_access(PnvPHB3 *phb,
+static uint64_t *pnv_phb3_ioda_access(PnvPHB *phb,
                                       unsigned *out_table, unsigned *out_idx)
 {
     uint64_t adreg = phb->regs3[PHB_IODA_ADDR >> 3];
@@ -304,7 +304,7 @@ static uint64_t *pnv_phb3_ioda_access(PnvPHB3 *phb,
     return tptr;
 }
 
-static uint64_t pnv_phb3_ioda_read(PnvPHB3 *phb)
+static uint64_t pnv_phb3_ioda_read(PnvPHB *phb)
 {
         unsigned table;
         uint64_t *tptr;
@@ -317,7 +317,7 @@ static uint64_t pnv_phb3_ioda_read(PnvPHB3 *phb)
         return *tptr;
 }
 
-static void pnv_phb3_ioda_write(PnvPHB3 *phb, uint64_t val)
+static void pnv_phb3_ioda_write(PnvPHB *phb, uint64_t val)
 {
         unsigned table, idx;
         uint64_t *tptr;
@@ -345,7 +345,7 @@ static void pnv_phb3_ioda_write(PnvPHB3 *phb, uint64_t val)
  * This is called whenever the PHB LSI, MSI source ID register or
  * the PBCQ irq filters are written.
  */
-void pnv_phb3_remap_irqs(PnvPHB3 *phb)
+void pnv_phb3_remap_irqs(PnvPHB *phb)
 {
     ICSState *ics = &phb->lsis;
     uint32_t local, global, count, mask, comp;
@@ -408,7 +408,7 @@ void pnv_phb3_remap_irqs(PnvPHB3 *phb)
     pnv_phb3_msi_update_config(&phb->msis, comp, count - PNV_PHB3_NUM_LSI);
 }
 
-static void pnv_phb3_lsi_src_id_write(PnvPHB3 *phb, uint64_t val)
+static void pnv_phb3_lsi_src_id_write(PnvPHB *phb, uint64_t val)
 {
     /* Sanitize content */
     val &= PHB_LSI_SRC_ID;
@@ -416,7 +416,7 @@ static void pnv_phb3_lsi_src_id_write(PnvPHB3 *phb, uint64_t val)
     pnv_phb3_remap_irqs(phb);
 }
 
-static void pnv_phb3_rtc_invalidate(PnvPHB3 *phb, uint64_t val)
+static void pnv_phb3_rtc_invalidate(PnvPHB *phb, uint64_t val)
 {
     PnvPhb3DMASpace *ds;
 
@@ -456,7 +456,7 @@ static void pnv_phb3_update_msi_regions(PnvPhb3DMASpace *ds)
     }
 }
 
-static void pnv_phb3_update_all_msi_regions(PnvPHB3 *phb)
+static void pnv_phb3_update_all_msi_regions(PnvPHB *phb)
 {
     PnvPhb3DMASpace *ds;
 
@@ -467,7 +467,7 @@ static void pnv_phb3_update_all_msi_regions(PnvPHB3 *phb)
 
 void pnv_phb3_reg_write(void *opaque, hwaddr off, uint64_t val, unsigned size)
 {
-    PnvPHB3 *phb = opaque;
+    PnvPHB *phb = opaque;
     bool changed;
 
     /* Special case configuration data */
@@ -589,7 +589,7 @@ void pnv_phb3_reg_write(void *opaque, hwaddr off, uint64_t val, unsigned size)
 
 uint64_t pnv_phb3_reg_read(void *opaque, hwaddr off, unsigned size)
 {
-    PnvPHB3 *phb = opaque;
+    PnvPHB *phb = opaque;
     PCIHostState *pci = PCI_HOST_BRIDGE(phb);
     uint64_t val;
 
@@ -683,7 +683,7 @@ static int pnv_phb3_map_irq(PCIDevice *pci_dev, int irq_num)
 
 static void pnv_phb3_set_irq(void *opaque, int irq_num, int level)
 {
-    PnvPHB3 *phb = opaque;
+    PnvPHB *phb = opaque;
 
     /* LSI only ... */
     if (irq_num > 3) {
@@ -741,7 +741,7 @@ static void pnv_phb3_translate_tve(PnvPhb3DMASpace *ds, hwaddr addr,
     int32_t  lev = GETFIELD(IODA2_TVT_NUM_LEVELS, tve);
     uint32_t tts = GETFIELD(IODA2_TVT_TCE_TABLE_SIZE, tve);
     uint32_t tps = GETFIELD(IODA2_TVT_IO_PSIZE, tve);
-    PnvPHB3 *phb = ds->phb;
+    PnvPHB *phb = ds->phb;
 
     /* Invalid levels */
     if (lev > 4) {
@@ -848,7 +848,7 @@ static IOMMUTLBEntry pnv_phb3_translate_iommu(IOMMUMemoryRegion *iommu,
         .addr_mask = ~(hwaddr)0,
         .perm = IOMMU_NONE,
     };
-    PnvPHB3 *phb = ds->phb;
+    PnvPHB *phb = ds->phb;
 
     /* Resolve PE# */
     if (!pnv_phb3_resolve_pe(ds)) {
@@ -935,7 +935,7 @@ static const MemoryRegionOps pnv_phb3_msi_ops = {
 
 static AddressSpace *pnv_phb3_dma_iommu(PCIBus *bus, void *opaque, int devfn)
 {
-    PnvPHB3 *phb = opaque;
+    PnvPHB *phb = opaque;
     PnvPhb3DMASpace *ds;
 
     QLIST_FOREACH(ds, &phb->v3_dma_spaces, list) {
@@ -968,7 +968,7 @@ static AddressSpace *pnv_phb3_dma_iommu(PCIBus *bus, void *opaque, int devfn)
 
 void pnv_phb3_instance_init(Object *obj)
 {
-    PnvPHB3 *phb = PNV_PHB3(obj);
+    PnvPHB *phb = PNV_PHB(obj);
 
     QLIST_INIT(&phb->v3_dma_spaces);
 
@@ -988,7 +988,7 @@ void pnv_phb3_instance_init(Object *obj)
 
 void pnv_phb3_realize(DeviceState *dev, Error **errp)
 {
-    PnvPHB3 *phb = PNV_PHB3(dev);
+    PnvPHB *phb = PNV_PHB(dev);
     PCIHostState *pci = PCI_HOST_BRIDGE(dev);
     PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
     int i;
@@ -1055,7 +1055,7 @@ void pnv_phb3_realize(DeviceState *dev, Error **errp)
     pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), TYPE_PNV_PHB3_ROOT_PORT);
 }
 
-void pnv_phb3_update_regions(PnvPHB3 *phb)
+void pnv_phb3_update_regions(PnvPHB *phb)
 {
     PnvPBCQState *pbcq = &phb->pbcq;
 
@@ -1077,43 +1077,6 @@ void pnv_phb3_update_regions(PnvPHB3 *phb)
     pnv_phb3_check_all_m64s(phb);
 }
 
-static const char *pnv_phb3_root_bus_path(PCIHostState *host_bridge,
-                                          PCIBus *rootbus)
-{
-    PnvPHB3 *phb = PNV_PHB3(host_bridge);
-
-    snprintf(phb->bus_path, sizeof(phb->bus_path), "00%02x:%02x",
-             phb->chip_id, phb->phb_id);
-    return phb->bus_path;
-}
-
-static Property pnv_phb3_properties[] = {
-        DEFINE_PROP_UINT32("index", PnvPHB3, phb_id, 0),
-        DEFINE_PROP_UINT32("chip-id", PnvPHB3, chip_id, 0),
-        DEFINE_PROP_LINK("chip", PnvPHB3, chip, TYPE_PNV_CHIP, PnvChip *),
-        DEFINE_PROP_END_OF_LIST(),
-};
-
-static void pnv_phb3_class_init(ObjectClass *klass, void *data)
-{
-    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(klass);
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    hc->root_bus_path = pnv_phb3_root_bus_path;
-    dc->realize = pnv_phb3_realize;
-    device_class_set_props(dc, pnv_phb3_properties);
-    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    dc->user_creatable = false;
-}
-
-static const TypeInfo pnv_phb3_type_info = {
-    .name          = TYPE_PNV_PHB3,
-    .parent        = TYPE_PCIE_HOST_BRIDGE,
-    .instance_size = sizeof(PnvPHB3),
-    .class_init    = pnv_phb3_class_init,
-    .instance_init = pnv_phb3_instance_init,
-};
-
 static void pnv_phb3_root_bus_class_init(ObjectClass *klass, void *data)
 {
     BusClass *k = BUS_CLASS(klass);
@@ -1140,15 +1103,15 @@ static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
     PCIDevice *pci = PCI_DEVICE(dev);
     PCIBus *bus = pci_get_bus(pci);
-    PnvPHB3 *phb = NULL;
+    PnvPHB *phb = NULL;
     Error *local_err = NULL;
 
-    phb = (PnvPHB3 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
-                                          TYPE_PNV_PHB3);
+    phb = (PnvPHB *) object_dynamic_cast(OBJECT(bus->qbus.parent),
+                                          TYPE_PNV_PHB);
 
     if (!phb) {
         error_setg(errp,
-"pnv_phb3_root_port devices must be connected to pnv-phb3 buses");
+"pnv_phb3_root_port devices must be connected to pnv-phb buses");
         return;
     }
 
@@ -1195,7 +1158,6 @@ static void pnv_phb3_register_types(void)
 {
     type_register_static(&pnv_phb3_root_bus_info);
     type_register_static(&pnv_phb3_root_port_info);
-    type_register_static(&pnv_phb3_type_info);
     type_register_static(&pnv_phb3_iommu_memory_region_info);
 }
 
diff --git a/hw/pci-host/pnv_phb3_msi.c b/hw/pci-host/pnv_phb3_msi.c
index d8534376f8..84475f8dc1 100644
--- a/hw/pci-host/pnv_phb3_msi.c
+++ b/hw/pci-host/pnv_phb3_msi.c
@@ -18,7 +18,7 @@
 #include "hw/qdev-properties.h"
 #include "sysemu/reset.h"
 
-static uint64_t phb3_msi_ive_addr(PnvPHB3 *phb, int srcno)
+static uint64_t phb3_msi_ive_addr(PnvPHB *phb, int srcno)
 {
     uint64_t ivtbar = phb->regs3[PHB_IVT_BAR >> 3];
     uint64_t phbctl = phb->regs3[PHB_CONTROL >> 3];
@@ -43,7 +43,7 @@ static uint64_t phb3_msi_ive_addr(PnvPHB3 *phb, int srcno)
     }
 }
 
-static bool phb3_msi_read_ive(PnvPHB3 *phb, int srcno, uint64_t *out_ive)
+static bool phb3_msi_read_ive(PnvPHB *phb, int srcno, uint64_t *out_ive)
 {
     uint64_t ive_addr, ive;
 
@@ -281,7 +281,7 @@ static void phb3_msi_instance_init(Object *obj)
     Phb3MsiState *msi = PHB3_MSI(obj);
     ICSState *ics = ICS(obj);
 
-    object_property_add_link(obj, "phb", TYPE_PNV_PHB3,
+    object_property_add_link(obj, "phb", TYPE_PNV_PHB,
                              (Object **)&msi->phb,
                              object_property_allow_set_link,
                              OBJ_PROP_LINK_STRONG);
diff --git a/hw/pci-host/pnv_phb3_pbcq.c b/hw/pci-host/pnv_phb3_pbcq.c
index 82f70efa43..39f02c158f 100644
--- a/hw/pci-host/pnv_phb3_pbcq.c
+++ b/hw/pci-host/pnv_phb3_pbcq.c
@@ -238,7 +238,7 @@ static const MemoryRegionOps pnv_pbcq_spci_xscom_ops = {
 static void pnv_pbcq_default_bars(PnvPBCQState *pbcq)
 {
     uint64_t mm0, mm1, reg;
-    PnvPHB3 *phb = pbcq->phb;
+    PnvPHB *phb = pbcq->phb;
 
     mm0 = 0x3d00000000000ull + 0x4000000000ull * phb->chip_id +
             0x1000000000ull * phb->phb_id;
@@ -258,7 +258,7 @@ static void pnv_pbcq_default_bars(PnvPBCQState *pbcq)
 static void pnv_pbcq_realize(DeviceState *dev, Error **errp)
 {
     PnvPBCQState *pbcq = PNV_PBCQ(dev);
-    PnvPHB3 *phb;
+    PnvPHB *phb;
     char name[32];
 
     assert(pbcq->phb);
@@ -300,7 +300,7 @@ static int pnv_pbcq_dt_xscom(PnvXScomInterface *dev, void *fdt,
                              int xscom_offset)
 {
     const char compat[] = "ibm,power8-pbcq";
-    PnvPHB3 *phb = PNV_PBCQ(dev)->phb;
+    PnvPHB *phb = PNV_PBCQ(dev)->phb;
     char *name;
     int offset;
     uint32_t lpc_pcba = PNV_XSCOM_PBCQ_NEST_BASE + 0x400 * phb->phb_id;
@@ -331,7 +331,7 @@ static void phb3_pbcq_instance_init(Object *obj)
 {
     PnvPBCQState *pbcq = PNV_PBCQ(obj);
 
-    object_property_add_link(obj, "phb", TYPE_PNV_PHB3,
+    object_property_add_link(obj, "phb", TYPE_PNV_PHB,
                              (Object **)&pbcq->phb,
                              object_property_allow_set_link,
                              OBJ_PROP_LINK_STRONG);
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 7c08a78d6c..12a3fe4920 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -655,7 +655,7 @@ static ISABus *pnv_isa_create(PnvChip *chip, Error **errp)
 static int pnv_chip_power8_pic_print_info_child(Object *child, void *opaque)
 {
     Monitor *mon = opaque;
-    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
+    PnvPHB *phb3 = (PnvPHB *) object_dynamic_cast(child, TYPE_PNV_PHB);
 
     if (phb3) {
         pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
@@ -1155,7 +1155,7 @@ static void pnv_chip_power8_instance_init(Object *obj)
     chip8->num_phbs = pcc->num_phbs;
 
     for (i = 0; i < chip8->num_phbs; i++) {
-        object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB3);
+        object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB);
     }
 
 }
@@ -1277,9 +1277,9 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(get_system_memory(), PNV_HOMER_BASE(chip),
                                 &chip8->homer.regs);
 
-    /* PHB3 controllers */
+    /* PHB version 3 controllers */
     for (i = 0; i < chip8->num_phbs; i++) {
-        PnvPHB3 *phb = &chip8->phbs[i];
+        PnvPHB *phb = &chip8->phbs[i];
 
         object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
         object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
@@ -1942,7 +1942,7 @@ typedef struct ForeachPhb3Args {
 static int pnv_ics_get_child(Object *child, void *opaque)
 {
     ForeachPhb3Args *args = opaque;
-    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
+    PnvPHB *phb3 = (PnvPHB *) object_dynamic_cast(child, TYPE_PNV_PHB);
 
     if (phb3) {
         if (ics_valid_irq(&phb3->lsis, args->irq)) {
@@ -1992,7 +1992,7 @@ PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
 
 static int pnv_ics_resend_child(Object *child, void *opaque)
 {
-    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
+    PnvPHB *phb3 = (PnvPHB *) object_dynamic_cast(child, TYPE_PNV_PHB);
 
     if (phb3) {
         ics_resend(&phb3->lsis);
diff --git a/include/hw/pci-host/pnv_phb.h b/include/hw/pci-host/pnv_phb.h
index 2a8bf9a66d..46158e124f 100644
--- a/include/hw/pci-host/pnv_phb.h
+++ b/include/hw/pci-host/pnv_phb.h
@@ -21,14 +21,14 @@
 #define PNV_PHB3_NUM_REGS     (0x1000 >> 3)
 #define PHB3_MAX_MSI     2048
 
-typedef struct PnvPHB3 PnvPHB3;
 typedef struct PnvChip PnvChip;
+typedef struct PnvPHB PnvPHB;
 
 typedef struct Phb3MsiState {
     ICSState ics;
     qemu_irq *qirqs;
 
-    PnvPHB3 *phb;
+    PnvPHB *phb;
     uint64_t rba[PHB3_MAX_MSI / 64];
     uint32_t rba_sum;
 } Phb3MsiState;
@@ -53,7 +53,7 @@ typedef struct PnvPBCQState {
     uint64_t mmio0_size;
     uint64_t mmio1_base;
     uint64_t mmio1_size;
-    PnvPHB3 *phb;
+    PnvPHB *phb;
 
     MemoryRegion xscom_nest_regs;
     MemoryRegion xscom_pci_regs;
@@ -76,7 +76,7 @@ typedef struct PnvPhb3DMASpace {
     uint8_t devfn;
     int pe_num;         /* Cached PE number */
 #define PHB_INVALID_PE (-1)
-    PnvPHB3 *phb;
+    PnvPHB *phb;
     AddressSpace dma_as;
     IOMMUMemoryRegion dma_mr;
     MemoryRegion msi32_mr;
@@ -100,7 +100,6 @@ typedef struct PnvPhb4PecState PnvPhb4PecState;
 /*
  * Unified PHB PCIe Host Bridge for PowerNV machines
  */
-typedef struct PnvPHB PnvPHB;
 #define TYPE_PNV_PHB "pnv-phb"
 OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB, PNV_PHB)
 
diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index aba26f4f7c..1c4af98fee 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -16,7 +16,6 @@
 #include "hw/ppc/xics.h"
 #include "qom/object.h"
 
-typedef struct PnvPHB3 PnvPHB3;
 typedef struct PnvChip PnvChip;
 
 /*
@@ -50,11 +49,6 @@ typedef struct PnvPHB3RootPort {
     PCIESlot parent_obj;
 } PnvPHB3RootPort;
 
-/*
- * PHB3 PCIe Host Bridge for PowerNV machines (POWER8)
- */
-#define TYPE_PNV_PHB3 "pnv-phb3"
-OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB3, PNV_PHB3)
 
 #define PNV_PHB3_NUM_M64      16
 #define PNV_PHB3_NUM_REGS     (0x1000 >> 3)
@@ -63,44 +57,11 @@ OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB3, PNV_PHB3)
 
 #define PCI_MMIO_TOTAL_SIZE   (0x1ull << 60)
 
-struct PnvPHB3 {
-    PCIExpressHost parent_obj;
-
-    uint32_t chip_id;
-    uint32_t phb_id;
-    char bus_path[8];
-
-    uint64_t regs3[PNV_PHB3_NUM_REGS];
-    MemoryRegion mr_regs3;
-
-    MemoryRegion mr_m32;
-    MemoryRegion mr_m64[PNV_PHB3_NUM_M64];
-    MemoryRegion pci_mmio;
-    MemoryRegion pci_io;
-
-    uint64_t ioda2_LIST[8];
-    uint64_t ioda2_LXIVT[8];
-    uint64_t ioda2_TVT[512];
-    uint64_t ioda2_M64BT[16];
-    uint64_t ioda2_MDT[256];
-    uint64_t ioda2_PEEV[4];
-
-    uint32_t total_irq;
-    ICSState lsis;
-    qemu_irq *qirqs;
-    Phb3MsiState msis;
-
-    PnvPBCQState pbcq;
-
-    QLIST_HEAD(, PnvPhb3DMASpace) v3_dma_spaces;
-
-    PnvChip *chip;
-};
 
 uint64_t pnv_phb3_reg_read(void *opaque, hwaddr off, unsigned size);
 void pnv_phb3_reg_write(void *opaque, hwaddr off, uint64_t val, unsigned size);
-void pnv_phb3_update_regions(PnvPHB3 *phb);
-void pnv_phb3_remap_irqs(PnvPHB3 *phb);
+void pnv_phb3_update_regions(PnvPHB *phb);
+void pnv_phb3_remap_irqs(PnvPHB *phb);
 
 void pnv_phb3_instance_init(Object *obj);
 void pnv_phb3_realize(DeviceState *dev, Error **errp);
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 86cb7d7f97..539454fe9d 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -80,7 +80,7 @@ struct Pnv8Chip {
     PnvHomer     homer;
 
 #define PNV8_CHIP_PHB3_MAX 4
-    PnvPHB3      phbs[PNV8_CHIP_PHB3_MAX];
+    PnvPHB       phbs[PNV8_CHIP_PHB3_MAX];
     uint32_t     num_phbs;
 
     XICSFabric    *xics;
-- 
2.32.0


