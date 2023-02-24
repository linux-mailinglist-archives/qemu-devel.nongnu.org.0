Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1776A1B0F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 12:03:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVVq5-0006dF-AE; Fri, 24 Feb 2023 06:02:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVVq1-0006cT-Io
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 06:02:07 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVVpz-0000qM-3r
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 06:02:05 -0500
Received: by mail-wm1-x329.google.com with SMTP id j3so9175276wms.2
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 03:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mtI7oTW1zRiQGzcik8ROjOPNokpondLOeXtarHwD0c0=;
 b=xdce7Yd8ZFsI1npxNSMfl4d3z5YHQTwMBvZd3WrKeIv2clUzgFb8qeAmHcEZc723q6
 5E9hWSvYlraVS4pOBRh+6Ex70uLg2AiGglrfHvr6YQNc+CO7BXEwG+QUsBeWjTPV3VBD
 8KVTZl+5ppiSa538usE+9PeryGvFDIYgQUnv/TNO7h+/hpZwBeNWp2MSjsoY45fzzRB+
 S+TB8C5hIMorump5jTGvg726HuU35yrKIuuqgRnOgg5YEq2dm5RLhdhCCqWu9QAwrLjg
 FgCOy0pohBoRLpPgjYyG/6PfGX2XD3wFiugt5SQz+RzDYvFcA6MxAHv2OJoua0Z6H1Xi
 nc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mtI7oTW1zRiQGzcik8ROjOPNokpondLOeXtarHwD0c0=;
 b=H0kC8+jIm4bAwqHSjHAUu+Ko8kIeZTIh+hq7XqQjjwzH9sS0LzOC0I+zoungq4g4Dz
 k9LB84GIGg5Ert/VIRWFfeomgUHY17jkaESuc5bXuewMe4JpY5gmhXH5Bs6fKWslsPWm
 3Pg7EHuHwfBKOq/MbuN+o2lvUJaxV9VmY7DlSI8kGzGYkBgMr1tlx0XkxZd5fn5M8d9Z
 HTSh9ieiuxb92YxLTHBTHXHEpmB4LaupuUl1EiBUNQPI5OT/hRv+vLmgL63kWY20QmbB
 10BJ5JFyy6xK9ps6TVY9Ofu0Jy8b4Uvk8eq9zIU3Bq0LkvXuWP27tnT0BX6ayV0CR1A6
 cKCw==
X-Gm-Message-State: AO0yUKW8psp4SshEKJlleQJmGeom2FMzmW3TSlKxhKRqvA/TE70fmLZa
 eMTZtHxd9tcfqKniCyFflyw4caJlhd4FvB/b
X-Google-Smtp-Source: AK7set9JzkAsfB4Q7D+EG/vsIHrpYDW6GoShcWB4jZhWMhQeCME6ZoGJ/e45ZEAdeWQyQ6/EmemkeQ==
X-Received: by 2002:a05:600c:c8:b0:3d2:392e:905f with SMTP id
 u8-20020a05600c00c800b003d2392e905fmr11373170wmm.24.1677236521196; 
 Fri, 24 Feb 2023 03:02:01 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a05600c4f8100b003eb20d4d4a8sm1273121wmq.44.2023.02.24.03.02.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Feb 2023 03:02:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/2] ui/kbd-state: Rename QKbdModifier enum definitions
Date: Fri, 24 Feb 2023 12:01:52 +0100
Message-Id: <20230224110153.8559-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230224110153.8559-1-philmd@linaro.org>
References: <20230224110153.8559-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In order to QAPI'fy QKbdModifier in the next commit,
rename its definitions to a QAPI-ready format.

Mechanical change doing:

  $ sed -i -e s/QKBD_MOD_/Q_KBD_MODIFIER_/g $(git grep -l QKBD_MOD_)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/ui/kbd-state.h | 16 ++++++++--------
 ui/cocoa.m             |  2 +-
 ui/kbd-state.c         | 14 +++++++-------
 ui/keymaps.c           |  6 +++---
 ui/sdl2-input.c        |  2 +-
 ui/vnc.c               | 16 ++++++++--------
 6 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/include/ui/kbd-state.h b/include/ui/kbd-state.h
index eb9067dd53..14ee2c59e4 100644
--- a/include/ui/kbd-state.h
+++ b/include/ui/kbd-state.h
@@ -12,17 +12,17 @@
 typedef enum QKbdModifier QKbdModifier;
 
 enum QKbdModifier {
-    QKBD_MOD_NONE = 0,
+    Q_KBD_MODIFIER_NONE = 0,
 
-    QKBD_MOD_SHIFT,
-    QKBD_MOD_CTRL,
-    QKBD_MOD_ALT,
-    QKBD_MOD_ALTGR,
+    Q_KBD_MODIFIER_SHIFT,
+    Q_KBD_MODIFIER_CTRL,
+    Q_KBD_MODIFIER_ALT,
+    Q_KBD_MODIFIER_ALTGR,
 
-    QKBD_MOD_NUMLOCK,
-    QKBD_MOD_CAPSLOCK,
+    Q_KBD_MODIFIER_NUMLOCK,
+    Q_KBD_MODIFIER_CAPSLOCK,
 
-    QKBD_MOD__MAX
+    Q_KBD_MODIFIER__MAX
 };
 
 typedef struct QKbdState QKbdState;
diff --git a/ui/cocoa.m b/ui/cocoa.m
index e915c344a8..2c12fc58ea 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -840,7 +840,7 @@ - (bool) handleEventLocked:(NSEvent *)event
      *   this implementation usable enough.
      */
     if (!!(modifiers & NSEventModifierFlagCapsLock) !=
-        qkbd_state_modifier_get(kbd, QKBD_MOD_CAPSLOCK)) {
+        qkbd_state_modifier_get(kbd, Q_KBD_MODIFIER_CAPSLOCK)) {
         qkbd_state_key_event(kbd, Q_KEY_CODE_CAPS_LOCK, true);
         qkbd_state_key_event(kbd, Q_KEY_CODE_CAPS_LOCK, false);
     }
diff --git a/ui/kbd-state.c b/ui/kbd-state.c
index 62d42a7a22..cc53b5e135 100644
--- a/ui/kbd-state.c
+++ b/ui/kbd-state.c
@@ -13,7 +13,7 @@ struct QKbdState {
     QemuConsole *con;
     int key_delay_ms;
     DECLARE_BITMAP(keys, Q_KEY_CODE__MAX);
-    DECLARE_BITMAP(mods, QKBD_MOD__MAX);
+    DECLARE_BITMAP(mods, Q_KBD_MODIFIER__MAX);
 };
 
 static void qkbd_state_modifier_update(QKbdState *kbd,
@@ -67,29 +67,29 @@ void qkbd_state_key_event(QKbdState *kbd, QKeyCode qcode, bool down)
     case Q_KEY_CODE_SHIFT:
     case Q_KEY_CODE_SHIFT_R:
         qkbd_state_modifier_update(kbd, Q_KEY_CODE_SHIFT, Q_KEY_CODE_SHIFT_R,
-                                   QKBD_MOD_SHIFT);
+                                   Q_KBD_MODIFIER_SHIFT);
         break;
     case Q_KEY_CODE_CTRL:
     case Q_KEY_CODE_CTRL_R:
         qkbd_state_modifier_update(kbd, Q_KEY_CODE_CTRL, Q_KEY_CODE_CTRL_R,
-                                   QKBD_MOD_CTRL);
+                                   Q_KBD_MODIFIER_CTRL);
         break;
     case Q_KEY_CODE_ALT:
         qkbd_state_modifier_update(kbd, Q_KEY_CODE_ALT, Q_KEY_CODE_ALT,
-                                   QKBD_MOD_ALT);
+                                   Q_KBD_MODIFIER_ALT);
         break;
     case Q_KEY_CODE_ALT_R:
         qkbd_state_modifier_update(kbd, Q_KEY_CODE_ALT_R, Q_KEY_CODE_ALT_R,
-                                   QKBD_MOD_ALTGR);
+                                   Q_KBD_MODIFIER_ALTGR);
         break;
     case Q_KEY_CODE_CAPS_LOCK:
         if (down) {
-            change_bit(QKBD_MOD_CAPSLOCK, kbd->mods);
+            change_bit(Q_KBD_MODIFIER_CAPSLOCK, kbd->mods);
         }
         break;
     case Q_KEY_CODE_NUM_LOCK:
         if (down) {
-            change_bit(QKBD_MOD_NUMLOCK, kbd->mods);
+            change_bit(Q_KBD_MODIFIER_NUMLOCK, kbd->mods);
         }
         break;
     default:
diff --git a/ui/keymaps.c b/ui/keymaps.c
index 6ceaa97085..c8b99eaf4a 100644
--- a/ui/keymaps.c
+++ b/ui/keymaps.c
@@ -222,13 +222,13 @@ int keysym2scancode(kbd_layout_t *k, int keysym,
          * interface modifier state.  If so, prefer that one.
          */
         mods = 0;
-        if (kbd && qkbd_state_modifier_get(kbd, QKBD_MOD_SHIFT)) {
+        if (kbd && qkbd_state_modifier_get(kbd, Q_KBD_MODIFIER_SHIFT)) {
             mods |= SCANCODE_SHIFT;
         }
-        if (kbd && qkbd_state_modifier_get(kbd, QKBD_MOD_ALTGR)) {
+        if (kbd && qkbd_state_modifier_get(kbd, Q_KBD_MODIFIER_ALTGR)) {
             mods |= SCANCODE_ALTGR;
         }
-        if (kbd && qkbd_state_modifier_get(kbd, QKBD_MOD_CTRL)) {
+        if (kbd && qkbd_state_modifier_get(kbd, Q_KBD_MODIFIER_CTRL)) {
             mods |= SCANCODE_CTRL;
         }
 
diff --git a/ui/sdl2-input.c b/ui/sdl2-input.c
index f068382209..24c920e3af 100644
--- a/ui/sdl2-input.c
+++ b/ui/sdl2-input.c
@@ -44,7 +44,7 @@ void sdl2_process_key(struct sdl2_console *scon,
     qkbd_state_key_event(scon->kbd, qcode, ev->type == SDL_KEYDOWN);
 
     if (!qemu_console_is_graphic(con)) {
-        bool ctrl = qkbd_state_modifier_get(scon->kbd, QKBD_MOD_CTRL);
+        bool ctrl = qkbd_state_modifier_get(scon->kbd, Q_KBD_MODIFIER_CTRL);
         if (ev->type == SDL_KEYDOWN) {
             switch (qcode) {
             case Q_KEY_CODE_RET:
diff --git a/ui/vnc.c b/ui/vnc.c
index d9eacad759..a10d0b7b20 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -1877,8 +1877,8 @@ static void do_key_event(VncState *vs, int down, int keycode, int sym)
     switch (qcode) {
     case Q_KEY_CODE_1 ... Q_KEY_CODE_9: /* '1' to '9' keys */
         if (vs->vd->dcl.con == NULL && down &&
-            qkbd_state_modifier_get(vs->vd->kbd, QKBD_MOD_CTRL) &&
-            qkbd_state_modifier_get(vs->vd->kbd, QKBD_MOD_ALT)) {
+            qkbd_state_modifier_get(vs->vd->kbd, Q_KBD_MODIFIER_CTRL) &&
+            qkbd_state_modifier_get(vs->vd->kbd, Q_KBD_MODIFIER_ALT)) {
             /* Reset the modifiers sent to the current console */
             qkbd_state_lift_all_keys(vs->vd->kbd);
             console_select(qcode - Q_KEY_CODE_1);
@@ -1899,12 +1899,12 @@ static void do_key_event(VncState *vs, int down, int keycode, int sym)
            toggles numlock away from the VNC window.
         */
         if (keysym_is_numlock(vs->vd->kbd_layout, sym & 0xFFFF)) {
-            if (!qkbd_state_modifier_get(vs->vd->kbd, QKBD_MOD_NUMLOCK)) {
+            if (!qkbd_state_modifier_get(vs->vd->kbd, Q_KBD_MODIFIER_NUMLOCK)) {
                 trace_vnc_key_sync_numlock(true);
                 press_key(vs, Q_KEY_CODE_NUM_LOCK);
             }
         } else {
-            if (qkbd_state_modifier_get(vs->vd->kbd, QKBD_MOD_NUMLOCK)) {
+            if (qkbd_state_modifier_get(vs->vd->kbd, Q_KBD_MODIFIER_NUMLOCK)) {
                 trace_vnc_key_sync_numlock(false);
                 press_key(vs, Q_KEY_CODE_NUM_LOCK);
             }
@@ -1919,8 +1919,8 @@ static void do_key_event(VncState *vs, int down, int keycode, int sym)
            toggles capslock away from the VNC window.
         */
         int uppercase = !!(sym >= 'A' && sym <= 'Z');
-        bool shift = qkbd_state_modifier_get(vs->vd->kbd, QKBD_MOD_SHIFT);
-        bool capslock = qkbd_state_modifier_get(vs->vd->kbd, QKBD_MOD_CAPSLOCK);
+        bool shift = qkbd_state_modifier_get(vs->vd->kbd, Q_KBD_MODIFIER_SHIFT);
+        bool capslock = qkbd_state_modifier_get(vs->vd->kbd, Q_KBD_MODIFIER_CAPSLOCK);
         if (capslock) {
             if (uppercase == shift) {
                 trace_vnc_key_sync_capslock(false);
@@ -1936,8 +1936,8 @@ static void do_key_event(VncState *vs, int down, int keycode, int sym)
 
     qkbd_state_key_event(vs->vd->kbd, qcode, down);
     if (!qemu_console_is_graphic(NULL)) {
-        bool numlock = qkbd_state_modifier_get(vs->vd->kbd, QKBD_MOD_NUMLOCK);
-        bool control = qkbd_state_modifier_get(vs->vd->kbd, QKBD_MOD_CTRL);
+        bool numlock = qkbd_state_modifier_get(vs->vd->kbd, Q_KBD_MODIFIER_NUMLOCK);
+        bool control = qkbd_state_modifier_get(vs->vd->kbd, Q_KBD_MODIFIER_CTRL);
         /* QEMU console emulation */
         if (down) {
             switch (keycode) {
-- 
2.38.1


