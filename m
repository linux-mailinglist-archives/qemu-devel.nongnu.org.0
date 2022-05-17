Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A3F52A48E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:17:00 +0200 (CEST)
Received: from localhost ([::1]:51496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqy0R-0007cP-S0
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nqwVu-0004O0-NN; Tue, 17 May 2022 08:41:22 -0400
Received: from [187.72.171.209] (port=53711 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nqwVo-0004gP-Oq; Tue, 17 May 2022 08:41:18 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 17 May 2022 09:39:32 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id EA620800603;
 Tue, 17 May 2022 09:39:31 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 08/12] target/ppc: declare xxextractuw and xxinsertw helpers
 with call flags
Date: Tue, 17 May 2022 09:39:25 -0300
Message-Id: <20220517123929.284511-9-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
References: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2022 12:39:32.0192 (UTC)
 FILETIME=[284EE600:01D869EB]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Move xxextractuw and xxinsertw to decodetree, declare both helpers with
TCG_CALL_NO_RWG, and drop the unused env argument.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h                 |  4 +-
 target/ppc/insn32.decode            |  9 ++++-
 target/ppc/int_helper.c             |  6 +--
 target/ppc/translate/vsx-impl.c.inc | 63 +++++++++++++----------------
 target/ppc/translate/vsx-ops.c.inc  |  2 -
 5 files changed, 39 insertions(+), 45 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index aed1b24fdb..640a70cd5c 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -528,9 +528,9 @@ DEF_HELPER_FLAGS_2(XXGENPCVDM_be_exp, TCG_CALL_NO_RWG, void, vsr, avr)
 DEF_HELPER_FLAGS_2(XXGENPCVDM_be_comp, TCG_CALL_NO_RWG, void, vsr, avr)
 DEF_HELPER_FLAGS_2(XXGENPCVDM_le_exp, TCG_CALL_NO_RWG, void, vsr, avr)
 DEF_HELPER_FLAGS_2(XXGENPCVDM_le_comp, TCG_CALL_NO_RWG, void, vsr, avr)
-DEF_HELPER_4(xxextractuw, void, env, vsr, vsr, i32)
+DEF_HELPER_FLAGS_3(XXEXTRACTUW, TCG_CALL_NO_RWG, void, vsr, vsr, i32)
 DEF_HELPER_FLAGS_5(XXPERMX, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, tl)
-DEF_HELPER_4(xxinsertw, void, env, vsr, vsr, i32)
+DEF_HELPER_FLAGS_3(XXINSERTW, TCG_CALL_NO_RWG, void, vsr, vsr, i32)
 DEF_HELPER_FLAGS_2(XVXSIGSP, TCG_CALL_NO_RWG, void, vsr, vsr)
 DEF_HELPER_FLAGS_5(XXEVAL, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, i32)
 DEF_HELPER_FLAGS_5(XXBLENDVB, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 483349ff6d..435cf1320c 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -161,8 +161,10 @@
 &XX2            xt xb
 @XX2            ...... ..... ..... ..... ......... ..           &XX2 xt=%xx_xt xb=%xx_xb
 
-&XX2_uim2       xt xb uim:uint8_t
-@XX2_uim2       ...... ..... ... uim:2 ..... ......... ..       &XX2_uim2 xt=%xx_xt xb=%xx_xb
+&XX2_uim        xt xb uim:uint8_t
+@XX2_uim2       ...... ..... ... uim:2 ..... ......... ..       &XX2_uim xt=%xx_xt xb=%xx_xb
+
+@XX2_uim4       ...... ..... . uim:4 ..... ......... ..         &XX2_uim xt=%xx_xt xb=%xx_xb
 
 &XX2_bf_xb      bf xb
 @XX2_bf_xb      ...... bf:3 .. ..... ..... ......... . .        &XX2_bf_xb xb=%xx_xb
@@ -666,6 +668,9 @@ XXSPLTW         111100 ..... ---.. ..... 010100100 . .  @XX2_uim2
 
 ## VSX Permute Instructions
 
+XXEXTRACTUW     111100 ..... - .... ..... 010100101 ..  @XX2_uim4
+XXINSERTW       111100 ..... - .... ..... 010110101 ..  @XX2_uim4
+
 XXPERM          111100 ..... ..... ..... 00011010 ...   @XX3
 XXPERMR         111100 ..... ..... ..... 00111010 ...   @XX3
 XXPERMDI        111100 ..... ..... ..... 0 .. 01010 ... @XX3_dm
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 8c1674510b..9a361ad241 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1647,8 +1647,7 @@ VSTRI(VSTRIHL, H, 8, true)
 VSTRI(VSTRIHR, H, 8, false)
 #undef VSTRI
 
-void helper_xxextractuw(CPUPPCState *env, ppc_vsr_t *xt,
-                        ppc_vsr_t *xb, uint32_t index)
+void helper_XXEXTRACTUW(ppc_vsr_t *xt, ppc_vsr_t *xb, uint32_t index)
 {
     ppc_vsr_t t = { };
     size_t es = sizeof(uint32_t);
@@ -1663,8 +1662,7 @@ void helper_xxextractuw(CPUPPCState *env, ppc_vsr_t *xt,
     *xt = t;
 }
 
-void helper_xxinsertw(CPUPPCState *env, ppc_vsr_t *xt,
-                      ppc_vsr_t *xb, uint32_t index)
+void helper_XXINSERTW(ppc_vsr_t *xt, ppc_vsr_t *xb, uint32_t index)
 {
     ppc_vsr_t t = *xt;
     size_t es = sizeof(uint32_t);
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index ca11e2c4b8..900c1a1ab2 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1585,7 +1585,7 @@ static bool trans_XXSEL(DisasContext *ctx, arg_XX4 *a)
     return true;
 }
 
-static bool trans_XXSPLTW(DisasContext *ctx, arg_XX2_uim2 *a)
+static bool trans_XXSPLTW(DisasContext *ctx, arg_XX2_uim *a)
 {
     int tofs, bofs;
 
@@ -1795,42 +1795,35 @@ static void gen_xxsldwi(DisasContext *ctx)
     tcg_temp_free_i64(xtl);
 }
 
-#define VSX_EXTRACT_INSERT(name)                                \
-static void gen_##name(DisasContext *ctx)                       \
-{                                                               \
-    TCGv_ptr xt, xb;                                            \
-    TCGv_i32 t0;                                                \
-    TCGv_i64 t1;                                                \
-    uint8_t uimm = UIMM4(ctx->opcode);                          \
-                                                                \
-    if (unlikely(!ctx->vsx_enabled)) {                          \
-        gen_exception(ctx, POWERPC_EXCP_VSXU);                  \
-        return;                                                 \
-    }                                                           \
-    xt = gen_vsr_ptr(xT(ctx->opcode));                          \
-    xb = gen_vsr_ptr(xB(ctx->opcode));                          \
-    t0 = tcg_temp_new_i32();                                    \
-    t1 = tcg_temp_new_i64();                                    \
-    /*                                                          \
-     * uimm > 15 out of bound and for                           \
-     * uimm > 12 handle as per hardware in helper               \
-     */                                                         \
-    if (uimm > 15) {                                            \
-        tcg_gen_movi_i64(t1, 0);                                \
-        set_cpu_vsr(xT(ctx->opcode), t1, true);                 \
-        set_cpu_vsr(xT(ctx->opcode), t1, false);                \
-        return;                                                 \
-    }                                                           \
-    tcg_gen_movi_i32(t0, uimm);                                 \
-    gen_helper_##name(cpu_env, xt, xb, t0);                     \
-    tcg_temp_free_ptr(xb);                                      \
-    tcg_temp_free_ptr(xt);                                      \
-    tcg_temp_free_i32(t0);                                      \
-    tcg_temp_free_i64(t1);                                      \
+static bool do_vsx_extract_insert(DisasContext *ctx, arg_XX2_uim *a,
+    void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_i32))
+{
+    TCGv_i64 zero = tcg_constant_i64(0);
+    TCGv_ptr xt, xb;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VSX(ctx);
+
+    /*
+     * uim > 15 out of bound and for
+     * uim > 12 handle as per hardware in helper
+     */
+    if (a->uim > 15) {
+        set_cpu_vsr(a->xt, zero, true);
+        set_cpu_vsr(a->xt, zero, false);
+    } else {
+        xt = gen_vsr_ptr(a->xt);
+        xb = gen_vsr_ptr(a->xb);
+        gen_helper(xt, xb, tcg_constant_i32(a->uim));
+        tcg_temp_free_ptr(xb);
+        tcg_temp_free_ptr(xt);
+    }
+
+    return true;
 }
 
-VSX_EXTRACT_INSERT(xxextractuw)
-VSX_EXTRACT_INSERT(xxinsertw)
+TRANS(XXEXTRACTUW, do_vsx_extract_insert, gen_helper_XXEXTRACTUW)
+TRANS(XXINSERTW, do_vsx_extract_insert, gen_helper_XXINSERTW)
 
 #ifdef TARGET_PPC64
 static void gen_xsxexpdp(DisasContext *ctx)
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index 4524c5b02a..bff14bbece 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -320,5 +320,3 @@ VSX_LOGICAL(xxlorc, 0x8, 0x15, PPC2_VSX207),
 GEN_XX3FORM(xxmrghw, 0x08, 0x02, PPC2_VSX),
 GEN_XX3FORM(xxmrglw, 0x08, 0x06, PPC2_VSX),
 GEN_XX3FORM_DM(xxsldwi, 0x08, 0x00),
-GEN_XX2FORM_EXT(xxextractuw, 0x0A, 0x0A, PPC2_ISA300),
-GEN_XX2FORM_EXT(xxinsertw, 0x0A, 0x0B, PPC2_ISA300),
-- 
2.25.1


