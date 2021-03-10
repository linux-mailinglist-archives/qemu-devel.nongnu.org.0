Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4765A333468
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:33:35 +0100 (CET)
Received: from localhost ([::1]:42180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqXO-00069q-BK
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:33:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJqO7-0007wj-U1
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 23:23:59 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJqO5-0003tJ-Ua
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 23:23:59 -0500
Received: by mail-pl1-x629.google.com with SMTP id j6so7835346plx.6
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 20:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=81/zDxGA/GAe20UdlArsvzRltxNMvMaxAmiGKLao1cM=;
 b=mEYadOwRzd4++rNi6Xt8SA10ZZ5rqOYDm7iuIj+TpDKPwmxxyH9AEW1Zc0WuQ2Zgtg
 VjdP/rs2ALlUK1nEXHiUrUASCVOwxfcjT8Lz6l0H5dEjAO0ECM7i/91acfsKrn0TfsqK
 obZw6Jn1DQomzhGu1wizsi/oQw6eVBJF6oH+In3SEZt0ruJ44Q4EQXOG3lat0gzRRtji
 R4G8M3wR3xCiOpx50uIK8oJlToWdlg3Db9zcMYglUZVsgblIOfgeysc5lfn9+vg2Loyg
 Vwm5D4j58hGs9RCSqujxZ+dmCtfCZITDY1woEa7UpUC9ePcEOxNawFqHyj0zqpkaS6nj
 ROAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=81/zDxGA/GAe20UdlArsvzRltxNMvMaxAmiGKLao1cM=;
 b=aV3GHniH47+7XHtDpd/hHoBU0ycOSrn0l1VI4E1CkEICNdVx/9Ay7zHTQE5hUJ3Ydw
 T3NGJEu3sDsw6AVppTjY/idwVS1ol38em+Qb7wxHlfbCvUYEEprYggi007gunNwZHAsq
 m7/IBoRwNhWMIAE9GluNxlAqh3tsZZyjuLNc9WineruDJpVB9w7KzKexdfrVEZApUOLB
 Ph/IA2jMZy50K3GwnCv2fsWHz/8Jo09g1ARH850N+fkgnZ9Li/lDsZ7HMsLqkP8XFBSn
 sqZlHAlhoAstsG+HjCpWvS8RPckxtu8LvGHOwuyLQTmFoeHPkVCfkOXCHSllv74aBr2Y
 wsQQ==
X-Gm-Message-State: AOAM530kTT7agHi0zm0ZCBmkDToHLu71/fIU9ysO4QaXvVjyyinJLtgp
 J5eH3Ihl8QkPG+WCr7Vhr/Ge0v1bxOTVPA==
X-Google-Smtp-Source: ABdhPJz1HPWOPqVivMsgX3QjirrTR2V5/VkiOHUN1MoquqVcFlrm/axbiU7LK4XRrDFclGtmsPFipg==
X-Received: by 2002:a17:90a:fd0b:: with SMTP id
 cv11mr1471898pjb.183.1615350235382; 
 Tue, 09 Mar 2021 20:23:55 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:681d:e6e5:d1b0:3153])
 by smtp.gmail.com with ESMTPSA id l15sm4380652pjq.9.2021.03.09.20.23.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Mar 2021 20:23:54 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] ui/cocoa: Clear modifiers whenever possible
Date: Wed, 10 Mar 2021 13:23:48 +0900
Message-Id: <20210310042348.21931-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x629.google.com
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

Thanks to Konstantin Nazarov for testing and finding a bug in this
change:
https://gist.github.com/akihikodaki/87df4149e7ca87f18dc56807ec5a1bc5#gistcomment-3659419

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 148 +++++++++++++++++++++++++++++++++--------------------
 1 file changed, 92 insertions(+), 56 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index f27beb30e6e..2b6aea429f8 100644
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
@@ -714,57 +721,86 @@ - (bool) handleEventLocked:(NSEvent *)event
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
+                    case kVK_RightControl:
+                        if (!!(modifiers & NSEventModifierFlagControl)) {
+                            [self toggleModifier:Q_KEY_CODE_CTRL_R];
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


