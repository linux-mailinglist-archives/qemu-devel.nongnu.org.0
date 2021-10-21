Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8BE436BB0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 21:59:50 +0200 (CEST)
Received: from localhost ([::1]:54784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdeE9-0001kW-V1
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 15:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde1y-0003Bi-BF; Thu, 21 Oct 2021 15:47:14 -0400
Received: from [201.28.113.2] (port=54417 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde1v-0007P8-Ff; Thu, 21 Oct 2021 15:47:14 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 21 Oct 2021 16:46:55 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 9F31B800145;
 Thu, 21 Oct 2021 16:46:54 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 03/33] target/ppc: Move load and store floating point
 instructions to decodetree
Date: Thu, 21 Oct 2021 16:45:17 -0300
Message-Id: <20211021194547.672988-4-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2021 19:46:55.0265 (UTC)
 FILETIME=[66D95110:01D7C6B4]
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
Cc: pherde <phervalle@gmail.com>, lucas.castro@eldorado.org.br,
 richard.henderson@linaro.org, groug@kaod.org, luis.pires@eldorado.org.br,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: pherde <phervalle@gmail.com>

Move load floating point instructions (lfs, lfsu, lfsx, lfsux, lfd, lfdu, lfdx, lfdux)
and store floating point instructions(stfs, stfsu, stfsx, stfsux, stfd, stfdu, stfdx,
stfdux) from legacy system to decodetree.

Signed-off-by: Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode           |  24 +++
 target/ppc/translate/fp-impl.c.inc | 240 ++++++++---------------------
 target/ppc/translate/fp-ops.c.inc  |  29 ----
 3 files changed, 88 insertions(+), 205 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 6aec1c0728..3837b799c8 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -193,6 +193,30 @@ ADDPCIS         010011 ..... ..... .......... 00010 .   @DX
 
 CFUGED          011111 ..... ..... ..... 0011011100 -   @X
 
+### Float-Point Load Instructions
+
+LFS             110000 ..... ..... ................     @D
+LFSU            110001 ..... ..... ................     @D
+LFSX            011111 ..... ..... ..... 1000010111 -   @X
+LFSUX           011111 ..... ..... ..... 1000110111 -   @X
+
+LFD             110010 ..... ..... ................     @D
+LFDU            110011 ..... ..... ................     @D
+LFDX            011111 ..... ..... ..... 1001010111 -   @X
+LFDUX           011111 ..... ..... ..... 1001110111 -   @X
+
+### Float-Point Store Instructions
+
+STFS            110100 ..... ...... ...............     @D
+STFSU           110101 ..... ...... ...............     @D
+STFSX           011111 ..... ...... .... 1010010111 -   @X
+STFSUX          011111 ..... ...... .... 1010110111 -   @X
+
+STFD            110110 ..... ...... ...............     @D
+STFDU           110111 ..... ...... ...............     @D
+STFDX           011111 ..... ...... .... 1011010111 -   @X
+STFDUX          011111 ..... ...... .... 1011110111 -   @X
+
 ### Move To/From System Register Instructions
 
 SETBC           011111 ..... ..... ----- 0110000000 -   @X_bi
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index 9f7868ee28..76b382ebe5 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -854,99 +854,6 @@ static void gen_mtfsfi(DisasContext *ctx)
     gen_helper_float_check_status(cpu_env);
 }
 
-/***                         Floating-point load                           ***/
-#define GEN_LDF(name, ldop, opc, type)                                        \
-static void glue(gen_, name)(DisasContext *ctx)                               \
-{                                                                             \
-    TCGv EA;                                                                  \
-    TCGv_i64 t0;                                                              \
-    if (unlikely(!ctx->fpu_enabled)) {                                        \
-        gen_exception(ctx, POWERPC_EXCP_FPU);                                 \
-        return;                                                               \
-    }                                                                         \
-    gen_set_access_type(ctx, ACCESS_FLOAT);                                   \
-    EA = tcg_temp_new();                                                      \
-    t0 = tcg_temp_new_i64();                                                  \
-    gen_addr_imm_index(ctx, EA, 0);                                           \
-    gen_qemu_##ldop(ctx, t0, EA);                                             \
-    set_fpr(rD(ctx->opcode), t0);                                             \
-    tcg_temp_free(EA);                                                        \
-    tcg_temp_free_i64(t0);                                                    \
-}
-
-#define GEN_LDUF(name, ldop, opc, type)                                       \
-static void glue(gen_, name##u)(DisasContext *ctx)                            \
-{                                                                             \
-    TCGv EA;                                                                  \
-    TCGv_i64 t0;                                                              \
-    if (unlikely(!ctx->fpu_enabled)) {                                        \
-        gen_exception(ctx, POWERPC_EXCP_FPU);                                 \
-        return;                                                               \
-    }                                                                         \
-    if (unlikely(rA(ctx->opcode) == 0)) {                                     \
-        gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);                   \
-        return;                                                               \
-    }                                                                         \
-    gen_set_access_type(ctx, ACCESS_FLOAT);                                   \
-    EA = tcg_temp_new();                                                      \
-    t0 = tcg_temp_new_i64();                                                  \
-    gen_addr_imm_index(ctx, EA, 0);                                           \
-    gen_qemu_##ldop(ctx, t0, EA);                                             \
-    set_fpr(rD(ctx->opcode), t0);                                             \
-    tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], EA);                             \
-    tcg_temp_free(EA);                                                        \
-    tcg_temp_free_i64(t0);                                                    \
-}
-
-#define GEN_LDUXF(name, ldop, opc, type)                                      \
-static void glue(gen_, name##ux)(DisasContext *ctx)                           \
-{                                                                             \
-    TCGv EA;                                                                  \
-    TCGv_i64 t0;                                                              \
-    if (unlikely(!ctx->fpu_enabled)) {                                        \
-        gen_exception(ctx, POWERPC_EXCP_FPU);                                 \
-        return;                                                               \
-    }                                                                         \
-    t0 = tcg_temp_new_i64();                                                  \
-    if (unlikely(rA(ctx->opcode) == 0)) {                                     \
-        gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);                   \
-        return;                                                               \
-    }                                                                         \
-    gen_set_access_type(ctx, ACCESS_FLOAT);                                   \
-    EA = tcg_temp_new();                                                      \
-    gen_addr_reg_index(ctx, EA);                                              \
-    gen_qemu_##ldop(ctx, t0, EA);                                             \
-    set_fpr(rD(ctx->opcode), t0);                                             \
-    tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], EA);                             \
-    tcg_temp_free(EA);                                                        \
-    tcg_temp_free_i64(t0);                                                    \
-}
-
-#define GEN_LDXF(name, ldop, opc2, opc3, type)                                \
-static void glue(gen_, name##x)(DisasContext *ctx)                            \
-{                                                                             \
-    TCGv EA;                                                                  \
-    TCGv_i64 t0;                                                              \
-    if (unlikely(!ctx->fpu_enabled)) {                                        \
-        gen_exception(ctx, POWERPC_EXCP_FPU);                                 \
-        return;                                                               \
-    }                                                                         \
-    gen_set_access_type(ctx, ACCESS_FLOAT);                                   \
-    EA = tcg_temp_new();                                                      \
-    t0 = tcg_temp_new_i64();                                                  \
-    gen_addr_reg_index(ctx, EA);                                              \
-    gen_qemu_##ldop(ctx, t0, EA);                                             \
-    set_fpr(rD(ctx->opcode), t0);                                             \
-    tcg_temp_free(EA);                                                        \
-    tcg_temp_free_i64(t0);                                                    \
-}
-
-#define GEN_LDFS(name, ldop, op, type)                                        \
-GEN_LDF(name, ldop, op | 0x20, type);                                         \
-GEN_LDUF(name, ldop, op | 0x21, type);                                        \
-GEN_LDUXF(name, ldop, op | 0x01, type);                                       \
-GEN_LDXF(name, ldop, 0x17, op | 0x00, type)
-
 static void gen_qemu_ld32fs(DisasContext *ctx, TCGv_i64 dest, TCGv addr)
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
@@ -955,11 +862,6 @@ static void gen_qemu_ld32fs(DisasContext *ctx, TCGv_i64 dest, TCGv addr)
     tcg_temp_free_i32(tmp);
 }
 
- /* lfd lfdu lfdux lfdx */
-GEN_LDFS(lfd, ld64_i64, 0x12, PPC_FLOAT);
- /* lfs lfsu lfsux lfsx */
-GEN_LDFS(lfs, ld32fs, 0x10, PPC_FLOAT);
-
 /* lfdepx (external PID lfdx) */
 static void gen_lfdepx(DisasContext *ctx)
 {
@@ -1089,73 +991,6 @@ static void gen_lfiwzx(DisasContext *ctx)
     tcg_temp_free(EA);
     tcg_temp_free_i64(t0);
 }
-/***                         Floating-point store                          ***/
-#define GEN_STF(name, stop, opc, type)                                        \
-static void glue(gen_, name)(DisasContext *ctx)                               \
-{                                                                             \
-    TCGv EA;                                                                  \
-    TCGv_i64 t0;                                                              \
-    if (unlikely(!ctx->fpu_enabled)) {                                        \
-        gen_exception(ctx, POWERPC_EXCP_FPU);                                 \
-        return;                                                               \
-    }                                                                         \
-    gen_set_access_type(ctx, ACCESS_FLOAT);                                   \
-    EA = tcg_temp_new();                                                      \
-    t0 = tcg_temp_new_i64();                                                  \
-    gen_addr_imm_index(ctx, EA, 0);                                           \
-    get_fpr(t0, rS(ctx->opcode));                                             \
-    gen_qemu_##stop(ctx, t0, EA);                                             \
-    tcg_temp_free(EA);                                                        \
-    tcg_temp_free_i64(t0);                                                    \
-}
-
-#define GEN_STUF(name, stop, opc, type)                                       \
-static void glue(gen_, name##u)(DisasContext *ctx)                            \
-{                                                                             \
-    TCGv EA;                                                                  \
-    TCGv_i64 t0;                                                              \
-    if (unlikely(!ctx->fpu_enabled)) {                                        \
-        gen_exception(ctx, POWERPC_EXCP_FPU);                                 \
-        return;                                                               \
-    }                                                                         \
-    if (unlikely(rA(ctx->opcode) == 0)) {                                     \
-        gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);                   \
-        return;                                                               \
-    }                                                                         \
-    gen_set_access_type(ctx, ACCESS_FLOAT);                                   \
-    EA = tcg_temp_new();                                                      \
-    t0 = tcg_temp_new_i64();                                                  \
-    gen_addr_imm_index(ctx, EA, 0);                                           \
-    get_fpr(t0, rS(ctx->opcode));                                             \
-    gen_qemu_##stop(ctx, t0, EA);                                             \
-    tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], EA);                             \
-    tcg_temp_free(EA);                                                        \
-    tcg_temp_free_i64(t0);                                                    \
-}
-
-#define GEN_STUXF(name, stop, opc, type)                                      \
-static void glue(gen_, name##ux)(DisasContext *ctx)                           \
-{                                                                             \
-    TCGv EA;                                                                  \
-    TCGv_i64 t0;                                                              \
-    if (unlikely(!ctx->fpu_enabled)) {                                        \
-        gen_exception(ctx, POWERPC_EXCP_FPU);                                 \
-        return;                                                               \
-    }                                                                         \
-    if (unlikely(rA(ctx->opcode) == 0)) {                                     \
-        gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);                   \
-        return;                                                               \
-    }                                                                         \
-    gen_set_access_type(ctx, ACCESS_FLOAT);                                   \
-    EA = tcg_temp_new();                                                      \
-    t0 = tcg_temp_new_i64();                                                  \
-    gen_addr_reg_index(ctx, EA);                                              \
-    get_fpr(t0, rS(ctx->opcode));                                             \
-    gen_qemu_##stop(ctx, t0, EA);                                             \
-    tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], EA);                             \
-    tcg_temp_free(EA);                                                        \
-    tcg_temp_free_i64(t0);                                                    \
-}
 
 #define GEN_STXF(name, stop, opc2, opc3, type)                                \
 static void glue(gen_, name##x)(DisasContext *ctx)                            \
@@ -1176,12 +1011,6 @@ static void glue(gen_, name##x)(DisasContext *ctx)                            \
     tcg_temp_free_i64(t0);                                                    \
 }
 
-#define GEN_STFS(name, stop, op, type)                                        \
-GEN_STF(name, stop, op | 0x20, type);                                         \
-GEN_STUF(name, stop, op | 0x21, type);                                        \
-GEN_STUXF(name, stop, op | 0x01, type);                                       \
-GEN_STXF(name, stop, 0x17, op | 0x00, type)
-
 static void gen_qemu_st32fs(DisasContext *ctx, TCGv_i64 src, TCGv addr)
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
@@ -1190,11 +1019,6 @@ static void gen_qemu_st32fs(DisasContext *ctx, TCGv_i64 src, TCGv addr)
     tcg_temp_free_i32(tmp);
 }
 
-/* stfd stfdu stfdux stfdx */
-GEN_STFS(stfd, st64_i64, 0x16, PPC_FLOAT);
-/* stfs stfsu stfsux stfsx */
-GEN_STFS(stfs, st32fs, 0x14, PPC_FLOAT);
-
 /* stfdepx (external PID lfdx) */
 static void gen_stfdepx(DisasContext *ctx)
 {
@@ -1473,6 +1297,70 @@ static void gen_stfqx(DisasContext *ctx)
     tcg_temp_free_i64(t1);
 }
 
+/*            Floating-point Load/Store Instructions                         */
+static bool do_lsfpsd(DisasContext *ctx, int rt, int ra, TCGv displ,
+                      bool update, bool store, bool single)
+{
+    TCGv ea;
+    TCGv_i64 t0;
+    REQUIRE_INSNS_FLAGS(ctx, FLOAT);
+    REQUIRE_FPU(ctx);
+    if (update && ra == 0) {
+        gen_invalid(ctx);
+        return true;
+    }
+    gen_set_access_type(ctx, ACCESS_FLOAT);
+    t0 = tcg_temp_new_i64();
+    ea = tcg_temp_new();
+    do_ea_calc(ctx, ra, displ, ea);
+    if (store) {
+        get_fpr(t0, rt);
+        single ? gen_qemu_st32fs(ctx, t0, ea) : gen_qemu_st64_i64(ctx, t0, ea);
+    } else {
+        single ? gen_qemu_ld32fs(ctx, t0, ea) : gen_qemu_ld64_i64(ctx, t0, ea);
+        set_fpr(rt, t0);
+    }
+    if (update) {
+        tcg_gen_mov_tl(cpu_gpr[rt], ea);
+    }
+    tcg_temp_free_i64(t0);
+    tcg_temp_free(ea);
+    return true;
+}
+
+static bool do_lsfp_D(DisasContext *ctx, arg_D *a, bool update, bool store,
+                      bool single)
+{
+    return do_lsfpsd(ctx, a->rt, a->ra, tcg_constant_tl(a->si), update, store,
+                     single);
+}
+
+static bool do_lsfp_X(DisasContext *ctx, arg_X *a, bool update,
+                      bool store, bool single)
+{
+    return do_lsfpsd(ctx, a->rt, a->ra, cpu_gpr[a->rb], update, store, single);
+}
+
+TRANS(LFS, do_lsfp_D, false, false, true)
+TRANS(LFSU, do_lsfp_D, true, false, true)
+TRANS(LFSX, do_lsfp_X, false, false, true)
+TRANS(LFSUX, do_lsfp_X, true, false, true)
+
+TRANS(LFD, do_lsfp_D, false, false, false)
+TRANS(LFDU, do_lsfp_D, true, false, false)
+TRANS(LFDX, do_lsfp_X, false, false, false)
+TRANS(LFDUX, do_lsfp_X, true, false, false)
+
+TRANS(STFS, do_lsfp_D, false, true, true)
+TRANS(STFSU, do_lsfp_D, true, true, true)
+TRANS(STFSX, do_lsfp_X, false, true, true)
+TRANS(STFSUX, do_lsfp_X, true, true, true)
+
+TRANS(STFD, do_lsfp_D, false, true, false)
+TRANS(STFDU, do_lsfp_D, true, true, false)
+TRANS(STFDX, do_lsfp_X, false, true, false)
+TRANS(STFDUX, do_lsfp_X, true, true, false)
+
 #undef _GEN_FLOAT_ACB
 #undef GEN_FLOAT_ACB
 #undef _GEN_FLOAT_AB
diff --git a/target/ppc/translate/fp-ops.c.inc b/target/ppc/translate/fp-ops.c.inc
index 88fab65628..4260635a12 100644
--- a/target/ppc/translate/fp-ops.c.inc
+++ b/target/ppc/translate/fp-ops.c.inc
@@ -50,43 +50,14 @@ GEN_FLOAT_B(riz, 0x08, 0x0D, 1, PPC_FLOAT_EXT),
 GEN_FLOAT_B(rip, 0x08, 0x0E, 1, PPC_FLOAT_EXT),
 GEN_FLOAT_B(rim, 0x08, 0x0F, 1, PPC_FLOAT_EXT),
 
-#define GEN_LDF(name, ldop, opc, type)                                        \
-GEN_HANDLER(name, opc, 0xFF, 0xFF, 0x00000000, type),
-#define GEN_LDUF(name, ldop, opc, type)                                       \
-GEN_HANDLER(name##u, opc, 0xFF, 0xFF, 0x00000000, type),
-#define GEN_LDUXF(name, ldop, opc, type)                                      \
-GEN_HANDLER(name##ux, 0x1F, 0x17, opc, 0x00000001, type),
-#define GEN_LDXF(name, ldop, opc2, opc3, type)                                \
-GEN_HANDLER(name##x, 0x1F, opc2, opc3, 0x00000001, type),
-#define GEN_LDFS(name, ldop, op, type)                                        \
-GEN_LDF(name, ldop, op | 0x20, type)                                          \
-GEN_LDUF(name, ldop, op | 0x21, type)                                         \
-GEN_LDUXF(name, ldop, op | 0x01, type)                                        \
-GEN_LDXF(name, ldop, 0x17, op | 0x00, type)
-
-GEN_LDFS(lfd, ld64, 0x12, PPC_FLOAT)
-GEN_LDFS(lfs, ld32fs, 0x10, PPC_FLOAT)
 GEN_HANDLER_E(lfdepx, 0x1F, 0x1F, 0x12, 0x00000001, PPC_NONE, PPC2_BOOKE206),
 GEN_HANDLER_E(lfiwax, 0x1f, 0x17, 0x1a, 0x00000001, PPC_NONE, PPC2_ISA205),
 GEN_HANDLER_E(lfiwzx, 0x1f, 0x17, 0x1b, 0x1, PPC_NONE, PPC2_FP_CVT_ISA206),
 GEN_HANDLER_E(lfdpx, 0x1F, 0x17, 0x18, 0x00200001, PPC_NONE, PPC2_ISA205),
 
-#define GEN_STF(name, stop, opc, type)                                        \
-GEN_HANDLER(name, opc, 0xFF, 0xFF, 0x00000000, type),
-#define GEN_STUF(name, stop, opc, type)                                       \
-GEN_HANDLER(name##u, opc, 0xFF, 0xFF, 0x00000000, type),
-#define GEN_STUXF(name, stop, opc, type)                                      \
-GEN_HANDLER(name##ux, 0x1F, 0x17, opc, 0x00000001, type),
 #define GEN_STXF(name, stop, opc2, opc3, type)                                \
 GEN_HANDLER(name##x, 0x1F, opc2, opc3, 0x00000001, type),
-#define GEN_STFS(name, stop, op, type)                                        \
-GEN_STF(name, stop, op | 0x20, type)                                          \
-GEN_STUF(name, stop, op | 0x21, type)                                         \
-GEN_STUXF(name, stop, op | 0x01, type)                                        \
-GEN_STXF(name, stop, 0x17, op | 0x00, type)
 
-GEN_STFS(stfd, st64_i64, 0x16, PPC_FLOAT)
-GEN_STFS(stfs, st32fs, 0x14, PPC_FLOAT)
 GEN_STXF(stfiw, st32fiw, 0x17, 0x1E, PPC_FLOAT_STFIWX)
 GEN_HANDLER_E(stfdepx, 0x1F, 0x1F, 0x16, 0x00000001, PPC_NONE, PPC2_BOOKE206),
 GEN_HANDLER_E(stfdpx, 0x1F, 0x17, 0x1C, 0x00200001, PPC_NONE, PPC2_ISA205),
-- 
2.25.1


