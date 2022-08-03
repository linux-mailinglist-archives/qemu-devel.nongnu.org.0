Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBB8588C50
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 14:42:45 +0200 (CEST)
Received: from localhost ([::1]:56592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJDhz-000459-Ga
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 08:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oJDOn-0007ss-Dv; Wed, 03 Aug 2022 08:22:53 -0400
Received: from [200.168.210.66] (port=61218 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oJDOl-000706-RS; Wed, 03 Aug 2022 08:22:53 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 3 Aug 2022 09:22:35 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id B8EEE8003B3;
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
Subject: [RFC PATCH 3/3] target/ppc: Bugfix fdiv result with OE/UE set
Date: Wed,  3 Aug 2022 09:22:17 -0300
Message-Id: <20220803122217.20847-4-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220803122217.20847-1-lucas.araujo@eldorado.org.br>
References: <20220803122217.20847-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Aug 2022 12:22:35.0996 (UTC)
 FILETIME=[B6D431C0:01D8A733]
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

Change fdiv in the same way of fadd/fsub to handle overflow/underflow if
OE/UE is set (i.e. function that receives a value to add/subtract from
the exponent if an overflow/underflow occurs).

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 fpu/softfloat.c         | 30 ++++++++++++++++++++++++++++++
 include/fpu/softfloat.h |  1 +
 target/ppc/fpu_helper.c |  5 ++++-
 3 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index e2b4ad4b63..0e9d2d2678 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2558,6 +2558,27 @@ soft_f64_div(float64 a, float64 b, float_status *status)
     return float64_round_pack_canonical(pr, status);
 }
 
+static float64 QEMU_SOFTFLOAT_ATTR
+soft_f64_div_excp_en(float64 a, float64 b, int oe_sub, int ue_sum,
+                     float_status *status)
+{
+    FloatParts64 pa, pb, *pr;
+
+    float64_unpack_canonical(&pa, a, status);
+    float64_unpack_canonical(&pb, b, status);
+    pr = parts_div(&pa, &pb, status);
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
 static float hard_f32_div(float a, float b)
 {
     return a / b;
@@ -2616,6 +2637,15 @@ float64_div(float64 a, float64 b, float_status *s)
                         f64_div_pre, f64_div_post);
 }
 
+float64 QEMU_FLATTEN
+float64_div_excp_en(float64 a, float64 b, int oe_sub, int ue_sum,
+                    float_status *s)
+{
+    return float64_gen2_excp(a, b, oe_sub, ue_sum, s, hard_f64_div,
+                             soft_f64_div, soft_f64_div_excp_en, f64_div_pre,
+                             f64_div_post);
+}
+
 float64 float64r32_div(float64 a, float64 b, float_status *status)
 {
     FloatParts64 pa, pb, *pr;
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 4ff56b0e10..a6c7885fcd 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -778,6 +778,7 @@ float64 float64_sub_excp_en(float64, float64, int, int, float_status *status);
 float64 float64_mul(float64, float64, float_status *status);
 float64 float64_mul_excp_en(float64, float64, int, int, float_status *status);
 float64 float64_div(float64, float64, float_status *status);
+float64 float64_div_excp_en(float64, float64, int, int, float_status *status);
 float64 float64_rem(float64, float64, float_status *status);
 float64 float64_muladd(float64, float64, float64, int, float_status *status);
 float64 float64_sqrt(float64, float_status *status);
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 18cf720743..1a6869a920 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -635,7 +635,10 @@ static void float_invalid_op_div(CPUPPCState *env, int flags,
 /* fdiv - fdiv. */
 float64 helper_fdiv(CPUPPCState *env, float64 arg1, float64 arg2)
 {
-    float64 ret = float64_div(arg1, arg2, &env->fp_status);
+    int oe_sub = (FP_OE & env->fpscr) ? 1536 : 0;
+    int ue_sum = (FP_UE & env->fpscr) ? 1536 : 0;
+    float64 ret = float64_div_excp_en(arg1, arg2, oe_sub, ue_sum,
+                                      &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
     if (unlikely(flags & float_flag_invalid)) {
-- 
2.31.1


