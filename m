Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C871C54B1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 13:47:48 +0200 (CEST)
Received: from localhost ([::1]:46856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVw39-0007bL-Ch
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 07:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jVvv0-0006FP-9u
 for qemu-devel@nongnu.org; Tue, 05 May 2020 07:39:22 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:38584
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jVvuz-0003bn-9a
 for qemu-devel@nongnu.org; Tue, 05 May 2020 07:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588678760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+IlEumgv25EWLOatgXqoBxJxkiGHCC4rUKppaJsSSyQ=;
 b=TCGxWqdwVs+4IFzz3ohvYmifhRazB40nZYIJe0/mYLcqJA4PgX8NOsNiKNSFBSz53Uh3mH
 e/BNJBYRKgIpmeb+8rpvBgXYE/5yDAVqg/yrf8niOV9aFLGFXDcxRo/2SGWntt9l2K5PmY
 QDcFd5oZm/Em+dEmcIUdrvLiJ+8uiZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-Y6eljwWSMDWKkTr-6qs8mw-1; Tue, 05 May 2020 07:39:18 -0400
X-MC-Unique: Y6eljwWSMDWKkTr-6qs8mw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E39EC1B18BD0;
 Tue,  5 May 2020 11:39:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B76571000232;
 Tue,  5 May 2020 11:39:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0D4329D55; Tue,  5 May 2020 13:38:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/13] acpi: factor out fw_cfg_add_acpi_dsdt()
Date: Tue,  5 May 2020 13:38:40 +0200
Message-Id: <20200505113843.22012-11-kraxel@redhat.com>
In-Reply-To: <20200505113843.22012-1-kraxel@redhat.com>
References: <20200505113843.22012-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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

Add helper function to add fw_cfg device,
also move code to hw/i386/fw_cfg.c.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/fw_cfg.h     |  1 +
 hw/i386/acpi-build.c | 24 +-----------------------
 hw/i386/fw_cfg.c     | 28 ++++++++++++++++++++++++++++
 3 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/hw/i386/fw_cfg.h b/hw/i386/fw_cfg.h
index 9e742787792b..275f15c1c5e8 100644
--- a/hw/i386/fw_cfg.h
+++ b/hw/i386/fw_cfg.h
@@ -25,5 +25,6 @@ FWCfgState *fw_cfg_arch_create(MachineState *ms,
                                uint16_t apic_id_limit);
 void fw_cfg_build_smbios(MachineState *ms, FWCfgState *fw_cfg);
 void fw_cfg_build_feature_control(MachineState *ms, FWCfgState *fw_cfg);
+void fw_cfg_add_acpi_dsdt(Aml *scope, FWCfgState *fw_cfg);
=20
 #endif
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 829e20664fff..cb3913d2ee76 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1880,30 +1880,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
=20
     /* create fw_cfg node, unconditionally */
     {
-        /* when using port i/o, the 8-bit data register *always* overlaps
-         * with half of the 16-bit control register. Hence, the total size
-         * of the i/o region used is FW_CFG_CTL_SIZE; when using DMA, the
-         * DMA control register is located at FW_CFG_DMA_IO_BASE + 4 */
-        uint8_t io_size =3D object_property_get_bool(OBJECT(x86ms->fw_cfg)=
,
-                                                   "dma_enabled", NULL) ?
-                          ROUND_UP(FW_CFG_CTL_SIZE, 4) + sizeof(dma_addr_t=
) :
-                          FW_CFG_CTL_SIZE;
-
         scope =3D aml_scope("\\_SB.PCI0");
-        dev =3D aml_device("FWCF");
-
-        aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
-
-        /* device present, functioning, decoding, not shown in UI */
-        aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
-
-        crs =3D aml_resource_template();
-        aml_append(crs,
-            aml_io(AML_DECODE16, FW_CFG_IO_BASE, FW_CFG_IO_BASE, 0x01, io_=
size)
-        );
-        aml_append(dev, aml_name_decl("_CRS", crs));
-
-        aml_append(scope, dev);
+        fw_cfg_add_acpi_dsdt(scope, x86ms->fw_cfg);
         aml_append(dsdt, scope);
     }
=20
diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index da60ada59462..c55abfb01abb 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -15,6 +15,7 @@
 #include "qemu/osdep.h"
 #include "sysemu/numa.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/aml-build.h"
 #include "hw/firmware/smbios.h"
 #include "hw/i386/fw_cfg.h"
 #include "hw/timer/hpet.h"
@@ -179,3 +180,30 @@ void fw_cfg_build_feature_control(MachineState *ms, FW=
CfgState *fw_cfg)
     *val =3D cpu_to_le64(feature_control_bits | FEATURE_CONTROL_LOCKED);
     fw_cfg_add_file(fw_cfg, "etc/msr_feature_control", val, sizeof(*val));
 }
+
+void fw_cfg_add_acpi_dsdt(Aml *scope, FWCfgState *fw_cfg)
+{
+    /*
+     * when using port i/o, the 8-bit data register *always* overlaps
+     * with half of the 16-bit control register. Hence, the total size
+     * of the i/o region used is FW_CFG_CTL_SIZE; when using DMA, the
+     * DMA control register is located at FW_CFG_DMA_IO_BASE + 4
+     */
+    Object *obj =3D OBJECT(fw_cfg);
+    uint8_t io_size =3D object_property_get_bool(obj, "dma_enabled", NULL)=
 ?
+        ROUND_UP(FW_CFG_CTL_SIZE, 4) + sizeof(dma_addr_t) :
+        FW_CFG_CTL_SIZE;
+    Aml *dev =3D aml_device("FWCF");
+    Aml *crs =3D aml_resource_template();
+
+    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
+
+    /* device present, functioning, decoding, not shown in UI */
+    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
+
+    aml_append(crs,
+        aml_io(AML_DECODE16, FW_CFG_IO_BASE, FW_CFG_IO_BASE, 0x01, io_size=
));
+
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+}
--=20
2.18.4


