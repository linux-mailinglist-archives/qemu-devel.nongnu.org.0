Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 643B939DB3D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 13:26:58 +0200 (CEST)
Received: from localhost ([::1]:57400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqDPF-00021p-CR
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 07:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD4r-0004kI-E3
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:05:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqD4k-0005jh-Go
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:05:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623063945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pj7EyD1EM9z/nfQC5oLYK9UBvviEhn6Xd26vykHrx4M=;
 b=K4J6IFMpMMGJr4v2n32yLbs1XJPbaGTxMqFMP9xaDEAJxRKQ54OAK0yuulKFkQDjI1pk/Y
 ANC+NOqysil6RdMO6xA6vG7hVCPQ5+65LaJ9WgtzdaJctRjVHOT6F5RlksmOHaknPett5Y
 UmjXalzjUsWRC+BHcDKwcvnVsskund4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-FNfW_68nP_SYSUoe-L1Hmw-1; Mon, 07 Jun 2021 07:05:44 -0400
X-MC-Unique: FNfW_68nP_SYSUoe-L1Hmw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34AEE107ACC7;
 Mon,  7 Jun 2021 11:05:43 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC17560C17;
 Mon,  7 Jun 2021 11:05:40 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/26] s390x/tcg: Implement VECTOR FP NEGATIVE MULTIPLY AND
 (ADD|SUBTRACT)
Date: Mon,  7 Jun 2021 13:03:34 +0200
Message-Id: <20210607110338.31058-23-david@redhat.com>
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
index 29ccc608dc..dc9bcc90a7 100644
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


