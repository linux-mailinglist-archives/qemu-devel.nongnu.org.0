Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7592F57A50E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 19:20:59 +0200 (CEST)
Received: from localhost ([::1]:44526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDqu2-00014o-Ma
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 13:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDqbM-0005KA-5Y
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:01:46 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:41296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDqb6-0002hm-UQ
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:01:27 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26JGpd54031787;
 Tue, 19 Jul 2022 17:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=Hs2b3CMhV9+uRCp6mbAoXfq/inyNOxMjoO4PWPYgQ/Q=;
 b=wDtRYSLn+DijnZztdfcTElAZyy1ti5IAJ3uOZlgO5lE/4LSiiPaULfvWRTdK9ygNgm02
 XSNiEnrRn4wNMYQzDlt17sCN6QmwkFRoAybdW8ZukzTTNGYggQO9RPdr2VHnRhkGEXVX
 Z8f6ltfBOqZWnZHX1Bxjz4Jj45kC4E41sxsWXciCd47SveJrAXpN81A2AZeBGZ/qWuU6
 MpsO6YOqRnQZYOCw6SSW6N9ZwYIJrf4tbn5wrPSDalPopAgpVM5YM98GRg0Ynj0IuJiU
 nRO765mCRcWS8ipasVPJCDtp5HuFOX0DuGqyviXGpn7Dh1rQp5pqK+itRQbUiEb21zK8 NA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbnvtf6a2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jul 2022 17:01:19 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26JFcvSE009851; Tue, 19 Jul 2022 17:01:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hc1ggpb4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jul 2022 17:01:18 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26JH0i5C032177;
 Tue, 19 Jul 2022 17:01:17 GMT
Received: from paddy.uk.oracle.com (dhcp-10-175-221-30.vpn.oracle.com
 [10.175.221.30])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3hc1ggpaer-10; Tue, 19 Jul 2022 17:01:17 +0000
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
Subject: [PATCH v9 09/11] i386/pc: bounds check phys-bits against max used GPA
Date: Tue, 19 Jul 2022 18:00:12 +0100
Message-Id: <20220719170014.27028-10-joao.m.martins@oracle.com>
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
X-Proofpoint-GUID: J9JohLTcKFXAgETk9fnkAJqwT5W93Ggk
X-Proofpoint-ORIG-GUID: J9JohLTcKFXAgETk9fnkAJqwT5W93Ggk
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

Calculate max *used* GPA against the CPU maximum possible address
and error out if the former surprasses the latter. This ensures
max used GPA is reacheable by configured phys-bits. Default phys-bits
on Qemu is TCG_PHYS_ADDR_BITS (40) which is enough for the CPU to
address 1Tb (0xff ffff ffff) or 1010G (0xfc ffff ffff) in AMD hosts
with IOMMU.

This is preparation for AMD guests with >1010G, where it will want relocate
ram-above-4g to be after 1Tb instead of 4G.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/pc.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 4ebc45773c29..1e7bd549bfe9 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -879,6 +879,18 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
     return start;
 }
 
+static hwaddr pc_max_used_gpa(PCMachineState *pcms, uint64_t pci_hole64_size)
+{
+    X86CPU *cpu = X86_CPU(first_cpu);
+
+    /* 32-bit systems don't have hole64 thus return max CPU address */
+    if (cpu->phys_bits <= 32) {
+        return ((hwaddr)1 << cpu->phys_bits) - 1;
+    }
+
+    return pc_pci_hole64_start() + pci_hole64_size - 1;
+}
+
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
@@ -893,13 +905,28 @@ void pc_memory_init(PCMachineState *pcms,
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(pcms);
+    hwaddr maxphysaddr, maxusedaddr;
     hwaddr cxl_base, cxl_resv_end = 0;
+    X86CPU *cpu = X86_CPU(first_cpu);
 
     assert(machine->ram_size == x86ms->below_4g_mem_size +
                                 x86ms->above_4g_mem_size);
 
     linux_boot = (machine->kernel_filename != NULL);
 
+    /*
+     * phys-bits is required to be appropriately configured
+     * to make sure max used GPA is reachable.
+     */
+    maxusedaddr = pc_max_used_gpa(pcms, pci_hole64_size);
+    maxphysaddr = ((hwaddr)1 << cpu->phys_bits) - 1;
+    if (maxphysaddr < maxusedaddr) {
+        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
+                     " phys-bits too low (%u)",
+                     maxphysaddr, maxusedaddr, cpu->phys_bits);
+        exit(EXIT_FAILURE);
+    }
+
     /*
      * Split single memory region and use aliases to address portions of it,
      * done for backwards compatibility with older qemus.
-- 
2.17.2


