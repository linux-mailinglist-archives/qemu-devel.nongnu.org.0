Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB895FE3E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jul 2019 23:48:22 +0200 (CEST)
Received: from localhost ([::1]:48958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hj9aX-0006w0-EI
	for lists+qemu-devel@lfdr.de; Thu, 04 Jul 2019 17:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57288)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <balaton@eik.bme.hu>) id 1hj9Y1-0005El-UT
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 17:45:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1hj9Y0-0007sK-PV
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 17:45:45 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:23052)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1hj9Xy-0007oC-4a
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 17:45:42 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C9E927461AE;
 Thu,  4 Jul 2019 23:45:37 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id AB8E57461AA; Thu,  4 Jul 2019 23:45:37 +0200 (CEST)
Message-Id: <da33261a841755691f698db8190c868df0c0d3ae.1562276605.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Thu, 04 Jul 2019 23:43:25 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: [Qemu-devel] [PATCH] ati-vga: Fix setting offset together with
 pitch for r128pro
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

Turns out my last fix to this broke one case for Rage 128 Pro so
revert that part of previous patch. This now fixes the remaining
rendering problems for MorphOS which now can produce picture with
-device ati-vga (although it may not be optimised yet and video
overlay emulation is still known to be missing).

Fixes: 866ad5f5ff620078f88183aa254f7b02727e6aa3
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/ati.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/display/ati.c b/hw/display/ati.c
index 590362ea56..a747c4cc98 100644
--- a/hw/display/ati.c
+++ b/hw/display/ati.c
@@ -689,7 +689,7 @@ static void ati_mm_write(void *opaque, hwaddr addr,
         break;
     case SRC_PITCH_OFFSET:
         if (s->dev_id =3D=3D PCI_DEVICE_ID_ATI_RAGE128_PF) {
-            s->regs.src_offset =3D (data & 0x1fffff) << 4;
+            s->regs.src_offset =3D (data & 0x1fffff) << 5;
             s->regs.src_pitch =3D (data & 0x7fe00000) >> 21;
             s->regs.src_tile =3D data >> 31;
         } else {
@@ -700,7 +700,7 @@ static void ati_mm_write(void *opaque, hwaddr addr,
         break;
     case DST_PITCH_OFFSET:
         if (s->dev_id =3D=3D PCI_DEVICE_ID_ATI_RAGE128_PF) {
-            s->regs.dst_offset =3D (data & 0x1fffff) << 4;
+            s->regs.dst_offset =3D (data & 0x1fffff) << 5;
             s->regs.dst_pitch =3D (data & 0x7fe00000) >> 21;
             s->regs.dst_tile =3D data >> 31;
         } else {
--=20
2.13.7


