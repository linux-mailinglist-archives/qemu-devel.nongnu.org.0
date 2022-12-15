Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CE364DC4A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:32:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ngy-0006nz-HM; Thu, 15 Dec 2022 07:50:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngv-0006jn-Cx
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:25 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngt-00047M-DA
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:25 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so1632598wma.1
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uupKhb0u/oKN7bGek/c6f+4vzO/X9cJUo24FKyvg7uE=;
 b=GafXR0H62DHoizKAMC6X6O5jzyBN5SU1Xt+wW1YuMwA+Vo3LsoRKWXuTUIrScP2o9s
 F164/qg2JBiIm10NI9zw28kW5bC/AX3mqgJI+IImUio6+wxT8bP9VUXYePOYPVyvWZPn
 WjgvR7t8J10zYPKa14cnubKAmSoi1EY9xETTS3Z48JxLY/qQF41cDg2cZNZ0Z4Pse+hw
 PEHePgCVpXrbweHU4Bdgu4NRJxfuJ7e8Oz16+qj74Qu6Y7zbbTTzWwy8IVrxBS1OON1v
 njZ/9jxgiMw3qL0SFpZevIP+qAEy3bmF1Zv+5wVjYVfAu6Xhvz3SVSy5xJRD0p0W7H3x
 cmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uupKhb0u/oKN7bGek/c6f+4vzO/X9cJUo24FKyvg7uE=;
 b=R4UcOwbtcrNZl73gbhVKhtEuJqu69ex6ZugdMrqAcrpAGFFMd2jJQ3PKetxNt4UdnG
 JqhvEu8E76RGNPWnAen8gmZ7KlYNKANtDkP68aiKQF/JTiKlLS5wqTFPTJgQvUeMGPWV
 tursAHGdDuO5Y9MIi7GVN9sS5P98js6uLOf786Bqu4swEs3jxkSRVVkv0k4YgbEIrnyC
 u24soAO59cg1mPWLCpOLjY8c84KIJJj5hvIa1aodFvcMMdJUgL9nC3uYV1UrvtxppOGs
 M4M2+HcB1Qub++s3kGrEjQwp8ROgNgDJ6Lo3n3QpARy/ijs+hX5Syuq1cCVsesXN/3sW
 ExCw==
X-Gm-Message-State: ANoB5pmqHrCmAurDR/xZpntu0qAi4pPBrF/Bn+7OMSFPFQSiI6Z4/iSH
 F1l4mpXDZoMQgzzkalIVKe2fnQIxUPoCOpa4
X-Google-Smtp-Source: AA0mqf4thmjTOcRIfHH95n7Nmb3moD5pD/Q6wjYr7wS2rbE6PZmWWn2zWkPMscpVzU6+/pbLvoa0lQ==
X-Received: by 2002:a05:600c:1e86:b0:3cf:81af:8b73 with SMTP id
 be6-20020a05600c1e8600b003cf81af8b73mr21821896wmb.23.1671108622170; 
 Thu, 15 Dec 2022 04:50:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/29] target/arm: Allow relevant HCR bits to be written for
 FEAT_EVT
Date: Thu, 15 Dec 2022 12:49:51 +0000
Message-Id: <20221215125009.980128-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

FEAT_EVT adds five new bits to the HCR_EL2 register: TTLBIS, TTLBOS,
TICAB, TOCU and TID4.  These allow the guest to enable trapping of
various EL1 instructions to EL2.  In this commit, add the necessary
code to allow the guest to set these bits if the feature is present;
because the bit is always zero when the feature isn't present we
won't need to use explicit feature checks in the "trap on condition"
tests in the following commits.

Note that although full implementation of the feature (mandatory from
Armv8.5 onward) requires all five trap bits, the ID registers permit
a value indicating that only TICAB, TOCU and TID4 are implemented,
which might be the case for CPUs between Armv8.2 and Armv8.5.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 30 ++++++++++++++++++++++++++++++
 target/arm/helper.c |  6 ++++++
 2 files changed, 36 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9aeed3c8481..2b4bd20f9d0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3757,6 +3757,16 @@ static inline bool isar_feature_aa32_tts2uxn(const ARMISARegisters *id)
     return FIELD_EX32(id->id_mmfr4, ID_MMFR4, XNX) != 0;
 }
 
+static inline bool isar_feature_aa32_half_evt(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_mmfr4, ID_MMFR4, EVT) >= 1;
+}
+
+static inline bool isar_feature_aa32_evt(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_mmfr4, ID_MMFR4, EVT) >= 2;
+}
+
 static inline bool isar_feature_aa32_dit(const ARMISARegisters *id)
 {
     return FIELD_EX32(id->id_pfr0, ID_PFR0, DIT) != 0;
@@ -4029,6 +4039,16 @@ static inline bool isar_feature_aa64_ids(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, IDS) != 0;
 }
 
+static inline bool isar_feature_aa64_half_evt(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, EVT) >= 1;
+}
+
+static inline bool isar_feature_aa64_evt(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, EVT) >= 2;
+}
+
 static inline bool isar_feature_aa64_bti(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) != 0;
@@ -4313,6 +4333,16 @@ static inline bool isar_feature_any_ras(const ARMISARegisters *id)
     return isar_feature_aa64_ras(id) || isar_feature_aa32_ras(id);
 }
 
+static inline bool isar_feature_any_half_evt(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_half_evt(id) || isar_feature_aa32_half_evt(id);
+}
+
+static inline bool isar_feature_any_evt(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_evt(id) || isar_feature_aa32_evt(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d8c8223ec38..751c360ce45 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5267,6 +5267,12 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         }
     }
 
+    if (cpu_isar_feature(any_evt, cpu)) {
+        valid_mask |= HCR_TTLBIS | HCR_TTLBOS | HCR_TICAB | HCR_TOCU | HCR_TID4;
+    } else if (cpu_isar_feature(any_half_evt, cpu)) {
+        valid_mask |= HCR_TICAB | HCR_TOCU | HCR_TID4;
+    }
+
     /* Clear RES0 bits.  */
     value &= valid_mask;
 
-- 
2.25.1


