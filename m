Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA41D20A5F6
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 21:36:47 +0200 (CEST)
Received: from localhost ([::1]:56720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joXfy-0003gV-Ry
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 15:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fnuv@xilinx.com>) id 1joXdw-0001m4-Vq
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 15:34:44 -0400
Received: from mail-bn8nam11on2080.outbound.protection.outlook.com
 ([40.107.236.80]:51591 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fnuv@xilinx.com>) id 1joXdu-0001rg-EX
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 15:34:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDS8ITYkII1R/PJbRZM0R+Kt7WQHGykQhy+zXNA0oWrVKkjAwP5BiYjTdsxr5TbmcuZUo6EBIJGlQUtrr0gaWU+ZyTQ0AQlpRVDFHzF7nd1oi1FZt0R6EYhf96t4ImFU9mNToAxiRhzn8zAoulcKerfUJjhHMU4SFlBgG6c6PyQoAYNMDAXSQIAU6+oijtOfk66akuWTnHdYAfZlslmefpC4LNyE+G/iksenMuG5k7noxGOwSr3RQaUiOkQP8srPbaIYA+inBFdjS+oClKpSwyPT6Xdef2Nnp0YcsaBT5J2fL29GKhbx121NCjpgxPw8WHhGja5faVnhJ1FKSDh9mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WyQXllYkPj0FS4OEdjakl8Wp/odv4hV8HoFqIazslw=;
 b=Xx8/tfEYRmuA1Ixu9OSB7r7eiOFdpX9PqvtmGQyM79N+hnsU0GWuQjpPNfuI0o+QRAT3L3PAmhzS83YiJi1pITSy9QkcYQRLU80fDrNV821DeIyUzT580dJe4RULHZEWIjKs3GPIi+S4+IuXJtSex+tZT5pkuvpTUK84lnh/smlFgV1ZA1aT37+UvsqGQNWG36sOqfYLFYy8+sUncfgkGeorpHT4kyO9WUS0MwxrHhunWuvmV/4qGywW8eBcuTSHKwb8caF0fNwXJj5+kUcjL1aOc4dhgWi+wCr+GeH5m5251VLYUx3kVltfKRCRSPElrkKoavsJlSWUtaLdtblBKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=redhat.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WyQXllYkPj0FS4OEdjakl8Wp/odv4hV8HoFqIazslw=;
 b=DzKleMUSAh9YEe8gRrRNHWkDP8P/D4Uj82WquPeEvg1wmkWH7SdFQkPOzTQqbRcoG+GoMG/0h8ffIb4SUJ9gEfpeAdL6jj8Bx5ydDXEdvLTli2nCGjkPKc9RTK8EQgboUXwvD3a6Z9T9HDxCuMenbFywjvjLra90SyRX56vn1S8=
Received: from DM5PR19CA0027.namprd19.prod.outlook.com (2603:10b6:3:9a::13) by
 BL0PR02MB5522.namprd02.prod.outlook.com (2603:10b6:208:8e::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.21; Thu, 25 Jun 2020 19:34:35 +0000
Received: from CY1NAM02FT035.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:9a:cafe::65) by DM5PR19CA0027.outlook.office365.com
 (2603:10b6:3:9a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend
 Transport; Thu, 25 Jun 2020 19:34:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT035.mail.protection.outlook.com (10.152.75.186) with Microsoft SMTP
 Server id 15.20.3131.20 via Frontend Transport; Thu, 25 Jun 2020 19:34:34
 +0000
Received: from [149.199.38.66] (port=51338 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1joXcc-00081a-HB; Thu, 25 Jun 2020 12:33:18 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1joXdq-000359-5b; Thu, 25 Jun 2020 12:34:34 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 05PJYQB4012273; 
 Thu, 25 Jun 2020 12:34:26 -0700
Received: from [172.19.2.115] (helo=xsjfnuv50.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1joXdh-0002vc-Ux; Thu, 25 Jun 2020 12:34:26 -0700
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 3/4] tests/qtest: Introduce tests for Xilinx ZynqMP CAN
 controller
Date: Thu, 25 Jun 2020 12:33:26 -0700
Message-Id: <1593113607-321118-4-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593113607-321118-1-git-send-email-fnu.vikram@xilinx.com>
References: <1593113607-321118-1-git-send-email-fnu.vikram@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(346002)(39860400002)(136003)(376002)(396003)(46966005)(356005)(82310400002)(4326008)(26005)(83380400001)(478600001)(186003)(36756003)(7696005)(2906002)(81166007)(70586007)(82740400003)(70206006)(336012)(8936002)(316002)(2616005)(54906003)(426003)(47076004)(6916009)(30864003)(8676002)(5660300002)(9786002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c788f017-ae6a-4d80-9481-08d8193eca40
X-MS-TrafficTypeDiagnostic: BL0PR02MB5522:
X-Microsoft-Antispam-PRVS: <BL0PR02MB5522AE923F6B8A40FB2B3D95BC920@BL0PR02MB5522.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 22+qbXCqLAHa2cxtw87n8lKZcZmNPcw6GIJ6GNvgXATFSZeRRens+9Gltal/8WUZ9So64ef50mjpJ9kv71UxUSuNYJiajODCITVZZcWF1SZTqcq8k0J8DiM7m0K/1c9NtJ+0JpCRkyFmn3gQWaa4W1HLJY4DZoL3KsEhYJpU5V8i5llBhIVKQ1T1azMCQrjR0tkN5hgIHQyKByxfnmwbAT8xOQff1QhvOkrvzj9Tqb091psYFWAsI1wbnQ2CH4+lAU1tY4BniSPwSoP91iE568a3FJkt1ToC75ztUp8+gKgJeiTNXnp8WoKowbK/PBHWw/QX+xzv8s6XJ8UpU4TPopmdnBY9B0GKV3i8MOLvMCRQComqN7atAGec54shcg5/I9W8Bm9zlFckf9QAapziFQ==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 19:34:34.4751 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c788f017-ae6a-4d80-9481-08d8193eca40
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT035.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5522
Received-SPF: pass client-ip=40.107.236.80; envelope-from=fnuv@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 15:34:06
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, francisco.iglesias@xilinx.com,
 Thomas Huth <thuth@redhat.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QTests perform five tests on the Xilinx ZynqMP CAN controller:
    Tests the CAN controller in loopback, sleep and snoop mode.
    Tests filtering of incoming CAN messages.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 tests/qtest/Makefile.include |   2 +
 tests/qtest/xlnx-can-test.c  | 367 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 369 insertions(+)
 create mode 100644 tests/qtest/xlnx-can-test.c

diff --git a/tests/qtest/Makefile.include b/tests/qtest/Makefile.include
index 98af2c2..1f21f8f 100644
--- a/tests/qtest/Makefile.include
+++ b/tests/qtest/Makefile.include
@@ -136,6 +136,7 @@ check-qtest-aarch64-$(CONFIG_TPM_TIS_SYSBUS) += tpm-tis-device-swtpm-test
 check-qtest-aarch64-y += numa-test
 check-qtest-aarch64-y += boot-serial-test
 check-qtest-aarch64-y += migration-test
+check-qtest-aarch64-y += xlnx-can-test
 
 # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make test unconditional
 ifneq ($(ARCH),arm)
@@ -266,6 +267,7 @@ tests/qtest/bios-tables-test$(EXESUF): tests/qtest/bios-tables-test.o \
 	tests/qtest/boot-sector.o tests/qtest/acpi-utils.o $(libqos-obj-y)
 tests/qtest/pxe-test$(EXESUF): tests/qtest/pxe-test.o tests/qtest/boot-sector.o $(libqos-obj-y)
 tests/qtest/microbit-test$(EXESUF): tests/qtest/microbit-test.o
+tests/qtest/xlnx-can-test$(EXESUF): tests/qtest/xlnx-can-test.o
 tests/qtest/m25p80-test$(EXESUF): tests/qtest/m25p80-test.o
 tests/qtest/i440fx-test$(EXESUF): tests/qtest/i440fx-test.o $(libqos-pc-obj-y)
 tests/qtest/q35-test$(EXESUF): tests/qtest/q35-test.o $(libqos-pc-obj-y)
diff --git a/tests/qtest/xlnx-can-test.c b/tests/qtest/xlnx-can-test.c
new file mode 100644
index 0000000..802e331
--- /dev/null
+++ b/tests/qtest/xlnx-can-test.c
@@ -0,0 +1,367 @@
+/*
+ * QTests for the Xilinx ZynqMP CAN controller.
+ *
+ * Copyright (c) 2020 Xilinx Inc.
+ *
+ * Written-by: Vikram Garhwal<fnu.vikram@xilinx.com>
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
+/* Xlnx-CAN base address. */
+#define CAN0_BASE_ADDR          0xFF060000
+#define CAN1_BASE_ADDR          0xFF070000
+
+/* Register address in Xlnx-CAN. */
+#define R_SRR_OFFSET            0x00
+#define R_MSR_OFFSET            0x04
+#define R_SR_OFFSET             0x18
+#define R_ISR_OFFSET            0x1C
+#define R_ICR_OFFSET            0x24
+#define R_TXID_OFFSET           0x30
+#define R_TXDLC_OFFSET          0x34
+#define R_TXDATA1_OFFSET        0x38
+#define R_TXDATA2_OFFSET        0x3C
+#define R_RXID_OFFSET           0x50
+#define R_RXDLC_OFFSET          0x54
+#define R_RXDATA1_OFFSET        0x58
+#define R_RXDATA2_OFFSET        0x5C
+#define R_AFR                   0x60
+#define R_AFMR1                 0x64
+#define R_AFIR1                 0x68
+#define R_AFMR2                 0x6C
+#define R_AFIR2                 0x70
+#define R_AFMR3                 0x74
+#define R_AFIR3                 0x78
+#define R_AFMR4                 0x7C
+#define R_AFIR4                 0x80
+
+/* CAN modes. */
+#define CONFIG_MODE             0x00
+#define NORMAL_MODE             0x00
+#define LOOPBACK_MODE           0x02
+#define SNOOP_MODE              0x04
+#define SLEEP_MODE              0x01
+#define ENABLE_CAN              (1 << 1)
+#define STATUS_NORMAL_MODE      (1 << 3)
+#define STATUS_LOOPBACK_MODE    (1 << 1)
+#define STATUS_SNOOP_MODE       (1 << 12)
+#define STATUS_SLEEP_MODE       (1 << 2)
+#define ISR_TXOK                (1 << 1)
+#define ISR_RXOK                (1 << 4)
+
+static void match_rx_tx_data(uint32_t *buf_tx, uint32_t *buf_rx,
+                             uint8_t can_timestamp)
+{
+    uint16_t size = 0;
+    uint8_t len = 4;
+
+    while (size < len) {
+        if (R_RXID_OFFSET + 4 * size == R_RXDLC_OFFSET)  {
+            g_assert_cmpint(buf_rx[size], ==, buf_tx[size] + can_timestamp);
+        } else {
+            g_assert_cmpint(buf_rx[size], ==, buf_tx[size]);
+        }
+
+        size++;
+    }
+}
+
+static void read_data(QTestState *qts, uint64_t can_base_addr, uint32_t *buf_rx)
+{
+    uint32_t int_status;
+
+    /* Read the interrupt on CAN rx. */
+    int_status = qtest_readl(qts, can_base_addr + R_ISR_OFFSET) & ISR_RXOK;
+
+    g_assert_cmpint(int_status, ==, ISR_RXOK);
+
+    /* Read the RX register data for CAN. */
+    buf_rx[0] = qtest_readl(qts, can_base_addr + R_RXID_OFFSET);
+    buf_rx[1] = qtest_readl(qts, can_base_addr + R_RXDLC_OFFSET);
+    buf_rx[2] = qtest_readl(qts, can_base_addr + R_RXDATA1_OFFSET);
+    buf_rx[3] = qtest_readl(qts, can_base_addr + R_RXDATA2_OFFSET);
+
+    /* Clear the RX interrupt. */
+    qtest_writel(qts, CAN1_BASE_ADDR + R_ICR_OFFSET, ISR_RXOK);
+}
+
+static void send_data(QTestState *qts, uint64_t can_base_addr, uint32_t *buf_tx)
+{
+    uint32_t int_status;
+
+    /* Write the TX register data for CAN. */
+    qtest_writel(qts, can_base_addr + R_TXID_OFFSET, buf_tx[0]);
+    qtest_writel(qts, can_base_addr + R_TXDLC_OFFSET, buf_tx[1]);
+    qtest_writel(qts, can_base_addr + R_TXDATA1_OFFSET, buf_tx[2]);
+    qtest_writel(qts, can_base_addr + R_TXDATA2_OFFSET, buf_tx[3]);
+
+    /* Read the interrupt on CAN for tx. */
+    int_status = qtest_readl(qts, can_base_addr + R_ISR_OFFSET) & ISR_TXOK;
+
+    g_assert_cmpint(int_status, ==, ISR_TXOK);
+
+    /* Clear the interrupt for tx. */
+    qtest_writel(qts, CAN0_BASE_ADDR + R_ICR_OFFSET, ISR_TXOK);
+}
+
+/*
+ * This test will be transferring data from CAN0 and CAN1 through canbus. CAN0
+ * initiate the data transfer to can-bus, CAN1 receives the data. Test compares
+ * the data sent from CAN0 with received on CAN1.
+ */
+static void test_can_bus(void)
+{
+    uint32_t buf_tx[4] = { 0xFF, 0x80000000, 0x12345678, 0x87654321 };
+    uint32_t buf_rx[4] = { 0x00, 0x00, 0x00, 0x00 };
+    uint32_t status = 0;
+    uint8_t can_timestamp = 0;
+
+    QTestState *qts = qtest_init("-machine xlnx-zcu102"
+                " -object can-bus,id=canbus0"
+                " -global driver=xlnx.zynqmp-can,property=canbus0,value=canbus0"
+                " -global driver=xlnx.zynqmp-can,property=canbus1,value=canbus0"
+                );
+
+    /* Configure the CAN0 and CAN1. */
+    qtest_writel(qts, CAN0_BASE_ADDR + R_SRR_OFFSET, ENABLE_CAN);
+    qtest_writel(qts, CAN0_BASE_ADDR + R_MSR_OFFSET, NORMAL_MODE);
+    qtest_writel(qts, CAN1_BASE_ADDR + R_SRR_OFFSET, ENABLE_CAN);
+    qtest_writel(qts, CAN1_BASE_ADDR + R_MSR_OFFSET, NORMAL_MODE);
+
+    /* Check here if CAN0 and CAN1 are in normal mode. */
+    status = qtest_readl(qts, CAN0_BASE_ADDR + R_SR_OFFSET);
+    g_assert_cmpint(status, ==, STATUS_NORMAL_MODE);
+
+    status = qtest_readl(qts, CAN1_BASE_ADDR + R_SR_OFFSET);
+    g_assert_cmpint(status, ==, STATUS_NORMAL_MODE);
+
+    send_data(qts, CAN0_BASE_ADDR, buf_tx);
+
+    can_timestamp += 1;
+
+    read_data(qts, CAN1_BASE_ADDR, buf_rx);
+    match_rx_tx_data(buf_tx, buf_rx, can_timestamp);
+
+    qtest_quit(qts);
+}
+
+/*
+ * This test is performing loopback mode on CAN0 and CAN1. Data sent from TX of
+ * each CAN0 and CAN1 are compared with RX register data for respective CAN.
+ */
+static void test_can_loopback(void)
+{
+    uint32_t buf_tx[4] = { 0xFF, 0x80000000, 0x12345678, 0x87654321 };
+    uint32_t buf_rx[4] = { 0x00, 0x00, 0x00, 0x00 };
+    uint32_t status = 0;
+
+    QTestState *qts = qtest_init("-machine xlnx-zcu102"
+                " -object can-bus,id=canbus0"
+                " -global driver=xlnx.zynqmp-can,property=canbus0,value=canbus0"
+                " -global driver=xlnx.zynqmp-can,property=canbus1,value=canbus0"
+                );
+
+    /* Configure the CAN0 in loopback mode. */
+    qtest_writel(qts, CAN0_BASE_ADDR + R_SRR_OFFSET, CONFIG_MODE);
+    qtest_writel(qts, CAN0_BASE_ADDR + R_MSR_OFFSET, LOOPBACK_MODE);
+    qtest_writel(qts, CAN0_BASE_ADDR + R_SRR_OFFSET, ENABLE_CAN);
+
+    /* Check here if CAN0 is set in loopback mode. */
+    status = qtest_readl(qts, CAN0_BASE_ADDR + R_SR_OFFSET);
+
+    g_assert_cmpint(status, ==, STATUS_LOOPBACK_MODE);
+
+    send_data(qts, CAN0_BASE_ADDR, buf_tx);
+    read_data(qts, CAN0_BASE_ADDR, buf_rx);
+    match_rx_tx_data(buf_tx, buf_rx, 0);
+
+    /* Configure the CAN1 in loopback mode. */
+    qtest_writel(qts, CAN1_BASE_ADDR + R_SRR_OFFSET, CONFIG_MODE);
+    qtest_writel(qts, CAN1_BASE_ADDR + R_MSR_OFFSET, LOOPBACK_MODE);
+    qtest_writel(qts, CAN1_BASE_ADDR + R_SRR_OFFSET, ENABLE_CAN);
+
+    /* Check here if CAN1 is set in loopback mode. */
+    status = qtest_readl(qts, CAN1_BASE_ADDR + R_SR_OFFSET);
+
+    g_assert_cmpint(status, ==, STATUS_LOOPBACK_MODE);
+
+    send_data(qts, CAN1_BASE_ADDR, buf_tx);
+    read_data(qts, CAN1_BASE_ADDR, buf_rx);
+    match_rx_tx_data(buf_tx, buf_rx, 0);
+
+    qtest_quit(qts);
+}
+
+/*
+ * Enable filters for CAN1. This will filter incoming messages with ID. In this
+ * test message will pass through filter 2.
+ */
+static void test_can_filter(void)
+{
+    uint32_t buf_tx[4] = { 0x14, 0x80000000, 0x12345678, 0x87654321 };
+    uint32_t buf_rx[4] = { 0x00, 0x00, 0x00, 0x00 };
+    uint32_t status = 0;
+    uint8_t can_timestamp = 0;
+
+    QTestState *qts = qtest_init("-machine xlnx-zcu102"
+                " -object can-bus,id=canbus0"
+                " -global driver=xlnx.zynqmp-can,property=canbus0,value=canbus0"
+                " -global driver=xlnx.zynqmp-can,property=canbus1,value=canbus0"
+                );
+
+    /* Configure the CAN0 and CAN1. */
+    qtest_writel(qts, CAN0_BASE_ADDR + R_SRR_OFFSET, ENABLE_CAN);
+    qtest_writel(qts, CAN0_BASE_ADDR + R_MSR_OFFSET, NORMAL_MODE);
+    qtest_writel(qts, CAN1_BASE_ADDR + R_SRR_OFFSET, ENABLE_CAN);
+    qtest_writel(qts, CAN1_BASE_ADDR + R_MSR_OFFSET, NORMAL_MODE);
+
+    /* Check here if CAN0 and CAN1 are in normal mode. */
+    status = qtest_readl(qts, CAN0_BASE_ADDR + R_SR_OFFSET);
+    g_assert_cmpint(status, ==, STATUS_NORMAL_MODE);
+
+    status = qtest_readl(qts, CAN1_BASE_ADDR + R_SR_OFFSET);
+    g_assert_cmpint(status, ==, STATUS_NORMAL_MODE);
+
+    /* Set filter for CAN1 for incoming messages. */
+    qtest_writel(qts, CAN1_BASE_ADDR + R_AFR, 0x0);
+    qtest_writel(qts, CAN1_BASE_ADDR + R_AFMR1, 0xF7);
+    qtest_writel(qts, CAN1_BASE_ADDR + R_AFIR1, 0x121F);
+    qtest_writel(qts, CAN1_BASE_ADDR + R_AFMR2, 0x5431);
+    qtest_writel(qts, CAN1_BASE_ADDR + R_AFIR2, 0x14);
+    qtest_writel(qts, CAN1_BASE_ADDR + R_AFMR3, 0x1234);
+    qtest_writel(qts, CAN1_BASE_ADDR + R_AFIR3, 0x5431);
+    qtest_writel(qts, CAN1_BASE_ADDR + R_AFMR4, 0xFFF);
+    qtest_writel(qts, CAN1_BASE_ADDR + R_AFIR4, 0x1234);
+
+    qtest_writel(qts, CAN1_BASE_ADDR + R_AFR, 0xF);
+
+    send_data(qts, CAN0_BASE_ADDR, buf_tx);
+
+    can_timestamp += 1;
+
+    read_data(qts, CAN1_BASE_ADDR, buf_rx);
+    match_rx_tx_data(buf_tx, buf_rx, can_timestamp);
+
+    qtest_quit(qts);
+}
+
+/* Testing sleep mode on CAN0 while CAN1 is in normal mode. */
+static void test_can_sleepmode(void)
+{
+    uint32_t buf_tx[4] = { 0x14, 0x80000000, 0x12345678, 0x87654321 };
+    uint32_t buf_rx[4] = { 0x00, 0x00, 0x00, 0x00 };
+    uint32_t status = 0;
+    uint8_t can_timestamp = 0;
+
+    QTestState *qts = qtest_init("-machine xlnx-zcu102"
+                " -object can-bus,id=canbus0"
+                " -global driver=xlnx.zynqmp-can,property=canbus0,value=canbus0"
+                " -global driver=xlnx.zynqmp-can,property=canbus1,value=canbus0"
+                );
+
+    /* Configure the CAN0. */
+    qtest_writel(qts, CAN0_BASE_ADDR + R_SRR_OFFSET, CONFIG_MODE);
+    qtest_writel(qts, CAN0_BASE_ADDR + R_MSR_OFFSET, SLEEP_MODE);
+    qtest_writel(qts, CAN0_BASE_ADDR + R_SRR_OFFSET, ENABLE_CAN);
+
+    qtest_writel(qts, CAN1_BASE_ADDR + R_SRR_OFFSET, ENABLE_CAN);
+    qtest_writel(qts, CAN1_BASE_ADDR + R_MSR_OFFSET, NORMAL_MODE);
+
+    /* Check here if CAN0 is in SNOOP mode and CAN1 in normal mode. */
+    status = qtest_readl(qts, CAN0_BASE_ADDR + R_SR_OFFSET);
+    g_assert_cmpint(status, ==, STATUS_SLEEP_MODE);
+
+    status = qtest_readl(qts, CAN1_BASE_ADDR + R_SR_OFFSET);
+    g_assert_cmpint(status, ==, STATUS_NORMAL_MODE);
+
+    send_data(qts, CAN1_BASE_ADDR, buf_tx);
+
+    /*
+     * Once CAN1 sends data on can-bus. CAN0 should exit sleep mode.
+     * Check the CAN0 status now. It should exit the sleep mode and receive the
+     * incoming data.
+     */
+    status = qtest_readl(qts, CAN0_BASE_ADDR + R_SR_OFFSET);
+    g_assert_cmpint(status, ==, STATUS_NORMAL_MODE);
+
+    can_timestamp += 1;
+
+    read_data(qts, CAN0_BASE_ADDR, buf_rx);
+
+    match_rx_tx_data(buf_tx, buf_rx, can_timestamp);
+
+    qtest_quit(qts);
+}
+
+/* Testing Snoop mode on CAN0 while CAN1 is in normal mode. */
+static void test_can_snoopmode(void)
+{
+    uint32_t buf_tx[4] = { 0x14, 0x80000000, 0x12345678, 0x87654321 };
+    uint32_t buf_rx[4] = { 0x00, 0x00, 0x00, 0x00 };
+    uint32_t status = 0;
+    uint8_t can_timestamp = 0;
+
+    QTestState *qts = qtest_init("-machine xlnx-zcu102"
+                " -object can-bus,id=canbus0"
+                " -global driver=xlnx.zynqmp-can,property=canbus0,value=canbus0"
+                " -global driver=xlnx.zynqmp-can,property=canbus1,value=canbus0"
+                );
+
+    /* Configure the CAN0. */
+    qtest_writel(qts, CAN0_BASE_ADDR + R_SRR_OFFSET, CONFIG_MODE);
+    qtest_writel(qts, CAN0_BASE_ADDR + R_MSR_OFFSET, SNOOP_MODE);
+    qtest_writel(qts, CAN0_BASE_ADDR + R_SRR_OFFSET, ENABLE_CAN);
+
+    qtest_writel(qts, CAN1_BASE_ADDR + R_SRR_OFFSET, ENABLE_CAN);
+    qtest_writel(qts, CAN1_BASE_ADDR + R_MSR_OFFSET, NORMAL_MODE);
+
+    /* Check here if CAN0 is in SNOOP mode and CAN1 in normal mode. */
+    status = qtest_readl(qts, CAN0_BASE_ADDR + R_SR_OFFSET);
+    g_assert_cmpint(status, ==, STATUS_SNOOP_MODE);
+
+    status = qtest_readl(qts, CAN1_BASE_ADDR + R_SR_OFFSET);
+    g_assert_cmpint(status, ==, STATUS_NORMAL_MODE);
+
+    send_data(qts, CAN1_BASE_ADDR, buf_tx);
+
+    can_timestamp += 1;
+
+    read_data(qts, CAN0_BASE_ADDR, buf_rx);
+
+    match_rx_tx_data(buf_tx, buf_rx, can_timestamp);
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/net/can/can_bus", test_can_bus);
+    qtest_add_func("/net/can/can_loopback", test_can_loopback);
+    qtest_add_func("/net/can/can_filter", test_can_filter);
+    qtest_add_func("/net/can/can_test_snoopmode", test_can_snoopmode);
+    qtest_add_func("/net/can/can_test_sleepmode", test_can_sleepmode);
+
+    return g_test_run();
+}
-- 
2.7.4


