Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B0A578164
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 13:57:51 +0200 (CEST)
Received: from localhost ([::1]:55110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDPNm-0007Lg-Dk
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 07:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oDPL3-0001au-07
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:55:01 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:41168)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oDPL1-0006Aj-9t
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1658145299; x=1689681299;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8nOYtLg5Jy2sttae4V+uWElgxSmPH5mKbfYxmvQxdjo=;
 b=t7EBt59edtqKgH7kRV9/RbC2aEGpMEHDbMwU9Xome5ilNUA2NUdTRGqz
 oBevkzQgnsxmsOXZ/c3O0siJj8MxaKhxvimzydbcM1Mj8Xa+vEiHQ2gSW
 HZmWJEUSSyV5tzPGSoXyTJXJWlhMgDnoMw/yTo/QlsNpYG7d5dF8TKE5c s=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 18 Jul 2022 04:54:58 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 04:54:57 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 18 Jul 2022 04:54:57 -0700
Received: from avd-de-lrx-6.eu.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 18 Jul 2022 04:54:56 -0700
From: Tobias Roehmel <quic_trohmel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <quic_trohmel@quicinc.com>
Subject: [PATCH v2 6/9] target/arm: Enable TTBCR_EAE for ARMv8-R AArch32
Date: Mon, 18 Jul 2022 13:54:30 +0200
Message-ID: <20220718115433.802-7-quic_trohmel@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718115433.802-1-quic_trohmel@quicinc.com>
References: <20220718115433.802-1-quic_trohmel@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Received-SPF: pass client-ip=129.46.98.28;
 envelope-from=quic_trohmel@quicinc.com; helo=alexa-out.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Tobias Röhmel <quic_trohmel@quicinc.com>

ARMv8-R AArch32 CPUs behave as if TTBCR.EAE is always 1 even
tough they don't have the TTBCR register.
See ARM Architecture Reference Manual Supplement - ARMv8, for the ARMv8-R
AArch32 architecture profile Version:A.c section C1.2.

Signed-off-by: Tobias Röhmel <quic_trohmel@quicinc.com>
---
 target/arm/debug_helper.c | 3 ++-
 target/arm/internals.h    | 3 ++-
 target/arm/tlb_helper.c   | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index b18a6bd3a2..44b1e32974 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -434,7 +434,8 @@ static uint32_t arm_debug_exception_fsr(CPUARMState *env)
         using_lpae = true;
     } else {
         if (arm_feature(env, ARM_FEATURE_LPAE) &&
-            (env->cp15.tcr_el[target_el].raw_tcr & TTBCR_EAE)) {
+            ((env->cp15.tcr_el[target_el].raw_tcr & TTBCR_EAE)
+            || arm_feature(env, ARM_FEATURE_V8_R))) {
             using_lpae = true;
         }
     }
diff --git a/target/arm/internals.h b/target/arm/internals.h
index b03049d920..e2a2b03d41 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -254,7 +254,8 @@ static inline bool extended_addresses_enabled(CPUARMState *env)
 {
     TCR *tcr = &env->cp15.tcr_el[arm_is_secure(env) ? 3 : 1];
     return arm_el_is_aa64(env, 1) ||
-           (arm_feature(env, ARM_FEATURE_LPAE) && (tcr->raw_tcr & TTBCR_EAE));
+           (arm_feature(env, ARM_FEATURE_LPAE) && ((tcr->raw_tcr & TTBCR_EAE)
+           || arm_feature(env, ARM_FEATURE_V8_R)));
 }
 
 /* Update a QEMU watchpoint based on the information the guest has set in the
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 7d8a86b3c4..891326edb8 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -20,7 +20,8 @@ bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
         return true;
     }
     if (arm_feature(env, ARM_FEATURE_LPAE)
-        && (regime_tcr(env, mmu_idx)->raw_tcr & TTBCR_EAE)) {
+        && ((regime_tcr(env, mmu_idx)->raw_tcr & TTBCR_EAE)
+        || arm_feature(env, ARM_FEATURE_V8_R))) {
         return true;
     }
     return false;
-- 
2.25.1


