Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AB6653636
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:25:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83kb-000893-QV; Wed, 21 Dec 2022 13:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kZ-00087X-Gy
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:23:31 -0500
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kX-0007qx-PX
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:23:31 -0500
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-143ffc8c2b2so20144478fac.2
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tRuVtqu0y6HSFA/62eqdmXWh2hHPYGAd1pNKzZ7sbeQ=;
 b=G9mhRDhC/3y6Dc0dx3bWSGjJLdcFG3rBFAPpRXw/Axc6YuBI8NeRIywyJHj1KpZ6Q4
 gmhbUnbd+UxbMl5lbkjYTuLCsCqYC0mbWlWm/3DGFqLyEKUROTKbgTlsssb4rhT199Ss
 I/fNSl5PYC4BmMoyrANRIP3ip2o3UV+XgKZIjSFSe7Jri2y09RlapDm7uEm9gy6XN7kA
 TjFGyJqC8H35F6l0BL//Qn1uboTClLeW/O3Mf3Q5rKBBkjFf4kF9bK016nxIfqnPJY3u
 76K8Ry5ghcLiYeWpNIJz5BAWxJLYlKQ1HQT2oz6fyx5W64N3RGt4LydR+pXLROswHbOD
 LdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tRuVtqu0y6HSFA/62eqdmXWh2hHPYGAd1pNKzZ7sbeQ=;
 b=Yr9CNyES0TtZTGTN/He3sM8j+DDTwV5YRzjq7niLjQlY+pVv+LiTrqp7ffYR5LYUH2
 HkeM7qAaFDoPf06OYqcZCqP7RuNKKOKupkCAush8g+CW/tIVNgbKuDAuOSYZQqpikg/k
 mc6NO82d3E9ZYPeHWED52ZuVzpBX8UzVnMDS2bF6aKGhuEquwSGdL4vliTEZ0i8stSZz
 OMAf8PcKEc4dfqju49YFZfe45hADyt+/n6HmemtevVh6con8r7sSS/O9s2pWLI7p2OUh
 RvOM1ngK91Wb0mXsFfsf8hH1pHcpBl/clk6q+dhszMG2wuVYUhJSr4Z9TOPYZg325oYf
 h0iQ==
X-Gm-Message-State: AFqh2kolv1vi76dxc2ySwCQw6mMiiHGQIpHRR4ddBqNTVsrjZfMLXKPM
 ZChyYfTylkgqC2w3EvA4Rd9H5frXDvmesXsA
X-Google-Smtp-Source: AMrXdXsCRiPATMchVfMqj/9I+RyKRDzUMUpQx4yBTQDts9L2Z3CxW2qBINTUSTSz+lyohZYqhYMQJw==
X-Received: by 2002:a05:6870:cd11:b0:144:b4d6:4df1 with SMTP id
 qk17-20020a056870cd1100b00144b4d64df1mr1002408oab.30.1671647008143; 
 Wed, 21 Dec 2022 10:23:28 -0800 (PST)
Received: from fedora.. (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056871060800b0014c8685f229sm514577oan.10.2022.12.21.10.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:23:27 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 06/15] hw/riscv/spike.c: load initrd right after
 riscv_load_kernel()
Date: Wed, 21 Dec 2022 15:22:51 -0300
Message-Id: <20221221182300.307900-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221182300.307900-1-dbarboza@ventanamicro.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x29.google.com
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

This will make the code more in line with what the other boards are
doing. We'll also avoid an extra check to machine->kernel_filename since
we already checked that before executing riscv_load_kernel().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/spike.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 43341c20b6..f37a9bebbf 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -257,6 +257,10 @@ static void spike_board_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
                                 mask_rom);
 
+    /* Create device tree */
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
+               riscv_is_32bit(&s->soc[0]));
+
     /*
      * Not like other RISC-V machines that use plain binary bios images,
      * keeping ELF files here was intentional because BIN files don't work
@@ -275,6 +279,17 @@ static void spike_board_init(MachineState *machine)
         kernel_entry = riscv_load_kernel(machine->kernel_filename,
                                          kernel_start_addr,
                                          htif_symbol_callback);
+
+        if (machine->initrd_filename) {
+            hwaddr start;
+            hwaddr end = riscv_load_initrd(machine->initrd_filename,
+                                           machine->ram_size, kernel_entry,
+                                           &start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
+                                  "linux,initrd-start", start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
+                                  end);
+        }
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
@@ -283,22 +298,6 @@ static void spike_board_init(MachineState *machine)
         kernel_entry = 0;
     }
 
-    /* Create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]));
-
-    /* Load initrd */
-    if (machine->kernel_filename && machine->initrd_filename) {
-        hwaddr start;
-        hwaddr end = riscv_load_initrd(machine->initrd_filename,
-                                       machine->ram_size, kernel_entry,
-                                       &start);
-        qemu_fdt_setprop_cell(machine->fdt, "/chosen",
-                              "linux,initrd-start", start);
-        qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
-                              end);
-    }
-
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
                                    machine->ram_size, machine->fdt);
-- 
2.38.1


