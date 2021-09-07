Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8829F4023CB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 09:05:43 +0200 (CEST)
Received: from localhost ([::1]:38724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNVAs-0002Nc-Ix
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 03:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mNV3y-0001Mp-9G
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:58:34 -0400
Received: from smtpout2.3005.mail-out.ovh.net ([46.105.54.81]:59923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mNV3u-0001ME-Q0
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:58:34 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.208])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 70EDC13B032;
 Tue,  7 Sep 2021 06:58:28 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 7 Sep
 2021 08:58:27 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002d2b39716-f2d5-4f51-a476-84fb4d7e72de,
 984F41D2D9692A95DAA6D5E609006558D983FB00) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH 10/10] aspeed/smc: Introduce an addr_width() class handler
Date: Tue, 7 Sep 2021 08:58:22 +0200
Message-ID: <20210907065822.1152443-11-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907065822.1152443-1-clg@kaod.org>
References: <20210907065822.1152443-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f6496007-31f3-45d8-bc0b-4b6a5ea1fb66
X-Ovh-Tracer-Id: 978125546100788073
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefgedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
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
index 59b62987db21..da4222b96dc4 100644
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
@@ -1386,6 +1385,11 @@ static const AspeedSegments aspeed_2400_spi1_segments[] = {
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
@@ -1407,6 +1411,7 @@ static void aspeed_2400_spi1_class_init(ObjectClass *klass, void *data)
     asc->segment_to_reg    = aspeed_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_smc_reg_to_segment;
     asc->dma_ctrl          = aspeed_smc_dma_ctrl;
+    asc->addr_width        = aspeed_2400_spi1_addr_width;
 }
 
 static const TypeInfo aspeed_2400_spi1_info = {
-- 
2.31.1


