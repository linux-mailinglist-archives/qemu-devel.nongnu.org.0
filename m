Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C70D52AF633
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 17:23:52 +0100 (CET)
Received: from localhost ([::1]:55944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcsuV-0006HK-RS
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 11:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1kcspG-0000oh-TD
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:18:26 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:46008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1kcspE-00080q-CN
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:18:26 -0500
Received: by mail-wr1-x444.google.com with SMTP id p1so3051152wrf.12
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 08:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8zo+2MC0dwCZlrl13leQZToCZo2pO8yIdQ0oeKd3peA=;
 b=ZtvXhrOj4OgfH7Y0rT9t+8ifkSQNRJonm8yG5cG8fNzaqFURRPA44VyK7pwINMjSBL
 KFfyf6/6mQR5iQKtriLhaQ8rZHqrwmTbDSpaHrEUVw8qozpIDLMswNctbnu0KjDdVUG9
 s39vvmJvVsPgMCx+/pLr9xdWPOYZtmcGL4D6a+K9cNcF6POer4QDW8sciTXin4MjvrWc
 P51zsKADUNxDDMqDGjH26041DxmvaqPpZJTehMkIzRsJ5+apbtjpacXpVRmd4eRBMtoR
 nTCfTF6kXeFLnZOnxK7Y4Ddk/4dW4vZE1qKOlOmnQbuWIJEO6cUqlaIHGUY43mIUJimD
 NGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8zo+2MC0dwCZlrl13leQZToCZo2pO8yIdQ0oeKd3peA=;
 b=ni9dIIa6VSydAlQvyBoo6RBfSm92lWlzMn1uIOyOuL4mcuAhaK6BsWucZXxPNQPXzt
 HQQEF4dfzYuKEKZIrqcMio+tA/X1fcqzptbBDL5/3srQDNkMP9/I4pUo/c7ya8xdG3d2
 G5vQ1rLmeWXyNoRAXwrBevw59oL/H2doTYHQl0nejpSCVZGTa/c0MANDCrP91SlMyDvM
 ohhvCdDYdmImZsHDYtstpKkXHs78FjIrfUaKHpXN4pgDWys0eeG5IEPeizjTVFpl+SlM
 F7pbj4cfXx92NYGIIoc5qnC3hcMLGYmkFDfqRaGp7x1sVPb2RCiQEvNYrAqSAy+BnRBM
 +M/w==
X-Gm-Message-State: AOAM530S7whfyEOaOqtLZ2HAPQ52v1uYP63byOe52fU4jnVVmx5m98q8
 kuK2EPt02lr2+MwWh8sSoNMSIU4n3rMaOA==
X-Google-Smtp-Source: ABdhPJxQeSJo2eG10vYIX11zR2DSpF+mmJp03lsdQFgutH1a0viB1wKIttGvCjXBTbZA5akDGi1hsw==
X-Received: by 2002:adf:cd02:: with SMTP id w2mr30579464wrm.3.1605111502682;
 Wed, 11 Nov 2020 08:18:22 -0800 (PST)
Received: from cmiranda-laptop.localdomain (bl19-104-46.dsl.telepac.pt.
 [2.80.104.46])
 by smtp.gmail.com with ESMTPSA id s188sm3115178wmf.45.2020.11.11.08.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 08:18:22 -0800 (PST)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 13/15] arc: Add support for ARCv2
Date: Wed, 11 Nov 2020 16:17:56 +0000
Message-Id: <20201111161758.9636-14-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201111161758.9636-1-cupertinomiranda@gmail.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Claudiu Zissulescu <claziss@gmail.com>,
 Cupertino Miranda <cupertinomiranda@gmail.com>,
 Shahab Vahedi <shahab.vahedi@gmail.com>, Shahab Vahedi <shahab@synopsys.com>,
 Cupertino Miranda <cmiranda@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <claziss@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shahab Vahedi <shahab@synopsys.com>

Add remaining bits of the Synopsys ARCv2 (EM/HS) support into QEMU,
configure bits, arch_init and configuration files for softmmu (hardware
emulation).

Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
---
 configure                               |  2 ++
 default-configs/arc-softmmu.mak         |  5 +++++
 default-configs/devices/arc-softmmu.mak |  7 +++++++
 default-configs/targets/arc-softmmu.mak |  2 ++
 disas.c                                 |  2 ++
 disas/meson.build                       |  1 +
 hw/Kconfig                              |  1 +
 hw/arc/Kconfig                          |  7 +++++++
 hw/arc/Makefile.objs                    | 21 ---------------------
 hw/arc/meson.build                      |  6 +-----
 hw/meson.build                          |  1 +
 include/disas/dis-asm.h                 | 10 +++++++++-
 include/elf.h                           |  3 +++
 include/exec/poison.h                   |  2 ++
 include/sysemu/arch_init.h              |  1 +
 meson.build                             |  5 +++--
 softmmu/arch_init.c                     |  2 ++
 target/meson.build                      |  1 +
 18 files changed, 50 insertions(+), 29 deletions(-)
 create mode 100644 default-configs/arc-softmmu.mak
 create mode 100644 default-configs/devices/arc-softmmu.mak
 create mode 100644 default-configs/targets/arc-softmmu.mak
 create mode 100644 hw/arc/Kconfig
 delete mode 100644 hw/arc/Makefile.objs

diff --git a/configure b/configure
index 2c3c69f118..1c8a6c8fcf 100755
--- a/configure
+++ b/configure
@@ -672,6 +672,8 @@ elif check_define __arm__ ; then
   cpu="arm"
 elif check_define __aarch64__ ; then
   cpu="aarch64"
+elif check_define __arc__ ; then
+  cpu="arc"
 else
   cpu=$(uname -m)
 fi
diff --git a/default-configs/arc-softmmu.mak b/default-configs/arc-softmmu.mak
new file mode 100644
index 0000000000..4300a90c93
--- /dev/null
+++ b/default-configs/arc-softmmu.mak
@@ -0,0 +1,5 @@
+# Default configuration for arc-softmmu
+
+CONFIG_VIRTIO_MMIO=y
+CONFIG_SERIAL=y
+CONFIG_OPENCORES_ETH=y
diff --git a/default-configs/devices/arc-softmmu.mak b/default-configs/devices/arc-softmmu.mak
new file mode 100644
index 0000000000..0ce4176b2d
--- /dev/null
+++ b/default-configs/devices/arc-softmmu.mak
@@ -0,0 +1,7 @@
+# Default configuration for arc-softmmu
+
+CONFIG_SEMIHOSTING=n
+
+# Boards:
+#
+CONFIG_ARC_VIRT=y
diff --git a/default-configs/targets/arc-softmmu.mak b/default-configs/targets/arc-softmmu.mak
new file mode 100644
index 0000000000..31916cb23d
--- /dev/null
+++ b/default-configs/targets/arc-softmmu.mak
@@ -0,0 +1,2 @@
+TARGET_ARCH=arc
+TARGET_XML_FILES= gdb-xml/arc-v2-core.xml gdb-xml/arc-v2-aux.xml gdb-xml/arc-v2-other.xml
diff --git a/disas.c b/disas.c
index 7c18d7d2a7..0085a55fd7 100644
--- a/disas.c
+++ b/disas.c
@@ -208,6 +208,8 @@ static void initialize_debug_host(CPUDebug *s)
     s->info.cap_insn_split = 6;
 #elif defined(__hppa__)
     s->info.print_insn = print_insn_hppa;
+#elif defined(__arc__)
+    s->info.print_insn = print_insn_arc;
 #endif
 }
 
diff --git a/disas/meson.build b/disas/meson.build
index 09a852742e..98271bafb9 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -4,6 +4,7 @@ subdir('libvixl')
 common_ss.add(when: 'CONFIG_ALPHA_DIS', if_true: files('alpha.c'))
 common_ss.add(when: 'CONFIG_ARM_A64_DIS', if_true: files('arm-a64.cc'))
 common_ss.add_all(when: 'CONFIG_ARM_A64_DIS', if_true: libvixl_ss)
+common_ss.add(when: 'CONFIG_ARC_DIS', if_true: files('arc.c'))
 common_ss.add(when: 'CONFIG_ARM_DIS', if_true: files('arm.c'))
 common_ss.add(when: 'CONFIG_CRIS_DIS', if_true: files('cris.c'))
 common_ss.add(when: 'CONFIG_HPPA_DIS', if_true: files('hppa.c'))
diff --git a/hw/Kconfig b/hw/Kconfig
index 4de1797ffd..7c942ba1c2 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -41,6 +41,7 @@ source vfio/Kconfig
 source watchdog/Kconfig
 
 # arch Kconfig
+source arc/Kconfig
 source arm/Kconfig
 source alpha/Kconfig
 source avr/Kconfig
diff --git a/hw/arc/Kconfig b/hw/arc/Kconfig
new file mode 100644
index 0000000000..37402397c6
--- /dev/null
+++ b/hw/arc/Kconfig
@@ -0,0 +1,7 @@
+config ARC_VIRT
+    bool
+    select SERIAL
+    select VIRTIO_MMIO
+
+config ARC
+    bool
diff --git a/hw/arc/Makefile.objs b/hw/arc/Makefile.objs
deleted file mode 100644
index 28d7766cd9..0000000000
--- a/hw/arc/Makefile.objs
+++ /dev/null
@@ -1,21 +0,0 @@
-#
-#  QEMU ARC CPU
-#
-#  Copyright (c) 2019
-#
-#  This library is free software; you can redistribute it and/or
-#  modify it under the terms of the GNU Lesser General Public
-#  License as published by the Free Software Foundation; either
-#  version 2.1 of the License, or (at your option) any later version.
-#
-#  This library is distributed in the hope that it will be useful,
-#  but WITHOUT ANY WARRANTY; without even the implied warranty of
-#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-#  Lesser General Public License for more details.
-#
-#  You should have received a copy of the GNU Lesser General Public
-#  License along with this library; if not, see
-#  http://www.gnu.org/licenses/lgpl-2.1.html
-#
-
-obj-y   = arc_sim.o arc_uart.o sample.o pic_cpu.o boot.o board-hsdk.o sim-hs.o nsim.o
diff --git a/hw/arc/meson.build b/hw/arc/meson.build
index 6a587307a4..f3b517013d 100644
--- a/hw/arc/meson.build
+++ b/hw/arc/meson.build
@@ -1,13 +1,9 @@
 arc_ss = ss.source_set()
 arc_ss.add(files(
   'arc_sim.c',
-  'arc_uart.c',
-  'sample.c',
   'pic_cpu.c',
   'boot.c',
-  'board-hsdk.c',
-  'sim-hs.c',
-  'nsim.c',
 ))
+arc_ss.add(when: 'CONFIG_ARC_VIRT', if_true: files('virt.c'))
 
 hw_arch += {'arc': arc_ss}
diff --git a/hw/meson.build b/hw/meson.build
index 010de7219c..e2b14a9ed8 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -43,6 +43,7 @@ subdir('xen')
 subdir('xenpv')
 
 subdir('alpha')
+subdir('arc')
 subdir('arm')
 subdir('avr')
 subdir('cris')
diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 2164762b46..cb63fd7550 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -206,7 +206,14 @@ enum bfd_architecture
   bfd_arch_v850,       /* NEC V850 */
 #define bfd_mach_v850          0
   bfd_arch_arc,        /* Argonaut RISC Core */
-#define bfd_mach_arc_base 0
+#define bfd_mach_arc_a4        0
+#define bfd_mach_arc_a5        1
+#define bfd_mach_arc_arc600    2
+#define bfd_mach_arc_arc601    4
+#define bfd_mach_arc_arc700    3
+#define bfd_mach_arc_arcv2     5
+#define bfd_mach_arc_arcv2em   6
+#define bfd_mach_arc_arcv2hs   7
   bfd_arch_m32r,       /* Mitsubishi M32R/D */
 #define bfd_mach_m32r          0  /* backwards compatibility */
   bfd_arch_mn10200,    /* Matsushita MN10200 */
@@ -459,6 +466,7 @@ int print_insn_xtensa           (bfd_vma, disassemble_info*);
 int print_insn_riscv32          (bfd_vma, disassemble_info*);
 int print_insn_riscv64          (bfd_vma, disassemble_info*);
 int print_insn_rx(bfd_vma, disassemble_info *);
+int print_insn_arc              (bfd_vma, disassemble_info*);
 
 #ifdef CONFIG_CAPSTONE
 bool cap_disas_target(disassemble_info *info, uint64_t pc, size_t size);
diff --git a/include/elf.h b/include/elf.h
index 7a418ee559..030b15e49c 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -207,6 +207,9 @@ typedef struct mips_elf_abiflags_v0 {
 
 #define EM_TILEGX   191 /* TILE-Gx */
 
+#define EM_ARC_COMPACT  93  /* Synopsys ARCompact */
+#define EM_ARC_COMPACT2 195 /* Synopsys ARCompact V2 */
+
 #define EM_MOXIE           223     /* Moxie processor family */
 #define EM_MOXIE_OLD       0xFEED
 
diff --git a/include/exec/poison.h b/include/exec/poison.h
index 7b9ac361dc..635ccc66a1 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -9,6 +9,7 @@
 #pragma GCC poison TARGET_X86_64
 #pragma GCC poison TARGET_AARCH64
 #pragma GCC poison TARGET_ALPHA
+#pragma GCC poison TARGET_ARC
 #pragma GCC poison TARGET_ARM
 #pragma GCC poison TARGET_CRIS
 #pragma GCC poison TARGET_HPPA
@@ -70,6 +71,7 @@
 
 #pragma GCC poison CONFIG_ALPHA_DIS
 #pragma GCC poison CONFIG_ARM_A64_DIS
+#pragma GCC poison CONFIG_ARC_DIS
 #pragma GCC poison CONFIG_ARM_DIS
 #pragma GCC poison CONFIG_CRIS_DIS
 #pragma GCC poison CONFIG_HPPA_DIS
diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 54f069d491..5fbedebcb0 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -26,6 +26,7 @@ enum {
     QEMU_ARCH_RISCV = (1 << 19),
     QEMU_ARCH_RX = (1 << 20),
     QEMU_ARCH_AVR = (1 << 21),
+    QEMU_ARCH_ARC = (1 << 22),
 
     QEMU_ARCH_NONE = (1 << 31),
 };
diff --git a/meson.build b/meson.build
index 39ac5cf6d8..6e4f8a2cbb 100644
--- a/meson.build
+++ b/meson.build
@@ -53,8 +53,8 @@ have_block = have_system or have_tools
 python = import('python').find_installation()
 
 supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
-supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv32', 'riscv64', 'x86', 'x86_64',
-  'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
+supported_cpus = ['ppc', 'ppc64', 's390x', 'sparc64', 'riscv32', 'riscv64', 'x86', 'x86_64',
+  'arc', 'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
 
 cpu = host_machine.cpu_family()
 targetos = host_machine.system()
@@ -827,6 +827,7 @@ config_target_mak = {}
 
 disassemblers = {
   'alpha' : ['CONFIG_ALPHA_DIS'],
+  'arc' : ['CONFIG_ARC_DIS'],
   'arm' : ['CONFIG_ARM_DIS'],
   'avr' : ['CONFIG_AVR_DIS'],
   'cris' : ['CONFIG_CRIS_DIS'],
diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
index 7fd5c09b2b..27faed5edd 100644
--- a/softmmu/arch_init.c
+++ b/softmmu/arch_init.c
@@ -92,6 +92,8 @@ int graphic_depth = 32;
 #define QEMU_ARCH QEMU_ARCH_XTENSA
 #elif defined(TARGET_AVR)
 #define QEMU_ARCH QEMU_ARCH_AVR
+#elif defined(TARGET_ARC)
+#define QEMU_ARCH QEMU_ARCH_ARC
 #endif
 
 const uint32_t arch_type = QEMU_ARCH;
diff --git a/target/meson.build b/target/meson.build
index 9f0ae93b75..f4a3a6425c 100644
--- a/target/meson.build
+++ b/target/meson.build
@@ -1,4 +1,5 @@
 subdir('alpha')
+subdir('arc')
 subdir('arm')
 subdir('avr')
 subdir('cris')
-- 
2.20.1


