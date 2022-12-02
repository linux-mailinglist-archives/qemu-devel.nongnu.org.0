Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BDD63FE7D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 04:02:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0wIf-00079Z-UC; Thu, 01 Dec 2022 22:01:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1p0wI4-0006yO-1F
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 22:00:40 -0500
Received: from mail-mw2nam04on20602.outbound.protection.outlook.com
 ([2a01:111:f400:7e8c::602]
 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1p0wI2-000875-7o
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 22:00:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0zz6MY3Q1Cw4W+FCd/VUs/ZCbvP+7gHi4wdd22YbbDkdbYRgRGWjWb6YovdTIFlYxT9YI0ZW46mqY1VvAjDmC421MmHsoc2Vw9fm0LnQHDG+nRcdkA5xyTPE4qNmDt8Jn/zMhvV/nOaG7cPd3jWL/xcKv9o4LVBeZPAOOaF83CIGJt/xxYJTKGtYBoCwmPMS9ArWyIV1XW7z1YxrY4W8dFbTTDP4imwSLGJ4jtgeTKyXCn2hlDYnq+1WPzemOaNK2MXfSxEd5P64VpQppXqCwYc6PKZQbgi3p1V5RM56zLk4MQ+MlurP7T8R+/r4KX8U8UADDrTkSS5da59DUf8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ir4hpyABHTTAHqZnYN0/rdlHtCJ7Zkk8QILmyHGJSSk=;
 b=JaHXg//MgviEX1YT2QLSxKrORPwAGShcO1DTWWtnq/j0DPMFUKeUYZqajt9MLS8aGEUwkKbGyWsgf57MNmgYZumPMhIDYzX3Dl0wZV4PSuGm1LoJHrDxrNr3rcq1ODydKMWHV1mnFhJ6pSBc83NRLyr0DVUXprE6BsSPSYVGSlaEgJlDv0BIdn5mUpp5OZnkoNsdo58YSSFx47S1ylmfgnUqUflnEPxSOCo3O6SN18nxQHYhSfdCxtNRmnph6Md7Ynv/rStS0GBMWyBkyB9OOU7P5iSM4Bf3oFJCSKr2DKdR2C8J4/RMUG7Ydyb6vHLTgD9iVDHEU1Em6dcrpEwTqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xilinx.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ir4hpyABHTTAHqZnYN0/rdlHtCJ7Zkk8QILmyHGJSSk=;
 b=x47a8mVikxa/gWx4WbPFxsNoZPlMQ6d2MMxWL/jT/wP7A1ui6U5zb4xOS7EfmAjHHfv89cHVZf/WIVB9IKnVtMvFgI33xU/iYh91HmkjeF+GMNMosD/mFcGMwxHBtT8p2p0CzwkUbf8Q6btZHeXwx19HanuZX+9Vi+gP5NnomSs=
Received: from DS7PR03CA0263.namprd03.prod.outlook.com (2603:10b6:5:3b3::28)
 by DM4PR12MB5327.namprd12.prod.outlook.com (2603:10b6:5:39e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 03:00:32 +0000
Received: from DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::8e) by DS7PR03CA0263.outlook.office365.com
 (2603:10b6:5:3b3::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Fri, 2 Dec 2022 03:00:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT064.mail.protection.outlook.com (10.13.172.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Fri, 2 Dec 2022 03:00:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 21:00:31 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Dec 2022 21:00:30 -0600
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-dev@xilinx.com>
CC: <stefano.stabellini@amd.com>, <alex.bennee@linaro.org>,
 <xen-devel@lists.xenproject.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Thomas Huth
 <thuth@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [QEMU][PATCH v2 09/11] meson.build: do not set
 have_xen_pci_passthrough for aarch64 targets
Date: Thu, 1 Dec 2022 19:00:01 -0800
Message-ID: <20221202030003.11441-10-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221202030003.11441-1-vikram.garhwal@amd.com>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT064:EE_|DM4PR12MB5327:EE_
X-MS-Office365-Filtering-Correlation-Id: 2077c209-378e-4ebe-b33d-08dad411600f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hcntb+hQYDcJ60WCfKmSQHdKXS537gFJyjdmDDrYOMUVW9b8THn/4fQ62A3prRpWT0N1N3UB2Z0d39/pQU24zwIfDmNLo+D318CZTkPXmT7q/mjXcFAzDNIv2rcJO1Gr5IV6Zu6Y6PtwOU45jXbssz+IMU+1G+tvWrYIuUJkz140VpJeqgNjIwBbK8fI+1AKhe5ahBqyh//MluchU/sRex4QDtqzG0x5LuPllMYCfvmCNdfgfbeuGAwzYMrP0OfmUwHQrFp+1ghKxlbd9XLTVZwhEguRBC9nXtQgrADM9nw8qSoNUmOtGWY1MrCbF6DSqpf24IAWmyFsz5ykEn+MQfLRvyOzGsDuuaZksdXl2p63lwcVTsYH1WsXJO4dHqNOLUg9Joy8fmmioCW3B6qYShzqm8aJlfRdq10YtBf3X3DskefLCGXYaFBseaduwnD4ZFq9x2uEpiHm+8kNog8FcPwlQvJeHRmZSDto8HFiUvb8p2tEo4/D9HocXzXglFpBsLfmJbnZYXdYrI09gES5qRU6f6EViWzOJB0K/bxzOWtwD5A9wR5DJG/8ReSENmApos6D6cgPD2vk5KSf7TP4QwdgU0pN5o37JXQ9bhXGYanxQQ+NNAHHgyrxYuc+qceLVlDF+lZna+gg9KGQO6GKkKnzYa4epgBu6OxW5cCPcAdlakw2YlXwPngqWP4nXqyfluhlC38aewxYBG/qLjHkmyWYGl8AobLGZImQbINt+YE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199015)(46966006)(40470700004)(36840700001)(44832011)(4326008)(8676002)(4744005)(41300700001)(5660300002)(70586007)(70206006)(316002)(2906002)(6862004)(8936002)(54906003)(478600001)(36756003)(26005)(2616005)(6666004)(426003)(336012)(1076003)(186003)(83380400001)(82310400005)(40460700003)(36860700001)(47076005)(40480700001)(81166007)(356005)(86362001)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 03:00:31.6739 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2077c209-378e-4ebe-b33d-08dad411600f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5327
Received-SPF: softfail client-ip=2a01:111:f400:7e8c::602;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
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

From: Stefano Stabellini <stefano.stabellini@amd.com>

have_xen_pci_passthrough is only used for Xen x86 VMs.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meson.build b/meson.build
index 5c6b5a1c75..81d36420f0 100644
--- a/meson.build
+++ b/meson.build
@@ -1469,6 +1469,8 @@ have_xen_pci_passthrough = get_option('xen_pci_passthrough') \
            error_message: 'Xen PCI passthrough requested but Xen not enabled') \
   .require(targetos == 'linux',
            error_message: 'Xen PCI passthrough not available on this platform') \
+  .require(cpu == 'x86'  or cpu == 'x86_64',
+           error_message: 'Xen PCI passthrough not available on this platform') \
   .allowed()
 
 
-- 
2.17.0


