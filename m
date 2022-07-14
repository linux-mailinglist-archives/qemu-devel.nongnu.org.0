Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A61575574
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:55:31 +0200 (CEST)
Received: from localhost ([::1]:45764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3zn-0003ND-0W
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oC3aH-0006EF-KR
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:29:10 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:20198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oC3aF-00089Y-91
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:29:09 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26EG79YJ026610;
 Thu, 14 Jul 2022 18:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=jJoSn1HmBEMdNOoauqZixXNzsONSuXugygiibVftDf4=;
 b=IYaiLgFYCXoI0uhPZuVP5NnEgG5WZev7x0tiGXDrcG5N9b5R0hXbvoAKcGB4Vz6E8xZ8
 d+jbjqqFAHaTP2SXpqCHuO75+lysBIys+F2ggedudDG2Lj6PomI7qmgfhfjbh5T8/qNO
 kiheZs4AKpeQefPwcL0zVq4uBhs8F4F8YibyzzO0fU8T4i41Nw8fuj2t84dYwRZtzs27
 oxz9+T143DyQpix3fEtKkQDXpMmQLXORE3IBF5ZQyKclRJQiVX7Y10oxAfJHE+WwZIPd
 +SRBiepkRd9fcdsWn5atr+1waqfWRj29qMsozR7WCqhHOs38YM5dNFN7tTNfQsdOuTgR 3w== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71r1dhxd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jul 2022 18:29:02 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26EIGrMG022615; Thu, 14 Jul 2022 18:29:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h70465jpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jul 2022 18:29:02 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 26EISiAF017868;
 Thu, 14 Jul 2022 18:29:01 GMT
Received: from paddy.uk.oracle.com (dhcp-10-175-172-165.vpn.oracle.com
 [10.175.172.165])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h70465j62-5; Thu, 14 Jul 2022 18:29:01 +0000
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
Subject: [PATCH v7 04/10] i386/pc: factor out above-4g end to an helper
Date: Thu, 14 Jul 2022 19:28:14 +0100
Message-Id: <20220714182820.30970-5-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220714182820.30970-1-joao.m.martins@oracle.com>
References: <20220714182820.30970-1-joao.m.martins@oracle.com>
X-Proofpoint-ORIG-GUID: aLvKWUC8jWlfb7sSU-bBydsoxYnSYNa2
X-Proofpoint-GUID: aLvKWUC8jWlfb7sSU-bBydsoxYnSYNa2
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

There's a couple of places that seem to duplicate this calculation
of RAM size above the 4G boundary. Move all those to a helper function.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/pc.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index e952dc62a12e..216e38da938e 100644
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
@@ -929,7 +933,7 @@ void pc_memory_init(PCMachineState *pcms,
         } else if (pcms->sgx_epc.size != 0) {
             cxl_base = sgx_epc_above_4g_end(&pcms->sgx_epc);
         } else {
-            cxl_base = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
+            cxl_base = pc_above_4g_end(pcms);
         }
 
         e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
@@ -1016,7 +1020,6 @@ uint64_t pc_pci_hole64_start(void)
     PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     MachineState *ms = MACHINE(pcms);
-    X86MachineState *x86ms = X86_MACHINE(pcms);
     uint64_t hole64_start = 0;
 
     if (pcms->cxl_devices_state.host_mr.addr) {
@@ -1034,10 +1037,8 @@ uint64_t pc_pci_hole64_start(void)
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


