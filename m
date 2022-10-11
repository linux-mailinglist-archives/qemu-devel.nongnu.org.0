Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 626B15FB45D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 16:14:06 +0200 (CEST)
Received: from localhost ([::1]:60520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiG18-00076V-Rj
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 10:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brycemills@proton.me>)
 id 1oiFmR-0002u3-7D
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 09:58:47 -0400
Received: from mail-4318.protonmail.ch ([185.70.43.18]:52441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brycemills@proton.me>)
 id 1oiFmN-0004J3-5G
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 09:58:46 -0400
Date: Tue, 11 Oct 2022 13:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1665496712; x=1665755912;
 bh=Bb2/0gspExYAumxIZyhLwXWHqumdjbTcyYZraR2lR4E=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID;
 b=EBbgQu7wCemGVXdi5pPHIxwLjrtqI3y8BkiqSDp8tc0SbY+5HCV2FuZUCB9U6enP/
 GifEltUyramWGFkC2WlhAJYpalsab9glIGzgGgoaVmqZ+hM81GQi8mdgmYB7mClD33
 ML1EPlKZypm2AlrqA+ju91CeRZ5V8Rfn2F/z6ExDA1qP4rvvKYOUALBr/yoYduK3ME
 VMISqED9/B/O/A8BAnNDPqodojjoY7hHmptG1/hVYAy8mbV2iJul+g8PbRlilgC6BK
 H/v7TnfsOe1kMDoR9M/DxpA6lTotFoynAP/Y4+EoQxoUytPjuK8YQOvxpXiD1mkvkJ
 QqOVEifxU1LjQ==
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
From: Bryce Mills <brycemills@proton.me>
Subject: [PATCH v2] gtk: Add show_menubar=on|off command line option.
Message-ID: <NWO_zx1CT5Aj9vAXsRlqBppXd63gcKwL9V1qM1Meh36M_9tCw-EsCnfpvONXhHjmtKIUoSuCy9OO6cHS7M8b0oHBOCZG6f1jZ4Q2tqgI2Qo=@proton.me>
Feedback-ID: 55837971:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.43.18; envelope-from=brycemills@proton.me;
 helo=mail-4318.protonmail.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch adds "show_menubar" command line option for GTK UI similar to
"show_tabs". This option allows to hide menu bar initially, it still can
be toggled by shortcut and other shortcuts still work.

Signed-off-by: Bryce Mills <brycemills@proton.me>
---
 qapi/ui.json    |  5 ++++-
 qemu-options.hx |  3 +++
 ui/gtk.c        | 15 ++++++++++-----
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 286c5731d1..0abba3e930 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1199,13 +1199,16 @@
 #               interfaces (e.g. VGA and virtual console character devices=
)
 #               by default.
 #               Since 7.1
+# @show-menubar: Display the main window menubar. Defaults to "on".
+#                Since 8.0
 #
 # Since: 2.12
 ##
 { 'struct'  : 'DisplayGTK',
   'data'    : { '*grab-on-hover' : 'bool',
                 '*zoom-to-fit'   : 'bool',
-                '*show-tabs'     : 'bool'  } }
+                '*show-tabs'     : 'bool',
+                '*show-menubar'  : 'bool'  } }
=20
 ##
 # @DisplayEGLHeadless:
diff --git a/qemu-options.hx b/qemu-options.hx
index 95b998a13b..bb0979bef9 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1969,6 +1969,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #if defined(CONFIG_GTK)
     "-display gtk[,full-screen=3Don|off][,gl=3Don|off][,grab-on-hover=3Don=
|off]\n"
     "            [,show-tabs=3Don|off][,show-cursor=3Don|off][,window-clos=
e=3Don|off]\n"
+    "            [,show-menubar=3Don|off]\n"
 #endif
 #if defined(CONFIG_VNC)
     "-display vnc=3D<display>[,<optargs>]\n"
@@ -2061,6 +2062,8 @@ SRST
=20
         ``window-close=3Don|off`` : Allow to quit qemu with window close b=
utton
=20
+        ``show-menubar=3Don|off`` : Display the main window menubar, defau=
lts to "on"
+
     ``curses[,charset=3D<encoding>]``
         Display video output via curses. For graphics device models
         which support a text mode, QEMU can display this output using a
diff --git a/ui/gtk.c b/ui/gtk.c
index 1467b8c7d7..0c54600592 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2167,7 +2167,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, Vir=
tualConsole *vc,
     return group;
 }
=20
-static GtkWidget *gd_create_menu_view(GtkDisplayState *s)
+static GtkWidget *gd_create_menu_view(GtkDisplayState *s, DisplayOptions *=
opts)
 {
     GSList *group =3D NULL;
     GtkWidget *view_menu;
@@ -2265,7 +2265,8 @@ static GtkWidget *gd_create_menu_view(GtkDisplayState=
 *s)
     s->show_menubar_item =3D gtk_check_menu_item_new_with_mnemonic(
             _("Show Menubar"));
     gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(s->show_menubar_ite=
m),
-                                   TRUE);
+                                   !opts->u.gtk.has_show_menubar ||
+                                   opts->u.gtk.show_menubar);
     gtk_accel_group_connect(s->accel_group, GDK_KEY_m, HOTKEY_MODIFIERS, 0=
,
             g_cclosure_new_swap(G_CALLBACK(gd_accel_show_menubar), s, NULL=
));
     gtk_accel_label_set_accel(
@@ -2276,13 +2277,13 @@ static GtkWidget *gd_create_menu_view(GtkDisplaySta=
te *s)
     return view_menu;
 }
=20
-static void gd_create_menus(GtkDisplayState *s)
+static void gd_create_menus(GtkDisplayState *s, DisplayOptions *opts)
 {
     GtkSettings *settings;
=20
     s->accel_group =3D gtk_accel_group_new();
     s->machine_menu =3D gd_create_menu_machine(s);
-    s->view_menu =3D gd_create_menu_view(s);
+    s->view_menu =3D gd_create_menu_view(s, opts);
=20
     s->machine_menu_item =3D gtk_menu_item_new_with_mnemonic(_("_Machine")=
);
     gtk_menu_item_set_submenu(GTK_MENU_ITEM(s->machine_menu_item),
@@ -2359,7 +2360,7 @@ static void gtk_display_init(DisplayState *ds, Displa=
yOptions *opts)
=20
     gtk_window_set_icon_name(GTK_WINDOW(s->window), "qemu");
=20
-    gd_create_menus(s);
+    gd_create_menus(s, opts);
=20
     gd_connect_signals(s);
=20
@@ -2374,6 +2375,10 @@ static void gtk_display_init(DisplayState *ds, Displ=
ayOptions *opts)
     gtk_container_add(GTK_CONTAINER(s->window), s->vbox);
=20
     gtk_widget_show_all(s->window);
+    if (opts->u.gtk.has_show_menubar &&
+        !opts->u.gtk.show_menubar) {
+        gtk_widget_hide(s->menu_bar);
+    }
=20
     vc =3D gd_vc_find_current(s);
     gtk_widget_set_sensitive(s->view_menu, vc !=3D NULL);
--=20
2.37.3



