Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40122513EFC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 01:21:27 +0200 (CEST)
Received: from localhost ([::1]:56082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkDRu-0003Ho-CY
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 19:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nkDNW-0004Tm-12
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 19:16:54 -0400
Received: from mga05.intel.com ([192.55.52.43]:57367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nkDNU-0007hA-HI
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 19:16:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651187812; x=1682723812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AGPs5gn/PiJcZ5VVKJ5gogx7bdL4KUv1SJaow18szTQ=;
 b=Pl1BXHdDQcCAjlreYUsz64kC40RY3l3GIZZka3TItNfgSNlHYxd9GeDA
 91y1EDEkE8brTSFnbko4UdBKmJ/Iao1Vc7OeCwTvOKNZq/V8Oi3DYDc6I
 rUaV84/mMp5/bbMFiv8da71LX0e/8iMZ1BEt7PIfDxZZXMO6NfooRJKzL
 ENY+I3U9meVQJt1Cqp9h5F3VjxgXUd5LbzsXYK3vHj1ChPMNeFc0KNcRl
 y6GI1wIPprvSPlM8msVw0XbWCN/NNlFwvpmMoYlzMKLO9ZE3PAd6NNSHJ
 5+PLwfbzP7w5KAmMYV1OdT6ZiCoPsU+vVhMBFiYv2Sx+cC3NSMEh9zgLN Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="352887479"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="352887479"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 16:16:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="731758649"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by orsmga005.jf.intel.com with ESMTP; 28 Apr 2022 16:16:43 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org, dongwon.kim@intel.com, philmd@redhat.com,
 kraxel@redhat.com, pbonzini@redhat.com
Subject: [PATCH 3/3] ui/gtk: specify detached window's size and location
Date: Thu, 28 Apr 2022 16:13:04 -0700
Message-Id: <20220428231304.19472-4-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220428231304.19472-1-dongwon.kim@intel.com>
References: <20220428231304.19472-1-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=dongwon.kim@intel.com;
 helo=mga05.intel.com
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Specify location and size of detached window based on top level
window's location and size info when detachment happens.

Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 ui/gtk.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/ui/gtk.c b/ui/gtk.c
index f1ca6a7275..7dadf3b588 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1338,6 +1338,8 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
                                        FALSE);
     }
     if (!vc->window) {
+        gint x, y, w, h;
+        int i;
         gtk_widget_set_sensitive(vc->menu_item, false);
         vc->window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
 #if defined(CONFIG_OPENGL)
@@ -1351,7 +1353,18 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
         }
 #endif
         gd_widget_reparent(s->notebook, vc->window, vc->tab_item);
+        gtk_window_get_position(GTK_WINDOW(s->window), &x, &y);
+        gtk_window_get_size(GTK_WINDOW(s->window), &w, &h);
+
+        for (i = 0; i < s->nb_vcs; i++) {
+            if (vc == &s->vc[i]) {
+                break;
+            }
+        }
 
+        gtk_window_move(GTK_WINDOW(vc->window),
+                        x + w * (i % (s->nb_vcs/2) + 1), y + h * (i / (s->nb_vcs/2)));
+        gtk_window_resize(GTK_WINDOW(vc->window), w, h);
         g_signal_connect(vc->window, "delete-event",
                          G_CALLBACK(gd_tab_window_close), vc);
         gtk_widget_show_all(vc->window);
-- 
2.30.2


