Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1779840EE54
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 02:22:08 +0200 (CEST)
Received: from localhost ([::1]:41150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR1dm-00017X-Ch
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 20:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mR1Xc-0003bq-Bn
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 20:15:45 -0400
Received: from mga03.intel.com ([134.134.136.65]:56726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mR1XU-0002tD-Sk
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 20:15:44 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="222744002"
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; d="scan'208";a="222744002"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 17:15:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; d="scan'208";a="434688360"
Received: from dw-tiger-lake-client-platform.fm.intel.com ([10.105.205.202])
 by orsmga003.jf.intel.com with ESMTP; 16 Sep 2021 17:15:26 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] ui/gtk: gd_draw_event returns FALSE when no cairo surface
 is bound
Date: Thu, 16 Sep 2021 17:13:19 -0700
Message-Id: <20210917001320.6515-4-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210917001320.6515-1-dongwon.kim@intel.com>
References: <20210917001320.6515-1-dongwon.kim@intel.com>
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=dongwon.kim@intel.com; helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gd_draw_event shouldn't try to repaint if surface does not exist
for the VC.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 ui/gtk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ui/gtk.c b/ui/gtk.c
index 92df3d4c5c..5346c331f4 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -778,6 +778,9 @@ static gboolean gd_draw_event(GtkWidget *widget, cairo_t *cr, void *opaque)
     if (!vc->gfx.ds) {
         return FALSE;
     }
+    if (!vc->gfx.surface) {
+        return FALSE;
+    }
 
     vc->gfx.dcl.update_interval =
         gd_monitor_update_interval(vc->window ? vc->window : s->window);
-- 
2.17.1


