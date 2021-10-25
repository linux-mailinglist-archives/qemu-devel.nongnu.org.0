Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAF243953A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 13:47:13 +0200 (CEST)
Received: from localhost ([::1]:47676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meyRc-0006yM-6D
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 07:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meyM3-0004kI-CW
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 07:41:29 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:48245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meyLx-0006sA-Nu
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 07:41:27 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 115E6756030;
 Mon, 25 Oct 2021 13:41:17 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CF57775602D; Mon, 25 Oct 2021 13:41:15 +0200 (CEST)
Message-Id: <b39066e03c8731f4197d50bc79b403f797599999.1635161629.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635161629.git.balaton@eik.bme.hu>
References: <cover.1635161629.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 3/4] usb/uhci: Replace pci_set_irq with qemu_set_irq
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

Instead of using pci_set_irq, store the irq in the device state and
use it explicitly so variants having different interrupt handling can
use their own.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-uhci.c | 4 +++-
 hw/usb/hcd-uhci.h | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index 7d26e35194..d1b5657d72 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -31,6 +31,7 @@
 #include "hw/usb/uhci-regs.h"
 #include "migration/vmstate.h"
 #include "hw/pci/pci.h"
+#include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
@@ -299,7 +300,7 @@ static void uhci_update_irq(UHCIState *s)
         (s->status & UHCI_STS_HCPERR)) {
         level = 1;
     }
-    pci_set_irq(&s->dev, level);
+    qemu_set_irq(s->irq, level);
 }
 
 static void uhci_reset(DeviceState *dev)
@@ -1170,6 +1171,7 @@ void usb_uhci_common_realize(PCIDevice *dev, Error **errp)
     /* TODO: reset value should be 0. */
     pci_conf[USB_SBRN] = USB_RELEASE_1; /* release number */
     pci_config_set_interrupt_pin(pci_conf, u->info.irq_pin + 1);
+    s->irq = pci_allocate_irq(dev);
 
     if (s->masterbus) {
         USBPort *ports[NB_PORTS];
diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
index 316693f80b..c85ab7868e 100644
--- a/hw/usb/hcd-uhci.h
+++ b/hw/usb/hcd-uhci.h
@@ -60,7 +60,7 @@ typedef struct UHCIState {
     uint32_t frame_bandwidth;
     bool completions_only;
     UHCIPort ports[NB_PORTS];
-
+    qemu_irq irq;
     /* Interrupts that should be raised at the end of the current frame.  */
     uint32_t pending_int_mask;
 
-- 
2.21.4


