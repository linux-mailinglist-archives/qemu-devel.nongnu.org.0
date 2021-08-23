Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E093F4FF7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:55:42 +0200 (CEST)
Received: from localhost ([::1]:48216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIEAf-0000vN-P2
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIE4k-0004eM-PB; Mon, 23 Aug 2021 13:49:34 -0400
Received: from mail-mw2nam08on2044.outbound.protection.outlook.com
 ([40.107.101.44]:16896 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIE4h-0001AD-Sd; Mon, 23 Aug 2021 13:49:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9E9Sex6hx+vAZdKNTookYLUkm+pIMfpJEVTYku/4cBiygL9ZLFZxA0OzgkBv2XjA+VAkjMnOu26XIRDr0hVCab9T7o7EPdvoHgJUbW4FW28XOY5pDq798eHYh7ewznH3vsCvAx0MBaI8X3fWG5e1RM0HUG4cLjmG17B03Voy0mdY451uCvbyJCheX0kVGcMeyuncSJROZEA33Qn4SP4D7kZDq79HPygJaIhOWHmVJhm2Qub9FOzkUabVcb+RxV011ZexhxpJdkYMJQe2G2me+k6g3O4hicglEoG7/FUPGmsFQ4Ihghk0MvY8CWuybPsJ7LIMNM4gnNfEuNLYBelMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDFGXeEFmCDawB6FaAp/l6GSmVzVmz3DIA0vVEp1oU0=;
 b=MUtUwHLC+ASk7M07AQT0TzCx6HeA+pW6DujkrJIP6tAfCFZpx41Vv55+aGEnz2jHIYNzNx8YQKlglED/4w+TtmTKawGYOFugxa71uluOpGFADyl96PKEYd2X/5PE+FwxpuEESnlZN5D5gHf+dZZCmhjE8/tB/Fp5NysATJHAUajpGaKEJHHoQj/WcGovVKlM/3aabsh5NFPjtbQgH8hHLpxu47z+aZI3TK5Y2bA4qTY5EqROrt1DwkR5M2LkmZLDUe97cpjrm2uYrg4bnfjvUosf9ZrxOAU2Kpmzm6af5LcODjDDsSL1mAoeL4Hy58aWXf7YZNwgBNngkyPc6ox6Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDFGXeEFmCDawB6FaAp/l6GSmVzVmz3DIA0vVEp1oU0=;
 b=MJ70YqXGaE3lDBM9kT5huga9JJR2d8jQVVYBgQ6iF+5CQFJlh+j0PX0tWOS73MJ73gWkgrvn8EJ+OARHf2bUYhLR1jojWvhRELGdMhowwEza8rnmjJ8UGNlArzBzhokGrNSKVw76tOiuYuvcseC6CtB+R2Mws8rMWTNxfyQ3+w8=
Received: from DM5PR22CA0015.namprd22.prod.outlook.com (2603:10b6:3:101::25)
 by BY5PR02MB6963.namprd02.prod.outlook.com (2603:10b6:a03:236::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 17:49:27 +0000
Received: from DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:101:cafe::d4) by DM5PR22CA0015.outlook.office365.com
 (2603:10b6:3:101::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 17:49:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT008.mail.protection.outlook.com (10.13.5.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 17:49:26 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 23 Aug 2021 10:49:24 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 23 Aug 2021 10:49:24 -0700
Received: from [172.19.2.40] (port=46976 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mIE4a-0007u4-Ji; Mon, 23 Aug 2021 10:49:24 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH v2 1/9] hw/nvram: Introduce Xilinx eFuse QOM
Date: Mon, 23 Aug 2021 10:49:16 -0700
Message-ID: <20210823174924.201669-2-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823174924.201669-1-tong.ho@xilinx.com>
References: <20210823174924.201669-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc35039a-18fc-422b-7933-08d9665e59d2
X-MS-TrafficTypeDiagnostic: BY5PR02MB6963:
X-Microsoft-Antispam-PRVS: <BY5PR02MB69636C123B29D2EA5F52C0ECCDC49@BY5PR02MB6963.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VpjdWXv6jNUftZcxSekRIpnjTi0T/nUSbMMCx0v22X7CXW9tTqxmtufGvm9Eb2wXhZ6mn6f6W+aNW3Dkve16E3dRTgXLB5arKv9upfOWpuJKIgMSw49eloh3cqqCjzpheZK5lx9CThdXDnQJzhIom09VQCbTmC/7io9Uv+uQKgxAN3sQ+Krgj73nRreBIuR/+sG2pBmznE1E/ijeSIc1wQeXAVsyJl6J9WNf1v4IVKy/53qhV05IzFf9D7omoly7niCvDqVqMjOALV9a+LUa1C8CLEbPm0qIuMHaa2irBjoLH+f0NFobzm00LK0hZy5f6NAEv80JsrLOloPGF4v8GGFkeQhepXeDzwUU+ukvvH8+DPw75wW7CYGdwywiY705+n9GggE8/OxWk9P+XBccIZTBzhCNbUhN4bQ4Y5X+NJjkj2kIW6T+HY3hgp7mnmcui3/fIac/GOiCfafRDe40jNiyGI3aBt1MadmKBMu3dDENGcPGAeU7yr7kOja+iLMDaegMmVvBZovdF4LBht8b8k4maa6D/sniIjhNdClQakVMnoPTkdndUB8R4LO2t5Vx+fzjWJqbyxraQb50pDSkUnLgwH0jYHddr6HYNMwPBEbYJjVt7mzJ9Q5LCLXQvXej2XSxSpjV35+Eti1aLutyfs3sgLYNMX7+sauRts69QmOH6i4wmL3LeILoLyI6n8gDuyDsjjKDWShUqQwy3Q1cFLGDu47gTRauVMaMeNjDJrRGj+3lfJ4W2N2Ro9Sm5jHWxKdex8B9bi7vwC776etSGkfHViMA52b/19iQG1/znVD+bYQaN1gNuFYmuP16yH/k8jnfAnyNRO0tyN90awQTV2/zjt1sufRe3czzuOobfb8=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966006)(36840700001)(54906003)(6666004)(1076003)(6916009)(82740400003)(47076005)(4326008)(9786002)(7636003)(26005)(70586007)(356005)(44832011)(426003)(7696005)(186003)(82310400003)(70206006)(107886003)(30864003)(2906002)(966005)(478600001)(8676002)(36860700001)(8936002)(316002)(36906005)(336012)(2616005)(83380400001)(5660300002)(36756003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 17:49:26.8651 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc35039a-18fc-422b-7933-08d9665e59d2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6963
Received-SPF: pass client-ip=40.107.101.44; envelope-from=tongh@xilinx.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 hw/nvram/xlnx-efuse-crc.c     | 118 ++++++++++++++++
 hw/nvram/xlnx-efuse.c         | 252 ++++++++++++++++++++++++++++++++++
 include/hw/nvram/xlnx-efuse.h |  80 +++++++++++
 3 files changed, 450 insertions(+)
 create mode 100644 hw/nvram/xlnx-efuse-crc.c
 create mode 100644 hw/nvram/xlnx-efuse.c
 create mode 100644 include/hw/nvram/xlnx-efuse.h

diff --git a/hw/nvram/xlnx-efuse-crc.c b/hw/nvram/xlnx-efuse-crc.c
new file mode 100644
index 0000000000..bc12c39e00
--- /dev/null
+++ b/hw/nvram/xlnx-efuse-crc.c
@@ -0,0 +1,118 @@
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
index 0000000000..09d48b0727
--- /dev/null
+++ b/hw/nvram/xlnx-efuse.c
@@ -0,0 +1,252 @@
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
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+
+#ifndef XLNX_EFUSE_ERR_DEBUG
+#define XLNX_EFUSE_ERR_DEBUG 0
+#endif
+
+#define XLNX_EFUSE(obj) \
+     OBJECT_CHECK(XLNXEFuse, (obj), TYPE_XLNX_EFUSE)
+
+#define TBIT0_OFFSET     28
+#define TBIT1_OFFSET     29
+#define TBIT2_OFFSET     30
+#define TBIT3_OFFSET     31
+#define TBITS_PATTERN    (0x0AU << TBIT0_OFFSET)
+#define TBITS_MASK       (0x0FU << TBIT0_OFFSET)
+
+bool xlnx_efuse_get_bit(XLNXEFuse *s, unsigned int bit)
+{
+    bool b = s->fuse32[bit / 32] & (1 << (bit % 32));
+    return b;
+}
+
+static void efuse_sync_bdrv(XLNXEFuse *s, unsigned int bit)
+{
+    const int bswap_adj = (const_le32(0x1234) != 0x1234 ? 3 : 0);
+    unsigned int efuse_byte;
+
+    if (!s->blk || s->blk_ro) {
+        return;  /* Silient on read-only backend to avoid message flood */
+    }
+
+    efuse_byte = bit / 8;
+
+    if (blk_pwrite(s->blk, efuse_byte,
+                   ((uint8_t *) s->fuse32) + (efuse_byte ^ bswap_adj),
+                   1, 0) < 0) {
+        error_report("%s: write error in byte %" PRIu32 ".",
+                      __func__, efuse_byte);
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
+static void efuse_ro_bits_sort(XLNXEFuse *s)
+{
+    uint32_t *ary = s->ro_bits;
+    const uint32_t cnt = s->ro_bits_cnt;
+
+    if (ary && cnt > 1) {
+        qsort(ary, cnt, sizeof(ary[0]), efuse_ro_bits_cmp);
+    }
+}
+
+static bool efuse_ro_bits_find(XLNXEFuse *s, uint32_t k)
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
+bool xlnx_efuse_set_bit(XLNXEFuse *s, unsigned int bit)
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
+    efuse_sync_bdrv(s, bit);
+    return true;
+}
+
+bool xlnx_efuse_k256_check(XLNXEFuse *s, uint32_t crc, unsigned start)
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
+uint32_t xlnx_efuse_tbits_check(XLNXEFuse *s)
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
+            efuse_sync_bdrv(s, (efuse_start_row_num * 32 + TBIT0_OFFSET));
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
+    XLNXEFuse *s = XLNX_EFUSE(dev);
+    BlockBackend *blk;
+    DriveInfo *dinfo;
+    unsigned int nr_bytes;
+    const char *prefix = object_get_canonical_path(OBJECT(dev));
+
+    if (s->drv_index < 0) {
+        /* Set legacy compatibility */
+        s->drv_index = s->efuse_size <= 2048 ? 3 : 1;
+    }
+
+    dinfo = drive_get_by_index(IF_PFLASH, s->drv_index);
+    blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
+
+    nr_bytes = ROUND_UP((s->efuse_nr * s->efuse_size) / 8, 4);
+    s->fuse32 = g_malloc0(nr_bytes);
+    if (blk) {
+        qdev_prop_set_drive(dev, "drive", blk);
+
+        s->blk_ro = !blk_supports_write_perm(s->blk);
+        if (s->blk_ro) {
+            warn_report("%s: update not saved: backstore is read-only",
+                        object_get_canonical_path(OBJECT(s)));
+        }
+        blk_set_perm(s->blk,
+                     (BLK_PERM_CONSISTENT_READ
+                      | (s->blk_ro ? 0 : BLK_PERM_WRITE)), BLK_PERM_ALL,
+                     &error_abort);
+
+        if (blk_pread(s->blk, 0, (void *) s->fuse32, nr_bytes) < 0) {
+            error_setg(&error_abort, "%s: Unable to read-out contents."
+                         "backing file too small? Expecting %" PRIu32" bytes",
+                          prefix,
+                          (unsigned int) (nr_bytes));
+        }
+        if (const_le32(0x1234) != 0x1234) {
+            /* Convert from little-endian backstore for each 32-bit row */
+            unsigned int nr_u32;
+
+            for (nr_u32 = 0; nr_u32 < (nr_bytes / 4); nr_u32++) {
+                s->fuse32[nr_u32] = le32_to_cpu(s->fuse32[nr_u32]);
+            }
+        }
+    }
+
+    /* Sort readonly-list for bsearch lookup */
+    efuse_ro_bits_sort(s);
+}
+
+static Property efuse_properties[] = {
+    DEFINE_PROP_UINT8("efuse-nr", XLNXEFuse, efuse_nr, 3),
+    DEFINE_PROP_UINT32("efuse-size", XLNXEFuse, efuse_size, 64 * 32),
+    DEFINE_PROP_INT32("drive-index", XLNXEFuse, drv_index, -1),
+    DEFINE_PROP_DRIVE("drive", XLNXEFuse, blk),
+    DEFINE_PROP_BOOL("init-factory-tbits", XLNXEFuse, init_tbits, true),
+    DEFINE_PROP_ARRAY("read-only", XLNXEFuse, ro_bits_cnt, ro_bits,
+                      qdev_prop_uint32, uint32_t),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static const VMStateDescription vmstate_efuse = {
+    .name = TYPE_XLNX_EFUSE,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .minimum_version_id_old = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void efuse_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = efuse_realize;
+    dc->vmsd = &vmstate_efuse;
+    device_class_set_props(dc, efuse_properties);
+}
+
+static const TypeInfo efuse_info = {
+    .name          = TYPE_XLNX_EFUSE,
+    .parent        = TYPE_DEVICE,
+    .instance_size = sizeof(XLNXEFuse),
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
index 0000000000..0aee3f84d7
--- /dev/null
+++ b/include/hw/nvram/xlnx-efuse.h
@@ -0,0 +1,80 @@
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
+#include "qemu/osdep.h"
+#include "sysemu/block-backend.h"
+#include "hw/qdev-core.h"
+
+#define TYPE_XLNX_EFUSE "xlnx,efuse"
+
+typedef struct XLNXEFuseLkSpec {
+    uint16_t row;
+    uint16_t lk_bit;
+} XLNXEFuseLkSpec;
+
+typedef struct XLNXEFuse {
+    DeviceState parent_obj;
+    BlockBackend *blk;
+    bool blk_ro;
+    uint32_t *fuse32;
+
+    DeviceState *dev;
+
+    bool init_tbits;
+    int drv_index;
+
+    uint8_t efuse_nr;
+    uint32_t efuse_size;
+
+    uint32_t *ro_bits;
+    uint32_t ro_bits_cnt;
+} XLNXEFuse;
+
+uint32_t xlnx_efuse_calc_crc(const uint32_t *data, unsigned u32_cnt,
+                             unsigned zpads);
+
+bool xlnx_efuse_get_bit(XLNXEFuse *s, unsigned int bit);
+bool xlnx_efuse_set_bit(XLNXEFuse *s, unsigned int bit);
+bool xlnx_efuse_k256_check(XLNXEFuse *s, uint32_t crc, unsigned start);
+uint32_t xlnx_efuse_tbits_check(XLNXEFuse *s);
+
+/* Return whole row containing the given bit address */
+static inline uint32_t xlnx_efuse_get_row(XLNXEFuse *s, unsigned int bit)
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


