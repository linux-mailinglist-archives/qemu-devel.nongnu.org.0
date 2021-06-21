Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A01103AE6BA
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:05:55 +0200 (CEST)
Received: from localhost ([::1]:52978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvGoU-0006E5-Lc
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGhy-0005yE-Uu
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGhs-0006at-ET
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b3N33qadEduKJVhIr/sFxQELiUhyIXnVUEuZdJDJjDg=;
 b=f4zcbRNUbvauB7ZBXh0avHf6FyZKRheUSM2UJStRU/1ISye1JaRX4IYI0BSq8dU1ctnnOf
 Kc2DooeOeSD6svEPDsjhVhTBhFSGYxux3SWDElDOPsPGlaldBNUJ6en0F2Jzb0tZywVGh0
 gMwwOOanbg4auh8Jlrcz3UxwYeETtb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-9qDek9asOeWR_d1JAeb7Yw-1; Mon, 21 Jun 2021 05:59:01 -0400
X-MC-Unique: 9qDek9asOeWR_d1JAeb7Yw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A425783DD0B;
 Mon, 21 Jun 2021 09:59:00 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3027E3AC1;
 Mon, 21 Jun 2021 09:58:59 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/37] s390x/tcg: Simplify vfc64() handling
Date: Mon, 21 Jun 2021 11:58:11 +0200
Message-Id: <20210621095842.335162-7-cohuck@redhat.com>
In-Reply-To: <20210621095842.335162-1-cohuck@redhat.com>
References: <20210621095842.335162-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Pass the m5 field via simd_data() and don't provide specialized handlers
for single-element variants.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210608092337.12221-6-david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/helper.h           |  6 ---
 target/s390x/translate_vx.c.inc | 45 +++++-----------
 target/s390x/vec_fpu_helper.c   | 94 +++++++++------------------------
 3 files changed, 38 insertions(+), 107 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 4788c1ddaf8c..02a16924a7b7 100644
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
index 280d45bb196f..604ae11024a9 100644
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
index ab23a597da73..01ee41d1543c 100644
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


