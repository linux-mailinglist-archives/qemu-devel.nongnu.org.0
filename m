Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6CAD2B64
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 15:33:22 +0200 (CEST)
Received: from localhost ([::1]:39574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIYZE-0002OC-Ii
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 09:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iIYJp-0001JP-0g
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 09:17:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iIYJn-0002Tq-Uk
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 09:17:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52190)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iIYJS-0002ND-ID; Thu, 10 Oct 2019 09:17:02 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9E4238D5D84;
 Thu, 10 Oct 2019 13:17:01 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87F6B600C4;
 Thu, 10 Oct 2019 13:16:43 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 5/8] hw/ide/via82c: Convert reset handler to DeviceReset
Date: Thu, 10 Oct 2019 15:15:24 +0200
Message-Id: <20191010131527.32513-6-philmd@redhat.com>
In-Reply-To: <20191010131527.32513-1-philmd@redhat.com>
References: <20191010131527.32513-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Thu, 10 Oct 2019 13:17:01 +0000 (UTC)
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VIA82C686B IDE controller is a PCI device, it will be reset
when the PCI bus it stands on is reset.

Convert its reset handler into a proper Device reset method.

Reviewed-by: Li Qiang <liq3ea@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ide/via.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/ide/via.c b/hw/ide/via.c
index 7087dc676e..053622bd82 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -29,7 +29,6 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "sysemu/dma.h"
-#include "sysemu/reset.h"
=20
 #include "hw/ide/pci.h"
 #include "trace.h"
@@ -120,10 +119,10 @@ static void via_ide_set_irq(void *opaque, int n, in=
t level)
     }
 }
=20
-static void via_ide_reset(void *opaque)
+static void via_ide_reset(DeviceState *dev)
 {
-    PCIIDEState *d =3D opaque;
-    PCIDevice *pd =3D PCI_DEVICE(d);
+    PCIIDEState *d =3D PCI_IDE(dev);
+    PCIDevice *pd =3D PCI_DEVICE(dev);
     uint8_t *pci_conf =3D pd->config;
     int i;
=20
@@ -172,8 +171,6 @@ static void via_ide_realize(PCIDevice *dev, Error **e=
rrp)
     pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
     dev->wmask[PCI_INTERRUPT_LINE] =3D 0xf;
=20
-    qemu_register_reset(via_ide_reset, d);
-
     memory_region_init_io(&d->data_bar[0], OBJECT(d), &pci_ide_data_le_o=
ps,
                           &d->bus[0], "via-ide0-data", 8);
     pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[0])=
;
@@ -229,6 +226,7 @@ static void via_ide_class_init(ObjectClass *klass, vo=
id *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
=20
+    dc->reset =3D via_ide_reset;
     k->realize =3D via_ide_realize;
     k->exit =3D via_ide_exitfn;
     k->vendor_id =3D PCI_VENDOR_ID_VIA;
--=20
2.21.0


