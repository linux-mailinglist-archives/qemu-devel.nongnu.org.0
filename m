Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC51338FB5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:21:41 +0100 (CET)
Received: from localhost ([::1]:41540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKifc-0007kC-Ug
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiDH-00035R-5z
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:23 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCz-00023j-O6
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:22 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v15so4855410wrx.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=t2MJ2MOlhaSaGMke11ZrdYhAijhTK3ZryyA5oGf00LM=;
 b=wdbnFFHzOaJcxfUobMS5VXsLX/StPpJYDiB8xfJN5wp1s8q1UlgAcaVwfC95o9mteA
 OQT5+fiN2s4rhem6j5mpw9cW5iemWZrl5h9oHynQDH3uH6BW+x4SJJPHegzN3rrGiVlp
 c8/QuIUG4xtXFmdq62hS16ao/hnnU0fq8s98riDZ/NyKjaZGOJ8bLkBeIMdCvPCwgrnO
 exjFA0IajKechBr2IUtkdwYxVepWkWf0tF8MaYXZbTubOenQXaT/GLoEvKnN0JIiHPNI
 0e4MxjgRQ2+T3KTyR3TYh8NJCCQDWZJiap9/MRR4SxNM5e1Y5nz0p+WPA/TnXT4R0wFF
 pspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t2MJ2MOlhaSaGMke11ZrdYhAijhTK3ZryyA5oGf00LM=;
 b=jysJH3qLNlf+y8TipWe8JxRql498a4IE/pyT5y48zcvVHIawQzZ27TWCox/l+FwRrd
 ++QKs2qSvdyKMjEuSD7GUQtU53jzZGUeuwYGjJjcSjLFXM8At5QgOCWCkh0JgXVblMZe
 wU/dKuaBKnTc1bAN4wr/5KZHgrORyOBVw9TySTEALZQ4JUQ/MmdMuS1H6AI9k5EFsh0A
 tPhORfm0TJZFvYpxPhU5sdZYITLEIVJjyzN/t928Vz7zEH6FCEG7nz/5oj+Ugam09Y3d
 lz88msBpbtTCBnRFg/tpGjPQW0KgKKtQSZemATQa1oPdjy4ltfWZhLJRwwFZCXri4kLS
 NqSg==
X-Gm-Message-State: AOAM530NpsH3YLCHhUJOBTAlBfffh4WPQU9YMux5bUjPQ+/+BwIvRHp6
 q/VoTDN26+mY5DjkWaAH/e1lM0taxrcVukkt
X-Google-Smtp-Source: ABdhPJxkwc2gtkJOzenLLaaVKIY3WsdSwTz9gJBzVZ9pInTPFuRwz1XkeRtsK5iLhEsfj3y0qy5Xlg==
X-Received: by 2002:a5d:6147:: with SMTP id y7mr14092032wrt.306.1615557124348; 
 Fri, 12 Mar 2021 05:52:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.52.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:52:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/39] hw/display/pl110: Remove dead code for non-32-bpp
 surfaces
Date: Fri, 12 Mar 2021 13:51:32 +0000
Message-Id: <20210312135140.1099-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
surface is always 32 bits per pixel. Remove the legacy dead
code from the pl110 display device which was handling the
possibility that the console surface was some other format.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20210211141515.8755-2-peter.maydell@linaro.org
---
 hw/display/pl110.c | 53 +++++++---------------------------------------
 1 file changed, 8 insertions(+), 45 deletions(-)

diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index 02b0d45f062..a0d4126ce7f 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -123,14 +123,6 @@ static const unsigned char *idregs[] = {
     pl111_id
 };
 
-#define BITS 8
-#include "pl110_template.h"
-#define BITS 15
-#include "pl110_template.h"
-#define BITS 16
-#include "pl110_template.h"
-#define BITS 24
-#include "pl110_template.h"
 #define BITS 32
 #include "pl110_template.h"
 
@@ -144,9 +136,7 @@ static void pl110_update_display(void *opaque)
     PL110State *s = (PL110State *)opaque;
     SysBusDevice *sbd;
     DisplaySurface *surface = qemu_console_surface(s->con);
-    drawfn* fntable;
     drawfn fn;
-    int dest_width;
     int src_width;
     int bpp_offset;
     int first;
@@ -158,33 +148,6 @@ static void pl110_update_display(void *opaque)
 
     sbd = SYS_BUS_DEVICE(s);
 
-    switch (surface_bits_per_pixel(surface)) {
-    case 0:
-        return;
-    case 8:
-        fntable = pl110_draw_fn_8;
-        dest_width = 1;
-        break;
-    case 15:
-        fntable = pl110_draw_fn_15;
-        dest_width = 2;
-        break;
-    case 16:
-        fntable = pl110_draw_fn_16;
-        dest_width = 2;
-        break;
-    case 24:
-        fntable = pl110_draw_fn_24;
-        dest_width = 3;
-        break;
-    case 32:
-        fntable = pl110_draw_fn_32;
-        dest_width = 4;
-        break;
-    default:
-        fprintf(stderr, "pl110: Bad color depth\n");
-        exit(1);
-    }
     if (s->cr & PL110_CR_BGR)
         bpp_offset = 0;
     else
@@ -218,12 +181,13 @@ static void pl110_update_display(void *opaque)
         }
     }
 
-    if (s->cr & PL110_CR_BEBO)
-        fn = fntable[s->bpp + 8 + bpp_offset];
-    else if (s->cr & PL110_CR_BEPO)
-        fn = fntable[s->bpp + 16 + bpp_offset];
-    else
-        fn = fntable[s->bpp + bpp_offset];
+    if (s->cr & PL110_CR_BEBO) {
+        fn = pl110_draw_fn_32[s->bpp + 8 + bpp_offset];
+    } else if (s->cr & PL110_CR_BEPO) {
+        fn = pl110_draw_fn_32[s->bpp + 16 + bpp_offset];
+    } else {
+        fn = pl110_draw_fn_32[s->bpp + bpp_offset];
+    }
 
     src_width = s->cols;
     switch (s->bpp) {
@@ -247,7 +211,6 @@ static void pl110_update_display(void *opaque)
         src_width <<= 2;
         break;
     }
-    dest_width *= s->cols;
     first = 0;
     if (s->invalidate) {
         framebuffer_update_memory_section(&s->fbsection,
@@ -258,7 +221,7 @@ static void pl110_update_display(void *opaque)
 
     framebuffer_update_display(surface, &s->fbsection,
                                s->cols, s->rows,
-                               src_width, dest_width, 0,
+                               src_width, s->cols * 4, 0,
                                s->invalidate,
                                fn, s->palette,
                                &first, &last);
-- 
2.20.1


