Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CECD239F247
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:27:59 +0200 (CEST)
Received: from localhost ([::1]:49484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqY1e-0001XY-Ru
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqXxr-0001gN-KF
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:24:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqXxp-0008LP-Mc
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623144241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MXlQ6lOSCMrRfDexYW+mQhNyVYQEtLjRSt4eDRpcM/k=;
 b=b+KzsqjRD5JhSbsMJtejYlD3jIbzC1RoGYRblKZPOZM2n69KCxZ+p7yqxBb/ENe3X9wHY2
 NNWvhpIFdrTdy3FYFHSjU/6UGomJgv61iBotzOP9EENHJFI+JPVIjElQ92FAgRoE2zyP2k
 fwAG0O941dcg3wi/3DuN6BezDfAges0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-ruSAmYpfNtKqQX7IrbbMiQ-1; Tue, 08 Jun 2021 05:23:58 -0400
X-MC-Unique: ruSAmYpfNtKqQX7IrbbMiQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9421D501E8;
 Tue,  8 Jun 2021 09:23:56 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-132.ams2.redhat.com [10.36.115.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8035D5C1BB;
 Tue,  8 Jun 2021 09:23:54 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/26] s390x/tcg: Simplify vfc64() handling
Date: Tue,  8 Jun 2021 11:23:16 +0200
Message-Id: <20210608092337.12221-6-david@redhat.com>
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

Pass the m5 field via simd_data() and don't provide specialized handlers
for single-element variants.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           |  6 ---
 target/s390x/translate_vx.c.inc | 45 +++++-----------
 target/s390x/vec_fpu_helper.c   | 94 +++++++++------------------------
 3 files changed, 38 insertions(+), 107 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 4788c1ddaf..02a16924a7 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -250,17 +250,11 @@ DEF_HELPER_FLAGS_5(gvec_vfa64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_4(gvec_wfc64, void, cptr, cptr, env, i32)
 DEF_HELPER_4(gvec_wfk64, void, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfce64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
-DEF_HELPER_FLAGS_5(gvec_vfce64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_5(gvec_vfce64_cc, void, ptr, cptr, cptr, env, i32)
-DEF_HELPER_5(gvec_vfce64s_cc, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfch64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
-DEF_HELPER_FLAGS_5(gvec_vfch64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_5(gvec_vfch64_cc, void, ptr, cptr, cptr, env, i32)
-DEF_HELPER_5(gvec_vfch64s_cc, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfche64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
-DEF_HELPER_FLAGS_5(gvec_vfche64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_5(gvec_vfche64_cc, void, ptr, cptr, cptr, env, i32)
-DEF_HELPER_5(gvec_vfche64s_cc, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vcdg64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vcdlg64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vcgd64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index 280d45bb19..604ae11024 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -2497,7 +2497,6 @@ static DisasJumpType op_vfc(DisasContext *s, DisasOps *o)
     const uint8_t fpf = get_field(s, m4);
     const uint8_t m5 = get_field(s, m5);
     const uint8_t m6 = get_field(s, m6);
-    const bool se = extract32(m5, 3, 1);
     const bool cs = extract32(m6, 0, 1);
     gen_helper_gvec_3_ptr *fn;
 
@@ -2506,37 +2505,21 @@ static DisasJumpType op_vfc(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
 
-    if (cs) {
-        switch (s->fields.op2) {
-        case 0xe8:
-            fn = se ? gen_helper_gvec_vfce64s_cc : gen_helper_gvec_vfce64_cc;
-            break;
-        case 0xeb:
-            fn = se ? gen_helper_gvec_vfch64s_cc : gen_helper_gvec_vfch64_cc;
-            break;
-        case 0xea:
-            fn = se ? gen_helper_gvec_vfche64s_cc : gen_helper_gvec_vfche64_cc;
-            break;
-        default:
-            g_assert_not_reached();
-        }
-    } else {
-        switch (s->fields.op2) {
-        case 0xe8:
-            fn = se ? gen_helper_gvec_vfce64s : gen_helper_gvec_vfce64;
-            break;
-        case 0xeb:
-            fn = se ? gen_helper_gvec_vfch64s : gen_helper_gvec_vfch64;
-            break;
-        case 0xea:
-            fn = se ? gen_helper_gvec_vfche64s : gen_helper_gvec_vfche64;
-            break;
-        default:
-            g_assert_not_reached();
-        }
+    switch (s->fields.op2) {
+    case 0xe8:
+        fn = cs ? gen_helper_gvec_vfce64_cc : gen_helper_gvec_vfce64;
+        break;
+    case 0xeb:
+        fn = cs ? gen_helper_gvec_vfch64_cc : gen_helper_gvec_vfch64;
+        break;
+    case 0xea:
+        fn = cs ? gen_helper_gvec_vfche64_cc : gen_helper_gvec_vfche64;
+        break;
+    default:
+        g_assert_not_reached();
     }
-    gen_gvec_3_ptr(get_field(s, v1), get_field(s, v2),
-                   get_field(s, v3), cpu_env, 0, fn);
+    gen_gvec_3_ptr(get_field(s, v1), get_field(s, v2), get_field(s, v3),
+                   cpu_env, m5, fn);
     if (cs) {
         set_cc_static(s);
     }
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index ab23a597da..01ee41d154 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -239,8 +239,8 @@ static int vfc64(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
     int i;
 
     for (i = 0; i < 2; i++) {
-        const float64 a = s390_vec_read_element64(v2, i);
-        const float64 b = s390_vec_read_element64(v3, i);
+        const float64 a = s390_vec_read_float64(v2, i);
+        const float64 b = s390_vec_read_float64(v3, i);
 
         /* swap the order of the parameters, so we can use existing functions */
         if (fn(b, a, &env->fpu_status)) {
@@ -261,77 +261,31 @@ static int vfc64(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
     return 3;
 }
 
-void HELPER(gvec_vfce64)(void *v1, const void *v2, const void *v3,
-                         CPUS390XState *env, uint32_t desc)
-{
-    vfc64(v1, v2, v3, env, false, float64_eq_quiet, GETPC());
-}
-
-void HELPER(gvec_vfce64s)(void *v1, const void *v2, const void *v3,
-                          CPUS390XState *env, uint32_t desc)
-{
-    vfc64(v1, v2, v3, env, true, float64_eq_quiet, GETPC());
-}
-
-void HELPER(gvec_vfce64_cc)(void *v1, const void *v2, const void *v3,
-                            CPUS390XState *env, uint32_t desc)
-{
-    env->cc_op = vfc64(v1, v2, v3, env, false, float64_eq_quiet, GETPC());
-}
-
-void HELPER(gvec_vfce64s_cc)(void *v1, const void *v2, const void *v3,
-                            CPUS390XState *env, uint32_t desc)
-{
-    env->cc_op = vfc64(v1, v2, v3, env, true, float64_eq_quiet, GETPC());
-}
-
-void HELPER(gvec_vfch64)(void *v1, const void *v2, const void *v3,
-                         CPUS390XState *env, uint32_t desc)
-{
-    vfc64(v1, v2, v3, env, false, float64_lt_quiet, GETPC());
-}
-
-void HELPER(gvec_vfch64s)(void *v1, const void *v2, const void *v3,
-                          CPUS390XState *env, uint32_t desc)
-{
-    vfc64(v1, v2, v3, env, true, float64_lt_quiet, GETPC());
-}
-
-void HELPER(gvec_vfch64_cc)(void *v1, const void *v2, const void *v3,
-                            CPUS390XState *env, uint32_t desc)
-{
-    env->cc_op = vfc64(v1, v2, v3, env, false, float64_lt_quiet, GETPC());
-}
-
-void HELPER(gvec_vfch64s_cc)(void *v1, const void *v2, const void *v3,
-                             CPUS390XState *env, uint32_t desc)
-{
-    env->cc_op = vfc64(v1, v2, v3, env, true, float64_lt_quiet, GETPC());
-}
-
-void HELPER(gvec_vfche64)(void *v1, const void *v2, const void *v3,
-                          CPUS390XState *env, uint32_t desc)
-{
-    vfc64(v1, v2, v3, env, false, float64_le_quiet, GETPC());
-}
-
-void HELPER(gvec_vfche64s)(void *v1, const void *v2, const void *v3,
-                           CPUS390XState *env, uint32_t desc)
-{
-    vfc64(v1, v2, v3, env, true, float64_le_quiet, GETPC());
+#define DEF_GVEC_VFC_B(NAME, OP, BITS)                                         \
+void HELPER(gvec_##NAME##BITS)(void *v1, const void *v2, const void *v3,       \
+                               CPUS390XState *env, uint32_t desc)              \
+{                                                                              \
+    const bool se = extract32(simd_data(desc), 3, 1);                          \
+    vfc##BITS##_fn fn = float##BITS##_##OP##_quiet;                            \
+                                                                               \
+    vfc##BITS(v1, v2, v3, env, se, fn, GETPC());                               \
+}                                                                              \
+                                                                               \
+void HELPER(gvec_##NAME##BITS##_cc)(void *v1, const void *v2, const void *v3,  \
+                                    CPUS390XState *env, uint32_t desc)         \
+{                                                                              \
+    const bool se = extract32(simd_data(desc), 3, 1);                          \
+    vfc##BITS##_fn fn = float##BITS##_##OP##_quiet;                            \
+                                                                               \
+    env->cc_op = vfc##BITS(v1, v2, v3, env, se, fn, GETPC());                  \
 }
 
-void HELPER(gvec_vfche64_cc)(void *v1, const void *v2, const void *v3,
-                             CPUS390XState *env, uint32_t desc)
-{
-    env->cc_op = vfc64(v1, v2, v3, env, false, float64_le_quiet, GETPC());
-}
+#define DEF_GVEC_VFC(NAME, OP)                                                 \
+DEF_GVEC_VFC_B(NAME, OP, 64)
 
-void HELPER(gvec_vfche64s_cc)(void *v1, const void *v2, const void *v3,
-                              CPUS390XState *env, uint32_t desc)
-{
-    env->cc_op = vfc64(v1, v2, v3, env, true, float64_le_quiet, GETPC());
-}
+DEF_GVEC_VFC(vfce, eq)
+DEF_GVEC_VFC(vfch, lt)
+DEF_GVEC_VFC(vfche, le)
 
 static void vfll32(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
                    bool s, uintptr_t retaddr)
-- 
2.31.1


