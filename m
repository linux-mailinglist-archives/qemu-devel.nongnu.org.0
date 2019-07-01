Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1634CBB1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 12:22:13 +0200 (CEST)
Received: from localhost ([::1]:45918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hduCq-00015p-Vp
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 06:22:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37451)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdu9K-0007CI-QH
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 06:18:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdtxg-0001ab-Mm
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 06:06:34 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:52464 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hdtuF-00088y-H6
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 06:03:02 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 70AB51A464C;
 Thu, 20 Jun 2019 12:02:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 4C1851A4775;
 Thu, 20 Jun 2019 12:02:16 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 20 Jun 2019 12:02:09 +0200
Message-Id: <1561024929-26004-5-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561024929-26004-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1561024929-26004-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v3 4/4] target/mips: Fix if-else-switch-case
 arms checkpatch errors in translate.c
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
Cc: arikalo@wavecomp.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Remove if-else-switch-case-arms-related checkpatch errors.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/translate.c | 205 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 133 insertions(+), 72 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 54e0160..d489148 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2619,16 +2619,18 @@ static const char * const mxuregnames[] = {
 /* General purpose registers moves. */
 static inline void gen_load_gpr(TCGv t, int reg)
 {
-    if (reg == 0)
+    if (reg == 0) {
         tcg_gen_movi_tl(t, 0);
-    else
+    } else {
         tcg_gen_mov_tl(t, cpu_gpr[reg]);
+    }
 }
 
 static inline void gen_store_gpr(TCGv t, int reg)
 {
-    if (reg != 0)
+    if (reg != 0) {
         tcg_gen_mov_tl(cpu_gpr[reg], t);
+    }
 }
 
 /* Moves to/from shadow registers. */
@@ -2636,9 +2638,9 @@ static inline void gen_load_srsgpr(int from, int to)
 {
     TCGv t0 = tcg_temp_new();
 
-    if (from == 0)
+    if (from == 0) {
         tcg_gen_movi_tl(t0, 0);
-    else {
+    } else {
         TCGv_i32 t2 = tcg_temp_new_i32();
         TCGv_ptr addr = tcg_temp_new_ptr();
 
@@ -2841,10 +2843,11 @@ static void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
 
 static inline int get_fp_bit(int cc)
 {
-    if (cc)
+    if (cc) {
         return 24 + cc;
-    else
+    } else {
         return 23;
+    }
 }
 
 /* Addresses computation */
@@ -2908,14 +2911,16 @@ static inline void gen_move_high32(TCGv ret, TCGv_i64 arg)
 
 static inline void check_cp0_enabled(DisasContext *ctx)
 {
-    if (unlikely(!(ctx->hflags & MIPS_HFLAG_CP0)))
+    if (unlikely(!(ctx->hflags & MIPS_HFLAG_CP0))) {
         generate_exception_err(ctx, EXCP_CpU, 0);
+    }
 }
 
 static inline void check_cp1_enabled(DisasContext *ctx)
 {
-    if (unlikely(!(ctx->hflags & MIPS_HFLAG_FPU)))
+    if (unlikely(!(ctx->hflags & MIPS_HFLAG_FPU))) {
         generate_exception_err(ctx, EXCP_CpU, 1);
+    }
 }
 
 /* Verify that the processor is running with COP1X instructions enabled.
@@ -2924,8 +2929,9 @@ static inline void check_cp1_enabled(DisasContext *ctx)
 
 static inline void check_cop1x(DisasContext *ctx)
 {
-    if (unlikely(!(ctx->hflags & MIPS_HFLAG_COP1X)))
+    if (unlikely(!(ctx->hflags & MIPS_HFLAG_COP1X))) {
         generate_exception_end(ctx, EXCP_RI);
+    }
 }
 
 /* Verify that the processor is running with 64-bit floating-point
@@ -2933,8 +2939,9 @@ static inline void check_cop1x(DisasContext *ctx)
 
 static inline void check_cp1_64bitmode(DisasContext *ctx)
 {
-    if (unlikely(~ctx->hflags & (MIPS_HFLAG_F64 | MIPS_HFLAG_COP1X)))
+    if (unlikely(~ctx->hflags & (MIPS_HFLAG_F64 | MIPS_HFLAG_COP1X))) {
         generate_exception_end(ctx, EXCP_RI);
+    }
 }
 
 /*
@@ -2950,8 +2957,9 @@ static inline void check_cp1_64bitmode(DisasContext *ctx)
  */
 static inline void check_cp1_registers(DisasContext *ctx, int regs)
 {
-    if (unlikely(!(ctx->hflags & MIPS_HFLAG_F64) && (regs & 1)))
+    if (unlikely(!(ctx->hflags & MIPS_HFLAG_F64) && (regs & 1))) {
         generate_exception_end(ctx, EXCP_RI);
+    }
 }
 
 /* Verify that the processor is running with DSP instructions enabled.
@@ -3040,8 +3048,9 @@ static inline void check_ps(DisasContext *ctx)
    instructions are not enabled. */
 static inline void check_mips_64(DisasContext *ctx)
 {
-    if (unlikely(!(ctx->hflags & MIPS_HFLAG_64)))
+    if (unlikely(!(ctx->hflags & MIPS_HFLAG_64))) {
         generate_exception_end(ctx, EXCP_RI);
+    }
 }
 #endif
 
@@ -3126,13 +3135,12 @@ static inline void check_nms(DisasContext *ctx)
  */
 static inline void check_nms_dl_il_sl_tl_l2c(DisasContext *ctx)
 {
-    if (unlikely(ctx->CP0_Config5 & (1 << CP0C5_NMS)) &&
-        !(ctx->CP0_Config1 & (1 << CP0C1_DL)) &&
-        !(ctx->CP0_Config1 & (1 << CP0C1_IL)) &&
-        !(ctx->CP0_Config2 & (1 << CP0C2_SL)) &&
-        !(ctx->CP0_Config2 & (1 << CP0C2_TL)) &&
-        !(ctx->CP0_Config5 & (1 << CP0C5_L2C)))
-    {
+    if (unlikely( (ctx->CP0_Config5 & (1 << CP0C5_NMS)) &&
+                 !(ctx->CP0_Config1 & (1 << CP0C1_DL )) &&
+                 !(ctx->CP0_Config1 & (1 << CP0C1_IL )) &&
+                 !(ctx->CP0_Config2 & (1 << CP0C2_SL )) &&
+                 !(ctx->CP0_Config2 & (1 << CP0C2_TL )) &&
+                 !(ctx->CP0_Config5 & (1 << CP0C5_L2C))     ) ) {
         generate_exception_end(ctx, EXCP_RI);
     }
 }
@@ -3180,23 +3188,56 @@ static inline void gen_cmp ## type ## _ ## fmt(DisasContext *ctx, int n,      \
     gen_ldcmp_fpr##bits (ctx, fp0, fs);                                       \
     gen_ldcmp_fpr##bits (ctx, fp1, ft);                                       \
     switch (n) {                                                              \
-    case  0: gen_helper_0e2i(cmp ## type ## _ ## fmt ## _f, fp0, fp1, cc);    break;\
-    case  1: gen_helper_0e2i(cmp ## type ## _ ## fmt ## _un, fp0, fp1, cc);   break;\
-    case  2: gen_helper_0e2i(cmp ## type ## _ ## fmt ## _eq, fp0, fp1, cc);   break;\
-    case  3: gen_helper_0e2i(cmp ## type ## _ ## fmt ## _ueq, fp0, fp1, cc);  break;\
-    case  4: gen_helper_0e2i(cmp ## type ## _ ## fmt ## _olt, fp0, fp1, cc);  break;\
-    case  5: gen_helper_0e2i(cmp ## type ## _ ## fmt ## _ult, fp0, fp1, cc);  break;\
-    case  6: gen_helper_0e2i(cmp ## type ## _ ## fmt ## _ole, fp0, fp1, cc);  break;\
-    case  7: gen_helper_0e2i(cmp ## type ## _ ## fmt ## _ule, fp0, fp1, cc);  break;\
-    case  8: gen_helper_0e2i(cmp ## type ## _ ## fmt ## _sf, fp0, fp1, cc);   break;\
-    case  9: gen_helper_0e2i(cmp ## type ## _ ## fmt ## _ngle, fp0, fp1, cc); break;\
-    case 10: gen_helper_0e2i(cmp ## type ## _ ## fmt ## _seq, fp0, fp1, cc);  break;\
-    case 11: gen_helper_0e2i(cmp ## type ## _ ## fmt ## _ngl, fp0, fp1, cc);  break;\
-    case 12: gen_helper_0e2i(cmp ## type ## _ ## fmt ## _lt, fp0, fp1, cc);   break;\
-    case 13: gen_helper_0e2i(cmp ## type ## _ ## fmt ## _nge, fp0, fp1, cc);  break;\
-    case 14: gen_helper_0e2i(cmp ## type ## _ ## fmt ## _le, fp0, fp1, cc);   break;\
-    case 15: gen_helper_0e2i(cmp ## type ## _ ## fmt ## _ngt, fp0, fp1, cc);  break;\
-    default: abort();                                                         \
+    case  0:                                                                  \
+        gen_helper_0e2i(cmp ## type ## _ ## fmt ## _f, fp0, fp1, cc);         \
+    break;                                                                    \
+    case  1:                                                                  \
+        gen_helper_0e2i(cmp ## type ## _ ## fmt ## _un, fp0, fp1, cc);        \
+    break;                                                                    \
+    case  2:                                                                  \
+        gen_helper_0e2i(cmp ## type ## _ ## fmt ## _eq, fp0, fp1, cc);        \
+    break;                                                                    \
+    case  3:                                                                  \
+        gen_helper_0e2i(cmp ## type ## _ ## fmt ## _ueq, fp0, fp1, cc);       \
+    break;                                                                    \
+    case  4:                                                                  \
+        gen_helper_0e2i(cmp ## type ## _ ## fmt ## _olt, fp0, fp1, cc);       \
+    break;                                                                    \
+    case  5:                                                                  \
+        gen_helper_0e2i(cmp ## type ## _ ## fmt ## _ult, fp0, fp1, cc);       \
+    break;                                                                    \
+    case  6:                                                                  \
+        gen_helper_0e2i(cmp ## type ## _ ## fmt ## _ole, fp0, fp1, cc);       \
+    break;                                                                    \
+    case  7:                                                                  \
+        gen_helper_0e2i(cmp ## type ## _ ## fmt ## _ule, fp0, fp1, cc);       \
+    break;                                                                    \
+    case  8:                                                                  \
+        gen_helper_0e2i(cmp ## type ## _ ## fmt ## _sf, fp0, fp1, cc);        \
+    break;                                                                    \
+    case  9:                                                                  \
+        gen_helper_0e2i(cmp ## type ## _ ## fmt ## _ngle, fp0, fp1, cc);      \
+    break;                                                                    \
+    case 10:                                                                  \
+        gen_helper_0e2i(cmp ## type ## _ ## fmt ## _seq, fp0, fp1, cc);       \
+    break;                                                                    \
+    case 11:                                                                  \
+        gen_helper_0e2i(cmp ## type ## _ ## fmt ## _ngl, fp0, fp1, cc);       \
+    break;                                                                    \
+    case 12:                                                                  \
+        gen_helper_0e2i(cmp ## type ## _ ## fmt ## _lt, fp0, fp1, cc);        \
+    break;                                                                    \
+    case 13:                                                                  \
+        gen_helper_0e2i(cmp ## type ## _ ## fmt ## _nge, fp0, fp1, cc);       \
+    break;                                                                    \
+    case 14:                                                                  \
+        gen_helper_0e2i(cmp ## type ## _ ## fmt ## _le, fp0, fp1, cc);        \
+    break;                                                                    \
+    case 15:                                                                  \
+        gen_helper_0e2i(cmp ## type ## _ ## fmt ## _ngt, fp0, fp1, cc);       \
+    break;                                                                    \
+    default:                                                                  \
+        abort();                                                              \
     }                                                                         \
     tcg_temp_free_i##bits (fp0);                                              \
     tcg_temp_free_i##bits (fp1);                                              \
@@ -3882,22 +3923,25 @@ static void gen_logic_imm(DisasContext *ctx, uint32_t opc,
     uimm = (uint16_t)imm;
     switch (opc) {
     case OPC_ANDI:
-        if (likely(rs != 0))
+        if (likely(rs != 0)) {
             tcg_gen_andi_tl(cpu_gpr[rt], cpu_gpr[rs], uimm);
-        else
+        } else {
             tcg_gen_movi_tl(cpu_gpr[rt], 0);
+        }
         break;
     case OPC_ORI:
-        if (rs != 0)
+        if (rs != 0) {
             tcg_gen_ori_tl(cpu_gpr[rt], cpu_gpr[rs], uimm);
-        else
+        } else {
             tcg_gen_movi_tl(cpu_gpr[rt], uimm);
+        }
         break;
     case OPC_XORI:
-        if (likely(rs != 0))
+        if (likely(rs != 0)) {
             tcg_gen_xori_tl(cpu_gpr[rt], cpu_gpr[rs], uimm);
-        else
+        } else {
             tcg_gen_movi_tl(cpu_gpr[rt], uimm);
+        }
         break;
     case OPC_LUI:
         if (rs != 0 && (ctx->insn_flags & ISA_MIPS32R6)) {
@@ -6060,8 +6104,9 @@ static void gen_compute_branch (DisasContext *ctx, uint32_t opc,
     }
 
  out:
-    if (insn_bytes == 2)
+    if (insn_bytes == 2) {
         ctx->hflags |= MIPS_HFLAG_B16;
+    }
     tcg_temp_free(t0);
     tcg_temp_free(t1);
 }
@@ -6708,8 +6753,9 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
 {
     const char *register_name = "invalid";
 
-    if (sel != 0)
+    if (sel != 0) {
         check_insn(ctx, ISA_MIPS32);
+    }
 
     switch (reg) {
     case CP0_REGISTER_00:
@@ -7464,8 +7510,9 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
 {
     const char *register_name = "invalid";
 
-    if (sel != 0)
+    if (sel != 0) {
         check_insn(ctx, ISA_MIPS32);
+    }
 
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -8210,8 +8257,9 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
 {
     const char *register_name = "invalid";
 
-    if (sel != 0)
+    if (sel != 0) {
         check_insn(ctx, ISA_MIPS64);
+    }
 
     switch (reg) {
     case CP0_REGISTER_00:
@@ -8920,8 +8968,9 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
 {
     const char *register_name = "invalid";
 
-    if (sel != 0)
+    if (sel != 0) {
         check_insn(ctx, ISA_MIPS64);
+    }
 
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -9658,12 +9707,12 @@ static void gen_mftr(CPUMIPSState *env, DisasContext *ctx, int rt, int rd,
 
     if ((env->CP0_VPEConf0 & (1 << CP0VPEC0_MVP)) == 0 &&
         ((env->tcs[other_tc].CP0_TCBind & (0xf << CP0TCBd_CurVPE)) !=
-         (env->active_tc.CP0_TCBind & (0xf << CP0TCBd_CurVPE))))
+         (env->active_tc.CP0_TCBind & (0xf << CP0TCBd_CurVPE)))) {
         tcg_gen_movi_tl(t0, -1);
-    else if ((env->CP0_VPEControl & (0xff << CP0VPECo_TargTC)) >
-             (env->mvp->CP0_MVPConf0 & (0xff << CP0MVPC0_PTC)))
+    } else if ((env->CP0_VPEControl & (0xff << CP0VPECo_TargTC)) >
+               (env->mvp->CP0_MVPConf0 & (0xff << CP0MVPC0_PTC))) {
         tcg_gen_movi_tl(t0, -1);
-    else if (u == 0) {
+    } else if (u == 0) {
         switch (rt) {
         case 1:
             switch (sel) {
@@ -9883,12 +9932,12 @@ static void gen_mttr(CPUMIPSState *env, DisasContext *ctx, int rd, int rt,
     gen_load_gpr(t0, rt);
     if ((env->CP0_VPEConf0 & (1 << CP0VPEC0_MVP)) == 0 &&
         ((env->tcs[other_tc].CP0_TCBind & (0xf << CP0TCBd_CurVPE)) !=
-         (env->active_tc.CP0_TCBind & (0xf << CP0TCBd_CurVPE))))
+         (env->active_tc.CP0_TCBind & (0xf << CP0TCBd_CurVPE)))) {
         /* NOP */ ;
-    else if ((env->CP0_VPEControl & (0xff << CP0VPECo_TargTC)) >
-             (env->mvp->CP0_MVPConf0 & (0xff << CP0MVPC0_PTC)))
+    } else if ((env->CP0_VPEControl & (0xff << CP0VPECo_TargTC)) >
+             (env->mvp->CP0_MVPConf0 & (0xff << CP0MVPC0_PTC))) {
         /* NOP */ ;
-    else if (u == 0) {
+    } else if (u == 0) {
         switch (rd) {
         case 1:
             switch (sel) {
@@ -10162,8 +10211,9 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
         break;
     case OPC_TLBWI:
         opn = "tlbwi";
-        if (!env->tlb->helper_tlbwi)
+        if (!env->tlb->helper_tlbwi) {
             goto die;
+        }
         gen_helper_tlbwi(cpu_env);
         break;
     case OPC_TLBINV:
@@ -10186,20 +10236,23 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
         break;
     case OPC_TLBWR:
         opn = "tlbwr";
-        if (!env->tlb->helper_tlbwr)
+        if (!env->tlb->helper_tlbwr) {
             goto die;
+        }
         gen_helper_tlbwr(cpu_env);
         break;
     case OPC_TLBP:
         opn = "tlbp";
-        if (!env->tlb->helper_tlbp)
+        if (!env->tlb->helper_tlbp) {
             goto die;
+        }
         gen_helper_tlbp(cpu_env);
         break;
     case OPC_TLBR:
         opn = "tlbr";
-        if (!env->tlb->helper_tlbr)
+        if (!env->tlb->helper_tlbr) {
             goto die;
+        }
         gen_helper_tlbr(cpu_env);
         break;
     case OPC_ERET: /* OPC_ERETNC */
@@ -10273,8 +10326,9 @@ static void gen_compute_branch1(DisasContext *ctx, uint32_t op,
         goto out;
     }
 
-    if (cc != 0)
+    if (cc != 0) {
         check_insn(ctx, ISA_MIPS4 | ISA_MIPS32);
+    }
 
     btarget = ctx->base.pc_next + 4 + offset;
 
@@ -10728,10 +10782,11 @@ static void gen_movci(DisasContext *ctx, int rd, int rs, int cc, int tf)
         return;
     }
 
-    if (tf)
+    if (tf) {
         cond = TCG_COND_EQ;
-    else
+    } else {
         cond = TCG_COND_NE;
+    }
 
     l1 = gen_new_label();
     t0 = tcg_temp_new_i32();
@@ -10753,10 +10808,11 @@ static inline void gen_movcf_s(DisasContext *ctx, int fs, int fd, int cc,
     TCGv_i32 t0 = tcg_temp_new_i32();
     TCGLabel *l1 = gen_new_label();
 
-    if (tf)
+    if (tf) {
         cond = TCG_COND_EQ;
-    else
+    } else {
         cond = TCG_COND_NE;
+    }
 
     tcg_gen_andi_i32(t0, fpu_fcr31, 1 << get_fp_bit(cc));
     tcg_gen_brcondi_i32(cond, t0, 0, l1);
@@ -10774,10 +10830,11 @@ static inline void gen_movcf_d(DisasContext *ctx, int fs, int fd, int cc,
     TCGv_i64 fp0;
     TCGLabel *l1 = gen_new_label();
 
-    if (tf)
+    if (tf) {
         cond = TCG_COND_EQ;
-    else
+    } else {
         cond = TCG_COND_NE;
+    }
 
     tcg_gen_andi_i32(t0, fpu_fcr31, 1 << get_fp_bit(cc));
     tcg_gen_brcondi_i32(cond, t0, 0, l1);
@@ -10797,10 +10854,11 @@ static inline void gen_movcf_ps(DisasContext *ctx, int fs, int fd,
     TCGLabel *l1 = gen_new_label();
     TCGLabel *l2 = gen_new_label();
 
-    if (tf)
+    if (tf) {
         cond = TCG_COND_EQ;
-    else
+    } else {
         cond = TCG_COND_NE;
+    }
 
     tcg_gen_andi_i32(t0, fpu_fcr31, 1 << get_fp_bit(cc));
     tcg_gen_brcondi_i32(cond, t0, 0, l1);
@@ -12096,8 +12154,9 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             TCGLabel *l1 = gen_new_label();
             TCGv_i64 fp0;
 
-            if (ft != 0)
+            if (ft != 0) {
                 tcg_gen_brcondi_tl(TCG_COND_NE, cpu_gpr[ft], 0, l1);
+            }
             fp0 = tcg_temp_new_i64();
             gen_load_fpr64(ctx, fp0, fs);
             gen_store_fpr64(ctx, fp0, fd);
@@ -29991,12 +30050,14 @@ void mips_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                  env->active_tc.PC, env->active_tc.HI[0], env->active_tc.LO[0],
                  env->hflags, env->btarget, env->bcond);
     for (i = 0; i < 32; i++) {
-        if ((i & 3) == 0)
+        if ((i & 3) == 0) {
             qemu_fprintf(f, "GPR%02d:", i);
+        }
         qemu_fprintf(f, " %s " TARGET_FMT_lx,
                      regnames[i], env->active_tc.gpr[i]);
-        if ((i & 3) == 3)
+        if ((i & 3) == 3) {
             qemu_fprintf(f, "\n");
+        }
     }
 
     qemu_fprintf(f, "CP0 Status  0x%08x Cause   0x%08x EPC    0x" TARGET_FMT_lx "\n",
-- 
2.7.4


