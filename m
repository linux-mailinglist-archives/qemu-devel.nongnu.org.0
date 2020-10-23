Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7BC296D79
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 13:19:42 +0200 (CEST)
Received: from localhost ([::1]:42228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVv6j-0004pQ-5s
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 07:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kVv24-0000Me-NS
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 07:14:52 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:8460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kVv22-0007SZ-Iu
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 07:14:52 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f92bb1d0000>; Fri, 23 Oct 2020 04:14:37 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 23 Oct
 2020 11:14:39 +0000
Received: from kwankhede-dev.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 23 Oct 2020 11:14:31 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH v28 09/17] vfio: Add load state functions to SaveVMHandlers
Date: Fri, 23 Oct 2020 16:10:35 +0530
Message-ID: <1603449643-12851-10-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1603449643-12851-1-git-send-email-kwankhede@nvidia.com>
References: <1603449643-12851-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1603451677; bh=8ysAm7jR2GvH1UasZy6D6A+KrT62Hj+LzdaCp6e3NeI=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:X-NVConfidentiality:MIME-Version:Content-Type;
 b=goQSfX4br2bqfmCIAryocKXGarfFr5f8+0o0pcV0roS84pjthZyqllVQaNBIccgWU
 RRPC7S4iba7Tfr9X/zC9TO12kFqdT8YKUWcGe9jWXNSq53YC8Q8ghiybXRwodQ4IRN
 FG7CHeeNlnXukAURgJ7L0X62Ki5uNjuuS93q6QalA/L1sGNPIqVStAmsUJV0/r4zj+
 gW5WbRMCP1IZr1QFn58lLTWrsniRYTrRk06h5zUgAddCDcUEKkb8bhOhlRDdcwaZTd
 tTvN+FCJukcBe3yAw0JOJwCK/l3SRUPjdnNZqA97NkfAroEXKoW2f1o/At1eQl5uCg
 GT9SxSAhAwzqg==
Received-SPF: pass client-ip=216.228.121.65; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate26.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 07:14:11
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: cohuck@redhat.com, zhi.wang.linux@gmail.com, aik@ozlabs.ru,
 Zhengxiao.zx@Alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, peterx@redhat.com,
 Kirti Wankhede <kwankhede@nvidia.com>, eauger@redhat.com, artemp@nvidia.com,
 yi.l.liu@intel.com, quintela@redhat.com, ziye.yang@intel.com,
 armbru@redhat.com, mlevitsk@redhat.com, pasic@linux.ibm.com,
 felipe@nutanix.com, zhi.a.wang@intel.com, mcrossley@nvidia.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, dgilbert@redhat.com,
 changpeng.liu@intel.com, eskultet@redhat.com, Ken.Xue@amd.com,
 jonathan.davies@nutanix.com, pbonzini@redhat.com, dnigam@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sequence  during _RESUMING device state:
While data for this device is available, repeat below steps:
a. read data_offset from where user application should write data.
b. write data of data_size to migration region from data_offset.
c. write data_size which indicates vendor driver that data is written in
   staging buffer.

For user, data is opaque. User should write data in the same order as
received.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/vfio/migration.c  | 195 +++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/trace-events |   4 ++
 2 files changed, 199 insertions(+)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index be9e4aba541d..240646592b39 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -257,6 +257,77 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
     return ret;
 }
 
+static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
+                            uint64_t data_size)
+{
+    VFIORegion *region = &vbasedev->migration->region;
+    uint64_t data_offset = 0, size, report_size;
+    int ret;
+
+    do {
+        ret = vfio_mig_read(vbasedev, &data_offset, sizeof(data_offset),
+                      region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_offset));
+        if (ret < 0) {
+            return ret;
+        }
+
+        if (data_offset + data_size > region->size) {
+            /*
+             * If data_size is greater than the data section of migration region
+             * then iterate the write buffer operation. This case can occur if
+             * size of migration region at destination is smaller than size of
+             * migration region at source.
+             */
+            report_size = size = region->size - data_offset;
+            data_size -= size;
+        } else {
+            report_size = size = data_size;
+            data_size = 0;
+        }
+
+        trace_vfio_load_state_device_data(vbasedev->name, data_offset, size);
+
+        while (size) {
+            void *buf;
+            uint64_t sec_size;
+            bool buf_alloc = false;
+
+            buf = get_data_section_size(region, data_offset, size, &sec_size);
+
+            if (!buf) {
+                buf = g_try_malloc(sec_size);
+                if (!buf) {
+                    error_report("%s: Error allocating buffer ", __func__);
+                    return -ENOMEM;
+                }
+                buf_alloc = true;
+            }
+
+            qemu_get_buffer(f, buf, sec_size);
+
+            if (buf_alloc) {
+                ret = vfio_mig_write(vbasedev, buf, sec_size,
+                        region->fd_offset + data_offset);
+                g_free(buf);
+
+                if (ret < 0) {
+                    return ret;
+                }
+            }
+            size -= sec_size;
+            data_offset += sec_size;
+        }
+
+        ret = vfio_mig_write(vbasedev, &report_size, sizeof(report_size),
+                        region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_size));
+        if (ret < 0) {
+            return ret;
+        }
+    } while (data_size);
+
+    return 0;
+}
+
 static int vfio_update_pending(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
@@ -293,6 +364,33 @@ static int vfio_save_device_config_state(QEMUFile *f, void *opaque)
     return qemu_file_get_error(f);
 }
 
+static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    uint64_t data;
+
+    if (vbasedev->ops && vbasedev->ops->vfio_load_config) {
+        int ret;
+
+        ret = vbasedev->ops->vfio_load_config(vbasedev, f);
+        if (ret) {
+            error_report("%s: Failed to load device config space",
+                         vbasedev->name);
+            return ret;
+        }
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
 static void vfio_migration_cleanup(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
@@ -483,12 +581,109 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
     return ret;
 }
 
+static int vfio_load_setup(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+    int ret = 0;
+
+    if (migration->region.mmaps) {
+        ret = vfio_region_mmap(&migration->region);
+        if (ret) {
+            error_report("%s: Failed to mmap VFIO migration region %d: %s",
+                         vbasedev->name, migration->region.nr,
+                         strerror(-ret));
+            error_report("%s: Falling back to slow path", vbasedev->name);
+        }
+    }
+
+    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_MASK,
+                                   VFIO_DEVICE_STATE_RESUMING);
+    if (ret) {
+        error_report("%s: Failed to set state RESUMING", vbasedev->name);
+        if (migration->region.mmaps) {
+            vfio_region_unmap(&migration->region);
+        }
+    }
+    return ret;
+}
+
+static int vfio_load_cleanup(void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+
+    vfio_migration_cleanup(vbasedev);
+    trace_vfio_load_cleanup(vbasedev->name);
+    return 0;
+}
+
+static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
+{
+    VFIODevice *vbasedev = opaque;
+    int ret = 0;
+    uint64_t data;
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
+            uint64_t data_size = qemu_get_be64(f);
+
+            if (data_size) {
+                ret = vfio_load_buffer(f, vbasedev, data_size);
+                if (ret < 0) {
+                    return ret;
+                }
+            }
+            break;
+        }
+        default:
+            error_report("%s: Unknown tag 0x%"PRIx64, vbasedev->name, data);
+            return -EINVAL;
+        }
+
+        data = qemu_get_be64(f);
+        ret = qemu_file_get_error(f);
+        if (ret) {
+            return ret;
+        }
+    }
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
index 9f5712dab1ea..a75b5208818c 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -159,3 +159,7 @@ vfio_save_device_config_state(const char *name) " (%s)"
 vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64
 vfio_save_iterate(const char *name, int data_size) " (%s) data_size %d"
 vfio_save_complete_precopy(const char *name) " (%s)"
+vfio_load_device_config_state(const char *name) " (%s)"
+vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
+vfio_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
+vfio_load_cleanup(const char *name) " (%s)"
-- 
2.7.0


