Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FD03AE701
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:24:59 +0200 (CEST)
Received: from localhost ([::1]:51712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvH6w-0001Zz-57
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGiY-0007iO-CZ
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGiV-00074A-Te
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/lQ7ctciddwj85F6+nzoHW7scr3g9AT+RwqJ4ajdne0=;
 b=Wti/M9raQ6pRmq+VJf1tzb55Tk4PBNHFu+w+GVGg41tH0Tl+nX147cAD5TDr2aodVyx067
 +VaE1vXlrYH3/Wf+qljW57nawisxrxweuIVr3aBfh65Acs4ZWMfaH4XcZ3tT20OrFAkiTL
 BeZHdP6GcBfasu4ZEUWUBsvhYHhDCts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-B8Cpn_dONo6okcFXiegWYA-1; Mon, 21 Jun 2021 05:59:40 -0400
X-MC-Unique: B8Cpn_dONo6okcFXiegWYA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAA8B100CEC2;
 Mon, 21 Jun 2021 09:59:39 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 902483AB2;
 Mon, 21 Jun 2021 09:59:38 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 22/37] s390x/tcg: Implement 32/128 bit for VECTOR FP MULTIPLY
 AND (ADD|SUBTRACT)
Date: Mon, 21 Jun 2021 11:58:27 +0200
Message-Id: <20210621095842.335162-23-cohuck@redhat.com>
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210608092337.12221-22-david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/helper.h           |  4 +++
 target/s390x/translate_vx.c.inc | 47 ++++++++++++++++++++++++++++-----
 target/s390x/vec_fpu_helper.c   | 44 +++++++++++++++++++++++++++++-
 3 files changed, 87 insertions(+), 8 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index bae73b9a5677..236675606313 100644
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
index 765f75df9c6f..17d41b178fc4 100644
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
index 6984f770ff01..29ccc608dc45 100644
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


