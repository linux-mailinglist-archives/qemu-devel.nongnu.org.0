Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ADE2BA14A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 04:40:19 +0100 (CET)
Received: from localhost ([::1]:47428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfxHW-0003aM-RI
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 22:40:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kfxEk-0001cS-1u; Thu, 19 Nov 2020 22:37:27 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kfxEg-0006uv-Jl; Thu, 19 Nov 2020 22:37:25 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Ccj050WX1zhbg8;
 Fri, 20 Nov 2020 11:36:53 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Fri, 20 Nov 2020
 11:37:03 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <quintela@redhat.com>, <pbonzini@redhat.com>, <philmd@redhat.com>
Subject: [PATCH v2 2/2] display/vmware_vga: Replace fprintf(stderr,
 "*\n") with error_report()
Date: Fri, 20 Nov 2020 03:25:17 +0000
Message-ID: <20201120032517.104486-3-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20201120032517.104486-1-alex.chen@huawei.com>
References: <20201120032517.104486-1-alex.chen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
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
Cc: alex.chen@huawei.com, qemu-trivial@nongnu.org, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace all fprintf(stderr...) calls in hw/display/vmware_vga.c witherror_report().
Remove the "\n" from strings passed to all modified calls, since error_report() appends one.

Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 hw/display/vmware_vga.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index f93bbe15c2..a012e22e69 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -34,6 +34,7 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qom/object.h"
+#include "qemu/error-report.h"
 
 #undef VERBOSE
 #define HW_RECT_ACCEL
@@ -298,45 +299,45 @@ static inline bool vmsvga_verify_rect(DisplaySurface *surface,
                                       int x, int y, int w, int h)
 {
     if (x < 0) {
-        fprintf(stderr, "%s: x was < 0 (%d)\n", name, x);
+        error_report("%s: x was < 0 (%d)", name, x);
         return false;
     }
     if (x > SVGA_MAX_WIDTH) {
-        fprintf(stderr, "%s: x was > %d (%d)\n", name, SVGA_MAX_WIDTH, x);
+        error_report("%s: x was > %d (%d)", name, SVGA_MAX_WIDTH, x);
         return false;
     }
     if (w < 0) {
-        fprintf(stderr, "%s: w was < 0 (%d)\n", name, w);
+        error_report("%s: w was < 0 (%d)", name, w);
         return false;
     }
     if (w > SVGA_MAX_WIDTH) {
-        fprintf(stderr, "%s: w was > %d (%d)\n", name, SVGA_MAX_WIDTH, w);
+        error_report("%s: w was > %d (%d)", name, SVGA_MAX_WIDTH, w);
         return false;
     }
     if (x + w > surface_width(surface)) {
-        fprintf(stderr, "%s: width was > %d (x: %d, w: %d)\n",
+        error_report("%s: width was > %d (x: %d, w: %d)",
                 name, surface_width(surface), x, w);
         return false;
     }
 
     if (y < 0) {
-        fprintf(stderr, "%s: y was < 0 (%d)\n", name, y);
+        error_report("%s: y was < 0 (%d)", name, y);
         return false;
     }
     if (y > SVGA_MAX_HEIGHT) {
-        fprintf(stderr, "%s: y was > %d (%d)\n", name, SVGA_MAX_HEIGHT, y);
+        error_report("%s: y was > %d (%d)", name, SVGA_MAX_HEIGHT, y);
         return false;
     }
     if (h < 0) {
-        fprintf(stderr, "%s: h was < 0 (%d)\n", name, h);
+        error_report("%s: h was < 0 (%d)", name, h);
         return false;
     }
     if (h > SVGA_MAX_HEIGHT) {
-        fprintf(stderr, "%s: h was > %d (%d)\n", name, SVGA_MAX_HEIGHT, h);
+        error_report("%s: h was > %d (%d)", name, SVGA_MAX_HEIGHT, h);
         return false;
     }
     if (y + h > surface_height(surface)) {
-        fprintf(stderr, "%s: update height > %d (y: %d, h: %d)\n",
+        error_report("%s: update height > %d (y: %d, h: %d)",
                 name, surface_height(surface), y, h);
         return false;
     }
@@ -534,7 +535,7 @@ static inline void vmsvga_cursor_define(struct vmsvga_state_s *s,
 #endif
         break;
     default:
-        fprintf(stderr, "%s: unhandled bpp %u, using fallback cursor\n",
+        error_report("%s: unhandled bpp %u, using fallback cursor",
                 __func__, c->bpp);
         cursor_put(qc);
         qc = cursor_builtin_left_ptr();
-- 
2.19.1


