Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FCA698AFB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:11:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUeB-0007Qj-AQ; Wed, 15 Feb 2023 22:09:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUe6-0007Mi-V0
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:19 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUe4-0000AO-P5
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:18 -0500
Received: by mail-pg1-x532.google.com with SMTP id x31so428187pgl.6
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 19:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lfTuYbDwFkSb64uBCRrm2LaC5eHgkpgYJsrn0+BFRDQ=;
 b=FY7LUO+x+RJmyQ9t/2GXf9v3jQiZRyvl8LC5yNjYa3jSoeF1gLrnPV5iCGmGgW287b
 qK926C7Q5XWZfmXXHfKaB+9hU4sQ7g+PIRi8nS18TPs9yKeIX9BmNwX48cyDPmhRV7a6
 f96t9p7gohun94jFKUCgQb25FsVFVmNv9S0t4k5E1tqVV6ySL9VQ5t+l5VkeqKalJgXH
 +qK8/YYZhiWAiZoCEO3xamGQZQxa3ZS8rhGdnrQYWUdCI2jfgpHNsO5F53zLKcaMMhBj
 a4+OFCYnKMbAYifr4eJD5GokrjI76BDtV3ikr01HkrmfMDx/AvAWukvS13jnQjDDEuhY
 a08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lfTuYbDwFkSb64uBCRrm2LaC5eHgkpgYJsrn0+BFRDQ=;
 b=Jf3m2+1KE6UTCjIkfGKCl/OC3OeW1a46cblqXXp1J7bUnx6Y55J4Ti7kmS6tWNTBFj
 fsQfbxI4cTwnm7zPiqAQP72IefkfW2/tO5DWQoD4zDRX4PGGGnN0cNtiGyqikMsmNkYC
 Fvl03svZIaqPRDtNXe26BO45t6Ph3JNRI1uJ9m6UlSJqJHPUO7YKBbRTc/L1nAmAmc8x
 cCiXhWlI4wrTvhmdkFL3+9ay7ca6ZZXRUNHyPXP1zwUaOIDQIwXNjUVtzcZnh03jOBhk
 INai4LG3Iql3Ij5sqUg6E6jZE9oA1eewGSwcq0bArz2ifoZZkxplfTMhzBTZ618152f0
 +zpA==
X-Gm-Message-State: AO0yUKUEGFxIEgXBE9G/877GLnFJwQTfQVcYIFP/P1pM6ZRYr6bk0TMi
 nB4g3IQIKsAflvzVC01/vcQPU4HI1M/ZI7dXOes=
X-Google-Smtp-Source: AK7set/+O7Parx6VPp2wtVupA0YFqTLNs4wIMkS/3LDBAcWke8COZEebts2TeHoeOLOHT+ZT+DVmIQ==
X-Received: by 2002:aa7:9827:0:b0:5a8:808a:d3ce with SMTP id
 q7-20020aa79827000000b005a8808ad3cemr4272693pfl.8.1676516955302; 
 Wed, 15 Feb 2023 19:09:15 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 12/19] target/arm: Pass memop to gen_mte_check1*
Date: Wed, 15 Feb 2023 17:08:47 -1000
Message-Id: <20230216030854.1212208-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Pass the completed memop to gen_mte_check1_mmuidx.
For the moment, do nothing more than extract the size.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  2 +-
 target/arm/translate-a64.c | 80 ++++++++++++++++++++------------------
 target/arm/translate-sve.c |  7 ++--
 3 files changed, 48 insertions(+), 41 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index ad3762d1ac..3fc39763d0 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -52,7 +52,7 @@ static inline bool sme_smza_enabled_check(DisasContext *s)
 
 TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
-                        bool tag_checked, int log2_size);
+                        bool tag_checked, MemOp memop);
 TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int size);
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index cc857d60d7..e02bdd3e7c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -256,7 +256,7 @@ static void gen_probe_access(DisasContext *s, TCGv_i64 ptr,
  */
 static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
                                       bool is_write, bool tag_checked,
-                                      int log2_size, bool is_unpriv,
+                                      MemOp memop, bool is_unpriv,
                                       int core_idx)
 {
     if (tag_checked && s->mte_active[is_unpriv]) {
@@ -267,7 +267,7 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (1 << log2_size) - 1);
+        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, memop_size(memop) - 1);
 
         ret = new_tmp_a64(s);
         gen_helper_mte_check(ret, cpu_env, tcg_constant_i32(desc), addr);
@@ -278,9 +278,9 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
 }
 
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
-                        bool tag_checked, int log2_size)
+                        bool tag_checked, MemOp memop)
 {
-    return gen_mte_check1_mmuidx(s, addr, is_write, tag_checked, log2_size,
+    return gen_mte_check1_mmuidx(s, addr, is_write, tag_checked, memop,
                                  false, get_mem_index(s));
 }
 
@@ -2510,19 +2510,30 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2, int rn,
                                int size, bool is_pair)
 {
     int idx = get_mem_index(s);
-    MemOp memop = s->be_data;
     TCGv_i64 dirty_addr, clean_addr;
+    MemOp memop;
+
+    /*
+     * For pairs:
+     * if size == 2, the operation is single-copy atomic for the doubleword.
+     * if size == 3, the operation is single-copy atomic for *each* doubleword,
+     * not the entire quadword, however it must be quadword aligned.
+     */
+    memop = size + is_pair;
+    if (memop == MO_128) {
+        memop |= MO_ATMAX_8;
+    }
+    memop |= MO_ALIGN;
+    memop = finalize_memop(s, memop);
 
     s->is_ldex = true;
     dirty_addr = cpu_reg_sp(s, rn);
-    clean_addr = gen_mte_check1(s, dirty_addr, false, rn != 31, size);
+    clean_addr = gen_mte_check1(s, dirty_addr, false, rn != 31, memop);
 
     g_assert(size <= 3);
     if (is_pair) {
         g_assert(size >= 2);
         if (size == 2) {
-            /* The pair must be single-copy atomic for the doubleword.  */
-            memop |= MO_64 | MO_ALIGN;
             tcg_gen_qemu_ld_i64(cpu_exclusive_val, clean_addr, idx, memop);
             if (s->be_data == MO_LE) {
                 tcg_gen_extract_i64(cpu_reg(s, rt), cpu_exclusive_val, 0, 32);
@@ -2532,15 +2543,8 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2, int rn,
                 tcg_gen_extract_i64(cpu_reg(s, rt2), cpu_exclusive_val, 0, 32);
             }
         } else {
-            /*
-             * The pair must be single-copy atomic for *each* doubleword, not
-             * the entire quadword, however it must be quadword aligned.
-             * Expose the complete load to tcg, for ease of tlb lookup,
-             * but indicate that only 8-byte atomicity is required.
-             */
             TCGv_i128 t16 = tcg_temp_new_i128();
 
-            memop |= MO_128 | MO_ALIGN_16 | MO_ATMAX_8;
             tcg_gen_qemu_ld_i128(t16, clean_addr, idx, memop);
 
             tcg_gen_extr_i128_i64(cpu_exclusive_val, cpu_exclusive_high, t16);
@@ -2555,7 +2559,6 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2, int rn,
             }
         }
     } else {
-        memop |= size | MO_ALIGN;
         tcg_gen_qemu_ld_i64(cpu_exclusive_val, clean_addr, idx, memop);
         tcg_gen_mov_i64(cpu_reg(s, rt), cpu_exclusive_val);
     }
@@ -2580,9 +2583,13 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
     TCGLabel *fail_label = gen_new_label();
     TCGLabel *done_label = gen_new_label();
     TCGv_i64 tmp, dirty_addr, clean_addr;
+    MemOp memop;
+
+    memop = (size + is_pair) | MO_ALIGN;
+    memop = finalize_memop(s, memop);
 
     dirty_addr = cpu_reg_sp(s, rn);
-    clean_addr = gen_mte_check1(s, dirty_addr, true, rn != 31, size);
+    clean_addr = gen_mte_check1(s, dirty_addr, true, rn != 31, memop);
 
     tcg_gen_brcond_i64(TCG_COND_NE, clean_addr, cpu_exclusive_addr, fail_label);
 
@@ -2596,8 +2603,7 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
             }
             tcg_gen_atomic_cmpxchg_i64(tmp, cpu_exclusive_addr,
                                        cpu_exclusive_val, tmp,
-                                       get_mem_index(s),
-                                       MO_64 | MO_ALIGN | s->be_data);
+                                       get_mem_index(s), memop);
             tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, cpu_exclusive_val);
         } else {
             TCGv_i128 t16 = tcg_temp_new_i128();
@@ -2612,8 +2618,7 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
             tcg_gen_concat_i64_i128(c16, cpu_exclusive_val, cpu_exclusive_high);
 
             tcg_gen_atomic_cmpxchg_i128(t16, cpu_exclusive_addr, c16, t16,
-                                        get_mem_index(s),
-                                        MO_128 | MO_ALIGN | s->be_data);
+                                        get_mem_index(s), memop);
             tcg_temp_free_i128(c16);
 
             lo = tcg_temp_new_i64();
@@ -2631,8 +2636,7 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
         }
     } else {
         tcg_gen_atomic_cmpxchg_i64(tmp, cpu_exclusive_addr, cpu_exclusive_val,
-                                   cpu_reg(s, rt), get_mem_index(s),
-                                   size | MO_ALIGN | s->be_data);
+                                   cpu_reg(s, rt), get_mem_index(s), memop);
         tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, cpu_exclusive_val);
     }
     tcg_gen_mov_i64(cpu_reg(s, rd), tmp);
@@ -2652,13 +2656,15 @@ static void gen_compare_and_swap(DisasContext *s, int rs, int rt,
     TCGv_i64 tcg_rt = cpu_reg(s, rt);
     int memidx = get_mem_index(s);
     TCGv_i64 clean_addr;
+    MemOp memop;
 
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), true, rn != 31, size);
-    tcg_gen_atomic_cmpxchg_i64(tcg_rs, clean_addr, tcg_rs, tcg_rt, memidx,
-                               size | MO_ALIGN | s->be_data);
+    memop = finalize_memop(s, size | MO_ALIGN);
+    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), true, rn != 31, memop);
+    tcg_gen_atomic_cmpxchg_i64(tcg_rs, clean_addr, tcg_rs, tcg_rt,
+                               memidx, memop);
 }
 
 static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
@@ -2670,13 +2676,15 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
     TCGv_i64 t2 = cpu_reg(s, rt + 1);
     TCGv_i64 clean_addr;
     int memidx = get_mem_index(s);
+    MemOp memop;
 
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
 
     /* This is a single atomic access, despite the "pair". */
-    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), true, rn != 31, size + 1);
+    memop = finalize_memop(s, (size + 1) | MO_ALIGN);
+    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), true, rn != 31, memop);
 
     if (size == 2) {
         TCGv_i64 cmp = tcg_temp_new_i64();
@@ -2690,8 +2698,7 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
             tcg_gen_concat32_i64(cmp, s2, s1);
         }
 
-        tcg_gen_atomic_cmpxchg_i64(cmp, clean_addr, cmp, val, memidx,
-                                   MO_64 | MO_ALIGN | s->be_data);
+        tcg_gen_atomic_cmpxchg_i64(cmp, clean_addr, cmp, val, memidx, memop);
         tcg_temp_free_i64(val);
 
         if (s->be_data == MO_LE) {
@@ -2712,8 +2719,7 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
             tcg_gen_concat_i64_i128(cmp, s2, s1);
         }
 
-        tcg_gen_atomic_cmpxchg_i128(cmp, clean_addr, cmp, val, memidx,
-                                    MO_128 | MO_ALIGN | s->be_data);
+        tcg_gen_atomic_cmpxchg_i128(cmp, clean_addr, cmp, val, memidx, memop);
         tcg_temp_free_i128(val);
 
         if (s->be_data == MO_LE) {
@@ -2804,7 +2810,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         /* TODO: ARMv8.4-LSE SCTLR.nAA */
         memop = finalize_memop(s, size | MO_ALIGN);
         clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
-                                    true, rn != 31, size);
+                                    true, rn != 31, memop);
         do_gpr_st(s, cpu_reg(s, rt), clean_addr, memop, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         return;
@@ -2823,7 +2829,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         /* TODO: ARMv8.4-LSE SCTLR.nAA */
         memop = finalize_memop(s, size | MO_ALIGN);
         clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
-                                    false, rn != 31, size);
+                                    false, rn != 31, memop);
         do_gpr_ld(s, cpu_reg(s, rt), clean_addr, memop, false, true,
                   rt, disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
@@ -3369,7 +3375,7 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
     tcg_gen_add_i64(dirty_addr, dirty_addr, tcg_rm);
 
     memop = finalize_memop(s, size + is_signed * MO_SIGN);
-    clean_addr = gen_mte_check1(s, dirty_addr, is_store, true, size);
+    clean_addr = gen_mte_check1(s, dirty_addr, is_store, true, memop);
 
     if (is_vector) {
         if (is_store) {
@@ -3455,7 +3461,7 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
     tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
 
     memop = finalize_memop(s, size + is_signed * MO_SIGN);
-    clean_addr = gen_mte_check1(s, dirty_addr, is_store, rn != 31, size);
+    clean_addr = gen_mte_check1(s, dirty_addr, is_store, rn != 31, memop);
 
     if (is_vector) {
         if (is_store) {
@@ -3550,7 +3556,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), false, rn != 31, size);
+    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), false, rn != 31, mop);
 
     if (o3_opc == 014) {
         /*
@@ -3637,7 +3643,7 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
 
     /* Note that "clean" and "dirty" here refer to TBI not PAC.  */
     clean_addr = gen_mte_check1(s, dirty_addr, false,
-                                is_wback || rn != 31, size);
+                                is_wback || rn != 31, memop);
 
     tcg_rt = cpu_reg(s, rt);
     do_gpr_ld(s, tcg_rt, clean_addr, memop,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f3d5e79dd2..f283322cda 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5215,6 +5215,7 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
     unsigned msz = dtype_msz(a->dtype);
     TCGLabel *over;
     TCGv_i64 temp, clean_addr;
+    MemOp memop;
 
     if (!dc_isar_feature(aa64_sve, s)) {
         return false;
@@ -5246,10 +5247,10 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
     /* Load the data.  */
     temp = tcg_temp_new_i64();
     tcg_gen_addi_i64(temp, cpu_reg_sp(s, a->rn), a->imm << msz);
-    clean_addr = gen_mte_check1(s, temp, false, true, msz);
 
-    tcg_gen_qemu_ld_i64(temp, clean_addr, get_mem_index(s),
-                        finalize_memop(s, dtype_mop[a->dtype]));
+    memop = finalize_memop(s, dtype_mop[a->dtype]);
+    clean_addr = gen_mte_check1(s, temp, false, true, memop);
+    tcg_gen_qemu_ld_i64(temp, clean_addr, get_mem_index(s), memop);
 
     /* Broadcast to *all* elements.  */
     tcg_gen_gvec_dup_i64(esz, vec_full_reg_offset(s, a->rd),
-- 
2.34.1


