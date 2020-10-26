Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460D1298A76
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 11:36:52 +0100 (CET)
Received: from localhost ([::1]:33690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kWzrv-0006el-9w
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 06:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kWzTA-0000aN-EZ
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 06:11:16 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:13315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kWzT6-0008SI-Rc
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 06:11:15 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f96a0c70000>; Mon, 26 Oct 2020 03:11:19 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 26 Oct
 2020 10:11:05 +0000
Received: from kwankhede-dev.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 26 Oct 2020 10:10:56 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH v29 08/17] vfio: Add save state functions to SaveVMHandlers
Date: Mon, 26 Oct 2020 15:06:18 +0530
Message-ID: <1603704987-20977-9-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1603704987-20977-1-git-send-email-kwankhede@nvidia.com>
References: <1603704987-20977-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1603707079; bh=uwM42IX+ysYKWP5OnzyUf5brahWB8ZzE7Ks3G0gOwMA=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:X-NVConfidentiality:MIME-Version:Content-Type;
 b=Svvlbm6mXEVYu28SeiwrMYb/vrWtIsGVlxNTGl2av+XelPgTSTWCcgLXjX1rjm9U7
 bnUuT6DFfn1rCQklylSCOD42AYmdUXDD+MD1I+0fb2Td6KzXtJvRCS5xm2q92jFdVG
 0rPO53e3aysjOl9/SEZMqUB41eRRVy4orV1WBhwe348jnR8YeYz+xvVRa7xZnwHFF6
 gD9qO2dvY2ojOrSc4wHSiWpHwn8uzBbAIr43sbzFfCmnLpgBFek8w2nlZbaV7E7gcI
 1X+ZBd/X7kO9rqEuccqU54/sjZnpvnj821eOqnWtPQhmHJluWtwRdrvJd9Jf7NNxjL
 MrEUDzJTrPsBA==
Received-SPF: pass client-ip=216.228.121.143;
 envelope-from=kwankhede@nvidia.com; helo=hqnvemgate24.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 06:10:03
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

Added .save_live_pending, .save_live_iterate and .save_live_complete_precopy
functions. These functions handles pre-copy and stop-and-copy phase.

In _SAVING|_RUNNING device state or pre-copy phase:
- read pending_bytes. If pending_bytes > 0, go through below steps.
- read data_offset - indicates kernel driver to write data to staging
  buffer.
- read data_size - amount of data in bytes written by vendor driver in
  migration region.
- read data_size bytes of data from data_offset in the migration region.
- Write data packet to file stream as below:
{VFIO_MIG_FLAG_DEV_DATA_STATE, data_size, actual data,
VFIO_MIG_FLAG_END_OF_STATE }

In _SAVING device state or stop-and-copy phase
a. read config space of device and save to migration file stream. This
   doesn't need to be from vendor driver. Any other special config state
   from driver can be saved as data in following iteration.
b. read pending_bytes. If pending_bytes > 0, go through below steps.
c. read data_offset - indicates kernel driver to write data to staging
   buffer.
d. read data_size - amount of data in bytes written by vendor driver in
   migration region.
e. read data_size bytes of data from data_offset in the migration region.
f. Write data packet as below:
   {VFIO_MIG_FLAG_DEV_DATA_STATE, data_size, actual data}
g. iterate through steps b to f while (pending_bytes > 0)
h. Write {VFIO_MIG_FLAG_END_OF_STATE}

When data region is mapped, its user's responsibility to read data from
data_offset of data_size before moving to next steps.

Added fix suggested by Artem Polyakov to reset pending_bytes in
vfio_save_iterate().
Added fix suggested by Zhi Wang to add 0 as data size in migration stream and
add END_OF_STATE delimiter to indicate phase complete.

Suggested-by: Artem Polyakov <artemp@nvidia.com>
Suggested-by: Zhi Wang <zhi.wang.linux@gmail.com>
Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
---
 hw/vfio/migration.c           | 276 ++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/trace-events          |   6 +
 include/hw/vfio/vfio-common.h |   1 +
 3 files changed, 283 insertions(+)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index d3ef9e18f39c..41d568558479 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -148,6 +148,151 @@ static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
     return 0;
 }
 
+static void *get_data_section_size(VFIORegion *region, uint64_t data_offset,
+                                   uint64_t data_size, uint64_t *size)
+{
+    void *ptr = NULL;
+    uint64_t limit = 0;
+    int i;
+
+    if (!region->mmaps) {
+        if (size) {
+            *size = MIN(data_size, region->size - data_offset);
+        }
+        return ptr;
+    }
+
+    for (i = 0; i < region->nr_mmaps; i++) {
+        VFIOMmap *map = region->mmaps + i;
+
+        if ((data_offset >= map->offset) &&
+            (data_offset < map->offset + map->size)) {
+
+            /* check if data_offset is within sparse mmap areas */
+            ptr = map->mmap + data_offset - map->offset;
+            if (size) {
+                *size = MIN(data_size, map->offset + map->size - data_offset);
+            }
+            break;
+        } else if ((data_offset < map->offset) &&
+                   (!limit || limit > map->offset)) {
+            /*
+             * data_offset is not within sparse mmap areas, find size of
+             * non-mapped area. Check through all list since region->mmaps list
+             * is not sorted.
+             */
+            limit = map->offset;
+        }
+    }
+
+    if (!ptr && size) {
+        *size = limit ? MIN(data_size, limit - data_offset) : data_size;
+    }
+    return ptr;
+}
+
+static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
+{
+    VFIOMigration *migration = vbasedev->migration;
+    VFIORegion *region = &migration->region;
+    uint64_t data_offset = 0, data_size = 0, sz;
+    int ret;
+
+    ret = vfio_mig_read(vbasedev, &data_offset, sizeof(data_offset),
+                      region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_offset));
+    if (ret < 0) {
+        return ret;
+    }
+
+    ret = vfio_mig_read(vbasedev, &data_size, sizeof(data_size),
+                        region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_size));
+    if (ret < 0) {
+        return ret;
+    }
+
+    trace_vfio_save_buffer(vbasedev->name, data_offset, data_size,
+                           migration->pending_bytes);
+
+    qemu_put_be64(f, data_size);
+    sz = data_size;
+
+    while (sz) {
+        void *buf;
+        uint64_t sec_size;
+        bool buf_allocated = false;
+
+        buf = get_data_section_size(region, data_offset, sz, &sec_size);
+
+        if (!buf) {
+            buf = g_try_malloc(sec_size);
+            if (!buf) {
+                error_report("%s: Error allocating buffer ", __func__);
+                return -ENOMEM;
+            }
+            buf_allocated = true;
+
+            ret = vfio_mig_read(vbasedev, buf, sec_size,
+                                region->fd_offset + data_offset);
+            if (ret < 0) {
+                g_free(buf);
+                return ret;
+            }
+        }
+
+        qemu_put_buffer(f, buf, sec_size);
+
+        if (buf_allocated) {
+            g_free(buf);
+        }
+        sz -= sec_size;
+        data_offset += sec_size;
+    }
+
+    ret = qemu_file_get_error(f);
+
+    if (!ret && size) {
+        *size = data_size;
+    }
+
+    return ret;
+}
+
+static int vfio_update_pending(VFIODevice *vbasedev)
+{
+    VFIOMigration *migration = vbasedev->migration;
+    VFIORegion *region = &migration->region;
+    uint64_t pending_bytes = 0;
+    int ret;
+
+    ret = vfio_mig_read(vbasedev, &pending_bytes, sizeof(pending_bytes),
+                    region->fd_offset + VFIO_MIG_STRUCT_OFFSET(pending_bytes));
+    if (ret < 0) {
+        migration->pending_bytes = 0;
+        return ret;
+    }
+
+    migration->pending_bytes = pending_bytes;
+    trace_vfio_update_pending(vbasedev->name, pending_bytes);
+    return 0;
+}
+
+static int vfio_save_device_config_state(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+
+    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_CONFIG_STATE);
+
+    if (vbasedev->ops && vbasedev->ops->vfio_save_config) {
+        vbasedev->ops->vfio_save_config(vbasedev, f);
+    }
+
+    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
+
+    trace_vfio_save_device_config_state(vbasedev->name);
+
+    return qemu_file_get_error(f);
+}
+
 static void vfio_migration_cleanup(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
@@ -210,9 +355,140 @@ static void vfio_save_cleanup(void *opaque)
     trace_vfio_save_cleanup(vbasedev->name);
 }
 
+static void vfio_save_pending(QEMUFile *f, void *opaque,
+                              uint64_t threshold_size,
+                              uint64_t *res_precopy_only,
+                              uint64_t *res_compatible,
+                              uint64_t *res_postcopy_only)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+    int ret;
+
+    ret = vfio_update_pending(vbasedev);
+    if (ret) {
+        return;
+    }
+
+    *res_precopy_only += migration->pending_bytes;
+
+    trace_vfio_save_pending(vbasedev->name, *res_precopy_only,
+                            *res_postcopy_only, *res_compatible);
+}
+
+static int vfio_save_iterate(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+    uint64_t data_size;
+    int ret;
+
+    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
+
+    if (migration->pending_bytes == 0) {
+        ret = vfio_update_pending(vbasedev);
+        if (ret) {
+            return ret;
+        }
+
+        if (migration->pending_bytes == 0) {
+            qemu_put_be64(f, 0);
+            qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
+            /* indicates data finished, goto complete phase */
+            return 1;
+        }
+    }
+
+    ret = vfio_save_buffer(f, vbasedev, &data_size);
+    if (ret) {
+        error_report("%s: vfio_save_buffer failed %s", vbasedev->name,
+                     strerror(errno));
+        return ret;
+    }
+
+    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
+
+    ret = qemu_file_get_error(f);
+    if (ret) {
+        return ret;
+    }
+
+    /*
+     * Reset pending_bytes as .save_live_pending is not called during savevm or
+     * snapshot case, in such case vfio_update_pending() at the start of this
+     * function updates pending_bytes.
+     */
+    migration->pending_bytes = 0;
+    trace_vfio_save_iterate(vbasedev->name, data_size);
+    return 0;
+}
+
+static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+    uint64_t data_size;
+    int ret;
+
+    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_RUNNING,
+                                   VFIO_DEVICE_STATE_SAVING);
+    if (ret) {
+        error_report("%s: Failed to set state STOP and SAVING",
+                     vbasedev->name);
+        return ret;
+    }
+
+    ret = vfio_save_device_config_state(f, opaque);
+    if (ret) {
+        return ret;
+    }
+
+    ret = vfio_update_pending(vbasedev);
+    if (ret) {
+        return ret;
+    }
+
+    while (migration->pending_bytes > 0) {
+        qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
+        ret = vfio_save_buffer(f, vbasedev, &data_size);
+        if (ret < 0) {
+            error_report("%s: Failed to save buffer", vbasedev->name);
+            return ret;
+        }
+
+        if (data_size == 0) {
+            break;
+        }
+
+        ret = vfio_update_pending(vbasedev);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
+
+    ret = qemu_file_get_error(f);
+    if (ret) {
+        return ret;
+    }
+
+    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_SAVING, 0);
+    if (ret) {
+        error_report("%s: Failed to set state STOPPED", vbasedev->name);
+        return ret;
+    }
+
+    trace_vfio_save_complete_precopy(vbasedev->name);
+    return ret;
+}
+
 static SaveVMHandlers savevm_vfio_handlers = {
     .save_setup = vfio_save_setup,
     .save_cleanup = vfio_save_cleanup,
+    .save_live_pending = vfio_save_pending,
+    .save_live_iterate = vfio_save_iterate,
+    .save_live_complete_precopy = vfio_save_complete_precopy,
 };
 
 /* ---------------------------------------------------------------------- */
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index f148b5e828c1..9f5712dab1ea 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -153,3 +153,9 @@ vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t
 vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
 vfio_save_setup(const char *name) " (%s)"
 vfio_save_cleanup(const char *name) " (%s)"
+vfio_save_buffer(const char *name, uint64_t data_offset, uint64_t data_size, uint64_t pending) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64" pending 0x%"PRIx64
+vfio_update_pending(const char *name, uint64_t pending) " (%s) pending 0x%"PRIx64
+vfio_save_device_config_state(const char *name) " (%s)"
+vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64
+vfio_save_iterate(const char *name, int data_size) " (%s) data_size %d"
+vfio_save_complete_precopy(const char *name) " (%s)"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 2bd593ba38bb..f4ebdae013ad 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -65,6 +65,7 @@ typedef struct VFIOMigration {
     uint32_t device_state;
     int vm_running;
     Notifier migration_state;
+    uint64_t pending_bytes;
 } VFIOMigration;
 
 typedef struct VFIOAddressSpace {
-- 
2.7.0


