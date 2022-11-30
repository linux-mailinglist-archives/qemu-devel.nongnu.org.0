Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755C263D287
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 10:54:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0JfK-0004D3-Ki; Wed, 30 Nov 2022 04:46:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1p0JfI-00049X-85; Wed, 30 Nov 2022 04:46:04 -0500
Received: from mail-bn8nam11on2040.outbound.protection.outlook.com
 ([40.107.236.40] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1p0JfG-0003I4-7I; Wed, 30 Nov 2022 04:46:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tf7t0H5kO9WbdrOzh9dpOmQZhnFqc9UdHkePk10A1TAN5djyNHhf43TD6ZfntzUKuKC2DaEOTtfCjsokpJD4pPsnLYtOr/HR1jkFW3I4EosDoQrxcKqLCb9e6znCsRjNN9LZp6Qn1F9qYLb/eSjiPy8N1oszSqSJE8qkDijAOgUtFK9phn1Zc+cmhBbpB4ODV/59AayVKVf+Q0lbXFkW15Gid0iJ6FPbs0ZEJMCuIE/KZV6VzSDwbFukudDeRhtGJ6i76F0R3Y+ssgBIuPkO3Nf8V9hPwEF99NN21YGNWHT1mm1oz0IdanbtCAY7mv2M6bT1QeIUhasMGegyrrGAZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSWRVRxTdDw2Vys6qAICitr/noXx+ipo4LS0aKlkBrI=;
 b=AkEE9yWvVCob485/lXEjvOxuaXx2Z3MQPX/h1PqbS7pwoC9dwr9eWol42XRpsV3/3vjPdR6hD0npuW9sSFp5Q+gPHXZKVVuIy7s6AaQhu0mCLLLu1oEbfBV+MHF/9yVQd6ygwdTaprHAqhSXyz74u8z6UoXtN26FsKxQqRfpT1WBfqDcr1xUtFGNXsWTSHn+0QOkJlu47p8r3pcZs0wcnW2fiASnAQZ9oEF25nu8DPvjA5b06pXTCiFdne/DWXOBliL7GzPwoOCH5CJbyBZom5FP05+jyQKB5cvdMdkb+vhoUG5yi9jhcWYDhwYaWK+ZVzNmji2NP/5DazufVMu3TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSWRVRxTdDw2Vys6qAICitr/noXx+ipo4LS0aKlkBrI=;
 b=DNaaqYnZw6AATKwcVk13FoTPgOvGXQVaqPlezh7DIqIIpSEm7QckSLM7Um2PiyPiDpJHb7uisJ82sQ51UzTB9cEckFhO6GUlLkGwgSCJ8GOlkqRh75RlZh1lqlLMB1ox2XjJGrN628k3lO5FuM7nUhwl0ilTw2SUJ6H+Z85ysU4BUAWIL0HYfAX46deGvNLaiaPbkvonx33HODG8IiW0hygfuwGxjvNPr9IPrVg8C6dkmTa/5K3XLZ9ACqEvgXR3Hl6M6q56MIZecKyTu9mq9Su69CEMqoOOyZYY8YdVs10BWgAesUKMcoYjM+OPiqrVtQ7UnxYxu22pxCmOfspArg==
Received: from MW4PR03CA0079.namprd03.prod.outlook.com (2603:10b6:303:b6::24)
 by CH2PR12MB4086.namprd12.prod.outlook.com (2603:10b6:610:7c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 09:45:56 +0000
Received: from CO1NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::fc) by MW4PR03CA0079.outlook.office365.com
 (2603:10b6:303:b6::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Wed, 30 Nov 2022 09:45:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT079.mail.protection.outlook.com (10.13.175.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Wed, 30 Nov 2022 09:45:55 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 01:45:44 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 01:45:43 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 30 Nov
 2022 01:45:36 -0800
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
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v4 11/14] vfio: Alphabetize migration section of VFIO
 trace-events file
Date: Wed, 30 Nov 2022 11:44:11 +0200
Message-ID: <20221130094414.27247-12-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221130094414.27247-1-avihaih@nvidia.com>
References: <20221130094414.27247-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT079:EE_|CH2PR12MB4086:EE_
X-MS-Office365-Filtering-Correlation-Id: 34797c6a-922d-4d4c-bfff-08dad2b7ad7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JtLdfIfzWGFGGtGT/HJmf9lgsJMhwGBNVMHIuQ/Aa0JbEePfwX/Kqjjg/jYOaAeID1rZZqTwPZvr5aSNiYwDHBReuiyqAOMHurNw8B6bMgF2HCI/llP1Wr87PpPBcELOBswHe9+K24WBWxW1GFVM+jgueKBU5QssZlQTRbU1BiCNfTmfEiEOvZdWyB6JA1xMyc6aqQ+xE9oIO+I+jcaxMvOTmpqFMr9ZKnMOVRlmaRa3I3HqLEBm3WdXBh5SZmkPdbja6S4ixfy1tC58jE/t0dOfB1/sf3m81ao3kQs55XkfK+/6aOTP4PewP7ihj4k7ySVlxGncObPq0Y//9e+7jeqHSb/HH0qP/+wPEO9GB1hKkLd8BcvZj917yJWiDyE/WygIadsJ5OWrtOrFnPSAKHMMgY0diRwEiO6x7vxYrOnizE4OXnA9SSbttpTRNUuu8I6OJB5+kin5aM8feFDRkDayeM/u6Fjt02//ZCNk+NAeEKb1hRgU0oOD/ZAWfNpb+NsgY/H1Jc945IHReJvhB9JQpi5FR+8K2MOlnNPLqyuZ2jrB/EG/mmDajFEE3n5AgatoWELQNromGEzhY4zCXGbqaGH23L95AnsFsC825OtA5C2QA/RMgyAOvyym3bHU7Lja2qi8lX0GIjD3k3uFsiNPnXUD71reDIDVTaTtmwucOuPCHKaXkwpaOmtDzTTsakti7fGnwYX7roWQh9e5sg==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(41300700001)(36756003)(82310400005)(1076003)(26005)(4326008)(70206006)(8676002)(7696005)(6666004)(40460700003)(478600001)(336012)(2616005)(356005)(7636003)(40480700001)(86362001)(83380400001)(2906002)(426003)(186003)(8936002)(70586007)(47076005)(316002)(6916009)(54906003)(7416002)(5660300002)(82740400003)(36860700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 09:45:55.6825 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34797c6a-922d-4d4c-bfff-08dad2b7ad7b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4086
Received-SPF: softfail client-ip=40.107.236.40;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
 hw/vfio/trace-events | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index f727e0e00c..6c1db71a1e 100644
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
-vfio_save_setup(const char *name) " (%s)"
+vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
 vfio_save_cleanup(const char *name) " (%s)"
+vfio_save_complete_precopy(const char *name, int ret) " (%s) ret %d"
 vfio_save_device_config_state(const char *name) " (%s)"
 vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible, uint64_t stopcopy) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64" stopcopy size 0x%"PRIx64
-vfio_save_complete_precopy(const char *name, int ret) " (%s) ret %d"
-vfio_load_device_config_state(const char *name) " (%s)"
-vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
-vfio_load_state_device_data(const char *name, uint64_t data_size, int ret) " (%s) size 0x%"PRIx64" ret %d"
-vfio_load_cleanup(const char *name) " (%s)"
-vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
-vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
-vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
+vfio_save_setup(const char *name) " (%s)"
+vfio_vmstate_change(const char *name, int running, const char *reason, const char *dev_state) " (%s) running %d reason %s device state %s"
-- 
2.26.3


