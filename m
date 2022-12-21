Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD5065365B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:29:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83kX-000844-Cb; Wed, 21 Dec 2022 13:23:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kQ-0007zf-3a
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:23:22 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kO-0007pT-L9
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:23:21 -0500
Received: by mail-oi1-x236.google.com with SMTP id o66so12600164oia.6
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qqzmyj9XmxTFjNFYEDd87lGar6iNWg88ub+LrFILNQE=;
 b=CAjUi+kyEjL/bSXsDx+WlfRXwY8Puvso355kuS5w3v/sqPf7/HLtVbCxYk/IWEknGb
 hRr0IuHO04IIeGn4K6dbErddZfuUZnjeEE9BPuXUXNKf0nmZ7n/oSlazAh+4LixUdUho
 lt98L7Z6a5DLnOEogd2SupUMixhhvpdltEEJOipZ94Zdn0hH24lQukAuVz+k68pSfY2R
 v46jiAhXD0d60aJ4HuXZaYzP1Ods+luAesVvWMPqFEIC77INvgkNA3uHwJXIK4AYBX+c
 1j3QxqG4fR3c2afA58FyhWWCmxncBmRbdkVWhWpHuUcPihasGLEI7JghyioS8yOq32iE
 cj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qqzmyj9XmxTFjNFYEDd87lGar6iNWg88ub+LrFILNQE=;
 b=WRui+wSCn5u2x6GZ43R7tZsK9wZ3lJKLw2Vpv+9lLv1kcxyiR9ZgxiUwjujn2Y9nNn
 DHHwn6eikLFDzv3Dr7MTmOkJiF0ZY/R10pX8gtW4e79ULC8KlwkvS7kb4DfTN6HZZ9WT
 VTgcUAVuZ3lJolFF4AmhX9ivlTb9KsjUX82FSt8PlERQC2IBMHi5nMQQRzQW+hNieSJr
 tdkeeQpBcpFXcEWdrfiQWMr5aRhsRwWC40fCFPsNhs+hrBjZTI/Op9CUV/XZYAPb2JzW
 t69C2LWhIynRsAohbFV5+To74LJpo6xS7V/ELXq7xccpbNIbD2FpYEqPQ3AzNQvTknnQ
 vVjQ==
X-Gm-Message-State: AFqh2krJtVublL063qxkYOqP6ee9Q7ZKAiasCSBZEbDLXgloM96wcU0E
 DMPKfVd/s3ap1ocjJfW8VFPxkhtk/uIvE/XJ
X-Google-Smtp-Source: AMrXdXtXJ2YBJxKWYMfyXci1z8bLhq1z/cB5cFZeClyvuzgpv68Dufi3DjwxtxwsDvE7k5B+u/NS2A==
X-Received: by 2002:a05:6808:8f0:b0:35c:4b2c:6a5 with SMTP id
 d16-20020a05680808f000b0035c4b2c06a5mr1301480oic.51.1671646998865; 
 Wed, 21 Dec 2022 10:23:18 -0800 (PST)
Received: from fedora.. (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056871060800b0014c8685f229sm514577oan.10.2022.12.21.10.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:23:18 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 02/15] hw/riscv/spike: use 'fdt' from MachineState
Date: Wed, 21 Dec 2022 15:22:47 -0300
Message-Id: <20221221182300.307900-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221182300.307900-1-dbarboza@ventanamicro.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
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

The MachineState object provides a 'fdt' pointer that is already being
used by other RISC-V machines, and it's also used by the 'dumpdtb' QMP
command.

Remove the 'fdt' pointer from SpikeState and use MachineState::fdt
instead.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/spike.c         | 12 +++++-------
 include/hw/riscv/spike.h |  2 --
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 13946acf0d..d96f013e2e 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -52,6 +52,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
                        uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
     void *fdt;
+    int fdt_size;
     uint64_t addr, size;
     unsigned long clint_addr;
     int cpu, socket;
@@ -64,7 +65,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
         "sifive,clint0", "riscv,clint0"
     };
 
-    fdt = s->fdt = create_device_tree(&s->fdt_size);
+    fdt = mc->fdt = create_device_tree(&fdt_size);
     if (!fdt) {
         error_report("create_device_tree() failed");
         exit(1);
@@ -296,18 +297,15 @@ static void spike_board_init(MachineState *machine)
         hwaddr end = riscv_load_initrd(machine->initrd_filename,
                                        machine->ram_size, kernel_entry,
                                        &start);
-        qemu_fdt_setprop_cell(s->fdt, "/chosen",
+        qemu_fdt_setprop_cell(machine->fdt, "/chosen",
                               "linux,initrd-start", start);
-        qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
+        qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
                               end);
     }
 
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
-                                   machine->ram_size, s->fdt);
-
-    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
-    machine->fdt = s->fdt;
+                                   machine->ram_size, machine->fdt);
 
     /* load the reset vector */
     riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].base,
diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h
index 73d69234de..d13a147942 100644
--- a/include/hw/riscv/spike.h
+++ b/include/hw/riscv/spike.h
@@ -37,8 +37,6 @@ struct SpikeState {
 
     /*< public >*/
     RISCVHartArrayState soc[SPIKE_SOCKETS_MAX];
-    void *fdt;
-    int fdt_size;
 };
 
 enum {
-- 
2.38.1


