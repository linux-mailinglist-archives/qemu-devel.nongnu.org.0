Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E7565772F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 14:35:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAWZI-0004jb-Kp; Wed, 28 Dec 2022 08:34:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAWZC-0004g5-Gk
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 08:33:59 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAWZ8-0008Al-RH
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 08:33:58 -0500
Received: by mail-oi1-x231.google.com with SMTP id r11so14799643oie.13
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 05:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sHU/59DX/o1/r0pnySH91c8qF73tF/MEtRKTLilJBpE=;
 b=W6IRxRovR8tGZZmwl7xtijJKEy6nw8idWUopl6p7bNVyd0nOpDeN+wwmR9EdgySb/P
 jpKpWihgUabpf5uxlWSQgHFh9ggNsOBEtTOc0d13XH5adH6psHU7J68WKYX++jJ98TAh
 +sOZB3SPHjJWPDKKb8JxXN1cKebFuOyue1TIgs1yEm2EeaLdC12Ywk913KPvA2ACdVFh
 ItEM/34v5THkExP2hCQ+ytlb3EIM3RPqie5CUXF4CurJYmtAFiLcGjSK2jau2g6bJFO+
 5yCEbUO0Oq1QP8hSOxoJqBvzfDQTEmM3G8dh+QdNh4lHvzF8pOwuSiWuLuuaExKXNoIz
 qYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sHU/59DX/o1/r0pnySH91c8qF73tF/MEtRKTLilJBpE=;
 b=v4E6eV6Xzw0h4mcgnv3Pb81Dg/sIp4L9eZhMhf9CohmVe7UEJp5PdvUCX29srL32VX
 Ur8amebrrMowiLiQXXPcIUgnIwgYGTGpDYgVutX4rrJiHT8bav9kFLnCkE4QcHC4KZH2
 wYACxRFtKB3i9Q4r1e3KEdyEtveginovXuz6+raVi5Ojw4p2AaGKD30HrPAFMVIT3qSK
 287S9Bcv9hl4uSq0ZjJh79r5uqcqbozrVgIC0zgrwoYNU94D1dQsb+Uc/k/LdXl7b8yu
 GsnI731UsD1qLriEc0+v8KpLAL7RE+iTRvh3bw9qXhRJ436x3hN5bG2IwhnI6wKuyDvr
 2Njg==
X-Gm-Message-State: AFqh2kpcxJUggd1MUrsDAPzh3cf/FEJznXBnuiHdwaJiMNkfF9s6wglU
 VAzjlzgzczWG8m+SLBc7ymQUw/Fmee84JqIT
X-Google-Smtp-Source: AMrXdXtla2PvfehMaVs+OlPskZO99IgjuINyJ0/o9geeiL/BjQhwffcrCWkML3/MdFQs+jdW8kIjyQ==
X-Received: by 2002:a05:6808:53:b0:360:e9b4:3765 with SMTP id
 v19-20020a056808005300b00360e9b43765mr10574382oic.42.1672234433663; 
 Wed, 28 Dec 2022 05:33:53 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 bl22-20020a056808309600b0035e7d07bf9dsm6991626oib.16.2022.12.28.05.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 05:33:53 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v3 03/10] hw/riscv/sifive_u: use 'fdt' from MachineState
Date: Wed, 28 Dec 2022 10:33:29 -0300
Message-Id: <20221228133336.197467-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228133336.197467-1-dbarboza@ventanamicro.com>
References: <20221228133336.197467-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x231.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/sifive_u.c         | 15 ++++++---------
 include/hw/riscv/sifive_u.h |  3 ---
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index a58ddb36ac..ddceb750ea 100644
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
@@ -612,9 +612,9 @@ static void sifive_u_machine_init(MachineState *machine)
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
@@ -627,14 +627,11 @@ static void sifive_u_machine_init(MachineState *machine)
 
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


