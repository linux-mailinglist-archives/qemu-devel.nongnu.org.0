Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74D81C8BF5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 15:20:55 +0200 (CEST)
Received: from localhost ([::1]:46006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWgSM-0005pp-Oh
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 09:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jWgOX-0000Tg-Qa
 for qemu-devel@nongnu.org; Thu, 07 May 2020 09:16:57 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53228
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jWgOW-0005RT-1w
 for qemu-devel@nongnu.org; Thu, 07 May 2020 09:16:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588857413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w0NfC44zSSP8XQuMD0Q4jE7b8Wu2cKvpf0N8X/M/lC8=;
 b=inrIR4UmqIN+8EeUkQ0qAZtD5zfaMDZlf3KXTK1LfFv7e/LRvsav+wkk4ys4LTmBo02oLF
 FRlH7TTNSO3NWcl5TmV0cM+/bh5G6OOBmZjNED/nIna0L8bIbNJJTS3Ur27+diN0nql4xC
 Mt24Z063PeABy1+ms4duPpXjGYXNYiw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-n1oCBCX-OwCUDDbZGa3Beg-1; Thu, 07 May 2020 09:16:51 -0400
X-MC-Unique: n1oCBCX-OwCUDDbZGa3Beg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4979D100D09B;
 Thu,  7 May 2020 13:16:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 423985D9E5;
 Thu,  7 May 2020 13:16:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5E62C17511; Thu,  7 May 2020 15:16:40 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/15] acpi: move aml builder code for rtc device
Date: Thu,  7 May 2020 15:16:27 +0200
Message-Id: <20200507131640.14041-3-kraxel@redhat.com>
In-Reply-To: <20200507131640.14041-1-kraxel@redhat.com>
References: <20200507131640.14041-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 00:55:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/acpi-build.c | 17 -----------------
 hw/rtc/mc146818rtc.c | 22 ++++++++++++++++++++++
 2 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 2e15f6848e7e..0bfa2dd23fcc 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1137,22 +1137,6 @@ static Aml *build_fdc_device_aml(ISADevice *fdc)
     return dev;
 }
=20
-static Aml *build_rtc_device_aml(void)
-{
-    Aml *dev;
-    Aml *crs;
-
-    dev =3D aml_device("RTC");
-    aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0B00")));
-    crs =3D aml_resource_template();
-    aml_append(crs, aml_io(AML_DECODE16, 0x0070, 0x0070, 0x10, 0x02));
-    aml_append(crs, aml_irq_no_flags(8));
-    aml_append(crs, aml_io(AML_DECODE16, 0x0072, 0x0072, 0x02, 0x06));
-    aml_append(dev, aml_name_decl("_CRS", crs));
-
-    return dev;
-}
-
 static Aml *build_kbd_device_aml(void)
 {
     Aml *dev;
@@ -1278,7 +1262,6 @@ static void build_isa_devices_aml(Aml *table)
     Aml *scope =3D aml_scope("_SB.PCI0.ISA");
     Object *obj =3D object_resolve_path_type("", TYPE_ISA_BUS, &ambiguous)=
;
=20
-    aml_append(scope, build_rtc_device_aml());
     aml_append(scope, build_kbd_device_aml());
     aml_append(scope, build_mouse_device_aml());
     if (fdc) {
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index d18c09911be2..2104e0aa3b14 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -27,6 +27,7 @@
 #include "qemu/cutils.h"
 #include "qemu/module.h"
 #include "qemu/bcd.h"
+#include "hw/acpi/aml-build.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "qemu/timer.h"
@@ -1007,13 +1008,34 @@ static void rtc_resetdev(DeviceState *d)
     }
 }
=20
+static void rtc_build_aml(ISADevice *isadev, Aml *scope)
+{
+    Aml *dev;
+    Aml *crs;
+
+    crs =3D aml_resource_template();
+    aml_append(crs, aml_io(AML_DECODE16, RTC_ISA_BASE, RTC_ISA_BASE,
+                           0x10, 0x02));
+    aml_append(crs, aml_irq_no_flags(RTC_ISA_IRQ));
+    aml_append(crs, aml_io(AML_DECODE16, RTC_ISA_BASE + 2, RTC_ISA_BASE + =
2,
+                           0x02, 0x06));
+
+    dev =3D aml_device("RTC");
+    aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0B00")));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+
+    aml_append(scope, dev);
+}
+
 static void rtc_class_initfn(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
+    ISADeviceClass *isa =3D ISA_DEVICE_CLASS(klass);
=20
     dc->realize =3D rtc_realizefn;
     dc->reset =3D rtc_resetdev;
     dc->vmsd =3D &vmstate_rtc;
+    isa->build_aml =3D rtc_build_aml;
     device_class_set_props(dc, mc146818rtc_properties);
 }
=20
--=20
2.18.4


