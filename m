Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D2B618431
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:22:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcxV-0007JI-Ay; Thu, 03 Nov 2022 12:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcvY-0001Ti-8i; Thu, 03 Nov 2022 12:18:49 -0400
Received: from mail-mw2nam12on2056.outbound.protection.outlook.com
 ([40.107.244.56] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcv8-0008Ey-VM; Thu, 03 Nov 2022 12:18:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xz5HRbhi6M6edniGUov01emIqRRm/J8Sx6Pa8LKyRVIMF+LdpYCyxcDeSXAlcyILQWjMZg3vr4Lwbfoh5drCqZJVaUAJ+ufL2slTCk+atSYe8k2Y2oRGvY9ds/BXhOKW76jkDkvPw3Uc5uKosf+aFcp0Jo7stkR5t1d9OAZaak3xZrsnS1EpZBn+gn+3VAnT8929jPQeuFH8jUeCj1shdQZRzNnxgVI7JbY/wsUJBkYbnXLycMXl6bB7DcM808/uWQ/YaEcCY6Cs3jzIhHEVkiaHXXR9wNLn10jN6Eo2G2fyi+9ZpnWBBxho4cUaLiGenNSdoABmwrFyKdpGS1/UcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTl2x7sds8wk1P8U29wu7CrcwKwGwvaTAOiH0OtBdOk=;
 b=kWb02mIeZC8Yy23vMkz7E7sYXebXR2Ju/eGKXTOExppKUImiJsMV+4dhaISnE/YcXPOiIz/ZijboyralJa9csDony3IOg2aMh12GjwPp/TSz2TSTdb6mjSuT2vLcQYWCMZ0tfxWwOStuxelF/FNqv7Bol4C8UZicNUbSzTAsZHPn7/hFO/diT8QuCJ1qIHB35ZbT1WixDMaK4/tVQENv4ooB9oOt7SCWTLDEWpChShuQH1sAxnYgfaVQzXfFrZhrWvQ/oKek03koWhTkwVN7ZPQMAH2yRUnXEpwVHVDWKbcQ2GZM6bUJwOrq8TdctmUVdDeTyuVdm0wM1rn4GNJClw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTl2x7sds8wk1P8U29wu7CrcwKwGwvaTAOiH0OtBdOk=;
 b=aEXsA3xq/+pShoBA28T77GBO0v74PS07d1CgLoRvSqNR9b4NFUxRKKBJlT5gOJaaz1T4aVhdDCsMiIZiglvOD4NO/Z9ZTX3H6oyGy4fcBx1+SBMz5r5tmeXIoLoAFjvFvhK3xndnFj7sUC6JGUTrXP7vyKIpYavggKGTkW39HpUit7E6qxg8ZHK0FY/2toRzf7RK7xEPncgT4YF0FxVe4c3wnXXstnBxbL7PxW9nvf/G4ZzndvhBbhob+vTyIfwSvkA98UIo5T9vq3S8a1TwHk6QYTW77x1TRNaipMmukT8+FYG6DAtZlk0n8jA1R/ZneeaBMFaeei42zJ7Q8omEIg==
Received: from BN0PR04CA0184.namprd04.prod.outlook.com (2603:10b6:408:e9::9)
 by BY5PR12MB5000.namprd12.prod.outlook.com (2603:10b6:a03:1d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 16:18:15 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::30) by BN0PR04CA0184.outlook.office365.com
 (2603:10b6:408:e9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 16:18:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 16:18:14 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 3 Nov 2022
 09:18:01 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 3 Nov 2022 09:18:01 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.29 via Frontend Transport;
 Thu, 3 Nov 2022 09:17:54 -0700
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
Subject: [PATCH v3 12/17] vfio/migration: Implement VFIO migration protocol v2
Date: Thu, 3 Nov 2022 18:16:15 +0200
Message-ID: <20221103161620.13120-13-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221103161620.13120-1-avihaih@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT067:EE_|BY5PR12MB5000:EE_
X-MS-Office365-Filtering-Correlation-Id: dbae212a-a208-4f5c-5ef1-08dabdb702b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kV0M1wK1AlS6ORw0qlyYrph/OGaX68grmmMC8MQdZ99m7pzlLPMcdS47gtnH5TT0rgiCF2aFfodtefQZxt37/SMHcEELUAJhTqOHl5m1zYSlNAev7mYMPYQ9om1ZPXNBm1deer7oqfwgQGQrKW8xZ6fX/y53WZg+IRnSwaRS/ni6EPekP+JDQNwtPT1+5eXYerlqkx/4SsczDxp9Rq74GKVuZQj1Rr6AKdK+OMoEzgZ30oNBjicvcxA+GJOOvsnKH9e5ufnK60zLl17WNpN5ds1prMxTavh9MrIl0UJCqiTUnPLfIxKkaXg63FZQPKZRSDu5c56rknr+P/IhiZEqx/6wT1DXKnovlljtPgDNn13etmuTPdvYOUJjUDwIPH9thRbbhxCGzx/UXiCrGqf+2yRveIe3Mg2qe076lv/GG1uT6wtiBKyIWWrr22bo1UZPjIBNuQO3U51BYrxbr78qan8lSgnwmr0B7V+/OEP+9JlWUtZp7IrPlalA9XUOWf0jdlMlBQWcgvnZWMhLsK0hb2pjOoEavjxMD0zcokWK6BJap8S2iQeVuj4xVUfez79MuGSIfrbfRAUXBzXkLTbIzxoxZkIT8dGaOzpdIhFruDvM3MPzxCBRkHTpuCOiJGJGa4sG2mpeNJ9wgIiL8++6vJuS2d42N+3d3Jcl4Lsr0BR8NtaG97zw/MT9kXPDSnG3QHdVTzty7n0x9AACP4cSXqN+Pw9vAfPfgplfT4A65bq4QmPp1uJfr7lhC19CiNKlsvV0+WU/B+vly533qYktX0exzMoqi1Ats18vdbBa5hOCegIERbUT2hvFQ0wyLafxBcWwYRtMed0D2lwgh7mu1IZkOKueEAk9XlReqLSNmQc=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(336012)(478600001)(47076005)(426003)(30864003)(4326008)(70206006)(966005)(70586007)(8676002)(6666004)(2616005)(40460700003)(186003)(7416002)(1076003)(5660300002)(316002)(54906003)(36860700001)(6916009)(2906002)(82310400005)(41300700001)(7636003)(356005)(83380400001)(82740400003)(36756003)(7696005)(8936002)(86362001)(40480700001)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 16:18:14.6511 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbae212a-a208-4f5c-5ef1-08dabdb702b4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5000
Received-SPF: softfail client-ip=40.107.244.56;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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
 hw/vfio/migration.c           | 386 ++++++++++++++++++++++++++++++----
 hw/vfio/trace-events          |   4 +
 include/hw/vfio/vfio-common.h |   5 +
 4 files changed, 375 insertions(+), 39 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 617e6cd901..0bdbd1586b 100644
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
index e784374453..62afc23a8c 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -44,8 +44,84 @@
 #define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
 #define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
 
+#define VFIO_MIG_DATA_BUFFER_SIZE (1024 * 1024)
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
+    struct vfio_device_feature *feature = (void *)buf;
+    struct vfio_device_feature_mig_state *mig_state = (void *)feature->data;
+
+    feature->argsz = sizeof(buf);
+    feature->flags =
+        VFIO_DEVICE_FEATURE_SET | VFIO_DEVICE_FEATURE_MIG_DEVICE_STATE;
+    mig_state->device_state = new_state;
+    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
+        /* Try to set the device in some good state */
+        error_report(
+            "%s: Failed setting device state to %s, err: %s. Setting device in recover state %s",
+                     vbasedev->name, mig_state_to_str(new_state),
+                     strerror(errno), mig_state_to_str(recover_state));
+
+        mig_state->device_state = recover_state;
+        if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
+            hw_error("%s: Failed setting device in recover state, err: %s",
+                     vbasedev->name, strerror(errno));
+        }
+
+        migration->device_state = recover_state;
+
+        return -1;
+    }
+
+    if (mig_state->data_fd != -1) {
+        if (migration->data_fd != -1) {
+            /*
+             * This can happen if the device is asynchronously reset and
+             * terminates a data transfer.
+             */
+            error_report("%s: data_fd out of sync", vbasedev->name);
+            close(mig_state->data_fd);
+
+            return -1;
+        }
+
+        migration->data_fd = mig_state->data_fd;
+    }
+    migration->device_state = new_state;
+
+    trace_vfio_migration_set_state(vbasedev->name, mig_state_to_str(new_state));
+
+    return 0;
+}
+
 static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
                                   off_t off, bool iswrite)
 {
@@ -260,6 +336,20 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
     return ret;
 }
 
+static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
+                            uint64_t data_size)
+{
+    VFIOMigration *migration = vbasedev->migration;
+    int ret;
+
+    ret = qemu_file_get_to_fd(f, migration->data_fd, data_size);
+    if (!ret) {
+        trace_vfio_load_state_device_data(vbasedev->name, data_size);
+    }
+
+    return ret;
+}
+
 static int vfio_v1_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
                                uint64_t data_size)
 {
@@ -394,6 +484,14 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
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
@@ -405,6 +503,18 @@ static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
 
 /* ---------------------------------------------------------------------- */
 
+static int vfio_save_setup(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+
+    trace_vfio_save_setup(vbasedev->name);
+
+    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
+    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
+
+    return qemu_file_get_error(f);
+}
+
 static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -448,6 +558,14 @@ static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
     return 0;
 }
 
+static void vfio_save_cleanup(void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+
+    vfio_migration_cleanup(vbasedev);
+    trace_vfio_save_cleanup(vbasedev->name);
+}
+
 static void vfio_v1_save_cleanup(void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -456,6 +574,23 @@ static void vfio_v1_save_cleanup(void *opaque)
     trace_vfio_save_cleanup(vbasedev->name);
 }
 
+#define VFIO_MIG_PENDING_SIZE (512 * 1024 * 1024)
+static void vfio_save_pending(void *opaque, uint64_t threshold_size,
+                              uint64_t *res_precopy, uint64_t *res_postcopy)
+{
+    VFIODevice *vbasedev = opaque;
+
+    /*
+     * VFIO migration protocol v2 currently doesn't have an API to get pending
+     * device state size. Until such API is introduced, report some big
+     * arbitrary pending size so the device will be taken into account for
+     * downtime limit calculations.
+     */
+    *res_postcopy += VFIO_MIG_PENDING_SIZE;
+
+    trace_vfio_save_pending(vbasedev->name, *res_precopy, *res_postcopy);
+}
+
 static void vfio_v1_save_pending(void *opaque, uint64_t threshold_size,
                                  uint64_t *res_precopy, uint64_t *res_postcopy)
 {
@@ -520,6 +655,67 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
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
+        return -1;
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
+    if (!ret) {
+        trace_vfio_save_complete_precopy(vbasedev->name);
+    }
+
+    return ret;
+}
+
 static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -589,6 +785,14 @@ static void vfio_save_state(QEMUFile *f, void *opaque)
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
@@ -616,6 +820,16 @@ static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
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
@@ -658,7 +872,11 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
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
@@ -679,6 +897,17 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
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
@@ -693,6 +922,34 @@ static SaveVMHandlers savevm_vfio_v1_handlers = {
 
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
@@ -766,12 +1023,17 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
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
@@ -780,12 +1042,35 @@ static void vfio_migration_exit(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
 
-    vfio_region_exit(&migration->region);
-    vfio_region_finalize(&migration->region);
+    if (migration->v2) {
+        g_free(migration->data_buffer);
+    } else {
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
+    struct vfio_device_feature *feature = (void *)buf;
+    struct vfio_device_feature_migration *mig = (void *)feature->data;
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
@@ -794,6 +1079,7 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     char id[256] = "";
     g_autofree char *path = NULL, *oid = NULL;
     struct vfio_region_info *info = NULL;
+    uint64_t mig_flags;
 
     if (!vbasedev->ops->vfio_get_object) {
         return -EINVAL;
@@ -804,34 +1090,51 @@ static int vfio_migration_init(VFIODevice *vbasedev)
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
+        vbasedev->migration->data_buffer_size = VFIO_MIG_DATA_BUFFER_SIZE;
+        vbasedev->migration->data_buffer =
+            g_malloc0(vbasedev->migration->data_buffer_size);
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
@@ -844,11 +1147,20 @@ static int vfio_migration_init(VFIODevice *vbasedev)
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
index d88d2b4053..9ef84e24b2 100644
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
@@ -163,6 +165,8 @@ vfio_save_complete_precopy(const char *name) " (%s)"
 vfio_load_device_config_state(const char *name) " (%s)"
 vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
 vfio_v1_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
+vfio_load_state_device_data(const char *name, uint64_t data_size) " (%s) size 0x%"PRIx64
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
2.21.3


