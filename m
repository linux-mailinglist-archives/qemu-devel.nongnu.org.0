Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1794F67D2
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 19:48:42 +0200 (CEST)
Received: from localhost ([::1]:39148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc9lp-0003Ph-Hp
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 13:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgari@xilinx.com>)
 id 1nc9gg-0000Mn-SN; Wed, 06 Apr 2022 13:43:23 -0400
Received: from mail-dm6nam12on20628.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::628]:24544
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgari@xilinx.com>)
 id 1nc9gb-0004SO-F1; Wed, 06 Apr 2022 13:43:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrzPbjtrs5xPek8eCUtIsPJFIZJv4gspZI0mB6xRBO67mGsw369D3PmwbxqK8rUhi+AvZnlBXnRReHjaPzqMZ9D2fcMpvhrC4ZBzLc0rcog4HIE8/UXmvggthebpRPozaNUovDcs9O72aTNVdy0/weoTicypYvSnRXhJCIpOZyLQOwJr99E05o92f9vpkMu6spDLffcaqx+bEH6aUDVe6OAmEXnbm8GJnpsDjwqRYBIDy6aTOKXH41TkPcl/JkN2Lzbof1pvWz+25q4YWHo6UipAOTEKgLVqV3uJk2q3apcfleZ/0ND0d3poDg9WXJcgkGP/yq5U3T8mJoaMzClGBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2OBgdtqD+4z2E/LJlb+c5iO+CziEQV1cbspnENLflw=;
 b=aH22vfcfY/dnoO08IPdk8aLlJWbwvxL/FM3WmYxIGw8vG2cWAPC0LD9QslY0AYcTkJXsXv6PkBZlkssWGyhpgUWB76ZVOK+Voymkkd5zET1Aq1Y3/qCTBPT6sbQBwLPWAj5CR70ndxMTiAjfHeK56N/S/1KoTXqgweYvtaN3SWp1TQHQ75xn1g6ID4pr6og/sVY/uuf6EpC7g2X1RS9yvFVDvpG42FuMjKD/CDkkDNEXsvfpyeIQUH08CMIyjQhdqCBgDlWhcPDDx3JL4t5U2UO07VjqT+FwhHVn45YXt9FhMcjcRK8jdGuFOAmo/TyXPh63GtZNzbib+/EJvC22XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2OBgdtqD+4z2E/LJlb+c5iO+CziEQV1cbspnENLflw=;
 b=cRoEx3u5wbgsf2k6s+SFdaegPY42ysS07zFkhWbGu7/UQTOLPxrd9PTrpvtta8jaGWjIkLZhavS+Rs9gU6oLhHvndwqlkMFkQ/vRwN4z1mqVB5hWKiw7W72t9lJwOWrQ1KyDNNqh9Pn4y8BvNPJwDjDXsl3pve1980tO3kAbL8A=
Received: from BN6PR11CA0068.namprd11.prod.outlook.com (2603:10b6:404:f7::30)
 by DM6PR02MB3962.namprd02.prod.outlook.com (2603:10b6:5:a2::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 17:43:08 +0000
Received: from BN1NAM02FT030.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:f7:cafe::4d) by BN6PR11CA0068.outlook.office365.com
 (2603:10b6:404:f7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31 via Frontend
 Transport; Wed, 6 Apr 2022 17:43:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT030.mail.protection.outlook.com (10.13.2.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.21 via Frontend Transport; Wed, 6 Apr 2022 17:43:07 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 6 Apr 2022 18:43:05 +0100
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 6 Apr 2022 18:43:05 +0100
Received: from [172.21.132.222] (port=48490 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar.iglesias@xilinx.com>)
 id 1nc9gP-0005RG-Cr; Wed, 06 Apr 2022 18:43:05 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1 3/4] hw/misc: Add a model of the Xilinx Versal CRL
Date: Wed, 6 Apr 2022 18:43:02 +0100
Message-ID: <20220406174303.2022038-4-edgar.iglesias@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406174303.2022038-1-edgar.iglesias@xilinx.com>
References: <20220406174303.2022038-1-edgar.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 396b28e2-a671-45b2-5193-08da17f4e8fa
X-MS-TrafficTypeDiagnostic: DM6PR02MB3962:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB39625BF74D02D286A227A083ABE79@DM6PR02MB3962.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +MUvOmp0VBaSCbiPgUVd84xyczVUfa6hsqGNdfJORZVkuaSdTuIkguDLkvvU7iDNVNU8qeMJUm1mMG3ApS22lEmorslRANWeqcuqnGbJQ8t1z+FdkRAJpuNc3SN+dTLAxTk7uieTgIhPQz5eT2yG6tLdlEj2yw+v1FmexqQGanlTLDsh52ifxEpOw4bzvHmXPe/sB++Zsh/SgFi3o9LcEj811xmX9sMQcQYFhqzwuzQDXBGW4ejGM1AoE9bUf6L/5NHoEpd8lRZttpKHlzsQTRHdIDQ4g5w0ZKCdtbi7SO19GGk/nPamtr287J14kmJkW9GHS54pvcMoz6es0IGhluemgFmdwsTOJ7SP3XW/zGMFo6AtqfcWl6QKjZk6/KlTlfj4D3ZNz9D9hMrfGTAGd6lE3TlDMeeS4d5+MvCOFyIYQ5w3hkU7q/nP1LC7cNsh8MRykE1pZf5mdXTJoJ1CEW2/YjklCv6J/O0NwD2565GvVuiGCfBpqVeexHmbetpNQ+yjHUYi+JTw0ZUkDOW9jLAt6dY7KVFQqB/gpCXP624OPGf2R7MUO7bYvce2fvTQ9ozadx+PZxtUEJErlMIWFvsF5TLEnFC2RCM5YLQ6zOsHOeHrzpoUZzKDomCSS9Ve4qhCaI7n1/QxdZ6rDJveNsb6BPzpTTSzAf4dwsJ0UBp2fG0IJIxT2Lzq5BRHLEeH
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6916009)(2616005)(7636003)(30864003)(40460700003)(1076003)(83380400001)(5660300002)(186003)(26005)(54906003)(8936002)(9786002)(4326008)(2906002)(316002)(36756003)(82310400005)(6666004)(508600001)(36860700001)(356005)(70206006)(70586007)(426003)(8676002)(47076005)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 17:43:07.2962 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 396b28e2-a671-45b2-5193-08da17f4e8fa
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT030.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB3962
Received-SPF: pass client-ip=2a01:111:f400:fe59::628;
 envelope-from=edgari@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 fkonrad@xilinx.com, edgar.iglesias@amd.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, f4bug@amsat.org, francisco.iglesias@xilinx.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add a model of the Xilinx Versal CRL.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/misc/meson.build               |   1 +
 hw/misc/xlnx-versal-crl.c         | 421 ++++++++++++++++++++++++++++++
 include/hw/misc/xlnx-versal-crl.h | 235 +++++++++++++++++
 3 files changed, 657 insertions(+)
 create mode 100644 hw/misc/xlnx-versal-crl.c
 create mode 100644 include/hw/misc/xlnx-versal-crl.h

diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 6fb69612e0..2ff05c7afa 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -86,6 +86,7 @@ softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
 softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c'))
 specific_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-crf.c'))
 specific_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-apu-ctrl.c'))
+specific_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-crl.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files(
   'xlnx-versal-xramc.c',
   'xlnx-versal-pmc-iou-slcr.c',
diff --git a/hw/misc/xlnx-versal-crl.c b/hw/misc/xlnx-versal-crl.c
new file mode 100644
index 0000000000..767106b7a3
--- /dev/null
+++ b/hw/misc/xlnx-versal-crl.c
@@ -0,0 +1,421 @@
+/*
+ * QEMU model of the Clock-Reset-LPD (CRL).
+ *
+ * Copyright (c) 2022 Advanced Micro Devices, Inc.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Written by Edgar E. Iglesias <edgar.iglesias@amd.com>
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "qemu/bitops.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+#include "hw/register.h"
+#include "hw/resettable.h"
+
+#include "target/arm/arm-powerctl.h"
+#include "hw/misc/xlnx-versal-crl.h"
+
+#ifndef XLNX_VERSAL_CRL_ERR_DEBUG
+#define XLNX_VERSAL_CRL_ERR_DEBUG 0
+#endif
+
+static void crl_update_irq(XlnxVersalCRL *s)
+{
+    bool pending = s->regs[R_IR_STATUS] & ~s->regs[R_IR_MASK];
+    qemu_set_irq(s->irq, pending);
+}
+
+static void crl_status_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(reg->opaque);
+    crl_update_irq(s);
+}
+
+static uint64_t crl_enable_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_IR_MASK] &= ~val;
+    crl_update_irq(s);
+    return 0;
+}
+
+static uint64_t crl_disable_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_IR_MASK] |= val;
+    crl_update_irq(s);
+    return 0;
+}
+
+static void crl_reset_dev(XlnxVersalCRL *s, DeviceState *dev,
+                          bool rst_old, bool rst_new)
+{
+    device_cold_reset(dev);
+}
+
+static void crl_reset_cpu(XlnxVersalCRL *s, ARMCPU *armcpu,
+                          bool rst_old, bool rst_new)
+{
+    if (rst_new) {
+        arm_set_cpu_off(armcpu->mp_affinity);
+    } else {
+        arm_set_cpu_on_and_reset(armcpu->mp_affinity);
+    }
+}
+
+#define REGFIELD_RESET(type, s, reg, f, new_val, dev) {     \
+    bool old_f = ARRAY_FIELD_EX32((s)->regs, reg, f);       \
+    bool new_f = FIELD_EX32(new_val, reg, f);               \
+                                                            \
+    /* Detect edges.  */                                    \
+    if (dev && old_f != new_f) {                            \
+        crl_reset_ ## type(s, dev, old_f, new_f);           \
+    }                                                       \
+}
+
+static uint64_t crl_rst_r5_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(reg->opaque);
+
+    REGFIELD_RESET(cpu, s, RST_CPU_R5, RESET_CPU0, val64, s->cfg.cpu_r5[0]);
+    REGFIELD_RESET(cpu, s, RST_CPU_R5, RESET_CPU1, val64, s->cfg.cpu_r5[1]);
+    return val64;
+}
+
+static uint64_t crl_rst_adma_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(reg->opaque);
+    int i;
+
+    /* A single register fans out to all ADMA reset inputs.  */
+    for (i = 0; i < ARRAY_SIZE(s->cfg.adma); i++) {
+        REGFIELD_RESET(dev, s, RST_ADMA, RESET, val64, s->cfg.adma[i]);
+    }
+    return val64;
+}
+
+static uint64_t crl_rst_uart0_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(reg->opaque);
+
+    REGFIELD_RESET(dev, s, RST_UART0, RESET, val64, s->cfg.uart[0]);
+    return val64;
+}
+
+static uint64_t crl_rst_uart1_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(reg->opaque);
+
+    REGFIELD_RESET(dev, s, RST_UART1, RESET, val64, s->cfg.uart[1]);
+    return val64;
+}
+
+static uint64_t crl_rst_gem0_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(reg->opaque);
+
+    REGFIELD_RESET(dev, s, RST_GEM0, RESET, val64, s->cfg.gem[0]);
+    return val64;
+}
+
+static uint64_t crl_rst_gem1_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(reg->opaque);
+
+    REGFIELD_RESET(dev, s, RST_GEM1, RESET, val64, s->cfg.gem[1]);
+    return val64;
+}
+
+static uint64_t crl_rst_usb_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(reg->opaque);
+
+    REGFIELD_RESET(dev, s, RST_USB0, RESET, val64, s->cfg.usb);
+    return val64;
+}
+
+static const RegisterAccessInfo crl_regs_info[] = {
+    {   .name = "ERR_CTRL",  .addr = A_ERR_CTRL,
+    },{ .name = "IR_STATUS",  .addr = A_IR_STATUS,
+        .w1c = 0x1,
+        .post_write = crl_status_postw,
+    },{ .name = "IR_MASK",  .addr = A_IR_MASK,
+        .reset = 0x1,
+        .ro = 0x1,
+    },{ .name = "IR_ENABLE",  .addr = A_IR_ENABLE,
+        .pre_write = crl_enable_prew,
+    },{ .name = "IR_DISABLE",  .addr = A_IR_DISABLE,
+        .pre_write = crl_disable_prew,
+    },{ .name = "WPROT",  .addr = A_WPROT,
+    },{ .name = "PLL_CLK_OTHER_DMN",  .addr = A_PLL_CLK_OTHER_DMN,
+        .reset = 0x1,
+        .rsvd = 0xe,
+    },{ .name = "RPLL_CTRL",  .addr = A_RPLL_CTRL,
+        .reset = 0x24809,
+        .rsvd = 0xf88c00f6,
+    },{ .name = "RPLL_CFG",  .addr = A_RPLL_CFG,
+        .reset = 0x2000000,
+        .rsvd = 0x1801210,
+    },{ .name = "RPLL_FRAC_CFG",  .addr = A_RPLL_FRAC_CFG,
+        .rsvd = 0x7e330000,
+    },{ .name = "PLL_STATUS",  .addr = A_PLL_STATUS,
+        .reset = R_PLL_STATUS_RPLL_STABLE_MASK |
+                 R_PLL_STATUS_RPLL_LOCK_MASK,
+        .rsvd = 0xfa,
+        .ro = 0x5,
+    },{ .name = "RPLL_TO_XPD_CTRL",  .addr = A_RPLL_TO_XPD_CTRL,
+        .reset = 0x2000100,
+        .rsvd = 0xfdfc00ff,
+    },{ .name = "LPD_TOP_SWITCH_CTRL",  .addr = A_LPD_TOP_SWITCH_CTRL,
+        .reset = 0x6000300,
+        .rsvd = 0xf9fc00f8,
+    },{ .name = "LPD_LSBUS_CTRL",  .addr = A_LPD_LSBUS_CTRL,
+        .reset = 0x2000800,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "CPU_R5_CTRL",  .addr = A_CPU_R5_CTRL,
+        .reset = 0xe000300,
+        .rsvd = 0xe1fc00f8,
+    },{ .name = "IOU_SWITCH_CTRL",  .addr = A_IOU_SWITCH_CTRL,
+        .reset = 0x2000500,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "GEM0_REF_CTRL",  .addr = A_GEM0_REF_CTRL,
+        .reset = 0xe000a00,
+        .rsvd = 0xf1fc00f8,
+    },{ .name = "GEM1_REF_CTRL",  .addr = A_GEM1_REF_CTRL,
+        .reset = 0xe000a00,
+        .rsvd = 0xf1fc00f8,
+    },{ .name = "GEM_TSU_REF_CTRL",  .addr = A_GEM_TSU_REF_CTRL,
+        .reset = 0x300,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "USB0_BUS_REF_CTRL",  .addr = A_USB0_BUS_REF_CTRL,
+        .reset = 0x2001900,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "UART0_REF_CTRL",  .addr = A_UART0_REF_CTRL,
+        .reset = 0xc00,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "UART1_REF_CTRL",  .addr = A_UART1_REF_CTRL,
+        .reset = 0xc00,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "SPI0_REF_CTRL",  .addr = A_SPI0_REF_CTRL,
+        .reset = 0x600,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "SPI1_REF_CTRL",  .addr = A_SPI1_REF_CTRL,
+        .reset = 0x600,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "CAN0_REF_CTRL",  .addr = A_CAN0_REF_CTRL,
+        .reset = 0xc00,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "CAN1_REF_CTRL",  .addr = A_CAN1_REF_CTRL,
+        .reset = 0xc00,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "I2C0_REF_CTRL",  .addr = A_I2C0_REF_CTRL,
+        .reset = 0xc00,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "I2C1_REF_CTRL",  .addr = A_I2C1_REF_CTRL,
+        .reset = 0xc00,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "DBG_LPD_CTRL",  .addr = A_DBG_LPD_CTRL,
+        .reset = 0x300,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "TIMESTAMP_REF_CTRL",  .addr = A_TIMESTAMP_REF_CTRL,
+        .reset = 0x2000c00,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "CRL_SAFETY_CHK",  .addr = A_CRL_SAFETY_CHK,
+    },{ .name = "PSM_REF_CTRL",  .addr = A_PSM_REF_CTRL,
+        .reset = 0xf04,
+        .rsvd = 0xfffc00f8,
+    },{ .name = "DBG_TSTMP_CTRL",  .addr = A_DBG_TSTMP_CTRL,
+        .reset = 0x300,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "CPM_TOPSW_REF_CTRL",  .addr = A_CPM_TOPSW_REF_CTRL,
+        .reset = 0x300,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "USB3_DUAL_REF_CTRL",  .addr = A_USB3_DUAL_REF_CTRL,
+        .reset = 0x3c00,
+        .rsvd = 0xfdfc00f8,
+    },{ .name = "RST_CPU_R5",  .addr = A_RST_CPU_R5,
+        .reset = 0x17,
+        .rsvd = 0x8,
+        .pre_write = crl_rst_r5_prew,
+    },{ .name = "RST_ADMA",  .addr = A_RST_ADMA,
+        .reset = 0x1,
+        .pre_write = crl_rst_adma_prew,
+    },{ .name = "RST_GEM0",  .addr = A_RST_GEM0,
+        .reset = 0x1,
+        .pre_write = crl_rst_gem0_prew,
+    },{ .name = "RST_GEM1",  .addr = A_RST_GEM1,
+        .reset = 0x1,
+        .pre_write = crl_rst_gem1_prew,
+    },{ .name = "RST_SPARE",  .addr = A_RST_SPARE,
+        .reset = 0x1,
+    },{ .name = "RST_USB0",  .addr = A_RST_USB0,
+        .reset = 0x1,
+        .pre_write = crl_rst_usb_prew,
+    },{ .name = "RST_UART0",  .addr = A_RST_UART0,
+        .reset = 0x1,
+        .pre_write = crl_rst_uart0_prew,
+    },{ .name = "RST_UART1",  .addr = A_RST_UART1,
+        .reset = 0x1,
+        .pre_write = crl_rst_uart1_prew,
+    },{ .name = "RST_SPI0",  .addr = A_RST_SPI0,
+        .reset = 0x1,
+    },{ .name = "RST_SPI1",  .addr = A_RST_SPI1,
+        .reset = 0x1,
+    },{ .name = "RST_CAN0",  .addr = A_RST_CAN0,
+        .reset = 0x1,
+    },{ .name = "RST_CAN1",  .addr = A_RST_CAN1,
+        .reset = 0x1,
+    },{ .name = "RST_I2C0",  .addr = A_RST_I2C0,
+        .reset = 0x1,
+    },{ .name = "RST_I2C1",  .addr = A_RST_I2C1,
+        .reset = 0x1,
+    },{ .name = "RST_DBG_LPD",  .addr = A_RST_DBG_LPD,
+        .reset = 0x33,
+        .rsvd = 0xcc,
+    },{ .name = "RST_GPIO",  .addr = A_RST_GPIO,
+        .reset = 0x1,
+    },{ .name = "RST_TTC",  .addr = A_RST_TTC,
+        .reset = 0xf,
+    },{ .name = "RST_TIMESTAMP",  .addr = A_RST_TIMESTAMP,
+        .reset = 0x1,
+    },{ .name = "RST_SWDT",  .addr = A_RST_SWDT,
+        .reset = 0x1,
+    },{ .name = "RST_OCM",  .addr = A_RST_OCM,
+    },{ .name = "RST_IPI",  .addr = A_RST_IPI,
+    },{ .name = "RST_FPD",  .addr = A_RST_FPD,
+        .reset = 0x3,
+    },{ .name = "PSM_RST_MODE",  .addr = A_PSM_RST_MODE,
+        .reset = 0x1,
+        .rsvd = 0xf8,
+    }
+};
+
+static void crl_reset_enter(Object *obj, ResetType type)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(obj);
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        register_reset(&s->regs_info[i]);
+    }
+}
+
+static void crl_reset_hold(Object *obj)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(obj);
+
+    crl_update_irq(s);
+}
+
+static const MemoryRegionOps crl_ops = {
+    .read = register_read_memory,
+    .write = register_write_memory,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static void crl_init(Object *obj)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    int i;
+
+    s->reg_array =
+        register_init_block32(DEVICE(obj), crl_regs_info,
+                              ARRAY_SIZE(crl_regs_info),
+                              s->regs_info, s->regs,
+                              &crl_ops,
+                              XLNX_VERSAL_CRL_ERR_DEBUG,
+                              CRL_R_MAX * 4);
+    sysbus_init_mmio(sbd, &s->reg_array->mem);
+    sysbus_init_irq(sbd, &s->irq);
+
+    for (i = 0; i < ARRAY_SIZE(s->cfg.cpu_r5); ++i) {
+        object_property_add_link(obj, "cpu_r5[*]", TYPE_ARM_CPU,
+                                 (Object **)&s->cfg.cpu_r5[i],
+                                 qdev_prop_allow_set_link_before_realize,
+                                 OBJ_PROP_LINK_STRONG);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(s->cfg.adma); ++i) {
+        object_property_add_link(obj, "adma[*]", TYPE_DEVICE,
+                                 (Object **)&s->cfg.adma[i],
+                                 qdev_prop_allow_set_link_before_realize,
+                                 OBJ_PROP_LINK_STRONG);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(s->cfg.uart); ++i) {
+        object_property_add_link(obj, "uart[*]", TYPE_DEVICE,
+                                 (Object **)&s->cfg.uart[i],
+                                 qdev_prop_allow_set_link_before_realize,
+                                 OBJ_PROP_LINK_STRONG);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(s->cfg.gem); ++i) {
+        object_property_add_link(obj, "gem[*]", TYPE_DEVICE,
+                                 (Object **)&s->cfg.gem[i],
+                                 qdev_prop_allow_set_link_before_realize,
+                                 OBJ_PROP_LINK_STRONG);
+    }
+
+    object_property_add_link(obj, "usb", TYPE_DEVICE,
+                             (Object **)&s->cfg.gem[i],
+                             qdev_prop_allow_set_link_before_realize,
+                             OBJ_PROP_LINK_STRONG);
+}
+
+static void crl_finalize(Object *obj)
+{
+    XlnxVersalCRL *s = XLNX_VERSAL_CRL(obj);
+    register_finalize_block(s->reg_array);
+}
+
+static const VMStateDescription vmstate_crl = {
+    .name = TYPE_XLNX_VERSAL_CRL,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, XlnxVersalCRL, CRL_R_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void crl_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_crl;
+
+    rc->phases.enter = crl_reset_enter;
+    rc->phases.hold = crl_reset_hold;
+}
+
+static const TypeInfo crl_info = {
+    .name          = TYPE_XLNX_VERSAL_CRL,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XlnxVersalCRL),
+    .class_init    = crl_class_init,
+    .instance_init = crl_init,
+    .instance_finalize = crl_finalize,
+};
+
+static void crl_register_types(void)
+{
+    type_register_static(&crl_info);
+}
+
+type_init(crl_register_types)
diff --git a/include/hw/misc/xlnx-versal-crl.h b/include/hw/misc/xlnx-versal-crl.h
new file mode 100644
index 0000000000..2857f4169a
--- /dev/null
+++ b/include/hw/misc/xlnx-versal-crl.h
@@ -0,0 +1,235 @@
+/*
+ * QEMU model of the Clock-Reset-LPD (CRL).
+ *
+ * Copyright (c) 2022 Xilinx Inc.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+ */
+#ifndef HW_MISC_XLNX_VERSAL_CRL_H
+#define HW_MISC_XLNX_VERSAL_CRL_H
+
+#include "hw/sysbus.h"
+#include "hw/register.h"
+#include "target/arm/cpu.h"
+
+#define TYPE_XLNX_VERSAL_CRL "xlnx,versal-crl"
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxVersalCRL, XLNX_VERSAL_CRL)
+
+REG32(ERR_CTRL, 0x0)
+    FIELD(ERR_CTRL, SLVERR_ENABLE, 0, 1)
+REG32(IR_STATUS, 0x4)
+    FIELD(IR_STATUS, ADDR_DECODE_ERR, 0, 1)
+REG32(IR_MASK, 0x8)
+    FIELD(IR_MASK, ADDR_DECODE_ERR, 0, 1)
+REG32(IR_ENABLE, 0xc)
+    FIELD(IR_ENABLE, ADDR_DECODE_ERR, 0, 1)
+REG32(IR_DISABLE, 0x10)
+    FIELD(IR_DISABLE, ADDR_DECODE_ERR, 0, 1)
+REG32(WPROT, 0x1c)
+    FIELD(WPROT, ACTIVE, 0, 1)
+REG32(PLL_CLK_OTHER_DMN, 0x20)
+    FIELD(PLL_CLK_OTHER_DMN, APLL_BYPASS, 0, 1)
+REG32(RPLL_CTRL, 0x40)
+    FIELD(RPLL_CTRL, POST_SRC, 24, 3)
+    FIELD(RPLL_CTRL, PRE_SRC, 20, 3)
+    FIELD(RPLL_CTRL, CLKOUTDIV, 16, 2)
+    FIELD(RPLL_CTRL, FBDIV, 8, 8)
+    FIELD(RPLL_CTRL, BYPASS, 3, 1)
+    FIELD(RPLL_CTRL, RESET, 0, 1)
+REG32(RPLL_CFG, 0x44)
+    FIELD(RPLL_CFG, LOCK_DLY, 25, 7)
+    FIELD(RPLL_CFG, LOCK_CNT, 13, 10)
+    FIELD(RPLL_CFG, LFHF, 10, 2)
+    FIELD(RPLL_CFG, CP, 5, 4)
+    FIELD(RPLL_CFG, RES, 0, 4)
+REG32(RPLL_FRAC_CFG, 0x48)
+    FIELD(RPLL_FRAC_CFG, ENABLED, 31, 1)
+    FIELD(RPLL_FRAC_CFG, SEED, 22, 3)
+    FIELD(RPLL_FRAC_CFG, ALGRTHM, 19, 1)
+    FIELD(RPLL_FRAC_CFG, ORDER, 18, 1)
+    FIELD(RPLL_FRAC_CFG, DATA, 0, 16)
+REG32(PLL_STATUS, 0x50)
+    FIELD(PLL_STATUS, RPLL_STABLE, 2, 1)
+    FIELD(PLL_STATUS, RPLL_LOCK, 0, 1)
+REG32(RPLL_TO_XPD_CTRL, 0x100)
+    FIELD(RPLL_TO_XPD_CTRL, CLKACT, 25, 1)
+    FIELD(RPLL_TO_XPD_CTRL, DIVISOR0, 8, 10)
+REG32(LPD_TOP_SWITCH_CTRL, 0x104)
+    FIELD(LPD_TOP_SWITCH_CTRL, CLKACT_ADMA, 26, 1)
+    FIELD(LPD_TOP_SWITCH_CTRL, CLKACT, 25, 1)
+    FIELD(LPD_TOP_SWITCH_CTRL, DIVISOR0, 8, 10)
+    FIELD(LPD_TOP_SWITCH_CTRL, SRCSEL, 0, 3)
+REG32(LPD_LSBUS_CTRL, 0x108)
+    FIELD(LPD_LSBUS_CTRL, CLKACT, 25, 1)
+    FIELD(LPD_LSBUS_CTRL, DIVISOR0, 8, 10)
+    FIELD(LPD_LSBUS_CTRL, SRCSEL, 0, 3)
+REG32(CPU_R5_CTRL, 0x10c)
+    FIELD(CPU_R5_CTRL, CLKACT_OCM2, 28, 1)
+    FIELD(CPU_R5_CTRL, CLKACT_OCM, 27, 1)
+    FIELD(CPU_R5_CTRL, CLKACT_CORE, 26, 1)
+    FIELD(CPU_R5_CTRL, CLKACT, 25, 1)
+    FIELD(CPU_R5_CTRL, DIVISOR0, 8, 10)
+    FIELD(CPU_R5_CTRL, SRCSEL, 0, 3)
+REG32(IOU_SWITCH_CTRL, 0x114)
+    FIELD(IOU_SWITCH_CTRL, CLKACT, 25, 1)
+    FIELD(IOU_SWITCH_CTRL, DIVISOR0, 8, 10)
+    FIELD(IOU_SWITCH_CTRL, SRCSEL, 0, 3)
+REG32(GEM0_REF_CTRL, 0x118)
+    FIELD(GEM0_REF_CTRL, CLKACT_RX, 27, 1)
+    FIELD(GEM0_REF_CTRL, CLKACT_TX, 26, 1)
+    FIELD(GEM0_REF_CTRL, CLKACT, 25, 1)
+    FIELD(GEM0_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(GEM0_REF_CTRL, SRCSEL, 0, 3)
+REG32(GEM1_REF_CTRL, 0x11c)
+    FIELD(GEM1_REF_CTRL, CLKACT_RX, 27, 1)
+    FIELD(GEM1_REF_CTRL, CLKACT_TX, 26, 1)
+    FIELD(GEM1_REF_CTRL, CLKACT, 25, 1)
+    FIELD(GEM1_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(GEM1_REF_CTRL, SRCSEL, 0, 3)
+REG32(GEM_TSU_REF_CTRL, 0x120)
+    FIELD(GEM_TSU_REF_CTRL, CLKACT, 25, 1)
+    FIELD(GEM_TSU_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(GEM_TSU_REF_CTRL, SRCSEL, 0, 3)
+REG32(USB0_BUS_REF_CTRL, 0x124)
+    FIELD(USB0_BUS_REF_CTRL, CLKACT, 25, 1)
+    FIELD(USB0_BUS_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(USB0_BUS_REF_CTRL, SRCSEL, 0, 3)
+REG32(UART0_REF_CTRL, 0x128)
+    FIELD(UART0_REF_CTRL, CLKACT, 25, 1)
+    FIELD(UART0_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(UART0_REF_CTRL, SRCSEL, 0, 3)
+REG32(UART1_REF_CTRL, 0x12c)
+    FIELD(UART1_REF_CTRL, CLKACT, 25, 1)
+    FIELD(UART1_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(UART1_REF_CTRL, SRCSEL, 0, 3)
+REG32(SPI0_REF_CTRL, 0x130)
+    FIELD(SPI0_REF_CTRL, CLKACT, 25, 1)
+    FIELD(SPI0_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(SPI0_REF_CTRL, SRCSEL, 0, 3)
+REG32(SPI1_REF_CTRL, 0x134)
+    FIELD(SPI1_REF_CTRL, CLKACT, 25, 1)
+    FIELD(SPI1_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(SPI1_REF_CTRL, SRCSEL, 0, 3)
+REG32(CAN0_REF_CTRL, 0x138)
+    FIELD(CAN0_REF_CTRL, CLKACT, 25, 1)
+    FIELD(CAN0_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(CAN0_REF_CTRL, SRCSEL, 0, 3)
+REG32(CAN1_REF_CTRL, 0x13c)
+    FIELD(CAN1_REF_CTRL, CLKACT, 25, 1)
+    FIELD(CAN1_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(CAN1_REF_CTRL, SRCSEL, 0, 3)
+REG32(I2C0_REF_CTRL, 0x140)
+    FIELD(I2C0_REF_CTRL, CLKACT, 25, 1)
+    FIELD(I2C0_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(I2C0_REF_CTRL, SRCSEL, 0, 3)
+REG32(I2C1_REF_CTRL, 0x144)
+    FIELD(I2C1_REF_CTRL, CLKACT, 25, 1)
+    FIELD(I2C1_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(I2C1_REF_CTRL, SRCSEL, 0, 3)
+REG32(DBG_LPD_CTRL, 0x148)
+    FIELD(DBG_LPD_CTRL, CLKACT, 25, 1)
+    FIELD(DBG_LPD_CTRL, DIVISOR0, 8, 10)
+    FIELD(DBG_LPD_CTRL, SRCSEL, 0, 3)
+REG32(TIMESTAMP_REF_CTRL, 0x14c)
+    FIELD(TIMESTAMP_REF_CTRL, CLKACT, 25, 1)
+    FIELD(TIMESTAMP_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(TIMESTAMP_REF_CTRL, SRCSEL, 0, 3)
+REG32(CRL_SAFETY_CHK, 0x150)
+REG32(PSM_REF_CTRL, 0x154)
+    FIELD(PSM_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(PSM_REF_CTRL, SRCSEL, 0, 3)
+REG32(DBG_TSTMP_CTRL, 0x158)
+    FIELD(DBG_TSTMP_CTRL, CLKACT, 25, 1)
+    FIELD(DBG_TSTMP_CTRL, DIVISOR0, 8, 10)
+    FIELD(DBG_TSTMP_CTRL, SRCSEL, 0, 3)
+REG32(CPM_TOPSW_REF_CTRL, 0x15c)
+    FIELD(CPM_TOPSW_REF_CTRL, CLKACT, 25, 1)
+    FIELD(CPM_TOPSW_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(CPM_TOPSW_REF_CTRL, SRCSEL, 0, 3)
+REG32(USB3_DUAL_REF_CTRL, 0x160)
+    FIELD(USB3_DUAL_REF_CTRL, CLKACT, 25, 1)
+    FIELD(USB3_DUAL_REF_CTRL, DIVISOR0, 8, 10)
+    FIELD(USB3_DUAL_REF_CTRL, SRCSEL, 0, 3)
+REG32(RST_CPU_R5, 0x300)
+    FIELD(RST_CPU_R5, RESET_PGE, 4, 1)
+    FIELD(RST_CPU_R5, RESET_AMBA, 2, 1)
+    FIELD(RST_CPU_R5, RESET_CPU1, 1, 1)
+    FIELD(RST_CPU_R5, RESET_CPU0, 0, 1)
+REG32(RST_ADMA, 0x304)
+    FIELD(RST_ADMA, RESET, 0, 1)
+REG32(RST_GEM0, 0x308)
+    FIELD(RST_GEM0, RESET, 0, 1)
+REG32(RST_GEM1, 0x30c)
+    FIELD(RST_GEM1, RESET, 0, 1)
+REG32(RST_SPARE, 0x310)
+    FIELD(RST_SPARE, RESET, 0, 1)
+REG32(RST_USB0, 0x314)
+    FIELD(RST_USB0, RESET, 0, 1)
+REG32(RST_UART0, 0x318)
+    FIELD(RST_UART0, RESET, 0, 1)
+REG32(RST_UART1, 0x31c)
+    FIELD(RST_UART1, RESET, 0, 1)
+REG32(RST_SPI0, 0x320)
+    FIELD(RST_SPI0, RESET, 0, 1)
+REG32(RST_SPI1, 0x324)
+    FIELD(RST_SPI1, RESET, 0, 1)
+REG32(RST_CAN0, 0x328)
+    FIELD(RST_CAN0, RESET, 0, 1)
+REG32(RST_CAN1, 0x32c)
+    FIELD(RST_CAN1, RESET, 0, 1)
+REG32(RST_I2C0, 0x330)
+    FIELD(RST_I2C0, RESET, 0, 1)
+REG32(RST_I2C1, 0x334)
+    FIELD(RST_I2C1, RESET, 0, 1)
+REG32(RST_DBG_LPD, 0x338)
+    FIELD(RST_DBG_LPD, RPU_DBG1_RESET, 5, 1)
+    FIELD(RST_DBG_LPD, RPU_DBG0_RESET, 4, 1)
+    FIELD(RST_DBG_LPD, RESET_HSDP, 1, 1)
+    FIELD(RST_DBG_LPD, RESET, 0, 1)
+REG32(RST_GPIO, 0x33c)
+    FIELD(RST_GPIO, RESET, 0, 1)
+REG32(RST_TTC, 0x344)
+    FIELD(RST_TTC, TTC3_RESET, 3, 1)
+    FIELD(RST_TTC, TTC2_RESET, 2, 1)
+    FIELD(RST_TTC, TTC1_RESET, 1, 1)
+    FIELD(RST_TTC, TTC0_RESET, 0, 1)
+REG32(RST_TIMESTAMP, 0x348)
+    FIELD(RST_TIMESTAMP, RESET, 0, 1)
+REG32(RST_SWDT, 0x34c)
+    FIELD(RST_SWDT, RESET, 0, 1)
+REG32(RST_OCM, 0x350)
+    FIELD(RST_OCM, RESET, 0, 1)
+REG32(RST_IPI, 0x354)
+    FIELD(RST_IPI, RESET, 0, 1)
+REG32(RST_SYSMON, 0x358)
+    FIELD(RST_SYSMON, SEQ_RST, 1, 1)
+    FIELD(RST_SYSMON, CFG_RST, 0, 1)
+REG32(RST_FPD, 0x360)
+    FIELD(RST_FPD, SRST, 1, 1)
+    FIELD(RST_FPD, POR, 0, 1)
+REG32(PSM_RST_MODE, 0x370)
+    FIELD(PSM_RST_MODE, WAKEUP, 2, 1)
+    FIELD(PSM_RST_MODE, RST_MODE, 0, 2)
+
+#define CRL_R_MAX (R_PSM_RST_MODE + 1)
+
+#define RPU_MAX_CPU 2
+
+struct XlnxVersalCRL {
+    SysBusDevice parent_obj;
+    qemu_irq irq;
+
+    struct {
+        ARMCPU *cpu_r5[RPU_MAX_CPU];
+        DeviceState *adma[8];
+        DeviceState *uart[2];
+        DeviceState *gem[2];
+        DeviceState *usb;
+    } cfg;
+
+    RegisterInfoArray *reg_array;
+    uint32_t regs[CRL_R_MAX];
+    RegisterInfo regs_info[CRL_R_MAX];
+};
+#endif
-- 
2.25.1


