Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218DB249A0E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 12:16:22 +0200 (CEST)
Received: from localhost ([::1]:52322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8L8n-0005F5-2I
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 06:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L2v-0001IG-0e; Wed, 19 Aug 2020 06:10:17 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:58531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L2r-0006Xv-FE; Wed, 19 Aug 2020 06:10:16 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.167])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B8EB251E25D7;
 Wed, 19 Aug 2020 12:10:10 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Wed, 19 Aug
 2020 12:10:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004a09a97a2-e83e-4435-b211-9e5f5bd58e73,
 56ABA3BD09B5898CED80C8E013D4E39E9C6048D1) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 17/21] aspeed/sdmc: Allow writes to unprotected registers
Date: Wed, 19 Aug 2020 12:09:52 +0200
Message-ID: <20200819100956.2216690-18-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200819100956.2216690-1-clg@kaod.org>
References: <20200819100956.2216690-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b435cfb0-7f94-4620-9a61-78e797a7ba37
X-Ovh-Tracer-Id: 18050990257961012006
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedruddtkedgvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 06:10:05
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joel Stanley <joel@jms.id.au>

A subset of registers are not protected by the lock behaviour, so allow
unconditionally writing to those.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_sdmc.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index ff2809a09965..81c73450ab5d 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -33,15 +33,28 @@
 /* Configuration Register */
 #define R_CONF            (0x04 / 4)
 
+/* Interrupt control/status */
+#define R_ISR             (0x50 / 4)
+
 /* Control/Status Register #1 (ast2500) */
 #define R_STATUS1         (0x60 / 4)
 #define   PHY_BUSY_STATE      BIT(0)
 #define   PHY_PLL_LOCK_STATUS BIT(4)
 
+/* Reserved */
+#define R_MCR6C           (0x6c / 4)
+
 #define R_ECC_TEST_CTRL   (0x70 / 4)
 #define   ECC_TEST_FINISHED   BIT(12)
 #define   ECC_TEST_FAIL       BIT(13)
 
+#define R_TEST_START_LEN  (0x74 / 4)
+#define R_TEST_FAIL_DQ    (0x78 / 4)
+#define R_TEST_INIT_VAL   (0x7c / 4)
+#define R_DRAM_SW         (0x88 / 4)
+#define R_DRAM_TIME       (0x8c / 4)
+#define R_ECC_ERR_INJECT  (0xb4 / 4)
+
 /*
  * Configuration register Ox4 (for Aspeed AST2400 SOC)
  *
@@ -449,6 +462,20 @@ static uint32_t aspeed_2600_sdmc_compute_conf(AspeedSDMCState *s, uint32_t data)
 static void aspeed_2600_sdmc_write(AspeedSDMCState *s, uint32_t reg,
                                    uint32_t data)
 {
+    /* Unprotected registers */
+    switch (reg) {
+    case R_ISR:
+    case R_MCR6C:
+    case R_TEST_START_LEN:
+    case R_TEST_FAIL_DQ:
+    case R_TEST_INIT_VAL:
+    case R_DRAM_SW:
+    case R_DRAM_TIME:
+    case R_ECC_ERR_INJECT:
+        s->regs[reg] = data;
+        return;
+    }
+
     if (s->regs[R_PROT] == PROT_HARDLOCKED) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: SDMC is locked until system reset!\n",
                 __func__);
-- 
2.25.4


