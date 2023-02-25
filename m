Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802E96A348D
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:16:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPI0-0003LM-Ni; Sun, 26 Feb 2023 17:14:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWPHx-0003Ik-7e; Sun, 26 Feb 2023 17:14:37 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWPHv-000513-QN; Sun, 26 Feb 2023 17:14:36 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5D654746F7F;
 Sun, 26 Feb 2023 23:14:34 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3D29B746F2F; Sun, 26 Feb 2023 23:14:34 +0100 (CET)
Message-Id: <b797f7e7fed6cde182a39c5f3a181fa24ee9a64b.1677445307.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1677445307.git.balaton@eik.bme.hu>
References: <cover.1677445307.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Sat, 25 Feb 2023 19:19:57 +0100
Subject: [PATCH v3 6/8] hw/usb/vt82c686-uhci-pci: Use PCI IRQ routing
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, ReneEngel80@emailn.de
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Bernhard Beschow <shentey@gmail.com>

According to the PCI specification, PCI_INTERRUPT_LINE shall have no
effect on hardware operations. Now that the VIA south bridges implement
the internal PCI interrupt router let's be more conformant to the PCI
specification.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Tested-by: Rene Engel <ReneEngel80@emailn.de>
---
 hw/usb/vt82c686-uhci-pci.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
index 46a901f56f..b4884c9011 100644
--- a/hw/usb/vt82c686-uhci-pci.c
+++ b/hw/usb/vt82c686-uhci-pci.c
@@ -1,17 +1,7 @@
 #include "qemu/osdep.h"
-#include "hw/irq.h"
 #include "hw/isa/vt82c686.h"
 #include "hcd-uhci.h"
 
-static void uhci_isa_set_irq(void *opaque, int irq_num, int level)
-{
-    UHCIState *s = opaque;
-    uint8_t irq = pci_get_byte(s->dev.config + PCI_INTERRUPT_LINE);
-    if (irq > 0 && irq < 15) {
-        via_isa_set_irq(pci_get_function_0(&s->dev), irq, level);
-    }
-}
-
 static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
 {
     UHCIState *s = UHCI(dev);
@@ -25,8 +15,6 @@ static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
     pci_set_long(pci_conf + 0xc0, 0x00002000);
 
     usb_uhci_common_realize(dev, errp);
-    object_unref(s->irq);
-    s->irq = qemu_allocate_irq(uhci_isa_set_irq, s, 0);
 }
 
 static UHCIInfo uhci_info[] = {
-- 
2.30.7


