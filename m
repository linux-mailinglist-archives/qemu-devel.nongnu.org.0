Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E1A39F26C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:30:14 +0200 (CEST)
Received: from localhost ([::1]:58064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqY3o-0007C3-Pf
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqXxy-0001sj-1o
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:24:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqXxv-0008Oy-9q
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:24:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623144246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9eHwDhIQlY2zC34nPHmk2oGU8m0OZn+4XDCmQU6jaL4=;
 b=CcByZ6lpEXd3AZySqZ7uB/3mY1pff/53TvcKB+5cDt42idB46ablcSJIuAea2pzVIaJ2MI
 fcyWmYdD1Q/vA3s31IGFAYcs2jmW1Isj4nhDWKbhqXS3YbAaM7RYwmMPQnocQoPvtJ3QlX
 8uUaOzyz8zZBZ3MI76KQgGOxxE/Vlgs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-YOqVGobGNuqSfQDyH9LG8Q-1; Tue, 08 Jun 2021 05:24:03 -0400
X-MC-Unique: YOqVGobGNuqSfQDyH9LG8Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58AA0501E0;
 Tue,  8 Jun 2021 09:24:02 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-132.ams2.redhat.com [10.36.115.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFC955C1BB;
 Tue,  8 Jun 2021 09:23:56 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/26] s390x/tcg: Simplify vftci64() handling
Date: Tue,  8 Jun 2021 11:23:17 +0200
Message-Id: <20210608092337.12221-7-david@redhat.com>
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
 target/s390x/helper.h           |  1 -
 target/s390x/translate_vx.c.inc |  7 ++-----
 target/s390x/vec_fpu_helper.c   | 29 +++++++++++------------------
 3 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 02a16924a7..e832680236 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -273,7 +273,6 @@ DEF_HELPER_FLAGS_6(gvec_vfms64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, en
 DEF_HELPER_FLAGS_4(gvec_vfsq64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfs64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_4(gvec_vftci64, void, ptr, cptr, env, i32)
-DEF_HELPER_4(gvec_vftci64s, void, ptr, cptr, env, i32)
 
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_3(servc, i32, env, i64, i64)
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index 604ae11024..1404471881 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -2680,17 +2680,14 @@ static DisasJumpType op_vftci(DisasContext *s, DisasOps *o)
     const uint16_t i3 = get_field(s, i3);
     const uint8_t fpf = get_field(s, m4);
     const uint8_t m5 = get_field(s, m5);
-    gen_helper_gvec_2_ptr *fn = gen_helper_gvec_vftci64;
 
     if (fpf != FPF_LONG || extract32(m5, 0, 3)) {
         gen_program_exception(s, PGM_SPECIFICATION);
         return DISAS_NORETURN;
     }
 
-    if (extract32(m5, 3, 1)) {
-        fn = gen_helper_gvec_vftci64s;
-    }
-    gen_gvec_2_ptr(get_field(s, v1), get_field(s, v2), cpu_env, i3, fn);
+    gen_gvec_2_ptr(get_field(s, v1), get_field(s, v2), cpu_env,
+                   deposit32(m5, 4, 12, i3), gen_helper_gvec_vftci64);
     set_cc_static(s);
     return DISAS_NEXT;
 }
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index 01ee41d154..2ced6fcfaf 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -413,13 +413,15 @@ void HELPER(gvec_vfms64s)(void *v1, const void *v2, const void *v3,
     vfma64(v1, v2, v3, v4, env, true, float_muladd_negate_c, GETPC());
 }
 
-static int vftci64(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
-                   bool s, uint16_t i3)
+void HELPER(gvec_vftci64)(void *v1, const void *v2, CPUS390XState *env,
+                          uint32_t desc)
 {
+    const uint16_t i3 = extract32(simd_data(desc), 4, 12);
+    const bool s = extract32(simd_data(desc), 3, 1);
     int i, match = 0;
 
     for (i = 0; i < 2; i++) {
-        float64 a = s390_vec_read_element64(v2, i);
+        const float64 a = s390_vec_read_float64(v2, i);
 
         if (float64_dcmask(env, a) & i3) {
             match++;
@@ -432,20 +434,11 @@ static int vftci64(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
         }
     }
 
-    if (match) {
-        return s || match == 2 ? 0 : 1;
+    if (match == 2 || (s && match)) {
+        env->cc_op = 0;
+    } else if (match) {
+        env->cc_op = 1;
+    } else {
+        env->cc_op = 3;
     }
-    return 3;
-}
-
-void HELPER(gvec_vftci64)(void *v1, const void *v2, CPUS390XState *env,
-                          uint32_t desc)
-{
-    env->cc_op = vftci64(v1, v2, env, false, simd_data(desc));
-}
-
-void HELPER(gvec_vftci64s)(void *v1, const void *v2, CPUS390XState *env,
-                           uint32_t desc)
-{
-    env->cc_op = vftci64(v1, v2, env, true, simd_data(desc));
 }
-- 
2.31.1


