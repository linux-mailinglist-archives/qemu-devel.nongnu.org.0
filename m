Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CA969C872
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 11:19:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU3BO-0006Pa-0B; Mon, 20 Feb 2023 05:14:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyujun@fingera.cn>)
 id 1pU3BI-0006KC-Et
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:14:00 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyujun@fingera.cn>)
 id 1pU3BE-0001UD-Kl
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:14:00 -0500
X-QQ-mid: bizesmtp64t1676888025t98i2lsh
Received: from localhost.localdomain ( [112.95.75.167])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 20 Feb 2023 18:13:44 +0800 (CST)
X-QQ-SSF: 0130000000800020D000B00A0000000
X-QQ-FEAT: 4Tl+2E7hqrjN7i4Qi4U1zo5KCtJfvo8G/lioFouoIDQc8EWK4vuE5LNmL0vfp
 dGFCGtSnQtGG3hyM+fP71S59IEJqgivAOHhnbmekhvOAFMJLl0gJwk2tCosm65kRDv3lMQq
 lvYa7WwVaKChiwWR93swmXvJpoP74NWKkJ3exNLmosbakSzrpIbavURQzQuxVA7Ns+K+FCz
 nIIn1sVC61WI1rSqAMow7ewJfuT3A2phqxf9QsYdkkXvGSPsCweiLV2RbbOzkf5ax4Eo74z
 l/PDB3BmeEIxjlsLNOw/47QNNhmf0lmNrFSiwBiSpmJPNC/7hXKj37cC0hzqyJniK7E3BgK
 6uEkzgwJOcohMBjvvOJUFaupweG0Q==
X-QQ-GoodBg: 0
From: liuyujun <liuyujun@fingera.cn>
To: qemu-devel@nongnu.org
Cc: liuyujun <liuyujun@fingera.cn>
Subject: [PATCH 1/3] This reverts commit
 f14aab420c58b57e07189d6d9e6d3fbfab4761a6.
Date: Mon, 20 Feb 2023 18:13:40 +0800
Message-Id: <20230220101342.129689-1-liuyujun@fingera.cn>
X-Mailer: git-send-email 2.20.1
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


