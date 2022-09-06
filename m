Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BFC5AF7A0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 00:05:30 +0200 (CEST)
Received: from localhost ([::1]:58252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVghG-0003bj-2s
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 18:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oVeYY-0004YL-SX; Tue, 06 Sep 2022 15:48:22 -0400
Received: from mout.gmx.net ([212.227.17.22]:50255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oVeYW-00084X-T3; Tue, 06 Sep 2022 15:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662493696;
 bh=AvUMOSQIPIUZRgD26pgYnEloTYd5BX9ObWpseeSEE/c=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=c1HiZcTN5GCcYZq0dFoemFtizZuootibi18Tq1epLlSC7vTNb+mV/LY7N0cMhvGHs
 n+HLHD/ttVuQqZHeawM8IcxMzG9CiC6wnFMcEH3fgtAiSkDd/KjI3QPTJF+WqU/Wpa
 8AUTTrzPTrH1eHSXPgpWawels/cGRETGLW/qnwnU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from btm-mobil4.fritz.box ([88.72.97.126]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MulmF-1pLYHk2cXz-00rrN4; Tue, 06
 Sep 2022 21:48:15 +0200
From: Arwed Meyer <arwed.meyer@gmx.de>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Arwed Meyer <arwed.meyer@gmx.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/4] msmouse: Handle mouse reset
Date: Tue,  6 Sep 2022 21:47:52 +0200
Message-Id: <20220906194755.98090-2-arwed.meyer@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906194755.98090-1-arwed.meyer@gmx.de>
References: <20220906194755.98090-1-arwed.meyer@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BRFqusUK4VPAa1guIHCDqvv3fd9mp5Umyr8GgeulWjSE99DiWf3
 HvBACxPt6+mcB5l/mqF7SQVMSAwgFOagPu+udPumeT/75yf781c2WFJ2iDFLf29v/tI0+nN
 nXnDdNSh2ppA10Y/kGBCKoovFo33e7jCpDUSpnA4TUHp9HKeVrWjyzRL0D9cXmNAxlK8vNv
 IjCK11WpVSgAqbure8FYA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:C9x85MI1MkQ=:XBr/vM4uWPzqbneuiyHD1v
 sHQDTtEkRzmtZnzY2HE3YWVsvgflR8wEyXo4+5eVlcKLi8nw5rByWmtCc55QaQy+wPUMR9AcP
 OuXrEeOUfulDeyCdsl9I4zcGT+wDgJcd3g7hEmEwjyHMSE8U1j9lFjwyobgXqnZdyW5+HhhPI
 mEKWTgW7Ni6om9xa9VvoG+WqE3hcQDzHDRuB6TqAJTPC7rvWn4x0slQzIu9X8Yp9AbjRpPJRR
 RIb33aoeYC2BexBi+L9TGqKpK++UwoQ9fEFclUu4BfanxeOQVGyVV42DIjMNngtVj1p2OhJi7
 n5oLOB6xD1bf7p9xsQaxVU7a+9lhYxkuuPbjow6rpzA4qbWfGFW4oSunpTsjVQNhWzgJF4qgs
 72GUg2cnB5EU1D0/vwl8fryosKbuITLCLZ1TxfEeWp5fcCnVyhxc+dnd+U52BwpqnphKnmLK+
 5E/ENvQpP6+WAHHvcvNY3/87JBps7XLbCjOlQN0kQF7M1e413ZeEm6HD6znetqg0a4f3otsVu
 IWsL3+g7GyK3lKpRM6JiGIeo0m+qhebOIv8eiaxuG2hVomI/rV8mTUYg86tSFa8M8VFM4JnOw
 pJK8OFPeVJQLNxQBKtY9TTUtJUYQTKCpn+VMg1DOGtn/WN9YTmjdcWfLlHBWSSYhK8RDThZ3B
 PsXdD9Oa9oPMlE7ctUkzv/BaV14xhUu0zu9aNvChLKgJRs7opqqBIrFznJ4qgKTz1Z18L0IOC
 x/4UJuBcAn05ICOqQKPi8bhXJ+9al6cuU/LmzIjd7YK6IPHjwjZx3wK9QIwI+CuG3uFD2oesV
 qUEmOKQMBwEIwnrdVdQhWUHfi7ngjalBD8YMYgPfEWxBG/fUV8lBYoAf18IwHvlsvftXOkTrW
 3bQUg4f6MeofHm53O0QISoNiZh68IBn/uql4sn6+wFm2nbnVE6Pv95BRXzLuNB7Fn9p88Gt91
 Mh0YB+/wh5ZM6/9iwiILzFOQwv78rnVJq58M/+zIPLzgO8kzcr4cvvznIeVqIx/RN+Zdejzqv
 2DcNMSSJfV1z0NqmMYhOe8S5XMjmVZLFTPB0fSwqi/0V6jOHsfN6caZytod4Q5ffiXBsTsz/x
 RL29HWwHBcdzVFrEIhLDhaxSRt7viySwWFFkxVb2C9E7SMQ4BXL0wRjuO0z+LcvDxiKlGuw+0
 Ii1beP4yvP6jWj/dXgMbgwpjKL
Received-SPF: pass client-ip=212.227.17.22; envelope-from=arwed.meyer@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 06 Sep 2022 18:00:42 -0400
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
 chardev/msmouse.c | 65 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 63 insertions(+), 2 deletions(-)

diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index eb9231dcdb..0ecf26a436 100644
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
@@ -142,6 +155,52 @@ static int msmouse_chr_write(struct Chardev *s, const=
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
+        for (c =3D INPUT_BUTTON__MAX - 1; c >=3D 0; c--) {
+            mouse->btns[c] =3D false;
+            mouse->btnc[c] =3D false;
+        }
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
@@ -166,6 +225,7 @@ static void msmouse_chr_open(Chardev *chr,
     *be_opened =3D false;
     mouse->hs =3D qemu_input_handler_register((DeviceState *)mouse,
                                             &msmouse_handler);
+    mouse->tiocm =3D 0;
 }

 static void char_msmouse_class_init(ObjectClass *oc, void *data)
@@ -175,6 +235,7 @@ static void char_msmouse_class_init(ObjectClass *oc, v=
oid *data)
     cc->open =3D msmouse_chr_open;
     cc->chr_write =3D msmouse_chr_write;
     cc->chr_accept_input =3D msmouse_chr_accept_input;
+    cc->chr_ioctl =3D msmouse_ioctl;
 }

 static const TypeInfo char_msmouse_type_info =3D {
=2D-
2.34.1


