Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1544A48A89A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 08:44:10 +0100 (CET)
Received: from localhost ([::1]:50502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7BpB-0003vG-6n
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 02:44:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1n7Bgz-0000dB-F2
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 02:35:43 -0500
Received: from mga02.intel.com ([134.134.136.20]:47009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1n7Bgu-0002tW-BA
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 02:35:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641886536; x=1673422536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sA6o/iyv8jwfggcg82COMCtDobac2dG3h0SGj38jh6A=;
 b=RvCXOc4ixc5N1iCZbORIGf59hRb4LCLJYo1fcCq2Yo/janXu/X5bYMYf
 PmEMStzjGz5BoXHZLwvw8ArrCWfeq675yjO4VpQk+D9YJYEZbhMFf/Wbu
 k+6eSQ2nVyoQ67YGQud/f6MQwO85ieluyMdW9bR5Q/44wxoOekVBCjk5O
 x6xwDU7X31JB/8WFfpSrUypYdMWZuZ9SSyBzAXNZf2eVACGO5HF1uQtGf
 Hy/OSv7+PwJv5KzOANL2VFTHOgqh2IAHvAjCDJ581sUk6xt/yQMflaaPn
 7gUwOItfKpFGZU+MUWHyWKS+AbbAvsEzOHBySMzEd5dfvfhpLOqtG7Fl+ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="230764633"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="230764633"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 23:35:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="622977587"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga004.jf.intel.com with ESMTP; 10 Jan 2022 23:35:31 -0800
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v1 1/2] hw/i386: Make pit a property of common x86 base
 machine type
Date: Tue, 11 Jan 2022 15:35:27 +0800
Message-Id: <20220111073528.1771552-2-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220111073528.1771552-1-xiaoyao.li@intel.com>
References: <20220111073528.1771552-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=xiaoyao.li@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both pc and microvm have pit property individually. Let's just make it
the property of common x86 base machine type.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 hw/i386/microvm.c         | 27 +--------------------------
 hw/i386/pc.c              | 24 +++---------------------
 hw/i386/x86.c             | 25 +++++++++++++++++++++++++
 include/hw/i386/microvm.h |  2 --
 include/hw/i386/pc.h      |  2 --
 include/hw/i386/x86.h     |  2 ++
 6 files changed, 31 insertions(+), 51 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 4b3b1dd262f1..89b555a2f584 100644
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
index c8696ac01e85..48ab4cf44012 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1071,6 +1071,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
     ISADevice *pit = NULL;
     MemoryRegion *ioport80_io = g_new(MemoryRegion, 1);
     MemoryRegion *ioportF0_io = g_new(MemoryRegion, 1);
+    X86MachineState *x86ms = X86_MACHINE(pcms);
 
     memory_region_init_io(ioport80_io, NULL, &ioport80_io_ops, NULL, "ioport80", 1);
     memory_region_add_subregion(isa_bus->address_space_io, 0x80, ioport80_io);
@@ -1115,7 +1116,8 @@ void pc_basic_device_init(struct PCMachineState *pcms,
 
     qemu_register_boot_set(pc_boot_set, *rtc_state);
 
-    if (!xen_enabled() && pcms->pit_enabled) {
+    if (!xen_enabled() &&
+        (x86ms->pit == ON_OFF_AUTO_AUTO || x86ms->pit == ON_OFF_AUTO_ON)) {
         if (kvm_pit_in_kernel()) {
             pit = kvm_pit_init(isa_bus, 0x40);
         } else {
@@ -1484,20 +1486,6 @@ static void pc_machine_set_sata(Object *obj, bool value, Error **errp)
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
@@ -1640,7 +1628,6 @@ static void pc_machine_initfn(Object *obj)
     pcms->acpi_build_enabled = PC_MACHINE_GET_CLASS(pcms)->has_acpi_build;
     pcms->smbus_enabled = true;
     pcms->sata_enabled = true;
-    pcms->pit_enabled = true;
     pcms->max_fw_size = 8 * MiB;
 #ifdef CONFIG_HPET
     pcms->hpet_enabled = true;
@@ -1767,11 +1754,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
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
index b84840a1bb99..744a50937761 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1226,6 +1226,23 @@ static void x86_machine_set_acpi(Object *obj, Visitor *v, const char *name,
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
@@ -1315,6 +1332,7 @@ static void x86_machine_initfn(Object *obj)
 
     x86ms->smm = ON_OFF_AUTO_AUTO;
     x86ms->acpi = ON_OFF_AUTO_AUTO;
+    x86ms->pit = ON_OFF_AUTO_AUTO;
     x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
     x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
@@ -1347,6 +1365,13 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
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
diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index efcbd926fd43..83f9ac0b2ad0 100644
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
index 9c9f4ac74810..01e84d5c4aa4 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -46,7 +46,6 @@ typedef struct PCMachineState {
     bool acpi_build_enabled;
     bool smbus_enabled;
     bool sata_enabled;
-    bool pit_enabled;
     bool hpet_enabled;
     bool default_bus_bypass_iommu;
     uint64_t max_fw_size;
@@ -63,7 +62,6 @@ typedef struct PCMachineState {
 #define PC_MACHINE_VMPORT           "vmport"
 #define PC_MACHINE_SMBUS            "smbus"
 #define PC_MACHINE_SATA             "sata"
-#define PC_MACHINE_PIT              "pit"
 #define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
 #define PC_MACHINE_SMBIOS_EP        "smbios-entry-point-type"
 
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index a145a303703f..f0168902356d 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -67,6 +67,7 @@ struct X86MachineState {
 
     OnOffAuto smm;
     OnOffAuto acpi;
+    OnOffAuto pit;
 
     char *oem_id;
     char *oem_table_id;
@@ -86,6 +87,7 @@ struct X86MachineState {
 
 #define X86_MACHINE_SMM              "smm"
 #define X86_MACHINE_ACPI             "acpi"
+#define X86_MACHINE_PIT              "pit"
 #define X86_MACHINE_OEM_ID           "x-oem-id"
 #define X86_MACHINE_OEM_TABLE_ID     "x-oem-table-id"
 #define X86_MACHINE_BUS_LOCK_RATELIMIT  "bus-lock-ratelimit"
-- 
2.27.0


