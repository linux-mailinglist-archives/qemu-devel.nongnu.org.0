Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B083CD3BDD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 11:04:56 +0200 (CEST)
Received: from localhost ([::1]:47516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIqr1-0003Sq-Ol
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 05:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47645)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iIqj7-00038F-ND
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:56:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iIqj6-0007uS-G6
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:56:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35610)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iIqj6-0007uC-7v
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:56:44 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 807C8801662
 for <qemu-devel@nongnu.org>; Fri, 11 Oct 2019 08:56:43 +0000 (UTC)
Received: from localhost (unknown [10.36.118.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A0E05C1B2;
 Fri, 11 Oct 2019 08:56:38 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] libqos: expose common virtqueue setup/cleanup functions
Date: Fri, 11 Oct 2019 09:56:09 +0100
Message-Id: <20191011085611.4194-6-stefanha@redhat.com>
In-Reply-To: <20191011085611.4194-1-stefanha@redhat.com>
References: <20191011085611.4194-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Fri, 11 Oct 2019 08:56:43 +0000 (UTC)
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VIRTIO 1.0 code will need to perform additional steps but it will
reuse the common virtqueue setup/cleanup code.  Make these functions
public.

Make sure to invoke callbacks via QVirtioBus instead of directly calling
the virtio-pci Legacy versions of these functions.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/libqos/virtio-pci.h |  8 ++++++++
 tests/libqos/virtio-pci.c | 19 ++++++++++---------
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/tests/libqos/virtio-pci.h b/tests/libqos/virtio-pci.h
index 443e53affc..b620c30451 100644
--- a/tests/libqos/virtio-pci.h
+++ b/tests/libqos/virtio-pci.h
@@ -63,4 +63,12 @@ void qvirtio_pci_set_msix_configuration_vector(QVirtio=
PCIDevice *d,
                                         QGuestAllocator *alloc, uint16_t=
 entry);
 void qvirtqueue_pci_msix_setup(QVirtioPCIDevice *d, QVirtQueuePCI *vqpci=
,
                                         QGuestAllocator *alloc, uint16_t=
 entry);
+
+/* Used by Legacy and Modern virtio-pci code */
+QVirtQueue *qvirtio_pci_virtqueue_setup_common(QVirtioDevice *d,
+                                               QGuestAllocator *alloc,
+                                               uint16_t index);
+void qvirtio_pci_virtqueue_cleanup_common(QVirtQueue *vq,
+                                          QGuestAllocator *alloc);
+
 #endif
diff --git a/tests/libqos/virtio-pci.c b/tests/libqos/virtio-pci.c
index 651f6dbfc6..3fb4af4016 100644
--- a/tests/libqos/virtio-pci.c
+++ b/tests/libqos/virtio-pci.c
@@ -198,8 +198,9 @@ static void qvirtio_pci_set_queue_address(QVirtioDevi=
ce *d, QVirtQueue *vq)
     qpci_io_writel(dev->pdev, dev->bar, VIRTIO_PCI_QUEUE_PFN, pfn);
 }
=20
-static QVirtQueue *qvirtio_pci_virtqueue_setup(QVirtioDevice *d,
-                                        QGuestAllocator *alloc, uint16_t=
 index)
+QVirtQueue *qvirtio_pci_virtqueue_setup_common(QVirtioDevice *d,
+                                               QGuestAllocator *alloc,
+                                               uint16_t index)
 {
     uint32_t feat;
     uint64_t addr;
@@ -207,11 +208,11 @@ static QVirtQueue *qvirtio_pci_virtqueue_setup(QVir=
tioDevice *d,
     QVirtioPCIDevice *qvpcidev =3D container_of(d, QVirtioPCIDevice, vde=
v);
=20
     vqpci =3D g_malloc0(sizeof(*vqpci));
-    feat =3D qvirtio_pci_get_guest_features(d);
+    feat =3D d->bus->get_guest_features(d);
=20
-    qvirtio_pci_queue_select(d, index);
+    d->bus->queue_select(d, index);
     vqpci->vq.index =3D index;
-    vqpci->vq.size =3D qvirtio_pci_get_queue_size(d);
+    vqpci->vq.size =3D d->bus->get_queue_size(d);
     vqpci->vq.free_head =3D 0;
     vqpci->vq.num_free =3D vqpci->vq.size;
     vqpci->vq.align =3D VIRTIO_PCI_VRING_ALIGN;
@@ -231,12 +232,12 @@ static QVirtQueue *qvirtio_pci_virtqueue_setup(QVir=
tioDevice *d,
     addr =3D guest_alloc(alloc, qvring_size(vqpci->vq.size,
                                           VIRTIO_PCI_VRING_ALIGN));
     qvring_init(qvpcidev->pdev->bus->qts, alloc, &vqpci->vq, addr);
-    qvirtio_pci_set_queue_address(d, &vqpci->vq);
+    d->bus->set_queue_address(d, &vqpci->vq);
=20
     return &vqpci->vq;
 }
=20
-static void qvirtio_pci_virtqueue_cleanup(QVirtQueue *vq,
+void qvirtio_pci_virtqueue_cleanup_common(QVirtQueue *vq,
                                           QGuestAllocator *alloc)
 {
     QVirtQueuePCI *vqpci =3D container_of(vq, QVirtQueuePCI, vq);
@@ -266,8 +267,8 @@ static const QVirtioBus qvirtio_pci_legacy =3D {
     .queue_select =3D qvirtio_pci_queue_select,
     .get_queue_size =3D qvirtio_pci_get_queue_size,
     .set_queue_address =3D qvirtio_pci_set_queue_address,
-    .virtqueue_setup =3D qvirtio_pci_virtqueue_setup,
-    .virtqueue_cleanup =3D qvirtio_pci_virtqueue_cleanup,
+    .virtqueue_setup =3D qvirtio_pci_virtqueue_setup_common,
+    .virtqueue_cleanup =3D qvirtio_pci_virtqueue_cleanup_common,
     .virtqueue_kick =3D qvirtio_pci_virtqueue_kick,
 };
=20
--=20
2.21.0


