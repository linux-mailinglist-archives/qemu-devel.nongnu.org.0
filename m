Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 055AE67D4AF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:53:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL7MK-0006rB-01; Thu, 26 Jan 2023 13:52:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7LP-00066h-29
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:51:35 -0500
Received: from mail-dm6nam12on2040.outbound.protection.outlook.com
 ([40.107.243.40] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7LL-0002xc-Cu
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:51:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nF2S0VlwHK1CHMHLWoIrcJ4crDHyrSe99c2iYQHFiCfgoZOl920mZjjCmMa51hjldEgqIVkNbO1jJu+BHOd0aQJsU8sJqp57FyQjrwIVsueWmKJe+H9kxiGu8TI4Bd2cfH3+fgplXEAwLKW98OPfq7aeY4YGhQnOvRTj+MubKD5636ZJKopkK2yLXVAO1t8IWAe6GO6tybw6WYz9kYb/heR/HUJx+bddZZ1YjgD1aO7nrymbzoyyyMS5tpWcppcgfguBzAGFwQAcQlr0Fz51xjkyTzF9vHZmKB0x1Wphq1JH6Pxox9V1Dv6lDmMqY+pi53Uz9cLefsuZMo7VqgYtWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbDwoweDd3MH+MNMpLa0Y6rjEtRiBgczu1QLVX78AFg=;
 b=HBNK+CSAe5iY1H/nbI4L+UXw1Bqu1NhqQqVq7ENFNYwVi59wCASQc9THIHi6utQTLS62MgmwqCrdAKeV5znFNd0IdCR09Tb5OoykaGNMnY7kEy9mJ8zyenm8QbiBWl99BwUwJ9qOnpYz/3N0UtAjuZSp5PrvROjdm25v3QVgmO45yqdJ9VV74GSXu0A5pUbe+LgKBoV7OFrVpja2nXwSRgjjIr6HmN5/dp0Md0LFhxzJFdklShh9LtIgBqcnSJVmRZHfJStQ4ijPBqG5FnJk+rA/RGmj2gqvqQIbM0ADYaB6egTDAv6JhyP8zA4NAwQdbiLeBP03JK+r+yAElT9HTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbDwoweDd3MH+MNMpLa0Y6rjEtRiBgczu1QLVX78AFg=;
 b=XRHkFG5gQmIEuWvlSGQWErgK4yLPO2YRaf8L2hGNrO9hDDwnqMIjK8CFuLnbjAVEhP4kyhDXE2Q+cX+J4GsL91pAHpcK3fq/qF7MOblZIY4S9ZIz/3BbqNLa4w9iw7GeBVdP1sCk0E+JvkGmuUemw1SCn3r2mCv5cHluhy/mFieP/yyXgO2SCoVaSsHY7f5PIMK99ROe0qrVlS1S9BGs6TYC82uMZZqoEp9Rsz3JOSpCVAbr7Wxjz98C8ejzQtz86JNP50gfvBinIRMFnLIxGfCDhM7l6Nr81kfh2aUKWbEhAuDEqWhfUphuh1vv2Ge9bH7tzDbJOiw4gXxdkGDZHA==
Received: from BN9PR03CA0576.namprd03.prod.outlook.com (2603:10b6:408:10d::11)
 by IA1PR12MB6161.namprd12.prod.outlook.com (2603:10b6:208:3eb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 18:51:24 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::55) by BN9PR03CA0576.outlook.office365.com
 (2603:10b6:408:10d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Thu, 26 Jan 2023 18:51:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Thu, 26 Jan 2023 18:51:24 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 10:51:15 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 26 Jan 2023 10:51:14 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 26 Jan 2023 10:51:10 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Peter Xu <peterx@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "David
 Hildenbrand" <david@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH 18/18] docs/devel: Document VFIO device dirty page tracking
Date: Thu, 26 Jan 2023 20:49:48 +0200
Message-ID: <20230126184948.10478-19-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230126184948.10478-1-avihaih@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT022:EE_|IA1PR12MB6161:EE_
X-MS-Office365-Filtering-Correlation-Id: bdab153a-24f1-495d-3743-08daffce52eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1MdNuVbcFhiEDOjmAhMC+Mn6GbxmwzZgeahVg7U2qQRcHQz0iADtsJ1mT/b58m6Fbq8k6O+hruaFVAzu4dUAwXbkQUR0x1aEtY6pz3TasQPDqkVYhP3rnKL5ogXNZAnepXlgQ8FBBmeJHYx9QYDxmdN1sDdId0S5hvZPERmbWzlTlXwG/ICaeJxGMu7Y7EEhB6+y5lasaQoA51lu702sVC/yUJgTxOrxi0VAo2qWfbUW4hr/vLAFZp7wDmh89wzNnnxnmurjqCDvbK5nEGZ7isFUTlhH7QEjNMkWiz6JE2rHzp1/6eEqwjV9UrThOfmhCxn+6nvNuAFhZV56qNB54MCyivAPZoOE8nF7Mbg6NT8d5m16E6gPaNdCaQRASEe4F7p1EGgFOxTVZcaczqsDZg7c5/ooNaPuYG5i0gvnmfZ/uYLWkCKPaacCjNZLD8rAaCDxOayw9JwFLYIiCflFep8crlbTX0L+SnX1aDSAvRpRWgqi79bpQvJpJQ956pHL0gvb5sAImblDRFCbLuAzwKaIRuAEGCVB+KI4jPr2YPDF97dMeiGtD0IoHnn1BDxn8FBXeoikib73AlUe2FkHiKXa7Wfh/qG5HkZ+4e//LxXAR5BIBMGrUMjDGRr9cFrXw2hpqgTkYqHqO3XfN5ZoJ6k/CJL8KovXKqKRqUjaL9s5AshhK0sRbUUoiMapC8KGiTytDToKZcAsfHitwPEsqQu4RSd7s+CRFr9G+KT/+eE=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199018)(46966006)(36840700001)(40470700004)(40460700003)(7636003)(356005)(2906002)(36860700001)(1076003)(2616005)(186003)(26005)(6666004)(40480700001)(86362001)(426003)(83380400001)(336012)(4326008)(6916009)(7416002)(70586007)(70206006)(5660300002)(47076005)(8676002)(36756003)(41300700001)(7696005)(316002)(82740400003)(54906003)(8936002)(478600001)(82310400005)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 18:51:24.3808 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdab153a-24f1-495d-3743-08daffce52eb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6161
Received-SPF: softfail client-ip=40.107.243.40;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Adjust the VFIO dirty page tracking documentation and add a section to
describe device dirty page tracking.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 docs/devel/vfio-migration.rst | 50 ++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
index 51f5e1a537..c02f62e534 100644
--- a/docs/devel/vfio-migration.rst
+++ b/docs/devel/vfio-migration.rst
@@ -63,22 +63,37 @@ System memory dirty pages tracking
 ----------------------------------
 
 A ``log_global_start`` and ``log_global_stop`` memory listener callback informs
-the VFIO IOMMU module to start and stop dirty page tracking. A ``log_sync``
-memory listener callback marks those system memory pages as dirty which are
-used for DMA by the VFIO device. The dirty pages bitmap is queried per
-container. All pages pinned by the vendor driver through external APIs have to
-be marked as dirty during migration. When there are CPU writes, CPU dirty page
-tracking can identify dirtied pages, but any page pinned by the vendor driver
-can also be written by the device. There is currently no device or IOMMU
-support for dirty page tracking in hardware.
+the VFIO dirty tracking module to start and stop dirty page tracking. A
+``log_sync`` memory listener callback queries the dirty page bitmap from the
+dirty tracking module and marks system memory pages which were DMA-ed by the
+VFIO device as dirty. The dirty page bitmap is queried per container.
+
+Currently there are two ways dirty page tracking can be done:
+(1) Device dirty tracking:
+In this method the device is responsible to log and report its DMAs. This
+method can be used only if the device is capable of tracking its DMAs.
+Discovering device capability, starting and stopping dirty tracking, and
+syncing the dirty bitmaps from the device are done using the DMA logging uAPI.
+More info about the uAPI can be found in the comments of the
+``vfio_device_feature_dma_logging_control`` and
+``vfio_device_feature_dma_logging_report`` structures in the header file
+linux-headers/linux/vfio.h.
+
+(2) VFIO IOMMU module:
+In this method dirty tracking is done by IOMMU. However, there is currently no
+IOMMU support for dirty page tracking. For this reason, all pages are
+perpetually marked dirty, unless the device driver pins pages through external
+APIs in which case only those pinned pages are perpetually marked dirty.
+
+If the above two methods are not supported, all pages are perpetually marked
+dirty by QEMU.
 
 By default, dirty pages are tracked during pre-copy as well as stop-and-copy
-phase. So, a page pinned by the vendor driver will be copied to the destination
-in both phases. Copying dirty pages in pre-copy phase helps QEMU to predict if
-it can achieve its downtime tolerances. If QEMU during pre-copy phase keeps
-finding dirty pages continuously, then it understands that even in stop-and-copy
-phase, it is likely to find dirty pages and can predict the downtime
-accordingly.
+phase. So, a page marked as dirty will be copied to the destination in both
+phases. Copying dirty pages in pre-copy phase helps QEMU to predict if it can
+achieve its downtime tolerances. If QEMU during pre-copy phase keeps finding
+dirty pages continuously, then it understands that even in stop-and-copy phase,
+it is likely to find dirty pages and can predict the downtime accordingly.
 
 QEMU also provides a per device opt-out option ``pre-copy-dirty-page-tracking``
 which disables querying the dirty bitmap during pre-copy phase. If it is set to
@@ -89,10 +104,9 @@ System memory dirty pages tracking when vIOMMU is enabled
 ---------------------------------------------------------
 
 With vIOMMU, an IO virtual address range can get unmapped while in pre-copy
-phase of migration. In that case, the unmap ioctl returns any dirty pages in
-that range and QEMU reports corresponding guest physical pages dirty. During
-stop-and-copy phase, an IOMMU notifier is used to get a callback for mapped
-pages and then dirty pages bitmap is fetched from VFIO IOMMU modules for those
+phase of migration. In that case, dirty page bitmap for this range is queried
+and synced with QEMU. During stop-and-copy phase, an IOMMU notifier is used to
+get a callback for mapped pages and then dirty page bitmap is fetched for those
 mapped ranges.
 
 Flow of state changes during Live migration
-- 
2.26.3


