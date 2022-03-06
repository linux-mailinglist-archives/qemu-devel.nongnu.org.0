Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3744CEE84
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:32:32 +0100 (CET)
Received: from localhost ([::1]:53892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0MZ-0005e3-E6
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:32:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0AJ-00021S-D9; Sun, 06 Mar 2022 18:19:51 -0500
Received: from [2a00:1450:4864:20::32c] (port=37680
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0AH-0007X0-KO; Sun, 06 Mar 2022 18:19:51 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 q7-20020a7bce87000000b00382255f4ca9so9828123wmj.2; 
 Sun, 06 Mar 2022 15:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9MIxFXt6QBm8RrRkOgLio3kEWC3v+nhkcw1Ez/nLUEY=;
 b=MMD8c8E+p3AQErPo03+rZv27SdGnjA14NC8ihHjzwvFImm8N++QyeJGKqP8U9VtABz
 0lC9vDHW5d3Co0jIZo94ZyWOXKHiD7NYa35oYuGrph0g/P3A3ObtoqlSl6Koz/+rH4mZ
 /67liArNQY+Pn9CXeWyq/hTpoSxCjXUFadTPxRIXZmXvJ0ysPQ0Pfm49vX7QmmSLgf9v
 /qh+zmgGNvYxi0tqHV5xrzVIsyiUaYMhh2NAzjnxLVeGT89ibrAs/8O2pfjl0aEu3qWD
 M1V+ubZhvTiWwgU2YMVywSC7CRT0/oCaZdK91JifjtfHLz03rK9EU47jlsKebhAB5t2t
 DKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9MIxFXt6QBm8RrRkOgLio3kEWC3v+nhkcw1Ez/nLUEY=;
 b=UCkCc03wJy4r8IOTLo27moWmOMw3WTos8tmyi8p3SASRUra4R0FuCGMSQZX9/5ABPS
 /xzadFulsKeC+lJNAuNjdGBuU7bBEzgE++H9IP6kHEsPsfoc60qFUzu2RPWVGIQ6wpJ/
 H3ndXgIuMgI+GWrnJES5i7ixXQS19vLUlHv66JmABARhNjSo2HEbH8PCII2XWTmKfqjC
 KNCkHdU6Uydf7TlfVlwQSSY9GNLWhtfXWoMKGCl/NsI84g9kyOGzvDvwkGmtllDyMxeU
 IZ//DuHgpiYQ6NTuBOfO5FJOeH7NW+goN7mbUAgmtWn5GGL9YlZCxBoOzmeGv1+LdqFi
 4RJw==
X-Gm-Message-State: AOAM532+imJw1XLtuKW1VkCOj+mUhoZ52x2iXwqXJtdXyEmqn9+12UkC
 bbaAFUCaaTfKYy7D8/7LgsfuDn56OUk=
X-Google-Smtp-Source: ABdhPJyCeYrcf4QU4ysfWZVvqkFMe59zpL+yBF7uYmSTUvrXoVoDWW1KkRCbFdCxCksIbYIAZ3ITgQ==
X-Received: by 2002:a05:600c:a0a:b0:350:564b:d55e with SMTP id
 z10-20020a05600c0a0a00b00350564bd55emr6867615wmp.124.1646608787892; 
 Sun, 06 Mar 2022 15:19:47 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a5d4586000000b001f0436cb325sm9484768wrq.52.2022.03.06.15.19.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:19:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 21/22] ui/cocoa: add option to swap Option and Command
Date: Mon,  7 Mar 2022 00:17:52 +0100
Message-Id: <20220306231753.50277-22-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Markus Armbruster <armbru@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gustavo Noronha Silva <gustavo@noronha.dev.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Noronha Silva <gustavo@noronha.dev.br>

On Mac OS X the Option key maps to Alt and Command to Super/Meta. This change
swaps them around so that Alt is the key closer to the space bar and Meta/Super
is between Control and Alt, like on non-Mac keyboards.

It is a cocoa display option, disabled by default.

Acked-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.dev.br>
Message-Id: <20210713213200.2547-3-gustavo@noronha.dev.br>
Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20220306121119.45631-3-akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 qapi/ui.json    |  7 ++++++-
 qemu-options.hx |  2 +-
 ui/cocoa.m      | 49 +++++++++++++++++++++++++++++++++++++++----------
 3 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 1d60d5fc78..664da9e462 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1275,12 +1275,17 @@
 #             a global grab on key events. (default: off)
 #             See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
 #
+# @swap-opt-cmd: Swap the Option and Command keys so that their key codes match
+#                their position on non-Mac keyboards and you can use Meta/Super
+#                and Alt where you expect them. (default: off)
+#
 # Since: 7.0
 ##
 { 'struct': 'DisplayCocoa',
   'data': {
       '*left-command-key': 'bool',
-      '*full-grab': 'bool'
+      '*full-grab': 'bool',
+      '*swap-opt-cmd': 'bool'
   } }
 
 ##
diff --git a/qemu-options.hx b/qemu-options.hx
index 2e6d54db4f..f443b0f33a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1917,7 +1917,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
     "-display curses[,charset=<encoding>]\n"
 #endif
 #if defined(CONFIG_COCOA)
-    "-display cocoa[,full_grab=on|off]\n"
+    "-display cocoa[,full-grab=on|off][,swap-opt-cmd=on|off]\n"
 #endif
 #if defined(CONFIG_OPENGL)
     "-display egl-headless[,rendernode=<file>]\n"
diff --git a/ui/cocoa.m b/ui/cocoa.m
index ca1cab1ae6..c0a948201d 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -96,6 +96,7 @@ static DisplayChangeListener dcl = {
 static int last_buttons;
 static int cursor_hide = 1;
 static int left_command_key_enabled = 1;
+static bool swap_opt_cmd;
 
 static int gArgc;
 static char **gArgv;
@@ -854,12 +855,22 @@ static CGEventRef handleTapEvent(CGEventTapProxy proxy, CGEventType type, CGEven
         qkbd_state_key_event(kbd, Q_KEY_CODE_CTRL_R, false);
     }
     if (!(modifiers & NSEventModifierFlagOption)) {
-        qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
-        qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
+        if (swap_opt_cmd) {
+            qkbd_state_key_event(kbd, Q_KEY_CODE_META_L, false);
+            qkbd_state_key_event(kbd, Q_KEY_CODE_META_R, false);
+        } else {
+            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
+            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
+        }
     }
     if (!(modifiers & NSEventModifierFlagCommand)) {
-        qkbd_state_key_event(kbd, Q_KEY_CODE_META_L, false);
-        qkbd_state_key_event(kbd, Q_KEY_CODE_META_R, false);
+        if (swap_opt_cmd) {
+            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
+            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
+        } else {
+            qkbd_state_key_event(kbd, Q_KEY_CODE_META_L, false);
+            qkbd_state_key_event(kbd, Q_KEY_CODE_META_R, false);
+        }
     }
 
     switch ([event type]) {
@@ -891,29 +902,44 @@ static CGEventRef handleTapEvent(CGEventTapProxy proxy, CGEventType type, CGEven
 
                 case kVK_Option:
                     if (!!(modifiers & NSEventModifierFlagOption)) {
-                        [self toggleKey:Q_KEY_CODE_ALT];
+                        if (swap_opt_cmd) {
+                            [self toggleKey:Q_KEY_CODE_META_L];
+                        } else {
+                            [self toggleKey:Q_KEY_CODE_ALT];
+                        }
                     }
                     break;
 
                 case kVK_RightOption:
                     if (!!(modifiers & NSEventModifierFlagOption)) {
-                        [self toggleKey:Q_KEY_CODE_ALT_R];
+                        if (swap_opt_cmd) {
+                            [self toggleKey:Q_KEY_CODE_META_R];
+                        } else {
+                            [self toggleKey:Q_KEY_CODE_ALT_R];
+                        }
                     }
                     break;
 
                 /* Don't pass command key changes to guest unless mouse is grabbed */
                 case kVK_Command:
                     if (isMouseGrabbed &&
-                        !!(modifiers & NSEventModifierFlagCommand) &&
-                        left_command_key_enabled) {
-                        [self toggleKey:Q_KEY_CODE_META_L];
+                        !!(modifiers & NSEventModifierFlagCommand)) {
+                        if (swap_opt_cmd) {
+                            [self toggleKey:Q_KEY_CODE_ALT];
+                        } else {
+                            [self toggleKey:Q_KEY_CODE_META_L];
+                        }
                     }
                     break;
 
                 case kVK_RightCommand:
                     if (isMouseGrabbed &&
                         !!(modifiers & NSEventModifierFlagCommand)) {
-                        [self toggleKey:Q_KEY_CODE_META_R];
+                        if (swap_opt_cmd) {
+                            [self toggleKey:Q_KEY_CODE_ALT_R];
+                        } else {
+                            [self toggleKey:Q_KEY_CODE_META_R];
+                        }
                     }
                     break;
             }
@@ -2134,6 +2160,9 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
     if (opts->has_show_cursor && opts->show_cursor) {
         cursor_hide = 0;
     }
+    if (opts->u.cocoa.has_swap_opt_cmd) {
+        swap_opt_cmd = opts->u.cocoa.swap_opt_cmd;
+    }
 
     if (opts->u.cocoa.has_left_command_key && !opts->u.cocoa.left_command_key) {
         left_command_key_enabled = 0;
-- 
2.34.1


