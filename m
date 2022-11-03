Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B4B617E8F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 14:58:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqaip-0007Ym-Rg; Thu, 03 Nov 2022 09:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangrui@loongson.cn>)
 id 1oqVBp-0004sJ-QA
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 04:03:06 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangrui@loongson.cn>) id 1oqVBm-0005Zn-IE
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 04:03:05 -0400
Received: from loongson.cn (unknown [58.209.5.111])
 by gateway (Coremail) with SMTP id _____8BxLtuodWNjpS4EAA--.14595S3;
 Thu, 03 Nov 2022 16:02:48 +0800 (CST)
Received: from localhost.localdomain (unknown [58.209.5.111])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxb+KjdWNjd3wLAA--.33782S2; 
 Thu, 03 Nov 2022 16:02:48 +0800 (CST)
From: Rui Wang <wangrui@loongson.cn>
To: Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>
Cc: qemu-devel@nongnu.org, hev <qemu@hev.cc>, Rui Wang <wangrui@loongson.cn>
Subject: [PATCH RFC] target/loongarch: Fix emulation of float-point disable
 exception
Date: Thu,  3 Nov 2022 16:02:32 +0800
Message-Id: <20221103080232.55953-1-wangrui@loongson.cn>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxb+KjdWNjd3wLAA--.33782S2
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoWfJr4kWF43Kw4fCr15XryrWFg_yoW8JryxAo
 WkA3WUCrW8Jw4fuFnxKFs7XFW7tF47Ga13A390va4qga1xury8tFyrK3s5Za13WFyxKryr
 Wa43tFnxtryxAr9rn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s
 0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4
 xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8
 JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I
 8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
 xVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
 AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8I
 cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
 1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8yCJUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=wangrui@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 03 Nov 2022 09:57:21 -0400
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

Signed-off-by: Rui Wang <wangrui@loongson.cn>
---
 target/loongarch/cpu.c                        |  2 ++
 .../loongarch/insn_trans/trans_farith.c.inc   | 36 +++++++++++++++++++
 target/loongarch/insn_trans/trans_fcmp.c.inc  |  5 +++
 .../loongarch/insn_trans/trans_fmemory.c.inc  | 16 +++++++++
 target/loongarch/insn_trans/trans_fmov.c.inc  | 20 +++++++++++
 target/loongarch/translate.c                  |  4 +++
 target/loongarch/translate.h                  |  1 +
 7 files changed, 84 insertions(+)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 49393d95d8..abe4a819b2 100644
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
@@ -184,6 +185,7 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
     case EXCCODE_BRK:
     case EXCCODE_INE:
     case EXCCODE_IPE:
+    case EXCCODE_FPD:
     case EXCCODE_FPE:
     case EXCCODE_BCE:
         env->CSR_BADV = env->pc;
diff --git a/target/loongarch/insn_trans/trans_farith.c.inc b/target/loongarch/insn_trans/trans_farith.c.inc
index 7bb3f41aee..3574b9b746 100644
--- a/target/loongarch/insn_trans/trans_farith.c.inc
+++ b/target/loongarch/insn_trans/trans_farith.c.inc
@@ -3,9 +3,28 @@
  * Copyright (c) 2021 Loongson Technology Corporation Limited
  */
 
+static void check_fpe(DisasContext *ctx)
+{
+#ifndef CONFIG_USER_ONLY
+    TCGLabel *skip = gen_new_label();
+    TCGv tmp = tcg_temp_new();
+
+    tcg_gen_andi_tl(tmp, cpu_euen, R_CSR_EUEN_FPE_MASK);
+    tcg_gen_brcond_tl(TCG_COND_NE, tmp, ctx->zero, skip);
+    tcg_temp_free(tmp);
+
+    generate_exception(ctx, EXCCODE_FPD);
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
+
+    gen_set_label(skip);
+#endif
+}
+
 static bool gen_fff(DisasContext *ctx, arg_fff *a,
                     void (*func)(TCGv, TCGv_env, TCGv, TCGv))
 {
+    check_fpe(ctx);
+
     func(cpu_fpr[a->fd], cpu_env, cpu_fpr[a->fj], cpu_fpr[a->fk]);
     return true;
 }
@@ -13,6 +32,8 @@ static bool gen_fff(DisasContext *ctx, arg_fff *a,
 static bool gen_ff(DisasContext *ctx, arg_ff *a,
                    void (*func)(TCGv, TCGv_env, TCGv))
 {
+    check_fpe(ctx);
+
     func(cpu_fpr[a->fd], cpu_env, cpu_fpr[a->fj]);
     return true;
 }
@@ -22,6 +43,9 @@ static bool gen_muladd(DisasContext *ctx, arg_ffff *a,
                        int flag)
 {
     TCGv_i32 tflag = tcg_constant_i32(flag);
+
+    check_fpe(ctx);
+
     func(cpu_fpr[a->fd], cpu_env, cpu_fpr[a->fj],
          cpu_fpr[a->fk], cpu_fpr[a->fa], tflag);
     return true;
@@ -29,18 +53,24 @@ static bool gen_muladd(DisasContext *ctx, arg_ffff *a,
 
 static bool trans_fcopysign_s(DisasContext *ctx, arg_fcopysign_s *a)
 {
+    check_fpe(ctx);
+
     tcg_gen_deposit_i64(cpu_fpr[a->fd], cpu_fpr[a->fk], cpu_fpr[a->fj], 0, 31);
     return true;
 }
 
 static bool trans_fcopysign_d(DisasContext *ctx, arg_fcopysign_d *a)
 {
+    check_fpe(ctx);
+
     tcg_gen_deposit_i64(cpu_fpr[a->fd], cpu_fpr[a->fk], cpu_fpr[a->fj], 0, 63);
     return true;
 }
 
 static bool trans_fabs_s(DisasContext *ctx, arg_fabs_s *a)
 {
+    check_fpe(ctx);
+
     tcg_gen_andi_i64(cpu_fpr[a->fd], cpu_fpr[a->fj], MAKE_64BIT_MASK(0, 31));
     gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
     return true;
@@ -48,12 +78,16 @@ static bool trans_fabs_s(DisasContext *ctx, arg_fabs_s *a)
 
 static bool trans_fabs_d(DisasContext *ctx, arg_fabs_d *a)
 {
+    check_fpe(ctx);
+
     tcg_gen_andi_i64(cpu_fpr[a->fd], cpu_fpr[a->fj], MAKE_64BIT_MASK(0, 63));
     return true;
 }
 
 static bool trans_fneg_s(DisasContext *ctx, arg_fneg_s *a)
 {
+    check_fpe(ctx);
+
     tcg_gen_xori_i64(cpu_fpr[a->fd], cpu_fpr[a->fj], 0x80000000);
     gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
     return true;
@@ -61,6 +95,8 @@ static bool trans_fneg_s(DisasContext *ctx, arg_fneg_s *a)
 
 static bool trans_fneg_d(DisasContext *ctx, arg_fneg_d *a)
 {
+    check_fpe(ctx);
+
     tcg_gen_xori_i64(cpu_fpr[a->fd], cpu_fpr[a->fj], 0x8000000000000000LL);
     return true;
 }
diff --git a/target/loongarch/insn_trans/trans_fcmp.c.inc b/target/loongarch/insn_trans/trans_fcmp.c.inc
index 93a6a2230f..32b903231b 100644
--- a/target/loongarch/insn_trans/trans_fcmp.c.inc
+++ b/target/loongarch/insn_trans/trans_fcmp.c.inc
@@ -29,6 +29,8 @@ static bool trans_fcmp_cond_s(DisasContext *ctx, arg_fcmp_cond_s *a)
     uint32_t flags;
     void (*fn)(TCGv, TCGv_env, TCGv, TCGv, TCGv_i32);
 
+    check_fpe(ctx);
+
     fn = (a->fcond & 1 ? gen_helper_fcmp_s_s : gen_helper_fcmp_c_s);
     flags = get_fcmp_flags(a->fcond >> 1);
 
@@ -44,6 +46,9 @@ static bool trans_fcmp_cond_d(DisasContext *ctx, arg_fcmp_cond_d *a)
     TCGv var = tcg_temp_new();
     uint32_t flags;
     void (*fn)(TCGv, TCGv_env, TCGv, TCGv, TCGv_i32);
+
+    check_fpe(ctx);
+
     fn = (a->fcond & 1 ? gen_helper_fcmp_s_d : gen_helper_fcmp_c_d);
     flags = get_fcmp_flags(a->fcond >> 1);
 
diff --git a/target/loongarch/insn_trans/trans_fmemory.c.inc b/target/loongarch/insn_trans/trans_fmemory.c.inc
index 74ee98f63a..508af75adf 100644
--- a/target/loongarch/insn_trans/trans_fmemory.c.inc
+++ b/target/loongarch/insn_trans/trans_fmemory.c.inc
@@ -15,6 +15,8 @@ static bool gen_fload_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
     TCGv temp = NULL;
 
+    check_fpe(ctx);
+
     if (a->imm) {
         temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
@@ -36,6 +38,8 @@ static bool gen_fstore_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
     TCGv temp = NULL;
 
+    check_fpe(ctx);
+
     if (a->imm) {
         temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
@@ -56,6 +60,8 @@ static bool gen_floadx(DisasContext *ctx, arg_frr *a, MemOp mop)
     TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
     TCGv addr = tcg_temp_new();
 
+    check_fpe(ctx);
+
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
     maybe_nanbox_load(cpu_fpr[a->fd], mop);
@@ -70,6 +76,8 @@ static bool gen_fstorex(DisasContext *ctx, arg_frr *a, MemOp mop)
     TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
     TCGv addr = tcg_temp_new();
 
+    check_fpe(ctx);
+
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
     tcg_temp_free(addr);
@@ -83,6 +91,8 @@ static bool gen_fload_gt(DisasContext *ctx, arg_frr *a, MemOp mop)
     TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
     TCGv addr = tcg_temp_new();
 
+    check_fpe(ctx);
+
     gen_helper_asrtgt_d(cpu_env, src1, src2);
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
@@ -98,6 +108,8 @@ static bool gen_fstore_gt(DisasContext *ctx, arg_frr *a, MemOp mop)
     TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
     TCGv addr = tcg_temp_new();
 
+    check_fpe(ctx);
+
     gen_helper_asrtgt_d(cpu_env, src1, src2);
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
@@ -112,6 +124,8 @@ static bool gen_fload_le(DisasContext *ctx, arg_frr *a, MemOp mop)
     TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
     TCGv addr = tcg_temp_new();
 
+    check_fpe(ctx);
+
     gen_helper_asrtle_d(cpu_env, src1, src2);
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
@@ -127,6 +141,8 @@ static bool gen_fstore_le(DisasContext *ctx, arg_frr *a, MemOp mop)
     TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
     TCGv addr = tcg_temp_new();
 
+    check_fpe(ctx);
+
     gen_helper_asrtle_d(cpu_env, src1, src2);
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
diff --git a/target/loongarch/insn_trans/trans_fmov.c.inc b/target/loongarch/insn_trans/trans_fmov.c.inc
index 5537e3dd35..a1d87719f8 100644
--- a/target/loongarch/insn_trans/trans_fmov.c.inc
+++ b/target/loongarch/insn_trans/trans_fmov.c.inc
@@ -12,6 +12,8 @@ static bool trans_fsel(DisasContext *ctx, arg_fsel *a)
     TCGv zero = tcg_constant_tl(0);
     TCGv cond = tcg_temp_new();
 
+    check_fpe(ctx);
+
     tcg_gen_ld8u_tl(cond, cpu_env, offsetof(CPULoongArchState, cf[a->ca]));
     tcg_gen_movcond_tl(TCG_COND_EQ, cpu_fpr[a->fd], cond, zero,
                        cpu_fpr[a->fj], cpu_fpr[a->fk]);
@@ -26,6 +28,8 @@ static bool gen_f2f(DisasContext *ctx, arg_ff *a,
     TCGv dest = cpu_fpr[a->fd];
     TCGv src = cpu_fpr[a->fj];
 
+    check_fpe(ctx);
+
     func(dest, src);
     if (nanbox) {
         gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
@@ -39,6 +43,8 @@ static bool gen_r2f(DisasContext *ctx, arg_fr *a,
 {
     TCGv src = gpr_src(ctx, a->rj, EXT_NONE);
 
+    check_fpe(ctx);
+
     func(cpu_fpr[a->fd], src);
     return true;
 }
@@ -48,6 +54,8 @@ static bool gen_f2r(DisasContext *ctx, arg_rf *a,
 {
     TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
 
+    check_fpe(ctx);
+
     func(dest, cpu_fpr[a->fj]);
     gen_set_gpr(a->rd, dest, EXT_NONE);
 
@@ -59,6 +67,8 @@ static bool trans_movgr2fcsr(DisasContext *ctx, arg_movgr2fcsr *a)
     uint32_t mask = fcsr_mask[a->fcsrd];
     TCGv Rj = gpr_src(ctx, a->rj, EXT_NONE);
 
+    check_fpe(ctx);
+
     if (mask == UINT32_MAX) {
         tcg_gen_st32_i64(Rj, cpu_env, offsetof(CPULoongArchState, fcsr0));
     } else {
@@ -90,6 +100,8 @@ static bool trans_movfcsr2gr(DisasContext *ctx, arg_movfcsr2gr *a)
 {
     TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
 
+    check_fpe(ctx);
+
     tcg_gen_ld32u_i64(dest, cpu_env, offsetof(CPULoongArchState, fcsr0));
     tcg_gen_andi_i64(dest, dest, fcsr_mask[a->fcsrs]);
     gen_set_gpr(a->rd, dest, EXT_NONE);
@@ -116,6 +128,8 @@ static bool trans_movfr2cf(DisasContext *ctx, arg_movfr2cf *a)
 {
     TCGv t0 = tcg_temp_new();
 
+    check_fpe(ctx);
+
     tcg_gen_andi_tl(t0, cpu_fpr[a->fj], 0x1);
     tcg_gen_st8_tl(t0, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 0x7]));
     tcg_temp_free(t0);
@@ -125,6 +139,8 @@ static bool trans_movfr2cf(DisasContext *ctx, arg_movfr2cf *a)
 
 static bool trans_movcf2fr(DisasContext *ctx, arg_movcf2fr *a)
 {
+    check_fpe(ctx);
+
     tcg_gen_ld8u_tl(cpu_fpr[a->fd], cpu_env,
                     offsetof(CPULoongArchState, cf[a->cj & 0x7]));
     return true;
@@ -134,6 +150,8 @@ static bool trans_movgr2cf(DisasContext *ctx, arg_movgr2cf *a)
 {
     TCGv t0 = tcg_temp_new();
 
+    check_fpe(ctx);
+
     tcg_gen_andi_tl(t0, gpr_src(ctx, a->rj, EXT_NONE), 0x1);
     tcg_gen_st8_tl(t0, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 0x7]));
     tcg_temp_free(t0);
@@ -143,6 +161,8 @@ static bool trans_movgr2cf(DisasContext *ctx, arg_movgr2cf *a)
 
 static bool trans_movcf2gr(DisasContext *ctx, arg_movcf2gr *a)
 {
+    check_fpe(ctx);
+
     tcg_gen_ld8u_tl(gpr_dst(ctx, a->rd, EXT_NONE), cpu_env,
                     offsetof(CPULoongArchState, cf[a->cj & 0x7]));
     return true;
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 6091772349..5204653701 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -18,11 +18,13 @@
 #include "fpu/softfloat.h"
 #include "translate.h"
 #include "internals.h"
+#include "cpu-csr.h"
 
 /* Global register indices */
 TCGv cpu_gpr[32], cpu_pc;
 static TCGv cpu_lladdr, cpu_llval;
 TCGv_i64 cpu_fpr[32];
+TCGv_i64 cpu_euen;
 
 #include "exec/gen-icount.h"
 
@@ -267,6 +269,8 @@ void loongarch_translate_init(void)
     }
 
     cpu_pc = tcg_global_mem_new(cpu_env, offsetof(CPULoongArchState, pc), "pc");
+    cpu_euen = tcg_global_mem_new(cpu_env,
+                    offsetof(CPULoongArchState, CSR_EUEN), "cpu_euen");
     cpu_lladdr = tcg_global_mem_new(cpu_env,
                     offsetof(CPULoongArchState, lladdr), "lladdr");
     cpu_llval = tcg_global_mem_new(cpu_env,
diff --git a/target/loongarch/translate.h b/target/loongarch/translate.h
index 9cc12512d1..3bf68867f5 100644
--- a/target/loongarch/translate.h
+++ b/target/loongarch/translate.h
@@ -41,5 +41,6 @@ void generate_exception(DisasContext *ctx, int excp);
 extern TCGv cpu_gpr[32], cpu_pc;
 extern TCGv_i32 cpu_fscr0;
 extern TCGv_i64 cpu_fpr[32];
+extern TCGv_i64 cpu_euen;
 
 #endif
-- 
2.38.1


