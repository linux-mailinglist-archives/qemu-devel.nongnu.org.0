Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D972E86F6
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 12:16:40 +0100 (CET)
Received: from localhost ([::1]:49240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvetj-0002RS-AG
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 06:16:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kveqn-0000eK-92
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 06:13:37 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:56421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kveqj-00073S-EO
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 06:13:36 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6BF2274763D;
 Sat,  2 Jan 2021 12:13:30 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DB2E97470E2; Sat,  2 Jan 2021 12:13:29 +0100 (CET)
Message-Id: <78db2ced4b41a8a775dbc6c97a90db683952c2cb.1609584216.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609584215.git.balaton@eik.bme.hu>
References: <cover.1609584215.git.balaton@eik.bme.hu>
Subject: [PATCH 03/24] vt82c686b: Rename VT82C686B to VT82C686B_ISA
Date: Sat, 02 Jan 2021 11:43:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


