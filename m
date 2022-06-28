Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0321855BE6A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:17:09 +0200 (CEST)
Received: from localhost ([::1]:43744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o63b1-0001pk-VL
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62nk-0000Lg-Dg
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:26:12 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62ni-0004O3-Is
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:26:11 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so14578196pjl.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0UlDy0s46WXVhDokiQ6HI/w5EEoWJmV5q8PtzjD7erw=;
 b=DyzmU2Y6oSr+sKvo7u70OQ9WghlNaAGbXQG7unBCBgkO+K5z+sNqXWSHoUM6ST/Vez
 dTFq8/JFQJpQZvsZXsl5MSYwH5uBTEUiKRnV/pxT8VTzvjIxwimita7rkeYre2zP0NKq
 nbjrY205dYmOM68tzO1EV/CEdShtesAk7EbSNyzI5cwni8uAMS5+aFR0+P+ULPBjlpqZ
 WnbF5jQGdvBsbgWTyA/AduPCYG4t3p8LszOWxK1Qf3UEhMigzaN0ka4UIJqmkSaMNI6C
 d4VBCc/zpUSzx4TP24R6TgHibe9MvJWumHlCmOv2qFAGBzQkEYct7darvjoTmmh/1o74
 pXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0UlDy0s46WXVhDokiQ6HI/w5EEoWJmV5q8PtzjD7erw=;
 b=gLDAJQ3ivYvMJlheoAr81GjPNj6Y5uKLLWYanOyikZphAyzjr26Co3JV4hIR4vjqCA
 b87UUab1BlL+eZkr12Lq9P8WvoySW1ZZG0dq2gF3IZJ2LxzMOyE6MP7s3EqHtjv40H5l
 /jINkB2Uv9Rzsdm7kTMdCz+o8jDFJ3UJBnUUeKCe6XAXhGiKOSoJ7CtKdIIFxabdNVey
 YwND5CzBbbzYNzQQ7M3H3VhD3sG3hxn1G5Zp41kQTYz6KtWdj3nODwQcBjXQl1m7ngFg
 EJwWxg2K6dtRhLRG9llcWHJ6F1BTGiB9ILf9oSsYg9mGSuZuw8nu+Rn0ilohaipdWY2D
 CLXQ==
X-Gm-Message-State: AJIora9Z1DpuGiRqjrL8TOzN3GNq7BMuYwi7expNr1M1+E+vLz3V2QjE
 A0Pllsk8oOLkzbgZCsbTc5pQjKBa2fEZoA==
X-Google-Smtp-Source: AGRyM1sZyhm9pRLn+InnhH2Kifgj6CE8MiBxKhBD9JEtBEkk4BokFj3/WnHoOX/H2DXlWIIMuI9hhw==
X-Received: by 2002:a17:902:e84b:b0:16a:4e50:d4be with SMTP id
 t11-20020a170902e84b00b0016a4e50d4bemr3105738plg.84.1656390369241; 
 Mon, 27 Jun 2022 21:26:09 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 k26-20020aa7821a000000b0052517150777sm8160565pfi.41.2022.06.27.21.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:26:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 43/45] target/arm: Only set ZEN in reset if SVE present
Date: Tue, 28 Jun 2022 09:51:15 +0530
Message-Id: <20220628042117.368549-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's no reason to set CPACR_EL1.ZEN if SVE disabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 4a35890853..20cb622083 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -204,11 +204,10 @@ static void arm_cpu_reset(DeviceState *dev)
         /* and to the FP/Neon instructions */
         env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
                                          CPACR_EL1, FPEN, 3);
-        /* and to the SVE instructions */
-        env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
-                                         CPACR_EL1, ZEN, 3);
-        /* with reasonable vector length */
+        /* and to the SVE instructions, with default vector length */
         if (cpu_isar_feature(aa64_sve, cpu)) {
+            env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
+                                             CPACR_EL1, ZEN, 3);
             env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
         /*
-- 
2.34.1


