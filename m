Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C831A529352
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 00:03:48 +0200 (CEST)
Received: from localhost ([::1]:42182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiod-00060w-TP
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 18:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhkb-0003QK-3E
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:55:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhkZ-00073x-0f
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:55:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vmiSQAuHJykmFquAlpTdzf2f3zovEvTK3ZqZ3s7Mnc8=;
 b=hGF+9rr6K+qwhbKzZt31KHIV223P0xN6gmoXdvcGWBclvG4+Umo+794WuKjFCnR5w6gxly
 hGSVAaxPe7BkxtvjDDi+lmp2mNDJHVzfFU7mQPnLVUXvIiSa/kkIxxkVYJFq5uniX1ETey
 /sFz1EpOJOEKa1FmPfOEkAT2za6yCxc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-aJs4FhawPfqFnZjt47864A-1; Mon, 16 May 2022 16:55:29 -0400
X-MC-Unique: aJs4FhawPfqFnZjt47864A-1
Received: by mail-ed1-f71.google.com with SMTP id
 ay24-20020a056402203800b0042a96a76ba5so4446836edb.20
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vmiSQAuHJykmFquAlpTdzf2f3zovEvTK3ZqZ3s7Mnc8=;
 b=Fk4Q7wuNnBEpnp/zvaZRoYkphSMALPpsH5GheAPhIvCOcnSuAAwJe73zm5PN8VtX46
 1/gKEW/THeuuOIe2K1gecPCe+YSmYJvQen3Waa1sB9fzj9P6mBZ+paFxg9KWWdbzVnb7
 7L7z8jGihbGuR8CwZMDDkp+AX45P5ojymc+OTeVP3Ms7Y1h0kvEI5DLswVCKtcBVVfBo
 fcNDJw9iI9Qqg/cXQScqCvBUaEMQnYyZGn14V0/muGa4KXOAzJoZwDDcSkB24yY7cv+6
 /nTvFhWTEHI+b5rPX3fLY83x7bnNPvPhPFXYkwiPj22ms5t2VudEyEAYt52GEnJCRUoJ
 OMjQ==
X-Gm-Message-State: AOAM531Pm9yaWqpRDjWo3bNtocIwqxKuHJV6jgTUq93pCSEGXS/u/hLD
 HdWLEM9p5WCTqtMp8DyG/l1iJCFG2UnUT2uisQvJ+HeLIYF1jJsmJQ4EjU1q9B1TNa4MqMLeGOx
 Ft+T+jQOhXalF9Zzp2chlp4rwC0Q+d+XA0NG9BTDiuJzS4PU3BKTxxAFF1jEv
X-Received: by 2002:a05:6402:26ca:b0:427:c181:b0ed with SMTP id
 x10-20020a05640226ca00b00427c181b0edmr15268445edd.400.1652734527722; 
 Mon, 16 May 2022 13:55:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpMd0gAHrRArQ7PELWh/fjTkCVUgoX7nFD+Wvf75veqpdLNR7WQqyvzKWc6+3KSUMcyGGc7Q==
X-Received: by 2002:a05:6402:26ca:b0:427:c181:b0ed with SMTP id
 x10-20020a05640226ca00b00427c181b0edmr15268419edd.400.1652734527468; 
 Mon, 16 May 2022 13:55:27 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 fc10-20020a1709073a4a00b006f3ef214db2sm178759ejc.24.2022.05.16.13.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:55:27 -0700 (PDT)
Date: Mon, 16 May 2022 16:55:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiaoyao Li <xiaoyao.li@intel.com>, Sergio Lopez <slp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL v2 76/86] hw/i386: Make pit a property of common x86 base
 machine type
Message-ID: <20220516204913.542894-77-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Xiaoyao Li <xiaoyao.li@intel.com>

Both pc and microvm have pit property individually. Let's just make it
the property of common x86 base machine type.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-Id: <20220310122811.807794-2-xiaoyao.li@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/microvm.h |  2 --
 include/hw/i386/pc.h      |  2 --
 include/hw/i386/x86.h     |  2 ++
 hw/i386/microvm.c         | 27 +--------------------------
 hw/i386/pc.c              | 24 +++---------------------
 hw/i386/x86.c             | 25 +++++++++++++++++++++++++
 6 files changed, 31 insertions(+), 51 deletions(-)

diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index efcbd926fd..83f9ac0b2a 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -67,7 +67,6 @@
 #define PCIE_ECAM_SIZE        0x10000000
 
 /* Machine type options */
-#define MICROVM_MACHINE_PIT                 "pit"
 #define MICROVM_MACHINE_PIC                 "pic"
 #define MICROVM_MACHINE_RTC                 "rtc"
 #define MICROVM_MACHINE_PCIE                "pcie"
@@ -87,7 +86,6 @@ struct MicrovmMachineState {
 
     /* Machine type options */
     OnOffAuto pic;
-    OnOffAuto pit;
     OnOffAuto rtc;
     OnOffAuto pcie;
     OnOffAuto ioapic2;
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index aff8add155..ffcac5121e 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -46,7 +46,6 @@ typedef struct PCMachineState {
     bool acpi_build_enabled;
     bool smbus_enabled;
     bool sata_enabled;
-    bool pit_enabled;
     bool hpet_enabled;
     bool i8042_enabled;
     bool default_bus_bypass_iommu;
@@ -64,7 +63,6 @@ typedef struct PCMachineState {
 #define PC_MACHINE_VMPORT           "vmport"
 #define PC_MACHINE_SMBUS            "smbus"
 #define PC_MACHINE_SATA             "sata"
-#define PC_MACHINE_PIT              "pit"
 #define PC_MACHINE_I8042            "i8042"
 #define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
 #define PC_MACHINE_SMBIOS_EP        "smbios-entry-point-type"
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 4841a49f86..b81fce54a0 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -65,6 +65,7 @@ struct X86MachineState {
 
     OnOffAuto smm;
     OnOffAuto acpi;
+    OnOffAuto pit;
 
     char *oem_id;
     char *oem_table_id;
@@ -84,6 +85,7 @@ struct X86MachineState {
 
 #define X86_MACHINE_SMM              "smm"
 #define X86_MACHINE_ACPI             "acpi"
+#define X86_MACHINE_PIT              "pit"
 #define X86_MACHINE_OEM_ID           "x-oem-id"
 #define X86_MACHINE_OEM_TABLE_ID     "x-oem-table-id"
 #define X86_MACHINE_BUS_LOCK_RATELIMIT  "bus-lock-ratelimit"
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 4b3b1dd262..89b555a2f5 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -257,7 +257,7 @@ static void microvm_devices_init(MicrovmMachineState *mms)
         g_free(i8259);
     }
 
-    if (mms->pit == ON_OFF_AUTO_ON || mms->pit == ON_OFF_AUTO_AUTO) {
+    if (x86ms->pit == ON_OFF_AUTO_ON || x86ms->pit == ON_OFF_AUTO_AUTO) {
         if (kvm_pit_in_kernel()) {
             kvm_pit_init(isa_bus, 0x40);
         } else {
@@ -508,23 +508,6 @@ static void microvm_machine_set_pic(Object *obj, Visitor *v, const char *name,
     visit_type_OnOffAuto(v, name, &mms->pic, errp);
 }
 
-static void microvm_machine_get_pit(Object *obj, Visitor *v, const char *name,
-                                    void *opaque, Error **errp)
-{
-    MicrovmMachineState *mms = MICROVM_MACHINE(obj);
-    OnOffAuto pit = mms->pit;
-
-    visit_type_OnOffAuto(v, name, &pit, errp);
-}
-
-static void microvm_machine_set_pit(Object *obj, Visitor *v, const char *name,
-                                    void *opaque, Error **errp)
-{
-    MicrovmMachineState *mms = MICROVM_MACHINE(obj);
-
-    visit_type_OnOffAuto(v, name, &mms->pit, errp);
-}
-
 static void microvm_machine_get_rtc(Object *obj, Visitor *v, const char *name,
                                     void *opaque, Error **errp)
 {
@@ -650,7 +633,6 @@ static void microvm_machine_initfn(Object *obj)
 
     /* Configuration */
     mms->pic = ON_OFF_AUTO_AUTO;
-    mms->pit = ON_OFF_AUTO_AUTO;
     mms->rtc = ON_OFF_AUTO_AUTO;
     mms->pcie = ON_OFF_AUTO_AUTO;
     mms->ioapic2 = ON_OFF_AUTO_AUTO;
@@ -709,13 +691,6 @@ static void microvm_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, MICROVM_MACHINE_PIC,
         "Enable i8259 PIC");
 
-    object_class_property_add(oc, MICROVM_MACHINE_PIT, "OnOffAuto",
-                              microvm_machine_get_pit,
-                              microvm_machine_set_pit,
-                              NULL, NULL);
-    object_class_property_set_description(oc, MICROVM_MACHINE_PIT,
-        "Enable i8254 PIT");
-
     object_class_property_add(oc, MICROVM_MACHINE_RTC, "OnOffAuto",
                               microvm_machine_get_rtc,
                               microvm_machine_set_rtc,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 15f37d8dc6..7c39c91335 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1123,6 +1123,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
     ISADevice *pit = NULL;
     MemoryRegion *ioport80_io = g_new(MemoryRegion, 1);
     MemoryRegion *ioportF0_io = g_new(MemoryRegion, 1);
+    X86MachineState *x86ms = X86_MACHINE(pcms);
 
     memory_region_init_io(ioport80_io, NULL, &ioport80_io_ops, NULL, "ioport80", 1);
     memory_region_add_subregion(isa_bus->address_space_io, 0x80, ioport80_io);
@@ -1167,7 +1168,8 @@ void pc_basic_device_init(struct PCMachineState *pcms,
 
     qemu_register_boot_set(pc_boot_set, *rtc_state);
 
-    if (!xen_enabled() && pcms->pit_enabled) {
+    if (!xen_enabled() &&
+        (x86ms->pit == ON_OFF_AUTO_AUTO || x86ms->pit == ON_OFF_AUTO_ON)) {
         if (kvm_pit_in_kernel()) {
             pit = kvm_pit_init(isa_bus, 0x40);
         } else {
@@ -1537,20 +1539,6 @@ static void pc_machine_set_sata(Object *obj, bool value, Error **errp)
     pcms->sata_enabled = value;
 }
 
-static bool pc_machine_get_pit(Object *obj, Error **errp)
-{
-    PCMachineState *pcms = PC_MACHINE(obj);
-
-    return pcms->pit_enabled;
-}
-
-static void pc_machine_set_pit(Object *obj, bool value, Error **errp)
-{
-    PCMachineState *pcms = PC_MACHINE(obj);
-
-    pcms->pit_enabled = value;
-}
-
 static bool pc_machine_get_hpet(Object *obj, Error **errp)
 {
     PCMachineState *pcms = PC_MACHINE(obj);
@@ -1707,7 +1695,6 @@ static void pc_machine_initfn(Object *obj)
     pcms->acpi_build_enabled = PC_MACHINE_GET_CLASS(pcms)->has_acpi_build;
     pcms->smbus_enabled = true;
     pcms->sata_enabled = true;
-    pcms->pit_enabled = true;
     pcms->i8042_enabled = true;
     pcms->max_fw_size = 8 * MiB;
 #ifdef CONFIG_HPET
@@ -1836,11 +1823,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, PC_MACHINE_SATA,
         "Enable/disable Serial ATA bus");
 
-    object_class_property_add_bool(oc, PC_MACHINE_PIT,
-        pc_machine_get_pit, pc_machine_set_pit);
-    object_class_property_set_description(oc, PC_MACHINE_PIT,
-        "Enable/disable Intel 8254 programmable interval timer emulation");
-
     object_class_property_add_bool(oc, "hpet",
         pc_machine_get_hpet, pc_machine_set_hpet);
     object_class_property_set_description(oc, "hpet",
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index f79e720cc2..784d54efa9 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1244,6 +1244,23 @@ static void x86_machine_set_acpi(Object *obj, Visitor *v, const char *name,
     visit_type_OnOffAuto(v, name, &x86ms->acpi, errp);
 }
 
+static void x86_machine_get_pit(Object *obj, Visitor *v, const char *name,
+                                    void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+    OnOffAuto pit = x86ms->pit;
+
+    visit_type_OnOffAuto(v, name, &pit, errp);
+}
+
+static void x86_machine_set_pit(Object *obj, Visitor *v, const char *name,
+                                    void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);;
+
+    visit_type_OnOffAuto(v, name, &x86ms->pit, errp);
+}
+
 static char *x86_machine_get_oem_id(Object *obj, Error **errp)
 {
     X86MachineState *x86ms = X86_MACHINE(obj);
@@ -1333,6 +1350,7 @@ static void x86_machine_initfn(Object *obj)
 
     x86ms->smm = ON_OFF_AUTO_AUTO;
     x86ms->acpi = ON_OFF_AUTO_AUTO;
+    x86ms->pit = ON_OFF_AUTO_AUTO;
     x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
     x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
@@ -1364,6 +1382,13 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, X86_MACHINE_ACPI,
         "Enable ACPI");
 
+    object_class_property_add(oc, X86_MACHINE_PIT, "OnOffAuto",
+                              x86_machine_get_pit,
+                              x86_machine_set_pit,
+                              NULL, NULL);
+    object_class_property_set_description(oc, X86_MACHINE_PIT,
+        "Enable i8254 PIT");
+
     object_class_property_add_str(oc, X86_MACHINE_OEM_ID,
                                   x86_machine_get_oem_id,
                                   x86_machine_set_oem_id);
-- 
MST


