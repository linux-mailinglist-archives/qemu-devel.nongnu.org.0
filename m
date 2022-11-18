Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9369162EB87
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 02:59:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovqdp-0004ut-9s; Thu, 17 Nov 2022 20:58:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ovqdn-0004tz-6T
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 20:58:03 -0500
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ovqdl-0007Pe-Lv
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 20:58:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668736681; x=1700272681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oXuv0bqBvJSqJlVZ86xJBVuX2v+9XZpsn6wJkK1oPEc=;
 b=NNM95T/ZVz1bamykNdbRERW1rXRuGAlta/53nC8lke36vgeBdI6wTKFJ
 4WWcK21sjjSKG+jRod9EQRC/bFgIWvTPWCwOlX/COXrOn9CXUUOXUlbpK
 fRLXymFRskcST+kWs+r4soJ/vWxo+MeCB+MB0Zv1aIoW4WUhZigPqQCI8
 iFTkKvfngHHHeYl4JsCqYK5M48gSbK1SHHBtWlPIXsJcRnevdGUp5a7zE
 KqEAnAxxwU71Skk/L+AKrDkco7fV4g/gZ5rSTdx+ybqnkkgOOJmcmKf2d
 kdVA2tOwV089/KN24UWl0zbQIYKuCgFNKtDfvqImUSDQN+xx8LkjmdPiy A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="311731511"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="311731511"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 17:57:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="708859345"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="708859345"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 17:57:53 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Dongwon Kim <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v1 2/2] ui/gtk: Include the position info while setting the ui
 info
Date: Thu, 17 Nov 2022 17:37:23 -0800
Message-Id: <20221118013723.182424-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221118013723.182424-1-vivek.kasireddy@intel.com>
References: <20221118013723.182424-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=vivek.kasireddy@intel.com; helo=mga04.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In situtations where the Guest uses multiple displays/outputs, this
position info is useful for aligning the Guest's outputs with that of
the Host's.

Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 ui/gtk.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/ui/gtk.c b/ui/gtk.c
index 92daaa6a6e..12b3bc6481 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -714,12 +714,31 @@ static gboolean gd_window_close(GtkWidget *widget, GdkEvent *event,
     return TRUE;
 }
 
+static void gd_set_ui_window_position(VirtualConsole *vc, QemuUIInfo *info)
+{
+    GdkDisplay *dpy = gtk_widget_get_display(vc->gfx.drawing_area);
+    GdkWindow *window;
+    GdkMonitor *monitor;
+    GdkRectangle geometry;
+
+    if (!gtk_widget_get_realized(vc->gfx.drawing_area)) {
+        return;
+    }
+
+    window = gtk_widget_get_window(vc->gfx.drawing_area);
+    monitor = gdk_display_get_monitor_at_window(dpy, window);
+    gdk_monitor_get_geometry(monitor, &geometry);
+    info->xoff = geometry.x;
+    info->yoff = geometry.y;
+}
+
 static void gd_set_ui_refresh_rate(VirtualConsole *vc, int refresh_rate)
 {
     QemuUIInfo info;
 
     info = *dpy_get_ui_info(vc->gfx.dcl.con);
     info.refresh_rate = refresh_rate;
+    gd_set_ui_window_position(vc, &info);
     dpy_set_ui_info(vc->gfx.dcl.con, &info, true);
 }
 
@@ -730,6 +749,7 @@ static void gd_set_ui_size(VirtualConsole *vc, gint width, gint height)
     info = *dpy_get_ui_info(vc->gfx.dcl.con);
     info.width = width;
     info.height = height;
+    gd_set_ui_window_position(vc, &info);
     dpy_set_ui_info(vc->gfx.dcl.con, &info, true);
 }
 
-- 
2.37.2


