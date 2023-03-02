Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843D76A880D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 18:44:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXmxG-0005FC-Dh; Thu, 02 Mar 2023 12:42:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Cwst=62=kaod.org=clg@ozlabs.org>)
 id 1pXmwp-0004qp-RS; Thu, 02 Mar 2023 12:42:32 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Cwst=62=kaod.org=clg@ozlabs.org>)
 id 1pXmwn-0002lw-B5; Thu, 02 Mar 2023 12:42:31 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PSJMk4bmBz4x80;
 Fri,  3 Mar 2023 04:42:26 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PSJMh5nw8z4x5X;
 Fri,  3 Mar 2023 04:42:24 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 05/11] hw/arm/aspeed: Adding new machine Yosemitev2 in QEMU
Date: Thu,  2 Mar 2023 18:42:00 +0100
Message-Id: <20230302174206.2434673-6-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302174206.2434673-1-clg@kaod.org>
References: <20230302174206.2434673-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Cwst=62=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>

This patch support Yosemitev2 in QEMU environment.
and introduced EEPROM BMC FRU data support "add fbyv2_bmc_fruid data"
along with the machine support.

Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
[ clg: - commit log topic update
       - Documentation update ]
Message-Id: <20230216133326.216017-1-pkarthikeyan1509@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 docs/system/arm/aspeed.rst |  1 +
 hw/arm/aspeed_eeprom.h     |  3 +++
 hw/arm/aspeed.c            | 31 +++++++++++++++++++++++++++++++
 hw/arm/aspeed_eeprom.c     | 23 +++++++++++++++++++++++
 4 files changed, 58 insertions(+)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 6c5b05128e..1d69b68591 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -24,6 +24,7 @@ AST2500 SoC based machines :
 - ``sonorapass-bmc``       OCP SonoraPass BMC
 - ``fp5280g2-bmc``         Inspur FP5280G2 BMC
 - ``g220a-bmc``            Bytedance G220A BMC
+- ``yosemitev2-bmc``       Facebook YosemiteV2 BMC
 
 AST2600 SoC based machines :
 
diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
index a0f848fa6e..edf18e9685 100644
--- a/hw/arm/aspeed_eeprom.h
+++ b/hw/arm/aspeed_eeprom.h
@@ -16,4 +16,7 @@ extern const size_t fby35_nic_fruid_len;
 extern const size_t fby35_bb_fruid_len;
 extern const size_t fby35_bmc_fruid_len;
 
+extern const uint8_t yosemitev2_bmc_fruid[];
+extern const size_t yosemitev2_bmc_fruid_len;
+
 #endif
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 27dda58338..3f992fea46 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -521,6 +521,15 @@ static void ast2600_evb_i2c_init(AspeedMachineState *bmc)
                      TYPE_TMP105, 0x4d);
 }
 
+static void yosemitev2_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x51, 128 * KiB);
+    at24c_eeprom_init_rom(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 128 * KiB,
+                          yosemitev2_bmc_fruid, yosemitev2_bmc_fruid_len);
+}
+
 static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
@@ -1174,6 +1183,24 @@ static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
 
+static void aspeed_machine_yosemitev2_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Facebook YosemiteV2 BMC (ARM1176)";
+    amc->soc_name  = "ast2500-a1";
+    amc->hw_strap1 = AST2500_EVB_HW_STRAP1;
+    amc->hw_strap2 = 0;
+    amc->fmc_model = "n25q256a";
+    amc->spi_model = "mx25l25635e";
+    amc->num_cs    = 2;
+    amc->i2c_init  = yosemitev2_bmc_i2c_init;
+    mc->default_ram_size       = 512 * MiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
+};
+
 static void aspeed_machine_romulus_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1562,6 +1589,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("ast2600-evb"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_ast2600_evb_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("yosemitev2-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_yosemitev2_class_init,
     }, {
         .name          = MACHINE_TYPE_NAME("tacoma-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
index 04463acc9d..7006794654 100644
--- a/hw/arm/aspeed_eeprom.c
+++ b/hw/arm/aspeed_eeprom.c
@@ -77,6 +77,29 @@ const uint8_t fby35_bmc_fruid[] = {
     0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,
 };
 
+/* Yosemite V2 BMC FRU */
+const uint8_t yosemitev2_bmc_fruid[] = {
+    0x01, 0x00, 0x00, 0x01, 0x0d, 0x00, 0x00, 0xf1, 0x01, 0x0c, 0x00, 0x36,
+    0xe6, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x42, 0x4d,
+    0x43, 0x20, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0x20, 0x4d, 0x6f,
+    0x64, 0x75, 0x6c, 0x65, 0xcd, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e,
+    0x30, 0xc9, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc1, 0x39, 0x01, 0x0c, 0x00, 0xc6,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x59, 0x6f, 0x73, 0x65, 0x6d,
+    0x69, 0x74, 0x65, 0x20, 0x56, 0x32, 0x2e, 0x30, 0x20, 0x45, 0x56, 0x54,
+    0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0xc4, 0x45, 0x56, 0x54, 0x32, 0xcd, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc7,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc8, 0x43, 0x6f,
+    0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,
+};
+
 const size_t fby35_nic_fruid_len = sizeof(fby35_nic_fruid);
 const size_t fby35_bb_fruid_len = sizeof(fby35_bb_fruid);
 const size_t fby35_bmc_fruid_len = sizeof(fby35_bmc_fruid);
+
+const size_t yosemitev2_bmc_fruid_len = sizeof(yosemitev2_bmc_fruid);
-- 
2.39.2


