Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6983AE6CD
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:11:17 +0200 (CEST)
Received: from localhost ([::1]:42092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvGtg-0001FL-Hd
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGi1-000690-Ml
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGhy-0006eY-Kl
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eJJerhSgJwvy7vRBs/82WUY0gLsMHr8Z2nxMwl+bzZE=;
 b=dQEkMK1AgAHRD+WA7oTYmPrypYOk6OA972b9fVCI95o1RUY2KLBgCJxK6J2N4Acyj7Jz3f
 y2dqHNZJNE2+GxIBrWpYRS/qJ1OTpN5Ct7peK6DICY6RUtZLPYQz4tfD/WFVbEioZ5XYoS
 McpQDp9v9WERE+XEXH8xuodyhWdqBU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-gNlhmnykPm2Lfsab4MKBFw-1; Mon, 21 Jun 2021 05:59:06 -0400
X-MC-Unique: gNlhmnykPm2Lfsab4MKBFw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1CD2100CEC0;
 Mon, 21 Jun 2021 09:59:05 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4995E3AC1;
 Mon, 21 Jun 2021 09:59:04 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 09/37] s390x/tcg: Simplify vfll32() handling
Date: Mon, 21 Jun 2021 11:58:14 +0200
Message-Id: <20210621095842.335162-10-cohuck@redhat.com>
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210608092337.12221-9-david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/helper.h           |  1 -
 target/s390x/translate_vx.c.inc |  6 +-----
 target/s390x/vec_fpu_helper.c   | 21 +++++----------------
 3 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 3c8759355384..63039c8d7356 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -262,7 +262,6 @@ DEF_HELPER_FLAGS_4(gvec_vclgd64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfd64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfi64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfll32, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
-DEF_HELPER_FLAGS_4(gvec_vfll32s, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vflr64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vflr64s, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfm64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index 4b5bf0a7e3cb..5ff59984b517 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -2570,18 +2570,14 @@ static DisasJumpType op_vfll(DisasContext *s, DisasOps *o)
 {
     const uint8_t fpf = get_field(s, m3);
     const uint8_t m4 = get_field(s, m4);
-    gen_helper_gvec_2_ptr *fn = gen_helper_gvec_vfll32;
 
     if (fpf != FPF_SHORT || extract32(m4, 0, 3)) {
         gen_program_exception(s, PGM_SPECIFICATION);
         return DISAS_NORETURN;
     }
 
-    if (extract32(m4, 3, 1)) {
-        fn = gen_helper_gvec_vfll32s;
-    }
     gen_gvec_2_ptr(get_field(s, v1), get_field(s, v2), cpu_env,
-                   0, fn);
+                   m4, gen_helper_gvec_vfll32);
     return DISAS_NEXT;
 }
 
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index 23b38df15886..7bd3e44accc2 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -287,9 +287,10 @@ DEF_GVEC_VFC(vfce, eq)
 DEF_GVEC_VFC(vfch, lt)
 DEF_GVEC_VFC(vfche, le)
 
-static void vfll32(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
-                   bool s, uintptr_t retaddr)
+void HELPER(gvec_vfll32)(void *v1, const void *v2, CPUS390XState *env,
+                         uint32_t desc)
 {
+    const bool s = extract32(simd_data(desc), 3, 1);
     uint8_t vxc, vec_exc = 0;
     S390Vector tmp = {};
     int i;
@@ -306,20 +307,8 @@ static void vfll32(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
             break;
         }
     }
-    handle_ieee_exc(env, vxc, vec_exc, retaddr);
-    *v1 = tmp;
-}
-
-void HELPER(gvec_vfll32)(void *v1, const void *v2, CPUS390XState *env,
-                         uint32_t desc)
-{
-    vfll32(v1, v2, env, false, GETPC());
-}
-
-void HELPER(gvec_vfll32s)(void *v1, const void *v2, CPUS390XState *env,
-                          uint32_t desc)
-{
-    vfll32(v1, v2, env, true, GETPC());
+    handle_ieee_exc(env, vxc, vec_exc, GETPC());
+    *(S390Vector *)v1 = tmp;
 }
 
 static void vflr64(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
-- 
2.31.1


