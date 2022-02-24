Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 499CA4C2DE4
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 15:09:16 +0100 (CET)
Received: from localhost ([::1]:39022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNEnx-0004kg-36
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 09:09:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nNEkL-0008VP-Ul
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:05:30 -0500
Received: from [2a01:111:f400:fe06::722] (port=12454
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nNEkB-0006fn-RZ
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:05:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHCMK/FTYJhnRN36kmZOozOggFLTY3a+6ueON/khKkewe7I59rm/T+bII36phJxxw/PO97OGwVLS+kiYxRZrWqt5fJsOuk6ADloP57SpFR0RdeUSj3spRvCY4ImTwfM319judjP4dt4i8PCO1JwZXZNlCVhOX8KpA3DQ+at0vdJLiu8reIjwlBs3APQ3/eZ98JoB5Mu8y0VIOHxC8U07kIsBJ1e5EFGJtGHkztG5qpjkSplV6BGvDgvfxCC2N0FtOM7MeHqNW4ZjTqow0ggjZIf33lG5/tLFACQ3TmniW2peVdigeTJkkjF4f+5G6KvPPKSPtccd7CkTTL+sOnUBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmqTrYcqDvR+nrfpW9EBstqpHKq06ktFSlg2tFHjHpk=;
 b=LysKSD1tfSS1OKE9n0YuBg1hVcSkk475rDBr/s60BbY+vqsvmHrlktec5gJL+q2JYbDPhubAED85MiLbN8An3yYvQwGXJaAsIH7d9hMjzd5CRwzxwY7G54AFxWJ2xJCoCcxJdubBW9jWq8Zlgo3NyD9qGlDNOI1ux5A5fp1nl4zh1MF4hmfkzBAK0jHLSnA2EzXixXB4iWDADwcxAmwO1Z+wfYhhWioIT0Bh3SuPaxt166cQMTPvcJIz5Eg0kKzbx1tOXnhieYRUbRe3F/AVNr4VC1x5DW2y5d43PWUBT4jeX60bEsBbBorH/jM5Trdf1LEExav1eN7XC8pahIbyvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 192.116.190.34) smtp.rcpttodomain=denx.de smtp.mailfrom=neuroblade.ai;
 dmarc=none action=none header.from=neuroblade.ai; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NeuroBlade.onmicrosoft.com; s=selector2-NeuroBlade-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmqTrYcqDvR+nrfpW9EBstqpHKq06ktFSlg2tFHjHpk=;
 b=l5Rx8+aAiuZCOMDJ4Nks/Bj/MhFIpGiWTDD3S3r/YsJQES3NGw9DwFTyvBl24O7OGDa5OSU5pKnkTN9SKH4iidXYd//EOG7g+cjeQGVfRvlcDU3vkh7oCdjoO4wARZE+Vt2xMOYfHdbdPcCqOE3hOmRPKgNoOxpsaNL+DEHi6HU=
Received: from AM0PR06CA0075.eurprd06.prod.outlook.com (2603:10a6:208:fa::16)
 by AM8PR09MB5228.eurprd09.prod.outlook.com (2603:10a6:20b:3db::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Thu, 24 Feb
 2022 13:49:54 +0000
Received: from VE1EUR02FT058.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:208:fa:cafe::15) by AM0PR06CA0075.outlook.office365.com
 (2603:10a6:208:fa::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23 via Frontend
 Transport; Thu, 24 Feb 2022 13:49:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 192.116.190.34)
 smtp.mailfrom=neuroblade.ai; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
Received-SPF: Fail (protection.outlook.com: domain of neuroblade.ai does not
 designate 192.116.190.34 as permitted sender)
 receiver=protection.outlook.com; client-ip=192.116.190.34;
 helo=nb-o365.localdomain;
Received: from nb-o365.localdomain (192.116.190.34) by
 VE1EUR02FT058.mail.protection.outlook.com (10.152.13.52) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.23 via Frontend Transport; Thu, 24 Feb 2022 13:49:53 +0000
Received: from amirgonnen-vm.neuroblade.corp (amirgonnen-vm.neuroblade.corp
 [192.168.3.87])
 by nb-o365.localdomain (Postfix) with ESMTP id BECDD211BB;
 Thu, 24 Feb 2022 15:49:31 +0200 (IST)
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Subject: [PATCH v2 3/4] hw/intc: Vectored Interrupt Controller (VIC)
Date: Thu, 24 Feb 2022 15:49:00 +0200
Message-Id: <20220224134901.500007-4-amir.gonnen@neuroblade.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224134901.500007-1-amir.gonnen@neuroblade.ai>
References: <20220224134901.500007-1-amir.gonnen@neuroblade.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c02b2a7f-b9ad-4df9-35b5-08d9f79c8926
X-MS-TrafficTypeDiagnostic: AM8PR09MB5228:EE_
X-Microsoft-Antispam-PRVS: <AM8PR09MB52287541E0A773BEBDFB8BD4EB3D9@AM8PR09MB5228.eurprd09.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qs3sg0wGuEIipXkoInHrV18qx8dASsyxD5lnHD61/32TLyM2Y68h46Cpi3Xpt0kmuL/JBNF7hZtfefUVTF8Y43BiGvfHDQl1XuHyKLN7lFvyY4VJ7zBaCzJyd4aoiPhhsOsGxBEJ2Gi1o7pm7qIptwTvVa4SgyfO82svOSxislzZTPh+KjPxc/t3qHcGWNutIuvbuWqrG7O7FVum0aYV4WS9fZXZCqtIZ1f8QOCD5Rpk+ml5E3OyYUXXTa1WA/8mt1KNsjFVKppmMwqkBo9wQCQ4bjVhntq8rqdCGIlpCe0fsrIgqge5rnlMs1x+K24MxNbdasY57O/gzCbLlFYSBZzwg9zLhAfTYcv6rALKEdmlms20S1118DOKhkIVvygQf5G1sb3uNojZrxCsybS8ar+a/QIagUDXGuLk9HSRWtCi6DCVvGch5SYrbSNT40TP1T0bVOEjALdD8+crDIW5F9g/7sYS2WsCuLpaVaPGw3wi8YPqoGyCtSZJrR5xSHIxjaA6QXSYbAB2fE11+RWV/nEzUO86io5V7YeVwhqb/nmgE1kfM7C1REfqMIlvzQo20MMturVjtcHA0T+S264u5BcOirACqh5gg6zkQ+DvKyq0/beci7oZqqjR2Qyb2e6vC+695hJdYeoE6u70prIY761tcoRyVxaPf3nCiUjsDSMIBpFrjdLsVExqCSDW4sKd1KA2oG2BXceo49WvdpotqUosqgXoLPkbIIxlmZtw+N4=
X-Forefront-Antispam-Report: CIP:192.116.190.34; CTRY:IL; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:nb-o365.localdomain; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(346002)(376002)(39840400004)(396003)(136003)(34036004)(36840700001)(46966006)(2906002)(4326008)(30864003)(508600001)(8676002)(86362001)(316002)(70206006)(70586007)(5660300002)(110136005)(8936002)(40480700001)(44832011)(81166007)(356005)(82310400004)(107886003)(1076003)(36860700001)(6666004)(36756003)(2616005)(83380400001)(336012)(6266002)(47076005)(26005)(186003)(36900700001)(27056005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 13:49:53.6171 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c02b2a7f-b9ad-4df9-35b5-08d9f79c8926
X-MS-Exchange-CrossTenant-Id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=63c61203-65af-4cf8-98e5-d12f35edaefa; Ip=[192.116.190.34];
 Helo=[nb-o365.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT058.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR09MB5228
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe06::722
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe06::722;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 hw/intc/Kconfig     |   4 +
 hw/intc/meson.build |   1 +
 hw/intc/nios2_vic.c | 327 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 332 insertions(+)
 create mode 100644 hw/intc/nios2_vic.c

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 528e77b4a6..8000241428 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -81,3 +81,7 @@ config GOLDFISH_PIC

 config M68K_IRQC
     bool
+
+config NIOS2_VIC
+    default y
+    depends on NIOS2 && TCG
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 7466024402..547e16eb2d 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -61,3 +61,4 @@ specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
                if_true: files('spapr_xive_kvm.c'))
 specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.=
c'))
 specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
+specific_ss.add(when: 'CONFIG_NIOS2_VIC', if_true: files('nios2_vic.c'))
diff --git a/hw/intc/nios2_vic.c b/hw/intc/nios2_vic.c
new file mode 100644
index 0000000000..a9c9b3e7ac
--- /dev/null
+++ b/hw/intc/nios2_vic.c
@@ -0,0 +1,327 @@
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
+ *             for Intel=C2=AE Quartus=C2=AE Prime Design Suite: 21.4"
+ * Chapter 38 "Vectored Interrupt Controller Core"
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy
+ * of this software and associated documentation files (the "Software"), t=
o deal
+ * in the Software without restriction, including without limitation the r=
ights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included=
 in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN
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
+#define LOG_VIC(...) qemu_log_mask(CPU_LOG_INT, ##__VA_ARGS__)
+
+#define TYPE_NIOS2_VIC "nios2-vic"
+
+OBJECT_DECLARE_SIMPLE_TYPE(Nios2Vic, NIOS2_VIC)
+
+#define NIOS2_VIC_MAX_IRQ 32
+
+enum {
+    INT_CONFIG0 =3D 0,
+    INT_CONFIG31 =3D 31,
+    INT_ENABLE =3D 32,
+    INT_ENABLE_SET =3D 33,
+    INT_ENABLE_CLR =3D 34,
+    INT_PENDING =3D 35,
+    INT_RAW_STATUS =3D 36,
+    SW_INTERRUPT =3D 37,
+    SW_INTERRUPT_SET =3D 38,
+    SW_INTERRUPT_CLR =3D 39,
+    VIC_CONFIG =3D 40,
+    VIC_STATUS =3D 41,
+    VEC_TBL_BASE =3D 42,
+    VEC_TBL_ADDR =3D 43,
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
+static inline uint32_t vic_int_config_ril(const Nios2Vic *vic, int irq_num=
)
+{
+    return extract32(vic->int_config[irq_num], 0, 6);
+}
+
+/* Requested NMI (INT_CONFIG[6]) */
+static inline uint32_t vic_int_config_rnmi(const Nios2Vic *vic, int irq_nu=
m)
+{
+    return extract32(vic->int_config[irq_num], 6, 1);
+}
+
+/* Requested register set (INT_CONFIG[7:12]) */
+static inline uint32_t vic_int_config_rrs(const Nios2Vic *vic, int irq_num=
)
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
+    Nios2CPU *cpu =3D NIOS2_CPU(vic->cpu);
+    uint32_t pending =3D vic_int_pending(vic);
+    int irq =3D -1;
+    int max_ril =3D 0;
+
+    vic->vec_tbl_addr =3D 0;
+    vic->vic_status =3D 0;
+
+    if (pending =3D=3D 0) {
+        qemu_irq_lower(vic->output_int);
+        return;
+    }
+
+    for (int i =3D 0; i < NIOS2_VIC_MAX_IRQ; i++) {
+        if (pending & BIT(i)) {
+            int ril =3D vic_int_config_ril(vic, i);
+            if (ril > max_ril) {
+                irq =3D i;
+                max_ril =3D ril;
+            }
+        }
+    }
+
+    if (irq < 0) {
+        qemu_irq_lower(vic->output_int);
+        return;
+    }
+
+    vic->vec_tbl_addr =3D irq * vic_config_vec_size(vic) + vic->vec_tbl_ba=
se;
+    vic->vic_status =3D deposit32(vic->vic_status, 0, 6, irq) | BIT(31);
+
+    cpu->rha =3D vic->vec_tbl_addr;
+    cpu->ril =3D max_ril;
+    cpu->rrs =3D vic_int_config_rrs(vic, irq);
+    cpu->rnmi =3D vic_int_config_rnmi(vic, irq);
+
+    qemu_irq_raise(vic->output_int);
+}
+
+static void vic_set_irq(void *opaque, int irq_num, int level)
+{
+    Nios2Vic *vic =3D opaque;
+    LOG_VIC("%s: irq %d level %d", __func__, irq_num, level);
+
+    if (level) {
+        vic->int_raw_status |=3D BIT(irq_num);
+    } else {
+        vic->int_raw_status &=3D ~BIT(irq_num);
+    }
+
+    vic_update_irq(vic);
+}
+
+static void nios2_vic_reset(DeviceState *dev)
+{
+    Nios2Vic *vic =3D NIOS2_VIC(dev);
+    memset(&vic->int_config, 0, sizeof(vic->int_config));
+    vic->vic_config =3D 0;
+    vic->int_raw_status =3D 0;
+    vic->int_enable =3D 0;
+    vic->sw_int =3D 0;
+    vic->vic_status =3D 0;
+    vic->vec_tbl_base =3D 0;
+    vic->vec_tbl_addr =3D 0;
+}
+
+static uint64_t nios2_vic_csr_read(void *opaque, hwaddr offset, unsigned s=
ize)
+{
+    Nios2Vic *vic =3D opaque;
+    int index =3D offset / 4;
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
+static void nios2_vic_csr_write(void *opaque, hwaddr offset, uint64_t valu=
e,
+                                unsigned size)
+{
+    Nios2Vic *vic =3D opaque;
+    int index =3D offset / 4;
+
+    switch (index) {
+    case INT_CONFIG0 ... INT_CONFIG31:
+        vic->int_config[index - INT_CONFIG0] =3D value;
+        break;
+    case INT_ENABLE:
+        vic->int_enable =3D value;
+        break;
+    case INT_ENABLE_SET:
+        vic->int_enable |=3D value;
+        break;
+    case INT_ENABLE_CLR:
+        vic->int_enable &=3D ~value;
+        break;
+    case SW_INTERRUPT:
+        vic->sw_int =3D value;
+        break;
+    case SW_INTERRUPT_SET:
+        vic->sw_int |=3D value;
+        break;
+    case SW_INTERRUPT_CLR:
+        vic->sw_int &=3D ~value;
+        break;
+    case VIC_CONFIG:
+        vic->vic_config =3D value;
+        break;
+    case VEC_TBL_BASE:
+        vic->vec_tbl_base =3D value;
+        break;
+    default:
+        ;
+    }
+
+    vic_update_irq(vic);
+}
+
+static const MemoryRegionOps nios2_vic_csr_ops =3D {
+    .read =3D nios2_vic_csr_read,
+    .write =3D nios2_vic_csr_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid =3D { .min_access_size =3D 4, .max_access_size =3D 4 }
+};
+
+static void nios2_vic_realize(DeviceState *dev, Error **errp)
+{
+    Nios2Vic *vic =3D NIOS2_VIC(dev);
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
+static Property nios2_vic_properties[] =3D {
+    DEFINE_PROP_LINK("cpu", Nios2Vic, cpu, TYPE_CPU, CPUState *),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static const VMStateDescription nios2_vic_vmstate =3D {
+    .name =3D "nios2-vic",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]){ VMSTATE_UINT32_ARRAY(int_config, Nios2Vi=
c, 32),
+                                VMSTATE_UINT32(vic_config, Nios2Vic),
+                                VMSTATE_UINT32(int_raw_status, Nios2Vic),
+                                VMSTATE_UINT32(int_enable, Nios2Vic),
+                                VMSTATE_UINT32(sw_int, Nios2Vic),
+                                VMSTATE_UINT32(vic_status, Nios2Vic),
+                                VMSTATE_UINT32(vec_tbl_base, Nios2Vic),
+                                VMSTATE_UINT32(vec_tbl_addr, Nios2Vic),
+                                VMSTATE_END_OF_LIST() },
+};
+
+
+static void nios2_vic_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->reset =3D nios2_vic_reset;
+    dc->realize =3D nios2_vic_realize;
+    dc->vmsd =3D &nios2_vic_vmstate;
+    device_class_set_props(dc, nios2_vic_properties);
+}
+
+static const TypeInfo nios2_vic_info =3D {
+    .name =3D TYPE_NIOS2_VIC,
+    .parent =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(Nios2Vic),
+    .class_init =3D nios2_vic_class_init,
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


The contents of this email message and any attachments are intended solely =
for the addressee(s) and may contain confidential and/or privileged informa=
tion and may be legally protected from disclosure. If you are not the inten=
ded recipient of this message or their agent, or if this message has been a=
ddressed to you in error, please immediately alert the sender by reply emai=
l and then delete this message and any attachments. If you are not the inte=
nded recipient, you are hereby notified that any use, dissemination, copyin=
g, or storage of this message or its attachments is strictly prohibited.

