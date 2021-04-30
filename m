Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C2B36F3CE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:44:36 +0200 (CEST)
Received: from localhost ([::1]:52120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcICp-0000n5-EN
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHle-0003Yw-IC
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:30 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:39699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlF-0007fQ-Vh
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:30 -0400
Received: by mail-pl1-x62d.google.com with SMTP id s15so7323561plg.6
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cA4pdrFqJgCOtOao5tQO/97hyzQncRB0Q2dw6LON6/k=;
 b=ob5ZlrbGOwZebbGvq0PyMXvMPbJYb1StZjtyJGkX4m1ItCerV7QaZ0qLeDRDdxvEIe
 tayWhOVasT8PoiPeR9MWo6Mdl+lveRQiOBaczEzNNl6H67PhGVo9wTaY525mHdtgHvE9
 GYv0eJwD68gcsRs+Oue6rX2EytWCr//kn8McDSypvGPtASyfuTPL4Y9uE/cUaA4axXmv
 fJO8NvcTPrsaVLoMf/5G8fz2ZsrcagCJkWlzhdNK5V+Xh9usWPt7CAzg8FUcu0pH55FF
 Qoj+S5DJMzsx8LvG7/2yzJPR/r1t6kz31lIa5x07LI/radel/HBNGvxf5cvQ/EFGri8F
 xTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cA4pdrFqJgCOtOao5tQO/97hyzQncRB0Q2dw6LON6/k=;
 b=E8h4Dj+Bi4AKUhTRd5uAenMFO8ERYBZ2X0Q/sF6aYuY9FJHFGc27Cz63QI9BipLuuc
 Gc2C7hIpZRUfpJHEvmTCXYLiSZZsEJF0ioTe9Wm8eCNhd8ozCG8anyCAYOWMICtw+80+
 KgPb8K4xPWFN0A8KGt8tr3VqRjLFbj7QWQjQ5qx+g/yhZMlEIGpgXmGJpvbD5jhOdarj
 UTzl4imuOLchMO/44SainkPKkHOSLLo3ZcamYxa/PhIxF/b3cdBAbNRmzrOfxaBhgd8h
 yCkMD56N4Fa2parsp/8+81cSP+OxFBNb4k2ke43k2HnOdeWriA6bHxd42ahiKhlXl/ar
 mjQg==
X-Gm-Message-State: AOAM532eD37B3IHOC0vlcWWVyYgrWehvxxo33Fk9HM7mPR/X39/7use+
 hL9sxPI90mCCuo6LJ3zfU/LmnUiK5egCJw==
X-Google-Smtp-Source: ABdhPJyuJUQp5b70/QJJPu2Cpx2Bzvq3cLSkTRGzm+A3JJ2sDRWVWPNfLfFWmdsaEgfNL05HjWu8Aw==
X-Received: by 2002:a17:90b:31cc:: with SMTP id
 jv12mr12697378pjb.105.1619745364508; 
 Thu, 29 Apr 2021 18:16:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:16:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 29/30] target/ppc: Move D/DS/X-form integer stores to
 decodetree
Date: Thu, 29 Apr 2021 18:15:42 -0700
Message-Id: <20210430011543.1017113-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are all connected by macros in the legacy decoding.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/insn32.decode                   | 22 ++++++
 target/ppc/translate.c                     | 83 +---------------------
 target/ppc/translate/fixedpoint-impl.c.inc | 24 +++++++
 3 files changed, 48 insertions(+), 81 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 1c1b4620fc..7d35f61e45 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -63,6 +63,28 @@ LDU             111010 ..... ..... ..............01     @PLS_DS
 LDX             011111 ..... ..... ..... 0000010101 -   @X
 LDUX            011111 ..... ..... ..... 0000110101 -   @X
 
+### Fixed-Point Store Instructions
+
+STB             100110 ..... ..... ................     @PLS_D
+STBU            100111 ..... ..... ................     @PLS_D
+STBX            011111 ..... ..... ..... 0011010111 -   @X
+STBUX           011111 ..... ..... ..... 0011110111 -   @X
+
+STH             101100 ..... ..... ................     @PLS_D
+STHU            101101 ..... ..... ................     @PLS_D
+STHX            011111 ..... ..... ..... 0110010111 -   @X
+STHUX           011111 ..... ..... ..... 0110110111 -   @X
+
+STW             100100 ..... ..... ................     @PLS_D
+STWU            100101 ..... ..... ................     @PLS_D
+STWX            011111 ..... ..... ..... 0010010111 -   @X
+STWUX           011111 ..... ..... ..... 0010110111 -   @X
+
+STD             111110 ..... ..... ..............00     @PLS_DS
+STDU            111110 ..... ..... ..............01     @PLS_DS
+STDX            011111 ..... ..... ..... 0010010101 -   @X
+STDUX           011111 ..... ..... ..... 0010110101 -   @X
+
 ### Fixed-Point Arithmetic Instructions
 
 ADDI            001110 ..... ..... ................     @PLS_D
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 1fdb501ee9..ad32fcc740 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -2463,7 +2463,9 @@ static void glue(gen_qemu_, stop)(DisasContext *ctx,                    \
     tcg_gen_qemu_st_tl(val, addr, ctx->mem_idx, op);                    \
 }
 
+#if defined(TARGET_PPC64) || !defined(CONFIG_USER_ONLY)
 GEN_QEMU_STORE_TL(st8,  DEF_MEMOP(MO_UB))
+#endif
 GEN_QEMU_STORE_TL(st16, DEF_MEMOP(MO_UW))
 GEN_QEMU_STORE_TL(st32, DEF_MEMOP(MO_UL))
 
@@ -2596,52 +2598,6 @@ static void gen_lq(DisasContext *ctx)
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
@@ -2659,19 +2615,6 @@ static void glue(gen_, name##x)(DisasContext *ctx)                            \
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
@@ -2693,8 +2636,6 @@ GEN_STEPX(std, DEF_MEMOP(MO_Q), 0x1d, 0x04)
 #endif
 
 #if defined(TARGET_PPC64)
-GEN_STUX(std, st64_i64, 0x15, 0x05, PPC_64B);
-GEN_STX(std, st64_i64, 0x15, 0x04, PPC_64B);
 GEN_STX_HVRM(stdcix, st64_i64, 0x15, 0x1f, PPC_CILDST)
 GEN_STX_HVRM(stwcix, st32, 0x15, 0x1c, PPC_CILDST)
 GEN_STX_HVRM(sthcix, st16, 0x15, 0x1d, PPC_CILDST)
@@ -7378,31 +7319,11 @@ GEN_LDEPX(lw, DEF_MEMOP(MO_UL), 0x1F, 0x00)
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
 
-GEN_STS(stb, st8, 0x06, PPC_INTEGER)
-GEN_STS(sth, st16, 0x0C, PPC_INTEGER)
-GEN_STS(stw, st32, 0x04, PPC_INTEGER)
 #if defined(TARGET_PPC64)
-GEN_STUX(std, st64_i64, 0x15, 0x05, PPC_64B)
-GEN_STX(std, st64_i64, 0x15, 0x04, PPC_64B)
 GEN_STX_E(stdbr, st64r_i64, 0x14, 0x14, PPC_NONE, PPC2_DBRX, CHK_NONE)
 GEN_STX_HVRM(stdcix, st64_i64, 0x15, 0x1f, PPC_CILDST)
 GEN_STX_HVRM(stwcix, st32, 0x15, 0x1c, PPC_CILDST)
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index cb3219c996..6d57f0038b 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -143,6 +143,30 @@ TRANS64(LDX, do_ldst_X, false, false, MO_Q)
 TRANS64(LDU, do_ldst_PLS_D, true, false, MO_Q)
 TRANS64(LDUX, do_ldst_X, true, false, MO_Q)
 
+/* Store Byte */
+TRANS(STB, do_ldst_PLS_D, false, true, MO_UB)
+TRANS(STBX, do_ldst_X, false, true, MO_UB)
+TRANS(STBU, do_ldst_PLS_D, true, true, MO_UB)
+TRANS(STBUX, do_ldst_X, true, true, MO_UB)
+
+/* Store Halfword */
+TRANS(STH, do_ldst_PLS_D, false, true, MO_UW)
+TRANS(STHX, do_ldst_X, false, true, MO_UW)
+TRANS(STHU, do_ldst_PLS_D, true, true, MO_UW)
+TRANS(STHUX, do_ldst_X, true, true, MO_UW)
+
+/* Store Word */
+TRANS(STW, do_ldst_PLS_D, false, true, MO_UL)
+TRANS(STWX, do_ldst_X, false, true, MO_UL)
+TRANS(STWU, do_ldst_PLS_D, true, true, MO_UL)
+TRANS(STWUX, do_ldst_X, true, true, MO_UL)
+
+/* Store Doubleword */
+TRANS64(STD, do_ldst_PLS_D, false, true, MO_Q)
+TRANS64(STDX, do_ldst_X, false, true, MO_Q)
+TRANS64(STDU, do_ldst_PLS_D, true, true, MO_Q)
+TRANS64(STDUX, do_ldst_X, true, true, MO_Q)
+
 /*
  * Fixed-Point Arithmetic Instructions
  */
-- 
2.25.1


