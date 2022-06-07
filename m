Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3135415EF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:43:36 +0200 (CEST)
Received: from localhost ([::1]:39042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyg35-0000yj-D0
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftE-0007XY-6D
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:24 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:46976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft8-0007Bp-AX
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:23 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 k5-20020a17090a404500b001e8875e6242so5675467pjg.5
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EhwnwnXu9GaRLFDW69ulBLl+dTP5VjSTIg+Z3UagrI0=;
 b=MAEY0El3J2InYhXJ6z4X6UcWp8e2SvknuCG/v5Y12gGflLdDCfgNnadpTQZVfPxsny
 SXBz+ejJVrbrEXTOVCmIUurbreh8Q8qD8a7wzqMhR6NCeP88wdjyNLPkdRE7zZJCb0uH
 +bmWrmt7kU3vrjh7GZqjTEaqGDKXS6xXUFJMExgDWF9n5aVbBCaLC1kg8l/to4hMIMSb
 DfPVS2OB+EzBku7bdoZKhAL9f6dR1pZm4qqonuMemRsI6kSbVHGXZOM17UnFFfTPsGCZ
 TwvHWdnodSfPKjlwg1VfydmqlhVhMeSRHsm5p4ns4INXj0NpgaEJnSdC2adED5miT/rT
 yDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EhwnwnXu9GaRLFDW69ulBLl+dTP5VjSTIg+Z3UagrI0=;
 b=cYMzDMuf9zKauZ83BA2ir+R/KlAm5Eqzt/ktT8jl0sjuHOnEir4XXzPsRotVkZpZxN
 NKkfvK1H8A5/J6BLfSYlYKQRUZhOkRSSE1qyjZ2R0uLO7p7nm7D+0yjKSdZHcc9l0WIV
 ZXY7mek/p0o03bk++Yj3PPw9KNo4HCh4ML46vkM+uiohGR06SVt9V+0/qsEirzR2gpHS
 T29R20tS1nww5iXPojZw2/1Gr8Ll7CTviWgGqeVbIK3TnEjZHTuTd8GF0r0ZVuRc6erQ
 278Dk637elKvgNO1lFEdxqNo/irgCPMG2O7p0S/wkZlFN0fBD06C1FpGNHW1dpO0s3ov
 xEmw==
X-Gm-Message-State: AOAM533tXqegavr+PJfwTmtIGf55AwILLgSSbjoBS95/GUgQS5r7QBmv
 +RJ5qzrw0iYQlLMBBcYRmqf/97r5IDkF9g==
X-Google-Smtp-Source: ABdhPJx4PHToLzlNoYedpqWjvd0Tzlq35hC3JGnAeckWG7LRQ1FGax//FWB9jjBY3QD/6NVwKMP4Xg==
X-Received: by 2002:a17:90b:4c84:b0:1e8:6bea:d278 with SMTP id
 my4-20020a17090b4c8400b001e86bead278mr16853882pjb.232.1654633996489; 
 Tue, 07 Jun 2022 13:33:16 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 10/71] target/arm: Merge aarch64_sve_zcr_get_valid_len into
 caller
Date: Tue,  7 Jun 2022 13:32:05 -0700
Message-Id: <20220607203306.657998-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

This function is used only once, and will need modification
for Streaming SVE mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 11 -----------
 target/arm/helper.c    | 30 +++++++++++-------------------
 2 files changed, 11 insertions(+), 30 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a73f2a94c5..4dcdca918b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -189,17 +189,6 @@ void arm_translate_init(void);
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
index dc8f1e44cc..e84d30e5fc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6222,39 +6222,31 @@ int sve_exception_el(CPUARMState *env, int el)
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
 
     if (el <= 1 && !el_is_in_host(env, el)) {
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


