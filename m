Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04C5698AF6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:10:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUeI-0007Vk-Jp; Wed, 15 Feb 2023 22:09:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUeD-0007TC-3L
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:25 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUeA-0000Cu-Vd
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:24 -0500
Received: by mail-pg1-x532.google.com with SMTP id s8so414848pgg.11
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 19:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iR+OHJC4d8S9ZWAhhg9mI80eUMQ8XMvPXGDeNwWOMUY=;
 b=xarLZJqHQWhA4fIKMCEcxFVwZ5Iw+nFFo5TKQofK/gFI6uwKZC1gRSMCLXzQ+2IaT7
 ME5JznTey3OMrvkSFchbm71mjC4z0cl7w1h1xo5IY7348HzQrPmEy7neqqg6hF0h8s4u
 nrLZsyjIJ60DrldHJonu0idqd36FigVQnFGJcisl2+JjsZEcocZSC5qFfHThFYI9XiYs
 X5xHDDLm2FWdJSL8QUNOiefbZlD9S/7q7+Hx0orsP4iIj+0ey4GnTLhH0Jvosiqeduwd
 OopotCFDepdPwETQXoybq+xciJZcHxlb9uOnO26WBaN4H64D+CpvMXvXMrlaUu0V5ZlM
 elnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iR+OHJC4d8S9ZWAhhg9mI80eUMQ8XMvPXGDeNwWOMUY=;
 b=HFl2TPyQUO4HXFTnlbJLH+E3HvCBvRtOJ0TF44e5bKRAu8e4MGipHV/Z29oeTzS++L
 ee7p2sCZyH2OptDiItrHGTfYP6fT14QkFfg0m6v4u1rZ3m+IblGdgvXUZ7XkOaIvvq+u
 U89dEz0HQ7B0w1lqjeN+82dse9PXJs/W4SO2pttMNwRez043JWlZnElhN0H1MJP11U6Q
 rCgxtoeJWZay+Yln/6qHUapynrEaW7Wr5FQY/++6mBp6AJtLjxk9YF6kjh22O95PocZn
 6UKRo0IK1mj9R3LxPPTnulie8Kpnu3ahlzQXhd2T0OgqINEAReSF2LgNbG6OvNzZw2Vs
 +M0Q==
X-Gm-Message-State: AO0yUKW2ADjV9fKcjGloRjxAMcPmYNnMXKUY7Fq7lA3UJ0Sp8x7Ce+DG
 rmWp5EhUwRN1MHV7ZKGN5CJGaGO0oRPTZDGV4K8=
X-Google-Smtp-Source: AK7set+Ejh9g0htrZB2xtgoWC/AJoCwuR2FTCNLqOitsP5/EKFOEkMfDiPGt7FjgD27Ma2hWy+c3cg==
X-Received: by 2002:aa7:95a9:0:b0:5a8:bfe5:3076 with SMTP id
 a9-20020aa795a9000000b005a8bfe53076mr3712933pfk.19.1676516961641; 
 Wed, 15 Feb 2023 19:09:21 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 16/19] target/arm: Relax ordered/atomic alignment checks
 for LSE2
Date: Wed, 15 Feb 2023 17:08:51 -1000
Message-Id: <20230216030854.1212208-17-richard.henderson@linaro.org>
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

FEAT_LSE2 only requires that atomic operations not cross a
16-byte boundary.  Ordered operations may be completely
unaligned if SCTLR.nAA is set.

Because this alignment check is so special, do it by hand.
Make sure not to keep TCG temps live across the branch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    |  3 ++
 target/arm/helper-a64.c    |  7 +++
 target/arm/translate-a64.c | 95 ++++++++++++++++++++++++++++++++------
 3 files changed, 92 insertions(+), 13 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index ff56807247..3d5957c11f 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -110,3 +110,6 @@ DEF_HELPER_FLAGS_2(st2g_stub, TCG_CALL_NO_WG, void, env, i64)
 DEF_HELPER_FLAGS_2(ldgm, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_3(stgm, TCG_CALL_NO_WG, void, env, i64, i64)
 DEF_HELPER_FLAGS_3(stzgm_tags, TCG_CALL_NO_WG, void, env, i64, i64)
+
+DEF_HELPER_FLAGS_4(unaligned_access, TCG_CALL_NO_WG,
+                   noreturn, env, i64, i32, i32)
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 0972a4bdd0..abbe3f7077 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -952,3 +952,10 @@ void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
 
     memset(mem, 0, blocklen);
 }
+
+void HELPER(unaligned_access)(CPUARMState *env, uint64_t addr,
+                              uint32_t access_type, uint32_t mmu_idx)
+{
+    arm_cpu_do_unaligned_access(env_cpu(env), addr, access_type,
+                                mmu_idx, GETPC());
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 56c9d63664..78103f723d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -310,6 +310,77 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
     return clean_data_tbi(s, addr);
 }
 
+/*
+ * Generate the special alignment check that applies to AccType_ATOMIC
+ * and AccType_ORDERED insns under FEAT_LSE2: the access need not be
+ * naturally aligned, but it must not cross a 16-byte boundary.
+ * See AArch64.CheckAlignment().
+ */
+static void check_lse2_align(DisasContext *s, int rn, int imm,
+                             bool is_write, MemOp mop)
+{
+    TCGv_i32 tmp;
+    TCGv_i64 addr;
+    TCGLabel *over_label;
+    MMUAccessType type;
+    int mmu_idx;
+
+    tmp = tcg_temp_new_i32();
+    tcg_gen_extrl_i64_i32(tmp, cpu_reg_sp(s, rn));
+    tcg_gen_addi_i32(tmp, tmp, imm & 15);
+    tcg_gen_andi_i32(tmp, tmp, 15);
+    tcg_gen_addi_i32(tmp, tmp, memop_size(mop));
+
+    over_label = gen_new_label();
+    tcg_gen_brcond_i32(TCG_COND_LEU, tmp, tcg_constant_i32(16), over_label);
+    tcg_temp_free_i32(tmp);
+
+    addr = tcg_temp_new_i64();
+    tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm);
+
+    type = is_write ? MMU_DATA_STORE : MMU_DATA_LOAD,
+    mmu_idx = get_mem_index(s);
+    gen_helper_unaligned_access(cpu_env, addr, tcg_constant_i32(type),
+                                tcg_constant_i32(mmu_idx));
+    tcg_temp_free_i64(addr);
+
+    gen_set_label(over_label);
+
+}
+
+/* Handle the alignment check for AccType_ATOMIC instructions. */
+static MemOp check_atomic_align(DisasContext *s, int rn, MemOp mop)
+{
+    MemOp size = mop & MO_SIZE;
+
+    if (size == MO_8) {
+        return mop;
+    }
+    if (size >= MO_128 || !dc_isar_feature(aa64_lse2, s)) {
+        return mop | MO_ALIGN | s->be_data;
+    }
+    check_lse2_align(s, rn, 0, true, mop);
+    return mop | s->be_data;
+}
+
+/* Handle the alignment check for AccType_ORDERED instructions. */
+static MemOp check_ordered_align(DisasContext *s, int rn, int imm,
+                                 bool is_write, MemOp mop)
+{
+    MemOp size = mop & MO_SIZE;
+
+    if (size == MO_8) {
+        return mop;
+    }
+    if (size >= MO_128 || !dc_isar_feature(aa64_lse2, s)) {
+        return mop | MO_ALIGN | s->be_data;
+    }
+    if (!s->naa) {
+        check_lse2_align(s, rn, imm, is_write, mop);
+    }
+    return mop | s->be_data;
+}
+
 typedef struct DisasCompare64 {
     TCGCond cond;
     TCGv_i64 value;
@@ -2525,8 +2596,7 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2, int rn,
     if (memop == MO_128) {
         memop |= MO_ATMAX_8;
     }
-    memop |= MO_ALIGN;
-    memop = finalize_memop(s, memop);
+    memop = check_atomic_align(s, rn, memop);
 
     s->is_ldex = true;
     dirty_addr = cpu_reg_sp(s, rn);
@@ -2663,7 +2733,7 @@ static void gen_compare_and_swap(DisasContext *s, int rs, int rt,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-    memop = finalize_memop(s, size | MO_ALIGN);
+    memop = check_atomic_align(s, rn, size);
     clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), true, rn != 31, memop);
     tcg_gen_atomic_cmpxchg_i64(tcg_rs, clean_addr, tcg_rs, tcg_rt,
                                memidx, memop);
@@ -2685,7 +2755,7 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
     }
 
     /* This is a single atomic access, despite the "pair". */
-    memop = finalize_memop(s, (size + 1) | MO_ALIGN);
+    memop = check_atomic_align(s, rn, size + 1);
     clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), true, rn != 31, memop);
 
     if (size == 2) {
@@ -2809,8 +2879,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             gen_check_sp_alignment(s);
         }
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-        /* TODO: ARMv8.4-LSE SCTLR.nAA */
-        memop = finalize_memop(s, size | MO_ALIGN);
+        memop = check_ordered_align(s, rn, 0, true, size);
         clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
                                     true, rn != 31, memop);
         do_gpr_st(s, cpu_reg(s, rt), clean_addr, memop, true, rt,
@@ -2828,8 +2897,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (rn == 31) {
             gen_check_sp_alignment(s);
         }
-        /* TODO: ARMv8.4-LSE SCTLR.nAA */
-        memop = finalize_memop(s, size | MO_ALIGN);
+        memop = check_ordered_align(s, rn, 0, false, size);
         clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
                                     false, rn != 31, memop);
         do_gpr_ld(s, cpu_reg(s, rt), clean_addr, memop, false, true,
@@ -3510,7 +3578,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     bool a = extract32(insn, 23, 1);
     TCGv_i64 tcg_rs, tcg_rt, clean_addr;
     AtomicThreeOpFn *fn = NULL;
-    MemOp mop = finalize_memop(s, size | MO_ALIGN);
+    MemOp mop = size;
 
     if (is_vector || !dc_isar_feature(aa64_atomics, s)) {
         unallocated_encoding(s);
@@ -3561,6 +3629,8 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
+
+    mop = check_atomic_align(s, rn, mop);
     clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn), false, rn != 31, mop);
 
     if (o3_opc == 014) {
@@ -3685,16 +3755,13 @@ static void disas_ldst_ldapr_stlr(DisasContext *s, uint32_t insn)
     bool is_store = false;
     bool extend = false;
     bool iss_sf;
-    MemOp mop;
+    MemOp mop = size;
 
     if (!dc_isar_feature(aa64_rcpc_8_4, s)) {
         unallocated_encoding(s);
         return;
     }
 
-    /* TODO: ARMv8.4-LSE SCTLR.nAA */
-    mop = finalize_memop(s, size | MO_ALIGN);
-
     switch (opc) {
     case 0: /* STLURB */
         is_store = true;
@@ -3726,6 +3793,8 @@ static void disas_ldst_ldapr_stlr(DisasContext *s, uint32_t insn)
         gen_check_sp_alignment(s);
     }
 
+    mop = check_ordered_align(s, rn, offset, is_store, mop);
+
     dirty_addr = read_cpu_reg_sp(s, rn, 1);
     tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
     clean_addr = clean_data_tbi(s, dirty_addr);
-- 
2.34.1


