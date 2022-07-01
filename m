Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7B8563789
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 18:14:31 +0200 (CEST)
Received: from localhost ([::1]:45292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7JHq-0003kc-Ht
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 12:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o7JET-0008TQ-Sb
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:11:01 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:1660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o7JEP-000249-1u
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:11:01 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 261G3G4E011277;
 Fri, 1 Jul 2022 16:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=fRUaM6BoTCnpEt8yk7mTglXXc901MlgM1s5jUyNf8tE=;
 b=m3NAWtyzAzg3EBbmDbaDd0FSGukoqIrJ1B/1geZ+CIhRwqqSrk7cvrpOHH0zU6uUdpTK
 AampiCipSeJNa85QgXL9Qpf7LO9r84Eh6LmJuhI9sdo4A083aYTfimCKP4eKXnis63GG
 8IVZizPv3GGBYAFFpG5Q8wcIATCoO6imOYWc7A9tjnz6RuzPwSzAxgMv/rNWyifkbnDG
 FGi5LptjGryHfJWn21HJW0bdhNsC1aeBur7eY1piIg/kYf/mSaXNnx1CyCetlFTFYF2u
 p+9Ra3Xq4B5e7Rt04IpUbh1lxPSO/R9pRFLjczpzwDUN0VUI+aAhCFPTqHIfcBcYK9ZZ Jg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gws52qmey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Jul 2022 16:10:50 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 261G5hVC016094; Fri, 1 Jul 2022 16:10:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gwrt4sw02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Jul 2022 16:10:49 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 261GAftG029065;
 Fri, 1 Jul 2022 16:10:49 GMT
Received: from paddy.uk.oracle.com (dhcp-10-175-184-247.vpn.oracle.com
 [10.175.184.247])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gwrt4svtm-3; Fri, 01 Jul 2022 16:10:49 +0000
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
Subject: [PATCH v6 02/10] i386/pc: create pci-host qdev prior to
 pc_memory_init()
Date: Fri,  1 Jul 2022 17:10:06 +0100
Message-Id: <20220701161014.3850-3-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220701161014.3850-1-joao.m.martins@oracle.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
X-Proofpoint-ORIG-GUID: JE0Hd52pvjP57WBrWC9EX5iKzMvAug1t
X-Proofpoint-GUID: JE0Hd52pvjP57WBrWC9EX5iKzMvAug1t
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

At the start of pc_memory_init() we usually pass a range of
0..UINT64_MAX as pci_memory, when really its 2G (i440fx) or
32G (q35). To get the real user value, we need to get pci-host
passed property for default pci_hole64_size. Thus to get that,
create the qdev prior to memory init to better make estimations
on max used/phys addr.

This is in preparation to determine that host-phys-bits are
enough and also for pci-hole64-size to be considered to relocate
ram-above-4g to be at 1T (on AMD platforms).

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/pc_piix.c            | 7 +++++--
 hw/i386/pc_q35.c             | 6 +++---
 hw/pci-host/i440fx.c         | 5 ++---
 include/hw/pci-host/i440fx.h | 3 ++-
 4 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index a234989ac363..6186a1473755 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -91,6 +91,7 @@ static void pc_init1(MachineState *machine,
     MemoryRegion *pci_memory;
     MemoryRegion *rom_memory;
     ram_addr_t lowmem;
+    DeviceState *i440fx_host;
 
     /*
      * Calculate ram split, for memory below and above 4G.  It's a bit
@@ -164,9 +165,11 @@ static void pc_init1(MachineState *machine,
         pci_memory = g_new(MemoryRegion, 1);
         memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
         rom_memory = pci_memory;
+        i440fx_host = qdev_new(host_type);
     } else {
         pci_memory = NULL;
         rom_memory = system_memory;
+        i440fx_host = NULL;
     }
 
     pc_guest_info_init(pcms);
@@ -200,8 +203,8 @@ static void pc_init1(MachineState *machine,
         const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
                                          : TYPE_PIIX3_DEVICE;
 
-        pci_bus = i440fx_init(host_type,
-                              pci_type,
+        pci_bus = i440fx_init(pci_type,
+                              i440fx_host,
                               system_memory, system_io, machine->ram_size,
                               x86ms->below_4g_mem_size,
                               x86ms->above_4g_mem_size,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index f96cbd04e284..46ea89e564de 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -203,12 +203,12 @@ static void pc_q35_init(MachineState *machine)
                             pcms->smbios_entry_point_type);
     }
 
-    /* allocate ram and load rom/bios */
-    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
-
     /* create pci host bus */
     q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
 
+    /* allocate ram and load rom/bios */
+    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
+
     object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
                              OBJECT(ram_memory), NULL);
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 1c5ad5f918a2..d5426ef4a53c 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -237,7 +237,8 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
     }
 }
 
-PCIBus *i440fx_init(const char *host_type, const char *pci_type,
+PCIBus *i440fx_init(const char *pci_type,
+                    DeviceState *dev,
                     MemoryRegion *address_space_mem,
                     MemoryRegion *address_space_io,
                     ram_addr_t ram_size,
@@ -246,7 +247,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
                     MemoryRegion *pci_address_space,
                     MemoryRegion *ram_memory)
 {
-    DeviceState *dev;
     PCIBus *b;
     PCIDevice *d;
     PCIHostState *s;
@@ -254,7 +254,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
     unsigned i;
     I440FXState *i440fx;
 
-    dev = qdev_new(host_type);
     s = PCI_HOST_BRIDGE(dev);
     b = pci_root_bus_new(dev, NULL, pci_address_space,
                          address_space_io, 0, TYPE_PCI_BUS);
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index 52518dbf08e6..d02bf1ed6b93 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -35,7 +35,8 @@ struct PCII440FXState {
 
 #define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
 
-PCIBus *i440fx_init(const char *host_type, const char *pci_type,
+PCIBus *i440fx_init(const char *pci_type,
+                    DeviceState *dev,
                     MemoryRegion *address_space_mem,
                     MemoryRegion *address_space_io,
                     ram_addr_t ram_size,
-- 
2.17.2


