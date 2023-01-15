Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AE066B370
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 19:38:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH7rn-0007Fe-1D; Sun, 15 Jan 2023 13:36:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pH7rk-0007F0-Js; Sun, 15 Jan 2023 13:36:24 -0500
Received: from mail-mw2nam04on2086.outbound.protection.outlook.com
 ([40.107.101.86] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pH7ri-0007ak-Lh; Sun, 15 Jan 2023 13:36:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mn3Z8HwklTblT1qfd+vuR5gpODvGB4PtgB3Dn6GiPZsfeymW9VmWMkwB1DYYR149PrQT7zkZe4rxoDf/PrxKog0wZvN/4vjuuFCHV1vfYTHlcC33IKXGVFqRg3Pxw7l3qj/U3UsuIN1sPw3unTRJk1jRZW4MQ/am3Xc6jSu7HX1HqhhyGPITeO8MOOAlJB5ydnI81rPStFqInyU/Q5rciDWtXrY9nEHIkNFlxsU+kEdeMFxolC35IgkUSkKNPXYcAZs4yQehPbuKCiEkByW7FNz6we0BZhYuzpbEYpBTfqyg2l1+Q5tE0D6C0DDK41fw7Fdg8Y7puq9vOkpKdqdGvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCAXggWAAw5x+H9R1l/6Zz6M5lu7IldvVJZw9bWHbH0=;
 b=S3VV2m8iXVYgo/GO80cySOOV8OcimmU4LFxAsgXb0PHwaPmuI1X/366QetDatXa6jcVlqy83HYXwTA1c3ysNn18MBRs7cJNebZFlL7W+tO3GOJs3/dE1WHPVo8AzPRXQ/1hT8+bmaBs95qra2eoUxZEH8O45p/OgMiTZsg/i2EZX6VvIABbVfIf0hC7Tot67kypjZ4YvQYMQgzN9RCMd8StB3FRIce1q7kz0LJE6JrhVvqQFJdDQ9uCLdBCw9ynwIK1bVRxGTlBrSE5F4icfpmrBfXul6r4koFWkjWwrJHxrKMb15hPDX/l4IBj3gSfAy4xmgWs//Af5gWRXeviu0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCAXggWAAw5x+H9R1l/6Zz6M5lu7IldvVJZw9bWHbH0=;
 b=WxTPIn4Qod3tQhQdKHMkjXBCqqVSrWXV7Z6j+wWteyn7tLCu8nwIPuSIVTEeZ6W6eMnP/a5cXe3G1nODmWD5mX+1iMEr6Iebij63yO3Nnx+nceGECgHraslxPnQi3iVf6RPW2hpE0jgblJHUcgCBGZ/o9PR00oZ2rhcOpcpjCWhcS1j+fwxIOjhdgAY4CrpLiUm40UVB7ZLdpuRPR6HG9qfXP4AEjgH5hZXW+/WVTX5CEbMG6SANKNe4ZR2nCj9iG3O688K6OhVFM1pFd+ccbMtggAz3uQo1SVcQg69W6HfMbAYDLpdsxRuA9GIAxU7nKlV8RX3sW0fxaHb+M1TsTw==
Received: from DM6PR07CA0068.namprd07.prod.outlook.com (2603:10b6:5:74::45) by
 SN7PR12MB7419.namprd12.prod.outlook.com (2603:10b6:806:2a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Sun, 15 Jan
 2023 18:36:18 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::c6) by DM6PR07CA0068.outlook.office365.com
 (2603:10b6:5:74::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Sun, 15 Jan 2023 18:36:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Sun, 15 Jan 2023 18:36:18 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Sun, 15 Jan
 2023 10:36:17 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Sun, 15 Jan 2023 10:36:17 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Sun, 15 Jan 2023 10:36:10 -0800
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
Subject: [PATCH v7 02/13] migration: No save_live_pending() method uses the
 QEMUFile parameter
Date: Sun, 15 Jan 2023 20:35:45 +0200
Message-ID: <20230115183556.7691-3-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230115183556.7691-1-avihaih@nvidia.com>
References: <20230115183556.7691-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT038:EE_|SN7PR12MB7419:EE_
X-MS-Office365-Filtering-Correlation-Id: 84dacfd6-d134-4ae0-a7ab-08daf7276439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wAVHOU0CH1ZpOBgnv0FluRp4s5OT/LqUWtlu7ltwqIpV/B+IAtPgqxy8rwECBupycKrR7t0D+wI2a/C+GrrTeIi0BOG2RbW28r4Uz0WokarvIGsJTTjbQS0Wk8wE74BTtMHg1JlZuebBtE/DQRZrIgmstIFxmOwbeIxsppKRqDIcnoQncZHrYdLrZYVCcd22EKVaHBUsxneMsuGWfRLvuHQOY74emnsm5EZPej2fI5NqWeqSFK2PxhpVFVdUukk2ORQOzFbEti18aVyN+luLxqN89EQAJ+kYnpconQ6LU3SA0X29Lr3rbgMOshlWTR0er9lmmPqvytkP0eMAbBQSEvpiX/wjbjdRqz1d/yA7bXPCMqXoU/o8VTPhzB1WPq/Jk7O4iLqvDonEasb69IDumbp70Hwa+U59Xqqjq22ekQ1Nmpq3DnZYPnM5qVDnfnQQ/wqGXgIl4kwCsCLZD5yIGX+DEow3YFJOoC39ukirtJogXGCMAYqk/S3AC7J8HwcDAyHdm+NcPnSygrQ5jOPh5CE5iphtyQ7aIoXN4jSv3DPonmpptxe0F5kjKgo/QEGZPHFpCUsM1fZnRXOIgofztzXtrpEa30n8MKK1tnXap+btLCwoUswQCY1Tnk6IqXlHSSVa9EOibg/Y3Y2P7BjZfpPAFPWPpJMDLgFTtCQIv8Tx9foFf/clS9mJ1z7aRd2UHUwZmf1YWVVrpVQ3lLy5Gg==
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199015)(36840700001)(40470700004)(46966006)(2906002)(54906003)(336012)(40460700003)(4326008)(47076005)(426003)(36860700001)(5660300002)(86362001)(36756003)(8936002)(7416002)(8676002)(70206006)(70586007)(82740400003)(6916009)(40480700001)(356005)(316002)(41300700001)(7636003)(7696005)(83380400001)(82310400005)(478600001)(6666004)(2616005)(26005)(1076003)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 18:36:18.2069 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84dacfd6-d134-4ae0-a7ab-08daf7276439
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7419
Received-SPF: softfail client-ip=40.107.101.86;
 envelope-from=avihaih@nvidia.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
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

From: Juan Quintela <quintela@redhat.com>

So remove it everywhere.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/migration/register.h   | 3 +--
 migration/savevm.h             | 3 +--
 hw/s390x/s390-stattrib.c       | 2 +-
 hw/vfio/migration.c            | 3 +--
 migration/block-dirty-bitmap.c | 3 +--
 migration/block.c              | 2 +-
 migration/migration.c          | 4 ++--
 migration/ram.c                | 2 +-
 migration/savevm.c             | 7 +++----
 9 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/include/migration/register.h b/include/migration/register.h
index c1dcff0f90..eb6266a877 100644
--- a/include/migration/register.h
+++ b/include/migration/register.h
@@ -46,8 +46,7 @@ typedef struct SaveVMHandlers {
 
     /* This runs outside the iothread lock!  */
     int (*save_setup)(QEMUFile *f, void *opaque);
-    void (*save_live_pending)(QEMUFile *f, void *opaque,
-                              uint64_t threshold_size,
+    void (*save_live_pending)(void *opaque, uint64_t threshold_size,
                               uint64_t *res_precopy_only,
                               uint64_t *res_compatible,
                               uint64_t *res_postcopy_only);
diff --git a/migration/savevm.h b/migration/savevm.h
index 6461342cb4..6dec468cc3 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -40,8 +40,7 @@ void qemu_savevm_state_cleanup(void);
 void qemu_savevm_state_complete_postcopy(QEMUFile *f);
 int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
                                        bool inactivate_disks);
-void qemu_savevm_state_pending(QEMUFile *f, uint64_t max_size,
-                               uint64_t *res_precopy_only,
+void qemu_savevm_state_pending(uint64_t max_size, uint64_t *res_precopy_only,
                                uint64_t *res_compatible,
                                uint64_t *res_postcopy_only);
 void qemu_savevm_send_ping(QEMUFile *f, uint32_t value);
diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index 9eda1c3b2a..a553a1e850 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -182,7 +182,7 @@ static int cmma_save_setup(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void cmma_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
+static void cmma_save_pending(void *opaque, uint64_t max_size,
                               uint64_t *res_precopy_only,
                               uint64_t *res_compatible,
                               uint64_t *res_postcopy_only)
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index c74453e0b5..e1413ac90c 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -456,8 +456,7 @@ static void vfio_save_cleanup(void *opaque)
     trace_vfio_save_cleanup(vbasedev->name);
 }
 
-static void vfio_save_pending(QEMUFile *f, void *opaque,
-                              uint64_t threshold_size,
+static void vfio_save_pending(void *opaque, uint64_t threshold_size,
                               uint64_t *res_precopy_only,
                               uint64_t *res_compatible,
                               uint64_t *res_postcopy_only)
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 283017d7d3..ffc433cd11 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -761,8 +761,7 @@ static int dirty_bitmap_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void dirty_bitmap_save_pending(QEMUFile *f, void *opaque,
-                                      uint64_t max_size,
+static void dirty_bitmap_save_pending(void *opaque, uint64_t max_size,
                                       uint64_t *res_precopy_only,
                                       uint64_t *res_compatible,
                                       uint64_t *res_postcopy_only)
diff --git a/migration/block.c b/migration/block.c
index 4347da1526..b6a98caf78 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -862,7 +862,7 @@ static int block_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void block_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
+static void block_save_pending(void *opaque, uint64_t max_size,
                                uint64_t *res_precopy_only,
                                uint64_t *res_compatible,
                                uint64_t *res_postcopy_only)
diff --git a/migration/migration.c b/migration/migration.c
index 52b5d39244..9795d0ec5c 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3751,8 +3751,8 @@ static MigIterateState migration_iteration_run(MigrationState *s)
     uint64_t pending_size, pend_pre, pend_compat, pend_post;
     bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
 
-    qemu_savevm_state_pending(s->to_dst_file, s->threshold_size, &pend_pre,
-                              &pend_compat, &pend_post);
+    qemu_savevm_state_pending(s->threshold_size, &pend_pre, &pend_compat,
+                              &pend_post);
     pending_size = pend_pre + pend_compat + pend_post;
 
     trace_migrate_pending(pending_size, s->threshold_size,
diff --git a/migration/ram.c b/migration/ram.c
index 334309f1c6..35a251b297 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3392,7 +3392,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
+static void ram_save_pending(void *opaque, uint64_t max_size,
                              uint64_t *res_precopy_only,
                              uint64_t *res_compatible,
                              uint64_t *res_postcopy_only)
diff --git a/migration/savevm.c b/migration/savevm.c
index a0cdb714f7..a94e637904 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1471,7 +1471,7 @@ flush:
  * the result is split into the amount for units that can and
  * for units that can't do postcopy.
  */
-void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
+void qemu_savevm_state_pending(uint64_t threshold_size,
                                uint64_t *res_precopy_only,
                                uint64_t *res_compatible,
                                uint64_t *res_postcopy_only)
@@ -1492,9 +1492,8 @@ void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
                 continue;
             }
         }
-        se->ops->save_live_pending(f, se->opaque, threshold_size,
-                                   res_precopy_only, res_compatible,
-                                   res_postcopy_only);
+        se->ops->save_live_pending(se->opaque, threshold_size, res_precopy_only,
+                                   res_compatible, res_postcopy_only);
     }
 }
 
-- 
2.26.3


