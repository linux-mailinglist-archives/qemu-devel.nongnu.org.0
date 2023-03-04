Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CC56AAA8C
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 15:49:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYTBc-0004a5-Lo; Sat, 04 Mar 2023 09:48:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pYTBa-0004Xq-F0; Sat, 04 Mar 2023 09:48:34 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pYTBZ-00028P-1N; Sat, 04 Mar 2023 09:48:34 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 491A6746F31;
 Sat,  4 Mar 2023 15:48:25 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 27576746F2F; Sat,  4 Mar 2023 15:48:25 +0100 (CET)
Message-Id: <efbc0d65155a7b586ac154709129f4cc0add18ba.1677940224.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1677940224.git.balaton@eik.bme.hu>
References: <cover.1677940224.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 7/7] Revert "hw/isa/vt82c686: Remove intermediate IRQ
 forwarder"
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de
Date: Sat,  4 Mar 2023 15:48:25 +0100 (CET)
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

This partially reverts commit bb98e0f59cde846666d9fddc60ae74ef7ddfca17
keeping the rename of a state field but reverting other cahanges which
break interrupts on pegasos2.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Tested-by: Rene Engel <ReneEngel80@emailn.de>
---
 hw/isa/vt82c686.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 147ac78051..ec108d992b 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -598,6 +598,12 @@ void via_isa_set_irq(PCIDevice *d, int n, int level)
     qemu_set_irq(s->isa_irqs_in[n], level);
 }
 
+static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
+{
+    ViaISAState *s = opaque;
+    qemu_set_irq(s->cpu_intr, level);
+}
+
 static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
 {
     switch (irq_num) {
@@ -639,10 +645,12 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     ViaISAState *s = VIA_ISA(d);
     DeviceState *dev = DEVICE(d);
     PCIBus *pci_bus = pci_get_bus(d);
+    qemu_irq *isa_irq;
     ISABus *isa_bus;
     int i;
 
     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
+    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
     isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
                           errp);
 
@@ -650,7 +658,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
         return;
     }
 
-    s->isa_irqs_in = i8259_init(isa_bus, s->cpu_intr);
+    s->isa_irqs_in = i8259_init(isa_bus, *isa_irq);
     isa_bus_register_input_irqs(isa_bus, s->isa_irqs_in);
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
     i8257_dma_init(isa_bus, 0);
-- 
2.30.8


