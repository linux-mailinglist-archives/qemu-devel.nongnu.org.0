Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5972B61684A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:19:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGKo-0001Kk-9O; Wed, 02 Nov 2022 12:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKS-0000kr-VL
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKR-00039B-0z
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QWB3jHftpzGNJjtWTaDYZ0A2JgMlfU5IybDSZEpzXSo=;
 b=X4ORcjfC4FcEeUQB2Cypim19yBskn4Qio4XCuaduYNE0Hu/gc0QT18DY2lRss5x8neKlwN
 KIxN8ri3hi14tPpd6yrb/gHrgFZsag5gx2N/h12Kof3hL0IWfnwY4MqpbqenyRnubtAMLp
 syJ7DRMRmwMmYpOVRUtRzQX8hJ8bNWI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-155-O4N913ClNlG2Xn30mI9Lfw-1; Wed, 02 Nov 2022 12:10:57 -0400
X-MC-Unique: O4N913ClNlG2Xn30mI9Lfw-1
Received: by mail-wm1-f70.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso1260749wmk.3
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QWB3jHftpzGNJjtWTaDYZ0A2JgMlfU5IybDSZEpzXSo=;
 b=1XlGjlVMT+F5azzsPFuUiBpnUB2+/cF1nE8RuRFOPWYlskbwWa9XepTyfbyeHnjdhZ
 TAIkItXhoGs8gJjeQpJYIhwjJiOxLzTTKZkkeSWRfpYjHp+dvYTDccXRdAkEkjDdgn4t
 w0gQmQ3AB/4hvUDmp3TdaFiwMifg8myjayUMYs2S7bd3gNeSTOo4okQR3Z91OOPb97tK
 zxkCrA+dosNsX8TZSSm3msnfr4fD7aPssuM/GjPnOu5foctnXjT2ofX5hc/GVL58zmtK
 3PPR5wFbYZgGkLLzl/zqPMTf5sH+Kh7kCE2jYOFcfrsgxOUS94zcJeCYGEmJL1c4BIJa
 IopQ==
X-Gm-Message-State: ACrzQf0I4CY9Pm3YM0T4N8XH8NmplR/Y74IfLvCmvNx90/2pi6nOhHW/
 9oPwKlM1SVMzwNR41xMNhCzbWrMcKX2Pn09StNWqWx4CQPXSfE9NZJgYH652z6VvcYhlbK+q037
 NADxyy7xJDKtm0JxD/btDMJw0aTd4QkEaD9/cxUv4yjfdPk0OnvffH7V9x0DO
X-Received: by 2002:a05:600c:468e:b0:3c6:f510:735c with SMTP id
 p14-20020a05600c468e00b003c6f510735cmr15887424wmo.179.1667405455710; 
 Wed, 02 Nov 2022 09:10:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6bd2hrbgbwbvX0fPM/UGYlLpX3f3H6V9nna5sdJbdiuJNzlyH4Yde6btIsc2s0Pd+GAx9dMw==
X-Received: by 2002:a05:600c:468e:b0:3c6:f510:735c with SMTP id
 p14-20020a05600c468e00b003c6f510735cmr15887383wmo.179.1667405455348; 
 Wed, 02 Nov 2022 09:10:55 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b003c701c12a17sm2932410wmq.12.2022.11.02.09.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:10:55 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:10:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v2 54/82] acpi: pc/q35: drop ad-hoc PCI-ISA bridge AML
 routines and let bus ennumeration generate AML
Message-ID: <20221102160336.616599-55-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Igor Mammedov <imammedo@redhat.com>

PCI-ISA bridges that are built in PIIX/Q35 are building its own AML
using AcpiDevAmlIf interface. Now build_append_pci_bus_devices()
gained AcpiDevAmlIf interface support to get AML of devices atached
to PCI slots.
So drop ad-hoc build_q35_isa_bridge()/build_piix4_isa_bridge()
and let PCI bus enumeration to include PCI-ISA bridge AML
when it's enumerated by build_append_pci_bus_devices().

AML change is mostly contextual, which moves whole ISA hierarchy
directly under PCI host bridge instead of it being described
as separate \SB.PCI0.ISA block.

Note:
If bus/slot that hosts ISA bridge has BSEL set, it will gain new
ASUN and _DMS entries (i.e. acpi-index support, but it should not
cause any functional change and that is fine from PCI Firmware
spec point of view), potentially it's possible to suppress that
by adding a flag to PCIDevice but I don't see a reason to do that
yet, I'd rather treat bridge just as any other PCI device if it's
possible.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20221017102146.2254096-4-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 75 --------------------------------------------
 hw/isa/lpc_ich9.c    | 23 ++++++++++++++
 hw/isa/piix3.c       | 17 +++++++++-
 3 files changed, 39 insertions(+), 76 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 26932b4e2c..e1483bb11a 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -435,10 +435,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             pc = PCI_DEVICE_GET_CLASS(pdev);
             dc = DEVICE_GET_CLASS(pdev);
 
-            if (pc->class_id == PCI_CLASS_BRIDGE_ISA) {
-                continue;
-            }
-
             /*
              * Cold plugged bridges aren't themselves hot-pluggable.
              * Hotplugged bridges *are* hot-pluggable.
@@ -1006,7 +1002,6 @@ static void build_piix4_pci0_int(Aml *table)
 {
     Aml *dev;
     Aml *crs;
-    Aml *field;
     Aml *method;
     uint32_t irqs;
     Aml *sb_scope = aml_scope("_SB");
@@ -1015,13 +1010,6 @@ static void build_piix4_pci0_int(Aml *table)
     aml_append(pci0_scope, build_prt(true));
     aml_append(sb_scope, pci0_scope);
 
-    field = aml_field("PCI0.ISA.P40C", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
-    aml_append(field, aml_named_field("PRQ0", 8));
-    aml_append(field, aml_named_field("PRQ1", 8));
-    aml_append(field, aml_named_field("PRQ2", 8));
-    aml_append(field, aml_named_field("PRQ3", 8));
-    aml_append(sb_scope, field);
-
     aml_append(sb_scope, build_irq_status_method());
     aml_append(sb_scope, build_iqcr_method(true));
 
@@ -1125,7 +1113,6 @@ static Aml *build_q35_routing_table(const char *str)
 
 static void build_q35_pci0_int(Aml *table)
 {
-    Aml *field;
     Aml *method;
     Aml *sb_scope = aml_scope("_SB");
     Aml *pci0_scope = aml_scope("PCI0");
@@ -1162,18 +1149,6 @@ static void build_q35_pci0_int(Aml *table)
     aml_append(pci0_scope, method);
     aml_append(sb_scope, pci0_scope);
 
-    field = aml_field("PCI0.ISA.PIRQ", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
-    aml_append(field, aml_named_field("PRQA", 8));
-    aml_append(field, aml_named_field("PRQB", 8));
-    aml_append(field, aml_named_field("PRQC", 8));
-    aml_append(field, aml_named_field("PRQD", 8));
-    aml_append(field, aml_reserved_field(0x20));
-    aml_append(field, aml_named_field("PRQE", 8));
-    aml_append(field, aml_named_field("PRQF", 8));
-    aml_append(field, aml_named_field("PRQG", 8));
-    aml_append(field, aml_named_field("PRQH", 8));
-    aml_append(sb_scope, field);
-
     aml_append(sb_scope, build_irq_status_method());
     aml_append(sb_scope, build_iqcr_method(false));
 
@@ -1238,54 +1213,6 @@ static Aml *build_q35_dram_controller(const AcpiMcfgInfo *mcfg)
     return dev;
 }
 
-static void build_q35_isa_bridge(Aml *table)
-{
-    Aml *dev;
-    Aml *scope;
-    Object *obj;
-    bool ambiguous;
-
-    /*
-     * temporarily fish out isa bridge, build_q35_isa_bridge() will be dropped
-     * once PCI is converted to AcpiDevAmlIf and would be ble to generate
-     * AML for bridge itself
-     */
-    obj = object_resolve_path_type("", TYPE_ICH9_LPC_DEVICE, &ambiguous);
-    assert(obj && !ambiguous);
-
-    scope =  aml_scope("_SB.PCI0");
-    dev = aml_device("ISA");
-    aml_append(dev, aml_name_decl("_ADR", aml_int(0x001F0000)));
-
-    call_dev_aml_func(DEVICE(obj), dev);
-    aml_append(scope, dev);
-    aml_append(table, scope);
-}
-
-static void build_piix4_isa_bridge(Aml *table)
-{
-    Aml *dev;
-    Aml *scope;
-    Object *obj;
-    bool ambiguous;
-
-    /*
-     * temporarily fish out isa bridge, build_piix4_isa_bridge() will be dropped
-     * once PCI is converted to AcpiDevAmlIf and would be ble to generate
-     * AML for bridge itself
-     */
-    obj = object_resolve_path_type("", TYPE_PIIX3_PCI_DEVICE, &ambiguous);
-    assert(obj && !ambiguous);
-
-    scope =  aml_scope("_SB.PCI0");
-    dev = aml_device("ISA");
-    aml_append(dev, aml_name_decl("_ADR", aml_int(0x00010000)));
-
-    call_dev_aml_func(DEVICE(obj), dev);
-    aml_append(scope, dev);
-    aml_append(table, scope);
-}
-
 static void build_x86_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
 {
     Aml *scope;
@@ -1465,7 +1392,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
 
-        build_piix4_isa_bridge(dsdt);
         if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
             build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
         }
@@ -1510,7 +1436,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
         aml_append(dsdt, sb_scope);
 
-        build_q35_isa_bridge(dsdt);
         if (pm->pcihp_bridge_en) {
             build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
         }
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 8694e58b21..0b0a83e080 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -809,6 +809,7 @@ static void ich9_send_gpe(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 
 static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
+    Aml *field;
     BusChild *kid;
     ICH9LPCState *s = ICH9_LPC_DEVICE(adev);
     BusState *bus = BUS(s->isa_bus);
@@ -816,6 +817,28 @@ static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
     /* ICH9 PCI to ISA irq remapping */
     aml_append(scope, aml_operation_region("PIRQ", AML_PCI_CONFIG,
                                            aml_int(0x60), 0x0C));
+    /* Fields declarion has to happen *after* operation region */
+    field = aml_field("PIRQ", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
+    aml_append(field, aml_named_field("PRQA", 8));
+    aml_append(field, aml_named_field("PRQB", 8));
+    aml_append(field, aml_named_field("PRQC", 8));
+    aml_append(field, aml_named_field("PRQD", 8));
+    aml_append(field, aml_reserved_field(0x20));
+    aml_append(field, aml_named_field("PRQE", 8));
+    aml_append(field, aml_named_field("PRQF", 8));
+    aml_append(field, aml_named_field("PRQG", 8));
+    aml_append(field, aml_named_field("PRQH", 8));
+    aml_append(scope, field);
+
+    /* hack: put fields into _SB scope for LNKx to find them */
+    aml_append(scope, aml_alias("PRQA", "\\_SB.PRQA"));
+    aml_append(scope, aml_alias("PRQB", "\\_SB.PRQB"));
+    aml_append(scope, aml_alias("PRQC", "\\_SB.PRQC"));
+    aml_append(scope, aml_alias("PRQD", "\\_SB.PRQD"));
+    aml_append(scope, aml_alias("PRQE", "\\_SB.PRQE"));
+    aml_append(scope, aml_alias("PRQF", "\\_SB.PRQF"));
+    aml_append(scope, aml_alias("PRQG", "\\_SB.PRQG"));
+    aml_append(scope, aml_alias("PRQH", "\\_SB.PRQH"));
 
     QTAILQ_FOREACH(kid, &bus->children, sibling) {
             call_dev_aml_func(DEVICE(kid->child), scope);
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 808fd4eadf..f9b4af5c05 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -316,12 +316,27 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 
 static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
+    Aml *field;
     BusChild *kid;
     BusState *bus = qdev_get_child_bus(DEVICE(adev), "isa.0");
 
     /* PIIX PCI to ISA irq remapping */
     aml_append(scope, aml_operation_region("P40C", AML_PCI_CONFIG,
-                                         aml_int(0x60), 0x04));
+                                           aml_int(0x60), 0x04));
+    /* Fields declarion has to happen *after* operation region */
+    field = aml_field("P40C", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
+    aml_append(field, aml_named_field("PRQ0", 8));
+    aml_append(field, aml_named_field("PRQ1", 8));
+    aml_append(field, aml_named_field("PRQ2", 8));
+    aml_append(field, aml_named_field("PRQ3", 8));
+    aml_append(scope, field);
+
+    /* hack: put fields into _SB scope for LNKx to find them */
+    aml_append(scope, aml_alias("PRQ0", "\\_SB.PRQ0"));
+    aml_append(scope, aml_alias("PRQ1", "\\_SB.PRQ1"));
+    aml_append(scope, aml_alias("PRQ2", "\\_SB.PRQ2"));
+    aml_append(scope, aml_alias("PRQ3", "\\_SB.PRQ3"));
+
     QTAILQ_FOREACH(kid, &bus->children, sibling) {
         call_dev_aml_func(DEVICE(kid->child), scope);
     }
-- 
MST


