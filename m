Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8024F64FD23
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 01:08:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6hCy-0008D0-1j; Sat, 17 Dec 2022 19:07:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p6hCm-0008CU-UD
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 19:07:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p6hCj-0001sa-Pk
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 19:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671322016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e9z7MEp/dJuEhe5aZ3eJWXF0N1jjAlAYewn+p3/c5jQ=;
 b=Ghu6TbqV6/jEMxrowhIdQI+8nLrMzZCcGqar6YWuaMxdoAl1deem+X7Dmql5VKHXq69xtR
 FX9bMQlcuedXHuiCliWxnAq4HDVPIhgy8/9virj0oB//odOzoEFkSQMxqKyEp0pCzSAg2A
 fZ6rOneCQcLQePSiviYAfIBCMdJj0Qc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-336-V98HcRpjOr2o4N_UYb1obQ-1; Sat, 17 Dec 2022 19:06:53 -0500
X-MC-Unique: V98HcRpjOr2o4N_UYb1obQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 ne1-20020a1709077b8100b007c198bb8c0eso3948945ejc.8
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 16:06:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e9z7MEp/dJuEhe5aZ3eJWXF0N1jjAlAYewn+p3/c5jQ=;
 b=oa2FWLdBTeoSIe38keuw3aBFTMhBVhnh/PNiAdt1IV/6Ym7SHa0jT3QJsUOx2CX5ih
 hIUXSedwPHIwdyhCjxzMA7bXqL6qBtEScR6c01dFhaxXwffOBpQUnVGMvvr7NqX4k4al
 kKmfvVD5FYSzvuINKR0MH1ebJ2QkMiWBA8gK4/5yr4JfJ0mRdk5cp48jwJHoHj3DPKGP
 V6NsJPSdPECFwJpGXexEWaGXheScKMA8JmNEIegu4UBF2l84jOrl6JAIqS/63qJngwZD
 vE1Q89jjNCYb7oYjqxCY5D8aL7J3tmpsyzmCMwLaXVyKjJTltv5E7y4JJ7vemle1rXfG
 zFPA==
X-Gm-Message-State: ANoB5pnTdKwjNPSrIvIF8t7/KRs37H1jHmhep5fg2tgSgp9KVmt8u9yL
 5bjDcCP0pTw+I6alutZWj/1lqmOqo7lmGWn8ONV36pP7cXkwZ65FPJdNpBJ2D5xwpm++vlJz1CS
 7T72ak5+ZQoQOPqVYLPcdwv6YhUsTHsNBM/3eJOGGGtBED84IxKwI7R2zcMYFvvBbfHA=
X-Received: by 2002:a05:6402:446:b0:46a:3bd0:4784 with SMTP id
 p6-20020a056402044600b0046a3bd04784mr31762824edw.7.1671322012372; 
 Sat, 17 Dec 2022 16:06:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5G/NMrxN+H0RPX3ydzD+bAj3fbzMss39JRMQILbBlnbYymo2hsVM7D/tTA1Ck8xuw/h5JYPw==
X-Received: by 2002:a05:6402:446:b0:46a:3bd0:4784 with SMTP id
 p6-20020a056402044600b0046a3bd04784mr31762810edw.7.1671322011861; 
 Sat, 17 Dec 2022 16:06:51 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 w26-20020aa7cb5a000000b0046c53c3b2dfsm2541608edt.38.2022.12.17.16.06.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Dec 2022 16:06:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MIPS: remove support for trap and emulate KVM
Date: Sun, 18 Dec 2022 01:06:45 +0100
Message-Id: <20221218000649.686882-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

This support was limited to the Malta board, drop it.
I do not have a machine that can run VZ KVM, so I am assuming
that it works for -M malta as well.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/about/deprecated.rst       |  9 -------
 docs/about/removed-features.rst |  9 +++++++
 hw/mips/malta.c                 | 44 ++++-----------------------------
 target/mips/cpu.c               |  7 +-----
 target/mips/cpu.h               |  2 --
 target/mips/kvm.c               | 11 +--------
 target/mips/sysemu/addr.c       | 17 -------------
 target/mips/sysemu/physaddr.c   | 13 ----------
 8 files changed, 16 insertions(+), 96 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 93affe3669ff..b28f50b22fa9 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -199,15 +199,6 @@ deprecated.  Use ``sections`` instead.
 Member ``section-size`` in return value elements with meta-type ``uint64`` is
 deprecated.  Use ``sections`` instead.
 
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
index 7e12145c120d..91c9dce6d6e0 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -616,6 +616,15 @@ x86 ``Icelake-Client`` CPU (removed in 7.1)
 There isn't ever Icelake Client CPU, it is some wrong and imaginary one.
 Use ``Icelake-Server`` instead.
 
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
index c0a2e0ab041b..13b9b3bc6d93 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1013,7 +1013,6 @@ static uint64_t load_kernel(void)
     uint32_t *prom_buf;
     long prom_size;
     int prom_index = 0;
-    uint64_t (*xlate_to_kseg0) (void *opaque, uint64_t addr);
     uint8_t rng_seed[32];
     char rng_seed_hex[sizeof(rng_seed) * 2 + 1];
     size_t rng_seed_prom_offset;
@@ -1037,19 +1036,9 @@ static uint64_t load_kernel(void)
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
+    if (!(kernel_entry & 0x80000000ll)) {
+        error_report("CONFIG_KVM_GUEST kernels are not supported");
+        exit(1);
     }
 
     /* load initrd */
@@ -1090,7 +1079,7 @@ static uint64_t load_kernel(void)
     if (initrd_size > 0) {
         prom_set(prom_buf, prom_index++,
                  "rd_start=0x%" PRIx64 " rd_size=%" PRId64 " %s",
-                 xlate_to_kseg0(NULL, initrd_offset),
+                 cpu_mips_phys_to_kseg0(NULL, initrd_offset),
                  initrd_size, loaderparams.kernel_cmdline);
     } else {
         prom_set(prom_buf, prom_index++, "%s", loaderparams.kernel_cmdline);
@@ -1157,11 +1146,6 @@ static void main_cpu_reset(void *opaque)
     }
 
     malta_mips_config(cpu);
-
-    if (kvm_enabled()) {
-        /* Start running from the bootloader we wrote to end of RAM */
-        env->active_tc.PC = 0x40000000 + loaderparams.ram_low_size;
-    }
 }
 
 static void create_cpu_without_cps(MachineState *ms, MaltaState *s,
@@ -1295,13 +1279,7 @@ void mips_malta_init(MachineState *machine)
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
@@ -1318,20 +1296,8 @@ void mips_malta_init(MachineState *machine)
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
index 7a565466cb3f..065a9cd10ec9 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -290,12 +290,7 @@ static void mips_cpu_reset(DeviceState *dev)
     env->tlb->tlb_in_use = env->tlb->nb_tlb;
     env->CP0_Wired = 0;
     env->CP0_GlobalNumber = (cs->cpu_index & 0xFF) << CP0GN_VPId;
-    env->CP0_EBase = (cs->cpu_index & 0x3FF);
-    if (mips_um_ksegs_enabled()) {
-        env->CP0_EBase |= 0x40000000;
-    } else {
-        env->CP0_EBase |= (int32_t)0x80000000;
-    }
+    env->CP0_EBase = (cs->cpu_index & 0x3FF) | (int32_t)0x80000000;
     if (env->CP0_Config3 & (1 << CP0C3_CMGCR)) {
         env->CP0_CMGCRBase = 0x1fbf8000 >> 4;
     }
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 0a085643a3f1..3411cbc37825 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1299,8 +1299,6 @@ uint64_t cpu_mips_phys_to_kseg0(void *opaque, uint64_t addr);
 uint64_t cpu_mips_kvm_um_phys_to_kseg0(void *opaque, uint64_t addr);
 uint64_t cpu_mips_kseg1_to_phys(void *opaque, uint64_t addr);
 uint64_t cpu_mips_phys_to_kseg1(void *opaque, uint64_t addr);
-bool mips_um_ksegs_enabled(void);
-void mips_um_ksegs_enable(void);
 
 #if !defined(CONFIG_USER_ONLY)
 
diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index bcb8e06b2cb4..c14e8f550fcc 100644
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
index 86f1c129c9f4..4f025be44a1d 100644
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
index 1918633aa1c4..2970df8a0981 100644
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


