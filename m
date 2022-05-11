Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE1B524141
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 01:57:37 +0200 (CEST)
Received: from localhost ([::1]:41038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nowD2-0001bi-DP
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 19:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1now6t-0002X7-0a
 for qemu-devel@nongnu.org; Wed, 11 May 2022 19:51:15 -0400
Received: from mout.gmx.net ([212.227.17.22]:60065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1now6p-0007TE-N9
 for qemu-devel@nongnu.org; Wed, 11 May 2022 19:51:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652313056;
 bh=ipkIfDpULgb02Y4ogyOu7byQwpEWDVsos5Snk4Q3aWE=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=HX4mZ11m0Ik4yoxIvEw1wjuHLyLQHSQRBSgYNsxpMD/FetgXELR4CPu9pwqrXLKqX
 L2OQQFdm5gYOR4xbLPwKQKGfDlOKTJbRTwB7jHmGSxWSQ9WmhdWZNb5uwJ9e7wdcMK
 jXOWmroBl8L1SDGvwnW78J/WcyuNI4/+IyD8CoGk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.141.127]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiJZO-1oJLBG2Rc6-00fWBm; Thu, 12
 May 2022 01:50:56 +0200
From: Helge Deller <deller@gmx.de>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 6/6] artist: Emulate screen blanking
Date: Thu, 12 May 2022 01:50:54 +0200
Message-Id: <20220511235054.185435-7-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220511235054.185435-1-deller@gmx.de>
References: <20220511235054.185435-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PB6XV/v9XjjPy6jqoO+g3rJAl8KKtwFaditgfkK1cwsg0HGw5UE
 ac5ZIDd3e53KmpXzSdT72/aDyX3HNzniRejUZ8CJk0KYiJ6LPfmtXCa1iS1k2xdVb0GqNDT
 Zx02QT5A9KOL/hOMHUaEamGZCa9eN4M2QMj+cA76wCetFHsyLwzBW77tWxef9rFUs/d6RNP
 EOyMPqfYiXM1TcAdBzhkg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TkdX9UCrjCU=:BlWlRL+fucDYD75kGKA7LG
 sAEu4Wgp7nAfGs8FyJyLi7Ca+6IbZwtAQWM95yp4PbSWaxZB5SEA7aIlo+o0Z1GNtGj2Q0S5N
 jMSPUkkI0S881HaEzObZbVopas07f9DFSLyqfBGI45QamuRe/id7GPX7rnqeERdtxsPUgGCDF
 +46COWfpkk1Z8ONuUQrLh7yh5mob+SAX7psj22hVQp30O4kgsOeD9n00Eldw8UtJgNtnrUCCO
 KSXXFUol41Jb8gyjvsEwTKRsV0ObeYEl/GpGtUoLLMXboEmEUgKmGqMo/MIG0olLJZDWmq4Wx
 jJkEwM1jDhl3C2nXt2hgtIr+rlgHq93CtoD6lTGNC/RRiMU9T0myaJIFelrY9zzP0s50NiTZX
 vzY3UauXDGZW3WxaGbNAxvP0BAJTtMHUEqEJxR3KLEFuP1tw9+eH9+djEykUo0T+ixY05rgIw
 XvUkif7BSaw3bX2Scx91b9VnBncI+VIq3BegqtFsi/5EoXZ9fQTEwlWUJRt94lbsvu9b8ljjI
 s8qJNuwz4XZnG8QIIgHbz5WPyhvXQX5Onio1PiIp9U5QdFK05K9oWnIh9aijMUHmnFHH3lVLV
 KnQvZG3pXOXyoxLktAy9wmi7zHs0QghO6626QCu9FukVePBkbJlMPxC/WE6gZevnzzc3F0nlm
 hDviJz5a6kUKJdsjgr2UfU/z3zodQesZwXOCyGwhV7VpvhztMyolIiuxEb9MISAi3VRc6npm0
 K25/cfXwEnYvEerOttZw2RY+VtiQnBXZiLVp5Cel2WcG2iGJRO763AE3vZMKEcA8cuzPNfndY
 HQAG445ghdvxaazzuIDponT4C7atI5HdeTbDR8KCQ/HxAWJDYm9Ivc/SD5zmxefl32qU/1XVQ
 P012wXwn6zQuPfVYEfhDkwAgW8Ujcs/6u5vRARW2J1E96kzThXSpIiG1wM66vLhxNLoG7Z4Un
 l2IzFHocAT33m2GM5mh2ydDHJuAkCbbrMeeQpP0ChtwFcrfSdjnWU454AEYCbOo2T+vqN1Bon
 oSgtAckzGr16Dlp2ipnrty1EfJmmm20f0KcIziVD5gQpJZGARCc+gBE/RWGtyqUQNMo6nBJGt
 MB9nrOFHOxkhfI=
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The misc_video and misc_ctrl registers control the visibility of the
screen. Start with the screen turned on, and hide or show the screen
based on the control registers.

Signed-off-by: Helge Deller <deller@gmx.de>
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


