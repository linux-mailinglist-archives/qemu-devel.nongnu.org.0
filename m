Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A227F6AB41E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:54:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyyh-0005Q9-LR; Sun, 05 Mar 2023 19:45:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxp-0003I9-2L
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:30 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxn-0007EH-2o
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:28 -0500
Received: by mail-pl1-x635.google.com with SMTP id u5so8502886plq.7
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063466;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CmJCObHY2dv33Ryu7MP1aLpwOl0ktyPiZQ7uZiMYs+s=;
 b=HBeUon/GwqS9d0zuZP8nA6+wIIXsVTQS3Jlk4c6oM9DCW5dWfbv+ZBTK6hzcbDIh/O
 ACTJNSTDY790/i2Ww+/wlgvAGOf2OIQpbdIuWxlG2lj3W+0B+AWFClFFsJklkxnkVfeq
 mvtqGtdANYH1ot3J95/tEsYcYqGplynM1/2w/m4ebIEDAyWh+0VkcOCZ/Z1WtEwnVNFa
 lYb6kYmE5uWztEfso/ZHGtsOydR7FMe5HwZdciSjRTF5Ce/NSahESs0YOQhF4UL+CbUl
 FVZEGcDC/IMGO0vE84JzIl2sVkoVM2LDG+PwKzcVkgEIXF83dHv7KE4aXexhoULu9PfP
 3UPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063466;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CmJCObHY2dv33Ryu7MP1aLpwOl0ktyPiZQ7uZiMYs+s=;
 b=XEPh6KMxUp/T81OhxFTYKU15/fGxKXqY2GaiZ+Wu5LzFzOLPvDZ5KI1Vbl9YWPkORp
 PGuiyufgTeTsvlxGdr6RD5mCeaOH0jIbsAbYI1GWXp3ldPVcM+MOK+gDx5FiiYUVoM8g
 aJ7mAQGTgxvpqVixgRrRrPcDysHDAZlLLX1L/EgP6XpNcRiDwlIfYlJ780iGfGTRfh7q
 lBEX98oLHAY2hFWAfc5dXMJIInzzLnq4M4miZqby6pchoFhva2PCZnKrYe67CQLUaQg7
 F2pw3PYYRoeB/oF9VA7LewyYBqAT9b3io26jTK5Vc1Dr/oydHtqXSOtsOwRrpQl0IR1L
 PEyg==
X-Gm-Message-State: AO0yUKUaxe/+Wf5YJw9RKWu6stGbW11Xp8b6rk22GBwqBNLIHxUpPpsK
 cTQ4Ws+sWwxE9jes1HHvTz+NslXgaBiWxnkngRTBNg==
X-Google-Smtp-Source: AK7set/YjsvbEYr2eC1604scVRpq0L6ryEAlQF7ArqyOpvDQh04xyisABk1EZjXcll3KhlNLHo+Ghg==
X-Received: by 2002:a05:6a20:8f1b:b0:c6:b993:69a4 with SMTP id
 b27-20020a056a208f1b00b000c6b99369a4mr10151980pzk.23.1678063466246; 
 Sun, 05 Mar 2023 16:44:26 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:44:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 79/84] target/xtensa: Tidy translate_bb
Date: Sun,  5 Mar 2023 16:39:49 -0800
Message-Id: <20230306003954.1866998-80-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Replace ifdefs with C, tcg_const_i32 with tcg_constant_i32.
We only need a single temporary for this.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 3ea50d8bc3..e3fcd50691 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1406,19 +1406,15 @@ static void translate_b(DisasContext *dc, const OpcodeArg arg[],
 static void translate_bb(DisasContext *dc, const OpcodeArg arg[],
                          const uint32_t par[])
 {
-#if TARGET_BIG_ENDIAN
-    TCGv_i32 bit = tcg_const_i32(0x80000000u);
-#else
-    TCGv_i32 bit = tcg_const_i32(0x00000001u);
-#endif
     TCGv_i32 tmp = tcg_temp_new_i32();
+
     tcg_gen_andi_i32(tmp, arg[1].in, 0x1f);
-#if TARGET_BIG_ENDIAN
-    tcg_gen_shr_i32(bit, bit, tmp);
-#else
-    tcg_gen_shl_i32(bit, bit, tmp);
-#endif
-    tcg_gen_and_i32(tmp, arg[0].in, bit);
+    if (TARGET_BIG_ENDIAN) {
+        tcg_gen_shr_i32(tmp, tcg_constant_i32(0x80000000u), tmp);
+    } else {
+        tcg_gen_shl_i32(tmp, tcg_constant_i32(0x00000001u), tmp);
+    }
+    tcg_gen_and_i32(tmp, arg[0].in, tmp);
     gen_brcondi(dc, par[0], tmp, 0, arg[2].imm);
 }
 
-- 
2.34.1


