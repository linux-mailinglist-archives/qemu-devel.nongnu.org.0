Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 921332E86FC
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 12:19:07 +0100 (CET)
Received: from localhost ([::1]:58112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvew6-00069Y-Ij
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 06:19:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kveqq-0000kN-Fw
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 06:13:40 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:56502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kveqo-000771-OR
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 06:13:40 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D5511747642;
 Sat,  2 Jan 2021 12:13:30 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F0AFC747601; Sat,  2 Jan 2021 12:13:29 +0100 (CET)
Message-Id: <a70982b32f11222d335385b90749abb6cf2e2cce.1609584216.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609584215.git.balaton@eik.bme.hu>
References: <cover.1609584215.git.balaton@eik.bme.hu>
Subject: [PATCH 08/24] vt82c686: Remove legacy vt82c686b_pm_init() function
Date: Sat, 02 Jan 2021 11:43:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
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
Cc: Huacai Chen <chenhuacai@kernel.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

Remove legacy vt82c686b_pm_init() function and also rename
VT82C686B_PM type name to match other device names.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c         | 18 ------------------
 hw/mips/fuloong2e.c       |  5 ++++-
 include/hw/isa/vt82c686.h |  5 +----
 3 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 2912c253dc..cd87ec0103 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -12,7 +12,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/isa/vt82c686.h"
-#include "hw/i2c/i2c.h"
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
 #include "hw/isa/isa.h"
@@ -167,7 +166,6 @@ struct VT686PMState {
     uint32_t smb_io_base;
 };
 
-#define TYPE_VT82C686B_PM "VT82C686B_PM"
 OBJECT_DECLARE_SIMPLE_TYPE(VT686PMState, VT82C686B_PM)
 
 static void pm_update_sci(VT686PMState *s)
@@ -271,22 +269,6 @@ static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
     acpi_pm1_cnt_init(&s->ar, &s->io, false, false, 2);
 }
 
-I2CBus *vt82c686b_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                          qemu_irq sci_irq)
-{
-    PCIDevice *dev;
-    VT686PMState *s;
-
-    dev = pci_new(devfn, TYPE_VT82C686B_PM);
-    qdev_prop_set_uint32(&dev->qdev, "smb_io_base", smb_io_base);
-
-    s = VT82C686B_PM(dev);
-
-    pci_realize_and_unref(dev, bus, &error_fatal);
-
-    return s->smb.smbus;
-}
-
 static Property via_pm_properties[] = {
     DEFINE_PROP_UINT32("smb_io_base", VT686PMState, smb_io_base, 0),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index fe191e8a9c..f393509633 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -263,7 +263,10 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
     pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
     pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), "vt82c686b-usb-uhci");
 
-    *i2c_bus = vt82c686b_pm_init(pci_bus, PCI_DEVFN(slot, 4), 0xeee1, NULL);
+    dev = pci_new(PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
+    qdev_prop_set_uint32(DEVICE(dev), "smb_io_base", 0xeee1);
+    pci_realize_and_unref(dev, pci_bus, &error_fatal);
+    *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
 
     /* Audio support */
     pci_create_simple(pci_bus, PCI_DEVFN(slot, 5), TYPE_VIA_AC97);
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index 8d2d276fe1..5b0a1ffe72 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -3,11 +3,8 @@
 
 #define TYPE_VT82C686B_ISA "vt82c686b-isa"
 #define TYPE_VT82C686B_SUPERIO "vt82c686b-superio"
+#define TYPE_VT82C686B_PM "vt82c686b-pm"
 #define TYPE_VIA_AC97 "via-ac97"
 #define TYPE_VIA_MC97 "via-mc97"
 
-/* vt82c686.c */
-I2CBus *vt82c686b_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                          qemu_irq sci_irq);
-
 #endif
-- 
2.21.3


