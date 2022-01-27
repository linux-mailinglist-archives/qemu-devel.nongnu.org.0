Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A3E49DE7A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 10:53:20 +0100 (CET)
Received: from localhost ([::1]:35478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1Sx-0000e1-3C
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 04:53:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nD1Mg-0001eY-LE
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:46:53 -0500
Received: from mail-tycjpn01on2105.outbound.protection.outlook.com
 ([40.107.114.105]:50947 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nD1Mc-0001qC-BK
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:46:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibFHfzcUywx4Tjk2BNhULgn/7Nmdy5muIJCIH4ILNEWmAQXF3CZicTlGm1naeFq4VFIwbZYYvBOsUDgFO0wt0SbL3UMm0dIju8XBDTvByA+4vmWvF5CScO09jnkj5ED/q1ayhyZFDfSEbgNAEP+00fBxNK3l4XctaeBkap4wSmmaCfdotU4co6Hwd1FnpslZHIBg8kCE4RWQfoNI2LgAGgnwXhBv/cH6C01XFhecUD857iD+3T5zN9hQ9uzBYmnRqtV3eY22GGfJhvtehfNhOjbw9aZAtU2nXKrCs+Qpb4c4TkhDMy+pH5j63J49fgvtTr6OW0VLNRyreBUroPyQmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkvXmvKm0A5QC/KUo0vmFcR/yfu+4WwIuQIyCWe7jFU=;
 b=Ir8HiUKVRUmk4FTEDgaOMwv45RLXxq2XHM+23MaguW7He2ATKuNC84isAASWegNk+X1S8QgZtpYoSpEZK4Q2Hh1EUCXfe3i13XOryYr2i6eafIDzPqz8Gh7mf/6wuTfFkiXVPcyglJV2ZlRzIS6//NsQObjeY1WYwFx0DqVTZDfOSWX3XD9Uds00XiEmFShzd2bWn/u+4SfOpNtirW0uIZC0PKmMMKRMMSxohqpGjFKYyfCd/y4GDITmd6bXQF6TV5+oR59kT7Ws/WhDyjhKRJn8hjdcY+rGQlGmYquUqlXG7heM5UcWAjQqSDsVKFkVqFDinb+HTKg+lvrpwLBWMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkvXmvKm0A5QC/KUo0vmFcR/yfu+4WwIuQIyCWe7jFU=;
 b=hWFz8zsfGUhyPP0kMY7K66wWl0w48y3tuMxx7jvSK/+Jla8e6UKPvyHW5GZ8Y+AmtTVSvO/ltxlpmoMvHhCGXbM9MTe73snQcfkmVz/RHLkA+nMOl7FPdUyyZLWeZvdyVx5ujZWHVIi8Zoq3OSzr59kwcJiP43UcCWplIz6u6yo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OS0P286MB0482.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:ac::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15; Thu, 27 Jan 2022 09:41:38 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%8]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 09:41:38 +0000
Date: Thu, 27 Jan 2022 17:41:35 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/6] Introduce CanoKey QEMU
Message-ID: <YfJozy5qjVYh24Xp@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.5 (2021-12-30)
X-ClientProxiedBy: HK2PR0401CA0015.apcprd04.prod.outlook.com
 (2603:1096:202:2::25) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7230080-32c9-4ba8-02d5-08d9e179370c
X-MS-TrafficTypeDiagnostic: OS0P286MB0482:EE_
X-Microsoft-Antispam-PRVS: <OS0P286MB0482BC1C15491D1AAFD129A5BC219@OS0P286MB0482.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JNlJ+D7fxExIRqdNKVeyrUbqkLZxxnVdds/XdPNx4b5C/Zajr4sGQz0SwZymmm/OFZXYFSGVGa69LS/L0AOpm16nHJElNnb8xCpKtgTKhTom8vCtnG5JUff5yXb5sFYXKsze5yzy6EoAmbVV+Dr6TjsbTTkRKUvE2NSaziOA8sAg1+3gNbkfddTKwqVoFP+ZHzj3Sxu1W9QSANMbjIgE6QatxndQRU8/vDMXbxtcR87JMhuk/wgoJiGnwqAbPaCN6cgzer1OjpPgntAcvN9ZlLhdH2r76yIOdm6dvJKK/4LcjDsnsAl+1LHw4okuBU4gNV8u4P3zwxBblOsXQr7o61ZyE8zqtPOW7NKUmEs4XJNdAh839D0svM3Mntq+DQb41PIQYXMBJNMJ4x7/9WQauz1d9j48fRVlZ+9X9pbgnZG3IEEHtQan6RfSphXAQ4mlJwoWvSiMP/BmBPEZWr1kwyMiNdgP91VDo+FzHyzSFm7VJ8WgSv0lI7PZfoeSywnwAYgjeeIF359GKtJXU8l3Z4hgi7Wi8EXPyMGmJUTD+pzO79HtQcDY94+L3nQfW8AIyU56xpUXfCSruqQeXYNbVoh07g7SuiQyLpu5XYZZM4ied7biRsyX+0X9b63Mj8UTcj4uh4MzkWHe9SzrsPZwM7yMgZx72p1JYDTdOFmIObpYS5NLMh+5DniJ1S+zZOfXiMzmJw98rlAqx3JN4pLoU+YNl6l3f48oBVZvit5OPz00VCSiQucWPVL8zgSRzZ6y9XA7/fkGJBC4ihMZDshhDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(376002)(136003)(39830400003)(366004)(396003)(346002)(186003)(9686003)(86362001)(6666004)(6506007)(6512007)(2906002)(38100700002)(508600001)(6486002)(966005)(33716001)(83380400001)(5660300002)(6916009)(8936002)(66476007)(66556008)(8676002)(4326008)(66946007)(52116002)(54906003)(786003)(316002)(49092004)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fDVuRmHQ4xGPh6sY0p4QzBhYIqMkPYOIRKbtp5hrsu3E1DCiM0GcUrLls0C/?=
 =?us-ascii?Q?163uQc/Nk6+d6kXvCKtxf+YjurP21Mh+v2dApYrkNOg83w6TKCM8BCSMAUHT?=
 =?us-ascii?Q?qlRnW61+rCbxdNNe1inNB+PVWR23gKhgdhIWQqtfgtwUEewvGPyf1/opu+5k?=
 =?us-ascii?Q?RX8+OSxOxd1iyDy9gojSn6xr35pnw2XGA1YQPxTSmeYOVlS5XwMbX3pRdM0Y?=
 =?us-ascii?Q?j6ttFKdyGNbGRGMroo7VQGB4s/ZtZjFZ6b+qshNpqtWYPGdefzkASUOSPGzD?=
 =?us-ascii?Q?ME1MpjIyTjXLpE80xoGSnhzkWl1anwjxvImiD+WmB8Gz4Uy6IPpH7xqcP3B7?=
 =?us-ascii?Q?evdMfuFFpdu5McZ3fGBqb22BjCkAsXLjjfJGroJGsZqpgzClrTNHNBX9ZWVH?=
 =?us-ascii?Q?XILqJbhucYgSW12I1icxaXFJS7F0KNpW27KDHQheZ5MTe0fcaflvuascWnNg?=
 =?us-ascii?Q?a/h96wrjhIjAkGu0nKdKfA1ZzDkWvWFtew3uEgAAYXyNyKIq9nw4dWCfI1xE?=
 =?us-ascii?Q?dU+zSfXPSlb41MGjaKdcASKZJsXjdtnF7f/pJNmU/SAr+FXaJzc8ipEwA6zY?=
 =?us-ascii?Q?Rd0/PcTJzQQjVAcLcqZFIJEiPcCky6RjFqhkgre5cY0hpj7d0vKZz4OCdtCd?=
 =?us-ascii?Q?qe/x5SQ4Bmu+ujzuUKu/ouHKkDPtPgNU9km4i3heOjvbyihQbPrwJoQSiJ1y?=
 =?us-ascii?Q?OjrD82D3Q17TkxrADxO3hGyXCl9pISpWZy8px5cRcq4fHfBeGXaQ/jMf6wQh?=
 =?us-ascii?Q?vrMlfiJozX5yW/58zJkmuUOTKLNhnFo3HoF1EOIKmeC3nnm9pLrYNde+Gmah?=
 =?us-ascii?Q?uBGei8LT/u4cDAlBg2Kxl20grrUltZFfW5P4f+r9eP+md5kJdbr2krYp/xNb?=
 =?us-ascii?Q?5/1Yt2ShAOo2E123MWRO5pbes2G0F4FeCRpYcGJ0C79J2maNedXsvvjAmE5D?=
 =?us-ascii?Q?ZoW5h+N5uMje7KhNrTk+eiNODJdylyJZDZAo8qSH9lCKjw20yu4C/7G03ByK?=
 =?us-ascii?Q?f41XJMxBcvmhdzZ2SYdvgVswVwYlGlW2kTkxOezAiN181FlxGk0IDAve3zWn?=
 =?us-ascii?Q?ZKHIe5DOzVMJl1LTxyDCOn/mXQAl497ikGx71V7CpSzSZZ3AGc6IdOtMYDiT?=
 =?us-ascii?Q?g4vCotSFyOyw1hwCSHWv2PPyM1unybaEZWDkl3FlkebOZUy+7/uXzJnQDTVI?=
 =?us-ascii?Q?HSk1s8/nk7CRUTOBTaTRY03daC4M+MFgJRrJNHnHD3sGEZAYJHfDjuRRiwOY?=
 =?us-ascii?Q?dlK+nBqU/nN8cUyO8hPBLG41lPwFTQ8LjLFjEeq5YVHIsUzMuI1lY7kA3+26?=
 =?us-ascii?Q?du8rHsXm9iPnazV2/4CGZ9LDh9rhBkewju0pgIY3+YcRL5dImiLQjoPM2KhB?=
 =?us-ascii?Q?xmzOS9J/kZfXqR8YVBzD+4HjNT8QdHTOyCfX+H6KVzbOsL9W+w7dqrSpCiui?=
 =?us-ascii?Q?eACuGZp8KQ25FndLAd4V2cVjxJ0GrgdSngoCzdd/4oEXfbbQp+pIlS1XxAcG?=
 =?us-ascii?Q?rc+EWTQt8yMJI0S20UZgX8Z9ekJJETtH0JCVY5yVuAJpqX/aSTSNiYyNMtX5?=
 =?us-ascii?Q?/m/HazLODkHBIKJjqvO9YrUgfq+GPoReNXYnQwqh?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: b7230080-32c9-4ba8-02d5-08d9e179370c
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:41:38.2649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDAjhHpIrnSrDfdlm7qcxtt4J/T4pPXiJqHNZwONAp8JLwmv4zEB/LJkxrc+K3UK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0P286MB0482
Received-SPF: pass client-ip=40.107.114.105; envelope-from=i@zenithal.me;
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

v3 -> v4:
  * Refactor canokey.c into single thread version. This version
    is much easier to understand and review
  * Add more comments
  * Add links to canokey.rst in usb.rst
  * Update MAINTAINERS canokey docs file


Hongren (Zenithal) Zheng (6):
  hw/usb: Add CanoKey Implementation
  hw/usb/canokey: Add trace events
  meson: Add CanoKey
  docs: Add CanoKey documentation
  docs/system/devices/usb: Add CanoKey to USB devices examples
  MAINTAINERS: add myself as CanoKey maintainer

 MAINTAINERS                      |   8 +
 docs/system/device-emulation.rst |   1 +
 docs/system/devices/canokey.rst  | 158 ++++++++++++++++
 docs/system/devices/usb.rst      |   4 +
 hw/usb/Kconfig                   |   5 +
 hw/usb/canokey.c                 | 311 +++++++++++++++++++++++++++++++
 hw/usb/canokey.h                 |  69 +++++++
 hw/usb/meson.build               |   3 +
 hw/usb/trace-events              |  16 ++
 meson.build                      |   6 +
 meson_options.txt                |   2 +
 scripts/meson-buildoptions.sh    |   3 +
 12 files changed, 586 insertions(+)
 create mode 100644 docs/system/devices/canokey.rst
 create mode 100644 hw/usb/canokey.c
 create mode 100644 hw/usb/canokey.h

-- 
2.34.1


