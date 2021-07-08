Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 951673BF35D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:15:00 +0200 (CEST)
Received: from localhost ([::1]:40384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Id1-0000Ho-Kj
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IL4-0002iv-2Q
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:27 -0400
Received: from mga12.intel.com ([192.55.52.136]:57610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IL2-0007LH-AK
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:25 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="189101740"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="189101740"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:59 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423770120"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:59 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 40/44] hw/i386: add a flag to disallow SMI
Date: Wed,  7 Jul 2021 17:55:10 -0700
Message-Id: <ffab6a95d135612a81e3941002ee098108128268.1625704981.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625704980.git.isaku.yamahata@intel.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=isaku.yamahata@intel.com; helo=mga12.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

Add a new flag to X86Machine to disallow SMI and pass it to ioapic creation
so that ioapic disallows delivery mode of SMI.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/i386/microvm.c     |  6 ++++--
 hw/i386/pc_piix.c     |  3 ++-
 hw/i386/pc_q35.c      |  3 ++-
 hw/i386/x86.c         | 11 +++++++++--
 include/hw/i386/x86.h |  7 +++++--
 5 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 9b03d051ca..7504324891 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -175,10 +175,12 @@ static void microvm_devices_init(MicrovmMachineState *mms)
                           &error_abort);
     isa_bus_irqs(isa_bus, x86ms->gsi);
 
-    ioapic_init_gsi(gsi_state, "machine", x86ms->eoi_intercept_unsupported);
+    ioapic_init_gsi(gsi_state, "machine", x86ms->eoi_intercept_unsupported,
+                    x86ms->smi_unsupported);
     if (ioapics > 1) {
         x86ms->ioapic2 = ioapic_init_secondary(
-            gsi_state, x86ms->eoi_intercept_unsupported);
+            gsi_state, x86ms->eoi_intercept_unsupported,
+            x86ms->smi_unsupported);
     }
 
     kvmclock_create(true);
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index a601c4a916..0958035bf8 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -223,7 +223,8 @@ static void pc_init1(MachineState *machine,
     }
 
     if (pcmc->pci_enabled) {
-        ioapic_init_gsi(gsi_state, "i440fx", x86ms->eoi_intercept_unsupported);
+        ioapic_init_gsi(gsi_state, "i440fx", x86ms->eoi_intercept_unsupported,
+                        x86ms->smi_unsupported);
     }
 
     if (tcg_enabled()) {
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 464463766c..1ab8a6a78b 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -256,7 +256,8 @@ static void pc_q35_init(MachineState *machine)
     }
 
     if (pcmc->pci_enabled) {
-        ioapic_init_gsi(gsi_state, "q35", x86ms->eoi_intercept_unsupported);
+        ioapic_init_gsi(gsi_state, "q35", x86ms->eoi_intercept_unsupported,
+                        x86ms->smi_unsupported);
     }
 
     if (tcg_enabled()) {
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 88c365b72d..3dc36e3590 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -609,7 +609,8 @@ void gsi_handler(void *opaque, int n, int level)
 }
 
 void ioapic_init_gsi(GSIState *gsi_state, const char *parent_name,
-                     bool level_trigger_unsupported)
+                     bool level_trigger_unsupported,
+                     bool smi_unsupported)
 {
     DeviceState *dev;
     SysBusDevice *d;
@@ -625,6 +626,8 @@ void ioapic_init_gsi(GSIState *gsi_state, const char *parent_name,
                               "ioapic", OBJECT(dev));
     object_property_set_bool(OBJECT(dev), "level_trigger_unsupported",
                              level_trigger_unsupported, NULL);
+    object_property_set_bool(OBJECT(dev), "smi_unsupported",
+                             smi_unsupported, NULL);
     d = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(d, &error_fatal);
     sysbus_mmio_map(d, 0, IO_APIC_DEFAULT_ADDRESS);
@@ -635,7 +638,8 @@ void ioapic_init_gsi(GSIState *gsi_state, const char *parent_name,
 }
 
 DeviceState *ioapic_init_secondary(GSIState *gsi_state,
-                                   bool level_trigger_unsupported)
+                                   bool level_trigger_unsupported,
+                                   bool smi_unsupported)
 {
     DeviceState *dev;
     SysBusDevice *d;
@@ -644,6 +648,8 @@ DeviceState *ioapic_init_secondary(GSIState *gsi_state,
     dev = qdev_new(TYPE_IOAPIC);
     object_property_set_bool(OBJECT(dev), "level_trigger_unsupported",
                              level_trigger_unsupported, NULL);
+    object_property_set_bool(OBJECT(dev), "smi_unsupported",
+                             smi_unsupported, NULL);
     d = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(d, &error_fatal);
     sysbus_mmio_map(d, 0, IO_APIC_SECONDARY_ADDRESS);
@@ -1318,6 +1324,7 @@ static void x86_machine_initfn(Object *obj)
     x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
     x86ms->bus_lock_ratelimit = 0;
     x86ms->eoi_intercept_unsupported = false;
+    x86ms->smi_unsupported = false;
 
     object_property_add_str(obj, "kvm-type",
                             x86_get_kvm_type, x86_set_kvm_type);
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 7536e5fb8c..3d1d74d171 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -64,6 +64,7 @@ struct X86MachineState {
     unsigned apic_id_limit;
     uint16_t boot_cpus;
     bool eoi_intercept_unsupported;
+    bool smi_unsupported;
 
     OnOffAuto smm;
     OnOffAuto acpi;
@@ -141,8 +142,10 @@ typedef struct GSIState {
 qemu_irq x86_allocate_cpu_irq(void);
 void gsi_handler(void *opaque, int n, int level);
 void ioapic_init_gsi(GSIState *gsi_state, const char *parent_name,
-                     bool eoi_intercept_unsupported);
+                     bool eoi_intercept_unsupported,
+                     bool smi_unsupported);
 DeviceState *ioapic_init_secondary(GSIState *gsi_state,
-                                   bool eoi_intercept_unsupported);
+                                   bool eoi_intercept_unsupported,
+                                   bool smi_unsupported);
 
 #endif
-- 
2.25.1


