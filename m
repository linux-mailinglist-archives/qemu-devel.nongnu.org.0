Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37DB517F0A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 09:37:21 +0200 (CEST)
Received: from localhost ([::1]:60146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nln60-0003fh-O0
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 03:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmV6-00037S-LZ; Tue, 03 May 2022 02:59:12 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:52611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmV4-0007Tc-Mx; Tue, 03 May 2022 02:59:12 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsrRJ2MbYz4yT0;
 Tue,  3 May 2022 16:59:08 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsrRG0GrCz4yST;
 Tue,  3 May 2022 16:59:05 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 06/19] aspeed/smc: Add AST1030 support
Date: Tue,  3 May 2022 08:58:35 +0200
Message-Id: <20220503065848.125215-7-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503065848.125215-1-clg@kaod.org>
References: <20220503065848.125215-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=XF6a=VL=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Steven Lee <steven_lee@aspeedtech.com>

AST1030 spi controller's address decoding unit is 1MB that is identical
to ast2600, but fmc address decoding unit is 512kb.
Introduce seg_to_reg and reg_to_seg handlers for ast1030 fmc controller.
In addition, add ast1030 fmc, spi1, and spi2 class init handler.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220401083850.15266-3-jamin_lin@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 157 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 157 insertions(+)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 48305e1574ec..68aa697164d4 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1696,6 +1696,160 @@ static const TypeInfo aspeed_2600_spi2_info = {
     .class_init = aspeed_2600_spi2_class_init,
 };
 
+/*
+ * The FMC Segment Registers of the AST1030 have a 512KB unit.
+ * Only bits [27:19] are used for decoding.
+ */
+#define AST1030_SEG_ADDR_MASK 0x0ff80000
+
+static uint32_t aspeed_1030_smc_segment_to_reg(const AspeedSMCState *s,
+        const AspeedSegments *seg)
+{
+    uint32_t reg = 0;
+
+    /* Disabled segments have a nil register */
+    if (!seg->size) {
+        return 0;
+    }
+
+    reg |= (seg->addr & AST1030_SEG_ADDR_MASK) >> 16; /* start offset */
+    reg |= (seg->addr + seg->size - 1) & AST1030_SEG_ADDR_MASK; /* end offset */
+    return reg;
+}
+
+static void aspeed_1030_smc_reg_to_segment(const AspeedSMCState *s,
+        uint32_t reg, AspeedSegments *seg)
+{
+    uint32_t start_offset = (reg << 16) & AST1030_SEG_ADDR_MASK;
+    uint32_t end_offset = reg & AST1030_SEG_ADDR_MASK;
+    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
+
+    if (reg) {
+        seg->addr = asc->flash_window_base + start_offset;
+        seg->size = end_offset + (512 * KiB) - start_offset;
+    } else {
+        seg->addr = asc->flash_window_base;
+        seg->size = 0;
+    }
+}
+
+static const uint32_t aspeed_1030_fmc_resets[ASPEED_SMC_R_MAX] = {
+    [R_CONF] = (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0 |
+                            CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE1),
+};
+
+static const AspeedSegments aspeed_1030_fmc_segments[] = {
+    { 0x0, 128 * MiB }, /* start address is readonly */
+    { 128 * MiB, 128 * MiB }, /* default is disabled but needed for -kernel */
+    { 0x0, 0 }, /* disabled */
+};
+
+static void aspeed_1030_fmc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
+
+    dc->desc               = "Aspeed 1030 FMC Controller";
+    asc->r_conf            = R_CONF;
+    asc->r_ce_ctrl         = R_CE_CTRL;
+    asc->r_ctrl0           = R_CTRL0;
+    asc->r_timings         = R_TIMINGS;
+    asc->nregs_timings     = 2;
+    asc->conf_enable_w0    = CONF_ENABLE_W0;
+    asc->cs_num_max        = 2;
+    asc->segments          = aspeed_1030_fmc_segments;
+    asc->segment_addr_mask = 0x0ff80ff8;
+    asc->resets            = aspeed_1030_fmc_resets;
+    asc->flash_window_base = 0x80000000;
+    asc->flash_window_size = 0x10000000;
+    asc->features          = ASPEED_SMC_FEATURE_DMA;
+    asc->dma_flash_mask    = 0x0FFFFFFC;
+    asc->dma_dram_mask     = 0x000BFFFC;
+    asc->nregs             = ASPEED_SMC_R_MAX;
+    asc->segment_to_reg    = aspeed_1030_smc_segment_to_reg;
+    asc->reg_to_segment    = aspeed_1030_smc_reg_to_segment;
+    asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
+}
+
+static const TypeInfo aspeed_1030_fmc_info = {
+    .name =  "aspeed.fmc-ast1030",
+    .parent = TYPE_ASPEED_SMC,
+    .class_init = aspeed_1030_fmc_class_init,
+};
+
+static const AspeedSegments aspeed_1030_spi1_segments[] = {
+    { 0x0, 128 * MiB }, /* start address is readonly */
+    { 0x0, 0 }, /* disabled */
+};
+
+static void aspeed_1030_spi1_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
+
+    dc->desc               = "Aspeed 1030 SPI1 Controller";
+    asc->r_conf            = R_CONF;
+    asc->r_ce_ctrl         = R_CE_CTRL;
+    asc->r_ctrl0           = R_CTRL0;
+    asc->r_timings         = R_TIMINGS;
+    asc->nregs_timings     = 2;
+    asc->conf_enable_w0    = CONF_ENABLE_W0;
+    asc->cs_num_max        = 2;
+    asc->segments          = aspeed_1030_spi1_segments;
+    asc->segment_addr_mask = 0x0ff00ff0;
+    asc->flash_window_base = 0x90000000;
+    asc->flash_window_size = 0x10000000;
+    asc->features          = ASPEED_SMC_FEATURE_DMA;
+    asc->dma_flash_mask    = 0x0FFFFFFC;
+    asc->dma_dram_mask     = 0x000BFFFC;
+    asc->nregs             = ASPEED_SMC_R_MAX;
+    asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
+    asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
+    asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
+}
+
+static const TypeInfo aspeed_1030_spi1_info = {
+    .name =  "aspeed.spi1-ast1030",
+    .parent = TYPE_ASPEED_SMC,
+    .class_init = aspeed_1030_spi1_class_init,
+};
+static const AspeedSegments aspeed_1030_spi2_segments[] = {
+    { 0x0, 128 * MiB }, /* start address is readonly */
+    { 0x0, 0 }, /* disabled */
+};
+
+static void aspeed_1030_spi2_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
+
+    dc->desc               = "Aspeed 1030 SPI2 Controller";
+    asc->r_conf            = R_CONF;
+    asc->r_ce_ctrl         = R_CE_CTRL;
+    asc->r_ctrl0           = R_CTRL0;
+    asc->r_timings         = R_TIMINGS;
+    asc->nregs_timings     = 2;
+    asc->conf_enable_w0    = CONF_ENABLE_W0;
+    asc->cs_num_max        = 2;
+    asc->segments          = aspeed_1030_spi2_segments;
+    asc->segment_addr_mask = 0x0ff00ff0;
+    asc->flash_window_base = 0xb0000000;
+    asc->flash_window_size = 0x10000000;
+    asc->features          = ASPEED_SMC_FEATURE_DMA;
+    asc->dma_flash_mask    = 0x0FFFFFFC;
+    asc->dma_dram_mask     = 0x000BFFFC;
+    asc->nregs             = ASPEED_SMC_R_MAX;
+    asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
+    asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
+    asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
+}
+
+static const TypeInfo aspeed_1030_spi2_info = {
+    .name =  "aspeed.spi2-ast1030",
+    .parent = TYPE_ASPEED_SMC,
+    .class_init = aspeed_1030_spi2_class_init,
+};
+
 static void aspeed_smc_register_types(void)
 {
     type_register_static(&aspeed_smc_flash_info);
@@ -1709,6 +1863,9 @@ static void aspeed_smc_register_types(void)
     type_register_static(&aspeed_2600_fmc_info);
     type_register_static(&aspeed_2600_spi1_info);
     type_register_static(&aspeed_2600_spi2_info);
+    type_register_static(&aspeed_1030_fmc_info);
+    type_register_static(&aspeed_1030_spi1_info);
+    type_register_static(&aspeed_1030_spi2_info);
 }
 
 type_init(aspeed_smc_register_types)
-- 
2.35.1


