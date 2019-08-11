Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C9A8947B
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Aug 2019 23:37:15 +0200 (CEST)
Received: from localhost ([::1]:41892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwvWd-00008R-3J
	for lists+qemu-devel@lfdr.de; Sun, 11 Aug 2019 17:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58186)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <balaton@eik.bme.hu>) id 1hwvSy-00020D-SC
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 17:33:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1hwvSy-00046r-1D
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 17:33:28 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:55472)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1hwvSx-000466-Qk
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 17:33:27 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 87D1F74CB05;
 Sun, 11 Aug 2019 23:33:12 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E35C474AB63; Sun, 11 Aug 2019 23:33:11 +0200 (CEST)
Message-Id: <d99f9e07923a74932dbb15e93dd50aa8d2816b19.1565558093.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1565558093.git.balaton@eik.bme.hu>
References: <cover.1565558093.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Sun, 11 Aug 2019 23:14:53 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: [Qemu-devel] [PATCH 4/7] ati-vga: Fix cursor color with
 guest_hwcursor=true
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

Fixes: a38127414bd007c5b6ae64c664d9e8839393277e
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/ati.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/ati.c b/hw/display/ati.c
index 699f38223b..b849f5d510 100644
--- a/hw/display/ati.c
+++ b/hw/display/ati.c
@@ -207,7 +207,7 @@ static void ati_cursor_draw_line(VGACommonState *vga,=
 uint8_t *d, int scr_y)
                 }
             } else {
                 color =3D (xbits & BIT(7) ? s->regs.cur_color1 :
-                                          s->regs.cur_color0) << 8 | 0xf=
f;
+                                          s->regs.cur_color0) | 0xff0000=
00;
             }
             if (vga->hw_cursor_x + i * 8 + j >=3D h) {
                 return; /* end of screen, don't span to next line */
--=20
2.13.7


