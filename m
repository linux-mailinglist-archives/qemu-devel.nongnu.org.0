Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233C356192A
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 13:30:47 +0200 (CEST)
Received: from localhost ([::1]:54612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6sNi-0007rS-4F
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 07:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sIJ-0000NO-Tj; Thu, 30 Jun 2022 07:25:11 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:39781
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sIH-0002Pc-QF; Thu, 30 Jun 2022 07:25:11 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbbR2QDxz4xYN;
 Thu, 30 Jun 2022 21:25:07 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbbP0MbWz4xD5;
 Thu, 30 Jun 2022 21:25:04 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>,
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 18/27] hw/arm/aspeed: firework: Add Thermal Diodes
Date: Thu, 30 Jun 2022 13:24:02 +0200
Message-Id: <20220630112411.1474431-19-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220630112411.1474431-1-clg@kaod.org>
References: <20220630112411.1474431-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Maheswara Kurapati <quic_mkurapat@quicinc.com>

Add Thermal Diodes for Firework machine.

Signed-off-by: Maheswara Kurapati <quic_mkurapat@quicinc.com>
Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220627154703.148943-7-quic_jaehyoo@quicinc.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 06b31fb533e2..e8c565c9adf5 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -965,12 +965,22 @@ static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
 static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
+    I2CSlave *therm_mux;
 
     /* Create the generic DC-SCM hardware */
     qcom_dc_scm_bmc_i2c_init(bmc);
 
     /* Now create the Firework specific hardware */
 
+    /* I2C8 Thermal Diodes*/
+    therm_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8),
+                                        "pca9548", 0x70);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 0), TYPE_LM75, 0x4C);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 1), TYPE_LM75, 0x4C);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 2), TYPE_LM75, 0x48);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 3), TYPE_LM75, 0x48);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 4), TYPE_LM75, 0x48);
+
     /* I2C9 Fan Controller (MAX31785) */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x52);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x54);
-- 
2.35.3


