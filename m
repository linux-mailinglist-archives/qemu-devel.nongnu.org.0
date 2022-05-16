Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774F45287A6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 16:55:25 +0200 (CEST)
Received: from localhost ([::1]:47294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqc84-0006uP-1k
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 10:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqbip-00037O-CR
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:29:20 -0400
Received: from mout.gmx.net ([212.227.17.22]:34989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqbin-0004vq-B1
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:29:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652711350;
 bh=XCzoKtLiqwB+wGIJydxODnfKgMRFnsuvuxrP+KHIzYo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ghl0w5yvYFE0Mu31Cl9XLGwLOQoNlByER3GszJEjLCncHxkFYwy1Sw4NKwXip7qLa
 f/L6dGUe5vcDRk5o1HmMbKH1ibkQYttK5iYB181wAuM+HnachKJSoA/Ty1DF0WKkFI
 Ok++/DcMEFQn1QOep18aGYW12LChqzfwa4E+wcds=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.160.68]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHoNC-1o4Moi30kg-00EvPC; Mon, 16
 May 2022 16:29:10 +0200
From: Helge Deller <deller@gmx.de>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Sven Schnelle <svens@stackframe.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Helge Deller <deller@gmx.de>,
	Stefano Repici <rs.rdp@zoho.eu>
Subject: [PATCH v2 6/7] artist: Emulate screen blanking
Date: Mon, 16 May 2022 16:29:06 +0200
Message-Id: <20220516142907.32827-7-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516142907.32827-1-deller@gmx.de>
References: <20220516142907.32827-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Guc79zQl5HaXOMTmpaLn/G1ldWcvHVq4+G7clX0sYkf3V6bJfZ6
 lz5K8b4uXjQYSm0On0ayxBfqN7E3Jko5H349r6fXpPOJXxpMgPmwkjBcKQ0o+oNX8EvvsK7
 mvZsRvGflF9+9l1xxB+MF6YFKrcy2/H4fVck3cY6HDt0hjInsBOA6AQNuXSLpidksDK+Zdn
 oeozRSu/onhe1h1HkkUuA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fLp3dRxNtG4=:iTTR7Rv1bDavyjsyU5KDNz
 mBM6zAepBurfio/C2ZudW96g7u9xWry6dd6jOrEdReU8GctqhLLv9nyByUe8Z5RGMOGo1Awpg
 PtqNyM6EZzjAdDyqNxeWey0b2UEDMcQEOmSk+w3M3a/k7Efdixp6VOd4NuHNYdCGv4CKtyXEk
 ISECVJIHmbvRFxwQpauEwyg7FilSOAjpYVE4DEsqOphxmtiasPj3mtxfo0bmlOmlHLT/whBDs
 y1AyTcjJP+dT5OYseTZgm3eHsNqfYgVk2tSiNPqt5R3CJstSngrG0VvHREi3bO/HhF0UdVXQb
 TqIXbnAdBPdDC7AhWPecdu8EFk1e/PFebJLpdjfqvM1kL5ZVnIUvMdh+2rL1d3IHSZPq8Save
 3mYn50TQBTH8VlvRuZzhWfZGV7CSnOkYTZQrtQAhoG8/hitgUIGGwOJCq6irt/nBvatnSY9kg
 THkiM6O5h1/12bSEiCmGMktbolgaVuEk3w7A5j+AkHJvJ48EoBfrvV9Hkrd/mGiMVzqMBJ9kO
 hZKfifciANZtP30kFYt1gW6NaSnTEpnFguikrd5QpshqWyvtHwrJKiaG8Z/WJA48Am2Gd2sIs
 +4yocN/WizsTDbqJACVoNWOel3mS2OVQj9UnoysF1IhuO+7IGz6tKU4fxYmRQmqucOpeaJt9U
 ALm0tVlBqa9a7pxo4M2YhGv/zD3uYkBATO49j8sfzO84Wu8yoDe9tLftzBDf/MQquYYybkO3l
 ZvU8CcWbekO+7KJC27MKROLW5S/0uVfTZ8IeXSbxz4kzkG1wjSaim0Kaf/KKzLo9HVBRaHhzp
 Z2QOgFXOLW+EM2DBk4ZPE2e8GVcHTaiLONuoNJtuGQTENG9iprBSdxUgpbFSsIv9cfLdRnaII
 +AE8xPfYuLGUZNzumO3eP6NKgzZz6tVm2CE9e+9h9/Nj0dBrbx0fqPnJXqdO6cZ+lQdU/lGDv
 VbRCiMbsZpIxkyWqmu68i/wSfXIaY5MOSFWMtXu+fMwlWrmpL8ar096RSwY+zx+Hb5+5aiIOn
 OY70P22S1TQORi5OC09z99kd2yBZKh92ZmIMDSTVecMj1Wu1lslzBNP8kijQgJ9DXEgXIVdXx
 XgU6gX/AuIxLTmr6t7sYkVU5VHxCzLE9CgV41OE1Cw1Cf23yWyEPFqMgQ==
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
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


