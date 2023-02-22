Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6316A69FA7A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:52:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtGx-0002Zu-Lg; Wed, 22 Feb 2023 12:51:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtGv-0002Nj-8n
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:51:17 -0500
Received: from mail-mw2nam10on2062e.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::62e]
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtGt-0004hj-Be
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:51:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AERNimqqEwHGzR6brX5AxXmIlJgmZPIetInzpXCjz7bTO7XC/2oJWf+so7uQa5Ml+7y++TCOAcrWO5JxTbs64gskgMBr3aJPK1XxkmdXaGMduBaVF2T/4C7D2Uqm7D1hZW1K6X+sU0PDI/JA1KiPEcvWHKgFxAYg2b0a9sLsya1VSX5jS2XbGqSxojy5dfCl/Dvil2kSXRfs+nv8Kmr8OldyLYGcNq+nEbtzZHvJYKPzsz0rl+1M8oAc4xV/odvl2KnQdmwjMAMkvUvynAhx6BiH+RQs1fpFYxGrz6TDdTeOOaGNPcQVJoQkfXTbPaBs5imJHY9VYnGE39QH7aQetQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1BvjsoS1EXvcvulu+xjNLg8P8QBhrafJDQ8shKEzKM=;
 b=A039gxKuwZnBgp88FTD+/n1MD7xh40FHteU0bmaY7zOvx4CrW6tbTzg4puXhlrvf72GFP49j5m/WxzuGE9PjFksWZ45Q57kA1unsz6IYoGC2rksX++QIzCwGKdomtUgehcqcmjPQStQhB+3DDqza6qN1yXG8Cx8QdPQZdLrckXXu6kr1FkocMtL1GcGQZUDG7eHa5COCg/6NmjFP6O256uqxtS9H4vfNO8tDAykeC/g6MJC5ANLov0199QXKShdJqOftEtbk9qUCPQuPgssb0vi9BGPdYiZls70gJhrW/K1p4MLwVIv3f2J2GLTBTwrDNXId5d5vJSa7PB7zrH210Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1BvjsoS1EXvcvulu+xjNLg8P8QBhrafJDQ8shKEzKM=;
 b=V8gyhKXLfc2sBJSwDUAqj33r+GG6C14Gq2q2Pg0lprYrhAvavrxTOf+uDXikoJUeI4CHolsKdEGjRqF2K7HBIdsPt9oeOAtwWNO5svi6fIqH2UJ5zyfOR/Q8IXUlOFR0GRuEytEOQA7oCdEuufFmEFqpadfV4DFQUhG7aaE828YAdLGhfAMnKvZitm8cND6Ah+IclqcwsBtJWXhy/NjK5m7ly4aV+8TYuDOZAZudl9cmJ8RuSu6eZuQmFvXV5oiwkAkMzf1FZxY+3tgq49QgpKK4xMDcvtHYYMKz6V9XHsQDex2faVx8bxK2yQlbU5dRW2//VGQtNhk2liMmmxY/1w==
Received: from BN0PR04CA0147.namprd04.prod.outlook.com (2603:10b6:408:ed::32)
 by SN7PR12MB6909.namprd12.prod.outlook.com (2603:10b6:806:263::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 17:51:06 +0000
Received: from BL02EPF0000C403.namprd05.prod.outlook.com
 (2603:10b6:408:ed:cafe::ab) by BN0PR04CA0147.outlook.office365.com
 (2603:10b6:408:ed::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21 via Frontend
 Transport; Wed, 22 Feb 2023 17:51:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0000C403.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.14 via Frontend Transport; Wed, 22 Feb 2023 17:51:06 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:50:49 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:50:48 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 22 Feb
 2023 09:50:43 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>, "Jason
 Wang" <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "David
 Hildenbrand" <david@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v2 15/20] memory/iommu: Add IOMMU_ATTR_MAX_IOVA attribute
Date: Wed, 22 Feb 2023 19:49:10 +0200
Message-ID: <20230222174915.5647-16-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230222174915.5647-1-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C403:EE_|SN7PR12MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: b3eb0015-773d-449e-88df-08db14fd5f6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4UceuDxWyl06eTY8+PXwVEGjgdUo++zWv2QYPhVnOucCf0fo1FQb8Sfg8s3lRidqRLewP2j06svEuXLU+Fbp+p1aZUVku0CmZc/1J+aYY+hJRFsShyddK2PqebGpuFi8ozQ9b3TBfJu1LUw2wOaUrX/jk9SzEkGPyVv3y9AcCdMRv5311FlQK6h7cKATOEhNYngNd3SnJgqI5kgshPmORkwDoCSn5UsUrKEgRgVmAJt3iqfmxq1Y1auqU7SAB6OQ6V1F025yKZiGeLBJJXByv2VdLHORcCET6sM7ULN6iGBgzecZAdwcMKnSdgSOmX+/qDXeSWuHTQiNs7VTfojWX0HlNupq9R+6sS1VtmWv9w3xOwMCOQb8PpKgV7Eb2Zk1DUN3oXCM9cZuvqJ0Mvl4hq2zf1XoDd6BQcgPctOCFdDu5xnu4j/w9jXasxTmm1+9sfuuFKzXSvE8ImJtHRYl45Ofzf1rKTfC8XrWtoWAmPVKSAkL1wPsLH0E38SjZaLlz62a0ID20yvaD1qWQV6cCAeNBOgQVhKevXGR5qI0hzWkNoy0OLxrkwGn5tx0rtWK0zauzNQZI4aKud0A62knh0yqN4h3oLPaN9GIt6jr6jYa+OEHaCXoDVfmZXeMcCdFem0I6TQZK4UaPHJ6nUYWFmcs+AQm6TIpIUsf7sy7D58qIYY0KhSiGWf10jM6SKXKfIj0ehFCSIIXyZ57ayovzw==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(426003)(47076005)(83380400001)(4744005)(36756003)(2906002)(5660300002)(7416002)(1076003)(54906003)(86362001)(41300700001)(478600001)(6666004)(7696005)(82310400005)(36860700001)(7636003)(26005)(2616005)(336012)(40480700001)(186003)(356005)(8676002)(40460700003)(6916009)(316002)(4326008)(8936002)(82740400003)(70586007)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 17:51:06.1280 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3eb0015-773d-449e-88df-08db14fd5f6a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C403.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6909
Received-SPF: softfail client-ip=2a01:111:f400:7e89::62e;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add a new IOMMU attribute IOMMU_ATTR_MAX_IOVA which indicates the
maximal IOVA that an IOMMU can use.

This attribute will be used by VFIO device dirty page tracking so it can
track the entire IOVA space when needed (i.e. when vIOMMU is enabled).

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Acked-by: Peter Xu <peterx@redhat.com>
---
 include/exec/memory.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 2e602a2fad..cdd47fb79b 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -316,7 +316,8 @@ typedef struct MemoryRegionClass {
 
 
 enum IOMMUMemoryRegionAttr {
-    IOMMU_ATTR_SPAPR_TCE_FD
+    IOMMU_ATTR_SPAPR_TCE_FD,
+    IOMMU_ATTR_MAX_IOVA,
 };
 
 /*
-- 
2.26.3


