Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18703BE867
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 14:53:43 +0200 (CEST)
Received: from localhost ([::1]:47412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m173f-0003Dm-2c
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 08:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.baluta@oss.nxp.com>)
 id 1m15uO-0006Jh-44; Wed, 07 Jul 2021 07:40:04 -0400
Received: from mail-eopbgr70052.outbound.protection.outlook.com
 ([40.107.7.52]:17390 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.baluta@oss.nxp.com>)
 id 1m15uK-0006tY-Od; Wed, 07 Jul 2021 07:40:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5CG6IZEEjY6EAgdSo7+LseHhpYRQv5Lrxbfvie2ADk8Hh+VHNzEH7Nd08R0ZSSw6DJb8cMU74vKMisoDrpEiGzxIK38save4qnDIyhJmcqqDFDHEQqb/fpHJ52Boe86G/MRjqZtAHQoQc0R0OMf/DEW9PS7nDk/BG3YAN7VxRMRN1gu+B8iLIQwTjYsCWtamVdX23yyv4zzut8CJkKj4VrEWE4Y7hLczcg8sKYiIJ6KscRyCx9cqC5OGlm4NMpdcEpHuysp39frBIYXi4MEBUCcWawTvK8oxtI8Gkyv4WD6O1QOHWIzaMagv2pOVM9KXUuMUVRtv8C4S4kEkAd9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yumNUEEawUO7yujwdkdPjG3KawrnRnLZH9GNBHwv74=;
 b=RG4Us1Dq8Um2GP8le2GJ51wtE/FfK/Z8w0PQu39JYmrCaEayzazEsRSwWZSLBCD+zz7aNGllyPWadq3rvrxhXn47cSMJlYhqb1L/d5sQCqi6xYaBQzWgnb7ajOZsu1/845xPxkhKegfWES1bTuNrxX5hg17lqYLAb+NnmL+lITeTI4mvs4eoKwnJJgTfcPJ6VjWAm/Q3+1mK/4kP1n/Lqz22U7ZcyC/M/ULK5yBHxUTsZVlIfBh62VxvgV7a9usjkfTH6Mu7v7dtdiyzqpB669Lpj+V6r5uDN556ScwI2cmzJUdWw9AURXtkNG5G8HpJckvftSj1psVhBUxXQFzszw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yumNUEEawUO7yujwdkdPjG3KawrnRnLZH9GNBHwv74=;
 b=bJAZjyKyvx3qpXAk3pENpyniZ0Uoq9tLAJgtnHH44rY0+eBeCAi7utVA0YDIaoxsAZPzv5DZvTqgW34klnO3XNOqR2GTG6792g8LwLbNN7qj2fMvZDDkJiSt7cKIisavqQ/UFDuBRAi9Ob0B/1Rk2A7b2clihRMFbFnlSoeuzzQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0402MB3664.eurprd04.prod.outlook.com (2603:10a6:803:1e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 11:39:53 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::693d:621d:666a:ac03]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::693d:621d:666a:ac03%6]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 11:39:53 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH] hw: timer: Add i.MX sysctr timer implementation
Date: Wed,  7 Jul 2021 14:39:37 +0300
Message-Id: <20210707113937.72602-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR01CA0132.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::37) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5901:c300:30d0:4026:5ebc:eb2d)
 by AM0PR01CA0132.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Wed, 7 Jul 2021 11:39:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73f63534-810b-489c-be05-08d9413bef9b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3664:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3664D248273A0D1C123949E9B81A9@VI1PR0402MB3664.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rX+FTgk3vEJYsf8WJpEPx5BRpOcqQZHvgZ7eqKKJzP40DscBmu6/jT8403fo2HxA/YfEUUsoGGX0TiSl0cwnCGUAfP0zV5pC5sB43RgSwymSPusl6l200GoroWRDyghHQL1LEFlss54xf59Ldb+zP4uZwKZbUpXCtBQUCXsVxZJcS8Usvo3InAZX2J9Yhk9+8V/6PRk+wsalG5VL7DSmIhxwBNlVSgJtoJz1WfCaZkbhbk3qiulwyrAUOt6Sea5ZZYyK8aR2E+ISAAahTYcmz4YnsTMBimCI+C8BSM3r5TRr2yVkcJFmcPY0Y1sCEOEQ0UHTTxIqOK0mh5nBcSMmAb6njP99w2m3uBgXSsiH7cQxDdczm1Em1JU6ljgJZvxQ0Q+EtYEj3PK4YoA/XK1MrA29bd/04ggq+KRWsT0Zz1V7ienxmRAqgzvqXdEMBUnlSjvUMjRtIrbAFbVlqC0uRek8zf+PNko8vGr/t2j05x9n4lFJHnG/VDlXsQQAG1wy6xyS5k7qbcuAVJs9QKDos0wEGrDNCrOse3CcBzS3NWBgaH3JeEMEZ7TtX60GCqG5FqZmrMOhFeFrl8Txt6dhIfyMC2tKMRQe/8k4bz1LyvDFaW1z5g5sF5M+Ohnwk3fYtgQxAMm7sEcRnHDLOobVIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(44832011)(38100700002)(83380400001)(86362001)(4326008)(66476007)(30864003)(8936002)(316002)(186003)(2906002)(6506007)(66556008)(66946007)(1076003)(6512007)(8676002)(52116002)(478600001)(2616005)(5660300002)(6666004)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amRtbkszd0h1b1UrUU96TFM0SHlSemVKRzJkK0ZydC8wU2NNNEV0elo0cFBi?=
 =?utf-8?B?UHZSWkhlb1FGU3MySlB1VTd2YW01V0JNZ1JhVGNvVFc3UHdKSU1IVC9QUGVY?=
 =?utf-8?B?RGFoNDdBQzJZaFRTMWVvd3VRQm1scHFNUEdQL2NhMi9MODdIUnFtUnkyVVJy?=
 =?utf-8?B?dVJtcDhOUjRqdWN5RDFySCtFb1gvT3NhT2wraDV3WjhqMzNwUVBDT0YrSzMr?=
 =?utf-8?B?aVh1Z01rKzlYOVBoK0x2cGdHYVNsNmVINEV1VnVsTzRXTVJacHkvNVdPNDRU?=
 =?utf-8?B?TTlyc0VmYmF2bnRaSisyMzVWRm9ZbCtVQ29ZdHZ2R09rZkRFSjA1YklTeEpp?=
 =?utf-8?B?d3Z1QmNaNlpBdDg5UWZ3RWtQcGpNWkdmS0U1TVhzMFhxa2pRc2NqV25iSTl0?=
 =?utf-8?B?SG0wN1RuYVp3Wi9QVEtZc3JhakFDeXJBWUxSVExOTkxhU2xkL0pZWllONG9E?=
 =?utf-8?B?TElQV1ora1ZUdThCLzVpWWVjd1BsOVR6SG5Hb3VlVFYyYmErdFJvWVhwQzhE?=
 =?utf-8?B?bkhSaXRMVnAzNGNIMEM4VElGc1U2OFFOdzNvaXlCdFhhc2NTdVcza1JzYXR6?=
 =?utf-8?B?bVlOWFpwcGwva2cxZ2FLckYrUG1xeEZUWVo2d0JRVStWWlhpQVliOVNwdlgx?=
 =?utf-8?B?TldXYmg4U0ljUGhaNmpXejFFT2syU0hJVjVCa1FSOXZ3OVpYZEx0TGUwcFZD?=
 =?utf-8?B?ejE4RW0zSlBnNGkvR0hkb1RrckNNa3ZJSmFtbXBRbkFXbXFmL1R1M1cwaWJE?=
 =?utf-8?B?eXFTTTNrU2I5Mkg1Rjl5UmFxM0N4VW1TSk01ZUx2bHZJVVF5YTZBcmx2M2sy?=
 =?utf-8?B?STN5RU15czFJMDZLWnVaN3hzWFU3R0d5bVZXeUdIMTQzTHI0TGZidDlYc3E5?=
 =?utf-8?B?OFhJVllDMUpLS2p4OEJjczJMWXpDUUhtYWR2bXIzVm5hM1h0U0hDTGpvRFEx?=
 =?utf-8?B?bjBRT0ltK0lCVmJFaXJ6aU1ZNHZBZXFhVUNtVzRZTndVUEFDZ2tCb0xOQnk4?=
 =?utf-8?B?WE1DR3oxdkh6K2UwM1J6M0VqdjZNRS9uN0svZThjbmNVdktUV0wzMGlzdklz?=
 =?utf-8?B?dmNxZ1RNTjNTMkRKTXZvZS9mVC9SOHVhMEJkNitjQVdUSWNzeDkydFVOVzNX?=
 =?utf-8?B?WmxDcWVnK1p5QVpXenVEQzRXd2NwWnZMVnl1TitlU0kvOFV6ODAveWIvVzBq?=
 =?utf-8?B?YVlMRVF3YTM0Sy9qMjNzM0NtTVN5azNCU3RrZHowalVjYnNsanFPVVRZdU1C?=
 =?utf-8?B?Tlp4VHYxZEN1MVQ5RjY0YTNibENRc2p3ZWp1NklGN2c0WFp1aG9MQklxTmpl?=
 =?utf-8?B?bmwwOWgxaHE0elNNY3Fta2pSdXBISGt5ekZlL01iVmgzTjI4eC9pMm1Kc05p?=
 =?utf-8?B?RzBOYXMyZTR2Mzd0QWtlblh2TUg5ZitCblFJL0lNeVdKTVhOZXhFMk9KZEZx?=
 =?utf-8?B?K0Fwb0toMnYwMVNFOXIrdkpDTmlhTWpmMWcxNmpnbXFQRHZVNHdTakJxdU1l?=
 =?utf-8?B?U2tqa2NBRHZPNE55OGQ5Sk45WERUM1hpV1lQbVdDOGFjOEhVeFlBVUx1Tyto?=
 =?utf-8?B?SVFrWGYrSnpkajJVc3lHSkNtUkIvYitidnU4bWVoZ01hVXhFY1l3TUcxakhn?=
 =?utf-8?B?M1pYVlFHQTYvVHF3VXp5YU9UQlZoT0hxZXZGU2VhL2w5UTV6U2JjRmNwbFRz?=
 =?utf-8?B?bjArLyt6MGxQUUtZUXljTmFxWlk2ekVlZjE4cEZ0bmJWNitsSndwanZjZU5h?=
 =?utf-8?B?ZXp5TlVWb082RVF6UUVCOWhJZHVMRXJ0UkJYZVh0TTl0NnRGMk5WTGxVK0Qw?=
 =?utf-8?B?emF1bm9RMXNwcmc3N3NSZkRaNTh3aENvL1RMeTNtMzFsQ2I5NC9KYUl1M2xZ?=
 =?utf-8?Q?z2ei1NuwuWOF9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f63534-810b-489c-be05-08d9413bef9b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 11:39:53.3790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZx+pDNLtUe6XiI84Z7rtiLUU6+1NjmltgiTq8KoYdilA7AMY2Kx82tLfYmEe2Kw/CobYy4BItWkXwHucHxrvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3664
Received-SPF: pass client-ip=40.107.7.52;
 envelope-from=daniel.baluta@oss.nxp.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 07 Jul 2021 08:49:00 -0400
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
Cc: vioricamancas@yahoo.com, daniel.baluta@gmail.com,
 Daniel Baluta <daniel.baluta@nxp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Viorica Mancas <vioricamancas@yahoo.com>

The System Counter (SYS_CTR) is a programmable system counter, which provides a
shared time base to multiple processors. It is intended for applications where the counter
is always powered on, and supports multiple unrelated clocks.

This system counter can be found on NXP i.MX8MN.

Signed-off-by: Viorica Mancas <vioricamancas@yahoo.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 hw/timer/imx_sysctr_timer.c         | 374 ++++++++++++++++++++++++++++
 hw/timer/meson.build                |   1 +
 include/hw/timer/imx_sysctr_timer.h |  84 +++++++
 3 files changed, 459 insertions(+)
 create mode 100644 hw/timer/imx_sysctr_timer.c
 create mode 100644 include/hw/timer/imx_sysctr_timer.h

diff --git a/hw/timer/imx_sysctr_timer.c b/hw/timer/imx_sysctr_timer.c
new file mode 100644
index 0000000000..728cde9c79
--- /dev/null
+++ b/hw/timer/imx_sysctr_timer.c
@@ -0,0 +1,374 @@
+/*
+ * QEMU NXP Sysctr Timer
+ *
+ * Author: Viorica Mancas <vioricamancas@yahoo.com>
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
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+#include "hw/ptimer.h"
+#include "hw/qdev-properties.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qom/object.h"
+#include "hw/timer/imx_sysctr_timer.h"
+
+#ifndef DEBUG_IMX_SYSCTR
+#define DEBUG_IMX_SYSCTR 0
+#endif
+
+#define DPRINTF(fmt, args...) \
+    do { \
+        if (DEBUG_IMX_SYSCTR) { \
+            fprintf(stderr, "[%s]%s: " fmt , TYPE_IMX_SYSCTR_TIMER, \
+                                             __func__, ##args); \
+        } \
+    } while (0)
+
+#define low(x) (x & 0xFFFFFFFFLL)
+#define high(x) (x >> 32)
+
+#define CLEAR_LOW_MASK (0xFFFFFFFFUL << 32)
+#define CLEAR_HIGH_MASK (0xFFFFFFFF)
+
+static const char *imx_sysctr_timer_reg_name(uint32_t reg);
+
+/* The system counter counts up and the ptimer counts down */
+static uint64_t imx_sysctr_update_count(IMXSysctrState *s)
+{
+    s->cnt = s->next_timeout - ptimer_get_count(s->timer);
+
+    return s->cnt;
+}
+
+static void imx_sysctr_update_int(IMXSysctrState *s)
+{
+    if (!(s->cmpcr & SYSCTR_CMPCR_IMASK) && (s->cmpcr & SYSCTR_CMPCR_EN)) {
+        qemu_irq_raise(s->irq);
+    } else {
+        qemu_irq_lower(s->irq);
+    }
+}
+
+/* Must be called from within ptimer_transaction_begin/commit block */
+static void imx_sysctr_compute_next_timeout(IMXSysctrState *s, bool event)
+{
+    uint64_t timeout = SYSCTR_TIMER_MAX;
+    uint64_t count;
+    uint64_t cmp_reg;
+    long long limit;
+
+    if (!(s->cmpcr & SYSCTR_CMPCR_EN)) {
+        /* if not enabled just return */
+        return;
+    }
+
+    /* update the count */
+    count = imx_sysctr_update_count(s);
+
+    if (event) {
+        /*
+         * This is an event (the ptimer reached 0 and stopped), and the
+         * timer counter is now equal to s->next_timeout.
+         * 
+         * The clock counts to overflow unless it is reset.
+         */
+        if (count == SYSCTR_TIMER_MAX) {
+            /* We reached SYSCTR_TIMER_MAX so we need to rollover */
+            count = s->cnt = s->next_timeout = 0;
+        }
+    }
+
+    /* now, find the next timeout related to count */
+    cmp_reg = s->cmpcv;
+    if ((count < cmp_reg) && (timeout > cmp_reg)) {
+        timeout = cmp_reg;
+    }
+
+    /* the new range to count down from */
+    limit = timeout - imx_sysctr_update_count(s);
+
+    if (limit < 0) {
+        /*
+         * if we reach here, then QEMU is running too slow and we pass the
+         * timeout limit while computing it. Let's deliver the interrupt
+         * and compute a new limit.
+         */
+        imx_sysctr_compute_next_timeout(s, true);
+
+        s->cmpcr |= SYSCTR_CMPCR_ISTAT;
+        /* send the irq */
+        imx_sysctr_update_int(s);
+    } else {
+        /* New timeout value */
+        s->next_timeout = timeout;
+
+        /* reset the limit to the computed range */
+        ptimer_set_limit(s->timer, limit, 1);
+    }
+}
+
+static void sysctr_compare_value_update(IMXSysctrState *s) {
+    ptimer_transaction_begin(s->timer);
+
+    /* compute the new timeout */
+    imx_sysctr_compute_next_timeout(s, false);
+    ptimer_transaction_commit(s->timer);
+}
+
+static uint64_t
+timer_read(void *opaque, hwaddr offset, unsigned int size)
+{
+    IMXSysctrState *s = IMX_SYSCTR_TIMER(opaque);
+    uint32_t reg_value = 0;
+
+    switch (offset) {
+    case CNTCV_LO: /* Counter Count Value Low Register */
+        imx_sysctr_update_count(s);
+        reg_value = low(s->cnt);
+        break;
+
+    case CNTCV_HI: /* Counter Count Value High Register */
+        imx_sysctr_update_count(s);
+        reg_value = high(s->cnt);
+        break;
+
+    case CMPCR: /* Compare Control Register 0*/
+        reg_value = s->cmpcr;
+        break;
+
+    case CMPCV_LO: /* Compare Count Value Low Register 0 */
+        reg_value = low(s->cmpcv);
+        break;
+
+    case CMPCV_HI: /* Compare Count Value High Register 0 */
+        reg_value = high(s->cmpcv);
+        break;
+    
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                  "Guest read from unimplemented/invalid register\n");
+        break;
+    }
+
+    DPRINTF("(%s) = 0x%08x\n", imx_sysctr_timer_reg_name(offset), reg_value);
+
+    return reg_value;
+}
+
+static void handle_control_register_update(IMXSysctrState *s, uint32_t oldreg)
+{
+    ptimer_transaction_begin(s->timer);
+
+    if (s->cmpcr & SYSCTR_CMPCR_EN) {
+        /* if enabled we want the timer to count until overflow */
+        s->next_timeout = SYSCTR_TIMER_MAX;
+        ptimer_set_count(s->timer, SYSCTR_TIMER_MAX);
+        /* update the cnt value */
+        imx_sysctr_compute_next_timeout(s, false);
+        ptimer_run(s->timer, 1);
+    } else {
+        /* Clearing the enable bit (EN=0) will clear the status bit
+        * (ISTAT=0) and will negate the interrupt output signal.
+        */
+        s->cmpcr &= ~SYSCTR_CMPCR_ISTAT;
+        qemu_irq_lower(s->irq);
+        /* stop timer */
+        ptimer_stop(s->timer);
+    }
+    ptimer_transaction_commit(s->timer);
+}
+
+static void
+timer_write(void *opaque, hwaddr offset,
+            uint64_t val64, unsigned int size)
+{
+    IMXSysctrState *s = IMX_SYSCTR_TIMER(opaque);
+    uint32_t value = val64, oldreg;
+  
+    switch (offset) {
+    case CNTCV_LO: /* Counter Count Value Low Register */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                  "Guest write to read only register\n");
+        break;
+
+    case CNTCV_HI: /* Counter Count Value High Register */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                  "Guest write to read only register\n");
+        break;
+
+    case CMPCR: /* Compare Control Register 0*/
+        oldreg = s->cmpcr;
+        /* the CMPCR_ISTAT bit is read only */
+        s->cmpcr &= ~CMPCR_WRITE;
+        s->cmpcr |= value & CMPCR_WRITE;
+
+        DPRINTF("the value of cmpcr is now: 0x%"PRIx32"\n", s->cmpcr);
+
+        handle_control_register_update(s, oldreg);
+        break;
+
+    case CMPCV_LO: /* Compare Count Value Low Register 0 */
+        s->cmpcv &= CLEAR_LOW_MASK;
+        s->cmpcv |= value;
+
+        DPRINTF("the value of cmpcv is now: 0x%"PRIx64"\n", s->cmpcv);
+
+        sysctr_compare_value_update(s);
+        break;
+
+    case CMPCV_HI: /* Compare Count Value High Register 0 */
+        s->cmpcv &= CLEAR_HIGH_MASK;
+        value &= 0x00FFFFFF;
+        s->cmpcv |= ((uint64_t) value) << 32;
+
+        DPRINTF("the value of cmpcv is now: 0x%"PRIx64"\n", s->cmpcv);
+
+        sysctr_compare_value_update(s);
+        break;
+    
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                  "Guest write to invalid register\n");
+        break;
+    }
+}
+
+static void imx_sysctr_timer_init(Object *obj)
+{
+    IMXSysctrState *t = IMX_SYSCTR_TIMER(obj);
+
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &t->irq);
+}
+
+static const MemoryRegionOps timer_ops = {
+    .read = timer_read,
+    .write = timer_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4
+    }
+};
+
+
+static void imx_sysctr_timeout(void *opaque)
+{
+    IMXSysctrState *s = IMX_SYSCTR_TIMER(opaque);
+
+    /* continue counting up */
+    imx_sysctr_compute_next_timeout(s, true);
+
+    s->cmpcr |= SYSCTR_CMPCR_ISTAT;
+    /* send the irq */
+    imx_sysctr_update_int(s);
+
+    if ((s->cmpcr & SYSCTR_CMPCR_EN)) {
+        ptimer_run(s->timer, 1);
+    }
+}
+
+static void imx_sysctr_timer_realize(DeviceState *dev, Error **errp)
+{
+    IMXSysctrState *s = IMX_SYSCTR_TIMER(dev);
+
+    memory_region_init_io(&s->iomem,
+                            OBJECT(s),
+                            &timer_ops,
+                            s,
+                            TYPE_IMX_SYSCTR_TIMER,
+                            0x20000);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
+
+    s->timer = ptimer_init(imx_sysctr_timeout, s, PTIMER_POLICY_DEFAULT);
+
+    /* the default freq is 24Mhz and divided by 3*/
+    ptimer_transaction_begin(s->timer);
+    ptimer_set_freq(s->timer, 24000000 / 3);
+    ptimer_transaction_commit(s->timer);
+}
+
+static void imx_sysctr_timer_reset(DeviceState *dev)
+{
+    IMXSysctrState *s = IMX_SYSCTR_TIMER(dev);
+
+    ptimer_transaction_begin(s->timer);
+    /* stop timer */
+    ptimer_stop(s->timer);
+    s->cmpcr = 0;
+    s->cmpcv = 0;
+    s->cnt = 0;
+
+    s->next_timeout = SYSCTR_TIMER_MAX;
+
+    ptimer_set_limit(s->timer, SYSCTR_TIMER_MAX, 1);
+
+    /* if the timer is still enabled, restart it */
+    if ((s->cmpcr & SYSCTR_CMPCR_EN)) {
+        ptimer_run(s->timer, 1);
+    }
+    ptimer_transaction_commit(s->timer);
+
+    DPRINTF("System counter was reset\n");
+
+}
+
+static void imx_sysctr_timer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = imx_sysctr_timer_realize;
+    dc->reset = imx_sysctr_timer_reset;
+}
+
+static const TypeInfo imx_sysctr_timer_info = {
+    .name          = TYPE_IMX_SYSCTR_TIMER,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(IMXSysctrState),
+    .instance_init = imx_sysctr_timer_init,
+    .class_init    = imx_sysctr_timer_class_init,
+};
+
+static void imx_sysctr_timer_register_types(void)
+{
+    type_register_static(&imx_sysctr_timer_info);
+}
+
+type_init(imx_sysctr_timer_register_types)
+
+static const char *imx_sysctr_timer_reg_name(uint32_t reg)
+{
+    switch (reg) {
+    case CMPCR:
+        return "CMPCR";
+    case CMPCV_LO:
+        return "CMPCV_LO";
+    case CMPCV_HI:
+        return "CMPCV_HI";
+    case CNTCV_HI:
+        return "CNTCV_HI";
+    case CNTCV_LO:
+        return "CNTCV_LO";
+    default:
+        return "[?]";
+    }
+}
\ No newline at end of file
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index 598d058506..b6cd52a0b1 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -19,6 +19,7 @@ softmmu_ss.add(when: 'CONFIG_HPET', if_true: files('hpet.c'))
 softmmu_ss.add(when: 'CONFIG_I8254', if_true: files('i8254_common.c', 'i8254.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_epit.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpt.c'))
+softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_sysctr_timer.c'))
 softmmu_ss.add(when: 'CONFIG_LM32_DEVICES', if_true: files('lm32_timer.c'))
 softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-sysctl.c'))
 softmmu_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gictimer.c'))
diff --git a/include/hw/timer/imx_sysctr_timer.h b/include/hw/timer/imx_sysctr_timer.h
new file mode 100644
index 0000000000..c36ae9b393
--- /dev/null
+++ b/include/hw/timer/imx_sysctr_timer.h
@@ -0,0 +1,84 @@
+/*
+ * QEMU NXP Sysctr Timer
+ *
+ * Author: Viorica Mancas <vioricamancas@yahoo.com>
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
+#ifndef IMX_SYSCTR_H
+#define IMX_SYSCTR_H
+
+#include "hw/sysbus.h"
+#include "hw/ptimer.h"
+#include "hw/misc/imx_ccm.h"
+#include "qom/object.h"
+
+/*
+ * sysctr : System counter
+ *
+ * The System Counter inputs two counter clock sources and outputs a counter
+ * value and interrupt signals (one per compare frame) to the platform’s
+ * interrupt controller.
+ */
+
+/* The counter in the timer is 56 bits (first 8 are 0) */
+#define SYSCTR_TIMER_MAX  0X00FFFFFFFFFFFFFFUL
+
+/* addresses */
+#define CMP_OFFSET	0x10000
+
+#define CNTCV_LO	0x8
+#define CNTCV_HI	0xc
+#define CMPCV_LO	(CMP_OFFSET + 0x20)
+#define CMPCV_HI	(CMP_OFFSET + 0x24)
+#define CMPCR		(CMP_OFFSET + 0x2c)
+
+/* Control register.  Not all of these bits have any effect (yet) */
+#define SYSCTR_CMPCR_EN        (1 << 0)  /*  Enable */
+#define SYSCTR_CMPCR_IMASK     (1 << 1)  /*  Enable */
+#define SYSCTR_CMPCR_ISTAT     (1 << 2)  /*  Compare (interrupt) status (read only) */
+/* interupt condition: ISTAT = (CNTCV >= CMPCV) */
+
+#define CMPCR_WRITE (SYSCTR_CMPCR_IMASK | SYSCTR_CMPCR_EN)
+
+#define TYPE_IMX_SYSCTR_TIMER "imx.sysctr-timer"
+
+typedef struct IMXSysctrState IMXSysctrState;
+DECLARE_INSTANCE_CHECKER(IMXSysctrState, IMX_SYSCTR_TIMER,
+                         TYPE_IMX_SYSCTR_TIMER)
+
+struct IMXSysctrState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    ptimer_state *timer;
+    MemoryRegion  iomem;
+    
+    qemu_irq irq;
+
+    uint32_t cmpcr; /* Compare Control Register */
+    uint64_t cnt;   /* Counter on 56 bits */
+    uint64_t cmpcv; /* Compare Count Value */
+
+    uint64_t next_timeout;
+};
+
+#endif /* IMX_SYSCTR_H */
-- 
2.20.1


