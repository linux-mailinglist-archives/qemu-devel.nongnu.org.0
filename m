Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EBE42E035
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 19:43:22 +0200 (CEST)
Received: from localhost ([::1]:60964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb4lF-0004Xb-8i
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 13:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb4hB-0000Mr-C3
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 13:39:09 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:53037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb4h9-00006N-S4
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 13:39:09 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5CCC6756062;
 Thu, 14 Oct 2021 19:39:06 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 14AD975604D; Thu, 14 Oct 2021 19:38:59 +0200 (CEST)
Message-Id: <f4d295e1d0b6aee749f4b59ed566c65b72ce9ff5.1634232746.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1634232746.git.balaton@eik.bme.hu>
References: <cover.1634232746.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 2/3] usb/uhci: Replace pci_set_irq with qemu_set_irq
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

Instead of using pci_set_irq, store the irq in the device state and
use it explicitly so variants having different interrupt handling can
use their own.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/usb/hcd-uhci.c | 4 +++-
 hw/usb/hcd-uhci.h | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index c557566ec2..7201cd0ae7 100644
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
index e61d8fcb19..1f8ee04186 100644
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


