Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF7854D547
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 01:31:12 +0200 (CEST)
Received: from localhost ([::1]:53820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1cTf-00010B-JA
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 19:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1o1cNn-0004ze-0k
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 19:25:07 -0400
Received: from mga06b.intel.com ([134.134.136.31]:58838 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1o1cNj-000106-04
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 19:25:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655335502; x=1686871502;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sQc1OOERT/+gVctcRnDKMHS6ZLtC+febrN9R1qvvP1I=;
 b=gfdT+2E6vBzPoz3/yKukwiIW1rFFPX1/E6dQCEaa+xzRO4Jfgf/O6BOa
 yXTgfncg98zqzBY4RJneqN1Ma2GZey6Dt7bZwVxgCmE4mR7UuFvrcQnE9
 zG7BTfWnC46fggdlIsemmSNfDbqfEXVeSjteT+lZuMMiEAOkY8HpGkV8i
 FFNNEUPfJD5W/JM/PwPN7MLSLr+/h4exbbzeisekLRd4zcIMc3JX94yFL
 PLE16ktX7w+fgG76AaJ8bAOFH1sTBCUZe0n5YCdEX6zsf6jw5M8QRfHeU
 ErB1S/4hANrTQvtw0cfNWTFy/h+uCdA7PJP7LAKGv/m0adWIHAo4pQIvn A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="340778246"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="340778246"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 16:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="589378013"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga007.fm.intel.com with ESMTP; 15 Jun 2022 16:25:00 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v2 1/2] ui/gtk: detach VCS for additional guest displays
Date: Wed, 15 Jun 2022 16:19:41 -0700
Message-Id: <20220615231942.29981-2-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220615231942.29981-1-dongwon.kim@intel.com>
References: <20220615231942.29981-1-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=dongwon.kim@intel.com; helo=mga06.intel.com
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

Detaching any addtional guest displays in case there are multiple
displays assigned to the guest OS (e.g. max_outputs=n) so that
all of them are visible upon lauching.

v2: - check if the type of VC is GD_VC_GFX before qemu_console_is_graphic
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


