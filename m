Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE0228C97F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 09:40:10 +0200 (CEST)
Received: from localhost ([::1]:43158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSEun-0003MM-Kk
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 03:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kSErj-0000L4-0U; Tue, 13 Oct 2020 03:36:59 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51180
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kSErh-0005d1-3D; Tue, 13 Oct 2020 03:36:58 -0400
Received: from host86-158-109-18.range86-158.btcentralplus.com
 ([86.158.109.18] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kSErd-0003Eo-WE; Tue, 13 Oct 2020 08:36:58 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au,
 f4bug@amsat.org
Date: Tue, 13 Oct 2020 08:36:35 +0100
Message-Id: <20201013073636.31389-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201013073636.31389-1-mark.cave-ayland@ilande.co.uk>
References: <20201013073636.31389-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.158.109.18
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 2/3] grackle: use qdev gpios for PCI IRQs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

Currently an object link property is used to pass a reference to the Heathrow
PIC into the PCI host bridge so that grackle_init_irqs() can connect the PCI
IRQs to the PIC itself.

This can be simplified by defining the PCI IRQs as qdev gpios and then wiring
up the PCI IRQs to the PIC in the Old World machine init function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/pci-host/grackle.c | 18 ++----------------
 hw/ppc/mac_oldworld.c |  7 +++++--
 2 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
index 57c29b20af..00804084f9 100644
--- a/hw/pci-host/grackle.c
+++ b/hw/pci-host/grackle.c
@@ -41,7 +41,6 @@ struct GrackleState {
     PCIHostState parent_obj;
 
     uint32_t ofw_addr;
-    HeathrowState *pic;
     qemu_irq irqs[4];
     MemoryRegion pci_mmio;
     MemoryRegion pci_hole;
@@ -62,15 +61,6 @@ static void pci_grackle_set_irq(void *opaque, int irq_num, int level)
     qemu_set_irq(s->irqs[irq_num], level);
 }
 
-static void grackle_init_irqs(GrackleState *s)
-{
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(s->irqs); i++) {
-        s->irqs[i] = qdev_get_gpio_in(DEVICE(s->pic), 0x15 + i);
-    }
-}
-
 static void grackle_realize(DeviceState *dev, Error **errp)
 {
     GrackleState *s = GRACKLE_PCI_HOST_BRIDGE(dev);
@@ -85,7 +75,6 @@ static void grackle_realize(DeviceState *dev, Error **errp)
                                      0, 4, TYPE_PCI_BUS);
 
     pci_create_simple(phb->bus, 0, "grackle");
-    grackle_init_irqs(s);
 }
 
 static void grackle_init(Object *obj)
@@ -106,15 +95,12 @@ static void grackle_init(Object *obj)
     memory_region_init_io(&phb->data_mem, obj, &pci_host_data_le_ops,
                           DEVICE(obj), "pci-data-idx", 0x1000);
 
-    object_property_add_link(obj, "pic", TYPE_HEATHROW,
-                             (Object **) &s->pic,
-                             qdev_prop_allow_set_link_before_realize,
-                             0);
-
     sysbus_init_mmio(sbd, &phb->conf_mem);
     sysbus_init_mmio(sbd, &phb->data_mem);
     sysbus_init_mmio(sbd, &s->pci_hole);
     sysbus_init_mmio(sbd, &s->pci_io);
+
+    qdev_init_gpio_out(DEVICE(obj), s->irqs, ARRAY_SIZE(s->irqs));
 }
 
 static void grackle_pci_realize(PCIDevice *d, Error **errp)
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index d6a76d06dc..05e46ee6fe 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -253,10 +253,9 @@ static void ppc_heathrow_init(MachineState *machine)
     /* Grackle PCI host bridge */
     dev = qdev_new(TYPE_GRACKLE_PCI_HOST_BRIDGE);
     qdev_prop_set_uint32(dev, "ofw-addr", 0x80000000);
-    object_property_set_link(OBJECT(dev), "pic", OBJECT(pic_dev),
-                             &error_abort);
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
+
     sysbus_mmio_map(s, 0, GRACKLE_BASE);
     sysbus_mmio_map(s, 1, GRACKLE_BASE + 0x200000);
     /* PCI hole */
@@ -266,6 +265,10 @@ static void ppc_heathrow_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), 0xfe000000,
                                 sysbus_mmio_get_region(s, 3));
 
+    for (i = 0; i < 4; i++) {
+        qdev_connect_gpio_out(dev, i, qdev_get_gpio_in(pic_dev, 0x15 + i));
+    }
+
     pci_bus = PCI_HOST_BRIDGE(dev)->bus;
 
     pci_vga_init(pci_bus);
-- 
2.20.1


