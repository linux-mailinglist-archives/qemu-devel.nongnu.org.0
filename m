Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B0F2E3396
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 03:27:37 +0100 (CET)
Received: from localhost ([::1]:44682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktiG0-0000p9-7F
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 21:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktiD1-0007SU-8d
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 21:24:31 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:57209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktiCx-0003v8-7J
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 21:24:31 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C5C367470F3;
 Mon, 28 Dec 2020 03:24:23 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 433277470E3; Mon, 28 Dec 2020 03:24:23 +0100 (CET)
Message-Id: <ede62ad54154ca9b33badc1476ee95e016cf8e72.1609121293.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609121293.git.balaton@eik.bme.hu>
References: <cover.1609121293.git.balaton@eik.bme.hu>
Subject: [PATCH v2 03/10] vt82c686b: Rename VT82C686B to VT82C686B_ISA
Date: Mon, 28 Dec 2020 03:08:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
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
Cc: Huacai Chen <chenhuacai@kernel.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

This is really the ISA bridge part so name the type accordingly.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/vt82c686.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 1be1169f83..d40599c7da 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -43,14 +43,14 @@ typedef struct SuperIOConfig {
     uint8_t data;
 } SuperIOConfig;
 
-struct VT82C686BState {
+struct VT82C686BISAState {
     PCIDevice dev;
     MemoryRegion superio;
     SuperIOConfig superio_conf;
 };
 
-#define TYPE_VT82C686B "VT82C686B"
-OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BState, VT82C686B)
+#define TYPE_VT82C686B_ISA "vt82c686b-isa"
+OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
 
 static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
                                   unsigned size)
@@ -117,7 +117,7 @@ static const MemoryRegionOps superio_ops = {
 
 static void vt82c686b_isa_reset(DeviceState *dev)
 {
-    VT82C686BState *vt82c = VT82C686B(dev);
+    VT82C686BISAState *vt82c = VT82C686B_ISA(dev);
     uint8_t *pci_conf = vt82c->dev.config;
 
     pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
@@ -146,7 +146,7 @@ static void vt82c686b_isa_reset(DeviceState *dev)
 static void vt82c686b_write_config(PCIDevice *d, uint32_t address,
                                    uint32_t val, int len)
 {
-    VT82C686BState *vt686 = VT82C686B(d);
+    VT82C686BISAState *vt686 = VT82C686B_ISA(d);
 
     DPRINTF("vt82c686b_write_config  address 0x%x  val 0x%x len 0x%x\n",
            address, val, len);
@@ -434,7 +434,7 @@ static const VMStateDescription vmstate_via = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_PCI_DEVICE(dev, VT82C686BState),
+        VMSTATE_PCI_DEVICE(dev, VT82C686BISAState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -442,7 +442,7 @@ static const VMStateDescription vmstate_via = {
 /* init the PCI-to-ISA bridge */
 static void vt82c686b_realize(PCIDevice *d, Error **errp)
 {
-    VT82C686BState *vt82c = VT82C686B(d);
+    VT82C686BISAState *vt82c = VT82C686B_ISA(d);
     uint8_t *pci_conf;
     ISABus *isa_bus;
     uint8_t *wmask;
@@ -479,7 +479,7 @@ ISABus *vt82c686b_isa_init(PCIBus *bus, int devfn)
 {
     PCIDevice *d;
 
-    d = pci_create_simple_multifunction(bus, devfn, true, TYPE_VT82C686B);
+    d = pci_create_simple_multifunction(bus, devfn, true, TYPE_VT82C686B_ISA);
     return ISA_BUS(qdev_get_child_bus(DEVICE(d), "isa.0"));
 }
 
@@ -505,9 +505,9 @@ static void via_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo via_info = {
-    .name          = TYPE_VT82C686B,
+    .name          = TYPE_VT82C686B_ISA,
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VT82C686BState),
+    .instance_size = sizeof(VT82C686BISAState),
     .class_init    = via_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-- 
2.21.3


