Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2646F459D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 15:57:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptqU0-0000Fl-Dq; Tue, 02 May 2023 09:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptqTx-0000F2-Ui
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:55:53 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptqTw-00037H-6Z
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:55:53 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f19a80a330so23313035e9.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 06:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683035750; x=1685627750;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+zLPJoePh+WgFj8dLn/J1noNQP1KAN6O873azoX70Vs=;
 b=NL+qWRV7S3Y1ei4RuaNZc6WuSdeDmMDItklnRKjxUfzBiZRvyqeU6mhXYNcDzRHymM
 5GofJE2+AKb2sa662GRKXmfAXNdy83thOTP9J9sJArN0It+UzqpbAKF5MEP4mRtK+3jl
 T2lo82OtEx8WL4j+SSSSVVhA1T4v8r4qbmMKYM8cQ8mdHXEpopaE3H13KK96R3XJKC41
 KcoIuyaPRa7s1+ys2fQ9mJDHTCUnKjDLY07Oit5voa4EILEgbgN5t9eYSm2+enVoUe8n
 2+uN4qKCI6pYxOLvkvTo/u98o4mBwFZzd8gSgmQRkqVgd7zibKB3EwKRDFWeOpB5u5dp
 IFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683035750; x=1685627750;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+zLPJoePh+WgFj8dLn/J1noNQP1KAN6O873azoX70Vs=;
 b=FM4GlVFcDhcbwhtw4I1qBYi/OW4lpTklLnMiiJtKdlzLslvE/jmRfYw/or6cQ57k+G
 OZkNXtZPXneS4ViWz2QZrqrZivwfIyu7Yk4o7Cy66TcZB0ZIegMbXHskhjL+optzNlgD
 f2WLq3M7Rc0/PFnbLzprTIUZPiwAdoagpDA4TvKWAM5cxP+xunApxr6j1BOpBT/wiMyE
 +PW54U9oZ6iWIvLpQeLYtlFQTT/Bjmr2+GMoz/I4ujhk7lcmmHTb8PhZDGmUY/qdlvZ/
 FCGQVbvs4nPLxDHn0AiEx1OnSzjZk46xr07COeLZryzM/Yb4+eXaTAIXY/cMY8AdcOz3
 r7dw==
X-Gm-Message-State: AC+VfDy7kMsvl2OKQNivQfyzo8ugOluruhHLurSZOUMeKP3jjJIS+bT1
 xd0PU0YadkBzvY98gKEjYyFlgXbzD0Iu/SmNarc=
X-Google-Smtp-Source: ACHHUZ4i/6Z8MpGXqacrU4SfT1yG24lHn3lYJngh/s9x6bf+bvjUKPGwKUTHTuPEaKam3eC2vDEdjw==
X-Received: by 2002:a1c:ed0e:0:b0:3f1:800f:cc61 with SMTP id
 l14-20020a1ced0e000000b003f1800fcc61mr12132073wmh.13.1683035750524; 
 Tue, 02 May 2023 06:55:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c4fc200b003f1738e64c0sm39277008wmq.20.2023.05.02.06.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 06:55:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kshitij Suri <kshitij.suri@nutanix.com>
Subject: [PATCH] ui: Fix pixel colour channel order for PNG screenshots
Date: Tue,  2 May 2023 14:55:48 +0100
Message-Id: <20230502135548.2451309-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

When we take a PNG screenshot the ordering of the colour channels in
the data is not correct, resulting in the image having weird
colouring compared to the actual display.  (Specifically, on a
little-endian host the blue and red channels are swapped; on
big-endian everything is wrong.)

This happens because the pixman idea of the pixel data and the libpng
idea differ.  PIXMAN_a9r8g8b8 defines that pixels are 32-bit values,
with A in bits 24-31, R in bits 16-23, G in bits 8-15 and B in bits
0-7.  This means that on little-endian systems the bytes in memory
are
   B G R A
and on big-endian systems they are
   A R G B

libpng, on the other hand, thinks of pixels as being a series of
values for each channel, so its format PNG_COLOR_TYPE_RGB_ALPHA
always wants bytes in the order
   R G B A

This isn't the same as the pixman order for either big or little
endian hosts.

The alpha channel is also unnecessary bulk in the output PNG file,
because there is no alpha information in a screenshot.

To handle the endianness issue, we already define in ui/qemu-pixman.h
various PIXMAN_BE_* and PIXMAN_LE_* values that give consistent
byte-order pixel channel formats.  So we can use PIXMAN_BE_r8g8b8 and
PNG_COLOR_TYPE_RGB, which both have an in-memory byte order of
    R G B
and 3 bytes per pixel.

(PPM format screenshots get this right; they already use the
PIXMAN_BE_r8g8b8 format.)

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1622
Fixes: 9a0a119a382867 ("Added parameter to take screenshot with screendump as PNG")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Disclaimer: I don't have a BE system that I have convenient
graphics output from that I can use to test the screenshot
format there.
---
 ui/console.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 6e8a3cdc62d..e173731e205 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -311,7 +311,7 @@ static bool png_save(int fd, pixman_image_t *image, Error **errp)
     png_struct *png_ptr;
     png_info *info_ptr;
     g_autoptr(pixman_image_t) linebuf =
-                            qemu_pixman_linebuf_create(PIXMAN_a8r8g8b8, width);
+        qemu_pixman_linebuf_create(PIXMAN_BE_r8g8b8, width);
     uint8_t *buf = (uint8_t *)pixman_image_get_data(linebuf);
     FILE *f = fdopen(fd, "wb");
     int y;
@@ -341,7 +341,7 @@ static bool png_save(int fd, pixman_image_t *image, Error **errp)
     png_init_io(png_ptr, f);
 
     png_set_IHDR(png_ptr, info_ptr, width, height, 8,
-                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
+                 PNG_COLOR_TYPE_RGB, PNG_INTERLACE_NONE,
                  PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
 
     png_write_info(png_ptr, info_ptr);
-- 
2.34.1


