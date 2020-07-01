Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E78372112ED
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 20:42:40 +0200 (CEST)
Received: from localhost ([::1]:36604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqhgu-0004xm-1k
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 14:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=4447ca4a2=atish.patra@wdc.com>)
 id 1jqheQ-000143-Og; Wed, 01 Jul 2020 14:40:06 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:13131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=4447ca4a2=atish.patra@wdc.com>)
 id 1jqheN-0006SU-A5; Wed, 01 Jul 2020 14:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593628803; x=1625164803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3Zf/h0iJMxOuCa9lL9ARuWO8J3Sh8b0yE0djnI+dK8g=;
 b=oCGEKfzVPeu8aSVYrJe966mFftZq/RWbu6Pe2lx3Azt/HlgfUIFD3dp5
 F6T6zzh1WtNPZublz9u46G9XBOxiGi8vRiHMLmg9c+F2N53182eivvb9n
 q6jZedr1BRVF4lxizTyVzByVGvYevDzqkJLMq2VYMEtyBwqyLI6UfdE9s
 D9QhrmYXlg5d2NQ17/9x2ZmBE8ktgGEgD0C1xNLbtfgPQmqebSJ0mRNzA
 nw1KmHyJtBKAHJUXA52h/J1jRhXhQ0pBu9I0v9ObMzkkMcBjT8CMAJHTA
 29bJ0Zbz7MK+aKfPN5Ss3uPC7CPNSEKN/6rXUnFZD2t7NQ8mAldcAIcYJ w==;
IronPort-SDR: N3t9WSd0lYuu8v1I0xT6fj4n58WF845ipA3rgoF5RUr11+FuXnygZe13BT8Iw7/AIKvcXsWyj0
 /7xt/+9R/WHWujjNQsS/vGcVdLObMY8DokNDRGOgIq+QL9AjXvcFUvi8VVGetBcajLebp0zh5A
 uxnZXX0Pqfg+6LURZe5Acf9E50KdBASj7P6A0s1R0y8KeaKGNu2QOyz3koDaXarMHxYOX+ZN9h
 cmFokToZ8ikKQX2LejQ9AI+ONQob2YzHEj/wIyt7NDNB0x5vCr9hXSC5iN1nEOFpvgmIdDKTH8
 y70=
X-IronPort-AV: E=Sophos;i="5.75,301,1589212800"; d="scan'208";a="250642371"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Jul 2020 02:39:54 +0800
IronPort-SDR: jPygo1kAub3xh7evZAWAeHxGQF1dlNEk9sxNggUdQx5mvIdtZsDcgpJvTLdeXqKVDHl29Zr73W
 excv+JuQjXg8OylOO1xmYgcbhojLnY6q8=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:28:11 -0700
IronPort-SDR: whw3gcJgFugFzSkGShjHL3rpdQu4qP+Xov1SXNsNhu4NWUfOXDQ/oKx+cpPC2cnQcA98pE3uyn
 VqFdEDWDl37A==
WDCIronportException: Internal
Received: from cnf006900.ad.shared (HELO yoda.hgst.com) ([10.86.58.95])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Jul 2020 11:39:54 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/4] RISC-V: Copy the fdt in dram instead of ROM
Date: Wed,  1 Jul 2020 11:39:47 -0700
Message-Id: <20200701183949.398134-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200701183949.398134-1-atish.patra@wdc.com>
References: <20200701183949.398134-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=4447ca4a2=atish.patra@wdc.com; helo=esa1.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/01 14:39:54
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Alexander Richardson <Alexander.Richardson@cl.cam.ac.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, the fdt is copied to the ROM after the reset vector. The firmware
has to copy it to DRAM. Instead of this, directly copy the device tree to a
pre-computed dram address. The device tree load address should be as far as
possible from kernel and initrd images. That's why it is kept at the end of
the DRAM or 4GB whichever is lesser.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/boot.c         | 53 +++++++++++++++++++++++++++++------------
 hw/riscv/sifive_u.c     | 28 ++++++++++------------
 hw/riscv/spike.c        |  7 +++++-
 hw/riscv/virt.c         |  7 +++++-
 include/hw/riscv/boot.h |  4 +++-
 5 files changed, 66 insertions(+), 33 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 3df802380a36..c62f545f15e7 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -159,45 +159,68 @@ hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
     return *start + size;
 }
 
+uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
+{
+    uint32_t temp, fdt_addr;
+    hwaddr dram_end = dram_base + mem_size;
+    int fdtsize = fdt_totalsize(fdt);
+
+    if (fdtsize <= 0) {
+        error_report("invalid device-tree");
+        exit(1);
+    }
+
+    /*
+     * We should put fdt as far as possible to avoid kernel/initrd overwriting
+     * its content. But it should be addressable by 32 bit system as well.
+     * Thus, put it at an aligned address that less than fdt size from end of
+     * dram or 4GB whichever is lesser.
+     */
+    temp = MIN(dram_end, 4096 * MiB);
+    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
+
+    fdt_pack(fdt);
+    /* copy in the device tree */
+    qemu_fdt_dumpdtb(fdt, fdtsize);
+
+    rom_add_blob_fixed_as("fdt", fdt, fdtsize, fdt_addr,
+                          &address_space_memory);
+
+    return fdt_addr;
+}
+
 void riscv_setup_rom_reset_vec(hwaddr start_addr, hwaddr rom_base,
-                               hwaddr rom_size, void *fdt)
+                               hwaddr rom_size,
+                               uint32_t fdt_load_addr, void *fdt)
 {
     int i;
 
     /* reset vector */
-    uint32_t reset_vec[8] = {
+    uint32_t reset_vec[10] = {
         0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(dtb) */
-        0x02028593,                  /*     addi   a1, t0, %pcrel_lo(1b) */
         0xf1402573,                  /*     csrr   a0, mhartid  */
 #if defined(TARGET_RISCV32)
+        0x0202a583,                  /*     lw     a1, 32(t0) */
         0x0182a283,                  /*     lw     t0, 24(t0) */
 #elif defined(TARGET_RISCV64)
+        0x0202b583,                  /*     ld     a1, 32(t0) */
         0x0182b283,                  /*     ld     t0, 24(t0) */
 #endif
         0x00028067,                  /*     jr     t0 */
         0x00000000,
         start_addr,                  /* start: .dword */
+        0x00000000,
+        fdt_load_addr,               /* fdt_laddr: .dword */
         0x00000000,
                                      /* dtb: */
     };
 
     /* copy in the reset vector in little_endian byte order */
-    for (i = 0; i < sizeof(reset_vec) >> 2; i++) {
+    for (i = 0; i < ARRAY_SIZE(reset_vec); i++) {
         reset_vec[i] = cpu_to_le32(reset_vec[i]);
     }
     rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
                           rom_base, &address_space_memory);
 
-    /* copy in the device tree */
-    if (fdt_pack(fdt) || fdt_totalsize(fdt) >
-        rom_size - sizeof(reset_vec)) {
-        error_report("not enough space to store device-tree");
-        exit(1);
-    }
-    qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
-    rom_add_blob_fixed_as("mrom.fdt", fdt, fdt_totalsize(fdt),
-                           rom_base + sizeof(reset_vec),
-                           &address_space_memory);
-
     return;
 }
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 395b21703ab4..aed814da9b94 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -379,6 +379,7 @@ static void sifive_u_machine_init(MachineState *machine)
     MemoryRegion *flash0 = g_new(MemoryRegion, 1);
     target_ulong start_addr = memmap[SIFIVE_U_DRAM].base;
     int i;
+    uint32_t fdt_load_addr;
 
     /* Initialize SoC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RISCV_U_SOC);
@@ -450,40 +451,37 @@ static void sifive_u_machine_init(MachineState *machine)
         }
     }
 
+    /* Compute the fdt load address in dram */
+    fdt_load_addr = riscv_load_fdt(memmap[SIFIVE_U_DRAM].base,
+                                   machine->ram_size, s->fdt);
+
     /* reset vector */
-    uint32_t reset_vec[8] = {
+    uint32_t reset_vec[11] = {
         s->msel,                       /* MSEL pin state */
         0x00000297,                    /* 1:  auipc  t0, %pcrel_hi(dtb) */
-        0x01c28593,                    /*     addi   a1, t0, %pcrel_lo(1b) */
         0xf1402573,                    /*     csrr   a0, mhartid  */
 #if defined(TARGET_RISCV32)
+        0x0202a583,                    /*     lw     a1, 32(t0) */
         0x0182a283,                    /*     lw     t0, 24(t0) */
 #elif defined(TARGET_RISCV64)
-        0x0182e283,                    /*     lwu    t0, 24(t0) */
+        0x0202b583,                    /*     ld     a1, 32(t0) */
+        0x0182b283,                    /*     ld     t0, 24(t0) */
 #endif
         0x00028067,                    /*     jr     t0 */
         0x00000000,
         start_addr,                    /* start: .dword */
+        0x00000000,
+        fdt_load_addr,                 /* fdt_laddr: .dword */
+        0x00000000,
                                        /* dtb: */
     };
 
     /* copy in the reset vector in little_endian byte order */
-    for (i = 0; i < sizeof(reset_vec) >> 2; i++) {
+    for (i = 0; i < ARRAY_SIZE(reset_vec); i++) {
         reset_vec[i] = cpu_to_le32(reset_vec[i]);
     }
     rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
                           memmap[SIFIVE_U_MROM].base, &address_space_memory);
-
-    /* copy in the device tree */
-    if (fdt_pack(s->fdt) || fdt_totalsize(s->fdt) >
-            memmap[SIFIVE_U_MROM].size - sizeof(reset_vec)) {
-        error_report("not enough space to store device-tree");
-        exit(1);
-    }
-    qemu_fdt_dumpdtb(s->fdt, fdt_totalsize(s->fdt));
-    rom_add_blob_fixed_as("mrom.fdt", s->fdt, fdt_totalsize(s->fdt),
-                          memmap[SIFIVE_U_MROM].base + sizeof(reset_vec),
-                          &address_space_memory);
 }
 
 static bool sifive_u_machine_get_start_in_flash(Object *obj, Error **errp)
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index c696077cbc16..5b04562dd106 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -163,6 +163,7 @@ static void spike_board_init(MachineState *machine)
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     unsigned int smp_cpus = machine->smp.cpus;
+    uint32_t fdt_load_addr;
 
     /* Initialize SOC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc,
@@ -208,9 +209,13 @@ static void spike_board_init(MachineState *machine)
         }
     }
 
+    /* Compute the fdt load address in dram */
+    fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
+                                   machine->ram_size, s->fdt);
     /* load the reset vector */
     riscv_setup_rom_reset_vec(memmap[SPIKE_DRAM].base, memmap[SPIKE_MROM].base,
-                              memmap[SPIKE_MROM].size, s->fdt);
+                              memmap[SPIKE_MROM].size,
+                              fdt_load_addr, s->fdt);
 
     /* initialize HTIF using symbols found in load_kernel */
     htif_mm_init(system_memory, mask_rom, &s->soc.harts[0].env, serial_hd(0));
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 8ec77e43de26..3b3cc44912f4 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -478,6 +478,7 @@ static void virt_machine_init(MachineState *machine)
     char *plic_hart_config;
     size_t plic_hart_config_len;
     target_ulong start_addr = memmap[VIRT_DRAM].base;
+    uint32_t fdt_load_addr;
     int i;
     unsigned int smp_cpus = machine->smp.cpus;
 
@@ -532,9 +533,13 @@ static void virt_machine_init(MachineState *machine)
         start_addr = virt_memmap[VIRT_FLASH].base;
     }
 
+    /* Compute the fdt load address in dram */
+    fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
+                                   machine->ram_size, s->fdt);
     /* load the reset vector */
     riscv_setup_rom_reset_vec(start_addr, virt_memmap[VIRT_MROM].base,
-                              virt_memmap[VIRT_MROM].size, s->fdt);
+                              virt_memmap[VIRT_MROM].size,
+                              fdt_load_addr, s->fdt);
 
     /* create PLIC hart topology configuration string */
     plic_hart_config_len = (strlen(VIRT_PLIC_HART_CONFIG) + 1) * smp_cpus;
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 3e9759c89aa2..35b6ddf710d7 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -35,7 +35,9 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
                                symbol_fn_t sym_cb);
 hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
                          uint64_t kernel_entry, hwaddr *start);
+uint32_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
 void riscv_setup_rom_reset_vec(hwaddr saddr, hwaddr rom_base,
-                               hwaddr rom_size, void *fdt);
+                               hwaddr rom_size,
+                               uint32_t fdt_load_addr, void *fdt);
 
 #endif /* RISCV_BOOT_H */
-- 
2.26.2


