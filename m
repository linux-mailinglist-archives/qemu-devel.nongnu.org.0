Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E18F49DE87
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 10:55:26 +0100 (CET)
Received: from localhost ([::1]:40204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1Uz-0003o3-Aj
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 04:55:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nD1MK-0001Ln-O6
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:46:28 -0500
Received: from [2a01:111:f403:7010::71c] (port=58595
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nD1MF-0001n6-CS
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:46:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Me+JxXiaeklRrBdnn2R5pEJ9Vf9VhqSHdWqpghr7KTqoQhk1jB7eITeseHbceymjhecCcMw7W+YpRb/4WiY6hsSosY7ewZ7x4eAlYAeQfe7Wu7D+LPJEdgvc4F+BCzI2eljTdE6j4ELNU7BVQeLAvudlqdu3WBQ4Es2AnRaJpTsnBpL9M1lEbb5o9iP8zuarZ3lRbd+msxZHo1q50sveSsE1zCD7m1nyMAEdYZpcaUk1GqjLMa2ZwGW18PP+lRzAO6AL0vq7/l8tzlm+uqUJMSoHUl6kGDtLd8qUBpnICNQFAJ6NdmDTPf1a5qVAxFUaEI7va5rlh9BOCYqkzXJCLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+vsqvkSn4jzzR/BOJyaqTM3YuyzaUSxD48CRtZ4qfA=;
 b=GNvvwlmvthqFxghuf8H1L222WYdGDmVB/GkSjo4F3Q5mkFf6QxyKhFqFgPcXWtevoIxm7fn938VAmScaVZkf12zhHJj4B6pK7JS2wgoP5K+jUOJgjP5K97AwQq5D/StiZTJ9cQhsO04G7tu13holKo4vvsoyNvHFX5oLVy8pAzW8Q3TRnhst2PAw4L9fXZMThiEyg9jdY9PxeNSg8dypH10PrBpcEMPYPJ87OQJFajudavghOgljvdLyQ+o8KU8lnSWDk4ZdOEBkAjmbbr3QVk5DtdZDeApIlI5Xg1pW4J6W61hD7XuvkNxT6JyDKh6GBZB57/YNuLzfSAmr2qwMCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+vsqvkSn4jzzR/BOJyaqTM3YuyzaUSxD48CRtZ4qfA=;
 b=q9NBLaYOtUx6jq7T0m5a6BW8HZAtU4z8VlkpsIxf8Q0ApaKsxw2JcZ5T9w6LDuCvxTjdjpYCS5xAyi8zvGcQYJtVBnoziBh1DlodK6GYrUcA3IZN0U6FFmVOEP2Ol4dSkWZXXfXHCvNjfXoh6o/x5OghItLEdd1OOPaboJwVVks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OS0P286MB0482.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:ac::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15; Thu, 27 Jan 2022 09:45:44 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%8]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 09:45:44 +0000
Date: Thu, 27 Jan 2022 17:45:42 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/6] hw/usb: Add CanoKey Implementation
Message-ID: <YfJpxrXJUNleK2x6@Sun>
References: <YfJozy5qjVYh24Xp@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfJozy5qjVYh24Xp@Sun>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.5 (2021-12-30)
X-ClientProxiedBy: HK2PR02CA0199.apcprd02.prod.outlook.com
 (2603:1096:201:20::11) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 088b9f49-f997-43e1-638c-08d9e179c9ce
X-MS-TrafficTypeDiagnostic: OS0P286MB0482:EE_
X-Microsoft-Antispam-PRVS: <OS0P286MB04825B3137CD38E71226EAF5BC219@OS0P286MB0482.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rWX0VFh6ywzzWZh718FjLHV+g4rCc0dNY2WkWLPx/r8OtDiOFOvIAIjHQwJfORJ3vkodxRcq9RBduMriQkneQtrJTfug+Hy+IusfeWupcZu9hpMMHL8FD6Z+1+2dKhcs4zSIVvyFEtXvbP2SFYyxHH2SOtBZX5uFA1OnyeNyWknMmEXpLwPo64oETn6SPYXKfspNrzvM6/vLzAD8be6ZjWVMO/eGHifbmPMAM1Bf4PKxYgWfb3gFhxyAyAWAay+YKoUuZQ41q9UjBhSDlYK+NNGE6/zzxzZN4gYlQqi/I25wrOjybTh9iKNKr+Y9fvmb3dirtX8YX2IL6VjueuDae+nZn+kVtWz1OHXo7/LmU/kP81mSdG0VkJplfDRe5wGgVWz5Sh3l/AiiJCklxdHj/4cG7qwpdB5eKnntwYtKgtTBVQ7TUkbIXDZTsrq1ofKid4PUanlkf8HhxkfiCewJuyrEvetmSo9M4D/zTyiwJuIGmVWX1n4u/sb1NgT5G7tau8hPTMOvNi5z6NlmwcNm3AluM8A1G7GKFaHkMAAMsURKVGu8Ka97m2GfNceRnJa2VdaoH+1H7a+8CrZPj4Dmc4L6YbL0LaXm7QXJDsPjiW9MqkmqlMCyp/2Ndii2+YmZQkQC0kji8/ymtvZtFHC/g9gKb9Ucd6teM4WL8xBYGJGlmzoIeHTxPk4AHNEB4VtJQP2tAnZPmO7IHN0AYMbVKnHonPo5TOhdWvUDiv82X1D0pmo6KCpOH5+59I6LEH7lh5KExWfYys+Vjqzw/yWNiFb2hFHH7Kwl+Mwnqcj88ZVKDXPggDkqN/v7fPlqx5yXpm2JbCgHmnlO6CMR1xghSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(376002)(136003)(39830400003)(366004)(396003)(346002)(186003)(26005)(9686003)(86362001)(6506007)(6512007)(2906002)(38350700002)(38100700002)(508600001)(6486002)(966005)(33716001)(83380400001)(5660300002)(6916009)(30864003)(8936002)(66476007)(66556008)(8676002)(4326008)(66946007)(52116002)(54906003)(786003)(316002)(3714002)(49092004)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qTJeNuKlbaSutSIRYlVLnZlY+ouMYPFdogrPeJ44EaXseiL7q2WlDZb9E+87?=
 =?us-ascii?Q?ZdHRxL7kXmzsLbcaBR9NQiCE8FMgY206ZQUMU97uUPFCPGCLdbe0DIQK234x?=
 =?us-ascii?Q?0ps9umxFZ58WjgV/w2X/HkOJ7quzCOyWnQl10QGEpK415YiqoBlDGxFt2mSr?=
 =?us-ascii?Q?xf6y2OG6FD0Kld8BWv/ioNfrE/xM1l++1VeOKM6BsjegrR+CmGXrTrvsAKaw?=
 =?us-ascii?Q?mf0O+Tqkyj5XVSaSEXMxYZwCib08oA2hjcs/MtMKROT3fD6+CiIq44uLX5ey?=
 =?us-ascii?Q?7CL+Pj/mznM/h/uW6CU6mWr8nZhmqCIDOLtQRnk1m4wJG5hZoDskXB9dGuIq?=
 =?us-ascii?Q?zeg5jHfMvrRhsMRgYwUQCzf75OAYFY3j4L7aIMDT3JmEpYyhgIrQLlMopeKJ?=
 =?us-ascii?Q?xCF3T3wv1mbpBgSeWgg7cCfE6UXmNMuk9YrNoPFfGJYDBi7LXp+RGjUTOSXE?=
 =?us-ascii?Q?5eiyal5xnAWrHAdl51QcloIZvQoVHDdH3awZ45/nh2BhByq0flpKMF5YL9vc?=
 =?us-ascii?Q?VgijCXLm4TG9BnABiuqx5mzooni+07E+mWNQZzNCj2NDPBQGR9+7OpsFI8Xi?=
 =?us-ascii?Q?JEbHgwGymQW580G50AvDRcgV1A1zP8DoZUJLxro+w3BWs4ltpAhTiKYSOpgr?=
 =?us-ascii?Q?05keo7msberTZ4I49m3XHpGBzt8KiawCeaNHoKLCrA8PBkoeiJXStC0uxgUY?=
 =?us-ascii?Q?2kCcHtDIW8XRoBRqs8SzFXnWteOeP+OZWxjyNNkj8xPX188gNR9NWFKyDEs0?=
 =?us-ascii?Q?wfwF9xsOFlqypqg5NSp+B+W2ho3tWGcj2Or93SXO5Y2pYVI//KzIbzG9Scj6?=
 =?us-ascii?Q?nA4ZpROWBL4UM165afzJnJn04/5jqPjpMwObh0K7m070ceXBrEM4RmaUWNPk?=
 =?us-ascii?Q?F0MUEsuKG/nMdMkn2l3MafZX8BZtGJtd0J/BlbKGfvMpRjWCjpHkdMHwKD1b?=
 =?us-ascii?Q?Y7hJ3XrVzwIoW1XRf52XTDYtl//jqrlgsl0SwssqcNT0EmwiSEEPDwChrwFI?=
 =?us-ascii?Q?ZXzX16i8oL6cFeZqS8tTp33UQt0m7NQud2/6HbeNWyh4/qZA9DYjtVoSMi1G?=
 =?us-ascii?Q?ndOkUXoG6b1a35WNtyLt8gZwX2jL/Hy2AEh+NlqucdWGJ22+bRAWvMWQPLbV?=
 =?us-ascii?Q?CMJVXoFA/ikSlcnFPoyMOtl8kA5xGqRvEHv0SkpKAqtLapT8RdiVqwJv+TJ4?=
 =?us-ascii?Q?1UFekWmmEoq6neuJsh2ppcc3Z1rhmLc+4J0dUh6+VXMCJVoMI/NfYa6AsIFd?=
 =?us-ascii?Q?PS3lrMiOlMTr4lvInEpnlTLiksoDv/juUqpZGaWr69peDJC5/P8TofVjBh4/?=
 =?us-ascii?Q?Qnyg21roE9jO0EWaDv568tVZlCx8CXb4QwU5W7COCSF5KM/7vBRYv1n1JjTu?=
 =?us-ascii?Q?AMXPInxhQWpOhP1ifv2PqLrhRJ62dPSO7US4dzxal5lssJs94UdAL1h57gmy?=
 =?us-ascii?Q?z/UlMQzlunaj2gfk4pclCRs9abB5gsDgA/0ceImxekgn57ftvb3Q1xTGwQNy?=
 =?us-ascii?Q?XxnmLJAx42ScSd0U7oWsP7cfFHbcCuS+iH0QsOZRhMVHZwQlovw6u2SCl4hE?=
 =?us-ascii?Q?tZfCJ9UgqxIZzme1Ut0=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 088b9f49-f997-43e1-638c-08d9e179c9ce
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:45:44.4236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xiogbBJfYL3TeQC7yWvTAcqCQwxFiZtSw5SGzyyH0/uBov5HTwVF/5k2XGAStAM9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0P286MB0482
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:7010::71c
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:7010::71c;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 hw/usb/canokey.c | 298 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/usb/canokey.h |  69 +++++++++++
 2 files changed, 367 insertions(+)
 create mode 100644 hw/usb/canokey.c
 create mode 100644 hw/usb/canokey.h

diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
new file mode 100644
index 0000000000..3c2efa43fc
--- /dev/null
+++ b/hw/usb/canokey.c
@@ -0,0 +1,298 @@
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
+/*
+ * libcanokey-qemu.so side functions
+ * All functions are called from canokey_emu_device_loop
+ */
+int canokey_emu_stall_ep(void *base, uint8_t ep)
+{
+    CanoKeyState *key = base;
+    uint8_t ep_in = CANOKEY_EP_IN(ep); /* INTR IN has ep 129 */
+    key->ep_in_size[ep_in] = 0;
+    key->ep_in_state[ep_in] = CANOKEY_EP_IN_STALL;
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
+    memcpy(key->ep_in[ep_in] + key->ep_in_size[ep_in],
+            pbuf, size);
+    key->ep_in_size[ep_in] += size;
+    key->ep_in_state[ep_in] = CANOKEY_EP_IN_READY;
+    /*
+     * ready for more data in device loop
+     *
+     * Note: this is a quirk for CanoKey CTAPHID
+     * because it calls multiple emu_transmit in one device_loop
+     * but w/o data_in it would stuck in device_loop
+     * This has no side effect for CCID as it is strictly
+     * OUT then IN transfer
+     * However it has side effect for Control transfer
+     */
+    if (ep_in != 0) {
+        canokey_emu_data_in(ep_in);
+    }
+    return 0;
+}
+
+uint32_t canokey_emu_get_rx_data_size(void *base, uint8_t ep)
+{
+    CanoKeyState *key = base;
+    return key->ep_out_size[ep];
+}
+
+/*
+ * QEMU side functions
+ */
+static void canokey_handle_reset(USBDevice *dev)
+{
+    CanoKeyState *key = CANOKEY(dev);
+    for (int i = 0; i != CANOKEY_EP_NUM; ++i) {
+        key->ep_in_state[i] = CANOKEY_EP_IN_WAIT;
+        key->ep_in_pos[i] = 0;
+        key->ep_in_size[i] = 0;
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
+
+    uint32_t dir_in = request & DeviceRequest;
+    if (!dir_in) {
+        /* OUT */
+        if (key->ep_out[0] != NULL) {
+            memcpy(key->ep_out[0], data, length);
+        }
+        canokey_emu_data_out(p->ep->nr, data);
+    }
+
+    canokey_emu_device_loop();
+
+    /* IN */
+    switch (key->ep_in_state[0]) {
+    case CANOKEY_EP_IN_WAIT:
+        p->status = USB_RET_NAK;
+        break;
+    case CANOKEY_EP_IN_STALL:
+        p->status = USB_RET_STALL;
+        break;
+    case CANOKEY_EP_IN_READY:
+        memcpy(data, key->ep_in[0], key->ep_in_size[0]);
+        p->actual_length = key->ep_in_size[0];
+        /* reset state */
+        key->ep_in_state[0] = CANOKEY_EP_IN_WAIT;
+        key->ep_in_size[0] = 0;
+        key->ep_in_pos[0] = 0;
+        break;
+    }
+}
+
+static void canokey_handle_data(USBDevice *dev, USBPacket *p)
+{
+    CanoKeyState *key = CANOKEY(dev);
+
+    uint8_t ep_in = CANOKEY_EP_IN(p->ep->nr);
+    uint8_t ep_out = p->ep->nr;
+    uint32_t in_len;
+    uint32_t out_pos;
+    uint32_t out_len;
+    switch (p->pid) {
+    case USB_TOKEN_OUT:
+        usb_packet_copy(p, key->ep_out_buffer[ep_out], p->iov.size);
+        out_pos = 0;
+        while (out_pos != p->iov.size) {
+            /*
+             * key->ep_out[ep_out] set by prepare_receive
+             * to be a buffer inside libcanokey-qemu.so
+             * key->ep_out_size[ep_out] set by prepare_receive
+             * to be the buffer length
+             */
+            out_len = MIN(p->iov.size - out_pos, key->ep_out_size[ep_out]);
+            memcpy(key->ep_out[ep_out],
+                    key->ep_out_buffer[ep_out] + out_pos, out_len);
+            out_pos += out_len;
+            /* update ep_out_size to actual len */
+            key->ep_out_size[ep_out] = out_len;
+            canokey_emu_data_out(ep_out, NULL);
+        }
+        break;
+    case USB_TOKEN_IN:
+        if (key->ep_in_pos[ep_in] == 0) { /* first time IN */
+            canokey_emu_data_in(ep_in);
+            canokey_emu_device_loop(); /* may call transmit multiple times */
+        }
+        switch (key->ep_in_state[ep_in]) {
+        case CANOKEY_EP_IN_WAIT:
+            /* NAK for early INTR IN */
+            p->status = USB_RET_NAK;
+            break;
+        case CANOKEY_EP_IN_STALL:
+            p->status = USB_RET_STALL;
+            break;
+        case CANOKEY_EP_IN_READY:
+            /* submit part of ep_in buffer to USBPacket */
+            in_len = MIN(key->ep_in_size[ep_in] - key->ep_in_pos[ep_in],
+                    p->iov.size);
+            usb_packet_copy(p,
+                    key->ep_in[ep_in] + key->ep_in_pos[ep_in], in_len);
+            key->ep_in_pos[ep_in] += in_len;
+            /* reset state if all data submitted */
+            if (key->ep_in_pos[ep_in] == key->ep_in_size[ep_in]) {
+                key->ep_in_state[ep_in] = CANOKEY_EP_IN_WAIT;
+                key->ep_in_size[ep_in] = 0;
+                key->ep_in_pos[ep_in] = 0;
+            }
+            break;
+        }
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
+    for (int i = 0; i != CANOKEY_EP_NUM; ++i) {
+        key->ep_in_state[i] = CANOKEY_EP_IN_WAIT;
+        key->ep_in_size[i] = 0;
+        key->ep_in_pos[i] = 0;
+    }
+
+    if (canokey_emu_init(key, key->file)) {
+        error_setg(errp, "canokey can not create or read %s", key->file);
+        return;
+    }
+}
+
+static void canokey_unrealize(USBDevice *base)
+{
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
index 0000000000..24cf304203
--- /dev/null
+++ b/hw/usb/canokey.h
@@ -0,0 +1,69 @@
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
+ * State of Canokey (i.e. hw/canokey.c)
+ */
+
+/* CTRL INTR BULK */
+#define CANOKEY_EP_NUM 3
+/* BULK/INTR IN can be up to 1352 bytes, e.g. get key info */
+#define CANOKEY_EP_IN_BUFFER_SIZE 2048
+/* BULK OUT can be up to 270 bytes, e.g. PIV import cert */
+#define CANOKEY_EP_OUT_BUFFER_SIZE 512
+
+typedef enum {
+    CANOKEY_EP_IN_WAIT,
+    CANOKEY_EP_IN_READY,
+    CANOKEY_EP_IN_STALL
+} CanoKeyEPState;
+
+typedef struct CanoKeyState {
+    USBDevice dev;
+
+    /* IN packets from canokey device loop */
+    uint8_t ep_in[CANOKEY_EP_NUM][CANOKEY_EP_IN_BUFFER_SIZE];
+    /*
+     * See canokey_emu_transmit
+     *
+     * For large INTR IN, receive multiple data from canokey device loop
+     * in this case ep_in_size would increase with every call
+     */
+    uint32_t ep_in_size[CANOKEY_EP_NUM];
+    /*
+     * Used in canokey_handle_data
+     * for IN larger than p->iov.size, we would do multiple handle_data()
+     *
+     * The difference between ep_in_pos and ep_in_size:
+     * We first increase ep_in_size to fill ep_in buffer in device_loop,
+     * then use ep_in_pos to submit data from ep_in buffer in handle_data
+     */
+    uint32_t ep_in_pos[CANOKEY_EP_NUM];
+    CanoKeyEPState ep_in_state[CANOKEY_EP_NUM];
+
+    /* OUT pointer to canokey recv buffer */
+    uint8_t *ep_out[CANOKEY_EP_NUM];
+    uint32_t ep_out_size[CANOKEY_EP_NUM];
+    /* For large BULK OUT, multiple write to ep_out is needed */
+    uint8_t ep_out_buffer[CANOKEY_EP_NUM][CANOKEY_EP_OUT_BUFFER_SIZE];
+
+    /* Properties */
+    char *file; /* canokey-file */
+} CanoKeyState;
+
+#endif /* CANOKEY_H */
-- 
2.34.1


