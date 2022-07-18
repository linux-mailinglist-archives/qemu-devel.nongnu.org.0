Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D32C0578E62
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 01:42:02 +0200 (CEST)
Received: from localhost ([::1]:57804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDaNF-0001uZ-MK
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 19:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1oDaIm-0006C6-9T
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 19:37:24 -0400
Received: from mga18.intel.com ([134.134.136.126]:53813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1oDaIk-0001fw-KZ
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 19:37:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658187442; x=1689723442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=taOm4XkS4pQSfKVaYNoqzywdjUqHC+Gljodo5y7laSU=;
 b=V06cR8PFTNTBGr34U8gD3/Fxl+2Iu1L/BbV8OnnoyLAb9wL3Tlc6W4vb
 uOePccUJALgpPuqXNackPaE/2C35bOWC9eDNnpiOl0tB2oS1oui94U2T4
 ywZ6bDDj5rKp5zTy8YnXoax1gySnpt6LZEmKr2ihEds38PoJ3FfVNjPnC
 MSQsMemi61wLBp9+9VVkyu9D/eVYRgNnJISEuceD5QSsgCclU+gqQtycV
 qyR3XNjI8YoxgWKO/SDmJkbaWjyI+02Auh7NVx5zZCIbBdOup3plwW46m
 eqe0LMRnejvmt/VeONzJRdzOqM7MIwikwDcteuNwHPJ6F0adgz9PVPtyd Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="269369084"
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="269369084"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 16:37:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="739652096"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2022 16:37:10 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, berrange@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, f4bug@amsat.org, vivek.kasireddy@intel.com,
 Dongwon Kim <dongwon.kim@intel.com>
Subject: [PATCH v5 1/2] ui/gtk: detach VCs for additional guest displays
Date: Mon, 18 Jul 2022 16:30:08 -0700
Message-Id: <20220718233009.18780-2-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220718233009.18780-1-dongwon.kim@intel.com>
References: <20220718233009.18780-1-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=dongwon.kim@intel.com; helo=mga18.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.20.1


