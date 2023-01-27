Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976FB67EB75
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 17:48:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLRtJ-0002UI-DG; Fri, 27 Jan 2023 11:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pLRt8-0002LB-AX; Fri, 27 Jan 2023 11:47:42 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pLRt6-0005fw-NL; Fri, 27 Jan 2023 11:47:42 -0500
Received: by mail-ed1-x52f.google.com with SMTP id v13so5229725eda.11;
 Fri, 27 Jan 2023 08:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=112PDGr5auDan/9COjqqcqMviFQFRU5C3+pSLlcp7zA=;
 b=F7G7Jl3C4S+6NW3bxYUGIlTPbrVqNbzSuDMFUBPBdzT8uM7/wBHSkOA7rvD7lgKgW0
 DLKDcQBOOlW7E/M/+d3kIQYgTamIqo6oIep5qkZNKUgRBKCndY/Uo0pI9d4GManTEyr6
 KPqkqFyBENwrnjOJaR09OfrI75/+p1520bvMnsmKox26M6eDOjmBB/OCEP8rJEUJAzMj
 f7kBlc3+/zrs7bC6w8OqOzrald92foB9bc9+tgIC1Rz+8Nf8YrQSJNwoXqKLTCiLufni
 JSxR0WgELhIh/xWHBBSLsm6tQpYD01SF25uNU/Zf9iZP0zV3i58cmicn9hgNhCtln8S1
 4kAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=112PDGr5auDan/9COjqqcqMviFQFRU5C3+pSLlcp7zA=;
 b=qXb4eYoD5SXmuMRmlbKymhox+Mplg/ZcmtfBHn2XgLQNXbtb83okrgi7YVNBcautPl
 QsXlS+xfYpYDwjT4zsURFkbZiN7BCCFoFYe6Xa+JeujxG+rX0A3gDgfvyiDwf1Txt0gE
 xs/YYQzBK10nGsB0EbJe69sbpBoiFGPeDXgaGH2JfRG1UtQhCF8208O/vrtLS1SaPcHP
 rVK5rnKEhQ6Fcdq1GODYDjIfFxAV/bPO3f/qyrjHj2/0Ha10c34ATcfgYDCQeXc6oH9V
 zVV9y+0EX6n5HZOLKa8obYk8VI9uefEjjk/2AQsZpU8EiNIDbKWqucH1cGtrXX8DZtlG
 vQbw==
X-Gm-Message-State: AO0yUKXZZG8q9m7tWaKL8t2q3n/iiXpjDO4xZdFWfVPyTMuZOJ2NLO/s
 IWjssQcL68gkAEdn/w7mWJxvyTR9gbRNJA==
X-Google-Smtp-Source: AK7set+VvLglDl4w91OVszSnkxMDijq/PB+1708r+fNpuHVwuidcXb4N1JnNNIqJLoFRTNrlj4nc4w==
X-Received: by 2002:aa7:d855:0:b0:4a0:8f89:337a with SMTP id
 f21-20020aa7d855000000b004a08f89337amr12763837eds.11.1674838058767; 
 Fri, 27 Jan 2023 08:47:38 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a056402050f00b0049ef70a2894sm2574414edv.38.2023.01.27.08.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 08:47:38 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 7/7] hw/i386/pc: Initialize ram_memory variable directly
Date: Fri, 27 Jan 2023 17:47:18 +0100
Message-Id: <20230127164718.98156-8-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127164718.98156-1-shentey@gmail.com>
References: <20230127164718.98156-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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
index b97979bebb..8559924eb4 100644
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
 
     object_property_add_child(OBJECT(machine), "q35", OBJECT(phb));
     object_property_set_link(OBJECT(phb), MCH_HOST_PROP_RAM_MEM,
-- 
2.39.1


