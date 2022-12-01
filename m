Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6C163EC91
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 10:32:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0fv1-0001VA-7K; Thu, 01 Dec 2022 04:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1p0fuw-0001TB-Dq
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 04:31:42 -0500
Received: from mail-db3eur04on2115.outbound.protection.outlook.com
 ([40.107.6.115] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1p0fuu-0002sC-7F
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 04:31:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQpOUpd3L3Gk4atMxOypnl+FqeavoY9gSMdOY8JvUY2h4vuXACZq/gC1lwQSROkYwUhEK9YVzjcALPHSzeeF+ngT0p3D6le4g8sMofB+BiBVkalvbhNlTP0sMrOQFgxs1aXMyDpItDYb7hscPmNSrNHjCvnhxpnaeA7Ado1dOGrIh2D4rXaP8CUgLESvQBEql0h2sqUKxz4BVoA3uyUQf933Blfl7474VtxY6AFCQRzS4Y0WoGkp0SVUselyh0WkjFVkz0B/2vMhuAOoxreucVFmOvy7Lgeok+oCMMYiWZ9lrQLCBBggstwI9OlDkb6jKiZqOlDCuL5OdI+/p1HkEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCgMtIb0EahE5gMa8UAQJmTB/h98QdpZTpk6TtH8ofk=;
 b=ng98sAPxGkxXkHm6wvRB59f7Jo8iEb02s/friIg5sRNeTmukT37afFSKDVSbe/l63bneKK2e4goidlQSeMVR/u6xjnBWU3Bg/GzriigUjfyhRuWX0EGSQ4maP5FxrwJ5TlGs4XO7svo20hl4xOvC4NlyYiIIsNcQT2yjzu0lYcVbRQMk87zTKD2PrcKXBvgi8iJUveRLCDOU9WvuNuf5EMEogojLaDFy/C5r4na3JPjGDf3RpmvtpkV+3GmQfNVrOOzYJvzAk2MOQh+0cLK+r0iY2gn1tkitEqrQecwMhHhOpeEif3G2vMufBaYEAch1stbsQLkPFeNrBfExSoDEPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCgMtIb0EahE5gMa8UAQJmTB/h98QdpZTpk6TtH8ofk=;
 b=qlFHEEJs75W39jKkm0wIC+rCQzA3ItNCv+gsumsQ9pur1hQew8XPSLdAGdBvYwDyL4rXndWCSOf3j1P9ROM2FLD20C5a2px+tous5HCUxZwZB8o3lHBO0mTh1wUgYKQ+/CxGdVviUSOEdPt4lTJvmqTu7YUraBSYR8cTgJCLj6Q=
Received: from PAVPR03MB9678.eurprd03.prod.outlook.com (2603:10a6:102:318::20)
 by PR3PR03MB6363.eurprd03.prod.outlook.com (2603:10a6:102:71::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22; Thu, 1 Dec
 2022 09:26:34 +0000
Received: from PAVPR03MB9678.eurprd03.prod.outlook.com
 ([fe80::6661:f59:ba9e:90f0]) by PAVPR03MB9678.eurprd03.prod.outlook.com
 ([fe80::6661:f59:ba9e:90f0%7]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 09:26:34 +0000
From: Milica Lazarevic <Milica.Lazarevic@Syrmia.com>
To: =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Richard Henderson <richard.henderson@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Markus Armbruster
 <armbru@redhat.com>, Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Subject: Re: [PATCH] MAINTAINERS: Inherit from nanoMIPS
Thread-Topic: [PATCH] MAINTAINERS: Inherit from nanoMIPS
Thread-Index: AQHY7LH2jReORC0J40WpQ1lmk50NPK5C9jb3gBX8sgU=
Date: Thu, 1 Dec 2022 09:26:34 +0000
Message-ID: <PAVPR03MB967895ED1573A16CE6E5A34FF8149@PAVPR03MB9678.eurprd03.prod.outlook.com>
References: <20221030225006.43203-1-philmd@linaro.org>
 <PAVPR03MB96784D39EC71F71C86ABAE81F8069@PAVPR03MB9678.eurprd03.prod.outlook.com>
In-Reply-To: <PAVPR03MB96784D39EC71F71C86ABAE81F8069@PAVPR03MB9678.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Syrmia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB9678:EE_|PR3PR03MB6363:EE_
x-ms-office365-filtering-correlation-id: ef020224-282b-4e27-9df3-08dad37e23ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NRWfutFbJCr1aDreUaqNsxz2y8clsW+K0l5OnLY3qgqn3hdEJzPdH1sA9Fo2/NZ4herXnGwI+ir6r+az49oEZkGm3PIf+SrY7zkCfOqQgrH/jpTaZgvHPPQT10neMK4KvdrsEJGFNtedKTSKKFSn2WTs309gjahg2tTyi6Vurvpb9b5tJ9+LDi5mjaTIUqMh7/lEkEkSHemjmyCXu9gD5qahF7b6LSkbGvQWpwh2Yx99IohlPqk8TGZTygpUKcbbpE52gsjN14meNAqwf3wr7Wsqx1hoQPk7EwzaE3e20/L/M91KcKb3xQIaQDPW/RiKSfadZwD71FC4RGCBhJ8yt2h97jRdZRkDxwEN7pHjOi8yb2aU0JvmCQuBC2LStdFa6mi6Pc/nSOTCqsdBP+nbQCcJK8UkC3AJjoS3NB6B/d3gXPL3SX7CLXTHuRY7OwkHT5tDgzI0/eQHUbzeW1p1GQBce/bK7GEjlgnt9me+NlIuPYYQ8IVLpy6j8QaL5TXs96idKZPqlGohIaq2iT82qpA9uWDOvnL8Dj3EPXJr9K9fkLmro9HqSEe353NlraJVQMYEuEF2YKSxuZifOIejxBV4H9D2ym6Ld4AxO4XawDTJO/nbg4qPULOiHQSkd2kv6AEGeYZSy2G8l6o/BHm8fZCbHtwQUyG2ee1FGuoM5/uNWOy60Lt0Dw1C4rskHs1/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAVPR03MB9678.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(136003)(396003)(376002)(39840400004)(451199015)(66946007)(91956017)(66446008)(66476007)(8676002)(41300700001)(86362001)(64756008)(4326008)(33656002)(71200400001)(76116006)(186003)(26005)(9686003)(478600001)(66556008)(558084003)(110136005)(54906003)(316002)(7696005)(19627405001)(6506007)(38070700005)(2906002)(55016003)(8936002)(38100700002)(5660300002)(52536014)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?0uz9FRuWNGNgQtcHuA7+jIGVv8PEsdm4Q1x4R+KrLMf25L/NLnN/bc03Tt?=
 =?iso-8859-1?Q?twUi87Uqcf2hSXByNIZbVRJL0SLe1Hl8Ww61V5RRBt85nECrHBoEfNp+2a?=
 =?iso-8859-1?Q?Q7mJGBitwMK6RFBo06XHEEFymVKOr2HHILcNUpWvoTq631li+dBUQU5xQd?=
 =?iso-8859-1?Q?6OyqOaYhZJRdGDPfqHOZLdqabeHM5vgVNRQtQ0RJwEFWqN3FrsI0ar6Z1n?=
 =?iso-8859-1?Q?6sahMazMsKNqUsk7X4MtOnRo2wxZYKRswdFQ3HBjmOteEbfPcRGsGC/fPq?=
 =?iso-8859-1?Q?3Tn3b4bE+a4SC1IySvxDTNK7JTwf2N/JRPle+aEHx7UqmraLfYo/u+mLsC?=
 =?iso-8859-1?Q?aMLSaBw1uGYES+Izg408V19iByVgXEiJOqFaHZMrKs7n/wRn8Nbi787m7Y?=
 =?iso-8859-1?Q?epmcVC+t54cuKNWyiirAeTk2ED1YKeYb+ti7sfCJc80i4KXzYG9zv3+w/i?=
 =?iso-8859-1?Q?qhQ8yJhjEuBfnylUhRiPb7BEVGOZp/Q/VrAZ1f+xqhGIcz9xdzJaCXgWsf?=
 =?iso-8859-1?Q?SwKnFJyHOMprUaxEYh/0bw6rG6MbQENc4C9FfRtmDjx92kzbUo2JF5dHaD?=
 =?iso-8859-1?Q?kfndy09Cob8PpPYffhl4XApVNchZ68e4+OJhGKsaQp4GXkdbLcfOisMO4O?=
 =?iso-8859-1?Q?8SZgszmAwjbCczY/5jvdFgiwR8G6Uy9YlyiMJ/kyw6grzefV1hXrxDQPM4?=
 =?iso-8859-1?Q?gl8BfjzGMq7ANu0IPQUb5cnzlfP8IBe75zyLBNBeuDp9G7xfuAVICiMTcV?=
 =?iso-8859-1?Q?6B2nCATwul2vt+MrPWXor7dPoSjO6wX5/Hh0rqyWnN0X45fAgoKqar+Zzy?=
 =?iso-8859-1?Q?gmJWBNRji7cUlLtbiA4vwMGLHavSDmZjl1OAKh4XWstuhnzZ7TCbiKtYu+?=
 =?iso-8859-1?Q?t6Yy1G5Y5nyMeFUEUgFnqW/5I9iPky6gaVJs76l3gAMd5wTZbvm5nNvDAX?=
 =?iso-8859-1?Q?StVpuF4wriNT8jEFtcmB4d6Ww/9raP720MjHwVq19QSsp/1iBnn0jib7Wt?=
 =?iso-8859-1?Q?0xkL1LAzQSVqpW964/Bx9KhBg14QYNzUYOXz32/W61LVtzF+FNqtFWe3GI?=
 =?iso-8859-1?Q?AjoGsJ1wQbvMZWTMiAnRRr1hEHfm67cuusOTL2OgOXPYiyziVcsGIyInMP?=
 =?iso-8859-1?Q?iAe+YYNRxIX2ORkPJoqzY2p/saq+G7qYSHLWanR06ADHRV2picE3Hsp8vO?=
 =?iso-8859-1?Q?ASP2TluioIGh+yg2DwO0wt+U54R0ikTuAYeW4MlSJd1DMrUqcUuMpZt1Q0?=
 =?iso-8859-1?Q?zWbofTZupyjzy35SHI1mliwIwioAyFNKwheVP9L8JvV1yB425nYvSGWoFv?=
 =?iso-8859-1?Q?U0knTWjzLyrGw9hYfmDDcZRLVYcv+WCHMpS3c/W0+HWjnFn93PNUuG/WU9?=
 =?iso-8859-1?Q?EuQGfnsJeIzIXX3z9LlVWLlqUEdlX5SOlrguqzvrMNTUKNmpNhNVfewQ3h?=
 =?iso-8859-1?Q?X15e4GIR+BH5APqubNLb1ChIJtU384rqrOa2Ubbnj2Ev2R+Na/uhWLU00x?=
 =?iso-8859-1?Q?JI7qVyjhN/Lna0q+UsjuIplZLZvysZr3kENcM2spvhZBpRUPUy23jEgken?=
 =?iso-8859-1?Q?LOIwSRzDyY2HIhWAUZv2x4Z+Y+zAGoCe579tpzi2V+MJsgZEELUqCFiegy?=
 =?iso-8859-1?Q?zJksMaY0H8wyUf5rmpFAYCuBouTD4v66SJ?=
Content-Type: multipart/alternative;
 boundary="_000_PAVPR03MB967895ED1573A16CE6E5A34FF8149PAVPR03MB9678eurp_"
MIME-Version: 1.0
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB9678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef020224-282b-4e27-9df3-08dad37e23ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 09:26:34.5843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U6xOZcREoJ3wonlpIy6b8JDpk1itBaHDv7Emq5l72Jq+iOBFeO9Mm5aXqYOo4sR/E/8w5Wt7g1B/BTbFFl2P8Y7Q7nkrkHjFz7nU79zNMGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6363
Received-SPF: pass client-ip=40.107.6.115;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--_000_PAVPR03MB967895ED1573A16CE6E5A34FF8149PAVPR03MB9678eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi,

Stefan is no longer working with us, but I will be more than happy to take =
maintaining the nanoMIPS ISA on me!

Regards,
Milica
Any comments on this?

--_000_PAVPR03MB967895ED1573A16CE6E5A34FF8149PAVPR03MB9678eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div>
<blockquote class=3D"userQuote" style=3D"border-left: 3px solid rgb(200, 20=
0, 200); padding-left: 1ex; margin-left: 0.8ex; color: rgb(102, 102, 102);"=
 itemscope=3D"" itemtype=3D"https://schemas.microsoft.com/QuotedText">
Hi,<br>
<br>
Stefan is no longer working with us, but I will be more than happy to take =
maintaining the nanoMIPS ISA on me!<br>
<br>
Regards,<br>
Milica</blockquote>
</div>
</div>
</div>
<div class=3D"elementToProof">Any comments on this?<br>
</div>
</body>
</html>

--_000_PAVPR03MB967895ED1573A16CE6E5A34FF8149PAVPR03MB9678eurp_--

