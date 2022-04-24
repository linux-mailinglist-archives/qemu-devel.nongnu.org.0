Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E692150D5B6
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:24:41 +0200 (CEST)
Received: from localhost ([::1]:34078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niken-0003ts-16
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikTT-00021w-U2
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:12:59 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikTQ-0002tV-Eq
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:12:59 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJ8-0001ea-EL; Sun, 24 Apr 2022 23:02:18 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 18/42] i386: Misc AVX helper prep
Date: Sun, 24 Apr 2022 23:01:40 +0100
Message-Id: <20220424220204.2493824-19-paul@nowt.org>
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

Fixup various vector helpers that either trivially exten to 256 bit,
or don't have 256 bit variants.

No functional changes to existing helpers

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h | 159 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 139 insertions(+), 20 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index d128af6cc8..3202c00572 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -641,6 +641,7 @@ void glue(helper_psadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 #endif
 }
 
+#if SHIFT < 2
 void glue(helper_maskmov, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                   target_ulong a0)
 {
@@ -652,6 +653,7 @@ void glue(helper_maskmov, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
         }
     }
 }
+#endif
 
 void glue(helper_movl_mm_T0, SUFFIX)(Reg *d, uint32_t val)
 {
@@ -882,6 +884,13 @@ void glue(helper_cvtps2pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 
     s0 = s->ZMM_S(0);
     s1 = s->ZMM_S(1);
+#if SHIFT == 2
+    float32 s2, s3;
+    s2 = s->ZMM_S(2);
+    s3 = s->ZMM_S(3);
+    d->ZMM_D(2) = float32_to_float64(s2, &env->sse_status);
+    d->ZMM_D(3) = float32_to_float64(s3, &env->sse_status);
+#endif
     d->ZMM_D(0) = float32_to_float64(s0, &env->sse_status);
     d->ZMM_D(1) = float32_to_float64(s1, &env->sse_status);
 }
@@ -890,9 +899,17 @@ void glue(helper_cvtpd2ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     d->ZMM_S(0) = float64_to_float32(s->ZMM_D(0), &env->sse_status);
     d->ZMM_S(1) = float64_to_float32(s->ZMM_D(1), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_S(2) = float64_to_float32(s->ZMM_D(2), &env->sse_status);
+    d->ZMM_S(3) = float64_to_float32(s->ZMM_D(3), &env->sse_status);
+    d->Q(2) = 0;
+    d->Q(3) = 0;
+#else
     d->Q(1) = 0;
+#endif
 }
 
+#if SHIFT == 1
 void helper_cvtss2sd(CPUX86State *env, Reg *d, Reg *s)
 {
     d->ZMM_D(0) = float32_to_float64(s->ZMM_S(0), &env->sse_status);
@@ -902,6 +919,7 @@ void helper_cvtsd2ss(CPUX86State *env, Reg *d, Reg *s)
 {
     d->ZMM_S(0) = float64_to_float32(s->ZMM_D(0), &env->sse_status);
 }
+#endif
 
 /* integer to float */
 void glue(helper_cvtdq2ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
@@ -910,6 +928,12 @@ void glue(helper_cvtdq2ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     d->ZMM_S(1) = int32_to_float32(s->ZMM_L(1), &env->sse_status);
     d->ZMM_S(2) = int32_to_float32(s->ZMM_L(2), &env->sse_status);
     d->ZMM_S(3) = int32_to_float32(s->ZMM_L(3), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_S(4) = int32_to_float32(s->ZMM_L(4), &env->sse_status);
+    d->ZMM_S(5) = int32_to_float32(s->ZMM_L(5), &env->sse_status);
+    d->ZMM_S(6) = int32_to_float32(s->ZMM_L(6), &env->sse_status);
+    d->ZMM_S(7) = int32_to_float32(s->ZMM_L(7), &env->sse_status);
+#endif
 }
 
 void glue(helper_cvtdq2pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
@@ -918,10 +942,18 @@ void glue(helper_cvtdq2pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 
     l0 = (int32_t)s->ZMM_L(0);
     l1 = (int32_t)s->ZMM_L(1);
+#if SHIFT == 2
+    int32_t l2, l3;
+    l2 = (int32_t)s->ZMM_L(2);
+    l3 = (int32_t)s->ZMM_L(3);
+    d->ZMM_D(2) = int32_to_float64(l2, &env->sse_status);
+    d->ZMM_D(3) = int32_to_float64(l3, &env->sse_status);
+#endif
     d->ZMM_D(0) = int32_to_float64(l0, &env->sse_status);
     d->ZMM_D(1) = int32_to_float64(l1, &env->sse_status);
 }
 
+#if SHIFT == 1
 void helper_cvtpi2ps(CPUX86State *env, ZMMReg *d, MMXReg *s)
 {
     d->ZMM_S(0) = int32_to_float32(s->MMX_L(0), &env->sse_status);
@@ -956,8 +988,11 @@ void helper_cvtsq2sd(CPUX86State *env, ZMMReg *d, uint64_t val)
 }
 #endif
 
+#endif
+
 /* float to integer */
 
+#if SHIFT == 1
 /*
  * x86 mandates that we return the indefinite integer value for the result
  * of any float-to-integer conversion that raises the 'invalid' exception.
@@ -988,6 +1023,7 @@ WRAP_FLOATCONV(int64_t, float32_to_int64, float32, INT64_MIN)
 WRAP_FLOATCONV(int64_t, float32_to_int64_round_to_zero, float32, INT64_MIN)
 WRAP_FLOATCONV(int64_t, float64_to_int64, float64, INT64_MIN)
 WRAP_FLOATCONV(int64_t, float64_to_int64_round_to_zero, float64, INT64_MIN)
+#endif
 
 void glue(helper_cvtps2dq, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
@@ -995,15 +1031,29 @@ void glue(helper_cvtps2dq, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     d->ZMM_L(1) = x86_float32_to_int32(s->ZMM_S(1), &env->sse_status);
     d->ZMM_L(2) = x86_float32_to_int32(s->ZMM_S(2), &env->sse_status);
     d->ZMM_L(3) = x86_float32_to_int32(s->ZMM_S(3), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_L(4) = x86_float32_to_int32(s->ZMM_S(4), &env->sse_status);
+    d->ZMM_L(5) = x86_float32_to_int32(s->ZMM_S(5), &env->sse_status);
+    d->ZMM_L(6) = x86_float32_to_int32(s->ZMM_S(6), &env->sse_status);
+    d->ZMM_L(7) = x86_float32_to_int32(s->ZMM_S(7), &env->sse_status);
+#endif
 }
 
 void glue(helper_cvtpd2dq, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     d->ZMM_L(0) = x86_float64_to_int32(s->ZMM_D(0), &env->sse_status);
     d->ZMM_L(1) = x86_float64_to_int32(s->ZMM_D(1), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_L(2) = x86_float64_to_int32(s->ZMM_D(2), &env->sse_status);
+    d->ZMM_L(3) = x86_float64_to_int32(s->ZMM_D(3), &env->sse_status);
+    d->Q(2) = 0;
+    d->Q(3) = 0;
+#else
     d->ZMM_Q(1) = 0;
+#endif
 }
 
+#if SHIFT == 1
 void helper_cvtps2pi(CPUX86State *env, MMXReg *d, ZMMReg *s)
 {
     d->MMX_L(0) = x86_float32_to_int32(s->ZMM_S(0), &env->sse_status);
@@ -1037,33 +1087,64 @@ int64_t helper_cvtsd2sq(CPUX86State *env, ZMMReg *s)
     return x86_float64_to_int64(s->ZMM_D(0), &env->sse_status);
 }
 #endif
+#endif
 
 /* float to integer truncated */
 void glue(helper_cvttps2dq, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
-    d->ZMM_L(0) = x86_float32_to_int32_round_to_zero(s->ZMM_S(0), &env->sse_status);
-    d->ZMM_L(1) = x86_float32_to_int32_round_to_zero(s->ZMM_S(1), &env->sse_status);
-    d->ZMM_L(2) = x86_float32_to_int32_round_to_zero(s->ZMM_S(2), &env->sse_status);
-    d->ZMM_L(3) = x86_float32_to_int32_round_to_zero(s->ZMM_S(3), &env->sse_status);
+    d->ZMM_L(0) = x86_float32_to_int32_round_to_zero(s->ZMM_S(0),
+                                                     &env->sse_status);
+    d->ZMM_L(1) = x86_float32_to_int32_round_to_zero(s->ZMM_S(1),
+                                                     &env->sse_status);
+    d->ZMM_L(2) = x86_float32_to_int32_round_to_zero(s->ZMM_S(2),
+                                                     &env->sse_status);
+    d->ZMM_L(3) = x86_float32_to_int32_round_to_zero(s->ZMM_S(3),
+                                                     &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_L(4) = x86_float32_to_int32_round_to_zero(s->ZMM_S(4),
+                                                     &env->sse_status);
+    d->ZMM_L(5) = x86_float32_to_int32_round_to_zero(s->ZMM_S(5),
+                                                     &env->sse_status);
+    d->ZMM_L(6) = x86_float32_to_int32_round_to_zero(s->ZMM_S(6),
+                                                     &env->sse_status);
+    d->ZMM_L(7) = x86_float32_to_int32_round_to_zero(s->ZMM_S(7),
+                                                     &env->sse_status);
+#endif
 }
 
 void glue(helper_cvttpd2dq, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
-    d->ZMM_L(0) = x86_float64_to_int32_round_to_zero(s->ZMM_D(0), &env->sse_status);
-    d->ZMM_L(1) = x86_float64_to_int32_round_to_zero(s->ZMM_D(1), &env->sse_status);
+    d->ZMM_L(0) = x86_float64_to_int32_round_to_zero(s->ZMM_D(0),
+                                                     &env->sse_status);
+    d->ZMM_L(1) = x86_float64_to_int32_round_to_zero(s->ZMM_D(1),
+                                                     &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_L(2) = x86_float64_to_int32_round_to_zero(s->ZMM_D(2),
+                                                     &env->sse_status);
+    d->ZMM_L(3) = x86_float64_to_int32_round_to_zero(s->ZMM_D(3),
+                                                     &env->sse_status);
+    d->ZMM_Q(2) = 0;
+    d->ZMM_Q(3) = 0;
+#else
     d->ZMM_Q(1) = 0;
+#endif
 }
 
+#if SHIFT == 1
 void helper_cvttps2pi(CPUX86State *env, MMXReg *d, ZMMReg *s)
 {
-    d->MMX_L(0) = x86_float32_to_int32_round_to_zero(s->ZMM_S(0), &env->sse_status);
-    d->MMX_L(1) = x86_float32_to_int32_round_to_zero(s->ZMM_S(1), &env->sse_status);
+    d->MMX_L(0) = x86_float32_to_int32_round_to_zero(s->ZMM_S(0),
+                                                     &env->sse_status);
+    d->MMX_L(1) = x86_float32_to_int32_round_to_zero(s->ZMM_S(1),
+                                                     &env->sse_status);
 }
 
 void helper_cvttpd2pi(CPUX86State *env, MMXReg *d, ZMMReg *s)
 {
-    d->MMX_L(0) = x86_float64_to_int32_round_to_zero(s->ZMM_D(0), &env->sse_status);
-    d->MMX_L(1) = x86_float64_to_int32_round_to_zero(s->ZMM_D(1), &env->sse_status);
+    d->MMX_L(0) = x86_float64_to_int32_round_to_zero(s->ZMM_D(0),
+                                                     &env->sse_status);
+    d->MMX_L(1) = x86_float64_to_int32_round_to_zero(s->ZMM_D(1),
+                                                     &env->sse_status);
 }
 
 int32_t helper_cvttss2si(CPUX86State *env, ZMMReg *s)
@@ -1087,6 +1168,7 @@ int64_t helper_cvttsd2sq(CPUX86State *env, ZMMReg *s)
     return x86_float64_to_int64_round_to_zero(s->ZMM_D(0), &env->sse_status);
 }
 #endif
+#endif
 
 void glue(helper_rsqrtps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
@@ -1120,6 +1202,7 @@ void glue(helper_rsqrtps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     set_float_exception_flags(old_flags, &env->sse_status);
 }
 
+#if SHIFT == 1
 void helper_rsqrtss(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
@@ -1128,6 +1211,7 @@ void helper_rsqrtss(CPUX86State *env, ZMMReg *d, ZMMReg *s)
                               &env->sse_status);
     set_float_exception_flags(old_flags, &env->sse_status);
 }
+#endif
 
 void glue(helper_rcpps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
@@ -1145,13 +1229,16 @@ void glue(helper_rcpps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     set_float_exception_flags(old_flags, &env->sse_status);
 }
 
+#if SHIFT == 1
 void helper_rcpss(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
     d->ZMM_S(0) = float32_div(float32_one, s->ZMM_S(0), &env->sse_status);
     set_float_exception_flags(old_flags, &env->sse_status);
 }
+#endif
 
+#if SHIFT == 1
 static inline uint64_t helper_extrq(uint64_t src, int shift, int len)
 {
     uint64_t mask;
@@ -1195,6 +1282,7 @@ void helper_insertq_i(CPUX86State *env, ZMMReg *d, int index, int length)
 {
     d->ZMM_Q(0) = helper_insertq(d->ZMM_Q(0), index, length);
 }
+#endif
 
 void glue(helper_haddps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
@@ -1358,6 +1446,7 @@ SSE_HELPER_CMP(cmpnlt, FPU_CMPNLT)
 SSE_HELPER_CMP(cmpnle, FPU_CMPNLE)
 SSE_HELPER_CMP(cmpord, FPU_CMPORD)
 
+#if SHIFT == 1
 static const int comis_eflags[4] = {CC_C, CC_Z, 0, CC_Z | CC_P | CC_C};
 
 void helper_ucomiss(CPUX86State *env, Reg *d, Reg *s)
@@ -1403,25 +1492,38 @@ void helper_comisd(CPUX86State *env, Reg *d, Reg *s)
     ret = float64_compare(d0, d1, &env->sse_status);
     CC_SRC = comis_eflags[ret + 1];
 }
+#endif
 
 uint32_t glue(helper_movmskps, SUFFIX)(CPUX86State *env, Reg *s)
 {
-    int b0, b1, b2, b3;
+    uint32_t mask;
 
-    b0 = s->ZMM_L(0) >> 31;
-    b1 = s->ZMM_L(1) >> 31;
-    b2 = s->ZMM_L(2) >> 31;
-    b3 = s->ZMM_L(3) >> 31;
-    return b0 | (b1 << 1) | (b2 << 2) | (b3 << 3);
+    mask = 0;
+    mask |= (s->ZMM_L(0) >> (31 - 0)) & (1 << 0);
+    mask |= (s->ZMM_L(1) >> (31 - 1)) & (1 << 1);
+    mask |= (s->ZMM_L(2) >> (31 - 2)) & (1 << 2);
+    mask |= (s->ZMM_L(3) >> (31 - 3)) & (1 << 3);
+#if SHIFT == 2
+    mask |= (s->ZMM_L(4) >> (31 - 4)) & (1 << 4);
+    mask |= (s->ZMM_L(5) >> (31 - 5)) & (1 << 5);
+    mask |= (s->ZMM_L(6) >> (31 - 6)) & (1 << 6);
+    mask |= (s->ZMM_L(7) >> (31 - 7)) & (1 << 7);
+#endif
+    return mask;
 }
 
 uint32_t glue(helper_movmskpd, SUFFIX)(CPUX86State *env, Reg *s)
 {
-    int b0, b1;
+    uint32_t mask;
 
-    b0 = s->ZMM_L(1) >> 31;
-    b1 = s->ZMM_L(3) >> 31;
-    return b0 | (b1 << 1);
+    mask = 0;
+    mask |= (s->ZMM_L(1) >> (31 - 0)) & (1 << 0);
+    mask |= (s->ZMM_L(3) >> (31 - 1)) & (1 << 1);
+#if SHIFT == 2
+    mask |= (s->ZMM_L(5) >> (31 - 2)) & (1 << 2);
+    mask |= (s->ZMM_L(7) >> (31 - 3)) & (1 << 3);
+#endif
+    return mask;
 }
 
 #endif
@@ -2233,6 +2335,7 @@ SSE_HELPER_L(helper_pmaxud, MAX)
 #define FMULLD(d, s) ((int32_t)d * (int32_t)s)
 SSE_HELPER_L(helper_pmulld, FMULLD)
 
+#if SHIFT == 1
 void glue(helper_phminposuw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     int idx = 0;
@@ -2264,6 +2367,7 @@ void glue(helper_phminposuw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     d->L(1) = 0;
     d->Q(1) = 0;
 }
+#endif
 
 void glue(helper_roundps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                   uint32_t mode)
@@ -2293,6 +2397,12 @@ void glue(helper_roundps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     d->ZMM_S(1) = float32_round_to_int(s->ZMM_S(1), &env->sse_status);
     d->ZMM_S(2) = float32_round_to_int(s->ZMM_S(2), &env->sse_status);
     d->ZMM_S(3) = float32_round_to_int(s->ZMM_S(3), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_S(4) = float32_round_to_int(s->ZMM_S(4), &env->sse_status);
+    d->ZMM_S(5) = float32_round_to_int(s->ZMM_S(5), &env->sse_status);
+    d->ZMM_S(6) = float32_round_to_int(s->ZMM_S(6), &env->sse_status);
+    d->ZMM_S(7) = float32_round_to_int(s->ZMM_S(7), &env->sse_status);
+#endif
 
     if (mode & (1 << 3) && !(old_flags & float_flag_inexact)) {
         set_float_exception_flags(get_float_exception_flags(&env->sse_status) &
@@ -2328,6 +2438,10 @@ void glue(helper_roundpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 
     d->ZMM_D(0) = float64_round_to_int(s->ZMM_D(0), &env->sse_status);
     d->ZMM_D(1) = float64_round_to_int(s->ZMM_D(1), &env->sse_status);
+#if SHIFT == 2
+    d->ZMM_D(2) = float64_round_to_int(s->ZMM_D(2), &env->sse_status);
+    d->ZMM_D(3) = float64_round_to_int(s->ZMM_D(3), &env->sse_status);
+#endif
 
     if (mode & (1 << 3) && !(old_flags & float_flag_inexact)) {
         set_float_exception_flags(get_float_exception_flags(&env->sse_status) &
@@ -2337,6 +2451,7 @@ void glue(helper_roundpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     env->sse_status.float_rounding_mode = prev_rounding_mode;
 }
 
+#if SHIFT == 1
 void glue(helper_roundss, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                   uint32_t mode)
 {
@@ -2404,6 +2519,7 @@ void glue(helper_roundsd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     }
     env->sse_status.float_rounding_mode = prev_rounding_mode;
 }
+#endif
 
 #define FBLENDP(d, s, m) (m ? s : d)
 SSE_HELPER_I(helper_blendps, L, 4, FBLENDP)
@@ -2545,6 +2661,7 @@ void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 #define FCMPGTQ(d, s) ((int64_t)d > (int64_t)s ? -1 : 0)
 SSE_HELPER_Q(helper_pcmpgtq, FCMPGTQ)
 
+#if SHIFT == 1
 static inline int pcmp_elen(CPUX86State *env, int reg, uint32_t ctrl)
 {
     target_long val, limit;
@@ -2765,6 +2882,8 @@ target_ulong helper_crc32(uint32_t crc1, target_ulong msg, uint32_t len)
     return crc;
 }
 
+#endif
+
 void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                     uint32_t ctrl)
 {
-- 
2.36.0


