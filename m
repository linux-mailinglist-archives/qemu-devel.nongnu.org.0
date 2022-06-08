Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0161954329A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:31:46 +0200 (CEST)
Received: from localhost ([::1]:34464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nywin-0005KB-2S
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8V-0002HR-UT
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:54:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8U-0004Tc-0c
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:54:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654696453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LArxAk/xeFZPqultdkq+DtKpH3vm38UpP18KwrA/Y24=;
 b=iQ1jj9HybLsq4/o1tTM9jr375TFTCHgSaprhxZhGsQkwGHHzBoWW58EO5q3Il9QoOoJQev
 MN3SRzmar8q20mtu8dvg/Kx85uYHWWat/S+a2RgHVLW/yXadVxToecRl12DLjC7DaXsT8p
 jiuv2czHG0FVLOIT3BGpW8zTWf7Tu/c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-GlRh2nsrMHyJZfCUOIPzkQ-1; Wed, 08 Jun 2022 09:54:10 -0400
X-MC-Unique: GlRh2nsrMHyJZfCUOIPzkQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 065003C02197;
 Wed,  8 Jun 2022 13:54:10 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48726C28117;
 Wed,  8 Jun 2022 13:54:09 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 33/35] acpi: tpm-tis: use AcpiDevAmlIfClass:build_dev_aml
 to provide device's AML
Date: Wed,  8 Jun 2022 09:53:38 -0400
Message-Id: <20220608135340.3304695-34-imammedo@redhat.com>
In-Reply-To: <20220608135340.3304695-1-imammedo@redhat.com>
References: <20220608135340.3304695-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

.. and clean up not longer needed conditionals in DSTD build code
tpm-tis AML will be fetched and included when ISA bridge will
build its own AML code (including attached devices).

Expected AML change:
    the device under separate _SB.PCI0.ISA scope is moved directly
    under Device(ISA) node.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/acpi-build.c | 34 ----------------------------------
 hw/tpm/tpm_tis_isa.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 34 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 1204b6da05..0b65fc99cd 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1804,40 +1804,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             Aml *scope = aml_scope("PCI0");
             /* Scan all PCI buses. Generate tables to support hotplug. */
             build_append_pci_bus_devices(scope, bus, pm->pcihp_bridge_en);
-
-#ifdef CONFIG_TPM
-            if (TPM_IS_TIS_ISA(tpm)) {
-                dev = aml_device("ISA.TPM");
-                if (misc->tpm_version == TPM_VERSION_2_0) {
-                    aml_append(dev, aml_name_decl("_HID",
-                                                  aml_string("MSFT0101")));
-                    aml_append(dev,
-                               aml_name_decl("_STR",
-                                             aml_string("TPM 2.0 Device")));
-                } else {
-                    aml_append(dev, aml_name_decl("_HID",
-                                                  aml_eisaid("PNP0C31")));
-                }
-                aml_append(dev, aml_name_decl("_UID", aml_int(1)));
-
-                aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
-                crs = aml_resource_template();
-                aml_append(crs, aml_memory32_fixed(TPM_TIS_ADDR_BASE,
-                           TPM_TIS_ADDR_SIZE, AML_READ_WRITE));
-                /*
-                    FIXME: TPM_TIS_IRQ=5 conflicts with PNP0C0F irqs,
-                    Rewrite to take IRQ from TPM device model and
-                    fix default IRQ value there to use some unused IRQ
-                 */
-                /* aml_append(crs, aml_irq_no_flags(TPM_TIS_IRQ)); */
-                aml_append(dev, aml_name_decl("_CRS", crs));
-
-                tpm_build_ppi_acpi(tpm, dev);
-
-                aml_append(scope, dev);
-            }
-#endif
-
             aml_append(sb_scope, scope);
         }
     }
diff --git a/hw/tpm/tpm_tis_isa.c b/hw/tpm/tpm_tis_isa.c
index 3477afd735..91e3792248 100644
--- a/hw/tpm/tpm_tis_isa.c
+++ b/hw/tpm/tpm_tis_isa.c
@@ -30,6 +30,7 @@
 #include "tpm_prop.h"
 #include "tpm_tis.h"
 #include "qom/object.h"
+#include "hw/acpi/acpi_aml_interface.h"
 
 struct TPMStateISA {
     /*< private >*/
@@ -138,10 +139,39 @@ static void tpm_tis_isa_realizefn(DeviceState *dev, Error **errp)
     }
 }
 
+static void build_tpm_tis_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
+{
+    Aml *dev, *crs;
+    TPMStateISA *isadev = TPM_TIS_ISA(adev);
+    TPMIf *ti = TPM_IF(isadev);
+
+    dev = aml_device("TPM");
+    if (tpm_tis_isa_get_tpm_version(ti) == TPM_VERSION_2_0) {
+        aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
+        aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
+    } else {
+        aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0C31")));
+    }
+    aml_append(dev, aml_name_decl("_UID", aml_int(1)));
+    aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
+    crs = aml_resource_template();
+    aml_append(crs, aml_memory32_fixed(TPM_TIS_ADDR_BASE, TPM_TIS_ADDR_SIZE,
+                                      AML_READ_WRITE));
+    /*
+     * FIXME: TPM_TIS_IRQ=5 conflicts with PNP0C0F irqs,
+     * fix default TPM_TIS_IRQ value there to use some unused IRQ
+     */
+    /* aml_append(crs, aml_irq_no_flags(isadev->state.irq_num)); */
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    tpm_build_ppi_acpi(ti, dev);
+    aml_append(scope, dev);
+}
+
 static void tpm_tis_isa_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     TPMIfClass *tc = TPM_IF_CLASS(klass);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     device_class_set_props(dc, tpm_tis_isa_properties);
     dc->vmsd  = &vmstate_tpm_tis_isa;
@@ -151,6 +181,7 @@ static void tpm_tis_isa_class_init(ObjectClass *klass, void *data)
     tc->request_completed = tpm_tis_isa_request_completed;
     tc->get_version = tpm_tis_isa_get_tpm_version;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    adevc->build_dev_aml = build_tpm_tis_isa_aml;
 }
 
 static const TypeInfo tpm_tis_isa_info = {
@@ -161,6 +192,7 @@ static const TypeInfo tpm_tis_isa_info = {
     .class_init  = tpm_tis_isa_class_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_TPM_IF },
+        { TYPE_ACPI_DEV_AML_IF },
         { }
     }
 };
-- 
2.31.1


