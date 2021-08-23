Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE62B3F5001
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:58:29 +0200 (CEST)
Received: from localhost ([::1]:57042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIEDM-0006qU-Pm
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIE52-0005PG-Ij; Mon, 23 Aug 2021 13:49:52 -0400
Received: from mail-bn8nam08on2042.outbound.protection.outlook.com
 ([40.107.100.42]:60448 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIE4y-0001KJ-11; Mon, 23 Aug 2021 13:49:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jasHHy64KircSaSS0tGPtf5FKPR9wCyDp2QhbFvGCGXD0AKKsuNsl0Q5x1/60CxVolzRB/XO49o0OL3ZBI24XOvOj0Z4Xok2wya6BeuQcS7c7/HsRrbDPe1ARPZ1EoZ7hU6QzGW8KKIcgbLP/A9bj8d9ZjSLvpCk7nFaqop7O8XRtX+OzafxCZh7LFvzwhjEm2g9yXAYByMXnBi3v4NHDM0rNk1Ue4PX2roo0uwM1n/Wdh+G3NJXgNeUokTVczL0cmxxTHBZxhCGMJ1K21KMjCERJKekGvFrYwcNNGt/XqU1LIYTnn07DU62fDY7HnhU+NotRYp5z0vC7c4OS7MEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIZzrTHTPg2hvJkv5+tkdgiz9LRtNILel/0waexwFcU=;
 b=DfrnKV0OZDtxLuAvxKplKb2LlUbG9IQnHJwuerth5/ALB8sgitUTBwe83TjcQ5hnPjIxYGgDP9hYjJUTpSheys8wLFtpCruVT4vmBjwtyupZ+RZYE0KOWSHn1wm2gq+i0oyaETWj+xnCFMLvU8LVSjkQQ8zixGPTqdyiuVL1FLiZiNEXoKk/XD1GiYTCn8ajugkEKa/jU0YhuuYapDJXANJ69xuyWbJWE0WZZ13mb4N2gVPX1tQLvh/SaII9aD46S6Mv4xp1pDdG2KNWG8FTguuVET0s0u1lxjxmT9WeO3SWMEzfDHSLDziSCccz1kdemQVbDQvvZPunrZcJd7pyLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIZzrTHTPg2hvJkv5+tkdgiz9LRtNILel/0waexwFcU=;
 b=s+u5C4hitPuGTtc2C5yBHGGnTOeYRzUvT3GiMluOc2JTVkwuePvooe/M92vVtdOeaPMR60CX2XaFX525TT28VjXoUN1cgxMqOr6lKSs+ZElSkLlEHvo6q9DjwfHNAunWvjdh8rn6qrT+VgKDq+ku8Pem13UWO1pWLwVaPrEQpRU=
Received: from DM5PR2001CA0020.namprd20.prod.outlook.com (2603:10b6:4:16::30)
 by BN7PR02MB5043.namprd02.prod.outlook.com (2603:10b6:408:21::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Mon, 23 Aug
 2021 17:49:37 +0000
Received: from DM3NAM02FT004.eop-nam02.prod.protection.outlook.com
 (2603:10b6:4:16:cafe::8) by DM5PR2001CA0020.outlook.office365.com
 (2603:10b6:4:16::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 17:49:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT004.mail.protection.outlook.com (10.13.5.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 17:49:37 +0000
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
 id 1mIE4a-0007u4-OP; Mon, 23 Aug 2021 10:49:24 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH v2 3/9] hw/nvram: Introduce Xilinx ZynqMP eFuse device
Date: Mon, 23 Aug 2021 10:49:18 -0700
Message-ID: <20210823174924.201669-4-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823174924.201669-1-tong.ho@xilinx.com>
References: <20210823174924.201669-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 871a283d-3027-4087-83cd-08d9665e6039
X-MS-TrafficTypeDiagnostic: BN7PR02MB5043:
X-Microsoft-Antispam-PRVS: <BN7PR02MB5043E0757A471E7556243A44CDC49@BN7PR02MB5043.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RH26ZkHUn82DlmRRvE6Fni5eSu+9dsE1YOEowNHUHSgZlajftjDqGhOBXs8XkYkr58zjgt1E8qxW24Rm4fHij0UY5UkFQRG6h7FyEYqUWhvWjy59veTyymvA6+uG4HdzCCOrhWtoPFHqtR+c7gRjQp7PnL6gE6nq4dbgWyzFDcHl87op7+vpZZhIuR2vzFC5glj/Wsm1/cdeNzJZ4bkRX3gvfrp24KavBV/SGcMkYfAnVGSQ9eW8GKK5pW7B6sTkW4yY7K/5kF9qV321wEUKq8VeeAq53MiyTMC+vwsiFMr70WxRcOPAUyAFq6xe0Q97F6+58TDe62VFYSx8q3dFiCxFSbAvUVu96vIP3O+oJn+Z3MQhCVGZsOi1IVqchhv2joEQrb08pSF8zNH/lBxp0AT+COzwBemGFapOWrCJ2B0MMUp1CFpiVeL8et2TVeEpAE6RXdN7hKqF4fc0uKXnipN2JET8IWR12rMKvQ40SOvUecOuq7GgA0vPF9ZhDcFngzgtH+3n8kqjqvuhAViFRoT3PgPZ4gCZAKl/CpHv+mcaa2KjRE+zMush3pAcgwUacdaJUhr6uzbOWwkrRX5UPanxxCN4hbb1qr7iqWhHbg0cC+dx3VqLZKdXU9I2kavjyN5SyT6xQRnbzHEahlR/gCu9kAewe+Askh9R752L4nw8ADjZ1p1h00T+8z+dyPy4x90Ugrk9sx0WjGhc1MxlcArniMNBms9Rbp6Peff1K3U=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966006)(36840700001)(1076003)(47076005)(36906005)(2616005)(107886003)(82310400003)(44832011)(478600001)(336012)(2906002)(83380400001)(8936002)(30864003)(36756003)(4326008)(82740400003)(426003)(6916009)(70206006)(70586007)(186003)(7696005)(5660300002)(9786002)(6666004)(26005)(356005)(54906003)(8676002)(316002)(7636003)(36860700001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 17:49:37.5787 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 871a283d-3027-4087-83cd-08d9665e6039
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT004.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5043
Received-SPF: pass client-ip=40.107.100.42; envelope-from=tongh@xilinx.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
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

This implements the Xilinx ZynqMP eFuse, an one-time
field-programmable non-volatile storage device.  There is
only one such device in the Xilinx ZynqMP product family.

The command argument:
  -drive if=pflash,index=N,...
Can be used to optionally connect the storage array to a
backend storage, such that field-programmed values in one
invocation can be made available to next invocation.

The backend storage must be a seekable binary file, and
its size must be 768 bytes or larger. A file with all
binary 0's is a 'blank'.

The drive 'index' value N has a default value of 3, but
can be changed using command argument:
  -global xlnx,efuse.drive-index=N

Co-authored-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Co-authored-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/nvram/Kconfig                     |   5 +
 hw/nvram/meson.build                 |   2 +
 hw/nvram/xlnx-zynqmp-efuse.c         | 860 +++++++++++++++++++++++++++
 include/hw/nvram/xlnx-zynqmp-efuse.h |  45 ++
 4 files changed, 912 insertions(+)
 create mode 100644 hw/nvram/xlnx-zynqmp-efuse.c
 create mode 100644 include/hw/nvram/xlnx-zynqmp-efuse.h

diff --git a/hw/nvram/Kconfig b/hw/nvram/Kconfig
index e96749ced3..cc3ed789fe 100644
--- a/hw/nvram/Kconfig
+++ b/hw/nvram/Kconfig
@@ -23,3 +23,8 @@ config XLNX_EFUSE_VERSAL
     bool
     default y if XLNX_VERSAL
     select XLNX_EFUSE
+
+config XLNX_EFUSE_ZYNQMP
+    bool
+    default y if XLNX_ZYNQMP
+    select XLNX_EFUSE
diff --git a/hw/nvram/meson.build b/hw/nvram/meson.build
index a432665158..f364520ad5 100644
--- a/hw/nvram/meson.build
+++ b/hw/nvram/meson.build
@@ -13,6 +13,8 @@ softmmu_ss.add(when: 'CONFIG_XLNX_EFUSE', if_true: files('xlnx-efuse.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_EFUSE_VERSAL', if_true: files(
                                                    'xlnx-versal-efuse-cache.c',
                                                    'xlnx-versal-efuse-ctrl.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_EFUSE_ZYNQMP', if_true: files(
+                                                   'xlnx-zynqmp-efuse.c'))
 if 'CONFIG_XLNX_BBRAM' in config_all or \
    'CONFIG_XLNX_EFUSE' in config_all
   softmmu_ss.add(files('xlnx-efuse-crc.c'))
diff --git a/hw/nvram/xlnx-zynqmp-efuse.c b/hw/nvram/xlnx-zynqmp-efuse.c
new file mode 100644
index 0000000000..a16a00aa55
--- /dev/null
+++ b/hw/nvram/xlnx-zynqmp-efuse.c
@@ -0,0 +1,860 @@
+/*
+ * QEMU model of the ZynqMP eFuse
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
+#include "hw/nvram/xlnx-zynqmp-efuse.h"
+
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+
+#ifndef ZYNQMP_EFUSE_ERR_DEBUG
+#define ZYNQMP_EFUSE_ERR_DEBUG 0
+#endif
+
+#define ZYNQMP_EFUSE(obj) \
+     OBJECT_CHECK(XlnxZynqMPEFuse, (obj), TYPE_XLNX_ZYNQMP_EFUSE)
+
+REG32(WR_LOCK, 0x0)
+    FIELD(WR_LOCK, LOCK, 0, 16)
+REG32(CFG, 0x4)
+    FIELD(CFG, SLVERR_ENABLE, 5, 1)
+    FIELD(CFG, MARGIN_RD, 2, 2)
+    FIELD(CFG, PGM_EN, 1, 1)
+    FIELD(CFG, EFUSE_CLK_SEL, 0, 1)
+REG32(STATUS, 0x8)
+    FIELD(STATUS, AES_CRC_PASS, 7, 1)
+    FIELD(STATUS, AES_CRC_DONE, 6, 1)
+    FIELD(STATUS, CACHE_DONE, 5, 1)
+    FIELD(STATUS, CACHE_LOAD, 4, 1)
+    FIELD(STATUS, EFUSE_3_TBIT, 2, 1)
+    FIELD(STATUS, EFUSE_2_TBIT, 1, 1)
+    FIELD(STATUS, EFUSE_0_TBIT, 0, 1)
+REG32(EFUSE_PGM_ADDR, 0xc)
+    FIELD(EFUSE_PGM_ADDR, EFUSE, 11, 2)
+    FIELD(EFUSE_PGM_ADDR, ROW, 5, 6)
+    FIELD(EFUSE_PGM_ADDR, COLUMN, 0, 5)
+REG32(EFUSE_RD_ADDR, 0x10)
+    FIELD(EFUSE_RD_ADDR, EFUSE, 11, 2)
+    FIELD(EFUSE_RD_ADDR, ROW, 5, 6)
+REG32(EFUSE_RD_DATA, 0x14)
+REG32(TPGM, 0x18)
+    FIELD(TPGM, VALUE, 0, 16)
+REG32(TRD, 0x1c)
+    FIELD(TRD, VALUE, 0, 8)
+REG32(TSU_H_PS, 0x20)
+    FIELD(TSU_H_PS, VALUE, 0, 8)
+REG32(TSU_H_PS_CS, 0x24)
+    FIELD(TSU_H_PS_CS, VALUE, 0, 8)
+REG32(TSU_H_CS, 0x2c)
+    FIELD(TSU_H_CS, VALUE, 0, 4)
+REG32(EFUSE_ISR, 0x30)
+    FIELD(EFUSE_ISR, APB_SLVERR, 31, 1)
+    FIELD(EFUSE_ISR, CACHE_ERROR, 4, 1)
+    FIELD(EFUSE_ISR, RD_ERROR, 3, 1)
+    FIELD(EFUSE_ISR, RD_DONE, 2, 1)
+    FIELD(EFUSE_ISR, PGM_ERROR, 1, 1)
+    FIELD(EFUSE_ISR, PGM_DONE, 0, 1)
+REG32(EFUSE_IMR, 0x34)
+    FIELD(EFUSE_IMR, APB_SLVERR, 31, 1)
+    FIELD(EFUSE_IMR, CACHE_ERROR, 4, 1)
+    FIELD(EFUSE_IMR, RD_ERROR, 3, 1)
+    FIELD(EFUSE_IMR, RD_DONE, 2, 1)
+    FIELD(EFUSE_IMR, PGM_ERROR, 1, 1)
+    FIELD(EFUSE_IMR, PGM_DONE, 0, 1)
+REG32(EFUSE_IER, 0x38)
+    FIELD(EFUSE_IER, APB_SLVERR, 31, 1)
+    FIELD(EFUSE_IER, CACHE_ERROR, 4, 1)
+    FIELD(EFUSE_IER, RD_ERROR, 3, 1)
+    FIELD(EFUSE_IER, RD_DONE, 2, 1)
+    FIELD(EFUSE_IER, PGM_ERROR, 1, 1)
+    FIELD(EFUSE_IER, PGM_DONE, 0, 1)
+REG32(EFUSE_IDR, 0x3c)
+    FIELD(EFUSE_IDR, APB_SLVERR, 31, 1)
+    FIELD(EFUSE_IDR, CACHE_ERROR, 4, 1)
+    FIELD(EFUSE_IDR, RD_ERROR, 3, 1)
+    FIELD(EFUSE_IDR, RD_DONE, 2, 1)
+    FIELD(EFUSE_IDR, PGM_ERROR, 1, 1)
+    FIELD(EFUSE_IDR, PGM_DONE, 0, 1)
+REG32(EFUSE_CACHE_LOAD, 0x40)
+    FIELD(EFUSE_CACHE_LOAD, LOAD, 0, 1)
+REG32(EFUSE_PGM_LOCK, 0x44)
+    FIELD(EFUSE_PGM_LOCK, SPK_ID_LOCK, 0, 1)
+REG32(EFUSE_AES_CRC, 0x48)
+REG32(EFUSE_TBITS_PRGRMG_EN, 0x100)
+    FIELD(EFUSE_TBITS_PRGRMG_EN, TBITS_PRGRMG_EN, 3, 1)
+REG32(DNA_0, 0x100c)
+REG32(DNA_1, 0x1010)
+REG32(DNA_2, 0x1014)
+REG32(IPDISABLE, 0x1018)
+    FIELD(IPDISABLE, VCU_DIS, 8, 1)
+    FIELD(IPDISABLE, GPU_DIS, 5, 1)
+    FIELD(IPDISABLE, APU3_DIS, 3, 1)
+    FIELD(IPDISABLE, APU2_DIS, 2, 1)
+    FIELD(IPDISABLE, APU1_DIS, 1, 1)
+    FIELD(IPDISABLE, APU0_DIS, 0, 1)
+REG32(SYSOSC_CTRL, 0x101c)
+    FIELD(SYSOSC_CTRL, SYSOSC_EN, 0, 1)
+REG32(USER_0, 0x1020)
+REG32(USER_1, 0x1024)
+REG32(USER_2, 0x1028)
+REG32(USER_3, 0x102c)
+REG32(USER_4, 0x1030)
+REG32(USER_5, 0x1034)
+REG32(USER_6, 0x1038)
+REG32(USER_7, 0x103c)
+REG32(MISC_USER_CTRL, 0x1040)
+    FIELD(MISC_USER_CTRL, FPD_SC_EN_0, 14, 1)
+    FIELD(MISC_USER_CTRL, LPD_SC_EN_0, 11, 1)
+    FIELD(MISC_USER_CTRL, LBIST_EN, 10, 1)
+    FIELD(MISC_USER_CTRL, USR_WRLK_7, 7, 1)
+    FIELD(MISC_USER_CTRL, USR_WRLK_6, 6, 1)
+    FIELD(MISC_USER_CTRL, USR_WRLK_5, 5, 1)
+    FIELD(MISC_USER_CTRL, USR_WRLK_4, 4, 1)
+    FIELD(MISC_USER_CTRL, USR_WRLK_3, 3, 1)
+    FIELD(MISC_USER_CTRL, USR_WRLK_2, 2, 1)
+    FIELD(MISC_USER_CTRL, USR_WRLK_1, 1, 1)
+    FIELD(MISC_USER_CTRL, USR_WRLK_0, 0, 1)
+REG32(ROM_RSVD, 0x1044)
+    FIELD(ROM_RSVD, PBR_BOOT_ERROR, 0, 3)
+REG32(PUF_CHASH, 0x1050)
+REG32(PUF_MISC, 0x1054)
+    FIELD(PUF_MISC, REGISTER_DIS, 31, 1)
+    FIELD(PUF_MISC, SYN_WRLK, 30, 1)
+    FIELD(PUF_MISC, SYN_INVLD, 29, 1)
+    FIELD(PUF_MISC, TEST2_DIS, 28, 1)
+    FIELD(PUF_MISC, UNUSED27, 27, 1)
+    FIELD(PUF_MISC, UNUSED26, 26, 1)
+    FIELD(PUF_MISC, UNUSED25, 25, 1)
+    FIELD(PUF_MISC, UNUSED24, 24, 1)
+    FIELD(PUF_MISC, AUX, 0, 24)
+REG32(SEC_CTRL, 0x1058)
+    FIELD(SEC_CTRL, PPK1_INVLD, 30, 2)
+    FIELD(SEC_CTRL, PPK1_WRLK, 29, 1)
+    FIELD(SEC_CTRL, PPK0_INVLD, 27, 2)
+    FIELD(SEC_CTRL, PPK0_WRLK, 26, 1)
+    FIELD(SEC_CTRL, RSA_EN, 11, 15)
+    FIELD(SEC_CTRL, SEC_LOCK, 10, 1)
+    FIELD(SEC_CTRL, PROG_GATE_2, 9, 1)
+    FIELD(SEC_CTRL, PROG_GATE_1, 8, 1)
+    FIELD(SEC_CTRL, PROG_GATE_0, 7, 1)
+    FIELD(SEC_CTRL, DFT_DIS, 6, 1)
+    FIELD(SEC_CTRL, JTAG_DIS, 5, 1)
+    FIELD(SEC_CTRL, ERROR_DIS, 4, 1)
+    FIELD(SEC_CTRL, BBRAM_DIS, 3, 1)
+    FIELD(SEC_CTRL, ENC_ONLY, 2, 1)
+    FIELD(SEC_CTRL, AES_WRLK, 1, 1)
+    FIELD(SEC_CTRL, AES_RDLK, 0, 1)
+REG32(SPK_ID, 0x105c)
+REG32(PPK0_0, 0x10a0)
+REG32(PPK0_1, 0x10a4)
+REG32(PPK0_2, 0x10a8)
+REG32(PPK0_3, 0x10ac)
+REG32(PPK0_4, 0x10b0)
+REG32(PPK0_5, 0x10b4)
+REG32(PPK0_6, 0x10b8)
+REG32(PPK0_7, 0x10bc)
+REG32(PPK0_8, 0x10c0)
+REG32(PPK0_9, 0x10c4)
+REG32(PPK0_10, 0x10c8)
+REG32(PPK0_11, 0x10cc)
+REG32(PPK1_0, 0x10d0)
+REG32(PPK1_1, 0x10d4)
+REG32(PPK1_2, 0x10d8)
+REG32(PPK1_3, 0x10dc)
+REG32(PPK1_4, 0x10e0)
+REG32(PPK1_5, 0x10e4)
+REG32(PPK1_6, 0x10e8)
+REG32(PPK1_7, 0x10ec)
+REG32(PPK1_8, 0x10f0)
+REG32(PPK1_9, 0x10f4)
+REG32(PPK1_10, 0x10f8)
+REG32(PPK1_11, 0x10fc)
+
+#define BIT_POS(ROW, COLUMN)    (ROW * 32 + COLUMN)
+#define R_MAX (R_PPK1_11 + 1)
+
+/* #define EFUSE_XOSC            26 */
+
+/*
+ * eFUSE layout references:
+ *   ZynqMP: UG1085 (v2.1) August 21, 2019, p.277, Table 12-13
+ */
+#define EFUSE_AES_RDLK        BIT_POS(22, 0)
+#define EFUSE_AES_WRLK        BIT_POS(22, 1)
+#define EFUSE_ENC_ONLY        BIT_POS(22, 2)
+#define EFUSE_BBRAM_DIS       BIT_POS(22, 3)
+#define EFUSE_ERROR_DIS       BIT_POS(22, 4)
+#define EFUSE_JTAG_DIS        BIT_POS(22, 5)
+#define EFUSE_DFT_DIS         BIT_POS(22, 6)
+#define EFUSE_PROG_GATE_0     BIT_POS(22, 7)
+#define EFUSE_PROG_GATE_1     BIT_POS(22, 7)
+#define EFUSE_PROG_GATE_2     BIT_POS(22, 9)
+#define EFUSE_SEC_LOCK        BIT_POS(22, 10)
+#define EFUSE_RSA_EN          BIT_POS(22, 11)
+#define EFUSE_RSA_EN14        BIT_POS(22, 25)
+#define EFUSE_PPK0_WRLK       BIT_POS(22, 26)
+#define EFUSE_PPK0_INVLD      BIT_POS(22, 27)
+#define EFUSE_PPK0_INVLD_1    BIT_POS(22, 28)
+#define EFUSE_PPK1_WRLK       BIT_POS(22, 29)
+#define EFUSE_PPK1_INVLD      BIT_POS(22, 30)
+#define EFUSE_PPK1_INVLD_1    BIT_POS(22, 31)
+
+/* Areas.  */
+#define EFUSE_TRIM_START      BIT_POS(1, 0)
+#define EFUSE_TRIM_END        BIT_POS(1, 30)
+#define EFUSE_DNA_START       BIT_POS(3, 0)
+#define EFUSE_DNA_END         BIT_POS(5, 31)
+#define EFUSE_AES_START       BIT_POS(24, 0)
+#define EFUSE_AES_END         BIT_POS(31, 31)
+#define EFUSE_ROM_START       BIT_POS(17, 0)
+#define EFUSE_ROM_END         BIT_POS(17, 31)
+#define EFUSE_IPDIS_START     BIT_POS(6, 0)
+#define EFUSE_IPDIS_END       BIT_POS(6, 31)
+#define EFUSE_USER_START      BIT_POS(8, 0)
+#define EFUSE_USER_END        BIT_POS(15, 31)
+#define EFUSE_BISR_START      BIT_POS(32, 0)
+#define EFUSE_BISR_END        BIT_POS(39, 31)
+
+#define EFUSE_USER_CTRL_START BIT_POS(16, 0)
+#define EFUSE_USER_CTRL_END   BIT_POS(16, 16)
+#define EFUSE_USER_CTRL_MASK  ((uint32_t)MAKE_64BIT_MASK(0, 17))
+
+#define EFUSE_PUF_CHASH_START BIT_POS(20, 0)
+#define EFUSE_PUF_CHASH_END   BIT_POS(20, 31)
+#define EFUSE_PUF_MISC_START  BIT_POS(21, 0)
+#define EFUSE_PUF_MISC_END    BIT_POS(21, 31)
+#define EFUSE_PUF_SYN_WRLK    BIT_POS(21, 30)
+
+#define EFUSE_SPK_START       BIT_POS(23, 0)
+#define EFUSE_SPK_END         BIT_POS(23, 31)
+
+#define EFUSE_PPK0_START      BIT_POS(40, 0)
+#define EFUSE_PPK0_END        BIT_POS(51, 31)
+#define EFUSE_PPK1_START      BIT_POS(52, 0)
+#define EFUSE_PPK1_END        BIT_POS(63, 31)
+
+#define EFUSE_CACHE_FLD(s, reg, field) \
+    ARRAY_FIELD_DP32((s)->regs, reg, field, \
+                     (xlnx_efuse_get_row((s->efuse), EFUSE_ ## field) \
+                      >> (EFUSE_ ## field % 32)))
+
+#define EFUSE_CACHE_BIT(s, reg, field) \
+    ARRAY_FIELD_DP32((s)->regs, reg, field, xlnx_efuse_get_bit((s->efuse), \
+                EFUSE_ ## field))
+
+#define FBIT_UNKNOWN (~0)
+
+QEMU_BUILD_BUG_ON(R_MAX != ARRAY_SIZE(((XlnxZynqMPEFuse *)0)->regs));
+
+static void update_tbit_status(XlnxZynqMPEFuse *s)
+{
+    unsigned int check = xlnx_efuse_tbits_check(s->efuse);
+    uint32_t val = s->regs[R_STATUS];
+
+    val = FIELD_DP32(val, STATUS, EFUSE_0_TBIT, !!(check & (1 << 0)));
+    val = FIELD_DP32(val, STATUS, EFUSE_2_TBIT, !!(check & (1 << 1)));
+    val = FIELD_DP32(val, STATUS, EFUSE_3_TBIT, !!(check & (1 << 2)));
+
+    s->regs[R_STATUS] = val;
+}
+
+/* Update the u32 array from efuse bits. Slow but simple approach.  */
+static void cache_sync_u32(XlnxZynqMPEFuse *s, unsigned int r_start,
+                           unsigned int f_start, unsigned int f_end,
+                           unsigned int f_written)
+{
+    uint32_t *u32 = &s->regs[r_start];
+    unsigned int fbit, wbits = 0, u32_off = 0;
+
+    /* Avoid working on bits that are not relevant.  */
+    if (f_written != FBIT_UNKNOWN
+        && (f_written < f_start || f_written > f_end)) {
+        return;
+    }
+
+    for (fbit = f_start; fbit <= f_end; fbit++, wbits++) {
+        if (wbits == 32) {
+            /* Update the key offset.  */
+            u32_off += 1;
+            wbits = 0;
+        }
+        u32[u32_off] |= xlnx_efuse_get_bit(s->efuse, fbit) << wbits;
+    }
+}
+
+/*
+ * Keep the syncs in bit order so we can bail out for the
+ * slower ones.
+ */
+static void zynqmp_efuse_sync_cache(XlnxZynqMPEFuse *s, unsigned int bit)
+{
+    EFUSE_CACHE_BIT(s, SEC_CTRL, AES_RDLK);
+    EFUSE_CACHE_BIT(s, SEC_CTRL, AES_WRLK);
+    EFUSE_CACHE_BIT(s, SEC_CTRL, ENC_ONLY);
+    EFUSE_CACHE_BIT(s, SEC_CTRL, BBRAM_DIS);
+    EFUSE_CACHE_BIT(s, SEC_CTRL, ERROR_DIS);
+    EFUSE_CACHE_BIT(s, SEC_CTRL, JTAG_DIS);
+    EFUSE_CACHE_BIT(s, SEC_CTRL, DFT_DIS);
+    EFUSE_CACHE_BIT(s, SEC_CTRL, PROG_GATE_0);
+    EFUSE_CACHE_BIT(s, SEC_CTRL, PROG_GATE_1);
+    EFUSE_CACHE_BIT(s, SEC_CTRL, PROG_GATE_2);
+    EFUSE_CACHE_BIT(s, SEC_CTRL, SEC_LOCK);
+    EFUSE_CACHE_BIT(s, SEC_CTRL, PPK0_WRLK);
+    EFUSE_CACHE_BIT(s, SEC_CTRL, PPK1_WRLK);
+
+    EFUSE_CACHE_FLD(s, SEC_CTRL, RSA_EN);
+    EFUSE_CACHE_FLD(s, SEC_CTRL, PPK0_INVLD);
+    EFUSE_CACHE_FLD(s, SEC_CTRL, PPK1_INVLD);
+
+    /* Update the tbits.  */
+    update_tbit_status(s);
+
+    /* Sync the various areas.  */
+    s->regs[R_MISC_USER_CTRL] = xlnx_efuse_get_row(s->efuse,
+                                                   EFUSE_USER_CTRL_START)
+                                & EFUSE_USER_CTRL_MASK;
+    s->regs[R_PUF_CHASH] = xlnx_efuse_get_row(s->efuse, EFUSE_PUF_CHASH_START);
+    s->regs[R_PUF_MISC]  = xlnx_efuse_get_row(s->efuse, EFUSE_PUF_MISC_START);
+
+    cache_sync_u32(s, R_DNA_0, EFUSE_DNA_START, EFUSE_DNA_END, bit);
+
+    if (bit < EFUSE_AES_START) {
+        return;
+    }
+
+    cache_sync_u32(s, R_ROM_RSVD, EFUSE_ROM_START, EFUSE_ROM_END, bit);
+    cache_sync_u32(s, R_IPDISABLE, EFUSE_IPDIS_START, EFUSE_IPDIS_END, bit);
+    cache_sync_u32(s, R_USER_0, EFUSE_USER_START, EFUSE_USER_END, bit);
+    cache_sync_u32(s, R_SPK_ID, EFUSE_SPK_START, EFUSE_SPK_END, bit);
+    cache_sync_u32(s, R_PPK0_0, EFUSE_PPK0_START, EFUSE_PPK0_END, bit);
+    cache_sync_u32(s, R_PPK1_0, EFUSE_PPK1_START, EFUSE_PPK1_END, bit);
+}
+
+static void zynqmp_efuse_update_irq(XlnxZynqMPEFuse *s)
+{
+    bool pending = s->regs[R_EFUSE_ISR] & s->regs[R_EFUSE_IMR];
+    qemu_set_irq(s->irq, pending);
+}
+
+static void zynqmp_efuse_isr_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPEFuse *s = ZYNQMP_EFUSE(reg->opaque);
+    zynqmp_efuse_update_irq(s);
+}
+
+static uint64_t zynqmp_efuse_ier_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPEFuse *s = ZYNQMP_EFUSE(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_EFUSE_IMR] |= val;
+    zynqmp_efuse_update_irq(s);
+    return 0;
+}
+
+static uint64_t zynqmp_efuse_idr_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPEFuse *s = ZYNQMP_EFUSE(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_EFUSE_IMR] &= ~val;
+    zynqmp_efuse_update_irq(s);
+    return 0;
+}
+
+static void zynqmp_efuse_pgm_addr_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPEFuse *s = ZYNQMP_EFUSE(reg->opaque);
+    unsigned bit = val64;
+    unsigned page = FIELD_EX32(bit, EFUSE_PGM_ADDR, EFUSE);
+    bool puf_prot = false;
+    const char *errmsg = NULL;
+
+    /* Allow only valid array, and adjust for skipped array 1 */
+    switch (page) {
+    case 0:
+        break;
+    case 2 ... 3:
+        bit = FIELD_DP32(bit, EFUSE_PGM_ADDR, EFUSE, page - 1);
+        puf_prot = xlnx_efuse_get_bit(s->efuse, EFUSE_PUF_SYN_WRLK);
+        break;
+    default:
+        errmsg = "Invalid address";
+        goto pgm_done;
+    }
+
+    if (ARRAY_FIELD_EX32(s->regs, WR_LOCK, LOCK)) {
+        errmsg = "Array write-locked";
+        goto pgm_done;
+    }
+
+    if (!ARRAY_FIELD_EX32(s->regs, CFG, PGM_EN)) {
+        errmsg = "Array pgm-disabled";
+        goto pgm_done;
+    }
+
+    if (puf_prot) {
+        errmsg = "PUF_HD-store write-locked";
+        goto pgm_done;
+    }
+
+    if (ARRAY_FIELD_EX32(s->regs, SEC_CTRL, AES_WRLK)
+        && bit >= EFUSE_AES_START && bit <= EFUSE_AES_END) {
+        errmsg = "AES key-store Write-locked";
+        goto pgm_done;
+    }
+
+    if (!xlnx_efuse_set_bit(s->efuse, bit)) {
+        errmsg = "Write failed";
+    }
+
+ pgm_done:
+    if (!errmsg) {
+        ARRAY_FIELD_DP32(s->regs, EFUSE_ISR, PGM_ERROR, 0);
+    } else {
+        ARRAY_FIELD_DP32(s->regs, EFUSE_ISR, PGM_ERROR, 1);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s - eFuse write error: %s; addr=0x%x\n",
+                      object_get_canonical_path(OBJECT(s)),
+                      errmsg, (unsigned)val64);
+    }
+
+    ARRAY_FIELD_DP32(s->regs, EFUSE_ISR, PGM_DONE, 1);
+    zynqmp_efuse_update_irq(s);
+}
+
+static void zynqmp_efuse_rd_addr_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPEFuse *s = ZYNQMP_EFUSE(reg->opaque);
+
+    /*
+     * Grant reads only to allowed bits; reference sources:
+     * 1/ XilSKey - XilSKey_ZynqMp_EfusePs_ReadRow()
+     * 2/ UG1085, v2.0, table 12-13
+     * (note: enumerates the masks as <first, last> per described in
+     *  references to avoid mental translation).
+     */
+#define COL_MASK(L_, H_) \
+    ((uint32_t)MAKE_64BIT_MASK((L_), (1 + (H_) - (L_))))
+
+    static const uint32_t ary0_col_mask[] = {
+        /* XilSKey - XSK_ZYNQMP_EFUSEPS_TBITS_ROW */
+        [0]  = COL_MASK(28, 31),
+
+        /* XilSKey - XSK_ZYNQMP_EFUSEPS_USR{0:7}_FUSE_ROW */
+        [8]  = COL_MASK(0, 31), [9]  = COL_MASK(0, 31),
+        [10] = COL_MASK(0, 31), [11] = COL_MASK(0, 31),
+        [12] = COL_MASK(0, 31), [13] = COL_MASK(0, 31),
+        [14] = COL_MASK(0, 31), [15] = COL_MASK(0, 31),
+
+        /* XilSKey - XSK_ZYNQMP_EFUSEPS_MISC_USR_CTRL_ROW */
+        [16] = COL_MASK(0, 7) | COL_MASK(10, 16),
+
+        /* XilSKey - XSK_ZYNQMP_EFUSEPS_PBR_BOOT_ERR_ROW */
+        [17] = COL_MASK(0, 2),
+
+        /* XilSKey - XSK_ZYNQMP_EFUSEPS_PUF_CHASH_ROW */
+        [20] = COL_MASK(0, 31),
+
+        /* XilSKey - XSK_ZYNQMP_EFUSEPS_PUF_AUX_ROW */
+        [21] = COL_MASK(0, 23) | COL_MASK(29, 31),
+
+        /* XilSKey - XSK_ZYNQMP_EFUSEPS_SEC_CTRL_ROW */
+        [22] = COL_MASK(0, 31),
+
+        /* XilSKey - XSK_ZYNQMP_EFUSEPS_SPK_ID_ROW */
+        [23] = COL_MASK(0, 31),
+
+        /* XilSKey - XSK_ZYNQMP_EFUSEPS_PPK0_START_ROW */
+        [40] = COL_MASK(0, 31), [41] = COL_MASK(0, 31),
+        [42] = COL_MASK(0, 31), [43] = COL_MASK(0, 31),
+        [44] = COL_MASK(0, 31), [45] = COL_MASK(0, 31),
+        [46] = COL_MASK(0, 31), [47] = COL_MASK(0, 31),
+        [48] = COL_MASK(0, 31), [49] = COL_MASK(0, 31),
+        [50] = COL_MASK(0, 31), [51] = COL_MASK(0, 31),
+
+        /* XilSKey - XSK_ZYNQMP_EFUSEPS_PPK1_START_ROW */
+        [52] = COL_MASK(0, 31), [53] = COL_MASK(0, 31),
+        [54] = COL_MASK(0, 31), [55] = COL_MASK(0, 31),
+        [56] = COL_MASK(0, 31), [57] = COL_MASK(0, 31),
+        [58] = COL_MASK(0, 31), [59] = COL_MASK(0, 31),
+        [60] = COL_MASK(0, 31), [61] = COL_MASK(0, 31),
+        [62] = COL_MASK(0, 31), [63] = COL_MASK(0, 31),
+    };
+
+    uint32_t col_mask = COL_MASK(0, 31);
+#undef COL_MASK
+
+    uint32_t efuse_idx = s->regs[R_EFUSE_RD_ADDR];
+    uint32_t efuse_ary = FIELD_EX32(efuse_idx, EFUSE_RD_ADDR, EFUSE);
+    uint32_t efuse_row = FIELD_EX32(efuse_idx, EFUSE_RD_ADDR, ROW);
+
+    switch (efuse_ary) {
+    case 0:     /* Various */
+        if (efuse_row >= ARRAY_SIZE(ary0_col_mask)) {
+            goto denied;
+        }
+
+        col_mask = ary0_col_mask[efuse_row];
+        if (!col_mask) {
+            goto denied;
+        }
+        break;
+    case 2:     /* PUF helper data, adjust for skipped array 1 */
+    case 3:
+        val64 = FIELD_DP32(efuse_idx, EFUSE_RD_ADDR, EFUSE, efuse_ary - 1);
+        break;
+    default:
+        goto denied;
+    }
+
+    s->regs[R_EFUSE_RD_DATA] = xlnx_efuse_get_row(s->efuse, val64) & col_mask;
+
+    ARRAY_FIELD_DP32(s->regs, EFUSE_ISR, RD_ERROR, 0);
+    ARRAY_FIELD_DP32(s->regs, EFUSE_ISR, RD_DONE, 1);
+    zynqmp_efuse_update_irq(s);
+    return;
+
+ denied:
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: Denied efuse read from array %u, row %u\n",
+                  object_get_canonical_path(OBJECT(s)),
+                  efuse_ary, efuse_row);
+
+    s->regs[R_EFUSE_RD_DATA] = 0;
+
+    ARRAY_FIELD_DP32(s->regs, EFUSE_ISR, RD_ERROR, 1);
+    ARRAY_FIELD_DP32(s->regs, EFUSE_ISR, RD_DONE, 0);
+    zynqmp_efuse_update_irq(s);
+}
+
+static void zynqmp_efuse_aes_crc_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPEFuse *s = ZYNQMP_EFUSE(reg->opaque);
+    bool ok;
+
+    ok = xlnx_efuse_k256_check(s->efuse, (uint32_t)val64, EFUSE_AES_START);
+
+    ARRAY_FIELD_DP32(s->regs, STATUS, AES_CRC_PASS, (ok ? 1 : 0));
+    ARRAY_FIELD_DP32(s->regs, STATUS, AES_CRC_DONE, 1);
+
+    s->regs[R_EFUSE_AES_CRC] = 0;   /* crc value is write-only */
+}
+
+static uint64_t zynqmp_efuse_cache_load_prew(RegisterInfo *reg,
+                                             uint64_t valu64)
+{
+    XlnxZynqMPEFuse *s = ZYNQMP_EFUSE(reg->opaque);
+
+    if (valu64 & R_EFUSE_CACHE_LOAD_LOAD_MASK) {
+        zynqmp_efuse_sync_cache(s, FBIT_UNKNOWN);
+        ARRAY_FIELD_DP32(s->regs, STATUS, CACHE_DONE, 1);
+        zynqmp_efuse_update_irq(s);
+    }
+
+    return 0;
+}
+
+static uint64_t zynqmp_efuse_wr_lock_prew(RegisterInfo *reg, uint64_t val)
+{
+    return val == 0xDF0D ? 0 : 1;
+}
+
+static RegisterAccessInfo zynqmp_efuse_regs_info[] = {
+    {   .name = "WR_LOCK",  .addr = A_WR_LOCK,
+        .reset = 0x1,
+        .pre_write = zynqmp_efuse_wr_lock_prew,
+    },{ .name = "CFG",  .addr = A_CFG,
+    },{ .name = "STATUS",  .addr = A_STATUS,
+        .rsvd = 0x8,
+        .ro = 0xff,
+    },{ .name = "EFUSE_PGM_ADDR",  .addr = A_EFUSE_PGM_ADDR,
+         .post_write = zynqmp_efuse_pgm_addr_postw
+    },{ .name = "EFUSE_RD_ADDR",  .addr = A_EFUSE_RD_ADDR,
+        .rsvd = 0x1f,
+        .post_write = zynqmp_efuse_rd_addr_postw,
+    },{ .name = "EFUSE_RD_DATA",  .addr = A_EFUSE_RD_DATA,
+        .ro = 0xffffffff,
+    },{ .name = "TPGM",  .addr = A_TPGM,
+    },{ .name = "TRD",  .addr = A_TRD,
+        .reset = 0x1b,
+    },{ .name = "TSU_H_PS",  .addr = A_TSU_H_PS,
+        .reset = 0xff,
+    },{ .name = "TSU_H_PS_CS",  .addr = A_TSU_H_PS_CS,
+        .reset = 0xb,
+    },{ .name = "TSU_H_CS",  .addr = A_TSU_H_CS,
+        .reset = 0x7,
+    },{ .name = "EFUSE_ISR",  .addr = A_EFUSE_ISR,
+        .rsvd = 0x7fffffe0,
+        .w1c = 0x8000001f,
+        .post_write = zynqmp_efuse_isr_postw,
+    },{ .name = "EFUSE_IMR",  .addr = A_EFUSE_IMR,
+        .reset = 0x8000001f,
+        .rsvd = 0x7fffffe0,
+        .ro = 0xffffffff,
+    },{ .name = "EFUSE_IER",  .addr = A_EFUSE_IER,
+        .rsvd = 0x7fffffe0,
+        .pre_write = zynqmp_efuse_ier_prew,
+    },{ .name = "EFUSE_IDR",  .addr = A_EFUSE_IDR,
+        .rsvd = 0x7fffffe0,
+        .pre_write = zynqmp_efuse_idr_prew,
+    },{ .name = "EFUSE_CACHE_LOAD",  .addr = A_EFUSE_CACHE_LOAD,
+        .pre_write = zynqmp_efuse_cache_load_prew,
+    },{ .name = "EFUSE_PGM_LOCK",  .addr = A_EFUSE_PGM_LOCK,
+    },{ .name = "EFUSE_AES_CRC",  .addr = A_EFUSE_AES_CRC,
+        .post_write = zynqmp_efuse_aes_crc_postw,
+    },{ .name = "EFUSE_TBITS_PRGRMG_EN",  .addr = A_EFUSE_TBITS_PRGRMG_EN,
+        .reset = R_EFUSE_TBITS_PRGRMG_EN_TBITS_PRGRMG_EN_MASK,
+    },{ .name = "DNA_0",  .addr = A_DNA_0,
+        .ro = 0xffffffff,
+    },{ .name = "DNA_1",  .addr = A_DNA_1,
+        .ro = 0xffffffff,
+    },{ .name = "DNA_2",  .addr = A_DNA_2,
+        .ro = 0xffffffff,
+    },{ .name = "IPDISABLE",  .addr = A_IPDISABLE,
+        .ro = 0xffffffff,
+    },{ .name = "SYSOSC_CTRL",  .addr = A_SYSOSC_CTRL,
+        .ro = 0xffffffff,
+    },{ .name = "USER_0",  .addr = A_USER_0,
+        .ro = 0xffffffff,
+    },{ .name = "USER_1",  .addr = A_USER_1,
+        .ro = 0xffffffff,
+    },{ .name = "USER_2",  .addr = A_USER_2,
+        .ro = 0xffffffff,
+    },{ .name = "USER_3",  .addr = A_USER_3,
+        .ro = 0xffffffff,
+    },{ .name = "USER_4",  .addr = A_USER_4,
+        .ro = 0xffffffff,
+    },{ .name = "USER_5",  .addr = A_USER_5,
+        .ro = 0xffffffff,
+    },{ .name = "USER_6",  .addr = A_USER_6,
+        .ro = 0xffffffff,
+    },{ .name = "USER_7",  .addr = A_USER_7,
+        .ro = 0xffffffff,
+    },{ .name = "MISC_USER_CTRL",  .addr = A_MISC_USER_CTRL,
+        .ro = 0xffffffff,
+    },{ .name = "ROM_RSVD",  .addr = A_ROM_RSVD,
+        .ro = 0xffffffff,
+    },{ .name = "PUF_CHASH", .addr = A_PUF_CHASH,
+        .ro = 0xffffffff,
+    },{ .name = "PUF_MISC",  .addr = A_PUF_MISC,
+        .ro = 0xffffffff,
+    },{ .name = "SEC_CTRL",  .addr = A_SEC_CTRL,
+        .ro = 0xffffffff,
+    },{ .name = "SPK_ID",  .addr = A_SPK_ID,
+        .ro = 0xffffffff,
+    },{ .name = "PPK0_0",  .addr = A_PPK0_0,
+        .ro = 0xffffffff,
+    },{ .name = "PPK0_1",  .addr = A_PPK0_1,
+        .ro = 0xffffffff,
+    },{ .name = "PPK0_2",  .addr = A_PPK0_2,
+        .ro = 0xffffffff,
+    },{ .name = "PPK0_3",  .addr = A_PPK0_3,
+        .ro = 0xffffffff,
+    },{ .name = "PPK0_4",  .addr = A_PPK0_4,
+        .ro = 0xffffffff,
+    },{ .name = "PPK0_5",  .addr = A_PPK0_5,
+        .ro = 0xffffffff,
+    },{ .name = "PPK0_6",  .addr = A_PPK0_6,
+        .ro = 0xffffffff,
+    },{ .name = "PPK0_7",  .addr = A_PPK0_7,
+        .ro = 0xffffffff,
+    },{ .name = "PPK0_8",  .addr = A_PPK0_8,
+        .ro = 0xffffffff,
+    },{ .name = "PPK0_9",  .addr = A_PPK0_9,
+        .ro = 0xffffffff,
+    },{ .name = "PPK0_10",  .addr = A_PPK0_10,
+        .ro = 0xffffffff,
+    },{ .name = "PPK0_11",  .addr = A_PPK0_11,
+        .ro = 0xffffffff,
+    },{ .name = "PPK1_0",  .addr = A_PPK1_0,
+        .ro = 0xffffffff,
+    },{ .name = "PPK1_1",  .addr = A_PPK1_1,
+        .ro = 0xffffffff,
+    },{ .name = "PPK1_2",  .addr = A_PPK1_2,
+        .ro = 0xffffffff,
+    },{ .name = "PPK1_3",  .addr = A_PPK1_3,
+        .ro = 0xffffffff,
+    },{ .name = "PPK1_4",  .addr = A_PPK1_4,
+        .ro = 0xffffffff,
+    },{ .name = "PPK1_5",  .addr = A_PPK1_5,
+        .ro = 0xffffffff,
+    },{ .name = "PPK1_6",  .addr = A_PPK1_6,
+        .ro = 0xffffffff,
+    },{ .name = "PPK1_7",  .addr = A_PPK1_7,
+        .ro = 0xffffffff,
+    },{ .name = "PPK1_8",  .addr = A_PPK1_8,
+        .ro = 0xffffffff,
+    },{ .name = "PPK1_9",  .addr = A_PPK1_9,
+        .ro = 0xffffffff,
+    },{ .name = "PPK1_10",  .addr = A_PPK1_10,
+        .ro = 0xffffffff,
+    },{ .name = "PPK1_11",  .addr = A_PPK1_11,
+        .ro = 0xffffffff,
+    }
+};
+
+static void zynqmp_efuse_reg_write(void *opaque, hwaddr addr,
+                                   uint64_t data, unsigned size)
+{
+    RegisterInfoArray *reg_array = opaque;
+    XlnxZynqMPEFuse *s;
+    Object *dev;
+
+    assert(reg_array != NULL);
+
+    dev = reg_array->mem.owner;
+    assert(dev);
+
+    s = ZYNQMP_EFUSE(dev);
+
+    if (addr != A_WR_LOCK && s->regs[R_WR_LOCK]) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s[reg_0x%02lx]: Attempt to write locked register.\n",
+                      object_get_canonical_path(OBJECT(s)), (long)addr);
+    } else {
+        register_write_memory(opaque, addr, data, size);
+    }
+}
+
+static const MemoryRegionOps zynqmp_efuse_ops = {
+    .read = register_read_memory,
+    .write = zynqmp_efuse_reg_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static void zynqmp_efuse_register_reset(RegisterInfo *reg)
+{
+    if (!reg->data || !reg->access) {
+        return;
+    }
+
+    /* Reset must not trigger some registers' writers */
+    switch (reg->access->addr) {
+    case A_EFUSE_AES_CRC:
+        *(uint32_t *)reg->data = reg->access->reset;
+        return;
+    }
+
+    register_reset(reg);
+}
+
+static void zynqmp_efuse_reset(DeviceState *dev)
+{
+    XlnxZynqMPEFuse *s = ZYNQMP_EFUSE(dev);
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        zynqmp_efuse_register_reset(&s->regs_info[i]);
+    }
+
+    zynqmp_efuse_sync_cache(s, FBIT_UNKNOWN);
+    ARRAY_FIELD_DP32(s->regs, STATUS, CACHE_DONE, 1);
+    zynqmp_efuse_update_irq(s);
+}
+
+static void zynqmp_efuse_realize(DeviceState *dev, Error **errp)
+{
+    XlnxZynqMPEFuse *s = ZYNQMP_EFUSE(dev);
+    const char *prefix = object_get_canonical_path(OBJECT(dev));
+
+    if (!s->efuse) {
+        error_setg(&error_abort, "%s: XLN-EFUSE not connected", prefix);
+    }
+
+    s->efuse->dev = dev;
+}
+
+static void zynqmp_efuse_init(Object *obj)
+{
+    XlnxZynqMPEFuse *s = ZYNQMP_EFUSE(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    RegisterInfoArray *reg_array;
+
+    memory_region_init(&s->iomem, obj, TYPE_XLNX_ZYNQMP_EFUSE, R_MAX * 4);
+    reg_array =
+        register_init_block32(DEVICE(obj), zynqmp_efuse_regs_info,
+                              ARRAY_SIZE(zynqmp_efuse_regs_info),
+                              s->regs_info, s->regs,
+                              &zynqmp_efuse_ops,
+                              ZYNQMP_EFUSE_ERR_DEBUG,
+                              R_MAX * 4);
+    memory_region_add_subregion(&s->iomem, 0, &reg_array->mem);
+
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+}
+
+static const VMStateDescription vmstate_efuse = {
+    .name = TYPE_XLNX_ZYNQMP_EFUSE,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .minimum_version_id_old = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, XlnxZynqMPEFuse, R_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static Property zynqmp_efuse_props[] = {
+    DEFINE_PROP_LINK("efuse",
+                     XlnxZynqMPEFuse, efuse,
+                     TYPE_XLNX_EFUSE, XLNXEFuse *),
+
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void zynqmp_efuse_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = zynqmp_efuse_reset;
+    dc->realize = zynqmp_efuse_realize;
+    dc->vmsd = &vmstate_efuse;
+    device_class_set_props(dc, zynqmp_efuse_props);
+}
+
+
+static const TypeInfo efuse_info = {
+    .name          = TYPE_XLNX_ZYNQMP_EFUSE,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XlnxZynqMPEFuse),
+    .class_init    = zynqmp_efuse_class_init,
+    .instance_init = zynqmp_efuse_init,
+};
+
+static void efuse_register_types(void)
+{
+    type_register_static(&efuse_info);
+}
+
+type_init(efuse_register_types)
diff --git a/include/hw/nvram/xlnx-zynqmp-efuse.h b/include/hw/nvram/xlnx-zynqmp-efuse.h
new file mode 100644
index 0000000000..97ac521ae4
--- /dev/null
+++ b/include/hw/nvram/xlnx-zynqmp-efuse.h
@@ -0,0 +1,45 @@
+/*
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
+#ifndef XLNX_ZYNQMP_EFUSE_H
+#define XLNX_ZYNQMP_EFUSE_H
+
+#include "qemu/osdep.h"
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+#include "hw/register.h"
+#include "hw/nvram/xlnx-efuse.h"
+
+#define TYPE_XLNX_ZYNQMP_EFUSE "xlnx,zynqmp-efuse"
+
+#define XLNX_ZYNQMP_EFUSE_R_MAX ((0x10fc / 4) + 1)
+
+typedef struct XlnxZynqMPEFuse {
+    SysBusDevice parent_obj;
+    MemoryRegion iomem;
+    qemu_irq irq;
+
+    XLNXEFuse *efuse;
+    uint32_t regs[XLNX_ZYNQMP_EFUSE_R_MAX];
+    RegisterInfo regs_info[XLNX_ZYNQMP_EFUSE_R_MAX];
+} XlnxZynqMPEFuse;
+
+#endif
-- 
2.25.1


