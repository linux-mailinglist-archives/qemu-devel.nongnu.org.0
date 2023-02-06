Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559B468BCD6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:33:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0fd-0002CE-2e; Mon, 06 Feb 2023 07:32:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pP0fa-00027l-Vr; Mon, 06 Feb 2023 07:32:27 -0500
Received: from mail-dm6nam04on20616.outbound.protection.outlook.com
 ([2a01:111:f400:7e8b::616]
 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pP0fY-0000SG-UW; Mon, 06 Feb 2023 07:32:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hhs3EjCfP4whVE1RXin83nw+uWR/e97i/2JqRG8U62RA3w1wHRt6bofp93uttH4C/A1j8TySLzptv2ZJzHsqo+24TT0M0dqzaF8STfMPpbVpIQS+HnUNuS48fXAHqwIQK8q2PgGrA3HphVWiSkfjTtZHsmm6x1juHJ9j+liFyfWeqC/Yob8S+P4wledWk1SZimxlkKi3Mt9luYZIqH9deHPWGQy9xRqjlR0aHWf5k1ayiL0Ot2ToewmcQO4QDNa0NhNsyM081SQLuRGEHwHwwjKVVrz+vYSXnAzQ9j8ANzrVkTrVeMVXL10o1LzUydImnNi9e7iiCe+T3v8kl/ONGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhEaX7Y2JVhGTDAcz+DakjbeF30jwjc93S1Q4XjpH00=;
 b=MgZqs4RCnaOVXb2xyNDGZPszIkhqwJDUxyhGRqKd6jx067Er03QiOl6sMDzJnngWSBlM1+jYX/9UCgDYtJZ+OvThnBwDhKKa0vhFqOGgiJaVeHCR6NHm+AQK1qlHGhGE1yMHBfoWdRNW3qHduPaZqTICTFWWS/iRRRAHFIeUGlXIxsHa533aDz4Q0aZUzFEPVl6DN7puSadfU0DvSD5o2Kl7wuiUxJ8HUpIZAmXdNdHe7abUwarNPTjU2l+3JgdwmjxKIaAj2gnYONeQ5NAc+6LplEZA4CdeLiNjUH71PLRueAR+s4JVk6bvd7ncdhfztqUZVcJPTspF40ZAoJVPWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhEaX7Y2JVhGTDAcz+DakjbeF30jwjc93S1Q4XjpH00=;
 b=psC+7k5nPdToDc+rUAHtoqnH2KErRy3Kc1KHnrTBpYmL6cHF4vqXIWaSi2wAIZQQOWaS+lAmBlowQcv1SyEn0DWsYDIpV6nK8afQIwEzq2El76lKQbWVA/bIndiHIwP0QSxJ8tCHUipp1HcpmrIfdgCgQ/eHe4ZYJln2eqwdegeeE5nCiniE87jmhnBYC/pvHc2txLky7SqVLJUwzgmjFeF/bzeW05mANIVkhd9GefpJTr5Z7vtCYAHt4vlyEwtKwms3xGNky+kLtVCjzqzxsFQFpP7N6jfWehuGAKpxNuvXOQSTwsC4WBx6ydrZeYi/jc07btdQMFkZ6xKLHiza8Q==
Received: from BN9PR03CA0846.namprd03.prod.outlook.com (2603:10b6:408:13d::11)
 by SN7PR12MB7346.namprd12.prod.outlook.com (2603:10b6:806:299::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Mon, 6 Feb
 2023 12:32:20 +0000
Received: from BL02EPF000108E8.namprd05.prod.outlook.com
 (2603:10b6:408:13d:cafe::25) by BN9PR03CA0846.outlook.office365.com
 (2603:10b6:408:13d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34 via Frontend
 Transport; Mon, 6 Feb 2023 12:32:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF000108E8.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.17 via Frontend Transport; Mon, 6 Feb 2023 12:32:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 04:32:01 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 04:32:00 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Mon, 6 Feb
 2023 04:31:53 -0800
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
Subject: [PATCH v9 02/14] migration: No save_live_pending() method uses the
 QEMUFile parameter
Date: Mon, 6 Feb 2023 14:31:25 +0200
Message-ID: <20230206123137.31149-3-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230206123137.31149-1-avihaih@nvidia.com>
References: <20230206123137.31149-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108E8:EE_|SN7PR12MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: 291ff0f1-d714-4ae8-6f2e-08db083e3089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mrt2DnaAGyDsmt0Viur8ywB7swyH/QoC/mNJu7mW5AXvmpWLyg3kFbj93G+3s6noA3xzxy9deg9xVgEuRNlpndUnRoNiAlLQvyZ8r6h/6jKD7Jfd5DwS0NP66e4oaFxbUEpUKjmC5BJJbU5VcOxSWrv38qHDN6lv3upZs2nl7xBTR4V/w2o6F3DAMyR+xwvlWLPuuxJ1sWfWLibQlEwLP3K26T2KUDEW5Y7sw5uzmiRT8D9gkGq6Y6mCMSkkO1+yLn9Q5X+qByrZATMFZiPuroiqXfy8M0OKs2zyJYXRgN5o09vpjkD/QuX7nC83th8tLCFnTggO9IntYLE6IfOp7ldCwIzelqfqM9F3CQyFbYObOrv7beNXBNTAfk3VTw6YtU7KtphM6nyON7fbVtEMgLFM8WqwXYcmm+sBAJU7+08L+2iE7ew6/pjkFuhou0IakkwhSrkEPEYzsEUuXq1pycekPcSEP8dp58s8n86YG3fiLMM94OoZL8F8Zq3gwsiReNeBdJAalUfOR7WOqySNOY33ZiTQriXd/Qk6mNlVjhJi2Rsh5uQ4rPwdKL2SLZLE0fqPCVeuotg5/x6hPkLVrJuL7EmfcBRWQAhxh4fNqzgLBanIfFVx9vNWjNQ924vfDpd3voqR3HinXN5yBaPdIa+vLs4LoFOG15Sj627ns8sLbj9Xg9KsrZ6n4byCWsx6PUp1ZDizwDr/vSxkYjQhug==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199018)(36840700001)(46966006)(40470700004)(2906002)(6916009)(70586007)(4326008)(7696005)(70206006)(8676002)(2616005)(47076005)(426003)(336012)(36756003)(82310400005)(86362001)(36860700001)(83380400001)(8936002)(41300700001)(40480700001)(186003)(54906003)(7416002)(356005)(1076003)(478600001)(82740400003)(316002)(40460700003)(6666004)(26005)(5660300002)(7636003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 12:32:19.6177 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 291ff0f1-d714-4ae8-6f2e-08db083e3089
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7346
Received-SPF: softfail client-ip=2a01:111:f400:7e8b::616;
 envelope-from=avihaih@nvidia.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
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
index 15127d489a..9ec6e9d858 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -762,8 +762,7 @@ static int dirty_bitmap_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void dirty_bitmap_save_pending(QEMUFile *f, void *opaque,
-                                      uint64_t max_size,
+static void dirty_bitmap_save_pending(void *opaque, uint64_t max_size,
                                       uint64_t *res_precopy_only,
                                       uint64_t *res_compatible,
                                       uint64_t *res_postcopy_only)
diff --git a/migration/block.c b/migration/block.c
index 5da15a62de..47852b8d58 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -863,7 +863,7 @@ static int block_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void block_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
+static void block_save_pending(void *opaque, uint64_t max_size,
                                uint64_t *res_precopy_only,
                                uint64_t *res_compatible,
                                uint64_t *res_postcopy_only)
diff --git a/migration/migration.c b/migration/migration.c
index 56859d5869..9e1f9c5736 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3781,8 +3781,8 @@ static MigIterateState migration_iteration_run(MigrationState *s)
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
index a783789430..96e7964d3e 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1472,7 +1472,7 @@ flush:
  * the result is split into the amount for units that can and
  * for units that can't do postcopy.
  */
-void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
+void qemu_savevm_state_pending(uint64_t threshold_size,
                                uint64_t *res_precopy_only,
                                uint64_t *res_compatible,
                                uint64_t *res_postcopy_only)
@@ -1493,9 +1493,8 @@ void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
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


