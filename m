Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E69681B055
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 08:28:49 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51857 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQ4S9-0001mc-5N
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 02:28:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hQ4K3-0003Dj-6L
	for qemu-devel@nongnu.org; Mon, 13 May 2019 02:20:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hQ4K2-0004gh-6d
	for qemu-devel@nongnu.org; Mon, 13 May 2019 02:20:27 -0400
Received: from mga07.intel.com ([134.134.136.100]:24552)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hQ4K1-0004ds-Uz
	for qemu-devel@nongnu.org; Mon, 13 May 2019 02:20:26 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 May 2019 23:20:25 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga003.jf.intel.com with ESMTP; 12 May 2019 23:20:23 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2019 14:19:07 +0800
Message-Id: <20190513061913.9284-4-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190513061913.9284-1-richardw.yang@linux.intel.com>
References: <20190513061913.9284-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.100
Subject: [Qemu-devel] [RFC PATCH 3/9] hw/acpi: implement
 madt_sub[ACPI_APIC_LOCAL_X2APIC]
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, ehabkost@redhat.com, mst@redhat.com,
	Wei Yang <richardw.yang@linux.intel.com>, pbonzini@redhat.com,
	imammedo@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 hw/acpi/cpu.c        | 14 ++------------
 hw/i386/acpi-build.c | 33 +++++++++++++++++++++------------
 2 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 35e57f9824..cb5970d659 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -529,18 +529,8 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
                 assert(adevc->madt_sub[ACPI_APIC_PROCESSOR]);
                 adevc->madt_sub[ACPI_APIC_PROCESSOR](madt_buf, &processor_id);
             } else {
-                AcpiMadtProcessorX2Apic *apic = acpi_data_push(madt_buf,
-                                                               sizeof *apic);
-
-                apic->type = ACPI_APIC_LOCAL_X2APIC;
-                apic->length = sizeof(*apic);
-                apic->uid = cpu_to_le32(i);
-                apic->x2apic_id = cpu_to_le32(apic_id);
-                if (arch_ids->cpus[i].cpu != NULL) {
-                    apic->flags = cpu_to_le32(1);
-                } else {
-                    apic->flags = cpu_to_le32(0);
-                }
+                adevc->madt_sub[ACPI_APIC_LOCAL_X2APIC](madt_buf,
+                                                        &processor_id);
             }
             switch (madt_buf->data[0]) {
             case ACPI_APIC_PROCESSOR: {
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index dfcdcaeaf7..4b480efff9 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -320,8 +320,28 @@ static void pc_madt_apic_entry(GArray *entry, void *opaque)
     }
 }
 
+static void pc_madt_x2apic_entry(GArray *entry, void *opaque)
+{
+    MachineState *machine = MACHINE(qdev_get_machine());
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
+    const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(machine);
+    int *processor_id = opaque;
+    AcpiMadtProcessorX2Apic *apic = acpi_data_push(entry, sizeof *apic);
+
+    apic->type = ACPI_APIC_LOCAL_X2APIC;
+    apic->length = sizeof(*apic);
+    apic->uid = cpu_to_le32(*processor_id);
+    apic->x2apic_id = cpu_to_le32(apic_ids->cpus[*processor_id].arch_id);
+    if (apic_ids->cpus[*processor_id].cpu != NULL) {
+        apic->flags = cpu_to_le32(1);
+    } else {
+        apic->flags = cpu_to_le32(0);
+    }
+}
+
 madt_operations i386_madt_sub = {
     [ACPI_APIC_PROCESSOR] = pc_madt_apic_entry,
+    [ACPI_APIC_LOCAL_X2APIC] = pc_madt_x2apic_entry,
 };
 
 static void
@@ -349,18 +369,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, PCMachineState *pcms)
         if (apic_id < 255) {
             adevc->madt_sub[ACPI_APIC_PROCESSOR](table_data, &processor_id);
         } else {
-            AcpiMadtProcessorX2Apic *apic = acpi_data_push(table_data,
-                                                           sizeof *apic);
-
-            apic->type = ACPI_APIC_LOCAL_X2APIC;
-            apic->length = sizeof(*apic);
-            apic->uid = cpu_to_le32(i);
-            apic->x2apic_id = cpu_to_le32(apic_id);
-            if (apic_ids->cpus[i].cpu != NULL) {
-                apic->flags = cpu_to_le32(1);
-            } else {
-                apic->flags = cpu_to_le32(0);
-            }
+            adevc->madt_sub[ACPI_APIC_LOCAL_X2APIC](table_data, &processor_id);
         }
         if (apic_id > 254) {
             x2apic_mode = true;
-- 
2.19.1


