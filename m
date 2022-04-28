Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82F9513096
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 12:02:56 +0200 (CEST)
Received: from localhost ([::1]:60836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk0z9-0000vZ-Og
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 06:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nk0kG-00037s-Eo
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:47:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nk0kE-0008IE-M3
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:47:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651139250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f9lnaWJBL0W2ysn/G6WXWCQKo19TCgH6IE3dEx6jeC4=;
 b=XVA8OP/ermKvKnEJmc4WzIiBKamWgpejXzOXIOv3GAt1Di+8Z+DDY4+KmQDNATeUwpgX/b
 15m5GGW5jvwdHDEM+BNkcsAAIAA/dbP+Qx1O0edvd0Hffa+HzSoezBlcg5Fvr/cNTvSYdH
 RvK0/dgXA4ZiwN35H5IShsDBPT1Zx/E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-vi2yI9PiNOuINKWVu2BiqQ-1; Thu, 28 Apr 2022 05:47:24 -0400
X-MC-Unique: vi2yI9PiNOuINKWVu2BiqQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 458FE1C08543;
 Thu, 28 Apr 2022 09:47:24 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15F0740CFD16;
 Thu, 28 Apr 2022 09:47:21 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 05/13] target/s390x: vxeh2: vector convert short/32b
Date: Thu, 28 Apr 2022 11:47:00 +0200
Message-Id: <20220428094708.84835-6-david@redhat.com>
In-Reply-To: <20220428094708.84835-1-david@redhat.com>
References: <20220428094708.84835-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Eric Farman <farman@linux.ibm.com>, David Miller <dmiller423@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Miller <dmiller423@gmail.com>

Signed-off-by: David Miller <dmiller423@gmail.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h               |  4 +++
 target/s390x/tcg/translate_vx.c.inc | 44 ++++++++++++++++++++++++++---
 target/s390x/tcg/vec_fpu_helper.c   | 31 ++++++++++++++++++++
 3 files changed, 75 insertions(+), 4 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 69f69cf718..7cbcbd7f0b 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -275,6 +275,10 @@ DEF_HELPER_FLAGS_5(gvec_vfche64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32
 DEF_HELPER_5(gvec_vfche64_cc, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfche128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_5(gvec_vfche128_cc, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_4(gvec_vcdg32, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
+DEF_HELPER_FLAGS_4(gvec_vcdlg32, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
+DEF_HELPER_FLAGS_4(gvec_vcgd32, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
+DEF_HELPER_FLAGS_4(gvec_vclgd32, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vcdg64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vcdlg64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vcgd64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index b829ce0c7c..be9407d1ed 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -2720,23 +2720,59 @@ static DisasJumpType op_vcdg(DisasContext *s, DisasOps *o)
 
     switch (s->fields.op2) {
     case 0xc3:
-        if (fpf == FPF_LONG) {
+        switch (fpf) {
+        case FPF_LONG:
             fn = gen_helper_gvec_vcdg64;
+            break;
+        case FPF_SHORT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH2)) {
+                fn = gen_helper_gvec_vcdg32;
+            }
+            break;
+        default:
+            break;
         }
         break;
     case 0xc1:
-        if (fpf == FPF_LONG) {
+        switch (fpf) {
+        case FPF_LONG:
             fn = gen_helper_gvec_vcdlg64;
+            break;
+        case FPF_SHORT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH2)) {
+                fn = gen_helper_gvec_vcdlg32;
+            }
+            break;
+        default:
+            break;
         }
         break;
     case 0xc2:
-        if (fpf == FPF_LONG) {
+        switch (fpf) {
+        case FPF_LONG:
             fn = gen_helper_gvec_vcgd64;
+            break;
+        case FPF_SHORT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH2)) {
+                fn = gen_helper_gvec_vcgd32;
+            }
+            break;
+        default:
+            break;
         }
         break;
     case 0xc0:
-        if (fpf == FPF_LONG) {
+        switch (fpf) {
+        case FPF_LONG:
             fn = gen_helper_gvec_vclgd64;
+            break;
+        case FPF_SHORT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH2)) {
+                fn = gen_helper_gvec_vclgd32;
+            }
+            break;
+        default:
+            break;
         }
         break;
     case 0xc7:
diff --git a/target/s390x/tcg/vec_fpu_helper.c b/target/s390x/tcg/vec_fpu_helper.c
index aa2cc8e4a6..2a618a1093 100644
--- a/target/s390x/tcg/vec_fpu_helper.c
+++ b/target/s390x/tcg/vec_fpu_helper.c
@@ -175,6 +175,30 @@ static void vop128_2(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
     *v1 = tmp;
 }
 
+static float32 vcdg32(float32 a, float_status *s)
+{
+    return int32_to_float32(a, s);
+}
+
+static float32 vcdlg32(float32 a, float_status *s)
+{
+    return uint32_to_float32(a, s);
+}
+
+static float32 vcgd32(float32 a, float_status *s)
+{
+    const float32 tmp = float32_to_int32(a, s);
+
+    return float32_is_any_nan(a) ? INT32_MIN : tmp;
+}
+
+static float32 vclgd32(float32 a, float_status *s)
+{
+    const float32 tmp = float32_to_uint32(a, s);
+
+    return float32_is_any_nan(a) ? 0 : tmp;
+}
+
 static float64 vcdg64(float64 a, float_status *s)
 {
     return int64_to_float64(a, s);
@@ -210,6 +234,9 @@ void HELPER(gvec_##NAME##BITS)(void *v1, const void *v2, CPUS390XState *env,   \
     vop##BITS##_2(v1, v2, env, se, XxC, erm, FN, GETPC());                     \
 }
 
+#define DEF_GVEC_VOP2_32(NAME)                                                 \
+DEF_GVEC_VOP2_FN(NAME, NAME##32, 32)
+
 #define DEF_GVEC_VOP2_64(NAME)                                                 \
 DEF_GVEC_VOP2_FN(NAME, NAME##64, 64)
 
@@ -218,6 +245,10 @@ DEF_GVEC_VOP2_FN(NAME, float32_##OP, 32)                                       \
 DEF_GVEC_VOP2_FN(NAME, float64_##OP, 64)                                       \
 DEF_GVEC_VOP2_FN(NAME, float128_##OP, 128)
 
+DEF_GVEC_VOP2_32(vcdg)
+DEF_GVEC_VOP2_32(vcdlg)
+DEF_GVEC_VOP2_32(vcgd)
+DEF_GVEC_VOP2_32(vclgd)
 DEF_GVEC_VOP2_64(vcdg)
 DEF_GVEC_VOP2_64(vcdlg)
 DEF_GVEC_VOP2_64(vcgd)
-- 
2.35.1


