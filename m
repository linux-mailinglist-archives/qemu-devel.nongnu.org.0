Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C9A61840F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:18:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcuK-0000aY-Ty; Thu, 03 Nov 2022 12:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqctp-0000VO-GZ; Thu, 03 Nov 2022 12:17:01 -0400
Received: from mail-dm6nam11on2068.outbound.protection.outlook.com
 ([40.107.223.68] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqctn-00082S-CH; Thu, 03 Nov 2022 12:17:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYFgnANc9X74eFFpzZcDnHgIz0Yxr0OA9AyVJitKz1cAqj1uFKrPDRCws6/YMFsor1eDed7Ij26AwDwuBxndu0xj2A7OBKCBhUx8CXwM0ySV04w7H2Efc9SFZVbl7fqQEGbB2eSvjbhVZ0msVzWTY4L5A5ma9QIe7AvVzsgOy/ke06ziVfWwa271DOMUpQJWw7UoEw4BORyCnE1EC5iO7RnjfVOxCNXjId5VorMjW1zCzCyJCv/19bqPF0yBrTE7FiktttLWSwwxOlFfOX9lQObEfvbFnWr26GSmxYTx3EQTUFCsPN/PqStI7IuwcorJx0TSKAPEKn2lRxP+HYib4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwIBRUPyKH6BIuLMLCzubPbprEaZWUD3nTtn07OAp4I=;
 b=XCWmZGQfKblHz5X/6gWexV7kp1svIK1MIVvNnzY9YuatRbTN0PBnt8Eh7l4L5WtC+6Ga7YxsiEzeHAcnsQ/eSMmmWL8NWq72KVLm8qkA3P//JrIH5WnYNLBzF/QFxWUBK3u+vbeHdhYM6XLmE9wOrtF/JosZRhNamgQ2eJksAJqBnH4bCTU/et2vFsr8mROei/9vVbgJ5wwdYQcf/PFdLlQSq+IKO7L5qRNkeN7hwbhD/OZYXJ5im2Jk0dE7eNEAcRRZ/CsW/U+1v5xBUyXFfAzez2H4jVGejwhyf4z1JzQ6d2TdwBWh1krAWhdP6COHE57my0GtzYMEVERBDh4nSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwIBRUPyKH6BIuLMLCzubPbprEaZWUD3nTtn07OAp4I=;
 b=T8b/rRc1uimkT3a05nortW7yXETTQ0bubA5xwD9F2AEnbSzgOqE4GQDmlZ5baIOIuRmES3SjPtDClyI+jIA4L4J0DJRQ/6QvCi0IUxYb8Fq6W/4iTX5HF9BOsAnrNtuh70TankUEspCYV+28xCsZ6UF0Bg6sPMlfbJOppltoBUrFffgVAUI8QfPTx3Ub/QgDRD0OxnciZbtOLSbOIPMkrBiLlciVCwfqSRyrYDKYycco4KRvn7PuIEZ7Bj8ZAYh78kEL3gSFX9VyQQGDDoto5tXyhZl5GwU49OBSwdnslrQ+BfA7Q4tfpRMSpTXbg1iinsFtz5UTBbNxs3cWFhmzBA==
Received: from BN0PR07CA0009.namprd07.prod.outlook.com (2603:10b6:408:141::8)
 by IA0PR12MB7601.namprd12.prod.outlook.com (2603:10b6:208:43b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 16:16:55 +0000
Received: from BN8NAM11FT069.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::76) by BN0PR07CA0009.outlook.office365.com
 (2603:10b6:408:141::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21 via Frontend
 Transport; Thu, 3 Nov 2022 16:16:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN8NAM11FT069.mail.protection.outlook.com (10.13.176.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 16:16:54 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 3 Nov 2022
 09:16:44 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 3 Nov 2022 09:16:43 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.29 via Frontend Transport;
 Thu, 3 Nov 2022 09:16:36 -0700
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
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Kunkun Jiang
 <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v3 02/17] migration: No save_live_pending() method uses the
 QEMUFile parameter
Date: Thu, 3 Nov 2022 18:16:05 +0200
Message-ID: <20221103161620.13120-3-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221103161620.13120-1-avihaih@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT069:EE_|IA0PR12MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: 577061a2-f56c-4611-ccce-08dabdb6d2e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C7P6RrYppJ5U2qf9n0X7cG1F4bstLjV96E5hDYIP+xWxDm3V4yde16tr1wzMpBBybwPVT9l9YetPrY9igu+xfXSfWVbn/517LPMt+Dzy2KQecH9luRvGe8QEOcO2Yj8csxM7rekBLGmDgy2SWBoLBa9Rl6mNuauX9EXMrhlS+cEqjDG2CB6fThT2Z3RNiEKRT6mANdU6uqZzgbUhSjaFyObBruW32CAMxk1vI6UMfMatU/lBSNPsEvQE9BJJnoJChhM5z2oiqieYMXu+ruYExBG9KQNBv+OiNQGjtJXJi9XU32m6iYhXLalCIlrSyehhP02BRhNNab40UxxO04+4IvzJY9AqA6DxiYmF5c36NrHh9VCyzzoc+SDEx/sm5WY+Bi6kfBW04BGsXmqP6TT7QvzuQKo+PfjwAJpsy/5zlhumYDi6aE49lWNcDoE1JKSOp6Rpq1xa4cud2rRrEqePGku5eFtOcJuieHxKQ5OH+PbhGbtgL1IV7Ci14nypTzmj4zK56tm9GcAs/ZDrZWIfA8PeKyYecuZtbTaq1plrdkKIVc1WBBwyv4SMct5J2Tplo1vY6kgZuriVhoS1W9gB94Cb8Sne7wQMLTHXvgzRgwGbgNnw5XS74z7GHfnMcjQqmggdNQJia80J11StuXjNNIjgEFGoaehGABQBZmha5vYEapljBJdFkxMrp1GgwMZT4AHGP+sM4ji9dCQMcDsNYkOhhIEcSC60bAkWRhZJDJjIDN5EWTAjyYTMPVdQ7RLf/ZlfEZa8Biyq9dqLAl5+yg==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199015)(40470700004)(36840700001)(46966006)(36756003)(82740400003)(478600001)(6666004)(82310400005)(4326008)(2906002)(40460700003)(7416002)(70586007)(70206006)(36860700001)(5660300002)(86362001)(8936002)(41300700001)(356005)(316002)(54906003)(6916009)(40480700001)(7636003)(8676002)(83380400001)(186003)(336012)(2616005)(426003)(1076003)(7696005)(26005)(47076005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 16:16:54.4444 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 577061a2-f56c-4611-ccce-08dabdb6d2e5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT069.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7601
Received-SPF: softfail client-ip=40.107.223.68;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Juan Quintela <quintela@redhat.com>

So remove it everywhere.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/s390x/s390-stattrib.c       | 2 +-
 hw/vfio/migration.c            | 6 ++----
 include/migration/register.h   | 6 ++----
 migration/block-dirty-bitmap.c | 3 +--
 migration/block.c              | 2 +-
 migration/migration.c          | 3 +--
 migration/ram.c                | 2 +-
 migration/savevm.c             | 5 ++---
 migration/savevm.h             | 2 +-
 9 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index ee60b53da4..9b74eeadf3 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -182,7 +182,7 @@ static int cmma_save_setup(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void cmma_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
+static void cmma_save_pending(void *opaque, uint64_t max_size,
                               uint64_t *res_precopy, uint64_t *res_postcopy)
 {
     S390StAttribState *sas = S390_STATTRIB(opaque);
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 3423f113f0..760d5f3c5c 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -456,10 +456,8 @@ static void vfio_save_cleanup(void *opaque)
     trace_vfio_save_cleanup(vbasedev->name);
 }
 
-static void vfio_save_pending(QEMUFile *f, void *opaque,
-                              uint64_t threshold_size,
-                              uint64_t *res_precopy,
-                              uint64_t *res_postcopy)
+static void vfio_save_pending(void *opaque,  uint64_t threshold_size,
+                              uint64_t *res_precopy, uint64_t *res_postcopy)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
diff --git a/include/migration/register.h b/include/migration/register.h
index 1950fee6a8..5b5424ed8f 100644
--- a/include/migration/register.h
+++ b/include/migration/register.h
@@ -46,10 +46,8 @@ typedef struct SaveVMHandlers {
 
     /* This runs outside the iothread lock!  */
     int (*save_setup)(QEMUFile *f, void *opaque);
-    void (*save_live_pending)(QEMUFile *f, void *opaque,
-                              uint64_t threshold_size,
-                              uint64_t *rest_precopy,
-                              uint64_t *rest_postcopy);
+    void (*save_live_pending)(void *opaque,  uint64_t threshold_size,
+                              uint64_t *rest_precopy, uint64_t *rest_postcopy);
     /* Note for save_live_pending:
      * - res_precopy is for data which must be migrated in precopy
      *     phase or in stopped state, in other words - before target
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index dfea546330..9d4f56693f 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -761,8 +761,7 @@ static int dirty_bitmap_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void dirty_bitmap_save_pending(QEMUFile *f, void *opaque,
-                                      uint64_t max_size,
+static void dirty_bitmap_save_pending(void *opaque, uint64_t max_size,
                                       uint64_t *res_precopy,
                                       uint64_t *res_postcopy)
 {
diff --git a/migration/block.c b/migration/block.c
index 4ae8f837b0..b3d680af75 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -862,7 +862,7 @@ static int block_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void block_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
+static void block_save_pending(void *opaque, uint64_t max_size,
                                uint64_t *res_precopy,
                                uint64_t *res_postcopy)
 {
diff --git a/migration/migration.c b/migration/migration.c
index a4a18228c6..ffe868b86f 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3738,8 +3738,7 @@ static MigIterateState migration_iteration_run(MigrationState *s)
     uint64_t pending_size, pend_pre, pend_post;
     bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
 
-    qemu_savevm_state_pending(s->to_dst_file, s->threshold_size, &pend_pre,
-                              &pend_post);
+    qemu_savevm_state_pending(s->threshold_size, &pend_pre, &pend_post);
     pending_size = pend_pre + pend_post;
 
     trace_migrate_pending(pending_size, s->threshold_size, pend_pre, pend_post);
diff --git a/migration/ram.c b/migration/ram.c
index 20167e1102..48a31b87c8 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3434,7 +3434,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
+static void ram_save_pending(void *opaque, uint64_t max_size,
                              uint64_t *res_precopy, uint64_t *res_postcopy)
 {
     RAMState **temp = opaque;
diff --git a/migration/savevm.c b/migration/savevm.c
index 4d02887f25..9ddcbba4e3 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1471,8 +1471,7 @@ flush:
  * the result is split into the amount for units that can and
  * for units that can't do postcopy.
  */
-void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
-                               uint64_t *res_precopy,
+void qemu_savevm_state_pending(uint64_t threshold_size, uint64_t *res_precopy,
                                uint64_t *res_postcopy)
 {
     SaveStateEntry *se;
@@ -1489,7 +1488,7 @@ void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
                 continue;
             }
         }
-        se->ops->save_live_pending(f, se->opaque, threshold_size,
+        se->ops->save_live_pending(se->opaque, threshold_size,
                                    res_precopy, res_postcopy);
     }
 }
diff --git a/migration/savevm.h b/migration/savevm.h
index 9bd55c336c..98fae6f9b3 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -40,7 +40,7 @@ void qemu_savevm_state_cleanup(void);
 void qemu_savevm_state_complete_postcopy(QEMUFile *f);
 int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
                                        bool inactivate_disks);
-void qemu_savevm_state_pending(QEMUFile *f, uint64_t max_size,
+void qemu_savevm_state_pending(uint64_t max_size,
                                uint64_t *res_precopy, uint64_t *res_postcopy);
 void qemu_savevm_send_ping(QEMUFile *f, uint32_t value);
 void qemu_savevm_send_open_return_path(QEMUFile *f);
-- 
2.21.3


