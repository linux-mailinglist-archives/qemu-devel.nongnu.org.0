Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7BB39F27B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:32:53 +0200 (CEST)
Received: from localhost ([::1]:37488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqY6O-00045p-QB
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqXyI-0002ab-C7
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:24:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqXyG-0000DJ-4y
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:24:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623144267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O7Kgj/5jMDn0BEik5oLSynLtCGI6oUZJ93BdRCL+FMc=;
 b=I0waYcMGBk+4fPbYJXn4q7FUWE52MCPmHyG7yBpCTfh9KgFw7WSZ0mrTjImkWIOnDFPZ+Z
 Kcd8Mku8n8v3g0RRIc5xl4H3TEnGYX3HBsKXLKzb005QV2Q1cY79yUtEEFouzNh5ZZtb1D
 gYOAOMlaVRg2oCoh0VZFUFycLqq7Tfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-8i2WaNlqNJC2TLigFcoHnA-1; Tue, 08 Jun 2021 05:24:26 -0400
X-MC-Unique: 8i2WaNlqNJC2TLigFcoHnA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74E60107ACE6;
 Tue,  8 Jun 2021 09:24:25 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-132.ams2.redhat.com [10.36.115.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B0A35C1BB;
 Tue,  8 Jun 2021 09:24:23 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/26] s390x/tcg: Implement 32/128 bit for VECTOR (LOAD FP
 INTEGER|FP SQUARE ROOT)
Date: Tue,  8 Jun 2021 11:23:25 +0200
Message-Id: <20210608092337.12221-15-david@redhat.com>
In-Reply-To: <20210608092337.12221-1-david@redhat.com>
References: <20210608092337.12221-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           |  4 ++
 target/s390x/translate_vx.c.inc | 74 ++++++++++++++++++++++++++-------
 target/s390x/vec_fpu_helper.c   | 46 +++++++++++++++++++-
 3 files changed, 109 insertions(+), 15 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 2d5e382e61..28797a6ccc 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -265,7 +265,9 @@ DEF_HELPER_FLAGS_4(gvec_vclgd64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfd32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfd64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfd128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_4(gvec_vfi32, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfi64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
+DEF_HELPER_FLAGS_4(gvec_vfi128, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfll32, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vflr64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfm32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
@@ -273,7 +275,9 @@ DEF_HELPER_FLAGS_5(gvec_vfm64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfm128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_6(gvec_vfma64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_6(gvec_vfms64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_4(gvec_vfsq32, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfsq64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
+DEF_HELPER_FLAGS_4(gvec_vfsq128, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfs32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfs64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfs128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index 0fbd914b40..6241279e68 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -2654,35 +2654,63 @@ static DisasJumpType op_vcdg(DisasContext *s, DisasOps *o)
     const uint8_t fpf = get_field(s, m3);
     const uint8_t m4 = get_field(s, m4);
     const uint8_t erm = get_field(s, m5);
-    gen_helper_gvec_2_ptr *fn;
+    gen_helper_gvec_2_ptr *fn = NULL;
 
-    if (fpf != FPF_LONG || extract32(m4, 0, 2) || erm > 7 || erm == 2) {
-        gen_program_exception(s, PGM_SPECIFICATION);
-        return DISAS_NORETURN;
-    }
 
     switch (s->fields.op2) {
     case 0xc3:
-        fn = gen_helper_gvec_vcdg64;
+        if (fpf == FPF_LONG) {
+            fn = gen_helper_gvec_vcdg64;
+        }
         break;
     case 0xc1:
-        fn = gen_helper_gvec_vcdlg64;
+        if (fpf == FPF_LONG) {
+            fn = gen_helper_gvec_vcdlg64;
+        }
         break;
     case 0xc2:
-        fn = gen_helper_gvec_vcgd64;
+        if (fpf == FPF_LONG) {
+            fn = gen_helper_gvec_vcgd64;
+        }
         break;
     case 0xc0:
-        fn = gen_helper_gvec_vclgd64;
+        if (fpf == FPF_LONG) {
+            fn = gen_helper_gvec_vclgd64;
+        }
         break;
     case 0xc7:
-        fn = gen_helper_gvec_vfi64;
+        switch (fpf) {
+        case FPF_SHORT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+                fn = gen_helper_gvec_vfi32;
+            }
+            break;
+        case FPF_LONG:
+            fn = gen_helper_gvec_vfi64;
+            break;
+        case FPF_EXT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+                fn = gen_helper_gvec_vfi128;
+            }
+            break;
+        default:
+            break;
+        }
         break;
     case 0xc5:
-        fn = gen_helper_gvec_vflr64;
+        if (fpf == FPF_LONG) {
+            fn = gen_helper_gvec_vflr64;
+        }
         break;
     default:
         g_assert_not_reached();
     }
+
+    if (!fn || extract32(m4, 0, 2) || erm > 7 || erm == 2) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
     gen_gvec_2_ptr(get_field(s, v1), get_field(s, v2), cpu_env,
                    deposit32(m4, 4, 4, erm), fn);
     return DISAS_NEXT;
@@ -2780,14 +2808,32 @@ static DisasJumpType op_vfsq(DisasContext *s, DisasOps *o)
 {
     const uint8_t fpf = get_field(s, m3);
     const uint8_t m4 = get_field(s, m4);
+    gen_helper_gvec_2_ptr *fn = NULL;
+
+    switch (fpf) {
+    case FPF_SHORT:
+        if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+            fn = gen_helper_gvec_vfsq32;
+        }
+        break;
+    case FPF_LONG:
+        fn = gen_helper_gvec_vfsq64;
+        break;
+    case FPF_EXT:
+        if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+            fn = gen_helper_gvec_vfsq128;
+        }
+        break;
+    default:
+        break;
+    }
 
-    if (fpf != FPF_LONG || extract32(m4, 0, 3)) {
+    if (!fn || extract32(m4, 0, 3)) {
         gen_program_exception(s, PGM_SPECIFICATION);
         return DISAS_NORETURN;
     }
 
-    gen_gvec_2_ptr(get_field(s, v1), get_field(s, v2), cpu_env, m4,
-                   gen_helper_gvec_vfsq64);
+    gen_gvec_2_ptr(get_field(s, v1), get_field(s, v2), cpu_env, m4, fn);
     return DISAS_NEXT;
 }
 
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index 3484c161ba..1df8f3d5a3 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -110,6 +110,30 @@ static void s390_vec_write_float128(S390Vector *v, float128 data)
     s390_vec_write_element64(v, 1, data.low);
 }
 
+typedef float32 (*vop32_2_fn)(float32 a, float_status *s);
+static void vop32_2(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
+                    bool s, bool XxC, uint8_t erm, vop32_2_fn fn,
+                    uintptr_t retaddr)
+{
+    uint8_t vxc, vec_exc = 0;
+    S390Vector tmp = {};
+    int i, old_mode;
+
+    old_mode = s390_swap_bfp_rounding_mode(env, erm);
+    for (i = 0; i < 4; i++) {
+        const float32 a = s390_vec_read_float32(v2, i);
+
+        s390_vec_write_float32(&tmp, i, fn(a, &env->fpu_status));
+        vxc = check_ieee_exc(env, i, XxC, &vec_exc);
+        if (s || vxc) {
+            break;
+        }
+    }
+    s390_restore_bfp_rounding_mode(env, old_mode);
+    handle_ieee_exc(env, vxc, vec_exc, retaddr);
+    *v1 = tmp;
+}
+
 typedef float64 (*vop64_2_fn)(float64 a, float_status *s);
 static void vop64_2(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
                     bool s, bool XxC, uint8_t erm, vop64_2_fn fn,
@@ -134,6 +158,24 @@ static void vop64_2(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
     *v1 = tmp;
 }
 
+typedef float128 (*vop128_2_fn)(float128 a, float_status *s);
+static void vop128_2(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
+                    bool s, bool XxC, uint8_t erm, vop128_2_fn fn,
+                    uintptr_t retaddr)
+{
+    const float128 a = s390_vec_read_float128(v2);
+    uint8_t vxc, vec_exc = 0;
+    S390Vector tmp = {};
+    int old_mode;
+
+    old_mode = s390_swap_bfp_rounding_mode(env, erm);
+    s390_vec_write_float128(&tmp, fn(a, &env->fpu_status));
+    vxc = check_ieee_exc(env, 0, XxC, &vec_exc);
+    s390_restore_bfp_rounding_mode(env, old_mode);
+    handle_ieee_exc(env, vxc, vec_exc, retaddr);
+    *v1 = tmp;
+}
+
 static float64 vcdg64(float64 a, float_status *s)
 {
     return int64_to_float64(a, s);
@@ -173,7 +215,9 @@ void HELPER(gvec_##NAME##BITS)(void *v1, const void *v2, CPUS390XState *env,   \
 DEF_GVEC_VOP2_FN(NAME, NAME##64, 64)
 
 #define DEF_GVEC_VOP2(NAME, OP)                                                \
-DEF_GVEC_VOP2_FN(NAME, float64_##OP, 64)
+DEF_GVEC_VOP2_FN(NAME, float32_##OP, 32)                                       \
+DEF_GVEC_VOP2_FN(NAME, float64_##OP, 64)                                       \
+DEF_GVEC_VOP2_FN(NAME, float128_##OP, 128)
 
 DEF_GVEC_VOP2_64(vcdg)
 DEF_GVEC_VOP2_64(vcdlg)
-- 
2.31.1


