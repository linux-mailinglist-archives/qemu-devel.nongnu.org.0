Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271EB69C871
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 11:19:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU3BO-0006Pv-KA; Mon, 20 Feb 2023 05:14:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyujun@fingera.cn>)
 id 1pU3BH-0006Io-A8
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:13:59 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyujun@fingera.cn>)
 id 1pU3BE-0001VI-Kk
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:13:58 -0500
X-QQ-mid: bizesmtp64t1676888029t0vpixsx
Received: from localhost.localdomain ( [112.95.75.167])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 20 Feb 2023 18:13:49 +0800 (CST)
X-QQ-SSF: 0130000000800020D000B00A0000000
X-QQ-FEAT: hoArX50alxFhHVM6ViNCefzuCIpkNyHCQ3CGR6np7Ti5VI+FsqRpoStFjWsRw
 TgnZ6I7/HXVBdzsVgpygqlrk2ddgkO/QNMbUJ1cR/mDW+I3zMwSYnLFITTxNgGRxg+HMHIj
 50ki50dxohmXLVlc+FSwUrz4a/xldcsOzfkf9CW+2tth/GJwDP7LwuEHjZSAllYufr6xKxJ
 UqYWRxW18+VM5Q01i369iCvKBcgC4HlZ0K5IBP3/cVuqywi33X+BdrnBQSSs3HPiLdJImn8
 v/QzR1v2bY7s7pBPxbwMgHXVXLODoTklf1Ns9Mjk2Wd2Q9BWHtPC4evBNCcwi8ewfdRHVGt
 KKvu86olj9VTcnhjQC25529H9TkcuwkMOPIOj6pZJV0ZyzUs5k=
X-QQ-GoodBg: 0
From: liuyujun <liuyujun@fingera.cn>
To: qemu-devel@nongnu.org
Cc: liuyujun <liuyujun@fingera.cn>
Subject: [PATCH 3/3] Fix zoom scale
Date: Mon, 20 Feb 2023 18:13:42 +0800
Message-Id: <20230220101342.129689-3-liuyujun@fingera.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230220101342.129689-1-liuyujun@fingera.cn>
References: <20230220101342.129689-1-liuyujun@fingera.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:fingera.cn:qybglogicsvr:qybglogicsvr4
Received-SPF: none client-ip=43.155.65.254; envelope-from=liuyujun@fingera.cn;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Yujun <liuyujun@fingera.cn>
---
 ui/gtk.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 1b43ed31e3..c4c8339d91 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1482,9 +1482,10 @@ static void gd_menu_zoom_fixed(GtkMenuItem *item, void *opaque)
 {
     GtkDisplayState *s = opaque;
     VirtualConsole *vc = gd_vc_find_current(s);
+    int ws = gdk_window_get_scale_factor(gtk_widget_get_window(vc->gfx.drawing_area));
 
-    vc->gfx.scale_x = 1.0;
-    vc->gfx.scale_y = 1.0;
+    vc->gfx.scale_x = 1.0 / ws;
+    vc->gfx.scale_y = 1.0 / ws;
 
     gd_update_windowsize(vc);
 }
@@ -1493,13 +1494,15 @@ static void gd_menu_zoom_fit(GtkMenuItem *item, void *opaque)
 {
     GtkDisplayState *s = opaque;
     VirtualConsole *vc = gd_vc_find_current(s);
+    int ws = gdk_window_get_scale_factor(gtk_widget_get_window(vc->gfx.drawing_area));
 
     if (gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(s->zoom_fit_item))) {
         s->free_scale = TRUE;
     } else {
+        ws = gdk_window_get_scale_factor(gtk_widget_get_window(vc->gfx.drawing_area));
         s->free_scale = FALSE;
-        vc->gfx.scale_x = 1.0;
-        vc->gfx.scale_y = 1.0;
+        vc->gfx.scale_x = 1.0 / ws;
+        vc->gfx.scale_y = 1.0 / ws;
     }
 
     gd_update_windowsize(vc);
-- 
2.20.1


