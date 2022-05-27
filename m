Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C99536692
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:29:20 +0200 (CEST)
Received: from localhost ([::1]:56114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudm3-0005WB-W1
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nudka-0003TE-V2
 for qemu-devel@nongnu.org; Fri, 27 May 2022 13:27:49 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:39910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nudkY-0004AH-Fl
 for qemu-devel@nongnu.org; Fri, 27 May 2022 13:27:48 -0400
Received: by mail-pg1-x52d.google.com with SMTP id t28so4454331pga.6
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 10:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R9fEsxpNe9MAMJ+kwIPy0PaLfUO5waMOnjwlMai4hzo=;
 b=Asol+bbOuvDoheYbz0xneMquj36d/QZdRJg113NRqDqL2DLHJZpwrcyQgHBLa7Y146
 3FYSANnofp5t9vT39/dp0Gk6BvzoxRV4m99mu84JRUwhhtxzfqrtviIQwgW6HF8q2mZB
 6q4QVF2lcDnsugVuJuJ1ckWeCU7EqjZkU3ed7eR4/gGgnl6VjJgYASxyiVWs7nGi9PY/
 tgYDWPPDUjhooySOB3fykuhdKttBWwi+Pf30ZPZAzbV6/sa+AuP+CZ51TSb9pqgLXw2h
 PgZWAMoEObfWXake+fiDo/7ytVyJcJoIIh7hdZtnzjHs1rTwSFlc3ifwYKNz1FdqVlyZ
 595A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R9fEsxpNe9MAMJ+kwIPy0PaLfUO5waMOnjwlMai4hzo=;
 b=R6Dgcg3H86Ybt39SSaAyRxnDFTGoeugxS//9shyYqiD9nx56udQeYXgR8JSDh0s1C9
 jIHjrI4wEqSrH9bJHsbpGpWQmpn6Bw1gHNQmyfaxmfSGSK9Xgm/n7OIqlu3Hx15RuvG4
 4fwsOk9oagJ4wm8IlToKwjgu3VB8CbyEANY1mt1RZpdZ24NLI1FlQ2XAbYcqbtVuClql
 yipIr6PlhDT87dLBzgwka3soUPXXMmnNjt4Y6Wuf+8T8neQJG2bLa8Cpufijo2KuZ4Rq
 x33GvgB2vQq+ZfxJSxqODwpt5ZFwEuXFVn7Mu+6VNFPkWWW+Z4InDBfcGwzBJNyqCKz3
 MWTQ==
X-Gm-Message-State: AOAM532pWri9w/5hv2qXlETrQ0aiO7E39bS1v+BlJKXppjSNEwLSRh0P
 pLUv+5AQ8J4UIZxlthDuYhyfzFnEUWwXZA==
X-Google-Smtp-Source: ABdhPJw40BWHo7PH3EHHet4KPvoHKCclXDbNMW7tvZzXA3aLqe92/mQzOXVhc8yEsy0TykXVKJJ20Q==
X-Received: by 2002:a63:3197:0:b0:3fb:c60e:334d with SMTP id
 x145-20020a633197000000b003fbc60e334dmr1325990pgx.263.1653672464607; 
 Fri, 27 May 2022 10:27:44 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 i6-20020aa787c6000000b0050dc762818asm3774316pfo.100.2022.05.27.10.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 10:27:44 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Stafford Horne <shorne@gmail.com>,
 Jia Liu <proljc@gmail.com>
Subject: [RFC PATCH 2/3] hw/openrisc: Split re-usable boot time apis out to
 boot.c
Date: Sat, 28 May 2022 02:27:29 +0900
Message-Id: <20220527172731.1742837-3-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220527172731.1742837-1-shorne@gmail.com>
References: <20220527172731.1742837-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x52d.google.com
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

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 hw/openrisc/boot.c         | 127 +++++++++++++++++++++++++++++++++++++
 hw/openrisc/meson.build    |   1 +
 hw/openrisc/openrisc_sim.c | 106 ++-----------------------------
 include/hw/openrisc/boot.h |  34 ++++++++++
 4 files changed, 168 insertions(+), 100 deletions(-)
 create mode 100644 hw/openrisc/boot.c
 create mode 100644 include/hw/openrisc/boot.h

diff --git a/hw/openrisc/boot.c b/hw/openrisc/boot.c
new file mode 100644
index 0000000000..32f0925a8c
--- /dev/null
+++ b/hw/openrisc/boot.c
@@ -0,0 +1,127 @@
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
+
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
2.31.1


