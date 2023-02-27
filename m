Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8362A6A4224
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:00:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWd5D-0003pT-Lt; Mon, 27 Feb 2023 07:58:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWd51-0003jw-17; Mon, 27 Feb 2023 07:58:11 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWd4z-00070q-6S; Mon, 27 Feb 2023 07:58:10 -0500
Received: by mail-ed1-x536.google.com with SMTP id h16so25328387edz.10;
 Mon, 27 Feb 2023 04:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qhpe+xXQXqVggEkdge6NZga40k7yps9fWCoPkwYceTE=;
 b=kMElmYZzgkl97xMT3WgUs0OC0x4Wqx4bH2vot1Th2ormtYt12L8jSO1Y5e3aFiuiz8
 6ePdW921JmZgGKNtWG1YtfXzxmoaQJHl4dB7jJMREu4OU+k01e+RCQoQIFdzn7KBcEfp
 3GyqpBOd6NODSascPimNNM7fADhRjCV6Go0AL6xr8n5NFJG3wkFpAJboY7NDJqXHLBNe
 9WXYiqm1VuADw9JzT8mDcf/zYpaYhB0Cv4Xng2i9g/bW5i0PLoQx3D6EgoxeIk2LT1+k
 bH/PBsNcEU/uXxkGN2BxtIJhuWDryzX+x4SqwJwvoG5xFQ+9URZNhnYlZEQaMSFdGy+y
 tU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qhpe+xXQXqVggEkdge6NZga40k7yps9fWCoPkwYceTE=;
 b=AqsJjbcB0ENEAG3nhKNuzUyFMO+/W+MAPnpmzT4N7Gw1TeU2dLFUN4Kg2t8b5xYTlm
 BDPN8n2sb0YtmNGmrjXe92SGqv3zJ8Aywg/TkEe5ZGxVx04xULhZ7DvpWswxrRDk5Xot
 KJd2OaAlZZb2xOlkRQ4z7j7NF7pcH7vB9a9bRdVfAU+49OzSqUT8YDjW7e25qNPMJLO5
 IaHd/hhqM5hKNJuEGLb8ZbnQifX1El8KQ5S6pye72outybwoj1huxuEFU/N/eYB65ILN
 vthP66VkEskDy8f3L5Vb6Pqd6O9632KdZj03Rof2tYhK4fXyl74PgFcnEQ76vjNJZq+a
 NQow==
X-Gm-Message-State: AO0yUKWzmnrg1XbNcitiu+shGtxzg6O2P13P220XD+F4vrAFKKymEqRx
 Aif13cCg3nDPA4yabnHX23Ib/8qSm6M=
X-Google-Smtp-Source: AK7set/inonx7tGCnqRkro1CQInLjItYtaOqF2P63AVmE/DHEKWEUTQhtpQCgOYuooAYKj7NLoK0vA==
X-Received: by 2002:a17:906:55d2:b0:878:7a0e:5730 with SMTP id
 z18-20020a17090655d200b008787a0e5730mr34912816ejp.56.1677502686800; 
 Mon, 27 Feb 2023 04:58:06 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-154-008.78.55.pool.telefonica.de. [78.55.154.8])
 by smtp.gmail.com with ESMTPSA id
 bk4-20020a170906b0c400b008d7a8083dffsm3186414ejb.222.2023.02.27.04.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 04:58:06 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Rene Engel <ReneEngel80@emailn.de>
Subject: [PATCH v4 2/7] hw/display/sm501: Add fallbacks to pixman routines
Date: Mon, 27 Feb 2023 13:57:27 +0100
Message-Id: <20230227125732.20941-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227125732.20941-1-shentey@gmail.com>
References: <20230227125732.20941-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
---
 hw/display/sm501.c | 75 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 52 insertions(+), 23 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 58bc9701ee..23c4418e19 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -691,7 +691,7 @@ static void sm501_2d_operation(SM501State *s)
     unsigned int dst_pitch = (s->twoD_pitch >> 16) & 0x1FFF;
     int crt = (s->dc_crt_control & SM501_DC_CRT_CONTROL_SEL) ? 1 : 0;
     int fb_len = get_width(s, crt) * get_height(s, crt) * get_bpp(s, crt);
-    bool overlap = false;
+    bool overlap = false, fallback = false;
 
     if ((s->twoD_stretch >> 16) & 0xF) {
         qemu_log_mask(LOG_UNIMP, "sm501: only XY addressing is supported.\n");
@@ -834,25 +834,48 @@ static void sm501_2d_operation(SM501State *s)
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
@@ -867,13 +890,19 @@ static void sm501_2d_operation(SM501State *s)
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
2.39.2


