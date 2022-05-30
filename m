Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F06A5386E1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:47:07 +0200 (CEST)
Received: from localhost ([::1]:59992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjTu-00038x-9D
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nvis1-0003G3-Di
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:07:57 -0400
Received: from mail-bn8nam08on20620.outbound.protection.outlook.com
 ([2a01:111:f400:7e8d::620]:49761
 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nviry-0008LQ-KA
 for qemu-devel@nongnu.org; Mon, 30 May 2022 13:07:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ynt4aRVr/xS5Uv+RCqcZ3C37AEs2ZJG9kGoKuYHEJFi46SFaQfZjYojjsDp1bZrtb49ARIDMD9cxnxkCl3GS+2yi/9UBCHmF1KLTGzHB2PuVG9pQ50ybkp9l9GX8oqJ1bhSpil7NRfbSUEoJn+we4ObEJ6A++sqpcDLpMIvXT4q3b1P6aTb7M/MXE9NIkA8pdU5EVDt3AXrhrcd1cFr0rU+YHXgsx61FAsXAo2NY9YhA3hlSKekT4F38KjJ0KvrIFFep6IIxJU+/TV+8i/1VqjAZmOiprZobTKmyB5bBjWQ3lroWrJi3KQXLWb3v3qPZbzBFtrcHoONdNbjfUzANQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWmmJp9DZzsJirVqwnDaGWW1CwYh74LsXTFYv6GpP9U=;
 b=OQ7jeucBrTH0VWn/9InGZLQNHJ4SKGMDleH0Q8s54Zmzhy7iW55lbvLHAawKTfjl7SbIDQHm8v0IPBqWepnuleoPF4IKnc1uiPytt4YlGM4mMsxd2RcOxT1KW7N2KoeOa+D3HrzKr/ZM7y2qEDvnLSH/ExmUWuI8UTlPocKdilC4RjpzUhabpLYZCuK9QXIbimJbBJoNIo48COoyu2zTX+vCkHmtK3417Jb72uH8N9QDZOjkYTKggpWrazdSPsn3HvdAGIsJW2Nl4s8QMhj3pOnw81U9jQ+cDmCoIfVFX2pBBp5JHWPByQKvvA37Cq/n40sEaaOSW0kYwRUAPg4A0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWmmJp9DZzsJirVqwnDaGWW1CwYh74LsXTFYv6GpP9U=;
 b=LR1EPCoQP8sSWAVDwbF0BlzWZCet3R3+G5SVPaviLq8B9iBCmlZk57RA7Xn7vqUi6hnBHNOwO5ZGehuKj6D9eWEQni530O6gpblwfejT3TnLtKidmxHOeNvuigvJ9E6NK+muFpbJw2resrEbDwUWKSOn9hvPMCqMKKV/o34QS7ozJDomlLB7ETf2LvGZd6JRYEeH7O3tuimFdOqSJCOtNN/4vqDD3SJj5jzTABh3THGYw3kEZnndN7vq6n9fnmlhJlDNAC8oivZkxd1sJD/NMmB1Nlx4m5y2dzjHrPwY3LFEO3iDZitGZRlCh6RCo8KJnwX3ST4QuZvPP85NGBEGiw==
Received: from MWHPR02CA0015.namprd02.prod.outlook.com (2603:10b6:300:4b::25)
 by DM5PR12MB1337.namprd12.prod.outlook.com (2603:10b6:3:6e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.17; Mon, 30 May
 2022 17:07:51 +0000
Received: from CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:4b:cafe::e2) by MWHPR02CA0015.outlook.office365.com
 (2603:10b6:300:4b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Mon, 30 May 2022 17:07:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT039.mail.protection.outlook.com (10.13.174.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5293.13 via Frontend Transport; Mon, 30 May 2022 17:07:51 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL109.nvidia.com (10.27.9.19) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Mon, 30 May 2022 17:07:50 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 30 May 2022 10:07:50 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Mon, 30 May 2022 10:07:47 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Joao Martins <joao.m.martins@oracle.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Mark Bloch
 <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>
Subject: [PATCH v2 02/11] vfio/migration: Skip pre-copy if dirty page tracking
 is not supported
Date: Mon, 30 May 2022 20:07:30 +0300
Message-ID: <20220530170739.19072-3-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220530170739.19072-1-avihaih@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97bca9f4-2cbc-4084-1c00-08da425eee0c
X-MS-TrafficTypeDiagnostic: DM5PR12MB1337:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB13370E3FCC5F813C93230D7BDEDD9@DM5PR12MB1337.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LSZtB1UMo80T2t1wKR/9u4W+9wKtMZsRxl1k4hPp4l7WSAUG+Tf3c6OualPqzawS9zslUv9uhMxHE4Q9hGR/z3As8zkx/20t8001aUPuu/GECLPFqn9Keqx6u8d8nb7URLtjhyLuCKIVfLzdT1dldqQF5G2WDEBxVC/nXAYhHt42a1sBluQsf9rS6Vkz9qOBGt+GUt/xHbCwPPETk9FiWZNuJIFrUxk9X4irUUu56QHcBSktWcGr/dhBSBXMmWZZQEQa8Hz+Qh4CIE3ExrjQfXxEGkG/CaYIo0SHmcC8Sgtwm1Ahkv93X2a0fUR8CGDBmQtZIBdJKUl+amVJn0NjeYN/b/wMZkK1gppNV9RbviCg7/biF7HMmEd4su7bEpX6l3liqYD/wbR67M/X+PcbfeG33gQvImf7G20XcVeECKnbMNJ2PnSblW5wqkL3TU1TE7JkEGDikhsdLrZWKX7SgigHGAcEIlQaYZG3Bx/bArgK6iWAp53U28+fs63q8AI3pGHju2/q3Sjy0/Rij07owX20wm2yJrFQJ1Sb41KodQwP0VVU4iDgHvUBbfpzD672mEG5sfNGNgDxJgSkjt+AWm5XRedBBlhBR+14+4iuPb4E9Y0McP4iWHOOoAoPRYXFp9TJq5ZyrtDq7UuUVjX/SoTLzkm0FgZvqKZx96qQhqAknE+OaO8sGqn3AQBiaOSvccIV/biZAHMVrWlwPwwob9CUkvBJnC2owUl5Db+5dU0=
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(316002)(356005)(47076005)(508600001)(36756003)(186003)(107886003)(81166007)(1076003)(2616005)(426003)(336012)(86362001)(110136005)(40460700003)(54906003)(36860700001)(8676002)(82310400005)(26005)(8936002)(83380400001)(5660300002)(4326008)(6666004)(7696005)(70586007)(2906002)(70206006)(14143004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 17:07:51.3382 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97bca9f4-2cbc-4084-1c00-08da425eee0c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1337
Received-SPF: softfail client-ip=2a01:111:f400:7e8d::620;
 envelope-from=avihaih@nvidia.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, if IOMMU of a VFIO container doesn't support dirty page
tracking, migration is blocked completely. This is because a DMA-able
VFIO device can dirty RAM pages without updating QEMU about it, thus
breaking the migration.

However, this doesn't mean that migration can't be done at all. If
migration pre-copy phase is skipped, the VFIO device doesn't have a
chance to dirty RAM pages that have been migrated already, thus
eliminating the problem previously mentioned.

Hence, in such case allow migration but skip pre-copy phase.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/migration.c   | 9 ++++++++-
 migration/migration.c | 5 +++++
 migration/migration.h | 3 +++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 34f9f894ed..d8f9b086c2 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -863,10 +863,17 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
     struct vfio_region_info *info = NULL;
     int ret = -ENOTSUP;
 
-    if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
+    if (!vbasedev->enable_migration) {
         goto add_blocker;
     }
 
+    if (!container->dirty_pages_supported) {
+        warn_report_once(
+            "%s: IOMMU of the device's VFIO container doesn't support dirty page tracking, migration pre-copy phase will be skipped",
+            vbasedev->name);
+        migrate_get_current()->skip_precopy = true;
+    }
+
     ret = vfio_get_dev_region_info(vbasedev,
                                    VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
                                    VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
diff --git a/migration/migration.c b/migration/migration.c
index 31739b2af9..217f0e3e94 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3636,6 +3636,11 @@ static MigIterateState migration_iteration_run(MigrationState *s)
     uint64_t pending_size, pend_pre, pend_compat, pend_post;
     bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
 
+    if (s->skip_precopy) {
+        migration_completion(s);
+        return MIG_ITERATE_BREAK;
+    }
+
     qemu_savevm_state_pending(s->to_dst_file, s->threshold_size, &pend_pre,
                               &pend_compat, &pend_post);
     pending_size = pend_pre + pend_compat + pend_post;
diff --git a/migration/migration.h b/migration/migration.h
index 485d58b95f..0920a0950e 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -332,6 +332,9 @@ struct MigrationState {
      * This save hostname when out-going migration starts
      */
     char *hostname;
+
+    /* Whether to skip pre-copy phase of migration or not */
+    bool skip_precopy;
 };
 
 void migrate_set_state(int *state, int old_state, int new_state);
-- 
2.21.3


