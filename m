Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C268F39DA9F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 13:06:32 +0200 (CEST)
Received: from localhost ([::1]:55750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqD5S-0003iA-Cf
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 07:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD3F-0001Fo-FR
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:04:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD3C-0004Xt-PK
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:04:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623063850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a//RC87BbrcQUYPI96heGgoDmpCS1Qa1KCnqb0ohHDk=;
 b=Dnj0fLu4X/koW9TBzUtK1HScIAkfBY10Afnuo5WLKjRZ3bzr4RLuBiTDzTLMnyGoU5SnwX
 HBMYM0Q4JCtSOI8y+o28593HMjuF0GahyvK5Ly4ZYVBnLcbrRjHFgSvVHnZS8pg0OtzOA1
 ldfNZEcAaM8VWHqf2i9IyZ2ifBBy6wU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-mnb2COlQPN-uF-Z2H0EM7g-1; Mon, 07 Jun 2021 07:04:07 -0400
X-MC-Unique: mnb2COlQPN-uF-Z2H0EM7g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2EBB189C440;
 Mon,  7 Jun 2021 11:04:05 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D160960C17;
 Mon,  7 Jun 2021 11:04:03 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/26] s390x/tcg: Simplify vop64_2() handling
Date: Mon,  7 Jun 2021 13:03:16 +0200
Message-Id: <20210607110338.31058-5-david@redhat.com>
In-Reply-To: <20210607110338.31058-1-david@redhat.com>
References: <20210607110338.31058-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's rework our macros and simplify. We still need helper functions in
most cases due to the different parameters types.

Next, we'll only have 32/128bit variants for vfi and vfsq, so special
case the others.

Note that for vfsq, the XxC and erm passed in the simd_data() will never be
set, resulting in the same behavior.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           |   6 -
 target/s390x/translate_vx.c.inc |  18 ++-
 target/s390x/vec_fpu_helper.c   | 190 +++++++++-----------------------
 3 files changed, 58 insertions(+), 156 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 2344f81273..4788c1ddaf 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -262,16 +262,11 @@ DEF_HELPER_FLAGS_5(gvec_vfche64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i3
 DEF_HELPER_5(gvec_vfche64_cc, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_5(gvec_vfche64s_cc, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vcdg64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
-DEF_HELPER_FLAGS_4(gvec_vcdg64s, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vcdlg64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
-DEF_HELPER_FLAGS_4(gvec_vcdlg64s, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vcgd64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
-DEF_HELPER_FLAGS_4(gvec_vcgd64s, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vclgd64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
-DEF_HELPER_FLAGS_4(gvec_vclgd64s, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfd64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfi64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
-DEF_HELPER_FLAGS_4(gvec_vfi64s, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfll32, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfll32s, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vflr64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
@@ -282,7 +277,6 @@ DEF_HELPER_FLAGS_6(gvec_vfma64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, en
 DEF_HELPER_FLAGS_6(gvec_vfms64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_6(gvec_vfms64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfsq64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
-DEF_HELPER_FLAGS_4(gvec_vfsq64s, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfs64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_4(gvec_vftci64, void, ptr, cptr, env, i32)
 DEF_HELPER_4(gvec_vftci64s, void, ptr, cptr, env, i32)
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index 2d3fbdfab2..280d45bb19 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -2558,19 +2558,19 @@ static DisasJumpType op_vcdg(DisasContext *s, DisasOps *o)
 
     switch (s->fields.op2) {
     case 0xc3:
-        fn = se ? gen_helper_gvec_vcdg64s : gen_helper_gvec_vcdg64;
+        fn = gen_helper_gvec_vcdg64;
         break;
     case 0xc1:
-        fn = se ? gen_helper_gvec_vcdlg64s : gen_helper_gvec_vcdlg64;
+        fn = gen_helper_gvec_vcdlg64;
         break;
     case 0xc2:
-        fn = se ? gen_helper_gvec_vcgd64s : gen_helper_gvec_vcgd64;
+        fn = gen_helper_gvec_vcgd64;
         break;
     case 0xc0:
-        fn = se ? gen_helper_gvec_vclgd64s : gen_helper_gvec_vclgd64;
+        fn = gen_helper_gvec_vclgd64;
         break;
     case 0xc7:
-        fn = se ? gen_helper_gvec_vfi64s : gen_helper_gvec_vfi64;
+        fn = gen_helper_gvec_vfi64;
         break;
     case 0xc5:
         fn = se ? gen_helper_gvec_vflr64s : gen_helper_gvec_vflr64;
@@ -2681,18 +2681,14 @@ static DisasJumpType op_vfsq(DisasContext *s, DisasOps *o)
 {
     const uint8_t fpf = get_field(s, m3);
     const uint8_t m4 = get_field(s, m4);
-    gen_helper_gvec_2_ptr *fn = gen_helper_gvec_vfsq64;
 
     if (fpf != FPF_LONG || extract32(m4, 0, 3)) {
         gen_program_exception(s, PGM_SPECIFICATION);
         return DISAS_NORETURN;
     }
 
-    if (extract32(m4, 3, 1)) {
-        fn = gen_helper_gvec_vfsq64s;
-    }
-    gen_gvec_2_ptr(get_field(s, v1), get_field(s, v2), cpu_env,
-                   0, fn);
+    gen_gvec_2_ptr(get_field(s, v1), get_field(s, v2), cpu_env, m4,
+                   gen_helper_gvec_vfsq64);
     return DISAS_NEXT;
 }
 
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index 280ee0f1ea..ab23a597da 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -88,7 +88,7 @@ static void s390_vec_write_float64(S390Vector *v, uint8_t enr, float64 data)
     return s390_vec_write_element64(v, enr, data);
 }
 
-typedef uint64_t (*vop64_2_fn)(uint64_t a, float_status *s);
+typedef float64 (*vop64_2_fn)(float64 a, float_status *s);
 static void vop64_2(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
                     bool s, bool XxC, uint8_t erm, vop64_2_fn fn,
                     uintptr_t retaddr)
@@ -99,9 +99,9 @@ static void vop64_2(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
 
     old_mode = s390_swap_bfp_rounding_mode(env, erm);
     for (i = 0; i < 2; i++) {
-        const uint64_t a = s390_vec_read_element64(v2, i);
+        const float64 a = s390_vec_read_float64(v2, i);
 
-        s390_vec_write_element64(&tmp, i, fn(a, &env->fpu_status));
+        s390_vec_write_float64(&tmp, i, fn(a, &env->fpu_status));
         vxc = check_ieee_exc(env, i, XxC, &vec_exc);
         if (s || vxc) {
             break;
@@ -112,6 +112,54 @@ static void vop64_2(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
     *v1 = tmp;
 }
 
+static float64 vcdg64(float64 a, float_status *s)
+{
+    return int64_to_float64(a, s);
+}
+
+static float64 vcdlg64(float64 a, float_status *s)
+{
+    return uint64_to_float64(a, s);
+}
+
+static float64 vcgd64(float64 a, float_status *s)
+{
+    const float64 tmp = float64_to_int64(a, s);
+
+    return float64_is_any_nan(a) ? INT64_MIN : tmp;
+}
+
+static float64 vclgd64(float64 a, float_status *s)
+{
+    const float64 tmp = float64_to_uint64(a, s);
+
+    return float64_is_any_nan(a) ? 0 : tmp;
+}
+
+#define DEF_GVEC_VOP2_FN(NAME, FN, BITS)                                       \
+void HELPER(gvec_##NAME##BITS)(void *v1, const void *v2, CPUS390XState *env,   \
+                               uint32_t desc)                                  \
+{                                                                              \
+    const uint8_t erm = extract32(simd_data(desc), 4, 4);                      \
+    const bool se = extract32(simd_data(desc), 3, 1);                          \
+    const bool XxC = extract32(simd_data(desc), 2, 1);                         \
+                                                                               \
+    vop##BITS##_2(v1, v2, env, se, XxC, erm, FN, GETPC());                     \
+}
+
+#define DEF_GVEC_VOP2_64(NAME)                                                 \
+DEF_GVEC_VOP2_FN(NAME, NAME##64, 64)
+
+#define DEF_GVEC_VOP2(NAME, OP)                                                \
+DEF_GVEC_VOP2_FN(NAME, float64_##OP, 64)
+
+DEF_GVEC_VOP2_64(vcdg)
+DEF_GVEC_VOP2_64(vcdlg)
+DEF_GVEC_VOP2_64(vcgd)
+DEF_GVEC_VOP2_64(vclgd)
+DEF_GVEC_VOP2(vfi, round_to_int)
+DEF_GVEC_VOP2(vfsq, sqrt)
+
 typedef float64 (*vop64_3_fn)(float64 a, float64 b, float_status *s);
 static void vop64_3(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
                     CPUS390XState *env, bool s, vop64_3_fn fn,
@@ -285,125 +333,6 @@ void HELPER(gvec_vfche64s_cc)(void *v1, const void *v2, const void *v3,
     env->cc_op = vfc64(v1, v2, v3, env, true, float64_le_quiet, GETPC());
 }
 
-static uint64_t vcdg64(uint64_t a, float_status *s)
-{
-    return int64_to_float64(a, s);
-}
-
-void HELPER(gvec_vcdg64)(void *v1, const void *v2, CPUS390XState *env,
-                         uint32_t desc)
-{
-    const uint8_t erm = extract32(simd_data(desc), 4, 4);
-    const bool XxC = extract32(simd_data(desc), 2, 1);
-
-    vop64_2(v1, v2, env, false, XxC, erm, vcdg64, GETPC());
-}
-
-void HELPER(gvec_vcdg64s)(void *v1, const void *v2, CPUS390XState *env,
-                          uint32_t desc)
-{
-    const uint8_t erm = extract32(simd_data(desc), 4, 4);
-    const bool XxC = extract32(simd_data(desc), 2, 1);
-
-    vop64_2(v1, v2, env, true, XxC, erm, vcdg64, GETPC());
-}
-
-static uint64_t vcdlg64(uint64_t a, float_status *s)
-{
-    return uint64_to_float64(a, s);
-}
-
-void HELPER(gvec_vcdlg64)(void *v1, const void *v2, CPUS390XState *env,
-                          uint32_t desc)
-{
-    const uint8_t erm = extract32(simd_data(desc), 4, 4);
-    const bool XxC = extract32(simd_data(desc), 2, 1);
-
-    vop64_2(v1, v2, env, false, XxC, erm, vcdlg64, GETPC());
-}
-
-void HELPER(gvec_vcdlg64s)(void *v1, const void *v2, CPUS390XState *env,
-                           uint32_t desc)
-{
-    const uint8_t erm = extract32(simd_data(desc), 4, 4);
-    const bool XxC = extract32(simd_data(desc), 2, 1);
-
-    vop64_2(v1, v2, env, true, XxC, erm, vcdlg64, GETPC());
-}
-
-static uint64_t vcgd64(uint64_t a, float_status *s)
-{
-    const uint64_t tmp = float64_to_int64(a, s);
-
-    return float64_is_any_nan(a) ? INT64_MIN : tmp;
-}
-
-void HELPER(gvec_vcgd64)(void *v1, const void *v2, CPUS390XState *env,
-                         uint32_t desc)
-{
-    const uint8_t erm = extract32(simd_data(desc), 4, 4);
-    const bool XxC = extract32(simd_data(desc), 2, 1);
-
-    vop64_2(v1, v2, env, false, XxC, erm, vcgd64, GETPC());
-}
-
-void HELPER(gvec_vcgd64s)(void *v1, const void *v2, CPUS390XState *env,
-                          uint32_t desc)
-{
-    const uint8_t erm = extract32(simd_data(desc), 4, 4);
-    const bool XxC = extract32(simd_data(desc), 2, 1);
-
-    vop64_2(v1, v2, env, true, XxC, erm, vcgd64, GETPC());
-}
-
-static uint64_t vclgd64(uint64_t a, float_status *s)
-{
-    const uint64_t tmp = float64_to_uint64(a, s);
-
-    return float64_is_any_nan(a) ? 0 : tmp;
-}
-
-void HELPER(gvec_vclgd64)(void *v1, const void *v2, CPUS390XState *env,
-                          uint32_t desc)
-{
-    const uint8_t erm = extract32(simd_data(desc), 4, 4);
-    const bool XxC = extract32(simd_data(desc), 2, 1);
-
-    vop64_2(v1, v2, env, false, XxC, erm, vclgd64, GETPC());
-}
-
-void HELPER(gvec_vclgd64s)(void *v1, const void *v2, CPUS390XState *env,
-                           uint32_t desc)
-{
-    const uint8_t erm = extract32(simd_data(desc), 4, 4);
-    const bool XxC = extract32(simd_data(desc), 2, 1);
-
-    vop64_2(v1, v2, env, true, XxC, erm, vclgd64, GETPC());
-}
-
-static uint64_t vfi64(uint64_t a, float_status *s)
-{
-    return float64_round_to_int(a, s);
-}
-
-void HELPER(gvec_vfi64)(void *v1, const void *v2, CPUS390XState *env,
-                        uint32_t desc)
-{
-    const uint8_t erm = extract32(simd_data(desc), 4, 4);
-    const bool XxC = extract32(simd_data(desc), 2, 1);
-
-    vop64_2(v1, v2, env, false, XxC, erm, vfi64, GETPC());
-}
-
-void HELPER(gvec_vfi64s)(void *v1, const void *v2, CPUS390XState *env,
-                         uint32_t desc)
-{
-    const uint8_t erm = extract32(simd_data(desc), 4, 4);
-    const bool XxC = extract32(simd_data(desc), 2, 1);
-
-    vop64_2(v1, v2, env, true, XxC, erm, vfi64, GETPC());
-}
-
 static void vfll32(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
                    bool s, uintptr_t retaddr)
 {
@@ -530,23 +459,6 @@ void HELPER(gvec_vfms64s)(void *v1, const void *v2, const void *v3,
     vfma64(v1, v2, v3, v4, env, true, float_muladd_negate_c, GETPC());
 }
 
-static uint64_t vfsq64(uint64_t a, float_status *s)
-{
-    return float64_sqrt(a, s);
-}
-
-void HELPER(gvec_vfsq64)(void *v1, const void *v2, CPUS390XState *env,
-                         uint32_t desc)
-{
-    vop64_2(v1, v2, env, false, false, 0, vfsq64, GETPC());
-}
-
-void HELPER(gvec_vfsq64s)(void *v1, const void *v2, CPUS390XState *env,
-                          uint32_t desc)
-{
-    vop64_2(v1, v2, env, true, false, 0, vfsq64, GETPC());
-}
-
 static int vftci64(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
                    bool s, uint16_t i3)
 {
-- 
2.31.1


