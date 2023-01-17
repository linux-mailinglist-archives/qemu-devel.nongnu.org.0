Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D96666E8BB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 22:48:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHtod-0007pl-5i; Tue, 17 Jan 2023 16:48:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pHtoU-0007pI-4S; Tue, 17 Jan 2023 16:48:19 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pHtoR-0004Mq-OH; Tue, 17 Jan 2023 16:48:13 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 950F374638A;
 Tue, 17 Jan 2023 22:45:45 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5E191746369; Tue, 17 Jan 2023 22:45:45 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Tue, 17 Jan 2023 22:36:42 +0100
Subject: [PATCH] ppc/pegasos2: Improve readability of VIA south bridge creation
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: philmd@linaro.org
Message-Id: <20230117214545.5E191746369@zero.eik.bme.hu>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Slightly improve readability of creating the south btidge by cnamging
type of a local variable to avoid some casts within function arguments
which makes some lines shorter and easier to read.
Also remove an unneded line break.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/pegasos2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index f46d4bf51d..1a13632ba6 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -102,7 +102,8 @@ static void pegasos2_init(MachineState *machine)
     CPUPPCState *env;
     MemoryRegion *rom = g_new(MemoryRegion, 1);
     PCIBus *pci_bus;
-    PCIDevice *dev, *via;
+    Object *via;
+    PCIDevice *dev;
     I2CBus *i2c_bus;
     const char *fwname = machine->firmware ?: PROM_FILENAME;
     char *filename;
@@ -159,19 +160,18 @@ static void pegasos2_init(MachineState *machine)
     pci_bus = mv64361_get_pci_bus(pm->mv, 1);
 
     /* VIA VT8231 South Bridge (multifunction PCI device) */
-    via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
-                                          TYPE_VT8231_ISA);
+    via = OBJECT(pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0),
+                                                 true, TYPE_VT8231_ISA));
     object_property_add_alias(OBJECT(machine), "rtc-time",
-                              object_resolve_path_component(OBJECT(via),
-                                                            "rtc"),
+                              object_resolve_path_component(via, "rtc"),
                               "date");
     qdev_connect_gpio_out(DEVICE(via), 0,
                           qdev_get_gpio_in_named(pm->mv, "gpp", 31));
 
-    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
+    dev = PCI_DEVICE(object_resolve_path_component(via, "ide"));
     pci_ide_create_devs(dev);
 
-    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"));
+    dev = PCI_DEVICE(object_resolve_path_component(via, "pm"));
     i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
     spd_data = spd_data_generate(DDR, machine->ram_size);
     smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);
-- 
2.30.6


