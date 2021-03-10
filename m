Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E983340AA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 15:48:06 +0100 (CET)
Received: from localhost ([::1]:58742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK084-0004q4-SC
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 09:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lK06I-0004Bn-6A
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 09:46:14 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:44728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lK06F-0001X7-TG
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 09:46:13 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso7602866pjb.3
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 06:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HCxl6f7DCzbd6lpJWFn7bQPobY8yW9uHMyQpi4zXnYE=;
 b=FgmtEUP62uh5WXIMzFyphZO0BIKDQff1FfmstyRgbpwFIggJptHlld/EjNmgSMwJNq
 um2hldRqmdltSzz7Bf4TcHvMBNWghftiy7LLS6xW5N1bJbD/GG5ukxYgktJ3ibn8jq3j
 l8tb1uVT0/K6Y6AdyBdSwb+ZnNIBnZJjvJu+mDCioS75B2f05xAphAI3H60iMH+FwWLw
 pvopbi55WmqAXrQWFqPhjYwBjXhi8T4seI+PgSTuyihw5KQJX+ElV1AAb4x3fGp32y2k
 B1M1HD8DwSazagk4yCrKHM2sBb/LBsmNqLEL/e+jhFfi5qHK1JZUmDwZDDVeiCUGgyuL
 QPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HCxl6f7DCzbd6lpJWFn7bQPobY8yW9uHMyQpi4zXnYE=;
 b=FVomQGaIo0729L/41CIOTVg9NXCA9ipcrjDttwhsPKXLEMGVRJYD/RowgIBnMeRiG8
 JUmm92gFvGXTRutUG6DvQjezAdg782uowWnl7yjSaXLXHEY+qnLzxbQi4fFLGuyA4nEh
 qYXYpon3eXstSXmbldIMTmePeIvGPoa4Sm3BcjXIzL3B8da85sfGQZ0VCBCkqIs0HKP8
 gdJ+qLPBzKPseFxwP/vj/T2FHfJl3GHx2Pw4n7zO2t52ThOyhjkT+N2NsU7Q0n4eWCPn
 E5Q9PqSNuxb42otIvQ8osQ8goyvTTgmFIHoKgjFHySJy2oz7RdhEH4idzYM6mMQmLNjc
 XjEw==
X-Gm-Message-State: AOAM531q7Ncxjd6cAs5S9S9aBGBjPh6UDS9eqBoZzeehz1UQRHQnYzj2
 CuY18AzL/X8wUyNo+15682k/a8TcTTqleg==
X-Google-Smtp-Source: ABdhPJx/TA+SOKyA2EsHph7QfBB5/otd6j4ROWTF47uzUgpbKyPVFr/eZ9oudilvBO7r+NRgUe7pug==
X-Received: by 2002:a17:902:cec8:b029:e4:a497:da8d with SMTP id
 d8-20020a170902cec8b02900e4a497da8dmr3310829plg.16.1615387569949; 
 Wed, 10 Mar 2021 06:46:09 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:681d:e6e5:d1b0:3153])
 by smtp.gmail.com with ESMTPSA id i14sm6807117pjh.17.2021.03.10.06.46.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Mar 2021 06:46:09 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3] ui/cocoa: Clear modifiers whenever possible
Date: Wed, 10 Mar 2021 23:46:02 +0900
Message-Id: <20210310144602.58528-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1035.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Konstantin Nazarov <mail@knazarov.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 ui/cocoa.m | 148 +++++++++++++++++++++++++++--------------------------
 1 file changed, 76 insertions(+), 72 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index f27beb30e6e..035f96aab04 100644
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
@@ -189,14 +190,6 @@ static bool bool_with_iothread_lock(BoolCodeBlock block)
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
@@ -306,7 +299,7 @@ @interface QemuCocoaView : NSView
     NSWindow *fullScreenWindow;
     float cx,cy,cw,ch,cdx,cdy;
     pixman_image_t *pixman_image;
-    BOOL modifiers_state[256];
+    QKbdState *kbd;
     BOOL isMouseGrabbed;
     BOOL isFullscreen;
     BOOL isAbsoluteEnabled;
@@ -353,6 +346,7 @@ - (id)initWithFrame:(NSRect)frameRect
 
         screen.width = frameRect.size.width;
         screen.height = frameRect.size.height;
+        kbd = qkbd_state_init(dcl.con);
 
     }
     return self;
@@ -366,6 +360,7 @@ - (void) dealloc
         pixman_image_unref(pixman_image);
     }
 
+    qkbd_state_free(kbd);
     [super dealloc];
 }
 
@@ -608,19 +603,8 @@ - (void) toggleFullScreen:(id)sender
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
@@ -714,57 +698,86 @@ - (bool) handleEventLocked:(NSEvent *)event
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
+                case kVK_RightCommand:
+                    if (isMouseGrabbed &&
+                        !!(modifiers & NSEventModifierFlagCommand)) {
+                        [self toggleKey:Q_KEY_CODE_META_R];
                     }
-                }
+                    break;
             }
-
             break;
         case NSEventTypeKeyDown:
             keycode = cocoa_keycode_to_qemu([event keyCode]);
@@ -804,7 +817,7 @@ - (bool) handleEventLocked:(NSEvent *)event
             }
 
             if (qemu_console_is_graphic(NULL)) {
-                qemu_input_event_send_key_qcode(dcl.con, keycode, true);
+                qkbd_state_key_event(kbd, keycode, true);
             } else {
                 [self handleMonitorInput: event];
             }
@@ -819,7 +832,7 @@ - (bool) handleEventLocked:(NSEvent *)event
             }
 
             if (qemu_console_is_graphic(NULL)) {
-                qemu_input_event_send_key_qcode(dcl.con, keycode, false);
+                qkbd_state_key_event(kbd, keycode, false);
             }
             break;
         case NSEventTypeMouseMoved:
@@ -1003,17 +1016,8 @@ - (QEMUScreen) gscreen {return screen;}
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
2.24.3 (Apple Git-128)


