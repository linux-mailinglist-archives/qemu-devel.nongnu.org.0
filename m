Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E353B39F283
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:34:27 +0200 (CEST)
Received: from localhost ([::1]:43794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqY7u-00005c-VD
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqXyL-0002bl-F3
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:24:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqXyG-0000DN-7D
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:24:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623144267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YtHnlcy2iVHHWwty17rQWh9FOnU45KsTE1tLm32+dX8=;
 b=Du0jhpyhlxOmOWLMlXmvrQ39qEgK0qRXMRYysJsokgdivpNPwQu/kfnEPp8git0i2bc7vb
 TYoBOOVjr6Aj6Zaq6Sf32mIOLowAfMlmAyA4FQYIojRUW6fOmq+vZ2A1VysUMKmJCs/qIM
 m9XnA6YuQppcx5/yfbGoSZcfAbgMYpI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-XyWBYjutP0-ShryfNnmf8w-1; Tue, 08 Jun 2021 05:24:24 -0400
X-MC-Unique: XyWBYjutP0-ShryfNnmf8w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CDC180ED96;
 Tue,  8 Jun 2021 09:24:23 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-132.ams2.redhat.com [10.36.115.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D54DB5C1BB;
 Tue,  8 Jun 2021 09:24:17 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/26] s390x/tcg: Implement 32/128 bit for VECTOR FP
 (ADD|DIVIDE|MULTIPLY|SUBTRACT)
Date: Tue,  8 Jun 2021 11:23:24 +0200
Message-Id: <20210608092337.12221-14-david@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
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

In case of 128bit, we always have a single element. Add new helpers for
reading/writing 32/128 bit floats.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           |  8 ++++
 target/s390x/translate_vx.c.inc | 85 +++++++++++++++++++++++++++++----
 target/s390x/vec_fpu_helper.c   | 74 ++++++++++++++++++++++++++--
 3 files changed, 153 insertions(+), 14 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index e99c9643eb..2d5e382e61 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -247,7 +247,9 @@ DEF_HELPER_6(gvec_vstrc_cc_rt16, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_6(gvec_vstrc_cc_rt32, void, ptr, cptr, cptr, cptr, env, i32)
 
 /* === Vector Floating-Point Instructions */
+DEF_HELPER_FLAGS_5(gvec_vfa32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfa64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_vfa128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_4(gvec_wfc64, void, cptr, cptr, env, i32)
 DEF_HELPER_4(gvec_wfk64, void, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfce64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
@@ -260,15 +262,21 @@ DEF_HELPER_FLAGS_4(gvec_vcdg64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vcdlg64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vcgd64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vclgd64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_vfd32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfd64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_vfd128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfi64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfll32, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vflr64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_vfm32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfm64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_vfm128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_6(gvec_vfma64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_6(gvec_vfms64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfsq64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_vfs32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfs64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_vfs128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_4(gvec_vftci64, void, ptr, cptr, env, i32)
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index 6e75b40eb8..0fbd914b40 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -2501,29 +2501,94 @@ static DisasJumpType op_vfa(DisasContext *s, DisasOps *o)
 {
     const uint8_t fpf = get_field(s, m4);
     const uint8_t m5 = get_field(s, m5);
-    gen_helper_gvec_3_ptr *fn;
-
-    if (fpf != FPF_LONG || extract32(m5, 0, 3)) {
-        gen_program_exception(s, PGM_SPECIFICATION);
-        return DISAS_NORETURN;
-    }
+    gen_helper_gvec_3_ptr *fn = NULL;
 
     switch (s->fields.op2) {
     case 0xe3:
-        fn = gen_helper_gvec_vfa64;
+        switch (fpf) {
+        case FPF_SHORT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+                fn = gen_helper_gvec_vfa32;
+            }
+            break;
+        case FPF_LONG:
+            fn = gen_helper_gvec_vfa64;
+            break;
+        case FPF_EXT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+                fn = gen_helper_gvec_vfa128;
+            }
+            break;
+        default:
+            break;
+        }
         break;
     case 0xe5:
-        fn = gen_helper_gvec_vfd64;
+        switch (fpf) {
+        case FPF_SHORT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+                fn = gen_helper_gvec_vfd32;
+            }
+            break;
+        case FPF_LONG:
+            fn = gen_helper_gvec_vfd64;
+            break;
+        case FPF_EXT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+                fn = gen_helper_gvec_vfd128;
+            }
+            break;
+        default:
+            break;
+        }
         break;
     case 0xe7:
-        fn = gen_helper_gvec_vfm64;
+        switch (fpf) {
+        case FPF_SHORT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+                fn = gen_helper_gvec_vfm32;
+            }
+            break;
+        case FPF_LONG:
+            fn = gen_helper_gvec_vfm64;
+            break;
+        case FPF_EXT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+                fn = gen_helper_gvec_vfm128;
+            }
+            break;
+        default:
+            break;
+        }
         break;
     case 0xe2:
-        fn = gen_helper_gvec_vfs64;
+        switch (fpf) {
+        case FPF_SHORT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+                fn = gen_helper_gvec_vfs32;
+            }
+            break;
+        case FPF_LONG:
+            fn = gen_helper_gvec_vfs64;
+            break;
+        case FPF_EXT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+                fn = gen_helper_gvec_vfs128;
+            }
+            break;
+        default:
+            break;
+        }
         break;
     default:
         g_assert_not_reached();
     }
+
+    if (!fn || extract32(m5, 0, 3)) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
     gen_gvec_3_ptr(get_field(s, v1), get_field(s, v2),
                    get_field(s, v3), cpu_env, m5, fn);
     return DISAS_NEXT;
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index 4af59ea66c..3484c161ba 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -78,16 +78,38 @@ static void handle_ieee_exc(CPUS390XState *env, uint8_t vxc, uint8_t vec_exc,
     }
 }
 
+static float32 s390_vec_read_float32(const S390Vector *v, uint8_t enr)
+{
+    return make_float32(s390_vec_read_element32(v, enr));
+}
+
 static float64 s390_vec_read_float64(const S390Vector *v, uint8_t enr)
 {
     return make_float64(s390_vec_read_element64(v, enr));
 }
 
+static float128 s390_vec_read_float128(const S390Vector *v)
+{
+    return make_float128(s390_vec_read_element64(v, 0),
+                         s390_vec_read_element64(v, 1));
+}
+
+static void s390_vec_write_float32(S390Vector *v, uint8_t enr, float32 data)
+{
+    return s390_vec_write_element32(v, enr, data);
+}
+
 static void s390_vec_write_float64(S390Vector *v, uint8_t enr, float64 data)
 {
     return s390_vec_write_element64(v, enr, data);
 }
 
+static void s390_vec_write_float128(S390Vector *v, float128 data)
+{
+    s390_vec_write_element64(v, 0, data.high);
+    s390_vec_write_element64(v, 1, data.low);
+}
+
 typedef float64 (*vop64_2_fn)(float64 a, float_status *s);
 static void vop64_2(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
                     bool s, bool XxC, uint8_t erm, vop64_2_fn fn,
@@ -160,6 +182,29 @@ DEF_GVEC_VOP2_64(vclgd)
 DEF_GVEC_VOP2(vfi, round_to_int)
 DEF_GVEC_VOP2(vfsq, sqrt)
 
+typedef float32 (*vop32_3_fn)(float32 a, float32 b, float_status *s);
+static void vop32_3(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
+                    CPUS390XState *env, bool s, vop32_3_fn fn,
+                    uintptr_t retaddr)
+{
+    uint8_t vxc, vec_exc = 0;
+    S390Vector tmp = {};
+    int i;
+
+    for (i = 0; i < 4; i++) {
+        const float32 a = s390_vec_read_float32(v2, i);
+        const float32 b = s390_vec_read_float32(v3, i);
+
+        s390_vec_write_float32(&tmp, i, fn(a, b, &env->fpu_status));
+        vxc = check_ieee_exc(env, i, false, &vec_exc);
+        if (s || vxc) {
+            break;
+        }
+    }
+    handle_ieee_exc(env, vxc, vec_exc, retaddr);
+    *v1 = tmp;
+}
+
 typedef float64 (*vop64_3_fn)(float64 a, float64 b, float_status *s);
 static void vop64_3(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
                     CPUS390XState *env, bool s, vop64_3_fn fn,
@@ -183,15 +228,36 @@ static void vop64_3(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
     *v1 = tmp;
 }
 
-#define DEF_GVEC_VOP3(NAME, OP)                                                \
-void HELPER(gvec_##NAME##64)(void *v1, const void *v2, const void *v3,         \
-                             CPUS390XState *env, uint32_t desc)                \
+typedef float128 (*vop128_3_fn)(float128 a, float128 b, float_status *s);
+static void vop128_3(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
+                     CPUS390XState *env, bool s, vop128_3_fn fn,
+                     uintptr_t retaddr)
+{
+    const float128 a = s390_vec_read_float128(v2);
+    const float128 b = s390_vec_read_float128(v3);
+    uint8_t vxc, vec_exc = 0;
+    S390Vector tmp = {};
+
+    s390_vec_write_float128(&tmp, fn(a, b, &env->fpu_status));
+    vxc = check_ieee_exc(env, 0, false, &vec_exc);
+    handle_ieee_exc(env, vxc, vec_exc, retaddr);
+    *v1 = tmp;
+}
+
+#define DEF_GVEC_VOP3_B(NAME, OP, BITS)                                        \
+void HELPER(gvec_##NAME##BITS)(void *v1, const void *v2, const void *v3,       \
+                              CPUS390XState *env, uint32_t desc)               \
 {                                                                              \
     const bool se = extract32(simd_data(desc), 3, 1);                          \
                                                                                \
-    vop64_3(v1, v2, v3, env, se, float64_##OP, GETPC());                       \
+    vop##BITS##_3(v1, v2, v3, env, se, float##BITS##_##OP, GETPC());           \
 }
 
+#define DEF_GVEC_VOP3(NAME, OP)                                                \
+DEF_GVEC_VOP3_B(NAME, OP, 32)                                                  \
+DEF_GVEC_VOP3_B(NAME, OP, 64)                                                  \
+DEF_GVEC_VOP3_B(NAME, OP, 128)
+
 DEF_GVEC_VOP3(vfa, add)
 DEF_GVEC_VOP3(vfs, sub)
 DEF_GVEC_VOP3(vfd, div)
-- 
2.31.1


