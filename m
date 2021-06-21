Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1BA3AE6D5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:14:51 +0200 (CEST)
Received: from localhost ([::1]:54062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvGx9-0000tR-10
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGiK-0007KS-SV
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGiJ-0006wb-05
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eeWFIxn/bO2v1IRqEpXZgNt/yG3U6MC5eXD19Cpz95Y=;
 b=CPTRplCRWsEx8bWzgSwSRMXFcjn4R+RRwY5ldTXOmhjmblvhkNWKrtnCOJSCOnGImrN3Fv
 8El83cGON/6Xr5EuSjgmJSRfZnJ2p5aGbsygmVpmWxO4lXHBBXQd0dTP+y7SI+1j/krk4h
 BXaP5EcnPfVMUruLfHxajVyQWJ455Mc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-z2iJEu8CPxqbETCrf_kaGQ-1; Mon, 21 Jun 2021 05:59:28 -0400
X-MC-Unique: z2iJEu8CPxqbETCrf_kaGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 516BF84F209;
 Mon, 21 Jun 2021 09:59:27 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBD695D740;
 Mon, 21 Jun 2021 09:59:25 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 18/37] s390x/tcg: Implement 64 bit for VECTOR FP LOAD LENGTHENED
Date: Mon, 21 Jun 2021 11:58:23 +0200
Message-Id: <20210621095842.335162-19-cohuck@redhat.com>
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

64 bit -> 128 bit, there is only a single final element.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210608092337.12221-18-david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/helper.h           |  1 +
 target/s390x/translate_vx.c.inc | 19 ++++++++++++++++---
 target/s390x/vec_fpu_helper.c   | 13 +++++++++++++
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index dca436f710cd..b5ba159402b2 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -285,6 +285,7 @@ DEF_HELPER_FLAGS_4(gvec_vfi32, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfi64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfi128, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfll32, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
+DEF_HELPER_FLAGS_4(gvec_vfll64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vflr64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfm32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfm64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index 822a9d05134b..472afca45e25 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -2781,14 +2781,27 @@ static DisasJumpType op_vfll(DisasContext *s, DisasOps *o)
 {
     const uint8_t fpf = get_field(s, m3);
     const uint8_t m4 = get_field(s, m4);
+    gen_helper_gvec_2_ptr *fn = NULL;
 
-    if (fpf != FPF_SHORT || extract32(m4, 0, 3)) {
+    switch (fpf) {
+    case FPF_SHORT:
+        fn = gen_helper_gvec_vfll32;
+        break;
+    case FPF_LONG:
+        if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+            fn = gen_helper_gvec_vfll64;
+        }
+        break;
+    default:
+        break;
+    }
+
+    if (!fn || extract32(m4, 0, 3)) {
         gen_program_exception(s, PGM_SPECIFICATION);
         return DISAS_NORETURN;
     }
 
-    gen_gvec_2_ptr(get_field(s, v1), get_field(s, v2), cpu_env,
-                   m4, gen_helper_gvec_vfll32);
+    gen_gvec_2_ptr(get_field(s, v1), get_field(s, v2), cpu_env, m4, fn);
     return DISAS_NEXT;
 }
 
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index fba5261ac4c1..75e3212582bc 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -522,6 +522,19 @@ void HELPER(gvec_vfll32)(void *v1, const void *v2, CPUS390XState *env,
     *(S390Vector *)v1 = tmp;
 }
 
+void HELPER(gvec_vfll64)(void *v1, const void *v2, CPUS390XState *env,
+                         uint32_t desc)
+{
+    /* load from even element */
+    const float128 ret = float64_to_float128(s390_vec_read_float64(v2, 0),
+                                             &env->fpu_status);
+    uint8_t vxc, vec_exc = 0;
+
+    vxc = check_ieee_exc(env, 0, false, &vec_exc);
+    handle_ieee_exc(env, vxc, vec_exc, GETPC());
+    s390_vec_write_float128(v1, ret);
+}
+
 void HELPER(gvec_vflr64)(void *v1, const void *v2, CPUS390XState *env,
                          uint32_t desc)
 {
-- 
2.31.1


