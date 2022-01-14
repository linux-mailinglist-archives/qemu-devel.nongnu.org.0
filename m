Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5350848E50D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 08:52:58 +0100 (CET)
Received: from localhost ([::1]:38428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8HOK-0002Xu-Sh
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 02:52:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUw-0007ft-9n
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUs-0007Wn-Gp
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642143331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=stEF7xDvPTTpqRnLSu3uFfwdPxVTXS6eA8fG7yqXhmI=;
 b=JXopdlb1Qd4qFgLwWYishHZGZE6Tdkdoxb5mEwIAOLTZNMUgMY5mFubo7v1b4gTG8vtMQO
 DN1EI8NvGGkp29gkFX3Ehd5/crSTpYuSFB2ThybwXZW9egwuxk3uAp+K34crAyKiqoYD+8
 iSYl2FVC2IH1o0tgsHfLcpjgaWR1JGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-7e8DHyxvOZu1b-GhwBedfQ-1; Fri, 14 Jan 2022 01:55:28 -0500
X-MC-Unique: 7e8DHyxvOZu1b-GhwBedfQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1BAB85B66F;
 Fri, 14 Jan 2022 06:55:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1A1B4EC89;
 Fri, 14 Jan 2022 06:55:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 59D0B180084F; Fri, 14 Jan 2022 07:53:27 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/20] ps2: Initial horizontal scroll support
Date: Fri, 14 Jan 2022 07:53:22 +0100
Message-Id: <20220114065326.782420-17-kraxel@redhat.com>
In-Reply-To: <20220114065326.782420-1-kraxel@redhat.com>
References: <20220114065326.782420-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Dmitry Petrov <dpetroff@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dmitry Petrov <dpetroff@gmail.com>

This change adds support for horizontal scroll to ps/2 mouse device
code. The code is implemented to match the logic of linux kernel
which is used as a reference.

Signed-off-by: Dmitry Petrov <dpetroff@gmail.com>
Message-Id: <20220108153947.171861-2-dpetroff@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/input/ps2.c | 57 +++++++++++++++++++++++++++++++++++++++++++-------
 qapi/ui.json   |  2 +-
 2 files changed, 50 insertions(+), 9 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 9376a8f4ce53..6236711e1b8f 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -123,6 +123,7 @@ typedef struct {
     int mouse_dx; /* current values, needed for 'poll' mode */
     int mouse_dy;
     int mouse_dz;
+    int mouse_dw;
     uint8_t mouse_buttons;
 } PS2MouseState;
 
@@ -715,7 +716,7 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
     /* IMPS/2 and IMEX send 4 bytes, PS2 sends 3 bytes */
     const int needed = s->mouse_type ? 4 : 3;
     unsigned int b;
-    int dx1, dy1, dz1;
+    int dx1, dy1, dz1, dw1;
 
     if (PS2_QUEUE_SIZE - s->common.queue.count < needed) {
         return 0;
@@ -724,6 +725,7 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
     dx1 = s->mouse_dx;
     dy1 = s->mouse_dy;
     dz1 = s->mouse_dz;
+    dw1 = s->mouse_dw;
     /* XXX: increase range to 8 bits ? */
     if (dx1 > 127)
         dx1 = 127;
@@ -740,6 +742,9 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
     /* extra byte for IMPS/2 or IMEX */
     switch(s->mouse_type) {
     default:
+        /* Just ignore the wheels if not supported */
+        s->mouse_dz = 0;
+        s->mouse_dw = 0;
         break;
     case 3:
         if (dz1 > 127)
@@ -747,13 +752,41 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
         else if (dz1 < -127)
                 dz1 = -127;
         ps2_queue_noirq(&s->common, dz1 & 0xff);
+        s->mouse_dz -= dz1;
+        s->mouse_dw = 0;
         break;
     case 4:
-        if (dz1 > 7)
-            dz1 = 7;
-        else if (dz1 < -7)
-            dz1 = -7;
-        b = (dz1 & 0x0f) | ((s->mouse_buttons & 0x18) << 1);
+        /*
+         * This matches what the Linux kernel expects for exps/2 in
+         * drivers/input/mouse/psmouse-base.c. Note, if you happen to
+         * press/release the 4th or 5th buttons at the same moment as a
+         * horizontal wheel scroll, those button presses will get lost. I'm not
+         * sure what to do about that, since by this point we don't know
+         * whether those buttons actually changed state.
+         */
+        if (dw1 != 0) {
+            if (dw1 > 31) {
+                dw1 = 31;
+            } else if (dw1 < -31) {
+                dw1 = -31;
+            }
+
+            /*
+             * linux kernel expects first 6 bits to represent the value
+             * for horizontal scroll
+             */
+            b = (dw1 & 0x3f) | 0x40;
+            s->mouse_dw -= dw1;
+        } else {
+            if (dz1 > 7) {
+                dz1 = 7;
+            } else if (dz1 < -7) {
+                dz1 = -7;
+            }
+
+            b = (dz1 & 0x0f) | ((s->mouse_buttons & 0x18) << 1);
+            s->mouse_dz -= dz1;
+        }
         ps2_queue_noirq(&s->common, b);
         break;
     }
@@ -764,7 +797,6 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
     /* update deltas */
     s->mouse_dx -= dx1;
     s->mouse_dy -= dy1;
-    s->mouse_dz -= dz1;
 
     return 1;
 }
@@ -806,6 +838,12 @@ static void ps2_mouse_event(DeviceState *dev, QemuConsole *src,
             } else if (btn->button == INPUT_BUTTON_WHEEL_DOWN) {
                 s->mouse_dz++;
             }
+
+            if (btn->button == INPUT_BUTTON_WHEEL_RIGHT) {
+                s->mouse_dw--;
+            } else if (btn->button == INPUT_BUTTON_WHEEL_LEFT) {
+                s->mouse_dw++;
+            }
         } else {
             s->mouse_buttons &= ~bmap[btn->button];
         }
@@ -833,8 +871,10 @@ static void ps2_mouse_sync(DeviceState *dev)
         /* if not remote, send event. Multiple events are sent if
            too big deltas */
         while (ps2_mouse_send_packet(s)) {
-            if (s->mouse_dx == 0 && s->mouse_dy == 0 && s->mouse_dz == 0)
+            if (s->mouse_dx == 0 && s->mouse_dy == 0
+                    && s->mouse_dz == 0 && s->mouse_dw == 0) {
                 break;
+            }
         }
     }
 }
@@ -1036,6 +1076,7 @@ static void ps2_mouse_reset(void *opaque)
     s->mouse_dx = 0;
     s->mouse_dy = 0;
     s->mouse_dz = 0;
+    s->mouse_dw = 0;
     s->mouse_buttons = 0;
 }
 
diff --git a/qapi/ui.json b/qapi/ui.json
index 2b4371da3777..9354f4c46716 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -905,7 +905,7 @@
 ##
 { 'enum'  : 'InputButton',
   'data'  : [ 'left', 'middle', 'right', 'wheel-up', 'wheel-down', 'side',
-  'extra' ] }
+  'extra', 'wheel-left', 'wheel-right' ] }
 
 ##
 # @InputAxis:
-- 
2.34.1


