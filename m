Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9158C49B586
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 15:00:40 +0100 (CET)
Received: from localhost ([::1]:49926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCMNC-0000JL-L2
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 09:00:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLAW-0001Vz-Ai; Tue, 25 Jan 2022 07:43:32 -0500
Received: from [187.72.171.209] (port=34172 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLAR-0007RC-B0; Tue, 25 Jan 2022 07:43:24 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:40 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 8744B80001E;
 Tue, 25 Jan 2022 09:20:40 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 19/38] target/ppc: Move vsel and vperm/vpermr to decodetree
Date: Tue, 25 Jan 2022 09:19:24 -0300
Message-Id: <20220125121943.3269077-20-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:40.0887 (UTC)
 FILETIME=[F7BB7470:01D811E5]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h                 |  5 +--
 target/ppc/insn32.decode            |  5 +++
 target/ppc/int_helper.c             | 13 +-----
 target/ppc/translate/vmx-impl.c.inc | 69 ++++++++++++++++++++++-------
 target/ppc/translate/vmx-ops.c.inc  |  2 -
 5 files changed, 62 insertions(+), 32 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 2858073772..a3b64cbf7d 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -232,9 +232,8 @@ DEF_HELPER_2(vupklsh, void, avr, avr)
 DEF_HELPER_2(vupklsw, void, avr, avr)
 DEF_HELPER_5(vmsumubm, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmsummbm, void, env, avr, avr, avr, avr)
-DEF_HELPER_5(vsel, void, env, avr, avr, avr, avr)
-DEF_HELPER_5(vperm, void, env, avr, avr, avr, avr)
-DEF_HELPER_5(vpermr, void, env, avr, avr, avr, avr)
+DEF_HELPER_4(VPERM, void, avr, avr, avr, avr)
+DEF_HELPER_4(VPERMR, void, avr, avr, avr, avr)
 DEF_HELPER_4(vpkshss, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkshus, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkswss, void, env, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 7b629e81af..2ebb441550 100644
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
 ## Vector Integer Arithmetic Instructions
 
 VEXTSB2W        000100 ..... 10000 ..... 11000000010    @VX_tb
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index e98dedcdf5..3c604a5c09 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1153,8 +1153,7 @@ void helper_VMULHUD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, uint32_t desc)
     mulu64(&discard, &r->u64[1], a->u64[1], b->u64[1]);
 }
 
-void helper_vperm(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b,
-                  ppc_avr_t *c)
+void helper_VPERM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
 {
     ppc_avr_t result;
     int i;
@@ -1172,8 +1171,7 @@ void helper_vperm(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b,
     *r = result;
 }
 
-void helper_vpermr(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b,
-                  ppc_avr_t *c)
+void helper_VPERMR(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
 {
     ppc_avr_t result;
     int i;
@@ -1441,13 +1439,6 @@ VRLMI(vrlwmi, 32, u32, 1);
 VRLMI(vrldnm, 64, u64, 0);
 VRLMI(vrlwnm, 32, u32, 0);
 
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
index 43eb7ab70c..fbb85f7564 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2156,28 +2156,65 @@ static void gen_vmladduhm(DisasContext *ctx)
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
index cb4c5bb953..2895e8a114 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -210,7 +210,6 @@ GEN_VXFORM_300_EO(vctzw, 0x01, 0x18, 0x1E),
 GEN_VXFORM_300_EO(vctzd, 0x01, 0x18, 0x1F),
 GEN_VXFORM_300_EO(vclzlsbb, 0x01, 0x18, 0x0),
 GEN_VXFORM_300_EO(vctzlsbb, 0x01, 0x18, 0x1),
-GEN_VXFORM_300(vpermr, 0x1D, 0xFF),
 
 #define GEN_VXFORM_NOA(name, opc2, opc3)                                \
     GEN_HANDLER(name, 0x04, opc2, opc3, 0x001f0000, PPC_ALTIVEC)
@@ -245,7 +244,6 @@ GEN_VAFORM_PAIRED(vmhaddshs, vmhraddshs, 16),
 GEN_VAFORM_PAIRED(vmsumubm, vmsummbm, 18),
 GEN_VAFORM_PAIRED(vmsumuhm, vmsumuhs, 19),
 GEN_VAFORM_PAIRED(vmsumshm, vmsumshs, 20),
-GEN_VAFORM_PAIRED(vsel, vperm, 21),
 GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23),
 
 GEN_VXFORM_DUAL(vclzb, vpopcntb, 1, 28, PPC_NONE, PPC2_ALTIVEC_207),
-- 
2.25.1


