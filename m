Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5916DE789
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 00:49:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmMmY-0006Xp-NF; Tue, 11 Apr 2023 18:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pmMmX-0006XG-1S
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 18:48:09 -0400
Received: from mail-dm6nam11on2061d.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::61d]
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pmMmV-0006ZA-76
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 18:48:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpCzqrcKkc4cjgV6C9+XLDIAG9fTypdq9VK8dYRsbsL78HskN9YjVQ6n3HZVJqSuGmPe6Zt+UyDd2JNZNRpO+ihpGpMZmu7MeageoEr4fZusvitoK3i+FqAV8KRnnbTR6qQidlMK+l9kKUZd43Ls6stBh9VYoYxlusQKF5FzUFhOIXFn38upo+QDejjTG39oUyYpDp/gcQwugLvSBDtWfcIGpJlE9ikCUkBAsaAgOXarRDbnzgNe5J7joqPylc7LfHSQTTflBplH5qAlfgr4x8mkxJV3FleMi/E9z0sXI/UavnePw7ZRZaqkIZos6wdxMbv3+iFpsTl6ycPNXWOWtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmblM95zvi2ytozurVmKkWMS6LTJXUZA+FjuQuy4Brw=;
 b=OThx/cSOIooUslYkRKLX08FWpc/qto2zZXPR+mi3vftKINrm0NBz67KxfhGIaBQ9D7g+oAkXQRWqu1g8Rx4GGYlpNnZLcobT2Qtyk4VviPXNnqWesLRSAJEF3LFxjqfJH9nWWGIxFkGjS1w2GTyTbzHFbRcwsdZn2mtb9ntcVKBShMGaM93ecbx1pbTu5vvhu69Y1e7jfjDO3LCtaUeXQcmDh3WzRYlahZKlTj3h6QF6uoQesHw5jVjsUrlbzPNkN0paIWp2bVllflhO5naeNnzRp0RTk7n3gIYD8TQb3jmhLX+sL11pCTj7DDUQP4NLikh7vNhcmDTi8vgngukLtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmblM95zvi2ytozurVmKkWMS6LTJXUZA+FjuQuy4Brw=;
 b=1yH6lmG0NOkBJEwHNgmeTWShUeogFlBM02ud79eOoP9pWFtoPgVDjbhkGpv2JO9XL4CmdcJ7fjbgwKoq94rYwuYb8CmF849ZEp1Kqs+YE8CfZj3tl8MoPtyex9tJVxHh7Iv5jWvFS4G9HtbtMr9LC1uDx7GEA6/5uSGvVo/H3Js=
Received: from DM6PR03CA0101.namprd03.prod.outlook.com (2603:10b6:5:333::34)
 by DS7PR12MB8201.namprd12.prod.outlook.com (2603:10b6:8:e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Tue, 11 Apr
 2023 22:48:04 +0000
Received: from DS1PEPF0000E655.namprd02.prod.outlook.com
 (2603:10b6:5:333:cafe::e0) by DM6PR03CA0101.outlook.office365.com
 (2603:10b6:5:333::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.40 via Frontend
 Transport; Tue, 11 Apr 2023 22:48:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E655.mail.protection.outlook.com (10.167.18.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.27 via Frontend Transport; Tue, 11 Apr 2023 22:48:03 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 17:48:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 17:48:03 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 17:48:02 -0500
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
 <stefano.stabellini@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Thomas Huth
 <thuth@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: [QEMU][PATCH v6 10/10] meson.build: enable xenpv machine build for ARM
Date: Tue, 11 Apr 2023 15:47:46 -0700
Message-ID: <20230411224746.16152-11-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411224746.16152-1-vikram.garhwal@amd.com>
References: <20230411224746.16152-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E655:EE_|DS7PR12MB8201:EE_
X-MS-Office365-Filtering-Correlation-Id: 673a436c-a4c9-4ad1-4827-08db3adecf71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B7FppZGjYAs0J1RgHfhjQV4DfpRWg/VXFUte8wSnpWXIiZEUfQyF5/nmmmi3R1hKpx9pZhDCRvxUv2gR2C6LnBHP68Y2QQkM8HNJvI0Vo1uxIqbw0vrQGDEs/G7uenme8+09A5NjS34Wmgg7mNL6CnEz3kvPu2IZsJQOoXHrooe3xuGcQ2nE4zSNSV/D+vw8oI5EBgnfp0diW0BcSEoGqT/B4BqlHMSLQK3wzYD3Rv7RRcYiZXx/CaHVGRGAEWELEkTXwX6IKEHKQMPGDhY/KQuL8/5Qgtz6s8Fy84R7+I4TbhWqoQIYbNDsQMhmWsJuLtnCmzdNpN7THl5U8dfbEAH0/M50nEEwYcCo9oO9pQM/PqHF9IwwAp6vmnXEVrMhC8n2gip4D3Rp2QPAowQ2fsLAclE+WiKRPVKUKHnBuLMemfATYT9iC5Vr+kFfv/ZJYVVVS6RKm8eKp0EGF9GbmTCHlncJtGsqcw7O3IHJtsPi8rVVHpQecxk80b4FROGXQ29BWSJgkbEIHZdH2/ISrfdkfBQelYNXAsZVtiH5a1rMC1PHw0yvBCoEGCmfUk/7knWqyqplIkaFTLgtnwujiEGLG41bOpgXDgMcWbIWkzGCy45Crm+YsGDG9UHhGz1x72+WWkrKrJ5yJRpeiyVDsfNncGEO2gALLq4QfmU7wyKDj/fa2yJXwqWGkxxh5vZ34GJY3I7XTdul2wXbNa+zLeRcKGXAhIDS212cNzsA2Us=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199021)(40470700004)(46966006)(36840700001)(6666004)(478600001)(26005)(316002)(186003)(54906003)(2906002)(336012)(4744005)(44832011)(5660300002)(70206006)(70586007)(8676002)(4326008)(41300700001)(6916009)(8936002)(82310400005)(356005)(82740400003)(81166007)(47076005)(40480700001)(66574015)(40460700003)(36756003)(83380400001)(86362001)(1076003)(36860700001)(2616005)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 22:48:03.9578 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 673a436c-a4c9-4ad1-4827-08db3adecf71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E655.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8201
Received-SPF: softfail client-ip=2a01:111:f400:7eaa::61d;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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
index 52c3995c9d..eb5bb305ae 100644
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


