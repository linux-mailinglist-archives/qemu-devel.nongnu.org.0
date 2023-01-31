Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5B96839A8
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 23:53:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMzUQ-0002IB-TV; Tue, 31 Jan 2023 17:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pMzUN-0002GF-2V
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 17:52:31 -0500
Received: from mail-mw2nam12on2060e.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::60e]
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pMzUJ-0002gi-T2
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 17:52:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5wBSUyeOZ8rQDdxXb23NmYmVJH4DF1HgPBAEzUdKxFAZVjaz7y0Um+OIdqY/9PU9wehBvLFN65Db6jwdIoxo4CEAYRfGeqJFLWXrwRzk7XXq6Ap865TqnuCa0CpjHbjqyPxxZxCt715XONUxbcNGUgCVP/kyZl521CKbWCHENVMUFyVXNzGbQE8Y9QsSOTl29G3owo9lIf/U6x+pPPqkAfsMOhxho8xccKA1FPlM4nr3BACQEFigjcj7B7/KgG2LpgQRF2afCnargFP+YJjNd9RVGcc0UB9N/mPw43KBSiCCH7S+EXpve07MTp3bPhJgn8CLX3P1ADdcKTuAyfMFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5c1IzY0YQxuTPTSwy7UvS0mMbpPve8RkE4gupE88sNQ=;
 b=S1QUAKgpMq5V7y6K6fIXooUpM3nj/UyU7jWZMgNO6tAGBTQm1axO5OvmSeHcDokwk4YE+UxAn5bBjp80lfkYU6gLQ2GP+yV3o6A/kavZztKVhSfvDTRjOJo1d2vzuY6BYXVp/9j4HqgEZNMUnU8/zq+3vWpFOj7pT38o5lVVztv+NqvD/ThIAdqnw3tqjj/17De8Ncn18y2MqH/DJvluv/1f4m6FWL746jRi0xVZMtc9owSkF3AUlzEv60cWf8Kef88vF0Okk3iqPFeH8EzWkLIVuXbpVlruY54E8DNvkP+iba+plKiIzkLHZR635pwxKNWQdupppwETttCpCB0IKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5c1IzY0YQxuTPTSwy7UvS0mMbpPve8RkE4gupE88sNQ=;
 b=UMRryyixogad2mWzeOT0OucBvl14YgzhAImM1krSWAiO9iqxLEy432VQVmHAX6/jQZr2KFvMf+wZz17a+QdLtG9UXqCvE/iEZH80NOZKe9bV3g0AP1txPa3wMDLW4LZ6Jh6SiUs00zLim1WRNstcei5agNot7UKp7tYlfbkX7v8=
Received: from DS7PR03CA0044.namprd03.prod.outlook.com (2603:10b6:5:3b5::19)
 by BY5PR12MB4306.namprd12.prod.outlook.com (2603:10b6:a03:206::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Tue, 31 Jan
 2023 22:52:24 +0000
Received: from DM6NAM11FT101.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b5:cafe::8b) by DS7PR03CA0044.outlook.office365.com
 (2603:10b6:5:3b5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38 via Frontend
 Transport; Tue, 31 Jan 2023 22:52:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT101.mail.protection.outlook.com (10.13.172.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.36 via Frontend Transport; Tue, 31 Jan 2023 22:52:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 16:52:23 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 16:52:23 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 31 Jan 2023 16:52:22 -0600
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
 <stefano.stabellini@amd.com>, <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [QEMU][PATCH v5 10/10] meson.build: enable xenpv machine build for ARM
Date: Tue, 31 Jan 2023 14:51:49 -0800
Message-ID: <20230131225149.14764-11-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230131225149.14764-1-vikram.garhwal@amd.com>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT101:EE_|BY5PR12MB4306:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ba9ab4a-a739-4ca2-e485-08db03ddd16d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CRHApirmURZUasY1yQQUrk3rGjD1IRLKcXSSZ99ty3v/koBoUmzhBeEIsOjwGTmpeJiF/5rh6fkCzT56jZGmPLRMNBpN72EDiDmCyKhKEvqtxvxmXc0Hu3Y3pDTR0Bsla8/O6TjDBDyyQonz/BSsa8WaCg1u1N6akFgPyjinzZIuc6jhiMx/LyTi7JtUks8AylZz/zSfSQid4kPpF5VcEJ0pz6L1b88DYZS0YE1QOEZx0cI0D9OVkgcGkODOF2ge2AAaVI+qCVtdu3tZ6mcMGttUyIeXYfRzckoQoENuMdLEHVycYVv2+cU8j2y62OdP3LdeKrMhe585lE4ziUviCTiMDLcH5bg9DKyVBva/unm7u0fIABKLS7zPHJZMyDckyAS5QXLOhm+54NhR8UjM8J10n7R+fV6Q2lJ3YpzUpoJgI27TSGGR138IlGMq0UMs8MalzETyOLdX7pdBMnPPVC5CZXOlt3NFe37PcHnmYRH5EIt1rUpsUpF9UXqtl/LTvuDTUHptZKjNFUPgNJvX8VUpK5/LCuDh+/IYM62+auTk6TrEwxj7C+gy0m1p7Lu2Cte/VVFCGZowpfH/QkWJRV9l7PkTii0R0F00XBAVEVWKqtHEDgrJvLfOdEwZ9kgnU0la/SE+HAKRAkyM/2MyMFxPqhxPByVigU0THoeP59dNuAcl+oMenwgYWF+956VCyLKiL8xOwwG1Z9PCoat2BUXmAP6ZyHlOkPFIKpEj4hM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199018)(36840700001)(46966006)(40470700004)(316002)(66574015)(426003)(356005)(54906003)(41300700001)(44832011)(2906002)(4744005)(36860700001)(36756003)(5660300002)(8936002)(81166007)(40480700001)(47076005)(83380400001)(82740400003)(40460700003)(6916009)(8676002)(4326008)(70586007)(70206006)(6666004)(2616005)(478600001)(26005)(186003)(86362001)(1076003)(82310400005)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 22:52:23.8571 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba9ab4a-a739-4ca2-e485-08db03ddd16d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT101.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4306
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::60e;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add CONFIG_XEN for aarch64 device to support build for ARM targets.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 693802adb2..13c4ad1017 100644
--- a/meson.build
+++ b/meson.build
@@ -135,7 +135,7 @@ endif
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


