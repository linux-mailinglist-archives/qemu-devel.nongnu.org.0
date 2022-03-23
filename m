Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CA24E53C4
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 14:59:52 +0100 (CET)
Received: from localhost ([::1]:49796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX1Wh-0001sR-Dn
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 09:59:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1Ue-0007IO-61; Wed, 23 Mar 2022 09:57:44 -0400
Received: from [2607:f8b0:4864:20::82e] (port=45715
 helo=mail-qt1-x82e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1Uc-0000v5-JE; Wed, 23 Mar 2022 09:57:43 -0400
Received: by mail-qt1-x82e.google.com with SMTP id a11so1148431qtb.12;
 Wed, 23 Mar 2022 06:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+kiuMWegOQeAEXRfhHDxakzWQQXpYxd7TYYQ9elZfdQ=;
 b=BT89bbL0p/fsTzqxw4l5H5Vr0txTwTR1w6h7qtAzk9MDINV6S3uNLTeF+Z/S0Q0np5
 RdIyeKIZyETn9gZxJiWKyXk2jt7WSvgqIt4gx3LTJj6FhTPu0loaph5TxYpRXZ2DHMLD
 Zz79QVHwSYtXTfYWR3BD79qsAej7IuYVDgZ5fgFIVp3wfiFEFRfBKwHrx1PrWBEkBC8k
 SqvGTE/UXGWaTB61TxyTknjbpRrMXg3QaXqPkK6bYNytFm7wvh9TZ6mwi5aegAx8noeH
 UxdtOoys7OTG6v8TtT3jIuaVYrlcVY+8PuPfuZrRpYOZ69fY3ttJICA8BEYr5ogKBJf5
 mNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+kiuMWegOQeAEXRfhHDxakzWQQXpYxd7TYYQ9elZfdQ=;
 b=fI0EyWdZ6u52SyM7lHeI8Jq3FRSPaTpNTlt+lPt0AQtM/wW1FPao9gS2wriRZhDpRk
 vuHQD2j/KVz9vmCEvYXtQNNrw1k9kUr5MnvA/qVevSGQaKaLbINZG0AzkiYv2C7YhEGO
 fRF/M6JSg0ntD7KrPWSGhrSRwZo8nUcigyQRwiC/wNEVZHFXpMmPlxWDMEMFplV3/HOl
 Zeg8PTL9ySafcNZHrJQtVddffUa2HpeH29vGV3MDKypmMKQKS2mJ/fW/IcDW+TGxDqlx
 Q9mCH8WniG1o2qCxgCH/MkEqrQQsMPJQVRdMmjYlc2kRvLb+zxLnLSFdmBs4xF5N5vVz
 oOcA==
X-Gm-Message-State: AOAM531NvYqQYnvyZ/VCBnc04mnxbGjx/DStXRngMfS2vvDm1dNtk4NR
 xdo1vXJNTWmm0KWTanTZg5zHmZrosF699w==
X-Google-Smtp-Source: ABdhPJw80VRybHzeoxBf+kcCjzG9MAhSbMRCs/Wp5HiSfyKSsirUNsvIBzvuOPLdCFgmTvEUnc3XLA==
X-Received: by 2002:a05:622a:11c7:b0:2e1:b594:cb1d with SMTP id
 n7-20020a05622a11c700b002e1b594cb1dmr24210021qtk.59.1648043861125; 
 Wed, 23 Mar 2022 06:57:41 -0700 (PDT)
Received: from localhost.localdomain (mont-dyn-146-104.pwrtc.com.
 [205.174.146.104]) by smtp.gmail.com with ESMTPSA id
 t128-20020a37aa86000000b0060ddf2dc3ecsm20907qke.104.2022.03.23.06.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 06:57:40 -0700 (PDT)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 02/11] target/s390x: vxeh2: vector convert short/32b
Date: Wed, 23 Mar 2022 09:57:13 -0400
Message-Id: <20220323135722.1623-3-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220323135722.1623-1-dmiller423@gmail.com>
References: <20220323135722.1623-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=dmiller423@gmail.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com,
 David Miller <dmiller423@gmail.com>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: David Miller <dmiller423@gmail.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
index 98eb7710a4..ea28e40d4f 100644
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
index 1a77993471..6834dbc540 100644
--- a/target/s390x/tcg/vec_fpu_helper.c
+++ b/target/s390x/tcg/vec_fpu_helper.c
@@ -176,6 +176,30 @@ static void vop128_2(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
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
@@ -211,6 +235,9 @@ void HELPER(gvec_##NAME##BITS)(void *v1, const void *v2, CPUS390XState *env,   \
     vop##BITS##_2(v1, v2, env, se, XxC, erm, FN, GETPC());                     \
 }
 
+#define DEF_GVEC_VOP2_32(NAME)                                                 \
+DEF_GVEC_VOP2_FN(NAME, NAME##32, 32)
+
 #define DEF_GVEC_VOP2_64(NAME)                                                 \
 DEF_GVEC_VOP2_FN(NAME, NAME##64, 64)
 
@@ -219,6 +246,10 @@ DEF_GVEC_VOP2_FN(NAME, float32_##OP, 32)                                       \
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
2.34.1


