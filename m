Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87198699798
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:38:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfOK-0005dM-PO; Thu, 16 Feb 2023 09:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSfOI-0005RM-8C
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:42 -0500
Received: from mail-bn8nam12on2060a.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::60a]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSfOE-0004tG-Tn
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncw3SurTBlOkwV6oEVy/b/hKNO/JkZ8yr7/pNFYAkhdg5aMw41PSaF15cNGlOs3OIt/V5+R/C6EnpEKAxVCDOGdkSLQiVV3lHfF3wb9Y9y3Xe+mk+JXcs4mvk42krfgfguDWsaxMgYmdffwhvt/Pl+Hd9HBv7F/3sR5AEGRuDTi1XxK6okIUj6XQBUWY4ml28Gi4pnqD7CL7zpbkXoIZMFWd9RvtLbgrJaQ+Bd3pKqNI782A9ZxmTyzMo4gwhsfbMwVJaYoxLjor77UoE9Dn7aQOINdzK/Wgh0swVetomutR+MLlzyTX6TkyXaAhGICw7KMo2k0hmCARO6l7/d+75g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUKlg9dFNcTJ7H/dwXCc6m4JwVisTItnuewB2O5CQRE=;
 b=cyzGHvUD3tMWDEgvqcbfXDL8v5jj/LBfqQeBft2LpsMxwRTPg16n4BmKsoOjvY6O8vlR6ZrYdTSBaVKBwKcMIEcCpPIt4QDhJxyrp3mK6AyPWsKabAVJ0qzwGVxUKOFH8puEBqa3Z7bektA8y5B5qmmuL1EJdOHRPXDR3GsMnFyjJpAXxNE7p8XwoIghccCVqJwua+3J/rpNjfuHvUSrCxc/7euRD/RPFRX9Inwx6xEnH8CsmPp4P09jX012rs+aod7E5eCva3QucWUzQtkraewzU51m4zGs1T6CBE+o3Js6+qNaciE1NpLDFuF/kdLdhVL0TbHTk7gV+qqgtK96Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUKlg9dFNcTJ7H/dwXCc6m4JwVisTItnuewB2O5CQRE=;
 b=V1pbZjSSio139+PyKtthEFaCjo7VacG5TIooqntUy7Jt+BNLvzvk/vMLKUX8R7FpDay8SX4THQ6p3WZW8yeF0OF+489Mbh7zbOqpgkUYvsDccfCWR2pacKcTujvZr+tznIFhn+8irIJ/fa6UPadtfN/918mD4eDh1iP+kFLYFleudHZRwoa+q2uEdRE2EBpKvPu4+LYMRZHz+cyZua+A4+2kNCGC5zo7ePN5sZxaJjWK9w6xDKmlLCgbqLhzXK7jOGDWskYimM11uz51A3TXbBRZqOSV0JzcejpP67vmt3681vl6k2r1lDg20h8vU27R/36u70cC2+roKJK/7oMjRw==
Received: from MW4PR03CA0292.namprd03.prod.outlook.com (2603:10b6:303:b5::27)
 by CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 14:37:34 +0000
Received: from CO1PEPF00001A61.namprd05.prod.outlook.com
 (2603:10b6:303:b5:cafe::7b) by MW4PR03CA0292.outlook.office365.com
 (2603:10b6:303:b5::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13 via Frontend
 Transport; Thu, 16 Feb 2023 14:37:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF00001A61.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.8 via Frontend Transport; Thu, 16 Feb 2023 14:37:33 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 16 Feb
 2023 06:38:11 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 16 Feb
 2023 06:37:18 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Thu, 16 Feb
 2023 06:37:14 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v11 09/11] vfio/migration: Remove VFIO migration protocol v1
Date: Thu, 16 Feb 2023 16:36:28 +0200
Message-ID: <20230216143630.25610-10-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230216143630.25610-1-avihaih@nvidia.com>
References: <20230216143630.25610-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00001A61:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a4df2ca-74f5-4ba1-8ada-08db102b5736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j09sNX3XVWRAUCwc9SQMY/24gxFbAqVVZ3Q0UYKcBZBRcMOGn429VEy9iKtlSyD7xdTfkKzFDgYbgsNlvbi6S7YtdbdFXzb56prZw6xzVkzMebrntn5IItNmB507LRVTDaMqcjzW7D+Hl8vnzFu6Jxsja/LpbJK9bsHafbbVUZDpaNwlXPgAg9E0EwY+Xjukl//IUjfsTwEji2fvf/VezFXZ6+YPdxdnHhAOt/TKhayL7vuXooqFYZDz81MLSSOqcJ9VTYf4TBHlKHYrZq0eZzvHUQFsUGtYno0FiSgZemDff57lQQ/RCEgaVYtwp6A3biav6foYjvkzEYB9eh/xYh/Z5MLwwl1jmt6rGrp2EpCP71OEY6ZpyJhCzP+5k0JVldiFfnI6/BxpQovghhP7lPjh/i9Ae9f/IKaUBgrhie9WFwrumFJqNQj7kfgCrQcEFK04EM2JnYy/3tgj606cnROz0GI30Cij/D/lmH8PO5D/zWzwOMRW4rs7lX13jeg7B7Uw+Nq5+SV/9XXmGtj00ziErK+oS3W+Sb2r0a+ltDQhiU+cXFZf1eaWLKJnWyJ4it48MZ0SoHI04UzsgYW4cCBmy8f8HOid/sDIoH/H2TQtj/WDBddbEAK2WtAd2oC4MvFHd04/tsDZ/9rN9O8RHGP+mI8rLA9HoHX1Jg1Je7zXwi7lLS3d7Tk4ESMKJ/FzgpdrOOWb8Pz72DTvVRd3Rg==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199018)(46966006)(36840700001)(40470700004)(47076005)(66574015)(336012)(36860700001)(2616005)(426003)(83380400001)(40480700001)(36756003)(6666004)(186003)(26005)(1076003)(86362001)(7636003)(82740400003)(356005)(478600001)(316002)(54906003)(70206006)(70586007)(4326008)(6916009)(8676002)(40460700003)(8936002)(7416002)(41300700001)(30864003)(7696005)(5660300002)(2906002)(82310400005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 14:37:33.4325 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4df2ca-74f5-4ba1-8ada-08db102b5736
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00001A61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::60a;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

Now that v2 protocol implementation has been added, remove the
deprecated v1 implementation.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 include/hw/vfio/vfio-common.h |   5 -
 hw/vfio/common.c              |  17 +-
 hw/vfio/migration.c           | 700 ++--------------------------------
 hw/vfio/trace-events          |   9 -
 4 files changed, 24 insertions(+), 707 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index c4eab55af9..87524c64a4 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -61,16 +61,11 @@ typedef struct VFIORegion {
 typedef struct VFIOMigration {
     struct VFIODevice *vbasedev;
     VMChangeStateEntry *vm_state;
-    VFIORegion region;
-    uint32_t device_state_v1;
-    int vm_running;
     Notifier migration_state;
-    uint64_t pending_bytes;
     uint32_t device_state;
     int data_fd;
     void *data_buffer;
     size_t data_buffer_size;
-    bool v2;
 } VFIOMigration;
 
 typedef struct VFIOAddressSpace {
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 54fee2d5de..bab83c0e55 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -408,14 +408,7 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
                 return false;
             }
 
-            if (!migration->v2 &&
-                (vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
-                (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING)) {
-                return false;
-            }
-
-            if (migration->v2 &&
-                vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF &&
+            if (vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF &&
                 migration->device_state == VFIO_DEVICE_STATE_RUNNING) {
                 return false;
             }
@@ -445,13 +438,7 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
                 return false;
             }
 
-            if (!migration->v2 &&
-                migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
-                continue;
-            }
-
-            if (migration->v2 &&
-                migration->device_state == VFIO_DEVICE_STATE_RUNNING) {
+            if (migration->device_state == VFIO_DEVICE_STATE_RUNNING) {
                 continue;
             } else {
                 return false;
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 452d96a520..a2c3d9bade 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -153,220 +153,6 @@ reset_device:
     return ret;
 }
 
-static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
-                                  off_t off, bool iswrite)
-{
-    int ret;
-
-    ret = iswrite ? pwrite(vbasedev->fd, val, count, off) :
-                    pread(vbasedev->fd, val, count, off);
-    if (ret < count) {
-        error_report("vfio_mig_%s %d byte %s: failed at offset 0x%"
-                     HWADDR_PRIx", err: %s", iswrite ? "write" : "read", count,
-                     vbasedev->name, off, strerror(errno));
-        return (ret < 0) ? ret : -EINVAL;
-    }
-    return 0;
-}
-
-static int vfio_mig_rw(VFIODevice *vbasedev, __u8 *buf, size_t count,
-                       off_t off, bool iswrite)
-{
-    int ret, done = 0;
-    __u8 *tbuf = buf;
-
-    while (count) {
-        int bytes = 0;
-
-        if (count >= 8 && !(off % 8)) {
-            bytes = 8;
-        } else if (count >= 4 && !(off % 4)) {
-            bytes = 4;
-        } else if (count >= 2 && !(off % 2)) {
-            bytes = 2;
-        } else {
-            bytes = 1;
-        }
-
-        ret = vfio_mig_access(vbasedev, tbuf, bytes, off, iswrite);
-        if (ret) {
-            return ret;
-        }
-
-        count -= bytes;
-        done += bytes;
-        off += bytes;
-        tbuf += bytes;
-    }
-    return done;
-}
-
-#define vfio_mig_read(f, v, c, o)       vfio_mig_rw(f, (__u8 *)v, c, o, false)
-#define vfio_mig_write(f, v, c, o)      vfio_mig_rw(f, (__u8 *)v, c, o, true)
-
-#define VFIO_MIG_STRUCT_OFFSET(f)       \
-                                 offsetof(struct vfio_device_migration_info, f)
-/*
- * Change the device_state register for device @vbasedev. Bits set in @mask
- * are preserved, bits set in @value are set, and bits not set in either @mask
- * or @value are cleared in device_state. If the register cannot be accessed,
- * the resulting state would be invalid, or the device enters an error state,
- * an error is returned.
- */
-
-static int vfio_migration_v1_set_state(VFIODevice *vbasedev, uint32_t mask,
-                                       uint32_t value)
-{
-    VFIOMigration *migration = vbasedev->migration;
-    VFIORegion *region = &migration->region;
-    off_t dev_state_off = region->fd_offset +
-                          VFIO_MIG_STRUCT_OFFSET(device_state);
-    uint32_t device_state;
-    int ret;
-
-    ret = vfio_mig_read(vbasedev, &device_state, sizeof(device_state),
-                        dev_state_off);
-    if (ret < 0) {
-        return ret;
-    }
-
-    device_state = (device_state & mask) | value;
-
-    if (!VFIO_DEVICE_STATE_VALID(device_state)) {
-        return -EINVAL;
-    }
-
-    ret = vfio_mig_write(vbasedev, &device_state, sizeof(device_state),
-                         dev_state_off);
-    if (ret < 0) {
-        int rret;
-
-        rret = vfio_mig_read(vbasedev, &device_state, sizeof(device_state),
-                             dev_state_off);
-
-        if ((rret < 0) || (VFIO_DEVICE_STATE_IS_ERROR(device_state))) {
-            hw_error("%s: Device in error state 0x%x", vbasedev->name,
-                     device_state);
-            return rret ? rret : -EIO;
-        }
-        return ret;
-    }
-
-    migration->device_state_v1 = device_state;
-    trace_vfio_migration_v1_set_state(vbasedev->name, device_state);
-    return 0;
-}
-
-static void *get_data_section_size(VFIORegion *region, uint64_t data_offset,
-                                   uint64_t data_size, uint64_t *size)
-{
-    void *ptr = NULL;
-    uint64_t limit = 0;
-    int i;
-
-    if (!region->mmaps) {
-        if (size) {
-            *size = MIN(data_size, region->size - data_offset);
-        }
-        return ptr;
-    }
-
-    for (i = 0; i < region->nr_mmaps; i++) {
-        VFIOMmap *map = region->mmaps + i;
-
-        if ((data_offset >= map->offset) &&
-            (data_offset < map->offset + map->size)) {
-
-            /* check if data_offset is within sparse mmap areas */
-            ptr = map->mmap + data_offset - map->offset;
-            if (size) {
-                *size = MIN(data_size, map->offset + map->size - data_offset);
-            }
-            break;
-        } else if ((data_offset < map->offset) &&
-                   (!limit || limit > map->offset)) {
-            /*
-             * data_offset is not within sparse mmap areas, find size of
-             * non-mapped area. Check through all list since region->mmaps list
-             * is not sorted.
-             */
-            limit = map->offset;
-        }
-    }
-
-    if (!ptr && size) {
-        *size = limit ? MIN(data_size, limit - data_offset) : data_size;
-    }
-    return ptr;
-}
-
-static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
-{
-    VFIOMigration *migration = vbasedev->migration;
-    VFIORegion *region = &migration->region;
-    uint64_t data_offset = 0, data_size = 0, sz;
-    int ret;
-
-    ret = vfio_mig_read(vbasedev, &data_offset, sizeof(data_offset),
-                      region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_offset));
-    if (ret < 0) {
-        return ret;
-    }
-
-    ret = vfio_mig_read(vbasedev, &data_size, sizeof(data_size),
-                        region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_size));
-    if (ret < 0) {
-        return ret;
-    }
-
-    trace_vfio_save_buffer(vbasedev->name, data_offset, data_size,
-                           migration->pending_bytes);
-
-    qemu_put_be64(f, data_size);
-    sz = data_size;
-
-    while (sz) {
-        void *buf;
-        uint64_t sec_size;
-        bool buf_allocated = false;
-
-        buf = get_data_section_size(region, data_offset, sz, &sec_size);
-
-        if (!buf) {
-            buf = g_try_malloc(sec_size);
-            if (!buf) {
-                error_report("%s: Error allocating buffer ", __func__);
-                return -ENOMEM;
-            }
-            buf_allocated = true;
-
-            ret = vfio_mig_read(vbasedev, buf, sec_size,
-                                region->fd_offset + data_offset);
-            if (ret < 0) {
-                g_free(buf);
-                return ret;
-            }
-        }
-
-        qemu_put_buffer(f, buf, sec_size);
-
-        if (buf_allocated) {
-            g_free(buf);
-        }
-        sz -= sec_size;
-        data_offset += sec_size;
-    }
-
-    ret = qemu_file_get_error(f);
-
-    if (!ret && size) {
-        *size = data_size;
-    }
-
-    bytes_transferred += data_size;
-    return ret;
-}
-
 static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
                             uint64_t data_size)
 {
@@ -379,96 +165,6 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
     return ret;
 }
 
-static int vfio_v1_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
-                               uint64_t data_size)
-{
-    VFIORegion *region = &vbasedev->migration->region;
-    uint64_t data_offset = 0, size, report_size;
-    int ret;
-
-    do {
-        ret = vfio_mig_read(vbasedev, &data_offset, sizeof(data_offset),
-                      region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_offset));
-        if (ret < 0) {
-            return ret;
-        }
-
-        if (data_offset + data_size > region->size) {
-            /*
-             * If data_size is greater than the data section of migration region
-             * then iterate the write buffer operation. This case can occur if
-             * size of migration region at destination is smaller than size of
-             * migration region at source.
-             */
-            report_size = size = region->size - data_offset;
-            data_size -= size;
-        } else {
-            report_size = size = data_size;
-            data_size = 0;
-        }
-
-        trace_vfio_v1_load_state_device_data(vbasedev->name, data_offset, size);
-
-        while (size) {
-            void *buf;
-            uint64_t sec_size;
-            bool buf_alloc = false;
-
-            buf = get_data_section_size(region, data_offset, size, &sec_size);
-
-            if (!buf) {
-                buf = g_try_malloc(sec_size);
-                if (!buf) {
-                    error_report("%s: Error allocating buffer ", __func__);
-                    return -ENOMEM;
-                }
-                buf_alloc = true;
-            }
-
-            qemu_get_buffer(f, buf, sec_size);
-
-            if (buf_alloc) {
-                ret = vfio_mig_write(vbasedev, buf, sec_size,
-                        region->fd_offset + data_offset);
-                g_free(buf);
-
-                if (ret < 0) {
-                    return ret;
-                }
-            }
-            size -= sec_size;
-            data_offset += sec_size;
-        }
-
-        ret = vfio_mig_write(vbasedev, &report_size, sizeof(report_size),
-                        region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_size));
-        if (ret < 0) {
-            return ret;
-        }
-    } while (data_size);
-
-    return 0;
-}
-
-static int vfio_update_pending(VFIODevice *vbasedev)
-{
-    VFIOMigration *migration = vbasedev->migration;
-    VFIORegion *region = &migration->region;
-    uint64_t pending_bytes = 0;
-    int ret;
-
-    ret = vfio_mig_read(vbasedev, &pending_bytes, sizeof(pending_bytes),
-                    region->fd_offset + VFIO_MIG_STRUCT_OFFSET(pending_bytes));
-    if (ret < 0) {
-        migration->pending_bytes = 0;
-        return ret;
-    }
-
-    migration->pending_bytes = pending_bytes;
-    trace_vfio_update_pending(vbasedev->name, pending_bytes);
-    return 0;
-}
-
 static int vfio_save_device_config_state(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -521,15 +217,6 @@ static void vfio_migration_cleanup(VFIODevice *vbasedev)
     migration->data_fd = -1;
 }
 
-static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
-{
-    VFIOMigration *migration = vbasedev->migration;
-
-    if (migration->region.mmaps) {
-        vfio_region_unmap(&migration->region);
-    }
-}
-
 static int vfio_query_stop_copy_size(VFIODevice *vbasedev,
                                      uint64_t *stop_copy_size)
 {
@@ -604,49 +291,6 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
     return qemu_file_get_error(f);
 }
 
-static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
-{
-    VFIODevice *vbasedev = opaque;
-    VFIOMigration *migration = vbasedev->migration;
-    int ret;
-
-    trace_vfio_v1_save_setup(vbasedev->name);
-
-    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
-
-    if (migration->region.mmaps) {
-        /*
-         * Calling vfio_region_mmap() from migration thread. Memory API called
-         * from this function require locking the iothread when called from
-         * outside the main loop thread.
-         */
-        qemu_mutex_lock_iothread();
-        ret = vfio_region_mmap(&migration->region);
-        qemu_mutex_unlock_iothread();
-        if (ret) {
-            error_report("%s: Failed to mmap VFIO migration region: %s",
-                         vbasedev->name, strerror(-ret));
-            error_report("%s: Falling back to slow path", vbasedev->name);
-        }
-    }
-
-    ret = vfio_migration_v1_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
-                                      VFIO_DEVICE_STATE_V1_SAVING);
-    if (ret) {
-        error_report("%s: Failed to set state SAVING", vbasedev->name);
-        return ret;
-    }
-
-    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
-
-    ret = qemu_file_get_error(f);
-    if (ret) {
-        return ret;
-    }
-
-    return 0;
-}
-
 static void vfio_save_cleanup(void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -658,14 +302,6 @@ static void vfio_save_cleanup(void *opaque)
     trace_vfio_save_cleanup(vbasedev->name);
 }
 
-static void vfio_v1_save_cleanup(void *opaque)
-{
-    VFIODevice *vbasedev = opaque;
-
-    vfio_migration_v1_cleanup(vbasedev);
-    trace_vfio_save_cleanup(vbasedev->name);
-}
-
 /*
  * Migration size of VFIO devices can be as little as a few KBs or as big as
  * many GBs. This value should be big enough to cover the worst case.
@@ -695,70 +331,6 @@ static void vfio_state_pending_exact(void *opaque, uint64_t *must_precopy,
                                    stop_copy_size);
 }
 
-static void vfio_v1_state_pending(void *opaque, uint64_t *must_precopy,
-                                  uint64_t *can_postcopy)
-{
-    VFIODevice *vbasedev = opaque;
-    VFIOMigration *migration = vbasedev->migration;
-    int ret;
-
-    ret = vfio_update_pending(vbasedev);
-    if (ret) {
-        return;
-    }
-
-    *must_precopy += migration->pending_bytes;
-
-    trace_vfio_v1_state_pending(vbasedev->name, *must_precopy, *can_postcopy);
-}
-
-static int vfio_save_iterate(QEMUFile *f, void *opaque)
-{
-    VFIODevice *vbasedev = opaque;
-    VFIOMigration *migration = vbasedev->migration;
-    uint64_t data_size;
-    int ret;
-
-    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
-
-    if (migration->pending_bytes == 0) {
-        ret = vfio_update_pending(vbasedev);
-        if (ret) {
-            return ret;
-        }
-
-        if (migration->pending_bytes == 0) {
-            qemu_put_be64(f, 0);
-            qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
-            /* indicates data finished, goto complete phase */
-            return 1;
-        }
-    }
-
-    ret = vfio_save_buffer(f, vbasedev, &data_size);
-    if (ret) {
-        error_report("%s: vfio_save_buffer failed %s", vbasedev->name,
-                     strerror(errno));
-        return ret;
-    }
-
-    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
-
-    ret = qemu_file_get_error(f);
-    if (ret) {
-        return ret;
-    }
-
-    /*
-     * Reset pending_bytes as state_pending* are not called during
-     * savevm or snapshot case, in such case vfio_update_pending() at
-     * the start of this function updates pending_bytes.
-     */
-    migration->pending_bytes = 0;
-    trace_vfio_save_iterate(vbasedev->name, data_size);
-    return 0;
-}
-
 static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -795,62 +367,6 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
     return ret;
 }
 
-static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
-{
-    VFIODevice *vbasedev = opaque;
-    VFIOMigration *migration = vbasedev->migration;
-    uint64_t data_size;
-    int ret;
-
-    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_RUNNING,
-                                      VFIO_DEVICE_STATE_V1_SAVING);
-    if (ret) {
-        error_report("%s: Failed to set state STOP and SAVING",
-                     vbasedev->name);
-        return ret;
-    }
-
-    ret = vfio_update_pending(vbasedev);
-    if (ret) {
-        return ret;
-    }
-
-    while (migration->pending_bytes > 0) {
-        qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
-        ret = vfio_save_buffer(f, vbasedev, &data_size);
-        if (ret < 0) {
-            error_report("%s: Failed to save buffer", vbasedev->name);
-            return ret;
-        }
-
-        if (data_size == 0) {
-            break;
-        }
-
-        ret = vfio_update_pending(vbasedev);
-        if (ret) {
-            return ret;
-        }
-    }
-
-    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
-
-    ret = qemu_file_get_error(f);
-    if (ret) {
-        return ret;
-    }
-
-    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING,
-                                      0);
-    if (ret) {
-        error_report("%s: Failed to set state STOPPED", vbasedev->name);
-        return ret;
-    }
-
-    trace_vfio_v1_save_complete_precopy(vbasedev->name);
-    return ret;
-}
-
 static void vfio_save_state(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -872,33 +388,6 @@ static int vfio_load_setup(QEMUFile *f, void *opaque)
                                    vbasedev->migration->device_state);
 }
 
-static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
-{
-    VFIODevice *vbasedev = opaque;
-    VFIOMigration *migration = vbasedev->migration;
-    int ret = 0;
-
-    if (migration->region.mmaps) {
-        ret = vfio_region_mmap(&migration->region);
-        if (ret) {
-            error_report("%s: Failed to mmap VFIO migration region %d: %s",
-                         vbasedev->name, migration->region.nr,
-                         strerror(-ret));
-            error_report("%s: Falling back to slow path", vbasedev->name);
-        }
-    }
-
-    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_MASK,
-                                      VFIO_DEVICE_STATE_V1_RESUMING);
-    if (ret) {
-        error_report("%s: Failed to set state RESUMING", vbasedev->name);
-        if (migration->region.mmaps) {
-            vfio_region_unmap(&migration->region);
-        }
-    }
-    return ret;
-}
-
 static int vfio_load_cleanup(void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -909,15 +398,6 @@ static int vfio_load_cleanup(void *opaque)
     return 0;
 }
 
-static int vfio_v1_load_cleanup(void *opaque)
-{
-    VFIODevice *vbasedev = opaque;
-
-    vfio_migration_v1_cleanup(vbasedev);
-    trace_vfio_load_cleanup(vbasedev->name);
-    return 0;
-}
-
 static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
 {
     VFIODevice *vbasedev = opaque;
@@ -951,11 +431,7 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
             uint64_t data_size = qemu_get_be64(f);
 
             if (data_size) {
-                if (vbasedev->migration->v2) {
-                    ret = vfio_load_buffer(f, vbasedev, data_size);
-                } else {
-                    ret = vfio_v1_load_buffer(f, vbasedev, data_size);
-                }
+                ret = vfio_load_buffer(f, vbasedev, data_size);
                 if (ret < 0) {
                     return ret;
                 }
@@ -987,19 +463,6 @@ static const SaveVMHandlers savevm_vfio_handlers = {
     .load_state = vfio_load_state,
 };
 
-static SaveVMHandlers savevm_vfio_v1_handlers = {
-    .save_setup = vfio_v1_save_setup,
-    .save_cleanup = vfio_v1_save_cleanup,
-    .state_pending_exact = vfio_v1_state_pending,
-    .state_pending_estimate = vfio_v1_state_pending,
-    .save_live_iterate = vfio_save_iterate,
-    .save_live_complete_precopy = vfio_v1_save_complete_precopy,
-    .save_state = vfio_save_state,
-    .load_setup = vfio_v1_load_setup,
-    .load_cleanup = vfio_v1_load_cleanup,
-    .load_state = vfio_load_state,
-};
-
 /* ---------------------------------------------------------------------- */
 
 static void vfio_vmstate_change(void *opaque, bool running, RunState state)
@@ -1034,70 +497,12 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
                               mig_state_to_str(new_state));
 }
 
-static void vfio_v1_vmstate_change(void *opaque, bool running, RunState state)
-{
-    VFIODevice *vbasedev = opaque;
-    VFIOMigration *migration = vbasedev->migration;
-    uint32_t value, mask;
-    int ret;
-
-    if (vbasedev->migration->vm_running == running) {
-        return;
-    }
-
-    if (running) {
-        /*
-         * Here device state can have one of _SAVING, _RESUMING or _STOP bit.
-         * Transition from _SAVING to _RUNNING can happen if there is migration
-         * failure, in that case clear _SAVING bit.
-         * Transition from _RESUMING to _RUNNING occurs during resuming
-         * phase, in that case clear _RESUMING bit.
-         * In both the above cases, set _RUNNING bit.
-         */
-        mask = ~VFIO_DEVICE_STATE_MASK;
-        value = VFIO_DEVICE_STATE_V1_RUNNING;
-    } else {
-        /*
-         * Here device state could be either _RUNNING or _SAVING|_RUNNING. Reset
-         * _RUNNING bit
-         */
-        mask = ~VFIO_DEVICE_STATE_V1_RUNNING;
-
-        /*
-         * When VM state transition to stop for savevm command, device should
-         * start saving data.
-         */
-        if (state == RUN_STATE_SAVE_VM) {
-            value = VFIO_DEVICE_STATE_V1_SAVING;
-        } else {
-            value = 0;
-        }
-    }
-
-    ret = vfio_migration_v1_set_state(vbasedev, mask, value);
-    if (ret) {
-        /*
-         * Migration should be aborted in this case, but vm_state_notify()
-         * currently does not support reporting failures.
-         */
-        error_report("%s: Failed to set device state 0x%x", vbasedev->name,
-                     (migration->device_state_v1 & mask) | value);
-        if (migrate_get_current()->to_dst_file) {
-            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
-        }
-    }
-    vbasedev->migration->vm_running = running;
-    trace_vfio_v1_vmstate_change(vbasedev->name, running, RunState_str(state),
-            (migration->device_state_v1 & mask) | value);
-}
-
 static void vfio_migration_state_notifier(Notifier *notifier, void *data)
 {
     MigrationState *s = data;
     VFIOMigration *migration = container_of(notifier, VFIOMigration,
                                             migration_state);
     VFIODevice *vbasedev = migration->vbasedev;
-    int ret;
 
     trace_vfio_migration_state_notifier(vbasedev->name,
                                         MigrationStatus_str(s->state));
@@ -1107,33 +512,17 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
     case MIGRATION_STATUS_CANCELLED:
     case MIGRATION_STATUS_FAILED:
         bytes_transferred = 0;
-        if (migration->v2) {
-            /*
-             * If setting the device in RUNNING state fails, the device should
-             * be reset. To do so, use ERROR state as a recover state.
-             */
-            vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
-                                     VFIO_DEVICE_STATE_ERROR);
-        } else {
-            ret = vfio_migration_v1_set_state(vbasedev,
-                                              ~(VFIO_DEVICE_STATE_V1_SAVING |
-                                                VFIO_DEVICE_STATE_V1_RESUMING),
-                                              VFIO_DEVICE_STATE_V1_RUNNING);
-            if (ret) {
-                error_report("%s: Failed to set state RUNNING", vbasedev->name);
-            }
-        }
+        /*
+         * If setting the device in RUNNING state fails, the device should
+         * be reset. To do so, use ERROR state as a recover state.
+         */
+        vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
+                                 VFIO_DEVICE_STATE_ERROR);
     }
 }
 
 static void vfio_migration_exit(VFIODevice *vbasedev)
 {
-    VFIOMigration *migration = vbasedev->migration;
-
-    if (!migration->v2) {
-        vfio_region_exit(&migration->region);
-        vfio_region_finalize(&migration->region);
-    }
     g_free(vbasedev->migration);
     vbasedev->migration = NULL;
 }
@@ -1173,7 +562,6 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     VFIOMigration *migration;
     char id[256] = "";
     g_autofree char *path = NULL, *oid = NULL;
-    struct vfio_region_info *info;
     uint64_t mig_flags = 0;
 
     if (!vbasedev->ops->vfio_get_object) {
@@ -1186,52 +574,20 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     }
 
     ret = vfio_migration_query_flags(vbasedev, &mig_flags);
-    if (!ret) {
-        /* Migration v2 */
-        /* Basic migration functionality must be supported */
-        if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
-            return -EOPNOTSUPP;
-        }
-        vbasedev->migration = g_new0(VFIOMigration, 1);
-        vbasedev->migration->device_state = VFIO_DEVICE_STATE_RUNNING;
-        vbasedev->migration->data_fd = -1;
-        vbasedev->migration->v2 = true;
-    } else if (ret == -ENOTTY) {
-        /* Migration v1 */
-        ret = vfio_get_dev_region_info(vbasedev,
-                                       VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
-                                       VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
-                                       &info);
-        if (ret) {
-            return ret;
-        }
-
-        vbasedev->migration = g_new0(VFIOMigration, 1);
-        vbasedev->migration->device_state_v1 = VFIO_DEVICE_STATE_V1_RUNNING;
-        vbasedev->migration->vm_running = runstate_is_running();
-
-        ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
-                                info->index, "migration");
-        if (ret) {
-            error_report("%s: Failed to setup VFIO migration region %d: %s",
-                         vbasedev->name, info->index, strerror(-ret));
-            goto err;
-        }
-
-        if (!vbasedev->migration->region.size) {
-            error_report("%s: Invalid zero-sized VFIO migration region %d",
-                         vbasedev->name, info->index);
-            ret = -EINVAL;
-            goto err;
-        }
-
-        g_free(info);
-    } else {
+    if (ret) {
         return ret;
     }
 
+    /* Basic migration functionality must be supported */
+    if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
+        return -EOPNOTSUPP;
+    }
+
+    vbasedev->migration = g_new0(VFIOMigration, 1);
     migration = vbasedev->migration;
     migration->vbasedev = vbasedev;
+    migration->device_state = VFIO_DEVICE_STATE_RUNNING;
+    migration->data_fd = -1;
 
     oid = vmstate_if_get_id(VMSTATE_IF(DEVICE(obj)));
     if (oid) {
@@ -1241,28 +597,16 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     }
     strpadcpy(id, sizeof(id), path, '\0');
 
-    if (migration->v2) {
-        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
-                             &savevm_vfio_handlers, vbasedev);
-
-        migration->vm_state = qdev_add_vm_change_state_handler(
-            vbasedev->dev, vfio_vmstate_change, vbasedev);
-    } else {
-        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
-                             &savevm_vfio_v1_handlers, vbasedev);
-
-        migration->vm_state = qdev_add_vm_change_state_handler(
-            vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
-    }
+    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
+                         vbasedev);
 
+    migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
+                                                           vfio_vmstate_change,
+                                                           vbasedev);
     migration->migration_state.notify = vfio_migration_state_notifier;
     add_migration_state_change_notifier(&migration->migration_state);
-    return 0;
 
-err:
-    g_free(info);
-    vfio_migration_exit(vbasedev);
-    return ret;
+    return 0;
 }
 
 /* ---------------------------------------------------------------------- */
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index b24e448534..9d65c2da2e 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -150,24 +150,15 @@ vfio_display_edid_write_error(void) ""
 # migration.c
 vfio_migration_probe(const char *name) " (%s)"
 vfio_migration_set_state(const char *name, const char *state) " (%s) state %s"
-vfio_migration_v1_set_state(const char *name, uint32_t state) " (%s) state %d"
 vfio_vmstate_change(const char *name, int running, const char *reason, const char *dev_state) " (%s) running %d reason %s device state %s"
-vfio_v1_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
 vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
 vfio_save_setup(const char *name, uint64_t data_buffer_size) " (%s) data buffer size 0x%"PRIx64
-vfio_v1_save_setup(const char *name) " (%s)"
 vfio_save_cleanup(const char *name) " (%s)"
-vfio_save_buffer(const char *name, uint64_t data_offset, uint64_t data_size, uint64_t pending) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64" pending 0x%"PRIx64
-vfio_update_pending(const char *name, uint64_t pending) " (%s) pending 0x%"PRIx64
 vfio_save_device_config_state(const char *name) " (%s)"
 vfio_state_pending_exact(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t stopcopy_size) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" stopcopy size 0x%"PRIx64
-vfio_v1_state_pending(const char *name, uint64_t precopy, uint64_t postcopy) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64
-vfio_save_iterate(const char *name, int data_size) " (%s) data_size %d"
 vfio_save_complete_precopy(const char *name, int ret) " (%s) ret %d"
-vfio_v1_save_complete_precopy(const char *name) " (%s)"
 vfio_load_device_config_state(const char *name) " (%s)"
 vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
-vfio_v1_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
 vfio_load_state_device_data(const char *name, uint64_t data_size, int ret) " (%s) size 0x%"PRIx64" ret %d"
 vfio_load_cleanup(const char *name) " (%s)"
 vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
-- 
2.26.3


