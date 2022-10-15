Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520005FF89C
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Oct 2022 07:23:11 +0200 (CEST)
Received: from localhost ([::1]:58418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojZde-0008DO-BQ
	for lists+qemu-devel@lfdr.de; Sat, 15 Oct 2022 01:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1ojZPi-0006EH-O8
 for qemu-devel@nongnu.org; Sat, 15 Oct 2022 01:08:46 -0400
Received: from mail-bn8nam04on2073.outbound.protection.outlook.com
 ([40.107.100.73]:30423 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1ojZPf-0007Va-SJ
 for qemu-devel@nongnu.org; Sat, 15 Oct 2022 01:08:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBHL5rXs4Pp0gWKx2RgFQY64s7n12LiE82KtssANldJNKIl7ODWyicheCrMyWn9qm7qbCf6lxPGuUeYeXpbUgUcEyrCtyj6REsu0Ooe1Zv8c2KYyu6To/aV+bm3Gu8M6WyE6Be22DZEr+wsKS5tAA6kv0+GDGK+DtYkr5lSLD1rxyA3SE9zxxAPMICfUvH2/+NuP31uPLor/7SMT414HivPM2Qe8jx2UxzX2plVclo5Ama3y1D3nq6U5fCz88DHFnLVNq6OxS+r50HwDBIxYxsMhcp1rTUA7w7gYs3WJgjdtHc/CygyLb5lsQpQb7pkPz3os/8BCEU9gVoSgnVYCwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iwzKEgHU1WrgJwVJVywFwdcMM/KTuL88rsZVCqJrTM=;
 b=jkk9wF9RQF0I4rYvvxfhJAVnejo7rT3paQxjoePcWCYJiC9/bas3DWO2tOPPj/mBddKFEFX4+qA5RcioixsjtSxVKlI3Yp1CHIapyVntUWrYfYzz0UriT7IDdrpTSFJOHJLKzXL/pub42eGvPOt1/oLF96A4hFTu/jbh8bFuXXKSTjqAdk0llB62XeaUQ5xaMQpL/icawqO1WXCzMqKYNdSwnF2ITurO85Xwt6VF2kAkvZnZLejg+4TpzPy2AwZYV5I8dGlfoAiycqeG+1QUoW2XAH6juXI8Bu6Ph49brGPvOOdamErOzIKFdsLrU5cTf+Lnvxmoe3HSvUT7LiuYwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iwzKEgHU1WrgJwVJVywFwdcMM/KTuL88rsZVCqJrTM=;
 b=QG9v7jfOma9Wx0D/SQR3WuplIhZia+jtCfURW6SU4VqVF0Ekqjr2r66NZG5/sDCnubr5MV0Pd/3yM6UJxWpfLjJo08MHJgojksW0hajaRjxK9VdV2wWJrTE5zzfE7W/O1t7RTgQuVSs06eG6QfuWBOZ7HwRQVQsSSaoRFvdJwhU=
Received: from DM6PR06CA0099.namprd06.prod.outlook.com (2603:10b6:5:336::32)
 by CH3PR12MB7668.namprd12.prod.outlook.com (2603:10b6:610:14d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Sat, 15 Oct
 2022 05:08:40 +0000
Received: from DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::3c) by DM6PR06CA0099.outlook.office365.com
 (2603:10b6:5:336::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Sat, 15 Oct 2022 05:08:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT042.mail.protection.outlook.com (10.13.173.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Sat, 15 Oct 2022 05:08:40 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 15 Oct
 2022 00:08:38 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 15 Oct
 2022 00:08:38 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 15 Oct 2022 00:08:38 -0500
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <vikram.garhwal@amd.com>, <stefano.stabellini@amd.com>
Subject: [PATCH v1 11/12] meson.build: enable xenpv machine build for ARM
Date: Fri, 14 Oct 2022 22:07:49 -0700
Message-ID: <20221015050750.4185-12-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221015050750.4185-1-vikram.garhwal@amd.com>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT042:EE_|CH3PR12MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: 0741ddea-719c-4b47-bc94-08daae6b530f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I575sbYk62mASjCZacMLLzzd1UviGhPph4LNjDO+Ruv1wgYHZIexd5XZqbwvuBfjf3pugANyktte8pGr6R0xHmjxosmDo+0aODjL/n564UqrqSsCaJ9jA2b/NLoGZER1nU5KH8gA9Vm9HXrTtfQaicaA0mDCuPEFESnIqBgfVe5rH4lN9aFouDFm6qR3kg1J516+fRElebGmbWkSR2/ROan9Ws5BWHPplsnXUTOSenU0t5EJ74YyW3FDogEJe1aMnXUgiJG1u1Q3oYw2HNB39yp/17ix0Yh8lAWxvcs1gnfWcvNoVSR0zJ4BD54hQ2/XQj9MvI+OcU50t9mo5RP9iQI7SITy4N4yHs18fBCKaeRrgq/PpgRuyOjPenhnQUDHGEos1Tgivxzlm1BKmZD4dgkseuUqPu0qe4+Ddc8o2Vju2tGbqpUGPPcj962Ad5qvlwKAeHaj897JsUsVkvk8trRGbNER6V6BEjP3v66aIhu25mTmrSAwCoyQeAynCznTUZ6CQ/yeFCjPB5IcWEfY1ox2KUoZo7voP/M+f9ijxUEslE90Je26BUyziFGRfTMhMUPt0951gv9g5ep6bZeQHqpLBNGbIBPmed8Q6akAkv8LRyq8hXD9FIE4Ex3mzh4XKSQSNClet3sazobyv16nHRq8FUW9LwsALomXrI14/E2vTP1HZKzqm12xlyes5LiFpjVfppl9fNzz8ZfIR1GX15S3tdATdQVONOJnYoFPSEkbUcW6696X8Jotmwy8g7d4OT2Q/j27VIX8x2rSOIdZAGaSaYgBTYtb4CEEw34+bOUr6WQ+KcuuIwiUYqsa57jP
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199015)(36840700001)(40470700004)(46966006)(186003)(47076005)(2616005)(356005)(83380400001)(1076003)(81166007)(4744005)(86362001)(70586007)(426003)(44832011)(36860700001)(82310400005)(82740400003)(336012)(2906002)(5660300002)(40480700001)(8936002)(26005)(4326008)(6666004)(316002)(70206006)(41300700001)(40460700003)(8676002)(478600001)(54906003)(6916009)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2022 05:08:40.3683 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0741ddea-719c-4b47-bc94-08daae6b530f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7668
Received-SPF: softfail client-ip=40.107.100.73;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
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

Add CONFIG_XEN for aarch64 device to support build for ARM targets.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index b686dfef75..0027d7d195 100644
--- a/meson.build
+++ b/meson.build
@@ -125,7 +125,7 @@ endif
 if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
   # i386 emulator provides xenpv machine type for multiple architectures
   accelerator_targets += {
-    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
+    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu', 'aarch64-softmmu'],
   }
 endif
 if cpu in ['x86', 'x86_64']
-- 
2.17.0


