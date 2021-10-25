Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C53F43956C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 13:58:17 +0200 (CEST)
Received: from localhost ([::1]:36704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meycK-00022z-Gk
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 07:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meyM1-0004hJ-AL
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 07:41:26 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:48237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meyLx-0006rY-NF
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 07:41:24 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E0CE7756197;
 Mon, 25 Oct 2021 13:41:15 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C1DB5756030; Mon, 25 Oct 2021 13:41:15 +0200 (CEST)
Message-Id: <b68a57dfcf181e73272b4dc951f8cc6e76b0d182.1635161629.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635161629.git.balaton@eik.bme.hu>
References: <cover.1635161629.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 1/4] usb/uhci: Misc clean up
Date: Mon, 25 Oct 2021 13:33:49 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
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

Fix a comment for coding style so subsequent patch will not get
checkpatch error and simplify and shorten uhci_update_irq().

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/hcd-uhci.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index 0cb02a6432..c557566ec2 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -290,7 +290,7 @@ static UHCIAsync *uhci_async_find_td(UHCIState *s, uint32_t td_addr)
 
 static void uhci_update_irq(UHCIState *s)
 {
-    int level;
+    int level = 0;
     if (((s->status2 & 1) && (s->intr & (1 << 2))) ||
         ((s->status2 & 2) && (s->intr & (1 << 3))) ||
         ((s->status & UHCI_STS_USBERR) && (s->intr & (1 << 0))) ||
@@ -298,8 +298,6 @@ static void uhci_update_irq(UHCIState *s)
         (s->status & UHCI_STS_HSERR) ||
         (s->status & UHCI_STS_HCPERR)) {
         level = 1;
-    } else {
-        level = 0;
     }
     pci_set_irq(&s->dev, level);
 }
@@ -1170,8 +1168,7 @@ void usb_uhci_common_realize(PCIDevice *dev, Error **errp)
 
     pci_conf[PCI_CLASS_PROG] = 0x00;
     /* TODO: reset value should be 0. */
-    pci_conf[USB_SBRN] = USB_RELEASE_1; // release number
-
+    pci_conf[USB_SBRN] = USB_RELEASE_1; /* release number */
     pci_config_set_interrupt_pin(pci_conf, u->info.irq_pin + 1);
 
     if (s->masterbus) {
-- 
2.21.4


