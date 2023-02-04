Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E874868AADE
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 16:12:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOKC6-0002Ua-L5; Sat, 04 Feb 2023 10:11:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOKC2-0002RP-HD; Sat, 04 Feb 2023 10:11:06 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOKC0-0006b8-SO; Sat, 04 Feb 2023 10:11:06 -0500
Received: by mail-ej1-x62c.google.com with SMTP id k4so22951548eje.1;
 Sat, 04 Feb 2023 07:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=APEL4mR2mjWxIDbTlk214qLngpqhM7APvX4Zo2lwqlc=;
 b=Bemxb2m3mQ0W3JHWL8l7ubGC8SB0zKxsxG31NDd8j7AG1gLmhU8cUqa81a5qG9uAO+
 FsADbHVTxa36gDqXk37hnyvHrtyugZzsPQ+ekQcFIi/5JCyP506BKibaarFWd5t9JgoM
 QSBTy8bnpZYhCzLCw5NrumW36jkR/84Rsx2KcTc3c6/XFM6fwMn5SN/V2TZfFBy07JM8
 BDB9TK0X3v4ZAJwdfwpNueAvKYoWb+Psj8exkb411CLcQ76VdOs2kCJt3brDvb5v0gKD
 syP63alpcHfbPC9Cl67+qU/Jl29A/pfpt7i703vKxhvhlBbeGigPLkRyIyI2E4TDAkoZ
 /dTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=APEL4mR2mjWxIDbTlk214qLngpqhM7APvX4Zo2lwqlc=;
 b=hZYgoNrps82VRyrjzcGMgM/BEa30swmHXuWNFZreiko/PQynMflIj3cdOWgFdcQ3u0
 i3ZiXQ75vgPnTd2uHMjiBjgtRgIAeUtL13gIkQxnhBBxFe4TNHEJn/t/+Y+D31mPLyY1
 MjQL/5QeAPOYkmyLQzb98+s3/WmkSHVDEoBEF0tNInKgQkf27L3jOeNONgVN3+Uo7RoY
 E5iakPsVzeON4W2p2zOVW1ajV3QP0c8EvTPFy5xz3wrO03lpq54wgoKxllnFd9FJuxh6
 dGw4Tte8iB7Pehz+twijh7ZKBw3GEeCmuCD343Svy6w38OsWDn0Zfp7Lddf2Jp4Fa1U4
 vr7A==
X-Gm-Message-State: AO0yUKXC/LpqUgrm40Z8uKNcHpb71Ty/lxkbrhApRJ63Y3oLdf6KXTo1
 AAw2Svej0dC1RoSRxKUtOz6bPyojHSI=
X-Google-Smtp-Source: AK7set/+ASBde+I5UmWbR2s3AdEarmneWXpCUeOP3fvmYasypmgka0IHeGothseWbaUMJa1uz/7H7Q==
X-Received: by 2002:a17:906:53d4:b0:878:7ef1:4a20 with SMTP id
 p20-20020a17090653d400b008787ef14a20mr14151094ejo.4.1675523462933; 
 Sat, 04 Feb 2023 07:11:02 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-183-077-083.77.183.pool.telefonica.de. [77.183.77.83])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906211100b0088a2aebb146sm2937922ejt.52.2023.02.04.07.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 07:11:02 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 6/9] hw/i386/pc: Initialize ram_memory variable directly
Date: Sat,  4 Feb 2023 16:10:24 +0100
Message-Id: <20230204151027.39007-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204151027.39007-1-shentey@gmail.com>
References: <20230204151027.39007-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
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
index 8253b49296..88f0981f50 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -129,7 +129,7 @@ static void pc_q35_init(MachineState *machine)
     MemoryRegion *system_io = get_system_io();
     MemoryRegion *pci_memory;
     MemoryRegion *rom_memory;
-    MemoryRegion *ram_memory;
+    MemoryRegion *ram_memory = machine->ram;
     GSIState *gsi_state;
     ISABus *isa_bus;
     int i;
@@ -216,8 +216,7 @@ static void pc_q35_init(MachineState *machine)
     }
 
     /* allocate ram and load rom/bios */
-    pc_memory_init(pcms, system_memory, rom_memory, &ram_memory,
-                   pci_hole64_size);
+    pc_memory_init(pcms, system_memory, rom_memory, pci_hole64_size);
 
     object_property_add_child(OBJECT(machine), "q35", OBJECT(q35_host));
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
-- 
2.39.1


