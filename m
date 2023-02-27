Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4106A4220
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:59:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWd5E-0003qY-Vx; Mon, 27 Feb 2023 07:58:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWd50-0003jv-WA; Mon, 27 Feb 2023 07:58:11 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWd4z-00070Z-2e; Mon, 27 Feb 2023 07:58:10 -0500
Received: by mail-ed1-x52c.google.com with SMTP id o15so22893177edr.13;
 Mon, 27 Feb 2023 04:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Lqzv22KvYd26WZBONiwLPN2WCs4CWG7bM0JqgVXsno=;
 b=Fl5Fxd6kLAb54EvxG1nqNwfaKbDFJLFEBluuFT0stt/PxcbhHvEIPK0Rij8q5Wvh+s
 VPNfXsv5I6Qymg9DxRz+3s3GDoSuVTw76MMMl5c+Vs3ButpneCbxbt15Wx6Z2jiE1X5l
 uUFjM7+VK4lTjWD5O7LVnwsdKI8kFwfjsUQ1eJNY4JAHyq8xfAwn8K30te0EPcYXBO5q
 bCS2HmOq/f7zQclUu6ZxwtHSZRLxt2qwrWHFO/xtUI6pTnrtPwnKEcWI4Iq9w9krM+/B
 QKathiHF5P8dfRxLtOPpfo4AaEHtu8R7ClcZdYH5JnztNKiYwHcHW6c1d2dm6mUYl2RN
 rGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Lqzv22KvYd26WZBONiwLPN2WCs4CWG7bM0JqgVXsno=;
 b=WKe1Fjb5TqrdsQ3ChQo/9e5EWj9SUI+etYsAE7FicjGQ0tbBFhlmrMzwXHQeu8vYqW
 m2+pNQvfHNeWzx6F27BY9JnWEYlDetrTRq/kH8Y41QOfCtt8wWIaRSgH/Ng6RAj3FAQR
 ZUPn2U0QMjct4bfYK1g7GQsDzorYiXUFlQvaa64U1RBEqGJ9N1ZymquU96b5zzTAoPNU
 yaXWadn400xYeL2HK6GJnNanmmMe4wXeCIF8+K9rkTqcYXzyGL5k6gO73aqxmzMacvbW
 Ls1CwoGwbbnT4G9wHC2YJP/2tR2Q4qEvSr+1Gd9iHdQqjsiN6tkiSoGKtBKsCVd6SPW8
 53Jg==
X-Gm-Message-State: AO0yUKUMwfyWJV11TSLq9bUhlHkutMvrqsesqiel3sJfEHOh77QeUu7m
 qdu5VR45EgTqSlNPKe1HQjeVadpYNDc=
X-Google-Smtp-Source: AK7set8tWl2Td1Fk3eBd2d1Mtd2rBNjzxyAIv6n6v1xEMgZ4tfN0MwQ5seKVV8YIl6cA7KEcdgcanA==
X-Received: by 2002:a17:907:d407:b0:878:711d:9310 with SMTP id
 vi7-20020a170907d40700b00878711d9310mr32723012ejc.1.1677502685888; 
 Mon, 27 Feb 2023 04:58:05 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-154-008.78.55.pool.telefonica.de. [78.55.154.8])
 by smtp.gmail.com with ESMTPSA id
 bk4-20020a170906b0c400b008d7a8083dffsm3186414ejb.222.2023.02.27.04.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 04:58:05 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Rene Engel <ReneEngel80@emailn.de>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v4 1/7] hw/display/sm501: Implement more 2D raster operations
Date: Mon, 27 Feb 2023 13:57:26 +0100
Message-Id: <20230227125732.20941-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227125732.20941-1-shentey@gmail.com>
References: <20230227125732.20941-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
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

Add simple implementation for two raster operations that are used by
AmigaOS which fixes graphics problems in some programs using these.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reported-by: Rene Engel <ReneEngel80@emailn.de>
Tested-by: Rene Engel <ReneEngel80@emailn.de>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <17ef3c59dc7868f75034e9ebe21e2999c8f718d4.1677445307.git.balaton@eik.bme.hu>
---
 hw/display/sm501.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index e1d0591d36..58bc9701ee 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -753,7 +753,7 @@ static void sm501_2d_operation(SM501State *s)
         }
 
         if ((rop_mode && rop == 0x5) || (!rop_mode && rop == 0x55)) {
-            /* Invert dest, is there a way to do this with pixman? */
+            /* DSTINVERT, is there a way to do this with pixman? */
             unsigned int x, y, i;
             uint8_t *d = s->local_mem + dst_base;
 
@@ -763,6 +763,34 @@ static void sm501_2d_operation(SM501State *s)
                     stn_he_p(&d[i], bypp, ~ldn_he_p(&d[i], bypp));
                 }
             }
+        } else if (!rop_mode && rop == 0x99) {
+            /* DSxn, is there a way to do this with pixman? */
+            unsigned int x, y, i, j;
+            uint8_t *sp = s->local_mem + src_base;
+            uint8_t *d = s->local_mem + dst_base;
+
+            for (y = 0; y < height; y++) {
+                i = (dst_x + (dst_y + y) * dst_pitch) * bypp;
+                j = (src_x + (src_y + y) * src_pitch) * bypp;
+                for (x = 0; x < width; x++, i += bypp, j += bypp) {
+                    stn_he_p(&d[i], bypp,
+                             ~(ldn_he_p(&sp[j], bypp) ^ ldn_he_p(&d[i], bypp)));
+                }
+            }
+        } else if (!rop_mode && rop == 0xee) {
+            /* SRCPAINT, is there a way to do this with pixman? */
+            unsigned int x, y, i, j;
+            uint8_t *sp = s->local_mem + src_base;
+            uint8_t *d = s->local_mem + dst_base;
+
+            for (y = 0; y < height; y++) {
+                i = (dst_x + (dst_y + y) * dst_pitch) * bypp;
+                j = (src_x + (src_y + y) * src_pitch) * bypp;
+                for (x = 0; x < width; x++, i += bypp, j += bypp) {
+                    stn_he_p(&d[i], bypp,
+                             ldn_he_p(&sp[j], bypp) | ldn_he_p(&d[i], bypp));
+                }
+            }
         } else {
             /* Do copy src for unimplemented ops, better than unpainted area */
             if ((rop_mode && (rop != 0xc || rop2_source_is_pattern)) ||
-- 
2.39.2


