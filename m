Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676CB6ADDC1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:42:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZViI-00032v-1O; Tue, 07 Mar 2023 06:42:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZViF-00031e-R3; Tue, 07 Mar 2023 06:42:35 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZViE-00082x-6E; Tue, 07 Mar 2023 06:42:35 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F1540746361;
 Tue,  7 Mar 2023 12:42:20 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C62F6746335; Tue,  7 Mar 2023 12:42:20 +0100 (CET)
Message-Id: <fbb016c7d0e19093335c237e15f5f6c62c4393b4.1678188711.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1678188711.git.balaton@eik.bme.hu>
References: <cover.1678188711.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v9 4/7] hw/isa/vt82c686: Implement PCI IRQ routing
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
Date: Tue,  7 Mar 2023 12:42:20 +0100 (CET)
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
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Tested-by: Rene Engel <ReneEngel80@emailn.de>
---
 hw/isa/vt82c686.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 01e0148967..71da316052 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -604,6 +604,46 @@ static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
     qemu_set_irq(s->cpu_intr, level);
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
+    /* IRQ 0: disabled, IRQ 2,8,13: reserved */
+    if (!pic_irq) {
+        return;
+    }
+    if (unlikely(pic_irq == 2 || pic_irq == 8 || pic_irq == 13)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid ISA IRQ routing");
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
@@ -627,6 +667,8 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
     i8257_dma_init(isa_bus, 0);
 
+    qdev_init_gpio_in_named(dev, via_isa_set_pci_irq, "pirq", PCI_NUM_PINS);
+
     /* RTC */
     qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
-- 
2.30.8


