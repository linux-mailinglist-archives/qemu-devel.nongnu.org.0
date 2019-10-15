Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC76D7C10
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 18:40:13 +0200 (CEST)
Received: from localhost ([::1]:52792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKPrm-0004xV-TN
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 12:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41191)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iKPhG-0001Uj-Aa
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:29:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iKPhD-0004wq-TV
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:29:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53418)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iKPhC-0004vI-E6
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:29:15 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7E8ED307D942;
 Tue, 15 Oct 2019 16:29:12 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21B2419C58;
 Tue, 15 Oct 2019 16:29:05 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/32] piix4: add Reset Control Register
Date: Tue, 15 Oct 2019 18:26:42 +0200
Message-Id: <20191015162705.28087-10-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 15 Oct 2019 16:29:12 +0000 (UTC)
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Herv=C3=A9 Poussineau <hpoussin@reactos.org>

The RCR I/O port (0xcf9) is used to generate a hard reset or a soft reset=
.

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
Message-Id: <20171216090228.28505-7-hpoussin@reactos.org>
[PMD: rebased, updated includes]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/isa/piix4.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 4202243e41..6e2d9b9774 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -2,6 +2,7 @@
  * QEMU PIIX4 PCI Bridge Emulation
  *
  * Copyright (c) 2006 Fabrice Bellard
+ * Copyright (c) 2018 Herv=C3=A9 Poussineau
  *
  * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
  * of this software and associated documentation files (the "Software"),=
 to deal
@@ -29,11 +30,16 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "sysemu/reset.h"
+#include "sysemu/runstate.h"
=20
 PCIDevice *piix4_dev;
=20
 typedef struct PIIX4State {
     PCIDevice dev;
+
+    /* Reset Control Register */
+    MemoryRegion rcr_mem;
+    uint8_t rcr;
 } PIIX4State;
=20
 #define TYPE_PIIX4_PCI_DEVICE "PIIX4"
@@ -88,6 +94,34 @@ static const VMStateDescription vmstate_piix4 =3D {
     }
 };
=20
+static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
+                            unsigned int len)
+{
+    PIIX4State *s =3D opaque;
+
+    if (val & 4) {
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+        return;
+    }
+    s->rcr =3D val & 2; /* keep System Reset type only */
+}
+
+static uint64_t piix4_rcr_read(void *opaque, hwaddr addr, unsigned int l=
en)
+{
+    PIIX4State *s =3D opaque;
+    return s->rcr;
+}
+
+static const MemoryRegionOps piix4_rcr_ops =3D {
+    .read =3D piix4_rcr_read,
+    .write =3D piix4_rcr_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .impl =3D {
+        .min_access_size =3D 1,
+        .max_access_size =3D 1,
+    },
+};
+
 static void piix4_realize(PCIDevice *pci_dev, Error **errp)
 {
     DeviceState *dev =3D DEVICE(pci_dev);
@@ -97,6 +131,12 @@ static void piix4_realize(PCIDevice *pci_dev, Error *=
*errp)
                      pci_address_space_io(pci_dev), errp)) {
         return;
     }
+
+    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &piix4_rcr_ops, s,
+                          "reset-control", 1);
+    memory_region_add_subregion_overlap(pci_address_space_io(pci_dev), 0=
xcf9,
+                                        &s->rcr_mem, 1);
+
     piix4_dev =3D pci_dev;
     qemu_register_reset(piix4_reset, s);
 }
--=20
2.21.0


