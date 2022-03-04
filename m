Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5534CDC8F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 19:33:16 +0100 (CET)
Received: from localhost ([::1]:51860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQCjr-0002ke-9E
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 13:33:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nQC7J-0006rg-3v; Fri, 04 Mar 2022 12:53:25 -0500
Received: from [187.72.171.209] (port=8389 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nQC7H-0003AM-Gh; Fri, 04 Mar 2022 12:53:24 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 4 Mar 2022 14:53:07 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 23F85800502;
 Fri,  4 Mar 2022 14:53:07 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 5/7] target/ppc: split XXGENPCV macros for readability
Date: Fri,  4 Mar 2022 14:51:54 -0300
Message-Id: <20220304175156.2012315-6-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304175156.2012315-1-matheus.ferst@eldorado.org.br>
References: <20220304175156.2012315-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Mar 2022 17:53:07.0613 (UTC)
 FILETIME=[B49ACCD0:01D82FF0]
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

Fixes: b090f4f1e3c9 ("target/ppc: Implement xxgenpcv[bhwd]m instruction")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/int_helper.c             | 28 +++++++++---
 target/ppc/translate/vsx-impl.c.inc | 71 +++++++++++++++--------------
 2 files changed, 57 insertions(+), 42 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index b2b17bb1ca..492f34c499 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1072,7 +1072,7 @@ void helper_VPERMR(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
     *r = result;
 }
 
-#define XXGENPCV(NAME, SZ) \
+#define XXGENPCV_BE_EXP(NAME, SZ) \
 void glue(helper_, glue(NAME, _be_exp))(ppc_vsr_t *t, ppc_vsr_t *b) \
 {                                                                   \
     ppc_vsr_t tmp;                                                  \
@@ -1093,8 +1093,9 @@ void glue(helper_, glue(NAME, _be_exp))(ppc_vsr_t *t, ppc_vsr_t *b) \
     }                                                               \
                                                                     \
     *t = tmp;                                                       \
-}                                                                   \
-                                                                    \
+}
+
+#define XXGENPCV_BE_COMP(NAME, SZ) \
 void glue(helper_, glue(NAME, _be_comp))(ppc_vsr_t *t, ppc_vsr_t *b)\
 {                                                                   \
     ppc_vsr_t tmp = { .u64 = { 0, 0 } };                            \
@@ -1111,8 +1112,9 @@ void glue(helper_, glue(NAME, _be_comp))(ppc_vsr_t *t, ppc_vsr_t *b)\
     }                                                               \
                                                                     \
     *t = tmp;                                                       \
-}                                                                   \
-                                                                    \
+}
+
+#define XXGENPCV_LE_EXP(NAME, SZ) \
 void glue(helper_, glue(NAME, _le_exp))(ppc_vsr_t *t, ppc_vsr_t *b) \
 {                                                                   \
     ppc_vsr_t tmp;                                                  \
@@ -1135,8 +1137,9 @@ void glue(helper_, glue(NAME, _le_exp))(ppc_vsr_t *t, ppc_vsr_t *b) \
     }                                                               \
                                                                     \
     *t = tmp;                                                       \
-}                                                                   \
-                                                                    \
+}
+
+#define XXGENPCV_LE_COMP(NAME, SZ) \
 void glue(helper_, glue(NAME, _le_comp))(ppc_vsr_t *t, ppc_vsr_t *b)\
 {                                                                   \
     ppc_vsr_t tmp = { .u64 = { 0, 0 } };                            \
@@ -1157,10 +1160,21 @@ void glue(helper_, glue(NAME, _le_comp))(ppc_vsr_t *t, ppc_vsr_t *b)\
     *t = tmp;                                                       \
 }
 
+#define XXGENPCV(NAME, SZ) \
+    XXGENPCV_BE_EXP(NAME, SZ)  \
+    XXGENPCV_BE_COMP(NAME, SZ) \
+    XXGENPCV_LE_EXP(NAME, SZ)  \
+    XXGENPCV_LE_COMP(NAME, SZ) \
+
 XXGENPCV(XXGENPCVBM, 1)
 XXGENPCV(XXGENPCVHM, 2)
 XXGENPCV(XXGENPCVWM, 4)
 XXGENPCV(XXGENPCVDM, 8)
+
+#undef XXGENPCV_BE_EXP
+#undef XXGENPCV_BE_COMP
+#undef XXGENPCV_LE_EXP
+#undef XXGENPCV_LE_COMP
 #undef XXGENPCV
 
 #if defined(HOST_WORDS_BIGENDIAN)
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 2ffeab5287..48a97b2d7e 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1204,43 +1204,44 @@ static bool trans_XXPERMX(DisasContext *ctx, arg_8RR_XX4_uim3 *a)
     return true;
 }
 
-#define XXGENPCV(NAME) \
-static bool trans_##NAME(DisasContext *ctx, arg_X_imm5 *a)  \
-{                                                           \
-    TCGv_ptr xt, vrb;                                       \
-                                                            \
-    REQUIRE_INSNS_FLAGS2(ctx, ISA310);                      \
-    REQUIRE_VSX(ctx);                                       \
-                                                            \
-    if (a->imm & ~0x3) {                                    \
-        gen_invalid(ctx);                                   \
-        return true;                                        \
-    }                                                       \
-                                                            \
-    xt = gen_vsr_ptr(a->xt);                                \
-    vrb = gen_avr_ptr(a->vrb);                              \
-                                                            \
-    switch (a->imm) {                                       \
-    case 0b00000: /* Big-Endian expansion */                \
-        glue(gen_helper_, glue(NAME, _be_exp))(xt, vrb);    \
-        break;                                              \
-    case 0b00001: /* Big-Endian compression */              \
-        glue(gen_helper_, glue(NAME, _be_comp))(xt, vrb);   \
-        break;                                              \
-    case 0b00010: /* Little-Endian expansion */             \
-        glue(gen_helper_, glue(NAME, _le_exp))(xt, vrb);    \
-        break;                                              \
-    case 0b00011: /* Little-Endian compression */           \
-        glue(gen_helper_, glue(NAME, _le_comp))(xt, vrb);   \
-        break;                                              \
-    }                                                       \
-                                                            \
-    tcg_temp_free_ptr(xt);                                  \
-    tcg_temp_free_ptr(vrb);                                 \
-                                                            \
-    return true;                                            \
+typedef void (*xxgenpcv_genfn)(TCGv_ptr, TCGv_ptr);
+
+static bool do_xxgenpcv(DisasContext *ctx, arg_X_imm5 *a,
+                        const xxgenpcv_genfn fn[4])
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
+    fn[a->imm](xt, vrb);
+
+    tcg_temp_free_ptr(xt);
+    tcg_temp_free_ptr(vrb);
+
+    return true;
 }
 
+#define XXGENPCV(NAME) \
+    static bool trans_##NAME(DisasContext *ctx, arg_X_imm5 *a)  \
+    {                                                           \
+        static const xxgenpcv_genfn fn[4] = {                   \
+            gen_helper_##NAME##_be_exp,                         \
+            gen_helper_##NAME##_be_comp,                        \
+            gen_helper_##NAME##_le_exp,                         \
+            gen_helper_##NAME##_le_comp,                        \
+        };                                                      \
+        return do_xxgenpcv(ctx, a, fn);                         \
+    }
+
 XXGENPCV(XXGENPCVBM)
 XXGENPCV(XXGENPCVHM)
 XXGENPCV(XXGENPCVWM)
-- 
2.25.1


