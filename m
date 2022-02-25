Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EF54C5163
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 23:17:30 +0100 (CET)
Received: from localhost ([::1]:48226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNiu1-00069v-8w
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 17:17:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhwB-0007QN-3C; Fri, 25 Feb 2022 16:15:39 -0500
Received: from [187.72.171.209] (port=1210 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhw8-0004HA-Pv; Fri, 25 Feb 2022 16:15:38 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 25 Feb 2022 18:09:57 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 3EB8A8006BB;
 Fri, 25 Feb 2022 18:09:57 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 35/49] target/ppc: Implement xxgenpcv[bhwd]m instruction
Date: Fri, 25 Feb 2022 18:09:22 -0300
Message-Id: <20220225210936.1749575-36-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Feb 2022 21:09:57.0607 (UTC)
 FILETIME=[0B049F70:01D82A8C]
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

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v5:
 - One helper for each IMM value.
---
 target/ppc/helper.h                 | 16 +++++
 target/ppc/insn32.decode            | 10 ++++
 target/ppc/int_helper.c             | 91 +++++++++++++++++++++++++++++
 target/ppc/translate/vsx-impl.c.inc | 43 ++++++++++++++
 4 files changed, 160 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index ef9655c7cd..d1ed043b41 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -492,6 +492,22 @@ DEF_HELPER_3(xvrspic, void, env, vsr, vsr)
 DEF_HELPER_3(xvrspim, void, env, vsr, vsr)
 DEF_HELPER_3(xvrspip, void, env, vsr, vsr)
 DEF_HELPER_3(xvrspiz, void, env, vsr, vsr)
+DEF_HELPER_FLAGS_2(XXGENPCVBM_be_exp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVBM_be_comp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVBM_le_exp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVBM_le_comp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVHM_be_exp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVHM_be_comp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVHM_le_exp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVHM_le_comp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVWM_be_exp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVWM_be_comp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVWM_le_exp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVWM_le_comp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVDM_be_exp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVDM_be_comp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVDM_le_exp, TCG_CALL_NO_RWG, void, vsr, avr)
+DEF_HELPER_FLAGS_2(XXGENPCVDM_le_comp, TCG_CALL_NO_RWG, void, vsr, avr)
 DEF_HELPER_4(xxextractuw, void, env, vsr, vsr, i32)
 DEF_HELPER_FLAGS_5(XXPERMX, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, tl)
 DEF_HELPER_4(xxinsertw, void, env, vsr, vsr, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index b8dbac553e..22b245607b 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -119,6 +119,9 @@
 @X_bfl          ...... bf:3 - l:1 ra:5 rb:5 ..........- &X_bfl
 
 %x_xt           0:1 21:5
+&X_imm5         xt imm:uint8_t vrb
+@X_imm5         ...... ..... imm:5 vrb:5 .......... .           &X_imm5 xt=%x_xt
+
 &X_imm8         xt imm:uint8_t
 @X_imm8         ...... ..... .. imm:8 .......... .              &X_imm8 xt=%x_xt
 
@@ -615,6 +618,13 @@ XXPERMDI        111100 ..... ..... ..... 0 .. 01010 ... @XX3_dm
 
 XXSEL           111100 ..... ..... ..... ..... 11 ....  @XX4
 
+## VSX Vector Generate PCV
+
+XXGENPCVBM      111100 ..... ..... ..... 1110010100 .   @X_imm5
+XXGENPCVHM      111100 ..... ..... ..... 1110010101 .   @X_imm5
+XXGENPCVWM      111100 ..... ..... ..... 1110110100 .   @X_imm5
+XXGENPCVDM      111100 ..... ..... ..... 1110110101 .   @X_imm5
+
 ## VSX Vector Load Special Value Instruction
 
 LXVKQ           111100 ..... 11111 ..... 0101101000 .   @X_uim5
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index ca59cd3d79..b2b17bb1ca 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1072,6 +1072,97 @@ void helper_VPERMR(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
     *r = result;
 }
 
+#define XXGENPCV(NAME, SZ) \
+void glue(helper_, glue(NAME, _be_exp))(ppc_vsr_t *t, ppc_vsr_t *b) \
+{                                                                   \
+    ppc_vsr_t tmp;                                                  \
+                                                                    \
+    /* Initialize tmp with the result of an all-zeros mask */       \
+    tmp.VsrD(0) = 0x1011121314151617;                               \
+    tmp.VsrD(1) = 0x18191A1B1C1D1E1F;                               \
+                                                                    \
+    /* Iterate over the most significant byte of each element */    \
+    for (int i = 0, j = 0; i < ARRAY_SIZE(b->u8); i += SZ) {        \
+        if (b->VsrB(i) & 0x80) {                                    \
+            /* Update each byte of the element */                   \
+            for (int k = 0; k < SZ; k++) {                          \
+                tmp.VsrB(i + k) = j + k;                            \
+            }                                                       \
+            j += SZ;                                                \
+        }                                                           \
+    }                                                               \
+                                                                    \
+    *t = tmp;                                                       \
+}                                                                   \
+                                                                    \
+void glue(helper_, glue(NAME, _be_comp))(ppc_vsr_t *t, ppc_vsr_t *b)\
+{                                                                   \
+    ppc_vsr_t tmp = { .u64 = { 0, 0 } };                            \
+                                                                    \
+    /* Iterate over the most significant byte of each element */    \
+    for (int i = 0, j = 0; i < ARRAY_SIZE(b->u8); i += SZ) {        \
+        if (b->VsrB(i) & 0x80) {                                    \
+            /* Update each byte of the element */                   \
+            for (int k = 0; k < SZ; k++) {                          \
+                tmp.VsrB(j + k) = i + k;                            \
+            }                                                       \
+            j += SZ;                                                \
+        }                                                           \
+    }                                                               \
+                                                                    \
+    *t = tmp;                                                       \
+}                                                                   \
+                                                                    \
+void glue(helper_, glue(NAME, _le_exp))(ppc_vsr_t *t, ppc_vsr_t *b) \
+{                                                                   \
+    ppc_vsr_t tmp;                                                  \
+                                                                    \
+    /* Initialize tmp with the result of an all-zeros mask */       \
+    tmp.VsrD(0) = 0x1F1E1D1C1B1A1918;                               \
+    tmp.VsrD(1) = 0x1716151413121110;                               \
+                                                                    \
+    /* Iterate over the most significant byte of each element */    \
+    for (int i = 0, j = 0; i < ARRAY_SIZE(b->u8); i += SZ) {        \
+        /* Reverse indexing of "i" */                               \
+        const int idx = ARRAY_SIZE(b->u8) - i - SZ;                 \
+        if (b->VsrB(idx) & 0x80) {                                  \
+            /* Update each byte of the element */                   \
+            for (int k = 0, rk = SZ - 1; k < SZ; k++, rk--) {       \
+                tmp.VsrB(idx + rk) = j + k;                         \
+            }                                                       \
+            j += SZ;                                                \
+        }                                                           \
+    }                                                               \
+                                                                    \
+    *t = tmp;                                                       \
+}                                                                   \
+                                                                    \
+void glue(helper_, glue(NAME, _le_comp))(ppc_vsr_t *t, ppc_vsr_t *b)\
+{                                                                   \
+    ppc_vsr_t tmp = { .u64 = { 0, 0 } };                            \
+                                                                    \
+    /* Iterate over the most significant byte of each element */    \
+    for (int i = 0, j = 0; i < ARRAY_SIZE(b->u8); i += SZ) {        \
+        if (b->VsrB(ARRAY_SIZE(b->u8) - i - SZ) & 0x80) {           \
+            /* Update each byte of the element */                   \
+            for (int k = 0, rk = SZ - 1; k < SZ; k++, rk--) {       \
+                /* Reverse indexing of "j" */                       \
+                const int idx = ARRAY_SIZE(b->u8) - j - SZ;         \
+                tmp.VsrB(idx + rk) = i + k;                         \
+            }                                                       \
+            j += SZ;                                                \
+        }                                                           \
+    }                                                               \
+                                                                    \
+    *t = tmp;                                                       \
+}
+
+XXGENPCV(XXGENPCVBM, 1)
+XXGENPCV(XXGENPCVHM, 2)
+XXGENPCV(XXGENPCVWM, 4)
+XXGENPCV(XXGENPCVDM, 8)
+#undef XXGENPCV
+
 #if defined(HOST_WORDS_BIGENDIAN)
 #define VBPERMQ_INDEX(avr, i) ((avr)->u8[(i)])
 #define VBPERMD_INDEX(i) (i)
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index b5e07cf3df..6528e1ae31 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1256,6 +1256,49 @@ static bool trans_XXPERMX(DisasContext *ctx, arg_8RR_XX4_uim3 *a)
     return true;
 }
 
+#define XXGENPCV(NAME) \
+static bool trans_##NAME(DisasContext *ctx, arg_X_imm5 *a)  \
+{                                                           \
+    TCGv_ptr xt, vrb;                                       \
+                                                            \
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);                      \
+    REQUIRE_VSX(ctx);                                       \
+                                                            \
+    if (a->imm & ~0x3) {                                    \
+        gen_invalid(ctx);                                   \
+        return true;                                        \
+    }                                                       \
+                                                            \
+    xt = gen_vsr_ptr(a->xt);                                \
+    vrb = gen_avr_ptr(a->vrb);                              \
+                                                            \
+    switch (a->imm) {                                       \
+    case 0b00000: /* Big-Endian expansion */                \
+        glue(gen_helper_, glue(NAME, _be_exp))(xt, vrb);    \
+        break;                                              \
+    case 0b00001: /* Big-Endian compression */              \
+        glue(gen_helper_, glue(NAME, _be_comp))(xt, vrb);   \
+        break;                                              \
+    case 0b00010: /* Little-Endian expansion */             \
+        glue(gen_helper_, glue(NAME, _le_exp))(xt, vrb);    \
+        break;                                              \
+    case 0b00011: /* Little-Endian compression */           \
+        glue(gen_helper_, glue(NAME, _le_comp))(xt, vrb);   \
+        break;                                              \
+    }                                                       \
+                                                            \
+    tcg_temp_free_ptr(xt);                                  \
+    tcg_temp_free_ptr(vrb);                                 \
+                                                            \
+    return true;                                            \
+}
+
+XXGENPCV(XXGENPCVBM)
+XXGENPCV(XXGENPCVHM)
+XXGENPCV(XXGENPCVWM)
+XXGENPCV(XXGENPCVDM)
+#undef XXGENPCV
+
 #define GEN_VSX_HELPER_VSX_MADD(name, op1, aop, mop, inval, type)             \
 static void gen_##name(DisasContext *ctx)                                     \
 {                                                                             \
-- 
2.25.1


