Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889F03AE6A9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:01:18 +0200 (CEST)
Received: from localhost ([::1]:44448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvGk1-0000MX-JH
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGho-0005dQ-Ga
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGhl-0006Vw-Ql
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+FojEP8+38cR3uqLE+OWEvTyAKwh7923C02+Ki0FdR8=;
 b=FQf0gDhgakFExVGDxealEQiWGiHMzEXWTESx9LsAMNKpYH1e8rq3zUVP/zoFIojpMkDhTS
 0inAV6yTK5s9w61WdSUxriYqqE22cIEwfD0Wak/S6VmNWvPDoJU+3RF6zqCKv1OUN5bFPi
 YSyggxK/I/qlzch8iMX1c+HUx8C8fmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-SPU6iDDPO5SnCtBppn3iyA-1; Mon, 21 Jun 2021 05:58:54 -0400
X-MC-Unique: SPU6iDDPO5SnCtBppn3iyA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD34B56AA1;
 Mon, 21 Jun 2021 09:58:53 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2A323AC1;
 Mon, 21 Jun 2021 09:58:48 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 02/37] s390x/tcg: Fix FP CONVERT TO (LOGICAL) FIXED NaN handling
Date: Mon, 21 Jun 2021 11:58:07 +0200
Message-Id: <20210621095842.335162-3-cohuck@redhat.com>
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

In case we encounter a NaN, we have to return the smallest possible
number, corresponding to either 0 or the maximum negative number. This
seems to differ from IEEE handling as implemented in softfloat, whereby
we return the biggest possible number.

While at it, use float32_to_uint64() in the CLGEB handler.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210608092337.12221-2-david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/fpu_helper.c     | 41 +++++++++++++++++++++++++++++++----
 target/s390x/vec_fpu_helper.c |  8 +++++--
 2 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/target/s390x/fpu_helper.c b/target/s390x/fpu_helper.c
index f155bc048c13..13af158748a9 100644
--- a/target/s390x/fpu_helper.c
+++ b/target/s390x/fpu_helper.c
@@ -509,6 +509,9 @@ uint64_t HELPER(cgeb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    if (float32_is_any_nan(v2)) {
+        return INT64_MIN;
+    }
     return ret;
 }
 
@@ -520,6 +523,9 @@ uint64_t HELPER(cgdb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    if (float64_is_any_nan(v2)) {
+        return INT64_MIN;
+    }
     return ret;
 }
 
@@ -532,6 +538,9 @@ uint64_t HELPER(cgxb)(CPUS390XState *env, uint64_t h, uint64_t l, uint32_t m34)
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    if (float128_is_any_nan(v2)) {
+        return INT64_MIN;
+    }
     return ret;
 }
 
@@ -543,6 +552,9 @@ uint64_t HELPER(cfeb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    if (float32_is_any_nan(v2)) {
+        return INT32_MIN;
+    }
     return ret;
 }
 
@@ -554,6 +566,9 @@ uint64_t HELPER(cfdb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    if (float64_is_any_nan(v2)) {
+        return INT32_MIN;
+    }
     return ret;
 }
 
@@ -566,6 +581,9 @@ uint64_t HELPER(cfxb)(CPUS390XState *env, uint64_t h, uint64_t l, uint32_t m34)
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    if (float128_is_any_nan(v2)) {
+        return INT32_MIN;
+    }
     return ret;
 }
 
@@ -573,12 +591,12 @@ uint64_t HELPER(cfxb)(CPUS390XState *env, uint64_t h, uint64_t l, uint32_t m34)
 uint64_t HELPER(clgeb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
-    uint64_t ret;
-
-    v2 = float32_to_float64(v2, &env->fpu_status);
-    ret = float64_to_uint64(v2, &env->fpu_status);
+    uint64_t ret = float32_to_uint64(v2, &env->fpu_status);
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    if (float32_is_any_nan(v2)) {
+        return 0;
+    }
     return ret;
 }
 
@@ -590,6 +608,9 @@ uint64_t HELPER(clgdb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    if (float64_is_any_nan(v2)) {
+        return 0;
+    }
     return ret;
 }
 
@@ -601,6 +622,9 @@ uint64_t HELPER(clgxb)(CPUS390XState *env, uint64_t h, uint64_t l, uint32_t m34)
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    if (float128_is_any_nan(make_float128(h, l))) {
+        return 0;
+    }
     return ret;
 }
 
@@ -612,6 +636,9 @@ uint64_t HELPER(clfeb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    if (float32_is_any_nan(v2)) {
+        return 0;
+    }
     return ret;
 }
 
@@ -623,6 +650,9 @@ uint64_t HELPER(clfdb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    if (float64_is_any_nan(v2)) {
+        return 0;
+    }
     return ret;
 }
 
@@ -634,6 +664,9 @@ uint64_t HELPER(clfxb)(CPUS390XState *env, uint64_t h, uint64_t l, uint32_t m34)
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
+    if (float128_is_any_nan(make_float128(h, l))) {
+        return 0;
+    }
     return ret;
 }
 
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index c1564e819b19..56765918d204 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -326,7 +326,9 @@ void HELPER(gvec_vcdlg64s)(void *v1, const void *v2, CPUS390XState *env,
 
 static uint64_t vcgd64(uint64_t a, float_status *s)
 {
-    return float64_to_int64(a, s);
+    const uint64_t tmp = float64_to_int64(a, s);
+
+    return float64_is_any_nan(a) ? INT64_MIN : tmp;
 }
 
 void HELPER(gvec_vcgd64)(void *v1, const void *v2, CPUS390XState *env,
@@ -349,7 +351,9 @@ void HELPER(gvec_vcgd64s)(void *v1, const void *v2, CPUS390XState *env,
 
 static uint64_t vclgd64(uint64_t a, float_status *s)
 {
-    return float64_to_uint64(a, s);
+    const uint64_t tmp = float64_to_uint64(a, s);
+
+    return float64_is_any_nan(a) ? 0 : tmp;
 }
 
 void HELPER(gvec_vclgd64)(void *v1, const void *v2, CPUS390XState *env,
-- 
2.31.1


