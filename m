Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3765EF45A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 13:32:13 +0200 (CEST)
Received: from localhost ([::1]:35564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odrlz-000846-HP
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 07:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1odrM2-0000pS-R5
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:05:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1odrM0-0001ua-8D
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664449519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VvcfMAnfS2NXgz69qMhd9Dd+IriMC8wARf9eoTp7M9g=;
 b=f4svkk66eq4AZ1narCfhsv8gs2MwSlTfoVsAYhIk4ZNY6UsNJx2QW96QenusPs4WjAVwms
 qXK7VMk9A4oVJwoazU0ZFpuusQ9TxwVLn5SBXVMgO+6LEQGqfUQksRbGdlBwLZMWZRP7Ox
 ZKZVZsFgeEwECC/Ee3KPbjaizi2MaFA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-tn4tIy-aNQucVwKABl1jqA-1; Thu, 29 Sep 2022 07:05:16 -0400
X-MC-Unique: tn4tIy-aNQucVwKABl1jqA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 071F3296A62F;
 Thu, 29 Sep 2022 11:05:16 +0000 (UTC)
Received: from localhost (unknown [10.39.208.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2F07207B34A;
 Thu, 29 Sep 2022 11:05:14 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Arwed Meyer <arwed.meyer@gmx.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 1/8] msmouse: Handle mouse reset
Date: Thu, 29 Sep 2022 15:05:01 +0400
Message-Id: <20220929110508.1323529-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220929110508.1323529-1-marcandre.lureau@redhat.com>
References: <20220929110508.1323529-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Detect mouse reset via RTS or DTR line:
Don't send or process anything while in reset.
When coming out of reset, send ID sequence first thing.
This allows msmouse to be detected by common mouse drivers.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/77
Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220911181840.8933-2-arwed.meyer@gmx.de>
---
 chardev/msmouse.c | 63 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 2 deletions(-)

diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index eb9231dcdb..95fa488339 100644
--- a/chardev/msmouse.c
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
@@ -109,6 +112,11 @@ static void msmouse_input_event(DeviceState *dev, QemuConsole *src,
     InputMoveEvent *move;
     InputBtnEvent *btn;
 
+    /* Ignore events if serial mouse powered down. */
+    if (!MSMOUSE_PWR(mouse->tiocm)) {
+        return;
+    }
+
     switch (evt->type) {
     case INPUT_EVENT_KIND_REL:
         move = evt->u.rel.data;
@@ -132,6 +140,11 @@ static void msmouse_input_sync(DeviceState *dev)
     MouseChardev *mouse = MOUSE_CHARDEV(dev);
     Chardev *chr = CHARDEV(dev);
 
+    /* Ignore events if serial mouse powered down. */
+    if (!MSMOUSE_PWR(mouse->tiocm)) {
+        return;
+    }
+
     msmouse_queue_event(mouse);
     msmouse_chr_accept_input(chr);
 }
@@ -142,6 +155,50 @@ static int msmouse_chr_write(struct Chardev *s, const uint8_t *buf, int len)
     return len;
 }
 
+static int msmouse_ioctl(Chardev *chr, int cmd, void *arg)
+{
+    MouseChardev *mouse = MOUSE_CHARDEV(chr);
+    int c;
+    int *targ = (int *)arg;
+
+    switch (cmd) {
+    case CHR_IOCTL_SERIAL_SET_TIOCM:
+        c = mouse->tiocm;
+        mouse->tiocm = *(int *)arg;
+        if (MSMOUSE_PWR(mouse->tiocm)) {
+            if (!MSMOUSE_PWR(c)) {
+                /*
+                 * Power on after reset: send "M3"
+                 * cause we behave like a 3 button logitech
+                 * mouse.
+                 */
+                mouse->outbuf[0] = 'M';
+                mouse->outbuf[1] = '3';
+                mouse->outlen = 2;
+                /* Start sending data to serial. */
+                msmouse_chr_accept_input(chr);
+            }
+            break;
+        }
+        /*
+         * Reset mouse buffers on power down.
+         * Mouse won't send anything without power.
+         */
+        mouse->outlen = 0;
+        memset(mouse->axis, 0, sizeof(mouse->axis));
+        memset(mouse->btns, false, sizeof(mouse->btns));
+        memset(mouse->btnc, false, sizeof(mouse->btns));
+        break;
+    case CHR_IOCTL_SERIAL_GET_TIOCM:
+        /* Remember line control status. */
+        *targ = mouse->tiocm;
+        break;
+    default:
+        return -ENOTSUP;
+    }
+    return 0;
+}
+
 static void char_msmouse_finalize(Object *obj)
 {
     MouseChardev *mouse = MOUSE_CHARDEV(obj);
@@ -166,6 +223,7 @@ static void msmouse_chr_open(Chardev *chr,
     *be_opened = false;
     mouse->hs = qemu_input_handler_register((DeviceState *)mouse,
                                             &msmouse_handler);
+    mouse->tiocm = 0;
 }
 
 static void char_msmouse_class_init(ObjectClass *oc, void *data)
@@ -175,6 +233,7 @@ static void char_msmouse_class_init(ObjectClass *oc, void *data)
     cc->open = msmouse_chr_open;
     cc->chr_write = msmouse_chr_write;
     cc->chr_accept_input = msmouse_chr_accept_input;
+    cc->chr_ioctl = msmouse_ioctl;
 }
 
 static const TypeInfo char_msmouse_type_info = {
-- 
2.37.3


