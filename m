Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8764CEF50
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 03:06:16 +0100 (CET)
Received: from localhost ([::1]:60818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR2lL-0005Aw-Un
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 21:06:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nR2iq-0002Sc-Kq; Sun, 06 Mar 2022 21:03:40 -0500
Received: from [2607:f8b0:4864:20::829] (port=42746
 helo=mail-qt1-x829.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nR2io-0005wV-Sx; Sun, 06 Mar 2022 21:03:40 -0500
Received: by mail-qt1-x829.google.com with SMTP id 11so12108043qtt.9;
 Sun, 06 Mar 2022 18:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VblxrvETxAcTmVuoBE4BGjbxwDA+MsvcwCfCqs1C6pU=;
 b=jeVT0BicQgMOJZO1qr3OqToFA7kwYTaUHKaCp10AR6IhcA6I+ONjNhM19N2HNPo4vw
 KoOOhrHGrOTYQD2rLmkkEdR7qbJ0gk7ByM2L/KA5qsrhohfgxRy/Dvne2f+eMBaK7ERt
 E3ZJUiJ8UFNRvX6FTkcuQP1JSG+jcVIVe9jCtTMpXfOtjc/zBLlai4kns2Wj0o6nceZ7
 2xy+fsd8KVgMwfjwoKsE5oQ9yCB+ta+xDpgCzhgnQTV+ywoY6f0/tzc2WlVaiy1Q32in
 sJwnshjGfMi558bwg0mWN3pnKVVvlYlxaE8K10pX/TgrHXMADWKYoNnUOzcL4ODh5F/I
 XTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VblxrvETxAcTmVuoBE4BGjbxwDA+MsvcwCfCqs1C6pU=;
 b=ESjA8C6cuwd7mKjm3aYYjxfVGvtufj5TUP3TA+LMUr0WAMb7k++OTqawFuB1OOWKeT
 lsNc5Jc09C9xT4kFbGy1GjwakNTzQX3+1m+8u9On/Kyy+bE+WdPFmMtAg7qTzLRv3M82
 MT7dVRG7p4BluivbkAajRlhtZxEMJEQN29JoD0ZWukA/JTBKXIpe5sdVbLvXbacxiva+
 GbLpPWMbE0XAsO+0QVbNSJSvb+7Dbg3NyApeNpYlmW4qQnf8w5SfDeV6nt5D6ct1KOw4
 a1ABFCKou7LF+IsDkwRsw2cmGNW5pgCNMS+38m+/tiZRIg31y99XwtKCiHcZ8ws470oK
 wLQQ==
X-Gm-Message-State: AOAM530qs63plrTftjT5icdkvNwkoyfBj/oHJID69DvMmZ/A7CwREQNR
 2gtkhxHA+ZIoSCGPxVjfcjFTUADwF7UVPw==
X-Google-Smtp-Source: ABdhPJwFX2+2wMpQVpaB8yRNEf2vtgeYY/UhwLAdOwJ15X8StSHyAjqWjhgCEJkT/RBeXMnptdGedA==
X-Received: by 2002:ac8:5ace:0:b0:2d6:e806:3676 with SMTP id
 d14-20020ac85ace000000b002d6e8063676mr7742746qtd.541.1646618617524; 
 Sun, 06 Mar 2022 18:03:37 -0800 (PST)
Received: from localhost.localdomain (mont-dyn-146-145.pwrtc.com.
 [205.174.146.145]) by smtp.gmail.com with ESMTPSA id
 p190-20020a37a6c7000000b00648ea630a45sm5601053qke.121.2022.03.06.18.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 18:03:37 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/7] target/s390x: vxeh2: vector convert short/32b
Date: Sun,  6 Mar 2022 21:03:21 -0500
Message-Id: <20220307020327.3003-2-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307020327.3003-1-dmiller423@gmail.com>
References: <20220307020327.3003-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::829
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=dmiller423@gmail.com; helo=mail-qt1-x829.google.com
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


