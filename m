Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F90700D95
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 19:04:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxWA8-0001CK-HW; Fri, 12 May 2023 13:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxWA3-0001B4-R3
 for qemu-devel@nongnu.org; Fri, 12 May 2023 13:02:31 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxWA2-0002Av-0U
 for qemu-devel@nongnu.org; Fri, 12 May 2023 13:02:31 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f417ea5252so53809785e9.0
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 10:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683910946; x=1686502946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MFCeM+1XGtMQYF2UODCgJ1l9ex3LQoWfG2ZoWUc7ySU=;
 b=G4bRWB2H8lVJbbvib4w05Rwbi89Ty8yXzQkVfb/LuZWg+NtEofbhp2X62d2Mp4VoJa
 lF93WlXE0xdRELJxdKyb36oedw40fh+eio09vFKKG7nskikdIAG3LoxNqPp3i/SWdFlp
 Jk4m5SSx/DlYsLnx8/vgPputgw/MIkzXbFoFZc8Zx+TMPRjDc71m/PVnlzOmRsJnNkpp
 kSuMpJDbhpKdM5VA2QbK0lVnnNpWLIG+UTWRxfheMtellO0JCrPO39rQ9bD3JUNpmIzO
 UaYazybAR/aVs0ASJv/vzclHq4q8Ba6XVscu/eGEwuTLo3oUK58qDc2BicTnaMoPoL8W
 KNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683910946; x=1686502946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MFCeM+1XGtMQYF2UODCgJ1l9ex3LQoWfG2ZoWUc7ySU=;
 b=aP+9f2nSqISMCSYffP67SigxCw7lNpObrXqVTOvriLKyH60+6Iy3ypQ+JsarIysk9f
 h06DAj4JPS4IP1W0y69KpkimPSZWf0C0niASBb9/ihI1B2KxwyoJQlu7qKDBHn+bmxBh
 K/N5FK/WS5TOc9oEpyJAhkFSGAKiiioDRG/YrDb32t6E8dXkB6oI6hjMJpMiU90JIR4C
 x9N/u/0X+cvXwWrieKPPWSqt0izz5+EhTZVrGJjo5iKwcFg8taqOPRpZrtY+IXSxijsu
 INanhNvr04qENEQx0xXj44XEBjb4fo6tdjVU43bvCsHIN0YDYHwUzHW9aJ5dvcM6Oq7n
 rsFA==
X-Gm-Message-State: AC+VfDyWBrrJKZdaiq9xfSab/Kbb7s5DCcVjv1309qIbykMIVS9GM2J9
 uUWwbE0mfbKD72Rmx342gQqr8SuCE5VnqiQtZ4Q=
X-Google-Smtp-Source: ACHHUZ4savLcUETkqZqMoHICPse8bG3OFnbVqlOxqch4ZL90yl6FWY9yY/3XXeLbdYru+CNAKoVMdA==
X-Received: by 2002:a05:600c:218:b0:3f4:28fd:83e0 with SMTP id
 24-20020a05600c021800b003f428fd83e0mr11299920wmi.31.1683910946137; 
 Fri, 12 May 2023 10:02:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a05600c205a00b003f4f1b884b3sm3521004wmg.20.2023.05.12.10.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 10:02:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/arm/vexpress: Avoid trivial memory leak of 'flashalias'
Date: Fri, 12 May 2023 18:02:23 +0100
Message-Id: <20230512170223.3801643-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512170223.3801643-1-peter.maydell@linaro.org>
References: <20230512170223.3801643-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

In the vexpress board code, we allocate a new MemoryRegion at the top
of vexpress_common_init() but only set it up and use it inside the
"if (map[VE_NORFLASHALIAS] != -1)" conditional, so we leak it if not.
This isn't a very interesting leak as it's a tiny amount of memory
once at startup, but it's easy to fix.

We could silence Coverity simply by moving the g_new() into the
if() block, but this use of g_new(MemoryRegion, 1) is a legacy from
when this board model was originally written; we wouldn't do that
if we wrote it today. The MemoryRegions are conceptually a part of
the board and must not go away until the whole board is done with
(at the end of the simulation), so they belong in its state struct.

This machine already has a VexpressMachineState struct that extends
MachineState, so statically put the MemoryRegions in there instead of
dynamically allocating them separately at runtime.

Spotted by Coverity (CID 1509083).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/vexpress.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 34b012b528b..56abadd9b8b 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -173,6 +173,11 @@ struct VexpressMachineClass {
 
 struct VexpressMachineState {
     MachineState parent;
+    MemoryRegion vram;
+    MemoryRegion sram;
+    MemoryRegion flashalias;
+    MemoryRegion lowram;
+    MemoryRegion a15sram;
     bool secure;
     bool virt;
 };
@@ -182,7 +187,7 @@ struct VexpressMachineState {
 #define TYPE_VEXPRESS_A15_MACHINE   MACHINE_TYPE_NAME("vexpress-a15")
 OBJECT_DECLARE_TYPE(VexpressMachineState, VexpressMachineClass, VEXPRESS_MACHINE)
 
-typedef void DBoardInitFn(const VexpressMachineState *machine,
+typedef void DBoardInitFn(VexpressMachineState *machine,
                           ram_addr_t ram_size,
                           const char *cpu_type,
                           qemu_irq *pic);
@@ -263,14 +268,13 @@ static void init_cpus(MachineState *ms, const char *cpu_type,
     }
 }
 
-static void a9_daughterboard_init(const VexpressMachineState *vms,
+static void a9_daughterboard_init(VexpressMachineState *vms,
                                   ram_addr_t ram_size,
                                   const char *cpu_type,
                                   qemu_irq *pic)
 {
     MachineState *machine = MACHINE(vms);
     MemoryRegion *sysmem = get_system_memory();
-    MemoryRegion *lowram = g_new(MemoryRegion, 1);
     ram_addr_t low_ram_size;
 
     if (ram_size > 0x40000000) {
@@ -287,9 +291,9 @@ static void a9_daughterboard_init(const VexpressMachineState *vms,
      * address space should in theory be remappable to various
      * things including ROM or RAM; we always map the RAM there.
      */
-    memory_region_init_alias(lowram, NULL, "vexpress.lowmem", machine->ram,
-                             0, low_ram_size);
-    memory_region_add_subregion(sysmem, 0x0, lowram);
+    memory_region_init_alias(&vms->lowram, NULL, "vexpress.lowmem",
+                             machine->ram, 0, low_ram_size);
+    memory_region_add_subregion(sysmem, 0x0, &vms->lowram);
     memory_region_add_subregion(sysmem, 0x60000000, machine->ram);
 
     /* 0x1e000000 A9MPCore (SCU) private memory region */
@@ -348,14 +352,13 @@ static VEDBoardInfo a9_daughterboard = {
     .init = a9_daughterboard_init,
 };
 
-static void a15_daughterboard_init(const VexpressMachineState *vms,
+static void a15_daughterboard_init(VexpressMachineState *vms,
                                    ram_addr_t ram_size,
                                    const char *cpu_type,
                                    qemu_irq *pic)
 {
     MachineState *machine = MACHINE(vms);
     MemoryRegion *sysmem = get_system_memory();
-    MemoryRegion *sram = g_new(MemoryRegion, 1);
 
     {
         /* We have to use a separate 64 bit variable here to avoid the gcc
@@ -386,9 +389,9 @@ static void a15_daughterboard_init(const VexpressMachineState *vms,
     /* 0x2b060000: SP805 watchdog: not modelled */
     /* 0x2b0a0000: PL341 dynamic memory controller: not modelled */
     /* 0x2e000000: system SRAM */
-    memory_region_init_ram(sram, NULL, "vexpress.a15sram", 0x10000,
+    memory_region_init_ram(&vms->a15sram, NULL, "vexpress.a15sram", 0x10000,
                            &error_fatal);
-    memory_region_add_subregion(sysmem, 0x2e000000, sram);
+    memory_region_add_subregion(sysmem, 0x2e000000, &vms->a15sram);
 
     /* 0x7ffb0000: DMA330 DMA controller: not modelled */
     /* 0x7ffd0000: PL354 static memory controller: not modelled */
@@ -547,10 +550,6 @@ static void vexpress_common_init(MachineState *machine)
     I2CBus *i2c;
     ram_addr_t vram_size, sram_size;
     MemoryRegion *sysmem = get_system_memory();
-    MemoryRegion *vram = g_new(MemoryRegion, 1);
-    MemoryRegion *sram = g_new(MemoryRegion, 1);
-    MemoryRegion *flashalias = g_new(MemoryRegion, 1);
-    MemoryRegion *flash0mem;
     const hwaddr *map = daughterboard->motherboard_map;
     int i;
 
@@ -662,24 +661,25 @@ static void vexpress_common_init(MachineState *machine)
 
     if (map[VE_NORFLASHALIAS] != -1) {
         /* Map flash 0 as an alias into low memory */
+        MemoryRegion *flash0mem;
         flash0mem = sysbus_mmio_get_region(SYS_BUS_DEVICE(pflash0), 0);
-        memory_region_init_alias(flashalias, NULL, "vexpress.flashalias",
+        memory_region_init_alias(&vms->flashalias, NULL, "vexpress.flashalias",
                                  flash0mem, 0, VEXPRESS_FLASH_SIZE);
-        memory_region_add_subregion(sysmem, map[VE_NORFLASHALIAS], flashalias);
+        memory_region_add_subregion(sysmem, map[VE_NORFLASHALIAS], &vms->flashalias);
     }
 
     dinfo = drive_get(IF_PFLASH, 0, 1);
     ve_pflash_cfi01_register(map[VE_NORFLASH1], "vexpress.flash1", dinfo);
 
     sram_size = 0x2000000;
-    memory_region_init_ram(sram, NULL, "vexpress.sram", sram_size,
+    memory_region_init_ram(&vms->sram, NULL, "vexpress.sram", sram_size,
                            &error_fatal);
-    memory_region_add_subregion(sysmem, map[VE_SRAM], sram);
+    memory_region_add_subregion(sysmem, map[VE_SRAM], &vms->sram);
 
     vram_size = 0x800000;
-    memory_region_init_ram(vram, NULL, "vexpress.vram", vram_size,
+    memory_region_init_ram(&vms->vram, NULL, "vexpress.vram", vram_size,
                            &error_fatal);
-    memory_region_add_subregion(sysmem, map[VE_VIDEORAM], vram);
+    memory_region_add_subregion(sysmem, map[VE_VIDEORAM], &vms->vram);
 
     /* 0x4e000000 LAN9118 Ethernet */
     if (nd_table[0].used) {
-- 
2.34.1


