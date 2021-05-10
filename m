Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E5D378C5D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:41:30 +0200 (CEST)
Received: from localhost ([::1]:33018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5E1-00031Y-1l
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4zC-0006O3-TV
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:10 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:44735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4zA-0003JP-LE
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:10 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 82-20020a1c01550000b0290142562ff7c9so8774744wmb.3
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KfLZ6LXviV0zOceL8z32K11kNdm5AeMaXSYyQKbM+6I=;
 b=UN1+T1xWwgQK6mQq3iKAmFqsq/Q6p6WNEby2V72sH2hLPOSoLJnsVgMosGDLk/3f8E
 liwMoJQLJliTPq9cy2EF72MBNlGt1L8vGNWWTN8Sck5ya56r812DvfofS5pkdxRk2AI1
 vkLMD5ZKJ6/PZXzG/nqNJa+uOkMdCqZyIZibGHxTunmWN7mRnZeKdIMgu6zFBjBlrXs4
 tG4UUDlwMl4CqyC9tXgT8sIA5jrdAER0FuYGAgEXLH4wkzki3b5zOeA/haOxQJui9ivI
 pekZkdzq0AEc6lrznhc2c5krfvtuDbdKp7AWVdJjTdu3HtcbNkSjjv5eb66nAzB1kl+A
 CYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KfLZ6LXviV0zOceL8z32K11kNdm5AeMaXSYyQKbM+6I=;
 b=GC5VOuBG3igDPXstELlaLm8CNpMxvVV4DSim+x0amLviWG+eTSSQWaDk2y1ggM5mjk
 BXl3z1Ctg3IencKetBDM9f130zjfkFJQ83feHjUbf0apz1QQ5aC8OAnovXXoYzAjWuiq
 BmcS7w1rJ77qcsk4CCvj1F7eNeBRb8THrIByX64UV5yGaCU/1S1QgjiGK26YwBlrhJPY
 qgNiPoM+CUDFn1nKCT+Ww+nF19OgW7Rytrri3V+5XJTR5NuFEP0eiB/QnBMuTIb5cQns
 s0MTB3h3Ih85ulUqUDypG53CB2vQGApg0CVUxrtTyfehYGlBSzI5ZInpWcfBzTyPBP5n
 IdAg==
X-Gm-Message-State: AOAM533tpKruwybgVc6bEQIMShi2xHdv8EwfNe9Fa1WUUkA68Nj4AaO4
 Wm3hBymNt76xLo/1is99np77uhal9BweFA==
X-Google-Smtp-Source: ABdhPJyGq1wDw5x15A/jL6DlA8DG08KfxfFR6NcHiwTHndq3cysyz8z21Qo/KHOUTWC3ljff9qxpPw==
X-Received: by 2002:a7b:cb4a:: with SMTP id v10mr25930955wmj.53.1620649567084; 
 Mon, 10 May 2021 05:26:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.26.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:26:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/26] hw/arm/mps2-tz: Implement AN524 memory remapping via
 machine property
Date: Mon, 10 May 2021 13:25:47 +0100
Message-Id: <20210510122548.28638-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AN524 FPGA image supports two memory maps, which differ in where
the QSPI and BRAM are.  In the default map, the BRAM is at
0x0000_0000, and the QSPI at 0x2800_0000.  In the second map, they
are the other way around.

In hardware, the initial mapping can be selected by the user by
writing either "REMAP: BRAM" (the default) or "REMAP: QSPI" in the
board configuration file.  The board config file is acted on by the
"Motherboard Configuration Controller", which is an entirely separate
microcontroller on the dev board but outside the FPGA.

The guest can also dynamically change the mapping via the SCC
CFG_REG0 register.

Implement this functionality for QEMU, using a machine property
"remap" with valid values "BRAM" and "QSPI" to allow the user to set
the initial mapping, in the same way they can on the FPGA, and
wiring up the bit from the SCC register to also switch the mapping.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210504120912.23094-4-peter.maydell@linaro.org
---
 docs/system/arm/mps2.rst |  10 ++++
 hw/arm/mps2-tz.c         | 108 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 117 insertions(+), 1 deletion(-)

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
index 25016e464d9..70aa31a7f6c 100644
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
+    bool remap;
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
+    qdev_prop_set_uint32(sccdev, "scc-cfg0", mms->remap ? 1 : 0);
     qdev_prop_set_uint32(sccdev, "scc-cfg4", 0x2);
     qdev_prop_set_uint32(sccdev, "scc-aid", 0x00200008);
     qdev_prop_set_uint32(sccdev, "scc-id", mmc->scc_id);
@@ -573,6 +583,52 @@ static MemoryRegion *make_mpc(MPS2TZMachineState *mms, void *opaque,
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
+    memory_region_transaction_begin();
+    for (i = 0; i < 2; i++) {
+        TZMPC *mpc = &mms->mpc[i];
+        MemoryRegion *upstream = sysbus_mmio_get_region(SYS_BUS_DEVICE(mpc), 1);
+        hwaddr addr = (i ^ map) ? 0x28000000 : 0;
+
+        memory_region_set_address(upstream, addr);
+    }
+    memory_region_transaction_commit();
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
@@ -711,7 +767,7 @@ static uint32_t boot_ram_size(MPS2TZMachineState *mms)
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
 
     for (p = mmc->raminfo; p->name; p++) {
-        if (p->base == 0) {
+        if (p->base == boot_mem_base(mms)) {
             return p->size;
         }
     }
@@ -1095,6 +1151,16 @@ static void mps2tz_common_init(MachineState *machine)
 
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
@@ -1117,12 +1183,47 @@ static void mps2_tz_idau_check(IDAUInterface *ii, uint32_t address,
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
+        mms->remap = false;
+    } else if (!strcmp(value, "QSPI")) {
+        mms->remap = true;
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
 
@@ -1225,6 +1326,11 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
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


