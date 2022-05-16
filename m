Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF9C5287A7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 16:55:27 +0200 (CEST)
Received: from localhost ([::1]:47494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqc86-00074v-JU
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 10:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqbis-00038x-Vq
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:29:23 -0400
Received: from mout.gmx.net ([212.227.17.20]:59821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqbir-0004wO-5P
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:29:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652711351;
 bh=nFE54bnqkG6YAdVZIr18MUe31ug2M7jvMYLvH1spCtI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=bfkNUz7rZXAhqO8sIjMFyphQzP6eFFI/rM64XIerzDkQrRYUennuAiMgMgg7+CK4s
 TGGj6h6C/MpV9hKP4dVXA6nFTJ3k79YoK55M1c95J228bWD1AYLdZotySbQnqcv88Y
 G5gw6WkxZehI4I2WMYuokzuU7i7MLSeDomFSJQ6A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.160.68]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWici-1oNXri3te4-00X0W8; Mon, 16
 May 2022 16:29:10 +0200
From: Helge Deller <deller@gmx.de>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Sven Schnelle <svens@stackframe.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Helge Deller <deller@gmx.de>,
	Stefano Repici <rs.rdp@zoho.eu>
Subject: [PATCH v2 7/7] artist: Fix X cursor position calculation in X11
Date: Mon, 16 May 2022 16:29:07 +0200
Message-Id: <20220516142907.32827-8-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516142907.32827-1-deller@gmx.de>
References: <20220516142907.32827-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JqoITjPxJMAIGbvzruhbuyl8TwBv2nETtjr+/oWYRn37e22vpPS
 7tOrKs5Ym2yupha+nziiGGAsKgQzWzopUDT8G63mTuCIgx35UBAegMJy0520oHSG3DmsUVY
 7I6Dt/c3lmA1a4PDQiNO6ipwnWX6r2Z7mLcUYBm2G60hTbg2xeTmTKsfB77GWa2qqLW6ZJY
 uLKUWlE6dDHn52BWh7BUA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G0K3rWamlM0=:1Fjs+VUzBNuK+eSB+KSPhV
 VkLBr/yjH88wJBLfzjWz0j0M33U1xb3wmbvQ7HBCH5QCtB5/rfvTI4cxivYbbvTQhls8ix3eh
 EbjzsPCljDxvhU8EvwFDzwn7an+PZWcCVz2vp9R65YbuDvw2fkofjD/aFeoSWqhVipaU11Q3r
 jE6LzzUxe+ia5jSeUR6xxlF00TFSUhZZUew3qxJkUGyIb9uJsL/2Icny92llNYR5nlf5Nf02Q
 Uw5bKZVK+FSTxEaCqOBRK2q6Tx9Mv5m+3qx7LV1ZhNVFOSDa3vR6s5kv8Yuj9Ift2kJVGnZ5w
 +ko0lrMKkeRtBkiw+17G+3OB3AUQKfY0+Fzb61SK+kpLXA6JofXez++Nslu8PhD92wERrQSXN
 k9JCU4miEnB6cXCJ7zJoj9MgN3IUW2C2ldZZv+JFzqlTQkfvrPuk3kjuIup1yRTLaAn6gFjhw
 qCaa65YGgWC35WOKovtZ8X0hW4DyW1V39D0NTakD0HpxDBgE+3RNp9depIW88iBEoXPdu63ZT
 RON4pKsamxKxAEnZ2DJy1QKSypJYqJJeiXn32FceBNZ0oTlQXHKkYCBn8rU67Z6yzmjiV1Ami
 L1YCQ9hs+FfwMa4CoI6d6mcaqhLXfpvQQEifKGTpC3+lY+SrkqWS7W5zA61fnmdz9BNjqaoIy
 PHIyL8pm48y2reEFb/5B6qkNQOps+hMdUK2LCf/bwqUAX+Zmleu4OQyhYP1IMd/Y8aAh4VFSY
 6ZNLjMMvrbYD0oa6kHARgxTIKjJx0keVAjZlpag8dZrNUCHxesR4CDkVvnmfiuORVxG5SK0pV
 nAZ4VQeT/6nOXuX7IZ3ZZN9dus2KfQHa+O4DkbDoTDKb0MsIIgMUIyv4d5/+wiaf2Z5n57CYE
 dQsn8nBDn5j1l8YSjje4NYPaeb5FLruv2tT9pRFdbOntrBRL1K3ITrCcYfEK0qihkFRDB/gXn
 ddfMiMJrDj8atZJtyMNB6mtX2nsDA8UDYL5EeZypz1yzunbcskOjFTA32wIc8QNuZs9odfEpX
 r0bYyeBYy3U4w26VfoyPKAXguEg61Dd1c4KkZCFMvP4VJhKtl+v2/1PLymCZerjpEjrY/BB7M
 tpUey50hv+fvsg7TpQ7RBQRSGX/nTvLklLuacNLHpgz13qLNos1ZgqlTw==
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 hw/display/artist.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 49dad2b824..8bf3bed79a 100644
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
@@ -333,16 +330,22 @@ static void artist_get_cursor_pos(ARTISTState *s, in=
t *x, int *y)
         return;
     }

-    lx =3D artist_get_x(s->cursor_pos);
-    if (lx < offset) {
-        offset =3D lx;
-    }
-    *x =3D (lx - offset) / 2;
+    /* Calculate X position based on backporch and interleave values.
+       Based on code from Xorg X11R6.6
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

@@ -1056,6 +1059,8 @@ static void artist_reg_write(void *opaque, hwaddr ad=
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


