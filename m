Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DA1523C19
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 19:58:38 +0200 (CEST)
Received: from localhost ([::1]:36248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noqbd-0002Im-8K
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 13:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noqVH-0002Jw-26
 for qemu-devel@nongnu.org; Wed, 11 May 2022 13:52:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noqVD-0004fp-QB
 for qemu-devel@nongnu.org; Wed, 11 May 2022 13:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652291517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7vHNTpZp+aJW+NFWmBiJyOFUdNmlx3lbxDvIdtsf2AA=;
 b=GD4FyNaBXRo1KRpoVR3nT8Bjs9NEl93etGimqE1AC7py0KkXBpDQU9yqM/LkUFrwodTMsD
 X0pVV8NFhV52pYBCUYDYQ6+eXgrCDUpF8hFJ+JwVeUeAPbwS0txTJ+AiDo3lTMAH8DiCJl
 SlCy/cydxNEphf9vYhlyQtMq32BMcdY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-3Wft9hYpMlyhf7UlV5Rp9Q-1; Wed, 11 May 2022 13:51:56 -0400
X-MC-Unique: 3Wft9hYpMlyhf7UlV5Rp9Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0471386B8B2
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 17:51:56 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71F9340CF8E4;
 Wed, 11 May 2022 17:51:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, libvir-list@redhat.com
Subject: [PATCH 2/3] ui: Switch "-display sdl" to use the QAPI parser
Date: Wed, 11 May 2022 19:51:46 +0200
Message-Id: <20220511175147.917707-3-thuth@redhat.com>
In-Reply-To: <20220511175147.917707-1-thuth@redhat.com>
References: <20220511175147.917707-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "-display sdl" option still uses a hand-crafted parser for its
parameters since some of them used underscores which is forbidden
in QAPI. Now that the problematic parameters have been removed, we can
switch to use the QAPI parser instead.

This introduces the new "DisplaySDL" QAPI struct that is used to hold
the parameters that are unique to the SDL display. The only specific
parameter is currently "grab-mod" which is modeled as a string, so that
it could be extended for other arbitrary modifiers later more easily.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qapi/ui.json            | 17 +++++++++-
 include/sysemu/sysemu.h |  2 --
 softmmu/globals.c       |  2 --
 softmmu/vl.c            | 70 +----------------------------------------
 ui/sdl2.c               | 13 ++++++++
 5 files changed, 30 insertions(+), 74 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 059302a5ef..511ade44f2 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1309,6 +1309,20 @@
       '*swap-opt-cmd': 'bool'
   } }
 
+##
+# @DisplaySDL:
+#
+# SDL2 display options.
+#
+# @grab-mod:  String with modifier keys that should be pressed together with
+#             the "G" key to release the mouse grab. Only "lshift-lctrl-lalt"
+#             and "rctrl" are currently supported.
+#
+# Since: 7.1
+##
+{ 'struct'  : 'DisplaySDL',
+  'data'    : { '*grab-mod'   : 'str' } }
+
 ##
 # @DisplayType:
 #
@@ -1391,7 +1405,8 @@
       'curses': { 'type': 'DisplayCurses', 'if': 'CONFIG_CURSES' },
       'egl-headless': { 'type': 'DisplayEGLHeadless',
                         'if': { 'all': ['CONFIG_OPENGL', 'CONFIG_GBM'] } },
-      'dbus': { 'type': 'DisplayDBus', 'if': 'CONFIG_DBUS_DISPLAY' }
+      'dbus': { 'type': 'DisplayDBus', 'if': 'CONFIG_DBUS_DISPLAY' },
+      'sdl': { 'type': 'DisplaySDL', 'if': 'CONFIG_SDL' }
   }
 }
 
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 360a408edf..7cca797450 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -42,8 +42,6 @@ extern int graphic_depth;
 extern int display_opengl;
 extern const char *keyboard_layout;
 extern int win2k_install_hack;
-extern int alt_grab;
-extern int ctrl_grab;
 extern int graphic_rotate;
 extern int old_param;
 extern int boot_menu;
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 98b64e0492..12611c2a7a 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -50,8 +50,6 @@ QEMUOptionRom option_rom[MAX_OPTION_ROMS];
 int nb_option_roms;
 int old_param;
 const char *qemu_name;
-int alt_grab;
-int ctrl_grab;
 unsigned int nb_prom_envs;
 const char *prom_envs[MAX_PROM_ENVS];
 int boot_menu;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index fdf797270c..90a0a4d393 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1045,75 +1045,7 @@ static void parse_display(const char *p)
         exit(0);
     }
 
-    if (strstart(p, "sdl", &opts)) {
-        /*
-         * sdl DisplayType needs hand-crafted parser instead of
-         * parse_display_qapi() due to some options not in
-         * DisplayOptions, specifically:
-         *   - ctrl_grab + alt_grab
-         *     They can't be moved into the QAPI since they use underscores,
-         *     thus they will get replaced by "grab-mod" in the long term
-         */
-#if defined(CONFIG_SDL)
-        dpy.type = DISPLAY_TYPE_SDL;
-        while (*opts) {
-            const char *nextopt;
-
-            if (strstart(opts, ",grab-mod=", &nextopt)) {
-                opts = nextopt;
-                if (strstart(opts, "lshift-lctrl-lalt", &nextopt)) {
-                    alt_grab = 1;
-                } else if (strstart(opts, "rctrl", &nextopt)) {
-                    ctrl_grab = 1;
-                } else {
-                    goto invalid_sdl_args;
-                }
-            } else if (strstart(opts, ",window-close=", &nextopt)) {
-                opts = nextopt;
-                dpy.has_window_close = true;
-                if (strstart(opts, "on", &nextopt)) {
-                    dpy.window_close = true;
-                } else if (strstart(opts, "off", &nextopt)) {
-                    dpy.window_close = false;
-                } else {
-                    goto invalid_sdl_args;
-                }
-            } else if (strstart(opts, ",show-cursor=", &nextopt)) {
-                opts = nextopt;
-                dpy.has_show_cursor = true;
-                if (strstart(opts, "on", &nextopt)) {
-                    dpy.show_cursor = true;
-                } else if (strstart(opts, "off", &nextopt)) {
-                    dpy.show_cursor = false;
-                } else {
-                    goto invalid_sdl_args;
-                }
-            } else if (strstart(opts, ",gl=", &nextopt)) {
-                opts = nextopt;
-                dpy.has_gl = true;
-                if (strstart(opts, "on", &nextopt)) {
-                    dpy.gl = DISPLAYGL_MODE_ON;
-                } else if (strstart(opts, "core", &nextopt)) {
-                    dpy.gl = DISPLAYGL_MODE_CORE;
-                } else if (strstart(opts, "es", &nextopt)) {
-                    dpy.gl = DISPLAYGL_MODE_ES;
-                } else if (strstart(opts, "off", &nextopt)) {
-                    dpy.gl = DISPLAYGL_MODE_OFF;
-                } else {
-                    goto invalid_sdl_args;
-                }
-            } else {
-            invalid_sdl_args:
-                error_report("invalid SDL option string");
-                exit(1);
-            }
-            opts = nextopt;
-        }
-#else
-        error_report("SDL display supported is not available in this binary");
-        exit(1);
-#endif
-    } else if (strstart(p, "vnc", &opts)) {
+    if (strstart(p, "vnc", &opts)) {
         /*
          * vnc isn't a (local) DisplayType but a protocol for remote
          * display access.
diff --git a/ui/sdl2.c b/ui/sdl2.c
index d3741f9b75..18c63e1fc9 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -40,6 +40,8 @@ static struct sdl2_console *sdl2_console;
 
 static SDL_Surface *guest_sprite_surface;
 static int gui_grab; /* if true, all keyboard/mouse events are grabbed */
+static bool alt_grab;
+static bool ctrl_grab;
 
 static int gui_saved_grab;
 static int gui_fullscreen;
@@ -853,6 +855,17 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
 
     gui_fullscreen = o->has_full_screen && o->full_screen;
 
+    if (o->u.sdl.has_grab_mod) {
+        if (g_str_equal(o->u.sdl.grab_mod, "lshift-lctrl-lalt")) {
+            alt_grab = true;
+        } else if (g_str_equal(o->u.sdl.grab_mod, "rctrl")) {
+            ctrl_grab = true;
+        } else {
+            error_report("Unsupported grab-mod: %s", o->u.sdl.grab_mod);
+            exit(1);
+        }
+    }
+
     for (i = 0;; i++) {
         QemuConsole *con = qemu_console_lookup_by_index(i);
         if (!con) {
-- 
2.27.0


