Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB76957A48D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 19:05:11 +0200 (CEST)
Received: from localhost ([::1]:39126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDqel-0002YF-04
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 13:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDqax-0005Br-Id
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:01:16 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:6094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDqan-0002eV-Gj
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:01:15 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26JF3rMX030723;
 Tue, 19 Jul 2022 17:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=ltMd7FOwKMcvNpz9VRogcz2UsLz2mj/xTu0K8XqQl50=;
 b=ccn1rSd7MCYITF67oN37ulfJ4TF2iMh5eIhCT/2ABhkBnI9bQXfyin3Me3V86ASj4Jxm
 i/QDyIM4blpQSWbqjRbppVYfzncEtj1puM3i0+0q90bstXJvIJMGt9rJcqa+WDMITDqi
 wkm29GLMcJmi69C+XhCY3Zaz+d+0MO3Y/UbsrrYtlm6c9LAa2x6NUIDcKzZNZKRVoqdo
 k+j7rZmr0Zm+ApIFlvKcifXakvGGGr0DGUaQetkIhYQACWJHrUSa1qxWIjJ50oARnIPJ
 aYkDoTvlkFGYPeva5FoDmKWKrqjay4GVKZyOAb7/UX17XrCTzPgBWtSq9aVR3+kumIcA UQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbkrc71rx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jul 2022 17:01:00 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26JGMvT4009811; Tue, 19 Jul 2022 17:00:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hc1ggpary-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jul 2022 17:00:58 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26JH0i52032177;
 Tue, 19 Jul 2022 17:00:58 GMT
Received: from paddy.uk.oracle.com (dhcp-10-175-221-30.vpn.oracle.com
 [10.175.221.30])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3hc1ggpaer-5; Tue, 19 Jul 2022 17:00:58 +0000
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
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v9 04/11] i386/pc: factor out above-4g end to an helper
Date: Tue, 19 Jul 2022 18:00:07 +0100
Message-Id: <20220719170014.27028-5-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220719170014.27028-1-joao.m.martins@oracle.com>
References: <20220719170014.27028-1-joao.m.martins@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-19_05,2022-07-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=971
 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207190072
X-Proofpoint-GUID: pMI8-R4I1qt3RVyJswCNNC6d4HUzX1W3
X-Proofpoint-ORIG-GUID: pMI8-R4I1qt3RVyJswCNNC6d4HUzX1W3
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

There's a couple of places that seem to duplicate this calculation
of RAM size above the 4G boundary. Move all those to a helper function.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/pc.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index e952dc62a12e..6c898a86cb89 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -814,6 +814,17 @@ void xen_load_linux(PCMachineState *pcms)
 #define PC_ROM_ALIGN       0x800
 #define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
 
+static hwaddr pc_above_4g_end(PCMachineState *pcms)
+{
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+
+    if (pcms->sgx_epc.size != 0) {
+        return sgx_epc_above_4g_end(&pcms->sgx_epc);
+    }
+
+    return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
+}
+
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
@@ -891,15 +902,8 @@ void pc_memory_init(PCMachineState *pcms,
             exit(EXIT_FAILURE);
         }
 
-        if (pcms->sgx_epc.size != 0) {
-            machine->device_memory->base = sgx_epc_above_4g_end(&pcms->sgx_epc);
-        } else {
-            machine->device_memory->base =
-                x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
-        }
-
         machine->device_memory->base =
-            ROUND_UP(machine->device_memory->base, 1 * GiB);
+            ROUND_UP(pc_above_4g_end(pcms), 1 * GiB);
 
         if (pcmc->enforce_aligned_dimm) {
             /* size device region assuming 1G page max alignment per slot */
@@ -926,10 +930,8 @@ void pc_memory_init(PCMachineState *pcms,
         if (pcmc->has_reserved_memory && machine->device_memory->base) {
             cxl_base = machine->device_memory->base
                 + memory_region_size(&machine->device_memory->mr);
-        } else if (pcms->sgx_epc.size != 0) {
-            cxl_base = sgx_epc_above_4g_end(&pcms->sgx_epc);
         } else {
-            cxl_base = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
+            cxl_base = pc_above_4g_end(pcms);
         }
 
         e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
@@ -1016,7 +1018,6 @@ uint64_t pc_pci_hole64_start(void)
     PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     MachineState *ms = MACHINE(pcms);
-    X86MachineState *x86ms = X86_MACHINE(pcms);
     uint64_t hole64_start = 0;
 
     if (pcms->cxl_devices_state.host_mr.addr) {
@@ -1034,10 +1035,8 @@ uint64_t pc_pci_hole64_start(void)
         if (!pcmc->broken_reserved_end) {
             hole64_start += memory_region_size(&ms->device_memory->mr);
         }
-    } else if (pcms->sgx_epc.size != 0) {
-            hole64_start = sgx_epc_above_4g_end(&pcms->sgx_epc);
     } else {
-        hole64_start = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
+        hole64_start = pc_above_4g_end(pcms);
     }
 
     return ROUND_UP(hole64_start, 1 * GiB);
-- 
2.17.2


