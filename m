Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423165F377C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 23:11:02 +0200 (CEST)
Received: from localhost ([::1]:60394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofSiL-0003l5-AD
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 17:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ofRoj-00055h-JL; Mon, 03 Oct 2022 16:13:38 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:20455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ofRoh-00010G-Qi; Mon, 03 Oct 2022 16:13:33 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 58F4275A15B;
 Mon,  3 Oct 2022 22:13:20 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3596375A157; Mon,  3 Oct 2022 22:13:20 +0200 (CEST)
Message-Id: <f3ed20267d28e7b1f91b83b9bbfae1a6f4e4c133.1664827008.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1664827008.git.balaton@eik.bme.hu>
References: <cover.1664827008.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 06/13] mac_newworld: Clean up creation of Uninorth devices
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Mon,  3 Oct 2022 22:13:20 +0200 (CEST)
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

Map regions in ascending order and reorganise code a bit to avoid some
casts and move Uninorth parts together.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/mac_newworld.c | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 73b01e8c6d..be2cb5f057 100644
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
@@ -275,24 +268,31 @@ static void ppc_core99_init(MachineState *machine)
         }
     }
 
+    /* UniN init */
+    s = SYS_BUS_DEVICE(qdev_new(TYPE_UNI_NORTH));
+    sysbus_realize_and_unref(s, &error_fatal);
+    memory_region_add_subregion(get_system_memory(), 0xf8000000,
+                                sysbus_mmio_get_region(s, 0));
+
+
     if (PPC_INPUT(env) == PPC_FLAGS_INPUT_970) {
+        machine_arch = ARCH_MAC99_U3;
         /* 970 gets a U3 bus */
         /* Uninorth AGP bus */
         dev = qdev_new(TYPE_U3_AGP_HOST_BRIDGE);
-        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
         uninorth_pci = U3_AGP_HOST_BRIDGE(dev);
         s = SYS_BUS_DEVICE(dev);
+        sysbus_realize_and_unref(s, &error_fatal);
+        sysbus_mmio_map(s, 0, 0xf0800000);
+        sysbus_mmio_map(s, 1, 0xf0c00000);
         /* PCI hole */
-        memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
+        memory_region_add_subregion(get_system_memory(), 0x80000000,
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
         uninorth_agp_dev = qdev_new(TYPE_UNI_NORTH_AGP_HOST_BRIDGE);
@@ -309,22 +309,20 @@ static void ppc_core99_init(MachineState *machine)
         sysbus_mmio_map(s, 0, 0xf4800000);
         sysbus_mmio_map(s, 1, 0xf4c00000);
 
-        /* Uninorth main bus */
+        /* Uninorth main bus - this must be last to make it the default */
         dev = qdev_new(TYPE_UNI_NORTH_PCI_HOST_BRIDGE);
         qdev_prop_set_uint32(dev, "ofw-addr", 0xf2000000);
-        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
         uninorth_pci = UNI_NORTH_PCI_HOST_BRIDGE(dev);
         s = SYS_BUS_DEVICE(dev);
+        sysbus_realize_and_unref(s, &error_fatal);
+        sysbus_mmio_map(s, 0, 0xf2800000);
+        sysbus_mmio_map(s, 1, 0xf2c00000);
         /* PCI hole */
-        memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
+        memory_region_add_subregion(get_system_memory(), 0x80000000,
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


