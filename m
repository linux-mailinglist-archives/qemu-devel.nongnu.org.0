Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992D22A02C7
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 11:26:32 +0100 (CET)
Received: from localhost ([::1]:38332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYRc7-0006tc-Em
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 06:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kYRZ7-0004ck-Ji; Fri, 30 Oct 2020 06:23:25 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kYRZ5-0008Ij-QN; Fri, 30 Oct 2020 06:23:25 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CMz0p4ByJzhd3m;
 Fri, 30 Oct 2020 18:23:22 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Fri, 30 Oct 2020 18:23:15 +0800
Message-ID: <5F9BE993.4050406@huawei.com>
Date: Fri, 30 Oct 2020 18:23:15 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <peter.maydell@linaro.org>
Subject: [PATCH] hw/display/omap_lcdc: Fix potential NULL pointer dereference
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 06:22:50
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In omap_lcd_interrupts(), the pointer omap_lcd is dereferenced before
being check if it is valid, which may lead to NULL pointer dereference.
So move the assignment to surface after checking that the omap_lcd is valid.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 hw/display/omap_lcdc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/display/omap_lcdc.c b/hw/display/omap_lcdc.c
index fa4a381db6..2941c5c67c 100644
--- a/hw/display/omap_lcdc.c
+++ b/hw/display/omap_lcdc.c
@@ -78,7 +78,7 @@ static void omap_lcd_interrupts(struct omap_lcd_panel_s *s)
 static void omap_update_display(void *opaque)
 {
     struct omap_lcd_panel_s *omap_lcd = (struct omap_lcd_panel_s *) opaque;
-    DisplaySurface *surface = qemu_console_surface(omap_lcd->con);
+    DisplaySurface *surface;
     draw_line_func draw_line;
     int size, height, first, last;
     int width, linesize, step, bpp, frame_offset;
@@ -89,6 +89,7 @@ static void omap_update_display(void *opaque)
         return;
     }

+    surface = qemu_console_surface(omap_lcd->con);
     frame_offset = 0;
     if (omap_lcd->plm != 2) {
         cpu_physical_memory_read(
-- 
2.19.1

