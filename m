Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A035FD5B2
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 09:44:51 +0200 (CEST)
Received: from localhost ([::1]:41416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiste-0002vN-Bi
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 03:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois6R-0005h0-J3
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois6N-0006vv-JK
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665644034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Uu2Xsk9Yp33EWnQ/CLL6TL/MCM7gFTiwhrEHEOEHqg=;
 b=JSTGtjMJIiskejKXgSPj8TsZjzQya+KfbAgn3uw4iWsS2KIBlEFpg9deyYKvPbHBTdF4eY
 88BsnpL0IafX/KA2AsqkqylTBNITt0qMsWqWT3p6OBdAer7gycGMxMOKjIgGRzQnIw2jbA
 Xy3bQbVlUNN9hD1JkOhkSCOS8vmHoYg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-I9B4PNs_NGuV6W_O0xjJ2A-1; Thu, 13 Oct 2022 02:53:48 -0400
X-MC-Unique: I9B4PNs_NGuV6W_O0xjJ2A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D4E31C0515F;
 Thu, 13 Oct 2022 06:53:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10AF02166BA3;
 Thu, 13 Oct 2022 06:53:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B6AEB1800D67; Thu, 13 Oct 2022 08:52:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Bryce Mills <brycemills@proton.me>
Subject: [PULL 24/26] gtk: Add show_menubar=on|off command line option.
Date: Thu, 13 Oct 2022 08:52:22 +0200
Message-Id: <20221013065224.1864145-25-kraxel@redhat.com>
In-Reply-To: <20221013065224.1864145-1-kraxel@redhat.com>
References: <20221013065224.1864145-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bryce Mills <brycemills@proton.me>

The patch adds "show_menubar" command line option for GTK UI similar to
"show_tabs". This option allows to hide menu bar initially, it still can
be toggled by shortcut and other shortcuts still work.

Signed-off-by: Bryce Mills <brycemills@proton.me>
Acked-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <NWO_zx1CT5Aj9vAXsRlqBppXd63gcKwL9V1qM1Meh36M_9tCw-EsCnfpvONXhHjmtKIUoSuCy9OO6cHS7M8b0oHBOCZG6f1jZ4Q2tqgI2Qo=@proton.me>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk.c        | 15 ++++++++++-----
 qapi/ui.json    |  5 ++++-
 qemu-options.hx |  3 +++
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 6fc2e2396393..92daaa6a6edb 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2171,7 +2171,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
     return group;
 }
 
-static GtkWidget *gd_create_menu_view(GtkDisplayState *s)
+static GtkWidget *gd_create_menu_view(GtkDisplayState *s, DisplayOptions *opts)
 {
     GSList *group = NULL;
     GtkWidget *view_menu;
@@ -2269,7 +2269,8 @@ static GtkWidget *gd_create_menu_view(GtkDisplayState *s)
     s->show_menubar_item = gtk_check_menu_item_new_with_mnemonic(
             _("Show Menubar"));
     gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(s->show_menubar_item),
-                                   TRUE);
+                                   !opts->u.gtk.has_show_menubar ||
+                                   opts->u.gtk.show_menubar);
     gtk_accel_group_connect(s->accel_group, GDK_KEY_m, HOTKEY_MODIFIERS, 0,
             g_cclosure_new_swap(G_CALLBACK(gd_accel_show_menubar), s, NULL));
     gtk_accel_label_set_accel(
@@ -2280,13 +2281,13 @@ static GtkWidget *gd_create_menu_view(GtkDisplayState *s)
     return view_menu;
 }
 
-static void gd_create_menus(GtkDisplayState *s)
+static void gd_create_menus(GtkDisplayState *s, DisplayOptions *opts)
 {
     GtkSettings *settings;
 
     s->accel_group = gtk_accel_group_new();
     s->machine_menu = gd_create_menu_machine(s);
-    s->view_menu = gd_create_menu_view(s);
+    s->view_menu = gd_create_menu_view(s, opts);
 
     s->machine_menu_item = gtk_menu_item_new_with_mnemonic(_("_Machine"));
     gtk_menu_item_set_submenu(GTK_MENU_ITEM(s->machine_menu_item),
@@ -2363,7 +2364,7 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
 
     gtk_window_set_icon_name(GTK_WINDOW(s->window), "qemu");
 
-    gd_create_menus(s);
+    gd_create_menus(s, opts);
 
     gd_connect_signals(s);
 
@@ -2378,6 +2379,10 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
     gtk_container_add(GTK_CONTAINER(s->window), s->vbox);
 
     gtk_widget_show_all(s->window);
+    if (opts->u.gtk.has_show_menubar &&
+        !opts->u.gtk.show_menubar) {
+        gtk_widget_hide(s->menu_bar);
+    }
 
     vc = gd_vc_find_current(s);
     gtk_widget_set_sensitive(s->view_menu, vc != NULL);
diff --git a/qapi/ui.json b/qapi/ui.json
index 286c5731d1c3..0abba3e930a4 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1199,13 +1199,16 @@
 #               interfaces (e.g. VGA and virtual console character devices)
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
 
 ##
 # @DisplayEGLHeadless:
diff --git a/qemu-options.hx b/qemu-options.hx
index 95b998a13b01..bb0979bef908 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1969,6 +1969,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #if defined(CONFIG_GTK)
     "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
     "            [,show-tabs=on|off][,show-cursor=on|off][,window-close=on|off]\n"
+    "            [,show-menubar=on|off]\n"
 #endif
 #if defined(CONFIG_VNC)
     "-display vnc=<display>[,<optargs>]\n"
@@ -2061,6 +2062,8 @@ SRST
 
         ``window-close=on|off`` : Allow to quit qemu with window close button
 
+        ``show-menubar=on|off`` : Display the main window menubar, defaults to "on"
+
     ``curses[,charset=<encoding>]``
         Display video output via curses. For graphics device models
         which support a text mode, QEMU can display this output using a
-- 
2.37.3


