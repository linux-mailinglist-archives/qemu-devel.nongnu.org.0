Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B78B1399CD1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:41:54 +0200 (CEST)
Received: from localhost ([::1]:56084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loivJ-0003Td-RH
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loie0-0008Ff-E9; Thu, 03 Jun 2021 04:24:00 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45911 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidx-0000bq-2B; Thu, 03 Jun 2021 04:23:59 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5q6SVvz9t5G; Thu,  3 Jun 2021 18:22:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708559;
 bh=M+zSZGhgcEUqc1YqT6EAdN/4wahTJaWpgEf1EAF8ZRs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RHl+9tvs4olQOyXWq4AL3RCtmUm+FFytIFxU27P/EhkVddxdcJ6Ilv4fgKhHiq2Yc
 6eTOOOAnXrbCcTkSAVd43p1dNwOtr9M5BOF9eQrnMlRz9hlVgMZTujZ9P2oWDBDNKx
 9lId5Hl/rg0ZeKGnde3UEXyyaEXU8uRCdXWtajKw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 35/42] target/ppc: Move D/DS/X-form integer stores to decodetree
Date: Thu,  3 Jun 2021 18:22:24 +1000
Message-Id: <20210603082231.601214-36-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

These are all connected by macros in the legacy decoding.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210601193528.2533031-9-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/insn32.decode                   | 22 ++++++
 target/ppc/translate.c                     | 85 +---------------------
 target/ppc/translate/fixedpoint-impl.c.inc | 24 ++++++
 3 files changed, 49 insertions(+), 82 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 70f64c235b..00ec0f4328 100644
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
index d9238d1d10..3c3cb1b664 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3299,7 +3299,9 @@ static void glue(gen_qemu_, stop)(DisasContext *ctx,                    \
     tcg_gen_qemu_st_tl(val, addr, ctx->mem_idx, op);                    \
 }
 
+#if defined(TARGET_PPC64) || !defined(CONFIG_USER_ONLY)
 GEN_QEMU_STORE_TL(st8,  DEF_MEMOP(MO_UB))
+#endif
 GEN_QEMU_STORE_TL(st16, DEF_MEMOP(MO_UW))
 GEN_QEMU_STORE_TL(st32, DEF_MEMOP(MO_UL))
 
@@ -3432,52 +3434,6 @@ static void gen_lq(DisasContext *ctx)
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
@@ -3495,19 +3451,6 @@ static void glue(gen_, name##x)(DisasContext *ctx)                            \
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
@@ -3529,8 +3472,6 @@ GEN_STEPX(std, DEF_MEMOP(MO_Q), 0x1d, 0x04)
 #endif
 
 #if defined(TARGET_PPC64)
-GEN_STUX(std, st64_i64, 0x15, 0x05, PPC_64B);
-GEN_STX(std, st64_i64, 0x15, 0x04, PPC_64B);
 GEN_STX_HVRM(stdcix, st64_i64, 0x15, 0x1f, PPC_CILDST)
 GEN_STX_HVRM(stwcix, st32, 0x15, 0x1c, PPC_CILDST)
 GEN_STX_HVRM(sthcix, st16, 0x15, 0x1d, PPC_CILDST)
@@ -8166,31 +8107,11 @@ GEN_LDEPX(lw, DEF_MEMOP(MO_UL), 0x1F, 0x00)
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
index 7687f31d6f..adeee33289 100644
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
2.31.1


