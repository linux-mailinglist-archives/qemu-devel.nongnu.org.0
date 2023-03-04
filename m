Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119116AAA8E
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 15:50:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYTBY-0004UK-QP; Sat, 04 Mar 2023 09:48:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pYTBX-0004TT-2H; Sat, 04 Mar 2023 09:48:31 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pYTBV-00025y-Cm; Sat, 04 Mar 2023 09:48:30 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1F894746E5A;
 Sat,  4 Mar 2023 15:48:21 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E7128746E06; Sat,  4 Mar 2023 15:48:20 +0100 (CET)
Message-Id: <7c2b8906bc5fc9ac5eb8836ca2f6dc05c9046c01.1677940224.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1677940224.git.balaton@eik.bme.hu>
References: <cover.1677940224.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 3/7] hw/isa/vt82c686: Implement PCI IRQ routing
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
Date: Sat,  4 Mar 2023 15:48:20 +0100 (CET)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The real VIA south bridges implement a PCI IRQ router which is configured
by the BIOS or the OS. In order to respect these configurations, QEMU
needs to implement it as well. The real chip may allow routing IRQs from
internal functions independently of PCI interrupts but since guests
usually configute it to a single shared interrupt we don't model that
here for simplicity.

Note: The implementation was taken from piix4_set_irq() in hw/isa/piix4.

Suggested-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Tested-by: Rene Engel <ReneEngel80@emailn.de>
---
 hw/isa/vt82c686.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index f4c40965cd..51c0dd4c41 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -598,6 +598,42 @@ void via_isa_set_irq(PCIDevice *d, int n, int level)
     qemu_set_irq(s->isa_irqs_in[n], level);
 }
 
+static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
+{
+    switch (irq_num) {
+    case 0:
+        return s->dev.config[0x55] >> 4;
+    case 1:
+        return s->dev.config[0x56] & 0xf;
+    case 2:
+        return s->dev.config[0x56] >> 4;
+    case 3:
+        return s->dev.config[0x57] >> 4;
+    }
+    return 0;
+}
+
+static void via_isa_set_pci_irq(void *opaque, int irq_num, int level)
+{
+    ViaISAState *s = opaque;
+    PCIBus *bus = pci_get_bus(&s->dev);
+    int i, pic_level, pic_irq = via_isa_get_pci_irq(s, irq_num);
+
+    if (unlikely(pic_irq == 0 || pic_irq == 2 || pic_irq > 14)) {
+        return;
+    }
+
+    /* The pic level is the logical OR of all the PCI irqs mapped to it. */
+    pic_level = 0;
+    for (i = 0; i < PCI_NUM_PINS; i++) {
+        if (pic_irq == via_isa_get_pci_irq(s, i)) {
+            pic_level |= pci_bus_get_irq_level(bus, i);
+        }
+    }
+    /* Now we change the pic irq level according to the via irq mappings. */
+    qemu_set_irq(s->isa_irqs_in[pic_irq], pic_level);
+}
+
 static void via_isa_realize(PCIDevice *d, Error **errp)
 {
     ViaISAState *s = VIA_ISA(d);
@@ -619,6 +655,8 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
     i8257_dma_init(isa_bus, 0);
 
+    qdev_init_gpio_in_named(dev, via_isa_set_pci_irq, "pirq", PCI_NUM_PINS);
+
     /* RTC */
     qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
-- 
2.30.8


