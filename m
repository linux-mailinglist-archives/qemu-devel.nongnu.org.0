Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D833D8281
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 23:48:26 +0200 (CEST)
Received: from localhost ([::1]:60090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKUg5-0000hn-1p
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 17:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59914)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iKUWE-0005Nh-Ss
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 17:38:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iKUWD-0006jp-FA
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 17:38:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46568)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iKUWD-0006jf-9n
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 17:38:13 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 77894309DEE6;
 Tue, 15 Oct 2019 21:38:12 +0000 (UTC)
Received: from localhost (ovpn-116-20.phx2.redhat.com [10.3.116.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB15260852;
 Tue, 15 Oct 2019 21:38:07 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
 qemu-devel@nongnu.org
Subject: [PULL 06/18] hw/ide/piix: Convert reset handler to DeviceReset
Date: Tue, 15 Oct 2019 18:37:33 -0300
Message-Id: <20191015213745.22174-7-ehabkost@redhat.com>
In-Reply-To: <20191015213745.22174-1-ehabkost@redhat.com>
References: <20191015213745.22174-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 15 Oct 2019 21:38:12 +0000 (UTC)
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
Cc: Li Qiang <liq3ea@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

The PIIX/IDE is a PCI device within a PIIX chipset, it will be reset
when the PCI bus it stands on is reset.

Convert its reset handler into a proper Device reset method.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20191010131527.32513-4-philmd@redhat.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/ide/piix.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index fba6bc8bff..db313dd3b1 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -30,7 +30,6 @@
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/dma.h"
-#include "sysemu/reset.h"
=20
 #include "hw/ide/pci.h"
 #include "trace.h"
@@ -103,9 +102,9 @@ static void bmdma_setup_bar(PCIIDEState *d)
     }
 }
=20
-static void piix3_reset(void *opaque)
+static void piix_ide_reset(DeviceState *dev)
 {
-    PCIIDEState *d =3D opaque;
+    PCIIDEState *d =3D PCI_IDE(dev);
     PCIDevice *pd =3D PCI_DEVICE(d);
     uint8_t *pci_conf =3D pd->config;
     int i;
@@ -154,8 +153,6 @@ static void pci_piix_ide_realize(PCIDevice *dev, Erro=
r **errp)
=20
     pci_conf[PCI_CLASS_PROG] =3D 0x80; // legacy ATA mode
=20
-    qemu_register_reset(piix3_reset, d);
-
     bmdma_setup_bar(d);
     pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
=20
@@ -247,6 +244,7 @@ static void piix3_ide_class_init(ObjectClass *klass, =
void *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
=20
+    dc->reset =3D piix_ide_reset;
     k->realize =3D pci_piix_ide_realize;
     k->exit =3D pci_piix_ide_exitfn;
     k->vendor_id =3D PCI_VENDOR_ID_INTEL;
@@ -273,6 +271,7 @@ static void piix4_ide_class_init(ObjectClass *klass, =
void *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
=20
+    dc->reset =3D piix_ide_reset;
     k->realize =3D pci_piix_ide_realize;
     k->exit =3D pci_piix_ide_exitfn;
     k->vendor_id =3D PCI_VENDOR_ID_INTEL;
--=20
2.21.0


