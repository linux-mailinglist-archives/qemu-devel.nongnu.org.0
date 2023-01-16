Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A29566C1A0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 15:14:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHQDo-0002US-CR; Mon, 16 Jan 2023 09:12:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pHQDf-0002SZ-2T; Mon, 16 Jan 2023 09:12:16 -0500
Received: from mail-bn7nam10on2046.outbound.protection.outlook.com
 ([40.107.92.46] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pHQDd-0002MP-1V; Mon, 16 Jan 2023 09:12:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RtvY9ixrS8sEq4DFvJk/33kOUE+DMllG1Eqt+ZxwAVKu8vHpRrl5PWjg4JsMu052D/pkwM9xNQsNA/Sihe7THeXAormA5cNfhNWIVqRDvya2dpmatzfq997eOaH6ZFDc99kgakjsLNADvdh6pitxsQ71K+bdzzFhxZPE5wa/P8XVSk4J06Eq473HJveWm5Q0LCUoSVZszdcv+vTR9C2JGAWx9NuYKEYVgZZM663FlLlrnsG4oko4EPXZwh6J+nt6ye1kqNqNWqM9eTAYT+lOJiaULON6m6+JtZUuGnaPn7HO+0qq3LIYidHWtVFRfEU2Q9qP9b/VKHID6l8CvpV2Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCAXggWAAw5x+H9R1l/6Zz6M5lu7IldvVJZw9bWHbH0=;
 b=f4c0b1z8IBfEYnCMMPWOQNH3yP1wr50K/ZqT7lNjKYAY2QqRMjnizOkqlOHTpMm0tR6wvurJV/ytg5BvG0RbTg+JMm2zQFmWvy4jk1cfxrbAe41X+SuJj1/4VUO4BoQQXvAhc1busNU26eQ6ZDWzGMSw8+KtouD4lW3InA4Fjrzpw8J9WMlPeD6DwEY3vSR6bFl4XH0QXKeBoCh1R6MfBq3j7W69xL6bt8raw8FwziEoguGBRvzqjV9PlE8zWPwJ06g6ncymQkwu+MFKeSuH7B3c24eR+SBD00WA/6R5x8sFcCN2z5cubxoBVqLBiYH7h9zRaW3o2efp5ai6oPx6Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCAXggWAAw5x+H9R1l/6Zz6M5lu7IldvVJZw9bWHbH0=;
 b=eODaEiwqOR/wT+J6/qQS1ZBhFfppkmgwKyIKu8VPdgsRKQLqhVhW7Urdd0ALC9BbMPi6biAoMtwwL0kHCZlAOwcJr/b1pj50woCFv/rRuXbtOvv15LwDdaZfWxtMtZ+aC9hGiCRTp4jRsrQuNosSnS9MHOAntuzqbW/oJS1uprhzY1fEvwA22r590PJ6dR2pc8MjBppdMEcRAxxsUGoZn0DSSivePufLMVw2MT7uoAqI3bnAaFsOKhLnfgwm27HbRRfoQn4Mj/pb3q8l3mGR/w1cjQJJWvfmlmVqLcj5kwm7Zi45Cj6qpAxRdSKM1837qlRB7bgten6z+XhbyEApRg==
Received: from DS7PR03CA0083.namprd03.prod.outlook.com (2603:10b6:5:3bb::28)
 by SN7PR12MB7345.namprd12.prod.outlook.com (2603:10b6:806:298::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 14:12:08 +0000
Received: from DM6NAM11FT111.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::e6) by DS7PR03CA0083.outlook.office365.com
 (2603:10b6:5:3bb::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 14:12:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT111.mail.protection.outlook.com (10.13.173.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 14:12:08 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 06:11:58 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 06:11:57 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Mon, 16 Jan
 2023 06:11:51 -0800
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
Subject: [PATCH v8 02/13] migration: No save_live_pending() method uses the
 QEMUFile parameter
Date: Mon, 16 Jan 2023 16:11:24 +0200
Message-ID: <20230116141135.12021-3-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230116141135.12021-1-avihaih@nvidia.com>
References: <20230116141135.12021-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT111:EE_|SN7PR12MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: 66564f3d-f30a-42d4-1923-08daf7cba738
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2T9LvK/5iogpCmKZyNiyPehopib1MICiBgilkk7JQfxLM2FX+qghVcFh+uI5tkw3ntc3xhGu4iLJ+9eCCoJ6l72gGS4W+Ntp9mljg4YHZYzCpjNkEU8cA663s6gey9oBpc5PNM9cAMj0Q4PGd5EKgZmmEUZXxESU7wMAt13Sf8vUb8jWnOU0Qqh1y+yKmIKE3a28bQFui+ZxAI+zO5633HqOBS6/anAS/IAxdUX9R+nUNiwIOH5vMgSlOQTSLMJDbv1C9FKm4wf+OqBsRv5sJ9uq4C5kR9IXxZ34Efgk/zbBLbQev33QIix9mPrWv0PHbUu7/WQSomkng65QTk3sO8wSVpJCr/Zp4K14sBF3lWh1digst8J0tPbb0ziJvMrojRGNMnoDwuN3VuoXtRUtjSBXnBNz/lZS4bQxL1MixvuVQz/y5lZP+2U/kctWPTkTB7EYsyqG+NoYMaMB1ZhW+lnvDuE27m1DoUsobmh2hWX86jQBSfeMi/HiyIXvc3bLzdNrlKjjSnNO9Pw7SRmg6DigfqqEBX67vwhq7hPSIH9pTRMDHijt3ARr4gwNKiZqD1nCN+QHpF0H5x7rTlMzEiID2ldJ6jz1Za035zSx/9UDs2tSQt5zytGHs7dVXPn7ZZmnt3Xyrl4hbPjEcMFMQ9Qm0tCOnX03/97+YOolxGaDXkAoCMuRkCnXi7K0+lvixe1nYAojrjKCfQxZ92AMWw==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199015)(46966006)(40470700004)(36840700001)(36756003)(356005)(86362001)(8936002)(4326008)(6916009)(8676002)(70586007)(70206006)(2906002)(5660300002)(7416002)(83380400001)(36860700001)(82740400003)(7636003)(6666004)(478600001)(7696005)(316002)(40460700003)(426003)(54906003)(40480700001)(82310400005)(41300700001)(2616005)(1076003)(47076005)(336012)(186003)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:12:08.0677 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66564f3d-f30a-42d4-1923-08daf7cba738
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT111.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7345
Received-SPF: softfail client-ip=40.107.92.46; envelope-from=avihaih@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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


