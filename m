Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BA140F1A6
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 07:34:00 +0200 (CEST)
Received: from localhost ([::1]:52228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR6Vb-0008Bd-Tu
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 01:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mR6MN-0002xh-SM; Fri, 17 Sep 2021 01:24:27 -0400
Received: from mail-mw2nam12on2066.outbound.protection.outlook.com
 ([40.107.244.66]:25281 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mR6M5-0005sx-8A; Fri, 17 Sep 2021 01:24:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMsqpFQyLJoG1qtC5PFH1Gk07FPxujbDf1NvCwV7uEnu8N6W28qLHldynswph1w3wzS8IgZ4s5dY1GFR6R1yh0qaHFjE7uJYTnRYgwyLHNsBVYPBbVD57BxTzycILwyYjYqFxEhdmZq+w1hsl6aDc7fEG9fFNNx/1JWAdSNwfAwWCZNbZc4Fo6Cqm9bFlhl2we3Wz6qLBt4BGCw79elrm9VyrYXih9jOSYorhy9fd0ZMyf3kUnGjVFHKEjZVWvIm8VfU9owsKcwOZSuZdiWtMZ3OqWt49y2p34wTAatbseBusNgiLAgJGzx8JS6Kh9gz320cXU9Ov4xj5Av1ZUVzCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=yAhR2Zlw0BJPaDHAcxcm0lDMM1//D50nWYatagZ/iX4=;
 b=OS9Sl+8m09DvOVtskEKdHjWUF34suh+4L0Fy2RgoAh2gkHJBmRHAWEzFoOkQN7A+Zdwozn+VGX+c/PYZQB5j/8CQucn1LfmGAHX0BQBDo4tHD7IhlGDpku8MaKELme0f9agbncBBhiicPOq9mqe+GcAMtR9V5svDKh+h30LJeEtizWdalfc0yJvsN/MWTIr2AQfrNUCseQwwiAvXSINwrlaizR7e2/zlhZ0NbhA/HF7Twxa4kJtR6XVdM+xZvsYmTSe7NXePjQ2z0FYFO0LRCvNRYhYxRjihSgSA9v4sgMR2uO8AHfTOkuc3pfRRIRPOKftAmM+ukCQlytmPrAezVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAhR2Zlw0BJPaDHAcxcm0lDMM1//D50nWYatagZ/iX4=;
 b=Pg8vJL+InKYL4OmKZO4gkXuGOYNJ5cxsEkDpww8Rb0ViAozFvQN4/SZJIWmp/7S3nqVT3cifrS/MRZkBrr6Ai13Il6gPjejetcnSZWEGPv4IJpTeMbn1OC27b7itA7WCinFOm+DF04FNqL7bbdQ4WjTXHfg7OZ2sVHCCqn9X8XI=
Received: from DM3PR12CA0062.namprd12.prod.outlook.com (2603:10b6:0:56::30) by
 DM5PR02MB2697.namprd02.prod.outlook.com (2603:10b6:3:109::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14; Fri, 17 Sep 2021 05:24:03 +0000
Received: from DM3NAM02FT037.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:56:cafe::d1) by DM3PR12CA0062.outlook.office365.com
 (2603:10b6:0:56::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 05:24:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT037.mail.protection.outlook.com (10.13.4.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 05:24:02 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 16 Sep 2021 22:24:00 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 16 Sep 2021 22:24:00 -0700
Received: from [172.19.2.40] (port=58118 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mR6Lw-0005Y7-QB; Thu, 16 Sep 2021 22:24:00 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH v3 1/9] hw/nvram: Introduce Xilinx eFuse QOM
Date: Thu, 16 Sep 2021 22:23:52 -0700
Message-ID: <20210917052400.1249094-2-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917052400.1249094-1-tong.ho@xilinx.com>
References: <20210917052400.1249094-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 259e2ca4-4aee-4f50-1585-08d9799b5ca5
X-MS-TrafficTypeDiagnostic: DM5PR02MB2697:
X-Microsoft-Antispam-PRVS: <DM5PR02MB2697D516CDCC7719ABF9DFB2CDDD9@DM5PR02MB2697.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WayVAF4HFFqnYDQmMRFL0NHCg93NOrB4YYAepInaNH13Le3gEouinoCuB32uIe4Ac2iOlChLPIMkGKkK7vDF1nkNtL6twuDKsxLElCLjPPTQT+gKj1xX3ryB+TIrui+/nDoLfOQVVsvpTfxFrkWKPF4LZEoTJjWtBnVWwc+P8+Jwq5IKH4vIQPzyzghXmXChyVgRKx3MWOWOJ6upROLD8WPqrlrwQCmPhhor1wgM+o2BOkGVj1VpbGZbGp1XdwT8k95RaLc34DMv1x9FbG49sAa2CZoQiNqhNesuXFENHxfDSN9oLSxWBib8YZBxTTxLyreGyTFE3zymbBt8th3V+4M+XNo+SnQUhDbqeL2cPbMELHGEcU7YFogsxaCZEE1BM7bR+PmcD2S6w5khOqSZQLDDtXeA+/2EvCbVgz1mT8Tc0ZsooH4x7ylEkR9L+cY5X0f9vImplv48IQRXg79YVx/EYt6MaxYvIQMbEn1NWX28Ei/EejbDBFjKyhneckjc4ngLlIKyQjcnWDLXxTtaP187EtlcJwx574I/o/OUuXwofScjQSnLSen+wSpkbz1J8xfZvThsBqENKHPWsB2Yfwvz4KbcaumD4ZeMtwTE00ac9Czq+tfnsGOY84Zr6bqWHpmQ3WIOP4iYhB2E+N/aOL8DdVvpy3IJndUnGetjhTmbav5SdWQp5T5zjQhSfC0Vj6ZsS6gGPinvBD0it0FdX6cgFNSzSFT+A4yb/tfJBg0SxGd60SjqyRLvNiPiCi62q5tT6c9SAggkZfnEQJsSWq7cIdp/sYSr1grNVXnFgCMSmRSD2PbKfM78gl12Pl2B6Z6MDXPG0bgYLHsqDkETzlBSkmcrgXCG4MZ3LhdF8eY=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(36840700001)(46966006)(1076003)(336012)(70586007)(107886003)(70206006)(426003)(2616005)(47076005)(83380400001)(44832011)(36756003)(82310400003)(36860700001)(478600001)(8936002)(7696005)(30864003)(36906005)(8676002)(2906002)(6916009)(356005)(4326008)(9786002)(7636003)(966005)(54906003)(5660300002)(26005)(186003)(316002)(6666004)(82740400003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 05:24:02.9930 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 259e2ca4-4aee-4f50-1585-08d9799b5ca5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT037.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2697
Received-SPF: pass client-ip=40.107.244.66; envelope-from=tongh@xilinx.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@gmail.com, alistair@alistair23.me, tong.ho@xilinx.com,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This introduces the QOM for Xilinx eFuse, an one-time
field-programmable storage bit array.

The actual mmio interface to the array varies by device
families and will be provided in different change-sets.

Co-authored-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Co-authored-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/nvram/Kconfig              |   7 +
 hw/nvram/meson.build          |   2 +
 hw/nvram/xlnx-efuse-crc.c     | 119 +++++++++++++++
 hw/nvram/xlnx-efuse.c         | 280 ++++++++++++++++++++++++++++++++++
 include/hw/nvram/xlnx-efuse.h | 132 ++++++++++++++++
 5 files changed, 540 insertions(+)
 create mode 100644 hw/nvram/xlnx-efuse-crc.c
 create mode 100644 hw/nvram/xlnx-efuse.c
 create mode 100644 include/hw/nvram/xlnx-efuse.h

diff --git a/hw/nvram/Kconfig b/hw/nvram/Kconfig
index e872fcb194..252251f366 100644
--- a/hw/nvram/Kconfig
+++ b/hw/nvram/Kconfig
@@ -15,3 +15,10 @@ config NMC93XX_EEPROM
 
 config CHRP_NVRAM
     bool
+
+config XLNX_EFUSE_CRC
+    bool
+
+config XLNX_EFUSE
+    bool
+    select XLNX_EFUSE_CRC
diff --git a/hw/nvram/meson.build b/hw/nvram/meson.build
index fd2951a860..623c94efff 100644
--- a/hw/nvram/meson.build
+++ b/hw/nvram/meson.build
@@ -9,5 +9,7 @@ softmmu_ss.add(when: 'CONFIG_AT24C', if_true: files('eeprom_at24c.c'))
 softmmu_ss.add(when: 'CONFIG_MAC_NVRAM', if_true: files('mac_nvram.c'))
 softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_otp.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_nvm.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_EFUSE_CRC', if_true: files('xlnx-efuse-crc.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_EFUSE', if_true: files('xlnx-efuse.c'))
 
 specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_nvram.c'))
diff --git a/hw/nvram/xlnx-efuse-crc.c b/hw/nvram/xlnx-efuse-crc.c
new file mode 100644
index 0000000000..5a5cc13f39
--- /dev/null
+++ b/hw/nvram/xlnx-efuse-crc.c
@@ -0,0 +1,119 @@
+/*
+ * Xilinx eFuse/bbram CRC calculator
+ *
+ * Copyright (c) 2021 Xilinx Inc.
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
+#include "qemu/osdep.h"
+#include "hw/nvram/xlnx-efuse.h"
+
+static uint32_t xlnx_efuse_u37_crc(uint32_t prev_crc, uint32_t data,
+                                   uint32_t addr)
+{
+    /* A table for 7-bit slicing */
+    static const uint32_t crc_tab[128] = {
+        0x00000000, 0xe13b70f7, 0xc79a971f, 0x26a1e7e8,
+        0x8ad958cf, 0x6be22838, 0x4d43cfd0, 0xac78bf27,
+        0x105ec76f, 0xf165b798, 0xd7c45070, 0x36ff2087,
+        0x9a879fa0, 0x7bbcef57, 0x5d1d08bf, 0xbc267848,
+        0x20bd8ede, 0xc186fe29, 0xe72719c1, 0x061c6936,
+        0xaa64d611, 0x4b5fa6e6, 0x6dfe410e, 0x8cc531f9,
+        0x30e349b1, 0xd1d83946, 0xf779deae, 0x1642ae59,
+        0xba3a117e, 0x5b016189, 0x7da08661, 0x9c9bf696,
+        0x417b1dbc, 0xa0406d4b, 0x86e18aa3, 0x67dafa54,
+        0xcba24573, 0x2a993584, 0x0c38d26c, 0xed03a29b,
+        0x5125dad3, 0xb01eaa24, 0x96bf4dcc, 0x77843d3b,
+        0xdbfc821c, 0x3ac7f2eb, 0x1c661503, 0xfd5d65f4,
+        0x61c69362, 0x80fde395, 0xa65c047d, 0x4767748a,
+        0xeb1fcbad, 0x0a24bb5a, 0x2c855cb2, 0xcdbe2c45,
+        0x7198540d, 0x90a324fa, 0xb602c312, 0x5739b3e5,
+        0xfb410cc2, 0x1a7a7c35, 0x3cdb9bdd, 0xdde0eb2a,
+        0x82f63b78, 0x63cd4b8f, 0x456cac67, 0xa457dc90,
+        0x082f63b7, 0xe9141340, 0xcfb5f4a8, 0x2e8e845f,
+        0x92a8fc17, 0x73938ce0, 0x55326b08, 0xb4091bff,
+        0x1871a4d8, 0xf94ad42f, 0xdfeb33c7, 0x3ed04330,
+        0xa24bb5a6, 0x4370c551, 0x65d122b9, 0x84ea524e,
+        0x2892ed69, 0xc9a99d9e, 0xef087a76, 0x0e330a81,
+        0xb21572c9, 0x532e023e, 0x758fe5d6, 0x94b49521,
+        0x38cc2a06, 0xd9f75af1, 0xff56bd19, 0x1e6dcdee,
+        0xc38d26c4, 0x22b65633, 0x0417b1db, 0xe52cc12c,
+        0x49547e0b, 0xa86f0efc, 0x8ecee914, 0x6ff599e3,
+        0xd3d3e1ab, 0x32e8915c, 0x144976b4, 0xf5720643,
+        0x590ab964, 0xb831c993, 0x9e902e7b, 0x7fab5e8c,
+        0xe330a81a, 0x020bd8ed, 0x24aa3f05, 0xc5914ff2,
+        0x69e9f0d5, 0x88d28022, 0xae7367ca, 0x4f48173d,
+        0xf36e6f75, 0x12551f82, 0x34f4f86a, 0xd5cf889d,
+        0x79b737ba, 0x988c474d, 0xbe2da0a5, 0x5f16d052
+    };
+
+    /*
+     * eFuse calculation is shown here:
+     *  https://github.com/Xilinx/embeddedsw/blob/release-2019.2/lib/sw_services/xilskey/src/xilskey_utils.c#L1496
+     *
+     * Each u32 word is appended a 5-bit value, for a total of 37 bits; see:
+     *  https://github.com/Xilinx/embeddedsw/blob/release-2019.2/lib/sw_services/xilskey/src/xilskey_utils.c#L1356
+     */
+    uint32_t crc = prev_crc;
+    const unsigned rshf = 7;
+    const uint32_t im = (1 << rshf) - 1;
+    const uint32_t rm = (1 << (32 - rshf)) - 1;
+    const uint32_t i2 = (1 << 2) - 1;
+    const uint32_t r2 = (1 << 30) - 1;
+
+    unsigned j;
+    uint32_t i, r;
+    uint64_t w;
+
+    w = (uint64_t)(addr) << 32;
+    w |= data;
+
+    /* Feed 35 bits, in 5 rounds, each a slice of 7 bits */
+    for (j = 0; j < 5; j++) {
+        r = rm & (crc >> rshf);
+        i = im & (crc ^ w);
+        crc = crc_tab[i] ^ r;
+
+        w >>= rshf;
+    }
+
+    /* Feed the remaining 2 bits */
+    r = r2 & (crc >> 2);
+    i = i2 & (crc ^ w);
+    crc = crc_tab[i << (rshf - 2)] ^ r;
+
+    return crc;
+}
+
+uint32_t xlnx_efuse_calc_crc(const uint32_t *data, unsigned u32_cnt,
+                             unsigned zpads)
+{
+    uint32_t crc = 0;
+    unsigned index;
+
+    for (index = zpads; index; index--) {
+        crc = xlnx_efuse_u37_crc(crc, 0, (index + u32_cnt));
+    }
+
+    for (index = u32_cnt; index; index--) {
+        crc = xlnx_efuse_u37_crc(crc, data[index - 1], index);
+    }
+
+    return crc;
+}
diff --git a/hw/nvram/xlnx-efuse.c b/hw/nvram/xlnx-efuse.c
new file mode 100644
index 0000000000..ee1caab54c
--- /dev/null
+++ b/hw/nvram/xlnx-efuse.c
@@ -0,0 +1,280 @@
+/*
+ * QEMU model of the EFUSE eFuse
+ *
+ * Copyright (c) 2015 Xilinx Inc.
+ *
+ * Written by Edgar E. Iglesias <edgari@xilinx.com>
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
+#include "hw/nvram/xlnx-efuse.h"
+
+#include "qemu/error-report.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "sysemu/blockdev.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+
+#define TBIT0_OFFSET     28
+#define TBIT1_OFFSET     29
+#define TBIT2_OFFSET     30
+#define TBIT3_OFFSET     31
+#define TBITS_PATTERN    (0x0AU << TBIT0_OFFSET)
+#define TBITS_MASK       (0x0FU << TBIT0_OFFSET)
+
+bool xlnx_efuse_get_bit(XlnxEFuse *s, unsigned int bit)
+{
+    bool b = s->fuse32[bit / 32] & (1 << (bit % 32));
+    return b;
+}
+
+static int efuse_bytes(XlnxEFuse *s)
+{
+    return ROUND_UP((s->efuse_nr * s->efuse_size) / 8, 4);
+}
+
+static int efuse_bdrv_read(XlnxEFuse *s, Error **errp)
+{
+    uint32_t *ram = s->fuse32;
+    int nr = efuse_bytes(s);
+
+    if (!s->blk) {
+        return 0;
+    }
+
+    s->blk_ro = !blk_supports_write_perm(s->blk);
+    if (!s->blk_ro) {
+        int rc;
+
+        rc = blk_set_perm(s->blk,
+                          (BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE),
+                          BLK_PERM_ALL, NULL);
+        if (rc) {
+            s->blk_ro = true;
+        }
+    }
+    if (s->blk_ro) {
+        warn_report("%s: Skip saving updates to read-only eFUSE backstore.",
+                    blk_name(s->blk));
+    }
+
+    if (blk_pread(s->blk, 0, ram, nr) < 0) {
+        error_setg(errp, "%s: Failed to read %u bytes from eFUSE backstore.",
+                   blk_name(s->blk), nr);
+        return -1;
+    }
+
+    /* Convert from little-endian backstore for each 32-bit row */
+    nr /= 4;
+    while (nr--) {
+        ram[nr] = le32_to_cpu(ram[nr]);
+    }
+
+    return 0;
+}
+
+static void efuse_bdrv_sync(XlnxEFuse *s, unsigned int bit)
+{
+    unsigned int row_offset;
+    uint32_t le32;
+
+    if (!s->blk || s->blk_ro) {
+        return;  /* Silent on read-only backend to avoid message flood */
+    }
+
+    /* Backstore is always in little-endian */
+    le32 = cpu_to_le32(xlnx_efuse_get_row(s, bit));
+
+    row_offset = (bit / 32) * 4;
+    if (blk_pwrite(s->blk, row_offset, &le32, 4, 0) < 0) {
+        error_report("%s: Failed to write offset %u of eFUSE backstore.",
+                     blk_name(s->blk), row_offset);
+    }
+}
+
+static int efuse_ro_bits_cmp(const void *a, const void *b)
+{
+    uint32_t i = *(const uint32_t *)a;
+    uint32_t j = *(const uint32_t *)b;
+
+    return (i > j) - (i < j);
+}
+
+static void efuse_ro_bits_sort(XlnxEFuse *s)
+{
+    uint32_t *ary = s->ro_bits;
+    const uint32_t cnt = s->ro_bits_cnt;
+
+    if (ary && cnt > 1) {
+        qsort(ary, cnt, sizeof(ary[0]), efuse_ro_bits_cmp);
+    }
+}
+
+static bool efuse_ro_bits_find(XlnxEFuse *s, uint32_t k)
+{
+    const uint32_t *ary = s->ro_bits;
+    const uint32_t cnt = s->ro_bits_cnt;
+
+    if (!ary || !cnt) {
+        return false;
+    }
+
+    return bsearch(&k, ary, cnt, sizeof(ary[0]), efuse_ro_bits_cmp) != NULL;
+}
+
+bool xlnx_efuse_set_bit(XlnxEFuse *s, unsigned int bit)
+{
+    if (efuse_ro_bits_find(s, bit)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: WARN: "
+                      "Ignored setting of readonly efuse bit<%u,%u>!\n",
+                      object_get_canonical_path(OBJECT(s)),
+                      (bit / 32), (bit % 32));
+        return false;
+    }
+
+    s->fuse32[bit / 32] |= 1 << (bit % 32);
+    efuse_bdrv_sync(s, bit);
+    return true;
+}
+
+bool xlnx_efuse_k256_check(XlnxEFuse *s, uint32_t crc, unsigned start)
+{
+    uint32_t calc;
+
+    /* A key always occupies multiple of whole rows */
+    assert((start % 32) == 0);
+
+    calc = xlnx_efuse_calc_crc(&s->fuse32[start / 32], (256 / 32), 0);
+    return calc == crc;
+}
+
+uint32_t xlnx_efuse_tbits_check(XlnxEFuse *s)
+{
+    int nr;
+    uint32_t check = 0;
+
+    for (nr = s->efuse_nr; nr-- > 0; ) {
+        int efuse_start_row_num = (s->efuse_size * nr) / 32;
+        uint32_t data = s->fuse32[efuse_start_row_num];
+
+        /*
+         * If the option is on, auto-init blank T-bits.
+         * (non-blank will still be reported as '0' in the check, e.g.,
+         *  for error-injection tests)
+         */
+        if ((data & TBITS_MASK) == 0 && s->init_tbits) {
+            data |= TBITS_PATTERN;
+
+            s->fuse32[efuse_start_row_num] = data;
+            efuse_bdrv_sync(s, (efuse_start_row_num * 32 + TBIT0_OFFSET));
+        }
+
+        check = (check << 1) | ((data & TBITS_MASK) == TBITS_PATTERN);
+    }
+
+    return check;
+}
+
+static void efuse_realize(DeviceState *dev, Error **errp)
+{
+    XlnxEFuse *s = XLNX_EFUSE(dev);
+
+    /* Sort readonly-list for bsearch lookup */
+    efuse_ro_bits_sort(s);
+
+    if ((s->efuse_size % 32) != 0) {
+        error_setg(errp,
+                   "%s.efuse-size: %u: property value not multiple of 32.",
+                   object_get_canonical_path(OBJECT(dev)), s->efuse_size);
+        return;
+    }
+
+    s->fuse32 = g_malloc0(efuse_bytes(s));
+    if (efuse_bdrv_read(s, errp)) {
+        g_free(s->fuse32);
+    }
+}
+
+static void efuse_prop_set_drive(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    DeviceState *dev = DEVICE(obj);
+
+    qdev_prop_drive.set(obj, v, name, opaque, errp);
+
+    /* Fill initial data if backend is attached after realized */
+    if (dev->realized) {
+        efuse_bdrv_read(XLNX_EFUSE(obj), errp);
+    }
+}
+
+static void efuse_prop_get_drive(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    qdev_prop_drive.get(obj, v, name, opaque, errp);
+}
+
+static void efuse_prop_release_drive(Object *obj, const char *name,
+                                     void *opaque)
+{
+    qdev_prop_drive.release(obj, name, opaque);
+}
+
+static const PropertyInfo efuse_prop_drive = {
+    .name  = "str",
+    .description = "Node name or ID of a block device to use as eFUSE backend",
+    .realized_set_allowed = true,
+    .get = efuse_prop_get_drive,
+    .set = efuse_prop_set_drive,
+    .release = efuse_prop_release_drive,
+};
+
+static Property efuse_properties[] = {
+    DEFINE_PROP("drive", XlnxEFuse, blk, efuse_prop_drive, BlockBackend *),
+    DEFINE_PROP_UINT8("efuse-nr", XlnxEFuse, efuse_nr, 3),
+    DEFINE_PROP_UINT32("efuse-size", XlnxEFuse, efuse_size, 64 * 32),
+    DEFINE_PROP_BOOL("init-factory-tbits", XlnxEFuse, init_tbits, true),
+    DEFINE_PROP_ARRAY("read-only", XlnxEFuse, ro_bits_cnt, ro_bits,
+                      qdev_prop_uint32, uint32_t),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void efuse_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = efuse_realize;
+    device_class_set_props(dc, efuse_properties);
+}
+
+static const TypeInfo efuse_info = {
+    .name          = TYPE_XLNX_EFUSE,
+    .parent        = TYPE_DEVICE,
+    .instance_size = sizeof(XlnxEFuse),
+    .class_init    = efuse_class_init,
+};
+
+static void efuse_register_types(void)
+{
+    type_register_static(&efuse_info);
+}
+type_init(efuse_register_types)
diff --git a/include/hw/nvram/xlnx-efuse.h b/include/hw/nvram/xlnx-efuse.h
new file mode 100644
index 0000000000..58414e468b
--- /dev/null
+++ b/include/hw/nvram/xlnx-efuse.h
@@ -0,0 +1,132 @@
+/*
+ * QEMU model of the Xilinx eFuse core
+ *
+ * Copyright (c) 2015 Xilinx Inc.
+ *
+ * Written by Edgar E. Iglesias <edgari@xilinx.com>
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
+#ifndef XLNX_EFUSE_H
+#define XLNX_EFUSE_H
+
+#include "sysemu/block-backend.h"
+#include "hw/qdev-core.h"
+
+#define TYPE_XLNX_EFUSE "xlnx,efuse"
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxEFuse, XLNX_EFUSE);
+
+struct XlnxEFuse {
+    DeviceState parent_obj;
+    BlockBackend *blk;
+    bool blk_ro;
+    uint32_t *fuse32;
+
+    DeviceState *dev;
+
+    bool init_tbits;
+
+    uint8_t efuse_nr;
+    uint32_t efuse_size;
+
+    uint32_t *ro_bits;
+    uint32_t ro_bits_cnt;
+};
+
+/**
+ * xlnx_efuse_calc_crc:
+ * @data: an array of 32-bit words for which the CRC should be computed
+ * @u32_cnt: the array size in number of 32-bit words
+ * @zpads: the number of 32-bit zeros prepended to @data before computation
+ *
+ * This function is used to compute the CRC for an array of 32-bit words,
+ * using a Xilinx-specific data padding.
+ *
+ * Returns: the computed 32-bit CRC
+ */
+uint32_t xlnx_efuse_calc_crc(const uint32_t *data, unsigned u32_cnt,
+                             unsigned zpads);
+
+/**
+ * xlnx_efuse_get_bit:
+ * @s: the efuse object
+ * @bit: the efuse bit-address to read the data
+ *
+ * Returns: the bit, 0 or 1, at @bit of object @s
+ */
+bool xlnx_efuse_get_bit(XlnxEFuse *s, unsigned int bit);
+
+/**
+ * xlnx_efuse_set_bit:
+ * @s: the efuse object
+ * @bit: the efuse bit-address to be written a value of 1
+ *
+ * Returns: true on success, false on failure
+ */
+bool xlnx_efuse_set_bit(XlnxEFuse *s, unsigned int bit);
+
+/**
+ * xlnx_efuse_k256_check:
+ * @s: the efuse object
+ * @crc: the 32-bit CRC to be compared with
+ * @start: the efuse bit-address (which must be multiple of 32) of the
+ *         start of a 256-bit array
+ *
+ * This function computes the CRC of a 256-bit array starting at @start
+ * then compares to the given @crc
+ *
+ * Returns: true of @crc == computed, false otherwise
+ */
+bool xlnx_efuse_k256_check(XlnxEFuse *s, uint32_t crc, unsigned start);
+
+/**
+ * xlnx_efuse_tbits_check:
+ * @s: the efuse object
+ *
+ * This function inspects a number of efuse bits at specific addresses
+ * to see if they match a validation pattern. Each pattern is a group
+ * of 4 bits, and there are 3 groups.
+ *
+ * Returns: a 3-bit mask, where a bit of '1' means the corresponding
+ * group has a valid pattern.
+ */
+uint32_t xlnx_efuse_tbits_check(XlnxEFuse *s);
+
+/**
+ * xlnx_efuse_get_row:
+ * @s: the efuse object
+ * @bit: the efuse bit address for which a 32-bit value is read
+ *
+ * Returns: the entire 32 bits of the efuse, starting at a bit
+ * address that is multiple of 32 and contains the bit at @bit
+ */
+static inline uint32_t xlnx_efuse_get_row(XlnxEFuse *s, unsigned int bit)
+{
+    if (!(s->fuse32)) {
+        return 0;
+    } else {
+        unsigned int row_idx = bit / 32;
+
+        assert(row_idx < (s->efuse_size * s->efuse_nr / 32));
+        return s->fuse32[row_idx];
+    }
+}
+
+#endif
-- 
2.25.1


