Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02624694789
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 14:57:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZJy-0003Dh-1J; Mon, 13 Feb 2023 08:56:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyujun@fingera.cn>)
 id 1pRSZ0-0004rh-PF
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 01:43:46 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyujun@fingera.cn>)
 id 1pRSYu-0004ia-4y
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 01:43:43 -0500
X-QQ-mid: bizesmtp89t1676270602tmjlff99
Received: from localhost.localdomain ( [112.95.75.167])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 13 Feb 2023 14:43:22 +0800 (CST)
X-QQ-SSF: 0130000000800020D000B00A0000000
X-QQ-FEAT: vLOCICHxEeBxPYNh/D8cAaSdQ80UZVv2MdzEyyN7MRsNqDu7koixGq6LP6IIQ
 kY0/N/GCwVyPyNBioGJZnQt6G4GC0vQWbIe3D57O8F4jUgEdtLhhjr8HqrPlOwqBqPK1aef
 Ee4p+ZaBfrbL50b9u0GgzHlKqQHbYQfE1vhqOB5ifU+QvKf3rwbLM7cVJx2tY1QiI8Vf/l0
 79CqBdfxcV2qm3CYd+9Xhy6rIyKbkG/WbEo2vRE/aAmRyhuxn87AHjxI3TUY0s80o4aqJml
 7QdqSPE83SqBjBarBuHfUd2uzuB0UVxUeNzPtfU+uukOAmZvC/mbaVX7kjVeFuKTyvOMJGV
 cyoOI6KTX25h1kfll+KtL3yorYnBG1b6t90sILjwigEY21Qu8E=
X-QQ-GoodBg: 0
From: liuyujun <liuyujun@fingera.cn>
To: qemu-devel@nongnu.org
Cc: liuyujun <liuyujun@fingera.cn>,
 Alexander Orzechowski <orzechowski.alexander@gmail.com>
Subject: [PATCH] This reverts commit f14aab420c58b57e07189d6d9e6d3fbfab4761a6.
Date: Mon, 13 Feb 2023 14:43:13 +0800
Message-Id: <20230213064313.1171614-1-liuyujun@fingera.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:fingera.cn:qybglogicsvr:qybglogicsvr4
Received-SPF: none client-ip=43.154.221.58; envelope-from=liuyujun@fingera.cn;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 13 Feb 2023 08:56:37 -0500
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

This commit was originally tested on gtk/gl which corrected behavior
there. Turns out, the OpenGL texture representing the virtual console
was being rendered in the incorrect place and not that the cursor
was incorrectly being handled.

Signed-off-by: Alexander Orzechowski <orzechowski.alexander@gmail.com>
Signed-off-by: Yujun <liuyujun@fingera.cn>
---
 ui/gtk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 7f752d8b7d..0b4713fcd5 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -871,7 +871,7 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
     int x, y;
     int mx, my;
     int fbh, fbw;
-    int ww, wh, ws;
+    int ww, wh;
 
     if (!vc->gfx.ds) {
         return TRUE;
@@ -883,7 +883,6 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
     window = gtk_widget_get_window(vc->gfx.drawing_area);
     ww = gdk_window_get_width(window);
     wh = gdk_window_get_height(window);
-    ws = gdk_window_get_scale_factor(window);
 
     mx = my = 0;
     if (ww > fbw) {
@@ -893,8 +892,8 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
         my = (wh - fbh) / 2;
     }
 
-    x = (motion->x - mx) / vc->gfx.scale_x * ws;
-    y = (motion->y - my) / vc->gfx.scale_y * ws;
+    x = (motion->x - mx) / vc->gfx.scale_x;
+    y = (motion->y - my) / vc->gfx.scale_y;
 
     if (qemu_input_is_absolute()) {
         if (x < 0 || y < 0 ||
-- 
2.20.1


