Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2334448DD89
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 19:16:44 +0100 (CET)
Received: from localhost ([::1]:57598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n84eQ-0002oN-Oq
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 13:16:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n84Yk-0000Fg-2r
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 13:10:50 -0500
Received: from [2a01:111:f403:7010::70d] (port=45377
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n84Yf-0001eJ-Pk
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 13:10:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdRRjeMCoIYt4kh6rpIN3uY0+qiLp5cZRNu8D6MG9qGqwRqWgS5UrVmVz6qWeFsoEN1FtmoFdAohkSTFhnKHpdjfDqcwSrsGCL0INcbaeyjJLsTOzLtGZfqiJJdLCxTy4nLpX9nuRbZznKstMRFWXmLIKDOTmupd2HwK530LeKho6eV/Mi//1x3OAJ9vI0D7TbpnHe89u6WoIOwQK4i+9odM6YRFgTXbcBwhxSr/B0Tez9twplJ2hxAIh1DtG34YG3FUfGMLfmFlv87LxUYzNpszw/PxpoqKcNiBIWzoFfCBzMgrMek2Zqr7IdE11QT8qMgNbXvkHaYJnM3Z8s2jxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MI/7ECuG7zTs81R9Hkh85f9e8IjioqOyLL4eaMNKOIA=;
 b=DOAsZMoy+zZVSMf7ykaFbg1cW3mvgnvvoZygXoajRVdtcMa9TU/RFn0KTSm9JF9RaeJ0/pS3iLy9FxbTt1Z4h9++onTMdDPH0J3IkaQuCSRVCac1q4dO1NZUSFoziDf2jhB4fxQVEu3DC0vCEZqde9hRwDW9uJOiqpMPqy7H30MDwIRN7kEVHvqtyQpSWjK061QCRF3kmtVuiDM5P5vMcdE/dNby7o8/IUhhJoy8pDsb/u1TD9qHaccE2ss+OL0CHobmPKx56wMBT3GMccHUdv5j4McaXgfli/cZhBYJ/Br7t+qxt5N5eFuscoIE5hw1F9Zx0e/Uc0PHkC3IssNsQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MI/7ECuG7zTs81R9Hkh85f9e8IjioqOyLL4eaMNKOIA=;
 b=P6UHta5nMCPULDbAlmD/Pe43ze97x1dFTGq6uepDpeJ9SaD9c932I6152qpk196GDKw/b+GDc/nAOlsNupA3/uOs5SE0L7v4OvzSy/FXjU3FP44sk2BQg9EPe3EfXVes5TeZidKCXqhJqPnK/Mxdio5lq6NDj48gRN/XD/6hUQg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OSZP286MB1166.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:13b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9; Thu, 13 Jan 2022 18:10:07 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%8]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 18:10:07 +0000
Date: Fri, 14 Jan 2022 02:10:04 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/6] hw/usb: Add CanoKey Implementation
Message-ID: <YeBq/AaUw0INDPTt@Sun>
References: <YeBqg2AmIVYkrJcD@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YeBqg2AmIVYkrJcD@Sun>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.5 (2021-12-30)
X-ClientProxiedBy: HK2PR04CA0060.apcprd04.prod.outlook.com
 (2603:1096:202:14::28) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4717eee8-3812-4ddc-ad34-08d9d6bfee0b
X-MS-TrafficTypeDiagnostic: OSZP286MB1166:EE_
X-Microsoft-Antispam-PRVS: <OSZP286MB1166A2C44BDE24D6ADA19573BC539@OSZP286MB1166.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0SGtEAlxD/jU16lGKxh2xLfdhuR3ynCvZY1r8Lx4SrS0myX0P1P2hADLCyWBNiBSeGcF1hcgqC8fX8ZFOzp3RkUMa0QV2iDbRjDi90Er63kqxm4s04Hf+dslpJTHvY9J9j+j6LeqfTQNSwIz/qQWZ3C/+JACgOo9vYQDeMJ0GMqGnSA/h63UW/PJqhUvU61hdhMr/GONsCQYqrA4t2/U+5j/HbNm8QU7vOjNxach1/885HtABYPlQYPAoFdDafxOoot/Ju0ELxMR75v9goop7Yn8WJprNvg/9hp39Ug8l/pf3VZwQxAygYn1RBmx5//A0W6Ja4wtUlhrlvy7hQ31kC1+jm4L3H+HUjMq0OM1LeU9bTjLb8Sk7Od4mz2/CRz3gnfx9iXYzybMIE93R3Oo2j/dZ0ncYkrWj6H+lo6Pu1KxUE0PM68VUnsRWk77Rk3h4TupkOnLFjomNAETBG7CINmgeRiS4JMb2UuowbOYqx19feGGa+H8QQ/D/DAb2liOR4Z8v0u0of5ohkRnS4TojNkFaFJ4rp9YMiET7DU0aLF4Ie/PzuO33UDhR/66MGz3Al0+owGMVYlOZvz4pVt4LuxzjxID5nwGiOUJjiiUNi+2UEVzNs/u/1FmUKkh1Pr6LoJzviJ4TzKRpMUgJd+uTlxpeHNA7YomXklUoyomVAE1pSZPRsnWgUNQPowD/VH/WN5xDt4CnQ/k1rlZe0YGa/c8eiLHVgToDeivXw+aKhAv0pNws3zu0hzwJqTuCDcXS7+KRX0mPGSbEVom+4I5Og==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(396003)(346002)(39830400003)(366004)(136003)(376002)(6486002)(54906003)(8676002)(6666004)(186003)(4326008)(52116002)(30864003)(966005)(5660300002)(8936002)(6506007)(2906002)(38100700002)(66946007)(66556008)(66476007)(316002)(9686003)(6916009)(6512007)(86362001)(508600001)(33716001)(786003)(83380400001)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5/2UB8qRMK+3qKOVnTbiYJvqrv0cq++BP+c9TX0eEjKewAO488TzoQmGvwwo?=
 =?us-ascii?Q?YMBPXo9Da5XD4Izk5SyK5YLedwXJb1GMsJOfwgqubabqLLKDXhPwMcqKqdnx?=
 =?us-ascii?Q?rjYMCgSoLfGbKSgJkMUgvwaKyF9qd19nk5mfbRZo4HfGIN4akGwCyWlK/Hyq?=
 =?us-ascii?Q?pW8n82SrDvw3z+8HNbSSRHhs7c8KhqrohJa45RkCfULSjxPIQXIC8zhWv40Z?=
 =?us-ascii?Q?TuwZcR+keQnBxKC1TTWWeqE22yp1/KzSoajbC+4o82RiLZDAU3hfjGpb4sz8?=
 =?us-ascii?Q?MZDn0hbUDYOloH16PeeclnNrSgMvUM1dGHSU5dNuGEDE5nWbPa29+UO2jj3c?=
 =?us-ascii?Q?VjkWC2hjezOVto/0pqVkNHrHYz+I8N4lO/YtxrWZuDBBEXrtxHJhW+ZK8tJ9?=
 =?us-ascii?Q?0DYG10rb5PA1oEoMuuLKo3hX562+017KJkY33wpi/tBnryWnVORCfaYVDZ5Y?=
 =?us-ascii?Q?FNtpJoAUDh9GdBoVgyIxM+oNnU5nzM7huQY6s96KL+CQNewS6V0zELa68lGr?=
 =?us-ascii?Q?Al5iHcmHtUBAljd5uTPUe8QabOGTlmald/vUjmUdzrIzWzOdfsMGl1p/9KVy?=
 =?us-ascii?Q?+a1KOXGZOehQuJhJ+SoqCaOJCetrzHJZORqIMKNWeG14v9EozBTap8rm6kuH?=
 =?us-ascii?Q?gPlsNeqsyyMht5gZ/Nc1E7pTsi0PzUvGwfnmqLexpnzIyuETGIplxuD9FGzk?=
 =?us-ascii?Q?PnQPBi96kpwxgTN7tXDIcsXgxWez/EcsVWSJhvsEff+/rIXeWwqsyMm6O7F7?=
 =?us-ascii?Q?OL3sakAppkZKNeiDCfbpETV35dk78yn8aWs4VXu+y/7sGHY8YSCQu54keVi3?=
 =?us-ascii?Q?vJHvlYpJMb5ITIBzrXcNcIRMT57sP8O+UCw4yQNG+sTvzN8r+rMOYMQpNtCs?=
 =?us-ascii?Q?tkNmSl4SG55ZxlXuVyLuamM+eMtzvXW6XNWVqtXrPkc6q7uFNklKL/Ufcc3g?=
 =?us-ascii?Q?Gal3HL4wnlS/KhbA6Pm7PFOjlNrEhtS8vIkPp6yyAgdQ4CcBLvR8qZbl5c99?=
 =?us-ascii?Q?lTiMHn1FbLQh+DeCgI/msKi41/uqfGRlHRFka1xjam2Sh3w5U3FDuKKZRe1F?=
 =?us-ascii?Q?jY9IVZO+Gn7TCwn1paoy6ArlsqbihiK5QqfBiScddWsFZKE9azwFbkg3efiN?=
 =?us-ascii?Q?hv6bfDno9sWKDA5OqjA2mtNTxMcFSFctWkxv/CtrJ6P29wFkzEFJCPBkTQzE?=
 =?us-ascii?Q?GOyytgMX2HawT284lzovQKgkT7A/AuSBkgTNHy0075y3OYP//MO26ukJnevF?=
 =?us-ascii?Q?aqjxR1ldYy3OGXI4w//PM6X5pTC5OZpQ6bMQNFeHLDGgkrKpN48xJ6dHkHd5?=
 =?us-ascii?Q?C+cs+SHjhoWn4ZgxpCBcOpqdU2U/Dq1j3jVPnQuCKZJbQ1XN1wPR2AdhKAwP?=
 =?us-ascii?Q?y4MorC7rGyy3LrNfGHRWjh30aXpg5HhXVKYQyoPh5SXhfvJXc/GCv8E70nLE?=
 =?us-ascii?Q?FmQRCCZ5kD6AEtU8Tu1G8qzWP2kx7OaxkEIwC0IkZ1uxomRvTguILx4s2uJ+?=
 =?us-ascii?Q?1p4ujnVVu5z8oqeVtLehrXwvEnRaMwtSMyc+DnvHIWMgP+eD6kinzBxpXo5J?=
 =?us-ascii?Q?YuTL6NQvAmWzwwStERCUtmCNTi79ay79796sYdVZ?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 4717eee8-3812-4ddc-ad34-08d9d6bfee0b
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 18:10:07.2038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65na32Mgq9aoUZGrc+q/tqYIcqnyqrjtm1gt6m60ALtLq3G9vcYagq3mRm0KSW4w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB1166
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:7010::70d
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:7010::70d;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 contact@canokeys.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit added a new emulated device called CanoKey to QEMU.

CanoKey implements platform independent features in canokey-core
https://github.com/canokeys/canokey-core, and leaves the USB implementation
to the platform.

In this commit the USB part was implemented in QEMU using QEMU's USB APIs,
therefore the emulated CanoKey can communicate with the guest OS using USB.

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 hw/usb/canokey.c | 326 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/usb/canokey.h |  60 +++++++++
 2 files changed, 386 insertions(+)
 create mode 100644 hw/usb/canokey.c
 create mode 100644 hw/usb/canokey.h

diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
new file mode 100644
index 0000000000..6bd4dedfd2
--- /dev/null
+++ b/hw/usb/canokey.c
@@ -0,0 +1,326 @@
+/*
+ * CanoKey QEMU device implementation.
+ *
+ * Copyright (c) 2021-2022 Canokeys.org <contact@canokeys.org>
+ * Written by Hongren (Zenithal) Zheng <i@zenithal.me>
+ *
+ * This code is licensed under the Apache-2.0.
+ */
+
+#include "qemu/osdep.h"
+#include <canokey-qemu.h>
+
+#include "qemu/module.h"
+#include "qemu/thread.h"
+#include "qemu/main-loop.h"
+#include "qapi/error.h"
+#include "hw/usb.h"
+#include "hw/qdev-properties.h"
+#include "desc.h"
+#include "canokey.h"
+
+#define CANOKEY_EP_IN(ep) ((ep) & 0x7F)
+
+#define CANOKEY_VENDOR_NUM     0x20a0
+#define CANOKEY_PRODUCT_NUM    0x42d2
+
+/*
+ * placeholder, canokey-qemu implements its own usb desc
+ * Namely we do not use usb_desc_handle_contorl
+ */
+enum {
+    STR_MANUFACTURER = 1,
+    STR_PRODUCT,
+    STR_SERIALNUMBER
+};
+
+static const USBDescStrings desc_strings = {
+    [STR_MANUFACTURER]     = "canokeys.org",
+    [STR_PRODUCT]          = "CanoKey QEMU",
+    [STR_SERIALNUMBER]     = "0"
+};
+
+static const USBDescDevice desc_device_canokey = {
+    .bcdUSB                        = 0x0,
+    .bMaxPacketSize0               = 16,
+    .bNumConfigurations            = 0,
+    .confs = NULL,
+};
+
+static const USBDesc desc_canokey = {
+    .id = {
+        .idVendor          = CANOKEY_VENDOR_NUM,
+        .idProduct         = CANOKEY_PRODUCT_NUM,
+        .bcdDevice         = 0x0100,
+        .iManufacturer     = STR_MANUFACTURER,
+        .iProduct          = STR_PRODUCT,
+        .iSerialNumber     = STR_SERIALNUMBER,
+    },
+    .full = &desc_device_canokey,
+    .str  = desc_strings,
+};
+
+
+/* Implement canokey-qemu functions */
+int canokey_emu_stall_ep(void *base, uint8_t ep)
+{
+    CanoKeyState *key = base;
+    uint8_t ep_in = CANOKEY_EP_IN(ep); /* INTR IN has ep 129 */
+    qemu_mutex_lock(&key->ep_in_mutex[ep_in]);
+    key->ep_in_size[ep_in] = 0;
+    key->ep_in_status[ep_in] = CANOKEY_EP_IN_STALL;
+    qemu_mutex_unlock(&key->ep_in_mutex[ep_in]);
+    return 0;
+}
+
+int canokey_emu_set_address(void *base, uint8_t addr)
+{
+    CanoKeyState *key = base;
+    key->dev.addr = addr;
+    return 0;
+}
+
+int canokey_emu_prepare_receive(
+        void *base, uint8_t ep, uint8_t *pbuf, uint16_t size)
+{
+    CanoKeyState *key = base;
+    /*
+     * No mutex here because it is usually called by
+     * canokey_emu_data_out (qemu thread), which already has mutex
+     */
+    key->ep_out[ep] = pbuf;
+    key->ep_out_size[ep] = size;
+    return 0;
+}
+
+int canokey_emu_transmit(
+        void *base, uint8_t ep, const uint8_t *pbuf, uint16_t size)
+{
+    CanoKeyState *key = base;
+    uint8_t ep_in = CANOKEY_EP_IN(ep); /* INTR IN has ep 129 */
+    qemu_mutex_lock(&key->ep_in_mutex[ep_in]);
+    memcpy(key->ep_in[ep_in], pbuf, size);
+    key->ep_in_size[ep_in] = size;
+    key->ep_in_status[ep_in] = CANOKEY_EP_IN_READY;
+    qemu_mutex_unlock(&key->ep_in_mutex[ep_in]);
+    return 0;
+}
+
+uint32_t canokey_emu_get_rx_data_size(void *base, uint8_t ep)
+{
+    CanoKeyState *key = base;
+    return key->ep_out_size[ep];
+}
+
+static void *canokey_thread(void *arg)
+{
+    CanoKeyState *key = arg;
+
+    while (true) {
+        /* Wait signal */
+        qemu_mutex_lock(&key->key_mutex);
+        qemu_cond_wait(&key->key_cond, &key->key_mutex);
+        qemu_mutex_unlock(&key->key_mutex);
+
+        /* Exit thread check */
+        if (key->stop_thread) {
+            key->stop_thread = false;
+            break;
+        }
+
+        canokey_emu_device_loop();
+    }
+    return NULL;
+}
+
+static void canokey_handle_reset(USBDevice *dev)
+{
+    CanoKeyState *key = CANOKEY(dev);
+    for (int i = 0; i != CANOKEY_EP_NUM; ++i) {
+        key->ep_in_status[i] = CANOKEY_EP_IN_WAIT;
+        key->ep_in_pos[i] = 0;
+    }
+    canokey_emu_reset();
+}
+
+static void canokey_handle_control(USBDevice *dev, USBPacket *p,
+               int request, int value, int index, int length, uint8_t *data)
+{
+    CanoKeyState *key = CANOKEY(dev);
+
+    canokey_emu_setup(request, value, index, length);
+    qemu_cond_signal(&key->key_cond);
+
+    uint8_t ep_in = CANOKEY_EP_IN(p->ep->nr);
+    uint32_t dir_in = request & DeviceRequest;
+    if (!dir_in) {
+        /* OUT */
+        qemu_mutex_lock(&key->key_mutex);
+        if (key->ep_out[0] != NULL) {
+            memcpy(key->ep_out[0], data, length);
+        }
+        canokey_emu_data_out(p->ep->nr, data);
+        qemu_cond_signal(&key->key_cond);
+        qemu_mutex_unlock(&key->key_mutex);
+    }
+
+    /* IN */
+    qemu_mutex_lock(&key->ep_in_mutex[ep_in]);
+    if (key->ep_in_status[ep_in] == CANOKEY_EP_IN_WAIT) {
+        p->status = USB_RET_NAK;
+        qemu_mutex_unlock(&key->ep_in_mutex[ep_in]);
+        return;
+    }
+    if (key->ep_in_status[ep_in] == CANOKEY_EP_IN_STALL) {
+        p->status = USB_RET_STALL;
+    }
+    key->ep_in_status[ep_in] = CANOKEY_EP_IN_WAIT;
+    memcpy(data, key->ep_in[ep_in], key->ep_in_size[ep_in]);
+    p->actual_length = key->ep_in_size[ep_in];
+
+    qemu_mutex_unlock(&key->ep_in_mutex[ep_in]);
+}
+
+static void canokey_handle_data(USBDevice *dev, USBPacket *p)
+{
+    CanoKeyState *key = CANOKEY(dev);
+
+    uint8_t ep_in = CANOKEY_EP_IN(p->ep->nr);
+    uint8_t ep_out = p->ep->nr;
+    uint32_t in_len;
+    switch (p->pid) {
+    case USB_TOKEN_OUT:
+        qemu_mutex_lock(&key->key_mutex);
+        if (p->iov.size > key->ep_out_size[ep_out]) {
+            /* unlikely we will reach here, but check still needed */
+            p->status = USB_RET_NAK;
+            qemu_mutex_unlock(&key->key_mutex);
+            break;
+        }
+        usb_packet_copy(p, key->ep_out[ep_out], p->iov.size);
+        key->ep_out_size[ep_out] = p->iov.size;
+        canokey_emu_data_out(ep_out, NULL);
+        qemu_cond_signal(&key->key_cond);
+        qemu_mutex_unlock(&key->key_mutex);
+        break;
+    case USB_TOKEN_IN:
+        qemu_mutex_lock(&key->ep_in_mutex[ep_in]);
+        if (key->ep_in_pos[ep_in] == 0) {
+            canokey_emu_data_in(ep_in);
+            qemu_cond_signal(&key->key_cond);
+            if (key->ep_in_status[ep_in] == CANOKEY_EP_IN_WAIT) {
+                p->status = USB_RET_NAK;
+                qemu_mutex_unlock(&key->ep_in_mutex[ep_in]);
+                break;
+            }
+            if (key->ep_in_status[ep_in] == CANOKEY_EP_IN_STALL) {
+                p->status = USB_RET_STALL;
+            }
+            key->ep_in_status[ep_in] = CANOKEY_EP_IN_WAIT;
+
+            in_len = MIN(key->ep_in_size[ep_in], p->iov.size);
+            usb_packet_copy(p, key->ep_in[ep_in], in_len);
+            if (in_len < key->ep_in_size[ep_in]) {
+                key->ep_in_pos[ep_in] = in_len;
+            }
+        } else {
+            in_len = MIN(key->ep_in_size[ep_in] - key->ep_in_pos[ep_in],
+                        p->iov.size);
+            usb_packet_copy(p,
+                    key->ep_in[ep_in] + key->ep_in_pos[ep_in], in_len);
+            key->ep_in_pos[ep_in] += in_len;
+            if (key->ep_in_pos[ep_in] == key->ep_in_size[ep_in]) {
+                key->ep_in_pos[ep_in] = 0;
+            }
+        }
+        qemu_mutex_unlock(&key->ep_in_mutex[ep_in]);
+        break;
+    default:
+        p->status = USB_RET_STALL;
+        break;
+    }
+}
+
+static void canokey_realize(USBDevice *base, Error **errp)
+{
+    CanoKeyState *key = CANOKEY(base);
+
+    if (key->file == NULL) {
+        error_setg(errp, "You must provide file=/path/to/canokey-file");
+        return;
+    }
+
+    usb_desc_init(base);
+
+    /* Synchronization */
+    qemu_cond_init(&key->key_cond);
+    qemu_mutex_init(&key->key_mutex);
+    for (int i = 0; i != CANOKEY_EP_NUM; ++i) {
+        qemu_mutex_init(&key->ep_in_mutex[i]);
+        key->ep_in_status[i] = CANOKEY_EP_IN_WAIT;
+        key->ep_in_pos[i] = 0;
+    }
+
+    if (canokey_emu_init(key, key->file)) {
+        error_setg(errp, "canokey can not create or read %s", key->file);
+        return;
+    }
+
+    /* Thread */
+    key->stop_thread = false;
+    qemu_thread_create(&key->key_thread, "canokey", canokey_thread,
+                       key, QEMU_THREAD_JOINABLE);
+}
+
+static void canokey_unrealize(USBDevice *base)
+{
+    CanoKeyState *key = CANOKEY(base);
+
+    /* Thread */
+    key->stop_thread = true;
+    qemu_cond_signal(&key->key_cond);
+    qemu_thread_join(&key->key_thread);
+
+    /* Synchronization */
+    qemu_cond_destroy(&key->key_cond);
+    qemu_mutex_destroy(&key->key_mutex);
+    for (int i = 0; i != CANOKEY_EP_NUM; ++i) {
+        qemu_mutex_destroy(&key->ep_in_mutex[i]);
+    }
+}
+
+static Property canokey_properties[] = {
+    DEFINE_PROP_STRING("file", CanoKeyState, file),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void canokey_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    USBDeviceClass *uc = USB_DEVICE_CLASS(klass);
+
+    uc->product_desc   = "CanoKey QEMU";
+    uc->usb_desc       = &desc_canokey;
+    uc->handle_reset   = canokey_handle_reset;
+    uc->handle_control = canokey_handle_control;
+    uc->handle_data    = canokey_handle_data;
+    uc->handle_attach  = usb_desc_attach;
+    uc->realize        = canokey_realize;
+    uc->unrealize      = canokey_unrealize;
+    dc->desc           = "CanoKey QEMU";
+    device_class_set_props(dc, canokey_properties);
+}
+
+static const TypeInfo canokey_info = {
+    .name = TYPE_CANOKEY,
+    .parent = TYPE_USB_DEVICE,
+    .instance_size = sizeof(CanoKeyState),
+    .class_init = canokey_class_init
+};
+
+static void canokey_register_types(void)
+{
+    type_register_static(&canokey_info);
+}
+
+type_init(canokey_register_types)
diff --git a/hw/usb/canokey.h b/hw/usb/canokey.h
new file mode 100644
index 0000000000..d17648fff6
--- /dev/null
+++ b/hw/usb/canokey.h
@@ -0,0 +1,60 @@
+/*
+ * CanoKey QEMU device header.
+ *
+ * Copyright (c) 2021-2022 Canokeys.org <contact@canokeys.org>
+ * Written by Hongren (Zenithal) Zheng <i@zenithal.me>
+ *
+ * This code is licensed under the Apache-2.0.
+ */
+
+#ifndef CANOKEY_H
+#define CANOKEY_H
+
+#include "hw/qdev-core.h"
+
+#define TYPE_CANOKEY "canokey"
+#define CANOKEY(obj) \
+    OBJECT_CHECK(CanoKeyState, (obj), TYPE_CANOKEY)
+
+/*
+ * State of the Canokey (i.e. hw/canokey.c)
+ */
+
+/* CTRL INTR BULK */
+#define CANOKEY_EP_NUM 3
+/* BULK IN CAN BE UP TO 500 bytes */
+#define CANOKEY_EP_IN_BUFFER_SIZE 1024
+
+typedef enum {
+    CANOKEY_EP_IN_WAIT,
+    CANOKEY_EP_IN_READY,
+    CANOKEY_EP_IN_STALL
+} CanoKeyEPStatus;
+
+typedef struct CanoKeyState {
+    USBDevice dev;
+    uint8_t idle;
+
+    /* IN packets from canokey device loop */
+    uint8_t ep_in[CANOKEY_EP_NUM][CANOKEY_EP_IN_BUFFER_SIZE];
+    /* for IN larger than p->iov.size, we would do multiple handle_data() */
+    uint32_t ep_in_pos[CANOKEY_EP_NUM];
+    uint32_t ep_in_size[CANOKEY_EP_NUM];
+    CanoKeyEPStatus ep_in_status[CANOKEY_EP_NUM];
+    QemuMutex ep_in_mutex[CANOKEY_EP_NUM];
+
+    /* OUT pointer to canokey recv buffer */
+    uint8_t *ep_out[CANOKEY_EP_NUM];
+    uint32_t ep_out_size[CANOKEY_EP_NUM];
+
+    /* Properties */
+    char *file; /* canokey-file */
+
+    /* Emulation thread and sync */
+    QemuCond key_cond;
+    QemuMutex key_mutex;
+    QemuThread key_thread;
+    bool stop_thread;
+} CanoKeyState;
+
+#endif /* CANOKEY_H */
-- 
2.34.1


