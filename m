Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2454555291
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 19:38:13 +0200 (CEST)
Received: from localhost ([::1]:53098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o44Iv-00025g-1e
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 13:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o44GS-0007F1-3q; Wed, 22 Jun 2022 13:35:40 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:44776)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o44GO-0001gH-Rz; Wed, 22 Jun 2022 13:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655919337; x=1687455337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VKWzy+bV1C88lrACDG4kQqNlh6OoE/GpXOzKfo7eGjE=;
 b=KXDM00Oy4LHSWXrFJb3OjgVQV1dV49uO6P7IRRD4LbHpRGVg4OFduVhR
 BHasxH2g2m7jLU403yo0V2Y2+OtN58rE6WC9vIVLOUomjGGJRprmb1cPH
 MNu02ExaU7XrdaEeaYL4B4Ix2jd7B3AZZwZRn2St1wh5rBLi+7ne6BE9w 0=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 22 Jun 2022 10:29:28 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 10:29:28 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 22 Jun 2022 10:29:27 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 22 Jun
 2022 10:29:26 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Titus Rwantare
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Subject: [PATCH 9/9] hw/arm/aspeed: firework: add I2C MUXes for VR channels
Date: Wed, 22 Jun 2022 10:28:30 -0700
Message-ID: <20220622172830.101210-10-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=129.46.98.28;
 envelope-from=quic_jaehyoo@quicinc.com; helo=alexa-out.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Add 2-level cascaded I2C MUXes for SOC VR channels into the Firework
machine.

Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
---
 hw/arm/aspeed.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 526f3b651a9f..866a60cf7b4e 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1038,7 +1038,7 @@ static void qcom_firework_fru_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
 static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
-    I2CSlave *mux;
+    I2CSlave *therm_mux, *cpuvr_mux;
 
     /* Create the generic DC-SCM hardware */
     qcom_dc_scm_bmc_i2c_init(bmc);
@@ -1048,16 +1048,24 @@ static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
     /* I2C4 */
     qcom_firework_fru_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x50, 128 * 1024);
 
-    /* I2C - 8 Thermal Diodes*/
-    mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9548",
-                                  0x70);
-    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 0), TYPE_LM75, 0x4C);
-    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 1), TYPE_LM75, 0x4C);
-    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 2), TYPE_TMP75, 0x48);
-    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 3), TYPE_TMP75, 0x48);
-    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 4), TYPE_TMP75, 0x48);
-
-    /* I2C-9 Fan Controller (MAX31785) */
+    /* I2C7 CPUVR MUX */
+    cpuvr_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7),
+                                        "pca9546", 0x70);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 0), "pca9548", 0x72);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 1), "pca9548", 0x72);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 2), "pca9548", 0x72);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 3), "pca9548", 0x72);
+
+    /* I2C8 Thermal Diodes*/
+    therm_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8),
+                                        "pca9548", 0x70);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 0), TYPE_LM75, 0x4C);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 1), TYPE_LM75, 0x4C);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 2), TYPE_LM75, 0x48);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 3), TYPE_LM75, 0x48);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 4), TYPE_LM75, 0x48);
+
+    /* I2C9 Fan Controller (MAX31785) */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x52);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x54);
 }
-- 
2.25.1


