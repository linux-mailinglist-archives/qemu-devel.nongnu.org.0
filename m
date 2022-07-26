Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 496C8581A93
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:56:42 +0200 (CEST)
Received: from localhost ([::1]:53032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQfY-0001Gc-1a
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQE-0006Nt-8f
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQC-00052L-1k
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658864445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IdmtmvyLempN390IswXPp8lMHnKmN++8ryVr23XiQDw=;
 b=LkJgfLlTndEjqZumn6+sfU4UV9jqG7T+e+qUFAOytcKJ7+K/yXc9w5HZogJNeIK2kKCBg2
 Wo3hQNxZK9qKTGOX8J7g3Qhfv8DNc9Pn3g3hNnHqK+W+XVlh+8M6QKnOoiqnRXVpbzhXyw
 hbg0QkgNjgOIWMoE2EhIo46HkZ9SskY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-dl_8-daZNcGCPno-vg_drQ-1; Tue, 26 Jul 2022 15:40:44 -0400
X-MC-Unique: dl_8-daZNcGCPno-vg_drQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 p36-20020a05600c1da400b003a33a8c14f2so6930644wms.7
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=IdmtmvyLempN390IswXPp8lMHnKmN++8ryVr23XiQDw=;
 b=jDDOgdiwwOfIS2gwLG+JX/efIIqAsVT3X63g1aopvpQ56NyWRD3SHIXG/8ApN6itVP
 xLb1wDBmBj9O4pF7mvd2wnUkg8OTjOyu9RzWbUJ0aa+EkeXJgE/VI+sv7Mcc2R3OwJVJ
 iaaIBAgQKg9xF+tmz7ZkirAc3hA3krUzX6FI1XJpGX7ccILOrNLac2GsKLFO+UO9jbHH
 HrFtWPXGsNSIdogxegicqBqWWT3RY6MBm1KmVJfzVyyr18tu5zz22B8yfceRtR6nUphz
 nYhhLGcoDHTd75QHRlJWIrhgQVOb9MEf9KgEFr83CA5Arj2M/Bn+cyC8sO+7XribJQjI
 hFkw==
X-Gm-Message-State: AJIora86zQ8d4l00CzXDdL2We6TAG/izpBnGxRnKFyIOWdyZbm4LzajZ
 7qrI93hbLrBl4N/6e6Ljd1Rmai1IYyMx57kskBOy4MzddhUz2xSQaCq5usQVHCli9Kuakk2lNO0
 6z0ueLHhvR1Z7Tf8g8sNzYDf02enDeL3ByWQgKSVn9+aIsOEteSQoOGoJB5Vg
X-Received: by 2002:adf:fb90:0:b0:21e:4eb6:b880 with SMTP id
 a16-20020adffb90000000b0021e4eb6b880mr11671074wrr.551.1658864442695; 
 Tue, 26 Jul 2022 12:40:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t+QSEnEZqMFy8S+2YlmayN24RYT6kv8PRXb4vuzPOR+ZNTJpvelIW0P+Z92AnBXHJFe2Azcw==
X-Received: by 2002:adf:fb90:0:b0:21e:4eb6:b880 with SMTP id
 a16-20020adffb90000000b0021e4eb6b880mr11671052wrr.551.1658864442420; 
 Tue, 26 Jul 2022 12:40:42 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7424:0:3d16:86dc:de54:5671])
 by smtp.gmail.com with ESMTPSA id
 n5-20020adff085000000b0021eb5a1bb1csm1561897wro.30.2022.07.26.12.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:40:42 -0700 (PDT)
Date: Tue, 26 Jul 2022 15:40:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 07/16] i386/pc: pass pci_hole64_size to pc_memory_init()
Message-ID: <20220726193858.177462-8-mst@redhat.com>
References: <20220726193858.177462-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726193858.177462-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Joao Martins <joao.m.martins@oracle.com>

Use the pre-initialized pci-host qdev and fetch the
pci-hole64-size into pc_memory_init() newly added argument.
Use PCI_HOST_PROP_PCI_HOLE64_SIZE pci-host property for
fetching pci-hole64-size.

This is in preparation to determine that host-phys-bits are
enough and for pci-hole64-size to be considered to relocate
ram-above-4g to be at 1T (on AMD platforms).

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220719170014.27028-4-joao.m.martins@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/pc.h |  3 ++-
 hw/i386/pc.c         |  3 ++-
 hw/i386/pc_piix.c    |  7 ++++++-
 hw/i386/pc_q35.c     | 10 +++++++++-
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 2a8ffbcfa8..01938fce4c 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -162,7 +162,8 @@ void xen_load_linux(PCMachineState *pcms);
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
-                    MemoryRegion **ram_memory);
+                    MemoryRegion **ram_memory,
+                    uint64_t pci_hole64_size);
 uint64_t pc_pci_hole64_start(void);
 DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
 void pc_basic_device_init(struct PCMachineState *pcms,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 13b68307be..f4d5b25fdd 100644
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
index b8b3ce3408..aa191d405a 100644
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
index f4d23b1469..307910b33c 100644
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
-- 
MST


