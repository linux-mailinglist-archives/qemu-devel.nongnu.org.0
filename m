Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1556337300
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:48:54 +0100 (CET)
Received: from localhost ([::1]:35986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKkH-0008H0-Pq
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:48:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKWJ-0003jz-K1
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:34:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKW9-0006W6-EF
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:34:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615466056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SXyaJitTiRl72VJ+WQzLF6+6PYZN+obAQTsIl9RZ35w=;
 b=Gw2ONiBhGpBbm4O6BDBD15zU+pi8rOQJF+4fexaj4XEwr0uMuNHpUdhq+MpRGIm2+7gk3o
 XfAuGPKNErkcqwg7rS/dheLqeYqzOxS60Vrjbg+Lsc7PD9JTmRGGHtdxR/oYWMEOueNeah
 i56xMDMkM9Pore6Dz5m7yPzIWP9gcrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-WuW9XrkfNwKmIsMk1p-KNw-1; Thu, 11 Mar 2021 07:34:12 -0500
X-MC-Unique: WuW9XrkfNwKmIsMk1p-KNw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6A1A19253C3;
 Thu, 11 Mar 2021 12:34:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C3FC18B5E;
 Thu, 11 Mar 2021 12:34:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F08D31800912; Thu, 11 Mar 2021 13:34:01 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/8] ui/cocoa: Clear modifiers whenever possible
Date: Thu, 11 Mar 2021 13:33:59 +0100
Message-Id: <20210311123401.340122-7-kraxel@redhat.com>
In-Reply-To: <20210311123401.340122-1-kraxel@redhat.com>
References: <20210311123401.340122-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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

ui/cocoa does not receive NSEventTypeFlagsChanged when it is not active,
and the modifier state can be desynchronized in such a situation.

[NSEvent -modifierFlags] tells whether a modifier is *not* pressed, so
check it whenever receiving an event and clear the modifier if it is not
pressed.

Note that [NSEvent -modifierFlags] does not tell if a certain modifier
*is* pressed because the documented mask for [NSEvent -modifierFlags]
generalizes left shift and right shift, for example. CapsLock is the
only exception. The pressed state is synchronized only with
NSEventTypeFlagsChanged.

This change also removes modifier keys from keycode map. If they
are input with NSEventTypeKeyDown or NSEventTypeKeyUp, it leads to
desynchronization. Although such a situation is not observed, they are
removed just in case.

Moreover, QKbdState is introduced for automatic key state tracking.

Thanks to Konstantin Nazarov for testing and finding a bug in this
change:
https://gist.github.com/akihikodaki/87df4149e7ca87f18dc56807ec5a1bc5#gistcomment-3659419

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210310144602.58528-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/cocoa.m | 150 +++++++++++++++++++++++++++--------------------------
 1 file changed, 77 insertions(+), 73 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 4753bb2f8800..f71c59711fa6 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -30,6 +30,7 @@
 #include "qemu-common.h"
 #include "ui/console.h"
 #include "ui/input.h"
+#include "ui/kbd-state.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
 #include "sysemu/cpu-throttle.h"
@@ -190,14 +191,6 @@ const int mac_to_qkeycode_map[] = {
     [kVK_ANSI_Comma] = Q_KEY_CODE_COMMA,
     [kVK_ANSI_Period] = Q_KEY_CODE_DOT,
     [kVK_ANSI_Slash] = Q_KEY_CODE_SLASH,
-    [kVK_Shift] = Q_KEY_CODE_SHIFT,
-    [kVK_RightShift] = Q_KEY_CODE_SHIFT_R,
-    [kVK_Control] = Q_KEY_CODE_CTRL,
-    [kVK_RightControl] = Q_KEY_CODE_CTRL_R,
-    [kVK_Option] = Q_KEY_CODE_ALT,
-    [kVK_RightOption] = Q_KEY_CODE_ALT_R,
-    [kVK_Command] = Q_KEY_CODE_META_L,
-    [0x36] = Q_KEY_CODE_META_R, /* There is no kVK_RightCommand */
     [kVK_Space] = Q_KEY_CODE_SPC,
 
     [kVK_ANSI_Keypad0] = Q_KEY_CODE_KP_0,
@@ -307,7 +300,7 @@ static void handleAnyDeviceErrors(Error * err)
     NSWindow *fullScreenWindow;
     float cx,cy,cw,ch,cdx,cdy;
     pixman_image_t *pixman_image;
-    BOOL modifiers_state[256];
+    QKbdState *kbd;
     BOOL isMouseGrabbed;
     BOOL isFullscreen;
     BOOL isAbsoluteEnabled;
@@ -354,6 +347,7 @@ QemuCocoaView *cocoaView;
 
         screen.width = frameRect.size.width;
         screen.height = frameRect.size.height;
+        kbd = qkbd_state_init(dcl.con);
 
     }
     return self;
@@ -367,6 +361,7 @@ QemuCocoaView *cocoaView;
         pixman_image_unref(pixman_image);
     }
 
+    qkbd_state_free(kbd);
     [super dealloc];
 }
 
@@ -604,19 +599,8 @@ QemuCocoaView *cocoaView;
     }
 }
 
-- (void) toggleModifier: (int)keycode {
-    // Toggle the stored state.
-    modifiers_state[keycode] = !modifiers_state[keycode];
-    // Send a keyup or keydown depending on the state.
-    qemu_input_event_send_key_qcode(dcl.con, keycode, modifiers_state[keycode]);
-}
-
-- (void) toggleStatefulModifier: (int)keycode {
-    // Toggle the stored state.
-    modifiers_state[keycode] = !modifiers_state[keycode];
-    // Generate keydown and keyup.
-    qemu_input_event_send_key_qcode(dcl.con, keycode, true);
-    qemu_input_event_send_key_qcode(dcl.con, keycode, false);
+- (void) toggleKey: (int)keycode {
+    qkbd_state_key_event(kbd, keycode, !qkbd_state_key_get(kbd, keycode));
 }
 
 // Does the work of sending input to the monitor
@@ -710,57 +694,86 @@ QemuCocoaView *cocoaView;
     static bool switched_to_fullscreen = false;
     // Location of event in virtual screen coordinates
     NSPoint p = [self screenLocationOfEvent:event];
+    NSUInteger modifiers = [event modifierFlags];
+
+    // emulate caps lock keydown and keyup
+    if (!!(modifiers & NSEventModifierFlagCapsLock) !=
+        qkbd_state_modifier_get(kbd, QKBD_MOD_CAPSLOCK)) {
+        qkbd_state_key_event(kbd, Q_KEY_CODE_CAPS_LOCK, true);
+        qkbd_state_key_event(kbd, Q_KEY_CODE_CAPS_LOCK, false);
+    }
+
+    if (!(modifiers & NSEventModifierFlagShift)) {
+        qkbd_state_key_event(kbd, Q_KEY_CODE_SHIFT, false);
+        qkbd_state_key_event(kbd, Q_KEY_CODE_SHIFT_R, false);
+    }
+    if (!(modifiers & NSEventModifierFlagControl)) {
+        qkbd_state_key_event(kbd, Q_KEY_CODE_CTRL, false);
+        qkbd_state_key_event(kbd, Q_KEY_CODE_CTRL_R, false);
+    }
+    if (!(modifiers & NSEventModifierFlagOption)) {
+        qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
+        qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
+    }
+    if (!(modifiers & NSEventModifierFlagCommand)) {
+        qkbd_state_key_event(kbd, Q_KEY_CODE_META_L, false);
+        qkbd_state_key_event(kbd, Q_KEY_CODE_META_R, false);
+    }
 
     switch ([event type]) {
         case NSEventTypeFlagsChanged:
-            if ([event keyCode] == 0) {
-                // When the Cocoa keyCode is zero that means keys should be
-                // synthesized based on the values in in the eventModifiers
-                // bitmask.
-
-                if (qemu_console_is_graphic(NULL)) {
-                    NSUInteger modifiers = [event modifierFlags];
+            switch ([event keyCode]) {
+                case kVK_Shift:
+                    if (!!(modifiers & NSEventModifierFlagShift)) {
+                        [self toggleKey:Q_KEY_CODE_SHIFT];
+                    }
+                    break;
 
-                    if (!!(modifiers & NSEventModifierFlagCapsLock) != !!modifiers_state[Q_KEY_CODE_CAPS_LOCK]) {
-                        [self toggleStatefulModifier:Q_KEY_CODE_CAPS_LOCK];
+                case kVK_RightShift:
+                    if (!!(modifiers & NSEventModifierFlagShift)) {
+                        [self toggleKey:Q_KEY_CODE_SHIFT_R];
                     }
-                    if (!!(modifiers & NSEventModifierFlagShift) != !!modifiers_state[Q_KEY_CODE_SHIFT]) {
-                        [self toggleModifier:Q_KEY_CODE_SHIFT];
+                    break;
+
+                case kVK_Control:
+                    if (!!(modifiers & NSEventModifierFlagControl)) {
+                        [self toggleKey:Q_KEY_CODE_CTRL];
                     }
-                    if (!!(modifiers & NSEventModifierFlagControl) != !!modifiers_state[Q_KEY_CODE_CTRL]) {
-                        [self toggleModifier:Q_KEY_CODE_CTRL];
+                    break;
+
+                case kVK_RightControl:
+                    if (!!(modifiers & NSEventModifierFlagControl)) {
+                        [self toggleKey:Q_KEY_CODE_CTRL_R];
                     }
-                    if (!!(modifiers & NSEventModifierFlagOption) != !!modifiers_state[Q_KEY_CODE_ALT]) {
-                        [self toggleModifier:Q_KEY_CODE_ALT];
+                    break;
+
+                case kVK_Option:
+                    if (!!(modifiers & NSEventModifierFlagOption)) {
+                        [self toggleKey:Q_KEY_CODE_ALT];
                     }
-                    if (!!(modifiers & NSEventModifierFlagCommand) != !!modifiers_state[Q_KEY_CODE_META_L]) {
-                        [self toggleModifier:Q_KEY_CODE_META_L];
+                    break;
+
+                case kVK_RightOption:
+                    if (!!(modifiers & NSEventModifierFlagOption)) {
+                        [self toggleKey:Q_KEY_CODE_ALT_R];
                     }
-                }
-            } else {
-                keycode = cocoa_keycode_to_qemu([event keyCode]);
-            }
+                    break;
 
-            if ((keycode == Q_KEY_CODE_META_L || keycode == Q_KEY_CODE_META_R)
-               && !isMouseGrabbed) {
-              /* Don't pass command key changes to guest unless mouse is grabbed */
-              keycode = 0;
-            }
+                /* Don't pass command key changes to guest unless mouse is grabbed */
+                case kVK_Command:
+                    if (isMouseGrabbed &&
+                        !!(modifiers & NSEventModifierFlagCommand)) {
+                        [self toggleKey:Q_KEY_CODE_META_L];
+                    }
+                    break;
 
-            if (keycode) {
-                // emulate caps lock and num lock keydown and keyup
-                if (keycode == Q_KEY_CODE_CAPS_LOCK ||
-                    keycode == Q_KEY_CODE_NUM_LOCK) {
-                    [self toggleStatefulModifier:keycode];
-                } else if (qemu_console_is_graphic(NULL)) {
-                    if (switched_to_fullscreen) {
-                        switched_to_fullscreen = false;
-                    } else {
-                        [self toggleModifier:keycode];
-                    }
-                }
+                case kVK_RightCommand:
+                    if (isMouseGrabbed &&
+                        !!(modifiers & NSEventModifierFlagCommand)) {
+                        [self toggleKey:Q_KEY_CODE_META_R];
+                    }
+                    break;
             }
-
             break;
         case NSEventTypeKeyDown:
             keycode = cocoa_keycode_to_qemu([event keyCode]);
@@ -800,7 +813,7 @@ QemuCocoaView *cocoaView;
             }
 
             if (qemu_console_is_graphic(NULL)) {
-                qemu_input_event_send_key_qcode(dcl.con, keycode, true);
+                qkbd_state_key_event(kbd, keycode, true);
             } else {
                 [self handleMonitorInput: event];
             }
@@ -815,7 +828,7 @@ QemuCocoaView *cocoaView;
             }
 
             if (qemu_console_is_graphic(NULL)) {
-                qemu_input_event_send_key_qcode(dcl.con, keycode, false);
+                qkbd_state_key_event(kbd, keycode, false);
             }
             break;
         case NSEventTypeMouseMoved:
@@ -999,17 +1012,8 @@ QemuCocoaView *cocoaView;
  */
 - (void) raiseAllKeys
 {
-    const int max_index = ARRAY_SIZE(modifiers_state);
-
     with_iothread_lock(^{
-        int index;
-
-        for (index = 0; index < max_index; index++) {
-            if (modifiers_state[index]) {
-                modifiers_state[index] = 0;
-                qemu_input_event_send_key_qcode(dcl.con, index, false);
-            }
-        }
+        qkbd_state_lift_all_keys(kbd);
     });
 }
 @end
-- 
2.29.2


