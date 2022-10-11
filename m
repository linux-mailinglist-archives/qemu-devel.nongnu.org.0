Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6DE5FBCAB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 23:09:26 +0200 (CEST)
Received: from localhost ([::1]:55110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiMVB-0000B4-Dy
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 17:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=aME8=2M=zx2c4.com=Jason@kernel.org>)
 id 1oiMDI-0000FU-C3
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:50:56 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:42542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=aME8=2M=zx2c4.com=Jason@kernel.org>)
 id 1oiMDC-00026T-9q
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:50:51 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 13623B8166B;
 Tue, 11 Oct 2022 20:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6506AC433D6;
 Tue, 11 Oct 2022 20:50:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="D4MUKTBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665521445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b/llaFfWKpV4r26HXC7WNQlfn5N+of4KdWL76zRP29c=;
 b=D4MUKTBifKOeohhG3Q7VfjLtLPxg7IpO799NVu84xShkHw+O7E43+l9ZRWRaLKud+0wuRX
 HrDBm/u/uggm3nwJnY8+Wz5yEz3l/GDbvAIJ/0J5r09WwT0/EKzIqbra/RE6akimpExNna
 eo+yOv6Jhy4pcad0w3nSu6lQFt+iqR8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5bbb80db
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 11 Oct 2022 20:50:45 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: peter.maydell@linaro.org,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v2 8/8] reset: do not re-randomize RNG seed on snapshot load
Date: Tue, 11 Oct 2022 14:50:30 -0600
Message-Id: <20221011205030.1161679-1-Jason@zx2c4.com>
In-Reply-To: <20221011204645.1160916-1-Jason@zx2c4.com>
References: <20221011204645.1160916-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=aME8=2M=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Snapshot loading is supposed to be deterministic, so we shouldn't
re-randomize the various seeds used.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/arm/boot.c      | 3 ++-
 hw/i386/x86.c      | 2 +-
 hw/mips/boston.c   | 2 +-
 hw/openrisc/boot.c | 2 +-
 hw/riscv/boot.c    | 2 +-
 hw/rx/rx-gdbsim.c  | 2 +-
 6 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 6a6f4c92c2..511f7b22b1 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -683,7 +683,8 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
      * the DTB is copied again upon reset, even if addr points into RAM.
      */
     rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
-    qemu_register_reset(qemu_fdt_randomize_seeds, rom_ptr_for_as(as, addr, size));
+    qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
+                                       rom_ptr_for_as(as, addr, size));
 
     g_free(fdt);
 
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 1148f70c03..bd50a064a3 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1111,7 +1111,7 @@ void x86_load_linux(X86MachineState *x86ms,
         setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
         setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
-        qemu_register_reset(reset_rng_seed, setup_data);
+        qemu_register_reset_nosnapshotload(reset_rng_seed, setup_data);
         fw_cfg_add_bytes_callback(fw_cfg, FW_CFG_KERNEL_DATA, reset_rng_seed, NULL,
                                   setup_data, kernel, kernel_size, true);
     } else {
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index a560ce0324..cab63f43bf 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -811,7 +811,7 @@ static void boston_mach_init(MachineState *machine)
             /* Calculate real fdt size after filter */
             dt_size = fdt_totalsize(dtb_load_data);
             rom_add_blob_fixed("dtb", dtb_load_data, dt_size, dtb_paddr);
-            qemu_register_reset(qemu_fdt_randomize_seeds,
+            qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
                                 rom_ptr(dtb_paddr, dt_size));
         } else {
             /* Try to load file as FIT */
diff --git a/hw/openrisc/boot.c b/hw/openrisc/boot.c
index 8b9f11b6d8..007e80cd5a 100644
--- a/hw/openrisc/boot.c
+++ b/hw/openrisc/boot.c
@@ -112,7 +112,7 @@ uint32_t openrisc_load_fdt(void *fdt, hwaddr load_start,
 
     rom_add_blob_fixed_as("fdt", fdt, fdtsize, fdt_addr,
                           &address_space_memory);
-    qemu_register_reset(qemu_fdt_randomize_seeds,
+    qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
                         rom_ptr_for_as(&address_space_memory, fdt_addr, fdtsize));
 
     return fdt_addr;
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index aaecf21543..c389edb3cd 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -242,7 +242,7 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
 
     rom_add_blob_fixed_as("fdt", fdt, fdtsize, fdt_addr,
                           &address_space_memory);
-    qemu_register_reset(qemu_fdt_randomize_seeds,
+    qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
                         rom_ptr_for_as(&address_space_memory, fdt_addr, fdtsize));
 
     return fdt_addr;
diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index 198d048964..47c17026c7 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -149,7 +149,7 @@ static void rx_gdbsim_init(MachineState *machine)
             dtb_offset = ROUND_DOWN(machine->ram_size - dtb_size, 16);
             rom_add_blob_fixed("dtb", dtb, dtb_size,
                                SDRAM_BASE + dtb_offset);
-            qemu_register_reset(qemu_fdt_randomize_seeds,
+            qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
                                 rom_ptr(SDRAM_BASE + dtb_offset, dtb_size));
             /* Set dtb address to R1 */
             RX_CPU(first_cpu)->env.regs[1] = SDRAM_BASE + dtb_offset;
-- 
2.37.3


