Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EBA60E8E6
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:20:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onlt9-0005Qt-24; Wed, 26 Oct 2022 15:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1onlsv-00059C-0d
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:16:17 -0400
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1onlss-0001o5-Ex
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666811774; x=1698347774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vG0/Umnus4oxZeDD5SL4LVNoHhqp3Ugt/2pp9G9mp68=;
 b=KZzz76IK/vj+VyDXlFN2TWZMQI5bF0wmKk1drqmeDY7B2TNr0/9CnGNN
 hMmbQg01hnhlElKaiqkImMRlP+6nNdKKPCCFKtEmGa7b2ipNtcYkoFPE9
 4Z0zx0rMcKnYkkaul67RLBWWxAStTGqkvTMvLtbUhSoZ+/IZ5jAVzzAw2
 7cIVj0dMzK6W+8X+ChTMbOiGMBma97VIhBGeLYfmSlW/5eI47si9djtJ9
 vppCs65I8PdC1zoH24lT03+UK3g73NUwyHl0TllmTOo3hOrNI1EoFsCVM
 Y1DI/AvhWyF8ycCbNizLaPf5BxmeiLEJqzSbGUZc6yL5Y+aMdSRh6KXym g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="306769446"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="306769446"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 12:16:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="610080569"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="610080569"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by orsmga006.jf.intel.com with ESMTP; 26 Oct 2022 12:16:10 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, berrange@redhat.com, armbru@redhat.com, f4bug@amsat.org,
 marcandre.lureau@redhat.com, thuth@redhat.com, vivek.kasireddy@intel.com,
 Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC PATCH 1/3] ui/gtk: skip drawing guest scanout when associated VC
 is invisible
Date: Wed, 26 Oct 2022 12:04:19 -0700
Message-Id: <20221026190421.16922-2-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221026190421.16922-1-dongwon.kim@intel.com>
References: <20221026190421.16922-1-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=dongwon.kim@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

A new flag "visible" that shows visibility status of the gfx console.
The polarity of the flag determines whether the drawing surface should
continuously updated upon scanout flush. The flag is set to 'true' as far as
it is in visible state  but set to 'false' if its tab is inactivated or
untabified window is closed. If set to 'false', QEMU will stop scheduling
render events until it is visible again.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 include/ui/gtk.h |  1 +
 ui/gtk-egl.c     |  8 ++++++++
 ui/gtk-gl-area.c |  8 ++++++++
 ui/gtk.c         | 11 ++++++++++-
 4 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index ae0f53740d..e7c4726aad 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -57,6 +57,7 @@ typedef struct VirtualGfxConsole {
     bool y0_top;
     bool scanout_mode;
     bool has_dmabuf;
+    bool visible;
 #endif
 } VirtualGfxConsole;
 
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 35f917ceb1..a5944f7095 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -247,6 +247,10 @@ void gd_egl_scanout_dmabuf(DisplayChangeListener *dcl,
 #ifdef CONFIG_GBM
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
+    if (!vc->gfx.visible) {
+        return;
+    }
+
     eglMakeCurrent(qemu_egl_display, vc->gfx.esurface,
                    vc->gfx.esurface, vc->gfx.ectx);
 
@@ -341,6 +345,10 @@ void gd_egl_flush(DisplayChangeListener *dcl,
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
     GtkWidget *area = vc->gfx.drawing_area;
 
+    if (!vc->gfx.visible) {
+        return;
+    }
+
     if (vc->gfx.guest_fb.dmabuf) {
         graphic_hw_gl_block(vc->gfx.dcl.con, true);
         vc->gfx.guest_fb.dmabuf->draw_submitted = true;
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 682638a197..14390ac9a9 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -278,6 +278,10 @@ void gd_gl_area_scanout_flush(DisplayChangeListener *dcl,
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
+    if (!vc->gfx.visible) {
+        return;
+    }
+
     if (vc->gfx.guest_fb.dmabuf) {
         graphic_hw_gl_block(vc->gfx.dcl.con, true);
         vc->gfx.guest_fb.dmabuf->draw_submitted = true;
@@ -291,6 +295,10 @@ void gd_gl_area_scanout_dmabuf(DisplayChangeListener *dcl,
 #ifdef CONFIG_GBM
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
+    if (!vc->gfx.visible) {
+        return;
+    }
+
     gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
     egl_dmabuf_import_texture(dmabuf);
     if (!dmabuf->texture) {
diff --git a/ui/gtk.c b/ui/gtk.c
index 92daaa6a6e..a1fb42f34d 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1268,15 +1268,20 @@ static void gd_menu_quit(GtkMenuItem *item, void *opaque)
 static void gd_menu_switch_vc(GtkMenuItem *item, void *opaque)
 {
     GtkDisplayState *s = opaque;
-    VirtualConsole *vc = gd_vc_find_by_menu(s);
+    VirtualConsole *vc;
     GtkNotebook *nb = GTK_NOTEBOOK(s->notebook);
     gint page;
 
+    vc = gd_vc_find_current(s);
+    vc->gfx.visible = false;
+
+    vc = gd_vc_find_by_menu(s);
     gtk_release_modifiers(s);
     if (vc) {
         page = gtk_notebook_page_num(nb, vc->tab_item);
         gtk_notebook_set_current_page(nb, page);
         gtk_widget_grab_focus(vc->focus);
+        vc->gfx.visible = true;
     }
 }
 
@@ -1306,6 +1311,7 @@ static gboolean gd_tab_window_close(GtkWidget *widget, GdkEvent *event,
     VirtualConsole *vc = opaque;
     GtkDisplayState *s = vc->s;
 
+    vc->gfx.visible = false;
     gtk_widget_set_sensitive(vc->menu_item, true);
     gd_widget_reparent(vc->window, s->notebook, vc->tab_item);
     gtk_notebook_set_tab_label_text(GTK_NOTEBOOK(s->notebook),
@@ -1379,6 +1385,7 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
         gd_update_geometry_hints(vc);
         gd_update_caption(s);
     }
+    vc->gfx.visible = true;
 }
 
 static void gd_menu_show_menubar(GtkMenuItem *item, void *opaque)
@@ -2404,6 +2411,8 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
         gtk_menu_item_activate(GTK_MENU_ITEM(s->show_tabs_item));
     }
     gd_clipboard_init(s);
+
+    vc->gfx.visible = true;
 }
 
 static void early_gtk_display_init(DisplayOptions *opts)
-- 
2.30.2


