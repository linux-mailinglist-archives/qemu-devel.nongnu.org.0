Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8A43830E0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 16:33:40 +0200 (CEST)
Received: from localhost ([::1]:35688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lieJP-0001SE-1D
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 10:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lieDy-0001iU-K7
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:28:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lieDs-0006o1-K9
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:28:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621261676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QWQBPOUJPT29E5DptgdHoNgv+PgjP5dGMLjjFBOZ8OY=;
 b=Vsm+Mkv9gliLYCxG6sC6ltKsaNBwecJhEMyOwoD5lgCW8VjpRFXCtHej+EA/j4QdBEdG8S
 qpo+JemjyumvjF+jA7MD1Fd/DxROAL0I+omFj8rOGgOOsmJ3dgmDvViwv8cOEU2pqAlnvu
 7/PDxesF+klmceGo7+Rz5PNZXL4V7Ew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-LLjCnAKnMCiMkHLP0DBpmQ-1; Mon, 17 May 2021 10:27:52 -0400
X-MC-Unique: LLjCnAKnMCiMkHLP0DBpmQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6ECAE801817;
 Mon, 17 May 2021 14:27:51 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-101.ams2.redhat.com [10.36.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1BE05E273;
 Mon, 17 May 2021 14:27:48 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/26] s390x/tcg: Fix FP CONVERT TO (LOGICAL) FIXED NaN
 handling
Date: Mon, 17 May 2021 16:27:14 +0200
Message-Id: <20210517142739.38597-2-david@redhat.com>
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

In case we encounter a NaN, we have to return the smallest possible
number, corresponding to either 0 or the maximum negative number. This
seems to differ from IEEE handling as implemented in softfloat, whereby
we return the biggest possible number.

While at it, use float32_to_uint64() in the CLGEB handler.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/fpu_helper.c     | 41 +++++++++++++++++++++++++++++++----
 target/s390x/vec_fpu_helper.c |  6 +++++
 2 files changed, 43 insertions(+), 4 deletions(-)

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
index c1564e819b..d485837930 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -326,6 +326,9 @@ void HELPER(gvec_vcdlg64s)(void *v1, const void *v2, CPUS390XState *env,
 
 static uint64_t vcgd64(uint64_t a, float_status *s)
 {
+    if (float64_is_any_nan(a)) {
+        return INT64_MIN;
+    }
     return float64_to_int64(a, s);
 }
 
@@ -349,6 +352,9 @@ void HELPER(gvec_vcgd64s)(void *v1, const void *v2, CPUS390XState *env,
 
 static uint64_t vclgd64(uint64_t a, float_status *s)
 {
+    if (float64_is_any_nan(a)) {
+        return 0;
+    }
     return float64_to_uint64(a, s);
 }
 
-- 
2.31.1


