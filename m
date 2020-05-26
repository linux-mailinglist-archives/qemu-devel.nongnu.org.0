Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 339A21D9AD1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 17:11:19 +0200 (CEST)
Received: from localhost ([::1]:59396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb3tm-0006tu-7u
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 11:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb3f7-0001R2-Iy
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:56:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57659
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb3f1-0003W8-L4
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589900162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UHA/JmE4lmHGe26fiWOFIEuvAP702ovYIBgAsijS+X4=;
 b=AK66d5dE/XrcrCK3Ngu1WygkGp2l3ft0J4EtTV2iSeappDP3S8C3ibR9nBkyGdK3YKtXJf
 hVj47alImSsROg2xrYlD2sFfm0VsMnvgw58t7MJk3snpUqJVD3t42UG9XDHgZlw2S4gDQv
 3QK/0muzc2SyATUSSNfbmEnMPgzzZqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-C6mB8OVwPaS1BbIrT7ooDg-1; Tue, 19 May 2020 10:56:00 -0400
X-MC-Unique: C6mB8OVwPaS1BbIrT7ooDg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFE5E107ACF4;
 Tue, 19 May 2020 14:55:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 401D1100239B;
 Tue, 19 May 2020 14:55:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E252211358CB; Tue, 19 May 2020 16:55:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/55] pci: Convert uses of pci_create() etc. with Coccinelle
Date: Tue, 19 May 2020 16:55:10 +0200
Message-Id: <20200519145551.22836-15-armbru@redhat.com>
In-Reply-To: <20200519145551.22836-1-armbru@redhat.com>
References: <20200519145551.22836-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 23:56:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace

    dev = pci_create(bus, type_name);
    ...
    qdev_init_nofail(dev);

by

    dev = pci_new(type_name);
    ...
    pci_realize_and_unref(dev, bus, &error_fatal);

and similarly for pci_create_multifunction().

Recent commit "qdev: New qdev_new(), qdev_realize(), etc." explains
why.

Coccinelle script:

    @@
    expression dev, bus, expr;
    expression list args;
    @@
    -    dev = pci_create(bus, args);
    +    dev = pci_new(args);
         ... when != dev = expr
    -    qdev_init_nofail(&dev->qdev);
    +    pci_realize_and_unref(dev, bus, &error_fatal);

    @@
    expression dev, bus, expr;
    expression list args;
    expression d;
    @@
    -    dev = pci_create(bus, args);
    +    dev = pci_new(args);
    (
         d = &dev->qdev;
    |
         d = DEVICE(dev);
    )
         ... when != dev = expr
    -    qdev_init_nofail(d);
    +    pci_realize_and_unref(dev, bus, &error_fatal);

    @@
    expression dev, bus, expr;
    expression list args;
    @@
    -    dev = pci_create(bus, args);
    +    dev = pci_new(args);
         ... when != dev = expr
    -    qdev_init_nofail(DEVICE(dev));
    +    pci_realize_and_unref(dev, bus, &error_fatal);

    @@
    expression dev, bus, expr;
    expression list args;
    @@
    -    dev = DEVICE(pci_create(bus, args));
    +    PCIDevice *pci_dev; // TODO move
    +    pci_dev = pci_new(args);
    +    dev = DEVICE(pci_dev);
         ... when != dev = expr
    -    qdev_init_nofail(dev);
    +    pci_realize_and_unref(pci_dev, bus, &error_fatal);

    @@
    expression dev, bus, expr;
    expression list args;
    @@
    -    dev = pci_create_multifunction(bus, args);
    +    dev = pci_new_multifunction(args);
         ... when != dev = expr
    -    qdev_init_nofail(&dev->qdev);
    +    pci_realize_and_unref(dev, bus, &error_fatal);

    @@
    expression bus, expr;
    expression list args;
    identifier dev;
    @@
    -    PCIDevice *dev = pci_create_multifunction(bus, args);
    +    PCIDevice *dev = pci_new_multifunction(args);
         ... when != dev = expr
    -    qdev_init_nofail(&dev->qdev);
    +    pci_realize_and_unref(dev, bus, &error_fatal);

    @@
    expression dev, bus, expr;
    expression list args;
    @@
    -    dev = pci_create_multifunction(bus, args);
    +    dev = pci_new_multifunction(args);
         ... when != dev = expr
    -    qdev_init_nofail(DEVICE(dev));
    +    pci_realize_and_unref(dev, bus, &error_fatal);

Missing #include "qapi/error.h" added manually, whitespace changes
minimized manually, @pci_dev declarations moved manually.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/acpi/piix4.c         |  6 ++++--
 hw/i386/pc_q35.c        | 10 +++++-----
 hw/isa/vt82c686.c       | 13 +++++++------
 hw/mips/mips_fulong2e.c |  6 ++++--
 hw/pci-bridge/dec.c     |  6 +++---
 hw/pci-host/bonito.c    |  4 ++--
 hw/pci-host/sabre.c     | 13 +++++++------
 hw/pci/pci.c            |  8 ++++----
 hw/ppc/mac_newworld.c   |  4 ++--
 hw/ppc/mac_oldworld.c   |  4 ++--
 hw/sparc64/sun4u.c      |  8 ++++----
 11 files changed, 44 insertions(+), 38 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 85c199b30d..9ab8ad5536 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -514,10 +514,12 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
                       qemu_irq sci_irq, qemu_irq smi_irq,
                       int smm_enabled, DeviceState **piix4_pm)
 {
+    PCIDevice *pci_dev;
     DeviceState *dev;
     PIIX4PMState *s;
 
-    dev = DEVICE(pci_create(bus, devfn, TYPE_PIIX4_PM));
+    pci_dev = pci_new(devfn, TYPE_PIIX4_PM);
+    dev = DEVICE(pci_dev);
     qdev_prop_set_uint32(dev, "smb_io_base", smb_io_base);
     if (piix4_pm) {
         *piix4_pm = dev;
@@ -531,7 +533,7 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
         s->use_acpi_pci_hotplug = false;
     }
 
-    qdev_init_nofail(dev);
+    pci_realize_and_unref(pci_dev, bus, &error_fatal);
 
     return s->smb.smbus;
 }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index a2e7faccbc..af68ea1b69 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -98,16 +98,16 @@ static int ehci_create_ich9_with_companions(PCIBus *bus, int slot)
         return -1;
     }
 
-    ehci = pci_create_multifunction(bus, PCI_DEVFN(slot, 7), true, name);
-    qdev_init_nofail(&ehci->qdev);
+    ehci = pci_new_multifunction(PCI_DEVFN(slot, 7), true, name);
+    pci_realize_and_unref(ehci, bus, &error_fatal);
     usbbus = QLIST_FIRST(&ehci->qdev.child_bus);
 
     for (i = 0; i < 3; i++) {
-        uhci = pci_create_multifunction(bus, PCI_DEVFN(slot, comp[i].func),
-                                        true, comp[i].name);
+        uhci = pci_new_multifunction(PCI_DEVFN(slot, comp[i].func), true,
+                                     comp[i].name);
         qdev_prop_set_string(&uhci->qdev, "masterbus", usbbus->name);
         qdev_prop_set_uint32(&uhci->qdev, "firstport", comp[i].port);
-        qdev_init_nofail(&uhci->qdev);
+        pci_realize_and_unref(uhci, bus, &error_fatal);
     }
     return 0;
 }
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index d9b51fce8d..dfce4b267e 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -23,6 +23,7 @@
 #include "hw/isa/apm.h"
 #include "hw/acpi/acpi.h"
 #include "hw/i2c/pm_smbus.h"
+#include "qapi/error.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "exec/address-spaces.h"
@@ -276,8 +277,8 @@ void vt82c686b_ac97_init(PCIBus *bus, int devfn)
 {
     PCIDevice *dev;
 
-    dev = pci_create(bus, devfn, TYPE_VT82C686B_AC97_DEVICE);
-    qdev_init_nofail(&dev->qdev);
+    dev = pci_new(devfn, TYPE_VT82C686B_AC97_DEVICE);
+    pci_realize_and_unref(dev, bus, &error_fatal);
 }
 
 static void via_ac97_class_init(ObjectClass *klass, void *data)
@@ -320,8 +321,8 @@ void vt82c686b_mc97_init(PCIBus *bus, int devfn)
 {
     PCIDevice *dev;
 
-    dev = pci_create(bus, devfn, TYPE_VT82C686B_MC97_DEVICE);
-    qdev_init_nofail(&dev->qdev);
+    dev = pci_new(devfn, TYPE_VT82C686B_MC97_DEVICE);
+    pci_realize_and_unref(dev, bus, &error_fatal);
 }
 
 static void via_mc97_class_init(ObjectClass *klass, void *data)
@@ -388,12 +389,12 @@ I2CBus *vt82c686b_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
     PCIDevice *dev;
     VT686PMState *s;
 
-    dev = pci_create(bus, devfn, TYPE_VT82C686B_PM_DEVICE);
+    dev = pci_new(devfn, TYPE_VT82C686B_PM_DEVICE);
     qdev_prop_set_uint32(&dev->qdev, "smb_io_base", smb_io_base);
 
     s = VT82C686B_PM_DEVICE(dev);
 
-    qdev_init_nofail(&dev->qdev);
+    pci_realize_and_unref(dev, bus, &error_fatal);
 
     return s->smb.smbus;
 }
diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index ef02d54b33..646885834a 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -298,6 +298,7 @@ static void mips_fulong2e_init(MachineState *machine)
     long bios_size;
     uint8_t *spd_data;
     int64_t kernel_entry;
+    PCIDevice *pci_dev;
     PCIBus *pci_bus;
     ISABus *isa_bus;
     I2CBus *smbus;
@@ -369,10 +370,11 @@ static void mips_fulong2e_init(MachineState *machine)
 
     /* GPU */
     if (vga_interface_type != VGA_NONE) {
-        dev = DEVICE(pci_create(pci_bus, -1, "ati-vga"));
+        pci_dev = pci_new(-1, "ati-vga");
+        dev = DEVICE(pci_dev);
         qdev_prop_set_uint32(dev, "vgamem_mb", 16);
         qdev_prop_set_uint16(dev, "x-device-id", 0x5159);
-        qdev_init_nofail(dev);
+        pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
     }
 
     /* Populate SPD eeprom data */
diff --git a/hw/pci-bridge/dec.c b/hw/pci-bridge/dec.c
index 3ae2f788a4..4e5609788e 100644
--- a/hw/pci-bridge/dec.c
+++ b/hw/pci-bridge/dec.c
@@ -26,6 +26,7 @@
 #include "qemu/osdep.h"
 #include "dec.h"
 #include "hw/sysbus.h"
+#include "qapi/error.h"
 #include "qemu/module.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
@@ -91,11 +92,10 @@ PCIBus *pci_dec_21154_init(PCIBus *parent_bus, int devfn)
     PCIDevice *dev;
     PCIBridge *br;
 
-    dev = pci_create_multifunction(parent_bus, devfn, false,
-                                   "dec-21154-p2p-bridge");
+    dev = pci_new_multifunction(devfn, false, "dec-21154-p2p-bridge");
     br = PCI_BRIDGE(dev);
     pci_bridge_map_irq(br, "DEC 21154 PCI-PCI bridge", dec_map_irq);
-    qdev_init_nofail(&dev->qdev);
+    pci_realize_and_unref(dev, parent_bus, &error_fatal);
     return pci_bridge_get_sec_bus(br);
 }
 
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 8ffa702173..91e54acbfd 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -695,11 +695,11 @@ PCIBus *bonito_init(qemu_irq *pic)
     pcihost->pic = pic;
     qdev_realize_and_unref(dev, NULL, &error_fatal);
 
-    d = pci_create(phb->bus, PCI_DEVFN(0, 0), TYPE_PCI_BONITO);
+    d = pci_new(PCI_DEVFN(0, 0), TYPE_PCI_BONITO);
     s = PCI_BONITO(d);
     s->pcihost = pcihost;
     pcihost->pci_dev = s;
-    qdev_init_nofail(DEVICE(d));
+    pci_realize_and_unref(d, phb->bus, &error_fatal);
 
     return phb->bus;
 }
diff --git a/hw/pci-host/sabre.c b/hw/pci-host/sabre.c
index 475bcb01d7..0cc68585f8 100644
--- a/hw/pci-host/sabre.c
+++ b/hw/pci-host/sabre.c
@@ -35,6 +35,7 @@
 #include "hw/pci-bridge/simba.h"
 #include "hw/pci-host/sabre.h"
 #include "exec/address-spaces.h"
+#include "qapi/error.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "sysemu/runstate.h"
@@ -405,17 +406,17 @@ static void sabre_realize(DeviceState *dev, Error **errp)
     pci_setup_iommu(phb->bus, sabre_pci_dma_iommu, s->iommu);
 
     /* APB secondary busses */
-    pci_dev = pci_create_multifunction(phb->bus, PCI_DEVFN(1, 0), true,
-                                       TYPE_SIMBA_PCI_BRIDGE);
+    pci_dev = pci_new_multifunction(PCI_DEVFN(1, 0), true,
+                                    TYPE_SIMBA_PCI_BRIDGE);
     s->bridgeB = PCI_BRIDGE(pci_dev);
     pci_bridge_map_irq(s->bridgeB, "pciB", pci_simbaB_map_irq);
-    qdev_init_nofail(&pci_dev->qdev);
+    pci_realize_and_unref(pci_dev, phb->bus, &error_fatal);
 
-    pci_dev = pci_create_multifunction(phb->bus, PCI_DEVFN(1, 1), true,
-                                       TYPE_SIMBA_PCI_BRIDGE);
+    pci_dev = pci_new_multifunction(PCI_DEVFN(1, 1), true,
+                                    TYPE_SIMBA_PCI_BRIDGE);
     s->bridgeA = PCI_BRIDGE(pci_dev);
     pci_bridge_map_irq(s->bridgeA, "pciA", pci_simbaA_map_irq);
-    qdev_init_nofail(&pci_dev->qdev);
+    pci_realize_and_unref(pci_dev, phb->bus, &error_fatal);
 }
 
 static void sabre_init(Object *obj)
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 92f3f0f134..ab8b71fe72 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1937,10 +1937,10 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
         exit(1);
     }
 
-    pci_dev = pci_create(bus, devfn, nd->model);
+    pci_dev = pci_new(devfn, nd->model);
     dev = &pci_dev->qdev;
     qdev_set_nic_properties(dev, nd);
-    qdev_init_nofail(dev);
+    pci_realize_and_unref(pci_dev, bus, &error_fatal);
     g_ptr_array_free(pci_nic_models, true);
     return pci_dev;
 }
@@ -2183,8 +2183,8 @@ PCIDevice *pci_create_simple_multifunction(PCIBus *bus, int devfn,
                                            bool multifunction,
                                            const char *name)
 {
-    PCIDevice *dev = pci_create_multifunction(bus, devfn, multifunction, name);
-    qdev_init_nofail(&dev->qdev);
+    PCIDevice *dev = pci_new_multifunction(devfn, multifunction, name);
+    pci_realize_and_unref(dev, bus, &error_fatal);
     return dev;
 }
 
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 2d069dcc59..baa17cdce7 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -375,14 +375,14 @@ static void ppc_core99_init(MachineState *machine)
     pci_bus = PCI_HOST_BRIDGE(uninorth_pci)->bus;
 
     /* MacIO */
-    macio = pci_create(pci_bus, -1, TYPE_NEWWORLD_MACIO);
+    macio = pci_new(-1, TYPE_NEWWORLD_MACIO);
     dev = DEVICE(macio);
     qdev_prop_set_uint64(dev, "frequency", tbfreq);
     qdev_prop_set_bit(dev, "has-pmu", has_pmu);
     qdev_prop_set_bit(dev, "has-adb", has_adb);
     object_property_set_link(OBJECT(macio), OBJECT(pic_dev), "pic",
                              &error_abort);
-    qdev_init_nofail(dev);
+    pci_realize_and_unref(macio, pci_bus, &error_fatal);
 
     /* We only emulate 2 out of 3 IDE controllers for now */
     ide_drive_get(hd, ARRAY_SIZE(hd));
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index f73ec5f3a9..903483079e 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -278,12 +278,12 @@ static void ppc_heathrow_init(MachineState *machine)
     ide_drive_get(hd, ARRAY_SIZE(hd));
 
     /* MacIO */
-    macio = pci_create(pci_bus, -1, TYPE_OLDWORLD_MACIO);
+    macio = pci_new(-1, TYPE_OLDWORLD_MACIO);
     dev = DEVICE(macio);
     qdev_prop_set_uint64(dev, "frequency", tbfreq);
     object_property_set_link(OBJECT(macio), OBJECT(pic_dev), "pic",
                              &error_abort);
-    qdev_init_nofail(dev);
+    pci_realize_and_unref(macio, pci_bus, &error_fatal);
 
     macio_ide = MACIO_IDE(object_resolve_path_component(OBJECT(macio),
                                                         "ide[0]"));
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index ade9c22825..6f29a013ca 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -605,10 +605,10 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     pci_busA->slot_reserved_mask = 0xfffffff1;
     pci_busB->slot_reserved_mask = 0xfffffff0;
 
-    ebus = pci_create_multifunction(pci_busA, PCI_DEVFN(1, 0), true, TYPE_EBUS);
+    ebus = pci_new_multifunction(PCI_DEVFN(1, 0), true, TYPE_EBUS);
     qdev_prop_set_uint64(DEVICE(ebus), "console-serial-base",
                          hwdef->console_serial_base);
-    qdev_init_nofail(DEVICE(ebus));
+    pci_realize_and_unref(ebus, pci_busA, &error_fatal);
 
     /* Wire up "well-known" ISA IRQs to PBM legacy obio IRQs */
     qdev_connect_gpio_out_named(DEVICE(ebus), "isa-irq", 7,
@@ -661,9 +661,9 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
         qemu_macaddr_default_if_unset(&macaddr);
     }
 
-    pci_dev = pci_create(pci_busA, PCI_DEVFN(3, 0), "cmd646-ide");
+    pci_dev = pci_new(PCI_DEVFN(3, 0), "cmd646-ide");
     qdev_prop_set_uint32(&pci_dev->qdev, "secondary", 1);
-    qdev_init_nofail(&pci_dev->qdev);
+    pci_realize_and_unref(pci_dev, pci_busA, &error_fatal);
     pci_ide_create_devs(pci_dev);
 
     /* Map NVRAM into I/O (ebus) space */
-- 
2.21.1


