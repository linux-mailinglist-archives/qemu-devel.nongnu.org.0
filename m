Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860CF3AE6D2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:13:42 +0200 (CEST)
Received: from localhost ([::1]:50556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvGw1-00070K-Hq
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGi0-00064f-G8
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGhy-0006eQ-GX
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kOTuhy73dO7upkkvGDl7EQmMAbmiVFynGD2s/ehUiBE=;
 b=RP+szHEmlnsel9NtxINNLBGrpXonpkcF8Rg0L6MskL9qmBeS+8zRe3hz74zgYmEMCtj0R9
 KVVAHnsJ76gBpXx+W0isNKpsZLFP3hTlyPLwmrmw6o4a5S6FI9vHSXyw4ndT57zEciFeT3
 BQBPpi4b9D/k7MUSZPRmj412PfDVngY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-jdsCvyWiNduM2LkXgmY4nA-1; Mon, 21 Jun 2021 05:59:05 -0400
X-MC-Unique: jdsCvyWiNduM2LkXgmY4nA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2031800C78;
 Mon, 21 Jun 2021 09:59:03 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9ED841ABD4;
 Mon, 21 Jun 2021 09:59:02 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/37] s390x/tcg: Simplify vfma64() handling
Date: Mon, 21 Jun 2021 11:58:13 +0200
Message-Id: <20210621095842.335162-9-cohuck@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210608092337.12221-8-david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/helper.h           |  2 --
 target/s390x/translate_vx.c.inc |  8 +++----
 target/s390x/vec_fpu_helper.c   | 42 +++++++++++++--------------------
 3 files changed, 20 insertions(+), 32 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index e83268023635..3c8759355384 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -267,9 +267,7 @@ DEF_HELPER_FLAGS_4(gvec_vflr64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vflr64s, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfm64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_6(gvec_vfma64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
-DEF_HELPER_FLAGS_6(gvec_vfma64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_6(gvec_vfms64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
-DEF_HELPER_FLAGS_6(gvec_vfms64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfsq64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfs64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_4(gvec_vftci64, void, ptr, cptr, env, i32)
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index 1404471881ee..4b5bf0a7e3cb 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -2589,7 +2589,6 @@ static DisasJumpType op_vfma(DisasContext *s, DisasOps *o)
 {
     const uint8_t m5 = get_field(s, m5);
     const uint8_t fpf = get_field(s, m6);
-    const bool se = extract32(m5, 3, 1);
     gen_helper_gvec_4_ptr *fn;
 
     if (fpf != FPF_LONG || extract32(m5, 0, 3)) {
@@ -2598,13 +2597,12 @@ static DisasJumpType op_vfma(DisasContext *s, DisasOps *o)
     }
 
     if (s->fields.op2 == 0x8f) {
-        fn = se ? gen_helper_gvec_vfma64s : gen_helper_gvec_vfma64;
+        fn = gen_helper_gvec_vfma64;
     } else {
-        fn = se ? gen_helper_gvec_vfms64s : gen_helper_gvec_vfms64;
+        fn = gen_helper_gvec_vfms64;
     }
     gen_gvec_4_ptr(get_field(s, v1), get_field(s, v2),
-                   get_field(s, v3), get_field(s, v4), cpu_env,
-                   0, fn);
+                   get_field(s, v3), get_field(s, v4), cpu_env, m5, fn);
     return DISAS_NEXT;
 }
 
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index 2ced6fcfaf53..23b38df15886 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -374,12 +374,12 @@ static void vfma64(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
     int i;
 
     for (i = 0; i < 2; i++) {
-        const uint64_t a = s390_vec_read_element64(v2, i);
-        const uint64_t b = s390_vec_read_element64(v3, i);
-        const uint64_t c = s390_vec_read_element64(v4, i);
-        uint64_t ret = float64_muladd(a, b, c, flags, &env->fpu_status);
+        const float64 a = s390_vec_read_float64(v2, i);
+        const float64 b = s390_vec_read_float64(v3, i);
+        const float64 c = s390_vec_read_float64(v4, i);
+        const float64 ret = float64_muladd(a, b, c, flags, &env->fpu_status);
 
-        s390_vec_write_element64(&tmp, i, ret);
+        s390_vec_write_float64(&tmp, i, ret);
         vxc = check_ieee_exc(env, i, false, &vec_exc);
         if (s || vxc) {
             break;
@@ -389,29 +389,21 @@ static void vfma64(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
     *v1 = tmp;
 }
 
-void HELPER(gvec_vfma64)(void *v1, const void *v2, const void *v3,
-                         const void *v4, CPUS390XState *env, uint32_t desc)
-{
-    vfma64(v1, v2, v3, v4, env, false, 0, GETPC());
-}
-
-void HELPER(gvec_vfma64s)(void *v1, const void *v2, const void *v3,
-                         const void *v4, CPUS390XState *env, uint32_t desc)
-{
-    vfma64(v1, v2, v3, v4, env, true, 0, GETPC());
+#define DEF_GVEC_VFMA_B(NAME, FLAGS, BITS)                                     \
+void HELPER(gvec_##NAME##BITS)(void *v1, const void *v2, const void *v3,       \
+                               const void *v4, CPUS390XState *env,             \
+                               uint32_t desc)                                  \
+{                                                                              \
+    const bool se = extract32(simd_data(desc), 3, 1);                          \
+                                                                               \
+    vfma##BITS(v1, v2, v3, v4, env, se, FLAGS, GETPC());                       \
 }
 
-void HELPER(gvec_vfms64)(void *v1, const void *v2, const void *v3,
-                         const void *v4, CPUS390XState *env, uint32_t desc)
-{
-    vfma64(v1, v2, v3, v4, env, false, float_muladd_negate_c, GETPC());
-}
+#define DEF_GVEC_VFMA(NAME, FLAGS)                                             \
+    DEF_GVEC_VFMA_B(NAME, FLAGS, 64)
 
-void HELPER(gvec_vfms64s)(void *v1, const void *v2, const void *v3,
-                         const void *v4, CPUS390XState *env, uint32_t desc)
-{
-    vfma64(v1, v2, v3, v4, env, true, float_muladd_negate_c, GETPC());
-}
+DEF_GVEC_VFMA(vfma, 0)
+DEF_GVEC_VFMA(vfms, float_muladd_negate_c)
 
 void HELPER(gvec_vftci64)(void *v1, const void *v2, CPUS390XState *env,
                           uint32_t desc)
-- 
2.31.1


