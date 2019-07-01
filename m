Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF842A51F
	for <lists+qemu-devel@lfdr.de>; Sat, 25 May 2019 17:35:48 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43503 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUYi3-0002PD-Ut
	for lists+qemu-devel@lfdr.de; Sat, 25 May 2019 11:35:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYdt-0007m2-Qp
	for qemu-devel@nongnu.org; Sat, 25 May 2019 11:31:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYNn-00037P-QE
	for qemu-devel@nongnu.org; Sat, 25 May 2019 11:14:53 -0400
Received: from 1.mo179.mail-out.ovh.net ([178.33.111.220]:34930)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hUYNm-00031d-30
	for qemu-devel@nongnu.org; Sat, 25 May 2019 11:14:50 -0400
Received: from player698.ha.ovh.net (unknown [10.109.143.183])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id BB976130F06
	for <qemu-devel@nongnu.org>; Sat, 25 May 2019 17:14:42 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player698.ha.ovh.net (Postfix) with ESMTPSA id 392F3625A89B;
	Sat, 25 May 2019 15:14:36 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 May 2019 17:12:38 +0200
Message-Id: <20190525151241.5017-17-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525151241.5017-1-clg@kaod.org>
References: <20190525151241.5017-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6620854403963849489
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddukedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.111.220
Subject: [Qemu-devel] [PATCH 16/19] aspeed/smc: add support for DMAs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The FMC controller on the Aspeed SoCs support DMA to access the flash
modules. It can operate in a normal mode, to copy to or from the flash
module mapping window, or in a checksum calculation mode, to evaluate
the best clock settings for reads.

The model introduces two custom address spaces for DMAs: one for the
AHB window of the FMC flash devices and one for the DRAM. The latter
is populated using a "dram" link set from the machine with the RAM
container region.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |   6 +
 hw/arm/aspeed.c             |   2 +
 hw/arm/aspeed_soc.c         |   2 +
 hw/ssi/aspeed_smc.c         | 228 +++++++++++++++++++++++++++++++++++-
 4 files changed, 232 insertions(+), 6 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 591279ba1f43..453357cc09bf 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -45,6 +45,8 @@ typedef struct AspeedSMCController {
     hwaddr flash_window_base;
     uint32_t flash_window_size;
     bool has_dma;
+    hwaddr dma_flash_mask;
+    hwaddr dma_dram_mask;
     uint32_t nregs;
 } AspeedSMCController;
=20
@@ -100,6 +102,10 @@ typedef struct AspeedSMCState {
     /* for DMA support */
     uint64_t sdram_base;
=20
+    AddressSpace flash_as;
+    MemoryRegion *dram_mr;
+    AddressSpace dram_as;
+
     AspeedSMCFlash *flashes;
=20
     uint8_t snoop_index;
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index ed5c8dd5133a..f1722ee04ac9 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -176,6 +176,8 @@ static void aspeed_board_init(MachineState *machine,
                             &error_abort);
     object_property_set_int(OBJECT(&bmc->soc), cfg->num_cs, "num-cs",
                             &error_abort);
+    object_property_set_link(OBJECT(&bmc->soc), OBJECT(&bmc->ram_contain=
er),
+                             "dram", &error_abort);
     if (machine->kernel_filename) {
         /*
          * When booting with a -kernel command line there is no u-boot
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 65fbac896c85..16508f1e1844 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -207,6 +207,8 @@ static void aspeed_soc_init(Object *obj)
                           sc->info->fmc_typename);
     object_property_add_alias(obj, "num-cs", OBJECT(&s->fmc), "num-cs",
                               &error_abort);
+    object_property_add_alias(obj, "dram", OBJECT(&s->fmc), "dram",
+                              &error_abort);
=20
     for (i =3D 0; i < sc->info->spis_num; i++) {
         sysbus_init_child_obj(obj, "spi[*]", OBJECT(&s->spi[i]),
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 4ff12f7b27fc..b3c8e0a84f8b 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -23,10 +23,12 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
 #include "qemu/log.h"
 #include "qemu/error-report.h"
+#include "exec/address-spaces.h"
=20
 #include "hw/ssi/aspeed_smc.h"
=20
@@ -109,8 +111,8 @@
 #define   DMA_CTRL_FREQ_SHIFT   4
 #define   DMA_CTRL_MODE         (1 << 3)
 #define   DMA_CTRL_CKSUM        (1 << 2)
-#define   DMA_CTRL_DIR          (1 << 1)
-#define   DMA_CTRL_EN           (1 << 0)
+#define   DMA_CTRL_WRITE        (1 << 1)
+#define   DMA_CTRL_ENABLE       (1 << 0)
=20
 /* DMA Flash Side Address */
 #define R_DMA_FLASH_ADDR  (0x84 / 4)
@@ -142,6 +144,24 @@
 #define ASPEED_SOC_SPI_FLASH_BASE   0x30000000
 #define ASPEED_SOC_SPI2_FLASH_BASE  0x38000000
=20
+/*
+ * DMA DRAM addresses should be 4 bytes aligned and the valid address
+ * range is 0x40000000 - 0x5FFFFFFF (AST2400)
+ *          0x80000000 - 0xBFFFFFFF (AST2500)
+ *
+ * DMA flash addresses should be 4 bytes aligned and the valid address
+ * range is 0x20000000 - 0x2FFFFFFF.
+ *
+ * DMA length is from 4 bytes to 32MB
+ *   0: 4 bytes
+ *   0x7FFFFF: 32M bytes
+ */
+#define DMA_DRAM_ADDR(s, val)   ((s)->sdram_base | \
+                                 ((val) & (s)->ctrl->dma_dram_mask))
+#define DMA_FLASH_ADDR(s, val)  ((s)->ctrl->flash_window_base | \
+                                ((val) & (s)->ctrl->dma_flash_mask))
+#define DMA_LENGTH(val)         ((val) & 0x01FFFFFC)
+
 /* Flash opcodes. */
 #define SPI_OP_READ       0x03    /* Read data bytes (low frequency) */
=20
@@ -211,6 +231,8 @@ static const AspeedSMCController controllers[] =3D {
         .flash_window_base =3D ASPEED_SOC_FMC_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
         .has_dma           =3D true,
+        .dma_flash_mask    =3D 0x0FFFFFFC,
+        .dma_dram_mask     =3D 0x1FFFFFFC,
         .nregs             =3D ASPEED_SMC_R_MAX,
     }, {
         .name              =3D "aspeed.smc.spi",
@@ -237,6 +259,8 @@ static const AspeedSMCController controllers[] =3D {
         .flash_window_base =3D ASPEED_SOC_FMC_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
         .has_dma           =3D true,
+        .dma_flash_mask    =3D 0x0FFFFFFC,
+        .dma_dram_mask     =3D 0x3FFFFFFC,
         .nregs             =3D ASPEED_SMC_R_MAX,
     }, {
         .name              =3D "aspeed.smc.ast2500-spi1",
@@ -729,9 +753,6 @@ static void aspeed_smc_reset(DeviceState *d)
=20
     memset(s->regs, 0, sizeof s->regs);
=20
-    /* Pretend DMA is done (u-boot initialization) */
-    s->regs[R_INTR_CTRL] =3D INTR_CTRL_DMA_STATUS;
-
     /* Unselect all slaves */
     for (i =3D 0; i < s->num_cs; ++i) {
         s->regs[s->r_ctrl0 + i] |=3D CTRL_CE_STOP_ACTIVE;
@@ -772,6 +793,11 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr=
 addr, unsigned int size)
         addr =3D=3D s->r_ce_ctrl ||
         addr =3D=3D R_INTR_CTRL ||
         addr =3D=3D R_DUMMY_DATA ||
+        (s->ctrl->has_dma && addr =3D=3D R_DMA_CTRL) ||
+        (s->ctrl->has_dma && addr =3D=3D R_DMA_FLASH_ADDR) ||
+        (s->ctrl->has_dma && addr =3D=3D R_DMA_DRAM_ADDR) ||
+        (s->ctrl->has_dma && addr =3D=3D R_DMA_LEN) ||
+        (s->ctrl->has_dma && addr =3D=3D R_DMA_CHECKSUM) ||
         (addr >=3D R_SEG_ADDR0 && addr < R_SEG_ADDR0 + s->ctrl->max_slav=
es) ||
         (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->ctrl->max_slaves=
)) {
         return s->regs[addr];
@@ -782,6 +808,155 @@ static uint64_t aspeed_smc_read(void *opaque, hwadd=
r addr, unsigned int size)
     }
 }
=20
+/*
+ * Accumulate the result of the reads to provide a checksum that will
+ * be used to validate the read timing settings.
+ */
+static void aspeed_smc_dma_checksum(AspeedSMCState *s)
+{
+    MemTxResult result;
+    uint32_t data;
+
+    if (s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid direction for DMA checksum\n",  __fun=
c__);
+        return;
+    }
+
+    while (s->regs[R_DMA_LEN]) {
+        result =3D address_space_read(&s->flash_as, s->regs[R_DMA_FLASH_=
ADDR],
+                                    MEMTXATTRS_UNSPECIFIED,
+                                    (uint8_t *)&data, 4);
+        if (result !=3D MEMTX_OK) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Flash read failed @%08x\=
n",
+                          __func__, s->regs[R_DMA_FLASH_ADDR]);
+            return;
+        }
+
+        /*
+         * When the DMA is on-going, the DMA registers are updated
+         * with the current working addresses and length.
+         */
+        s->regs[R_DMA_CHECKSUM] +=3D data;
+        s->regs[R_DMA_FLASH_ADDR] +=3D 4;
+        s->regs[R_DMA_LEN] -=3D 4;
+    }
+}
+
+static void aspeed_smc_dma_rw(AspeedSMCState *s)
+{
+    MemTxResult result;
+    uint32_t data;
+
+    while (s->regs[R_DMA_LEN]) {
+        if (s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE) {
+            result =3D address_space_read(&s->dram_as, s->regs[R_DMA_DRA=
M_ADDR],
+                                        MEMTXATTRS_UNSPECIFIED,
+                                        (uint8_t *)&data, 4);
+            if (result !=3D MEMTX_OK) {
+                qemu_log_mask(LOG_GUEST_ERROR, "%s: DRAM read failed @%0=
8x\n",
+                              __func__, s->regs[R_DMA_DRAM_ADDR]);
+                return;
+            }
+
+            result =3D address_space_write(&s->flash_as,
+                                         s->regs[R_DMA_FLASH_ADDR],
+                                         MEMTXATTRS_UNSPECIFIED,
+                                         (uint8_t *)&data, 4);
+            if (result !=3D MEMTX_OK) {
+                qemu_log_mask(LOG_GUEST_ERROR, "%s: Flash write failed @=
%08x\n",
+                              __func__, s->regs[R_DMA_FLASH_ADDR]);
+                return;
+            }
+        } else {
+            result =3D address_space_read(&s->flash_as, s->regs[R_DMA_FL=
ASH_ADDR],
+                                        MEMTXATTRS_UNSPECIFIED,
+                                        (uint8_t *)&data, 4);
+            if (result !=3D MEMTX_OK) {
+                qemu_log_mask(LOG_GUEST_ERROR, "%s: Flash read failed @%=
08x\n",
+                              __func__, s->regs[R_DMA_FLASH_ADDR]);
+                return;
+            }
+
+            result =3D address_space_write(&s->dram_as, s->regs[R_DMA_DR=
AM_ADDR],
+                                         MEMTXATTRS_UNSPECIFIED,
+                                         (uint8_t *)&data, 4);
+            if (result !=3D MEMTX_OK) {
+                qemu_log_mask(LOG_GUEST_ERROR, "%s: DRAM write failed @%=
08x\n",
+                              __func__, s->regs[R_DMA_DRAM_ADDR]);
+                return;
+            }
+        }
+
+        /*
+         * When the DMA is on-going, the DMA registers are updated
+         * with the current working addresses and length.
+         */
+        s->regs[R_DMA_FLASH_ADDR] +=3D 4;
+        s->regs[R_DMA_DRAM_ADDR] +=3D 4;
+        s->regs[R_DMA_LEN] -=3D 4;
+    }
+}
+
+static void aspeed_smc_dma_stop(AspeedSMCState *s)
+{
+    /*
+     * When the DMA is disabled, INTR_CTRL_DMA_STATUS=3D0 means the
+     * engine is idle
+     */
+    s->regs[R_INTR_CTRL] &=3D ~INTR_CTRL_DMA_STATUS;
+    s->regs[R_DMA_CHECKSUM] =3D 0;
+
+    /*
+     * Lower the DMA irq in any case. The IRQ control register could
+     * have been cleared before disabling the DMA.
+     */
+    qemu_irq_lower(s->irq);
+}
+
+/*
+ * When INTR_CTRL_DMA_STATUS=3D1, the DMA has completed and a new DMA
+ * can start even if the result of the previous was not collected.
+ */
+static bool aspeed_smc_dma_in_progress(AspeedSMCState *s)
+{
+    return s->regs[R_DMA_CTRL] & DMA_CTRL_ENABLE &&
+        !(s->regs[R_INTR_CTRL] & INTR_CTRL_DMA_STATUS);
+}
+
+static void aspeed_smc_dma_done(AspeedSMCState *s)
+{
+    s->regs[R_INTR_CTRL] |=3D INTR_CTRL_DMA_STATUS;
+    if (s->regs[R_INTR_CTRL] & INTR_CTRL_DMA_EN) {
+        qemu_irq_raise(s->irq);
+    }
+}
+
+static void aspeed_smc_dma_ctrl(AspeedSMCState *s, uint64_t dma_ctrl)
+{
+    if (!(dma_ctrl & DMA_CTRL_ENABLE)) {
+        s->regs[R_DMA_CTRL] =3D dma_ctrl;
+
+        aspeed_smc_dma_stop(s);
+        return;
+    }
+
+    if (aspeed_smc_dma_in_progress(s)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA in progress\n",  __func_=
_);
+        return;
+    }
+
+    s->regs[R_DMA_CTRL] =3D dma_ctrl;
+
+    if (s->regs[R_DMA_CTRL] & DMA_CTRL_CKSUM) {
+        aspeed_smc_dma_checksum(s);
+    } else {
+        aspeed_smc_dma_rw(s);
+    }
+
+    aspeed_smc_dma_done(s);
+}
+
 static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
                              unsigned int size)
 {
@@ -807,6 +982,16 @@ static void aspeed_smc_write(void *opaque, hwaddr ad=
dr, uint64_t data,
         }
     } else if (addr =3D=3D R_DUMMY_DATA) {
         s->regs[addr] =3D value & 0xff;
+    } else if (addr =3D=3D R_INTR_CTRL) {
+        s->regs[addr] =3D value;
+    } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_CTRL) {
+        aspeed_smc_dma_ctrl(s, value);
+    } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_DRAM_ADDR) {
+        s->regs[addr] =3D DMA_DRAM_ADDR(s, value);
+    } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_FLASH_ADDR) {
+        s->regs[addr] =3D DMA_FLASH_ADDR(s, value);
+    } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_LEN) {
+        s->regs[addr] =3D DMA_LENGTH(value);
     } else {
         qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx =
"\n",
                       __func__, addr);
@@ -821,6 +1006,28 @@ static const MemoryRegionOps aspeed_smc_ops =3D {
     .valid.unaligned =3D true,
 };
=20
+
+/*
+ * Initialize the custom address spaces for DMAs
+ */
+static void aspeed_smc_dma_setup(AspeedSMCState *s, Error **errp)
+{
+    char *name;
+
+    if (!s->dram_mr) {
+        error_setg(errp, TYPE_ASPEED_SMC ": 'dram' link not set");
+        return;
+    }
+
+    name =3D g_strdup_printf("%s-dma-flash", s->ctrl->name);
+    address_space_init(&s->flash_as, &s->mmio_flash, name);
+    g_free(name);
+
+    name =3D g_strdup_printf("%s-dma-dram", s->ctrl->name);
+    address_space_init(&s->dram_as, s->dram_mr, name);
+    g_free(name);
+}
+
 static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
@@ -846,10 +1053,12 @@ static void aspeed_smc_realize(DeviceState *dev, E=
rror **errp)
         s->num_cs =3D s->ctrl->max_slaves;
     }
=20
+    /* DMA irq. Keep it first for the initialization in the SoC */
+    sysbus_init_irq(sbd, &s->irq);
+
     s->spi =3D ssi_create_bus(dev, "spi");
=20
     /* Setup cs_lines for slaves */
-    sysbus_init_irq(sbd, &s->irq);
     s->cs_lines =3D g_new0(qemu_irq, s->num_cs);
     ssi_auto_connect_slaves(dev, s->cs_lines, s->spi);
=20
@@ -896,6 +1105,11 @@ static void aspeed_smc_realize(DeviceState *dev, Er=
ror **errp)
         memory_region_add_subregion(&s->mmio_flash, offset, &fl->mmio);
         offset +=3D fl->size;
     }
+
+    /* DMA support */
+    if (s->ctrl->has_dma) {
+        aspeed_smc_dma_setup(s, errp);
+    }
 }
=20
 static const VMStateDescription vmstate_aspeed_smc =3D {
@@ -913,6 +1127,8 @@ static const VMStateDescription vmstate_aspeed_smc =3D=
 {
 static Property aspeed_smc_properties[] =3D {
     DEFINE_PROP_UINT32("num-cs", AspeedSMCState, num_cs, 1),
     DEFINE_PROP_UINT64("sdram-base", AspeedSMCState, sdram_base, 0),
+    DEFINE_PROP_LINK("dram", AspeedSMCState, dram_mr,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
--=20
2.20.1


