Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A29950D5C7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:33:10 +0200 (CEST)
Received: from localhost ([::1]:58950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikmz-0004Vl-6K
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikSZ-0001Ys-4M
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:12:03 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikSU-0002oR-OY
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:12:02 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJ9-0001ea-Rk; Sun, 24 Apr 2022 23:02:19 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 25/42] i386: VEX.V encodings (3 operand)
Date: Sun, 24 Apr 2022 23:01:47 +0100
Message-Id: <20220424220204.2493824-26-paul@nowt.org>
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

Enable translation of VEX encoded AVX instructions.

The big change is the addition of an additional register operand in the VEX.V
field.  This is usually (but not always!) used to explictly encode the
first source operand.

The changes to ops_sse.h and ops_sse_header.h are purely mechanical, with
pervious changes ensuring that the relevant helper functions are ready to
handle the non destructive source operand.

We now have a grater variety of operand patterns for the vector helper
functions. The SSE_OPF_* flags we added to the opcode lookup tables are used
to select between these. This includes e.g. pshufX and cmpX instructions
which were previously overriden by opcode.

One gotcha is the "scalar" vector instructions. The SSE encodings write a
single element to the destination and leave the remainder of the register
unchanged.  The VEX encodings which copy the remainder of the destination from
first source operand. If the operation only has a single source value,
then the VEX.V encodes an additional operand from which is coped to the
the remainder of destination.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h        | 214 +++++++++----------
 target/i386/ops_sse_header.h | 149 ++++++-------
 target/i386/tcg/translate.c  | 399 +++++++++++++++++++++++++----------
 3 files changed, 463 insertions(+), 299 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index e48dfc2fc5..ad3312d353 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -97,9 +97,8 @@
 #define FPSLL(x, c) ((x) << shift)
 #endif
 
-void glue(helper_psrlw, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+void glue(helper_psrlw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
-    Reg *s = d;
     int shift;
     if (c->Q(0) > 15) {
         d->Q(0) = 0;
@@ -114,9 +113,8 @@ void glue(helper_psrlw, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
     }
 }
 
-void glue(helper_psllw, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+void glue(helper_psllw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
-    Reg *s = d;
     int shift;
     if (c->Q(0) > 15) {
         d->Q(0) = 0;
@@ -131,9 +129,8 @@ void glue(helper_psllw, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
     }
 }
 
-void glue(helper_psraw, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+void glue(helper_psraw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
-    Reg *s = d;
     int shift;
     if (c->Q(0) > 15) {
         shift = 15;
@@ -143,9 +140,8 @@ void glue(helper_psraw, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
     SHIFT_HELPER_BODY(4 << SHIFT, W, FPSRAW);
 }
 
-void glue(helper_psrld, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+void glue(helper_psrld, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
-    Reg *s = d;
     int shift;
     if (c->Q(0) > 31) {
         d->Q(0) = 0;
@@ -160,9 +156,8 @@ void glue(helper_psrld, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
     }
 }
 
-void glue(helper_pslld, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+void glue(helper_pslld, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
-    Reg *s = d;
     int shift;
     if (c->Q(0) > 31) {
         d->Q(0) = 0;
@@ -177,9 +172,8 @@ void glue(helper_pslld, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
     }
 }
 
-void glue(helper_psrad, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+void glue(helper_psrad, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
-    Reg *s = d;
     int shift;
     if (c->Q(0) > 31) {
         shift = 31;
@@ -189,9 +183,8 @@ void glue(helper_psrad, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
     SHIFT_HELPER_BODY(2 << SHIFT, L, FPSRAL);
 }
 
-void glue(helper_psrlq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+void glue(helper_psrlq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
-    Reg *s = d;
     int shift;
     if (c->Q(0) > 63) {
         d->Q(0) = 0;
@@ -206,9 +199,8 @@ void glue(helper_psrlq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
     }
 }
 
-void glue(helper_psllq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+void glue(helper_psllq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
-    Reg *s = d;
     int shift;
     if (c->Q(0) > 63) {
         d->Q(0) = 0;
@@ -224,9 +216,8 @@ void glue(helper_psllq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 }
 
 #if SHIFT >= 1
-void glue(helper_psrldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+void glue(helper_psrldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
-    Reg *s = d;
     int shift, i;
 
     shift = c->L(0);
@@ -249,9 +240,8 @@ void glue(helper_psrldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 #endif
 }
 
-void glue(helper_pslldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+void glue(helper_pslldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
-    Reg *s = d;
     int shift, i;
 
     shift = c->L(0);
@@ -321,9 +311,8 @@ void glue(helper_pslldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
     }
 
 #define SSE_HELPER_B(name, F)                                   \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s) \
     {                                                           \
-        Reg *v = d;                                             \
         d->B(0) = F(v->B(0), s->B(0));                          \
         d->B(1) = F(v->B(1), s->B(1));                          \
         d->B(2) = F(v->B(2), s->B(2));                          \
@@ -363,9 +352,8 @@ void glue(helper_pslldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
             }
 
 #define SSE_HELPER_W(name, F)                                   \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s) \
     {                                                           \
-        Reg *v = d;                                             \
         d->W(0) = F(v->W(0), s->W(0));                          \
         d->W(1) = F(v->W(1), s->W(1));                          \
         d->W(2) = F(v->W(2), s->W(2));                          \
@@ -389,9 +377,8 @@ void glue(helper_pslldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
             }
 
 #define SSE_HELPER_L(name, F)                                   \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s) \
     {                                                           \
-        Reg *v = d;                                             \
         d->L(0) = F(v->L(0), s->L(0));                          \
         d->L(1) = F(v->L(1), s->L(1));                          \
         XMM_ONLY(                                               \
@@ -407,9 +394,8 @@ void glue(helper_pslldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
             }
 
 #define SSE_HELPER_Q(name, F)                                   \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s) \
     {                                                           \
-        Reg *v = d;                                             \
         d->Q(0) = F(v->Q(0), s->Q(0));                          \
         XMM_ONLY(                                               \
                  d->Q(1) = F(v->Q(1), s->Q(1));                 \
@@ -555,9 +541,8 @@ void glue(helper_pmulhrw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 SSE_HELPER_B(helper_pavgb, FAVG)
 SSE_HELPER_W(helper_pavgw, FAVG)
 
-void glue(helper_pmuludq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_pmuludq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     d->Q(0) = (uint64_t)s->L(0) * (uint64_t)v->L(0);
 #if SHIFT >= 1
     d->Q(1) = (uint64_t)s->L(2) * (uint64_t)v->L(2);
@@ -568,9 +553,8 @@ void glue(helper_pmuludq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 #endif
 }
 
-void glue(helper_pmaddwd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_pmaddwd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     int i;
 
     for (i = 0; i < (2 << SHIFT); i++) {
@@ -589,10 +573,8 @@ static inline int abs1(int a)
     }
 }
 #endif
-
-void glue(helper_psadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_psadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     unsigned int val;
 
     val = 0;
@@ -701,9 +683,8 @@ void glue(helper_pshufw, SUFFIX)(Reg *d, Reg *s, int order)
     SHUFFLE4(W, s, s, 0);
 }
 #else
-void glue(helper_shufps, SUFFIX)(Reg *d, Reg *s, int order)
+void glue(helper_shufps, SUFFIX)(Reg *d, Reg *v, Reg *s, int order)
 {
-    Reg *v = d;
     uint32_t r0, r1, r2, r3;
 
     SHUFFLE4(L, v, s, 0);
@@ -712,9 +693,8 @@ void glue(helper_shufps, SUFFIX)(Reg *d, Reg *s, int order)
 #endif
 }
 
-void glue(helper_shufpd, SUFFIX)(Reg *d, Reg *s, int order)
+void glue(helper_shufpd, SUFFIX)(Reg *d, Reg *v, Reg *s, int order)
 {
-    Reg *v = d;
     uint64_t r0, r1;
 
     r0 = v->Q(order & 1);
@@ -770,9 +750,8 @@ void glue(helper_pshufhw, SUFFIX)(Reg *d, Reg *s, int order)
 
 #define SSE_HELPER_P(name, F)                                           \
     void glue(helper_ ## name ## ps, SUFFIX)(CPUX86State *env,          \
-            Reg *d, Reg *s)                                     \
+            Reg *d, Reg *v, Reg *s)                                     \
     {                                                                   \
-        Reg *v = d;                                                     \
         d->ZMM_S(0) = F(32, v->ZMM_S(0), s->ZMM_S(0));                  \
         d->ZMM_S(1) = F(32, v->ZMM_S(1), s->ZMM_S(1));                  \
         d->ZMM_S(2) = F(32, v->ZMM_S(2), s->ZMM_S(2));                  \
@@ -786,9 +765,8 @@ void glue(helper_pshufhw, SUFFIX)(Reg *d, Reg *s, int order)
     }                                                                   \
                                                                         \
     void glue(helper_ ## name ## pd, SUFFIX)(CPUX86State *env,          \
-            Reg *d, Reg *s)                                     \
+            Reg *d, Reg *v, Reg *s)                                     \
     {                                                                   \
-        Reg *v = d;                                                     \
         d->ZMM_D(0) = F(64, v->ZMM_D(0), s->ZMM_D(0));                  \
         d->ZMM_D(1) = F(64, v->ZMM_D(1), s->ZMM_D(1));                  \
         YMM_ONLY(                                                       \
@@ -802,15 +780,13 @@ void glue(helper_pshufhw, SUFFIX)(Reg *d, Reg *s, int order)
 #define SSE_HELPER_S(name, F)                                           \
     SSE_HELPER_P(name, F)                                               \
                                                                         \
-    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *s)\
+    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *v, Reg *s)\
     {                                                                   \
-        Reg *v = d;                                                     \
         d->ZMM_S(0) = F(32, v->ZMM_S(0), s->ZMM_S(0));                  \
     }                                                                   \
                                                                         \
-    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *s)\
+    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *v, Reg *s)\
     {                                                                   \
-        Reg *v = d;                                                     \
         d->ZMM_D(0) = F(64, v->ZMM_D(0), s->ZMM_D(0));                  \
     }
 
@@ -1284,9 +1260,8 @@ void helper_insertq_i(CPUX86State *env, ZMMReg *d, int index, int length)
 }
 #endif
 
-void glue(helper_haddps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_haddps, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     float32 r0, r1, r2, r3;
 
     r0 = float32_add(v->ZMM_S(0), v->ZMM_S(1), &env->sse_status);
@@ -1309,9 +1284,8 @@ void glue(helper_haddps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 #endif
 }
 
-void glue(helper_haddpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_haddpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     float64 r0, r1;
 
     r0 = float64_add(v->ZMM_D(0), v->ZMM_D(1), &env->sse_status);
@@ -1326,9 +1300,8 @@ void glue(helper_haddpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 #endif
 }
 
-void glue(helper_hsubps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_hsubps, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     float32 r0, r1, r2, r3;
 
     r0 = float32_sub(v->ZMM_S(0), v->ZMM_S(1), &env->sse_status);
@@ -1351,9 +1324,8 @@ void glue(helper_hsubps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 #endif
 }
 
-void glue(helper_hsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_hsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     float64 r0, r1;
 
     r0 = float64_sub(v->ZMM_D(0), v->ZMM_D(1), &env->sse_status);
@@ -1368,9 +1340,8 @@ void glue(helper_hsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 #endif
 }
 
-void glue(helper_addsubps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_addsubps, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     d->ZMM_S(0) = float32_sub(v->ZMM_S(0), s->ZMM_S(0), &env->sse_status);
     d->ZMM_S(1) = float32_add(v->ZMM_S(1), s->ZMM_S(1), &env->sse_status);
     d->ZMM_S(2) = float32_sub(v->ZMM_S(2), s->ZMM_S(2), &env->sse_status);
@@ -1383,9 +1354,8 @@ void glue(helper_addsubps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 #endif
 }
 
-void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     d->ZMM_D(0) = float64_sub(v->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
     d->ZMM_D(1) = float64_add(v->ZMM_D(1), s->ZMM_D(1), &env->sse_status);
 #if SHIFT == 2
@@ -1396,9 +1366,8 @@ void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 
 #define SSE_HELPER_CMP_P(name, F, C)                                    \
     void glue(helper_ ## name ## ps, SUFFIX)(CPUX86State *env,          \
-                                             Reg *d, Reg *s)    \
+                                             Reg *d, Reg *v, Reg *s)    \
     {                                                                   \
-        Reg *v = d;                                                     \
         d->ZMM_L(0) = F(32, C, v->ZMM_S(0), s->ZMM_S(0));               \
         d->ZMM_L(1) = F(32, C, v->ZMM_S(1), s->ZMM_S(1));               \
         d->ZMM_L(2) = F(32, C, v->ZMM_S(2), s->ZMM_S(2));               \
@@ -1412,9 +1381,8 @@ void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     }                                                                   \
                                                                         \
     void glue(helper_ ## name ## pd, SUFFIX)(CPUX86State *env,          \
-                                             Reg *d, Reg *s)    \
+                                             Reg *d, Reg *v, Reg *s)    \
     {                                                                   \
-        Reg *v = d;                                                     \
         d->ZMM_Q(0) = F(64, C, v->ZMM_D(0), s->ZMM_D(0));               \
         d->ZMM_Q(1) = F(64, C, v->ZMM_D(1), s->ZMM_D(1));               \
         YMM_ONLY(                                                       \
@@ -1426,15 +1394,13 @@ void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 #if SHIFT == 1
 #define SSE_HELPER_CMP(name, F, C)                                          \
     SSE_HELPER_CMP_P(name, F, C)                                            \
-    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *s)    \
+    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *v, Reg *s)    \
     {                                                                       \
-        Reg *v = d;                                                         \
         d->ZMM_L(0) = F(32, C, v->ZMM_S(0), s->ZMM_S(0));                   \
     }                                                                       \
                                                                             \
-    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *s)    \
+    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *v, Reg *s)    \
     {                                                                       \
-        Reg *v = d;                                                         \
         d->ZMM_Q(0) = F(64, C, v->ZMM_D(0), s->ZMM_D(0));                   \
     }
 
@@ -1633,9 +1599,44 @@ uint32_t glue(helper_pmovmskb, SUFFIX)(CPUX86State *env, Reg *s)
 #define PACK_WIDTH 8
 #endif
 
-void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+#define PACK4(F, to, reg, from) do {        \
+    r[to + 0] = F((int16_t)reg->W(from + 0));   \
+    r[to + 1] = F((int16_t)reg->W(from + 1));   \
+    r[to + 2] = F((int16_t)reg->W(from + 2));   \
+    r[to + 3] = F((int16_t)reg->W(from + 3));   \
+    } while (0)
+
+#define PACK_HELPER_B(name, F) \
+void glue(helper_pack ## name, SUFFIX)(CPUX86State *env, \
+        Reg *d, Reg *v, Reg *s)                 \
+{                                               \
+    uint8_t r[PACK_WIDTH * 2];                  \
+    int i;                                      \
+    PACK4(F, 0, v, 0);                          \
+    PACK4(F, PACK_WIDTH, s, 0);                 \
+    XMM_ONLY(                                   \
+        PACK4(F, 4, v, 4);                      \
+        PACK4(F, 12, s, 4);                     \
+        )                                       \
+    for (i = 0; i < PACK_WIDTH * 2; i++) {      \
+        d->B(i) = r[i];                         \
+    }                                           \
+    YMM_ONLY(                                   \
+        PACK4(F, 0, v, 8);                      \
+        PACK4(F, 4, v, 12);                     \
+        PACK4(F, 8, s, 8);                      \
+        PACK4(F, 12, s, 12);                    \
+        for (i = 0; i < 16; i++) {              \
+            d->B(i + 16) = r[i];                \
+        }                                       \
+        )                                       \
+}
+
+PACK_HELPER_B(sswb, satsb)
+PACK_HELPER_B(uswb, satub)
+
+void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     uint16_t r[PACK_WIDTH];
     int i;
 
@@ -1670,9 +1671,8 @@ void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 #define UNPCK_OP(base_name, base)                                       \
                                                                         \
     void glue(helper_punpck ## base_name ## bw, SUFFIX)(CPUX86State *env,\
-                                                Reg *d, Reg *s) \
+                                                Reg *d, Reg *v, Reg *s) \
     {                                                                   \
-        Reg *v = d;                                                     \
         uint8_t r[PACK_WIDTH * 2];                                      \
         int i;                                                          \
                                                                         \
@@ -1721,9 +1721,8 @@ void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     }                                                                   \
                                                                         \
     void glue(helper_punpck ## base_name ## wd, SUFFIX)(CPUX86State *env,\
-                                                Reg *d, Reg *s) \
+                                                Reg *d, Reg *v, Reg *s) \
     {                                                                   \
-        Reg *v = d;                                                     \
         uint16_t r[PACK_WIDTH];                                         \
         int i;                                                          \
                                                                         \
@@ -1756,9 +1755,8 @@ void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     }                                                                   \
                                                                         \
     void glue(helper_punpck ## base_name ## dq, SUFFIX)(CPUX86State *env,\
-                                                Reg *d, Reg *s) \
+                                                Reg *d, Reg *v, Reg *s) \
     {                                                                   \
-        Reg *v = d;                                                     \
         uint32_t r[4];                                                  \
                                                                         \
         r[0] = v->L((base * (PACK_WIDTH / 4)) + 0);                     \
@@ -1785,9 +1783,8 @@ void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
                                                                         \
     XMM_ONLY(                                                           \
              void glue(helper_punpck ## base_name ## qdq, SUFFIX)(      \
-                        CPUX86State *env, Reg *d, Reg *s)       \
+                        CPUX86State *env, Reg *d, Reg *v, Reg *s)       \
              {                                                          \
-                 Reg *v = d;                                            \
                  uint64_t r[2];                                         \
                                                                         \
                  r[0] = v->Q(base);                                     \
@@ -1961,9 +1958,8 @@ void helper_pswapd(CPUX86State *env, MMXReg *d, MMXReg *s)
 #endif
 
 /* SSSE3 op helpers */
-void glue(helper_pshufb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_pshufb, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     int i;
 #if SHIFT == 0
     uint8_t r[8];
@@ -1997,9 +1993,8 @@ void glue(helper_pshufb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 #if SHIFT == 0
 
 #define SSE_HELPER_HW(name, F)  \
-void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s) \
 {                               \
-    Reg *v = d;                 \
     uint16_t r[4];              \
     r[0] = F(v->W(0), v->W(1)); \
     r[1] = F(v->W(2), v->W(3)); \
@@ -2012,9 +2007,8 @@ void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
 }
 
 #define SSE_HELPER_HL(name, F)  \
-void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s) \
 {                               \
-    Reg *v = d;                 \
     uint32_t r0, r1;            \
     r0 = F(v->L(0), v->L(1));   \
     r1 = F(s->L(0), s->L(1));   \
@@ -2025,9 +2019,8 @@ void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
 #else
 
 #define SSE_HELPER_HW(name, F)  \
-void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s) \
 {                                   \
-    Reg *v = d;                     \
     int32_t r[8];                   \
     r[0] = F(v->W(0), v->W(1));     \
     r[1] = F(v->W(2), v->W(3));     \
@@ -2066,9 +2059,8 @@ void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
 }
 
 #define SSE_HELPER_HL(name, F)  \
-void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s) \
 {                               \
-    Reg *v = d;                 \
     int32_t r0, r1, r2, r3;     \
     r0 = F(v->L(0), v->L(1));   \
     r1 = F(v->L(2), v->L(3));   \
@@ -2101,9 +2093,8 @@ SSE_HELPER_HL(phsubd, FSUB)
 #undef SSE_HELPER_HW
 #undef SSE_HELPER_HL
 
-void glue(helper_pmaddubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_pmaddubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     d->W(0) = satsw((int8_t)s->B(0) * (uint8_t)v->B(0) +
                     (int8_t)s->B(1) * (uint8_t)v->B(1));
     d->W(1) = satsw((int8_t)s->B(2) * (uint8_t)v->B(2) +
@@ -2148,10 +2139,9 @@ SSE_HELPER_B(helper_psignb, FSIGNB)
 SSE_HELPER_W(helper_psignw, FSIGNW)
 SSE_HELPER_L(helper_psignd, FSIGNL)
 
-void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
                                   int32_t shift)
 {
-    Reg *v = d;
     /* XXX could be checked during translation */
     if (shift >= (SHIFT ? 32 : 16)) {
         d->Q(0) = 0;
@@ -2224,10 +2214,9 @@ void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     } while (0)
 
 #define SSE_HELPER_V(name, elem, num, F)                                \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,   \
+                            Reg *m)                                     \
     {                                                                   \
-        Reg *v = d;                                                     \
-        Reg *m = &env->xmm_regs[0];                                     \
         BLEND_V128(elem, num, F, 0);                                    \
         YMM_ONLY(BLEND_V128(elem, num, F, num);)                        \
     }
@@ -2248,10 +2237,9 @@ void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     } while (0)
 
 #define SSE_HELPER_I(name, elem, num, F)                                \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,   \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,   \
                             uint32_t imm)                               \
     {                                                                   \
-        Reg *v = d;                                                     \
         BLEND_I128(elem, num, F, 0);                                    \
         YMM_ONLY(                                                       \
         if (num < 8)                                                    \
@@ -2320,9 +2308,8 @@ SSE_HELPER_F(helper_pmovzxwd, L, 4, s->W)
 SSE_HELPER_F(helper_pmovzxwq, Q, 2, s->W)
 SSE_HELPER_F(helper_pmovzxdq, Q, 2, s->L)
 
-void glue(helper_pmuldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_pmuldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     d->Q(0) = (int64_t)(int32_t) v->L(0) * (int32_t) s->L(0);
     d->Q(1) = (int64_t)(int32_t) v->L(2) * (int32_t) s->L(2);
 #if SHIFT == 2
@@ -2334,9 +2321,8 @@ void glue(helper_pmuldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 #define FCMPEQQ(d, s) (d == s ? -1 : 0)
 SSE_HELPER_Q(helper_pcmpeqq, FCMPEQQ)
 
-void glue(helper_packusdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_packusdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     uint16_t r[8];
 
     r[0] = satuw((int32_t) v->L(0));
@@ -2582,10 +2568,9 @@ SSE_HELPER_I(helper_blendps, L, 4, FBLENDP)
 SSE_HELPER_I(helper_blendpd, Q, 2, FBLENDP)
 SSE_HELPER_I(helper_pblendw, W, 8, FBLENDP)
 
-void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
                                uint32_t mask)
 {
-    Reg *v = d;
     float32 prod, iresult, iresult2;
 
     /*
@@ -2655,9 +2640,8 @@ void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 #if SHIFT == 1
 /* Oddly, there is no ymm version of dppd */
 void glue(helper_dppd, SUFFIX)(CPUX86State *env,
-                               Reg *d, Reg *s, uint32_t mask)
+                               Reg *d, Reg *v, Reg *s, uint32_t mask)
 {
-    Reg *v = d;
     float64 iresult;
 
     if (mask & (1 << 4)) {
@@ -2677,10 +2661,9 @@ void glue(helper_dppd, SUFFIX)(CPUX86State *env,
 }
 #endif
 
-void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
                                   uint32_t offset)
 {
-    Reg *v = d;
     int s0 = (offset & 3) << 2;
     int d0 = (offset & 4) << 0;
     int i;
@@ -2965,10 +2948,9 @@ static void clmulq(uint64_t *dest_l, uint64_t *dest_h,
 }
 #endif
 
-void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
                                     uint32_t ctrl)
 {
-    Reg *v = d;
     uint64_t a, b;
 
     a = v->Q((ctrl & 1) != 0);
@@ -2981,10 +2963,10 @@ void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 #endif
 }
 
-void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
     int i;
-    Reg st = *d; // v
+    Reg st = *v;
     Reg rk = *s;
 
     for (i = 0 ; i < 4 ; i++) {
@@ -3004,10 +2986,10 @@ void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 #endif
 }
 
-void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
     int i;
-    Reg st = *d; // v
+    Reg st = *v;
     Reg rk = *s;
 
     for (i = 0; i < 16; i++) {
@@ -3020,10 +3002,10 @@ void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 #endif
 }
 
-void glue(helper_aesenc, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_aesenc, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
     int i;
-    Reg st = *d; // v
+    Reg st = *v;
     Reg rk = *s;
 
     for (i = 0 ; i < 4 ; i++) {
@@ -3043,10 +3025,10 @@ void glue(helper_aesenc, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 #endif
 }
 
-void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
     int i;
-    Reg st = *d; // v
+    Reg st = *v;
     Reg rk = *s;
 
     for (i = 0; i < 16; i++) {
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 793e581224..cfcfba154b 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -38,31 +38,31 @@
 #define dh_typecode_ZMMReg dh_typecode_ptr
 #define dh_typecode_MMXReg dh_typecode_ptr
 
-DEF_HELPER_3(glue(psrlw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psraw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psllw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psrld, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psrad, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pslld, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psrlq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psllq, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(psrlw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psraw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psllw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psrld, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psrad, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pslld, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psrlq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psllq, SUFFIX), void, env, Reg, Reg, Reg)
 
 #if SHIFT >= 1
-DEF_HELPER_3(glue(psrldq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pslldq, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(psrldq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pslldq, SUFFIX), void, env, Reg, Reg, Reg)
 #endif
 
 #define SSE_HELPER_B(name, F)\
-    DEF_HELPER_3(glue(name, SUFFIX), void, env, Reg, Reg)
+    DEF_HELPER_4(glue(name, SUFFIX), void, env, Reg, Reg, Reg)
 
 #define SSE_HELPER_W(name, F)\
-    DEF_HELPER_3(glue(name, SUFFIX), void, env, Reg, Reg)
+    DEF_HELPER_4(glue(name, SUFFIX), void, env, Reg, Reg, Reg)
 
 #define SSE_HELPER_L(name, F)\
-    DEF_HELPER_3(glue(name, SUFFIX), void, env, Reg, Reg)
+    DEF_HELPER_4(glue(name, SUFFIX), void, env, Reg, Reg, Reg)
 
 #define SSE_HELPER_Q(name, F)\
-    DEF_HELPER_3(glue(name, SUFFIX), void, env, Reg, Reg)
+    DEF_HELPER_4(glue(name, SUFFIX), void, env, Reg, Reg, Reg)
 
 SSE_HELPER_B(paddb, FADD)
 SSE_HELPER_W(paddw, FADD)
@@ -113,10 +113,10 @@ SSE_HELPER_W(pmulhw, FMULHW)
 SSE_HELPER_B(pavgb, FAVG)
 SSE_HELPER_W(pavgw, FAVG)
 
-DEF_HELPER_3(glue(pmuludq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmaddwd, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(pmuludq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pmaddwd, SUFFIX), void, env, Reg, Reg, Reg)
 
-DEF_HELPER_3(glue(psadbw, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(psadbw, SUFFIX), void, env, Reg, Reg, Reg)
 #if SHIFT < 2
 DEF_HELPER_4(glue(maskmov, SUFFIX), void, env, Reg, Reg, tl)
 #endif
@@ -138,8 +138,8 @@ DEF_HELPER_3(glue(pshufhw, SUFFIX), void, Reg, Reg, int)
 /* XXX: not accurate */
 
 #define SSE_HELPER_P4(name)                                             \
-    DEF_HELPER_3(glue(name ## ps, SUFFIX), void, env, Reg, Reg)         \
-    DEF_HELPER_3(glue(name ## pd, SUFFIX), void, env, Reg, Reg)
+    DEF_HELPER_4(glue(name ## ps, SUFFIX), void, env, Reg, Reg, Reg)    \
+    DEF_HELPER_4(glue(name ## pd, SUFFIX), void, env, Reg, Reg, Reg)
 
 #define SSE_HELPER_P3(name, ...)                                        \
     DEF_HELPER_3(glue(name ## ps, SUFFIX), void, env, Reg, Reg)         \
@@ -148,8 +148,8 @@ DEF_HELPER_3(glue(pshufhw, SUFFIX), void, Reg, Reg, int)
 #if SHIFT == 1
 #define SSE_HELPER_S4(name)                                             \
     SSE_HELPER_P4(name)                                                 \
-    DEF_HELPER_3(name ## ss, void, env, Reg, Reg)                       \
-    DEF_HELPER_3(name ## sd, void, env, Reg, Reg)
+    DEF_HELPER_4(name ## ss, void, env, Reg, Reg, Reg)                  \
+    DEF_HELPER_4(name ## sd, void, env, Reg, Reg, Reg)
 #define SSE_HELPER_S3(name)                                             \
     SSE_HELPER_P3(name)                                                 \
     DEF_HELPER_3(name ## ss, void, env, Reg, Reg)                       \
@@ -159,8 +159,8 @@ DEF_HELPER_3(glue(pshufhw, SUFFIX), void, Reg, Reg, int)
 #define SSE_HELPER_S3(name, ...) SSE_HELPER_P3(name)
 #endif
 
-DEF_HELPER_3(glue(shufps, SUFFIX), void, Reg, Reg, int)
-DEF_HELPER_3(glue(shufpd, SUFFIX), void, Reg, Reg, int)
+DEF_HELPER_4(glue(shufps, SUFFIX), void, Reg, Reg, Reg, int)
+DEF_HELPER_4(glue(shufpd, SUFFIX), void, Reg, Reg, Reg, int)
 
 SSE_HELPER_S4(add)
 SSE_HELPER_S4(sub)
@@ -216,6 +216,7 @@ DEF_HELPER_2(cvttsd2sq, s64, env, ZMMReg)
 
 DEF_HELPER_3(glue(rsqrtps, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(glue(rcpps, SUFFIX), void, env, ZMMReg, ZMMReg)
+
 #if SHIFT == 1
 DEF_HELPER_3(rsqrtss, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(rcpss, void, env, ZMMReg, ZMMReg)
@@ -279,20 +280,20 @@ DEF_HELPER_2(glue(movmskpd, SUFFIX), i32, env, Reg)
 #endif
 
 DEF_HELPER_2(glue(pmovmskb, SUFFIX), i32, env, Reg)
-DEF_HELPER_3(glue(packsswb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(packuswb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(packssdw, SUFFIX), void, env, Reg, Reg)
-#define UNPCK_OP(base_name, base)                                       \
-    DEF_HELPER_3(glue(punpck ## base_name ## bw, SUFFIX), void, env, Reg, Reg) \
-    DEF_HELPER_3(glue(punpck ## base_name ## wd, SUFFIX), void, env, Reg, Reg) \
-    DEF_HELPER_3(glue(punpck ## base_name ## dq, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(packsswb, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(packuswb, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(packssdw, SUFFIX), void, env, Reg, Reg, Reg)
+#define UNPCK_OP(name, base)                                       \
+    DEF_HELPER_4(glue(punpck ## name ## bw, SUFFIX), void, env, Reg, Reg, Reg) \
+    DEF_HELPER_4(glue(punpck ## name ## wd, SUFFIX), void, env, Reg, Reg, Reg) \
+    DEF_HELPER_4(glue(punpck ## name ## dq, SUFFIX), void, env, Reg, Reg, Reg)
 
 UNPCK_OP(l, 0)
 UNPCK_OP(h, 1)
 
 #if SHIFT >= 1
-DEF_HELPER_3(glue(punpcklqdq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(punpckhqdq, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(punpcklqdq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(punpckhqdq, SUFFIX), void, env, Reg, Reg, Reg)
 #endif
 
 /* 3DNow! float ops */
@@ -319,28 +320,28 @@ DEF_HELPER_3(pswapd, void, env, MMXReg, MMXReg)
 #endif
 
 /* SSSE3 op helpers */
-DEF_HELPER_3(glue(phaddw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(phaddd, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(phaddsw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(phsubw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(phsubd, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(phsubsw, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(phaddw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(phaddd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(phaddsw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(phsubw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(phsubd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(phsubsw, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_3(glue(pabsb, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pabsw, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pabsd, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmaddubsw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmulhrsw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pshufb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psignb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psignw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psignd, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_4(glue(palignr, SUFFIX), void, env, Reg, Reg, s32)
+DEF_HELPER_4(glue(pmaddubsw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pmulhrsw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pshufb, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psignb, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psignw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psignd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_5(glue(palignr, SUFFIX), void, env, Reg, Reg, Reg, s32)
 
 /* SSE4.1 op helpers */
 #if SHIFT >= 1
-DEF_HELPER_3(glue(pblendvb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(blendvps, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(blendvpd, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_5(glue(pblendvb, SUFFIX), void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(glue(blendvps, SUFFIX), void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(glue(blendvpd, SUFFIX), void, env, Reg, Reg, Reg, Reg)
 DEF_HELPER_3(glue(ptest, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovsxbw, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovsxbd, SUFFIX), void, env, Reg, Reg)
@@ -354,40 +355,40 @@ DEF_HELPER_3(glue(pmovzxbq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovzxwd, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovzxwq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovzxdq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmuldq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pcmpeqq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(packusdw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pminsb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pminsd, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pminuw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pminud, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmaxsb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmaxsd, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmaxuw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmaxud, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmulld, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(pmuldq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pcmpeqq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(packusdw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pminsb, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pminsd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pminuw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pminud, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pmaxsb, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pmaxsd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pmaxuw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pmaxud, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pmulld, SUFFIX), void, env, Reg, Reg, Reg)
 #if SHIFT == 1
 DEF_HELPER_3(glue(phminposuw, SUFFIX), void, env, Reg, Reg)
 #endif
 DEF_HELPER_4(glue(roundps, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(roundpd, SUFFIX), void, env, Reg, Reg, i32)
 #if SHIFT == 1
-DEF_HELPER_4(glue(roundss, SUFFIX), void, env, Reg, Reg, i32)
-DEF_HELPER_4(glue(roundsd, SUFFIX), void, env, Reg, Reg, i32)
+DEF_HELPER_4(roundss_xmm, void, env, Reg, Reg, i32)
+DEF_HELPER_4(roundsd_xmm, void, env, Reg, Reg, i32)
 #endif
-DEF_HELPER_4(glue(blendps, SUFFIX), void, env, Reg, Reg, i32)
-DEF_HELPER_4(glue(blendpd, SUFFIX), void, env, Reg, Reg, i32)
-DEF_HELPER_4(glue(pblendw, SUFFIX), void, env, Reg, Reg, i32)
-DEF_HELPER_4(glue(dpps, SUFFIX), void, env, Reg, Reg, i32)
+DEF_HELPER_5(glue(blendps, SUFFIX), void, env, Reg, Reg, Reg, i32)
+DEF_HELPER_5(glue(blendpd, SUFFIX), void, env, Reg, Reg, Reg, i32)
+DEF_HELPER_5(glue(pblendw, SUFFIX), void, env, Reg, Reg, Reg, i32)
+DEF_HELPER_5(glue(dpps, SUFFIX), void, env, Reg, Reg, Reg, i32)
 #if SHIFT == 1
-DEF_HELPER_4(glue(dppd, SUFFIX), void, env, Reg, Reg, i32)
+DEF_HELPER_5(glue(dppd, SUFFIX), void, env, Reg, Reg, Reg, i32)
 #endif
-DEF_HELPER_4(glue(mpsadbw, SUFFIX), void, env, Reg, Reg, i32)
+DEF_HELPER_5(glue(mpsadbw, SUFFIX), void, env, Reg, Reg, Reg, i32)
 #endif
 
 /* SSE4.2 op helpers */
 #if SHIFT >= 1
-DEF_HELPER_3(glue(pcmpgtq, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(pcmpgtq, SUFFIX), void, env, Reg, Reg, Reg)
 #endif
 #if SHIFT == 1
 DEF_HELPER_4(glue(pcmpestri, SUFFIX), void, env, Reg, Reg, i32)
@@ -399,15 +400,15 @@ DEF_HELPER_3(crc32, tl, i32, tl, i32)
 
 /* AES-NI op helpers */
 #if SHIFT >= 1
-DEF_HELPER_3(glue(aesdec, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(aesdeclast, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(aesenc, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(aesenclast, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(aesdec, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(aesdeclast, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(aesenc, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(aesenclast, SUFFIX), void, env, Reg, Reg, Reg)
 #if SHIFT == 1
 DEF_HELPER_3(glue(aesimc, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_4(glue(aeskeygenassist, SUFFIX), void, env, Reg, Reg, i32)
 #endif
-DEF_HELPER_4(glue(pclmulqdq, SUFFIX), void, env, Reg, Reg, i32)
+DEF_HELPER_5(glue(pclmulqdq, SUFFIX), void, env, Reg, Reg, Reg, i32)
 #endif
 
 #undef SHIFT
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 6c40df61d4..d148a2319d 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -125,6 +125,7 @@ typedef struct DisasContext {
     TCGv tmp4;
     TCGv_ptr ptr0;
     TCGv_ptr ptr1;
+    TCGv_ptr ptr2;
     TCGv_i32 tmp2_i32;
     TCGv_i32 tmp3_i32;
     TCGv_i64 tmp1_i64;
@@ -2784,11 +2785,21 @@ typedef void (*SSEFunc_l_ep)(TCGv_i64 val, TCGv_ptr env, TCGv_ptr reg);
 typedef void (*SSEFunc_0_epi)(TCGv_ptr env, TCGv_ptr reg, TCGv_i32 val);
 typedef void (*SSEFunc_0_epl)(TCGv_ptr env, TCGv_ptr reg, TCGv_i64 val);
 typedef void (*SSEFunc_0_epp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b);
+typedef void (*SSEFunc_0_eppp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                               TCGv_ptr reg_c);
+typedef void (*SSEFunc_0_epppp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                                TCGv_ptr reg_c, TCGv_ptr reg_d);
 typedef void (*SSEFunc_0_eppi)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
                                TCGv_i32 val);
+typedef void (*SSEFunc_0_epppi)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                                TCGv_ptr reg_c, TCGv_i32 val);
 typedef void (*SSEFunc_0_ppi)(TCGv_ptr reg_a, TCGv_ptr reg_b, TCGv_i32 val);
+typedef void (*SSEFunc_0_pppi)(TCGv_ptr reg_a, TCGv_ptr reg_b, TCGv_ptr reg_c,
+                               TCGv_i32 val);
 typedef void (*SSEFunc_0_eppt)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
                                TCGv val);
+typedef void (*SSEFunc_0_epppt)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                                TCGv_ptr reg_c, TCGv val);
 
 #define SSE_OPF_V0        (1 << 0) /* vex.v must be 1111b (only 2 operands) */
 #define SSE_OPF_CMP       (1 << 1) /* does not write for first operand */
@@ -2801,7 +2812,7 @@ typedef void (*SSEFunc_0_eppt)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
 #define SSE_OPF_SHUF      (1 << 9) /* pshufx/shufpx */
 
 #define OP(op, flags, a, b, c, d)       \
-    {flags, {a, b, c, d} }
+    {flags, {{.op = a}, {.op = b}, {.op = c}, {.op = d} } }
 
 #define MMX_OP(x) OP(op2, SSE_OPF_MMX, \
         gen_helper_ ## x ## _mmx, gen_helper_ ## x ## _xmm, NULL, NULL)
@@ -2814,7 +2825,13 @@ typedef void (*SSEFunc_0_eppt)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
 
 struct SSEOpHelper_table1 {
     int flags;
-    SSEFunc_0_epp op[4];
+    union {
+        SSEFunc_0_epp op1;
+        SSEFunc_0_ppi op1i;
+        SSEFunc_0_eppt op1t;
+        SSEFunc_0_eppp op2;
+        SSEFunc_0_pppi op2i;
+    } fn[4];
 };
 
 #define SSE_3DNOW { SSE_OPF_3DNOW }
@@ -2870,8 +2887,7 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0x5f] = SSE_FOP(max),
 
     [0xc2] = SSE_FOP(cmpeq), /* sse_op_table4 */
-    [0xc6] = OP(dummy, SSE_OPF_SHUF, (SSEFunc_0_epp)gen_helper_shufps_xmm,
-                (SSEFunc_0_epp)gen_helper_shufpd_xmm, NULL, NULL),
+    [0xc6] = SSE_OP(shufps, shufpd, op2i, SSE_OPF_SHUF),
 
     /* SSSE3, SSE4, MOVBE, CRC32, BMI1, BMI2, ADX.  */
     [0x38] = SSE_SPECIAL,
@@ -2897,10 +2913,8 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0x6e] = SSE_SPECIAL, /* movd mm, ea */
     [0x6f] = SSE_SPECIAL, /* movq, movdqa, , movqdu */
     [0x70] = OP(op1i, SSE_OPF_SHUF | SSE_OPF_MMX | SSE_OPF_V0,
-            (SSEFunc_0_epp)gen_helper_pshufw_mmx,
-            (SSEFunc_0_epp)gen_helper_pshufd_xmm,
-            (SSEFunc_0_epp)gen_helper_pshufhw_xmm,
-            (SSEFunc_0_epp)gen_helper_pshuflw_xmm),
+            gen_helper_pshufw_mmx, gen_helper_pshufd_xmm,
+            gen_helper_pshufhw_xmm, gen_helper_pshuflw_xmm),
     [0x71] = SSE_SPECIAL, /* shiftw */
     [0x72] = SSE_SPECIAL, /* shiftd */
     [0x73] = SSE_SPECIAL, /* shiftq */
@@ -2962,8 +2976,7 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0xf5] = MMX_OP(pmaddwd),
     [0xf6] = MMX_OP(psadbw),
     [0xf7] = OP(op1t, SSE_OPF_MMX | SSE_OPF_V0,
-                (SSEFunc_0_epp)gen_helper_maskmov_mmx,
-                (SSEFunc_0_epp)gen_helper_maskmov_xmm, NULL, NULL),
+                gen_helper_maskmov_mmx, gen_helper_maskmov_xmm, NULL, NULL),
     [0xf8] = MMX_OP(psubb),
     [0xf9] = MMX_OP(psubw),
     [0xfa] = MMX_OP(psubl),
@@ -2980,7 +2993,7 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
 
 #define MMX_OP2(x) { gen_helper_ ## x ## _mmx, gen_helper_ ## x ## _xmm }
 
-static const SSEFunc_0_epp sse_op_table2[3 * 8][2] = {
+static const SSEFunc_0_eppp sse_op_table2[3 * 8][2] = {
     [0 + 2] = MMX_OP2(psrlw),
     [0 + 4] = MMX_OP2(psraw),
     [0 + 6] = MMX_OP2(psllw),
@@ -2992,6 +3005,7 @@ static const SSEFunc_0_epp sse_op_table2[3 * 8][2] = {
     [16 + 6] = MMX_OP2(psllq),
     [16 + 7] = { NULL, gen_helper_pslldq_xmm },
 };
+#undef MMX_OP2
 
 static const SSEFunc_0_epi sse_op_table3ai[] = {
     gen_helper_cvtsi2ss,
@@ -3024,7 +3038,7 @@ static const SSEFunc_l_ep sse_op_table3bq[] = {
 #define SSE_CMP(x) { \
     gen_helper_ ## x ## ps ## _xmm, gen_helper_ ## x ## pd ## _xmm, \
     gen_helper_ ## x ## ss, gen_helper_ ## x ## sd}
-static const SSEFunc_0_epp sse_op_table4[32][4] = {
+static const SSEFunc_0_eppp sse_op_table4[32][4] = {
     SSE_CMP(cmpeq),
     SSE_CMP(cmplt),
     SSE_CMP(cmple),
@@ -3063,6 +3077,11 @@ static const SSEFunc_0_epp sse_op_table4[32][4] = {
 };
 #undef SSE_CMP
 
+static void gen_helper_pavgusb(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b)
+{
+    gen_helper_pavgb_mmx(env, reg_a, reg_a, reg_b);
+}
+
 static const SSEFunc_0_epp sse_op_table5[256] = {
     [0x0c] = gen_helper_pi2fw,
     [0x0d] = gen_helper_pi2fd,
@@ -3087,17 +3106,25 @@ static const SSEFunc_0_epp sse_op_table5[256] = {
     [0xb6] = gen_helper_movq, /* pfrcpit2 */
     [0xb7] = gen_helper_pmulhrw_mmx,
     [0xbb] = gen_helper_pswapd,
-    [0xbf] = gen_helper_pavgb_mmx /* pavgusb */
+    [0xbf] = gen_helper_pavgusb,
 };
 
 struct SSEOpHelper_table6 {
-    SSEFunc_0_epp op[2];
+    union {
+        SSEFunc_0_epp op1;
+        SSEFunc_0_eppp op2;
+        SSEFunc_0_epppp op3;
+    } fn[2];
     uint32_t ext_mask;
     int flags;
 };
 
 struct SSEOpHelper_table7 {
-    SSEFunc_0_eppi op[2];
+    union {
+        SSEFunc_0_eppi op1;
+        SSEFunc_0_epppi op2;
+        SSEFunc_0_epppp op3;
+    } fn[2];
     uint32_t ext_mask;
     int flags;
 };
@@ -3105,7 +3132,8 @@ struct SSEOpHelper_table7 {
 #define gen_helper_special_xmm NULL
 
 #define OP(name, op, flags, ext, mmx_name) \
-    {{mmx_name, gen_helper_ ## name ## _xmm}, CPUID_EXT_ ## ext, flags}
+    {{{.op = mmx_name}, {.op = gen_helper_ ## name ## _xmm} }, \
+        CPUID_EXT_ ## ext, flags}
 #define BINARY_OP_MMX(name, ext) \
     OP(name, op2, SSE_OPF_MMX, ext, gen_helper_ ## name ## _mmx)
 #define BINARY_OP(name, ext, flags) \
@@ -3262,14 +3290,11 @@ static const struct SSEOpHelper_table7 sse_op_table7[256] = {
 static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     target_ulong pc_start)
 {
-    int b1, op1_offset, op2_offset, is_xmm, val, scalar_op;
-    int modrm, mod, rm, reg;
+    int b1, op1_offset, op2_offset, v_offset, is_xmm, val, scalar_op;
+    int modrm, mod, rm, reg, reg_v;
     struct SSEOpHelper_table1 sse_op;
     struct SSEOpHelper_table6 op6;
     struct SSEOpHelper_table7 op7;
-    SSEFunc_0_epp sse_fn_epp;
-    SSEFunc_0_ppi sse_fn_ppi;
-    SSEFunc_0_eppt sse_fn_eppt;
     MemOp ot;
 
     b &= 0xff;
@@ -3282,9 +3307,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
     else
         b1 = 0;
     sse_op = sse_op_table1[b];
-    sse_fn_epp = sse_op.op[b1];
     if ((sse_op.flags & (SSE_OPF_SPECIAL | SSE_OPF_3DNOW)) == 0
-            && !sse_fn_epp) {
+            && !sse_op.fn[b1].op1) {
         goto unknown_op;
     }
     if ((b <= 0x5f && b >= 0x10) || b == 0xc6 || b == 0xc2) {
@@ -3345,6 +3369,11 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
     if (is_xmm) {
         reg |= REX_R(s);
     }
+    if (s->prefix & PREFIX_VEX) {
+        reg_v = s->vex_v;
+    } else {
+        reg_v = reg;
+    }
     mod = (modrm >> 6) & 3;
     if (sse_op.flags & SSE_OPF_SPECIAL) {
         b |= (b1 << 8);
@@ -3466,8 +3495,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             } else {
                 CHECK_AVX_128(s);
                 rm = (modrm & 7) | REX_B(s);
-                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(0)));
+                tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
+                               offsetof(CPUX86State, xmm_regs[rm].ZMM_L(0)));
+                if (reg != reg_v) {
+                    gen_op_movo(s, ZMM_OFFSET(reg), ZMM_OFFSET(reg_v));
+                }
+                tcg_gen_st_i32(s->tmp2_i32, cpu_env,
+                               offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)));
             }
             break;
         case 0x310: /* movsd xmm, ea */
@@ -3484,8 +3518,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             } else {
                 CHECK_AVX_128(s);
                 rm = (modrm & 7) | REX_B(s);
+                if (reg != reg_v) {
+                    gen_op_movq(s,
+                            offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
+                            offsetof(CPUX86State, xmm_regs[reg_v].ZMM_Q(1)));
+                }
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
+                            offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(0)));
             }
             break;
         case 0x012: /* movlps */
@@ -3501,6 +3540,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
                             offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(1)));
             }
+            if (reg != reg_v) {
+                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
+                            offsetof(CPUX86State, xmm_regs[reg_v].ZMM_Q(1)));
+            }
             break;
         case 0x212: /* movsldup */
             CHECK_AVX_V0(s);
@@ -3546,6 +3589,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
                             offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
             }
+            if (reg != reg_v) {
+                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
+                            offsetof(CPUX86State, xmm_regs[reg_v].ZMM_Q(0)));
+            }
             break;
         case 0x216: /* movshdup */
             CHECK_AVX_V0(s);
@@ -3664,6 +3711,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             } else {
                 CHECK_AVX_128(s);
                 rm = (modrm & 7) | REX_B(s);
+                if (rm != reg_v) {
+                    gen_op_movo(s, ZMM_OFFSET(rm), ZMM_OFFSET(reg_v));
+                }
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_L(0)),
                             offsetof(CPUX86State,xmm_regs[reg].ZMM_L(0)));
             }
@@ -3677,6 +3727,11 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             } else {
                 CHECK_AVX_128(s);
                 rm = (modrm & 7) | REX_B(s);
+                if (rm != reg_v) {
+                    gen_op_movq(s,
+                            offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(1)),
+                            offsetof(CPUX86State, xmm_regs[reg_v].ZMM_Q(1)));
+                }
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(0)),
                             offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
             }
@@ -3731,21 +3786,28 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 op1_offset = offsetof(CPUX86State,mmx_t0);
             }
             assert(b1 < 2);
-            sse_fn_epp = sse_op_table2[((b - 1) & 3) * 8 +
+            SSEFunc_0_eppp fn = sse_op_table2[((b - 1) & 3) * 8 +
                                        (((modrm >> 3)) & 7)][b1];
-            if (!sse_fn_epp) {
+            if (!fn) {
                 goto unknown_op;
             }
             if (is_xmm) {
                 rm = (modrm & 7) | REX_B(s);
                 op2_offset = ZMM_OFFSET(rm);
+                if (s->prefix & PREFIX_VEX) {
+                    v_offset = ZMM_OFFSET(reg_v);
+                } else {
+                    v_offset = op2_offset;
+                }
             } else {
                 rm = (modrm & 7);
                 op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
+                v_offset = op2_offset;
             }
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op2_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op1_offset);
-            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
+            tcg_gen_addi_ptr(s->ptr0, cpu_env, v_offset);
+            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+            tcg_gen_addi_ptr(s->ptr2, cpu_env, op1_offset);
+            fn(cpu_env, s->ptr0, s->ptr1, s->ptr2);
             break;
         case 0x050: /* movmskps */
             CHECK_AVX_V0(s);
@@ -3792,6 +3854,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             ot = mo_64_32(s->dflag);
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
             op1_offset = ZMM_OFFSET(reg);
+            v_offset = ZMM_OFFSET(reg_v);
+            if (op1_offset != v_offset) {
+                gen_op_movo(s, op1_offset, v_offset);
+            }
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
             if (ot == MO_32) {
                 SSEFunc_0_epi sse_fn_epi = sse_op_table3ai[(b >> 8) & 1];
@@ -3881,6 +3947,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             s->rip_offset = 1;
             gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
             val = x86_ldub_code(env, s);
+            if (reg != reg_v) {
+                gen_op_movo(s, ZMM_OFFSET(reg), ZMM_OFFSET(reg_v));
+            }
             if (b1) {
                 val &= 7;
                 tcg_gen_st16_tl(s->T0, cpu_env,
@@ -3972,6 +4041,11 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             rm = modrm & 7;
             reg = ((modrm >> 3) & 7) | REX_R(s);
             mod = (modrm >> 6) & 3;
+            if (s->prefix & PREFIX_VEX) {
+                reg_v = s->vex_v;
+            } else {
+                reg_v = reg;
+            }
 
             assert(b1 < 2);
             op6 = sse_op_table6[b];
@@ -4041,6 +4115,27 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                         gen_ldo_env_A0(s, op2_offset);
                     }
                 }
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+                tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+                if (!op6.fn[b1].op1) {
+                    goto illegal_op;
+                }
+                if (op6.flags & SSE_OPF_V0) {
+                    op6.fn[b1].op1(cpu_env, s->ptr0, s->ptr1);
+                } else {
+                    v_offset = ZMM_OFFSET(reg_v);
+                    tcg_gen_addi_ptr(s->ptr2, cpu_env, v_offset);
+                    if (op6.flags & SSE_OPF_BLENDV) {
+                        TCGv_ptr mask = tcg_temp_new_ptr();
+                        tcg_gen_addi_ptr(mask, cpu_env, ZMM_OFFSET(0));
+                        op6.fn[b1].op3(cpu_env, s->ptr0, s->ptr2, s->ptr1,
+                                       mask);
+                        tcg_temp_free_ptr(mask);
+                    } else {
+                        SSEFunc_0_eppp fn = op6.fn[b1].op2;
+                        fn(cpu_env, s->ptr0, s->ptr2, s->ptr1);
+                    }
+                }
             } else {
                 CHECK_NO_VEX(s);
                 if ((op6.flags & SSE_OPF_MMX) == 0) {
@@ -4054,16 +4149,16 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     gen_lea_modrm(env, s, modrm);
                     gen_ldq_env_A0(s, op2_offset);
                 }
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+                tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+                if (op6.flags & SSE_OPF_V0) {
+                    op6.fn[0].op1(cpu_env, s->ptr0, s->ptr1);
+                } else {
+                    op6.fn[0].op2(cpu_env, s->ptr0, s->ptr0, s->ptr1);
+                }
             }
-            if (!op6.op[b1]) {
-                goto illegal_op;
-            }
-
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            op6.op[b1](cpu_env, s->ptr0, s->ptr1);
 
-            if (b == 0x17) {
+            if (op6.flags & SSE_OPF_CMP) {
                 set_cc_op(s, CC_OP_EFLAGS);
             }
             break;
@@ -4434,6 +4529,11 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             rm = modrm & 7;
             reg = ((modrm >> 3) & 7) | REX_R(s);
             mod = (modrm >> 6) & 3;
+            if (s->prefix & PREFIX_VEX) {
+                reg_v = s->vex_v;
+            } else {
+                reg_v = reg;
+            }
 
             assert(b1 < 2);
             op7 = sse_op_table7[b];
@@ -4521,6 +4621,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     break;
                 case 0x20: /* pinsrb */
                     CHECK_AVX_128(s);
+                    if (reg != reg_v) {
+                        gen_op_movo(s, ZMM_OFFSET(reg), ZMM_OFFSET(reg_v));
+                    }
                     if (mod == 3) {
                         gen_op_mov_v_reg(s, MO_32, s->T0, rm);
                     } else {
@@ -4540,6 +4643,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                         tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
                                             s->mem_index, MO_LEUL);
                     }
+                    if (reg != reg_v) {
+                        gen_op_movo(s, ZMM_OFFSET(reg), ZMM_OFFSET(reg_v));
+                    }
                     tcg_gen_st_i32(s->tmp2_i32, cpu_env,
                                     offsetof(CPUX86State,xmm_regs[reg]
                                             .ZMM_L((val >> 4) & 3)));
@@ -4562,6 +4668,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     break;
                 case 0x22:
                     CHECK_AVX_128(s);
+                    if (reg != reg_v) {
+                        gen_op_movo(s, ZMM_OFFSET(reg), ZMM_OFFSET(reg_v));
+                    }
                     if (ot == MO_32) { /* pinsrd */
                         if (mod == 3) {
                             tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[rm]);
@@ -4606,17 +4715,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 CHECK_AVX_V0(s);
             }
 
-            if (b1) {
-                op1_offset = ZMM_OFFSET(reg);
-                if (mod == 3) {
-                    op2_offset = ZMM_OFFSET(rm | REX_B(s));
-                } else {
-                    op2_offset = offsetof(CPUX86State,xmm_t0);
-                    gen_lea_modrm(env, s, modrm);
-                    gen_ldo_env_A0(s, op2_offset);
-                }
-            } else {
+            if (b1 == 0) {
                 CHECK_NO_VEX(s);
+                /* MMX */
                 if ((op7.flags & SSE_OPF_MMX) == 0) {
                     goto illegal_op;
                 }
@@ -4628,9 +4729,29 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     gen_lea_modrm(env, s, modrm);
                     gen_ldq_env_A0(s, op2_offset);
                 }
+                val = x86_ldub_code(env, s);
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+                tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+
+                /* We only actually have one MMX instuction (palignr) */
+                assert(b == 0x0f);
+
+                op7.fn[0].op2(cpu_env, s->ptr0, s->ptr0, s->ptr1,
+                              tcg_const_i32(val));
+                break;
+            }
+
+            /* SSE */
+            op1_offset = ZMM_OFFSET(reg);
+            if (mod == 3) {
+                op2_offset = ZMM_OFFSET(rm | REX_B(s));
+            } else {
+                op2_offset = offsetof(CPUX86State, xmm_t0);
+                gen_lea_modrm(env, s, modrm);
+                gen_ldo_env_A0(s, op2_offset);
             }
-            val = x86_ldub_code(env, s);
 
+            val = x86_ldub_code(env, s);
             if ((b & 0xfc) == 0x60) { /* pcmpXstrX */
                 set_cc_op(s, CC_OP_EFLAGS);
 
@@ -4640,9 +4761,32 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 }
             }
 
+            v_offset = ZMM_OFFSET(reg_v);
+            /*
+             * Populate the top part of the destination register for VEX
+             * encoded scalar operations
+             */
+            if (scalar_op && op1_offset != v_offset) {
+                if (b == 0x0a) { /* roundss */
+                    gen_op_movl(s,
+                            offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
+                            offsetof(CPUX86State, xmm_regs[reg_v].ZMM_L(1)));
+                }
+                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
+                            offsetof(CPUX86State, xmm_regs[reg_v].ZMM_Q(1)));
+            }
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
             tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            op7.op[b1](cpu_env, s->ptr0, s->ptr1, tcg_const_i32(val));
+            if (op7.flags & SSE_OPF_V0) {
+                op7.fn[b1].op1(cpu_env, s->ptr0, s->ptr1, tcg_const_i32(val));
+            } else {
+                tcg_gen_addi_ptr(s->ptr2, cpu_env, v_offset);
+                op7.fn[b1].op2(cpu_env, s->ptr0, s->ptr2, s->ptr1,
+                               tcg_const_i32(val));
+            }
+            if (op7.flags & SSE_OPF_CMP) {
+                set_cc_op(s, CC_OP_EFLAGS);
+            }
             break;
 
         case 0x33a:
@@ -4711,28 +4855,24 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 int sz = 4;
 
                 gen_lea_modrm(env, s, modrm);
-                op2_offset = offsetof(CPUX86State,xmm_t0);
+                op2_offset = offsetof(CPUX86State, xmm_t0);
 
-                switch (b) {
-                case 0x50 ... 0x5a:
-                case 0x5c ... 0x5f:
-                case 0xc2:
-                    /* Most sse scalar operations.  */
-                    if (b1 == 2) {
-                        sz = 2;
-                    } else if (b1 == 3) {
-                        sz = 3;
-                    }
-                    break;
-
-                case 0x2e:  /* ucomis[sd] */
-                case 0x2f:  /* comis[sd] */
-                    if (b1 == 0) {
-                        sz = 2;
+                if (sse_op.flags & SSE_OPF_SCALAR) {
+                    if (sse_op.flags & SSE_OPF_CMP) {
+                        /* ucomis[sd], comis[sd] */
+                        if (b1 == 0) {
+                            sz = 2;
+                        } else {
+                            sz = 3;
+                        }
                     } else {
-                        sz = 3;
+                        /* Most sse scalar operations.  */
+                        if (b1 == 2) {
+                            sz = 2;
+                        } else if (b1 == 3) {
+                            sz = 3;
+                        }
                     }
-                    break;
                 }
 
                 switch (sz) {
@@ -4740,13 +4880,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     /* 32 bit access */
                     gen_op_ld_v(s, MO_32, s->T0, s->A0);
                     tcg_gen_st32_tl(s->T0, cpu_env,
-                                    offsetof(CPUX86State,xmm_t0.ZMM_L(0)));
+                                    offsetof(CPUX86State, xmm_t0.ZMM_L(0)));
                     break;
                 case 3:
                     /* 64 bit access */
                     gen_ldq_env_A0(s, offsetof(CPUX86State, xmm_t0.ZMM_D(0)));
                     break;
-                default:
+                case 4:
                     /* 128 bit access */
                     gen_ldo_env_A0(s, op2_offset);
                     break;
@@ -4755,8 +4895,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 rm = (modrm & 7) | REX_B(s);
                 op2_offset = ZMM_OFFSET(rm);
             }
+            v_offset = ZMM_OFFSET(reg_v);
         } else {
             CHECK_NO_VEX(s);
+            scalar_op = 0;
             op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
@@ -4778,47 +4920,85 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 op_3dnow(cpu_env, s->ptr0, s->ptr1);
                 return;
             }
+            v_offset = op1_offset;
         }
-        switch(b) {
-        case 0x70: /* pshufx insn */
-        case 0xc6: /* pshufx insn */
-            val = x86_ldub_code(env, s);
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            /* XXX: introduce a new table? */
-            sse_fn_ppi = (SSEFunc_0_ppi)sse_fn_epp;
-            sse_fn_ppi(s->ptr0, s->ptr1, tcg_const_i32(val));
-            break;
-        case 0xc2:
-            /* compare insns, bits 7:3 (7:5 for AVX) are ignored */
-            val = x86_ldub_code(env, s) & 7;
-            sse_fn_epp = sse_op_table4[val][b1];
 
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
-            break;
-        case 0xf7:
-            /* maskmov : we must prepare A0 */
-            if (mod != 3)
-                goto illegal_op;
-            tcg_gen_mov_tl(s->A0, cpu_regs[R_EDI]);
-            gen_extu(s->aflag, s->A0);
-            gen_add_A0_ds_seg(s);
+        /*
+         * Populate the top part of the destination register for VEX
+         * encoded scalar operations
+         */
+        if (scalar_op && op1_offset != v_offset) {
+            if (b == 0x5a) {
+                /*
+                 * Scalar conversions are tricky because the src and dest
+                 * may be different sizes
+                 */
+                if (op1_offset == op2_offset) {
+                    /*
+                     * The the second source operand overlaps the
+                     * destination, so we need to copy the value
+                     */
+                    op2_offset = offsetof(CPUX86State, xmm_t0);
+                    gen_op_movq(s, op2_offset, op1_offset);
+                }
+                gen_op_movo(s, op1_offset, v_offset);
+            } else {
+                if (b1 == 2) { /* ss */
+                    gen_op_movl(s,
+                            offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
+                            offsetof(CPUX86State, xmm_regs[reg_v].ZMM_L(1)));
+                }
+                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
+                            offsetof(CPUX86State, xmm_regs[reg_v].ZMM_Q(1)));
+            }
+        }
 
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            /* XXX: introduce a new table? */
-            sse_fn_eppt = (SSEFunc_0_eppt)sse_fn_epp;
-            sse_fn_eppt(cpu_env, s->ptr0, s->ptr1, s->A0);
-            break;
-        default:
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
-            break;
+        tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+        tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+        if (sse_op.flags & SSE_OPF_V0) {
+            if (sse_op.flags & SSE_OPF_SHUF) {
+                val = x86_ldub_code(env, s);
+                sse_op.fn[b1].op1i(s->ptr0, s->ptr1, tcg_const_i32(val));
+            } else if (b == 0xf7) {
+                /* maskmov : we must prepare A0 */
+                if (mod != 3) {
+                    goto illegal_op;
+                }
+                tcg_gen_mov_tl(s->A0, cpu_regs[R_EDI]);
+                gen_extu(s->aflag, s->A0);
+                gen_add_A0_ds_seg(s);
+
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+                tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+                sse_op.fn[b1].op1t(cpu_env, s->ptr0, s->ptr1, s->A0);
+                /* Does not write to the fist operand */
+                return;
+            } else {
+                sse_op.fn[b1].op1(cpu_env, s->ptr0, s->ptr1);
+            }
+        } else {
+            tcg_gen_addi_ptr(s->ptr2, cpu_env, v_offset);
+            if (sse_op.flags & SSE_OPF_SHUF) {
+                val = x86_ldub_code(env, s);
+                sse_op.fn[b1].op2i(s->ptr0, s->ptr2, s->ptr1,
+                                   tcg_const_i32(val));
+            } else {
+                SSEFunc_0_eppp fn = sse_op.fn[b1].op2;
+                if (b == 0xc2) {
+                    /* compare insns */
+                    val = x86_ldub_code(env, s);
+                    if (s->prefix & PREFIX_VEX) {
+                        val &= 0x1f;
+                    } else {
+                        val &= 7;
+                    }
+                    fn = sse_op_table4[val][b1];
+                }
+                fn(cpu_env, s->ptr0, s->ptr2, s->ptr1);
+            }
         }
-        if (b == 0x2e || b == 0x2f) {
+
+        if (sse_op.flags & SSE_OPF_CMP) {
             set_cc_op(s, CC_OP_EFLAGS);
         }
     }
@@ -8900,6 +9080,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->tmp4 = tcg_temp_new();
     dc->ptr0 = tcg_temp_new_ptr();
     dc->ptr1 = tcg_temp_new_ptr();
+    dc->ptr2 = tcg_temp_new_ptr();
     dc->cc_srcT = tcg_temp_local_new();
 }
 
-- 
2.36.0


