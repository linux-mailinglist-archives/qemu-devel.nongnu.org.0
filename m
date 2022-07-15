Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D52576607
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 19:30:25 +0200 (CEST)
Received: from localhost ([::1]:45894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCP8x-0002Ma-MK
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 13:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oCOwT-0001XJ-RT
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:17:29 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:63794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oCOwS-0005gK-4X
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:17:29 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26FH9Xhh002087;
 Fri, 15 Jul 2022 17:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=G7PalnraylVxk05nfgQP4/7g3uVpFvuN5n3r6hLTvnE=;
 b=FMJnzgfy2IuvTXLHBATQYZLEmr5bROMNtKq5DJr7rMuDq94jGt+iBK5gb3iPH/D9hBmT
 UIDWlLKAuZEyimkCeXVpe6xXVQUDnYxfo6X10qvOkhhVfXpcR6U2LtbodfzCbiDR6d1Q
 +jDz5spoW0J/Mz7fdHtO+fwC/CK6D5/lAsYAFEBTp6oxjSC+TbJumqQzK70yz503Vo9i
 GVHmuuZjirEMijgyjn5Cu4oqUPG3xdfVGuMmWqzD9pFZk77ZJIqFLB/JDLnN5xPOkNlC
 VmvMERtUs5XaQP85GjlBscGJST3ZGtrr3h4L6fSAdo4/1jq83eq7cwTrg8EqvL90RZXH Pw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71xrrj3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jul 2022 17:17:23 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26FHBiE7039710; Fri, 15 Jul 2022 17:17:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h7047u0b1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jul 2022 17:17:22 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 26FHGjMD013789;
 Fri, 15 Jul 2022 17:17:21 GMT
Received: from paddy.uk.oracle.com (dhcp-10-175-181-254.vpn.oracle.com
 [10.175.181.254])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h7047tyn7-10; Fri, 15 Jul 2022 17:17:21 +0000
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
Subject: [PATCH v8 09/11] i386/pc: bounds check phys-bits against max used GPA
Date: Fri, 15 Jul 2022 18:16:26 +0100
Message-Id: <20220715171628.21437-10-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220715171628.21437-1-joao.m.martins@oracle.com>
References: <20220715171628.21437-1-joao.m.martins@oracle.com>
X-Proofpoint-GUID: nj3oVewdC7vCUmUnnFYV9hB-hk0il34Q
X-Proofpoint-ORIG-GUID: nj3oVewdC7vCUmUnnFYV9hB-hk0il34Q
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

Calculate max *used* GPA against the CPU maximum possible address
and error out if the former surprasses the latter. This ensures
max used GPA is reacheable by configured phys-bits. Default phys-bits
on Qemu is TCG_PHYS_ADDR_BITS (40) which is enough for the CPU to
address 1Tb (0xff ffff ffff) or 1010G (0xfc ffff ffff) in AMD hosts
with IOMMU.

This is preparation for AMD guests with >1010G, where it will want relocate
ram-above-4g to be after 1Tb instead of 4G.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index cda435e3baeb..f30661b7f1a2 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -880,6 +880,18 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
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
@@ -894,13 +906,28 @@ void pc_memory_init(PCMachineState *pcms,
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


