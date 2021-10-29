Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 554084404A5
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 23:08:08 +0200 (CEST)
Received: from localhost ([::1]:56078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgZ6d-0008N9-EU
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 17:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYUo-0008A4-Bv; Fri, 29 Oct 2021 16:29:02 -0400
Received: from [201.28.113.2] (port=31431 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYUk-0002mo-Vo; Fri, 29 Oct 2021 16:29:02 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 29 Oct 2021 17:26:33 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id C5F55800B36;
 Fri, 29 Oct 2021 17:26:32 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 23/34] target/ppc: moved stxvx and lxvx from legacy to
 decodtree
Date: Fri, 29 Oct 2021 17:24:14 -0300
Message-Id: <20211029202424.175401-24-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Oct 2021 20:26:33.0297 (UTC)
 FILETIME=[43923410:01D7CD03]
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
 luis.pires@eldorado.org.br, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>

Moved stxvx and lxvx implementation from the legacy system to
decodetree.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.castro@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |   5 ++
 target/ppc/translate/vsx-impl.c.inc | 121 ++++------------------------
 target/ppc/translate/vsx-ops.c.inc  |   2 -
 3 files changed, 20 insertions(+), 108 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 296d6d6c5a..3ce26b2e6e 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -103,6 +103,9 @@
 
 @X_tbp_s_rc     ...... ....0 s:1 .... ....0 .......... rc:1     &X_tb_s_rc rt=%x_frtp rb=%x_frbp
 
+%x_rt_tsx       0:1 21:5
+@X_TSX          ...... ..... ra:5 rb:5 .......... .             &X rt=%x_rt_tsx
+
 &X_frtp_vrb     frtp vrb
 @X_frtp_vrb     ...... ....0 ..... vrb:5 .......... .           &X_frtp_vrb frtp=%x_frtp
 
@@ -393,3 +396,5 @@ VSRDBI          000100 ..... ..... ..... 01 ... 010110  @VN
 
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
 STXV            111101 ..... ..... ............ . 101   @DQ_TSX
+LXVX            011111 ..... ..... ..... 0100 - 01100 . @X_TSX
+STXVX           011111 ..... ..... ..... 0110001100 .   @X_TSX
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 9da66b5348..1973bb18f3 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -255,112 +255,6 @@ static void gen_lxvb16x(DisasContext *ctx)
     tcg_temp_free_i64(xtl);
 }
 
-#define VSX_VECTOR_LOAD(name, op, indexed)                  \
-static void gen_##name(DisasContext *ctx)                   \
-{                                                           \
-    int xt;                                                 \
-    TCGv EA;                                                \
-    TCGv_i64 xth;                                           \
-    TCGv_i64 xtl;                                           \
-                                                            \
-    if (indexed) {                                          \
-        xt = xT(ctx->opcode);                               \
-    } else {                                                \
-        xt = DQxT(ctx->opcode);                             \
-    }                                                       \
-                                                            \
-    if (xt < 32) {                                          \
-        if (unlikely(!ctx->vsx_enabled)) {                  \
-            gen_exception(ctx, POWERPC_EXCP_VSXU);          \
-            return;                                         \
-        }                                                   \
-    } else {                                                \
-        if (unlikely(!ctx->altivec_enabled)) {              \
-            gen_exception(ctx, POWERPC_EXCP_VPU);           \
-            return;                                         \
-        }                                                   \
-    }                                                       \
-    xth = tcg_temp_new_i64();                               \
-    xtl = tcg_temp_new_i64();                               \
-    gen_set_access_type(ctx, ACCESS_INT);                   \
-    EA = tcg_temp_new();                                    \
-    if (indexed) {                                          \
-        gen_addr_reg_index(ctx, EA);                        \
-    } else {                                                \
-        gen_addr_imm_index(ctx, EA, 0x0F);                  \
-    }                                                       \
-    if (ctx->le_mode) {                                     \
-        tcg_gen_qemu_##op(xtl, EA, ctx->mem_idx, MO_LEQ);   \
-        set_cpu_vsr(xt, xtl, false);                        \
-        tcg_gen_addi_tl(EA, EA, 8);                         \
-        tcg_gen_qemu_##op(xth, EA, ctx->mem_idx, MO_LEQ);   \
-        set_cpu_vsr(xt, xth, true);                         \
-    } else {                                                \
-        tcg_gen_qemu_##op(xth, EA, ctx->mem_idx, MO_BEQ);   \
-        set_cpu_vsr(xt, xth, true);                         \
-        tcg_gen_addi_tl(EA, EA, 8);                         \
-        tcg_gen_qemu_##op(xtl, EA, ctx->mem_idx, MO_BEQ);   \
-        set_cpu_vsr(xt, xtl, false);                        \
-    }                                                       \
-    tcg_temp_free(EA);                                      \
-    tcg_temp_free_i64(xth);                                 \
-    tcg_temp_free_i64(xtl);                                 \
-}
-
-VSX_VECTOR_LOAD(lxvx, ld_i64, 1)
-
-#define VSX_VECTOR_STORE(name, op, indexed)                 \
-static void gen_##name(DisasContext *ctx)                   \
-{                                                           \
-    int xt;                                                 \
-    TCGv EA;                                                \
-    TCGv_i64 xth;                                           \
-    TCGv_i64 xtl;                                           \
-                                                            \
-    if (indexed) {                                          \
-        xt = xT(ctx->opcode);                               \
-    } else {                                                \
-        xt = DQxT(ctx->opcode);                             \
-    }                                                       \
-                                                            \
-    if (xt < 32) {                                          \
-        if (unlikely(!ctx->vsx_enabled)) {                  \
-            gen_exception(ctx, POWERPC_EXCP_VSXU);          \
-            return;                                         \
-        }                                                   \
-    } else {                                                \
-        if (unlikely(!ctx->altivec_enabled)) {              \
-            gen_exception(ctx, POWERPC_EXCP_VPU);           \
-            return;                                         \
-        }                                                   \
-    }                                                       \
-    xth = tcg_temp_new_i64();                               \
-    xtl = tcg_temp_new_i64();                               \
-    get_cpu_vsr(xth, xt, true);                             \
-    get_cpu_vsr(xtl, xt, false);                            \
-    gen_set_access_type(ctx, ACCESS_INT);                   \
-    EA = tcg_temp_new();                                    \
-    if (indexed) {                                          \
-        gen_addr_reg_index(ctx, EA);                        \
-    } else {                                                \
-        gen_addr_imm_index(ctx, EA, 0x0F);                  \
-    }                                                       \
-    if (ctx->le_mode) {                                     \
-        tcg_gen_qemu_##op(xtl, EA, ctx->mem_idx, MO_LEQ);   \
-        tcg_gen_addi_tl(EA, EA, 8);                         \
-        tcg_gen_qemu_##op(xth, EA, ctx->mem_idx, MO_LEQ);   \
-    } else {                                                \
-        tcg_gen_qemu_##op(xth, EA, ctx->mem_idx, MO_BEQ);   \
-        tcg_gen_addi_tl(EA, EA, 8);                         \
-        tcg_gen_qemu_##op(xtl, EA, ctx->mem_idx, MO_BEQ);   \
-    }                                                       \
-    tcg_temp_free(EA);                                      \
-    tcg_temp_free_i64(xth);                                 \
-    tcg_temp_free_i64(xtl);                                 \
-}
-
-VSX_VECTOR_STORE(stxvx, st_i64, 1)
-
 #ifdef TARGET_PPC64
 #define VSX_VECTOR_LOAD_STORE_LENGTH(name)                         \
 static void gen_##name(DisasContext *ctx)                          \
@@ -2096,8 +1990,23 @@ static bool do_lstxv_D(DisasContext *ctx, arg_D *a, bool store)
     return do_lstxv(ctx, a->ra, tcg_constant_tl(a->si), a->rt, store);
 }
 
+static bool do_lstxv_X(DisasContext *ctx, arg_X *a, bool store)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+
+    if (a->rt >= 32) {
+        REQUIRE_VSX(ctx);
+    } else {
+        REQUIRE_VECTOR(ctx);
+    }
+
+    return do_lstxv(ctx, a->ra, cpu_gpr[a->rb], a->rt, store);
+}
+
 TRANS(STXV, do_lstxv_D, true)
 TRANS(LXV, do_lstxv_D, false)
+TRANS(STXVX, do_lstxv_X, true)
+TRANS(LXVX, do_lstxv_X, false)
 
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index 1d41beef26..b94f3fa4e0 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -10,7 +10,6 @@ GEN_HANDLER_E(lxvdsx, 0x1F, 0x0C, 0x0A, 0, PPC_NONE, PPC2_VSX),
 GEN_HANDLER_E(lxvw4x, 0x1F, 0x0C, 0x18, 0, PPC_NONE, PPC2_VSX),
 GEN_HANDLER_E(lxvh8x, 0x1F, 0x0C, 0x19, 0, PPC_NONE,  PPC2_ISA300),
 GEN_HANDLER_E(lxvb16x, 0x1F, 0x0C, 0x1B, 0, PPC_NONE, PPC2_ISA300),
-GEN_HANDLER_E(lxvx, 0x1F, 0x0C, 0x08, 0x00000040, PPC_NONE, PPC2_ISA300),
 #if defined(TARGET_PPC64)
 GEN_HANDLER_E(lxvl, 0x1F, 0x0D, 0x08, 0, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER_E(lxvll, 0x1F, 0x0D, 0x09, 0, PPC_NONE, PPC2_ISA300),
@@ -25,7 +24,6 @@ GEN_HANDLER_E(stxvd2x, 0x1F, 0xC, 0x1E, 0, PPC_NONE, PPC2_VSX),
 GEN_HANDLER_E(stxvw4x, 0x1F, 0xC, 0x1C, 0, PPC_NONE, PPC2_VSX),
 GEN_HANDLER_E(stxvh8x, 0x1F, 0x0C, 0x1D, 0, PPC_NONE,  PPC2_ISA300),
 GEN_HANDLER_E(stxvb16x, 0x1F, 0x0C, 0x1F, 0, PPC_NONE, PPC2_ISA300),
-GEN_HANDLER_E(stxvx, 0x1F, 0x0C, 0x0C, 0, PPC_NONE, PPC2_ISA300),
 #if defined(TARGET_PPC64)
 GEN_HANDLER_E(stxvl, 0x1F, 0x0D, 0x0C, 0, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER_E(stxvll, 0x1F, 0x0D, 0x0D, 0, PPC_NONE, PPC2_ISA300),
-- 
2.25.1


