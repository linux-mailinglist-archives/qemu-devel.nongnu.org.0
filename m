Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8D9D3BD7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 11:02:32 +0200 (CEST)
Received: from localhost ([::1]:47492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIqoe-00017P-Vb
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 05:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47600)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iIqiz-0002w7-BL
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:56:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iIqiy-0007qk-65
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:56:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43702)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iIqix-0007pb-UH
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:56:36 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 21E7E8AC6FD
 for <qemu-devel@nongnu.org>; Fri, 11 Oct 2019 08:56:35 +0000 (UTC)
Received: from localhost (unknown [10.36.118.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B62CA10013D9;
 Fri, 11 Oct 2019 08:56:28 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] libqos: pass full QVirtQueue to set_queue_address()
Date: Fri, 11 Oct 2019 09:56:07 +0100
Message-Id: <20191011085611.4194-4-stefanha@redhat.com>
In-Reply-To: <20191011085611.4194-1-stefanha@redhat.com>
References: <20191011085611.4194-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Fri, 11 Oct 2019 08:56:35 +0000 (UTC)
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

Instead of just passing the vring page frame number, pass the full
QVirtQueue.  This will allow the VIRTIO 1.0 transport to program the
fine-grained vring address registers in the future.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/libqos/virtio.h      | 2 +-
 tests/libqos/virtio-mmio.c | 6 ++++--
 tests/libqos/virtio-pci.c  | 6 ++++--
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/libqos/virtio.h b/tests/libqos/virtio.h
index 2cb2448f46..37f55b6ade 100644
--- a/tests/libqos/virtio.h
+++ b/tests/libqos/virtio.h
@@ -79,7 +79,7 @@ struct QVirtioBus {
     uint16_t (*get_queue_size)(QVirtioDevice *d);
=20
     /* Set the address of the selected queue */
-    void (*set_queue_address)(QVirtioDevice *d, uint32_t pfn);
+    void (*set_queue_address)(QVirtioDevice *d, QVirtQueue *vq);
=20
     /* Setup the virtqueue specified by index */
     QVirtQueue *(*virtqueue_setup)(QVirtioDevice *d, QGuestAllocator *al=
loc,
diff --git a/tests/libqos/virtio-mmio.c b/tests/libqos/virtio-mmio.c
index d0047876a8..43ca4e49c1 100644
--- a/tests/libqos/virtio-mmio.c
+++ b/tests/libqos/virtio-mmio.c
@@ -127,9 +127,11 @@ static uint16_t qvirtio_mmio_get_queue_size(QVirtioD=
evice *d)
     return (uint16_t)qtest_readl(dev->qts, dev->addr + QVIRTIO_MMIO_QUEU=
E_NUM_MAX);
 }
=20
-static void qvirtio_mmio_set_queue_address(QVirtioDevice *d, uint32_t pf=
n)
+static void qvirtio_mmio_set_queue_address(QVirtioDevice *d, QVirtQueue =
*vq)
 {
     QVirtioMMIODevice *dev =3D container_of(d, QVirtioMMIODevice, vdev);
+    uint64_t pfn =3D vq->desc / dev->page_size;
+
     qtest_writel(dev->qts, dev->addr + QVIRTIO_MMIO_QUEUE_PFN, pfn);
 }
=20
@@ -162,7 +164,7 @@ static QVirtQueue *qvirtio_mmio_virtqueue_setup(QVirt=
ioDevice *d,
=20
     addr =3D guest_alloc(alloc, qvring_size(vq->size, dev->page_size));
     qvring_init(dev->qts, alloc, vq, addr);
-    qvirtio_mmio_set_queue_address(d, vq->desc / dev->page_size);
+    qvirtio_mmio_set_queue_address(d, vq);
=20
     return vq;
 }
diff --git a/tests/libqos/virtio-pci.c b/tests/libqos/virtio-pci.c
index c8d736f4d1..4772239b61 100644
--- a/tests/libqos/virtio-pci.c
+++ b/tests/libqos/virtio-pci.c
@@ -190,9 +190,11 @@ static uint16_t qvirtio_pci_get_queue_size(QVirtioDe=
vice *d)
     return qpci_io_readw(dev->pdev, dev->bar, VIRTIO_PCI_QUEUE_NUM);
 }
=20
-static void qvirtio_pci_set_queue_address(QVirtioDevice *d, uint32_t pfn=
)
+static void qvirtio_pci_set_queue_address(QVirtioDevice *d, QVirtQueue *=
vq)
 {
     QVirtioPCIDevice *dev =3D container_of(d, QVirtioPCIDevice, vdev);
+    uint64_t pfn =3D vq->desc / VIRTIO_PCI_VRING_ALIGN;
+
     qpci_io_writel(dev->pdev, dev->bar, VIRTIO_PCI_QUEUE_PFN, pfn);
 }
=20
@@ -229,7 +231,7 @@ static QVirtQueue *qvirtio_pci_virtqueue_setup(QVirti=
oDevice *d,
     addr =3D guest_alloc(alloc, qvring_size(vqpci->vq.size,
                                           VIRTIO_PCI_VRING_ALIGN));
     qvring_init(qvpcidev->pdev->bus->qts, alloc, &vqpci->vq, addr);
-    qvirtio_pci_set_queue_address(d, vqpci->vq.desc / VIRTIO_PCI_VRING_A=
LIGN);
+    qvirtio_pci_set_queue_address(d, &vqpci->vq);
=20
     return &vqpci->vq;
 }
--=20
2.21.0


