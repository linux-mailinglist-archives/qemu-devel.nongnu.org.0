Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FB74EE6EA
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 05:49:50 +0200 (CEST)
Received: from localhost ([::1]:60872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na8IH-0005Q3-Nm
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 23:49:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1na8GR-0001mc-Ml; Thu, 31 Mar 2022 23:47:55 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:13633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1na8GP-0000pv-3D; Thu, 31 Mar 2022 23:47:55 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2313Zqot095945;
 Fri, 1 Apr 2022 11:35:52 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 1 Apr
 2022 11:46:52 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Beraldo Leal" <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [PATCH v4 1/9] aspeed/adc: Add AST1030 support
Date: Fri, 1 Apr 2022 11:46:43 +0800
Message-ID: <20220401034651.9066-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220401034651.9066-1-jamin_lin@aspeedtech.com>
References: <20220401034651.9066-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2313Zqot095945
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Steven Lee <steven_lee@aspeedtech.com>

Per ast1030_v7.pdf, AST1030 ADC engine is identical to AST2600's ADC.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/adc/aspeed_adc.c         | 16 ++++++++++++++++
 include/hw/adc/aspeed_adc.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/hw/adc/aspeed_adc.c b/hw/adc/aspeed_adc.c
index c5fcae29f6..0d29663129 100644
--- a/hw/adc/aspeed_adc.c
+++ b/hw/adc/aspeed_adc.c
@@ -389,6 +389,15 @@ static void aspeed_2600_adc_class_init(ObjectClass *klass, void *data)
     aac->nr_engines = 2;
 }
 
+static void aspeed_1030_adc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedADCClass *aac = ASPEED_ADC_CLASS(klass);
+
+    dc->desc = "ASPEED 1030 ADC Controller";
+    aac->nr_engines = 2;
+}
+
 static const TypeInfo aspeed_adc_info = {
     .name = TYPE_ASPEED_ADC,
     .parent = TYPE_SYS_BUS_DEVICE,
@@ -415,6 +424,12 @@ static const TypeInfo aspeed_2600_adc_info = {
     .class_init = aspeed_2600_adc_class_init,
 };
 
+static const TypeInfo aspeed_1030_adc_info = {
+    .name = TYPE_ASPEED_1030_ADC,
+    .parent = TYPE_ASPEED_ADC,
+    .class_init = aspeed_1030_adc_class_init, /* No change since AST2600 */
+};
+
 static void aspeed_adc_register_types(void)
 {
     type_register_static(&aspeed_adc_engine_info);
@@ -422,6 +437,7 @@ static void aspeed_adc_register_types(void)
     type_register_static(&aspeed_2400_adc_info);
     type_register_static(&aspeed_2500_adc_info);
     type_register_static(&aspeed_2600_adc_info);
+    type_register_static(&aspeed_1030_adc_info);
 }
 
 type_init(aspeed_adc_register_types);
diff --git a/include/hw/adc/aspeed_adc.h b/include/hw/adc/aspeed_adc.h
index 2f166e8be1..ff1d06ea91 100644
--- a/include/hw/adc/aspeed_adc.h
+++ b/include/hw/adc/aspeed_adc.h
@@ -17,6 +17,7 @@
 #define TYPE_ASPEED_2400_ADC TYPE_ASPEED_ADC "-ast2400"
 #define TYPE_ASPEED_2500_ADC TYPE_ASPEED_ADC "-ast2500"
 #define TYPE_ASPEED_2600_ADC TYPE_ASPEED_ADC "-ast2600"
+#define TYPE_ASPEED_1030_ADC TYPE_ASPEED_ADC "-ast1030"
 OBJECT_DECLARE_TYPE(AspeedADCState, AspeedADCClass, ASPEED_ADC)
 
 #define TYPE_ASPEED_ADC_ENGINE "aspeed.adc.engine"
-- 
2.17.1


