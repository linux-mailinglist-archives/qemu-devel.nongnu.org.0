Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC2442133A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 17:58:03 +0200 (CEST)
Received: from localhost ([::1]:40470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXQLq-0003x3-7Y
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 11:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mXQB3-0001Ib-Lj; Mon, 04 Oct 2021 11:46:53 -0400
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:59343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mXQAy-0001D9-Qj; Mon, 04 Oct 2021 11:46:53 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.17])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 9C4DB21C58;
 Mon,  4 Oct 2021 15:46:38 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 4 Oct
 2021 17:46:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002e0362ea3-083a-467b-ae6f-e00aaf0091e8,
 32296DFA07ABF8CFA5B750E6C0B5925FEAD98EF4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 4/4] aspeed/smc: Improve support for the alternate boot
 function
Date: Mon, 4 Oct 2021 17:46:35 +0200
Message-ID: <20211004154635.394258-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004154635.394258-1-clg@kaod.org>
References: <20211004154635.394258-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 582b18ef-cded-48e6-97e6-9a46087718dd
X-Ovh-Tracer-Id: 2440388051409275753
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudelvddgledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Map the WDT2 registers in the AST2600 FMC memory region by creating a
local address space on top of WDT2 memory region.

The model only implements the enable bit of the control register. The
reload register uses a 0.1s unit instead of a 1us. Values are
converted on the fly when doing the accesses. The restart register is
the same.

Cc: Peter Delevoryas <pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  3 ++
 hw/arm/aspeed_ast2600.c     |  2 +
 hw/ssi/aspeed_smc.c         | 78 ++++++++++++++++++++++++++++++++++++-
 hw/ssi/trace-events         |  1 +
 4 files changed, 82 insertions(+), 2 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 75bc793bd269..ad3c80f2d809 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -76,6 +76,9 @@ struct AspeedSMCState {
     MemoryRegion *dram_mr;
     AddressSpace dram_as;
 
+    AddressSpace wdt2_as;
+    MemoryRegion *wdt2_mr;
+
     AspeedSMCFlash flashes[ASPEED_SMC_CS_MAX];
 
     uint8_t snoop_index;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 0384357a9510..2c53d77899a8 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -353,6 +353,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     }
 
     /* FMC, The number of CS is set at the board level */
+    object_property_set_link(OBJECT(&s->fmc), "wdt2", OBJECT(&s->wdt[2].iomem),
+                             &error_abort);
     object_property_set_link(OBJECT(&s->fmc), "dram", OBJECT(s->dram_mr),
                              &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->fmc), errp)) {
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 8a988c167604..1770985230b0 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -130,6 +130,8 @@
 #define   FMC_WDT2_CTRL_SINGLE_BOOT_MODE BIT(5)
 #define   FMC_WDT2_CTRL_BOOT_SOURCE      BIT(4) /* O: primary 1: alternate */
 #define   FMC_WDT2_CTRL_EN               BIT(0)
+#define R_FMC_WDT2_RELOAD   (0x68 / 4)
+#define R_FMC_WDT2_RESTART  (0x6C / 4)
 
 /* DMA Control/Status Register */
 #define R_DMA_CTRL        (0x80 / 4)
@@ -704,6 +706,54 @@ static void aspeed_smc_reset(DeviceState *d)
     s->snoop_dummies = 0;
 }
 
+#define ASPEED_WDT_RELOAD  0x04
+#define ASPEED_WDT_RESTART 0x08
+#define ASPEED_WDT_CTRL    0x0C
+
+static void aspeed_smc_wdt2_write(AspeedSMCState *s, uint32_t offset,
+                                  uint32_t value)
+{
+    MemTxResult result;
+
+    address_space_stl_le(&s->wdt2_as, offset, value, MEMTXATTRS_UNSPECIFIED,
+                         &result);
+    if (result != MEMTX_OK) {
+        aspeed_smc_error("WDT2 write failed @%08x", offset);
+        return;
+    }
+}
+
+static uint64_t aspeed_smc_wdt2_read(AspeedSMCState *s, uint32_t offset)
+{
+    MemTxResult result;
+    uint32_t value;
+
+    value = address_space_ldl_le(&s->wdt2_as, offset, MEMTXATTRS_UNSPECIFIED,
+                                &result);
+    if (result != MEMTX_OK) {
+        aspeed_smc_error("WDT2 read failed @%08x", offset);
+        return -1;
+    }
+    return value;
+}
+
+static void aspeed_smc_wdt2_enable(AspeedSMCState *s, bool enable)
+{
+    uint32_t value;
+
+    value = aspeed_smc_wdt2_read(s, ASPEED_WDT_CTRL);
+    if (value == -1) {
+        return;
+    }
+
+    value &= ~BIT(0);
+    value |= enable;
+
+    aspeed_smc_wdt2_write(s, ASPEED_WDT_CTRL, value);
+
+    trace_aspeed_smc_wdt2_enable(enable ? "en" : "dis");
+}
+
 static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
 {
     AspeedSMCState *s = ASPEED_SMC(opaque);
@@ -718,7 +768,6 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
         addr == R_CE_CMD_CTRL ||
         addr == R_INTR_CTRL ||
         addr == R_DUMMY_DATA ||
-        (aspeed_smc_has_wdt_control(asc) && addr == R_FMC_WDT2_CTRL) ||
         (aspeed_smc_has_dma(asc) && addr == R_DMA_CTRL) ||
         (aspeed_smc_has_dma(asc) && addr == R_DMA_FLASH_ADDR) ||
         (aspeed_smc_has_dma(asc) && addr == R_DMA_DRAM_ADDR) ||
@@ -731,6 +780,10 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
         trace_aspeed_smc_read(addr << 2, size, s->regs[addr]);
 
         return s->regs[addr];
+    } else if (aspeed_smc_has_wdt_control(asc) && addr == R_FMC_WDT2_CTRL) {
+        return aspeed_smc_wdt2_read(s, ASPEED_WDT_CTRL);
+    } else if (aspeed_smc_has_wdt_control(asc) && addr == R_FMC_WDT2_RELOAD) {
+        return aspeed_smc_wdt2_read(s, ASPEED_WDT_RELOAD) / 100000;
     } else {
         qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx "\n",
                       __func__, addr);
@@ -1053,7 +1106,11 @@ static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
     } else if (addr == R_DUMMY_DATA) {
         s->regs[addr] = value & 0xff;
     } else if (aspeed_smc_has_wdt_control(asc) && addr == R_FMC_WDT2_CTRL) {
-        s->regs[addr] = value & FMC_WDT2_CTRL_EN;
+        aspeed_smc_wdt2_enable(s, !!(value & FMC_WDT2_CTRL_EN));
+    } else if (aspeed_smc_has_wdt_control(asc) && addr == R_FMC_WDT2_RELOAD) {
+        aspeed_smc_wdt2_write(s, ASPEED_WDT_RELOAD, value * 100000);
+    } else if (aspeed_smc_has_wdt_control(asc) && addr == R_FMC_WDT2_RESTART) {
+        aspeed_smc_wdt2_write(s, ASPEED_WDT_RESTART, value);
     } else if (addr == R_INTR_CTRL) {
         s->regs[addr] = value;
     } else if (aspeed_smc_has_dma(asc) && addr == R_DMA_CTRL) {
@@ -1108,6 +1165,16 @@ static void aspeed_smc_dma_setup(AspeedSMCState *s, Error **errp)
                        TYPE_ASPEED_SMC ".dma-dram");
 }
 
+static void aspeed_smc_wdt_setup(AspeedSMCState *s, Error **errp)
+{
+    if (!s->wdt2_mr) {
+        error_setg(errp, TYPE_ASPEED_SMC ": 'wdt2' link not set");
+        return;
+    }
+
+    address_space_init(&s->wdt2_as, s->wdt2_mr, TYPE_ASPEED_SMC ".wdt2");
+}
+
 static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
@@ -1189,6 +1256,11 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
     if (aspeed_smc_has_dma(asc)) {
         aspeed_smc_dma_setup(s, errp);
     }
+
+    /* WDT2 support */
+    if (aspeed_smc_has_wdt_control(asc)) {
+        aspeed_smc_wdt_setup(s, errp);
+    }
 }
 
 static const VMStateDescription vmstate_aspeed_smc = {
@@ -1208,6 +1280,8 @@ static Property aspeed_smc_properties[] = {
     DEFINE_PROP_BOOL("inject-failure", AspeedSMCState, inject_failure, false),
     DEFINE_PROP_LINK("dram", AspeedSMCState, dram_mr,
                      TYPE_MEMORY_REGION, MemoryRegion *),
+    DEFINE_PROP_LINK("wdt2", AspeedSMCState, wdt2_mr,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events
index 612d3d6087aa..0de79bf9c6a5 100644
--- a/hw/ssi/trace-events
+++ b/hw/ssi/trace-events
@@ -9,6 +9,7 @@ aspeed_smc_dma_checksum(uint32_t addr, uint32_t data) "0x%08x: 0x%08x"
 aspeed_smc_dma_rw(const char *dir, uint32_t flash_addr, uint32_t dram_addr, uint32_t size) "%s flash:@0x%08x dram:@0x%08x size:0x%08x"
 aspeed_smc_write(uint64_t addr,  uint32_t size, uint64_t data) "@0x%" PRIx64 " size %u: 0x%" PRIx64
 aspeed_smc_flash_select(int cs, const char *prefix) "CS%d %sselect"
+aspeed_smc_wdt2_enable(const char *prefix) "WDT2 is %sabled"
 
 # npcm7xx_fiu.c
 
-- 
2.31.1


