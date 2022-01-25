Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EA549B535
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 14:39:44 +0100 (CET)
Received: from localhost ([::1]:56618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCM2w-0001GW-JC
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 08:39:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLAD-0001Cl-Rv; Tue, 25 Jan 2022 07:43:10 -0500
Received: from [187.72.171.209] (port=41125 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLA8-0007RA-5t; Tue, 25 Jan 2022 07:43:08 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:37 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 0E4FD80001E;
 Tue, 25 Jan 2022 09:20:37 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 09/38] target/ppc: Move Vector Compare Equal/Not
 Equal/Greater Than to decodetree
Date: Tue, 25 Jan 2022 09:19:14 -0300
Message-Id: <20220125121943.3269077-10-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:37.0413 (UTC)
 FILETIME=[F5A95D50:01D811E5]
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
 target/ppc/helper.h                 | 30 ----------
 target/ppc/insn32.decode            | 24 ++++++++
 target/ppc/int_helper.c             | 54 -----------------
 target/ppc/translate/vmx-impl.c.inc | 91 ++++++++++++++++++++---------
 target/ppc/translate/vmx-ops.c.inc  | 15 +----
 5 files changed, 90 insertions(+), 124 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 97c4c827d3..8966419f90 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -141,46 +141,16 @@ DEF_HELPER_3(vabsduw, void, avr, avr, avr)
 DEF_HELPER_3(vavgsb, void, avr, avr, avr)
 DEF_HELPER_3(vavgsh, void, avr, avr, avr)
 DEF_HELPER_3(vavgsw, void, avr, avr, avr)
-DEF_HELPER_4(vcmpequb, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpequh, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpequw, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpequd, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpneb, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpneh, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpnew, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpnezb, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpnezh, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpnezw, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtub, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtuh, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtuw, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtud, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtsb, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtsh, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtsw, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtsd, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpeqfp, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgefp, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgtfp, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpbfp, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpequb_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpequh_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpequw_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpequd_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpneb_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpneh_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpnew_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpnezb_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpnezh_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpnezw_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtub_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtuh_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtuw_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtud_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtsb_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtsh_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtsw_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpgtsd_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpeqfp_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgefp_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgtfp_dot, void, env, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 1c935eeac8..bfb36e6969 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -51,6 +51,9 @@
 &VA             vrt vra vrb rc
 @VA             ...... vrt:5 vra:5 vrb:5 rc:5 ......    &VA
 
+&VC             vrt vra vrb rc:bool
+@VC             ...... vrt:5 vra:5 vrb:5 rc:1 ..........        &VC
+
 &VN             vrt vra vrb sh
 @VN             ...... vrt:5 vra:5 vrb:5 .. sh:3 ......         &VN
 
@@ -373,6 +376,27 @@ DSCLIQ          111111 ..... ..... ...... 001000010 .   @Z22_tap_sh_rc
 DSCRI           111011 ..... ..... ...... 001100010 .   @Z22_ta_sh_rc
 DSCRIQ          111111 ..... ..... ...... 001100010 .   @Z22_tap_sh_rc
 
+## Vector Integer Instructions
+
+VCMPEQUB        000100 ..... ..... ..... . 0000000110   @VC
+VCMPEQUH        000100 ..... ..... ..... . 0001000110   @VC
+VCMPEQUW        000100 ..... ..... ..... . 0010000110   @VC
+VCMPEQUD        000100 ..... ..... ..... . 0011000111   @VC
+
+VCMPGTSB        000100 ..... ..... ..... . 1100000110   @VC
+VCMPGTSH        000100 ..... ..... ..... . 1101000110   @VC
+VCMPGTSW        000100 ..... ..... ..... . 1110000110   @VC
+VCMPGTSD        000100 ..... ..... ..... . 1111000111   @VC
+
+VCMPGTUB        000100 ..... ..... ..... . 1000000110   @VC
+VCMPGTUH        000100 ..... ..... ..... . 1001000110   @VC
+VCMPGTUW        000100 ..... ..... ..... . 1010000110   @VC
+VCMPGTUD        000100 ..... ..... ..... . 1011000111   @VC
+
+VCMPNEB         000100 ..... ..... ..... . 0000000111   @VC
+VCMPNEH         000100 ..... ..... ..... . 0001000111   @VC
+VCMPNEW         000100 ..... ..... ..... . 0010000111   @VC
+
 ## Vector Bit Manipulation Instruction
 
 VCFUGED         000100 ..... ..... ..... 10101001101    @VX
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 630fbc579a..83e718ab0e 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -749,57 +749,6 @@ VCF(ux, uint32_to_float32, u32)
 VCF(sx, int32_to_float32, s32)
 #undef VCF
 
-#define VCMP_DO(suffix, compare, element, record)                       \
-    void helper_vcmp##suffix(CPUPPCState *env, ppc_avr_t *r,            \
-                             ppc_avr_t *a, ppc_avr_t *b)                \
-    {                                                                   \
-        uint64_t ones = (uint64_t)-1;                                   \
-        uint64_t all = ones;                                            \
-        uint64_t none = 0;                                              \
-        int i;                                                          \
-                                                                        \
-        for (i = 0; i < ARRAY_SIZE(r->element); i++) {                  \
-            uint64_t result = (a->element[i] compare b->element[i] ?    \
-                               ones : 0x0);                             \
-            switch (sizeof(a->element[0])) {                            \
-            case 8:                                                     \
-                r->u64[i] = result;                                     \
-                break;                                                  \
-            case 4:                                                     \
-                r->u32[i] = result;                                     \
-                break;                                                  \
-            case 2:                                                     \
-                r->u16[i] = result;                                     \
-                break;                                                  \
-            case 1:                                                     \
-                r->u8[i] = result;                                      \
-                break;                                                  \
-            }                                                           \
-            all &= result;                                              \
-            none |= result;                                             \
-        }                                                               \
-        if (record) {                                                   \
-            env->crf[6] = ((all != 0) << 3) | ((none == 0) << 1);       \
-        }                                                               \
-    }
-#define VCMP(suffix, compare, element)          \
-    VCMP_DO(suffix, compare, element, 0)        \
-    VCMP_DO(suffix##_dot, compare, element, 1)
-VCMP(equb, ==, u8)
-VCMP(equh, ==, u16)
-VCMP(equw, ==, u32)
-VCMP(equd, ==, u64)
-VCMP(gtub, >, u8)
-VCMP(gtuh, >, u16)
-VCMP(gtuw, >, u32)
-VCMP(gtud, >, u64)
-VCMP(gtsb, >, s8)
-VCMP(gtsh, >, s16)
-VCMP(gtsw, >, s32)
-VCMP(gtsd, >, s64)
-#undef VCMP_DO
-#undef VCMP
-
 #define VCMPNE_DO(suffix, element, etype, cmpzero, record)              \
 void helper_vcmpne##suffix(CPUPPCState *env, ppc_avr_t *r,              \
                             ppc_avr_t *a, ppc_avr_t *b)                 \
@@ -838,9 +787,6 @@ void helper_vcmpne##suffix(CPUPPCState *env, ppc_avr_t *r,              \
 VCMPNE(zb, u8, uint8_t, 1)
 VCMPNE(zh, u16, uint16_t, 1)
 VCMPNE(zw, u32, uint32_t, 1)
-VCMPNE(b, u8, uint8_t, 0)
-VCMPNE(h, u16, uint16_t, 0)
-VCMPNE(w, u32, uint32_t, 0)
 #undef VCMPNE_DO
 #undef VCMPNE
 
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 99606a8718..a32ad92195 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -985,41 +985,76 @@ static void glue(gen_, name0##_##name1)(DisasContext *ctx)             \
     }                                                                  \
 }
 
-GEN_VXRFORM(vcmpequb, 3, 0)
-GEN_VXRFORM(vcmpequh, 3, 1)
-GEN_VXRFORM(vcmpequw, 3, 2)
-GEN_VXRFORM(vcmpequd, 3, 3)
 GEN_VXRFORM(vcmpnezb, 3, 4)
 GEN_VXRFORM(vcmpnezh, 3, 5)
 GEN_VXRFORM(vcmpnezw, 3, 6)
-GEN_VXRFORM(vcmpgtsb, 3, 12)
-GEN_VXRFORM(vcmpgtsh, 3, 13)
-GEN_VXRFORM(vcmpgtsw, 3, 14)
-GEN_VXRFORM(vcmpgtsd, 3, 15)
-GEN_VXRFORM(vcmpgtub, 3, 8)
-GEN_VXRFORM(vcmpgtuh, 3, 9)
-GEN_VXRFORM(vcmpgtuw, 3, 10)
-GEN_VXRFORM(vcmpgtud, 3, 11)
+
+static void do_vcmp_rc(int vrt)
+{
+    TCGv_i64 t0, t1;
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+
+    get_avr64(t0, vrt, true);
+    tcg_gen_ctpop_i64(t1, t0);
+    get_avr64(t0, vrt, false);
+    tcg_gen_ctpop_i64(t0, t0);
+    tcg_gen_add_i64(t1, t0, t1);
+
+    tcg_gen_setcondi_i64(TCG_COND_EQ, t0, t1, 0);
+    tcg_gen_shli_i64(t0, t0, 1);
+
+    tcg_gen_setcondi_i64(TCG_COND_EQ, t1, t1, 128);
+    tcg_gen_shli_i64(t1, t1, 3);
+
+    tcg_gen_or_i64(t0, t0, t1);
+    tcg_gen_extrl_i64_i32(cpu_crf[6], t0);
+
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+}
+
+static bool do_vcmp(DisasContext *ctx, arg_VC *a, TCGCond cond, int vece)
+{
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_cmp(cond, vece, avr_full_offset(a->vrt),
+                     avr_full_offset(a->vra), avr_full_offset(a->vrb), 16, 16);
+    tcg_gen_gvec_shli(vece, avr_full_offset(a->vrt), avr_full_offset(a->vrt),
+                      (8 << vece) - 1, 16, 16);
+    tcg_gen_gvec_sari(vece, avr_full_offset(a->vrt), avr_full_offset(a->vrt),
+                      (8 << vece) - 1, 16, 16);
+
+    if (a->rc) {
+        do_vcmp_rc(a->vrt);
+    }
+
+    return true;
+}
+
+TRANS_FLAGS(ALTIVEC, VCMPEQUB, do_vcmp, TCG_COND_EQ, MO_8)
+TRANS_FLAGS(ALTIVEC, VCMPEQUH, do_vcmp, TCG_COND_EQ, MO_16)
+TRANS_FLAGS(ALTIVEC, VCMPEQUW, do_vcmp, TCG_COND_EQ, MO_32)
+TRANS_FLAGS2(ALTIVEC_207, VCMPEQUD, do_vcmp, TCG_COND_EQ, MO_64)
+
+TRANS_FLAGS(ALTIVEC, VCMPGTSB, do_vcmp, TCG_COND_GT, MO_8)
+TRANS_FLAGS(ALTIVEC, VCMPGTSH, do_vcmp, TCG_COND_GT, MO_16)
+TRANS_FLAGS(ALTIVEC, VCMPGTSW, do_vcmp, TCG_COND_GT, MO_32)
+TRANS_FLAGS2(ALTIVEC_207, VCMPGTSD, do_vcmp, TCG_COND_GT, MO_64)
+TRANS_FLAGS(ALTIVEC, VCMPGTUB, do_vcmp, TCG_COND_GTU, MO_8)
+TRANS_FLAGS(ALTIVEC, VCMPGTUH, do_vcmp, TCG_COND_GTU, MO_16)
+TRANS_FLAGS(ALTIVEC, VCMPGTUW, do_vcmp, TCG_COND_GTU, MO_32)
+TRANS_FLAGS2(ALTIVEC_207, VCMPGTUD, do_vcmp, TCG_COND_GTU, MO_64)
+
+TRANS_FLAGS2(ISA300, VCMPNEB, do_vcmp, TCG_COND_NE, MO_8)
+TRANS_FLAGS2(ISA300, VCMPNEH, do_vcmp, TCG_COND_NE, MO_16)
+TRANS_FLAGS2(ISA300, VCMPNEW, do_vcmp, TCG_COND_NE, MO_32)
+
 GEN_VXRFORM(vcmpeqfp, 3, 3)
 GEN_VXRFORM(vcmpgefp, 3, 7)
 GEN_VXRFORM(vcmpgtfp, 3, 11)
 GEN_VXRFORM(vcmpbfp, 3, 15)
-GEN_VXRFORM(vcmpneb, 3, 0)
-GEN_VXRFORM(vcmpneh, 3, 1)
-GEN_VXRFORM(vcmpnew, 3, 2)
-
-GEN_VXRFORM_DUAL(vcmpequb, PPC_ALTIVEC, PPC_NONE, \
-                 vcmpneb, PPC_NONE, PPC2_ISA300)
-GEN_VXRFORM_DUAL(vcmpequh, PPC_ALTIVEC, PPC_NONE, \
-                 vcmpneh, PPC_NONE, PPC2_ISA300)
-GEN_VXRFORM_DUAL(vcmpequw, PPC_ALTIVEC, PPC_NONE, \
-                 vcmpnew, PPC_NONE, PPC2_ISA300)
-GEN_VXRFORM_DUAL(vcmpeqfp, PPC_ALTIVEC, PPC_NONE, \
-                 vcmpequd, PPC_NONE, PPC2_ALTIVEC_207)
-GEN_VXRFORM_DUAL(vcmpbfp, PPC_ALTIVEC, PPC_NONE, \
-                 vcmpgtsd, PPC_NONE, PPC2_ALTIVEC_207)
-GEN_VXRFORM_DUAL(vcmpgtfp, PPC_ALTIVEC, PPC_NONE, \
-                 vcmpgtud, PPC_NONE, PPC2_ALTIVEC_207)
 
 static void gen_vsplti(DisasContext *ctx, int vece)
 {
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index 6787327f56..80d460c34e 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -187,19 +187,10 @@ GEN_HANDLER2_E(name, str, 0x4, opc2, opc3, 0x00000000, PPC_NONE, PPC2_ISA300),
 GEN_VXRFORM_300(vcmpnezb, 3, 4)
 GEN_VXRFORM_300(vcmpnezh, 3, 5)
 GEN_VXRFORM_300(vcmpnezw, 3, 6)
-GEN_VXRFORM(vcmpgtsb, 3, 12)
-GEN_VXRFORM(vcmpgtsh, 3, 13)
-GEN_VXRFORM(vcmpgtsw, 3, 14)
-GEN_VXRFORM(vcmpgtub, 3, 8)
-GEN_VXRFORM(vcmpgtuh, 3, 9)
-GEN_VXRFORM(vcmpgtuw, 3, 10)
-GEN_VXRFORM_DUAL(vcmpeqfp, vcmpequd, 3, 3, PPC_ALTIVEC, PPC_NONE)
+GEN_VXRFORM(vcmpeqfp, 3, 3)
 GEN_VXRFORM(vcmpgefp, 3, 7)
-GEN_VXRFORM_DUAL(vcmpgtfp, vcmpgtud, 3, 11, PPC_ALTIVEC, PPC_NONE)
-GEN_VXRFORM_DUAL(vcmpbfp, vcmpgtsd, 3, 15, PPC_ALTIVEC, PPC_NONE)
-GEN_VXRFORM_DUAL(vcmpequb, vcmpneb, 3, 0, PPC_ALTIVEC, PPC_NONE)
-GEN_VXRFORM_DUAL(vcmpequh, vcmpneh, 3, 1, PPC_ALTIVEC, PPC_NONE)
-GEN_VXRFORM_DUAL(vcmpequw, vcmpnew, 3, 2, PPC_ALTIVEC, PPC_NONE)
+GEN_VXRFORM(vcmpgtfp, 3, 11)
+GEN_VXRFORM(vcmpbfp, 3, 15)
 
 #define GEN_VXFORM_DUAL_INV(name0, name1, opc2, opc3, inval0, inval1, type) \
 GEN_OPCODE_DUAL(name0##_##name1, 0x04, opc2, opc3, inval0, inval1, type, \
-- 
2.25.1


