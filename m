Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814A86451D1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 03:15:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2jwU-0000ME-0G; Tue, 06 Dec 2022 21:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1p2jwO-0000JI-Vq
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 21:13:45 -0500
Received: from mail-mw2nam12on2061c.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::61c]
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1p2jwM-00087F-UA
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 21:13:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJ818mCscMRL0UCzdtyno8PJ/F6DhgR7GMnG+r5G5ClWD+zTfXLzD9y7DFB0pPvxaCtwdL0amSNmaa70dNdQNp9fuxUVSGWR9DDOZV3RfZ/MyqJqMNDqdLOELkXufFVD72A9NbC7MjoY7ylTpAhTZK5hrb7wmA4JTSrpWbhzDF/4pIMXb4Qo1Bvw/r9ypWkixJ4+XG1PPUikrQHgSAnHYhvD6U0FZsGjSOpQuRDPbKdVbIWLX4b7r+b5gYMNgFukIjUgN1UcXXyk19cJevaDK93GKiuiPP1RZoaIfwN/JWzRlmiaujTYZ1LHLnk6gZDOHjIJCKQL18F8cTFo0Kko6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pW7CC5VEoARhhjXPOwPqIdbk8b2xiNoS5jfjgYKi5KI=;
 b=Cn+8dg6l2uUKGkCz4oSFhER2p96LWOpnLT+8595AXTK0uuDbX654GikhID4xdkVQw2GT0l2xBNunZhst+SxqoH9jn2cbRj3IJBp/N6H+fmTebwlE61L7U1evchrJRfWYLDiLMu2keQEyOl0KhdCByFjOWe5L7NAF1eV//C8dMgjXKpHVrMBXCQH+zqa3G4/3EObNlyWi+XmUuvXgMiIWD8H2r6LOUFXf1nEe2L0rxssjjDW8tLwMXY759dZ3ASNLJx9qFVZUgfpfq2JQPGqXhfp1qV6Z4Rm4NLeqVMz4veplGAO3mKZ/D9Mikp+mRnFELWyFBhAsef4pNNvMLrAT9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pW7CC5VEoARhhjXPOwPqIdbk8b2xiNoS5jfjgYKi5KI=;
 b=Sq9cJ9ChowwknnaiRigR38Q9yonUN8DthGHJFOeLWfULtsD2y3jNNaj+beLdW73jLqe1fSkL2w+5hrqwSm7A6sZNVVB3JPp4bU0J0RCqkudm2iyz2bQrsCU8idne/NKaLGNsAs0GBzTtI//wPawTVeTQyfMN0xNelmw7/axaqI8=
Received: from DS7PR03CA0196.namprd03.prod.outlook.com (2603:10b6:5:3b6::21)
 by DS7PR12MB5766.namprd12.prod.outlook.com (2603:10b6:8:75::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 02:13:39 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::67) by DS7PR03CA0196.outlook.office365.com
 (2603:10b6:5:3b6::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 02:13:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.14 via Frontend Transport; Wed, 7 Dec 2022 02:13:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Dec
 2022 20:13:38 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Dec 2022 20:13:38 -0600
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <francisco.iglesias@amd.com>, <peter.maydell@linaro.org>,
 <vikram.garhwal@amd.com>
Subject: [QEMU][PATCH v3 1/4] MAINTAINERS: Include canfd tests under Xilinx CAN
Date: Tue, 6 Dec 2022 18:13:18 -0800
Message-ID: <20221207021322.16165-2-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207021322.16165-1-vikram.garhwal@amd.com>
References: <20221207021322.16165-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT039:EE_|DS7PR12MB5766:EE_
X-MS-Office365-Filtering-Correlation-Id: bea65f70-9e4c-42fd-b870-08dad7f8a7ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KOu1t1O56W3CAKCZReC9L2JngqOdwLIibnhb4r7RB+UvMb0fxQr9flaUzbIC/iEMSNWiIdeT8zyHCzG46P8n0xt4EEgtP6MRkgxcrQsG2K5EUrET9fo7turBFcvMs/wXKbhgSPOC9FYPlozNhbUBEzoKCvDkHzGTvDvat0Zvf+3nBuKtGR7bqCoOgsPjUkNuVxbmG9Cp7OJDOkvUJsK9f4K9feklfGasd6Dog0jQGHpCTBOsQ0aP2fxvTBKdx+LGZADZBzPB+V3QzD7Vnm8qa5gbdg5/YosHvLpkuj+Y/X9u3j5LQKuSVrd3EcUw2o7ZKoVlpZoHEfoThbIULQBxtLFNVE9z8VyY/TifC7ThVN855thGYcTDylT3Ukv2OowTKF1pBQm6xrLnGKcygeA1ReRfC5HGs7/lHW0o7BdrN0N2sn4Os0TnPqeCdBuz0oy0wiW3vw3VkQ5Q+PwYBeAMWBMc0tN592zFKUa5e1BnZ+gYknbmRryQBuOyNZxv9nMf6stBFRWLWOSuSjIl+5TM7KoEu7V+3C6entwa6u9LYacn9qZ5ym76ngfCoxB0EZE+yxQZ/1aNyNzCVxTf4GsfL4J2xXF7xAth732y5GYFzpmHuLktYsWf58lY5AbY+hyDcYKIp0QJ84Nl6/ayMiKlVRDQxaD2MVS+u5BGj4n2P3MFdImPHIN7hdrWnL/Aqzp4RKPZWVefGXh44ExEILUvPGvxdP8FXkBw4xeOK1VvrJw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199015)(40470700004)(46966006)(36840700001)(316002)(336012)(2906002)(70206006)(8676002)(44832011)(356005)(70586007)(4326008)(81166007)(36756003)(40460700003)(82310400005)(82740400003)(186003)(26005)(478600001)(6916009)(54906003)(1076003)(36860700001)(40480700001)(6666004)(2616005)(86362001)(426003)(8936002)(47076005)(83380400001)(41300700001)(4744005)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 02:13:39.0540 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bea65f70-9e4c-42fd-b870-08dad7f8a7ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5766
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::61c;
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

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6966490c94..a76221f260 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1753,7 +1753,7 @@ M: Francisco Iglesias <francisco.iglesias@amd.com>
 S: Maintained
 F: hw/net/can/xlnx-*
 F: include/hw/net/xlnx-*
-F: tests/qtest/xlnx-can-test*
+F: tests/qtest/xlnx-can*-test*
 
 EDU
 M: Jiri Slaby <jslaby@suse.cz>
-- 
2.17.1


