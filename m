Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3B45264FE
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 16:44:51 +0200 (CEST)
Received: from localhost ([::1]:47688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npWXC-0002yT-Ko
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 10:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1npWUm-00082H-Gz; Fri, 13 May 2022 10:42:22 -0400
Received: from mail-dm6nam08on20603.outbound.protection.outlook.com
 ([2a01:111:f400:7e8b::603]:40620
 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1npWUj-000673-3V; Fri, 13 May 2022 10:42:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgWPTurIPAHO1bbeK9tKjxxhXn6VkhPigHUcInwgKyihcP6dozJc/8IeSJpRmcfhTob8GYk1IbPQTTafXQR5GGy/+XpATISioPfUdE9uRSGWDdfoeRiDKldB7rKT4+Dd2n985DarVn7zmHmWmNfvDTu6xIjkBSBnnlSn9X8o4vn9xQK6XO+KISjLFTcgdkKk1zFRGoUkd8tQOXN+Z/2WLKg3MqCylJpI914jf7iHpTVekxrqy2Upq+y8ZbeXgqWx46BkbIODEqNs5+J55w/oYGxGn8VDrl0mIufJ7eE4YOc4oHG9ijdccQSUBrZbmrZ7bALuUXrNiI2RmkxYOUsk6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yL8/O7LZJ1WmPYgW6kNKE9r9sopX7yDSB6+aEUZQYw=;
 b=PRCARC+WLqgczwm8vhEOUxfbxjNucH3O/JV1ZWc/4DJeONQtApKTD1WrZtdhzWQ2yqaiw8hckhtiz+SGc1VSpYS1wQE6KD5QqSxGD9IbUBfnS0LTMBFB0CnbTNmZiOhVGAMvuiDyDe7zy0/rVGWKaboARwMwotGSCJR6SGmGlk/IObuGUB0idyFfpJBxFCMAgfDxV9hQsLx2Q3t38CQ2gVEAl6su4HqNKwh/i8jUQyFpZuOoaYS5VRvS23qrSz2yP/OKhoR9lNfKAj75CSxMSF/KOpJpFMLh2AWzrJq07ipz0aHnALLN1QgfXgEQYtLS9TdH6l86DPgp1hqkWO8ktg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yL8/O7LZJ1WmPYgW6kNKE9r9sopX7yDSB6+aEUZQYw=;
 b=GmLG5RGRGeEwcEIpCwpmQItlVdragscBStaSNGmfDVG9JbXj1fTnsOowZRtSdb/84+ZSezISiGDDBjuN7ZkL3EVHmWRXo6TxNOrbdN6Qgs7wyblJQeBI8wGIvWmLFQckJwcyWApt5ySBe2eQYzEohCtfGkmrNWlDFdkGUsqS8zc=
Received: from BY5PR02MB6354.namprd02.prod.outlook.com (2603:10b6:a03:1fd::12)
 by CY4PR02MB3367.namprd02.prod.outlook.com (2603:10b6:910:7c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Fri, 13 May
 2022 14:42:12 +0000
Received: from BY5PR02MB6354.namprd02.prod.outlook.com
 ([fe80::4840:6c2:8dd7:947f]) by BY5PR02MB6354.namprd02.prod.outlook.com
 ([fe80::4840:6c2:8dd7:947f%6]) with mapi id 15.20.5250.017; Fri, 13 May 2022
 14:42:12 +0000
From: Frederic Konrad <fkonrad@xilinx.com>
To: Frederic Konrad <fkonrad@xilinx.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "alistair@alistair23.me" <alistair@alistair23.me>,
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias
 <edgari@xilinx.com>, "fkonrad@amd.com" <fkonrad@amd.com>
Subject: RE: [PATCH v1 0/4] xlnx-zcu102: fix the display port.
Thread-Topic: [PATCH v1 0/4] xlnx-zcu102: fix the display port.
Thread-Index: AQHYXwJR/j5A46Hul0OsE23sJzVGfK0c78RQ
Date: Fri, 13 May 2022 14:42:12 +0000
Message-ID: <BY5PR02MB635436FB890DF72BA77A7D1BCCCA9@BY5PR02MB6354.namprd02.prod.outlook.com>
References: <20220503152545.1100386-1-fkonrad@xilinx.com>
In-Reply-To: <20220503152545.1100386-1-fkonrad@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ada72c2-d390-4d88-ab5d-08da34eec40d
x-ms-traffictypediagnostic: CY4PR02MB3367:EE_
x-microsoft-antispam-prvs: <CY4PR02MB3367239E22744B59C873953DCCCA9@CY4PR02MB3367.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dNP9WOPBU+ZIMV+jFRvHgqrt2/HTB/gdIRT+6Jy+kUuhXu4li9VSx2hg4qe4ePq1pCg+h6ZTNbyWOkQMSn9tXsoAUuSn4rv44dj869+9rZiw72cDfXe7DiUjwcBUnMedFHsqURRB4D7XbcMOkJB9Cz8DRiRsJWv5GWkaB3i5R08zon4zluknCzkr7FtW57bbmxL4GbzE36kTCh0FO1YU9LUCb+guig4yIMxvyAyzIC55nCvqXOrnsk8a/NkXV/JAqOIlMPxKBY6SBuIoBfmp8aeU05VD7plBL5cGRCBLNnhcgBG1NHqZYi3f7I05hXS0TaTZGn/wD6s5SRYYJ6Le4CrTn/Ie2k/63s3vCEtpP1sTcHc8wR5QyG8zJrXe13K//650D73C7gNUxrdYdoqzoJr3KH3RvqngCkH3GG8Y1GrQiEypClyV+O/ERalCx7Gx9TnneKiTbNQVs8iotwR8XJkCHoIZdmcNvp8tEb1bNrNGTgSbKT8C1zc5TB+vI5EMdi3klLIZq2wV8jOtlzHFBJHULlCK/QZr/v0jpNM6wEeutYGMiEJLAkfn0MZcPLK5eILktZqohLU7vLQRes2DZsCDRAP3rksY0Yh0Ai9CXNEWdGwAPxlqZGe+NAhqSOV/f6o/jON/h8TJzPy2k8z7qC05NJ8Ey38aRznaWK0Lq7cJZkkCzDe0sScq5rcyLWXC1Zz1ny5l/+RFKgrDPY+ns+2xiDYd59Zx9A9u69FzVhBvTBOdndMAmk2aKhLmi2PAuhEomrclPKwiQuOjLr/ga0K+MKL9qybe5hBoj9eMoKw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6354.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(5660300002)(316002)(53546011)(508600001)(55016003)(186003)(6506007)(33656002)(52536014)(7696005)(83380400001)(122000001)(2906002)(71200400001)(86362001)(4326008)(8676002)(9686003)(66946007)(64756008)(66446008)(66476007)(66556008)(966005)(76116006)(54906003)(26005)(38070700005)(38100700002)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kxZXmALRg0A2rzMVRiz6L+J8o+PhUFocymuvLNXSiN5CyZR47Hlt3SbVdjCv?=
 =?us-ascii?Q?RjVi0Hda/urEu7GYfnugNM79m32f2hEm4Q2CbWxOob4R0Qxn7PFdgtars7Zf?=
 =?us-ascii?Q?PdCX5wkVyseah0XbGjTAk+xNykCbrpjZx73Wn2Tm0xXKly7ObuhHskGgqzh+?=
 =?us-ascii?Q?uk8J7M8JhY1LPGO8TcLdQAAX2q7GiV92jVJFq4NCWUl0gvabakWAesclZYuA?=
 =?us-ascii?Q?l8G9ygTJs88cVWEZ3hiCCf4Di5uXCAxbRIsBcgptb834hJNRtVEE5WKd4Ikx?=
 =?us-ascii?Q?kX8f2BNjjd3hdcEo5JEyyHptRdtGgkwYL6Rl6GzlwTGEIV9eMwjBRi05vm2e?=
 =?us-ascii?Q?hv7RnHTgPZyx6tNqFwPYTijkXDJjnBAPMvXRQNqVzJAv+GtmCliCKkFR6KU6?=
 =?us-ascii?Q?ay6I1Wh9BRaWOT9oLaRh3UWb/Oq6TsOkIS4sr7VQbpfwm59FOa/kk5ZaEL7U?=
 =?us-ascii?Q?xYovGAHsTv4pMeiZPPTDIlozzVCwzEoIgF6PkJ8QxhirtNJscv2j1aljrp+t?=
 =?us-ascii?Q?VJiWXqgw+HRJ26qI0uHzAiqcgoHCRaJv4riEzrib/dMOw2qDkgm0vo/d/FxX?=
 =?us-ascii?Q?n8c05c39EwFYcFbGr3ijnIOQmH8NEo1IejotnKnNHTQ2lYHyExTfp3XsSxDM?=
 =?us-ascii?Q?w8SjsaXqhr5IxclEGJ04bBaYxPtlmLP1vBFdmgrxi7xv9F7luNYcZYt9mqhH?=
 =?us-ascii?Q?AXFY2T0mgp0o+vt1zfXhRQKUOHJCKy3O68v4FSKRKFUnQ/TKZMAbdP9IkGHN?=
 =?us-ascii?Q?Orv3OIOiSpH92Ib2qAg7yqLzfjnxuoEYL6pRDg6VbFYW7e6t1AMQlrb+wn3B?=
 =?us-ascii?Q?U6fXSK5VVCitJA15bxr/yWVlN1fMOXc6eOKcBImbrb3ZZ7Edv4FPw7ijV1XY?=
 =?us-ascii?Q?qKvKw7h8ZBoH+61W32Kqw15qn9qIeAdRsGmNmmcDI8WGV1mHLl85YnMeH/JF?=
 =?us-ascii?Q?81uPtqKPEveMMkFQPm5LcEdLoieoSmwBf8ZUDUkq8KvQEOKwWMcLmujq4fmf?=
 =?us-ascii?Q?SI/9hsYcdstycjuWPi+rVvUSwwlfQV1ohCTIAgMrzUR2sGn2BDJHkBDoUBPU?=
 =?us-ascii?Q?gMIzMYScJ4lYNlPnZnLY2lg+57KoMBXYFhczJlvGeISuXGSeEEBZahL7EHeg?=
 =?us-ascii?Q?S+pgR1jw5tok4RzLDNdU5C2luOwUHqr7XG9rTM4YzrqtJYG3URMlg5yRhgP0?=
 =?us-ascii?Q?pI55wtFREYDMud2VwwqmPtmaA/6DXy7wywbmUSFly9WZjL1P6aBIaJN0ROr4?=
 =?us-ascii?Q?nDOWoO5T4X89OZXlMg5TW1PXBAAUnajwZIkUrstCgfGh+8hOy/dMKLRNebCN?=
 =?us-ascii?Q?XqKFuuLEefvXbzFe4YpYhIE8yflVUuUQaKIPm+zictDxq6Cy5akMmg4mAosB?=
 =?us-ascii?Q?mrJYbiLZu0yKGqVe78ahhef0jwx3OEM79x8ZEH3irHk8CMXjDSEY1lkUtnQQ?=
 =?us-ascii?Q?e7VzhGQ1kbaoeC2FVe5wGsHT4hfUBj12aaEd4v9AjT76p+QUPe9rh9zKgYRz?=
 =?us-ascii?Q?OUzytRPg1Ssfl5dCx8fS/+orCK5hV7461q2/oMrbsaF3d5JEvRXDkI3f1uFp?=
 =?us-ascii?Q?Pe081o3gtAvu8oKI8Xy3Jzk9ydfSr6+RyAaaC9F24TJyWWZM8HRDN/F6Bfz7?=
 =?us-ascii?Q?HGc0rlzC8QVI+7x2wBpnYjwCqKfeMksvjIE6MNijXGWTuZw5TC9Hkyaxc6QY?=
 =?us-ascii?Q?WsgB/KKzx4Z15Wp51wTsnyKTMv8Be5C+Y+b1gDeL27gC/9/3T4AlKQrMEhIC?=
 =?us-ascii?Q?q+Mn8wTp8A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6354.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ada72c2-d390-4d88-ab5d-08da34eec40d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 14:42:12.1968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R9Hc7XkvI6OJVyvPA993A9d9ffGr7n3LYI/E3XOM3Sem/uKrswyjKgk4Jooxzg4Ki+47EM9qaagNfVvAFLLhrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3367
Received-SPF: pass client-ip=2a01:111:f400:7e8b::603;
 envelope-from=fkonrad@xilinx.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Ping

Can this be applied?  Here is the patchew link:
https://patchew.org/QEMU/20220503152545.1100386-1-fkonrad@xilinx.com/

Best Regards,
Fred

> -----Original Message-----
> From: frederic.konrad@xilinx.com <frederic.konrad@xilinx.com>
> Sent: 03 May 2022 16:26
> To: qemu-devel@nongnu.org
> Cc: alistair@alistair23.me; edgar.iglesias@gmail.com;
> peter.maydell@linaro.org; qemu-arm@nongnu.org; Sai Pavan Boddu
> <saipava@xilinx.com>; Edgar Iglesias <edgari@xilinx.com>;
> fkonrad@amd.com
> Subject: [PATCH v1 0/4] xlnx-zcu102: fix the display port.
>=20
> From: Frederic Konrad <fkonrad@amd.com>
>=20
> Hi,
>=20
> This patch set fixes some issues with the DisplayPort for the ZCU102:
>=20
> The first patch fixes the wrong register size and thus the risk of regist=
er
> overflow.
>=20
> The three other one add a vblank interrupt required by the linux driver:
>   - When using the VNC graphic backend and leaving it unconnected, in the
> best
>     case the gfx_update callback is called once every 3000ms which is
>     insufficient for the driver.  This is fixed by providing a VBLANK int=
errupt
>     from a ptimer.
>   - This requirement revealed two issues with the IRQ numbers and the
>     interrupt disable logic fixed by the two last patches.
>=20
> Tested by booting Petalinux with the framebuffer enabled.
>=20
> Best Regards,
> Fred
>=20
> Frederic Konrad (2):
>   xlnx_dp: fix the wrong register size
>   xlnx-zynqmp: fix the irq mapping for the display port and its dma
>=20
> Sai Pavan Boddu (2):
>   xlnx_dp: Introduce a vblank signal
>   xlnx_dp: Fix the interrupt disable logic
>=20
>  hw/arm/xlnx-zynqmp.c         |  4 ++--
>  hw/display/xlnx_dp.c         | 43 +++++++++++++++++++++++++++---------
>  include/hw/display/xlnx_dp.h | 12 ++++++++--
>  3 files changed, 44 insertions(+), 15 deletions(-)
>=20
> --
> 2.25.1


