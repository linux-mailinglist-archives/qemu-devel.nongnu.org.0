Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E996742AE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 20:21:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIaT8-0002VK-NT; Thu, 19 Jan 2023 14:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIaSo-0002N6-B3
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:20:49 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIaSl-0007ac-08
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:20:41 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-15085b8a2f7so3754443fac.2
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 11:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S3pAmd/FrYdhOY4XIu/LRbN5j3THamHOwGsgTzGtnXs=;
 b=XamZZ1MwHQngQT23a8IE92T/sixlnoQKHa+cN67sG8D9KUSyccb9rF4KTfYFqgCPyh
 /98he9gjbqM1bkGdFxQ+5QFpwd7dTeudQZ9MjH5POB4/rxl0mizJXG7yxryo1Q8L9Pq/
 WMY0FgcNwqZhzyGqwbXsQOnX2yswNaPYak1BYTDRIEODsx5ox6+Vh0kn4XhhHvNjL5KF
 lkOD57IJcTpkwlPklZsOSRjsy3hoZtrfFJG0FCDaB8sW1paJ23zajOLu9MsR4/3QiTtG
 t0y5+yU4GS/ldBTsaUWUegnW4sU7OyYV7EMgJhz5C9iF58etFMQ4q7UWrN+2te0AU+NA
 iQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S3pAmd/FrYdhOY4XIu/LRbN5j3THamHOwGsgTzGtnXs=;
 b=acYLipQFFbON54LpaYWQ/mLsYBwCTQOSjG0IwaX9uJmf2GztEfKJPCaXdFIEQb8Bjp
 99nmMqT45MdBGsHtPtAZ0Leq+snRIzUXbBYZ2gmEYYo/wqH78UlSS0oCVO+Xidw+Czex
 eoPzlE5RySGx+qeoQgi3kL+1IZH5ABTqpWHkti1qFVvvFW7I+cdEvZE8UNw/cGViQn14
 KB6cVEqB5l2vNfaBPFluvPTjv3mScw1NIPg91rTwpK+5Rwq6Ch+HNSqOwOjbYVoNXCkM
 KxO4x05D2t1OXQpmcJ7b+BvQDG34je2X5MrMrWCAdL3gsC/s3JtKWsKhJh7lEbCVuJMn
 OIjg==
X-Gm-Message-State: AFqh2krFXXJAW/qbrQ+qdIOk3P6dwwroulV/8o/UTNyFtW9d8N2tVDKb
 96058O2mZ4iGPVFoZ1BKjZ+SEHjjnbmye2HJxQc=
X-Google-Smtp-Source: AMrXdXs4Ee+j710BR2oWaf3YM0NBJ8Kq6mnOeoE5FPU76sffY3k0nhmrmJ5W48PyVRx/yHNSx/nD0w==
X-Received: by 2002:a05:6871:4693:b0:15f:4552:877d with SMTP id
 ni19-20020a056871469300b0015f4552877dmr6377457oab.48.1674156037323; 
 Thu, 19 Jan 2023 11:20:37 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a056870f20900b0015f193c86d2sm9001128oao.6.2023.01.19.11.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 11:20:36 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 4/7] hw/riscv: simplify riscv_compute_fdt_addr()
Date: Thu, 19 Jan 2023 16:17:25 -0300
Message-Id: <20230119191728.622081-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119191728.622081-1-dbarboza@ventanamicro.com>
References: <20230119191728.622081-1-dbarboza@ventanamicro.com>
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

All callers are using attributes from the MachineState object. Use a
pointer to it instead of passing dram_size (which is always
machine->ram_size) and fdt (always machine->fdt).

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c         | 6 +++---
 hw/riscv/sifive_u.c     | 4 ++--
 hw/riscv/spike.c        | 4 ++--
 hw/riscv/virt.c         | 3 +--
 include/hw/riscv/boot.h | 2 +-
 5 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 13b5ce2d49..3027457042 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -260,11 +260,11 @@ void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
  *
  * The FDT is fdt_packed() during the calculation.
  */
-uint32_t riscv_compute_fdt_addr(hwaddr dram_base, uint64_t mem_size,
-                                void *fdt)
+uint32_t riscv_compute_fdt_addr(MachineState *machine, hwaddr dram_base)
 {
+    void *fdt = machine->fdt;
     uint64_t temp;
-    hwaddr dram_end = dram_base + mem_size;
+    hwaddr dram_end = dram_base + machine->ram_size;
     int ret = fdt_pack(fdt);
     int fdtsize;
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 626d4dc2f3..ebfddf161d 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -616,8 +616,8 @@ static void sifive_u_machine_init(MachineState *machine)
         kernel_entry = 0;
     }
 
-    fdt_load_addr = riscv_compute_fdt_addr(memmap[SIFIVE_U_DEV_DRAM].base,
-                                           machine->ram_size, machine->fdt);
+    fdt_load_addr = riscv_compute_fdt_addr(machine,
+                                           memmap[SIFIVE_U_DEV_DRAM].base);
     riscv_load_fdt(fdt_load_addr, machine->fdt);
 
     if (!riscv_is_32bit(&s->soc.u_cpus)) {
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 88b9fdfc36..afd581436b 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -324,8 +324,8 @@ static void spike_board_init(MachineState *machine)
         kernel_entry = 0;
     }
 
-    fdt_load_addr = riscv_compute_fdt_addr(memmap[SPIKE_DRAM].base,
-                                           machine->ram_size, machine->fdt);
+    fdt_load_addr = riscv_compute_fdt_addr(machine,
+                                           memmap[SPIKE_DRAM].base);
     riscv_load_fdt(fdt_load_addr, machine->fdt);
 
     /* load the reset vector */
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 67c8a01e1d..2688410fc5 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1300,8 +1300,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
         start_addr = virt_memmap[VIRT_FLASH].base;
     }
 
-    fdt_load_addr = riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
-                                           machine->ram_size, machine->fdt);
+    fdt_load_addr = riscv_compute_fdt_addr(machine, memmap[VIRT_DRAM].base);
     riscv_load_fdt(fdt_load_addr, machine->fdt);
 
     /* load the reset vector */
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index c529ed2129..79d3bf268b 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -47,7 +47,7 @@ target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong firmware_end_addr,
                                symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
-uint32_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size, void *fdt);
+uint32_t riscv_compute_fdt_addr(MachineState *machine, hwaddr dram_start);
 void riscv_load_fdt(hwaddr fdt_addr, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
-- 
2.39.0


