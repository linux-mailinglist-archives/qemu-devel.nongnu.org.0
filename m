Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110675288BE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:26:31 +0200 (CEST)
Received: from localhost ([::1]:55382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqccA-0001WK-4O
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqc3r-0005ug-CD
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:51:03 -0400
Received: from mout.gmx.net ([212.227.17.20]:36719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqc2o-0008DJ-UX
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652712577;
 bh=IVegvxCpCBUiHv40YkCq8PXPOpJUqz8fBzG9sxfbd+o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=dSqYBojpY5hWU2KtFX2X5vQn+ypPgW5vZzGsosSSzzg1pNNKXb4X9koueCZ4AT6nK
 QLwrmjYjittnI9MxYOw/9bTw5R0jHzhmPZBp9zxecdL+KeCmqF8J+RkmNIAhn6wpYR
 P00DXFItFxihimWZtxeJwupf8EsWVjqUCHo+0sxs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.160.68]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M89Gt-1nul2g2UZn-005MPZ; Mon, 16
 May 2022 16:49:37 +0200
From: Helge Deller <deller@gmx.de>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sven Schnelle <svens@stackframe.org>, qemu-devel@nongnu.org
Cc: Stefano Repici <rs.rdp@zoho.eu>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v3 7/7] artist: Fix X cursor position calculation in X11
Date: Mon, 16 May 2022 16:49:34 +0200
Message-Id: <20220516144934.36273-8-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516144934.36273-1-deller@gmx.de>
References: <20220516144934.36273-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5zWOUdqzV3qI0ETHwMRlW97+08Z+bMMUKtLhIWIRJkCf4dbZsjz
 F4y3cIRdggHG0MDfTi6Cjsw+aQc2KTo/WXgV2SPr9+9iwFgycU07llUJTB1rSpQReFax2vQ
 h/HQ1XPXqCT4vWd+WZxAOopGs8bOAqxyVnJb5EeWjc6cJRavnHgspK/LdGab0/YwtakQDW7
 wPHWjM+hIn3GDgyBoP09Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oT94sTXmRf0=:eosA0ys6Vfe4K4r7uZVfJX
 DG37l677L7f1ky13kutsF47ZcaauiZv9ttTQbi5dwK1CKcdwIlgcRn7ZHUUwKGyNz63UDfWYs
 DMQfEx+pw60BRMXEasNBm4jT7mRa//TcaUoxwUY/UDsu0cdip9oJd48CQlZx6zebCmel1iHue
 G3bFZCCu6MuUu4Dk67dyjpWqGvy5FBC9bUd4ic2DHYy7OyAETqb6iSqIXZ+VVghf5thVLzryK
 YydjX4wJTRx8ppMtL+y+zPRfSdU3iDQ9/AoeIvNAbroXWtAA7crHDdS4Rfz0Gqklvqil/0mrZ
 4nc09hwv6YrmWlz4dWqlb/tquJc1Pe6rxpjiBIIDxmFsvo1Rewrc3tplohrE5zvZt3gX9pHDb
 uFDgmcVc9MaNVTBw0S5BOIRgCtgHT2o6UWosJELYKOWL1yW0RbUMzG3qz8hp+Rju5OY312yv0
 TLrGsNkjly4xPDoB2jOvV/NXAYyupr1ncmmMONLzxDv8o7M0j6+jPtv58RerL8juOzNRJULIu
 n2brj/1czREMniAVXJXynmPsu83ViebEZrooeBsoZqK8OtRkCDNk2EyYiYieWfJcuIrBNi3At
 bUon7TUTy3uQlusWzSSuNK/jQ+nli9UvGEeV42OAcRm4titkjqY9/qpcP0srgY4GJ6x3XoRh/
 6kjrw8V4hrtIKQNskZL28o68pYIdQeA7l8xiEue1BQg1jM4UDzCgfmCNgyCDeHIVGicfiQBsn
 fuCDYBSoowIAcn5DPosq934SW/5WiU+jiJedkQeb9QeCAVQVYEYw7XFtCO0CPFGCrv2Dk/iaF
 JKU5nFuToWbWsKHdMCkzdrscS/q4rVbdBCrvsUJGKC27f5aVfERrX5NveySdY5sCJ2ZCLqGHq
 BDMnBU0Te0LTdaOVKZpYa1GGFfDtcMRqpH5JXOvRuoLKmDh/LROyJvN61Gt+/OamwMYd05x6K
 aO+XhgTzkhvofoXSXI4gC/XqtueBe3HQxskLNvbcL3kECX+64t+FVWVsHgwPHyJPEg8+XXbdC
 JFo3W0PBJ4dh+6iOESVGaEbJyUVVEv9tHOTUntsJdm8qPybkWIAvU4nU3I9xJvSKYJ8CgggEn
 wHJLVL9O/zsDzA=
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The X cursor postion can be calculated based on the backporch and
interleave values.  In the emulation we ignore the HP-UX settings for
backporch and use instead twice the size of the emulated cursor.  With
those changes the X-position of the graphics cursor is now finally
working correctly on HP-UX 10 and HP-UX 11.

Based on coding in Xorg X11R6.6

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 hw/display/artist.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 49dad2b824..eadaef0d46 100644
=2D-- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -1,7 +1,8 @@
 /*
  * QEMU HP Artist Emulation
  *
- * Copyright (c) 2019 Sven Schnelle <svens@stackframe.org>
+ * Copyright (c) 2019-2022 Sven Schnelle <svens@stackframe.org>
+ * Copyright (c) 2022 Helge Deller <deller@gmx.de>
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or lat=
er.
  */
@@ -313,19 +314,15 @@ static void artist_rop8(ARTISTState *s, struct vram_=
buffer *buf,
 static void artist_get_cursor_pos(ARTISTState *s, int *x, int *y)
 {
     /*
-     * Don't know whether these magic offset values are configurable via
-     * some register. They seem to be the same for all resolutions.
-     * The cursor values provided in the registers are:
-     * X-value: -295 (for HP-UX 11) and 338 (for HP-UX 10.20) up to 2265
-     * Y-value: 1146 down to 0
      * The emulated Artist graphic is like a CRX graphic, and as such
      * it's usually fixed at 1280x1024 pixels.
-     * Because of the maximum Y-value of 1146 you can not choose a higher
-     * vertical resolution on HP-UX (unless you disable the mouse).
+     * Other resolutions may work, but no guarantee.
      */

-    static int offset =3D 338;
-    int lx;
+    unsigned int hbp_times_vi, horizBackPorch;
+    int16_t xHi, xLo;
+    const int videoInterleave =3D 4;
+    const int pipelineDelay =3D 4;

     /* ignore if uninitialized */
     if (s->cursor_pos =3D=3D 0) {
@@ -333,16 +330,23 @@ static void artist_get_cursor_pos(ARTISTState *s, in=
t *x, int *y)
         return;
     }

-    lx =3D artist_get_x(s->cursor_pos);
-    if (lx < offset) {
-        offset =3D lx;
-    }
-    *x =3D (lx - offset) / 2;
+    /*
+     * Calculate X position based on backporch and interleave values.
+     * Based on code from Xorg X11R6.6
+     */
+    horizBackPorch =3D ((s->horiz_backporch & 0xff0000) >> 16) +
+                     ((s->horiz_backporch & 0xff00) >> 8) + 2;
+    hbp_times_vi =3D horizBackPorch * videoInterleave;
+    xHi =3D s->cursor_pos >> 19;
+    *x =3D ((xHi + pipelineDelay) * videoInterleave) - hbp_times_vi;
+
+    xLo =3D (s->cursor_pos >> 16) & 0x07;
+    *x +=3D ((xLo - hbp_times_vi) & (videoInterleave - 1)) + 8 - 1;

     /* subtract cursor offset from cursor control register */
     *x -=3D (s->cursor_cntrl & 0xf0) >> 4;

-    /* height minus nOffscreenScanlines is stored in cursor control regis=
ter */
+    /* Calculate Y position */
     *y =3D s->height - artist_get_y(s->cursor_pos);
     *y -=3D (s->cursor_cntrl & 0x0f);

@@ -1056,6 +1060,8 @@ static void artist_reg_write(void *opaque, hwaddr ad=
dr, uint64_t val,
         break;

     case HORIZ_BACKPORCH:
+        /* overwrite HP-UX settings to fix X cursor position. */
+        val =3D (NGLE_MAX_SPRITE_SIZE << 16) + (NGLE_MAX_SPRITE_SIZE << 8=
);
         combine_write_reg(addr, val, size, &s->horiz_backporch);
         break;

=2D-
2.35.3


