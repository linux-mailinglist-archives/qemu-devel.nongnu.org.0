Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74C618AE1C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Mar 2020 09:11:09 +0100 (CET)
Received: from localhost ([::1]:34624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEqGj-00064z-0O
	for lists+qemu-devel@lfdr.de; Thu, 19 Mar 2020 04:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39758)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jEq7e-0001kU-BK
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 04:01:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1jEq7Y-0005XZ-Qx
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 04:01:43 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:42583)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1jEq7Y-0005V3-M0
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 04:01:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584604900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1hIQzOVownPUgeOfpivxGQH7GbNiuNjbqeCCe9FxpM4=;
 b=gvOgjVIdxgXdS4r6F9DdHY36nt/isWbuYL6/RYWWObw1MYy3EFPLg26ld7O6HzRCUDqS9d
 aoatdc39+GS/ATPzzY+Pn+XVeN6+K2099C9C9AVmJCp4w5GkkVsoPQ7NsJgmNSUTFswz1k
 qx5VP4PxCmkeVoWa8GtgJ4vAmWhWFO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-wxmEcOsFPcuNQnXPC_y32w-1; Thu, 19 Mar 2020 04:01:38 -0400
X-MC-Unique: wxmEcOsFPcuNQnXPC_y32w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10C19107B76A;
 Thu, 19 Mar 2020 08:01:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-49.ams2.redhat.com
 [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7843D90812;
 Thu, 19 Mar 2020 08:01:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CEC9431F48; Thu, 19 Mar 2020 09:01:17 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/13] microvm: add acpi_dsdt_add_virtio() for x86
Date: Thu, 19 Mar 2020 09:01:09 +0100
Message-Id: <20200319080117.7725-6-kraxel@redhat.com>
In-Reply-To: <20200319080117.7725-1-kraxel@redhat.com>
References: <20200319080117.7725-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Makes x86 linux kernel find virtio-mmio devices automatically.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/acpi-build.c | 51 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 0e45a646af56..80844db24d6b 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -21,6 +21,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qnum.h"
 #include "acpi-build.h"
@@ -60,6 +61,7 @@
 #include "hw/pci-host/q35.h"
 #include "hw/i386/x86-iommu.h"
 #include "hw/i386/microvm.h"
+#include "hw/virtio/virtio-mmio.h"
=20
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/utils.h"
@@ -2750,6 +2752,54 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
     return true;
 }
=20
+static void acpi_dsdt_add_virtio(Aml *scope)
+{
+    gchar *separator;
+    long int index;
+    BusState *bus;
+    BusChild *kid;
+
+    bus =3D sysbus_get_default();
+    QTAILQ_FOREACH(kid, &bus->children, sibling) {
+        DeviceState *dev =3D kid->child;
+        ObjectClass *class =3D object_get_class(OBJECT(dev));
+
+        if (class =3D=3D object_class_by_name(TYPE_VIRTIO_MMIO)) {
+            VirtIOMMIOProxy *mmio =3D VIRTIO_MMIO(OBJECT(dev));
+            VirtioBusState *mmio_virtio_bus =3D &mmio->bus;
+            BusState *mmio_bus =3D &mmio_virtio_bus->parent_obj;
+
+            if (QTAILQ_EMPTY(&mmio_bus->children)) {
+                continue;
+            }
+            separator =3D g_strrstr(mmio_bus->name, ".");
+            if (!separator) {
+                continue;
+            }
+            if (qemu_strtol(separator + 1, NULL, 10, &index) !=3D 0) {
+                continue;
+            }
+
+            uint32_t irq =3D VIRTIO_IRQ_BASE + index;
+            hwaddr base =3D VIRTIO_MMIO_BASE + index * 512;
+            hwaddr size =3D 512;
+
+            Aml *dev =3D aml_device("VR%02u", (unsigned)index);
+            aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")))=
;
+            aml_append(dev, aml_name_decl("_UID", aml_int(index)));
+            aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
+
+            Aml *crs =3D aml_resource_template();
+            aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE)=
);
+            aml_append(crs,
+                       aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_H=
IGH,
+                                     AML_EXCLUSIVE, &irq, 1));
+            aml_append(dev, aml_name_decl("_CRS", crs));
+            aml_append(scope, dev);
+        }
+    }
+}
+
 static void
 build_dsdt_microvm(GArray *table_data, BIOSLinker *linker,
                    MicrovmMachineState *mms)
@@ -2766,6 +2816,7 @@ build_dsdt_microvm(GArray *table_data, BIOSLinker *li=
nker,
=20
     sb_scope =3D aml_scope("_SB");
     acpi_dsdt_add_fw_cfg(sb_scope, OBJECT(x86ms->fw_cfg));
+    acpi_dsdt_add_virtio(sb_scope);
     aml_append(dsdt, sb_scope);
=20
     scope =3D aml_scope("\\");
--=20
2.18.2


