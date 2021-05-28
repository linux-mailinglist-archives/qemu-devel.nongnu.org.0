Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2369D3946A6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 19:44:23 +0200 (CEST)
Received: from localhost ([::1]:38308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmgWz-0005VV-Na
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 13:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mmorrell@tachyum.com>)
 id 1lmgU4-0002om-KS
 for qemu-devel@nongnu.org; Fri, 28 May 2021 13:41:20 -0400
Received: from mx1.tachyum.com ([66.160.133.170]:46134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mmorrell@tachyum.com>)
 id 1lmgU1-0003XJ-J0
 for qemu-devel@nongnu.org; Fri, 28 May 2021 13:41:20 -0400
Received: by mx1.tachyum.com (Postfix, from userid 1000)
 id 37B021005694; Fri, 28 May 2021 10:41:15 -0700 (PDT)
Received: from THQ-EX1.tachyum.com (unknown [10.7.1.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.tachyum.com (Postfix) with ESMTPS id 42F9A1005283;
 Fri, 28 May 2021 10:41:13 -0700 (PDT)
Received: from THQ-EX1.tachyum.com (10.7.1.6) by THQ-EX1.tachyum.com
 (10.7.1.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 28 May
 2021 10:41:12 -0700
Received: from THQ-EX1.tachyum.com ([10.7.1.6]) by THQ-EX1.tachyum.com
 ([10.7.1.6]) with mapi id 15.01.2176.014; Fri, 28 May 2021 10:41:12 -0700
From: Michael Morrell <mmorrell@tachyum.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 03/11] softfloat: Introduce float_flag_inorm_denormal
Thread-Topic: [PATCH 03/11] softfloat: Introduce float_flag_inorm_denormal
Thread-Index: AQHXUq7C6V3VKBa6hEShFdzfX5jx76r5KqnA
Date: Fri, 28 May 2021 17:41:12 +0000
Message-ID: <44a76e8c6504461cbd4dc5752f0d443b@tachyum.com>
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-4-richard.henderson@linaro.org>
In-Reply-To: <20210527041405.391567-4-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.252.4]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=66.160.133.170; envelope-from=mmorrell@tachyum.com;
 helo=mx1.tachyum.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm probably missing something, but why do we need both "float_flag_inorm_d=
enormal" and "float_flag_iflush_denormal"?

Couldn't the code that sets these flags set just a single flag for all deno=
rmal inputs and the code that checks these flags check that single flag
combined with the "flush_inputs_to_zero" flag to accomplish what the two se=
parate "input denormal" flags do?

   Michael

-----Original Message-----
From: Richard Henderson <richard.henderson@linaro.org>=20
Sent: Wednesday, May 26, 2021 9:14 PM
To: qemu-devel@nongnu.org
Cc: Michael Morrell <mmorrell@tachyum.com>; alex.bennee@linaro.org
Subject: [PATCH 03/11] softfloat: Introduce float_flag_inorm_denormal

Create a new exception flag for reporting input denormals that are not flus=
hed to zero, they are normalized and treated as normal numbers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-types.h | 15 ++++---
 fpu/softfloat.c               | 84 +++++++++++------------------------
 fpu/softfloat-parts.c.inc     |  1 +
 3 files changed, 36 insertions(+), 64 deletions(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h =
index e2d70ff556..174100e50e 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -143,13 +143,14 @@ typedef enum __attribute__((__packed__)) {
  */
=20
 enum {
-    float_flag_invalid   =3D  1,
-    float_flag_divbyzero =3D  4,
-    float_flag_overflow  =3D  8,
-    float_flag_underflow =3D 16,
-    float_flag_inexact   =3D 32,
-    float_flag_iflush_denormal =3D 64,
-    float_flag_oflush_denormal =3D 128
+    float_flag_invalid         =3D 0x0001,
+    float_flag_divbyzero       =3D 0x0002,
+    float_flag_overflow        =3D 0x0004,
+    float_flag_underflow       =3D 0x0008,
+    float_flag_inexact         =3D 0x0010,
+    float_flag_inorm_denormal  =3D 0x0020,  /* denormal input, normalized =
*/
+    float_flag_iflush_denormal =3D 0x0040,  /* denormal input, flushed to =
zero */
+    float_flag_oflush_denormal =3D 0x0080,  /* denormal result, flushed=20
+ to zero */
 };
=20
 /*
diff --git a/fpu/softfloat.c b/fpu/softfloat.c index cb077cf111..e54cdb274d=
 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -126,61 +126,23 @@ this code that are retained.
  * denormal/inf/NaN; (2) when operands are not guaranteed to lead to a 0 r=
esult
  * and the result is < the minimum normal.
  */
-#define GEN_INPUT_FLUSH__NOCHECK(name, soft_t)                          \
+
+#define GEN_INPUT_FLUSH(name, soft_t)                                   \
     static inline void name(soft_t *a, float_status *s)                 \
     {                                                                   \
         if (unlikely(soft_t ## _is_denormal(*a))) {                     \
-            *a =3D soft_t ## _set_sign(soft_t ## _zero,                   =
\
-                                     soft_t ## _is_neg(*a));            \
-            float_raise(float_flag_iflush_denormal, s);                  \
+            if (s->flush_inputs_to_zero) {                              \
+                *a =3D soft_t ## _set_sign(0, soft_t ## _is_neg(*a));     =
\
+                float_raise(float_flag_iflush_denormal, s);             \
+            } else {                                                    \
+                float_raise(float_flag_inorm_denormal, s);              \
+            }                                                           \
         }                                                               \
     }
=20
-GEN_INPUT_FLUSH__NOCHECK(float32_input_flush__nocheck, float32) -GEN_INPUT=
_FLUSH__NOCHECK(float64_input_flush__nocheck, float64) -#undef GEN_INPUT_FL=
USH__NOCHECK
-
-#define GEN_INPUT_FLUSH1(name, soft_t)                  \
-    static inline void name(soft_t *a, float_status *s) \
-    {                                                   \
-        if (likely(!s->flush_inputs_to_zero)) {         \
-            return;                                     \
-        }                                               \
-        soft_t ## _input_flush__nocheck(a, s);          \
-    }
-
-GEN_INPUT_FLUSH1(float32_input_flush1, float32) -GEN_INPUT_FLUSH1(float64_=
input_flush1, float64) -#undef GEN_INPUT_FLUSH1
-
-#define GEN_INPUT_FLUSH2(name, soft_t)                                  \
-    static inline void name(soft_t *a, soft_t *b, float_status *s)      \
-    {                                                                   \
-        if (likely(!s->flush_inputs_to_zero)) {                         \
-            return;                                                     \
-        }                                                               \
-        soft_t ## _input_flush__nocheck(a, s);                          \
-        soft_t ## _input_flush__nocheck(b, s);                          \
-    }
-
-GEN_INPUT_FLUSH2(float32_input_flush2, float32) -GEN_INPUT_FLUSH2(float64_=
input_flush2, float64) -#undef GEN_INPUT_FLUSH2
-
-#define GEN_INPUT_FLUSH3(name, soft_t)                                  \
-    static inline void name(soft_t *a, soft_t *b, soft_t *c, float_status =
*s) \
-    {                                                                   \
-        if (likely(!s->flush_inputs_to_zero)) {                         \
-            return;                                                     \
-        }                                                               \
-        soft_t ## _input_flush__nocheck(a, s);                          \
-        soft_t ## _input_flush__nocheck(b, s);                          \
-        soft_t ## _input_flush__nocheck(c, s);                          \
-    }
-
-GEN_INPUT_FLUSH3(float32_input_flush3, float32) -GEN_INPUT_FLUSH3(float64_=
input_flush3, float64) -#undef GEN_INPUT_FLUSH3
+GEN_INPUT_FLUSH(float32_input_flush, float32)=20
+GEN_INPUT_FLUSH(float64_input_flush, float64) #undef GEN_INPUT_FLUSH
=20
 /*
  * Choose whether to use fpclassify or float32/64_* primitives in the gene=
rated @@ -353,7 +315,8 @@ float32_gen2(float32 xa, float32 xb, float_status=
 *s,
         goto soft;
     }
=20
-    float32_input_flush2(&ua.s, &ub.s, s);
+    float32_input_flush(&ua.s, s);
+    float32_input_flush(&ub.s, s);
     if (unlikely(!pre(ua, ub))) {
         goto soft;
     }
@@ -384,7 +347,8 @@ float64_gen2(float64 xa, float64 xb, float_status *s,
         goto soft;
     }
=20
-    float64_input_flush2(&ua.s, &ub.s, s);
+    float64_input_flush(&ua.s, s);
+    float64_input_flush(&ub.s, s);
     if (unlikely(!pre(ua, ub))) {
         goto soft;
     }
@@ -2161,7 +2125,9 @@ float32_muladd(float32 xa, float32 xb, float32 xc, in=
t flags, float_status *s)
         goto soft;
     }
=20
-    float32_input_flush3(&ua.s, &ub.s, &uc.s, s);
+    float32_input_flush(&ua.s, s);
+    float32_input_flush(&ub.s, s);
+    float32_input_flush(&uc.s, s);
     if (unlikely(!f32_is_zon3(ua, ub, uc))) {
         goto soft;
     }
@@ -2232,7 +2198,9 @@ float64_muladd(float64 xa, float64 xb, float64 xc, in=
t flags, float_status *s)
         goto soft;
     }
=20
-    float64_input_flush3(&ua.s, &ub.s, &uc.s, s);
+    float64_input_flush(&ua.s, s);
+    float64_input_flush(&ub.s, s);
+    float64_input_flush(&uc.s, s);
     if (unlikely(!f64_is_zon3(ua, ub, uc))) {
         goto soft;
     }
@@ -3988,7 +3956,8 @@ float32_hs_compare(float32 xa, float32 xb, float_stat=
us *s, bool is_quiet)
         goto soft;
     }
=20
-    float32_input_flush2(&ua.s, &ub.s, s);
+    float32_input_flush(&ua.s, s);
+    float32_input_flush(&ub.s, s);
     if (isgreaterequal(ua.h, ub.h)) {
         if (isgreater(ua.h, ub.h)) {
             return float_relation_greater; @@ -4038,7 +4007,8 @@ float64_h=
s_compare(float64 xa, float64 xb, float_status *s, bool is_quiet)
         goto soft;
     }
=20
-    float64_input_flush2(&ua.s, &ub.s, s);
+    float64_input_flush(&ua.s, s);
+    float64_input_flush(&ub.s, s);
     if (isgreaterequal(ua.h, ub.h)) {
         if (isgreater(ua.h, ub.h)) {
             return float_relation_greater; @@ -4230,7 +4200,7 @@ float32 Q=
EMU_FLATTEN float32_sqrt(float32 xa, float_status *s)
         goto soft;
     }
=20
-    float32_input_flush1(&ua.s, s);
+    float32_input_flush(&ua.s, s);
     if (QEMU_HARDFLOAT_1F32_USE_FP) {
         if (unlikely(!(fpclassify(ua.h) =3D=3D FP_NORMAL ||
                        fpclassify(ua.h) =3D=3D FP_ZERO) || @@ -4257,7 +422=
7,7 @@ float64 QEMU_FLATTEN float64_sqrt(float64 xa, float_status *s)
         goto soft;
     }
=20
-    float64_input_flush1(&ua.s, s);
+    float64_input_flush(&ua.s, s);
     if (QEMU_HARDFLOAT_1F64_USE_FP) {
         if (unlikely(!(fpclassify(ua.h) =3D=3D FP_NORMAL ||
                        fpclassify(ua.h) =3D=3D FP_ZERO) || diff --git a/fp=
u/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc index 72e2b24539..16d44=
25419 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -119,6 +119,7 @@ static void partsN(canonicalize)(FloatPartsN *p, float_=
status *status,
             int shift =3D frac_normalize(p);
             p->cls =3D float_class_normal;
             p->exp =3D fmt->frac_shift - fmt->exp_bias - shift + 1;
+            float_raise(float_flag_inorm_denormal, status);
         }
     } else if (likely(p->exp < fmt->exp_max) || fmt->arm_althp) {
         p->cls =3D float_class_normal;
--
2.25.1


