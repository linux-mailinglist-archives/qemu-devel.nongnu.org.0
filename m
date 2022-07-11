Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E756A570E6D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 01:49:16 +0200 (CEST)
Received: from localhost ([::1]:51740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB39P-00058H-W8
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 19:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1oB37X-0002JF-M1
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 19:47:19 -0400
Received: from mga18.intel.com ([134.134.136.126]:53561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1oB37V-0003wO-AJ
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 19:47:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657583237; x=1689119237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rrvkFibwtSja6tUWtIKnzKcepxwB2SK4YYB003k9gbE=;
 b=dTYES8r+zJ2itI/liBsOjMuhOBPE2K9bOLEiIcpXW1Nhj0gmEEQ8+Qjf
 XOGbKGhV2ymi7TXEgdiPB1uuD7ADJakkHzTl+C0bUYciu6kR8oDEEvsZn
 noUhzeuEbGKZPGFSrK947n/0nQR0ttpaFnrNtY2CPjZrQotldXs+YIa7h
 015tdvf58suUixTKf/YwHa2hSLU+NHVKCrTbUScHN9J0PPsOh2+P+JNEI
 skTNXkwF+si2Jit6Sqjq4LFOEjd/9hweWgYVcbVjZ9NAXGfOXF+3ie/CB
 4/ofxMGMk0q238FBBlk+lOzsIxWj9SHSzblnT573JMSHtbtudoGDiB3vU g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="267836261"
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; d="scan'208";a="267836261"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 16:47:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; d="scan'208";a="569972998"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by orsmga006.jf.intel.com with ESMTP; 11 Jul 2022 16:47:13 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, berrange@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, f4bug@amsat.org, vivek.kasireddy@intel.com,
 Dongwon Kim <dongwon.kim@intel.com>
Subject: [PATCH v4 1/2] ui/gtk: detach VCs for additional guest displays
Date: Mon, 11 Jul 2022 16:39:58 -0700
Message-Id: <20220711233959.32219-2-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220711233959.32219-1-dongwon.kim@intel.com>
References: <20220711233959.32219-1-dongwon.kim@intel.com>
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
2.30.2


