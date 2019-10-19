Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6342DD6F4
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Oct 2019 08:41:00 +0200 (CEST)
Received: from localhost ([::1]:49886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLiQ7-0004S8-DT
	for lists+qemu-devel@lfdr.de; Sat, 19 Oct 2019 02:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59670)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iLiNz-0002W9-J4
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 02:38:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iLiNx-0003MQ-TR
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 02:38:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43288)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1iLiNt-0003Go-Uj; Sat, 19 Oct 2019 02:38:42 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2E3CD882F5;
 Sat, 19 Oct 2019 06:38:41 +0000 (UTC)
Received: from localhost (ovpn-116-50.ams2.redhat.com [10.36.116.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5108860BF3;
 Sat, 19 Oct 2019 06:38:32 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/16] libqos: extend feature bits to 64-bit
Date: Sat, 19 Oct 2019 07:37:57 +0100
Message-Id: <20191019063810.6944-4-stefanha@redhat.com>
In-Reply-To: <20191019063810.6944-1-stefanha@redhat.com>
References: <20191019063810.6944-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Sat, 19 Oct 2019 06:38:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org, slp@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In VIRTIO 1.0 feature bits changed from 32-bit to 64-bit.  (In fact, the
transports allow even more feature bits but nothing uses more than 64
bits today.)

Add 64-bit feature bit support to virtio-mmio and virtio-pci.  This will
be necessary for VIRTIO 1.0 support.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/libqos/virtio.h      | 12 ++++++------
 tests/libqos/virtio-mmio.c | 28 ++++++++++++++++++++++------
 tests/libqos/virtio-net.c  |  6 +++---
 tests/libqos/virtio-pci.c  | 12 ++++++------
 tests/libqos/virtio.c      |  4 ++--
 tests/virtio-blk-test.c    |  8 ++++----
 6 files changed, 43 insertions(+), 27 deletions(-)

diff --git a/tests/libqos/virtio.h b/tests/libqos/virtio.h
index 2cb2448f46..a5c99fb3c9 100644
--- a/tests/libqos/virtio.h
+++ b/tests/libqos/virtio.h
@@ -13,7 +13,7 @@
 #include "libqos/malloc.h"
 #include "standard-headers/linux/virtio_ring.h"
=20
-#define QVIRTIO_F_BAD_FEATURE           0x40000000
+#define QVIRTIO_F_BAD_FEATURE           0x40000000ull
=20
 typedef struct QVirtioBus QVirtioBus;
=20
@@ -52,13 +52,13 @@ struct QVirtioBus {
     uint64_t (*config_readq)(QVirtioDevice *d, uint64_t addr);
=20
     /* Get features of the device */
-    uint32_t (*get_features)(QVirtioDevice *d);
+    uint64_t (*get_features)(QVirtioDevice *d);
=20
     /* Set features of the device */
-    void (*set_features)(QVirtioDevice *d, uint32_t features);
+    void (*set_features)(QVirtioDevice *d, uint64_t features);
=20
     /* Get features of the guest */
-    uint32_t (*get_guest_features)(QVirtioDevice *d);
+    uint64_t (*get_guest_features)(QVirtioDevice *d);
=20
     /* Get status of the device */
     uint8_t (*get_status)(QVirtioDevice *d);
@@ -103,8 +103,8 @@ uint8_t qvirtio_config_readb(QVirtioDevice *d, uint64=
_t addr);
 uint16_t qvirtio_config_readw(QVirtioDevice *d, uint64_t addr);
 uint32_t qvirtio_config_readl(QVirtioDevice *d, uint64_t addr);
 uint64_t qvirtio_config_readq(QVirtioDevice *d, uint64_t addr);
-uint32_t qvirtio_get_features(QVirtioDevice *d);
-void qvirtio_set_features(QVirtioDevice *d, uint32_t features);
+uint64_t qvirtio_get_features(QVirtioDevice *d);
+void qvirtio_set_features(QVirtioDevice *d, uint64_t features);
 bool qvirtio_is_big_endian(QVirtioDevice *d);
=20
 void qvirtio_reset(QVirtioDevice *d);
diff --git a/tests/libqos/virtio-mmio.c b/tests/libqos/virtio-mmio.c
index 7154b03c1d..78066e6e05 100644
--- a/tests/libqos/virtio-mmio.c
+++ b/tests/libqos/virtio-mmio.c
@@ -40,22 +40,38 @@ static uint64_t qvirtio_mmio_config_readq(QVirtioDevi=
ce *d, uint64_t off)
     return qtest_readq(dev->qts, dev->addr + QVIRTIO_MMIO_DEVICE_SPECIFI=
C + off);
 }
=20
-static uint32_t qvirtio_mmio_get_features(QVirtioDevice *d)
+static uint64_t qvirtio_mmio_get_features(QVirtioDevice *d)
 {
     QVirtioMMIODevice *dev =3D container_of(d, QVirtioMMIODevice, vdev);
+    uint64_t lo;
+    uint64_t hi =3D 0;
+
     qtest_writel(dev->qts, dev->addr + QVIRTIO_MMIO_HOST_FEATURES_SEL, 0=
);
-    return qtest_readl(dev->qts, dev->addr + QVIRTIO_MMIO_HOST_FEATURES)=
;
+    lo =3D qtest_readl(dev->qts, dev->addr + QVIRTIO_MMIO_HOST_FEATURES)=
;
+
+    if (dev->version >=3D 2) {
+        qtest_writel(dev->qts, dev->addr + QVIRTIO_MMIO_HOST_FEATURES_SE=
L, 1);
+        hi =3D qtest_readl(dev->qts, dev->addr + QVIRTIO_MMIO_HOST_FEATU=
RES);
+    }
+
+    return (hi << 32) | lo;
 }
=20
-static void qvirtio_mmio_set_features(QVirtioDevice *d, uint32_t feature=
s)
+static void qvirtio_mmio_set_features(QVirtioDevice *d, uint64_t feature=
s)
 {
     QVirtioMMIODevice *dev =3D container_of(d, QVirtioMMIODevice, vdev);
     dev->features =3D features;
     qtest_writel(dev->qts, dev->addr + QVIRTIO_MMIO_GUEST_FEATURES_SEL, =
0);
     qtest_writel(dev->qts, dev->addr + QVIRTIO_MMIO_GUEST_FEATURES, feat=
ures);
+
+    if (dev->version >=3D 2) {
+        qtest_writel(dev->qts, dev->addr + QVIRTIO_MMIO_GUEST_FEATURES_S=
EL, 1);
+        qtest_writel(dev->qts, dev->addr + QVIRTIO_MMIO_GUEST_FEATURES,
+                     features >> 32);
+    }
 }
=20
-static uint32_t qvirtio_mmio_get_guest_features(QVirtioDevice *d)
+static uint64_t qvirtio_mmio_get_guest_features(QVirtioDevice *d)
 {
     QVirtioMMIODevice *dev =3D container_of(d, QVirtioMMIODevice, vdev);
     return dev->features;
@@ -149,8 +165,8 @@ static QVirtQueue *qvirtio_mmio_virtqueue_setup(QVirt=
ioDevice *d,
     vq->free_head =3D 0;
     vq->num_free =3D vq->size;
     vq->align =3D dev->page_size;
-    vq->indirect =3D (dev->features & (1u << VIRTIO_RING_F_INDIRECT_DESC=
)) !=3D 0;
-    vq->event =3D (dev->features & (1u << VIRTIO_RING_F_EVENT_IDX)) !=3D=
 0;
+    vq->indirect =3D dev->features & (1ull << VIRTIO_RING_F_INDIRECT_DES=
C);
+    vq->event =3D dev->features & (1ull << VIRTIO_RING_F_EVENT_IDX);
=20
     qtest_writel(dev->qts, dev->addr + QVIRTIO_MMIO_QUEUE_NUM, vq->size)=
;
=20
diff --git a/tests/libqos/virtio-net.c b/tests/libqos/virtio-net.c
index 6567beb553..710d440c3d 100644
--- a/tests/libqos/virtio-net.c
+++ b/tests/libqos/virtio-net.c
@@ -44,11 +44,11 @@ static void virtio_net_setup(QVirtioNet *interface)
=20
     features =3D qvirtio_get_features(vdev);
     features &=3D ~(QVIRTIO_F_BAD_FEATURE |
-                  (1u << VIRTIO_RING_F_INDIRECT_DESC) |
-                  (1u << VIRTIO_RING_F_EVENT_IDX));
+                  (1ull << VIRTIO_RING_F_INDIRECT_DESC) |
+                  (1ull << VIRTIO_RING_F_EVENT_IDX));
     qvirtio_set_features(vdev, features);
=20
-    if (features & (1u << VIRTIO_NET_F_MQ)) {
+    if (features & (1ull << VIRTIO_NET_F_MQ)) {
         interface->n_queues =3D qvirtio_config_readw(vdev, 8) * 2;
     } else {
         interface->n_queues =3D 2;
diff --git a/tests/libqos/virtio-pci.c b/tests/libqos/virtio-pci.c
index 50499e75ef..1b6b760fc6 100644
--- a/tests/libqos/virtio-pci.c
+++ b/tests/libqos/virtio-pci.c
@@ -96,19 +96,19 @@ static uint64_t qvirtio_pci_config_readq(QVirtioDevic=
e *d, uint64_t off)
     return val;
 }
=20
-static uint32_t qvirtio_pci_get_features(QVirtioDevice *d)
+static uint64_t qvirtio_pci_get_features(QVirtioDevice *d)
 {
     QVirtioPCIDevice *dev =3D container_of(d, QVirtioPCIDevice, vdev);
     return qpci_io_readl(dev->pdev, dev->bar, VIRTIO_PCI_HOST_FEATURES);
 }
=20
-static void qvirtio_pci_set_features(QVirtioDevice *d, uint32_t features=
)
+static void qvirtio_pci_set_features(QVirtioDevice *d, uint64_t features=
)
 {
     QVirtioPCIDevice *dev =3D container_of(d, QVirtioPCIDevice, vdev);
     qpci_io_writel(dev->pdev, dev->bar, VIRTIO_PCI_GUEST_FEATURES, featu=
res);
 }
=20
-static uint32_t qvirtio_pci_get_guest_features(QVirtioDevice *d)
+static uint64_t qvirtio_pci_get_guest_features(QVirtioDevice *d)
 {
     QVirtioPCIDevice *dev =3D container_of(d, QVirtioPCIDevice, vdev);
     return qpci_io_readl(dev->pdev, dev->bar, VIRTIO_PCI_GUEST_FEATURES)=
;
@@ -208,7 +208,7 @@ static void qvirtio_pci_set_queue_address(QVirtioDevi=
ce *d, uint32_t pfn)
 static QVirtQueue *qvirtio_pci_virtqueue_setup(QVirtioDevice *d,
                                         QGuestAllocator *alloc, uint16_t=
 index)
 {
-    uint32_t feat;
+    uint64_t feat;
     uint64_t addr;
     QVirtQueuePCI *vqpci;
     QVirtioPCIDevice *qvpcidev =3D container_of(d, QVirtioPCIDevice, vde=
v);
@@ -222,8 +222,8 @@ static QVirtQueue *qvirtio_pci_virtqueue_setup(QVirti=
oDevice *d,
     vqpci->vq.free_head =3D 0;
     vqpci->vq.num_free =3D vqpci->vq.size;
     vqpci->vq.align =3D VIRTIO_PCI_VRING_ALIGN;
-    vqpci->vq.indirect =3D (feat & (1u << VIRTIO_RING_F_INDIRECT_DESC)) =
!=3D 0;
-    vqpci->vq.event =3D (feat & (1u << VIRTIO_RING_F_EVENT_IDX)) !=3D 0;
+    vqpci->vq.indirect =3D feat & (1ull << VIRTIO_RING_F_INDIRECT_DESC);
+    vqpci->vq.event =3D feat & (1ull << VIRTIO_RING_F_EVENT_IDX);
=20
     vqpci->msix_entry =3D -1;
     vqpci->msix_addr =3D 0;
diff --git a/tests/libqos/virtio.c b/tests/libqos/virtio.c
index 0ae9956fc8..4f7e6bb8a1 100644
--- a/tests/libqos/virtio.c
+++ b/tests/libqos/virtio.c
@@ -33,12 +33,12 @@ uint64_t qvirtio_config_readq(QVirtioDevice *d, uint6=
4_t addr)
     return d->bus->config_readq(d, addr);
 }
=20
-uint32_t qvirtio_get_features(QVirtioDevice *d)
+uint64_t qvirtio_get_features(QVirtioDevice *d)
 {
     return d->bus->get_features(d);
 }
=20
-void qvirtio_set_features(QVirtioDevice *d, uint32_t features)
+void qvirtio_set_features(QVirtioDevice *d, uint64_t features)
 {
     d->features =3D features;
     d->bus->set_features(d, features);
diff --git a/tests/virtio-blk-test.c b/tests/virtio-blk-test.c
index f6674fb233..31680cc159 100644
--- a/tests/virtio-blk-test.c
+++ b/tests/virtio-blk-test.c
@@ -119,7 +119,7 @@ static void test_basic(QVirtioDevice *dev, QGuestAllo=
cator *alloc,
     QVirtioBlkReq req;
     uint64_t req_addr;
     uint64_t capacity;
-    uint32_t features;
+    uint64_t features;
     uint32_t free_head;
     uint8_t status;
     char *data;
@@ -352,7 +352,7 @@ static void indirect(void *obj, void *u_data, QGuestA=
llocator *t_alloc)
     QVRingIndirectDesc *indirect;
     uint64_t req_addr;
     uint64_t capacity;
-    uint32_t features;
+    uint64_t features;
     uint32_t free_head;
     uint8_t status;
     char *data;
@@ -467,7 +467,7 @@ static void msix(void *obj, void *u_data, QGuestAlloc=
ator *t_alloc)
     int n_size =3D TEST_IMAGE_SIZE / 2;
     uint64_t req_addr;
     uint64_t capacity;
-    uint32_t features;
+    uint64_t features;
     uint32_t free_head;
     uint8_t status;
     char *data;
@@ -574,7 +574,7 @@ static void idx(void *obj, void *u_data, QGuestAlloca=
tor *t_alloc)
     QVirtioBlkReq req;
     uint64_t req_addr;
     uint64_t capacity;
-    uint32_t features;
+    uint64_t features;
     uint32_t free_head;
     uint32_t write_head;
     uint32_t desc_idx;
--=20
2.21.0


