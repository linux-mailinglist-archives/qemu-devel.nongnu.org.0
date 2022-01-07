Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E84F4879FA
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 16:56:06 +0100 (CET)
Received: from localhost ([::1]:57160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5rb3-0007nl-OC
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 10:56:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n5rWo-0004ul-6Q
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:51:42 -0500
Received: from [2a01:111:f403:700c::72e] (port=65327
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n5rWm-0006rf-CS
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:51:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edzK7RAkm+hzJAhPUU3RHwrV3RdmUuI1GXMe+qejpaGoxnb1bL/yGFNkSC1WnFKcGt24j5mYCApciPJvBJc2sLK8d9cagr2F781nnwLF5jHJrn4w2OTzvjWWicHjD5cEZn5e/ttaro3xAlbiatunn94ZhRhDPsy2BZBXHpUKUqhaoDqkGVEdPhJUUHxmMHzwCrYws51P3rcoKoOWJxM6FEuJJjqr2czs2lWCkZ+jd37v1PDdyeUX1RJNqczw4oJG2R03GdmugFB6FtYbxeMJ1ZTsebA8MRAlkqvTEOXeT1IaYpjXCB2JIDqkT55e4Ujv00HElYbMs5AANrXncPJu6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0fxUAP8Sq7aRyBlrpIyAHFgphLEtFEzkJXArKLBMPQ=;
 b=Z1u0ky7D9P8h9Aq0QHkfGwz3spbuPf8w8ezKqdMFFRgG9mEcj2RdCwF2AsK63fWDUkEZSFQX/gsA4FfKv+qnkc/2VHKniDe3XPwyKKDXtq1xOpbF7Dhir3v8DH7WMuXIqPRBubgxjG7xd9Ds4h7V2KSHdEIlyFEpJ7iznW67VOQOyVa56IQqfBxO6xW+ytzpzMAVS1fwc4mDsuYuzRdZOrSub4lViW/8YG1lfKBrI1uUM+9DcV9pG/4cbM2x2OkIFL4+bkvBRY8DmHOAV+IcDv187VuKOOaMj1fSYKp3ICS9352G2y0zXTY2PGoy3l0x072vt8HUE5aBske0Hcm8nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0fxUAP8Sq7aRyBlrpIyAHFgphLEtFEzkJXArKLBMPQ=;
 b=aoZD2zQ6xQfoyy80x7Cd23skRx9yLkdShfjRpUZ+1LFw4NBqBBTCYCyHnI2qTtay7zBlt/iBGK/832pV00OrMVnA5XFOStJQqCDcYvAgsUk6Y64r/HmGxbb0hWQpg8cIw/4Tib2B81cPRPh0PxoLN23JBvZoK2hkL3THg3nGgc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYBP286MB0432.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:801d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.10; Fri, 7 Jan 2022 15:35:15 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%7]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 15:35:15 +0000
Date: Fri, 7 Jan 2022 23:35:13 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] hw/usb/canokey: Add trace events
Message-ID: <YdhdsY93I2DDnG54@Sun>
References: <Ydhc8cTsH0QNINT/@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ydhc8cTsH0QNINT/@Sun>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.3 (2021-09-10)
X-ClientProxiedBy: HK2PR0302CA0024.apcprd03.prod.outlook.com
 (2603:1096:202::34) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abd3d7b5-72ca-4e05-5831-08d9d1f34d53
X-MS-TrafficTypeDiagnostic: TYBP286MB0432:EE_
X-Microsoft-Antispam-PRVS: <TYBP286MB0432A66654F1D26AA52C8012BC4D9@TYBP286MB0432.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9r/9b0O9zRCH97+Mn9d5sfCgzUhRwLhHq3lnuswtlvtlW1CM7EjLl28+Nnt54FtxU79ssl01V1RzI3ZEexCPKZY99Hi+lBatLPGVDlWoYwtoZAgVDW89XCLMIkChOADDxEL7UNDTLMj0OO0PgMQwJeRGaq/1cy30iakY5ofdDGho32ZV0bEsoGEOhyRWLZunBy4nbVXHD1M3ytYanaHlczEEIq4p6vyMofqeQ39xPjaKzbvyvy7aUsNhWeu2tvSfJAA6ynjfrqdBwJmLbuTUj64xnMGswWqE/hoSYjKfSjW5KlCwHXrATXBeEyLcCWDSfUJbrhOjpdUQ/OkYM8RRYmsFNwYhdwj1bwmY4tM8NXMyZ5P8rAptP4OtnM6iYI3NtPjoKqC4l+vsU41lY0KoWx7eEL2hD7ItbpW50lyB0CrcmTlyXi5z/JRwCEEvgUiQwIs9CLkhxGlIbPiVgq1LWbGCTxh1iwB2Fie9MxdCXPpnLQmJm8SBXD+SXFdYF7mzCvHYZ1w74kpHvnterEZ9Qd7uBcWv9UPLPn6gZG3DQRG0OTLBnMjuMSW04v/GGbyFseXh0OCnLYjkBgiWJ1pPysTjA3R36ZYBL8vp4i45wX2iTibXgji24DwJxck4xchbXR5JUAMiaP4buexTb7W9EZqcL6kmvcJ7aPVaxyZ3cP5daycud/7VXso3B7ljCEw7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(39830400003)(376002)(136003)(396003)(346002)(366004)(4326008)(6916009)(66946007)(9686003)(33716001)(86362001)(2906002)(6486002)(54906003)(786003)(6512007)(316002)(5660300002)(38100700002)(83380400001)(66476007)(66556008)(186003)(8936002)(52116002)(508600001)(8676002)(6506007)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cxjm8AxXQstjb9yr05prjEQt46Rtx0q48sPkqbq5cIi6KW1bxE1IIrodxrWz?=
 =?us-ascii?Q?iRvshNqKSFadJ/bxCYsdfEvTLI1GhPu7NnzKvFL7mIqj9xV34tl/0z1VC9V0?=
 =?us-ascii?Q?dLKs6eFX/XNa/preFEkg2MNN56rNHpdukMnUyzDrfYLkDkatc0+jmIy/Qc7d?=
 =?us-ascii?Q?FO6035fVE5aai0+N2SUEsV571e9nNwWuxND89bbEiuqfyYzef+Xae+CQkcfF?=
 =?us-ascii?Q?XdmZHICZSp0FJauK2Sk10Ch+VwfhWnRWRPbvy3CA2mVRPUo1By0LAK4NDu9j?=
 =?us-ascii?Q?wbZG9wPFbig6cJjpIPNo+cvWrY4Gk+tn7+zMabqiXffHJ5V1Va3NihztqbNg?=
 =?us-ascii?Q?emkzifWZhBr3LlHlScubUQjounZoKOQBVUmR5jkJ5anx0gr/MJKzz/t6dWOf?=
 =?us-ascii?Q?7evcbJC6VNZ5VJqVhGyH70axn9KOd/9azqsAlUo3Sdq9kc2fIbnsu0WEeI1H?=
 =?us-ascii?Q?jmhCwgk7G5mrMhesAtFLKqI5P7j/ahKYw5YKeeMKGNZBBdymBfnlXPqQVZCd?=
 =?us-ascii?Q?WpOogUJblzkMEMON9SBe9zFJVQCXgAp0k+YcA5YMZAp2iOOBFJ5dX6ztQg9a?=
 =?us-ascii?Q?g8uwipHWzDxkZmat+xXtT5Opo/I6AtMcK+9k2aUadRHd7HUNIMETFYurXuOD?=
 =?us-ascii?Q?kQYm3w6iHk3IkJh8YownBtffu0CCIC0y6pBpcNUshhsuWys/DgWobSv5zMw8?=
 =?us-ascii?Q?2CtA3bqdUWA+NCpbDszhDfDQtFVboPS+Wi2SzON3lEZLJJzAI8gvcV5uUy6B?=
 =?us-ascii?Q?Ou4P7Ll3EkGZ97J9Dez3swg3ofN7h1+rL2QYKy7c/K906bgzNHwJj3v+dc8a?=
 =?us-ascii?Q?o33LULa8D95WCRWrR956Oel6HOgIgfMLPFRakKl7UiTnY9giCpvO7O19eBTH?=
 =?us-ascii?Q?Ufj2mfYAsltlMAPUpGXNJvcptlVnuB5zd2JUIoRdISxmgucJIO1+qVtXTIt2?=
 =?us-ascii?Q?+MuPje2S/D0rnYSZG0p/ewzKIqHdfctxEbZxVQuezjIILv0HIM0ochRLKuZk?=
 =?us-ascii?Q?9PCTHUvidEk+2GwxHkjy8ZdP2BwggfPOx5Yupb9HRof1Ex+1k5AzLQnq1MAV?=
 =?us-ascii?Q?cKucowEnNjn0bAAQsufqmvErBu7e2Ek4ZQr5XtE82qF20Awe9uzgZGVBDt4/?=
 =?us-ascii?Q?wb7KiGiwG1HqlhJFn7DGbagq64B5XZFS5Qa5RTpAvt4azb8bxmx3lBwaiZL2?=
 =?us-ascii?Q?ZiVQkR9QCnx6qZWBO+OjMhyJmPr6+l/+z6alqVib30aVsMbfuwGV3rvtai86?=
 =?us-ascii?Q?MT98Nl6Fx4JztXjjpqPXCzF7PglBPkTy++rjYEI8lAUW6d/3o1zR3/gInmZV?=
 =?us-ascii?Q?WbduxxU5PkgHbqOFN2ijNtrRbpe64EH6vfHX1vsMYKt8M8EgBom6gvIHnvEs?=
 =?us-ascii?Q?+ceOFtzm8Oz9KET22VS1X94VwrAVA/GLu04/QnE2ZZXPKfqdkZkCFYvf8MSU?=
 =?us-ascii?Q?NWPYWuFQmv1Ge2Jrgr5Mh+JihDZXYo3iJJUdXVgc1Yt0ugOCB7s3YTCQeE7j?=
 =?us-ascii?Q?FoZwqFzCcVIweLYYIZUTCgEXtDHVsy0oCNxmEqQVAz1pkCRR0tUsp2Lix9pq?=
 =?us-ascii?Q?ZKThFAuwCCP59C21XRmaefNsw69MbXQ99IvjARVy?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: abd3d7b5-72ca-4e05-5831-08d9d1f34d53
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 15:35:15.5139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufxID21XwWWS1JJbmIxc3aHDBkHkD/Ifim8Wo9cSUp9QNWufDhqnQ/a/BM7dUL9c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBP286MB0432
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:700c::72e
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:700c::72e;
 envelope-from=i@zenithal.me;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
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

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 hw/usb/canokey.c    | 17 +++++++++++++++++
 hw/usb/trace-events | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
index 6bd4dedfd2..c8cc31ba9e 100644
--- a/hw/usb/canokey.c
+++ b/hw/usb/canokey.c
@@ -16,6 +16,7 @@
 #include "qapi/error.h"
 #include "hw/usb.h"
 #include "hw/qdev-properties.h"
+#include "trace.h"
 #include "desc.h"
 #include "canokey.h"
 
@@ -64,6 +65,7 @@ static const USBDesc desc_canokey = {
 /* Implement canokey-qemu functions */
 int canokey_emu_stall_ep(void *base, uint8_t ep)
 {
+    trace_canokey_emu_stall_ep(ep);
     CanoKeyState *key = base;
     uint8_t ep_in = CANOKEY_EP_IN(ep); /* INTR IN has ep 129 */
     qemu_mutex_lock(&key->ep_in_mutex[ep_in]);
@@ -75,6 +77,7 @@ int canokey_emu_stall_ep(void *base, uint8_t ep)
 
 int canokey_emu_set_address(void *base, uint8_t addr)
 {
+    trace_canokey_emu_set_address(addr);
     CanoKeyState *key = base;
     key->dev.addr = addr;
     return 0;
@@ -83,6 +86,7 @@ int canokey_emu_set_address(void *base, uint8_t addr)
 int canokey_emu_prepare_receive(
         void *base, uint8_t ep, uint8_t *pbuf, uint16_t size)
 {
+    trace_canokey_emu_prepare_receive(ep, size);
     CanoKeyState *key = base;
     /*
      * No mutex here because it is usually called by
@@ -96,6 +100,7 @@ int canokey_emu_prepare_receive(
 int canokey_emu_transmit(
         void *base, uint8_t ep, const uint8_t *pbuf, uint16_t size)
 {
+    trace_canokey_emu_transmit(ep, size);
     CanoKeyState *key = base;
     uint8_t ep_in = CANOKEY_EP_IN(ep); /* INTR IN has ep 129 */
     qemu_mutex_lock(&key->ep_in_mutex[ep_in]);
@@ -114,6 +119,7 @@ uint32_t canokey_emu_get_rx_data_size(void *base, uint8_t ep)
 
 static void *canokey_thread(void *arg)
 {
+    trace_canokey_thread_start();
     CanoKeyState *key = arg;
 
     while (true) {
@@ -124,6 +130,7 @@ static void *canokey_thread(void *arg)
 
         /* Exit thread check */
         if (key->stop_thread) {
+            trace_canokey_thread_stop();
             key->stop_thread = false;
             break;
         }
@@ -135,6 +142,7 @@ static void *canokey_thread(void *arg)
 
 static void canokey_handle_reset(USBDevice *dev)
 {
+    trace_canokey_handle_reset();
     CanoKeyState *key = CANOKEY(dev);
     for (int i = 0; i != CANOKEY_EP_NUM; ++i) {
         key->ep_in_status[i] = CANOKEY_EP_IN_WAIT;
@@ -146,6 +154,7 @@ static void canokey_handle_reset(USBDevice *dev)
 static void canokey_handle_control(USBDevice *dev, USBPacket *p,
                int request, int value, int index, int length, uint8_t *data)
 {
+    trace_canokey_handle_control_setup(request, value, index, length);
     CanoKeyState *key = CANOKEY(dev);
 
     canokey_emu_setup(request, value, index, length);
@@ -155,6 +164,7 @@ static void canokey_handle_control(USBDevice *dev, USBPacket *p,
     uint32_t dir_in = request & DeviceRequest;
     if (!dir_in) {
         /* OUT */
+        trace_canokey_handle_control_out();
         qemu_mutex_lock(&key->key_mutex);
         if (key->ep_out[0] != NULL) {
             memcpy(key->ep_out[0], data, length);
@@ -179,6 +189,8 @@ static void canokey_handle_control(USBDevice *dev, USBPacket *p,
     p->actual_length = key->ep_in_size[ep_in];
 
     qemu_mutex_unlock(&key->ep_in_mutex[ep_in]);
+
+    trace_canokey_handle_control_in(p->actual_length);
 }
 
 static void canokey_handle_data(USBDevice *dev, USBPacket *p)
@@ -190,9 +202,11 @@ static void canokey_handle_data(USBDevice *dev, USBPacket *p)
     uint32_t in_len;
     switch (p->pid) {
     case USB_TOKEN_OUT:
+        trace_canokey_handle_data_out(ep_out);
         qemu_mutex_lock(&key->key_mutex);
         if (p->iov.size > key->ep_out_size[ep_out]) {
             /* unlikely we will reach here, but check still needed */
+            trace_canokey_handle_data_out_err(ep_out, p->iov.size, key->ep_out_size[ep_out]);
             p->status = USB_RET_NAK;
             qemu_mutex_unlock(&key->key_mutex);
             break;
@@ -213,6 +227,7 @@ static void canokey_handle_data(USBDevice *dev, USBPacket *p)
                 qemu_mutex_unlock(&key->ep_in_mutex[ep_in]);
                 break;
             }
+            trace_canokey_handle_data_in(ep_in);
             if (key->ep_in_status[ep_in] == CANOKEY_EP_IN_STALL) {
                 p->status = USB_RET_STALL;
             }
@@ -243,6 +258,7 @@ static void canokey_handle_data(USBDevice *dev, USBPacket *p)
 
 static void canokey_realize(USBDevice *base, Error **errp)
 {
+    trace_canokey_realize();
     CanoKeyState *key = CANOKEY(base);
 
     if (key->file == NULL) {
@@ -274,6 +290,7 @@ static void canokey_realize(USBDevice *base, Error **errp)
 
 static void canokey_unrealize(USBDevice *base)
 {
+    trace_canokey_unrealize();
     CanoKeyState *key = CANOKEY(base);
 
     /* Thread */
diff --git a/hw/usb/trace-events b/hw/usb/trace-events
index b8287b63f1..0236e9615d 100644
--- a/hw/usb/trace-events
+++ b/hw/usb/trace-events
@@ -345,3 +345,20 @@ usb_serial_set_baud(int bus, int addr, int baud) "dev %d:%u baud rate %d"
 usb_serial_set_data(int bus, int addr, int parity, int data, int stop) "dev %d:%u parity %c, data bits %d, stop bits %d"
 usb_serial_set_flow_control(int bus, int addr, int index) "dev %d:%u flow control %d"
 usb_serial_set_xonxoff(int bus, int addr, uint8_t xon, uint8_t xoff) "dev %d:%u xon 0x%x xoff 0x%x"
+
+# canokey.c
+canokey_emu_stall_ep(uint8_t ep) "ep %d"
+canokey_emu_set_address(uint8_t addr) "addr %d"
+canokey_emu_prepare_receive(uint8_t ep, uint16_t size) "ep %d size %d"
+canokey_emu_transmit(uint8_t ep, uint16_t size) "ep %d size %d"
+canokey_thread_start(void)
+canokey_thread_stop(void)
+canokey_handle_reset(void)
+canokey_handle_control_setup(int request, int value, int index, int length) "request %04X value %04X index %04X length %04X"
+canokey_handle_control_out(void)
+canokey_handle_control_in(int actual_len) "actual len %d"
+canokey_handle_data_out(uint8_t ep_out) "ep %d"
+canokey_handle_data_out_err(uint8_t ep_out, uint32_t income, uint32_t buffer_size) "ep %d overflow! income %d, buffer size %d"
+canokey_handle_data_in(uint8_t ep_out) "ep %d"
+canokey_realize(void)
+canokey_unrealize(void)
-- 
2.34.0


