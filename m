Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B161F39F23A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:25:53 +0200 (CEST)
Received: from localhost ([::1]:40592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqXzc-00041L-Dz
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqXxf-0001Kc-Qe
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:23:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqXxd-0008EK-O6
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:23:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623144229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qQMTPFWWsnoB2ar9MHa47hPH/5YHOixc7tz6Cyk6NcE=;
 b=OmnDkeRWo8+Iknfe27JGNu1cSt6/R5Ooj4h8DjMMqUG4GySSUNW9j6mlGvp2eh9azhicP6
 UjLJBuRSsqa51lp6fn4hRWzmKAWcQ3W3O49boLFSQOuumP6tsYhuE45mMsjEIzf7VlglBr
 x/3+m1lYOQpn8v7W/x2NubX7BZP09p0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-dqQuZRRtOM6NNlLCJclRxQ-1; Tue, 08 Jun 2021 05:23:47 -0400
X-MC-Unique: dqQuZRRtOM6NNlLCJclRxQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 703081020C33;
 Tue,  8 Jun 2021 09:23:46 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-132.ams2.redhat.com [10.36.115.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C7575C1BB;
 Tue,  8 Jun 2021 09:23:43 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/26] s390x/tcg: Fix FP CONVERT TO (LOGICAL) FIXED NaN
 handling
Date: Tue,  8 Jun 2021 11:23:12 +0200
Message-Id: <20210608092337.12221-2-david@redhat.com>
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

In case we encounter a NaN, we have to return the smallest possible
number, corresponding to either 0 or the maximum negative number. This
seems to differ from IEEE handling as implemented in softfloat, whereby
we return the biggest possible number.

While at it, use float32_to_uint64() in the CLGEB handler.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/fpu_helper.c     | 41 +++++++++++++++++++++++++++++++----
 target/s390x/vec_fpu_helper.c |  8 +++++--
 2 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/target/s390x/fpu_helper.c b/target/s390x/fpu_helper.c
index f155bc048c..13af158748 100644
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
index c1564e819b..56765918d2 100644
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


