Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76AA318D1D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 15:17:48 +0100 (CET)
Received: from localhost ([::1]:48416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACmy-0008W6-0V
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 09:17:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACkr-0006XC-F4
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:15:38 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACkb-00074A-CW
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:15:35 -0500
Received: by mail-wm1-x329.google.com with SMTP id w4so5693756wmi.4
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 06:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1U3l2zceIjM766IxWu3mir7NDhJ/YG4xIbUPcO9sAsA=;
 b=Ql6GFARamNLhX8bsfG04cM9s1S4JYPtXPoeTpMCdJxoTI6B+tYnjsphpfFj5FaUMSd
 +pbRHO1ipA5T5D6pcDIvjrWZ2Sv/C8Uq/4MC3Mivok1QAl9czvepAr+2CPQMZmV0UhBk
 DppGUo1gPELoluKRhLhUE8RO26ZavsQumFHNP86lSY+9kOxYalpWaWmAnwgWWSNdh5v0
 +spRqBNocxszNH8wUMVYMCCco34YeUA0fGskfp+3J6JN6eipdkoqG3Dcj6xsTOfO/CEJ
 f7qXCowM7cToJ76Fh13LbIbpJVAv2hf//51uLn6LzCXiCz7UnrjU5FJAhSNzVPhQCmyK
 g/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1U3l2zceIjM766IxWu3mir7NDhJ/YG4xIbUPcO9sAsA=;
 b=LGXPjNCLXt2sB6xs+Q42LzosETsG/HsQLFNV0EOTx/ceMXgRaNnFXfrrt7KYBMzj6F
 vvcR5k0XAeylhEv86KHEGkNxmSNYVS8vIv9pQDz781HQ7OY6mgkL7bU2nFOPdXDvADBZ
 A/UyT4SXf0pTiJUaOh/JAjpbGU5vgzuvk53Cz5uqc3dFBbMefno6n39kxeeU4pN+9Equ
 WmWvIsoARDaxc2gfikLJVBo8dYN4rxMoKILIVBkVU/ziv4piXve95uKwD7zYrqRZNsgo
 pBfNm2vYo+PKa62w2ZZ4eJCkxgsPNDRkb1+8YAZEZVfngmf5k4g2mMz/yXJHu4HLFg2F
 a3tQ==
X-Gm-Message-State: AOAM533bho7AcdjKTuGfj5ezrxM4Yu2v8IlurTmpBVkXLFvqzy6wcARY
 j/OMzitIzy60JS0klxmH4A2gPgXRmZWnxg==
X-Google-Smtp-Source: ABdhPJxCp0F2JnN1oDAOeTHYG5fYYSFCPjyr+J6aEGkOQVdebxhaztTKcwnmWc6G7cFQZQ+qskAYXg==
X-Received: by 2002:a1c:bd55:: with SMTP id n82mr4369628wmf.93.1613052918291; 
 Thu, 11 Feb 2021 06:15:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5223291wrv.20.2021.02.11.06.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 06:15:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/9] hw/display/pl110: Remove dead code for non-32-bpp surfaces
Date: Thu, 11 Feb 2021 14:15:07 +0000
Message-Id: <20210211141515.8755-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211141515.8755-1-peter.maydell@linaro.org>
References: <20210211141515.8755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
surface is always 32 bits per pixel. Remove the legacy dead
code from the pl110 display device which was handling the
possibility that the console surface was some other format.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


