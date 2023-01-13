Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A52669E0D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:28:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMHY-0002Uo-72; Fri, 13 Jan 2023 10:47:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMHT-0002UD-U8
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:47:48 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMHR-0006CN-NF
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:47:47 -0500
Received: by mail-wr1-x42f.google.com with SMTP id bk16so21435002wrb.11
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dp3ay3h1wkIShEs7P3B3oIFgf4T+8GNNeso8XrNH/mo=;
 b=byf7qgAyeZkJ57F1AGZhICYZCkOXMk8Y1WQPAGoSliIcoi3G2nhD90Zuu+DK9A2xXL
 64aAuZI0NCHlIcFgCrbrt5rNJ1iX6B97tSo7Oo6RTfGygftv73+EU4hw74gyNJYP9TZ5
 95B21Fx3KHgy1/Y/rspGSSoFsEyejy6ZtzCwBIeChNnfPumN093CGXohhu48M9fEaUkH
 YnRkwkahmwJ/l3v6F9B4N9Q5LR7MewD3ufek1IpN9AKQrQAPi5+pBRpHmvKrs8NwyqH7
 woAU4s0uqvMQH3CLZegbT1xLG6ngUJoT7fM3BLVGBk5Z1JPI1Gp8ioKof4t6h9dJGpaZ
 URZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dp3ay3h1wkIShEs7P3B3oIFgf4T+8GNNeso8XrNH/mo=;
 b=RcnqaZzCg2H40ud+oAtCQ9+Ad2AENEkpWtB6Mw3ZwaI6lX3IOwtdXASyB1Q/H0KdBX
 yvTr4xdIWrYqOiP8q3KYqZuOPfvptIz+fwK1pwNCUag5pgTpP+q1r35mMjF+Vt0Q1s2+
 /nEKtTAtAkZfELmSnBJL+xkyMZYosiW0Sh2E8uj8JHtGweNFyBlG4qJHFSu2e4H7rqHe
 I/BqpBCtC5s/NKj5hLTckTqtwWuJiL/yrQmIL1YFvlQfAb9F487ocqSTxscHDZm7kmKE
 wPZy5c703B2LJjun0uV8bULDDRntJh4nlCl2OXJvkbcMipfuc7b1FXrH3e78lYP2yksG
 QbGg==
X-Gm-Message-State: AFqh2kpj4Nc8LIWU1wkecc8HiUYhJmQ7kVdCiH8t1u2GRpCwxpa4FMmS
 6idXkOkoH/d9VMRggZwBdJDB7hp4//1ZWQnu
X-Google-Smtp-Source: AMrXdXsmllVz+3oOzaCb8Pi+6X5/zLTbdHIxAx9XcoTN0g9v1Z0rDihEoH3ZfHg0kq0TsRMfBE/CUA==
X-Received: by 2002:a05:6000:16cb:b0:242:1b0d:9c58 with SMTP id
 h11-20020a05600016cb00b002421b0d9c58mr59746842wrf.69.1673624864725; 
 Fri, 13 Jan 2023 07:47:44 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 q14-20020adff94e000000b002b065272da2sm18990221wrr.13.2023.01.13.07.47.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:47:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 27/46] mips: Remove support for trap and emulate KVM
Date: Fri, 13 Jan 2023 16:45:13 +0100
Message-Id: <20230113154532.49979-28-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Paolo Bonzini <pbonzini@redhat.com>

This support was limited to the Malta board, drop it.
I do not have a machine that can run VZ KVM, so I am assuming
that it works for -M malta as well.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221221091718.71844-1-philmd@linaro.org>
---
 docs/about/deprecated.rst       |  9 -------
 docs/about/removed-features.rst |  9 +++++++
 hw/mips/malta.c                 | 46 +++++----------------------------
 target/mips/cpu.c               |  7 +----
 target/mips/cpu.h               |  3 ---
 target/mips/internal.h          |  3 ---
 target/mips/kvm.c               | 11 +-------
 target/mips/sysemu/addr.c       | 17 ------------
 target/mips/sysemu/physaddr.c   | 13 ----------
 9 files changed, 18 insertions(+), 100 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 68d29642d7..9f1bbc495d 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -171,15 +171,6 @@ accepted incorrect commands will return an error. Users should make sure that
 all arguments passed to ``device_add`` are consistent with the documented
 property types.
 
-System accelerators
--------------------
-
-MIPS ``Trap-and-Emul`` KVM support (since 6.0)
-''''''''''''''''''''''''''''''''''''''''''''''
-
-The MIPS ``Trap-and-Emul`` KVM host and guest support has been removed
-from Linux upstream kernel, declare it deprecated.
-
 Host Architectures
 ------------------
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index c918cabd1a..6c3aa5097f 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -652,6 +652,15 @@ Userspace local APIC with KVM (x86, removed 8.0)
 a local APIC.  The ``split`` setting is supported, as is using ``-M
 kernel-irqchip=off`` when the CPU does not have a local APIC.
 
+System accelerators
+-------------------
+
+MIPS "Trap-and-Emulate" KVM support (removed in 8.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The MIPS "Trap-and-Emulate" KVM host and guest support was removed
+from Linux in 2021, and is not supported anymore by QEMU either.
+
 System emulator machines
 ------------------------
 
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index ae76b4db70..8bf2e2ff5f 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -57,6 +57,7 @@
 #include "semihosting/semihost.h"
 #include "hw/mips/cps.h"
 #include "hw/qdev-clock.h"
+#include "target/mips/internal.h"
 #include "trace.h"
 
 #define ENVP_PADDR          0x2000
@@ -875,7 +876,6 @@ static uint64_t load_kernel(void)
     uint32_t *prom_buf;
     long prom_size;
     int prom_index = 0;
-    uint64_t (*xlate_to_kseg0) (void *opaque, uint64_t addr);
     uint8_t rng_seed[32];
     char rng_seed_hex[sizeof(rng_seed) * 2 + 1];
     size_t rng_seed_prom_offset;
@@ -899,19 +899,10 @@ static uint64_t load_kernel(void)
     }
 
     /* Check where the kernel has been linked */
-    if (kernel_entry & 0x80000000ll) {
-        if (kvm_enabled()) {
-            error_report("KVM guest kernels must be linked in useg. "
-                         "Did you forget to enable CONFIG_KVM_GUEST?");
-            exit(1);
-        }
-
-        xlate_to_kseg0 = cpu_mips_phys_to_kseg0;
-    } else {
-        /* if kernel entry is in useg it is probably a KVM T&E kernel */
-        mips_um_ksegs_enable();
-
-        xlate_to_kseg0 = cpu_mips_kvm_um_phys_to_kseg0;
+    if (kernel_entry <= USEG_LIMIT) {
+        error_report("Trap-and-Emul kernels (Linux CONFIG_KVM_GUEST)"
+                     " are not supported");
+        exit(1);
     }
 
     /* load initrd */
@@ -952,7 +943,7 @@ static uint64_t load_kernel(void)
     if (initrd_size > 0) {
         prom_set(prom_buf, prom_index++,
                  "rd_start=0x%" PRIx64 " rd_size=%" PRId64 " %s",
-                 xlate_to_kseg0(NULL, initrd_offset),
+                 cpu_mips_phys_to_kseg0(NULL, initrd_offset),
                  initrd_size, loaderparams.kernel_cmdline);
     } else {
         prom_set(prom_buf, prom_index++, "%s", loaderparams.kernel_cmdline);
@@ -1019,11 +1010,6 @@ static void main_cpu_reset(void *opaque)
     }
 
     malta_mips_config(cpu);
-
-    if (kvm_enabled()) {
-        /* Start running from the bootloader we wrote to end of RAM */
-        env->active_tc.PC = 0x40000000 + loaderparams.ram_low_size;
-    }
 }
 
 static void create_cpu_without_cps(MachineState *ms, MaltaState *s,
@@ -1157,13 +1143,7 @@ void mips_malta_init(MachineState *machine)
     fl_idx++;
     if (kernel_filename) {
         ram_low_size = MIN(ram_size, 256 * MiB);
-        /* For KVM we reserve 1MB of RAM for running bootloader */
-        if (kvm_enabled()) {
-            ram_low_size -= 0x100000;
-            bootloader_run_addr = cpu_mips_kvm_um_phys_to_kseg0(NULL, ram_low_size);
-        } else {
-            bootloader_run_addr = cpu_mips_phys_to_kseg0(NULL, RESET_ADDRESS);
-        }
+        bootloader_run_addr = cpu_mips_phys_to_kseg0(NULL, RESET_ADDRESS);
 
         /* Write a small bootloader to the flash location. */
         loaderparams.ram_size = ram_size;
@@ -1180,20 +1160,8 @@ void mips_malta_init(MachineState *machine)
             write_bootloader_nanomips(memory_region_get_ram_ptr(bios),
                                       bootloader_run_addr, kernel_entry);
         }
-        if (kvm_enabled()) {
-            /* Write the bootloader code @ the end of RAM, 1MB reserved */
-            write_bootloader(memory_region_get_ram_ptr(ram_low_preio) +
-                                    ram_low_size,
-                             bootloader_run_addr, kernel_entry);
-        }
     } else {
         target_long bios_size = FLASH_SIZE;
-        /* The flash region isn't executable from a KVM guest */
-        if (kvm_enabled()) {
-            error_report("KVM enabled but no -kernel argument was specified. "
-                         "Booting from flash is not supported with KVM.");
-            exit(1);
-        }
         /* Load firmware from flash. */
         if (!dinfo) {
             /* Load a BIOS image. */
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index c614b04607..052e54bda3 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -292,12 +292,7 @@ static void mips_cpu_reset_hold(Object *obj)
     env->tlb->tlb_in_use = env->tlb->nb_tlb;
     env->CP0_Wired = 0;
     env->CP0_GlobalNumber = (cs->cpu_index & 0xFF) << CP0GN_VPId;
-    env->CP0_EBase = (cs->cpu_index & 0x3FF);
-    if (mips_um_ksegs_enabled()) {
-        env->CP0_EBase |= 0x40000000;
-    } else {
-        env->CP0_EBase |= (int32_t)0x80000000;
-    }
+    env->CP0_EBase = KSEG0_BASE | (cs->cpu_index & 0x3FF);
     if (env->CP0_Config3 & (1 << CP0C3_CMGCR)) {
         env->CP0_CMGCRBase = 0x1fbf8000 >> 4;
     }
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 0a085643a3..caf2b06911 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1296,11 +1296,8 @@ void cpu_set_exception_base(int vp_index, target_ulong address);
 uint64_t cpu_mips_kseg0_to_phys(void *opaque, uint64_t addr);
 uint64_t cpu_mips_phys_to_kseg0(void *opaque, uint64_t addr);
 
-uint64_t cpu_mips_kvm_um_phys_to_kseg0(void *opaque, uint64_t addr);
 uint64_t cpu_mips_kseg1_to_phys(void *opaque, uint64_t addr);
 uint64_t cpu_mips_phys_to_kseg1(void *opaque, uint64_t addr);
-bool mips_um_ksegs_enabled(void);
-void mips_um_ksegs_enable(void);
 
 #if !defined(CONFIG_USER_ONLY)
 
diff --git a/target/mips/internal.h b/target/mips/internal.h
index 57b312689a..4b0031d10d 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -99,9 +99,6 @@ int mips_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 #define KSEG2_BASE      ((target_ulong)(int32_t)0xC0000000UL)
 #define KSEG3_BASE      ((target_ulong)(int32_t)0xE0000000UL)
 
-#define KVM_KSEG0_BASE  ((target_ulong)(int32_t)0x40000000UL)
-#define KVM_KSEG2_BASE  ((target_ulong)(int32_t)0x60000000UL)
-
 #if !defined(CONFIG_USER_ONLY)
 
 enum {
diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index bcb8e06b2c..c14e8f550f 100644
--- a/target/mips/kvm.c
+++ b/target/mips/kvm.c
@@ -1268,25 +1268,16 @@ int kvm_arch_msi_data_to_gsi(uint32_t data)
 
 int mips_kvm_type(MachineState *machine, const char *vm_type)
 {
-#if defined(KVM_CAP_MIPS_VZ) || defined(KVM_CAP_MIPS_TE)
+#if defined(KVM_CAP_MIPS_VZ)
     int r;
     KVMState *s = KVM_STATE(machine->accelerator);
-#endif
 
-#if defined(KVM_CAP_MIPS_VZ)
     r = kvm_check_extension(s, KVM_CAP_MIPS_VZ);
     if (r > 0) {
         return KVM_VM_MIPS_VZ;
     }
 #endif
 
-#if defined(KVM_CAP_MIPS_TE)
-    r = kvm_check_extension(s, KVM_CAP_MIPS_TE);
-    if (r > 0) {
-        return KVM_VM_MIPS_TE;
-    }
-#endif
-
     return -1;
 }
 
diff --git a/target/mips/sysemu/addr.c b/target/mips/sysemu/addr.c
index 86f1c129c9..4f025be44a 100644
--- a/target/mips/sysemu/addr.c
+++ b/target/mips/sysemu/addr.c
@@ -23,8 +23,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 
-static int mips_um_ksegs;
-
 uint64_t cpu_mips_kseg0_to_phys(void *opaque, uint64_t addr)
 {
     return addr & 0x1fffffffll;
@@ -35,11 +33,6 @@ uint64_t cpu_mips_phys_to_kseg0(void *opaque, uint64_t addr)
     return addr | ~0x7fffffffll;
 }
 
-uint64_t cpu_mips_kvm_um_phys_to_kseg0(void *opaque, uint64_t addr)
-{
-    return addr | 0x40000000ll;
-}
-
 uint64_t cpu_mips_kseg1_to_phys(void *opaque, uint64_t addr)
 {
     return addr & 0x1fffffffll;
@@ -49,13 +42,3 @@ uint64_t cpu_mips_phys_to_kseg1(void *opaque, uint64_t addr)
 {
     return (addr & 0x1fffffffll) | 0xffffffffa0000000ll;
 }
-
-bool mips_um_ksegs_enabled(void)
-{
-    return mips_um_ksegs;
-}
-
-void mips_um_ksegs_enable(void)
-{
-    mips_um_ksegs = 1;
-}
diff --git a/target/mips/sysemu/physaddr.c b/target/mips/sysemu/physaddr.c
index 1918633aa1..2970df8a09 100644
--- a/target/mips/sysemu/physaddr.c
+++ b/target/mips/sysemu/physaddr.c
@@ -130,19 +130,6 @@ int get_physical_address(CPUMIPSState *env, hwaddr *physical,
     /* effective address (modified for KVM T&E kernel segments) */
     target_ulong address = real_address;
 
-    if (mips_um_ksegs_enabled()) {
-        /* KVM T&E adds guest kernel segments in useg */
-        if (real_address >= KVM_KSEG0_BASE) {
-            if (real_address < KVM_KSEG2_BASE) {
-                /* kseg0 */
-                address += KSEG0_BASE - KVM_KSEG0_BASE;
-            } else if (real_address <= USEG_LIMIT) {
-                /* kseg2/3 */
-                address += KSEG2_BASE - KVM_KSEG2_BASE;
-            }
-        }
-    }
-
     if (address <= USEG_LIMIT) {
         /* useg */
         uint16_t segctl;
-- 
2.38.1


