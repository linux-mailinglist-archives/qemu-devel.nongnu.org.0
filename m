Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0901A50D5BA
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:28:14 +0200 (CEST)
Received: from localhost ([::1]:42068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikiD-0001DX-4u
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikTs-0002I2-I6
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:13:25 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikTp-0002vW-SK
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:13:24 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJ9-0001ea-Dp; Sun, 24 Apr 2022 23:02:19 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 23/42] i386: AVX comparison helpers
Date: Sun, 24 Apr 2022 23:01:45 +0100
Message-Id: <20220424220204.2493824-24-paul@nowt.org>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220418173904.3746036-1-paul@nowt.org>
References: <20220418173904.3746036-1-paul@nowt.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41c8:51:832:fcff:ff:fe00:46dd;
 envelope-from=paul@nowt.org; helo=nowt.default.pbrook.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Paul Brook <paul@nowt.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AVX includes additional a more extensive set of comparison predicates,
some of some of which our softfloat implementation does not expose directly.
Rewrite the helpers in terms of floatN_compare

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h        | 149 ++++++++++++++++++++++++-----------
 target/i386/ops_sse_header.h |  47 ++++++++---
 target/i386/tcg/translate.c  |  49 +++++++++---
 3 files changed, 177 insertions(+), 68 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 48cec40074..e48dfc2fc5 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1394,57 +1394,112 @@ void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 #endif
 }
 
-/* XXX: unordered */
-#define SSE_HELPER_CMP(name, F)                                         \
-    void glue(helper_ ## name ## ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)\
-    {                                                                   \
-        d->ZMM_L(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
-        d->ZMM_L(1) = F(32, d->ZMM_S(1), s->ZMM_S(1));                  \
-        d->ZMM_L(2) = F(32, d->ZMM_S(2), s->ZMM_S(2));                  \
-        d->ZMM_L(3) = F(32, d->ZMM_S(3), s->ZMM_S(3));                  \
-    }                                                                   \
-                                                                        \
-    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *s)        \
-    {                                                                   \
-        d->ZMM_L(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
-    }                                                                   \
-                                                                        \
-    void glue(helper_ ## name ## pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)\
+#define SSE_HELPER_CMP_P(name, F, C)                                    \
+    void glue(helper_ ## name ## ps, SUFFIX)(CPUX86State *env,          \
+                                             Reg *d, Reg *s)    \
     {                                                                   \
-        d->ZMM_Q(0) = F(64, d->ZMM_D(0), s->ZMM_D(0));                  \
-        d->ZMM_Q(1) = F(64, d->ZMM_D(1), s->ZMM_D(1));                  \
+        Reg *v = d;                                                     \
+        d->ZMM_L(0) = F(32, C, v->ZMM_S(0), s->ZMM_S(0));               \
+        d->ZMM_L(1) = F(32, C, v->ZMM_S(1), s->ZMM_S(1));               \
+        d->ZMM_L(2) = F(32, C, v->ZMM_S(2), s->ZMM_S(2));               \
+        d->ZMM_L(3) = F(32, C, v->ZMM_S(3), s->ZMM_S(3));               \
+        YMM_ONLY(                                                       \
+        d->ZMM_L(4) = F(32, C, v->ZMM_S(4), s->ZMM_S(4));               \
+        d->ZMM_L(5) = F(32, C, v->ZMM_S(5), s->ZMM_S(5));               \
+        d->ZMM_L(6) = F(32, C, v->ZMM_S(6), s->ZMM_S(6));               \
+        d->ZMM_L(7) = F(32, C, v->ZMM_S(7), s->ZMM_S(7));               \
+        )                                                               \
     }                                                                   \
                                                                         \
-    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *s)        \
+    void glue(helper_ ## name ## pd, SUFFIX)(CPUX86State *env,          \
+                                             Reg *d, Reg *s)    \
     {                                                                   \
-        d->ZMM_Q(0) = F(64, d->ZMM_D(0), s->ZMM_D(0));                  \
-    }
-
-#define FPU_CMPEQ(size, a, b)                                           \
-    (float ## size ## _eq_quiet(a, b, &env->sse_status) ? -1 : 0)
-#define FPU_CMPLT(size, a, b)                                           \
-    (float ## size ## _lt(a, b, &env->sse_status) ? -1 : 0)
-#define FPU_CMPLE(size, a, b)                                           \
-    (float ## size ## _le(a, b, &env->sse_status) ? -1 : 0)
-#define FPU_CMPUNORD(size, a, b)                                        \
-    (float ## size ## _unordered_quiet(a, b, &env->sse_status) ? -1 : 0)
-#define FPU_CMPNEQ(size, a, b)                                          \
-    (float ## size ## _eq_quiet(a, b, &env->sse_status) ? 0 : -1)
-#define FPU_CMPNLT(size, a, b)                                          \
-    (float ## size ## _lt(a, b, &env->sse_status) ? 0 : -1)
-#define FPU_CMPNLE(size, a, b)                                          \
-    (float ## size ## _le(a, b, &env->sse_status) ? 0 : -1)
-#define FPU_CMPORD(size, a, b)                                          \
-    (float ## size ## _unordered_quiet(a, b, &env->sse_status) ? 0 : -1)
-
-SSE_HELPER_CMP(cmpeq, FPU_CMPEQ)
-SSE_HELPER_CMP(cmplt, FPU_CMPLT)
-SSE_HELPER_CMP(cmple, FPU_CMPLE)
-SSE_HELPER_CMP(cmpunord, FPU_CMPUNORD)
-SSE_HELPER_CMP(cmpneq, FPU_CMPNEQ)
-SSE_HELPER_CMP(cmpnlt, FPU_CMPNLT)
-SSE_HELPER_CMP(cmpnle, FPU_CMPNLE)
-SSE_HELPER_CMP(cmpord, FPU_CMPORD)
+        Reg *v = d;                                                     \
+        d->ZMM_Q(0) = F(64, C, v->ZMM_D(0), s->ZMM_D(0));               \
+        d->ZMM_Q(1) = F(64, C, v->ZMM_D(1), s->ZMM_D(1));               \
+        YMM_ONLY(                                                       \
+        d->ZMM_Q(2) = F(64, C, v->ZMM_D(2), s->ZMM_D(2));               \
+        d->ZMM_Q(3) = F(64, C, v->ZMM_D(3), s->ZMM_D(3));               \
+        )                                                               \
+    }
+
+#if SHIFT == 1
+#define SSE_HELPER_CMP(name, F, C)                                          \
+    SSE_HELPER_CMP_P(name, F, C)                                            \
+    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *s)    \
+    {                                                                       \
+        Reg *v = d;                                                         \
+        d->ZMM_L(0) = F(32, C, v->ZMM_S(0), s->ZMM_S(0));                   \
+    }                                                                       \
+                                                                            \
+    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *s)    \
+    {                                                                       \
+        Reg *v = d;                                                         \
+        d->ZMM_Q(0) = F(64, C, v->ZMM_D(0), s->ZMM_D(0));                   \
+    }
+
+static inline bool FPU_EQU(FloatRelation x)
+{
+    return (x == float_relation_equal || x == float_relation_unordered);
+}
+static inline bool FPU_GE(FloatRelation x)
+{
+    return (x == float_relation_equal || x == float_relation_greater);
+}
+#define FPU_EQ(x) (x == float_relation_equal)
+#define FPU_LT(x) (x == float_relation_less)
+#define FPU_LE(x) (x <= float_relation_equal)
+#define FPU_GT(x) (x == float_relation_greater)
+#define FPU_UNORD(x) (x == float_relation_unordered)
+// We must make sure we evaluate the argument in case it is a signalling NAN
+#define FPU_FALSE(x) (x == float_relation_equal && 0)
+
+#define FPU_CMPQ(size, COND, a, b) \
+    (COND(float ## size ## _compare_quiet(a, b, &env->sse_status)) ? -1 : 0)
+#define FPU_CMPS(size, COND, a, b) \
+    (COND(float ## size ## _compare(a, b, &env->sse_status)) ? -1 : 0)
+
+#else
+#define SSE_HELPER_CMP(name, F, C) SSE_HELPER_CMP_P(name, F, C)
+#endif
+
+SSE_HELPER_CMP(cmpeq, FPU_CMPQ, FPU_EQ)
+SSE_HELPER_CMP(cmplt, FPU_CMPS, FPU_LT)
+SSE_HELPER_CMP(cmple, FPU_CMPS, FPU_LE)
+SSE_HELPER_CMP(cmpunord, FPU_CMPQ,  FPU_UNORD)
+SSE_HELPER_CMP(cmpneq, FPU_CMPQ, !FPU_EQ)
+SSE_HELPER_CMP(cmpnlt, FPU_CMPS, !FPU_LT)
+SSE_HELPER_CMP(cmpnle, FPU_CMPS, !FPU_LE)
+SSE_HELPER_CMP(cmpord, FPU_CMPQ, !FPU_UNORD)
+
+SSE_HELPER_CMP(cmpequ, FPU_CMPQ, FPU_EQU)
+SSE_HELPER_CMP(cmpnge, FPU_CMPS, !FPU_GE)
+SSE_HELPER_CMP(cmpngt, FPU_CMPS, !FPU_GT)
+SSE_HELPER_CMP(cmpfalse, FPU_CMPQ,  FPU_FALSE)
+SSE_HELPER_CMP(cmpnequ, FPU_CMPQ, !FPU_EQU)
+SSE_HELPER_CMP(cmpge, FPU_CMPS, FPU_GE)
+SSE_HELPER_CMP(cmpgt, FPU_CMPS, FPU_GT)
+SSE_HELPER_CMP(cmptrue, FPU_CMPQ,  !FPU_FALSE)
+
+SSE_HELPER_CMP(cmpeqs, FPU_CMPS, FPU_EQ)
+SSE_HELPER_CMP(cmpltq, FPU_CMPQ, FPU_LT)
+SSE_HELPER_CMP(cmpleq, FPU_CMPQ, FPU_LE)
+SSE_HELPER_CMP(cmpunords, FPU_CMPS,  FPU_UNORD)
+SSE_HELPER_CMP(cmpneqq, FPU_CMPS, !FPU_EQ)
+SSE_HELPER_CMP(cmpnltq, FPU_CMPQ, !FPU_LT)
+SSE_HELPER_CMP(cmpnleq, FPU_CMPQ, !FPU_LE)
+SSE_HELPER_CMP(cmpords, FPU_CMPS, !FPU_UNORD)
+
+SSE_HELPER_CMP(cmpequs, FPU_CMPS, FPU_EQU)
+SSE_HELPER_CMP(cmpngeq, FPU_CMPQ, !FPU_GE)
+SSE_HELPER_CMP(cmpngtq, FPU_CMPQ, !FPU_GT)
+SSE_HELPER_CMP(cmpfalses, FPU_CMPS,  FPU_FALSE)
+SSE_HELPER_CMP(cmpnequs, FPU_CMPS, !FPU_EQU)
+SSE_HELPER_CMP(cmpgeq, FPU_CMPQ, FPU_GE)
+SSE_HELPER_CMP(cmpgtq, FPU_CMPQ, FPU_GT)
+SSE_HELPER_CMP(cmptrues, FPU_CMPS,  !FPU_FALSE)
+
+#undef SSE_HELPER_CMP
 
 #if SHIFT == 1
 static const int comis_eflags[4] = {CC_C, CC_Z, 0, CC_Z | CC_P | CC_C};
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 63b63eb532..793e581224 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -229,16 +229,43 @@ SSE_HELPER_P4(hadd)
 SSE_HELPER_P4(hsub)
 SSE_HELPER_P4(addsub)
 
-#define SSE_HELPER_CMP(name, F) SSE_HELPER_S4(name)
-
-SSE_HELPER_CMP(cmpeq, FPU_CMPEQ)
-SSE_HELPER_CMP(cmplt, FPU_CMPLT)
-SSE_HELPER_CMP(cmple, FPU_CMPLE)
-SSE_HELPER_CMP(cmpunord, FPU_CMPUNORD)
-SSE_HELPER_CMP(cmpneq, FPU_CMPNEQ)
-SSE_HELPER_CMP(cmpnlt, FPU_CMPNLT)
-SSE_HELPER_CMP(cmpnle, FPU_CMPNLE)
-SSE_HELPER_CMP(cmpord, FPU_CMPORD)
+#define SSE_HELPER_CMP(name, F, C) SSE_HELPER_S4(name)
+
+SSE_HELPER_CMP(cmpeq, FPU_CMPQ, FPU_EQ)
+SSE_HELPER_CMP(cmplt, FPU_CMPS, FPU_LT)
+SSE_HELPER_CMP(cmple, FPU_CMPS, FPU_LE)
+SSE_HELPER_CMP(cmpunord, FPU_CMPQ,  FPU_UNORD)
+SSE_HELPER_CMP(cmpneq, FPU_CMPQ, !FPU_EQ)
+SSE_HELPER_CMP(cmpnlt, FPU_CMPS, !FPU_LT)
+SSE_HELPER_CMP(cmpnle, FPU_CMPS, !FPU_LE)
+SSE_HELPER_CMP(cmpord, FPU_CMPQ, !FPU_UNORD)
+
+SSE_HELPER_CMP(cmpequ, FPU_CMPQ, FPU_EQU)
+SSE_HELPER_CMP(cmpnge, FPU_CMPS, !FPU_GE)
+SSE_HELPER_CMP(cmpngt, FPU_CMPS, !FPU_GT)
+SSE_HELPER_CMP(cmpfalse, FPU_CMPQ,  FPU_FALSE)
+SSE_HELPER_CMP(cmpnequ, FPU_CMPQ, !FPU_EQU)
+SSE_HELPER_CMP(cmpge, FPU_CMPS, FPU_GE)
+SSE_HELPER_CMP(cmpgt, FPU_CMPS, FPU_GT)
+SSE_HELPER_CMP(cmptrue, FPU_CMPQ,  !FPU_FALSE)
+
+SSE_HELPER_CMP(cmpeqs, FPU_CMPS, FPU_EQ)
+SSE_HELPER_CMP(cmpltq, FPU_CMPQ, FPU_LT)
+SSE_HELPER_CMP(cmpleq, FPU_CMPQ, FPU_LE)
+SSE_HELPER_CMP(cmpunords, FPU_CMPS,  FPU_UNORD)
+SSE_HELPER_CMP(cmpneqq, FPU_CMPS, !FPU_EQ)
+SSE_HELPER_CMP(cmpnltq, FPU_CMPQ, !FPU_LT)
+SSE_HELPER_CMP(cmpnleq, FPU_CMPQ, !FPU_LE)
+SSE_HELPER_CMP(cmpords, FPU_CMPS, !FPU_UNORD)
+
+SSE_HELPER_CMP(cmpequs, FPU_CMPS, FPU_EQU)
+SSE_HELPER_CMP(cmpngeq, FPU_CMPQ, !FPU_GE)
+SSE_HELPER_CMP(cmpngtq, FPU_CMPQ, !FPU_GT)
+SSE_HELPER_CMP(cmpfalses, FPU_CMPS,  FPU_FALSE)
+SSE_HELPER_CMP(cmpnequs, FPU_CMPS, !FPU_EQU)
+SSE_HELPER_CMP(cmpgeq, FPU_CMPQ, FPU_GE)
+SSE_HELPER_CMP(cmpgtq, FPU_CMPQ, FPU_GT)
+SSE_HELPER_CMP(cmptrues, FPU_CMPS,  !FPU_FALSE)
 
 #if SHIFT == 1
 DEF_HELPER_3(ucomiss, void, env, Reg, Reg)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 63b32a77e3..64f026c0af 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3021,20 +3021,47 @@ static const SSEFunc_l_ep sse_op_table3bq[] = {
 };
 #endif
 
-#define SSE_FOP(x) { \
+#define SSE_CMP(x) { \
     gen_helper_ ## x ## ps ## _xmm, gen_helper_ ## x ## pd ## _xmm, \
     gen_helper_ ## x ## ss, gen_helper_ ## x ## sd}
-static const SSEFunc_0_epp sse_op_table4[8][4] = {
-    SSE_FOP(cmpeq),
-    SSE_FOP(cmplt),
-    SSE_FOP(cmple),
-    SSE_FOP(cmpunord),
-    SSE_FOP(cmpneq),
-    SSE_FOP(cmpnlt),
-    SSE_FOP(cmpnle),
-    SSE_FOP(cmpord),
+static const SSEFunc_0_epp sse_op_table4[32][4] = {
+    SSE_CMP(cmpeq),
+    SSE_CMP(cmplt),
+    SSE_CMP(cmple),
+    SSE_CMP(cmpunord),
+    SSE_CMP(cmpneq),
+    SSE_CMP(cmpnlt),
+    SSE_CMP(cmpnle),
+    SSE_CMP(cmpord),
+
+    SSE_CMP(cmpequ),
+    SSE_CMP(cmpnge),
+    SSE_CMP(cmpngt),
+    SSE_CMP(cmpfalse),
+    SSE_CMP(cmpnequ),
+    SSE_CMP(cmpge),
+    SSE_CMP(cmpgt),
+    SSE_CMP(cmptrue),
+
+    SSE_CMP(cmpeqs),
+    SSE_CMP(cmpltq),
+    SSE_CMP(cmpleq),
+    SSE_CMP(cmpunords),
+    SSE_CMP(cmpneqq),
+    SSE_CMP(cmpnltq),
+    SSE_CMP(cmpnleq),
+    SSE_CMP(cmpords),
+
+    SSE_CMP(cmpequs),
+    SSE_CMP(cmpngeq),
+    SSE_CMP(cmpngtq),
+    SSE_CMP(cmpfalses),
+    SSE_CMP(cmpnequs),
+    SSE_CMP(cmpgeq),
+    SSE_CMP(cmpgtq),
+    SSE_CMP(cmptrues),
 };
-#undef SSE_FOP
+#undef SSE_CMP
 
 static const SSEFunc_0_epp sse_op_table5[256] = {
     [0x0c] = gen_helper_pi2fw,
-- 
2.36.0


