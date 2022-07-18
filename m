Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92E957893E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:08:33 +0200 (CEST)
Received: from localhost ([::1]:41698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDVAW-00047Z-T7
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1oDUvT-0001HA-Cz; Mon, 18 Jul 2022 13:52:59 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:44869)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1oDUvR-0006I7-8k; Mon, 18 Jul 2022 13:52:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1658166777; x=1689702777;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wBL5eIXET/saimeqReQtF8ldnTmu3BCakneBWwG8WqA=;
 b=qoveAK8Fi47krX5NiZk3n/68JhUma5xCEm2whuGEtT6KRQ7W10LXv2mk
 vmg6Mt3z2zhQ4tHTiPfMhd4+QqbLQRQb43hHQWTgJ98FVLU6HYk32fIEn
 N6S6ia41QG+RB+7+Nak3UTWHkVF9xPUEk1gnP/MHe2jcbPOqgRIzas6fQ g=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 18 Jul 2022 10:52:53 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 10:52:53 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 18 Jul 2022 10:52:52 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 18 Jul
 2022 10:52:51 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>, Markus Armbruster
 <armbru@redhat.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Titus Rwantare <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, "Joel
 Stanley" <joel@jms.id.au>, Patrick Venture <venture@google.com>, Hao Wu
 <wuhaotsh@google.com>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Jae Hyun Yoo
 <quic_jaehyoo@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2] aspeed: qcom: add block backed FRU devices
Date: Mon, 18 Jul 2022 10:52:14 -0700
Message-ID: <20220718175214.2087644-1-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=quic_jaehyoo@quicinc.com; helo=alexa-out-sd-01.qualcomm.com
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

From: Graeme Gregory <quic_ggregory@quicinc.com>

The FRU devices for dc-scm-v1 and firework on bus IF_NONE.

-drive file=$DC_SCM_FRU,format=raw,if=none,unit=0
-drive file=$FIREWORK_FRU,format=raw,if=none,unit=1

file must match FRU size of 128k

Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
Changes in v2:
 * Changed 'qcom_dc_scm_fru_init' to a generic one so that it can be used
   by other machines too. (Patrick)

Discussions on v1:
https://lore.kernel.org/qemu-devel/20220622172830.101210-4-quic_jaehyoo@quicinc.com/
This single patch was dropped from the series so I'm sending it again as a
separate patch.

 hw/arm/aspeed.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 4193a3d23d1d..aa9efd4c9723 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -440,6 +440,23 @@ static void at24c_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
     i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
 }
 
+static void at24c_eeprom_init_from_drive(I2CBus *i2c_bus, uint8_t addr,
+                                         uint32_t rsize, int drv_bus,
+                                         int drv_unit)
+{
+    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
+    DeviceState *dev = DEVICE(i2c_dev);
+    DriveInfo *dinfo = drive_get(IF_NONE, drv_bus, drv_unit);
+
+    qdev_prop_set_uint32(dev, "rom-size", rsize);
+
+    if (dinfo) {
+        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
+    }
+
+    i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
+}
+
 static void palmetto_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
@@ -975,6 +992,9 @@ static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
     AspeedSoCState *soc = &bmc->soc;
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 15), "tmp105", 0x4d);
+
+    at24c_eeprom_init_from_drive(aspeed_i2c_get_bus(&soc->i2c, 15), 0x53,
+                                 128 * 1024, 0, 0);
 }
 
 static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
@@ -987,6 +1007,10 @@ static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
 
     /* Now create the Firework specific hardware */
 
+    /* I2C4 */
+    at24c_eeprom_init_from_drive(aspeed_i2c_get_bus(&soc->i2c, 4), 0x50,
+                                 128 * 1024, 0, 1);
+
     /* I2C7 CPUVR MUX */
     cpuvr_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7),
                                         "pca9546", 0x70);
-- 
2.25.1


