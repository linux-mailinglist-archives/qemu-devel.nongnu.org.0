Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8E252BB96
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 15:48:06 +0200 (CEST)
Received: from localhost ([::1]:40920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrK21-0000Tk-2N
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 09:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrJyx-0006fo-O5
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:44:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrJyv-0005JP-SX
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:44:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652881493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/kejNFzG18VqORBLL9/j5f2zgjAG1Gj66AhwFRBu1o4=;
 b=DNd0WLYgI3xNEEy1lSG/fAvYx4VUmU/ShvGRBqj68u5riGXwOBKY8A31gsP/yuewTVpXxM
 LuXjNNNj3krdDYR0LWX3NgtBItJosXLLSiGS7jF4SbgK4czQBYoTz8WjotPYw8hNJdgkzi
 gkWZU13skyyMN9sHe//6NZDzLY6/I3g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-uuH6gdADM0-Qg5Lu07uO7g-1; Wed, 18 May 2022 09:44:51 -0400
X-MC-Unique: uuH6gdADM0-Qg5Lu07uO7g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 929AC2949BA3
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 13:44:51 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2CF540CF8EE;
 Wed, 18 May 2022 13:44:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 2/3] ui: Switch "-display sdl" to use the QAPI parser
Date: Wed, 18 May 2022 15:44:45 +0200
Message-Id: <20220518134446.211632-3-thuth@redhat.com>
In-Reply-To: <20220518134446.211632-1-thuth@redhat.com>
References: <20220518134446.211632-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
parameters since we didn't want to drag an interface we considered
somewhat flawed into the QAPI schema. Since the flaws are gone now,
it's time to QAPIfy.

This introduces the new "DisplaySDL" QAPI struct that is used to hold
the parameters that are unique to the SDL display. The only specific
parameter is currently "grab-mod" that is used to specify the required
modifier keys to escape from the mouse grabbing mode.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qapi/ui.json            | 27 +++++++++++++++-
 include/sysemu/sysemu.h |  2 --
 softmmu/globals.c       |  2 --
 softmmu/vl.c            | 70 +----------------------------------------
 ui/sdl2.c               | 10 ++++++
 5 files changed, 37 insertions(+), 74 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 11a827d10f..a244e26e0f 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1295,6 +1295,30 @@
       '*swap-opt-cmd': 'bool'
   } }
 
+##
+# @GrabMod:
+#
+# Set of modifier keys that need to be hold for shortcut key actions.
+#
+# Since: 7.1
+##
+{ 'enum'  : 'GrabMod',
+  'data'  : [ 'lctrl-lalt', 'lshift-lctrl-lalt', 'rctrl' ] }
+
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
+  'data'    : { '*grab-mod'   : 'GrabMod' } }
+
 ##
 # @DisplayType:
 #
@@ -1374,7 +1398,8 @@
       'curses': { 'type': 'DisplayCurses', 'if': 'CONFIG_CURSES' },
       'egl-headless': { 'type': 'DisplayEGLHeadless',
                         'if': { 'all': ['CONFIG_OPENGL', 'CONFIG_GBM'] } },
-      'dbus': { 'type': 'DisplayDBus', 'if': 'CONFIG_DBUS_DISPLAY' }
+      'dbus': { 'type': 'DisplayDBus', 'if': 'CONFIG_DBUS_DISPLAY' },
+      'sdl': { 'type': 'DisplaySDL', 'if': 'CONFIG_SDL' }
   }
 }
 
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index b4030acd74..812f66a31a 100644
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
 extern uint8_t *boot_splash_filedata;
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 916bc12e2b..527edbefdd 100644
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
 uint8_t *boot_splash_filedata;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 57ab9d5322..484e9d9921 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1056,75 +1056,7 @@ static void parse_display(const char *p)
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
index d3741f9b75..dc39b24a67 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -40,6 +40,8 @@ static struct sdl2_console *sdl2_console;
 
 static SDL_Surface *guest_sprite_surface;
 static int gui_grab; /* if true, all keyboard/mouse events are grabbed */
+static bool alt_grab;
+static bool ctrl_grab;
 
 static int gui_saved_grab;
 static int gui_fullscreen;
@@ -853,6 +855,14 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
 
     gui_fullscreen = o->has_full_screen && o->full_screen;
 
+    if (o->u.sdl.has_grab_mod) {
+        if (o->u.sdl.grab_mod == GRAB_MOD_LSHIFT_LCTRL_LALT) {
+            alt_grab = true;
+        } else if (o->u.sdl.grab_mod == GRAB_MOD_RCTRL) {
+            ctrl_grab = true;
+        }
+    }
+
     for (i = 0;; i++) {
         QemuConsole *con = qemu_console_lookup_by_index(i);
         if (!con) {
-- 
2.27.0


