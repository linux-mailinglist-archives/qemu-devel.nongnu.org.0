Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251183AE6DB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:17:24 +0200 (CEST)
Received: from localhost ([::1]:59322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvGzb-0004SA-4k
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGi5-0006Nl-Ev
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGi2-0006he-IM
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l+5Pqbpra3gNZM9X5C1Obmh15GT4qpZBZB8O/SVvBtg=;
 b=ZqIAs6laFE+AMztNPpc0gA1/R8djaM8omsUxHC0Q2ansRinzdoNxcSlN/+Z9y9h3EJjHUn
 DP12ZTBFugSskR2SzrJcfIK0b2BqwaV8vsyskZbaSAefYwnhPfqLhDQgLBiNEohdf0p9E3
 zK23KBM3jTka9zZ0iuhQzS9SW2uWg1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-pLSLxbySMnCL_dimjNhKiw-1; Mon, 21 Jun 2021 05:59:10 -0400
X-MC-Unique: pLSLxbySMnCL_dimjNhKiw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05EC056B29;
 Mon, 21 Jun 2021 09:59:09 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0B443AC1;
 Mon, 21 Jun 2021 09:59:07 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 11/37] s390x/tcg: Simplify wfc64() handling
Date: Mon, 21 Jun 2021 11:58:16 +0200
Message-Id: <20210621095842.335162-12-cohuck@redhat.com>
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

... and prepare for 32/128 bit support.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210608092337.12221-11-david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/vec_fpu_helper.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index 7ca9c892f7e7..4af59ea66c7b 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -201,8 +201,8 @@ static int wfc64(const S390Vector *v1, const S390Vector *v2,
                  CPUS390XState *env, bool signal, uintptr_t retaddr)
 {
     /* only the zero-indexed elements are compared */
-    const float64 a = s390_vec_read_element64(v1, 0);
-    const float64 b = s390_vec_read_element64(v2, 0);
+    const float64 a = s390_vec_read_float64(v1, 0);
+    const float64 b = s390_vec_read_float64(v2, 0);
     uint8_t vxc, vec_exc = 0;
     int cmp;
 
@@ -217,17 +217,18 @@ static int wfc64(const S390Vector *v1, const S390Vector *v2,
     return float_comp_to_cc(env, cmp);
 }
 
-void HELPER(gvec_wfc64)(const void *v1, const void *v2, CPUS390XState *env,
-                        uint32_t desc)
-{
-    env->cc_op = wfc64(v1, v2, env, false, GETPC());
+#define DEF_GVEC_WFC_B(NAME, SIGNAL, BITS)                                     \
+void HELPER(gvec_##NAME##BITS)(const void *v1, const void *v2,                 \
+                               CPUS390XState *env, uint32_t desc)              \
+{                                                                              \
+    env->cc_op = wfc##BITS(v1, v2, env, SIGNAL, GETPC());                      \
 }
 
-void HELPER(gvec_wfk64)(const void *v1, const void *v2, CPUS390XState *env,
-                        uint32_t desc)
-{
-    env->cc_op = wfc64(v1, v2, env, true, GETPC());
-}
+#define DEF_GVEC_WFC(NAME, SIGNAL)                                             \
+     DEF_GVEC_WFC_B(NAME, SIGNAL, 64)
+
+DEF_GVEC_WFC(wfc, false)
+DEF_GVEC_WFC(wfk, true)
 
 typedef bool (*vfc64_fn)(float64 a, float64 b, float_status *status);
 static int vfc64(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
-- 
2.31.1


