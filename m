Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9594227FB
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 15:34:52 +0200 (CEST)
Received: from localhost ([::1]:46786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXkap-0002mz-9y
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 09:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mXkNG-0005aP-GC
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:20:50 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:45600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mXkNC-0000vj-GL
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:20:49 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E3D7B7462D3;
 Tue,  5 Oct 2021 15:20:41 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B884E745953; Tue,  5 Oct 2021 15:20:41 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI interrupts
Date: Tue, 05 Oct 2021 15:12:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
Message-Id: <20211005132041.B884E745953@zero.eik.bme.hu>
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

This device is part of a superio/ISA bridge chip and IRQs from it are
routed to an ISA interrupt set by the Interrupt Line PCI config
register. Change uhci_update_irq() to allow this and use it from
vt82c686-uhci-pci.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2: Do it differently to confine isa reference to vt82c686-uhci-pci as
hcd-uhci is also used on machines that don't have isa. Left Jiaxun's
R-b there as he checked it's the same for VT82C686B and gave R-b for
the approach which still holds but speak up if you tink otherwise.

 hw/usb/hcd-uhci.c          | 15 +++++++++------
 hw/usb/hcd-uhci.h          |  8 +++++---
 hw/usb/vt82c686-uhci-pci.c | 10 ++++++++++
 3 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index 0cb02a6432..7924cfffdb 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -288,9 +288,14 @@ static UHCIAsync *uhci_async_find_td(UHCIState *s, uint32_t td_addr)
     return NULL;
 }
 
+static void uhci_pci_set_irq(UHCIState *s, int level)
+{
+    pci_set_irq(&s->dev, level);
+}
+
 static void uhci_update_irq(UHCIState *s)
 {
-    int level;
+    int level = 0;
     if (((s->status2 & 1) && (s->intr & (1 << 2))) ||
         ((s->status2 & 2) && (s->intr & (1 << 3))) ||
         ((s->status & UHCI_STS_USBERR) && (s->intr & (1 << 0))) ||
@@ -298,10 +303,8 @@ static void uhci_update_irq(UHCIState *s)
         (s->status & UHCI_STS_HSERR) ||
         (s->status & UHCI_STS_HCPERR)) {
         level = 1;
-    } else {
-        level = 0;
     }
-    pci_set_irq(&s->dev, level);
+    s->set_irq(s, level);
 }
 
 static void uhci_reset(DeviceState *dev)
@@ -1170,9 +1173,9 @@ void usb_uhci_common_realize(PCIDevice *dev, Error **errp)
 
     pci_conf[PCI_CLASS_PROG] = 0x00;
     /* TODO: reset value should be 0. */
-    pci_conf[USB_SBRN] = USB_RELEASE_1; // release number
-
+    pci_conf[USB_SBRN] = USB_RELEASE_1; /* release number */
     pci_config_set_interrupt_pin(pci_conf, u->info.irq_pin + 1);
+    s->set_irq = uhci_pci_set_irq;
 
     if (s->masterbus) {
         USBPort *ports[NB_PORTS];
diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
index e61d8fcb19..ecd19762d6 100644
--- a/hw/usb/hcd-uhci.h
+++ b/hw/usb/hcd-uhci.h
@@ -42,7 +42,9 @@ typedef struct UHCIPort {
     uint16_t ctrl;
 } UHCIPort;
 
-typedef struct UHCIState {
+typedef struct UHCIState UHCIState;
+
+struct UHCIState {
     PCIDevice dev;
     MemoryRegion io_bar;
     USBBus bus; /* Note unused when we're a companion controller */
@@ -60,7 +62,7 @@ typedef struct UHCIState {
     uint32_t frame_bandwidth;
     bool completions_only;
     UHCIPort ports[NB_PORTS];
-
+    void (*set_irq)(UHCIState *s, int level);
     /* Interrupts that should be raised at the end of the current frame.  */
     uint32_t pending_int_mask;
 
@@ -72,7 +74,7 @@ typedef struct UHCIState {
     char *masterbus;
     uint32_t firstport;
     uint32_t maxframes;
-} UHCIState;
+};
 
 #define TYPE_UHCI "pci-uhci-usb"
 DECLARE_INSTANCE_CHECKER(UHCIState, UHCI, TYPE_UHCI)
diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
index b109c21603..f6bae704be 100644
--- a/hw/usb/vt82c686-uhci-pci.c
+++ b/hw/usb/vt82c686-uhci-pci.c
@@ -1,6 +1,15 @@
 #include "qemu/osdep.h"
+#include "hw/irq.h"
 #include "hcd-uhci.h"
 
+static void uhci_isa_set_irq(UHCIState *s, int level)
+{
+    uint8_t irq = pci_get_byte(s->dev.config + PCI_INTERRUPT_LINE);
+    if (irq > 0 && irq < 15) {
+        qemu_set_irq(isa_get_irq(NULL, irq), level);
+    }
+}
+
 static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
 {
     UHCIState *s = UHCI(dev);
@@ -14,6 +23,7 @@ static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
     pci_set_long(pci_conf + 0xc0, 0x00002000);
 
     usb_uhci_common_realize(dev, errp);
+    s->set_irq = uhci_isa_set_irq;
 }
 
 static UHCIInfo uhci_info[] = {
-- 
2.21.4


