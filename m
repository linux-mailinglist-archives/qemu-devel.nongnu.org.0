Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63F366AE51
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 23:29:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGp0M-00012h-1T; Sat, 14 Jan 2023 17:28:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pGp0K-00012A-7y
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 17:28:00 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pGp0I-0003iH-8W
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 17:28:00 -0500
Received: by mail-ej1-x62f.google.com with SMTP id ud5so60067053ejc.4
 for <qemu-devel@nongnu.org>; Sat, 14 Jan 2023 14:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UgcCIq04sStSaxyfa0AQh8ota7xey1Q2r5NQSKgYtsY=;
 b=ePtioxCw2Db+hSZX/3XPB1H/mYqYCIxcypPzGHtoCDVn63yYZCGOe5NelsH2NZaMWH
 qVu2HzYB1muXYWl5g5zMCUjS1SWFKsM0il5HSK7IwJHCF8VZNwjL0jxuECUnhpI5qlPH
 waR1C3AS+Xj0mKVPv5NkqD7yN583VFh7OBGOFI2+s1hWrIxMRIp+J+D4950YOA1jClrq
 bkJTMQcDuFU64GQk4c4AMsI0GycZ9yUXQRVX54jWOChDPrWkZa/cp6Jqx3oTE54CQe+4
 CxY6EUKry1v80uvEfwSPPYaGqx0PFbnRwD7TO6GW+qCb6JST9VbbsIKuUOqtXUA9WJiB
 wRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UgcCIq04sStSaxyfa0AQh8ota7xey1Q2r5NQSKgYtsY=;
 b=WxG4N7JhQ/XijUhK2GGGmr9DS0o0BmRCVctZ/Qana6lYMtTdqi0PUiGeJuYp2lvYdN
 R6nBXuxBGR5hzx1/rivVFqVya6RniKUNBvqvavn8aK3XUxjOT7fwnMSlKXWxyO0bFH/K
 uhBXLuD6HNsuQSA8Sr+gTuPiEFqDXF1IHRRqIXWqEUP+Xcy1nMs0GosK0LmxRd/OZIJE
 d3JqZ08aB8l1o76cJ8wJuWDA2tehbtuvQKiqYxfIz0oEqBeTn8I1HXqTM9TzaJa6U8UT
 d7kcDs2H8Pf5OPpqANMUY03wHInSdrjHng7agUOhbdadwPAPquZzG0Vupqu0yac86CHu
 VXYA==
X-Gm-Message-State: AFqh2krDtLRspkxfCu6Ebsv+03WvhQbm35kxcfFzypApWYMFBoO7rwd4
 BroXCJuijk9LX0XsZrh29VbLkp3bnfM=
X-Google-Smtp-Source: AMrXdXvv17CX5J169iKQHTtXbixBnoxWECITJRsnXtjURrq89kNV5Idcf3FvTi1c4s771QbRvhJ4YA==
X-Received: by 2002:a17:906:38c6:b0:7c0:dcc2:e7b1 with SMTP id
 r6-20020a17090638c600b007c0dcc2e7b1mr72667201ejd.43.1673735276698; 
 Sat, 14 Jan 2023 14:27:56 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-013-123-004.77.13.pool.telefonica.de. [77.13.123.4])
 by smtp.gmail.com with ESMTPSA id
 og5-20020a1709071dc500b0084d420503a3sm8324840ejc.178.2023.01.14.14.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 14:27:56 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 3/7] hw/acpi/acpi_dev_interface: Resolve
 AcpiDeviceIfClass::madt_cpu
Date: Sat, 14 Jan 2023 23:27:34 +0100
Message-Id: <20230114222738.282478-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114222738.282478-1-shentey@gmail.com>
References: <20230114222738.282478-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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
instead. The other locations where it was called was in x86 specific code
where pc_madt_cpu_entry() can be used directly.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/acpi-common.h                |  7 +++++--
 include/hw/acpi/acpi_dev_interface.h |  3 ---
 include/hw/acpi/cpu.h                |  6 +++++-
 include/hw/i386/pc.h                 |  4 ----
 hw/acpi/acpi-x86-stub.c              |  6 ------
 hw/acpi/cpu.c                        | 11 ++++-------
 hw/acpi/piix4.c                      |  2 --
 hw/i386/acpi-build.c                 |  5 ++---
 hw/i386/acpi-common.c                |  5 ++---
 hw/i386/acpi-microvm.c               |  3 +--
 hw/i386/generic_event_device_x86.c   |  9 ---------
 hw/isa/lpc_ich9.c                    |  1 -
 12 files changed, 19 insertions(+), 43 deletions(-)

diff --git a/hw/i386/acpi-common.h b/hw/i386/acpi-common.h
index a68825acf5..968d625d88 100644
--- a/hw/i386/acpi-common.h
+++ b/hw/i386/acpi-common.h
@@ -1,15 +1,18 @@
 #ifndef HW_I386_ACPI_COMMON_H
 #define HW_I386_ACPI_COMMON_H
 
-#include "hw/acpi/acpi_dev_interface.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/i386/x86.h"
+#include "hw/boards.h"
 
 /* Default IOAPIC ID */
 #define ACPI_BUILD_IOAPIC_ID 0x0
 
+void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids, GArray *entry,
+                       bool force_enabled);
+
 void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
-                     X86MachineState *x86ms, AcpiDeviceIf *adev,
+                     X86MachineState *x86ms,
                      const char *oem_id, const char *oem_table_id);
 
 #endif
diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
index a1648220ff..68d9d15f50 100644
--- a/include/hw/acpi/acpi_dev_interface.h
+++ b/include/hw/acpi/acpi_dev_interface.h
@@ -3,7 +3,6 @@
 
 #include "qapi/qapi-types-acpi.h"
 #include "qom/object.h"
-#include "hw/boards.h"
 #include "hw/qdev-core.h"
 
 /* These values are part of guest ABI, and can not be changed */
@@ -52,7 +51,5 @@ struct AcpiDeviceIfClass {
     /* <public> */
     void (*ospm_status)(AcpiDeviceIf *adev, ACPIOSTInfoList ***list);
     void (*send_event)(AcpiDeviceIf *adev, AcpiEventStatusBits ev);
-    void (*madt_cpu)(int uid, const CPUArchIdList *apic_ids, GArray *entry,
-                     bool force_enabled);
 };
 #endif
diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index 999caaf510..25b25bb594 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -15,6 +15,7 @@
 #include "hw/qdev-core.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
+#include "hw/boards.h"
 #include "hw/hotplug.h"
 
 typedef struct AcpiCpuStatus {
@@ -55,8 +56,11 @@ typedef struct CPUHotplugFeatures {
     const char *smi_path;
 } CPUHotplugFeatures;
 
+typedef void (*madt_cpu_fn)(int uid, const CPUArchIdList *apic_ids,
+                            GArray *entry, bool force_enabled);
+
 void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
-                    hwaddr io_base,
+                    hwaddr io_base, madt_cpu_fn madt_cpu,
                     const char *res_root,
                     const char *event_handler_method);
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index a0647165d1..a5cce88653 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -191,10 +191,6 @@ bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
                                int *data_len);
 void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
 
-/* hw/i386/acpi-common.c */
-void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
-                       GArray *entry, bool force_enabled);
-
 /* sgx.c */
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
 
diff --git a/hw/acpi/acpi-x86-stub.c b/hw/acpi/acpi-x86-stub.c
index d0d399d26b..9662a594ad 100644
--- a/hw/acpi/acpi-x86-stub.c
+++ b/hw/acpi/acpi-x86-stub.c
@@ -1,12 +1,6 @@
 #include "qemu/osdep.h"
-#include "hw/i386/pc.h"
 #include "hw/i386/acpi-build.h"
 
-void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
-                       GArray *entry, bool force_enabled)
-{
-}
-
 Object *acpi_get_i386_pci_host(void)
 {
        return NULL;
diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index c59a0acbf1..bc77c00d66 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -2,7 +2,6 @@
 #include "migration/vmstate.h"
 #include "hw/acpi/cpu.h"
 #include "hw/core/cpu.h"
-#include "hw/boards.h"
 #include "qapi/error.h"
 #include "qapi/qapi-events-acpi.h"
 #include "trace.h"
@@ -340,7 +339,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
 #define CPU_FW_EJECT_EVENT "CEJF"
 
 void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
-                    hwaddr io_base,
+                    hwaddr io_base, madt_cpu_fn madt_cpu,
                     const char *res_root,
                     const char *event_handler_method)
 {
@@ -355,8 +354,8 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(machine);
     char *cphp_res_path = g_strdup_printf("%s." CPUHP_RES_DEVICE, res_root);
-    Object *obj = object_resolve_path_type("", TYPE_ACPI_DEVICE_IF, NULL);
-    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(obj);
+
+    assert(madt_cpu);
 
     cpu_ctrl_dev = aml_device("%s", cphp_res_path);
     {
@@ -666,9 +665,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
             aml_append(dev, method);
 
             /* build _MAT object */
-            assert(adevc && adevc->madt_cpu);
-            adevc->madt_cpu(i, arch_ids, madt_buf,
-                            true); /* set enabled flag */
+            madt_cpu(i, arch_ids, madt_buf, true /* set enabled flag */);
             aml_append(dev, aml_name_decl("_MAT",
                 aml_buffer(madt_buf->len, (uint8_t *)madt_buf->data)));
             g_array_free(madt_buf, true);
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 0a81f1ad93..4d0d4fdeeb 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -20,7 +20,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/i386/pc.h"
 #include "hw/southbridge/piix.h"
 #include "hw/irq.h"
 #include "hw/isa/apm.h"
@@ -643,7 +642,6 @@ static void piix4_pm_class_init(ObjectClass *klass, void *data)
     hc->unplug = piix4_device_unplug_cb;
     adevc->ospm_status = piix4_ospm_status;
     adevc->send_event = piix4_send_gpe;
-    adevc->madt_cpu = pc_madt_cpu_entry;
 }
 
 static const TypeInfo piix4_pm_info = {
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 127c4e2d50..0be3960a37 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1440,7 +1440,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
         };
         build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
-                       "\\_SB.PCI0", "\\_GPE._E02");
+                       pc_madt_cpu_entry, "\\_SB.PCI0", "\\_GPE._E02");
     }
 
     if (pcms->memhp_io_base && nr_mem) {
@@ -2424,8 +2424,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
 
     acpi_add_table(table_offsets, tables_blob);
     acpi_build_madt(tables_blob, tables->linker, x86ms,
-                    ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
-                    x86ms->oem_table_id);
+                    x86ms->oem_id, x86ms->oem_table_id);
 
 #ifdef CONFIG_ACPI_ERST
     {
diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index 52e5c1439a..aabf78092e 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -94,14 +94,13 @@ build_xrupt_override(GArray *entry, uint8_t src, uint32_t gsi, uint16_t flags)
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
 
@@ -111,7 +110,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
     build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */, 4); /* Flags */
 
     for (i = 0; i < apic_ids->len; i++) {
-        adevc->madt_cpu(i, apic_ids, table_data, false);
+        pc_madt_cpu_entry(i, apic_ids, table_data, false);
         if (apic_ids->cpus[i].arch_id > 254) {
             x2apic_mode = true;
         }
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index fb09185cbd..d8a444d06c 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -213,8 +213,7 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
 
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
index 8d541e2b54..0ab0a341be 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -870,7 +870,6 @@ static void ich9_lpc_class_init(ObjectClass *klass, void *data)
     hc->unplug = ich9_pm_device_unplug_cb;
     adevc->ospm_status = ich9_pm_ospm_status;
     adevc->send_event = ich9_send_gpe;
-    adevc->madt_cpu = pc_madt_cpu_entry;
     amldevc->build_dev_aml = build_ich9_isa_aml;
 }
 
-- 
2.39.0


