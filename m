Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A1E5104B4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:55:51 +0200 (CEST)
Received: from localhost ([::1]:38474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOTe-0000SZ-GM
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5j-0002yX-6U
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:14 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:40847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5g-0003q5-Jh
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:06 -0400
Received: by mail-pf1-x42a.google.com with SMTP id i24so18427349pfa.7
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3kAfkV/aZkCQhNUer/1meejI7m8mfD0mYpM7M5aKteI=;
 b=zeaN/IgS2Qb+sM4tHvZO64AFGqFcaCUagKt5VC+DIzkt7o51+2tgeuXJpdk3mX8Q3o
 qD6zKtrnajjeokSDUXctxVvikkfMcKRRrh5AUh8g4VS31wNtGhk2PTewMlQ1PsYwUMAj
 452keZo3V9fvPeWBklyZmzPILhnhT9vNLTYmaHSQ7NLISBSqARdwB/WuAVmNGnN7uWac
 Vqx54ogXU85BDVaBLz/l2p/7gWIbKANyVuDfy819tpA5fCeXEvoyOHu5i2mYQnwA7pjl
 Dc5feQ17bABxuYy5jukiiOrZAIUQxm559ROl6x1SVinPiU1Yjo0/8Kjp4Fe8ua8IVlb/
 w4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3kAfkV/aZkCQhNUer/1meejI7m8mfD0mYpM7M5aKteI=;
 b=YOjn5a6nRjy9DWXQmKTG2i5czX0LaLmFFFdCYoF1F0ZeJmrGrMDKYwwh/G1L2T0rnu
 L6/l7FsCn7TGHGkhA5Ybj0xlw/99c0lh5aRrgOILIzGj6FVBLZv4mLlTbFBd3ygq1gfB
 llWGO80DXa5x/X9AJj0ickBANwyOyq9eCfdV0pPDu9ExG5Rc+U+tAwbAlKYKxiAmL8d3
 vQuZxc14+5lnXNN4Q02u+5jUpd+CCMSCem24AnxI9I7mV7Coy5nsXCIKjaQrFt472oN0
 Gu0qAxEddQ9WfECfDN+KoqQ/Zt/fuC6hYs/R59IYVXQx5pF7MmwGqbbuWOvQ0yvmKtBI
 GW0w==
X-Gm-Message-State: AOAM533BNof+lyP4/scmFyWQs0D8QyEkzqZE7UWhaBU/5rgiW/grySa6
 aFRkCeeB1OegEtrDR1pNuDwi+qs0eI36mA==
X-Google-Smtp-Source: ABdhPJyQabG4gX2wgn6rqHjH329w3ki2VH8+lwh8E/PQGN4Bmw611iujw7ecej+ZvUDol2lHAWv1XQ==
X-Received: by 2002:a63:38e:0:b0:3ab:ada6:a219 with SMTP id
 136-20020a63038e000000b003abada6a219mr1082601pgd.140.1650990663258; 
 Tue, 26 Apr 2022 09:31:03 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/47] target/arm: Use tcg_constant in simd shift expanders
Date: Tue, 26 Apr 2022 09:30:14 -0700
Message-Id: <20220426163043.100432-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 847da725ea..45abac6892 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -8353,7 +8353,7 @@ static void handle_shri_with_rndacc(TCGv_i64 tcg_res, TCGv_i64 tcg_src,
     /* Deal with the rounding step */
     if (round) {
         if (extended_result) {
-            TCGv_i64 tcg_zero = tcg_const_i64(0);
+            TCGv_i64 tcg_zero = tcg_constant_i64(0);
             if (!is_u) {
                 /* take care of sign extending tcg_res */
                 tcg_gen_sari_i64(tcg_src_hi, tcg_src, 63);
@@ -8365,7 +8365,6 @@ static void handle_shri_with_rndacc(TCGv_i64 tcg_res, TCGv_i64 tcg_src,
                                  tcg_src, tcg_zero,
                                  tcg_rnd, tcg_zero);
             }
-            tcg_temp_free_i64(tcg_zero);
         } else {
             tcg_gen_add_i64(tcg_src, tcg_src, tcg_rnd);
         }
@@ -8451,8 +8450,7 @@ static void handle_scalar_simd_shri(DisasContext *s,
     }
 
     if (round) {
-        uint64_t round_const = 1ULL << (shift - 1);
-        tcg_round = tcg_const_i64(round_const);
+        tcg_round = tcg_constant_i64(1ULL << (shift - 1));
     } else {
         tcg_round = NULL;
     }
@@ -8478,9 +8476,6 @@ static void handle_scalar_simd_shri(DisasContext *s,
 
     tcg_temp_free_i64(tcg_rn);
     tcg_temp_free_i64(tcg_rd);
-    if (round) {
-        tcg_temp_free_i64(tcg_round);
-    }
 }
 
 /* SHL/SLI - Scalar shift left */
@@ -8578,8 +8573,7 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
     tcg_final = tcg_const_i64(0);
 
     if (round) {
-        uint64_t round_const = 1ULL << (shift - 1);
-        tcg_round = tcg_const_i64(round_const);
+        tcg_round = tcg_constant_i64(1ULL << (shift - 1));
     } else {
         tcg_round = NULL;
     }
@@ -8599,9 +8593,6 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
         write_vec_element(s, tcg_final, rd, 1, MO_64);
     }
 
-    if (round) {
-        tcg_temp_free_i64(tcg_round);
-    }
     tcg_temp_free_i64(tcg_rn);
     tcg_temp_free_i64(tcg_rd);
     tcg_temp_free_i32(tcg_rd_narrowed);
@@ -8653,7 +8644,7 @@ static void handle_simd_qshl(DisasContext *s, bool scalar, bool is_q,
     }
 
     if (size == 3) {
-        TCGv_i64 tcg_shift = tcg_const_i64(shift);
+        TCGv_i64 tcg_shift = tcg_constant_i64(shift);
         static NeonGenTwo64OpEnvFn * const fns[2][2] = {
             { gen_helper_neon_qshl_s64, gen_helper_neon_qshlu_s64 },
             { NULL, gen_helper_neon_qshl_u64 },
@@ -8670,10 +8661,9 @@ static void handle_simd_qshl(DisasContext *s, bool scalar, bool is_q,
 
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
@@ -8718,7 +8708,6 @@ static void handle_simd_qshl(DisasContext *s, bool scalar, bool is_q,
 
             tcg_temp_free_i32(tcg_op);
         }
-        tcg_temp_free_i32(tcg_shift);
 
         if (!scalar) {
             clear_vec_high(s, is_q, rd);
-- 
2.34.1


