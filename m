Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 262B365B186
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 12:54:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCJNh-0007Px-IW; Mon, 02 Jan 2023 06:53:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pCJNX-0007Kc-E1
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:53:20 -0500
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pCJNR-0002vS-L4
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:53:14 -0500
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-14455716674so33430401fac.7
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 03:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oF8D1BJLQYGZFsS88lugPvqTki7DTzUYtcNpmBNe0ok=;
 b=Z9QLUk4veGrSCkwD1DlpM27JKCTohreQ98iGEVL3mKXO6DwzF1U+13gE5lKl3OGYCc
 +1nr/SENRn20mmr3600bS6KG3CrO64RPxq5ICI9eRXKTpEtB15Bx0IQC0aNB18RWvR6d
 KJ8bx+ryRzNITpPlwzr6r96U8BiP2uJV8o3i6ihkziR61k5z9OcMDhOg1+tWwKOtjtAS
 SFI25PswhpP401yu4ND3TOe+B1mSj1suWHS2DX/YcawbrZ2E0RDx7epfUr39TjUR9DeD
 ODE5/bamODWhYWb5ZyeegxcmEV+O3y/Jp9gpZnMd8j8tOknOabzhrfrJH3ah3rOsKsT4
 E2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oF8D1BJLQYGZFsS88lugPvqTki7DTzUYtcNpmBNe0ok=;
 b=nGYfa/g5my6uMYh00vBTifI80/5KBJSVOA0ZaG41KHnT7zKfriscRXXlQlbV6SXr87
 Bo3BDPPA/z0zKomVyH9W3wy0R7K5nWMan7oGU3AZm3ZCB56ifWTGc3YPKRgvvG0dHVEH
 Y6KBbCZFiUGwJ0Mw7Covr1tsRxJlGVwyzXO7EFPn3CuKBNJRGd9wenDzMVZsRAen7jUI
 60fADmZjiBTC+GqGdpm43n7TZFvDuaqIvci+ZDLTA3pOfTtPI+fyrqk98dc1p685iEtN
 G9K35QwmMEt+z4R5TviKLggW/TKQgvIENsyZjBT6x88gbDQOOcDkfjLp2i80EJ+gUFzU
 R6pg==
X-Gm-Message-State: AFqh2krtQL70yOd4d/hqH/CcpKMj+Vlg3Mqx4z9Iw8cfNs7qzJV06/VK
 Kv84M4nC2PxF54wJGo298275kzoMyU6jp7cp
X-Google-Smtp-Source: AMrXdXu9RRmXfb79iLrMQ4kQrovZ+Y0dzYcuyJCo/iVLFMXxMHg+6wPV/fGZbhL/PTU6vOYSuqXbrQ==
X-Received: by 2002:a05:6870:3d8d:b0:14f:b85a:becc with SMTP id
 lm13-20020a0568703d8d00b0014fb85abeccmr15283290oab.48.1672660392326; 
 Mon, 02 Jan 2023 03:53:12 -0800 (PST)
Received: from grind.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 l39-20020a05687106a700b0014fb4bdc746sm11354475oao.8.2023.01.02.03.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 03:53:11 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v5 09/11] hw/riscv/boot.c: use MachineState in
 riscv_load_kernel()
Date: Mon,  2 Jan 2023 08:52:39 -0300
Message-Id: <20230102115241.25733-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102115241.25733-1-dbarboza@ventanamicro.com>
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
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

All callers are using kernel_filename as machine->kernel_filename.

This will also simplify the changes in riscv_load_kernel() that we're
going to do next.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/boot.c            | 3 ++-
 hw/riscv/microchip_pfsoc.c | 3 +--
 hw/riscv/opentitan.c       | 3 +--
 hw/riscv/sifive_e.c        | 3 +--
 hw/riscv/sifive_u.c        | 3 +--
 hw/riscv/spike.c           | 3 +--
 hw/riscv/virt.c            | 3 +--
 include/hw/riscv/boot.h    | 2 +-
 8 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index d3e780c3b6..2594276223 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -173,10 +173,11 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
     exit(1);
 }
 
-target_ulong riscv_load_kernel(const char *kernel_filename,
+target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong kernel_start_addr,
                                symbol_fn_t sym_cb)
 {
+    const char *kernel_filename = machine->kernel_filename;
     uint64_t kernel_load_base, kernel_entry;
 
     g_assert(kernel_filename != NULL);
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 1e9b0a420e..82ae5e7023 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -629,8 +629,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine->kernel_filename,
-                                         kernel_start_addr, NULL);
+        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
             riscv_load_initrd(machine, kernel_entry);
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 85ffdac5be..64d5d435b9 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -101,8 +101,7 @@ static void opentitan_board_init(MachineState *machine)
     }
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine->kernel_filename,
-                          memmap[IBEX_DEV_RAM].base, NULL);
+        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index d65d2fd869..3e3f4b0088 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -114,8 +114,7 @@ static void sifive_e_machine_init(MachineState *machine)
                           memmap[SIFIVE_E_DEV_MROM].base, &address_space_memory);
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine->kernel_filename,
-                          memmap[SIFIVE_E_DEV_DTIM].base, NULL);
+        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index c40885ed5c..bac394c959 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -598,8 +598,7 @@ static void sifive_u_machine_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine->kernel_filename,
-                                         kernel_start_addr, NULL);
+        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
             riscv_load_initrd(machine, kernel_entry);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 99dec74fe8..bff9475686 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -307,8 +307,7 @@ static void spike_board_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine->kernel_filename,
-                                         kernel_start_addr,
+        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
                                          htif_symbol_callback);
 
         if (machine->initrd_filename) {
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 02f1369843..c8e35f861e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1281,8 +1281,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine->kernel_filename,
-                                         kernel_start_addr, NULL);
+        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
             riscv_load_initrd(machine, kernel_entry);
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index cfd72ecabf..f94653a09b 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -43,7 +43,7 @@ char *riscv_find_firmware(const char *firmware_filename,
 target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr,
                                  symbol_fn_t sym_cb);
-target_ulong riscv_load_kernel(const char *kernel_filename,
+target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong firmware_end_addr,
                                symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
-- 
2.39.0


