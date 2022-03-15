Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A374D9BFD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:16:17 +0100 (CET)
Received: from localhost ([::1]:39728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU728-0007UW-7r
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:16:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6jT-0006Qv-EL
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:57:01 -0400
Received: from [2607:f8b0:4864:20::631] (port=39779
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6jM-0008PQ-Om
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:56:55 -0400
Received: by mail-pl1-x631.google.com with SMTP id d18so1041169plr.6
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vYFANfPw5nDDGgg96defaMHr7oYmGpXFM3N22eSSDec=;
 b=IFv4c2N+CR/59XMV/PnJT++cTRmXOsQba30oxFk7nE++LyGQ/3s/ymfPUoYv1VDdDA
 ujfY1Xyi/u9Ihy48jEW/nTsYuBL2fKeIyProDoBKqYAfop+AB2mZNnHrNL3sZKiDkWfV
 yoIf7DjHS658sH7P7AerXuQtK/vKgVUBV8cSl+3/H3b1FplVgBl8VJwW+mPuxu2oJLci
 9UINZ3gdc1DVewGxl03sANF0AVEWmza/2ZyJlGfPYPQ8rETvd9Xyit4CSKxgNF+ywaEc
 0oP/rkHHdiumzoJfmIc5/sGYwD9pMlFWG1xb/vhv+f1imLjoobeE/jeLexpnr2zDOeVT
 qkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vYFANfPw5nDDGgg96defaMHr7oYmGpXFM3N22eSSDec=;
 b=GWCgr4X8KLdUUizYWNqhmid7er7TB0n+2HoRbL904oPBhji/vzlf9HnQRmwDXPiI5w
 umtw5IDlNfLVxTIXyjyx1zMtRgbmpy6ZDVYv+4j8wOaPvnruMrmRr3CU083rbjKErknD
 GcX6D4ldck3Np3+v0EDC2D/51nzVH9cS2P3ze1kakCFG3QI/sm3Zhe+egHZj2xM8HorV
 Yx0mkUyGKvG+9Dt7PGNfi+/1+NlS3yMU2DgKxODFnZIUFfQMprGlTRWraIKUWhBk8L0p
 R1G/JmbDhPjY51gjb8UW01BPhSCrbY6ePOCpFhqyoYYwvJK3Tcz7uKYMRkWaTn7A9iVc
 4S3w==
X-Gm-Message-State: AOAM5306RFECwHYUlUSUuBisKP2B16zthIfXZna7U78v+V31XrfUWh2K
 QaTsjE8/Ufe48kV9Io95i3Ii3slrJQE=
X-Google-Smtp-Source: ABdhPJynvNRGngGvoed6IoIGM9adoxBtgeg0HQ3ybQbGrDRI1Zze2QSTJxbpxcAXHeuB4kVPDJc9vg==
X-Received: by 2002:a17:90b:224d:b0:1bf:73a5:ff7f with SMTP id
 hk13-20020a17090b224d00b001bf73a5ff7fmr4469924pjb.164.1647349011266; 
 Tue, 15 Mar 2022 05:56:51 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a17090a3f8b00b001bc299e0aefsm2991174pjc.56.2022.03.15.05.56.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 05:56:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/21] ui/cocoa: add option to swap Option and Command
Date: Tue, 15 Mar 2022 13:53:49 +0100
Message-Id: <20220315125350.82452-21-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
References: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x631.google.com
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Markus Armbruster <armbru@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
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
Reviewed-by: Will Cohen <wwcohen@gmail.com>
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
index 4395378bb8..58f2f76775 100644
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
index b1250b7408..cb6e7c41dc 100644
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
@@ -2068,6 +2094,9 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
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


