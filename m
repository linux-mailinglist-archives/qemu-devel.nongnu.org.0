Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3533700BF9
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:36:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUmz-0003JX-4K; Fri, 12 May 2023 11:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmw-0003IQ-VN
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:34 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmu-00060m-6B
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:34 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3075e802738so9192666f8f.1
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 08:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683905669; x=1686497669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ksHar8N+0Wuxm9xVK5IpU2NDqipg/hiJLw1bDCUtaPM=;
 b=NOeqPaeFJJJrEDnI4SRd6qZTnHP6mi26ucC2OcXIokEeHf1Ji4QXKp/yLdrCHAi+Pc
 QAJq6BwtD6yJz1ZQa1yTkSnDHxpXl8BPUzZGKlGk9BZAoFGSLmSj4dkha2oUNTkV/FY7
 OobW/aoslaoqnuzrlklO6i7XuyfSxcUB3hYjZODjtBM+eW1EwNW5TNp3VF1So7S1SoVR
 ztnDv6t/JJwwZN3iuqKum62dFHoL9CXFlOOhA0YmfiFkduitZQ7582OcJ6/+HAGGy0PJ
 /3AxS7mffuvWw+SI4pgkPog/y0IbB9013o9L9JW2so5z16ofSd+HZb+Eh/Il5JqfSNM/
 1bLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683905669; x=1686497669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ksHar8N+0Wuxm9xVK5IpU2NDqipg/hiJLw1bDCUtaPM=;
 b=Vy7ClWlBKBH3QPqi5tH6ffSJuPNdcA795cc8+QHKZQYiH6wWUBHZR3lv9teMRPYUFm
 3QCL56sJTLuUKeXE85G+kPVCStb8kS4UQ8ZOZw4rdPO7JD0u01VIPDHlkLqqhBEQwiY+
 bfgUQ4kLgPaFeMNzT3DR0ajyCsSyukdobUGgnkoQtRET+yvKe15qHOJtqbGTPRdBTyqI
 YKm3DndIc6gYuHVGXDCi0DlDZPvlsdq8WBbO8KuT1N3j0izPiaZ6jY8R8daqkWht6Xd2
 u7vtl5TvS/rgJw77ZpmkaknRvwLRCR2f9JF9l5pt0WfcxhaPGsyIX2PyJNP8yH4b/g/X
 qarg==
X-Gm-Message-State: AC+VfDx1uv+eJVXosyihrEqhZrvS/hQhFlpk6nYLaAjbQglF/nOZiKXM
 wgG40rs7KGO2fbpXvgNsch+xZu9HLs/h4x414Dk=
X-Google-Smtp-Source: ACHHUZ7haJuiWfHKDKkA6JdPF/D5e8kHm8OGFKyf1ss7rpnnNBhtlJ7cdw5dI0syU5IMfCMzDCSGHw==
X-Received: by 2002:a05:6000:10a:b0:306:29f9:ab47 with SMTP id
 o10-20020a056000010a00b0030629f9ab47mr17982594wrx.49.1683905668934; 
 Fri, 12 May 2023 08:34:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b002feea065cc9sm11721297wro.111.2023.05.12.08.34.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 08:34:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/12] ui: Fix pixel colour channel order for PNG screenshots
Date: Fri, 12 May 2023 16:34:17 +0100
Message-Id: <20230512153423.3704893-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512153423.3704893-1-peter.maydell@linaro.org>
References: <20230512153423.3704893-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
idea differ.  PIXMAN_a8r8g8b8 defines that pixels are 32-bit values,
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
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-id: 20230502135548.2451309-1-peter.maydell@linaro.org
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


