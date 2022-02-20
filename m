Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467FA4BCF0F
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 15:48:05 +0100 (CET)
Received: from localhost ([::1]:45832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLnVL-0007Wd-Of
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 09:48:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nLnSL-0006if-GA
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 09:44:57 -0500
Received: from mail-eopbgr50132.outbound.protection.outlook.com
 ([40.107.5.132]:5856 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nLnSH-0006ii-4u
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 09:44:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ti2SUE/tIX5SUPnaf6CwuN3BCRWOJxoDC+KWpDfYPrtkdSjxnHP6vZ7wTPRcTq22Il8HvbdPuwxWM8ZF+AFZhlBz0tvdSNWu9v4mWQysJsrdO0cJPwQRJ+nUq7XtPElCc8NHOfTjP+R/BkVl+hU/NDSN4g4n1dhrGJApv0rtzeQLtWIfAiOMkaL09h7WAAvm9cS2QnoDwvlR1pM7zpd1XjJLAq6uzY0WBrZkzcoLXpt0ypTzRgGvw/n0uPn6Lk6XGnSFAv2O0k0SzhSDsNpj6nqrW63YVaOYz4aig8AVJ9Lygmwryiw/kvYqdcUeBrC7JLf7MqJy93FWleDUEylyew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72VsgD/VPkcNPWcRcr+E5/FJ4wQm3KXHWjoVufrI6Ds=;
 b=EvNEOY4V4YPoPpevrqo3pmH5SnE5cCQXkErgyj9zx6x2maI4MXtOl7Eqndrh/sJHYgSIB9bYza9wcEUQ4kYO1iB4cUcXXNt8SsAkFU48Xl8uLqBD5qAxong/7P5FUl9jeAKddzV3pMnG5VuN7W40C6KYzWs8UD3YSJrMZY/Ud11wMHCXS+1EyWEMD0X+H8TTAwqQykCqtIv+a0sl9KRxrFBRXcUWglv4LN4QO4g/WqbT9LT5WlseHzf6oJsU/+oF8yyyNOxJ7k8tYNuLn21arEZqMrk2TjhmdDbOjxEQP7zuMq6akbsLd9PNenm5LQJiI1TwFWunA2YmOB7jjw0Qrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 192.116.190.34) smtp.rcpttodomain=denx.de smtp.mailfrom=neuroblade.ai;
 dmarc=none action=none header.from=neuroblade.ai; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NeuroBlade.onmicrosoft.com; s=selector2-NeuroBlade-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72VsgD/VPkcNPWcRcr+E5/FJ4wQm3KXHWjoVufrI6Ds=;
 b=D5CowvJynmLhzsiu+AhiK9zg9gl60Ze0HjmH1KIyoESMw5LkP/JAdaviEv33riv9vNQm1G6CLH+s7qVbrbb3orOTksk3gnP4LzoQ1Zkqzrp/yzd29N0W99YDwdHuVI1l5MSrbu51Ryfgp43kWkxvtF9s0bEh8yRIsHwn4nv18Qs=
Received: from AM5PR0601CA0071.eurprd06.prod.outlook.com (2603:10a6:206::36)
 by AS8PR09MB4599.eurprd09.prod.outlook.com (2603:10a6:20b:293::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Sun, 20 Feb
 2022 13:07:07 +0000
Received: from VE1EUR02FT028.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::34) by AM5PR0601CA0071.outlook.office365.com
 (2603:10a6:206::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Sun, 20 Feb 2022 13:07:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 192.116.190.34)
 smtp.mailfrom=neuroblade.ai; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
Received-SPF: Fail (protection.outlook.com: domain of neuroblade.ai does not
 designate 192.116.190.34 as permitted sender)
 receiver=protection.outlook.com; client-ip=192.116.190.34;
 helo=nb-o365.localdomain;
Received: from nb-o365.localdomain (192.116.190.34) by
 VE1EUR02FT028.mail.protection.outlook.com (10.152.12.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.20 via Frontend Transport; Sun, 20 Feb 2022 13:07:07 +0000
Received: from amirgonnen-vm.neuroblade.corp (amirgonnen-vm.neuroblade.corp
 [192.168.3.87])
 by nb-o365.localdomain (Postfix) with SMTP id B003920667;
 Sun, 20 Feb 2022 15:06:08 +0200 (IST)
Received: by amirgonnen-vm.neuroblade.corp (sSMTP sendmail emulation);
 Sun, 20 Feb 2022 15:07:00 +0200
From: amir.gonnen@neuroblade.ai
Date: Sun, 20 Feb 2022 15:07:00 +0200
To: qemu-devel@nongnu.org
Subject: [PATCH] target/nios2: Shadow register set, EIC and VIC
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: <a0b237cd-8351-4389-bd7a-450586323e7a@VE1EUR02FT028.eop-EUR02.prod.protection.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2ed831a-b405-4b15-408d-08d9f471e5e9
X-MS-TrafficTypeDiagnostic: AS8PR09MB4599:EE_
X-Microsoft-Antispam-PRVS: <AS8PR09MB4599EB2B86EEE74F296BD7AEEB399@AS8PR09MB4599.eurprd09.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8/D0jyDrpA5WPyg3OOq+h9bFaIeVrcaXbD3MzBdR9JlA5kcqiC+ODj9J57Fm9wB98tsE+sPP63SUeBwN+YsUq5FyqEnDVnpuE2Zti+e128QaH1EnKhjnnrs3e+Y7DI8AqJR+/IvXKpqdMEmh3uzibrhKd5zGaFtTGCQgA9Yg1eOAyhEHTSs9DgRi4A7VH2FMQhLZP+rP4ivuwd6ZDVQmYRRJt90DTSkMuMAhYYRtfFaa+rEo5+cJYbVwk5KPLpc3m6Q8qhNkTv+Wp5Lz95GMk7KwW9wIgJLMWTeQgZ8r8OgVl5tE0Hkvnof4UBv7FtDrABk3F3JFtpV6afkNgnW68dLf9Pc/TLmNiF9r8KElhyIeN+xv7zRjzjver543DYvXZQkvYV+yLZA35aVUwcmMPt2XKHav/3Wri7H8TmaV7csyEcJihKZTIlE05KH41IRokL1oWQU8XsSyZ5c0k6nci1v2CwKGGkNtfU2J+QE43taoXIwTG3qSNisvNTNzOTVU0Q/SLOcP8ADNThuMeD1B+I9nTm6ucU23mexwyAxlWvNJyk9uOLBjNNpanKnfJwfB3iyeEyfyd37htptrdZisVBGOx01MTaKG2zAaqfFCQ+mTYRtM1RRBs/G4TTO8ZB+Dpnys9rwJgGxrefgLZ7XSitZFph6RcJWYLMqQiCA/cdhMLmV+jLYqZr32Cdqm7FpiVeDNQObds2kbWDxK56vTB7++QqTD5JUlenmHwlnrtBNfw+YvtonnbtsFKynNA0uBrRZz7Ta0m0D1TFd/o4dVe7dYnUrutZnGBneb8z7nzNEaCePu0MXi23F5Qn74KS37
X-Forefront-Antispam-Report: CIP:192.116.190.34; CTRY:IL; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:nb-o365.localdomain; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(39830400003)(396003)(136003)(346002)(376002)(36840700001)(46966006)(508600001)(36860700001)(316002)(54906003)(42186006)(6916009)(9686003)(53546011)(40480700001)(31686004)(47076005)(83380400001)(356005)(2906002)(70586007)(86362001)(31696002)(4326008)(82310400004)(8676002)(26005)(186003)(336012)(8936002)(70206006)(30864003)(81166007)(5660300002)(36900700001)(27056005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2022 13:07:07.4136 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ed831a-b405-4b15-408d-08d9f471e5e9
X-MS-Exchange-CrossTenant-Id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=63c61203-65af-4cf8-98e5-d12f35edaefa; Ip=[192.116.190.34];
 Helo=[nb-o365.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT028.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB4599
Received-SPF: pass client-ip=40.107.5.132;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai, Chris Wulff <crwulff@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From 99efcd655e83f034bce25271fe592d8789529e54 Mon Sep 17 00:00:00 2001
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
Date: Thu, 17 Feb 2022 15:43:14 +0200
Subject: [PATCH] target/nios2: Shadow register set, EIC and VIC

Implement nios2 Vectored Interrupt Controller (VIC).
This includes Exteral Interrupt Controller interface (EIC) and Shadow
Register set implementation on the nios2 cpu.
Implemented missing wrprs and rdprs instructions, and fixed eret.
Added intc_present property, true by default. When set to false, nios2
uses the EIC interface when handling IRQ.

To use VIC, the nios2 board should set VIC cpu property, disable
intc_present, connect VIC irq to cpu and connect VIC gpios.

Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
---
 hw/intc/Kconfig          |   4 +
 hw/intc/meson.build      |   1 +
 hw/intc/nios2_vic.c      | 327 +++++++++++++++++++++++++++++++++++++++
 target/nios2/cpu.c       |  59 +++++--
 target/nios2/cpu.h       |  69 ++++++++-
 target/nios2/helper.c    |  33 +++-
 target/nios2/helper.h    |   3 +
 target/nios2/op_helper.c |  31 +++-
 target/nios2/translate.c |  32 +++-
 9 files changed, 537 insertions(+), 22 deletions(-)
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
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 4cade61e93..9bd8a6301a 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -54,6 +54,8 @@ static void nios2_cpu_reset(DeviceState *dev)
     ncc->parent_reset(dev);

     memset(env->regs, 0, sizeof(uint32_t) * NUM_CORE_REGS);
+    memset(env->shadow_regs, 0, sizeof(uint32_t) * NUM_REG_SETS * NUM_GP_R=
EGS);
+    env->regs[CR_STATUS] |=3D CR_STATUS_RSIE;
     env->regs[R_PC] =3D cpu->reset_addr;

 #if defined(CONFIG_USER_ONLY)
@@ -64,10 +66,28 @@ static void nios2_cpu_reset(DeviceState *dev)
 #endif
 }

+bool nios2_take_eic_irq(const Nios2CPU *cpu)
+{
+    const CPUNios2State *env =3D &cpu->env;
+
+    if (cpu->rnmi) {
+        return !(env->regs[CR_STATUS] & CR_STATUS_NMI);
+    }
+
+    if (((env->regs[CR_STATUS] & CR_STATUS_PIE) =3D=3D 0) ||
+        (cpu->ril <=3D cpu_get_il(env)) ||
+        (cpu->rrs =3D=3D cpu_get_crs(env) &&
+          !(env->regs[CR_STATUS] & CR_STATUS_RSIE))) {
+
+        return false;
+    }
+
+    return true;
+}
+
 #ifndef CONFIG_USER_ONLY
-static void nios2_cpu_set_irq(void *opaque, int irq, int level)
+static void nios2_cpu_set_intc_irq(Nios2CPU *cpu, int irq, int level)
 {
-    Nios2CPU *cpu =3D opaque;
     CPUNios2State *env =3D &cpu->env;
     CPUState *cs =3D CPU(cpu);

@@ -82,6 +102,32 @@ static void nios2_cpu_set_irq(void *opaque, int irq, in=
t level)
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
     }
 }
+
+static void nios2_cpu_set_eic_irq(Nios2CPU *cpu, int level)
+{
+    CPUNios2State *env =3D &cpu->env;
+    CPUState *cs =3D CPU(cpu);
+
+    env->irq_pending =3D level;
+
+    if (env->irq_pending && nios2_take_eic_irq(cpu)) {
+        env->irq_pending =3D 0;
+        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+    } else if (!env->irq_pending) {
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+    }
+}
+
+static void nios2_cpu_set_irq(void *opaque, int irq, int level)
+{
+    Nios2CPU *cpu =3D opaque;
+
+    if (cpu->intc_present) {
+        nios2_cpu_set_intc_irq(cpu, irq, level);
+    } else {
+        nios2_cpu_set_eic_irq(cpu, level);
+    }
+}
 #endif

 static void nios2_cpu_initfn(Object *obj)
@@ -93,13 +139,6 @@ static void nios2_cpu_initfn(Object *obj)
 #if !defined(CONFIG_USER_ONLY)
     mmu_init(&cpu->env);

-    /*
-     * These interrupt lines model the IIC (internal interrupt
-     * controller). QEMU does not currently support the EIC
-     * (external interrupt controller) -- if we did it would be
-     * a separate device in hw/intc with a custom interface to
-     * the CPU, and boards using it would not wire up these IRQ lines.
-     */
     qdev_init_gpio_in_named(DEVICE(cpu), nios2_cpu_set_irq, "IRQ", 32);
 #endif
 }
@@ -201,6 +240,8 @@ static Property nios2_properties[] =3D {
     DEFINE_PROP_UINT32("mmu_tlb_num_ways", Nios2CPU, tlb_num_ways, 16),
     /* ALTR,tlb-num-entries */
     DEFINE_PROP_UINT32("mmu_pid_num_entries", Nios2CPU, tlb_num_entries, 2=
56),
+    /* interrupt-controller (internal) */
+    DEFINE_PROP_BOOL("intc_present", Nios2CPU, intc_present, true),
     DEFINE_PROP_END_OF_LIST(),
 };

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index d2ba0c5bbd..1b3d0ed25e 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -57,9 +57,14 @@ struct Nios2CPUClass {
 #define EXCEPTION_ADDRESS     0x00000004
 #define FAST_TLB_MISS_ADDRESS 0x00000008

+#define NUM_GP_REGS 32
+#define NUM_CR_REGS 32

 /* GP regs + CR regs + PC */
-#define NUM_CORE_REGS (32 + 32 + 1)
+#define NUM_CORE_REGS (NUM_GP_REGS + NUM_CR_REGS + 1)
+
+/* 63 shadow register sets. 0 is the primary set */
+#define NUM_REG_SETS 64

 /* General purpose register aliases */
 #define R_ZERO   0
@@ -80,17 +85,21 @@ struct Nios2CPUClass {
 #define R_RA     31

 /* Control register aliases */
-#define CR_BASE  32
+#define CR_BASE  NUM_GP_REGS
 #define CR_STATUS    (CR_BASE + 0)
 #define   CR_STATUS_PIE  (1 << 0)
 #define   CR_STATUS_U    (1 << 1)
 #define   CR_STATUS_EH   (1 << 2)
 #define   CR_STATUS_IH   (1 << 3)
 #define   CR_STATUS_IL   (63 << 4)
+#define   CR_STATUS_IL_OFFSET 6
 #define   CR_STATUS_CRS  (63 << 10)
+#define   CR_STATUS_CRS_OFFSET 10
 #define   CR_STATUS_PRS  (63 << 16)
+#define   CR_STATUS_PRS_OFFSET 16
 #define   CR_STATUS_NMI  (1 << 22)
 #define   CR_STATUS_RSIE (1 << 23)
+#define   CR_STATUS_SRS  (1 << 31)
 #define CR_ESTATUS   (CR_BASE + 1)
 #define CR_BSTATUS   (CR_BASE + 2)
 #define CR_IENABLE   (CR_BASE + 3)
@@ -131,6 +140,7 @@ struct Nios2CPUClass {

 /* Other registers */
 #define R_PC         64
+#define R_SSTATUS    30

 /* Exceptions */
 #define EXCP_BREAK    0x1000
@@ -157,6 +167,7 @@ struct Nios2CPUClass {

 struct CPUNios2State {
     uint32_t regs[NUM_CORE_REGS];
+    uint32_t shadow_regs[NUM_REG_SETS][NUM_GP_REGS];

 #if !defined(CONFIG_USER_ONLY)
     Nios2MMU mmu;
@@ -180,6 +191,7 @@ struct Nios2CPU {
     CPUNios2State env;

     bool mmu_present;
+    bool intc_present;
     uint32_t pid_num_bits;
     uint32_t tlb_num_ways;
     uint32_t tlb_num_entries;
@@ -188,10 +200,17 @@ struct Nios2CPU {
     uint32_t reset_addr;
     uint32_t exception_addr;
     uint32_t fast_tlb_miss_addr;
+
+    /* External Interrupt Controller Interface */
+    uint32_t rha; /* Requested handler address */
+    uint32_t ril; /* Requested interrupt level */
+    uint32_t rrs; /* Requested register set */
+    uint32_t rnmi; /* Requested nonmaskable interrupt */
 };


 void nios2_tcg_init(void);
+bool nios2_take_eic_irq(const Nios2CPU *cpu);
 void nios2_cpu_do_interrupt(CPUState *cs);
 void dump_mmu(CPUNios2State *env);
 void nios2_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
@@ -246,4 +265,50 @@ static inline void cpu_get_tb_cpu_state(CPUNios2State =
*env, target_ulong *pc,
     *flags =3D (env->regs[CR_STATUS] & (CR_STATUS_EH | CR_STATUS_U));
 }

+static inline uint32_t cpu_get_il(const CPUNios2State *env)
+{
+    return (env->regs[CR_STATUS] & CR_STATUS_IL)
+                    >> CR_STATUS_IL_OFFSET;
+}
+
+static inline void cpu_set_il(CPUNios2State *env, uint32_t value)
+{
+    env->regs[CR_STATUS] =3D (env->regs[CR_STATUS] & ~CR_STATUS_IL)
+                    | ((value << CR_STATUS_IL_OFFSET) & CR_STATUS_IL);
+}
+
+static inline uint32_t cpu_get_crs(const CPUNios2State *env)
+{
+    return (env->regs[CR_STATUS] & CR_STATUS_CRS)
+                    >> CR_STATUS_CRS_OFFSET;
+}
+
+static inline uint32_t cpu_get_prs(const CPUNios2State *env)
+{
+    return (env->regs[CR_STATUS] & CR_STATUS_PRS)
+                    >> CR_STATUS_PRS_OFFSET;
+}
+
+static inline void cpu_change_reg_set(CPUNios2State *env, uint32_t prev_se=
t,
+                                      uint32_t new_set)
+{
+    if (new_set =3D=3D prev_set) {
+        return;
+    }
+    memcpy(env->shadow_regs[prev_set], env->regs,
+           sizeof(uint32_t) * NUM_GP_REGS);
+    memcpy(env->regs, env->shadow_regs[new_set],
+           sizeof(uint32_t) * NUM_GP_REGS);
+    env->regs[CR_STATUS] =3D (env->regs[CR_STATUS] & (~CR_STATUS_PRS))
+                       | ((prev_set << CR_STATUS_PRS_OFFSET) & CR_STATUS_P=
RS);
+    env->regs[CR_STATUS] =3D (env->regs[CR_STATUS] & (~CR_STATUS_CRS))
+                       | ((new_set << CR_STATUS_CRS_OFFSET) & CR_STATUS_CR=
S);
+}
+
+static inline void cpu_set_crs(CPUNios2State *env, uint32_t value)
+{
+    uint32_t crs =3D cpu_get_crs(env);
+    cpu_change_reg_set(env, crs, value);
+}
+
 #endif /* NIOS2_CPU_H */
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index e5c98650e1..bc022e969d 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -54,21 +54,46 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     Nios2CPU *cpu =3D NIOS2_CPU(cs);
     CPUNios2State *env =3D &cpu->env;

+    if (cs->exception_index !=3D EXCP_IRQ) {
+        cpu_set_crs(env, 0);
+    }
+
     switch (cs->exception_index) {
     case EXCP_IRQ:
         assert(env->regs[CR_STATUS] & CR_STATUS_PIE);

         qemu_log_mask(CPU_LOG_INT, "interrupt at pc=3D%x\n", env->regs[R_P=
C]);

-        env->regs[CR_ESTATUS] =3D env->regs[CR_STATUS];
-        env->regs[CR_STATUS] |=3D CR_STATUS_IH;
+        uint32_t last_status =3D env->regs[CR_STATUS];
         env->regs[CR_STATUS] &=3D ~(CR_STATUS_PIE | CR_STATUS_U);

         env->regs[CR_EXCEPTION] &=3D ~(0x1F << 2);
         env->regs[CR_EXCEPTION] |=3D (cs->exception_index & 0x1F) << 2;

-        env->regs[R_EA] =3D env->regs[R_PC] + 4;
-        env->regs[R_PC] =3D cpu->exception_addr;
+        if (!cpu->intc_present) {
+            cpu_set_crs(env, cpu->rrs);
+            cpu_set_il(env, cpu->ril);
+            if (cpu->rnmi) {
+                env->regs[CR_STATUS] |=3D CR_STATUS_NMI;
+            } else {
+                env->regs[CR_STATUS] &=3D ~CR_STATUS_NMI;
+            }
+            if (cpu->rrs =3D=3D 0) {
+                env->regs[CR_ESTATUS] =3D last_status;
+            } else {
+                env->regs[R_SSTATUS] =3D last_status;
+                env->regs[R_SSTATUS] |=3D CR_STATUS_SRS;
+            }
+            env->regs[CR_STATUS] |=3D CR_STATUS_IH;
+            env->regs[R_EA] =3D env->regs[R_PC] + 4;
+            env->regs[R_PC] =3D cpu->rha;
+
+        } else {
+            env->regs[CR_ESTATUS] =3D last_status;
+            env->regs[R_EA] =3D env->regs[R_PC] + 4;
+            env->regs[R_PC] =3D cpu->exception_addr;
+        }
+
         break;

     case EXCP_TLBD:
diff --git a/target/nios2/helper.h b/target/nios2/helper.h
index 6c8f0b5b35..3e5c016e9c 100644
--- a/target/nios2/helper.h
+++ b/target/nios2/helper.h
@@ -18,6 +18,9 @@
  * <http://www.gnu.org/licenses/lgpl-2.1.html>
  */

+DEF_HELPER_2(eret, void, env, i32)
+DEF_HELPER_3(wrprs, void, env, i32, i32)
+DEF_HELPER_2(rdprs, i32, env, i32)
 DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, i32)

 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index a59003855a..1de823a067 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -40,8 +40,11 @@ static void nios2_check_interrupts(CPUNios2State *env)
 {
     if (env->irq_pending &&
         (env->regs[CR_STATUS] & CR_STATUS_PIE)) {
-        env->irq_pending =3D 0;
-        cpu_interrupt(env_cpu(env), CPU_INTERRUPT_HARD);
+        Nios2CPU *cpu =3D (Nios2CPU *)env_cpu(env);
+        if (cpu->intc_present || nios2_take_eic_irq(cpu)) {
+            env->irq_pending =3D 0;
+            cpu_interrupt(env_cpu(env), CPU_INTERRUPT_HARD);
+        }
     }
 }

@@ -59,3 +62,27 @@ void helper_raise_exception(CPUNios2State *env, uint32_t=
 index)
     cs->exception_index =3D index;
     cpu_loop_exit(cs);
 }
+
+void helper_wrprs(CPUNios2State *env, uint32_t reg_index, uint32_t value)
+{
+    uint32_t prs =3D cpu_get_prs(env);
+    env->shadow_regs[prs][reg_index] =3D value;
+}
+
+uint32_t helper_rdprs(CPUNios2State *env, uint32_t reg_index)
+{
+    uint32_t prs =3D cpu_get_prs(env);
+    return env->shadow_regs[prs][reg_index];
+}
+
+void helper_eret(CPUNios2State *env, uint32_t new_pc)
+{
+    uint32_t crs =3D cpu_get_crs(env);
+    if (crs =3D=3D 0) {
+        env->regs[CR_STATUS] =3D env->regs[CR_ESTATUS];
+    } else {
+        env->regs[CR_STATUS] =3D env->regs[R_SSTATUS];
+    }
+    cpu_change_reg_set(env, crs, cpu_get_crs(env));
+    env->regs[R_PC] =3D new_pc;
+}
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index f9abc2fdd2..e22ab1996a 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -205,6 +205,19 @@ static void call(DisasContext *dc, uint32_t code, uint=
32_t flags)
 /*
  * I-Type instructions
  */
+
+/*
+ * rB <- prs.rA + sigma(IMM16)
+ */
+static void rdprs(DisasContext *dc, uint32_t code, uint32_t flags)
+{
+    I_TYPE(instr, code);
+    TCGv t =3D tcg_temp_new();
+    gen_helper_rdprs(t, cpu_env, tcg_const_i32(instr.a));
+    tcg_gen_addi_tl(cpu_R[instr.b], t, instr.imm16.s);
+    tcg_temp_free(t);
+}
+
 /* Load instructions */
 static void gen_ldx(DisasContext *dc, uint32_t code, uint32_t flags)
 {
@@ -365,7 +378,7 @@ static const Nios2Instruction i_type_instructions[] =3D=
 {
     INSTRUCTION_FLG(gen_stx, MO_SL),                  /* stwio */
     INSTRUCTION_FLG(gen_bxx, TCG_COND_LTU),           /* bltu */
     INSTRUCTION_FLG(gen_ldx, MO_UL),                  /* ldwio */
-    INSTRUCTION_UNIMPLEMENTED(),                      /* rdprs */
+    INSTRUCTION(rdprs),                               /* rdprs */
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION_FLG(handle_r_type_instr, 0),          /* R-Type */
     INSTRUCTION_NOP(),                                /* flushd */
@@ -378,14 +391,23 @@ static const Nios2Instruction i_type_instructions[] =
=3D {
 /*
  * R-Type instructions
  */
+
+/*
+ * prs.rC <- rA
+ */
+static void wrprs(DisasContext *dc, uint32_t code, uint32_t flags)
+{
+    R_TYPE(instr, code);
+    gen_helper_wrprs(cpu_env, tcg_const_i32(instr.c), cpu_R[instr.a]);
+}
+
 /*
- * status <- estatus
+ * status <- CRS =3D=3D 0? estatus: sstatus
  * PC <- ea
  */
 static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_mov_tl(cpu_R[CR_STATUS], cpu_R[CR_ESTATUS]);
-    tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_EA]);
+    gen_helper_eret(cpu_env, cpu_R[R_EA]);

     dc->base.is_jmp =3D DISAS_JUMP;
 }
@@ -672,7 +694,7 @@ static const Nios2Instruction r_type_instructions[] =3D=
 {
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION(slli),                                /* slli */
     INSTRUCTION(sll),                                 /* sll */
-    INSTRUCTION_UNIMPLEMENTED(),                      /* wrprs */
+    INSTRUCTION(wrprs),                               /* wrprs */
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION(or),                                  /* or */
     INSTRUCTION(mulxsu),                              /* mulxsu */
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

