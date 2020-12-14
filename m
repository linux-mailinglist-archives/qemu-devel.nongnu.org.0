Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAA42DA2A5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 22:42:53 +0100 (CET)
Received: from localhost ([::1]:37144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kovcJ-0003ix-Jd
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 16:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1kovb8-0002tJ-LS; Mon, 14 Dec 2020 16:41:38 -0500
Received: from mail-dm6nam11on2063.outbound.protection.outlook.com
 ([40.107.223.63]:30817 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1kovb2-00088C-7C; Mon, 14 Dec 2020 16:41:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZniZh04M4E4b135JTcnOPZrjWu8RxzWMpiotE8OXz+RJ3+9XdUC83fTCV8bTYDZUUO7/bJ9AvntF+nXRr1zQkUW/09gXVuYoy/jVtII6Cri9Pm0HsGVfZ6WZm4GZk0K5oO8M9pPhhA9PcpvfBE8PMwmaS2+VqEJ/lycHecEFxe3NbAmBWVzuSeGLv80nGpvbsqHZv2CforNBVhrtchHoufvQROflYQd4WHQkfRrM7bTx4MugponXGi9A1n81mM3mCRDFcR2FMmrA3dQZsEiax2MowPRIlZ3aENwa8D33XxLwCkloLzLJx3QbLWSPLQEztIVpk8Yf42o+XytR5zSog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vedvos66yGGarsU6mf1iZ/576RSsYsVXRdePB52Ddsw=;
 b=gLDseO/YC1QTc/nSt+ar7shS39iTA4w1d2Neq8ljhgww/iBzAetrYM7JaEx2PDCV7oC1tLpHVJBLQu4QkOsKeA7D070WajvHF+WbukE/xnJKD3CZhya4fPBAYpjZTxF1eMo1D/iDTYCGjYH1ghmDtXDb+mvXXPhKC4+tMNdMF8x3vopavFAotQfJUirc5Nw4mcREJsq44mz+/8xhSOa8qfuMRnOQOywRf3CLJMMza1002CAgWlcf3xJ1LD+xiihJgkXry/4ZGQHW1mtoIEGCON1Vp/tyRxQtvv7aRKyDPD3Uw1GCKzbSifq2RYaNGMajQ6v/Twh/WEtGCWK4rTp1Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vedvos66yGGarsU6mf1iZ/576RSsYsVXRdePB52Ddsw=;
 b=VBiUQiJklXo2oQCWfgk6t5C+t76uOkIKVqau4XcmlXIROvxQBVn4kYhcXExLZJg7ZRi285yQh/RfuPXleAF+zbWQi7/thcEX5XaGGnInpzCtTFGYBIsMwG4aUvY2S9/MNFXX4P01SLd/ruGKeEc6ug4euAsup2vzI6rVhq9tyMY=
Received: from BY5PR02MB6033.namprd02.prod.outlook.com (52.133.254.138) by
 BYAPR02MB5862.namprd02.prod.outlook.com (20.179.62.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12; Mon, 14 Dec 2020 21:41:25 +0000
Received: from BY5PR02MB6033.namprd02.prod.outlook.com
 ([fe80::6d26:564c:63dc:80f9]) by BY5PR02MB6033.namprd02.prod.outlook.com
 ([fe80::6d26:564c:63dc:80f9%4]) with mapi id 15.20.3654.024; Mon, 14 Dec 2020
 21:41:25 +0000
From: Joe Komlodi <komlodi@xilinx.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Subject: RE: [PATCH v5 0/4] hw/block/m25p80: Numonyx: Fix dummy cycles and
 check for SPI mode on cmds
Thread-Topic: [PATCH v5 0/4] hw/block/m25p80: Numonyx: Fix dummy cycles and
 check for SPI mode on cmds
Thread-Index: AQHWvG3rpZbpOh2rgUmizLvtRGAYkKn3Q2zQ
Date: Mon, 14 Dec 2020 21:41:25 +0000
Message-ID: <BY5PR02MB6033A3BBA4DE9636C43E4AEED0C70@BY5PR02MB6033.namprd02.prod.outlook.com>
References: <1605568264-26376-1-git-send-email-komlodi@xilinx.com>
In-Reply-To: <1605568264-26376-1-git-send-email-komlodi@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [76.217.55.39]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9044aa4e-8e0d-468d-34f3-08d8a07901e2
x-ms-traffictypediagnostic: BYAPR02MB5862:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB5862781E0BC872CE1D347581D0C70@BYAPR02MB5862.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 82qTjB+zGoBOvsBtmBTJ/lQTqhqFecsmqh3tl7DpaOGMksh45kLHA06AXFHpw3cbku0QPsAai+2GEurZbZlIlkM4rb1mjYZoYyJtKPy+Ee8I6JheYxIO2Esgh9AXXWOU4CTwGVKxadLV5YWJROohzhzS9STEynGSDIvPUkdiaUVpgRbemhG+GH23mAU3mkhqqMZWOcaKRTEYKLrViExMO52So64RJawxtWAhJqhRteoq82MISQt2ZvhJLvba4Fj/F61DDKPkL2gqrkdCeMA2TZWHSwJETZl7+ixI0l5k6pWb/Py1gsuZ4vtuCQKRCmZP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(366004)(7696005)(4326008)(76116006)(55016002)(5660300002)(110136005)(2906002)(83380400001)(53546011)(71200400001)(66946007)(6506007)(86362001)(26005)(508600001)(186003)(66446008)(64756008)(33656002)(54906003)(52536014)(9686003)(66476007)(8936002)(8676002)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?uhoEqfhYYda01NfABDJsZfEPgM4nPuvNIwhbjolbN2xOXR+3gnlOVFm3B+1P?=
 =?us-ascii?Q?lCErtO0l5SQkw7QF3jaugQDkIIyajbXkL64GKoAaefkGhre1HWWzukywFqNX?=
 =?us-ascii?Q?R1Phid6ke6JOelA/6EIW9g7C07UHVk8a203zTiXDjK9pyxoO7qoZfjQv21DJ?=
 =?us-ascii?Q?rf/OKHL637l1aYiTNuH1d8YiWX63JvlXtshUkl7KiNaBHCepLTauBdO5VpWR?=
 =?us-ascii?Q?ZK5pGvwoGve11hyPFNe4Qw8DrPlb1uudWiCaC0Yt+JFpuPI39Vtkb6T82iDo?=
 =?us-ascii?Q?PL9BzfXUFfQ6n7NYxsu8+et2Cna90KqZi98kliQGEYT3TPEuIwqKVJV1YFe7?=
 =?us-ascii?Q?oJ7vklZvg5KDgNxqUhIyVArALhWBP34w4fofZ/oixZi138LK0TW12mfw/6xi?=
 =?us-ascii?Q?zv68bWV4o4EL+f9Cvek74D9kh5FjF3U4U+o1Nn+b8NLK5mXZuVd4+y0twt/q?=
 =?us-ascii?Q?vY1nzh2iHsVwbpZ8Mwg/uGQjYq1Q/4PGOX+k5uVHB50sEAsoUGKChe8caFVx?=
 =?us-ascii?Q?8mUSDPcNP47NKAjyjsnuM/CXXZS/K8FC1LfRz7RTkpvWAJ4llyFOIr04R1KE?=
 =?us-ascii?Q?DZ/COVT6bXriuXDRSLSBcZvudbsUGDp4hCGLWdt3gZ+GsaP5pnLICv0adoY7?=
 =?us-ascii?Q?SPjr/Wzb4dxTY2hVifwINC7Ky5+LRBitZtICKWjaIrcR4sdLfMfnsQ/xToPL?=
 =?us-ascii?Q?GyNSG37nVEr+btJf5qMv0eA1+arCcebeGwtEEz0cLrhIeI+S9RbfPQUfi6xk?=
 =?us-ascii?Q?R6VXBxnGRRkrvvJh1/A3ab2uzykP/HCGQ9UEbdnfNrfEQ7oGutGQbUb3bzVY?=
 =?us-ascii?Q?BPtK+m1YejXmC7XxGgTJNfnziaBLAzq/sK7H5/1eizf8mAbrXbpUM37D2+c/?=
 =?us-ascii?Q?//tH6GBVawM4c/3+qOvMjBTp39kSwkviQkbf6RrRW5Lfl/o4NWUYC2fXiUtG?=
 =?us-ascii?Q?AKIYu47Sca2duTFkuv/7KIjR6AtA4Bjk8ytIXLW11EQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9044aa4e-8e0d-468d-34f3-08d8a07901e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2020 21:41:25.4574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SpXHJk4jdh+948BjXMorBxDjf/zO2Cqys/YYdggp9E2Zjljh7dqZMAFq8h9nGAKBsLm/VnaAN1rSeUDAvrIG6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5862
Received-SPF: pass client-ip=40.107.223.63; envelope-from=komlodi@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Francisco Eduardo Iglesias <figlesia@xilinx.com>,
 "alistair@alistair23.me" <alistair@alistair23.me>,
 "philippe.mathieu.daude@gmail.com" <philippe.mathieu.daude@gmail.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

This series has been reviewed, but it looks like it slipped through the cra=
cks.
Is it possible it could be merged through your tree, assuming it looks good=
?

Thanks!
Joe

-----Original Message-----
From: Qemu-devel <qemu-devel-bounces+komlodi=3Dxilinx.com@nongnu.org> On Be=
half Of Joe Komlodi
Sent: Monday, November 16, 2020 3:11 PM
To: qemu-devel@nongnu.org
Cc: Francisco Eduardo Iglesias <figlesia@xilinx.com>; alistair@alistair23.m=
e; philippe.mathieu.daude@gmail.com; qemu-block@nongnu.org; mreitz@redhat.c=
om
Subject: [PATCH v5 0/4] hw/block/m25p80: Numonyx: Fix dummy cycles and chec=
k for SPI mode on cmds

Changelog:
v4 -> v5
 - 3/4: Simplify logic when changing state and checking mode.
 - 3/4: numonyx_get_mode -> numonyx_mode
 - 4/4: Reword commit message to include QIO mode.

v3 -> v4
 - 1/4: Patch changed to change names of register fields to be more accurat=
e.
 - 1/4: Revert polarity change from v3.
 - 2/4: Added, fixes polarity of VCFG XIP mode when copied from NVCFG.
 - 3/4: Removed check_cmd_mode function, each command check is done in deco=
de_new_cmd instead.
 - 3/4: Add guest error print if JEDEC read is executed in QIO or DIO mode.
 - 3/4: Don't check PP and PP4, they work regardless of mode. PP4_4 is left=
 as is.
 - 3/4: Simplify get_mode function.
 - 4/4: Simplify extract_cfg_num_dummies function.
 - 4/4: Use switch statement instead of table for cycle retrieving.

v2 -> v3
 - 1/3: Added, Fixes NVCFG polarity for DIO/QIO.
 - 2/3: Added, Checks if we can execute the current command in standard/DIO=
/QIO mode.
 - 3/3: Was 1/1 in v2.  Added cycle counts for DIO/QIO mode.

v1 -> v2
 - 1/2: Change function name to be more accurate
 - 2/2: Dropped

Hi all,

The series fixes the behavior of the dummy cycle register for Numonyx flash=
es so it's closer to how hardware behaves.
It also checks if a command can be executed in the current SPI mode (standa=
rd, DIO, or QIO) before extracting dummy cycles for the command.

On hardware, the dummy cycles for fast read commands are set to a specific =
value
(8 or 10) if the register is all 0s or 1s.
If the register value isn't all 0s or 1s, then the flash expects the amount=
 of cycles sent to be equal to the count in the register.

Thanks!
Joe

Joe Komlodi (4):
  hw/block/m25p80: Make Numonyx config field names more accurate
  hw/block/m25p80: Fix when VCFG XIP bit is set for Numonyx
  hw/block/m25p80: Check SPI mode before running some Numonyx commands
  hw/block/m25p80: Fix Numonyx fast read dummy cycle count

 hw/block/m25p80.c | 158 ++++++++++++++++++++++++++++++++++++++++++++------=
----
 1 file changed, 129 insertions(+), 29 deletions(-)

--
2.7.4



