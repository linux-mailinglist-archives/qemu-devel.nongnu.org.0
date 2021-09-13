Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7A04099DD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:46:54 +0200 (CEST)
Received: from localhost ([::1]:48364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPp6W-0004qb-JP
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mPoaC-0003yN-4X; Mon, 13 Sep 2021 12:13:25 -0400
Received: from smtpout2.3005.mail-out.ovh.net ([46.105.54.81]:59581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mPoa6-0000jI-CW; Mon, 13 Sep 2021 12:13:23 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.59])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id CF7B113ECDB;
 Mon, 13 Sep 2021 16:13:13 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 13 Sep
 2021 18:13:13 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00163a325ea-d000-43ea-9b69-9c1890ba8b3b,
 7CA125ACC991A0BE3D2311CBE60F5A293341D68C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 09/14] aspeed: Emulate the AST2600A3
Date: Mon, 13 Sep 2021 18:12:59 +0200
Message-ID: <20210913161304.3805652-10-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913161304.3805652-1-clg@kaod.org>
References: <20210913161304.3805652-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8127f81f-9b8b-44f0-a8c0-20627082b4a2
X-Ovh-Tracer-Id: 8689976958309141286
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudegjedgleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout2.3005.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joel Stanley <joel@jms.id.au>

This is the latest revision of the ASPEED 2600 SoC. As there is no
need to model multiple revisions of the same SoC for the moment,
update the SCU AST2600 to model the A3 revision instead of the A1 and
adapt the AST2600 SoC and machines.

Reset values are taken from v8 of the datasheet.

Signed-off-by: Joel Stanley <joel@jms.id.au>
[ clg: - Introduced an Aspeed "ast2600-a3" SoC class
       - Commit log update ]
Message-Id: <20210629142336.750058-3-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/misc/aspeed_scu.h |  2 ++
 hw/arm/aspeed.c              |  6 +++---
 hw/arm/aspeed_ast2600.c      |  6 +++---
 hw/misc/aspeed_scu.c         | 36 +++++++++++++++++++++++++++++-------
 4 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index d49bfb02fbdb..c14aff2bcbb5 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -43,6 +43,8 @@ struct AspeedSCUState {
 #define AST2500_A1_SILICON_REV   0x04010303U
 #define AST2600_A0_SILICON_REV   0x05000303U
 #define AST2600_A1_SILICON_REV   0x05010303U
+#define AST2600_A2_SILICON_REV   0x05020303U
+#define AST2600_A3_SILICON_REV   0x05030303U
 
 #define ASPEED_IS_AST2500(si_rev)     ((((si_rev) >> 24) & 0xff) == 0x04)
 
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 952fb2012a53..97964c7e0c53 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -997,7 +997,7 @@ static void aspeed_machine_ast2600_evb_class_init(ObjectClass *oc, void *data)
     AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
 
     mc->desc       = "Aspeed AST2600 EVB (Cortex-A7)";
-    amc->soc_name  = "ast2600-a1";
+    amc->soc_name  = "ast2600-a3";
     amc->hw_strap1 = AST2600_EVB_HW_STRAP1;
     amc->hw_strap2 = AST2600_EVB_HW_STRAP2;
     amc->fmc_model = "w25q512jv";
@@ -1017,7 +1017,7 @@ static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data)
     AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
 
     mc->desc       = "OpenPOWER Tacoma BMC (Cortex-A7)";
-    amc->soc_name  = "ast2600-a1";
+    amc->soc_name  = "ast2600-a3";
     amc->hw_strap1 = TACOMA_BMC_HW_STRAP1;
     amc->hw_strap2 = TACOMA_BMC_HW_STRAP2;
     amc->fmc_model = "mx66l1g45g";
@@ -1054,7 +1054,7 @@ static void aspeed_machine_rainier_class_init(ObjectClass *oc, void *data)
     AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
 
     mc->desc       = "IBM Rainier BMC (Cortex-A7)";
-    amc->soc_name  = "ast2600-a1";
+    amc->soc_name  = "ast2600-a3";
     amc->hw_strap1 = RAINIER_BMC_HW_STRAP1;
     amc->hw_strap2 = RAINIER_BMC_HW_STRAP2;
     amc->fmc_model = "mx66l1g45g";
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index e3013128c670..8e1993790e6f 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -516,9 +516,9 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
 
     dc->realize      = aspeed_soc_ast2600_realize;
 
-    sc->name         = "ast2600-a1";
+    sc->name         = "ast2600-a3";
     sc->cpu_type     = ARM_CPU_TYPE_NAME("cortex-a7");
-    sc->silicon_rev  = AST2600_A1_SILICON_REV;
+    sc->silicon_rev  = AST2600_A3_SILICON_REV;
     sc->sram_size    = 0x16400;
     sc->spis_num     = 2;
     sc->ehcis_num    = 2;
@@ -530,7 +530,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
 }
 
 static const TypeInfo aspeed_soc_ast2600_type_info = {
-    .name           = "ast2600-a1",
+    .name           = "ast2600-a3",
     .parent         = TYPE_ASPEED_SOC,
     .instance_size  = sizeof(AspeedSoCState),
     .instance_init  = aspeed_soc_ast2600_init,
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 40a38ebd8549..05edebedeb46 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -101,14 +101,24 @@
 #define AST2600_CLK_STOP_CTRL_CLR TO_REG(0x84)
 #define AST2600_CLK_STOP_CTRL2     TO_REG(0x90)
 #define AST2600_CLK_STOP_CTRL2_CLR TO_REG(0x94)
+#define AST2600_DEBUG_CTRL        TO_REG(0xC8)
+#define AST2600_DEBUG_CTRL2       TO_REG(0xD8)
 #define AST2600_SDRAM_HANDSHAKE   TO_REG(0x100)
 #define AST2600_HPLL_PARAM        TO_REG(0x200)
 #define AST2600_HPLL_EXT          TO_REG(0x204)
+#define AST2600_APLL_PARAM        TO_REG(0x210)
+#define AST2600_APLL_EXT          TO_REG(0x214)
+#define AST2600_MPLL_PARAM        TO_REG(0x220)
 #define AST2600_MPLL_EXT          TO_REG(0x224)
+#define AST2600_EPLL_PARAM        TO_REG(0x240)
 #define AST2600_EPLL_EXT          TO_REG(0x244)
+#define AST2600_DPLL_PARAM        TO_REG(0x260)
+#define AST2600_DPLL_EXT          TO_REG(0x264)
 #define AST2600_CLK_SEL           TO_REG(0x300)
 #define AST2600_CLK_SEL2          TO_REG(0x304)
-#define AST2600_CLK_SEL3          TO_REG(0x310)
+#define AST2600_CLK_SEL3          TO_REG(0x308)
+#define AST2600_CLK_SEL4          TO_REG(0x310)
+#define AST2600_CLK_SEL5          TO_REG(0x314)
 #define AST2600_HW_STRAP1         TO_REG(0x500)
 #define AST2600_HW_STRAP1_CLR     TO_REG(0x504)
 #define AST2600_HW_STRAP1_PROT    TO_REG(0x508)
@@ -433,6 +443,8 @@ static uint32_t aspeed_silicon_revs[] = {
     AST2500_A1_SILICON_REV,
     AST2600_A0_SILICON_REV,
     AST2600_A1_SILICON_REV,
+    AST2600_A2_SILICON_REV,
+    AST2600_A3_SILICON_REV,
 };
 
 bool is_supported_silicon_rev(uint32_t silicon_rev)
@@ -651,16 +663,26 @@ static const MemoryRegionOps aspeed_ast2600_scu_ops = {
     .valid.unaligned = false,
 };
 
-static const uint32_t ast2600_a1_resets[ASPEED_AST2600_SCU_NR_REGS] = {
+static const uint32_t ast2600_a3_resets[ASPEED_AST2600_SCU_NR_REGS] = {
     [AST2600_SYS_RST_CTRL]      = 0xF7C3FED8,
-    [AST2600_SYS_RST_CTRL2]     = 0xFFFFFFFC,
+    [AST2600_SYS_RST_CTRL2]     = 0x0DFFFFFC,
     [AST2600_CLK_STOP_CTRL]     = 0xFFFF7F8A,
     [AST2600_CLK_STOP_CTRL2]    = 0xFFF0FFF0,
+    [AST2600_DEBUG_CTRL]        = 0x00000FFF,
+    [AST2600_DEBUG_CTRL2]       = 0x000000FF,
     [AST2600_SDRAM_HANDSHAKE]   = 0x00000000,
-    [AST2600_HPLL_PARAM]        = 0x1000405F,
+    [AST2600_HPLL_PARAM]        = 0x1000408F,
+    [AST2600_APLL_PARAM]        = 0x1000405F,
+    [AST2600_MPLL_PARAM]        = 0x1008405F,
+    [AST2600_EPLL_PARAM]        = 0x1004077F,
+    [AST2600_DPLL_PARAM]        = 0x1078405F,
+    [AST2600_CLK_SEL]           = 0xF3940000,
+    [AST2600_CLK_SEL2]          = 0x00700000,
+    [AST2600_CLK_SEL3]          = 0x00000000,
+    [AST2600_CLK_SEL4]          = 0xF3F40000,
+    [AST2600_CLK_SEL5]          = 0x30000000,
     [AST2600_CHIP_ID0]          = 0x1234ABCD,
     [AST2600_CHIP_ID1]          = 0x88884444,
-
 };
 
 static void aspeed_ast2600_scu_reset(DeviceState *dev)
@@ -675,7 +697,7 @@ static void aspeed_ast2600_scu_reset(DeviceState *dev)
      * of actual revision. QEMU and Linux only support A1 onwards so this is
      * sufficient.
      */
-    s->regs[AST2600_SILICON_REV] = AST2600_A1_SILICON_REV;
+    s->regs[AST2600_SILICON_REV] = AST2600_A3_SILICON_REV;
     s->regs[AST2600_SILICON_REV2] = s->silicon_rev;
     s->regs[AST2600_HW_STRAP1] = s->hw_strap1;
     s->regs[AST2600_HW_STRAP2] = s->hw_strap2;
@@ -689,7 +711,7 @@ static void aspeed_2600_scu_class_init(ObjectClass *klass, void *data)
 
     dc->desc = "ASPEED 2600 System Control Unit";
     dc->reset = aspeed_ast2600_scu_reset;
-    asc->resets = ast2600_a1_resets;
+    asc->resets = ast2600_a3_resets;
     asc->calc_hpll = aspeed_2500_scu_calc_hpll; /* No change since AST2500 */
     asc->apb_divider = 4;
     asc->nr_regs = ASPEED_AST2600_SCU_NR_REGS;
-- 
2.31.1


