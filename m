Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C03B383223
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 16:48:07 +0200 (CEST)
Received: from localhost ([::1]:55024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lieXO-00028E-Je
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 10:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lieFP-0005C7-Sy
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:29:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lieFL-0007mP-EI
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:29:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621261766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wT7YuNrF4GS9/NChuubQZNAUWXlFUMrxIdbdzpmMU1w=;
 b=eS8aqpC8fabtO0b49Pi0ZRUgAP6DdSgOhu3ldwj00P7W6+h1icFr+spx0AjBccxO1mj+5b
 dKvNHL52yEgblccNWoeym2V9vLAXJYw7CjQilpcQrj/5sCaAjnyY6Ar1GgV87TRESOhoNZ
 RrXCg53l01qQsf9OopO735SKr9k9OmQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-fmIAyAKaMo2a7Z3HsmzbNw-1; Mon, 17 May 2021 10:29:25 -0400
X-MC-Unique: fmIAyAKaMo2a7Z3HsmzbNw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4C0C107ACC7;
 Mon, 17 May 2021 14:29:23 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-101.ams2.redhat.com [10.36.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E88285DDAD;
 Mon, 17 May 2021 14:29:06 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/26] s390x/tcg: Implement 32/128 bit for VECTOR FP TEST
 DATA CLASS IMMEDIATE
Date: Mon, 17 May 2021 16:27:33 +0200
Message-Id: <20210517142739.38597-21-david@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
 target/s390x/helper.h           |  2 ++
 target/s390x/translate_vx.c.inc | 23 ++++++++++++++--
 target/s390x/vec_fpu_helper.c   | 47 +++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 02e6967ae6..bae73b9a56 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -299,7 +299,9 @@ DEF_HELPER_FLAGS_4(gvec_vfsq128, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfs32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfs64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfs128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_4(gvec_vftci32, void, ptr, cptr, env, i32)
 DEF_HELPER_4(gvec_vftci64, void, ptr, cptr, env, i32)
+DEF_HELPER_4(gvec_vftci128, void, ptr, cptr, env, i32)
 
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_3(servc, i32, env, i64, i64)
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index 4d1ccb4159..765f75df9c 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -2965,14 +2965,33 @@ static DisasJumpType op_vftci(DisasContext *s, DisasOps *o)
     const uint16_t i3 = get_field(s, i3);
     const uint8_t fpf = get_field(s, m4);
     const uint8_t m5 = get_field(s, m5);
+    gen_helper_gvec_2_ptr *fn = NULL;
 
-    if (fpf != FPF_LONG || extract32(m5, 0, 3)) {
+    switch (fpf) {
+    case FPF_SHORT:
+        if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+            fn = gen_helper_gvec_vftci32;
+        }
+        break;
+    case FPF_LONG:
+        fn = gen_helper_gvec_vftci64;
+        break;
+    case FPF_EXT:
+        if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+            fn = gen_helper_gvec_vftci128;
+        }
+        break;
+    default:
+        break;
+    }
+
+    if (!fn || extract32(m5, 0, 3)) {
         gen_program_exception(s, PGM_SPECIFICATION);
         return DISAS_NORETURN;
     }
 
     gen_gvec_2_ptr(get_field(s, v1), get_field(s, v2), cpu_env,
-                   deposit32(m5, 4, 12, i3), gen_helper_gvec_vftci64);
+                   deposit32(m5, 4, 12, i3), fn);
     set_cc_static(s);
     return DISAS_NEXT;
 }
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index 65170ed307..4c10734c4e 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -624,6 +624,36 @@ void HELPER(gvec_##NAME##BITS)(void *v1, const void *v2, const void *v3,       \
 DEF_GVEC_VFMA(vfma, 0)
 DEF_GVEC_VFMA(vfms, float_muladd_negate_c)
 
+void HELPER(gvec_vftci32)(void *v1, const void *v2, CPUS390XState *env,
+                          uint32_t desc)
+{
+    uint16_t i3 = extract32(simd_data(desc), 4, 12);
+    bool s = extract32(simd_data(desc), 3, 1);
+    int i, match = 0;
+
+    for (i = 0; i < 4; i++) {
+        float32 a = s390_vec_read_float32(v2, i);
+
+        if (float32_dcmask(env, a) & i3) {
+            match++;
+            s390_vec_write_element32(v1, i, -1u);
+        } else {
+            s390_vec_write_element32(v1, i, 0);
+        }
+        if (s) {
+            break;
+        }
+    }
+
+    if (match == 4 || (s && match)) {
+        env->cc_op = 0;
+    } else if (match) {
+        env->cc_op = 1;
+    } else {
+        env->cc_op = 3;
+    }
+}
+
 void HELPER(gvec_vftci64)(void *v1, const void *v2, CPUS390XState *env,
                           uint32_t desc)
 {
@@ -653,3 +683,20 @@ void HELPER(gvec_vftci64)(void *v1, const void *v2, CPUS390XState *env,
         env->cc_op = 3;
     }
 }
+
+void HELPER(gvec_vftci128)(void *v1, const void *v2, CPUS390XState *env,
+                           uint32_t desc)
+{
+    const float128 a = s390_vec_read_float128(v2);
+    uint16_t i3 = extract32(simd_data(desc), 4, 12);
+
+    if (float128_dcmask(env, a) & i3) {
+        env->cc_op = 0;
+        s390_vec_write_element64(v1, 0, -1ull);
+        s390_vec_write_element64(v1, 1, -1ull);
+    } else {
+        env->cc_op = 3;
+        s390_vec_write_element64(v1, 0, 0);
+        s390_vec_write_element64(v1, 1, 0);
+    }
+}
-- 
2.31.1


