Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F70331B747
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:38:22 +0100 (CET)
Received: from localhost ([::1]:42624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbGn-0002Aa-9E
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:38:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB7-0004NS-Ce
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:29 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbAy-0001gz-Kx
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:29 -0500
Received: by mail-wr1-x430.google.com with SMTP id l12so8287415wry.2
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 02:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9bceLBdb3iGzpfJ2NpcGXJpz+JJSn554nq+lipt4b8U=;
 b=WSxolL9dBqJYDnTcboOhCriAiAv+qWe5xEakY2FqT2MDmz7K9m4YOpuUygqbUhEgKM
 SSoqvKddfiNOcvK+5LdxsasvEWt5v6KeLXWRQWy3+FWtF3pcR3Of4z0H03vnrxf8e5hO
 s01wPzgQpv4KKBjxep13VJSy4HgsS2ptzuH0JpDt4xnOU+jHGRqH7wqiFcKppFulHHwa
 zwWs1TNKgLakLfPDXkoIF5zp3czaFvmGQXQR1Ii9OTm9USA9A3XGOrP/HpyEQYgjbzJT
 CE++Cfh/70/wQML9IfV6uMsRLoC0mj3lgLsO6sueDVdgO6QbYSlkuVyN+OJi27F5d2IC
 cwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9bceLBdb3iGzpfJ2NpcGXJpz+JJSn554nq+lipt4b8U=;
 b=NIgu9Dbm5Ztf9AG84Q713HYvmq9tAs71PzrCnMsnEnhz+G3XamWnUpwJHhBsOaW/9U
 2le2ehX1Y4/yFYTdmkZ1o2X6yykesO6u/f+wLUEEGfbAZ+OV2hTOad5GnH1g5T/Genbr
 A0vN1Q8UuKOQpOwZIGIsRoX0wEPvl6BiuABPteMlpX5CEHyncoYFhs5gsnKMOlXR0Cxr
 K4rNuuyHOmc9HrZKiQvuzJ9fBQRbwHfXyk1JcmuThooDujBYeRh676vVr7/DV74p3MlG
 gYhRTXhJ7b6caoK5po7HAj5x66jReKHBbTMv4y9K5ghbGXUQJMdKHG04C+mozYUAyalt
 y6kQ==
X-Gm-Message-State: AOAM532+1mPtLMiQtw3fT4+ebWyW7Gb5xS6PXHHuTQ2JQVgzfUxlY3Ti
 iAwD2bepaHKwO/za1uSVEaJ3pw==
X-Google-Smtp-Source: ABdhPJwRhAZtrdI+j58sN1SYNelhzFf0+kpiQ3VASYCRwYiHiztpUtIn/G78agRHDPWBWBkvKuhDrA==
X-Received: by 2002:a5d:5910:: with SMTP id v16mr7496639wrd.304.1613385139338; 
 Mon, 15 Feb 2021 02:32:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 36sm25196300wrj.97.2021.02.15.02.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 02:32:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/9] hw/display/tc6393xb: Remove dead code for handling
 non-32bpp surfaces
Date: Mon, 15 Feb 2021 10:32:08 +0000
Message-Id: <20210215103215.4944-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215103215.4944-1-peter.maydell@linaro.org>
References: <20210215103215.4944-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For a long time now the UI layer has guaranteed that the console
surface is always 32 bits per pixel RGB. Remove the legacy dead
code from the tc6393xb display device which was handling the
possibility that the console surface was some other format.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/ui/console.h  | 10 ----------
 hw/display/tc6393xb.c | 33 +--------------------------------
 2 files changed, 1 insertion(+), 42 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index d30e972d0b5..ed086f9f1ad 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -266,16 +266,6 @@ PixelFormat qemu_default_pixelformat(int bpp);
 DisplaySurface *qemu_create_displaysurface(int width, int height);
 void qemu_free_displaysurface(DisplaySurface *surface);
 
-static inline int is_surface_bgr(DisplaySurface *surface)
-{
-    if (PIXMAN_FORMAT_BPP(surface->format) == 32 &&
-        PIXMAN_FORMAT_TYPE(surface->format) == PIXMAN_TYPE_ABGR) {
-        return 1;
-    } else {
-        return 0;
-    }
-}
-
 static inline int is_buffer_shared(DisplaySurface *surface)
 {
     return !(surface->flags & QEMU_ALLOCATED_FLAG);
diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 49a676d1b0e..4cddb1a99ad 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -410,43 +410,12 @@ static void tc6393xb_nand_writeb(TC6393xbState *s, hwaddr addr, uint32_t value)
                                         (uint32_t) addr, value & 0xff);
 }
 
-#define BITS 8
-#include "tc6393xb_template.h"
-#define BITS 15
-#include "tc6393xb_template.h"
-#define BITS 16
-#include "tc6393xb_template.h"
-#define BITS 24
-#include "tc6393xb_template.h"
 #define BITS 32
 #include "tc6393xb_template.h"
 
 static void tc6393xb_draw_graphic(TC6393xbState *s, int full_update)
 {
-    DisplaySurface *surface = qemu_console_surface(s->con);
-
-    switch (surface_bits_per_pixel(surface)) {
-        case 8:
-            tc6393xb_draw_graphic8(s);
-            break;
-        case 15:
-            tc6393xb_draw_graphic15(s);
-            break;
-        case 16:
-            tc6393xb_draw_graphic16(s);
-            break;
-        case 24:
-            tc6393xb_draw_graphic24(s);
-            break;
-        case 32:
-            tc6393xb_draw_graphic32(s);
-            break;
-        default:
-            printf("tc6393xb: unknown depth %d\n",
-                   surface_bits_per_pixel(surface));
-            return;
-    }
-
+    tc6393xb_draw_graphic32(s);
     dpy_gfx_update_full(s->con);
 }
 
-- 
2.20.1


