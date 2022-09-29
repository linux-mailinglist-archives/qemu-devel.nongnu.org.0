Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A985EF4A0
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 13:47:05 +0200 (CEST)
Received: from localhost ([::1]:40724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ods0O-0006ig-Av
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 07:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1odrMA-00016I-Ij
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:05:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1odrM8-0001wp-Ng
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:05:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664449528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O3g7x/oeCPDaruCTDr++TyWSFJnjhwc317c14u9ss3w=;
 b=SdpbghG49MZJPFvMQdsHZtNk5T6cq5YlObF6bVY7kUZE6I88Ak+okSajpXJJoE4XzDRxaH
 ePITSgktEDwAW4JbaQ18WdEbvzRIrecrB+R75FUyU57TQJyiRiZ9+SeJyTaKIBHDeGzGBt
 JgGzHlDaRRkkWXs8b69DqSVJ2T36tOs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-C0PIwqOHO2Cap5IS9aFh3A-1; Thu, 29 Sep 2022 07:05:24 -0400
X-MC-Unique: C0PIwqOHO2Cap5IS9aFh3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 745391C05140;
 Thu, 29 Sep 2022 11:05:24 +0000 (UTC)
Received: from localhost (unknown [10.39.208.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CEA5207B34A;
 Thu, 29 Sep 2022 11:05:23 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Arwed Meyer <arwed.meyer@gmx.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 3/8] msmouse: Use fifo8 instead of array
Date: Thu, 29 Sep 2022 15:05:03 +0400
Message-Id: <20220929110508.1323529-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220929110508.1323529-1-marcandre.lureau@redhat.com>
References: <20220929110508.1323529-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

Make use of fifo8 functions instead of implementing own fifo code.
This makes the code more readable and reduces risk of bugs.

Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220911181840.8933-4-arwed.meyer@gmx.de>
---
 chardev/msmouse.c | 47 +++++++++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index 95fa488339..5982c15df6 100644
--- a/chardev/msmouse.c
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
+const uint8_t mouse_id[] = {'M', '3'};
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
     MouseChardev *mouse = MOUSE_CHARDEV(chr);
-    int len;
+    uint32_t len, avail;
 
     len = qemu_chr_be_can_write(chr);
-    if (len > mouse->outlen) {
-        len = mouse->outlen;
-    }
-    if (!len) {
-        return;
-    }
-
-    qemu_chr_be_write(chr, mouse->outbuf, len);
-    mouse->outlen -= len;
-    if (mouse->outlen) {
-        memmove(mouse->outbuf, mouse->outbuf + len, mouse->outlen);
+    avail = fifo8_num_used(&mouse->outbuf);
+    while (len > 0 && avail > 0) {
+        const uint8_t *buf;
+        uint32_t size;
+
+        buf = fifo8_pop_buf(&mouse->outbuf, MIN(len, avail), &size);
+        qemu_chr_be_write(chr, buf, size);
+        len = qemu_chr_be_can_write(chr);
+        avail -= size;
     }
 }
 
@@ -94,12 +98,11 @@ static void msmouse_queue_event(MouseChardev *mouse)
         mouse->btnc[INPUT_BUTTON_MIDDLE]) {
         bytes[3] |= (mouse->btns[INPUT_BUTTON_MIDDLE] ? 0x20 : 0x00);
         mouse->btnc[INPUT_BUTTON_MIDDLE] = false;
-        count = 4;
+        count++;
     }
 
-    if (mouse->outlen <= sizeof(mouse->outbuf) - count) {
-        memcpy(mouse->outbuf + mouse->outlen, bytes, count);
-        mouse->outlen += count;
+    if (fifo8_num_free(&mouse->outbuf) >= count) {
+        fifo8_push_all(&mouse->outbuf, bytes, count);
     } else {
         /* queue full -> drop event */
     }
@@ -172,9 +175,7 @@ static int msmouse_ioctl(Chardev *chr, int cmd, void *arg)
                  * cause we behave like a 3 button logitech
                  * mouse.
                  */
-                mouse->outbuf[0] = 'M';
-                mouse->outbuf[1] = '3';
-                mouse->outlen = 2;
+                fifo8_push_all(&mouse->outbuf, mouse_id, sizeof(mouse_id));
                 /* Start sending data to serial. */
                 msmouse_chr_accept_input(chr);
             }
@@ -184,7 +185,7 @@ static int msmouse_ioctl(Chardev *chr, int cmd, void *arg)
          * Reset mouse buffers on power down.
          * Mouse won't send anything without power.
          */
-        mouse->outlen = 0;
+        fifo8_reset(&mouse->outbuf);
         memset(mouse->axis, 0, sizeof(mouse->axis));
         memset(mouse->btns, false, sizeof(mouse->btns));
         memset(mouse->btnc, false, sizeof(mouse->btns));
@@ -204,6 +205,7 @@ static void char_msmouse_finalize(Object *obj)
     MouseChardev *mouse = MOUSE_CHARDEV(obj);
 
     qemu_input_handler_unregister(mouse->hs);
+    fifo8_destroy(&mouse->outbuf);
 }
 
 static QemuInputHandler msmouse_handler = {
@@ -224,6 +226,7 @@ static void msmouse_chr_open(Chardev *chr,
     mouse->hs = qemu_input_handler_register((DeviceState *)mouse,
                                             &msmouse_handler);
     mouse->tiocm = 0;
+    fifo8_create(&mouse->outbuf, MSMOUSE_BUF_SZ);
 }
 
 static void char_msmouse_class_init(ObjectClass *oc, void *data)
-- 
2.37.3


