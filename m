Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767E75B24CB
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 19:37:47 +0200 (CEST)
Received: from localhost ([::1]:33154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWLTG-00041y-3R
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 13:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oWLNc-0003yF-PF; Thu, 08 Sep 2022 13:31:57 -0400
Received: from mout.gmx.net ([212.227.15.15]:60427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oWLNP-0002BW-5z; Thu, 08 Sep 2022 13:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662658296;
 bh=KtEGs5wxM9g3romJagvGMVcYfeh66UA9NF3HN/vnA1w=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=R7YS7yi3udMnfcYyBat0U/rH97jYGyjk+TSBsG437AbkZXaeJBbQAbkm6Uf3S6dit
 4iCRDA9p+0czvnYD6ZQHp7PcMoova5T87Hm91e8hr9SFH/MLe7j/e8pz4TwIEpAf+X
 VlcsaqJha6WftJmnymZAQHuJZVXhOnuMZKF/8eP0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from btm-mobil4.fritz.box ([178.8.103.19]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McpNo-1p57ta15d4-00ZxQI; Thu, 08
 Sep 2022 19:31:36 +0200
From: Arwed Meyer <arwed.meyer@gmx.de>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Arwed Meyer <arwed.meyer@gmx.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 4/5] msmouse: Add pnp data
Date: Thu,  8 Sep 2022 19:31:19 +0200
Message-Id: <20220908173120.16779-5-arwed.meyer@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908173120.16779-1-arwed.meyer@gmx.de>
References: <20220908173120.16779-1-arwed.meyer@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ICuHtBkdI80ycNUsNaHKeyiiQ5co7OlJXnUze0xCfQnNQdMpd1+
 1FlqcL9OS95aiJ3DRHo2LbpxuKK+paE30rWnqcCyC5OENpdT0JQX9gG4UOAwSiXHdXDCz37
 32kFFkIPtctfULctWObqUkbQrIVvlzQl3OFKybrhVcL/nTeSHfvriKNGVbCxcq+L4qLyrky
 yQHhjmzp/WRFg8GL1KIoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HKyI+5bJ6Tw=:dv7yLxcpSQx4/0LDqeBHr7
 PqXZ95Z9JexHp+2/6cA1No4lrdAqXXxAUjrI4kPZAWHavRh700HH2/ryAVFiS3z4NJteiJ1uo
 CUkCg37CKfeb3KjEtrZ1haoXdNQQhEHOW8fqxJOKqLCtWw6m/gqH/A8UsftAf6P5TEBMQJ+IM
 fgxXrxL3FNXzXf2Jam0EJgOynFxlaRBUAmdFbE1U/P4ZtFAekafR94IXnRp23jTjktR45bOJP
 jpEH2AI7qDIH53DoPSXrHmCoVHquq1OT9F/GMBrH1AUghkXo8TyFRtdrvtaPA/CyjGLZCzvoy
 TIz7ZQxR5/Fuhs3K51E7zJJaKk1+WYLh+WYClG57mgGuLC4x17JA1o/kE1ZFfNIB1udfCoAyv
 YyF+Mb2yO3o2CI0RQ9/rZN/JsGdFSGN9n5WIN/EOGHVJADSxtvfc72UEhzhhoALMyGY0Je6G9
 C0QqkUt+9TXjEmazwvvlJwIb4igGO4D7hdJshcSeLLybiXGFTYDirN5TcO6xxZyOiULr+sDI2
 Nuv9GyYxwtHjqxY44FX60ID9rP6l0QayWsl/gtF+FVw0y6ajxtpYOk2z19hyvgChy6hmeN30O
 27Qbln54c7GNL1A/+Xxb+AxZ++yoz27wQeqY+sJ8elneqM+q/7B2QZtUKVDUHfX3bf+8EjPZ4
 3iBc1goim8jcgJOtaNmd1Rwaa1K7Z4XtZrgKM/LC8MOLGkNbiIew4Eipm7ZZg4m3J9OW7zTgc
 AYEBQi7wYCS3v0VO33HkRAtNiqRQ/65pcMqS7URUjJ8n1kgkxa1DXPb4ZJte7KAjndLZMyqaB
 DA7aCDYtPMKOZzFvx/geJ6hLX+J54V/qDjryNug1Fus6RgPDAQexLUKeF5rsPtWsdUImbQw/H
 q85PX9/8RtQODtV2oCUDuCeguqGy8lFh0+h9EWMchOx/TvsBgUwgZwnIMQ8+/pLqcL5LcR2dQ
 rq4BIMkQNPTIugj9iP+B/dIRFCqbPT/qvaX//y+rQGziMrBL65btBT/TYVBUG0SsX7fVtNOVz
 hX3MuIzb3UwHx5xBtqc7L4WsB0Z4d9L2RqNCC8GQwPL6MgbSNpbt3cQsICZ6SHwJ9o+MpFyPF
 JNVNmGHRPC1AIm82A9sEcatIRExxL7CMSn/WthCJ7wNYvtIy4n98W6f+4HFBvjlaKz6KIoJZD
 3U1shmGgojyATtn79RQNPhczlA
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

Make msmouse send serial pnp data.
Enables you to see nice qemu device name in Win9x.

Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
=2D--
 chardev/msmouse.c | 58 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 47 insertions(+), 11 deletions(-)

diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index e9aa3eab55..29eb97fedc 100644
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
@@ -154,11 +167,22 @@ static int msmouse_chr_write(struct Chardev *s, cons=
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
@@ -167,11 +191,30 @@ static int msmouse_ioctl(Chardev *chr, int cmd, void=
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
@@ -204,13 +247,6 @@ static void char_msmouse_finalize(Object *obj)
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


