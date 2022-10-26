Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0849F60E8F5
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:25:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onltD-0005Su-Jf; Wed, 26 Oct 2022 15:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1onlsy-00059w-QL
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:16:24 -0400
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1onlsv-0001o2-JD
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666811777; x=1698347777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DRauN6rnLmMthJgj2sEcAPWQLRjyDdd1lWVuhQCwvVI=;
 b=ahaO/wrblLRnGTNLLziXEN/CdjnmuOVYjkP2q+5k+vvDRYIRvi98jfkn
 MZq1tEQsLb2b8oFdLboVFg5Q7ZD+BOQrXfQTbV77X75lO+zXFyN4co3OW
 z1sqVqfQvVdRL8iM2nD5Vaben/IYWFdXtltJm9BPPN83ZRTyPBXH0Mmcn
 HkAv8IogAc/n4ZNDHKk5PjeaYCyVFk1sXP5xD8N5FPc5thVyzbYqSwxZd
 X8o/7cQ1kiHrm9IKXTBXue/VTVXU6PhPEXg7CGGdoIs/cxtqFVZ4GhccI
 kLHo9w6oeO8B8COIhu5QoxH0vs2ZaVtI3UVuWgQ3zbd4weOyfzJ3GbqEJ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="306769455"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="306769455"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 12:16:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="610080575"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="610080575"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by orsmga006.jf.intel.com with ESMTP; 26 Oct 2022 12:16:12 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, berrange@redhat.com, armbru@redhat.com, f4bug@amsat.org,
 marcandre.lureau@redhat.com, thuth@redhat.com, vivek.kasireddy@intel.com,
 Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC PATCH 3/3] ui/gtk: reset visible flag when window is minimized
Date: Wed, 26 Oct 2022 12:04:21 -0700
Message-Id: <20221026190421.16922-4-dongwon.kim@intel.com>
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

Add a callback for window-state-event that resets vc->gfx.visible when
associated window is minimized and vice versa.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 ui/gtk.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 46c3135f6d..a81ff287cb 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1337,6 +1337,24 @@ static gboolean gd_tab_window_close(GtkWidget *widget, GdkEvent *event,
     return TRUE;
 }
 
+static gboolean gd_window_state_event(GtkWidget *widget, GdkEvent *event,
+                                      void *opaque)
+{
+    VirtualConsole *vc = opaque;
+
+    if (!vc) {
+        return TRUE;
+    }
+
+    if (event->window_state.new_window_state & GDK_WINDOW_STATE_ICONIFIED) {
+	vc->gfx.visible = false;
+    } else {
+        vc->gfx.visible = true;
+    }
+
+    return TRUE;
+}
+
 static gboolean gd_win_grab(void *opaque)
 {
     VirtualConsole *vc = opaque;
@@ -1378,6 +1396,9 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
 
         g_signal_connect(vc->window, "delete-event",
                          G_CALLBACK(gd_tab_window_close), vc);
+        g_signal_connect(vc->window, "window-state-event",
+                         G_CALLBACK(gd_window_state_event), vc);
+
         gtk_widget_show_all(vc->window);
 
         if (qemu_console_is_graphic(vc->gfx.dcl.con)) {
@@ -2027,7 +2048,9 @@ static void gd_connect_signals(GtkDisplayState *s)
 
     g_signal_connect(s->window, "delete-event",
                      G_CALLBACK(gd_window_close), s);
-
+    g_signal_connect(s->window, "window-state-event",
+                     G_CALLBACK(gd_window_state_event),
+                     gd_vc_find_current(s));
     g_signal_connect(s->pause_item, "activate",
                      G_CALLBACK(gd_menu_pause), s);
     g_signal_connect(s->reset_item, "activate",
-- 
2.30.2


