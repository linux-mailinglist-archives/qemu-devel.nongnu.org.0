Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E28E32F19B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:45:05 +0100 (CET)
Received: from localhost ([::1]:37168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEVc-0008F3-8V
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:45:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3N-0006so-HQ
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:53 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE31-0007XT-EL
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:53 -0500
Received: by mail-wr1-x42e.google.com with SMTP id w11so2876121wrr.10
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ny362TN38iGwXKJycfO978Zq70vcDK9uLpS0OFZEMw0=;
 b=YFpx+RGWhPNx2QFKZbBWlqBE7GY211XRuxE+OioTd7ioRUI/3aph+3+/tyQ7WD4Fa3
 ASD0zGnPCxPPUgD1krL8B7FXL6cJAhbs8UqydrBuvKfiIcUqR5uDe6U0/HvaTER7c7il
 8qAtL68XZd5nKm6FlJAZQluZQzDsfwyIbwo8+ke2USpaNuBFMxLt+MNVNidIlM5TI6gU
 WVm3W7Fmu5Kl1ABm5gNxJYQQaHAgupBjEC/PXTXWoaPAGR2CbMNN9J7V4+7Gud9XvQeC
 p7s9Hhlh1h1T8RFVaeW7Fip8FkSuHqAkdGUsUuhCKyPzjBcVdiDfb/QPFNBjq5xCF1Y+
 SSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ny362TN38iGwXKJycfO978Zq70vcDK9uLpS0OFZEMw0=;
 b=kreu4rgEFILqzX4qWn6+d/tBRjqYFJNOtF1vXsCJ7EYokkI4t6lH9jksx2XYacM+nL
 UxcHOo2TKw3ZjDZAblMi4v8FWaKxit7Gfjh2sOu7iJSvYoGo/bueyIP8cIu2vYNWp0lo
 PYvFyM0BSDKwCpKGwkADhmV5sbLjvmNFCG0Cj8kieiExkEmfcKzBpgr8t3wexgnht0jl
 cJROmgWmNqfxYTCtP3AerhCXtuR+vP7zfSJjPpnZ8MKXpg9XLgDKG/xpGNnWaHAOoXRZ
 4TbyO7t1bDjl6Lim+WSTxesy7SYkgpJWjy92hr05Guc0Uol+a2p+GjNLsJv2xiqxNo9p
 4AVg==
X-Gm-Message-State: AOAM531wDYGf/gKJP1yTGG+L1a7clHNzop2c5tQi2F7UlKlcOQYjwmHJ
 siIvDczt4W4Ke0eMgC7k5tFjrRI7STUxCw==
X-Google-Smtp-Source: ABdhPJwI4CUoMj0mI4Kord8m7RJ2AGWxCWF+VD0jPRKz5e5dJMDeMPkohgoJ3rSnlxYTLqKaOc87ng==
X-Received: by 2002:a5d:644d:: with SMTP id d13mr10381392wrw.191.1614964530030; 
 Fri, 05 Mar 2021 09:15:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/49] hw/display/tc6393xb: Remove dead code for handling
 non-32bpp surfaces
Date: Fri,  5 Mar 2021 17:14:43 +0000
Message-Id: <20210305171515.1038-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For a long time now the UI layer has guaranteed that the console
surface is always 32 bits per pixel RGB. Remove the legacy dead
code from the tc6393xb display device which was handling the
possibility that the console surface was some other format.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215103215.4944-3-peter.maydell@linaro.org
---
 include/ui/console.h  | 10 ----------
 hw/display/tc6393xb.c | 33 +--------------------------------
 2 files changed, 1 insertion(+), 42 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index c960b7066cc..810ce7988c0 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -267,16 +267,6 @@ PixelFormat qemu_default_pixelformat(int bpp);
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


