Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CEC5BB4A6
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 01:09:50 +0200 (CEST)
Received: from localhost ([::1]:42814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZKSz-0007fD-H2
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 19:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oZKQj-0001es-T2; Fri, 16 Sep 2022 19:07:29 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:18356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oZKQf-0000Wn-5N; Fri, 16 Sep 2022 19:07:28 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9F15975A164;
 Sat, 17 Sep 2022 01:07:22 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7A75975A15D; Sat, 17 Sep 2022 01:07:22 +0200 (CEST)
Message-Id: <29ab3c7737866916760f824547bd1beed0c6806b.1663368422.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1663368422.git.balaton@eik.bme.hu>
References: <cover.1663368422.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 04/10] mac_newworld: Simplify creation of Uninorth devices
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Sat, 17 Sep 2022 01:07:22 +0200 (CEST)
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid open coding sysbus_create_simple where not necessary and
reorganise code a bit to avoid some casts to make the code more
readable.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/mac_newworld.c | 50 ++++++++++++++++---------------------------
 1 file changed, 19 insertions(+), 31 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 6bc3bd19be..1038477793 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -228,13 +228,6 @@ static void ppc_core99_init(MachineState *machine)
         }
     }
 
-    /* UniN init */
-    dev = qdev_new(TYPE_UNI_NORTH);
-    s = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(s, &error_fatal);
-    memory_region_add_subregion(get_system_memory(), 0xf8000000,
-                                sysbus_mmio_get_region(s, 0));
-
     openpic_irqs = g_new0(IrqLines, machine->smp.cpus);
     for (i = 0; i < machine->smp.cpus; i++) {
         /* Mac99 IRQ connection between OpenPIC outputs pins
@@ -275,56 +268,51 @@ static void ppc_core99_init(MachineState *machine)
         }
     }
 
+    /* UniN init */
+    sysbus_create_simple(TYPE_UNI_NORTH, 0xf8000000, NULL);
+
     if (PPC_INPUT(env) == PPC_FLAGS_INPUT_970) {
+        machine_arch = ARCH_MAC99_U3;
         /* 970 gets a U3 bus */
         /* Uninorth AGP bus */
-        dev = qdev_new(TYPE_U3_AGP_HOST_BRIDGE);
-        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-        uninorth_pci = U3_AGP_HOST_BRIDGE(dev);
-        s = SYS_BUS_DEVICE(dev);
+        s = SYS_BUS_DEVICE(sysbus_create_simple(TYPE_U3_AGP_HOST_BRIDGE,
+                                                0xf0800000, NULL));
+        uninorth_pci = U3_AGP_HOST_BRIDGE(s);
+        sysbus_mmio_map(s, 1, 0xf0c00000);
         /* PCI hole */
         memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
                                     sysbus_mmio_get_region(s, 2));
         /* Register 8 MB of ISA IO space */
         memory_region_add_subregion(get_system_memory(), 0xf2000000,
                                     sysbus_mmio_get_region(s, 3));
-        sysbus_mmio_map(s, 0, 0xf0800000);
-        sysbus_mmio_map(s, 1, 0xf0c00000);
-
-        machine_arch = ARCH_MAC99_U3;
     } else {
+        machine_arch = ARCH_MAC99;
         /* Use values found on a real PowerMac */
         /* Uninorth AGP bus */
-        uninorth_agp_dev = qdev_new(TYPE_UNI_NORTH_AGP_HOST_BRIDGE);
-        s = SYS_BUS_DEVICE(uninorth_agp_dev);
-        sysbus_realize_and_unref(s, &error_fatal);
-        sysbus_mmio_map(s, 0, 0xf0800000);
-        sysbus_mmio_map(s, 1, 0xf0c00000);
+        uninorth_agp_dev = sysbus_create_simple(TYPE_UNI_NORTH_AGP_HOST_BRIDGE,
+                                                0xf0800000, NULL);
+        sysbus_mmio_map(SYS_BUS_DEVICE(uninorth_agp_dev), 1, 0xf0c00000);
 
         /* Uninorth internal bus */
-        uninorth_internal_dev = qdev_new(
-                                TYPE_UNI_NORTH_INTERNAL_PCI_HOST_BRIDGE);
-        s = SYS_BUS_DEVICE(uninorth_internal_dev);
-        sysbus_realize_and_unref(s, &error_fatal);
-        sysbus_mmio_map(s, 0, 0xf4800000);
-        sysbus_mmio_map(s, 1, 0xf4c00000);
+        uninorth_internal_dev = sysbus_create_simple(
+                                       TYPE_UNI_NORTH_INTERNAL_PCI_HOST_BRIDGE,
+                                                     0xf4800000, NULL);
+        sysbus_mmio_map(SYS_BUS_DEVICE(uninorth_internal_dev), 1, 0xf4c00000);
 
         /* Uninorth main bus */
         dev = qdev_new(TYPE_UNI_NORTH_PCI_HOST_BRIDGE);
         qdev_prop_set_uint32(dev, "ofw-addr", 0xf2000000);
-        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
         uninorth_pci = UNI_NORTH_PCI_HOST_BRIDGE(dev);
         s = SYS_BUS_DEVICE(dev);
+        sysbus_realize_and_unref(s, &error_fatal);
+        sysbus_mmio_map(s, 0, 0xf2800000);
+        sysbus_mmio_map(s, 1, 0xf2c00000);
         /* PCI hole */
         memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
                                     sysbus_mmio_get_region(s, 2));
         /* Register 8 MB of ISA IO space */
         memory_region_add_subregion(get_system_memory(), 0xf2000000,
                                     sysbus_mmio_get_region(s, 3));
-        sysbus_mmio_map(s, 0, 0xf2800000);
-        sysbus_mmio_map(s, 1, 0xf2c00000);
-
-        machine_arch = ARCH_MAC99;
     }
 
     machine->usb |= defaults_enabled() && !machine->usb_disabled;
-- 
2.30.4


