Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B412E658C0D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 12:06:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAqiB-0006vm-A9; Thu, 29 Dec 2022 06:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pAqi1-0006sj-G5; Thu, 29 Dec 2022 06:04:27 -0500
Received: from mail-bn1nam02on2075.outbound.protection.outlook.com
 ([40.107.212.75] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pAqhx-0006R6-Og; Thu, 29 Dec 2022 06:04:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4iLstgkcBJTMoRRaZl4BXjeKC+rDMrlMpoo2oPvgmtHHUHboxrFVFo2PrsqOV4LlS39h9oH2CyHD7VI77LSFlk+15SmZd6noRj1ky0L46LSuYOa0S/7W0Sej3KEO7YYoxrJkfGB/NjZJzxXni/BYvs6wE6Lh4oNZ2WWcBPp8DUJaT86xwlYHpI2b0f0s4M/OFgGQSOHUSs5/GPPu6tkHI6xhGddA0R0VhPhja4Ud4N1upxLvXOp+r1yPLWLTR2CWy7jAvlayuuSuZS6UjoKH5WmrUIAlI2vpS2Gg93PrIQuhuJNvgr5Yd9EOwotIR8B0q8KDPp3XwpDKCEjPY4YvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCAXggWAAw5x+H9R1l/6Zz6M5lu7IldvVJZw9bWHbH0=;
 b=Y4sN1FwrhOVW1nQmTVNErhEV5zzsOi/jl7Jp/+nuKXXhS0XcJcOG4lFSj93lxphWd0nyKudJL8JSIZVkMg8YXHcTmVKPfMy/pzqTplS8YCAQdnvyLo/sULkrayd5HD/U1QfOS0DI5VApjrJGHw2UW+vSIsHjhWGaT1QJW8901F48hvjSk32BjU4MBSDtbOj+eMPNdY5mWlZxhHKd0B8SRlFVCYxEewgVpU4qHMSpBM+tAqsEjKQRFw2JHfLo6fWnIYmdsXlCvaiLn0cPd95LKP9LOgPblHag11DyxTwBvPIhVzU6uP9dCZ4rMUCjsap11icHs70u4M+sGZIG1hOsiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCAXggWAAw5x+H9R1l/6Zz6M5lu7IldvVJZw9bWHbH0=;
 b=JTvXDCuFDbiaBM7KlKdbR6ybhbia+GML3oqyl5IBmrUHQN1zvNHo+/V/rdHZehZUdY9OhoOMoIbUuh0JWp3jiNCOGwbG1Z0xX9MxR4rKUHMsTHYWFb1+drsmrmyASXI3jNozdMuvbWtlZd44zkrD7mrFw9JKsuXvw2HqPDF7SiGMcREU9X1NMStoYa31WqHXc4I4ewRn5b61bjzlAYdVdK+AxDueWjmSNnzW7OfeEmSFusyjqUGUUjsAp0F3pQktCA53pFNfls1PleXgOSUj5eGO9J1ZRgT+8tMi/upMl5UpOqz5G96+33VLZVHlyRBtaWkMmqeOntySF1vV+g9ieg==
Received: from DS7PR03CA0205.namprd03.prod.outlook.com (2603:10b6:5:3b6::30)
 by MN2PR12MB4189.namprd12.prod.outlook.com (2603:10b6:208:1d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Thu, 29 Dec
 2022 11:04:15 +0000
Received: from DS1PEPF0000E646.namprd02.prod.outlook.com
 (2603:10b6:5:3b6:cafe::32) by DS7PR03CA0205.outlook.office365.com
 (2603:10b6:5:3b6::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.17 via Frontend
 Transport; Thu, 29 Dec 2022 11:04:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0000E646.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.8 via Frontend Transport; Thu, 29 Dec 2022 11:04:15 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 29 Dec
 2022 03:04:09 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 29 Dec
 2022 03:04:08 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Thu, 29 Dec
 2022 03:04:02 -0800
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
 <maorg@nvidia.com>, Avihai Horon <avihaih@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: [PATCH v5 02/14] migration: No save_live_pending() method uses the
 QEMUFile parameter
Date: Thu, 29 Dec 2022 13:03:33 +0200
Message-ID: <20221229110345.12480-3-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221229110345.12480-1-avihaih@nvidia.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E646:EE_|MN2PR12MB4189:EE_
X-MS-Office365-Filtering-Correlation-Id: 14075f83-3ff3-4d39-d177-08dae98c6cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0xuZ8Bqfh4F5sEh8czW7FRUCHflVuaj/LU3Kq3DjS/iAeQ7RaaoMGAih10JQ0kbzAm/GHhu6Eb5tRePDPP0tJQEHry3DXevdYYSI6yhmb3vwphYhx78QVXQRyg7OaevIvfG08afnrKSgPPztkYLASyCnQwGF3xplY1+kIBcwTahnGUV/BN6+P4NRQ/zdXSOinFOERdiVcef0dIMcCMKB+oHFCRUqk5R6a5RRkK9T2pJgyF03T0PS0JuhQoWGqGilrZfVWrRbd1ORL+ct+7duXa8Avs0AIX2/eZJQu+hr++OtgLSwulbRUy0ZFLEG4LC2pNEKCbJG2Fn/8W2AAnyNu3KT4Wj63POVgYmHpcdAXnyoMXp6KcBdT8X5MfTW/bchqtOixa96IM5xqAidPuxEqZrkaj0G36kBjnpYgHSFObBeBgGh+eGaEgC/W9MUNCogHodi+Dq706Mn48wDDEtZZ3p7U6gRyGpXUwD9wfBS/HhXjBWLyt9X9XqOObxFl4L5Z5SGI8nauFz6GBzNXYb7pmEPfhMEa6H8d73gTPjjU2nuXiKdG7sZxeFIweRYHOs2JbttMXXXqSVmbAAzrVgVtawpwXw2LejiN3jA/6BFlxrIgK6KPYpoOhyLbatux0SdNP9OcS4ppnIqdBpDV/xC2e7rXlK+bL+S4R+U7X3BO3xp7WI8UDOABvA+SYyLtSd+qBpFxZ3R7v17xjMDZ/B8gQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(36756003)(86362001)(356005)(41300700001)(70206006)(6916009)(54906003)(70586007)(4326008)(8676002)(36860700001)(7636003)(82740400003)(83380400001)(7696005)(6666004)(426003)(47076005)(478600001)(2906002)(8936002)(7416002)(40460700003)(316002)(40480700001)(26005)(336012)(186003)(5660300002)(1076003)(2616005)(82310400005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2022 11:04:15.4577 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14075f83-3ff3-4d39-d177-08dae98c6cc8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E646.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4189
Received-SPF: permerror client-ip=40.107.212.75;
 envelope-from=avihaih@nvidia.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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


