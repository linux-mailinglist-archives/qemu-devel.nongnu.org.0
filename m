Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BC042E046
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 19:46:08 +0200 (CEST)
Received: from localhost ([::1]:37080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb4nv-0007TC-Sw
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 13:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb4hB-0000Mv-HC
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 13:39:09 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:53032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb4h9-000069-Vp
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 13:39:09 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 44F9175606C;
 Thu, 14 Oct 2021 19:39:06 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 19F1075605F; Thu, 14 Oct 2021 19:38:59 +0200 (CEST)
Message-Id: <c2e06c122826fa68afc095917e57187bf5a7f978.1634232746.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1634232746.git.balaton@eik.bme.hu>
References: <cover.1634232746.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 3/3] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
Date: Thu, 14 Oct 2021 19:32:26 +0200
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe M-D <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This device is part of a superio/ISA bridge chip and IRQs from it are
routed to an ISA interrupt set by the Interrupt Line PCI config
register. Implement this in a vt82c686-uhci-pci specific irq handler.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/usb/vt82c686-uhci-pci.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
index b109c21603..e70e739409 100644
--- a/hw/usb/vt82c686-uhci-pci.c
+++ b/hw/usb/vt82c686-uhci-pci.c
@@ -1,6 +1,16 @@
 #include "qemu/osdep.h"
+#include "hw/irq.h"
 #include "hcd-uhci.h"
 
+static void uhci_isa_set_irq(void *opaque, int irq_num, int level)
+{
+    UHCIState *s = opaque;
+    uint8_t irq = pci_get_byte(s->dev.config + PCI_INTERRUPT_LINE);
+    if (irq > 0 && irq < 15) {
+        qemu_set_irq(isa_get_irq(NULL, irq), level);
+    }
+}
+
 static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
 {
     UHCIState *s = UHCI(dev);
@@ -14,6 +24,8 @@ static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
     pci_set_long(pci_conf + 0xc0, 0x00002000);
 
     usb_uhci_common_realize(dev, errp);
+    object_unref(s->irq);
+    s->irq = qemu_allocate_irq(uhci_isa_set_irq, s, 0);
 }
 
 static UHCIInfo uhci_info[] = {
-- 
2.21.4


