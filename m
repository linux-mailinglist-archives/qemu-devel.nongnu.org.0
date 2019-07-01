Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F934416A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 18:14:38 +0200 (CEST)
Received: from localhost ([::1]:41272 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbSN3-0004SD-RX
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 12:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43307)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hbQqk-000285-6M
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 10:37:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hbQqi-0002M0-7x
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 10:37:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56116)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hbQqh-0002LK-W6
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 10:37:08 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 309C0C05FBD7;
 Thu, 13 Jun 2019 14:37:07 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD48D1001B0F;
 Thu, 13 Jun 2019 14:37:02 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 16:34:46 +0200
Message-Id: <20190613143446.23937-21-philmd@redhat.com>
In-Reply-To: <20190613143446.23937-1-philmd@redhat.com>
References: <20190613143446.23937-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Thu, 13 Jun 2019 14:37:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 20/20] hw/i386/pc: Extract the x86 generic
 fw_cfg code
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
Cc: Yang Zhong <yang.zhong@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Rob Bradford <robert.bradford@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Ortiz <sameo@linux.intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract all the functions that are not PC-machine specific into
the (arch-specific) fw_cfg.c file. This will allow other X86-machine
to reuse these functions.

Suggested-by: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/fw_cfg.c | 137 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/i386/fw_cfg.h |   8 +++
 hw/i386/pc.c     | 130 +-------------------------------------------
 3 files changed, 146 insertions(+), 129 deletions(-)

diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index 380a819230..b033d99bc4 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -13,8 +13,15 @@
  */
=20
 #include "qemu/osdep.h"
+#include "sysemu/numa.h"
+#include "hw/acpi/acpi.h"
+#include "hw/firmware/smbios.h"
+#include "hw/i386/pc.h"
 #include "hw/i386/fw_cfg.h"
+#include "hw/timer/hpet.h"
 #include "hw/nvram/fw_cfg.h"
+#include "e820_memory_layout.h"
+#include "kvm_i386.h"
=20
 const char *fw_cfg_arch_key_name(uint16_t key)
 {
@@ -36,3 +43,133 @@ const char *fw_cfg_arch_key_name(uint16_t key)
     }
     return NULL;
 }
+
+FWCfgState *fw_cfg_arch_create(MachineState *ms,
+                               const CPUArchIdList *cpus,
+                               uint16_t boot_cpus,
+                               uint16_t apic_id_limit)
+{
+    FWCfgState *fw_cfg;
+    uint64_t *numa_fw_cfg;
+    int i;
+
+    fw_cfg =3D fw_cfg_init_io_dma(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
+                                &address_space_memory);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, boot_cpus);
+
+    /*
+     * FW_CFG_MAX_CPUS is a bit confusing/problematic on x86:
+     *
+     * For machine types prior to 1.8, SeaBIOS needs FW_CFG_MAX_CPUS for
+     * building MPTable, ACPI MADT, ACPI CPU hotplug and ACPI SRAT table=
,
+     * that tables are based on xAPIC ID and QEMU<->SeaBIOS interface
+     * for CPU hotplug also uses APIC ID and not "CPU index".
+     * This means that FW_CFG_MAX_CPUS is not the "maximum number of CPU=
s",
+     * but the "limit to the APIC ID values SeaBIOS may see".
+     *
+     * So for compatibility reasons with old BIOSes we are stuck with
+     * "etc/max-cpus" actually being apic_id_limit
+     */
+    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, apic_id_limit);
+    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
+    fw_cfg_add_bytes(fw_cfg, FW_CFG_ACPI_TABLES,
+                     acpi_tables, acpi_tables_len);
+    fw_cfg_add_i32(fw_cfg, FW_CFG_IRQ0_OVERRIDE, kvm_allows_irq0_overrid=
e());
+
+    fw_cfg_add_bytes(fw_cfg, FW_CFG_E820_TABLE,
+                     &e820_reserve, sizeof(e820_reserve));
+    fw_cfg_add_file(fw_cfg, "etc/e820", e820_table,
+                    sizeof(struct e820_entry) * e820_get_num_entries());
+
+    fw_cfg_add_bytes(fw_cfg, FW_CFG_HPET, &hpet_cfg, sizeof(hpet_cfg));
+    /*
+     * allocate memory for the NUMA channel: one (64bit) word for the nu=
mber
+     * of nodes, one word for each VCPU->node and one word for each node=
 to
+     * hold the amount of memory.
+     */
+    numa_fw_cfg =3D g_new0(uint64_t, 1 + apic_id_limit + nb_numa_nodes);
+    numa_fw_cfg[0] =3D cpu_to_le64(nb_numa_nodes);
+    for (i =3D 0; i < cpus->len; i++) {
+        unsigned int apic_id =3D cpus->cpus[i].arch_id;
+        assert(apic_id < apic_id_limit);
+        numa_fw_cfg[apic_id + 1] =3D cpu_to_le64(cpus->cpus[i].props.nod=
e_id);
+    }
+    for (i =3D 0; i < nb_numa_nodes; i++) {
+        numa_fw_cfg[apic_id_limit + 1 + i] =3D
+            cpu_to_le64(numa_info[i].node_mem);
+    }
+    fw_cfg_add_bytes(fw_cfg, FW_CFG_NUMA, numa_fw_cfg,
+                     (1 + apic_id_limit + nb_numa_nodes) *
+                     sizeof(*numa_fw_cfg));
+
+    return fw_cfg;
+}
+
+void fw_cfg_build_smbios(MachineState *ms, FWCfgState *fw_cfg)
+{
+    uint8_t *smbios_tables, *smbios_anchor;
+    size_t smbios_tables_len, smbios_anchor_len;
+    struct smbios_phys_mem_area *mem_array;
+    unsigned i, array_count;
+    X86CPU *cpu =3D X86_CPU(ms->possible_cpus->cpus[0].cpu);
+
+    /* tell smbios about cpuid version and features */
+    smbios_set_cpuid(cpu->env.cpuid_version, cpu->env.features[FEAT_1_ED=
X]);
+
+    smbios_tables =3D smbios_get_table_legacy(&smbios_tables_len);
+    if (smbios_tables) {
+        fw_cfg_add_bytes(fw_cfg, FW_CFG_SMBIOS_ENTRIES,
+                         smbios_tables, smbios_tables_len);
+    }
+
+    /* build the array of physical mem area from e820 table */
+    mem_array =3D g_malloc0(sizeof(*mem_array) * e820_get_num_entries())=
;
+    for (i =3D 0, array_count =3D 0; i < e820_get_num_entries(); i++) {
+        uint64_t addr, len;
+
+        if (e820_get_entry(i, E820_RAM, &addr, &len)) {
+            mem_array[array_count].address =3D addr;
+            mem_array[array_count].length =3D len;
+            array_count++;
+        }
+    }
+    smbios_get_tables(mem_array, array_count,
+                      &smbios_tables, &smbios_tables_len,
+                      &smbios_anchor, &smbios_anchor_len);
+    g_free(mem_array);
+
+    if (smbios_anchor) {
+        fw_cfg_add_file(fw_cfg, "etc/smbios/smbios-tables",
+                        smbios_tables, smbios_tables_len);
+        fw_cfg_add_file(fw_cfg, "etc/smbios/smbios-anchor",
+                        smbios_anchor, smbios_anchor_len);
+    }
+}
+
+void fw_cfg_build_feature_control(MachineState *ms, FWCfgState *fw_cfg)
+{
+    X86CPU *cpu =3D X86_CPU(ms->possible_cpus->cpus[0].cpu);
+    CPUX86State *env =3D &cpu->env;
+    uint32_t unused, ecx, edx;
+    uint64_t feature_control_bits =3D 0;
+    uint64_t *val;
+
+    cpu_x86_cpuid(env, 1, 0, &unused, &unused, &ecx, &edx);
+    if (ecx & CPUID_EXT_VMX) {
+        feature_control_bits |=3D FEATURE_CONTROL_VMXON_ENABLED_OUTSIDE_=
SMX;
+    }
+
+    if ((edx & (CPUID_EXT2_MCE | CPUID_EXT2_MCA)) =3D=3D
+        (CPUID_EXT2_MCE | CPUID_EXT2_MCA) &&
+        (env->mcg_cap & MCG_LMCE_P)) {
+        feature_control_bits |=3D FEATURE_CONTROL_LMCE;
+    }
+
+    if (!feature_control_bits) {
+        return;
+    }
+
+    val =3D g_malloc(sizeof(*val));
+    *val =3D cpu_to_le64(feature_control_bits | FEATURE_CONTROL_LOCKED);
+    fw_cfg_add_file(fw_cfg, "etc/msr_feature_control", val, sizeof(*val)=
);
+}
diff --git a/hw/i386/fw_cfg.h b/hw/i386/fw_cfg.h
index 17a4bc32f2..f9047a74e8 100644
--- a/hw/i386/fw_cfg.h
+++ b/hw/i386/fw_cfg.h
@@ -9,6 +9,7 @@
 #ifndef HW_I386_FW_CFG_H
 #define HW_I386_FW_CFG_H
=20
+#include "hw/boards.h"
 #include "hw/nvram/fw_cfg.h"
=20
 #define FW_CFG_ACPI_TABLES      (FW_CFG_ARCH_LOCAL + 0)
@@ -17,4 +18,11 @@
 #define FW_CFG_E820_TABLE       (FW_CFG_ARCH_LOCAL + 3)
 #define FW_CFG_HPET             (FW_CFG_ARCH_LOCAL + 4)
=20
+FWCfgState *fw_cfg_arch_create(MachineState *ms,
+                               const CPUArchIdList *cpus,
+                               uint16_t boot_cpus,
+                               uint16_t apic_id_limit);
+void fw_cfg_build_smbios(MachineState *ms, FWCfgState *fw_cfg);
+void fw_cfg_build_feature_control(MachineState *ms, FWCfgState *fw_cfg);
+
 #endif
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index d96328d8db..58b60cb538 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -80,6 +80,7 @@
 #include "hw/net/ne2000-isa.h"
 #include "standard-headers/asm-x86/bootparam.h"
 #include "e820_memory_layout.h"
+#include "fw_cfg.h"
=20
 /* debug PC/ISA interrupts */
 //#define DEBUG_IRQ
@@ -890,106 +891,6 @@ static uint32_t x86_cpu_apic_id_from_index(unsigned=
 int cpu_index)
     }
 }
=20
-static void fw_cfg_build_smbios(MachineState *ms, FWCfgState *fw_cfg)
-{
-    uint8_t *smbios_tables, *smbios_anchor;
-    size_t smbios_tables_len, smbios_anchor_len;
-    struct smbios_phys_mem_area *mem_array;
-    unsigned i, array_count;
-    X86CPU *cpu =3D X86_CPU(ms->possible_cpus->cpus[0].cpu);
-
-    /* tell smbios about cpuid version and features */
-    smbios_set_cpuid(cpu->env.cpuid_version, cpu->env.features[FEAT_1_ED=
X]);
-
-    smbios_tables =3D smbios_get_table_legacy(&smbios_tables_len);
-    if (smbios_tables) {
-        fw_cfg_add_bytes(fw_cfg, FW_CFG_SMBIOS_ENTRIES,
-                         smbios_tables, smbios_tables_len);
-    }
-
-    /* build the array of physical mem area from e820 table */
-    mem_array =3D g_malloc0(sizeof(*mem_array) * e820_get_num_entries())=
;
-    for (i =3D 0, array_count =3D 0; i < e820_get_num_entries(); i++) {
-        uint64_t addr, len;
-
-        if (e820_get_entry(i, E820_RAM, &addr, &len)) {
-            mem_array[array_count].address =3D addr;
-            mem_array[array_count].length =3D len;
-            array_count++;
-        }
-    }
-    smbios_get_tables(mem_array, array_count,
-                      &smbios_tables, &smbios_tables_len,
-                      &smbios_anchor, &smbios_anchor_len);
-    g_free(mem_array);
-
-    if (smbios_anchor) {
-        fw_cfg_add_file(fw_cfg, "etc/smbios/smbios-tables",
-                        smbios_tables, smbios_tables_len);
-        fw_cfg_add_file(fw_cfg, "etc/smbios/smbios-anchor",
-                        smbios_anchor, smbios_anchor_len);
-    }
-}
-
-static FWCfgState *fw_cfg_arch_create(MachineState *ms,
-                                      const CPUArchIdList *cpus,
-                                      uint16_t boot_cpus,
-                                      uint16_t apic_id_limit)
-{
-    FWCfgState *fw_cfg;
-    uint64_t *numa_fw_cfg;
-    int i;
-
-    fw_cfg =3D fw_cfg_init_io_dma(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
-                                &address_space_memory);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, boot_cpus);
-
-    /* FW_CFG_MAX_CPUS is a bit confusing/problematic on x86:
-     *
-     * For machine types prior to 1.8, SeaBIOS needs FW_CFG_MAX_CPUS for
-     * building MPTable, ACPI MADT, ACPI CPU hotplug and ACPI SRAT table=
,
-     * that tables are based on xAPIC ID and QEMU<->SeaBIOS interface
-     * for CPU hotplug also uses APIC ID and not "CPU index".
-     * This means that FW_CFG_MAX_CPUS is not the "maximum number of CPU=
s",
-     * but the "limit to the APIC ID values SeaBIOS may see".
-     *
-     * So for compatibility reasons with old BIOSes we are stuck with
-     * "etc/max-cpus" actually being apic_id_limit
-     */
-    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, apic_id_limit);
-    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
-    fw_cfg_add_bytes(fw_cfg, FW_CFG_ACPI_TABLES,
-                     acpi_tables, acpi_tables_len);
-    fw_cfg_add_i32(fw_cfg, FW_CFG_IRQ0_OVERRIDE, kvm_allows_irq0_overrid=
e());
-
-    fw_cfg_add_bytes(fw_cfg, FW_CFG_E820_TABLE,
-                     &e820_reserve, sizeof(e820_reserve));
-    fw_cfg_add_file(fw_cfg, "etc/e820", e820_table,
-                    sizeof(struct e820_entry) * e820_get_num_entries());
-
-    fw_cfg_add_bytes(fw_cfg, FW_CFG_HPET, &hpet_cfg, sizeof(hpet_cfg));
-    /* allocate memory for the NUMA channel: one (64bit) word for the nu=
mber
-     * of nodes, one word for each VCPU->node and one word for each node=
 to
-     * hold the amount of memory.
-     */
-    numa_fw_cfg =3D g_new0(uint64_t, 1 + apic_id_limit + nb_numa_nodes);
-    numa_fw_cfg[0] =3D cpu_to_le64(nb_numa_nodes);
-    for (i =3D 0; i < cpus->len; i++) {
-        unsigned int apic_id =3D cpus->cpus[i].arch_id;
-        assert(apic_id < apic_id_limit);
-        numa_fw_cfg[apic_id + 1] =3D cpu_to_le64(cpus->cpus[i].props.nod=
e_id);
-    }
-    for (i =3D 0; i < nb_numa_nodes; i++) {
-        numa_fw_cfg[apic_id_limit + 1 + i] =3D
-            cpu_to_le64(numa_info[i].node_mem);
-    }
-    fw_cfg_add_bytes(fw_cfg, FW_CFG_NUMA, numa_fw_cfg,
-                     (1 + apic_id_limit + nb_numa_nodes) *
-                     sizeof(*numa_fw_cfg));
-
-    return fw_cfg;
-}
-
 static long get_file_size(FILE *f)
 {
     long where, size;
@@ -1521,35 +1422,6 @@ void pc_cpus_init(PCMachineState *pcms)
     }
 }
=20
-static void fw_cfg_build_feature_control(MachineState *ms,
-                                         FWCfgState *fw_cfg)
-{
-    X86CPU *cpu =3D X86_CPU(ms->possible_cpus->cpus[0].cpu);
-    CPUX86State *env =3D &cpu->env;
-    uint32_t unused, ecx, edx;
-    uint64_t feature_control_bits =3D 0;
-    uint64_t *val;
-
-    cpu_x86_cpuid(env, 1, 0, &unused, &unused, &ecx, &edx);
-    if (ecx & CPUID_EXT_VMX) {
-        feature_control_bits |=3D FEATURE_CONTROL_VMXON_ENABLED_OUTSIDE_=
SMX;
-    }
-
-    if ((edx & (CPUID_EXT2_MCE | CPUID_EXT2_MCA)) =3D=3D
-        (CPUID_EXT2_MCE | CPUID_EXT2_MCA) &&
-        (env->mcg_cap & MCG_LMCE_P)) {
-        feature_control_bits |=3D FEATURE_CONTROL_LMCE;
-    }
-
-    if (!feature_control_bits) {
-        return;
-    }
-
-    val =3D g_malloc(sizeof(*val));
-    *val =3D cpu_to_le64(feature_control_bits | FEATURE_CONTROL_LOCKED);
-    fw_cfg_add_file(fw_cfg, "etc/msr_feature_control", val, sizeof(*val)=
);
-}
-
 static void rtc_set_cpus_count(ISADevice *rtc, uint16_t cpus_count)
 {
     if (cpus_count > 0xff) {
--=20
2.20.1


