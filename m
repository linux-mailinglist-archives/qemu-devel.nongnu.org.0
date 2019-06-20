Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653904DB39
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 22:29:40 +0200 (CEST)
Received: from localhost ([::1]:52766 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1he3gh-0006Yz-59
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 16:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45647)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <balaton@eik.bme.hu>) id 1he36c-0007Lh-8V
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 15:52:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1he36b-0004jc-2a
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 15:52:22 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:24544)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1he36a-0004e9-On
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 15:52:20 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E510D7462AA;
 Thu, 20 Jun 2019 21:52:13 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C54127461AE; Thu, 20 Jun 2019 21:52:13 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Thu, 20 Jun 2019 21:46:06 +0200
To: qemu-devel@nongnu.org
Message-Id: <20190620195213.C54127461AE@zero.eik.bme.hu>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: [Qemu-devel] [PATCH] ati-vga: Clarify comment (to be squashed in
 previous patch)
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/ati.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/display/ati.c b/hw/display/ati.c
index 6fbdda288f..932a1eacea 100644
--- a/hw/display/ati.c
+++ b/hw/display/ati.c
@@ -538,9 +538,14 @@ static void ati_mm_write(void *opaque, hwaddr addr,
     case GPIO_MONID ... GPIO_MONID + 3:
         /* FIXME What does Radeon have here? */
         if (s->dev_id == PCI_DEVICE_ID_ATI_RAGE128_PF) {
-            /* Rage128p accesses DDC used to get EDID on these pins */
             ati_reg_write_offs(&s->regs.gpio_monid,
                                addr - GPIO_MONID, data, size);
+            /*
+             * Rage128p accesses DDC used to get EDID via these bits.
+             * Only touch i2c when write overlaps 3rd byte because some
+             * drivers access this reg via multiple partial writes and
+             * without this spurious bits would be sent.
+             */
             if ((s->regs.gpio_monid & BIT(25)) &&
                 addr <= GPIO_MONID + 2 && addr + size > GPIO_MONID + 2) {
                 s->regs.gpio_monid = ati_i2c(s->bbi2c, s->regs.gpio_monid, 1);
-- 
2.13.7


