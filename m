Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9260659027
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 19:12:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAxO7-0007GO-Va; Thu, 29 Dec 2022 13:12:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxO4-0007FZ-Q7
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 13:12:16 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxO2-0003WF-NO
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 13:12:16 -0500
Received: by mail-ot1-x32d.google.com with SMTP id
 i26-20020a9d68da000000b00672301a1664so11873778oto.6
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 10:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JvCsk5fazobkeI5KMWdC1et7lJOWalkdppprwqyNXJQ=;
 b=YSUE1a4syq4d5MN7Hb0z5xSVGXB1QmvgvCq9ix6CugY0O1TXFIwGRyuD9N5QJ4oZha
 Bf3XlLSAo+YCVnxfZX9j0Lc1T52U8qf8NbxF17+1wOZra/pI+bf6+VQkKvpZWaApYkqa
 11L18m+YONswZRF75qyfKlokaLnmt0Oq8mLg8L8VXzbwxSZghM/wn3RPBzP0TFxuStdy
 rAIJOGDKvrGWQZhPQmXrg4CqNjDm+Lv489meBbUT6wcWk+j4TIHPka+5JI8gVDxyM3Xh
 Phfq4H5EH2KRJE0aekpcOiH1bVjb69drhv4bbDhAxgzZnTp/5d8SA5NV9E7MkRyRq+jO
 P1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JvCsk5fazobkeI5KMWdC1et7lJOWalkdppprwqyNXJQ=;
 b=Htv5n8zakZauazh2bPwSUuligkvTQQH9BZ0aH//gGk/4mB1pmHB4JLQ8zdK64uN/9V
 ByGX48X36DAapN8VYBeMHI2tH5n7dPO8sBiQmQOydnomO5XrC5ca5yib2UNPnMFVLIyk
 A7F1rpcHmib0oxn67woFT057YWQWrwykNwc8E7+CNz2IEaIWWN8SgwleR5u9U8IKICjL
 k4G+0bXn9RxxgYTsgPseAhI2H7y9ouXj6NHkPBtr7Quhq8dp3O8XTQFs+kKgHO8C+i4N
 XXUWNh4/CyX0JkRsu9VmmJ1BjhVmDNhh08MuIqQr8dmTIIjD++A6HSnFxcfsqMIy/ipb
 OpLQ==
X-Gm-Message-State: AFqh2kqx+DU+BVajcN703pLPqnqAvSCecsK4WKqz+InN8Oj3lxIe/8iT
 OeuoE9nE/wmA6NjSDKYLHuqt2V1Be//hEdUy
X-Google-Smtp-Source: AMrXdXu2bbhupBG1hEOBvANrD4K/MD30ughv7kZWwIsMEcknD62NRwuP3hxH992EXRjumAoXrDH5hA==
X-Received: by 2002:a05:6830:6502:b0:66e:316b:a603 with SMTP id
 cm2-20020a056830650200b0066e316ba603mr18350554otb.3.1672337533685; 
 Thu, 29 Dec 2022 10:12:13 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 d20-20020a056830139400b0066db09fb1b5sm9267205otq.66.2022.12.29.10.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 10:12:13 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 10/11] hw/riscv/boot.c: introduce
 riscv_load_kernel_and_initrd()
Date: Thu, 29 Dec 2022 15:11:34 -0300
Message-Id: <20221229181135.270661-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229181135.270661-1-dbarboza@ventanamicro.com>
References: <20221229181135.270661-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32d.google.com
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

The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
the same steps when '-kernel' is used:

- execute load_kernel()
- load init_rd()
- write kernel_cmdline in the fdt

Let's fold everything inside riscv_load_kernel() to avoid code
repetition. Every other board that uses riscv_load_kernel() will have
this same behavior, including boards that doesn't have a valid FDT, so
we need to take care to not do FDT operations without checking it first.

Since we're now doing way more than just loading the kernel, rename
riscv_load_kernel() to riscv_load_kernel_and_initrd().

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c            | 27 +++++++++++++++++++++------
 hw/riscv/microchip_pfsoc.c | 12 ++----------
 hw/riscv/opentitan.c       |  2 +-
 hw/riscv/sifive_e.c        |  3 ++-
 hw/riscv/sifive_u.c        | 12 ++----------
 hw/riscv/spike.c           | 14 +++-----------
 hw/riscv/virt.c            | 12 ++----------
 include/hw/riscv/boot.h    |  6 +++---
 8 files changed, 36 insertions(+), 52 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 5606ea6f43..d18262c302 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -171,12 +171,13 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
     exit(1);
 }
 
-target_ulong riscv_load_kernel(MachineState *machine,
-                               target_ulong kernel_start_addr,
-                               symbol_fn_t sym_cb)
+target_ulong riscv_load_kernel_and_initrd(MachineState *machine,
+                                          target_ulong kernel_start_addr,
+                                          symbol_fn_t sym_cb)
 {
     const char *kernel_filename = machine->kernel_filename;
     uint64_t kernel_load_base, kernel_entry;
+    void *fdt = machine->fdt;
 
     g_assert(kernel_filename != NULL);
 
@@ -190,21 +191,35 @@ target_ulong riscv_load_kernel(MachineState *machine,
     if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
                          NULL, &kernel_load_base, NULL, NULL, 0,
                          EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
-        return kernel_load_base;
+        kernel_entry = kernel_load_base;
+        goto out;
     }
 
     if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
                        NULL, NULL, NULL) > 0) {
-        return kernel_entry;
+        goto out;
     }
 
     if (load_image_targphys_as(kernel_filename, kernel_start_addr,
                                current_machine->ram_size, NULL) > 0) {
-        return kernel_start_addr;
+        kernel_entry = kernel_start_addr;
+        goto out;
     }
 
     error_report("could not load kernel '%s'", kernel_filename);
     exit(1);
+
+out:
+    if (machine->initrd_filename) {
+        riscv_load_initrd(machine, kernel_entry);
+    }
+
+    if (fdt && machine->kernel_cmdline && *machine->kernel_cmdline) {
+        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
+                                machine->kernel_cmdline);
+    }
+
+    return kernel_entry;
 }
 
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 82ae5e7023..b64631f166 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -629,16 +629,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen",
-                                    "bootargs", machine->kernel_cmdline);
-        }
+        kernel_entry = riscv_load_kernel_and_initrd(machine, kernel_start_addr,
+                                                    NULL);
 
         /* Compute the fdt load address in dram */
         fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 64d5d435b9..0818d9610c 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -101,7 +101,7 @@ static void opentitan_board_init(MachineState *machine)
     }
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, NULL);
+        riscv_load_kernel_and_initrd(machine, memmap[IBEX_DEV_RAM].base, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 3e3f4b0088..e22628b623 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -114,7 +114,8 @@ static void sifive_e_machine_init(MachineState *machine)
                           memmap[SIFIVE_E_DEV_MROM].base, &address_space_memory);
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base, NULL);
+        riscv_load_kernel_and_initrd(machine, memmap[SIFIVE_E_DEV_DTIM].base,
+                                     NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index bac394c959..b6fb715a9f 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -598,16 +598,8 @@ static void sifive_u_machine_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
-                                    machine->kernel_cmdline);
-        }
+        kernel_entry = riscv_load_kernel_and_initrd(machine, kernel_start_addr,
+                                                    NULL);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index bff9475686..cccfeb4fce 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -307,17 +307,9 @@ static void spike_board_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
-                                         htif_symbol_callback);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
-                                    machine->kernel_cmdline);
-        }
+        kernel_entry = riscv_load_kernel_and_initrd(machine,
+                                                    kernel_start_addr,
+                                                    htif_symbol_callback);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index c8e35f861e..eadf057940 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1281,16 +1281,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
-                                    machine->kernel_cmdline);
-        }
+        kernel_entry = riscv_load_kernel_and_initrd(machine, kernel_start_addr,
+                                                    NULL);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index f94653a09b..16b86450d3 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -43,9 +43,9 @@ char *riscv_find_firmware(const char *firmware_filename,
 target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr,
                                  symbol_fn_t sym_cb);
-target_ulong riscv_load_kernel(MachineState *machine,
-                               target_ulong firmware_end_addr,
-                               symbol_fn_t sym_cb);
+target_ulong riscv_load_kernel_and_initrd(MachineState *machine,
+                                          target_ulong firmware_end_addr,
+                                          symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
 uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
-- 
2.38.1


