Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87B052992E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 07:54:46 +0200 (CEST)
Received: from localhost ([::1]:42602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqqAP-0003UU-JK
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 01:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4r-0000U4-7c
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:49:03 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:33625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4m-0007nz-EA
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:48:58 -0400
Received: by mail-pl1-x62b.google.com with SMTP id d17so16461532plg.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 22:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lmHQQPYKlDu3aWdQHOeaVIIUIVTyse+PwW1XBQtfA78=;
 b=cGV7ETBX0EQw4hCrNIxB8c5H7+FhLuLVgD/Q+KMxCmgy+VOoCo0ax9d8/lCyU0+WmS
 zy1pa5WOJCdjf+LvCpitdP6mNzHY3ayIuw50W7uuSeNvRz0wh7hvr5N8X89+yQklgRwl
 K2AL3N2dW+3mNo4HooDBnnhh19n/HEmm6jZ8eKArFcihq6euwLgRrAaDgtEOLGTgv+Hc
 rXZ4xK8Ba5Uo3nuVrshreXg9T9+SGtXkU+JjM2XJ/08X2Bh/tzf64RVVWbPeIJHyJjpr
 jxtWBnnMYf/HFgVcQKYdHCt+3Mj+Yc1P+n2J1BSvUSz1mDXrJQFPoyH4rzLuHlU1YHxz
 BbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lmHQQPYKlDu3aWdQHOeaVIIUIVTyse+PwW1XBQtfA78=;
 b=08+j1WGl8s9TwpCkgtU13hM2jOHVqPcxBjl7p0zmmlFAh9QIkxHceLtKvrjhIgyYHt
 l79JUjweLOYt6eaGC0TSuZUHDGwnrsSiLC1HI34qimU7snCqaJETf59n1x+7af+0Bkkr
 fxULCzORHt4yfraN+dkTWiiB1cJY6YDaBsjb+DFiQlSr80KCMeZ29DiB3yncdQOMKHsm
 FeIM0zmju9TAVkJdBiLhkWKgbCGDO/jGAyaHham8qvL3tUn1R6b+XxInyD2tqbWKnNd/
 rk0Rq/tK86khV2fcIShlBtmVdZL3I05ffF+pWC3sbndyW+5ksxN+w9b6fkip4wHutRPF
 3f1A==
X-Gm-Message-State: AOAM533NbD5FvFT+f2p7tKo3GOeG3w5910dJZmcqpkLjt5myeENX2Sba
 r/q1hCLVZc3xAX8aPUX2K0A5+6LVA03N1g==
X-Google-Smtp-Source: ABdhPJx7S8MkwcTYvDle8pRk/J6KKf59X/nvTX9t5cyjpkwYt5oNhWLeug1Ukk75ba2KI/kkXacQSw==
X-Received: by 2002:a17:902:f684:b0:161:8b4d:adf5 with SMTP id
 l4-20020a170902f68400b001618b4dadf5mr6159456plg.112.1652766535108; 
 Mon, 16 May 2022 22:48:55 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 b12-20020a170902d88c00b0015e8d4eb1fasm8146670plz.68.2022.05.16.22.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 22:48:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 4/7] target/arm: Merge aarch64_sve_zcr_get_valid_len into
 caller
Date: Mon, 16 May 2022 22:48:47 -0700
Message-Id: <20220517054850.177016-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220517054850.177016-1-richard.henderson@linaro.org>
References: <20220517054850.177016-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 11 -----------
 target/arm/helper.c    | 30 +++++++++++-------------------
 2 files changed, 11 insertions(+), 30 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6ca0e95746..36ff843cef 100644
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
index 5fd64b742a..0308920357 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6218,40 +6218,32 @@ int sve_exception_el(CPUARMState *env, int el)
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


