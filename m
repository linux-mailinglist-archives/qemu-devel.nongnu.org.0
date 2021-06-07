Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BF239DAED
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 13:16:27 +0200 (CEST)
Received: from localhost ([::1]:55666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqDF4-0006J4-99
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 07:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD3e-0002Or-6K
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:04:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD3c-0004q1-Bn
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:04:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623063875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=THL/1Vyw/NwkmJILc1RZ/0BTytUmDz/LTo8FVWiqfhE=;
 b=gXLK2fBAOSvaJjwgMMoGtQdVES8xAkrp5Arp/TsOR4rky2XcA/IlchN08TXdbZjjSAF9kn
 KwPmAnodfu0CEw84NlLazUZ4EvczsRh+kkt/au5aHNGh/CY8EoaeQpMnssyg4YUpENp0Bw
 4ym1qj2oW1U0awfy8sbB9c+RQqNCA/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-Inp3AWP2Mja68v_TGEJdRA-1; Mon, 07 Jun 2021 07:04:32 -0400
X-MC-Unique: Inp3AWP2Mja68v_TGEJdRA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82B99106BAA8;
 Mon,  7 Jun 2021 11:04:31 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E30760C17;
 Mon,  7 Jun 2021 11:04:26 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/26] s390x/tcg: Simplify vflr64() handling
Date: Mon,  7 Jun 2021 13:03:21 +0200
Message-Id: <20210607110338.31058-10-david@redhat.com>
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           |  1 -
 target/s390x/translate_vx.c.inc |  3 +--
 target/s390x/vec_fpu_helper.c   | 29 +++++++----------------------
 3 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 63039c8d73..0cfb82ee8a 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -263,7 +263,6 @@ DEF_HELPER_FLAGS_5(gvec_vfd64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfi64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfll32, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vflr64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
-DEF_HELPER_FLAGS_4(gvec_vflr64s, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfm64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_6(gvec_vfma64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_6(gvec_vfms64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index 5ff59984b5..91e2967c49 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -2531,7 +2531,6 @@ static DisasJumpType op_vcdg(DisasContext *s, DisasOps *o)
     const uint8_t fpf = get_field(s, m3);
     const uint8_t m4 = get_field(s, m4);
     const uint8_t erm = get_field(s, m5);
-    const bool se = extract32(m4, 3, 1);
     gen_helper_gvec_2_ptr *fn;
 
     if (fpf != FPF_LONG || extract32(m4, 0, 2) || erm > 7 || erm == 2) {
@@ -2556,7 +2555,7 @@ static DisasJumpType op_vcdg(DisasContext *s, DisasOps *o)
         fn = gen_helper_gvec_vfi64;
         break;
     case 0xc5:
-        fn = se ? gen_helper_gvec_vflr64s : gen_helper_gvec_vflr64;
+        fn = gen_helper_gvec_vflr64;
         break;
     default:
         g_assert_not_reached();
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index 7bd3e44acc..7ca9c892f7 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -311,9 +311,12 @@ void HELPER(gvec_vfll32)(void *v1, const void *v2, CPUS390XState *env,
     *(S390Vector *)v1 = tmp;
 }
 
-static void vflr64(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
-                   bool s, bool XxC, uint8_t erm, uintptr_t retaddr)
+void HELPER(gvec_vflr64)(void *v1, const void *v2, CPUS390XState *env,
+                         uint32_t desc)
 {
+    const uint8_t erm = extract32(simd_data(desc), 4, 4);
+    const bool s = extract32(simd_data(desc), 3, 1);
+    const bool XxC = extract32(simd_data(desc), 2, 1);
     uint8_t vxc, vec_exc = 0;
     S390Vector tmp = {};
     int i, old_mode;
@@ -332,26 +335,8 @@ static void vflr64(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
         }
     }
     s390_restore_bfp_rounding_mode(env, old_mode);
-    handle_ieee_exc(env, vxc, vec_exc, retaddr);
-    *v1 = tmp;
-}
-
-void HELPER(gvec_vflr64)(void *v1, const void *v2, CPUS390XState *env,
-                         uint32_t desc)
-{
-    const uint8_t erm = extract32(simd_data(desc), 4, 4);
-    const bool XxC = extract32(simd_data(desc), 2, 1);
-
-    vflr64(v1, v2, env, false, XxC, erm, GETPC());
-}
-
-void HELPER(gvec_vflr64s)(void *v1, const void *v2, CPUS390XState *env,
-                          uint32_t desc)
-{
-    const uint8_t erm = extract32(simd_data(desc), 4, 4);
-    const bool XxC = extract32(simd_data(desc), 2, 1);
-
-    vflr64(v1, v2, env, true, XxC, erm, GETPC());
+    handle_ieee_exc(env, vxc, vec_exc, GETPC());
+    *(S390Vector *)v1 = tmp;
 }
 
 static void vfma64(S390Vector *v1, const S390Vector *v2, const S390Vector *v3,
-- 
2.31.1


