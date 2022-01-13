Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AE548DD8F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 19:20:50 +0100 (CET)
Received: from localhost ([::1]:38420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n84iP-0000pB-GH
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 13:20:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n84bC-0002fr-9G
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 13:13:22 -0500
Received: from mail-tycjpn01on2094.outbound.protection.outlook.com
 ([40.107.114.94]:6694 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n84bA-00024H-AO
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 13:13:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NfWWVztTzflaYodvNZecEBoKdAymhndYuMtkK9f4sjMuVpSppQAUZa2BWNf8RLNIhc7bxUkgUsRMDaN6Ioh+C/wV8sFNcDYOhZManICLethNfOQRIFh1jqzTP7MJ1E8jMjob8Lx/OPD1lOEJdXkaTnFBuSoFSfxX0gHquP/XNlgAcU2lqO0hdFrKK8ZwLos0rgoe1QBsw/woLA/yeKyMt1Ex84Ytuyz1fQMCPDrT0RXeqHwCANySyABInBMIoBM6yzUIzQGEGGPgaPsU7pJpzaAhqBv9jy7fXaleYHnv098jMZLKz02e8H3wgZRxkcl8T7gRSlGsg8PVEIyQ6vcHzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFqAJ/ObW6JFanywK2p4wMkB2gNofVie1zV1vnAwNa4=;
 b=gO6VokQUtDjR5Niq5q1hf+NoYZDM0Hx5+Tm1LCj7H3HCwYCV8P2F7XF9uBOsEafTqjKxtqi4+oONBIzz7nq4rEXfN56AWFVSQ2E/9S+gGPy6VEVFJUw8uCP4GbAkLFXSUB6Vqz0hG8hqh88xOWypG6KGPjpLveoCsJ4vGNRu2pKUGWnAmr1KGjyN+pIyRhuUpLjLqg5lNbpKdLoyi4Y5pZstWpWHkMTUItVLK7VCS48I20VJvBnOFViNrNnj2HEec3kCrg1yBhLmLTvnAcBe2/q1krrT9jgsNRIb+/OKoJRqE3c+q6ZDio2wzcwFsB3mUivVvE8/CEooOCjjoK6Gfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFqAJ/ObW6JFanywK2p4wMkB2gNofVie1zV1vnAwNa4=;
 b=cMVeiQExo2I0aDDoy+waiMMEUcncr6mXyMyQPysk4cDdzkL2hM5hkt5+8bv5M+KX+Lee4M+Q1bQLu2J8uldOsKQ9PThwgQpZVDehdql0fNo/be51rtu72eJGgYS/CcFurmT7Z2s7lisnSit84pG6E5ye0MlbQztShHOQ57Hsu6Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OSZP286MB1166.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:13b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9; Thu, 13 Jan 2022 18:08:07 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%8]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 18:08:06 +0000
Date: Fri, 14 Jan 2022 02:08:03 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] Introduce CanoKey QEMU
Message-ID: <YeBqg2AmIVYkrJcD@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.5 (2021-12-30)
X-ClientProxiedBy: HK2PR04CA0062.apcprd04.prod.outlook.com
 (2603:1096:202:14::30) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4c80f74-9d14-4b72-9896-08d9d6bfa628
X-MS-TrafficTypeDiagnostic: OSZP286MB1166:EE_
X-Microsoft-Antispam-PRVS: <OSZP286MB1166321F58A2AD12B7F767D4BC539@OSZP286MB1166.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aRJeAVQNtHdO6TQ2TqrgST/KpZWCeZ/2XuWnxF8mC2gUeUDg7wGaUjlXzrTkQ/6pmrUYmkMY02O54SgSwWM6FcK+T7t4gto67Q3/k2rzdE5NSZFFVqubPB5QxFroINOA/DA8DVChfr2oX3qOI365J4e14ooee3tCM52t4BgkzjbV3NZN5ey/1JdJUcLM4yUXZhk/gncqUxLkzqeBdaNekowaf9ncfihXw191b3yabYU2EZKT4vsFCm8HWx+JHCojSyFm2INzGr/hJQcSeiQxxO1C1wk6LrSePZlMGd3sRuoziRK1uenMn03a/TC9VQXhbT88ghZRZuFSMvsRatb2+JWTBzGMVKK6NbEuznwlnoIkEGZWY2nNNoxRrPZ5fcOqbjsKUcNayti41uexgTiGY4SHyhqRfoltuT7aEm+q6bHUYeGKOvaFJIRk65+PGlUv/7JQgXO36igAEkf+85C2RAp6lYhXcNuIQ6a7BIrcouVRjzfTVGS6wBgCSV/rQpa6kKaGqeWB3yWZWbB7CS2MSWocF1b43GxA+Lh+3w7mHR6Nqsi0/UGU9RrK2RAcuM3IwNURX0tPm/DKFzZRLNYONfx43YmisPpEfNaOnlHrkzw7hQSeRPEsxdRej26lIy0pGfcXmNcUPE5Oxp5d1EIcGamE/hSs+BPamBUE9uXf+gyzuoc/0yAyVORqtYDm2EFy0AWh55ZVtNyb6CpqIBe939kVBS/QyjhCfQ/w9tQ/tTUpVSKK8fLPHUCQSrkpBzbD9Dpe80YlPQ1IkivMc96uaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(396003)(346002)(39830400003)(366004)(136003)(376002)(6486002)(54906003)(8676002)(6666004)(186003)(4326008)(52116002)(966005)(5660300002)(8936002)(6506007)(2906002)(38100700002)(66946007)(66556008)(66476007)(316002)(9686003)(6916009)(6512007)(86362001)(508600001)(33716001)(786003)(83380400001)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lqgIBkiBDTC3k1PB8OYsht8vwuK+nIVYEbc+ZxIIJOh9R7DdBDfAL5asT8Lz?=
 =?us-ascii?Q?yPgfxCCfvepEVDGQ9SQ9FmBSMdGRSWgzloC9oa/2omGkdMbQeL5iz/xjkrHC?=
 =?us-ascii?Q?oDOLyNSroBnJkvUp3seYgXFuA2gxGm9pHXS9ngJVDF7J80n5iEigmHhyozJL?=
 =?us-ascii?Q?85YayJhO14rJATTBcAoqWwP1Chj0egh9aiPFn9lKUT/KDB08DKEcU6b2w7ec?=
 =?us-ascii?Q?2BJPyKl8NHEgmR1pW2TBU+WFD8RIQzGAvYYsKGjgXOVamky1IvrFgBK1TmLi?=
 =?us-ascii?Q?7zRSHyhJXz0wJmOgjmnTw57hXGOCAiDicvIcwDXdaqfdM8ziiJzfSroyXAEY?=
 =?us-ascii?Q?SEQ6Cjw2O7/B8HEumx/gHs7iWHKUOnvxbA0XhO/t9ToL827TtehIf54HiHIU?=
 =?us-ascii?Q?OD5frXc0a/3f9y8qvMydBhPXr2p09/zeU/vo3gLeBrkbv7vLf9lnVGC5irV7?=
 =?us-ascii?Q?scCIBslG6ZR0iG1W2fFg08gblpbDgDrZf1gW9etuwVB/EEe2kEf2H5AGbrCg?=
 =?us-ascii?Q?tOYBsSNFNZdUxI89tZx7ThiWwoa3GY5hrfyXPhBhfH8Nhf3rRsO47fZqZp+2?=
 =?us-ascii?Q?lTSS9vAXpMww+mK7vPYh3XJDYeJNFHPUknZcWDNu0mQfnoYkKLK4aiHexVS7?=
 =?us-ascii?Q?AzdqQy0POp0Vit/hlxo7FwbYKHGAFRWgbS75EgHBduuC761YaW32siX8iIlp?=
 =?us-ascii?Q?OCXgjd+zh9DHld/c5n4yx4aDaSJW+1A/aEkueGbfcq2Ikw08vdlELrsa6T1t?=
 =?us-ascii?Q?r9aFo1VCFLj1cemefxAYHHDqFeZI2C34f5ZsWW0W0r0xQfhtglN5H/sORtzn?=
 =?us-ascii?Q?GFdKgkzRhHXO/VHRNqrG5a2dfBkn/izsPSk4g4N278b2AFDiQwPcw1Q/sFyg?=
 =?us-ascii?Q?qpW5o1pefvd1BaEU703p3JnBH5HbiRWA5uJpTQHBny261BIR2p18qtfpWrf3?=
 =?us-ascii?Q?FSNxcIWKYMPc66TIBJXNerM5Xdz47EKHC0QqMdg4xqicg1UYbxmZithNGyUv?=
 =?us-ascii?Q?znOA2aaxj4J37u5PkeOANDQFPxmpVAZvE8UJvOBOG/2tMV+Gr4BiRCkJXoM0?=
 =?us-ascii?Q?0Gec/tkpY1RB/Ud9vhBmQVUm9gWDUW9DFbMrZVKoczjmzFVf6/1gKhWxOSi8?=
 =?us-ascii?Q?jppL4gY3pxSrvVY7Xvg+DEcL6qsikO34nuknia89rjH8qnDmLB/bJPMgNF5I?=
 =?us-ascii?Q?wufIzllhtHAMC6vhJoYneukRGljj4D1WT9PPTDg9QplS0oQ5wNJl0+v6EgTJ?=
 =?us-ascii?Q?1CROY5yOBnefAAA+pz7h4lAg5T03A0/QeYpJrR7DMeVwZM4hgz/AA8MmVhuI?=
 =?us-ascii?Q?MaZGq9wwuqhXFiWs1eFcax4zRCoRD//YMLmZM7HMzB1SIiZV9TVQ1SyFP1VR?=
 =?us-ascii?Q?dSxcyx/ZMDx1fp/G9yCkWKhKdShXAjD2QxLJMOfLP49njSfAmCANuu5J05PE?=
 =?us-ascii?Q?jq72ZX2Y4mfXFB5h1H4dwE1xAGAb4RWCKiXhZt8XmeBFerKyFghvYSg/IepX?=
 =?us-ascii?Q?3XieMclvybCLH+YKI/BpfNMC1zBa0W0wgPRfmj5zt6Wx8RngKvs07G5bwSgt?=
 =?us-ascii?Q?cayzlPojhCLc7cota+UgAJmRbadCcfuSeNaJl3B8?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c80f74-9d14-4b72-9896-08d9d6bfa628
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 18:08:06.7223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fj7dRNLxUeN/SnNhkgBNBkVeG60avvo/0Ent14krDFxp3ZfKf2bssTv26UialrkV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB1166
Received-SPF: pass client-ip=40.107.114.94; envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

v2 -> v3:
  * Fix code style in commit hw/usb/canokey: Add trace events
  * Move docs/canokey.txt to docs/system/devices/canokey.rst

Hongren (Zenithal) Zheng (6):
  hw/usb: Add CanoKey Implementation
  hw/usb/canokey: Add trace events
  meson: Add CanoKey
  docs: Add CanoKey documentation
  docs/system/devices/usb: Add CanoKey to USB devices examples
  MAINTAINERS: add myself as CanoKey maintainer

 MAINTAINERS                      |   8 +
 docs/system/device-emulation.rst |   1 +
 docs/system/devices/canokey.rst  | 158 ++++++++++++++
 docs/system/devices/usb.rst      |   3 +
 hw/usb/Kconfig                   |   5 +
 hw/usb/canokey.c                 | 344 +++++++++++++++++++++++++++++++
 hw/usb/canokey.h                 |  60 ++++++
 hw/usb/meson.build               |   3 +
 hw/usb/trace-events              |  17 ++
 meson.build                      |   6 +
 meson_options.txt                |   2 +
 scripts/meson-buildoptions.sh    |   3 +
 12 files changed, 610 insertions(+)
 create mode 100644 docs/system/devices/canokey.rst
 create mode 100644 hw/usb/canokey.c
 create mode 100644 hw/usb/canokey.h

-- 
2.34.1


