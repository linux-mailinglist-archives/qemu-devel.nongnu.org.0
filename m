Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 635BB31F601
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 09:45:32 +0100 (CET)
Received: from localhost ([::1]:36212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD1Pn-0001ce-3d
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 03:45:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD1Ov-0001Bd-Md
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 03:44:37 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:46398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD1Os-0005hF-55
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 03:44:37 -0500
Received: by mail-pg1-x530.google.com with SMTP id 75so3375590pgf.13
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 00:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kPw/d9i5So0JhIzxUwWRGTIJqmg8QZtaKJRE8e/fz24=;
 b=FMll0WmlRxMuvP2W1/kghqf4Et8Cpny+BcQfY10YbM7FKE7Z7XILQMK4PKQOz9WlGI
 Y4oDPm2y7t+XV6gUmfEYTO+KQUhpxJjbAvzhaBSzeY/PEU7KXd4xH3uK1Q0NAAlixla9
 03SvUL+5iaRUasfS89coKLnIrIhEpeXANp8tKkM9eqCg/e7H318+Vm59oe/L9/SXNKl5
 rr9rcuxynlK81/qkd7z4EW7ZNiFuhSKbHYFO7kOU//CN6XiV+0BnZUkZ4NbKOySG6GwK
 KoOoE9BjvqLoMnj6jSkk12Yx7EYcTnXxjsyOW6qkhifCiF//Dsaq0JRtwBp/7qK0rOhV
 MW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kPw/d9i5So0JhIzxUwWRGTIJqmg8QZtaKJRE8e/fz24=;
 b=SYA0YPOqfWJI/Ovcusf8pM79B/MB3IL492lcbf/PVrpghccHgWw2Zm23UG6EavZo6k
 NOQDjOOQ16QIZ/YHCFP75IPTWgPKb31a3zC+vqGAuCUUSPgPR+nzfATtNlsf9cifx7LZ
 8JG7Qv8tzd2ZiAORHBwDiOF1LQTYgvMF+wSDeWkegMqFjOg3Tam+AJALIlTCNFafB8Eh
 yHIEwonDDvQld1WoAVOy/oSljzPw1TRA9pt28h+WlSOiuwyTresC5wPJFeKax5CcXhjc
 Xe11SNDY6Wz7SVDIwqcenCZxo/n22MR4le5XUmgw6SfMjVtkgDmpAQYf9RM5+zKYCDkT
 1pFA==
X-Gm-Message-State: AOAM531hP08C1JkqsD5QOKcbKkZ9ORFlYG/jPEdg6vBh/EWcEEGDvDiK
 xX/S1CsdCqej95q8VdREtdN62UpLvPM1hg==
X-Google-Smtp-Source: ABdhPJwDt76Jj3INNCl7lZqqHnBeD3lHnPx5kMcK7sdj2nUM9D2Ppbfm0q+dqwdZ4VkMtFuA2YHG2A==
X-Received: by 2002:a63:c1d:: with SMTP id b29mr7744638pgl.9.1613724270990;
 Fri, 19 Feb 2021 00:44:30 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d8f0:71c1:3d6a:4f53])
 by smtp.gmail.com with ESMTPSA id 2sm3296781pfi.116.2021.02.19.00.44.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 00:44:30 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Statically allocate dcl
Date: Fri, 19 Feb 2021 17:44:19 +0900
Message-Id: <20210219084419.90181-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no need of dynamic allocation as dcl is a small singleton.
Static allocation reduces code size and makes hacking with ui/cocoa a
bit easier.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 65 ++++++++++++++++++++++++++----------------------------
 1 file changed, 31 insertions(+), 34 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 13fba8103e1..efa3bea8f5f 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -74,8 +74,24 @@
     int bitsPerPixel;
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
 
@@ -602,15 +618,15 @@ - (void) toggleModifier: (int)keycode {
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
@@ -794,7 +810,7 @@ - (bool) handleEventLocked:(NSEvent *)event
             }
 
             if (qemu_console_is_graphic(NULL)) {
-                qemu_input_event_send_key_qcode(dcl->con, keycode, true);
+                qemu_input_event_send_key_qcode(dcl.con, keycode, true);
             } else {
                 [self handleMonitorInput: event];
             }
@@ -809,7 +825,7 @@ - (bool) handleEventLocked:(NSEvent *)event
             }
 
             if (qemu_console_is_graphic(NULL)) {
-                qemu_input_event_send_key_qcode(dcl->con, keycode, false);
+                qemu_input_event_send_key_qcode(dcl.con, keycode, false);
             }
             break;
         case NSEventTypeMouseMoved:
@@ -895,9 +911,9 @@ - (bool) handleEventLocked:(NSEvent *)event
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
@@ -925,7 +941,7 @@ - (bool) handleEventLocked:(NSEvent *)event
                 [INPUT_BUTTON_MIDDLE]     = MOUSE_EVENT_MBUTTON,
                 [INPUT_BUTTON_RIGHT]      = MOUSE_EVENT_RBUTTON
             };
-            qemu_input_update_buttons(dcl->con, bmap, last_buttons, buttons);
+            qemu_input_update_buttons(dcl.con, bmap, last_buttons, buttons);
             last_buttons = buttons;
         }
         if (isMouseGrabbed) {
@@ -935,12 +951,12 @@ - (bool) handleEventLocked:(NSEvent *)event
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
@@ -1009,7 +1025,7 @@ - (void) raiseAllKeys
         for (index = 0; index < max_index; index++) {
             if (modifiers_state[index]) {
                 modifiers_state[index] = 0;
-                qemu_input_event_send_key_qcode(dcl->con, index, false);
+                qemu_input_event_send_key_qcode(dcl.con, index, false);
             }
         }
     });
@@ -1836,19 +1852,6 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
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
@@ -1869,14 +1872,8 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
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
2.24.3 (Apple Git-128)


