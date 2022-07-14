Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DF7575392
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 19:00:01 +0200 (CEST)
Received: from localhost ([::1]:34112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC2Bz-0008Af-VB
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 12:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oC0EW-0000pB-2n
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:54:28 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:25103)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oC0ER-0002ne-CG
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:54:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657810463; x=1689346463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mHA/nDANSKO6f7f7OE+vPT+o8Wzdtzy5h+x99U0qEVs=;
 b=L/yaAYR1ZDRaM+FMN1M2R3agOZ3zSMAWCrXbVdfiy6c0IxX9ZeNS54+1
 V/sNZubwUb36b0fIIaMoC17xO7m3YjzpuQL/8Mc2f8qLRot0jlxVOTSs5
 80cQhewd4zWrX1KmU2mjofbWDRkScB0xeflzU97FVLue6tnIyD8gFWG1k M=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Jul 2022 07:54:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 07:54:22 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 07:54:22 -0700
Received: from avd-de-lrx-6.eu.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 07:54:20 -0700
From: Tobias Roehmel <quic_trohmel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <quic_trohmel@quicinc.com>
Subject: [PATCH 07/11] target/arm: Enable TTBCR_EAE for ARM_FEATURE_V8_R
Date: Thu, 14 Jul 2022 16:53:51 +0200
Message-ID: <20220714145355.7225-8-quic_trohmel@quicinc.com>
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

Enable TTBCR_EAE during reset since it's always set to 1 for Cortex-R52.
See ARM Architecture Reference Manual Supplement - ARMv8, for the ARMv8-R
AArch32 architecture profile Version:A.c section C1.2.

Signed-off-by: Tobias Röhmel <quic_trohmel@quicinc.com>
---
 target/arm/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2c26a5387d..121fc2a819 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -261,6 +261,9 @@ static void arm_cpu_reset(DeviceState *dev)
         if (arm_feature(env, ARM_FEATURE_V8_R)) {
             env->cp15.rvbar = cpu->rvbar_prop;
             env->regs[15] = cpu->rvbar_prop;
+            env->cp15.tcr_el[0].raw_tcr = TTBCR_EAE;
+            env->cp15.tcr_el[1].raw_tcr = TTBCR_EAE;
+            env->cp15.tcr_el[2].raw_tcr = TTBCR_EAE;
         }
     }
 
-- 
2.25.1


