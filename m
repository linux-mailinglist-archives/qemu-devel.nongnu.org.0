Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237355637CD
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 18:24:52 +0200 (CEST)
Received: from localhost ([::1]:43942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7JRr-0005hT-8H
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 12:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o7JEr-0000rL-W7
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:11:26 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o7JEq-0002qT-1V
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:11:25 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 261G2upv002374;
 Fri, 1 Jul 2022 16:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=Kw2G9dR6MvexJfZ1dxN18sQdQ7xLSnJUnZkiTP0mJLA=;
 b=rommBto96/W2A2qDPR/RwI/ZOG2yABMC0tYhoLir/WjOVMLIgGa/VYHDHi7rMkEeVZrZ
 MERAeOQm+795mWo0L0eUqhSGnVhdGt4fpGpQAuznuhLwb2UCezgF0K9yfb5Oa5fBbV9Z
 t3aGGKO+DT50tBXiISe0IRfpYdBjG/iAwaA6aLyUankflyYIlaP7s90u0HbX01lHif7E
 nBka8CmOnCMp7D4KaumN7sPlI9u/otL0/i7XmPjB5BMm4xXhMQqTJxvJKNZ7hYGjSGlB
 HNoIcz7PoDrEiLhnIpXPCmhr2HJEyjE205uMhpJrTL7rnA8Eo9qj9swfx1+s4TZPWCa2 WA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gwrscq9hp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Jul 2022 16:11:14 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 261G5jU3016287; Fri, 1 Jul 2022 16:11:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gwrt4swa2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Jul 2022 16:11:13 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 261GAftS029065;
 Fri, 1 Jul 2022 16:11:13 GMT
Received: from paddy.uk.oracle.com (dhcp-10-175-184-247.vpn.oracle.com
 [10.175.184.247])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gwrt4svtm-9; Fri, 01 Jul 2022 16:11:13 +0000
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
Subject: [PATCH v6 08/10] i386/pc: factor out device_memory base/size to helper
Date: Fri,  1 Jul 2022 17:10:12 +0100
Message-Id: <20220701161014.3850-9-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220701161014.3850-1-joao.m.martins@oracle.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
X-Proofpoint-ORIG-GUID: YrdSaC9PFo6ygvktI0jrY7XT4p78QqkU
X-Proofpoint-GUID: YrdSaC9PFo6ygvktI0jrY7XT4p78QqkU
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Move obtaining hole64_start from device_memory MR base/size into an helper
alongside correspondent getters in pc_memory_init() when the hotplug
range is unitialized.

This is the final step that allows pc_pci_hole64_start() to be callable
at the beginning of pc_memory_init() before any MRs are initialized.

Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c | 55 +++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 14 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index d6dff71012ab..a79fa1b6beeb 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -825,16 +825,48 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
     return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
 }
 
+static void pc_get_device_memory_range(PCMachineState *pcms,
+                                       hwaddr *base,
+                                       ram_addr_t *device_mem_size)
+{
+    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
+    MachineState *machine = MACHINE(pcms);
+    ram_addr_t size;
+    hwaddr addr;
+
+    if (pcmc->has_reserved_memory &&
+        machine->device_memory && machine->device_memory->base) {
+        *base = machine->device_memory->base;
+        *device_mem_size = memory_region_size(&machine->device_memory->mr);
+        return;
+    }
+
+    /* handles uninitialized @device_memory MR */
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
 static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
 {
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     MachineState *machine = MACHINE(pcms);
     hwaddr cxl_base;
+    ram_addr_t size;
 
-    if (pcmc->has_reserved_memory && machine->device_memory->base) {
-        cxl_base = machine->device_memory->base;
+    if (pcmc->has_reserved_memory &&
+        machine->device_memory && machine->device_memory->base) {
+        pc_get_device_memory_range(pcms, &cxl_base, &size);
         if (!pcmc->broken_reserved_end) {
-            cxl_base += memory_region_size(&machine->device_memory->mr);
+            cxl_base += size;
         }
     } else {
         cxl_base = pc_above_4g_end(pcms);
@@ -937,7 +969,7 @@ void pc_memory_init(PCMachineState *pcms,
     /* initialize device memory address space */
     if (pcmc->has_reserved_memory &&
         (machine->ram_size < machine->maxram_size)) {
-        ram_addr_t device_mem_size = machine->maxram_size - machine->ram_size;
+        ram_addr_t device_mem_size;
 
         if (machine->ram_slots > ACPI_MAX_RAM_SLOTS) {
             error_report("unsupported amount of memory slots: %"PRIu64,
@@ -952,13 +984,7 @@ void pc_memory_init(PCMachineState *pcms,
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
@@ -1063,13 +1089,14 @@ uint64_t pc_pci_hole64_start(void)
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


