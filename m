Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5A029D11E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 17:50:52 +0100 (CET)
Received: from localhost ([::1]:36220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXoex-0000c0-Sw
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 12:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kXoUs-0005Uz-7q
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 12:40:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kXoUp-0000rh-Uk
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 12:40:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603903222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JS6BygVgKH+LlseFanHI0OvXnfjYAbudYQ3qoozHrJU=;
 b=ZFefK42PBGoaPkhqkgI727DfR3feFrVQzSf7nTgTNmaAM0OUcA2M4ClVTgUMh51D7awt9q
 y71SvAeYOmKil+C3hFXW7w2wbwbtF/GJOZnBEIlpLTBBog0r8AK1Rl7XhOkIf6cKK2v8ER
 EkCv5Xjf7oKZUL+GCY0KiEzibC75YbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-PlNrMhKsMUSXd-yQjlI4dg-1; Wed, 28 Oct 2020 12:40:18 -0400
X-MC-Unique: PlNrMhKsMUSXd-yQjlI4dg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52C108EBA09;
 Wed, 28 Oct 2020 16:40:17 +0000 (UTC)
Received: from gimli.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E36355B4B2;
 Wed, 28 Oct 2020 16:40:13 +0000 (UTC)
Subject: [PULL v2 05/32] vfio: Add VM state change handler to know state of VM
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Oct 2020 10:40:13 -0600
Message-ID: <160390321357.12234.17390014594711702291.stgit@gimli.home>
In-Reply-To: <160390309510.12234.8858324597971641979.stgit@gimli.home>
References: <160390309510.12234.8858324597971641979.stgit@gimli.home>
User-Agent: StGit/0.21-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:50:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Neo Jia <cjia@nvidia.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kirti Wankhede <kwankhede@nvidia.com>

VM state change handler is called on change in VM's state. Based on
VM state, VFIO device state should be changed.
Added read/write helper functions for migration region.
Added function to set device_state.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
[aw: lx -> HWADDR_PRIx, remove redundant parens]
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/migration.c           |  160 +++++++++++++++++++++++++++++++++++++++++
 hw/vfio/trace-events          |    2 +
 include/hw/vfio/vfio-common.h |    4 +
 3 files changed, 166 insertions(+)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index fd7faf423cdc..e1ffae05e288 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -10,6 +10,7 @@
 #include "qemu/osdep.h"
 #include <linux/vfio.h>
 
+#include "sysemu/runstate.h"
 #include "hw/vfio/vfio-common.h"
 #include "cpu.h"
 #include "migration/migration.h"
@@ -22,6 +23,157 @@
 #include "exec/ram_addr.h"
 #include "pci.h"
 #include "trace.h"
+#include "hw/hw.h"
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
+static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
+                                    uint32_t value)
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
+static void vfio_vmstate_change(void *opaque, int running, RunState state)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+    uint32_t value, mask;
+    int ret;
+
+    if (vbasedev->migration->vm_running == running) {
+        return;
+    }
+
+    if (running) {
+        /*
+         * Here device state can have one of _SAVING, _RESUMING or _STOP bit.
+         * Transition from _SAVING to _RUNNING can happen if there is migration
+         * failure, in that case clear _SAVING bit.
+         * Transition from _RESUMING to _RUNNING occurs during resuming
+         * phase, in that case clear _RESUMING bit.
+         * In both the above cases, set _RUNNING bit.
+         */
+        mask = ~VFIO_DEVICE_STATE_MASK;
+        value = VFIO_DEVICE_STATE_RUNNING;
+    } else {
+        /*
+         * Here device state could be either _RUNNING or _SAVING|_RUNNING. Reset
+         * _RUNNING bit
+         */
+        mask = ~VFIO_DEVICE_STATE_RUNNING;
+        value = 0;
+    }
+
+    ret = vfio_migration_set_state(vbasedev, mask, value);
+    if (ret) {
+        /*
+         * Migration should be aborted in this case, but vm_state_notify()
+         * currently does not support reporting failures.
+         */
+        error_report("%s: Failed to set device state 0x%x", vbasedev->name,
+                     (migration->device_state & mask) | value);
+        qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
+    }
+    vbasedev->migration->vm_running = running;
+    trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
+            (migration->device_state & mask) | value);
+}
 
 static void vfio_migration_exit(VFIODevice *vbasedev)
 {
@@ -38,6 +190,7 @@ static int vfio_migration_init(VFIODevice *vbasedev,
 {
     int ret;
     Object *obj;
+    VFIOMigration *migration;
 
     if (!vbasedev->ops->vfio_get_object) {
         return -EINVAL;
@@ -64,6 +217,10 @@ static int vfio_migration_init(VFIODevice *vbasedev,
         ret = -EINVAL;
         goto err;
     }
+
+    migration = vbasedev->migration;
+    migration->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
+                                                           vbasedev);
     return 0;
 
 err:
@@ -111,6 +268,9 @@ add_blocker:
 void vfio_migration_finalize(VFIODevice *vbasedev)
 {
     if (vbasedev->migration) {
+        VFIOMigration *migration = vbasedev->migration;
+
+        qemu_del_vm_change_state_handler(migration->vm_state);
         vfio_migration_exit(vbasedev);
     }
 
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 9ced5ec6277c..41de81f12f60 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -148,3 +148,5 @@ vfio_display_edid_write_error(void) ""
 
 # migration.c
 vfio_migration_probe(const char *name, uint32_t index) " (%s) Region %d"
+vfio_migration_set_state(const char *name, uint32_t state) " (%s) state %d"
+vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 8275c4c68f45..9a571f1fb552 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -29,6 +29,7 @@
 #ifdef CONFIG_LINUX
 #include <linux/vfio.h>
 #endif
+#include "sysemu/sysemu.h"
 
 #define VFIO_MSG_PREFIX "vfio %s: "
 
@@ -58,7 +59,10 @@ typedef struct VFIORegion {
 } VFIORegion;
 
 typedef struct VFIOMigration {
+    VMChangeStateEntry *vm_state;
     VFIORegion region;
+    uint32_t device_state;
+    int vm_running;
 } VFIOMigration;
 
 typedef struct VFIOAddressSpace {


