Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE9129B2FE
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 15:48:47 +0100 (CET)
Received: from localhost ([::1]:50654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXQHG-0005ak-UA
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 10:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kXPnr-0002Lx-9l; Tue, 27 Oct 2020 10:18:23 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:32777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kXPnp-0007fP-1J; Tue, 27 Oct 2020 10:18:23 -0400
Received: by mail-pg1-x542.google.com with SMTP id r186so883372pgr.0;
 Tue, 27 Oct 2020 07:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/LoqQw/Sgvn7BcQumXxtIosuzjX278w8FbRfowkpddc=;
 b=knQEvJmxDJVFasRYmotZTdMeNfmFXWJQ4Nz5jnwwwL16f/BdqkeljGusMfRrE3xZ2W
 KMmTg0B5zNTGBr/s8c6zwGgRzRP/AFRp/1gE4LPlC160tCtOqRL6v3QMO6Yv9VC5XXQL
 hyoZmjLFl2iMbvWWVpw7aLxCF0NngPA2WgPGovk5Hk+LiVjaN3uxeEG/s47HC+457K6o
 pl8oDscYZhs7Hh3RT3skVE4B5apUt690jeeGNSeV+iSijCrld6I2FjaFwtADuKpE53ys
 ndAK7NgXEXmUdTofYZdnQ0Fq1B49V+o9uLTsON3vicbs/zqY4y/R55dtgabqUkRSmvoo
 c/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/LoqQw/Sgvn7BcQumXxtIosuzjX278w8FbRfowkpddc=;
 b=nNOMqdFOfQc0vevOdfWSeTvfvajKVvZhC+3ct9K3Z8LY2Pfeaz7fBakgC41j5f+QJ9
 UAPy97DVvS32sfqbwxkFh56R6iAedn0T0Z7EcdO0259wYv+BwI2cA01hoRpz953b8oTa
 l8mx+DTcuXYa1pW+Eo1eEd6CLdEUfJLSG/2i9U+y/9nLeDF8U8tIIuHonBxEEtGpnZru
 gT5OhilJkA18TfYxB/sQ1v1OPqy/I/zj2bbM1P15PjvVwloqqQSux2k1APKZ7MLe4NJW
 wK0hwJp8SXTkQLuNrTZNZjf1qsPVZLt7uA5TiaT8MmjcSZCp/c+c1Oorq5q+7Q8bkVli
 lmFw==
X-Gm-Message-State: AOAM532o1ZDOyHFI4ed+gqQLf9ktd+EN4A5D6AVyijUUgHpluCrYObEz
 qi/Bro4t/OCyTRXsroeAK48=
X-Google-Smtp-Source: ABdhPJxFVKJEzNsCEHyLgpjrArA3l9B5X3dCqM59YhMNXfq5fNBNzRwFJNgXDeFssUVVf/YqCLpjww==
X-Received: by 2002:a63:1103:: with SMTP id g3mr2202349pgl.48.1603808299576;
 Tue, 27 Oct 2020 07:18:19 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id mn15sm1600297pjb.21.2020.10.27.07.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 07:18:18 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [RESEND PATCH 2/9] hw/riscv: microchip_pfsoc: Connect DDR memory
 controller modules
Date: Tue, 27 Oct 2020 22:17:33 +0800
Message-Id: <20201027141740.18336-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027141740.18336-1-bmeng.cn@gmail.com>
References: <20201027141740.18336-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, Atish Patra <atish.patra@wdc.com>,
 Anup Patel <anup.patel@wdc.com>, Ivan Griffin <ivan.griffin@emdalo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Connect DDR SGMII PHY module and CFG module to the PolarFire SoC.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/riscv/Kconfig                   |  1 +
 hw/riscv/microchip_pfsoc.c         | 18 ++++++++++++++++++
 include/hw/riscv/microchip_pfsoc.h |  5 +++++
 3 files changed, 24 insertions(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 2df978fe8d..c8e50bde99 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -4,6 +4,7 @@ config IBEX
 config MICROCHIP_PFSOC
     bool
     select CADENCE_SDHCI
+    select MCHP_PFSOC_DMC
     select MCHP_PFSOC_MMUART
     select MSI_NONBROKEN
     select SIFIVE_CLINT
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 4627179cd3..85be2bcde8 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -15,6 +15,7 @@
  * 4) Cadence eMMC/SDHC controller and an SD card connected to it
  * 5) SiFive Platform DMA (Direct Memory Access Controller)
  * 6) GEM (Gigabit Ethernet MAC Controller)
+ * 7) DMC (DDR Memory Controller)
  *
  * This board currently generates devicetree dynamically that indicates at least
  * two harts and up to five harts.
@@ -85,7 +86,9 @@ static const struct MemmapEntry {
     [MICROCHIP_PFSOC_MMUART0] =         { 0x20000000,     0x1000 },
     [MICROCHIP_PFSOC_SYSREG] =          { 0x20002000,     0x2000 },
     [MICROCHIP_PFSOC_MPUCFG] =          { 0x20005000,     0x1000 },
+    [MICROCHIP_PFSOC_DDR_SGMII_PHY] =   { 0x20007000,     0x1000 },
     [MICROCHIP_PFSOC_EMMC_SD] =         { 0x20008000,     0x1000 },
+    [MICROCHIP_PFSOC_DDR_CFG] =         { 0x20080000,    0x40000 },
     [MICROCHIP_PFSOC_MMUART1] =         { 0x20100000,     0x1000 },
     [MICROCHIP_PFSOC_MMUART2] =         { 0x20102000,     0x1000 },
     [MICROCHIP_PFSOC_MMUART3] =         { 0x20104000,     0x1000 },
@@ -131,6 +134,11 @@ static void microchip_pfsoc_soc_instance_init(Object *obj)
     object_initialize_child(obj, "dma-controller", &s->dma,
                             TYPE_SIFIVE_PDMA);
 
+    object_initialize_child(obj, "ddr-sgmii-phy", &s->ddr_sgmii_phy,
+                            TYPE_MCHP_PFSOC_DDR_SGMII_PHY);
+    object_initialize_child(obj, "ddr-cfg", &s->ddr_cfg,
+                            TYPE_MCHP_PFSOC_DDR_CFG);
+
     object_initialize_child(obj, "gem0", &s->gem0, TYPE_CADENCE_GEM);
     object_initialize_child(obj, "gem1", &s->gem1, TYPE_CADENCE_GEM);
 
@@ -260,6 +268,16 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
         memmap[MICROCHIP_PFSOC_MPUCFG].base,
         memmap[MICROCHIP_PFSOC_MPUCFG].size);
 
+    /* DDR SGMII PHY */
+    sysbus_realize(SYS_BUS_DEVICE(&s->ddr_sgmii_phy), errp);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ddr_sgmii_phy), 0,
+                    memmap[MICROCHIP_PFSOC_DDR_SGMII_PHY].base);
+
+    /* DDR CFG */
+    sysbus_realize(SYS_BUS_DEVICE(&s->ddr_cfg), errp);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ddr_cfg), 0,
+                    memmap[MICROCHIP_PFSOC_DDR_CFG].base);
+
     /* SDHCI */
     sysbus_realize(SYS_BUS_DEVICE(&s->sdhci), errp);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdhci), 0,
diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index 8bfc7e1a85..5b81e26241 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -24,6 +24,7 @@
 
 #include "hw/char/mchp_pfsoc_mmuart.h"
 #include "hw/dma/sifive_pdma.h"
+#include "hw/misc/mchp_pfsoc_dmc.h"
 #include "hw/net/cadence_gem.h"
 #include "hw/sd/cadence_sdhci.h"
 
@@ -37,6 +38,8 @@ typedef struct MicrochipPFSoCState {
     RISCVHartArrayState e_cpus;
     RISCVHartArrayState u_cpus;
     DeviceState *plic;
+    MchpPfSoCDdrSgmiiPhyState ddr_sgmii_phy;
+    MchpPfSoCDdrCfgState ddr_cfg;
     MchpPfSoCMMUartState *serial0;
     MchpPfSoCMMUartState *serial1;
     MchpPfSoCMMUartState *serial2;
@@ -82,7 +85,9 @@ enum {
     MICROCHIP_PFSOC_MMUART0,
     MICROCHIP_PFSOC_SYSREG,
     MICROCHIP_PFSOC_MPUCFG,
+    MICROCHIP_PFSOC_DDR_SGMII_PHY,
     MICROCHIP_PFSOC_EMMC_SD,
+    MICROCHIP_PFSOC_DDR_CFG,
     MICROCHIP_PFSOC_MMUART1,
     MICROCHIP_PFSOC_MMUART2,
     MICROCHIP_PFSOC_MMUART3,
-- 
2.25.1


