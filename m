Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C685965362D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:24:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83kY-00085g-1j; Wed, 21 Dec 2022 13:23:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kS-00082G-3s
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:23:24 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kQ-0007oj-Gu
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:23:23 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1445ca00781so20159788fac.1
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=74zPKwHf8N53W2PxXJGQXmpqGXy9m0+YJHtlrDRJ0ds=;
 b=ZGOlmcnHxbHCSd40jy5pAlYM7ad/e+Kx+iH89HGS3DO7vKHXjhC1mJfwuD6K6veCde
 byI2hZ2dq0IvGQR1io6nz65JFBVjppiOvDuwUMYQ1MwP3Q/WwgyjqwpkNnVod4mLNxhX
 OYYmCs6lAS831cW3f1+IELQub6+peoxAdXyxHei66p5HCBI4+nOih/Kh6Dp0qvcGE9vg
 EBAbPhzOUJfBVOpRy6KeOuTbk8p0AEWSwS0N8aMKmm2IdQX9NXNYG3Ic0SgVxJpsLU+g
 zgHup2BsDYRjsyhUO0+gxF4pI9MCxjtYtFIBliZ43rdVgx671LyU3PD6TzFdyhn2hiw4
 d5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=74zPKwHf8N53W2PxXJGQXmpqGXy9m0+YJHtlrDRJ0ds=;
 b=uU4yrpyHlIVvPz+6JU1UL3sGWGUTB5CL/7CCbAMUWrrQsnDzvZ/OrQ65Jilb8XuxNy
 ycMiTBgr/ttgqJodmpSiprs6UFG3HpDBuAWXZS+VeUemMBMpePG57KpYljjHCbDvviyI
 +q5y0nPUjt+nbPVwpiBiwFn3mk+O4K2Tz0+ScLQN2CIqrLUi2XC54jpdOAOJnm/Z0ynx
 JMLZS9N5/xl4WVFW93qTKqACCtbzkRAQnhjGBYWUpz1x4jcvQkM7gAfrUlGbmLnsaPgk
 xmkkwIPptDDNGZHvTW1J+LY0fFMdBSga/dC8qKPsjj+Ep3l0kYLdmrp47sVBcIFZ11VN
 TVeA==
X-Gm-Message-State: AFqh2kpaXkPbII0z/zT25tN8E8Tw+rML1MZPS6Lv2Dl0q5gCOnNwvbk/
 YRqxk5aJV4x26vQX+7mkDQPkLburLdS67U3E
X-Google-Smtp-Source: AMrXdXtbCGveGgnqQQIJlZrV8G3lIeAQ4qTCll1i04ubWTRc/zZHy9rDohHTndDV+e+BCVg85WqGyw==
X-Received: by 2002:a05:6870:3d8a:b0:14c:6a70:9660 with SMTP id
 lm10-20020a0568703d8a00b0014c6a709660mr1264074oab.43.1671647001263; 
 Wed, 21 Dec 2022 10:23:21 -0800 (PST)
Received: from fedora.. (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056871060800b0014c8685f229sm514577oan.10.2022.12.21.10.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:23:20 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 03/15] hw/riscv/sifive_u: use 'fdt' from MachineState
Date: Wed, 21 Dec 2022 15:22:48 -0300
Message-Id: <20221221182300.307900-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221182300.307900-1-dbarboza@ventanamicro.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
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

The MachineState object provides a 'fdt' pointer that is already being
used by other RISC-V machines, and it's also used by the 'dumpdtb' QMP
command.

Remove the 'fdt' pointer from SiFiveUState and use MachineState::fdt
instead.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/sifive_u.c         | 15 ++++++---------
 include/hw/riscv/sifive_u.h |  3 ---
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index b40a4767e2..9cf66957ab 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -98,7 +98,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     void *fdt;
-    int cpu;
+    int cpu, fdt_size;
     uint32_t *cells;
     char *nodename;
     uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
@@ -112,14 +112,14 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     };
 
     if (ms->dtb) {
-        fdt = s->fdt = load_device_tree(ms->dtb, &s->fdt_size);
+        fdt = ms->fdt = load_device_tree(ms->dtb, &fdt_size);
         if (!fdt) {
             error_report("load_device_tree() failed");
             exit(1);
         }
         goto update_bootargs;
     } else {
-        fdt = s->fdt = create_device_tree(&s->fdt_size);
+        fdt = ms->fdt = create_device_tree(&fdt_size);
         if (!fdt) {
             error_report("create_device_tree() failed");
             exit(1);
@@ -615,9 +615,9 @@ static void sifive_u_machine_init(MachineState *machine)
             hwaddr end = riscv_load_initrd(machine->initrd_filename,
                                            machine->ram_size, kernel_entry,
                                            &start);
-            qemu_fdt_setprop_cell(s->fdt, "/chosen",
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
                                   "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
                                   end);
         }
     } else {
@@ -630,14 +630,11 @@ static void sifive_u_machine_init(MachineState *machine)
 
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[SIFIVE_U_DEV_DRAM].base,
-                                   machine->ram_size, s->fdt);
+                                   machine->ram_size, machine->fdt);
     if (!riscv_is_32bit(&s->soc.u_cpus)) {
         start_addr_hi32 = (uint64_t)start_addr >> 32;
     }
 
-    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
-    machine->fdt = s->fdt;
-
     /* reset vector */
     uint32_t reset_vec[12] = {
         s->msel,                       /* MSEL pin state */
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index e680d61ece..4a8828a30e 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -67,9 +67,6 @@ typedef struct SiFiveUState {
     /*< public >*/
     SiFiveUSoCState soc;
 
-    void *fdt;
-    int fdt_size;
-
     bool start_in_flash;
     uint32_t msel;
     uint32_t serial;
-- 
2.38.1


