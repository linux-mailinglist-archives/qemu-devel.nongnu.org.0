Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6F665B188
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 12:54:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCJNJ-0007HY-JI; Mon, 02 Jan 2023 06:53:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pCJNH-0007Gf-L5
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:53:03 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pCJNG-0002vq-23
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:53:03 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-15085b8a2f7so8649230fac.2
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 03:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F3Qf24Mcvdq7XC1RvlBaxtiPnO2W6AoSq8V10ISw/KM=;
 b=EeQhZ54Sj521vNVYhwBVSyShyKOj7JdasAnK1tPHUyaVE91z5uDvu97ba5+LUakfwy
 MI0iRbwgjydzF9xFYvwTVuDHaYI2qvKXHLnZe8ktkl76vbqOFNcxGkqTVYN7kGH7ctuL
 GO2Zti3MGoTJdXwS3kR4CHU7BRmXFYyXtHxJl6T5YJ0/xv3BJEJWlR2CU1CQPbzKMAHU
 VUvLc5Y9knkiqlrOtwlk+g+UT0sQZHpJdElvtN6FFtA5rI5QKm0DTP1YiDe0StlxLyxm
 CRMOnoEQEd5x1BZeElBzDI5Bb0n9Gs1pKXHa8Apb6oRYn4Evu+qcVVlezAafyPwCtV27
 f1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F3Qf24Mcvdq7XC1RvlBaxtiPnO2W6AoSq8V10ISw/KM=;
 b=jEq/Xg69ExkJuBKKhuif+nPQeWFs4Bv/uVqgsibZTgE1/9GZnkEKdzDy3OSPo/HaPf
 QuR8Sm0quY1EGk6zmFdh2ZYT86yvSmWP4JEVvXhKhg2s2kX2AIOHdsKyCCo6zfzf35LF
 gaIkvnayLLRmdP1qSrDAQjmRV1uKFFV6f1nfMK6IqYV792/BERnzXhqdaZ4xaq/oGuRD
 j/fKYJ5xrMnHMtq8oT8DEsNS+vlKLegU/VKi3AUZsuRJm9MAsgBrg1DYK+cBEvm4dfv4
 C7GbNebsJ6BYNHaM4fxeV8clTrj/AIk7rYAdupxt/01Kbs8shDA+LlTDg5J2QIGfVpSQ
 t7EQ==
X-Gm-Message-State: AFqh2kpv98qSICaxfiibcCklyhbRWqO9OG29uCBCosa9AW/F52keP5qd
 trmftKwePVUwzBDqHcyjwB87ZpAlWTUY6Rqc
X-Google-Smtp-Source: AMrXdXtt3z3rvAE/YiM98OdbDq3r2NOlbmrCa9VsrptZFw1OxPiAs8Rb+MT1kMKM/9WqqXUOBZUaMA==
X-Received: by 2002:a05:6870:fd84:b0:150:c2cf:8b52 with SMTP id
 ma4-20020a056870fd8400b00150c2cf8b52mr698649oab.7.1672660380799; 
 Mon, 02 Jan 2023 03:53:00 -0800 (PST)
Received: from grind.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 l39-20020a05687106a700b0014fb4bdc746sm11354475oao.8.2023.01.02.03.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 03:53:00 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v5 05/11] hw/riscv/spike.c: load initrd right after
 riscv_load_kernel()
Date: Mon,  2 Jan 2023 08:52:35 -0300
Message-Id: <20230102115241.25733-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102115241.25733-1-dbarboza@ventanamicro.com>
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
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

This will make the code more in line with what the other boards are
doing. We'll also avoid an extra check to machine->kernel_filename since
we already checked that before executing riscv_load_kernel().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/spike.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 25c5420ee6..004dfb2d5b 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -302,6 +302,10 @@ static void spike_board_init(MachineState *machine)
         g_free(firmware_name);
     }
 
+    /* Create device tree */
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
+               riscv_is_32bit(&s->soc[0]), htif_custom_base);
+
     /* Load kernel */
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
@@ -310,6 +314,17 @@ static void spike_board_init(MachineState *machine)
         kernel_entry = riscv_load_kernel(machine->kernel_filename,
                                          kernel_start_addr,
                                          htif_symbol_callback);
+
+        if (machine->initrd_filename) {
+            hwaddr start;
+            hwaddr end = riscv_load_initrd(machine->initrd_filename,
+                                           machine->ram_size, kernel_entry,
+                                           &start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
+                                  "linux,initrd-start", start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
+                                  end);
+        }
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
@@ -318,22 +333,6 @@ static void spike_board_init(MachineState *machine)
         kernel_entry = 0;
     }
 
-    /* Create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]), htif_custom_base);
-
-    /* Load initrd */
-    if (machine->kernel_filename && machine->initrd_filename) {
-        hwaddr start;
-        hwaddr end = riscv_load_initrd(machine->initrd_filename,
-                                       machine->ram_size, kernel_entry,
-                                       &start);
-        qemu_fdt_setprop_cell(machine->fdt, "/chosen",
-                              "linux,initrd-start", start);
-        qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
-                              end);
-    }
-
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
                                    machine->ram_size, machine->fdt);
-- 
2.39.0


