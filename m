Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CC650D5CE
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:35:08 +0200 (CEST)
Received: from localhost ([::1]:37286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikot-0000Wk-3r
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikSp-0001iM-12
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:12:23 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikSm-0002pu-Cg
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:12:18 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJ7-0001ea-LV; Sun, 24 Apr 2022 23:02:17 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 14/42] i386: Add size suffix to vector FP helpers
Date: Sun, 24 Apr 2022 23:01:36 +0100
Message-Id: <20220424220204.2493824-15-paul@nowt.org>
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

For AVX we're going to need both 128 bit (xmm) and 256 bit (ymm) variants of
floating point helpers. Add the register type suffix to the existing
*PS and *PD helpers (SS and SD variants are only valid on 128 bit vectors)

No functional changes.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h        | 48 ++++++++++++++++++------------------
 target/i386/ops_sse_header.h | 48 ++++++++++++++++++------------------
 target/i386/tcg/translate.c  | 37 +++++++++++++--------------
 3 files changed, 67 insertions(+), 66 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index c645d2ddbf..fc8fd57aa5 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -699,7 +699,7 @@ void glue(helper_pshufw, SUFFIX)(Reg *d, Reg *s, int order)
     SHUFFLE4(W, s, s, 0);
 }
 #else
-void helper_shufps(Reg *d, Reg *s, int order)
+void glue(helper_shufps, SUFFIX)(Reg *d, Reg *s, int order)
 {
     Reg *v = d;
     uint32_t r0, r1, r2, r3;
@@ -710,7 +710,7 @@ void helper_shufps(Reg *d, Reg *s, int order)
 #endif
 }
 
-void helper_shufpd(Reg *d, Reg *s, int order)
+void glue(helper_shufpd, SUFFIX)(Reg *d, Reg *s, int order)
 {
     Reg *v = d;
     uint64_t r0, r1;
@@ -767,7 +767,7 @@ void glue(helper_pshufhw, SUFFIX)(Reg *d, Reg *s, int order)
 /* XXX: not accurate */
 
 #define SSE_HELPER_S(name, F)                                           \
-    void helper_ ## name ## ps(CPUX86State *env, Reg *d, Reg *s)        \
+    void glue(helper_ ## name ## ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)\
     {                                                                   \
         d->ZMM_S(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
         d->ZMM_S(1) = F(32, d->ZMM_S(1), s->ZMM_S(1));                  \
@@ -780,7 +780,7 @@ void glue(helper_pshufhw, SUFFIX)(Reg *d, Reg *s, int order)
         d->ZMM_S(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
     }                                                                   \
                                                                         \
-    void helper_ ## name ## pd(CPUX86State *env, Reg *d, Reg *s)        \
+    void glue(helper_ ## name ## pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)\
     {                                                                   \
         d->ZMM_D(0) = F(64, d->ZMM_D(0), s->ZMM_D(0));                  \
         d->ZMM_D(1) = F(64, d->ZMM_D(1), s->ZMM_D(1));                  \
@@ -816,7 +816,7 @@ SSE_HELPER_S(sqrt, FPU_SQRT)
 
 
 /* float to float conversions */
-void helper_cvtps2pd(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_cvtps2pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     float32 s0, s1;
 
@@ -826,7 +826,7 @@ void helper_cvtps2pd(CPUX86State *env, Reg *d, Reg *s)
     d->ZMM_D(1) = float32_to_float64(s1, &env->sse_status);
 }
 
-void helper_cvtpd2ps(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_cvtpd2ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     d->ZMM_S(0) = float64_to_float32(s->ZMM_D(0), &env->sse_status);
     d->ZMM_S(1) = float64_to_float32(s->ZMM_D(1), &env->sse_status);
@@ -844,7 +844,7 @@ void helper_cvtsd2ss(CPUX86State *env, Reg *d, Reg *s)
 }
 
 /* integer to float */
-void helper_cvtdq2ps(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_cvtdq2ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     d->ZMM_S(0) = int32_to_float32(s->ZMM_L(0), &env->sse_status);
     d->ZMM_S(1) = int32_to_float32(s->ZMM_L(1), &env->sse_status);
@@ -852,7 +852,7 @@ void helper_cvtdq2ps(CPUX86State *env, Reg *d, Reg *s)
     d->ZMM_S(3) = int32_to_float32(s->ZMM_L(3), &env->sse_status);
 }
 
-void helper_cvtdq2pd(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_cvtdq2pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     int32_t l0, l1;
 
@@ -929,7 +929,7 @@ WRAP_FLOATCONV(int64_t, float32_to_int64_round_to_zero, float32, INT64_MIN)
 WRAP_FLOATCONV(int64_t, float64_to_int64, float64, INT64_MIN)
 WRAP_FLOATCONV(int64_t, float64_to_int64_round_to_zero, float64, INT64_MIN)
 
-void helper_cvtps2dq(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_cvtps2dq, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     d->ZMM_L(0) = x86_float32_to_int32(s->ZMM_S(0), &env->sse_status);
     d->ZMM_L(1) = x86_float32_to_int32(s->ZMM_S(1), &env->sse_status);
@@ -937,7 +937,7 @@ void helper_cvtps2dq(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     d->ZMM_L(3) = x86_float32_to_int32(s->ZMM_S(3), &env->sse_status);
 }
 
-void helper_cvtpd2dq(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_cvtpd2dq, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     d->ZMM_L(0) = x86_float64_to_int32(s->ZMM_D(0), &env->sse_status);
     d->ZMM_L(1) = x86_float64_to_int32(s->ZMM_D(1), &env->sse_status);
@@ -979,7 +979,7 @@ int64_t helper_cvtsd2sq(CPUX86State *env, ZMMReg *s)
 #endif
 
 /* float to integer truncated */
-void helper_cvttps2dq(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_cvttps2dq, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     d->ZMM_L(0) = x86_float32_to_int32_round_to_zero(s->ZMM_S(0), &env->sse_status);
     d->ZMM_L(1) = x86_float32_to_int32_round_to_zero(s->ZMM_S(1), &env->sse_status);
@@ -987,7 +987,7 @@ void helper_cvttps2dq(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     d->ZMM_L(3) = x86_float32_to_int32_round_to_zero(s->ZMM_S(3), &env->sse_status);
 }
 
-void helper_cvttpd2dq(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_cvttpd2dq, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     d->ZMM_L(0) = x86_float64_to_int32_round_to_zero(s->ZMM_D(0), &env->sse_status);
     d->ZMM_L(1) = x86_float64_to_int32_round_to_zero(s->ZMM_D(1), &env->sse_status);
@@ -1028,7 +1028,7 @@ int64_t helper_cvttsd2sq(CPUX86State *env, ZMMReg *s)
 }
 #endif
 
-void helper_rsqrtps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_rsqrtps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
     d->ZMM_S(0) = float32_div(float32_one,
@@ -1055,7 +1055,7 @@ void helper_rsqrtss(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     set_float_exception_flags(old_flags, &env->sse_status);
 }
 
-void helper_rcpps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_rcpps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
     d->ZMM_S(0) = float32_div(float32_one, s->ZMM_S(0), &env->sse_status);
@@ -1116,7 +1116,7 @@ void helper_insertq_i(CPUX86State *env, ZMMReg *d, int index, int length)
     d->ZMM_Q(0) = helper_insertq(d->ZMM_Q(0), index, length);
 }
 
-void helper_haddps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_haddps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     ZMMReg r;
 
@@ -1127,7 +1127,7 @@ void helper_haddps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     MOVE(*d, r);
 }
 
-void helper_haddpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_haddpd, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     ZMMReg r;
 
@@ -1136,7 +1136,7 @@ void helper_haddpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     MOVE(*d, r);
 }
 
-void helper_hsubps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_hsubps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     ZMMReg r;
 
@@ -1147,7 +1147,7 @@ void helper_hsubps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     MOVE(*d, r);
 }
 
-void helper_hsubpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_hsubpd, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     ZMMReg r;
 
@@ -1156,7 +1156,7 @@ void helper_hsubpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     MOVE(*d, r);
 }
 
-void helper_addsubps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_addsubps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     d->ZMM_S(0) = float32_sub(d->ZMM_S(0), s->ZMM_S(0), &env->sse_status);
     d->ZMM_S(1) = float32_add(d->ZMM_S(1), s->ZMM_S(1), &env->sse_status);
@@ -1164,7 +1164,7 @@ void helper_addsubps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     d->ZMM_S(3) = float32_add(d->ZMM_S(3), s->ZMM_S(3), &env->sse_status);
 }
 
-void helper_addsubpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     d->ZMM_D(0) = float64_sub(d->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
     d->ZMM_D(1) = float64_add(d->ZMM_D(1), s->ZMM_D(1), &env->sse_status);
@@ -1172,7 +1172,7 @@ void helper_addsubpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 
 /* XXX: unordered */
 #define SSE_HELPER_CMP(name, F)                                         \
-    void helper_ ## name ## ps(CPUX86State *env, Reg *d, Reg *s)        \
+    void glue(helper_ ## name ## ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)\
     {                                                                   \
         d->ZMM_L(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
         d->ZMM_L(1) = F(32, d->ZMM_S(1), s->ZMM_S(1));                  \
@@ -1185,7 +1185,7 @@ void helper_addsubpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
         d->ZMM_L(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
     }                                                                   \
                                                                         \
-    void helper_ ## name ## pd(CPUX86State *env, Reg *d, Reg *s)        \
+    void glue(helper_ ## name ## pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)\
     {                                                                   \
         d->ZMM_Q(0) = F(64, d->ZMM_D(0), s->ZMM_D(0));                  \
         d->ZMM_Q(1) = F(64, d->ZMM_D(1), s->ZMM_D(1));                  \
@@ -1268,7 +1268,7 @@ void helper_comisd(CPUX86State *env, Reg *d, Reg *s)
     CC_SRC = comis_eflags[ret + 1];
 }
 
-uint32_t helper_movmskps(CPUX86State *env, Reg *s)
+uint32_t glue(helper_movmskps, SUFFIX)(CPUX86State *env, Reg *s)
 {
     int b0, b1, b2, b3;
 
@@ -1279,7 +1279,7 @@ uint32_t helper_movmskps(CPUX86State *env, Reg *s)
     return b0 | (b1 << 1) | (b2 << 2) | (b3 << 3);
 }
 
-uint32_t helper_movmskpd(CPUX86State *env, Reg *s)
+uint32_t glue(helper_movmskpd, SUFFIX)(CPUX86State *env, Reg *s)
 {
     int b0, b1;
 
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 7e7f2cee2a..b8b0666f61 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -126,8 +126,8 @@ DEF_HELPER_2(glue(movq_mm_T0, SUFFIX), void, Reg, i64)
 #if SHIFT == 0
 DEF_HELPER_3(glue(pshufw, SUFFIX), void, Reg, Reg, int)
 #else
-DEF_HELPER_3(shufps, void, Reg, Reg, int)
-DEF_HELPER_3(shufpd, void, Reg, Reg, int)
+DEF_HELPER_3(glue(shufps, SUFFIX), void, Reg, Reg, int)
+DEF_HELPER_3(glue(shufpd, SUFFIX), void, Reg, Reg, int)
 DEF_HELPER_3(glue(pshufd, SUFFIX), void, Reg, Reg, int)
 DEF_HELPER_3(glue(pshuflw, SUFFIX), void, Reg, Reg, int)
 DEF_HELPER_3(glue(pshufhw, SUFFIX), void, Reg, Reg, int)
@@ -138,9 +138,9 @@ DEF_HELPER_3(glue(pshufhw, SUFFIX), void, Reg, Reg, int)
 /* XXX: not accurate */
 
 #define SSE_HELPER_S(name, F)                            \
-    DEF_HELPER_3(name ## ps, void, env, Reg, Reg)        \
+    DEF_HELPER_3(glue(name ## ps, SUFFIX), void, env, Reg, Reg)        \
     DEF_HELPER_3(name ## ss, void, env, Reg, Reg)        \
-    DEF_HELPER_3(name ## pd, void, env, Reg, Reg)        \
+    DEF_HELPER_3(glue(name ## pd, SUFFIX), void, env, Reg, Reg)        \
     DEF_HELPER_3(name ## sd, void, env, Reg, Reg)
 
 SSE_HELPER_S(add, FPU_ADD)
@@ -152,12 +152,12 @@ SSE_HELPER_S(max, FPU_MAX)
 SSE_HELPER_S(sqrt, FPU_SQRT)
 
 
-DEF_HELPER_3(cvtps2pd, void, env, Reg, Reg)
-DEF_HELPER_3(cvtpd2ps, void, env, Reg, Reg)
+DEF_HELPER_3(glue(cvtps2pd, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(cvtpd2ps, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(cvtss2sd, void, env, Reg, Reg)
 DEF_HELPER_3(cvtsd2ss, void, env, Reg, Reg)
-DEF_HELPER_3(cvtdq2ps, void, env, Reg, Reg)
-DEF_HELPER_3(cvtdq2pd, void, env, Reg, Reg)
+DEF_HELPER_3(glue(cvtdq2ps, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(cvtdq2pd, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(cvtpi2ps, void, env, ZMMReg, MMXReg)
 DEF_HELPER_3(cvtpi2pd, void, env, ZMMReg, MMXReg)
 DEF_HELPER_3(cvtsi2ss, void, env, ZMMReg, i32)
@@ -168,8 +168,8 @@ DEF_HELPER_3(cvtsq2ss, void, env, ZMMReg, i64)
 DEF_HELPER_3(cvtsq2sd, void, env, ZMMReg, i64)
 #endif
 
-DEF_HELPER_3(cvtps2dq, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(cvtpd2dq, void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(cvtps2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(cvtpd2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(cvtps2pi, void, env, MMXReg, ZMMReg)
 DEF_HELPER_3(cvtpd2pi, void, env, MMXReg, ZMMReg)
 DEF_HELPER_2(cvtss2si, s32, env, ZMMReg)
@@ -179,8 +179,8 @@ DEF_HELPER_2(cvtss2sq, s64, env, ZMMReg)
 DEF_HELPER_2(cvtsd2sq, s64, env, ZMMReg)
 #endif
 
-DEF_HELPER_3(cvttps2dq, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(cvttpd2dq, void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(cvttps2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(cvttpd2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(cvttps2pi, void, env, MMXReg, ZMMReg)
 DEF_HELPER_3(cvttpd2pi, void, env, MMXReg, ZMMReg)
 DEF_HELPER_2(cvttss2si, s32, env, ZMMReg)
@@ -190,25 +190,25 @@ DEF_HELPER_2(cvttss2sq, s64, env, ZMMReg)
 DEF_HELPER_2(cvttsd2sq, s64, env, ZMMReg)
 #endif
 
-DEF_HELPER_3(rsqrtps, void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(rsqrtps, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(rsqrtss, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(rcpps, void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(rcpps, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(rcpss, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(extrq_r, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_4(extrq_i, void, env, ZMMReg, int, int)
 DEF_HELPER_3(insertq_r, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_4(insertq_i, void, env, ZMMReg, int, int)
-DEF_HELPER_3(haddps, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(haddpd, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(hsubps, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(hsubpd, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(addsubps, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(addsubpd, void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(haddps, SUFFIX), void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(haddpd, SUFFIX), void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(hsubps, SUFFIX), void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(hsubpd, SUFFIX), void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(addsubps, SUFFIX), void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(addsubpd, SUFFIX), void, env, ZMMReg, ZMMReg)
 
 #define SSE_HELPER_CMP(name, F)                           \
-    DEF_HELPER_3(name ## ps, void, env, Reg, Reg)         \
+    DEF_HELPER_3(glue(name ## ps, SUFFIX), void, env, Reg, Reg)         \
     DEF_HELPER_3(name ## ss, void, env, Reg, Reg)         \
-    DEF_HELPER_3(name ## pd, void, env, Reg, Reg)         \
+    DEF_HELPER_3(glue(name ## pd, SUFFIX), void, env, Reg, Reg)         \
     DEF_HELPER_3(name ## sd, void, env, Reg, Reg)
 
 SSE_HELPER_CMP(cmpeq, FPU_CMPEQ)
@@ -224,8 +224,8 @@ DEF_HELPER_3(ucomiss, void, env, Reg, Reg)
 DEF_HELPER_3(comiss, void, env, Reg, Reg)
 DEF_HELPER_3(ucomisd, void, env, Reg, Reg)
 DEF_HELPER_3(comisd, void, env, Reg, Reg)
-DEF_HELPER_2(movmskps, i32, env, Reg)
-DEF_HELPER_2(movmskpd, i32, env, Reg)
+DEF_HELPER_2(glue(movmskps, SUFFIX), i32, env, Reg)
+DEF_HELPER_2(glue(movmskpd, SUFFIX), i32, env, Reg)
 #endif
 
 DEF_HELPER_2(glue(pmovmskb, SUFFIX), i32, env, Reg)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index e9e6062b7f..63b32a77e3 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2807,7 +2807,7 @@ typedef void (*SSEFunc_0_eppt)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
         gen_helper_ ## x ## _mmx, gen_helper_ ## x ## _xmm, NULL, NULL)
 
 #define SSE_FOP(name) OP(op2, SSE_OPF_SCALAR, \
-        gen_helper_##name##ps, gen_helper_##name##pd, \
+        gen_helper_##name##ps##_xmm, gen_helper_##name##pd##_xmm, \
         gen_helper_##name##ss, gen_helper_##name##sd)
 #define SSE_OP(sname, dname, op, flags) OP(op, flags, \
         gen_helper_##sname##_xmm, gen_helper_##dname##_xmm, NULL, NULL)
@@ -2846,12 +2846,12 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
             gen_helper_comiss, gen_helper_comisd, NULL, NULL),
     [0x50] = SSE_SPECIAL, /* movmskps, movmskpd */
     [0x51] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
-                gen_helper_sqrtps, gen_helper_sqrtpd,
+                gen_helper_sqrtps_xmm, gen_helper_sqrtpd_xmm,
                 gen_helper_sqrtss, gen_helper_sqrtsd),
     [0x52] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
-                gen_helper_rsqrtps, NULL, gen_helper_rsqrtss, NULL),
+                gen_helper_rsqrtps_xmm, NULL, gen_helper_rsqrtss, NULL),
     [0x53] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
-                gen_helper_rcpps, NULL, gen_helper_rcpss, NULL),
+                gen_helper_rcpps_xmm, NULL, gen_helper_rcpss, NULL),
     [0x54] = SSE_OP(pand, pand, op2, 0), /* andps, andpd */
     [0x55] = SSE_OP(pandn, pandn, op2, 0), /* andnps, andnpd */
     [0x56] = SSE_OP(por, por, op2, 0), /* orps, orpd */
@@ -2859,19 +2859,19 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0x58] = SSE_FOP(add),
     [0x59] = SSE_FOP(mul),
     [0x5a] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
-                gen_helper_cvtps2pd, gen_helper_cvtpd2ps,
+                gen_helper_cvtps2pd_xmm, gen_helper_cvtpd2ps_xmm,
                 gen_helper_cvtss2sd, gen_helper_cvtsd2ss),
     [0x5b] = OP(op1, SSE_OPF_V0,
-                gen_helper_cvtdq2ps, gen_helper_cvtps2dq,
-                gen_helper_cvttps2dq, NULL),
+                gen_helper_cvtdq2ps_xmm, gen_helper_cvtps2dq_xmm,
+                gen_helper_cvttps2dq_xmm, NULL),
     [0x5c] = SSE_FOP(sub),
     [0x5d] = SSE_FOP(min),
     [0x5e] = SSE_FOP(div),
     [0x5f] = SSE_FOP(max),
 
     [0xc2] = SSE_FOP(cmpeq), /* sse_op_table4 */
-    [0xc6] = OP(dummy, SSE_OPF_SHUF, (SSEFunc_0_epp)gen_helper_shufps,
-                (SSEFunc_0_epp)gen_helper_shufpd, NULL, NULL),
+    [0xc6] = OP(dummy, SSE_OPF_SHUF, (SSEFunc_0_epp)gen_helper_shufps_xmm,
+                (SSEFunc_0_epp)gen_helper_shufpd_xmm, NULL, NULL),
 
     /* SSSE3, SSE4, MOVBE, CRC32, BMI1, BMI2, ADX.  */
     [0x38] = SSE_SPECIAL,
@@ -2912,15 +2912,15 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0x79] = OP(op1, SSE_OPF_V0,
             NULL, gen_helper_extrq_r, NULL, gen_helper_insertq_r),
     [0x7c] = OP(op2, 0,
-                NULL, gen_helper_haddpd, NULL, gen_helper_haddps),
+                NULL, gen_helper_haddpd_xmm, NULL, gen_helper_haddps_xmm),
     [0x7d] = OP(op2, 0,
-                NULL, gen_helper_hsubpd, NULL, gen_helper_hsubps),
+                NULL, gen_helper_hsubpd_xmm, NULL, gen_helper_hsubps_xmm),
     [0x7e] = SSE_SPECIAL, /* movd, movd, , movq */
     [0x7f] = SSE_SPECIAL, /* movq, movdqa, movdqu */
     [0xc4] = SSE_SPECIAL, /* pinsrw */
     [0xc5] = SSE_SPECIAL, /* pextrw */
     [0xd0] = OP(op2, 0,
-                NULL, gen_helper_addsubpd, NULL, gen_helper_addsubps),
+                NULL, gen_helper_addsubpd_xmm, NULL, gen_helper_addsubps_xmm),
     [0xd1] = MMX_OP(psrlw),
     [0xd2] = MMX_OP(psrld),
     [0xd3] = MMX_OP(psrlq),
@@ -2943,8 +2943,8 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0xe4] = MMX_OP(pmulhuw),
     [0xe5] = MMX_OP(pmulhw),
     [0xe6] = OP(op1, SSE_OPF_V0,
-            NULL, gen_helper_cvttpd2dq,
-            gen_helper_cvtdq2pd, gen_helper_cvtpd2dq),
+            NULL, gen_helper_cvttpd2dq_xmm,
+            gen_helper_cvtdq2pd_xmm, gen_helper_cvtpd2dq_xmm),
     [0xe7] = SSE_SPECIAL,  /* movntq, movntq */
     [0xe8] = MMX_OP(psubsb),
     [0xe9] = MMX_OP(psubsw),
@@ -3021,8 +3021,9 @@ static const SSEFunc_l_ep sse_op_table3bq[] = {
 };
 #endif
 
-#define SSE_FOP(x) { gen_helper_ ## x ## ps, gen_helper_ ## x ## pd, \
-                     gen_helper_ ## x ## ss, gen_helper_ ## x ## sd, }
+#define SSE_FOP(x) { \
+    gen_helper_ ## x ## ps ## _xmm, gen_helper_ ## x ## pd ## _xmm, \
+    gen_helper_ ## x ## ss, gen_helper_ ## x ## sd}
 static const SSEFunc_0_epp sse_op_table4[8][4] = {
     SSE_FOP(cmpeq),
     SSE_FOP(cmplt),
@@ -3718,14 +3719,14 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             CHECK_AVX_V0(s);
             rm = (modrm & 7) | REX_B(s);
             tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(rm));
-            gen_helper_movmskps(s->tmp2_i32, cpu_env, s->ptr0);
+            gen_helper_movmskps_xmm(s->tmp2_i32, cpu_env, s->ptr0);
             tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
             break;
         case 0x150: /* movmskpd */
             CHECK_AVX_V0(s);
             rm = (modrm & 7) | REX_B(s);
             tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(rm));
-            gen_helper_movmskpd(s->tmp2_i32, cpu_env, s->ptr0);
+            gen_helper_movmskpd_xmm(s->tmp2_i32, cpu_env, s->ptr0);
             tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
             break;
         case 0x02a: /* cvtpi2ps */
-- 
2.36.0


