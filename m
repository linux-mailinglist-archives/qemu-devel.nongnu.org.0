Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC902E2F99
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 02:33:08 +0100 (CET)
Received: from localhost ([::1]:53762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktKvj-0000SD-TH
	for lists+qemu-devel@lfdr.de; Sat, 26 Dec 2020 20:33:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktKkT-0008Qs-CU
 for qemu-devel@nongnu.org; Sat, 26 Dec 2020 20:21:29 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:61514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktKkR-0001DO-QM
 for qemu-devel@nongnu.org; Sat, 26 Dec 2020 20:21:29 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6DB137470E8;
 Sun, 27 Dec 2020 02:21:18 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DA2637470F0; Sun, 27 Dec 2020 02:21:17 +0100 (CET)
Message-Id: <9258083b42c06413f79cbe9340731345948db5b5.1609031406.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609031406.git.balaton@eik.bme.hu>
References: <cover.1609031406.git.balaton@eik.bme.hu>
Subject: [PATCH 07/12] vt82c686: Remove vt82c686b_isa_init() function
Date: Sun, 27 Dec 2020 02:10:06 +0100
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

Also rename VT82C686B type to lower case to match other device names.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/vt82c686.c         | 9 ---------
 hw/mips/fuloong2e.c       | 4 +++-
 include/hw/isa/vt82c686.h | 3 +--
 3 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 758c54172b..1c1239cade 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -49,7 +49,6 @@ struct VT82C686BState {
     SuperIOConfig superio_conf;
 };
 
-#define TYPE_VT82C686B "VT82C686B"
 OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BState, VT82C686B)
 
 static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
@@ -367,14 +366,6 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
                                 &vt82c->superio);
 }
 
-ISABus *vt82c686b_isa_init(PCIBus *bus, int devfn)
-{
-    PCIDevice *d;
-
-    d = pci_create_simple_multifunction(bus, devfn, true, TYPE_VT82C686B);
-    return ISA_BUS(qdev_get_child_bus(DEVICE(d), "isa.0"));
-}
-
 static void via_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 3b0489f781..60d2020033 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -240,7 +240,9 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
     ISABus *isa_bus;
     PCIDevice *dev;
 
-    isa_bus = vt82c686b_isa_init(pci_bus, PCI_DEVFN(slot, 0));
+    dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
+                                          TYPE_VT82C686B);
+    isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(dev), "isa.0"));
     assert(isa_bus);
     *p_isa_bus = isa_bus;
     /* Interrupt controller */
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index ff80a926dc..89e205a1be 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -1,13 +1,12 @@
 #ifndef HW_VT82C686_H
 #define HW_VT82C686_H
 
-
+#define TYPE_VT82C686B "vt82c686b"
 #define TYPE_VT82C686B_SUPERIO "vt82c686b-superio"
 #define TYPE_VIA_AC97 "via-ac97"
 #define TYPE_VIA_MC97 "via-mc97"
 
 /* vt82c686.c */
-ISABus *vt82c686b_isa_init(PCIBus * bus, int devfn);
 I2CBus *vt82c686b_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
                           qemu_irq sci_irq);
 
-- 
2.21.3


