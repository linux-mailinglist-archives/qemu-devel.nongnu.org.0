Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C76042E616
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 03:20:09 +0200 (CEST)
Received: from localhost ([::1]:60834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbBtI-0005mc-CW
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 21:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mbBqO-0000mx-I3
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 21:17:13 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:28384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mbBqH-0006a5-Ew
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 21:17:06 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 45C3575604D;
 Fri, 15 Oct 2021 03:16:58 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C6E65748F58; Fri, 15 Oct 2021 03:16:57 +0200 (CEST)
Message-Id: <778c04dc2c8affac060b8edf9e8d7dab3c3e04eb.1634259980.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1634259980.git.balaton@eik.bme.hu>
References: <cover.1634259980.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 2/4] vt82c686: Add a method to VIA_ISA to raise ISA interrupts
Date: Fri, 15 Oct 2021 03:06:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe M-D <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Other functions in the VT82xx chips need to raise ISA interrupts. Keep
a reference to them in the device state and add via_isa_set_irq() to
allow setting their state.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/vt82c686.c         | 10 +++++++++-
 include/hw/isa/vt82c686.h |  4 ++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 5b41539f2c..8f656251b8 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -542,6 +542,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(ViaISAState, VIA_ISA)
 struct ViaISAState {
     PCIDevice dev;
     qemu_irq cpu_intr;
+    qemu_irq *isa_irqs;
     ISABus *isa_bus;
     ViaSuperIOState *via_sio;
 };
@@ -567,6 +568,12 @@ static const TypeInfo via_isa_info = {
     },
 };
 
+void via_isa_set_irq(PCIDevice *d, int n, int level)
+{
+    ViaISAState *s = VIA_ISA(d);
+    qemu_set_irq(s->isa_irqs[n], level);
+}
+
 static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
 {
     ViaISAState *s = opaque;
@@ -584,7 +591,8 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
     s->isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
                           &error_fatal);
-    isa_bus_irqs(s->isa_bus, i8259_init(s->isa_bus, *isa_irq));
+    s->isa_irqs = i8259_init(s->isa_bus, *isa_irq);
+    isa_bus_irqs(s->isa_bus, s->isa_irqs);
     i8254_pit_init(s->isa_bus, 0x40, 0, NULL);
     i8257_dma_init(s->isa_bus, 0);
     mc146818_rtc_init(s->isa_bus, 2000, NULL);
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index 0f01aaa471..56ac141be3 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -1,6 +1,8 @@
 #ifndef HW_VT82C686_H
 #define HW_VT82C686_H
 
+#include "hw/pci/pci.h"
+
 #define TYPE_VT82C686B_ISA "vt82c686b-isa"
 #define TYPE_VT82C686B_PM "vt82c686b-pm"
 #define TYPE_VT8231_ISA "vt8231-isa"
@@ -8,4 +10,6 @@
 #define TYPE_VIA_AC97 "via-ac97"
 #define TYPE_VIA_MC97 "via-mc97"
 
+void via_isa_set_irq(PCIDevice *d, int n, int level);
+
 #endif
-- 
2.21.4


