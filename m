Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F01318579
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 07:58:35 +0100 (CET)
Received: from localhost ([::1]:60852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA5vu-0007oX-54
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 01:58:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lA5mJ-000240-0b
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 01:48:39 -0500
Received: from mga11.intel.com ([192.55.52.93]:48357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lA5mG-0008Bv-Vs
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 01:48:38 -0500
IronPort-SDR: VylLTw0kpiO2XhKW1Y1003Cc8IGl2vZCWvjd8iPz1POf7ed1id77EZvD6n3nyuQfksb3xCTBSN
 FPw7OlTjVxUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="178692960"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="178692960"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 22:48:23 -0800
IronPort-SDR: GhfGEZFAh+zUvNKPpn1REr1uk8jcXU9sqzBra8ol66U/nxCb3w5OVNfwhfc9ml8FPxv6ug0oSs
 c/9G3OSFPTjw==
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="588716258"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 22:48:23 -0800
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH v3 03/10] i386: add properoty, x-smm-compat-5,
 to keep compatibility of SMM
Date: Wed, 10 Feb 2021 22:46:39 -0800
Message-Id: <7b74891766ad1caccd83c28ecea0d5d4293b3860.1613025709.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613025709.git.isaku.yamahata@intel.com>
References: <cover.1613025709.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613025709.git.isaku.yamahata@intel.com>
References: <cover.1613025709.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=192.55.52.93;
 envelope-from=isaku.yamahata@intel.com; helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following patch will introduce incompatible behavior of SMM.
Introduce a property to keep the old behavior for compatibility.
To enable smm compat, use "-machine x-smm-compat-5=on"

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/i386/pc_piix.c     | 10 ++++++----
 hw/i386/pc_q35.c      |  1 +
 hw/i386/x86.c         | 18 ++++++++++++++++++
 include/hw/i386/x86.h |  2 ++
 4 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 6188c3e97e..87269e170e 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -441,6 +441,7 @@ DEFINE_I440FX_MACHINE(v6_0, "pc-i440fx-6.0", NULL,
 static void pc_i440fx_5_2_machine_options(MachineClass *m)
 {
     pc_i440fx_6_0_machine_options(m);
+    m->default_machine_opts = "firmware=bios-256k.bin,x-smm-compat-5=on";
     m->alias = NULL;
     m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
@@ -664,7 +665,8 @@ static void pc_i440fx_2_2_machine_options(MachineClass *m)
 
     pc_i440fx_2_3_machine_options(m);
     m->hw_version = "2.2.0";
-    m->default_machine_opts = "firmware=bios-256k.bin,suppress-vmdesc=on";
+    m->default_machine_opts = "firmware=bios-256k.bin,suppress-vmdesc=on"
+        ",x-smm-compat-5=on";
     compat_props_add(m->compat_props, hw_compat_2_2, hw_compat_2_2_len);
     compat_props_add(m->compat_props, pc_compat_2_2, pc_compat_2_2_len);
     pcmc->rsdp_in_ram = false;
@@ -727,7 +729,7 @@ static void pc_i440fx_1_7_machine_options(MachineClass *m)
 
     pc_i440fx_2_0_machine_options(m);
     m->hw_version = "1.7.0";
-    m->default_machine_opts = NULL;
+    m->default_machine_opts = "x-smm-compat-5=on";
     m->option_rom_has_mr = true;
     compat_props_add(m->compat_props, pc_compat_1_7, pc_compat_1_7_len);
     pcmc->smbios_defaults = false;
@@ -999,7 +1001,7 @@ static void xenfv_4_2_machine_options(MachineClass *m)
     pc_i440fx_4_2_machine_options(m);
     m->desc = "Xen Fully-virtualized PC";
     m->max_cpus = HVM_MAX_VCPUS;
-    m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
+    m->default_machine_opts = "accel=xen,suppress-vmdesc=on,x-smm-compat-5=on";
 }
 
 DEFINE_PC_MACHINE(xenfv_4_2, "xenfv-4.2", pc_xen_hvm_init,
@@ -1011,7 +1013,7 @@ static void xenfv_3_1_machine_options(MachineClass *m)
     m->desc = "Xen Fully-virtualized PC";
     m->alias = "xenfv";
     m->max_cpus = HVM_MAX_VCPUS;
-    m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
+    m->default_machine_opts = "accel=xen,suppress-vmdesc=on,x-smm-compat-5=on";
 }
 
 DEFINE_PC_MACHINE(xenfv, "xenfv-3.1", pc_xen_hvm_init,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 0a212443aa..14974b7255 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -358,6 +358,7 @@ DEFINE_Q35_MACHINE(v6_0, "pc-q35-6.0", NULL,
 static void pc_q35_5_2_machine_options(MachineClass *m)
 {
     pc_q35_6_0_machine_options(m);
+    m->default_machine_opts = "firmware=bios-256k.bin,x-smm-compat-5=on";
     m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
     compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 6329f90ef9..00eb2253d3 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1174,6 +1174,18 @@ static void x86_machine_set_smm(Object *obj, Visitor *v, const char *name,
     visit_type_OnOffAuto(v, name, &x86ms->smm, errp);
 }
 
+static bool x86_machine_get_smm_compat_5(Object *obj, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+    return  x86ms->smm_compat_5;
+}
+
+static void x86_machine_set_smm_compat_5(Object *obj, bool value, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+    x86ms->smm_compat_5 = value;
+}
+
 bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms)
 {
     if (x86ms->acpi == ON_OFF_AUTO_OFF) {
@@ -1204,6 +1216,7 @@ static void x86_machine_initfn(Object *obj)
     X86MachineState *x86ms = X86_MACHINE(obj);
 
     x86ms->smm = ON_OFF_AUTO_AUTO;
+    x86ms->smm_compat_5 = false;
     x86ms->acpi = ON_OFF_AUTO_AUTO;
     x86ms->smp_dies = 1;
     x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
@@ -1228,6 +1241,11 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, X86_MACHINE_SMM,
         "Enable SMM");
 
+    object_class_property_add_bool(oc, X86_MACHINE_SMM_COMPAT_5,
+        x86_machine_get_smm_compat_5, x86_machine_set_smm_compat_5);
+    object_class_property_set_description(oc, X86_MACHINE_SMM_COMPAT_5,
+        "Enable SMM compatible behavior");
+
     object_class_property_add(oc, X86_MACHINE_ACPI, "OnOffAuto",
         x86_machine_get_acpi, x86_machine_set_acpi,
         NULL, NULL);
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 56080bd1fb..3dbe19a335 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -65,6 +65,7 @@ struct X86MachineState {
     unsigned smp_dies;
 
     OnOffAuto smm;
+    bool smm_compat_5;
     OnOffAuto acpi;
 
     /*
@@ -75,6 +76,7 @@ struct X86MachineState {
 };
 
 #define X86_MACHINE_SMM              "smm"
+#define X86_MACHINE_SMM_COMPAT_5     "x-smm-compat-5"
 #define X86_MACHINE_ACPI             "acpi"
 
 #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
-- 
2.17.1


