Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CE75137B1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:05:18 +0200 (CEST)
Received: from localhost ([::1]:38224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5hl-0002TI-7x
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Je-0005K8-Jc
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:22 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jd-0006Hs-0G
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:22 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v12so7060686wrv.10
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ncvGY/mTO8ijoNvEGe7Re9tDGvGuUjZw37wRaTtehqY=;
 b=ttjzhrX82IJMMiRB7Wt+r390PW1yXye1HPGjzKW9H+qyKsF797hdS5w6vnDMJCsoGC
 QAoa3QN0977rnQYsEQxJCT4uWbrHZhPqRNoCtaKlBsHL0eETq7oUhifvkx5tPEcRkETS
 7xuKjRWA3hWMYwrv4fjnuSJS5CqJeko+hsBQJSSoy7r0hL2lPuCi0cC7OEMwMJcy6C2g
 D+V7Dib1H6LeJ0R4Eb7nGPn/hyr+UsAFOP9Hp42ZFkbqhnkGqXcWqVwfBQE22hvTCXx6
 S9XpTYb+n4oTwJK3w/ku+O4NXXPjZwceiva9mMUtwq1t5D0PWfyte4BanGjzU9nn++9u
 DLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ncvGY/mTO8ijoNvEGe7Re9tDGvGuUjZw37wRaTtehqY=;
 b=1HD5wQKCqSX3hZm5+BIbWcD0wl3eFH5AfmFKSK4MqDJfoIvihic4A0hTd0GZFEorrs
 0sdT3coXX1nRl0DS1m3U6QSUPgLCEZhgSEEuJ6hJTDc6OC0/4nnvYoB2BDJyO7DJeKNJ
 daT+/8QB99Dn/4jdpR57RH6/u0oX2bEUVY00g3CuxTclvXcXlR2QbUaQe7NqHHr02pXN
 ywT4vuT+vN2q5qCoO5UT8ydNGaJJ1esK6em6QkkDHQfIuyO1N0vhzqua4kxHatNJiRel
 oS09WgVe4l19mcr4eC/NbkY+xZ6zNFxnLfZcT3BWic03wM5SjPU/dT53o83KRq4gkmkW
 FabQ==
X-Gm-Message-State: AOAM531K5hnTOdwv6Wdkr0z8bJZSTtNP/KhXjDfB/27c/CoH3N4kt5Sz
 VNL3qoCIWH5ITE8FqfuCyY05XI8mebKCFg==
X-Google-Smtp-Source: ABdhPJz7Nwqx4UIHujuZivALWlnJP6dDosvSVao7KZZqKHEKfDObfx/fNZKLFIZktkC1X+2H+pPIFA==
X-Received: by 2002:a05:6000:1369:b0:20a:c68b:7275 with SMTP id
 q9-20020a056000136900b0020ac68b7275mr27591549wrz.158.1651156819688; 
 Thu, 28 Apr 2022 07:40:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/54] target/arm: Use tcg_constant in simd shift expanders
Date: Thu, 28 Apr 2022 15:39:22 +0100
Message-Id: <20220428143958.2451229-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Message-id: 20220426163043.100432-19-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9493d2e2468..815320d2e35 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -8354,7 +8354,7 @@ static void handle_shri_with_rndacc(TCGv_i64 tcg_res, TCGv_i64 tcg_src,
     /* Deal with the rounding step */
     if (round) {
         if (extended_result) {
-            TCGv_i64 tcg_zero = tcg_const_i64(0);
+            TCGv_i64 tcg_zero = tcg_constant_i64(0);
             if (!is_u) {
                 /* take care of sign extending tcg_res */
                 tcg_gen_sari_i64(tcg_src_hi, tcg_src, 63);
@@ -8366,7 +8366,6 @@ static void handle_shri_with_rndacc(TCGv_i64 tcg_res, TCGv_i64 tcg_src,
                                  tcg_src, tcg_zero,
                                  tcg_rnd, tcg_zero);
             }
-            tcg_temp_free_i64(tcg_zero);
         } else {
             tcg_gen_add_i64(tcg_src, tcg_src, tcg_rnd);
         }
@@ -8452,8 +8451,7 @@ static void handle_scalar_simd_shri(DisasContext *s,
     }
 
     if (round) {
-        uint64_t round_const = 1ULL << (shift - 1);
-        tcg_round = tcg_const_i64(round_const);
+        tcg_round = tcg_constant_i64(1ULL << (shift - 1));
     } else {
         tcg_round = NULL;
     }
@@ -8479,9 +8477,6 @@ static void handle_scalar_simd_shri(DisasContext *s,
 
     tcg_temp_free_i64(tcg_rn);
     tcg_temp_free_i64(tcg_rd);
-    if (round) {
-        tcg_temp_free_i64(tcg_round);
-    }
 }
 
 /* SHL/SLI - Scalar shift left */
@@ -8579,8 +8574,7 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
     tcg_final = tcg_const_i64(0);
 
     if (round) {
-        uint64_t round_const = 1ULL << (shift - 1);
-        tcg_round = tcg_const_i64(round_const);
+        tcg_round = tcg_constant_i64(1ULL << (shift - 1));
     } else {
         tcg_round = NULL;
     }
@@ -8600,9 +8594,6 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
         write_vec_element(s, tcg_final, rd, 1, MO_64);
     }
 
-    if (round) {
-        tcg_temp_free_i64(tcg_round);
-    }
     tcg_temp_free_i64(tcg_rn);
     tcg_temp_free_i64(tcg_rd);
     tcg_temp_free_i32(tcg_rd_narrowed);
@@ -8654,7 +8645,7 @@ static void handle_simd_qshl(DisasContext *s, bool scalar, bool is_q,
     }
 
     if (size == 3) {
-        TCGv_i64 tcg_shift = tcg_const_i64(shift);
+        TCGv_i64 tcg_shift = tcg_constant_i64(shift);
         static NeonGenTwo64OpEnvFn * const fns[2][2] = {
             { gen_helper_neon_qshl_s64, gen_helper_neon_qshlu_s64 },
             { NULL, gen_helper_neon_qshl_u64 },
@@ -8671,10 +8662,9 @@ static void handle_simd_qshl(DisasContext *s, bool scalar, bool is_q,
 
             tcg_temp_free_i64(tcg_op);
         }
-        tcg_temp_free_i64(tcg_shift);
         clear_vec_high(s, is_q, rd);
     } else {
-        TCGv_i32 tcg_shift = tcg_const_i32(shift);
+        TCGv_i32 tcg_shift = tcg_constant_i32(shift);
         static NeonGenTwoOpEnvFn * const fns[2][2][3] = {
             {
                 { gen_helper_neon_qshl_s8,
@@ -8719,7 +8709,6 @@ static void handle_simd_qshl(DisasContext *s, bool scalar, bool is_q,
 
             tcg_temp_free_i32(tcg_op);
         }
-        tcg_temp_free_i32(tcg_shift);
 
         if (!scalar) {
             clear_vec_high(s, is_q, rd);
-- 
2.25.1


