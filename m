Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D40C20A9DD
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 02:35:16 +0200 (CEST)
Received: from localhost ([::1]:54234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jocKp-0000V7-Fx
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 20:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=4399c1bdf=atish.patra@wdc.com>)
 id 1jocJB-0007aP-H4; Thu, 25 Jun 2020 20:33:33 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:7890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=4399c1bdf=atish.patra@wdc.com>)
 id 1jocJ5-0002rQ-Ts; Thu, 25 Jun 2020 20:33:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593131607; x=1624667607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YbakJGAuPbHr5N0Z3wSC+Uuh8Zrgyjou9P0GpC93Kwg=;
 b=FgCmRV8DxksJ3gy0se+TWwozOw/OMhaTzldSfzBFuEJbxl2MysTOoHcT
 zMYL8qCB7xvR49DB3TbtAAjRSkM18J2votooL+n5lOoQik8S9RnbJPCGd
 qlg1aPxMMd4gz3dc62lcdJRP1eookmVIwwHKtQ6V36bXMRnpKRInbLMQa
 LepXa0+i4CYrsv5hSRNeP5WShatkUsRHgIAwVSnVzkeek3c+pj8WB9I+W
 kBwE1rRfzTuS/ZXbVeqpKIp/y1nIGVPkBv/2iFtUoogalPGNNwaWKu5Rp
 kGUUXbxfPYd+u5Vyn9yzx1C0Wco/kPR0w1nogtoSC7DQXtL2WbK8LcUt7 g==;
IronPort-SDR: htYId+fqjj8lK+DNeJ95e87ck3Yc/JoNMhjs1ruTXaaX4/V9FWQwm0SP/TBlh3t+VKnEUoZvRd
 yUNPMSaH+FlBpursXwlgCxL1TPSlJWa3S+LR0hW9KL+5sI3D1pw65BPrIfbKm4XDOFChdzDDN1
 CAdSaoDLtpkJBg5iQi/gu9WeyATzj8+ioJ8dqZZxnWsELWSCheeEdvOUjh69izf9S1mTZ6TA+J
 NAPPgnqTZEq1ReunaYiTWNo7xTXJxsPBW3F0iqq71X6kr48Ok+VbJJ7Nvf5o2c9B2mICpQMugf
 odg=
X-IronPort-AV: E=Sophos;i="5.75,281,1589212800"; d="scan'208";a="140958186"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jun 2020 08:33:19 +0800
IronPort-SDR: tH0hzd/ENAuCUYSxmw0+pUoFHgy4xcIPZHlGbD5Jvaq5MaFfLdUy3OR416Z7VpTt6PBVdzsesA
 PpiEWoP1Em2O6eCeOU0jdlsZMN1xjp6Ww=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 17:21:45 -0700
IronPort-SDR: Yvg1hWvnnsDju+oMxECDP7Y6ONXVQsJiozGTUSDL6A2i3TGefqXRAmxfA5GYf8JQwR5IyxeBoQ
 I1ECTXx96Khg==
WDCIronportException: Internal
Received: from usa003490.ad.shared (HELO yoda.hgst.com) ([10.86.58.205])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Jun 2020 17:33:19 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] RISC-V: Copy the fdt in dram instead of ROM
Date: Thu, 25 Jun 2020 17:33:12 -0700
Message-Id: <20200626003313.715355-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200626003313.715355-1-atish.patra@wdc.com>
References: <20200626003313.715355-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=4399c1bdf=atish.patra@wdc.com; helo=esa4.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 20:33:16
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
 hw/riscv/boot.c         | 57 +++++++++++++++++++++++++++++------------
 hw/riscv/sifive_u.c     | 32 +++++++++++------------
 hw/riscv/spike.c        |  7 ++++-
 hw/riscv/virt.c         |  7 ++++-
 include/hw/riscv/boot.h |  5 +++-
 5 files changed, 71 insertions(+), 37 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 482b78147993..02c4018a8105 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -159,44 +159,67 @@ hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
     return *start + size;
 }
 
+hwaddr riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
+{
+    hwaddr temp, fdt_addr;
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
+    qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
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
+                               hwaddr fdt_load_addr, void *fdt)
 {
     int i;
     /* reset vector */
-    uint32_t reset_vec[8] = {
-        0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(dtb) */
-        0x02028593,                  /*     addi   a1, t0, %pcrel_lo(1b) */
+    uint32_t reset_vec[10] = {
+        0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(fw_dyn) */
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
         0x00000000,
-                                     /* dtb: */
+        fdt_load_addr,               /* fdt_laddr: .dword */
+        0x00000000,
+                                     /* fw_dyn: */
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
index 395b21703ab4..7d39a4e4ec6d 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -379,6 +379,7 @@ static void sifive_u_machine_init(MachineState *machine)
     MemoryRegion *flash0 = g_new(MemoryRegion, 1);
     target_ulong start_addr = memmap[SIFIVE_U_DRAM].base;
     int i;
+    hwaddr fdt_load_addr;
 
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
-        0x00000297,                    /* 1:  auipc  t0, %pcrel_hi(dtb) */
-        0x01c28593,                    /*     addi   a1, t0, %pcrel_lo(1b) */
+        0x00000297,                    /* 1:  auipc  t0, %pcrel_hi(fw_dyn) */
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
-                                       /* dtb: */
+        0x00000000,
+        fdt_load_addr,                 /* fdt_laddr: .dword */
+        0x00000000,
+                                       /* fw_dyn: */
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
index c696077cbc16..69f050c07e5a 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -163,6 +163,7 @@ static void spike_board_init(MachineState *machine)
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     unsigned int smp_cpus = machine->smp.cpus;
+    hwaddr fdt_load_addr;
 
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
index 8ec77e43de26..639e284fc2e3 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -478,6 +478,7 @@ static void virt_machine_init(MachineState *machine)
     char *plic_hart_config;
     size_t plic_hart_config_len;
     target_ulong start_addr = memmap[VIRT_DRAM].base;
+    hwaddr fdt_load_addr;
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
index 3e9759c89aa2..f64fcadd2390 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -35,7 +35,10 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
                                symbol_fn_t sym_cb);
 hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
                          uint64_t kernel_entry, hwaddr *start);
+hwaddr riscv_load_fdt(hwaddr dram_start, uint64_t dram_size,
+                                void *fdt);
 void riscv_setup_rom_reset_vec(hwaddr saddr, hwaddr rom_base,
-                               hwaddr rom_size, void *fdt);
+                               hwaddr rom_size,
+                               hwaddr fdt_load_addr, void *fdt);
 
 #endif /* RISCV_BOOT_H */
-- 
2.26.2


