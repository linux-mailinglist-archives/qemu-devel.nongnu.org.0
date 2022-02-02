Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D33A4A7B32
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 23:40:48 +0100 (CET)
Received: from localhost ([::1]:53656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFOIx-0002Nw-6Y
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 17:40:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nFOEG-0008Q6-AE
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 17:35:56 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:58309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nFOEA-0004QV-43
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 17:35:56 -0500
Received: from quad ([82.142.10.94]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MkHIV-1mV66c0gCP-00kehX; Wed, 02
 Feb 2022 23:35:31 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] m68k: virt: add a bootstrap ROM
Date: Wed,  2 Feb 2022 23:35:27 +0100
Message-Id: <20220202223528.1260154-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220202223528.1260154-1-laurent@vivier.eu>
References: <20220202223528.1260154-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:O0kJ/8Qxq4rAB0Q884YqrGJd/+wNoqvxnOatJDdJ+pqL7SK+Shb
 vcoY0ESnGxYszuJT528b3PFSsiDzRsqjcmo3jyhkytyzLLdk7Cf7oja5vKXp0J1RI9eeMFi
 qVyfvRwxsIB54CGQX1h619A1dyL/8W4Z6YJPR4eb29nhweEgTKsGl52titA1onCGTb4ppdT
 8YCkWqrVDbhMU6/V1aOPQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZbCPHpKiAog=:cZymHe5qcv0C3t4V7DXvCM
 aQVvRr0bYUpG6v5iD8autrDRZ8sbHunxhDBbIVLcFfRjhJXQOXMOwNAywqgqYwyf2xiriuCWo
 qFUyttwdTF/39E0TF/eRhLl7MYgNaSSryi8N77IU4nI3vcJpiXv1flnReHo+fqABn+j7n/Znx
 0RWougdMB0E4hIctIyDS2HLg6BZ7nYEX0tREU+g6kiKlDICabbgZSDLK9rdNet0XNUtK8jKLG
 7e7b1oB1TTWKAbdcjhQQgzAhESOa7AiVw8xZGSVqgkZDMyh3S5V2KJ9sUJd56SUw8IRagudZr
 tAJ8Vcl7PjDEdB7aR3mFUfV0y8SGLYphHHwezAXY4w0fjB8WMTtaLBOoq6JZV9XBC6JZccVR8
 fxWb8s+SOT0xEtaMntC/CppkMDgGjzv/emtRhaRMRGRhofPf1sFRMVeh83UcqX5phYmFeT98O
 4b8KTzrOgVxQ2NOLeiiT/lG+APJYaRFhM1VbniZD8GOySZGsZpoJ08q9lCDvJBAnQsVZXC7Hs
 G0y8mkOJ48sVMzsMtoxyhkITTxdKuzWZmsqvVSqgj/WtxUG377ibZWvXzJX+miRIJ1WW2BmAy
 ywXHNm77hxdBMUAAyQdH+7uy296voROpqsdtA1MrXiSbV8l/x6a7RDFDI9E3Cnly8QfVa392Y
 GKdpRKCQ0/zIUD3z+srLa3Av8PMvw1uKTullKfHDy+pNermhGUZ3IT5AJSzcEBnNcQ0Y=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This ROM will be started by QEMU and will load the firmware.
The firware will be based on Petit Boot, the aim of the bootstrap
is to ask QEMU to load the kernel and initramfs to the RAM.

It also builds the bootinfo structure to pass to the kernel the
same way QEMU does when it loads directly the kernel.

To build the bootstrap:
$ git submodule init roms/m68k-virt
$ git submodule updage roms/m68k-virt
$ make -C roms m68k-virt-bootrom

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/virt.c      | 32 ++++++++++++++++++++++++++++++++
 .gitmodules         |  3 +++
 pc-bios/meson.build |  1 +
 roms/Makefile       |  7 +++++++
 roms/m68k-virt      |  1 +
 5 files changed, 44 insertions(+)
 create mode 160000 roms/m68k-virt

diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index bbaf630bbf20..11aff6d93865 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -10,6 +10,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "sysemu/sysemu.h"
 #include "cpu.h"
 #include "hw/boards.h"
@@ -85,6 +86,13 @@
 #define VIRT_VIRTIO_MMIO_BASE 0xff010000     /* MMIO: 0xff010000 - 0xff01ffff */
 #define VIRT_VIRTIO_IRQ_BASE  PIC_IRQ(2, 1)  /* PIC: 2, 3, 4, 5, IRQ: ALL */
 
+/*
+ * At the end of the memory address space we have a 1 MB ROM
+ */
+#define VIRT_ROM_ADDR 0xfff00000
+#define VIRT_ROM_SIZE 0x00100000
+#define VIRT_ROM_NAME "m68k-virt.rom"
+
 typedef struct {
     M68kCPU *cpu;
     hwaddr initial_pc;
@@ -113,12 +121,16 @@ static void virt_init(MachineState *machine)
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
     const char *kernel_cmdline = machine->kernel_cmdline;
+    const char *bios_name = machine->firmware ?: VIRT_ROM_NAME;
     hwaddr parameters_base;
     DeviceState *dev;
     DeviceState *irqc_dev;
     DeviceState *pic_dev[VIRT_GF_PIC_NB];
     SysBusDevice *sysbus;
     hwaddr io_base;
+    MemoryRegion *rom;
+    int bios_size;
+    char *filename;
     int i;
     ResetInfo *reset_info;
 
@@ -207,6 +219,19 @@ static void virt_init(MachineState *machine)
         io_base += 0x200;
     }
 
+    /* Load ROM */
+    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+    if (filename) {
+        rom = g_malloc(sizeof(*rom));
+        memory_region_init_rom(rom, NULL, "m68k-virt.rom", VIRT_ROM_SIZE,
+                           &error_abort);
+        memory_region_add_subregion(get_system_memory(), VIRT_ROM_ADDR, rom);
+        bios_size = load_image_targphys(filename, VIRT_ROM_ADDR, VIRT_ROM_SIZE);
+    } else {
+        bios_size = -1;
+    }
+
+    /* Load kernel if needed */
     if (kernel_filename) {
         CPUState *cs = CPU(cpu);
         uint64_t high;
@@ -265,6 +290,13 @@ static void virt_init(MachineState *machine)
             initrd_size = 0;
         }
         BOOTINFO0(cs->as, parameters_base, BI_LAST);
+    } else {
+        if (bios_size != VIRT_ROM_SIZE) {
+            error_report("ROM not found (%s) and no kernel provided",
+                         bios_name);
+            exit(EXIT_FAILURE);
+        }
+        reset_info->initial_pc = VIRT_ROM_ADDR;
     }
 }
 
diff --git a/.gitmodules b/.gitmodules
index 84425d87e28a..315d597d057a 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -67,3 +67,6 @@
 [submodule "tests/lcitool/libvirt-ci"]
 	path = tests/lcitool/libvirt-ci
 	url = http://gitlab.com/libvirt/libvirt-ci
+[submodule "roms/m68k-virt"]
+	path = roms/m68k-virt
+	url = https://github.com/vivier/m68k-virt-bootstrap.git
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 4ac7a5509b69..ffec6decdc4c 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -81,6 +81,7 @@ blobs = files(
   'opensbi-riscv32-generic-fw_dynamic.bin',
   'opensbi-riscv64-generic-fw_dynamic.bin',
   'npcm7xx_bootrom.bin',
+  'm68k-virt.rom',
 )
 
 if get_option('install_blobs')
diff --git a/roms/Makefile b/roms/Makefile
index 5e44d9789001..f9f84e8efb1b 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -40,6 +40,7 @@ powerpc_cross_prefix := $(call find-cross-prefix,powerpc)
 x86_64_cross_prefix := $(call find-cross-prefix,x86_64)
 riscv32_cross_prefix := $(call find-cross-prefix,riscv32)
 riscv64_cross_prefix := $(call find-cross-prefix,riscv64)
+m68k_cross_prefix := $(call find-cross-prefix,m68k)
 
 # tag our seabios builds
 SEABIOS_EXTRAVERSION="-prebuilt.qemu.org"
@@ -69,6 +70,7 @@ default help:
 	@echo "  opensbi32-generic  -- update OpenSBI for 32-bit generic machine"
 	@echo "  opensbi64-generic  -- update OpenSBI for 64-bit generic machine"
 	@echo "  qboot              -- update qboot"
+	@echo "  m68k-virt-bootrom  -- update m68k-virt bootrom"
 	@echo "  clean              -- delete the files generated by the previous" \
 	                              "build targets"
 
@@ -197,6 +199,10 @@ npcm7xx_bootrom:
 	$(MAKE) -C vbootrom CROSS_COMPILE=$(arm_cross_prefix)
 	cp vbootrom/npcm7xx_bootrom.bin ../pc-bios/npcm7xx_bootrom.bin
 
+m68k-virt-bootrom:
+	$(MAKE) -C m68k-virt CROSS_COMPILE=$(m68k_cross_prefix)
+	cp m68k-virt/rom.bin ../pc-bios/m68k-virt.rom
+
 clean:
 	rm -rf seabios/.config seabios/out seabios/builds
 	$(MAKE) -C sgabios clean
@@ -211,3 +217,4 @@ clean:
 	$(MAKE) -C opensbi clean
 	$(MAKE) -C qboot clean
 	$(MAKE) -C vbootrom clean
+	$(MAKE) -C m68k-virt clean
diff --git a/roms/m68k-virt b/roms/m68k-virt
new file mode 160000
index 000000000000..f2a4daa7cd11
--- /dev/null
+++ b/roms/m68k-virt
@@ -0,0 +1 @@
+Subproject commit f2a4daa7cd11d35fa48236653211897b50977144
-- 
2.34.1


