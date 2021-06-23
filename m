Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B9A3B2191
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 22:07:10 +0200 (CEST)
Received: from localhost ([::1]:43888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw99Q-0002lm-J7
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 16:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lw97c-0001St-0X
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 16:05:16 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:18548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lw97X-0006wd-IW
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 16:05:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1624478711; x=1625083511;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RwvgpmB5rzFQVpoQzbNBshCfA0x3ucrlqClStkyx4Wc=;
 b=2ZTR1THadPW5agP6cmoG0kXhrZyVTHDIJ6w7Qz0EfY0j3wKeHkAfLAns
 gmrorXM9a27JNoVQ8CZXRQirX1sWPvwLDKp/03oNfMY6FWKrQGLDg+j4w
 2rld+q9nw00sp9GGs8FSQT6rkNkUBD0Zn2X/12KAlrifDnWxdQnnKIyc4 A=;
IronPort-SDR: 3fcrJY+6Zpm68IrDF62vwv+2jcM/cVwFeqyjpPw1rxxw7Ke0cSp6M5SOEes0hseMFk0EyiYpag
 RockiMCfkGhGjsAaIGvbh5/QPI1EgLZ88eLYaXCK1kKBGGKc5KZQ26mFgN8x8fBcYg54sNvA8Z
 RQS+KkOOa2QL4nwCWeoyLxSfG75WhSERWK0mhFSWxSYwkMGIzGMitp4oVfIsnn5z5vgkOx3wya
 +2DC7bDquzBTW7tkMbfZmxVbdv/cGGMMml/AKLQv2B1JF37adJsyZm8y8FYDUK2pmiCllAIAEt
 4ho=
Received: from mail-sn1anam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.46])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 20:05:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0GncNRyejcwHi52FYkJ+uEwrOQYiHf5WkXhEMwmsQxuKqlwb29XqdhTalQVq6O4o+BYXYpq4SrcJoFWuNTuv5xG0dy4AWLTbqW54Xdab705xkJ4tA98tNm7ZcR4Ss+JTDQk2KeqXbKNlaEr8WKOZXUNEu6zHP8eSO4d3p05jBiY2bax8gedVTBbmvbkpth5ADxxZEKuPzbOvXQC3CIvODvI1AM9emQZfYe4kAWL1mGiiaK+qOQYq/Y+MlFlUbGj7jFEUxJyxz4BfJctuf1/875j+Hu6HdYEIeQ0T5ddRfE/jokfnVD2hDe7ReViZ6M7rkaxje1Tsudg5VihTIz/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lz55TVEQXViAg8ZS8gEAKC922hmmfRJslOJHLRlPOUg=;
 b=YIbB8l5Rc3Z5PkpjWBUdmXyMQfMBdA83yujs/c4bI9FmuMMUYhd/LrkaBcqZYHPn63n0oemUs6IDN7TnI+bLmsx3NeHqLx2uW/BreyVbMtal3fuP9kzw34b3CLPbe7bZcwHBab58zBzcl2DRuRXs1nDEDzXLTehGF4Uwy0hG36UDqCEh4tFn24nxlkKr2dRPHzeS/ck/carlfHgR70Spa+74umXzLehQXBvRKVqv5uhFes4PJ0J6lvvmcWcHbxpk1G0H9gbqM9AmfVPC9Y5HJfC7i39mo16CvB7CatZSEWkiHL45liDy94egqW/ah8HJCvAkMN32ssfj5/B0rCmY5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4232.namprd02.prod.outlook.com (2603:10b6:a02:f8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 23 Jun
 2021 20:05:05 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed%6]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 20:05:05 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v5 09/14] target/hexagon: import lexer for idef-parser
Thread-Topic: [PATCH v5 09/14] target/hexagon: import lexer for idef-parser
Thread-Index: AQHXZO7BUuWx7rEkUkmKezCeuPjGfqsiBORg
Date: Wed, 23 Jun 2021 20:05:04 +0000
Message-ID: <BYAPR02MB488636852F71417BE2EA28E3DE089@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-10-ale.qemu@rev.ng>
In-Reply-To: <20210619093713.1845446-10-ale.qemu@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa5319c1-12f0-467a-315c-08d936823148
x-ms-traffictypediagnostic: BYAPR02MB4232:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB42328D59793BC8FB22BDE605DE089@BYAPR02MB4232.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c2H24S0efpCdAMMcK1l2VT/mS2ek3kdM8HkV9rRSzeWH+uGvLNjmCXDHJmugs8Ejy1rGS27HAH7qCR6ciy61VlDDZMfo4ulTcSCbtXsijrbJlWR1IAX69saM/qxLo7A1zqtPANxDhdp/MVsrmvzddTbwiX6d+Ec4XpImaLBhnwvCzeVMQEIbXTMFB55E85EHi0cXdx1m0VWnJY365i0o5e7RzaKoj3qriblEYxW4zva2u+MQ1r4vdkS65zE49Ssl0IdF3qKeyHnAF8lZu56UgukNmLP5I+fgmEcMITuVRWzVjwsMnWVpsVIqqtsDg0dF5qW5XiIZMWPYhHSkp3BZWoqYPrKl7VA+j5HDfuMCJp6bbcMM3VbJ0rI3UOT+r0mvXNLGWluFafYzIKEcf16M729pPO+VgEyB9FmbvmOkIr3jxO+YM4VMETgaGRwVHU1HLjalQADc7mx5RizQ7ydoOfNpZFs8km5ncq4b5OB/T3ArnesNguJ4FMQxylvaVmyBKvL50VTSlYlypxXWhUzAvZnjXWgyBk/B1fYniw/UVn+yjz+ay1A1tn+dku3HkMGnR6Xb8yHCn/jBvhSHMyehsQQWuQ2M7/gJFiN/NN/muV3+WXizJwQR6IOiWfVr1zpNjr+vLb75Q09IAc8pQExEMw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(6506007)(83380400001)(53546011)(7696005)(186003)(55016002)(33656002)(4326008)(498600001)(122000001)(38100700002)(9686003)(8676002)(76116006)(8936002)(71200400001)(64756008)(66556008)(66446008)(66946007)(66476007)(52536014)(110136005)(54906003)(2906002)(5660300002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wpc0n4b43j5ljM28/wOAjPw5bGkVUpUpo/r2I5UGQxrKlHqNBvljbK96l9MP?=
 =?us-ascii?Q?wERDGtYaok/ZSB7oGvnA7/yiwxz3/6Ds/dHBy+iIygvS/PLZvGcs4Pjo0u7m?=
 =?us-ascii?Q?hc0fs/U5BI/ht/DGlQF3SiQhfx5aD3GAny8Z6hmsEDriTpsZMAhxUzT0d1hd?=
 =?us-ascii?Q?jH60U8BxrC6+vzzNqhymyh8q0V93v2jpiFxoZQVqC4PNIEmNtxQdTiMl+3YU?=
 =?us-ascii?Q?XhNLz2S2nL1bAE/JA5mH23xiwEqV5dbhfLCbum0IzKPN0i2kMkuvDgylzqQA?=
 =?us-ascii?Q?763JrEOpEWlWE0eoE6fQhaEhhL708yWnprsnRh1Jz9LEqSKN2ehyZBgHVviC?=
 =?us-ascii?Q?nH9D1imywYHeT5HIszlTVm0ZlV0ACnfOdcSXIRuW6E1kVqzmEgj+UhiO9sZQ?=
 =?us-ascii?Q?11ooBW6bbV0SuG/t/OY+bPb5qAbA8IpgwY3VL71p+a22xAex9+1bEe8r5Uyh?=
 =?us-ascii?Q?EmEya/XjumkDMSAzDlczgNB0NELaNDj6NmTXOH4C+SLbJhGFcPffqLpsyZG2?=
 =?us-ascii?Q?TqUpttrot9tFcZpEjYxtAwW5juKBHg6MaFQJqE7vR7EVB6+NvmxInsWy4Y8X?=
 =?us-ascii?Q?c4DFKrp093yOIaEhlz4T9Ue9wYfGNPJtYifXEdFv64P9IO7ZygWHIitrCtq/?=
 =?us-ascii?Q?IpwOZNT6Z4qhnK3rvhfAooUw0q3Q4unEkyqLUFzepP6ukF95lv/XOCH0rb1t?=
 =?us-ascii?Q?nk777ZD7kM6s5thdCmqGNbvoOLHCOSEEgNZviV9GH8zgw0286uffcyRvNIXx?=
 =?us-ascii?Q?ma/5boJlkEhu3nbIayPhPzYpnQumSNynYlgwS339NIjLhrsASakLmcoGC2Aj?=
 =?us-ascii?Q?qcfrGfjp91gZMHfUJOISUXUNu2CMgRIvYs083BlliEWZO7X++gPxCtkaTEdu?=
 =?us-ascii?Q?90LW4HXLV0o4MfloZ7mt72ucKy6sdiNgLqj6yrANJeFCosKKBz4+L3zEDo9l?=
 =?us-ascii?Q?QTelfZteW7DtRaNTtDyuWreTXkKgw5ub4QQAtgAz3rrjB3cgEcWMFZzVhh7P?=
 =?us-ascii?Q?hlaggJ22GPPoaP+KdXdZZHw+FQ/m3p1K3hl+MAmEG4bJW+je6J8qP15kgPFM?=
 =?us-ascii?Q?ESWdqeq04Y2L4DBaAb9OvwN5Yx2/+GQ04k8DkSLg5RxvlpdQIgalzVk8jL3q?=
 =?us-ascii?Q?4cp5Dnph72hm4XKX3aXEAyUdLbXeuT8bSZQA/T2kwZns86LR/oTppFAsjUd6?=
 =?us-ascii?Q?Tuu0FKGm+NePnqJQ6hMDkmEGMTSF5CSlE4pmzGHZLczqH4kGLUKjBJO2tDgx?=
 =?us-ascii?Q?Zq2mVddm6eNLdiAWeQn467DRnXT8M+eFPL/AcmNRGVnKxNrBeL+0xLEUFp5g?=
 =?us-ascii?Q?HNqjB5r+iOoVmp4gEUW+sqZP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5319c1-12f0-467a-315c-08d936823148
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 20:05:04.8719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lu22oElGNFIjygDt28uOqCv8JHoq5PGo/5tfovlBgkxt6ZZ9FuglK/QnkNx4YDeQoNBqew/2LmSt+OeXKJ+Xxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4232
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alessandro Di Federico <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Alessandro Di Federico <ale.qemu@rev.ng>
> Sent: Saturday, June 19, 2021 3:37 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; babush@rev.ng; nizzo@rev.ng; philmd@redhat.com;
> richard.henderson@linaro.org; Alessandro Di Federico <ale@rev.ng>
> Subject: [PATCH v5 09/14] target/hexagon: import lexer for idef-parser
>=20
> From: Paolo Montesel <babush@rev.ng>
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Paolo Montesel <babush@rev.ng>
> ---
>  target/hexagon/idef-parser/idef-parser.h      | 262 ++++++++
>  target/hexagon/idef-parser/idef-parser.lex    | 597 ++++++++++++++++++
>  target/hexagon/meson.build                    |   4 +
>  tests/docker/dockerfiles/alpine.docker        |   1 +
>  tests/docker/dockerfiles/centos8.docker       |   1 +
>  tests/docker/dockerfiles/debian-amd64.docker  |   1 +
>  tests/docker/dockerfiles/debian10.docker      |   1 +
>  .../dockerfiles/fedora-i386-cross.docker      |   1 +
>  .../dockerfiles/fedora-win32-cross.docker     |   1 +
>  .../dockerfiles/fedora-win64-cross.docker     |   1 +
>  tests/docker/dockerfiles/fedora.docker        |   1 +
>  tests/docker/dockerfiles/opensuse-leap.docker |   1 +
>  tests/docker/dockerfiles/ubuntu.docker        |   1 +
>  tests/docker/dockerfiles/ubuntu1804.docker    |   1 +
>  tests/docker/dockerfiles/ubuntu2004.docker    |   3 +-
>  15 files changed, 876 insertions(+), 1 deletion(-)  create mode 100644
> target/hexagon/idef-parser/idef-parser.h
>  create mode 100644 target/hexagon/idef-parser/idef-parser.lex
>=20
> diff --git a/target/hexagon/idef-parser/idef-parser.h b/target/hexagon/id=
ef-
> parser/idef-parser.h
> new file mode 100644

> +/**
> + * Types of control registers, assigned to the HexReg.id field  */
> +typedef enum {SP, FP, LR, GP, LC0, LC1, SA0, SA1} CregType;

Where is this used?  SP, FP, LR are not control registers - they are genera=
l purpose registers.


> diff --git a/target/hexagon/idef-parser/idef-parser.lex
> b/target/hexagon/idef-parser/idef-parser.lex
> new file mode 100644


> +"fREAD_SP()"             |
> +"SP"                     { yylval->rvalue.type =3D REGISTER;
> +                           yylval->rvalue.reg.type =3D CONTROL;
> +                           yylval->rvalue.reg.id =3D SP;
> +                           yylval->rvalue.reg.bit_width =3D 32;
> +                           yylval->rvalue.bit_width =3D 32;
> +                           return REG; }
> +"fREAD_FP()"             |
> +"FP"                     { yylval->rvalue.type =3D REGISTER;
> +                           yylval->rvalue.reg.type =3D CONTROL;
> +                           yylval->rvalue.reg.id =3D FP;
> +                           yylval->rvalue.reg.bit_width =3D 32;
> +                           yylval->rvalue.bit_width =3D 32;
> +                           return REG; }
> +"fREAD_LR()"             |
> +"LR"                     { yylval->rvalue.type =3D REGISTER;
> +                           yylval->rvalue.reg.type =3D CONTROL;
> +                           yylval->rvalue.reg.id =3D LR;
> +                           yylval->rvalue.reg.bit_width =3D 32;
> +                           yylval->rvalue.bit_width =3D 32;
> +                           return REG; }

This looks like the use where you are treating these as control registers. =
 Just lex them as general purpose registers with numbers 29, 30, 31.



