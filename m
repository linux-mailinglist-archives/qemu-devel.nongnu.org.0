Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 539B849C1BF
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 04:10:04 +0100 (CET)
Received: from localhost ([::1]:57172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCYh9-0001lm-EQ
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 22:10:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCYWG-0006nx-Is; Tue, 25 Jan 2022 21:58:48 -0500
Received: from [187.72.171.209] (port=56550 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCYWE-0004u9-Ph; Tue, 25 Jan 2022 21:58:48 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:37 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 67EFD8009AB;
 Tue, 25 Jan 2022 09:20:37 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 10/38] target/ppc: Move Vector Compare Not Equal or Zero to
 decodetree
Date: Tue, 25 Jan 2022 09:19:15 -0300
Message-Id: <20220125121943.3269077-11-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:37.0804 (UTC)
 FILETIME=[F5E506C0:01D811E5]
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
 target/ppc/helper.h                 |  9 ++--
 target/ppc/insn32.decode            |  4 ++
 target/ppc/int_helper.c             | 50 +++++----------------
 target/ppc/translate/vmx-impl.c.inc | 69 +++++++++++++++++++++++++++--
 target/ppc/translate/vmx-ops.c.inc  |  3 --
 5 files changed, 83 insertions(+), 52 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 8966419f90..8d542f4d8a 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -141,16 +141,13 @@ DEF_HELPER_3(vabsduw, void, avr, avr, avr)
 DEF_HELPER_3(vavgsb, void, avr, avr, avr)
 DEF_HELPER_3(vavgsh, void, avr, avr, avr)
 DEF_HELPER_3(vavgsw, void, avr, avr, avr)
-DEF_HELPER_4(vcmpnezb, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpnezh, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpnezw, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpeqfp, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgefp, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgtfp, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpbfp, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpnezb_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpnezh_dot, void, env, avr, avr, avr)
-DEF_HELPER_4(vcmpnezw_dot, void, env, avr, avr, avr)
+DEF_HELPER_4(VCMPNEZB, void, avr, avr, avr, i32)
+DEF_HELPER_4(VCMPNEZH, void, avr, avr, avr, i32)
+DEF_HELPER_4(VCMPNEZW, void, avr, avr, avr, i32)
 DEF_HELPER_4(vcmpeqfp_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgefp_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgtfp_dot, void, env, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index bfb36e6969..a0adf18671 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -397,6 +397,10 @@ VCMPNEB         000100 ..... ..... ..... . 0000000111   @VC
 VCMPNEH         000100 ..... ..... ..... . 0001000111   @VC
 VCMPNEW         000100 ..... ..... ..... . 0010000111   @VC
 
+VCMPNEZB        000100 ..... ..... ..... . 0100000111   @VC
+VCMPNEZH        000100 ..... ..... ..... . 0101000111   @VC
+VCMPNEZW        000100 ..... ..... ..... . 0110000111   @VC
+
 ## Vector Bit Manipulation Instruction
 
 VCFUGED         000100 ..... ..... ..... 10101001101    @VX
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 83e718ab0e..1c5e6acda1 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -749,46 +749,18 @@ VCF(ux, uint32_to_float32, u32)
 VCF(sx, int32_to_float32, s32)
 #undef VCF
 
-#define VCMPNE_DO(suffix, element, etype, cmpzero, record)              \
-void helper_vcmpne##suffix(CPUPPCState *env, ppc_avr_t *r,              \
-                            ppc_avr_t *a, ppc_avr_t *b)                 \
-{                                                                       \
-    etype ones = (etype)-1;                                             \
-    etype all = ones;                                                   \
-    etype result, none = 0;                                             \
-    int i;                                                              \
-                                                                        \
-    for (i = 0; i < ARRAY_SIZE(r->element); i++) {                      \
-        if (cmpzero) {                                                  \
-            result = ((a->element[i] == 0)                              \
-                           || (b->element[i] == 0)                      \
-                           || (a->element[i] != b->element[i]) ?        \
-                           ones : 0x0);                                 \
-        } else {                                                        \
-            result = (a->element[i] != b->element[i]) ? ones : 0x0;     \
-        }                                                               \
-        r->element[i] = result;                                         \
-        all &= result;                                                  \
-        none |= result;                                                 \
-    }                                                                   \
-    if (record) {                                                       \
-        env->crf[6] = ((all != 0) << 3) | ((none == 0) << 1);           \
-    }                                                                   \
+#define VCMPNEZ(NAME, ELEM) \
+void helper_##NAME(ppc_vsr_t *t, ppc_vsr_t *a, ppc_vsr_t *b, uint32_t desc) \
+{                                                                           \
+    for (int i = 0; i < ARRAY_SIZE(t->ELEM); i++) {                         \
+        t->ELEM[i] = ((a->ELEM[i] == 0) || (b->ELEM[i] == 0) ||             \
+                      (a->ELEM[i] != b->ELEM[i])) ? -1 : 0;                 \
+    }                                                                       \
 }
-
-/*
- * VCMPNEZ - Vector compare not equal to zero
- *   suffix  - instruction mnemonic suffix (b: byte, h: halfword, w: word)
- *   element - element type to access from vector
- */
-#define VCMPNE(suffix, element, etype, cmpzero)         \
-    VCMPNE_DO(suffix, element, etype, cmpzero, 0)       \
-    VCMPNE_DO(suffix##_dot, element, etype, cmpzero, 1)
-VCMPNE(zb, u8, uint8_t, 1)
-VCMPNE(zh, u16, uint16_t, 1)
-VCMPNE(zw, u32, uint32_t, 1)
-#undef VCMPNE_DO
-#undef VCMPNE
+VCMPNEZ(VCMPNEZB, u8)
+VCMPNEZ(VCMPNEZH, u16)
+VCMPNEZ(VCMPNEZW, u32)
+#undef VCMPNEZ
 
 #define VCMPFP_DO(suffix, compare, order, record)                       \
     void helper_vcmp##suffix(CPUPPCState *env, ppc_avr_t *r,            \
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index a32ad92195..67059ed9b2 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -985,10 +985,6 @@ static void glue(gen_, name0##_##name1)(DisasContext *ctx)             \
     }                                                                  \
 }
 
-GEN_VXRFORM(vcmpnezb, 3, 4)
-GEN_VXRFORM(vcmpnezh, 3, 5)
-GEN_VXRFORM(vcmpnezw, 3, 6)
-
 static void do_vcmp_rc(int vrt)
 {
     TCGv_i64 t0, t1;
@@ -1051,6 +1047,71 @@ TRANS_FLAGS2(ISA300, VCMPNEB, do_vcmp, TCG_COND_NE, MO_8)
 TRANS_FLAGS2(ISA300, VCMPNEH, do_vcmp, TCG_COND_NE, MO_16)
 TRANS_FLAGS2(ISA300, VCMPNEW, do_vcmp, TCG_COND_NE, MO_32)
 
+static void gen_vcmpnez_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t0, t1, zero;
+
+    t0 = tcg_temp_new_vec_matching(t);
+    t1 = tcg_temp_new_vec_matching(t);
+    zero = tcg_constant_vec_matching(t, vece, 0);
+
+    tcg_gen_cmp_vec(TCG_COND_EQ, vece, t0, a, zero);
+    tcg_gen_cmp_vec(TCG_COND_EQ, vece, t1, b, zero);
+    tcg_gen_cmp_vec(TCG_COND_NE, vece, t, a, b);
+
+    tcg_gen_or_vec(vece, t, t, t0);
+    tcg_gen_or_vec(vece, t, t, t1);
+
+    tcg_gen_shli_vec(vece, t, t, (8 << vece) - 1);
+    tcg_gen_sari_vec(vece, t, t, (8 << vece) - 1);
+
+    tcg_temp_free_vec(t0);
+    tcg_temp_free_vec(t1);
+}
+
+static bool do_vcmpnez(DisasContext *ctx, arg_VC *a, int vece)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_cmp_vec, INDEX_op_shli_vec, INDEX_op_sari_vec, 0
+    };
+    static const GVecGen3 ops[3] = {
+        {
+            .fniv = gen_vcmpnez_vec,
+            .fno = gen_helper_VCMPNEZB,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vcmpnez_vec,
+            .fno = gen_helper_VCMPNEZH,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vcmpnez_vec,
+            .fno = gen_helper_VCMPNEZW,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        }
+    };
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                   avr_full_offset(a->vrb), 16, 16, &ops[vece]);
+
+    if (a->rc) {
+        do_vcmp_rc(a->vrt);
+    }
+
+    return true;
+}
+
+TRANS(VCMPNEZB, do_vcmpnez, MO_8)
+TRANS(VCMPNEZH, do_vcmpnez, MO_16)
+TRANS(VCMPNEZW, do_vcmpnez, MO_32)
+
 GEN_VXRFORM(vcmpeqfp, 3, 3)
 GEN_VXRFORM(vcmpgefp, 3, 7)
 GEN_VXRFORM(vcmpgtfp, 3, 11)
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index 80d460c34e..cb4c5bb953 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -184,9 +184,6 @@ GEN_HANDLER2_E(name, str, 0x4, opc2, opc3, 0x00000000, PPC_NONE, PPC2_ISA300),
     GEN_VXRFORM1_300(name, name, #name, opc2, opc3)                         \
     GEN_VXRFORM1_300(name##_dot, name##_, #name ".", opc2, (opc3 | (0x1 << 4)))
 
-GEN_VXRFORM_300(vcmpnezb, 3, 4)
-GEN_VXRFORM_300(vcmpnezh, 3, 5)
-GEN_VXRFORM_300(vcmpnezw, 3, 6)
 GEN_VXRFORM(vcmpeqfp, 3, 3)
 GEN_VXRFORM(vcmpgefp, 3, 7)
 GEN_VXRFORM(vcmpgtfp, 3, 11)
-- 
2.25.1


