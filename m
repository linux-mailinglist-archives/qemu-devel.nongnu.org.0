Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A841F6451D9
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 03:16:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2jwd-0000Nm-6D; Tue, 06 Dec 2022 21:13:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1p2jwW-0000Mw-T5
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 21:13:52 -0500
Received: from mail-mw2nam12on2062f.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::62f]
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1p2jwU-00089E-3S
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 21:13:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7+sFBobzxpFfxGJZADplZssI807imYrQgpV/Vc4E4Y0P4VCiCLzL4p1aSobgI5rLYUMovg93yZJ5aRf9A6rZE0UuD4DOyGh9yv5DTPBm7KgVzOUHXLZXT+AzRVoM8TazkTN+V9k4+bMz4KXSlYT2n7cseuekHPPfjWr/kIbTRBRCnK4yjs3ILEvPvqLLf6NenJgwLcngDjPLykO0GMvHilG4J3oEs3qVSUxquRb8wzh2Dqw3f+OKDOUEPpG1zQP+ZfIyiHfEtwotHIBcyhxZae6/98R5fcUp0UIsIJ+o0tRTZsszgV/Wf0rbAOLJ3BVm4Bih2od2YVzwx4rYweMiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onrecn6/JEbUYP/rdo3UabBqv0FzJ/fpvuC1y3iqRiQ=;
 b=nsyzkrkCmKZlHm3N7XB9ENnXPWYqJGMkUZuAoQv8rPePeIUmnz5ESx2gULc3X+P71h5z8EooE8ITJggvdTBVjin/CSoTQDELDPnJNB8OAixiFOxdddmH8X5hfptbgciVeRfv55+Mg9yt8XoOXlOcOGSuF9cvqhGhIn8giGXhjh8A1gaV+C1NpWQvoevGHq/gKVLgHszCYlyv/cXP+9yxDdX0mXgzv+tgbnDTsZWuD4nmiaOUQQc56/mivHOvkt6M++v4MbSZv7ScpvAlmG+MYkbbNzLgYLVurUpGxA2ZKVr3FUzr5krdII0tbxeoxZbAR9cLjcKo/erpcbEkQ4NVSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onrecn6/JEbUYP/rdo3UabBqv0FzJ/fpvuC1y3iqRiQ=;
 b=e0qHCRoTy8izmEAJLQ4gDlXEJzdFHJOiFfpDbZhlS+fj/9Al870E2B7Oq/xra0RGJRPuy6DLi9Jl6YoZxyotIw4BvM57HiQ3D5y9+1o8CywFlgRSJsFplH9CG7H06WkaE5iaEbv33yr7KoNLUZsyJjVQVAWKMovCce+yVCXDXAs=
Received: from DS7PR03CA0191.namprd03.prod.outlook.com (2603:10b6:5:3b6::16)
 by MN2PR12MB4096.namprd12.prod.outlook.com (2603:10b6:208:1dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 02:13:46 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::bb) by DS7PR03CA0191.outlook.office365.com
 (2603:10b6:5:3b6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 02:13:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.14 via Frontend Transport; Wed, 7 Dec 2022 02:13:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Dec
 2022 20:13:43 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Dec 2022 20:13:42 -0600
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <francisco.iglesias@amd.com>, <peter.maydell@linaro.org>,
 <vikram.garhwal@amd.com>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [QEMU][PATCH v3 4/4] tests/qtest: Introduce tests for Xilinx VERSAL
 CANFD controller
Date: Tue, 6 Dec 2022 18:13:22 -0800
Message-ID: <20221207021322.16165-6-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207021322.16165-1-vikram.garhwal@amd.com>
References: <20221207021322.16165-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT039:EE_|MN2PR12MB4096:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ed8c46b-b553-4110-b16e-08dad7f8aba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7zhlF4Ok63jsis2ZYbuTkBpjguvghef+yL3gDnuaP7+MPED+9253Ge752bMJE8kIOQ8ZYlxpxnMopzfOVxJCTLTiAqtBqv1DujlufUZIvYn/yHbDEI8wjm2ESuMB2AmFqzdba15+Aux9ykeJQNVSlbGtT0dld3U+xalFcrswisysBFc43OrYjEt5Z2CQWtNaRRmus057AX5iH4G4BvJhKm2tgz0XStMIX3QTIn7pKBesBKq2ERP25SaDMxAPBYVErRuG0lTu0MvIGBtg5Lj4vfOazIi5QlFF6ipsJ6r9zAZr2gi+iVkZBTDG7rFieQAhOEuDGeekvIqDqPiHcTeEBfnor9cP/cL+6t0i0Ir6e/WrIYPn9z1/T0KTz0Mu5+lxEQHiyi9t/ZVpE1dxdKkTDvMJBfwDgD/SIGO2u/I4ffES8a85ME9453TbJBO/dhaOCofU2r7rMI9dei7koB2ONh0omyGuQZnAFYS/Hz2k2hC70jHPhDYj3tVq2EwyD8f/qnoOK2LXAnN7p/tkSpzpdzThIXi3RkfXg5BKeECBlyoqv7VMVjxw1N2qeC+bfHO3FP81ZIhfhrsDcTGtHi9/F0KV5U9AAtv/m3OC6Hks96JXdXfJafYzoffS8sm+nDf1dkpo5arV2eTiFXYuwQFQmy2Zs6VJKsSF/NjH775EKluuvk53KxyGIUxoLitZ9xR4/2Bzr4vybeCrjEQjtJEltNv2MpQDi4FWyhXt361jVhw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199015)(46966006)(36840700001)(40470700004)(83380400001)(6916009)(54906003)(70206006)(6666004)(70586007)(478600001)(41300700001)(2616005)(316002)(82310400005)(40480700001)(40460700003)(36860700001)(36756003)(186003)(26005)(4326008)(1076003)(8676002)(2906002)(86362001)(356005)(81166007)(66899015)(47076005)(5660300002)(426003)(82740400003)(8936002)(30864003)(336012)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 02:13:45.7254 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed8c46b-b553-4110-b16e-08dad7f8aba6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4096
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::62f;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The QTests perform three tests on the Xilinx VERSAL CANFD controller:
    Tests the CANFD controllers in loopback.
    Tests the CANFD controllers in normal mode with CAN frame.
    Tests the CANFD controllers in normal mode with CANFD frame.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
---
 tests/qtest/meson.build       |   1 +
 tests/qtest/xlnx-canfd-test.c | 422 ++++++++++++++++++++++++++++++++++
 2 files changed, 423 insertions(+)
 create mode 100644 tests/qtest/xlnx-canfd-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c07a5b1a5f..9486ebee24 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -213,6 +213,7 @@ qtests_aarch64 = \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
   (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_XLNX_VERSAL') ? ['xlnx-canfd-test'] : []) + \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
diff --git a/tests/qtest/xlnx-canfd-test.c b/tests/qtest/xlnx-canfd-test.c
new file mode 100644
index 0000000000..4ccc0267d4
--- /dev/null
+++ b/tests/qtest/xlnx-canfd-test.c
@@ -0,0 +1,422 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * QTests for the Xilinx Versal CANFD controller.
+ *
+ * Copyright (c) 2022 AMD Inc.
+ *
+ * Written-by: Vikram Garhwal<vikram.garhwal@amd.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+
+/* Base address. */
+#define CANFD0_BASE_ADDR                0xff060000
+#define CANFD1_BASE_ADDR                0xff070000
+
+/* Register addresses. */
+#define R_SRR_OFFSET                    0x00
+#define R_MSR_OFFSET                    0x04
+#define R_FILTER_CONTROL_REGISTER       0xe0
+#define R_SR_OFFSET                     0x18
+#define R_ISR_OFFSET                    0x1c
+#define R_IER_OFFSET                    0x20
+#define R_ICR_OFFSET                    0x24
+#define R_TX_READY_REQ_REGISTER         0x90
+#define RX_FIFO_STATUS_REGISTER         0xe8
+#define R_TXID_OFFSET                   0x100
+#define R_TXDLC_OFFSET                  0x104
+#define R_TXDATA1_OFFSET                0x108
+#define R_TXDATA2_OFFSET                0x10c
+#define R_AFMR_REGISTER0                0xa00
+#define R_AFIR_REGISTER0                0xa04
+#define R_RX0_ID_OFFSET                 0x2100
+#define R_RX0_DLC_OFFSET                0x2104
+#define R_RX0_DATA1_OFFSET              0x2108
+#define R_RX0_DATA2_OFFSET              0x210c
+
+/* CANFD modes. */
+#define SRR_CONFIG_MODE                 0x00
+#define MSR_NORMAL_MODE                 0x00
+#define MSR_LOOPBACK_MODE               (1 << 1)
+#define ENABLE_CANFD                    (1 << 1)
+
+/* CANFD status. */
+#define STATUS_CONFIG_MODE              (1 << 0)
+#define STATUS_NORMAL_MODE              (1 << 3)
+#define STATUS_LOOPBACK_MODE            (1 << 1)
+#define ISR_TXOK                        (1 << 1)
+#define ISR_RXOK                        (1 << 4)
+
+#define ENABLE_ALL_FILTERS              0xffffffff
+#define ENABLE_ALL_INTERRUPTS           0xffffffff
+
+/* We are sending one canfd message. */
+#define TX_READY_REG_VAL                0x1
+
+#define FIRST_RX_STORE_INDEX            0x1
+#define STATUS_REG_MASK                 0xf
+#define DLC_FD_BIT_SHIFT                0x1b
+#define DLC_FD_BIT_MASK                 0xf8000000
+#define FIFO_STATUS_READ_INDEX_MASK     0x3f
+#define FIFO_STATUS_FILL_LEVEL_MASK     0x7f00
+#define FILL_LEVEL_SHIFT                0x8
+
+/* CANFD frame size ID, DLC and 16 DATA word. */
+#define CANFD_FRAME_SIZE        18
+/* CAN frame size ID, DLC and 2 DATA word. */
+#define CAN_FRAME_SIZE          4
+
+/* Set the filters for CANFD controller. */
+static void enable_filters(QTestState *qts)
+{
+     const uint32_t arr_afmr[32] = { 0xb423deaa, 0xa2a40bdc, 0x1b64f486,
+                                     0x95c0d4ee, 0xe0c44528, 0x4b407904,
+                                     0xd2673f46, 0x9fc638d6, 0x8844f3d8,
+                                     0xa607d1e8, 0x67871bf4, 0xc2557dc,
+                                     0x9ea5b53e, 0x3643c0cc, 0x5a05ea8e,
+                                     0x83a46d84, 0x4a25c2b8, 0x93a66008,
+                                     0x2e467470, 0xedc66118, 0x9086f9f2,
+                                     0xfa23dd36, 0xb6654b90, 0xb221b8ca,
+                                     0x3467d1e2, 0xa3a55542, 0x5b26a012,
+                                     0x2281ea7e, 0xcea0ece8, 0xdc61e588,
+                                     0x2e5676a,  0x16821320 };
+
+    const uint32_t arr_afir[32] = { 0xa833dfa1, 0x255a477e, 0x3a4bb1c5,
+                                    0x8f560a6c, 0x27f38903, 0x2fecec4d,
+                                    0xa014c66d, 0xec289b8,  0x7e52dead,
+                                    0x82e94f3c, 0xcf3e3c5c, 0x66059871,
+                                    0x3f213df4, 0x25ac3959, 0xa12e9bef,
+                                    0xa3ad3af,  0xbafd7fe,  0xb3cb40fd,
+                                    0x5d9caa81, 0x2ed61902, 0x7cd64a0,
+                                    0x4b1fa538, 0x9b5ced8c, 0x150de059,
+                                    0xd2794227, 0x635e820a, 0xbb6b02cf,
+                                    0xbb58176,  0x570025bb, 0xa78d9658,
+                                    0x49d735df, 0xe5399d2f };
+
+    /* Passing the respective array values to all the AFMR and AFIR pairs. */
+    for (int i = 0; i < 32; i++) {
+        /* For CANFD0. */
+       qtest_writel(qts, CANFD0_BASE_ADDR + R_AFMR_REGISTER0 + 8 * i,
+                    arr_afmr[i]);
+       qtest_writel(qts, CANFD0_BASE_ADDR + R_AFIR_REGISTER0 + 8 * i,
+                    arr_afir[i]);
+
+        /* For CANFD1. */
+       qtest_writel(qts, CANFD1_BASE_ADDR + R_AFMR_REGISTER0 + 8 * i,
+                    arr_afmr[i]);
+       qtest_writel(qts, CANFD1_BASE_ADDR + R_AFIR_REGISTER0 + 8 * i,
+                    arr_afir[i]);
+    }
+
+    /* Enable all the pairs from AFR register. */
+    qtest_writel(qts, CANFD0_BASE_ADDR + R_FILTER_CONTROL_REGISTER,
+                 ENABLE_ALL_FILTERS);
+    qtest_writel(qts, CANFD1_BASE_ADDR + R_FILTER_CONTROL_REGISTER,
+                 ENABLE_ALL_FILTERS);
+}
+
+static void configure_canfd(QTestState *qts, uint8_t mode)
+{
+    uint32_t status = 0;
+
+    /* Put CANFD0 and CANFD1 in config mode. */
+    qtest_writel(qts, CANFD0_BASE_ADDR + R_SRR_OFFSET, SRR_CONFIG_MODE);
+    qtest_writel(qts, CANFD1_BASE_ADDR + R_SRR_OFFSET, SRR_CONFIG_MODE);
+
+    /* Write mode of operation in Mode select register. */
+    qtest_writel(qts, CANFD0_BASE_ADDR + R_MSR_OFFSET, mode);
+    qtest_writel(qts, CANFD1_BASE_ADDR + R_MSR_OFFSET, mode);
+
+    enable_filters(qts);
+
+    /* Check here if CANFD0 and CANFD1 are in config mode. */
+    status = qtest_readl(qts, CANFD0_BASE_ADDR + R_SR_OFFSET);
+    status = status & STATUS_REG_MASK;
+    g_assert_cmpint(status, ==, STATUS_CONFIG_MODE);
+
+    status = qtest_readl(qts, CANFD1_BASE_ADDR + R_SR_OFFSET);
+    status = status & STATUS_REG_MASK;
+    g_assert_cmpint(status, ==, STATUS_CONFIG_MODE);
+
+    qtest_writel(qts, CANFD1_BASE_ADDR + R_IER_OFFSET, ENABLE_ALL_INTERRUPTS);
+    qtest_writel(qts, CANFD1_BASE_ADDR + R_IER_OFFSET, ENABLE_ALL_INTERRUPTS);
+
+    qtest_writel(qts, CANFD0_BASE_ADDR + R_SRR_OFFSET, ENABLE_CANFD);
+    qtest_writel(qts, CANFD1_BASE_ADDR + R_SRR_OFFSET, ENABLE_CANFD);
+}
+
+static void generate_random_data(uint32_t *buf_tx, bool is_canfd_frame)
+{
+    /* Generate random TX data for CANFD frame. */
+    if (is_canfd_frame) {
+        for (int i = 0; i < CANFD_FRAME_SIZE - 2; i++) {
+            buf_tx[2 + i] = rand();
+        }
+    } else {
+        /* Generate random TX data for CAN frame. */
+        for (int i = 0; i < CAN_FRAME_SIZE - 2; i++) {
+            buf_tx[2 + i] = rand();
+        }
+    }
+}
+
+static void read_data(QTestState *qts, uint64_t can_base_addr, uint32_t *buf_rx)
+{
+    uint32_t int_status;
+    uint32_t fifo_status_reg_value;
+    /* At which RX FIFO the received data is stored. */
+    uint8_t store_ind = 0;
+    bool is_canfd_frame = false;
+
+    /* Read the interrupt on CANFD rx. */
+    int_status = qtest_readl(qts, can_base_addr + R_ISR_OFFSET) & ISR_RXOK;
+
+    g_assert_cmpint(int_status, ==, ISR_RXOK);
+
+    /* Find the fill level and read index. */
+    fifo_status_reg_value = qtest_readl(qts, can_base_addr +
+                                        RX_FIFO_STATUS_REGISTER);
+
+    store_ind = (fifo_status_reg_value & FIFO_STATUS_READ_INDEX_MASK) +
+                ((fifo_status_reg_value & FIFO_STATUS_FILL_LEVEL_MASK) >>
+                  FILL_LEVEL_SHIFT);
+
+    g_assert_cmpint(store_ind, ==, FIRST_RX_STORE_INDEX);
+
+    /* Read the RX register data for CANFD. */
+    buf_rx[0] = qtest_readl(qts, can_base_addr + R_RX0_ID_OFFSET);
+    buf_rx[1] = qtest_readl(qts, can_base_addr + R_RX0_DLC_OFFSET);
+
+    is_canfd_frame = (buf_rx[1] >> DLC_FD_BIT_SHIFT) & 1;
+
+    if (is_canfd_frame) {
+        for (int i = 0; i < CANFD_FRAME_SIZE - 2; i++) {
+            buf_rx[i + 2] = qtest_readl(qts,
+                                    can_base_addr + R_RX0_DATA1_OFFSET + 4 * i);
+        }
+    } else {
+        buf_rx[2] = qtest_readl(qts, can_base_addr + R_RX0_DATA1_OFFSET);
+        buf_rx[3] = qtest_readl(qts, can_base_addr + R_RX0_DATA2_OFFSET);
+    }
+
+    /* Clear the RX interrupt. */
+    qtest_writel(qts, CANFD1_BASE_ADDR + R_ICR_OFFSET, ISR_RXOK);
+}
+
+static void write_data(QTestState *qts, uint64_t can_base_addr,
+                       const uint32_t *buf_tx, bool is_canfd_frame)
+{
+    /* Write the TX register data for CANFD. */
+    qtest_writel(qts, can_base_addr + R_TXID_OFFSET, buf_tx[0]);
+    qtest_writel(qts, can_base_addr + R_TXDLC_OFFSET, buf_tx[1]);
+
+    if (is_canfd_frame) {
+        for (int i = 0; i < CANFD_FRAME_SIZE - 2; i++) {
+            qtest_writel(qts, can_base_addr + R_TXDATA1_OFFSET + 4 * i,
+                         buf_tx[2 + i]);
+        }
+    } else {
+        qtest_writel(qts, can_base_addr + R_TXDATA1_OFFSET, buf_tx[2]);
+        qtest_writel(qts, can_base_addr + R_TXDATA2_OFFSET, buf_tx[3]);
+    }
+}
+
+static void send_data(QTestState *qts, uint64_t can_base_addr)
+{
+    uint32_t int_status;
+
+    qtest_writel(qts, can_base_addr + R_TX_READY_REQ_REGISTER,
+                 TX_READY_REG_VAL);
+
+    /* Read the interrupt on CANFD for tx. */
+    int_status = qtest_readl(qts, can_base_addr + R_ISR_OFFSET) & ISR_TXOK;
+
+    g_assert_cmpint(int_status, ==, ISR_TXOK);
+
+    /* Clear the interrupt for tx. */
+    qtest_writel(qts, CANFD0_BASE_ADDR + R_ICR_OFFSET, ISR_TXOK);
+}
+
+static void match_rx_tx_data(const uint32_t *buf_tx, const uint32_t *buf_rx,
+                             bool is_canfd_frame)
+{
+    uint16_t size = 0;
+    uint8_t len = CAN_FRAME_SIZE;
+
+    if (is_canfd_frame) {
+        len = CANFD_FRAME_SIZE;
+    }
+
+    while (size < len) {
+        if (R_RX0_ID_OFFSET + 4 * size == R_RX0_DLC_OFFSET)  {
+            g_assert_cmpint((buf_rx[size] & DLC_FD_BIT_MASK), ==,
+                            (buf_tx[size] & DLC_FD_BIT_MASK));
+        } else {
+            if (!is_canfd_frame && size == 4) {
+                break;
+            }
+
+            g_assert_cmpint(buf_rx[size], ==, buf_tx[size]);
+        }
+
+        size++;
+    }
+}
+/*
+ * Xilinx CANFD supports both CAN and CANFD frames. This test will be
+ * transferring CAN frame i.e. 8 bytes of data from CANFD0 and CANFD1 through
+ * canbus. CANFD0 initiate the data transfer to can-bus, CANFD1 receives the
+ * data. Test compares the can frame data sent from CANFD0 and received on
+ * CANFD1.
+ */
+static void test_can_data_transfer(void)
+{
+    uint32_t buf_tx[CAN_FRAME_SIZE] = { 0x5a5bb9a4, 0x80000000,
+                                        0x12345678, 0x87654321 };
+    uint32_t buf_rx[CAN_FRAME_SIZE] = { 0x00, 0x00, 0x00, 0x00 };
+    uint32_t status = 0;
+
+    generate_random_data(buf_tx, false);
+
+    QTestState *qts = qtest_init("-machine xlnx-versal-virt"
+                " -object can-bus,id=canbus"
+                " -machine canbus0=canbus"
+                " -machine canbus1=canbus"
+                );
+
+    configure_canfd(qts, MSR_NORMAL_MODE);
+
+    /* Check if CANFD0 and CANFD1 are in Normal mode. */
+    status = qtest_readl(qts, CANFD0_BASE_ADDR + R_SR_OFFSET);
+    status = status & STATUS_REG_MASK;
+    g_assert_cmpint(status, ==, STATUS_NORMAL_MODE);
+
+    status = qtest_readl(qts, CANFD1_BASE_ADDR + R_SR_OFFSET);
+    status = status & STATUS_REG_MASK;
+    g_assert_cmpint(status, ==, STATUS_NORMAL_MODE);
+
+    write_data(qts, CANFD0_BASE_ADDR, buf_tx, false);
+
+    send_data(qts, CANFD0_BASE_ADDR);
+    read_data(qts, CANFD1_BASE_ADDR, buf_rx);
+    match_rx_tx_data(buf_tx, buf_rx, false);
+
+    qtest_quit(qts);
+}
+
+/*
+ * This test will be transferring CANFD frame i.e. 64 bytes of data from CANFD0
+ * and CANFD1 through canbus. CANFD0 initiate the data transfer to can-bus,
+ * CANFD1 receives the data. Test compares the CANFD frame data sent from CANFD0
+ * with received on CANFD1.
+ */
+static void test_canfd_data_transfer(void)
+{
+    uint32_t buf_tx[CANFD_FRAME_SIZE] = { 0x5a5bb9a4, 0xf8000000 };
+    uint32_t buf_rx[CANFD_FRAME_SIZE] = { 0x00, 0x00, 0x00, 0x00 };
+    uint32_t status = 0;
+
+    generate_random_data(buf_tx, true);
+
+    QTestState *qts = qtest_init("-machine xlnx-versal-virt"
+                " -object can-bus,id=canbus"
+                " -machine canbus0=canbus"
+                " -machine canbus1=canbus"
+                );
+
+    configure_canfd(qts, MSR_NORMAL_MODE);
+
+    /* Check if CANFD0 and CANFD1 are in Normal mode. */
+    status = qtest_readl(qts, CANFD0_BASE_ADDR + R_SR_OFFSET);
+    status = status & STATUS_REG_MASK;
+    g_assert_cmpint(status, ==, STATUS_NORMAL_MODE);
+
+    status = qtest_readl(qts, CANFD1_BASE_ADDR + R_SR_OFFSET);
+    status = status & STATUS_REG_MASK;
+    g_assert_cmpint(status, ==, STATUS_NORMAL_MODE);
+
+    write_data(qts, CANFD0_BASE_ADDR, buf_tx, true);
+
+    send_data(qts, CANFD0_BASE_ADDR);
+    read_data(qts, CANFD1_BASE_ADDR, buf_rx);
+    match_rx_tx_data(buf_tx, buf_rx, true);
+
+    qtest_quit(qts);
+}
+
+/*
+ * This test is performing loopback mode on CANFD0 and CANFD1. Data sent from
+ * TX of each CANFD0 and CANFD1 are compared with RX register data for
+ * respective CANFD Controller.
+ */
+static void test_can_loopback(void)
+{
+    uint32_t buf_tx[CANFD_FRAME_SIZE] = { 0x5a5bb9a4, 0xf8000000 };
+    uint32_t buf_rx[CANFD_FRAME_SIZE] = { 0x00, 0x00, 0x00, 0x00 };
+    uint32_t status = 0;
+
+    generate_random_data(buf_tx, true);
+
+    QTestState *qts = qtest_init("-machine xlnx-versal-virt"
+                " -object can-bus,id=canbus"
+                " -machine canbus0=canbus"
+                " -machine canbus1=canbus"
+                );
+
+    configure_canfd(qts, MSR_LOOPBACK_MODE);
+
+    /* Check if CANFD0 and CANFD1 are set in correct loopback mode. */
+    status = qtest_readl(qts, CANFD0_BASE_ADDR + R_SR_OFFSET);
+    status = status & STATUS_REG_MASK;
+    g_assert_cmpint(status, ==, STATUS_LOOPBACK_MODE);
+
+    status = qtest_readl(qts, CANFD1_BASE_ADDR + R_SR_OFFSET);
+    status = status & STATUS_REG_MASK;
+    g_assert_cmpint(status, ==, STATUS_LOOPBACK_MODE);
+
+    write_data(qts, CANFD0_BASE_ADDR, buf_tx, true);
+
+    send_data(qts, CANFD0_BASE_ADDR);
+    read_data(qts, CANFD0_BASE_ADDR, buf_rx);
+    match_rx_tx_data(buf_tx, buf_rx, true);
+
+    generate_random_data(buf_tx, true);
+
+    write_data(qts, CANFD1_BASE_ADDR, buf_tx, true);
+
+    send_data(qts, CANFD1_BASE_ADDR);
+    read_data(qts, CANFD1_BASE_ADDR, buf_rx);
+    match_rx_tx_data(buf_tx, buf_rx, true);
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/net/canfd/can_data_transfer", test_can_data_transfer);
+    qtest_add_func("/net/canfd/canfd_data_transfer", test_canfd_data_transfer);
+    qtest_add_func("/net/canfd/can_loopback", test_can_loopback);
+
+    return g_test_run();
+}
-- 
2.17.1


