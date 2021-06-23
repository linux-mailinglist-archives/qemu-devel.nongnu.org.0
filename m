Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610003B1CE5
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 16:51:48 +0200 (CEST)
Received: from localhost ([::1]:41044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw4EF-0004NR-ES
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 10:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uweigand@de.ibm.com>)
 id 1lw4D4-0003dU-7Y; Wed, 23 Jun 2021 10:50:34 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uweigand@de.ibm.com>)
 id 1lw4D1-0005eB-Ch; Wed, 23 Jun 2021 10:50:33 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15NEY6uA098362; Wed, 23 Jun 2021 10:50:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to :
 subject : message-id : mime-version : content-type; s=pp1;
 bh=cltIHOwwrLN2Y0g3fnCpCznzrtF82VGshScbNV7Ef3k=;
 b=sR3qNCdvwURi9Ihd3cPnoe0TaOm9tTA6oirs8K4miIvZQ7puPK+Y+KYVoz4u6JVIyF4Q
 T/nL/V+VnynOBs0BunB0nVUAF6PNQKoSPULeGJ/+TueUsUQgEBFP3qz5yZJaqEzLx8X0
 E8dcWwKKBEXxMK63N6zWvQIkcajnWyTS9wQXzpGkiiwy5jiDAStgsbnrK1tW0KOnVRqo
 14saNvAWaTp6boUPvD2gxAzJbuI7doaKOn2pk1XnMKF41tm+travco+MI1KMTX35jUu2
 4CXYUzqE2ZxD2dBDfmVoKJCe2GXr6hqv08wl3vCK1s8evxs1K87rzxISuK4+mDUShPSr VA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39c0kr6g0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 10:50:26 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15NEYYGY107135;
 Wed, 23 Jun 2021 10:50:26 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39c0kr6fyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 10:50:26 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15NEo4SK024628;
 Wed, 23 Jun 2021 14:50:23 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 39987894pp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 14:50:23 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15NEmwTT35848616
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 14:48:58 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2601952057;
 Wed, 23 Jun 2021 14:50:21 +0000 (GMT)
Received: from oc3748833570.ibm.com (unknown [9.145.160.8])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0AF9352051;
 Wed, 23 Jun 2021 14:50:21 +0000 (GMT)
Received: by oc3748833570.ibm.com (Postfix, from userid 1000)
 id 785D8D801F9; Wed, 23 Jun 2021 16:50:20 +0200 (CEST)
Date: Wed, 23 Jun 2021 16:50:20 +0200
From: Ulrich Weigand <ulrich.weigand@de.ibm.com>
To: richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 thuth@redhat.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] target/s390x: Fix CC set by CONVERT TO FIXED/LOGICAL
Message-ID: <20210623145020.GA30585@oc3748833570.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7SmISnbQ80xHwe-ugNgBzVFycBcZP1Qi
X-Proofpoint-GUID: x37MDLfD2Kg56Xde4FHpYhE2df6UhyDh
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-23_09:2021-06-23,
 2021-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 suspectscore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106230084
Received-SPF: pass client-ip=148.163.156.1; envelope-from=uweigand@de.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 target/s390x/fpu_helper.c | 51 +++++++++++++++++++++++++++++++++++++++++++----
 target/s390x/translate.c  | 39 +++++++++++-------------------------
 2 files changed, 59 insertions(+), 31 deletions(-)

diff --git a/target/s390x/fpu_helper.c b/target/s390x/fpu_helper.c
index 13af158..50250cf 100644
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
@@ -506,6 +534,7 @@ uint64_t HELPER(cgeb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     int64_t ret = float32_to_int64(v2, &env->fpu_status);
+    env->cc_op = set_cc_conv_f32(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
@@ -520,6 +549,7 @@ uint64_t HELPER(cgdb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     int64_t ret = float64_to_int64(v2, &env->fpu_status);
+    env->cc_op = set_cc_conv_f64(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
@@ -535,6 +565,7 @@ uint64_t HELPER(cgxb)(CPUS390XState *env, uint64_t h, uint64_t l, uint32_t m34)
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     float128 v2 = make_float128(h, l);
     int64_t ret = float128_to_int64(v2, &env->fpu_status);
+    env->cc_op = set_cc_conv_f128(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
@@ -549,6 +580,7 @@ uint64_t HELPER(cfeb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     int32_t ret = float32_to_int32(v2, &env->fpu_status);
+    env->cc_op = set_cc_conv_f32(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
@@ -563,6 +595,7 @@ uint64_t HELPER(cfdb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     int32_t ret = float64_to_int32(v2, &env->fpu_status);
+    env->cc_op = set_cc_conv_f64(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
@@ -578,6 +611,7 @@ uint64_t HELPER(cfxb)(CPUS390XState *env, uint64_t h, uint64_t l, uint32_t m34)
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     float128 v2 = make_float128(h, l);
     int32_t ret = float128_to_int32(v2, &env->fpu_status);
+    env->cc_op = set_cc_conv_f128(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
@@ -592,6 +626,8 @@ uint64_t HELPER(clgeb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     uint64_t ret = float32_to_uint64(v2, &env->fpu_status);
+    env->cc_op = set_cc_conv_f32(v2, &env->fpu_status);
+
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
     if (float32_is_any_nan(v2)) {
@@ -605,6 +641,7 @@ uint64_t HELPER(clgdb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     uint64_t ret = float64_to_uint64(v2, &env->fpu_status);
+    env->cc_op = set_cc_conv_f64(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
@@ -618,11 +655,13 @@ uint64_t HELPER(clgdb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 uint64_t HELPER(clgxb)(CPUS390XState *env, uint64_t h, uint64_t l, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
-    uint64_t ret = float128_to_uint64(make_float128(h, l), &env->fpu_status);
+    float128 v2 = make_float128(h, l);
+    uint64_t ret = float128_to_uint64(v2, &env->fpu_status);
+    env->cc_op = set_cc_conv_f128(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
-    if (float128_is_any_nan(make_float128(h, l))) {
+    if (float128_is_any_nan(v2)) {
         return 0;
     }
     return ret;
@@ -633,6 +672,7 @@ uint64_t HELPER(clfeb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     uint32_t ret = float32_to_uint32(v2, &env->fpu_status);
+    env->cc_op = set_cc_conv_f32(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
@@ -647,6 +687,7 @@ uint64_t HELPER(clfdb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
     uint32_t ret = float64_to_uint32(v2, &env->fpu_status);
+    env->cc_op = set_cc_conv_f64(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
@@ -660,11 +701,13 @@ uint64_t HELPER(clfdb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 uint64_t HELPER(clfxb)(CPUS390XState *env, uint64_t h, uint64_t l, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
-    uint32_t ret = float128_to_uint32(make_float128(h, l), &env->fpu_status);
+    float128 v2 = make_float128(h, l);
+    uint32_t ret = float128_to_uint32(v2, &env->fpu_status);
+    env->cc_op = set_cc_conv_f128(v2, &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
-    if (float128_is_any_nan(make_float128(h, l))) {
+    if (float128_is_any_nan(v2)) {
         return 0;
     }
     return ret;
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index e243624..53129fb 100644
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
1.8.3.1


-- 
  Dr. Ulrich Weigand
  GNU/Linux compilers and toolchain
  Ulrich.Weigand@de.ibm.com

