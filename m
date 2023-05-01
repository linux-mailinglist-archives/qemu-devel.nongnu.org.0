Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151A96F31CA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 16:04:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptU7c-0005rv-64; Mon, 01 May 2023 10:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ptU73-0005Rj-Af
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:02:45 -0400
Received: from mail-bn8nam12on20603.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::603]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ptU6x-0006h9-5N
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:02:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCmu7JdU3Wn3qRSIoVB6EZ1I+sXDhaLuiI42nz2PAW2lffe0QfaiF2VxcCyf84KWNpg/w4cDynC+hKtHNZLpV3bAJEBAeFfYaxIVTvkz1Kr0oU7MAGK985SEZ/DeYBDLvp21Lm4B7QwED1JDSxHBovzaLDi+dsNGqsnWp25IAqqZm43ryA2oa6EBufRycNFqsYXDRgkJyRMGeOWcpG7oSpBp8PDbCkH/5VSH6BbnaKOsKe8VrAvc242nzCMpTjxt6N0sdwiUZvb/s1bj24j+feISmkSqEFmWRsPie75PSVENhdvB8jyB6sE5RoFYgS6P68LF7N8PrN3PXwwg0ymePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pjyyMuaW5ZzDu6v3C5hJg81rrSrjc4nS7NizjC8b8U=;
 b=X8W2ShoW8HV5uwbBBk6AP6iM/AEpRY6J6mFKFUb55FPFvC/T1UKBsoXoYHOBqGIgsod2IT79QDU4b2NBulKUbI1evmE454/2dovh189NSfq3+Bwr0Ye6YzdzopSAbEFkgiS2Z9U7lAugfO7WvE49E4jYUaN5yydWDqCfHKKzw2GJqDnC87htU/ToozaSZuTVjVyPrXHT2Yc+2wZR+ZLvRkn4yPA0goXVeQkbKrpztDCB3sQdnNBP7UvN/OGwKYWHLgJlPQA0/hdWYY7cukel2qs+1h6ZfE6nlFT8B0gOZ0oPA1j3pBBNA4A4BgoMkpiOBToRXYcpyYw8grTh+8Jxjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pjyyMuaW5ZzDu6v3C5hJg81rrSrjc4nS7NizjC8b8U=;
 b=qbAC0kDaEo90vBdwacDi1HAoWtA7ScPz0R40dmlmhypWZJSP1YSyP2+EDjXOy6Oh/oro8Iv1RkAgrxaxloKX9yMpqo43CUP5BEgkMORVURZ5J0vNYHgZQSdrg+zZG3L+zJi3IVTIA2ujzsQKyWaOdkfPjGw1HgOD5i7+RXoW/w1V6UqK2kfKq3UoyFeRgu0Ituuh6wWh8ZUBDjboZzEKe4BBn8YYhJ/8pIPfqO+7Rrn0mp5JOU+NZwI2PYka6vasBEQNM6i+6VllUvDngjwbPKWsrGsRuUoQArtgDViL8FhjzomcpKmL9g2WmpkfaU5smuVjtWj1lSqZMWBk/7FIbg==
Received: from DS0PR17CA0015.namprd17.prod.outlook.com (2603:10b6:8:191::23)
 by SJ0PR12MB5611.namprd12.prod.outlook.com (2603:10b6:a03:426::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 14:02:35 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:191:cafe::c1) by DS0PR17CA0015.outlook.office365.com
 (2603:10b6:8:191::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Mon, 1 May 2023 14:02:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.19 via Frontend Transport; Mon, 1 May 2023 14:02:33 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 1 May 2023
 07:02:21 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Mon, 1 May 2023
 07:02:20 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport; Mon, 1 May
 2023 07:02:16 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Leonardo Bras
 <leobras@redhat.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Avihai Horon <avihaih@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: [PATCH 7/8] vfio/migration: Add VFIO migration pre-copy support
Date: Mon, 1 May 2023 17:01:40 +0300
Message-ID: <20230501140141.11743-8-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230501140141.11743-1-avihaih@nvidia.com>
References: <20230501140141.11743-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT056:EE_|SJ0PR12MB5611:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af6f638-4cc7-46fd-2f48-08db4a4cb608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r8j5KUgDB7cMJcNCz8rG36JcVk7RF5AHTrV3BVK5hF9GVLjPT0LDS6aDkW6onyN//lvtZagZ/htJ7dR37+0U4CWPywfLucfkRXC8rrDy+svlyEDJdTv4qUbEL2nDo68rJo3YY7kCJMephgktye63etKqPxNHpBUeiqfudiCjhNbr9e10XkMM2ENBI54Q3vRW6hq/2D03+B0gvjjQrLxCPXMVYbFCE/tQllrm7oTrqo4GGV20OgwgXVV/cjXHUFIC2cTbbFvea/uWpS+4243uo14IA1WXC6vxiiaEocjLhT1u+PKxskXrue9zMFhiya5aeYg2a3kOFLXutOHDBDZ40uxzP1Qb+Gqpzm1eUYeMVmACsaxHBaDp6xKVfXJw1Ha7AcLikNWJpv/WErKsQLV0BEO2mYRhUh2DX3vyS1PGtv8zzb4F9tsfNQX5dKIbBg0HS5E6reRyY4iQg6KxuzwwPvOl0HaOdlO6xTrpVOLeZMqi1toKxT0ceVYY62pDc8UcWBF6a2Ym13lFOSOuiF//i7DhehSdKYdx52W2FXZNN5nCsF6oUs4KOerVDz/tnkPvdMLgrZvMaw1gK7edZbj13zOWhWLqRlf52l1A39CFldD5dgOq2TW/MiUKsMpCKbi6MqP7EY9N0dgZqfcFiNBAUOnjooyyRLGfAQD0OqUX/IzbwQSC60G80wdygXetClgQxjt8smYpT/obWFje2WRb89XgP5Q1EhFN7Gl4jBxKN/vnlZwoLE+AZJhQtmgT+lfZ
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199021)(40470700004)(46966006)(36840700001)(7416002)(5660300002)(356005)(7636003)(8676002)(40460700003)(82740400003)(8936002)(41300700001)(316002)(40480700001)(36756003)(82310400005)(86362001)(2906002)(30864003)(36860700001)(186003)(2616005)(478600001)(83380400001)(6666004)(7696005)(426003)(336012)(47076005)(26005)(966005)(1076003)(54906003)(4326008)(6916009)(70586007)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 14:02:33.3454 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af6f638-4cc7-46fd-2f48-08db4a4cb608
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5611
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::603;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Pre-copy support allows the VFIO device data to be transferred while the
VM is running. This helps to accommodate VFIO devices that have a large
amount of data that needs to be transferred, and it can reduce migration
downtime.

Pre-copy support is optional in VFIO migration protocol v2.
Implement pre-copy of VFIO migration protocol v2 and use it for devices
that support it. Full description of it can be found here [1].

[1]
https://lore.kernel.org/kvm/20221206083438.37807-3-yishaih@nvidia.com/

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 docs/devel/vfio-migration.rst |  35 +++++---
 include/hw/vfio/vfio-common.h |   3 +
 hw/vfio/common.c              |   6 +-
 hw/vfio/migration.c           | 155 ++++++++++++++++++++++++++++++++--
 hw/vfio/trace-events          |   4 +-
 5 files changed, 181 insertions(+), 22 deletions(-)

diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
index 1b68ccf115..e896b2a673 100644
--- a/docs/devel/vfio-migration.rst
+++ b/docs/devel/vfio-migration.rst
@@ -7,12 +7,14 @@ the guest is running on source host and restoring this saved state on the
 destination host. This document details how saving and restoring of VFIO
 devices is done in QEMU.
 
-Migration of VFIO devices currently consists of a single stop-and-copy phase.
-During the stop-and-copy phase the guest is stopped and the entire VFIO device
-data is transferred to the destination.
-
-The pre-copy phase of migration is currently not supported for VFIO devices.
-Support for VFIO pre-copy will be added later on.
+Migration of VFIO devices consists of two phases: the optional pre-copy phase,
+and the stop-and-copy phase. The pre-copy phase is iterative and allows to
+accommodate VFIO devices that have a large amount of data that needs to be
+transferred. The iterative pre-copy phase of migration allows for the guest to
+continue whilst the VFIO device state is transferred to the destination, this
+helps to reduce the total downtime of the VM. VFIO devices opt-in to pre-copy
+support by reporting the VFIO_MIGRATION_PRE_COPY flag in the
+VFIO_DEVICE_FEATURE_MIGRATION ioctl.
 
 Note that currently VFIO migration is supported only for a single device. This
 is due to VFIO migration's lack of P2P support. However, P2P support is planned
@@ -29,10 +31,20 @@ VFIO implements the device hooks for the iterative approach as follows:
 * A ``load_setup`` function that sets the VFIO device on the destination in
   _RESUMING state.
 
+* A ``state_pending_estimate`` function that reports an estimate of the
+  remaining pre-copy data that the vendor driver has yet to save for the VFIO
+  device.
+
 * A ``state_pending_exact`` function that reads pending_bytes from the vendor
   driver, which indicates the amount of data that the vendor driver has yet to
   save for the VFIO device.
 
+* An ``is_active_iterate`` function that indicates ``save_live_iterate`` is
+  active only when the VFIO device is in pre-copy states.
+
+* A ``save_live_iterate`` function that reads the VFIO device's data from the
+  vendor driver during iterative pre-copy phase.
+
 * A ``save_state`` function to save the device config space if it is present.
 
 * A ``save_live_complete_precopy`` function that sets the VFIO device in
@@ -111,8 +123,10 @@ Flow of state changes during Live migration
 ===========================================
 
 Below is the flow of state change during live migration.
-The values in the brackets represent the VM state, the migration state, and
+The values in the parentheses represent the VM state, the migration state, and
 the VFIO device state, respectively.
+The text in the square brackets represents the flow if the VFIO device supports
+pre-copy.
 
 Live migration save path
 ------------------------
@@ -124,11 +138,12 @@ Live migration save path
                                   |
                      migrate_init spawns migration_thread
                 Migration thread then calls each device's .save_setup()
-                       (RUNNING, _SETUP, _RUNNING)
+                  (RUNNING, _SETUP, _RUNNING [_PRE_COPY])
                                   |
-                      (RUNNING, _ACTIVE, _RUNNING)
-             If device is active, get pending_bytes by .state_pending_exact()
+                  (RUNNING, _ACTIVE, _RUNNING [_PRE_COPY])
+      If device is active, get pending_bytes by .state_pending_{estimate,exact}()
           If total pending_bytes >= threshold_size, call .save_live_iterate()
+                  [Data of VFIO device for pre-copy phase is copied]
         Iterate till total pending bytes converge and are less than threshold
                                   |
   On migration completion, vCPU stops and calls .save_live_complete_precopy for
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index eed244f25f..fa42955d4c 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -66,6 +66,9 @@ typedef struct VFIOMigration {
     int data_fd;
     void *data_buffer;
     size_t data_buffer_size;
+    uint64_t precopy_init_size;
+    uint64_t precopy_dirty_size;
+    uint64_t mig_flags;
 } VFIOMigration;
 
 typedef struct VFIOAddressSpace {
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 4d01ea3515..4f01f0148e 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -491,7 +491,8 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
             }
 
             if (vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF &&
-                migration->device_state == VFIO_DEVICE_STATE_RUNNING) {
+                (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
+                 migration->device_state == VFIO_DEVICE_STATE_PRE_COPY)) {
                 return false;
             }
         }
@@ -536,7 +537,8 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
                 return false;
             }
 
-            if (migration->device_state == VFIO_DEVICE_STATE_RUNNING) {
+            if (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
+                migration->device_state == VFIO_DEVICE_STATE_PRE_COPY) {
                 continue;
             } else {
                 return false;
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 235978fd68..980be1f614 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -68,6 +68,8 @@ static const char *mig_state_to_str(enum vfio_device_mig_state state)
         return "STOP_COPY";
     case VFIO_DEVICE_STATE_RESUMING:
         return "RESUMING";
+    case VFIO_DEVICE_STATE_PRE_COPY:
+        return "PRE_COPY";
     default:
         return "UNKNOWN STATE";
     }
@@ -241,6 +243,22 @@ static int vfio_query_stop_copy_size(VFIODevice *vbasedev,
     return 0;
 }
 
+static int vfio_query_precopy_size(VFIOMigration *migration)
+{
+    struct vfio_precopy_info precopy = {
+        .argsz = sizeof(precopy),
+    };
+
+    if (ioctl(migration->data_fd, VFIO_MIG_GET_PRECOPY_INFO, &precopy)) {
+        return -errno;
+    }
+
+    migration->precopy_init_size = precopy.initial_bytes;
+    migration->precopy_dirty_size = precopy.dirty_bytes;
+
+    return 0;
+}
+
 /* Returns the size of saved data on success and -errno on error */
 static ssize_t vfio_save_block(QEMUFile *f, VFIOMigration *migration)
 {
@@ -249,6 +267,11 @@ static ssize_t vfio_save_block(QEMUFile *f, VFIOMigration *migration)
     data_size = read(migration->data_fd, migration->data_buffer,
                      migration->data_buffer_size);
     if (data_size < 0) {
+        /* Pre-copy emptied all the device state for now */
+        if (errno == ENOMSG) {
+            return 0;
+        }
+
         return -errno;
     }
     if (data_size == 0) {
@@ -265,6 +288,31 @@ static ssize_t vfio_save_block(QEMUFile *f, VFIOMigration *migration)
     return qemu_file_get_error(f) ?: data_size;
 }
 
+static void vfio_update_estimated_pending_data(VFIOMigration *migration,
+                                               uint64_t data_size)
+{
+    if (!data_size) {
+        /*
+         * Pre-copy emptied all the device state for now, update estimated sizes
+         * accordingly.
+         */
+        migration->precopy_init_size = 0;
+        migration->precopy_dirty_size = 0;
+
+        return;
+    }
+
+    if (migration->precopy_init_size) {
+        uint64_t init_size = MIN(migration->precopy_init_size, data_size);
+
+        migration->precopy_init_size -= init_size;
+        data_size -= init_size;
+    }
+
+    migration->precopy_dirty_size -= MIN(migration->precopy_dirty_size,
+                                         data_size);
+}
+
 /* ---------------------------------------------------------------------- */
 
 static int vfio_save_setup(QEMUFile *f, void *opaque)
@@ -285,6 +333,31 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
         return -ENOMEM;
     }
 
+    if (migration->mig_flags & VFIO_MIGRATION_PRE_COPY) {
+        int ret;
+
+        migration->precopy_init_size = 0;
+        migration->precopy_dirty_size = 0;
+
+        switch (migration->device_state) {
+        case VFIO_DEVICE_STATE_RUNNING:
+            ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_PRE_COPY,
+                                           VFIO_DEVICE_STATE_RUNNING);
+            if (ret) {
+                return ret;
+            }
+
+            vfio_query_precopy_size(migration);
+
+            break;
+        case VFIO_DEVICE_STATE_STOP:
+            /* vfio_save_complete_precopy() will go to STOP_COPY */
+            break;
+        default:
+            return -EINVAL;
+        }
+    }
+
     trace_vfio_save_setup(vbasedev->name, migration->data_buffer_size);
 
     qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
@@ -303,22 +376,36 @@ static void vfio_save_cleanup(void *opaque)
     trace_vfio_save_cleanup(vbasedev->name);
 }
 
+static void vfio_state_pending_estimate(void *opaque, uint64_t *must_precopy,
+                                        uint64_t *can_postcopy)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+
+    if (migration->device_state != VFIO_DEVICE_STATE_PRE_COPY) {
+        return;
+    }
+
+    *must_precopy +=
+        migration->precopy_init_size + migration->precopy_dirty_size;
+
+    trace_vfio_state_pending_estimate(vbasedev->name, *must_precopy,
+                                      *can_postcopy,
+                                      migration->precopy_init_size,
+                                      migration->precopy_dirty_size);
+}
+
 /*
  * Migration size of VFIO devices can be as little as a few KBs or as big as
  * many GBs. This value should be big enough to cover the worst case.
  */
 #define VFIO_MIG_STOP_COPY_SIZE (100 * GiB)
 
-/*
- * Only exact function is implemented and not estimate function. The reason is
- * that during pre-copy phase of migration the estimate function is called
- * repeatedly while pending RAM size is over the threshold, thus migration
- * can't converge and querying the VFIO device pending data size is useless.
- */
 static void vfio_state_pending_exact(void *opaque, uint64_t *must_precopy,
                                      uint64_t *can_postcopy)
 {
     VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
     uint64_t stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;
 
     /*
@@ -328,8 +415,49 @@ static void vfio_state_pending_exact(void *opaque, uint64_t *must_precopy,
     vfio_query_stop_copy_size(vbasedev, &stop_copy_size);
     *must_precopy += stop_copy_size;
 
+    if (migration->device_state == VFIO_DEVICE_STATE_PRE_COPY) {
+        migration->precopy_init_size = 0;
+        migration->precopy_dirty_size = 0;
+        vfio_query_precopy_size(migration);
+
+        *must_precopy +=
+            migration->precopy_init_size + migration->precopy_dirty_size;
+    }
+
     trace_vfio_state_pending_exact(vbasedev->name, *must_precopy, *can_postcopy,
-                                   stop_copy_size);
+                                   stop_copy_size, migration->precopy_init_size,
+                                   migration->precopy_dirty_size);
+}
+
+static bool vfio_is_active_iterate(void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+
+    return migration->device_state == VFIO_DEVICE_STATE_PRE_COPY;
+}
+
+static int vfio_save_iterate(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+    ssize_t data_size;
+
+    data_size = vfio_save_block(f, migration);
+    if (data_size < 0) {
+        return data_size;
+    }
+    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
+
+    vfio_update_estimated_pending_data(migration, data_size);
+
+    trace_vfio_save_iterate(vbasedev->name);
+
+    /*
+     * A VFIO device's pre-copy dirty_bytes is not guaranteed to reach zero.
+     * Return 1 so following handlers will not be potentially blocked.
+     */
+    return 1;
 }
 
 static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
@@ -338,7 +466,7 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
     ssize_t data_size;
     int ret;
 
-    /* We reach here with device state STOP only */
+    /* We reach here with device state STOP or STOP_COPY only */
     ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP_COPY,
                                    VFIO_DEVICE_STATE_STOP);
     if (ret) {
@@ -457,7 +585,10 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
 static const SaveVMHandlers savevm_vfio_handlers = {
     .save_setup = vfio_save_setup,
     .save_cleanup = vfio_save_cleanup,
+    .state_pending_estimate = vfio_state_pending_estimate,
     .state_pending_exact = vfio_state_pending_exact,
+    .is_active_iterate = vfio_is_active_iterate,
+    .save_live_iterate = vfio_save_iterate,
     .save_live_complete_precopy = vfio_save_complete_precopy,
     .save_state = vfio_save_state,
     .load_setup = vfio_load_setup,
@@ -470,13 +601,18 @@ static const SaveVMHandlers savevm_vfio_handlers = {
 static void vfio_vmstate_change(void *opaque, bool running, RunState state)
 {
     VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
     enum vfio_device_mig_state new_state;
     int ret;
 
     if (running) {
         new_state = VFIO_DEVICE_STATE_RUNNING;
     } else {
-        new_state = VFIO_DEVICE_STATE_STOP;
+        new_state =
+            (migration->device_state == VFIO_DEVICE_STATE_PRE_COPY &&
+             (state == RUN_STATE_FINISH_MIGRATE || state == RUN_STATE_PAUSED)) ?
+                VFIO_DEVICE_STATE_STOP_COPY :
+                VFIO_DEVICE_STATE_STOP;
     }
 
     /*
@@ -603,6 +739,7 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     migration->vbasedev = vbasedev;
     migration->device_state = VFIO_DEVICE_STATE_RUNNING;
     migration->data_fd = -1;
+    migration->mig_flags = mig_flags;
 
     vbasedev->dirty_pages_supported = vfio_dma_logging_supported(vbasedev);
 
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 646e42fd27..fd6893cb43 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -162,6 +162,8 @@ vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
 vfio_save_cleanup(const char *name) " (%s)"
 vfio_save_complete_precopy(const char *name, int ret) " (%s) ret %d"
 vfio_save_device_config_state(const char *name) " (%s)"
+vfio_save_iterate(const char *name) " (%s)"
 vfio_save_setup(const char *name, uint64_t data_buffer_size) " (%s) data buffer size 0x%"PRIx64
-vfio_state_pending_exact(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t stopcopy_size) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" stopcopy size 0x%"PRIx64
+vfio_state_pending_estimate(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t precopy_init_size, uint64_t precopy_dirty_size) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" precopy initial size 0x%"PRIx64" precopy dirty size 0x%"PRIx64
+vfio_state_pending_exact(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t stopcopy_size, uint64_t precopy_init_size, uint64_t precopy_dirty_size) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" stopcopy size 0x%"PRIx64" precopy initial size 0x%"PRIx64" precopy dirty size 0x%"PRIx64
 vfio_vmstate_change(const char *name, int running, const char *reason, const char *dev_state) " (%s) running %d reason %s device state %s"
-- 
2.26.3


