Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA1139DADF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 13:13:16 +0200 (CEST)
Received: from localhost ([::1]:48690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqDBz-0001Xs-KV
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 07:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD4K-0003V8-9Z
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:05:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD4H-0005Hp-9V
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:05:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623063916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=slza/cBUAb5psYwjWktgEKzvpDPnStm2iiNAJB9aySs=;
 b=XbdzvoHbP0H3tWXnmnRZ+waSNmaSzpg6TJ5tJyKYCqgeaFfCPEeMus3Npct/tI7/r49HQn
 kxwVDct3LmFAvD5tKOmqxznDebI/xTwv8qWkIdWYkXtVc5iQ+U9dXtHef6PtCIVAlECTeM
 tFv+Nn+KYieRMCGLEKkT1jf4ChkDFMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-4zd3J4vmNbeJ8MDzcn_Qcw-1; Mon, 07 Jun 2021 07:05:13 -0400
X-MC-Unique: 4zd3J4vmNbeJ8MDzcn_Qcw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE7CA6D4E3;
 Mon,  7 Jun 2021 11:05:11 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB41460C17;
 Mon,  7 Jun 2021 11:05:09 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/26] s390x/tcg: Implement 32/128 bit for VECTOR FP
 COMPARE *
Date: Mon,  7 Jun 2021 13:03:27 +0200
Message-Id: <20210607110338.31058-16-david@redhat.com>
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

In addition to 32/128bit variants, we also have to support the
"Signal-on-QNaN (SQ)" bit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           | 12 +++++++
 target/s390x/translate_vx.c.inc | 57 ++++++++++++++++++++++++-----
 target/s390x/vec_fpu_helper.c   | 64 +++++++++++++++++++++++++++++++--
 3 files changed, 121 insertions(+), 12 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 28797a6ccc..146836126c 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -252,12 +252,24 @@ DEF_HELPER_FLAGS_5(gvec_vfa64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfa128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_4(gvec_wfc64, void, cptr, cptr, env, i32)
 DEF_HELPER_4(gvec_wfk64, void, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_vfce32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_5(gvec_vfce32_cc, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfce64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_5(gvec_vfce64_cc, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_vfce128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_5(gvec_vfce128_cc, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_vfch32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_5(gvec_vfch32_cc, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfch64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_5(gvec_vfch64_cc, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_vfch128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_5(gvec_vfch128_cc, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_vfche32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_5(gvec_vfche32_cc, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfche64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_5(gvec_vfche64_cc, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_vfche128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_5(gvec_vfche128_cc, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vcdg64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vcdlg64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vcgd64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index 6241279e68..6f6ef6b6b8 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -2621,26 +2621,65 @@ static DisasJumpType op_vfc(DisasContext *s, DisasOps *o)
     const uint8_t m5 = get_field(s, m5);
     const uint8_t m6 = get_field(s, m6);
     const bool cs = extract32(m6, 0, 1);
-    gen_helper_gvec_3_ptr *fn;
-
-    if (fpf != FPF_LONG || extract32(m5, 0, 3) || extract32(m6, 1, 3)) {
-        gen_program_exception(s, PGM_SPECIFICATION);
-        return DISAS_NORETURN;
-    }
+    const bool sq = extract32(m5, 2, 1);
+    gen_helper_gvec_3_ptr *fn = NULL;
 
     switch (s->fields.op2) {
     case 0xe8:
-        fn = cs ? gen_helper_gvec_vfce64_cc : gen_helper_gvec_vfce64;
+        switch (fpf) {
+        case FPF_SHORT:
+            fn = cs ? gen_helper_gvec_vfce32_cc : gen_helper_gvec_vfce32;
+            break;
+        case FPF_LONG:
+            fn = cs ? gen_helper_gvec_vfce64_cc : gen_helper_gvec_vfce64;
+            break;
+        case FPF_EXT:
+            fn = cs ? gen_helper_gvec_vfce128_cc : gen_helper_gvec_vfce128;
+            break;
+        default:
+            break;
+        }
         break;
     case 0xeb:
-        fn = cs ? gen_helper_gvec_vfch64_cc : gen_helper_gvec_vfch64;
+        switch (fpf) {
+        case FPF_SHORT:
+            fn = cs ? gen_helper_gvec_vfch32_cc : gen_helper_gvec_vfch32;
+            break;
+        case FPF_LONG:
+            fn = cs ? gen_helper_gvec_vfch64_cc : gen_helper_gvec_vfch64;
+            break;
+        case FPF_EXT:
+            fn = cs ? gen_helper_gvec_vfch128_cc : gen_helper_gvec_vfch128;
+            break;
+        default:
+            break;
+        }
         break;
     case 0xea:
-        fn = cs ? gen_helper_gvec_vfche64_cc : gen_helper_gvec_vfche64;
+        switch (fpf) {
+        case FPF_SHORT:
+            fn = cs ? gen_helper_gvec_vfche32_cc : gen_helper_gvec_vfche32;
+            break;
+        case FPF_LONG:
+            fn = cs ? gen_helper_gvec_vfche64_cc : gen_helper_gvec_vfche64;
+            break;
+        case FPF_EXT:
+            fn = cs ? gen_helper_gvec_vfche128_cc : gen_helper_gvec_vfche128;
+            break;
+        default:
+            break;
+        }
         break;
     default:
         g_assert_not_reached();
     }
+
+    if (!fn || extract32(m5, 0, 2) || extract32(m6, 1, 3) ||
+        (!s390_has_feat(S390_FEAT_VECTOR_ENH) && (fpf != FPF_LONG || sq))) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
     gen_gvec_3_ptr(get_field(s, v1), get_field(s, v2), get_field(s, v3),
                    cpu_env, m5, fn);
     if (cs) {
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index 1df8f3d5a3..67dcd8b50a 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -340,6 +340,38 @@ void HELPER(gvec_##NAME##BITS)(const void *v1, const void *v2,                 \
 DEF_GVEC_WFC(wfc, false)
 DEF_GVEC_WFC(wfk, true)
 
+typedef bool (*vfc32_fn)(float32 a, float32 b, float_status *status);
+static int vfc32(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
+                 CPUS390XState *env, bool s, vfc32_fn fn, uintptr_t retaddr)
+{
+    uint8_t vxc, vec_exc = 0;
+    S390Vector tmp = {};
+    int match = 0;
+    int i;
+
+    for (i = 0; i < 4; i++) {
+        const float32 a = s390_vec_read_float32(v2, i);
+        const float32 b = s390_vec_read_float32(v3, i);
+
+        /* swap the order of the parameters, so we can use existing functions */
+        if (fn(b, a, &env->fpu_status)) {
+            match++;
+            s390_vec_write_element32(&tmp, i, -1u);
+        }
+        vxc = check_ieee_exc(env, i, false, &vec_exc);
+        if (s || vxc) {
+            break;
+        }
+    }
+
+    handle_ieee_exc(env, vxc, vec_exc, retaddr);
+    *v1 = tmp;
+    if (match) {
+        return s || match == 4 ? 0 : 1;
+    }
+    return 3;
+}
+
 typedef bool (*vfc64_fn)(float64 a, float64 b, float_status *status);
 static int vfc64(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
                  CPUS390XState *env, bool s, vfc64_fn fn, uintptr_t retaddr)
@@ -372,12 +404,35 @@ static int vfc64(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
     return 3;
 }
 
+typedef bool (*vfc128_fn)(float128 a, float128 b, float_status *status);
+static int vfc128(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
+                 CPUS390XState *env, bool s, vfc128_fn fn, uintptr_t retaddr)
+{
+    const float128 a = s390_vec_read_float128(v2);
+    const float128 b = s390_vec_read_float128(v3);
+    uint8_t vxc, vec_exc = 0;
+    S390Vector tmp = {};
+    bool match = false;
+
+    /* swap the order of the parameters, so we can use existing functions */
+    if (fn(b, a, &env->fpu_status)) {
+        match = true;
+        s390_vec_write_element64(&tmp, 0, -1ull);
+        s390_vec_write_element64(&tmp, 1, -1ull);
+    }
+    vxc = check_ieee_exc(env, 0, false, &vec_exc);
+    handle_ieee_exc(env, vxc, vec_exc, retaddr);
+    *v1 = tmp;
+    return match ? 0 : 3;
+}
+
 #define DEF_GVEC_VFC_B(NAME, OP, BITS)                                         \
 void HELPER(gvec_##NAME##BITS)(void *v1, const void *v2, const void *v3,       \
                                CPUS390XState *env, uint32_t desc)              \
 {                                                                              \
     const bool se = extract32(simd_data(desc), 3, 1);                          \
-    vfc##BITS##_fn fn = float##BITS##_##OP##_quiet;                            \
+    const bool sq = extract32(simd_data(desc), 2, 1);                          \
+    vfc##BITS##_fn fn = sq ? float##BITS##_##OP : float##BITS##_##OP##_quiet;  \
                                                                                \
     vfc##BITS(v1, v2, v3, env, se, fn, GETPC());                               \
 }                                                                              \
@@ -386,13 +441,16 @@ void HELPER(gvec_##NAME##BITS##_cc)(void *v1, const void *v2, const void *v3,  \
                                     CPUS390XState *env, uint32_t desc)         \
 {                                                                              \
     const bool se = extract32(simd_data(desc), 3, 1);                          \
-    vfc##BITS##_fn fn = float##BITS##_##OP##_quiet;                            \
+    const bool sq = extract32(simd_data(desc), 2, 1);                          \
+    vfc##BITS##_fn fn = sq ? float##BITS##_##OP : float##BITS##_##OP##_quiet;  \
                                                                                \
     env->cc_op = vfc##BITS(v1, v2, v3, env, se, fn, GETPC());                  \
 }
 
 #define DEF_GVEC_VFC(NAME, OP)                                                 \
-DEF_GVEC_VFC_B(NAME, OP, 64)
+DEF_GVEC_VFC_B(NAME, OP, 32)                                                   \
+DEF_GVEC_VFC_B(NAME, OP, 64)                                                   \
+DEF_GVEC_VFC_B(NAME, OP, 128)                                                  \
 
 DEF_GVEC_VFC(vfce, eq)
 DEF_GVEC_VFC(vfch, lt)
-- 
2.31.1


