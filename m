Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB35F5619F7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 14:13:40 +0200 (CEST)
Received: from localhost ([::1]:40430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6t3D-0000LG-PY
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 08:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sI7-0008Ej-Sh; Thu, 30 Jun 2022 07:25:00 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:40499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sI4-00027m-Gw; Thu, 30 Jun 2022 07:24:59 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbbC3m0Zz4xXF;
 Thu, 30 Jun 2022 21:24:55 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbb91fDzz4xD5;
 Thu, 30 Jun 2022 21:24:52 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 14/27] hw/arm/aspeed: add Qualcomm Firework BMC machine
Date: Thu, 30 Jun 2022 13:23:58 +0200
Message-Id: <20220630112411.1474431-15-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220630112411.1474431-1-clg@kaod.org>
References: <20220630112411.1474431-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

From: Graeme Gregory <quic_ggregory@quicinc.com>

Add base for Qualcomm Firework BMC machine.

Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220627154703.148943-3-quic_jaehyoo@quicinc.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 6e4b287fd31b..74cb297dd38c 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -962,6 +962,16 @@ static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 15), "tmp105", 0x4d);
 }
 
+static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+
+    /* Create the generic DC-SCM hardware */
+    qcom_dc_scm_bmc_i2c_init(bmc);
+
+    /* Now create the Firework specific hardware */
+}
+
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
 {
     return ASPEED_MACHINE(obj)->mmio_exec;
@@ -1429,6 +1439,26 @@ static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
         aspeed_soc_num_cpus(amc->soc_name);
 };
 
+static void aspeed_machine_qcom_firework_class_init(ObjectClass *oc,
+                                                    void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Qualcomm DC-SCM V1/Firework BMC (Cortex A7)";
+    amc->soc_name  = "ast2600-a3";
+    amc->hw_strap1 = QCOM_DC_SCM_V1_BMC_HW_STRAP1;
+    amc->hw_strap2 = QCOM_DC_SCM_V1_BMC_HW_STRAP2;
+    amc->fmc_model = "n25q512a";
+    amc->spi_model = "n25q512a";
+    amc->num_cs    = 2;
+    amc->macs_mask = ASPEED_MAC2_ON | ASPEED_MAC3_ON;
+    amc->i2c_init  = qcom_dc_scm_firework_i2c_init;
+    mc->default_ram_size = 1 * GiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
+};
+
 static const TypeInfo aspeed_machine_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
@@ -1470,6 +1500,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("qcom-dc-scm-v1-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_qcom_dc_scm_v1_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("qcom-firework-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_qcom_firework_class_init,
     }, {
         .name          = MACHINE_TYPE_NAME("fp5280g2-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
-- 
2.35.3


