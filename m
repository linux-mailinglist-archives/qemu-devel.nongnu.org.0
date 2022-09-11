Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 896215B50A1
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 20:35:06 +0200 (CEST)
Received: from localhost ([::1]:53328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXRnN-0004vw-Cf
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 14:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXRZ2-0005Vt-MY; Sun, 11 Sep 2022 14:20:16 -0400
Received: from mout.gmx.net ([212.227.15.19]:60679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXRZ0-0003V8-Sh; Sun, 11 Sep 2022 14:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662920410;
 bh=e4vlNlcI1oCuqYZ/cqmws4Wte8dT3gjwomXBDaL+ROI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=RTuI72su24CIvFRR3ilA5GrkEhtPjAWEWRGyd0VfIMm9u3DLzXf1OXZysuuKEAH/c
 F5yMMA6q6gdt0fDoUw89q+eky7KrmKFFSIXKsGOv2ZBdJoQ6IclSjHcH2iJR2TtjPc
 10M/TEME0GJwRonAn4H20g8gIfTVtuAN+pP7whcI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from btm-mobil4.fritz.box ([178.8.103.147]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MowKi-1p7JTw1uOM-00qViC; Sun, 11 Sep 2022 20:20:10 +0200
From: Arwed Meyer <arwed.meyer@gmx.de>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Arwed Meyer <arwed.meyer@gmx.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 4/5] msmouse: Add pnp data
Date: Sun, 11 Sep 2022 20:18:39 +0200
Message-Id: <20220911181840.8933-5-arwed.meyer@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220911181840.8933-1-arwed.meyer@gmx.de>
References: <20220911181840.8933-1-arwed.meyer@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uHkoRgtGUSNB1vtVr8JRbN7TjtrmF6iHztnBPzNIQ4vnUZ+ajvh
 JK43gioHyclx4EIuJL3T2oLILtP8SBvvOVZs8AHMFz380xEjXogBtury57dLv8LBDAozauZ
 yVzZtvkCc08iJ3djjmqMuqAnCqTEoWDBJ3s9UUS87Q5i5IlFBF0sV4go6Pjr+ZaJmgiwJ48
 7G4zUv0w4gtnvTvTMkyKA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EFYGU6LLg0o=:gw4XXW4toJAl1cifxWUZ9Q
 Os60e8Jv3eiV0Yt2Lx2OYQ46abE72Wit0VL7duiYUM9TZrcwsb1tXR29Wc3d40m8FhkzzIaQT
 OrxLsrzC0MTyLqlQPohkmEYpuQozP2kWIpWcqDx4GeIyygTnoJy4f5nY9TjSZr6o64n8woXLy
 tNkK68ScdOveDQtNTDJbGtZV5B9JqXG7Pvp0Q52DEB+V1yRrzff1ieAWedCBNgQLhrussduIQ
 xzcSfU54FxEb3SqG7ZzqHIcWJwyIegZkgXmf9A7SHvnni2xoKs3UhkzydV6iLDK0d0IRZqobw
 97nCpFSqAPGEK5euinvQ3P/X5MVMZv+MR63TNROME6vTjQSGTdahUc5DfPpzY2oIDSxbJxywr
 EPYps87FrynjKwQzHccceKVUQTa0NT0A+LAr0KqBUEAppqEYE8tOYbn0BWgibK7Y3/Gb96JFH
 Z+ptvAvo1OmEUqU0rMMNjpK1VZTRPoc4WzbmVFVJ+DTqQZ3FOBQLnHzQNiDpDo2SG47p21C5A
 JkVWi2lZ0D8tVBBAwnjdehcd+ciUP4I7HCZp37MmEHBgyS+FzYYi7uDyw+uhesMJ3LNLM/LDt
 AM5Ud4flvEIF3I3QDFZ+hgBhnTGORvjI44nxSDnxaTlrHXXJ9+QGsDOf+qWUoyyhyLqdkkg9P
 XvrPW7NJSWMggaQepLtwQdQavMb7cLAWZm1mm0lQvE0vJl/deA0J7kfiL18Aq0OF66S8Ne9vf
 iohb7SQxA4SYgGklIxkKQhYt2qhAwSL1I+dStGB9+f6Xm28E2q5RyrhHZBUohonfnT4+Y7dnN
 bDVYliBP6QI3pOLp8RC+vRYTcab5MXh3VCxqYC1JkVXnmF9xU93HNMnfPIzqxwDuaVA/UYYwH
 d7EJe+WZ5Qz3VeUakateD2mY7N4P+vauCUNK/VxRVfW3hg7t2AF6GuDdChs8HAEOfcJts8B5m
 mmBmeqVBqJhWUQFNzxPRllMzTPNxrn5RZVLd36byqeTVeqoxlC8/AbtZq18RcsW5DJMoFIiXD
 Klvv1trV0ZHpnUvPt1cYY70Ox/EOz1T1/6eKypQBYUlQSB7ODvnYa87uyr2/Sev156jacgUi0
 XHjBfxTUolhSz/KImIl+ActyUdZPzW4Rh0Jiv4k1rDXy90OvXbmxFp85OFs2Vv8jfPOjLE1RY
 72jpHvonwxRwdYRdbOEjLyOUL7
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

Make msmouse send serial pnp data.
Enables you to see nice qemu device name in Win9x.

Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
=2D--
 chardev/msmouse.c | 58 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 47 insertions(+), 11 deletions(-)

diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index 5982c15df6..9006703023 100644
=2D-- a/chardev/msmouse.c
+++ b/chardev/msmouse.c
@@ -35,11 +35,24 @@
 #define MSMOUSE_HI2(n)  (((n) & 0xc0) >> 6)
 #define MSMOUSE_PWR(cm) (cm & (CHR_TIOCM_RTS | CHR_TIOCM_DTR))

+/* Serial PnP for 6 bit devices/mice sends all ASCII chars - 0x20 */
+#define M(c) (c - 0x20)
 /* Serial fifo size. */
 #define MSMOUSE_BUF_SZ 64

 /* Mouse ID: Send "M3" cause we behave like a 3 button logitech mouse. */
 const uint8_t mouse_id[] =3D {'M', '3'};
+/*
+ * PnP start "(", PnP version (1.0), vendor ID, product ID, '\\',
+ * serial ID (omitted), '\\', MS class name, '\\', driver ID (omitted), '=
\\',
+ * product description, checksum, ")"
+ * Missing parts are inserted later.
+ */
+const uint8_t pnp_data[] =3D {M('('), 1, '$', M('Q'), M('M'), M('U'),
+                         M('0'), M('0'), M('0'), M('1'),
+                         M('\\'), M('\\'),
+                         M('M'), M('O'), M('U'), M('S'), M('E'),
+                         M('\\'), M('\\')};

 struct MouseChardev {
     Chardev parent;
@@ -158,11 +171,22 @@ static int msmouse_chr_write(struct Chardev *s, cons=
t uint8_t *buf, int len)
     return len;
 }

+static QemuInputHandler msmouse_handler =3D {
+    .name  =3D "QEMU Microsoft Mouse",
+    .mask  =3D INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,
+    .event =3D msmouse_input_event,
+    .sync  =3D msmouse_input_sync,
+};
+
 static int msmouse_ioctl(Chardev *chr, int cmd, void *arg)
 {
     MouseChardev *mouse =3D MOUSE_CHARDEV(chr);
-    int c;
+    int c, i, j;
+    uint8_t bytes[MSMOUSE_BUF_SZ / 2];
     int *targ =3D (int *)arg;
+    const uint8_t hexchr[16] =3D {M('0'), M('1'), M('2'), M('3'), M('4'),=
 M('5'),
+                             M('6'), M('7'), M('8'), M('9'), M('A'), M('B=
'),
+                             M('C'), M('D'), M('E'), M('F')};

     switch (cmd) {
     case CHR_IOCTL_SERIAL_SET_TIOCM:
@@ -171,11 +195,30 @@ static int msmouse_ioctl(Chardev *chr, int cmd, void=
 *arg)
         if (MSMOUSE_PWR(mouse->tiocm)) {
             if (!MSMOUSE_PWR(c)) {
                 /*
-                 * Power on after reset: send "M3"
-                 * cause we behave like a 3 button logitech
-                 * mouse.
+                 * Power on after reset: Send ID and PnP data
+                 * No need to check fifo space as it is empty at this poi=
nt.
                  */
                 fifo8_push_all(&mouse->outbuf, mouse_id, sizeof(mouse_id)=
);
+                /* Add PnP data: */
+                fifo8_push_all(&mouse->outbuf, pnp_data, sizeof(pnp_data)=
);
+                /*
+                 * Add device description from qemu handler name.
+                 * Make sure this all fits into the queue beforehand!
+                 */
+                c =3D M(')');
+                for (i =3D 0; msmouse_handler.name[i]; i++) {
+                    bytes[i] =3D M(msmouse_handler.name[i]);
+                    c +=3D bytes[i];
+                }
+                /* Calc more of checksum */
+                for (j =3D 0; j < sizeof(pnp_data); j++) {
+                    c +=3D pnp_data[j];
+                }
+                c &=3D 0xff;
+                bytes[i++] =3D hexchr[c >> 4];
+                bytes[i++] =3D hexchr[c & 0x0f];
+                bytes[i++] =3D M(')');
+                fifo8_push_all(&mouse->outbuf, bytes, i);
                 /* Start sending data to serial. */
                 msmouse_chr_accept_input(chr);
             }
@@ -208,13 +251,6 @@ static void char_msmouse_finalize(Object *obj)
     fifo8_destroy(&mouse->outbuf);
 }

-static QemuInputHandler msmouse_handler =3D {
-    .name  =3D "QEMU Microsoft Mouse",
-    .mask  =3D INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,
-    .event =3D msmouse_input_event,
-    .sync  =3D msmouse_input_sync,
-};
-
 static void msmouse_chr_open(Chardev *chr,
                              ChardevBackend *backend,
                              bool *be_opened,
=2D-
2.34.1


