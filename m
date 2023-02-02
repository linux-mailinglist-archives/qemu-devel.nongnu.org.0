Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61469687F6A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 14:59:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNa6b-0006Lk-Uh; Thu, 02 Feb 2023 08:58:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNa6Z-0006L9-Dk
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:58:23 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNa6X-0008TQ-Lc
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:58:23 -0500
Received: by mail-oi1-x22c.google.com with SMTP id s17so1456237ois.10
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 05:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hyw0kbB3HyL6dvLAEEgzaKLD1f2gu7L09y3BM2ynCAM=;
 b=ol/BOfY8Y8b8Vehr3v4IBGfHXA+lNKtlexel/cgU5T8BZonXpBmEp0SqETk2b3KsIT
 aplh2c+IqL8OU6V4366XQToNkZPjS6l/ObLi0r7Wo/oS0jI3QPVDFeVB5yCYNgBGLsMb
 yWM88Qp96/ox8Uf8N7lTFIJzmlmoQe5NPK7YpLOvn9cVgqKe6HMOz5q/DBztnIQhC3AS
 lNbLkc4Ivn/MGNRxsA53yX1xG6Jy2+d184QOH2nK8ZT4rNg+sYUwe0iIvbded6bSKlUd
 9A6AYvvEUqlf2y/BruaAIIFM+SPzbCVnd0cSgt7BIYKDAfmHm/4sIxVHq5En5LQRvwxu
 TvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hyw0kbB3HyL6dvLAEEgzaKLD1f2gu7L09y3BM2ynCAM=;
 b=sEduOIbDO0BQKc+K3fKFonUPf9x21+gc0w2Xxymym0VKO5LzzYsJlEGpVL62ag6O5B
 5CTNXMkHhG0JYy3TaDXkRKE0BH4j8+tcDAV9uAE8G0t3zOs2oRA+J7GzLslg2aIfe4LB
 PZ9PS67XaPsg9TovKRuWQO+UsaA9dMtRwrLLZkIiABV6g3IlfeYWuKjKnGhEnQMv22rJ
 Gjf71/dExNJkECiR4cWz2ViWlSxDYDK3+YpvU6MbJH3b0XgcryOr010TWza/Qk8UunZh
 6oPDQ6+okndqvAOgFZjUxiO2go66NMlt2kIZfHgDLmUQnXCnKBGQe83AZ+aKVr1NNNeJ
 nIRg==
X-Gm-Message-State: AO0yUKUZS9KnWOVv2oAi8X8zJZ/vB+jqY3dFNSQxVg7K7RvHIF/ymVGY
 yhxfLTQOwNv8k73M0Lz4iRTdkwdY/oLIdLGjQMs=
X-Google-Smtp-Source: AK7set/HIqeTV7IWyG7k1uNAwINBXHuJ4bM2nbxz4TSPpSmZosp6Hoy5owhUua8GUgfJsgi2jgAlqg==
X-Received: by 2002:a05:6808:159c:b0:363:a5fd:9cc7 with SMTP id
 t28-20020a056808159c00b00363a5fd9cc7mr2178986oiw.13.1675346300067; 
 Thu, 02 Feb 2023 05:58:20 -0800 (PST)
Received: from grind.. ([177.102.69.207]) by smtp.gmail.com with ESMTPSA id
 m24-20020a05680806d800b00377fae9d36csm6707382oih.52.2023.02.02.05.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 05:58:19 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v10 2/3] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
Date: Thu,  2 Feb 2023 10:58:09 -0300
Message-Id: <20230202135810.1657792-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202135810.1657792-1-dbarboza@ventanamicro.com>
References: <20230202135810.1657792-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22c.google.com
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

The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
the same steps when '-kernel' is used:

- execute load_kernel()
- load init_rd()
- write kernel_cmdline

Let's fold everything inside riscv_load_kernel() to avoid code
repetition. To not change the behavior of boards that aren't calling
riscv_load_init(), add an 'load_initrd' flag to riscv_load_kernel() and
allow these boards to opt out from initrd loading.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c            | 21 ++++++++++++++++++---
 hw/riscv/microchip_pfsoc.c | 11 +----------
 hw/riscv/opentitan.c       |  3 ++-
 hw/riscv/sifive_e.c        |  3 ++-
 hw/riscv/sifive_u.c        | 11 +----------
 hw/riscv/spike.c           | 11 +----------
 hw/riscv/virt.c            | 11 +----------
 include/hw/riscv/boot.h    |  1 +
 8 files changed, 27 insertions(+), 45 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 5ec6d32165..1e32ce1e10 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -176,10 +176,12 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
 target_ulong riscv_load_kernel(MachineState *machine,
                                RISCVHartArrayState *harts,
                                target_ulong kernel_start_addr,
+                               bool load_initrd,
                                symbol_fn_t sym_cb)
 {
     const char *kernel_filename = machine->kernel_filename;
     uint64_t kernel_load_base, kernel_entry, kernel_low;
+    void *fdt = machine->fdt;
 
     g_assert(kernel_filename != NULL);
 
@@ -199,21 +201,34 @@ target_ulong riscv_load_kernel(MachineState *machine,
             kernel_entry = kernel_low;
         }
 
-        return kernel_entry;
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
+    if (load_initrd && machine->initrd_filename) {
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
index 712625d2a4..e81bbd12df 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -630,16 +630,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
-                                         kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen",
-                                    "bootargs", machine->kernel_cmdline);
-        }
+                                         kernel_start_addr, true, NULL);
 
         /* Compute the fdt load address in dram */
         fdt_load_addr = riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 7fe4fb5628..b06944d382 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -102,7 +102,8 @@ static void opentitan_board_init(MachineState *machine)
 
     if (machine->kernel_filename) {
         riscv_load_kernel(machine, &s->soc.cpus,
-                          memmap[IBEX_DEV_RAM].base, NULL);
+                          memmap[IBEX_DEV_RAM].base,
+                          false, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 1a7d381514..04939b60c3 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -115,7 +115,8 @@ static void sifive_e_machine_init(MachineState *machine)
 
     if (machine->kernel_filename) {
         riscv_load_kernel(machine, &s->soc.cpus,
-                          memmap[SIFIVE_E_DEV_DTIM].base, NULL);
+                          memmap[SIFIVE_E_DEV_DTIM].base,
+                          false, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 71be442a50..ad3bb35b34 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -599,16 +599,7 @@ static void sifive_u_machine_init(MachineState *machine)
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
-                                         kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
-                                    machine->kernel_cmdline);
-        }
+                                         kernel_start_addr, true, NULL);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 1fa91167ab..a584d5b3a2 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -307,16 +307,7 @@ static void spike_board_init(MachineState *machine)
 
         kernel_entry = riscv_load_kernel(machine, &s->soc[0],
                                          kernel_start_addr,
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
+                                         true, htif_symbol_callback);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d0531cc641..2f2c82e8df 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1278,16 +1278,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine, &s->soc[0],
-                                         kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
-                                    machine->kernel_cmdline);
-        }
+                                         kernel_start_addr, true, NULL);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 6295316afb..ea1de8b020 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -46,6 +46,7 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
 target_ulong riscv_load_kernel(MachineState *machine,
                                RISCVHartArrayState *harts,
                                target_ulong firmware_end_addr,
+                               bool load_initrd,
                                symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
 uint64_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
-- 
2.39.1


