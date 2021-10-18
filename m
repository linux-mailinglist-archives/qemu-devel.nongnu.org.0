Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C53A431E59
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 15:58:31 +0200 (CEST)
Received: from localhost ([::1]:43710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcT9q-00077X-7v
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 09:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mcT3Z-0004qX-Lc
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:52:01 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:40698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mcT3W-00045o-Ux
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:52:01 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CE92A748F54;
 Mon, 18 Oct 2021 15:51:57 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id AF56F748F52; Mon, 18 Oct 2021 15:51:57 +0200 (CEST)
Message-Id: <3d15335e5b6a6e9603fe1f96e1c0bba7a1e2e540.1634563652.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1634563652.git.balaton@eik.bme.hu>
References: <cover.1634563652.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 6/6] hw/usb/vt82c686-uhci-pci: Optimise itq handler
Date: Mon, 18 Oct 2021 15:27:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
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

Cache the pointer to PCI function 0 (ISA bridge, that this device has
to use for IRQs) in the state struct and use that in the interrupt
handler to avoid needing to look up function 0 at every interrupt
which can be expensive.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/usb/hcd-uhci.h          | 1 +
 hw/usb/vt82c686-uhci-pci.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
index c85ab7868e..ac4e912a3f 100644
--- a/hw/usb/hcd-uhci.h
+++ b/hw/usb/hcd-uhci.h
@@ -44,6 +44,7 @@ typedef struct UHCIPort {
 
 typedef struct UHCIState {
     PCIDevice dev;
+    PCIDevice *func0; /* used when part of a superio chip */
     MemoryRegion io_bar;
     USBBus bus; /* Note unused when we're a companion controller */
     uint16_t cmd; /* cmd register */
diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
index 0bf2b72ff0..c500936af9 100644
--- a/hw/usb/vt82c686-uhci-pci.c
+++ b/hw/usb/vt82c686-uhci-pci.c
@@ -8,7 +8,7 @@ static void uhci_isa_set_irq(void *opaque, int irq_num, int level)
     UHCIState *s = opaque;
     uint8_t irq = pci_get_byte(s->dev.config + PCI_INTERRUPT_LINE);
     if (irq > 0 && irq < 15) {
-        via_isa_set_irq(pci_get_function_0(&s->dev), irq, level);
+        via_isa_set_irq(s->func0, irq, level);
     }
 }
 
@@ -25,6 +25,7 @@ static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
     pci_set_long(pci_conf + 0xc0, 0x00002000);
 
     usb_uhci_common_realize(dev, errp);
+    s->func0 = pci_get_function_0(&s->dev);
     object_unref(s->irq);
     s->irq = qemu_allocate_irq(uhci_isa_set_irq, s, 0);
 }
-- 
2.21.4


