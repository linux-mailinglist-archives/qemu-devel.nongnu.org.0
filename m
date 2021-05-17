Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C80D83830F1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 16:34:54 +0200 (CEST)
Received: from localhost ([::1]:40984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lieKb-0005Q6-NV
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 10:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lieET-0002ro-1Z
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:28:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lieER-0007Be-97
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621261710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PZisAVPRHQLT4GwzU2NVZWl57xzoAf6e+d3E+WsD6S8=;
 b=JGxWlef8/3jSEgFuN+uTgUM9PeQKVpIH4lxBAbmAACtMYgDCtjvFPgKkDAg8sj8yVCKryT
 FsWq8hZrq+wMWi6mAFbWB1qihuWqgV6iDLKZY08t90yw+IaiW9CR7usdXzvWxInJDVDGqF
 SRQjrosqThEvG6BBJ24oP8us7jfqFc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-QjsOIXm9NeG8ekGZAb36QQ-1; Mon, 17 May 2021 10:28:28 -0400
X-MC-Unique: QjsOIXm9NeG8ekGZAb36QQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C008C107ACE8;
 Mon, 17 May 2021 14:28:26 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-101.ams2.redhat.com [10.36.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB44E5DDAD;
 Mon, 17 May 2021 14:28:21 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/26] s390x/tcg: Simplify wfc64() handling
Date: Mon, 17 May 2021 16:27:23 +0200
Message-Id: <20210517142739.38597-11-david@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

... and prepare for 32/128 bit support.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/vec_fpu_helper.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index d07bc7cd64..219ef19d24 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -203,8 +203,8 @@ static int wfc64(const S390Vector *v1, const S390Vector *v2,
                  CPUS390XState *env, bool signal, uintptr_t retaddr)
 {
     /* only the zero-indexed elements are compared */
-    const float64 a = s390_vec_read_element64(v1, 0);
-    const float64 b = s390_vec_read_element64(v2, 0);
+    const float64 a = s390_vec_read_float64(v1, 0);
+    const float64 b = s390_vec_read_float64(v2, 0);
     uint8_t vxc, vec_exc = 0;
     int cmp;
 
@@ -219,17 +219,18 @@ static int wfc64(const S390Vector *v1, const S390Vector *v2,
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


