Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF09249DE7F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 10:54:52 +0100 (CET)
Received: from localhost ([::1]:39088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1US-00032I-2Y
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 04:54:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nD1MN-0001SF-7l
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:46:31 -0500
Received: from [2a01:111:f403:7010::71c] (port=58595
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nD1MK-0001n6-Bp
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:46:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3pVBAAwa8M94M08RhVJi8+hmNbaky06poiYELIP6XePIzU2f190TXU/Xtes4jq8zbon7FyatEdOwtazdO+Vbw8qJ7FjwUxy5NETFHZ0B4GeJiC6lyeF7NX/4mXBPPMd9bswqv/Iw8f7n6dOBhI3He8R7bNOhIRR6V5SbH4h1rkwFNLzj3+bGmLcySIdkbKTTd0n2j2F2diNEKsdr3Rbvem6/KTHkDhw36HXZoQugSfGloOqzcRKa5qekFMjq/q7L9QvDTK5wMuxpmlRVqfEj7pNJA/kGP4mUiJeZgweiy0wx4KOBsL5WR+OQuO+T7cqTFEXxeWxm6qa6s4XrLN2Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5Y++m9RJlvV56+46//se4eAvw1gT8kVSk3+o0mJxoI=;
 b=M0fQbecJShMAigj75Y+EfCHXzTK9S48ANubh0j3vjJibo6pR7OW9c7zqVAIsmy8lh5QO1eGwl2bkaH4LaYVbPq0iD3PUZ5hKL4+Thr8QsJqSi/uwXP5G92rfJuLnXOhEIpyNlWbDKAQY6cI1Dwj6DGIbCvI+rjfSTnIuqwiZHKFkQ2WAJ4J2diXj5eikQ/dLDr5CiKx0fr+kGU7xyBBbgrABUwudKg63mc1C8Vu/lnPM8Vsgp11PFVmHHxVOrh/AoSk8SuRIJQWq91qD194z5sMNXQkG837rFCEXTt9fMOIHuhyEuakBi5hAqNfhWaO+DO5ktpnuED76y7MfU/1D+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5Y++m9RJlvV56+46//se4eAvw1gT8kVSk3+o0mJxoI=;
 b=MVUKKlCzejQASO/9JhLz58x5fXXNTICdln9RI3rIln/kJybIP6WwEBmpCvSaq8L1KmlWfj8w6roWCq6Ng3TZQRKea1LtbyfsXRvEFQ9yaZFlgkSXY70xFGrMvSOUle7gHEm8F3iE4DbTwAFm2lrGlyYSgZDjvc3NfhoHQTT+wOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OS0P286MB0482.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:ac::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15; Thu, 27 Jan 2022 09:46:14 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%8]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 09:46:14 +0000
Date: Thu, 27 Jan 2022 17:46:10 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/6] hw/usb/canokey: Add trace events
Message-ID: <YfJp4jS5RJAd9t4b@Sun>
References: <YfJozy5qjVYh24Xp@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfJozy5qjVYh24Xp@Sun>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.5 (2021-12-30)
X-ClientProxiedBy: HK2PR02CA0204.apcprd02.prod.outlook.com
 (2603:1096:201:20::16) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7a29028-7120-4c91-e8b4-08d9e179db74
X-MS-TrafficTypeDiagnostic: OS0P286MB0482:EE_
X-Microsoft-Antispam-PRVS: <OS0P286MB048210DF7B8E6A5AC0D3E628BC219@OS0P286MB0482.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:161;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kJyT+P1efYRh1f5gL3gm9BBCRDS1cwuha2Hr68rIg9R8Vpgt6Hk76L39pRnHNsThwlifjXme5tpJTa2XfgNsvhg/iUlN43XSHIfVLle1Qy7KHiaZDpNqBDjUAVT4vruxDOy4GbjJPP220Mwq/89vOgNkqcQxa2bnF1HhmBJuF8PSqRWuu/4mUqzKrv1ADhdyvPBy4vKY+u1uD5iiUuGr592rcdSkZR55pSB7TxIt0Mau6kTGuAtVDOSFJJBanJLbuz2Wz1wsf2c0bRVmZkmGBGIoZVbvCGonuWE+ufDgXJ2RFi5menfWDjOzJK2Av4WYnBeuCOJySZyBzPWiC7AwopHncOsZFdUKh+f/YfCW6XyBAqh/BMU6dZR6MWv9e7UfUFMc+8yvnhsWn88yiH/dtVyqac9A0W2vu/v8jdhcsZIyVW/S8kp9Um4fKfkwyvqg93vAV6zsMuD14Muk49cJaZWfOR3y4nYCuNi23M8dmGh0NG+ZEfh1xsn+CPc1JDNWFXL8BKEGlswraZrI0BCEturT1JDn4HlltGlKascgbJYYoz9quIsGhpl6XeBU4HCjBRztlJ+4dWwWwEWn7RVFm6jf0nnG5JKphJ0Y5jJJJ1kIr8ibDc1qYbwsEJTSQEFq+U3YuvtzUueMouBB1WZh4vjj3XD9Q7zAQRst7SGUSr9nwJvSmZQTfqu3u2W65mJaus5y9GKLv9guFHvqJ7LBwA0gb4tzCyEjKcJr03d+v8Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(376002)(136003)(39830400003)(366004)(396003)(346002)(186003)(26005)(9686003)(86362001)(6666004)(6506007)(6512007)(2906002)(38350700002)(38100700002)(508600001)(6486002)(33716001)(83380400001)(5660300002)(6916009)(8936002)(66476007)(66556008)(8676002)(4326008)(66946007)(52116002)(54906003)(786003)(316002)(49092004)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yB2cL2gooMA+e5CYw7rjyzbNk13rn66FMfc0jZyhluvjGiglIY4VTL1OYKcl?=
 =?us-ascii?Q?NefqC6jgQxwMIQa0Jf3FIVN3hquw+nhJ05TkawkcC3OcqxBdWPe3vrtq2xrn?=
 =?us-ascii?Q?Th7rEJgBTbQZf+T1vVArocjkRn21g0P2trc3YFFdMG75DhR5DozKrYWwA/aH?=
 =?us-ascii?Q?pvCfMFZwdi4MqbMEueyggTpTm4TrtDym0DR7c+2ez/zMNwRIxv9NBAJtd35v?=
 =?us-ascii?Q?NJzR5UAqMxxKxRP2LAXBlJR+m2R0+RR3QpZfvJHNVRwL2ugpAH+/cSwZ27ot?=
 =?us-ascii?Q?79Yl+GP85RzxZ02iWRBNEmjPQSi6G8wUNeHn091HI3qm4ROZXTCljgx91dXB?=
 =?us-ascii?Q?aDvuYcjSidojNce/v7PMBq7RNu9wmS+dn9zgxOoyas326Bc4d7JGnWmFbpZh?=
 =?us-ascii?Q?39G3IXi6ykgULIKjJqeaRFnFrfi859ErKEdHzNPRHbCMj301bztwGtbM2V2+?=
 =?us-ascii?Q?/0WP6TuAEtJojcbcmlLkSIG1Wrhgo0tBQI3PyNACtHLIXgwFrM7rHqLL/8tz?=
 =?us-ascii?Q?kX1pqjuBiA4HENuD5BTXzw1gaz3gsOarixXozPergZErJAF0zhPNOYOwNGxi?=
 =?us-ascii?Q?z5yPM0T2QDv8opdOWIn25LLqHWI2U76/HapFr+2FYG/9rIzmgnNT3FPb95Tk?=
 =?us-ascii?Q?Z4v43MdkuKwhgYS27ly7l7w6NRd5tfmDwjpRX/Hu3Tzk93oiXybFcgQKEzCf?=
 =?us-ascii?Q?/xIuOJ2GHKWKWrg9fOJlH+uPMcKNrToxnsXvImzr3UCJ6h5tZdZA8+6L8NVx?=
 =?us-ascii?Q?fd1yIsPqTVgIJLuvhzqtRHPEGvrZRbW+RdWGygr2n222wQBDDMV1Tg2ee5Ll?=
 =?us-ascii?Q?5JaqyKAF/XYOfxA1DUFUMwPfCbO6Z46vB1Ks29CDA4rzRU5dJfAPaMPKxWqL?=
 =?us-ascii?Q?DYBcWVocXX3/jhH6wQ8U1220gwXroeiwM+m6jZDtwPxnWNsnHzUjmRuvh2mM?=
 =?us-ascii?Q?qpPg6RXTOiMq0oTpcWU6pkf/zE8O4T43+EeFPoBqbtZ9SsQyx7iXQz9krQes?=
 =?us-ascii?Q?tCfRvOoMZ+QxsVsmr+eIu3zscLve6dRXHB8o3ryKVe/akjYhhND1xTPxRbcj?=
 =?us-ascii?Q?jTl/WzYPLj3MJ0RRMiMIbirwmmjz8vSYFv3icvrmS31asomQ3k4QEmW+67b9?=
 =?us-ascii?Q?nK0Ah59tWw97Vh2pw2yj1xWAkp0osqYUsH6cs8MNbJMmmHRpWb7Br/wxl0dF?=
 =?us-ascii?Q?f4jKynNGAlLJ2FH6nABg+5WowsaSi1p6paE4bwVRcfNI32jtdpkGSsUuYKKv?=
 =?us-ascii?Q?f492UNQUg/J9xRIuXlTepA+DsabD2MVvTHhIYWD4xw8/dYHSvGADDBusRiFQ?=
 =?us-ascii?Q?EykkRC1T8DXMlbqkY8r0mncmI/WXk4WHiastyyGVycuWs6xayvbKTrWnhuWN?=
 =?us-ascii?Q?kNCF5tzmPuxYtyzH0C5eR0xDgECJ0FmYGMIsYU5fI9GmgCnm08VtTJZmevKI?=
 =?us-ascii?Q?/Fscq1+AkEYLZrsedJD6HkHiDiblvX1LMoXh42EgYlIrIak/awosBmsva+Oy?=
 =?us-ascii?Q?McpJFEAm9SwsGPnGvT7D5TnyFrbugt3Csc/FjsEQYkqujC8OXOOrLTyOnRvs?=
 =?us-ascii?Q?Vav8fG/EQOd1PJ+jbW4=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a29028-7120-4c91-e8b4-08d9e179db74
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:46:14.0987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5X9Ab4WfXd2Z8966FP+alcd/jGpkbBRj8Y2t8I2LOCALV1iKaooezsvDPVyK6LG
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

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 hw/usb/canokey.c    | 13 +++++++++++++
 hw/usb/trace-events | 16 ++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
index 3c2efa43fc..1753a30be9 100644
--- a/hw/usb/canokey.c
+++ b/hw/usb/canokey.c
@@ -14,6 +14,7 @@
 #include "qapi/error.h"
 #include "hw/usb.h"
 #include "hw/qdev-properties.h"
+#include "trace.h"
 #include "desc.h"
 #include "canokey.h"
 
@@ -65,6 +66,7 @@ static const USBDesc desc_canokey = {
  */
 int canokey_emu_stall_ep(void *base, uint8_t ep)
 {
+    trace_canokey_emu_stall_ep(ep);
     CanoKeyState *key = base;
     uint8_t ep_in = CANOKEY_EP_IN(ep); /* INTR IN has ep 129 */
     key->ep_in_size[ep_in] = 0;
@@ -74,6 +76,7 @@ int canokey_emu_stall_ep(void *base, uint8_t ep)
 
 int canokey_emu_set_address(void *base, uint8_t addr)
 {
+    trace_canokey_emu_set_address(addr);
     CanoKeyState *key = base;
     key->dev.addr = addr;
     return 0;
@@ -82,6 +85,7 @@ int canokey_emu_set_address(void *base, uint8_t addr)
 int canokey_emu_prepare_receive(
         void *base, uint8_t ep, uint8_t *pbuf, uint16_t size)
 {
+    trace_canokey_emu_prepare_receive(ep, size);
     CanoKeyState *key = base;
     key->ep_out[ep] = pbuf;
     key->ep_out_size[ep] = size;
@@ -91,6 +95,7 @@ int canokey_emu_prepare_receive(
 int canokey_emu_transmit(
         void *base, uint8_t ep, const uint8_t *pbuf, uint16_t size)
 {
+    trace_canokey_emu_transmit(ep, size);
     CanoKeyState *key = base;
     uint8_t ep_in = CANOKEY_EP_IN(ep); /* INTR IN has ep 129 */
     memcpy(key->ep_in[ep_in] + key->ep_in_size[ep_in],
@@ -124,6 +129,7 @@ uint32_t canokey_emu_get_rx_data_size(void *base, uint8_t ep)
  */
 static void canokey_handle_reset(USBDevice *dev)
 {
+    trace_canokey_handle_reset();
     CanoKeyState *key = CANOKEY(dev);
     for (int i = 0; i != CANOKEY_EP_NUM; ++i) {
         key->ep_in_state[i] = CANOKEY_EP_IN_WAIT;
@@ -136,6 +142,7 @@ static void canokey_handle_reset(USBDevice *dev)
 static void canokey_handle_control(USBDevice *dev, USBPacket *p,
                int request, int value, int index, int length, uint8_t *data)
 {
+    trace_canokey_handle_control_setup(request, value, index, length);
     CanoKeyState *key = CANOKEY(dev);
 
     canokey_emu_setup(request, value, index, length);
@@ -143,6 +150,7 @@ static void canokey_handle_control(USBDevice *dev, USBPacket *p,
     uint32_t dir_in = request & DeviceRequest;
     if (!dir_in) {
         /* OUT */
+        trace_canokey_handle_control_out();
         if (key->ep_out[0] != NULL) {
             memcpy(key->ep_out[0], data, length);
         }
@@ -162,6 +170,7 @@ static void canokey_handle_control(USBDevice *dev, USBPacket *p,
     case CANOKEY_EP_IN_READY:
         memcpy(data, key->ep_in[0], key->ep_in_size[0]);
         p->actual_length = key->ep_in_size[0];
+        trace_canokey_handle_control_in(p->actual_length);
         /* reset state */
         key->ep_in_state[0] = CANOKEY_EP_IN_WAIT;
         key->ep_in_size[0] = 0;
@@ -181,6 +190,7 @@ static void canokey_handle_data(USBDevice *dev, USBPacket *p)
     uint32_t out_len;
     switch (p->pid) {
     case USB_TOKEN_OUT:
+        trace_canokey_handle_data_out(ep_out, p->iov.size);
         usb_packet_copy(p, key->ep_out_buffer[ep_out], p->iov.size);
         out_pos = 0;
         while (out_pos != p->iov.size) {
@@ -225,6 +235,7 @@ static void canokey_handle_data(USBDevice *dev, USBPacket *p)
                 key->ep_in_size[ep_in] = 0;
                 key->ep_in_pos[ep_in] = 0;
             }
+            trace_canokey_handle_data_in(ep_in, in_len);
             break;
         }
         break;
@@ -236,6 +247,7 @@ static void canokey_handle_data(USBDevice *dev, USBPacket *p)
 
 static void canokey_realize(USBDevice *base, Error **errp)
 {
+    trace_canokey_realize();
     CanoKeyState *key = CANOKEY(base);
 
     if (key->file == NULL) {
@@ -259,6 +271,7 @@ static void canokey_realize(USBDevice *base, Error **errp)
 
 static void canokey_unrealize(USBDevice *base)
 {
+    trace_canokey_unrealize();
 }
 
 static Property canokey_properties[] = {
diff --git a/hw/usb/trace-events b/hw/usb/trace-events
index b8287b63f1..b0fe383eb8 100644
--- a/hw/usb/trace-events
+++ b/hw/usb/trace-events
@@ -345,3 +345,19 @@ usb_serial_set_baud(int bus, int addr, int baud) "dev %d:%u baud rate %d"
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
+canokey_handle_control_in(int actual_len) "len %d"
+canokey_handle_data_out(uint8_t ep_out, uint32_t out_len) "ep %d len %d"
+canokey_handle_data_in(uint8_t ep_in, uint32_t in_len) "ep %d len %d"
+canokey_realize(void)
+canokey_unrealize(void)
-- 
2.34.1


