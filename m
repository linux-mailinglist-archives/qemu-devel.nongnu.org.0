Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB4762EB9D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 03:05:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovqkl-0007qm-8e; Thu, 17 Nov 2022 21:05:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ovqkj-0007qI-G6
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 21:05:13 -0500
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ovqkh-0008SK-S7
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 21:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668737111; x=1700273111;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vNYLIrODk15ws5FA3V6uw9asG9+QoPhfEsPw/HPUUcI=;
 b=ff+gW3oQ4JE6pUZdRAlBtOTXQnD8Q+3lJjfYXJbBaIpvPgjYHySdA2NS
 1wsbLPx2YdZqJk5XYuwhoU7GRJfNJb3xcp03h9EybhEsVIBdEaaB7ztzz
 n9cIal60xFtoE/iRJpr13WdWJVhP0PXemN74pil9/LMuLkWhx7Li3Zh0H
 2YrZS5qAl2CiEHE+ksP1gnHx6rYRuDBMGG5V0yK/Ix5vWT6GuqAm0OP+1
 LPYyddPRjsHt7ThV1cVPEPU7zEUwiWBI2q9GTFBkQYERKOdER2k9zgenE
 q7Z2Eo9lD5RFvA8x2t6z/mH6K5+Yzdg0/v07sTfkbB2+M1JiYvp5NZ6Us w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="296393525"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="296393525"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:05:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="634270854"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="634270854"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:05:05 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>
Subject: [PATCH v2 1/6] ui/gtk: Consider the scaling factor when getting the
 root coordinates
Date: Thu, 17 Nov 2022 17:44:21 -0800
Message-Id: <20221118014426.182599-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221118014426.182599-1-vivek.kasireddy@intel.com>
References: <20221118014426.182599-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=vivek.kasireddy@intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Since gdk_window_get_root_coords() expects a position within the window,
we need to translate Guest's cooridinates to window local coordinates
by multiplying them with the scaling factor.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 ui/gtk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 92daaa6a6e..6c23903173 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -456,7 +456,8 @@ static void gd_mouse_set(DisplayChangeListener *dcl,
 
     dpy = gtk_widget_get_display(vc->gfx.drawing_area);
     gdk_window_get_root_coords(gtk_widget_get_window(vc->gfx.drawing_area),
-                               x, y, &x_root, &y_root);
+                               x * vc->gfx.scale_x, y * vc->gfx.scale_y,
+                               &x_root, &y_root);
     gdk_device_warp(gd_get_pointer(dpy),
                     gtk_widget_get_screen(vc->gfx.drawing_area),
                     x_root, y_root);
-- 
2.37.2


