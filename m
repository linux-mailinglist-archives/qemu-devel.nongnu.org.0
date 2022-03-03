Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B733E4CC245
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:07:28 +0100 (CET)
Received: from localhost ([::1]:50660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnzD-0001H6-Q6
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:07:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nPnmB-0003Gr-KU
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:54:00 -0500
Received: from [2a01:111:f400:fe06::709] (port=27107
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nPnm8-0005GJ-CF
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:53:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imAfG7QLKKU74mmw9ml9DCZLbye9rZp0sT/6L7t8BJ/Wd/bXs3xXhzpSZg45m/9xRYSqYQEo8V67nEzEynO72M9BwJXIJRKFyVKd9JGKqxwY/5IHgO9YmzQCE1CnHoeVWSsknr+FN3jW3cZv7l4ukyF7ICFL5CCjeHJUNCaiLrNSU7r9cWpwEufJavKZKYM12NpNsyCnkmq5QVDS9SwEpel9eHCfrJMefyhLzmrWOrYn/hPX+FXKXoLiHbfvs8OxJiMIB25pmWohrxHwnoISHGWmveL8kHJ5iRgBpe6R2IoRMsFb4zdVcCZrG/aG4NyvF4xXeG0R1EzlGJhovZElQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDMnew4MZZVrhJUCSupMHmST/BoGSBa4NBKL4vr9Q8w=;
 b=dUo0NkV5PcRq2khhYXZOs5wJ+sYATHJhVmnY5UbAq0GS1UEYeVt0HDD0DOgu00smqleouxHdx7uESP/fgZrZveGipd5YPZcwOGVaQ4EW4FfXGk0CcbXEup5qiW+xEWUzXeT2KghVtF/5k6yFMqs3ZCoFj54i0YDl6bBKthN3zUAJbIL7VzcLwvxg/hr9x1FQr321lrQwRsmFKYtwHdLYHt5yF6rFTR6pQkQLdu5Q7c5UjBcz28sDfXP8NbLpWTUYRgUi6U/HYPVl0Mz6G1RXqESpBXrVIa7FaXZLiHrmA2vj/lXwtGO6SoBpFJm3Ta1FY7gsvZSmsRYZ1FFpCH0U1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 192.116.190.34) smtp.rcpttodomain=denx.de smtp.mailfrom=neuroblade.ai;
 dmarc=none action=none header.from=neuroblade.ai; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neuroblade.ai;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDMnew4MZZVrhJUCSupMHmST/BoGSBa4NBKL4vr9Q8w=;
 b=OeexDnENOhSjUB8X7VCCafwGCQf+qsVxmNmd86XFuO8Yz/GCHGpyMyYa0zmLbLpfYhAQFXJpnpypaShJLogzBMOGFvpPlYT+kKldSpiZocGXhSaKSKbAak5tH9ZMz8UgmSwSqiR5yGcSHavboHQfImvcA4ZcdyJXZLgK5i2dZwI=
Received: from AS9P194CA0005.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::13)
 by DB8PR09MB4074.eurprd09.prod.outlook.com (2603:10a6:10:127::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 15:39:17 +0000
Received: from AM5EUR02FT003.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::91) by AS9P194CA0005.outlook.office365.com
 (2603:10a6:20b:46d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Thu, 3 Mar 2022 15:39:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 192.116.190.34)
 smtp.mailfrom=neuroblade.ai; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
Received-SPF: Fail (protection.outlook.com: domain of neuroblade.ai does not
 designate 192.116.190.34 as permitted sender)
 receiver=protection.outlook.com; client-ip=192.116.190.34;
 helo=nb-o365.localdomain;
Received: from nb-o365.localdomain (192.116.190.34) by
 AM5EUR02FT003.mail.protection.outlook.com (10.152.8.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14 via Frontend Transport; Thu, 3 Mar 2022 15:39:14 +0000
Received: from amirgonnen-vm.neuroblade.corp (amirgonnen-vm.neuroblade.corp
 [192.168.3.87])
 by nb-o365.localdomain (Postfix) with ESMTP id 79AF4212D8;
 Thu,  3 Mar 2022 17:38:59 +0200 (IST)
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 4/5] hw/intc: Vectored Interrupt Controller (VIC)
Date: Thu,  3 Mar 2022 17:39:05 +0200
Message-Id: <20220303153906.2024748-5-amir.gonnen@neuroblade.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303153906.2024748-1-amir.gonnen@neuroblade.ai>
References: <20220303153906.2024748-1-amir.gonnen@neuroblade.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ffb338b-53c3-4781-6072-08d9fd2bf8e1
X-MS-TrafficTypeDiagnostic: DB8PR09MB4074:EE_
X-Microsoft-Antispam-PRVS: <DB8PR09MB4074E37DA4708BD14A6AA66FEB049@DB8PR09MB4074.eurprd09.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QDzLABmLhoqZ2HxiEZJB7buWg8XY8KuxIBAhM20Z/xL/Qu63gwCDYO+KvkD5Onj7VCa9kRgv/HGuFhmci10OH0OWFsumf0+6KzoKrntMGM3KFv5qkSk1egNhv1ZSnNONZGpgXzu8pjYY9YQQ2u6lXFZcUmLIdlnuHU4zXuT03ULDLw+ifNqr4m8OzstcuNG8cZ2GS/Ldwsq2fOZU/bt703tFEC8j0zA01V/fmGP9w1kIVvToaLtOROTblXNE4qLkylAoL3aub5HOwcTZ1BQpjBt/kIbo+YjJVCBnjRXs67K1rIh/WpHhmGhHgrlW6CPigWm9H7+V4rSJ/DtvtQkxNqBC/yrPZ83Ag0EdT1UJGhXFp3pcEyDYNpz6YoErjcP6KVexy40S+QvCwCTRvIYvBhaXmG/qRrgTWitcYwGWBd3dQCwWdzUcfEu0r/MDtK7X2vHPBLNgUKbJyn46GPupurk3qPbRa49SbYmZDspy3aWRj2I/gMlNtS+XKONuuQGSq1zxFjfdEtMDQxg9ig6gwXMKTNbE/RoFAG3pdeCbP4bIIWewmAj9Vc6mkGpO8yJS+ItEngPE+uqOx/iJVEWboz8ruWp1Afd6nGxSUSB0kJ7CbGrbZP44VU+hple7QwLrLxuy3gsQthY9VkyqCy1kqGYr2MIRjIxLLhtLc7zObAFfknTLRLiRRPx8BQzcaKFEisrMMpKJmjPcsshB2zU1jSVr23Duh9NjC7uxErlIiIOYwW9UhnwODjk0R7gmkTGxb68dFAd2+QfLxbJlnfA2yCJELJw+h+8/Gujw+DEESNZsz/W3o3IWvJEQjzBDE03o
X-Forefront-Antispam-Report: CIP:192.116.190.34; CTRY:IL; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:nb-o365.localdomain; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(39840400004)(136003)(396003)(376002)(346002)(46966006)(36840700001)(82310400004)(2906002)(186003)(356005)(336012)(81166007)(6266002)(110136005)(44832011)(5660300002)(30864003)(8936002)(4326008)(8676002)(70586007)(6666004)(70206006)(1076003)(107886003)(86362001)(316002)(2616005)(36756003)(508600001)(47076005)(40480700001)(36860700001)(966005)(83380400001)(26005)(36900700001)(27056005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 15:39:14.8914 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ffb338b-53c3-4781-6072-08d9fd2bf8e1
X-MS-Exchange-CrossTenant-Id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=63c61203-65af-4cf8-98e5-d12f35edaefa; Ip=[192.116.190.34];
 Helo=[nb-o365.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR02FT003.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB4074
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe06::709
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe06::709;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Amir Gonnen <amir.gonnen@neuroblade.ai>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement nios2 Vectored Interrupt Controller (VIC).
VIC is connected to EIC. It needs to update rha, ril, rrs and rnmi
fields on Nios2CPU before raising an IRQ.
For that purpose, VIC has a "cpu" property which should refer to the
nios2 cpu and set by the board that connects VIC.

Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
---
 hw/intc/Kconfig     |   3 +
 hw/intc/meson.build |   1 +
 hw/intc/nios2_vic.c | 341 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 345 insertions(+)
 create mode 100644 hw/intc/nios2_vic.c

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 528e77b4a6..0a8e8d1d84 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -81,3 +81,6 @@ config GOLDFISH_PIC
 
 config M68K_IRQC
     bool
+
+config NIOS2_VIC
+    bool
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index d953197413..c33b075859 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -61,3 +61,4 @@ specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
 		if_true: files('spapr_xive_kvm.c'))
 specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
 specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
+specific_ss.add(when: 'CONFIG_NIOS2_VIC', if_true: files('nios2_vic.c'))
diff --git a/hw/intc/nios2_vic.c b/hw/intc/nios2_vic.c
new file mode 100644
index 0000000000..b59d3f6f4c
--- /dev/null
+++ b/hw/intc/nios2_vic.c
@@ -0,0 +1,341 @@
+/*
+ * Vectored Interrupt Controller for nios2 processor
+ *
+ * Copyright (c) 2022 Neuroblade
+ *
+ * Interface:
+ * QOM property "cpu": link to the Nios2 CPU (must be set)
+ * Unnamed GPIO inputs 0..NIOS2_VIC_MAX_IRQ-1: input IRQ lines
+ * IRQ should be connected to nios2 IRQ0.
+ *
+ * Reference: "Embedded Peripherals IP User Guide
+ *             for Intel® Quartus® Prime Design Suite: 21.4"
+ * Chapter 38 "Vectored Interrupt Controller Core"
+ * See: https://www.intel.com/content/www/us/en/docs/programmable/683130/21-4/vectored-interrupt-controller-core.html
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
+
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qemu/bitops.h"
+#include "qemu/log.h"
+#include "qom/object.h"
+#include "cpu.h"
+
+#define TYPE_NIOS2_VIC "nios2-vic"
+
+OBJECT_DECLARE_SIMPLE_TYPE(Nios2Vic, NIOS2_VIC)
+
+#define NIOS2_VIC_MAX_IRQ 32
+
+enum {
+    INT_CONFIG0 = 0,
+    INT_CONFIG31 = 31,
+    INT_ENABLE = 32,
+    INT_ENABLE_SET = 33,
+    INT_ENABLE_CLR = 34,
+    INT_PENDING = 35,
+    INT_RAW_STATUS = 36,
+    SW_INTERRUPT = 37,
+    SW_INTERRUPT_SET = 38,
+    SW_INTERRUPT_CLR = 39,
+    VIC_CONFIG = 40,
+    VIC_STATUS = 41,
+    VEC_TBL_BASE = 42,
+    VEC_TBL_ADDR = 43,
+    CSR_COUNT /* Last! */
+};
+
+struct Nios2Vic {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    qemu_irq output_int;
+
+    /* properties */
+    CPUState *cpu;
+    MemoryRegion csr;
+
+    uint32_t int_config[32];
+    uint32_t vic_config;
+    uint32_t int_raw_status;
+    uint32_t int_enable;
+    uint32_t sw_int;
+    uint32_t vic_status;
+    uint32_t vec_tbl_base;
+    uint32_t vec_tbl_addr;
+};
+
+/* Requested interrupt level (INT_CONFIG[0:5]) */
+static inline uint32_t vic_int_config_ril(const Nios2Vic *vic, int irq_num)
+{
+    return extract32(vic->int_config[irq_num], 0, 6);
+}
+
+/* Requested NMI (INT_CONFIG[6]) */
+static inline uint32_t vic_int_config_rnmi(const Nios2Vic *vic, int irq_num)
+{
+    return extract32(vic->int_config[irq_num], 6, 1);
+}
+
+/* Requested register set (INT_CONFIG[7:12]) */
+static inline uint32_t vic_int_config_rrs(const Nios2Vic *vic, int irq_num)
+{
+    return extract32(vic->int_config[irq_num], 7, 6);
+}
+
+static inline uint32_t vic_config_vec_size(const Nios2Vic *vic)
+{
+    return 1 << (2 + extract32(vic->vic_config, 0, 3));
+}
+
+static inline uint32_t vic_int_pending(const Nios2Vic *vic)
+{
+    return (vic->int_raw_status | vic->sw_int) & vic->int_enable;
+}
+
+static void vic_update_irq(Nios2Vic *vic)
+{
+    Nios2CPU *cpu = NIOS2_CPU(vic->cpu);
+    uint32_t pending = vic_int_pending(vic);
+    int irq = -1;
+    int max_ril = 0;
+    /* Note that if RIL is 0 for an interrupt it is effectively disabled */
+
+    vic->vec_tbl_addr = 0;
+    vic->vic_status = 0;
+
+    if (pending == 0) {
+        qemu_irq_lower(vic->output_int);
+        return;
+    }
+
+    for (int i = 0; i < NIOS2_VIC_MAX_IRQ; i++) {
+        if (pending & BIT(i)) {
+            int ril = vic_int_config_ril(vic, i);
+            if (ril > max_ril) {
+                irq = i;
+                max_ril = ril;
+            }
+        }
+    }
+
+    if (irq < 0) {
+        qemu_irq_lower(vic->output_int);
+        return;
+    }
+
+    vic->vec_tbl_addr = irq * vic_config_vec_size(vic) + vic->vec_tbl_base;
+    vic->vic_status = irq | BIT(31);
+
+    /*
+     * In hardware, the interface between the VIC and the CPU is via the
+     * External Interrupt Controller interface, where the interrupt controller
+     * presents the CPU with a packet of data containing:
+     *  - Requested Handler Address (RHA): 32 bits
+     *  - Requested Register Set (RRS) : 6 bits
+     *  - Requested Interrupt Level (RIL) : 6 bits
+     *  - Requested NMI flag (RNMI) : 1 bit
+     * In our emulation, we implement this by writing the data directly to
+     * fields in the CPU object and then raising the IRQ line to tell
+     * the CPU that we've done so.
+     */
+
+    cpu->rha = vic->vec_tbl_addr;
+    cpu->ril = max_ril;
+    cpu->rrs = vic_int_config_rrs(vic, irq);
+    cpu->rnmi = vic_int_config_rnmi(vic, irq);
+
+    qemu_irq_raise(vic->output_int);
+}
+
+static void vic_set_irq(void *opaque, int irq_num, int level)
+{
+    Nios2Vic *vic = opaque;
+
+    if (level) {
+        vic->int_raw_status |= BIT(irq_num);
+    } else {
+        vic->int_raw_status &= ~BIT(irq_num);
+    }
+
+    vic_update_irq(vic);
+}
+
+static void nios2_vic_reset(DeviceState *dev)
+{
+    Nios2Vic *vic = NIOS2_VIC(dev);
+    memset(&vic->int_config, 0, sizeof(vic->int_config));
+    vic->vic_config = 0;
+    vic->int_raw_status = 0;
+    vic->int_enable = 0;
+    vic->sw_int = 0;
+    vic->vic_status = 0;
+    vic->vec_tbl_base = 0;
+    vic->vec_tbl_addr = 0;
+}
+
+static uint64_t nios2_vic_csr_read(void *opaque, hwaddr offset, unsigned size)
+{
+    Nios2Vic *vic = opaque;
+    int index = offset / 4;
+
+    switch (index) {
+    case INT_CONFIG0 ... INT_CONFIG31:
+        return vic->int_config[index - INT_CONFIG0];
+    case INT_ENABLE:
+        return vic->int_enable;
+    case INT_PENDING:
+        return vic_int_pending(vic);
+    case INT_RAW_STATUS:
+        return vic->int_raw_status;
+    case SW_INTERRUPT:
+        return vic->sw_int;
+    case VIC_CONFIG:
+        return vic->vic_config;
+    case VIC_STATUS:
+        return vic->vic_status;
+    case VEC_TBL_BASE:
+        return vic->vec_tbl_base;
+    case VEC_TBL_ADDR:
+        return vic->vec_tbl_addr;
+    default:
+        return 0;
+    }
+}
+
+static void nios2_vic_csr_write(void *opaque, hwaddr offset, uint64_t value,
+                                unsigned size)
+{
+    Nios2Vic *vic = opaque;
+    int index = offset / 4;
+
+    switch (index) {
+    case INT_CONFIG0 ... INT_CONFIG31:
+        vic->int_config[index - INT_CONFIG0] = value;
+        break;
+    case INT_ENABLE:
+        vic->int_enable = value;
+        break;
+    case INT_ENABLE_SET:
+        vic->int_enable |= value;
+        break;
+    case INT_ENABLE_CLR:
+        vic->int_enable &= ~value;
+        break;
+    case SW_INTERRUPT:
+        vic->sw_int = value;
+        break;
+    case SW_INTERRUPT_SET:
+        vic->sw_int |= value;
+        break;
+    case SW_INTERRUPT_CLR:
+        vic->sw_int &= ~value;
+        break;
+    case VIC_CONFIG:
+        vic->vic_config = value;
+        break;
+    case VEC_TBL_BASE:
+        vic->vec_tbl_base = value;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "nios2-vic: write to invalid CSR address 0x%x\n", (int)offset);
+    }
+
+    vic_update_irq(vic);
+}
+
+static const MemoryRegionOps nios2_vic_csr_ops = {
+    .read = nios2_vic_csr_read,
+    .write = nios2_vic_csr_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = { .min_access_size = 4, .max_access_size = 4 }
+};
+
+static void nios2_vic_realize(DeviceState *dev, Error **errp)
+{
+    Nios2Vic *vic = NIOS2_VIC(dev);
+
+    if (!vic->cpu) {
+        /* This is a programming error in the code using this device */
+        error_setg(errp, "nios2-vic 'cpu' link property was not set");
+        return;
+    }
+
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &vic->output_int);
+    qdev_init_gpio_in(dev, vic_set_irq, NIOS2_VIC_MAX_IRQ);
+
+    memory_region_init_io(&vic->csr, OBJECT(dev), &nios2_vic_csr_ops, vic,
+                          "nios2.vic.csr", CSR_COUNT * sizeof(uint32_t));
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &vic->csr);
+}
+
+static Property nios2_vic_properties[] = {
+    DEFINE_PROP_LINK("cpu", Nios2Vic, cpu, TYPE_CPU, CPUState *),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static const VMStateDescription nios2_vic_vmstate = {
+    .name = "nios2-vic",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]){
+        VMSTATE_UINT32_ARRAY(int_config, Nios2Vic, 32),
+        VMSTATE_UINT32(vic_config, Nios2Vic),
+        VMSTATE_UINT32(int_raw_status, Nios2Vic),
+        VMSTATE_UINT32(int_enable, Nios2Vic),
+        VMSTATE_UINT32(sw_int, Nios2Vic),
+        VMSTATE_UINT32(vic_status, Nios2Vic),
+        VMSTATE_UINT32(vec_tbl_base, Nios2Vic),
+        VMSTATE_UINT32(vec_tbl_addr, Nios2Vic),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void nios2_vic_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = nios2_vic_reset;
+    dc->realize = nios2_vic_realize;
+    dc->vmsd = &nios2_vic_vmstate;
+    device_class_set_props(dc, nios2_vic_properties);
+}
+
+static const TypeInfo nios2_vic_info = {
+    .name = TYPE_NIOS2_VIC,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(Nios2Vic),
+    .class_init = nios2_vic_class_init,
+};
+
+static void nios2_vic_register_types(void)
+{
+    type_register_static(&nios2_vic_info);
+}
+
+type_init(nios2_vic_register_types);
-- 
2.25.1


