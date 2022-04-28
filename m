Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3E4513858
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:29:03 +0200 (CEST)
Received: from localhost ([::1]:41568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk64k-0001c6-4w
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jx-0005ak-Gc
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:43 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Ju-0006Qr-Gq
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:41 -0400
Received: by mail-wr1-x433.google.com with SMTP id x18so7136318wrc.0
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dqByHTIpXckxQO3WSn8IGmqemM6gCwyzc86ernwmw6M=;
 b=nflfjNKYsi6vIAUJHxcCd8cfkFM7uknq9ePBq1fceos2+INjvz2/3DtN+Z8DHYl0j8
 YgT6uMeYqu3wYy0FyjcO5MxAGE89jyZbaOU9Hr07BxJIaodEeiGT13NpHap1hTloHns2
 2ZUkCzCSCQzi3ONox5e3CTsXQX65C4AUkHwaG0wNyR8NkADjoxu56wqGBO6ZgwaVHFWj
 v/nnpwyXJDXMmZ3tt+qN4plamzaDnoJ/hGVgXmQj9URkOpx4zHODX513RoDGyBLbK9Zy
 TdHCrV3CtsigLd9oNTu3ryiGKTyFrQmr7UNLshUL7r8QV2Zvkzm9WgPiLQkeR3v6yOiZ
 tQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dqByHTIpXckxQO3WSn8IGmqemM6gCwyzc86ernwmw6M=;
 b=Qodf2R4PQ3pb1chby4ha8Ab9RFoJOp/feQl7Ty73DCTH/HfP9j35P3i3/JdW1wVFU/
 uOSg8VKQTVpX6T3gf4l8ehRGt/CuoThlWdi5BRSmBYPZwwMQd/YncQ4YLznh+9fWYVSg
 +IFPoNz1C+V7gySi7gZxQBFWCzxZhbVXzbWX5DhWkJDkzEu1bgdFPGXq/F99FeR0jwPs
 9R1HYPfxS9OWO7jRq5A0aK4ecbD6LD3bu6FvdM/9bR9sSMgdXkfA05uBaX+Pu+0CjkEd
 696rwBQAA5aURhQEBUquwsaaWng9QVHJDJuyvwIvntXypf2Wr22nnAFwyH+t+r+dxXUo
 l7iA==
X-Gm-Message-State: AOAM533QV6X2ICZe3liMjgDg9HfUdtLzmVaVJ/Leluv2G6cAQNrGfrPt
 pXAzpltP7ZSCKfvM+/7w42YDGgxQsimWfA==
X-Google-Smtp-Source: ABdhPJynFD7tkbNHWWFXTALEJmYK3FhzySZ5WbWp9jaLHyI2bZgbGYJpviyie0jutNbrLlwq5w4T9Q==
X-Received: by 2002:adf:ee81:0:b0:206:1b32:d6f2 with SMTP id
 b1-20020adfee81000000b002061b32d6f2mr26114538wro.144.1651156832862; 
 Thu, 28 Apr 2022 07:40:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/54] target/arm: Use tcg_constant in LDM, STM
Date: Thu, 28 Apr 2022 15:39:36 +0100
Message-Id: <20220428143958.2451229-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-33-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 24e522e1d6e..e0469da0a16 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8050,7 +8050,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
 {
     int i, j, n, list, mem_idx;
     bool user = a->u;
-    TCGv_i32 addr, tmp, tmp2;
+    TCGv_i32 addr, tmp;
 
     if (user) {
         /* STM (user) */
@@ -8080,9 +8080,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
 
         if (user && i != 15) {
             tmp = tcg_temp_new_i32();
-            tmp2 = tcg_const_i32(i);
-            gen_helper_get_user_reg(tmp, cpu_env, tmp2);
-            tcg_temp_free_i32(tmp2);
+            gen_helper_get_user_reg(tmp, cpu_env, tcg_constant_i32(i));
         } else {
             tmp = load_reg(s, i);
         }
@@ -8123,7 +8121,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
     bool loaded_base;
     bool user = a->u;
     bool exc_return = false;
-    TCGv_i32 addr, tmp, tmp2, loaded_var;
+    TCGv_i32 addr, tmp, loaded_var;
 
     if (user) {
         /* LDM (user), LDM (exception return) */
@@ -8166,9 +8164,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
         tmp = tcg_temp_new_i32();
         gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
         if (user) {
-            tmp2 = tcg_const_i32(i);
-            gen_helper_set_user_reg(cpu_env, tmp2, tmp);
-            tcg_temp_free_i32(tmp2);
+            gen_helper_set_user_reg(cpu_env, tcg_constant_i32(i), tmp);
             tcg_temp_free_i32(tmp);
         } else if (i == a->rn) {
             loaded_var = tmp;
-- 
2.25.1


