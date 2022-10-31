Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B77613745
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:00:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUIV-0002wN-W2; Mon, 31 Oct 2022 08:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIE-00018o-CU
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIC-00037a-0u
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K1/NvP2OlcAVsXpsL2UsCyef9UBQYtjcrqyS87+PDCI=;
 b=CLjH3J7vbdTLXU4loWPp46Lf8ndmmMyUynR9Tdsz6Z3+8nsfxf0sD2CymbmE7jyOa2zYlo
 9yZ7CHbn3N7QJ/A6z5bDaLJGzLXjjxRCgmtdKANuhyj268dXxFQFD9H5WKV0uDncJnb4Qt
 Ji5o3fWrB2Z2dy0Y8H4ry61Jg/0NDI0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-Rx7eExtzMbaVkzMsgWw9RA-1; Mon, 31 Oct 2022 08:53:25 -0400
X-MC-Unique: Rx7eExtzMbaVkzMsgWw9RA-1
Received: by mail-wm1-f71.google.com with SMTP id
 t20-20020a7bc3d4000000b003c6bfea856aso2575519wmj.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K1/NvP2OlcAVsXpsL2UsCyef9UBQYtjcrqyS87+PDCI=;
 b=AiyffDxnUXFtd35DV9j3W7DVZ4cL8XIB83UXrzaNW3s1YGK1HvjpVmtsdzVowo2ntW
 zC1Isnyb7HrvjlyfuJW2jh7pRc4AaAM3D8ICYl/lbc8u2Us3Mih9D9Ly0i6hHYALuDMj
 vNI0Tz4InpX6Pf3E1N0L039pU0LDsfKm9XBTJZXqn5XeY60YEs/4Mp8MKfAIyTQe/6Zv
 sB0tO5E6yInSnxKpeKQbTmzc067ALBRqKhr9nUdjn6TRliTVHPiXKxAdgPoWOQ/eXGZg
 rS4zele0yz1anfenK4/EN6bBrnQdgZA65w/PtV6FomSm9f4PTahKnJ9/zUcV16LTtvAL
 9+mw==
X-Gm-Message-State: ACrzQf1Qa+H7X1G4zrTOaaM/X08k0QOSxVrJdQeCXngx492UX2XG15tv
 QkzUuVdUugOTmWt1W3vyXM9qJftuj8R1MgHUGln5eUF89Po7/c38VmWxoTeJKYZ/Eo7AysTabS9
 wfsa5/fxkRz4dF7+SNCjIZEfbKVID2p/ioo9CvVv59D03fWMKRIF3Pe6mGAn6
X-Received: by 2002:a05:600c:418b:b0:3cf:4733:e0b6 with SMTP id
 p11-20020a05600c418b00b003cf4733e0b6mr8206955wmh.186.1667220804471; 
 Mon, 31 Oct 2022 05:53:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ujCT3pzkMrRagz13GZYF6T7WZAuE5wiKdbeLnWmNhoRDZ/K8LI0pnXJY4/hIZPzbLA1k56g==
X-Received: by 2002:a05:600c:418b:b0:3cf:4733:e0b6 with SMTP id
 p11-20020a05600c418b00b003cf4733e0b6mr8206932wmh.186.1667220804098; 
 Mon, 31 Oct 2022 05:53:24 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 i10-20020adffdca000000b00236674840e9sm7052325wrs.59.2022.10.31.05.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:53:23 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:53:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 56/86] acpi: pc/q35: drop ad-hoc PCI-ISA bridge AML routines
 and let bus ennumeration generate AML
Message-ID: <20221031124928.128475-57-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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
index 4553b5925b..facc3745e4 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -806,6 +806,7 @@ static void ich9_send_gpe(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 
 static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
+    Aml *field;
     BusChild *kid;
     ICH9LPCState *s = ICH9_LPC_DEVICE(adev);
     BusState *bus = BUS(s->isa_bus);
@@ -813,6 +814,28 @@ static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
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
index 48f9ab1096..d81b385e26 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -311,12 +311,27 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 
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


