Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70C15366E8
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:27:02 +0200 (CEST)
Received: from localhost ([::1]:33810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nueft-0008CV-Ne
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueMO-0003eN-Lf
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:52 -0400
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d]:37521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueMC-0001ga-2b
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:52 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id bs5so2348223vkb.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dxabHe71bVF6gWrVCnhG6cG25f2zMO3rtHLOUVp6u4E=;
 b=njkkpmZT0rvIz2hvQ69ln9hhreHySUIbW1gj7hABFe+uxaELzlu5t0nDL0OxYdY8r/
 LaM48hfqf79hDbgSjXqzGfsQx05b8zzMLInsfrkOrAhzAGKpg1wwepQIW9aUoefA6mAV
 fERCUxWYPyjcs9cYvJbPZ7dfiyBU5eaOdRzxh7KK+uqVGxZ5BXY+TY/c6W2lhoouSmln
 tji/17AGCGWWEInUHpdzRIcSL+hVACUrRi+8BWHTlF79UmjIZln70K6pye7Y8DCQtG6N
 KOY2+NTP819256vuT68Ngj5XAsYM1M9BIADbgIRCGFCJZX42oyBxehiYUME4G5BxTuGn
 zM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dxabHe71bVF6gWrVCnhG6cG25f2zMO3rtHLOUVp6u4E=;
 b=gVfbl/yzUouHUUTu00Cso4Zr/HGa7/pcToOYgli2gKMnMkU8Tq7LR2wHX/k2jrNVVp
 ZhoUWQTEhcx6wpI9qCtsHI8TLy3gB0NlhR+RhViWNGY6auSkjEUzyIYvcIh6EEDj8Jd4
 QqDBRVUgusChSgGZ4D9W0Dw58jkqnPAUvelM7EyHU3GOON8XQGqj7nf+Q8dhpI2+iNAa
 bCXcUG3/id4C0NepeqnQAlWVRjcrCMUfbW9TCrlrdri944K20sOi8IBPpxjSjrW8RXvF
 5KHuovA1Bu0MfOJczzXEoBLPAUbpiJRM68AzOQGq3eYa59LHAai85niEqjwL+ssUqGi0
 k0ug==
X-Gm-Message-State: AOAM533J/442+5r0zc+wWvoaulX54QMSX1o3r7oR/DvAugO+m/h8sA1u
 r7pA4Xyyz+p/tK7Fk5+w+Jiaa8bM7STBSw==
X-Google-Smtp-Source: ABdhPJx69h/EJPz6NIAlYDaCagEyowsbi2eP5S6mrQ1kwWpPCAauBKnBR3DnDrLPCqghdDhTzi4/JA==
X-Received: by 2002:a17:902:ebca:b0:15f:4cc5:f40f with SMTP id
 p10-20020a170902ebca00b0015f4cc5f40fmr43710895plg.96.1653674788226; 
 Fri, 27 May 2022 11:06:28 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 04/15] target/arm: Merge aarch64_sve_zcr_get_valid_len into
 caller
Date: Fri, 27 May 2022 11:06:12 -0700
Message-Id: <20220527180623.185261-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527180623.185261-1-richard.henderson@linaro.org>
References: <20220527180623.185261-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This function is used only once, and will need modification
for Streaming SVE mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 11 -----------
 target/arm/helper.c    | 30 +++++++++++-------------------
 2 files changed, 11 insertions(+), 30 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 09d25612af..199d1bf630 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -198,17 +198,6 @@ void arm_translate_init(void);
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
 
-/**
- * aarch64_sve_zcr_get_valid_len:
- * @cpu: cpu context
- * @start_len: maximum len to consider
- *
- * Return the maximum supported sve vector length <= @start_len.
- * Note that both @start_len and the return value are in units
- * of ZCR_ELx.LEN, so the vector bit length is (x + 1) * 128.
- */
-uint32_t aarch64_sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len);
-
 enum arm_fprounding {
     FPROUNDING_TIEEVEN,
     FPROUNDING_POSINF,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2a0399100e..66036c85d7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6216,40 +6216,32 @@ int sve_exception_el(CPUARMState *env, int el)
     return 0;
 }
 
-uint32_t aarch64_sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
-{
-    uint32_t end_len;
-
-    start_len = MIN(start_len, ARM_MAX_VQ - 1);
-    end_len = start_len;
-
-    if (!test_bit(start_len, cpu->sve_vq_map)) {
-        end_len = find_last_bit(cpu->sve_vq_map, start_len);
-        assert(end_len < start_len);
-    }
-    return end_len;
-}
-
 /*
  * Given that SVE is enabled, return the vector length for EL.
  */
 uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
 {
     ARMCPU *cpu = env_archcpu(env);
-    uint32_t zcr_len = cpu->sve_max_vq - 1;
+    uint32_t len = cpu->sve_max_vq - 1;
+    uint32_t end_len;
 
     if (el <= 1 &&
         (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
+        len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
     }
     if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
+        len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
     }
     if (arm_feature(env, ARM_FEATURE_EL3)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
+        len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
     }
 
-    return aarch64_sve_zcr_get_valid_len(cpu, zcr_len);
+    end_len = len;
+    if (!test_bit(len, cpu->sve_vq_map)) {
+        end_len = find_last_bit(cpu->sve_vq_map, len);
+        assert(end_len < len);
+    }
+    return end_len;
 }
 
 static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.34.1


