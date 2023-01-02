Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502DA65B18A
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 12:55:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCJNN-0007IC-N6; Mon, 02 Jan 2023 06:53:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pCJNK-0007Hk-TC
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:53:06 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pCJNJ-0002w9-6L
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:53:06 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1441d7d40c6so33421458fac.8
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 03:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h/tVtZ9GkUVaaiXEE01175qcEKY/cJoHRK1XXhkLTCg=;
 b=UU6cpk+6zjtvxoPF2OmZ74ykyO67lQpcRqivb3m1eCuXJ/8Z6zBN4QKUQNF+wG2+wk
 48/IxIA/0aE3CR9i9/vToSXjOxmXi42bKxcwLylp2HeUktP1DhA6p3TFD1NOzSpPx4R8
 5WgNZM811jy2A1gxuM6bu3ljP5GiXVCbs5LchK95fIpK1aqUPOdr5yij2XqfGFEzv70q
 0KWAGTY/T8HvOMPCB/waDJWu34OwE3AmKQEbk6Ttp1/p24vZakGA6lrf3Sjfn4Ie6V0C
 su7Lf6YrkWybKDuRVZNqug67dharwEf0+U/KYL/+lSXYYm3DGvIGTzhiD+wYlYpBuju4
 eQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h/tVtZ9GkUVaaiXEE01175qcEKY/cJoHRK1XXhkLTCg=;
 b=ZLSStqyQgnzAvVehlrtEv00AEngO3d7vUNnrhzImsVwcOywytSshIxYh18kY8cyolQ
 t9bd2hYH2E58NXqVWEB7IXWpYDg8dpjJJsstzb2qTUsocoZ7nRJQY8pQCDX+xzOoWi43
 jhSRTZPM0QoteIVyp90gMkNtj7FQBlae+mUyYqjnypAcFRYs9kmasbM1jtKqTYun2egW
 AmWaqLYF2MHkWtdjJLVOpko9oQQGHScSeHtw1mDLbUsBlJ+Y0tyqIJGT46Z8x8dlf9qV
 o+WxPrMvtQhhsidY+G6XqyIwJ3bHM0YneEc0CiEoDVAZLymAnRmGnAFNEh7N6Wpf7l2i
 uWIg==
X-Gm-Message-State: AFqh2krrgXN3EBoBRF05D5vZKLvQOviJqst1SatBnqDLXx3x6PX6KXQi
 r64ZJT30VIYzEDc1d9LOzi/093ylqA4CeHhH
X-Google-Smtp-Source: AMrXdXsxQxgAsO6xFltjM9Me5eBzUdCJU3ek0n71I1ORX0JuqIhcCA2pH84r2NWDqpZbD1V5WZA7rA==
X-Received: by 2002:a05:6870:4b93:b0:144:e1eb:432 with SMTP id
 lx19-20020a0568704b9300b00144e1eb0432mr21975170oab.51.1672660383647; 
 Mon, 02 Jan 2023 03:53:03 -0800 (PST)
Received: from grind.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 l39-20020a05687106a700b0014fb4bdc746sm11354475oao.8.2023.01.02.03.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 03:53:03 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bmeng@tinylab.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 06/11] hw/riscv: write initrd 'chosen' FDT inside
 riscv_load_initrd()
Date: Mon,  2 Jan 2023 08:52:36 -0300
Message-Id: <20230102115241.25733-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102115241.25733-1-dbarboza@ventanamicro.com>
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

riscv_load_initrd() returns the initrd end addr while also writing a
'start' var to mark the addr start. These informations are being used
just to write the initrd FDT node. Every existing caller of
riscv_load_initrd() is writing the FDT in the same manner.

We can simplify things by writing the FDT inside riscv_load_initrd(),
sparing callers from having to manage start/end addrs to write the FDT
themselves.

An 'if (fdt)' check is already inserted at the end of the function
because we'll end up using it later on with other boards that doesn´t
have a FDT.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/boot.c            | 18 ++++++++++++------
 hw/riscv/microchip_pfsoc.c | 10 ++--------
 hw/riscv/sifive_u.c        | 10 ++--------
 hw/riscv/spike.c           | 10 ++--------
 hw/riscv/virt.c            | 10 ++--------
 include/hw/riscv/boot.h    |  4 ++--
 6 files changed, 22 insertions(+), 40 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 31aa3385a0..6b948d1c9e 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -208,9 +208,10 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
     exit(1);
 }
 
-hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
-                         uint64_t kernel_entry, hwaddr *start)
+void riscv_load_initrd(const char *filename, uint64_t mem_size,
+                       uint64_t kernel_entry, void *fdt)
 {
+    hwaddr start, end;
     ssize_t size;
 
     g_assert(filename != NULL);
@@ -226,18 +227,23 @@ hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
      * halfway into RAM, and for boards with 256MB of RAM or more we put
      * the initrd at 128MB.
      */
-    *start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
+    start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
 
-    size = load_ramdisk(filename, *start, mem_size - *start);
+    size = load_ramdisk(filename, start, mem_size - start);
     if (size == -1) {
-        size = load_image_targphys(filename, *start, mem_size - *start);
+        size = load_image_targphys(filename, start, mem_size - start);
         if (size == -1) {
             error_report("could not load ramdisk '%s'", filename);
             exit(1);
         }
     }
 
-    return *start + size;
+    /* Some RISC-V machines (e.g. opentitan) don't have a fdt. */
+    if (fdt) {
+        end = start + size;
+        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start", start);
+        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end", end);
+    }
 }
 
 uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index b10321b564..593a799549 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -633,14 +633,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
                                          kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
-            hwaddr start;
-            hwaddr end = riscv_load_initrd(machine->initrd_filename,
-                                           machine->ram_size, kernel_entry,
-                                           &start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
-                                  "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
-                                  "linux,initrd-end", end);
+            riscv_load_initrd(machine->initrd_filename, machine->ram_size,
+                              kernel_entry, machine->fdt);
         }
 
         if (machine->kernel_cmdline && *machine->kernel_cmdline) {
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ddceb750ea..37f5087172 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -608,14 +608,8 @@ static void sifive_u_machine_init(MachineState *machine)
                                          kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
-            hwaddr start;
-            hwaddr end = riscv_load_initrd(machine->initrd_filename,
-                                           machine->ram_size, kernel_entry,
-                                           &start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
-                                  "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
-                                  end);
+            riscv_load_initrd(machine->initrd_filename, machine->ram_size,
+                              kernel_entry, machine->fdt);
         }
     } else {
        /*
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 004dfb2d5b..5668fe0694 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -316,14 +316,8 @@ static void spike_board_init(MachineState *machine)
                                          htif_symbol_callback);
 
         if (machine->initrd_filename) {
-            hwaddr start;
-            hwaddr end = riscv_load_initrd(machine->initrd_filename,
-                                           machine->ram_size, kernel_entry,
-                                           &start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
-                                  "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
-                                  end);
+            riscv_load_initrd(machine->initrd_filename, machine->ram_size,
+                              kernel_entry, machine->fdt);
         }
     } else {
        /*
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 408f7a2256..5967b136b4 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1291,14 +1291,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
                                          kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
-            hwaddr start;
-            hwaddr end = riscv_load_initrd(machine->initrd_filename,
-                                           machine->ram_size, kernel_entry,
-                                           &start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
-                                  "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
-                                  end);
+            riscv_load_initrd(machine->initrd_filename, machine->ram_size,
+                              kernel_entry, machine->fdt);
         }
     } else {
        /*
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index b273ab22f7..e37e1d1238 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -46,8 +46,8 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
 target_ulong riscv_load_kernel(const char *kernel_filename,
                                target_ulong firmware_end_addr,
                                symbol_fn_t sym_cb);
-hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
-                         uint64_t kernel_entry, hwaddr *start);
+void riscv_load_initrd(const char *filename, uint64_t mem_size,
+                       uint64_t kernel_entry, void *fdt);
 uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
-- 
2.39.0


