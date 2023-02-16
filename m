Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F9F69979B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:39:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfOH-0005F9-Iv; Thu, 16 Feb 2023 09:37:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSfOA-0005Au-WD
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:35 -0500
Received: from mail-dm6nam12on2060c.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::60c]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSfO9-0004sB-0j
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mK5gbt3HrAfMvNeMS94XwfcWngwt1GrwaK3eQgeDBeO7a3EIiBujXrbmRq0TAJhpbrL0eI9/fJ6Nfb3Bjuz++Ki1hk2VBvOHrEgOQ/di8/Kj9Kj47pbmUXuICujA6sGR5rocvoXWAsREn3wWdbc2LCqvLDqABY6Nsm5MIRXY2Ei+QxwAQorkFdXkcUHv54Uiu6hBcvhIbOZh+1r3QRQpuzd3f/FuZERIG8OSou7opwZI46e5hZJNdrL7b7zRtlpl1Xl9vy5APJKhK6ItfGrjiarilHlW6tVzzpIUxQb9rcejSBR23uZGOjBoe8r+GNICqKMbyfNYX3+VfdQ+ChikFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zuuJZ1anlXtQ6NTo30Bpwht1R8iR/e9ENNyLKhKGt4=;
 b=mYGHbOAmgEZaymnR4UgSi9yo+idThWRTMaSNdXgS+MMNK/DSSVVW5tNkY49BommB+WCT3m9ACR3vMIWlYmNZntwQoJ7vJSUu1aT89jfjR7xY29UNVf5+Rr+ZmKAitvi5OmhPCbbioqbKbYp6o1FNs69PkrzTzMmAEko5f8WMl+zFvfzkNepevKnX8Tqq9wq8P5gi7BOP3c31G0BiclCHo9iXeaS+KRMs6nUQlBCRnSNllVYSG7tMSoMFw3pH14bb5RgSlsKhLVZ4Bvu86Uif/F+PafGICJ5zB5KOp3KUOJaRMaKhqJmVEdT7LQLQ3CF9uBla7ivB743nWAy+s4jn3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zuuJZ1anlXtQ6NTo30Bpwht1R8iR/e9ENNyLKhKGt4=;
 b=jqrys4bJ2rJfnQCoaJNOKFHQj2Xr7PWCvsnJ/TWJ0ZG2a3XIl7pTq/2nAjml98kuislPHHQaQgJ72wc1aOvpXnuLQDqaUDvtReO7984VYz83wEIL3xo8hCLTxAMQFLrrk/LSsNeKmxmmnhlNtLBiQYsdlSY30tTlKgLenpcrwW0rq2VGCsvq8d/SeB13pshlYVtF6fwAi48TeqLJRoOGfAsIz0Nb/2xDSVVaCBw40vXtRhp4PSuvDpdwUxksD1vLIGq0+UfSsZJO1dYz8IkiyOCVFA5N0PfKFxJemCud14PA8O6ZbFnlC4UUcfWQHBlGfrHrJ1EOGsledW5iTzJWhw==
Received: from DM6PR07CA0058.namprd07.prod.outlook.com (2603:10b6:5:74::35) by
 DM4PR12MB6325.namprd12.prod.outlook.com (2603:10b6:8:a4::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.13; Thu, 16 Feb 2023 14:37:30 +0000
Received: from DM6NAM11FT105.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::49) by DM6PR07CA0058.outlook.office365.com
 (2603:10b6:5:74::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26 via Frontend
 Transport; Thu, 16 Feb 2023 14:37:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT105.mail.protection.outlook.com (10.13.173.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.13 via Frontend Transport; Thu, 16 Feb 2023 14:37:30 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 16 Feb
 2023 06:38:17 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 16 Feb
 2023 06:37:23 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Thu, 16 Feb
 2023 06:37:19 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v11 10/11] vfio: Alphabetize migration section of VFIO
 trace-events file
Date: Thu, 16 Feb 2023 16:36:29 +0200
Message-ID: <20230216143630.25610-11-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230216143630.25610-1-avihaih@nvidia.com>
References: <20230216143630.25610-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT105:EE_|DM4PR12MB6325:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a7c3edd-ddf4-4fe4-6dbb-08db102b552f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZdNYb0T084KCDasVkwhYmxVRecW3b2h/XXBnCIlmdosR0n1OUGYxS+jtIvDYlMuvk89AGV3/UaEsh4FUzdXmHCFSKGMOgZzgyLMnFVAKI6LnpHk4QmkL2R1tj3KKc9T6sm4i64AaS3nHx0M0xCTWIJpCtzQMkw6nJRtBrixYOti5QJb7tUxZChYZP2Dq48bD8rcKKDdObJPloU5nv74u+0IAtKqoe060A2mtkSma5pjVZjr9KfnuqLNPXTvSiwkaJDZOW0cxM3buDRbC9YHLU1+glHDthAD7gn/bMbDdRIe0zyUHUeiShCaSlYHfrrloTairWg8VzHMCPwBTHLvDgzyaOKce7C3PhGK+7jVRoUwcC0cBUF79TdCctSj4hbbGRrA9HLKHnYuoiHX6BAPipKvsCxCh4tqYsYpdYfLkLCh9wrC4CUmjsfUyd3+QW82uKCpxjl70TQYD4mSTB9quNa8VAGZ9kJvd2kSWwRg+dxmOdbjw9636OPsD/gZHN+QNLLd5Z7pk+Psg2t+zv9l8b3p8teBHQeUUO3K9E2FBYDW6UGBsIRVh/r0Kf3iU7o0/BUVvDi9FTHKIOn/xHFuSeSHT/bGL+JVQWFW33gLtYY2Wd0JqTtcmZ16LkHqFtIRsaCNT+BdfhpeLyPc5jddbrcyY/SRiRf2tWtaaTU4CURNNdHlngrNXu3vYUduh7s5s2q8PzjO0RGvEd6yzk95hiA==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199018)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(86362001)(6916009)(36756003)(356005)(8676002)(70586007)(70206006)(8936002)(41300700001)(82310400005)(7696005)(316002)(4326008)(54906003)(7416002)(5660300002)(2906002)(36860700001)(1076003)(82740400003)(7636003)(83380400001)(66574015)(186003)(26005)(478600001)(6666004)(336012)(2616005)(47076005)(426003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 14:37:30.0460 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a7c3edd-ddf4-4fe4-6dbb-08db102b552f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT105.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6325
Received-SPF: softfail client-ip=2a01:111:f400:fe59::60c;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 hw/vfio/trace-events | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 9d65c2da2e..669d9fe07c 100644
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
@@ -148,19 +150,17 @@ vfio_display_edid_update(uint32_t prefx, uint32_t prefy) "%ux%u"
 vfio_display_edid_write_error(void) ""
 
 # migration.c
+vfio_load_cleanup(const char *name) " (%s)"
+vfio_load_device_config_state(const char *name) " (%s)"
+vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
+vfio_load_state_device_data(const char *name, uint64_t data_size, int ret) " (%s) size 0x%"PRIx64" ret %d"
 vfio_migration_probe(const char *name) " (%s)"
 vfio_migration_set_state(const char *name, const char *state) " (%s) state %s"
-vfio_vmstate_change(const char *name, int running, const char *reason, const char *dev_state) " (%s) running %d reason %s device state %s"
 vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
-vfio_save_setup(const char *name, uint64_t data_buffer_size) " (%s) data buffer size 0x%"PRIx64
+vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
 vfio_save_cleanup(const char *name) " (%s)"
+vfio_save_complete_precopy(const char *name, int ret) " (%s) ret %d"
 vfio_save_device_config_state(const char *name) " (%s)"
+vfio_save_setup(const char *name, uint64_t data_buffer_size) " (%s) data buffer size 0x%"PRIx64
 vfio_state_pending_exact(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t stopcopy_size) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" stopcopy size 0x%"PRIx64
-vfio_save_complete_precopy(const char *name, int ret) " (%s) ret %d"
-vfio_load_device_config_state(const char *name) " (%s)"
-vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
-vfio_load_state_device_data(const char *name, uint64_t data_size, int ret) " (%s) size 0x%"PRIx64" ret %d"
-vfio_load_cleanup(const char *name) " (%s)"
-vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
-vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
-vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
+vfio_vmstate_change(const char *name, int running, const char *reason, const char *dev_state) " (%s) running %d reason %s device state %s"
-- 
2.26.3


