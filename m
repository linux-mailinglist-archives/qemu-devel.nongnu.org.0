Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CE12FB19C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 07:40:50 +0100 (CET)
Received: from localhost ([::1]:42116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1kh7-0001hd-RM
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 01:40:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1kQp-0001RU-3i; Tue, 19 Jan 2021 01:23:59 -0500
Received: from ozlabs.org ([203.11.71.1]:44815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1kQn-0000Xv-6B; Tue, 19 Jan 2021 01:23:58 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DKdrY2Jlsz9sXL; Tue, 19 Jan 2021 17:23:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611037405;
 bh=xQU3OM2yaLJZCG+m+5OllcQ+jG51crSRIodao1lQ83I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k0ihJOPplREpzmeaudpOGs31l5MJLpsSffPWauT0E7k4DeKxV+F5Oe6y9XFdtec+s
 j7RKrIyHLUfQBJkKDarNDeO9TyGWh8GnZZKHvWNX/XZP9Ar+kDPfR9w3Vf/6x7QELb
 j+g2ABCPatou+AXYOyb9n0oqo5e9uPgaE51PfVJE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 01/13] hw/ppc/sam460ex: Drop use of ppcuic_init()
Date: Tue, 19 Jan 2021 17:23:06 +1100
Message-Id: <20210119062318.13857-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119062318.13857-1-david@gibson.dropbear.id.au>
References: <20210119062318.13857-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Switch the sam460ex board to directly creating and configuring the
UIC, rather than doing it via the old ppcuic_init() helper function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210108171212.16500-2-peter.maydell@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/sam460ex.c | 69 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 53 insertions(+), 16 deletions(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 14e6583eb0..45721ad6c7 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -39,6 +39,7 @@
 #include "hw/usb/hcd-ehci.h"
 #include "hw/ppc/fdt.h"
 #include "hw/qdev-properties.h"
+#include "hw/intc/ppc-uic.h"
 
 #include <libfdt.h>
 
@@ -281,7 +282,9 @@ static void sam460ex_init(MachineState *machine)
     hwaddr ram_bases[SDRAM_NR_BANKS] = {0};
     hwaddr ram_sizes[SDRAM_NR_BANKS] = {0};
     MemoryRegion *l2cache_ram = g_new(MemoryRegion, 1);
-    qemu_irq *irqs, *uic[4];
+    DeviceState *uic[4];
+    qemu_irq mal_irqs[4];
+    int i;
     PCIBus *pci_bus;
     PowerPCCPU *cpu;
     CPUPPCState *env;
@@ -312,13 +315,38 @@ static void sam460ex_init(MachineState *machine)
     ppc4xx_plb_init(env);
 
     /* interrupt controllers */
-    irqs = g_new0(qemu_irq, PPCUIC_OUTPUT_NB);
-    irqs[PPCUIC_OUTPUT_INT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT];
-    irqs[PPCUIC_OUTPUT_CINT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT];
-    uic[0] = ppcuic_init(env, irqs, 0xc0, 0, 1);
-    uic[1] = ppcuic_init(env, &uic[0][30], 0xd0, 0, 1);
-    uic[2] = ppcuic_init(env, &uic[0][10], 0xe0, 0, 1);
-    uic[3] = ppcuic_init(env, &uic[0][16], 0xf0, 0, 1);
+    for (i = 0; i < ARRAY_SIZE(uic); i++) {
+        SysBusDevice *sbd;
+        /*
+         * UICs 1, 2 and 3 are cascaded through UIC 0.
+         * input_ints[n] is the interrupt number on UIC 0 which
+         * the INT output of UIC n is connected to. The CINT output
+         * of UIC n connects to input_ints[n] + 1.
+         * The entry in input_ints[] for UIC 0 is ignored, because UIC 0's
+         * INT and CINT outputs are connected to the CPU.
+         */
+        const int input_ints[] = { -1, 30, 10, 16 };
+
+        uic[i] = qdev_new(TYPE_PPC_UIC);
+        sbd = SYS_BUS_DEVICE(uic[i]);
+
+        qdev_prop_set_uint32(uic[i], "dcr-base", 0xc0 + i * 0x10);
+        object_property_set_link(OBJECT(uic[i]), "cpu", OBJECT(cpu),
+                                 &error_fatal);
+        sysbus_realize_and_unref(sbd, &error_fatal);
+
+        if (i == 0) {
+            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
+                               ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
+            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_CINT,
+                               ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
+        } else {
+            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
+                               qdev_get_gpio_in(uic[0], input_ints[i]));
+            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_CINT,
+                               qdev_get_gpio_in(uic[0], input_ints[i] + 1));
+        }
+    }
 
     /* SDRAM controller */
     /* put all RAM on first bank because board has one slot
@@ -331,7 +359,8 @@ static void sam460ex_init(MachineState *machine)
                       ram_bases, ram_sizes, 1);
 
     /* IIC controllers and devices */
-    dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600700, uic[0][2]);
+    dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600700,
+                               qdev_get_gpio_in(uic[0], 2));
     i2c = PPC4xx_I2C(dev)->bus;
     /* SPD EEPROM on RAM module */
     spd_data = spd_data_generate(ram_sizes[0] < 128 * MiB ? DDR : DDR2,
@@ -341,7 +370,8 @@ static void sam460ex_init(MachineState *machine)
     /* RTC */
     i2c_slave_create_simple(i2c, "m41t80", 0x68);
 
-    dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600800, uic[0][3]);
+    dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600800,
+                               qdev_get_gpio_in(uic[0], 3));
 
     /* External bus controller */
     ppc405_ebc_init(env);
@@ -356,7 +386,10 @@ static void sam460ex_init(MachineState *machine)
     ppc4xx_sdr_init(env);
 
     /* MAL */
-    ppc4xx_mal_init(env, 4, 16, &uic[2][3]);
+    for (i = 0; i < ARRAY_SIZE(mal_irqs); i++) {
+        mal_irqs[0] = qdev_get_gpio_in(uic[2], 3 + i);
+    }
+    ppc4xx_mal_init(env, 4, 16, mal_irqs);
 
     /* DMA */
     ppc4xx_dma_init(env, 0x200);
@@ -369,21 +402,23 @@ static void sam460ex_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, 0x400000000LL, l2cache_ram);
 
     /* USB */
-    sysbus_create_simple(TYPE_PPC4xx_EHCI, 0x4bffd0400, uic[2][29]);
+    sysbus_create_simple(TYPE_PPC4xx_EHCI, 0x4bffd0400,
+                         qdev_get_gpio_in(uic[2], 29));
     dev = qdev_new("sysbus-ohci");
     qdev_prop_set_string(dev, "masterbus", "usb-bus.0");
     qdev_prop_set_uint32(dev, "num-ports", 6);
     sbdev = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(sbdev, &error_fatal);
     sysbus_mmio_map(sbdev, 0, 0x4bffd0000);
-    sysbus_connect_irq(sbdev, 0, uic[2][30]);
+    sysbus_connect_irq(sbdev, 0, qdev_get_gpio_in(uic[2], 30));
     usb_create_simple(usb_bus_find(-1), "usb-kbd");
     usb_create_simple(usb_bus_find(-1), "usb-mouse");
 
     /* PCI bus */
     ppc460ex_pcie_init(env);
     /* All PCI irqs are connected to the same UIC pin (cf. UBoot source) */
-    dev = sysbus_create_simple("ppc440-pcix-host", 0xc0ec00000, uic[1][0]);
+    dev = sysbus_create_simple("ppc440-pcix-host", 0xc0ec00000,
+                               qdev_get_gpio_in(uic[1], 0));
     pci_bus = (PCIBus *)qdev_get_child_bus(dev, "pci.0");
     if (!pci_bus) {
         error_report("couldn't create PCI controller!");
@@ -405,12 +440,14 @@ static void sam460ex_init(MachineState *machine)
     /* SoC has 4 UARTs
      * but board has only one wired and two are present in fdt */
     if (serial_hd(0) != NULL) {
-        serial_mm_init(address_space_mem, 0x4ef600300, 0, uic[1][1],
+        serial_mm_init(address_space_mem, 0x4ef600300, 0,
+                       qdev_get_gpio_in(uic[1], 1),
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
                        DEVICE_BIG_ENDIAN);
     }
     if (serial_hd(1) != NULL) {
-        serial_mm_init(address_space_mem, 0x4ef600400, 0, uic[0][1],
+        serial_mm_init(address_space_mem, 0x4ef600400, 0,
+                       qdev_get_gpio_in(uic[0], 1),
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
                        DEVICE_BIG_ENDIAN);
     }
-- 
2.29.2


