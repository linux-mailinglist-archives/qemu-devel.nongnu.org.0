Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB72536754
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:06:18 +0200 (CEST)
Received: from localhost ([::1]:59690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufHt-0008Uh-Lk
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYi-0007Ls-On
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:36 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:34497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYe-0003bJ-J9
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:36 -0400
Received: by mail-pf1-x432.google.com with SMTP id c65so4412712pfb.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q/r/5sQg7LcKfCo6q8wVtM0uONgheR0ZHGVQXD4ChPE=;
 b=NPd+yrS1B6CMnt3LPYCyb8DeSBUHrTZrOqSB8NFByS9R+OecgawI/V2lMgFHExX8r3
 MwQKVtleL68ySAhdjQ4TdwUCuUOtSAW0CLkuGnGX7G+Gfm1q70Z9ogB1gPDJbzD7MCMu
 zFLi3cPgpadH8AKYo+mDSS3sHI6wRiP0BuUZro+3IG0LF3WTje3qVWlOstPj5zK2Zz9S
 C42r63RZbeX3tjMSiDNOXAYjfnnYhUf6OTQrF97PBxPja7xq0gnk0l/ksr6fknuora/j
 4mHwQyoay/2aYTP+cRPf3u6yljSin11/K8/IQJHNPQtwJgdPlICrJTEfwE/FBjuFC1un
 9zdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q/r/5sQg7LcKfCo6q8wVtM0uONgheR0ZHGVQXD4ChPE=;
 b=dNjWIeI8mPWWGokxwoZrT3jnZqXcLq6Io0X7VzTB867hcDbXNSNXTobPmHoa/BZq/d
 3Hkbva/xArynu99S+Ah21VFV06IzyCp8dyyk7sCs4fGtvYxh7dFly2eEhZ8sWlGN1XE7
 fPoIeoPWfvJHV9uTJhj/RFgYTRpM9kpyqAHkTl6Nd11iGoXxg9o7J6Pa313+7ojCS/E3
 hApfEmf3f0NhI+QI4lwoqRwHs0ENB8NmXB1A77f0vqwh3v1SO8ixzAgP10Gmjpp14ByF
 Srv9KeXm6qrbYfRxIIW3OuNBC7w4/DhNTP/9WQqfouxVWi5WcAfmHL+VUOYXcgZLkJre
 eHHA==
X-Gm-Message-State: AOAM530IjH7b/Od+iqUJSi25tzMiipLWOYpuuQQlnT3TTgyxcnr2XUxA
 mvcy/T2mzx3VOngwhDQB7HPVZd4lrJxILA==
X-Google-Smtp-Source: ABdhPJw261ZzPhkSZIoKkCez2W4or1vsuQaqwQKcJvz9OAHcRV+I8ucA7IsnQhqu8SqbHQ22Iv6uNQ==
X-Received: by 2002:a63:4a4b:0:b0:3fa:8a72:b2 with SMTP id
 j11-20020a634a4b000000b003fa8a7200b2mr19524202pgl.544.1653675571690; 
 Fri, 27 May 2022 11:19:31 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 024/114] target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zpzi
Date: Fri, 27 May 2022 11:17:37 -0700
Message-Id: <20220527181907.189259-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

Convert some SVE translation functions using
gen_gvec_ool_arg_zpzi to TRANS_FEAT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 85 ++++++++++++++------------------------
 1 file changed, 30 insertions(+), 55 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 86e87a2078..10614bf915 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1027,65 +1027,40 @@ static bool trans_ASRD(DisasContext *s, arg_rpri_esz *a)
     }
 }
 
-static bool trans_SQSHL_zpzi(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_sqshl_zpzi_b, gen_helper_sve2_sqshl_zpzi_h,
-        gen_helper_sve2_sqshl_zpzi_s, gen_helper_sve2_sqshl_zpzi_d,
-    };
-    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-}
+static gen_helper_gvec_3 * const sqshl_zpzi_fns[4] = {
+    gen_helper_sve2_sqshl_zpzi_b, gen_helper_sve2_sqshl_zpzi_h,
+    gen_helper_sve2_sqshl_zpzi_s, gen_helper_sve2_sqshl_zpzi_d,
+};
+TRANS_FEAT(SQSHL_zpzi, aa64_sve2, gen_gvec_ool_arg_zpzi,
+           a->esz < 0 ? NULL : sqshl_zpzi_fns[a->esz], a)
 
-static bool trans_UQSHL_zpzi(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_uqshl_zpzi_b, gen_helper_sve2_uqshl_zpzi_h,
-        gen_helper_sve2_uqshl_zpzi_s, gen_helper_sve2_uqshl_zpzi_d,
-    };
-    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-}
+static gen_helper_gvec_3 * const uqshl_zpzi_fns[4] = {
+    gen_helper_sve2_uqshl_zpzi_b, gen_helper_sve2_uqshl_zpzi_h,
+    gen_helper_sve2_uqshl_zpzi_s, gen_helper_sve2_uqshl_zpzi_d,
+};
+TRANS_FEAT(UQSHL_zpzi, aa64_sve2, gen_gvec_ool_arg_zpzi,
+           a->esz < 0 ? NULL : uqshl_zpzi_fns[a->esz], a)
 
-static bool trans_SRSHR(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_srshr_b, gen_helper_sve2_srshr_h,
-        gen_helper_sve2_srshr_s, gen_helper_sve2_srshr_d,
-    };
-    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-}
+static gen_helper_gvec_3 * const srshr_fns[4] = {
+    gen_helper_sve2_srshr_b, gen_helper_sve2_srshr_h,
+    gen_helper_sve2_srshr_s, gen_helper_sve2_srshr_d,
+};
+TRANS_FEAT(SRSHR, aa64_sve2, gen_gvec_ool_arg_zpzi,
+           a->esz < 0 ? NULL : srshr_fns[a->esz], a)
 
-static bool trans_URSHR(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_urshr_b, gen_helper_sve2_urshr_h,
-        gen_helper_sve2_urshr_s, gen_helper_sve2_urshr_d,
-    };
-    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-}
+static gen_helper_gvec_3 * const urshr_fns[4] = {
+    gen_helper_sve2_urshr_b, gen_helper_sve2_urshr_h,
+    gen_helper_sve2_urshr_s, gen_helper_sve2_urshr_d,
+};
+TRANS_FEAT(URSHR, aa64_sve2, gen_gvec_ool_arg_zpzi,
+           a->esz < 0 ? NULL : urshr_fns[a->esz], a)
 
-static bool trans_SQSHLU(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_sqshlu_b, gen_helper_sve2_sqshlu_h,
-        gen_helper_sve2_sqshlu_s, gen_helper_sve2_sqshlu_d,
-    };
-    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-}
+static gen_helper_gvec_3 * const sqshlu_fns[4] = {
+    gen_helper_sve2_sqshlu_b, gen_helper_sve2_sqshlu_h,
+    gen_helper_sve2_sqshlu_s, gen_helper_sve2_sqshlu_d,
+};
+TRANS_FEAT(SQSHLU, aa64_sve2, gen_gvec_ool_arg_zpzi,
+           a->esz < 0 ? NULL : sqshlu_fns[a->esz], a)
 
 /*
  *** SVE Bitwise Shift - Predicated Group
-- 
2.34.1


