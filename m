Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8533839DAAB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 13:08:17 +0200 (CEST)
Received: from localhost ([::1]:34126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqD7A-0008Lh-KH
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 07:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD3Y-0002Fc-PM
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:04:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD3W-0004kb-UK
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:04:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623063870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ll5FNsn4eFzOO+6LpGReqloEW78PHFkzzH/wnUanfwY=;
 b=D3Jcxo278GQwcRLT9quASySlyzBlvQ9BWT0563K0dX93xydZKg40pmy4uBX8MD/yW34bhi
 rhItys61qMLsGR0HLoJWqFaF1mt13+tFyOqFu0G+uU0TxIG97BfCWSxn+JzafLK/F3swNQ
 V/dRRV6nt5n4MzT+Nye5vQBuYXZlQFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-ObXJiK-YNVS86io0FkbLJg-1; Mon, 07 Jun 2021 07:04:27 -0400
X-MC-Unique: ObXJiK-YNVS86io0FkbLJg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F33A8801106;
 Mon,  7 Jun 2021 11:04:25 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0D8960C17;
 Mon,  7 Jun 2021 11:04:23 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/26] s390x/tcg: Simplify vfll32() handling
Date: Mon,  7 Jun 2021 13:03:20 +0200
Message-Id: <20210607110338.31058-9-david@redhat.com>
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
 target/s390x/translate_vx.c.inc |  6 +-----
 target/s390x/vec_fpu_helper.c   | 21 +++++----------------
 3 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 3c87593553..63039c8d73 100644
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
index 4b5bf0a7e3..5ff59984b5 100644
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
index 23b38df158..7bd3e44acc 100644
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


