Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9EA58F2E5
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 21:16:55 +0200 (CEST)
Received: from localhost ([::1]:37962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLrCI-0004CT-Km
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 15:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sfotedar@nvidia.com>)
 id 1oLr7e-0006jv-RG; Wed, 10 Aug 2022 15:12:06 -0400
Received: from mail-mw2nam10on2054.outbound.protection.outlook.com
 ([40.107.94.54]:3585 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sfotedar@nvidia.com>)
 id 1oLr7b-00030v-VJ; Wed, 10 Aug 2022 15:12:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bk6SUKVyxqsQnYh0XYmphNhR88LDx92q5Jxs1U283KJgYA+u9bHD9zKC+Wtp4lQLoqPAstEb5dTFPMNk0grwtuRmgW/0IGV1+L2mHVsb8sMGLiS1SRpBW5YSHcdcLD5BECmZFbQrvlCA0VkaBdQDfRt8jAd9w9zbkm9bylDkpLFTZ5GdDXnPqK4BtzH9VDA3aO1F5d59oio7o7fDzhXaBiWez/LpJ67I1oCOuXxJxkge039+YmIgABotTAtzX7lXfcN1N/QFGxFUTwHk8xqZjyzKyproBp8GVBpCtbdtmfSbYFC5/ZMpENXRBilDuyC99L9UhDbOKhHw/8K/S0qKFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lFpbZD9Oi0uyEh7T+rK5RBxASoyNP9FGoBBW4WFcIs=;
 b=E149TN3Eqe2WahR95pzktLLKqPw0+dzPulZC4wWMTiV4p5LmGNmTNH9CyL25aaUgDYuKsGLVLoaBxarZLjEcVyYzDL8Mqbgc+A61+zIWHjPTTUGAOGOcVEgfS6bVHaDDRPi+R6nHusRN7flGN3RHS95i5X/ORQAo72TAsYtBqkguJN5jDEIn0S4MrpgdPBs42AFSq52kzRb/mIqiJ+OvLeeeU0qAXZSycy3SQCpsaaYPvi6ZbwD78ZdBcUp1XjiAZMNEqYdHvXjDMW1vxoaosXaUEIeZzVDAxfwqMdUp3gcuM7lrpv1id99FyFi/jWS2P8aalNfiSVKh2yopbYZXJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lFpbZD9Oi0uyEh7T+rK5RBxASoyNP9FGoBBW4WFcIs=;
 b=I+fk7uBgGN+DGC5Q+XUUTzAPzWemKiK2HxFgTVFyYkWpl18d86j59Mdd7Fy64AKMYWFAXzocPHRlH09MVWGcRptuwK7AbkIh6a7qMr0EDXlU+djdZEXc6TdHBwNHPhdS0FpU4XWXMAw9U32P8yAw1DTymuaFY+b4NYJY7/svTgEY3RhDhslX6b37zG6O+bwWsTMEkIJ+lTfZLJvZjKLfs9koHLZkMfCpUZNrcUtakHgjrGF2IN+hVX+KBi5NmKaBaRzKAkY1G+IbH7mU/iSVeGXeVB87PG8rc4+N0BeETpsocSVjoYgcL3zC9GiCm+JDr2+ZFQ+9eS0sGPS8K6kFmQ==
Received: from BY5PR12MB3891.namprd12.prod.outlook.com (2603:10b6:a03:1a3::10)
 by MN2PR12MB3373.namprd12.prod.outlook.com (2603:10b6:208:c8::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Wed, 10 Aug
 2022 19:11:57 +0000
Received: from BY5PR12MB3891.namprd12.prod.outlook.com
 ([fe80::f53d:bd4a:67e7:2090]) by BY5PR12MB3891.namprd12.prod.outlook.com
 ([fe80::f53d:bd4a:67e7:2090%4]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 19:11:57 +0000
From: Shivi Fotedar <sfotedar@nvidia.com>
To: =?iso-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, Joel Stanley
 <joel@jms.id.au>, Peter Delevoryas <peter@pjd.dev>, Jeremy Kerr
 <jk@ozlabs.org>, Klaus Jensen <its@irrelevant.dk>, Jonathan Cameron
 <jonathan.cameron@huawei.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Andrew Jeffery
 <andrew@aj.id.au>, "Amit Kumar (Engrg-SW)" <asinghal@nvidia.com>, Prasanna
 Karmalkar <pkarmalkar@nvidia.com>, "Tim Chen (SW-GPU)" <timch@nvidia.com>,
 Newton Liu <newtonl@nvidia.com>, Deepak Kodihalli <dkodihalli@nvidia.com>,
 qemu-arm <qemu-arm@nongnu.org>
Subject: RE: AST2600 support in QEMU
Thread-Topic: AST2600 support in QEMU
Thread-Index: AdisIeSsY02sPIDTTCawmJGYit8mSgAQEX+AAAa47wAAG+xkUA==
Date: Wed, 10 Aug 2022 19:11:57 +0000
Message-ID: <BY5PR12MB38914647135A9AB3A006090CB4659@BY5PR12MB3891.namprd12.prod.outlook.com>
References: <BY5PR12MB38917595B0306085EEBB1921B4629@BY5PR12MB3891.namprd12.prod.outlook.com>
 <CACPK8XfjXq6RW=M++UebfiGeij=GDSk5f6ZftNaL+2oeyCGnHw@mail.gmail.com>
 <ec20d3af-5f99-8e56-9352-75562c4548de@kaod.org>
In-Reply-To: <ec20d3af-5f99-8e56-9352-75562c4548de@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 765a95e0-bf00-4e72-7658-08da7b0431dc
x-ms-traffictypediagnostic: MN2PR12MB3373:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hILd0YxcR8sDgt/XdNjqCVAWl3FDck0nG10LA1PkTLaUl0AoMU+MOuiweeh7YJCMCTIDGNaBBaFIv5bxrTo0IwcwpvVn03hAcp1BKq77zEZoH2EmYhshotSi1ovj6+OmyZKcccdSJuXXmpFqKrcLjpUDWEjMDfudNtaeR91uX8rVgUVIBSwXNbIyMQoKQ4ggE72HTki+HCZaEQsQStLeemOx0LfJWH/dgeIJHB69fAY5mn8i9bx9PT4s6FZENqBuolBFnM0oYlGxfI1egecRg31jiRUerXq6nL1UOjugKRR7IAAifvwo9A9enVugmxhjCdjlWHHhntF/ZCSv8s5RF5iQNI3Mu9Ua64h4KRL9gJnvx0jeWAwNt1Q8WKFnSSwA3BzrMovJUql+Xzr/oPvymSugx6GlyQ0X6B6whNPRwxSkfXKhS0LdegmumryD4EGlRaBcFbvbV4VAxTG74SJ0WRxlaYNqhgJGVjMsdIOo0WmZKga5itzrc6eCHcFQNXUJtRH0JTDj2Rik3uBVKa5b7nTdopF2cZSnZKY33jBHwXR0DoeDr6Wa+ZKMHpfbIv7gwcYlj6iSBhaLbmYDSQzJWuKmB5eM59gZ+f07SRH4hjyiQerrfHGNh0QTuBDLe/t1vGM5+syqM7mPffgjkjDe0SqUibOyo1IJBFK4A/FaaMx4iyOkovmn8o/ly829F5Dx2VsX8pYVB75nHfNlaSE/K3QlK1rZV+PWtnQjZcEoaBxa6c4w53AYxFAMtET7ASx0erAjln9GmqFDC750WKdRB1rHRTaOESsQwcBs982a/3Ksu2dspQ+bov7T4zbYHpm0Y6UALU0xfNZTsZmFWuchxrB97PjhdulLciVKdnl5ZJoDXlbwQubZU2cAzlhjkDaX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3891.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(7696005)(52536014)(66556008)(71200400001)(8936002)(186003)(2906002)(41300700001)(33656002)(966005)(478600001)(83380400001)(38100700002)(54906003)(122000001)(316002)(110136005)(45080400002)(86362001)(53546011)(5660300002)(26005)(9686003)(6506007)(4326008)(38070700005)(66476007)(55016003)(8676002)(66946007)(64756008)(76116006)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Bz8XoV1dtFgr+aXKKI8ipfu642wWLEdQjO3kEHuTTmQ6rr3yTJX7NtYUid?=
 =?iso-8859-1?Q?ejyLx11c/aVjr7Oco+zXmxrDnJ4HHWbr4emZNVQ4nuteQZb0E6yOtnE534?=
 =?iso-8859-1?Q?w5+ZzRU13bciW5ipHp+EzryZCJ9o3HJcPQxHcIB9+RJBK+/q0dIyMr4OYD?=
 =?iso-8859-1?Q?LuPJLYtDNHkQ0o6e3xYrbr6expgzG2mvnFZxS/iSuAgpVuPpucMz53JxZE?=
 =?iso-8859-1?Q?dze0imamK/l9M4Nql/w8y99224rC1GmXPedS1oQUNuE6//aS+tm/tD7dGN?=
 =?iso-8859-1?Q?K0K6PPhElW2QwRSHrJz7kXesQEF5PzBov5enSrNvwhs4oNdTG04h+OgvfE?=
 =?iso-8859-1?Q?xDGgFnB9XZg6ZMZoFSOf37rHkf2GW1dNxiLQA4sWkDepAwPOpShrpcXCw1?=
 =?iso-8859-1?Q?rHQUYgRuPt2fWgmJ0HNxMMYDfmUg8RJcI+60POpTGnxexloQ1OZYYCjB5I?=
 =?iso-8859-1?Q?IGHzc+A7qzDbl+dqnnOgMZZVK4/D7CvN6BhvoG2oH3yb3RcQrJ1VtQo/zJ?=
 =?iso-8859-1?Q?unL/uGtPbYAjLOvgiC5jrGuv4slelcBR9gWpxf4bs8q2GYAnjrNuVVJlCY?=
 =?iso-8859-1?Q?OU3rOUogcCJIDsCJCDqHIUBS7XfJiFIoxNtZa+dirYEPPfi8WIyrxRNQ8b?=
 =?iso-8859-1?Q?69d6ERJWUN7quv4vk7U33d7u0AYKAU4IZDFhVVCdTCqQTr1+VMiaZvV3/0?=
 =?iso-8859-1?Q?IJLH/kFaMJSYG9xhg+meBconD2awdb3DJuWRCFRgXtJf4T8mxdxAaxIImQ?=
 =?iso-8859-1?Q?2sKT+qYJhceDYFU3JHi0gRiWEZUGaoPEqSfIysnijqkIGLCvdnnI1oOX+Q?=
 =?iso-8859-1?Q?v5FNm5k3Vyz7/qdHtZD2aa5W2HBuNdyiddr7ilT1ut37c0hCfF7Z7GPr3w?=
 =?iso-8859-1?Q?bqpGGXHrVDpA/hmx5+53LlYuMYhPmfCWkh9XfpErccVp5Jy7nm5rj9ueks?=
 =?iso-8859-1?Q?GtxT2mGHiYZRSvsYOJbIpkHiHraTz9n8MZPQ2LPGCQR5V55utInnarqUaK?=
 =?iso-8859-1?Q?AbNhZLbvrUAHqes8vti9upXWxeNCVoEj4m8HP5ZcxGbhAnRzsXoMu7EF+g?=
 =?iso-8859-1?Q?4qw0fptFs6ZLwcuACNkZMTnFhIr+Miu5jFn6Mb1cKQOYSIKlpciJ+ugH+0?=
 =?iso-8859-1?Q?mdCrpEdIjyYm4kXAmshYXyDZYMX7S47BtFn9PIIJI1SqYG2O3VBWsDWxpT?=
 =?iso-8859-1?Q?tshWFhks5SIxgRPzntXxTiyGVdp+kqGoAOGn5VjM7gQLibzmvunWMdAxz6?=
 =?iso-8859-1?Q?8xI2ohW2YMD1g0nkkNwABeRg7tyhz7cvUgo8B4wryMSIRfSp23uNLl3biZ?=
 =?iso-8859-1?Q?IlbWqpMgsRcV5LVAmhPHTunikdaxBasng3ZcpNGwdeYbCBDvWXlIeAI+mE?=
 =?iso-8859-1?Q?rtazTznxEIJLk6rgx3VRHmhBY0rF7B8dmQ2aqO2ahpADNzNypDV5Xj5aBi?=
 =?iso-8859-1?Q?6JX8ebkKdH/IDg7Fw/C5u5dfLRU6GYB9zadZdFMbS9hyAOQdIHHkgyMV9Q?=
 =?iso-8859-1?Q?MBtTSH+DmZwE31SWTyQqBJ5nWcP6RJmDb8d/20RB66QoLWQehnxza9dUOE?=
 =?iso-8859-1?Q?U3bh0w34n9ryxaFwZKxW/GibmBau+4xFk2NgSVg7V0HotV62l5Y2kvymOG?=
 =?iso-8859-1?Q?KD2T3Qza4m7AM6Nq9QNinxfiiZLuFvkQ8N?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3891.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 765a95e0-bf00-4e72-7658-08da7b0431dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 19:11:57.2807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QdwS9PKN49vDSrdqWFJbaFMifUxnEjFWRlyEA59cyy4fPE/h26sXmkBgvePHjNtSHFimx+qtiZqBQZnGt/GuEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3373
Received-SPF: softfail client-ip=40.107.94.54;
 envelope-from=sfotedar@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Cedric, Joel

Thanks so much for the pointers. This definitely helps. We will get back to=
 you with any further questions once we have looked them over.=20

-----Original Message-----
From: C=E9dric Le Goater <clg@kaod.org>=20
Sent: Tuesday, August 9, 2022 10:50 PM
To: Joel Stanley <joel@jms.id.au>; Shivi Fotedar <sfotedar@nvidia.com>; Pet=
er Delevoryas <peter@pjd.dev>; Jeremy Kerr <jk@ozlabs.org>; Klaus Jensen <i=
ts@irrelevant.dk>; Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: qemu-devel@nongnu.org; Andrew Jeffery <andrew@aj.id.au>; Amit Kumar (En=
grg-SW) <asinghal@nvidia.com>; Prasanna Karmalkar <pkarmalkar@nvidia.com>; =
Tim Chen (SW-GPU) <timch@nvidia.com>; Newton Liu <newtonl@nvidia.com>; Deep=
ak Kodihalli <dkodihalli@nvidia.com>; qemu-arm <qemu-arm@nongnu.org>
Subject: Re: AST2600 support in QEMU

External email: Use caution opening links or attachments


Hello,

On 8/10/22 04:37, Joel Stanley wrote:
> Hello Shivi,
>
> I've added others to cc who may have some input.
>
> On Tue, 9 Aug 2022 at 21:38, Shivi Fotedar <sfotedar@nvidia.com> wrote:
>>
>> Hello, we are looking for support for few features for AST2600 in=20
>> QEMU, specifically
>>
>> PCIe RC support so BMC can talk to downstream devices for management fun=
ctions.
>
> I haven't seen any PCIe work done yet.

I haven't either. There is clearly a need now that we are moving away from =
LPC.

>> MCTP controller to run MCTP protocol on top of PCIe or I2C.
>
> What work would be required to do this on top of i2c?

I think Jonathan and Klaus worked on this. See :

   https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore=
.kernel.org%2Fqemu-devel%2F20220525121422.00003a84%40Huawei.com%2F&amp;data=
=3D05%7C01%7Csfotedar%40nvidia.com%7C09cd2aefa2a24815b86e08da7a94370d%7C430=
83d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637957074871711009%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C3000%7C%7C%7C&amp;sdata=3DZ0jZN8QEjZIk1zxgfr37NOt%2BNp4q6bDRkxO8KI4Clrw%3=
D&amp;reserved=3D0

>> I2C slave so BMC can talk to host CPU QEMU for IPMI
>
> Some support for slave mode was merged in v7.1.

yes.

Peter D. experimented with IPMI. See :

   https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore=
.kernel.org%2Fqemu-devel%2F20220630045133.32251-14-me%40pjd.dev%2F&amp;data=
=3D05%7C01%7Csfotedar%40nvidia.com%7C09cd2aefa2a24815b86e08da7a94370d%7C430=
83d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637957074871711009%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C3000%7C%7C%7C&amp;sdata=3Da4bP1xJGC25Dp9UkYKU5i%2BODLQrpfgLN%2BaQPkK9LRZc=
%3D&amp;reserved=3D0

We also merged a new machine including a BMC ast2600 running OpenBMC and an=
 ast1030 SoC running OpenBIC. Work to interconnect them on the same I2C bus=
 is in progress.

Thanks,

C.

