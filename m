Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4EA53236A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 08:42:28 +0200 (CEST)
Received: from localhost ([::1]:57452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntOFP-0006k2-RF
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 02:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNtX-0008V7-RR
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:52 -0400
Received: from mga17.intel.com ([192.55.52.151]:42009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNtU-0000LD-KQ
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653373188; x=1684909188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MmRu2cF6faa9WhIABdn4utJiy2fIgs4rcGrOPQjsIR4=;
 b=L4ujBkxO3isNoko0EJ5O7LazPInr1XHCJXzP/nQe/Ts6VO2q7k7ubX+g
 ga5osH3K1+g2w/OPNH40Zim65mWRSsSwzNgb+iBraP1iBOE75ui0KN8H2
 6GWNSnj8Ny50OhMGEOlAlaY+gf70hiD4uAgtz828C6jWS3u5Zo/bJBht/
 HkzOqNW0AAXORgPw4iMVrtZ1eQ6h3onahqTVameWonwlrhV2H4V0/Oztl
 2Y6yBUbqZ/bfWLI0fdAuMydji/UxIOQi8JZj8R6t1vFB619nozZjLEUZ1
 DnGMy4ikf3Iak/DthCESQi6NRK6Vik2ml2Yw89AsnL+s1IIxoq72XX1bp g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="253943267"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="253943267"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 23:19:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="601059813"
Received: from leirao-pc.bj.intel.com ([10.238.156.102])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2022 23:19:36 -0700
From: Lei Rao <lei.rao@intel.com>
To: alex.williamson@redhat.com, kevin.tian@intel.com, eddie.dong@intel.com,
 jason.zeng@intel.com, quintela@redhat.com, dgilbert@redhat.com,
 yadong.li@intel.com, yi.l.liu@intel.com
Cc: qemu-devel@nongnu.org,
	Lei Rao <lei.rao@intel.com>
Subject: [RFC PATCH 09/13] vfio/migration: move the functions of In-Band
 approach to a new file
Date: Tue, 24 May 2022 14:18:44 +0800
Message-Id: <20220524061848.1615706-10-lei.rao@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524061848.1615706-1-lei.rao@intel.com>
References: <20220524061848.1615706-1-lei.rao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=lei.rao@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Moving the functions of In-Band approach into a new file to match with the new
abstraction layer of migration ops.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Eddie Dong <eddie.dong@intel.com>
---
 hw/vfio/meson.build           |   1 +
 hw/vfio/migration-local.c     | 453 ++++++++++++++++++++++++++++++++++
 hw/vfio/migration.c           | 421 -------------------------------
 include/hw/vfio/vfio-common.h |   1 +
 4 files changed, 455 insertions(+), 421 deletions(-)
 create mode 100644 hw/vfio/migration-local.c

diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
index da9af297a0..5a72b8c349 100644
--- a/hw/vfio/meson.build
+++ b/hw/vfio/meson.build
@@ -3,6 +3,7 @@ vfio_ss.add(files(
   'common.c',
   'spapr.c',
   'migration.c',
+  'migration-local.c',
 ))
 vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
   'display.c',
diff --git a/hw/vfio/migration-local.c b/hw/vfio/migration-local.c
new file mode 100644
index 0000000000..46c8baed50
--- /dev/null
+++ b/hw/vfio/migration-local.c
@@ -0,0 +1,453 @@
+/*
+ * QEMU VFIO Migration Support
+ *
+ * Copyright NVIDIA, Inc. 2020
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "qemu/cutils.h"
+#include <linux/vfio.h>
+#include <sys/ioctl.h>
+
+#include "sysemu/runstate.h"
+#include "hw/vfio/vfio-common.h"
+#include "migration/migration.h"
+#include "migration/vmstate.h"
+#include "migration/qemu-file.h"
+#include "migration/register.h"
+#include "migration/blocker.h"
+#include "migration/misc.h"
+#include "qapi/error.h"
+#include "exec/ramlist.h"
+#include "exec/ram_addr.h"
+#include "pci.h"
+#include "trace.h"
+#include "hw/hw.h"
+#include "ui/console.h"
+
+static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
+                                  off_t off, bool iswrite)
+{
+    int ret;
+
+    ret = iswrite ? pwrite(vbasedev->fd, val, count, off) :
+                    pread(vbasedev->fd, val, count, off);
+    if (ret < count) {
+        error_report("vfio_mig_%s %d byte %s: failed at offset 0x%"
+                     HWADDR_PRIx", err: %s", iswrite ? "write" : "read", count,
+                     vbasedev->name, off, strerror(errno));
+        return (ret < 0) ? ret : -EINVAL;
+    }
+    return 0;
+}
+
+static int vfio_mig_rw(VFIODevice *vbasedev, __u8 *buf, size_t count,
+                       off_t off, bool iswrite)
+{
+    int ret, done = 0;
+    __u8 *tbuf = buf;
+
+    while (count) {
+        int bytes = 0;
+
+        if (count >= 8 && !(off % 8)) {
+            bytes = 8;
+        } else if (count >= 4 && !(off % 4)) {
+            bytes = 4;
+        } else if (count >= 2 && !(off % 2)) {
+            bytes = 2;
+        } else {
+            bytes = 1;
+        }
+
+        ret = vfio_mig_access(vbasedev, tbuf, bytes, off, iswrite);
+        if (ret) {
+            return ret;
+        }
+
+        count -= bytes;
+        done += bytes;
+        off += bytes;
+        tbuf += bytes;
+    }
+    return done;
+}
+
+#define vfio_mig_read(f, v, c, o)       vfio_mig_rw(f, (__u8 *)v, c, o, false)
+#define vfio_mig_write(f, v, c, o)      vfio_mig_rw(f, (__u8 *)v, c, o, true)
+
+#define VFIO_MIG_STRUCT_OFFSET(f)       \
+                                 offsetof(struct vfio_device_migration_info, f)
+/*
+ * Change the device_state register for device @vbasedev. Bits set in @mask
+ * are preserved, bits set in @value are set, and bits not set in either @mask
+ * or @value are cleared in device_state. If the register cannot be accessed,
+ * the resulting state would be invalid, or the device enters an error state,
+ * an error is returned.
+ */
+
+static int vfio_migration_set_state_local(VFIODevice *vbasedev, uint32_t mask,
+                                          uint32_t value)
+{
+    VFIOMigration *migration = vbasedev->migration;
+    VFIORegion *region = &migration->region;
+    off_t dev_state_off = region->fd_offset +
+                          VFIO_MIG_STRUCT_OFFSET(device_state);
+    uint32_t device_state;
+    int ret;
+
+    ret = vfio_mig_read(vbasedev, &device_state, sizeof(device_state),
+                        dev_state_off);
+    if (ret < 0) {
+        return ret;
+    }
+
+    device_state = (device_state & mask) | value;
+
+    if (!VFIO_DEVICE_STATE_VALID(device_state)) {
+        return -EINVAL;
+    }
+
+    ret = vfio_mig_write(vbasedev, &device_state, sizeof(device_state),
+                         dev_state_off);
+    if (ret < 0) {
+        int rret;
+
+        rret = vfio_mig_read(vbasedev, &device_state, sizeof(device_state),
+                             dev_state_off);
+
+        if ((rret < 0) || (VFIO_DEVICE_STATE_IS_ERROR(device_state))) {
+            hw_error("%s: Device in error state 0x%x", vbasedev->name,
+                     device_state);
+            return rret ? rret : -EIO;
+        }
+        return ret;
+    }
+
+    migration->device_state = device_state;
+    trace_vfio_migration_set_state(vbasedev->name, device_state);
+    return 0;
+}
+
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
+static int vfio_migration_save_buffer_local(QEMUFile *f, VFIODevice *vbasedev,
+                                            uint64_t *size)
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
+    trace_vfio_save_buffer_local(vbasedev->name, data_offset, data_size,
+                                 migration->pending_bytes);
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
+static int vfio_migration_load_buffer_local(QEMUFile *f, VFIODevice *vbasedev,
+                                            uint64_t data_size)
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
+        trace_vfio_load_state_device_data_local(vbasedev->name, data_offset,
+                                                size);
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
+static int vfio_migration_update_pending_local(VFIODevice *vbasedev)
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
+static void vfio_migration_cleanup_local(VFIODevice *vbasedev)
+{
+    VFIOMigration *migration = vbasedev->migration;
+
+    if (migration->region.mmaps) {
+        vfio_region_unmap(&migration->region);
+    }
+}
+
+static int vfio_migration_save_setup_local(VFIODevice *vbasedev)
+{
+    VFIOMigration *migration = vbasedev->migration;
+    int ret = -1;
+
+    if (migration->region.mmaps) {
+        /*
+         * Calling vfio_region_mmap() from migration thread. Memory API called
+         * from this function require locking the iothread when called from
+         * outside the main loop thread.
+         */
+        qemu_mutex_lock_iothread();
+        ret = vfio_region_mmap(&migration->region);
+        qemu_mutex_unlock_iothread();
+        if (ret) {
+            error_report("%s: Failed to mmap VFIO migration region: %s",
+                         vbasedev->name, strerror(-ret));
+            error_report("%s: Falling back to slow path", vbasedev->name);
+        }
+    }
+    return ret;
+}
+
+static int vfio_migration_load_setup_local(VFIODevice *vbasedev)
+{
+    VFIOMigration *migration = vbasedev->migration;
+    int ret = -1;
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
+    return ret;
+}
+
+static void vfio_migration_exit_local(VFIODevice *vbasedev)
+{
+    VFIOMigration *migration = vbasedev->migration;
+
+    vfio_region_exit(&migration->region);
+    vfio_region_finalize(&migration->region);
+}
+
+static VFIOMigrationOps vfio_local_method = {
+    .save_setup = vfio_migration_save_setup_local,
+    .load_setup = vfio_migration_load_setup_local,
+    .update_pending = vfio_migration_update_pending_local,
+    .save_buffer = vfio_migration_save_buffer_local,
+    .load_buffer = vfio_migration_load_buffer_local,
+    .set_state = vfio_migration_set_state_local,
+    .cleanup = vfio_migration_cleanup_local,
+    .exit = vfio_migration_exit_local,
+};
+
+int vfio_migration_probe_local(VFIODevice *vbasedev)
+{
+    int ret;
+    Object *obj;
+    struct vfio_region_info *info = NULL;
+    VFIOMigration *migration = vbasedev->migration;
+
+    obj = vbasedev->ops->vfio_get_object(vbasedev);
+    if (!obj) {
+        return -EINVAL;
+    }
+
+    ret = vfio_get_dev_region_info(vbasedev,
+                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
+                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
+                                   &info);
+    if (ret) {
+        return -EINVAL;
+    }
+
+    ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
+                            info->index, "migration");
+    if (ret) {
+        error_report("%s: Failed to setup VFIO migration region %d: %s",
+                     vbasedev->name, info->index, strerror(-ret));
+        goto err;
+    }
+
+    if (!vbasedev->migration->region.size) {
+        error_report("%s: Invalid zero-sized VFIO migration region %d",
+                     vbasedev->name, info->index);
+        ret = -EINVAL;
+        goto err;
+    }
+
+    trace_vfio_migration_probe_local(vbasedev->name, info->index);
+    migration->ops = &vfio_local_method;
+    g_free(info);
+    return 0;
+
+err:
+    vfio_migration_exit_local(vbasedev);
+    g_free(info);
+    return ret;
+}
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 0c67ed85f3..bb62e1ca0e 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -46,311 +46,6 @@
 
 static int64_t bytes_transferred;
 
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
-static int vfio_migration_set_state_local(VFIODevice *vbasedev, uint32_t mask,
-                                          uint32_t value)
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
-    migration->device_state = device_state;
-    trace_vfio_migration_set_state(vbasedev->name, device_state);
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
-static int vfio_migration_save_buffer_local(QEMUFile *f, VFIODevice *vbasedev,
-                                            uint64_t *size)
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
-    trace_vfio_save_buffer_local(vbasedev->name, data_offset, data_size,
-                                 migration->pending_bytes);
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
-    return ret;
-}
-
-static int vfio_migration_load_buffer_local(QEMUFile *f, VFIODevice *vbasedev,
-                                            uint64_t data_size)
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
-        trace_vfio_load_state_device_data_local(vbasedev->name, data_offset,
-                                                size);
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
-static int vfio_migration_update_pending_local(VFIODevice *vbasedev)
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
@@ -395,15 +90,6 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
     return qemu_file_get_error(f);
 }
 
-static void vfio_migration_cleanup_local(VFIODevice *vbasedev)
-{
-    VFIOMigration *migration = vbasedev->migration;
-
-    if (migration->region.mmaps) {
-        vfio_region_unmap(&migration->region);
-    }
-}
-
 static void vfio_migration_cleanup(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
@@ -413,31 +99,6 @@ static void vfio_migration_cleanup(VFIODevice *vbasedev)
     }
 }
 
-/* ---------------------------------------------------------------------- */
-
-static int vfio_migration_save_setup_local(VFIODevice *vbasedev)
-{
-    VFIOMigration *migration = vbasedev->migration;
-    int ret = -1;
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
-    return ret;
-}
-
 static int vfio_save_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -640,23 +301,6 @@ static void vfio_save_state(QEMUFile *f, void *opaque)
     }
 }
 
-static int vfio_migration_load_setup_local(VFIODevice *vbasedev)
-{
-    VFIOMigration *migration = vbasedev->migration;
-    int ret = -1;
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
-    return ret;
-}
-
 static int vfio_load_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -848,14 +492,6 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
     }
 }
 
-static void vfio_migration_exit_local(VFIODevice *vbasedev)
-{
-    VFIOMigration *migration = vbasedev->migration;
-
-    vfio_region_exit(&migration->region);
-    vfio_region_finalize(&migration->region);
-}
-
 static void vfio_migration_exit(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
@@ -914,63 +550,6 @@ static int vfio_migration_register_handlers(VFIODevice *vbasedev)
     return 0;
 }
 
-static VFIOMigrationOps vfio_local_method = {
-    .save_setup = vfio_migration_save_setup_local,
-    .load_setup = vfio_migration_load_setup_local,
-    .update_pending = vfio_migration_update_pending_local,
-    .save_buffer = vfio_migration_save_buffer_local,
-    .load_buffer = vfio_migration_load_buffer_local,
-    .set_state = vfio_migration_set_state_local,
-    .cleanup = vfio_migration_cleanup_local,
-    .exit = vfio_migration_exit_local,
-};
-
-static int vfio_migration_probe_local(VFIODevice *vbasedev)
-{
-    int ret;
-    Object *obj;
-    struct vfio_region_info *info = NULL;
-    VFIOMigration *migration = vbasedev->migration;
-
-    obj = vbasedev->ops->vfio_get_object(vbasedev);
-    if (!obj) {
-        return -EINVAL;
-    }
-
-    ret = vfio_get_dev_region_info(vbasedev,
-                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
-                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
-                                   &info);
-    if (ret) {
-        return -EINVAL;
-    }
-
-    ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
-                            info->index, "migration");
-    if (ret) {
-        error_report("%s: Failed to setup VFIO migration region %d: %s",
-                     vbasedev->name, info->index, strerror(-ret));
-        goto err;
-    }
-
-    if (!vbasedev->migration->region.size) {
-        error_report("%s: Invalid zero-sized VFIO migration region %d",
-                     vbasedev->name, info->index);
-        ret = -EINVAL;
-        goto err;
-    }
-
-    trace_vfio_migration_probe_local(vbasedev->name, info->index);
-    migration->ops = &vfio_local_method;
-    g_free(info);
-    return 0;
-
-err:
-    vfio_migration_exit_local(vbasedev);
-    g_free(info);
-    return ret;
-}
-
 /* ---------------------------------------------------------------------- */
 
 int64_t vfio_mig_bytes_transferred(void)
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 8ef85a871c..be8adf890f 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -256,6 +256,7 @@ int vfio_spapr_remove_window(VFIOContainer *container,
                              hwaddr offset_within_address_space);
 
 int vfio_migration_probe(VFIODevice *vbasedev, Error **errp);
+int vfio_migration_probe_local(VFIODevice *vbasedev);
 void vfio_migration_finalize(VFIODevice *vbasedev);
 
 #endif /* HW_VFIO_VFIO_COMMON_H */
-- 
2.32.0


