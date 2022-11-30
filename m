Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE0963CD0E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 02:56:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0CJT-0003Rv-9p; Tue, 29 Nov 2022 20:55:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1p0CJQ-0003RG-79
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 20:55:00 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1p0CJO-0005S7-2i
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 20:54:59 -0500
Received: by mail-pj1-x1036.google.com with SMTP id o12so6565874pjo.4
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 17:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zYqMYuafMjaUotlufhtCIW3HJ2L3kxSptx+Y2MFaREk=;
 b=Ovb08SAJ5GbXVUbvpIrWhfGGBDTleiVTwRgqFSUf3wUomoFFF+uLVKReKvT4jvPdWw
 FiqEK+mu/8wEG5B7hm09FZeaBzXkvykQSA4wJ8Kvsb4RsbUjUrFNoQZNCej9l3qTAIqB
 /xF1161vLUZbHzq9eFnJz75V3JqXMWCG+HUXPWtgrfsSh8Tva/PYSJVCA2G735vkBi3m
 sVi3EAR2yuHg8zFZ+h0vSReEH7VLE1nLUsFJ8wagpb8+KC8sEJtLeEr08jlljf5hwPt1
 V05fvGkOWqQ86bc+GSLs3Oeq+XBjUMoQIFER0h9wbqXci3m8DT9SlH3Rv8VUpuZXSENH
 iioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zYqMYuafMjaUotlufhtCIW3HJ2L3kxSptx+Y2MFaREk=;
 b=Um0hiI0oPwZhq0TqbnJ1m0WzLRHM0F4E/nKqxSc/9MTU9oW+9DQb5K31wSpH87mnI6
 r7cU8303bjyH1sKVazo+/v+KBlBJK5HL4f/2MNWXt4FocJT8/3ZAG2tnjWILhjCDtbDW
 yHAxpi1UJnDAKq0AfnD/NgLd+0BWMaFxZRkl+0AKOsTFCTuu8y88Qjz7dyINf9t8iKn/
 bhGPUhHJPe1lXp4kB5dTWqUaz8fSzHeDg5JE3SqmR6pbGkgI18SCCh9NNI3RcEiBvP5+
 PF9eW3Q129sj3R6b/ZpDBZkz20yRDqigARLXL2EDQR31gSWR0DEqFRoQUTWfzJ9uf+vy
 +7BA==
X-Gm-Message-State: ANoB5pm8G3StN4thwq2U54wKiUeEb3Jpu7Mz2Y3Ls+lq0EqX6hMZfIuc
 19qDeTIAlZAaylgheyf76sH5sg2/JU8eHBulmfTPOfGRlqEK9UN949NLonpMANDseF/89z39TfO
 ww6BDlh8EOmMbvV8AO15VdvXRRdJ7/HnyUt+6joLOrAEFv6QG/I+v5CajOSjKtSvyEY0F
X-Google-Smtp-Source: AA0mqf40ApAbsq2y6MOyuRjIScWxIj+dYp+rKDPY4pyt/rh+ib46wpdWx4lYpIRCczrB+e64Ep58Vg==
X-Received: by 2002:a17:902:ce90:b0:187:19c4:373a with SMTP id
 f16-20020a170902ce9000b0018719c4373amr52343308plg.163.1669773296333; 
 Tue, 29 Nov 2022 17:54:56 -0800 (PST)
Received: from sw05.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a655b48000000b004768ce9e4fasm9003871pgr.59.2022.11.29.17.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 17:54:56 -0800 (PST)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 jim.shu@sifive.com, frank.chang@sifive.com, Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH v3 2/3] hw/riscv: sifive_e: Support the watchdog timer of
 HiFive 1 rev b.
Date: Tue, 29 Nov 2022 17:54:43 -0800
Message-Id: <20221130015444.1459842-3-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221130015444.1459842-1-tommy.wu@sifive.com>
References: <20221130015444.1459842-1-tommy.wu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=tommy.wu@sifive.com; helo=mail-pj1-x1036.google.com
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

Create the AON device when we realize the sifive_e machine.
This patch only implemented the functionality of the watchdog timer,
not all the functionality of the AON device.

Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
---
 hw/riscv/Kconfig            |  1 +
 hw/riscv/sifive_e.c         | 13 +++++++++++--
 include/hw/riscv/sifive_e.h |  8 +++++---
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 79ff61c464..50890b1b75 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -59,6 +59,7 @@ config SIFIVE_E
     select SIFIVE_PLIC
     select SIFIVE_UART
     select SIFIVE_E_PRCI
+    select SIFIVE_E_AON
     select UNIMP
 
 config SIFIVE_U
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index d65d2fd869..c866ffe232 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -45,6 +45,7 @@
 #include "hw/intc/riscv_aclint.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_e_prci.h"
+#include "hw/misc/sifive_e_aon.h"
 #include "chardev/char.h"
 #include "sysemu/sysemu.h"
 
@@ -222,8 +223,13 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
         RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
         RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
         RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
-    create_unimplemented_device("riscv.sifive.e.aon",
-        memmap[SIFIVE_E_DEV_AON].base, memmap[SIFIVE_E_DEV_AON].size);
+
+    s->aon = qdev_new(TYPE_SIFIVE_E_AON);
+    if (!sysbus_realize(SYS_BUS_DEVICE(s->aon), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(s->aon), 0, memmap[SIFIVE_E_DEV_AON].base);
+
     sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
 
     /* GPIO */
@@ -244,6 +250,9 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
                            qdev_get_gpio_in(DEVICE(s->plic),
                                             SIFIVE_E_GPIO0_IRQ0 + i));
     }
+    sysbus_connect_irq(SYS_BUS_DEVICE(s->aon), 0,
+                       qdev_get_gpio_in(DEVICE(s->plic),
+                                        SIFIVE_E_AON_WDT_IRQ));
 
     sifive_uart_create(sys_mem, memmap[SIFIVE_E_DEV_UART0].base,
         serial_hd(0), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_E_UART0_IRQ));
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index d738745925..e2de1564a7 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -35,6 +35,7 @@ typedef struct SiFiveESoCState {
     /*< public >*/
     RISCVHartArrayState cpus;
     DeviceState *plic;
+    DeviceState *aon;
     SIFIVEGPIOState gpio;
     MemoryRegion xip_mem;
     MemoryRegion mask_rom;
@@ -76,9 +77,10 @@ enum {
 };
 
 enum {
-    SIFIVE_E_UART0_IRQ  = 3,
-    SIFIVE_E_UART1_IRQ  = 4,
-    SIFIVE_E_GPIO0_IRQ0 = 8
+    SIFIVE_E_AON_WDT_IRQ  = 1,
+    SIFIVE_E_UART0_IRQ    = 3,
+    SIFIVE_E_UART1_IRQ    = 4,
+    SIFIVE_E_GPIO0_IRQ0   = 8
 };
 
 #define SIFIVE_E_PLIC_HART_CONFIG "M"
-- 
2.27.0


