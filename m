Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2F249C1B6
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 04:07:22 +0100 (CET)
Received: from localhost ([::1]:51844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCYeX-0006dR-9w
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 22:07:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCYWM-00071W-F8; Tue, 25 Jan 2022 21:58:54 -0500
Received: from [187.72.171.209] (port=56550 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCYWK-0004u9-CX; Tue, 25 Jan 2022 21:58:54 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:34 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 4F61E80001E;
 Tue, 25 Jan 2022 09:20:34 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 02/38] target/ppc: moved vector even and odd multiplication
 to decodetree
Date: Tue, 25 Jan 2022 09:19:07 -0300
Message-Id: <20220125121943.3269077-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:34.0724 (UTC)
 FILETIME=[F40F0E40:01D811E5]
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>

Moved the instructions vmulesb, vmulosb, vmuleub, vmuloub,
vmulesh, vmulosh, vmuleuh, vmulouh, vmulesw, vmulosw,
muleuw and vmulouw from legacy to decodetree. Implemented
the instructions vmulesd, vmulosd, vmuleud, vmuloud.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h                 | 28 +++++++++-------
 target/ppc/insn32.decode            | 22 ++++++++++++
 target/ppc/int_helper.c             | 36 ++++++++++++++------
 target/ppc/translate/vmx-impl.c.inc | 52 +++++++++++++++++++----------
 target/ppc/translate/vmx-ops.c.inc  | 15 ++-------
 tcg/ppc/tcg-target.c.inc            |  6 ++++
 6 files changed, 107 insertions(+), 52 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index d318837ea5..6f2c3b32e7 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -191,18 +191,22 @@ DEF_HELPER_3(vmrglw, void, avr, avr, avr)
 DEF_HELPER_3(vmrghb, void, avr, avr, avr)
 DEF_HELPER_3(vmrghh, void, avr, avr, avr)
 DEF_HELPER_3(vmrghw, void, avr, avr, avr)
-DEF_HELPER_3(vmulesb, void, avr, avr, avr)
-DEF_HELPER_3(vmulesh, void, avr, avr, avr)
-DEF_HELPER_3(vmulesw, void, avr, avr, avr)
-DEF_HELPER_3(vmuleub, void, avr, avr, avr)
-DEF_HELPER_3(vmuleuh, void, avr, avr, avr)
-DEF_HELPER_3(vmuleuw, void, avr, avr, avr)
-DEF_HELPER_3(vmulosb, void, avr, avr, avr)
-DEF_HELPER_3(vmulosh, void, avr, avr, avr)
-DEF_HELPER_3(vmulosw, void, avr, avr, avr)
-DEF_HELPER_3(vmuloub, void, avr, avr, avr)
-DEF_HELPER_3(vmulouh, void, avr, avr, avr)
-DEF_HELPER_3(vmulouw, void, avr, avr, avr)
+DEF_HELPER_3(VMULESB, void, avr, avr, avr)
+DEF_HELPER_3(VMULESH, void, avr, avr, avr)
+DEF_HELPER_3(VMULESW, void, avr, avr, avr)
+DEF_HELPER_3(VMULESD, void, avr, avr, avr)
+DEF_HELPER_3(VMULEUB, void, avr, avr, avr)
+DEF_HELPER_3(VMULEUH, void, avr, avr, avr)
+DEF_HELPER_3(VMULEUW, void, avr, avr, avr)
+DEF_HELPER_3(VMULEUD, void, avr, avr, avr)
+DEF_HELPER_3(VMULOSB, void, avr, avr, avr)
+DEF_HELPER_3(VMULOSH, void, avr, avr, avr)
+DEF_HELPER_3(VMULOSW, void, avr, avr, avr)
+DEF_HELPER_3(VMULOSD, void, avr, avr, avr)
+DEF_HELPER_3(VMULOUB, void, avr, avr, avr)
+DEF_HELPER_3(VMULOUH, void, avr, avr, avr)
+DEF_HELPER_3(VMULOUW, void, avr, avr, avr)
+DEF_HELPER_3(VMULOUD, void, avr, avr, avr)
 DEF_HELPER_3(vmulhsw, void, avr, avr, avr)
 DEF_HELPER_3(vmulhuw, void, avr, avr, avr)
 DEF_HELPER_3(vmulhsd, void, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 2a9c91a423..cab372fa44 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -475,3 +475,25 @@ XSCVQPDP        111111 ..... 10100 ..... 1101000100 .   @X_tb_rc
 &XL_s           s:uint8_t
 @XL_s           ......-------------- s:1 .......... -   &XL_s
 RFEBB           010011-------------- .   0010010010 -   @XL_s
+
+## Vector Multiply Instruction
+
+VMULESB         000100 ..... ..... ..... 01100001000    @VX
+VMULOSB         000100 ..... ..... ..... 00100001000    @VX
+VMULEUB         000100 ..... ..... ..... 01000001000    @VX
+VMULOUB         000100 ..... ..... ..... 00000001000    @VX
+
+VMULESH         000100 ..... ..... ..... 01101001000    @VX
+VMULOSH         000100 ..... ..... ..... 00101001000    @VX
+VMULEUH         000100 ..... ..... ..... 01001001000    @VX
+VMULOUH         000100 ..... ..... ..... 00001001000    @VX
+
+VMULESW         000100 ..... ..... ..... 01110001000    @VX
+VMULOSW         000100 ..... ..... ..... 00110001000    @VX
+VMULEUW         000100 ..... ..... ..... 01010001000    @VX
+VMULOUW         000100 ..... ..... ..... 00010001000    @VX
+
+VMULESD         000100 ..... ..... ..... 01111001000    @VX
+VMULOSD         000100 ..... ..... ..... 00111001000    @VX
+VMULEUD         000100 ..... ..... ..... 01011001000    @VX
+VMULOUD         000100 ..... ..... ..... 00011001000    @VX
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 9bc327bcba..56b9e9369b 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1150,7 +1150,7 @@ void helper_vmsumuhs(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
 }
 
 #define VMUL_DO_EVN(name, mul_element, mul_access, prod_access, cast)   \
-    void helper_v##name(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)       \
+    void helper_V##name(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)       \
     {                                                                   \
         int i;                                                          \
                                                                         \
@@ -1161,7 +1161,7 @@ void helper_vmsumuhs(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
     }
 
 #define VMUL_DO_ODD(name, mul_element, mul_access, prod_access, cast)   \
-    void helper_v##name(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)       \
+    void helper_V##name(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)       \
     {                                                                   \
         int i;                                                          \
                                                                         \
@@ -1172,17 +1172,33 @@ void helper_vmsumuhs(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
     }
 
 #define VMUL(suffix, mul_element, mul_access, prod_access, cast)       \
-    VMUL_DO_EVN(mule##suffix, mul_element, mul_access, prod_access, cast)  \
-    VMUL_DO_ODD(mulo##suffix, mul_element, mul_access, prod_access, cast)
-VMUL(sb, s8, VsrSB, VsrSH, int16_t)
-VMUL(sh, s16, VsrSH, VsrSW, int32_t)
-VMUL(sw, s32, VsrSW, VsrSD, int64_t)
-VMUL(ub, u8, VsrB, VsrH, uint16_t)
-VMUL(uh, u16, VsrH, VsrW, uint32_t)
-VMUL(uw, u32, VsrW, VsrD, uint64_t)
+    VMUL_DO_EVN(MULE##suffix, mul_element, mul_access, prod_access, cast)  \
+    VMUL_DO_ODD(MULO##suffix, mul_element, mul_access, prod_access, cast)
+VMUL(SB, s8, VsrSB, VsrSH, int16_t)
+VMUL(SH, s16, VsrSH, VsrSW, int32_t)
+VMUL(SW, s32, VsrSW, VsrSD, int64_t)
+VMUL(UB, u8, VsrB, VsrH, uint16_t)
+VMUL(UH, u16, VsrH, VsrW, uint32_t)
+VMUL(UW, u32, VsrW, VsrD, uint64_t)
 #undef VMUL_DO_EVN
 #undef VMUL_DO_ODD
 #undef VMUL
+void helper_VMULESD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+{
+    muls64(&r->VsrD(1), &r->VsrD(0), a->VsrSD(0), b->VsrSD(0));
+}
+void helper_VMULOSD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+{
+    muls64(&r->VsrD(1), &r->VsrD(0), a->VsrSD(1), b->VsrSD(1));
+}
+void helper_VMULEUD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+{
+    mulu64(&r->VsrD(1), &r->VsrD(0), a->VsrD(0), b->VsrD(0));
+}
+void helper_VMULOUD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+{
+    mulu64(&r->VsrD(1), &r->VsrD(0), a->VsrD(1), b->VsrD(1));
+}
 
 void helper_vmulhsw(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index d5e02fd7f2..430579addd 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -798,29 +798,11 @@ static void trans_vclzd(DisasContext *ctx)
     tcg_temp_free_i64(avr);
 }
 
-GEN_VXFORM(vmuloub, 4, 0);
-GEN_VXFORM(vmulouh, 4, 1);
-GEN_VXFORM(vmulouw, 4, 2);
 GEN_VXFORM_V(vmuluwm, MO_32, tcg_gen_gvec_mul, 4, 2);
-GEN_VXFORM_DUAL(vmulouw, PPC_ALTIVEC, PPC_NONE,
-                vmuluwm, PPC_NONE, PPC2_ALTIVEC_207)
-GEN_VXFORM(vmulosb, 4, 4);
-GEN_VXFORM(vmulosh, 4, 5);
-GEN_VXFORM(vmulosw, 4, 6);
 GEN_VXFORM_V(vmulld, MO_64, tcg_gen_gvec_mul, 4, 7);
-GEN_VXFORM(vmuleub, 4, 8);
-GEN_VXFORM(vmuleuh, 4, 9);
-GEN_VXFORM(vmuleuw, 4, 10);
 GEN_VXFORM(vmulhuw, 4, 10);
 GEN_VXFORM(vmulhud, 4, 11);
-GEN_VXFORM_DUAL(vmuleuw, PPC_ALTIVEC, PPC_NONE,
-                vmulhuw, PPC_NONE, PPC2_ISA310);
-GEN_VXFORM(vmulesb, 4, 12);
-GEN_VXFORM(vmulesh, 4, 13);
-GEN_VXFORM(vmulesw, 4, 14);
 GEN_VXFORM(vmulhsw, 4, 14);
-GEN_VXFORM_DUAL(vmulesw, PPC_ALTIVEC, PPC_NONE,
-                vmulhsw, PPC_NONE, PPC2_ISA310);
 GEN_VXFORM(vmulhsd, 4, 15);
 GEN_VXFORM_V(vslb, MO_8, tcg_gen_gvec_shlv, 2, 4);
 GEN_VXFORM_V(vslh, MO_16, tcg_gen_gvec_shlv, 2, 5);
@@ -2104,6 +2086,40 @@ static bool trans_VPEXTD(DisasContext *ctx, arg_VX *a)
     return true;
 }
 
+static bool do_vx_helper(DisasContext *ctx, arg_VX *a,
+                         void (*gen_helper) (TCGv_ptr, TCGv_ptr, TCGv_ptr))
+{
+    TCGv_ptr ra, rb, rd;
+    REQUIRE_VECTOR(ctx);
+
+    ra = gen_avr_ptr(a->vra);
+    rb = gen_avr_ptr(a->vrb);
+    rd = gen_avr_ptr(a->vrt);
+    gen_helper(rd, ra, rb);
+    tcg_temp_free_ptr(ra);
+    tcg_temp_free_ptr(rb);
+    tcg_temp_free_ptr(rd);
+
+    return true;
+}
+
+TRANS_FLAGS2(ALTIVEC_207, VMULESB, do_vx_helper, gen_helper_VMULESB)
+TRANS_FLAGS2(ALTIVEC_207, VMULOSB, do_vx_helper, gen_helper_VMULOSB)
+TRANS_FLAGS2(ALTIVEC_207, VMULEUB, do_vx_helper, gen_helper_VMULEUB)
+TRANS_FLAGS2(ALTIVEC_207, VMULOUB, do_vx_helper, gen_helper_VMULOUB)
+TRANS_FLAGS2(ALTIVEC_207, VMULESH, do_vx_helper, gen_helper_VMULESH)
+TRANS_FLAGS2(ALTIVEC_207, VMULOSH, do_vx_helper, gen_helper_VMULOSH)
+TRANS_FLAGS2(ALTIVEC_207, VMULEUH, do_vx_helper, gen_helper_VMULEUH)
+TRANS_FLAGS2(ALTIVEC_207, VMULOUH, do_vx_helper, gen_helper_VMULOUH)
+TRANS_FLAGS2(ALTIVEC_207, VMULESW, do_vx_helper, gen_helper_VMULESW)
+TRANS_FLAGS2(ALTIVEC_207, VMULOSW, do_vx_helper, gen_helper_VMULOSW)
+TRANS_FLAGS2(ALTIVEC_207, VMULEUW, do_vx_helper, gen_helper_VMULEUW)
+TRANS_FLAGS2(ALTIVEC_207, VMULOUW, do_vx_helper, gen_helper_VMULOUW)
+TRANS_FLAGS2(ISA310, VMULESD, do_vx_helper, gen_helper_VMULESD)
+TRANS_FLAGS2(ISA310, VMULOSD, do_vx_helper, gen_helper_VMULOSD)
+TRANS_FLAGS2(ISA310, VMULEUD, do_vx_helper, gen_helper_VMULEUD)
+TRANS_FLAGS2(ISA310, VMULOUD, do_vx_helper, gen_helper_VMULOUD)
+
 #undef GEN_VR_LDX
 #undef GEN_VR_STX
 #undef GEN_VR_LVE
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index 25ee715b43..f310b2fbde 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -101,20 +101,11 @@ GEN_VXFORM_DUAL(vmrgow, vextuwlx, 6, 26, PPC_NONE, PPC2_ALTIVEC_207),
 GEN_VXFORM_300(vextubrx, 6, 28),
 GEN_VXFORM_300(vextuhrx, 6, 29),
 GEN_VXFORM_DUAL(vmrgew, vextuwrx, 6, 30, PPC_NONE, PPC2_ALTIVEC_207),
-GEN_VXFORM(vmuloub, 4, 0),
-GEN_VXFORM(vmulouh, 4, 1),
-GEN_VXFORM_DUAL(vmulouw, vmuluwm, 4, 2, PPC_ALTIVEC, PPC_NONE),
-GEN_VXFORM(vmulosb, 4, 4),
-GEN_VXFORM(vmulosh, 4, 5),
-GEN_VXFORM_207(vmulosw, 4, 6),
+GEN_VXFORM_207(vmuluwm, 4, 2),
 GEN_VXFORM_310(vmulld, 4, 7),
-GEN_VXFORM(vmuleub, 4, 8),
-GEN_VXFORM(vmuleuh, 4, 9),
-GEN_VXFORM_DUAL(vmuleuw, vmulhuw, 4, 10, PPC_ALTIVEC, PPC_NONE),
+GEN_VXFORM_310(vmulhuw, 4, 10),
 GEN_VXFORM_310(vmulhud, 4, 11),
-GEN_VXFORM(vmulesb, 4, 12),
-GEN_VXFORM(vmulesh, 4, 13),
-GEN_VXFORM_DUAL(vmulesw, vmulhsw, 4, 14, PPC_ALTIVEC, PPC_NONE),
+GEN_VXFORM_310(vmulhsw, 4, 14),
 GEN_VXFORM_310(vmulhsd, 4, 15),
 GEN_VXFORM(vslb, 2, 4),
 GEN_VXFORM(vslh, 2, 5),
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 9e79a7edee..b15f0fef0e 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -3905,3 +3905,9 @@ void tcg_register_jit(const void *buf, size_t buf_size)
     tcg_register_jit_int(buf, buf_size, &debug_frame, sizeof(debug_frame));
 }
 #endif /* __ELF__ */
+#undef VMULEUB
+#undef VMULEUH
+#undef VMULEUW
+#undef VMULOUB
+#undef VMULOUH
+#undef VMULOUW
-- 
2.25.1


