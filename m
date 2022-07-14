Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F455753BD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 19:06:22 +0200 (CEST)
Received: from localhost ([::1]:47164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC2I9-0000bL-Ed
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 13:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oC0EW-0000pa-QF
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:54:28 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:45172)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oC0EV-0002nT-46
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:54:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657810467; x=1689346467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WhFipYl+TSpogS8hKIuOhUU01/WRbUB4Iq3S2ffW3BY=;
 b=C66G0vHAxwJNc3fcNKO98FYBOUIQEEJ5VMW0DizwlG2K4ptfoZQVFW/H
 JLTUAQY/+bOKDdQySh8N5dtu4JU396EBacSKHZyayYvlfueMZ1P/RyQH3
 /w++4ApPAcEZitKteBggxWUWJCxM8mJQPVo/eI1XTw/YBZX51gT+temEu g=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Jul 2022 07:54:26 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 07:54:26 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 07:54:26 -0700
Received: from avd-de-lrx-6.eu.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 07:54:24 -0700
From: Tobias Roehmel <quic_trohmel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <quic_trohmel@quicinc.com>
Subject: [PATCH 10/11] target/arm: Make SPSR_hyp accessible for Cortex-R52
Date: Thu, 14 Jul 2022 16:53:54 +0200
Message-ID: <20220714145355.7225-11-quic_trohmel@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714145355.7225-1-quic_trohmel@quicinc.com>
References: <20220714145355.7225-1-quic_trohmel@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=quic_trohmel@quicinc.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 14 Jul 2022 12:46:13 -0400
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

The Cortex-R52 can access SPSR_hyp from hypervisor mode
as discussed here: https://github.com/zephyrproject-rtos/zephyr/issues/47330

Signed-off-by: Tobias Röhmel <quic_trohmel@quicinc.com>
---
 target/arm/op_helper.c | 8 ++++++++
 target/arm/translate.c | 5 +++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index c5bde1cfcc..aa019bc39d 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -522,6 +522,11 @@ static void msr_mrs_banked_exc_checks(CPUARMState *env, uint32_t tgtmode,
         return;
     }
 
+    if (curmode == ARM_CPU_MODE_HYP && tgtmode == ARM_CPU_MODE_HYP
+        && arm_feature(env, ARM_FEATURE_V8_R)) {
+        return;
+    }
+
     if (curmode == tgtmode) {
         goto undef;
     }
@@ -570,6 +575,9 @@ void HELPER(msr_banked)(CPUARMState *env, uint32_t value, uint32_t tgtmode,
     switch (regno) {
     case 16: /* SPSRs */
         env->banked_spsr[bank_number(tgtmode)] = value;
+        if (arm_feature(env, ARM_FEATURE_V8_R)) {
+            env->spsr = value;
+        }
         break;
     case 17: /* ELR_Hyp */
         env->elr_el[2] = value;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6617de775f..c097f7e417 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2881,8 +2881,9 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
          * can be accessed also from Hyp mode, so forbid accesses from
          * EL0 or EL1.
          */
-        if (!arm_dc_feature(s, ARM_FEATURE_EL2) || s->current_el < 2 ||
-            (s->current_el < 3 && *regno != 17)) {
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_R)
+            && (!arm_dc_feature(s, ARM_FEATURE_EL2)
+            || s->current_el < 2 || (s->current_el < 3 && *regno != 17))) {
             goto undef;
         }
         break;
-- 
2.25.1


