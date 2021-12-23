Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B502F47E913
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 22:28:57 +0100 (CET)
Received: from localhost ([::1]:51932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Vdw-0007qh-N8
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 16:28:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n0RuW-0005LF-9T
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 12:29:48 -0500
Received: from [2a01:111:f403:7010::72a] (port=36112
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n0RuS-0007of-Ds
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 12:29:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLOpoPzMhWzz9brJwntT/524E3LWiLEM4K4T2aXSSAz+YByhmFk++YRmvucmGaS3xeF3tJUW3FnA3nnP2Bvl/O3ZKqV8JfzrX0RIH0Qov5/c1AsbVxdYFyd2AbpRoa8/AQTGtB0+dBYJvwkUtUrD6TVsUjFjqCQYVnqhU8n3y9A8Tq9mld90iHl8jscCKNNNZiK9ZgK97/vy+0kcaPCiQkQ01UMPYjB7s7/dCNfqg11W2vmiu4yJv2zFtHM5ksWrR/z9rnHiTZGKMy0C+FAt0tfldtbbJ6hr/WPesnI9Z5VYWS4V/0BmImNEkJrZMWfj5MmGtzEDDTAhC03+GjUPPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0GjECwp11sMeEzPd2899czPODJclwvIqXPc7WvHciU=;
 b=GiSQlb+qTmVRbfP7o7jcrvvBamb7wmq7jTW13RFzAFruMavLwzjwHf/GkOFssfoRJ3rfv5TMFC+qyHUIbr675rF/AjJivpyC00pp5oqySVjWb1iR0u1w773HB3wxCKj6UuBP6A3XxXsos1J9+Hhx/c7HQZmkqn+7FiezvYXD4L1yDSUl3K5r+H5BTHw44K83pQ/WiNgm+1eBBuZkmK9/IhU3W2pC9JNAMe9K1XeKRUFkqi3Jvdi3CJm8Ca0Ljn85DBC7H2qAMivBmfu0t63FHlEjdj7hmQHnLOaMOpaVH9CMesBJ14x+fTvWr+/ShgQw4gIP9NDUmEg6QmR8XJK12w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0GjECwp11sMeEzPd2899czPODJclwvIqXPc7WvHciU=;
 b=hz+0SzAP8hmjGpi8sP+Eyh7pc9183wzNeAXXnWBBg5cybFZmO/X7veuN5bAZsTF3F+RNQvUNfA0QBqrieQwJGNzvKGvDC0KuAAZLp2SSTkPXPk2NtUNKCCSyfycefMOgeJ/nU1uXq4J8jdtW0j2KYjcRGjFV9UpeuqW+AB0pczo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYBP286MB0160.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:8028::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.17; Thu, 23 Dec 2021 17:15:20 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%7]) with mapi id 15.20.4823.021; Thu, 23 Dec 2021
 17:15:20 +0000
Date: Fri, 24 Dec 2021 01:15:17 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] hw/usb: Add CanoKey Implementation
Message-ID: <YcSupUSXWDXOAkas@Sun>
References: <YcSt+qozrl+J8ool@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcSt+qozrl+J8ool@Sun>
X-Operating-System: Linux Sun 5.10.81
X-Mailer: Mutt 2.1.3 (2021-09-10)
X-ClientProxiedBy: HK2PR03CA0064.apcprd03.prod.outlook.com
 (2603:1096:202:17::34) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb50023e-c6d2-4b3c-612f-08d9c637cc60
X-MS-TrafficTypeDiagnostic: TYBP286MB0160:EE_
X-Microsoft-Antispam-PRVS: <TYBP286MB0160A60C4A85008BE90F4E7FBC7E9@TYBP286MB0160.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PvE1c4btOH1pjXKgbUUb7PZ0dbuxe7uDAsg82vOJBPIc3wvCuVf+0SbHaogPBNtfLyi4Dh1To19i5kut49EvtvKuZF4tqFDKyeF7D0RQXcx04eqljbHeytSMdwhL4qiaj2lFzMO06iG8WFCFT8oxzQ5hCf7q1Fu6746wDbKtr7JDO+GCHvtI+tgeooYEVj1SiTNScHK0+v9x5Em7Vd+rBRpXV7ssnYnxjXWdMJbMcIO/ITttWK9CKXQLddYIzlTJaVMzEeYOFz9uCyPAEtAA+Ox0MAwiFSM0IsD+YEFUPQnRPAmWW9ToQMtoM7ACHNt42howaBDzO+L9aLPoP0tVJhM764kXv5jd8nuciy6AzYOgGDs6Kg92wvZFeXxSlx//SO3ejRbnhOzJuCO84aA4FZnHJHT0xp+aTovkanXg0MKDE6vk5i9Fd+C/3ijCX5q6hWAvfoy0UMRnpjp7qKjg3fa8YhfgEPz9bKf8NOiZLU3+1wi04ttzxXyVMDKiYIXSg8wNErfYBTNNgicSEdiDn7HmTTHjr0M1p+4KDs6KJ9UHcY1iVbFkeH0YFV50Fz8hlgpxDf+p1wnUepVVWd1xHXws3loffrL7N1x2ZjC6B2cOocLuycl8pV/8WSA3hd1WQsRyq1jFQgd6/ZrKfYAAG89necr2H1Q5Ct0l2dT0LZ2d8FtrkQCjbaWEEkgu1GQRw1JHz5Yy/8sw2W3qwgXmGvMRn+C366Fogxi2gr/eiEs+/iJKKOzlROZDPE27CjVuktQJzwn9ki5WVauvKYJWfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(376002)(396003)(136003)(366004)(39830400003)(346002)(4326008)(786003)(83380400001)(66946007)(316002)(6666004)(66556008)(66476007)(186003)(52116002)(6916009)(508600001)(6486002)(6506007)(30864003)(966005)(5660300002)(8676002)(33716001)(9686003)(86362001)(8936002)(38100700002)(6512007)(2906002)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+a+z3WBtnROotfsmTIIE597r5b6bnbyu2A4bV4e6qaGzJbXs//vesAm5TbDM?=
 =?us-ascii?Q?2TJNoBUP7fLwEord95qp/nFOIaf2RXYzLZ/F4i0OA7btpaVafQ9kDpwZvP8b?=
 =?us-ascii?Q?4wXDOOuVKLAnc7CkKw3C8PbFCWNNzhImrn4UvIkM6fNPA6kGQDRoyC6oSprE?=
 =?us-ascii?Q?lGWxlGHwbXULGbgN+Gh02B+MG5lNKqE2BRf1AwKLK7g637fnk3LmgYPCO8+3?=
 =?us-ascii?Q?GqB8Ct7iVP8CtZ4RsfjfBy5SH9BythwwJKRrrrRcpv8ZZTYZ2HKradhjNPl4?=
 =?us-ascii?Q?zTylXrSGtbgBjEXc3fUxxSq9HV52ntekFemivmYIWixkMhHijebKdKyoNdCA?=
 =?us-ascii?Q?ltUOpi9LJ77KCQ3zhVQa/w8isbVJYRAdARNw21CxQ9xiBVsPfn4pWrDlOru0?=
 =?us-ascii?Q?3kGramVJj3Fx6YV+08ow+JSNOIsmHjctHLn/9VEcYoOZqQfIj9Y+Bar4RVUf?=
 =?us-ascii?Q?ET60KKb+3nAVF0rNCr2I3tWOVFu3yoChE9VNN8tuA8YEP4iSpfjaJGrwpOPl?=
 =?us-ascii?Q?om0cJrEhsFQ+jv5SDxnXgnAZSehH0dfS/TDtvqDZPa9RyL/T/qd3kGlam2Gw?=
 =?us-ascii?Q?oYtSjFgF1NAEI51EqXtGfJC5Ukn8Zl6fccFOY3ID3l8D8oIx5ylFfPjpXXvn?=
 =?us-ascii?Q?hzQfs4xwAoPh2oxs5K1l99B53KzONK+wT/Y8qhiBubZivHu6c4qVj+W5z/kK?=
 =?us-ascii?Q?eHsYfgNraz4ewjYv2R98TcPcx7f9JUJzoJe//Xg2IXjV6bdG4ATwx+X93eeU?=
 =?us-ascii?Q?gsMfcLmUzlD5LLW8Fc2l/WZPobkJv6VMD65kvCUtI2LrV1DDZ98zri2f0JbI?=
 =?us-ascii?Q?5CtxGuQZ6ECf/dT5loocQiMCkySI+i+wzFmxLVaBRi2kdenY1UkFCNhK7/6k?=
 =?us-ascii?Q?kGLMm2W6kKJDpCWFqvQU1JRtxYqD4TOgAAzxDYAiFqPo4PTZXg+6s1gHfk/4?=
 =?us-ascii?Q?X5276dLfl997XA37aDTCkp6t9WZmlEWGtVQaevCJD0PbACoXm1LN6JCTUCgs?=
 =?us-ascii?Q?JNtRK26mQ5r/YRN7/mFWT+NbwmiohEVEgiIL6D/xYE5sjMTIUCgZcfC7xXLZ?=
 =?us-ascii?Q?R8xPIg3NmbjzSV2VoVcicIxwe1N6L5zu1vXh+6r6GMYQ9deETjGhdVfVzwvr?=
 =?us-ascii?Q?M0DN4iBhYZ7zSCjnaNrVKP1pBzg75pNsuwqAOBST+ALuqZBVuyaxsmfdLr+B?=
 =?us-ascii?Q?Zhv/v2JTwYvmCnlo4eAMcJpFabCgyEhLLkjzP/wLrFcd81TWMsNCykhqrFA9?=
 =?us-ascii?Q?OBwhlOWaZ8nHVYigXC7yxjGyeV8NaMfk+CyC0JaBAvHfhkoetiorpc+UmrHF?=
 =?us-ascii?Q?QLWlnbT+BTZgN8lBS/SGM0PERCYCIurRfwNG+BQipj4Q+ak85kNkoV+c/Q+9?=
 =?us-ascii?Q?zvZ2eedwjv3L0UaGPmnZtDh/oxUvbsKtA0AbDq4opUb+KGy4VcaHkt4XegSX?=
 =?us-ascii?Q?LK/cL2SJfz/RtOdnEurR3ZtxNXHpE088s3Cqty2uA1b56vC4AhBq3jgxJZnZ?=
 =?us-ascii?Q?5kaT5Gqq4yO9rxtx/uecZHjB48bw4DTWgoDXbTMYgFezta0hW6IzKHzEvlkG?=
 =?us-ascii?Q?NaJpNQPOy4gmdYE4fqXTA52t9V2qfKx5BdjMBL0L?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: eb50023e-c6d2-4b3c-612f-08d9c637cc60
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 17:15:20.5411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GqvYJtoL9+37I8uHHK6Y+UsqIdzH4NOmqjKKt63Y1or61Vxx0IclXot37ehPAUzY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBP286MB0160
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:7010::72a
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:7010::72a;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 23 Dec 2021 16:25:05 -0500
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, contact@canokeys.org
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
 hw/usb/canokey.c | 378 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/usb/canokey.h |  60 ++++++++
 2 files changed, 438 insertions(+)
 create mode 100644 hw/usb/canokey.c
 create mode 100644 hw/usb/canokey.h

diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
new file mode 100644
index 0000000000..f71e5f0438
--- /dev/null
+++ b/hw/usb/canokey.c
@@ -0,0 +1,378 @@
+/*
+ * CanoKey QEMU device implementation.
+ *
+ * Copyright (c) Canokeys.org <contact@canokeys.org>
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
+/* #define DEBUG_CANOKEY_DATA 1 */
+/* #define DEBUG_CANOKEY 1 */
+
+#ifdef DEBUG_CANOKEY_DATA
+#define DPRINTF_DATA(data, len, fmt, ...) \
+do { \
+    printf("canokey: payload: " fmt " ", ## __VA_ARGS__); \
+    for (int i = 0; i != (len); ++i) { \
+        printf("%02X ", (data)[i]); \
+    } \
+    printf("\n"); \
+} while (0)
+#else
+#define DPRINTF_DATA(data, len, fmt, ...) do {} while (0)
+#endif
+
+#ifdef DEBUG_CANOKEY
+#define DPRINTF(fmt, ...) \
+do { printf("canokey: " fmt "\n", ## __VA_ARGS__); } while (0)
+#define BADF(fmt, ...) \
+do { fprintf(stderr, "canokey: error: " fmt "\n", ## __VA_ARGS__); \
+    exit(1); } while (0)
+#else
+#define DPRINTF(fmt, ...) do {} while (0)
+#define BADF(fmt, ...) \
+do { fprintf(stderr, "canokey: error: " fmt "\n", ## __VA_ARGS__); } while (0)
+#endif
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
+    DPRINTF("stall ep %d", ep);
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
+    DPRINTF("set addr %d", addr);
+    CanoKeyState *key = base;
+    key->dev.addr = addr;
+    return 0;
+}
+
+int canokey_emu_prepare_receive(
+        void *base, uint8_t ep, uint8_t *pbuf, uint16_t size)
+{
+    DPRINTF("prepare receive on ep %d size %d", ep, size);
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
+    DPRINTF("transmit ep %d size %d", ep, size);
+    DPRINTF_DATA(pbuf, size, "transmit");
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
+    DPRINTF("get rx data size ep %d size %d", ep, key->ep_out_size[ep]);
+    return key->ep_out_size[ep];
+}
+
+static void *canokey_thread(void *arg)
+{
+    DPRINTF("thread");
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
+            DPRINTF("stop thread");
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
+    DPRINTF("reset");
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
+    DPRINTF("contorl SETUP: %04X %04X %04X %04X",
+            request, value, index, length);
+    CanoKeyState *key = CANOKEY(dev);
+
+    canokey_emu_setup(request, value, index, length);
+    qemu_cond_signal(&key->key_cond);
+
+    uint8_t ep_in = CANOKEY_EP_IN(p->ep->nr);
+    uint32_t dir_in = request & DeviceRequest;
+    if (!dir_in) {
+        /* OUT */
+        DPRINTF("control OUT size %d", length);
+        DPRINTF_DATA(data, length, "control OUT");
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
+
+    DPRINTF("control IN: %d", p->actual_length);
+    DPRINTF_DATA(data, p->actual_length, "control IN");
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
+        DPRINTF("data OUT, ep %d", ep_out);
+        qemu_mutex_lock(&key->key_mutex);
+        if (p->iov.size > key->ep_out_size[ep_out]) {
+            DPRINTF("data OUT, ep %d overflow! income %d, buffer size %d",
+                    ep_out, p->iov.size, key->ep_out_size[ep_out]);
+            p->status = USB_RET_NAK;
+            qemu_mutex_unlock(&key->key_mutex);
+            break;
+        }
+        usb_packet_copy(p, key->ep_out[ep_out], p->iov.size);
+        key->ep_out_size[ep_out] = p->iov.size;
+        DPRINTF_DATA(key->ep_out[ep_out], p->iov.size, "data OUT payload");
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
+            DPRINTF("data IN, ep %d", ep_in);
+            DPRINTF_DATA(key->ep_in[ep_in], key->ep_in_size[ep_in],
+                    "data IN payload");
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
+    DPRINTF("realize");
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
+    DPRINTF("unrealize");
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
index 0000000000..caa93a8f3a
--- /dev/null
+++ b/hw/usb/canokey.h
@@ -0,0 +1,60 @@
+/*
+ * CanoKey QEMU device header.
+ *
+ * Copyright (c) Canokeys.org <contact@canokeys.org>
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
2.34.0

