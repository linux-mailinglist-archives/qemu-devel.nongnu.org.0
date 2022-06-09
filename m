Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D42544991
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:59:23 +0200 (CEST)
Received: from localhost ([::1]:50852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzFso-0000M6-8s
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7j-0001oY-Qd
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:40 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7U-000638-17
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:39 -0400
Received: by mail-wm1-x331.google.com with SMTP id z17so7275188wmi.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OrRqWRQp9nOhwyO9OA3TSRIbMZMtkcOgDSH8VMFZG2E=;
 b=SxV8Gfp4Wp7VVIZr1yL5BVHOPT6Ya4UDxFBBrDHQugd19quJmIS0Vpk4f5+KRahsix
 gW2p/+C2ywCZzUVbx2+K07xciYAujlijQwd30zlw4jDZkkmqDq1yrfvRvddB1g2YB8uz
 L9NKIxGZ1pyz54Y9J3RSOVVDhy73KUu+QI+bLikJ7bx1d9BQPTNBIuWVwnQVEgSXJxYM
 64IdaARQw0MPXKkz9+f7yoTm1oZekOxq0st5KIP39QM+CHXeP9uqtEr4AB3NRbQGwuZ5
 c08vT8h4x0DpWdmJsHhS/Bc+CSOK0fjFKz5Ru7dOP8pbwt9amTK+L6yS4pSNYr/nSW1t
 2xLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OrRqWRQp9nOhwyO9OA3TSRIbMZMtkcOgDSH8VMFZG2E=;
 b=nlF981IbsNvQ+UCxwF688XjqQuqoDq96lzw0EvlVpCYEfc29djuWDSIFm/YfJkPYQX
 hl0TWj/i7mG0iV/HGzrdQe4LWqZbDhnHpfVUp/RqdO6r00gDAJv9b4jtX85I7wWV6mEv
 0RGgfvKWJMvt4R5FegGn2I+AfVMe8BDiATEb0W2FBgr5znwzQS+n8n5xLHEZ2BI1K0rb
 FSwhN2UyCIAY0ncAkuGVRyOs9+IQEkV13EN7v2+3gJC+/2tt2IOjVsr/Q5TVNJmn11o5
 LmzcC8pwlXATWz5+PXTCFGw1adbxdzrImTLFW+hDKy2ryiInltN74up4n7o2ZV0Uwv3b
 AaMg==
X-Gm-Message-State: AOAM532GY1JrEhBs3aVPWUTY/s9YzSkXFZq9QNpo8/KDuQ+tjIWFWhpP
 N1kbQIgMHUST2APNYfxPUMo1Gifu5Ilwjw==
X-Google-Smtp-Source: ABdhPJwBlrpQkFdcSqO4Y9kyjrZDqA8FxG9KL6L3pQuKxKScmEQH/bHrbYQP161+lOfhX7mr/j4yRg==
X-Received: by 2002:a05:600c:3845:b0:39c:6ea9:ed34 with SMTP id
 s5-20020a05600c384500b0039c6ea9ed34mr1403163wmr.175.1654765583187; 
 Thu, 09 Jun 2022 02:06:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/55] target/arm: Add el_is_in_host
Date: Thu,  9 Jun 2022 10:05:22 +0100
Message-Id: <20220609090537.1971756-41-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This (newish) ARM pseudocode function is easier to work with
than open-coded tests for HCR_E2H etc.  Use of the function
will be staged into the code base in parts.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220607203306.657998-6-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h |  2 ++
 target/arm/helper.c    | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1d83146d565..ceaddcbfd6e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1347,6 +1347,8 @@ static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
 void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 #endif
 
+bool el_is_in_host(CPUARMState *env, int el);
+
 void aa32_max_features(ARMCPU *cpu);
 
 #endif
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4f4044c688d..322508170e3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5282,6 +5282,34 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
     return ret;
 }
 
+/*
+ * Corresponds to ARM pseudocode function ELIsInHost().
+ */
+bool el_is_in_host(CPUARMState *env, int el)
+{
+    uint64_t mask;
+
+    /*
+     * Since we only care about E2H and TGE, we can skip arm_hcr_el2_eff().
+     * Perform the simplest bit tests first, and validate EL2 afterward.
+     */
+    if (el & 1) {
+        return false; /* EL1 or EL3 */
+    }
+
+    /*
+     * Note that hcr_write() checks isar_feature_aa64_vh(),
+     * aka HaveVirtHostExt(), in allowing HCR_E2H to be set.
+     */
+    mask = el ? HCR_E2H : HCR_E2H | HCR_TGE;
+    if ((env->cp15.hcr_el2 & mask) != mask) {
+        return false;
+    }
+
+    /* TGE and/or E2H set: double check those bits are currently legal. */
+    return arm_is_el2_enabled(env) && arm_el_is_aa64(env, 2);
+}
+
 static void hcrx_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
-- 
2.25.1


