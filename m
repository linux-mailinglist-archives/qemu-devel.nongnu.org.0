Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA00027AEC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 12:42:13 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33317 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTlAq-0002ai-Vp
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 06:42:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pagupta@redhat.com>) id 1hTkvP-00060Y-5b
	for qemu-devel@nongnu.org; Thu, 23 May 2019 06:26:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pagupta@redhat.com>) id 1hTkvM-0001Vl-7v
	for qemu-devel@nongnu.org; Thu, 23 May 2019 06:26:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55640)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pagupta@redhat.com>) id 1hTkvK-00014n-3i
	for qemu-devel@nongnu.org; Thu, 23 May 2019 06:26:10 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D8F4A21BAA;
	Thu, 23 May 2019 10:25:47 +0000 (UTC)
Received: from dhcp201-121.englab.pnq.redhat.com (ovpn-116-162.sin2.redhat.com
	[10.67.116.162])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D41A6606C;
	Thu, 23 May 2019 10:25:20 +0000 (UTC)
From: Pankaj Gupta <pagupta@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 23 May 2019 15:54:43 +0530
Message-Id: <20190523102449.2642-2-pagupta@redhat.com>
In-Reply-To: <20190523102449.2642-1-pagupta@redhat.com>
References: <20190523102449.2642-1-pagupta@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 23 May 2019 10:25:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/7] virtio-pmem: add virtio device
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, aarcange@redhat.com, cohuck@redhat.com,
	xiaoguangrong.eric@gmail.com, mst@redhat.com, pagupta@redhat.com,
	riel@surriel.com, david@redhat.com, armbru@redhat.com,
	ehabkost@redhat.com, lcapitulino@redhat.com, stefanha@redhat.com,
	pbonzini@redhat.com, imammedo@redhat.com,
	dan.j.williams@intel.com, nilal@redhat.com, dgilbert@redhat.com,
	rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the implementation of virtio-pmem device. Support will require
machine changes for the architectures that will support it, so it will
not yet be compiled. It can be unlocked with VIRTIO_PMEM_SUPPORTED per
machine and disabled globally via VIRTIO_PMEM.

We cannot use the "addr" property as that is already used e.g. for
virtio-pci/pci devices. And we will have e.g. virtio-pmem-pci as a proxy.
So we have to choose a different one (unfortunately). "memaddr" it is.
That name should ideally be used by all other virtio-* based memory
devices in the future.
    -device virtio-pmem-pci,id=p0,bus=bux0,addr=0x01,memaddr=0x1000000...

Acked-by: Markus Armbruster <armbru@redhat.com>
[ QAPI bits ]
Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
[ MemoryDevice/MemoryRegion changes, cleanups, addr property "memaddr",
  split up patches, unplug handler ]
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/Kconfig               |  10 +++
 hw/virtio/Makefile.objs         |   1 +
 hw/virtio/virtio-pmem.c         | 190 ++++++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-pmem.h |  49 +++++++++++
 qapi/misc.json                  |  28 +++++-
 5 files changed, 277 insertions(+), 1 deletion(-)
 create mode 100644 hw/virtio/virtio-pmem.c
 create mode 100644 include/hw/virtio/virtio-pmem.h

diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index e0452de4ba..3724ff8bac 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -29,3 +29,13 @@ config VIRTIO_CRYPTO
     bool
     default y
     depends on VIRTIO
+
+config VIRTIO_PMEM_SUPPORTED
+    bool
+
+config VIRTIO_PMEM
+    bool
+    default y
+    depends on VIRTIO
+    depends on VIRTIO_PMEM_SUPPORTED
+    select MEM_DEVICE
diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
index f2ab667a21..a5bdbb16aa 100644
--- a/hw/virtio/Makefile.objs
+++ b/hw/virtio/Makefile.objs
@@ -12,6 +12,7 @@ common-obj-$(CONFIG_VIRTIO_MMIO) += virtio-mmio.o
 obj-$(CONFIG_VIRTIO_BALLOON) += virtio-balloon.o
 obj-$(CONFIG_VIRTIO_CRYPTO) += virtio-crypto.o
 obj-$(call land,$(CONFIG_VIRTIO_CRYPTO),$(CONFIG_VIRTIO_PCI)) += virtio-crypto-pci.o
+obj-$(CONFIG_VIRTIO_PMEM) += virtio-pmem.o
 obj-$(CONFIG_VHOST_VSOCK) += vhost-vsock.o
 
 ifeq ($(CONFIG_VIRTIO_PCI),y)
diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
new file mode 100644
index 0000000000..c462d2c942
--- /dev/null
+++ b/hw/virtio/virtio-pmem.c
@@ -0,0 +1,190 @@
+/*
+ * Virtio PMEM device
+ *
+ * Copyright (C) 2018-2019 Red Hat, Inc.
+ *
+ * Authors:
+ *  Pankaj Gupta <pagupta@redhat.com>
+ *  David Hildenbrand <david@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu-common.h"
+#include "qemu/error-report.h"
+#include "hw/virtio/virtio-pmem.h"
+#include "hw/virtio/virtio-access.h"
+#include "standard-headers/linux/virtio_ids.h"
+#include "standard-headers/linux/virtio_pmem.h"
+#include "block/aio.h"
+#include "block/thread-pool.h"
+
+typedef struct VirtIODeviceRequest {
+    VirtQueueElement elem;
+    int fd;
+    VirtIOPMEM *pmem;
+    VirtIODevice *vdev;
+    struct virtio_pmem_req req;
+    struct virtio_pmem_resp resp;
+} VirtIODeviceRequest;
+
+static int worker_cb(void *opaque)
+{
+    VirtIODeviceRequest *req_data = opaque;
+    int err = 0;
+
+    /* flush raw backing image */
+    err = fsync(req_data->fd);
+    if (err != 0) {
+        err = 1;
+    }
+
+    virtio_stw_p(req_data->vdev, &req_data->resp.ret, err);
+
+    return 0;
+}
+
+static void done_cb(void *opaque, int ret)
+{
+    VirtIODeviceRequest *req_data = opaque;
+    int len = iov_from_buf(req_data->elem.in_sg, req_data->elem.in_num, 0,
+                              &req_data->resp, sizeof(struct virtio_pmem_resp));
+
+    /* Callbacks are serialized, so no need to use atomic ops. */
+    virtqueue_push(req_data->pmem->rq_vq, &req_data->elem, len);
+    virtio_notify((VirtIODevice *)req_data->pmem, req_data->pmem->rq_vq);
+    g_free(req_data);
+}
+
+static void virtio_pmem_flush(VirtIODevice *vdev, VirtQueue *vq)
+{
+    VirtIODeviceRequest *req_data;
+    VirtIOPMEM *pmem = VIRTIO_PMEM(vdev);
+    HostMemoryBackend *backend = MEMORY_BACKEND(pmem->memdev);
+    ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
+
+    req_data = virtqueue_pop(vq, sizeof(VirtIODeviceRequest));
+    if (!req_data) {
+        virtio_error(vdev, "virtio-pmem missing request data");
+        return;
+    }
+
+    if (req_data->elem.out_num < 1 || req_data->elem.in_num < 1) {
+        virtio_error(vdev, "virtio-pmem request not proper");
+        g_free(req_data);
+        return;
+    }
+    req_data->fd   = memory_region_get_fd(&backend->mr);
+    req_data->pmem = pmem;
+    req_data->vdev = vdev;
+    thread_pool_submit_aio(pool, worker_cb, req_data, done_cb, req_data);
+}
+
+static void virtio_pmem_get_config(VirtIODevice *vdev, uint8_t *config)
+{
+    VirtIOPMEM *pmem = VIRTIO_PMEM(vdev);
+    struct virtio_pmem_config *pmemcfg = (struct virtio_pmem_config *) config;
+
+    virtio_stq_p(vdev, &pmemcfg->start, pmem->start);
+    virtio_stq_p(vdev, &pmemcfg->size, memory_region_size(&pmem->memdev->mr));
+}
+
+static uint64_t virtio_pmem_get_features(VirtIODevice *vdev, uint64_t features,
+                                        Error **errp)
+{
+    return features;
+}
+
+static void virtio_pmem_realize(DeviceState *dev, Error **errp)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VirtIOPMEM *pmem = VIRTIO_PMEM(dev);
+
+    if (!pmem->memdev) {
+        error_setg(errp, "virtio-pmem memdev not set");
+        return;
+    }
+
+    if (host_memory_backend_is_mapped(pmem->memdev)) {
+        char *path = object_get_canonical_path_component(OBJECT(pmem->memdev));
+        error_setg(errp, "can't use already busy memdev: %s", path);
+        g_free(path);
+        return;
+    }
+
+    host_memory_backend_set_mapped(pmem->memdev, true);
+    virtio_init(vdev, TYPE_VIRTIO_PMEM, VIRTIO_ID_PMEM,
+                sizeof(struct virtio_pmem_config));
+    pmem->rq_vq = virtio_add_queue(vdev, 128, virtio_pmem_flush);
+}
+
+static void virtio_pmem_unrealize(DeviceState *dev, Error **errp)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VirtIOPMEM *pmem = VIRTIO_PMEM(dev);
+
+    host_memory_backend_set_mapped(pmem->memdev, false);
+    pmem->rq_vq = virtio_add_queue(vdev, 128, virtio_pmem_flush);
+    virtio_cleanup(vdev);
+}
+
+static void virtio_pmem_fill_device_info(const VirtIOPMEM *pmem,
+                                         VirtioPMEMDeviceInfo *vi)
+{
+    vi->memaddr = pmem->start;
+    vi->size = pmem->memdev ? memory_region_size(&pmem->memdev->mr) : 0;
+    vi->memdev = object_get_canonical_path(OBJECT(pmem->memdev));
+}
+
+static MemoryRegion *virtio_pmem_get_memory_region(VirtIOPMEM *pmem,
+                                                   Error **errp)
+{
+    if (!pmem->memdev) {
+        error_setg(errp, "'%s' property must be set", VIRTIO_PMEM_MEMDEV_PROP);
+        return NULL;
+    }
+
+    return &pmem->memdev->mr;
+}
+
+static Property virtio_pmem_properties[] = {
+    DEFINE_PROP_UINT64(VIRTIO_PMEM_ADDR_PROP, VirtIOPMEM, start, 0),
+    DEFINE_PROP_LINK(VIRTIO_PMEM_MEMDEV_PROP, VirtIOPMEM, memdev,
+                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void virtio_pmem_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+    VirtIOPMEMClass *vpc = VIRTIO_PMEM_CLASS(klass);
+
+    dc->props = virtio_pmem_properties;
+
+    vdc->realize = virtio_pmem_realize;
+    vdc->unrealize = virtio_pmem_unrealize;
+    vdc->get_config = virtio_pmem_get_config;
+    vdc->get_features = virtio_pmem_get_features;
+
+    vpc->fill_device_info = virtio_pmem_fill_device_info;
+    vpc->get_memory_region = virtio_pmem_get_memory_region;
+}
+
+static TypeInfo virtio_pmem_info = {
+    .name          = TYPE_VIRTIO_PMEM,
+    .parent        = TYPE_VIRTIO_DEVICE,
+    .class_size    = sizeof(VirtIOPMEMClass),
+    .class_init    = virtio_pmem_class_init,
+    .instance_size = sizeof(VirtIOPMEM),
+};
+
+static void virtio_register_types(void)
+{
+    type_register_static(&virtio_pmem_info);
+}
+
+type_init(virtio_register_types)
diff --git a/include/hw/virtio/virtio-pmem.h b/include/hw/virtio/virtio-pmem.h
new file mode 100644
index 0000000000..19b6ee6d75
--- /dev/null
+++ b/include/hw/virtio/virtio-pmem.h
@@ -0,0 +1,49 @@
+/*
+ * Virtio PMEM device
+ *
+ * Copyright (C) 2018-2019 Red Hat, Inc.
+ *
+ * Authors:
+ *  Pankaj Gupta <pagupta@redhat.com>
+ *  David Hildenbrand <david@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_VIRTIO_PMEM_H
+#define HW_VIRTIO_PMEM_H
+
+#include "hw/virtio/virtio.h"
+#include "sysemu/hostmem.h"
+
+#define TYPE_VIRTIO_PMEM "virtio-pmem"
+
+#define VIRTIO_PMEM(obj) \
+        OBJECT_CHECK(VirtIOPMEM, (obj), TYPE_VIRTIO_PMEM)
+#define VIRTIO_PMEM_CLASS(oc) \
+        OBJECT_CLASS_CHECK(VirtIOPMEMClass, (oc), TYPE_VIRTIO_PMEM)
+#define VIRTIO_PMEM_GET_CLASS(obj) \
+        OBJECT_GET_CLASS(VirtIOPMEMClass, (obj), TYPE_VIRTIO_PMEM)
+
+#define VIRTIO_PMEM_ADDR_PROP "memaddr"
+#define VIRTIO_PMEM_MEMDEV_PROP "memdev"
+
+typedef struct VirtIOPMEM {
+    VirtIODevice parent_obj;
+
+    VirtQueue *rq_vq;
+    uint64_t start;
+    HostMemoryBackend *memdev;
+} VirtIOPMEM;
+
+typedef struct VirtIOPMEMClass {
+    /* private */
+    VirtIODevice parent;
+
+    /* public */
+    void (*fill_device_info)(const VirtIOPMEM *pmem, VirtioPMEMDeviceInfo *vi);
+    MemoryRegion *(*get_memory_region)(VirtIOPMEM *pmem, Error **errp);
+} VirtIOPMEMClass;
+
+#endif
diff --git a/qapi/misc.json b/qapi/misc.json
index 8b3ca4fdd3..605c347003 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -2742,16 +2742,42 @@
           }
 }
 
+##
+# @VirtioPMEMDeviceInfo:
+#
+# VirtioPMEM state information
+#
+# @id: device's ID
+#
+# @memaddr: physical address in memory, where device is mapped
+#
+# @size: size of memory that the device provides
+#
+# @memdev: memory backend linked with device
+#
+# Since: 4.0
+##
+{ 'struct': 'VirtioPMEMDeviceInfo',
+  'data': { '*id': 'str',
+            'memaddr': 'size',
+            'size': 'size',
+            'memdev': 'str'
+          }
+}
+
 ##
 # @MemoryDeviceInfo:
 #
 # Union containing information about a memory device
 #
+# nvdimm is included since 2.12. virtio-pmem is included since 4.0.
+#
 # Since: 2.1
 ##
 { 'union': 'MemoryDeviceInfo',
   'data': { 'dimm': 'PCDIMMDeviceInfo',
-            'nvdimm': 'PCDIMMDeviceInfo'
+            'nvdimm': 'PCDIMMDeviceInfo',
+            'virtio-pmem': 'VirtioPMEMDeviceInfo'
           }
 }
 
-- 
2.14.5


