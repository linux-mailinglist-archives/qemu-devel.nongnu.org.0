Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 226F857515F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 17:03:49 +0200 (CEST)
Received: from localhost ([::1]:33034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC0NY-0001N9-4B
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 11:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oC0KK-0005nO-Bd
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:00:28 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:32505)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oC0KF-0007Z4-BB
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:00:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657810823; x=1689346823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j6hZ0WNJZLcfk4eENbwZVIjSq1eQDNaDZEXP7hNxr2c=;
 b=iGqrFinsJNb7WtMFrMeSmcSvIiOHA81M7LKpfcwtvbZNh3E/9rXxjvbb
 BlW8uqrCu+wlv1Mh6pPLWLAv5ae3hpMlyJ1e8agBAaYo3Rde/p8TdHS8b
 pYF+p73Ui2V73IjrJW/KSk3D3I4gsG6aGJNfJOV3A4nwWol/zP7ctAYFs M=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 14 Jul 2022 07:54:14 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 07:54:14 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 07:54:14 -0700
Received: from avd-de-lrx-6.eu.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 07:54:13 -0700
From: Tobias Roehmel <quic_trohmel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <quic_trohmel@quicinc.com>
Subject: [PATCH 01/11] target/arm: Add ARM_FEATURE_V8_R
Date: Thu, 14 Jul 2022 16:53:45 +0200
Message-ID: <20220714145355.7225-2-quic_trohmel@quicinc.com>
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

This flag is necessary to add features for the Cortex-R52.

Signed-off-by: Tobias Röhmel <quic_trohmel@quicinc.com>
---
 target/arm/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index df677b2d5d..86e06116a9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2287,6 +2287,7 @@ enum arm_features {
     ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
     ARM_FEATURE_M_MAIN, /* M profile Main Extension */
     ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
+    ARM_FEATURE_V8_R,
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
-- 
2.25.1


