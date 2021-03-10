Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CAC333442
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:14:08 +0100 (CET)
Received: from localhost ([::1]:47970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqEZ-0000be-3C
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:14:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAl-0003Tp-FM; Tue, 09 Mar 2021 23:10:13 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:56169 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAj-00046u-DP; Tue, 09 Mar 2021 23:10:11 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwJWd15hVz9sS8; Wed, 10 Mar 2021 15:10:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615349405;
 bh=Q6YsQnQ2NHBT3n+G/C9i0pub6lxo+cLVM7w8a9XTAsM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KGhojhca97gCNoft/CunYWbI1HFyiO2GvjHwWwMxIe1buWhbOcxS1sLIUJExNZUoN
 rrU5tDj0Gpja+qQxHlnB3b4tg0yWDzocTgNEzhttqFozcgaGLQi6UKIpUm+LBlvT8E
 QBRhHjCN7+mJpAlz3THAYHKCDrb4pLT6Balzh1Ok=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 01/20] hw/display/sm501: Remove dead code for non-32-bit RGB
 surfaces
Date: Wed, 10 Mar 2021 15:09:43 +1100
Message-Id: <20210310041002.333813-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310041002.333813-1-david@gibson.dropbear.id.au>
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

For a long time now the UI layer has guaranteed that the console
surface is always 32 bits per pixel RGB. Remove the legacy dead
code from the sm501 display device which was handling the
possibility that the console surface was some other format.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210212180653.27588-2-peter.maydell@linaro.org>
Acked-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/display/sm501.c | 91 +++-------------------------------------------
 1 file changed, 6 insertions(+), 85 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 8966b69bc7..aba447c18b 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1558,89 +1558,9 @@ typedef void draw_hwc_line_func(uint8_t *d, const uint8_t *s,
                                 int width, const uint8_t *palette,
                                 int c_x, int c_y);
 
-#define DEPTH 8
-#include "sm501_template.h"
-
-#define DEPTH 15
-#include "sm501_template.h"
-
-#define BGR_FORMAT
-#define DEPTH 15
-#include "sm501_template.h"
-
-#define DEPTH 16
-#include "sm501_template.h"
-
-#define BGR_FORMAT
-#define DEPTH 16
-#include "sm501_template.h"
-
 #define DEPTH 32
 #include "sm501_template.h"
 
-#define BGR_FORMAT
-#define DEPTH 32
-#include "sm501_template.h"
-
-static draw_line_func *draw_line8_funcs[] = {
-    draw_line8_8,
-    draw_line8_15,
-    draw_line8_16,
-    draw_line8_32,
-    draw_line8_32bgr,
-    draw_line8_15bgr,
-    draw_line8_16bgr,
-};
-
-static draw_line_func *draw_line16_funcs[] = {
-    draw_line16_8,
-    draw_line16_15,
-    draw_line16_16,
-    draw_line16_32,
-    draw_line16_32bgr,
-    draw_line16_15bgr,
-    draw_line16_16bgr,
-};
-
-static draw_line_func *draw_line32_funcs[] = {
-    draw_line32_8,
-    draw_line32_15,
-    draw_line32_16,
-    draw_line32_32,
-    draw_line32_32bgr,
-    draw_line32_15bgr,
-    draw_line32_16bgr,
-};
-
-static draw_hwc_line_func *draw_hwc_line_funcs[] = {
-    draw_hwc_line_8,
-    draw_hwc_line_15,
-    draw_hwc_line_16,
-    draw_hwc_line_32,
-    draw_hwc_line_32bgr,
-    draw_hwc_line_15bgr,
-    draw_hwc_line_16bgr,
-};
-
-static inline int get_depth_index(DisplaySurface *surface)
-{
-    switch (surface_bits_per_pixel(surface)) {
-    default:
-    case 8:
-        return 0;
-    case 15:
-        return 1;
-    case 16:
-        return 2;
-    case 32:
-        if (is_surface_bgr(surface)) {
-            return 4;
-        } else {
-            return 3;
-        }
-    }
-}
-
 static void sm501_update_display(void *opaque)
 {
     SM501State *s = (SM501State *)opaque;
@@ -1652,7 +1572,6 @@ static void sm501_update_display(void *opaque)
     int height = get_height(s, crt);
     int src_bpp = get_bpp(s, crt);
     int dst_bpp = surface_bytes_per_pixel(surface);
-    int dst_depth_index = get_depth_index(surface);
     draw_line_func *draw_line = NULL;
     draw_hwc_line_func *draw_hwc_line = NULL;
     int full_update = 0;
@@ -1662,6 +1581,8 @@ static void sm501_update_display(void *opaque)
     uint8_t hwc_palette[3 * 3];
     uint8_t *hwc_src = NULL;
 
+    assert(dst_bpp == 4); /* Output is always 32-bit RGB */
+
     if (!((crt ? s->dc_crt_control : s->dc_panel_control)
           & SM501_DC_CRT_CONTROL_ENABLE)) {
         return;
@@ -1674,13 +1595,13 @@ static void sm501_update_display(void *opaque)
     /* choose draw_line function */
     switch (src_bpp) {
     case 1:
-        draw_line = draw_line8_funcs[dst_depth_index];
+        draw_line = draw_line8_32;
         break;
     case 2:
-        draw_line = draw_line16_funcs[dst_depth_index];
+        draw_line = draw_line16_32;
         break;
     case 4:
-        draw_line = draw_line32_funcs[dst_depth_index];
+        draw_line = draw_line32_32;
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "sm501: update display"
@@ -1691,7 +1612,7 @@ static void sm501_update_display(void *opaque)
     /* set up to draw hardware cursor */
     if (is_hwc_enabled(s, crt)) {
         /* choose cursor draw line function */
-        draw_hwc_line = draw_hwc_line_funcs[dst_depth_index];
+        draw_hwc_line = draw_hwc_line_32;
         hwc_src = get_hwc_address(s, crt);
         c_x = get_hwc_x(s, crt);
         c_y = get_hwc_y(s, crt);
-- 
2.29.2


