Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B23A55B4371
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 02:51:00 +0200 (CEST)
Received: from localhost ([::1]:34136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWoi2-0002tZ-Nn
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 20:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1oWofN-0001AD-Rf
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 20:48:14 -0400
Received: from mail-bn7nam10on20615.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::615]:46962
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1oWofL-0001zw-9S
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 20:48:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHZRMj0WFgdRZS/ZlBWAcqEa/WOt+0rt50e6SQEa02OVHEGV7/kghpSS2xaHut8x3+kE8M8gux4XKZiRmMP53bMvoTQ/CbK/8EBl7fq1KondrswaAbUApRQRw+j9YRqDj+6BXhrmOycR0m2fmbC+xtEpYh7GMgMTgmcyg9wArv/M8gR/Nkghygz+0eZa1ZmKj+2uRoEGraMEf7cSd4nbQTz0b4tR0DRR7Siw/h+KlWeeJAyhCDFC6AVxOOTed9ktz2v9R9KjjO41M1VHB2XGXxHnxiAoYLb67/hDGVW4Ny460vncLo4/IyA8a5fFRodk7Ty+YF8Vir30OCuns+iuag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mh5uFP/HSoLwvGAwVYOUbF43kEUUh6XIu8AOcjfpu8=;
 b=hrjAZK+Ef3E31KSgt4gKe+b4fitEz7DGat7ObAY8kAqScXWMQjiKeC2yL8+W3VQY4TOfVR8Fdzb6umsN8WI8YoJj2rlG/Nn5mRI7zcM4/TM053WBbWix0htsygA0HE7NfeYMxghBAmXmg6LNkLxkJWkpYVqoFzsTE3aI+PTb2YgdvngiNqV+lBLF8GmVJDN47rlm8f2CutfvkjmG0dEIySCLoPR4xBHOpBQk43Pu0RmvQkfDLS3S1rEyRv9EvjfRuF5cbwE9EAn8X6QBTAGyeDLpsTzAQYuLFjWAIFdXxjd/xm4om30nq7FiTkP6aGJj1tcDsCIqU4Ry6sLuaCaPZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mh5uFP/HSoLwvGAwVYOUbF43kEUUh6XIu8AOcjfpu8=;
 b=gQMhhI9ExJoOFL2uOu2OreFhEZ6wSioNF1T1Lt/hurCYOViUXS7drCYAwE6ZejGT3Q93ZL5+Ow+k1SH6Lc6/HoyE6VaNErUajuZ/muOmVunpZJDCCMWNPbUFN7/HKg9JfrteRhC92705ygf7L0ytlVfuXAksyH01IpCZ8C/rOiu2HuKgambYzdK0G/kq7e4spe2WQE5rWnI+JXIkoVQ6ac3Dy+gciaFH+yAgCS1tCDwytPvr/EvXoSmfyQInuFgEA2X31GEYBjUCTRJEItwQa1Hf7+uE3/eCIaxo+tdvFhI+4n2NVREdmxhhKgPhQhAija3Y9L7ZH0FjOKGJEmvY/g==
Received: from DM6PR02CA0096.namprd02.prod.outlook.com (2603:10b6:5:1f4::37)
 by BL1PR12MB5287.namprd12.prod.outlook.com (2603:10b6:208:317::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Sat, 10 Sep
 2022 00:43:04 +0000
Received: from DM6NAM11FT077.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::9) by DM6PR02CA0096.outlook.office365.com
 (2603:10b6:5:1f4::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.15 via Frontend
 Transport; Sat, 10 Sep 2022 00:43:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT077.mail.protection.outlook.com (10.13.173.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5612.13 via Frontend Transport; Sat, 10 Sep 2022 00:43:04 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.38;
 Sat, 10 Sep 2022 00:43:03 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 9 Sep 2022
 17:43:03 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Fri, 9 Sep 2022 17:43:02 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <alex.williamson@redhat.com>
CC: <qemu-devel@nongnu.org>, <kwankhede@nvidia.com>, <avihaih@nvidia.com>,
 <shayd@nvidia.com>, <jgg@nvidia.com>
Subject: [PATCH] vfio/common: Do not g_free in vfio_get_iommu_info
Date: Fri, 9 Sep 2022 17:42:45 -0700
Message-ID: <20220910004245.2878-1-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT077:EE_|BL1PR12MB5287:EE_
X-MS-Office365-Filtering-Correlation-Id: f121158c-68e4-475c-d613-08da92c56bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TJp9Q7Xy54u44OfjRAv2koaIb5oNFXDvFHi+PHr0ygYFR5+1QywxsHqI9HStWXIlSrdHS83QXCgb79r/tZ++H7hxl4eeXL5xcmIGs50mlCnq2UTggfRw8eOrTFZ8mbMSBlAwIgC2JT2Pmz0yVfp0eVoBp3XcJye/pD9BKZcVMWiGobh00m+eduBGBZGRovlCO3xt5Y6ake/sCRLp8FN9lGSbnLYDRn8aZAMjcFwtGgaxbPlmKOpt0ZXtcfSMqzoFPri1A4SsVuoxELAYcrdFKskDNS+PgQHrWvJQT3pjtVYJ+fQblLXaE9PgutHdmoYn8j4Eo1mdm/lLejtcpRxQvEnWcFGSa1nau8AW5DD94lrn0aaM1SP7qU4cCy5O4awwCfZv5DjPBCP11fLE16iPcGMHwO17NbKS3pWQrBtOKdLFm9XJGUyfQ5AT3+WJk96pPlzz0MDiPWmWwwDzZ906bsv1kS4NkCaDJUx9oIYlPxnggvludEH/acoLuzFymAv7j5YPhbixSMnI3KUgAzLdTsw87klUeEpN2/MteGTuIAl3yqdMi3CDQLyWHisDPDFg9FIzb375T0rLVUQStHGDTFv7vBg/2/O483D3c7DppXOeFa0hVFBNSNuYc6E8Omb/OLBmz4YMyjM0tQXeR+5hPaAQgI1WJiK2S1kU3dTggb739VBRLj+nk4uI8xiweX2EC3t3IIgklMg2fG4RzPBBk3q/1uSRTpYC9qaI7eGtGzA2E6MTUdfaFzX85cvLa3b79+QhGcu8N/SyPBVdaD8gD2WAlUuhUb61gI70ct/60gA=
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(376002)(346002)(136003)(36840700001)(40470700004)(46966006)(26005)(86362001)(356005)(82310400005)(41300700001)(478600001)(7696005)(107886003)(6666004)(40460700003)(36860700001)(336012)(1076003)(186003)(2616005)(81166007)(426003)(47076005)(83380400001)(82740400003)(2906002)(36756003)(40480700001)(5660300002)(4326008)(70586007)(70206006)(8676002)(8936002)(316002)(6916009)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2022 00:43:04.2138 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f121158c-68e4-475c-d613-08da92c56bf3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT077.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5287
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::615;
 envelope-from=nicolinc@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Its caller vfio_connect_container() assigns a default value
to info->iova_pgsizes, even if vfio_get_iommu_info() fails.
This would result in a "Segmentation fault" error, when the
VFIO_IOMMU_GET_INFO ioctl errors out.

Since the caller has g_free already, drop the g_free in its
rollback routine and add a line of comments to highlight it.

Fixes: 87ea529c50 ("vfio: Get migration capability flags for container")
Cc: Kirti Wankhede <kwankhede@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 hw/vfio/common.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ace9562a9b..51b2e05c76 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1940,6 +1940,7 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
     return 0;
 }
 
+/* The caller is responsible for g_free(*info) */
 static int vfio_get_iommu_info(VFIOContainer *container,
                                struct vfio_iommu_type1_info **info)
 {
@@ -1951,8 +1952,6 @@ again:
     (*info)->argsz = argsz;
 
     if (ioctl(container->fd, VFIO_IOMMU_GET_INFO, *info)) {
-        g_free(*info);
-        *info = NULL;
         return -errno;
     }
 
-- 
2.17.1


