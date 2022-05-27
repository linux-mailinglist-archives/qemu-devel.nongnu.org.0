Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6985366DC
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:18:18 +0200 (CEST)
Received: from localhost ([::1]:41950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nueXR-0002Um-Ez
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM8-00037v-NS
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:36 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:38406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM6-0001eY-6Z
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:36 -0400
Received: by mail-pf1-x42f.google.com with SMTP id h13so4947861pfq.5
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EGVyFlmh7wKKoz1QA49Gt/aTS6Se3D9So9Ttd9M1QZI=;
 b=byyfevIWfUFwc1PLTvkvdl47wLAFGDeElmVBsBRp0pUGInSLsz0Mm7IPAG4mrTAQnK
 Dj2I6TmZFSx/eT8+l50wQngJ2uyuYMzfiqubwtNnIpZ062wvyjveOAogFQQznDDKMTvc
 4L1ZCkZ7OgOBWNYDxUYGZGdV2OmsRVVGKUGAyqOOEom97xsm3aUc37JlfuZK41vHwtHo
 shhkzlyyVcPa4vwWZZnAvsUF/1SPu/+BPWT7hLCRcBg+iHP7guEFPaKGpaMnV+bB34Ak
 J6JpmJ7K3icDWne3A+zELUboqdFzRRczC42dXz6LrD2aohiOsKLAjN4NLqZNzrf67S2+
 XGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EGVyFlmh7wKKoz1QA49Gt/aTS6Se3D9So9Ttd9M1QZI=;
 b=RBSxS5AGFiiqXd9Ic+is4oOwSj1TDfvqzmAcJ1kdsE1EIas8QQL5DAV8rIBGztmPz9
 X/M6Wsut2qSGR5C3K4MjMv9ZpfnIUa0j2SBsZMfiac6bK40UEVoEevRpkeDzzDYTrWIK
 oPwDwHq5AUT8HzvWoHtGum2z99h8WysN04D6BIS8cPgyILGgQYOl1CVQ9E8jj6Ma1thz
 njwDGjJt/ud+bz1480haNNOL2/rWHBBteAxHUiyobBqJwOcVjxsiLxLL52InvX7xhfZp
 Q1+VKdSqQAHnllTJKdIbrE7VWgx6viVyxjkMFQtckYEL60oAI2BteFGgJkIlRihZlJZ5
 6qKA==
X-Gm-Message-State: AOAM5335d8GwvoncJvFtqJHe6Prwm3ywjRSwzkwt8+dwsk+N/q5kBLQ9
 DomXoFezqh/U1u/DvqlAfuUtxxEzX1BqiA==
X-Google-Smtp-Source: ABdhPJzAEJmDJbY3fMTNbbdzxjVXDxCR/1rLIQXmrXJ45OEr6WdgRuUFb6YODPeX8QVGILQnsYHkpA==
X-Received: by 2002:a65:4685:0:b0:3da:eb4e:61ed with SMTP id
 h5-20020a654685000000b003daeb4e61edmr37443709pgr.591.1653674791806; 
 Fri, 27 May 2022 11:06:31 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 08/15] target/arm: Add el_is_in_host
Date: Fri, 27 May 2022 11:06:16 -0700
Message-Id: <20220527180623.185261-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527180623.185261-1-richard.henderson@linaro.org>
References: <20220527180623.185261-1-richard.henderson@linaro.org>
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

This (newish) ARM pseudocode function is easier to work with
than open-coded tests for HCR_E2H etc.  Use of the function
will be staged into the code base in parts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  2 ++
 target/arm/helper.c    | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index b587901be1..008e377887 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1295,6 +1295,8 @@ static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
 void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 #endif
 
+bool el_is_in_host(CPUARMState *env, int el);
+
 void aa32_max_features(ARMCPU *cpu);
 bool arm_singlestep_active(CPUARMState *env);
 bool arm_generate_debug_exceptions(CPUARMState *env, int cur_el);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cd0a8992ba..d1b6c2459b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5288,6 +5288,34 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
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
2.34.1


