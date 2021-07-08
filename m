Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD4C3C16A5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:52:15 +0200 (CEST)
Received: from localhost ([::1]:41094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WJy-0002QH-VJ
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m1VoW-0004o6-CM
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:19:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m1VoR-0000FK-Bc
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:19:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625757578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=edaV8nY9sqhxnzpPOlQ1yNoBGPTcYtg2WGiluCX+c50=;
 b=OTIkYKgJ5Lh84Lz62W594R3drokrkMpSp0aoCJKPyctNvFWHZM49cTLUEuvjZIGNJyXxjD
 t9aBrl7P66Dj55d7pC5/QPolNx0VpwH8VdSju4n0FVuXIDx103Wpd7njYiuQT+ReRX3Cyl
 cMazyxw+iDLuzhid4wJZtqfbVKQRNxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-SxRSINABPEKVUUC58VZJEQ-1; Thu, 08 Jul 2021 11:19:36 -0400
X-MC-Unique: SxRSINABPEKVUUC58VZJEQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79C9C1009456;
 Thu,  8 Jul 2021 15:19:35 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-112-175.ams2.redhat.com
 [10.36.112.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A54B2E2F7;
 Thu,  8 Jul 2021 15:19:28 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 02/17] target/s390x: Fix CC set by CONVERT TO FIXED/LOGICAL
Date: Thu,  8 Jul 2021 17:18:54 +0200
Message-Id: <20210708151909.907124-3-cohuck@redhat.com>
In-Reply-To: <20210708151909.907124-1-cohuck@redhat.com>
References: <20210708151909.907124-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Ulrich Weigand <ulrich.weigand@de.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ulrich Weigand <ulrich.weigand@de.ibm.com>

The FP-to-integer conversion instructions need to set CC 3 whenever
a "special case" occurs; this is the case whenever the instruction
also signals the IEEE invalid exception.  (See e.g. figure 19-18
in the Principles of Operation.)

However, qemu currently will set CC 3 only in the case where the
input was a NaN.  This is indeed one of the special cases, but
there are others, most notably the case where the input is out
of range of the target data type.

This patch fixes the problem by switching these instructions to
the "static" CC method and computing the correct result directly
in the helper.  (It cannot be re-computed later as the information
about the invalid exception is no longer available.)

This fixes a bug observed when running the wasmtime test suite
under the s390x-linux-user target.

Signed-off-by: Ulrich Weigand <ulrich.weigand@de.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210630105058.GA29130@oc3748833570.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/fpu_helper.c | 63 ++++++++++++++++++++++++++++++++++++---
 target/s390x/helper.h     | 24 +++++++--------
 target/s390x/translate.c  | 39 ++++++++----------------
 3 files changed, 83 insertions(+), 43 deletions(-)

diff --git a/target/s390x/fpu_helper.c b/target/s390x/fpu_helper.c
index 13af158748a9..a42741eec639 100644
--- a/target/s390x/fpu_helper.c
+++ b/target/s390x/fpu_helper.c
@@ -168,6 +168,34 @@ uint32_t set_cc_nz_f128(float128 v)
     }
 }
 
+/* condition codes for FP to integer conversion ops */
+static uint32_t set_cc_conv_f32(float32 v, float_status *stat)
+{
+    if (stat->float_exception_flags & float_flag_invalid) {
+        return 3;
+    } else {
+        return set_cc_nz_f32(v);
+    }
+}
+
+static uint32_t set_cc_conv_f64(float64 v, float_status *stat)
+{
+    if (stat->float_exception_flags & float_flag_invalid) {
+        return 3;
+    } else {
+        return set_cc_nz_f64(v);
+    }
+}
+
+static uint32_t set_cc_conv_f128(float128 v, float_status *stat)
+{
+    if (stat->float_exception_flags & float_flag_invalid) {
+        return 3;
+    } else {
+        return set_cc_nz_f128(v);
+    }
+}
+
 static inline uint8_t round_from_m34(uint32_t m34)
 {
     return extract32(m34, 0, 4);
@@ -506,9 +534,11 @@ uint64_t HELPER(cgeb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     int64_t ret = float32_to_int64(v2, &env->fpu_status);
+    uint32_t cc = set_cc_conv_f32(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    env->cc_op = cc;
     if (float32_is_any_nan(v2)) {
         return INT64_MIN;
     }
@@ -520,9 +550,11 @@ uint64_t HELPER(cgdb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     int64_t ret = float64_to_int64(v2, &env->fpu_status);
+    uint32_t cc = set_cc_conv_f64(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    env->cc_op = cc;
     if (float64_is_any_nan(v2)) {
         return INT64_MIN;
     }
@@ -535,9 +567,11 @@ uint64_t HELPER(cgxb)(CPUS390XState *env, uint64_t h, uint64_t l, uint32_t m34)
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     float128 v2 = make_float128(h, l);
     int64_t ret = float128_to_int64(v2, &env->fpu_status);
+    uint32_t cc = set_cc_conv_f128(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    env->cc_op = cc;
     if (float128_is_any_nan(v2)) {
         return INT64_MIN;
     }
@@ -549,9 +583,11 @@ uint64_t HELPER(cfeb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     int32_t ret = float32_to_int32(v2, &env->fpu_status);
+    uint32_t cc = set_cc_conv_f32(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    env->cc_op = cc;
     if (float32_is_any_nan(v2)) {
         return INT32_MIN;
     }
@@ -563,9 +599,11 @@ uint64_t HELPER(cfdb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     int32_t ret = float64_to_int32(v2, &env->fpu_status);
+    uint32_t cc = set_cc_conv_f64(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    env->cc_op = cc;
     if (float64_is_any_nan(v2)) {
         return INT32_MIN;
     }
@@ -578,9 +616,11 @@ uint64_t HELPER(cfxb)(CPUS390XState *env, uint64_t h, uint64_t l, uint32_t m34)
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     float128 v2 = make_float128(h, l);
     int32_t ret = float128_to_int32(v2, &env->fpu_status);
+    uint32_t cc = set_cc_conv_f128(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    env->cc_op = cc;
     if (float128_is_any_nan(v2)) {
         return INT32_MIN;
     }
@@ -592,8 +632,11 @@ uint64_t HELPER(clgeb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     uint64_t ret = float32_to_uint64(v2, &env->fpu_status);
+    uint32_t cc = set_cc_conv_f32(v2, &env->fpu_status);
+
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    env->cc_op = cc;
     if (float32_is_any_nan(v2)) {
         return 0;
     }
@@ -605,9 +648,11 @@ uint64_t HELPER(clgdb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     uint64_t ret = float64_to_uint64(v2, &env->fpu_status);
+    uint32_t cc = set_cc_conv_f64(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    env->cc_op = cc;
     if (float64_is_any_nan(v2)) {
         return 0;
     }
@@ -618,11 +663,14 @@ uint64_t HELPER(clgdb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 uint64_t HELPER(clgxb)(CPUS390XState *env, uint64_t h, uint64_t l, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
-    uint64_t ret = float128_to_uint64(make_float128(h, l), &env->fpu_status);
+    float128 v2 = make_float128(h, l);
+    uint64_t ret = float128_to_uint64(v2, &env->fpu_status);
+    uint32_t cc = set_cc_conv_f128(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
-    if (float128_is_any_nan(make_float128(h, l))) {
+    env->cc_op = cc;
+    if (float128_is_any_nan(v2)) {
         return 0;
     }
     return ret;
@@ -633,9 +681,11 @@ uint64_t HELPER(clfeb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     uint32_t ret = float32_to_uint32(v2, &env->fpu_status);
+    uint32_t cc = set_cc_conv_f32(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    env->cc_op = cc;
     if (float32_is_any_nan(v2)) {
         return 0;
     }
@@ -647,9 +697,11 @@ uint64_t HELPER(clfdb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     uint32_t ret = float64_to_uint32(v2, &env->fpu_status);
+    uint32_t cc = set_cc_conv_f64(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    env->cc_op = cc;
     if (float64_is_any_nan(v2)) {
         return 0;
     }
@@ -660,11 +712,14 @@ uint64_t HELPER(clfdb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 uint64_t HELPER(clfxb)(CPUS390XState *env, uint64_t h, uint64_t l, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
-    uint32_t ret = float128_to_uint32(make_float128(h, l), &env->fpu_status);
+    float128 v2 = make_float128(h, l);
+    uint32_t ret = float128_to_uint32(v2, &env->fpu_status);
+    uint32_t cc = set_cc_conv_f128(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
-    if (float128_is_any_nan(make_float128(h, l))) {
+    env->cc_op = cc;
+    if (float128_is_any_nan(v2)) {
         return 0;
     }
     return ret;
diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index ba045f559d4a..6215ca00bcbd 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -64,18 +64,18 @@ DEF_HELPER_FLAGS_5(cxb, TCG_CALL_NO_WG_SE, i32, env, i64, i64, i64, i64)
 DEF_HELPER_FLAGS_3(keb, TCG_CALL_NO_WG, i32, env, i64, i64)
 DEF_HELPER_FLAGS_3(kdb, TCG_CALL_NO_WG, i32, env, i64, i64)
 DEF_HELPER_FLAGS_5(kxb, TCG_CALL_NO_WG, i32, env, i64, i64, i64, i64)
-DEF_HELPER_FLAGS_3(cgeb, TCG_CALL_NO_WG, i64, env, i64, i32)
-DEF_HELPER_FLAGS_3(cgdb, TCG_CALL_NO_WG, i64, env, i64, i32)
-DEF_HELPER_FLAGS_4(cgxb, TCG_CALL_NO_WG, i64, env, i64, i64, i32)
-DEF_HELPER_FLAGS_3(cfeb, TCG_CALL_NO_WG, i64, env, i64, i32)
-DEF_HELPER_FLAGS_3(cfdb, TCG_CALL_NO_WG, i64, env, i64, i32)
-DEF_HELPER_FLAGS_4(cfxb, TCG_CALL_NO_WG, i64, env, i64, i64, i32)
-DEF_HELPER_FLAGS_3(clgeb, TCG_CALL_NO_WG, i64, env, i64, i32)
-DEF_HELPER_FLAGS_3(clgdb, TCG_CALL_NO_WG, i64, env, i64, i32)
-DEF_HELPER_FLAGS_4(clgxb, TCG_CALL_NO_WG, i64, env, i64, i64, i32)
-DEF_HELPER_FLAGS_3(clfeb, TCG_CALL_NO_WG, i64, env, i64, i32)
-DEF_HELPER_FLAGS_3(clfdb, TCG_CALL_NO_WG, i64, env, i64, i32)
-DEF_HELPER_FLAGS_4(clfxb, TCG_CALL_NO_WG, i64, env, i64, i64, i32)
+DEF_HELPER_3(cgeb, i64, env, i64, i32)
+DEF_HELPER_3(cgdb, i64, env, i64, i32)
+DEF_HELPER_4(cgxb, i64, env, i64, i64, i32)
+DEF_HELPER_3(cfeb, i64, env, i64, i32)
+DEF_HELPER_3(cfdb, i64, env, i64, i32)
+DEF_HELPER_4(cfxb, i64, env, i64, i64, i32)
+DEF_HELPER_3(clgeb, i64, env, i64, i32)
+DEF_HELPER_3(clgdb, i64, env, i64, i32)
+DEF_HELPER_4(clgxb, i64, env, i64, i64, i32)
+DEF_HELPER_3(clfeb, i64, env, i64, i32)
+DEF_HELPER_3(clfdb, i64, env, i64, i32)
+DEF_HELPER_4(clfxb, i64, env, i64, i64, i32)
 DEF_HELPER_FLAGS_3(fieb, TCG_CALL_NO_WG, i64, env, i64, i32)
 DEF_HELPER_FLAGS_3(fidb, TCG_CALL_NO_WG, i64, env, i64, i32)
 DEF_HELPER_FLAGS_4(fixb, TCG_CALL_NO_WG, i64, env, i64, i64, i32)
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 03dab9f3507a..71ae3f333ec4 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -563,21 +563,6 @@ static void set_cc_nz_u64(DisasContext *s, TCGv_i64 val)
     gen_op_update1_cc_i64(s, CC_OP_NZ, val);
 }
 
-static void gen_set_cc_nz_f32(DisasContext *s, TCGv_i64 val)
-{
-    gen_op_update1_cc_i64(s, CC_OP_NZ_F32, val);
-}
-
-static void gen_set_cc_nz_f64(DisasContext *s, TCGv_i64 val)
-{
-    gen_op_update1_cc_i64(s, CC_OP_NZ_F64, val);
-}
-
-static void gen_set_cc_nz_f128(DisasContext *s, TCGv_i64 vh, TCGv_i64 vl)
-{
-    gen_op_update2_cc_i64(s, CC_OP_NZ_F128, vh, vl);
-}
-
 /* CC value is in env->cc_op */
 static void set_cc_static(DisasContext *s)
 {
@@ -1836,7 +1821,7 @@ static DisasJumpType op_cfeb(DisasContext *s, DisasOps *o)
     }
     gen_helper_cfeb(o->out, cpu_env, o->in2, m34);
     tcg_temp_free_i32(m34);
-    gen_set_cc_nz_f32(s, o->in2);
+    set_cc_static(s);
     return DISAS_NEXT;
 }
 
@@ -1849,7 +1834,7 @@ static DisasJumpType op_cfdb(DisasContext *s, DisasOps *o)
     }
     gen_helper_cfdb(o->out, cpu_env, o->in2, m34);
     tcg_temp_free_i32(m34);
-    gen_set_cc_nz_f64(s, o->in2);
+    set_cc_static(s);
     return DISAS_NEXT;
 }
 
@@ -1862,7 +1847,7 @@ static DisasJumpType op_cfxb(DisasContext *s, DisasOps *o)
     }
     gen_helper_cfxb(o->out, cpu_env, o->in1, o->in2, m34);
     tcg_temp_free_i32(m34);
-    gen_set_cc_nz_f128(s, o->in1, o->in2);
+    set_cc_static(s);
     return DISAS_NEXT;
 }
 
@@ -1875,7 +1860,7 @@ static DisasJumpType op_cgeb(DisasContext *s, DisasOps *o)
     }
     gen_helper_cgeb(o->out, cpu_env, o->in2, m34);
     tcg_temp_free_i32(m34);
-    gen_set_cc_nz_f32(s, o->in2);
+    set_cc_static(s);
     return DISAS_NEXT;
 }
 
@@ -1888,7 +1873,7 @@ static DisasJumpType op_cgdb(DisasContext *s, DisasOps *o)
     }
     gen_helper_cgdb(o->out, cpu_env, o->in2, m34);
     tcg_temp_free_i32(m34);
-    gen_set_cc_nz_f64(s, o->in2);
+    set_cc_static(s);
     return DISAS_NEXT;
 }
 
@@ -1901,7 +1886,7 @@ static DisasJumpType op_cgxb(DisasContext *s, DisasOps *o)
     }
     gen_helper_cgxb(o->out, cpu_env, o->in1, o->in2, m34);
     tcg_temp_free_i32(m34);
-    gen_set_cc_nz_f128(s, o->in1, o->in2);
+    set_cc_static(s);
     return DISAS_NEXT;
 }
 
@@ -1914,7 +1899,7 @@ static DisasJumpType op_clfeb(DisasContext *s, DisasOps *o)
     }
     gen_helper_clfeb(o->out, cpu_env, o->in2, m34);
     tcg_temp_free_i32(m34);
-    gen_set_cc_nz_f32(s, o->in2);
+    set_cc_static(s);
     return DISAS_NEXT;
 }
 
@@ -1927,7 +1912,7 @@ static DisasJumpType op_clfdb(DisasContext *s, DisasOps *o)
     }
     gen_helper_clfdb(o->out, cpu_env, o->in2, m34);
     tcg_temp_free_i32(m34);
-    gen_set_cc_nz_f64(s, o->in2);
+    set_cc_static(s);
     return DISAS_NEXT;
 }
 
@@ -1940,7 +1925,7 @@ static DisasJumpType op_clfxb(DisasContext *s, DisasOps *o)
     }
     gen_helper_clfxb(o->out, cpu_env, o->in1, o->in2, m34);
     tcg_temp_free_i32(m34);
-    gen_set_cc_nz_f128(s, o->in1, o->in2);
+    set_cc_static(s);
     return DISAS_NEXT;
 }
 
@@ -1953,7 +1938,7 @@ static DisasJumpType op_clgeb(DisasContext *s, DisasOps *o)
     }
     gen_helper_clgeb(o->out, cpu_env, o->in2, m34);
     tcg_temp_free_i32(m34);
-    gen_set_cc_nz_f32(s, o->in2);
+    set_cc_static(s);
     return DISAS_NEXT;
 }
 
@@ -1966,7 +1951,7 @@ static DisasJumpType op_clgdb(DisasContext *s, DisasOps *o)
     }
     gen_helper_clgdb(o->out, cpu_env, o->in2, m34);
     tcg_temp_free_i32(m34);
-    gen_set_cc_nz_f64(s, o->in2);
+    set_cc_static(s);
     return DISAS_NEXT;
 }
 
@@ -1979,7 +1964,7 @@ static DisasJumpType op_clgxb(DisasContext *s, DisasOps *o)
     }
     gen_helper_clgxb(o->out, cpu_env, o->in1, o->in2, m34);
     tcg_temp_free_i32(m34);
-    gen_set_cc_nz_f128(s, o->in1, o->in2);
+    set_cc_static(s);
     return DISAS_NEXT;
 }
 
-- 
2.31.1


