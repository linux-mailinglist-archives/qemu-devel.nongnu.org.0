Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883AF57A51F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 19:23:28 +0200 (CEST)
Received: from localhost ([::1]:52744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDqwR-0007Y2-P4
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 13:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDqbM-0005KE-63
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:01:46 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:7974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDqbF-0002ik-TN
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:01:35 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26JGgXU3017922;
 Tue, 19 Jul 2022 17:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=Q3b47PaSBsri9Vncrn/aVZOhyuduZXp2ozKH7IkufOE=;
 b=Z9XLNZJ6QSz2VuOKqj12Oj3YhJWByEzoV0u0syimIndvpdZJeWL4/gmZ8Lwb53T6hAzI
 cPdkZQad/kD4VWswC5oWV6WGvO3r+esvWyy8v0RSS9irOzXK5l1LbgVytWFidIIkEbXa
 Ro2tr2E/l+Ik2SxURDTsHd4QfGuse+yAvpcXTcGPpMaWAw0U/sPcjE7fIW719xyzxqpI
 a7D87oKju3Bf5Pmz42/PPEViALycaiQTtvSYg2YMW+yS5LVE6/apAPXsf/68MJLBBXwV
 2g5esujFoRIgga/FMMZVFUw3BempXk6fBHR9PT5+so58je4p0/srYlMi2YRof+fkjgeI kQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbkx0y7pu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jul 2022 17:01:14 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26JGgccE009824; Tue, 19 Jul 2022 17:01:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hc1ggpb1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jul 2022 17:01:13 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26JH0i5A032177;
 Tue, 19 Jul 2022 17:01:12 GMT
Received: from paddy.uk.oracle.com (dhcp-10-175-221-30.vpn.oracle.com
 [10.175.221.30])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3hc1ggpaer-9; Tue, 19 Jul 2022 17:01:12 +0000
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
Subject: [PATCH v9 08/11] i386/pc: factor out device_memory base/size to helper
Date: Tue, 19 Jul 2022 18:00:11 +0100
Message-Id: <20220719170014.27028-9-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220719170014.27028-1-joao.m.martins@oracle.com>
References: <20220719170014.27028-1-joao.m.martins@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-19_05,2022-07-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207190072
X-Proofpoint-GUID: UWxq6CUYxLY5bq9Cn20gUJeosF63h8J6
X-Proofpoint-ORIG-GUID: UWxq6CUYxLY5bq9Cn20gUJeosF63h8J6
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
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/pc.c | 46 +++++++++++++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c654be6cf0bd..4ebc45773c29 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -825,15 +825,36 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
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
@@ -920,7 +941,7 @@ void pc_memory_init(PCMachineState *pcms,
     /* initialize device memory address space */
     if (pcmc->has_reserved_memory &&
         (machine->ram_size < machine->maxram_size)) {
-        ram_addr_t device_mem_size = machine->maxram_size - machine->ram_size;
+        ram_addr_t device_mem_size;
 
         if (machine->ram_slots > ACPI_MAX_RAM_SLOTS) {
             error_report("unsupported amount of memory slots: %"PRIu64,
@@ -935,13 +956,7 @@ void pc_memory_init(PCMachineState *pcms,
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
@@ -1046,13 +1061,14 @@ uint64_t pc_pci_hole64_start(void)
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


