Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BC36661A9
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 18:21:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFecO-00033R-Jy; Wed, 11 Jan 2023 12:10:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFec9-0002kG-Dk
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:10:16 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFec7-0006OQ-3Z
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:10:13 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-14fb7fdb977so16159486fac.12
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 09:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5LQXvUZ8MPXYbIKFJnWO4N2K/K8eQ/j7XzvKq374hKA=;
 b=l6BWGc83gLK/ZwVMGVb4jqEQEskLuYqSzYqQugPIrtprUWAuR93YHskwA+c/MWvYjM
 1iMUQRdO8vmWb36jNk3uZ28rFQ18cKyc81AqXFkI6TffxkjguHjA/N0MuWyy7TUxdSUC
 U1ZNxu16jH/UfJR2Wf5kfkcRasuB5TxQGwd0lzHLrG5uUpMSpQFc8Iemb26ckZzoK4nc
 keudjdsuUhtzKADLSBMiip5fGuriBBqGzXzu/ZI+Sb2V3LZfNI11vGAkTGJDlwJ5WleQ
 917Ki7bN1Wpa4Kxwu37GXm6iDLut9yoIE/0Z9fDHHoPcr8ow//mZsK2RdyUDnrgJhSjd
 JUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5LQXvUZ8MPXYbIKFJnWO4N2K/K8eQ/j7XzvKq374hKA=;
 b=gUq+a5EnR8UbOjkk1xQoI8UNPR9hOxZFY24pMr7GJL6dk/ow1TcxH6a2rUJztdzJrw
 kQ+LM1KXI6TM9FHiypHw28y69o+Y1jdQTGLxiPW85ayoQ7umaHcvNiJey2553lbRqTP4
 uXytnQJqjlGLRWe1xEj5EwJAezVKAIVznJWkDMD8pSO+hNKiUA37ytbkhWvWGHkAcyO1
 c5s2vw3Ua6Rr3rci9zM/ar0lPxgw95E8rbdrGN7Ggq6l6PN1vapTt4mJ3Rh+pU3e7LtE
 oBIqXU9fGQ1XY285Lm7jR+lIVK0d60sxUw/+4b4qiSlt9etmQkId9NYVByBvFO61C3ea
 dtcw==
X-Gm-Message-State: AFqh2kovECso3u/Cxejv6FP4mqTPHkwMNJxWUOayt40wX+xRvg1YsgeB
 xNzV7PZIJmoI5kYarSfV605GPfVD2aapkSqsU7I=
X-Google-Smtp-Source: AMrXdXvT9Ul9DaaL20QIy6KYGLcJ7xRtMTqcR9EtJZSUw0L+myrwZM9ZRPVQZdFHUmkl0/ISpgCoEA==
X-Received: by 2002:a05:6870:316:b0:13b:23e2:3c9a with SMTP id
 m22-20020a056870031600b0013b23e23c9amr40066849oaf.47.1673457009539; 
 Wed, 11 Jan 2023 09:10:09 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 x18-20020a4ac592000000b004a3543fbfbbsm7214974oop.14.2023.01.11.09.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 09:10:09 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 07/10] hw/riscv: simplify riscv_load_fdt()
Date: Wed, 11 Jan 2023 14:09:45 -0300
Message-Id: <20230111170948.316276-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111170948.316276-1-dbarboza@ventanamicro.com>
References: <20230111170948.316276-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
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

All callers of riscv_load_fdt() are using machine->ram_size as
'mem_size' and the fdt is always retrievable via machine->fdt.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c            | 4 +++-
 hw/riscv/microchip_pfsoc.c | 4 ++--
 hw/riscv/sifive_u.c        | 3 +--
 hw/riscv/spike.c           | 3 +--
 hw/riscv/virt.c            | 3 +--
 include/hw/riscv/boot.h    | 2 +-
 6 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index e868fb6ade..21dea7eac2 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -265,10 +265,12 @@ out:
     return kernel_entry;
 }
 
-uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
+uint64_t riscv_load_fdt(MachineState *ms, hwaddr dram_base)
 {
     uint64_t temp, fdt_addr;
+    uint64_t mem_size = ms->ram_size;
     hwaddr dram_end = dram_base + mem_size;
+    void *fdt = ms->fdt;
     int ret, fdtsize = fdt_totalsize(fdt);
 
     if (fdtsize <= 0) {
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index c45023a2b1..6bb08f66bd 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -633,8 +633,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
                                          true, NULL);
 
         /* Compute the fdt load address in dram */
-        fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
-                                       machine->ram_size, machine->fdt);
+        fdt_load_addr = riscv_load_fdt(machine,
+                                       memmap[MICROCHIP_PFSOC_DRAM_LO].base);
         /* Load the reset vector */
         riscv_setup_rom_reset_vec(machine, &s->soc.u_cpus, firmware_load_addr,
                                   memmap[MICROCHIP_PFSOC_ENVM_DATA].base,
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ccad386920..fc2a8a7af4 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -609,8 +609,7 @@ static void sifive_u_machine_init(MachineState *machine)
     }
 
     /* Compute the fdt load address in dram */
-    fdt_load_addr = riscv_load_fdt(memmap[SIFIVE_U_DEV_DRAM].base,
-                                   machine->ram_size, machine->fdt);
+    fdt_load_addr = riscv_load_fdt(machine, memmap[SIFIVE_U_DEV_DRAM].base);
     if (!riscv_is_32bit(&s->soc.u_cpus)) {
         start_addr_hi32 = (uint64_t)start_addr >> 32;
     }
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 91bf194ec1..82093dd2cb 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -316,8 +316,7 @@ static void spike_board_init(MachineState *machine)
     }
 
     /* Compute the fdt load address in dram */
-    fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
-                                   machine->ram_size, machine->fdt);
+    fdt_load_addr = riscv_load_fdt(machine, memmap[SPIKE_DRAM].base);
 
     /* load the reset vector */
     riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].base,
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index e374b58f89..0a0252368e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1300,8 +1300,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
     }
 
     /* Compute the fdt load address in dram */
-    fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
-                                   machine->ram_size, machine->fdt);
+    fdt_load_addr = riscv_load_fdt(machine, memmap[VIRT_DRAM].base);
     /* load the reset vector */
     riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
                               virt_memmap[VIRT_MROM].base,
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index cbd131bad7..3581bbe447 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -47,7 +47,7 @@ target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong firmware_end_addr,
                                bool load_initrd,
                                symbol_fn_t sym_cb);
-uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
+uint64_t riscv_load_fdt(MachineState *ms, hwaddr dram_start);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
                                hwaddr rom_base, hwaddr rom_size,
-- 
2.39.0


