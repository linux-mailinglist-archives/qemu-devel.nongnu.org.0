Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBE556BCFA
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:39:42 +0200 (CEST)
Received: from localhost ([::1]:51242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9q4z-0003yJ-6L
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pin-0002ok-1b
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:45 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:34620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pil-0002Kd-7U
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:44 -0400
Received: by mail-pl1-x630.google.com with SMTP id z1so10808198plb.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8q6UgHZNxgLAwjYyD3emx4pnHnGEMm3xg5CqdRKZ5yA=;
 b=Rlh1uGi31mr+nppIEi5f5Iw+0CqYnLlsV5W4Y9htIKl857meuFaODi5r42vJqjvFMa
 64UddTFV0Pck0r52ey0INwG+wvNrmZzcFJ25fA6gRSh/66FJwigzMwuAlmmQ4z2klcjX
 Jz8UbWO38MuTX0HYp18aLscwUdPNanyfiBqgSOcvHvx+rSobpm9f2Qrs8jYYR/AIdByh
 YdeK1EdS/axxGRrnQXVktLudanqfxfQ5vYf1yIkieF6XfBoN44+x2ZBb5e6v7W+6Kuk/
 X0RsYx7y3K8TDTg1yJBgwRt+3142+Xe/3FI1HPNn1yno4qD49Z/2USXyvjZL9LbQrO9i
 TnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8q6UgHZNxgLAwjYyD3emx4pnHnGEMm3xg5CqdRKZ5yA=;
 b=5jQrz9LPZA9ya+/KO/zZ/3DjFnroir73Bwe3Rr+SbWryINXmeRNinUQwkxn8G54Ggy
 u7J6wih5fX/cvi9vdR1v1IPVgOV1MGJ4HhyNHW/wvouhCLj1U2F5lyWcIltMljFhquIX
 /ph+NBpxRMFG4/LvrcIXB3SDgNFLxWRQvPNZPcXFfnEADVMbHTGrQhjDmUI0pWlBFq1T
 xKlSQUfFeSexH2MmxhHIK+wcjBCXI7hpGnUYijVs16Sfniweaosn/KK9AY/jnwlWwXdn
 YX/5o5eXxaj/jjZyzoGn/JD5ETzRd2MgJjaDl4WjWrqxMF8i2OZSFhn+5vGm4z83DOok
 /+5g==
X-Gm-Message-State: AJIora8XbZEZXzyfrBM6zYvfjeAktwAFMEZAy87cdlnQjhk7BA32NpIA
 vvjWIAzsU1n81NI1S9QX1SvqP8kcTifnavRJ
X-Google-Smtp-Source: AGRyM1u+MFCnidnLKz0VNTg5XVKueCAuXlN9sNj0U4eX382vtO7eMPWaOMIWU0KvaSRHSH6DjN8KSg==
X-Received: by 2002:a17:90b:3b4b:b0:1ef:f5b0:ce60 with SMTP id
 ot11-20020a17090b3b4b00b001eff5b0ce60mr352337pjb.71.1657293400833; 
 Fri, 08 Jul 2022 08:16:40 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 18/45] target/arm: Implement SME ZERO
Date: Fri,  8 Jul 2022 20:45:13 +0530
Message-Id: <20220708151540.18136-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Fix ZA[] comment in helper_sme_zero.
---
 target/arm/helper-sme.h    |  2 ++
 target/arm/sme.decode      |  4 ++++
 target/arm/sme_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-sme.c | 13 +++++++++++++
 4 files changed, 44 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 3bd48c235f..c4ee1f09e4 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -19,3 +19,5 @@
 
 DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
+
+DEF_HELPER_FLAGS_3(sme_zero, TCG_CALL_NO_RWG, void, env, i32, i32)
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index c25c031a71..6e4483fdce 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -18,3 +18,7 @@
 #
 # This file is processed by scripts/decodetree.py
 #
+
+### SME Misc
+
+ZERO            11000000 00 001 00000000000 imm:8
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index b215725594..eef2df73e1 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -59,3 +59,28 @@ void helper_set_pstate_za(CPUARMState *env, uint32_t i)
         memset(env->zarray, 0, sizeof(env->zarray));
     }
 }
+
+void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
+{
+    uint32_t i;
+
+    /*
+     * Special case clearing the entire ZA space.
+     * This falls into the CONSTRAINED UNPREDICTABLE zeroing of any
+     * parts of the ZA storage outside of SVL.
+     */
+    if (imm == 0xff) {
+        memset(env->zarray, 0, sizeof(env->zarray));
+        return;
+    }
+
+    /*
+     * Recall that ZAnH.D[m] is spread across ZA[n+8*m],
+     * so each row is discontiguous within ZA[].
+     */
+    for (i = 0; i < svl; i++) {
+        if (imm & (1 << (i % 8))) {
+            memset(&env->zarray[i], 0, svl);
+        }
+    }
+}
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 786c93fb2d..971504559b 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -33,3 +33,16 @@
  */
 
 #include "decode-sme.c.inc"
+
+
+static bool trans_ZERO(DisasContext *s, arg_ZERO *a)
+{
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (sme_za_enabled_check(s)) {
+        gen_helper_sme_zero(cpu_env, tcg_constant_i32(a->imm),
+                            tcg_constant_i32(streaming_vec_reg_size(s)));
+    }
+    return true;
+}
-- 
2.34.1


