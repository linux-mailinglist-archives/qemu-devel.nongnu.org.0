Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 047F716E9FA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 16:25:22 +0100 (CET)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6c5J-0003Xx-1o
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 10:25:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55444)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1j6bu1-0008BI-TQ
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 10:13:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1j6btz-0001Dq-Qc
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 10:13:41 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30002
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1j6btz-0001CA-IH
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 10:13:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582643618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fxhD85QURMHEqGfAVjO06OKCuGPcyx+wfBWG1kQlMdk=;
 b=KBSvPO+gOPeawmWxNYUJEa27E9Gx0xl8/zvVH8NxIgNdvMp4zYmv00ac62qKSEFV3YpEPM
 xiB/eag+R+tkx+mMzytNwT+taMg6wSeF6K127emmNx4BSwA9go1PonsSae7do9zaMaSFQZ
 Q1EK0n26yvvAQ87S0G1p/ixM3olx0vg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-fh5319sGPg6xm_wV-ILzpw-1; Tue, 25 Feb 2020 10:13:32 -0500
X-MC-Unique: fh5319sGPg6xm_wV-ILzpw-1
Received: by mail-qv1-f72.google.com with SMTP id f17so13173236qvi.6
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 07:13:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Zhqx9qPWTMmN4vZaT6M30mfe2b5p6M/C9yj5xkhbUpA=;
 b=ry6ip2LEn0YoZDCHOof+5pgV0WsyV+GUzXr0a0BUYt9eMeAA+SJOFWP+Gc6baiXzDB
 OFUDT/N69nKwVZ8y8XaDW2kPy22AOrajjfx9OTnrMfp+nH6c1BuiXo+RIEG+E7ihCtrW
 VMChnL/svK09bpi5qxpuXyXmF49mQX+QP2tmkO5lA14A3Yyu6HrIo2BHbGnF6MK1dNpB
 QLmHtFY0blV1C0Cw6uUbLnoKvrSljJeqeDz4A0RS3jLfzetS8Uy3Q+bmlpweOrjlmD9O
 PwpqGNm1yDdKffSnJLvacVqoJUic9Gt+v2KwpYMijypGnteEWY15D2vOKBeF3DhJtCw2
 HYaA==
X-Gm-Message-State: APjAAAXidlvKN+ekHn6SNimjNUxPYdaf6sKF8wsyclY0K/XuTa7hZvgc
 VRDP/Inc7OKLMcAOqXKQJ1XVtM6QAAXQX8WSItJNluXZrTQFQwU9yqFtSHfm/UKhlN8bY0wUPOB
 soZvSfj4+osIkBm8=
X-Received: by 2002:a37:66c8:: with SMTP id a191mr13318222qkc.0.1582643610071; 
 Tue, 25 Feb 2020 07:13:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqyJ0A2iKK+8/QbOiUtIdA9ezTOOm8mpwIJ+bZ7qhIJsOgnMDDTn1DTkOvsfxZzBivkDyVswyw==
X-Received: by 2002:a37:66c8:: with SMTP id a191mr13318180qkc.0.1582643609668; 
 Tue, 25 Feb 2020 07:13:29 -0800 (PST)
Received: from redhat.com (bzq-79-178-2-214.red.bezeqint.net. [79.178.2.214])
 by smtp.gmail.com with ESMTPSA id
 u76sm7464411qka.21.2020.02.25.07.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 07:13:28 -0800 (PST)
Date: Tue, 25 Feb 2020 10:13:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/32] virtio-iommu: Add skeleton
Message-ID: <20200225151210.647797-13-mst@redhat.com>
References: <20200225151210.647797-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200225151210.647797-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>,
 Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

This patchs adds the skeleton for the virtio-iommu device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Message-Id: <20200214132745.23392-2-eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-iommu.h |  57 +++++++
 hw/virtio/virtio-iommu.c         | 265 +++++++++++++++++++++++++++++++
 hw/virtio/Kconfig                |   5 +
 hw/virtio/Makefile.objs          |   1 +
 hw/virtio/trace-events           |   7 +
 5 files changed, 335 insertions(+)
 create mode 100644 include/hw/virtio/virtio-iommu.h
 create mode 100644 hw/virtio/virtio-iommu.c

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-io=
mmu.h
new file mode 100644
index 0000000000..d24ba63305
--- /dev/null
+++ b/include/hw/virtio/virtio-iommu.h
@@ -0,0 +1,57 @@
+/*
+ * virtio-iommu device
+ *
+ * Copyright (c) 2020 Red Hat, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License f=
or
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along=
 with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#ifndef QEMU_VIRTIO_IOMMU_H
+#define QEMU_VIRTIO_IOMMU_H
+
+#include "standard-headers/linux/virtio_iommu.h"
+#include "hw/virtio/virtio.h"
+#include "hw/pci/pci.h"
+
+#define TYPE_VIRTIO_IOMMU "virtio-iommu-device"
+#define VIRTIO_IOMMU(obj) \
+        OBJECT_CHECK(VirtIOIOMMU, (obj), TYPE_VIRTIO_IOMMU)
+
+typedef struct IOMMUDevice {
+    void         *viommu;
+    PCIBus       *bus;
+    int           devfn;
+    IOMMUMemoryRegion  iommu_mr;
+    AddressSpace  as;
+} IOMMUDevice;
+
+typedef struct IOMMUPciBus {
+    PCIBus       *bus;
+    IOMMUDevice  *pbdev[0]; /* Parent array is sparse, so dynamically allo=
c */
+} IOMMUPciBus;
+
+typedef struct VirtIOIOMMU {
+    VirtIODevice parent_obj;
+    VirtQueue *req_vq;
+    VirtQueue *event_vq;
+    struct virtio_iommu_config config;
+    uint64_t features;
+    GHashTable *as_by_busptr;
+    PCIBus *primary_bus;
+    GTree *domains;
+    QemuMutex mutex;
+    GTree *endpoints;
+} VirtIOIOMMU;
+
+#endif
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
new file mode 100644
index 0000000000..30579267d5
--- /dev/null
+++ b/hw/virtio/virtio-iommu.c
@@ -0,0 +1,265 @@
+/*
+ * virtio-iommu device
+ *
+ * Copyright (c) 2020 Red Hat, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License f=
or
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along=
 with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/iov.h"
+#include "qemu-common.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/virtio.h"
+#include "sysemu/kvm.h"
+#include "trace.h"
+
+#include "standard-headers/linux/virtio_ids.h"
+
+#include "hw/virtio/virtio-bus.h"
+#include "hw/virtio/virtio-access.h"
+#include "hw/virtio/virtio-iommu.h"
+
+/* Max size */
+#define VIOMMU_DEFAULT_QUEUE_SIZE 256
+
+static int virtio_iommu_handle_attach(VirtIOIOMMU *s,
+                                      struct iovec *iov,
+                                      unsigned int iov_cnt)
+{
+    return VIRTIO_IOMMU_S_UNSUPP;
+}
+static int virtio_iommu_handle_detach(VirtIOIOMMU *s,
+                                      struct iovec *iov,
+                                      unsigned int iov_cnt)
+{
+    return VIRTIO_IOMMU_S_UNSUPP;
+}
+static int virtio_iommu_handle_map(VirtIOIOMMU *s,
+                                   struct iovec *iov,
+                                   unsigned int iov_cnt)
+{
+    return VIRTIO_IOMMU_S_UNSUPP;
+}
+static int virtio_iommu_handle_unmap(VirtIOIOMMU *s,
+                                     struct iovec *iov,
+                                     unsigned int iov_cnt)
+{
+    return VIRTIO_IOMMU_S_UNSUPP;
+}
+
+static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
+{
+    VirtIOIOMMU *s =3D VIRTIO_IOMMU(vdev);
+    struct virtio_iommu_req_head head;
+    struct virtio_iommu_req_tail tail =3D {};
+    VirtQueueElement *elem;
+    unsigned int iov_cnt;
+    struct iovec *iov;
+    size_t sz;
+
+    for (;;) {
+        elem =3D virtqueue_pop(vq, sizeof(VirtQueueElement));
+        if (!elem) {
+            return;
+        }
+
+        if (iov_size(elem->in_sg, elem->in_num) < sizeof(tail) ||
+            iov_size(elem->out_sg, elem->out_num) < sizeof(head)) {
+            virtio_error(vdev, "virtio-iommu bad head/tail size");
+            virtqueue_detach_element(vq, elem, 0);
+            g_free(elem);
+            break;
+        }
+
+        iov_cnt =3D elem->out_num;
+        iov =3D elem->out_sg;
+        sz =3D iov_to_buf(iov, iov_cnt, 0, &head, sizeof(head));
+        if (unlikely(sz !=3D sizeof(head))) {
+            tail.status =3D VIRTIO_IOMMU_S_DEVERR;
+            goto out;
+        }
+        qemu_mutex_lock(&s->mutex);
+        switch (head.type) {
+        case VIRTIO_IOMMU_T_ATTACH:
+            tail.status =3D virtio_iommu_handle_attach(s, iov, iov_cnt);
+            break;
+        case VIRTIO_IOMMU_T_DETACH:
+            tail.status =3D virtio_iommu_handle_detach(s, iov, iov_cnt);
+            break;
+        case VIRTIO_IOMMU_T_MAP:
+            tail.status =3D virtio_iommu_handle_map(s, iov, iov_cnt);
+            break;
+        case VIRTIO_IOMMU_T_UNMAP:
+            tail.status =3D virtio_iommu_handle_unmap(s, iov, iov_cnt);
+            break;
+        default:
+            tail.status =3D VIRTIO_IOMMU_S_UNSUPP;
+        }
+        qemu_mutex_unlock(&s->mutex);
+
+out:
+        sz =3D iov_from_buf(elem->in_sg, elem->in_num, 0,
+                          &tail, sizeof(tail));
+        assert(sz =3D=3D sizeof(tail));
+
+        virtqueue_push(vq, elem, sizeof(tail));
+        virtio_notify(vdev, vq);
+        g_free(elem);
+    }
+}
+
+static void virtio_iommu_get_config(VirtIODevice *vdev, uint8_t *config_da=
ta)
+{
+    VirtIOIOMMU *dev =3D VIRTIO_IOMMU(vdev);
+    struct virtio_iommu_config *config =3D &dev->config;
+
+    trace_virtio_iommu_get_config(config->page_size_mask,
+                                  config->input_range.start,
+                                  config->input_range.end,
+                                  config->domain_range.end,
+                                  config->probe_size);
+    memcpy(config_data, &dev->config, sizeof(struct virtio_iommu_config));
+}
+
+static void virtio_iommu_set_config(VirtIODevice *vdev,
+                                      const uint8_t *config_data)
+{
+    struct virtio_iommu_config config;
+
+    memcpy(&config, config_data, sizeof(struct virtio_iommu_config));
+    trace_virtio_iommu_set_config(config.page_size_mask,
+                                  config.input_range.start,
+                                  config.input_range.end,
+                                  config.domain_range.end,
+                                  config.probe_size);
+}
+
+static uint64_t virtio_iommu_get_features(VirtIODevice *vdev, uint64_t f,
+                                          Error **errp)
+{
+    VirtIOIOMMU *dev =3D VIRTIO_IOMMU(vdev);
+
+    f |=3D dev->features;
+    trace_virtio_iommu_get_features(f);
+    return f;
+}
+
+/*
+ * Migration is not yet supported: most of the state consists
+ * of balanced binary trees which are not yet ready for getting
+ * migrated
+ */
+static const VMStateDescription vmstate_virtio_iommu_device =3D {
+    .name =3D "virtio-iommu-device",
+    .unmigratable =3D 1,
+};
+
+static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
+{
+    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
+    VirtIOIOMMU *s =3D VIRTIO_IOMMU(dev);
+
+    virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
+                sizeof(struct virtio_iommu_config));
+
+    s->req_vq =3D virtio_add_queue(vdev, VIOMMU_DEFAULT_QUEUE_SIZE,
+                             virtio_iommu_handle_command);
+    s->event_vq =3D virtio_add_queue(vdev, VIOMMU_DEFAULT_QUEUE_SIZE, NULL=
);
+
+    s->config.page_size_mask =3D TARGET_PAGE_MASK;
+    s->config.input_range.end =3D -1UL;
+    s->config.domain_range.end =3D 32;
+
+    virtio_add_feature(&s->features, VIRTIO_RING_F_EVENT_IDX);
+    virtio_add_feature(&s->features, VIRTIO_RING_F_INDIRECT_DESC);
+    virtio_add_feature(&s->features, VIRTIO_F_VERSION_1);
+    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_INPUT_RANGE);
+    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_DOMAIN_RANGE);
+    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
+    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
+    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MMIO);
+
+    qemu_mutex_init(&s->mutex);
+}
+
+static void virtio_iommu_device_unrealize(DeviceState *dev, Error **errp)
+{
+    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
+
+    virtio_cleanup(vdev);
+}
+
+static void virtio_iommu_device_reset(VirtIODevice *vdev)
+{
+    trace_virtio_iommu_device_reset();
+}
+
+static void virtio_iommu_set_status(VirtIODevice *vdev, uint8_t status)
+{
+    trace_virtio_iommu_device_status(status);
+}
+
+static void virtio_iommu_instance_init(Object *obj)
+{
+}
+
+static const VMStateDescription vmstate_virtio_iommu =3D {
+    .name =3D "virtio-iommu",
+    .minimum_version_id =3D 1,
+    .version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_VIRTIO_DEVICE,
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static Property virtio_iommu_properties[] =3D {
+    DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus, "PCI", PCIBu=
s *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void virtio_iommu_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, virtio_iommu_properties);
+    dc->vmsd =3D &vmstate_virtio_iommu;
+
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    vdc->realize =3D virtio_iommu_device_realize;
+    vdc->unrealize =3D virtio_iommu_device_unrealize;
+    vdc->reset =3D virtio_iommu_device_reset;
+    vdc->get_config =3D virtio_iommu_get_config;
+    vdc->set_config =3D virtio_iommu_set_config;
+    vdc->get_features =3D virtio_iommu_get_features;
+    vdc->set_status =3D virtio_iommu_set_status;
+    vdc->vmsd =3D &vmstate_virtio_iommu_device;
+}
+
+static const TypeInfo virtio_iommu_info =3D {
+    .name =3D TYPE_VIRTIO_IOMMU,
+    .parent =3D TYPE_VIRTIO_DEVICE,
+    .instance_size =3D sizeof(VirtIOIOMMU),
+    .instance_init =3D virtio_iommu_instance_init,
+    .class_init =3D virtio_iommu_class_init,
+};
+
+static void virtio_register_types(void)
+{
+    type_register_static(&virtio_iommu_info);
+}
+
+type_init(virtio_register_types)
diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index f87def27a6..d29525b36f 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -9,6 +9,11 @@ config VIRTIO_RNG
     default y
     depends on VIRTIO
=20
+config VIRTIO_IOMMU
+    bool
+    default y
+    depends on VIRTIO
+
 config VIRTIO_PCI
     bool
     default y if PCI_DEVICES
diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
index de0f5fc39b..2fd9da7410 100644
--- a/hw/virtio/Makefile.objs
+++ b/hw/virtio/Makefile.objs
@@ -16,6 +16,7 @@ obj-$(call land,$(CONFIG_VIRTIO_CRYPTO),$(CONFIG_VIRTIO_P=
CI)) +=3D virtio-crypto-p
 obj-$(CONFIG_VIRTIO_PMEM) +=3D virtio-pmem.o
 common-obj-$(call land,$(CONFIG_VIRTIO_PMEM),$(CONFIG_VIRTIO_PCI)) +=3D vi=
rtio-pmem-pci.o
 obj-$(call land,$(CONFIG_VHOST_USER_FS),$(CONFIG_VIRTIO_PCI)) +=3D vhost-u=
ser-fs-pci.o
+obj-$(CONFIG_VIRTIO_IOMMU) +=3D virtio-iommu.o
 obj-$(CONFIG_VHOST_VSOCK) +=3D vhost-vsock.o
=20
 ifeq ($(CONFIG_VIRTIO_PCI),y)
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index e28ba48da6..02d93d7f63 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -53,3 +53,10 @@ virtio_mmio_write_offset(uint64_t offset, uint64_t value=
) "virtio_mmio_write off
 virtio_mmio_guest_page(uint64_t size, int shift) "guest page size 0x%" PRI=
x64 " shift %d"
 virtio_mmio_queue_write(uint64_t value, int max_size) "mmio_queue write 0x=
%" PRIx64 " max %d"
 virtio_mmio_setting_irq(int level) "virtio_mmio setting IRQ %d"
+
+# hw/virtio/virtio-iommu.c
+virtio_iommu_device_reset(void) "reset!"
+virtio_iommu_get_features(uint64_t features) "device supports features=3D0=
x%"PRIx64
+virtio_iommu_device_status(uint8_t status) "driver status =3D %d"
+virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t =
end, uint32_t domain_range, uint32_t probe_size) "page_size_mask=3D0x%"PRIx=
64" start=3D0x%"PRIx64" end=3D0x%"PRIx64" domain_range=3D%d probe_size=3D0x=
%x"
+virtio_iommu_set_config(uint64_t page_size_mask, uint64_t start, uint64_t =
end, uint32_t domain_range, uint32_t probe_size) "page_size_mask=3D0x%"PRIx=
64" start=3D0x%"PRIx64" end=3D0x%"PRIx64" domain_bits=3D%d probe_size=3D0x%=
x"
--=20
MST


