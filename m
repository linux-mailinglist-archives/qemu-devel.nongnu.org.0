Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ECF618F68
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 05:07:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqnyK-0002ND-BS; Fri, 04 Nov 2022 00:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r@hev.cc>) id 1oqnyH-0002N3-NX
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 00:06:21 -0400
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <r@hev.cc>) id 1oqnyF-00028J-Lm
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 00:06:21 -0400
Received: by mail-pj1-f54.google.com with SMTP id
 m6-20020a17090a5a4600b00212f8dffec9so3662925pji.0
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 21:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bGKj6raJNBGAyqPFpiZ/rHTYoieYPAmWAaPHGIgmyHE=;
 b=6auNqMeuRez2k1WHHTwZKY4pRoW3Iu1GvAAUnovMUyYeFRp9Fq7PILOKanv24W89GE
 FTc4wUCc0ga2/3Umw36VNFqfoIOmmu1A5oHQj0nOPUefgn6w8U5OmH/uVM40tkn9Ipmk
 ch+mtOl8//sYfYOBZ3YC3Ax7y7zUhzkVV5NLbRe0r+iSQnrm2haPO+KPgcKMCjBl0eXU
 X098AyrwnM/gUelFJ62sKxQJuxB90f3PZ5V01ktC1c86AZLW5ENxefJ4fBrcTzmyGYWj
 xOBhGwhMiDKmB9JAX0Jh9Apw/0Bns9fYhRczOSbkjZkAuVmVMQgbP6Vwq6YOKtT74ooa
 tqYQ==
X-Gm-Message-State: ACrzQf0JxAt79zhM+C6HrLh+u4N9nIoqqPVNvfpdsPB6jz2zniTZ6kBZ
 +LU9pVIFogEP14dMdTmXymCjRw==
X-Google-Smtp-Source: AMsMyM7l0ufGxkrlYii83lk0tHyZIuKMfMOeyNHtbK9E6YJJKqQ9FvhdrcG/HFnSQBepLa/REracgg==
X-Received: by 2002:a17:90b:4a92:b0:213:54f:ddd8 with SMTP id
 lp18-20020a17090b4a9200b00213054fddd8mr52564916pjb.234.1667534778870; 
 Thu, 03 Nov 2022 21:06:18 -0700 (PDT)
Received: from localhost.localdomain ([2400:8901:e002:5400::])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa79991000000b005636326fdbfsm1562308pfh.78.2022.11.03.21.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 21:06:18 -0700 (PDT)
From: Rui Wang <wangrui@loongson.cn>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 qemu-devel@nongnu.org, hev <qemu@hev.cc>, Rui Wang <wangrui@loongson.cn>
Subject: [PATCH v3 2/2] target/loongarch: Fix emulation of float-point disable
 exception
Date: Fri,  4 Nov 2022 12:05:17 +0800
Message-Id: <20221104040517.222059-3-wangrui@loongson.cn>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104040517.222059-1-wangrui@loongson.cn>
References: <20221104040517.222059-1-wangrui@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.54; envelope-from=r@hev.cc;
 helo=mail-pj1-f54.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We need to emulate it to generate a floating point disable exception
when CSR.EUEN.FPE is zero.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Rui Wang <wangrui@loongson.cn>
---
 target/loongarch/cpu.c                        |  2 ++
 target/loongarch/cpu.h                        |  2 ++
 .../loongarch/insn_trans/trans_farith.c.inc   | 30 ++++++++++++++++
 target/loongarch/insn_trans/trans_fcmp.c.inc  | 11 ++++--
 .../loongarch/insn_trans/trans_fmemory.c.inc  | 34 +++++++++++++++----
 target/loongarch/insn_trans/trans_fmov.c.inc  | 29 ++++++++++++++--
 6 files changed, 97 insertions(+), 11 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 1512664214..46b04cbdad 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -48,6 +48,7 @@ static const char * const excp_names[] = {
     [EXCCODE_BRK] = "Break",
     [EXCCODE_INE] = "Instruction Non-Existent",
     [EXCCODE_IPE] = "Instruction privilege error",
+    [EXCCODE_FPD] = "Floating Point Disabled",
     [EXCCODE_FPE] = "Floating Point Exception",
     [EXCCODE_DBP] = "Debug breakpoint",
     [EXCCODE_BCE] = "Bound Check Exception",
@@ -185,6 +186,7 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
     case EXCCODE_BRK:
     case EXCCODE_INE:
     case EXCCODE_IPE:
+    case EXCCODE_FPD:
     case EXCCODE_FPE:
     case EXCCODE_BCE:
         env->CSR_BADV = env->pc;
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index f482ad94fe..08c1f6baa1 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -397,6 +397,7 @@ static inline int cpu_mmu_index(CPULoongArchState *env, bool ifetch)
  */
 #define HW_FLAGS_PLV_MASK   R_CSR_CRMD_PLV_MASK  /* 0x03 */
 #define HW_FLAGS_CRMD_PG    R_CSR_CRMD_PG_MASK   /* 0x10 */
+#define HW_FLAGS_EUEN_FPE   0x04
 
 static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
                                         target_ulong *pc,
@@ -406,6 +407,7 @@ static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
     *pc = env->pc;
     *cs_base = 0;
     *flags = env->CSR_CRMD & (R_CSR_CRMD_PLV_MASK | R_CSR_CRMD_PG_MASK);
+    *flags |= FIELD_EX64(env->CSR_EUEN, CSR_EUEN, FPE) * HW_FLAGS_EUEN_FPE;
 }
 
 void loongarch_cpu_list(void);
diff --git a/target/loongarch/insn_trans/trans_farith.c.inc b/target/loongarch/insn_trans/trans_farith.c.inc
index 7bb3f41aee..e2dec75dfb 100644
--- a/target/loongarch/insn_trans/trans_farith.c.inc
+++ b/target/loongarch/insn_trans/trans_farith.c.inc
@@ -3,9 +3,22 @@
  * Copyright (c) 2021 Loongson Technology Corporation Limited
  */
 
+#ifndef CONFIG_USER_ONLY
+#define CHECK_FPE do { \
+    if ((ctx->base.tb->flags & HW_FLAGS_EUEN_FPE) == 0) { \
+        generate_exception(ctx, EXCCODE_FPD); \
+        return false; \
+    } \
+} while (0)
+#else
+#define CHECK_FPE
+#endif
+
 static bool gen_fff(DisasContext *ctx, arg_fff *a,
                     void (*func)(TCGv, TCGv_env, TCGv, TCGv))
 {
+    CHECK_FPE;
+
     func(cpu_fpr[a->fd], cpu_env, cpu_fpr[a->fj], cpu_fpr[a->fk]);
     return true;
 }
@@ -13,6 +26,8 @@ static bool gen_fff(DisasContext *ctx, arg_fff *a,
 static bool gen_ff(DisasContext *ctx, arg_ff *a,
                    void (*func)(TCGv, TCGv_env, TCGv))
 {
+    CHECK_FPE;
+
     func(cpu_fpr[a->fd], cpu_env, cpu_fpr[a->fj]);
     return true;
 }
@@ -22,6 +37,9 @@ static bool gen_muladd(DisasContext *ctx, arg_ffff *a,
                        int flag)
 {
     TCGv_i32 tflag = tcg_constant_i32(flag);
+
+    CHECK_FPE;
+
     func(cpu_fpr[a->fd], cpu_env, cpu_fpr[a->fj],
          cpu_fpr[a->fk], cpu_fpr[a->fa], tflag);
     return true;
@@ -29,18 +47,24 @@ static bool gen_muladd(DisasContext *ctx, arg_ffff *a,
 
 static bool trans_fcopysign_s(DisasContext *ctx, arg_fcopysign_s *a)
 {
+    CHECK_FPE;
+
     tcg_gen_deposit_i64(cpu_fpr[a->fd], cpu_fpr[a->fk], cpu_fpr[a->fj], 0, 31);
     return true;
 }
 
 static bool trans_fcopysign_d(DisasContext *ctx, arg_fcopysign_d *a)
 {
+    CHECK_FPE;
+
     tcg_gen_deposit_i64(cpu_fpr[a->fd], cpu_fpr[a->fk], cpu_fpr[a->fj], 0, 63);
     return true;
 }
 
 static bool trans_fabs_s(DisasContext *ctx, arg_fabs_s *a)
 {
+    CHECK_FPE;
+
     tcg_gen_andi_i64(cpu_fpr[a->fd], cpu_fpr[a->fj], MAKE_64BIT_MASK(0, 31));
     gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
     return true;
@@ -48,12 +72,16 @@ static bool trans_fabs_s(DisasContext *ctx, arg_fabs_s *a)
 
 static bool trans_fabs_d(DisasContext *ctx, arg_fabs_d *a)
 {
+    CHECK_FPE;
+
     tcg_gen_andi_i64(cpu_fpr[a->fd], cpu_fpr[a->fj], MAKE_64BIT_MASK(0, 63));
     return true;
 }
 
 static bool trans_fneg_s(DisasContext *ctx, arg_fneg_s *a)
 {
+    CHECK_FPE;
+
     tcg_gen_xori_i64(cpu_fpr[a->fd], cpu_fpr[a->fj], 0x80000000);
     gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
     return true;
@@ -61,6 +89,8 @@ static bool trans_fneg_s(DisasContext *ctx, arg_fneg_s *a)
 
 static bool trans_fneg_d(DisasContext *ctx, arg_fneg_d *a)
 {
+    CHECK_FPE;
+
     tcg_gen_xori_i64(cpu_fpr[a->fd], cpu_fpr[a->fj], 0x8000000000000000LL);
     return true;
 }
diff --git a/target/loongarch/insn_trans/trans_fcmp.c.inc b/target/loongarch/insn_trans/trans_fcmp.c.inc
index 93a6a2230f..2ccf646ccb 100644
--- a/target/loongarch/insn_trans/trans_fcmp.c.inc
+++ b/target/loongarch/insn_trans/trans_fcmp.c.inc
@@ -25,10 +25,13 @@ static uint32_t get_fcmp_flags(int cond)
 
 static bool trans_fcmp_cond_s(DisasContext *ctx, arg_fcmp_cond_s *a)
 {
-    TCGv var = tcg_temp_new();
+    TCGv var;
     uint32_t flags;
     void (*fn)(TCGv, TCGv_env, TCGv, TCGv, TCGv_i32);
 
+    CHECK_FPE;
+
+    var = tcg_temp_new();
     fn = (a->fcond & 1 ? gen_helper_fcmp_s_s : gen_helper_fcmp_c_s);
     flags = get_fcmp_flags(a->fcond >> 1);
 
@@ -41,9 +44,13 @@ static bool trans_fcmp_cond_s(DisasContext *ctx, arg_fcmp_cond_s *a)
 
 static bool trans_fcmp_cond_d(DisasContext *ctx, arg_fcmp_cond_d *a)
 {
-    TCGv var = tcg_temp_new();
+    TCGv var;
     uint32_t flags;
     void (*fn)(TCGv, TCGv_env, TCGv, TCGv, TCGv_i32);
+
+    CHECK_FPE;
+
+    var = tcg_temp_new();
     fn = (a->fcond & 1 ? gen_helper_fcmp_s_d : gen_helper_fcmp_c_d);
     flags = get_fcmp_flags(a->fcond >> 1);
 
diff --git a/target/loongarch/insn_trans/trans_fmemory.c.inc b/target/loongarch/insn_trans/trans_fmemory.c.inc
index 74ee98f63a..3025a1d3e9 100644
--- a/target/loongarch/insn_trans/trans_fmemory.c.inc
+++ b/target/loongarch/insn_trans/trans_fmemory.c.inc
@@ -15,6 +15,8 @@ static bool gen_fload_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
     TCGv temp = NULL;
 
+    CHECK_FPE;
+
     if (a->imm) {
         temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
@@ -36,6 +38,8 @@ static bool gen_fstore_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
     TCGv temp = NULL;
 
+    CHECK_FPE;
+
     if (a->imm) {
         temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
@@ -54,8 +58,11 @@ static bool gen_floadx(DisasContext *ctx, arg_frr *a, MemOp mop)
 {
     TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
     TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
-    TCGv addr = tcg_temp_new();
+    TCGv addr;
 
+    CHECK_FPE;
+
+    addr = tcg_temp_new();
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
     maybe_nanbox_load(cpu_fpr[a->fd], mop);
@@ -68,8 +75,11 @@ static bool gen_fstorex(DisasContext *ctx, arg_frr *a, MemOp mop)
 {
     TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
     TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
-    TCGv addr = tcg_temp_new();
+    TCGv addr;
+
+    CHECK_FPE;
 
+    addr = tcg_temp_new();
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
     tcg_temp_free(addr);
@@ -81,8 +91,11 @@ static bool gen_fload_gt(DisasContext *ctx, arg_frr *a, MemOp mop)
 {
     TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
     TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
-    TCGv addr = tcg_temp_new();
+    TCGv addr;
 
+    CHECK_FPE;
+
+    addr = tcg_temp_new();
     gen_helper_asrtgt_d(cpu_env, src1, src2);
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
@@ -96,8 +109,11 @@ static bool gen_fstore_gt(DisasContext *ctx, arg_frr *a, MemOp mop)
 {
     TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
     TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
-    TCGv addr = tcg_temp_new();
+    TCGv addr;
+
+    CHECK_FPE;
 
+    addr = tcg_temp_new();
     gen_helper_asrtgt_d(cpu_env, src1, src2);
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
@@ -110,8 +126,11 @@ static bool gen_fload_le(DisasContext *ctx, arg_frr *a, MemOp mop)
 {
     TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
     TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
-    TCGv addr = tcg_temp_new();
+    TCGv addr;
 
+    CHECK_FPE;
+
+    addr = tcg_temp_new();
     gen_helper_asrtle_d(cpu_env, src1, src2);
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
@@ -125,8 +144,11 @@ static bool gen_fstore_le(DisasContext *ctx, arg_frr *a, MemOp mop)
 {
     TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
     TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
-    TCGv addr = tcg_temp_new();
+    TCGv addr;
+
+    CHECK_FPE;
 
+    addr = tcg_temp_new();
     gen_helper_asrtle_d(cpu_env, src1, src2);
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
diff --git a/target/loongarch/insn_trans/trans_fmov.c.inc b/target/loongarch/insn_trans/trans_fmov.c.inc
index 5537e3dd35..8e5106db4e 100644
--- a/target/loongarch/insn_trans/trans_fmov.c.inc
+++ b/target/loongarch/insn_trans/trans_fmov.c.inc
@@ -10,8 +10,11 @@ static const uint32_t fcsr_mask[4] = {
 static bool trans_fsel(DisasContext *ctx, arg_fsel *a)
 {
     TCGv zero = tcg_constant_tl(0);
-    TCGv cond = tcg_temp_new();
+    TCGv cond;
 
+    CHECK_FPE;
+
+    cond = tcg_temp_new();
     tcg_gen_ld8u_tl(cond, cpu_env, offsetof(CPULoongArchState, cf[a->ca]));
     tcg_gen_movcond_tl(TCG_COND_EQ, cpu_fpr[a->fd], cond, zero,
                        cpu_fpr[a->fj], cpu_fpr[a->fk]);
@@ -26,6 +29,8 @@ static bool gen_f2f(DisasContext *ctx, arg_ff *a,
     TCGv dest = cpu_fpr[a->fd];
     TCGv src = cpu_fpr[a->fj];
 
+    CHECK_FPE;
+
     func(dest, src);
     if (nanbox) {
         gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
@@ -39,6 +44,8 @@ static bool gen_r2f(DisasContext *ctx, arg_fr *a,
 {
     TCGv src = gpr_src(ctx, a->rj, EXT_NONE);
 
+    CHECK_FPE;
+
     func(cpu_fpr[a->fd], src);
     return true;
 }
@@ -48,6 +55,8 @@ static bool gen_f2r(DisasContext *ctx, arg_rf *a,
 {
     TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
 
+    CHECK_FPE;
+
     func(dest, cpu_fpr[a->fj]);
     gen_set_gpr(a->rd, dest, EXT_NONE);
 
@@ -59,6 +68,8 @@ static bool trans_movgr2fcsr(DisasContext *ctx, arg_movgr2fcsr *a)
     uint32_t mask = fcsr_mask[a->fcsrd];
     TCGv Rj = gpr_src(ctx, a->rj, EXT_NONE);
 
+    CHECK_FPE;
+
     if (mask == UINT32_MAX) {
         tcg_gen_st32_i64(Rj, cpu_env, offsetof(CPULoongArchState, fcsr0));
     } else {
@@ -90,6 +101,8 @@ static bool trans_movfcsr2gr(DisasContext *ctx, arg_movfcsr2gr *a)
 {
     TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
 
+    CHECK_FPE;
+
     tcg_gen_ld32u_i64(dest, cpu_env, offsetof(CPULoongArchState, fcsr0));
     tcg_gen_andi_i64(dest, dest, fcsr_mask[a->fcsrs]);
     gen_set_gpr(a->rd, dest, EXT_NONE);
@@ -114,8 +127,11 @@ static void gen_movfrh2gr_s(TCGv dest, TCGv src)
 
 static bool trans_movfr2cf(DisasContext *ctx, arg_movfr2cf *a)
 {
-    TCGv t0 = tcg_temp_new();
+    TCGv t0;
+
+    CHECK_FPE;
 
+    t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, cpu_fpr[a->fj], 0x1);
     tcg_gen_st8_tl(t0, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 0x7]));
     tcg_temp_free(t0);
@@ -125,6 +141,8 @@ static bool trans_movfr2cf(DisasContext *ctx, arg_movfr2cf *a)
 
 static bool trans_movcf2fr(DisasContext *ctx, arg_movcf2fr *a)
 {
+    CHECK_FPE;
+
     tcg_gen_ld8u_tl(cpu_fpr[a->fd], cpu_env,
                     offsetof(CPULoongArchState, cf[a->cj & 0x7]));
     return true;
@@ -132,8 +150,11 @@ static bool trans_movcf2fr(DisasContext *ctx, arg_movcf2fr *a)
 
 static bool trans_movgr2cf(DisasContext *ctx, arg_movgr2cf *a)
 {
-    TCGv t0 = tcg_temp_new();
+    TCGv t0;
 
+    CHECK_FPE;
+
+    t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, gpr_src(ctx, a->rj, EXT_NONE), 0x1);
     tcg_gen_st8_tl(t0, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 0x7]));
     tcg_temp_free(t0);
@@ -143,6 +164,8 @@ static bool trans_movgr2cf(DisasContext *ctx, arg_movgr2cf *a)
 
 static bool trans_movcf2gr(DisasContext *ctx, arg_movcf2gr *a)
 {
+    CHECK_FPE;
+
     tcg_gen_ld8u_tl(gpr_dst(ctx, a->rd, EXT_NONE), cpu_env,
                     offsetof(CPULoongArchState, cf[a->cj & 0x7]));
     return true;
-- 
2.38.1


