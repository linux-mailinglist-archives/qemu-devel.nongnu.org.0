Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B85CA69FA7C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:52:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtHV-0003ok-9x; Wed, 22 Feb 2023 12:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtHJ-0003QX-9v
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:51:42 -0500
Received: from mail-co1nam11on2062e.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::62e]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtHH-0004qD-9h
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:51:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8FZFBCyJ6oyHWSrfswi1PII5QGTzzgWFLWdK4g1881/8hYiUhYLvErDAVvuOEEnotcjT+n8X8K4EiFCacPReNjKd1wwJ26QAiK3GzKC3KKllOs2eiK7GckCe2cYWfniYB+0v/9SnW8ILg+5adK8BqUnjJok2m1xnJIr7HByDUDaLDnjFIDRjMs9vcLpvqQis3VDfMfmQSQqxlJPFA2lTHRvBGK47+VonbZ4155bfIYT/JZcIpZmNiZJtHoSwQNWUehpTGXm/oQvHoI8VBqN1CNIikVVsmhZhHpY1kvQrtLP9f4sPjElk+JmPlsyjsjWrUpbS3GIrhONb9vAmDmIFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jLoCLeXqy63DEZII3YZpoJOiPqLkWT9hMNOKwJkDoU=;
 b=mT10ohdGN/ADm4lVePcQLbZD/jaXy8FwNeKEzP7sO/Tn6Drg1gvGeRSbz6E/U53igSr6OjODAyA4W1IJ1QMcLQt0tEGVAhwxvAMiuONqwZlOz0THqchj2ZlYKfjEUQe9IIeOqAD4+qVX5/U337XYKKHNqDO2R3xQSLFQc/71nipjUK/ddlMY4tFVN7v2nQawB0r1P2kW9UL7m7YRehB+Ck7/W29Wz96XWC0wlAaSeCvDP03KhczrMVLqekGpeimIaoNumjE2C9oZoFfUbhCuEl1JavJAyjCM0wmYHs1D5famuu3K/KjiTIDioBmxFQG1LirEDPc4CaLXb9VnDINteQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jLoCLeXqy63DEZII3YZpoJOiPqLkWT9hMNOKwJkDoU=;
 b=SgZ7kySzLnctmi6RZ4y9TnkfT26Fp2m9bWTMu4iR+JlYC1DdVXMRwi9QCGddJwlkE2OJMF1Pk9FAjKmelXQCF+NQqmevi6euTVEM1ajP9dphTDCa/zzjhmxME73IxWUlAH0gMEfrd1C7+AfKbc3lcCAnqpYEFor5EBcWCmu7d4fsnIGAyOkEp7ecMY8CcFHNzcm8Ye0aVH0tD/dmnUqnggsO2G1hyYhsV0y7vrNmpRC/4pGHeUyr2ulYjJP9ZKweXS+F1v1dDSTopxB2FiCr5+vuSeVGv7obmkBbSpUih+Ec2em/HPbGicjhrqUkCr5JlUWh6ok7xeFIlsbRlTqi8w==
Received: from BN0PR04CA0127.namprd04.prod.outlook.com (2603:10b6:408:ed::12)
 by MW3PR12MB4569.namprd12.prod.outlook.com (2603:10b6:303:57::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 17:51:34 +0000
Received: from BL02EPF0000C403.namprd05.prod.outlook.com
 (2603:10b6:408:ed:cafe::d6) by BN0PR04CA0127.outlook.office365.com
 (2603:10b6:408:ed::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19 via Frontend
 Transport; Wed, 22 Feb 2023 17:51:33 +0000
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
 15.20.6134.14 via Frontend Transport; Wed, 22 Feb 2023 17:51:33 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:51:17 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:51:17 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 22 Feb
 2023 09:51:12 -0800
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
Subject: [PATCH v2 20/20] docs/devel: Document VFIO device dirty page tracking
Date: Wed, 22 Feb 2023 19:49:15 +0200
Message-ID: <20230222174915.5647-21-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230222174915.5647-1-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C403:EE_|MW3PR12MB4569:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ea2ff1-fe5a-402a-c6f3-08db14fd6faf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ek7ZIrqIuQ8lZ0ymtDEHZ4h4gdaPd15z2C2/xyfBGXcBBDliEkrc5BKpA0mfTZWeJid3cPKcC/G028LR9Jm8XuCYmZ3x2x9WLHNYfAzfAdtTEx30TUeYQCsJYLa4Z0/8l0PmnpRIOou3mIUjNGJFjuxfTmtrpmo9LEhp800EtusKw4QN8TlrATp3MxMkOjBl9TW+IqcVQVG2RX4vitmg+TYC2fJTIkX4B2E3/voVmlOj8J4TV3Z+QrE7aXGrv6uhnkIr+sTQUnjCjaSgEhz3N3oArIUntyxIsYXrn3DeYtdVCNbsLBqQU0qXTnXM6du2v7dNl+fO8d3CYO799kfYNPyL5fnnhU3SCizsb+9BzNsvVFcexcJCzX462slwZHdFbK/ptokOaNZAVEqNIF79pKZx4O/qmQQhS7C3yLwp4UG4cQd0PlWZcfQQHzza6WaeunyCjy5W77XmYkGL8DD1WxwW4V7ogJq8p5R1NGaTevoGepZ2joD1YzMdRlL5FhfTCQSfUomAXakp/8L3cM2sM3cdswp+hyF/tTTTBEaRlNmxDGx8ldh/uhNMyWliKuplneEfpkmKweghRHcv+PxmyTTh4fh/DTLAVsFxXKQOFMufY0b8QCk9/5HsAyPvYYnKv9J0ETK28gyafaUbEqaxpl8ZBjZUHb9rBjhZcazXTBFzpXXtvwNOcj3QmIs+QdS5awm8VmpSP+ezhKuD/J6zdRF2IXFY+Vj0B9Fn/+rpa+Q=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199018)(36840700001)(46966006)(40470700004)(186003)(26005)(8936002)(6916009)(40460700003)(7416002)(1076003)(336012)(5660300002)(2616005)(4326008)(47076005)(426003)(83380400001)(82310400005)(40480700001)(36756003)(478600001)(36860700001)(41300700001)(7636003)(82740400003)(7696005)(8676002)(70206006)(70586007)(316002)(86362001)(54906003)(2906002)(356005)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 17:51:33.3941 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ea2ff1-fe5a-402a-c6f3-08db14fd6faf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C403.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4569
Received-SPF: softfail client-ip=2a01:111:f400:7eab::62e;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

Adjust the VFIO dirty page tracking documentation and add a section to
describe device dirty page tracking.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 docs/devel/vfio-migration.rst | 50 ++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
index ba80b9150d..a432cda081 100644
--- a/docs/devel/vfio-migration.rst
+++ b/docs/devel/vfio-migration.rst
@@ -71,22 +71,37 @@ System memory dirty pages tracking
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
@@ -97,10 +112,9 @@ System memory dirty pages tracking when vIOMMU is enabled
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


