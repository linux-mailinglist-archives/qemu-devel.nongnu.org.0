Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F3F2DEE36
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 11:46:08 +0100 (CET)
Received: from localhost ([::1]:54738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqZkV-0007vw-3n
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 05:46:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kqZhO-0003eO-SE; Sat, 19 Dec 2020 05:42:54 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39290
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kqZhM-00034N-Q2; Sat, 19 Dec 2020 05:42:54 -0500
Received: from host86-191-183-22.range86-191.btcentralplus.com
 ([86.191.183.22] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kqZhD-0004BS-Am; Sat, 19 Dec 2020 10:42:48 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au,
 thuth@redhat.com
Date: Sat, 19 Dec 2020 10:42:25 +0000
Message-Id: <20201219104229.1964-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201219104229.1964-1-mark.cave-ayland@ilande.co.uk>
References: <20201219104229.1964-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.191.183.22
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 3/7] macio: move heathrow PIC inside macio-oldworld device
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/macio/macio.c         | 20 +++++------
 hw/ppc/mac_oldworld.c         | 66 +++++++++++++++++------------------
 include/hw/misc/macio/macio.h |  2 +-
 3 files changed, 43 insertions(+), 45 deletions(-)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index bb601f782c..cfb87da6c9 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -140,7 +140,7 @@ static void macio_oldworld_realize(PCIDevice *d, Error **errp)
 {
     MacIOState *s = MACIO(d);
     OldWorldMacIOState *os = OLDWORLD_MACIO(d);
-    DeviceState *pic_dev = DEVICE(os->pic);
+    DeviceState *pic_dev = DEVICE(&os->pic);
     Error *err = NULL;
     SysBusDevice *sysbus_dev;
 
@@ -150,6 +150,14 @@ static void macio_oldworld_realize(PCIDevice *d, Error **errp)
         return;
     }
 
+    /* Heathrow PIC */
+    if (!qdev_realize(DEVICE(&os->pic), BUS(&s->macio_bus), errp)) {
+        return;
+    }
+    sysbus_dev = SYS_BUS_DEVICE(&os->pic);
+    memory_region_add_subregion(&s->bar, 0x0,
+                                sysbus_mmio_get_region(sysbus_dev, 0));
+
     qdev_prop_set_uint64(DEVICE(&s->cuda), "timebase-frequency",
                          s->frequency);
     if (!qdev_realize(DEVICE(&s->cuda), BUS(&s->macio_bus), errp)) {
@@ -175,11 +183,6 @@ static void macio_oldworld_realize(PCIDevice *d, Error **errp)
                                 sysbus_mmio_get_region(sysbus_dev, 0));
     pmac_format_nvram_partition(&os->nvram, os->nvram.size);
 
-    /* Heathrow PIC */
-    sysbus_dev = SYS_BUS_DEVICE(os->pic);
-    memory_region_add_subregion(&s->bar, 0x0,
-                                sysbus_mmio_get_region(sysbus_dev, 0));
-
     /* IDE buses */
     macio_realize_ide(s, &os->ide[0],
                       qdev_get_gpio_in(pic_dev, OLDWORLD_IDE0_IRQ),
@@ -218,10 +221,7 @@ static void macio_oldworld_init(Object *obj)
     DeviceState *dev;
     int i;
 
-    object_property_add_link(obj, "pic", TYPE_HEATHROW,
-                             (Object **) &os->pic,
-                             qdev_prop_allow_set_link_before_realize,
-                             0);
+    object_initialize_child(OBJECT(s), "pic", &os->pic, TYPE_HEATHROW);
 
     object_initialize_child(OBJECT(s), "cuda", &s->cuda, TYPE_CUDA);
 
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index e58e0525fe..44ee99be88 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -98,7 +98,7 @@ static void ppc_heathrow_init(MachineState *machine)
     MACIOIDEState *macio_ide;
     ESCCState *escc;
     SysBusDevice *s;
-    DeviceState *dev, *pic_dev;
+    DeviceState *dev, *pic_dev, *grackle_dev;
     BusState *adb_bus;
     uint64_t bios_addr;
     int bios_size;
@@ -227,10 +227,17 @@ static void ppc_heathrow_init(MachineState *machine)
         }
     }
 
+    /* Timebase Frequency */
+    if (kvm_enabled()) {
+        tbfreq = kvmppc_get_tbfreq();
+    } else {
+        tbfreq = TBFREQ;
+    }
+
     /* Grackle PCI host bridge */
-    dev = qdev_new(TYPE_GRACKLE_PCI_HOST_BRIDGE);
-    qdev_prop_set_uint32(dev, "ofw-addr", 0x80000000);
-    s = SYS_BUS_DEVICE(dev);
+    grackle_dev = qdev_new(TYPE_GRACKLE_PCI_HOST_BRIDGE);
+    qdev_prop_set_uint32(grackle_dev, "ofw-addr", 0x80000000);
+    s = SYS_BUS_DEVICE(grackle_dev);
     sysbus_realize_and_unref(s, &error_fatal);
 
     sysbus_mmio_map(s, 0, GRACKLE_BASE);
@@ -242,14 +249,30 @@ static void ppc_heathrow_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), 0xfe000000,
                                 sysbus_mmio_get_region(s, 3));
 
-    /* XXX: we register only 1 output pin for heathrow PIC */
-    pic_dev = qdev_new(TYPE_HEATHROW);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(pic_dev), &error_fatal);
+    pci_bus = PCI_HOST_BRIDGE(grackle_dev)->bus;
+
+    /* MacIO */
+    macio = pci_new(PCI_DEVFN(16, 0), TYPE_OLDWORLD_MACIO);
+    dev = DEVICE(macio);
+    qdev_prop_set_uint64(dev, "frequency", tbfreq);
+
+    escc = ESCC(object_resolve_path_component(OBJECT(macio), "escc"));
+    qdev_prop_set_chr(DEVICE(escc), "chrA", serial_hd(0));
+    qdev_prop_set_chr(DEVICE(escc), "chrB", serial_hd(1));
+
+    pci_realize_and_unref(macio, pci_bus, &error_fatal);
+
+    pic_dev = DEVICE(object_resolve_path_component(OBJECT(macio), "pic"));
+    for (i = 0; i < 4; i++) {
+        qdev_connect_gpio_out(grackle_dev, i,
+                              qdev_get_gpio_in(pic_dev, 0x15 + i));
+    }
 
     /* Connect the heathrow PIC outputs to the 6xx bus */
     for (i = 0; i < smp_cpus; i++) {
         switch (PPC_INPUT(env)) {
         case PPC_FLAGS_INPUT_6xx:
+            /* XXX: we register only 1 output pin for heathrow PIC */
             qdev_connect_gpio_out(pic_dev, 0,
                 ((qemu_irq *)env->irq_inputs)[PPC6xx_INPUT_INT]);
             break;
@@ -259,40 +282,14 @@ static void ppc_heathrow_init(MachineState *machine)
         }
     }
 
-    /* Timebase Frequency */
-    if (kvm_enabled()) {
-        tbfreq = kvmppc_get_tbfreq();
-    } else {
-        tbfreq = TBFREQ;
-    }
-
-    for (i = 0; i < 4; i++) {
-        qdev_connect_gpio_out(dev, i, qdev_get_gpio_in(pic_dev, 0x15 + i));
-    }
-
-    pci_bus = PCI_HOST_BRIDGE(dev)->bus;
-
     pci_vga_init(pci_bus);
 
     for (i = 0; i < nb_nics; i++) {
         pci_nic_init_nofail(&nd_table[i], pci_bus, "ne2k_pci", NULL);
     }
 
+    /* MacIO IDE */
     ide_drive_get(hd, ARRAY_SIZE(hd));
-
-    /* MacIO */
-    macio = pci_new(PCI_DEVFN(16, 0), TYPE_OLDWORLD_MACIO);
-    dev = DEVICE(macio);
-    qdev_prop_set_uint64(dev, "frequency", tbfreq);
-    object_property_set_link(OBJECT(macio), "pic", OBJECT(pic_dev),
-                             &error_abort);
-
-    escc = ESCC(object_resolve_path_component(OBJECT(macio), "escc"));
-    qdev_prop_set_chr(DEVICE(escc), "chrA", serial_hd(0));
-    qdev_prop_set_chr(DEVICE(escc), "chrB", serial_hd(1));
-
-    pci_realize_and_unref(macio, pci_bus, &error_fatal);
-
     macio_ide = MACIO_IDE(object_resolve_path_component(OBJECT(macio),
                                                         "ide[0]"));
     macio_ide_init_drives(macio_ide, hd);
@@ -301,6 +298,7 @@ static void ppc_heathrow_init(MachineState *machine)
                                                         "ide[1]"));
     macio_ide_init_drives(macio_ide, &hd[MAX_IDE_DEVS]);
 
+    /* MacIO CUDA/ADB */
     dev = DEVICE(object_resolve_path_component(OBJECT(macio), "cuda"));
     adb_bus = qdev_get_child_bus(dev, "adb.0");
     dev = qdev_new(TYPE_ADB_KEYBOARD);
diff --git a/include/hw/misc/macio/macio.h b/include/hw/misc/macio/macio.h
index 22b4e64b2c..707dfab50c 100644
--- a/include/hw/misc/macio/macio.h
+++ b/include/hw/misc/macio/macio.h
@@ -99,7 +99,7 @@ struct OldWorldMacIOState {
     MacIOState parent_obj;
     /*< public >*/
 
-    HeathrowState *pic;
+    HeathrowState pic;
 
     MacIONVRAMState nvram;
     MACIOIDEState ide[2];
-- 
2.20.1


