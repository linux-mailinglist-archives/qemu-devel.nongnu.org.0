Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C398650D5C9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:34:49 +0200 (CEST)
Received: from localhost ([::1]:36334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikoa-0008Hx-Tb
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikV7-0004W9-5G
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:14:41 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikV4-00030N-RI
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:14:40 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJ7-0001ea-RZ; Sun, 24 Apr 2022 23:02:17 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 15/42] i386: Floating point atithmetic helper AVX prep
Date: Sun, 24 Apr 2022 23:01:37 +0100
Message-Id: <20220424220204.2493824-16-paul@nowt.org>
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

Prepare the "easy" floating point vector helpers for AVX

No functional changes to existing helpers.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h | 144 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 119 insertions(+), 25 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index fc8fd57aa5..d308a1ec40 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -762,40 +762,66 @@ void glue(helper_pshufhw, SUFFIX)(Reg *d, Reg *s, int order)
 }
 #endif
 
-#if SHIFT == 1
+#if SHIFT >= 1
 /* FPU ops */
 /* XXX: not accurate */
 
-#define SSE_HELPER_S(name, F)                                           \
-    void glue(helper_ ## name ## ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)\
+#define SSE_HELPER_P(name, F)                                           \
+    void glue(helper_ ## name ## ps, SUFFIX)(CPUX86State *env,          \
+            Reg *d, Reg *s)                                     \
     {                                                                   \
-        d->ZMM_S(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
-        d->ZMM_S(1) = F(32, d->ZMM_S(1), s->ZMM_S(1));                  \
-        d->ZMM_S(2) = F(32, d->ZMM_S(2), s->ZMM_S(2));                  \
-        d->ZMM_S(3) = F(32, d->ZMM_S(3), s->ZMM_S(3));                  \
+        Reg *v = d;                                                     \
+        d->ZMM_S(0) = F(32, v->ZMM_S(0), s->ZMM_S(0));                  \
+        d->ZMM_S(1) = F(32, v->ZMM_S(1), s->ZMM_S(1));                  \
+        d->ZMM_S(2) = F(32, v->ZMM_S(2), s->ZMM_S(2));                  \
+        d->ZMM_S(3) = F(32, v->ZMM_S(3), s->ZMM_S(3));                  \
+        YMM_ONLY(                                                       \
+        d->ZMM_S(4) = F(32, v->ZMM_S(4), s->ZMM_S(4));                  \
+        d->ZMM_S(5) = F(32, v->ZMM_S(5), s->ZMM_S(5));                  \
+        d->ZMM_S(6) = F(32, v->ZMM_S(6), s->ZMM_S(6));                  \
+        d->ZMM_S(7) = F(32, v->ZMM_S(7), s->ZMM_S(7));                  \
+        )                                                               \
     }                                                                   \
                                                                         \
-    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *s)        \
+    void glue(helper_ ## name ## pd, SUFFIX)(CPUX86State *env,          \
+            Reg *d, Reg *s)                                     \
     {                                                                   \
-        d->ZMM_S(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
-    }                                                                   \
+        Reg *v = d;                                                     \
+        d->ZMM_D(0) = F(64, v->ZMM_D(0), s->ZMM_D(0));                  \
+        d->ZMM_D(1) = F(64, v->ZMM_D(1), s->ZMM_D(1));                  \
+        YMM_ONLY(                                                       \
+        d->ZMM_D(2) = F(64, v->ZMM_D(2), s->ZMM_D(2));                  \
+        d->ZMM_D(3) = F(64, v->ZMM_D(3), s->ZMM_D(3));                  \
+        )                                                               \
+    }
+
+#if SHIFT == 1
+
+#define SSE_HELPER_S(name, F)                                           \
+    SSE_HELPER_P(name, F)                                               \
                                                                         \
-    void glue(helper_ ## name ## pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)\
+    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *s)\
     {                                                                   \
-        d->ZMM_D(0) = F(64, d->ZMM_D(0), s->ZMM_D(0));                  \
-        d->ZMM_D(1) = F(64, d->ZMM_D(1), s->ZMM_D(1));                  \
+        Reg *v = d;                                                     \
+        d->ZMM_S(0) = F(32, v->ZMM_S(0), s->ZMM_S(0));                  \
     }                                                                   \
                                                                         \
-    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *s)        \
+    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *s)\
     {                                                                   \
-        d->ZMM_D(0) = F(64, d->ZMM_D(0), s->ZMM_D(0));                  \
+        Reg *v = d;                                                     \
+        d->ZMM_D(0) = F(64, v->ZMM_D(0), s->ZMM_D(0));                  \
     }
 
+#else
+
+#define SSE_HELPER_S(name, F) SSE_HELPER_P(name, F)
+
+#endif
+
 #define FPU_ADD(size, a, b) float ## size ## _add(a, b, &env->sse_status)
 #define FPU_SUB(size, a, b) float ## size ## _sub(a, b, &env->sse_status)
 #define FPU_MUL(size, a, b) float ## size ## _mul(a, b, &env->sse_status)
 #define FPU_DIV(size, a, b) float ## size ## _div(a, b, &env->sse_status)
-#define FPU_SQRT(size, a, b) float ## size ## _sqrt(b, &env->sse_status)
 
 /* Note that the choice of comparison op here is important to get the
  * special cases right: for min and max Intel specifies that (-0,0),
@@ -812,8 +838,42 @@ SSE_HELPER_S(mul, FPU_MUL)
 SSE_HELPER_S(div, FPU_DIV)
 SSE_HELPER_S(min, FPU_MIN)
 SSE_HELPER_S(max, FPU_MAX)
-SSE_HELPER_S(sqrt, FPU_SQRT)
 
+void glue(helper_sqrtps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    d->ZMM_S(0) = float32_sqrt(s->ZMM_S(0), &env->sse_status);
+    d->ZMM_S(1) = float32_sqrt(s->ZMM_S(1), &env->sse_status);
+    d->ZMM_S(2) = float32_sqrt(s->ZMM_S(2), &env->sse_status);
+    d->ZMM_S(3) = float32_sqrt(s->ZMM_S(3), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_S(4) = float32_sqrt(s->ZMM_S(4), &env->sse_status);
+    d->ZMM_S(5) = float32_sqrt(s->ZMM_S(5), &env->sse_status);
+    d->ZMM_S(6) = float32_sqrt(s->ZMM_S(6), &env->sse_status);
+    d->ZMM_S(7) = float32_sqrt(s->ZMM_S(7), &env->sse_status);
+#endif
+}
+
+void glue(helper_sqrtpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    d->ZMM_D(0) = float64_sqrt(s->ZMM_D(0), &env->sse_status);
+    d->ZMM_D(1) = float64_sqrt(s->ZMM_D(1), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_D(2) = float64_sqrt(s->ZMM_D(2), &env->sse_status);
+    d->ZMM_D(3) = float64_sqrt(s->ZMM_D(3), &env->sse_status);
+#endif
+}
+
+#if SHIFT == 1
+void helper_sqrtss(CPUX86State *env, Reg *d, Reg *s)
+{
+    d->ZMM_S(0) = float32_sqrt(s->ZMM_S(0), &env->sse_status);
+}
+
+void helper_sqrtsd(CPUX86State *env, Reg *d, Reg *s)
+{
+    d->ZMM_D(0) = float64_sqrt(s->ZMM_D(0), &env->sse_status);
+}
+#endif
 
 /* float to float conversions */
 void glue(helper_cvtps2pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
@@ -1043,6 +1103,20 @@ void glue(helper_rsqrtps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     d->ZMM_S(3) = float32_div(float32_one,
                               float32_sqrt(s->ZMM_S(3), &env->sse_status),
                               &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_S(4) = float32_div(float32_one,
+                              float32_sqrt(s->ZMM_S(4), &env->sse_status),
+                              &env->sse_status);
+    d->ZMM_S(5) = float32_div(float32_one,
+                              float32_sqrt(s->ZMM_S(5), &env->sse_status),
+                              &env->sse_status);
+    d->ZMM_S(6) = float32_div(float32_one,
+                              float32_sqrt(s->ZMM_S(6), &env->sse_status),
+                              &env->sse_status);
+    d->ZMM_S(7) = float32_div(float32_one,
+                              float32_sqrt(s->ZMM_S(7), &env->sse_status),
+                              &env->sse_status);
+#endif
     set_float_exception_flags(old_flags, &env->sse_status);
 }
 
@@ -1062,6 +1136,12 @@ void glue(helper_rcpps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     d->ZMM_S(1) = float32_div(float32_one, s->ZMM_S(1), &env->sse_status);
     d->ZMM_S(2) = float32_div(float32_one, s->ZMM_S(2), &env->sse_status);
     d->ZMM_S(3) = float32_div(float32_one, s->ZMM_S(3), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_S(4) = float32_div(float32_one, s->ZMM_S(4), &env->sse_status);
+    d->ZMM_S(5) = float32_div(float32_one, s->ZMM_S(5), &env->sse_status);
+    d->ZMM_S(6) = float32_div(float32_one, s->ZMM_S(6), &env->sse_status);
+    d->ZMM_S(7) = float32_div(float32_one, s->ZMM_S(7), &env->sse_status);
+#endif
     set_float_exception_flags(old_flags, &env->sse_status);
 }
 
@@ -1156,18 +1236,30 @@ void glue(helper_hsubpd, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     MOVE(*d, r);
 }
 
-void glue(helper_addsubps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_addsubps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    d->ZMM_S(0) = float32_sub(d->ZMM_S(0), s->ZMM_S(0), &env->sse_status);
-    d->ZMM_S(1) = float32_add(d->ZMM_S(1), s->ZMM_S(1), &env->sse_status);
-    d->ZMM_S(2) = float32_sub(d->ZMM_S(2), s->ZMM_S(2), &env->sse_status);
-    d->ZMM_S(3) = float32_add(d->ZMM_S(3), s->ZMM_S(3), &env->sse_status);
+    Reg *v = d;
+    d->ZMM_S(0) = float32_sub(v->ZMM_S(0), s->ZMM_S(0), &env->sse_status);
+    d->ZMM_S(1) = float32_add(v->ZMM_S(1), s->ZMM_S(1), &env->sse_status);
+    d->ZMM_S(2) = float32_sub(v->ZMM_S(2), s->ZMM_S(2), &env->sse_status);
+    d->ZMM_S(3) = float32_add(v->ZMM_S(3), s->ZMM_S(3), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_S(4) = float32_sub(v->ZMM_S(4), s->ZMM_S(4), &env->sse_status);
+    d->ZMM_S(5) = float32_add(v->ZMM_S(5), s->ZMM_S(5), &env->sse_status);
+    d->ZMM_S(6) = float32_sub(v->ZMM_S(6), s->ZMM_S(6), &env->sse_status);
+    d->ZMM_S(7) = float32_add(v->ZMM_S(7), s->ZMM_S(7), &env->sse_status);
+#endif
 }
 
-void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    d->ZMM_D(0) = float64_sub(d->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
-    d->ZMM_D(1) = float64_add(d->ZMM_D(1), s->ZMM_D(1), &env->sse_status);
+    Reg *v = d;
+    d->ZMM_D(0) = float64_sub(v->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
+    d->ZMM_D(1) = float64_add(v->ZMM_D(1), s->ZMM_D(1), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_D(2) = float64_sub(v->ZMM_D(2), s->ZMM_D(2), &env->sse_status);
+    d->ZMM_D(3) = float64_add(v->ZMM_D(3), s->ZMM_D(3), &env->sse_status);
+#endif
 }
 
 /* XXX: unordered */
@@ -2694,6 +2786,8 @@ void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 }
 #endif
 
+#undef SSE_HELPER_S
+
 #undef SHIFT
 #undef XMM_ONLY
 #undef YMM_ONLY
-- 
2.36.0


