Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8BB5765B4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 19:19:27 +0200 (CEST)
Received: from localhost ([::1]:41680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCOyM-0005cm-L1
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 13:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oCOwT-0001Wa-8c
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:17:29 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:60392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oCOwR-0005gB-9V
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:17:28 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26FGIqXm016580;
 Fri, 15 Jul 2022 17:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=FIBpiDX4j9bmOfAGrzs/qcReNbLF1JTIooWk6DwGGY0=;
 b=QR9Tu2S7PqfX8cBUMywLlqnPseUTfE/zYBQsX6Gjm3/Ug1Z6Af2yP7KxuGyNKBHqzIK6
 8sMR2qnZ7JJbQUMLdsG7QORsJW3eAuUTi0Z0w+o41aMnWH9NSoDm89wGLbXgeeXQRTup
 1FKa4CT1X+Mi0VFCYyV3FwNhGqmOsu02AkTwxbRBZdbrdg8Y/cVrW/Lbqzt6D++SF7Fs
 0T6/GvfDQu1vXDOSjgZb4Qg62aYzOrmhrpeqzoEMGCf4mcFLfz1bzttIvaq3QUvO/U2S
 VPU4C+Fxui46DbjKwJjTWILGiBQlf9amTpSwp8TVdjg0ypg4zDzb5RAyNpLGlaPttQ2m Vw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71sgyscb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jul 2022 17:17:18 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26FHBiUL039747; Fri, 15 Jul 2022 17:17:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h7047u08u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jul 2022 17:17:17 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 26FHGjMB013789;
 Fri, 15 Jul 2022 17:17:17 GMT
Received: from paddy.uk.oracle.com (dhcp-10-175-181-254.vpn.oracle.com
 [10.175.181.254])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h7047tyn7-9; Fri, 15 Jul 2022 17:17:17 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v8 08/11] i386/pc: factor out device_memory base/size to helper
Date: Fri, 15 Jul 2022 18:16:25 +0100
Message-Id: <20220715171628.21437-9-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220715171628.21437-1-joao.m.martins@oracle.com>
References: <20220715171628.21437-1-joao.m.martins@oracle.com>
X-Proofpoint-GUID: w_hWTw9prErpAD_2dgiteg6ORgsyKDeL
X-Proofpoint-ORIG-GUID: w_hWTw9prErpAD_2dgiteg6ORgsyKDeL
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move obtaining hole64_start from device_memory memory region base/size
into an helper alongside correspondent getters in pc_memory_init() when
the hotplug range is unitialized. While doing that remove the memory
region based logic from this newly added helper.

This is the final step that allows pc_pci_hole64_start() to be callable
at the beginning of pc_memory_init() before any memory regions are
initialized.

Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c | 47 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c654be6cf0bd..cda435e3baeb 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -825,15 +825,37 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
     return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
 }
 
-static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
+static void pc_get_device_memory_range(PCMachineState *pcms,
+                                       hwaddr *base,
+                                       ram_addr_t *device_mem_size)
 {
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     MachineState *machine = MACHINE(pcms);
+    ram_addr_t size;
+    hwaddr addr;
+
+    size = machine->maxram_size - machine->ram_size;
+    addr = ROUND_UP(pc_above_4g_end(pcms), 1 * GiB);
+
+    if (pcmc->enforce_aligned_dimm) {
+        /* size device region assuming 1G page max alignment per slot */
+        size += (1 * GiB) * machine->ram_slots;
+    }
+
+    *base = addr;
+    *device_mem_size = size;
+}
+
+
+static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
+{
+    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     hwaddr cxl_base;
+    ram_addr_t size;
 
-    if (pcmc->has_reserved_memory && machine->device_memory->base) {
-        cxl_base = machine->device_memory->base
-            + memory_region_size(&machine->device_memory->mr);
+    if (pcmc->has_reserved_memory) {
+        pc_get_device_memory_range(pcms, &cxl_base, &size);
+        cxl_base += size;
     } else {
         cxl_base = pc_above_4g_end(pcms);
     }
@@ -920,7 +942,7 @@ void pc_memory_init(PCMachineState *pcms,
     /* initialize device memory address space */
     if (pcmc->has_reserved_memory &&
         (machine->ram_size < machine->maxram_size)) {
-        ram_addr_t device_mem_size = machine->maxram_size - machine->ram_size;
+        ram_addr_t device_mem_size;
 
         if (machine->ram_slots > ACPI_MAX_RAM_SLOTS) {
             error_report("unsupported amount of memory slots: %"PRIu64,
@@ -935,13 +957,7 @@ void pc_memory_init(PCMachineState *pcms,
             exit(EXIT_FAILURE);
         }
 
-        machine->device_memory->base =
-            ROUND_UP(pc_above_4g_end(pcms), 1 * GiB);
-
-        if (pcmc->enforce_aligned_dimm) {
-            /* size device region assuming 1G page max alignment per slot */
-            device_mem_size += (1 * GiB) * machine->ram_slots;
-        }
+        pc_get_device_memory_range(pcms, &machine->device_memory->base, &device_mem_size);
 
         if ((machine->device_memory->base + device_mem_size) <
             device_mem_size) {
@@ -1046,13 +1062,14 @@ uint64_t pc_pci_hole64_start(void)
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     MachineState *ms = MACHINE(pcms);
     uint64_t hole64_start = 0;
+    ram_addr_t size = 0;
 
     if (pcms->cxl_devices_state.is_enabled) {
         hole64_start = pc_get_cxl_range_end(pcms);
-    } else if (pcmc->has_reserved_memory && ms->device_memory->base) {
-        hole64_start = ms->device_memory->base;
+    } else if (pcmc->has_reserved_memory && (ms->ram_size < ms->maxram_size)) {
+        pc_get_device_memory_range(pcms, &hole64_start, &size);
         if (!pcmc->broken_reserved_end) {
-            hole64_start += memory_region_size(&ms->device_memory->mr);
+            hole64_start += size;
         }
     } else {
         hole64_start = pc_above_4g_end(pcms);
-- 
2.17.2


