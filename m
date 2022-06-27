Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B1055BBF6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 22:21:25 +0200 (CEST)
Received: from localhost ([::1]:58692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5vEa-00088W-CF
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 16:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upf-0004qD-BN
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 15:55:39 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:55002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upc-0000g3-US
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 15:55:39 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RJ1NBG024508
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 12:55:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=Knc0iXV/rIh+iUNNvBlcFNHjqA8oW9DJcT+V5S82ZYQ=;
 b=JmId4v20otNSEMXhjZVacHkXh/D+MDrHiMwioZlrucWVAfGBzmMBpEwSLUMbacAnn1Ky
 15qmi8TkzWPtC/n0SWNjX2Mp7KtSf180LoKPasIGMlM+ChmzuVoDSImhsM+Qu+y7rJf5
 C6IYtjIKiPxTVaUzgYOo74eplsj5MGW3scs= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gwyfsdaxh-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 12:55:35 -0700
Received: from snc-exhub201.TheFacebook.com (2620:10d:c085:21d::7) by
 snc-exhub102.TheFacebook.com (2620:10d:c085:11d::6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 12:55:35 -0700
Received: from twshared31479.05.prn5.facebook.com (2620:10d:c085:208::11) by
 mail.thefacebook.com (2620:10d:c085:21d::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 12:55:34 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id DCC6D8D206ED; Mon, 27 Jun 2022 12:55:07 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <zhdaniel@fb.com>, <clg@kaod.org>, <qemu-devel@nongnu.org>, 
 <qemu-arm@nongnu.org>, <komlodi@google.com>, <titusr@google.com>,
 <andrew@aj.id.au>, <joel@jms.id.au>
Subject: [PATCH 07/14] aspeed: Add PECI controller
Date: Mon, 27 Jun 2022 12:54:59 -0700
Message-ID: <20220627195506.403715-8-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220627195506.403715-1-pdel@fb.com>
References: <20220627195506.403715-1-pdel@fb.com>
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: xTN96csjXSa1lVve5XzaCVEnvBZS_YkY
X-Proofpoint-ORIG-GUID: xTN96csjXSa1lVve5XzaCVEnvBZS_YkY
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=71779173e5=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed_ast10x0.c       |  11 ++
 hw/misc/aspeed_peci.c         | 225 ++++++++++++++++++++++++++++++++++
 hw/misc/meson.build           |   3 +-
 include/hw/arm/aspeed_soc.h   |   3 +
 include/hw/misc/aspeed_peci.h |  34 +++++
 5 files changed, 275 insertions(+), 1 deletion(-)
 create mode 100644 hw/misc/aspeed_peci.c
 create mode 100644 include/hw/misc/aspeed_peci.h

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 5df480a21f..780841ea84 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -47,6 +47,7 @@ static const hwaddr aspeed_soc_ast1030_memmap[] =3D {
     [ASPEED_DEV_UART13]    =3D 0x7E790700,
     [ASPEED_DEV_WDT]       =3D 0x7E785000,
     [ASPEED_DEV_LPC]       =3D 0x7E789000,
+    [ASPEED_DEV_PECI]      =3D 0x7E78B000,
     [ASPEED_DEV_I2C]       =3D 0x7E7B0000,
 };
=20
@@ -75,6 +76,7 @@ static const int aspeed_soc_ast1030_irqmap[] =3D {
     [ASPEED_DEV_TIMER8]    =3D 23,
     [ASPEED_DEV_WDT]       =3D 24,
     [ASPEED_DEV_LPC]       =3D 35,
+    [ASPEED_DEV_PECI]      =3D 38,
     [ASPEED_DEV_FMC]       =3D 39,
     [ASPEED_DEV_PWM]       =3D 44,
     [ASPEED_DEV_ADC]       =3D 46,
@@ -133,6 +135,8 @@ static void aspeed_soc_ast1030_init(Object *obj)
=20
     object_initialize_child(obj, "lpc", &s->lpc, TYPE_ASPEED_LPC);
=20
+    object_initialize_child(obj, "peci", &s->peci, TYPE_ASPEED_PECI);
+
     object_initialize_child(obj, "sbc", &s->sbc, TYPE_ASPEED_SBC);
=20
     for (i =3D 0; i < sc->wdts_num; i++) {
@@ -238,6 +242,13 @@ static void aspeed_soc_ast1030_realize(DeviceState *de=
v_soc, Error **errp)
     /* UART */
     aspeed_soc_uart_init(s);
=20
+    /* PECI */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->peci), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->peci), 0, sc->memmap[ASPEED_DEV_PEC=
I]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peci), 0, aspeed_soc_get_irq(s, =
ASPEED_DEV_PECI));
+
     /* Timer */
     object_property_set_link(OBJECT(&s->timerctrl), "scu", OBJECT(&s->scu),
                              &error_abort);
diff --git a/hw/misc/aspeed_peci.c b/hw/misc/aspeed_peci.c
new file mode 100644
index 0000000000..670e532fc0
--- /dev/null
+++ b/hw/misc/aspeed_peci.c
@@ -0,0 +1,225 @@
+/*
+ * Aspeed PECI Controller
+ *
+ * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
+ *
+ * This code is licensed under the GPL version 2 or later. See the COPYING
+ * file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/irq.h"
+#include "hw/misc/aspeed_peci.h"
+
+#define U(x) (x##U)
+#define GENMASK(h, l) \
+	(((~U(0)) - (U(1) << (l)) + 1) & \
+	 (~U(0) >> (32 - 1 - (h))))
+
+/* ASPEED PECI Registers */
+/* Control Register */
+#define ASPEED_PECI_CTRL (0x00 / 4)
+#define   ASPEED_PECI_CTRL_SAMPLING_MASK 	GENMASK(19, 16)
+#define   ASPEED_PECI_CTRL_RD_MODE_MASK 	GENMASK(13, 12)
+#define     ASPEED_PECI_CTRL_RD_MODE_DBG BIT(13)
+#define     ASPEED_PECI_CTRL_RD_MODE_COUNT BIT(12)
+#define   ASPEED_PECI_CTRL_CLK_SRC_HCLK BIT(11)
+#define   ASPEED_PECI_CTRL_CLK_DIV_MASK GENMASK(10, 8)
+#define   ASPEED_PECI_CTRL_INVERT_OUT BIT(7)
+#define   ASPEED_PECI_CTRL_INVERT_IN BIT(6)
+#define   ASPEED_PECI_CTRL_BUS_CONTENTION_EN BIT(5)
+#define   ASPEED_PECI_CTRL_PECI_EN  BIT(4)
+#define   ASPEED_PECI_CTRL_PECI_CLK_EN  BIT(0)
+
+/* Timing Negotiation Register */
+#define ASPEED_PECI_TIMING_NEGOTIATION (0x04 / 4)
+#define   ASPEED_PECI_T_NEGO_MSG_MASK  GENMASK(15, 8)
+#define   ASPEED_PECI_T_NEGO_ADDR_MASK  GENMASK(7, 0)
+
+/* Command Register */
+#define ASPEED_PECI_CMD (0x08 / 4)
+#define   ASPEED_PECI_CMD_PIN_MONITORING BIT(31)
+#define   ASPEED_PECI_CMD_STS_MASK  GENMASK(27, 24)
+#define     ASPEED_PECI_CMD_STS_ADDR_T_NEGO 0x3
+#define   ASPEED_PECI_CMD_IDLE_MASK  \
+   (ASPEED_PECI_CMD_STS_MASK | ASPEED_PECI_CMD_PIN_MONITORING)
+#define   ASPEED_PECI_CMD_FIRE   BIT(0)
+
+/* Read/Write Length Register */
+#define ASPEED_PECI_RW_LENGTH (0x0c / 4)
+#define   ASPEED_PECI_AW_FCS_EN   BIT(31)
+#define   ASPEED_PECI_RD_LEN_MASK  GENMASK(23, 16)
+#define   ASPEED_PECI_WR_LEN_MASK  GENMASK(15, 8)
+#define   ASPEED_PECI_TARGET_ADDR_MASK  GENMASK(7, 0)
+
+/* Expected FCS Data Register */
+#define ASPEED_PECI_EXPECTED_FCS (0x10 / 4)
+#define   ASPEED_PECI_EXPECTED_RD_FCS_MASK GENMASK(23, 16)
+#define   ASPEED_PECI_EXPECTED_AW_FCS_AUTO_MASK GENMASK(15, 8)
+#define   ASPEED_PECI_EXPECTED_WR_FCS_MASK GENMASK(7, 0)
+
+/* Captured FCS Data Register */
+#define ASPEED_PECI_CAPTURED_FCS (0x14 / 4)
+#define   ASPEED_PECI_CAPTURED_RD_FCS_MASK GENMASK(23, 16)
+#define   ASPEED_PECI_CAPTURED_WR_FCS_MASK GENMASK(7, 0)
+
+/* Interrupt Register */
+#define ASPEED_PECI_INT_CTRL (0x18 / 4)
+#define   ASPEED_PECI_TIMING_NEGO_SEL_MASK GENMASK(31, 30)
+#define     ASPEED_PECI_1ST_BIT_OF_ADDR_NEGO 0
+#define     ASPEED_PECI_2ND_BIT_OF_ADDR_NEGO 1
+#define     ASPEED_PECI_MESSAGE_NEGO  2
+#define   ASPEED_PECI_INT_MASK   GENMASK(4, 0)
+#define     ASPEED_PECI_INT_BUS_TIMEOUT  BIT(4)
+#define     ASPEED_PECI_INT_BUS_CONTENTION BIT(3)
+#define     ASPEED_PECI_INT_WR_FCS_BAD  BIT(2)
+#define     ASPEED_PECI_INT_WR_FCS_ABORT BIT(1)
+#define     ASPEED_PECI_INT_CMD_DONE  BIT(0)
+
+/* Interrupt Status Register */
+#define ASPEED_PECI_INT_STS (0x1c / 4)
+#define   ASPEED_PECI_INT_TIMING_RESULT_MASK GENMASK(29, 16)
+   /* bits[4..0]: Same bit fields in the 'Interrupt Register' */
+
+/* Rx/Tx Data Buffer Registers */
+#define ASPEED_PECI_WR_DATA0 (0x20 / 4)
+#define ASPEED_PECI_WR_DATA1 (0x24 / 4)
+#define ASPEED_PECI_WR_DATA2 (0x28 / 4)
+#define ASPEED_PECI_WR_DATA3 (0x2c / 4)
+#define ASPEED_PECI_RD_DATA0 (0x30 / 4)
+#define ASPEED_PECI_RD_DATA1 (0x34 / 4)
+#define ASPEED_PECI_RD_DATA2 (0x38 / 4)
+#define ASPEED_PECI_RD_DATA3 (0x3c / 4)
+#define ASPEED_PECI_WR_DATA4 (0x40 / 4)
+#define ASPEED_PECI_WR_DATA5 (0x44 / 4)
+#define ASPEED_PECI_WR_DATA6 (0x48 / 4)
+#define ASPEED_PECI_WR_DATA7 (0x4c / 4)
+#define ASPEED_PECI_RD_DATA4 (0x50 / 4)
+#define ASPEED_PECI_RD_DATA5 (0x54 / 4)
+#define ASPEED_PECI_RD_DATA6 (0x58 / 4)
+#define ASPEED_PECI_RD_DATA7 (0x5c / 4)
+#define   ASPEED_PECI_DATA_BUF_SIZE_MAX 32
+
+/** PECI read/write supported responses */
+#define PECI_CC_RSP_SUCCESS              (0x40U)
+#define PECI_CC_RSP_TIMEOUT              (0x80U)
+#define PECI_CC_OUT_OF_RESOURCES_TIMEOUT (0x81U)
+#define PECI_CC_RESOURCES_LOWPWR_TIMEOUT (0x82U)
+#define PECI_CC_ILLEGAL_REQUEST          (0x90U)
+
+static void aspeed_peci_instance_init(Object *obj)
+{
+}
+
+static uint64_t aspeed_peci_read(void *opaque, hwaddr addr, unsigned size)
+{
+    AspeedPECIState *s =3D ASPEED_PECI(opaque);
+
+    if (addr >=3D ASPEED_PECI_NR_REGS << 2) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Out-of-bounds read at offset 0=
x%" HWADDR_PRIx "\n",
+                      __func__, addr);
+        return 0;
+    }
+    addr >>=3D 2;
+
+    uint32_t reg =3D s->regs[addr];
+    //printf("%s:  0x%08lx 0x%08x %u\n", __func__, addr << 2, reg, size);
+
+    return reg;
+}
+
+static void aspeed_peci_write(void *opaque, hwaddr addr, uint64_t data, un=
signed size)
+{
+    AspeedPECIState *s =3D ASPEED_PECI(opaque);
+
+    //printf("%s: 0x%08lx 0x%08x %u\n", __func__, addr, reg, size);
+
+    if (addr >=3D ASPEED_PECI_NR_REGS << 2) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Out-of-bounds write at offset =
0x%" HWADDR_PRIx "\n",
+                      __func__, addr);
+        return;
+    }
+    addr >>=3D 2;
+
+    switch (addr) {
+    case ASPEED_PECI_INT_STS:
+        s->regs[addr] &=3D ~data;
+        break;
+    default:
+        s->regs[addr] =3D data;
+        break;
+    }
+
+    switch (addr) {
+    case ASPEED_PECI_CMD:
+        if (!(s->regs[ASPEED_PECI_CMD] & ASPEED_PECI_CMD_FIRE)) {
+            break;
+        }
+        s->regs[ASPEED_PECI_RD_DATA0] =3D PECI_CC_RSP_SUCCESS;
+        s->regs[ASPEED_PECI_WR_DATA0] =3D PECI_CC_RSP_SUCCESS;
+
+        s->regs[ASPEED_PECI_INT_STS] |=3D ASPEED_PECI_INT_CMD_DONE;
+        qemu_irq_raise(s->irq);
+        break;
+    case ASPEED_PECI_INT_STS:
+        if (s->regs[ASPEED_PECI_INT_STS]) {
+            break;
+        }
+        qemu_irq_lower(s->irq);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: register 0x%03" HWADDR_PRIx " writes=
 unimplemented\n",
+                      __func__, addr);
+        break;
+    }
+}
+
+static const MemoryRegionOps aspeed_peci_ops =3D {
+    .read =3D aspeed_peci_read,
+    .write =3D aspeed_peci_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+};
+
+static void aspeed_peci_realize(DeviceState *dev, Error **errp)
+{
+    AspeedPECIState *s =3D ASPEED_PECI(dev);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
+
+    memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_peci_ops, s, TYPE_A=
SPEED_PECI, 0x1000);
+    sysbus_init_mmio(sbd, &s->mmio);
+    sysbus_init_irq(sbd, &s->irq);
+}
+
+static void aspeed_peci_reset(DeviceState *dev)
+{
+    AspeedPECIState *s =3D ASPEED_PECI(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static void aspeed_peci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->realize =3D aspeed_peci_realize;
+    dc->reset =3D aspeed_peci_reset;
+    dc->desc =3D "Aspeed PECI Controller";
+}
+
+static const TypeInfo aspeed_peci_info =3D {
+    .name =3D TYPE_ASPEED_PECI,
+    .parent =3D TYPE_SYS_BUS_DEVICE,
+    .instance_init =3D aspeed_peci_instance_init,
+    .instance_size =3D sizeof(AspeedPECIState),
+    .class_init =3D aspeed_peci_class_init,
+    .class_size =3D sizeof(AspeedPECIClass),
+    .abstract =3D false,
+};
+
+static void aspeed_peci_register_types(void)
+{
+    type_register_static(&aspeed_peci_info);
+}
+
+type_init(aspeed_peci_register_types);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 132b7b7344..95268eddc0 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -116,7 +116,8 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: file=
s(
   'aspeed_scu.c',
   'aspeed_sbc.c',
   'aspeed_sdmc.c',
-  'aspeed_xdma.c'))
+  'aspeed_xdma.c',
+  'aspeed_peci.c'))
=20
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 02a5a9ffcb..fd2aa1880a 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -34,6 +34,7 @@
 #include "hw/usb/hcd-ehci.h"
 #include "qom/object.h"
 #include "hw/misc/aspeed_lpc.h"
+#include "hw/misc/aspeed_peci.h"
=20
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_EHCIS_NUM 2
@@ -73,6 +74,7 @@ struct AspeedSoCState {
     AspeedSDHCIState sdhci;
     AspeedSDHCIState emmc;
     AspeedLPCState lpc;
+    AspeedPECIState peci;
     uint32_t uart_default;
     Clock *sysclk;
 };
@@ -161,6 +163,7 @@ enum {
     ASPEED_DEV_DPMCU,
     ASPEED_DEV_DP,
     ASPEED_DEV_I3C,
+    ASPEED_DEV_PECI,
 };
=20
 qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
diff --git a/include/hw/misc/aspeed_peci.h b/include/hw/misc/aspeed_peci.h
new file mode 100644
index 0000000000..81c7d31700
--- /dev/null
+++ b/include/hw/misc/aspeed_peci.h
@@ -0,0 +1,34 @@
+/*
+ * Aspeed PECI Controller
+ *
+ * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
+ *
+ * This code is licensed under the GPL version 2 or later. See the COPYING
+ * file in the top-level directory.
+ */
+
+#ifndef ASPEED_PECI_H
+#define ASPEED_PECI_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_ASPEED_PECI "aspeed.peci"
+OBJECT_DECLARE_TYPE(AspeedPECIState, AspeedPECIClass, ASPEED_PECI);
+
+#define ASPEED_PECI_NR_REGS ((0xFC + 4) >> 2)
+
+struct AspeedPECIState {
+    /* <private> */
+    SysBusDevice parent;
+
+    MemoryRegion mmio;
+    qemu_irq irq;
+
+    uint32_t regs[ASPEED_PECI_NR_REGS];
+};
+
+struct AspeedPECIClass {
+    SysBusDeviceClass parent_class;
+};
+
+#endif
--=20
2.30.2


