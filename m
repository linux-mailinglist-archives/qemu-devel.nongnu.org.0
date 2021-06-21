Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 495B73AE6D0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:11:28 +0200 (CEST)
Received: from localhost ([::1]:43130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvGtr-0001x0-9i
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGia-0007j9-Bj
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGiX-00074Q-AG
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/+dNX5eiERdCxcUk/2ulxcN562SM1IKd6QOo+PiDBmM=;
 b=UxsDXY9rsvZHBbzu6xav+c7XcD5YCO+Vt7Zmobuc2/4k7WPcgAMIkrcX2fOHkWBrgp9xNf
 RrRyv5kuHjyE5yiN4wTequcLHDdSo139VzMMe29l9q3k074jVj6TvRNO9p6vbxiN2CTQLJ
 0lGoAe3hXp5x2k12x+rkXaTLpptu664=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-YPMIY_bAPzKWMeMYRewwhA-1; Mon, 21 Jun 2021 05:59:42 -0400
X-MC-Unique: YPMIY_bAPzKWMeMYRewwhA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D293100C665;
 Mon, 21 Jun 2021 09:59:41 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 435065D740;
 Mon, 21 Jun 2021 09:59:40 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 23/37] s390x/tcg: Implement VECTOR FP NEGATIVE MULTIPLY AND
 (ADD|SUBTRACT)
Date: Mon, 21 Jun 2021 11:58:28 +0200
Message-Id: <20210621095842.335162-24-cohuck@redhat.com>
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210608092337.12221-23-david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/helper.h           |  6 +++++
 target/s390x/insn-data.def      |  4 ++++
 target/s390x/translate_vx.c.inc | 39 +++++++++++++++++++++++++++++++--
 target/s390x/vec_fpu_helper.c   |  2 ++
 4 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 236675606313..913967ce4e42 100644
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
index 1a3ae7e7e77d..19b02dffcac6 100644
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
index 17d41b178fc4..200d83e783d3 100644
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
index 29ccc608dc45..dc9bcc90a765 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -663,6 +663,8 @@ void HELPER(gvec_##NAME##BITS)(void *v1, const void *v2, const void *v3,       \
 
 DEF_GVEC_VFMA(vfma, 0)
 DEF_GVEC_VFMA(vfms, float_muladd_negate_c)
+DEF_GVEC_VFMA(vfnma, float_muladd_negate_result)
+DEF_GVEC_VFMA(vfnms, float_muladd_negate_c | float_muladd_negate_result)
 
 void HELPER(gvec_vftci32)(void *v1, const void *v2, CPUS390XState *env,
                           uint32_t desc)
-- 
2.31.1


