Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126FB5B50A9
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 20:37:49 +0200 (CEST)
Received: from localhost ([::1]:59474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXRpz-0000kw-3E
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 14:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXRZ2-0005TZ-8F; Sun, 11 Sep 2022 14:20:16 -0400
Received: from mout.gmx.net ([212.227.15.18]:52783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXRZ0-0003UH-C8; Sun, 11 Sep 2022 14:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662920410;
 bh=6D2n6vt7vPa8OcErSCHndf2SWlv4bAa6GeHMV0v/ui8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=lniC+4Ci8G4rO7qgtPV7jmod95o+JcQDCOthXDrF8fi3cGfLFYer69Z7Uk1TDsvZa
 aDoR9DJeaunzygATnssBQFqPM3VoXjc0YXhsihwmqYKVPdxJJL6LB8D2gdBq/EgppV
 af9kSZlem1qEPceMHwpeKnqgpaopRXs6UD9p+1L4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from btm-mobil4.fritz.box ([178.8.103.147]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MFsUv-1oYFqY2gAx-00HS0f; Sun, 11 Sep 2022 20:20:09 +0200
From: Arwed Meyer <arwed.meyer@gmx.de>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Arwed Meyer <arwed.meyer@gmx.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 3/5] msmouse: Use fifo8 instead of array
Date: Sun, 11 Sep 2022 20:18:38 +0200
Message-Id: <20220911181840.8933-4-arwed.meyer@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220911181840.8933-1-arwed.meyer@gmx.de>
References: <20220911181840.8933-1-arwed.meyer@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hbiNUpFGzGCEhFcR1lJbo7tZcJjqaKaKzJaxuYIyZD+g5dDnDXB
 gqMeQ/RYSYO817d8eUfmE/o6ZCQU7Z8kvbD0q8T+sC8pWVRmXdza1xw/JJlRYU8JXIRuJth
 gaT1kZaI/iA8UtDY4qGDPdJVPaamlVLGyDCMkVCEtnApRD6s6XepOQJT6hNkq5UE8LDDo3d
 Zkrh9leNN2fFivc7slSUA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UmwsYnUG2cc=:NeJnG1RJ+pNaJZfSd46bgm
 p0LrfN5RfwIboD8uwCaHnkRAswVfU+0UPT33VdLM1SoHq5fQppl4lOVVtyIpHf+1PMKFcm7G4
 uPzToZ6PT/0U9i0BiIvh6scetcx9CdMpVC/hYXIai7oZ/qWb7SATtRGqbo+VJJ5MUFaS2OdkE
 iNc0+r5UkZQEMhjCNeVcIA1kcnhjJUi199/ORdlSwWQItzOndU97JL+hntdl4C+ddRrR+cqHy
 zTiyfsZ+J38YxGfxHj+DWtjKSSyDNwhDbPjCEn7YOnh1kivN4jqom0lfHp7yZyUacPQRXl1uT
 Z94k7JYsggKvxwKOXOxDKXBCZ+7Ve8wujCInRvPISQ8R75L2KQ6HneUa3KgndA4CDDRCoNXFu
 RNgVsrDFRmB3d45eKoYaNtOutlIDNLoxQiNj6BCerLAEtbs4aLKudV5Y0AF5jGo4CR9TinTVa
 Dp8IRKTfyYZmo2VmN5HYRlk+JJSHJDI02QUmhkmb90DOx67KuY9BLDjETlHz6ACnEzMT4vMH6
 PjwAMC5pfJTfaGI9h9ctc+KvtUhTI3s18Cg+3Gdz+hBhwDV6Q4WloLCKXAunsvB3L4NjvkWmC
 tbE051h4Mg6A/tjkoBB5HZDOVAzsjKcdNElMJbuiZ5kDUHuTtZI7ET2XJGrht+FyU+/ROi9iT
 AfRYnkHEycxM2QXGkoOTU2Kds6IoOAFmqdWq7duUMhkENvJI8y2ayQ8r5E5w6VCABJjLyimis
 8nc6GGZV59FND5tKBdt5gVNUjOX/sviSMntaHuXm7D/hOBUDOF9YS5Si+Un+d5xGOkcBd0GZH
 lo5D+u0YG0wPm5Dyfc+c3kcQF1jglyonggd4UngTa/zUZ4BzKjmKllaV1BHifTjLN6cHMdfvp
 SHYd6yxdEGiWuZ7Q3kJVHQo5EMMqrKezRICta5tbYNcQ/cJ3sljiQ1VDY7vixAhJwmpJR7vgr
 PWOxvLSnx69CldhhDz9+ydQUpEKn2D7XDNCQP4JlpCp/jmrdu47Cuyz3RImL+chqVZiNNpjdz
 9vlHGkr+i34Zo5J51cV7JfuB43eIM+H0HxsWXffKZZotwtoh4umvuOjqIEYZeL0Jsc1htgOsQ
 MVvN6QQ+ab2hET+q2Ke+2Uy35JVBc2svrI2ckQBJRTFlnf81cBu7Zhn06462TU5DnHxxhMLyZ
 t6R0pvk7YhdYOCHTNiiJba2CSf
Received-SPF: pass client-ip=212.227.15.18; envelope-from=arwed.meyer@gmx.de;
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
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
=2D--
 chardev/msmouse.c | 47 +++++++++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index 95fa488339..5982c15df6 100644
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

@@ -54,20 +60,18 @@ DECLARE_INSTANCE_CHECKER(MouseChardev, MOUSE_CHARDEV,
 static void msmouse_chr_accept_input(Chardev *chr)
 {
     MouseChardev *mouse =3D MOUSE_CHARDEV(chr);
-    int len;
+    uint32_t len, avail;

     len =3D qemu_chr_be_can_write(chr);
-    if (len > mouse->outlen) {
-        len =3D mouse->outlen;
-    }
-    if (!len) {
-        return;
-    }
-
-    qemu_chr_be_write(chr, mouse->outbuf, len);
-    mouse->outlen -=3D len;
-    if (mouse->outlen) {
-        memmove(mouse->outbuf, mouse->outbuf + len, mouse->outlen);
+    avail =3D fifo8_num_used(&mouse->outbuf);
+    while (len > 0 && avail > 0) {
+        const uint8_t *buf;
+        uint32_t size;
+
+        buf =3D fifo8_pop_buf(&mouse->outbuf, MIN(len, avail), &size);
+        qemu_chr_be_write(chr, buf, size);
+        len =3D qemu_chr_be_can_write(chr);
+        avail -=3D size;
     }
 }

@@ -94,12 +98,11 @@ static void msmouse_queue_event(MouseChardev *mouse)
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
@@ -172,9 +175,7 @@ static int msmouse_ioctl(Chardev *chr, int cmd, void *=
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
@@ -184,7 +185,7 @@ static int msmouse_ioctl(Chardev *chr, int cmd, void *=
arg)
          * Reset mouse buffers on power down.
          * Mouse won't send anything without power.
          */
-        mouse->outlen =3D 0;
+        fifo8_reset(&mouse->outbuf);
         memset(mouse->axis, 0, sizeof(mouse->axis));
         memset(mouse->btns, false, sizeof(mouse->btns));
         memset(mouse->btnc, false, sizeof(mouse->btns));
@@ -204,6 +205,7 @@ static void char_msmouse_finalize(Object *obj)
     MouseChardev *mouse =3D MOUSE_CHARDEV(obj);

     qemu_input_handler_unregister(mouse->hs);
+    fifo8_destroy(&mouse->outbuf);
 }

 static QemuInputHandler msmouse_handler =3D {
@@ -224,6 +226,7 @@ static void msmouse_chr_open(Chardev *chr,
     mouse->hs =3D qemu_input_handler_register((DeviceState *)mouse,
                                             &msmouse_handler);
     mouse->tiocm =3D 0;
+    fifo8_create(&mouse->outbuf, MSMOUSE_BUF_SZ);
 }

 static void char_msmouse_class_init(ObjectClass *oc, void *data)
=2D-
2.34.1


