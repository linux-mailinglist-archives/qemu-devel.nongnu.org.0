Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE58439563
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 13:55:38 +0200 (CEST)
Received: from localhost ([::1]:60638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meyZl-0007TO-A5
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 07:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meyM2-0004iB-0v
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 07:41:26 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:48235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meyLx-0006rZ-OD
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 07:41:25 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0C4D075619C;
 Mon, 25 Oct 2021 13:41:16 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D4788756040; Mon, 25 Oct 2021 13:41:15 +0200 (CEST)
Message-Id: <8d7ed385e33a847d8ddc669163a68b5ca57f82ce.1635161629.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635161629.git.balaton@eik.bme.hu>
References: <cover.1635161629.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 4/4] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
Date: Mon, 25 Oct 2021 13:33:49 +0200
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

This device is part of a superio/ISA bridge chip and IRQs from it are
routed to an ISA interrupt set by the Interrupt Line PCI config
register. Implement this in a vt82c686-uhci-pci specific irq handler
Using via_isa_set_irq().

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/vt82c686-uhci-pci.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
index ea262e6d70..0bf2b72ff0 100644
--- a/hw/usb/vt82c686-uhci-pci.c
+++ b/hw/usb/vt82c686-uhci-pci.c
@@ -1,6 +1,17 @@
 #include "qemu/osdep.h"
+#include "hw/irq.h"
+#include "hw/isa/vt82c686.h"
 #include "hcd-uhci.h"
 
+static void uhci_isa_set_irq(void *opaque, int irq_num, int level)
+{
+    UHCIState *s = opaque;
+    uint8_t irq = pci_get_byte(s->dev.config + PCI_INTERRUPT_LINE);
+    if (irq > 0 && irq < 15) {
+        via_isa_set_irq(pci_get_function_0(&s->dev), irq, level);
+    }
+}
+
 static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
 {
     UHCIState *s = UHCI(dev);
@@ -14,6 +25,8 @@ static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
     pci_set_long(pci_conf + 0xc0, 0x00002000);
 
     usb_uhci_common_realize(dev, errp);
+    object_unref(s->irq);
+    s->irq = qemu_allocate_irq(uhci_isa_set_irq, s, 0);
 }
 
 static UHCIInfo uhci_info[] = {
-- 
2.21.4


