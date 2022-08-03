Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E038588C13
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 14:29:13 +0200 (CEST)
Received: from localhost ([::1]:36098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJDUs-0005VL-RV
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 08:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oJDOh-0007nS-P0; Wed, 03 Aug 2022 08:22:47 -0400
Received: from [200.168.210.66] (port=61218 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oJDOf-000706-8C; Wed, 03 Aug 2022 08:22:47 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 3 Aug 2022 09:22:35 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 59B928003B3;
 Wed,  3 Aug 2022 09:22:35 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, danielhb413@gmail.com,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [RFC PATCH 1/3] target/ppc: Bugfix fadd/fsub result with OE/UE set
Date: Wed,  3 Aug 2022 09:22:15 -0300
Message-Id: <20220803122217.20847-2-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220803122217.20847-1-lucas.araujo@eldorado.org.br>
References: <20220803122217.20847-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Aug 2022 12:22:35.0668 (UTC)
 FILETIME=[B6A22540:01D8A733]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

As mentioned in the functions float_overflow_excp and
float_underflow_excp, the result should be adjusted as mentioned in the
ISA (subtracted 192/1536 from the exponent of the intermediate result if
an overflow occurs with OE set and added 192/1536 to the exponent of the
intermediate result if an underflow occurs with UE set), but at those
functions the result has already been rounded so it is not possible to
add/subtract from the intermediate result anymore.
 
This patch creates a new function that receives the value that should be
subtracted/added from the exponent if an overflow/underflow happens, to
not leave some arbitrary numbers from the PowerISA in the middle of the
FPU code. If these numbers are 0 the new functions just call the old
ones.

I used 2 values here for overflow and underflow, maybe it'd be better to
just use the same ones, any thoughts?

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
An alternative I've thought was to always return the value adjusted if a
overflow or underflow occurs and in float_underflow_excp and
float_overflow_excp adjust it to inf/den/0 if OE/UE is 0, but I didn't
saw many advantages to that approach.
---
 fpu/softfloat.c         | 75 +++++++++++++++++++++++++++++++++++++++++
 include/fpu/softfloat.h |  2 ++
 target/ppc/fpu_helper.c | 10 ++++--
 3 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 4a871ef2a1..a407129dcb 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -268,6 +268,8 @@ typedef bool (*f64_check_fn)(union_float64 a, union_float64 b);
 
 typedef float32 (*soft_f32_op2_fn)(float32 a, float32 b, float_status *s);
 typedef float64 (*soft_f64_op2_fn)(float64 a, float64 b, float_status *s);
+typedef float64 (*soft_f64_op2_int2_fn)(float64 a, float64 b, int c, int d,
+                                        float_status *s);
 typedef float   (*hard_f32_op2_fn)(float a, float b);
 typedef double  (*hard_f64_op2_fn)(double a, double b);
 
@@ -401,6 +403,19 @@ float64_gen2(float64 xa, float64 xb, float_status *s,
     return soft(ua.s, ub.s, s);
 }
 
+static inline float64
+float64_gen2_excp(float64 xa, float64 xb, int xc, int xd, float_status *s,
+                  hard_f64_op2_fn hard, soft_f64_op2_fn soft,
+                  soft_f64_op2_int2_fn soft_excp, f64_check_fn pre,
+                  f64_check_fn post)
+{
+    if (xc || xd) {
+        return soft_excp(xa, xb, xc, xd, s);
+    } else {
+        return float64_gen2(xa, xb, s, hard, soft, pre, post);
+    }
+}
+
 /*
  * Classify a floating point number. Everything above float_class_qnan
  * is a NaN so cls >= float_class_qnan is any NaN.
@@ -1929,6 +1944,39 @@ static double hard_f64_sub(double a, double b)
     return a - b;
 }
 
+static float64 QEMU_SOFTFLOAT_ATTR
+soft_f64_addsub_excp_en(float64 a, float64 b, int oe_sub, int ue_sum,
+                        float_status *status, bool subtract)
+{
+    FloatParts64 pa, pb, *pr;
+
+    float64_unpack_canonical(&pa, a, status);
+    float64_unpack_canonical(&pb, b, status);
+    pr = parts_addsub(&pa, &pb, status, subtract);
+
+    if (unlikely(oe_sub && (pr->exp > 1023))) {
+        pr->exp -= oe_sub;
+        float_raise(float_flag_overflow, status);
+    } else if (unlikely(ue_sum && (pr->exp < -1022))) {
+        pr->exp += ue_sum;
+        float_raise(float_flag_underflow, status);
+    }
+
+    return float64_round_pack_canonical(pr, status);
+}
+
+static float64 soft_f64_add_excp_en(float64 a, float64 b, int oe_sub,
+                                    int ue_sum, float_status *status)
+{
+    return soft_f64_addsub_excp_en(a, b, oe_sub, ue_sum, status, false);
+}
+
+static float64 soft_f64_sub_excp_en(float64 a, float64 b, int oe_sub,
+                                    int ue_sum, float_status *status)
+{
+    return soft_f64_addsub_excp_en(a, b, oe_sub, ue_sum, status, true);
+}
+
 static bool f32_addsubmul_post(union_float32 a, union_float32 b)
 {
     if (QEMU_HARDFLOAT_2F32_USE_FP) {
@@ -1960,6 +2008,15 @@ static float64 float64_addsub(float64 a, float64 b, float_status *s,
                         f64_is_zon2, f64_addsubmul_post);
 }
 
+static float64 float64_addsub_excp_en(float64 a, float64 b, int oe_sum,
+                                      int ue_sub, float_status *s,
+                                      hard_f64_op2_fn hard, soft_f64_op2_fn soft,
+                                      soft_f64_op2_int2_fn soft_excp)
+{
+    return float64_gen2_excp(a, b, oe_sum, ue_sub, s, hard, soft, soft_excp,
+                             f64_is_zon2, f64_addsubmul_post);
+}
+
 float32 QEMU_FLATTEN
 float32_add(float32 a, float32 b, float_status *s)
 {
@@ -1984,6 +2041,24 @@ float64_sub(float64 a, float64 b, float_status *s)
     return float64_addsub(a, b, s, hard_f64_sub, soft_f64_sub);
 }
 
+float64 QEMU_FLATTEN
+float64_add_excp_en(float64 a, float64 b, int oe_sub, int ue_sum,
+                    float_status *s)
+{
+    return float64_addsub_excp_en(a, b, oe_sub, ue_sum, s,
+                                  hard_f64_add, soft_f64_add,
+                                  soft_f64_add_excp_en);
+}
+
+float64 QEMU_FLATTEN
+float64_sub_excp_en(float64 a, float64 b, int oe_sub, int ue_sum,
+                    float_status *s)
+{
+    return float64_addsub_excp_en(a, b, oe_sub, ue_sum, s,
+                                  hard_f64_sub, soft_f64_sub,
+                                  soft_f64_sub_excp_en);
+}
+
 static float64 float64r32_addsub(float64 a, float64 b, float_status *status,
                                  bool subtract)
 {
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 3dcf20e3a2..76bf628a29 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -772,7 +772,9 @@ float128 float64_to_float128(float64, float_status *status);
 *----------------------------------------------------------------------------*/
 float64 float64_round_to_int(float64, float_status *status);
 float64 float64_add(float64, float64, float_status *status);
+float64 float64_add_excp_en(float64, float64, int, int, float_status *status);
 float64 float64_sub(float64, float64, float_status *status);
+float64 float64_sub_excp_en(float64, float64, int, int, float_status *status);
 float64 float64_mul(float64, float64, float_status *status);
 float64 float64_div(float64, float64, float_status *status);
 float64 float64_rem(float64, float64, float_status *status);
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 7ab6beadad..cb82c91340 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -529,7 +529,10 @@ static void float_invalid_op_addsub(CPUPPCState *env, int flags,
 /* fadd - fadd. */
 float64 helper_fadd(CPUPPCState *env, float64 arg1, float64 arg2)
 {
-    float64 ret = float64_add(arg1, arg2, &env->fp_status);
+    int oe_sub = (FP_OE & env->fpscr) ? 1536 : 0;
+    int ue_add = (FP_UE & env->fpscr) ? 1536 : 0;
+    float64 ret = float64_add_excp_en(arg1, arg2, oe_sub, ue_add,
+                                      &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
     if (unlikely(flags & float_flag_invalid)) {
@@ -554,7 +557,10 @@ float64 helper_fadds(CPUPPCState *env, float64 arg1, float64 arg2)
 /* fsub - fsub. */
 float64 helper_fsub(CPUPPCState *env, float64 arg1, float64 arg2)
 {
-    float64 ret = float64_sub(arg1, arg2, &env->fp_status);
+    int oe_sub = (FP_OE & env->fpscr) ? 1536 : 0;
+    int ue_add = (FP_UE & env->fpscr) ? 1536 : 0;
+    float64 ret = float64_sub_excp_en(arg1, arg2, oe_sub, ue_add,
+                                      &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
     if (unlikely(flags & float_flag_invalid)) {
-- 
2.31.1


