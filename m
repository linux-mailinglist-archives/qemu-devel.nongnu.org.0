Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9923156DC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:36:01 +0100 (CET)
Received: from localhost ([::1]:54344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Yno-000781-AS
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yit-0003r0-1a
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:30:55 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56758
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yik-000224-Gs
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:30:54 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yj1-0007pt-U5; Tue, 09 Feb 2021 19:31:08 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Tue,  9 Feb 2021 19:29:39 +0000
Message-Id: <20210209193018.31339-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 03/42] esp: QOMify the internal ESP device state
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Make this new QOM device state a child device of both the sysbus-esp and esp-pci
implementations.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp-pci.c     | 48 +++++++++++++++++++++++++++++++------------
 hw/scsi/esp.c         | 45 +++++++++++++++++++++++++++++++++-------
 include/hw/scsi/esp.h |  5 +++++
 3 files changed, 78 insertions(+), 20 deletions(-)

diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index 2ce96dc56e..ccf73bb901 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -79,8 +79,10 @@ struct PCIESPState {
 
 static void esp_pci_handle_idle(PCIESPState *pci, uint32_t val)
 {
+    ESPState *s = ESP(&pci->esp);
+
     trace_esp_pci_dma_idle(val);
-    esp_dma_enable(&pci->esp, 0, 0);
+    esp_dma_enable(s, 0, 0);
 }
 
 static void esp_pci_handle_blast(PCIESPState *pci, uint32_t val)
@@ -91,14 +93,18 @@ static void esp_pci_handle_blast(PCIESPState *pci, uint32_t val)
 
 static void esp_pci_handle_abort(PCIESPState *pci, uint32_t val)
 {
+    ESPState *s = ESP(&pci->esp);
+
     trace_esp_pci_dma_abort(val);
-    if (pci->esp.current_req) {
-        scsi_req_cancel(pci->esp.current_req);
+    if (s->current_req) {
+        scsi_req_cancel(s->current_req);
     }
 }
 
 static void esp_pci_handle_start(PCIESPState *pci, uint32_t val)
 {
+    ESPState *s = ESP(&pci->esp);
+
     trace_esp_pci_dma_start(val);
 
     pci->dma_regs[DMA_WBC] = pci->dma_regs[DMA_STC];
@@ -109,7 +115,7 @@ static void esp_pci_handle_start(PCIESPState *pci, uint32_t val)
                                | DMA_STAT_DONE | DMA_STAT_ABORT
                                | DMA_STAT_ERROR | DMA_STAT_PWDN);
 
-    esp_dma_enable(&pci->esp, 0, 1);
+    esp_dma_enable(s, 0, 1);
 }
 
 static void esp_pci_dma_write(PCIESPState *pci, uint32_t saddr, uint32_t val)
@@ -155,11 +161,12 @@ static void esp_pci_dma_write(PCIESPState *pci, uint32_t saddr, uint32_t val)
 
 static uint32_t esp_pci_dma_read(PCIESPState *pci, uint32_t saddr)
 {
+    ESPState *s = ESP(&pci->esp);
     uint32_t val;
 
     val = pci->dma_regs[saddr];
     if (saddr == DMA_STAT) {
-        if (pci->esp.rregs[ESP_RSTAT] & STAT_INT) {
+        if (s->rregs[ESP_RSTAT] & STAT_INT) {
             val |= DMA_STAT_SCSIINT;
         }
         if (!(pci->sbac & SBAC_STATUS)) {
@@ -176,6 +183,7 @@ static void esp_pci_io_write(void *opaque, hwaddr addr,
                              uint64_t val, unsigned int size)
 {
     PCIESPState *pci = opaque;
+    ESPState *s = ESP(&pci->esp);
 
     if (size < 4 || addr & 3) {
         /* need to upgrade request: we only support 4-bytes accesses */
@@ -183,7 +191,7 @@ static void esp_pci_io_write(void *opaque, hwaddr addr,
         int shift;
 
         if (addr < 0x40) {
-            current = pci->esp.wregs[addr >> 2];
+            current = s->wregs[addr >> 2];
         } else if (addr < 0x60) {
             current = pci->dma_regs[(addr - 0x40) >> 2];
         } else if (addr < 0x74) {
@@ -203,7 +211,7 @@ static void esp_pci_io_write(void *opaque, hwaddr addr,
 
     if (addr < 0x40) {
         /* SCSI core reg */
-        esp_reg_write(&pci->esp, addr >> 2, val);
+        esp_reg_write(s, addr >> 2, val);
     } else if (addr < 0x60) {
         /* PCI DMA CCB */
         esp_pci_dma_write(pci, (addr - 0x40) >> 2, val);
@@ -220,11 +228,12 @@ static uint64_t esp_pci_io_read(void *opaque, hwaddr addr,
                                 unsigned int size)
 {
     PCIESPState *pci = opaque;
+    ESPState *s = ESP(&pci->esp);
     uint32_t ret;
 
     if (addr < 0x40) {
         /* SCSI core reg */
-        ret = esp_reg_read(&pci->esp, addr >> 2);
+        ret = esp_reg_read(s, addr >> 2);
     } else if (addr < 0x60) {
         /* PCI DMA CCB */
         ret = esp_pci_dma_read(pci, (addr - 0x40) >> 2);
@@ -306,7 +315,9 @@ static const MemoryRegionOps esp_pci_io_ops = {
 static void esp_pci_hard_reset(DeviceState *dev)
 {
     PCIESPState *pci = PCI_ESP(dev);
-    esp_hard_reset(&pci->esp);
+    ESPState *s = ESP(&pci->esp);
+
+    esp_hard_reset(s);
     pci->dma_regs[DMA_CMD] &= ~(DMA_CMD_DIR | DMA_CMD_INTE_D | DMA_CMD_INTE_P
                               | DMA_CMD_MDL | DMA_CMD_DIAG | DMA_CMD_MASK);
     pci->dma_regs[DMA_WBC] &= ~0xffff;
@@ -354,9 +365,11 @@ static void esp_pci_scsi_realize(PCIDevice *dev, Error **errp)
 {
     PCIESPState *pci = PCI_ESP(dev);
     DeviceState *d = DEVICE(dev);
-    ESPState *s = &pci->esp;
+    ESPState *s = ESP(&pci->esp);
     uint8_t *pci_conf;
 
+    qdev_realize(DEVICE(s), NULL, errp);
+
     pci_conf = dev->config;
 
     /* Interrupt pin A */
@@ -375,11 +388,19 @@ static void esp_pci_scsi_realize(PCIDevice *dev, Error **errp)
     scsi_bus_new(&s->bus, sizeof(s->bus), d, &esp_pci_scsi_info, NULL);
 }
 
-static void esp_pci_scsi_uninit(PCIDevice *d)
+static void esp_pci_scsi_exit(PCIDevice *d)
 {
     PCIESPState *pci = PCI_ESP(d);
+    ESPState *s = ESP(&pci->esp);
+
+    qemu_free_irq(s->irq);
+}
+
+static void esp_pci_init(Object *obj)
+{
+    PCIESPState *pci = PCI_ESP(obj);
 
-    qemu_free_irq(pci->esp.irq);
+    object_initialize_child(obj, "esp", &pci->esp, TYPE_ESP);
 }
 
 static void esp_pci_class_init(ObjectClass *klass, void *data)
@@ -388,7 +409,7 @@ static void esp_pci_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     k->realize = esp_pci_scsi_realize;
-    k->exit = esp_pci_scsi_uninit;
+    k->exit = esp_pci_scsi_exit;
     k->vendor_id = PCI_VENDOR_ID_AMD;
     k->device_id = PCI_DEVICE_ID_AMD_SCSI;
     k->revision = 0x10;
@@ -402,6 +423,7 @@ static void esp_pci_class_init(ObjectClass *klass, void *data)
 static const TypeInfo esp_pci_info = {
     .name = TYPE_AM53C974_DEVICE,
     .parent = TYPE_PCI_DEVICE,
+    .instance_init = esp_pci_init,
     .instance_size = sizeof(PCIESPState),
     .class_init = esp_pci_class_init,
     .interfaces = (InterfaceInfo[]) {
diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index aa38acc660..1635f86622 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -828,20 +828,22 @@ static void sysbus_esp_mem_write(void *opaque, hwaddr addr,
                                  uint64_t val, unsigned int size)
 {
     SysBusESPState *sysbus = opaque;
+    ESPState *s = ESP(&sysbus->esp);
     uint32_t saddr;
 
     saddr = addr >> sysbus->it_shift;
-    esp_reg_write(&sysbus->esp, saddr, val);
+    esp_reg_write(s, saddr, val);
 }
 
 static uint64_t sysbus_esp_mem_read(void *opaque, hwaddr addr,
                                     unsigned int size)
 {
     SysBusESPState *sysbus = opaque;
+    ESPState *s = ESP(&sysbus->esp);
     uint32_t saddr;
 
     saddr = addr >> sysbus->it_shift;
-    return esp_reg_read(&sysbus->esp, saddr);
+    return esp_reg_read(s, saddr);
 }
 
 static const MemoryRegionOps sysbus_esp_mem_ops = {
@@ -855,7 +857,7 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
                                   uint64_t val, unsigned int size)
 {
     SysBusESPState *sysbus = opaque;
-    ESPState *s = &sysbus->esp;
+    ESPState *s = ESP(&sysbus->esp);
     uint32_t dmalen;
     uint8_t *buf = get_pdma_buf(s);
 
@@ -892,7 +894,7 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
                                      unsigned int size)
 {
     SysBusESPState *sysbus = opaque;
-    ESPState *s = &sysbus->esp;
+    ESPState *s = ESP(&sysbus->esp);
     uint8_t *buf = get_pdma_buf(s);
     uint64_t val = 0;
 
@@ -940,7 +942,7 @@ static const struct SCSIBusInfo esp_scsi_info = {
 static void sysbus_esp_gpio_demux(void *opaque, int irq, int level)
 {
     SysBusESPState *sysbus = SYSBUS_ESP(opaque);
-    ESPState *s = &sysbus->esp;
+    ESPState *s = ESP(&sysbus->esp);
 
     switch (irq) {
     case 0:
@@ -956,7 +958,9 @@ static void sysbus_esp_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     SysBusESPState *sysbus = SYSBUS_ESP(dev);
-    ESPState *s = &sysbus->esp;
+    ESPState *s = ESP(&sysbus->esp);
+
+    qdev_realize(DEVICE(s), NULL, errp);
 
     sysbus_init_irq(sbd, &s->irq);
     sysbus_init_irq(sbd, &s->irq_data);
@@ -978,7 +982,16 @@ static void sysbus_esp_realize(DeviceState *dev, Error **errp)
 static void sysbus_esp_hard_reset(DeviceState *dev)
 {
     SysBusESPState *sysbus = SYSBUS_ESP(dev);
-    esp_hard_reset(&sysbus->esp);
+    ESPState *s = ESP(&sysbus->esp);
+
+    esp_hard_reset(s);
+}
+
+static void sysbus_esp_init(Object *obj)
+{
+    SysBusESPState *sysbus = SYSBUS_ESP(obj);
+
+    object_initialize_child(obj, "esp", &sysbus->esp, TYPE_ESP);
 }
 
 static const VMStateDescription vmstate_sysbus_esp_scsi = {
@@ -1004,13 +1017,31 @@ static void sysbus_esp_class_init(ObjectClass *klass, void *data)
 static const TypeInfo sysbus_esp_info = {
     .name          = TYPE_SYSBUS_ESP,
     .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = sysbus_esp_init,
     .instance_size = sizeof(SysBusESPState),
     .class_init    = sysbus_esp_class_init,
 };
 
+static void esp_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    /* internal device for sysbusesp/pciespscsi, not user-creatable */
+    dc->user_creatable = false;
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+}
+
+static const TypeInfo esp_info = {
+    .name = TYPE_ESP,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(ESPState),
+    .class_init = esp_class_init,
+};
+
 static void esp_register_types(void)
 {
     type_register_static(&sysbus_esp_info);
+    type_register_static(&esp_info);
 }
 
 type_init(esp_register_types)
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index 9694825e71..11c799d91e 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -22,7 +22,12 @@ enum pdma_origin_id {
     ASYNC,
 };
 
+#define TYPE_ESP "esp"
+OBJECT_DECLARE_SIMPLE_TYPE(ESPState, ESP)
+
 struct ESPState {
+    DeviceState parent_obj;
+
     uint8_t rregs[ESP_REGS];
     uint8_t wregs[ESP_REGS];
     qemu_irq irq;
-- 
2.20.1


