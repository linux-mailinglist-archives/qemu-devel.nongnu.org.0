Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DCD575564
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:52:14 +0200 (CEST)
Received: from localhost ([::1]:33550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3wb-0003MF-DO
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oC3aH-0006EE-JL
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:29:10 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:57582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oC3aD-00088k-3c
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:29:08 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26EHe1cx022662;
 Thu, 14 Jul 2022 18:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=RyPoFbt3mAI749wa3ojwpKVtkxfRL5XMP85RSHN+/wg=;
 b=elhwgDwbnJYh9gOgokJAkWOHWViMHrGixxb3qy6aJk1YDFYMdjuk1fWDE+hRVZam8Kzw
 LJP+aNwjCUYphBm49BHay9qawDu1yusrvQGrBB2TDpo0SJwAYDaRcxa/sSnXDynE4Fk+
 /FBOgFS5FTYHlvRQBs5FTOoJzIY/XJ4v8las04cDaMzLi8zBaceNO4HEvXhZzgwb49fv
 7eTyYvPEqQ4qe+pvNlSgaD0K4dLMB6vbNwgEKAi33lmCMGL8n8zIi68jodCWImVp5YW/
 g7Btlit4ftcdf0nc1mVMDRj0JaczADo1h9169taAL/amLxJDikbdcoknM1H5Xddlepn3 +A== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71rg5uj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jul 2022 18:28:56 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26EIGr4i022620; Thu, 14 Jul 2022 18:28:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h70465jh3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jul 2022 18:28:55 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 26EISiAD017868;
 Thu, 14 Jul 2022 18:28:54 GMT
Received: from paddy.uk.oracle.com (dhcp-10-175-172-165.vpn.oracle.com
 [10.175.172.165])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h70465j62-4; Thu, 14 Jul 2022 18:28:54 +0000
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
Subject: [PATCH v7 03/10] i386/pc: pass pci_hole64_size to pc_memory_init()
Date: Thu, 14 Jul 2022 19:28:13 +0100
Message-Id: <20220714182820.30970-4-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220714182820.30970-1-joao.m.martins@oracle.com>
References: <20220714182820.30970-1-joao.m.martins@oracle.com>
X-Proofpoint-GUID: Iu9kOrR_xqNAGf2pJ98jgMa0LkzLbQSP
X-Proofpoint-ORIG-GUID: Iu9kOrR_xqNAGf2pJ98jgMa0LkzLbQSP
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

Use the pre-initialized pci-host qdev and fetch the
pci-hole64-size into pc_memory_init() newly added argument.
Use PCI_HOST_PROP_PCI_HOLE64_SIZE pci-host property for
fetching pci-hole64-size.

This is in preparation to determine that host-phys-bits are
enough and for pci-hole64-size to be considered to relocate
ram-above-4g to be at 1T (on AMD platforms).

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/pc.c         |  3 ++-
 hw/i386/pc_piix.c    |  7 ++++++-
 hw/i386/pc_q35.c     | 10 +++++++++-
 include/hw/i386/pc.h |  3 ++-
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 1660684d12fd..e952dc62a12e 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -817,7 +817,8 @@ void xen_load_linux(PCMachineState *pcms)
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
-                    MemoryRegion **ram_memory)
+                    MemoryRegion **ram_memory,
+                    uint64_t pci_hole64_size)
 {
     int linux_boot, i;
     MemoryRegion *option_rom_mr;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 6186a1473755..2a483e8666b4 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -91,6 +91,7 @@ static void pc_init1(MachineState *machine,
     MemoryRegion *pci_memory;
     MemoryRegion *rom_memory;
     ram_addr_t lowmem;
+    uint64_t hole64_size;
     DeviceState *i440fx_host;
 
     /*
@@ -166,10 +167,14 @@ static void pc_init1(MachineState *machine,
         memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
         rom_memory = pci_memory;
         i440fx_host = qdev_new(host_type);
+        hole64_size = object_property_get_uint(OBJECT(i440fx_host),
+                                               PCI_HOST_PROP_PCI_HOLE64_SIZE,
+                                               &error_abort);
     } else {
         pci_memory = NULL;
         rom_memory = system_memory;
         i440fx_host = NULL;
+        hole64_size = 0;
     }
 
     pc_guest_info_init(pcms);
@@ -186,7 +191,7 @@ static void pc_init1(MachineState *machine,
     /* allocate ram and load rom/bios */
     if (!xen_enabled()) {
         pc_memory_init(pcms, system_memory,
-                       rom_memory, &ram_memory);
+                       rom_memory, &ram_memory, hole64_size);
     } else {
         pc_system_flash_cleanup_unused(pcms);
         if (machine->kernel_filename != NULL) {
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 46ea89e564de..99ed75371c67 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -138,6 +138,7 @@ static void pc_q35_init(MachineState *machine)
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     bool acpi_pcihp;
     bool keep_pci_slot_hpc;
+    uint64_t pci_hole64_size = 0;
 
     /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
      * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
@@ -206,8 +207,15 @@ static void pc_q35_init(MachineState *machine)
     /* create pci host bus */
     q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
 
+    if (pcmc->pci_enabled) {
+        pci_hole64_size = object_property_get_uint(OBJECT(q35_host),
+                                                   PCI_HOST_PROP_PCI_HOLE64_SIZE,
+                                                   &error_abort);
+    }
+
     /* allocate ram and load rom/bios */
-    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
+    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
+                   pci_hole64_size);
 
     object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index b7735dccfc81..568c226d3034 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -159,7 +159,8 @@ void xen_load_linux(PCMachineState *pcms);
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
-                    MemoryRegion **ram_memory);
+                    MemoryRegion **ram_memory,
+                    uint64_t pci_hole64_size);
 uint64_t pc_pci_hole64_start(void);
 DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
 void pc_basic_device_init(struct PCMachineState *pcms,
-- 
2.17.2


