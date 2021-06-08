Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C7E39F2B4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:44:23 +0200 (CEST)
Received: from localhost ([::1]:40936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqYHX-0001Fu-1C
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqXyb-0003Gq-Kg
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:24:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqXyY-0000PK-Vm
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623144286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sQgVL41srT9ADk1DPB+7Z/OgjtluqwubZMT0ClnNj/E=;
 b=iofpJlBMS+VQshevQKVFROYwQ6rpUEnqDg7bFEKTeAmzPPrNUiWtizHkqUsVHkcx1I/XEE
 3pPqUv1VS54gpnuLk4yntETan6vlLjGBYeFmvD9SvI0hBFOToL0xBGt9uch7qqDM9h6SG+
 0AZYSM/z8yUUtVlwtTafKUJGIIPhrxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-ucOFEfPgMXSTFads--KIlQ-1; Tue, 08 Jun 2021 05:24:45 -0400
X-MC-Unique: ucOFEfPgMXSTFads--KIlQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C3FD501E1;
 Tue,  8 Jun 2021 09:24:44 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-132.ams2.redhat.com [10.36.115.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA04B5C1BB;
 Tue,  8 Jun 2021 09:24:38 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/26] s390x/tcg: Implement 32/128 bit for VECTOR FP TEST
 DATA CLASS IMMEDIATE
Date: Tue,  8 Jun 2021 11:23:31 +0200
Message-Id: <20210608092337.12221-21-david@redhat.com>
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index 0fb82bd18f..6984f770ff 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -622,6 +622,36 @@ void HELPER(gvec_##NAME##BITS)(void *v1, const void *v2, const void *v3,       \
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
@@ -651,3 +681,20 @@ void HELPER(gvec_vftci64)(void *v1, const void *v2, CPUS390XState *env,
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


