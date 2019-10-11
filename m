Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 225A3D3BC3
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 10:58:40 +0200 (CEST)
Received: from localhost ([::1]:47442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIqkw-00058H-T9
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 04:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47540)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iIqil-0002ZZ-En
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:56:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iIqik-0007ia-6S
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:56:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50414)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iIqij-0007hq-V2
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:56:22 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 343CC3082DDD
 for <qemu-devel@nongnu.org>; Fri, 11 Oct 2019 08:56:21 +0000 (UTC)
Received: from localhost (unknown [10.36.118.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9BF360BE1;
 Fri, 11 Oct 2019 08:56:20 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/7] libqos: extract Legacy virtio-pci.c code
Date: Fri, 11 Oct 2019 09:56:05 +0100
Message-Id: <20191011085611.4194-2-stefanha@redhat.com>
In-Reply-To: <20191011085611.4194-1-stefanha@redhat.com>
References: <20191011085611.4194-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 11 Oct 2019 08:56:21 +0000 (UTC)
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

The current libqos virtio-pci.c code implements the VIRTIO Legacy
interface.  Extract existing code in preparation for VIRTIO 1.0 support.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/libqos/virtio-pci.h |  2 --
 tests/libqos/virtio-pci.c | 25 ++++++++++---------------
 2 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/tests/libqos/virtio-pci.h b/tests/libqos/virtio-pci.h
index 728b4715f1..0d105d67b3 100644
--- a/tests/libqos/virtio-pci.h
+++ b/tests/libqos/virtio-pci.h
@@ -31,8 +31,6 @@ typedef struct QVirtQueuePCI {
     uint32_t msix_data;
 } QVirtQueuePCI;
=20
-extern const QVirtioBus qvirtio_pci;
-
 void virtio_pci_init(QVirtioPCIDevice *dev, QPCIBus *bus, QPCIAddress * =
addr);
 QVirtioPCIDevice *virtio_pci_new(QPCIBus *bus, QPCIAddress * addr);
=20
diff --git a/tests/libqos/virtio-pci.c b/tests/libqos/virtio-pci.c
index 50499e75ef..c8d736f4d1 100644
--- a/tests/libqos/virtio-pci.c
+++ b/tests/libqos/virtio-pci.c
@@ -35,14 +35,6 @@
  * original qvirtio_pci_destructor and qvirtio_pci_start_hw.
  */
=20
-static inline bool qvirtio_pci_is_big_endian(QVirtioPCIDevice *dev)
-{
-    QPCIBus *bus =3D dev->pdev->bus;
-
-    /* FIXME: virtio 1.0 is always little-endian */
-    return qtest_big_endian(bus->qts);
-}
-
 #define CONFIG_BASE(dev) (VIRTIO_PCI_CONFIG_OFF((dev)->pdev->msix_enable=
d))
=20
 static uint8_t qvirtio_pci_config_readb(QVirtioDevice *d, uint64_t off)
@@ -55,8 +47,7 @@ static uint8_t qvirtio_pci_config_readb(QVirtioDevice *=
d, uint64_t off)
  * but virtio ( < 1.0) is in guest order
  * so with a big-endian guest the order has been reversed,
  * reverse it again
- * virtio-1.0 is always little-endian, like PCI, but this
- * case will be managed inside qvirtio_pci_is_big_endian()
+ * virtio-1.0 is always little-endian, like PCI
  */
=20
 static uint16_t qvirtio_pci_config_readw(QVirtioDevice *d, uint64_t off)
@@ -258,7 +249,7 @@ static void qvirtio_pci_virtqueue_kick(QVirtioDevice =
*d, QVirtQueue *vq)
     qpci_io_writew(dev->pdev, dev->bar, VIRTIO_PCI_QUEUE_NOTIFY, vq->ind=
ex);
 }
=20
-const QVirtioBus qvirtio_pci =3D {
+static const QVirtioBus qvirtio_pci_legacy =3D {
     .config_readb =3D qvirtio_pci_config_readb,
     .config_readw =3D qvirtio_pci_config_readw,
     .config_readl =3D qvirtio_pci_config_readl,
@@ -374,15 +365,19 @@ void qvirtio_pci_start_hw(QOSGraphObject *obj)
     qvirtio_start_device(&dev->vdev);
 }
=20
+static void qvirtio_pci_init_legacy(QVirtioPCIDevice *dev)
+{
+    dev->vdev.device_type =3D qpci_config_readw(dev->pdev, PCI_SUBSYSTEM=
_ID);
+    dev->vdev.bus =3D &qvirtio_pci_legacy;
+    dev->vdev.big_endian =3D qtest_big_endian(dev->pdev->bus->qts);
+}
+
 static void qvirtio_pci_init_from_pcidev(QVirtioPCIDevice *dev, QPCIDevi=
ce *pci_dev)
 {
     dev->pdev =3D pci_dev;
-    dev->vdev.device_type =3D qpci_config_readw(pci_dev, PCI_SUBSYSTEM_I=
D);
-
     dev->config_msix_entry =3D -1;
=20
-    dev->vdev.bus =3D &qvirtio_pci;
-    dev->vdev.big_endian =3D qvirtio_pci_is_big_endian(dev);
+    qvirtio_pci_init_legacy(dev);
=20
     /* each virtio-xxx-pci device should override at least this function=
 */
     dev->obj.get_driver =3D NULL;
--=20
2.21.0


