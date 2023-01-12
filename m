Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CF0666D52
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 10:03:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFtKQ-0006dr-HS; Thu, 12 Jan 2023 03:52:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pFtJh-00069T-ME; Thu, 12 Jan 2023 03:52:24 -0500
Received: from mail-mw2nam12on2084.outbound.protection.outlook.com
 ([40.107.244.84] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pFtJe-0007in-5p; Thu, 12 Jan 2023 03:52:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0gyDerC56NQEqxUmjm26QBGble2VwD2GIeDoKhPixAT/KSPuTcl39rF7rkJjmZIn1lVYV8u7le74tq7pgqP697BYaFmZgcWSXS6nOI1BKvJitNYPev6lJ/q36NOvGJutsAHSfaiPhSGBfZuR/PmuOjEAg+XnSr2QS6V7XUDb0LZUS3M4mj38mTVQb5adT+gLAgVZgXnEeh25uBPgSj2B98R7SulF33yw3zpXpLUcdudvJ/DdS20TISefcbXTHiyxfq6FkeL32d2Xpe47QzVWFf3Wwd82oYR0SwHiJ9rPbhUNW7xEKTPxBV+JOvs0z05NDH2cIPajQmC5IX8kS7isA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9pyseSCeg3hoEOq/g2C1c18gpMiWspe6EUPmeNY8/U=;
 b=QleXmr9dNtgvorzZoE07e3feiqc33YX7vQkHE3d3Wa6uGfKtNsmgG9gQwz43PG2QJoFkqLcOO3dKaSi67ifa0vfv38SxM/uw+UpasmywHCab7CZdzv85xJ2h4E/c5iazcur7ODvMtZsaxVmWm7fe8oHjGZAKOwkIDRnqPfOZXFckBATG+srJbcEC2usUJnbKryjEgaQsQnFfGwFHaEHwTaMCL5bZeZVseA2H4QwOZB0h3dBVnlJGmgp6nboUOEDzJzEq2kohLpGIbQf9MFsjy+w6eEpXP87G2HjTXSMBKBTz1FGA7+WzXe5HJ5xpE8G8Fcg5V/Ke6+fdQlfQUdtuAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9pyseSCeg3hoEOq/g2C1c18gpMiWspe6EUPmeNY8/U=;
 b=h4AOPCSq84xRMu/e2BJyZwaj3IbwBuKBfq+/fbZYqWpNn9l9Q8+R5ryTZHh3jUpgoYENgDV8SewfaXDN8MlboOzm5I+jm3qn29j4wn8e/D30/c0AbrZI/gqw4xf1PT/xhNZvlbbT+D4q7+0ST6Xcu9YekA1zlWHiOPkDqeoqSz58Vt2mbFbcEtOX6Cguxav/VrUuMWEftZkaMNPDOJl6K3WxjADfdNCWxVAOccjA1LLNp7g9dHFIYlN2a5ORFTVBlN7Yn8foS5Pm4pXV78p123tMQiqTi9KB6U1bsD/zP96/p/F7FpOZlxCrNd5waJqfn8QuROP+n8F/2/cBADFJpw==
Received: from DM6PR14CA0054.namprd14.prod.outlook.com (2603:10b6:5:18f::31)
 by IA1PR12MB8287.namprd12.prod.outlook.com (2603:10b6:208:3f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 08:51:59 +0000
Received: from DS1PEPF0000E632.namprd02.prod.outlook.com
 (2603:10b6:5:18f:cafe::2e) by DM6PR14CA0054.outlook.office365.com
 (2603:10b6:5:18f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 08:51:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF0000E632.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 12 Jan 2023 08:51:58 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 12 Jan
 2023 00:51:50 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 12 Jan 2023 00:51:49 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 12 Jan 2023 00:51:43 -0800
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
Subject: [PATCH v6 12/13] vfio: Alphabetize migration section of VFIO
 trace-events file
Date: Thu, 12 Jan 2023 10:50:19 +0200
Message-ID: <20230112085020.15866-13-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230112085020.15866-1-avihaih@nvidia.com>
References: <20230112085020.15866-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E632:EE_|IA1PR12MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: 746f9ce8-1099-465a-ea1d-08daf47a43f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oorq/YvAwh50dZr130CWtGvpQ61BMHSTBGiQLhDVT5XVrsCRoIkquVED0JAD7gdwXkj8DmsrWdDoa/g1ez+uAmgT7t0hMLwhrCLikaksAJcIjVeXIiYJ/HiXAqnjdBBcQ0gKcc6pgy3LkR0qwu6xbycNMtm6htx3OfupbH+0S0KuvKwAut1VC7AwT57LIgSURis9eGCPkX0eRihmaRqR7lVVM5nrHTy6E86DyKHkCMQ+HM1Qu6xcFHExLZVM+6vuXD7RjR5xZN4QcDNqsCp3ObWySY8cn+L7pS6pIgGqf9NShlBBE97d/pQStSrcW8LxvyFAcoRSgWaTPvBmdP4ZFyGiiY7UhYAajQzA/ZmNgfkYJv9oAlbjhR6cyWpxgNsg1xX+i2O23UKofq2AMQUl+oX6QT9xuHWKp9kcMTX7dxWLHi4fITlBVwI1UnujamuwCppnJEUJUmpYPU9PG0MVoZZz4qLkaI/QdCKJRhsEM6+ZWv477jZN8luiMqSEbWCh3TRCO7CL2cc4ssINZamXw3ccAWFrnIlno7xpKZkW0kCLWZS+7Dk6AefYDSbpmu7kVvDqHYZgLO21OurJ0gpX8/6+UvUc76KbfViV4DehfVmcVMSdcgx/Pq4eK3kFXpsuK+ZEmrUbhj0/4XfMSNVuWGcMyauOgdusLORcvrheNd4xM0aaHdTprPbzR+JoQO20/9ytb2EcPyzB+Z4PL3E7vA==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199015)(36840700001)(40470700004)(46966006)(47076005)(6666004)(40480700001)(2616005)(336012)(186003)(26005)(4326008)(316002)(1076003)(70206006)(7696005)(6916009)(54906003)(478600001)(70586007)(36860700001)(356005)(7636003)(82740400003)(86362001)(426003)(83380400001)(40460700003)(7416002)(82310400005)(41300700001)(8676002)(36756003)(5660300002)(2906002)(8936002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 08:51:58.7989 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 746f9ce8-1099-465a-ea1d-08daf47a43f0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E632.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8287
Received-SPF: softfail client-ip=40.107.244.84;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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

Sort the migration section of VFIO trace events file alphabetically
and move two misplaced traces to common.c section.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
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


