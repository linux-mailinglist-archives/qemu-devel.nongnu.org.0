Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E935E74137
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 00:04:22 +0200 (CEST)
Received: from localhost ([::1]:54742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqPMz-0004Mz-MZ
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 18:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49003)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <balaton@eik.bme.hu>) id 1hqPMl-0003we-Gf
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 18:04:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1hqPMk-0002Ee-Gb
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 18:04:07 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:22222)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1hqPMk-0002Bf-9Z
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 18:04:06 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 111CB7456CF;
 Thu, 25 Jul 2019 00:03:54 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EC1347456CA; Thu, 25 Jul 2019 00:03:53 +0200 (CEST)
Message-Id: <8151696fce76bc7a2a1cbc16c284f1f6d7d340ec.1564005631.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Thu, 25 Jul 2019 00:00:31 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: [Qemu-devel] [PATCH] ati-vga: Fix GPIO_MONID register write
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

Also update bitbang_i2c state when output bits are changed while
enable bits are set. This fixes EDID access by the ATI FCode ROM.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/ati.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/display/ati.c b/hw/display/ati.c
index d2116d2ab0..b849f5d510 100644
--- a/hw/display/ati.c
+++ b/hw/display/ati.c
@@ -564,12 +564,15 @@ static void ati_mm_write(void *opaque, hwaddr addr,
                                addr - GPIO_MONID, data, size);
             /*
              * Rage128p accesses DDC used to get EDID via these bits.
-             * Only touch i2c when write overlaps 3rd byte because some
-             * drivers access this reg via multiple partial writes and
-             * without this spurious bits would be sent.
+             * Because some drivers access this via multiple byte writes
+             * we have to be careful when we send bits to avoid spurious
+             * changes in bitbang_i2c state. So only do it when mask is =
set
+             * and either the enable bits are changed or output bits cha=
nged
+             * while enabled.
              */
             if ((s->regs.gpio_monid & BIT(25)) &&
-                addr <=3D GPIO_MONID + 2 && addr + size > GPIO_MONID + 2=
) {
+                ((addr <=3D GPIO_MONID + 2 && addr + size > GPIO_MONID +=
 2) ||
+                 (addr =3D=3D GPIO_MONID && (s->regs.gpio_monid & 0x6000=
0)))) {
                 s->regs.gpio_monid =3D ati_i2c(&s->bbi2c, s->regs.gpio_m=
onid, 1);
             }
         }
--=20
2.13.7


