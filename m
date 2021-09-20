Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CAB4119F7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:41:24 +0200 (CEST)
Received: from localhost ([::1]:32846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMM7-0001O8-Dg
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSM4z-0006EQ-9p
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:23:41 -0400
Received: from smtpout2.3005.mail-out.ovh.net ([46.105.54.81]:37055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSM4e-0004EO-Tv
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:23:41 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.35])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 8EE8013EDFF;
 Mon, 20 Sep 2021 16:23:15 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 18:23:14 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005bdcf5976-2a8c-4d3e-849c-13f91bc14225,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 10/12] aspeed/smc: Introduce a new addr_width() class
 handler
Date: Mon, 20 Sep 2021 18:23:07 +0200
Message-ID: <20210920162309.1091711-11-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920162309.1091711-1-clg@kaod.org>
References: <20210920162309.1091711-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f9f8964c-7c25-40d0-9e3b-b925acb796c9
X-Ovh-Tracer-Id: 13074794144289491750
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout2.3005.mail-out.ovh.net
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AST2400 SPI controller has a transitional HW interface and it
stores the address width currently in use in a different register than
all the other SMC controllers. It needs special handling when working
in 4B mode.

Make it clear through a class handler. This also removes another use
of the segments array.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  1 +
 hw/ssi/aspeed_smc.c         | 19 ++++++++++++-------
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index a1ca0e65c405..8dc81294988e 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -111,6 +111,7 @@ struct AspeedSMCClass {
     void (*reg_to_segment)(const AspeedSMCState *s, uint32_t reg,
                            AspeedSegments *seg);
     void (*dma_ctrl)(AspeedSMCState *s, uint32_t value);
+    int (*addr_width)(const AspeedSMCState *s);
 };
 
 #endif /* ASPEED_SMC_H */
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 8cc7ccf45591..7129341c129e 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -196,7 +196,6 @@
  * controller. These can be changed when board is initialized with the
  * Segment Address Registers.
  */
-static const AspeedSegments aspeed_2400_spi1_segments[];
 static const AspeedSegments aspeed_2500_spi1_segments[];
 static const AspeedSegments aspeed_2500_spi2_segments[];
 
@@ -382,15 +381,15 @@ static inline int aspeed_smc_flash_cmd(const AspeedSMCFlash *fl)
     return cmd;
 }
 
-static inline int aspeed_smc_flash_is_4byte(const AspeedSMCFlash *fl)
+static inline int aspeed_smc_flash_addr_width(const AspeedSMCFlash *fl)
 {
     const AspeedSMCState *s = fl->controller;
     AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
 
-    if (asc->segments == aspeed_2400_spi1_segments) {
-        return s->regs[s->r_ctrl0] & CTRL_AST2400_SPI_4BYTE;
+    if (asc->addr_width) {
+        return asc->addr_width(s);
     } else {
-        return s->regs[s->r_ce_ctrl] & (1 << (CTRL_EXTENDED0 + fl->cs));
+        return s->regs[s->r_ce_ctrl] & (1 << (CTRL_EXTENDED0 + fl->cs)) ? 4 : 3;
     }
 }
 
@@ -450,7 +449,7 @@ static void aspeed_smc_flash_setup(AspeedSMCFlash *fl, uint32_t addr)
 {
     const AspeedSMCState *s = fl->controller;
     uint8_t cmd = aspeed_smc_flash_cmd(fl);
-    int i = aspeed_smc_flash_is_4byte(fl) ? 4 : 3;
+    int i = aspeed_smc_flash_addr_width(fl);
 
     /* Flash access can not exceed CS segment */
     addr = aspeed_smc_check_segment_addr(fl, addr);
@@ -558,7 +557,7 @@ static bool aspeed_smc_do_snoop(AspeedSMCFlash *fl,  uint64_t data,
                                 unsigned size)
 {
     AspeedSMCState *s = fl->controller;
-    uint8_t addr_width = aspeed_smc_flash_is_4byte(fl) ? 4 : 3;
+    uint8_t addr_width = aspeed_smc_flash_addr_width(fl);
 
     trace_aspeed_smc_do_snoop(fl->cs, s->snoop_index, s->snoop_dummies,
                               (uint8_t) data & 0xff);
@@ -1384,6 +1383,11 @@ static const AspeedSegments aspeed_2400_spi1_segments[] = {
     { 0x30000000, 64 * MiB },
 };
 
+static int aspeed_2400_spi1_addr_width(const AspeedSMCState *s)
+{
+    return s->regs[R_SPI_CTRL0] & CTRL_AST2400_SPI_4BYTE ? 4 : 3;
+}
+
 static void aspeed_2400_spi1_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1405,6 +1409,7 @@ static void aspeed_2400_spi1_class_init(ObjectClass *klass, void *data)
     asc->segment_to_reg    = aspeed_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_smc_reg_to_segment;
     asc->dma_ctrl          = aspeed_smc_dma_ctrl;
+    asc->addr_width        = aspeed_2400_spi1_addr_width;
 }
 
 static const TypeInfo aspeed_2400_spi1_info = {
-- 
2.31.1


