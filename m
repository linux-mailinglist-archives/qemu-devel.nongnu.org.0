Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF3CE5E75
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Oct 2019 20:07:23 +0200 (CEST)
Received: from localhost ([::1]:41262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iOQTC-0006dE-0j
	for lists+qemu-devel@lfdr.de; Sat, 26 Oct 2019 14:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iOQOT-00085Z-6v
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 14:02:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iOQOS-000738-4J
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 14:02:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46047
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iOQOP-00071h-OY
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 14:02:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572112944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=leKb+mxeE3Ab87XsOqKSMcG+BfzCOIRLFQX4loQ4eOE=;
 b=f+CyTn8o+g5OGZqwfRCKZptCFxizmckSgp+eMbZZOG0DajZdyQKTJBYwhQJShqgKI/sWUL
 dS5lPuTUa4BkJW+BXk8pS3Y516qBEY3iWFGAWSXR03JtBcp2taHnk9q2/aQD85GlVanSQx
 qq7ARkIRmTDaecsg0g7CGf7E3RdRaS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-sUwBDL4wNaSRj2Jzaozt5w-1; Sat, 26 Oct 2019 14:02:21 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07D2E800D41;
 Sat, 26 Oct 2019 18:02:20 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-39.brq.redhat.com [10.40.204.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03ED460C57;
 Sat, 26 Oct 2019 18:02:09 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/20] piix4: Add the Reset Control Register
Date: Sat, 26 Oct 2019 20:01:25 +0200
Message-Id: <20191026180143.7369-3-philmd@redhat.com>
In-Reply-To: <20191026180143.7369-1-philmd@redhat.com>
References: <20191026180143.7369-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: sUwBDL4wNaSRj2Jzaozt5w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Herv=C3=A9 Poussineau <hpoussin@reactos.org>

The RCR I/O port (0xcf9) is used to generate a hard reset or a soft reset.

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
Message-Id: <20171216090228.28505-7-hpoussin@reactos.org>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
[PMD: rebased, updated includes]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v3: Use RCR_IOPORT (Li Qiang)
---
 hw/isa/piix4.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 890d999abf..7a1361a9dd 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -2,6 +2,7 @@
  * QEMU PIIX4 PCI Bridge Emulation
  *
  * Copyright (c) 2006 Fabrice Bellard
+ * Copyright (c) 2018 Herv=C3=A9 Poussineau
  *
  * Permission is hereby granted, free of charge, to any person obtaining a=
 copy
  * of this software and associated documentation files (the "Software"), t=
o deal
@@ -28,11 +29,17 @@
 #include "hw/isa/isa.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
+#include "sysemu/reset.h"
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
@@ -87,15 +94,51 @@ static const VMStateDescription vmstate_piix4 =3D {
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
+
+    s->rcr =3D val & 2; /* keep System Reset type only */
+}
+
+static uint64_t piix4_rcr_read(void *opaque, hwaddr addr, unsigned int len=
)
+{
+    PIIX4State *s =3D opaque;
+
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
 static void piix4_realize(PCIDevice *dev, Error **errp)
 {
-    PIIX4State *d =3D PIIX4_PCI_DEVICE(dev);
+    PIIX4State *s =3D PIIX4_PCI_DEVICE(dev);
=20
-    if (!isa_bus_new(DEVICE(d), pci_address_space(dev),
+    if (!isa_bus_new(DEVICE(dev), pci_address_space(dev),
                      pci_address_space_io(dev), errp)) {
         return;
     }
-    piix4_dev =3D &d->dev;
+
+    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &piix4_rcr_ops, s,
+                          "reset-control", 1);
+    memory_region_add_subregion_overlap(pci_address_space_io(dev),
+                                        RCR_IOPORT, &s->rcr_mem, 1);
+
+    piix4_dev =3D dev;
 }
=20
 int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn)
--=20
2.21.0


