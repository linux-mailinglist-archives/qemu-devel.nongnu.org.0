Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D23320129
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:05:44 +0100 (CET)
Received: from localhost ([::1]:50334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDDuB-0001Vi-Hj
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lDDpV-0003X7-OD
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:00:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lDDpS-0005en-Tf
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613772050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TARjO2/fwKd29LGUq4b17AVZp5xI25cUkMSXVN3aIr8=;
 b=C8leXi0vgILsYrdURVivjJ56dy1v6Qc7UjkS8aQp1osla/KKl6Cb2VY7rbcmWudT81/vGq
 xl1gE3TZnpsbzcqAAqJHl7CjjVAKm3OfR2lKAUxpjG/5n8x9F8w7F2mxhqZnfjqTRE0K4W
 1nW9YLQTe2Drb8ED5+huHlnjd/0noHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-KTZqHNHJN7C-KQwsVphzcg-1; Fri, 19 Feb 2021 17:00:48 -0500
X-MC-Unique: KTZqHNHJN7C-KQwsVphzcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED01C803648;
 Fri, 19 Feb 2021 22:00:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FEFF1A49B;
 Fri, 19 Feb 2021 22:00:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2E9111800866; Fri, 19 Feb 2021 23:00:37 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/8] ui/cocoa: Statically allocate dcl
Date: Fri, 19 Feb 2021 23:00:35 +0100
Message-Id: <20210219220036.100654-8-kraxel@redhat.com>
In-Reply-To: <20210219220036.100654-1-kraxel@redhat.com>
References: <20210219220036.100654-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

There is no need of dynamic allocation as dcl is a small singleton.
Static allocation reduces code size and makes hacking with ui/cocoa a
bit easier.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210219084419.90181-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/cocoa.m | 65 ++++++++++++++++++++++++++----------------------------
 1 file changed, 31 insertions(+), 34 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 13f19bece14d..0ef5fdf3b7a3 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -72,8 +72,24 @@ typedef struct {
     int height;
 } QEMUScreen;
 
+static void cocoa_update(DisplayChangeListener *dcl,
+                         int x, int y, int w, int h);
+
+static void cocoa_switch(DisplayChangeListener *dcl,
+                         DisplaySurface *surface);
+
+static void cocoa_refresh(DisplayChangeListener *dcl);
+
 NSWindow *normalWindow, *about_window;
-static DisplayChangeListener *dcl;
+static const DisplayChangeListenerOps dcl_ops = {
+    .dpy_name          = "cocoa",
+    .dpy_gfx_update = cocoa_update,
+    .dpy_gfx_switch = cocoa_switch,
+    .dpy_refresh = cocoa_refresh,
+};
+static DisplayChangeListener dcl = {
+    .ops = &dcl_ops,
+};
 static int last_buttons;
 static int cursor_hide = 1;
 
@@ -607,15 +623,15 @@ QemuCocoaView *cocoaView;
     // Toggle the stored state.
     modifiers_state[keycode] = !modifiers_state[keycode];
     // Send a keyup or keydown depending on the state.
-    qemu_input_event_send_key_qcode(dcl->con, keycode, modifiers_state[keycode]);
+    qemu_input_event_send_key_qcode(dcl.con, keycode, modifiers_state[keycode]);
 }
 
 - (void) toggleStatefulModifier: (int)keycode {
     // Toggle the stored state.
     modifiers_state[keycode] = !modifiers_state[keycode];
     // Generate keydown and keyup.
-    qemu_input_event_send_key_qcode(dcl->con, keycode, true);
-    qemu_input_event_send_key_qcode(dcl->con, keycode, false);
+    qemu_input_event_send_key_qcode(dcl.con, keycode, true);
+    qemu_input_event_send_key_qcode(dcl.con, keycode, false);
 }
 
 // Does the work of sending input to the monitor
@@ -799,7 +815,7 @@ QemuCocoaView *cocoaView;
             }
 
             if (qemu_console_is_graphic(NULL)) {
-                qemu_input_event_send_key_qcode(dcl->con, keycode, true);
+                qemu_input_event_send_key_qcode(dcl.con, keycode, true);
             } else {
                 [self handleMonitorInput: event];
             }
@@ -814,7 +830,7 @@ QemuCocoaView *cocoaView;
             }
 
             if (qemu_console_is_graphic(NULL)) {
-                qemu_input_event_send_key_qcode(dcl->con, keycode, false);
+                qemu_input_event_send_key_qcode(dcl.con, keycode, false);
             }
             break;
         case NSEventTypeMouseMoved:
@@ -892,9 +908,9 @@ QemuCocoaView *cocoaView;
             /* Determine if this is a scroll up or scroll down event */
                 buttons = ([event deltaY] > 0) ?
                     INPUT_BUTTON_WHEEL_UP : INPUT_BUTTON_WHEEL_DOWN;
-                qemu_input_queue_btn(dcl->con, buttons, true);
+                qemu_input_queue_btn(dcl.con, buttons, true);
                 qemu_input_event_sync();
-                qemu_input_queue_btn(dcl->con, buttons, false);
+                qemu_input_queue_btn(dcl.con, buttons, false);
                 qemu_input_event_sync();
             }
             /*
@@ -922,7 +938,7 @@ QemuCocoaView *cocoaView;
                 [INPUT_BUTTON_MIDDLE]     = MOUSE_EVENT_MBUTTON,
                 [INPUT_BUTTON_RIGHT]      = MOUSE_EVENT_RBUTTON
             };
-            qemu_input_update_buttons(dcl->con, bmap, last_buttons, buttons);
+            qemu_input_update_buttons(dcl.con, bmap, last_buttons, buttons);
             last_buttons = buttons;
         }
         if (isMouseGrabbed) {
@@ -932,12 +948,12 @@ QemuCocoaView *cocoaView;
                  * clicks in the titlebar.
                  */
                 if ([self screenContainsPoint:p]) {
-                    qemu_input_queue_abs(dcl->con, INPUT_AXIS_X, p.x, 0, screen.width);
-                    qemu_input_queue_abs(dcl->con, INPUT_AXIS_Y, screen.height - p.y, 0, screen.height);
+                    qemu_input_queue_abs(dcl.con, INPUT_AXIS_X, p.x, 0, screen.width);
+                    qemu_input_queue_abs(dcl.con, INPUT_AXIS_Y, screen.height - p.y, 0, screen.height);
                 }
             } else {
-                qemu_input_queue_rel(dcl->con, INPUT_AXIS_X, (int)[event deltaX]);
-                qemu_input_queue_rel(dcl->con, INPUT_AXIS_Y, (int)[event deltaY]);
+                qemu_input_queue_rel(dcl.con, INPUT_AXIS_X, (int)[event deltaX]);
+                qemu_input_queue_rel(dcl.con, INPUT_AXIS_Y, (int)[event deltaY]);
             }
         } else {
             return false;
@@ -1006,7 +1022,7 @@ QemuCocoaView *cocoaView;
         for (index = 0; index < max_index; index++) {
             if (modifiers_state[index]) {
                 modifiers_state[index] = 0;
-                qemu_input_event_send_key_qcode(dcl->con, index, false);
+                qemu_input_event_send_key_qcode(dcl.con, index, false);
             }
         }
     });
@@ -1833,19 +1849,6 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
     [pool release];
 }
 
-static void cocoa_cleanup(void)
-{
-    COCOA_DEBUG("qemu_cocoa: cocoa_cleanup\n");
-    g_free(dcl);
-}
-
-static const DisplayChangeListenerOps dcl_ops = {
-    .dpy_name          = "cocoa",
-    .dpy_gfx_update = cocoa_update,
-    .dpy_gfx_switch = cocoa_switch,
-    .dpy_refresh = cocoa_refresh,
-};
-
 static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
 {
     COCOA_DEBUG("qemu_cocoa: cocoa_display_init\n");
@@ -1866,14 +1869,8 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
         cursor_hide = 0;
     }
 
-    dcl = g_malloc0(sizeof(DisplayChangeListener));
-
     // register vga output callbacks
-    dcl->ops = &dcl_ops;
-    register_displaychangelistener(dcl);
-
-    // register cleanup function
-    atexit(cocoa_cleanup);
+    register_displaychangelistener(&dcl);
 }
 
 static QemuDisplay qemu_display_cocoa = {
-- 
2.29.2


