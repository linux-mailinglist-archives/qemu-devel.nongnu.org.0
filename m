Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00267CFC99
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 16:39:36 +0200 (CEST)
Received: from localhost ([::1]:56768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHqeF-0002Sv-Kq
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 10:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50308)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iHqSZ-0007Qo-5Y
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 10:27:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iHqSX-0000Vg-F3
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 10:27:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50556)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iHqSS-0000SU-BV; Tue, 08 Oct 2019 10:27:24 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6EF86308C387;
 Tue,  8 Oct 2019 14:27:23 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-43.brq.redhat.com [10.40.204.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C54DF19C69;
 Tue,  8 Oct 2019 14:27:05 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] hw/isa/vt82c686: Convert reset handler to DeviceReset
Date: Tue,  8 Oct 2019 16:25:37 +0200
Message-Id: <20191008142539.7793-7-philmd@redhat.com>
In-Reply-To: <20191008142539.7793-1-philmd@redhat.com>
References: <20191008142539.7793-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 08 Oct 2019 14:27:23 +0000 (UTC)
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VIA VT82C686 Southbridge is a PCI device, it will be reset
when the PCI bus it stands on is reset.

Convert its reset handler into a proper Device reset method.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/isa/vt82c686.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 50bd28fa82..616f67f347 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -23,7 +23,6 @@
 #include "hw/isa/apm.h"
 #include "hw/acpi/acpi.h"
 #include "hw/i2c/pm_smbus.h"
-#include "sysemu/reset.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "exec/address-spaces.h"
@@ -116,11 +115,10 @@ static const MemoryRegionOps superio_ops =3D {
     },
 };
=20
-static void vt82c686b_reset(void * opaque)
+static void vt82c686b_isa_reset(DeviceState *dev)
 {
-    PCIDevice *d =3D opaque;
-    uint8_t *pci_conf =3D d->config;
-    VT82C686BState *vt82c =3D VT82C686B_DEVICE(d);
+    VT82C686BState *vt82c =3D VT82C686B_DEVICE(dev);
+    uint8_t *pci_conf =3D vt82c->dev.config;
=20
     pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
     pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_IO | PCI_COMMAND_ME=
MORY |
@@ -476,8 +474,6 @@ static void vt82c686b_realize(PCIDevice *d, Error **e=
rrp)
      * But we do not emulate a floppy, so just set it here. */
     memory_region_add_subregion(isa_bus->address_space_io, 0x3f0,
                                 &vt82c->superio);
-
-    qemu_register_reset(vt82c686b_reset, d);
 }
=20
 ISABus *vt82c686b_isa_init(PCIBus *bus, int devfn)
@@ -501,6 +497,7 @@ static void via_class_init(ObjectClass *klass, void *=
data)
     k->device_id =3D PCI_DEVICE_ID_VIA_ISA_BRIDGE;
     k->class_id =3D PCI_CLASS_BRIDGE_ISA;
     k->revision =3D 0x40;
+    dc->reset =3D vt82c686b_isa_reset;
     dc->desc =3D "ISA bridge";
     dc->vmsd =3D &vmstate_via;
     /*
--=20
2.21.0


