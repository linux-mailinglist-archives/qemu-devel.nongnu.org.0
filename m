Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB174528867
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:20:50 +0200 (CEST)
Received: from localhost ([::1]:38772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcWf-0006pG-U1
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqc3i-0005r4-RY
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:50:55 -0400
Received: from mout.gmx.net ([212.227.17.22]:55565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqc2o-0008DK-UO
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:50:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652712577;
 bh=XCzoKtLiqwB+wGIJydxODnfKgMRFnsuvuxrP+KHIzYo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=JpBXPU8FIge9k/NtiRQQFoX96lk/Ku6s0m7OiI4/sPlnuZxMBQjD14feEzFvmWb1P
 2jeLp+RFxYaIG0oTWeyUjc50sF/RcYtmpLvjl37B1Z6y1TzMya0wZDtIEL7/hcwE2b
 tz3J/L6t/vA20clIdC8eQzLN7OEw7KltJCbfJ1D8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.160.68]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8XPt-1nmXZ21egj-014RH9; Mon, 16
 May 2022 16:49:37 +0200
From: Helge Deller <deller@gmx.de>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sven Schnelle <svens@stackframe.org>, qemu-devel@nongnu.org
Cc: Stefano Repici <rs.rdp@zoho.eu>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v3 6/7] artist: Emulate screen blanking
Date: Mon, 16 May 2022 16:49:33 +0200
Message-Id: <20220516144934.36273-7-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516144934.36273-1-deller@gmx.de>
References: <20220516144934.36273-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VVkmzj/a9xLGdT2rLvw+AJe3Jgg7SF/UXo7XLmo/z03GiOJEcEr
 i+UkzJYCWfCjvFLh4LuZ6ZtuGZDCf1zIHmMTTWZ5gqw6VWrYAqNYCWAoHqlvZmojtJnXiCv
 J0W1/ydz6z5l+advR7j6dHBibUHhbg/vciP3EZy2Ye70C38cYFJ115gEs7qo7ZokID8kTw1
 wXi8KYUq3qGtNrIhgTVvw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:r39ik5W5P48=:vPFs2jVagxtKMmCtWBzM6h
 PqOengsAg1et9mvp6LKS5cUvGoU8TXhaUc4LI8+KwyqQGrVRrpk1XmOWj9xVBBvqng9Q82MK6
 IVYbCbGCBd0lC1M3yn7EQhiJCGlGZz/zj4KrAKgEwkRiJVbIBTF1tP81FsvOACqVbeqEZH5sm
 e84HdScsehr+GwLnTIh9pAEZJrvjRU003+ZL+P0HX6/+ZieMybJvBBb6w0Z33eI0b7fSLrGM8
 ujRbgS9I50DwG/47s3rhWSpLcK04Q1t/6R+Y68pxLnn41E+PeKyKO/VtXZMkZdknfRzRB7Jhu
 J/HhwOUykVVoNc/UZFrY2uCFJzn/e05vsP8f/Nw6JdvMczD5IKq1mWpWBCqTw/mj6pKymx2+E
 fzQCZUass61BKSepp7Pm2KIqGXiNrTyXPL8iAlG3HsnQtZOwWEiVhc4x26ZI/M8pW2Cc1EaIa
 XMHN8OX0KkDpZny1URQpaJ/V/LGYqOwPAMM3g8PJywD4EqJnwR6tT+yn2WhFNqvH5fLBUamSm
 puD3/pwyKW4B2Ag11essorzX/8a3q0lExabgF4lzANtW2aL+pBbyfgTIaaz+Eufaso42POGWP
 siEcDs6orWxBkMg4QAJugy51rXxYR2p2MEAFrfnTsy+vqjqmPKQ7nQwGGT/VIb4BWWVd5OmBf
 ElnIYbpW482B8AXzZ/KoFX3LLRhGzn6NK+SCbdbSsWdhQuX1NTGKm4L3WSQaXX+GjBekvG+lB
 vNVuCHmNpdprRSyWp/to9rGocLgEf3LJD7CL13+6OOddAwny/PNL5XxtXvNhKskDugaX8YNZ+
 wNrYjV9bAGvxMAS9fINmryffwPDhB3ZM34chVYu1btGt5rhreoLhefJGP0jItjzMLqp97eNRW
 eg56dF45ckp1P9O9zp26R6Ht7/zcKfh0ibqeddiBX9eLJwrPXkd5FX2FF6V69Y2lDPaO21BfG
 Uv5vw3hMd9SiOsaPQFp68K+ygxhDGOq19JHm0++n6bRxLQPeQoE+5XHX9YmWNdhGRKpnfMLRT
 +QMEpAUGkP3RjmG3wUT2mbhT9k627QS1tJKtds3sriSFEzr6hTmBUP3t9pWfml1TEU7pLmNo4
 WcW2LqlmUqRVgI=
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
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

The misc_video and misc_ctrl registers control the visibility of the
screen. Start with the screen turned on, and hide or show the screen
based on the control registers.

Signed-off-by: Helge Deller <deller@gmx.de>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
=2D--
 hw/display/artist.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index b8930b7c5a..49dad2b824 100644
=2D-- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -201,6 +201,8 @@ static const char *artist_reg_name(uint64_t addr)
 }
 #undef REG_NAME

+static void artist_invalidate(void *opaque);
+
 /* artist has a fixed line length of 2048 bytes. */
 #define ADDR_TO_Y(addr) extract32(addr, 11, 11)
 #define ADDR_TO_X(addr) extract32(addr, 0, 11)
@@ -903,6 +905,7 @@ static void artist_reg_write(void *opaque, hwaddr addr=
, uint64_t val,
 {
     ARTISTState *s =3D opaque;
     int width, height;
+    uint64_t oldval;

     trace_artist_reg_write(size, addr, artist_reg_name(addr & ~3ULL), val=
);

@@ -1061,7 +1064,18 @@ static void artist_reg_write(void *opaque, hwaddr a=
ddr, uint64_t val,
         break;

     case MISC_VIDEO:
+        oldval =3D s->misc_video;
         combine_write_reg(addr, val, size, &s->misc_video);
+        /* Invalidate and hide screen if graphics signal is turned off. *=
/
+        if (((oldval & 0x0A000000) =3D=3D 0x0A000000) &&
+            ((val & 0x0A000000) !=3D 0x0A000000)) {
+            artist_invalidate(s);
+        }
+        /* Invalidate and redraw screen if graphics signal is turned back=
 on. */
+        if (((oldval & 0x0A000000) !=3D 0x0A000000) &&
+            ((val & 0x0A000000) =3D=3D 0x0A000000)) {
+            artist_invalidate(s);
+        }
         break;

     case MISC_CTRL:
@@ -1263,6 +1277,12 @@ static void artist_draw_cursor(ARTISTState *s)
     }
 }

+static bool artist_screen_enabled(ARTISTState *s)
+{
+    /*  We could check for (s->misc_ctrl & 0x00800000) too... */
+    return ((s->misc_video & 0x0A000000) =3D=3D 0x0A000000);
+}
+
 static void artist_draw_line(void *opaque, uint8_t *d, const uint8_t *src=
,
                              int width, int pitch)
 {
@@ -1270,6 +1290,12 @@ static void artist_draw_line(void *opaque, uint8_t =
*d, const uint8_t *src,
     uint32_t *cmap, *data =3D (uint32_t *)d;
     int x;

+    if (!artist_screen_enabled(s)) {
+        /* clear screen */
+        memset(data, 0, s->width * sizeof(uint32_t));
+        return;
+    }
+
     cmap =3D (uint32_t *)(s->vram_buffer[ARTIST_BUFFER_CMAP].data + 0x400=
);

     for (x =3D 0; x < s->width; x++) {
@@ -1384,6 +1410,10 @@ static void artist_realizefn(DeviceState *dev, Erro=
r **errp)
     s->image_bitmap_op =3D 0x23000300;
     s->plane_mask =3D 0xff;

+    /* enable screen */
+    s->misc_video |=3D 0x0A000000;
+    s->misc_ctrl  |=3D 0x00800000;
+
     s->con =3D graphic_console_init(dev, 0, &artist_ops, s);
     qemu_console_resize(s->con, s->width, s->height);
 }
=2D-
2.35.3


