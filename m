Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1993B72F0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 15:06:25 +0200 (CEST)
Received: from localhost ([::1]:58994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyDRY-0003xO-C7
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 09:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnick@vmware.com>)
 id 1lyBBX-0007yz-S1; Tue, 29 Jun 2021 06:41:43 -0400
Received: from mail-mw2nam10on2060.outbound.protection.outlook.com
 ([40.107.94.60]:37729 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnick@vmware.com>)
 id 1lyBBV-000162-45; Tue, 29 Jun 2021 06:41:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWcK06mZKQb7KuTpdnoj0FT6G5HSiAsX7ramX94Ia50Zjco1QN9ix2lLhKqKAnCqhVDzk8y+VqpgVVvxTRjZZj46UbTGnhl6sLc3EPw5NiXMSG1IOFRojpevx5FK3GgjS594HhjluXkk1qsVjXhZXy8xrR4YKobZDaQpqztsPf1o7t9a55bZM9hbxWMx0kQRK1PidL+eJGhH0FE48QBUa33libmONNW46+ehapTtgUnCu17FqlTG6ALmYJBIyDLNV38Wsh8fw6PSuLazk6aZznEJcmrwdhq57lMLNc9jDgDxVJcg3Sqb6Xa9DUwfpqGVYp8er0/MdR13zdofDLxzoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTG5SdazNQpwymNwHRk1gg1p9nqA44J1CnlKB4tLZ8Q=;
 b=SxUfjPKpzfTVipQA2Fvo79p3f4aLg5ozknsQCmghZa8Z/7v+TFZ7VjHWfsFSXvBpcY9cDQfPHXyww8qQe37vF4F2QomD4+uHJqBWTugqcYge3hfCytKKNTLTVrBl7I6bb5e9RB6BIDwj5zpYCdlykzuAp3Jcutw/yYHCZsp2Ouan94H5hluGjpxL8aPSsVNbtBAIMAhIz/Q4/o0kv35d1azN7s6zR66UJxultstR6M88CDFCkB9rMQ/AwWmfpE2nQvUeWzzBdmBJ2MdJGHvhW/7VJ7xZ6LJgguxnsPc0XI81fIoT8XkdRrO9cf/1OGOTS/eobOTP+RQ7ULiHSFhhSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTG5SdazNQpwymNwHRk1gg1p9nqA44J1CnlKB4tLZ8Q=;
 b=he12w8Sz6313SvLac08evsPtC0YKawyQsv5DdPSNsIX4u9bPr7xSqxPw6UqsRJ8Ran63hizsU7eX+DgTFp42AVrVFAQJ8FzSxjxdWuOgNItRj5kcJn8AgxCVSQdaD/IYp7MA61+QaSnaeDCLR67bw+Tj7UaRxTzYsmLbWtP9YII=
Received: from BYAPR05MB5623.namprd05.prod.outlook.com (2603:10b6:a03:79::10)
 by SJ0PR05MB8615.namprd05.prod.outlook.com (2603:10b6:a03:386::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.11; Tue, 29 Jun
 2021 10:41:35 +0000
Received: from BYAPR05MB5623.namprd05.prod.outlook.com
 ([fe80::71e2:b6b6:2ac7:3bbd]) by BYAPR05MB5623.namprd05.prod.outlook.com
 ([fe80::71e2:b6b6:2ac7:3bbd%7]) with mapi id 15.20.4287.017; Tue, 29 Jun 2021
 10:41:35 +0000
From: Nick Hudson <hnick@vmware.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] target/arm: Correct the encoding of MDCCSR_EL0
Thread-Topic: [PATCH] target/arm: Correct the encoding of MDCCSR_EL0
Thread-Index: AQHXbMCSdfZjmXjSHUOdWVc01tqN36sqvr6AgAAOaQA=
Date: Tue, 29 Jun 2021 10:41:34 +0000
Message-ID: <35FFA736-504A-482B-B78C-17F7381C7D70@vmware.com>
References: <20210629082713.31396-1-hnick@vmware.com>
 <CAFEAcA-vSoriA2iCwyvBWofj1UvtMuRbEnqNuCsoG_hz1Yth_g@mail.gmail.com>
In-Reply-To: <CAFEAcA-vSoriA2iCwyvBWofj1UvtMuRbEnqNuCsoG_hz1Yth_g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57f56fc7-c828-4569-6b07-08d93aea777a
x-ms-traffictypediagnostic: SJ0PR05MB8615:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR05MB86157FDC25902213DBF3DAC6C8029@SJ0PR05MB8615.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VreAxeTLFee5pRSZrd1w2oEBpbRUYOF2tNyK1IM2By1UlvI0/9HfoOO/oV5bkfgkp8liV9zCaqgVCutL+cI3AWfB95mN6xWVoemrAmM+BIOYWpX+rKBnmxjhskKfuOxaMuwYYM11LLXP2Btw3CgRb1xrNGNJFOExB1Rlc4/Ryffx4MdX+HovsCZVF14MUtDjUR9EtLIPZnPqJMMElEGfuuio6OO9cVf/M+kvO8iPjMd7WgeWF/nYfplXbqA6+RfnnqF1p7ymxaEIFJIRNAzgwn9aAyeeYsFRTfQbM9gFncxtNxDRa+LQvDV8608i0Ou51AzZ4Iuc+D88ZtW/f3aZHXMoG6sjYtxHlr6a5gUottZx4+SfQ+N2PlRVXYK+3yX+Maypqnd52Qrc7JlFH0ZN450EaXryRsg1d3QFU1lsQp1IYcFX99a+ZiSvCKx72XQztQ44mJGHIMhjx0iL34+gscsSAlx7y6ZLg0fE4kABpRY3zQ/ryzQppCyLCCvgQ7y9vPiSoo2asLWw2+JhwqAwEmwMZ71ALPD8ZCuCmN+k2Vzu+0uN+DbOOxHmdXOPiSdEyutK8qaWQzFCzSta8TdurNxtQTsBBG9IZxmuN8Hq+BDjkUhyYMWOgxb12zvZmdm8SCXGS1F2zyR2ECH8XoHO0QpodAwb4OxCgNBd/4FTCL0AR6PRRpaMW7vQir8kEKFVcgio4McwILhykY84o2MtmA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR05MB5623.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(136003)(366004)(346002)(76116006)(64756008)(83380400001)(478600001)(86362001)(66946007)(186003)(122000001)(54906003)(2906002)(2616005)(5660300002)(6916009)(8936002)(66556008)(38100700002)(71200400001)(36756003)(91956017)(6506007)(53546011)(316002)(6486002)(4326008)(33656002)(66446008)(8676002)(66476007)(6512007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fQszouJmMY0mw38UiTRCXj1LZahJE2IFhDRYX0R55bhoGGAeRDnxdQt8Busf?=
 =?us-ascii?Q?ZwVjRqVym0pBEfcRUGqIatDp84Q5F4Tu7Ji2o29QQC35jU7DKe5bGt535YC2?=
 =?us-ascii?Q?5U6H8x9BW6zKQb20GWFbIGc2qDLueKjON0VVWY+amq4PaM5X9EtU9gHom0CF?=
 =?us-ascii?Q?BJYOhh+4TRBiVTkkO0rcksyMEXhAIziiWIFha/4q95nJTyK0oIjips/mOW1L?=
 =?us-ascii?Q?UZR989CoH7l0Vh+AeNn7f9EqIcW1O9UX3OtVeMZ257j0duxfjUxb1+Uxlxpy?=
 =?us-ascii?Q?hrzrUcJf1OqVyldC7z6o7cxDgSsq+9eZ023kefJanTmUPqvSTlTsHL8Jqj7I?=
 =?us-ascii?Q?6ZRUG1umzeQUEVUcfE55Jo/TghabN7ZJL2QrkbZX8SpXQ2iE4PBCJZN1MmPl?=
 =?us-ascii?Q?/HZ7jTYR2qPD+dmTKOhBwCNhs2Xs7eBZoP2PZ7wbm8Bkr6nS7jZ/Dl/JvrEp?=
 =?us-ascii?Q?hYXrC8WXy0z+6jdpuJsk25Ol+VOQN9Sp+rv07RIFb+FJsK/GOvRDfkUa5afD?=
 =?us-ascii?Q?bKe62uQdr89YlVSfeYupNI0L733sCfFeY+c3lgWg+x4dCAElqmBBTEzX8W3R?=
 =?us-ascii?Q?6FVsbE3tGGcB9xTt6N8zGexlhQJkheESN5bTlIw37eEZMKgc8e0Bh3wP1hpZ?=
 =?us-ascii?Q?jQSm7L0DS4z6HQiDoPvf+F0XDyQY2lQFoIocwTr3Kyh22wKFRFNuNwCgQvDU?=
 =?us-ascii?Q?+/uE2KJwMrnnZMdM6m7iZ2XMTJHOZci6IFeRWPX04zeRFf2WwfzHc6otsfn7?=
 =?us-ascii?Q?YlDItSc+6oFeJGpU4KXHPtMSnGNmXDiVFT4krdnE6t0QPWzOxpotA7z4E6nN?=
 =?us-ascii?Q?F5jbAp64pD8NPJtfi8u8N/KruXbIp76GRfNuGDd1+UyiFnQYIoC/mnMNtwte?=
 =?us-ascii?Q?DvPfHgsvzvOJEFZxxvws+vppCTZbxKQLtm9z645LN476xOGzTcXcbT6zUAKQ?=
 =?us-ascii?Q?QTrKAYTKiPSg3JiHf1oCiGqcv9k4cwWQtRfLSr8kYpN0qPeHjoIi1Am7aGPt?=
 =?us-ascii?Q?0gerZ9h9yse4i6ZAiqA1wi1jaJDE7ZwDS48JQ4PVne/jxAUrl/UK3CkdeeBp?=
 =?us-ascii?Q?lTsjxOssQzT5rxl0JrNikpujG+Z6d4DpNtSJVgp85843z5G8U1KMIjCt8Pev?=
 =?us-ascii?Q?pzgo8D+WnBxAdAWPOkWzRk9NeyBjZWCceP06zMAu0aDCfD/vUdVPZTJJhSA/?=
 =?us-ascii?Q?4k7JiHOoS+PNqWN1W4/2XwxBH18SCG7ajSDWZbbwl4UPQFAeDcqDOdlRiYLB?=
 =?us-ascii?Q?bOLZuw9aljx6wFzN6QsEPhB8oJ7c+FNDkJHzAzSWaygs7ifKPsmmlTednU0V?=
 =?us-ascii?Q?6lvMvgXBp8O9TmHFYjbdIAb24NJG0ENdefdpXagNZz7QONgbpSPrtD061mNx?=
 =?us-ascii?Q?0UjQ98bLm63cLh0gEBqJtfB9jDjS?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EDFB29E3C9CC844CBB3DF180EE694838@namprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR05MB5623.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f56fc7-c828-4569-6b07-08d93aea777a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2021 10:41:34.9216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zruHhHZVWSv8va1V/T91PWLAO483fDDdPRzTXKs3yTWvY0RPZtlj/9us915F6gw4G6J6RwggwcIK90cbHQnIvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB8615
Received-SPF: pass client-ip=40.107.94.60; envelope-from=hnick@vmware.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 29 Jun 2021 08:59:28 -0400
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Mohannad Ismail <imohannad@vmware.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 29 Jun 2021, at 10:49, Peter Maydell <peter.maydell@linaro.org> wrote:
>=20
> On Tue, 29 Jun 2021 at 09:27, <hnick@vmware.com> wrote:
>>=20
>> Signed-off-by: Nick Hudson <hnick@vmware.com>
>> ---
>> target/arm/helper.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index a66c1f0b9e..7267af7924 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -6330,7 +6330,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] =3D {
>>      * We don't implement the configurable EL0 access.
>>      */
>>     { .name =3D "MDCCSR_EL0", .state =3D ARM_CP_STATE_BOTH,
>> -      .cp =3D 14, .opc0 =3D 2, .opc1 =3D 0, .crn =3D 0, .crm =3D 1, .op=
c2 =3D 0,
>> +      .cp =3D 14, .opc0 =3D 2, .opc1 =3D 3, .crn =3D 0, .crm =3D 1, .op=
c2 =3D 0,
>>       .type =3D ARM_CP_ALIAS,
>>       .access =3D PL1_R, .accessfn =3D access_tda,
>>       .fieldoffset =3D offsetof(CPUARMState, cp15.mdscr_el1), },
>=20
> This fixes the encoding for AArch64, but breaks it for AArch32,
> where it is cp=3D14 opc1=3D0 crn=3D0 crm=3D1 opc2=3D0. Because this is on=
e of
> those system registers where the AArch64 and AArch32 encodings
> don't match up, to fix the AArch64 encoding we need to replace
> this ARM_CP_STATE_BOTH reginfo with separate reginfo for
> ARM_CP_STATE_AA32 and ARM_CP_STATE_AA64, something like this:
>=20
>    { .name =3D "MDCCSR_EL0", .state =3D ARM_CP_STATE_AA64,
>      .opc0 =3D 2, .opc1 =3D 3, .crn =3D 0, .crm =3D 1, .opc2 =3D 0,
>      .type =3D ARM_CP_ALIAS,
>      .access =3D PL1_R, .accessfn =3D access_tda,
>      .fieldoffset =3D offsetof(CPUARMState, cp15.mdscr_el1), },
>    { .name =3D "DBGDSCRint", .state =3D ARM_CP_STATE_AA32,
>      .cp =3D 14, .opc0 =3D 2, .opc1 =3D 0, .crn =3D 0, .crm =3D 1, .opc2 =
=3D 0,
>      .type =3D ARM_CP_ALIAS,
>      .access =3D PL1_R, .accessfn =3D access_tda,
>      .fieldoffset =3D offsetoflow32(CPUARMState, cp15.mdscr_el1), },
>=20

Ah, yes.

As MDCCSR_EL0[30:29] only maps to DBGDSCRint[30:29] maybe it should be all =
RAZ?

Thanks,
Nick=

