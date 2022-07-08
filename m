Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C1656BD04
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:46:00 +0200 (CEST)
Received: from localhost ([::1]:40406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qB5-0000Bb-7S
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pix-0003OD-1L
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:56 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piv-0002MA-3G
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:54 -0400
Received: by mail-pl1-x636.google.com with SMTP id m2so16613051plx.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WXFOydNqWu4pd209lRdohDlcMY8B614kNt2CpuhFxBg=;
 b=vjokr42DkLjycxKd0gRZFbjH7r5W/ojBDlhKecp1yUpRtx95O3IdJQlpe3x4dZw1Ww
 ryObICQ4LnsmVmBM4XQfBbSoX4rPi6s8OV4z2qL7HNyFlg6514SWB2C2W4RAdcVPspmr
 hS2fXZv8LENn0ZZFfU6hXDQ6bluDVhr8fuvEZu+uYZ4pvxD5Uvf2AssWmtc6F+FnFzIC
 4IapOeS9CcHgIh2MjA6geiBGvFgQUbD3j6peoj+E1tORFa0R+adP/w6XkADU4NjAcmAK
 ufS/77LDNISBrswksUlMg80Z3lSS+DnYyEpZWML+tCvXLjpAlEtcePZUv3l2pUpXgRU/
 c7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WXFOydNqWu4pd209lRdohDlcMY8B614kNt2CpuhFxBg=;
 b=W1OdzTjfhgIT7oI6Fxae9h4rKD2cu+0MAIx+vWWM6mCFmjy4udZLp3A4Z1ybgEM6bU
 aMyj6Uvy2IKp21KR1ZQMhucTC7+xTvhAUrSM3sNzO+krP2Xqfm6CCNmnku6bsYvT2IDp
 9s08BconhqvvRrSuK+qbQzJwox+5LXhSRYKlW2Yl1vYi7z0DmRNNagwpxaJXAtRVzTVR
 trGyKrSuDmekkzjgdGi/IpNbo4N5NEl+d5n0Z804r/Sv9CZ6G57tLcC3nUitLSUVeAyo
 ltSI4PUInptrN6i/qJdq84uwasGAwcrcpQE2L/psREJ7E4MD1HmQHvD4YsnN9ZLj96zU
 DfxA==
X-Gm-Message-State: AJIora9ZtS6WDaG3zsiejZviaK/P2yLuXhTpSMx0JjQ+IEI7We2Kt4+p
 ZFWItIzydh9YtabLyEX7aIyoZ85Tgsegr7jl
X-Google-Smtp-Source: AGRyM1uj6dVdZeQyX1BvEgnMfjPS300ISgqbacZlYTX0azhcG2EIyCghQH9v8U/tITfWgnngO0P0Pg==
X-Received: by 2002:a17:903:32c4:b0:16a:4227:cd68 with SMTP id
 i4-20020a17090332c400b0016a4227cd68mr4075185plr.173.1657293411712; 
 Fri, 08 Jul 2022 08:16:51 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 21/45] target/arm: Export unpredicated ld/st from
 translate-sve.c
Date: Fri,  8 Jul 2022 20:45:16 +0530
Message-Id: <20220708151540.18136-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Add a TCGv_ptr base argument, which will be cpu_env for SVE.
We will reuse this for SME save and restore array insns.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  3 +++
 target/arm/translate-sve.c | 48 ++++++++++++++++++++++++++++----------
 2 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 2a7fe6e9e7..ad3762d1ac 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -195,4 +195,7 @@ void gen_gvec_xar(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                   uint32_t rm_ofs, int64_t shift,
                   uint32_t opr_sz, uint32_t max_sz);
 
+void gen_sve_ldr(DisasContext *s, TCGv_ptr, int vofs, int len, int rn, int imm);
+void gen_sve_str(DisasContext *s, TCGv_ptr, int vofs, int len, int rn, int imm);
+
 #endif /* TARGET_ARM_TRANSLATE_A64_H */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 95016e49e9..fd1a173637 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4306,7 +4306,8 @@ TRANS_FEAT(UCVTF_dd, aa64_sve, gen_gvec_fpst_arg_zpz,
  * The load should begin at the address Rn + IMM.
  */
 
-static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
+void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
+                 int len, int rn, int imm)
 {
     int len_align = QEMU_ALIGN_DOWN(len, 8);
     int len_remain = len % 8;
@@ -4332,7 +4333,7 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         t0 = tcg_temp_new_i64();
         for (i = 0; i < len_align; i += 8) {
             tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEUQ);
-            tcg_gen_st_i64(t0, cpu_env, vofs + i);
+            tcg_gen_st_i64(t0, base, vofs + i);
             tcg_gen_addi_i64(clean_addr, clean_addr, 8);
         }
         tcg_temp_free_i64(t0);
@@ -4345,6 +4346,12 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         clean_addr = new_tmp_a64_local(s);
         tcg_gen_mov_i64(clean_addr, t0);
 
+        if (base != cpu_env) {
+            TCGv_ptr b = tcg_temp_local_new_ptr();
+            tcg_gen_mov_ptr(b, base);
+            base = b;
+        }
+
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
@@ -4352,7 +4359,7 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         tcg_gen_addi_i64(clean_addr, clean_addr, 8);
 
         tp = tcg_temp_new_ptr();
-        tcg_gen_add_ptr(tp, cpu_env, i);
+        tcg_gen_add_ptr(tp, base, i);
         tcg_gen_addi_ptr(i, i, 8);
         tcg_gen_st_i64(t0, tp, vofs);
         tcg_temp_free_ptr(tp);
@@ -4360,6 +4367,11 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
         tcg_temp_free_ptr(i);
+
+        if (base != cpu_env) {
+            tcg_temp_free_ptr(base);
+            assert(len_remain == 0);
+        }
     }
 
     /*
@@ -4388,13 +4400,14 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         default:
             g_assert_not_reached();
         }
-        tcg_gen_st_i64(t0, cpu_env, vofs + len_align);
+        tcg_gen_st_i64(t0, base, vofs + len_align);
         tcg_temp_free_i64(t0);
     }
 }
 
 /* Similarly for stores.  */
-static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
+void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
+                 int len, int rn, int imm)
 {
     int len_align = QEMU_ALIGN_DOWN(len, 8);
     int len_remain = len % 8;
@@ -4420,7 +4433,7 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
         t0 = tcg_temp_new_i64();
         for (i = 0; i < len_align; i += 8) {
-            tcg_gen_ld_i64(t0, cpu_env, vofs + i);
+            tcg_gen_ld_i64(t0, base, vofs + i);
             tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUQ);
             tcg_gen_addi_i64(clean_addr, clean_addr, 8);
         }
@@ -4434,11 +4447,17 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         clean_addr = new_tmp_a64_local(s);
         tcg_gen_mov_i64(clean_addr, t0);
 
+        if (base != cpu_env) {
+            TCGv_ptr b = tcg_temp_local_new_ptr();
+            tcg_gen_mov_ptr(b, base);
+            base = b;
+        }
+
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
         tp = tcg_temp_new_ptr();
-        tcg_gen_add_ptr(tp, cpu_env, i);
+        tcg_gen_add_ptr(tp, base, i);
         tcg_gen_ld_i64(t0, tp, vofs);
         tcg_gen_addi_ptr(i, i, 8);
         tcg_temp_free_ptr(tp);
@@ -4449,12 +4468,17 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
         tcg_temp_free_ptr(i);
+
+        if (base != cpu_env) {
+            tcg_temp_free_ptr(base);
+            assert(len_remain == 0);
+        }
     }
 
     /* Predicate register stores can be any multiple of 2.  */
     if (len_remain) {
         t0 = tcg_temp_new_i64();
-        tcg_gen_ld_i64(t0, cpu_env, vofs + len_align);
+        tcg_gen_ld_i64(t0, base, vofs + len_align);
 
         switch (len_remain) {
         case 2:
@@ -4486,7 +4510,7 @@ static bool trans_LDR_zri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = vec_full_reg_size(s);
         int off = vec_full_reg_offset(s, a->rd);
-        do_ldr(s, off, size, a->rn, a->imm * size);
+        gen_sve_ldr(s, cpu_env, off, size, a->rn, a->imm * size);
     }
     return true;
 }
@@ -4499,7 +4523,7 @@ static bool trans_LDR_pri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = pred_full_reg_size(s);
         int off = pred_full_reg_offset(s, a->rd);
-        do_ldr(s, off, size, a->rn, a->imm * size);
+        gen_sve_ldr(s, cpu_env, off, size, a->rn, a->imm * size);
     }
     return true;
 }
@@ -4512,7 +4536,7 @@ static bool trans_STR_zri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = vec_full_reg_size(s);
         int off = vec_full_reg_offset(s, a->rd);
-        do_str(s, off, size, a->rn, a->imm * size);
+        gen_sve_str(s, cpu_env, off, size, a->rn, a->imm * size);
     }
     return true;
 }
@@ -4525,7 +4549,7 @@ static bool trans_STR_pri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = pred_full_reg_size(s);
         int off = pred_full_reg_offset(s, a->rd);
-        do_str(s, off, size, a->rn, a->imm * size);
+        gen_sve_str(s, cpu_env, off, size, a->rn, a->imm * size);
     }
     return true;
 }
-- 
2.34.1


