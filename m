Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5EB1C3992
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 14:41:04 +0200 (CEST)
Received: from localhost ([::1]:36192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVaP9-0005Os-EB
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 08:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVaHu-0000NH-Rc
 for qemu-devel@nongnu.org; Mon, 04 May 2020 08:33:34 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVaHt-00012u-9L
 for qemu-devel@nongnu.org; Mon, 04 May 2020 08:33:34 -0400
Received: by mail-wr1-x433.google.com with SMTP id k1so20716699wrx.4
 for <qemu-devel@nongnu.org>; Mon, 04 May 2020 05:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jN6cddhLjlwwOrx5T4wiIKd+7OUeXipaks3CQjwOIzw=;
 b=aJ+cwOH3hDBrjHSJd3FPfy9j3VrR94oDpeTdpTYkHaZGtctFWuD0eK6ueDnhn5fLMA
 ALRjMz8jcIV4zOYZ5YjtzQz0lZ2MNnVpGhgLgAYzk8aYUf4okAgvTPVJDcMBCI3d7e6m
 NtFDbI+dzLcSCb5jVZ+zSfezeB9jnZTOYZ5sv6kcPzQBbI7pcKfKrcCD/UFTnZqyvqBW
 r/r/W8+rhUCKwRpGsBnUivHo6KTN56qAQMN3UIpXAkM0wcDJh64VkHYeoBed0yGC4Msj
 s+8PVRKwRkhWwt+iP/WA/vkRhTjHL2sUmt9s0fV6yKmvzK5s6r++jHG4TQdsQvQ7dDyW
 X3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jN6cddhLjlwwOrx5T4wiIKd+7OUeXipaks3CQjwOIzw=;
 b=eWk4KhabBsN7Ba28eOhiGeAXC3Z7ZK3M/dUOVNDBeZOvh5bxgx39nxVsMqFvFjBr3A
 EszXMOUuMHQPHDkpf7E9BDlwvITGwPQNjdRGT70rNqh0ZxziYO+5tfQKbGZtAxgATY5C
 AyiupgLhAH23Pa/hputW5g7tYb4abZMvezRaX+Ek9U5JW6t615CN+dDOZ6jhxlUes3Qn
 qRI8p5Dgyjm0afTDWRW/pPCPchM94iR6qhPVsw/LHWbn85yFwjO4i1oKPrri5kbOmIfJ
 sIj1SlDD2GEiYnykaqPR+YAqYPZAwrIvNSR2PSATZNt2UUwV/uRPWzv+993wz38Cp3xu
 K2eg==
X-Gm-Message-State: AGi0PuaNmiNs77zDH0mB4D1YyqbxYjdCJcLcpGO1LMetuwhZbRgSoOs5
 Lz/7l30TLspkbWt2nLlZ8TvBYepV7icu3w==
X-Google-Smtp-Source: APiQypKi7p+qkkeXNOsiV5oJ+NL/Vvp4TlBvsBD1QtXABCUSIyfeDWUspVThN4r1n5tvFBFDGm4Xkw==
X-Received: by 2002:adf:e449:: with SMTP id t9mr7904245wrm.108.1588595611478; 
 Mon, 04 May 2020 05:33:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q4sm12253608wrx.9.2020.05.04.05.33.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 05:33:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/39] hw/arm: versal-virt: Add support for SD
Date: Mon,  4 May 2020 13:32:48 +0100
Message-Id: <20200504123309.3808-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200504123309.3808-1-peter.maydell@linaro.org>
References: <20200504123309.3808-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add support for SD.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Message-id: 20200427181649.26851-11-edgar.iglesias@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/xlnx-versal-virt.c | 46 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index d7be1ad4942..0afee48672a 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -20,6 +20,7 @@
 #include "hw/arm/sysbus-fdt.h"
 #include "hw/arm/fdt.h"
 #include "cpu.h"
+#include "hw/qdev-properties.h"
 #include "hw/arm/xlnx-versal.h"
 
 #define TYPE_XLNX_VERSAL_VIRT_MACHINE MACHINE_TYPE_NAME("xlnx-versal-virt")
@@ -256,6 +257,32 @@ static void fdt_add_zdma_nodes(VersalVirt *s)
     }
 }
 
+static void fdt_add_sd_nodes(VersalVirt *s)
+{
+    const char clocknames[] = "clk_xin\0clk_ahb";
+    const char compat[] = "arasan,sdhci-8.9a";
+    int i;
+
+    for (i = ARRAY_SIZE(s->soc.pmc.iou.sd) - 1; i >= 0; i--) {
+        uint64_t addr = MM_PMC_SD0 + MM_PMC_SD0_SIZE * i;
+        char *name = g_strdup_printf("/sdhci@%" PRIx64, addr);
+
+        qemu_fdt_add_subnode(s->fdt, name);
+
+        qemu_fdt_setprop_cells(s->fdt, name, "clocks",
+                               s->phandle.clk_25Mhz, s->phandle.clk_25Mhz);
+        qemu_fdt_setprop(s->fdt, name, "clock-names",
+                         clocknames, sizeof(clocknames));
+        qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
+                               GIC_FDT_IRQ_TYPE_SPI, VERSAL_SD0_IRQ_0 + i * 2,
+                               GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+        qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                     2, addr, 2, MM_PMC_SD0_SIZE);
+        qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
+        g_free(name);
+    }
+}
+
 static void fdt_nop_memory_nodes(void *fdt, Error **errp)
 {
     Error *err = NULL;
@@ -411,10 +438,23 @@ static void create_virtio_regions(VersalVirt *s)
     }
 }
 
+static void sd_plugin_card(SDHCIState *sd, DriveInfo *di)
+{
+    BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
+    DeviceState *card;
+
+    card = qdev_create(qdev_get_child_bus(DEVICE(sd), "sd-bus"), TYPE_SD_CARD);
+    object_property_add_child(OBJECT(sd), "card[*]", OBJECT(card),
+                              &error_fatal);
+    qdev_prop_set_drive(card, "drive", blk, &error_fatal);
+    object_property_set_bool(OBJECT(card), true, "realized", &error_fatal);
+}
+
 static void versal_virt_init(MachineState *machine)
 {
     VersalVirt *s = XLNX_VERSAL_VIRT_MACHINE(machine);
     int psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
+    int i;
 
     /*
      * If the user provides an Operating System to be loaded, we expect them
@@ -455,6 +495,7 @@ static void versal_virt_init(MachineState *machine)
     fdt_add_gic_nodes(s);
     fdt_add_timer_nodes(s);
     fdt_add_zdma_nodes(s);
+    fdt_add_sd_nodes(s);
     fdt_add_cpu_nodes(s, psci_conduit);
     fdt_add_clk_node(s, "/clk125", 125000000, s->phandle.clk_125Mhz);
     fdt_add_clk_node(s, "/clk25", 25000000, s->phandle.clk_25Mhz);
@@ -464,6 +505,11 @@ static void versal_virt_init(MachineState *machine)
     memory_region_add_subregion_overlap(get_system_memory(),
                                         0, &s->soc.fpd.apu.mr, 0);
 
+    /* Plugin SD cards.  */
+    for (i = 0; i < ARRAY_SIZE(s->soc.pmc.iou.sd); i++) {
+        sd_plugin_card(&s->soc.pmc.iou.sd[i], drive_get_next(IF_SD));
+    }
+
     s->binfo.ram_size = machine->ram_size;
     s->binfo.loader_start = 0x0;
     s->binfo.get_dtb = versal_virt_get_dtb;
-- 
2.20.1


