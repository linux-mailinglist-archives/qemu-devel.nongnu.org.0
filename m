Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6541C54C9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 13:52:48 +0200 (CEST)
Received: from localhost ([::1]:56964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVw7z-0003m2-MP
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 07:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jVw48-0000hK-Fz
 for qemu-devel@nongnu.org; Tue, 05 May 2020 07:48:48 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:44257
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jVw44-0001Wv-RP
 for qemu-devel@nongnu.org; Tue, 05 May 2020 07:48:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588679323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtpeDDynNtK20qdBo4K/42G59uSkh0HyBvkWfOTzut4=;
 b=a4FjxXBEAeRkQvn3MXy34Q218NWrRfLYXi7BtQNEE6mnwARtiTMnDGhQ7hkfRaw9MpooDF
 /lqMVXBmvBZj2+uMik7MN0cs105K5zUEv4/eaOLSNIL+qdgYJVx3HeqH6NFYxjTw25wi/x
 Xn7zr6DQDQUJKC0nrWcgtOlfcHsGBG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-fOw7X3FiPI2hBeec9IrdEQ-1; Tue, 05 May 2020 07:48:42 -0400
X-MC-Unique: fOw7X3FiPI2hBeec9IrdEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 138E7EC1A2;
 Tue,  5 May 2020 11:48:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E2A96109F;
 Tue,  5 May 2020 11:48:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DCEFDA1FB; Tue,  5 May 2020 13:38:43 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/13] acpi: move aml builder code for parallel device
Date: Tue,  5 May 2020 13:38:37 +0200
Message-Id: <20200505113843.22012-8-kraxel@redhat.com>
In-Reply-To: <20200505113843.22012-1-kraxel@redhat.com>
References: <20200505113843.22012-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 00:37:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also adds support for multiple LPT devices.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/char/parallel.c   | 32 ++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c | 23 -----------------------
 2 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index 8dd67d13759b..bc6b55b3b910 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -28,6 +28,7 @@
 #include "qemu/module.h"
 #include "chardev/char-parallel.h"
 #include "chardev/char-fe.h"
+#include "hw/acpi/aml-build.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
@@ -568,6 +569,35 @@ static void parallel_isa_realizefn(DeviceState *dev, E=
rror **errp)
                              s, "parallel");
 }
=20
+static void parallel_isa_build_aml(ISADevice *isadev, Aml *scope)
+{
+    ISAParallelState *isa =3D ISA_PARALLEL(isadev);
+    int i, uid =3D 0;
+    Aml *dev;
+    Aml *crs;
+
+    for (i =3D 0; i < ARRAY_SIZE(isa_parallel_io); i++) {
+        if (isa->iobase =3D=3D isa_parallel_io[i]) {
+            uid =3D i + 1;
+        }
+    }
+    if (!uid) {
+        return;
+    }
+
+    crs =3D aml_resource_template();
+    aml_append(crs, aml_io(AML_DECODE16, isa->iobase, isa->iobase, 0x08, 0=
x08));
+    aml_append(crs, aml_irq_no_flags(isa->isairq));
+
+    dev =3D aml_device("LPT%d", uid);
+    aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0400")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(uid)));
+    aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+
+    aml_append(scope, dev);
+}
+
 /* Memory mapped interface */
 static uint64_t parallel_mm_readfn(void *opaque, hwaddr addr, unsigned siz=
e)
 {
@@ -624,9 +654,11 @@ static Property parallel_isa_properties[] =3D {
 static void parallel_isa_class_initfn(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
+    ISADeviceClass *isa =3D ISA_DEVICE_CLASS(klass);
=20
     dc->realize =3D parallel_isa_realizefn;
     dc->vmsd =3D &vmstate_parallel_isa;
+    isa->build_aml =3D parallel_isa_build_aml;
     device_class_set_props(dc, parallel_isa_properties);
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 2188a2b99d18..443db94deb5b 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1173,28 +1173,6 @@ static Aml *build_mouse_device_aml(void)
     return dev;
 }
=20
-static void build_lpt_device_aml(Aml *scope)
-{
-    Aml *dev;
-    Aml *crs;
-
-    if (!memory_region_present(get_system_io(), 0x0378)) {
-        return;
-    }
-
-    dev =3D aml_device("LPT");
-    aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0400")));
-
-    aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
-
-    crs =3D aml_resource_template();
-    aml_append(crs, aml_io(AML_DECODE16, 0x0378, 0x0378, 0x08, 0x08));
-    aml_append(crs, aml_irq_no_flags(7));
-    aml_append(dev, aml_name_decl("_CRS", crs));
-
-    aml_append(scope, dev);
-}
-
 static void build_isa_devices_aml(Aml *table)
 {
     ISADevice *fdc =3D pc_find_fdc0();
@@ -1208,7 +1186,6 @@ static void build_isa_devices_aml(Aml *table)
     if (fdc) {
         aml_append(scope, build_fdc_device_aml(fdc));
     }
-    build_lpt_device_aml(scope);
=20
     if (ambiguous) {
         error_report("Multiple ISA busses, unable to define IPMI ACPI data=
");
--=20
2.18.4


