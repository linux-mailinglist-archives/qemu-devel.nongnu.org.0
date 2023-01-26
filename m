Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD6867D4A5
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:51:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL7KE-0004Oo-LB; Thu, 26 Jan 2023 13:50:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7K5-0004NK-5m
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:09 -0500
Received: from mail-dm6nam10on2062c.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::62c]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7K1-0002OL-AN
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xj4WUdXyWSJ6nmjFFmSk0irlU0JGwip5VG5PIldqAAUo7XcxsZM1JX1lwvIkFDVgx7CR8Wkpg5dbzCDNa4sc2My+f/PPk3MNwLsmcWd4ttNwAQJvAyk5sTsrHOPgH6fRvIfFO+r/ExzBRGzNaqWAPUSxdx83aoRYd5uqLHIPtWtEmJ2uMJYQwhMpUp/lbPsTtlH+8CZBxBQgYKm9O+7acY+uLYSGBAsdLlm+jrQFprLT0Fv5YHlYtP6X0qAMU+/wgFfQhgj6jKcOQ+Og7r5AN7c4zzEJtlePZ7gv1vQKItUAUNcvbUukF16hGsod0NrV4PaiFw7jYx2uvRKGkMC/kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/pI6QIyQ/Go4ZOjqy/UhuGjYejwDocw1PpsfkeoGVA=;
 b=UviSQts90HpMwgfZzsEo4bHDNyf3YcDtfhngs4jutHGuzAI8XlTf0xcJqqjNXRYGFJ+ZDtXmuEua8cD1hS6kPQyT5yufMnHW1axuf7P2mNM18Nbw7sNthnaQNG2fbVyDd32xA8zqEmgbkm/6L/aD8S1C+lsaRWUmzhmxQluBsirbk1O/1S043uFDLduANScxxebyYSYFxQKH/0+EAkyCXpoBcIm8hQvtFEzGZqIc4FxteOYJv9z0CoofLuxdiNeoRpEd0KeT8uKn6HB9wgAUrPaUwIEn8qaP75qGeC75+mLoy54wQkD6Xph9yPIGz9F/kJppqh3WRBNB+3HcHB7bLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/pI6QIyQ/Go4ZOjqy/UhuGjYejwDocw1PpsfkeoGVA=;
 b=AUBnZ9S84PSvMLhjd4fQbLv9jIP35J8sdhqVNpj5AnCW6/1VVLKdaGdl43sWUTA5sCEEFNoLePiA/dsY0t/e8xvTKlVzcwBN3p57/U2Va1lztotESmmqXQG52KcRLKUa2y/4EIz17zKqYXaJx2sAq4IVZThuRiOOj59Dn1t1nNnyYtVx4HVNR2srA+nKfaKKSLecBmloK0EbMTZlnrf61OV6bSzmHSFfXD+8WkYWjAKFoVSqA9XguVMlJNMCSv/oiKBVUNF9+XweAMfS6DbL0BckVC6lRq9662alZAu/PNU243DAFgrTODE6q4jcx9PeCVNMVeKmnTCPB8DextERPQ==
Received: from MW4PR04CA0101.namprd04.prod.outlook.com (2603:10b6:303:83::16)
 by SA1PR12MB6726.namprd12.prod.outlook.com (2603:10b6:806:255::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 18:49:59 +0000
Received: from CO1NAM11FT100.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::3d) by MW4PR04CA0101.outlook.office365.com
 (2603:10b6:303:83::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Thu, 26 Jan 2023 18:49:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1NAM11FT100.mail.protection.outlook.com (10.13.175.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Thu, 26 Jan 2023 18:49:59 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 10:49:58 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 26 Jan 2023 10:49:57 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 26 Jan 2023 10:49:53 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Peter Xu <peterx@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "David
 Hildenbrand" <david@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH 01/18] vfio/migration: Add VFIO migration pre-copy support
Date: Thu, 26 Jan 2023 20:49:31 +0200
Message-ID: <20230126184948.10478-2-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230126184948.10478-1-avihaih@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT100:EE_|SA1PR12MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cbcbfa9-d3e1-4572-24ea-08daffce2048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BYIAyJQeYYzsneuvKzUSTI6hGEyEOSOwF2CE+1r9uOjNXH/+ZolE+5j73r6wA25CmHpzEjJWXguKN6+fUudcZX2IXaF6t4ZlfuEXete6AdHi7OkFFinIqnwAs1K1LSWlKmeUkt2mqUCgCbXOBQJVPDKdAL2aw64EODRfkNlB8Wxr5rqt/3KU4jVElAGIP6ab69NxsVmXI5FOVx9cZzX0AbkwHl9LaOeuUt9XXa7324RRUjNY6FYLL3s82ZkhtihEALN6c1o2AER7indrgCCpGTZNnEuv9/p1J9ctMBOMwpNdAfsA2b64LWOMmUEbCUIKJx+hMNgVPyqHXQU5ay96I9TIBFV62uimV1Fxfs2V2fvvpnZ9HpS86VJVcgm3RJNn4DHZDydF+dagpK/nlx/xlhBCi2YkBqz8KIDQsdFd4KSgXJzU8bJQu+GwLA3QdtqeHKOIhfnvRi8lcZILVkOGebea8/wF95UqshCEuM1HTJEK2+Dx+vCqdqS68cfu2IAwSYLTH4ftu3yKi9UvqsyHOghmjy7SvIP02afb4ArUQFZNcRdO4RDEXQ8YLd9LUGAvEO7ejorAWeGC3df5qwcOVd/WPEyW4XDy/8FYWsEd8i06cgT+CnDEN8k7PQN4nLvpg+A/zUq98/K/YBQXb0aUJY7d9PvJTEIkcWhVaNbAkmETJxt4T9IZ22wG/HgbMozr97v6qOyELklCJSqlSl+hevPjbbDbTrKKslKZb+r64+6ZW804OnrOMGGN1mDtECJVZ20if9hodc4Fjxf48aTNU4F0RacovFu29W3BdBo5Bdk=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199018)(36840700001)(46966006)(40470700004)(36860700001)(26005)(356005)(83380400001)(7636003)(5660300002)(82740400003)(7416002)(7696005)(30864003)(41300700001)(2906002)(86362001)(82310400005)(8936002)(4326008)(40480700001)(40460700003)(6666004)(316002)(186003)(336012)(8676002)(47076005)(2616005)(478600001)(54906003)(6916009)(70586007)(36756003)(966005)(426003)(1076003)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 18:49:59.5197 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cbcbfa9-d3e1-4572-24ea-08daffce2048
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT100.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6726
Received-SPF: softfail client-ip=2a01:111:f400:7e88::62c;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
 docs/devel/vfio-migration.rst |  29 ++++++---
 include/hw/vfio/vfio-common.h |   3 +
 hw/vfio/common.c              |   8 ++-
 hw/vfio/migration.c           | 112 ++++++++++++++++++++++++++++++++--
 hw/vfio/trace-events          |   5 +-
 5 files changed, 140 insertions(+), 17 deletions(-)

diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
index 1d50c2fe5f..51f5e1a537 100644
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
+helps to reduce the total downtime of the VM. VFIO devices can choose to skip
+the pre-copy phase of migration by not reporting the VFIO_MIGRATION_PRE_COPY
+flag in VFIO_DEVICE_FEATURE_MIGRATION ioctl.
 
 A detailed description of the UAPI for VFIO device migration can be found in
 the comment for the ``vfio_device_mig_state`` structure in the header file
@@ -29,6 +31,12 @@ VFIO implements the device hooks for the iterative approach as follows:
   driver, which indicates the amount of data that the vendor driver has yet to
   save for the VFIO device.
 
+* An ``is_active_iterate`` function that indicates ``save_live_iterate`` is
+  active only if the VFIO device is in pre-copy states.
+
+* A ``save_live_iterate`` function that reads the VFIO device's data from the
+  vendor driver during iterative phase.
+
 * A ``save_state`` function to save the device config space if it is present.
 
 * A ``save_live_complete_precopy`` function that sets the VFIO device in
@@ -91,8 +99,10 @@ Flow of state changes during Live migration
 ===========================================
 
 Below is the flow of state change during live migration.
-The values in the brackets represent the VM state, the migration state, and
+The values in the parentheses represent the VM state, the migration state, and
 the VFIO device state, respectively.
+The text in the square brackets represents the flow if the VFIO device supports
+pre-copy.
 
 Live migration save path
 ------------------------
@@ -104,11 +114,12 @@ Live migration save path
                                   |
                      migrate_init spawns migration_thread
                 Migration thread then calls each device's .save_setup()
-                       (RUNNING, _SETUP, _RUNNING)
+                  (RUNNING, _SETUP, _RUNNING [_PRE_COPY])
                                   |
-                      (RUNNING, _ACTIVE, _RUNNING)
+                  (RUNNING, _ACTIVE, _RUNNING [_PRE_COPY])
              If device is active, get pending_bytes by .save_live_pending()
           If total pending_bytes >= threshold_size, call .save_live_iterate()
+                  [Data of VFIO device for pre-copy phase is copied]
         Iterate till total pending bytes converge and are less than threshold
                                   |
   On migration completion, vCPU stops and calls .save_live_complete_precopy for
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 5f8e7a02fe..88c2194fb9 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -67,7 +67,10 @@ typedef struct VFIOMigration {
     int data_fd;
     void *data_buffer;
     size_t data_buffer_size;
+    uint64_t mig_flags;
     uint64_t stop_copy_size;
+    uint64_t precopy_init_size;
+    uint64_t precopy_dirty_size;
 } VFIOMigration;
 
 typedef struct VFIOAddressSpace {
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 9a0dbee6b4..93b18c5e3d 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -357,7 +357,9 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
 
             if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
                 (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
-                 migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P)) {
+                 migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P ||
+                 migration->device_state == VFIO_DEVICE_STATE_PRE_COPY ||
+                 migration->device_state == VFIO_DEVICE_STATE_PRE_COPY_P2P)) {
                 return false;
             }
         }
@@ -387,7 +389,9 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
             }
 
             if (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
-                migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P) {
+                migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P ||
+                migration->device_state == VFIO_DEVICE_STATE_PRE_COPY ||
+                migration->device_state == VFIO_DEVICE_STATE_PRE_COPY_P2P) {
                 continue;
             } else {
                 return false;
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 760f667e04..2a0a663023 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -69,6 +69,10 @@ static const char *mig_state_to_str(enum vfio_device_mig_state state)
         return "RESUMING";
     case VFIO_DEVICE_STATE_RUNNING_P2P:
         return "RUNNING_P2P";
+    case VFIO_DEVICE_STATE_PRE_COPY:
+        return "PRE_COPY";
+    case VFIO_DEVICE_STATE_PRE_COPY_P2P:
+        return "PRE_COPY_P2P";
     default:
         return "UNKNOWN STATE";
     }
@@ -237,6 +241,11 @@ static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
     data_size = read(migration->data_fd, migration->data_buffer,
                      migration->data_buffer_size);
     if (data_size < 0) {
+        /* Pre-copy emptied all the device state for now */
+        if (errno == ENOMSG) {
+            return 1;
+        }
+
         return -errno;
     }
     if (data_size == 0) {
@@ -260,6 +269,7 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
     uint64_t stop_copy_size = VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE;
+    int ret;
 
     qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
 
@@ -273,6 +283,23 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
         return -ENOMEM;
     }
 
+    if (migration->mig_flags & VFIO_MIGRATION_PRE_COPY) {
+        switch (migration->device_state) {
+        case VFIO_DEVICE_STATE_RUNNING:
+            ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_PRE_COPY,
+                                           VFIO_DEVICE_STATE_RUNNING);
+            if (ret) {
+                return ret;
+            }
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
@@ -287,6 +314,12 @@ static void vfio_save_cleanup(void *opaque)
 
     g_free(migration->data_buffer);
     migration->data_buffer = NULL;
+
+    if (migration->mig_flags & VFIO_MIGRATION_PRE_COPY) {
+        migration->precopy_init_size = 0;
+        migration->precopy_dirty_size = 0;
+    }
+
     vfio_migration_cleanup(vbasedev);
     trace_vfio_save_cleanup(vbasedev->name);
 }
@@ -301,9 +334,55 @@ static void vfio_save_pending(void *opaque, uint64_t threshold_size,
 
     *res_precopy_only += migration->stop_copy_size;
 
+    if (migration->device_state == VFIO_DEVICE_STATE_PRE_COPY ||
+        migration->device_state == VFIO_DEVICE_STATE_PRE_COPY_P2P) {
+        if (migration->precopy_init_size) {
+            /*
+             * Initial size should be transferred during pre-copy phase so
+             * stop-copy phase will not be slowed down. Report threshold_size
+             * to force another pre-copy iteration.
+             */
+            *res_precopy_only += threshold_size;
+        } else {
+            *res_precopy_only += migration->precopy_dirty_size;
+        }
+    }
+
     trace_vfio_save_pending(vbasedev->name, *res_precopy_only,
                             *res_postcopy_only, *res_compatible,
-                            migration->stop_copy_size);
+                            migration->stop_copy_size,
+                            migration->precopy_init_size,
+                            migration->precopy_dirty_size);
+}
+
+static bool vfio_is_active_iterate(void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+
+    return migration->device_state == VFIO_DEVICE_STATE_PRE_COPY ||
+           migration->device_state == VFIO_DEVICE_STATE_PRE_COPY_P2P;
+}
+
+static int vfio_save_iterate(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+    int ret;
+
+    ret = vfio_save_block(f, migration);
+    if (ret < 0) {
+        return ret;
+    }
+    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
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
@@ -312,7 +391,7 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
     enum vfio_device_mig_state recover_state;
     int ret;
 
-    /* We reach here with device state STOP only */
+    /* We reach here with device state STOP or STOP_COPY only */
     recover_state = VFIO_DEVICE_STATE_STOP;
     ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP_COPY,
                                    recover_state);
@@ -430,6 +509,8 @@ static const SaveVMHandlers savevm_vfio_handlers = {
     .save_setup = vfio_save_setup,
     .save_cleanup = vfio_save_cleanup,
     .save_live_pending = vfio_save_pending,
+    .is_active_iterate = vfio_is_active_iterate,
+    .save_live_iterate = vfio_save_iterate,
     .save_live_complete_precopy = vfio_save_complete_precopy,
     .save_state = vfio_save_state,
     .load_setup = vfio_load_setup,
@@ -442,13 +523,19 @@ static const SaveVMHandlers savevm_vfio_handlers = {
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
+            ((migration->device_state == VFIO_DEVICE_STATE_PRE_COPY ||
+              migration->device_state == VFIO_DEVICE_STATE_PRE_COPY_P2P) &&
+             (state == RUN_STATE_FINISH_MIGRATE || state == RUN_STATE_PAUSED)) ?
+                VFIO_DEVICE_STATE_STOP_COPY :
+                VFIO_DEVICE_STATE_STOP;
     }
 
     ret = vfio_migration_set_state(vbasedev, new_state,
@@ -496,6 +583,9 @@ static int vfio_migration_data_notifier(NotifierWithReturn *n, void *data)
 {
     VFIOMigration *migration = container_of(n, VFIOMigration, migration_data);
     VFIODevice *vbasedev = migration->vbasedev;
+    struct vfio_precopy_info precopy = {
+        .argsz = sizeof(precopy),
+    };
     PrecopyNotifyData *pnd = data;
 
     if (pnd->reason != PRECOPY_NOTIFY_AFTER_BITMAP_SYNC) {
@@ -515,8 +605,21 @@ static int vfio_migration_data_notifier(NotifierWithReturn *n, void *data)
         migration->stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;
     }
 
+    if ((migration->device_state == VFIO_DEVICE_STATE_PRE_COPY ||
+         migration->device_state == VFIO_DEVICE_STATE_PRE_COPY_P2P)) {
+        if (ioctl(migration->data_fd, VFIO_MIG_GET_PRECOPY_INFO, &precopy)) {
+            migration->precopy_init_size = 0;
+            migration->precopy_dirty_size = 0;
+        } else {
+            migration->precopy_init_size = precopy.initial_bytes;
+            migration->precopy_dirty_size = precopy.dirty_bytes;
+        }
+    }
+
     trace_vfio_migration_data_notifier(vbasedev->name,
-                                       migration->stop_copy_size);
+                                       migration->stop_copy_size,
+                                       migration->precopy_init_size,
+                                       migration->precopy_dirty_size);
 
     return 0;
 }
@@ -588,6 +691,7 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     migration->vbasedev = vbasedev;
     migration->device_state = VFIO_DEVICE_STATE_RUNNING;
     migration->data_fd = -1;
+    migration->mig_flags = mig_flags;
 
     oid = vmstate_if_get_id(VMSTATE_IF(DEVICE(obj)));
     if (oid) {
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index db9cb94952..37724579e3 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -154,7 +154,7 @@ vfio_load_cleanup(const char *name) " (%s)"
 vfio_load_device_config_state(const char *name) " (%s)"
 vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
 vfio_load_state_device_data(const char *name, uint64_t data_size, int ret) " (%s) size 0x%"PRIx64" ret %d"
-vfio_migration_data_notifier(const char *name, uint64_t stopcopy_size) " (%s) stopcopy size 0x%"PRIx64
+vfio_migration_data_notifier(const char *name, uint64_t stopcopy_size, uint64_t precopy_init_size, uint64_t precopy_dirty_size) " (%s) stopcopy size 0x%"PRIx64" precopy initial size 0x%"PRIx64" precopy dirty size 0x%"PRIx64
 vfio_migration_probe(const char *name) " (%s)"
 vfio_migration_set_state(const char *name, const char *state) " (%s) state %s"
 vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
@@ -162,6 +162,7 @@ vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
 vfio_save_cleanup(const char *name) " (%s)"
 vfio_save_complete_precopy(const char *name, int ret) " (%s) ret %d"
 vfio_save_device_config_state(const char *name) " (%s)"
-vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible, uint64_t stopcopy_size) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64" stopcopy size 0x%"PRIx64
+vfio_save_iterate(const char *name) " (%s)"
+vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible, uint64_t stopcopy_size, uint64_t precopy_init_size, uint64_t precopy_dirty_size) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64" stopcopy size 0x%"PRIx64" precopy initial size 0x%"PRIx64" precopy dirty size 0x%"PRIx64
 vfio_save_setup(const char *name, uint64_t data_buffer_size) " (%s) data buffer size 0x%"PRIx64
 vfio_vmstate_change(const char *name, int running, const char *reason, const char *dev_state) " (%s) running %d reason %s device state %s"
-- 
2.26.3


