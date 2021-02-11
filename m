Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98356318D1C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 15:17:48 +0100 (CET)
Received: from localhost ([::1]:48138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACmx-0008OW-Ly
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 09:17:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACl0-0006Xt-AC
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:15:48 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:40487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACkb-00074J-C8
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:15:40 -0500
Received: by mail-wm1-x335.google.com with SMTP id o24so5889230wmh.5
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 06:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7eOlTk2qrx8/UrDgQ0CzyBOLoXb5mii0mWS5SmQs9Vk=;
 b=wMYPzBbEp0b3jaAQyRoAgbHq61Tg5zHYmLZrCBICQnyGHmM9X+huDXNHU9s/IpDoLd
 9eO8p3ud7PZFDbVnVpao4/tVOrmD6+oghWBej3NE+ojIN6vgtOKRRUrZmwf8ZRozdNTn
 aru7IPHwgNBneb5jLdgkf1YK1IOJ+4c90zDMlXR4w+esnokUuobEDwKdRIGSEX8osV3k
 TgvNWX0JrB52InpHb1Ip34vC+T0uWRmosEddl8FbZaC4G6101R11WMl0tWSyq1lNlyOl
 CiOUodBtfKre4nlKpc/tcOpXeq6vvFdiJBO8NKl8eMwwMpQbawScq828R0tdxX9Gp8Ei
 JC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7eOlTk2qrx8/UrDgQ0CzyBOLoXb5mii0mWS5SmQs9Vk=;
 b=cr356uObRyw+WGzs/sErpJ7ihaR/Isk/yfql0MZCbnu3T3/r7Vwwg4EWXpRhgXSFTq
 mUk3EQk1wRwfjfH4kqTvdpl0yFJ6bfyvLvvkOXtYHZM9EIEX7zptW2CDp2/md+kP1NSU
 35QYjVz0TNCxCabKrYeNwJwaBpOjzSTAiYDyoWismAWdgyeBnBgIcnfiZYwt2ZJWIDR5
 UfcNQShJW4CEElj3eCBFWgej5laPSv3H9YtITLqydDFDxwL98xFd0N6Gt/CUZDrttwfC
 VniBru8TPgV2sbGcFP9lKhghuPo8UosfTzt40v4e1EnSX8prIETaCpP/OTBrXy4izmvL
 1c3g==
X-Gm-Message-State: AOAM530S5+MQ5YAdv2VHNRppt/31d4xUPAnJGKOA1CTy4mo0ReeB5Qa/
 zeV0KncrGMbqZBvouNh12NmJiw==
X-Google-Smtp-Source: ABdhPJwh1uksk+d4CsVCZAvA17iaLttunr1Vu5YO1vl0s1KEcFi6UcJGJcQH3+q2Z/wVFP73q+R0tg==
X-Received: by 2002:a7b:cb05:: with SMTP id u5mr5307374wmj.140.1613052919109; 
 Thu, 11 Feb 2021 06:15:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5223291wrv.20.2021.02.11.06.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 06:15:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/9] hw/display/pl110: Pull included-once parts of template
 header into pl110.c
Date: Thu, 11 Feb 2021 14:15:08 +0000
Message-Id: <20210211141515.8755-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211141515.8755-1-peter.maydell@linaro.org>
References: <20210211141515.8755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

The pl110_template.h header has a doubly-nested multiple-include pattern:
 * pl110.c includes it once for each host bit depth (now always 32)
 * every time it is included, it includes itself 6 times, to account
   for multiple guest device pixel and byte orders

Now we only have to deal with 32-bit host bit depths, we can move the
code corresponding to the outer layer of this double-nesting to be
directly in pl110.c and reduce the template header to a single layer
of nesting.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/pl110_template.h | 100 +-----------------------------------
 hw/display/pl110.c          |  79 ++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+), 99 deletions(-)

diff --git a/hw/display/pl110_template.h b/hw/display/pl110_template.h
index 36ba791c6fd..0d8471db636 100644
--- a/hw/display/pl110_template.h
+++ b/hw/display/pl110_template.h
@@ -10,105 +10,9 @@
  */
 
 #ifndef ORDER
-
-#if BITS == 8
-#define COPY_PIXEL(to, from) *(to++) = from
-#elif BITS == 15 || BITS == 16
-#define COPY_PIXEL(to, from) do { *(uint16_t *)to = from; to += 2; } while (0)
-#elif BITS == 24
-#define COPY_PIXEL(to, from)    \
-    do {                        \
-        *(to++) = from;         \
-        *(to++) = (from) >> 8;  \
-        *(to++) = (from) >> 16; \
-    } while (0)
-#elif BITS == 32
-#define COPY_PIXEL(to, from) do { *(uint32_t *)to = from; to += 4; } while (0)
-#else
-#error unknown bit depth
+#error "pl110_template.h is only for inclusion by pl110.c"
 #endif
 
-#undef RGB
-#define BORDER bgr
-#define ORDER 0
-#include "pl110_template.h"
-#define ORDER 1
-#include "pl110_template.h"
-#define ORDER 2
-#include "pl110_template.h"
-#undef BORDER
-#define RGB
-#define BORDER rgb
-#define ORDER 0
-#include "pl110_template.h"
-#define ORDER 1
-#include "pl110_template.h"
-#define ORDER 2
-#include "pl110_template.h"
-#undef BORDER
-
-static drawfn glue(pl110_draw_fn_,BITS)[48] =
-{
-    glue(pl110_draw_line1_lblp_bgr,BITS),
-    glue(pl110_draw_line2_lblp_bgr,BITS),
-    glue(pl110_draw_line4_lblp_bgr,BITS),
-    glue(pl110_draw_line8_lblp_bgr,BITS),
-    glue(pl110_draw_line16_555_lblp_bgr,BITS),
-    glue(pl110_draw_line32_lblp_bgr,BITS),
-    glue(pl110_draw_line16_lblp_bgr,BITS),
-    glue(pl110_draw_line12_lblp_bgr,BITS),
-
-    glue(pl110_draw_line1_bbbp_bgr,BITS),
-    glue(pl110_draw_line2_bbbp_bgr,BITS),
-    glue(pl110_draw_line4_bbbp_bgr,BITS),
-    glue(pl110_draw_line8_bbbp_bgr,BITS),
-    glue(pl110_draw_line16_555_bbbp_bgr,BITS),
-    glue(pl110_draw_line32_bbbp_bgr,BITS),
-    glue(pl110_draw_line16_bbbp_bgr,BITS),
-    glue(pl110_draw_line12_bbbp_bgr,BITS),
-
-    glue(pl110_draw_line1_lbbp_bgr,BITS),
-    glue(pl110_draw_line2_lbbp_bgr,BITS),
-    glue(pl110_draw_line4_lbbp_bgr,BITS),
-    glue(pl110_draw_line8_lbbp_bgr,BITS),
-    glue(pl110_draw_line16_555_lbbp_bgr,BITS),
-    glue(pl110_draw_line32_lbbp_bgr,BITS),
-    glue(pl110_draw_line16_lbbp_bgr,BITS),
-    glue(pl110_draw_line12_lbbp_bgr,BITS),
-
-    glue(pl110_draw_line1_lblp_rgb,BITS),
-    glue(pl110_draw_line2_lblp_rgb,BITS),
-    glue(pl110_draw_line4_lblp_rgb,BITS),
-    glue(pl110_draw_line8_lblp_rgb,BITS),
-    glue(pl110_draw_line16_555_lblp_rgb,BITS),
-    glue(pl110_draw_line32_lblp_rgb,BITS),
-    glue(pl110_draw_line16_lblp_rgb,BITS),
-    glue(pl110_draw_line12_lblp_rgb,BITS),
-
-    glue(pl110_draw_line1_bbbp_rgb,BITS),
-    glue(pl110_draw_line2_bbbp_rgb,BITS),
-    glue(pl110_draw_line4_bbbp_rgb,BITS),
-    glue(pl110_draw_line8_bbbp_rgb,BITS),
-    glue(pl110_draw_line16_555_bbbp_rgb,BITS),
-    glue(pl110_draw_line32_bbbp_rgb,BITS),
-    glue(pl110_draw_line16_bbbp_rgb,BITS),
-    glue(pl110_draw_line12_bbbp_rgb,BITS),
-
-    glue(pl110_draw_line1_lbbp_rgb,BITS),
-    glue(pl110_draw_line2_lbbp_rgb,BITS),
-    glue(pl110_draw_line4_lbbp_rgb,BITS),
-    glue(pl110_draw_line8_lbbp_rgb,BITS),
-    glue(pl110_draw_line16_555_lbbp_rgb,BITS),
-    glue(pl110_draw_line32_lbbp_rgb,BITS),
-    glue(pl110_draw_line16_lbbp_rgb,BITS),
-    glue(pl110_draw_line12_lbbp_rgb,BITS),
-};
-
-#undef BITS
-#undef COPY_PIXEL
-
-#else
-
 #if ORDER == 0
 #define NAME glue(glue(lblp_, BORDER), BITS)
 #ifdef HOST_WORDS_BIGENDIAN
@@ -395,5 +299,3 @@ static void glue(pl110_draw_line12_,NAME)(void *opaque, uint8_t *d, const uint8_
 #undef NAME
 #undef SWAP_WORDS
 #undef ORDER
-
-#endif
diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index a0d4126ce7f..ce300662e8b 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -124,7 +124,86 @@ static const unsigned char *idregs[] = {
 };
 
 #define BITS 32
+#define COPY_PIXEL(to, from) do { *(uint32_t *)to = from; to += 4; } while (0)
+
+#undef RGB
+#define BORDER bgr
+#define ORDER 0
 #include "pl110_template.h"
+#define ORDER 1
+#include "pl110_template.h"
+#define ORDER 2
+#include "pl110_template.h"
+#undef BORDER
+#define RGB
+#define BORDER rgb
+#define ORDER 0
+#include "pl110_template.h"
+#define ORDER 1
+#include "pl110_template.h"
+#define ORDER 2
+#include "pl110_template.h"
+#undef BORDER
+
+static drawfn pl110_draw_fn_32[48] = {
+    pl110_draw_line1_lblp_bgr32,
+    pl110_draw_line2_lblp_bgr32,
+    pl110_draw_line4_lblp_bgr32,
+    pl110_draw_line8_lblp_bgr32,
+    pl110_draw_line16_555_lblp_bgr32,
+    pl110_draw_line32_lblp_bgr32,
+    pl110_draw_line16_lblp_bgr32,
+    pl110_draw_line12_lblp_bgr32,
+
+    pl110_draw_line1_bbbp_bgr32,
+    pl110_draw_line2_bbbp_bgr32,
+    pl110_draw_line4_bbbp_bgr32,
+    pl110_draw_line8_bbbp_bgr32,
+    pl110_draw_line16_555_bbbp_bgr32,
+    pl110_draw_line32_bbbp_bgr32,
+    pl110_draw_line16_bbbp_bgr32,
+    pl110_draw_line12_bbbp_bgr32,
+
+    pl110_draw_line1_lbbp_bgr32,
+    pl110_draw_line2_lbbp_bgr32,
+    pl110_draw_line4_lbbp_bgr32,
+    pl110_draw_line8_lbbp_bgr32,
+    pl110_draw_line16_555_lbbp_bgr32,
+    pl110_draw_line32_lbbp_bgr32,
+    pl110_draw_line16_lbbp_bgr32,
+    pl110_draw_line12_lbbp_bgr32,
+
+    pl110_draw_line1_lblp_rgb32,
+    pl110_draw_line2_lblp_rgb32,
+    pl110_draw_line4_lblp_rgb32,
+    pl110_draw_line8_lblp_rgb32,
+    pl110_draw_line16_555_lblp_rgb32,
+    pl110_draw_line32_lblp_rgb32,
+    pl110_draw_line16_lblp_rgb32,
+    pl110_draw_line12_lblp_rgb32,
+
+    pl110_draw_line1_bbbp_rgb32,
+    pl110_draw_line2_bbbp_rgb32,
+    pl110_draw_line4_bbbp_rgb32,
+    pl110_draw_line8_bbbp_rgb32,
+    pl110_draw_line16_555_bbbp_rgb32,
+    pl110_draw_line32_bbbp_rgb32,
+    pl110_draw_line16_bbbp_rgb32,
+    pl110_draw_line12_bbbp_rgb32,
+
+    pl110_draw_line1_lbbp_rgb32,
+    pl110_draw_line2_lbbp_rgb32,
+    pl110_draw_line4_lbbp_rgb32,
+    pl110_draw_line8_lbbp_rgb32,
+    pl110_draw_line16_555_lbbp_rgb32,
+    pl110_draw_line32_lbbp_rgb32,
+    pl110_draw_line16_lbbp_rgb32,
+    pl110_draw_line12_lbbp_rgb32,
+};
+
+#undef BITS
+#undef COPY_PIXEL
+
 
 static int pl110_enabled(PL110State *s)
 {
-- 
2.20.1


