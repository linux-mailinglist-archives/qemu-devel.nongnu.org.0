Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC2665772D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 14:35:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAWZQ-0004rL-8B; Wed, 28 Dec 2022 08:34:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAWZM-0004nn-NK
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 08:34:08 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAWZK-0008PV-W8
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 08:34:08 -0500
Received: by mail-oi1-x232.google.com with SMTP id r205so14822494oib.9
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 05:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M0I6I7BTYvBBitBG8CZ1/GT6K54bRfBzh9f9r61PxUs=;
 b=KPX8O34kFW+7ro8uMu+ANsgh9GXEoa85S1u3XDLEMXQEzvwLaSma3L+csIGWU/+0pG
 n29vv63NLFsKApvo5G6J09uBRsLujXtt1U6QQ9xmN7YRo1lLqAwUr87HtW6L5H6WHOle
 wwIH3sh+lXT1t60p7QyOzcQO0KoiVom3/p7aljs9eKcop1GKsYj0U6rhw1ALh8PokH2K
 GTcb0xgv95LxPlLzUw8SlvVsDJyib9dlcdmLh2mJPq9AxbwAFCQRQnBD0LI5YOq8vXGh
 azaS5r5NA1rjLD8JytEKxvTqX9FaaKiau6dF+tWb502xCqMjON8HptsFZKBWjD3WGaFx
 ZzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M0I6I7BTYvBBitBG8CZ1/GT6K54bRfBzh9f9r61PxUs=;
 b=lCbMaYu59viKT4UBySVdZi+ZNrx0RQtm5jDI6TC33Taq7Clh/Y9KHnBt1PLs+MvVhG
 /3+GOZP8PqISkelXm4GP9N1tB4PeoXvo8CsBhVGg2+T1i0KaOrz6nnUGWE5WumPyh4G+
 9hp9Zdj1SaYg2JD78swIABttORJ/mWKgC+1vV78ZuORT/kpkkbarNIBIYA18nJR2OdWr
 mxxdWu60SwJFlSZK6pelrDozw72LlPSdr9tEU+OSHC44/B6ED2bLBRYnv+DMWCnEgudM
 KaMBNAj9FjUyoLCKKq7JgFEjfRGfO6wxRi5BvRZLNgQFd7HjvubU5kphYbLU9mkNt41D
 DptQ==
X-Gm-Message-State: AFqh2kpxTD0i7GiKsfU39kL5KB1T2Ak8jfTRK+7MY/jOjp58ciscwCpa
 pSo/PIINsuEgxTVHpVe8lNRA8eAaeyxRnfoi
X-Google-Smtp-Source: AMrXdXsDz8wI+fcXEP6JWLEx1AuPWogUuhU9VFMI1imDIzRNA13k+t12hHpryGaigJCLF3CZWdzY7Q==
X-Received: by 2002:a05:6808:2387:b0:360:e45e:18d6 with SMTP id
 bp7-20020a056808238700b00360e45e18d6mr14739844oib.59.1672234445232; 
 Wed, 28 Dec 2022 05:34:05 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 bl22-20020a056808309600b0035e7d07bf9dsm6991626oib.16.2022.12.28.05.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 05:34:04 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v3 07/10] hw/riscv/boot.c: use MachineState in
 riscv_load_initrd()
Date: Wed, 28 Dec 2022 10:33:33 -0300
Message-Id: <20221228133336.197467-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228133336.197467-1-dbarboza@ventanamicro.com>
References: <20221228133336.197467-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x232.google.com
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

'filename', 'mem_size' and 'fdt' from riscv_load_initrd() can all be
retrieved by the MachineState object for all callers.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/boot.c            | 6 ++++--
 hw/riscv/microchip_pfsoc.c | 3 +--
 hw/riscv/sifive_u.c        | 3 +--
 hw/riscv/spike.c           | 3 +--
 hw/riscv/virt.c            | 3 +--
 include/hw/riscv/boot.h    | 3 +--
 6 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index d3c71b3f0b..f7e806143a 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -204,9 +204,11 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
     exit(1);
 }
 
-void riscv_load_initrd(const char *filename, uint64_t mem_size,
-                       uint64_t kernel_entry, void *fdt)
+void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
 {
+    const char *filename = machine->initrd_filename;
+    uint64_t mem_size = machine->ram_size;
+    void *fdt = machine->fdt;
     hwaddr start, end;
     ssize_t size;
 
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 593a799549..1e9b0a420e 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -633,8 +633,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
                                          kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
-            riscv_load_initrd(machine->initrd_filename, machine->ram_size,
-                              kernel_entry, machine->fdt);
+            riscv_load_initrd(machine, kernel_entry);
         }
 
         if (machine->kernel_cmdline && *machine->kernel_cmdline) {
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 3e6df87b5b..c40885ed5c 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -602,8 +602,7 @@ static void sifive_u_machine_init(MachineState *machine)
                                          kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
-            riscv_load_initrd(machine->initrd_filename, machine->ram_size,
-                              kernel_entry, machine->fdt);
+            riscv_load_initrd(machine, kernel_entry);
         }
 
         if (machine->kernel_cmdline && *machine->kernel_cmdline) {
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 775f910a50..0c22978b12 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -307,8 +307,7 @@ static void spike_board_init(MachineState *machine)
                                          htif_symbol_callback);
 
         if (machine->initrd_filename) {
-            riscv_load_initrd(machine->initrd_filename, machine->ram_size,
-                              kernel_entry, machine->fdt);
+            riscv_load_initrd(machine, kernel_entry);
         }
 
         if (machine->kernel_cmdline && *machine->kernel_cmdline) {
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 6c946b6def..02f1369843 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1285,8 +1285,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
                                          kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
-            riscv_load_initrd(machine->initrd_filename, machine->ram_size,
-                              kernel_entry, machine->fdt);
+            riscv_load_initrd(machine, kernel_entry);
         }
 
         if (machine->kernel_cmdline && *machine->kernel_cmdline) {
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index e37e1d1238..cfd72ecabf 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -46,8 +46,7 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
 target_ulong riscv_load_kernel(const char *kernel_filename,
                                target_ulong firmware_end_addr,
                                symbol_fn_t sym_cb);
-void riscv_load_initrd(const char *filename, uint64_t mem_size,
-                       uint64_t kernel_entry, void *fdt);
+void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
 uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
-- 
2.38.1


