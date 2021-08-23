Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018143F4FE7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:52:35 +0200 (CEST)
Received: from localhost ([::1]:35098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIE7Y-0000g2-0F
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIE4s-00055K-Cv; Mon, 23 Aug 2021 13:49:42 -0400
Received: from mail-sn1anam02on2060.outbound.protection.outlook.com
 ([40.107.96.60]:10187 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIE4n-0001E1-Tm; Mon, 23 Aug 2021 13:49:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Js7B76VUmF2XCHYTZ4T9YVFXh9zC9N2udB6R8IJGlhFCZ24mGdV9m4Vf+SnA3lERi+wsoUar5NWoK6cl5a2ydyRUI/47ctMj30StZIejbfn5O1WNgppRPXQTmCINaP0tKl5wWC3ZYgfaFz+oVKtJaR8z76yFCFEO+56h/3Hm/CAfvoS0+Ua/uJ0MoJ6p0dPWZYFtN6+IJJONiExaBZpCTyLOMlixc+ILM1c40+AKEOfICEmjuHcD6pzzGUcKiL61wX3F2Zk+dGdoJZBy/Gi2FxZvBQQ50TpPDNT4U4zhKpEw5oAyrXp319Vm8qvtIWRXsrEJ+KYIVD+iyzxr1aE4LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAfy1Qd8vfGoI+Z/FZDlXy0Cl1tH5ncIUE6VUUj6OX4=;
 b=ER48oPxknfFGRor8ZoT2g4lC0+ADwGRrxRXuy7KpzZHJzTyxR6b12dbtrPYf7jO9sZ9e7thn514BI9fVBjra01y2FkjmB+Cx9ha8JnFbmdiEXgp68Q+c7f8ARqcxsDffHpS+uXnLpzpqWu5nJ/rOxzQ0tmXYB44GPZjjc2EtLCvi1eDfmBRIXEq47Ezg31liRjC0WxfXFHDOdR13i1E0GbE/6P3bOTOp+BTCEP+edTOwZI37VgenM1eV1D/Zp5+lLX20hOAPk5udn0qZeQMjGu5ArWbjpUNr+jqVntyZk+DFlGYcZHj0DrDy+CdtMiIXPpFZAmFvOUmiBJrHCOTZWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAfy1Qd8vfGoI+Z/FZDlXy0Cl1tH5ncIUE6VUUj6OX4=;
 b=GyaBoYQEIl8LONgzg7AEf6P1xXf4nX/vq+peR/EXlnNtR/0jR2XMyPTHnl1vhcHsziBC+VH61WWdbyWmo/41kPrnXZ8WPEtU7e3Er724QtHoo18iP8PvG3nR4h1wLPfgBTa/CYHRoA/n3ffCOEuVQTExdApRTpC044wBMusR8b4=
Received: from DM5PR22CA0007.namprd22.prod.outlook.com (2603:10b6:3:101::17)
 by BL3PR02MB7987.namprd02.prod.outlook.com (2603:10b6:208:356::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Mon, 23 Aug
 2021 17:49:33 +0000
Received: from DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:101:cafe::a9) by DM5PR22CA0007.outlook.office365.com
 (2603:10b6:3:101::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 17:49:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT008.mail.protection.outlook.com (10.13.5.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 17:49:33 +0000
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
 id 1mIE4a-0007u4-Ko; Mon, 23 Aug 2021 10:49:24 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH v2 2/9] hw/nvram: Introduce Xilinx Versal eFuse device
Date: Mon, 23 Aug 2021 10:49:17 -0700
Message-ID: <20210823174924.201669-3-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823174924.201669-1-tong.ho@xilinx.com>
References: <20210823174924.201669-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 108ae91c-de1e-488e-d1b5-08d9665e5d83
X-MS-TrafficTypeDiagnostic: BL3PR02MB7987:
X-Microsoft-Antispam-PRVS: <BL3PR02MB79874BD6618D5292119F6A0BCDC49@BL3PR02MB7987.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:416;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G+7RHiA4+2rCoEOAATzfcLUcJQWQzORwsCp7zrqOMlTaVII7oH34anvbdQRHJWOWOqw5JkjasKTRtQqUUOoTh41wRclVG5AzwXfw4AgpJ9KFoDF6oqCmPmXOmtLtYdyHFUEwvSYLHef+IqIJHqD7FFrDRVNlECTAZVI/CO4n1WK2eED0ZTBnHS5+IJtWlNtGjAYeiYuiz9OqyLOaQgQg46x0hFscizlpD9AsIICnvxbE4u1OF9rBA5CUpYKvAksBIIbyzZEhnEeYHLYQEMCC0U+Nx2JvrNE2/EImmbqpjlK4P+jxqJZJHHB+2OtAXxucKEPMTgFP1w+XYDmbYCkeQfPnGLDoW9jRL1YwLd6jWhWOHgt37dhAjFhS5frcq0pmeM2yjjYWwyAkKD8f2OpNPj6z717s7TZGolRlRoDTvllVVlu1chemIGExaUiReCIK5qFt2IeOm+JkhC/5Sl0kh8R6QJSEkOrlajPYLPlzRdmrlRv0Cp6IVxNYKOnuE1SA10L0lovoHUHdeHj1tj3fDx3d9xrYbcEPOVB++iPqmDArYSAkgT/Ddv2PhMTHjd6gXCVJAXUZTJ20gbQ4M+LWzZiDyFHfea339yuJgJB5kn4sEZEdaAuhKgLfLRa01eSaBC5uuwLkLHhho+nuYLasbK+I9scBb+uY/G6dH3p/vQRi/q7IxWEr684H/Y9mlPynIiooxie/qZkxIGuACOOjd/YU2t52XshBv4G5Z9NxCky+3eIv2nC9CkuqxfnngHj8ug9mg4Lleq/DpVNwziPMJeUvii7Hj4es7dSafI8FuWMX+jOun6jmPZXfR+lqre0W
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966006)(36840700001)(36860700001)(82310400003)(36756003)(5660300002)(6916009)(7636003)(8936002)(4326008)(47076005)(8676002)(1076003)(54906003)(9786002)(36906005)(83380400001)(44832011)(70206006)(70586007)(6666004)(426003)(82740400003)(966005)(7696005)(26005)(336012)(478600001)(186003)(2906002)(107886003)(30864003)(356005)(316002)(2616005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 17:49:33.0615 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 108ae91c-de1e-488e-d1b5-08d9665e5d83
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB7987
Received-SPF: pass client-ip=40.107.96.60; envelope-from=tongh@xilinx.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This implements the Xilinx Versal eFuse, an one-time
field-programmable non-volatile storage device.  There is
only one such device in the Xilinx Versal product family.

The command argument:
  -drive if=pflash,index=N,...
Can be used to optionally connect the storage array to a
backend storage, such that field-programmed values in one
invocation can be made available to next invocation.

The backend storage must be a seekable binary file, and
its size must be 3072 bytes or larger. A file with all
binary 0's is a 'blank'.

The drive 'index' value N has a default value of 1, but
can be changed using command argument:
  -global xlnx,efuse.drive-index=N

This device has two separate mmio interfaces, a controller
and a flatten readback.

The controller provides interfaces for field-programming,
configuration, control, and status.

The flatten readback is a cache to provide a byte-accessible
read-only interface to efficiently read efuse array.

Co-authored-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Co-authored-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/nvram/Kconfig                     |   8 +
 hw/nvram/meson.build                 |   8 +
 hw/nvram/xlnx-versal-efuse-cache.c   | 139 +++++
 hw/nvram/xlnx-versal-efuse-ctrl.c    | 784 +++++++++++++++++++++++++++
 include/hw/nvram/xlnx-versal-efuse.h |  62 +++
 5 files changed, 1001 insertions(+)
 create mode 100644 hw/nvram/xlnx-versal-efuse-cache.c
 create mode 100644 hw/nvram/xlnx-versal-efuse-ctrl.c
 create mode 100644 include/hw/nvram/xlnx-versal-efuse.h

diff --git a/hw/nvram/Kconfig b/hw/nvram/Kconfig
index e872fcb194..e96749ced3 100644
--- a/hw/nvram/Kconfig
+++ b/hw/nvram/Kconfig
@@ -15,3 +15,11 @@ config NMC93XX_EEPROM
 
 config CHRP_NVRAM
     bool
+
+config XLNX_EFUSE
+    bool
+
+config XLNX_EFUSE_VERSAL
+    bool
+    default y if XLNX_VERSAL
+    select XLNX_EFUSE
diff --git a/hw/nvram/meson.build b/hw/nvram/meson.build
index fd2951a860..a432665158 100644
--- a/hw/nvram/meson.build
+++ b/hw/nvram/meson.build
@@ -9,5 +9,13 @@ softmmu_ss.add(when: 'CONFIG_AT24C', if_true: files('eeprom_at24c.c'))
 softmmu_ss.add(when: 'CONFIG_MAC_NVRAM', if_true: files('mac_nvram.c'))
 softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_otp.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_nvm.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_EFUSE', if_true: files('xlnx-efuse.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_EFUSE_VERSAL', if_true: files(
+                                                   'xlnx-versal-efuse-cache.c',
+                                                   'xlnx-versal-efuse-ctrl.c'))
+if 'CONFIG_XLNX_BBRAM' in config_all or \
+   'CONFIG_XLNX_EFUSE' in config_all
+  softmmu_ss.add(files('xlnx-efuse-crc.c'))
+endif
 
 specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_nvram.c'))
diff --git a/hw/nvram/xlnx-versal-efuse-cache.c b/hw/nvram/xlnx-versal-efuse-cache.c
new file mode 100644
index 0000000000..8847efe55e
--- /dev/null
+++ b/hw/nvram/xlnx-versal-efuse-cache.c
@@ -0,0 +1,139 @@
+/*
+ * QEMU model of the EFuse_Cache
+ *
+ * Copyright (c) 2017 Xilinx Inc.
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
+#include "hw/nvram/xlnx-versal-efuse.h"
+
+#include "qemu/log.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+
+#ifndef XILINX_EFUSE_CACHE_ERR_DEBUG
+#define XILINX_EFUSE_CACHE_ERR_DEBUG 0
+#endif
+
+#define XILINX_EFUSE_CACHE(obj) \
+     OBJECT_CHECK(XlnxVersalEFuseCache, (obj), TYPE_XLNX_VERSAL_EFUSE_CACHE)
+
+#define DPRINT(...) \
+    if (XILINX_EFUSE_CACHE_ERR_DEBUG) {  \
+        qemu_log(__VA_ARGS__);         \
+    }
+
+#define DPRINT_GE(args, ...) \
+     qemu_log_mask(LOG_GUEST_ERROR, "%s: " args, __func__, ## __VA_ARGS__);
+
+#define MR_SIZE 0xC00
+
+static uint64_t efuse_cache_read(void *opaque, hwaddr addr, unsigned size)
+{
+    XlnxVersalEFuseCache *s = XILINX_EFUSE_CACHE(opaque);
+    unsigned int w0 = QEMU_ALIGN_DOWN(addr * 8, 32);
+    unsigned int w1 = QEMU_ALIGN_DOWN((addr + size - 1) * 8, 32);
+
+    uint64_t ret;
+
+    assert(w0 == w1 || (w0 + 32) == w1);
+
+    ret = xlnx_versal_efuse_read_row(s->efuse, w1, NULL);
+    if (w0 < w1) {
+        ret <<= 32;
+        ret |= xlnx_versal_efuse_read_row(s->efuse, w0, NULL);
+    }
+
+    /* If 'addr' unaligned, the guest is always assumed to be little-endian. */
+    addr &= 3;
+    if (addr) {
+        ret >>= 8 * addr;
+    }
+
+    return ret;
+}
+
+static void efuse_cache_write(void *opaque, hwaddr addr, uint64_t value,
+                              unsigned size)
+{
+    /* No Register Writes allowed */
+    DPRINT_GE("Invalid write to efuse cache registers");
+}
+
+static const MemoryRegionOps efuse_cache_ops = {
+    .read = efuse_cache_read,
+    .write = efuse_cache_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+    },
+};
+
+static void efuse_cache_init(Object *obj)
+{
+    XlnxVersalEFuseCache *s = XILINX_EFUSE_CACHE(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    memory_region_init_io(&s->iomem, obj, &efuse_cache_ops, s,
+                          TYPE_XLNX_VERSAL_EFUSE_CACHE, MR_SIZE);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_efuse_cache = {
+    .name = TYPE_XLNX_VERSAL_EFUSE_CACHE,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static Property efuse_cache_props[] = {
+    DEFINE_PROP_LINK("efuse",
+                     XlnxVersalEFuseCache, efuse,
+                     TYPE_XLNX_EFUSE, XLNXEFuse *),
+
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void efuse_cache_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_efuse_cache;
+    device_class_set_props(dc, efuse_cache_props);
+}
+
+static const TypeInfo efuse_cache_info = {
+    .name          = TYPE_XLNX_VERSAL_EFUSE_CACHE,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XlnxVersalEFuseCache),
+    .class_init    = efuse_cache_class_init,
+    .instance_init = efuse_cache_init,
+};
+
+static void efuse_cache_register_types(void)
+{
+    type_register_static(&efuse_cache_info);
+}
+
+type_init(efuse_cache_register_types)
diff --git a/hw/nvram/xlnx-versal-efuse-ctrl.c b/hw/nvram/xlnx-versal-efuse-ctrl.c
new file mode 100644
index 0000000000..2236f4ede6
--- /dev/null
+++ b/hw/nvram/xlnx-versal-efuse-ctrl.c
@@ -0,0 +1,784 @@
+/*
+ * QEMU model of the Versal eFuse controller
+ *
+ * Copyright (c) 2020 Xilinx Inc.
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
+#include "hw/nvram/xlnx-versal-efuse.h"
+
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+
+#ifndef XILINX_EFUSE_CTRL_ERR_DEBUG
+#define XILINX_EFUSE_CTRL_ERR_DEBUG 0
+#endif
+
+#define XILINX_EFUSE_CTRL(obj) \
+     OBJECT_CHECK(XlnxVersalEFuseCtrl, (obj), TYPE_XLNX_VERSAL_EFUSE_CTRL)
+
+REG32(WR_LOCK, 0x0)
+    FIELD(WR_LOCK, LOCK, 0, 16)
+REG32(CFG, 0x4)
+    FIELD(CFG, SLVERR_ENABLE, 5, 1)
+    FIELD(CFG, MARGIN_RD, 2, 1)
+    FIELD(CFG, PGM_EN, 1, 1)
+REG32(STATUS, 0x8)
+    FIELD(STATUS, AES_USER_KEY_1_CRC_PASS, 11, 1)
+    FIELD(STATUS, AES_USER_KEY_1_CRC_DONE, 10, 1)
+    FIELD(STATUS, AES_USER_KEY_0_CRC_PASS, 9, 1)
+    FIELD(STATUS, AES_USER_KEY_0_CRC_DONE, 8, 1)
+    FIELD(STATUS, AES_CRC_PASS, 7, 1)
+    FIELD(STATUS, AES_CRC_DONE, 6, 1)
+    FIELD(STATUS, CACHE_DONE, 5, 1)
+    FIELD(STATUS, CACHE_LOAD, 4, 1)
+    FIELD(STATUS, EFUSE_2_TBIT, 2, 1)
+    FIELD(STATUS, EFUSE_1_TBIT, 1, 1)
+    FIELD(STATUS, EFUSE_0_TBIT, 0, 1)
+REG32(EFUSE_PGM_ADDR, 0xc)
+    FIELD(EFUSE_PGM_ADDR, PAGE, 13, 4)
+    FIELD(EFUSE_PGM_ADDR, ROW, 5, 8)
+    FIELD(EFUSE_PGM_ADDR, COLUMN, 0, 5)
+REG32(EFUSE_RD_ADDR, 0x10)
+    FIELD(EFUSE_RD_ADDR, PAGE, 13, 4)
+    FIELD(EFUSE_RD_ADDR, ROW, 5, 8)
+REG32(EFUSE_RD_DATA, 0x14)
+REG32(TPGM, 0x18)
+    FIELD(TPGM, VALUE, 0, 16)
+REG32(TRD, 0x1c)
+    FIELD(TRD, VALUE, 0, 8)
+REG32(TSU_H_PS, 0x20)
+    FIELD(TSU_H_PS, VALUE, 0, 8)
+REG32(TSU_H_PS_CS, 0x24)
+    FIELD(TSU_H_PS_CS, VALUE, 0, 8)
+REG32(TRDM, 0x28)
+    FIELD(TRDM, VALUE, 0, 8)
+REG32(TSU_H_CS, 0x2c)
+    FIELD(TSU_H_CS, VALUE, 0, 8)
+REG32(EFUSE_ISR, 0x30)
+    FIELD(EFUSE_ISR, APB_SLVERR, 31, 1)
+    FIELD(EFUSE_ISR, CACHE_PARITY_E2, 14, 1)
+    FIELD(EFUSE_ISR, CACHE_PARITY_E1, 13, 1)
+    FIELD(EFUSE_ISR, CACHE_PARITY_E0S, 12, 1)
+    FIELD(EFUSE_ISR, CACHE_PARITY_E0R, 11, 1)
+    FIELD(EFUSE_ISR, CACHE_APB_SLVERR, 10, 1)
+    FIELD(EFUSE_ISR, CACHE_REQ_ERROR, 9, 1)
+    FIELD(EFUSE_ISR, MAIN_REQ_ERROR, 8, 1)
+    FIELD(EFUSE_ISR, READ_ON_CACHE_LD, 7, 1)
+    FIELD(EFUSE_ISR, CACHE_FSM_ERROR, 6, 1)
+    FIELD(EFUSE_ISR, MAIN_FSM_ERROR, 5, 1)
+    FIELD(EFUSE_ISR, CACHE_ERROR, 4, 1)
+    FIELD(EFUSE_ISR, RD_ERROR, 3, 1)
+    FIELD(EFUSE_ISR, RD_DONE, 2, 1)
+    FIELD(EFUSE_ISR, PGM_ERROR, 1, 1)
+    FIELD(EFUSE_ISR, PGM_DONE, 0, 1)
+REG32(EFUSE_IMR, 0x34)
+    FIELD(EFUSE_IMR, APB_SLVERR, 31, 1)
+    FIELD(EFUSE_IMR, CACHE_PARITY_E2, 14, 1)
+    FIELD(EFUSE_IMR, CACHE_PARITY_E1, 13, 1)
+    FIELD(EFUSE_IMR, CACHE_PARITY_E0S, 12, 1)
+    FIELD(EFUSE_IMR, CACHE_PARITY_E0R, 11, 1)
+    FIELD(EFUSE_IMR, CACHE_APB_SLVERR, 10, 1)
+    FIELD(EFUSE_IMR, CACHE_REQ_ERROR, 9, 1)
+    FIELD(EFUSE_IMR, MAIN_REQ_ERROR, 8, 1)
+    FIELD(EFUSE_IMR, READ_ON_CACHE_LD, 7, 1)
+    FIELD(EFUSE_IMR, CACHE_FSM_ERROR, 6, 1)
+    FIELD(EFUSE_IMR, MAIN_FSM_ERROR, 5, 1)
+    FIELD(EFUSE_IMR, CACHE_ERROR, 4, 1)
+    FIELD(EFUSE_IMR, RD_ERROR, 3, 1)
+    FIELD(EFUSE_IMR, RD_DONE, 2, 1)
+    FIELD(EFUSE_IMR, PGM_ERROR, 1, 1)
+    FIELD(EFUSE_IMR, PGM_DONE, 0, 1)
+REG32(EFUSE_IER, 0x38)
+    FIELD(EFUSE_IER, APB_SLVERR, 31, 1)
+    FIELD(EFUSE_IER, CACHE_PARITY_E2, 14, 1)
+    FIELD(EFUSE_IER, CACHE_PARITY_E1, 13, 1)
+    FIELD(EFUSE_IER, CACHE_PARITY_E0S, 12, 1)
+    FIELD(EFUSE_IER, CACHE_PARITY_E0R, 11, 1)
+    FIELD(EFUSE_IER, CACHE_APB_SLVERR, 10, 1)
+    FIELD(EFUSE_IER, CACHE_REQ_ERROR, 9, 1)
+    FIELD(EFUSE_IER, MAIN_REQ_ERROR, 8, 1)
+    FIELD(EFUSE_IER, READ_ON_CACHE_LD, 7, 1)
+    FIELD(EFUSE_IER, CACHE_FSM_ERROR, 6, 1)
+    FIELD(EFUSE_IER, MAIN_FSM_ERROR, 5, 1)
+    FIELD(EFUSE_IER, CACHE_ERROR, 4, 1)
+    FIELD(EFUSE_IER, RD_ERROR, 3, 1)
+    FIELD(EFUSE_IER, RD_DONE, 2, 1)
+    FIELD(EFUSE_IER, PGM_ERROR, 1, 1)
+    FIELD(EFUSE_IER, PGM_DONE, 0, 1)
+REG32(EFUSE_IDR, 0x3c)
+    FIELD(EFUSE_IDR, APB_SLVERR, 31, 1)
+    FIELD(EFUSE_IDR, CACHE_PARITY_E2, 14, 1)
+    FIELD(EFUSE_IDR, CACHE_PARITY_E1, 13, 1)
+    FIELD(EFUSE_IDR, CACHE_PARITY_E0S, 12, 1)
+    FIELD(EFUSE_IDR, CACHE_PARITY_E0R, 11, 1)
+    FIELD(EFUSE_IDR, CACHE_APB_SLVERR, 10, 1)
+    FIELD(EFUSE_IDR, CACHE_REQ_ERROR, 9, 1)
+    FIELD(EFUSE_IDR, MAIN_REQ_ERROR, 8, 1)
+    FIELD(EFUSE_IDR, READ_ON_CACHE_LD, 7, 1)
+    FIELD(EFUSE_IDR, CACHE_FSM_ERROR, 6, 1)
+    FIELD(EFUSE_IDR, MAIN_FSM_ERROR, 5, 1)
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
+REG32(EFUSE_AES_USR_KEY0_CRC, 0x4c)
+REG32(EFUSE_AES_USR_KEY1_CRC, 0x50)
+REG32(EFUSE_PD, 0x54)
+REG32(EFUSE_ANLG_OSC_SW_1LP, 0x60)
+REG32(EFUSE_TEST_CTRL, 0x100)
+
+#define R_MAX (R_EFUSE_TEST_CTRL + 1)
+
+#define R_WR_LOCK_UNLOCK_PASSCODE   (0xDF0D)
+
+/*
+ * eFuse layout references:
+ *   UG????, p.???, Table ???
+ *   https://github.com/Xilinx/embeddedsw/blob/release-2019.2/lib/sw_services/xilnvm/src/xnvm_efuse_hw.h
+ */
+#define BIT_POS_OF(A_) \
+    ((uint32_t)((A_) & (R_EFUSE_PGM_ADDR_ROW_MASK | \
+                        R_EFUSE_PGM_ADDR_COLUMN_MASK)))
+
+#define BIT_POS(R_, C_) \
+        ((uint32_t)((R_EFUSE_PGM_ADDR_ROW_MASK                  \
+                    & ((R_) << R_EFUSE_PGM_ADDR_ROW_SHIFT))     \
+                    |                                           \
+                    (R_EFUSE_PGM_ADDR_COLUMN_MASK               \
+                     & ((C_) << R_EFUSE_PGM_ADDR_COLUMN_SHIFT))))
+
+#define EFUSE_TBIT_POS(A_)          (BIT_POS_OF(A_) >= BIT_POS(0, 28))
+
+#define EFUSE_ANCHOR_ROW            (0)
+#define EFUSE_ANCHOR_3_COL          (27)
+#define EFUSE_ANCHOR_1_COL          (1)
+
+#define EFUSE_AES_KEY_START         BIT_POS(12, 0)
+#define EFUSE_AES_KEY_END           BIT_POS(19, 31)
+#define EFUSE_USER_KEY_0_START      BIT_POS(20, 0)
+#define EFUSE_USER_KEY_0_END        BIT_POS(27, 31)
+#define EFUSE_USER_KEY_1_START      BIT_POS(28, 0)
+#define EFUSE_USER_KEY_1_END        BIT_POS(35, 31)
+
+#define EFUSE_RD_BLOCKED_START      EFUSE_AES_KEY_START
+#define EFUSE_RD_BLOCKED_END        EFUSE_USER_KEY_1_END
+
+#define EFUSE_GLITCH_DET_WR_LK      BIT_POS(4, 31)
+#define EFUSE_PPK0_WR_LK            BIT_POS(43, 6)
+#define EFUSE_PPK1_WR_LK            BIT_POS(43, 7)
+#define EFUSE_PPK2_WR_LK            BIT_POS(43, 8)
+#define EFUSE_AES_WR_LK             BIT_POS(43, 11)
+#define EFUSE_USER_KEY_0_WR_LK      BIT_POS(43, 13)
+#define EFUSE_USER_KEY_1_WR_LK      BIT_POS(43, 15)
+#define EFUSE_PUF_SYN_LK            BIT_POS(43, 16)
+#define EFUSE_DNA_WR_LK             BIT_POS(43, 27)
+#define EFUSE_BOOT_ENV_WR_LK        BIT_POS(43, 28)
+
+#define EFUSE_PGM_LOCKED_START      BIT_POS(44, 0)
+#define EFUSE_PGM_LOCKED_END        BIT_POS(51, 31)
+
+#define EFUSE_PUF_PAGE              (2)
+#define EFUSE_PUF_SYN_START         BIT_POS(129, 0)
+#define EFUSE_PUF_SYN_END           BIT_POS(255, 27)
+
+#define EFUSE_KEY_CRC_LK_ROW           (43)
+#define EFUSE_AES_KEY_CRC_LK_MASK      ((1U << 9) | (1U << 10))
+#define EFUSE_USER_KEY_0_CRC_LK_MASK   (1U << 12)
+#define EFUSE_USER_KEY_1_CRC_LK_MASK   (1U << 14)
+
+/*
+ * A handy macro to return value of an array element,
+ * or a specific default if given index is out of bound.
+ */
+#define ARRAY_GET(A_, I_, D_) \
+    ((unsigned int)(I_) < ARRAY_SIZE(A_) ? (A_)[I_] : (D_))
+
+QEMU_BUILD_BUG_ON(R_MAX != ARRAY_SIZE(((XlnxVersalEFuseCtrl *)0)->regs));
+
+static void efuse_imr_update_irq(XlnxVersalEFuseCtrl *s)
+{
+    bool pending = s->regs[R_EFUSE_ISR] & ~s->regs[R_EFUSE_IMR];
+    qemu_set_irq(s->irq_efuse_imr, pending);
+}
+
+static void efuse_isr_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalEFuseCtrl *s = XILINX_EFUSE_CTRL(reg->opaque);
+    efuse_imr_update_irq(s);
+}
+
+static uint64_t efuse_ier_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalEFuseCtrl *s = XILINX_EFUSE_CTRL(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_EFUSE_IMR] &= ~val;
+    efuse_imr_update_irq(s);
+    return 0;
+}
+
+static uint64_t efuse_idr_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalEFuseCtrl *s = XILINX_EFUSE_CTRL(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_EFUSE_IMR] |= val;
+    efuse_imr_update_irq(s);
+    return 0;
+}
+
+static void efuse_status_tbits_sync(XlnxVersalEFuseCtrl *s)
+{
+    uint32_t check = xlnx_efuse_tbits_check(s->efuse);
+    uint32_t val = s->regs[R_STATUS];
+
+    val = FIELD_DP32(val, STATUS, EFUSE_0_TBIT, !!(check & (1 << 0)));
+    val = FIELD_DP32(val, STATUS, EFUSE_1_TBIT, !!(check & (1 << 1)));
+    val = FIELD_DP32(val, STATUS, EFUSE_2_TBIT, !!(check & (1 << 2)));
+
+    s->regs[R_STATUS] = val;
+}
+
+static void efuse_anchor_bits_check(XlnxVersalEFuseCtrl *s)
+{
+    unsigned page;
+
+    if (!s->efuse || !s->efuse->init_tbits) {
+        return;
+    }
+
+    for (page = 0; page < s->efuse->efuse_nr; page++) {
+        uint32_t row = 0, bit;
+
+        row = FIELD_DP32(row, EFUSE_PGM_ADDR, PAGE, page);
+        row = FIELD_DP32(row, EFUSE_PGM_ADDR, ROW, EFUSE_ANCHOR_ROW);
+
+        bit = FIELD_DP32(row, EFUSE_PGM_ADDR, COLUMN, EFUSE_ANCHOR_3_COL);
+        if (!xlnx_efuse_get_bit(s->efuse, bit)) {
+            xlnx_efuse_set_bit(s->efuse, bit);
+        }
+
+        bit = FIELD_DP32(row, EFUSE_PGM_ADDR, COLUMN, EFUSE_ANCHOR_1_COL);
+        if (!xlnx_efuse_get_bit(s->efuse, bit)) {
+            xlnx_efuse_set_bit(s->efuse, bit);
+        }
+    }
+}
+
+static void efuse_key_crc_check(RegisterInfo *reg, uint32_t crc,
+                                uint32_t pass_mask, uint32_t done_mask,
+                                unsigned first, uint32_t lk_mask)
+{
+    XlnxVersalEFuseCtrl *s = XILINX_EFUSE_CTRL(reg->opaque);
+    uint32_t r, lk_bits;
+
+    /*
+     * To start, assume both DONE and PASS, and clear PASS by xor
+     * if CRC-check fails or CRC-check disabled by lock fuse.
+     */
+    r = s->regs[R_STATUS] | done_mask | pass_mask;
+
+    lk_bits = xlnx_efuse_get_row(s->efuse, EFUSE_KEY_CRC_LK_ROW) & lk_mask;
+    if (lk_bits == 0 && xlnx_efuse_k256_check(s->efuse, crc, first)) {
+        pass_mask = 0;
+    }
+
+    s->regs[R_STATUS] = r ^ pass_mask;
+}
+
+static void efuse_data_sync(XlnxVersalEFuseCtrl *s)
+{
+    efuse_status_tbits_sync(s);
+}
+
+static int efuse_lk_spec_cmp(const void *a, const void *b)
+{
+    uint16_t r1 = ((const XLNXEFuseLkSpec *)a)->row;
+    uint16_t r2 = ((const XLNXEFuseLkSpec *)b)->row;
+
+    return (r1 > r2) - (r1 < r2);
+}
+
+static void efuse_lk_spec_sort(XlnxVersalEFuseCtrl *s)
+{
+    XLNXEFuseLkSpec *ary = s->extra_pg0_lock.spec;
+    const uint32_t n8  = s->extra_pg0_lock_n16 * 2;
+    const uint32_t sz  = sizeof(ary[0]);
+    const uint32_t cnt = n8 / sz;
+
+    if (!ary || !n8) {
+        return;
+    }
+
+    if ((n8 % sz) != 0) {
+        error_setg(&error_abort,
+                   "%s: property 'pg0-lock' item-count not multiple of %u",
+                   object_get_canonical_path(OBJECT(s)), sz);
+    }
+
+    qsort(ary, cnt, sz, efuse_lk_spec_cmp);
+}
+
+static uint32_t efuse_lk_spec_find(XlnxVersalEFuseCtrl *s, uint32_t row)
+{
+    const XLNXEFuseLkSpec *ary = s->extra_pg0_lock.spec;
+    const uint32_t n8  = s->extra_pg0_lock_n16 * 2;
+    const uint32_t sz  = sizeof(ary[0]);
+    const uint32_t cnt = n8 / sz;
+    const XLNXEFuseLkSpec *item = NULL;
+
+    if (ary && cnt) {
+        XLNXEFuseLkSpec k = { .row = row, };
+
+        item = bsearch(&k, ary, cnt, sz, efuse_lk_spec_cmp);
+    }
+
+    return item ? item->lk_bit : 0;
+}
+
+static uint32_t efuse_bit_locked(XlnxVersalEFuseCtrl *s, uint32_t bit)
+{
+    /* Hard-coded locks */
+    static const uint16_t pg0_hard_lock[] = {
+        [4] = EFUSE_GLITCH_DET_WR_LK,
+        [37] = EFUSE_BOOT_ENV_WR_LK,
+
+        [8 ... 11]  = EFUSE_DNA_WR_LK,
+        [12 ... 19] = EFUSE_AES_WR_LK,
+        [20 ... 27] = EFUSE_USER_KEY_0_WR_LK,
+        [28 ... 35] = EFUSE_USER_KEY_1_WR_LK,
+        [64 ... 71] = EFUSE_PPK0_WR_LK,
+        [72 ... 79] = EFUSE_PPK1_WR_LK,
+        [80 ... 87] = EFUSE_PPK2_WR_LK,
+    };
+
+    uint32_t row = FIELD_EX32(bit, EFUSE_PGM_ADDR, ROW);
+    uint32_t lk_bit = ARRAY_GET(pg0_hard_lock, row, 0);
+
+    return lk_bit ? lk_bit : efuse_lk_spec_find(s, row);
+}
+
+static bool efuse_pgm_locked(XlnxVersalEFuseCtrl *s, unsigned int bit)
+{
+
+    unsigned int lock = 1;
+
+    /* Global lock */
+    if (!ARRAY_FIELD_EX32(s->regs, CFG, PGM_EN)) {
+        goto ret_lock;
+    }
+
+    /* Row lock */
+    switch (FIELD_EX32(bit, EFUSE_PGM_ADDR, PAGE)) {
+    case 0:
+        if (ARRAY_FIELD_EX32(s->regs, EFUSE_PGM_LOCK, SPK_ID_LOCK) &&
+            bit >= EFUSE_PGM_LOCKED_START && bit <= EFUSE_PGM_LOCKED_END) {
+            goto ret_lock;
+        }
+
+        lock = efuse_bit_locked(s, bit);
+        break;
+    case EFUSE_PUF_PAGE:
+        if (bit < EFUSE_PUF_SYN_START || bit > EFUSE_PUF_SYN_END) {
+            lock = 0;
+            goto ret_lock;
+        }
+
+        lock = EFUSE_PUF_SYN_LK;
+        break;
+    default:
+        lock = 0;
+        goto ret_lock;
+    }
+
+    /* Row lock by an efuse bit */
+    if (lock) {
+        lock = xlnx_efuse_get_bit(s->efuse, lock);
+    }
+
+ ret_lock:
+    return lock != 0;
+}
+
+static void efuse_pgm_addr_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalEFuseCtrl *s = XILINX_EFUSE_CTRL(reg->opaque);
+    unsigned bit = val64;
+    bool ok = false;
+
+    /* Always zero out PGM_ADDR because it is write-only */
+    s->regs[R_EFUSE_PGM_ADDR] = 0;
+
+    /*
+     * Indicate error if bit is write-protected (or read-only
+     * as guarded by efuse_set_bit()).
+     *
+     * Keep it simple by not modeling program timing.
+     *
+     * Note: model must NEVER clear the PGM_ERROR bit; it is
+     *       up to guest to do so (or by reset).
+     */
+    if (efuse_pgm_locked(s, bit)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Denied setting of efuse<%u, %u, %u>\n",
+                      object_get_canonical_path(OBJECT(s)),
+                      FIELD_EX32(bit, EFUSE_PGM_ADDR, PAGE),
+                      FIELD_EX32(bit, EFUSE_PGM_ADDR, ROW),
+                      FIELD_EX32(bit, EFUSE_PGM_ADDR, COLUMN));
+    } else if (xlnx_efuse_set_bit(s->efuse, bit)) {
+        ok = true;
+        if (EFUSE_TBIT_POS(bit)) {
+            efuse_status_tbits_sync(s);
+        }
+    }
+
+    if (!ok) {
+        ARRAY_FIELD_DP32(s->regs, EFUSE_ISR, PGM_ERROR, 1);
+    }
+
+    ARRAY_FIELD_DP32(s->regs, EFUSE_ISR, PGM_DONE, 1);
+    efuse_imr_update_irq(s);
+}
+
+static void efuse_rd_addr_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalEFuseCtrl *s = XILINX_EFUSE_CTRL(reg->opaque);
+    unsigned bit = val64;
+    bool denied;
+
+    /* Always zero out RD_ADDR because it is write-only */
+    s->regs[R_EFUSE_RD_ADDR] = 0;
+
+    /*
+     * Indicate error if row is read-blocked.
+     *
+     * Note: model must NEVER clear the RD_ERROR bit; it is
+     *       up to guest to do so (or by reset).
+     */
+    s->regs[R_EFUSE_RD_DATA] = xlnx_versal_efuse_read_row(s->efuse,
+                                                          bit, &denied);
+    if (denied) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Denied reading of efuse<%u, %u>\n",
+                      object_get_canonical_path(OBJECT(s)),
+                      FIELD_EX32(bit, EFUSE_RD_ADDR, PAGE),
+                      FIELD_EX32(bit, EFUSE_RD_ADDR, ROW));
+
+        ARRAY_FIELD_DP32(s->regs, EFUSE_ISR, RD_ERROR, 1);
+    }
+
+    ARRAY_FIELD_DP32(s->regs, EFUSE_ISR, RD_DONE, 1);
+    efuse_imr_update_irq(s);
+    return;
+}
+
+static uint64_t efuse_cache_load_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalEFuseCtrl *s = XILINX_EFUSE_CTRL(reg->opaque);
+
+    if (val64 & R_EFUSE_CACHE_LOAD_LOAD_MASK) {
+        efuse_data_sync(s);
+
+        ARRAY_FIELD_DP32(s->regs, STATUS, CACHE_DONE, 1);
+        efuse_imr_update_irq(s);
+    }
+
+    return 0;
+}
+
+static uint64_t efuse_pgm_lock_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalEFuseCtrl *s = XILINX_EFUSE_CTRL(reg->opaque);
+
+    /* Ignore all other bits */
+    val64 = FIELD_EX32(val64, EFUSE_PGM_LOCK, SPK_ID_LOCK);
+
+    /* Once the bit is written 1, only reset will clear it to 0 */
+    val64 |= ARRAY_FIELD_EX32(s->regs, EFUSE_PGM_LOCK, SPK_ID_LOCK);
+
+    return val64;
+}
+
+static void efuse_aes_crc_postw(RegisterInfo *reg, uint64_t val64)
+{
+    efuse_key_crc_check(reg, val64,
+                        R_STATUS_AES_CRC_PASS_MASK,
+                        R_STATUS_AES_CRC_DONE_MASK,
+                        EFUSE_AES_KEY_START,
+                        EFUSE_AES_KEY_CRC_LK_MASK);
+}
+
+static void efuse_aes_u0_crc_postw(RegisterInfo *reg, uint64_t val64)
+{
+    efuse_key_crc_check(reg, val64,
+                        R_STATUS_AES_USER_KEY_0_CRC_PASS_MASK,
+                        R_STATUS_AES_USER_KEY_0_CRC_DONE_MASK,
+                        EFUSE_USER_KEY_0_START,
+                        EFUSE_USER_KEY_0_CRC_LK_MASK);
+}
+
+static void efuse_aes_u1_crc_postw(RegisterInfo *reg, uint64_t val64)
+{
+    efuse_key_crc_check(reg, val64,
+                        R_STATUS_AES_USER_KEY_1_CRC_PASS_MASK,
+                        R_STATUS_AES_USER_KEY_1_CRC_DONE_MASK,
+                        EFUSE_USER_KEY_1_START,
+                        EFUSE_USER_KEY_1_CRC_LK_MASK);
+}
+
+static uint64_t efuse_wr_lock_prew(RegisterInfo *reg, uint64_t val)
+{
+    return val != R_WR_LOCK_UNLOCK_PASSCODE;
+}
+
+static const RegisterAccessInfo efuse_ctrl_regs_info[] = {
+    {   .name = "WR_LOCK",  .addr = A_WR_LOCK,
+        .reset = 0x1,
+        .pre_write = efuse_wr_lock_prew,
+    },{ .name = "CFG",  .addr = A_CFG,
+        .rsvd = 0x9,
+    },{ .name = "STATUS",  .addr = A_STATUS,
+        .rsvd = 0x8,
+        .ro = 0xfff,
+    },{ .name = "EFUSE_PGM_ADDR",  .addr = A_EFUSE_PGM_ADDR,
+        .post_write = efuse_pgm_addr_postw,
+    },{ .name = "EFUSE_RD_ADDR",  .addr = A_EFUSE_RD_ADDR,
+        .rsvd = 0x1f,
+        .post_write = efuse_rd_addr_postw,
+    },{ .name = "EFUSE_RD_DATA",  .addr = A_EFUSE_RD_DATA,
+        .ro = 0xffffffff,
+    },{ .name = "TPGM",  .addr = A_TPGM,
+    },{ .name = "TRD",  .addr = A_TRD,
+        .reset = 0x19,
+    },{ .name = "TSU_H_PS",  .addr = A_TSU_H_PS,
+        .reset = 0xff,
+    },{ .name = "TSU_H_PS_CS",  .addr = A_TSU_H_PS_CS,
+        .reset = 0x11,
+    },{ .name = "TRDM",  .addr = A_TRDM,
+        .reset = 0x3a,
+    },{ .name = "TSU_H_CS",  .addr = A_TSU_H_CS,
+        .reset = 0x16,
+    },{ .name = "EFUSE_ISR",  .addr = A_EFUSE_ISR,
+        .rsvd = 0x7fff8000,
+        .w1c = 0x80007fff,
+        .post_write = efuse_isr_postw,
+    },{ .name = "EFUSE_IMR",  .addr = A_EFUSE_IMR,
+        .reset = 0x80007fff,
+        .rsvd = 0x7fff8000,
+        .ro = 0xffffffff,
+    },{ .name = "EFUSE_IER",  .addr = A_EFUSE_IER,
+        .rsvd = 0x7fff8000,
+        .pre_write = efuse_ier_prew,
+    },{ .name = "EFUSE_IDR",  .addr = A_EFUSE_IDR,
+        .rsvd = 0x7fff8000,
+        .pre_write = efuse_idr_prew,
+    },{ .name = "EFUSE_CACHE_LOAD",  .addr = A_EFUSE_CACHE_LOAD,
+        .pre_write = efuse_cache_load_prew,
+    },{ .name = "EFUSE_PGM_LOCK",  .addr = A_EFUSE_PGM_LOCK,
+        .pre_write = efuse_pgm_lock_prew,
+    },{ .name = "EFUSE_AES_CRC",  .addr = A_EFUSE_AES_CRC,
+        .post_write = efuse_aes_crc_postw,
+    },{ .name = "EFUSE_AES_USR_KEY0_CRC",  .addr = A_EFUSE_AES_USR_KEY0_CRC,
+        .post_write = efuse_aes_u0_crc_postw,
+    },{ .name = "EFUSE_AES_USR_KEY1_CRC",  .addr = A_EFUSE_AES_USR_KEY1_CRC,
+        .post_write = efuse_aes_u1_crc_postw,
+    },{ .name = "EFUSE_PD",  .addr = A_EFUSE_PD,
+        .ro = 0xfffffffe,
+    },{ .name = "EFUSE_ANLG_OSC_SW_1LP",  .addr = A_EFUSE_ANLG_OSC_SW_1LP,
+    },{ .name = "EFUSE_TEST_CTRL",  .addr = A_EFUSE_TEST_CTRL,
+        .reset = 0x8,
+    }
+};
+
+static void efuse_ctrl_reg_write(void *opaque, hwaddr addr,
+                                 uint64_t data, unsigned size)
+{
+    RegisterInfoArray *reg_array = opaque;
+    XlnxVersalEFuseCtrl *s;
+    Object *dev;
+
+    assert(reg_array != NULL);
+
+    dev = reg_array->mem.owner;
+    assert(dev);
+
+    s = XILINX_EFUSE_CTRL(dev);
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
+static void efuse_ctrl_register_reset(RegisterInfo *reg)
+{
+    if (!reg->data || !reg->access) {
+        return;
+    }
+
+    /* Reset must not trigger some registers' writers */
+    switch (reg->access->addr) {
+    case A_EFUSE_AES_CRC:
+    case A_EFUSE_AES_USR_KEY0_CRC:
+    case A_EFUSE_AES_USR_KEY1_CRC:
+        *(uint32_t *)reg->data = reg->access->reset;
+        return;
+    }
+
+    register_reset(reg);
+}
+
+static void efuse_ctrl_reset(DeviceState *dev)
+{
+    XlnxVersalEFuseCtrl *s = XILINX_EFUSE_CTRL(dev);
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        efuse_ctrl_register_reset(&s->regs_info[i]);
+    }
+
+    efuse_anchor_bits_check(s);
+    efuse_data_sync(s);
+    efuse_imr_update_irq(s);
+}
+
+static const MemoryRegionOps efuse_ctrl_ops = {
+    .read = register_read_memory,
+    .write = efuse_ctrl_reg_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static void efuse_ctrl_realize(DeviceState *dev, Error **errp)
+{
+    XlnxVersalEFuseCtrl *s = XILINX_EFUSE_CTRL(dev);
+    const char *prefix = object_get_canonical_path(OBJECT(dev));
+
+    if (!s->efuse) {
+        error_setg(&error_abort, "%s: XLN-EFUSE not connected", prefix);
+    }
+
+    /* Sort property-defined pgm-locks for bsearch lookup */
+    efuse_lk_spec_sort(s);
+}
+
+static void efuse_ctrl_init(Object *obj)
+{
+    XlnxVersalEFuseCtrl *s = XILINX_EFUSE_CTRL(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    RegisterInfoArray *reg_array;
+
+    memory_region_init(&s->iomem, obj, TYPE_XLNX_VERSAL_EFUSE_CTRL, R_MAX * 4);
+    reg_array =
+        register_init_block32(DEVICE(obj), efuse_ctrl_regs_info,
+                              ARRAY_SIZE(efuse_ctrl_regs_info),
+                              s->regs_info, s->regs,
+                              &efuse_ctrl_ops,
+                              XILINX_EFUSE_CTRL_ERR_DEBUG,
+                              R_MAX * 4);
+    memory_region_add_subregion(&s->iomem,
+                                0x0,
+                                &reg_array->mem);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq_efuse_imr);
+}
+
+static const VMStateDescription vmstate_efuse_ctrl = {
+    .name = TYPE_XLNX_VERSAL_EFUSE_CTRL,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, XlnxVersalEFuseCtrl, R_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static Property efuse_ctrl_props[] = {
+    DEFINE_PROP_LINK("efuse",
+                     XlnxVersalEFuseCtrl, efuse,
+                     TYPE_XLNX_EFUSE, XLNXEFuse *),
+    DEFINE_PROP_ARRAY("pg0-lock",
+                      XlnxVersalEFuseCtrl, extra_pg0_lock_n16,
+                      extra_pg0_lock.u16, qdev_prop_uint16, uint16_t),
+
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void efuse_ctrl_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = efuse_ctrl_reset;
+    dc->realize = efuse_ctrl_realize;
+    dc->vmsd = &vmstate_efuse_ctrl;
+    device_class_set_props(dc, efuse_ctrl_props);
+}
+
+static const TypeInfo efuse_ctrl_info = {
+    .name          = TYPE_XLNX_VERSAL_EFUSE_CTRL,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XlnxVersalEFuseCtrl),
+    .class_init    = efuse_ctrl_class_init,
+    .instance_init = efuse_ctrl_init,
+};
+
+static void efuse_ctrl_register_types(void)
+{
+    type_register_static(&efuse_ctrl_info);
+}
+
+type_init(efuse_ctrl_register_types)
+
+/*
+ * Retrieve a row, with unreadable bits returned as 0.
+ */
+uint32_t xlnx_versal_efuse_read_row(XLNXEFuse *efuse,
+                                    uint32_t bit, bool *denied)
+{
+    bool dummy;
+
+    if (!denied) {
+        denied = &dummy;
+    }
+
+    if (bit >= EFUSE_RD_BLOCKED_START && bit <= EFUSE_RD_BLOCKED_END) {
+        *denied = true;
+        return 0;
+    }
+
+    *denied = false;
+    return xlnx_efuse_get_row(efuse, bit);
+}
diff --git a/include/hw/nvram/xlnx-versal-efuse.h b/include/hw/nvram/xlnx-versal-efuse.h
new file mode 100644
index 0000000000..c4835cbe67
--- /dev/null
+++ b/include/hw/nvram/xlnx-versal-efuse.h
@@ -0,0 +1,62 @@
+/*
+ * Copyright (c) 2020 Xilinx Inc.
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
+#ifndef XLNX_VERSAL_PMC_EFUSE_H
+#define XLNX_VERSAL_PMC_EFUSE_H
+
+#include "qemu/osdep.h"
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+#include "hw/register.h"
+#include "hw/nvram/xlnx-efuse.h"
+
+#define TYPE_XLNX_VERSAL_EFUSE_CTRL  "xlnx,versal-efuse"
+#define TYPE_XLNX_VERSAL_EFUSE_CACHE "xlnx,pmc-efuse-cache"
+
+#define XLNX_VERSAL_EFUSE_CTRL_R_MAX ((0x100 / 4) + 1)
+
+typedef struct XlnxVersalEFuseCtrl {
+    SysBusDevice parent_obj;
+    MemoryRegion iomem;
+    qemu_irq irq_efuse_imr;
+
+    XLNXEFuse *efuse;
+
+    union {
+        uint16_t *u16;
+        XLNXEFuseLkSpec *spec;
+    } extra_pg0_lock;
+    uint32_t extra_pg0_lock_n16;
+
+    uint32_t regs[XLNX_VERSAL_EFUSE_CTRL_R_MAX];
+    RegisterInfo regs_info[XLNX_VERSAL_EFUSE_CTRL_R_MAX];
+} XlnxVersalEFuseCtrl;
+
+typedef struct XlnxVersalEFuseCache {
+    SysBusDevice parent_obj;
+    MemoryRegion iomem;
+
+    XLNXEFuse *efuse;
+} XlnxVersalEFuseCache;
+
+uint32_t xlnx_versal_efuse_read_row(XLNXEFuse *s, uint32_t bit, bool *denied);
+
+#endif
-- 
2.25.1


