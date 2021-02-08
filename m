Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040013144F2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:31:52 +0100 (CET)
Received: from localhost ([::1]:48628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GwZ-0003xz-1W
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:31:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1l9GBW-0001NJ-VA
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 18:43:15 -0500
Received: from mga06.intel.com ([134.134.136.31]:53603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1l9GBP-0002m2-UP
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 18:43:14 -0500
IronPort-SDR: jTzEJ/nRsmOT7oSEhfwX29aCQj4f5oYLpiAKN0YKmQiCCc1+F+9a6gcjKgkOL2HLUMc8eMPAQS
 HoVps/7MBgHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="243298080"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="243298080"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:42:59 -0800
IronPort-SDR: eQ/dSLbnECex2hN+pfU/gFKxfjyF3uJzkH2eBSCnlMDrKrLk0odgoayMuttLBfd5M0xUWbtP3m
 1yqQR2M7C4Nw==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="585858969"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:42:59 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC 1/1] vhost-vdmabuf: Add virtio based Dmabuf device
Date: Mon,  8 Feb 2021 15:32:25 -0800
Message-Id: <20210208233225.2084469-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208233225.2084469-1-vivek.kasireddy@intel.com>
References: <20210208233225.2084469-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=vivek.kasireddy@intel.com; helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, kraxel@redhat.com,
 dongwon.kim@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch provides the implementation of the virtio dmabuf device
that is used to share a dmabuf created in the Guest with the Host.
Once the vhost vdmabuf kernel driver on the Host alerts Qemu about
a new dmabuf from the Guest, it is first imported and then converted
into a texture using EGL and eventually displayed on the screen.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 configure                                   |   8 +
 hw/virtio/meson.build                       |   1 +
 hw/virtio/vhost-backend.c                   |  10 +
 hw/virtio/vhost-vdmabuf.c                   | 526 ++++++++++++++++++++
 include/hw/pci/pci.h                        |   1 +
 include/hw/virtio/vhost-backend.h           |   2 +
 include/hw/virtio/vhost-vdmabuf.h           |  76 +++
 include/standard-headers/linux/virtio_ids.h |   1 +
 include/ui/console.h                        |   1 +
 linux-headers/linux/vhost.h                 |   3 +
 meson.build                                 |   1 +
 ui/console.c                                |   7 +
 12 files changed, 637 insertions(+)
 create mode 100644 hw/virtio/vhost-vdmabuf.c
 create mode 100644 include/hw/virtio/vhost-vdmabuf.h

diff --git a/configure b/configure
index a34f91171d..90a35317bf 100755
--- a/configure
+++ b/configure
@@ -345,6 +345,7 @@ vhost_net="$default_feature"
 vhost_crypto="$default_feature"
 vhost_scsi="$default_feature"
 vhost_vsock="$default_feature"
+vhost_vdmabuf="$default_feature"
 vhost_user="no"
 vhost_user_blk_server="auto"
 vhost_user_fs="$default_feature"
@@ -1263,6 +1264,10 @@ for opt do
   ;;
   --enable-vhost-vsock) vhost_vsock="yes"
   ;;
+  --disable-vhost-vdmabuf) vhost_vdmabuf="no"
+  ;;
+  --enable-vhost-vdmabuf) vhost_vdmabuf="yes"
+  ;;
   --disable-vhost-user-blk-server) vhost_user_blk_server="disabled"
   ;;
   --enable-vhost-user-blk-server) vhost_user_blk_server="enabled"
@@ -5766,6 +5771,9 @@ if test "$vhost_vsock" = "yes" ; then
     echo "CONFIG_VHOST_USER_VSOCK=y" >> $config_host_mak
   fi
 fi
+if test "$vhost_vdmabuf" = "yes" ; then
+  echo "CONFIG_VHOST_VDMABUF=y" >> $config_host_mak
+fi
 if test "$vhost_kernel" = "yes" ; then
   echo "CONFIG_VHOST_KERNEL=y" >> $config_host_mak
 fi
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index fbff9bc9d4..f2f5408fda 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -21,6 +21,7 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs.c'))
 virtio_ss.add(when: ['CONFIG_VHOST_USER_FS', 'CONFIG_VIRTIO_PCI'], if_true: files('vhost-user-fs-pci.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('virtio-pmem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock.c', 'vhost-vsock-common.c'))
+virtio_ss.add(when: 'CONFIG_VHOST_VDMABUF', if_true: files('vhost-vdmabuf.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock.c', 'vhost-vsock-common.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index 31b33bde37..39a64e101d 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -214,6 +214,13 @@ static int vhost_kernel_vsock_set_running(struct vhost_dev *dev, int start)
 }
 #endif /* CONFIG_VHOST_VSOCK */
 
+#ifdef CONFIG_VHOST_VDMABUF
+static int vhost_kernel_vdmabuf_set_running(struct vhost_dev *dev, int start)
+{
+    return vhost_kernel_call(dev, VHOST_VDMABUF_SET_RUNNING, &start);
+}
+#endif /* CONFIG_VHOST_VDMABUF */
+
 static void vhost_kernel_iotlb_read(void *opaque)
 {
     struct vhost_dev *dev = opaque;
@@ -321,6 +328,9 @@ static const VhostOps kernel_ops = {
         .vhost_vsock_set_guest_cid = vhost_kernel_vsock_set_guest_cid,
         .vhost_vsock_set_running = vhost_kernel_vsock_set_running,
 #endif /* CONFIG_VHOST_VSOCK */
+#ifdef CONFIG_VHOST_VDMABUF
+        .vhost_vdmabuf_set_running = vhost_kernel_vdmabuf_set_running,
+#endif /* CONFIG_VHOST_VDMABUF */
         .vhost_set_iotlb_callback = vhost_kernel_set_iotlb_callback,
         .vhost_send_device_iotlb_msg = vhost_kernel_send_device_iotlb_msg,
 };
diff --git a/hw/virtio/vhost-vdmabuf.c b/hw/virtio/vhost-vdmabuf.c
new file mode 100644
index 0000000000..06890e6b2a
--- /dev/null
+++ b/hw/virtio/vhost-vdmabuf.c
@@ -0,0 +1,526 @@
+/*
+ * Implementation of Virtio based Dmabuf device -- mostly inspired by
+ * vfio/display.c and vhost-vsock.c.
+ *
+ * Copyright 2021 Intel Corporation.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include <sys/ioctl.h>
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/typedefs.h"
+#include "monitor/monitor.h"
+#include "virtio-pci.h"
+#include "qemu/module.h"
+#include "qemu/uuid.h"
+#include "sysemu/sysemu.h"
+#include "ui/console.h"
+#include "qapi/error.h"
+#include "trace.h"
+
+#include "standard-headers/linux/virtio_ids.h"
+#include "standard-headers/drm/drm_fourcc.h"
+#include "hw/qdev-properties.h"
+
+#include "hw/virtio/virtio.h"
+#include "hw/virtio/vhost.h"
+#include "hw/virtio/virtio-access.h"
+#include "hw/virtio/vhost-vdmabuf.h"
+
+#define TYPE_VHOST_VDMABUF "vhost-vdmabuf"
+#define VHOST_VDMABUF(obj) \
+        OBJECT_CHECK(VHostVdmabuf, (obj), TYPE_VHOST_VDMABUF)
+
+#define TYPE_VHOST_VDMABUF_PCI "vhost-vdmabuf-pci-base"
+#define VHOST_VDMABUF_PCI(obj) \
+        OBJECT_CHECK(VHostVdmabufPCI, (obj), TYPE_VHOST_VDMABUF_PCI)
+
+#define VHOST_VDMABUF_QUEUE_SIZE 128
+#define QEMU_UUID_SIZE_BYTES 16
+
+static bool have_event = false;
+
+typedef struct VHostVdmabufPCI VHostVdmabufPCI;
+
+typedef struct VDMABUFDMABuf {
+    QemuDmaBuf buf;
+    QemuUUID dmabuf_id;
+    QTAILQ_ENTRY(VDMABUFDMABuf) next;
+} VDMABUFDMABuf;
+
+typedef struct VDMABUFDisplay {
+    QemuConsole *con;
+    DisplaySurface *surface;
+    struct {
+        QTAILQ_HEAD(, VDMABUFDMABuf) bufs;
+        VDMABUFDMABuf *guest_fb;
+    } dmabuf;
+} VDMABUFDisplay;
+
+typedef struct {
+    VirtIODevice parent;
+
+    struct vhost_dev vhost_dev;
+    struct vhost_virtqueue vhost_vqs[2];
+
+    VirtQueue *send_vq;
+    VirtQueue *recv_vq;
+    VDMABUFDisplay *dpy;
+    int vhostfd;
+} VHostVdmabuf;
+
+struct VHostVdmabufPCI {
+    VirtIOPCIProxy parent_obj;
+    VHostVdmabuf vdev;
+};
+
+typedef struct VDMABUFBlob {
+    uint32_t width;
+    uint32_t height;
+    uint32_t stride;
+    uint32_t format;
+    uint64_t modifier;
+} VDMABUFBlob;
+
+static int vhost_vdmabuf_start(VirtIODevice *vdev)
+{
+    VHostVdmabuf *vdmabuf = VHOST_VDMABUF(vdev);
+    BusState *bs = BUS(qdev_get_parent_bus(DEVICE(vdev)));
+    VirtioBusClass *bc = VIRTIO_BUS_GET_CLASS(bs);
+    int ret, i;
+
+    if (!bc->set_guest_notifiers) {
+        error_report("No support for guest notifiers");
+        return -ENOSYS;
+    }
+
+    ret = vhost_dev_enable_notifiers(&vdmabuf->vhost_dev, vdev);
+    if (ret < 0) {
+        error_report("Cannot enable host notifiers: %d", -ret);
+        return ret;
+    }
+
+    ret = bc->set_guest_notifiers(bs->parent, vdmabuf->vhost_dev.nvqs, true);
+    if (ret < 0) {
+        error_report("Cannot set guest notifier: %d", -ret);
+        return ret;
+    }
+
+    vdmabuf->vhost_dev.acked_features = vdev->guest_features;
+    ret = vhost_dev_start(&vdmabuf->vhost_dev, vdev);
+    if (ret < 0) {
+        error_report("Cannot start vhost: %d", -ret);
+        return ret;
+    }
+
+    for (i = 0; i < vdmabuf->vhost_dev.nvqs; i++) {
+        vhost_virtqueue_mask(&vdmabuf->vhost_dev, vdev, i, false);
+    }
+
+    return 0;
+}
+
+static void vhost_vdmabuf_stop(VirtIODevice *vdev)
+{
+    VHostVdmabuf *vdmabuf = VHOST_VDMABUF(vdev);
+    BusState *bs = BUS(qdev_get_parent_bus(DEVICE(vdev)));
+    VirtioBusClass *bc = VIRTIO_BUS_GET_CLASS(bs);
+
+    if (!bc->set_guest_notifiers) {
+        return;
+    }
+
+    vhost_dev_stop(&vdmabuf->vhost_dev, vdev);
+    vhost_dev_disable_notifiers(&vdmabuf->vhost_dev, vdev);
+}
+
+static int vhost_vdmabuf_set_running(VirtIODevice *vdev, int start)
+{
+    VHostVdmabuf *vdmabuf = VHOST_VDMABUF(vdev);
+    const VhostOps *vhost_ops = vdmabuf->vhost_dev.vhost_ops;
+    int ret;
+
+    if (!vhost_ops->vhost_vdmabuf_set_running) {
+        return -ENOSYS;
+    }
+
+    ret = vhost_ops->vhost_vdmabuf_set_running(&vdmabuf->vhost_dev, start);
+    if (ret < 0) {
+        return -errno;
+    }
+
+    return 0;
+}
+
+static void vhost_vdmabuf_set_status(VirtIODevice *vdev, uint8_t status)
+{
+    VHostVdmabuf *vdmabuf = VHOST_VDMABUF(vdev);
+    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
+    int ret = 0;
+
+    if (!vdev->vm_running) {
+        should_start = false;
+    }
+
+    if (vdmabuf->vhost_dev.started == should_start) {
+        return;
+    }
+
+    if (should_start) {
+        ret = vhost_vdmabuf_start(vdev);
+        if (ret < 0) {
+            error_report("Cannot start vhost vdmabuf: %d", -ret);
+	    return;
+	}
+
+        ret = vhost_vdmabuf_set_running(vdev, 1);
+        if (ret < 0) {
+            vhost_vdmabuf_stop(vdev);
+            error_report("vhost vdmabuf set running failed: %d", ret);
+            return;
+        }
+    } else {
+        ret = vhost_vdmabuf_set_running(vdev, 0);
+        if (ret < 0) {
+            error_report("vhost vdmabuf set running failed: %d", ret);
+            return;
+        }
+
+        vhost_vdmabuf_stop(vdev);
+    }
+}
+
+static int vhost_vdmabuf_pre_save(void *opaque)
+{
+    return 0;
+}
+
+static int vhost_vdmabuf_post_load(void *opaque, int version_id)
+{
+    return 0;
+}
+
+static const VMStateDescription vmstate_virtio_vhost_vdmabuf = {
+    .name = "virtio-vhost_vdmabuf",
+    .minimum_version_id = 0,
+    .version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_VIRTIO_DEVICE,
+        VMSTATE_END_OF_LIST()
+    },
+    .pre_save = vhost_vdmabuf_pre_save,
+    .post_load = vhost_vdmabuf_post_load,
+};
+
+static void vhost_vdmabuf_handle_output(VirtIODevice *vdev, VirtQueue *vq)
+{
+    return;
+}
+
+static void vhost_vdmabuf_guest_notifier_mask(VirtIODevice *vdev, int idx,
+                                              bool mask)
+{
+    VHostVdmabuf *vdmabuf = VHOST_VDMABUF(vdev);
+
+    vhost_virtqueue_mask(&vdmabuf->vhost_dev, vdev, idx, mask);
+}
+
+static bool vhost_vdmabuf_guest_notifier_pending(VirtIODevice *vdev,
+                                                 int idx)
+{
+    VHostVdmabuf *vdmabuf = VHOST_VDMABUF(vdev);
+
+    return vhost_virtqueue_pending(&vdmabuf->vhost_dev, idx);
+}
+
+static void vhost_vdmabuf_device_unrealize(DeviceState *dev)
+{
+    VHostVdmabuf *vdmabuf = VHOST_VDMABUF(dev);
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+
+    vhost_vdmabuf_set_status(vdev, 0);
+    vhost_dev_cleanup(&vdmabuf->vhost_dev);
+
+    virtio_delete_queue(vdmabuf->send_vq);
+    virtio_delete_queue(vdmabuf->recv_vq);
+    virtio_cleanup(vdev);
+}
+
+static VDMABUFDMABuf *vdmabuf_display_get_dmabuf(VHostVdmabuf *vdmabuf)
+{
+    VDMABUFDisplay *dpy = vdmabuf->dpy;
+    VDMABUFDMABuf *dmabuf;
+    VDMABUFBlob *dmabuf_blob;
+    QemuUUID uuid;
+    struct virtio_vdmabuf_import msg;
+    struct virtio_vdmabuf_e_hdr *ev_hdr;
+    int fd = vdmabuf->vhostfd;
+    char data[256] = {0};
+    long ret = 0;
+
+    ret = read(fd, data, sizeof *ev_hdr + sizeof *dmabuf_blob);
+    if (ret <= 0) {
+        error_report("Cannot read event: %ld", -ret);
+        return NULL;
+    }
+
+    ev_hdr = (struct virtio_vdmabuf_e_hdr *)data;
+    memcpy(&uuid, &ev_hdr->buf_id, QEMU_UUID_SIZE_BYTES);
+    dmabuf_blob = (VDMABUFBlob *)(data + sizeof *ev_hdr);
+
+    QTAILQ_FOREACH(dmabuf, &dpy->dmabuf.bufs, next) {
+        if (qemu_uuid_is_equal(&uuid, &dmabuf->dmabuf_id)) {
+            QTAILQ_REMOVE(&dpy->dmabuf.bufs, dmabuf, next);
+            QTAILQ_INSERT_HEAD(&dpy->dmabuf.bufs, dmabuf, next);
+            return dmabuf;
+        }
+    }
+
+    memcpy(&msg.buf_id, &uuid, QEMU_UUID_SIZE_BYTES);
+    ret = ioctl(fd, VIRTIO_VDMABUF_IOCTL_IMPORT, &msg);
+    if (ret) {
+        error_report("Cannot import dmabuf: %ld", -ret);
+	return NULL;
+    }
+
+    dmabuf = g_new0(VDMABUFDMABuf, 1);
+    memcpy(&dmabuf->dmabuf_id, &uuid, QEMU_UUID_SIZE_BYTES);
+    dmabuf->buf.fd = msg.fd;
+
+    dmabuf->buf.width = dmabuf_blob->width;
+    dmabuf->buf.height = dmabuf_blob->height;
+    dmabuf->buf.stride = dmabuf_blob->stride;
+    dmabuf->buf.fourcc = dmabuf_blob->format;
+    dmabuf->buf.modifier = dmabuf_blob->modifier;
+
+    QTAILQ_INSERT_HEAD(&dpy->dmabuf.bufs, dmabuf, next);
+    return dmabuf;
+}
+
+static void vdmabuf_display_free_one_dmabuf(VHostVdmabuf *vdmabuf,
+					    VDMABUFDisplay *dpy,
+                                            VDMABUFDMABuf *dmabuf)
+{
+    struct virtio_vdmabuf_import msg;
+    int fd = vdmabuf->vhostfd;
+
+    QTAILQ_REMOVE(&dpy->dmabuf.bufs, dmabuf, next);
+    dpy_gl_release_dmabuf(dpy->con, &dmabuf->buf);
+
+    memcpy(&msg.buf_id, &dmabuf->dmabuf_id, QEMU_UUID_SIZE_BYTES);
+    if (ioctl(fd, VIRTIO_VDMABUF_IOCTL_RELEASE, &msg))
+        error_report("Error releasing dmabuf");
+
+    close(dmabuf->buf.fd);
+    g_free(dmabuf);
+}
+
+static void vdmabuf_display_free_dmabufs(VHostVdmabuf *vdmabuf)
+{
+    VDMABUFDisplay *dpy = vdmabuf->dpy;
+    VDMABUFDMABuf *dmabuf, *tmp;
+    uint32_t keep = 2;
+
+    QTAILQ_FOREACH_SAFE(dmabuf, &dpy->dmabuf.bufs, next, tmp) {
+        if (keep > 0) {
+            keep--;
+            continue;
+        }
+
+        assert(dmabuf != dpy->dmabuf.guest_fb);
+        vdmabuf_display_free_one_dmabuf(vdmabuf, dpy, dmabuf);
+    }
+}
+
+static void vdmabuf_display_dmabuf_update(void *opaque)
+{
+    VHostVdmabuf *vdmabuf = opaque;
+    VDMABUFDisplay *dpy = vdmabuf->dpy;
+    VDMABUFDMABuf *guest_fb;
+    bool free_bufs = false;
+
+    if (!have_event)
+        return;
+
+    guest_fb = vdmabuf_display_get_dmabuf(vdmabuf);
+    if (guest_fb == NULL) {
+        return;
+    }
+
+    if (dpy->dmabuf.guest_fb != guest_fb) {
+        dpy->dmabuf.guest_fb = guest_fb;
+        qemu_console_resize(dpy->con,
+                            guest_fb->buf.width, guest_fb->buf.height);
+        dpy_gl_scanout_dmabuf(dpy->con, &guest_fb->buf);
+        free_bufs = true;
+    }
+
+    dpy_gl_update(dpy->con, 0, 0, guest_fb->buf.width, guest_fb->buf.height);
+
+    if (free_bufs) {
+        vdmabuf_display_free_dmabufs(vdmabuf);
+    }
+
+    have_event = false;
+}
+
+static void vdmabuf_event_handler(void *opaque)
+{
+    VHostVdmabuf *vdmabuf = opaque;
+    VDMABUFDisplay *dpy = vdmabuf->dpy;
+
+    have_event = true;
+    graphic_hw_dpy_refresh(dpy->con);
+}
+
+static const GraphicHwOps vdmabuf_display_dmabuf_ops = {
+    .gfx_update = vdmabuf_display_dmabuf_update,
+};
+
+static int vdmabuf_display_dmabuf_init(VHostVdmabuf *vdmabuf, Error **errp)
+{
+    if (!display_opengl) {
+        error_setg(errp, "vhost-vdmabuf: opengl not available");
+        return -1;
+    }
+
+    vdmabuf->dpy = g_new0(VDMABUFDisplay, 1);
+    vdmabuf->dpy->con = graphic_console_init(NULL, 0,
+                                             &vdmabuf_display_dmabuf_ops,
+                                             vdmabuf);
+    return 0;
+}
+
+
+static void vhost_vdmabuf_device_realize(DeviceState *dev, Error **errp)
+{
+    VHostVdmabuf *vdmabuf = VHOST_VDMABUF(dev);
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    int vhostfd;
+    int ret;
+
+    vhostfd = open("/dev/vhost-vdmabuf", O_RDWR);
+    if (vhostfd < 0) {
+        error_setg_errno(errp, errno,
+                         "vhost-vdmabuf: failed to open vhost device");
+        return;
+    }
+
+    virtio_init(vdev, "vhost-vdmabuf", VIRTIO_ID_VDMABUF, 0);
+    vdmabuf->send_vq = virtio_add_queue(vdev, VHOST_VDMABUF_QUEUE_SIZE,
+                                        vhost_vdmabuf_handle_output);
+    vdmabuf->recv_vq = virtio_add_queue(vdev, VHOST_VDMABUF_QUEUE_SIZE,
+                                        vhost_vdmabuf_handle_output);
+
+    vdmabuf->vhost_dev.nvqs = ARRAY_SIZE(vdmabuf->vhost_vqs);
+    vdmabuf->vhost_dev.vqs = vdmabuf->vhost_vqs;
+    
+    ret = vhost_dev_init(&vdmabuf->vhost_dev, (void *)(uintptr_t)vhostfd,
+                         VHOST_BACKEND_TYPE_KERNEL, 0);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "vhost-vdmabuf: vhost_dev_init failed");
+        goto err_virtio;
+    }
+
+    vdmabuf->vhostfd = vhostfd;
+    qemu_set_fd_handler(vhostfd, vdmabuf_event_handler, NULL, vdmabuf);
+
+    ret = vdmabuf_display_dmabuf_init(vdmabuf, errp);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "vhost-vdmabuf: dmabuf_init failed");
+        goto err_virtio;
+    }
+
+    return;
+
+err_virtio:
+    vhost_vdmabuf_device_unrealize(dev);
+    if (vhostfd >= 0) {
+        close(vhostfd);
+    }
+}
+
+static uint64_t vhost_vdmabuf_get_features(VirtIODevice *vdev,
+                                           uint64_t req_features,
+                                           Error **errp)
+{
+    return req_features;
+}
+
+static void vhost_vdmabuf_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_virtio_vhost_vdmabuf;
+    vdc->realize = vhost_vdmabuf_device_realize;
+    vdc->unrealize = vhost_vdmabuf_device_unrealize;
+    vdc->get_features = vhost_vdmabuf_get_features;
+    vdc->set_status = vhost_vdmabuf_set_status;
+
+    vdc->guest_notifier_mask = vhost_vdmabuf_guest_notifier_mask;
+    vdc->guest_notifier_pending = vhost_vdmabuf_guest_notifier_pending;
+}
+
+static const TypeInfo vhost_vdmabuf_info = {
+    .name = TYPE_VHOST_VDMABUF,
+    .parent = TYPE_VIRTIO_DEVICE,
+    .instance_size = sizeof(VHostVdmabuf),
+    .class_init = vhost_vdmabuf_class_init,
+};
+
+static void vhost_vdmabuf_register_types(void)
+{
+    type_register_static(&vhost_vdmabuf_info);
+}
+
+static void vhost_vdmabuf_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
+{
+    VHostVdmabufPCI *dev = VHOST_VDMABUF_PCI(vpci_dev);
+    DeviceState *vdev = DEVICE(&dev->vdev);
+
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
+}
+
+static void vhost_vdmabuf_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioPCIClass *pc = VIRTIO_PCI_CLASS(klass);
+    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
+
+    pc->realize = vhost_vdmabuf_pci_realize;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+
+    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
+    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_VDMABUF;
+    pcidev_k->revision = 0x00;
+    pcidev_k->class_id = PCI_CLASS_COMMUNICATION_OTHER;
+}
+
+static void vhost_vdmabuf_pci_instance_init(Object *obj)
+{
+    VHostVdmabufPCI *dev = VHOST_VDMABUF_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VHOST_VDMABUF);
+}
+
+static const VirtioPCIDeviceTypeInfo vhost_vdmabuf_pci_info = {
+    .base_name     = TYPE_VHOST_VDMABUF_PCI,
+    .generic_name  = "vhost-vdmabuf-pci",
+    .instance_size = sizeof(VHostVdmabufPCI),
+    .instance_init = vhost_vdmabuf_pci_instance_init,
+    .class_init    = vhost_vdmabuf_pci_class_init,
+};
+
+static void virtio_pci_vhost_register(void)
+{
+    virtio_pci_types_register(&vhost_vdmabuf_pci_info);
+}
+
+type_init(virtio_pci_vhost_register)
+type_init(vhost_vdmabuf_register_types)
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 1bc231480f..fe4dd2443c 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -89,6 +89,7 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_VIRTIO_PMEM        0x1013
 #define PCI_DEVICE_ID_VIRTIO_IOMMU       0x1014
 #define PCI_DEVICE_ID_VIRTIO_MEM         0x1015
+#define PCI_DEVICE_ID_VIRTIO_VDMABUF     0x1016
 
 #define PCI_VENDOR_ID_REDHAT             0x1b36
 #define PCI_DEVICE_ID_REDHAT_BRIDGE      0x0001
diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index 8a6f8e2a7a..f00ab76e70 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -89,6 +89,7 @@ typedef bool (*vhost_backend_can_merge_op)(struct vhost_dev *dev,
 typedef int (*vhost_vsock_set_guest_cid_op)(struct vhost_dev *dev,
                                             uint64_t guest_cid);
 typedef int (*vhost_vsock_set_running_op)(struct vhost_dev *dev, int start);
+typedef int (*vhost_vdmabuf_set_running_op)(struct vhost_dev *dev, int start);
 typedef void (*vhost_set_iotlb_callback_op)(struct vhost_dev *dev,
                                            int enabled);
 typedef int (*vhost_send_device_iotlb_msg_op)(struct vhost_dev *dev,
@@ -157,6 +158,7 @@ typedef struct VhostOps {
     vhost_backend_can_merge_op vhost_backend_can_merge;
     vhost_vsock_set_guest_cid_op vhost_vsock_set_guest_cid;
     vhost_vsock_set_running_op vhost_vsock_set_running;
+    vhost_vdmabuf_set_running_op vhost_vdmabuf_set_running;
     vhost_set_iotlb_callback_op vhost_set_iotlb_callback;
     vhost_send_device_iotlb_msg_op vhost_send_device_iotlb_msg;
     vhost_get_config_op vhost_get_config;
diff --git a/include/hw/virtio/vhost-vdmabuf.h b/include/hw/virtio/vhost-vdmabuf.h
new file mode 100644
index 0000000000..aef99cbae2
--- /dev/null
+++ b/include/hw/virtio/vhost-vdmabuf.h
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: (MIT OR GPL-2.0)
+
+/*
+ * Copyright © 2021 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ */
+
+#ifndef _UAPI_LINUX_VIRTIO_VDMABUF_H
+#define _UAPI_LINUX_VIRTIO_VDMABUF_H
+
+typedef struct {
+	__u64 id;
+	/* 8B long Random number */
+	int rng_key[2];
+} virtio_vdmabuf_buf_id_t;
+
+struct virtio_vdmabuf_e_hdr {
+	/* buf_id of new buf */
+	virtio_vdmabuf_buf_id_t buf_id;
+	/* size of private data */
+	int size;
+};
+
+struct virtio_vdmabuf_e_data {
+	struct virtio_vdmabuf_e_hdr hdr;
+	/* ptr to private data */
+	void *data;
+};
+
+#define VIRTIO_VDMABUF_IOCTL_IMPORT \
+_IOC(_IOC_NONE, 'G', 2, sizeof(struct virtio_vdmabuf_import))
+#define VIRTIO_VDMABUF_IOCTL_RELEASE \
+_IOC(_IOC_NONE, 'G', 3, sizeof(struct virtio_vdmabuf_import))
+struct virtio_vdmabuf_import {
+	/* IN parameters */
+	/* vdmabuf id to be imported */
+	virtio_vdmabuf_buf_id_t buf_id;
+	/* flags */
+	int flags;
+	/* OUT parameters */
+	/* exported dma buf fd */
+	int fd;
+};
+
+#define VIRTIO_VDMABUF_IOCTL_EXPORT \
+_IOC(_IOC_NONE, 'G', 4, sizeof(struct virtio_vdmabuf_export))
+struct virtio_vdmabuf_export {
+	/* IN parameters */
+	/* DMA buf fd to be exported */
+	int fd;
+	/* exported dma buf id */
+	virtio_vdmabuf_buf_id_t buf_id;
+	int sz_priv;
+	char *priv;
+};
+
+#endif
diff --git a/include/standard-headers/linux/virtio_ids.h b/include/standard-headers/linux/virtio_ids.h
index bc1c0621f5..6c8c19fb6b 100644
--- a/include/standard-headers/linux/virtio_ids.h
+++ b/include/standard-headers/linux/virtio_ids.h
@@ -54,5 +54,6 @@
 #define VIRTIO_ID_FS			26 /* virtio filesystem */
 #define VIRTIO_ID_PMEM			27 /* virtio pmem */
 #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
+#define VIRTIO_ID_VDMABUF		37 /* virtio vdmabuf */
 
 #endif /* _LINUX_VIRTIO_IDS_H */
diff --git a/include/ui/console.h b/include/ui/console.h
index d30e972d0b..892b7ff03f 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -400,6 +400,7 @@ void graphic_console_close(QemuConsole *con);
 
 void graphic_hw_update(QemuConsole *con);
 void graphic_hw_update_done(QemuConsole *con);
+void graphic_hw_dpy_refresh(QemuConsole *con);
 void graphic_hw_invalidate(QemuConsole *con);
 void graphic_hw_text_update(QemuConsole *con, console_ch_t *chardata);
 void graphic_hw_gl_block(QemuConsole *con, bool block);
diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
index c998860d7b..d53faa59e9 100644
--- a/linux-headers/linux/vhost.h
+++ b/linux-headers/linux/vhost.h
@@ -150,4 +150,7 @@
 /* Get the valid iova range */
 #define VHOST_VDPA_GET_IOVA_RANGE	_IOR(VHOST_VIRTIO, 0x78, \
 					     struct vhost_vdpa_iova_range)
+/* VHOST_VDMABUF specific defines */
+#define VHOST_VDMABUF_SET_RUNNING	_IOW(VHOST_VIRTIO, 0x79, int)
+
 #endif
diff --git a/meson.build b/meson.build
index 2d8b433ff0..1847abf9a4 100644
--- a/meson.build
+++ b/meson.build
@@ -2417,6 +2417,7 @@ summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
 summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
 summary_info += {'vhost-scsi support': config_host.has_key('CONFIG_VHOST_SCSI')}
 summary_info += {'vhost-vsock support': config_host.has_key('CONFIG_VHOST_VSOCK')}
+summary_info += {'vhost-vdmabuf support': config_host.has_key('CONFIG_VHOST_VDMABUF')}
 summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
 summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
 summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
diff --git a/ui/console.c b/ui/console.c
index c5d11bc701..8a80e97195 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -284,6 +284,13 @@ void graphic_hw_update(QemuConsole *con)
     }
 }
 
+void graphic_hw_dpy_refresh(QemuConsole *con)
+{
+    DisplayState *ds = con ? con->ds : active_console->ds;
+
+    dpy_refresh(ds);
+}
+
 void graphic_hw_gl_block(QemuConsole *con, bool block)
 {
     assert(con != NULL);
-- 
2.26.2


