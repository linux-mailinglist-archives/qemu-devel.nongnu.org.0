Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4000248DD8A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 19:16:44 +0100 (CET)
Received: from localhost ([::1]:57612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n84eQ-0002ou-Oc
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 13:16:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n84Yl-0000He-GE
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 13:10:52 -0500
Received: from [2a01:111:f403:7010::70d] (port=45377
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n84Yj-0001eJ-ND
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 13:10:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITjgWOywhhP4NCvoclvCuX8llqwBTMpJqvu4ESt+nF7H8FWeNGS4eqo/IyS0uV/D5GPwvf5S7q2KvI+rDCptjM73HQGDs2LrJ/zZ5o4dBokfVPVB/k41g4ZPn1KuPdus7qonfvJaiNakJs3XZFEbZpH6WCyQ6MFt1SKyu5IauzcsAtgOt0SXbQB/S1BCgbSS3PSpwnQqQPTQORW4D4pJZISnimLREj0iVQtEwQ57rRLQBIoqFiCgyL5wkFuCQDu/c+ULpSXTcxCuruZj/BD/CZXP+pqxqv7ldwUAdU21WbnI/BpnKlsJh7FF+AmjgA2BQbL12CEOpJNBki504V09Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udim2FuE295RaRqsTASFxBH7qLv79wLFB65K43Ezzz4=;
 b=R5+7dQIrbA0Pj4TDKTLhwhIOXwuHqKWwOmZrTkXDIpe6/EI3t/Z1nuLoRGFSpPlboLl+1iY9uXvFgWV6/A0Xsy3BX2gWH8CNm7zdMtNu0SKLdSaBukmC1C1I9HwVXPKA8ZYd2TK7KkOuFVb57Pkm0XktE3Mp2mPldA0YYa7A0WhxUk/YA5DCCPkKVc6yPoPvDjm3F3M75EJoNDseO8zZ42WcZTF+6Ug0tloIgaQkFrHyuXA6G/begT7GV1WaBz5rJKcsCYhaOCIu7ohLlV4sdv/FbULtVgxOwHY8+/tQc++wnYn0CJQcb6x/yES+cWQZ69+GvpnC9BkTmuRnZ+0GIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udim2FuE295RaRqsTASFxBH7qLv79wLFB65K43Ezzz4=;
 b=ReNoB55eGoHQiMyj9mgEUEfWaJBMrDHUBUD07Qd5GwR/tp+pbv3gnsUXPmZt9tVhUvQMXVPvrUbIwCSvWt1uRhm0ziO+jkUO68UGc0oq+CbCr8H1KYl3/LqRbIJs1CiYIEqFpxk+u/wbuLsvoPsxlcOHhvn01KggwQAyeYoTvCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OSZP286MB1166.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:13b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9; Thu, 13 Jan 2022 18:10:25 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%8]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 18:10:25 +0000
Date: Fri, 14 Jan 2022 02:10:23 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/6] hw/usb/canokey: Add trace events
Message-ID: <YeBrD9jUOACNoSuM@Sun>
References: <YeBqg2AmIVYkrJcD@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YeBqg2AmIVYkrJcD@Sun>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.5 (2021-12-30)
X-ClientProxiedBy: HK2PR04CA0059.apcprd04.prod.outlook.com
 (2603:1096:202:14::27) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00d6f694-32ce-402d-dd22-08d9d6bff925
X-MS-TrafficTypeDiagnostic: OSZP286MB1166:EE_
X-Microsoft-Antispam-PRVS: <OSZP286MB11669F2154A635A18A621786BC539@OSZP286MB1166.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xte+x9fpDfXnFH3bhzHMzbaibojlHDx6MA08UQMNvCxOtM89/7kh/i9GUd6z70pralzPjbRmH+yBjqP2zVCcdYNJKpEA4zDQYxHX5HjvYmrV8+SsFqOtl2Cl5+bbdtTt6azNnTalG++qhG5TB9Dqgm4WgJ8Dl5XV7I9iCsEBi0JrO7ea0EHEVa+02Ci/vBGG1C3v5+3f7J81cKdsa/OjPGcfyb/TPgTH5Ivb3Kgohl4jefnF2Kwh7S13fb0uMHgGN3emuq01aC7MmJRT930HmuU08qpzlSdIJY1Mboth+p1Bi30Q/k5Kzzzkck/uBJZ23Ja9PhetncMDG4MiUC8Z/+6lQfL2/U8ZrxE024XqUtqmdQ+1fZqW/ua6jLrn8M8/9DSjKRHXHq641DFG5WZCEvS5tQLbHtuGS0Sa90GRhJTAtrkX0NjL+ze8ncu/FAwwjXYqpNDfDTmbFutxDNijFaHZiIR+Ev6VnEKr6dpDAELMBPFUE9ckNCAUgAkFygZ4kiwuHF3rgDc81jtlhn7tnG2mJuK55bJLVKt1moy2cmnfUw3tFu70CbIH2M9ylyeMr//HC1C0UQspxXN0M5sLkW8XrS7iYK7/IeEGQ2bJjVNP4KL5eO3NgEef4aaSCNc0OoielxAoh9UTjrzQnxxwuf2ftHEU4KpBXcztSEC7sJ6ee45abWizlB+Tt1IMmvUENZW1P9uk7EcxPuBDoo8I/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(396003)(346002)(39830400003)(366004)(136003)(376002)(6486002)(54906003)(8676002)(186003)(4326008)(52116002)(5660300002)(8936002)(6506007)(2906002)(38100700002)(66946007)(66556008)(66476007)(316002)(9686003)(6916009)(6512007)(86362001)(508600001)(33716001)(786003)(83380400001)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KYG/6cHXfmWAo/OSaR5RDStY+2zriVCUij8CMh2siTnW/fRDU+u+EajEcxZW?=
 =?us-ascii?Q?HBoUlU39wwsh+c0kcl6LzywGhoQicRzvwpqqKxrwr0rS27GqVFDLfab6KWEe?=
 =?us-ascii?Q?rHkAWWhy2HEOwoSCqwKxE7BYD2f1ZnNu1zgctssCP84UMxxl9KroqWSgQupq?=
 =?us-ascii?Q?782kfQ3k7aZxxFxcq7WKWdQlgoeHFKh4PPWM9uayu+ne/yFg1uMNr8fbMoNl?=
 =?us-ascii?Q?nHpk8J/QFYQQAcebAqLmleaGA77SPfNVEBAF6pC2YljPQ0M3/tq2ndSMaiNi?=
 =?us-ascii?Q?rdQQIDJDXNsc1ucium6wxmieghQgQ4NhRFiIkED8dW7CEgz84plkqmXIQkLN?=
 =?us-ascii?Q?Ktp1Ef1F9zYsOKnurSGFZ5dn8nP4sXfl2sFWO3ktXzMp3EExXlYlgkEArWLM?=
 =?us-ascii?Q?9cSagJh0r42Gr6BW7FidMmdvp9QUhiUE7u6NXfq0kc20zE2Om53giAQ4zqii?=
 =?us-ascii?Q?RjNPHomRYGzjhZop2D2nuIuhtIkVFT3DcX5pJX6ipJtJM00ncGwJ4h0UtGPZ?=
 =?us-ascii?Q?aV2BfgfDnxsdTGQY5vg2xm1+aGfDL/kvEsgQLjb9Ewb6YpdUC5r78s4hyHd0?=
 =?us-ascii?Q?BUrRCByrvFXnMytTtI3PiD5iFJAQrZeVuIuEcbYs2581mP8FzZx/Jl3wzI/m?=
 =?us-ascii?Q?DCBCVUfDv50dvFbDnUjDmAlkYEHwCoiuEBYiUl4db1bS054MEfBhvmXAgPJo?=
 =?us-ascii?Q?zaZDhwjOCoqXGwGazfLoiq0GDYpC17FJfVY1TFh+pofqaXSqS8D0ZvKhfPpI?=
 =?us-ascii?Q?luLhVgpPs6KRztEIRluU2p8F7EZ/V/DxJqBN29Suyu2vMX1gxKH/WT7OlGRl?=
 =?us-ascii?Q?d92pIx3NFkTY+a7iCyBLsPPU/WQnuIF9Pp4TrFcgyZ3tIC2BkQQ2VmnNbPa/?=
 =?us-ascii?Q?jIsqrxDgV09VzolNccZyyfw4nLE1Gblx0y47pDKheHg0Tq1iy/OwubSZC808?=
 =?us-ascii?Q?DlgtoE4mCbnkj2C57KwSeq5bKczG0SP1+tgApw1z5lry6AfRO4xsO6bVzOeO?=
 =?us-ascii?Q?Od/hi8RQLztNdTzfY6XlKDs2vQ97BV0Esug/R8QLUoBUE4E1NYyHmTC1AjXr?=
 =?us-ascii?Q?T6Q/STab+t8vV7JgroyHZDkUh5hFEp6EJpn6gJhxPgfDGsBprvDq+wKh54Qg?=
 =?us-ascii?Q?gatu0BvDVCFp2X1FTnsSv7pl9gjlA10jTrD3MszJOrriD4Trn8egCwoRdxip?=
 =?us-ascii?Q?DEcxSy3+iZEmEnpe7ZR2zL/0Akhe/yKCzll8HDE4dH1LsT2qyLBmCVZ82IoR?=
 =?us-ascii?Q?HrJUwoHQBpVOaqebi7k5cUKTqYqYRTUAn52wj0vpzEdEZWRvJV4fdZeTUDTh?=
 =?us-ascii?Q?WI2/bc8zXM6wi3DJEKYQ0NshB9UNywKDULn8TPi7nLjjd+weyrMu7pZbvyga?=
 =?us-ascii?Q?y1yfSZvAWPbBP61Tq/ZpcXVQTLRv/W/c6HfqgYgBn8BBkrg0eXyRce19vAXK?=
 =?us-ascii?Q?6+wlJj0QzgagdhC4SCjYvLXri3Ud7CxMYCWTQRAj1CayF4ocO6kgFYuGNXOF?=
 =?us-ascii?Q?VzaxNP03cJD+QaZwdMUXaQ3uSPRyFptbz0FHFPbPvU1Tz1dD4Txd7YFxOs1k?=
 =?us-ascii?Q?OVU8AZmZTQmZCv3ERYKebAvarwSrkXI9agBRExcy?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d6f694-32ce-402d-dd22-08d9d6bff925
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 18:10:25.8303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBSQR3xjcQVHDASdoEgGAg+7mF5cfWOV/DilQ0iwRUZY0WU6eh1FUfqANkraP+eE
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

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 hw/usb/canokey.c    | 18 ++++++++++++++++++
 hw/usb/trace-events | 17 +++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
index 6bd4dedfd2..2899515b6e 100644
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
@@ -190,9 +202,12 @@ static void canokey_handle_data(USBDevice *dev, USBPacket *p)
     uint32_t in_len;
     switch (p->pid) {
     case USB_TOKEN_OUT:
+        trace_canokey_handle_data_out(ep_out);
         qemu_mutex_lock(&key->key_mutex);
         if (p->iov.size > key->ep_out_size[ep_out]) {
             /* unlikely we will reach here, but check still needed */
+            trace_canokey_handle_data_out_err(
+                    ep_out, p->iov.size, key->ep_out_size[ep_out]);
             p->status = USB_RET_NAK;
             qemu_mutex_unlock(&key->key_mutex);
             break;
@@ -213,6 +228,7 @@ static void canokey_handle_data(USBDevice *dev, USBPacket *p)
                 qemu_mutex_unlock(&key->ep_in_mutex[ep_in]);
                 break;
             }
+            trace_canokey_handle_data_in(ep_in);
             if (key->ep_in_status[ep_in] == CANOKEY_EP_IN_STALL) {
                 p->status = USB_RET_STALL;
             }
@@ -243,6 +259,7 @@ static void canokey_handle_data(USBDevice *dev, USBPacket *p)
 
 static void canokey_realize(USBDevice *base, Error **errp)
 {
+    trace_canokey_realize();
     CanoKeyState *key = CANOKEY(base);
 
     if (key->file == NULL) {
@@ -274,6 +291,7 @@ static void canokey_realize(USBDevice *base, Error **errp)
 
 static void canokey_unrealize(USBDevice *base)
 {
+    trace_canokey_unrealize();
     CanoKeyState *key = CANOKEY(base);
 
     /* Thread */
diff --git a/hw/usb/trace-events b/hw/usb/trace-events
index b8287b63f1..4ffed7193c 100644
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
+canokey_handle_control_setup(int request, int value, int index, int length) "request 0x%04X value 0x%04X index 0x%04X length 0x%04X"
+canokey_handle_control_out(void)
+canokey_handle_control_in(int actual_len) "actual len %d"
+canokey_handle_data_out(uint8_t ep_out) "ep %d"
+canokey_handle_data_out_err(uint8_t ep_out, uint32_t income, uint32_t buffer_size) "ep %d overflow! income %d, buffer size %d"
+canokey_handle_data_in(uint8_t ep_out) "ep %d"
+canokey_realize(void)
+canokey_unrealize(void)
-- 
2.34.1


