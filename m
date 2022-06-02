Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F47453C0A3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:10:11 +0200 (CEST)
Received: from localhost ([::1]:58846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwt18-0000b7-8a
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgn-0004ec-6g
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:09 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:36649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgj-00005A-MQ
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:08 -0400
Received: by mail-pf1-x42f.google.com with SMTP id 15so5806471pfy.3
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wdmw1yZnvA+hHeQ/W/SOHIyofz1vGsnPTS9QtN7as88=;
 b=yrBi8/HOIzwuYuwb3tsIBKPlLlv4ge6+TAx7ctt8P+ZhZyKbL87/APHr8HDXPfRftX
 O9ogNZKIXwn52SyHNdaoui/53O1zN3zB0V2ZRK+hxU7NtZzrNgvuSgtXiclMviy4JR8n
 k+VSn+EHwsrrbtePViwGaia+noLkrQKj9pXHfqlSvwaNObjhN9F5zPL9SzZCBgav9Xdi
 PhUCc7wDlsQ7BXEP8NSF9Rl+tvRYM0CxjrP/4vx278HnFf3Z4GRuj+lloneqSHBoZWDW
 Kh8uH+5HHn5WCDNfxTf6SZJenJTr1JI/pMboTWvnDR7IKo63CpdtOkTdlO9bOilm9Ct/
 rRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wdmw1yZnvA+hHeQ/W/SOHIyofz1vGsnPTS9QtN7as88=;
 b=z0U8qdfi0Gilnu04cRVxE4c/AA2XIUsIcOjnMRs46ju7adNzG4Ec79WMI2N8UmNhiw
 fZaLAj8DAP1mmqYwgIbH7ofyn6EquTEtG61sLzlrNG4pdB2up6c3xnS8jxBHBrHouUwm
 i7eB1anFP5Uo2f46aANqWA0dckkMxCvewUpljigK/+A16f76xl3iCNB7/xJc51bXkrHe
 ntV1NKNXDsB2quuNurzaURA813DJFZ7o+ggZT22edCE1w3dPmz7GIupZ1SXFE28d235Z
 h8JIpn8K3fVcuXAaavDupXdPnitAbKqYlsDqTapCanYXjqeTKxoIZV3Qj5aarwPowsK8
 cTug==
X-Gm-Message-State: AOAM5328XiTpproXhZNto/B2w6E95jHcAcmpEDT/UfhWQS364zuI9cfH
 zg70Aie4wiogljZFj+nSP4D6C2gs8o27Gw==
X-Google-Smtp-Source: ABdhPJyuPQwHUF3H0CtB8Zs4+nfFa9bZcrPG4Kz/nlLbbO6s3OjtbBWmn3QRjWTLaadmHkMMNlE9pw==
X-Received: by 2002:a63:91ca:0:b0:3fc:9077:c7c7 with SMTP id
 l193-20020a6391ca000000b003fc9077c7c7mr6000905pge.201.1654206543279; 
 Thu, 02 Jun 2022 14:49:03 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 10/71] target/arm: Merge aarch64_sve_zcr_get_valid_len into
 caller
Date: Thu,  2 Jun 2022 14:47:52 -0700
Message-Id: <20220602214853.496211-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


