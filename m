Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B97FF89471
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Aug 2019 23:35:29 +0200 (CEST)
Received: from localhost ([::1]:41876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwvUu-0006LO-Vb
	for lists+qemu-devel@lfdr.de; Sun, 11 Aug 2019 17:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58200)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <balaton@eik.bme.hu>) id 1hwvSz-00020Q-BU
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 17:33:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1hwvSy-00047E-5B
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 17:33:29 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:55470)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1hwvSx-000464-RA
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 17:33:28 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8D55874CE6F;
 Sun, 11 Aug 2019 23:33:12 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EA4F974BE6A; Sun, 11 Aug 2019 23:33:11 +0200 (CEST)
Message-Id: <1c6fce457ef7e6f889e38dc0423791be92310a62.1565558093.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1565558093.git.balaton@eik.bme.hu>
References: <cover.1565558093.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Sun, 11 Aug 2019 23:14:53 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: [Qemu-devel] [PATCH 6/7] ati-vga: Attempt to handle CRTC offset not
 exact multiple of stride
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

MacOS uses non-0 offset so it needs this and the resulting
vbe_start_addr seems correct but picture is still broken with OpenBIOS
after FCode runs but that maybe due to firmware problems now. After
boot, picture is now correct.

It also occured to me that these CRTC regs are also present in VGA so
I wonder if they should be shared in case some drivers try to poke
them via VGA regs or these are a separate set of regs for extended
mode. Added a comment noting this but drivers I've tried so far
program the card accessing ati regs so I did not attempt to change it.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/ati.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/hw/display/ati.c b/hw/display/ati.c
index bbcdd6bc83..0bfe73179d 100644
--- a/hw/display/ati.c
+++ b/hw/display/ati.c
@@ -50,6 +50,7 @@ static void ati_vga_switch_mode(ATIVGAState *s)
         s->mode =3D EXT_MODE;
         if (s->regs.crtc_gen_cntl & CRTC2_EN) {
             /* CRT controller enabled, use CRTC values */
+            /* FIXME Should these be the same as VGA CRTC regs? */
             uint32_t offs =3D s->regs.crtc_offset & 0x07ffffff;
             int stride =3D (s->regs.crtc_pitch & 0x7ff) * 8;
             int bpp =3D 0;
@@ -101,16 +102,23 @@ static void ati_vga_switch_mode(ATIVGAState *s)
                 (s->regs.dac_cntl & DAC_8BIT_EN ? VBE_DISPI_8BIT_DAC : 0=
));
             /* now set offset and stride after enable as that resets the=
se */
             if (stride) {
+                int bypp =3D DIV_ROUND_UP(bpp, BITS_PER_BYTE);
+
                 vbe_ioport_write_index(&s->vga, 0, VBE_DISPI_INDEX_VIRT_=
WIDTH);
                 vbe_ioport_write_data(&s->vga, 0, stride);
-                if (offs % stride =3D=3D 0) {
-                    vbe_ioport_write_index(&s->vga, 0, VBE_DISPI_INDEX_Y=
_OFFSET);
-                    vbe_ioport_write_data(&s->vga, 0, offs / stride);
-                } else {
-                    /* FIXME what to do with this? */
-                    error_report("VGA offset is not multiple of pitch, "
-                                 "expect bad picture");
+                stride *=3D bypp;
+                if (offs % stride) {
+                    DPRINTF("CRTC offset is not multiple of pitch\n");
+                    vbe_ioport_write_index(&s->vga, 0,
+                                           VBE_DISPI_INDEX_X_OFFSET);
+                    vbe_ioport_write_data(&s->vga, 0, offs % stride / by=
pp);
                 }
+                vbe_ioport_write_index(&s->vga, 0, VBE_DISPI_INDEX_Y_OFF=
SET);
+                vbe_ioport_write_data(&s->vga, 0, offs / stride);
+                DPRINTF("VBE offset (%d,%d), vbe_start_addr=3D%x\n",
+                        s->vga.vbe_regs[VBE_DISPI_INDEX_X_OFFSET],
+                        s->vga.vbe_regs[VBE_DISPI_INDEX_Y_OFFSET],
+                        s->vga.vbe_start_addr);
             }
         }
     } else {
--=20
2.13.7


