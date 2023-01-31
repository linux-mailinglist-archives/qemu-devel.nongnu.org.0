Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCC7682C0E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:57:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpD8-0006O2-O4; Tue, 31 Jan 2023 06:54:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpD6-0006Dm-1d; Tue, 31 Jan 2023 06:54:00 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpD4-0002Kz-BN; Tue, 31 Jan 2023 06:53:59 -0500
Received: by mail-ed1-x534.google.com with SMTP id n6so11500563edo.9;
 Tue, 31 Jan 2023 03:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z2bhIYmeYwrzW+hLS8eeCTJRHx/Ps44JepqikhNr1/g=;
 b=BRY4DH9pEcHi7OZczBRJOblYM6sIQGl0kbwqMpYm3DtCTxQYbdDIqrksDOE5DG68Mh
 i7/Da8CP8TkvNSt9L2R6pcbMMioLkHUxf17LbjO7j1POnJQvJ0QVarpwCQ0RwsrP/qv9
 n9hEDJ2T+EbWF7LbMXtYXcSwkqgulC0aDAoAazzj4zLCNx4DnyETBQ4lwX87QcZLcEF5
 VtPQ3zwVNpNzFtYCzJsoFarUQNutS3yp9MPp9CKHw0i1+DR7akZNwVxFK0XBZQeMUQzW
 aLpnm1Ubx8uatS9yg0t8lj/Q280+C+zTxs8y5IbGjDwHMaL+1TP4g8xThnVm+ErsWMkr
 ka7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z2bhIYmeYwrzW+hLS8eeCTJRHx/Ps44JepqikhNr1/g=;
 b=7amcDdWztpo3gvMCsmX7cgSNRRAGlE52JtxGDAlO37brwCRlTzUogehBysWrARb4/x
 h4OPxadEY3fHh4GkNeq5dwgDI4Iu6PykLGjvo8shJ0ZlZ1tdeNxR7OhaEG1SkiQ5xoV5
 zb0KvbxGw7dbNOmNaXsB8NRLZjOEvW6OKGjHW4Qp6rgHoh1SzpLOToTcn/dazkmFrssn
 0NLfw1xTHj4N9BBj/GRaodIuYj1f5id1pzzdIV/kpMHPhMHXEMr0U8D3jYUaZ4sH9cPc
 Fe1KuA0YS13TBNMflwEEBV1nz2RA4ar30HwIUHd+/y16FfU0GDOYgaLsD3pf+bR1Tz3U
 WRtA==
X-Gm-Message-State: AO0yUKVUaeRFVfFIpujf5eQpLzGgI3gMueWWwRKB3bRPe3Uv+2sxxEPQ
 RA2n4pU/AKFYmmVtSetN+Tmo/uWLjCU=
X-Google-Smtp-Source: AK7set9l6p9lINm68FtLRBLvMdr5nnlnZ3nvBzzI+yP0Aqo8aLu8Ssc1+BXioVIp8MdSrmpGiWccug==
X-Received: by 2002:a05:6402:2029:b0:4a2:584d:23c5 with SMTP id
 ay9-20020a056402202900b004a2584d23c5mr5155808edb.18.1675166037020; 
 Tue, 31 Jan 2023 03:53:57 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-082-236.77.13.pool.telefonica.de. [77.13.82.236])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056402100a00b00483dd234ac6sm8178318edu.96.2023.01.31.03.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 03:53:56 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 07/20] hw/i386/pc: Initialize ram_memory variable directly
Date: Tue, 31 Jan 2023 12:53:13 +0100
Message-Id: <20230131115326.12454-8-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131115326.12454-1-shentey@gmail.com>
References: <20230131115326.12454-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Going through pc_memory_init() seems quite complicated for a simple
assignment.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i386/pc.h | 1 -
 hw/i386/pc.c         | 2 --
 hw/i386/pc_piix.c    | 4 ++--
 hw/i386/pc_q35.c     | 5 ++---
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 88a120bc23..5331b9a5c5 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -163,7 +163,6 @@ void xen_load_linux(PCMachineState *pcms);
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
-                    MemoryRegion **ram_memory,
                     uint64_t pci_hole64_size);
 uint64_t pc_pci_hole64_start(void);
 DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 6e592bd969..8898cc9961 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -936,7 +936,6 @@ static hwaddr pc_max_used_gpa(PCMachineState *pcms, uint64_t pci_hole64_size)
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
-                    MemoryRegion **ram_memory,
                     uint64_t pci_hole64_size)
 {
     int linux_boot, i;
@@ -994,7 +993,6 @@ void pc_memory_init(PCMachineState *pcms,
      * Split single memory region and use aliases to address portions of it,
      * done for backwards compatibility with older qemus.
      */
-    *ram_memory = machine->ram;
     ram_below_4g = g_malloc(sizeof(*ram_below_4g));
     memory_region_init_alias(ram_below_4g, NULL, "ram-below-4g", machine->ram,
                              0, x86ms->below_4g_mem_size);
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 5bde4533cc..00ba725656 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -143,6 +143,7 @@ static void pc_init1(MachineState *machine,
     if (xen_enabled()) {
         xen_hvm_init_pc(pcms, &ram_memory);
     } else {
+        ram_memory = machine->ram;
         if (!pcms->max_ram_below_4g) {
             pcms->max_ram_below_4g = 0xe0000000; /* default: 3.5G */
         }
@@ -205,8 +206,7 @@ static void pc_init1(MachineState *machine,
 
     /* allocate ram and load rom/bios */
     if (!xen_enabled()) {
-        pc_memory_init(pcms, system_memory,
-                       rom_memory, &ram_memory, hole64_size);
+        pc_memory_init(pcms, system_memory, rom_memory, hole64_size);
     } else {
         pc_system_flash_cleanup_unused(pcms);
         if (machine->kernel_filename != NULL) {
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 3ae2f41cf3..50fa5aa9bc 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -128,7 +128,7 @@ static void pc_q35_init(MachineState *machine)
     MemoryRegion *system_io = get_system_io();
     MemoryRegion *pci_memory;
     MemoryRegion *rom_memory;
-    MemoryRegion *ram_memory;
+    MemoryRegion *ram_memory = machine->ram;
     GSIState *gsi_state;
     ISABus *isa_bus;
     int i;
@@ -215,8 +215,7 @@ static void pc_q35_init(MachineState *machine)
     }
 
     /* allocate ram and load rom/bios */
-    pc_memory_init(pcms, system_memory, rom_memory, &ram_memory,
-                   pci_hole64_size);
+    pc_memory_init(pcms, system_memory, rom_memory, pci_hole64_size);
 
     object_property_add_child(OBJECT(machine), "q35", phb);
     object_property_set_link(phb, MCH_HOST_PROP_RAM_MEM,
-- 
2.39.1


