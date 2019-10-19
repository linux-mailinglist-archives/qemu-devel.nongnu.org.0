Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB77BDD702
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Oct 2019 08:52:07 +0200 (CEST)
Received: from localhost ([::1]:50012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLiat-0000KP-13
	for lists+qemu-devel@lfdr.de; Sat, 19 Oct 2019 02:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59935)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iLiP6-0003yZ-6T
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 02:39:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iLiP4-0004KO-QQ
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 02:39:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50664)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1iLiP1-0004IH-WC; Sat, 19 Oct 2019 02:39:52 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 333418535D;
 Sat, 19 Oct 2019 06:39:51 +0000 (UTC)
Received: from localhost (ovpn-116-50.ams2.redhat.com [10.36.116.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D6F45D717;
 Sat, 19 Oct 2019 06:39:42 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/16] libqos: add MSI-X callbacks to QVirtioPCIDevice
Date: Sat, 19 Oct 2019 07:38:06 +0100
Message-Id: <20191019063810.6944-13-stefanha@redhat.com>
In-Reply-To: <20191019063810.6944-1-stefanha@redhat.com>
References: <20191019063810.6944-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Sat, 19 Oct 2019 06:39:51 +0000 (UTC)
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

The MSI-X vectors are programmed differently in the VIRTIO 1.0 and
Legacy interfaces.  Introduce callbacks so different implementations can
be used depending on the interface version.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/libqos/virtio-pci.h | 12 ++++++++++++
 tests/libqos/virtio-pci.c | 37 ++++++++++++++++++++++++++++---------
 2 files changed, 40 insertions(+), 9 deletions(-)

diff --git a/tests/libqos/virtio-pci.h b/tests/libqos/virtio-pci.h
index 728b4715f1..4299efc023 100644
--- a/tests/libqos/virtio-pci.h
+++ b/tests/libqos/virtio-pci.h
@@ -14,16 +14,28 @@
 #include "libqos/pci.h"
 #include "libqos/qgraph.h"
=20
+typedef struct QVirtioPCIMSIXOps QVirtioPCIMSIXOps;
+
 typedef struct QVirtioPCIDevice {
     QOSGraphObject obj;
     QVirtioDevice vdev;
     QPCIDevice *pdev;
     QPCIBar bar;
+    const QVirtioPCIMSIXOps *msix_ops;
     uint16_t config_msix_entry;
     uint64_t config_msix_addr;
     uint32_t config_msix_data;
 } QVirtioPCIDevice;
=20
+struct QVirtioPCIMSIXOps {
+    /* Set the Configuration Vector for MSI-X */
+    void (*set_config_vector)(QVirtioPCIDevice *d, uint16_t entry);
+
+    /* Set the Queue Vector for MSI-X */
+    void (*set_queue_vector)(QVirtioPCIDevice *d, uint16_t vq_idx,
+                             uint16_t entry);
+};
+
 typedef struct QVirtQueuePCI {
     QVirtQueue vq;
     uint16_t msix_entry;
diff --git a/tests/libqos/virtio-pci.c b/tests/libqos/virtio-pci.c
index e4fa318dcc..0725777a8d 100644
--- a/tests/libqos/virtio-pci.c
+++ b/tests/libqos/virtio-pci.c
@@ -281,6 +281,31 @@ const QVirtioBus qvirtio_pci =3D {
     .virtqueue_kick =3D qvirtio_pci_virtqueue_kick,
 };
=20
+static void qvirtio_pci_set_config_vector(QVirtioPCIDevice *d, uint16_t =
entry)
+{
+    uint16_t vector;
+
+    qpci_io_writew(d->pdev, d->bar, VIRTIO_MSI_CONFIG_VECTOR, entry);
+    vector =3D qpci_io_readw(d->pdev, d->bar, VIRTIO_MSI_CONFIG_VECTOR);
+    g_assert_cmphex(vector, !=3D, VIRTIO_MSI_NO_VECTOR);
+}
+
+static void qvirtio_pci_set_queue_vector(QVirtioPCIDevice *d, uint16_t v=
q_idx,
+                                         uint16_t entry)
+{
+    uint16_t vector;
+
+    qvirtio_pci_queue_select(&d->vdev, vq_idx);
+    qpci_io_writew(d->pdev, d->bar, VIRTIO_MSI_QUEUE_VECTOR, entry);
+    vector =3D qpci_io_readw(d->pdev, d->bar, VIRTIO_MSI_QUEUE_VECTOR);
+    g_assert_cmphex(vector, !=3D, VIRTIO_MSI_NO_VECTOR);
+}
+
+static const QVirtioPCIMSIXOps qvirtio_pci_msix_ops_legacy =3D {
+    .set_config_vector =3D qvirtio_pci_set_config_vector,
+    .set_queue_vector =3D qvirtio_pci_set_queue_vector,
+};
+
 void qvirtio_pci_device_enable(QVirtioPCIDevice *d)
 {
     qpci_device_enable(d->pdev);
@@ -295,7 +320,6 @@ void qvirtio_pci_device_disable(QVirtioPCIDevice *d)
 void qvirtqueue_pci_msix_setup(QVirtioPCIDevice *d, QVirtQueuePCI *vqpci=
,
                                         QGuestAllocator *alloc, uint16_t=
 entry)
 {
-    uint16_t vector;
     uint32_t control;
     uint64_t off;
=20
@@ -321,16 +345,12 @@ void qvirtqueue_pci_msix_setup(QVirtioPCIDevice *d,=
 QVirtQueuePCI *vqpci,
                    off + PCI_MSIX_ENTRY_VECTOR_CTRL,
                    control & ~PCI_MSIX_ENTRY_CTRL_MASKBIT);
=20
-    qvirtio_pci_queue_select(&d->vdev, vqpci->vq.index);
-    qpci_io_writew(d->pdev, d->bar, VIRTIO_MSI_QUEUE_VECTOR, entry);
-    vector =3D qpci_io_readw(d->pdev, d->bar, VIRTIO_MSI_QUEUE_VECTOR);
-    g_assert_cmphex(vector, !=3D, VIRTIO_MSI_NO_VECTOR);
+    d->msix_ops->set_queue_vector(d, vqpci->vq.index, entry);
 }
=20
 void qvirtio_pci_set_msix_configuration_vector(QVirtioPCIDevice *d,
                                         QGuestAllocator *alloc, uint16_t=
 entry)
 {
-    uint16_t vector;
     uint32_t control;
     uint64_t off;
=20
@@ -358,9 +378,7 @@ void qvirtio_pci_set_msix_configuration_vector(QVirti=
oPCIDevice *d,
                    off + PCI_MSIX_ENTRY_VECTOR_CTRL,
                    control & ~PCI_MSIX_ENTRY_CTRL_MASKBIT);
=20
-    qpci_io_writew(d->pdev, d->bar, VIRTIO_MSI_CONFIG_VECTOR, entry);
-    vector =3D qpci_io_readw(d->pdev, d->bar, VIRTIO_MSI_CONFIG_VECTOR);
-    g_assert_cmphex(vector, !=3D, VIRTIO_MSI_NO_VECTOR);
+    d->msix_ops->set_config_vector(d, entry);
 }
=20
 void qvirtio_pci_destructor(QOSGraphObject *obj)
@@ -383,6 +401,7 @@ static void qvirtio_pci_init_from_pcidev(QVirtioPCIDe=
vice *dev, QPCIDevice *pci_
     dev->vdev.device_type =3D qpci_config_readw(pci_dev, PCI_SUBSYSTEM_I=
D);
=20
     dev->config_msix_entry =3D -1;
+    dev->msix_ops =3D &qvirtio_pci_msix_ops_legacy;
=20
     dev->vdev.bus =3D &qvirtio_pci;
     dev->vdev.big_endian =3D qvirtio_pci_is_big_endian(dev);
--=20
2.21.0


