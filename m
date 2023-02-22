Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8E069FA7E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:52:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtGE-0000Mz-5f; Wed, 22 Feb 2023 12:50:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtFy-0000KW-Lw
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:50:19 -0500
Received: from mail-mw2nam12hn20312.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::312]
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtFw-0004UZ-DU
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:50:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSfCk0z+Unv+RwDdnM56eHfeZRkIZ8CDDpRcSUo+uj0BG9/irit+QSIiPsug7TTuudQ4THLUy5Z3Ny5Z8G4paJnEusdCaYFZQZHjf+gDY+BXfnkkQep5S0+8cMlOa4NDYaMir38890vveK5pe3KaEecrK8vVv08beWS8xh+aL2mZv2A2drcK/MB7M064IcJWHdgm96Xlt+dxlwzAaP7uN7+3qUFi7eWxGGU2g2ZNmpTrCXwsQGLl44qsiFZmzTNazM74Kx8KhJEBnqm82EkvzMHfFj5Re277WN1Pxm6YuLlFFtKmhQVfBBqfhNNkcB6iba3gIYNE3U4AMaUypE1D9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7YvrQ3fpbZHRvgyCYu+RNFSY9ltI+7XcevHIrZMA/A=;
 b=guHa1j/3/zd/FVynVdOqZ3ZcDsagmKP7KHSNEMG/EZ69tYcvUwgD7AIo0+HWtjYAZW+f9QXlhiCOVHwoIgt01r84FTX01QT9X1J4OuP3Y1i4QE5djI3WQvc/XqKUu1hQKfyKk4ycmTj/E1F0cc2vs7gUtTrS5X/21pe/HGfS6ioRHEWyCiuMSrIjfIF18O2lDCjwgm/+YIy0gB/FuoSxmH07NIevrpgz6oTRHyyKA4q9MKSCPUYebzpCAYGp2c266wk1dLX7rqYb6LgMAD8zs0p7yU5ruvSAWll1TCI+XOvjpVBifIGUo9oNe28zbvUAjR1SAj6iZBdxz+54y0+dGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7YvrQ3fpbZHRvgyCYu+RNFSY9ltI+7XcevHIrZMA/A=;
 b=mlnsYYiwU5a2E+FkEeeMVS/ofYFs3LmM524/ToGKHKI5t7VBkagc94WEnLxvNKZF+yczor/cI++MckABQLRIfzVjkeckKC7cxN6/orPrcdK0OhVy7iC7kOZirqeic9oBkwKV57i8gl9R371pAa2E3gErAzLk8vIBHx5gpebqtdNDGLB7CsbYa2QlEg8csy6GvIczMlZIF1TX+GNmJ2Gvsuu7XgC1Cebrob1qKmvo2aNlwW7V4B6qdxoQMucXZrxD6W2fgLPKR6cuqbw+NKuONHvRRuw7Ftn5pqA639hW1kMepMMPXs2aE5Dj+WrwU0Y8QODua+fHg7RMiA4ezkbXuA==
Received: from MW4PR04CA0210.namprd04.prod.outlook.com (2603:10b6:303:86::35)
 by PH7PR12MB7164.namprd12.prod.outlook.com (2603:10b6:510:203::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 17:50:13 +0000
Received: from CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::95) by MW4PR04CA0210.outlook.office365.com
 (2603:10b6:303:86::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19 via Frontend
 Transport; Wed, 22 Feb 2023 17:50:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT017.mail.protection.outlook.com (10.13.175.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.20 via Frontend Transport; Wed, 22 Feb 2023 17:50:12 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:49:45 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:49:44 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 22 Feb
 2023 09:49:39 -0800
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
Subject: [PATCH v2 04/20] vfio/common: Fix error reporting in
 vfio_get_dirty_bitmap()
Date: Wed, 22 Feb 2023 19:48:59 +0200
Message-ID: <20230222174915.5647-5-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230222174915.5647-1-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT017:EE_|PH7PR12MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: c50b3bde-92d6-4cc8-4191-08db14fd3f20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dsyVJu97Ww7k+c4hPDP2pGPIFxrlbyyhVjX5UkSL+jynqwrG5V3mabe3NBZgLOdsYyeiEma69ITbeMIiONu2vFc3bVOAEV78NrK5gqVq4WuX14DaURiBUng+e4UgIhcPoAM7X6M0gVhPVL6AvqM3cucx/Ff6IAP8sgzLYbGOkW0VK8UcSsTgPhhSHaKjE/9pvPoVRC2TpI63F4NqaczJ8u+y0lDC38A6rDzCQxd7tiIMA+Edi9OgSD5x3tLjmfywvj+Nb+nBhD0yk1LpBdjwKVWMT0zqswnRpcA1WNfMGyGwgK8I1XPCECcuS0kzV27pZJrKTqMG2p+ftfliv8i3VxoizgEMGO6/p89lR8nR/lIeVJXBIc6/IYkZ+1P8GEl3bJRXhg2gZlLkUhe+8w/CdBJlaKK98JUveJaOyIO8FwoqRDzX5npKI6uzeFbE4zXtw9jvMWCeOw1ZtlY/1pF4N0M5FRIw0mDDqAUX3YP3MfBwlcioQAHqV8FqhiWgaLmvZaxXqu2vI/jVw8lHkMBLCSJQX6B1nvzcuSGNYK41DgFyyC259IatclbWyayRN/Na2nTHhvGK7tDrkcNvDU059wfPVMOJcfhAzyNro8CxD/blNJFT6wf00Vs9ehMTMz5pSQtZcrOW8zU2TYP+BQxGtWBJwwTLGa/BO+mQk/T8VSku6gJaQ157JwCwsRjag2gZ4kpqh8uuLX9Gmy/oAkpAjZzkZMLP6lJ1RHSql19H5d7mTK1EK3HMUuMZ815vOR2QbWuBb0tWARsPIKsEnflYiBiUvFLJjfWGgYjyodsFpGM=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(396003)(39860400002)(346002)(5400799012)(451199018)(40470700004)(36840700001)(46966006)(54906003)(316002)(5660300002)(41300700001)(26005)(7696005)(8936002)(7416002)(478600001)(4744005)(356005)(70586007)(70206006)(86362001)(6916009)(4326008)(8676002)(82310400005)(2906002)(336012)(82740400003)(40460700003)(36860700001)(34020700004)(7636003)(40480700001)(6666004)(2616005)(426003)(36756003)(1076003)(186003)(47076005)(14143004)(12100799015);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 17:50:12.0479 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c50b3bde-92d6-4cc8-4191-08db14fd3f20
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7164
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::312;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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

Return -errno instead of -1 if VFIO_IOMMU_DIRTY_PAGES ioctl fails in
vfio_get_dirty_bitmap().

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/vfio/common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6f5afe9f5a..27db71427e 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1337,6 +1337,7 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
 
     ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
     if (ret) {
+        ret = -errno;
         error_report("Failed to get dirty bitmap for iova: 0x%"PRIx64
                 " size: 0x%"PRIx64" err: %d", (uint64_t)range->iova,
                 (uint64_t)range->size, errno);
-- 
2.26.3


