Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FB54C51AD
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 23:42:15 +0100 (CET)
Received: from localhost ([::1]:58558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNjHy-0008ND-Iq
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 17:42:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhvl-0006PQ-9B; Fri, 25 Feb 2022 16:15:15 -0500
Received: from [187.72.171.209] (port=1210 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhvi-0004HA-2h; Fri, 25 Feb 2022 16:15:12 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 25 Feb 2022 18:09:55 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 0FE3F8006BB;
 Fri, 25 Feb 2022 18:09:55 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 28/49] target/ppc: Move vsel and vperm/vpermr to decodetree
Date: Fri, 25 Feb 2022 18:09:15 -0300
Message-Id: <20220225210936.1749575-29-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Feb 2022 21:09:55.0451 (UTC)
 FILETIME=[09BBA4B0:01D82A8C]
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h                 |  5 +--
 target/ppc/insn32.decode            |  5 +++
 target/ppc/int_helper.c             | 13 +-----
 target/ppc/translate/vmx-impl.c.inc | 69 ++++++++++++++++++++++-------
 target/ppc/translate/vmx-ops.c.inc  |  2 -
 5 files changed, 62 insertions(+), 32 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 6bd7fad70c..fd559d72d3 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -223,9 +223,8 @@ DEF_HELPER_2(vupklsh, void, avr, avr)
 DEF_HELPER_2(vupklsw, void, avr, avr)
 DEF_HELPER_5(vmsumubm, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmsummbm, void, env, avr, avr, avr, avr)
-DEF_HELPER_5(vsel, void, env, avr, avr, avr, avr)
-DEF_HELPER_5(vperm, void, env, avr, avr, avr, avr)
-DEF_HELPER_5(vpermr, void, env, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_4(VPERM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_4(VPERMR, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_4(vpkshss, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkshus, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkswss, void, env, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index abc2007129..0a3ada2b66 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -467,6 +467,11 @@ VINSWVRX        000100 ..... ..... ..... 00110001111    @VX
 VSLDBI          000100 ..... ..... ..... 00 ... 010110  @VN
 VSRDBI          000100 ..... ..... ..... 01 ... 010110  @VN
 
+VPERM           000100 ..... ..... ..... ..... 101011   @VA
+VPERMR          000100 ..... ..... ..... ..... 111011   @VA
+
+VSEL            000100 ..... ..... ..... ..... 101010   @VA
+
 ## Vector Integer Shift Instruction
 
 VSLB            000100 ..... ..... ..... 00100000100    @VX
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index f52242ca81..6c63c7b227 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1015,8 +1015,7 @@ VMUL(UW, u32, VsrW, VsrD, uint64_t)
 #undef VMUL_DO_ODD
 #undef VMUL
 
-void helper_vperm(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b,
-                  ppc_avr_t *c)
+void helper_VPERM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
 {
     ppc_avr_t result;
     int i;
@@ -1034,8 +1033,7 @@ void helper_vperm(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b,
     *r = result;
 }
 
-void helper_vpermr(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b,
-                  ppc_avr_t *c)
+void helper_VPERMR(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
 {
     ppc_avr_t result;
     int i;
@@ -1303,13 +1301,6 @@ VRLMI(VRLWMI, 32, u32, 1);
 VRLMI(VRLDNM, 64, u64, 0);
 VRLMI(VRLWNM, 32, u32, 0);
 
-void helper_vsel(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b,
-                 ppc_avr_t *c)
-{
-    r->u64[0] = (a->u64[0] & ~c->u64[0]) | (b->u64[0] & c->u64[0]);
-    r->u64[1] = (a->u64[1] & ~c->u64[1]) | (b->u64[1] & c->u64[1]);
-}
-
 void helper_vexptefp(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *b)
 {
     int i;
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 352250fad0..f91bee839d 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2559,28 +2559,65 @@ static void gen_vmladduhm(DisasContext *ctx)
     tcg_temp_free_ptr(rd);
 }
 
-static void gen_vpermr(DisasContext *ctx)
+static bool trans_VPERM(DisasContext *ctx, arg_VA *a)
 {
-    TCGv_ptr ra, rb, rc, rd;
-    if (unlikely(!ctx->altivec_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_VPU);
-        return;
-    }
-    ra = gen_avr_ptr(rA(ctx->opcode));
-    rb = gen_avr_ptr(rB(ctx->opcode));
-    rc = gen_avr_ptr(rC(ctx->opcode));
-    rd = gen_avr_ptr(rD(ctx->opcode));
-    gen_helper_vpermr(cpu_env, rd, ra, rb, rc);
-    tcg_temp_free_ptr(ra);
-    tcg_temp_free_ptr(rb);
-    tcg_temp_free_ptr(rc);
-    tcg_temp_free_ptr(rd);
+    TCGv_ptr vrt, vra, vrb, vrc;
+
+    REQUIRE_INSNS_FLAGS(ctx, ALTIVEC);
+    REQUIRE_VECTOR(ctx);
+
+    vrt = gen_avr_ptr(a->vrt);
+    vra = gen_avr_ptr(a->vra);
+    vrb = gen_avr_ptr(a->vrb);
+    vrc = gen_avr_ptr(a->rc);
+
+    gen_helper_VPERM(vrt, vra, vrb, vrc);
+
+    tcg_temp_free_ptr(vrt);
+    tcg_temp_free_ptr(vra);
+    tcg_temp_free_ptr(vrb);
+    tcg_temp_free_ptr(vrc);
+
+    return true;
+}
+
+static bool trans_VPERMR(DisasContext *ctx, arg_VA *a)
+{
+    TCGv_ptr vrt, vra, vrb, vrc;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VECTOR(ctx);
+
+    vrt = gen_avr_ptr(a->vrt);
+    vra = gen_avr_ptr(a->vra);
+    vrb = gen_avr_ptr(a->vrb);
+    vrc = gen_avr_ptr(a->rc);
+
+    gen_helper_VPERMR(vrt, vra, vrb, vrc);
+
+    tcg_temp_free_ptr(vrt);
+    tcg_temp_free_ptr(vra);
+    tcg_temp_free_ptr(vrb);
+    tcg_temp_free_ptr(vrc);
+
+    return true;
+}
+
+static bool trans_VSEL(DisasContext *ctx, arg_VA *a)
+{
+    REQUIRE_INSNS_FLAGS(ctx, ALTIVEC);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_bitsel(MO_64, avr_full_offset(a->vrt), avr_full_offset(a->rc),
+                        avr_full_offset(a->vrb), avr_full_offset(a->vra),
+                        16, 16);
+
+    return true;
 }
 
 GEN_VAFORM_PAIRED(vmsumubm, vmsummbm, 18)
 GEN_VAFORM_PAIRED(vmsumuhm, vmsumuhs, 19)
 GEN_VAFORM_PAIRED(vmsumshm, vmsumshs, 20)
-GEN_VAFORM_PAIRED(vsel, vperm, 21)
 GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23)
 
 GEN_VXFORM_NOA(vclzb, 1, 28)
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index 3a8a9cc564..d960648d52 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -194,7 +194,6 @@ GEN_VXFORM_300_EO(vctzw, 0x01, 0x18, 0x1E),
 GEN_VXFORM_300_EO(vctzd, 0x01, 0x18, 0x1F),
 GEN_VXFORM_300_EO(vclzlsbb, 0x01, 0x18, 0x0),
 GEN_VXFORM_300_EO(vctzlsbb, 0x01, 0x18, 0x1),
-GEN_VXFORM_300(vpermr, 0x1D, 0xFF),
 
 #define GEN_VXFORM_NOA(name, opc2, opc3)                                \
     GEN_HANDLER(name, 0x04, opc2, opc3, 0x001f0000, PPC_ALTIVEC)
@@ -229,7 +228,6 @@ GEN_VAFORM_PAIRED(vmhaddshs, vmhraddshs, 16),
 GEN_VAFORM_PAIRED(vmsumubm, vmsummbm, 18),
 GEN_VAFORM_PAIRED(vmsumuhm, vmsumuhs, 19),
 GEN_VAFORM_PAIRED(vmsumshm, vmsumshs, 20),
-GEN_VAFORM_PAIRED(vsel, vperm, 21),
 GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23),
 
 GEN_VXFORM_DUAL(vclzb, vpopcntb, 1, 28, PPC_NONE, PPC2_ALTIVEC_207),
-- 
2.25.1


