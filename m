Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE0B6DE782
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 00:49:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmMmc-0006Yv-9o; Tue, 11 Apr 2023 18:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pmMma-0006YY-Sb
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 18:48:12 -0400
Received: from mail-mw2nam10on20625.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::625]
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pmMmV-0006Yz-Ax
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 18:48:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8LbizSGQNuImsKV2JiCgRPBuNK5PpUGtGUHwaXbJpk74fDJE761l4N6GgHgswxT/PD9p+9gwN0XuBKz5zwKZ6D1YxNMmldXsM/DCeLfnRPGdPcan4W+j6dqIULDqPGjs2x92Zg4B5iGsN7e5USuW449zzfD1xvS6Avt+9fXaXsT06hYaDLrRsYeVAAQ97tJEQTNf1TJKIBiHlAZDIo70pVG9Y+vQDedg3+9b9eplYaE2LdQGL3NUgn8mxBPMAejUL6RKTeUFtxjkQ8m9ExjEBR1AO8hf/5/25b68ELhwCXV9Qwhlc1eEo32d9kz01psUltYhrIMuIPQbHPglDUagQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4LfuuzS6bsMM7PpjlXU3TZGIWAHgT1E78TzwKVxfOw=;
 b=kX3WTLDJVpe3gWs9M1htHG5W2p1S4dg6ePhNSWkNg24vCxQ3+moozKUiUt1hSg2pa5zpaa6vqiKZtLWcTXzU0gPCueQjx7k/E8rQ4jj9yBuhfpTrd4Gl4fYVA7qfgDTWNah6637opWqYUk6SlOMX7NPoSdKTPrZqEBiFGISSId+RR7O2HyJqmZ/aO6ZAs+FTmRHA2y/6hC+hUHd22Cur3IhFj6+Ee3Grw1WiE4FdfgYECtdTjWq7Ta1Rq3K8hYOe7XIOTXe/LW+axLsINeDCvi2ThjFNT1RBJZk1OwC3jGGiiOEqSWb9JZ1sdIxIICcPXcitHPvQs/aDII7IOpBK9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4LfuuzS6bsMM7PpjlXU3TZGIWAHgT1E78TzwKVxfOw=;
 b=12o8kRtfU76dz/NFnJwmvdO7VN04cJ6r/o7cwWmGxggMqXQ535omGUktXEbDI4zyauW5LddOql6N1vdS0N8rcMym/ixpD9fdhtmDKu3tnobu/BaxQCA4OIlTHdcHRHQUme2asdwbDv7n68qe6QjUaNX/cIEUPgTqC+0/BPUY6uk=
Received: from DS7P222CA0028.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::21) by
 BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.33; Tue, 11 Apr
 2023 22:48:02 +0000
Received: from DS1PEPF0000E64F.namprd02.prod.outlook.com
 (2603:10b6:8:2e:cafe::ce) by DS7P222CA0028.outlook.office365.com
 (2603:10b6:8:2e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Tue, 11 Apr 2023 22:48:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E64F.mail.protection.outlook.com (10.167.18.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.27 via Frontend Transport; Tue, 11 Apr 2023 22:48:02 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 17:48:01 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 17:48:01 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 17:48:00 -0500
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
 <stefano.stabellini@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Thomas Huth
 <thuth@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: [QEMU][PATCH v6 08/10] meson.build: do not set
 have_xen_pci_passthrough for aarch64 targets
Date: Tue, 11 Apr 2023 15:47:44 -0700
Message-ID: <20230411224746.16152-9-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411224746.16152-1-vikram.garhwal@amd.com>
References: <20230411224746.16152-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E64F:EE_|BL0PR12MB4948:EE_
X-MS-Office365-Filtering-Correlation-Id: 4700fb71-d47e-4c98-4174-08db3adece6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PB56rwWPkNs4DeI0XxyZs93+wwisuZf//D1UMVN3p39f/P051boLubv1fI8fxeSbigREmTcptsy128NCGwgAGlQmqxkQM7sl34x3AG8x+qWeVhdwDEycr47NwAlglLigxdh6L2dtdLn46yKH5uT3GK5nXoWNbkj2GtALWQn/Fq4RwEDmG7Ql9dLO362xi4GmCtlF4MrRvvS5IT3fmQYBpTeyOgSCxI6zINaNyJucjUDd58taX1Lj8Qi/u6Adok9BXQCraHoEKbF1AURmyQTzNTd6PM1NvUlk4Dt2xAh+y7WUGuk/MYUKa2RByqWhaS7aqE7ffg6jYCbeusXrYV25YyzJn7wzr/QOESONsFpDYFaO+6JfFrLcqC2qvQQptW37Du8SePik4EQoBFiadmd/UKoFDj5knyZQM0dQ/qUj//tMN3Li1NklUgvsGYTu2JIGN7qazPyXjZ1Ay2C2pnH+0/xbBxrb9SaY0g8bG9Lu8+XvuZOHRtCHfp0fd+7dAvW9aHn3uxO+UiKuLwXRpo/zhKO/aFYaJVBwgUChu2SocKWt/MlIuxMi4yDxPfCllbuRIY3smtdACazUdh9KRHGvee4YmyVTPY+0UClf0DbZw2LfEs/TVe34JBkG4te2UfLpEq97sg0WEAeesg64m69LNGZk9h15Jm5sM2cmyj45u6W/KIAM9/zQkzfA/lPmAPZYaULj9JEF+/gFhaTRf4uKaTPr+4ESdXpJut+Xx1aLKrs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(46966006)(36840700001)(40470700004)(36756003)(86362001)(70206006)(70586007)(316002)(4326008)(8676002)(41300700001)(478600001)(54906003)(6916009)(82310400005)(40480700001)(5660300002)(44832011)(8936002)(4744005)(356005)(81166007)(36860700001)(2906002)(82740400003)(186003)(26005)(1076003)(2616005)(426003)(83380400001)(336012)(47076005)(6666004)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 22:48:02.2562 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4700fb71-d47e-4c98-4174-08db3adece6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E64F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4948
Received-SPF: softfail client-ip=2a01:111:f400:7e89::625;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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
index 29f8644d6d..52c3995c9d 100644
--- a/meson.build
+++ b/meson.build
@@ -1467,6 +1467,8 @@ have_xen_pci_passthrough = get_option('xen_pci_passthrough') \
            error_message: 'Xen PCI passthrough requested but Xen not enabled') \
   .require(targetos == 'linux',
            error_message: 'Xen PCI passthrough not available on this platform') \
+  .require(cpu == 'x86'  or cpu == 'x86_64',
+           error_message: 'Xen PCI passthrough not available on this platform') \
   .allowed()
 
 
-- 
2.17.0


