Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80080694C8B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:23:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbZR-0004e5-SP; Mon, 13 Feb 2023 11:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRbZP-0004d9-Ke; Mon, 13 Feb 2023 11:20:47 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRbZN-0007xn-Td; Mon, 13 Feb 2023 11:20:47 -0500
Received: by mail-ej1-x630.google.com with SMTP id n10so6271938ejc.4;
 Mon, 13 Feb 2023 08:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qb1FiuGvLBuRvXN5l6skemDDZnk2rBXyLNLNoqcFNgs=;
 b=UX1zvx36kCRETYb8ikQSDOvnj5OS7620VebCL1yeSCngTvS3y+cm+CjYPK73I5fY/3
 Rq57Knap6L0fhlfsdtGqXyPitGwPMbTi9tx6awGVWmHMSwf4w2NmOTncynZTxMriI+ka
 Rdugu5eZV+CgzooC6+jPYcX9dWAKRTqbANo5p4vTprFJTkqHsjt+x5XOwgp+y0bGsYX5
 DNO2kKZRfntnqn0kJAB5zBytfQkcibReGt/x5Bpd+xdZWBz68qiYmC88Nx9PHsKSZg7Q
 Av2861swMsY8TfafbGm+A9CGUwYogMPIKGhPi8UYuN9Q/tqRtOkktuoBSymiUXI8Oo4e
 +OkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qb1FiuGvLBuRvXN5l6skemDDZnk2rBXyLNLNoqcFNgs=;
 b=V9bWMOb8HNWbtfXudBQZx9wErZ6RrR0wTSW/ywbqoDgTzrgba1Xh6MuEna/UvHZNF0
 C7H3ISe6GCcngpavUfCZM7uhkgtC4Ewb3y3K/OvIT9zIVCCgvLhkVoZkdbQI1qyCS0ol
 FWH+aIPgdSQH82Sh+3Xra1eH3Hv1rkkLvV225CQdPp6MtvP7BJqnaXZvCJ9HLPWKqaS7
 HqKquqEBnCdC2Pp/Tz+WH+LldGHmF4IWu0XOUeQmMzjhCZNa2Fc+fMMQt7N8FZvffIDa
 Eglvu7VsawqRzJlGyZyO0CZtHghzvTtA3SH7Y0BWJNqCefcHkOW2HJb13rQotOAnOBtj
 n1MA==
X-Gm-Message-State: AO0yUKVWHC/IQBkhuiivOt7UbEDanJJAZhnUsx7WNLUnq8VDZQrrKcu0
 3rEr5k9hrFFWaIOQq1NTHSm0VrgCWVg=
X-Google-Smtp-Source: AK7set++tX2zTxL9EWRYLFSOPVaTNsQakDOJz4M17SlkHmHVCYNSQmvMnH/LFReYuIggxGYyN5GcaQ==
X-Received: by 2002:a17:907:72d2:b0:8af:ef00:b853 with SMTP id
 du18-20020a17090772d200b008afef00b853mr11980930ejc.73.1676305243740; 
 Mon, 13 Feb 2023 08:20:43 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170906025400b008841aa86484sm6979952ejl.211.2023.02.13.08.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 08:20:43 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 6/9] hw/i386/pc: Initialize ram_memory variable directly
Date: Mon, 13 Feb 2023 17:20:01 +0100
Message-Id: <20230213162004.2797-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213162004.2797-1-shentey@gmail.com>
References: <20230213162004.2797-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
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
 hw/i386/pc_q35.c     | 6 ++----
 4 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 66e3d059ef..b60b95921b 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -162,7 +162,6 @@ void xen_load_linux(PCMachineState *pcms);
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
index 8253b49296..455cbe11fa 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -129,7 +129,6 @@ static void pc_q35_init(MachineState *machine)
     MemoryRegion *system_io = get_system_io();
     MemoryRegion *pci_memory;
     MemoryRegion *rom_memory;
-    MemoryRegion *ram_memory;
     GSIState *gsi_state;
     ISABus *isa_bus;
     int i;
@@ -216,12 +215,11 @@ static void pc_q35_init(MachineState *machine)
     }
 
     /* allocate ram and load rom/bios */
-    pc_memory_init(pcms, system_memory, rom_memory, &ram_memory,
-                   pci_hole64_size);
+    pc_memory_init(pcms, system_memory, rom_memory, pci_hole64_size);
 
     object_property_add_child(OBJECT(machine), "q35", OBJECT(q35_host));
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
-                             OBJECT(ram_memory), NULL);
+                             OBJECT(machine->ram), NULL);
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_PCI_MEM,
                              OBJECT(pci_memory), NULL);
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_SYSTEM_MEM,
-- 
2.39.1


