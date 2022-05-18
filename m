Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7760052BFBD
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 18:21:53 +0200 (CEST)
Received: from localhost ([::1]:60470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrMQq-0007A2-HZ
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 12:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nrMNF-0003jr-Tc
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:18:11 -0400
Received: from mout.gmx.net ([212.227.17.21]:52697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nrMNC-0004Lp-Mu
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:18:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652890681;
 bh=XCzoKtLiqwB+wGIJydxODnfKgMRFnsuvuxrP+KHIzYo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=gH9bUJeUzkf42oDrfHUWX7GM3vw7jcfoUxJmS7DA8mr6tyMYj8C97W47gY+8Vj75F
 kfkEWndexFu2rfj9I8xMg1Eg3iWHKvhuwl9/a9/TWUTNKVs6xY60KI8pZAYhnQiuDl
 utXWMxIMEUlv2b+6GG38MwVFp0On0R2HoTxn5f8o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.138.233]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFKGP-1o6Ue80NzN-00FhtW; Wed, 18
 May 2022 18:18:01 +0200
From: Helge Deller <deller@gmx.de>
To: Sven Schnelle <svens@stackframe.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Helge Deller <deller@gmx.de>
Subject: [PULL 6/7] artist: Emulate screen blanking
Date: Wed, 18 May 2022 18:17:57 +0200
Message-Id: <20220518161758.49036-7-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220518161758.49036-1-deller@gmx.de>
References: <20220518161758.49036-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nlcWhlAZeUfRJW9F5YLbIbeCW9t3GoyGQPTunX75Md3PAjx7tWV
 Yd5T7jIWRmdUnJlsUJGw2Th7wfUHpEojEQRaX+5rTBO+Q+oK56EmsqLhklTGF3rTpheBYPD
 qRZF/yUHXeHUTe2t5Z4KUrnHGduLsPRLZtEVpMrgKpjKbelf9Ysd+oSGwWVz1gd27/ohM/h
 yub84jC13KiPbqjL9Z0HA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:39R8xYKQDOI=:+e9YoAAQsv6AU5/zkkWyu5
 YPpM/CvbYx955dzQK1q49inaktt9k1zW6dQy52bBj/jpUJqhCq0ypcCOu8PN9b8csnwoxoEua
 FU90H0eMhPDoX+VFdyTl8FE4kLTwU91zu2UH905OOAzKu+mvDb+uoM60DrA8zwAiYI1dgxSHU
 i0LH2eaXi2hcBrNBkI9rEWh5XCogwLurLFTssuizNEhPX4yvdUs9EgCeFKYYHHNDFzmh1N8Ib
 Q7zPSYs1QWLyR6f2wWhEj/CL4KG8/Eou0jVeZyCFhhLlkdQHjm/FiorE8i36E8IEBW1H9AwXw
 iMW00slCCOG9Yjo5vXf3e5GTzWXrQ1kcFyM6Uf7a1ghcyeY81UV3TTJFPKkESGeMt0LhGYHWd
 kAnpQauJ6kpQblxa/QHqf6erM5Bb45+0IU7U35RpPeRkgYUEVw1zwNx8rjwCM7pCxxnM2RRa+
 9ge9L5lAiLPNiIMaB4BEtxhcqO8qPNimXaZtSbWJ1Spgg4FnYAi5lKmDOw6e30Bh9YK0F/Lq4
 NDLSG4DEUlzG37zaZrAqRAxE9qbBIYd8Ce4fb9Mof/RwmT/7Nhc4iCe59N0+1m/3My1ood98Q
 xpFTSqaFsfK3o03It1uUmGpTAubSKbQALMiw4FEfHXJ8R99i6wDSRqhRtkg/zu1RH3Yag9pPR
 BwBpR4kCIsb1Bra2Yb+U8aHeqDS1zMFoMyWX1gs+NYKqX98/x5LcspQjdr3LxdT19A1Z0Cypk
 lMlKEELiJyIWDmOUT5CPedhRWO3FUUIzypOFKiYZwkWjYmYo4MtfJZz9M+Lf2Q3GwmXaq9CAo
 WDYKs7ZlIjbwSXZulVjFB5cvWzivDWWEu4drmbLxPdxC0ZktH02Dy0/0AJe5JsajbQQrbd8cx
 VBwX1HMSUFleWGBbHugRRBc3D51Hh+zxgHSr3QmB16G+a4cYSstnMhO36joSH4CCt2Efg5VNp
 HdNvDd8zDwj27aa2Bhc4QWfNg7+4Vp9jnSgDEvJ39JlFt6beNUP/ycMTYsclBwoTPS74oYmob
 Ba+UCursE4xU4s3VNR9CFC0CAnLdofKFsgJL8BPKgkyVFROGw7ZBC16tsRhjZZu68CY5xeKqo
 x0yEu/RN2n2H7NoC9X8h+tm9vloAsaQrI8BQYmszJglF9L4A/l0Kf9kJw==
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


