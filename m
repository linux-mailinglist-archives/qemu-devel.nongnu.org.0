Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19B9548541
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 14:37:30 +0200 (CEST)
Received: from localhost ([::1]:38572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0jJx-00019y-Tb
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 08:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o0iyT-0002gp-52
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:15:17 -0400
Received: from mail-tycjpn01on2071c.outbound.protection.outlook.com
 ([2a01:111:f403:7010::71c]:49824
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o0iyR-0008FB-Cr
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:15:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFnCTm0CN+2DjiKALR8xj7CpQUnEsjumR/EGThjQ28xv7I2/VNIHDWJL0lREj/UZFsJ2P8l0RSqAslvKq0ZaECmbU6+orjK2I588hA47UqbhTmV1Hu6WpxyKLRnDDRBIfOOzc9VfJUdv1PdQn/+qzUQR6QK7Mi46HDyTir0m0Q/q5WZtNsjA+kM8BuUJJd9V+uZae5R05PSovyuEu3xZjgN1CF17nK5y1YDFz0f4qCAMMtk2KmVtAyZiZ4B7hlHXVPU8tu2WVeQUN9Kb+YN5jT8ts2kdIkTPvc4mUVTdUISesm/vsd0T+CKw3jk8t9vcdj8hS4uH3Rttc/fd3PZgkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3K/S9hImB8/9iw1ti4noN/+PmQz4kConJmNHQfdEB0=;
 b=SVXgedXb+JWRnWqpY90PbhbKd1lj0zh8yd6o6MEqxwiPdqkjxQi+i3FSM35sJ97UksrCiLDFv/DlX32qMFYHqnbLowvu+tJ1qQttC9SjW++ZkUCa5YcQmGa0cg6aDVslD65QD6qBMInD7wEoGDI1DKJmhRS8AykgYWqB/C0lcwg9Qdf9KzpaFlrjCVIJ8l8TDbUXhLt59/9QViqUTrcPSjVU4vHlDnU4N4jmZY4l4ty1QpgU4Gfz+fExk0ir3mb9BVvInFLAWVckZ9OyWdbiH2V6RzT0Z52/BtA3uMFhMZ4YtmJcpWW8D/QxWkL4AYSrg8VBGKBoUNf5pNoMVdNd+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3K/S9hImB8/9iw1ti4noN/+PmQz4kConJmNHQfdEB0=;
 b=iAckdIL4LMKACwkZgKXCv7pYSuSaEApO/OJQyKKki51pawD07kdn7S2FwHJ9ADTP5Zr+s1BSK0MJLTJ5TA5Yp58m3pbSgIADQppiCnUGS+nxlKXruXhqBDZNKv/AzPYi1a9KDg3tKOuw9iW/5dcAspSZX3oFsYlIhnRcUUzdKJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OS3P286MB1494.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:17b::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.13; Mon, 13 Jun 2022 12:15:11 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95%9]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 12:15:11 +0000
Date: Mon, 13 Jun 2022 20:15:04 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, contact@canokeys.org,
 MkfsSion <myychina28759@gmail.com>
Subject: [PATCH v2 2/3] hw/usb/canokey: fix compatibility of qemu-xhci
Message-ID: <YqcqSHNpI7sXRNpZ@Sun>
References: <YqcptnhfCtUn2+T6@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqcptnhfCtUn2+T6@Sun>
X-Operating-System: Linux Sun 5.15.26 
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: BY5PR16CA0021.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::34) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 320a1292-1953-4939-3ebb-08da4d365d48
X-MS-TrafficTypeDiagnostic: OS3P286MB1494:EE_
X-Microsoft-Antispam-PRVS: <OS3P286MB14947164774EAA2C3DED89DCBCAB9@OS3P286MB1494.JPNP286.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uocVc/NRv8enC5tZuqigihQnww/nGkZ/cqZC4fzTnNtS8F29A5Kxsx+zofjjzNDgM8nR2cK5uzvmjYKUqmXaBKKmhPWsNSyQFJmQIMCwPPCmDD6ybtoxkKmK1bk/kja6jEJGdIOBCwR0KufINEV30pzkbidrFsFwRnSR8GG8AEV4lhXbBmFMN0l9SQmSxFpGy8W90V5Mck3cI1ocinyItRHWVpjcaGOiLyzpiPLJbPNMmdskadtOPT0kXJmPQeV8LfzORMEHjaH0ZP4wGTud5o5sql/uvrSeAkZFfxfYOyS8GwjiJbnv8V+nMDOKlH3wGXbZK2KMZKuejSNohUEL+fGq/52rIhkIOkJ4mNj3xW6twmcGTtKsFD95Dl3CGiGldC80W8kQRgcdYT85s26JnYFnYAKQD6pHNm4A1h6yiwx0BwCvEPr5ufz6Ar5isvM5bWTiXtELnPG/637Iyvv/DNdBMZ0TTMYS5rTonyZSv1inexKgGjgIUg7mlSRC87bi+WQ2OaET7+fFibozClI1az9fGJ2uwpAhbYRl0sCyAv17EdAfPVC7ol0KTmOFE8lv+IZk/XgUT7InrpxKPI4bCPb5YRtwNhnZmHa8J1NJOXcaM/tPjeewPrTNmcBNVcqI7IvzwW8gJHR84X2b3dCUtUeij9XiIeOOnzIV6su1BuREHOI3sVDzW5cZYjuFFGZ+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(346002)(136003)(366004)(396003)(39840400004)(38100700002)(6916009)(316002)(786003)(33716001)(52116002)(41320700001)(6506007)(4326008)(41300700001)(86362001)(5660300002)(66556008)(66476007)(66946007)(2906002)(6512007)(8936002)(508600001)(9686003)(6486002)(6666004)(186003)(8676002)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vdeI85qz0fxOW//qOMqVu9mIb/TsKbkx7+AyVa8IiHhnRXSLoyN+r77/jQ0y?=
 =?us-ascii?Q?08agvWMSVT7vE3PeEQGQKyNfAdU0VLklp6A3o1gKXXOA/fYKpWZZ1k7gxsGe?=
 =?us-ascii?Q?ifb3OrHpvSaBrg3gophUg4dehBsuoeQz2epnWmBzL0ZTuqPphGNzc+HMAhdq?=
 =?us-ascii?Q?uk1ixO7Ru8A4cx5tVkNPRyXs3lk9tJZg1OKfd9Z+n38EMGOiPATYARBFohC5?=
 =?us-ascii?Q?JWwdAHyhhlXEWsSAOOC4FuWAfp8oYofyaYvthPMIEbKtkK51bP70ksXNmcAZ?=
 =?us-ascii?Q?rKNKh8vw7RD8Y71fk/zmqnHTp84fU4GCmj3ymQ3i+c8IK2zi3GYoxce0PHX6?=
 =?us-ascii?Q?rfuvmIZHjKfyOLeAsBFDEL4HTkwlDylXgIkihEwy3P+aGvU9IvCb/74UYcJG?=
 =?us-ascii?Q?/ZhYqe1EsnKVyv+cilXlN/OTG0qV7F/t9YkcuNP5QLyQ2bGTULT6hy01Zqw1?=
 =?us-ascii?Q?xIOySt9g3CLDVIMh4V/T7rUhYc3enUR2HV1Re2y2ENtVhl2+ov5wwm6o50YN?=
 =?us-ascii?Q?aXKoKdAZKkBwgsYMWy/imQ6tehHXGm5tUzxOZGaCsRhu/kvhdnPAc1X7CGQi?=
 =?us-ascii?Q?Ltj5jDoEBBf5hDCGvhiEpQfwjOwziy09InZn5VYHRVm9gdLOCkT35zum8jVc?=
 =?us-ascii?Q?CH6FIzLMAYwQSU4gnrgUoaHrgIkILVOw8Gh95kEbH70226zLfU8rIBpmVJAt?=
 =?us-ascii?Q?D6DKQzAyCijFUUJ4X5bE5FD2VRFXxzLU+JFMxerS8q2NBcnwEwrBPx3KzzkN?=
 =?us-ascii?Q?9a7I7/vCTUiDjNg80o6aa5ZxK2Aq1iuzw5tz0y/WYX1qM4QnG7AkgiafZ9mN?=
 =?us-ascii?Q?w3tJEFvdo9H3MIVSdapJBMoL2wqQdOfsJYWBxOBqz2DIeTo2VGD9RKjBNSQD?=
 =?us-ascii?Q?m+h0v55ECKMuT+P3XhiuVgAhsxer6RkODVcnchfug0kgFsW20BwZXHauN0bp?=
 =?us-ascii?Q?jpzpLEtvLYnEh4unU+TdBixzJoCW7kq/yL2+h4V2w6XThE6xFBZ/jnf2KAwo?=
 =?us-ascii?Q?/52+GP1OG/PmxkkS4B+LAq4S4uM3Jg9cIxmp0H6PogNqzmi6mcAczPusEK2e?=
 =?us-ascii?Q?RlaioPAe9r5ZzATuwue1cJvCCS0lxlw8v6awX1Axmo64j2AsCTxy5zA9kK+C?=
 =?us-ascii?Q?KiXxUWijZvgQvUSqCdV8bpzfRlGxaVI4jLVhOninDzninOX6Pqn/CuXN7uQs?=
 =?us-ascii?Q?30T+x6guZmlWw6+Or5cB1gwQaYxlMspAlBelI1BEfd2GbSmMsu6QD7dgZTN6?=
 =?us-ascii?Q?QiEbaOpWwWuZ+I0dgDcaW+s6eYPMeg2jBXnX2z8cVfyJloz867XKCg9Uz0Ad?=
 =?us-ascii?Q?T9uNVgyhQfDlFsu3UiJJP9P3ClyqTpoXOn3GH33+fPH3aT7d4O0fsumP/M4G?=
 =?us-ascii?Q?0X4VhQtEgVYZZwbRQuuw0YlRR3MApxeuxa3v4sNr6vFR1nKQHN/NfCo+xY7W?=
 =?us-ascii?Q?O4wERIgwFZaNC3Sw+yHz1c7olidbuV0XIWiDXtbdzYWvEPqBTVQmYaefLeEp?=
 =?us-ascii?Q?CWdJ8qAOQ5cqPuX/XdPY+4se/40qXqMZ+jlAXYqSUdmI6GJXPpCUvs19Xo1N?=
 =?us-ascii?Q?8lROJzk+QUZvgta6moEodcInQrJhte75APG+ISO8E0zl2rHR7e91iJ1fO4Qz?=
 =?us-ascii?Q?d/3BdO+cGxbHPdi9909XxOVYMzXh1gWQSkJ1Z9QHf8OWtWsIETENE8mEdWsF?=
 =?us-ascii?Q?O3h1IZaEONek7eT8Xc3efyRcRpA4f7t++2PN5tL2dlqS2pXxwfSmXJNTYaMO?=
 =?us-ascii?Q?CDlL1rbx1w=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 320a1292-1953-4939-3ebb-08da4d365d48
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 12:15:11.5403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNOIhX/5I3olKpYonavPVb/9TOPGgpEMdozA1obugARkpNhT7em5PtxTQOvmCLEQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB1494
Received-SPF: pass client-ip=2a01:111:f403:7010::71c;
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
 hw/usb/canokey.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
index 86548923eb..8da0d65556 100644
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
+    if (ep_in == CANOKEY_EMU_EP_CTAPHID) {
+        usb_wakeup(usb_ep_get(&key->dev, USB_TOKEN_IN, ep_in), 0);
+    }
     /*
      * ready for more data in device loop
      *
@@ -208,6 +215,22 @@ static void canokey_handle_data(USBDevice *dev, USBPacket *p)
             key->ep_out_size[ep_out] = out_len;
             canokey_emu_data_out(ep_out, NULL);
         }
+        /*
+         * Note: this is a quirk for CanoKey CTAPHID
+         *
+         * There is one code path that uses this device loop
+         * INTR IN -> useful data_in and useless device_loop -> NAKed
+         * INTR OUT -> useful device loop -> transmit -> wakeup
+         *   (useful thanks to both data_in and data_out having been called)
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
-- 
2.35.1


