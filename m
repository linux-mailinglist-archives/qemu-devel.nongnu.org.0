Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6973B66E0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:36:26 +0200 (CEST)
Received: from localhost ([::1]:46686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxuFF-0008DJ-Iw
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uweigand@de.ibm.com>)
 id 1lxuEM-0007BD-0L; Mon, 28 Jun 2021 12:35:30 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uweigand@de.ibm.com>)
 id 1lxuEJ-0001WO-Gb; Mon, 28 Jun 2021 12:35:29 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15SGXl7u030373; Mon, 28 Jun 2021 12:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to :
 subject : message-id : mime-version : content-type; s=pp1;
 bh=gXi5M6Gz7ueqF8YhsuCW3j9QF0O0kXyvAY9GdhEAIGA=;
 b=Rq1pWL75EEIlzvMDsaWgx1URsn3indxF86C1RjRtEkKKfYyWendvsFPSp/mv5FR4rqta
 0ovEi+pKVUNumEfDey2f1IP3sGoCYaybNlYH/vgSJWzQ7oIolJT6qh2CRduVe9VbMhzV
 y68GVnNzXANiC41GGl3nFozEEp9//mYd3p6XAUCUaCJdkYRNPy9rCj9p2k3/qSBtGvqI
 Jjx3hFN16BXrhuMydr2PNXi7WKZr0uros78SFhXxm/7KczliG6m3DYyNS62xuWXUuLXr
 Gb4/1lC1scLAJz+hGzOYuLGUrIPdoM/wnXUk8IQQdnXbrjjMDiJR6lDdbWlWgqGtCEs4 EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39fgf3jya5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 12:35:25 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15SGXuG2030950;
 Mon, 28 Jun 2021 12:35:25 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39fgf3jy91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 12:35:25 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15SGYUJF019481;
 Mon, 28 Jun 2021 16:35:23 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 39duv8gf7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 16:35:23 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15SGZL7Y33489322
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Jun 2021 16:35:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 288A642078;
 Mon, 28 Jun 2021 16:35:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 161B24207C;
 Mon, 28 Jun 2021 16:35:21 +0000 (GMT)
Received: from oc3748833570.ibm.com (unknown [9.145.91.112])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 28 Jun 2021 16:35:21 +0000 (GMT)
Received: by oc3748833570.ibm.com (Postfix, from userid 1000)
 id 94B44D802EF; Mon, 28 Jun 2021 18:35:20 +0200 (CEST)
Date: Mon, 28 Jun 2021 18:35:20 +0200
From: Ulrich Weigand <ulrich.weigand@de.ibm.com>
To: richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 thuth@redhat.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2] target/s390x: Fix CC set by CONVERT TO FIXED/LOGICAL
Message-ID: <20210628163520.GA15209@oc3748833570.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IZpx9Gjkg3TWnQO71kjCRgyXVLDTxHKm
X-Proofpoint-ORIG-GUID: PUTWe8JGw5OvtXk9ThxdtTsa3vSL-xm_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_12:2021-06-25,
 2021-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106280109
Received-SPF: pass client-ip=148.163.158.5; envelope-from=uweigand@de.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 target/s390x/helper.h     | 24 +++++++++++-----------
 target/s390x/translate.c  | 39 +++++++++++-------------------------
 3 files changed, 71 insertions(+), 43 deletions(-)

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
diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index ba045f5..6215ca0 100644
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

