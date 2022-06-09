Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EDE544873
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:14:42 +0200 (CEST)
Received: from localhost ([::1]:33826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzFBZ-0008Rd-VK
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7a-0001fC-OE
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:31 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:44678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7Z-00068P-4T
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:30 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 m32-20020a05600c3b2000b0039756bb41f2so12273407wms.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PRXhDDaF6nWlyfN7Oj+HymEa8eenhGrZqsYAZ8IODjs=;
 b=fffEUXh/hJhdqrF8+T1jEgSi9J+q5yChQeC/OqTRpmM4N8M+grQe6+yIRPW70ArkSK
 IwEK336e8n8lRdpWpByvEnqZtY6N982J0rfuF0nmJiQ3OxRN2wwsa4B0X0pEGzBeJ8rr
 P/jy62ELv96VdWew9N8HeT9zy/RtHx6I8Z93DAa31xigxUts1CpAyCLeJcUk0nLbMKp2
 yvnVWxEryN534kZDNgz4tHkZE6UTBT21fOM5QfLWeyiQOndzbXW757doMbiPLO79J+eK
 sbmHYv51GWjoaUs7JMOBo2GkADQuJlh2HzaCNGVA/mVOYGwWRy29ug9ZsfyZHyUi0orE
 5/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PRXhDDaF6nWlyfN7Oj+HymEa8eenhGrZqsYAZ8IODjs=;
 b=m/Gjxvi0Zl18af9NTiyBipL/haC/NN2q83j+VP1M/9hhmHREFZtriYQXPH47ussaXT
 7Q0evKiI6VOG+ytRkTMu9Ssv1euVOydLizCqzaB4+VPgzZR8GpsdJfVpGM9Xexk4z13t
 tSLaf3QEnu+BZiVI6P2Vsk7nbuq/5PXIFLCLdNB2lq2XVDoZZitPlVIhO+LWJfjXY9ZQ
 vLZXmJkfKB5YmSoz9YEkGOD1uQ46p+3uTpx5d/w0vJvY3W2ZdsI0gKyLW5TuAEdN9+VY
 F4wqJMIJ+MgjnrSc4SgO8ulXL4Jwh1L/pgQ+QHR+d6Mf52NBzL0bopQzy/ZRIo+XdDxQ
 cOSA==
X-Gm-Message-State: AOAM5328pEs5wIYPZcCzhPFw3hWI6ivJi13Fhj9uBUokEETUenE7j4br
 fqp3H8FVmy2hF+fG+mT6vhIh+hPwvjt/ng==
X-Google-Smtp-Source: ABdhPJxbCqo1zXudXQ4p1HZNo+SegygV99HBriVtzoyf8cb9RibpYpoHAA0+lOV2XSCSr8dXWni4xA==
X-Received: by 2002:a7b:ce8c:0:b0:39c:5bf4:abc0 with SMTP id
 q12-20020a7bce8c000000b0039c5bf4abc0mr2225808wmj.135.1654765587745; 
 Thu, 09 Jun 2022 02:06:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 45/55] target/arm: Merge aarch64_sve_zcr_get_valid_len into
 caller
Date: Thu,  9 Jun 2022 10:05:27 +0100
Message-Id: <20220609090537.1971756-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

This function is used only once, and will need modification
for Streaming SVE mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220607203306.657998-11-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 11 -----------
 target/arm/helper.c    | 30 +++++++++++-------------------
 2 files changed, 11 insertions(+), 30 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index ceaddcbfd6e..79eb4637538 100644
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
index 61e8026d0e3..de159c644cd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6212,39 +6212,31 @@ int sve_exception_el(CPUARMState *env, int el)
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
2.25.1


