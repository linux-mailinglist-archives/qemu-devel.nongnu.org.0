Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3263AE6BF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:08:11 +0200 (CEST)
Received: from localhost ([::1]:33350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvGqg-0003fg-LX
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGhz-0005zL-7g
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGhv-0006dJ-Sg
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bH8iHRm0uP/s1zXv92UFM0vTAwlwhXuBbswetYXySfE=;
 b=ieYYYmh2sy1DpgSfkXNuIbsY4xaf0y0crlMwMCvmBLQm0VlbSipORo5fGiO36yS5mrAiqK
 AqIZCMwbAZWv93YmOoGImAhIoLctpxn0m2hsKx44GX2CvKWwiu9vM8o+71FH28hBSWoDEg
 /PBDeSvmCeGHRhRgYZMMERYdgf4Xzjs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-cFLlivmnN3CdZ6MJLGFpQQ-1; Mon, 21 Jun 2021 05:59:03 -0400
X-MC-Unique: cFLlivmnN3CdZ6MJLGFpQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F0AF100CEC2;
 Mon, 21 Jun 2021 09:59:02 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F03D63AC1;
 Mon, 21 Jun 2021 09:59:00 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/37] s390x/tcg: Simplify vftci64() handling
Date: Mon, 21 Jun 2021 11:58:12 +0200
Message-Id: <20210621095842.335162-8-cohuck@redhat.com>
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
Message-Id: <20210608092337.12221-7-david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/helper.h           |  1 -
 target/s390x/translate_vx.c.inc |  7 ++-----
 target/s390x/vec_fpu_helper.c   | 29 +++++++++++------------------
 3 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 02a16924a7b7..e83268023635 100644
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
index 604ae11024a9..1404471881ee 100644
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
index 01ee41d1543c..2ced6fcfaf53 100644
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


