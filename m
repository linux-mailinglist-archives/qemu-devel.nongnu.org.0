Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2421F6250
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 09:31:49 +0200 (CEST)
Received: from localhost ([::1]:37306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjHgi-0001a7-EX
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 03:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jjHec-0008Ap-AK
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 03:29:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42305
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jjHeb-0004hH-JB
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 03:29:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591860576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eAHPxJn6eStiRZaXlBN+e0nyBGWa/Oak+UsiY2V0GP8=;
 b=Wj1x9DuITIaPMDJjzThaEWi3WPu6MOoV1Le9zjgOHh4ddhU5hsC8I80mq4Ym5fgo6t6wvh
 RvSkl9zFXtyW8jhlo2pSQ4YH7wDLyf6LCE+CoXuC6ZxBdeJMaRiMpH9npatJAscO+2N2UV
 NNV/Z4gD2uUeBCRvj/UMouPNCjlnFlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-v2EULl2yM1GhO8saMm1zJQ-1; Thu, 11 Jun 2020 03:29:32 -0400
X-MC-Unique: v2EULl2yM1GhO8saMm1zJQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A31A7805731;
 Thu, 11 Jun 2020 07:29:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE6CE100238E;
 Thu, 11 Jun 2020 07:29:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D667D17532; Thu, 11 Jun 2020 09:29:19 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 05/10] acpi: move aml builder code for i8042 (kbd+mouse)
 device
Date: Thu, 11 Jun 2020 09:29:14 +0200
Message-Id: <20200611072919.16638-6-kraxel@redhat.com>
In-Reply-To: <20200611072919.16638-1-kraxel@redhat.com>
References: <20200611072919.16638-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 03:29:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 39 ---------------------------------------
 hw/input/pckbd.c     | 31 +++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 39 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 7726d5c0f7cb..9fed13a27333 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -937,42 +937,6 @@ static void build_hpet_aml(Aml *table)
     aml_append(table, scope);
 }
 
-static Aml *build_kbd_device_aml(void)
-{
-    Aml *dev;
-    Aml *crs;
-
-    dev = aml_device("KBD");
-    aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0303")));
-
-    aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
-
-    crs = aml_resource_template();
-    aml_append(crs, aml_io(AML_DECODE16, 0x0060, 0x0060, 0x01, 0x01));
-    aml_append(crs, aml_io(AML_DECODE16, 0x0064, 0x0064, 0x01, 0x01));
-    aml_append(crs, aml_irq_no_flags(1));
-    aml_append(dev, aml_name_decl("_CRS", crs));
-
-    return dev;
-}
-
-static Aml *build_mouse_device_aml(void)
-{
-    Aml *dev;
-    Aml *crs;
-
-    dev = aml_device("MOU");
-    aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0F13")));
-
-    aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
-
-    crs = aml_resource_template();
-    aml_append(crs, aml_irq_no_flags(12));
-    aml_append(dev, aml_name_decl("_CRS", crs));
-
-    return dev;
-}
-
 static void build_isa_devices_aml(Aml *table)
 {
     bool ambiguous;
@@ -980,9 +944,6 @@ static void build_isa_devices_aml(Aml *table)
     Aml *scope = aml_scope("_SB.PCI0.ISA");
     Object *obj = object_resolve_path_type("", TYPE_ISA_BUS, &ambiguous);
 
-    aml_append(scope, build_kbd_device_aml());
-    aml_append(scope, build_mouse_device_aml());
-
     if (ambiguous) {
         error_report("Multiple ISA busses, unable to define IPMI ACPI data");
     } else if (!obj) {
diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 60a41303203a..29d633ca9478 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -26,6 +26,7 @@
 #include "qemu/log.h"
 #include "hw/isa/isa.h"
 #include "migration/vmstate.h"
+#include "hw/acpi/aml-build.h"
 #include "hw/input/ps2.h"
 #include "hw/irq.h"
 #include "hw/input/i8042.h"
@@ -561,12 +562,42 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
     qemu_register_reset(kbd_reset, s);
 }
 
+static void i8042_build_aml(ISADevice *isadev, Aml *scope)
+{
+    Aml *kbd;
+    Aml *mou;
+    Aml *crs;
+
+    crs = aml_resource_template();
+    aml_append(crs, aml_io(AML_DECODE16, 0x0060, 0x0060, 0x01, 0x01));
+    aml_append(crs, aml_io(AML_DECODE16, 0x0064, 0x0064, 0x01, 0x01));
+    aml_append(crs, aml_irq_no_flags(1));
+
+    kbd = aml_device("KBD");
+    aml_append(kbd, aml_name_decl("_HID", aml_eisaid("PNP0303")));
+    aml_append(kbd, aml_name_decl("_STA", aml_int(0xf)));
+    aml_append(kbd, aml_name_decl("_CRS", crs));
+
+    crs = aml_resource_template();
+    aml_append(crs, aml_irq_no_flags(12));
+
+    mou = aml_device("MOU");
+    aml_append(mou, aml_name_decl("_HID", aml_eisaid("PNP0F13")));
+    aml_append(mou, aml_name_decl("_STA", aml_int(0xf)));
+    aml_append(mou, aml_name_decl("_CRS", crs));
+
+    aml_append(scope, kbd);
+    aml_append(scope, mou);
+}
+
 static void i8042_class_initfn(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
 
     dc->realize = i8042_realizefn;
     dc->vmsd = &vmstate_kbd_isa;
+    isa->build_aml = i8042_build_aml;
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
-- 
2.18.4


