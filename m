Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 790D639DACF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 13:11:00 +0200 (CEST)
Received: from localhost ([::1]:42220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqD9n-0005Qw-Hk
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 07:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD3m-0002cV-2t
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:04:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD3j-0004vd-Q8
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623063883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9tddF0J8Rfm4efgQEDn+k/6KS0S23rDMpPXDo3BXofA=;
 b=Z5ls6x4DauWrEYT+zF2wQKW62ESE8gkBz68gVLnlBrcm/deOoFZVvBMZm3PYgIhyRv1Q5q
 lyIWA1jFbVyGPJw/UNnYkeOw77U2LZ0SzjKUQ8+nNht8IT9/q4URjHtYC7CCQTrwVX1yyE
 oMhuDRtNLUzMNxAf8aeZR2xL4fbxG1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-FwHtU9okN9SuoKoYbXm9sg-1; Mon, 07 Jun 2021 07:04:41 -0400
X-MC-Unique: FwHtU9okN9SuoKoYbXm9sg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF661180FD89;
 Mon,  7 Jun 2021 11:04:40 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF2D560C17;
 Mon,  7 Jun 2021 11:04:31 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/26] s390x/tcg: Simplify wfc64() handling
Date: Mon,  7 Jun 2021 13:03:22 +0200
Message-Id: <20210607110338.31058-11-david@redhat.com>
In-Reply-To: <20210607110338.31058-1-david@redhat.com>
References: <20210607110338.31058-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

... and prepare for 32/128 bit support.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/vec_fpu_helper.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index 7ca9c892f7..4af59ea66c 100644
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


