Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5A144A699
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:04:27 +0100 (CET)
Received: from localhost ([::1]:53188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkKF8-00069C-GP
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:04:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3f-0004Ss-J0; Tue, 09 Nov 2021 00:52:37 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:56299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3X-0006eh-Dg; Tue, 09 Nov 2021 00:52:31 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDn6WzKz4xdd; Tue,  9 Nov 2021 16:52:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437129;
 bh=PRS8j6o+KOJ5g+U+qjpCyaMBZNoNswcMpt65QU0wfsk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QA3OqY7zX23ndpIdbQtVOoto10c2f3hW4CeoV2fUhuBtOvpHQfXN34zfejyai/UuE
 DDDyl6BgZIXsUGrh73IlT3FFnheBAZje0PJRTCV1dp9/ys45kM++E0Khl8bgIMybLN
 PrPQGME1O/CwlVcB0976fJ7Cgn1xSG2fcGN4U/64=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 05/54] target/ppc: Move LQ and STQ to decodetree
Date: Tue,  9 Nov 2021 16:51:15 +1100
Message-Id: <20211109055204.230765-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211029202424.175401-6-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/insn32.decode                   |  11 ++
 target/ppc/translate.c                     | 156 +--------------------
 target/ppc/translate/fixedpoint-impl.c.inc |  97 +++++++++++++
 3 files changed, 113 insertions(+), 151 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 19ef9bff67..7ff8c25ac5 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -24,9 +24,16 @@
 @D_bfs          ...... bf:3 - l:1 ra:5 imm:s16          &D_bf
 @D_bfu          ...... bf:3 - l:1 ra:5 imm:16           &D_bf
 
+%dq_si          4:s12  !function=times_16
+%dq_rtp         22:4   !function=times_2
+@DQ_rtp         ...... ....0 ra:5 ............ ....             &D rt=%dq_rtp si=%dq_si
+
 %ds_si          2:s14  !function=times_4
 @DS             ...... rt:5 ra:5 .............. ..      &D si=%ds_si
 
+%ds_rtp         22:4   !function=times_2
+@DS_rtp         ...... ....0 ra:5 .............. ..             &D rt=%ds_rtp si=%ds_si
+
 &DX             rt d
 %dx_d           6:s10 16:5 0:1
 @DX             ...... rt:5  ..... .......... ..... .   &DX d=%dx_d
@@ -74,6 +81,8 @@ LDU             111010 ..... ..... ..............01     @DS
 LDX             011111 ..... ..... ..... 0000010101 -   @X
 LDUX            011111 ..... ..... ..... 0000110101 -   @X
 
+LQ              111000 ..... ..... ............ ----    @DQ_rtp
+
 ### Fixed-Point Store Instructions
 
 STB             100110 ..... ..... ................     @D
@@ -96,6 +105,8 @@ STDU            111110 ..... ..... ..............01     @DS
 STDX            011111 ..... ..... ..... 0010010101 -   @X
 STDUX           011111 ..... ..... ..... 0010110101 -   @X
 
+STQ             111110 ..... ..... ..............10     @DS_rtp
+
 ### Fixed-Point Compare Instructions
 
 CMP             011111 ... - . ..... ..... 0000000000 - @X_bfl
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 3f50f44c19..8d5141497f 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3327,69 +3327,6 @@ GEN_LDX_HVRM(ldcix, ld64_i64, 0x15, 0x1b, PPC_CILDST)
 GEN_LDX_HVRM(lwzcix, ld32u, 0x15, 0x15, PPC_CILDST)
 GEN_LDX_HVRM(lhzcix, ld16u, 0x15, 0x19, PPC_CILDST)
 GEN_LDX_HVRM(lbzcix, ld8u, 0x15, 0x1a, PPC_CILDST)
-
-/* lq */
-static void gen_lq(DisasContext *ctx)
-{
-    int ra, rd;
-    TCGv EA, hi, lo;
-
-    /* lq is a legal user mode instruction starting in ISA 2.07 */
-    bool legal_in_user_mode = (ctx->insns_flags2 & PPC2_LSQ_ISA207) != 0;
-    bool le_is_supported = (ctx->insns_flags2 & PPC2_LSQ_ISA207) != 0;
-
-    if (!legal_in_user_mode && ctx->pr) {
-        gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
-        return;
-    }
-
-    if (!le_is_supported && ctx->le_mode) {
-        gen_align_no_le(ctx);
-        return;
-    }
-    ra = rA(ctx->opcode);
-    rd = rD(ctx->opcode);
-    if (unlikely((rd & 1) || rd == ra)) {
-        gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
-        return;
-    }
-
-    gen_set_access_type(ctx, ACCESS_INT);
-    EA = tcg_temp_new();
-    gen_addr_imm_index(ctx, EA, 0x0F);
-
-    /* Note that the low part is always in RD+1, even in LE mode.  */
-    lo = cpu_gpr[rd + 1];
-    hi = cpu_gpr[rd];
-
-    if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
-        if (HAVE_ATOMIC128) {
-            TCGv_i32 oi = tcg_temp_new_i32();
-            if (ctx->le_mode) {
-                tcg_gen_movi_i32(oi, make_memop_idx(MO_LEQ, ctx->mem_idx));
-                gen_helper_lq_le_parallel(lo, cpu_env, EA, oi);
-            } else {
-                tcg_gen_movi_i32(oi, make_memop_idx(MO_BEQ, ctx->mem_idx));
-                gen_helper_lq_be_parallel(lo, cpu_env, EA, oi);
-            }
-            tcg_temp_free_i32(oi);
-            tcg_gen_ld_i64(hi, cpu_env, offsetof(CPUPPCState, retxh));
-        } else {
-            /* Restart with exclusive lock.  */
-            gen_helper_exit_atomic(cpu_env);
-            ctx->base.is_jmp = DISAS_NORETURN;
-        }
-    } else if (ctx->le_mode) {
-        tcg_gen_qemu_ld_i64(lo, EA, ctx->mem_idx, MO_LEQ);
-        gen_addr_add(ctx, EA, EA, 8);
-        tcg_gen_qemu_ld_i64(hi, EA, ctx->mem_idx, MO_LEQ);
-    } else {
-        tcg_gen_qemu_ld_i64(hi, EA, ctx->mem_idx, MO_BEQ);
-        gen_addr_add(ctx, EA, EA, 8);
-        tcg_gen_qemu_ld_i64(lo, EA, ctx->mem_idx, MO_BEQ);
-    }
-    tcg_temp_free(EA);
-}
 #endif
 
 /***                              Integer store                            ***/
@@ -3435,90 +3372,6 @@ GEN_STX_HVRM(stdcix, st64_i64, 0x15, 0x1f, PPC_CILDST)
 GEN_STX_HVRM(stwcix, st32, 0x15, 0x1c, PPC_CILDST)
 GEN_STX_HVRM(sthcix, st16, 0x15, 0x1d, PPC_CILDST)
 GEN_STX_HVRM(stbcix, st8, 0x15, 0x1e, PPC_CILDST)
-
-static void gen_std(DisasContext *ctx)
-{
-    int rs;
-    TCGv EA;
-
-    rs = rS(ctx->opcode);
-    if ((ctx->opcode & 0x3) == 0x2) { /* stq */
-        bool legal_in_user_mode = (ctx->insns_flags2 & PPC2_LSQ_ISA207) != 0;
-        bool le_is_supported = (ctx->insns_flags2 & PPC2_LSQ_ISA207) != 0;
-        TCGv hi, lo;
-
-        if (!(ctx->insns_flags & PPC_64BX)) {
-            gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
-        }
-
-        if (!legal_in_user_mode && ctx->pr) {
-            gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
-            return;
-        }
-
-        if (!le_is_supported && ctx->le_mode) {
-            gen_align_no_le(ctx);
-            return;
-        }
-
-        if (unlikely(rs & 1)) {
-            gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
-            return;
-        }
-        gen_set_access_type(ctx, ACCESS_INT);
-        EA = tcg_temp_new();
-        gen_addr_imm_index(ctx, EA, 0x03);
-
-        /* Note that the low part is always in RS+1, even in LE mode.  */
-        lo = cpu_gpr[rs + 1];
-        hi = cpu_gpr[rs];
-
-        if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
-            if (HAVE_ATOMIC128) {
-                TCGv_i32 oi = tcg_temp_new_i32();
-                if (ctx->le_mode) {
-                    tcg_gen_movi_i32(oi, make_memop_idx(MO_LE | MO_128,
-                                                        ctx->mem_idx));
-                    gen_helper_stq_le_parallel(cpu_env, EA, lo, hi, oi);
-                } else {
-                    tcg_gen_movi_i32(oi, make_memop_idx(MO_BE | MO_128,
-                                                        ctx->mem_idx));
-                    gen_helper_stq_be_parallel(cpu_env, EA, lo, hi, oi);
-                }
-                tcg_temp_free_i32(oi);
-            } else {
-                /* Restart with exclusive lock.  */
-                gen_helper_exit_atomic(cpu_env);
-                ctx->base.is_jmp = DISAS_NORETURN;
-            }
-        } else if (ctx->le_mode) {
-            tcg_gen_qemu_st_i64(lo, EA, ctx->mem_idx, MO_LEQ);
-            gen_addr_add(ctx, EA, EA, 8);
-            tcg_gen_qemu_st_i64(hi, EA, ctx->mem_idx, MO_LEQ);
-        } else {
-            tcg_gen_qemu_st_i64(hi, EA, ctx->mem_idx, MO_BEQ);
-            gen_addr_add(ctx, EA, EA, 8);
-            tcg_gen_qemu_st_i64(lo, EA, ctx->mem_idx, MO_BEQ);
-        }
-        tcg_temp_free(EA);
-    } else {
-        /* std / stdu */
-        if (Rc(ctx->opcode)) {
-            if (unlikely(rA(ctx->opcode) == 0)) {
-                gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
-                return;
-            }
-        }
-        gen_set_access_type(ctx, ACCESS_INT);
-        EA = tcg_temp_new();
-        gen_addr_imm_index(ctx, EA, 0x03);
-        gen_qemu_st64_i64(ctx, cpu_gpr[rs], EA);
-        if (Rc(ctx->opcode)) {
-            tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], EA);
-        }
-        tcg_temp_free(EA);
-    }
-}
 #endif
 /***                Integer load and store with byte reverse               ***/
 
@@ -7457,6 +7310,11 @@ static int times_4(DisasContext *ctx, int x)
     return x * 4;
 }
 
+static int times_16(DisasContext *ctx, int x)
+{
+    return x * 16;
+}
+
 /*
  * Helpers for trans_* functions to check for specific insns flags.
  * Use token pasting to ensure that we use the proper flag with the
@@ -7696,10 +7554,6 @@ GEN_HANDLER2_E(extswsli0, "extswsli", 0x1F, 0x1A, 0x1B, 0x00000000,
 GEN_HANDLER2_E(extswsli1, "extswsli", 0x1F, 0x1B, 0x1B, 0x00000000,
                PPC_NONE, PPC2_ISA300),
 #endif
-#if defined(TARGET_PPC64)
-GEN_HANDLER(lq, 0x38, 0xFF, 0xFF, 0x00000000, PPC_64BX),
-GEN_HANDLER(std, 0x3E, 0xFF, 0xFF, 0x00000000, PPC_64B),
-#endif
 /* handles lfdp, lxsd, lxssp */
 GEN_HANDLER_E(dform39, 0x39, 0xFF, 0xFF, 0x00000000, PPC_NONE, PPC2_ISA205),
 /* handles stfdp, lxv, stxsd, stxssp, stxv */
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 812b7ddd0a..ff35a96459 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -69,6 +69,97 @@ static bool do_ldst_X(DisasContext *ctx, arg_X *a, bool update,
     return do_ldst(ctx, a->rt, a->ra, cpu_gpr[a->rb], update, store, mop);
 }
 
+static bool do_ldst_quad(DisasContext *ctx, arg_D *a, bool store, bool prefixed)
+{
+#if defined(TARGET_PPC64)
+    TCGv ea;
+    TCGv_i64 low_addr_gpr, high_addr_gpr;
+    MemOp mop;
+
+    REQUIRE_INSNS_FLAGS(ctx, 64BX);
+
+    if (!prefixed && !(ctx->insns_flags2 & PPC2_LSQ_ISA207)) {
+        if (ctx->pr) {
+            /* lq and stq were privileged prior to V. 2.07 */
+            gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
+            return true;
+        }
+
+        if (ctx->le_mode) {
+            gen_align_no_le(ctx);
+            return true;
+        }
+    }
+
+    if (!store && unlikely(a->ra == a->rt)) {
+        gen_invalid(ctx);
+        return true;
+    }
+
+    gen_set_access_type(ctx, ACCESS_INT);
+    ea = do_ea_calc(ctx, a->ra, tcg_constant_tl(a->si));
+
+    if (prefixed || !ctx->le_mode) {
+        low_addr_gpr = cpu_gpr[a->rt];
+        high_addr_gpr = cpu_gpr[a->rt + 1];
+    } else {
+        low_addr_gpr = cpu_gpr[a->rt + 1];
+        high_addr_gpr = cpu_gpr[a->rt];
+    }
+
+    if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
+        if (HAVE_ATOMIC128) {
+            mop = DEF_MEMOP(MO_128);
+            TCGv_i32 oi = tcg_constant_i32(make_memop_idx(mop, ctx->mem_idx));
+            if (store) {
+                if (ctx->le_mode) {
+                    gen_helper_stq_le_parallel(cpu_env, ea, low_addr_gpr,
+                                               high_addr_gpr, oi);
+                } else {
+                    gen_helper_stq_be_parallel(cpu_env, ea, high_addr_gpr,
+                                               low_addr_gpr, oi);
+
+                }
+            } else {
+                if (ctx->le_mode) {
+                    gen_helper_lq_le_parallel(low_addr_gpr, cpu_env, ea, oi);
+                    tcg_gen_ld_i64(high_addr_gpr, cpu_env,
+                                   offsetof(CPUPPCState, retxh));
+                } else {
+                    gen_helper_lq_be_parallel(high_addr_gpr, cpu_env, ea, oi);
+                    tcg_gen_ld_i64(low_addr_gpr, cpu_env,
+                                   offsetof(CPUPPCState, retxh));
+                }
+            }
+        } else {
+            /* Restart with exclusive lock.  */
+            gen_helper_exit_atomic(cpu_env);
+            ctx->base.is_jmp = DISAS_NORETURN;
+        }
+    } else {
+        mop = DEF_MEMOP(MO_Q);
+        if (store) {
+            tcg_gen_qemu_st_i64(low_addr_gpr, ea, ctx->mem_idx, mop);
+        } else {
+            tcg_gen_qemu_ld_i64(low_addr_gpr, ea, ctx->mem_idx, mop);
+        }
+
+        gen_addr_add(ctx, ea, ea, 8);
+
+        if (store) {
+            tcg_gen_qemu_st_i64(high_addr_gpr, ea, ctx->mem_idx, mop);
+        } else {
+            tcg_gen_qemu_ld_i64(high_addr_gpr, ea, ctx->mem_idx, mop);
+        }
+    }
+    tcg_temp_free(ea);
+#else
+    qemu_build_not_reached();
+#endif
+
+    return true;
+}
+
 /* Load Byte and Zero */
 TRANS(LBZ, do_ldst_D, false, false, MO_UB)
 TRANS(LBZX, do_ldst_X, false, false, MO_UB)
@@ -110,6 +201,9 @@ TRANS64(LDU, do_ldst_D, true, false, MO_Q)
 TRANS64(LDUX, do_ldst_X, true, false, MO_Q)
 TRANS64(PLD, do_ldst_PLS_D, false, false, MO_Q)
 
+/* Load Quadword */
+TRANS64(LQ, do_ldst_quad, false, false);
+
 /* Store Byte */
 TRANS(STB, do_ldst_D, false, true, MO_UB)
 TRANS(STBX, do_ldst_X, false, true, MO_UB)
@@ -138,6 +232,9 @@ TRANS64(STDU, do_ldst_D, true, true, MO_Q)
 TRANS64(STDUX, do_ldst_X, true, true, MO_Q)
 TRANS64(PSTD, do_ldst_PLS_D, false, true, MO_Q)
 
+/* Store Quadword */
+TRANS64(STQ, do_ldst_quad, true, false);
+
 /*
  * Fixed-Point Compare Instructions
  */
-- 
2.33.1


