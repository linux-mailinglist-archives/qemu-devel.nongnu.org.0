Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A5E2DEE38
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 11:46:13 +0100 (CET)
Received: from localhost ([::1]:55130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqZka-00086s-Fd
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 05:46:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kqZhR-0003mL-8i; Sat, 19 Dec 2020 05:42:57 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39298
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kqZhP-000368-K2; Sat, 19 Dec 2020 05:42:57 -0500
Received: from host86-191-183-22.range86-191.btcentralplus.com
 ([86.191.183.22] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kqZhI-0004BS-BU; Sat, 19 Dec 2020 10:42:53 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au,
 thuth@redhat.com
Date: Sat, 19 Dec 2020 10:42:26 +0000
Message-Id: <20201219104229.1964-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201219104229.1964-1-mark.cave-ayland@ilande.co.uk>
References: <20201219104229.1964-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.191.183.22
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 4/7] mac_newworld: delay wiring of PCI IRQs in New World
 machine
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

This is to prepare for moving the OpenPIC device into the macio-newworld
device.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ppc/mac_newworld.c | 46 ++++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index c0accda592..708bb2f1ab 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -139,6 +139,7 @@ static void ppc_core99_init(MachineState *machine)
     int machine_arch;
     SysBusDevice *s;
     DeviceState *dev, *pic_dev;
+    DeviceState *uninorth_internal_dev = NULL, *uninorth_agp_dev = NULL;
     hwaddr nvram_addr = 0xFFF04000;
     uint64_t tbfreq;
     unsigned int smp_cpus = machine->smp.cpus;
@@ -320,35 +321,24 @@ static void ppc_core99_init(MachineState *machine)
         sysbus_mmio_map(s, 0, 0xf0800000);
         sysbus_mmio_map(s, 1, 0xf0c00000);
 
-        for (i = 0; i < 4; i++) {
-            qdev_connect_gpio_out(dev, i, qdev_get_gpio_in(pic_dev, 0x1b + i));
-        }
-
         machine_arch = ARCH_MAC99_U3;
     } else {
         /* Use values found on a real PowerMac */
         /* Uninorth AGP bus */
-        dev = qdev_new(TYPE_UNI_NORTH_AGP_HOST_BRIDGE);
-        s = SYS_BUS_DEVICE(dev);
+        uninorth_agp_dev = qdev_new(TYPE_UNI_NORTH_AGP_HOST_BRIDGE);
+        s = SYS_BUS_DEVICE(uninorth_agp_dev);
         sysbus_realize_and_unref(s, &error_fatal);
         sysbus_mmio_map(s, 0, 0xf0800000);
         sysbus_mmio_map(s, 1, 0xf0c00000);
 
-        for (i = 0; i < 4; i++) {
-            qdev_connect_gpio_out(dev, i, qdev_get_gpio_in(pic_dev, 0x1b + i));
-        }
-
         /* Uninorth internal bus */
-        dev = qdev_new(TYPE_UNI_NORTH_INTERNAL_PCI_HOST_BRIDGE);
-        s = SYS_BUS_DEVICE(dev);
+        uninorth_internal_dev = qdev_new(
+                                TYPE_UNI_NORTH_INTERNAL_PCI_HOST_BRIDGE);
+        s = SYS_BUS_DEVICE(uninorth_internal_dev);
         sysbus_realize_and_unref(s, &error_fatal);
         sysbus_mmio_map(s, 0, 0xf4800000);
         sysbus_mmio_map(s, 1, 0xf4c00000);
 
-        for (i = 0; i < 4; i++) {
-            qdev_connect_gpio_out(dev, i, qdev_get_gpio_in(pic_dev, 0x1b + i));
-        }
-
         /* Uninorth main bus */
         dev = qdev_new(TYPE_UNI_NORTH_PCI_HOST_BRIDGE);
         qdev_prop_set_uint32(dev, "ofw-addr", 0xf2000000);
@@ -364,10 +354,6 @@ static void ppc_core99_init(MachineState *machine)
         sysbus_mmio_map(s, 0, 0xf2800000);
         sysbus_mmio_map(s, 1, 0xf2c00000);
 
-        for (i = 0; i < 4; i++) {
-            qdev_connect_gpio_out(dev, i, qdev_get_gpio_in(pic_dev, 0x1b + i));
-        }
-
         machine_arch = ARCH_MAC99;
     }
 
@@ -401,6 +387,26 @@ static void ppc_core99_init(MachineState *machine)
 
     pci_realize_and_unref(macio, pci_bus, &error_fatal);
 
+    for (i = 0; i < 4; i++) {
+        qdev_connect_gpio_out(DEVICE(uninorth_pci), i,
+                              qdev_get_gpio_in(pic_dev, 0x1b + i));
+    }
+
+    /* TODO: additional PCI buses only wired up for 32-bit machines */
+    if (PPC_INPUT(env) != PPC_FLAGS_INPUT_970) {
+        /* Uninorth AGP bus */
+        for (i = 0; i < 4; i++) {
+            qdev_connect_gpio_out(uninorth_agp_dev, i,
+                                  qdev_get_gpio_in(pic_dev, 0x1b + i));
+        }
+
+        /* Uninorth internal bus */
+        for (i = 0; i < 4; i++) {
+            qdev_connect_gpio_out(uninorth_internal_dev, i,
+                                  qdev_get_gpio_in(pic_dev, 0x1b + i));
+        }
+    }
+
     /* We only emulate 2 out of 3 IDE controllers for now */
     ide_drive_get(hd, ARRAY_SIZE(hd));
 
-- 
2.20.1


