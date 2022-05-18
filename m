Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2697A52BFC0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 18:25:56 +0200 (CEST)
Received: from localhost ([::1]:40018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrMUl-0004L8-8W
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 12:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nrMNF-0003jq-SR
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:18:11 -0400
Received: from mout.gmx.net ([212.227.17.21]:41953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nrMNC-0004Lq-KZ
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:18:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652890681;
 bh=IVegvxCpCBUiHv40YkCq8PXPOpJUqz8fBzG9sxfbd+o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=b9CO7NChtdG+cenaOkPkHUCwaRr26t/D1MNttPDy5mogF3OSSj0hAit8wU7jH5i0g
 1QfPR72wEZ9M6dzOz79kGxG6Q/F76Pwz3jiOdfUWVgRPzZq+bH36AzphXuNdz77XSA
 H/8RIlkA9tWu34kwhDzjZ5yyH0j2/m7wqE5nkjCM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.138.233]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3lYB-1nrdcY1587-000reO; Wed, 18
 May 2022 18:18:01 +0200
From: Helge Deller <deller@gmx.de>
To: Sven Schnelle <svens@stackframe.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Helge Deller <deller@gmx.de>
Subject: [PULL 7/7] artist: Fix X cursor position calculation in X11
Date: Wed, 18 May 2022 18:17:58 +0200
Message-Id: <20220518161758.49036-8-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220518161758.49036-1-deller@gmx.de>
References: <20220518161758.49036-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jUA8k6Ol4dQq8bmz++Y4rXtAPaitZGVq6czIUeU1OWOj5IaBK8Z
 jaMW2DHcgmJjcUAUUluEkzRYk86wIkcxO3i6kGXNjpt2mbo1BBUo/L8jGkb8xuafNEtJBKg
 8u9aUMiw7zkXT03gw70sg4vNawx8ONozRvu5PzVcEMOBt1c95FFI0UfNbnnvVgxsKwarckp
 XsP99pYqvBGoPT8VpDj2g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TOYninyscfw=:YU+RuTy4go1CJ0QSB1PV6m
 AoRLTH+xo63el5YR2q0bKNfV2uvUWByd5sv6pFcQRPHMR+35/LzntydijsQgryM325iC+mzNs
 rw8ObZwFNNRrynJxI5pi1E//6gOIk07JsWyJXsLcuOOLVYik18ioTz1a1dWap+XU/zrDclWDT
 bqJN+gc/mCOpFy6C7YebhyUlx89w1IcXeKOmtk8po+/G48LWxekfuNTqrYohCiJGBTau2xS2v
 iooTnzWemU7pHnKNFtrSLmlXJP0HxnOpEcQ0hRhKR7uXVc5rUdI4vxgJTbn2FsqecHiYYAGJW
 7YCg2eDBmhuHcP4pQmhEGokGhJxIpljHAZ0VVea0Mxu6gMty/GZ9d6vsscx/L/6jl4oZBPcCd
 JszA5RzfUpCXjM6PsBUJLWtEv3CvGPWxeP/QTNT9WDEAS/1vntSijmbefPkBg2vAWS9k8Xwmz
 ViNVbR6cdPFz86w8vFiBpp+Ay5hSV4dR6O9QhXp+xuy54zzBqfWMFksvZce6aARsLdv3idUgx
 QpU3hF3yMJQm3nh9Ke2IKzoZGVj7pFzHpe/9ZqjFAB7ZZGw7h9Mo5+sBn1d65qOQtAaSUtnyO
 W3pOD/72A8PbbTZpZdfkaVncbb09ezhVtCgwPT/0yqZsDz5pMUPs8d57jp15wlF+qA7LRA7NV
 YUwetVfBL+qG+vkpCfFOPEjloDLY3jXW+ScdGW+6DkD6gE0t9L3sclpHXHYN15XO6J9gMGey6
 wvhfjRQC+HRsI/3egChdexzRrljwP9oFq83IUantL+7Lv8DJ5pnHMxdABnn+qIPk91aJHWr+V
 zyg3o8r55ckGZrTNsvQs9NN2HGUTMun+6A0IbCQGI721PgKeMHHnarTAXofdWi3Hbw2SVK4xi
 WPDZLIJTPcNRV0Oh7hi4k0ac1hRY0thgv96Yxd/iE5ng5CNSsqWkYsvDXrJHZnKWFnuZIofsb
 f/sWAuUZnMNo9Sy0z9NyafUlURJhGadS0QflNspF+QKP/ukFufMGtSFuwT1Yf29wnixJgCXOy
 Wy/d4SXoY8QnVklZB8MzlSc3W4vh3yICgl07j2nXQiVeuZ/Te8kof2p9vcDlqudA4XSC3bmGW
 QmcjdRSnu5KWMtT9vkgpsEV9qXGBjKWAPmrluxH8lnhZ5G7uEyjxDAm9A==
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
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


