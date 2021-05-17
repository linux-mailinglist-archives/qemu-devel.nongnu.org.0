Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FA6383177
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 16:39:57 +0200 (CEST)
Received: from localhost ([::1]:57966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liePU-0001rM-St
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 10:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lieEx-0004ER-TG
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:29:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lieEv-0007Un-2e
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:29:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621261736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dBCDuN4+T6opqa2Am12TLGm3eMPV1Hok8621qB7Cc/o=;
 b=OR8fEumLZ6Tvr7K5D+0USdawQhE3vZxmFKL+nmYj75g+CQvxlwnEzpp0kwnohgv3I+L2yk
 2Ivw2lSn8jtRIQJm8q79QmXNqCrSnw6/NfMv6YqR6cM4VXs/R+k+Dxy+7wQlaaiNbPph25
 IIqG31BhHloKXeugZn+DVkjnvCh5phc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-O5aAOdx_M4iMuaNDp_Q_Jw-1; Mon, 17 May 2021 10:28:54 -0400
X-MC-Unique: O5aAOdx_M4iMuaNDp_Q_Jw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 636B48042AC;
 Mon, 17 May 2021 14:28:53 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-101.ams2.redhat.com [10.36.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B13905E26F;
 Mon, 17 May 2021 14:28:50 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/26] s390x/tcg: Implement 32/128 bit for VECTOR FP
 COMPARE (AND SIGNAL) SCALAR
Date: Mon, 17 May 2021 16:27:29 +0200
Message-Id: <20210517142739.38597-17-david@redhat.com>
In-Reply-To: <20210517142739.38597-1-david@redhat.com>
References: <20210517142739.38597-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           |  4 +++
 target/s390x/translate_vx.c.inc | 38 ++++++++++++++++++++++------
 target/s390x/vec_fpu_helper.c   | 44 ++++++++++++++++++++++++++++++++-
 3 files changed, 77 insertions(+), 9 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 146836126c..dca436f710 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -250,8 +250,12 @@ DEF_HELPER_6(gvec_vstrc_cc_rt32, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfa32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfa64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfa128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_4(gvec_wfc32, void, cptr, cptr, env, i32)
+DEF_HELPER_4(gvec_wfk32, void, cptr, cptr, env, i32)
 DEF_HELPER_4(gvec_wfc64, void, cptr, cptr, env, i32)
 DEF_HELPER_4(gvec_wfk64, void, cptr, cptr, env, i32)
+DEF_HELPER_4(gvec_wfc128, void, cptr, cptr, env, i32)
+DEF_HELPER_4(gvec_wfk128, void, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfce32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_5(gvec_vfce32_cc, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfce64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index 6f6ef6b6b8..822a9d0513 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -2598,19 +2598,41 @@ static DisasJumpType op_wfc(DisasContext *s, DisasOps *o)
 {
     const uint8_t fpf = get_field(s, m3);
     const uint8_t m4 = get_field(s, m4);
+    gen_helper_gvec_2_ptr *fn = NULL;
 
-    if (fpf != FPF_LONG || m4) {
+    switch (fpf) {
+    case FPF_SHORT:
+        if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+            fn = gen_helper_gvec_wfk32;
+            if (s->fields.op2 == 0xcb) {
+                fn = gen_helper_gvec_wfc32;
+            }
+        }
+        break;
+    case FPF_LONG:
+        fn = gen_helper_gvec_wfk64;
+        if (s->fields.op2 == 0xcb) {
+            fn = gen_helper_gvec_wfc64;
+        }
+        break;
+    case FPF_EXT:
+        if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+            fn = gen_helper_gvec_wfk128;
+            if (s->fields.op2 == 0xcb) {
+                fn = gen_helper_gvec_wfc128;
+            }
+        }
+        break;
+    default:
+        break;
+    };
+
+    if (!fn || m4) {
         gen_program_exception(s, PGM_SPECIFICATION);
         return DISAS_NORETURN;
     }
 
-    if (s->fields.op2 == 0xcb) {
-        gen_gvec_2_ptr(get_field(s, v1), get_field(s, v2),
-                       cpu_env, 0, gen_helper_gvec_wfc64);
-    } else {
-        gen_gvec_2_ptr(get_field(s, v1), get_field(s, v2),
-                       cpu_env, 0, gen_helper_gvec_wfk64);
-    }
+    gen_gvec_2_ptr(get_field(s, v1), get_field(s, v2), cpu_env, 0, fn);
     set_cc_static(s);
     return DISAS_NEXT;
 }
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index 6fff3e9f01..ab16ed4e24 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -309,6 +309,26 @@ DEF_GVEC_VOP3(vfs, sub)
 DEF_GVEC_VOP3(vfd, div)
 DEF_GVEC_VOP3(vfm, mul)
 
+static int wfc32(const S390Vector *v1, const S390Vector *v2,
+                 CPUS390XState *env, bool signal, uintptr_t retaddr)
+{
+    /* only the zero-indexed elements are compared */
+    const float32 a = s390_vec_read_float32(v1, 0);
+    const float32 b = s390_vec_read_float32(v2, 0);
+    uint8_t vxc, vec_exc = 0;
+    int cmp;
+
+    if (signal) {
+        cmp = float32_compare(a, b, &env->fpu_status);
+    } else {
+        cmp = float32_compare_quiet(a, b, &env->fpu_status);
+    }
+    vxc = check_ieee_exc(env, 0, false, &vec_exc);
+    handle_ieee_exc(env, vxc, vec_exc, retaddr);
+
+    return float_comp_to_cc(env, cmp);
+}
+
 static int wfc64(const S390Vector *v1, const S390Vector *v2,
                  CPUS390XState *env, bool signal, uintptr_t retaddr)
 {
@@ -329,6 +349,26 @@ static int wfc64(const S390Vector *v1, const S390Vector *v2,
     return float_comp_to_cc(env, cmp);
 }
 
+static int wfc128(const S390Vector *v1, const S390Vector *v2,
+                  CPUS390XState *env, bool signal, uintptr_t retaddr)
+{
+    /* only the zero-indexed elements are compared */
+    const float128 a = s390_vec_read_float128(v1);
+    const float128 b = s390_vec_read_float128(v2);
+    uint8_t vxc, vec_exc = 0;
+    int cmp;
+
+    if (signal) {
+        cmp = float128_compare(a, b, &env->fpu_status);
+    } else {
+        cmp = float128_compare_quiet(a, b, &env->fpu_status);
+    }
+    vxc = check_ieee_exc(env, 0, false, &vec_exc);
+    handle_ieee_exc(env, vxc, vec_exc, retaddr);
+
+    return float_comp_to_cc(env, cmp);
+}
+
 #define DEF_GVEC_WFC_B(NAME, SIGNAL, BITS)                                     \
 void HELPER(gvec_##NAME##BITS)(const void *v1, const void *v2,                 \
                                CPUS390XState *env, uint32_t desc)              \
@@ -337,7 +377,9 @@ void HELPER(gvec_##NAME##BITS)(const void *v1, const void *v2,                 \
 }
 
 #define DEF_GVEC_WFC(NAME, SIGNAL)                                             \
-     DEF_GVEC_WFC_B(NAME, SIGNAL, 64)
+     DEF_GVEC_WFC_B(NAME, SIGNAL, 32)                                          \
+     DEF_GVEC_WFC_B(NAME, SIGNAL, 64)                                          \
+     DEF_GVEC_WFC_B(NAME, SIGNAL, 128)
 
 DEF_GVEC_WFC(wfc, false)
 DEF_GVEC_WFC(wfk, true)
-- 
2.31.1


