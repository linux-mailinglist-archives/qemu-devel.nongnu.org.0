Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4C368BCEC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:34:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0gx-0007fT-HO; Mon, 06 Feb 2023 07:33:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pP0gt-0007Ng-4I; Mon, 06 Feb 2023 07:33:47 -0500
Received: from mail-bn8nam11on20601.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::601]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pP0gq-0000i7-J8; Mon, 06 Feb 2023 07:33:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Icwv8vUDABLrbp20Do4Bvk0KMZDKtvhyObCzOh/WuKVuJ0hIdcJYvSk7sApUpoy2wYEWkLWICHt0IHSy8RSxvf4BHMR10mvSk+DmFuwDSceH0I/ZiuYdy7E+sblFQGvsG3bo9S9WuV3P/AfVWxNysP0ug/bmWkpQCBfIbG+tWAtsZ2Ua6omyO944FVuDzbYkPrBSuGOSSWubBv29NEHbZMzq+dfv6MUtnBWLhIfVTo3mLpUB53RTixKuSZT+oaqWo0Zqc5kokB3J3zQKmZcE13/1z8gc0A9b83AyM3yzW+5R+OlnuzLrT+xynz0I9RuLGTa750FScUIP+gkfqfFXJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoZvb7rRshP7ucACAYJmkhDQ9lNUR241m9YrMSic3ls=;
 b=geYTCoL3BdB1dk5NmbfzDgjZOEZCRN6VGxT4Sc0U+6L647ey9on9DJmaJ/EnOq2AkXQeVnXRE0fg5iUzgJ00Unf1D8p/3Lb/w6h+hW0I1N0BhUQTA5yn/lppggabDNDmNMKTPMTgBg4121AMdM4Oxenc6ptztzqe9vCaZi4frdaPCyCtjlSeCurBjVK9gjudLCe9YuoUqu0Lsf/upp2X6Muh4rMImnJ4gvK6IKWysDTQ98GqAZ5iFdRZJNUj+T2C4tZS4IJSeRYcaimabPcxnjD1/xuRfmO1stsv9PYFyD/TUPyFwkvyVGmFF+m0yOaLBCUO+93D6LRH4zSOs4NZ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoZvb7rRshP7ucACAYJmkhDQ9lNUR241m9YrMSic3ls=;
 b=i8rQXELM4SfizeQ2RIXlMF+WdnHVZ9Em6btmBn8DX+nDp0YE+C8Asin6ltSihpxjs1fm2MfFS7oomOJJa7wLqKXHcwRmEYoqYf77dgsHAbbNIFIK4wXeYroOnFPCk4qop9EqD/iSDWWbF6jZxFgU3OyFbrlhWV+a4xoA8F0V/N7EEwqWO/ckaay2mQQg5g2R63nAW8kFNx++WiPpRABo+qiPSYnyjhCJSNH/6AFnc5Zl9jI4Xc7vyjtWRirZGZ8e5cSnBSGjDhzTyM3nCN6MA34sYxWbZv0EvabKI51Ws2cDXluISjUQ+JlHxI7wwWFNCtoIsNjCYjUdBJVUlIhdjg==
Received: from BN9PR03CA0595.namprd03.prod.outlook.com (2603:10b6:408:10d::30)
 by SN7PR12MB8026.namprd12.prod.outlook.com (2603:10b6:806:34b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 12:33:41 +0000
Received: from BN8NAM11FT075.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::b2) by BN9PR03CA0595.outlook.office365.com
 (2603:10b6:408:10d::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35 via Frontend
 Transport; Mon, 6 Feb 2023 12:33:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT075.mail.protection.outlook.com (10.13.176.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.32 via Frontend Transport; Mon, 6 Feb 2023 12:33:40 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 04:33:27 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 04:33:27 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Mon, 6 Feb
 2023 04:33:20 -0800
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
Subject: [PATCH v9 13/14] vfio: Alphabetize migration section of VFIO
 trace-events file
Date: Mon, 6 Feb 2023 14:31:36 +0200
Message-ID: <20230206123137.31149-14-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230206123137.31149-1-avihaih@nvidia.com>
References: <20230206123137.31149-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT075:EE_|SN7PR12MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e20d94-8cf3-4780-aa1d-08db083e60f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oNdm1qIIf26JM4qdnS7qHSYwiZtwq30wuSOtZO6u1BgoOo1cAN+5Qy99uby1DZvii/9zX9pWkoehv/OQbjboqMzmIF5N1EgFGGXJ0Q6IhRfit5MeIVAQ9zYFJjqCcK0s75yA++QFan9EpJwRUu/5UJeibFh6cb/DvF8HgG8WHUhfANtZnZHpRI6Ci3o9ur//h7O2xkhHW+wLzdMttAH4114YeDmvAxYn1LSpG6ESXE5omHLoaBKQxuSuWxHxuy+QeXg898RI7wh2hkiRpscIiJ0vMLqjR76UvRJU10t7mf9/Yw2X6kN8MESKm+dzIhWposlMF3JqXCBaWcW5o/ecZQlGvMgL5RdgHiquI+Vv3wxGLGk1a1fL4RnyIV1dGXM6s2tY/gkdZgImAjkMDHEhzRt5MSO7OhfgbA2tNOm7JqXnsxyTW4vQHodQEoth8zhV6Ra3e/1y5VkClE8ksn9N71uN4QbfM4zOV/644u+Swg0sgcshEj/vYFrY2Az8Jxfc30I6mXIwlTXaqT/XzemH+6XFJ0cxI8seJo5KeYpccN7R0PfTl1lNKrrE5FxlfWwIwd0ztIX/BDkgK7CkJvJGELWBKwb72bn9Gp7rp6RDWk2ubgfnb+ngsgu3fNRsXXrsDZ6oj6nqcX1/rmJc8JHoqCITAu1sImFDEavEgPBEcaHLtYk4YlE18eZOSeUpiAZjv0CU0WcM6u5UnX4tWPyT6A==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199018)(46966006)(40470700004)(36840700001)(6666004)(1076003)(70586007)(8676002)(6916009)(4326008)(70206006)(8936002)(478600001)(83380400001)(40480700001)(2616005)(186003)(36756003)(7696005)(26005)(336012)(66574015)(40460700003)(47076005)(316002)(41300700001)(426003)(54906003)(82310400005)(86362001)(82740400003)(2906002)(356005)(7636003)(5660300002)(7416002)(36860700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 12:33:40.8602 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e20d94-8cf3-4780-aa1d-08db083e60f3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT075.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8026
Received-SPF: softfail client-ip=2a01:111:f400:7eae::601;
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

Sort the migration section of VFIO trace events file alphabetically
and move two misplaced traces to common.c section.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/vfio/trace-events | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 60c49b2ecf..db9cb94952 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -119,6 +119,8 @@ vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) "Devic
 vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long end) "sparse entry %d [0x%lx - 0x%lx]"
 vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
 vfio_dma_unmap_overflow_workaround(void) ""
+vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
+vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
 
 # platform.c
 vfio_platform_base_device_init(char *name, int groupid) "%s belongs to group #%d"
@@ -148,20 +150,18 @@ vfio_display_edid_update(uint32_t prefx, uint32_t prefy) "%ux%u"
 vfio_display_edid_write_error(void) ""
 
 # migration.c
+vfio_load_cleanup(const char *name) " (%s)"
+vfio_load_device_config_state(const char *name) " (%s)"
+vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
+vfio_load_state_device_data(const char *name, uint64_t data_size, int ret) " (%s) size 0x%"PRIx64" ret %d"
+vfio_migration_data_notifier(const char *name, uint64_t stopcopy_size) " (%s) stopcopy size 0x%"PRIx64
 vfio_migration_probe(const char *name) " (%s)"
 vfio_migration_set_state(const char *name, const char *state) " (%s) state %s"
-vfio_vmstate_change(const char *name, int running, const char *reason, const char *dev_state) " (%s) running %d reason %s device state %s"
 vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
-vfio_save_setup(const char *name, uint64_t data_buffer_size) " (%s) data buffer size 0x%"PRIx64
+vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
 vfio_save_cleanup(const char *name) " (%s)"
+vfio_save_complete_precopy(const char *name, int ret) " (%s) ret %d"
 vfio_save_device_config_state(const char *name) " (%s)"
 vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible, uint64_t stopcopy_size) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64" stopcopy size 0x%"PRIx64
-vfio_save_complete_precopy(const char *name, int ret) " (%s) ret %d"
-vfio_load_device_config_state(const char *name) " (%s)"
-vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
-vfio_load_state_device_data(const char *name, uint64_t data_size, int ret) " (%s) size 0x%"PRIx64" ret %d"
-vfio_load_cleanup(const char *name) " (%s)"
-vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
-vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
-vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
-vfio_migration_data_notifier(const char *name, uint64_t stopcopy_size) " (%s) stopcopy size 0x%"PRIx64
+vfio_save_setup(const char *name, uint64_t data_buffer_size) " (%s) data buffer size 0x%"PRIx64
+vfio_vmstate_change(const char *name, int running, const char *reason, const char *dev_state) " (%s) running %d reason %s device state %s"
-- 
2.26.3


