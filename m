Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7FB653651
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:27:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83ki-0008FJ-8A; Wed, 21 Dec 2022 13:23:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kg-0008Av-15
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:23:38 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83ke-0007q9-Eh
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:23:37 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-142b72a728fso20120923fac.9
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2cWUbrq1GsC2cyn2csFMCljmaagKBjvpjpYOjHyY9E0=;
 b=TnsFAACt1a5KRnSegU92UqGYf+YKgT1wB0+DjANGabSmkOo0XzsSIQyANYIB4Ux9iT
 0iUtTPO1EP6GQUjMwrueoeiq4mLEgmDZg6TlM+slJ+w8aP2v3XPcxO+LMbw+bEgXdSFV
 ++NhYQNhu1gtqw3PXuIylhF8NvXEMOVSUgX56MUORn7rMPFJ3JAsxi56pR10Z5eLbHZy
 vR7O5chpU54iTFCjt2fxIzSYX5+PrpTP3Ow5yoCDFi3S+a/WZlZM9+aStItIKxvfC/lA
 XfMO83251TVJMxArjHqyKzeQ/9mGKoedh+yirZ80P8NvZeUwfPcckPVDfzrQlq1dpQbJ
 /VtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2cWUbrq1GsC2cyn2csFMCljmaagKBjvpjpYOjHyY9E0=;
 b=oDYgKK+KNpAXL6bQK7ybfYCKcDEv2FgS2TZ1JUVh2b3DVxA7Snqkc7NuNzAZ4hkqPA
 AraTz8XiTMcxB9xjiabFWMZ+EpI0gP4i4eUA6EtZ2eT4tPIvSJHVxZmArIQeEw5bW+H4
 sS+Ww8SpVkUPLvc0F/XBBA8L/4QPONWR4eXXNYePqSwdyI+hBikdZxjpbrr38cPgBlML
 86qrJHwSyuWUU8wRhfHjpCCCOWagvB1alEItaQtwwUkAxrhzjsIAYnFzRgGYcsfUEiIY
 5VXvQbFX3dtcakMzxeqNmzVhJjAjIGXEjOqbwwhFBUmDhjIAar/qfTrIXX3ScuhP7MKg
 ZVpA==
X-Gm-Message-State: AFqh2krcudJcEIBDRLu795Z8ineGeN/4rd3ZJ5M+N+UkiKwF7yZhYTFJ
 Jgvy8oFRcYz7EELKo91aYY27WdIivlmgfRGm
X-Google-Smtp-Source: AMrXdXuB7YG6hfn8fbKy+KG0sXVDA0kIKH2zp/1ElIZr0iGp4Y0LwZLjr3rzgpcHV5PHGyb8eH5V8Q==
X-Received: by 2002:a05:6870:494a:b0:137:3adc:6a39 with SMTP id
 fl10-20020a056870494a00b001373adc6a39mr1279890oab.39.1671647015513; 
 Wed, 21 Dec 2022 10:23:35 -0800 (PST)
Received: from fedora.. (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056871060800b0014c8685f229sm514577oan.10.2022.12.21.10.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:23:35 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 09/15] hw/riscv/boot.c: use MachineState in riscv_load_initrd()
Date: Wed, 21 Dec 2022 15:22:54 -0300
Message-Id: <20221221182300.307900-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221182300.307900-1-dbarboza@ventanamicro.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
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
---
 hw/riscv/boot.c            | 6 ++++--
 hw/riscv/microchip_pfsoc.c | 3 +--
 hw/riscv/sifive_u.c        | 3 +--
 hw/riscv/spike.c           | 3 +--
 hw/riscv/virt.c            | 3 +--
 include/hw/riscv/boot.h    | 3 +--
 6 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 8aed803d8c..4b46a9c51b 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -193,9 +193,11 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
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
index 6d50abd425..1eeee8f349 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -277,8 +277,7 @@ static void spike_board_init(MachineState *machine)
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
index 6f4c606edc..a2861c9431 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -44,8 +44,7 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
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


