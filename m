Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9E44BFD4D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 16:44:57 +0100 (CET)
Received: from localhost ([::1]:55124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXLU-00063e-Dr
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 10:44:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWNH-0000Pn-4u; Tue, 22 Feb 2022 09:42:43 -0500
Received: from [187.72.171.209] (port=44973 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWNE-0005xE-RM; Tue, 22 Feb 2022 09:42:42 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 22 Feb 2022 11:37:47 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id F382980047A;
 Tue, 22 Feb 2022 11:37:46 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 33/47] target/ppc: Implement xxgenpcv[bhwd]m instruction
Date: Tue, 22 Feb 2022 11:36:31 -0300
Message-Id: <20220222143646.1268606-34-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Feb 2022 14:37:47.0447 (UTC)
 FILETIME=[C2B5E470:01D827F9]
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
 target/ppc/helper.h                 |  4 ++
 target/ppc/insn32.decode            | 10 ++++
 target/ppc/int_helper.c             | 84 +++++++++++++++++++++++++++++
 target/ppc/translate/vsx-impl.c.inc | 29 ++++++++++
 4 files changed, 127 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index b8c818f573..9751871370 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -496,6 +496,10 @@ DEF_HELPER_3(xvrspic, void, env, vsr, vsr)
 DEF_HELPER_3(xvrspim, void, env, vsr, vsr)
 DEF_HELPER_3(xvrspip, void, env, vsr, vsr)
 DEF_HELPER_3(xvrspiz, void, env, vsr, vsr)
+DEF_HELPER_3(XXGENPCVBM, void, vsr, avr, tl)
+DEF_HELPER_3(XXGENPCVHM, void, vsr, avr, tl)
+DEF_HELPER_3(XXGENPCVWM, void, vsr, avr, tl)
+DEF_HELPER_3(XXGENPCVDM, void, vsr, avr, tl)
 DEF_HELPER_4(xxextractuw, void, env, vsr, vsr, i32)
 DEF_HELPER_5(XXPERMX, void, vsr, vsr, vsr, vsr, tl)
 DEF_HELPER_4(xxinsertw, void, env, vsr, vsr, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 185d697458..b11a3ee29a 100644
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
 
@@ -613,6 +616,13 @@ XXPERMDI        111100 ..... ..... ..... 0 .. 01010 ... @XX3_dm
 
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
index 255645ef1d..dc106aaab9 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1088,6 +1088,90 @@ void helper_VPERMR(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
     *r = result;
 }
 
+#define XXGENPCV(NAME, SZ) \
+void helper_##NAME(ppc_vsr_t *t, ppc_vsr_t *b, target_ulong imm)            \
+{                                                                           \
+    ppc_vsr_t tmp = { .u64 = { 0, 0 } };                                    \
+                                                                            \
+    switch (imm) {                                                          \
+    case 0b00000: /* Big-Endian expansion */                                \
+        /* Initialize tmp with the result of an all-zeros mask */           \
+        tmp.VsrD(0) = 0x1011121314151617;                                   \
+        tmp.VsrD(1) = 0x18191A1B1C1D1E1F;                                   \
+                                                                            \
+        /* Iterate over the most significant byte of each element */        \
+        for (int i = 0, j = 0; i < ARRAY_SIZE(b->u8); i += SZ) {            \
+            if (b->VsrB(i) & 0x80) {                                        \
+                /* Update each byte of the element */                       \
+                for (int k = 0; k < SZ; k++) {                              \
+                    tmp.VsrB(i + k) = j + k;                                \
+                }                                                           \
+                j += SZ;                                                    \
+            }                                                               \
+        }                                                                   \
+                                                                            \
+        break;                                                              \
+    case 0b00001: /* Big-Endian compression */                              \
+        /* Iterate over the most significant byte of each element */        \
+        for (int i = 0, j = 0; i < ARRAY_SIZE(b->u8); i += SZ) {            \
+            if (b->VsrB(i) & 0x80) {                                        \
+                /* Update each byte of the element */                       \
+                for (int k = 0; k < SZ; k++) {                              \
+                    tmp.VsrB(j + k) = i + k;                                \
+                }                                                           \
+                j += SZ;                                                    \
+            }                                                               \
+        }                                                                   \
+                                                                            \
+        break;                                                              \
+    case 0b00010: /* Little-Endian expansion */                             \
+        /* Initialize tmp with the result of an all-zeros mask */           \
+        tmp.VsrD(0) = 0x1F1E1D1C1B1A1918;                                   \
+        tmp.VsrD(1) = 0x1716151413121110;                                   \
+                                                                            \
+        /* Iterate over the most significant byte of each element */        \
+        for (int i = 0, j = 0; i < ARRAY_SIZE(b->u8); i += SZ) {            \
+            /* Reverse indexing of "i" */                                   \
+            const int idx = ARRAY_SIZE(b->u8) - i - SZ;                     \
+            if (b->VsrB(idx) & 0x80) {                                      \
+                /* Update each byte of the element */                       \
+                for (int k = 0, rk = SZ - 1; k < SZ; k++, rk--) {           \
+                    tmp.VsrB(idx + rk) = j + k;                             \
+                }                                                           \
+                j += SZ;                                                    \
+            }                                                               \
+        }                                                                   \
+                                                                            \
+        break;                                                              \
+    case 0b00011: /* Little-Endian compression */                           \
+        /* Iterate over the most significant byte of each element */        \
+        for (int i = 0, j = 0; i < ARRAY_SIZE(b->u8); i += SZ) {            \
+            if (b->VsrB(ARRAY_SIZE(b->u8) - i - SZ) & 0x80) {               \
+                /* Update each byte of the element */                       \
+                for (int k = 0, rk = SZ - 1; k < SZ; k++, rk--) {           \
+                    /* Reverse indexing of "j" */                           \
+                    const int idx = ARRAY_SIZE(b->u8) - j - SZ;             \
+                    tmp.VsrB(idx + rk) = i + k;                             \
+                }                                                           \
+                j += SZ;                                                    \
+            }                                                               \
+        }                                                                   \
+                                                                            \
+        break;                                                              \
+    default:                                                                \
+        /* Translation code validates IMM before calling this helper */     \
+        g_assert_not_reached();                                             \
+        break;                                                              \
+    }                                                                       \
+                                                                            \
+    *t = tmp;                                                               \
+}
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
index d389ca2a83..a75c4e68f8 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1256,6 +1256,35 @@ static bool trans_XXPERMX(DisasContext *ctx, arg_8RR_XX4_uim3 *a)
     return true;
 }
 
+static bool do_xxgenpcv(DisasContext *ctx, arg_X_imm5 *a,
+                        void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv))
+{
+    TCGv_ptr xt, vrb;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    if (a->imm & ~0x3) {
+        gen_invalid(ctx);
+        return true;
+    }
+
+    xt = gen_vsr_ptr(a->xt);
+    vrb = gen_avr_ptr(a->vrb);
+
+    gen_helper(xt, vrb, tcg_constant_tl(a->imm));
+
+    tcg_temp_free_ptr(xt);
+    tcg_temp_free_ptr(vrb);
+
+    return true;
+}
+
+TRANS(XXGENPCVBM, do_xxgenpcv, gen_helper_XXGENPCVBM)
+TRANS(XXGENPCVHM, do_xxgenpcv, gen_helper_XXGENPCVHM)
+TRANS(XXGENPCVWM, do_xxgenpcv, gen_helper_XXGENPCVWM)
+TRANS(XXGENPCVDM, do_xxgenpcv, gen_helper_XXGENPCVDM)
+
 #define GEN_VSX_HELPER_VSX_MADD(name, op1, aop, mop, inval, type)             \
 static void gen_##name(DisasContext *ctx)                                     \
 {                                                                             \
-- 
2.25.1


