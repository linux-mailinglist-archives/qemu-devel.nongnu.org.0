Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC3D6744BE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 22:38:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIcbC-0006Iy-Sy; Thu, 19 Jan 2023 16:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIcbA-0006HO-9n
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:37:28 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIcb5-0001oi-Cq
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:37:28 -0500
Received: by mail-oi1-x233.google.com with SMTP id i5so2824724oih.11
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 13:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EORUp/iMXwixvbGestrVZ5EpmK4UOb5yG+mlfY5b2OY=;
 b=QKehrdJedqc5zoK9livx/PKy8DjbAHf6FYLC33I4N/9CPu+YCacg7P30DAFYRHq9BT
 aaqNT65ekbsXZYoaKfuWCrfNTzFSElmzSzy8vu/I6kVkVLWLlEcxj4kC5zUompW5TkQP
 IjygVHMvGB3mgQRqugucpEvNL0oPdLSFzVzjt2kfKQM61Lc8q46cOvrQTA7q79r39hDD
 vsoP62/9Oaie9xpkZpsTjWRm9WKN/n8JAH8tPi4eccOSQLoI8dBoMssa4DJE8wbvoVh5
 tIqABI7ZkyE3SpIRA1fE0zCImGY1IdN19IqwqYaUjFDN0FuPFwc9GCjWu6YKkKGubfVk
 P83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EORUp/iMXwixvbGestrVZ5EpmK4UOb5yG+mlfY5b2OY=;
 b=PYCTdqMpG5r6jKzgsUU6SDETHs4/Tu42bnEQDGR1EDNBpJNB/zTFqdVzc6X3ZdNONA
 fNkyCqBtLu8vBUcmxa03jNQ0FUNH9pj4CWE7SOij8NGLbvg/aEj2O/lZFoOLgw2pnElG
 it4xdVpg9Dx/nj5s6UmMCezjv8lnWGv+J0C+x2I5kiUz3WcPp75Ey+UeWbgQc1zDBfyQ
 w1xJZ6E/uBvsH2ZzvAb5QHdDWEwr1svsQ9xOAZPvw6Xle51qqtcthgXuZVzOoUTjpjlD
 8VU/381JN2LO/m6nrgVV5Uxl80SeBUIVCgT8+nD2iVBsK/KjmStTYrOzvEMd6IhnJDCo
 1O4w==
X-Gm-Message-State: AFqh2kqMJjr6+tbqQtvdjr1ueMmQSwcKLJZiB7yOcMjarMSl9lwKCWtU
 czH90qktI2NbNeztzzmv1OKY/2KNY9BjiKytexw=
X-Google-Smtp-Source: AMrXdXtHd+KAhG+27gKkGaMQS5Y0X2yLxquXC/jV+eIobv6fWMbcLCqBMi+WkoVBvtMqPn0bO11tTg==
X-Received: by 2002:a05:6808:1247:b0:360:e643:7e27 with SMTP id
 o7-20020a056808124700b00360e6437e27mr7321554oiv.36.1674164239031; 
 Thu, 19 Jan 2023 13:37:19 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 c132-20020aca358a000000b003646062e83bsm13664472oia.29.2023.01.19.13.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 13:37:18 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v9 3/3] hw/riscv/boot.c: make riscv_load_initrd() static
Date: Thu, 19 Jan 2023 18:37:07 -0300
Message-Id: <20230119213707.651533-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119213707.651533-1-dbarboza@ventanamicro.com>
References: <20230119213707.651533-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
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

The only remaining caller is riscv_load_kernel_and_initrd() which
belongs to the same file.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/boot.c         | 80 ++++++++++++++++++++---------------------
 include/hw/riscv/boot.h |  1 -
 2 files changed, 40 insertions(+), 41 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 29e0c204d3..62cc816b83 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -189,6 +189,46 @@ static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
     return addr;
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
 target_ulong riscv_load_kernel(MachineState *machine,
                                RISCVHartArrayState *harts,
                                target_ulong kernel_start_addr,
@@ -243,46 +283,6 @@ out:
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
index e0eab1e01b..bc9faed397 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -48,7 +48,6 @@ target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong firmware_end_addr,
                                bool load_initrd,
                                symbol_fn_t sym_cb);
-void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
 uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
-- 
2.39.0


