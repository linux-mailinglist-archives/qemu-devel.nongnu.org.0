Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2E0436B99
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 21:56:01 +0200 (CEST)
Received: from localhost ([::1]:47052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdeAS-0004q6-UB
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 15:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde26-0003SG-EP; Thu, 21 Oct 2021 15:47:22 -0400
Received: from [201.28.113.2] (port=10704 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde23-0007UN-VE; Thu, 21 Oct 2021 15:47:22 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 21 Oct 2021 16:46:56 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id A30B180012A;
 Thu, 21 Oct 2021 16:46:55 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 05/33] target/ppc: Move LQ and STQ to decodetree
Date: Thu, 21 Oct 2021 16:45:19 -0300
Message-Id: <20211021194547.672988-6-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2021 19:46:56.0224 (UTC)
 FILETIME=[676BA600:01D7C6B4]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lucas.castro@eldorado.org.br, richard.henderson@linaro.org, groug@kaod.org,
 luis.pires@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode                   |  11 ++
 target/ppc/translate.c                     | 156 +--------------------
 target/ppc/translate/fixedpoint-impl.c.inc |  98 +++++++++++++
 3 files changed, 114 insertions(+), 151 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 3837b799c8..9cb9fc00b8 100644
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
@@ -153,6 +160,8 @@ LDU             111010 ..... ..... ..............01     @DS
 LDX             011111 ..... ..... ..... 0000010101 -   @X
 LDUX            011111 ..... ..... ..... 0000110101 -   @X
 
+LQ              111000 ..... ..... ............ ----    @DQ_rtp
+
 ### Fixed-Point Store Instructions
 
 STB             100110 ..... ..... ................     @D
@@ -175,6 +184,8 @@ STDU            111110 ..... ..... ..............01     @DS
 STDX            011111 ..... ..... ..... 0010010101 -   @X
 STDUX           011111 ..... ..... ..... 0010110101 -   @X
 
+STQ             111110 ..... ..... ..............10     @DS_rtp
+
 ### Fixed-Point Compare Instructions
 
 CMP             011111 ... - . ..... ..... 0000000000 - @X_bfl
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 39f03ac658..738101088e 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3325,69 +3325,6 @@ GEN_LDX_HVRM(ldcix, ld64_i64, 0x15, 0x1b, PPC_CILDST)
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
@@ -3433,90 +3370,6 @@ GEN_STX_HVRM(stdcix, st64_i64, 0x15, 0x1f, PPC_CILDST)
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
 
@@ -7460,6 +7313,11 @@ static int times_4(DisasContext *ctx, int x)
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
@@ -7715,10 +7573,6 @@ GEN_HANDLER2_E(extswsli0, "extswsli", 0x1F, 0x1A, 0x1B, 0x00000000,
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
index 1c35b60eb4..61d129fb5d 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -70,6 +70,98 @@ static bool do_ldst_X(DisasContext *ctx, arg_X *a, bool update,
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
+    ea = tcg_temp_new();
+    do_ea_calc(ctx, a->ra, tcg_constant_tl(a->si), ea);
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
@@ -111,6 +203,9 @@ TRANS64(LDU, do_ldst_D, true, false, MO_Q)
 TRANS64(LDUX, do_ldst_X, true, false, MO_Q)
 TRANS64(PLD, do_ldst_PLS_D, false, false, MO_Q)
 
+/* Load Quadword */
+TRANS64(LQ, do_ldst_quad, false, false);
+
 /* Store Byte */
 TRANS(STB, do_ldst_D, false, true, MO_UB)
 TRANS(STBX, do_ldst_X, false, true, MO_UB)
@@ -139,6 +234,9 @@ TRANS64(STDU, do_ldst_D, true, true, MO_Q)
 TRANS64(STDUX, do_ldst_X, true, true, MO_Q)
 TRANS64(PSTD, do_ldst_PLS_D, false, true, MO_Q)
 
+/* Store Quadword */
+TRANS64(STQ, do_ldst_quad, true, false);
+
 /*
  * Fixed-Point Compare Instructions
  */
-- 
2.25.1


