Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A539F65769C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 13:44:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAVm7-0005Ef-DE; Wed, 28 Dec 2022 07:43:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAVm2-000597-04
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 07:43:11 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAVlz-0007rz-0h
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 07:43:09 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 p17-20020a9d6951000000b00678306ceb94so9794195oto.5
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 04:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QE2XJgRkAH08Shs2lwlBT8vzcOTk7Tw+J/29kSs4rCU=;
 b=LRve+PR+YRtZpeo49wl4aIlyR2slyc6sV2TrIxaRYwqGnKMB0rKYtNma4999mNljlF
 wcYGh8ryyyUW+u0Sgld7rqmiEwi/r8RBku2/Agx6cKakyxJ6JxPdBXy231wg1ADDdBQj
 1lWIDOlZiP2pta9ewql5NYoIOZddcnl6ZiC+nXThiWC+JZP+M6ENHzH/798DyEOck4dl
 V+/QwmYzOS183ItZ2vxnKzYyXkDTJgMnCbQ3xGEnjvJyXRdVP7PbAdRN2aUGMYBz5T+v
 b+9R6OktsWYdF4CyDF9F4VhMkp+xqB78ZrFNgEQvDqoC1aedSrrtZCBs5tbSQF3GBaHT
 fj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QE2XJgRkAH08Shs2lwlBT8vzcOTk7Tw+J/29kSs4rCU=;
 b=LMPb0XdDM8tqHtIizRzXwB+jVG/vm7SJE9Cc8jJt4wI7ReXqJR33D4knz38VEsAJ+2
 I9p8RYKKJEeQseVJLIiLUyp7oy8lE4re7ukFZJ+VIC/d7k0PRXaldCxwsBbbHAc9846O
 DONbsZacuMrF69H+BkNJkDAoo4f7fZfGml6i83uzb8HWQIAC5sGZp4xXSnp15dt/GXLP
 UuiRmpn13Ti8B1Koka74/WudQJ6YeyT1FfjuFqMpd6wQbziazpBH5ov0c4cNNO1L/NBK
 HWU4T3dFDbv03t1iUb1ckOHCdiaJpypBdHz/LCmxPtb8qOFmnjrADNSGDx9bxmUq5/f9
 iT3g==
X-Gm-Message-State: AFqh2kpgnspcWs03Lcl3AXFX78x6UykxCyyzr1HB3GTKctZsclwxES34
 olRC9XKJcNF/u4dzRVjAvamnK2xb6Mz2EuGM
X-Google-Smtp-Source: AMrXdXsKQfuay8Px6yJOUTnlmpWcFFPKYPC1XyzTal8mIyTnAT8c0QFIkhoseLCXEBQXUYv98Y7nvQ==
X-Received: by 2002:a05:6830:6718:b0:678:3281:61d5 with SMTP id
 cr24-20020a056830671800b00678328161d5mr13330898otb.4.1672231383864; 
 Wed, 28 Dec 2022 04:43:03 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 cj5-20020a056830640500b0066f09567827sm7689333otb.78.2022.12.28.04.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 04:43:03 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v2 04/10] hw/riscv/spike.c: load initrd right after
 riscv_load_kernel()
Date: Wed, 28 Dec 2022 09:42:36 -0300
Message-Id: <20221228124242.184784-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228124242.184784-1-dbarboza@ventanamicro.com>
References: <20221228124242.184784-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x335.google.com
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
index 426c383cef..0d2feea930 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -297,6 +297,10 @@ static void spike_board_init(MachineState *machine)
         g_free(firmware_name);
     }
 
+    /* Create device tree */
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
+               riscv_is_32bit(&s->soc[0]), htif_custom_base);
+
     /* Load kernel */
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
@@ -305,6 +309,17 @@ static void spike_board_init(MachineState *machine)
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
@@ -313,22 +328,6 @@ static void spike_board_init(MachineState *machine)
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
2.38.1


