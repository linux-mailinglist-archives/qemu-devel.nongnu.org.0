Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D60C4924B8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 12:28:15 +0100 (CET)
Received: from localhost ([::1]:57688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9mes-0002ol-3l
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 06:28:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1n9mV6-0001ke-TS
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:18:09 -0500
Received: from [2a00:1450:4864:20::32a] (port=38806
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1n9mV1-00079x-F6
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:18:08 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso4865786wmc.3
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 03:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2h42ynGbXaI87cDaxBSNmxdU88z9NJIqUugdycmoUHI=;
 b=Mh/lKo6E4GfNrwcB80WRvgPYINkGCtaytibCH0DcpDNO3rx6bh1x5ryZJWGr83ofHu
 n8lAF0OodFbKXkJYe2fNdMy99JxveIAKYM5VElfO93HfTcq/6wUiECosnA94x66XzQdQ
 rre6AqsjkJ5k7Els4IaXSRbDOZwHWBN5z7FJ1wY1jxLcGeoaKOsgMz1F69VsYsSgUjOW
 ZfB6wu5yo0vk/yJxEXZkm9FdKVSy5tYUg/ksZ2JHwpADA/Y1W1BioQI2YjK1nsc9VzH6
 AFHCj0F3Y2gQ/G7yvD3OW7VkdXhJ/y/ltcSWtf2Re+V60SPG0D+7nmWetXbaGuTNKhjZ
 5PqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2h42ynGbXaI87cDaxBSNmxdU88z9NJIqUugdycmoUHI=;
 b=rNm3QX45GTOYk7WoxWi3gazTr81R6mFOwcW/1xQvhpWWU5GV2frANZYQHY5hly8AG6
 vmko3H8b5TYy7AdpOrX/j2NnRJz3JDAzDF+deX+RHVlqJ0Mozk745cjpHz1Ttny9BSZ/
 E9jGb5V52kOnf6Fcr5T49lhmwa67iJgDccHTzL3D4J37NbDawByDqY/Lv6stl/CyV3ZK
 hgBx9dXsOuooVCiBcwEhf3YbE6/HjGBUSo+zQoA+wCuLghJ5FziJVEcLCwa8Oi72Ne1X
 XSE0fjrXN1BfGLpvhAGehEQuyI+wF5fuVZX1/vk02ZQIvjeO/kkfsTHyzX806qhDOzU7
 YnmQ==
X-Gm-Message-State: AOAM533JTnR2E0dmKSh9G7xHve60TSRjW4RXAub+2SS2c5R0xj9rYNXT
 AmjDu99MGHxEpSBIAMvwZeHgMw==
X-Google-Smtp-Source: ABdhPJwGh/U40LmGjRjdOJIcZgQnArmYutozTCH6oErXuaJ8DZgqjA3+CZOqQ4Z4o5GpZrEdFWG9vQ==
X-Received: by 2002:a5d:6dad:: with SMTP id u13mr18289687wrs.498.1642504682078; 
 Tue, 18 Jan 2022 03:18:02 -0800 (PST)
Received: from localhost.localdomain ([122.167.36.211])
 by smtp.gmail.com with ESMTPSA id p4sm2156939wmq.40.2022.01.18.03.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 03:18:01 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v2 1/3] hw/riscv: spike: Allow using binary firmware as bios
Date: Tue, 18 Jan 2022 16:47:34 +0530
Message-Id: <20220118111736.454150-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118111736.454150-1-apatel@ventanamicro.com>
References: <20220118111736.454150-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=apatel@ventanamicro.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Anup Patel <apatel@ventanamicro.com>, qemu-riscv@nongnu.org,
 Anup Patel <anup@brainfault.org>, qemu-devel@nongnu.org,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, we have to use OpenSBI firmware ELF as bios for the spike
machine because the HTIF console requires ELF for parsing "fromhost"
and "tohost" symbols.

The latest OpenSBI can now optionally pick-up HTIF register address
from HTIF DT node so using this feature spike machine can now use
OpenSBI firmware BIN as bios.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 hw/char/riscv_htif.c         | 33 +++++++++++++++++++----------
 hw/riscv/spike.c             | 41 ++++++++++++++++++++++--------------
 include/hw/char/riscv_htif.h |  5 ++++-
 include/hw/riscv/spike.h     |  1 +
 4 files changed, 52 insertions(+), 28 deletions(-)

diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index ddae738d56..729edbf968 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -228,13 +228,25 @@ static const MemoryRegionOps htif_mm_ops = {
     .write = htif_mm_write,
 };
 
+bool htif_uses_elf_symbols(void)
+{
+    return (address_symbol_set == 3) ? true : false;
+}
+
 HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
-    CPURISCVState *env, Chardev *chr)
+    CPURISCVState *env, Chardev *chr, uint64_t nonelf_base)
 {
-    uint64_t base = MIN(tohost_addr, fromhost_addr);
-    uint64_t size = MAX(tohost_addr + 8, fromhost_addr + 8) - base;
-    uint64_t tohost_offset = tohost_addr - base;
-    uint64_t fromhost_offset = fromhost_addr - base;
+    uint64_t base, size, tohost_offset, fromhost_offset;
+
+    if (!htif_uses_elf_symbols()) {
+        fromhost_addr = nonelf_base;
+        tohost_addr = nonelf_base + 8;
+    }
+
+    base = MIN(tohost_addr, fromhost_addr);
+    size = MAX(tohost_addr + 8, fromhost_addr + 8) - base;
+    tohost_offset = tohost_addr - base;
+    fromhost_offset = fromhost_addr - base;
 
     HTIFState *s = g_malloc0(sizeof(HTIFState));
     s->address_space = address_space;
@@ -249,12 +261,11 @@ HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
     qemu_chr_fe_init(&s->chr, chr, &error_abort);
     qemu_chr_fe_set_handlers(&s->chr, htif_can_recv, htif_recv, htif_event,
         htif_be_change, s, NULL, true);
-    if (address_symbol_set == 3) {
-        memory_region_init_io(&s->mmio, NULL, &htif_mm_ops, s,
-                              TYPE_HTIF_UART, size);
-        memory_region_add_subregion_overlap(address_space, base,
-                                            &s->mmio, 1);
-    }
+
+    memory_region_init_io(&s->mmio, NULL, &htif_mm_ops, s,
+                          TYPE_HTIF_UART, size);
+    memory_region_add_subregion_overlap(address_space, base,
+                                        &s->mmio, 1);
 
     return s;
 }
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 288d69cd9f..597df4c288 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -42,6 +42,7 @@
 
 static const MemMapEntry spike_memmap[] = {
     [SPIKE_MROM] =     {     0x1000,     0xf000 },
+    [SPIKE_HTIF] =     {  0x1000000,     0x1000 },
     [SPIKE_CLINT] =    {  0x2000000,    0x10000 },
     [SPIKE_DRAM] =     { 0x80000000,        0x0 },
 };
@@ -75,6 +76,10 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
 
     qemu_fdt_add_subnode(fdt, "/htif");
     qemu_fdt_setprop_string(fdt, "/htif", "compatible", "ucb,htif0");
+    if (!htif_uses_elf_symbols()) {
+        qemu_fdt_setprop_cells(fdt, "/htif", "reg",
+            0x0, memmap[SPIKE_HTIF].base, 0x0, memmap[SPIKE_HTIF].size);
+    }
 
     qemu_fdt_add_subnode(fdt, "/soc");
     qemu_fdt_setprop(fdt, "/soc", "ranges", NULL, 0);
@@ -172,6 +177,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
     if (cmdline) {
         qemu_fdt_add_subnode(fdt, "/chosen");
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
+        qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
     }
 }
 
@@ -241,10 +247,6 @@ static void spike_board_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[SPIKE_DRAM].base,
         machine->ram);
 
-    /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]));
-
     /* boot rom */
     memory_region_init_rom(mask_rom, NULL, "riscv.spike.mrom",
                            memmap[SPIKE_MROM].size, &error_fatal);
@@ -266,6 +268,7 @@ static void spike_board_init(MachineState *machine)
                                     htif_symbol_callback);
     }
 
+    /* Load kernel */
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
@@ -273,17 +276,6 @@ static void spike_board_init(MachineState *machine)
         kernel_entry = riscv_load_kernel(machine->kernel_filename,
                                          kernel_start_addr,
                                          htif_symbol_callback);
-
-        if (machine->initrd_filename) {
-            hwaddr start;
-            hwaddr end = riscv_load_initrd(machine->initrd_filename,
-                                           machine->ram_size, kernel_entry,
-                                           &start);
-            qemu_fdt_setprop_cell(s->fdt, "/chosen",
-                                  "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
-                                  end);
-        }
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
@@ -292,6 +284,22 @@ static void spike_board_init(MachineState *machine)
         kernel_entry = 0;
     }
 
+    /* Create device tree */
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
+               riscv_is_32bit(&s->soc[0]));
+
+    /* Load initrd */
+    if (machine->kernel_filename && machine->initrd_filename) {
+        hwaddr start;
+        hwaddr end = riscv_load_initrd(machine->initrd_filename,
+                                       machine->ram_size, kernel_entry,
+                                       &start);
+        qemu_fdt_setprop_cell(s->fdt, "/chosen",
+                              "linux,initrd-start", start);
+        qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
+                              end);
+    }
+
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
                                    machine->ram_size, s->fdt);
@@ -303,7 +311,8 @@ static void spike_board_init(MachineState *machine)
 
     /* initialize HTIF using symbols found in load_kernel */
     htif_mm_init(system_memory, mask_rom,
-                 &s->soc[0].harts[0].env, serial_hd(0));
+                 &s->soc[0].harts[0].env, serial_hd(0),
+                 memmap[SPIKE_HTIF].base);
 }
 
 static void spike_machine_instance_init(Object *obj)
diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
index fb9452cf51..f888ac1b30 100644
--- a/include/hw/char/riscv_htif.h
+++ b/include/hw/char/riscv_htif.h
@@ -52,8 +52,11 @@ extern const MemoryRegionOps htif_io_ops;
 void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
     uint64_t st_size);
 
+/* Check if HTIF uses ELF symbols */
+bool htif_uses_elf_symbols(void);
+
 /* legacy pre qom */
 HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
-    CPURISCVState *env, Chardev *chr);
+    CPURISCVState *env, Chardev *chr, uint64_t nonelf_base);
 
 #endif
diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h
index cdd1a13011..73d69234de 100644
--- a/include/hw/riscv/spike.h
+++ b/include/hw/riscv/spike.h
@@ -43,6 +43,7 @@ struct SpikeState {
 
 enum {
     SPIKE_MROM,
+    SPIKE_HTIF,
     SPIKE_CLINT,
     SPIKE_DRAM
 };
-- 
2.25.1


