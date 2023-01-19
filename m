Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E70E6742A9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 20:21:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIaT9-0002VV-3j; Thu, 19 Jan 2023 14:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIaSo-0002N7-BM
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:20:49 -0500
Received: from mail-oa1-x42.google.com ([2001:4860:4864:20::42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIaSk-0007ZL-MM
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:20:41 -0500
Received: by mail-oa1-x42.google.com with SMTP id
 586e51a60fabf-15b9c93848dso3764499fac.1
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 11:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VXD8ZPUYsyRTQukgddfHyr53eMY4QsmB4t6z8+0bMqY=;
 b=ZkVT2pO8y6++jBhPH8xLANQt/wm0qI60fGX9+0pvOfIDamlZGgjOmzjGhe0Bqat93h
 7gciBfoqsBQljKZD/RMoIvZINc2ckbzuuqMh/uMj/vZ1pEyg9CHyVVrT/cB2KK5l5OUh
 bvFx2AbkjKmONHaAtIBn1drW1nr6Z8r8vhJ7s7gVkMC+JUyPemLv5Fr3t2TXRdbrh8A6
 QV0J8WHoyCpkit+gKBoPymALjP8ouSwHVtSmXV2mpF/k00BVia81ZhsrBPLf5x/66EQH
 dOJWzZXVuNiFW3OjWEuQICZLysOSNJlEWKEIje5yDu23ifz7pd/1/usYZOVzx/Z9wDLm
 I2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VXD8ZPUYsyRTQukgddfHyr53eMY4QsmB4t6z8+0bMqY=;
 b=e9xgaSg04XqnM5MSdRMq+3iB0Xjfmg+zmMesfzkEH5YIQkz2HiGvgi5p2HkoAlk/+t
 Nz2PCpW95yvTCQ6jGMLG0RqSshEYlf/tP624lKfi9wAiBZPflJgixaIvll/GoG/aa/QH
 jqPvrAHYj/iadKg5Nvi86L2a9JNccBB/hv5dJOdr9wT4S88FYPNu24ITg3J5V+gzJIge
 kZWAmHg9spRSy43DH/vj3uyNnsIt19uSVP54vVTyJEQ38Pxv87OQSZeY+n9oG0i6ZRDm
 uSWGX1WPylxn26mfxIEVon0lT44Mx2Efnv9P8xKQLwODufLm8MDj7rngeI1WboL54rZ0
 HX6A==
X-Gm-Message-State: AFqh2krpEVfXe12uAVWpL3n08ynVnyJxSOciWdqCWUrZ+6YsdCoutSWx
 8gOONTo8EJJzAtIiiMf6keUMwAuOnnJW9gW0WVg=
X-Google-Smtp-Source: AMrXdXtDLprwWWgQkTCbPkpnVVL0hk9GE/w/pKJhtgWgKa0pIhqmSghviR9mz/5LYffnHNBsqB0e3g==
X-Received: by 2002:a05:6870:6c1a:b0:15f:5fd:b91f with SMTP id
 na26-20020a0568706c1a00b0015f05fdb91fmr6525019oab.50.1674156035052; 
 Thu, 19 Jan 2023 11:20:35 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a056870f20900b0015f193c86d2sm9001128oao.6.2023.01.19.11.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 11:20:34 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 3/7] hw/riscv/microchip_pfsoc.c: add an Icicle Kit fdt
 address function
Date: Thu, 19 Jan 2023 16:17:24 -0300
Message-Id: <20230119191728.622081-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119191728.622081-1-dbarboza@ventanamicro.com>
References: <20230119191728.622081-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::42;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x42.google.com
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

The Icicle Kit board works with 2 distinct RAM banks that are separated
by a gap. We have a lower bank with 1GiB size, a gap follows,
then at 64GiB the high memory starts.

MachineClass::default_ram_size is set to 1.5Gb and machine_init() is
enforcing it as minimal RAM size, meaning that there we'll always have
at least 512 MiB in the Hi RAM area, and that the FDT will be located
there all the time.

riscv_compute_fdt_addr() can't handle this setup because it assumes that
the RAM is always contiguous. It's also returning an uint32_t because
it's enforcing that fdt address is sitting on an area that is addressable
to 32 bit CPUs, but 32 bits won't be enough to point to the Hi area of
the Icicle Kit RAM (and to its FDT itself).

Create a new function called microchip_compute_fdt_addr() that is able
to deal with all these details that are particular to the Icicle Kit.
Ditch riscv_compute_fdt_addr() and use it instead.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/microchip_pfsoc.c | 46 +++++++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index dcdbc2cac3..9b829e4d1a 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -54,6 +54,8 @@
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
 
+#include <libfdt.h>
+
 /*
  * The BIOS image used by this machine is called Hart Software Services (HSS).
  * See https://github.com/polarfire-soc/hart-software-services
@@ -513,6 +515,46 @@ static void microchip_pfsoc_soc_register_types(void)
 
 type_init(microchip_pfsoc_soc_register_types)
 
+static hwaddr microchip_compute_fdt_addr(MachineState *ms)
+{
+    const MemMapEntry *memmap = microchip_pfsoc_memmap;
+    hwaddr mem_low_size = memmap[MICROCHIP_PFSOC_DRAM_LO].size;
+    hwaddr mem_high_size, fdt_base;
+    int ret = fdt_pack(ms->fdt);
+    int fdtsize;
+
+    /* Should only fail if we've built a corrupted tree */
+    g_assert(ret == 0);
+
+    fdtsize = fdt_totalsize(ms->fdt);
+    if (fdtsize <= 0) {
+        error_report("invalid device-tree");
+        exit(1);
+    }
+
+    /*
+     * microchip_icicle_kit_machine_init() does a validation
+     * that guarantees that ms->ram_size is always greater
+     * than mem_low_size and that mem_high_size will be
+     * at least 512MiB.
+     *
+     * This also means that our fdt_addr will be based
+     * on the starting address of the HI DRAM block.
+     */
+    mem_high_size = ms->ram_size - mem_low_size;
+    fdt_base = memmap[MICROCHIP_PFSOC_DRAM_HI].base;
+
+    /*
+     * In theory we could copy riscv_compute_fdt_addr()
+     * and put the FDT capped at maximum 3Gb from fdt_base,
+     * but fdt_base is set at 0x1000000000 (64GiB). We
+     * make the assumption here that the OS is ready to
+     * handle the FDT, 2MB aligned, at the very end of
+     * the available RAM.
+     */
+    return QEMU_ALIGN_DOWN(fdt_base + mem_high_size - fdtsize, 2 * MiB);
+}
+
 static void microchip_icicle_kit_machine_init(MachineState *machine)
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
@@ -640,9 +682,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
                                     "bootargs", machine->kernel_cmdline);
         }
 
-        /* Compute the fdt load address in dram */
-        fdt_load_addr = riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
-                                              machine->ram_size, machine->fdt);
+        fdt_load_addr = microchip_compute_fdt_addr(machine);
         riscv_load_fdt(fdt_load_addr, machine->fdt);
 
         /* Load the reset vector */
-- 
2.39.0


