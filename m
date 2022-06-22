Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 564DF5552D4
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 19:50:03 +0200 (CEST)
Received: from localhost ([::1]:40316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o44UM-0004gO-9H
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 13:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o44Gp-0007ng-59; Wed, 22 Jun 2022 13:36:03 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:51970)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o44Gm-0001hO-Ny; Wed, 22 Jun 2022 13:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655919360; x=1687455360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NwnfozSIGKJtE3BQEFJgDW9ymGBUWA5fZfbACDdbJPU=;
 b=OsNUJP7ylOiinGdvqn3iaghfJgzzkz9PTd9lFbykOkwPV3qiauRPOH5p
 dpqJOstodv3rZpf13r/sCiRcnCds51E2vNr1dthGGHkutr7fCQONt87oN
 8hMBrm89vKnLEQm6+//xP7tvznJ2MpL7tF4xDD3HDYbQ0FM2t3aIWWc03 o=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 22 Jun 2022 10:29:50 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 10:29:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 22 Jun 2022 10:29:22 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 22 Jun
 2022 10:29:21 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Titus Rwantare
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 3/9] hw/arm/aspeed: qcom-dc-scm-v1: add block backed FRU device
Date: Wed, 22 Jun 2022 10:28:24 -0700
Message-ID: <20220622172830.101210-4-quic_jaehyoo@quicinc.com>
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

From: Graeme Gregory <quic_ggregory@quicinc.com>

The FRU device uses the index 0 device on bus IF_NONE.

-drive file=$FRU,format=raw,if=none

file must match FRU size of 128k

Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
---
 hw/arm/aspeed.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 785cc543d046..36d6b2c33e48 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -992,17 +992,29 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
      */
 }
 
+static void qcom_dc_scm_fru_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
+{
+    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
+    DeviceState *dev = DEVICE(i2c_dev);
+    /* Use First Index for DC-SCM FRU */
+    DriveInfo *dinfo = drive_get(IF_NONE, 0, 0);
+
+    qdev_prop_set_uint32(dev, "rom-size", rsize);
+
+    if (dinfo) {
+        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
+    }
+
+    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
+}
+
 static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 15), "tmp105", 0x4d);
 
-    uint8_t *eeprom_buf = g_malloc0(128 * 1024);
-    if (eeprom_buf) {
-        smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 15), 0x53,
-                              eeprom_buf);
-    }
+    qcom_dc_scm_fru_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x53, 128 * 1024);
 }
 
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
-- 
2.25.1


