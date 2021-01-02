Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401F52E86F7
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 12:16:45 +0100 (CET)
Received: from localhost ([::1]:49546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kveto-0002ZA-As
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 06:16:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kveqp-0000hj-7g
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 06:13:39 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:56501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kveqn-00075r-LC
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 06:13:39 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CD95E747641;
 Sat,  2 Jan 2021 12:13:30 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EC3707475FF; Sat,  2 Jan 2021 12:13:29 +0100 (CET)
Message-Id: <58d7585f979f154b1f1e69fdc026eed6dbc7996f.1609584216.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609584215.git.balaton@eik.bme.hu>
References: <cover.1609584215.git.balaton@eik.bme.hu>
Subject: [PATCH 07/24] vt82c686: Remove legacy vt82c686b_isa_init() function
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

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c         | 9 ---------
 hw/mips/fuloong2e.c       | 4 +++-
 include/hw/isa/vt82c686.h | 3 +--
 3 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 9567326d8e..2912c253dc 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -49,7 +49,6 @@ struct VT82C686BISAState {
     SuperIOConfig superio_conf;
 };
 
-#define TYPE_VT82C686B_ISA "vt82c686b-isa"
 OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
 
 static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
@@ -367,14 +366,6 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
                                 &vt82c->superio);
 }
 
-ISABus *vt82c686b_isa_init(PCIBus *bus, int devfn)
-{
-    PCIDevice *d;
-
-    d = pci_create_simple_multifunction(bus, devfn, true, TYPE_VT82C686B_ISA);
-    return ISA_BUS(qdev_get_child_bus(DEVICE(d), "isa.0"));
-}
-
 static void via_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 941d6642c3..fe191e8a9c 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -240,7 +240,9 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
     ISABus *isa_bus;
     PCIDevice *dev;
 
-    isa_bus = vt82c686b_isa_init(pci_bus, PCI_DEVFN(slot, 0));
+    dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
+                                          TYPE_VT82C686B_ISA);
+    isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(dev), "isa.0"));
     assert(isa_bus);
     *p_isa_bus = isa_bus;
     /* Interrupt controller */
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index ff80a926dc..8d2d276fe1 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -1,13 +1,12 @@
 #ifndef HW_VT82C686_H
 #define HW_VT82C686_H
 
-
+#define TYPE_VT82C686B_ISA "vt82c686b-isa"
 #define TYPE_VT82C686B_SUPERIO "vt82c686b-superio"
 #define TYPE_VIA_AC97 "via-ac97"
 #define TYPE_VIA_MC97 "via-mc97"
 
 /* vt82c686.c */
-ISABus *vt82c686b_isa_init(PCIBus * bus, int devfn);
 I2CBus *vt82c686b_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
                           qemu_irq sci_irq);
 
-- 
2.21.3


