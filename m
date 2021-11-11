Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ABB44CF4C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 02:54:44 +0100 (CET)
Received: from localhost ([::1]:43408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkzIZ-0002YK-Nd
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 20:54:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mkz11-0006dm-6O
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:36:36 -0500
Received: from mail.loongson.cn ([114.242.206.163]:54402 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mkz0x-0001tK-LH
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:36:34 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9Ngc4xh9RMCAA--.4955S31; 
 Thu, 11 Nov 2021 09:36:18 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 29/30] hw/loongarch: Add machine->possible_cpus
Date: Thu, 11 Nov 2021 09:35:27 +0800
Message-Id: <1636594528-8175-30-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Dxr9Ngc4xh9RMCAA--.4955S31
X-Coremail-Antispam: 1UD129KBjvJXoWxKFW8Jw17XFy5Xr15CrW7Arb_yoW7tF1kpw
 4jvay0qrsrWr1fCwsxGwnrWF1rtrs7Gw13XanrKrsYkF1kK348JrWvy3sIyFs7Gw1kXF1D
 ur48ta13WFW7AFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use possible_cpus for storing possible topology info

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/acpi-build.c    | 16 ++++++++++------
 hw/loongarch/ls3a5000_virt.c | 35 ++++++++++++++++++++++++++++++++++-
 2 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
index fda4d55f2e..5f1d4070d8 100644
--- a/hw/loongarch/acpi-build.c
+++ b/hw/loongarch/acpi-build.c
@@ -107,7 +107,8 @@ build_facs(GArray *table_data)
 static void
 build_madt(GArray *table_data, BIOSLinker *linker, LoongArchMachineState *lams)
 {
-    MachineState *ms = MACHINE(lams);
+    MachineClass *mc = MACHINE_GET_CLASS(lams);
+    const CPUArchIdList *core_ids = mc->possible_cpu_arch_ids(MACHINE(lams));
     int i;
     AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = lams->oem_id,
                         .oem_table_id = lams->oem_table_id };
@@ -118,13 +119,14 @@ build_madt(GArray *table_data, BIOSLinker *linker, LoongArchMachineState *lams)
     build_append_int_noprefix(table_data, 0, 4);
     build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */, 4); /* Flags */
 
-    for (i = 0; i < ms->smp.cpus; i++) {
+    for (i = 0; i < core_ids->len; i++) {
+        uint32_t core_id = core_ids->cpus[i].arch_id;
         /* Rev 1.0b, Table 5-13 Processor Core Interrupt Controller Structure */
         build_append_int_noprefix(table_data, 17, 1);       /* Type */
         build_append_int_noprefix(table_data, 15, 1);       /* Length */
         build_append_int_noprefix(table_data, 1, 1);       /* Version */
         build_append_int_noprefix(table_data, i + 1, 4);     /* ACPI Processor ID */
-        build_append_int_noprefix(table_data, i, 4); /* Core ID */
+        build_append_int_noprefix(table_data, core_id, 4); /* Core ID */
         build_append_int_noprefix(table_data, 1, 4); /* Flags */
     }
 
@@ -164,8 +166,9 @@ static void
 build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
 {
     uint64_t i, mem_len, mem_base;
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
     LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
-    MachineState *ms = MACHINE(lams);
+    const CPUArchIdList *core_ids = mc->possible_cpu_arch_ids(machine);
     AcpiTable table = { .sig = "SRAT", .rev = 1, .oem_id = lams->oem_id,
                         .oem_table_id = lams->oem_table_id };
 
@@ -173,13 +176,14 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     build_append_int_noprefix(table_data, 1, 4); /* Reserved */
     build_append_int_noprefix(table_data, 0, 8); /* Reserved */
 
-    for (i = 0; i < ms->smp.cpus; ++i) {
+    for (i = 0; i < core_ids->len; ++i) {
+        uint32_t core_id = cpu_to_le32(core_ids->cpus[i].arch_id);
         /* 5.2.15.1 Processor Local APIC/SAPIC Affinity Structure */
         build_append_int_noprefix(table_data, 0, 1);  /* Type  */
         build_append_int_noprefix(table_data, 16, 1); /* Length */
         /* Proximity Domain [7:0] */
         build_append_int_noprefix(table_data, 0, 1);
-        build_append_int_noprefix(table_data, i, 1); /* APIC ID */
+        build_append_int_noprefix(table_data, core_id, 1); /* APIC ID */
         /* Flags, Table 5-36 */
         build_append_int_noprefix(table_data, 1, 4);
         build_append_int_noprefix(table_data, 0, 1); /* Local SAPIC EID */
diff --git a/hw/loongarch/ls3a5000_virt.c b/hw/loongarch/ls3a5000_virt.c
index 35222f70a4..768af074f4 100644
--- a/hw/loongarch/ls3a5000_virt.c
+++ b/hw/loongarch/ls3a5000_virt.c
@@ -331,6 +331,8 @@ static void ls3a5000_virt_init(MachineState *machine)
     MemoryRegion *bios = g_new(MemoryRegion, 1);
     ram_addr_t offset = 0;
     DeviceState *pch_pic;
+    const CPUArchIdList *possible_cpus;
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
 
     if (!cpu_model) {
         cpu_model = LOONGARCH_CPU_TYPE_NAME("Loongson-3A5000");
@@ -346,15 +348,20 @@ static void ls3a5000_virt_init(MachineState *machine)
     address_space_init(lams->address_space_iocsr, lams->system_iocsr, "IOCSR");
 
     /* Init CPUs */
+    possible_cpus = mc->possible_cpu_arch_ids(machine);
     for (i = 0; i < machine->smp.cpus; i++) {
         Object *cpuobj = NULL;
         CPUState *cs;
 
-        cpuobj = object_new(machine->cpu_type);
+        cpuobj = object_new(possible_cpus->cpus[i].type);
+        object_property_set_uint(cpuobj, "id",
+                                 possible_cpus->cpus[i].arch_id, NULL);
 
         cs = CPU(cpuobj);
         cs->cpu_index = i;
 
+        machine->possible_cpus->cpus[i].cpu = cpuobj;
+
         qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
         object_unref(cpuobj);
 
@@ -497,12 +504,38 @@ static void loongarch_machine_initfn(Object *obj)
     lams->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
 }
 
+static const CPUArchIdList *loongarch_possible_cpu_arch_ids(MachineState *ms)
+{
+    int i;
+    unsigned int max_cpus = ms->smp.max_cpus;
+
+    if (ms->possible_cpus) {
+        /*
+         * make sure that max_cpus hasn't changed since the first use, i.e.
+         * -smp hasn't been parsed after it
+         */
+        assert(ms->possible_cpus->len == max_cpus);
+        return ms->possible_cpus;
+    }
+
+    ms->possible_cpus = g_malloc0(sizeof(CPUArchIdList) +
+                                  sizeof(CPUArchId) * max_cpus);
+    ms->possible_cpus->len = max_cpus;
+    for (i = 0; i < ms->possible_cpus->len; i++) {
+            ms->possible_cpus->cpus[i].type = ms->cpu_type;
+            ms->possible_cpus->cpus[i].vcpus_count = 1;
+            ms->possible_cpus->cpus[i].arch_id = i;
+    }
+    return ms->possible_cpus;
+}
+
 static void loongarch_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Loongson-5000 LS7A1000 machine";
     mc->init = ls3a5000_virt_init;
+    mc->possible_cpu_arch_ids = loongarch_possible_cpu_arch_ids;
     mc->default_ram_size = 1 * GiB;
     mc->default_cpu_type = LOONGARCH_CPU_TYPE_NAME("Loongson-3A5000");
     mc->default_ram_id = "loongarch.ram";
-- 
2.27.0


