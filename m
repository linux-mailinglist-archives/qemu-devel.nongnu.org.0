Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481C939F23E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:26:00 +0200 (CEST)
Received: from localhost ([::1]:41208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqXzj-0004R0-9Y
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqXxo-0001Vd-5C
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:24:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqXxi-0008Hx-7Y
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:23:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623144233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fvPQazC8ctVoQvxUesjqwVwHzoKOgMPwj9RK5dgTaR0=;
 b=ed4kmzqR/HzyH+qo+hj44VogsVOMD+woeXkSmvHroioMb3vlMNGvM7aqL3q3ByrQYu8nYv
 GDnJFEwDiFor4m5LeBvhYDUPF+vtb1n/Il/AH/9uQfyxqQi++oU3y2/mXzC3XrV0xT8hEg
 smYExTA/XyC+iiG/C01fi/IXhNi6F0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-JgFUkUPUNFONkMxdvSqfYw-1; Tue, 08 Jun 2021 05:23:52 -0400
X-MC-Unique: JgFUkUPUNFONkMxdvSqfYw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CAFA180FD6D;
 Tue,  8 Jun 2021 09:23:51 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-132.ams2.redhat.com [10.36.115.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BF535C1C2;
 Tue,  8 Jun 2021 09:23:49 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/26] s390x/tcg: Simplify vop64_3() handling
Date: Tue,  8 Jun 2021 11:23:14 +0200
Message-Id: <20210608092337.12221-4-david@redhat.com>
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

Let's simplify, reworking our handler generation, passing the whole "m5"
register content and not providing specialized handlers for "se", and
reading/writing proper float64 values using new helpers.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           |  4 --
 target/s390x/translate_vx.c.inc | 11 ++--
 target/s390x/vec_fpu_helper.c   | 94 +++++++++------------------------
 3 files changed, 30 insertions(+), 79 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index d4e4f3388f..2344f81273 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -247,7 +247,6 @@ DEF_HELPER_6(gvec_vstrc_cc_rt32, void, ptr, cptr, cptr, cptr, env, i32)
 
 /* === Vector Floating-Point Instructions */
 DEF_HELPER_FLAGS_5(gvec_vfa64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
-DEF_HELPER_FLAGS_5(gvec_vfa64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_4(gvec_wfc64, void, cptr, cptr, env, i32)
 DEF_HELPER_4(gvec_wfk64, void, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfce64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
@@ -271,7 +270,6 @@ DEF_HELPER_FLAGS_4(gvec_vcgd64s, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vclgd64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vclgd64s, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfd64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
-DEF_HELPER_FLAGS_5(gvec_vfd64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfi64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfi64s, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfll32, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
@@ -279,7 +277,6 @@ DEF_HELPER_FLAGS_4(gvec_vfll32s, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vflr64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vflr64s, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfm64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
-DEF_HELPER_FLAGS_5(gvec_vfm64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_6(gvec_vfma64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_6(gvec_vfma64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_6(gvec_vfms64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
@@ -287,7 +284,6 @@ DEF_HELPER_FLAGS_6(gvec_vfms64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, en
 DEF_HELPER_FLAGS_4(gvec_vfsq64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfsq64s, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfs64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
-DEF_HELPER_FLAGS_5(gvec_vfs64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_4(gvec_vftci64, void, ptr, cptr, env, i32)
 DEF_HELPER_4(gvec_vftci64s, void, ptr, cptr, env, i32)
 
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index eb767f5288..2d3fbdfab2 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -2443,7 +2443,6 @@ static DisasJumpType op_vfa(DisasContext *s, DisasOps *o)
 {
     const uint8_t fpf = get_field(s, m4);
     const uint8_t m5 = get_field(s, m5);
-    const bool se = extract32(m5, 3, 1);
     gen_helper_gvec_3_ptr *fn;
 
     if (fpf != FPF_LONG || extract32(m5, 0, 3)) {
@@ -2453,22 +2452,22 @@ static DisasJumpType op_vfa(DisasContext *s, DisasOps *o)
 
     switch (s->fields.op2) {
     case 0xe3:
-        fn = se ? gen_helper_gvec_vfa64s : gen_helper_gvec_vfa64;
+        fn = gen_helper_gvec_vfa64;
         break;
     case 0xe5:
-        fn = se ? gen_helper_gvec_vfd64s : gen_helper_gvec_vfd64;
+        fn = gen_helper_gvec_vfd64;
         break;
     case 0xe7:
-        fn = se ? gen_helper_gvec_vfm64s : gen_helper_gvec_vfm64;
+        fn = gen_helper_gvec_vfm64;
         break;
     case 0xe2:
-        fn = se ? gen_helper_gvec_vfs64s : gen_helper_gvec_vfs64;
+        fn = gen_helper_gvec_vfs64;
         break;
     default:
         g_assert_not_reached();
     }
     gen_gvec_3_ptr(get_field(s, v1), get_field(s, v2),
-                   get_field(s, v3), cpu_env, 0, fn);
+                   get_field(s, v3), cpu_env, m5, fn);
     return DISAS_NEXT;
 }
 
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index 56765918d2..280ee0f1ea 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -78,6 +78,16 @@ static void handle_ieee_exc(CPUS390XState *env, uint8_t vxc, uint8_t vec_exc,
     }
 }
 
+static float64 s390_vec_read_float64(const S390Vector *v, uint8_t enr)
+{
+    return make_float64(s390_vec_read_element64(v, enr));
+}
+
+static void s390_vec_write_float64(S390Vector *v, uint8_t enr, float64 data)
+{
+    return s390_vec_write_element64(v, enr, data);
+}
+
 typedef uint64_t (*vop64_2_fn)(uint64_t a, float_status *s);
 static void vop64_2(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
                     bool s, bool XxC, uint8_t erm, vop64_2_fn fn,
@@ -102,7 +112,7 @@ static void vop64_2(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
     *v1 = tmp;
 }
 
-typedef uint64_t (*vop64_3_fn)(uint64_t a, uint64_t b, float_status *s);
+typedef float64 (*vop64_3_fn)(float64 a, float64 b, float_status *s);
 static void vop64_3(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
                     CPUS390XState *env, bool s, vop64_3_fn fn,
                     uintptr_t retaddr)
@@ -112,10 +122,10 @@ static void vop64_3(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
     int i;
 
     for (i = 0; i < 2; i++) {
-        const uint64_t a = s390_vec_read_element64(v2, i);
-        const uint64_t b = s390_vec_read_element64(v3, i);
+        const float64 a = s390_vec_read_float64(v2, i);
+        const float64 b = s390_vec_read_float64(v3, i);
 
-        s390_vec_write_element64(&tmp, i, fn(a, b, &env->fpu_status));
+        s390_vec_write_float64(&tmp, i, fn(a, b, &env->fpu_status));
         vxc = check_ieee_exc(env, i, false, &vec_exc);
         if (s || vxc) {
             break;
@@ -125,22 +135,19 @@ static void vop64_3(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
     *v1 = tmp;
 }
 
-static uint64_t vfa64(uint64_t a, uint64_t b, float_status *s)
-{
-    return float64_add(a, b, s);
+#define DEF_GVEC_VOP3(NAME, OP)                                                \
+void HELPER(gvec_##NAME##64)(void *v1, const void *v2, const void *v3,         \
+                             CPUS390XState *env, uint32_t desc)                \
+{                                                                              \
+    const bool se = extract32(simd_data(desc), 3, 1);                          \
+                                                                               \
+    vop64_3(v1, v2, v3, env, se, float64_##OP, GETPC());                       \
 }
 
-void HELPER(gvec_vfa64)(void *v1, const void *v2, const void *v3,
-                        CPUS390XState *env, uint32_t desc)
-{
-    vop64_3(v1, v2, v3, env, false, vfa64, GETPC());
-}
-
-void HELPER(gvec_vfa64s)(void *v1, const void *v2, const void *v3,
-                         CPUS390XState *env, uint32_t desc)
-{
-    vop64_3(v1, v2, v3, env, true, vfa64, GETPC());
-}
+DEF_GVEC_VOP3(vfa, add)
+DEF_GVEC_VOP3(vfs, sub)
+DEF_GVEC_VOP3(vfd, div)
+DEF_GVEC_VOP3(vfm, mul)
 
 static int wfc64(const S390Vector *v1, const S390Vector *v2,
                  CPUS390XState *env, bool signal, uintptr_t retaddr)
@@ -374,23 +381,6 @@ void HELPER(gvec_vclgd64s)(void *v1, const void *v2, CPUS390XState *env,
     vop64_2(v1, v2, env, true, XxC, erm, vclgd64, GETPC());
 }
 
-static uint64_t vfd64(uint64_t a, uint64_t b, float_status *s)
-{
-    return float64_div(a, b, s);
-}
-
-void HELPER(gvec_vfd64)(void *v1, const void *v2, const void *v3,
-                        CPUS390XState *env, uint32_t desc)
-{
-    vop64_3(v1, v2, v3, env, false, vfd64, GETPC());
-}
-
-void HELPER(gvec_vfd64s)(void *v1, const void *v2, const void *v3,
-                         CPUS390XState *env, uint32_t desc)
-{
-    vop64_3(v1, v2, v3, env, true, vfd64, GETPC());
-}
-
 static uint64_t vfi64(uint64_t a, float_status *s)
 {
     return float64_round_to_int(a, s);
@@ -492,23 +482,6 @@ void HELPER(gvec_vflr64s)(void *v1, const void *v2, CPUS390XState *env,
     vflr64(v1, v2, env, true, XxC, erm, GETPC());
 }
 
-static uint64_t vfm64(uint64_t a, uint64_t b, float_status *s)
-{
-    return float64_mul(a, b, s);
-}
-
-void HELPER(gvec_vfm64)(void *v1, const void *v2, const void *v3,
-                        CPUS390XState *env, uint32_t desc)
-{
-    vop64_3(v1, v2, v3, env, false, vfm64, GETPC());
-}
-
-void HELPER(gvec_vfm64s)(void *v1, const void *v2, const void *v3,
-                         CPUS390XState *env, uint32_t desc)
-{
-    vop64_3(v1, v2, v3, env, true, vfm64, GETPC());
-}
-
 static void vfma64(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
                    const S390Vector *v4, CPUS390XState *env, bool s, int flags,
                    uintptr_t retaddr)
@@ -574,23 +547,6 @@ void HELPER(gvec_vfsq64s)(void *v1, const void *v2, CPUS390XState *env,
     vop64_2(v1, v2, env, true, false, 0, vfsq64, GETPC());
 }
 
-static uint64_t vfs64(uint64_t a, uint64_t b, float_status *s)
-{
-    return float64_sub(a, b, s);
-}
-
-void HELPER(gvec_vfs64)(void *v1, const void *v2, const void *v3,
-                        CPUS390XState *env, uint32_t desc)
-{
-    vop64_3(v1, v2, v3, env, false, vfs64, GETPC());
-}
-
-void HELPER(gvec_vfs64s)(void *v1, const void *v2, const void *v3,
-                         CPUS390XState *env, uint32_t desc)
-{
-    vop64_3(v1, v2, v3, env, true, vfs64, GETPC());
-}
-
 static int vftci64(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
                    bool s, uint16_t i3)
 {
-- 
2.31.1


