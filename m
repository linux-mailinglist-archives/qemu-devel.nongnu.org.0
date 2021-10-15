Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4181942E61C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 03:21:26 +0200 (CEST)
Received: from localhost ([::1]:34722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbBuX-0007CY-DO
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 21:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mbBqP-0000n2-CS
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 21:17:13 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:50161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mbBqN-00079R-Ng
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 21:17:09 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2C3D1756072;
 Fri, 15 Oct 2021 03:17:05 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CB7B7756057; Fri, 15 Oct 2021 03:16:57 +0200 (CEST)
Message-Id: <228ffba872d7870392270b36910ac8250cd7ff96.1634259980.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1634259980.git.balaton@eik.bme.hu>
References: <cover.1634259980.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 3/4] hw/usb/vt82c686-uhci-pci: Avoid using isa_get_irq()
Date: Fri, 15 Oct 2021 03:06:20 +0200
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

Use via_isa_set_irq() which better encapsulates irq handling in the
vt82xx model and avoids using isa_get_irq() that has a comment saying
it should not be used.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/usb/vt82c686-uhci-pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
index e70e739409..92479d11e5 100644
--- a/hw/usb/vt82c686-uhci-pci.c
+++ b/hw/usb/vt82c686-uhci-pci.c
@@ -1,5 +1,6 @@
 #include "qemu/osdep.h"
 #include "hw/irq.h"
+#include "hw/isa/vt82c686.h"
 #include "hcd-uhci.h"
 
 static void uhci_isa_set_irq(void *opaque, int irq_num, int level)
@@ -7,7 +8,7 @@ static void uhci_isa_set_irq(void *opaque, int irq_num, int level)
     UHCIState *s = opaque;
     uint8_t irq = pci_get_byte(s->dev.config + PCI_INTERRUPT_LINE);
     if (irq > 0 && irq < 15) {
-        qemu_set_irq(isa_get_irq(NULL, irq), level);
+        via_isa_set_irq(pci_get_function_0(&s->dev), irq, level);
     }
 }
 
-- 
2.21.4


