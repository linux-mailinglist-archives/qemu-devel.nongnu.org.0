Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39938578178
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 14:02:28 +0200 (CEST)
Received: from localhost ([::1]:33344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDPSF-0003ne-CS
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 08:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oDPL2-0001at-Js
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:55:01 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:1903)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oDPL0-0006AV-Df
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1658145298; x=1689681298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9iMmXkp15BF2ELIjH4bO5J3OaLwLhYbO/G4uvh1e78I=;
 b=TOfV8IAmHNfvPTHxNJJOBd+gslZs8lqA94qrm05zEJYiSF4bPMVT0WEz
 Nag41wtYiDpm8CWXtS7j+TJVMq+v8Vc5DUL+2cpVNcYoqBCVYWlBchC7c
 Z5HFbQh6KDQB+WpfB0+ZSoWrHv9zHP1aDpGZMru8dvkrk9xpTiwWBUEBF o=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 18 Jul 2022 04:54:53 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 04:54:52 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 18 Jul 2022 04:54:52 -0700
Received: from avd-de-lrx-6.eu.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 18 Jul 2022 04:54:51 -0700
From: Tobias Roehmel <quic_trohmel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <quic_trohmel@quicinc.com>
Subject: [PATCH v2 2/9] target/arm: Don't add all MIDR aliases for Cortex-R
Date: Mon, 18 Jul 2022 13:54:26 +0200
Message-ID: <20220718115433.802-3-quic_trohmel@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718115433.802-1-quic_trohmel@quicinc.com>
References: <20220718115433.802-1-quic_trohmel@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=quic_trohmel@quicinc.com; helo=alexa-out-sd-02.qualcomm.com
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

Cortex-R52 has the MPUIR register which has the same encoding
has the MIDR alias with opc2=4. So we only add that alias
when we are not realizing a Cortex-R.

Signed-off-by: Tobias Röhmel <quic_trohmel@quicinc.com>
---
 target/arm/helper.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6457e6301c..03bdc3d149 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8189,9 +8189,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .fieldoffset = offsetof(CPUARMState, cp15.c0_cpuid),
               .readfn = midr_read },
             /* crn = 0 op1 = 0 crm = 0 op2 = 4,7 : AArch32 aliases of MIDR */
-            { .name = "MIDR", .type = ARM_CP_ALIAS | ARM_CP_CONST,
-              .cp = 15, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 4,
-              .access = PL1_R, .resetvalue = cpu->midr },
             { .name = "MIDR", .type = ARM_CP_ALIAS | ARM_CP_CONST,
               .cp = 15, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 7,
               .access = PL1_R, .resetvalue = cpu->midr },
@@ -8201,6 +8198,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .accessfn = access_aa64_tid1,
               .type = ARM_CP_CONST, .resetvalue = cpu->revidr },
         };
+        ARMCPRegInfo id_v8_midr_alias_cp_reginfo[] = {
+            { .name = "MIDR", .type = ARM_CP_ALIAS | ARM_CP_CONST,
+              .cp = 15, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 4,
+              .access = PL1_R, .resetvalue = cpu->midr },
+        };
         ARMCPRegInfo id_cp_reginfo[] = {
             /* These are common to v8 and pre-v8 */
             { .name = "CTR",
@@ -8264,8 +8266,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             id_mpuir_reginfo.access = PL1_RW;
             id_tlbtr_reginfo.access = PL1_RW;
         }
+
         if (arm_feature(env, ARM_FEATURE_V8)) {
             define_arm_cp_regs(cpu, id_v8_midr_cp_reginfo);
+            if (!arm_feature(env, ARM_FEATURE_V8_R)) {
+                define_arm_cp_regs(cpu, id_v8_midr_alias_cp_reginfo);
+            }
         } else {
             define_arm_cp_regs(cpu, id_pre_v8_midr_cp_reginfo);
         }
-- 
2.25.1


