Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF795B50B0
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 20:41:43 +0200 (CEST)
Received: from localhost ([::1]:36884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXRtn-0006rw-2Y
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 14:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXRZ0-0005OL-QI; Sun, 11 Sep 2022 14:20:14 -0400
Received: from mout.gmx.net ([212.227.15.18]:41053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXRYy-0003Tm-Rj; Sun, 11 Sep 2022 14:20:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662920408;
 bh=UtF0BPLI6AKxkQWay5ut7m72rH2xhRa4EgDH/2mF2T4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=OcSCEPQSZ1KeUK5XrLA/gvf5XFEF36eAE0CqEhhyoQ6FY8KugSHJUZ62O2Ru7UoLz
 HIXiDhqvLg8Q3rm4+uDYquTQWHxRbvXUWaaLGs7umIOZ42wAXvbrd6f7ZzuKiji8ra
 5j5II4guGInaxwEbE7sVbwLqYap5d/O7jiisXtSM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from btm-mobil4.fritz.box ([178.8.103.147]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MN5eR-1ooHan0JOf-00IzGd; Sun, 11 Sep 2022 20:20:08 +0200
From: Arwed Meyer <arwed.meyer@gmx.de>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Arwed Meyer <arwed.meyer@gmx.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 1/5] msmouse: Handle mouse reset
Date: Sun, 11 Sep 2022 20:18:36 +0200
Message-Id: <20220911181840.8933-2-arwed.meyer@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220911181840.8933-1-arwed.meyer@gmx.de>
References: <20220911181840.8933-1-arwed.meyer@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CqJvLQ1vOZGvRlbL9DQIaTt9qhPrKQJdRgmw/gy+c0LIXfqshLv
 mOD1YPd5+D2p5LjOyPGe+dqkZDjKsSewjaY0gqobJQijT4x/jNAUs+0AZjjGF+fKD6DaCHr
 pd0kIUHZkGo637xFtvaS1LX+eSkDXP2UPMekWUa5FxAzOwZvheL2vAmlGEMW/MIgrkSthBm
 RLkjT4Wxlr5prmD+o7fcg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ulZ4SY0t2xI=:v+pgCkMXT7DLsDxa5nvhEG
 euqcDrNrXptty1T0ajKP9Nk5Tsdno9xJfRUftV+d6du0Seq6Tsxgf44B+8uW/NsPrF3ih8lrI
 XBsQSCjgTKYsVJkkJbuOH/R1qMJ07dn1aE+1gH01sexjZMO60msvq+Srt2WsmhyUbGkiKNKQZ
 p/n8QTjyUecvS61yCfDgrTzpLGXKMTmVafi4hFfpGuIkqkU/k/OsCrumHmchnmuWdt3nq4KRc
 EgvHBaRfOMHhzgA+BVBHa3bHRbXaMThExXk9zT4wPyU24K+ArzwtzaQFv23Z8l+BDkNLuwf9M
 lRW3evhiK8+a88xNY3x4v29vfASGsGSP8CNte4nAXEL5wNfl1vyBg2q4ULzHA9pvXk/ove/ua
 1HwO0sIueFOWkwkDTuxnCf+Jj+84ynPh7bo00k8BECBXu4LGvtLoMx/FxWLSPRiTeiN00HjnJ
 ImW3v9tDyGZ64859PFjyRHqDBP3CHCBbrSpfSez+n3ORgAoJffG4fuJhIBaGAyHmSISmtuEs3
 jRcVuNHCG01kS6yccLfMbGRkoT+wXEPmF3k79/4dXR9aLJ3+dZd0LERmPoKILLFF640TxHjOr
 bmjkW5btuQb6SQ6NlxMxVoFmaKKKo22k2UPEMVV3xiLY547aa9mXa8FLlaI0qERGQfAlAB0CI
 VyqunZA0T1HRhcPUtUG3laFYoqoVqZn0k0aoLtnKaywRxIjgQvLMlceXEP6GPUFYX08Fe3H1+
 CfHJ+mgEMv9j5PamhjtbHBScvkT9Ib8JjlcVULMdXUg9U6b1/dAv/6UFZNplFfeWpqTl8xjT8
 f4opF787KqbwFCSvVFrAVHX9XJ1uxlIQlHyrTsWLYjgjclY+VHyCrgwrul5T81+xVizvoGsK9
 dbNu6TUAi7jiJDVlDm6anUjfFzjBSeFJ+hbCSoGKto1ZXHAg5a3K4Zmc2ZDUj0Bb3XcjO76En
 ROyLHQlXMZplyHjOk2Oj9W9fVkJ5EF5jI/0cDWcJjnc7rwYGgLyT9orX/H3vVMF33bbDZGbW2
 M/RIgllM0/LMs99BKFaE0O2JbfaEOUFuUez74LblCCMg6OFl9kRA+y1piOnRRw8pelTrKzVaB
 GylP3UeKSgePd0s7BYRg9GHgDzY4uWeoHmfJOy8m9kQ4S7GIBiiVWPi1vJJw5y21q2cuRugpY
 Isfi70ADZQjVnJqgtAIUmpZRJX
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


