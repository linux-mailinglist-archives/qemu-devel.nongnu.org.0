Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2EC2EB877
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:41:12 +0100 (CET)
Received: from localhost ([::1]:50588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzh9-00083v-Ds
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:41:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzeg-0005XJ-70; Tue, 05 Jan 2021 22:38:38 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38695 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzed-0006FD-M1; Tue, 05 Jan 2021 22:38:37 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpG1NCcz9sVt; Wed,  6 Jan 2021 14:38:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904310;
 bh=6EhFepxMpLM7PKI6tS1VgwrcMHlyoaSQp4nd7OSi5CE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BYOWhpToGZ/OhDJ+K9ycxFA3yEQP66MuEPJsfTc/06KOX50BLg2YBdMxfCh2R0XcI
 ou1N6xlENye1sszUseRg/uju+f9oC5JRub6Biue865Kd3jE+8Gi3N4opxFNkrvOgIj
 Hnr4PHIlLLrLwABnYoR+tOrcKL2qx8YQAikvvQSw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 04/22] hw/ppc/ppc440_bamboo: Drop use of ppcuic_init()
Date: Wed,  6 Jan 2021 14:37:58 +1100
Message-Id: <20210106033816.232598-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Switch the bamboo board to directly creating and configuring the UIC,
rather than doing it via the old ppcuic_init() helper function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20201212001537.24520-5-peter.maydell@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/ppc440_bamboo.c | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 665bc1784e..b156bcb999 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -33,6 +33,9 @@
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
 #include "hw/sysbus.h"
+#include "hw/intc/ppc-uic.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
 
 #define BINARY_DEVICE_TREE_FILE "bamboo.dtb"
 
@@ -168,13 +171,13 @@ static void bamboo_init(MachineState *machine)
     MemoryRegion *ram_memories = g_new(MemoryRegion, PPC440EP_SDRAM_NR_BANKS);
     hwaddr ram_bases[PPC440EP_SDRAM_NR_BANKS];
     hwaddr ram_sizes[PPC440EP_SDRAM_NR_BANKS];
-    qemu_irq *pic;
-    qemu_irq *irqs;
     PCIBus *pcibus;
     PowerPCCPU *cpu;
     CPUPPCState *env;
     target_long initrd_size = 0;
     DeviceState *dev;
+    DeviceState *uicdev;
+    SysBusDevice *uicsbd;
     int success;
     int i;
 
@@ -192,10 +195,17 @@ static void bamboo_init(MachineState *machine)
     ppc_dcr_init(env, NULL, NULL);
 
     /* interrupt controller */
-    irqs = g_new0(qemu_irq, PPCUIC_OUTPUT_NB);
-    irqs[PPCUIC_OUTPUT_INT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT];
-    irqs[PPCUIC_OUTPUT_CINT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT];
-    pic = ppcuic_init(env, irqs, 0x0C0, 0, 1);
+    uicdev = qdev_new(TYPE_PPC_UIC);
+    uicsbd = SYS_BUS_DEVICE(uicdev);
+
+    object_property_set_link(OBJECT(uicdev), "cpu", OBJECT(cpu),
+                             &error_fatal);
+    sysbus_realize_and_unref(uicsbd, &error_fatal);
+
+    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
+                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
+    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
+                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
 
     /* SDRAM controller */
     memset(ram_bases, 0, sizeof(ram_bases));
@@ -203,14 +213,18 @@ static void bamboo_init(MachineState *machine)
     ppc4xx_sdram_banks(machine->ram, PPC440EP_SDRAM_NR_BANKS, ram_memories,
                        ram_bases, ram_sizes, ppc440ep_sdram_bank_sizes);
     /* XXX 440EP's ECC interrupts are on UIC1, but we've only created UIC0. */
-    ppc4xx_sdram_init(env, pic[14], PPC440EP_SDRAM_NR_BANKS, ram_memories,
+    ppc4xx_sdram_init(env,
+                      qdev_get_gpio_in(uicdev, 14),
+                      PPC440EP_SDRAM_NR_BANKS, ram_memories,
                       ram_bases, ram_sizes, 1);
 
     /* PCI */
     dev = sysbus_create_varargs(TYPE_PPC4xx_PCI_HOST_BRIDGE,
                                 PPC440EP_PCI_CONFIG,
-                                pic[pci_irq_nrs[0]], pic[pci_irq_nrs[1]],
-                                pic[pci_irq_nrs[2]], pic[pci_irq_nrs[3]],
+                                qdev_get_gpio_in(uicdev, pci_irq_nrs[0]),
+                                qdev_get_gpio_in(uicdev, pci_irq_nrs[1]),
+                                qdev_get_gpio_in(uicdev, pci_irq_nrs[2]),
+                                qdev_get_gpio_in(uicdev, pci_irq_nrs[3]),
                                 NULL);
     pcibus = (PCIBus *)qdev_get_child_bus(dev, "pci.0");
     if (!pcibus) {
@@ -223,12 +237,14 @@ static void bamboo_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), PPC440EP_PCI_IO, isa);
 
     if (serial_hd(0) != NULL) {
-        serial_mm_init(address_space_mem, 0xef600300, 0, pic[0],
+        serial_mm_init(address_space_mem, 0xef600300, 0,
+                       qdev_get_gpio_in(uicdev, 0),
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
                        DEVICE_BIG_ENDIAN);
     }
     if (serial_hd(1) != NULL) {
-        serial_mm_init(address_space_mem, 0xef600400, 0, pic[1],
+        serial_mm_init(address_space_mem, 0xef600400, 0,
+                       qdev_get_gpio_in(uicdev, 1),
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
                        DEVICE_BIG_ENDIAN);
     }
-- 
2.29.2


