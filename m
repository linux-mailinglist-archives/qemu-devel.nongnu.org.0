Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E1142E609
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 03:18:39 +0200 (CEST)
Received: from localhost ([::1]:56418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbBrq-0002nt-UF
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 21:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mbBqP-0000n3-Gh
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 21:17:13 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:56132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mbBqH-0006aF-DV
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 21:17:09 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4828A756066;
 Fri, 15 Oct 2021 03:16:58 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BD3DE748F56; Fri, 15 Oct 2021 03:16:57 +0200 (CEST)
Message-Id: <7cb7a16ff4daf8f48d576246255bea1fd355207c.1634259980.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1634259980.git.balaton@eik.bme.hu>
References: <cover.1634259980.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 1/4] vt82c686: Move common code to via_isa_realize
Date: Fri, 15 Oct 2021 03:06:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe M-D <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vt82c686b_realize and vt8231_realize methods are almost identical,
factor out the common parts to a via_isa_realize function to avoid
code duplication.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/vt82c686.c | 67 ++++++++++++++++++++---------------------------
 1 file changed, 29 insertions(+), 38 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index f57f3e7067..5b41539f2c 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -542,6 +542,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(ViaISAState, VIA_ISA)
 struct ViaISAState {
     PCIDevice dev;
     qemu_irq cpu_intr;
+    ISABus *isa_bus;
     ViaSuperIOState *via_sio;
 };
 
@@ -572,6 +573,29 @@ static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
     qemu_set_irq(s->cpu_intr, level);
 }
 
+static void via_isa_realize(PCIDevice *d, Error **errp)
+{
+    ViaISAState *s = VIA_ISA(d);
+    DeviceState *dev = DEVICE(d);
+    qemu_irq *isa_irq;
+    int i;
+
+    qdev_init_gpio_out(dev, &s->cpu_intr, 1);
+    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
+    s->isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
+                          &error_fatal);
+    isa_bus_irqs(s->isa_bus, i8259_init(s->isa_bus, *isa_irq));
+    i8254_pit_init(s->isa_bus, 0x40, 0, NULL);
+    i8257_dma_init(s->isa_bus, 0);
+    mc146818_rtc_init(s->isa_bus, 2000, NULL);
+
+    for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
+        if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
+            d->wmask[i] = 0;
+        }
+    }
+}
+
 /* TYPE_VT82C686B_ISA */
 
 static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
@@ -610,27 +634,10 @@ static void vt82c686b_isa_reset(DeviceState *dev)
 static void vt82c686b_realize(PCIDevice *d, Error **errp)
 {
     ViaISAState *s = VIA_ISA(d);
-    DeviceState *dev = DEVICE(d);
-    ISABus *isa_bus;
-    qemu_irq *isa_irq;
-    int i;
 
-    qdev_init_gpio_out(dev, &s->cpu_intr, 1);
-    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
-    isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
-                          &error_fatal);
-    isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
-    i8254_pit_init(isa_bus, 0x40, 0, NULL);
-    i8257_dma_init(isa_bus, 0);
-    s->via_sio = VIA_SUPERIO(isa_create_simple(isa_bus,
+    via_isa_realize(d, errp);
+    s->via_sio = VIA_SUPERIO(isa_create_simple(s->isa_bus,
                                                TYPE_VT82C686B_SUPERIO));
-    mc146818_rtc_init(isa_bus, 2000, NULL);
-
-    for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
-        if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
-            d->wmask[i] = 0;
-        }
-    }
 }
 
 static void vt82c686b_class_init(ObjectClass *klass, void *data)
@@ -691,26 +698,10 @@ static void vt8231_isa_reset(DeviceState *dev)
 static void vt8231_realize(PCIDevice *d, Error **errp)
 {
     ViaISAState *s = VIA_ISA(d);
-    DeviceState *dev = DEVICE(d);
-    ISABus *isa_bus;
-    qemu_irq *isa_irq;
-    int i;
-
-    qdev_init_gpio_out(dev, &s->cpu_intr, 1);
-    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
-    isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
-                          &error_fatal);
-    isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
-    i8254_pit_init(isa_bus, 0x40, 0, NULL);
-    i8257_dma_init(isa_bus, 0);
-    s->via_sio = VIA_SUPERIO(isa_create_simple(isa_bus, TYPE_VT8231_SUPERIO));
-    mc146818_rtc_init(isa_bus, 2000, NULL);
 
-    for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
-        if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
-            d->wmask[i] = 0;
-        }
-    }
+    via_isa_realize(d, errp);
+    s->via_sio = VIA_SUPERIO(isa_create_simple(s->isa_bus,
+                                               TYPE_VT8231_SUPERIO));
 }
 
 static void vt8231_class_init(ObjectClass *klass, void *data)
-- 
2.21.4


