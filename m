Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DAB53866D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:55:35 +0200 (CEST)
Received: from localhost ([::1]:55012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvig2-0005CX-IS
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvr-0003dz-DJ
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:56 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:42544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvp-0007Ju-Ov
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:51 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l188-20020a1c25c5000000b003978df8a1e2so4642191wml.1
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UKXoP1U+BIwA0P27wZhDfy2XM5fzL0S3w/Fk9L/JDNI=;
 b=x4U1LnAQTAxc6uGISlvYQlio4GpSi1klsoAKd068EP9AOFtYtgFRjGjf2UEzKHg8Ed
 2eKU8xIq2YhNAsHoW8wWG4Dt38xIwmCtAIIynPE2+7mQiUHP0CKT/paCxpk0tyFc6C/G
 +e9VxjM7cr+iY/c4oNflDSyKGh88keLV1LTG9LZyi7XjHr35DEg7XgsuKIVo87NSSSjx
 lcUdasG1QCtDpXT0f3dqb3KhJt9/wkW9vhFA4zPPC6T7x5sIyc+TUOGFk8Opj10fDnR7
 LWvYez9JZGGT1Gymf69K4IFgtahH6sjampbdWIjFBT/Xl8Iv0lhUfzsnbaSUlKGwfsDu
 6XpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UKXoP1U+BIwA0P27wZhDfy2XM5fzL0S3w/Fk9L/JDNI=;
 b=pINWBHw9My3d/YVbLMuPUfxTxjOMx00HMVwPdOVMc5odrmseDYkqA6WiqSFZ5CCXLA
 94VfNzR7bnBOkSXP2jAcRWJ9E1HDthW3rCUtrQipMZRN1rccEZ5o0oEk5m5ebF7ocMAW
 UmQJJxaOKzJSy2zmF8VhcgebfT1hspJW6xI/pfdoYLS+HXGQG+XQNjmW4YJT4ZvjfEbV
 Rb3NUBDQm1d5QiSVwTeEOu1sH2jfkY8qEY8n5rg0f4rRygEV12+yalXUk9bg4yEbUjLc
 CT9AcPI6cCKQ0Sq9ISo2cuBkxu1eiWkvGpT+0/6edkdOVb8+kDvKik3EiSgKJ+HXMOlT
 5qPg==
X-Gm-Message-State: AOAM5332mZ1wsNgCb6gx5Uu1um740f6TiZd9wS/ihL5zKxcplbTjlRqy
 re5S1WzH7O/H3Su96n+A+kb6Vxmf6yYbQA==
X-Google-Smtp-Source: ABdhPJxDhrCVrdjqm1kPeqtyFwZlcjNpcLKsUTUgzg17kJWBdRbt5tivD4XumBBui3vaweDe46cBpg==
X-Received: by 2002:a7b:c2e8:0:b0:397:4a00:6955 with SMTP id
 e8-20020a7bc2e8000000b003974a006955mr19770618wmk.74.1653926868222; 
 Mon, 30 May 2022 09:07:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 048/117] target/arm: Introduce do_shift_zpzi
Date: Mon, 30 May 2022 17:05:59 +0100
Message-Id: <20220530160708.726466-49-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Share code between the various shifts using arg_rpri_esz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-46-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 68 +++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 38 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f15e9a30b39..c7c16863c0b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -900,20 +900,39 @@ static bool do_movz_zpz(DisasContext *s, int rd, int rn, int pg,
     return gen_gvec_ool_zzp(s, fns[esz], rd, rn, pg, invert);
 }
 
+static bool do_shift_zpzi(DisasContext *s, arg_rpri_esz *a, bool asr,
+                          gen_helper_gvec_3 * const fns[4])
+{
+    int max;
+
+    if (a->esz < 0) {
+        /* Invalid tsz encoding -- see tszimm_esz. */
+        return false;
+    }
+
+    /*
+     * Shift by element size is architecturally valid.
+     * For arithmetic right-shift, it's the same as by one less.
+     * For logical shifts and ASRD, it is a zeroing operation.
+     */
+    max = 8 << a->esz;
+    if (a->imm >= max) {
+        if (asr) {
+            a->imm = max - 1;
+        } else {
+            return do_movz_zpz(s, a->rd, a->rd, a->pg, a->esz, true);
+        }
+    }
+    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
+}
+
 static bool trans_ASR_zpzi(DisasContext *s, arg_rpri_esz *a)
 {
     static gen_helper_gvec_3 * const fns[4] = {
         gen_helper_sve_asr_zpzi_b, gen_helper_sve_asr_zpzi_h,
         gen_helper_sve_asr_zpzi_s, gen_helper_sve_asr_zpzi_d,
     };
-    if (a->esz < 0) {
-        /* Invalid tsz encoding -- see tszimm_esz. */
-        return false;
-    }
-    /* Shift by element size is architecturally valid.  For
-       arithmetic right-shift, it's the same as by one less. */
-    a->imm = MIN(a->imm, (8 << a->esz) - 1);
-    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
+    return do_shift_zpzi(s, a, true, fns);
 }
 
 static bool trans_LSR_zpzi(DisasContext *s, arg_rpri_esz *a)
@@ -922,16 +941,7 @@ static bool trans_LSR_zpzi(DisasContext *s, arg_rpri_esz *a)
         gen_helper_sve_lsr_zpzi_b, gen_helper_sve_lsr_zpzi_h,
         gen_helper_sve_lsr_zpzi_s, gen_helper_sve_lsr_zpzi_d,
     };
-    if (a->esz < 0) {
-        return false;
-    }
-    /* Shift by element size is architecturally valid.
-       For logical shifts, it is a zeroing operation.  */
-    if (a->imm >= (8 << a->esz)) {
-        return do_movz_zpz(s, a->rd, a->rd, a->pg, a->esz, true);
-    } else {
-        return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-    }
+    return do_shift_zpzi(s, a, false, fns);
 }
 
 static bool trans_LSL_zpzi(DisasContext *s, arg_rpri_esz *a)
@@ -940,16 +950,7 @@ static bool trans_LSL_zpzi(DisasContext *s, arg_rpri_esz *a)
         gen_helper_sve_lsl_zpzi_b, gen_helper_sve_lsl_zpzi_h,
         gen_helper_sve_lsl_zpzi_s, gen_helper_sve_lsl_zpzi_d,
     };
-    if (a->esz < 0) {
-        return false;
-    }
-    /* Shift by element size is architecturally valid.
-       For logical shifts, it is a zeroing operation.  */
-    if (a->imm >= (8 << a->esz)) {
-        return do_movz_zpz(s, a->rd, a->rd, a->pg, a->esz, true);
-    } else {
-        return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-    }
+    return do_shift_zpzi(s, a, false, fns);
 }
 
 static bool trans_ASRD(DisasContext *s, arg_rpri_esz *a)
@@ -958,16 +959,7 @@ static bool trans_ASRD(DisasContext *s, arg_rpri_esz *a)
         gen_helper_sve_asrd_b, gen_helper_sve_asrd_h,
         gen_helper_sve_asrd_s, gen_helper_sve_asrd_d,
     };
-    if (a->esz < 0) {
-        return false;
-    }
-    /* Shift by element size is architecturally valid.  For arithmetic
-       right shift for division, it is a zeroing operation.  */
-    if (a->imm >= (8 << a->esz)) {
-        return do_movz_zpz(s, a->rd, a->rd, a->pg, a->esz, true);
-    } else {
-        return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-    }
+    return do_shift_zpzi(s, a, false, fns);
 }
 
 static gen_helper_gvec_3 * const sqshl_zpzi_fns[4] = {
-- 
2.25.1


