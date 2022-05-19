Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D37152D2C9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 14:44:23 +0200 (CEST)
Received: from localhost ([::1]:43570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrfVu-0001mO-Ln
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 08:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nrfRk-0006nW-T2
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:40:05 -0400
Received: from mail-os0jpn01on20723.outbound.protection.outlook.com
 ([2a01:111:f403:700c::723]:43512
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nrfRU-0005N5-EF
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:39:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOlpo64gFvpC5twBVki3Z03z/tFKQRqhOgnL6KMkgKXO9f2H40rX0c6L44+O8Ltu73Ul7h+If7Q2dMGORyGZHRACkB8XyyUc+yi0tsxwgYjd6iDv5WpJygZrR+zGK1BfAqLgipGVRyS7+m/ROmEdU67V6z9yCCC7mM2OBPFlPAVqSldkFtV/kAKHYrEUR/C4dXiHawYQSHEjtAoHghfbXDmf2b6EQWEKbwx1nAE66WgsyAlzRVDcZGtE+JAx6MXFBn0BxNv6SB/kiASKkrXkZOrAeamTC69QXMFuXjUQ0NZYbrQm/7/Gb8jXUJhMAdU6ZywCZZYc2lD/sJXRfyexpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJm0wwotQL94hKe1osYOGi8+1nATB70YGkLh/Pbh0ns=;
 b=geJXJ51ydK3bWNL9SF7rv/eQ9U1Mto9uiPX4NjjNM7xNpJWk63N2ryTixI4GeCMNr5ND6aVNXnM9bAmkLdQi1JKE+eNRBvDCmBKTql3/gQIHCz6diBO9wpkJHsKNEsc95gKr8uOPZPdIvZCjT3WYzlXyXdOckAajzSCt514dw3zqAHV+SzOBKnXp6fRnczwmnpuJ1GUvs43S0KvNN/i1V2CdYlaHhIxE65Km6+pTMAuicSmssBqRP2sao4Qt7tFmToObBbcDZwC+b0PkguKD8l2zgHaevcfnhCasCDoW2PQnqU/osPhbtUlKbOyFsEG92s92ofeChlU0Ck2IYGMnxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJm0wwotQL94hKe1osYOGi8+1nATB70YGkLh/Pbh0ns=;
 b=fK1u0FXetHSpt2wqurdl2NPQa7vLB4s54Q2giJJ/gRJfP59CdV4tEu5XU/ySIt89KWAO/pJcoeitLTcdmhyuogdBygGkGN0LNqKjgZMP7NBa62vlRB4lFJ7I34n8hSoFbVJGPEf9ST5c6qM3ZPLRBpHVRanILYhj/p1Fh3Io14U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYCP286MB0941.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:9e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14; Thu, 19 May 2022 12:39:45 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::bd99:5c83:e2dc:a8f7]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::bd99:5c83:e2dc:a8f7%7]) with mapi id 15.20.5273.015; Thu, 19 May 2022
 12:39:45 +0000
Date: Thu, 19 May 2022 20:39:38 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, contact@canokeys.org
Subject: [PATCH v5 4/6] docs: Add CanoKey documentation
Message-ID: <YoY6ilQimrK+l5NN@Sun>
References: <YoY5k0PQny8WtAHi@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoY5k0PQny8WtAHi@Sun>
X-Operating-System: Linux Sun 5.15.26
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: BYAPR02CA0070.namprd02.prod.outlook.com
 (2603:10b6:a03:54::47) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61fe58b8-47e1-46cc-65e2-08da3994a730
X-MS-TrafficTypeDiagnostic: TYCP286MB0941:EE_
X-Microsoft-Antispam-PRVS: <TYCP286MB094162B5C8E783447546B62EBCD09@TYCP286MB0941.JPNP286.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R9e3P92UFT0aKebkwjy1sTBKBWqnLhCPFMdjy8crzl7OKpcLJAoUkHgsDxeH0Cp99FFS83G+IdcQD+jZJPyBU2On7+jhqnW6of3HM9yxv6T9z8lGLcDk+N3fKxBP9+wepR6BTbTwWvA9uJ/SiD3BKEA2N0Eg2z6AdWsESyQrzAt09zIxeOF2vJkcXXKUu4ZBUdHxSk0b6QBCGEtkgFyXz+AIrHzWMo1HFgURu9mUNwBKCD0VZovgiV3VjO8gN/grhg7a9QtsIWForkLj/oOMSd/nThSvuetfzDf6W0qCKZyMvn0CoZ8iJqwRXYbmeWmxcK7JgqnZ5+ilpvjxHLiJm9XlkYpxmTAYS9mGZciDKQPk9JMjSZCXXfduVEESVUhycsaoQ3jsFB+13R9xXPbK3X2Dv4UjsClvwvU4RHvMOA/GLuMCLNkpe83zUa+3Z2ZbiPhgvrt7lwwYbMGpjnXp2R+ytXlvpqnIa3djloDm16ya2Mv4yPKwLWlFk5qChhrN73xjO/xkQxJ1j49xERZEE+ksF+d+Tv1S1YdGdUeR3pDc6LUBH4vOxjAWeR6LD2SajREFpojbaPoR39QyQXp1z51k3Olf07L3agw448TdsO/X7zFLgqNOPhvPgX2qPZFVYhGWbjsO1Px2u+PabceL358oIX0Gu95Be85LCs6W+nq2xbYKye6XJ3MrFKyhlk0JcTpz9/wpQCfih9GkV3dmc+HcdbmLIxjN9GHk7LRNzPnDV3ar5J2zzfGdYGV65zYkMvuLpgDTBnD7HVjBg4NtWHFlGv58mqz4L72qQIr3XRc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(136003)(396003)(39830400003)(346002)(376002)(33716001)(2906002)(41300700001)(8676002)(508600001)(38100700002)(110136005)(4326008)(41320700001)(6486002)(966005)(316002)(786003)(6666004)(83380400001)(52116002)(9686003)(6512007)(6506007)(5660300002)(66476007)(66946007)(66556008)(8936002)(86362001)(186003)(49092004)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ydtGwFzwM0+XNQsQgYlPFwogTvxU4+qjVPg2pMkHLtchKAw7xCgfqysl84s6?=
 =?us-ascii?Q?yNGhbpe6CQZaA3J8WEPt42H8rM6Ea6+xtIN1Ajh0a2A77FP8gM1NZdMgeBWc?=
 =?us-ascii?Q?Oz3p+R1B778cAIWcjvmEQ1U4DWNTvtTjcri2EmLFO0gX1UoYtVEMlQ27BT15?=
 =?us-ascii?Q?e1VV2oVevJjJjVVTANJmpuK3yVOsvmTPKECaX9nGWAZZd5//HfkifOtGAcVH?=
 =?us-ascii?Q?ngIkckR75BYmiVCapS/tC0BRWE/H2ntnKHdzCyAA9DJzXwtvQs7y+A7AO98I?=
 =?us-ascii?Q?Ce8mlCbBLqs04nbmxghW8P30Kqfua5KYoHcYUdSICEavcJXajrXlVIbi+b3n?=
 =?us-ascii?Q?Sy3SRQBD4o7dm43ftAda6n3JvLNGCLK8QGPGUkAwc8Cvnsfp1FSxl8oqONCj?=
 =?us-ascii?Q?2wygXbBDK8u7quy8TIjnufVU0HUKGiN1/oOp4PriB/M6HgL9RLwRUnH5QicH?=
 =?us-ascii?Q?hKdeRNrl+ke3HyFo81H6vq99sKqCYGYaHzZIVL/R/iSfZHhvH2CLKki7oeso?=
 =?us-ascii?Q?D4cE+Z3qDV7BZOG+N3cLON1EjNNQ2DKZxggdkb6A7mMRmvlBJZSywg8kRxhs?=
 =?us-ascii?Q?6YDVn+dScagbFziT6ChLSTCdAGIl66Mw8wjs2MdcxYD06zbNStl1lUtT8bEt?=
 =?us-ascii?Q?54WGNdZpRLbqUZ+2Q9sVP/hYAg4B0uEmv0u2BD3WT4D0jcD/HtOGQ58r2lTM?=
 =?us-ascii?Q?ID3O65rykf+LWfa7ASzOroZaRzA06rE/OHFYEaVLuhYvVIsgpBF3vDN4OMsS?=
 =?us-ascii?Q?OG8EJz679Dym9L6Qen0MLxEkNuOQIv8sGVHu6ozEm0lYU01td6Lw1ECes19f?=
 =?us-ascii?Q?5ly+fKOQQetdJR31kArFTJUo9eZlYN8DYhyEidji/+FmQxLAjRkgsSMzVHhz?=
 =?us-ascii?Q?l1bgbFND2XFsMCRB8qzdcY8f9/YYx0L3nTQRWRX1pPTR/383D61hsExUM2Ft?=
 =?us-ascii?Q?xmu/085QiBmGmmYRg4fxet2o+BlTjZYfI3dV8PUC9ig71X78QzMVH6H6L56y?=
 =?us-ascii?Q?Bbkpfv/vymH34StcMZButl6kLKYFrs94yQ0wIT7yKBWh78dGFzfK/RXJNMeH?=
 =?us-ascii?Q?CIXPgdx+YKFXtPV36NncjybG2PhS7ZOW3iVnPqoc/GcagbPIvtcoLi/WQl6D?=
 =?us-ascii?Q?h9vjRS6C9veOgWs6cdaijUQuUu0bZDnQb1RatwIirSoLiIh51cuQN+RqNV6/?=
 =?us-ascii?Q?OqYK8SE3y/m0r6xIQfvIgK2XdK2+6wHZT8v9T3mqFeU7xh1I6O4f0ONAitFg?=
 =?us-ascii?Q?3B+N6r01X9WdMZcBBd3YKCtHaf7jki/gN3Blzuh/0TkLIASo95PT6RmiQdPR?=
 =?us-ascii?Q?n77K9dY3JpfErfPDO024e+tKH7eyaI/crfpdeUdnyC3yepvqpEZPNb+Wpu7e?=
 =?us-ascii?Q?NENm06CPI2lRDIc7wAgUBnaZn0pgLwcrCpYx1Cw4mi5x6EetPATV1NE5i4/I?=
 =?us-ascii?Q?jHmHYW6t03QlYIvUppWkclpSK0iyDlg3PcHt8fYekscuW3GhJ4gxi7H14R65?=
 =?us-ascii?Q?Pn10NtC/62eFUj7BgX9ozV39X4nwurv8o9Ckw3SX96uUkdw2GQEsFHHasUXK?=
 =?us-ascii?Q?aDzqtvaef81SsPAZ6y4P5+4VbAvJ+AjDo7yOeLnyqx1i4eN0oV8jVs86Eznk?=
 =?us-ascii?Q?rxtQEsXL3RjB+8UJHe/TPYSqE92//iorTrI8r+odugHH/3NJfgeWJT0ZLJp5?=
 =?us-ascii?Q?WPDIqNwO3ZqT4BI9og2sPr7Vd/fHz9N2psMJwkwO5PFRi2pv0YvrpBer+5T5?=
 =?us-ascii?Q?u/3T/rPeeg=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 61fe58b8-47e1-46cc-65e2-08da3994a730
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 12:39:45.2727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wDQgHB+iqa3ky837ekgOhZ2MSaX+dxbHjuzOiYv3KRL4Qnj9faJRFTw29u8sex8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB0941
Received-SPF: pass client-ip=2a01:111:f403:700c::723;
 envelope-from=i@zenithal.me;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
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

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 docs/system/device-emulation.rst |   1 +
 docs/system/devices/canokey.rst  | 168 +++++++++++++++++++++++++++++++
 2 files changed, 169 insertions(+)
 create mode 100644 docs/system/devices/canokey.rst

Note on the qemu-xhci issue:

For FIDO2 packets, they follow the pattern below

  Interrupt IN (size 64)
  Interrupt OUT (size 128 with payload)
  Interrupt OUT ACK (size 64)
  Interrupt IN ACK (size 128 with payload)

This can be captured by `fido2-token -I /dev/hidraw0` or
`systemd-cryptenroll --fido2-device=auto`. I doubt this
is a feature of libfido2 that it sends IN before OUT.
I've been coping with this pattern for a long miserable
time, you can see the url below for a example
https://github.com/canokeys/canokey-usbip/blob/e9db44f1aa7f46c7dd7266a682d778921edbeb49/Src/usbip.c#L33-L36

In qemu-xhci, it assumes a pattern like this

  Interrupt IN (size 64)
   -> usb_handle_packet
  Interrupt IN ACK (size 128 with payload (not possible))
   <- usb_handle_packet returns
  Interrupt OUT (size 128 with payload)
   -> the next usb_handle_packet
  Interrupt OUT ACK (size 64)
   <- the next usb_handle_packet returns

However, for device, it can not ack the IN token if the payload
in OUT token has not been passed.

Also, we can not have a trace like this because we
are single threaded (not async) and the next usb_handle_packet
must be called after the return of the first usb-handle_packet
(emulating async interrupt ep with sync thread is painful)

  Interrupt IN (size 64)
   -> usb_handle_packet
  Interrupt OUT (size 128 with payload)
   -> the next usb_handle_packet (not possible)
  Interrupt OUT ACK (size 64)
   <- the next usb_handle_packet returns
  Interrupt IN ACK (size 128 with payload)
   <- the first usb_handle_packet returns

The code works for uhci/ehci in the following way

  Interrupt IN (size 64)
   -> usb_handle_packet
  Interrupt IN NAK (size 64)
   <- usb_handle_packet returns
  ... there are many IN NAK here
  ... uhci/ehci reschedule OUT before IN now
  Interrupt OUT (size 128 with payload)
   -> the next usb_handle_packet
  Interrupt OUT ACK (size 64)
   <- the next usb_handle_packet returns
  Interrupt IN (size 64)
   -> last usb_handle_packet
  Interrupt IN ACK (size 128 with payload)
   <- last usb_handle_packet returns

I think qemu-xhci should retry/schedule the failed IN token after
receiving NAK instead of failing immediately, because interrupt
endpoint is async. However, I'm not so familiar with qemu-xhci
and I tried to debug it but in vain. The debug trace only showed
that after the first IN NAK it retried and then use
`xhci_ep_nuke_xfers` to cancel the IN packet. After
handling the OUT packet, the IN packet is not retried and
the whole QEMU stuck there.

  Interrupt IN (size 64)
   -> usb_handle_packet
  Interrupt IN NAK (size 64)
   <- usb_handle_packet returns
    ... nuke_xfers
  Interrupt IN (size 64)
   -> usb_handle_packet
  Interrupt IN NAK (size 64)
   <- usb_handle_packet returns
  Interrupt OUT (size 128 with payload)
   -> the next usb_handle_packet
  Interrupt OUT ACK (size 64)
   <- the next usb_handle_packet returns
    ... xhci_try_complete_packet
    ... the whole QEMU stuck here as there is no more IN token scheduled

You can see that in canokey_handle_data of hw/usb/canokey.c
I NAKed for early INTR IN, this is what u2f_key_handle_data
also does so I think the bug is not in canokey.c
Also, canokey.c works with uhci/ehci controllers


diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
index 3b729b920d..0506006056 100644
--- a/docs/system/device-emulation.rst
+++ b/docs/system/device-emulation.rst
@@ -92,3 +92,4 @@ Emulated Devices
    devices/vhost-user.rst
    devices/virtio-pmem.rst
    devices/vhost-user-rng.rst
+   devices/canokey.rst
diff --git a/docs/system/devices/canokey.rst b/docs/system/devices/canokey.rst
new file mode 100644
index 0000000000..169f99b8eb
--- /dev/null
+++ b/docs/system/devices/canokey.rst
@@ -0,0 +1,168 @@
+.. _canokey:
+
+CanoKey QEMU
+------------
+
+CanoKey [1]_ is an open-source secure key with supports of
+
+* U2F / FIDO2 with Ed25519 and HMAC-secret
+* OpenPGP Card V3.4 with RSA4096, Ed25519 and more [2]_
+* PIV (NIST SP 800-73-4)
+* HOTP / TOTP
+* NDEF
+
+All these platform-independent features are in canokey-core [3]_.
+
+For different platforms, CanoKey has different implementations,
+including both hardware implementions and virtual cards:
+
+* CanoKey STM32 [4]_
+* CanoKey Pigeon [5]_
+* (virt-card) CanoKey USB/IP
+* (virt-card) CanoKey FunctionFS
+
+In QEMU, yet another CanoKey virt-card is implemented.
+CanoKey QEMU exposes itself as a USB device to the guest OS.
+
+With the same software configuration as a hardware key,
+the guest OS can use all the functionalities of a secure key as if
+there was actually an hardware key plugged in.
+
+CanoKey QEMU provides much convenience for debuging:
+
+* libcanokey-qemu supports debuging output thus developers can
+  inspect what happens inside a secure key
+* CanoKey QEMU supports trace event thus event
+* QEMU USB stack supports pcap thus USB packet between the guest
+  and key can be captured and analysed
+
+Then for developers:
+
+* For developers on software with secure key support (e.g. FIDO2, OpenPGP),
+  they can see what happens inside the secure key
+* For secure key developers, USB packets between guest OS and CanoKey
+  can be easily captured and analysed
+
+Also since this is a virtual card, it can be easily used in CI for testing
+on code coping with secure key.
+
+Building
+========
+
+libcanokey-qemu is required to use CanoKey QEMU.
+
+.. code-block:: shell
+
+    git clone https://github.com/canokeys/canokey-qemu
+    mkdir canokey-qemu/build
+    pushd canokey-qemu/build
+
+If you want to install libcanokey-qemu in a different place,
+add ``-DCMAKE_INSTALL_PREFIX=/path/to/your/place`` to cmake below.
+
+.. code-block:: shell
+
+    cmake ..
+    make
+    make install # may need sudo
+    popd
+
+Then configuring and building:
+
+.. code-block:: shell
+
+    # depending on your env, lib/pkgconfig can be lib64/pkgconfig
+    export PKG_CONFIG_PATH=/path/to/your/place/lib/pkgconfig:$PKG_CONFIG_PATH
+    ./configure --enable-canokey && make
+
+Using CanoKey QEMU
+==================
+
+CanoKey QEMU stores all its data on a file of the host specified by the argument
+when invoking qemu.
+
+.. parsed-literal::
+
+    |qemu_system| -usb -device canokey,file=$HOME/.canokey-file
+
+Note: you should keep this file carefully as it may contain your private key!
+
+The first time when the file is used, it is created and initialized by CanoKey,
+afterwards CanoKey QEMU would just read this file.
+
+After the guest OS boots, you can check that there is a USB device.
+
+For example, If the guest OS is an Linux machine. You may invoke lsusb
+and find CanoKey QEMU there:
+
+.. code-block:: shell
+
+    $ lsusb
+    Bus 001 Device 002: ID 20a0:42d4 Clay Logic CanoKey QEMU
+
+You may setup the key as guided in [6]_. The console for the key is at [7]_.
+
+Debuging
+========
+
+CanoKey QEMU consists of two parts, ``libcanokey-qemu.so`` and ``canokey.c``,
+the latter of which resides in QEMU. The former provides core functionality
+of a secure key while the latter provides platform-dependent functions:
+USB packet handling.
+
+If you want to trace what happens inside the secure key, when compiling
+libcanokey-qemu, you should add ``-DQEMU_DEBUG_OUTPUT=ON`` in cmake command
+line:
+
+.. code-block:: shell
+
+    cmake .. -DQEMU_DEBUG_OUTPUT=ON
+
+If you want to trace events happened in canokey.c, use
+
+.. parsed-literal::
+
+    |qemu_system| --trace "canokey_*" \\
+        -usb -device canokey,file=$HOME/.canokey-file
+
+If you want to capture USB packets between the guest and the host, you can:
+
+.. parsed-literal::
+
+    |qemu_system| -usb -device canokey,file=$HOME/.canokey-file,pcap=key.pcap
+
+Limitations
+===========
+
+Currently libcanokey-qemu.so has dozens of global variables as it was originally
+designed for embedded systems. Thus one qemu instance can not have
+multiple CanoKey QEMU running, namely you can not
+
+.. parsed-literal::
+
+    |qemu_system| -usb -device canokey,file=$HOME/.canokey-file \\
+         -device canokey,file=$HOME/.canokey-file2
+
+Also, there is no lock on canokey-file, thus two CanoKey QEMU instance
+can not read one canokey-file at the same time.
+
+Another limitation is that this device is not compatible with ``qemu-xhci``,
+in that this device would hang when there are FIDO2 packets (traffic on
+interrupt endpoints). If you do not use FIDO2 then it works as intended,
+but for full functionality you should use old uhci/ehci bus and attach canokey
+to it, for example
+
+.. parsed-literal::
+
+   |qemu_system| -device piix3-usb-uhci,id=uhci -device canokey,bus=uhci.0
+
+References
+==========
+
+.. [1] `<https://canokeys.org>`_
+.. [2] `<https://docs.canokeys.org/userguide/openpgp/#supported-algorithm>`_
+.. [3] `<https://github.com/canokeys/canokey-core>`_
+.. [4] `<https://github.com/canokeys/canokey-stm32>`_
+.. [5] `<https://github.com/canokeys/canokey-pigeon>`_
+.. [6] `<https://docs.canokeys.org/>`_
+.. [7] `<https://console.canokeys.org/>`_
-- 
2.35.1


