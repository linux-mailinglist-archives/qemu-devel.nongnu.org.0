Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B94DA61133F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:43:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPau-0008PP-Ng; Fri, 28 Oct 2022 09:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooPan-0008Lm-35
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:40:13 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooPaj-0007rP-SN
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:40:12 -0400
Received: by mail-wr1-x433.google.com with SMTP id bs21so6650981wrb.4
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 06:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/thusHPuC/cHTeKn9J5h/MSrlwz9RjeKgKHlXo/nxr4=;
 b=v2iEATvYbuwbbm/KcbdVHAVH0oh/2S0s/TL3Hx36jqmf0ukXyftkBkjhk8l0hU8y6o
 0O/LqtQUpaWJIe8YVOEJygyhPURnFl562Kb+RrqT8zi/POS3e0q8G6RBndhc4Uy17Uoq
 lJJaIeIUgDViratBVznavGtakucgCluxluvc71zS4IYOeL5bWBnHQMANdPFvYPPjZpHQ
 BN/iF5Jz4C6Qgjv+nsV0G5aoOM9puNNcQ+348cNzdOq6KiwN7zb6GSVVSqjbvxn/T9Gm
 74E6MJRXJI6GjoYls0u0XVTqg8NQxiIAIgtXTyOybLE4eLNGXAM4s8P9iqi5KJKjCakE
 ZIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/thusHPuC/cHTeKn9J5h/MSrlwz9RjeKgKHlXo/nxr4=;
 b=u1NXkgu2RPotoghAO+GBZUDbvQXzoiQRs8REGJdzwT7WceU+BbZ7KXa1lmXnpXyZvt
 K8U1lgTmIDf98TZFoCXVQ8VHK8bkN1SaZvaXOtspG+yFd1fnpHtqiHsDZE8DH6tf3vp5
 Wt3VHtUZIVnZUeHyGDGxTYg6ZcMfxGcaFvd08fnGNybY6i21oNT8BrQwVRakhKfMWblN
 KXj4YvFhUty2eHQ4GisYTuGfkCYi5u+nxSQ1WNCLxKmDZKn4aRKT05Y1NLGJAV9EnYEK
 tO/s/RvwBSyaQVacZ97LVcuHaoF0jPtZoTXpK7woo8QElOJ4nxpF8MD5JeDtRu2Ok72L
 TbnQ==
X-Gm-Message-State: ACrzQf2go1L9b6ArI3qva+gf86NZ7JJmTj1GZeKwgK3f8KA8rv7WaWLU
 DPHpNKSMbkuMGHyhUdVPBuQ04Q==
X-Google-Smtp-Source: AMsMyM4hwevLNf2qskUDzQkbCElhs//55sxNUC0gMOPGWI0qRWA26If/1J27jAWa0xK5nLtNrYo8ng==
X-Received: by 2002:a5d:6d4e:0:b0:22c:9dfd:4159 with SMTP id
 k14-20020a5d6d4e000000b0022c9dfd4159mr34196471wri.307.1666964407780; 
 Fri, 28 Oct 2022 06:40:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a5d4110000000b002365cd93d05sm3572858wrp.102.2022.10.28.06.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 06:40:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/7] target/arm: Allow relevant HCR bits to be written for
 FEAT_EVT
Date: Fri, 28 Oct 2022 14:39:57 +0100
Message-Id: <20221028134002.730598-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028134002.730598-1-peter.maydell@linaro.org>
References: <20221028134002.730598-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
---
 target/arm/cpu.h    | 30 ++++++++++++++++++++++++++++++
 target/arm/helper.c |  7 +++++++
 2 files changed, 37 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index db9ec6a0389..ae8397481d8 100644
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
@@ -4298,6 +4318,16 @@ static inline bool isar_feature_any_ras(const ARMISARegisters *id)
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
index dd6fc30faee..8e358d32033 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5264,6 +5264,13 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         }
     }
 
+    if (cpu_isar_feature(any_half_evt, cpu)) {
+        valid_mask |= HCR_TICAB | HCR_TOCU | HCR_TID4;
+    }
+    if (cpu_isar_feature(any_evt, cpu)) {
+        valid_mask |= HCR_TTLBIS | HCR_TTLBOS | HCR_TICAB | HCR_TOCU | HCR_TID4;
+    }
+
     /* Clear RES0 bits.  */
     value &= valid_mask;
 
-- 
2.25.1


