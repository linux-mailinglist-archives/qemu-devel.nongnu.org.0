Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3233944A712
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:55:56 +0100 (CET)
Received: from localhost ([::1]:51792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkL2x-0004VL-9v
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:55:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4j-0005kG-LP; Tue, 09 Nov 2021 00:53:41 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:50365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4h-0006uY-Mv; Tue, 09 Nov 2021 00:53:41 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp5Fc1z4xfK; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=Bww5jaUJ80/pIaF1IK4TOzwYwUCxLJoQFWqSUBZYoBk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bduNKVYiw4WY93ZN4G5capc589WSelj00kZcencOcsjZF5M1/je+A5eJVwEVquxtU
 PYHZYQIZLqMBGTz4EjHBZt0zrFd9rJTg3BZ99HdSAf4u96QLUyOmFqRyuOU5AMR69m
 sjJEpKsuEy+jaeVzHstGAJD0oXf7QfUWbeP2mhXY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 40/54] target/ppc: moved stxvx and lxvx from legacy to decodtree
Date: Tue,  9 Nov 2021 16:51:50 +1100
Message-Id: <20211109055204.230765-41-david@gibson.dropbear.id.au>
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>

Moved stxvx and lxvx implementation from the legacy system to
decodetree.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.castro@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211104123719.323713-14-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.33.1


