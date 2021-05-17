Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77367383226
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 16:49:03 +0200 (CEST)
Received: from localhost ([::1]:58348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lieYI-0004Mu-JD
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 10:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lieGa-0006kG-J7
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:30:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lieGR-0008Rk-QJ
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621261833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GQNMc7ETsEfeI2G8ZLU/vcnxv3IPjb+7VEgbNyN9Vcw=;
 b=GEc6BOZJxyM+cvVDdaZ0/xbwKMmCWHlKn0Ybwpz+0cLeGu9evw+wSRoq73/wZR6WdSjlal
 WdU7Tt4wEEw7sD9UXmTc0L8Qaqg9mv6V691xr3dij/3Upa+7mYXcfv7Dju7ND304Fb7hJL
 ELKhptnUujUAC0JHy49iSG5/HWvwcIA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-83YlYmx8Psu243ZfuxpDBQ-1; Mon, 17 May 2021 10:30:31 -0400
X-MC-Unique: 83YlYmx8Psu243ZfuxpDBQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77F1A19253EC;
 Mon, 17 May 2021 14:30:29 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-101.ams2.redhat.com [10.36.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8B825E278;
 Mon, 17 May 2021 14:30:03 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/26] s390x/tcg: Implement VECTOR FP NEGATIVE MULTIPLY AND
 (ADD|SUBTRACT)
Date: Mon, 17 May 2021 16:27:35 +0200
Message-Id: <20210517142739.38597-23-david@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
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

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           |  6 +++++
 target/s390x/insn-data.def      |  4 ++++
 target/s390x/translate_vx.c.inc | 39 +++++++++++++++++++++++++++++++--
 target/s390x/vec_fpu_helper.c   |  2 ++
 4 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 2366756063..913967ce4e 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -297,6 +297,12 @@ DEF_HELPER_FLAGS_6(gvec_vfma128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, en
 DEF_HELPER_FLAGS_6(gvec_vfms32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_6(gvec_vfms64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_6(gvec_vfms128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_6(gvec_vfnma32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_6(gvec_vfnma64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_6(gvec_vfnma128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_6(gvec_vfnms32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_6(gvec_vfnms64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_6(gvec_vfnms128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfsq32, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfsq64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfsq128, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 1a3ae7e7e7..19b02dffca 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1259,6 +1259,10 @@
     F(0xe78f, VFMA,    VRR_e, V,   0, 0, 0, 0, vfma, 0, IF_VEC)
 /* VECTOR FP MULTIPLY AND SUBTRACT */
     F(0xe78e, VFMS,    VRR_e, V,   0, 0, 0, 0, vfma, 0, IF_VEC)
+/* VECTOR FP NEGATIVE MULTIPLY AND ADD */
+    F(0xe79f, VFNMA,   VRR_e, VE,  0, 0, 0, 0, vfma, 0, IF_VEC)
+/* VECTOR FP NEGATIVE MULTIPLY AND SUBTRACT */
+    F(0xe79e, VFNMS,   VRR_e, VE,   0, 0, 0, 0, vfma, 0, IF_VEC)
 /* VECTOR FP PERFORM SIGN OPERATION */
     F(0xe7cc, VFPSO,   VRR_a, V,   0, 0, 0, 0, vfpso, 0, IF_VEC)
 /* VECTOR FP SQUARE ROOT */
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/translate_vx.c.inc
index 17d41b178f..200d83e783 100644
--- a/target/s390x/translate_vx.c.inc
+++ b/target/s390x/translate_vx.c.inc
@@ -2820,7 +2820,8 @@ static DisasJumpType op_vfma(DisasContext *s, DisasOps *o)
     const uint8_t fpf = get_field(s, m6);
     gen_helper_gvec_4_ptr *fn = NULL;
 
-    if (s->fields.op2 == 0x8f) {
+    switch (s->fields.op2) {
+    case 0x8f:
         switch (fpf) {
         case FPF_SHORT:
             if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
@@ -2838,7 +2839,8 @@ static DisasJumpType op_vfma(DisasContext *s, DisasOps *o)
         default:
             break;
         }
-    } else {
+        break;
+    case 0x8e:
         switch (fpf) {
         case FPF_SHORT:
             if (s390_has_feat(S390_FEAT_VECTOR_ENH)) {
@@ -2856,6 +2858,39 @@ static DisasJumpType op_vfma(DisasContext *s, DisasOps *o)
         default:
             break;
         }
+        break;
+    case 0x9f:
+        switch (fpf) {
+        case FPF_SHORT:
+            fn = gen_helper_gvec_vfnma32;
+            break;
+        case FPF_LONG:
+            fn = gen_helper_gvec_vfnma64;
+            break;
+        case FPF_EXT:
+            fn = gen_helper_gvec_vfnma128;
+            break;
+        default:
+            break;
+        }
+        break;
+    case 0x9e:
+        switch (fpf) {
+        case FPF_SHORT:
+            fn = gen_helper_gvec_vfnms32;
+            break;
+        case FPF_LONG:
+            fn = gen_helper_gvec_vfnms64;
+            break;
+        case FPF_EXT:
+            fn = gen_helper_gvec_vfnms128;
+            break;
+        default:
+            break;
+        }
+        break;
+    default:
+        g_assert_not_reached();
     }
 
     if (!fn || extract32(m5, 0, 3)) {
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.c
index 966b1dbf50..f6090f7d61 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -665,6 +665,8 @@ void HELPER(gvec_##NAME##BITS)(void *v1, const void *v2, const void *v3,       \
 
 DEF_GVEC_VFMA(vfma, 0)
 DEF_GVEC_VFMA(vfms, float_muladd_negate_c)
+DEF_GVEC_VFMA(vfnma, float_muladd_negate_result)
+DEF_GVEC_VFMA(vfnms, float_muladd_negate_c | float_muladd_negate_result)
 
 void HELPER(gvec_vftci32)(void *v1, const void *v2, CPUS390XState *env,
                           uint32_t desc)
-- 
2.31.1


