Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB8865902C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 19:13:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAxOB-0007Kv-1j; Thu, 29 Dec 2022 13:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxO7-0007Jy-Is
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 13:12:19 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxO5-0003fs-N3
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 13:12:19 -0500
Received: by mail-oi1-x22c.google.com with SMTP id u204so17239535oib.7
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 10:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u7+22eHsp/sdotkCxCWkv/b53OuOxZgFQ9IjPprCZ4c=;
 b=CsMOHZ7zViJZmZtVXioghJKfRh/z5ngdGx8nlNgk2q4mnouh7i8se/4COYX7twxMFB
 tDwkcjAS0pZ//tETIofTG9dKu6a8HOLk3D7TEdrFkWOuurGhn9nhk13RRnQ4BpP3I/pP
 xnqKDHdVYqzlOTx+BvzxGG71tBwiPH3hl6As+pVuItULGKu6htYYhvGlYXjut3Y6GjAT
 KhROLj1WulmblsZnbfl+Be22tg9h8Cq7U+COx2axKnRgcupnNC05SrFp+/R410a1DNyr
 R/XzRwgcVr+YBkMXyEpLDij1FBeyYaU8n26VV4qm6mYvgrckcURgkxAp3WLVgxZNtLJi
 NvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u7+22eHsp/sdotkCxCWkv/b53OuOxZgFQ9IjPprCZ4c=;
 b=ixN0koCXVPaPoi0/qQcRsWmCHkOEPKaFZHc8Qo8beRZpF2Jzc7ASL5z9XOAdm2PgK+
 3fxWHiGz4CEsXUuR6CevGA+LjBx4L8by+6pby2tCKvSD/K6M2JgEsq60xmpdI81bVyKU
 siGuNHW56HTBlPZ0xsO2a7T1BM68hQkixmVePVPwPAuHmoky9pPDZgVaRKwJrBEtKPq0
 wtXaS62Hm7X5J/6jzHuX9cjcWlQs0rDn4sMqIBK02NsBPxbQSg/a/l9vgaE2eQESudrq
 GHD9ErGxgI2IloL9JBzl41C+L7/PGC7E93A3L8N3tjgAKnY+5baTOET/audnbdJkRykX
 spTg==
X-Gm-Message-State: AFqh2kpK2e6bqxYnBlfhcgu9Pj1zYwKSM1NLMDwO/JFKO1EQLlBiT+BH
 rYy20gBfPchXtRzkHzf0JJrVbolOWpeImPPu
X-Google-Smtp-Source: AMrXdXuXMHsAl9AdXMVRQE4cvAR4Z98GoFaWYhVOkFIzlGviwamDky8Upr1RJegw78iOL47RnJsM2Q==
X-Received: by 2002:a05:6808:638e:b0:360:d0db:d3c2 with SMTP id
 ec14-20020a056808638e00b00360d0dbd3c2mr15030408oib.15.1672337536691; 
 Thu, 29 Dec 2022 10:12:16 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 d20-20020a056830139400b0066db09fb1b5sm9267205otq.66.2022.12.29.10.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 10:12:16 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v4 11/11] hw/riscv/boot.c: make riscv_load_initrd() static
Date: Thu, 29 Dec 2022 15:11:35 -0300
Message-Id: <20221229181135.270661-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229181135.270661-1-dbarboza@ventanamicro.com>
References: <20221229181135.270661-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22c.google.com
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

The only remaining caller is riscv_load_kernel_and_initrd() which
belongs to the same file.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/boot.c         | 80 ++++++++++++++++++++---------------------
 include/hw/riscv/boot.h |  1 -
 2 files changed, 40 insertions(+), 41 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index d18262c302..1f7f13758c 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -171,6 +171,46 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
     exit(1);
 }
 
+static void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
+{
+    const char *filename = machine->initrd_filename;
+    uint64_t mem_size = machine->ram_size;
+    void *fdt = machine->fdt;
+    hwaddr start, end;
+    ssize_t size;
+
+    g_assert(filename != NULL);
+
+    /*
+     * We want to put the initrd far enough into RAM that when the
+     * kernel is uncompressed it will not clobber the initrd. However
+     * on boards without much RAM we must ensure that we still leave
+     * enough room for a decent sized initrd, and on boards with large
+     * amounts of RAM we must avoid the initrd being so far up in RAM
+     * that it is outside lowmem and inaccessible to the kernel.
+     * So for boards with less  than 256MB of RAM we put the initrd
+     * halfway into RAM, and for boards with 256MB of RAM or more we put
+     * the initrd at 128MB.
+     */
+    start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
+
+    size = load_ramdisk(filename, start, mem_size - start);
+    if (size == -1) {
+        size = load_image_targphys(filename, start, mem_size - start);
+        if (size == -1) {
+            error_report("could not load ramdisk '%s'", filename);
+            exit(1);
+        }
+    }
+
+    /* Some RISC-V machines (e.g. opentitan) don't have a fdt. */
+    if (fdt) {
+        end = start + size;
+        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start", start);
+        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end", end);
+    }
+}
+
 target_ulong riscv_load_kernel_and_initrd(MachineState *machine,
                                           target_ulong kernel_start_addr,
                                           symbol_fn_t sym_cb)
@@ -222,46 +262,6 @@ out:
     return kernel_entry;
 }
 
-void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
-{
-    const char *filename = machine->initrd_filename;
-    uint64_t mem_size = machine->ram_size;
-    void *fdt = machine->fdt;
-    hwaddr start, end;
-    ssize_t size;
-
-    g_assert(filename != NULL);
-
-    /*
-     * We want to put the initrd far enough into RAM that when the
-     * kernel is uncompressed it will not clobber the initrd. However
-     * on boards without much RAM we must ensure that we still leave
-     * enough room for a decent sized initrd, and on boards with large
-     * amounts of RAM we must avoid the initrd being so far up in RAM
-     * that it is outside lowmem and inaccessible to the kernel.
-     * So for boards with less  than 256MB of RAM we put the initrd
-     * halfway into RAM, and for boards with 256MB of RAM or more we put
-     * the initrd at 128MB.
-     */
-    start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
-
-    size = load_ramdisk(filename, start, mem_size - start);
-    if (size == -1) {
-        size = load_image_targphys(filename, start, mem_size - start);
-        if (size == -1) {
-            error_report("could not load ramdisk '%s'", filename);
-            exit(1);
-        }
-    }
-
-    /* Some RISC-V machines (e.g. opentitan) don't have a fdt. */
-    if (fdt) {
-        end = start + size;
-        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start", start);
-        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end", end);
-    }
-}
-
 uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
 {
     uint64_t temp, fdt_addr;
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 16b86450d3..9c2bd92eff 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -46,7 +46,6 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
 target_ulong riscv_load_kernel_and_initrd(MachineState *machine,
                                           target_ulong firmware_end_addr,
                                           symbol_fn_t sym_cb);
-void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
 uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
-- 
2.38.1


