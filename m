Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 571B45AC341
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 09:37:56 +0200 (CEST)
Received: from localhost ([::1]:53894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUkCY-0002Lx-9t
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 03:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oUk1I-0007iX-SH
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:26:17 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oUk1G-000308-74
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:26:16 -0400
Received: by mail-wr1-x42c.google.com with SMTP id az27so7484516wrb.6
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 00:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Wh/2VlZ3lvYxts+HYnKl+oYvFn9obyQnvS2fmVmXK2U=;
 b=bobtovzoF7NCbg21FCTo04cQWXA7n0cJgs9Vf0cM2Hw1XmqLJKMz6K09ZbBTKdaYSI
 +Q/GpAzjFRgcgqI51y4yFWsOuMCYsOKSuwkRG8B3OlOCQwcawmz+9jRD0g+BFm+KO/Nt
 EDPqQgteoQyOOivAwRbUjbBZmD+K5aSVwibDqKXGCl4ddPYoR3dn2OQ2u4IGLx0lBKhZ
 /6/I0FmZOa0AGUoibKMoZ5UTp7BYCiSxXeVzFjvQBcwTsrf6UsBDi14+sjsUQYMXP01H
 pomm2MpdPAC/OqtDcDNGJ3vtwY1I1PFczxU/2zZsCtI11kXMTdhQE0NBDSJ14copF/ve
 Rulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Wh/2VlZ3lvYxts+HYnKl+oYvFn9obyQnvS2fmVmXK2U=;
 b=fhjMNXfYhTPoBGQmvhdYBYLKNs/5y2JUVllI6nGLPKlW6PBKWURpnsW/TYPJt7IWD4
 i6CLK77VJeGXDqgNaiAS9JlX71U0IXyedU9MvymbkDi0awt8jULUSApzLwEjrjQxGUcT
 UF4y+yUhGL95801KI2xcCkgvSm6GhJsS2PargCkokCguuvUXG7QG60m+RZk4DEs/KbCb
 RDtLijoRRiWrBT1jUA1fpLGO9+hPSKD/C6b5xD62iBsDC/wKnCoWE+HGzOGC1lqilpae
 7tNHXQ/vwxijYtn6lWPfsCjlSotC7FeRgiTSKyj3br7LUikZhGTjASvA3IWoaxbJCYMe
 DxgA==
X-Gm-Message-State: ACgBeo3j+lk9e2fzbeT4kAWO+zTnsCzORYe8mwQoGmWonCCwQ7dbOQB3
 d8s7UhR6OwSlm5EXZ7bGhfrx5n8i/9o=
X-Google-Smtp-Source: AA6agR6i1/8jsZ6esYIYFziZYtM9L14M+/LS63ZIZbRFiSPhTJxHwRo0VOgEuYnfsC/V2ndAM5klig==
X-Received: by 2002:a5d:5a99:0:b0:226:df2b:c38 with SMTP id
 bp25-20020a5d5a99000000b00226df2b0c38mr16405439wrb.298.1662276372101; 
 Sun, 04 Sep 2022 00:26:12 -0700 (PDT)
Received: from localhost ([88.83.123.243]) by smtp.gmail.com with ESMTPSA id
 n8-20020a5d6608000000b0021efc75914esm5294623wru.79.2022.09.04.00.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 00:26:11 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: qemu-devel@nongnu.org
Cc: openrisc@lists.librecores.org, Stafford Horne <shorne@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 01/11] hw/openrisc: Split re-usable boot time apis out to boot.c
Date: Sun,  4 Sep 2022 08:25:57 +0100
Message-Id: <20220904072607.44275-2-shorne@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904072607.44275-1-shorne@gmail.com>
References: <20220904072607.44275-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=shorne@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These will be shared with the virt platform.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 hw/openrisc/boot.c         | 116 +++++++++++++++++++++++++++++++++++++
 hw/openrisc/meson.build    |   1 +
 hw/openrisc/openrisc_sim.c | 106 ++-------------------------------
 include/hw/openrisc/boot.h |  34 +++++++++++
 4 files changed, 157 insertions(+), 100 deletions(-)
 create mode 100644 hw/openrisc/boot.c
 create mode 100644 include/hw/openrisc/boot.h

diff --git a/hw/openrisc/boot.c b/hw/openrisc/boot.c
new file mode 100644
index 0000000000..128ccbcba2
--- /dev/null
+++ b/hw/openrisc/boot.c
@@ -0,0 +1,116 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * QEMU OpenRISC boot helpers.
+ *
+ * (c) 2022 Stafford Horne <shorne@gmail.com>
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/cpu-defs.h"
+#include "elf.h"
+#include "hw/loader.h"
+#include "hw/openrisc/boot.h"
+#include "sysemu/device_tree.h"
+#include "sysemu/qtest.h"
+
+#include <libfdt.h>
+
+#define KERNEL_LOAD_ADDR 0x100
+
+hwaddr openrisc_load_kernel(ram_addr_t ram_size,
+                            const char *kernel_filename,
+                            uint32_t *bootstrap_pc)
+{
+    long kernel_size;
+    uint64_t elf_entry;
+    uint64_t high_addr;
+    hwaddr entry;
+
+    if (kernel_filename && !qtest_enabled()) {
+        kernel_size = load_elf(kernel_filename, NULL, NULL, NULL,
+                               &elf_entry, NULL, &high_addr, NULL, 1,
+                               EM_OPENRISC, 1, 0);
+        entry = elf_entry;
+        if (kernel_size < 0) {
+            kernel_size = load_uimage(kernel_filename,
+                                      &entry, NULL, NULL, NULL, NULL);
+            high_addr = entry + kernel_size;
+        }
+        if (kernel_size < 0) {
+            kernel_size = load_image_targphys(kernel_filename,
+                                              KERNEL_LOAD_ADDR,
+                                              ram_size - KERNEL_LOAD_ADDR);
+            high_addr = KERNEL_LOAD_ADDR + kernel_size;
+        }
+
+        if (entry <= 0) {
+            entry = KERNEL_LOAD_ADDR;
+        }
+
+        if (kernel_size < 0) {
+            error_report("couldn't load the kernel '%s'", kernel_filename);
+            exit(1);
+        }
+        *bootstrap_pc = entry;
+
+        return high_addr;
+    }
+    return 0;
+}
+
+hwaddr openrisc_load_initrd(void *fdt, const char *filename,
+                            hwaddr load_start, uint64_t mem_size)
+{
+    int size;
+    hwaddr start;
+
+    /* We put the initrd right after the kernel; page aligned. */
+    start = TARGET_PAGE_ALIGN(load_start);
+
+    size = load_ramdisk(filename, start, mem_size - start);
+    if (size < 0) {
+        size = load_image_targphys(filename, start, mem_size - start);
+        if (size < 0) {
+            error_report("could not load ramdisk '%s'", filename);
+            exit(1);
+        }
+    }
+
+    if (fdt) {
+        qemu_fdt_setprop_cell(fdt, "/chosen",
+                              "linux,initrd-start", start);
+        qemu_fdt_setprop_cell(fdt, "/chosen",
+                              "linux,initrd-end", start + size);
+    }
+
+    return start + size;
+}
+
+uint32_t openrisc_load_fdt(void *fdt, hwaddr load_start,
+                           uint64_t mem_size)
+{
+    uint32_t fdt_addr;
+    int ret;
+    int fdtsize = fdt_totalsize(fdt);
+
+    if (fdtsize <= 0) {
+        error_report("invalid device-tree");
+        exit(1);
+    }
+
+    /* We put fdt right after the kernel and/or initrd. */
+    fdt_addr = TARGET_PAGE_ALIGN(load_start);
+
+    ret = fdt_pack(fdt);
+    /* Should only fail if we've built a corrupted tree */
+    g_assert(ret == 0);
+    /* copy in the device tree */
+    qemu_fdt_dumpdtb(fdt, fdtsize);
+
+    rom_add_blob_fixed_as("fdt", fdt, fdtsize, fdt_addr,
+                          &address_space_memory);
+
+    return fdt_addr;
+}
diff --git a/hw/openrisc/meson.build b/hw/openrisc/meson.build
index ec48172c9d..ab563820c5 100644
--- a/hw/openrisc/meson.build
+++ b/hw/openrisc/meson.build
@@ -1,5 +1,6 @@
 openrisc_ss = ss.source_set()
 openrisc_ss.add(files('cputimer.c'))
+openrisc_ss.add(files('boot.c'))
 openrisc_ss.add(when: 'CONFIG_OR1K_SIM', if_true: [files('openrisc_sim.c'), fdt])
 
 hw_arch += {'openrisc': openrisc_ss}
diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 35adce17ac..35da123aef 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -24,10 +24,9 @@
 #include "cpu.h"
 #include "hw/irq.h"
 #include "hw/boards.h"
-#include "elf.h"
 #include "hw/char/serial.h"
 #include "net/net.h"
-#include "hw/loader.h"
+#include "hw/openrisc/boot.h"
 #include "hw/qdev-properties.h"
 #include "exec/address-spaces.h"
 #include "sysemu/device_tree.h"
@@ -283,101 +282,6 @@ static void openrisc_sim_serial_init(Or1ksimState *state, hwaddr base,
     g_free(nodename);
 }
 
-static hwaddr openrisc_load_kernel(ram_addr_t ram_size,
-                                   const char *kernel_filename)
-{
-    long kernel_size;
-    uint64_t elf_entry;
-    uint64_t high_addr;
-    hwaddr entry;
-
-    if (kernel_filename && !qtest_enabled()) {
-        kernel_size = load_elf(kernel_filename, NULL, NULL, NULL,
-                               &elf_entry, NULL, &high_addr, NULL, 1,
-                               EM_OPENRISC, 1, 0);
-        entry = elf_entry;
-        if (kernel_size < 0) {
-            kernel_size = load_uimage(kernel_filename,
-                                      &entry, NULL, NULL, NULL, NULL);
-            high_addr = entry + kernel_size;
-        }
-        if (kernel_size < 0) {
-            kernel_size = load_image_targphys(kernel_filename,
-                                              KERNEL_LOAD_ADDR,
-                                              ram_size - KERNEL_LOAD_ADDR);
-            high_addr = KERNEL_LOAD_ADDR + kernel_size;
-        }
-
-        if (entry <= 0) {
-            entry = KERNEL_LOAD_ADDR;
-        }
-
-        if (kernel_size < 0) {
-            error_report("couldn't load the kernel '%s'", kernel_filename);
-            exit(1);
-        }
-        boot_info.bootstrap_pc = entry;
-
-        return high_addr;
-    }
-    return 0;
-}
-
-static hwaddr openrisc_load_initrd(Or1ksimState *state, const char *filename,
-                                   hwaddr load_start, uint64_t mem_size)
-{
-    void *fdt = state->fdt;
-    int size;
-    hwaddr start;
-
-    /* We put the initrd right after the kernel; page aligned. */
-    start = TARGET_PAGE_ALIGN(load_start);
-
-    size = load_ramdisk(filename, start, mem_size - start);
-    if (size < 0) {
-        size = load_image_targphys(filename, start, mem_size - start);
-        if (size < 0) {
-            error_report("could not load ramdisk '%s'", filename);
-            exit(1);
-        }
-    }
-
-    qemu_fdt_setprop_cell(fdt, "/chosen",
-                          "linux,initrd-start", start);
-    qemu_fdt_setprop_cell(fdt, "/chosen",
-                          "linux,initrd-end", start + size);
-
-    return start + size;
-}
-
-static uint32_t openrisc_load_fdt(Or1ksimState *state, hwaddr load_start,
-                                  uint64_t mem_size)
-{
-    void *fdt = state->fdt;
-    uint32_t fdt_addr;
-    int ret;
-    int fdtsize = fdt_totalsize(fdt);
-
-    if (fdtsize <= 0) {
-        error_report("invalid device-tree");
-        exit(1);
-    }
-
-    /* We put fdt right after the kernel and/or initrd. */
-    fdt_addr = TARGET_PAGE_ALIGN(load_start);
-
-    ret = fdt_pack(fdt);
-    /* Should only fail if we've built a corrupted tree */
-    g_assert(ret == 0);
-    /* copy in the device tree */
-    qemu_fdt_dumpdtb(fdt, fdtsize);
-
-    rom_add_blob_fixed_as("fdt", fdt, fdtsize, fdt_addr,
-                          &address_space_memory);
-
-    return fdt_addr;
-}
-
 static void openrisc_sim_init(MachineState *machine)
 {
     ram_addr_t ram_size = machine->ram_size;
@@ -428,13 +332,15 @@ static void openrisc_sim_init(MachineState *machine)
                                  or1ksim_memmap[OR1KSIM_UART].size,
                                  smp_cpus, cpus, OR1KSIM_UART_IRQ, n);
 
-    load_addr = openrisc_load_kernel(ram_size, kernel_filename);
+    load_addr = openrisc_load_kernel(ram_size, kernel_filename,
+                                     &boot_info.bootstrap_pc);
     if (load_addr > 0) {
         if (machine->initrd_filename) {
-            load_addr = openrisc_load_initrd(state, machine->initrd_filename,
+            load_addr = openrisc_load_initrd(state->fdt,
+                                             machine->initrd_filename,
                                              load_addr, machine->ram_size);
         }
-        boot_info.fdt_addr = openrisc_load_fdt(state, load_addr,
+        boot_info.fdt_addr = openrisc_load_fdt(state->fdt, load_addr,
                                                machine->ram_size);
     }
 }
diff --git a/include/hw/openrisc/boot.h b/include/hw/openrisc/boot.h
new file mode 100644
index 0000000000..25a313d63a
--- /dev/null
+++ b/include/hw/openrisc/boot.h
@@ -0,0 +1,34 @@
+/*
+ * QEMU OpenRISC boot helpers.
+ *
+ * Copyright (c) 2022 Stafford Horne <shorne@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef OPENRISC_BOOT_H
+#define OPENRISC_BOOT_H
+
+#include "exec/cpu-defs.h"
+
+hwaddr openrisc_load_kernel(ram_addr_t ram_size,
+                            const char *kernel_filename,
+                            uint32_t *bootstrap_pc);
+
+hwaddr openrisc_load_initrd(void *fdt, const char *filename,
+                            hwaddr load_start, uint64_t mem_size);
+
+uint32_t openrisc_load_fdt(void *fdt, hwaddr load_start,
+                           uint64_t mem_size);
+
+#endif /* OPENRISC_BOOT_H */
-- 
2.37.2


