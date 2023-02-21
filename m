Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F57C69E7D9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 19:46:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUXcg-0007Qu-33; Tue, 21 Feb 2023 13:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUXcc-0007PY-D9; Tue, 21 Feb 2023 13:44:14 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUXcY-0006hS-C4; Tue, 21 Feb 2023 13:44:14 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7E6EB746FCF;
 Tue, 21 Feb 2023 19:44:02 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 548B5746F32; Tue, 21 Feb 2023 19:44:02 +0100 (CET)
Message-Id: <8e99d399ce86ca97e4eb7b0afe60e8ca61c9536f.1677004415.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1677004414.git.balaton@eik.bme.hu>
References: <cover.1677004414.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 1/5] hw/isa/vt82c686: Implement interrupt routing in
 via_isa_set_irq
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, philmd@redhat.com
Date: Tue, 21 Feb 2023 19:44:02 +0100 (CET)
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

The VIA intergrated south bridge chips combine several functions and
allow routing their interrupts to any of the ISA IRQs (also allowing
multiple components to share the same ISA IRQ, e.g. pegasos2 firmware
configures USB, sound and PCI to use IRQ 9). Currently components call
via_isa_set_irq() to directly set the ISA IRQ they are mapped to.
Change this that instead of an ISA IRQ number via_isa_set_irq() takes
interrupt source and the component that wants to change the IRQ and
keeps track of interrupt status of each source separately and does the
mapping to ISA IRQ within the ISA bridge to allow different sources to
control the same ISA IRQ lines.

This patch may not handle cases when the ISA IRQ is also controlled by
devices directly, not going through via_isa_set_irq() such as serial,
parallel or keyboard but these IRQs being conventionally fixed are not
likely for guests to change or share with other devices so this does
not cause a problem in practice and limits the complexity of this
change to what is needed for the guests we care about.

This patch is preliminary for fixing PCI device interrupts on pegasos2.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ide/via.c               |  2 +-
 hw/isa/vt82c686.c          | 40 +++++++++++++++++++++++++++++++++++---
 hw/usb/vt82c686-uhci-pci.c |  5 +----
 include/hw/isa/vt82c686.h  |  9 ++++++++-
 4 files changed, 47 insertions(+), 9 deletions(-)

diff --git a/hw/ide/via.c b/hw/ide/via.c
index e1a429405d..c2c182bf1a 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -112,7 +112,7 @@ static void via_ide_set_irq(void *opaque, int n, int level)
         d->config[0x70 + n * 8] &= ~0x80;
     }
 
-    via_isa_set_irq(pci_get_function_0(d), 14 + n, level);
+    via_isa_set_irq(d, VIA_IRQ_IDE0 + n, level);
 }
 
 static void via_ide_reset(DeviceState *dev)
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 3f9bd0c04d..1972063903 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -549,6 +549,7 @@ struct ViaISAState {
     PCIDevice dev;
     qemu_irq cpu_intr;
     qemu_irq *isa_irqs;
+    uint16_t isa_irq_state[ISA_NUM_IRQS];
     ViaSuperIOState via_sio;
     RTCState rtc;
     PCIIDEState ide;
@@ -592,10 +593,43 @@ static const TypeInfo via_isa_info = {
     },
 };
 
-void via_isa_set_irq(PCIDevice *d, int n, int level)
+void via_isa_set_irq(PCIDevice *d, ViaISAIRQSourceBit n, int level)
 {
-    ViaISAState *s = VIA_ISA(d);
-    qemu_set_irq(s->isa_irqs[n], level);
+    ViaISAState *s = VIA_ISA(pci_get_function_0(d));
+    uint8_t isa_irq = 0, max_irq = 15;
+
+    if (n == VIA_IRQ_USB0 && d == PCI_DEVICE(&s->uhci[1])) {
+        n++;
+    }
+    switch (n) {
+    case VIA_IRQ_IDE0:
+        isa_irq = 14;
+        break;
+    case VIA_IRQ_IDE1:
+        isa_irq = 15;
+        break;
+    case VIA_IRQ_USB0:
+    case VIA_IRQ_USB1:
+        max_irq = 14;
+        isa_irq = d->config[PCI_INTERRUPT_LINE];
+        break;
+    }
+
+    if (unlikely(isa_irq > max_irq || isa_irq == 2)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid ISA IRQ routing %d for %d",
+                      isa_irq, n);
+        return;
+    }
+    if (!isa_irq) {
+        return;
+    }
+
+    if (level) {
+        s->isa_irq_state[isa_irq] |= BIT(n);
+    } else {
+        s->isa_irq_state[isa_irq] &= ~BIT(n);
+    }
+    qemu_set_irq(s->isa_irqs[isa_irq], !!s->isa_irq_state[isa_irq]);
 }
 
 static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
index 46a901f56f..2681be3cec 100644
--- a/hw/usb/vt82c686-uhci-pci.c
+++ b/hw/usb/vt82c686-uhci-pci.c
@@ -6,10 +6,7 @@
 static void uhci_isa_set_irq(void *opaque, int irq_num, int level)
 {
     UHCIState *s = opaque;
-    uint8_t irq = pci_get_byte(s->dev.config + PCI_INTERRUPT_LINE);
-    if (irq > 0 && irq < 15) {
-        via_isa_set_irq(pci_get_function_0(&s->dev), irq, level);
-    }
+    via_isa_set_irq(&s->dev, VIA_IRQ_USB0, level);
 }
 
 static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index e273cd38dc..a0f9f80401 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -9,6 +9,13 @@
 #define TYPE_VIA_IDE "via-ide"
 #define TYPE_VIA_MC97 "via-mc97"
 
-void via_isa_set_irq(PCIDevice *d, int n, int level);
+typedef enum {
+    VIA_IRQ_IDE0 = 0,
+    VIA_IRQ_IDE1 = 1,
+    VIA_IRQ_USB0 = 2,
+    VIA_IRQ_USB1 = 3,
+} ViaISAIRQSourceBit;
+
+void via_isa_set_irq(PCIDevice *d, ViaISAIRQSourceBit n, int level);
 
 #endif
-- 
2.30.7


