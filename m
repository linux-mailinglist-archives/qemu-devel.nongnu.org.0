Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795645B2511
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 19:43:45 +0200 (CEST)
Received: from localhost ([::1]:58218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWLZ2-0002SM-IK
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 13:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oWLNc-0003y6-QK; Thu, 08 Sep 2022 13:31:57 -0400
Received: from mout.gmx.net ([212.227.15.19]:54741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oWLNL-0002B4-Sj; Thu, 08 Sep 2022 13:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662658294;
 bh=UtF0BPLI6AKxkQWay5ut7m72rH2xhRa4EgDH/2mF2T4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=CLwisVyb1nKxwgI5C7aNc4No0QRph3KKZyHK5PAH0ISRaH6dejZGER0pmZLZ8J4GS
 uBjyaXzjY+gntZS9DXQQREyPhCWyNAB8xI8G/vX/7O8KiJRv70PlnyRZyVQJFkxJ6p
 dttid9rToPJzbQ+WbGW4rNfaq96Qq9KAakBHgaTo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from btm-mobil4.fritz.box ([178.8.103.19]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mxm3Q-1pHJcW1Q22-00zD0Y; Thu, 08
 Sep 2022 19:31:34 +0200
From: Arwed Meyer <arwed.meyer@gmx.de>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Arwed Meyer <arwed.meyer@gmx.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 1/5] msmouse: Handle mouse reset
Date: Thu,  8 Sep 2022 19:31:16 +0200
Message-Id: <20220908173120.16779-2-arwed.meyer@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908173120.16779-1-arwed.meyer@gmx.de>
References: <20220908173120.16779-1-arwed.meyer@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vnL3f/XuybhdcCQxs61kE+MGDiv14GcATEqXn/H1j8XPHp3IQhb
 RLCUU52lTp3HUnB9YyhSjmICIY9PNmOKbd4TjSENjsGsu8kWq18xyflkowXstYX9xKmTjfK
 9ecnzfwQX0bh3EW5oiqpVI8wtz0/fYJzCreKBkZPl/jRy18L/uBXj8NP3gQYmMItJYjfqgE
 rRvWt3Qa3xq8eILB1KKuA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:q7XRKE3UI5s=:9uJ4PIxWUXnIqdVLt80eOF
 /HCvnAR8yg0B1iAsZmtmmyCsAdhyYOr/hDpUguGFW7woyXEQHe3rUUYJ0o/yQPOc0Jqfn3R7E
 3/l7oy4aFA5II3nw5X0NSO8+tq/gusz5dx+XOW74ExjSaLHl/7lf5AxEGYKfMMGREqHR28JqX
 MrEdDWOwMKLNdQ6yb4DWDzj1ZbpkWX7I/ayFvMCyOohOOIyGNui3KTeV1OGXOFNe9VuHzi1gQ
 5IOjcQNZ27JqQRbQ38y4VUftFADg2SRUbVzg4OPGscW2sOSHEV/5welO89SZssNN8EjMvHtGx
 fvLNm26mkPD023EkT3WzWgq+P1wn94cMZVg4nhTce2Nq0xP4cLCmfc0eJtDBJie1vjnBYoh82
 9w1CCz4BsD55Pr41N29oX72H8u265tgN9cbsD5aNa37XEGeN38QglsuddPx/qNmMqfid7zbNl
 GP/jaIO9JMucfjZl1s8i85mTW02QonHQoPPH+Vnp9e2ldDWQsPXqzFq55M2lYbj8nxWveIdMy
 6LimG42ifcMVI4hSUk3f2zbz3jO1wus7nBSKfOkVfVUpXvQr4Ec5+433kQxhgVZb34ClHP0lX
 1zP12WDFYffttXHK3DSQEr3kyEtvzn3YtT7yNEIzKK6g2qDQIGsrcuWSUKuK3mdO/HTuRIU3P
 QdsC7uJLF0qyvEZFNnGfHHuyMS3ba6GwnKK6PuvrGZB91UuwdJIr3oUnGnIyW9OO5Q0jNy5Xa
 XVWwMd3T5hZuU93zjWm/jAaGpcWDPudrqpV4QIfifbptPs2WxBDfox5WMwrgamRq0j4zq/3ql
 KaiV3adXjY0X7zBw4DxI0PrksBobMX1EEHRHy+t0Ipp+0LI38PfRayWz8mahDvJGs73myDUv/
 XV0SvfAhum74u2M/lYluyc064Llc4Rtyv4CAtyjFzz0xFgoSLjAk0Kp5dga2GYiNAJppZZ2Sn
 uWEU80Inv++Qz1yZmfX5Le0f0xvBBU1HqdrB4AwtFB13TZHm9yJClPCDpSNPaWEWaTGds22ZD
 DolFXMnKPlTRBLYKZITeoVWfkp1wa/t9Eemz8Et8z7+TJiZ6kmOaIllXBjWK9a76R5imFSHTl
 vQWZOmNIIDqEKku5TT/bEdaJ4tG1K2r9U5XhBbCNEHwQsCic3ixCAA8EuAv0BFGv92BkbUewD
 DHXl52phPSa66N9NSvyuW2jtJU
Received-SPF: pass client-ip=212.227.15.19; envelope-from=arwed.meyer@gmx.de;
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

Detect mouse reset via RTS or DTR line:
Don't send or process anything while in reset.
When coming out of reset, send ID sequence first thing.
This allows msmouse to be detected by common mouse drivers.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/77
Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
=2D--
 chardev/msmouse.c | 63 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 2 deletions(-)

diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index eb9231dcdb..95fa488339 100644
=2D-- a/chardev/msmouse.c
+++ b/chardev/msmouse.c
@@ -25,17 +25,20 @@
 #include "qemu/osdep.h"
 #include "qemu/module.h"
 #include "chardev/char.h"
+#include "chardev/char-serial.h"
 #include "ui/console.h"
 #include "ui/input.h"
 #include "qom/object.h"

-#define MSMOUSE_LO6(n) ((n) & 0x3f)
-#define MSMOUSE_HI2(n) (((n) & 0xc0) >> 6)
+#define MSMOUSE_LO6(n)  ((n) & 0x3f)
+#define MSMOUSE_HI2(n)  (((n) & 0xc0) >> 6)
+#define MSMOUSE_PWR(cm) (cm & (CHR_TIOCM_RTS | CHR_TIOCM_DTR))

 struct MouseChardev {
     Chardev parent;

     QemuInputHandlerState *hs;
+    int tiocm;
     int axis[INPUT_AXIS__MAX];
     bool btns[INPUT_BUTTON__MAX];
     bool btnc[INPUT_BUTTON__MAX];
@@ -109,6 +112,11 @@ static void msmouse_input_event(DeviceState *dev, Qem=
uConsole *src,
     InputMoveEvent *move;
     InputBtnEvent *btn;

+    /* Ignore events if serial mouse powered down. */
+    if (!MSMOUSE_PWR(mouse->tiocm)) {
+        return;
+    }
+
     switch (evt->type) {
     case INPUT_EVENT_KIND_REL:
         move =3D evt->u.rel.data;
@@ -132,6 +140,11 @@ static void msmouse_input_sync(DeviceState *dev)
     MouseChardev *mouse =3D MOUSE_CHARDEV(dev);
     Chardev *chr =3D CHARDEV(dev);

+    /* Ignore events if serial mouse powered down. */
+    if (!MSMOUSE_PWR(mouse->tiocm)) {
+        return;
+    }
+
     msmouse_queue_event(mouse);
     msmouse_chr_accept_input(chr);
 }
@@ -142,6 +155,50 @@ static int msmouse_chr_write(struct Chardev *s, const=
 uint8_t *buf, int len)
     return len;
 }

+static int msmouse_ioctl(Chardev *chr, int cmd, void *arg)
+{
+    MouseChardev *mouse =3D MOUSE_CHARDEV(chr);
+    int c;
+    int *targ =3D (int *)arg;
+
+    switch (cmd) {
+    case CHR_IOCTL_SERIAL_SET_TIOCM:
+        c =3D mouse->tiocm;
+        mouse->tiocm =3D *(int *)arg;
+        if (MSMOUSE_PWR(mouse->tiocm)) {
+            if (!MSMOUSE_PWR(c)) {
+                /*
+                 * Power on after reset: send "M3"
+                 * cause we behave like a 3 button logitech
+                 * mouse.
+                 */
+                mouse->outbuf[0] =3D 'M';
+                mouse->outbuf[1] =3D '3';
+                mouse->outlen =3D 2;
+                /* Start sending data to serial. */
+                msmouse_chr_accept_input(chr);
+            }
+            break;
+        }
+        /*
+         * Reset mouse buffers on power down.
+         * Mouse won't send anything without power.
+         */
+        mouse->outlen =3D 0;
+        memset(mouse->axis, 0, sizeof(mouse->axis));
+        memset(mouse->btns, false, sizeof(mouse->btns));
+        memset(mouse->btnc, false, sizeof(mouse->btns));
+        break;
+    case CHR_IOCTL_SERIAL_GET_TIOCM:
+        /* Remember line control status. */
+        *targ =3D mouse->tiocm;
+        break;
+    default:
+        return -ENOTSUP;
+    }
+    return 0;
+}
+
 static void char_msmouse_finalize(Object *obj)
 {
     MouseChardev *mouse =3D MOUSE_CHARDEV(obj);
@@ -166,6 +223,7 @@ static void msmouse_chr_open(Chardev *chr,
     *be_opened =3D false;
     mouse->hs =3D qemu_input_handler_register((DeviceState *)mouse,
                                             &msmouse_handler);
+    mouse->tiocm =3D 0;
 }

 static void char_msmouse_class_init(ObjectClass *oc, void *data)
@@ -175,6 +233,7 @@ static void char_msmouse_class_init(ObjectClass *oc, v=
oid *data)
     cc->open =3D msmouse_chr_open;
     cc->chr_write =3D msmouse_chr_write;
     cc->chr_accept_input =3D msmouse_chr_accept_input;
+    cc->chr_ioctl =3D msmouse_ioctl;
 }

 static const TypeInfo char_msmouse_type_info =3D {
=2D-
2.34.1


