Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D81D5848AB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 01:27:32 +0200 (CEST)
Received: from localhost ([::1]:41872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHCug-0008Ev-VV
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 19:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9208ef30ce=irischenlj@fb.com>)
 id 1oHCrH-0002tZ-RL; Thu, 28 Jul 2022 19:23:59 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:59582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9208ef30ce=irischenlj@fb.com>)
 id 1oHCrF-0002tJ-E7; Thu, 28 Jul 2022 19:23:59 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26SIAmex022025;
 Thu, 28 Jul 2022 16:23:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=I3cZabEhZjjNUJqHSqDz3fSxEIvzOeQ01GsQz674YD8=;
 b=KjCANK7OZ0N3N+kUpig9JmswoSQ71hNQ9huvpFyacSXQltmpUc36X557Ru0IreHmKRrI
 eogIkObzTabbsfwzodTPLD7W7/phy8P68pFvY0XFce2wSkL+8xMNw9UsXeKdQ3Mchtks
 9C1emwG15hFY5y9mRqzXpTVfjo/b2wQWSEk= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3hkfsk7nr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 28 Jul 2022 16:23:47 -0700
Received: from localhost (2620:10d:c0a8:1b::d) by mail.thefacebook.com
 (2620:10d:c0a8:82::c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 16:23:46 -0700
From: Iris Chen <irischenlj@fb.com>
To: 
CC: <irischenlj@fb.com>, <peter@pjd.dev>, <pdel@fb.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <clg@kaod.org>,
 <patrick@stwcx.xyz>, <alistair@alistair23.me>, <kwolf@redhat.com>,
 <hreitz@redhat.com>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <thuth@redhat.com>, <lvivier@redhat.com>,
 <pbonzini@redhat.com>, <qemu-block@nongnu.org>, <dz4list@gmail.com>
Subject: [RFC 2/3] hw: spi_gpio: add spi gpio model
Date: Thu, 28 Jul 2022 16:23:21 -0700
Message-ID: <20220728232322.2921703-3-irischenlj@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220728232322.2921703-1-irischenlj@fb.com>
References: <20220728232322.2921703-1-irischenlj@fb.com>
Content-Type: text/plain
X-Originating-IP: [2620:10d:c0a8:1b::d]
X-Proofpoint-GUID: 6xFTiQ__WPb2SB_9BARZyxNIka7fwvXV
X-Proofpoint-ORIG-GUID: 6xFTiQ__WPb2SB_9BARZyxNIka7fwvXV
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-28_06,2022-07-28_02,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=9208ef30ce=irischenlj@fb.com;
 helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: Iris Chen <irischenlj@fb.com>
---
 hw/ssi/spi_gpio.c         | 166 ++++++++++++++++++++++++++++++++++++++
 include/hw/ssi/spi_gpio.h |  38 +++++++++
 2 files changed, 204 insertions(+)
 create mode 100644 hw/ssi/spi_gpio.c
 create mode 100644 include/hw/ssi/spi_gpio.h

diff --git a/hw/ssi/spi_gpio.c b/hw/ssi/spi_gpio.c
new file mode 100644
index 0000000000..1e99c55933
--- /dev/null
+++ b/hw/ssi/spi_gpio.c
@@ -0,0 +1,166 @@
+/*
+ * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
+ *
+ * This code is licensed under the GPL version 2 or later. See the COPYING
+ * file in the top-level directory.
+ */
+
+#include "hw/ssi/spi_gpio.h"
+#include "hw/irq.h"
+
+#define SPI_CPHA BIT(0) /* clock phase (1 = SPI_CLOCK_PHASE_SECOND) */
+#define SPI_CPOL BIT(1) /* clock polarity (1 = SPI_POLARITY_HIGH) */
+
+static void do_leading_edge(SpiGpioState *s)
+{
+    if (!s->CPHA) {
+        s->input_bits |= object_property_get_bool(OBJECT(s->controller_state),
+                                                  "gpioX4", NULL);
+        /*
+         * According to SPI protocol:
+         * CPHA=0 leading half clock cycle is sampling phase
+         * We technically should not drive out miso
+         * However, when the kernel bitbang driver is setting the clk pin,
+         * it will overwrite the miso value, so we are driving out miso in
+         * the sampling half clock cycle as well to workaround this issue
+         */
+        s->miso = !!(s->output_bits & 0x80);
+        object_property_set_bool(OBJECT(s->controller_state), "gpioX5", s->miso,
+                                 NULL);
+    }
+}
+
+static void do_trailing_edge(SpiGpioState *s)
+{
+    if (s->CPHA) {
+        s->input_bits |= object_property_get_bool(OBJECT(s->controller_state),
+                                                  "gpioX4", NULL);
+        /*
+         * According to SPI protocol:
+         * CPHA=1 trailing half clock cycle is sampling phase
+         * We technically should not drive out miso
+         * However, when the kernel bitbang driver is setting the clk pin,
+         * it will overwrite the miso value, so we are driving out miso in
+         * the sampling half clock cycle as well to workaround this issue
+         */
+        s->miso = !!(s->output_bits & 0x80);
+        object_property_set_bool(OBJECT(s->controller_state), "gpioX5", s->miso,
+                                 NULL);
+    }
+}
+
+static void cs_set_level(void *opaque, int n, int level)
+{
+    SpiGpioState *s = SPI_GPIO(opaque);
+    s->cs = !!level;
+
+    /* relay the CS value to the CS output pin */
+    qemu_set_irq(s->cs_output_pin, s->cs);
+
+    s->miso = !!(s->output_bits & 0x80);
+    object_property_set_bool(OBJECT(s->controller_state),
+                             "gpioX5", s->miso, NULL);
+
+    s->clk = !!(s->mode & SPI_CPOL);
+}
+
+static void clk_set_level(void *opaque, int n, int level)
+{
+    SpiGpioState *s = SPI_GPIO(opaque);
+
+    bool cur = !!level;
+
+    /* CS# is high/not selected, do nothing */
+    if (s->cs) {
+        return;
+    }
+
+    /* When the lock has not changed, do nothing */
+    if (s->clk == cur) {
+        return;
+    }
+
+    s->clk = cur;
+
+    /* Leading edge */
+    if (s->clk != s->CIDLE) {
+        do_leading_edge(s);
+    }
+
+    /* Trailing edge */
+    if (s->clk == s->CIDLE) {
+        do_trailing_edge(s);
+        s->clk_counter++;
+
+        /*
+         * Deliver the input to and
+         * get the next output byte
+         * from the SPI device
+         */
+        if (s->clk_counter == 8) {
+            s->output_bits = ssi_transfer(s->spi, s->input_bits);
+            s->clk_counter = 0;
+            s->input_bits = 0;
+         } else {
+            s->input_bits <<= 1;
+            s->output_bits <<= 1;
+         }
+    }
+}
+
+static void spi_gpio_realize(DeviceState *dev, Error **errp)
+{
+    SpiGpioState *s = SPI_GPIO(dev);
+
+    s->spi = ssi_create_bus(dev, "spi");
+    s->spi->preread = true;
+
+    s->mode = 0;
+    s->clk_counter = 0;
+
+    s->cs = true;
+    s->clk = true;
+
+    /* Assuming the first output byte is 0 */
+    s->output_bits = 0;
+    s->CIDLE = !!(s->mode & SPI_CPOL);
+    s->CPHA = !!(s->mode & SPI_CPHA);
+
+    /* init the input GPIO lines */
+    /* SPI_CS_in connects to the Aspeed GPIO */
+    qdev_init_gpio_in_named(dev, cs_set_level, "SPI_CS_in", 1);
+    qdev_init_gpio_in_named(dev, clk_set_level, "SPI_CLK", 1);
+
+    /* init the output GPIO lines */
+    /* SPI_CS_out connects to the SSI_GPIO_CS */
+    qdev_init_gpio_out_named(dev, &s->cs_output_pin, "SPI_CS_out", 1);
+
+    qdev_connect_gpio_out_named(s->controller_state, "sysbus-irq",
+                                AST_GPIO_IRQ_X0_NUM, qdev_get_gpio_in_named(
+                                DEVICE(s), "SPI_CS_in", 0));
+    qdev_connect_gpio_out_named(s->controller_state, "sysbus-irq",
+                                AST_GPIO_IRQ_X3_NUM, qdev_get_gpio_in_named(
+                                DEVICE(s), "SPI_CLK", 0));
+    object_property_set_bool(OBJECT(s->controller_state), "gpioX5", true, NULL);
+}
+
+static void SPI_GPIO_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = spi_gpio_realize;
+}
+
+static const TypeInfo SPI_GPIO_info = {
+    .name           = TYPE_SPI_GPIO,
+    .parent         = TYPE_SYS_BUS_DEVICE,
+    .instance_size  = sizeof(SpiGpioState),
+    .class_init     = SPI_GPIO_class_init,
+};
+
+static void SPI_GPIO_register_types(void)
+{
+    type_register_static(&SPI_GPIO_info);
+}
+
+type_init(SPI_GPIO_register_types)
diff --git a/include/hw/ssi/spi_gpio.h b/include/hw/ssi/spi_gpio.h
new file mode 100644
index 0000000000..c47d1531e1
--- /dev/null
+++ b/include/hw/ssi/spi_gpio.h
@@ -0,0 +1,38 @@
+/*
+ * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
+ *
+ * This code is licensed under the GPL version 2 or later. See the COPYING
+ * file in the top-level directory.
+ */
+
+#ifndef SPI_GPIO_H
+#define SPI_GPIO_H
+
+#include "qemu/osdep.h"
+#include "hw/ssi/ssi.h"
+#include "hw/gpio/aspeed_gpio.h"
+
+#define TYPE_SPI_GPIO "spi_gpio"
+OBJECT_DECLARE_SIMPLE_TYPE(SpiGpioState, SPI_GPIO);
+
+/* ASPEED GPIO propname values */
+#define AST_GPIO_IRQ_X0_NUM 185
+#define AST_GPIO_IRQ_X3_NUM 188
+
+struct SpiGpioState {
+    SysBusDevice parent;
+    SSIBus *spi;
+    DeviceState *controller_state;
+
+    int mode;
+    int clk_counter;
+
+    bool CIDLE, CPHA;
+    uint32_t output_bits;
+    uint32_t input_bits;
+
+    bool clk, cs, miso;
+    qemu_irq cs_output_pin;
+};
+
+#endif /* SPI_GPIO_H */
-- 
2.30.2


