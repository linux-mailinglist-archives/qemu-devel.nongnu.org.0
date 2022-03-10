Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B384D470A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:34:09 +0100 (CET)
Received: from localhost ([::1]:57358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHzd-00031Z-20
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:34:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nSHu1-00044P-D8
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:28:24 -0500
Received: from mga02.intel.com ([134.134.136.20]:32247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nSHty-0001Xx-Uu
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:28:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646915298; x=1678451298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fvpQ/PhL9p+48Co6SQBK2AVYOYXVqvi6ssK1hND/riE=;
 b=R18jy/JVsPQ1JjEkW47ZUnHOB9ceZayciKhBUkqz/kkz0Yv6tw7b7awg
 hS8vA3CVOMKnrWXFbJ574gvXdQyLnq1ucDMXfyHcUfIiH5i+rGfXqez9f
 bmf326UoSgg3qofrNVplWlHAE59vr0otesuPReF6rvDvh67SoS4+8op4i
 HA262HpoJfCbGcYk4jamPWy1h1JSrqlBqkByB5A7HwCH57aug3qvrNSTf
 SBqZuVjgzSsecCREjkPflgRvk2BOzvOtyCjviNiOj0/JnH7zt1r5KBGmo
 YHdlI6ihCNoU7x/n4yQqVI2HdDu9UxGTMlz/Zl49gqxftiEt+KrOtlUO/ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="242683005"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="242683005"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 04:28:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="596647449"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by fmsmga008.fm.intel.com with ESMTP; 10 Mar 2022 04:28:16 -0800
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Sergio Lopez <slp@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH RESEND v1 2/2] hw/i386: Make pic a property of common x86 base
 machine type
Date: Thu, 10 Mar 2022 20:28:11 +0800
Message-Id: <20220310122811.807794-3-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220310122811.807794-1-xiaoyao.li@intel.com>
References: <20220310122811.807794-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=xiaoyao.li@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: xiaoyao.li@intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Legacy PIC (8259) cannot be supported for TDX guests since TDX module
doesn't allow directly interrupt injection.  Using posted interrupts
for the PIC is not a viable option as the guest BIOS/kernel will not
do EOI for PIC IRQs, i.e. will leave the vIRR bit set.

Make PIC the property of common x86 machine type. Hence all x86
machines, including microvm, can disable it.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
---
 hw/i386/microvm.c         | 27 +--------------------------
 hw/i386/pc_piix.c         |  4 +++-
 hw/i386/pc_q35.c          |  4 +++-
 hw/i386/x86.c             | 25 +++++++++++++++++++++++++
 include/hw/i386/microvm.h |  2 --
 include/hw/i386/x86.h     |  2 ++
 6 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 89b555a2f584..754f1d0593e5 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -247,7 +247,7 @@ static void microvm_devices_init(MicrovmMachineState *mms)
         x86ms->pci_irq_mask = 0;
     }
 
-    if (mms->pic == ON_OFF_AUTO_ON || mms->pic == ON_OFF_AUTO_AUTO) {
+    if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
         qemu_irq *i8259;
 
         i8259 = i8259_init(isa_bus, x86_allocate_cpu_irq());
@@ -491,23 +491,6 @@ static void microvm_machine_reset(MachineState *machine)
     }
 }
 
-static void microvm_machine_get_pic(Object *obj, Visitor *v, const char *name,
-                                    void *opaque, Error **errp)
-{
-    MicrovmMachineState *mms = MICROVM_MACHINE(obj);
-    OnOffAuto pic = mms->pic;
-
-    visit_type_OnOffAuto(v, name, &pic, errp);
-}
-
-static void microvm_machine_set_pic(Object *obj, Visitor *v, const char *name,
-                                    void *opaque, Error **errp)
-{
-    MicrovmMachineState *mms = MICROVM_MACHINE(obj);
-
-    visit_type_OnOffAuto(v, name, &mms->pic, errp);
-}
-
 static void microvm_machine_get_rtc(Object *obj, Visitor *v, const char *name,
                                     void *opaque, Error **errp)
 {
@@ -632,7 +615,6 @@ static void microvm_machine_initfn(Object *obj)
     MicrovmMachineState *mms = MICROVM_MACHINE(obj);
 
     /* Configuration */
-    mms->pic = ON_OFF_AUTO_AUTO;
     mms->rtc = ON_OFF_AUTO_AUTO;
     mms->pcie = ON_OFF_AUTO_AUTO;
     mms->ioapic2 = ON_OFF_AUTO_AUTO;
@@ -684,13 +666,6 @@ static void microvm_class_init(ObjectClass *oc, void *data)
 
     x86mc->fwcfg_dma_enabled = true;
 
-    object_class_property_add(oc, MICROVM_MACHINE_PIC, "OnOffAuto",
-                              microvm_machine_get_pic,
-                              microvm_machine_set_pic,
-                              NULL, NULL);
-    object_class_property_set_description(oc, MICROVM_MACHINE_PIC,
-        "Enable i8259 PIC");
-
     object_class_property_add(oc, MICROVM_MACHINE_RTC, "OnOffAuto",
                               microvm_machine_get_rtc,
                               microvm_machine_set_rtc,
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index b72c03d0a626..2fbdd6792e5d 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -218,7 +218,9 @@ static void pc_init1(MachineState *machine,
     }
     isa_bus_irqs(isa_bus, x86ms->gsi);
 
-    pc_i8259_create(isa_bus, gsi_state->i8259_irq);
+    if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
+        pc_i8259_create(isa_bus, gsi_state->i8259_irq);
+    }
 
     if (pcmc->pci_enabled) {
         ioapic_init_gsi(gsi_state, "i440fx");
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 1780f79bc127..58e7e693f9e2 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -265,7 +265,9 @@ static void pc_q35_init(MachineState *machine)
     pci_bus_set_route_irq_fn(host_bus, ich9_route_intx_pin_to_irq);
     isa_bus = ich9_lpc->isa_bus;
 
-    pc_i8259_create(isa_bus, gsi_state->i8259_irq);
+    if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
+        pc_i8259_create(isa_bus, gsi_state->i8259_irq);
+    }
 
     if (pcmc->pci_enabled) {
         ioapic_init_gsi(gsi_state, "q35");
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index cbe43bb9be58..8e30daccdb7c 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1230,6 +1230,23 @@ static void x86_machine_set_pit(Object *obj, Visitor *v, const char *name,
     visit_type_OnOffAuto(v, name, &x86ms->pit, errp);
 }
 
+static void x86_machine_get_pic(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+    OnOffAuto pic = x86ms->pic;
+
+    visit_type_OnOffAuto(v, name, &pic, errp);
+}
+
+static void x86_machine_set_pic(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+
+    visit_type_OnOffAuto(v, name, &x86ms->pic, errp);
+}
+
 static char *x86_machine_get_oem_id(Object *obj, Error **errp)
 {
     X86MachineState *x86ms = X86_MACHINE(obj);
@@ -1320,6 +1337,7 @@ static void x86_machine_initfn(Object *obj)
     x86ms->smm = ON_OFF_AUTO_AUTO;
     x86ms->acpi = ON_OFF_AUTO_AUTO;
     x86ms->pit = ON_OFF_AUTO_AUTO;
+    x86ms->pic = ON_OFF_AUTO_AUTO;
     x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
     x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
@@ -1358,6 +1376,13 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, X86_MACHINE_PIT,
         "Enable i8254 PIT");
 
+    object_class_property_add(oc, X86_MACHINE_PIC, "OnOffAuto",
+                              x86_machine_get_pic,
+                              x86_machine_set_pic,
+                              NULL, NULL);
+    object_class_property_set_description(oc, X86_MACHINE_PIC,
+        "Enable i8259 PIC");
+
     object_class_property_add_str(oc, X86_MACHINE_OEM_ID,
                                   x86_machine_get_oem_id,
                                   x86_machine_set_oem_id);
diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index 83f9ac0b2ad0..fad97a891dcb 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -67,7 +67,6 @@
 #define PCIE_ECAM_SIZE        0x10000000
 
 /* Machine type options */
-#define MICROVM_MACHINE_PIC                 "pic"
 #define MICROVM_MACHINE_RTC                 "rtc"
 #define MICROVM_MACHINE_PCIE                "pcie"
 #define MICROVM_MACHINE_IOAPIC2             "ioapic2"
@@ -85,7 +84,6 @@ struct MicrovmMachineState {
     X86MachineState parent;
 
     /* Machine type options */
-    OnOffAuto pic;
     OnOffAuto rtc;
     OnOffAuto pcie;
     OnOffAuto ioapic2;
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index d1dc7e088e4a..e903c69b32e0 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -66,6 +66,7 @@ struct X86MachineState {
     OnOffAuto smm;
     OnOffAuto acpi;
     OnOffAuto pit;
+    OnOffAuto pic;
 
     char *oem_id;
     char *oem_table_id;
@@ -86,6 +87,7 @@ struct X86MachineState {
 #define X86_MACHINE_SMM              "smm"
 #define X86_MACHINE_ACPI             "acpi"
 #define X86_MACHINE_PIT              "pit"
+#define X86_MACHINE_PIC              "pic"
 #define X86_MACHINE_OEM_ID           "x-oem-id"
 #define X86_MACHINE_OEM_TABLE_ID     "x-oem-table-id"
 #define X86_MACHINE_BUS_LOCK_RATELIMIT  "bus-lock-ratelimit"
-- 
2.27.0


