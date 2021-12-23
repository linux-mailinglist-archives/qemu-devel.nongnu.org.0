Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E9A47E915
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 22:31:00 +0100 (CET)
Received: from localhost ([::1]:59236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Vfv-0004RU-6I
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 16:30:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n0RxV-0006pU-Rn
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 12:32:53 -0500
Received: from mail-tycjpn01on2104.outbound.protection.outlook.com
 ([40.107.114.104]:6822 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n0RxP-0008KE-UT
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 12:32:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eq1Fvhb1XW5OHprbyIemjdd0tzWpXZ/sT5U6hbO4WCTs50QjtJMBa3Zh3IAP3CyCf9itUPfBLGunkvlyZqoAk06ZdRv9oc56sGtKUMD0ze6i+nXYnmClJ+zNzFnI0sTvkmfWaF/wgswvkyOU0xUFAgz3YXMOktAtSxI/8aQ5/sDTAG9evRs1yvpP7Vn9+v9H/CVVZ1g9Zu8saZuMxUE56Zzv2Y+TAYhruHaxEp7oo8emT1AeWFrIueKRRp/JPvDvA1/dpOcZPITRG8Zc/d/YqiRWTSXJVIlrzNoigPGMe44jUfvWBMkwaqAl6kjCcMfRc81Eb4B18QtBDnQBTfrIcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKnTGdRaiu2tU6F8ve+i3ryHL1+UdsQav9uHq4EVfVY=;
 b=FjxyQU2RRWOCWfR1bDIPnTLntKiqtmGL7ptnpHtf5n6NobJnj4Mp94wIdtB3Wkohs6IHGuYqJ0IDiQxqVpxXxlzhNixDFlQwc9+rlwz7HN68UIaGhFg13m0BoLuvyqnLRlxXQXE/teM3K/TfOpTFLGml4RyvaA6QmdqbAULwCH3RrBW4iBbxEK97JfdmSNMYTyD/86OuyyjL4PN1zN+urnqC2tnuzfo3K2l7hp+Pxl+30mDp1sacGD8/gHRsJBtBkAoZ7oEsHKtYZyXXlE4TfTwzdqZjSN0lVW5HWY5kew5S9mj564Fo8PCKcrFEawXdKuOQ0pIT8M27HT7izDbGzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKnTGdRaiu2tU6F8ve+i3ryHL1+UdsQav9uHq4EVfVY=;
 b=sXT7gK5iUVxEGZciCzNeRJNF+DcbzVcjyVBIrpC3YCigbb5jJzA7ZNQEHxoD63x5Xz6htAbaGeMxI/mOTfPZimTxpm6WzS1sr/aA26Ey8crNPhXom6PXRLO39X1L/Lwk2sshfReRSxim5lgsPuBmGw6YXQlVYW2N+h2K4koJF8o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYYP286MB1374.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:da::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.17; Thu, 23 Dec 2021 17:12:34 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%7]) with mapi id 15.20.4823.021; Thu, 23 Dec 2021
 17:12:34 +0000
Date: Fri, 24 Dec 2021 01:12:26 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] Introduce CanoKey QEMU
Message-ID: <YcSt+qozrl+J8ool@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.3 (2021-09-10)
X-ClientProxiedBy: SJ0PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:a03:333::34) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66865667-046b-4fbd-d175-08d9c637696f
X-MS-TrafficTypeDiagnostic: TYYP286MB1374:EE_
X-Microsoft-Antispam-PRVS: <TYYP286MB1374817AA4CA618E8BC835A3BC7E9@TYYP286MB1374.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mLyh6HWkQZoihPeWF8xjwbLD7yuy6lw8NgZ1a0TAahs5tIPZXwloLNOYDoAz+9Lcor30/rpdSpAh27PTh+xv7ZCMRgI3cYZYvRv6g0WF2P1M4DXQtwB2MY6+o0Qubu/qFBwO3HLMg6IkEe9jTt3uLnw/iZ98Ivtk1+PSagtRHbqnUcBCVMrvemfS9BHbngL8xJyY1hoF1ll9b9QFkPXJXYkRH2m7o5d+f/LRHXpwMrRCEg5MFAWDZxLTePYt+fGUm8GhSuPFG4WvpESzlT88bOALE3/btJbPGXwFeopw+OMVWwH6492hx5fplDVI5nh+DCb+g9F2xa+S63Vvyiulah9dk8ZLQsGu5eumQac880sllXqLHA9E4qfY5Y3UDwLGzyOg/yuDiVSvGGsmWGKiyMUfzbSjEmFiPQAhU2Pc5RY2aQ+k3870YIkn9nO6sj+GEHbwIsDhyOgEQdr0oHfIvLtVlHUB2fenVLrB2Ebna73Z3S9h2rCZwEuXwMbFkNyWwLHgYklfEOpiahq3fnZrBI6qsy8dTno7hEvouzHYy3mKCFnYxSMuKBYnE6LeyQRMptXAXp7DH+g9L6G/V5q4m1rV0se7xGG0a7oT/aPDGuq3lcAf1kFdAuhyQCRRCdUoTBsVZB/dKyMk/bwJzR5rGzzC+Jr2NyZzOaZXxFWiEyWEiMR0JqPhJlSWd07ulRkbEi09p4YRBWJU7j8bIaNPp2IRew8Kc2dIJSNB2Z9nQalCPTz1SUvBIw+AXWcq3ghtLkgccD7jBqlBkEq+twtGlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(376002)(366004)(346002)(396003)(136003)(39830400003)(6506007)(6512007)(33716001)(66556008)(6916009)(52116002)(316002)(9686003)(966005)(6666004)(86362001)(66946007)(786003)(66476007)(4326008)(8936002)(5660300002)(6486002)(8676002)(2906002)(38100700002)(186003)(508600001)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?maEsaCzFYWE/nmJWWCehe4r/axhLPEnxMqEX4f8Alru3cZJKQ/eiTta+JUsA?=
 =?us-ascii?Q?1SS9egkMq2aTXCRi2Dj/A8W4sHXe0FZrVb7N3ZXBaNuG3miBWrE4OL63wW8V?=
 =?us-ascii?Q?603PpOAehdEaGnzbqO9VBLIdlHzb08H6ZNKRz/9RPlxzw4W0aT9S31hA/6de?=
 =?us-ascii?Q?cQKj0Ja77ui63hHqKRHWmsDFCb+nPH10yEw683nSyj1Sd1cGLvS9ghG4pf3h?=
 =?us-ascii?Q?brF+2CXb6AIy2l+a9C3hBQ5HwbTlqqH4Dbq/mT3z1MwHkvWqNPqHEYFQix2T?=
 =?us-ascii?Q?aiSq3t1eR3TPCegGd/FMaw1WSyV4FCOzVXhcwOfhLBbwZac3OSAxiNR8H3kZ?=
 =?us-ascii?Q?ybY8slamwvRx8NavC9TjcRQIWtohYZaVhpAEBmYJlRtHdSMZVvvykzZyZS1y?=
 =?us-ascii?Q?DDTmFek40Z+A9qraJ6Vf2OYakdhXnvUvqeT01TduO9/FtWWzS9Kq4pO5lI7K?=
 =?us-ascii?Q?0QNkXDbJCTazPZTOOkHSN5XZFo8nwrXfKFdv9A1VLaMf3CL9BJuxGS9V+hdY?=
 =?us-ascii?Q?77csTmQFrQBxEbSGWgry+Pf9oEtlD2fBggDE+hZ3K07I9WfVS3keUzHdNtUv?=
 =?us-ascii?Q?0uOVEhw2ORb+60J0QpCkej1YFd12qW2QZ69dKbBhVqHFRbHzLHvXZjByRvBF?=
 =?us-ascii?Q?7MmB2bHkmcr6St+4IBS3L7NBc11T8KV3JnYE4nuXMMFIYzeOD9cs/6GNvMQa?=
 =?us-ascii?Q?W4OHLLRwy/9m6rU+UYgWriDy+eSO3KOQuVBy4PwSYcZdPBf+v7UqoZQ5Wt+o?=
 =?us-ascii?Q?uNvmi1HZYyjhJuseVxBo69jfGDmmtG4x95ju7FZF1onpnZYSZqmwjfylbIMf?=
 =?us-ascii?Q?GpFYeQAuuT90iM+R2cY0soilr8+T06FSmdZSfAgY0P22OJgeUX0U2E/NyeRq?=
 =?us-ascii?Q?cwYEx59uEVwLT/64hIef5tVjyS21LogYB6LvPPrBX1Vdu/dtKyruQj/9Lzfa?=
 =?us-ascii?Q?Qova2BP+V+bLwz9JaXdaTaBzoYmI3aM4Y/ypbbKWC1KtBUi6hv91CA6cPqtB?=
 =?us-ascii?Q?uxfA9vP2xn6eaWIE5/NHKg+Y164Yf56nXboxLYmNIe4ko9qt8JKaEieWKzh3?=
 =?us-ascii?Q?GJrmjmga2H1iPo8mmklsYzUmtYyuMPBCLi5bdO6YWFLUrAcHAbRDUDhi9tSS?=
 =?us-ascii?Q?EE8scOXlmJSwGFIv+S3ZKtAm9pyBK83cdM4FZCO9z/ZuFWR6fWwCrsgb2Pe8?=
 =?us-ascii?Q?Oa4Jd3KVFA38fKH1K9tJ2K6SzdTK5h99P9fs8uN2IEQgAYR4RQurBGxcW6YA?=
 =?us-ascii?Q?TEFRgh0XtxwD61C+Edsdj+DQRT4j0eFFvpX3+gaCa7p4tojNByxVPlWmPd/X?=
 =?us-ascii?Q?uWDVUWUkYwebvD+7JOY2Qwll5lDQdIGjXJwm4sM68l0PIQb9GQqWSc+jQNDY?=
 =?us-ascii?Q?VMdgAQHoe/1OpZWIp8iPh05OZwX0PpF8dn3DzvfBAmdeuxGMqk22PhaCVArU?=
 =?us-ascii?Q?sYgleQeEmvM/kW6MOfWarIGVdr02EJF8MvAgXDOjlmwIt5l+LTpYSANC/L0/?=
 =?us-ascii?Q?MtHMfFxIfI3co52kfFhBCKvZYDC2brC1AnTkm1Cb73jGrVMZVFLfz7obXpoG?=
 =?us-ascii?Q?seCohS9LPWFWQluk/dW9hMUWjKlUypMMJTkEWo6h?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 66865667-046b-4fbd-d175-08d9c637696f
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 17:12:34.5790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jn7F2cIWeyPsBFkvB9FhMSkwIbpB1D+vKwfQh31gtAlvICJREZstLJPdquT1hRwo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1374
Received-SPF: pass client-ip=40.107.114.104; envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

- One sentense

With this patch series, QEMU would fully emulate an open-source secure key,
CanoKey, with supports of various features listed below:

 * U2F / FIDO2 with Ed25519 and HMAC-secret
 * OpenPGP Card V3.4 with RSA4096, Ed25519 and more
 * PIV (NIST SP 800-73-4)
 * HOTP / TOTP

- What's New

Although we have seen multiple emulated devices providing different
functionalities for different purposes such as U2F (hw/usb/u2f-emulated.c)
and CAC (hw/usb/ccid-card-emulated.c), modern secure key needs more advanced
protocols like FIDO2 (WebAuthn, in comparison to U2f) and PIV
(in comparison to CAC), which is not implemented previously.

Other features like OpenPGP / TOTP are also not implemented before, at least
as an emulated functionality.

- Why get upstreamed

At Canokeys.org, virtual cards on its own are for testing and debugging
on the key itself. We have implemented various virt-cards including
fido-hid-over-udp and USB/IP on our CI for testing and developer debuging.

As we found emulated U2F and CAC in QEMU mainline, we estimated we could
implement such features as well, which is good for testing since now
we can emulate the whole key as an USB device, and we implemented it!
as presented by this patch series.

The story doesn't end here. As CanoKey QEMU is a fully functional key and it is
inside QEMU, we think this emulated device could reach a wider audience
other than CanoKey developers: projects using secure key can also benefit
from it.

For example, this device can be used in CI for projects using secure key.
Bringing up a VM using QEMU with CanoKey QEMU, now we have an environment
with secure key, and we can test the correctness of the behavior of the code.

Another example is that as it is fully emulated rather than some hardware,
all traces/debug logs can be easily extracted, which is helpful for
developpers to debug.

One note though, using CanoKey QEMU as a daily secure key is not recommended
as the secret key in the emulated key is not protected by hardware.

- Implementation details

CanoKey implements all these platform independent features in canokey-core
https://github.com/canokeys/canokey-core, and leaves the USB implementation
to the platform, thus in this patch series we implemented the USB part
in QEMU platform using QEMU's USB APIs, therefore the emulated CanoKey
can communicate with the guest OS using USB.

Some note though, CanoKey also has a NFC interface, thus we can implement
the NFC part in QEMU and expose CanoKey to the guest as an NFC device.
This is left as future work.

In the meanwhile, unlike other emulated device which has a passthrough
counterpart, CanoKey QEMU does not provide a passthrough mode as a whole
since CanoKey has multiple interfaces which is hard to passthrough.
(Left as future work, passthrough via WebUSB interface)
You may try to use u2f-passthru and ccid-card-passthru to pass the U2F and
CCID (e.g. OpenPGP, PIV) part of a real (or virtual, referring to USB/IP)
CanoKey on the host to the guest.

Hongren (Zenithal) Zheng (6):
  hw/usb: Add CanoKey Implementation
  meson: Add CanoKey
  docs: Add CanoKey documentation
  docs/system/devices/usb: Add CanoKey to USB devices examples
  docs/qdev-device-use: Add CanoKey to QDEV devices examples
  MAINTAINERS: add myself as CanoKey maintainer

 MAINTAINERS                   |   8 +
 docs/canokey.txt              | 133 ++++++++++++
 docs/qdev-device-use.txt      |   1 +
 docs/system/devices/usb.rst   |   3 +
 hw/usb/Kconfig                |   5 +
 hw/usb/canokey.c              | 378 ++++++++++++++++++++++++++++++++++
 hw/usb/canokey.h              |  60 ++++++
 hw/usb/meson.build            |   3 +
 meson.build                   |   6 +
 meson_options.txt             |   2 +
 scripts/meson-buildoptions.sh |   3 +
 11 files changed, 602 insertions(+)
 create mode 100644 docs/canokey.txt
 create mode 100644 hw/usb/canokey.c
 create mode 100644 hw/usb/canokey.h

-- 
2.34.0

