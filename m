Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E1ADD700
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Oct 2019 08:50:21 +0200 (CEST)
Received: from localhost ([::1]:49992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLiZA-0006SB-EN
	for lists+qemu-devel@lfdr.de; Sat, 19 Oct 2019 02:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60007)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iLiPO-0004Se-PP
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 02:40:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iLiPN-0004a0-O5
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 02:40:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60006)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1iLiPL-0004XF-H7; Sat, 19 Oct 2019 02:40:11 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A6BF810C092D;
 Sat, 19 Oct 2019 06:40:10 +0000 (UTC)
Received: from localhost (ovpn-116-50.ams2.redhat.com [10.36.116.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09D955D9CC;
 Sat, 19 Oct 2019 06:40:01 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/16] libqos: make the virtio-pci BAR index configurable
Date: Sat, 19 Oct 2019 07:38:08 +0100
Message-Id: <20191019063810.6944-15-stefanha@redhat.com>
In-Reply-To: <20191019063810.6944-1-stefanha@redhat.com>
References: <20191019063810.6944-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Sat, 19 Oct 2019 06:40:10 +0000 (UTC)
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

The Legacy virtio-pci interface always uses BAR 0.  VIRTIO 1.0 may need
to use a different BAR index, so make it configurable.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
v3:
 * Change uint8_t bar_idx to int [Thomas]
---
 tests/libqos/virtio-pci.h | 2 ++
 tests/libqos/virtio-pci.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/libqos/virtio-pci.h b/tests/libqos/virtio-pci.h
index 0e4a8b7b00..78a1c15c2a 100644
--- a/tests/libqos/virtio-pci.h
+++ b/tests/libqos/virtio-pci.h
@@ -25,6 +25,8 @@ typedef struct QVirtioPCIDevice {
     uint16_t config_msix_entry;
     uint64_t config_msix_addr;
     uint32_t config_msix_data;
+
+    int bar_idx;
 } QVirtioPCIDevice;
=20
 struct QVirtioPCIMSIXOps {
diff --git a/tests/libqos/virtio-pci.c b/tests/libqos/virtio-pci.c
index c900742f96..e9595603f5 100644
--- a/tests/libqos/virtio-pci.c
+++ b/tests/libqos/virtio-pci.c
@@ -310,7 +310,7 @@ static const QVirtioPCIMSIXOps qvirtio_pci_msix_ops_l=
egacy =3D {
 void qvirtio_pci_device_enable(QVirtioPCIDevice *d)
 {
     qpci_device_enable(d->pdev);
-    d->bar =3D qpci_iomap(d->pdev, 0, NULL);
+    d->bar =3D qpci_iomap(d->pdev, d->bar_idx, NULL);
 }
=20
 void qvirtio_pci_device_disable(QVirtioPCIDevice *d)
@@ -400,6 +400,7 @@ static void qvirtio_pci_init_from_pcidev(QVirtioPCIDe=
vice *dev, QPCIDevice *pci_
 {
     dev->pdev =3D pci_dev;
     dev->vdev.device_type =3D qpci_config_readw(pci_dev, PCI_SUBSYSTEM_I=
D);
+    dev->bar_idx =3D 0;
=20
     dev->config_msix_entry =3D -1;
     dev->msix_ops =3D &qvirtio_pci_msix_ops_legacy;
--=20
2.21.0


