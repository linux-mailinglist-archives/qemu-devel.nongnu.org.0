Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC5D50D5A8
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:19:07 +0200 (CEST)
Received: from localhost ([::1]:47456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikZN-0002Eu-5K
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikSd-0001eC-6S
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:12:08 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikSb-0002oz-2d
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:12:06 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJ6-0001ea-Uk; Sun, 24 Apr 2022 23:02:16 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 11/42] i386: Rewrite simple integer vector helpers
Date: Sun, 24 Apr 2022 23:01:33 +0100
Message-Id: <20220424220204.2493824-12-paul@nowt.org>
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

Rewrite the "simple" vector integer helpers in preperation for AVX support.

While the current code is able to use the same prototype for unary
(a = F(b)) and binary (a = F(b, c)) operations, future changes will cause
them to diverge.

No functional changes to existing helpers

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h | 180 ++++++++++++++++++++++++++++++++----------
 1 file changed, 137 insertions(+), 43 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 9297c96d04..bb9cbf9ead 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -275,61 +275,148 @@ void glue(helper_pslldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 }
 #endif
 
-#define SSE_HELPER_B(name, F)                                   \
+#define SSE_HELPER_1(name, elem, num, F)                                   \
     void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
     {                                                           \
-        d->B(0) = F(d->B(0), s->B(0));                          \
-        d->B(1) = F(d->B(1), s->B(1));                          \
-        d->B(2) = F(d->B(2), s->B(2));                          \
-        d->B(3) = F(d->B(3), s->B(3));                          \
-        d->B(4) = F(d->B(4), s->B(4));                          \
-        d->B(5) = F(d->B(5), s->B(5));                          \
-        d->B(6) = F(d->B(6), s->B(6));                          \
-        d->B(7) = F(d->B(7), s->B(7));                          \
+        d->elem(0) = F(s->elem(0));                             \
+        d->elem(1) = F(s->elem(1));                             \
+        if ((num << SHIFT) > 2) {                               \
+            d->elem(2) = F(s->elem(2));                         \
+            d->elem(3) = F(s->elem(3));                         \
+        }                                                       \
+        if ((num << SHIFT) > 4) {                               \
+            d->elem(4) = F(s->elem(4));                         \
+            d->elem(5) = F(s->elem(5));                         \
+            d->elem(6) = F(s->elem(6));                         \
+            d->elem(7) = F(s->elem(7));                         \
+        }                                                       \
+        if ((num << SHIFT) > 8) {                               \
+            d->elem(8) = F(s->elem(8));                         \
+            d->elem(9) = F(s->elem(9));                         \
+            d->elem(10) = F(s->elem(10));                       \
+            d->elem(11) = F(s->elem(11));                       \
+            d->elem(12) = F(s->elem(12));                       \
+            d->elem(13) = F(s->elem(13));                       \
+            d->elem(14) = F(s->elem(14));                       \
+            d->elem(15) = F(s->elem(15));                       \
+        }                                                       \
+        if ((num << SHIFT) > 16) {                              \
+            d->elem(16) = F(s->elem(16));                       \
+            d->elem(17) = F(s->elem(17));                       \
+            d->elem(18) = F(s->elem(18));                       \
+            d->elem(19) = F(s->elem(19));                       \
+            d->elem(20) = F(s->elem(20));                       \
+            d->elem(21) = F(s->elem(21));                       \
+            d->elem(22) = F(s->elem(22));                       \
+            d->elem(23) = F(s->elem(23));                       \
+            d->elem(24) = F(s->elem(24));                       \
+            d->elem(25) = F(s->elem(25));                       \
+            d->elem(26) = F(s->elem(26));                       \
+            d->elem(27) = F(s->elem(27));                       \
+            d->elem(28) = F(s->elem(28));                       \
+            d->elem(29) = F(s->elem(29));                       \
+            d->elem(30) = F(s->elem(30));                       \
+            d->elem(31) = F(s->elem(31));                       \
+        }                                                       \
+    }
+
+#define SSE_HELPER_B(name, F)                                   \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+    {                                                           \
+        Reg *v = d;                                             \
+        d->B(0) = F(v->B(0), s->B(0));                          \
+        d->B(1) = F(v->B(1), s->B(1));                          \
+        d->B(2) = F(v->B(2), s->B(2));                          \
+        d->B(3) = F(v->B(3), s->B(3));                          \
+        d->B(4) = F(v->B(4), s->B(4));                          \
+        d->B(5) = F(v->B(5), s->B(5));                          \
+        d->B(6) = F(v->B(6), s->B(6));                          \
+        d->B(7) = F(v->B(7), s->B(7));                          \
         XMM_ONLY(                                               \
-                 d->B(8) = F(d->B(8), s->B(8));                 \
-                 d->B(9) = F(d->B(9), s->B(9));                 \
-                 d->B(10) = F(d->B(10), s->B(10));              \
-                 d->B(11) = F(d->B(11), s->B(11));              \
-                 d->B(12) = F(d->B(12), s->B(12));              \
-                 d->B(13) = F(d->B(13), s->B(13));              \
-                 d->B(14) = F(d->B(14), s->B(14));              \
-                 d->B(15) = F(d->B(15), s->B(15));              \
+                 d->B(8) = F(v->B(8), s->B(8));                 \
+                 d->B(9) = F(v->B(9), s->B(9));                 \
+                 d->B(10) = F(v->B(10), s->B(10));              \
+                 d->B(11) = F(v->B(11), s->B(11));              \
+                 d->B(12) = F(v->B(12), s->B(12));              \
+                 d->B(13) = F(v->B(13), s->B(13));              \
+                 d->B(14) = F(v->B(14), s->B(14));              \
+                 d->B(15) = F(v->B(15), s->B(15));              \
+                                                        )       \
+        YMM_ONLY(                                               \
+                 d->B(16) = F(v->B(16), s->B(16));              \
+                 d->B(17) = F(v->B(17), s->B(17));              \
+                 d->B(18) = F(v->B(18), s->B(18));              \
+                 d->B(19) = F(v->B(19), s->B(19));              \
+                 d->B(20) = F(v->B(20), s->B(20));              \
+                 d->B(21) = F(v->B(21), s->B(21));              \
+                 d->B(22) = F(v->B(22), s->B(22));              \
+                 d->B(23) = F(v->B(23), s->B(23));              \
+                 d->B(24) = F(v->B(24), s->B(24));              \
+                 d->B(25) = F(v->B(25), s->B(25));              \
+                 d->B(26) = F(v->B(26), s->B(26));              \
+                 d->B(27) = F(v->B(27), s->B(27));              \
+                 d->B(28) = F(v->B(28), s->B(28));              \
+                 d->B(29) = F(v->B(29), s->B(29));              \
+                 d->B(30) = F(v->B(30), s->B(30));              \
+                 d->B(31) = F(v->B(31), s->B(31));              \
                                                         )       \
             }
 
 #define SSE_HELPER_W(name, F)                                   \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
     {                                                           \
-        d->W(0) = F(d->W(0), s->W(0));                          \
-        d->W(1) = F(d->W(1), s->W(1));                          \
-        d->W(2) = F(d->W(2), s->W(2));                          \
-        d->W(3) = F(d->W(3), s->W(3));                          \
+        Reg *v = d;                                             \
+        d->W(0) = F(v->W(0), s->W(0));                          \
+        d->W(1) = F(v->W(1), s->W(1));                          \
+        d->W(2) = F(v->W(2), s->W(2));                          \
+        d->W(3) = F(v->W(3), s->W(3));                          \
         XMM_ONLY(                                               \
-                 d->W(4) = F(d->W(4), s->W(4));                 \
-                 d->W(5) = F(d->W(5), s->W(5));                 \
-                 d->W(6) = F(d->W(6), s->W(6));                 \
-                 d->W(7) = F(d->W(7), s->W(7));                 \
+                 d->W(4) = F(v->W(4), s->W(4));                 \
+                 d->W(5) = F(v->W(5), s->W(5));                 \
+                 d->W(6) = F(v->W(6), s->W(6));                 \
+                 d->W(7) = F(v->W(7), s->W(7));                 \
+                                                        )       \
+        YMM_ONLY(                                               \
+                 d->W(8) = F(v->W(8), s->W(8));                 \
+                 d->W(9) = F(v->W(9), s->W(9));                 \
+                 d->W(10) = F(v->W(10), s->W(10));              \
+                 d->W(11) = F(v->W(11), s->W(11));              \
+                 d->W(12) = F(v->W(12), s->W(12));              \
+                 d->W(13) = F(v->W(13), s->W(13));              \
+                 d->W(14) = F(v->W(14), s->W(14));              \
+                 d->W(15) = F(v->W(15), s->W(15));              \
                                                         )       \
             }
 
 #define SSE_HELPER_L(name, F)                                   \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
     {                                                           \
-        d->L(0) = F(d->L(0), s->L(0));                          \
-        d->L(1) = F(d->L(1), s->L(1));                          \
+        Reg *v = d;                                             \
+        d->L(0) = F(v->L(0), s->L(0));                          \
+        d->L(1) = F(v->L(1), s->L(1));                          \
         XMM_ONLY(                                               \
-                 d->L(2) = F(d->L(2), s->L(2));                 \
-                 d->L(3) = F(d->L(3), s->L(3));                 \
+                 d->L(2) = F(v->L(2), s->L(2));                 \
+                 d->L(3) = F(v->L(3), s->L(3));                 \
+                                                        )       \
+        YMM_ONLY(                                               \
+                 d->L(4) = F(v->L(4), s->L(4));                 \
+                 d->L(5) = F(v->L(5), s->L(5));                 \
+                 d->L(6) = F(v->L(6), s->L(6));                 \
+                 d->L(7) = F(v->L(7), s->L(7));                 \
                                                         )       \
             }
 
 #define SSE_HELPER_Q(name, F)                                   \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
     {                                                           \
-        d->Q(0) = F(d->Q(0), s->Q(0));                          \
+        Reg *v = d;                                             \
+        d->Q(0) = F(v->Q(0), s->Q(0));                          \
         XMM_ONLY(                                               \
-                 d->Q(1) = F(d->Q(1), s->Q(1));                 \
+                 d->Q(1) = F(v->Q(1), s->Q(1));                 \
+                                                        )       \
+        YMM_ONLY(                                               \
+                 d->Q(2) = F(v->Q(2), s->Q(2));                 \
+                 d->Q(3) = F(v->Q(3), s->Q(3));                 \
                                                         )       \
             }
 
@@ -452,12 +539,19 @@ SSE_HELPER_W(helper_pcmpeqw, FCMPEQ)
 SSE_HELPER_L(helper_pcmpeql, FCMPEQ)
 
 SSE_HELPER_W(helper_pmullw, FMULLW)
-#if SHIFT == 0
-SSE_HELPER_W(helper_pmulhrw, FMULHRW)
-#endif
 SSE_HELPER_W(helper_pmulhuw, FMULHUW)
 SSE_HELPER_W(helper_pmulhw, FMULHW)
 
+#if SHIFT == 0
+void glue(helper_pmulhrw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    d->W(0) = FMULHRW(d->W(0), s->W(0));
+    d->W(1) = FMULHRW(d->W(1), s->W(1));
+    d->W(2) = FMULHRW(d->W(2), s->W(2));
+    d->W(3) = FMULHRW(d->W(3), s->W(3));
+}
+#endif
+
 SSE_HELPER_B(helper_pavgb, FAVG)
 SSE_HELPER_W(helper_pavgw, FAVG)
 
@@ -1581,12 +1675,12 @@ void glue(helper_phsubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     XMM_ONLY(d->W(7) = satsw((int16_t)s->W(6) - (int16_t)s->W(7)));
 }
 
-#define FABSB(_, x) (x > INT8_MAX  ? -(int8_t)x : x)
-#define FABSW(_, x) (x > INT16_MAX ? -(int16_t)x : x)
-#define FABSL(_, x) (x > INT32_MAX ? -(int32_t)x : x)
-SSE_HELPER_B(helper_pabsb, FABSB)
-SSE_HELPER_W(helper_pabsw, FABSW)
-SSE_HELPER_L(helper_pabsd, FABSL)
+#define FABSB(x) (x > INT8_MAX  ? -(int8_t)x : x)
+#define FABSW(x) (x > INT16_MAX ? -(int16_t)x : x)
+#define FABSL(x) (x > INT32_MAX ? -(int32_t)x : x)
+SSE_HELPER_1(helper_pabsb, B, 8, FABSB)
+SSE_HELPER_1(helper_pabsw, W, 4, FABSW)
+SSE_HELPER_1(helper_pabsd, L, 2, FABSL)
 
 #define FMULHRSW(d, s) (((int16_t) d * (int16_t)s + 0x4000) >> 15)
 SSE_HELPER_W(helper_pmulhrsw, FMULHRSW)
-- 
2.36.0


