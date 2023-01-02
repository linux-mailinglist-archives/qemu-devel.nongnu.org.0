Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8FD65B185
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 12:53:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCJNB-0007EC-T2; Mon, 02 Jan 2023 06:52:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pCJN9-0007DY-OZ
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:52:55 -0500
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pCJN7-0002uY-VV
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:52:55 -0500
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-150b06cb1aeso3859470fac.11
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 03:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8tYhCgeu+CUPdU0tlNGR+x3OI3mYmG0ZDZI1kUqM/1s=;
 b=UdT6ilTSt972XE81gYaspt6L9Aw4du3Wot7oNrmNBiPh2CRo+Lb49xTG/jKAYT0i+o
 aONB4VNBwRd8NtSPswjQ0tCcbNZ1x4R+nJIBH0j5ZerV5LaSL9nr5QM4FGvCDo6+XcWj
 /gBWGL2lYuiLR3t3RMVuUTHxcdnIRucJUedPaW54XOsi/kEu12rQ0/SA3upz4D+sMjKF
 b2+txD923m+ryFDauxHm2Dfc4ZBxq3gh1HoBflCl/RdSk8veSB0roiIH4F+vd9rqs453
 408w1fziScmJclRi7QxXAEDxsq9RG0WvVMs+9IXp9iTVlbGr2p8BY1Wo17dYGB9RYETl
 5wwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8tYhCgeu+CUPdU0tlNGR+x3OI3mYmG0ZDZI1kUqM/1s=;
 b=WTt66LZydG5sj9ZOoUR54bixxSTtyaFnUJNdLX8RsNIdS+4ILWrkp8qDJRK+QbeFy1
 ux1H/n9OTfkKh3bUyfrPja0saLxAgLW35EhrnXnj0oYNnamUZlCpxjuP3Q9fqhMLka1P
 dEGC6LM7rH9CR6q/fYz78IuKg6TQ7THccod7wWLo1dphNbjMsJvDEUlRTsKHMi+igysO
 s5g0iSmDPCiV6srBMwlMFhvWo/AKgiZZSS3OpwEKnoyfH9OSGmxB6VXI/lZxBpIEj5gY
 PACHL1BvSsXpz8JZzMMWuZ0C4HzMV8ldexftWVjsJT6RsI6EOBVLNnneRM+TkM3CxfIa
 tiKQ==
X-Gm-Message-State: AFqh2kpkFFGpOIitYdrO1l9LT4gDe1KldfR9ixTZWG8NWwTq9K6OF9NY
 Izg2Px2xptctJK75RI984EZsk2o8AeGV4/ib
X-Google-Smtp-Source: AMrXdXu7jwkKbzqaZ4NJ7RMjItpnBS69O3IKBMEGkTuNUe5iggof9qujNOzW9MxAgasW5UT5rbhH7Q==
X-Received: by 2002:a05:6870:b6a7:b0:144:7395:2140 with SMTP id
 cy39-20020a056870b6a700b0014473952140mr22269021oab.35.1672660372462; 
 Mon, 02 Jan 2023 03:52:52 -0800 (PST)
Received: from grind.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 l39-20020a05687106a700b0014fb4bdc746sm11354475oao.8.2023.01.02.03.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 03:52:52 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v5 02/11] hw/riscv/spike: use 'fdt' from MachineState
Date: Mon,  2 Jan 2023 08:52:32 -0300
Message-Id: <20230102115241.25733-3-dbarboza@ventanamicro.com>
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

The MachineState object provides a 'fdt' pointer that is already being
used by other RISC-V machines, and it's also used by the 'dumpdtb' QMP
command.

Remove the 'fdt' pointer from SpikeState and use MachineState::fdt
instead.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/spike.c         | 12 +++++-------
 include/hw/riscv/spike.h |  2 --
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 1679c325d5..25c5420ee6 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -53,6 +53,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
                        bool is_32_bit, bool htif_custom_base)
 {
     void *fdt;
+    int fdt_size;
     uint64_t addr, size;
     unsigned long clint_addr;
     int cpu, socket;
@@ -65,7 +66,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
         "sifive,clint0", "riscv,clint0"
     };
 
-    fdt = s->fdt = create_device_tree(&s->fdt_size);
+    fdt = mc->fdt = create_device_tree(&fdt_size);
     if (!fdt) {
         error_report("create_device_tree() failed");
         exit(1);
@@ -327,18 +328,15 @@ static void spike_board_init(MachineState *machine)
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
2.39.0


