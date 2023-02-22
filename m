Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB71B69FA78
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:51:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtHH-0003JD-8N; Wed, 22 Feb 2023 12:51:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtHC-0003Dw-Cx
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:51:34 -0500
Received: from mail-bn8nam12hn2032f.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::32f]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtHA-0004mT-JZ
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:51:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZY0K3NEeDWfK9LWJmijhr1L/9gmIQInumhatMKDtQAAWwJ3aYIGV05/MabIc+d+FJN0lTT1hpVNVC61WkcmlJJvacRTOk7NvocYIcAMV/l48IHPRkyPL2j5OrLVhvk8f/FwxnETHMsCqUfd5q67jtwUJScnXkPPv9NsH5kLieMZOYyupbSYoyxF7NNdbwiZEGrpoKcg8BPLD/EWENNeem74Bqm0VbF9ecwH0+nqkoWV197Vfy1LaLlbp64OF/gbwG7VOTL9s24PA7bQpWkfbic0vVMpZIu2ZOAr+U+gvxyWuX6o9cK9VlRya/lDxmHkcJCxjyqO+BItFc4Curq+qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKPX17EF4CWtPAgcRWN71q21MhmJKg9uuuViT8+0PUQ=;
 b=hlS0AeTHTFFkpYULTy+os/PDNuifsm/Xx781aRi4OoVqniAZc//REDxACEFprJVa3Ok88l7ag1MeaYjt3PpxipUUtbbC+l4RXqxxDjW/Lx//bi6kCY7GdT/4ddLSRCWh80CaoI+3nNOUCYqcPyi+J6quvcV5gfeMoHxB7jdeJZ0ZqUMuqxJMCZrL5z0Iu7AROXIrAabdE5q6RxaRfP8pHiaU8lXa7qCoL+G6+AfXbl8WMr1Oh7qQrIspN9FENV1Yx6mFGZnaYJfSoInNlhrkrglRUdbgS2LxtShuD2J4lfc0OCJE3uH7qt9BXJuDaHCSNZyww073izTTsoMbhsBMbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKPX17EF4CWtPAgcRWN71q21MhmJKg9uuuViT8+0PUQ=;
 b=UKjeqCZjy4FiIZSGSWCX06mUSEd6CfeRtLnvPXxxS9ivRZdpyc3Cq5S2ZLzhfraE5oI7GlUouf9ZK2twxNYp5uwJM3z/djOce6WWOdLNqT6tRHKlveLVR4z/1thQclQ/D7jjxvySkctEqzlawzfVzYgoqmP3OGV6t24dcQLP7DJ92wXhRV60WF+HY+p4Wg6hVix+PMODzKQA6A3FiSxT3PvXxHaijwkpajTWmDbbHc42xcL+rDsgzF1Qi9OapXSL1J899/xajH44lWCOIm4TJch+cu+u3qsISvXIwStgCBwxnIHMYW3+sfkuP06bAeFqVLui7FOi4Rd8WOaCdhGH9A==
Received: from MW4PR03CA0222.namprd03.prod.outlook.com (2603:10b6:303:b9::17)
 by DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 17:51:29 +0000
Received: from CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::55) by MW4PR03CA0222.outlook.office365.com
 (2603:10b6:303:b9::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.20 via Frontend
 Transport; Wed, 22 Feb 2023 17:51:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT087.mail.protection.outlook.com (10.13.174.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.19 via Frontend Transport; Wed, 22 Feb 2023 17:51:28 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:51:11 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:51:11 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 22 Feb
 2023 09:51:06 -0800
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
Subject: [PATCH v2 19/20] vfio/migration: Query device dirty page tracking
 support
Date: Wed, 22 Feb 2023 19:49:14 +0200
Message-ID: <20230222174915.5647-20-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230222174915.5647-1-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT087:EE_|DS0PR12MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: 01e12957-6020-42ee-6674-08db14fd6c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /PQMHbeZ4kHS93gifaZaDgW05KmKfKRy6bm7OZedXATY7XF7HsA+l5yN0sK90A0mOvKgp5SPx50GEZJZ9N5uXKCmxC0EK97D7bz4su9irQJ6J0ezfs8Vj6IOZM9E1/2qib2bNLEzPn5sIECbYFhQp0/quiqh0x15sDCSWButDyl1LF1fwBkaDIhmIA9wXWvmbzPeHFIKyv6M+CmSWw/AmGUHvqX2pHZan/X1J/um9DRDmJrD28Y/mo5+SNRhXQvV1rAKW3djkWSOC/IDIDzXd9cCydTpN94apqNTUpnbXqD8vIqyAN/aTyHneKjm573LX4kZWa8CD6TBk9Rg8kHXDtVf9MBuZKdOzNhLq79QVh58rgSbMdH1cFaS5sAatbuJGF3z9ZkXvKX8YE5XWjUuX/Ad75lr51EJAG03t0jM1BCFb/cefllcLB/Y9fJ6AWpYWYEVR/TAK9xwA3SebsR99MjuAEFNYJU15O0kmZwdjd2u73lqBvXBYViXeoGwnM8a9oa1fvGk09OsliljvbxAWX31dW3Lxr2YcE8OA9thdER23l16xIRDxeZvIHbyU5av2N73I9aEQXl02JosbDp8VphNjyfNAM4U1OvHfXpwVYThq0d3mtNKkK18aqlnUrfFh4IWmxC2Q9F2hnu3UbC/jMqs1pa0Gerl9BEA7gg9j/mLRqndjEG7AP0L3J/U7fSQo74R9J29qhl3KzLPUHteu4/5B/7jUGFa5/mG+B0/5EOSBDE/PZXuq8q8QdWu7ogNnrk4kvno7hxkcXKmCxTs+WaEOVdX7lxm6VDjEKXBG1w=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199018)(5400799012)(46966006)(40470700004)(36840700001)(186003)(426003)(356005)(26005)(336012)(2616005)(1076003)(6666004)(5660300002)(41300700001)(36756003)(47076005)(86362001)(8936002)(2906002)(40480700001)(82740400003)(7696005)(40460700003)(82310400005)(6916009)(8676002)(54906003)(4326008)(36860700001)(34020700004)(70586007)(316002)(70206006)(7416002)(7636003)(478600001)(14143004)(12100799015);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 17:51:28.2279 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e12957-6020-42ee-6674-08db14fd6c88
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7726
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::32f;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

From: Joao Martins <joao.m.martins@oracle.com>

Now that everything has been set up for device dirty page tracking,
query the device for device dirty page tracking support.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/migration.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 307983d57d..ae2be3dd3a 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -713,6 +713,19 @@ static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t *mig_flags)
     return 0;
 }
 
+static bool vfio_dma_logging_supported(VFIODevice *vbasedev)
+{
+    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature),
+                              sizeof(uint64_t))] = {};
+    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
+
+    feature->argsz = sizeof(buf);
+    feature->flags =
+        VFIO_DEVICE_FEATURE_PROBE | VFIO_DEVICE_FEATURE_DMA_LOGGING_START;
+
+    return !ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature);
+}
+
 static int vfio_migration_init(VFIODevice *vbasedev)
 {
     int ret;
@@ -748,6 +761,8 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     migration->data_fd = -1;
     migration->mig_flags = mig_flags;
 
+    vbasedev->dirty_pages_supported = vfio_dma_logging_supported(vbasedev);
+
     oid = vmstate_if_get_id(VMSTATE_IF(DEVICE(obj)));
     if (oid) {
         path = g_strdup_printf("%s/vfio", oid);
-- 
2.26.3


