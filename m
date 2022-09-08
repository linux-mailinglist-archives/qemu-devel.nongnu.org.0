Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C231A5B250E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 19:43:13 +0200 (CEST)
Received: from localhost ([::1]:50008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWLYW-0001lm-HV
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 13:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oWLNc-0003yD-RC; Thu, 08 Sep 2022 13:31:57 -0400
Received: from mout.gmx.net ([212.227.15.15]:36661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oWLNM-0002B9-Du; Thu, 08 Sep 2022 13:31:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662658296;
 bh=uz0HEKPQXy5htiKKPgDEqSPCV3sLLfX7XGDzK4H4rcE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=MuQlEbVs86w89j1QRPeSk1mf4ZQJ87YUdvr8ptTgfqRwyw14wXock9/k9wzodqrSW
 tsLnu+uiifZPVd6JjY9Bxwm4YPmFNoE2eE2LVfuluGBLvEvHa2u+X/jVbCC6OLfweA
 1hicTwYkz+sYtQsKuHwXEI4T8qlYpYbVDBgfHopw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from btm-mobil4.fritz.box ([178.8.103.19]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6UZv-1oQ2uc330b-006yan; Thu, 08
 Sep 2022 19:31:35 +0200
From: Arwed Meyer <arwed.meyer@gmx.de>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Arwed Meyer <arwed.meyer@gmx.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 3/5] msmouse: Use fifo8 instead of array
Date: Thu,  8 Sep 2022 19:31:18 +0200
Message-Id: <20220908173120.16779-4-arwed.meyer@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908173120.16779-1-arwed.meyer@gmx.de>
References: <20220908173120.16779-1-arwed.meyer@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bPmiLkjmeuF2sp1B4g9lNY6Be/BsYbcLnjx1XjnGP67Y2vscNUU
 aMi/tSTyAv711TLp0Trpnm2H3W1t072trubWvwJfTu/bZrqS/njEqmzT2lUkjjzUEa28TRu
 a8XmK2U/TPczCWAIVZrkWmCWcT2fRthGrKF5YQ3r3WPt1M+7YFnCQ69I6gYea3l6kc0x7MC
 PZXs71EVXHQzjPRpAvsDA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9COAYLUEnUE=:AHcsYyFSSx1tWpscM6lebO
 FvrQ1K9j/lvZW8PCw+zHngRQjtYkVuGSTc1KJF5D01USc7ufOeivtUiHK+X5yEsQnNKWOM6Re
 E36vs6xOuKLbhf/k3Mp7KFAKI2UrPP1q+Q6OTCl/no/ZkD7FR1CEk2pV/n70S0mI7J5gMdvNG
 WLcBDVgaWGo5HWgoaddhdESuB9BHOL0nEF78RqBN/5BE2HqsGJWRKJkn3hHQrTUuv31bMAglj
 Qy6U0nHsZ7WpFe/HTitwnEe/3oN8b+2o1dvqx3DjbRguT1s4dLO3AJUVs7rJS5ItjKN9mTBYg
 I5SuxiLl2u8L1/b0Y73qAiaaHVnqSY+1tAbalSc9UHjobbHT0tUedyjADIqoZuM7OtcBO65h9
 Bkdb4ttM+YzmxEW7YZaYm9LdauPnm5iLvCY1fz/kFdfc2xw0A6uwMukc46FdnHZYs0EDzvQ/H
 B5wmmyK2GTztwE9BlglGZugZgIthnSU9H69unyG4xwxTPwf88WCowj9KVhiLhKf9kIi4DAlNQ
 aaU61WmCr52vt/QtVJKhLJQPi+7Pbv2bYF5huJngkxfr8+7wNhv63mLyr0AIb5ZnrJJlTuS5G
 aCQEFHv3WXYJoz/ONionRNCCBvroW8FNzQbDIF2VVGc1mzwZl/2QyqmUB13oBZUEpPAj0X6Ic
 wd2dJ9rnYjN7mB5nntR34FWTZyVNtohGPjTfMy+qn60AYiajdq4Db6oZ1KhFiSDdGh1sq+vL9
 kblCVziEdvHc0/joTQ3qghKHsrUVgaSZkDbFVke5KK69PzaBLYq2FGKB9vAbA2mS7NSmeacNn
 OfgvA5ioNWciVyPlD/IXS1mlf0mQBOwm7z/nM5kVM8EpJqa2jFAwUSYFtL55uIlJ4QXDq3p4a
 WbSUQqqc+jX+3jUnvQoodFGqoOiwAqus+WfV5eaw5UlrNkmiByym9Ifblnh7PgTHS6fKeVfBU
 +lN45upj0mkM1AuS6tM0j1CfyCBh5ad3W1Lato8pt0xHf/jyioy9Ap0wD2VsbLdT/FXcSdhMx
 LbhaXL2a0zikxeuZQ/ZLbJV/yPevuINru5xHrazWGIo6HG2HTHf/pCoN/7hj2XO2C+cmBrqM4
 QMZPeQ2Svx7RRWpirkR8iFIJHWXkN/Jt4j382nlBVbSnfwzzL+YC8gxkKGSHHvJxlSrlZWe0Q
 UwSX4Vw3Rbpe6ZmWBrj0/KLWCy
Received-SPF: pass client-ip=212.227.15.15; envelope-from=arwed.meyer@gmx.de;
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

Make use of fifo8 functions instead of implementing own fifo code.
This makes the code more readable and reduces risk of bugs.

Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
=2D--
 chardev/msmouse.c | 43 +++++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index 95fa488339..e9aa3eab55 100644
=2D-- a/chardev/msmouse.c
+++ b/chardev/msmouse.c
@@ -24,6 +24,7 @@

 #include "qemu/osdep.h"
 #include "qemu/module.h"
+#include "qemu/fifo8.h"
 #include "chardev/char.h"
 #include "chardev/char-serial.h"
 #include "ui/console.h"
@@ -34,6 +35,12 @@
 #define MSMOUSE_HI2(n)  (((n) & 0xc0) >> 6)
 #define MSMOUSE_PWR(cm) (cm & (CHR_TIOCM_RTS | CHR_TIOCM_DTR))

+/* Serial fifo size. */
+#define MSMOUSE_BUF_SZ 64
+
+/* Mouse ID: Send "M3" cause we behave like a 3 button logitech mouse. */
+const uint8_t mouse_id[] =3D {'M', '3'};
+
 struct MouseChardev {
     Chardev parent;

@@ -42,8 +49,7 @@ struct MouseChardev {
     int axis[INPUT_AXIS__MAX];
     bool btns[INPUT_BUTTON__MAX];
     bool btnc[INPUT_BUTTON__MAX];
-    uint8_t outbuf[32];
-    int outlen;
+    Fifo8 outbuf;
 };
 typedef struct MouseChardev MouseChardev;

@@ -54,21 +60,15 @@ DECLARE_INSTANCE_CHECKER(MouseChardev, MOUSE_CHARDEV,
 static void msmouse_chr_accept_input(Chardev *chr)
 {
     MouseChardev *mouse =3D MOUSE_CHARDEV(chr);
-    int len;
+    uint32_t len_out, len;

-    len =3D qemu_chr_be_can_write(chr);
-    if (len > mouse->outlen) {
-        len =3D mouse->outlen;
-    }
-    if (!len) {
+    len_out =3D qemu_chr_be_can_write(chr);
+    if (!len_out || fifo8_is_empty(&mouse->outbuf)) {
         return;
     }
-
-    qemu_chr_be_write(chr, mouse->outbuf, len);
-    mouse->outlen -=3D len;
-    if (mouse->outlen) {
-        memmove(mouse->outbuf, mouse->outbuf + len, mouse->outlen);
-    }
+    len =3D MIN(fifo8_num_used(&mouse->outbuf), len_out);
+    qemu_chr_be_write(chr, fifo8_pop_buf(&mouse->outbuf, len, &len_out),
+            len_out);
 }

 static void msmouse_queue_event(MouseChardev *mouse)
@@ -94,12 +94,11 @@ static void msmouse_queue_event(MouseChardev *mouse)
         mouse->btnc[INPUT_BUTTON_MIDDLE]) {
         bytes[3] |=3D (mouse->btns[INPUT_BUTTON_MIDDLE] ? 0x20 : 0x00);
         mouse->btnc[INPUT_BUTTON_MIDDLE] =3D false;
-        count =3D 4;
+        count++;
     }

-    if (mouse->outlen <=3D sizeof(mouse->outbuf) - count) {
-        memcpy(mouse->outbuf + mouse->outlen, bytes, count);
-        mouse->outlen +=3D count;
+    if (fifo8_num_free(&mouse->outbuf) >=3D count) {
+        fifo8_push_all(&mouse->outbuf, bytes, count);
     } else {
         /* queue full -> drop event */
     }
@@ -172,9 +171,7 @@ static int msmouse_ioctl(Chardev *chr, int cmd, void *=
arg)
                  * cause we behave like a 3 button logitech
                  * mouse.
                  */
-                mouse->outbuf[0] =3D 'M';
-                mouse->outbuf[1] =3D '3';
-                mouse->outlen =3D 2;
+                fifo8_push_all(&mouse->outbuf, mouse_id, sizeof(mouse_id)=
);
                 /* Start sending data to serial. */
                 msmouse_chr_accept_input(chr);
             }
@@ -184,7 +181,7 @@ static int msmouse_ioctl(Chardev *chr, int cmd, void *=
arg)
          * Reset mouse buffers on power down.
          * Mouse won't send anything without power.
          */
-        mouse->outlen =3D 0;
+        fifo8_reset(&mouse->outbuf);
         memset(mouse->axis, 0, sizeof(mouse->axis));
         memset(mouse->btns, false, sizeof(mouse->btns));
         memset(mouse->btnc, false, sizeof(mouse->btns));
@@ -204,6 +201,7 @@ static void char_msmouse_finalize(Object *obj)
     MouseChardev *mouse =3D MOUSE_CHARDEV(obj);

     qemu_input_handler_unregister(mouse->hs);
+    fifo8_destroy(&mouse->outbuf);
 }

 static QemuInputHandler msmouse_handler =3D {
@@ -224,6 +222,7 @@ static void msmouse_chr_open(Chardev *chr,
     mouse->hs =3D qemu_input_handler_register((DeviceState *)mouse,
                                             &msmouse_handler);
     mouse->tiocm =3D 0;
+    fifo8_create(&mouse->outbuf, MSMOUSE_BUF_SZ);
 }

 static void char_msmouse_class_init(ObjectClass *oc, void *data)
=2D-
2.34.1


