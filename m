Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A755EF44C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 13:28:54 +0200 (CEST)
Received: from localhost ([::1]:54078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odrin-00061K-0q
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 07:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1odrME-0001CF-OF
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:05:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1odrMD-0001xE-2T
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:05:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664449532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3mXM23Rs8aZCO5O97Kib6Cw52DXTr/s1fYzMgrROq4g=;
 b=FPv4KAT0vqDHKor0J230uxOUwkwBESTB2ZKK2FUTj/fNWkgHa8E4A0ujWvoy2SBrxLcwMY
 zR/GCE8Iy7Quv0jvup1XJSt3osCg6iwEyK/08JU7lX7P5pC32JojQVz2spvGYMl8OALN3c
 f0l53Qh4216prwp3aJVds129HO+ErrM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-l8SjcAAuM-GXNGjEK0heXw-1; Thu, 29 Sep 2022 07:05:29 -0400
X-MC-Unique: l8SjcAAuM-GXNGjEK0heXw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D01D43C01E15;
 Thu, 29 Sep 2022 11:05:28 +0000 (UTC)
Received: from localhost (unknown [10.39.208.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C890B112132C;
 Thu, 29 Sep 2022 11:05:27 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Arwed Meyer <arwed.meyer@gmx.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 4/8] msmouse: Add pnp data
Date: Thu, 29 Sep 2022 15:05:04 +0400
Message-Id: <20220929110508.1323529-5-marcandre.lureau@redhat.com>
In-Reply-To: <20220929110508.1323529-1-marcandre.lureau@redhat.com>
References: <20220929110508.1323529-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Arwed Meyer <arwed.meyer@gmx.de>

Make msmouse send serial pnp data.
Enables you to see nice qemu device name in Win9x.

Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220911181840.8933-5-arwed.meyer@gmx.de>
---
 chardev/msmouse.c | 58 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 47 insertions(+), 11 deletions(-)

diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index 5982c15df6..9006703023 100644
--- a/chardev/msmouse.c
+++ b/chardev/msmouse.c
@@ -35,11 +35,24 @@
 #define MSMOUSE_HI2(n)  (((n) & 0xc0) >> 6)
 #define MSMOUSE_PWR(cm) (cm & (CHR_TIOCM_RTS | CHR_TIOCM_DTR))
 
+/* Serial PnP for 6 bit devices/mice sends all ASCII chars - 0x20 */
+#define M(c) (c - 0x20)
 /* Serial fifo size. */
 #define MSMOUSE_BUF_SZ 64
 
 /* Mouse ID: Send "M3" cause we behave like a 3 button logitech mouse. */
 const uint8_t mouse_id[] = {'M', '3'};
+/*
+ * PnP start "(", PnP version (1.0), vendor ID, product ID, '\\',
+ * serial ID (omitted), '\\', MS class name, '\\', driver ID (omitted), '\\',
+ * product description, checksum, ")"
+ * Missing parts are inserted later.
+ */
+const uint8_t pnp_data[] = {M('('), 1, '$', M('Q'), M('M'), M('U'),
+                         M('0'), M('0'), M('0'), M('1'),
+                         M('\\'), M('\\'),
+                         M('M'), M('O'), M('U'), M('S'), M('E'),
+                         M('\\'), M('\\')};
 
 struct MouseChardev {
     Chardev parent;
@@ -158,11 +171,22 @@ static int msmouse_chr_write(struct Chardev *s, const uint8_t *buf, int len)
     return len;
 }
 
+static QemuInputHandler msmouse_handler = {
+    .name  = "QEMU Microsoft Mouse",
+    .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,
+    .event = msmouse_input_event,
+    .sync  = msmouse_input_sync,
+};
+
 static int msmouse_ioctl(Chardev *chr, int cmd, void *arg)
 {
     MouseChardev *mouse = MOUSE_CHARDEV(chr);
-    int c;
+    int c, i, j;
+    uint8_t bytes[MSMOUSE_BUF_SZ / 2];
     int *targ = (int *)arg;
+    const uint8_t hexchr[16] = {M('0'), M('1'), M('2'), M('3'), M('4'), M('5'),
+                             M('6'), M('7'), M('8'), M('9'), M('A'), M('B'),
+                             M('C'), M('D'), M('E'), M('F')};
 
     switch (cmd) {
     case CHR_IOCTL_SERIAL_SET_TIOCM:
@@ -171,11 +195,30 @@ static int msmouse_ioctl(Chardev *chr, int cmd, void *arg)
         if (MSMOUSE_PWR(mouse->tiocm)) {
             if (!MSMOUSE_PWR(c)) {
                 /*
-                 * Power on after reset: send "M3"
-                 * cause we behave like a 3 button logitech
-                 * mouse.
+                 * Power on after reset: Send ID and PnP data
+                 * No need to check fifo space as it is empty at this point.
                  */
                 fifo8_push_all(&mouse->outbuf, mouse_id, sizeof(mouse_id));
+                /* Add PnP data: */
+                fifo8_push_all(&mouse->outbuf, pnp_data, sizeof(pnp_data));
+                /*
+                 * Add device description from qemu handler name.
+                 * Make sure this all fits into the queue beforehand!
+                 */
+                c = M(')');
+                for (i = 0; msmouse_handler.name[i]; i++) {
+                    bytes[i] = M(msmouse_handler.name[i]);
+                    c += bytes[i];
+                }
+                /* Calc more of checksum */
+                for (j = 0; j < sizeof(pnp_data); j++) {
+                    c += pnp_data[j];
+                }
+                c &= 0xff;
+                bytes[i++] = hexchr[c >> 4];
+                bytes[i++] = hexchr[c & 0x0f];
+                bytes[i++] = M(')');
+                fifo8_push_all(&mouse->outbuf, bytes, i);
                 /* Start sending data to serial. */
                 msmouse_chr_accept_input(chr);
             }
@@ -208,13 +251,6 @@ static void char_msmouse_finalize(Object *obj)
     fifo8_destroy(&mouse->outbuf);
 }
 
-static QemuInputHandler msmouse_handler = {
-    .name  = "QEMU Microsoft Mouse",
-    .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,
-    .event = msmouse_input_event,
-    .sync  = msmouse_input_sync,
-};
-
 static void msmouse_chr_open(Chardev *chr,
                              ChardevBackend *backend,
                              bool *be_opened,
-- 
2.37.3


