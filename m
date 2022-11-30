Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4927C63D25B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 10:47:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0JfF-00040G-VP; Wed, 30 Nov 2022 04:46:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1p0Jf4-0003tV-Bh; Wed, 30 Nov 2022 04:45:50 -0500
Received: from mail-bn7nam10on2062d.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::62d]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1p0Jf0-0003Ai-1m; Wed, 30 Nov 2022 04:45:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBVt9Nt8QOVD43a/wdgvhQLlQZ+qf7UzxCKQNx1IOxDi+qFzihec9b+jFEFa55iMUH2Q1onwherSHbLbKevhdS2wJBZm+Qnxw0bbzFCBhUo24KLjRIZ3SOe/s3FrkApb6tJixCCBIBCO487svgdxBMZZLfyoz70WPYfm5sSP17X8bECxuHCf5ASEc0Yd8L1NZTYo+2OMhfDZ2TJ1WT7ueOuWENwcSsNiruRXMdBNL2Xv1PCe0Zq+vIAsvQS5t36hbCX1Hd+RLKa6kksYnlh7A98dWfvqYDpu5hQWZ2FP8su9Gj65d21BEZtjr61Iveh/+wFJqatEOqU2NhYQQ5UdQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tzk9kw7zgMpB8Xm1H4baMc1XwSNOcVylsvgci7kPNHo=;
 b=ESJ5XIH9naU3Q6Smdv7u8by6YDjIyhoweLM9we+2WWNwYCReISaJl6eLFmkRHGQuFaO8AvllDY0/8zJsSz7RWev4coxP1biAw8ZaONzNGF33cRq1SQvnMnSqiWi+CCCKemI9TzprbFsYUVfyf7+m9MvVqUvwNFu2uDbY5uBb9SgKUhiXRX5FwROI3G1Qabw1diioF9MM++euYnGorCBvKlcSsKkEIJkWCfsA0Uec+cUiYIr/ODzvm75n3heBgfzeayTg/xJHkM36AjcexUft3FCkjKE/UxpuYA3nQooL81dlr2SEQGTDFzLHbL5ejTjzD1LpiswfbZcpTdoj+lcnuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tzk9kw7zgMpB8Xm1H4baMc1XwSNOcVylsvgci7kPNHo=;
 b=O7a5gqNukxcjjYym4euoDLcplwRZIEdsjBGP53yuVCSPL+eg+Vg3nK8XW2Gua9I/1vUIy+lz2dxLKKoVGSGEKmyV9W8olGVuUZiw12aC1jxeyiYz5XC9bLlkzoikRNIRewECYI5CQE3pGOMgYTMRvj12nPxiq7cSY7IwTy9pMAOrJpO8vPCdwELgByTegKQF5Nfy0MOrBiJTBwjQ1bR1Ux55cYImw38TfMIXJH7gaEUgqCBJpJuQf7pEErroxGy0ZDFSBpbFDmFC1LYr9m1AveieToqDsr0+MpoD5K5+nxP93dwtvrnP2cfBoxAVXilnaXw5Mv6QltDpLL+fZI/3AQ==
Received: from MW4PR03CA0152.namprd03.prod.outlook.com (2603:10b6:303:8d::7)
 by DM4PR12MB5793.namprd12.prod.outlook.com (2603:10b6:8:60::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 09:45:41 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8d:cafe::ca) by MW4PR03CA0152.outlook.office365.com
 (2603:10b6:303:8d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Wed, 30 Nov 2022 09:45:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.21 via Frontend Transport; Wed, 30 Nov 2022 09:45:41 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 01:45:29 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 01:45:28 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 30 Nov
 2022 01:45:21 -0800
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
Subject: [PATCH v4 09/14] vfio/migration: Implement VFIO migration protocol v2
Date: Wed, 30 Nov 2022 11:44:09 +0200
Message-ID: <20221130094414.27247-10-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221130094414.27247-1-avihaih@nvidia.com>
References: <20221130094414.27247-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT048:EE_|DM4PR12MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb7e997-de2d-4fa6-c464-08dad2b7a523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YJVS2FTXP8YPTzaih13YjlBP38LG7rXXQnyS6pLRJQoAikgHPiZFanGbbUzscObFQ6q4UPUeDNFKWHrPvST5xkX7yn3WVmB3KPrXBteRZbd3Y/jDFs4dgQ6qSHjOkJOjs+mjRy4qxHr9Tk4OsrYKoA77PusQqI5MOosA50kQ/5FEh7TFRkK59JgmhwHe6EPlkkt9OrW9TCg8Ecz5nuD/ESTxv566C38LVQqMnT5/twEaKHImIHukjToT3Eag2C/vRt6j7aiceDCyNAj1PJcAKyxcjFojCvWGRT7IK97n8iirDP4xmgFPnFiGhkE8ih1gKg2I0ji/v+1HUNwxivjoMOYU61edx60SymShRtd/3A7stZpela7bno7mXOo3AwxsA2NTJXvYxryZf5XceuZtlyC4AgxYnjyT10+d/7Gh+tcEpM9qCntTU+3Pdw9wZ4tWiPtidKXUMnjk3vb2eWGcMfGfjH4c2DeuNr92xZyBRmkLEV+qbqA9264kSm8CgvNT80FIDY06nA5b+Rgke23R5AdkdbVegNcTYJ2QsejdntjGsq+6vLluX6JqilgRYL8kWBBeKSb1WP0a03CkZ/jOWGTFi7/E+mg/vkUiBNok/fqcatImkHJCUPnkfQp5i+wm3jmEcGCfsuj6pK8auC4LNd8MfYlL2gM9ufZs/h6YxWrIhnRCSHZY3FvPRwfUrckOf5lcE8vT8kZj3vRWO1VdkH4XaR/E+wIJeAxoFGf0zL+MOyhhzplbjS4ikOR0hlz1evZOasfucJ92hFWv3H9u5pK9Y427cqLX+iA/N9QyDXM=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199015)(46966006)(40470700004)(36840700001)(2906002)(36756003)(30864003)(82310400005)(41300700001)(36860700001)(86362001)(70206006)(7416002)(8936002)(70586007)(5660300002)(8676002)(40460700003)(40480700001)(966005)(7636003)(316002)(82740400003)(356005)(4326008)(6916009)(478600001)(26005)(6666004)(7696005)(83380400001)(2616005)(426003)(336012)(47076005)(1076003)(54906003)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 09:45:41.6841 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb7e997-de2d-4fa6-c464-08dad2b7a523
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5793
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::62d;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

Add implementation of VFIO migration protocol v2. The two protocols, v1
and v2, will co-exist and in next patch v1 protocol will be removed.

There are several main differences between v1 and v2 protocols:
- VFIO device state is now represented as a finite state machine instead
  of a bitmap.

- Migration interface with kernel is now done using VFIO_DEVICE_FEATURE
  ioctl and normal read() and write() instead of the migration region.

- VFIO migration protocol v2 currently doesn't support the pre-copy
  phase of migration.

Detailed information about VFIO migration protocol v2 and difference
compared to v1 can be found here [1].

[1]
https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c              |  19 +-
 hw/vfio/migration.c           | 420 +++++++++++++++++++++++++++++++---
 hw/vfio/trace-events          |   6 +
 include/hw/vfio/vfio-common.h |   5 +
 4 files changed, 411 insertions(+), 39 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6f0157c848..70dff8ea42 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -355,10 +355,18 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
                 return false;
             }
 
-            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
+            if (!migration->v2 &&
+                (vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
                 (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING)) {
                 return false;
             }
+
+            if (migration->v2 &&
+                (vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
+                (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
+                 migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P)) {
+                return false;
+            }
         }
     }
     return true;
@@ -385,7 +393,14 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
                 return false;
             }
 
-            if (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
+            if (!migration->v2 &&
+                migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
+                continue;
+            }
+
+            if (migration->v2 &&
+                (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
+                 migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P)) {
                 continue;
             } else {
                 return false;
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index e59b463b6c..152690c90d 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -10,6 +10,7 @@
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 #include "qemu/cutils.h"
+#include "qemu/units.h"
 #include <linux/vfio.h>
 #include <sys/ioctl.h>
 
@@ -44,8 +45,103 @@
 #define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
 #define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
 
+/*
+ * This is an arbitrary size based on migration of mlx5 devices, where typically
+ * total device migration size is on the order of 100s of MB. Testing with
+ * larger values, e.g. 128MB and 1GB, did not show a performance improvement.
+ */
+#define VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE (1 * MiB)
+
 static int64_t bytes_transferred;
 
+static const char *mig_state_to_str(enum vfio_device_mig_state state)
+{
+    switch (state) {
+    case VFIO_DEVICE_STATE_ERROR:
+        return "ERROR";
+    case VFIO_DEVICE_STATE_STOP:
+        return "STOP";
+    case VFIO_DEVICE_STATE_RUNNING:
+        return "RUNNING";
+    case VFIO_DEVICE_STATE_STOP_COPY:
+        return "STOP_COPY";
+    case VFIO_DEVICE_STATE_RESUMING:
+        return "RESUMING";
+    case VFIO_DEVICE_STATE_RUNNING_P2P:
+        return "RUNNING_P2P";
+    default:
+        return "UNKNOWN STATE";
+    }
+}
+
+static int vfio_migration_set_state(VFIODevice *vbasedev,
+                                    enum vfio_device_mig_state new_state,
+                                    enum vfio_device_mig_state recover_state)
+{
+    VFIOMigration *migration = vbasedev->migration;
+    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
+                              sizeof(struct vfio_device_feature_mig_state),
+                              sizeof(uint64_t))] = {};
+    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
+    struct vfio_device_feature_mig_state *mig_state =
+        (struct vfio_device_feature_mig_state *)feature->data;
+
+    feature->argsz = sizeof(buf);
+    feature->flags =
+        VFIO_DEVICE_FEATURE_SET | VFIO_DEVICE_FEATURE_MIG_DEVICE_STATE;
+    mig_state->device_state = new_state;
+    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
+        /* Try to set the device in some good state */
+        int err = -errno;
+
+        error_report(
+            "%s: Failed setting device state to %s, err: %s. Setting device in recover state %s",
+                     vbasedev->name, mig_state_to_str(new_state),
+                     strerror(errno), mig_state_to_str(recover_state));
+
+        mig_state->device_state = recover_state;
+        if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
+            err = -errno;
+            error_report(
+                "%s: Failed setting device in recover state, err: %s. Resetting device",
+                         vbasedev->name, strerror(errno));
+
+            if (ioctl(vbasedev->fd, VFIO_DEVICE_RESET)) {
+                hw_error("%s: Failed resetting device, err: %s", vbasedev->name,
+                         strerror(errno));
+            }
+
+            migration->device_state = VFIO_DEVICE_STATE_RUNNING;
+
+            return err;
+        }
+
+        migration->device_state = recover_state;
+
+        return err;
+    }
+
+    migration->device_state = new_state;
+    if (mig_state->data_fd != -1) {
+        if (migration->data_fd != -1) {
+            /*
+             * This can happen if the device is asynchronously reset and
+             * terminates a data transfer.
+             */
+            error_report("%s: data_fd out of sync", vbasedev->name);
+            close(mig_state->data_fd);
+
+            return -EBADF;
+        }
+
+        migration->data_fd = mig_state->data_fd;
+    }
+
+    trace_vfio_migration_set_state(vbasedev->name, mig_state_to_str(new_state));
+
+    return 0;
+}
+
 static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
                                   off_t off, bool iswrite)
 {
@@ -260,6 +356,18 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
     return ret;
 }
 
+static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
+                            uint64_t data_size)
+{
+    VFIOMigration *migration = vbasedev->migration;
+    int ret;
+
+    ret = qemu_file_get_to_fd(f, migration->data_fd, data_size);
+    trace_vfio_load_state_device_data(vbasedev->name, data_size, ret);
+
+    return ret;
+}
+
 static int vfio_v1_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
                                uint64_t data_size)
 {
@@ -394,6 +502,14 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
     return qemu_file_get_error(f);
 }
 
+static void vfio_migration_cleanup(VFIODevice *vbasedev)
+{
+    VFIOMigration *migration = vbasedev->migration;
+
+    close(migration->data_fd);
+    migration->data_fd = -1;
+}
+
 static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
@@ -405,6 +521,27 @@ static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
 
 /* ---------------------------------------------------------------------- */
 
+static int vfio_save_setup(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+
+    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
+
+    migration->data_buffer = g_try_malloc0(migration->data_buffer_size);
+    if (!migration->data_buffer) {
+        error_report("%s: Failed to allocate migration data buffer",
+                     vbasedev->name);
+        return -ENOMEM;
+    }
+
+    trace_vfio_save_setup(vbasedev->name);
+
+    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
+
+    return qemu_file_get_error(f);
+}
+
 static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -448,6 +585,17 @@ static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
     return 0;
 }
 
+static void vfio_save_cleanup(void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+
+    g_free(migration->data_buffer);
+    migration->data_buffer = NULL;
+    vfio_migration_cleanup(vbasedev);
+    trace_vfio_save_cleanup(vbasedev->name);
+}
+
 static void vfio_v1_save_cleanup(void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -456,6 +604,31 @@ static void vfio_v1_save_cleanup(void *opaque)
     trace_vfio_save_cleanup(vbasedev->name);
 }
 
+/*
+ * Migration size of VFIO devices can be as little as a few KBs or as big as
+ * many GBs. This value should be big enough to cover the worst case.
+ */
+#define VFIO_MIG_STOP_COPY_SIZE (100 * GiB)
+static void vfio_save_pending(void *opaque, uint64_t threshold_size,
+                              uint64_t *res_precopy_only,
+                              uint64_t *res_compatible,
+                              uint64_t *res_postcopy_only)
+{
+    VFIODevice *vbasedev = opaque;
+
+    /*
+     * VFIO migration protocol v2 currently doesn't have an API to get pending
+     * migration size. Until such an API is introduced, report big pending size
+     * so the device migration size will be taken into account and downtime
+     * limit won't be violated.
+     */
+    *res_precopy_only += VFIO_MIG_STOP_COPY_SIZE;
+
+    trace_vfio_save_pending(vbasedev->name, *res_precopy_only,
+                            *res_postcopy_only, *res_compatible,
+                            VFIO_MIG_STOP_COPY_SIZE);
+}
+
 static void vfio_v1_save_pending(void *opaque, uint64_t threshold_size,
                                  uint64_t *res_precopy_only,
                                  uint64_t *res_compatible,
@@ -523,6 +696,65 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
     return 0;
 }
 
+/* Returns 1 if end-of-stream is reached, 0 if more data and -1 if error */
+static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
+{
+    ssize_t data_size;
+
+    data_size = read(migration->data_fd, migration->data_buffer,
+                     migration->data_buffer_size);
+    if (data_size < 0) {
+        return -errno;
+    }
+    if (data_size == 0) {
+        return 1;
+    }
+
+    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
+    qemu_put_be64(f, data_size);
+    qemu_put_buffer(f, migration->data_buffer, data_size);
+    bytes_transferred += data_size;
+
+    trace_vfio_save_block(migration->vbasedev->name, data_size);
+
+    return qemu_file_get_error(f);
+}
+
+static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    enum vfio_device_mig_state recover_state;
+    int ret;
+
+    /* We reach here with device state STOP only */
+    recover_state = VFIO_DEVICE_STATE_STOP;
+    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP_COPY,
+                                   recover_state);
+    if (ret) {
+        return ret;
+    }
+
+    do {
+        ret = vfio_save_block(f, vbasedev->migration);
+        if (ret < 0) {
+            return ret;
+        }
+    } while (!ret);
+
+    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
+    ret = qemu_file_get_error(f);
+    if (ret) {
+        return ret;
+    }
+
+    recover_state = VFIO_DEVICE_STATE_ERROR;
+    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP,
+                                   recover_state);
+    trace_vfio_save_complete_precopy(vbasedev->name, ret);
+
+    return ret;
+}
+
 static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -592,6 +824,14 @@ static void vfio_save_state(QEMUFile *f, void *opaque)
     }
 }
 
+static int vfio_load_setup(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+
+    return vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RESUMING,
+                                   vbasedev->migration->device_state);
+}
+
 static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -619,6 +859,16 @@ static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
     return ret;
 }
 
+static int vfio_load_cleanup(void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+
+    vfio_migration_cleanup(vbasedev);
+    trace_vfio_load_cleanup(vbasedev->name);
+
+    return 0;
+}
+
 static int vfio_v1_load_cleanup(void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -661,7 +911,11 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
             uint64_t data_size = qemu_get_be64(f);
 
             if (data_size) {
-                ret = vfio_v1_load_buffer(f, vbasedev, data_size);
+                if (vbasedev->migration->v2) {
+                    ret = vfio_load_buffer(f, vbasedev, data_size);
+                } else {
+                    ret = vfio_v1_load_buffer(f, vbasedev, data_size);
+                }
                 if (ret < 0) {
                     return ret;
                 }
@@ -682,6 +936,17 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
     return ret;
 }
 
+static const SaveVMHandlers savevm_vfio_handlers = {
+    .save_setup = vfio_save_setup,
+    .save_cleanup = vfio_save_cleanup,
+    .save_live_pending = vfio_save_pending,
+    .save_live_complete_precopy = vfio_save_complete_precopy,
+    .save_state = vfio_save_state,
+    .load_setup = vfio_load_setup,
+    .load_cleanup = vfio_load_cleanup,
+    .load_state = vfio_load_state,
+};
+
 static SaveVMHandlers savevm_vfio_v1_handlers = {
     .save_setup = vfio_v1_save_setup,
     .save_cleanup = vfio_v1_save_cleanup,
@@ -696,6 +961,34 @@ static SaveVMHandlers savevm_vfio_v1_handlers = {
 
 /* ---------------------------------------------------------------------- */
 
+static void vfio_vmstate_change(void *opaque, bool running, RunState state)
+{
+    VFIODevice *vbasedev = opaque;
+    enum vfio_device_mig_state new_state;
+    int ret;
+
+    if (running) {
+        new_state = VFIO_DEVICE_STATE_RUNNING;
+    } else {
+        new_state = VFIO_DEVICE_STATE_STOP;
+    }
+
+    ret = vfio_migration_set_state(vbasedev, new_state,
+                                   VFIO_DEVICE_STATE_ERROR);
+    if (ret) {
+        /*
+         * Migration should be aborted in this case, but vm_state_notify()
+         * currently does not support reporting failures.
+         */
+        if (migrate_get_current()->to_dst_file) {
+            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
+        }
+    }
+
+    trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
+                              mig_state_to_str(new_state));
+}
+
 static void vfio_v1_vmstate_change(void *opaque, bool running, RunState state)
 {
     VFIODevice *vbasedev = opaque;
@@ -769,12 +1062,17 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
     case MIGRATION_STATUS_CANCELLED:
     case MIGRATION_STATUS_FAILED:
         bytes_transferred = 0;
-        ret = vfio_migration_v1_set_state(vbasedev,
-                                          ~(VFIO_DEVICE_STATE_V1_SAVING |
-                                            VFIO_DEVICE_STATE_V1_RESUMING),
-                                          VFIO_DEVICE_STATE_V1_RUNNING);
-        if (ret) {
-            error_report("%s: Failed to set state RUNNING", vbasedev->name);
+        if (migration->v2) {
+            vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
+                                     VFIO_DEVICE_STATE_ERROR);
+        } else {
+            ret = vfio_migration_v1_set_state(vbasedev,
+                                              ~(VFIO_DEVICE_STATE_V1_SAVING |
+                                                VFIO_DEVICE_STATE_V1_RESUMING),
+                                              VFIO_DEVICE_STATE_V1_RUNNING);
+            if (ret) {
+                error_report("%s: Failed to set state RUNNING", vbasedev->name);
+            }
         }
     }
 }
@@ -783,12 +1081,34 @@ static void vfio_migration_exit(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
 
-    vfio_region_exit(&migration->region);
-    vfio_region_finalize(&migration->region);
+    if (!migration->v2) {
+        vfio_region_exit(&migration->region);
+        vfio_region_finalize(&migration->region);
+    }
     g_free(vbasedev->migration);
     vbasedev->migration = NULL;
 }
 
+static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t *mig_flags)
+{
+    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
+                                  sizeof(struct vfio_device_feature_migration),
+                              sizeof(uint64_t))] = {};
+    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
+    struct vfio_device_feature_migration *mig =
+        (struct vfio_device_feature_migration *)feature->data;
+
+    feature->argsz = sizeof(buf);
+    feature->flags = VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIGRATION;
+    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
+        return -EOPNOTSUPP;
+    }
+
+    *mig_flags = mig->flags;
+
+    return 0;
+}
+
 static int vfio_migration_init(VFIODevice *vbasedev)
 {
     int ret;
@@ -797,6 +1117,7 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     char id[256] = "";
     g_autofree char *path = NULL, *oid = NULL;
     struct vfio_region_info *info;
+    uint64_t mig_flags;
 
     if (!vbasedev->ops->vfio_get_object) {
         return -EINVAL;
@@ -807,34 +1128,50 @@ static int vfio_migration_init(VFIODevice *vbasedev)
         return -EINVAL;
     }
 
-    ret = vfio_get_dev_region_info(vbasedev,
-                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
-                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
-                                   &info);
-    if (ret) {
-        return ret;
-    }
+    ret = vfio_migration_query_flags(vbasedev, &mig_flags);
+    if (!ret) {
+        /* Migration v2 */
+        /* Basic migration functionality must be supported */
+        if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
+            return -EOPNOTSUPP;
+        }
+        vbasedev->migration = g_new0(VFIOMigration, 1);
+        vbasedev->migration->device_state = VFIO_DEVICE_STATE_RUNNING;
+        vbasedev->migration->data_buffer_size =
+            VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE;
+        vbasedev->migration->data_fd = -1;
+        vbasedev->migration->v2 = true;
+    } else {
+        /* Migration v1 */
+        ret = vfio_get_dev_region_info(vbasedev,
+                                       VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
+                                       VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
+                                       &info);
+        if (ret) {
+            return ret;
+        }
 
-    vbasedev->migration = g_new0(VFIOMigration, 1);
-    vbasedev->migration->device_state_v1 = VFIO_DEVICE_STATE_V1_RUNNING;
-    vbasedev->migration->vm_running = runstate_is_running();
+        vbasedev->migration = g_new0(VFIOMigration, 1);
+        vbasedev->migration->device_state_v1 = VFIO_DEVICE_STATE_V1_RUNNING;
+        vbasedev->migration->vm_running = runstate_is_running();
 
-    ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
-                            info->index, "migration");
-    if (ret) {
-        error_report("%s: Failed to setup VFIO migration region %d: %s",
-                     vbasedev->name, info->index, strerror(-ret));
-        goto err;
-    }
+        ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
+                                info->index, "migration");
+        if (ret) {
+            error_report("%s: Failed to setup VFIO migration region %d: %s",
+                         vbasedev->name, info->index, strerror(-ret));
+            goto err;
+        }
 
-    if (!vbasedev->migration->region.size) {
-        error_report("%s: Invalid zero-sized VFIO migration region %d",
-                     vbasedev->name, info->index);
-        ret = -EINVAL;
-        goto err;
-    }
+        if (!vbasedev->migration->region.size) {
+            error_report("%s: Invalid zero-sized VFIO migration region %d",
+                         vbasedev->name, info->index);
+            ret = -EINVAL;
+            goto err;
+        }
 
-    g_free(info);
+        g_free(info);
+    }
 
     migration = vbasedev->migration;
     migration->vbasedev = vbasedev;
@@ -847,11 +1184,20 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     }
     strpadcpy(id, sizeof(id), path, '\0');
 
-    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
-                         &savevm_vfio_v1_handlers, vbasedev);
+    if (migration->v2) {
+        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
+                             &savevm_vfio_handlers, vbasedev);
+
+        migration->vm_state = qdev_add_vm_change_state_handler(
+            vbasedev->dev, vfio_vmstate_change, vbasedev);
+    } else {
+        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
+                             &savevm_vfio_v1_handlers, vbasedev);
+
+        migration->vm_state = qdev_add_vm_change_state_handler(
+            vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
+    }
 
-    migration->vm_state = qdev_add_vm_change_state_handler(
-        vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
     migration->migration_state.notify = vfio_migration_state_notifier;
     add_migration_state_change_notifier(&migration->migration_state);
     return 0;
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 664f679e0d..71536caacb 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -149,7 +149,9 @@ vfio_display_edid_write_error(void) ""
 
 # migration.c
 vfio_migration_probe(const char *name) " (%s)"
+vfio_migration_set_state(const char *name, const char *state) " (%s) state %s"
 vfio_migration_v1_set_state(const char *name, uint32_t state) " (%s) state %d"
+vfio_vmstate_change(const char *name, int running, const char *reason, const char *dev_state) " (%s) running %d reason %s device state %s"
 vfio_v1_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
 vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
 vfio_save_setup(const char *name) " (%s)"
@@ -157,12 +159,16 @@ vfio_save_cleanup(const char *name) " (%s)"
 vfio_save_buffer(const char *name, uint64_t data_offset, uint64_t data_size, uint64_t pending) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64" pending 0x%"PRIx64
 vfio_update_pending(const char *name, uint64_t pending) " (%s) pending 0x%"PRIx64
 vfio_save_device_config_state(const char *name) " (%s)"
+vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible, uint64_t stopcopy) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64" stopcopy size 0x%"PRIx64
 vfio_v1_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64
 vfio_save_iterate(const char *name, int data_size) " (%s) data_size %d"
+vfio_save_complete_precopy(const char *name, int ret) " (%s) ret %d"
 vfio_v1_save_complete_precopy(const char *name) " (%s)"
 vfio_load_device_config_state(const char *name) " (%s)"
 vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
 vfio_v1_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
+vfio_load_state_device_data(const char *name, uint64_t data_size, int ret) " (%s) size 0x%"PRIx64" ret %d"
 vfio_load_cleanup(const char *name) " (%s)"
 vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
 vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
+vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index bbaf72ba00..2ec3346fea 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -66,6 +66,11 @@ typedef struct VFIOMigration {
     int vm_running;
     Notifier migration_state;
     uint64_t pending_bytes;
+    enum vfio_device_mig_state device_state;
+    int data_fd;
+    void *data_buffer;
+    size_t data_buffer_size;
+    bool v2;
 } VFIOMigration;
 
 typedef struct VFIOAddressSpace {
-- 
2.26.3


