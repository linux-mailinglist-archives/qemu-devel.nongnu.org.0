Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F2445FD3F
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Nov 2021 08:34:23 +0100 (CET)
Received: from localhost ([::1]:40100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqsE2-0002jf-WE
	for lists+qemu-devel@lfdr.de; Sat, 27 Nov 2021 02:34:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mqs9q-0007pj-86
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 02:30:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mqs9n-0002EI-DQ
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 02:30:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637998196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k31ZSASY70a0Zmw3QvHPhBbcH1waWmVWZW/XNnEq+/4=;
 b=NRFqjktsviXMOAIsSV59eDbgGHaul1UOmH9jZugG7a8khJRIiqMU+o4TMcwNKQNhienuHZ
 VCl898rBZu5VNBuinXsoN1cJtjzXRrG5xlutakHENnzTqa/OPffgqE4pyxtEHTJwflQfj3
 A9E5VT4TyK1CPz0AOikeaAUUg9XrBdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-1pRtXtCCNDentPuGD0FAKA-1; Sat, 27 Nov 2021 02:29:53 -0500
X-MC-Unique: 1pRtXtCCNDentPuGD0FAKA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A1881006AA1;
 Sat, 27 Nov 2021 07:29:52 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3688F13AA5;
 Sat, 27 Nov 2021 07:29:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, thuth@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org
Subject: [PATCH v6 4/4] tests: qtest: Add virtio-iommu test
Date: Sat, 27 Nov 2021 08:29:10 +0100
Message-Id: <20211127072910.1261824-5-eric.auger@redhat.com>
In-Reply-To: <20211127072910.1261824-1-eric.auger@redhat.com>
References: <20211127072910.1261824-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: lvivier@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the framework to test the virtio-iommu-pci device
and tests exercising the attach/detach, map/unmap API.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

---

v5 -> v6:
- changed the expected value for domain.end (32 -> MAX_UINT32)
---
 tests/qtest/libqos/meson.build    |   1 +
 tests/qtest/libqos/virtio-iommu.c | 126 ++++++++++++
 tests/qtest/libqos/virtio-iommu.h |  40 ++++
 tests/qtest/meson.build           |   1 +
 tests/qtest/virtio-iommu-test.c   | 326 ++++++++++++++++++++++++++++++
 5 files changed, 494 insertions(+)
 create mode 100644 tests/qtest/libqos/virtio-iommu.c
 create mode 100644 tests/qtest/libqos/virtio-iommu.h
 create mode 100644 tests/qtest/virtio-iommu-test.c

diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index 4af1f04787c..e988d157917 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -41,6 +41,7 @@ libqos_srcs = files('../libqtest.c',
         'virtio-rng.c',
         'virtio-scsi.c',
         'virtio-serial.c',
+        'virtio-iommu.c',
 
         # qgraph machines:
         'aarch64-xlnx-zcu102-machine.c',
diff --git a/tests/qtest/libqos/virtio-iommu.c b/tests/qtest/libqos/virtio-iommu.c
new file mode 100644
index 00000000000..18cba4ca36b
--- /dev/null
+++ b/tests/qtest/libqos/virtio-iommu.c
@@ -0,0 +1,126 @@
+/*
+ * libqos driver virtio-iommu-pci framework
+ *
+ * Copyright (c) 2021 Red Hat, Inc.
+ *
+ * Authors:
+ *  Eric Auger <eric.auger@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at your
+ * option) any later version.  See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+#include "qemu/module.h"
+#include "qgraph.h"
+#include "virtio-iommu.h"
+#include "hw/virtio/virtio-iommu.h"
+
+static QGuestAllocator *alloc;
+
+/* virtio-iommu-device */
+static void *qvirtio_iommu_get_driver(QVirtioIOMMU *v_iommu,
+                                      const char *interface)
+{
+    if (!g_strcmp0(interface, "virtio-iommu")) {
+        return v_iommu;
+    }
+    if (!g_strcmp0(interface, "virtio")) {
+        return v_iommu->vdev;
+    }
+
+    fprintf(stderr, "%s not present in virtio-iommu-device\n", interface);
+    g_assert_not_reached();
+}
+
+static void virtio_iommu_cleanup(QVirtioIOMMU *interface)
+{
+    qvirtqueue_cleanup(interface->vdev->bus, interface->vq, alloc);
+}
+
+static void virtio_iommu_setup(QVirtioIOMMU *interface)
+{
+    QVirtioDevice *vdev = interface->vdev;
+    uint64_t features;
+
+    features = qvirtio_get_features(vdev);
+    features &= ~(QVIRTIO_F_BAD_FEATURE |
+                  (1ull << VIRTIO_RING_F_INDIRECT_DESC) |
+                  (1ull << VIRTIO_RING_F_EVENT_IDX) |
+                  (1ull << VIRTIO_IOMMU_F_BYPASS));
+    qvirtio_set_features(vdev, features);
+    interface->vq = qvirtqueue_setup(interface->vdev, alloc, 0);
+    qvirtio_set_driver_ok(interface->vdev);
+}
+
+/* virtio-iommu-pci */
+static void *qvirtio_iommu_pci_get_driver(void *object, const char *interface)
+{
+    QVirtioIOMMUPCI *v_iommu = object;
+    if (!g_strcmp0(interface, "pci-device")) {
+        return v_iommu->pci_vdev.pdev;
+    }
+    return qvirtio_iommu_get_driver(&v_iommu->iommu, interface);
+}
+
+static void qvirtio_iommu_pci_destructor(QOSGraphObject *obj)
+{
+    QVirtioIOMMUPCI *iommu_pci = (QVirtioIOMMUPCI *) obj;
+    QVirtioIOMMU *interface = &iommu_pci->iommu;
+    QOSGraphObject *pci_vobj =  &iommu_pci->pci_vdev.obj;
+
+    virtio_iommu_cleanup(interface);
+    qvirtio_pci_destructor(pci_vobj);
+}
+
+static void qvirtio_iommu_pci_start_hw(QOSGraphObject *obj)
+{
+    QVirtioIOMMUPCI *iommu_pci = (QVirtioIOMMUPCI *) obj;
+    QVirtioIOMMU *interface = &iommu_pci->iommu;
+    QOSGraphObject *pci_vobj =  &iommu_pci->pci_vdev.obj;
+
+    qvirtio_pci_start_hw(pci_vobj);
+    virtio_iommu_setup(interface);
+}
+
+
+static void *virtio_iommu_pci_create(void *pci_bus, QGuestAllocator *t_alloc,
+                                   void *addr)
+{
+    QVirtioIOMMUPCI *virtio_rpci = g_new0(QVirtioIOMMUPCI, 1);
+    QVirtioIOMMU *interface = &virtio_rpci->iommu;
+    QOSGraphObject *obj = &virtio_rpci->pci_vdev.obj;
+
+    virtio_pci_init(&virtio_rpci->pci_vdev, pci_bus, addr);
+    interface->vdev = &virtio_rpci->pci_vdev.vdev;
+    alloc = t_alloc;
+
+    obj->get_driver = qvirtio_iommu_pci_get_driver;
+    obj->start_hw = qvirtio_iommu_pci_start_hw;
+    obj->destructor = qvirtio_iommu_pci_destructor;
+
+    return obj;
+}
+
+static void virtio_iommu_register_nodes(void)
+{
+    QPCIAddress addr = {
+        .devfn = QPCI_DEVFN(4, 0),
+    };
+
+    QOSGraphEdgeOptions opts = {
+        .extra_device_opts = "addr=04.0",
+    };
+
+    /* virtio-iommu-pci */
+    add_qpci_address(&opts, &addr);
+    qos_node_create_driver("virtio-iommu-pci", virtio_iommu_pci_create);
+    qos_node_consumes("virtio-iommu-pci", "pci-bus", &opts);
+    qos_node_produces("virtio-iommu-pci", "pci-device");
+    qos_node_produces("virtio-iommu-pci", "virtio");
+    qos_node_produces("virtio-iommu-pci", "virtio-iommu");
+}
+
+libqos_init(virtio_iommu_register_nodes);
diff --git a/tests/qtest/libqos/virtio-iommu.h b/tests/qtest/libqos/virtio-iommu.h
new file mode 100644
index 00000000000..d753761958a
--- /dev/null
+++ b/tests/qtest/libqos/virtio-iommu.h
@@ -0,0 +1,40 @@
+/*
+ * libqos driver virtio-iommu-pci framework
+ *
+ * Copyright (c) 2021 Red Hat, Inc.
+ *
+ * Authors:
+ *  Eric Auger <eric.auger@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at your
+ * option) any later version.  See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef TESTS_LIBQOS_VIRTIO_IOMMU_H
+#define TESTS_LIBQOS_VIRTIO_IOMMU_H
+
+#include "qgraph.h"
+#include "virtio.h"
+#include "virtio-pci.h"
+
+typedef struct QVirtioIOMMU QVirtioIOMMU;
+typedef struct QVirtioIOMMUPCI QVirtioIOMMUPCI;
+typedef struct QVirtioIOMMUDevice QVirtioIOMMUDevice;
+
+struct QVirtioIOMMU {
+    QVirtioDevice *vdev;
+    QVirtQueue *vq;
+};
+
+struct QVirtioIOMMUPCI {
+    QVirtioPCIDevice pci_vdev;
+    QVirtioIOMMU iommu;
+};
+
+struct QVirtioIOMMUDevice {
+    QOSGraphObject obj;
+    QVirtioIOMMU iommu;
+};
+
+#endif
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c9d8458062f..982ffb3e38d 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -230,6 +230,7 @@ qos_test_ss.add(
   'virtio-rng-test.c',
   'virtio-scsi-test.c',
   'virtio-serial-test.c',
+  'virtio-iommu-test.c',
   'vmxnet3-test.c',
 )
 if have_virtfs
diff --git a/tests/qtest/virtio-iommu-test.c b/tests/qtest/virtio-iommu-test.c
new file mode 100644
index 00000000000..47e68388a00
--- /dev/null
+++ b/tests/qtest/virtio-iommu-test.c
@@ -0,0 +1,326 @@
+/*
+ * QTest testcase for VirtIO IOMMU
+ *
+ * Copyright (c) 2021 Red Hat, Inc.
+ *
+ * Authors:
+ *  Eric Auger <eric.auger@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at your
+ * option) any later version.  See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest-single.h"
+#include "qemu/module.h"
+#include "libqos/qgraph.h"
+#include "libqos/virtio-iommu.h"
+#include "hw/virtio/virtio-iommu.h"
+
+#define PCI_SLOT_HP             0x06
+#define QVIRTIO_IOMMU_TIMEOUT_US (30 * 1000 * 1000)
+
+static QGuestAllocator *alloc;
+
+static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
+{
+    QVirtioIOMMU *v_iommu = obj;
+    QVirtioDevice *dev = v_iommu->vdev;
+    uint64_t input_range_start = qvirtio_config_readq(dev, 8);
+    uint64_t input_range_end = qvirtio_config_readq(dev, 16);
+    uint32_t domain_range_start = qvirtio_config_readl(dev, 24);
+    uint32_t domain_range_end = qvirtio_config_readl(dev, 28);
+
+    g_assert_cmpint(input_range_start, ==, 0);
+    g_assert_cmphex(input_range_end, ==, UINT64_MAX);
+    g_assert_cmpint(domain_range_start, ==, 0);
+    g_assert_cmpint(domain_range_end, ==, UINT32_MAX);
+}
+
+static int read_tail_status(struct virtio_iommu_req_tail *buffer)
+{
+    int i;
+
+    for (i = 0; i < 3; i++) {
+        g_assert_cmpint(buffer->reserved[i], ==, 0);
+    }
+    return buffer->status;
+}
+
+/**
+ * send_attach_detach - Send an attach/detach command to the device
+ * @type: VIRTIO_IOMMU_T_ATTACH/VIRTIO_IOMMU_T_DETACH
+ * @domain: domain the endpoint is attached to
+ * @ep: endpoint
+ */
+static int send_attach_detach(QTestState *qts, QVirtioIOMMU *v_iommu,
+                              uint8_t type, uint32_t domain, uint32_t ep)
+{
+    QVirtioDevice *dev = v_iommu->vdev;
+    QVirtQueue *vq = v_iommu->vq;
+    uint64_t ro_addr, wr_addr;
+    uint32_t free_head;
+    struct virtio_iommu_req_attach req = {}; /* same layout as detach */
+    size_t ro_size = sizeof(req) - sizeof(struct virtio_iommu_req_tail);
+    size_t wr_size = sizeof(struct virtio_iommu_req_tail);
+    struct virtio_iommu_req_tail buffer;
+    int ret;
+
+    req.head.type = type;
+    req.domain = cpu_to_le32(domain);
+    req.endpoint = cpu_to_le32(ep);
+
+    ro_addr = guest_alloc(alloc, ro_size);
+    wr_addr = guest_alloc(alloc, wr_size);
+
+    qtest_memwrite(qts, ro_addr, &req, ro_size);
+    free_head = qvirtqueue_add(qts, vq, ro_addr, ro_size, false, true);
+    qvirtqueue_add(qts, vq, wr_addr, wr_size, true, false);
+    qvirtqueue_kick(qts, dev, vq, free_head);
+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
+                           QVIRTIO_IOMMU_TIMEOUT_US);
+    qtest_memread(qts, wr_addr, &buffer, wr_size);
+    ret = read_tail_status(&buffer);
+    guest_free(alloc, ro_addr);
+    guest_free(alloc, wr_addr);
+    return ret;
+}
+
+/**
+ * send_map - Send a map command to the device
+ * @domain: domain the new mapping is attached to
+ * @virt_start: iova start
+ * @virt_end: iova end
+ * @phys_start: base physical address
+ * @flags: mapping flags
+ */
+static int send_map(QTestState *qts, QVirtioIOMMU *v_iommu,
+                    uint32_t domain, uint64_t virt_start, uint64_t virt_end,
+                    uint64_t phys_start, uint32_t flags)
+{
+    QVirtioDevice *dev = v_iommu->vdev;
+    QVirtQueue *vq = v_iommu->vq;
+    uint64_t ro_addr, wr_addr;
+    uint32_t free_head;
+    struct virtio_iommu_req_map req;
+    size_t ro_size = sizeof(req) - sizeof(struct virtio_iommu_req_tail);
+    size_t wr_size = sizeof(struct virtio_iommu_req_tail);
+    struct virtio_iommu_req_tail buffer;
+    int ret;
+
+    req.head.type = VIRTIO_IOMMU_T_MAP;
+    req.domain = cpu_to_le32(domain);
+    req.virt_start = cpu_to_le64(virt_start);
+    req.virt_end = cpu_to_le64(virt_end);
+    req.phys_start = cpu_to_le64(phys_start);
+    req.flags = cpu_to_le32(flags);
+
+    ro_addr = guest_alloc(alloc, ro_size);
+    wr_addr = guest_alloc(alloc, wr_size);
+
+    qtest_memwrite(qts, ro_addr, &req, ro_size);
+    free_head = qvirtqueue_add(qts, vq, ro_addr, ro_size, false, true);
+    qvirtqueue_add(qts, vq, wr_addr, wr_size, true, false);
+    qvirtqueue_kick(qts, dev, vq, free_head);
+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
+                           QVIRTIO_IOMMU_TIMEOUT_US);
+    qtest_memread(qts, wr_addr, &buffer, wr_size);
+    ret = read_tail_status(&buffer);
+    guest_free(alloc, ro_addr);
+    guest_free(alloc, wr_addr);
+    return ret;
+}
+
+/**
+ * send_unmap - Send an unmap command to the device
+ * @domain: domain the new binding is attached to
+ * @virt_start: iova start
+ * @virt_end: iova end
+ */
+static int send_unmap(QTestState *qts, QVirtioIOMMU *v_iommu,
+                      uint32_t domain, uint64_t virt_start, uint64_t virt_end)
+{
+    QVirtioDevice *dev = v_iommu->vdev;
+    QVirtQueue *vq = v_iommu->vq;
+    uint64_t ro_addr, wr_addr;
+    uint32_t free_head;
+    struct virtio_iommu_req_unmap req;
+    size_t ro_size = sizeof(req) - sizeof(struct virtio_iommu_req_tail);
+    size_t wr_size = sizeof(struct virtio_iommu_req_tail);
+    struct virtio_iommu_req_tail buffer;
+    int ret;
+
+    req.head.type = VIRTIO_IOMMU_T_UNMAP;
+    req.domain = cpu_to_le32(domain);
+    req.virt_start = cpu_to_le64(virt_start);
+    req.virt_end = cpu_to_le64(virt_end);
+
+    ro_addr = guest_alloc(alloc, ro_size);
+    wr_addr = guest_alloc(alloc, wr_size);
+
+    qtest_memwrite(qts, ro_addr, &req, ro_size);
+    free_head = qvirtqueue_add(qts, vq, ro_addr, ro_size, false, true);
+    qvirtqueue_add(qts, vq, wr_addr, wr_size, true, false);
+    qvirtqueue_kick(qts, dev, vq, free_head);
+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
+                           QVIRTIO_IOMMU_TIMEOUT_US);
+    qtest_memread(qts, wr_addr, &buffer, wr_size);
+    ret = read_tail_status(&buffer);
+    guest_free(alloc, ro_addr);
+    guest_free(alloc, wr_addr);
+    return ret;
+}
+
+static void test_attach_detach(void *obj, void *data, QGuestAllocator *t_alloc)
+{
+    QVirtioIOMMU *v_iommu = obj;
+    QTestState *qts = global_qtest;
+    int ret;
+
+    alloc = t_alloc;
+
+    /* type, domain, ep */
+
+    /* attach ep0 to domain 0 */
+    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_ATTACH, 0, 0);
+    g_assert_cmpint(ret, ==, 0);
+
+    /* attach a non existing device */
+    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_ATTACH, 0, 444);
+    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_NOENT);
+
+    /* detach a non existing device (1) */
+    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_DETACH, 0, 1);
+    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_NOENT);
+
+    /* move ep0 from domain 0 to domain 1 */
+    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_ATTACH, 1, 0);
+    g_assert_cmpint(ret, ==, 0);
+
+    /* detach ep0 from domain 0 */
+    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_DETACH, 0, 0);
+    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_INVAL);
+
+    /* detach ep0 from domain 1 */
+    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_DETACH, 1, 0);
+    g_assert_cmpint(ret, ==, 0);
+
+    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_ATTACH, 1, 0);
+    g_assert_cmpint(ret, ==, 0);
+    ret = send_map(qts, v_iommu, 1, 0x0, 0xFFF, 0xa1000,
+                   VIRTIO_IOMMU_MAP_F_READ);
+    g_assert_cmpint(ret, ==, 0);
+    ret = send_map(qts, v_iommu, 1, 0x2000, 0x2FFF, 0xb1000,
+                   VIRTIO_IOMMU_MAP_F_READ);
+    g_assert_cmpint(ret, ==, 0);
+    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_DETACH, 1, 0);
+    g_assert_cmpint(ret, ==, 0);
+}
+
+/* Test map/unmap scenari documented in the spec */
+static void test_map_unmap(void *obj, void *data, QGuestAllocator *t_alloc)
+{
+    QVirtioIOMMU *v_iommu = obj;
+    QTestState *qts = global_qtest;
+    int ret;
+
+    alloc = t_alloc;
+
+    /* attach ep0 to domain 1 */
+    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_ATTACH, 1, 0);
+    g_assert_cmpint(ret, ==, 0);
+
+    ret = send_map(qts, v_iommu, 0, 0, 0xFFF, 0xa1000, VIRTIO_IOMMU_MAP_F_READ);
+    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_NOENT);
+
+    /* domain, virt start, virt end, phys start, flags */
+    ret = send_map(qts, v_iommu, 1, 0x0, 0xFFF, 0xa1000, VIRTIO_IOMMU_MAP_F_READ);
+    g_assert_cmpint(ret, ==, 0);
+
+    /* send a new mapping overlapping the previous one */
+    ret = send_map(qts, v_iommu, 1, 0, 0xFFFF, 0xb1000, VIRTIO_IOMMU_MAP_F_READ);
+    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_INVAL);
+
+    ret = send_unmap(qts, v_iommu, 4, 0x10, 0xFFF);
+    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_NOENT);
+
+    ret = send_unmap(qts, v_iommu, 1, 0x10, 0xFFF);
+    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_RANGE);
+
+    ret = send_unmap(qts, v_iommu, 1, 0, 0x1000);
+    g_assert_cmpint(ret, ==, 0); /* unmap everything */
+
+    /* Spec example sequence */
+
+    /* 1 */
+    ret = send_unmap(qts, v_iommu, 1, 0, 4);
+    g_assert_cmpint(ret, ==, 0); /* doesn't unmap anything */
+
+    /* 2 */
+    ret = send_map(qts, v_iommu, 1, 0, 9, 0xa1000, VIRTIO_IOMMU_MAP_F_READ);
+    g_assert_cmpint(ret, ==, 0);
+    ret = send_unmap(qts, v_iommu, 1, 0, 9);
+    g_assert_cmpint(ret, ==, 0); /* unmaps [0,9] */
+
+    /* 3 */
+    ret = send_map(qts, v_iommu, 1, 0, 4, 0xb1000, VIRTIO_IOMMU_MAP_F_READ);
+    g_assert_cmpint(ret, ==, 0);
+    ret = send_map(qts, v_iommu, 1, 5, 9, 0xb2000, VIRTIO_IOMMU_MAP_F_READ);
+    g_assert_cmpint(ret, ==, 0);
+    ret = send_unmap(qts, v_iommu, 1, 0, 9);
+    g_assert_cmpint(ret, ==, 0); /* unmaps [0,4] and [5,9] */
+
+    /* 4 */
+    ret = send_map(qts, v_iommu, 1, 0, 9, 0xc1000, VIRTIO_IOMMU_MAP_F_READ);
+    g_assert_cmpint(ret, ==, 0);
+
+    ret = send_unmap(qts, v_iommu, 1, 0, 4);
+    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_RANGE); /* doesn't unmap anything */
+
+    ret = send_unmap(qts, v_iommu, 1, 0, 10);
+    g_assert_cmpint(ret, ==, 0);
+
+    /* 5 */
+    ret = send_map(qts, v_iommu, 1, 0, 4, 0xd1000, VIRTIO_IOMMU_MAP_F_READ);
+    g_assert_cmpint(ret, ==, 0);
+    ret = send_map(qts, v_iommu, 1, 5, 9, 0xd2000, VIRTIO_IOMMU_MAP_F_READ);
+    g_assert_cmpint(ret, ==, 0);
+    ret = send_unmap(qts, v_iommu, 1, 0, 4);
+    g_assert_cmpint(ret, ==, 0); /* unmaps [0,4] */
+
+    ret = send_unmap(qts, v_iommu, 1, 5, 9);
+    g_assert_cmpint(ret, ==, 0);
+
+    /* 6 */
+    ret = send_map(qts, v_iommu, 1, 0, 4, 0xe2000, VIRTIO_IOMMU_MAP_F_READ);
+    g_assert_cmpint(ret, ==, 0);
+    ret = send_unmap(qts, v_iommu, 1, 0, 9);
+    g_assert_cmpint(ret, ==, 0); /* unmaps [0,4] */
+
+    /* 7 */
+    ret = send_map(qts, v_iommu, 1, 0, 4, 0xf2000, VIRTIO_IOMMU_MAP_F_READ);
+    g_assert_cmpint(ret, ==, 0);
+    ret = send_map(qts, v_iommu, 1, 10, 14, 0xf3000, VIRTIO_IOMMU_MAP_F_READ);
+    g_assert_cmpint(ret, ==, 0);
+    ret = send_unmap(qts, v_iommu, 1, 0, 14);
+    g_assert_cmpint(ret, ==, 0); /* unmaps [0,4] and [10,14] */
+
+    ret = send_map(qts, v_iommu, 1, 10, 14, 0xf3000, VIRTIO_IOMMU_MAP_F_READ);
+    g_assert_cmpint(ret, ==, 0);
+    ret = send_map(qts, v_iommu, 1, 0, 4, 0xf2000, VIRTIO_IOMMU_MAP_F_READ);
+    g_assert_cmpint(ret, ==, 0);
+    ret = send_unmap(qts, v_iommu, 1, 0, 4);
+    g_assert_cmpint(ret, ==, 0); /* only unmaps [0,4] */
+    ret = send_map(qts, v_iommu, 1, 10, 14, 0xf3000, VIRTIO_IOMMU_MAP_F_READ);
+    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_INVAL); /* 10-14 still is mapped */
+}
+
+static void register_virtio_iommu_test(void)
+{
+    qos_add_test("config", "virtio-iommu", pci_config, NULL);
+    qos_add_test("attach_detach", "virtio-iommu", test_attach_detach, NULL);
+    qos_add_test("map_unmap", "virtio-iommu", test_map_unmap, NULL);
+}
+
+libqos_init(register_virtio_iommu_test);
-- 
2.26.3


