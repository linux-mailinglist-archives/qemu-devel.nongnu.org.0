Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175AE5637C9
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 18:23:59 +0200 (CEST)
Received: from localhost ([::1]:40622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7JR0-0003Qi-4J
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 12:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o7JEq-0000mk-SF
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:11:24 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:9908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o7JEo-0002qH-MQ
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:11:24 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 261G3GZ5011282;
 Fri, 1 Jul 2022 16:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=1tZZSQLrz9hbXFSEbGz0upDFbZ/ZpsB4PA8XKw+kgRg=;
 b=r9gf40tak9rG5d7BwDfMar1ojRAZ3TxAEtpbZ22+593zTSgOLumiFRC2P8AvflUyCyJ1
 Ezv51JVWZ0KBWzD7YbNlHDqiQ8AyLUTcsJ/gg7AZ7k5L7h7RaM3cZLP+LFC087fmazbs
 p8+AC7iD0cdIJtsaZVE5Ukw28q4oI35hiHr+szmtw+WaI7LmxHT1JaP+RvOahOYsiD9o
 /5PgE2fDg8FG0Ml0O148A9qUqQ8w0KOHyCdiDzJvqsxi8nxiZC+Per94E0xIKw1Vumw2
 qaNapPf7Z4UDmOuxRevwjuMZ7ZbWuWNsAiJm+w8g20fA1M7UkXTuuedvrRd2wSiwDgvm KQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gws52qmgc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Jul 2022 16:11:18 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 261G5hkf016148; Fri, 1 Jul 2022 16:11:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gwrt4swbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Jul 2022 16:11:17 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 261GAftU029065;
 Fri, 1 Jul 2022 16:11:17 GMT
Received: from paddy.uk.oracle.com (dhcp-10-175-184-247.vpn.oracle.com
 [10.175.184.247])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gwrt4svtm-10; Fri, 01 Jul 2022 16:11:17 +0000
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
Subject: [PATCH v6 09/10] i386/pc: relocate 4g start to 1T where applicable
Date: Fri,  1 Jul 2022 17:10:13 +0100
Message-Id: <20220701161014.3850-10-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220701161014.3850-1-joao.m.martins@oracle.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
X-Proofpoint-ORIG-GUID: nPc82lI1rNhF5Uo-31W96mh0ukzXrZN0
X-Proofpoint-GUID: nPc82lI1rNhF5Uo-31W96mh0ukzXrZN0
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

It is assumed that the whole GPA space is available to be DMA
addressable, within a given address space limit, except for a
tiny region before the 4G. Since Linux v5.4, VFIO validates
whether the selected GPA is indeed valid i.e. not reserved by
IOMMU on behalf of some specific devices or platform-defined
restrictions, and thus failing the ioctl(VFIO_DMA_MAP) with
 -EINVAL.

AMD systems with an IOMMU are examples of such platforms and
particularly may only have these ranges as allowed:

	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb[*])

We already account for the 4G hole, albeit if the guest is big
enough we will fail to allocate a guest with  >1010G due to the
~12G hole at the 1Tb boundary, reserved for HyperTransport (HT).

[*] there is another reserved region unrelated to HT that exists
in the 256T boundary in Fam 17h according to Errata #1286,
documeted also in "Open-Source Register Reference for AMD Family
17h Processors (PUB)"

When creating the region above 4G, take into account that on AMD
platforms the HyperTransport range is reserved and hence it
cannot be used either as GPAs. On those cases rather than
establishing the start of ram-above-4g to be 4G, relocate instead
to 1Tb. See AMD IOMMU spec, section 2.1.2 "IOMMU Logical
Topology", for more information on the underlying restriction of
IOVAs.

After accounting for the 1Tb hole on AMD hosts, mtree should
look like:

0000000000000000-000000007fffffff (prio 0, i/o):
	 alias ram-below-4g @pc.ram 0000000000000000-000000007fffffff
0000010000000000-000001ff7fffffff (prio 0, i/o):
	alias ram-above-4g @pc.ram 0000000080000000-000000ffffffffff

If the relocation is done or the address space covers it, we
also add the the reserved HT e820 range as reserved.

Default phys-bits on Qemu is TCG_PHYS_ADDR_BITS (40) which is enough
to address 1Tb (0xff ffff ffff). On AMD platforms, if a
ram-above-4g relocation may be desired and the CPU wasn't configured
with a big enough phys-bits, print an error message to the user
and do not make the relocation of the above-4g-region if phys-bits
is too low.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c | 101 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index a79fa1b6beeb..07025b510540 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -907,6 +907,87 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
     return start;
 }
 
+static hwaddr pc_max_used_gpa(PCMachineState *pcms,
+                                hwaddr above_4g_mem_start,
+                                uint64_t pci_hole64_size)
+{
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+
+    if (!x86ms->above_4g_mem_size) {
+        /*
+         * 32-bit pci hole goes from
+         * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
+          */
+        return IO_APIC_DEFAULT_ADDRESS - 1;
+    }
+
+    return pc_pci_hole64_start() + pci_hole64_size;
+}
+
+/*
+ * AMD systems with an IOMMU have an additional hole close to the
+ * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
+ * on kernel version, VFIO may or may not let you DMA map those ranges.
+ * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
+ * with certain memory sizes. It's also wrong to use those IOVA ranges
+ * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
+ * The ranges reserved for Hyper-Transport are:
+ *
+ * FD_0000_0000h - FF_FFFF_FFFFh
+ *
+ * The ranges represent the following:
+ *
+ * Base Address   Top Address  Use
+ *
+ * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
+ * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
+ * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
+ * FD_F910_0000h FD_F91F_FFFFh System Management
+ * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
+ * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
+ * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
+ * FD_FE00_0000h FD_FFFF_FFFFh Configuration
+ * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
+ * FE_2000_0000h FF_FFFF_FFFFh Reserved
+ *
+ * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
+ * Table 3: Special Address Controls (GPA) for more information.
+ */
+#define AMD_HT_START         0xfd00000000UL
+#define AMD_HT_END           0xffffffffffUL
+#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
+#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
+
+static void pc_set_amd_above_4g_mem_start(PCMachineState *pcms,
+                                          uint64_t pci_hole64_size)
+{
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+    hwaddr start = x86ms->above_4g_mem_start;
+    hwaddr maxphysaddr, maxusedaddr;
+
+    /* Bail out if max possible address does not cross HT range */
+    if (pc_max_used_gpa(pcms, start, pci_hole64_size) < AMD_HT_START) {
+        return;
+    }
+
+    /*
+     * Relocating ram-above-4G requires more than TCG_PHYS_ADDR_BITS (40).
+     * So make sure phys-bits is required to be appropriately sized in order
+     * to proceed with the above-4g-region relocation and thus boot.
+     */
+    start = AMD_ABOVE_1TB_START;
+    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
+    maxusedaddr = pc_max_used_gpa(pcms, start, pci_hole64_size);
+    if (maxphysaddr < maxusedaddr) {
+        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
+                     " phys-bits too low (%u) cannot avoid AMD HT range",
+                     maxphysaddr, maxusedaddr, X86_CPU(first_cpu)->phys_bits);
+        exit(EXIT_FAILURE);
+    }
+
+    x86ms->above_4g_mem_start = start;
+}
+
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
@@ -922,12 +1003,31 @@ void pc_memory_init(PCMachineState *pcms,
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(pcms);
     hwaddr cxl_base, cxl_resv_end = 0;
+    X86CPU *cpu = X86_CPU(first_cpu);
 
     assert(machine->ram_size == x86ms->below_4g_mem_size +
                                 x86ms->above_4g_mem_size);
 
     linux_boot = (machine->kernel_filename != NULL);
 
+    /*
+     * The HyperTransport range close to the 1T boundary is unique to AMD
+     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
+     * to above 1T to AMD vCPUs only.
+     */
+    if (IS_AMD_CPU(&cpu->env)) {
+        pc_set_amd_above_4g_mem_start(pcms, pci_hole64_size);
+
+        /*
+         * Advertise the HT region if address space covers the reserved
+         * region or if we relocate.
+         */
+        if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START ||
+            cpu->phys_bits >= 40) {
+            e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
+        }
+    }
+
     /*
      * Split single memory region and use aliases to address portions of it,
      * done for backwards compatibility with older qemus.
@@ -938,6 +1038,7 @@ void pc_memory_init(PCMachineState *pcms,
                              0, x86ms->below_4g_mem_size);
     memory_region_add_subregion(system_memory, 0, ram_below_4g);
     e820_add_entry(0, x86ms->below_4g_mem_size, E820_RAM);
+
     if (x86ms->above_4g_mem_size > 0) {
         ram_above_4g = g_malloc(sizeof(*ram_above_4g));
         memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g",
-- 
2.17.2


