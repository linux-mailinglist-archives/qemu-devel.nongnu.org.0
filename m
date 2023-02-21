Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B40269E7D3
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 19:45:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUXcf-0007Qp-S4; Tue, 21 Feb 2023 13:44:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUXcc-0007PK-DM; Tue, 21 Feb 2023 13:44:14 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUXcY-0006hW-Bc; Tue, 21 Feb 2023 13:44:13 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7CDAC7470B1;
 Tue, 21 Feb 2023 19:44:03 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5C7307470B0; Tue, 21 Feb 2023 19:44:03 +0100 (CET)
Message-Id: <cada8dcd2ed9e1bdb78b75ccd4c2708806a95a2f.1677004415.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1677004414.git.balaton@eik.bme.hu>
References: <cover.1677004414.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 2/5] hw/isa/vt82c686: Implement PIRQ pins
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, philmd@redhat.com
Date: Tue, 21 Feb 2023 19:44:03 +0100 (CET)
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

The chip has 4 pins (called PIRQA-D in VT82C686B and PINTA-D in
VT8231) that are meant to be connected to PCI IRQ lines and allow
routing PCI interrupts to the ISA PIC. Add gpio inputs to model these.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/vt82c686.c         | 18 ++++++++++++++++++
 include/hw/isa/vt82c686.h |  4 ++++
 2 files changed, 22 insertions(+)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 1972063903..f31b2fa7ca 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -613,6 +613,18 @@ void via_isa_set_irq(PCIDevice *d, ViaISAIRQSourceBit n, int level)
         max_irq = 14;
         isa_irq = d->config[PCI_INTERRUPT_LINE];
         break;
+    case VIA_IRQ_PIRQA:
+        isa_irq = d->config[0x55] >> 4;
+        break;
+    case VIA_IRQ_PIRQB:
+        isa_irq = d->config[0x56] & 0xf;
+        break;
+    case VIA_IRQ_PIRQC:
+        isa_irq = d->config[0x56] >> 4;
+        break;
+    case VIA_IRQ_PIRQD:
+        isa_irq = d->config[0x57] >> 4;
+        break;
     }
 
     if (unlikely(isa_irq > max_irq || isa_irq == 2)) {
@@ -632,6 +644,11 @@ void via_isa_set_irq(PCIDevice *d, ViaISAIRQSourceBit n, int level)
     qemu_set_irq(s->isa_irqs[isa_irq], !!s->isa_irq_state[isa_irq]);
 }
 
+static void via_isa_pirq(void *opaque, int n, int level)
+{
+    via_isa_set_irq(opaque, VIA_IRQ_PIRQA + n, level);
+}
+
 static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
 {
     ViaISAState *s = opaque;
@@ -648,6 +665,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     int i;
 
     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
+    qdev_init_gpio_in_named(dev, via_isa_pirq, "pirq", PCI_NUM_PINS);
     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
     isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
                           errp);
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index a0f9f80401..e982c5fe26 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -14,6 +14,10 @@ typedef enum {
     VIA_IRQ_IDE1 = 1,
     VIA_IRQ_USB0 = 2,
     VIA_IRQ_USB1 = 3,
+    VIA_IRQ_PIRQA = 4,
+    VIA_IRQ_PIRQB = 5,
+    VIA_IRQ_PIRQC = 6,
+    VIA_IRQ_PIRQD = 7,
 } ViaISAIRQSourceBit;
 
 void via_isa_set_irq(PCIDevice *d, ViaISAIRQSourceBit n, int level);
-- 
2.30.7


