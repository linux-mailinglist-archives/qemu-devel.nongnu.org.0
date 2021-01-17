Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA8A2F95B4
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 23:00:40 +0100 (CET)
Received: from localhost ([::1]:56912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1G6B-0004cx-4d
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 17:00:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1Fzw-0005fG-3u
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:12 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:57994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1Fzt-0005VJ-J7
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610920450; x=1642456450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bRED0avBC4e+KbPtXnLBRx30Y8g1TVI4k9FnBaz18OY=;
 b=FaHNgyggAXkw9y3gxDeHEHOrG+eOsqPkQlKO0H29SiVcAYT1d2FShCZY
 amImQc3ZkVoKi3DVKczkbVHoRvjOMU79NbZrnFgbbiafKLIm58wDuryHK
 1CcCRDvCgJm1GpAoiJHW8mvCOwqMnPvvzc0hCgGsur5Jmu452THXa/lWx
 5FkP0fc5g6aJEGl9urvvavF6tBDOWKJEh81H9KvY0OnoSOcO+dkuOf5XA
 pSk3HPmjOMmo1TeCd2AT/atbwFq4st9hqsrYqWBQvwNPjF/iONyFeigZS
 FD5Y/upU3UosUQ+y23T5x+sCht9uWSkrqerp0N90fBCqRZNRy9GhF3mkM Q==;
IronPort-SDR: YCZDdXyh/Yc9bKpoLbb7X6kflzUs2bGTpf635GpQt7lTJcbrFwZOZekSPstmJeh42UcYFallaU
 tYajhfnEVdOQmdFkAyMhZUv3Y01loLKjbzTypWg02KTLmdJwIcP2/r32c/oinWf0ITJds9Ryva
 KfMk9zsvYBbYWPUZ6kYZGTBroHsZZhMHC7vK9GeD+cZHPvEQD1N7CQL9ACgpYkbF1tr/D0tttI
 CySv6LM2gaZF2GnXHFoKkBYR5vB3wTjyrdc1D4B97z29RHLE60D3aePmsc05fh7rebGIcwcRBF
 9XA=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="158828244"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 05:54:08 +0800
IronPort-SDR: bSM2DiBCpq/aRd+yuxmkGR08e33O+mBY0hVgHtLR4j8lwUhDw4MvdyQDIoWHCqCsd8abhsx7O8
 2yPsxGUAJ1QE5FV/nItdFqWliiRSCa2T9aP9kttdQk/2K4hEeVCTuyoTZRCsq7ApZAke8s6KP+
 nf7oCs6DaXMX4ZSLmLSJrst7EI86hrY8kzOt1GE5TVtT01gkEraye5VAXDvK3jq1JnmRijhaq9
 Mq2VFwgI0Y+pS8Q7+Thim5yuMwgWYJPWPW0GueBaH0Km2JhGldYXW/PFAPpMnX/dSUgzDhifxT
 3zlYKPB7utBFLXcQthTxg22G
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 13:38:47 -0800
IronPort-SDR: 1zEcBB8ZhqDrHtzenB29XUQn9gAssr5z5QRarH/NcH2aKFa0fI5Afw7G7ihTjeXv7l4s0uy8q3
 5fLT1ypLPHuTU92qOyvYJ9nbsImTwE39xP84Z8YtTiiXuuNHcvPzBqIZ9tuuOtZCZeokGlvdm3
 GJf+Dmmi4Wrc4joiKQyo3ixSeySSUx1wpdTd/gfE5rFCWnX1Bp1pyWTOheaviUUQw/DiUOTD1o
 hW0ynCWJbYCvcRvONasGRq2WrXz9YLCwFXm5gzsAuJ8mccyL+kPVKjjFgRD4i9FVK8YuCsdivM
 j2Y=
WDCIronportException: Internal
Received: from 7l95g12.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.251])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Jan 2021 13:54:08 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 12/12] riscv: Pass RISCVHartArrayState by pointer
Date: Sun, 17 Jan 2021 13:54:03 -0800
Message-Id: <20210117215403.2277103-13-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117215403.2277103-1-alistair.francis@wdc.com>
References: <20210117215403.2277103-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=64494dccb=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were accidently passing RISCVHartArrayState by value instead of
pointer. The type is 824 bytes long so let's correct that and pass it by
pointer instead.

Fixes: Coverity CID 1438099
Fixes: Coverity CID 1438100
Fixes: Coverity CID 1438101
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Message-id: f3e04424723e0e222769991896cc82308fd23f76.1610751609.git.alistair.francis@wdc.com
---
 include/hw/riscv/boot.h |  6 +++---
 hw/riscv/boot.c         | 10 ++++------
 hw/riscv/sifive_u.c     | 10 +++++-----
 hw/riscv/spike.c        |  8 ++++----
 hw/riscv/virt.c         |  8 ++++----
 5 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 20ff5fe5e5..11a21dd584 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -24,9 +24,9 @@
 #include "hw/loader.h"
 #include "hw/riscv/riscv_hart.h"
 
-bool riscv_is_32bit(RISCVHartArrayState harts);
+bool riscv_is_32bit(RISCVHartArrayState *harts);
 
-target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState harts,
+target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
                                           target_ulong firmware_end_addr);
 target_ulong riscv_find_and_load_firmware(MachineState *machine,
                                           const char *default_machine_firmware,
@@ -42,7 +42,7 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
 hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
                          uint64_t kernel_entry, hwaddr *start);
 uint32_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
-void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState harts,
+void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
                                hwaddr rom_base, hwaddr rom_size,
                                uint64_t kernel_entry,
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 10a601b4dc..0d38bb7426 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -33,14 +33,12 @@
 
 #include <libfdt.h>
 
-bool riscv_is_32bit(RISCVHartArrayState harts)
+bool riscv_is_32bit(RISCVHartArrayState *harts)
 {
-    RISCVCPU hart = harts.harts[0];
-
-    return riscv_cpu_is_32bit(&hart.env);
+    return riscv_cpu_is_32bit(&harts->harts[0].env);
 }
 
-target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState harts,
+target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
                                           target_ulong firmware_end_addr) {
     if (riscv_is_32bit(harts)) {
         return QEMU_ALIGN_UP(firmware_end_addr, 4 * MiB);
@@ -247,7 +245,7 @@ void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
                            &address_space_memory);
 }
 
-void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState harts,
+void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr start_addr,
                                hwaddr rom_base, hwaddr rom_size,
                                uint64_t kernel_entry,
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index e083510e0e..59b61cea01 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -466,7 +466,7 @@ static void sifive_u_machine_init(MachineState *machine)
 
     /* create device tree */
     create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(s->soc.u_cpus));
+               riscv_is_32bit(&s->soc.u_cpus));
 
     if (s->start_in_flash) {
         /*
@@ -495,7 +495,7 @@ static void sifive_u_machine_init(MachineState *machine)
         break;
     }
 
-    if (riscv_is_32bit(s->soc.u_cpus)) {
+    if (riscv_is_32bit(&s->soc.u_cpus)) {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
                                     "opensbi-riscv32-generic-fw_dynamic.bin",
                                     start_addr, NULL);
@@ -506,7 +506,7 @@ static void sifive_u_machine_init(MachineState *machine)
     }
 
     if (machine->kernel_filename) {
-        kernel_start_addr = riscv_calc_kernel_start_addr(s->soc.u_cpus,
+        kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine->kernel_filename,
@@ -533,7 +533,7 @@ static void sifive_u_machine_init(MachineState *machine)
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[SIFIVE_U_DEV_DRAM].base,
                                    machine->ram_size, s->fdt);
-    if (!riscv_is_32bit(s->soc.u_cpus)) {
+    if (!riscv_is_32bit(&s->soc.u_cpus)) {
         start_addr_hi32 = (uint64_t)start_addr >> 32;
     }
 
@@ -552,7 +552,7 @@ static void sifive_u_machine_init(MachineState *machine)
         0x00000000,
                                        /* fw_dyn: */
     };
-    if (riscv_is_32bit(s->soc.u_cpus)) {
+    if (riscv_is_32bit(&s->soc.u_cpus)) {
         reset_vec[4] = 0x0202a583;     /*     lw     a1, 32(t0) */
         reset_vec[5] = 0x0182a283;     /*     lw     t0, 24(t0) */
     } else {
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index e723ca0ac9..56986ecfe0 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -244,7 +244,7 @@ static void spike_board_init(MachineState *machine)
 
     /* create device tree */
     create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(s->soc[0]));
+               riscv_is_32bit(&s->soc[0]));
 
     /* boot rom */
     memory_region_init_rom(mask_rom, NULL, "riscv.spike.mrom",
@@ -257,7 +257,7 @@ static void spike_board_init(MachineState *machine)
      * keeping ELF files here was intentional because BIN files don't work
      * for the Spike machine as HTIF emulation depends on ELF parsing.
      */
-    if (riscv_is_32bit(s->soc[0])) {
+    if (riscv_is_32bit(&s->soc[0])) {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
                                     "opensbi-riscv32-generic-fw_dynamic.elf",
                                     memmap[SPIKE_DRAM].base,
@@ -270,7 +270,7 @@ static void spike_board_init(MachineState *machine)
     }
 
     if (machine->kernel_filename) {
-        kernel_start_addr = riscv_calc_kernel_start_addr(s->soc[0],
+        kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine->kernel_filename,
@@ -299,7 +299,7 @@ static void spike_board_init(MachineState *machine)
     fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
                                    machine->ram_size, s->fdt);
     /* load the reset vector */
-    riscv_setup_rom_reset_vec(machine, s->soc[0], memmap[SPIKE_DRAM].base,
+    riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].base,
                               memmap[SPIKE_MROM].base,
                               memmap[SPIKE_MROM].size, kernel_entry,
                               fdt_load_addr, s->fdt);
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 8de4c35c9d..2299b3a6be 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -601,7 +601,7 @@ static void virt_machine_init(MachineState *machine)
 
     /* create device tree */
     create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(s->soc[0]));
+               riscv_is_32bit(&s->soc[0]));
 
     /* boot rom */
     memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
@@ -609,7 +609,7 @@ static void virt_machine_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[VIRT_MROM].base,
                                 mask_rom);
 
-    if (riscv_is_32bit(s->soc[0])) {
+    if (riscv_is_32bit(&s->soc[0])) {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
                                     "opensbi-riscv32-generic-fw_dynamic.bin",
                                     start_addr, NULL);
@@ -620,7 +620,7 @@ static void virt_machine_init(MachineState *machine)
     }
 
     if (machine->kernel_filename) {
-        kernel_start_addr = riscv_calc_kernel_start_addr(s->soc[0],
+        kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine->kernel_filename,
@@ -656,7 +656,7 @@ static void virt_machine_init(MachineState *machine)
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
                                    machine->ram_size, s->fdt);
     /* load the reset vector */
-    riscv_setup_rom_reset_vec(machine, s->soc[0], start_addr,
+    riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
                               virt_memmap[VIRT_MROM].base,
                               virt_memmap[VIRT_MROM].size, kernel_entry,
                               fdt_load_addr, s->fdt);
-- 
2.29.2


