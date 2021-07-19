Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B043CEE8A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:45:55 +0200 (CEST)
Received: from localhost ([::1]:38038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5b5G-00029U-Qu
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m5b3I-0000mj-0Z
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:43:52 -0400
Received: from mga12.intel.com ([192.55.52.136]:65077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m5b3G-0005rh-Dy
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:43:51 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="190722727"
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="190722727"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 14:43:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="657044422"
Received: from dw-tiger-lake-client-platform.fm.intel.com ([10.105.205.215])
 by fmsmga006.fm.intel.com with ESMTP; 19 Jul 2021 14:43:47 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] ui/gtk: specify detached window's size and location
Date: Mon, 19 Jul 2021 14:41:57 -0700
Message-Id: <20210719214157.5863-2-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210719214157.5863-1-dongwon.kim@intel.com>
References: <20210719214157.5863-1-dongwon.kim@intel.com>
Received-SPF: pass client-ip=192.55.52.136; envelope-from=dongwon.kim@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Specify location and size of detached window based on top level window's
location and size info when detachment happens.

Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 ui/gtk.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/ui/gtk.c b/ui/gtk.c
index a07e5a049e..9b4e85624a 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1274,6 +1274,8 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
 {
     GtkDisplayState *s = opaque;
     VirtualConsole *vc = gd_vc_find_current(s);
+    gint x, y, w, h;
+    int i;
 
     if (vc->type == GD_VC_GFX &&
         qemu_console_is_graphic(vc->gfx.dcl.con)) {
@@ -1284,6 +1286,18 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
         gtk_widget_set_sensitive(vc->menu_item, false);
         vc->window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
         gd_widget_reparent(s->notebook, vc->window, vc->tab_item);
+        gtk_window_get_position(GTK_WINDOW(s->window), &x, &y);
+        gtk_window_get_size(GTK_WINDOW(s->window), &w, &h);
+
+        for (i = 0; i < s->nb_vcs; i++) {
+            if (vc == &s->vc[i]) {
+                break;
+            }
+        }
+
+        gtk_window_move(GTK_WINDOW(vc->window),
+                        x + w * (i % (s->nb_vcs/2) + 1), y + h * (i / (s->nb_vcs/2)));
+        gtk_window_resize(GTK_WINDOW(vc->window), w, h);
 
         g_signal_connect(vc->window, "delete-event",
                          G_CALLBACK(gd_tab_window_close), vc);
-- 
2.17.1


