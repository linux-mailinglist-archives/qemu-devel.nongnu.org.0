Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 678DF575175
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 17:10:52 +0200 (CEST)
Received: from localhost ([::1]:44918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC0UN-0001Hx-Ej
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 11:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oC0KL-0005ol-FA
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:00:29 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:32949)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oC0KI-0007ZA-Ru
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:00:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657810827; x=1689346827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qWj0N60MwxAdxvJV2+cY4KbK5kqSKODWxUDkbwn8t3c=;
 b=ilMW+8/QLzLWGCWM3T98UV/3dOiTJaHjfrCM8m7waOuTecQFfWtXti+d
 LEqRccG15+rhX6UR8Qw+r1sXR16IP3vCm83A5UxIk9MhI0/9EjXIbWBNm
 S7ZUl4t3fgfj7bFgpFX0kHc7GHJl83HRxXw5ywvkDlI/byW0cOcQ9p3+6 E=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 14 Jul 2022 07:54:18 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 07:54:18 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 07:54:18 -0700
Received: from avd-de-lrx-6.eu.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 07:54:16 -0700
From: Tobias Roehmel <quic_trohmel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <quic_trohmel@quicinc.com>
Subject: [PATCH 04/11] target/arm: Make RVBAR available for non AARCH64 CPUs
Date: Thu, 14 Jul 2022 16:53:48 +0200
Message-ID: <20220714145355.7225-5-quic_trohmel@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714145355.7225-1-quic_trohmel@quicinc.com>
References: <20220714145355.7225-1-quic_trohmel@quicinc.com>
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

The ARM Cortex-R52 is not AARCH64 but uses RVBAR.

Signed-off-by: Tobias Röhmel <quic_trohmel@quicinc.com>
---
 target/arm/cpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1b5d535788..2c26a5387d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -258,6 +258,10 @@ static void arm_cpu_reset(DeviceState *dev)
         env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
                                          CPACR, CP11, 3);
 #endif
+        if (arm_feature(env, ARM_FEATURE_V8_R)) {
+            env->cp15.rvbar = cpu->rvbar_prop;
+            env->regs[15] = cpu->rvbar_prop;
+        }
     }
 
 #if defined(CONFIG_USER_ONLY)
@@ -1273,7 +1277,8 @@ void arm_cpu_post_init(Object *obj)
         qdev_property_add_static(DEVICE(obj), &arm_cpu_reset_hivecs_property);
     }
 
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) ||
+        arm_feature(&cpu->env, ARM_FEATURE_V8_R)) {
         object_property_add_uint64_ptr(obj, "rvbar",
                                        &cpu->rvbar_prop,
                                        OBJ_PROP_FLAG_READWRITE);
-- 
2.25.1


