Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E26923AE6E1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:18:21 +0200 (CEST)
Received: from localhost ([::1]:34286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvH0W-0006g7-Rk
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGiQ-0007cf-2z
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGiO-000700-56
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2/mW2JXTwLC/xfeCzZzWJkdlI8BHHurrZ49zx+kv9Y=;
 b=O9sgTZYmEWWe4mQmU9CmmPlUwRID0PXLdHiXJwL0OBbHuY9CRUw4RhzjdO1bQHH4tFq4AB
 JfbtDxuKWX7IFK5sFLzMDnEBVr8h3JY882Vo528kPbzi1lCS/N/j8Pg91aUv2uluGkFfek
 HIfEqaYQ902BQ2tvHTHFPbixENH3yuI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-rdIOWojBNb6MgM8jilS29g-1; Mon, 21 Jun 2021 05:59:33 -0400
X-MC-Unique: rdIOWojBNb6MgM8jilS29g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5892980430F;
 Mon, 21 Jun 2021 09:59:32 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE72F5D740;
 Mon, 21 Jun 2021 09:59:27 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 19/37] s390x/tcg: Implement 128 bit for VECTOR FP LOAD ROUNDED
Date: Mon, 21 Jun 2021 11:58:24 +0200
Message-Id: <20210621095842.335162-20-cohuck@redhat.com>
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

128 bit -> 64 bit, there is only a single element to process.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210608092337.12221-19-david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/helper.h           |  1 +
 target/s390x/translate_vx.c.inc | 11 ++++++++++-
 target/s390x/vec_fpu_helper.c   | 19 +++++++++++++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index b5ba159402b2..02e6967ae6b5 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -287,6 +287,7 @@ DEF_HELPER_FLAGS_4(gvec_vfi128, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfll32, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfll64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vflr64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
+DEF_HELPER_FLAGS_4(gvec_vflr128, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfm32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfm64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfm128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index 472afca45e25..e94c9f9d86d5 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -2759,8 +2759,17 @@ static DisasJumpType op_vcdg(DisasContext *s, DisasOps *o)
         }
         break;
     case 0xc5:
-        if (fpf == FPF_LONG) {
+        switch (fpf) {
+        case FPF_LONG:
             fn = gen_helper_gvec_vflr64;
+            break;
+        case FPF_EXT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
+                fn = gen_helper_gvec_vflr128;
+            }
+            break;
+        default:
+            break;
         }
         break;
     default:
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index 75e3212582bc..0fb82bd18f46 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -563,6 +563,25 @@ void HELPER(gvec_vflr64)(void *v1, const void *v2, CPUS390XState *env,
     *(S390Vector *)v1 = tmp;
 }
 
+void HELPER(gvec_vflr128)(void *v1, const void *v2, CPUS390XState *env,
+                          uint32_t desc)
+{
+    const uint8_t erm = extract32(simd_data(desc), 4, 4);
+    const bool XxC = extract32(simd_data(desc), 2, 1);
+    uint8_t vxc, vec_exc = 0;
+    int old_mode;
+    float64 ret;
+
+    old_mode = s390_swap_bfp_rounding_mode(env, erm);
+    ret = float128_to_float64(s390_vec_read_float128(v2), &env->fpu_status);
+    vxc = check_ieee_exc(env, 0, XxC, &vec_exc);
+    s390_restore_bfp_rounding_mode(env, old_mode);
+    handle_ieee_exc(env, vxc, vec_exc, GETPC());
+
+    /* place at even element, odd element is unpredictable */
+    s390_vec_write_float64(v1, 0, ret);
+}
+
 static void vfma64(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
                    const S390Vector *v4, CPUS390XState *env, bool s, int flags,
                    uintptr_t retaddr)
-- 
2.31.1


