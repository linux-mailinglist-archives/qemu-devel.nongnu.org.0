Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB01320AAD9
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 05:42:50 +0200 (CEST)
Received: from localhost ([::1]:42778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jofGL-00023F-KX
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 23:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6D-0000Mr-Aj
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 23:32:21 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:33175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6B-0001vk-4J
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 23:32:20 -0400
Received: by mail-pg1-x544.google.com with SMTP id o13so1390623pgf.0
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 20:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uJ1cXf9aNEKZnDHrydjg1dyCz0CVDtU/6WaWc8t987I=;
 b=rq3n7NcKIL0NjKCq4jm7EDmqYrZYqYJpRfkht5UA8320kTsFkUb2rqONVuX6w8l4qB
 bYIL2z4h+sg//T3qKueZshHCqcA9DjC1rvCKmKvf6yelnoaUwIuG+uWTuDJQctN676Qc
 7TBfufhfeppowDz2XxukD+SOW21d6VXMcAj7wz+BJHV/L/2Z8ATi7cN1yuVh7jK4ktDc
 YNgMIzmbVKPSnsepv9cJ6E4wb0Ahe7yb8ufoQ8+aDU/4eZSA3BQdq4FiLcrM+4YZSQJS
 oiHFZip3MXrju3SUG46flIhO8kB8RVKvpYO1p52idEr1tCYNOQiyPHYywd8j1PtbZvsk
 V8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uJ1cXf9aNEKZnDHrydjg1dyCz0CVDtU/6WaWc8t987I=;
 b=MoECTu/BykzqTgie+BAkUC+qm8X06z9RjOF+7kpXh95DnAHzxiMNdL+JGZOR0lIcWt
 cjL0JEuc4KiO0RTi1H2gTWAFi9Pa8q7MbNnEhux1n/rAh5Qlqzy5JMWHyGTWTBcQ7vGQ
 LHUOX3tkxuBWPaW/wJQ9neNS53Qf5wFvlWv1yJWk6oxBP/fDRQuFvxQaSbqZptlftU5P
 A1vHSXeaTTfZZdixWWUrNpGjzAStFJBFLwa82vCIfxtdYxin0jJilvjw05kzIrr+19/y
 WFmXjJnXuLJxJ1dABYt+Yqkv92nCxdY7aCLw1lDZ3w3rlIAc+eAKnkoqdmXtT80ncpZU
 Jh8w==
X-Gm-Message-State: AOAM530XwGs93DoF4UHRlR1QcgFsx3r4olZTRTo8pev6qbhWZ6YiIVdS
 BbLO6l7AbQGZzHzZuyRgld4xLtrG65s=
X-Google-Smtp-Source: ABdhPJxOa33hevodrB1WY53HEFXHFUbB8W+6+iOjTrQrG7Oya2cLE/DCM5/fYDdtFtfHpMZnZHFgcA==
X-Received: by 2002:a63:af0f:: with SMTP id w15mr896077pge.363.1593142336918; 
 Thu, 25 Jun 2020 20:32:16 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 23/46] target/arm: Add gen_mte_check1
Date: Thu, 25 Jun 2020 20:31:21 -0700
Message-Id: <20200626033144.790098-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace existing uses of check_data_tbi in translate-a64.c that
perform a single logical memory access.  Leave the helper blank
for now to reduce the patch size.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    |   1 +
 target/arm/internals.h     |   8 +++
 target/arm/translate-a64.h |   2 +
 target/arm/mte_helper.c    |   8 +++
 target/arm/translate-a64.c | 100 ++++++++++++++++++++++++++++---------
 5 files changed, 95 insertions(+), 24 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 7b628d100e..2faa49d0a3 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -104,6 +104,7 @@ DEF_HELPER_FLAGS_3(autdb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_2(xpaci, TCG_CALL_NO_RWG_SE, i64, env, i64)
 DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
 
+DEF_HELPER_FLAGS_3(mte_check1, TCG_CALL_NO_WG, i64, env, i32, i64)
 DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_4(addsubg, TCG_CALL_NO_RWG_SE, i64, env, i64, s32, i32)
 DEF_HELPER_FLAGS_3(ldg, TCG_CALL_NO_WG, i64, env, i64, i64)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 7c9abbabc9..fb92ef6b84 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1310,6 +1310,14 @@ void arm_log_exception(int idx);
 #define LOG2_TAG_GRANULE 4
 #define TAG_GRANULE      (1 << LOG2_TAG_GRANULE)
 
+/* Bits within a descriptor passed to the helper_mte_check* functions. */
+FIELD(MTEDESC, MIDX,  0, 4)
+FIELD(MTEDESC, TBI,   4, 2)
+FIELD(MTEDESC, TCMA,  6, 2)
+FIELD(MTEDESC, WRITE, 8, 1)
+FIELD(MTEDESC, ESIZE, 9, 5)
+FIELD(MTEDESC, TSIZE, 14, 10)  /* mte_checkN only */
+
 static inline int allocation_tag_from_addr(uint64_t ptr)
 {
     return extract64(ptr, 56, 4);
diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index da0f59a2ce..daab6a9666 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -40,6 +40,8 @@ TCGv_ptr get_fpstatus_ptr(bool);
 bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
                             unsigned int imms, unsigned int immr);
 bool sve_access_check(DisasContext *s);
+TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
+                        bool tag_checked, int log2_size);
 
 /* We should have at some point before trying to access an FP register
  * done the necessary access check, so assert that
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 27d4b4536c..ec12768dfc 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -358,3 +358,11 @@ void HELPER(stzgm_tags)(CPUARMState *env, uint64_t ptr, uint64_t val)
         memset(mem, tag_pair, tag_bytes);
     }
 }
+
+/*
+ * Perform an MTE checked access for a single logical or atomic access.
+ */
+uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t ptr)
+{
+    return ptr;
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7dc493774e..4d0453c895 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -204,20 +204,20 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
 }
 
 /*
- * Return a "clean" address for ADDR according to TBID.
- * This is always a fresh temporary, as we need to be able to
- * increment this independently of a dirty write-back address.
+ * Handle MTE and/or TBI.
+ *
+ * For TBI, ideally, we would do nothing.  Proper behaviour on fault is
+ * for the tag to be present in the FAR_ELx register.  But for user-only
+ * mode we do not have a TLB with which to implement this, so we must
+ * remove the top byte now.
+ *
+ * Always return a fresh temporary that we can increment independently
+ * of the write-back address.
  */
+
 static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
 {
     TCGv_i64 clean = new_tmp_a64(s);
-    /*
-     * In order to get the correct value in the FAR_ELx register,
-     * we must present the memory subsystem with the "dirty" address
-     * including the TBI.  In system mode we can make this work via
-     * the TLB, dropping the TBI during translation.  But for user-only
-     * mode we don't have that option, and must remove the top byte now.
-     */
 #ifdef CONFIG_USER_ONLY
     gen_top_byte_ignore(s, clean, addr, s->tbid);
 #else
@@ -245,6 +245,45 @@ static void gen_probe_access(DisasContext *s, TCGv_i64 ptr,
     tcg_temp_free_i32(t_size);
 }
 
+/*
+ * For MTE, check a single logical or atomic access.  This probes a single
+ * address, the exact one specified.  The size and alignment of the access
+ * is not relevant to MTE, per se, but watchpoints do require the size,
+ * and we want to recognize those before making any other changes to state.
+ */
+static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
+                                      bool is_write, bool tag_checked,
+                                      int log2_size, bool is_unpriv,
+                                      int core_idx)
+{
+    if (tag_checked && s->mte_active[is_unpriv]) {
+        TCGv_i32 tcg_desc;
+        TCGv_i64 ret;
+        int desc = 0;
+
+        desc = FIELD_DP32(desc, MTEDESC, MIDX, core_idx);
+        desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
+        desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
+        desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
+        desc = FIELD_DP32(desc, MTEDESC, ESIZE, 1 << log2_size);
+        tcg_desc = tcg_const_i32(desc);
+
+        ret = new_tmp_a64(s);
+        gen_helper_mte_check1(ret, cpu_env, tcg_desc, addr);
+        tcg_temp_free_i32(tcg_desc);
+
+        return ret;
+    }
+    return clean_data_tbi(s, addr);
+}
+
+TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
+                        bool tag_checked, int log2_size)
+{
+    return gen_mte_check1_mmuidx(s, addr, is_write, tag_checked, log2_size,
+                                 false, get_mem_index(s));
+}
+
 typedef struct DisasCompare64 {
     TCGCond cond;
     TCGv_i64 value;
@@ -2367,7 +2406,7 @@ static void gen_compare_and_swap(DisasContext *s, int rs, int rt,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), true, rn != 31, size);
     tcg_gen_atomic_cmpxchg_i64(tcg_rs, clean_addr, tcg_rs, tcg_rt, memidx,
                                size | MO_ALIGN | s->be_data);
 }
@@ -2385,7 +2424,9 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+
+    /* This is a single atomic access, despite the "pair". */
+    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), true, rn != 31, size + 1);
 
     if (size == 2) {
         TCGv_i64 cmp = tcg_temp_new_i64();
@@ -2510,7 +2551,8 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (is_lasr) {
             tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
         }
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
+                                    true, rn != 31, size);
         gen_store_exclusive(s, rs, rt, rt2, clean_addr, size, false);
         return;
 
@@ -2519,7 +2561,8 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (rn == 31) {
             gen_check_sp_alignment(s);
         }
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
+                                    false, rn != 31, size);
         s->is_ldex = true;
         gen_load_exclusive(s, rt, rt2, clean_addr, size, false);
         if (is_lasr) {
@@ -2539,7 +2582,8 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             gen_check_sp_alignment(s);
         }
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
+                                    true, rn != 31, size);
         do_gpr_st(s, cpu_reg(s, rt), clean_addr, size, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         return;
@@ -2555,7 +2599,8 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (rn == 31) {
             gen_check_sp_alignment(s);
         }
-        clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+        clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
+                                    false, rn != 31, size);
         do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, false, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
@@ -2569,7 +2614,8 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             if (is_lasr) {
                 tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
             }
-            clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+            clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
+                                        true, rn != 31, size);
             gen_store_exclusive(s, rs, rt, rt2, clean_addr, size, true);
             return;
         }
@@ -2587,7 +2633,8 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             if (rn == 31) {
                 gen_check_sp_alignment(s);
             }
-            clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+            clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
+                                        false, rn != 31, size);
             s->is_ldex = true;
             gen_load_exclusive(s, rt, rt2, clean_addr, size, true);
             if (is_lasr) {
@@ -2881,6 +2928,7 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
     bool iss_valid = !is_vector;
     bool post_index;
     bool writeback;
+    int memidx;
 
     TCGv_i64 clean_addr, dirty_addr;
 
@@ -2938,7 +2986,11 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
     if (!post_index) {
         tcg_gen_addi_i64(dirty_addr, dirty_addr, imm9);
     }
-    clean_addr = clean_data_tbi(s, dirty_addr);
+
+    memidx = is_unpriv ? get_a64_user_mem_index(s) : get_mem_index(s);
+    clean_addr = gen_mte_check1_mmuidx(s, dirty_addr, is_store,
+                                       writeback || rn != 31,
+                                       size, is_unpriv, memidx);
 
     if (is_vector) {
         if (is_store) {
@@ -2948,7 +3000,6 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
         }
     } else {
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
-        int memidx = is_unpriv ? get_a64_user_mem_index(s) : get_mem_index(s);
         bool iss_sf = disas_ldst_compute_iss_sf(size, is_signed, opc);
 
         if (is_store) {
@@ -3045,7 +3096,7 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
     ext_and_shift_reg(tcg_rm, tcg_rm, opt, shift ? size : 0);
 
     tcg_gen_add_i64(dirty_addr, dirty_addr, tcg_rm);
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = gen_mte_check1(s, dirty_addr, is_store, true, size);
 
     if (is_vector) {
         if (is_store) {
@@ -3130,7 +3181,7 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
     dirty_addr = read_cpu_reg_sp(s, rn, 1);
     offset = imm12 << size;
     tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = gen_mte_check1(s, dirty_addr, is_store, rn != 31, size);
 
     if (is_vector) {
         if (is_store) {
@@ -3223,7 +3274,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
+    clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), false, rn != 31, size);
 
     if (o3_opc == 014) {
         /*
@@ -3300,7 +3351,8 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
     tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
 
     /* Note that "clean" and "dirty" here refer to TBI not PAC.  */
-    clean_addr = clean_data_tbi(s, dirty_addr);
+    clean_addr = gen_mte_check1(s, dirty_addr, false,
+                                is_wback || rn != 31, size);
 
     tcg_rt = cpu_reg(s, rt);
     do_gpr_ld(s, tcg_rt, clean_addr, size, /* is_signed */ false,
-- 
2.25.1


