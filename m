Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E4A676718
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 16:21:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJFf3-0002Az-BI; Sat, 21 Jan 2023 10:20:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJFf0-00028W-Pj; Sat, 21 Jan 2023 10:20:02 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJFey-0005fj-Gq; Sat, 21 Jan 2023 10:20:02 -0500
Received: by mail-ej1-x62a.google.com with SMTP id az20so20823647ejc.1;
 Sat, 21 Jan 2023 07:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2jIeCbjm1xwNhNjpUbaUI09X3C4DGq6Rb9TXHKzV2JA=;
 b=K9Tf1l4VXQmpQN6PFUYulcwtDY1ipwCfb8i1NXd36srXD3nJ+Sn0liNUEvPZTHPJfv
 h7YeJMsKIvAw3Vtvh/AgOXOs3NCE7Bt3qvw8uTfLWEZOUFyUAi8hrOPAwrqduOqgBLVz
 oxJZrQeCsyZFY/NWL0DW17KjxoCx1LySj2shRQ4h98Ky8wtVYzAxhjyRlZwmwsv4o9Qw
 66EhFV8UqZGd3X0t8n8WFUNSDDYR9MZ+XOja6lBuaObM1XJYZfMGthkQc3xni2VHNPhX
 WG7w5KSYvLaVxC76p3Ca1YQ+cmQ6M1myVJ3j63LPa7cVo83CQPbOyzU+GY6oFL3cjLd0
 AHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2jIeCbjm1xwNhNjpUbaUI09X3C4DGq6Rb9TXHKzV2JA=;
 b=i9g8RfOQejojvQW9ZNk/A+pELtG/btpYVcT2T6ZhZBJVzLxoNPZDeR87epcPLBsuln
 cIHqvSe0D/XGYZUN04gtPIsrhJORg/srl4y8gt7/pvmgv8GIAZCF3iL+EYu/bNm6Kreg
 Q2+H127BvBitUxeHzaeHhq/okmhgZUV9SE2+VNVrwYyJYqgMXglGvHmY/Xx/gNqXwl3p
 gFG7XnPvuDoXXt0E3LXMtv4XCFbnPxmerC89vrT62L8QL9ZM1Bchf1hz7JAV0/246Gr1
 s7TRM4yBo5G8+KI8fmD3pBeboPfxuE+ayA/aSomzpabQq7PqsbMGIYr2deXj4MHpK/rS
 u8VA==
X-Gm-Message-State: AFqh2kpTt4ryiFQVq1DxzvtCqQRaPZF7Mr2ZoeAFdSnffCgy7iYSbUoK
 4jHaAwWRmoJIKi1779+6eymX49rJtPI6iw==
X-Google-Smtp-Source: AMrXdXvYNVKRCQQ6Qou3YeIrOO1FjBymhTwAEH3NqrW2PcDxiebOvHe2HqNJv2uVy0FwlexjStwWew==
X-Received: by 2002:a17:907:8e86:b0:84d:43c3:a897 with SMTP id
 tx6-20020a1709078e8600b0084d43c3a897mr35550418ejc.2.1674314398334; 
 Sat, 21 Jan 2023 07:19:58 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170906101400b0085ff05d5dbdsm14162567ejm.173.2023.01.21.07.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 07:19:57 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 5/7] hw/acpi/acpi_dev_interface: Factor out
 TYPE_ACPI_CPU_AML_IF
Date: Sat, 21 Jan 2023 16:19:39 +0100
Message-Id: <20230121151941.24120-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121151941.24120-1-shentey@gmail.com>
References: <20230121151941.24120-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This class attribute was always set to pc_madt_cpu_entry().
pc_madt_cpu_entry() is architecture dependent and was assigned to the
attribute even in architecture agnostic code such as in hw/acpi/piix4.c
and hw/isa/lpc_ich9. Not having to set madt_cpu there resolves the
assumption that these device models are only ever used with ACPI on x86
targets.

The only target independent location where madt_cpu was called was hw/
acpi/cpu.c. Here a function pointer can be passed via an argument
instead. The other locations where it was called was in x86-specific code
where pc_madt_cpu_entry() can be used directly.

While at it, move pc_madt_cpu_entry() from the public include/hw/i386/
pc.h to the private hw/i386/acpi-common where it is also implemented.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>

TYPE_ACPI_CPU_IF
---
 hw/i386/acpi-common.h                |  3 +--
 include/hw/acpi/acpi_cpu_interface.h | 26 ++++++++++++++++++++++++++
 include/hw/acpi/acpi_dev_interface.h |  2 --
 hw/acpi/acpi_interface.c             |  8 +++++++-
 hw/acpi/cpu.c                        | 11 ++++++-----
 hw/acpi/piix4.c                      |  2 --
 hw/i386/acpi-build.c                 |  3 +--
 hw/i386/acpi-common.c                |  8 +++++---
 hw/i386/acpi-microvm.c               |  3 +--
 hw/i386/generic_event_device_x86.c   |  9 ---------
 hw/isa/lpc_ich9.c                    |  1 -
 target/i386/cpu.c                    | 13 +++++++++++++
 12 files changed, 60 insertions(+), 29 deletions(-)
 create mode 100644 include/hw/acpi/acpi_cpu_interface.h

diff --git a/hw/i386/acpi-common.h b/hw/i386/acpi-common.h
index a68825acf5..b3c56ee014 100644
--- a/hw/i386/acpi-common.h
+++ b/hw/i386/acpi-common.h
@@ -1,7 +1,6 @@
 #ifndef HW_I386_ACPI_COMMON_H
 #define HW_I386_ACPI_COMMON_H
 
-#include "hw/acpi/acpi_dev_interface.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/i386/x86.h"
 
@@ -9,7 +8,7 @@
 #define ACPI_BUILD_IOAPIC_ID 0x0
 
 void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
-                     X86MachineState *x86ms, AcpiDeviceIf *adev,
+                     X86MachineState *x86ms,
                      const char *oem_id, const char *oem_table_id);
 
 #endif
diff --git a/include/hw/acpi/acpi_cpu_interface.h b/include/hw/acpi/acpi_cpu_interface.h
new file mode 100644
index 0000000000..600f0b68cd
--- /dev/null
+++ b/include/hw/acpi/acpi_cpu_interface.h
@@ -0,0 +1,26 @@
+#ifndef ACPI_CPU_INTERFACE_H
+#define ACPI_CPU_INTERFACE_H
+
+#include "qom/object.h"
+#include "hw/boards.h"
+#include "hw/qdev-core.h"
+
+#define TYPE_ACPI_CPU_AML_IF "acpi-cpu-aml-interface"
+
+typedef struct AcpiCpuAmlIfClass AcpiCpuAmlIfClass;
+DECLARE_CLASS_CHECKERS(AcpiCpuAmlIfClass, ACPI_CPU_AML_IF,
+                       TYPE_ACPI_CPU_AML_IF)
+#define ACPI_CPU_AML_IF(obj) \
+    INTERFACE_CHECK(AcpiCpuAmlIf, (obj), TYPE_ACPI_CPU_AML_IF)
+
+typedef struct AcpiCpuAmlIf AcpiCpuAmlIf;
+
+struct AcpiCpuAmlIfClass {
+    /* <private> */
+    InterfaceClass parent_class;
+
+    /* <public> */
+    void (*madt_cpu)(int uid, const CPUArchIdList *apic_ids, GArray *entry,
+                     bool force_enabled);
+};
+#endif
diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
index a1648220ff..ca92928124 100644
--- a/include/hw/acpi/acpi_dev_interface.h
+++ b/include/hw/acpi/acpi_dev_interface.h
@@ -52,7 +52,5 @@ struct AcpiDeviceIfClass {
     /* <public> */
     void (*ospm_status)(AcpiDeviceIf *adev, ACPIOSTInfoList ***list);
     void (*send_event)(AcpiDeviceIf *adev, AcpiEventStatusBits ev);
-    void (*madt_cpu)(int uid, const CPUArchIdList *apic_ids, GArray *entry,
-                     bool force_enabled);
 };
 #endif
diff --git a/hw/acpi/acpi_interface.c b/hw/acpi/acpi_interface.c
index 8637ff18fc..11a57e2154 100644
--- a/hw/acpi/acpi_interface.c
+++ b/hw/acpi/acpi_interface.c
@@ -1,4 +1,5 @@
 #include "qemu/osdep.h"
+#include "hw/acpi/acpi_cpu_interface.h"
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/acpi/acpi_aml_interface.h"
 #include "qemu/module.h"
@@ -34,10 +35,15 @@ static void register_types(void)
         .parent        = TYPE_INTERFACE,
         .class_size = sizeof(AcpiDevAmlIfClass),
     };
-
+    static const TypeInfo acpi_cpu_aml_if_info = {
+        .name          = TYPE_ACPI_CPU_AML_IF,
+        .parent        = TYPE_INTERFACE,
+        .class_size = sizeof(AcpiCpuAmlIfClass),
+    };
 
     type_register_static(&acpi_dev_if_info);
     type_register_static(&acpi_dev_aml_if_info);
+    type_register_static(&acpi_cpu_aml_if_info);
 }
 
 type_init(register_types)
diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 19c154d78f..f6647e99b1 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -1,5 +1,6 @@
 #include "qemu/osdep.h"
 #include "migration/vmstate.h"
+#include "hw/acpi/acpi_cpu_interface.h"
 #include "hw/acpi/cpu.h"
 #include "qapi/error.h"
 #include "qapi/qapi-events-acpi.h"
@@ -353,8 +354,6 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(machine);
     char *cphp_res_path = g_strdup_printf("%s." CPUHP_RES_DEVICE, res_root);
-    Object *obj = object_resolve_path_type("", TYPE_ACPI_DEVICE_IF, NULL);
-    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(obj);
 
     cpu_ctrl_dev = aml_device("%s", cphp_res_path);
     {
@@ -648,6 +647,8 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
         for (i = 0; i < arch_ids->len; i++) {
             Aml *dev;
             Aml *uid = aml_int(i);
+            ObjectClass *oc = object_class_by_name(arch_ids->cpus[i].type);
+            AcpiCpuAmlIfClass *acpuac = ACPI_CPU_AML_IF_CLASS(oc);
             GArray *madt_buf = g_array_new(0, 1, 1);
             int arch_id = arch_ids->cpus[i].arch_id;
 
@@ -664,9 +665,9 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
             aml_append(dev, method);
 
             /* build _MAT object */
-            assert(adevc && adevc->madt_cpu);
-            adevc->madt_cpu(i, arch_ids, madt_buf,
-                            true); /* set enabled flag */
+            assert(acpuac && acpuac->madt_cpu);
+            acpuac->madt_cpu(i, arch_ids, madt_buf,
+                             true); /* set enabled flag */
             aml_append(dev, aml_name_decl("_MAT",
                 aml_buffer(madt_buf->len, (uint8_t *)madt_buf->data)));
             g_array_free(madt_buf, true);
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 2ab4930f11..2e19a55526 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -20,7 +20,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/i386/pc.h"
 #include "hw/irq.h"
 #include "hw/isa/apm.h"
 #include "hw/i2c/pm_smbus.h"
@@ -642,7 +641,6 @@ static void piix4_pm_class_init(ObjectClass *klass, void *data)
     hc->unplug = piix4_device_unplug_cb;
     adevc->ospm_status = piix4_ospm_status;
     adevc->send_event = piix4_send_gpe;
-    adevc->madt_cpu = pc_madt_cpu_entry;
 }
 
 static const TypeInfo piix4_pm_info = {
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 8c333973f9..b12a843447 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2422,8 +2422,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
 
     acpi_add_table(table_offsets, tables_blob);
     acpi_build_madt(tables_blob, tables->linker, x86ms,
-                    ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
-                    x86ms->oem_table_id);
+                    x86ms->oem_id, x86ms->oem_table_id);
 
 #ifdef CONFIG_ACPI_ERST
     {
diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index 52e5c1439a..0d1a2bb8aa 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -25,6 +25,7 @@
 
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/acpi_cpu_interface.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/utils.h"
 #include "hw/i386/pc.h"
@@ -94,14 +95,13 @@ build_xrupt_override(GArray *entry, uint8_t src, uint32_t gsi, uint16_t flags)
  * 5.2.8 Multiple APIC Description Table
  */
 void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
-                     X86MachineState *x86ms, AcpiDeviceIf *adev,
+                     X86MachineState *x86ms,
                      const char *oem_id, const char *oem_table_id)
 {
     int i;
     bool x2apic_mode = false;
     MachineClass *mc = MACHINE_GET_CLASS(x86ms);
     const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
-    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
     AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
                         .oem_table_id = oem_table_id };
 
@@ -111,7 +111,9 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
     build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */, 4); /* Flags */
 
     for (i = 0; i < apic_ids->len; i++) {
-        adevc->madt_cpu(i, apic_ids, table_data, false);
+        ObjectClass *oc = object_class_by_name(apic_ids->cpus[i].type);
+        AcpiCpuAmlIfClass *acpuac = ACPI_CPU_AML_IF_CLASS(oc);
+        acpuac->madt_cpu(i, apic_ids, table_data, false);
         if (apic_ids->cpus[i].arch_id > 254) {
             x2apic_mode = true;
         }
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index a075360d85..fec22d85c1 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -214,8 +214,7 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
 
     acpi_add_table(table_offsets, tables_blob);
     acpi_build_madt(tables_blob, tables->linker, X86_MACHINE(machine),
-                    ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
-                    x86ms->oem_table_id);
+                    x86ms->oem_id, x86ms->oem_table_id);
 
 #ifdef CONFIG_ACPI_ERST
     {
diff --git a/hw/i386/generic_event_device_x86.c b/hw/i386/generic_event_device_x86.c
index e26fb02a2e..8fc233e1f1 100644
--- a/hw/i386/generic_event_device_x86.c
+++ b/hw/i386/generic_event_device_x86.c
@@ -8,19 +8,10 @@
 
 #include "qemu/osdep.h"
 #include "hw/acpi/generic_event_device.h"
-#include "hw/i386/pc.h"
-
-static void acpi_ged_x86_class_init(ObjectClass *class, void *data)
-{
-    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_CLASS(class);
-
-    adevc->madt_cpu = pc_madt_cpu_entry;
-}
 
 static const TypeInfo acpi_ged_x86_info = {
     .name          = TYPE_ACPI_GED_X86,
     .parent        = TYPE_ACPI_GED,
-    .class_init    = acpi_ged_x86_class_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_HOTPLUG_HANDLER },
         { TYPE_ACPI_DEVICE_IF },
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 1fba3c210c..d5d4b0f177 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -867,7 +867,6 @@ static void ich9_lpc_class_init(ObjectClass *klass, void *data)
     hc->unplug = ich9_pm_device_unplug_cb;
     adevc->ospm_status = ich9_pm_ospm_status;
     adevc->send_event = ich9_send_gpe;
-    adevc->madt_cpu = pc_madt_cpu_entry;
     amldevc->build_dev_aml = build_ich9_isa_aml;
 }
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 4d2b8d0444..6ac50506a7 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -37,7 +37,9 @@
 #include "hw/i386/topology.h"
 #ifndef CONFIG_USER_ONLY
 #include "exec/address-spaces.h"
+#include "hw/acpi/acpi_cpu_interface.h"
 #include "hw/boards.h"
+#include "hw/i386/pc.h"
 #include "hw/i386/sgx-epc.h"
 #endif
 
@@ -7114,6 +7116,9 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     CPUClass *cc = CPU_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
     ResettableClass *rc = RESETTABLE_CLASS(oc);
+#ifndef CONFIG_USER_ONLY
+    AcpiCpuAmlIfClass *acpuac = ACPI_CPU_AML_IF_CLASS(oc);
+#endif
     FeatureWord w;
 
     device_class_set_parent_realize(dc, x86_cpu_realizefn,
@@ -7138,6 +7143,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &i386_sysemu_ops;
+    acpuac->madt_cpu = pc_madt_cpu_entry;
 #endif /* !CONFIG_USER_ONLY */
 
     cc->gdb_arch_name = x86_gdb_arch_name;
@@ -7203,6 +7209,13 @@ static const TypeInfo x86_cpu_type_info = {
     .abstract = true,
     .class_size = sizeof(X86CPUClass),
     .class_init = x86_cpu_common_class_init,
+
+#ifndef CONFIG_USER_ONLY
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_ACPI_CPU_AML_IF },
+        { }
+    }
+#endif
 };
 
 /* "base" CPU model, used by query-cpu-model-expansion */
-- 
2.39.1


