Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3EB5232E9
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 14:18:56 +0200 (CEST)
Received: from localhost ([::1]:46456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nolIs-0006mQ-I0
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 08:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nolHb-0005ue-Ew
 for qemu-devel@nongnu.org; Wed, 11 May 2022 08:17:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nolHW-0007x6-UU
 for qemu-devel@nongnu.org; Wed, 11 May 2022 08:17:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652271449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zC4SKvaQ+JNsucFSvsRBHHyt6BsauOc6WrOG/MIBKj0=;
 b=KFUMPADCM92U2ofWZcW21VQ7uf3TcQNZxcbgTJzmEBhbzxRl/le4ySnKeb8MrECfFhDnkb
 CjKFkgoHmhnvLpP9tdOZ3ENadNAxtJCVljRXM75HGGY+FRQ22xQsliPRtHXamUqzXxHtzg
 3uzfiyBrj3lsHfjpIRQ5zvwDwD+IQHM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-KS3vFSnlOx-ASfFt30hOFA-1; Wed, 11 May 2022 08:17:27 -0400
X-MC-Unique: KS3vFSnlOx-ASfFt30hOFA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D4D91C01B28
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 12:17:27 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5B7B415F56;
 Wed, 11 May 2022 12:17:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, libvir-list@redhat.com
Subject: [PATCH] ui: Remove deprecated parameters of -display sdl and switch
 to QAPI parser
Date: Wed, 11 May 2022 14:17:25 +0200
Message-Id: <20220511121725.842448-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

The "-display sdl" option still used a hand-crafted parser for its
parameters since some of them used underscores which is forbidden
in QAPI. Now that they've been deprecated and the deprecation period
is over, we can remove the problematic parameters and switch to use
the QAPI parser instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst       |  16 -----
 docs/about/removed-features.rst |  17 +++++
 qapi/ui.json                    |  16 ++++-
 include/sysemu/sysemu.h         |   2 -
 softmmu/globals.c               |   2 -
 softmmu/vl.c                    | 109 +-------------------------------
 ui/sdl2.c                       |  13 ++++
 qemu-options.hx                 |  32 +---------
 8 files changed, 48 insertions(+), 159 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 896e5a97ab..ce7a5b97fc 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -109,22 +109,6 @@ other options have been processed.  This will either have no effect (if
 if they were not given.  The property is therefore useless and should not be
 specified.
 
-``-display sdl,window_close=...`` (since 6.1)
-'''''''''''''''''''''''''''''''''''''''''''''
-
-Use ``-display sdl,window-close=...`` instead (i.e. with a minus instead of
-an underscore between "window" and "close").
-
-``-alt-grab`` and ``-display sdl,alt_grab=on`` (since 6.2)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-Use ``-display sdl,grab-mod=lshift-lctrl-lalt`` instead.
-
-``-ctrl-grab`` and ``-display sdl,ctrl_grab=on`` (since 6.2)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-Use ``-display sdl,grab-mod=rctrl`` instead.
-
 ``-sdl`` (since 6.2)
 ''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 4a0b270296..51bfc844f6 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -355,6 +355,23 @@ The ``-writeconfig`` option was not able to serialize the entire contents
 of the QEMU command line.  It is thus considered a failed experiment
 and removed without a replacement.
 
+``-display sdl,window_close=...`` (removed in 7.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``-display sdl,window-close=...`` instead (i.e. with a minus instead of
+an underscore between "window" and "close").
+
+``-alt-grab`` and ``-display sdl,alt_grab=on`` (removed in 7.1)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``-display sdl,grab-mod=lshift-lctrl-lalt`` instead.
+
+``-ctrl-grab`` and ``-display sdl,ctrl_grab=on`` (removed in 7.1)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``-display sdl,grab-mod=rctrl`` instead.
+
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/qapi/ui.json b/qapi/ui.json
index 059302a5ef..7d5097808a 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1309,6 +1309,19 @@
       '*swap-opt-cmd': 'bool'
   } }
 
+##
+# @DisplaySDL:
+#
+# SDL2 display options.
+#
+# @grab-mod:  Modifier keys that should be pressed together
+#             with "G" to release the mouse grab.
+#
+# Since: 7.1
+##
+{ 'struct'  : 'DisplaySDL',
+  'data'    : { '*grab-mod'   : 'str' } }
+
 ##
 # @DisplayType:
 #
@@ -1391,7 +1404,8 @@
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
index 488cc4d09e..90a0a4d393 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1045,100 +1045,7 @@ static void parse_display(const char *p)
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
-            } else if (strstart(opts, ",alt_grab=", &nextopt)) {
-                opts = nextopt;
-                if (strstart(opts, "on", &nextopt)) {
-                    alt_grab = 1;
-                } else if (strstart(opts, "off", &nextopt)) {
-                    alt_grab = 0;
-                } else {
-                    goto invalid_sdl_args;
-                }
-                warn_report("alt_grab is deprecated, use grab-mod instead.");
-            } else if (strstart(opts, ",ctrl_grab=", &nextopt)) {
-                opts = nextopt;
-                if (strstart(opts, "on", &nextopt)) {
-                    ctrl_grab = 1;
-                } else if (strstart(opts, "off", &nextopt)) {
-                    ctrl_grab = 0;
-                } else {
-                    goto invalid_sdl_args;
-                }
-                warn_report("ctrl_grab is deprecated, use grab-mod instead.");
-            } else if (strstart(opts, ",window_close=", &nextopt) ||
-                       strstart(opts, ",window-close=", &nextopt)) {
-                if (strstart(opts, ",window_close=", NULL)) {
-                    warn_report("window_close with an underscore is deprecated,"
-                                " please use window-close instead.");
-                }
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
@@ -1943,10 +1850,6 @@ static void qemu_create_early_backends(void)
     const bool use_gtk = false;
 #endif
 
-    if ((alt_grab || ctrl_grab) && !use_sdl) {
-        error_report("-alt-grab and -ctrl-grab are only valid "
-                     "for SDL, ignoring option");
-    }
     if (dpy.has_window_close && !use_gtk && !use_sdl) {
         error_report("window-close is only valid for GTK and SDL, "
                      "ignoring option");
@@ -3302,16 +3205,6 @@ void qemu_init(int argc, char **argv, char **envp)
                 dpy.has_full_screen = true;
                 dpy.full_screen = true;
                 break;
-            case QEMU_OPTION_alt_grab:
-                alt_grab = 1;
-                warn_report("-alt-grab is deprecated, please use "
-                            "-display sdl,grab-mod=lshift-lctrl-lalt instead.");
-                break;
-            case QEMU_OPTION_ctrl_grab:
-                ctrl_grab = 1;
-                warn_report("-ctrl-grab is deprecated, please use "
-                            "-display sdl,grab-mod=rctrl instead.");
-                break;
             case QEMU_OPTION_sdl:
                 warn_report("-sdl is deprecated, use -display sdl instead.");
 #ifdef CONFIG_SDL
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
diff --git a/qemu-options.hx b/qemu-options.hx
index 796229c433..0fa873d088 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1903,8 +1903,8 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
     "-display spice-app[,gl=on|off]\n"
 #endif
 #if defined(CONFIG_SDL)
-    "-display sdl[,alt_grab=on|off][,ctrl_grab=on|off][,gl=on|core|es|off]\n"
-    "            [,grab-mod=<mod>][,show-cursor=on|off][,window-close=on|off]\n"
+    "-display sdl[,gl=on|core|es|off][,grab-mod=<mod>][,show-cursor=on|off]\n"
+    "            [,window-close=on|off]\n"
 #endif
 #if defined(CONFIG_GTK)
     "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
@@ -1977,12 +1977,6 @@ SRST
         the mouse grabbing in conjunction with the "g" key. ``<mods>`` can be
         either ``lshift-lctrl-lalt`` or ``rctrl``.
 
-        ``alt_grab=on|off`` : Use Control+Alt+Shift-g to toggle mouse grabbing.
-        This parameter is deprecated - use ``grab-mod`` instead.
-
-        ``ctrl_grab=on|off`` : Use Right-Control-g to toggle mouse grabbing.
-        This parameter is deprecated - use ``grab-mod`` instead.
-
         ``gl=on|off|core|es`` : Use OpenGL for displaying
 
         ``show-cursor=on|off`` :  Force showing the mouse cursor
@@ -2068,28 +2062,6 @@ SRST
     is displayed in graphical mode.
 ERST
 
-DEF("alt-grab", 0, QEMU_OPTION_alt_grab,
-    "-alt-grab       use Ctrl-Alt-Shift to grab mouse (instead of Ctrl-Alt)\n",
-    QEMU_ARCH_ALL)
-SRST
-``-alt-grab``
-    Use Ctrl-Alt-Shift to grab mouse (instead of Ctrl-Alt). Note that
-    this also affects the special keys (for fullscreen, monitor-mode
-    switching, etc). This option is deprecated - please use
-    ``-display sdl,grab-mod=lshift-lctrl-lalt`` instead.
-ERST
-
-DEF("ctrl-grab", 0, QEMU_OPTION_ctrl_grab,
-    "-ctrl-grab      use Right-Ctrl to grab mouse (instead of Ctrl-Alt)\n",
-    QEMU_ARCH_ALL)
-SRST
-``-ctrl-grab``
-    Use Right-Ctrl to grab mouse (instead of Ctrl-Alt). Note that this
-    also affects the special keys (for fullscreen, monitor-mode
-    switching, etc). This option is deprecated - please use
-    ``-display sdl,grab-mod=rctrl`` instead.
-ERST
-
 DEF("sdl", 0, QEMU_OPTION_sdl,
     "-sdl            shorthand for -display sdl\n", QEMU_ARCH_ALL)
 SRST
-- 
2.27.0


