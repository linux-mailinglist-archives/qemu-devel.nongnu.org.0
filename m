Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD452112EE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 20:42:42 +0200 (CEST)
Received: from localhost ([::1]:36648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqhgv-0004yn-7v
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 14:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=4447ca4a2=atish.patra@wdc.com>)
 id 1jqheQ-00012V-0d; Wed, 01 Jul 2020 14:40:06 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:13124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=4447ca4a2=atish.patra@wdc.com>)
 id 1jqheN-0006Qb-Jz; Wed, 01 Jul 2020 14:40:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593628803; x=1625164803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BvWBvty4qCBpcREE0bbUuxJD53acSp3ctXnMrDTq4Ts=;
 b=QDYqAUeOriU/PrRRmPynrn7LVIQzFLGoRUkHRoTr5Bnx/Bph+eoirzzZ
 H4SBh7bLHdhns3q05xR+fY1ihaJJLgigAHPA1pFfY3EXDAP4A9mnmsD2E
 44VNmF33oAUf4TseBnSxH+njdxu5gHtdUof/LIlCxmuXfSKAQFifjxLM+
 0SbJgjuM3V/m0zRxKEnumDCB2onmWy0BbC5qEHCPfn1oTrVEtMUI64kXW
 8qSSnreZ6L7uHSUxYKIBbMQ4sy068MBPZymNExnYh6tMJcActHL9SWNYt
 v6bwIxN17jZez5yJd+mZRQKXiPDESPRZcCoAWYfCwARWWuvxnuNJLERVz Q==;
IronPort-SDR: 7LRbu3RSuCvqLUDXgD21L0pcKbcyc7OuVz3LRzQSkQyTQi5xBDuI6/aEhXEvLt5PqxEuMD5HpJ
 xJVn67p7yi2tUkJefnhpWeUETrxgA8Kb5WVNlPbika4YF9/SXsBBY6h/2G7LaV1hto3a3lL+sE
 Fzat6KQ65TOivVwnH/OSx5Qn9lo3sLVOxW+qB0iEhzPYx4Bfj8WXI0NdYJMM42rF8C5kD+ad4q
 0KigFSlaryXbSWJoHd4/HcqB0JWpeNb5EmX+8Myb3v/OXdyUakiJz7sVdQLUmnutkAZ+H4TFQk
 K8s=
X-IronPort-AV: E=Sophos;i="5.75,301,1589212800"; d="scan'208";a="250642375"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Jul 2020 02:39:54 +0800
IronPort-SDR: jjnOKh6XZPCWmFSsLrR7mvk1z2n4jxE9bZVRaRqPwqvI5JE25L8eejYOfpMHQ6feZEDC9NwQEP
 k5RARxkUYQhNyLq9zZytHAdT0qWhyfS50=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:28:11 -0700
IronPort-SDR: 6qIJKJET4wN0F6FtFwDmXUdyiF+tPpCx2X2IwfhNe8xVfBECMiYoyME6JfQW6oXc0tkP6K6FRp
 i/MmAp24fnNw==
WDCIronportException: Internal
Received: from cnf006900.ad.shared (HELO yoda.hgst.com) ([10.86.58.95])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Jul 2020 11:39:54 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/4] riscv: Add opensbi firmware dynamic support
Date: Wed,  1 Jul 2020 11:39:48 -0700
Message-Id: <20200701183949.398134-4-atish.patra@wdc.com>
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

OpenSBI is the default firmware in Qemu and has various firmware loading
options. Currently, qemu loader uses fw_jump which has a compile time
pre-defined address where fdt & kernel image must reside. This puts a
constraint on image size of the Linux kernel depending on the fdt location
and available memory. However, fw_dynamic allows the loader to specify
the next stage location (i.e. Linux kernel/U-Boot) in memory and other
configurable boot options available in OpenSBI.

Add support for OpenSBI dynamic firmware loading support. This doesn't
break existing setup and fw_jump will continue to work as it is. Any
other firmware will continue to work without any issues as long as it
doesn't expect anything specific from loader in "a2" register.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/boot.c                 | 42 +++++++++++++++++++++---
 hw/riscv/sifive_u.c             | 20 +++++++++---
 hw/riscv/spike.c                | 13 ++++++--
 hw/riscv/virt.c                 | 12 +++++--
 include/hw/riscv/boot.h         |  5 ++-
 include/hw/riscv/boot_opensbi.h | 58 +++++++++++++++++++++++++++++++++
 6 files changed, 134 insertions(+), 16 deletions(-)
 create mode 100644 include/hw/riscv/boot_opensbi.h

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index c62f545f15e7..feff6e3f4ed5 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -25,6 +25,7 @@
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "hw/riscv/boot.h"
+#include "hw/riscv/boot_opensbi.h"
 #include "elf.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/qtest.h"
@@ -33,8 +34,10 @@
 
 #if defined(TARGET_RISCV32)
 # define KERNEL_BOOT_ADDRESS 0x80400000
+#define fw_dynamic_info_data(__val)     cpu_to_le32(__val)
 #else
 # define KERNEL_BOOT_ADDRESS 0x80200000
+#define fw_dynamic_info_data(__val)     cpu_to_le64(__val)
 #endif
 
 void riscv_find_and_load_firmware(MachineState *machine,
@@ -189,15 +192,45 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
     return fdt_addr;
 }
 
+void riscv_rom_copy_firmware_info(hwaddr rom_base, hwaddr rom_size,
+                              uint32_t reset_vec_size, uint64_t kernel_entry)
+{
+    struct fw_dynamic_info dinfo;
+    size_t dinfo_len;
+
+    dinfo.magic = fw_dynamic_info_data(FW_DYNAMIC_INFO_MAGIC_VALUE);
+    dinfo.version = fw_dynamic_info_data(FW_DYNAMIC_INFO_VERSION);
+    dinfo.next_mode = fw_dynamic_info_data(FW_DYNAMIC_INFO_NEXT_MODE_S);
+    dinfo.next_addr = fw_dynamic_info_data(kernel_entry);
+    dinfo.options = 0;
+    dinfo.boot_hart = 0;
+    dinfo_len = sizeof(dinfo);
+
+    /**
+     * copy the dynamic firmware info. This information is specific to
+     * OpenSBI but doesn't break any other firmware as long as they don't
+     * expect any certain value in "a2" register.
+     */
+    if (dinfo_len > (rom_size - reset_vec_size)) {
+        error_report("not enough space to store dynamic firmware info");
+        exit(1);
+    }
+
+    rom_add_blob_fixed_as("mrom.finfo", &dinfo, dinfo_len,
+                           rom_base + reset_vec_size,
+                           &address_space_memory);
+}
+
 void riscv_setup_rom_reset_vec(hwaddr start_addr, hwaddr rom_base,
-                               hwaddr rom_size,
+                               hwaddr rom_size, uint64_t kernel_entry,
                                uint32_t fdt_load_addr, void *fdt)
 {
     int i;
 
     /* reset vector */
     uint32_t reset_vec[10] = {
-        0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(dtb) */
+        0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(fw_dyn) */
+        0x02828613,                  /*     addi   a2, t0, %pcrel_lo(1b) */
         0xf1402573,                  /*     csrr   a0, mhartid  */
 #if defined(TARGET_RISCV32)
         0x0202a583,                  /*     lw     a1, 32(t0) */
@@ -207,12 +240,11 @@ void riscv_setup_rom_reset_vec(hwaddr start_addr, hwaddr rom_base,
         0x0182b283,                  /*     ld     t0, 24(t0) */
 #endif
         0x00028067,                  /*     jr     t0 */
-        0x00000000,
         start_addr,                  /* start: .dword */
         0x00000000,
         fdt_load_addr,               /* fdt_laddr: .dword */
         0x00000000,
-                                     /* dtb: */
+                                     /* fw_dyn: */
     };
 
     /* copy in the reset vector in little_endian byte order */
@@ -221,6 +253,8 @@ void riscv_setup_rom_reset_vec(hwaddr start_addr, hwaddr rom_base,
     }
     rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
                           rom_base, &address_space_memory);
+    riscv_rom_copy_firmware_info(rom_base, rom_size, sizeof(reset_vec),
+                                 kernel_entry);
 
     return;
 }
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index aed814da9b94..901efab9d5bd 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -380,6 +380,7 @@ static void sifive_u_machine_init(MachineState *machine)
     target_ulong start_addr = memmap[SIFIVE_U_DRAM].base;
     int i;
     uint32_t fdt_load_addr;
+    uint64_t kernel_entry;
 
     /* Initialize SoC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RISCV_U_SOC);
@@ -436,8 +437,7 @@ static void sifive_u_machine_init(MachineState *machine)
     riscv_find_and_load_firmware(machine, BIOS_FILENAME, start_addr, NULL);
 
     if (machine->kernel_filename) {
-        uint64_t kernel_entry = riscv_load_kernel(machine->kernel_filename,
-                                                  NULL);
+        kernel_entry = riscv_load_kernel(machine->kernel_filename, NULL);
 
         if (machine->initrd_filename) {
             hwaddr start;
@@ -449,6 +449,12 @@ static void sifive_u_machine_init(MachineState *machine)
             qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
                                   end);
         }
+    } else {
+       /*
+        * If dynamic firmware is used, it doesn't know where is the next mode
+        * if kernel argument is not set.
+        */
+        kernel_entry = 0;
     }
 
     /* Compute the fdt load address in dram */
@@ -458,7 +464,8 @@ static void sifive_u_machine_init(MachineState *machine)
     /* reset vector */
     uint32_t reset_vec[11] = {
         s->msel,                       /* MSEL pin state */
-        0x00000297,                    /* 1:  auipc  t0, %pcrel_hi(dtb) */
+        0x00000297,                    /* 1:  auipc  t0, %pcrel_hi(fw_dyn) */
+        0x02828613,                    /*     addi   a2, t0, %pcrel_lo(1b) */
         0xf1402573,                    /*     csrr   a0, mhartid  */
 #if defined(TARGET_RISCV32)
         0x0202a583,                    /*     lw     a1, 32(t0) */
@@ -468,12 +475,11 @@ static void sifive_u_machine_init(MachineState *machine)
         0x0182b283,                    /*     ld     t0, 24(t0) */
 #endif
         0x00028067,                    /*     jr     t0 */
-        0x00000000,
         start_addr,                    /* start: .dword */
         0x00000000,
         fdt_load_addr,                 /* fdt_laddr: .dword */
         0x00000000,
-                                       /* dtb: */
+                                       /* fw_dyn: */
     };
 
     /* copy in the reset vector in little_endian byte order */
@@ -482,6 +488,10 @@ static void sifive_u_machine_init(MachineState *machine)
     }
     rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
                           memmap[SIFIVE_U_MROM].base, &address_space_memory);
+
+    riscv_rom_copy_firmware_info(memmap[SIFIVE_U_MROM].base,
+                                 memmap[SIFIVE_U_MROM].size,
+                                 sizeof(reset_vec), kernel_entry);
 }
 
 static bool sifive_u_machine_get_start_in_flash(Object *obj, Error **errp)
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 5b04562dd106..b295a4319775 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -164,6 +164,7 @@ static void spike_board_init(MachineState *machine)
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     unsigned int smp_cpus = machine->smp.cpus;
     uint32_t fdt_load_addr;
+    uint64_t kernel_entry;
 
     /* Initialize SOC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc,
@@ -194,8 +195,8 @@ static void spike_board_init(MachineState *machine)
                                  htif_symbol_callback);
 
     if (machine->kernel_filename) {
-        uint64_t kernel_entry = riscv_load_kernel(machine->kernel_filename,
-                                                  htif_symbol_callback);
+        kernel_entry = riscv_load_kernel(machine->kernel_filename,
+                                         htif_symbol_callback);
 
         if (machine->initrd_filename) {
             hwaddr start;
@@ -207,6 +208,12 @@ static void spike_board_init(MachineState *machine)
             qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
                                   end);
         }
+    } else {
+       /*
+        * If dynamic firmware is used, it doesn't know where is the next mode
+        * if kernel argument is not set.
+        */
+        kernel_entry = 0;
     }
 
     /* Compute the fdt load address in dram */
@@ -214,7 +221,7 @@ static void spike_board_init(MachineState *machine)
                                    machine->ram_size, s->fdt);
     /* load the reset vector */
     riscv_setup_rom_reset_vec(memmap[SPIKE_DRAM].base, memmap[SPIKE_MROM].base,
-                              memmap[SPIKE_MROM].size,
+                              memmap[SPIKE_MROM].size, kernel_entry,
                               fdt_load_addr, s->fdt);
 
     /* initialize HTIF using symbols found in load_kernel */
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3b3cc44912f4..85e17feaf84b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -479,6 +479,7 @@ static void virt_machine_init(MachineState *machine)
     size_t plic_hart_config_len;
     target_ulong start_addr = memmap[VIRT_DRAM].base;
     uint32_t fdt_load_addr;
+    uint64_t kernel_entry;
     int i;
     unsigned int smp_cpus = machine->smp.cpus;
 
@@ -510,8 +511,7 @@ static void virt_machine_init(MachineState *machine)
                                  memmap[VIRT_DRAM].base, NULL);
 
     if (machine->kernel_filename) {
-        uint64_t kernel_entry = riscv_load_kernel(machine->kernel_filename,
-                                                  NULL);
+        kernel_entry = riscv_load_kernel(machine->kernel_filename, NULL);
 
         if (machine->initrd_filename) {
             hwaddr start;
@@ -523,6 +523,12 @@ static void virt_machine_init(MachineState *machine)
             qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
                                   end);
         }
+    } else {
+       /*
+        * If dynamic firmware is used, it doesn't know where is the next mode
+        * if kernel argument is not set.
+        */
+        kernel_entry = 0;
     }
 
     if (drive_get(IF_PFLASH, 0, 0)) {
@@ -538,7 +544,7 @@ static void virt_machine_init(MachineState *machine)
                                    machine->ram_size, s->fdt);
     /* load the reset vector */
     riscv_setup_rom_reset_vec(start_addr, virt_memmap[VIRT_MROM].base,
-                              virt_memmap[VIRT_MROM].size,
+                              virt_memmap[VIRT_MROM].size, kernel_entry,
                               fdt_load_addr, s->fdt);
 
     /* create PLIC hart topology configuration string */
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 35b6ddf710d7..451338780a45 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -37,7 +37,10 @@ hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
                          uint64_t kernel_entry, hwaddr *start);
 uint32_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
 void riscv_setup_rom_reset_vec(hwaddr saddr, hwaddr rom_base,
-                               hwaddr rom_size,
+                               hwaddr rom_size, uint64_t kernel_entry,
                                uint32_t fdt_load_addr, void *fdt);
+void riscv_rom_copy_firmware_info(hwaddr rom_base, hwaddr rom_size,
+                                  uint32_t reset_vec_size,
+                                  uint64_t kernel_entry);
 
 #endif /* RISCV_BOOT_H */
diff --git a/include/hw/riscv/boot_opensbi.h b/include/hw/riscv/boot_opensbi.h
new file mode 100644
index 000000000000..0d5ddd6c3daf
--- /dev/null
+++ b/include/hw/riscv/boot_opensbi.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+/*
+ * Copyright (c) 2019 Western Digital Corporation or its affiliates.
+ *
+ * Based on include/sbi/{fw_dynamic.h,sbi_scratch.h} from the OpenSBI project.
+ */
+#ifndef OPENSBI_H
+#define OPENSBI_H
+
+/** Expected value of info magic ('OSBI' ascii string in hex) */
+#define FW_DYNAMIC_INFO_MAGIC_VALUE     0x4942534f
+
+/** Maximum supported info version */
+#define FW_DYNAMIC_INFO_VERSION         0x2
+
+/** Possible next mode values */
+#define FW_DYNAMIC_INFO_NEXT_MODE_U     0x0
+#define FW_DYNAMIC_INFO_NEXT_MODE_S     0x1
+#define FW_DYNAMIC_INFO_NEXT_MODE_M     0x3
+
+enum sbi_scratch_options {
+    /** Disable prints during boot */
+    SBI_SCRATCH_NO_BOOT_PRINTS = (1 << 0),
+    /** Enable runtime debug prints */
+    SBI_SCRATCH_DEBUG_PRINTS = (1 << 1),
+};
+
+/** Representation dynamic info passed by previous booting stage */
+struct fw_dynamic_info {
+    /** Info magic */
+    target_long magic;
+    /** Info version */
+    target_long version;
+    /** Next booting stage address */
+    target_long next_addr;
+    /** Next booting stage mode */
+    target_long next_mode;
+    /** Options for OpenSBI library */
+    target_long options;
+    /**
+     * Preferred boot HART id
+     *
+     * It is possible that the previous booting stage uses same link
+     * address as the FW_DYNAMIC firmware. In this case, the relocation
+     * lottery mechanism can potentially overwrite the previous booting
+     * stage while other HARTs are still running in the previous booting
+     * stage leading to boot-time crash. To avoid this boot-time crash,
+     * the previous booting stage can specify last HART that will jump
+     * to the FW_DYNAMIC firmware as the preferred boot HART.
+     *
+     * To avoid specifying a preferred boot HART, the previous booting
+     * stage can set it to -1UL which will force the FW_DYNAMIC firmware
+     * to use the relocation lottery mechanism.
+     */
+    target_long boot_hart;
+};
+
+#endif
-- 
2.26.2


