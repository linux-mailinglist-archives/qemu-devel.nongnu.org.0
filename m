Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DE3666D0E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 09:54:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFtJ5-0005hx-5l; Thu, 12 Jan 2023 03:51:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pFtIb-0005cz-TN; Thu, 12 Jan 2023 03:51:02 -0500
Received: from mail-dm6nam10on2086.outbound.protection.outlook.com
 ([40.107.93.86] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pFtIX-0007Wu-Nb; Thu, 12 Jan 2023 03:50:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bncZ1LoYLbNcttHa5CXOX2FrnoyR+tv6ayQlOh0aHSnkmf/KWZF+rRYqCfhc+dlSUJLhZYedMKnMtY+eoMHwpxadrCMpNzsMB3V8gu5UY8f2NX+v4fD+km25RsysM7twAapePPkR5/WW7UbT9Ilbwf7/EZ+d3XskmHIkCwnv3A5rjAQmTkXXDHi4GYDpFJF03yjpXKUCgDvDpl+p4m68qWGkn7JZ8KlEIqA7Orx/aEqHa+F6N9ZOLc2Fy4c4RnIaumQbu0EWh8hLKZSIx7B3NJRiGfR3XLNPeMOzSeoNfqm+nSrJlZa3CTnycOTLKMoGfo2GuKlET5Wz8B+B1cSEHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCAXggWAAw5x+H9R1l/6Zz6M5lu7IldvVJZw9bWHbH0=;
 b=O0BrAyKurmcfJbxn8H/xEXcON4Hlocslsma/9q2iSwm6F6VyKQxvPwppsKZtkQcj942IQ2wVW3bPa6o4NIta0p8ZmQInFimu7hphW5P35Lo/LCJKUohEFkJClePVQ/Flkv3Trk+zFK+Q14mQfLC1nFP3kr2Ilz//KMfFD4+L8TivqLLA6XOqEgi+H8E4BUzODGcvPW4DnE5LwGtTqQrtYkcB51tlMrXUSji04FEjqXtc9YUZsGVsZD3feU3aPi5zSpWhJXr+TR9dm6HjKGxgWQE1PH0kXEid7A5UGe9qYeDXvKMcnytlDUCMy9Pzo6fmoljeBEJhuvLraoF8dRXlOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCAXggWAAw5x+H9R1l/6Zz6M5lu7IldvVJZw9bWHbH0=;
 b=DpxBD+NoyeQylfIwZj2pWjpxVuDQHr3r89/kOxee3f3NZED6nhIssjicpnKHtTTpknnNnsCP40k59/vkelL+aF1/ic8+W7z9Lhuqd75Mdn4th4F6qfXg6xMD+8I88r+auyyEvtw9Yqy0y/Km7UAOdMAs3A8mCd0/4iXSX33ar65APMreub39IfdNPrsGGDUQhtwa5jBP4czm7S5ycnrXVvv+drxdmzAC5hIMlEBQbrxfI6pFuSV5ciKcsjE9Ei+xOnYo/cKtCrpZKe8FHEYyfn0VS6V3Xjc9+00LuwcsTLkey8iAyGc24u8gNZP1HKI9wgnIkRe4ebW4zf9c7XSspw==
Received: from MW4PR03CA0350.namprd03.prod.outlook.com (2603:10b6:303:dc::25)
 by IA1PR12MB6163.namprd12.prod.outlook.com (2603:10b6:208:3e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 08:50:51 +0000
Received: from CO1NAM11FT069.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::bd) by MW4PR03CA0350.outlook.office365.com
 (2603:10b6:303:dc::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 08:50:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT069.mail.protection.outlook.com (10.13.174.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Thu, 12 Jan 2023 08:50:50 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 12 Jan
 2023 00:50:41 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 12 Jan 2023 00:50:41 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 12 Jan 2023 00:50:34 -0800
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
Subject: [PATCH v6 02/13] migration: No save_live_pending() method uses the
 QEMUFile parameter
Date: Thu, 12 Jan 2023 10:50:09 +0200
Message-ID: <20230112085020.15866-3-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230112085020.15866-1-avihaih@nvidia.com>
References: <20230112085020.15866-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT069:EE_|IA1PR12MB6163:EE_
X-MS-Office365-Filtering-Correlation-Id: 16c718bd-c6c4-4ae0-5865-08daf47a1b4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mshW9eumkqgAG3MgYs146LetOxdRmaue3gIs//1ETwO0/Wz/vC5ilqP66FAP9fZDdm7/5X2kFpqiSGvVl3alxgLlbueAEKvTWhWBKqWsqE+/VR4dY7xy84H40Ml3b+0XL2o17+itggPtI2DSIspM4cjzV7AaDkMdajBA4sW/BL7X9ZhJszphKGUgDLVhHv5xdKmgSG1HoQKTpFkOdRKntyW+BcQ7qy3DOqqBbKNatTqIQiupD279BKOfdYHiblHz7y+KH+WHq/c85jjgTLti0iOUe8qh5fB1hX28ugFWceeqBg870oK2Nlr7XHw/L6+JWpv/Y56pOwnFPIS8dxJhocWTpBnKNEwaqDq5jUwXWDVGEgDyZo1prpUJdNja2wZCwRB5w1C5OHcleUIHKmSRLLncSXUKHAaOmPE1U9i1+aec/TzTtUnyzs5/uEEWfXebtwpd9A8e8psXyOppOpHUaIFtQLqHDOENal81dd3VFrSfd7txtHx442F8NEwfagsqtNfRLUPej9n5XDXdSRfSN2lmA70nVmpBjswTdxudC7OXyBr8mhMjmAe7AW3B6ZDbXQsUY2q+CiXEuGlcMN5VsDzZmrvQWjZOj5g3r6Fzt36rcrG0wiKzF/25I7W2BvoLlkuDUlC/6cQiuQYrXZ18KLlDdDfB4SWVcOa3yNKc6pyI2EGSFoEGF6p3p9npYeWxj2NS6ZFRGU1j417NlvGJcw==
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199015)(36840700001)(40470700004)(46966006)(47076005)(6666004)(40480700001)(2616005)(336012)(186003)(26005)(4326008)(316002)(1076003)(70206006)(7696005)(6916009)(54906003)(478600001)(70586007)(36860700001)(356005)(7636003)(82740400003)(86362001)(426003)(83380400001)(40460700003)(7416002)(82310400005)(41300700001)(8676002)(36756003)(5660300002)(2906002)(8936002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 08:50:50.6453 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c718bd-c6c4-4ae0-5865-08daf47a1b4a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT069.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6163
Received-SPF: softfail client-ip=40.107.93.86; envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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


