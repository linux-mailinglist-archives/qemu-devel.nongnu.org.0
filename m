Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759A5433A29
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:21:35 +0200 (CEST)
Received: from localhost ([::1]:41026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqvm-00066n-Ik
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq7k-0005Gx-41; Tue, 19 Oct 2021 10:29:52 -0400
Received: from mail-mw2nam12on2046.outbound.protection.outlook.com
 ([40.107.244.46]:22968 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq7h-0007zC-W2; Tue, 19 Oct 2021 10:29:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZyJn9thatxHCu4nGUxdFgXcokbtz1zOBDguEdJeUbpPl4TwGFJxuNSjlc6cqpaeMGQd5hlkKwUdA27ZeyDEHSPJi3lhLZzG1Vbr1swuXEHbHq7/SBqPeagsj+K8uJxOM6yfpWqIZhqJGYr50jAkBl9ENeRKdo0QlGi/LvSmWSLP3pAQ8vNLDoG2Ng+RWNg5mMwtKa89VXkd5rqIOPVZDUNH++l1CmagNyAvLeEkmXOawHYDI7ofjnpPBJOkevS14MxdZw6M3lairNMfHsutCUJo/uzwbcXf1UAuHHQws2M19lGvloaFhm0g5TdaUNr32xY01ERs2TTJINPlk0wZmig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfQ+H/xpPCSSJRn737zt7+p9SVApowO2Em6kFD/nCzA=;
 b=KJM22b83nXNL1N4nwPDrQXIVgONtES2EJre04BBKk0oRu2eCcsSh4mdvqjCpbm7QTJf8w0Ad30xnJxTvv5m5Jwzv7tqVYs0A+IZG8vaIi31e35LeCmhL/i+SczxgN1jofdriHwTRhdPnH3wCAGp3pDx765pZdJ+PSQxOy5VBjAnWBUEiNGAcx3COgsssDpQJz9tv/aT3vDcpakQdk8ebXSrPdE6jvkEtLwJcdsNdFkCCRfMVcfzhX1h0Mb49k3nP9N/0VSDvdwHQsooVn4Djrg04Ao0YhJuT93vRn4h2mGauQrp/zSFoIYX1vSa0mudspIOlzQs37nzHz1MNGRx3nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfQ+H/xpPCSSJRn737zt7+p9SVApowO2Em6kFD/nCzA=;
 b=nMkAPDPSYl2b8h15+qpxdjwmvM46GSCKHsQucwLnmAYY44pj+cayRW7lVohYV5USbUzodGq+qN9J22BFvAp/5vHz1PYii7A3UDiPI40qFWkxg+GhhZdBsJO9eZotNnXt1HDpssc0Ecw+rTZ0bS/KnkTOUvWpn4wUrJImALVAaUs=
Received: from DM5PR04CA0048.namprd04.prod.outlook.com (2603:10b6:3:12b::34)
 by MW2PR12MB2490.namprd12.prod.outlook.com (2603:10b6:907:9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 14:29:44 +0000
Received: from DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:12b:cafe::cf) by DM5PR04CA0048.outlook.office365.com
 (2603:10b6:3:12b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:29:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT011.mail.protection.outlook.com (10.13.172.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:29:44 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:29:40 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 47/64] target/arm: Don't skip M-profile reset entirely in user
 mode
Date: Tue, 19 Oct 2021 09:09:27 -0500
Message-ID: <20211019140944.152419-48-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e082f2a-e587-4255-8e0a-08d9930ce544
X-MS-TrafficTypeDiagnostic: MW2PR12MB2490:
X-Microsoft-Antispam-PRVS: <MW2PR12MB249054814F9BA076B50839DF95BD9@MW2PR12MB2490.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NvP2qrNq+mnUh8iMU7Nbq9USkTqhmAXiYHrO3TWyq6Ki/AR/8L9AgWzL7VTRsz7z+JKzf2GTFaRV8TtBBuJPLTJBpB41VEcm2/NK7J7ppe4hDkfW1oXEGiuoS7MdE8orF7zHWDwfGL/XCWwYf9Ui+O13drBXFS+LICGSVDR30l8BPzbXoP12GzH1fPNLoxax8RjkysfcG/D1LMiGqVv1i1bZnkCm+YiNGLPkZ9HPLqPlWF+zBPOd0G2uVUOXn+uB7sZL65i5hls4D8zkXqEW87TvVm8CJwcw1V1rO5uk4rqMu4a1OteVTGfoCYMpo2JajXZbj8eK/wgECefiIy3lKjdDNYoEe9hF2DmEOtXKAAGfNu2CaJRylZQBPrUCx+Irbyu3MIB8qlEyL5hPuuW6S7cnIxnS7CC2lzo6eHSEokus0ovZUQY2pOogCmIS8LUVf0rVJvnA7QE+sifqDPL99gy22NyEzy+W3FAF9dovGU9Q8udzWVumAAjUN7FEn5m1D/7wYu2oZa/9TJ+tMCn2u3VoarKqEF8AIqr1O4M8xgdEdE/bqmWo5eAb5W83HGa7YMcOKVsAggJbaIhIMpFJx4LGWgUPgPnRuRRrJ4zK1kZxFk+mkperPMM5Pqdv1/pn3Rji9w//49XJHkMbOCzQ5AGxelOcQfXLTSN/tnPjvozx/xlX4S2Uytrovkvznl5PksX+WXYRJAL64W4ZoJ7VyYMeqKDM436adILeQxkiKz6TmC8nul6IzDEbUIGLpieo02GjAGUNqN71PZdhap1ISMU2jHN+Gq/csF17nxgbJ8wyfei9xLfbI4a1umxf9mUW
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(8676002)(5660300002)(2616005)(2906002)(36860700001)(86362001)(16526019)(4326008)(44832011)(186003)(81166007)(966005)(70206006)(47076005)(1076003)(70586007)(26005)(426003)(6916009)(82310400003)(36756003)(6666004)(8936002)(356005)(54906003)(83380400001)(336012)(508600001)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:29:44.4123 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e082f2a-e587-4255-8e0a-08d9930ce544
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2490
Received-SPF: softfail client-ip=40.107.244.46;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
index 0dd623e590..4f03e74664 100644
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
 
@@ -351,8 +356,22 @@ static void arm_cpu_reset(DeviceState *dev)
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


