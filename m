Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F7A62F3C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 06:16:24 +0200 (CEST)
Received: from localhost ([::1]:46582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkhYF-0002Kp-Rh
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 00:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35030)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwankhede@nvidia.com>) id 1hkhQn-0002W1-Nq
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 00:08:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwankhede@nvidia.com>) id 1hkhQk-0003Pg-Ny
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 00:08:41 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:11838)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwankhede@nvidia.com>)
 id 1hkhQj-0003On-Oh
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 00:08:38 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d241327000a>; Mon, 08 Jul 2019 21:08:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 08 Jul 2019 21:08:09 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 08 Jul 2019 21:08:09 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Jul
 2019 02:02:54 +0000
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Jul
 2019 02:02:53 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 9 Jul 2019 02:02:47 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Date: Tue, 9 Jul 2019 07:29:11 +0530
Message-ID: <1562637554-22439-11-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1562637554-22439-1-git-send-email-kwankhede@nvidia.com>
References: <1562637554-22439-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1562645296; bh=Syf01pPA8PUAEH5IVjDOfZuEkpuJdT2QcJM6jkIBpGE=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=KVZxvS76Qp64QyVHVCz71pXeBsw6jvtPhmFkTSkK7LoTcFBNKLdi7o5RSg8a1aiFB
 T8sH2W9WpCFbKrr813mN8XivdeK37NJDYT4n43JERHa8yaVNux7hslC3MqgT1DC2SK
 q1Ip3wwuAfPYouMlVRI8PTt6Pw2lqRFsKBf9ZNy63GaqBouRx4yjwR9Q29NXIOr5Xz
 UjLRioLo9eovBf7SVeCXU2R9nauAR8nTZ16gNG5tZCdCR/tWPpditWChNfn5BUzn6/
 n5NiVqOsO3tHe2e6dQxzYxdbGHeMrd2yuZtEqCRveBXxnpAY4EwhzsLZYBFEu0y3QT
 JZeAv4c66jqhg==
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 216.228.121.65
Subject: [Qemu-devel] [PATCH v6 10/13] vfio: Add load state functions to
 SaveVMHandlers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Zhengxiao.zx@Alibaba-inc.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 yan.y.zhao@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
 qemu-devel@nongnu.org, cohuck@redhat.com, shuangtai.tst@alibaba-inc.com,
 dgilbert@redhat.com, zhi.a.wang@intel.com, mlevitsk@redhat.com,
 pasic@linux.ibm.com, aik@ozlabs.ru, Kirti Wankhede <kwankhede@nvidia.com>,
 eauger@redhat.com, felipe@nutanix.com, jonathan.davies@nutanix.com,
 changpeng.liu@intel.com, Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Flow during _RESUMING device state:
- If Vendor driver defines mappable region, mmap migration region.
- Load config state.
- For data packet, till VFIO_MIG_FLAG_END_OF_STATE is not reached
    - read data_size from packet, read buffer of data_size
    - read data_offset from where QEMU should write data.
        if region is mmaped, write data of data_size to mmaped region.
    - write data_size.
        In case of mmapped region, write to data_size indicates kernel
        driver that data is written in staging buffer.
    - if region is trapped, pwrite() data of data_size from data_offset.
- Repeat above until VFIO_MIG_FLAG_END_OF_STATE.
- Unmap migration region.

For user, data is opaque. User should write data in the same order as
received.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
---
 hw/vfio/migration.c  | 162 +++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/trace-events |   4 ++
 2 files changed, 166 insertions(+)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 4e9b4cce230b..5fb4c5329ede 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -249,6 +249,26 @@ static int vfio_save_device_config_state(QEMUFile *f, void *opaque)
     return qemu_file_get_error(f);
 }
 
+static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    uint64_t data;
+
+    if (vbasedev->ops && vbasedev->ops->vfio_load_config) {
+        vbasedev->ops->vfio_load_config(vbasedev, f);
+    }
+
+    data = qemu_get_be64(f);
+    if (data != VFIO_MIG_FLAG_END_OF_STATE) {
+        error_report("%s: Failed loading device config space, "
+                     "end flag incorrect 0x%"PRIx64, vbasedev->name, data);
+        return -EINVAL;
+    }
+
+    trace_vfio_load_device_config_state(vbasedev->name);
+    return qemu_file_get_error(f);
+}
+
 /* ---------------------------------------------------------------------- */
 
 static int vfio_save_setup(QEMUFile *f, void *opaque)
@@ -421,12 +441,154 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
     return ret;
 }
 
+static int vfio_load_setup(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+    int ret = 0;
+
+    if (migration->region.buffer.mmaps) {
+        ret = vfio_region_mmap(&migration->region.buffer);
+        if (ret) {
+            error_report("%s: Failed to mmap VFIO migration region %d: %s",
+                         vbasedev->name, migration->region.index,
+                         strerror(-ret));
+            return ret;
+        }
+    }
+
+    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RESUMING);
+    if (ret) {
+        error_report("%s: Failed to set state RESUMING", vbasedev->name);
+    }
+    return ret;
+}
+
+static int vfio_load_cleanup(void *opaque)
+{
+    vfio_save_cleanup(opaque);
+    return 0;
+}
+
+static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+    int ret = 0;
+    uint64_t data, data_size;
+
+    data = qemu_get_be64(f);
+    while (data != VFIO_MIG_FLAG_END_OF_STATE) {
+
+        trace_vfio_load_state(vbasedev->name, data);
+
+        switch (data) {
+        case VFIO_MIG_FLAG_DEV_CONFIG_STATE:
+        {
+            ret = vfio_load_device_config_state(f, opaque);
+            if (ret) {
+                return ret;
+            }
+            break;
+        }
+        case VFIO_MIG_FLAG_DEV_SETUP_STATE:
+        {
+            data = qemu_get_be64(f);
+            if (data == VFIO_MIG_FLAG_END_OF_STATE) {
+                return ret;
+            } else {
+                error_report("%s: SETUP STATE: EOS not found 0x%"PRIx64,
+                             vbasedev->name, data);
+                return -EINVAL;
+            }
+            break;
+        }
+        case VFIO_MIG_FLAG_DEV_DATA_STATE:
+        {
+            VFIORegion *region = &migration->region.buffer;
+            void *buf = NULL;
+            bool buffer_mmaped = false;
+            uint64_t data_offset = 0;
+
+            data_size = qemu_get_be64(f);
+            if (data_size == 0) {
+                break;
+            }
+
+            ret = pread(vbasedev->fd, &data_offset, sizeof(data_offset),
+                        region->fd_offset +
+                        offsetof(struct vfio_device_migration_info,
+                        data_offset));
+            if (ret != sizeof(data_offset)) {
+                error_report("%s:Failed to get migration buffer data offset %d",
+                             vbasedev->name, ret);
+                return -EINVAL;
+            }
+
+            if (region->mmaps) {
+                buf = find_data_region(region, data_offset, data_size);
+            }
+
+            buffer_mmaped = (buf != NULL) ? true : false;
+
+            if (!buffer_mmaped) {
+                buf = g_try_malloc0(data_size);
+                if (!buf) {
+                    error_report("%s: Error allocating buffer ", __func__);
+                    return -ENOMEM;
+                }
+            }
+
+            qemu_get_buffer(f, buf, data_size);
+
+            ret = pwrite(vbasedev->fd, &data_size, sizeof(data_size),
+                         region->fd_offset +
+                       offsetof(struct vfio_device_migration_info, data_size));
+            if (ret != sizeof(data_size)) {
+                error_report("%s: Failed to set migration buffer data size %d",
+                             vbasedev->name, ret);
+                if (!buffer_mmaped) {
+                    g_free(buf);
+                }
+                return -EINVAL;
+            }
+
+            if (!buffer_mmaped) {
+                ret = pwrite(vbasedev->fd, buf, data_size,
+                             region->fd_offset + data_offset);
+                g_free(buf);
+
+                if (ret != data_size) {
+                    error_report("%s: Failed to set migration buffer %d",
+                                 vbasedev->name, ret);
+                    return -EINVAL;
+                }
+            }
+            trace_vfio_load_state_device_data(vbasedev->name, data_offset,
+                                              data_size);
+            break;
+        }
+        }
+
+        ret = qemu_file_get_error(f);
+        if (ret) {
+            return ret;
+        }
+        data = qemu_get_be64(f);
+    }
+
+    return ret;
+}
+
 static SaveVMHandlers savevm_vfio_handlers = {
     .save_setup = vfio_save_setup,
     .save_cleanup = vfio_save_cleanup,
     .save_live_pending = vfio_save_pending,
     .save_live_iterate = vfio_save_iterate,
     .save_live_complete_precopy = vfio_save_complete_precopy,
+    .load_setup = vfio_load_setup,
+    .load_cleanup = vfio_load_cleanup,
+    .load_state = vfio_load_state,
 };
 
 /* ---------------------------------------------------------------------- */
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index e21da4773af3..a375efe490f9 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -157,3 +157,7 @@ vfio_save_device_config_state(char *name) " (%s)"
 vfio_save_pending(char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible) " (%s), precopy 0x%"PRIx64" postcopy 0x%x"PRIx64" compatible 0x%"PRIx64
 vfio_save_iterate(char *name, int data_size) " (%s) data_size %d"
 vfio_save_complete_precopy(char *name) " (%s)"
+vfio_load_device_config_state(char *name) " (%s)"
+vfio_load_state(char *name, uint64_t data) " (%s) data 0x%"PRIx64
+vfio_load_state_device_data(char *name, uint64_t data_offset, uint64_t data_size) " (%s), Offset 0x%"PRIx64" size 0x%"PRIx64
+
-- 
2.7.0


