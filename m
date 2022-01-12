Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 135F748CE1A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 22:58:22 +0100 (CET)
Received: from localhost ([::1]:41112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ldM-0003CD-T7
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 16:58:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1n7lIi-0008PO-2X
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 16:37:01 -0500
Received: from [2a00:1450:4864:20::544] (port=45963
 helo=mail-ed1-x544.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1n7lIf-00052D-7w
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 16:36:59 -0500
Received: by mail-ed1-x544.google.com with SMTP id z22so15215580edd.12
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 13:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tbxdYTTQryQSvZgiTmFwffxeBpRZqwLPI03HAWyY0Rg=;
 b=XwLTTAdL1cfVHpkg63aT7HA9HIJUnMXmQXyYL8QCBplNfjWWWw7rjdW5ZfwaTDoZ/n
 sfakHwT+SR7QzTiQancp0qWIV5s5hEpd2dqYJB4DuFXj/YUbkgcd1rg/mm96ZXnyeXsM
 a5jLKu8r39gItgOkWOcW3Ta6Q+6n1jRtE5ry1TwppmT5R799LhgimY1tWu2qfYmAyEGG
 m/YNJpXa3fob+u8w1iDXRDxvQDDKQDg7DtPrcQNCY0KLhWwLcXe94s9kkKrVmJ/qCEXo
 scYgaC7R25Fj0miwHLgJ9dA90RugTg88PcFpsUny5lQvARTrPzxe0NxNwFRg4H8o0tM3
 2mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tbxdYTTQryQSvZgiTmFwffxeBpRZqwLPI03HAWyY0Rg=;
 b=q3FF7HkaGYY9yNxLx2L/c+01AmezgWGt5Ck1DGYIpTgqAIU5xzEoH+bLtdrizaavRB
 j8iFdFCIG2F2XnGlkQaEaIbEJRcJUT7BevhAKZ8p3SpxWafwOiGU8pqvGI26w8sq2twN
 DMF0u3m05UnOtyWRr0gJjvy2YLtnC1TjbwvaQqfn2xu/MwXh7jjhbbeIY7/KbLnyGk55
 cSsOXlwMJ1UP+kugr73tGC765a7Xi/16Pu6Yx4yUQ9caOBenPOWICHr3Shb5brEJ5+TN
 3Yqc+bb9sOgGUi3umbTMiqVtYlVoVqU61e5KOhY/nckMHm/v7Ia/1wW1Lfo2DRe2SRlp
 rBsA==
X-Gm-Message-State: AOAM531TyBa5LQbbY1z45/Sb3GW/bIWadjHZlxO0L7/axo8d0cbu54Vn
 Cdl2ApnmIn4fnl17/zPm12d0M9wawsxhphm9K64=
X-Google-Smtp-Source: ABdhPJyumWeUPtL2wgLQ+98Ob9Ne65wAHLHJo+1N4xxK6NipHvJ5PSeoE6jeW6Qn/GnWLbGC1cuuEg==
X-Received: by 2002:a05:6402:c19:: with SMTP id
 co25mr1411362edb.33.1642023415112; 
 Wed, 12 Jan 2022 13:36:55 -0800 (PST)
Received: from osoxes.fritz.box (mue-88-130-49-239.dsl.tropolys.de.
 [88.130.49.239])
 by smtp.gmail.com with ESMTPSA id b2sm257288ejh.221.2022.01.12.13.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 13:36:54 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] malta: Move PCI interrupt handling from gt64xxx to piix4
Date: Wed, 12 Jan 2022 22:36:26 +0100
Message-Id: <20220112213629.9126-2-shentey@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220112213629.9126-1-shentey@gmail.com>
References: <20220112213629.9126-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::544
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x544.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 12 Jan 2022 16:56:17 -0500
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
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Handling PCI interrupts in piix4 increases cohesion and reduces differences
between piix4 and piix3.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c         | 58 +++++++++++++++++++++++++++++++++++++++
 hw/mips/gt64xxx_pci.c  | 62 ++++--------------------------------------
 hw/mips/malta.c        |  6 +---
 include/hw/mips/mips.h |  2 +-
 4 files changed, 65 insertions(+), 63 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 0fe7b69bc4..5a86308689 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -45,6 +45,7 @@ struct PIIX4State {
     PCIDevice dev;
     qemu_irq cpu_intr;
     qemu_irq *isa;
+    qemu_irq i8259[ISA_NUM_IRQS];
 
     RTCState rtc;
     /* Reset Control Register */
@@ -54,6 +55,30 @@ struct PIIX4State {
 
 OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
 
+static int pci_irq_levels[4];
+
+static void piix4_set_irq(void *opaque, int irq_num, int level)
+{
+    int i, pic_irq, pic_level;
+    qemu_irq *pic = opaque;
+
+    pci_irq_levels[irq_num] = level;
+
+    /* now we change the pic irq level according to the piix irq mappings */
+    /* XXX: optimize */
+    pic_irq = piix4_dev->config[PIIX_PIRQCA + irq_num];
+    if (pic_irq < 16) {
+        /* The pic level is the logical OR of all the PCI irqs mapped to it. */
+        pic_level = 0;
+        for (i = 0; i < 4; i++) {
+            if (pic_irq == piix4_dev->config[PIIX_PIRQCA + i]) {
+                pic_level |= pci_irq_levels[i];
+            }
+        }
+        qemu_set_irq(pic[pic_irq], pic_level);
+    }
+}
+
 static void piix4_isa_reset(DeviceState *dev)
 {
     PIIX4State *d = PIIX4_PCI_DEVICE(dev);
@@ -248,8 +273,34 @@ static void piix4_register_types(void)
 
 type_init(piix4_register_types)
 
+static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
+{
+    int slot;
+
+    slot = PCI_SLOT(pci_dev->devfn);
+
+    switch (slot) {
+    /* PIIX4 USB */
+    case 10:
+        return 3;
+    /* AMD 79C973 Ethernet */
+    case 11:
+        return 1;
+    /* Crystal 4281 Sound */
+    case 12:
+        return 2;
+    /* PCI slot 1 to 4 */
+    case 18 ... 21:
+        return ((slot - 18) + irq_num) & 0x03;
+    /* Unknown device, don't do any translation */
+    default:
+        return irq_num;
+    }
+}
+
 DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 {
+    PIIX4State *s;
     PCIDevice *pci;
     DeviceState *dev;
     int devfn = PCI_DEVFN(10, 0);
@@ -257,6 +308,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
     pci = pci_create_simple_multifunction(pci_bus, devfn,  true,
                                           TYPE_PIIX4_PCI_DEVICE);
     dev = DEVICE(pci);
+    s = PIIX4_PCI_DEVICE(pci);
     if (isa_bus) {
         *isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
     }
@@ -271,5 +323,11 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
                                NULL, 0, NULL);
     }
 
+    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->i8259, 4);
+
+    for (int i = 0; i < ISA_NUM_IRQS; i++) {
+        s->i8259[i] = qdev_get_gpio_in_named(dev, "isa", i);
+    }
+
     return dev;
 }
diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index c7480bd019..9e23e32eff 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -981,56 +981,6 @@ static const MemoryRegionOps isd_mem_ops = {
     },
 };
 
-static int gt64120_pci_map_irq(PCIDevice *pci_dev, int irq_num)
-{
-    int slot;
-
-    slot = PCI_SLOT(pci_dev->devfn);
-
-    switch (slot) {
-    /* PIIX4 USB */
-    case 10:
-        return 3;
-    /* AMD 79C973 Ethernet */
-    case 11:
-        return 1;
-    /* Crystal 4281 Sound */
-    case 12:
-        return 2;
-    /* PCI slot 1 to 4 */
-    case 18 ... 21:
-        return ((slot - 18) + irq_num) & 0x03;
-    /* Unknown device, don't do any translation */
-    default:
-        return irq_num;
-    }
-}
-
-static int pci_irq_levels[4];
-
-static void gt64120_pci_set_irq(void *opaque, int irq_num, int level)
-{
-    int i, pic_irq, pic_level;
-    qemu_irq *pic = opaque;
-
-    pci_irq_levels[irq_num] = level;
-
-    /* now we change the pic irq level according to the piix irq mappings */
-    /* XXX: optimize */
-    pic_irq = piix4_dev->config[PIIX_PIRQCA + irq_num];
-    if (pic_irq < 16) {
-        /* The pic level is the logical OR of all the PCI irqs mapped to it. */
-        pic_level = 0;
-        for (i = 0; i < 4; i++) {
-            if (pic_irq == piix4_dev->config[PIIX_PIRQCA + i]) {
-                pic_level |= pci_irq_levels[i];
-            }
-        }
-        qemu_set_irq(pic[pic_irq], pic_level);
-    }
-}
-
-
 static void gt64120_reset(DeviceState *dev)
 {
     GT64120State *s = GT64120_PCI_HOST_BRIDGE(dev);
@@ -1207,7 +1157,7 @@ static void gt64120_realize(DeviceState *dev, Error **errp)
                           "gt64120-isd", 0x1000);
 }
 
-PCIBus *gt64120_register(qemu_irq *pic)
+PCIBus *gt64120_register(void)
 {
     GT64120State *d;
     PCIHostState *phb;
@@ -1218,12 +1168,10 @@ PCIBus *gt64120_register(qemu_irq *pic)
     phb = PCI_HOST_BRIDGE(dev);
     memory_region_init(&d->pci0_mem, OBJECT(dev), "pci0-mem", 4 * GiB);
     address_space_init(&d->pci0_mem_as, &d->pci0_mem, "pci0-mem");
-    phb->bus = pci_register_root_bus(dev, "pci",
-                                     gt64120_pci_set_irq, gt64120_pci_map_irq,
-                                     pic,
-                                     &d->pci0_mem,
-                                     get_system_io(),
-                                     PCI_DEVFN(18, 0), 4, TYPE_PCI_BUS);
+    phb->bus = pci_root_bus_new(dev, "pci",
+                                &d->pci0_mem,
+                                get_system_io(),
+                                PCI_DEVFN(18, 0), TYPE_PCI_BUS);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index b770b8d367..13254dbc89 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -97,7 +97,6 @@ struct MaltaState {
 
     Clock *cpuclk;
     MIPSCPSState cps;
-    qemu_irq i8259[ISA_NUM_IRQS];
 };
 
 static struct _loaderparams {
@@ -1391,7 +1390,7 @@ void mips_malta_init(MachineState *machine)
     stl_p(memory_region_get_ram_ptr(bios_copy) + 0x10, 0x00000420);
 
     /* Northbridge */
-    pci_bus = gt64120_register(s->i8259);
+    pci_bus = gt64120_register();
     /*
      * The whole address space decoded by the GT-64120A doesn't generate
      * exception when accessing invalid memory. Create an empty slot to
@@ -1404,9 +1403,6 @@ void mips_malta_init(MachineState *machine)
 
     /* Interrupt controller */
     qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
-    for (int i = 0; i < ISA_NUM_IRQS; i++) {
-        s->i8259[i] = qdev_get_gpio_in_named(dev, "isa", i);
-    }
 
     /* generate SPD EEPROM data */
     generate_eeprom_spd(&smbus_eeprom_buf[0 * 256], ram_size);
diff --git a/include/hw/mips/mips.h b/include/hw/mips/mips.h
index 6c9c8805f3..ff88942e63 100644
--- a/include/hw/mips/mips.h
+++ b/include/hw/mips/mips.h
@@ -10,7 +10,7 @@
 #include "exec/memory.h"
 
 /* gt64xxx.c */
-PCIBus *gt64120_register(qemu_irq *pic);
+PCIBus *gt64120_register(void);
 
 /* bonito.c */
 PCIBus *bonito_init(qemu_irq *pic);
-- 
2.34.1


