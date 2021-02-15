Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBD331B8CB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:11:04 +0100 (CET)
Received: from localhost ([::1]:57330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBciV-0004WT-9B
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:11:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQs-0008WI-7u
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:50 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQp-00049g-KN
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:49 -0500
Received: by mail-wm1-x32b.google.com with SMTP id z63so3758635wmg.4
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g39A1Te0/340pWg5jN+HevWlGijlA8x8/t1AqKmXmB0=;
 b=ktgnsehSPTTtEhfFHYSWJyoCJc1eJ0BDpY224afk5SsBZRgREwHoR0gufWcil4e7BL
 BSeio5zx/HbLEoPFTqRi4P/XwV59Ylrt4V6/L0+pPKO/CT491prLJJx4kxK/Iy32AfAh
 XmZbndtoyrJlNN9bnLBD1xiS4mnZOeCaSypAKSGy/7f9DSTk9sJJewgUs3cFolNCwfpW
 T385FTqTif8OYO19u2OjlziaNHG5WiOy+CGNX3Zq9NmPCPJye9m/IV4bYLoZsnsx/aNl
 iwjtHvl0TEUvi8Fe4q0cUpPWSbJ/nRludP0cA5dVqjHKUEm6sVtPn3B3hgp0xKb7i4/0
 NAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g39A1Te0/340pWg5jN+HevWlGijlA8x8/t1AqKmXmB0=;
 b=ATK/+8XhoAoIwK06plVZksaoBcWBdONs0vkJJUnxvOmWY782jKFU0KDuIRKN8kbJNp
 /e4ekFFQidY18fRfb+bE070D6m3GWWyfaYriE+sARgNX1PYa2RICL8DTOIevt0jrl5LR
 N1y/Wj1ejZZJdRLrBLII1XL6SrR7E4gT7xTHTlE1/SXaM+HvKH8SI9/sMTdHB6dP0X4o
 Mz8wXm+aTB2j1ZbGu2FB7AWD1sRrMrUnM1rPdJYdc0J4bWGRcYD26K5wBMGbUEQD2VUX
 NvruOszEbC+9kZ8lfqJF0hMCrofRA48V92/BC0DEJEzoe+R4bHbz/kiuMHbuGKXpXzrh
 RkIA==
X-Gm-Message-State: AOAM5334/zvueguvJIKmwXWnkalGB6Hbm0q970tWVRJBMux1C/GVbdx4
 LN/EYjRQrGqdX0Fh1TBY8BXxsA==
X-Google-Smtp-Source: ABdhPJxuvJtToATN6PwOXB75ShaRBM2u7aOU3cEf5QUqbT00Ff8GDyicrhbMrSd9FY8ziYamV7Q5Rw==
X-Received: by 2002:a1c:4006:: with SMTP id n6mr14058946wma.177.1613389966278; 
 Mon, 15 Feb 2021 03:52:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 16/24] hw/arm/mps2-tz: Make RAM arrangement board-specific
Date: Mon, 15 Feb 2021 11:51:30 +0000
Message-Id: <20210215115138.20465-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AN505 and AN521 have the same layout of RAM; the AN524 does not.
Replace the current hard-coding of where the RAM is and which parts
of it are behind which MPCs with a data-driven approach.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 175 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 138 insertions(+), 37 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index a79966a7187..18f75eacfcd 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -66,12 +66,35 @@
 #include "qom/object.h"
 
 #define MPS2TZ_NUMIRQ_MAX 92
+#define MPS2TZ_RAM_MAX 4
 
 typedef enum MPS2TZFPGAType {
     FPGA_AN505,
     FPGA_AN521,
 } MPS2TZFPGAType;
 
+/*
+ * Define the layout of RAM in a board, including which parts are
+ * behind which MPCs.
+ * mrindex specifies the index into mms->ram[] to use for the backing RAM;
+ * -1 means "use the system RAM".
+ */
+typedef struct RAMInfo {
+    const char *name;
+    uint32_t base;
+    uint32_t size;
+    int mpc; /* MPC number, -1 for "not behind an MPC" */
+    int mrindex;
+    int flags;
+} RAMInfo;
+
+/*
+ * Flag values:
+ *  IS_ALIAS: this RAM area is an alias to the upstream end of the
+ *    MPC specified by its .mpc value
+ */
+#define IS_ALIAS 1
+
 struct MPS2TZMachineClass {
     MachineClass parent;
     MPS2TZFPGAType fpga_type;
@@ -82,6 +105,7 @@ struct MPS2TZMachineClass {
     uint32_t fpgaio_num_leds; /* Number of LEDs in FPGAIO LED0 register */
     bool fpgaio_has_switches; /* Does FPGAIO have SWITCH register? */
     int numirq; /* Number of external interrupts */
+    const RAMInfo *raminfo;
     const char *armsse_type;
 };
 
@@ -89,12 +113,11 @@ struct MPS2TZMachineState {
     MachineState parent;
 
     ARMSSE iotkit;
-    MemoryRegion ssram[3];
-    MemoryRegion ssram1_m;
+    MemoryRegion ram[MPS2TZ_RAM_MAX];
     MPS2SCC scc;
     MPS2FPGAIO fpgaio;
     TZPPC ppc[5];
-    TZMPC ssram_mpc[3];
+    TZMPC mpc[3];
     PL022State spi[5];
     ArmSbconI2CState i2c[4];
     UnimplementedDeviceState i2s_audio;
@@ -126,6 +149,77 @@ static const uint32_t an505_oscclk[] = {
     25000000,
 };
 
+static const RAMInfo an505_raminfo[] = { {
+        .name = "ssram-0",
+        .base = 0x00000000,
+        .size = 0x00400000,
+        .mpc = 0,
+        .mrindex = 0,
+    }, {
+        .name = "ssram-1",
+        .base = 0x28000000,
+        .size = 0x00200000,
+        .mpc = 1,
+        .mrindex = 1,
+    }, {
+        .name = "ssram-2",
+        .base = 0x28200000,
+        .size = 0x00200000,
+        .mpc = 2,
+        .mrindex = 2,
+    }, {
+        .name = "ssram-0-alias",
+        .base = 0x00400000,
+        .size = 0x00400000,
+        .mpc = 0,
+        .mrindex = 3,
+        .flags = IS_ALIAS,
+    }, {
+        /* Use the largest bit of contiguous RAM as our "system memory" */
+        .name = "mps.ram",
+        .base = 0x80000000,
+        .size = 16 * MiB,
+        .mpc = -1,
+        .mrindex = -1,
+    }, {
+        .name = NULL,
+    },
+};
+
+static const RAMInfo *find_raminfo_for_mpc(MPS2TZMachineState *mms, int mpc)
+{
+    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
+    const RAMInfo *p;
+
+    for (p = mmc->raminfo; p->name; p++) {
+        if (p->mpc == mpc && !(p->flags & IS_ALIAS)) {
+            return p;
+        }
+    }
+    /* if raminfo array doesn't have an entry for each MPC this is a bug */
+    g_assert_not_reached();
+}
+
+static MemoryRegion *mr_for_raminfo(MPS2TZMachineState *mms,
+                                    const RAMInfo *raminfo)
+{
+    /* Return an initialized MemoryRegion for the RAMInfo. */
+    MemoryRegion *ram;
+
+    if (raminfo->mrindex < 0) {
+        /* Means this RAMInfo is for QEMU's "system memory" */
+        MachineState *machine = MACHINE(mms);
+        return machine->ram;
+    }
+
+    assert(raminfo->mrindex < MPS2TZ_RAM_MAX);
+    ram = &mms->ram[raminfo->mrindex];
+
+    memory_region_init_ram(ram, NULL, raminfo->name,
+                           raminfo->size, &error_fatal);
+    return ram;
+}
+
 /* Create an alias of an entire original MemoryRegion @orig
  * located at @base in the memory map.
  */
@@ -290,35 +384,23 @@ static MemoryRegion *make_mpc(MPS2TZMachineState *mms, void *opaque,
                               const int *irqs)
 {
     TZMPC *mpc = opaque;
-    int i = mpc - &mms->ssram_mpc[0];
-    MemoryRegion *ssram = &mms->ssram[i];
+    int i = mpc - &mms->mpc[0];
     MemoryRegion *upstream;
-    char *mpcname = g_strdup_printf("%s-mpc", name);
-    static uint32_t ramsize[] = { 0x00400000, 0x00200000, 0x00200000 };
-    static uint32_t rambase[] = { 0x00000000, 0x28000000, 0x28200000 };
+    const RAMInfo *raminfo = find_raminfo_for_mpc(mms, i);
+    MemoryRegion *ram = mr_for_raminfo(mms, raminfo);
 
-    memory_region_init_ram(ssram, NULL, name, ramsize[i], &error_fatal);
-
-    object_initialize_child(OBJECT(mms), mpcname, mpc, TYPE_TZ_MPC);
-    object_property_set_link(OBJECT(mpc), "downstream", OBJECT(ssram),
+    object_initialize_child(OBJECT(mms), name, mpc, TYPE_TZ_MPC);
+    object_property_set_link(OBJECT(mpc), "downstream", OBJECT(ram),
                              &error_fatal);
     sysbus_realize(SYS_BUS_DEVICE(mpc), &error_fatal);
     /* Map the upstream end of the MPC into system memory */
     upstream = sysbus_mmio_get_region(SYS_BUS_DEVICE(mpc), 1);
-    memory_region_add_subregion(get_system_memory(), rambase[i], upstream);
+    memory_region_add_subregion(get_system_memory(), raminfo->base, upstream);
     /* and connect its interrupt to the IoTKit */
     qdev_connect_gpio_out_named(DEVICE(mpc), "irq", 0,
                                 qdev_get_gpio_in_named(DEVICE(&mms->iotkit),
                                                        "mpcexp_status", i));
 
-    /* The first SSRAM is a special case as it has an alias; accesses to
-     * the alias region at 0x00400000 must also go to the MPC upstream.
-     */
-    if (i == 0) {
-        make_ram_alias(&mms->ssram1_m, "mps.ssram1_m", upstream, 0x00400000);
-    }
-
-    g_free(mpcname);
     /* Return the register interface MR for our caller to map behind the PPC */
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(mpc), 0);
 }
@@ -415,6 +497,28 @@ static MemoryRegion *make_i2c(MPS2TZMachineState *mms, void *opaque,
     return sysbus_mmio_get_region(s, 0);
 }
 
+static void create_non_mpc_ram(MPS2TZMachineState *mms)
+{
+    /*
+     * Handle the RAMs which are either not behind MPCs or which are
+     * aliases to another MPC.
+     */
+    const RAMInfo *p;
+    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
+
+    for (p = mmc->raminfo; p->name; p++) {
+        if (p->flags & IS_ALIAS) {
+            SysBusDevice *mpc_sbd = SYS_BUS_DEVICE(&mms->mpc[p->mpc]);
+            MemoryRegion *upstream = sysbus_mmio_get_region(mpc_sbd, 1);
+            make_ram_alias(&mms->ram[p->mrindex], p->name, upstream, p->base);
+        } else if (p->mpc == -1) {
+            /* RAM not behind an MPC */
+            MemoryRegion *mr = mr_for_raminfo(mms, p);
+            memory_region_add_subregion(get_system_memory(), p->base, mr);
+        }
+    }
+}
+
 static void mps2tz_common_init(MachineState *machine)
 {
     MPS2TZMachineState *mms = MPS2TZ_MACHINE(machine);
@@ -499,24 +603,17 @@ static void mps2tz_common_init(MachineState *machine)
     qdev_connect_gpio_out_named(iotkitdev, "sec_resp_cfg", 0,
                                 qdev_get_gpio_in(dev_splitter, 0));
 
-    /* The IoTKit sets up much of the memory layout, including
+    /*
+     * The IoTKit sets up much of the memory layout, including
      * the aliases between secure and non-secure regions in the
-     * address space. The FPGA itself contains:
-     *
-     * 0x00000000..0x003fffff  SSRAM1
-     * 0x00400000..0x007fffff  alias of SSRAM1
-     * 0x28000000..0x283fffff  4MB SSRAM2 + SSRAM3
-     * 0x40100000..0x4fffffff  AHB Master Expansion 1 interface devices
-     * 0x80000000..0x80ffffff  16MB PSRAM
-     */
-
-    /* The FPGA images have an odd combination of different RAMs,
+     * address space, and also most of the devices in the system.
+     * The FPGA itself contains various RAMs and some additional devices.
+     * The FPGA images have an odd combination of different RAMs,
      * because in hardware they are different implementations and
      * connected to different buses, giving varying performance/size
      * tradeoffs. For QEMU they're all just RAM, though. We arbitrarily
-     * call the 16MB our "system memory", as it's the largest lump.
+     * call the largest lump our "system memory".
      */
-    memory_region_add_subregion(system_memory, 0x80000000, machine->ram);
 
     /*
      * The overflow IRQs for all UARTs are ORed together.
@@ -549,9 +646,9 @@ static void mps2tz_common_init(MachineState *machine)
     const PPCInfo an505_ppcs[] = { {
             .name = "apb_ppcexp0",
             .ports = {
-                { "ssram-0", make_mpc, &mms->ssram_mpc[0], 0x58007000, 0x1000 },
-                { "ssram-1", make_mpc, &mms->ssram_mpc[1], 0x58008000, 0x1000 },
-                { "ssram-2", make_mpc, &mms->ssram_mpc[2], 0x58009000, 0x1000 },
+                { "ssram-0-mpc", make_mpc, &mms->mpc[0], 0x58007000, 0x1000 },
+                { "ssram-1-mpc", make_mpc, &mms->mpc[1], 0x58008000, 0x1000 },
+                { "ssram-2-mpc", make_mpc, &mms->mpc[2], 0x58009000, 0x1000 },
             },
         }, {
             .name = "apb_ppcexp1",
@@ -684,6 +781,8 @@ static void mps2tz_common_init(MachineState *machine)
 
     create_unimplemented_device("FPGA NS PC", 0x48007000, 0x1000);
 
+    create_non_mpc_ram(mms);
+
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0x400000);
 }
 
@@ -734,6 +833,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->fpgaio_num_leds = 2;
     mmc->fpgaio_has_switches = false;
     mmc->numirq = 92;
+    mmc->raminfo = an505_raminfo;
     mmc->armsse_type = TYPE_IOTKIT;
 }
 
@@ -755,6 +855,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->fpgaio_num_leds = 2;
     mmc->fpgaio_has_switches = false;
     mmc->numirq = 92;
+    mmc->raminfo = an505_raminfo; /* AN521 is the same as AN505 here */
     mmc->armsse_type = TYPE_SSE200;
 }
 
-- 
2.20.1


