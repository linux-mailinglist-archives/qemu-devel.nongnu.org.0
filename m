Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C0520A9DC
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 02:35:16 +0200 (CEST)
Received: from localhost ([::1]:54010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jocKp-0000PW-8h
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 20:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=4399c1bdf=atish.patra@wdc.com>)
 id 1jocJ7-0007Yz-Ks; Thu, 25 Jun 2020 20:33:31 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:7893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=4399c1bdf=atish.patra@wdc.com>)
 id 1jocIz-0002rW-LA; Thu, 25 Jun 2020 20:33:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593131601; x=1624667601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cQ41sd/6SBBg3DAs/1IBrXhkpsHoMAw26KZT5KJycRU=;
 b=nL2G/TqYfDZxREYHyyIk7ffBgRZ8GKTur4toJAGwE7aR2QjWKF6R9D4n
 0/LSGjACdFz1c67SoQZvp+eS5APTk5NhddNohdovDIv0k9iE9V1Uth55q
 ZxcqTMiVW6Btiw8BOfSpg4iaXSGcnprPGevxJCJYIf5s+HqN36FjAdxBj
 kVuh1Kv6cb30HiNZz93jYmFt8exKy+wWvJ8WnOCy7uu89Jzzxwg543zlV
 52sVKLaq/uTe4hvz0rRdyFaV/yOb2ckGM9TIUyq6kIGwbgMZh+JOjzVKR
 QsKCQqW8Y77YI6jcqChh6w1yUjXlwow6XIqefiBjaeLhm1gdJcc4ERhDW Q==;
IronPort-SDR: 2SnKp+e6tmH9xy2u9IdRF4o7J+08XqHZyNs81ux1Fv1gBRbfHP4HbtAjIB6M6CCDYQ475OlmXE
 VploNgk84E/MPGO9OyQ+e4qGLIYKpKmFempQ87jxslDqTyTp1h58TELLUAvxw7l5+iU8glAPi9
 /yYOmN9B2Ft19+38hoN7pornO0yjnlK79YY+XTfPx6L7dXahSpl+6JL/Iz+JIC+zC+HuFavFQU
 Cudhlws9KD1aTqooiqx5VYeqVXRWyc3YrX9Kmh9jPrj/9ZThBOmfXy/o5RrxuPGt679sylri5l
 yyQ=
X-IronPort-AV: E=Sophos;i="5.75,281,1589212800"; d="scan'208";a="140958182"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jun 2020 08:33:17 +0800
IronPort-SDR: ZTjUECTnO9o09n6xIbkwUhgChlwqKEnPUPTMlNnP4VEqDKDkrrp8tj5xnAMuCSqH16qbSpiiVR
 enzfgxKoJkIFj9v5apECVghTwvXsmhFtc=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 17:21:44 -0700
IronPort-SDR: qQRJJ2loKD4Nn+WRm58D/S5rlnAsWb5Mqz0pv7PzNkr3JN3qtiEu6gNFViAqlE6LnbitUyfyl6
 qBC2Go6HGIVQ==
WDCIronportException: Internal
Received: from usa003490.ad.shared (HELO yoda.hgst.com) ([10.86.58.205])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Jun 2020 17:33:17 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] riscv: Unify Qemu's reset vector code path
Date: Thu, 25 Jun 2020 17:33:11 -0700
Message-Id: <20200626003313.715355-2-atish.patra@wdc.com>
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

Currently, all riscv machines except sifive_u have identical reset vector
code implementations with memory addresses being different for all machines.
They can be easily combined into a single function in common code.

Move it to common function and let all the machines use the common function.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/boot.c         | 45 +++++++++++++++++++++++++++++++++++++++++
 hw/riscv/sifive_u.c     |  1 -
 hw/riscv/spike.c        | 41 +++----------------------------------
 hw/riscv/virt.c         | 40 +++---------------------------------
 include/hw/riscv/boot.h |  2 ++
 5 files changed, 53 insertions(+), 76 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index adb421b91b68..482b78147993 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -26,8 +26,11 @@
 #include "hw/loader.h"
 #include "hw/riscv/boot.h"
 #include "elf.h"
+#include "sysemu/device_tree.h"
 #include "sysemu/qtest.h"
 
+#include <libfdt.h>
+
 #if defined(TARGET_RISCV32)
 # define KERNEL_BOOT_ADDRESS 0x80400000
 #else
@@ -155,3 +158,45 @@ hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
 
     return *start + size;
 }
+
+void riscv_setup_rom_reset_vec(hwaddr start_addr, hwaddr rom_base,
+                               hwaddr rom_size, void *fdt)
+{
+    int i;
+    /* reset vector */
+    uint32_t reset_vec[8] = {
+        0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(dtb) */
+        0x02028593,                  /*     addi   a1, t0, %pcrel_lo(1b) */
+        0xf1402573,                  /*     csrr   a0, mhartid  */
+#if defined(TARGET_RISCV32)
+        0x0182a283,                  /*     lw     t0, 24(t0) */
+#elif defined(TARGET_RISCV64)
+        0x0182b283,                  /*     ld     t0, 24(t0) */
+#endif
+        0x00028067,                  /*     jr     t0 */
+        0x00000000,
+        start_addr,                  /* start: .dword */
+        0x00000000,
+                                     /* dtb: */
+    };
+
+    /* copy in the reset vector in little_endian byte order */
+    for (i = 0; i < sizeof(reset_vec) >> 2; i++) {
+        reset_vec[i] = cpu_to_le32(reset_vec[i]);
+    }
+    rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
+                          rom_base, &address_space_memory);
+
+    /* copy in the device tree */
+    if (fdt_pack(fdt) || fdt_totalsize(fdt) >
+        rom_size - sizeof(reset_vec)) {
+        error_report("not enough space to store device-tree");
+        exit(1);
+    }
+    qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
+    rom_add_blob_fixed_as("mrom.fdt", fdt, fdt_totalsize(fdt),
+                           rom_base + sizeof(reset_vec),
+                           &address_space_memory);
+
+    return;
+}
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7d051e7c9299..395b21703ab4 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -56,7 +56,6 @@
 #include "sysemu/device_tree.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
-#include "exec/address-spaces.h"
 
 #include <libfdt.h>
 
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 3c87e04fdceb..c696077cbc16 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -41,9 +41,6 @@
 #include "sysemu/device_tree.h"
 #include "sysemu/qtest.h"
 #include "sysemu/sysemu.h"
-#include "exec/address-spaces.h"
-
-#include <libfdt.h>
 
 #if defined(TARGET_RISCV32)
 # define BIOS_FILENAME "opensbi-riscv32-spike-fw_jump.elf"
@@ -165,7 +162,6 @@ static void spike_board_init(MachineState *machine)
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
-    int i;
     unsigned int smp_cpus = machine->smp.cpus;
 
     /* Initialize SOC */
@@ -212,40 +208,9 @@ static void spike_board_init(MachineState *machine)
         }
     }
 
-    /* reset vector */
-    uint32_t reset_vec[8] = {
-        0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(dtb) */
-        0x02028593,                  /*     addi   a1, t0, %pcrel_lo(1b) */
-        0xf1402573,                  /*     csrr   a0, mhartid  */
-#if defined(TARGET_RISCV32)
-        0x0182a283,                  /*     lw     t0, 24(t0) */
-#elif defined(TARGET_RISCV64)
-        0x0182b283,                  /*     ld     t0, 24(t0) */
-#endif
-        0x00028067,                  /*     jr     t0 */
-        0x00000000,
-        memmap[SPIKE_DRAM].base,     /* start: .dword DRAM_BASE */
-        0x00000000,
-                                     /* dtb: */
-    };
-
-    /* copy in the reset vector in little_endian byte order */
-    for (i = 0; i < sizeof(reset_vec) >> 2; i++) {
-        reset_vec[i] = cpu_to_le32(reset_vec[i]);
-    }
-    rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
-                          memmap[SPIKE_MROM].base, &address_space_memory);
-
-    /* copy in the device tree */
-    if (fdt_pack(s->fdt) || fdt_totalsize(s->fdt) >
-            memmap[SPIKE_MROM].size - sizeof(reset_vec)) {
-        error_report("not enough space to store device-tree");
-        exit(1);
-    }
-    qemu_fdt_dumpdtb(s->fdt, fdt_totalsize(s->fdt));
-    rom_add_blob_fixed_as("mrom.fdt", s->fdt, fdt_totalsize(s->fdt),
-                          memmap[SPIKE_MROM].base + sizeof(reset_vec),
-                          &address_space_memory);
+    /* load the reset vector */
+    riscv_setup_rom_reset_vec(memmap[SPIKE_DRAM].base, memmap[SPIKE_MROM].base,
+                              memmap[SPIKE_MROM].size, s->fdt);
 
     /* initialize HTIF using symbols found in load_kernel */
     htif_mm_init(system_memory, mask_rom, &s->soc.harts[0].env, serial_hd(0));
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 616db6f5aced..8ec77e43de26 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -39,12 +39,9 @@
 #include "sysemu/arch_init.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
-#include "exec/address-spaces.h"
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
 
-#include <libfdt.h>
-
 #if defined(TARGET_RISCV32)
 # define BIOS_FILENAME "opensbi-riscv32-virt-fw_jump.bin"
 #else
@@ -535,40 +532,9 @@ static void virt_machine_init(MachineState *machine)
         start_addr = virt_memmap[VIRT_FLASH].base;
     }
 
-    /* reset vector */
-    uint32_t reset_vec[8] = {
-        0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(dtb) */
-        0x02028593,                  /*     addi   a1, t0, %pcrel_lo(1b) */
-        0xf1402573,                  /*     csrr   a0, mhartid  */
-#if defined(TARGET_RISCV32)
-        0x0182a283,                  /*     lw     t0, 24(t0) */
-#elif defined(TARGET_RISCV64)
-        0x0182b283,                  /*     ld     t0, 24(t0) */
-#endif
-        0x00028067,                  /*     jr     t0 */
-        0x00000000,
-        start_addr,                  /* start: .dword */
-        0x00000000,
-                                     /* dtb: */
-    };
-
-    /* copy in the reset vector in little_endian byte order */
-    for (i = 0; i < sizeof(reset_vec) >> 2; i++) {
-        reset_vec[i] = cpu_to_le32(reset_vec[i]);
-    }
-    rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
-                          memmap[VIRT_MROM].base, &address_space_memory);
-
-    /* copy in the device tree */
-    if (fdt_pack(s->fdt) || fdt_totalsize(s->fdt) >
-            memmap[VIRT_MROM].size - sizeof(reset_vec)) {
-        error_report("not enough space to store device-tree");
-        exit(1);
-    }
-    qemu_fdt_dumpdtb(s->fdt, fdt_totalsize(s->fdt));
-    rom_add_blob_fixed_as("mrom.fdt", s->fdt, fdt_totalsize(s->fdt),
-                          memmap[VIRT_MROM].base + sizeof(reset_vec),
-                          &address_space_memory);
+    /* load the reset vector */
+    riscv_setup_rom_reset_vec(start_addr, virt_memmap[VIRT_MROM].base,
+                              virt_memmap[VIRT_MROM].size, s->fdt);
 
     /* create PLIC hart topology configuration string */
     plic_hart_config_len = (strlen(VIRT_PLIC_HART_CONFIG) + 1) * smp_cpus;
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 9daa98da08d7..3e9759c89aa2 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -35,5 +35,7 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
                                symbol_fn_t sym_cb);
 hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
                          uint64_t kernel_entry, hwaddr *start);
+void riscv_setup_rom_reset_vec(hwaddr saddr, hwaddr rom_base,
+                               hwaddr rom_size, void *fdt);
 
 #endif /* RISCV_BOOT_H */
-- 
2.26.2


