Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8055B37D3E4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:35:02 +0200 (CEST)
Received: from localhost ([::1]:48790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgudJ-0004X6-A0
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu6K-0002De-Ph; Wed, 12 May 2021 15:00:56 -0400
Received: from [201.28.113.2] (port=1436 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu6I-0002Bm-L8; Wed, 12 May 2021 15:00:56 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 15:56:07 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 6B57B8000C2;
 Wed, 12 May 2021 15:56:07 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 26/31] target/ppc: Move D/DS/X-form integer stores to
 decodetree
Date: Wed, 12 May 2021 15:54:36 -0300
Message-Id: <20210512185441.3619828-27-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2021 18:56:07.0766 (UTC)
 FILETIME=[777A5F60:01D74760]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, luis.pires@eldorado.org.br,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

These are all connected by macros in the legacy decoding.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v4:
- @D{,S} instead of @PLS_D{,S} for non-prefixed stores;
---
 target/ppc/insn32.decode                   | 22 ++++++
 target/ppc/translate.c                     | 85 +---------------------
 target/ppc/translate/fixedpoint-impl.c.inc | 24 ++++++
 3 files changed, 49 insertions(+), 82 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 860b96d866..8460100177 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -57,6 +57,28 @@ LDU             111010 ..... ..... ..............01     @DS
 LDX             011111 ..... ..... ..... 0000010101 -   @X
 LDUX            011111 ..... ..... ..... 0000110101 -   @X
 
+### Fixed-Point Store Instructions
+
+STB             100110 ..... ..... ................     @D
+STBU            100111 ..... ..... ................     @D
+STBX            011111 ..... ..... ..... 0011010111 -   @X
+STBUX           011111 ..... ..... ..... 0011110111 -   @X
+
+STH             101100 ..... ..... ................     @D
+STHU            101101 ..... ..... ................     @D
+STHX            011111 ..... ..... ..... 0110010111 -   @X
+STHUX           011111 ..... ..... ..... 0110110111 -   @X
+
+STW             100100 ..... ..... ................     @D
+STWU            100101 ..... ..... ................     @D
+STWX            011111 ..... ..... ..... 0010010111 -   @X
+STWUX           011111 ..... ..... ..... 0010110111 -   @X
+
+STD             111110 ..... ..... ..............00     @DS
+STDU            111110 ..... ..... ..............01     @DS
+STDX            011111 ..... ..... ..... 0010010101 -   @X
+STDUX           011111 ..... ..... ..... 0010110101 -   @X
+
 ### Fixed-Point Arithmetic Instructions
 
 ADDI            001110 ..... ..... ................     @D
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 32d217071b..477e3deede 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3388,7 +3388,9 @@ static void glue(gen_qemu_, stop)(DisasContext *ctx,                    \
     tcg_gen_qemu_st_tl(val, addr, ctx->mem_idx, op);                    \
 }
 
+#if defined(TARGET_PPC64) || !defined(CONFIG_USER_ONLY)
 GEN_QEMU_STORE_TL(st8,  DEF_MEMOP(MO_UB))
+#endif
 GEN_QEMU_STORE_TL(st16, DEF_MEMOP(MO_UW))
 GEN_QEMU_STORE_TL(st32, DEF_MEMOP(MO_UL))
 
@@ -3521,52 +3523,6 @@ static void gen_lq(DisasContext *ctx)
 #endif
 
 /***                              Integer store                            ***/
-#define GEN_ST(name, stop, opc, type)                                         \
-static void glue(gen_, name)(DisasContext *ctx)                               \
-{                                                                             \
-    TCGv EA;                                                                  \
-    gen_set_access_type(ctx, ACCESS_INT);                                     \
-    EA = tcg_temp_new();                                                      \
-    gen_addr_imm_index(ctx, EA, 0);                                           \
-    gen_qemu_##stop(ctx, cpu_gpr[rS(ctx->opcode)], EA);                       \
-    tcg_temp_free(EA);                                                        \
-}
-
-#define GEN_STU(name, stop, opc, type)                                        \
-static void glue(gen_, stop##u)(DisasContext *ctx)                            \
-{                                                                             \
-    TCGv EA;                                                                  \
-    if (unlikely(rA(ctx->opcode) == 0)) {                                     \
-        gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);                   \
-        return;                                                               \
-    }                                                                         \
-    gen_set_access_type(ctx, ACCESS_INT);                                     \
-    EA = tcg_temp_new();                                                      \
-    if (type == PPC_64B)                                                      \
-        gen_addr_imm_index(ctx, EA, 0x03);                                    \
-    else                                                                      \
-        gen_addr_imm_index(ctx, EA, 0);                                       \
-    gen_qemu_##stop(ctx, cpu_gpr[rS(ctx->opcode)], EA);                       \
-    tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], EA);                             \
-    tcg_temp_free(EA);                                                        \
-}
-
-#define GEN_STUX(name, stop, opc2, opc3, type)                                \
-static void glue(gen_, name##ux)(DisasContext *ctx)                           \
-{                                                                             \
-    TCGv EA;                                                                  \
-    if (unlikely(rA(ctx->opcode) == 0)) {                                     \
-        gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);                   \
-        return;                                                               \
-    }                                                                         \
-    gen_set_access_type(ctx, ACCESS_INT);                                     \
-    EA = tcg_temp_new();                                                      \
-    gen_addr_reg_index(ctx, EA);                                              \
-    gen_qemu_##stop(ctx, cpu_gpr[rS(ctx->opcode)], EA);                       \
-    tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], EA);                             \
-    tcg_temp_free(EA);                                                        \
-}
-
 #define GEN_STX_E(name, stop, opc2, opc3, type, type2, chk)                   \
 static void glue(gen_, name##x)(DisasContext *ctx)                            \
 {                                                                             \
@@ -3584,19 +3540,6 @@ static void glue(gen_, name##x)(DisasContext *ctx)                            \
 #define GEN_STX_HVRM(name, stop, opc2, opc3, type)                            \
     GEN_STX_E(name, stop, opc2, opc3, type, PPC_NONE, CHK_HVRM)
 
-#define GEN_STS(name, stop, op, type)                                         \
-GEN_ST(name, stop, op | 0x20, type);                                          \
-GEN_STU(name, stop, op | 0x21, type);                                         \
-GEN_STUX(name, stop, 0x17, op | 0x01, type);                                  \
-GEN_STX(name, stop, 0x17, op | 0x00, type)
-
-/* stb stbu stbux stbx */
-GEN_STS(stb, st8, 0x06, PPC_INTEGER);
-/* sth sthu sthux sthx */
-GEN_STS(sth, st16, 0x0C, PPC_INTEGER);
-/* stw stwu stwux stwx */
-GEN_STS(stw, st32, 0x04, PPC_INTEGER);
-
 #define GEN_STEPX(name, stop, opc2, opc3)                                     \
 static void glue(gen_, name##epx)(DisasContext *ctx)                          \
 {                                                                             \
@@ -3618,8 +3561,6 @@ GEN_STEPX(std, DEF_MEMOP(MO_Q), 0x1d, 0x04)
 #endif
 
 #if defined(TARGET_PPC64)
-GEN_STUX(std, st64_i64, 0x15, 0x05, PPC_64B);
-GEN_STX(std, st64_i64, 0x15, 0x04, PPC_64B);
 GEN_STX_HVRM(stdcix, st64_i64, 0x15, 0x1f, PPC_CILDST)
 GEN_STX_HVRM(stwcix, st32, 0x15, 0x1c, PPC_CILDST)
 GEN_STX_HVRM(sthcix, st16, 0x15, 0x1d, PPC_CILDST)
@@ -8255,31 +8196,11 @@ GEN_LDEPX(lw, DEF_MEMOP(MO_UL), 0x1F, 0x00)
 GEN_LDEPX(ld, DEF_MEMOP(MO_Q), 0x1D, 0x00)
 #endif
 
-#undef GEN_ST
-#undef GEN_STU
-#undef GEN_STUX
 #undef GEN_STX_E
-#undef GEN_STS
-#define GEN_ST(name, stop, opc, type)                                         \
-GEN_HANDLER(name, opc, 0xFF, 0xFF, 0x00000000, type),
-#define GEN_STU(name, stop, opc, type)                                        \
-GEN_HANDLER(stop##u, opc, 0xFF, 0xFF, 0x00000000, type),
-#define GEN_STUX(name, stop, opc2, opc3, type)                                \
-GEN_HANDLER(name##ux, 0x1F, opc2, opc3, 0x00000001, type),
 #define GEN_STX_E(name, stop, opc2, opc3, type, type2, chk)                   \
 GEN_HANDLER_E(name##x, 0x1F, opc2, opc3, 0x00000000, type, type2),
-#define GEN_STS(name, stop, op, type)                                         \
-GEN_ST(name, stop, op | 0x20, type)                                           \
-GEN_STU(name, stop, op | 0x21, type)                                          \
-GEN_STUX(name, stop, 0x17, op | 0x01, type)                                   \
-GEN_STX(name, stop, 0x17, op | 0x00, type)
-
-GEN_STS(stb, st8, 0x06, PPC_INTEGER)
-GEN_STS(sth, st16, 0x0C, PPC_INTEGER)
-GEN_STS(stw, st32, 0x04, PPC_INTEGER)
+
 #if defined(TARGET_PPC64)
-GEN_STUX(std, st64_i64, 0x15, 0x05, PPC_64B)
-GEN_STX(std, st64_i64, 0x15, 0x04, PPC_64B)
 GEN_STX_E(stdbr, st64r_i64, 0x14, 0x14, PPC_NONE, PPC2_DBRX, CHK_NONE)
 GEN_STX_HVRM(stdcix, st64_i64, 0x15, 0x1f, PPC_CILDST)
 GEN_STX_HVRM(stwcix, st32, 0x15, 0x1c, PPC_CILDST)
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 67291e0b75..7fec0a8595 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -137,6 +137,30 @@ TRANS64(LDU, do_ldst_D, true, false, MO_Q)
 TRANS64(LDUX, do_ldst_X, true, false, MO_Q)
 TRANS64(PLD, do_ldst_PLS_D, false, false, MO_Q)
 
+/* Store Byte */
+TRANS(STB, do_ldst_D, false, true, MO_UB)
+TRANS(STBX, do_ldst_X, false, true, MO_UB)
+TRANS(STBU, do_ldst_D, true, true, MO_UB)
+TRANS(STBUX, do_ldst_X, true, true, MO_UB)
+
+/* Store Halfword */
+TRANS(STH, do_ldst_D, false, true, MO_UW)
+TRANS(STHX, do_ldst_X, false, true, MO_UW)
+TRANS(STHU, do_ldst_D, true, true, MO_UW)
+TRANS(STHUX, do_ldst_X, true, true, MO_UW)
+
+/* Store Word */
+TRANS(STW, do_ldst_D, false, true, MO_UL)
+TRANS(STWX, do_ldst_X, false, true, MO_UL)
+TRANS(STWU, do_ldst_D, true, true, MO_UL)
+TRANS(STWUX, do_ldst_X, true, true, MO_UL)
+
+/* Store Doubleword */
+TRANS64(STD, do_ldst_D, false, true, MO_Q)
+TRANS64(STDX, do_ldst_X, false, true, MO_Q)
+TRANS64(STDU, do_ldst_D, true, true, MO_Q)
+TRANS64(STDUX, do_ldst_X, true, true, MO_Q)
+
 /*
  * Fixed-Point Arithmetic Instructions
  */
-- 
2.25.1


