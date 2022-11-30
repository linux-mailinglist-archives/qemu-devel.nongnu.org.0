Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623AA63D267
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 10:48:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Jg2-00056r-Hf; Wed, 30 Nov 2022 04:46:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1p0Jfe-0004sz-8y; Wed, 30 Nov 2022 04:46:31 -0500
Received: from mail-dm6nam10on2082.outbound.protection.outlook.com
 ([40.107.93.82] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1p0Jfc-0003Ju-35; Wed, 30 Nov 2022 04:46:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nr4zThIbS0OJq6xb2TjcMPkJiEPFD2ssahbf1ADFkh2kKhrzWK6jlBQH1wohr2gPXCAiCbJ6U5L61iuUho7fXI016CB1t2yTeSlwdlQSzLRNJJr5hfWYKBQCG59Y25jDeApIoWz85VRLEtuHWK80hGZUPz9L1He5oYKl/XZBAY1S9eyqlFusNPYhleB5WbHabyqR3eUx7P4BpR28+1Fs5+0zzzwr8R2ec3ODrZ5jGWizqMG/pAxOiLxeFq1619mL176S3BF1h40Qaeq02sK7cXDOu6VlZA2OK3/dkfSRuvw49P+kwSu/LZXbpfmAwXP443HSFris0KMuUBuMxGJfqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fKtSj7bt1YoQ7NQEV6JOyBeAMHDjppjRRxJm9g6C/k=;
 b=Vo2jGq0pFlE1THD4QtGaYPasrgN93baEOWOjPW+Otoqf8oC4w/eHwaWQX13OeAh6p8oa6yaY3sDiN41U1cHLH96Nqe83Nrn7LzubIwNSkMW1TijO/0ZKqOWpn8t/ZAnEHkKnILq4/LB86CtCvaGyhUpBouxoucyDgHak98B03N17JR1lRupMluyhYovHMtcmmYaVl+ZQhT0YWCMG8QqRvopBDM1AqEWKHl1ZpM+mJKMqcSVlnzmqi7th05zHGTZbitmVcNeK6uRndTViqUAqCGtOysGx8NepRrmmb+iSLd7qWZvEN26KHzvPifNbV4S/TnPVTortGpdMoMe+lxI1eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fKtSj7bt1YoQ7NQEV6JOyBeAMHDjppjRRxJm9g6C/k=;
 b=NryQqryzHxazmE2/2rSsFrdIkESjYoDQfm4VQ6NIPPSq5OcryLUcUlt+gU3lUhImp9L0oIjozXLIHerYtyaBvAQDMpvbSnNYJsIUq85ay71hAy71v+DKSABMqJLheFY4PWlcZCzUA5/vfR+qU3ZOGmk/GA+0S0SF09x6Qmonml5qTT5EGbPIbcaUhASiDdVMbbNazm6CTFMwjoMiXPUaQN4qTM2akIXqZwl3Da9ooXbVdMrR5GeH2NCT0Oywz/krWyu6KkQhAO0/FzEtOy2QtwqpXqZNYRstONWd6J16FQXylnkO29Cq2bZhk5XwZtxOh47Opcxgu6AuI/lFG39mQA==
Received: from MW4PR03CA0108.namprd03.prod.outlook.com (2603:10b6:303:b7::23)
 by BN9PR12MB5368.namprd12.prod.outlook.com (2603:10b6:408:105::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 09:46:18 +0000
Received: from CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::ee) by MW4PR03CA0108.outlook.office365.com
 (2603:10b6:303:b7::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Wed, 30 Nov 2022 09:46:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT088.mail.protection.outlook.com (10.13.175.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23 via Frontend Transport; Wed, 30 Nov 2022 09:46:18 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 01:46:06 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 01:46:06 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 30 Nov
 2022 01:45:59 -0800
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
Subject: [PATCH v4 14/14] vfio/migration: Optimize vfio_save_pending()
Date: Wed, 30 Nov 2022 11:44:14 +0200
Message-ID: <20221130094414.27247-15-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221130094414.27247-1-avihaih@nvidia.com>
References: <20221130094414.27247-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT088:EE_|BN9PR12MB5368:EE_
X-MS-Office365-Filtering-Correlation-Id: ad96624e-41b2-4809-79ea-08dad2b7bae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UQ7BdWcOSaK/LqIZlZUjbsjhQ2dgu3rT8M9iyN7O2j2yke9Q6RQeNExvRQSkutJElfzL53M35B7fqHHwhWaCG2BKUifxrUts+evZA8y018OLM1QGnRF8FXaASfPqlqoa7rbJioJHIv+T17oigkw9SRP3/T/mZZH23NDLKHBIqP+/cINzlTjCLxK5MjMmNmD5kIflAVFkj6K+lAzBM1+sXN4AqCFQc3yGEldk2PL8ATEqs48nFt0MJj3MwpdkbkedQFgnCYCoCAUfz/W0+myWpO5AG/P/hBQn3XbckLhIwV9YNCIkyyjEf9YT60ZFNUV5CQg3ZYIP60T3eyTBVW+SseTCswHRh4PmCK8ED8pGyA5yoB+5tNE5aXadRuyB1aUZAm9prk/ikDbxboZYtMVIzkqkF+RQcsL1WZE0LkZc013HXlqFhyLOkUKzdWRbOtY8vFjAo7Z2kY/fm/yPQu37B3JljRXAVITIh7tkFs7PMz2MvaG4qWNntMtIGeeshdASaXQQlHB/afdglNv9/PIdlYLBfIpgq6h4VudQPbfVOuvxia88JXRp71A7t9DQq5Ex003Zfx9oV6pJQuqlZ8yZfP+cRLTAe5haHOmReK5LBrvfM74na652RqsHJt5MqyfFdRk7klAnY/rYCE7l5Rn4iPCoCzBEx8tx84VIGWdcjHXlsZsPGzDyZAFLClJgPwBxtaj0nYZ+VgMCRSIpK/x0QQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(40470700004)(36840700001)(46966006)(356005)(7636003)(40480700001)(86362001)(70586007)(2616005)(336012)(8936002)(41300700001)(70206006)(26005)(8676002)(40460700003)(4326008)(478600001)(6666004)(316002)(7696005)(36860700001)(6916009)(82740400003)(83380400001)(54906003)(2906002)(7416002)(426003)(47076005)(1076003)(5660300002)(186003)(36756003)(82310400005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 09:46:18.1102 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad96624e-41b2-4809-79ea-08dad2b7bae3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5368
Received-SPF: softfail client-ip=40.107.93.82; envelope-from=avihaih@nvidia.com;
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

During pre-copy phase of migration vfio_save_pending() is called
repeatedly and queries the VFIO device for its pending data size.

As long as pending RAM size is over the threshold, migration can't
converge and be completed. Therefore, during this time there is no
point in querying the VFIO device pending data size.

Avoid these unnecessary queries by issuing them in a RAM pre-copy
notifier instead of vfio_save_pending().

This way the VFIO device is queried only when RAM pending data is
below the threshold, when there is an actual chance for migration to
converge.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/migration.c           | 55 +++++++++++++++++++++++++----------
 hw/vfio/trace-events          |  1 +
 include/hw/vfio/vfio-common.h |  2 ++
 3 files changed, 43 insertions(+), 15 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 9285746183..d57cda5516 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -269,31 +269,19 @@ static void vfio_save_cleanup(void *opaque)
     trace_vfio_save_cleanup(vbasedev->name);
 }
 
-/*
- * Migration size of VFIO devices can be as little as a few KBs or as big as
- * many GBs. This value should be big enough to cover the worst case.
- */
-#define VFIO_MIG_STOP_COPY_SIZE (100 * GiB)
 static void vfio_save_pending(void *opaque, uint64_t threshold_size,
                               uint64_t *res_precopy_only,
                               uint64_t *res_compatible,
                               uint64_t *res_postcopy_only)
 {
     VFIODevice *vbasedev = opaque;
-    uint64_t stop_copy_size;
+    VFIOMigration *migration = vbasedev->migration;
 
-    if (vfio_query_stop_copy_size(vbasedev, &stop_copy_size)) {
-        /*
-         * Failed to get pending migration size. Report big pending size so
-         * downtime limit won't be violated.
-         */
-        stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;
-    }
+    *res_precopy_only += migration->stop_copy_size;
 
-    *res_precopy_only += stop_copy_size;
     trace_vfio_save_pending(vbasedev->name, *res_precopy_only,
                             *res_postcopy_only, *res_compatible,
-                            stop_copy_size);
+                            migration->stop_copy_size);
 }
 
 /* Returns 1 if end-of-stream is reached, 0 if more data and -1 if error */
@@ -501,6 +489,40 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
     }
 }
 
+/*
+ * Migration size of VFIO devices can be as little as a few KBs or as big as
+ * many GBs. This value should be big enough to cover the worst case.
+ */
+#define VFIO_MIG_STOP_COPY_SIZE (100 * GiB)
+static int vfio_migration_data_notifier(NotifierWithReturn *n, void *data)
+{
+    VFIOMigration *migration = container_of(n, VFIOMigration, migration_data);
+    VFIODevice *vbasedev = migration->vbasedev;
+    PrecopyNotifyData *pnd = data;
+
+    if (pnd->reason != PRECOPY_NOTIFY_AFTER_BITMAP_SYNC) {
+        return 0;
+    }
+
+    /* No need to get pending size when finishing migration */
+    if (runstate_check(RUN_STATE_FINISH_MIGRATE)) {
+        return 0;
+    }
+
+    if (vfio_query_stop_copy_size(vbasedev, &migration->stop_copy_size)) {
+        /*
+         * Failed to get pending migration size. Report big pending size so
+         * downtime limit won't be violated.
+         */
+        migration->stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;
+    }
+
+    trace_vfio_migration_data_notifier(vbasedev->name,
+                                       migration->stop_copy_size);
+
+    return 0;
+}
+
 static void vfio_migration_exit(VFIODevice *vbasedev)
 {
     g_free(vbasedev->migration);
@@ -578,6 +600,8 @@ static int vfio_migration_init(VFIODevice *vbasedev)
                                                            vbasedev);
     migration->migration_state.notify = vfio_migration_state_notifier;
     add_migration_state_change_notifier(&migration->migration_state);
+    migration->migration_data.notify = vfio_migration_data_notifier;
+    precopy_add_notifier(&migration->migration_data);
 
     return 0;
 }
@@ -622,6 +646,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
     if (vbasedev->migration) {
         VFIOMigration *migration = vbasedev->migration;
 
+        precopy_remove_notifier(&migration->migration_data);
         remove_migration_state_change_notifier(&migration->migration_state);
         qemu_del_vm_change_state_handler(migration->vm_state);
         unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 2723a5d1aa..e377a24f0e 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -154,6 +154,7 @@ vfio_load_cleanup(const char *name) " (%s)"
 vfio_load_device_config_state(const char *name) " (%s)"
 vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
 vfio_load_state_device_data(const char *name, uint64_t data_size, int ret) " (%s) size 0x%"PRIx64" ret %d"
+vfio_migration_data_notifier(const char *name, uint64_t stopcopy_size) " (%s) stopcopy size 0x%"PRIx64
 vfio_migration_probe(const char *name) " (%s)"
 vfio_migration_set_state(const char *name, const char *state) " (%s) state %s"
 vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 76d470178f..2aba45887c 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -62,10 +62,12 @@ typedef struct VFIOMigration {
     struct VFIODevice *vbasedev;
     VMChangeStateEntry *vm_state;
     Notifier migration_state;
+    NotifierWithReturn migration_data;
     enum vfio_device_mig_state device_state;
     int data_fd;
     void *data_buffer;
     size_t data_buffer_size;
+    uint64_t stop_copy_size;
 } VFIOMigration;
 
 typedef struct VFIOAddressSpace {
-- 
2.26.3


