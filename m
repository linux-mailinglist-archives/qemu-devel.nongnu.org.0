Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 209556839B0
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 23:54:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMzUQ-0002Hq-63; Tue, 31 Jan 2023 17:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pMzUN-0002GN-AJ
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 17:52:31 -0500
Received: from mail-sn1nam02on2060f.outbound.protection.outlook.com
 ([2a01:111:f400:7ea9::60f]
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pMzUK-0002gx-Dm
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 17:52:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IStmBFltMf2hZUI7++YVbUMKDrvJ8QDdfxnmlerOXfCXWEufrK1jlTeV/FzE8Pc1fDaOVvmieomEKH0Ri4Wh6c7aj8W9tiOj+fx6qTjnD9InuOHt7joJDe3y89r78xUo5lkD7b/NdPy77OZJ6XCkluFg/GNdMTzo031QOy7cqbdSr1JOC7p7Fwf3xboeNaFvWDDI7Owledr36/SJXnT3hP5mXopVufF9asZ8t1b6yB5MeSrqgtIAe2EUZF2S3Hj55KhRFulwAzxPGEo7e5IFnTf1nNOtYtFGo++14zTEr6OZ03I8sZUPAceLmOGF864bZe/V2gci984a3REoWrgj3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmpuP41Ztn/lKlMcuw44+3sOiW4TYVQ+KI34gBksLz8=;
 b=iQjsdozJoalfyo+g4Ke0D0smBCYXLGopNwWsVHJ1863nKK6UAtKCAeUuJCkKiB+hZhRyP0KW9WSvQ6t4Yvx6iREjhnmTpwfzN8fE17YcA6dcHsPl6kDqLLyvMkge3luuNZqq7oM2yqLIf9rH0RVRKVARpa4MUnpNvWmz7wD07pLWwV7iYm+Hp4bEfmSFk9BtavBCYVp3AEmFKfad1icamzAoUqU9Pcl4biVvfdiRFEM2XvFJtUysQVR64QgYHXYSGZtjhLg4qAXGxfuTb9fD2ytpktucP95Pq7iXcnDw40/C/opT5QCsvFMhicbVb2+zkqbERiYar209ZvbTmLCBsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmpuP41Ztn/lKlMcuw44+3sOiW4TYVQ+KI34gBksLz8=;
 b=tsQQj7LxTOI3yrwo0I/9s5DcsHegIjL/0YipTyKm2RqOiG045x33xNLeveQtBGUzlt3f9NB6d5s7MdH3cwOvspGkSaH+QD5n4oGqe7l28WZH3llJZZInD2qmp31A4AVYVWugYY1/pmj98tCL6sIK/KctfkJA17dNZmTHHCpgzD8=
Received: from MW4PR03CA0019.namprd03.prod.outlook.com (2603:10b6:303:8f::24)
 by MW3PR12MB4554.namprd12.prod.outlook.com (2603:10b6:303:55::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 22:52:21 +0000
Received: from CO1NAM11FT106.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::bb) by MW4PR03CA0019.outlook.office365.com
 (2603:10b6:303:8f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Tue, 31 Jan 2023 22:52:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT106.mail.protection.outlook.com (10.13.175.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.22 via Frontend Transport; Tue, 31 Jan 2023 22:52:21 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 16:52:20 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 16:52:20 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 31 Jan 2023 16:52:19 -0600
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
 <stefano.stabellini@amd.com>, <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [QEMU][PATCH v5 08/10] meson.build: do not set
 have_xen_pci_passthrough for aarch64 targets
Date: Tue, 31 Jan 2023 14:51:47 -0800
Message-ID: <20230131225149.14764-9-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230131225149.14764-1-vikram.garhwal@amd.com>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT106:EE_|MW3PR12MB4554:EE_
X-MS-Office365-Filtering-Correlation-Id: ef99ddf4-e669-461a-50b8-08db03ddcff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UVuXJyiAiNYd2meMUIwXSaLSy6HWTJJWqan/oB67squzUPDAP6kNLuO8pMhSMogs+WPezsQJ6mFtaYp3ChIKoHYIRWaimhu+w58LF3pXrSizqcFdUVi8r2ax24hjgE/QI2MhvS7rSHAQPiCmfbVrkwQuIcrs9zKYkHFG7SPJX/LL4SVaQDc2mzjb961miFzHpjI6gsPHUdaa/8prOwUBlfaMXhNZjvbwvt+W93cZE1CSBRIFHU2g2zQiAx8+WGTyTGlOqkcPaB0LnnjTAJPuBCL8YtE1I+TP5qsvN570MLFcLvnKvX5E3+6eVjL+TC3b9uTs/681Sjs8jyMd2Y2lTjvC0IOVDJtOaSoeCBDXPk0N0HRbiJzIx56EW4lfEMmsbwuzljChVYmH7E8OKe1UxALjvP/ab+zVPZwpYwrnsUUemiICZgbPgkq1Cyaju6AqNr9swnMp31ezjfXYkygsogyaMWDP5IYWbK55U2OGmxrs4xuf79Dgqw3xClvHs2/rUdQjM+jYiT6yj4Qn1tY+kgL82cAGtxyvTxO31seqjn5MtIkZCAmgnKj2XR46LZMB2F/FMdNZ+BGcQ9MDJC3CM8aGXvixfDs5gMGzZGYf5v/wps3PT21tOZXc4CNb1LxL4Oe3yW3fm7UMfm5DZCGwBooi+KnXuEik22kKbCq1UGOqdRevNAhpLxg1GbrtgMF0hcZAVv7ea0Ru0h+lSkVnDh9kAKn0QLETrsZNVW3+D2U=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199018)(40470700004)(36840700001)(46966006)(4744005)(2906002)(44832011)(36756003)(47076005)(83380400001)(82310400005)(426003)(54906003)(6666004)(40460700003)(1076003)(336012)(26005)(186003)(6916009)(478600001)(2616005)(8676002)(70586007)(70206006)(5660300002)(4326008)(8936002)(40480700001)(41300700001)(86362001)(356005)(81166007)(316002)(36860700001)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 22:52:21.2914 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef99ddf4-e669-461a-50b8-08db03ddcff2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT106.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4554
Received-SPF: softfail client-ip=2a01:111:f400:7ea9::60f;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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
index 6d3b665629..693802adb2 100644
--- a/meson.build
+++ b/meson.build
@@ -1471,6 +1471,8 @@ have_xen_pci_passthrough = get_option('xen_pci_passthrough') \
            error_message: 'Xen PCI passthrough requested but Xen not enabled') \
   .require(targetos == 'linux',
            error_message: 'Xen PCI passthrough not available on this platform') \
+  .require(cpu == 'x86'  or cpu == 'x86_64',
+           error_message: 'Xen PCI passthrough not available on this platform') \
   .allowed()
 
 
-- 
2.17.0


