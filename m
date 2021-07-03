Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BC23BA670
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 02:31:32 +0200 (CEST)
Received: from localhost ([::1]:58362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzTZC-0006nt-U0
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 20:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1lzTXX-0004hD-S2
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 20:29:47 -0400
Received: from mga05.intel.com ([192.55.52.43]:55262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1lzTXV-00057o-9Y
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 20:29:47 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="294440828"
X-IronPort-AV: E=Sophos;i="5.83,320,1616482800"; d="scan'208";a="294440828"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 17:29:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,320,1616482800"; d="scan'208";a="482953740"
Received: from dw-tiger-lake-client-platform.fm.intel.com ([10.105.205.215])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Jul 2021 17:29:37 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] ui/gtk: gd_draw_event returns FALSE when no cairo surface
 is bound
Date: Fri,  2 Jul 2021 17:28:09 -0700
Message-Id: <20210703002809.26753-3-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210703002809.26753-1-dongwon.kim@intel.com>
References: <20210703002809.26753-1-dongwon.kim@intel.com>
Received-SPF: pass client-ip=192.55.52.43; envelope-from=dongwon.kim@intel.com;
 helo=mga05.intel.com
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
Cc: Dongwon Kim <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gd_draw_event shouldn't try to repaint if surface does not exist
for the VC.

Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 ui/gtk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ui/gtk.c b/ui/gtk.c
index bfb95f3b4b..0a38deedc7 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -756,6 +756,9 @@ static gboolean gd_draw_event(GtkWidget *widget, cairo_t *cr, void *opaque)
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


