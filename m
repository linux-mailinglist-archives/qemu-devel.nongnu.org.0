Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F82547B6C
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 20:12:33 +0200 (CEST)
Received: from localhost ([::1]:45644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0S4e-0005ZM-MR
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 14:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o0S38-000495-2v
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 14:10:58 -0400
Received: from mail-tycjpn01on20728.outbound.protection.outlook.com
 ([2a01:111:f403:7010::728]:13543
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o0S35-0005a6-EM
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 14:10:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLQmGADs1LB/sJre6MTZzMh5vdOc82B1hCa9CWww8ZuHQU3vpR685zb75SJJs4gGurQhILmT9oWMlVPQZsgxx7EaPVC5Ig/QNdxUZ2eVK0UJ8slWCfrMqUetDTbmJIvjPxUMqnY6qHgqQg8NzhHO5B6ylIBtXv66KtVU/9YT5UHERGaeyyhUkpk/6pk7zGbOEJU3uSVLI8kT0Qnrve8uy1JEGP6TMg4VO/lZFQrYbfN8h03sdS0XNuBycJZXhfObUuucttgvLnejpvLGOwbnNQ5mi9tw16CuydjuyziH6KoIGmzKNizQrxJsmdiC2+io+IPfiaJJu00h8ThEvdDX8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+iPwC0aW548Wc7j5hxwPlqPvbb6SJ3BNRlSjSzm5Dc=;
 b=SUXGiTOqn17no2+Q0sRq+Yz9SL9xqkoazjBflNtEKTiWtH38LRvd3U7hZ3WqRDDGg9AMc1q9RzZHcYGmq/l/EsFKzSayt13UkSn4JssKMy47vGMlMo9VN1h7lr8F55vGhgeeON/8f6LQKt9EDiMSfNAOH0HFtNnqe06IFTsibu0eP8ST38eDYnlgKzh+EQbt/8vNmcvsvopIgj0fXurLUQSamYhux68AGAczgBvP2iHxbwTjvCaEvaQ6Xp6E7IojDks7qXlK1qqKRyV3Qe/Ds4HW5hz3zfU9sp9K7CEixlZEUz4Qow/13T0msGUArvU7naoCh4eg+KA/2ix0UNkkBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+iPwC0aW548Wc7j5hxwPlqPvbb6SJ3BNRlSjSzm5Dc=;
 b=CwBjjMAUMv5qcgbIhrS+En/mr1d/Q3I/+qOOAJiH2jzJWy5UNz7V7iMOXQn8UkAg9s4kVHMI4egNsPNOshtM2yJQ/J6b7CDPxhnEjKj5La2ROpC5t9rlkj+dTu8u4EFuy8avgnXbEjC3zV3Mv56e6CDRpw4VMC66L0dRCEP7mAY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYBP286MB0320.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:801c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Sun, 12 Jun
 2022 18:10:21 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95%9]) with mapi id 15.20.5332.020; Sun, 12 Jun 2022
 18:10:21 +0000
Date: Mon, 13 Jun 2022 02:10:13 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, contact@canokeys.org,
 MkfsSion <myychina28759@gmail.com>
Subject: [PATCH 2/3] hw/usb/canokey: fix compatibility of qemu-xhci
Message-ID: <YqYsBRT9CuqqJyOG@Sun>
References: <YqYrIpNQHCBaOca5@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqYrIpNQHCBaOca5@Sun>
X-Operating-System: Linux Sun 5.15.26 
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: BYAPR08CA0042.namprd08.prod.outlook.com
 (2603:10b6:a03:117::19) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53c49090-da22-40bb-e0c2-08da4c9ed048
X-MS-TrafficTypeDiagnostic: TYBP286MB0320:EE_
X-Microsoft-Antispam-PRVS: <TYBP286MB03209D4EF528D62B73F09235BCA89@TYBP286MB0320.JPNP286.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4y19kVQ0WGHNEmOYqNsTrikBiX4nDhGYixHgUk+BIgCUmlxNzWTXSmWBhM2FcEY92gcK4r8rWyubPm8hZlDhUvg+yjtL1er5MO+XPL1WR15jnZRGysmKmZvA/50nvReJGIS2zlIq+cH0AZkQqc15jL7nxkdclDerdzUus9Zl0lMkBZwXvzgKXZBEWNJFqy3ShofVHCV08d8O691ndug1oEogviS1DPXxcLUiwIVbgpBigSqTNMYfEyE25hT8bPpj2rUgyDomsdTaD+g/gwHTNayzOTv9O5Ew+RVQUSv6vB2w6bTwXJhyC5Ewu0ehHK1scfCAGgLYy59+Z8ysv6/vDlejz6ZvfLvNlZpG/YY9H8IBZS2AjkyW8JvKnmcY464Y8XfOGO93tTZ09qvOo8BpBxyI8HKmh7uxOu7doepX9orX0tZxbzBC36gMO7dWIrsQAMmGkBo+Yvylv2fSaSamecIS/VqjWf3/VtdKOYPviMgc75eSWdr7ojpohDJrswS61s+u/xMuUeovKSHfCb9kyqzatLC6VxOv+fh1ghDvN0yL83Zz182Fa/Tb8EWT3OBCWGh4j3Jcshy0m3P2Sc6+JrYt3RJh/Asj9dnyVRWr7gZHg1t4k9hWm9KV7BsPwzn0pTnIOZrsncP9qCfV8XTzMBt3ZrMbsNGhS0yzmzPqEcagSTG/Hu77qHnNdjksDeAI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(396003)(136003)(39830400003)(366004)(346002)(33716001)(316002)(786003)(186003)(41300700001)(6916009)(8936002)(508600001)(5660300002)(6486002)(4326008)(8676002)(66946007)(66556008)(66476007)(6666004)(2906002)(41320700001)(38100700002)(52116002)(6512007)(9686003)(6506007)(86362001)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/ee1ZN22pzqdvfdtfH/Sbiu+dFZidbWb3+yxbsxeZKwrsxs67+LK/1UNfo30?=
 =?us-ascii?Q?keqrs6NelClwFJMnIIySWkgUIR9ywCkiyyhL2HqYpvQvrOdpP7o1lhvpBCj4?=
 =?us-ascii?Q?bEf5wR2IHaiua+CTt4RofDellJcjkV2Gx7z7g2vQV1baVnx0OTVO4pXF5z49?=
 =?us-ascii?Q?oJZPPOBP/+1oSIPuhFnzF3o4x1A4vdeVNZlZt0hDEqIY5BbpZzz4WOHlf/Jg?=
 =?us-ascii?Q?e3ol7gPOv1sA/XnO4EPbFV6oLw7KvjEtqWmh4tU+fArPgDM6b6oW53Oki1XO?=
 =?us-ascii?Q?u8og1kH+KRn6JIXjV7srGoMtPzKI6rOzyLme9taha0i41uh3RBc2foi9ykYc?=
 =?us-ascii?Q?KVA7CufAqQF0hcb7uPbJXKvmkHcVVNUfMebnDp2/meHwBZsGUQxglY2LVL9N?=
 =?us-ascii?Q?2+yS128hZaGzRw/iIREFzFgr+xtJowUvXcavJcIKzWnejhwvXsG75oZDChC3?=
 =?us-ascii?Q?JBMgN7XSDIWNX3E+viuJv959NBSDZ273s2wuNmfOUyRs86Q4VPTTftv4x1qc?=
 =?us-ascii?Q?W+mrzJ/aYThAaFXwbj09AB5uyQ0NJTsG0c5lR2GzakE5erClVR42mPKA/brx?=
 =?us-ascii?Q?N9a0lhgPSSDDdD308hAqa1QVn1SpoVPFXnk9tV//e3ONPkX6ekUleLMGar3/?=
 =?us-ascii?Q?Yy8cKzfeCbqRp3qmBg04ociSjEFNR7MoLt5pPTchlOgGZJu+n1SZrgCB0zqA?=
 =?us-ascii?Q?xlNGjoPrsLhWnAaFw/Hhy+pUPlvk2tAix4alPkbjbnEP9VqfTg8Y1QrcWB9g?=
 =?us-ascii?Q?CrkNOrdxj9KZP6Yoz0EwU9OKPdy1SUDhxYtrQIcaucvGrcygo2Rp8/PE/ToQ?=
 =?us-ascii?Q?ApJ7iHb7iDjeBKLWgGQGLHlPMmUwQkFxB5e3eaFy7PYwXc0lYdXcb/D/EO/x?=
 =?us-ascii?Q?anvfFXtFLhAu2ThJPvWKKfSCr1Z+UFx+Wvp535L3eWMk+Xwfe/1qnCDfyK2E?=
 =?us-ascii?Q?0oG/Bhic7yBJtr1pOEO2LfmwIspzDOEXTBM+jpA/mjYMEvzsP2zJaREOgwfX?=
 =?us-ascii?Q?gRBnwsxWaNXEe3f0XJj5KTMDev29AGRb9olxD/5s2WgSY154re+nqzJ7Wk17?=
 =?us-ascii?Q?KWzzF1UTgoYrHDciYakjQtEF3Wk3Olgb34ng79+T3/H+xxGKEHtTre7sH/tX?=
 =?us-ascii?Q?MTBUG26fYIEefMgJWaCxQmUfaf7YSLqQLHqeUXup8yjTWblfWxqF2aZvToXm?=
 =?us-ascii?Q?W3yb2+MwtDeI/WWWyvai1ifotyhFhBHN1ecDy5Mipg0YYho9p5B4JuZP8UEN?=
 =?us-ascii?Q?yzs0+lJ2Ko97GvEnw4T3QwsWi1uKCey6Fw2mC1RnVQFz9NYw6tm97TyM3kxz?=
 =?us-ascii?Q?5dRQU6PhHtXa3N9xF26f+IDYRcJkRBhmrAe9+s6rVkZ2uWNO8IU2KmLaRGXe?=
 =?us-ascii?Q?CyTHqm2HNEypfe+jc4njI23iY6fI0fKLZvD4jDqWN0F3bmtukOscPCctD/ty?=
 =?us-ascii?Q?m/ha004kO4NwCojsJNHn0JcZcFsAR3od3JY2aMfupEjsmiMjzO4XUXID+5+E?=
 =?us-ascii?Q?mGs4Wq0YhBDcm/1raKXS56ei2/I2Ecc5TH6nbL8BmBAR78auxcVqEMrGU/LH?=
 =?us-ascii?Q?zbCQZxI9pdu1wYC+dAhON4+mhZC0537gwXnYYbfBYc7k4TPwesvvDGISJPcO?=
 =?us-ascii?Q?JmP6sjdc/rgppKyTKNYUy/vu+eSx/5ZHDY628ZvF6gKj8TVYVSL9entGoT/L?=
 =?us-ascii?Q?3mCYVyBfyAd6MZuphVYJGJ2LUL75+L+O+q5lwHQ9uLcuVnPqhgyoR40lzrOb?=
 =?us-ascii?Q?jm8gGCbfTA=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c49090-da22-40bb-e0c2-08da4c9ed048
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2022 18:10:21.0264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /PIsFChLX2ZAtpbKkR78dGvDkfidaRaUSUPltISpmCByrw86E6AHDHwNi61EpNah
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBP286MB0320
Received-SPF: pass client-ip=2a01:111:f403:7010::728;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

XHCI wont poll interrupt IN endpoint if NAKed, and needs wakeup

Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 hw/usb/canokey.c | 28 ++++++++++++++++++++++++++++
 hw/usb/canokey.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
index 86548923eb..e5fa4a5ad2 100644
--- a/hw/usb/canokey.c
+++ b/hw/usb/canokey.c
@@ -103,6 +103,13 @@ int canokey_emu_transmit(
             pbuf, size);
     key->ep_in_size[ep_in] += size;
     key->ep_in_state[ep_in] = CANOKEY_EP_IN_READY;
+    /*
+     * wake up controller if we NAKed IN token before
+     * Note: this is a quirk for CanoKey CTAPHID
+     */
+    if (ep_in == CANOKEY_EMU_EP_CTAPHID &&
+            key->ep_in_pointer[ep_in] != NULL)
+        usb_wakeup(key->ep_in_pointer[ep_in], 0);
     /*
      * ready for more data in device loop
      *
@@ -135,6 +142,7 @@ static void canokey_handle_reset(USBDevice *dev)
         key->ep_in_state[i] = CANOKEY_EP_IN_WAIT;
         key->ep_in_pos[i] = 0;
         key->ep_in_size[i] = 0;
+        key->ep_in_pointer[i] = NULL;
     }
     canokey_emu_reset();
 }
@@ -163,6 +171,8 @@ static void canokey_handle_control(USBDevice *dev, USBPacket *p,
     switch (key->ep_in_state[0]) {
     case CANOKEY_EP_IN_WAIT:
         p->status = USB_RET_NAK;
+        /* store pointer here for later emu_transmit wakeup */
+        key->ep_in_pointer[0] = p->ep;
         break;
     case CANOKEY_EP_IN_STALL:
         p->status = USB_RET_STALL;
@@ -208,6 +218,22 @@ static void canokey_handle_data(USBDevice *dev, USBPacket *p)
             key->ep_out_size[ep_out] = out_len;
             canokey_emu_data_out(ep_out, NULL);
         }
+        /*
+         * Note: this is a quirk for CanoKey CTAPHID
+         *
+         * There is one code path that uses this device loop
+         * INTR IN -> useful data_in and useless device_loop -> NAKed
+         * INTR OUT -> useful device loop -> transmit -> wakeup
+         *   (this one thanks to both data_in and data_out being called)
+         * the next INTR IN -> actual data to guest
+         *
+         * if there is no such device loop, there would be no further
+         * INTR IN, no device loop, no transmit hence no usb_wakeup
+         * then qemu would hang
+         */
+        if (ep_in == CANOKEY_EMU_EP_CTAPHID) {
+            canokey_emu_device_loop(); /* may call transmit multiple times */
+        }
         break;
     case USB_TOKEN_IN:
         if (key->ep_in_pos[ep_in] == 0) { /* first time IN */
@@ -218,6 +244,8 @@ static void canokey_handle_data(USBDevice *dev, USBPacket *p)
         case CANOKEY_EP_IN_WAIT:
             /* NAK for early INTR IN */
             p->status = USB_RET_NAK;
+            /* store pointer here for later emu_transmit wakeup */
+            key->ep_in_pointer[ep_in] = p->ep;
             break;
         case CANOKEY_EP_IN_STALL:
             p->status = USB_RET_STALL;
diff --git a/hw/usb/canokey.h b/hw/usb/canokey.h
index 24cf304203..7261f81e80 100644
--- a/hw/usb/canokey.h
+++ b/hw/usb/canokey.h
@@ -55,6 +55,7 @@ typedef struct CanoKeyState {
      */
     uint32_t ep_in_pos[CANOKEY_EP_NUM];
     CanoKeyEPState ep_in_state[CANOKEY_EP_NUM];
+    USBEndpoint *ep_in_pointer[CANOKEY_EP_NUM];
 
     /* OUT pointer to canokey recv buffer */
     uint8_t *ep_out[CANOKEY_EP_NUM];
-- 
2.35.1


