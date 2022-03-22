Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB394E3540
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 01:08:16 +0100 (CET)
Received: from localhost ([::1]:44818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWS4N-0002kS-C3
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 20:08:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1M-0007pr-EL; Mon, 21 Mar 2022 20:05:11 -0400
Received: from [2607:f8b0:4864:20::731] (port=33331
 helo=mail-qk1-x731.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1F-0007Hi-KC; Mon, 21 Mar 2022 20:05:06 -0400
Received: by mail-qk1-x731.google.com with SMTP id k125so12964528qkf.0;
 Mon, 21 Mar 2022 17:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UPs1p04CKoVEqheFc0vr48XsNuESWMsyp4pEoYgcVx8=;
 b=KuCLn7yQjsalVleoOGL2hKYOstFZVJ13m2bUG4F+CUeVpXDC01uEV9rlIV7TUcM+MC
 FAlB0B6oFKmvg96crS9ss3i3GE21zzvUjhNg1sWze5zcH6RfOozZ7WHWBx9EZsLBuheB
 EeK56kQ5BBmaX0gfHogl+lDJrqvD9+i481hgfOFyuTKulQ0ZOnnF4WSYnIRw/L1Wf9qB
 RNfmOnn/PJlRfOd89YbQIZ5qFczVZSlUvHPva2DTJ7kgeKTm7nWjVWCQAbgG0szSdiiI
 6z+O0S9goJk/y52f9i6FY2h9SPdgkbx50vdsbYOmQS85UX1lMbNRnMg+Mkjd+/9UKjZ8
 zlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UPs1p04CKoVEqheFc0vr48XsNuESWMsyp4pEoYgcVx8=;
 b=jPbSaVkdXlPfaV97Fbc+sQqYTyQMzfR9BV+rhGqRdcEGTpsQTlp+xP8xZOFsp7vl05
 ouaB4FpVA62K0hN7bMBExCuYMNemcZwuNDFTA6FkKbjbF2SHlUbRqlhZDTu1s8qNnCC5
 Nd48QGG45XJvYmDSAzaJCiyM2ATHP+6DQcEArUmCMG5YGqDYyL0iXAWmAizvdPjnRQjH
 rBmKzdsjo2AF4RAaoccwyKyxC6cUrjl2uCK+gem2aQ3dOIlyp+CD40ezsyzsoqUiUUxg
 9ByhT2mfrlNzunaehMvX3Lg5pWh/2ypLxvfgj1HegShFJY6kVJc85HcZquWaylDaqgqf
 GGAg==
X-Gm-Message-State: AOAM532bb9/pG5BvjmT5cCr3//wBv7vgqyQY+i1L1kbewjZwkOe4G7Ac
 SBU+T0SZvK2J3dtWvADwA6ZqYy/1KWJgBg==
X-Google-Smtp-Source: ABdhPJxPDI9ZrA7y/he5XIbZmjNL4zYZ+0oHcSusvwO5BXcPeOzcIY4KKWM5RV5JG5vpT8b9MqCzsg==
X-Received: by 2002:a05:620a:1181:b0:60d:f3ab:595f with SMTP id
 b1-20020a05620a118100b0060df3ab595fmr13735220qkk.275.1647907496000; 
 Mon, 21 Mar 2022 17:04:56 -0700 (PDT)
Received: from localhost.localdomain (mont-dyn-146-104.pwrtc.com.
 [205.174.146.104]) by smtp.gmail.com with ESMTPSA id
 a129-20020a376687000000b0067d186d953bsm8214038qkc.121.2022.03.21.17.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 17:04:55 -0700 (PDT)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 02/11] target/s390x: vxeh2: vector convert short/32b
Date: Mon, 21 Mar 2022 20:04:32 -0400
Message-Id: <20220322000441.26495-3-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220322000441.26495-1-dmiller423@gmail.com>
References: <20220322000441.26495-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::731
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=dmiller423@gmail.com; helo=mail-qk1-x731.google.com
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
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
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


