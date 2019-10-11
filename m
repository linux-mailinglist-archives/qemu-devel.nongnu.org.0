Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E43D3BE2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 11:05:55 +0200 (CEST)
Received: from localhost ([::1]:47524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIqry-0004cF-B3
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 05:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iIqjF-0003JB-9Y
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:56:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iIqjD-0007xQ-5e
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:56:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38192)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iIqjC-0007xF-W0
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:56:51 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4548630024DA
 for <qemu-devel@nongnu.org>; Fri, 11 Oct 2019 08:56:50 +0000 (UTC)
Received: from localhost (unknown [10.36.118.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E228A60872;
 Fri, 11 Oct 2019 08:56:44 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] libqos: make the virtio-pci BAR index configurable
Date: Fri, 11 Oct 2019 09:56:10 +0100
Message-Id: <20191011085611.4194-7-stefanha@redhat.com>
In-Reply-To: <20191011085611.4194-1-stefanha@redhat.com>
References: <20191011085611.4194-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 11 Oct 2019 08:56:50 +0000 (UTC)
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

The Legacy virtio-pci interface always uses BAR 0.  VIRTIO 1.0 may need
to use a different BAR index, so make it configurable.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/libqos/virtio-pci.h | 2 ++
 tests/libqos/virtio-pci.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/libqos/virtio-pci.h b/tests/libqos/virtio-pci.h
index b620c30451..f2d53aa377 100644
--- a/tests/libqos/virtio-pci.h
+++ b/tests/libqos/virtio-pci.h
@@ -25,6 +25,8 @@ typedef struct QVirtioPCIDevice {
     uint16_t config_msix_entry;
     uint64_t config_msix_addr;
     uint32_t config_msix_data;
+
+    uint8_t bar_idx;
 } QVirtioPCIDevice;
=20
 struct QVirtioPCIMSIXOps {
diff --git a/tests/libqos/virtio-pci.c b/tests/libqos/virtio-pci.c
index 3fb4af4016..efd8caee18 100644
--- a/tests/libqos/virtio-pci.c
+++ b/tests/libqos/virtio-pci.c
@@ -300,7 +300,7 @@ static const QVirtioPCIMSIXOps qvirtio_pci_msix_ops_l=
egacy =3D {
 void qvirtio_pci_device_enable(QVirtioPCIDevice *d)
 {
     qpci_device_enable(d->pdev);
-    d->bar =3D qpci_iomap(d->pdev, 0, NULL);
+    d->bar =3D qpci_iomap(d->pdev, d->bar_idx, NULL);
 }
=20
 void qvirtio_pci_device_disable(QVirtioPCIDevice *d)
@@ -389,6 +389,7 @@ void qvirtio_pci_start_hw(QOSGraphObject *obj)
 static void qvirtio_pci_init_legacy(QVirtioPCIDevice *dev)
 {
     dev->vdev.device_type =3D qpci_config_readw(dev->pdev, PCI_SUBSYSTEM=
_ID);
+    dev->bar_idx =3D 0;
     dev->vdev.bus =3D &qvirtio_pci_legacy;
     dev->msix_ops =3D &qvirtio_pci_msix_ops_legacy;
     dev->vdev.big_endian =3D qtest_big_endian(dev->pdev->bus->qts);
--=20
2.21.0


