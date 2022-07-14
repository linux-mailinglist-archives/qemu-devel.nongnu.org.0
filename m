Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA81574F4E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 15:37:52 +0200 (CEST)
Received: from localhost ([::1]:58960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBz2N-0003RI-Gd
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 09:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByoG-0002P4-Eu
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:23:16 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByoE-0004r7-KQ
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:23:16 -0400
Received: by mail-wr1-x432.google.com with SMTP id h17so2615480wrx.0
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 06:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zah1h9cYjHaav0SyBc/T7cche/sTMGE+QsjhBy4+l4c=;
 b=QT3Qjpb+nlLUtIoH5rQOnEQAyHNy4wvxkMYAd0nRGkOvdL/dDtVqs6cf7xf+KAw1fI
 zbjp91j+jyI/YGN904df0zfgel7YSPcbud5SsZ1muj2fRrqmzRDD+2Re31KuOuM8E0Bk
 VO95wrw5vLOPZgoAYjDyOcKUfP7xmmTRK+4RyLmkvy81NEfFx1IW+qI8eR38T5y62pZq
 c15EtMMFIA259jTJs7jpV3ftq9eRDFA6Dk+FvGfV93HwUeSrfQcQrGn0QGHY5KT2ehVA
 cHyMcBFxoQ9J6B3+KxhWZiDdsfnIjWZbpf5881kxIPEnFCSkgE+VJOOSerSE85j7+lMw
 j6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zah1h9cYjHaav0SyBc/T7cche/sTMGE+QsjhBy4+l4c=;
 b=PDwYMMVvHFR9byw4/bllNkGHBoXko7UZJp+KEHsc4oW0s9S8g+MLTEOHKK05trLAuk
 fDgM64EoWNkTpSRrUp4jABDUYPdwMTAenFJDeh0TJXPt/K/9Ld4xH/DutKToc0tfHyG3
 H0a3avy3u48wvf0gM9XmRCdrQox0Uyy0BeII/RFGeorU5tYA2QxANRf7oimDbwK6vwUJ
 EndJZi3X0g+En36rq/o89Mra4XvjQ8ckZqmsOC+sLwkAyU3iYr0MbAWfwYVJvv+4V22r
 /E6VweLLjU36yppr2SpYFDYOKnXLUpHsQ4vM/SPxxEMzVz2fAag+iHb3A15Iry/YKrPI
 R6rQ==
X-Gm-Message-State: AJIora9XsdMB+0V9Z/XADl7ZK9V87PgaKLpdtlmIQW4+KPWlhjhqzGJK
 cCpUQNBmda5ZEGb3AIVjVR+rKA==
X-Google-Smtp-Source: AGRyM1uKy6I+a6N8DD1CQ1kYIG0RqzhEdWCuBIwWmbXJC3y6qghHiJzgM7S1yn00SMShEp7FIfaiRQ==
X-Received: by 2002:a5d:5989:0:b0:21d:b2bd:d712 with SMTP id
 n9-20020a5d5989000000b0021db2bdd712mr8557460wri.698.1657804992250; 
 Thu, 14 Jul 2022 06:23:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a7bc40b000000b0039c5cecf206sm1925079wmi.4.2022.07.14.06.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 06:23:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PATCH 7/7] target/arm: Honour VTCR_EL2 bits in Secure EL2
Date: Thu, 14 Jul 2022 14:23:03 +0100
Message-Id: <20220714132303.1287193-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714132303.1287193-1-peter.maydell@linaro.org>
References: <20220714132303.1287193-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

In regime_tcr() we return the appropriate TCR register for the
translation regime.  For Secure EL2, we return the VSTCR_EL2 value,
but in this translation regime some fields that control behaviour are
in VTCR_EL2.  When this code was originally written (as the comment
notes), QEMU didn't care about any of those fields, but we have since
added support for features such as LPA2 which do need the values from
those fields.

Synthesize a TCR value by merging in the relevant VTCR_EL2 fields to
the VSTCR_EL2 value.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1103
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       | 19 +++++++++++++++++++
 target/arm/internals.h | 22 +++++++++++++++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bbd1afa6251..57b5dd1f70b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1412,6 +1412,25 @@ FIELD(CPTR_EL3, TCPAC, 31, 1)
 #define TTBCR_SH1    (1U << 28)
 #define TTBCR_EAE    (1U << 31)
 
+FIELD(VTCR, T0SZ, 0, 6)
+FIELD(VTCR, SL0, 6, 2)
+FIELD(VTCR, IRGN0, 8, 2)
+FIELD(VTCR, ORGN0, 10, 2)
+FIELD(VTCR, SH0, 12, 2)
+FIELD(VTCR, TG0, 14, 2)
+FIELD(VTCR, PS, 16, 3)
+FIELD(VTCR, VS, 19, 1)
+FIELD(VTCR, HA, 21, 1)
+FIELD(VTCR, HD, 22, 1)
+FIELD(VTCR, HWU59, 25, 1)
+FIELD(VTCR, HWU60, 26, 1)
+FIELD(VTCR, HWU61, 27, 1)
+FIELD(VTCR, HWU62, 28, 1)
+FIELD(VTCR, NSW, 29, 1)
+FIELD(VTCR, NSA, 30, 1)
+FIELD(VTCR, DS, 32, 1)
+FIELD(VTCR, SL2, 33, 1)
+
 /* Bit definitions for ARMv8 SPSR (PSTATE) format.
  * Only these are valid when in AArch64 mode; in
  * AArch32 mode SPSRs are basically CPSR-format.
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 742135ef146..b8fefdff675 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -777,6 +777,16 @@ static inline uint64_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
     return env->cp15.sctlr_el[regime_el(env, mmu_idx)];
 }
 
+/*
+ * These are the fields in VTCR_EL2 which affect both the Secure stage 2
+ * and the Non-Secure stage 2 translation regimes (and hence which are
+ * not present in VSTCR_EL2).
+ */
+#define VTCR_SHARED_FIELD_MASK \
+    (R_VTCR_IRGN0_MASK | R_VTCR_ORGN0_MASK | R_VTCR_SH0_MASK | \
+     R_VTCR_PS_MASK | R_VTCR_VS_MASK | R_VTCR_HA_MASK | R_VTCR_HD_MASK | \
+     R_VTCR_DS_MASK)
+
 /* Return the value of the TCR controlling this translation regime */
 static inline uint64_t regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
@@ -785,10 +795,16 @@ static inline uint64_t regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
     if (mmu_idx == ARMMMUIdx_Stage2_S) {
         /*
-         * Note: Secure stage 2 nominally shares fields from VTCR_EL2, but
-         * those are not currently used by QEMU, so just return VSTCR_EL2.
+         * Secure stage 2 shares fields from VTCR_EL2. We merge those
+         * in with the VSTCR_EL2 value to synthesize a single VTCR_EL2 format
+         * value so the callers don't need to special case this.
+         *
+         * If a future architecture change defines bits in VSTCR_EL2 that
+         * overlap with these VTCR_EL2 fields we may need to revisit this.
          */
-        return env->cp15.vstcr_el2;
+        uint64_t v = env->cp15.vstcr_el2 & ~VTCR_SHARED_FIELD_MASK;
+        v |= env->cp15.vtcr_el2 & VTCR_SHARED_FIELD_MASK;
+        return v;
     }
     return env->cp15.tcr_el[regime_el(env, mmu_idx)];
 }
-- 
2.25.1


