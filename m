Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEF2560E69
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 02:59:07 +0200 (CEST)
Received: from localhost ([::1]:43546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6iWQ-0003G8-QX
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 20:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1o6iUt-0001NU-LX
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 20:57:31 -0400
Received: from mga17.intel.com ([192.55.52.151]:14891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1o6iUr-0005gL-Qx
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 20:57:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656550649; x=1688086649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=75CxAaiBQkvxr8y3tvdcFyTIBVBM+f9lX6UAdIlo1wY=;
 b=NV7OvcrpQM+mBcldonOo93W88LtnG6QGXXkLL6rgdpB/MWhWoeVSw4hz
 Up8JvBmUwc8MFr5gMOa1MzYiZ9kFtUFsqQd2YyKGj6lx8N/AOICJwius9
 IMnsbcbh3n4tYJhtsoBnhqvgzZpipt480Cx85dZQwy2HX6i+SIDsR+DS1
 nPjkgzam0BqFYb/f3C1A2KFuXIkhDE+WYd6c2VzeWuay2LaW+q/PTixUo
 0rmo3T81hIYkeEw76KJPbJQKw+B3rcVI+tQZo9b1ulaggo3+GUntfPAn8
 rGeGfYhTLJ91viqxfYptwnNnZh8VYZ710p1s6c7MQ6zATg/ikI35S6r26 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="262611180"
X-IronPort-AV: E=Sophos;i="5.92,232,1650956400"; d="scan'208";a="262611180"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 17:57:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,232,1650956400"; d="scan'208";a="693828119"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2022 17:57:27 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v3 1/3] ui/gtk: detach VCs for additional guest displays
Date: Wed, 29 Jun 2022 17:51:40 -0700
Message-Id: <20220630005141.16680-2-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220630005141.16680-1-dongwon.kim@intel.com>
References: <20220630005141.16680-1-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=dongwon.kim@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Detaching any addtional guest displays in case multiple displays are
assigned to the guest OS (e.g. max_outputs=n) so that all of them are
visible upon lauching.

v2: - making sure type of VC is GD_VC_GFX before qemu_console_is_graphic
      (Gerd Hoffman)
    - vc[0] is always primary guest display so we won't need n_gfx_vcs
      (Gerd Hoffmann)
    - making sure detached window's size same as original surface size
      (Daniel P. Berrangé)

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 ui/gtk.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 2a791dd2aa..e6878c3209 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1361,6 +1361,11 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
 
         g_signal_connect(vc->window, "delete-event",
                          G_CALLBACK(gd_tab_window_close), vc);
+
+        gtk_window_set_default_size(GTK_WINDOW(vc->window),
+                                    surface_width(vc->gfx.ds),
+                                    surface_height(vc->gfx.ds));
+
         gtk_widget_show_all(vc->window);
 
         if (qemu_console_is_graphic(vc->gfx.dcl.con)) {
@@ -2311,6 +2316,7 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
     GtkDisplayState *s = g_malloc0(sizeof(*s));
     GdkDisplay *window_display;
     GtkIconTheme *theme;
+    int i;
     char *dir;
 
     if (!gtkinit) {
@@ -2381,7 +2387,12 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
     gtk_widget_set_sensitive(s->copy_item,
                              vc && vc->type == GD_VC_VTE);
 #endif
-
+    for (i = 1; i < s->nb_vcs; i++) {
+        if (vc->type == GD_VC_GFX &&
+            qemu_console_is_graphic(s->vc[i].gfx.dcl.con)) {
+            gtk_menu_item_activate(GTK_MENU_ITEM(s->untabify_item));
+        }
+    }
     if (opts->has_full_screen &&
         opts->full_screen) {
         gtk_menu_item_activate(GTK_MENU_ITEM(s->full_screen_item));
-- 
2.30.2


