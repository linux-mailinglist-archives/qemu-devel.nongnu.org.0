Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F0231A443
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:10:39 +0100 (CET)
Received: from localhost ([::1]:52072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lActq-0006ff-P9
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:10:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAcqK-0003Y5-Sj
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:07:00 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAcqH-0006ni-Os
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:07:00 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v14so224447wro.7
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ikL0BOFjcRJUl+w266ibAhY1EnjWvpV7FXKe5w+lSUg=;
 b=oBNibsm9M/oxwWBTDmxCo7SnTZ3yUf9vrBCkbe3Rzyh2iv4vd8nVLYom/MaOjIHXZl
 0cshjcvMytKdUPgpz7CZFhQ8V+XRkIxJx+uMMxLPtCwocCcMzxFowo/7QIDneaqI4NBJ
 ZyAocy3tgcn6OGlZknnFh/dl4pL6XWclHOB3xLQGfZQ3mtcdTsmOlzXuzPzLNOxk5kkD
 ffVhIdUXyvZ/OeBQ+cN/mLTRLaeuLy2RL0l/X/FkE8SaXz7kV+Dst76230ZtDS0Je5F4
 /h1fgJu7IQAQ5F3bu9IrkayRs2pM7ggvVTYUXAVmknvKOfmXdloJ1q0Rk4We/OHR3wh3
 QGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ikL0BOFjcRJUl+w266ibAhY1EnjWvpV7FXKe5w+lSUg=;
 b=mysO1b9c8l3qWg54qmjonWtbWmbElNyMxUYiGPfyjfiEtOsUMsW0MDAHzTbPT2snXo
 YCORzTRvMSRei6epvU0FHGjObJ+V/x5ZysFd8c3uemUMRBg+E2Y34o5Yrw9k3DP15NFv
 bzE6wAPczXZQ+GUM6E0vzcm5w3CIaP5O/PiKaZEHnIrIvilcjuzag0RBXG5btAbZNf1d
 E5jBrHG4ZbbqBvRSSvc5Grbhzxb/2Xlo0VI2EPQ8iYhpIPTcEOiP9jsV2u9BbH5CM3yP
 iAD3YBWH3AdP0HydSsv++amBXWzyX5Fonu7bty62AjK2/haqYJyZV+KhPD/aciA81IrU
 DPDg==
X-Gm-Message-State: AOAM530p8N/mQz6MQEohlI9yppPdSBlVEGIJ+8V6WKj8UALeCM5Zft5c
 DHJWKo2MJ8AahGOUpwewTOTRYeJDSQ4Rjw==
X-Google-Smtp-Source: ABdhPJwoyPlAnWV8kbRiG0mcgyDob4qRHgj5X8syWmFMksV5a4mi27u5G/WC+N5jFsgJZABUtOBaWA==
X-Received: by 2002:adf:92a6:: with SMTP id 35mr4833416wrn.193.1613153216283; 
 Fri, 12 Feb 2021 10:06:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f6sm14022372wmq.33.2021.02.12.10.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:06:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/display/sm501: Remove dead code for non-32-bit RGB
 surfaces
Date: Fri, 12 Feb 2021 18:06:51 +0000
Message-Id: <20210212180653.27588-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210212180653.27588-1-peter.maydell@linaro.org>
References: <20210212180653.27588-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For a long time now the UI layer has guaranteed that the console
surface is always 32 bits per pixel RGB. Remove the legacy dead
code from the sm501 display device which was handling the
possibility that the console surface was some other format.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/sm501.c | 91 +++-------------------------------------------
 1 file changed, 6 insertions(+), 85 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 8966b69bc73..aba447c18b3 100644
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
2.20.1


