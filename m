Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A015B2E7FA4
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 12:22:47 +0100 (CET)
Received: from localhost ([::1]:56092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuw2Y-0003I7-MV
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 06:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuw0X-0001aE-DS; Thu, 31 Dec 2020 06:20:41 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:48361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuw0V-0003hV-GE; Thu, 31 Dec 2020 06:20:41 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0EA237470EB;
 Thu, 31 Dec 2020 12:20:38 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3B13B7470E7; Thu, 31 Dec 2020 12:20:30 +0100 (CET)
Message-Id: <6892fc8ac57283bf7ba27fe89ea9dbdd6a37f988.1609413115.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609413115.git.balaton@eik.bme.hu>
References: <cover.1609413115.git.balaton@eik.bme.hu>
Subject: [PATCH v2 3/3] sam460ex: Clean up irq mapping
Date: Thu, 31 Dec 2020 12:11:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

Avoid mapping multiple interrupts to the same irq. Instead map them to
the 4 PCI interrupts and use an or-gate in the board to connect them
to the interrupt controller. This does not fix any known problem but
does not seem to cause a new problem either and may be cleaner at least.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Tested-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/ppc/Kconfig       |  1 +
 hw/ppc/ppc440_pcix.c | 28 ++++++++++++++--------------
 hw/ppc/sam460ex.c    | 16 +++++++++++++---
 3 files changed, 28 insertions(+), 17 deletions(-)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index f1e1be208e..ebb70803c4 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -59,6 +59,7 @@ config SAM460EX
     select PFLASH_CFI01
     select IDE_SII3112
     select M41T80
+    select OR_IRQ
     select PPC440
     select SM501
     select SMBUS_EEPROM
diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c
index ee952314c8..504decbbc2 100644
--- a/hw/ppc/ppc440_pcix.c
+++ b/hw/ppc/ppc440_pcix.c
@@ -57,8 +57,8 @@ struct PPC440PCIXState {
     PCIDevice *dev;
     struct PLBOutMap pom[PPC440_PCIX_NR_POMS];
     struct PLBInMap pim[PPC440_PCIX_NR_PIMS];
+    qemu_irq irq[PCI_NUM_PINS];
     uint32_t sts;
-    qemu_irq irq;
     AddressSpace bm_as;
     MemoryRegion bm;
 
@@ -415,24 +415,20 @@ static void ppc440_pcix_reset(DeviceState *dev)
     s->sts = 0;
 }
 
-/* All pins from each slot are tied to a single board IRQ.
- * This may need further refactoring for other boards. */
 static int ppc440_pcix_map_irq(PCIDevice *pci_dev, int irq_num)
 {
-    trace_ppc440_pcix_map_irq(pci_dev->devfn, irq_num, 0);
-    return 0;
+    int n = (irq_num + PCI_SLOT(pci_dev->devfn)) % PCI_NUM_PINS;
+
+    trace_ppc440_pcix_map_irq(pci_dev->devfn, irq_num, n);
+    return n;
 }
 
 static void ppc440_pcix_set_irq(void *opaque, int irq_num, int level)
 {
-    qemu_irq *pci_irq = opaque;
+    qemu_irq *pci_irqs = opaque;
 
     trace_ppc440_pcix_set_irq(irq_num);
-    if (irq_num < 0) {
-        error_report("%s: PCI irq %d", __func__, irq_num);
-        return;
-    }
-    qemu_set_irq(*pci_irq, level);
+    qemu_set_irq(pci_irqs[irq_num], level);
 }
 
 static AddressSpace *ppc440_pcix_set_iommu(PCIBus *b, void *opaque, int devfn)
@@ -472,15 +468,19 @@ static void ppc440_pcix_realize(DeviceState *dev, Error **errp)
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     PPC440PCIXState *s;
     PCIHostState *h;
+    int i;
 
     h = PCI_HOST_BRIDGE(dev);
     s = PPC440_PCIX_HOST_BRIDGE(dev);
 
-    sysbus_init_irq(sbd, &s->irq);
+    for (i = 0; i < ARRAY_SIZE(s->irq); i++) {
+        sysbus_init_irq(sbd, &s->irq[i]);
+    }
     memory_region_init(&s->busmem, OBJECT(dev), "pci bus memory", UINT64_MAX);
     h->bus = pci_register_root_bus(dev, NULL, ppc440_pcix_set_irq,
-                         ppc440_pcix_map_irq, &s->irq, &s->busmem,
-                         get_system_io(), PCI_DEVFN(0, 0), 1, TYPE_PCI_BUS);
+                         ppc440_pcix_map_irq, s->irq, &s->busmem,
+                         get_system_io(), PCI_DEVFN(0, 0), ARRAY_SIZE(s->irq),
+                         TYPE_PCI_BUS);
 
     s->dev = pci_create_simple(h->bus, PCI_DEVFN(0, 0), "ppc4xx-host-bridge");
 
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 14e6583eb0..59b19fbca1 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -33,6 +33,7 @@
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
 #include "hw/sysbus.h"
+#include "hw/or-irq.h"
 #include "hw/char/serial.h"
 #include "hw/i2c/ppc4xx_i2c.h"
 #include "hw/i2c/smbus_eeprom.h"
@@ -292,7 +293,7 @@ static void sam460ex_init(MachineState *machine)
     SysBusDevice *sbdev;
     struct boot_info *boot_info;
     uint8_t *spd_data;
-    int success;
+    int i, success;
 
     cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
     env = &cpu->env;
@@ -382,13 +383,22 @@ static void sam460ex_init(MachineState *machine)
 
     /* PCI bus */
     ppc460ex_pcie_init(env);
-    /* All PCI irqs are connected to the same UIC pin (cf. UBoot source) */
-    dev = sysbus_create_simple("ppc440-pcix-host", 0xc0ec00000, uic[1][0]);
+    dev = sysbus_create_simple("ppc440-pcix-host", 0xc0ec00000, NULL);
     pci_bus = (PCIBus *)qdev_get_child_bus(dev, "pci.0");
     if (!pci_bus) {
         error_report("couldn't create PCI controller!");
         exit(1);
     }
+    /* All PCI irqs are connected to the same UIC pin (cf. UBoot source) */
+    sbdev = SYS_BUS_DEVICE(dev);
+    dev = qdev_new(TYPE_OR_IRQ);
+    object_property_set_int(OBJECT(dev), "num-lines", PCI_NUM_PINS,
+                            &error_fatal);
+    qdev_realize_and_unref(dev, NULL, &error_fatal);
+    for (i = 0; i < PCI_NUM_PINS; i++) {
+        sysbus_connect_irq(sbdev, i, qdev_get_gpio_in(dev, i));
+    }
+    qdev_connect_gpio_out(dev, 0, uic[1][0]);
     memory_region_init_alias(isa, NULL, "isa_mmio", get_system_io(),
                              0, 0x10000);
     memory_region_add_subregion(get_system_memory(), 0xc08000000, isa);
-- 
2.21.3


