Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5217324C5E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 10:02:11 +0100 (CET)
Received: from localhost ([::1]:33552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFCXC-00046j-T5
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 04:02:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFCSH-0007bg-MD; Thu, 25 Feb 2021 03:57:05 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:3050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFCSE-0003tv-Nx; Thu, 25 Feb 2021 03:57:05 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DmRT03bFFzjRGS;
 Thu, 25 Feb 2021 16:55:32 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0; Thu, 25 Feb 2021
 16:56:42 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 3/5] hw/arm/virt-acpi-build: distinguish possible and
 present cpus
Date: Thu, 25 Feb 2021 16:56:25 +0800
Message-ID: <20210225085627.2263-4-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20210225085627.2263-1-fangying1@huawei.com>
References: <20210225085627.2263-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=fangying1@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, salil.mehta@huawei.com,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building ACPI tables regarding CPUs we should always build
them for the number of possible CPUs, not the number of present
CPUs. We then ensure only the present CPUs are enabled in madt.
Furthermore, it is also needed if we are going to support CPU
hotplug in the future.

This patch is a rework based on Andrew Jones's contribution at
https://lists.gnu.org/archive/html/qemu-arm/2018-07/msg00076.html

Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/arm/virt-acpi-build.c | 14 ++++++++++----
 hw/arm/virt.c            |  2 ++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f9c9df916c..bb91152fe2 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -61,13 +61,16 @@
 
 static void acpi_dsdt_add_cpus(Aml *scope, VirtMachineState *vms)
 {
-    MachineState *ms = MACHINE(vms);
+    CPUArchIdList *possible_cpus = MACHINE(vms)->possible_cpus;
     uint16_t i;
 
-    for (i = 0; i < ms->smp.cpus; i++) {
+    for (i = 0; i < possible_cpus->len; i++) {
         Aml *dev = aml_device("C%.03X", i);
         aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
         aml_append(dev, aml_name_decl("_UID", aml_int(i)));
+        if (possible_cpus->cpus[i].cpu == NULL) {
+            aml_append(dev, aml_name_decl("_STA", aml_int(0)));
+        }
         aml_append(scope, dev);
     }
 }
@@ -479,6 +482,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     const int *irqmap = vms->irqmap;
     AcpiMadtGenericDistributor *gicd;
     AcpiMadtGenericMsiFrame *gic_msi;
+    CPUArchIdList *possible_cpus = MACHINE(vms)->possible_cpus;
     int i;
 
     acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
@@ -489,7 +493,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
     gicd->version = vms->gic_version;
 
-    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
+    for (i = 0; i < possible_cpus->len; i++) {
         AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
                                                            sizeof(*gicc));
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
@@ -504,7 +508,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         gicc->cpu_interface_number = cpu_to_le32(i);
         gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
         gicc->uid = cpu_to_le32(i);
-        gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
+        if (possible_cpus->cpus[i].cpu != NULL) {
+            gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
+        }
 
         if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
             gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c133b342b8..75659502e2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2047,6 +2047,8 @@ static void machvirt_init(MachineState *machine)
 
         qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
         object_unref(cpuobj);
+        /* Initialize cpu member here since cpu hotplug is not supported yet */
+        machine->possible_cpus->cpus[n].cpu = cpuobj;
     }
     fdt_add_timer_nodes(vms);
     fdt_add_cpu_nodes(vms);
-- 
2.23.0


