Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D706A42E4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:36:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdeY-0005F0-LP; Mon, 27 Feb 2023 08:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWddv-0004zc-IE; Mon, 27 Feb 2023 08:34:24 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWddo-0007eb-Qe; Mon, 27 Feb 2023 08:34:13 -0500
Received: by mail-ed1-x535.google.com with SMTP id o12so25781433edb.9;
 Mon, 27 Feb 2023 05:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Lqzv22KvYd26WZBONiwLPN2WCs4CWG7bM0JqgVXsno=;
 b=nuo2CveytfjAXGT5pVJ0vSsWFFOOSCNeaBKGMqLZjsg92D28UkimNplFlynr3JUWX6
 i9Aveg4abv2vfjObyop4yZkh4T+LP9HtTaaTSDW/iHTjU/vDblZbTsNbJD9d/g+M6dFh
 LsCMhl3iKYrK31ibeqrUqfraNhcmGKnqEGmk88UGIeXQwFR3+3RQXYbXRtcUn/vx+Q3g
 HVGXpdTlowNU21HFZu88kKEho2dEDAzfc+c99QK6UwfZk9TGcdFiSyRu37w7dywZD05X
 dzzhRCrziKefpj+h6urlzLN5UVqmgLvKMp6c3GjgkFEyNk9IC0N+xh5lIse6yE/b+G9S
 dnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Lqzv22KvYd26WZBONiwLPN2WCs4CWG7bM0JqgVXsno=;
 b=SqXADK0NHW1w1VRsJP/UuQZCkATajCI/SJed/mRw94fs0OKCphNM9zdv1uOot4Y3O/
 lz3TBE/4B0hpJPBhHlraCqULeQXrDksOAT1cItmbkORK5XzYVfpqiOyu6pziTG98XQCJ
 7rkpT9cH0ek44MEIu/muqk6P7WD4poAU/Ca/69CghVyGzGIsezjjNc9Og7qm9kRWth3b
 FkmPYP6ZCo+SnI0g44NZ0RpVADBW2r7ZTMKyLb8yVbk6kcVDhAmAIu0Inl1ygHIg1kjj
 liO/C7eDiTKqw3VlPQlCTjT2K1Xat7BFHd9dbuIIOI9EV9UGjYp6mshd13baFaGpU+k1
 Uaag==
X-Gm-Message-State: AO0yUKWsaGPFsMyLcx0TZiiI57LFH4rexC76ckGaaCweNQaU3ZkrjCMq
 fo+B0W8WXig4O6f73AfIlFnsD+dVI5k=
X-Google-Smtp-Source: AK7set965rrO8OqvvVKqbc2Oivr8UkYH7Vt+MrC5I2N7iwamiArLHohjZJhQ/Egbk9A6Cdo0cFWg4w==
X-Received: by 2002:a17:907:1c14:b0:8f0:143d:ee34 with SMTP id
 nc20-20020a1709071c1400b008f0143dee34mr9829024ejc.1.1677504837992; 
 Mon, 27 Feb 2023 05:33:57 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-154-008.78.55.pool.telefonica.de. [78.55.154.8])
 by smtp.gmail.com with ESMTPSA id
 gx16-20020a1709068a5000b008b69aa62efcsm3253603ejc.62.2023.02.27.05.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 05:33:57 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Huacai Chen <chenhuacai@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rene Engel <ReneEngel80@emailn.de>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v4 1/7] hw/display/sm501: Implement more 2D raster operations
Date: Mon, 27 Feb 2023 14:33:19 +0100
Message-Id: <20230227133325.22023-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227133325.22023-1-shentey@gmail.com>
References: <20230227133325.22023-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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


