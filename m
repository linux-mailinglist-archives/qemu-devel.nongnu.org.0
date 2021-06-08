Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C8339F291
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:38:20 +0200 (CEST)
Received: from localhost ([::1]:55954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqYBf-00008d-0h
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqXyg-0003VY-Af
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:24:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqXyd-0000Se-Oi
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:24:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623144291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6MeqKOegMOFJ3/AfM+v2aOuXWe53HYb5DJvZg1ps/jY=;
 b=Vhu8N8n8iq99SjFbIly5v4p2eeFOSZvSA3Gy8V6x9tot6oRwutixTaMc1eDsSO/HxyXwNz
 JHyqm4hG83Olm3z7qooI78F8bKsqcM6NehNdyxXmyrI4hQTSy5DedauvTTzvAjRF8QWKaY
 +Yt84gZJF7LeB2oHqGu2WDU+yCUHy/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-Vlipyz26PwqpRVDC2l5WDw-1; Tue, 08 Jun 2021 05:24:47 -0400
X-MC-Unique: Vlipyz26PwqpRVDC2l5WDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC70E501E6;
 Tue,  8 Jun 2021 09:24:46 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-132.ams2.redhat.com [10.36.115.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C45D95C1BB;
 Tue,  8 Jun 2021 09:24:44 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/26] s390x/tcg: Implement 32/128 bit for VECTOR FP
 MULTIPLY AND (ADD|SUBTRACT)
Date: Tue,  8 Jun 2021 11:23:32 +0200
Message-Id: <20210608092337.12221-22-david@redhat.com>
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           |  4 +++
 target/s390x/translate_vx.c.inc | 47 ++++++++++++++++++++++++++++-----
 target/s390x/vec_fpu_helper.c   | 44 +++++++++++++++++++++++++++++-
 3 files changed, 87 insertions(+), 8 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index bae73b9a56..2366756063 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -291,8 +291,12 @@ DEF_HELPER_FLAGS_4(gvec_vflr128, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfm32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfm64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfm128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_6(gvec_vfma32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_6(gvec_vfma64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_6(gvec_vfma128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_6(gvec_vfms32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_6(gvec_vfms64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_6(gvec_vfms128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfsq32, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfsq64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfsq128, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index 765f75df9c..17d41b178f 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -2818,18 +2818,51 @@ static DisasJumpType op_vfma(DisasContext *s, DisasOps *o)
 {
     const uint8_t m5 = get_field(s, m5);
     const uint8_t fpf = get_field(s, m6);
-    gen_helper_gvec_4_ptr *fn;
+    gen_helper_gvec_4_ptr *fn = NULL;
 
-    if (fpf != FPF_LONG || extract32(m5, 0, 3)) {
+    if (s->fields.op2 == 0x8f) {
+        switch (fpf) {
+        case FPF_SHORT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+                fn = gen_helper_gvec_vfma32;
+            }
+            break;
+        case FPF_LONG:
+            fn = gen_helper_gvec_vfma64;
+            break;
+        case FPF_EXT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+                fn = gen_helper_gvec_vfma128;
+            }
+            break;
+        default:
+            break;
+        }
+    } else {
+        switch (fpf) {
+        case FPF_SHORT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+                fn = gen_helper_gvec_vfms32;
+            }
+            break;
+        case FPF_LONG:
+            fn = gen_helper_gvec_vfms64;
+            break;
+        case FPF_EXT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+                fn = gen_helper_gvec_vfms128;
+            }
+            break;
+        default:
+            break;
+        }
+    }
+
+    if (!fn || extract32(m5, 0, 3)) {
         gen_program_exception(s, PGM_SPECIFICATION);
         return DISAS_NORETURN;
     }
 
-    if (s->fields.op2 == 0x8f) {
-        fn = gen_helper_gvec_vfma64;
-    } else {
-        fn = gen_helper_gvec_vfms64;
-    }
     gen_gvec_4_ptr(get_field(s, v1), get_field(s, v2),
                    get_field(s, v3), get_field(s, v4), cpu_env, m5, fn);
     return DISAS_NEXT;
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index 6984f770ff..29ccc608dc 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -582,6 +582,30 @@ void HELPER(gvec_vflr128)(void *v1, const void *v2, CPUS390XState *env,
     s390_vec_write_float64(v1, 0, ret);
 }
 
+static void vfma32(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
+                   const S390Vector *v4, CPUS390XState *env, bool s, int flags,
+                   uintptr_t retaddr)
+{
+    uint8_t vxc, vec_exc = 0;
+    S390Vector tmp = {};
+    int i;
+
+    for (i = 0; i < 4; i++) {
+        const float32 a = s390_vec_read_float32(v2, i);
+        const float32 b = s390_vec_read_float32(v3, i);
+        const float32 c = s390_vec_read_float32(v4, i);
+        float32 ret = float32_muladd(a, b, c, flags, &env->fpu_status);
+
+        s390_vec_write_float32(&tmp, i, ret);
+        vxc = check_ieee_exc(env, i, false, &vec_exc);
+        if (s || vxc) {
+            break;
+        }
+    }
+    handle_ieee_exc(env, vxc, vec_exc, retaddr);
+    *v1 = tmp;
+}
+
 static void vfma64(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
                    const S390Vector *v4, CPUS390XState *env, bool s, int flags,
                    uintptr_t retaddr)
@@ -606,6 +630,22 @@ static void vfma64(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
     *v1 = tmp;
 }
 
+static void vfma128(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
+                    const S390Vector *v4, CPUS390XState *env, bool s, int flags,
+                    uintptr_t retaddr)
+{
+    const float128 a = s390_vec_read_float128(v2);
+    const float128 b = s390_vec_read_float128(v3);
+    const float128 c = s390_vec_read_float128(v4);
+    uint8_t vxc, vec_exc = 0;
+    float128 ret;
+
+    ret = float128_muladd(a, b, c, flags, &env->fpu_status);
+    vxc = check_ieee_exc(env, 0, false, &vec_exc);
+    handle_ieee_exc(env, vxc, vec_exc, retaddr);
+    s390_vec_write_float128(v1, ret);
+}
+
 #define DEF_GVEC_VFMA_B(NAME, FLAGS, BITS)                                     \
 void HELPER(gvec_##NAME##BITS)(void *v1, const void *v2, const void *v3,       \
                                const void *v4, CPUS390XState *env,             \
@@ -617,7 +657,9 @@ void HELPER(gvec_##NAME##BITS)(void *v1, const void *v2, const void *v3,       \
 }
 
 #define DEF_GVEC_VFMA(NAME, FLAGS)                                             \
-    DEF_GVEC_VFMA_B(NAME, FLAGS, 64)
+    DEF_GVEC_VFMA_B(NAME, FLAGS, 32)                                           \
+    DEF_GVEC_VFMA_B(NAME, FLAGS, 64)                                           \
+    DEF_GVEC_VFMA_B(NAME, FLAGS, 128)
 
 DEF_GVEC_VFMA(vfma, 0)
 DEF_GVEC_VFMA(vfms, float_muladd_negate_c)
-- 
2.31.1


