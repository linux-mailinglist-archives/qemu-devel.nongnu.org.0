Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B14B575551
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:48:29 +0200 (CEST)
Received: from localhost ([::1]:53176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3sy-0005W2-Fj
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oC3aD-0006DO-Mt
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:29:07 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:59698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oC3a4-00086W-6E
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:29:01 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26EFs7Bt000894;
 Thu, 14 Jul 2022 18:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=sq9FFb5aE+/IiMlVeguENCUMCQ8VCOnFTO/apdVoO2I=;
 b=rLB/ShGxQXRZ7zWHaoPSescBYLerVqn8gdjIr5YXncpELx6EikGRilKtbKECPXDl77UX
 OHA5Q8ASagYNK1lxlNec3+P3A6mCMEQwM44oHRrQ1ZAIO/MaBcyC2W/8/MD0X8uvUe7/
 2yPBjJ61TGQsZHOmJDObu5mFbu21MsCau7t95zGjvO0UEfaomgztIOs2fdKuqg6+d02C
 mtRnUIw03PeBdvgXHf3nIOZtxmvdYaUgX8TzUdl8JZP3BEjVcHkzGLDuXZb/nT3SkuwI
 hgRDYvUKQOWAAYW5R2VVDojfT+GtF/6canx0twGrn0H3UAggt5hwje12YfCJr8ehO/ml Rw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71xrp10a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jul 2022 18:28:49 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26EIGrM8022615; Thu, 14 Jul 2022 18:28:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h70465jbj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jul 2022 18:28:48 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 26EISiA9017868;
 Thu, 14 Jul 2022 18:28:48 GMT
Received: from paddy.uk.oracle.com (dhcp-10-175-172-165.vpn.oracle.com
 [10.175.172.165])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h70465j62-2; Thu, 14 Jul 2022 18:28:47 +0000
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
Subject: [PATCH v7 01/10] hw/i386: add 4g boundary start to X86MachineState
Date: Thu, 14 Jul 2022 19:28:11 +0100
Message-Id: <20220714182820.30970-2-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220714182820.30970-1-joao.m.martins@oracle.com>
References: <20220714182820.30970-1-joao.m.martins@oracle.com>
X-Proofpoint-GUID: oXm1b7mXJPFVfnKMIJU8NoEn8sKbz3UH
X-Proofpoint-ORIG-GUID: oXm1b7mXJPFVfnKMIJU8NoEn8sKbz3UH
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Rather than hardcoding the 4G boundary everywhere, introduce a
X86MachineState field @above_4g_mem_start and use it
accordingly.

This is in preparation for relocating ram-above-4g to be
dynamically start at 1T on AMD platforms.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c  |  2 +-
 hw/i386/pc.c          | 11 ++++++-----
 hw/i386/sgx.c         |  2 +-
 hw/i386/x86.c         |  1 +
 include/hw/i386/x86.h |  3 +++
 5 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index cad6f5ac41e9..0355bd3ddaad 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2024,7 +2024,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
                 build_srat_memory(table_data, mem_base, mem_len, i - 1,
                                   MEM_AFFINITY_ENABLED);
             }
-            mem_base = 1ULL << 32;
+            mem_base = x86ms->above_4g_mem_start;
             mem_len = next_base - x86ms->below_4g_mem_size;
             next_base = mem_base + mem_len;
         }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8d68295fdaff..1660684d12fd 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -850,9 +850,10 @@ void pc_memory_init(PCMachineState *pcms,
                                  machine->ram,
                                  x86ms->below_4g_mem_size,
                                  x86ms->above_4g_mem_size);
-        memory_region_add_subregion(system_memory, 0x100000000ULL,
+        memory_region_add_subregion(system_memory, x86ms->above_4g_mem_start,
                                     ram_above_4g);
-        e820_add_entry(0x100000000ULL, x86ms->above_4g_mem_size, E820_RAM);
+        e820_add_entry(x86ms->above_4g_mem_start, x86ms->above_4g_mem_size,
+                       E820_RAM);
     }
 
     if (pcms->sgx_epc.size != 0) {
@@ -893,7 +894,7 @@ void pc_memory_init(PCMachineState *pcms,
             machine->device_memory->base = sgx_epc_above_4g_end(&pcms->sgx_epc);
         } else {
             machine->device_memory->base =
-                0x100000000ULL + x86ms->above_4g_mem_size;
+                x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
         }
 
         machine->device_memory->base =
@@ -927,7 +928,7 @@ void pc_memory_init(PCMachineState *pcms,
         } else if (pcms->sgx_epc.size != 0) {
             cxl_base = sgx_epc_above_4g_end(&pcms->sgx_epc);
         } else {
-            cxl_base = 0x100000000ULL + x86ms->above_4g_mem_size;
+            cxl_base = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
         }
 
         e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
@@ -1035,7 +1036,7 @@ uint64_t pc_pci_hole64_start(void)
     } else if (pcms->sgx_epc.size != 0) {
             hole64_start = sgx_epc_above_4g_end(&pcms->sgx_epc);
     } else {
-        hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
+        hole64_start = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
     }
 
     return ROUND_UP(hole64_start, 1 * GiB);
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index a44d66ba2afc..09d9c7c73d9f 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -295,7 +295,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
         return;
     }
 
-    sgx_epc->base = 0x100000000ULL + x86ms->above_4g_mem_size;
+    sgx_epc->base = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
 
     memory_region_init(&sgx_epc->mr, OBJECT(pcms), "sgx-epc", UINT64_MAX);
     memory_region_add_subregion(get_system_memory(), sgx_epc->base,
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 6003b4b2dfea..029264c54fe2 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1373,6 +1373,7 @@ static void x86_machine_initfn(Object *obj)
     x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
     x86ms->bus_lock_ratelimit = 0;
+    x86ms->above_4g_mem_start = 4 * GiB;
 }
 
 static void x86_machine_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 9089bdd99c3a..df82c5fd4252 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -56,6 +56,9 @@ struct X86MachineState {
     /* RAM information (sizes, addresses, configuration): */
     ram_addr_t below_4g_mem_size, above_4g_mem_size;
 
+    /* Start address of the initial RAM above 4G */
+    uint64_t above_4g_mem_start;
+
     /* CPU and apic information: */
     bool apic_xrupt_override;
     unsigned pci_irq_mask;
-- 
2.17.2


