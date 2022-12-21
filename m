Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6947B653658
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:28:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83kd-00089v-2q; Wed, 21 Dec 2022 13:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kb-00088t-7V
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:23:33 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kZ-0007og-G3
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:23:33 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-12c8312131fso20141788fac.4
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nAtAM5x8S/ZPGivdQ7BsLDTU3Z8ReHOtMwCvIqWKh0Y=;
 b=HBlwcVDu9iVFKTK4tBYWOyBFAzl4mCuCo4VjFvK4Ej7pIgqYlQePhGSTysiOhU1Q80
 8mU/8Rl1okoeSJGkJw8zyIOv1iNaI1qgAMFY2MN9EYUzL/9Fu9kuS62Odq67YkhbPgGS
 sI0Lg/xBjfSk0pndkctCqzeFgmdU9MkEZDcQR0PQtIPNhjBV+DGNf8rqNw7qcbyiFFb/
 Cl9Qwol99kErlqOrMQHIWT8cGpU0oCr4LQELAgOICuWiHJLkEcyCLWeBkoS5zkDUIUQO
 UpOBk8Aneh1Bgufhd3HWbmdCMoA1cJIECfIDgyht0dWzojWlYa3jYDLvjEc5pZE4NnWh
 +EGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nAtAM5x8S/ZPGivdQ7BsLDTU3Z8ReHOtMwCvIqWKh0Y=;
 b=5aP37O1uXJN64g61+qf102ken1lEHJ69qT+aGFtwjqSc6gY0GeJzf5PRzcTeH9od2K
 iR7slYipUFg0+ObZ2MW+X0DEY4gWkoIw4sZPUYo3hLKlT2a8CbpZ9xxvEaW9EiilYpIU
 loGx1SzOajFx9tcLkDhmnN1pgPAj33O9xj55T5vaWJVi8tbjAX9QaonSnSsK+8Jvo62G
 gRyLVy1f9emRsJ+epZRjdVqC63donzUlsAmACpm7HJW0zHbXqy4947syHzGB0dQ+ldUQ
 caZdqJS/SxR0rX8q86kYjh/kYgi63tUM+J6CNlWy3gFld5YCceE4FnBhTYecdaL0sQ4L
 0ryw==
X-Gm-Message-State: AFqh2kpNX9g2MgcQJ6VIv73r1EWDKqDSjJ1FGMvQnseiWmQYbuT3iufg
 4i6NHDzjr/owx+cIpkypHaBXtH8kUbEzDfA0
X-Google-Smtp-Source: AMrXdXuvfgsL9oFlrVso2wugD5+Ec2rd4GgEgZPhkgYnPuyyxL00s43vD2mkFmrHtmM3LNVpK8PNVg==
X-Received: by 2002:a05:6871:468f:b0:144:870e:5859 with SMTP id
 ni15-20020a056871468f00b00144870e5859mr6715908oab.57.1671647010563; 
 Wed, 21 Dec 2022 10:23:30 -0800 (PST)
Received: from fedora.. (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056871060800b0014c8685f229sm514577oan.10.2022.12.21.10.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:23:30 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 07/15] hw/riscv: write initrd 'chosen' FDT inside
 riscv_load_initrd()
Date: Wed, 21 Dec 2022 15:22:52 -0300
Message-Id: <20221221182300.307900-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221182300.307900-1-dbarboza@ventanamicro.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
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
---
 hw/riscv/boot.c            | 18 ++++++++++++------
 hw/riscv/microchip_pfsoc.c | 10 ++--------
 hw/riscv/sifive_u.c        | 10 ++--------
 hw/riscv/spike.c           | 10 ++--------
 hw/riscv/virt.c            | 10 ++--------
 include/hw/riscv/boot.h    |  4 ++--
 6 files changed, 22 insertions(+), 40 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index e1a544b1d9..8aed803d8c 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -193,9 +193,10 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
     exit(1);
 }
 
-hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
-                         uint64_t kernel_entry, hwaddr *start)
+void riscv_load_initrd(const char *filename, uint64_t mem_size,
+                       uint64_t kernel_entry, void *fdt)
 {
+    hwaddr start, end;
     ssize_t size;
 
     /*
@@ -209,18 +210,23 @@ hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
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
index f37a9bebbf..e08de61205 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -281,14 +281,8 @@ static void spike_board_init(MachineState *machine)
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
index 60cf320c88..6f4c606edc 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -44,8 +44,8 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
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
2.38.1


