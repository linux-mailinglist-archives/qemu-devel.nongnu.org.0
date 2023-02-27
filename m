Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C548F6A4505
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:46:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeCQ-0005TP-AS; Mon, 27 Feb 2023 09:09:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeCK-0005Im-Mm
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:48 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeCH-0000Xv-RH
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:48 -0500
Received: by mail-wr1-x431.google.com with SMTP id j2so6347210wrh.9
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=e7FA41agVqmKf8hhf61FgfCAFmlz8PJvwhU2DkO2De8=;
 b=CIfDnNlJWBrFJcqAe1Sy7pNFdMITwjf6b+KnYEoWvUcMj9XQUiKqD3F40e6ttPHBYr
 PM++b+elsUaEPlLdyfkEb84l+yirLpZUaVl/mVj7PiLgxajmty2ntXKh6nF+7LpwGWy0
 Sl3Bt1SoejQquzUgoW6Hf271wGpi3JIvpLrtZp4/nl3Y/stOqUHBA12X9BO6m+9M6NOm
 XRaBz0wXnC2cx7bWCTsmxZlm8XVHJhN5L9GOyL2PODKAbqVSiSvBy3rprDxewIdg+DzY
 frPTPAukJF4WxI5zbb8gasAiDnRiiDxH7ir2wdPP2J7LJzZUS7w21h3MUd/Z6vCTL24t
 +BRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e7FA41agVqmKf8hhf61FgfCAFmlz8PJvwhU2DkO2De8=;
 b=JLBwBbyPNOJkoMria4oCjerDere2mv3YPIMqEY5JI7N9CEZC6VER5ivNa+1GkShm6M
 +NR9EKr6KVOo9wL6+bo0oOIpXc0TnYhStkeuo69ZUsFJrbABnRKsiNjflBsRBkd+40Y0
 NWsaidkk0DVumWglsjMA3WpoXq9CGZ+0BPo2cJbZ0eJqzxtQOqttuCJ/bYGCoV/yUdz9
 Fei54EuPRryOc8Aw9v0rqjmyh3IaOdjRUqnqhC1ETPMpQ18H2XMYMyRC2CFb9ot65mr6
 GYuARomWay2FnrLXO66C9yNd8Xg0GHGMxhdqwKOuVIZHyeE79kttjau9w8WlhDudgmXE
 9ZlA==
X-Gm-Message-State: AO0yUKVyoLa+IlWYSGFK0mtOh2yJSAg7O60DXjqVZth124kpv3TsyNDY
 nU0TO6NGa0BZ3NZ9RwTUnHIcA2ZsOhJE/Ttz
X-Google-Smtp-Source: AK7set+pmxLctGYZwiarOu3hajOx8kgJiovKIaNxEdC6doNu30+jS+tSivUUELBTLHG6zmbklrt2tw==
X-Received: by 2002:adf:f7d1:0:b0:2c7:bd6:68fd with SMTP id
 a17-20020adff7d1000000b002c70bd668fdmr15074904wrq.47.1677506984721; 
 Mon, 27 Feb 2023 06:09:44 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a5d5309000000b002c70d269b4esm7123254wrv.91.2023.02.27.06.09.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:09:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 092/126] hw/display/sm501: Add fallbacks to pixman routines
Date: Mon, 27 Feb 2023 15:01:39 +0100
Message-Id: <20230227140213.35084-83-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Pixman may return false if it does not have a suitable implementation.
Add fallbacks to handle such cases.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reported-by: Rene Engel <ReneEngel80@emailn.de>
Tested-by: Rene Engel <ReneEngel80@emailn.de>
Message-Id: <20ed9442a0146238254ccc340c0d1efa226c6356.1677445307.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/sm501.c | 75 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 52 insertions(+), 23 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index c4c567d977..17835159fc 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -692,7 +692,7 @@ static void sm501_2d_operation(SM501State *s)
     unsigned int dst_pitch = (s->twoD_pitch >> 16) & 0x1FFF;
     int crt = (s->dc_crt_control & SM501_DC_CRT_CONTROL_SEL) ? 1 : 0;
     int fb_len = get_width(s, crt) * get_height(s, crt) * get_bpp(s, crt);
-    bool overlap = false;
+    bool overlap = false, fallback = false;
 
     if ((s->twoD_stretch >> 16) & 0xF) {
         qemu_log_mask(LOG_UNIMP, "sm501: only XY addressing is supported.\n");
@@ -835,25 +835,48 @@ static void sm501_2d_operation(SM501State *s)
                 if (tmp_stride * sizeof(uint32_t) * height > sizeof(tmp_buf)) {
                     tmp = g_malloc(tmp_stride * sizeof(uint32_t) * height);
                 }
-                pixman_blt((uint32_t *)&s->local_mem[src_base], tmp,
-                           src_pitch * bypp / sizeof(uint32_t),
-                           tmp_stride, 8 * bypp, 8 * bypp,
-                           src_x, src_y, 0, 0, width, height);
-                pixman_blt(tmp, (uint32_t *)&s->local_mem[dst_base],
-                           tmp_stride,
-                           dst_pitch * bypp / sizeof(uint32_t),
-                           8 * bypp, 8 * bypp,
-                           0, 0, dst_x, dst_y, width, height);
+                fallback = !pixman_blt((uint32_t *)&s->local_mem[src_base],
+                                       tmp,
+                                       src_pitch * bypp / sizeof(uint32_t),
+                                       tmp_stride,
+                                       8 * bypp, 8 * bypp,
+                                       src_x, src_y, 0, 0, width, height);
+                if (!fallback) {
+                    fallback = !pixman_blt(tmp,
+                                       (uint32_t *)&s->local_mem[dst_base],
+                                       tmp_stride,
+                                       dst_pitch * bypp / sizeof(uint32_t),
+                                       8 * bypp, 8 * bypp,
+                                       0, 0, dst_x, dst_y, width, height);
+                }
                 if (tmp != tmp_buf) {
                     g_free(tmp);
                 }
             } else {
-                pixman_blt((uint32_t *)&s->local_mem[src_base],
-                           (uint32_t *)&s->local_mem[dst_base],
-                           src_pitch * bypp / sizeof(uint32_t),
-                           dst_pitch * bypp / sizeof(uint32_t),
-                           8 * bypp, 8 * bypp,
-                           src_x, src_y, dst_x, dst_y, width, height);
+                fallback = !pixman_blt((uint32_t *)&s->local_mem[src_base],
+                                       (uint32_t *)&s->local_mem[dst_base],
+                                       src_pitch * bypp / sizeof(uint32_t),
+                                       dst_pitch * bypp / sizeof(uint32_t),
+                                       8 * bypp, 8 * bypp, src_x, src_y,
+                                       dst_x, dst_y, width, height);
+            }
+            if (fallback) {
+                uint8_t *sp = s->local_mem + src_base;
+                uint8_t *d = s->local_mem + dst_base;
+                unsigned int y, i, j;
+                for (y = 0; y < height; y++) {
+                    if (overlap) { /* overlap also means rtl */
+                        i = (dst_y + height - 1 - y) * dst_pitch;
+                        i = (dst_x + i) * bypp;
+                        j = (src_y + height - 1 - y) * src_pitch;
+                        j = (src_x + j) * bypp;
+                        memmove(&d[i], &sp[j], width * bypp);
+                    } else {
+                        i = (dst_x + (dst_y + y) * dst_pitch) * bypp;
+                        j = (src_x + (src_y + y) * src_pitch) * bypp;
+                        memcpy(&d[i], &sp[j], width * bypp);
+                    }
+                }
             }
         }
         break;
@@ -868,13 +891,19 @@ static void sm501_2d_operation(SM501State *s)
             color = cpu_to_le16(color);
         }
 
-        if (width == 1 && height == 1) {
-            unsigned int i = (dst_x + dst_y * dst_pitch) * bypp;
-            stn_he_p(&s->local_mem[dst_base + i], bypp, color);
-        } else {
-            pixman_fill((uint32_t *)&s->local_mem[dst_base],
-                        dst_pitch * bypp / sizeof(uint32_t),
-                        8 * bypp, dst_x, dst_y, width, height, color);
+        if ((width == 1 && height == 1) ||
+            !pixman_fill((uint32_t *)&s->local_mem[dst_base],
+                         dst_pitch * bypp / sizeof(uint32_t), 8 * bypp,
+                         dst_x, dst_y, width, height, color)) {
+            /* fallback when pixman failed or we don't want to call it */
+            uint8_t *d = s->local_mem + dst_base;
+            unsigned int x, y, i;
+            for (y = 0; y < height; y++, i += dst_pitch * bypp) {
+                i = (dst_x + (dst_y + y) * dst_pitch) * bypp;
+                for (x = 0; x < width; x++, i += bypp) {
+                    stn_he_p(&d[i], bypp, color);
+                }
+            }
         }
         break;
     }
-- 
2.38.1


