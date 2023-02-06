Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E1568BCDC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:33:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0ft-0002jf-5h; Mon, 06 Feb 2023 07:32:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pP0fl-0002Zr-7q; Mon, 06 Feb 2023 07:32:39 -0500
Received: from mail-bn8nam11on20600.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::600]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pP0fg-0000UU-0k; Mon, 06 Feb 2023 07:32:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVnzzTKpth6vN7qGlCrcmpVRBsbhKQO35wdxmcHA4CWnjEuT20hfwYlxAkZoqr9UZIbf3q1ZUUsokVRz65AtAUyxDgwnlG6Tdo11MC5C9FBQsNxFghNBoA5AWj2gPlozuRY/mFRhrd4mwpklUDzehoU5PiG7xsZ1RBuNMjVY0uaJE/vQrNdcaMF95kDOdIjwext1nVUfmrbZTUPpC0YawkQtgvez2Nu6e0c4SzRxCzWb7UNTs+h+w8doxPtQBKXa1wnGptKowodDGLVOxr4qJQKo1uCbRyHL56SQswb4ah+9dqygng2eoLqZuo8X0gnCCfJ9U4vU5tc0fiasFr2S/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRgwrf9CzYr8eRlNHTJ2KPCdqaMrV9JTJrXJQj7Roxk=;
 b=dfH1JOLp3Mzx/0fbcRgCcwoAZoTWW1DTWYREbk7S/Fa8kGcgf5qbIQzzkBcXCLMOMetQreb6dDUGQ7FHtOit6XRLRO8e6RyRwD/UjQrBKzyjH/3E93/B5sv8iGZN6PxwLfc4zZVC0XAJBcRkAutRNp9Y1wobqTG4hARcDVad4/cu0GHVCgzMqeKej0aYCh13kZl3IpWEI5vMn+AESsIExtEmNvqUziBrMOO5VnEJz1ipPIdyQoLJhyRmUDBmjDMTyu++qPx28vh/yMfE4828EtoAO0IVExfgj2wYvogvXP3wOxfn2UJd0nmU6LVN2Ae3+3DMq4eA2rxuC+2nTnUjlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRgwrf9CzYr8eRlNHTJ2KPCdqaMrV9JTJrXJQj7Roxk=;
 b=QsiRE5IS6f6u8LZDw/9a6C1hcpF1wt2UX/2cUc99vn05UAe+ztnPXOEvlP9qWBeOA7AOVg3XUD99lWO/SDnywCJlKms1q3ZJGYktaA7faXP/xX8Y382vIVQD7Rk3Wmas2Bj1gd/FHSNaio3olHXuK0kL9Qr9iWdBoJ+jI8ot6orp90MHCduyCIFNwiDvC51f8AOdRoBNDG3VC/gP46D+rluHB9vIctzvpgn3XOALgsjykjPizANn6XHX+FP24xH89ck1rSnwgEC6Rk6GVlf9h/gqKO7xMGynfeq2ZLlCR3a80ckF6E6Uk/59COrITDDpA/yweV36QebvaFv19Nfc0Q==
Received: from DM6PR02CA0039.namprd02.prod.outlook.com (2603:10b6:5:177::16)
 by SJ0PR12MB5487.namprd12.prod.outlook.com (2603:10b6:a03:301::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 12:32:27 +0000
Received: from DM6NAM11FT077.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::63) by DM6PR02CA0039.outlook.office365.com
 (2603:10b6:5:177::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35 via Frontend
 Transport; Mon, 6 Feb 2023 12:32:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT077.mail.protection.outlook.com (10.13.173.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.32 via Frontend Transport; Mon, 6 Feb 2023 12:32:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 04:32:16 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 04:32:16 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Mon, 6 Feb
 2023 04:32:09 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, "Ilya
 Leoshkevich" <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, "Juan
 Quintela" <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Avihai Horon <avihaih@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: [PATCH v9 04/14] vfio/migration: Allow migration without VFIO IOMMU
 dirty tracking support
Date: Mon, 6 Feb 2023 14:31:27 +0200
Message-ID: <20230206123137.31149-5-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230206123137.31149-1-avihaih@nvidia.com>
References: <20230206123137.31149-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT077:EE_|SJ0PR12MB5487:EE_
X-MS-Office365-Filtering-Correlation-Id: 664e69b4-5a9e-4238-33d7-08db083e34f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: owmf6PjjOdUlmNy4amhlzykP72HkzlgK4iY962qWBrMkZBliXVqvAP5J5GkXR1cWbmnfD54BRGoWigQl8iFDEQwCnbxTQQBrjpZq48SU6UHCtNDkF5jSarmkOo+2leyTQv2Vn1iXrmmYq8D5zSZoc/rX54jhQmmFh9cKH+jwVkQUDRXymZh+jlO0YCaoUkaqq4VTl3tKC1yOs36wajJ3/h21+cHfinUKMpXcxS0dmzAW3RcrB54aey2gFRYxtgGzCYm1Wqmutth/sV4+IgPy7MSxh0G3+Prf1EBReHBXmeZq0oFq9fylAgLZV2ZFwxbS0jRJ05I4KxoTwWA9ZAjtFZfQSsJ01StPvy4yiUTcVrb1PJ8TqCceQl+a+HjReT43PgxXKRvRiLo84pv6+nwg4vHT1miqcWiw2WPwDcDh+Ae9hldvU4wYgZGjBbmiQHUy7QpFU29QnVr/uuoYQhaVPZM5wDWyaTWzuCMAnigsh0qH1mcr04vhpjg6C5yaeFQGxpWUwAm9AIcXLqmfYoUIE/xglI3WSOSARiAtNkEJtZG72APn/yenQA9fU9AanNNYPIlgCh7SZQr6YyiR30EG3ZytFF2Xa8E1srqWHf14E2Do0t2oYw0rOdb8AoHFgYR742Ad83EcwbeRe9jRNqxl+CJQJImNBhVBN33gVHvgzLeyxscLFVRCUn2mFiugSoLBXizYBCjPcVdFn8CcM0LJ6Pq3HH4YQidijWrZhN/tjCfJThX7NdJMhG17+4tKrgflTW1E/RbJEbZYfXaDOAYM+MoVRcSd1cc1kHh6fFj0X/a2B/VbUGJXbqZCm3JCYur4
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(396003)(136003)(376002)(451199018)(40470700004)(46966006)(36840700001)(356005)(7636003)(40460700003)(86362001)(82740400003)(36756003)(8676002)(8936002)(41300700001)(4326008)(6916009)(70206006)(70586007)(54906003)(316002)(40480700001)(7416002)(83380400001)(5660300002)(82310400005)(426003)(66574015)(36860700001)(2906002)(47076005)(336012)(2616005)(478600001)(7696005)(1076003)(186003)(26005)(966005)(6666004)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 12:32:27.0933 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 664e69b4-5a9e-4238-33d7-08db083e34f2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT077.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5487
Received-SPF: softfail client-ip=2a01:111:f400:7eae::600;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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

Currently, if IOMMU of a VFIO container doesn't support dirty page
tracking, migration is blocked. This is because a DMA-able VFIO device
can dirty RAM pages without updating QEMU about it, thus breaking the
migration.

However, this doesn't mean that migration can't be done at all.
In such case, allow migration and let QEMU VFIO code mark all pages
dirty.

This guarantees that all pages that might have gotten dirty are reported
back, and thus guarantees a valid migration even without VFIO IOMMU
dirty tracking support.

The motivation for this patch is the introduction of iommufd [1].
iommufd can directly implement the /dev/vfio/vfio container IOCTLs by
mapping them into its internal ops, allowing the usage of these IOCTLs
over iommufd. However, VFIO IOMMU dirty tracking is not supported by
this VFIO compatibility API.

This patch will allow migration by hosts that use the VFIO compatibility
API and prevent migration regressions caused by the lack of VFIO IOMMU
dirty tracking support.

[1]
https://lore.kernel.org/kvm/0-v6-a196d26f289e+11787-iommufd_jgg@nvidia.com/

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/vfio/common.c    | 20 ++++++++++++++++++--
 hw/vfio/migration.c |  3 +--
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 130e5d1dc7..f6dd571549 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -488,6 +488,12 @@ static int vfio_dma_unmap(VFIOContainer *container,
         return -errno;
     }
 
+    if (iotlb && vfio_devices_all_running_and_saving(container)) {
+        cpu_physical_memory_set_dirty_range(iotlb->translated_addr, size,
+                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
+                                            DIRTY_CLIENTS_NOCODE);
+    }
+
     return 0;
 }
 
@@ -1201,6 +1207,10 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
         .argsz = sizeof(dirty),
     };
 
+    if (!container->dirty_pages_supported) {
+        return;
+    }
+
     if (start) {
         dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
     } else {
@@ -1236,6 +1246,13 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
     uint64_t pages;
     int ret;
 
+    if (!container->dirty_pages_supported) {
+        cpu_physical_memory_set_dirty_range(ram_addr, size,
+                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
+                                            DIRTY_CLIENTS_NOCODE);
+        return 0;
+    }
+
     dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
 
     dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
@@ -1409,8 +1426,7 @@ static void vfio_listener_log_sync(MemoryListener *listener,
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
 
-    if (vfio_listener_skipped_section(section) ||
-        !container->dirty_pages_supported) {
+    if (vfio_listener_skipped_section(section)) {
         return;
     }
 
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 09fe7c1de2..552c2313b2 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -860,11 +860,10 @@ int64_t vfio_mig_bytes_transferred(void)
 
 int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
 {
-    VFIOContainer *container = vbasedev->group->container;
     struct vfio_region_info *info = NULL;
     int ret = -ENOTSUP;
 
-    if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
+    if (!vbasedev->enable_migration) {
         goto add_blocker;
     }
 
-- 
2.26.3


