Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445E935C7E7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 15:47:56 +0200 (CEST)
Received: from localhost ([::1]:49528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVwux-00005g-8J
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 09:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVwqe-0004Rw-Ke
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 09:43:28 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVwqZ-0003OZ-Nt
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 09:43:28 -0400
Received: by mail-wr1-x432.google.com with SMTP id e7so4038406wrs.11
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 06:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cDO1RU8opOjg8lz5yVdRnsK4bX62WcXv9iHo0ctQKQg=;
 b=QuLr+0rBEgvL5Yj0eu9tkR4c3anfp4hjhdzFZHqwbYkBjSStroeXuInU3/qUItGWpy
 TkOznlULCkO6aGHimyTXk+rZrewK1Qh+AtnRGugyWW8mb0wrapesNQJBbg+lNRZX2vIO
 NQr4X4pFaPvghJ8v9AiARSsceu/am+YzUGOqegj5GDlUaabjMfDtVEcuP3z93tMyUEe5
 92LkCM0hxT6ppkpfn+pGNdsFYoh0tJREq5WxF+OP9s5REz/B+2ebHWMOFEDDNK96Qjm6
 7TFgWsc2mYrA/c6Q8KD1qKrGQC8fOQkrEUSe/bvwYabYlGDO0zkngeqcFkx+buBgDiZP
 4BQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cDO1RU8opOjg8lz5yVdRnsK4bX62WcXv9iHo0ctQKQg=;
 b=IMlmtXEex3EEiZ5KuIMex+qWWJr2gLw9MXYFzEeO7f2R1UYBN6ZWO805d6pR0wAedx
 6Ge8BqeHLsaocZcHg3MyuXHYUeyGvHnDfZgwS1ryNbXwaeNBcl3BRyHWmEO8paRMoq5B
 ZAov3tXbYiQjFSGgbkMN6tagKyjpWZ5WHxM5/1o8xSiHyH/Kfv2l5Fc46upoCDGA5KZD
 XxZaP9uJX4CKVq7n7bvcEVZRf4Jfez6NHMtGBYRl8YtrysmVLus0YPcb6W1CPJTHthk1
 6CikneybzpNsfqq7XElS+tGKRIjt1Jl1+uV6UJyIVu8VDMmtlVu1bSVOypdJNnVEovPu
 yo+g==
X-Gm-Message-State: AOAM531yQI14qsZyduM8iBvfU5ZGfCngszZHOjODvRwLo0KMh6UyPKDK
 Ee8R2pov6OjQppG7n8yYqPeWWKwwXuE6FSt8
X-Google-Smtp-Source: ABdhPJyS2JAxDdOfV1uUV6u8CbyGyfzNacrlKJWpu7v1nc8PoK7OIgZ+9BZqdNiBHvRmtxNbUIxCLA==
X-Received: by 2002:a05:6000:18ab:: with SMTP id
 b11mr31392844wri.403.1618235002379; 
 Mon, 12 Apr 2021 06:43:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm19574680wrt.54.2021.04.12.06.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 06:43:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/arm/mps2-tz: Implement AN524 memory remapping via
 machine property
Date: Mon, 12 Apr 2021 14:43:17 +0100
Message-Id: <20210412134317.12501-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210412134317.12501-1-peter.maydell@linaro.org>
References: <20210412134317.12501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AN524 FPGA image supports two memory maps, which differ
in where the QSPI and BRAM are. In the default map, the BRAM
is at 0x0000_0000, and the QSPI at 0x2800_0000. In the second
map, they are the other way around.

In hardware, the initial mapping can be selected by the user
by writing either "REMAP: BRAM" (the default) or "REMAP: QSPI"
in the board configuration file. The guest can also dynamically
change the mapping via the SCC CFG_REG0 register.

Implement this functionality for QEMU, using a machine property
"remap" with valid values "BRAM" and "QSPI" to allow the user to set
the initial mapping, in the same way they can on the FPGA, and
wiring up the bit from the SCC register to also switch the mapping.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/mps2.rst |  10 ++++
 hw/arm/mps2-tz.c         | 106 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 115 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/mps2.rst b/docs/system/arm/mps2.rst
index f83b1517871..8a75beb3a08 100644
--- a/docs/system/arm/mps2.rst
+++ b/docs/system/arm/mps2.rst
@@ -45,3 +45,13 @@ Differences between QEMU and real hardware:
   flash, but only as simple ROM, so attempting to rewrite the flash
   from the guest will fail
 - QEMU does not model the USB controller in MPS3 boards
+
+Machine-specific options
+""""""""""""""""""""""""
+
+The following machine-specific options are supported:
+
+remap
+  Supported for ``mps3-an524`` only.
+  Set ``BRAM``/``QSPI`` to select the initial memory mapping. The
+  default is ``BRAM``.
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 25016e464d9..e9806779326 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -55,6 +55,7 @@
 #include "hw/boards.h"
 #include "exec/address-spaces.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/reset.h"
 #include "hw/misc/unimp.h"
 #include "hw/char/cmsdk-apb-uart.h"
 #include "hw/timer/cmsdk-apb-timer.h"
@@ -72,6 +73,7 @@
 #include "hw/core/split-irq.h"
 #include "hw/qdev-clock.h"
 #include "qom/object.h"
+#include "hw/irq.h"
 
 #define MPS2TZ_NUMIRQ_MAX 96
 #define MPS2TZ_RAM_MAX 5
@@ -153,6 +155,9 @@ struct MPS2TZMachineState {
     SplitIRQ cpu_irq_splitter[MPS2TZ_NUMIRQ_MAX];
     Clock *sysclk;
     Clock *s32kclk;
+
+    int remap;
+    qemu_irq remap_irq;
 };
 
 #define TYPE_MPS2TZ_MACHINE "mps2tz"
@@ -228,6 +233,10 @@ static const RAMInfo an505_raminfo[] = { {
     },
 };
 
+/*
+ * Note that the addresses and MPC numbering here should match up
+ * with those used in remap_memory(), which can swap the BRAM and QSPI.
+ */
 static const RAMInfo an524_raminfo[] = { {
         .name = "bram",
         .base = 0x00000000,
@@ -457,6 +466,7 @@ static MemoryRegion *make_scc(MPS2TZMachineState *mms, void *opaque,
 
     object_initialize_child(OBJECT(mms), "scc", scc, TYPE_MPS2_SCC);
     sccdev = DEVICE(scc);
+    qdev_prop_set_uint32(sccdev, "scc-cfg0", mms->remap);
     qdev_prop_set_uint32(sccdev, "scc-cfg4", 0x2);
     qdev_prop_set_uint32(sccdev, "scc-aid", 0x00200008);
     qdev_prop_set_uint32(sccdev, "scc-id", mmc->scc_id);
@@ -573,6 +583,50 @@ static MemoryRegion *make_mpc(MPS2TZMachineState *mms, void *opaque,
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(mpc), 0);
 }
 
+static hwaddr boot_mem_base(MPS2TZMachineState *mms)
+{
+    /*
+     * Return the canonical address of the block which will be mapped
+     * at address 0x0 (i.e. where the vector table is).
+     * This is usually 0, but if the AN524 alternate memory map is
+     * enabled it will be the base address of the QSPI block.
+     */
+    return mms->remap ? 0x28000000 : 0;
+}
+
+static void remap_memory(MPS2TZMachineState *mms, int map)
+{
+    /*
+     * Remap the memory for the AN524. 'map' is the value of
+     * SCC CFG_REG0 bit 0, i.e. 0 for the default map and 1
+     * for the "option 1" mapping where QSPI is at address 0.
+     *
+     * Effectively we need to swap around the "upstream" ends of
+     * MPC 0 and MPC 1.
+     */
+    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
+    int i;
+
+    if (mmc->fpga_type != FPGA_AN524) {
+        return;
+    }
+
+    for (i = 0; i < 2; i++) {
+        TZMPC *mpc = &mms->mpc[i];
+        MemoryRegion *upstream = sysbus_mmio_get_region(SYS_BUS_DEVICE(mpc), 1);
+        hwaddr addr = (i ^ map) ? 0x28000000 : 0;
+
+        memory_region_set_address(upstream, addr);
+    }
+}
+
+static void remap_irq_fn(void *opaque, int n, int level)
+{
+    MPS2TZMachineState *mms = opaque;
+
+    remap_memory(mms, level);
+}
+
 static MemoryRegion *make_dma(MPS2TZMachineState *mms, void *opaque,
                               const char *name, hwaddr size,
                               const int *irqs)
@@ -711,7 +765,7 @@ static uint32_t boot_ram_size(MPS2TZMachineState *mms)
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
 
     for (p = mmc->raminfo; p->name; p++) {
-        if (p->base == 0) {
+        if (p->base == boot_mem_base(mms)) {
             return p->size;
         }
     }
@@ -1095,6 +1149,16 @@ static void mps2tz_common_init(MachineState *machine)
 
     create_non_mpc_ram(mms);
 
+    if (mmc->fpga_type == FPGA_AN524) {
+        /*
+         * Connect the line from the SCC so that we can remap when the
+         * guest updates that register.
+         */
+        mms->remap_irq = qemu_allocate_irq(remap_irq_fn, mms, 0);
+        qdev_connect_gpio_out_named(DEVICE(&mms->scc), "remap", 0,
+                                    mms->remap_irq);
+    }
+
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
                        boot_ram_size(mms));
 }
@@ -1117,12 +1181,47 @@ static void mps2_tz_idau_check(IDAUInterface *ii, uint32_t address,
     *iregion = region;
 }
 
+static char *mps2_get_remap(Object *obj, Error **errp)
+{
+    MPS2TZMachineState *mms = MPS2TZ_MACHINE(obj);
+    const char *val = mms->remap ? "QSPI" : "BRAM";
+    return g_strdup(val);
+}
+
+static void mps2_set_remap(Object *obj, const char *value, Error **errp)
+{
+    MPS2TZMachineState *mms = MPS2TZ_MACHINE(obj);
+
+    if (!strcmp(value, "BRAM")) {
+        mms->remap = 0;
+    } else if (!strcmp(value, "QSPI")) {
+        mms->remap = 1;
+    } else {
+        error_setg(errp, "Invalid remap value");
+        error_append_hint(errp, "Valid values are BRAM and QSPI.\n");
+    }
+}
+
+static void mps2_machine_reset(MachineState *machine)
+{
+    MPS2TZMachineState *mms = MPS2TZ_MACHINE(machine);
+
+    /*
+     * Set the initial memory mapping before triggering the reset of
+     * the rest of the system, so that the guest image loader and CPU
+     * reset see the correct mapping.
+     */
+    remap_memory(mms, mms->remap);
+    qemu_devices_reset();
+}
+
 static void mps2tz_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     IDAUInterfaceClass *iic = IDAU_INTERFACE_CLASS(oc);
 
     mc->init = mps2tz_common_init;
+    mc->reset = mps2_machine_reset;
     iic->check = mps2_tz_idau_check;
 }
 
@@ -1225,6 +1324,11 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
     mmc->raminfo = an524_raminfo;
     mmc->armsse_type = TYPE_SSE200;
     mps2tz_set_default_ram_info(mmc);
+
+    object_class_property_add_str(oc, "remap", mps2_get_remap, mps2_set_remap);
+    object_class_property_set_description(oc, "remap",
+                                          "Set memory mapping. Valid values "
+                                          "are BRAM (default) and QSPI.");
 }
 
 static void mps3tz_an547_class_init(ObjectClass *oc, void *data)
-- 
2.20.1


