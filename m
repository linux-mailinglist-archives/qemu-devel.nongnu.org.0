Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B4B32E7CA
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 13:21:04 +0100 (CET)
Received: from localhost ([::1]:37756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI9S3-0001x8-RC
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 07:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lI9QR-0001Fv-Lh
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 07:19:23 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lI9QP-0004mR-9b
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 07:19:23 -0500
Received: by mail-pl1-x634.google.com with SMTP id c16so1351259ply.0
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 04:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MS1YtIiFvnaMvZIN+/vfOaN3d8TXxwZx1s64ja1hh/g=;
 b=h9+UbzftE1hV2Ug4pYxu0AufzB0In17/uby6rmlPq0VBKYouWZ6nGadoHOgTFeLZtX
 psFMua0/CC0YZ1jtFUdwo/8XUOOC76MGz/hYwCIwybtIpK6YTpgl9b+xdh2OMHZ1qcfw
 DeNQpqqawPrYYF7fDN0TPSyQSqV92q7Criyh4LKJOiEPZhegURWBWSIG/mZMRUgzrEWR
 W09mvJ9KKPLKvNY93jfoZXPNd22bEAXegMZKAwHfPCdb99u3TfxBjxu+ZX5OugEP79n9
 x7DptIrh9Dx+Eqs4NvUQZFQySjcg2biV5nzjDnr6fVzu20eKR2uALW6d5ASOB10jBqCw
 AXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MS1YtIiFvnaMvZIN+/vfOaN3d8TXxwZx1s64ja1hh/g=;
 b=sz2GTa0m3C04zhAx3SNOe1ESN4vQy8x6ss6Q2fTIOe5JqTLPAZhYXF+w/fUCpFsHuF
 rtHY08bylPnebWbZFWFHtGDoZSEH9d80sQzMZHWND2MbrU/N1CEJTEJ27B7zJNQYI/E0
 VXYQWFmLqKB8uWLRvB93dbwHXS7UX04roVZEDN3vIKIweG9FQvo63Q5PUvNrUciCpdxD
 sSCPBCic17UroKSnH8P9jzHRndOxOMNBAr+Is53voDITcYxjIFObXc9Sy5gHi6S9c5l2
 qy8kabBK9uDpcZ08F4Ircj2J2oUUiYNWzzmm16yyAfIDKvUMI7BkUalLq+s2Sxe55iko
 8vSg==
X-Gm-Message-State: AOAM532Li3SzvI+B8G++dDClHxUyNHcIqUhXmXvNrdAz6UFXOHZDIWe0
 6Bzydq/l+o3VuNoX5BcspGMf+sYPCGcLFQ==
X-Google-Smtp-Source: ABdhPJzCMQWnVaPb1HkOTk7rukPNSEvE/r+XwOomiP/5/2Kxy6CNdCYxZsMVWNPv4qEYxcvJIR10qQ==
X-Received: by 2002:a17:90a:e2ca:: with SMTP id
 fr10mr9903108pjb.154.1614946756178; 
 Fri, 05 Mar 2021 04:19:16 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:6076:fea8:b0ba:4fdb])
 by smtp.gmail.com with ESMTPSA id q23sm2526049pfl.123.2021.03.05.04.19.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Mar 2021 04:19:15 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Clear modifiers whenever possible
Date: Fri,  5 Mar 2021 21:19:09 +0900
Message-Id: <20210305121909.65249-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x634.google.com
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 142 ++++++++++++++++++++++++++++++++---------------------
 1 file changed, 86 insertions(+), 56 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index f27beb30e6e..940d8b83e31 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -189,14 +189,6 @@ static bool bool_with_iothread_lock(BoolCodeBlock block)
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
@@ -615,9 +607,24 @@ - (void) toggleModifier: (int)keycode {
     qemu_input_event_send_key_qcode(dcl.con, keycode, modifiers_state[keycode]);
 }
 
-- (void) toggleStatefulModifier: (int)keycode {
+- (void) clearModifier: (int)keycode {
+    if (!modifiers_state[keycode]) {
+        return;
+    }
+
+    // Clear the stored state.
+    modifiers_state[keycode] = NO;
+    // Send a keyup.
+    qemu_input_event_send_key_qcode(dcl.con, keycode, false);
+}
+
+- (void) setStatefulModifier: (int)keycode down:(BOOL)down {
+    if (down == modifiers_state[keycode]) {
+        return;
+    }
+
     // Toggle the stored state.
-    modifiers_state[keycode] = !modifiers_state[keycode];
+    modifiers_state[keycode] = down;
     // Generate keydown and keyup.
     qemu_input_event_send_key_qcode(dcl.con, keycode, true);
     qemu_input_event_send_key_qcode(dcl.con, keycode, false);
@@ -714,57 +721,80 @@ - (bool) handleEventLocked:(NSEvent *)event
     static bool switched_to_fullscreen = false;
     // Location of event in virtual screen coordinates
     NSPoint p = [self screenLocationOfEvent:event];
+    NSUInteger modifiers = [event modifierFlags];
 
-    switch ([event type]) {
-        case NSEventTypeFlagsChanged:
-            if ([event keyCode] == 0) {
-                // When the Cocoa keyCode is zero that means keys should be
-                // synthesized based on the values in in the eventModifiers
-                // bitmask.
-
-                if (qemu_console_is_graphic(NULL)) {
-                    NSUInteger modifiers = [event modifierFlags];
+    // emulate caps lock keydown and keyup
+    [self setStatefulModifier:Q_KEY_CODE_CAPS_LOCK down:!!(modifiers & NSEventModifierFlagCapsLock)];
 
-                    if (!!(modifiers & NSEventModifierFlagCapsLock) != !!modifiers_state[Q_KEY_CODE_CAPS_LOCK]) {
-                        [self toggleStatefulModifier:Q_KEY_CODE_CAPS_LOCK];
-                    }
-                    if (!!(modifiers & NSEventModifierFlagShift) != !!modifiers_state[Q_KEY_CODE_SHIFT]) {
-                        [self toggleModifier:Q_KEY_CODE_SHIFT];
-                    }
-                    if (!!(modifiers & NSEventModifierFlagControl) != !!modifiers_state[Q_KEY_CODE_CTRL]) {
-                        [self toggleModifier:Q_KEY_CODE_CTRL];
-                    }
-                    if (!!(modifiers & NSEventModifierFlagOption) != !!modifiers_state[Q_KEY_CODE_ALT]) {
-                        [self toggleModifier:Q_KEY_CODE_ALT];
-                    }
-                    if (!!(modifiers & NSEventModifierFlagCommand) != !!modifiers_state[Q_KEY_CODE_META_L]) {
-                        [self toggleModifier:Q_KEY_CODE_META_L];
-                    }
-                }
-            } else {
-                keycode = cocoa_keycode_to_qemu([event keyCode]);
-            }
-
-            if ((keycode == Q_KEY_CODE_META_L || keycode == Q_KEY_CODE_META_R)
-               && !isMouseGrabbed) {
-              /* Don't pass command key changes to guest unless mouse is grabbed */
-              keycode = 0;
-            }
+    if (qemu_console_is_graphic(NULL)) {
+        if (!(modifiers & NSEventModifierFlagShift)) {
+            [self clearModifier:Q_KEY_CODE_SHIFT];
+            [self clearModifier:Q_KEY_CODE_SHIFT_R];
+        }
+        if (!(modifiers & NSEventModifierFlagControl)) {
+            [self clearModifier:Q_KEY_CODE_CTRL];
+            [self clearModifier:Q_KEY_CODE_CTRL_R];
+        }
+        if (!(modifiers & NSEventModifierFlagOption)) {
+            [self clearModifier:Q_KEY_CODE_ALT];
+            [self clearModifier:Q_KEY_CODE_ALT_R];
+        }
+        if (!(modifiers & NSEventModifierFlagCommand)) {
+            [self clearModifier:Q_KEY_CODE_META_L];
+            [self clearModifier:Q_KEY_CODE_META_R];
+        }
+    }
 
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
+    switch ([event type]) {
+        case NSEventTypeFlagsChanged:
+            if (qemu_console_is_graphic(NULL)) {
+                switch ([event keyCode]) {
+                    case kVK_Shift:
+                        if (!!(modifiers & NSEventModifierFlagShift)) {
+                            [self toggleModifier:Q_KEY_CODE_SHIFT];
+                        }
+                        break;
+
+                    case kVK_RightShift:
+                        if (!!(modifiers & NSEventModifierFlagShift)) {
+                            [self toggleModifier:Q_KEY_CODE_SHIFT_R];
+                        }
+                        break;
+
+                    case kVK_Control:
+                        if (!!(modifiers & NSEventModifierFlagControl)) {
+                            [self toggleModifier:Q_KEY_CODE_CTRL];
+                        }
+                        break;
+
+                    case kVK_Option:
+                        if (!!(modifiers & NSEventModifierFlagOption)) {
+                            [self toggleModifier:Q_KEY_CODE_ALT];
+                        }
+                        break;
+
+                    case kVK_RightOption:
+                        if (!!(modifiers & NSEventModifierFlagOption)) {
+                            [self toggleModifier:Q_KEY_CODE_ALT_R];
+                        }
+                        break;
+
+                    /* Don't pass command key changes to guest unless mouse is grabbed */
+                    case kVK_Command:
+                        if (isMouseGrabbed &&
+                            !!(modifiers & NSEventModifierFlagCommand)) {
+                            [self toggleModifier:Q_KEY_CODE_META_L];
+                        }
+                        break;
+
+                    case kVK_RightCommand:
+                        if (isMouseGrabbed &&
+                            !!(modifiers & NSEventModifierFlagCommand)) {
+                            [self toggleModifier:Q_KEY_CODE_META_R];
+                        }
+                        break;
                 }
             }
-
             break;
         case NSEventTypeKeyDown:
             keycode = cocoa_keycode_to_qemu([event keyCode]);
-- 
2.24.3 (Apple Git-128)


