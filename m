Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D2C4879E0
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 16:48:35 +0100 (CET)
Received: from localhost ([::1]:48126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5rTm-00011M-EP
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 10:48:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n5rRx-0000Ku-Gb
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:46:41 -0500
Received: from [2a01:111:f403:700c::71e] (port=29582
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n5rRv-0005z8-7S
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:46:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QItr2o7C8odrDhwKR4V74NrxDrPh4dZ+1l8CtOuXBqTVm12P5DPGaYulunZgqNIobQP422p9Hr2jHbSTNtzcrIfPUxdV25rjJ+IIakbL9xCA4JfqVSWT0n/ASnGlBLpg0Vgs2fX4jS7o9LGGpOwHR+/tm0hZ/DGbSBI+4wNoKUsH03t1vOtD+7su6ekun4AopaIAuMtn9Mlh02SyLCfPovZkz5DDHiTyvt2yoNI3n4OGJgL5N3ywHES14KzVzbY82gCmW+8uLFg/LU0qux4jhbYosJuQEqllDpYDR6QqjZoGkVaVxXnWyfdwmY0xm+Itlt4U/64WzBquLwdprsajfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTOCydRZ51HT22X5833Mg/Jwl5CAy7DV9lhZnzyIt+o=;
 b=AfDGEaMNccJ9peaIKF1SMj5DjVdBFOIsfU7Ys5PUarJ7X96lt99OdrCq4M9/aI1mCNhXRHZIMZx5E/Fgm9hDoqaqtUyzaQL6JQ3ywOfCGmsVJD3r6dhQS+76u81Dw7WYPssJLqx5PZTCHTsEAPSU7G9McOdt9EXcGuCAhyzed7rd/k0j7QhSOBk06afDT+trtf92s2xEQFaW33mTk6s5EVkNeKGywGmqf+4+ltRUYfbRSqTp/n3lX/C+LUzK0kBwegCZGDbLSIxMPy4iaX45umV1r7gf3FLWkeDG4bMgcDKxbO400XxMb29Jy54FE8p/gIDXv3P08OIjYn3N6WafqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTOCydRZ51HT22X5833Mg/Jwl5CAy7DV9lhZnzyIt+o=;
 b=UUidUZL2UTsnsNsw0R1eASkDY4xmFYxiQQO/KfZL7uocbAUP0V4Nlq3Hq9uIgPjRbb+joVoU3C02QsWE9ZcLIMS5MaQDrv0DINc+C3LZsfynjYBLnIxkREwTSW0w00BjQqUEsPJmqjipZwq56SVdrU7LateIYKdzb/OoIRPxjFw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYBP286MB0432.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:801d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.10; Fri, 7 Jan 2022 15:32:03 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%7]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 15:32:03 +0000
Date: Fri, 7 Jan 2022 23:32:01 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] Introduce CanoKey QEMU
Message-ID: <Ydhc8cTsH0QNINT/@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.3 (2021-09-10)
X-ClientProxiedBy: HK0PR01CA0063.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::27) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a70f5620-4260-488e-ff5a-08d9d1f2dad4
X-MS-TrafficTypeDiagnostic: TYBP286MB0432:EE_
X-Microsoft-Antispam-PRVS: <TYBP286MB043282C50F436E3C242BE7C7BC4D9@TYBP286MB0432.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K/px7aC7iWhCDTz0RiHmDooskybswgy8xyLY88VzvKgReM4tJH+bmIfMmezP88pVYz+m6ezVXT/nIm9u6AHLNN5fG86jRhE6pS8a/Yfeihm5k4ZyLX0x0yTSB3wRyKktaTXjKdOPjeM3LvgFRRAchnEZ0oEXAcKZbsS7LxI1GvPjKxvNEBzgc4fWnfTovKzJENa/LdOUJb2qO74gHaEmYPJ8JJXDJlbQfxrwt4S3iDI9YUDLLjjb/r0VgcMKuziAke6MeLWh5roqYLzOtZAEda5eLdzqajontAggjnQ+vv/GLQrlqmADZrQJuyACNu4nRVwfRh572Tpk1ByIdvyd/qnR7mfNMPaSDW1MKhMwSUm7GOrrtRbo/EfzX5oaWXuCErxKKuC7DMQrRw2QvjkJkvtxhbiR+CfdIWaNPZ71KR4y2wTfENDKcLSRPQMfJOyLSG7GBsxDY5mEuU6RfKZUXIVd7ayOTlaD7ODrR+NsRFzxtXhWgSV5wavvC/k3HMbUO2Y/Z9sPHHv3/Hjf3b0e74fMTaQ/tEvCJh069OA46ktY8/f/dpoePyXUwuaFMFZ+ShgOkEhqv0bNaRJhgbIFO2LcYxr5ZC1iI3SHixTGTrtHKr+9dmJuokjxvyeADRlBqHVoadXABmXjmSl0x0HkUZKyjwdjJdEceCCVO3YfijyD86biwliy/vZ3VSEIHaPuQzJg1I2fMXyMlKFbp73t648E8Jtr30CRCEQDTtCQc8yvhq8epENXb9o+yVnXl1ebPysSkWiewR8xZF3jtCW9rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(39830400003)(376002)(136003)(396003)(346002)(366004)(4326008)(6916009)(66946007)(9686003)(33716001)(86362001)(2906002)(6486002)(54906003)(786003)(6512007)(316002)(5660300002)(38100700002)(83380400001)(66476007)(66556008)(186003)(8936002)(52116002)(508600001)(8676002)(6506007)(966005)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dXUHeeZuc40Xeppm3Mr6NgGUYijJYbLxmE0gJgA/KuOxDxe0mq7RXdNEgFp4?=
 =?us-ascii?Q?EKSLJCoPJLrYP+A4m6suVUt+L+yccrvK+neXXcDos+DDRRGO/HCbq/HTyEb0?=
 =?us-ascii?Q?dhR/tiyZIz5ZDmSPL7TKRlp3ZPPMuvIDM2W64kyrLx2JSqUJtnO1FusB6lSV?=
 =?us-ascii?Q?SA5kqIzEs5BDcxfBOOjAJaai6nBrtDnSP9OeEjqHVTlW76KvqWLI9yfu2iTe?=
 =?us-ascii?Q?Y5WfpeqwyqpTV436PTNG0JrNtc78ogfUaRx01xAU7QXUkgiddBZ487JHsVUs?=
 =?us-ascii?Q?7X9AtWmnw77jWyKQ/i4kzxOOwvuKvnXrquwzY0Wv7qCtRu2xU/QjKGmdHurn?=
 =?us-ascii?Q?dOm6LI7urQ6Gi2FVOGBp7ZtsN17f/jPSIN3KjkiIZCQd/iR2Kw/i/eps2UTN?=
 =?us-ascii?Q?o9g6s55Sg7vobobPZ7SyZKI/5tFF2JKeejh99e9Exr0bIYTqs35vUr+Oorch?=
 =?us-ascii?Q?rs9CeSwR5qP7N0xNRkfOFcHcPbgsBIDBdp+COjv9+54Keo554h0GQAbQb9Yz?=
 =?us-ascii?Q?BDt7Ji1tkVmQJraKY8dwUG4fi/ULHh9cIyYA33n9qIG29cWX7AXmCzbemiMG?=
 =?us-ascii?Q?SS0cE+/Ejc6jnKc6rHBEYzp7XmadalFBuVb9slYSIFRdPZ9RXswr6oUYjKMW?=
 =?us-ascii?Q?5r4javtRqylLZxMqISIBzaSvGEvvPMIF4SiVsxJRM0Pmd/2V+i6Qy8ANxGVW?=
 =?us-ascii?Q?I4UPZVB1MbQ6olwaXQ3wkLU4aO4yOuHj/UyDi13M7Byh1cPWmzpd7pY+oloH?=
 =?us-ascii?Q?ODeIpq1ecZmKCufdGqd6Y/m/SCOfrGv6oROQhnWvTcprRx3aNDx/G3yVzblh?=
 =?us-ascii?Q?f63QkNsyf1oGWg3r3guwoY0t0IDSJf6IJTdAjhFa1EKWQMjMGw+9caRBK6vB?=
 =?us-ascii?Q?N63rNwxt89fBbgpWHsYplELSfwraylkPtxGT2EPF77mHZtckJrB9dORCrmka?=
 =?us-ascii?Q?j0ywKmyRTdNOvCdzzkj1TnzCs70EeFIf4mTvDRct2cm0vhXtcCRrQyHIDqEy?=
 =?us-ascii?Q?eRfNq3w8SSruyZEJKDxhoViv3x+QvTn0CDUIpIRE2OowNnmtLmeuigKlW56f?=
 =?us-ascii?Q?mljiDeSLxtrQZFOIy5yUZ0oniClBW8GyWkESNFGZtdZ9J4dmwULVxCJ3COWN?=
 =?us-ascii?Q?E/YrUa9s/pm5GtI0LZLCFVj/3sHRXQx7s88NYdweJQyIbB0cKDKXNDTEN0ls?=
 =?us-ascii?Q?NHdDuhXXW0t6H0mPthR7NVI/yJ4VaIQY3axXnSAmw2bJjtfT1sathQDB+wI+?=
 =?us-ascii?Q?GUz40QEAODasWqYVbEOzDfy6X7tqIjo0Ku1J52OXxlGMLvCg4/ClQQpD5QJ1?=
 =?us-ascii?Q?Dx9zU2RPZokukZvPJPHKP55Fi+TKtsPQjV52KLNqobb4zX4ghyT+ymIN0it8?=
 =?us-ascii?Q?wZbcrHhUoVtRLwHXBqN/4hAFcH42KOv7fnID3bPXCuNAzwnsc/8m3Up1Ru14?=
 =?us-ascii?Q?cNdz1s9GTsLzgsYSnxJMP3swdTTPzoRfNq+zebJ59I3K6OYjmJ9X4mj+oLd7?=
 =?us-ascii?Q?tC6gWL/pMIkUebqx4bnKvfYL23BpoEBjcX/yrwpCEnQPmGdmnmfnEiJ/z3U7?=
 =?us-ascii?Q?HXps+z/9qrecDLYKckc6YTQIon+j8kCOsclV1gDQ?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: a70f5620-4260-488e-ff5a-08d9d1f2dad4
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 15:32:03.5674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8jhQPYBoza2N4QEnmZng+4jjzLcGJ3Lxf2rClrUNrPStD2mNre643E2g8M7DRKb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBP286MB0432
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:700c::71e
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:700c::71e;
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

---

v1 -> v2:
  * Use trace events instead of printf to log canokey.c function call
  * Update debug instructions (trace, pcap) in CanoKey doc
  * Drop commit about legacy -usbdevice usage

Hongren (Zenithal) Zheng (6):
  hw/usb: Add CanoKey Implementation
  hw/usb/canokey: Add trace events
  meson: Add CanoKey
  docs: Add CanoKey documentation
  docs/system/devices/usb: Add CanoKey to USB devices examples
  MAINTAINERS: add myself as CanoKey maintainer

 MAINTAINERS                   |   8 +
 docs/canokey.txt              | 140 ++++++++++++++
 docs/system/devices/usb.rst   |   3 +
 hw/usb/Kconfig                |   5 +
 hw/usb/canokey.c              | 343 ++++++++++++++++++++++++++++++++++
 hw/usb/canokey.h              |  60 ++++++
 hw/usb/meson.build            |   3 +
 hw/usb/trace-events           |  17 ++
 meson.build                   |   6 +
 meson_options.txt             |   2 +
 scripts/meson-buildoptions.sh |   3 +
 11 files changed, 590 insertions(+)
 create mode 100644 docs/canokey.txt
 create mode 100644 hw/usb/canokey.c
 create mode 100644 hw/usb/canokey.h

-- 
2.34.0

