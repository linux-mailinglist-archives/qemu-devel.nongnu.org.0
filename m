Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF0A61DC64
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:24:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMpf-0008H9-Bu; Sat, 05 Nov 2022 13:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMo0-0007Dc-Lq
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMny-0007bT-5D
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QWB3jHftpzGNJjtWTaDYZ0A2JgMlfU5IybDSZEpzXSo=;
 b=GxAg5o/bQI+iPEfcJmuQ/j51gYdVx4UohkaS9MnunYcFrmsgSfG7KLdzZGv1FQw2e+xIny
 iptMlU9uFyhAU5ncjGD9OhGDNwqxMZYrdeI0E807FbM57XvtdtnB09RVY8gyXXm4673IL4
 2bD6TWlp86s3nGP7KQZwe7+4P/LscT4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-206-v-Cwbz7oPtekN8SmGC6WrA-1; Sat, 05 Nov 2022 13:18:00 -0400
X-MC-Unique: v-Cwbz7oPtekN8SmGC6WrA-1
Received: by mail-wm1-f70.google.com with SMTP id
 h8-20020a1c2108000000b003cf550bfc8dso6002135wmh.2
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QWB3jHftpzGNJjtWTaDYZ0A2JgMlfU5IybDSZEpzXSo=;
 b=Hu9jxnmIN7GHBGDTGF+K10ghbkpCRXUxvSwdn79/TFmBqu9PNG+k5QJ26O1ECJV6et
 +ehzh83JQeRsVeFcma2JHYiNgKZawu2CSP2I9zXyXgUNGkKZJUmhrrwXBg/V7upSSGwc
 QM+2qG+LMgMdpQ7waGSB2GgG1FRB5R+z6Bq186cHLfOSEpjnfCjki5R+0nxjnT2in81o
 Wnaw1E3VcsFPvA1M/dPBQG7LLchJaMxi7gClYxcCHkEcl1UpGKnBU3aLMVkSs/aOnNo4
 zwPd5Gw6wAvS791/691DE+pHrFs/g2eiuyjlcOKnxkbm/O53PdlGSLdP73DdGugWqWHx
 zwXw==
X-Gm-Message-State: ACrzQf1O/gNOamhJrw6y8I9ymbym5D9VrXVzXVqa9Gk+Wsej2V8Vb4Pq
 D7f6mLtMv0RefWT3m08PXxMhejVVXTwX0i051OvkXqL5OEzcBxRT+oGaI0Q8P4oPcJI6+7CifKN
 dkezDFfZWbEe/soPuMgVWRRlRGIQ3HU3XxtwEA+2dwoROG7oGKWeIQ2p3LCLB
X-Received: by 2002:a5d:47c7:0:b0:236:64a4:6d5a with SMTP id
 o7-20020a5d47c7000000b0023664a46d5amr25728593wrc.666.1667668678618; 
 Sat, 05 Nov 2022 10:17:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7UXwSq12zd3QC3kkHpY5mQhVbPVCTIKlPsLP+zcZOOqAAehj/EGh5FAlsQ782leUSuGRCU6g==
X-Received: by 2002:a5d:47c7:0:b0:236:64a4:6d5a with SMTP id
 o7-20020a5d47c7000000b0023664a46d5amr25728578wrc.666.1667668678242; 
 Sat, 05 Nov 2022 10:17:58 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 c16-20020a5d5290000000b0022e36c1113fsm2630638wrv.13.2022.11.05.10.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:17:57 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:17:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL v3 51/81] acpi: pc/q35: drop ad-hoc PCI-ISA bridge AML
 routines and let bus ennumeration generate AML
Message-ID: <20221105171116.432921-52-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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


