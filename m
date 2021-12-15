Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CF3474EF5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:16:58 +0100 (CET)
Received: from localhost ([::1]:51074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxHyb-0000tN-6k
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:16:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHtq-000395-OD; Tue, 14 Dec 2021 19:12:03 -0500
Received: from mail-dm6nam10on2061.outbound.protection.outlook.com
 ([40.107.93.61]:61153 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHte-0005i3-0j; Tue, 14 Dec 2021 19:11:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSoiORBf0XD+IRocSuA/VPnEAyIkrYBpZ25rAFbGKEwQax26j/aPOW3EhKD3k+uNtXXDvPH8ixLQjRU5/VRX9ONRcswMGw7Lm30dI1gAWilpE8/UmgwxA16LG5d22zzgh/Z+3jgquhvELoWjHwB3IxidQhuBZbiu/1WhbmM7luShANuepNf0nj5qAn1q0htVaJiJViBZg2n8SSUIOH8M0VOe7k1hlROk7RG7jt2MZnnJxAiMYzNZrXdWW7fT9UrBYjoWwokpVGlTFIpoS8BW4C24t/zD4fSlV8D4Tn53LoEGIJknLn8c9mJxxuGRFIXuwKsY90+swCadT8MnZEPJaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIRt+PwgHDbKgW3JNOi1QbDB0ammZyIzpTgBNA71FDc=;
 b=BD2YgVYnzYrtgNKPEG/RXGXiJG7NkuxcXeS0Ymi717tnOkoVQINxASbnnGiuDLzTv0l+ccH6oWt1Nq3goDJT1ARfRwlEijsS7BqRlF9CgP8eoxhVCPASmdTSX0a1l2ZWKhKLQKANyCbk5LrpT8dEizS/H3j5Bb+O3z6xivCAcJHywnnoK3Kdw7HqO9pSz3+aj5rpzp31OIZ1Fwra2VBRDU/Hg1xh8Xa1jXvD82Yjt5iuLhD1UyibXWqL55rgJoFkp65SiN6SAKvmare5mEXwDW1++WlRlwSMSQYbqQ9qNsXdM4ExO3/qYM8S3qnr6GdzmuMBBY7RSeIxjoOZ4ATo/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIRt+PwgHDbKgW3JNOi1QbDB0ammZyIzpTgBNA71FDc=;
 b=BTLSN+xEb5yRyFMnHjBBW1UiKkNsxQ6mx/kUMBs/aOn6kehwwS05Yxm5XWlpfJwsj9FA53BcJs+hqYqpbSvOvbNaw4QTsEmtFROnlxfFNpLh0UZA1rcxL/hFsxgPbp7xo2LKfpbKboC6mTCyMTTijPDEoghEBmR5dU3oon2NHHU=
Received: from DM5PR11CA0023.namprd11.prod.outlook.com (2603:10b6:3:115::33)
 by CH2PR12MB4907.namprd12.prod.outlook.com (2603:10b6:610:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 00:11:46 +0000
Received: from DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:115:cafe::84) by DM5PR11CA0023.outlook.office365.com
 (2603:10b6:3:115::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15 via Frontend
 Transport; Wed, 15 Dec 2021 00:11:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT044.mail.protection.outlook.com (10.13.173.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:11:46 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:11:45 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 02/47] target/arm: Don't skip M-profile reset entirely in user
 mode
Date: Tue, 14 Dec 2021 18:00:40 -0600
Message-ID: <20211215000125.378126-3-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d0d4feb-5dbf-4fd2-a68e-08d9bf5f7b95
X-MS-TrafficTypeDiagnostic: CH2PR12MB4907:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4907F1895F12623DDA6C4DA995769@CH2PR12MB4907.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4fV7Gzvei8Ij+wlSIrvWWj269OYC0u4A90tOaOJz3PEic+m3CpmzkNtdkc0Z3YHJ603a0jXA7YYuBWtTehoa83NfVt5nfJ5EOIHD3uP4BTpDjN1v2MvroVdbrfyqXH1kND8iCnkLPlJVOH4zU0WGzV5Hontb+f3wTS3j95vfirk/1CMEdDZEcQKWHjGThF7BOK0eDDz/Cg7503HsF2ZHvf6SL2GLW54DUkYQRe8qqmIXTW/BROwyO7Ev/WmFnXYWGCDx/faFe4vLoi0vAB/RfJ7PTUdfzClvd9Ul6st14bMVxi+gNjkG1ANppYSHrrOyvcrHXBWpM0Cs2LBcOitiVaH/e0YkhmpNbm5+4j6VXAaZUN0qRjAA2UZwiFk/p9Bt3dQDSlUGJlVmjw62xGTareM4dEHILXA6d/L1vByS+ZOY0jsL50vHmGFK9dMDPyz4mJ1Am/q51qBdjXOS/TpQyB2Zmq4swdj7WAtcyZyu22waOlvxgYJf5TUt+Y1uotXbhXJFGZOy2zHu3xyKf/v5s6M77KmC7GzAcfnRZmE8u9+jj24G9S7yApqyxRUMqenF0pUXQH6qCoxx6gIPEJ2ziGzN7qVwNrd6gUHA0a32pc8FdR1q9Be/Lwuzac+GvApyDHGI9wA8EGgza10iomXwSwbe7eAB8d/Y7PNtDk9GgA1VuRHolq/yI2EuS5E8aYH9oGklyRPsek6ldK6KCtY6s6+JMxhHocclfh0G0b8tV/+/Y0l9Na7zd3jwg5vXdfPhciEe9UNE9BvKu6t2zfM48TkM9IXvguG94NEcrEpJchWhcGHEEYhM86EjV3KNFyR+Vn1+p/Ap7sAuvoT4gWH7K4zE8LVyGdWJJoEBByujk0if1yb0Y6NwwZoDkIhg40vK
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(316002)(36860700001)(86362001)(426003)(8676002)(6916009)(5660300002)(1076003)(186003)(83380400001)(2906002)(508600001)(966005)(81166007)(44832011)(26005)(6666004)(36756003)(356005)(336012)(70206006)(2616005)(4326008)(47076005)(82310400004)(16526019)(8936002)(54906003)(70586007)(40460700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:11:46.4975 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0d4feb-5dbf-4fd2-a68e-08d9bf5f7b95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4907
Received-SPF: softfail client-ip=40.107.93.61;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Peter Maydell <peter.maydell@linaro.org>

Currently all of the M-profile specific code in arm_cpu_reset() is
inside a !defined(CONFIG_USER_ONLY) ifdef block.  This is
unintentional: it happened because originally the only
M-profile-specific handling was the setup of the initial SP and PC
from the vector table, which is system-emulation only.  But then we
added a lot of other M-profile setup to the same "if (ARM_FEATURE_M)"
code block without noticing that it was all inside a not-user-mode
ifdef.  This has generally been harmless, but with the addition of
v8.1M low-overhead-loop support we ran into a problem: the reset of
FPSCR.LTPSIZE to 4 was only being done for system emulation mode, so
if a user-mode guest tried to execute the LE instruction it would
incorrectly take a UsageFault.

Adjust the ifdefs so only the really system-emulation specific parts
are covered.  Because this means we now run some reset code that sets
up initial values in the FPCCR and similar FPU related registers,
explicitly set up the registers controlling FPU context handling in
user-emulation mode so that the FPU works by design and not by
chance.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/613
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210914120725.24992-2-peter.maydell@linaro.org
(cherry picked from commit b62ceeaf8096fdbbbfdc6087da0028bc4a4dd77e)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 target/arm/cpu.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2866dd7658..af60c07ca1 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -265,12 +265,15 @@ static void arm_cpu_reset(DeviceState *dev)
         env->uncached_cpsr = ARM_CPU_MODE_SVC;
     }
     env->daif = PSTATE_D | PSTATE_A | PSTATE_I | PSTATE_F;
+#endif
 
     if (arm_feature(env, ARM_FEATURE_M)) {
+#ifndef CONFIG_USER_ONLY
         uint32_t initial_msp; /* Loaded from 0x0 */
         uint32_t initial_pc; /* Loaded from 0x4 */
         uint8_t *rom;
         uint32_t vecbase;
+#endif
 
         if (cpu_isar_feature(aa32_lob, cpu)) {
             /*
@@ -324,6 +327,8 @@ static void arm_cpu_reset(DeviceState *dev)
             env->v7m.fpccr[M_REG_S] = R_V7M_FPCCR_ASPEN_MASK |
                 R_V7M_FPCCR_LSPEN_MASK | R_V7M_FPCCR_S_MASK;
         }
+
+#ifndef CONFIG_USER_ONLY
         /* Unlike A/R profile, M profile defines the reset LR value */
         env->regs[14] = 0xffffffff;
 
@@ -352,8 +357,22 @@ static void arm_cpu_reset(DeviceState *dev)
         env->regs[13] = initial_msp & 0xFFFFFFFC;
         env->regs[15] = initial_pc & ~1;
         env->thumb = initial_pc & 1;
+#else
+        /*
+         * For user mode we run non-secure and with access to the FPU.
+         * The FPU context is active (ie does not need further setup)
+         * and is owned by non-secure.
+         */
+        env->v7m.secure = false;
+        env->v7m.nsacr = 0xcff;
+        env->v7m.cpacr[M_REG_NS] = 0xf0ffff;
+        env->v7m.fpccr[M_REG_S] &=
+            ~(R_V7M_FPCCR_LSPEN_MASK | R_V7M_FPCCR_S_MASK);
+        env->v7m.control[M_REG_S] |= R_V7M_CONTROL_FPCA_MASK;
+#endif
     }
 
+#ifndef CONFIG_USER_ONLY
     /* AArch32 has a hard highvec setting of 0xFFFF0000.  If we are currently
      * executing as AArch32 then check if highvecs are enabled and
      * adjust the PC accordingly.
-- 
2.25.1


