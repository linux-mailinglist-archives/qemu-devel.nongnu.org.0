Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110C05A8730
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 22:04:56 +0200 (CEST)
Received: from localhost ([::1]:36562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTxH-0005SO-2P
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 16:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSq2-0006WV-5Z; Wed, 31 Aug 2022 14:53:22 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:38867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpz-00086u-Fg; Wed, 31 Aug 2022 14:53:21 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-11edd61a9edso20220166fac.5; 
 Wed, 31 Aug 2022 11:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=VP8elE7kNDXyXBPCkEumO2Mq6KeOjbHhvJUKQlSeiTk=;
 b=GQSJWG8Ct6NCogSu+wYrk68oGPUTak+h39E1ofo75ixE67yTa2arRoMWtZwdwoB604
 9UPidjQAOcEQIWAi4pl39Ly0Wtto/sSpNrLlmwaGbz3H/QZYW4ghHryrmoKSHN2llpzh
 Q8B1Sy11/ya35iqkVpm42n9ZTay492fhyJtSIEnezKh5WjkMtvJHMXEs4ZocPdDAkzD/
 yuS8nORtf0Ic1kLhWMWu5k4qVqm1mnjT3j2RJc9BERvpeWIxPjvQnpXIHgqb810wiHbi
 UpZ+HuzOske2Whix5kFePT449UKsvXd6AJDFq+T4UZcBJW47fVTdlCQKyqvzC2NCe3Rc
 AYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VP8elE7kNDXyXBPCkEumO2Mq6KeOjbHhvJUKQlSeiTk=;
 b=gmW+Ve1J4i7RJeM8UR8erck2ZHev3ru+Pca+GgvHRoLdcmd8jyF4pYAjYWwEFLeIa3
 sKxp48o70mGSSf9OCGyRDMcA9KvTU7Yd+4a62A1kKe2xeVWyPOR7WfbaqKHAyzcAAV9V
 QY49gD4BLbD3KUfG4Ow5aaboDGrVsGFxqzk2fKRFb7RZu2qWGJ077LN+UkwpLaczr+BQ
 KTvXCCbplfXxYxU54vVSvbnfG17MC01vEtt8UafZdD8FOFChPdLbCL893ywMW+EENVKA
 XkJrNKyONBljMbo8ZJU/Z13xy/KMwukJHBcDupMf+ZABf8o7um5kl9FoU4iEKm+mNTlz
 3pqQ==
X-Gm-Message-State: ACgBeo3OAuqXGhWsq7KaAex29C9n3AkpCQJ+p/BixVc7eAA7d3e99s5F
 Uf6usFNIjfLO8QpMVPIq0MBMsGTOBSM=
X-Google-Smtp-Source: AA6agR7iE10ditsIhRuh7+45HNwgfu+tbr7Pz5Qk7b2CJkrtWJha0ayUQuTort4uR98W38kj0XV2Ig==
X-Received: by 2002:a05:6808:19a3:b0:345:d279:dd70 with SMTP id
 bj35-20020a05680819a300b00345d279dd70mr1775841oib.274.1661971998187; 
 Wed, 31 Aug 2022 11:53:18 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:53:17 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 56/60] ppc405: Move machine specific code to ppc405_boards.c
Date: Wed, 31 Aug 2022 15:50:30 -0300
Message-Id: <20220831185034.23240-57-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

These are only used by the board code so move out from the shared SoC
model and put it in the boards file.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <2b23bcaaf191f96b217cbd06a6038694024862c3.1660746880.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405.h        |  38 -----
 hw/ppc/ppc405_boards.c | 375 +++++++++++++++++++++++++++--------------
 hw/ppc/ppc405_uc.c     |  92 ----------
 3 files changed, 251 insertions(+), 254 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index efa29fdfb1..1e558c7831 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -30,41 +30,6 @@
 #include "hw/intc/ppc-uic.h"
 #include "hw/i2c/ppc4xx_i2c.h"
 
-#define PPC405EP_SDRAM_BASE 0x00000000
-#define PPC405EP_NVRAM_BASE 0xF0000000
-#define PPC405EP_FPGA_BASE  0xF0300000
-#define PPC405EP_SRAM_BASE  0xFFF00000
-#define PPC405EP_SRAM_SIZE  (512 * KiB)
-#define PPC405EP_FLASH_BASE 0xFFF80000
-
-/* Bootinfo as set-up by u-boot */
-typedef struct ppc4xx_bd_info_t ppc4xx_bd_info_t;
-struct ppc4xx_bd_info_t {
-    uint32_t bi_memstart;
-    uint32_t bi_memsize;
-    uint32_t bi_flashstart;
-    uint32_t bi_flashsize;
-    uint32_t bi_flashoffset; /* 0x10 */
-    uint32_t bi_sramstart;
-    uint32_t bi_sramsize;
-    uint32_t bi_bootflags;
-    uint32_t bi_ipaddr; /* 0x20 */
-    uint8_t  bi_enetaddr[6];
-    uint16_t bi_ethspeed;
-    uint32_t bi_intfreq;
-    uint32_t bi_busfreq; /* 0x30 */
-    uint32_t bi_baudrate;
-    uint8_t  bi_s_version[4];
-    uint8_t  bi_r_version[32];
-    uint32_t bi_procfreq;
-    uint32_t bi_plb_busfreq;
-    uint32_t bi_pci_busfreq;
-    uint8_t  bi_pci_enetaddr[6];
-    uint8_t  bi_pci_enetaddr2[6]; /* PPC405EP specific */
-    uint32_t bi_opbfreq;
-    uint32_t bi_iic_fast[2];
-};
-
 /* PLB to OPB bridge */
 #define TYPE_PPC405_POB "ppc405-pob"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PobState, PPC405_POB);
@@ -224,7 +189,4 @@ struct Ppc405SoCState {
     Ppc4xxMalState mal;
 };
 
-/* PowerPC 405 core */
-ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
-
 #endif /* PPC405_H */
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 7af0d7feef..083f12b23e 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -48,6 +48,10 @@
 #define KERNEL_LOAD_ADDR 0x01000000
 #define INITRD_LOAD_ADDR 0x01800000
 
+#define PPC405EP_SDRAM_BASE 0x00000000
+#define PPC405EP_SRAM_BASE  0xFFF00000
+#define PPC405EP_SRAM_SIZE  (512 * KiB)
+
 #define USE_FLASH_BIOS
 
 #define TYPE_PPC405_MACHINE MACHINE_TYPE_NAME("ppc405")
@@ -61,112 +65,7 @@ struct Ppc405MachineState {
     Ppc405SoCState soc;
 };
 
-/*****************************************************************************/
-/* PPC405EP reference board (IBM) */
-/* Standalone board with:
- * - PowerPC 405EP CPU
- * - SDRAM (0x00000000)
- * - Flash (0xFFF80000)
- * - SRAM  (0xFFF00000)
- * - NVRAM (0xF0000000)
- * - FPGA  (0xF0300000)
- */
-
-#define TYPE_REF405EP_FPGA "ref405ep-fpga"
-OBJECT_DECLARE_SIMPLE_TYPE(Ref405epFpgaState, REF405EP_FPGA);
-struct Ref405epFpgaState {
-    SysBusDevice parent_obj;
-
-    MemoryRegion iomem;
-
-    uint8_t reg0;
-    uint8_t reg1;
-};
-
-static uint64_t ref405ep_fpga_readb(void *opaque, hwaddr addr, unsigned size)
-{
-    Ref405epFpgaState *fpga = opaque;
-    uint32_t ret;
-
-    switch (addr) {
-    case 0x0:
-        ret = fpga->reg0;
-        break;
-    case 0x1:
-        ret = fpga->reg1;
-        break;
-    default:
-        ret = 0;
-        break;
-    }
-
-    return ret;
-}
-
-static void ref405ep_fpga_writeb(void *opaque, hwaddr addr, uint64_t value,
-                                 unsigned size)
-{
-    Ref405epFpgaState *fpga = opaque;
-
-    switch (addr) {
-    case 0x0:
-        /* Read only */
-        break;
-    case 0x1:
-        fpga->reg1 = value;
-        break;
-    default:
-        break;
-    }
-}
-
-static const MemoryRegionOps ref405ep_fpga_ops = {
-    .read = ref405ep_fpga_readb,
-    .write = ref405ep_fpga_writeb,
-    .impl.min_access_size = 1,
-    .impl.max_access_size = 1,
-    .valid.min_access_size = 1,
-    .valid.max_access_size = 4,
-    .endianness = DEVICE_BIG_ENDIAN,
-};
-
-static void ref405ep_fpga_reset(DeviceState *dev)
-{
-    Ref405epFpgaState *fpga = REF405EP_FPGA(dev);
-
-    fpga->reg0 = 0x00;
-    fpga->reg1 = 0x0F;
-}
-
-static void ref405ep_fpga_realize(DeviceState *dev, Error **errp)
-{
-    Ref405epFpgaState *s = REF405EP_FPGA(dev);
-
-    memory_region_init_io(&s->iomem, OBJECT(s), &ref405ep_fpga_ops, s,
-                          "fpga", 0x00000100);
-    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
-}
-
-static void ref405ep_fpga_class_init(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-
-    dc->realize = ref405ep_fpga_realize;
-    dc->reset = ref405ep_fpga_reset;
-    /* Reason: only works as part of a ppc405 board */
-    dc->user_creatable = false;
-}
-
-static const TypeInfo ref405ep_fpga_type = {
-    .name = TYPE_REF405EP_FPGA,
-    .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(Ref405epFpgaState),
-    .class_init = ref405ep_fpga_class_init,
-};
-
-/*
- * CPU reset handler when booting directly from a loaded kernel
- */
+/* CPU reset handler when booting directly from a loaded kernel */
 static struct boot_info {
     uint32_t entry;
     uint32_t bdloc;
@@ -197,6 +96,126 @@ static void main_cpu_reset(void *opaque)
     env->nip = bi->entry;
 }
 
+/* Bootinfo as set-up by u-boot */
+typedef struct {
+    uint32_t bi_memstart;
+    uint32_t bi_memsize;
+    uint32_t bi_flashstart;
+    uint32_t bi_flashsize;
+    uint32_t bi_flashoffset; /* 0x10 */
+    uint32_t bi_sramstart;
+    uint32_t bi_sramsize;
+    uint32_t bi_bootflags;
+    uint32_t bi_ipaddr; /* 0x20 */
+    uint8_t  bi_enetaddr[6];
+    uint16_t bi_ethspeed;
+    uint32_t bi_intfreq;
+    uint32_t bi_busfreq; /* 0x30 */
+    uint32_t bi_baudrate;
+    uint8_t  bi_s_version[4];
+    uint8_t  bi_r_version[32];
+    uint32_t bi_procfreq;
+    uint32_t bi_plb_busfreq;
+    uint32_t bi_pci_busfreq;
+    uint8_t  bi_pci_enetaddr[6];
+    uint8_t  bi_pci_enetaddr2[6]; /* PPC405EP specific */
+    uint32_t bi_opbfreq;
+    uint32_t bi_iic_fast[2];
+} ppc4xx_bd_info_t;
+
+static void ppc405_set_default_bootinfo(ppc4xx_bd_info_t *bd,
+                                        ram_addr_t ram_size)
+{
+        memset(bd, 0, sizeof(*bd));
+
+        bd->bi_memstart = PPC405EP_SDRAM_BASE;
+        bd->bi_memsize = ram_size;
+        bd->bi_sramstart = PPC405EP_SRAM_BASE;
+        bd->bi_sramsize = PPC405EP_SRAM_SIZE;
+        bd->bi_bootflags = 0;
+        bd->bi_intfreq = 133333333;
+        bd->bi_busfreq = 33333333;
+        bd->bi_baudrate = 115200;
+        bd->bi_s_version[0] = 'Q';
+        bd->bi_s_version[1] = 'M';
+        bd->bi_s_version[2] = 'U';
+        bd->bi_s_version[3] = '\0';
+        bd->bi_r_version[0] = 'Q';
+        bd->bi_r_version[1] = 'E';
+        bd->bi_r_version[2] = 'M';
+        bd->bi_r_version[3] = 'U';
+        bd->bi_r_version[4] = '\0';
+        bd->bi_procfreq = 133333333;
+        bd->bi_plb_busfreq = 33333333;
+        bd->bi_pci_busfreq = 33333333;
+        bd->bi_opbfreq = 33333333;
+}
+
+static ram_addr_t __ppc405_set_bootinfo(CPUPPCState *env, ppc4xx_bd_info_t *bd)
+{
+    CPUState *cs = env_cpu(env);
+    ram_addr_t bdloc;
+    int i, n;
+
+    /* We put the bd structure at the top of memory */
+    if (bd->bi_memsize >= 0x01000000UL) {
+        bdloc = 0x01000000UL - sizeof(ppc4xx_bd_info_t);
+    } else {
+        bdloc = bd->bi_memsize - sizeof(ppc4xx_bd_info_t);
+    }
+    stl_be_phys(cs->as, bdloc + 0x00, bd->bi_memstart);
+    stl_be_phys(cs->as, bdloc + 0x04, bd->bi_memsize);
+    stl_be_phys(cs->as, bdloc + 0x08, bd->bi_flashstart);
+    stl_be_phys(cs->as, bdloc + 0x0C, bd->bi_flashsize);
+    stl_be_phys(cs->as, bdloc + 0x10, bd->bi_flashoffset);
+    stl_be_phys(cs->as, bdloc + 0x14, bd->bi_sramstart);
+    stl_be_phys(cs->as, bdloc + 0x18, bd->bi_sramsize);
+    stl_be_phys(cs->as, bdloc + 0x1C, bd->bi_bootflags);
+    stl_be_phys(cs->as, bdloc + 0x20, bd->bi_ipaddr);
+    for (i = 0; i < 6; i++) {
+        stb_phys(cs->as, bdloc + 0x24 + i, bd->bi_enetaddr[i]);
+    }
+    stw_be_phys(cs->as, bdloc + 0x2A, bd->bi_ethspeed);
+    stl_be_phys(cs->as, bdloc + 0x2C, bd->bi_intfreq);
+    stl_be_phys(cs->as, bdloc + 0x30, bd->bi_busfreq);
+    stl_be_phys(cs->as, bdloc + 0x34, bd->bi_baudrate);
+    for (i = 0; i < 4; i++) {
+        stb_phys(cs->as, bdloc + 0x38 + i, bd->bi_s_version[i]);
+    }
+    for (i = 0; i < 32; i++) {
+        stb_phys(cs->as, bdloc + 0x3C + i, bd->bi_r_version[i]);
+    }
+    stl_be_phys(cs->as, bdloc + 0x5C, bd->bi_procfreq);
+    stl_be_phys(cs->as, bdloc + 0x60, bd->bi_plb_busfreq);
+    stl_be_phys(cs->as, bdloc + 0x64, bd->bi_pci_busfreq);
+    for (i = 0; i < 6; i++) {
+        stb_phys(cs->as, bdloc + 0x68 + i, bd->bi_pci_enetaddr[i]);
+    }
+    n = 0x70; /* includes 2 bytes hole */
+    for (i = 0; i < 6; i++) {
+        stb_phys(cs->as, bdloc + n++, bd->bi_pci_enetaddr2[i]);
+    }
+    stl_be_phys(cs->as, bdloc + n, bd->bi_opbfreq);
+    n += 4;
+    for (i = 0; i < 2; i++) {
+        stl_be_phys(cs->as, bdloc + n, bd->bi_iic_fast[i]);
+        n += 4;
+    }
+
+    return bdloc;
+}
+
+static ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size)
+{
+    ppc4xx_bd_info_t bd;
+
+    memset(&bd, 0, sizeof(bd));
+
+    ppc405_set_default_bootinfo(&bd, ram_size);
+
+    return __ppc405_set_bootinfo(env, &bd);
+}
+
 static void boot_from_kernel(MachineState *machine, PowerPCCPU *cpu)
 {
     CPUPPCState *env = &cpu->env;
@@ -334,6 +353,132 @@ static void ppc405_init(MachineState *machine)
     }
 }
 
+static void ppc405_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "PPC405 generic machine";
+    mc->init = ppc405_init;
+    mc->default_ram_size = 128 * MiB;
+    mc->default_ram_id = "ppc405.ram";
+}
+
+static const TypeInfo ppc405_machine_type = {
+    .name = TYPE_PPC405_MACHINE,
+    .parent = TYPE_MACHINE,
+    .instance_size = sizeof(Ppc405MachineState),
+    .class_init = ppc405_machine_class_init,
+    .abstract = true,
+};
+
+/*****************************************************************************/
+/* PPC405EP reference board (IBM) */
+/*
+ * Standalone board with:
+ * - PowerPC 405EP CPU
+ * - SDRAM (0x00000000)
+ * - Flash (0xFFF80000)
+ * - SRAM  (0xFFF00000)
+ * - NVRAM (0xF0000000)
+ * - FPGA  (0xF0300000)
+ */
+
+#define PPC405EP_NVRAM_BASE 0xF0000000
+#define PPC405EP_FPGA_BASE  0xF0300000
+#define PPC405EP_FLASH_BASE 0xFFF80000
+
+#define TYPE_REF405EP_FPGA "ref405ep-fpga"
+OBJECT_DECLARE_SIMPLE_TYPE(Ref405epFpgaState, REF405EP_FPGA);
+struct Ref405epFpgaState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+
+    uint8_t reg0;
+    uint8_t reg1;
+};
+
+static uint64_t ref405ep_fpga_readb(void *opaque, hwaddr addr, unsigned size)
+{
+    Ref405epFpgaState *fpga = opaque;
+    uint32_t ret;
+
+    switch (addr) {
+    case 0x0:
+        ret = fpga->reg0;
+        break;
+    case 0x1:
+        ret = fpga->reg1;
+        break;
+    default:
+        ret = 0;
+        break;
+    }
+
+    return ret;
+}
+
+static void ref405ep_fpga_writeb(void *opaque, hwaddr addr, uint64_t value,
+                                 unsigned size)
+{
+    Ref405epFpgaState *fpga = opaque;
+
+    switch (addr) {
+    case 0x0:
+        /* Read only */
+        break;
+    case 0x1:
+        fpga->reg1 = value;
+        break;
+    default:
+        break;
+    }
+}
+
+static const MemoryRegionOps ref405ep_fpga_ops = {
+    .read = ref405ep_fpga_readb,
+    .write = ref405ep_fpga_writeb,
+    .impl.min_access_size = 1,
+    .impl.max_access_size = 1,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 4,
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
+static void ref405ep_fpga_reset(DeviceState *dev)
+{
+    Ref405epFpgaState *fpga = REF405EP_FPGA(dev);
+
+    fpga->reg0 = 0x00;
+    fpga->reg1 = 0x0F;
+}
+
+static void ref405ep_fpga_realize(DeviceState *dev, Error **errp)
+{
+    Ref405epFpgaState *s = REF405EP_FPGA(dev);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &ref405ep_fpga_ops, s,
+                          "fpga", 0x00000100);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+}
+
+static void ref405ep_fpga_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ref405ep_fpga_realize;
+    dc->reset = ref405ep_fpga_reset;
+    /* Reason: only works as part of a ppc405 board */
+    dc->user_creatable = false;
+}
+
+static const TypeInfo ref405ep_fpga_type = {
+    .name = TYPE_REF405EP_FPGA,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(Ref405epFpgaState),
+    .class_init = ref405ep_fpga_class_init,
+};
+
 static void ref405ep_init(MachineState *machine)
 {
     DeviceState *dev;
@@ -375,24 +520,6 @@ static const TypeInfo ref405ep_type = {
     .class_init = ref405ep_class_init,
 };
 
-static void ppc405_machine_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-
-    mc->desc = "PPC405 generic machine";
-    mc->init = ppc405_init;
-    mc->default_ram_size = 128 * MiB;
-    mc->default_ram_id = "ppc405.ram";
-}
-
-static const TypeInfo ppc405_machine_type = {
-    .name = TYPE_PPC405_MACHINE,
-    .parent = TYPE_MACHINE,
-    .instance_size = sizeof(Ppc405MachineState),
-    .class_init = ppc405_machine_class_init,
-    .abstract = true,
-};
-
 static void ppc405_machine_init(void)
 {
     type_register_static(&ppc405_machine_type);
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 189f49a138..74d27250a7 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -42,98 +42,6 @@
 #include "qapi/error.h"
 #include "trace.h"
 
-static void ppc405_set_default_bootinfo(ppc4xx_bd_info_t *bd,
-                                        ram_addr_t ram_size)
-{
-        memset(bd, 0, sizeof(*bd));
-
-        bd->bi_memstart = PPC405EP_SDRAM_BASE;
-        bd->bi_memsize = ram_size;
-        bd->bi_sramstart = PPC405EP_SRAM_BASE;
-        bd->bi_sramsize = PPC405EP_SRAM_SIZE;
-        bd->bi_bootflags = 0;
-        bd->bi_intfreq = 133333333;
-        bd->bi_busfreq = 33333333;
-        bd->bi_baudrate = 115200;
-        bd->bi_s_version[0] = 'Q';
-        bd->bi_s_version[1] = 'M';
-        bd->bi_s_version[2] = 'U';
-        bd->bi_s_version[3] = '\0';
-        bd->bi_r_version[0] = 'Q';
-        bd->bi_r_version[1] = 'E';
-        bd->bi_r_version[2] = 'M';
-        bd->bi_r_version[3] = 'U';
-        bd->bi_r_version[4] = '\0';
-        bd->bi_procfreq = 133333333;
-        bd->bi_plb_busfreq = 33333333;
-        bd->bi_pci_busfreq = 33333333;
-        bd->bi_opbfreq = 33333333;
-}
-
-static ram_addr_t __ppc405_set_bootinfo(CPUPPCState *env, ppc4xx_bd_info_t *bd)
-{
-    CPUState *cs = env_cpu(env);
-    ram_addr_t bdloc;
-    int i, n;
-
-    /* We put the bd structure at the top of memory */
-    if (bd->bi_memsize >= 0x01000000UL)
-        bdloc = 0x01000000UL - sizeof(struct ppc4xx_bd_info_t);
-    else
-        bdloc = bd->bi_memsize - sizeof(struct ppc4xx_bd_info_t);
-    stl_be_phys(cs->as, bdloc + 0x00, bd->bi_memstart);
-    stl_be_phys(cs->as, bdloc + 0x04, bd->bi_memsize);
-    stl_be_phys(cs->as, bdloc + 0x08, bd->bi_flashstart);
-    stl_be_phys(cs->as, bdloc + 0x0C, bd->bi_flashsize);
-    stl_be_phys(cs->as, bdloc + 0x10, bd->bi_flashoffset);
-    stl_be_phys(cs->as, bdloc + 0x14, bd->bi_sramstart);
-    stl_be_phys(cs->as, bdloc + 0x18, bd->bi_sramsize);
-    stl_be_phys(cs->as, bdloc + 0x1C, bd->bi_bootflags);
-    stl_be_phys(cs->as, bdloc + 0x20, bd->bi_ipaddr);
-    for (i = 0; i < 6; i++) {
-        stb_phys(cs->as, bdloc + 0x24 + i, bd->bi_enetaddr[i]);
-    }
-    stw_be_phys(cs->as, bdloc + 0x2A, bd->bi_ethspeed);
-    stl_be_phys(cs->as, bdloc + 0x2C, bd->bi_intfreq);
-    stl_be_phys(cs->as, bdloc + 0x30, bd->bi_busfreq);
-    stl_be_phys(cs->as, bdloc + 0x34, bd->bi_baudrate);
-    for (i = 0; i < 4; i++) {
-        stb_phys(cs->as, bdloc + 0x38 + i, bd->bi_s_version[i]);
-    }
-    for (i = 0; i < 32; i++) {
-        stb_phys(cs->as, bdloc + 0x3C + i, bd->bi_r_version[i]);
-    }
-    stl_be_phys(cs->as, bdloc + 0x5C, bd->bi_procfreq);
-    stl_be_phys(cs->as, bdloc + 0x60, bd->bi_plb_busfreq);
-    stl_be_phys(cs->as, bdloc + 0x64, bd->bi_pci_busfreq);
-    for (i = 0; i < 6; i++) {
-        stb_phys(cs->as, bdloc + 0x68 + i, bd->bi_pci_enetaddr[i]);
-    }
-    n = 0x70; /* includes 2 bytes hole */
-    for (i = 0; i < 6; i++) {
-        stb_phys(cs->as, bdloc + n++, bd->bi_pci_enetaddr2[i]);
-    }
-    stl_be_phys(cs->as, bdloc + n, bd->bi_opbfreq);
-    n += 4;
-    for (i = 0; i < 2; i++) {
-        stl_be_phys(cs->as, bdloc + n, bd->bi_iic_fast[i]);
-        n += 4;
-    }
-
-    return bdloc;
-}
-
-ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size)
-{
-    ppc4xx_bd_info_t bd;
-
-    memset(&bd, 0, sizeof(bd));
-
-    ppc405_set_default_bootinfo(&bd, ram_size);
-
-    return __ppc405_set_bootinfo(env, &bd);
-}
-
 /*****************************************************************************/
 /* Shared peripherals */
 
-- 
2.37.2


