Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD4036C6AA
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 15:05:00 +0200 (CEST)
Received: from localhost ([::1]:53026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbNOd-0006rQ-NT
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 09:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lbNIL-0004G7-A3; Tue, 27 Apr 2021 08:58:29 -0400
Received: from mail-eopbgr820125.outbound.protection.outlook.com
 ([40.107.82.125]:8418 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lbNIE-0000w0-Da; Tue, 27 Apr 2021 08:58:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxWZ1WBUvYRDfeLe47xNSt3XdGrO9bU8G0MOi1t4YIPETV0G5+aZvnpy1ioIXrkPY4iBpD4qPTnt03iPk9En3B19AxNzR9u75L8I9UAWpRv2OdCz6y/60ReJn/B6mXdeJOjN1wd0TQl0MgTvaLBZS7t7JzLTjkGuwjCdJZbUjcWnzdAxgPlMq7a+bT87pC3DkFPaUVxTQoBheAwRK/AwFNMpOtwbfoaQExqHayahdZam2IPR+vvrX5O9HVG4YHLeA3Q4qC5vSBWd+EKdIB79tVp+8XSUL9mhjTAA3H200hR++HfdNYu/8/U53FXr78dN6G+2Hda6YECQmB1vR9dZdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xT/v7RUQVXm86Eqax6SEUUs8ARqhK/hP9cmXpf38ZIQ=;
 b=itY12/7yX0HaXN55GnR9muK+zsL3ziXJNlREEtbTMldqDqXRU0Xa5OlyWU6b5NhPRfJ320/SXO3LIAaReRTvreN11/ziZJwBh5NrpNm0SksNT6b5Wla8HERqYcsd0XpOzg6Ib9j5cAfBoqA2711Ay74J/50yhLWbn8qaNQXRAFRiRhprNubp6eifORijullcfjo+16c/u98p+ESg8Al1KPHdbLXhOOleoT4tK7xydzG/VwnoCCMYmun4y9pkuBWdfs+otK/KKnZKgezcWdKk5WtvX8aA1Be5pSehsWFHVhJSrh5zOHFt7yA2J/xsr5riTi9VCyT5BeD4nycpZDzw9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xT/v7RUQVXm86Eqax6SEUUs8ARqhK/hP9cmXpf38ZIQ=;
 b=I0Ondep6hqCTZJiGIRLxfDPI/B54SnHKq0HWEd/TnM0lC0qTKKgQ4gwzPB1EboVLUFkrz8xgLbha72nk1A+Mlnp5gvVf9UXXnQBoezTKD6jO+IB3+gupTs/ILYxNeS8OHB89LdUkfW5ziHRJoe65PSfKtI+mkGwYe8e4DWvsJB0A9b2SOPSQ3E94WvQSF0tXrOQgrcNd96CK9J1Tocb6QbhHuKW1/y6JJFvL8fpZTsT5ZzX/fj7lCqzX5aNCihs64ah8TvTbbyNMBlXBsFJ7+Zpa83nu6MGa+Bld4vlW59vNuBAaIzDPSaN6+VNXJSFfaLJqs3gB60Xg3U7p984TMg==
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com (2603:10d6:102:45::19)
 by CP0PR80MB5412.lamprd80.prod.outlook.com (2603:10d6:103:5b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Tue, 27 Apr
 2021 12:58:16 +0000
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b]) by CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b%7]) with mapi id 15.20.4087.025; Tue, 27 Apr 2021
 12:58:16 +0000
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: RE: [RFC PATCH 2/4] target/ppc: isolated SPR read/write callbacks
Thread-Topic: [RFC PATCH 2/4] target/ppc: isolated SPR read/write callbacks
Thread-Index: AQHXO2QSxOhSETnKC0CPXJs/8kEO4Q==
Date: Tue, 27 Apr 2021 12:58:16 +0000
Message-ID: <CP2PR80MB4499BF4766D2D11AF842E6F1C7419@CP2PR80MB4499.lamprd80.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gibson.dropbear.id.au; dkim=none (message not signed)
 header.d=none; gibson.dropbear.id.au;
 dmarc=none action=none header.from=eldorado.org.br;
x-originating-ip: [2804:14c:482:7ed1:1097:1591:cee3:e68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be813200-8d11-45c8-6154-08d9097c2017
x-ms-traffictypediagnostic: CP0PR80MB5412:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP0PR80MB541241627FE3B7566900D264C7419@CP0PR80MB5412.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GmtLXQ1Ci/2lR9miTItpn+WF5tLy4oRGAcPA/NgQdXdCX6Qkx7z3uguGOoGDpobsFMJ1AXigc+kUzhSJX1M+0I1ogUuBEjKJp9jcDcuDPA6yGDJPb8YsGnoQOBbtu4axDm37WA+k+qijlxvyFEfTHcgZjzSBSnrgVGrDGZsBlsprT2OhyScE1vehE1MWAc6QgiNI2g+MTC35tTf2ufw96Q3NGKcXNKXfVxh32QHWOkAQdQ31Nqv3Vo9vBAP32v3iY2tvBea90EEHVQMWXT3VQhQNwWjXw6o0kf3dfc9RAGlx/IdlPMj5TIfGUxiZ/vYvyYlkwykZ0c0YQRqdXActlT2npolf2Ori5oDwhiHAZyltcBL0fY5V8ccbrdx3qepoDz5UvBZSDXadDXOYTkiRX14zw34QRvCZz/oMb4w6p+psrV3YMjQ5XAPRb1psFfg0zmAallVbkbEaQdo81W/M10ah3HPrm3g/oZgKDFRe4xNYFDg0oErWiHiz40FvmPhm/4YhO1OtUkwT9t/qiF47vRVDth3C9h22zax4LDklVIwzQAEyltT4mLHwMXG9eWcNBcD21zMXquwur7DvT6pGWO3HbBAospaFVGywQ6cd9hpuQW70D268VyDRAywq2lLFdHtV41NL5HfmyyeVqfBwk8Fldl7RC0g9XA957+k0+UEmpxh0ZlGZPymOaKcsBSM0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB4499.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(136003)(396003)(376002)(346002)(366004)(66476007)(19627405001)(9686003)(76116006)(54906003)(86362001)(66446008)(66556008)(64756008)(186003)(66946007)(166002)(478600001)(316002)(55016002)(38100700002)(6506007)(83380400001)(71200400001)(122000001)(4326008)(2906002)(5660300002)(33656002)(7696005)(8676002)(6916009)(21615005)(8936002)(4744005)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?OoIrOqGihBB0kH03aJqLKBJDODj4XWg6PW6ASPBRPStEPitf24WDDdq3NM?=
 =?iso-8859-1?Q?by126ROVkIpN8ZSmOpXnz0h7yNPVcLOT7lZQS9y/gLaZBtCzh/aIrS50GX?=
 =?iso-8859-1?Q?cil6dodJf1lwCUV5bwDHlWJYKaMNEegi/7pcvsNVYWb3jsAOYWnY7sXJkh?=
 =?iso-8859-1?Q?dmy7KwqrJYNCxgbgsGKyYA3O6gjc4/ChshNIbUli+rZe5gWiFkiasI9eYu?=
 =?iso-8859-1?Q?bQQuqHaMO7VVlYJZcOB5JJm7J4bD02e7nLjltKRqyqC1zTUKpfFxhqip/q?=
 =?iso-8859-1?Q?25mRr9Brrrc+ifLmkiSvFJUR1njYkqRr+OReYELXgSh2yDdeAwKtnpZ+a4?=
 =?iso-8859-1?Q?vOGsfyiEq+IOPRnNVhHP8oK6kitRt083yTkUxW9/dffUbHBcMiF0t4YgUI?=
 =?iso-8859-1?Q?/uWi9YEfSIFWYI3wNtmaMFNk0n6RqMamHcl2zADyT/6s6DPcutQ+DnvU0I?=
 =?iso-8859-1?Q?WZQgeS/kbxX6yNRBozxOe6M8j/Zh+dmKhFJ+WFqrA9WL8Ir2iucyJoNBED?=
 =?iso-8859-1?Q?/gMhQ4Kmqn0fbKPLZIGr0+QBK6czUiWfySPspJLEMs5O3ROAmO+0tfh/my?=
 =?iso-8859-1?Q?iLRHGAE6DZgC74MRT17Rrjc092kOA7ed0kcBNUf3PCqAbKycsEoO1b/+oA?=
 =?iso-8859-1?Q?a4C6FdtsPZcZV4AdwF4EPKMXvRL3xsFn44eQSWrvHE5OGrAgr4N6Z6A1B/?=
 =?iso-8859-1?Q?9tEgUvR3x7srHta51p6ugLDH1kPzzZmAcCCXQ8pVi19M8bDq3//V8IOycF?=
 =?iso-8859-1?Q?z6GKpcelqHf6DUIHzgsPPKRnMwCnPbGIZgYzqZwrgfjKxsoVSLB2QwTJyp?=
 =?iso-8859-1?Q?Nhat24rTuFUhhtjguDcaI8UIbBmmvsGXNUa7NEO5iIOwTZbJmaGTbx7igI?=
 =?iso-8859-1?Q?dq4X4urG5wRU8DMBLM7/1PZM414DLdTncKLkzabWvTlArWHRFoG1nQLdU7?=
 =?iso-8859-1?Q?9kvcZSOU8bYD+rU74K4GoCR5TW/IJ5pHgLnJMcLHgPWfzlbLEuTJpuqicM?=
 =?iso-8859-1?Q?X6fM14OcmyvMl3mQLXAVBIP7eEyzD3XF+3ZtaRLiXZzDmPV8zX9xOT2LPm?=
 =?iso-8859-1?Q?CIJda/1K3/5Q5L5eBMSX1NTd/sHrXg/EwIZWlqBeysbb60YkIGkSLWB/nS?=
 =?iso-8859-1?Q?/RwyqCdp//9tnQ0oVjBL7ON68jEN0GAeJMj5fPO1FHmTALb8SiA50o7QFd?=
 =?iso-8859-1?Q?7ann2EB/XrS5azfz0CGL9JAljki5wfQ0jlgSU0P/r82OPaklEB71k3AD4C?=
 =?iso-8859-1?Q?NHps+snM4QrJtlw/wU/T/hHnx4nS1JbZRmZtSRAAw6X+pkZoSs92y5qIrD?=
 =?iso-8859-1?Q?yC4ruH91G5sO/IcftYSKEPjD9feTTqVH7hG/tHjytwmnLsuZpleKxtnp2o?=
 =?iso-8859-1?Q?rnKaJ+I5JRkFD8cXkrjsG0krXRGygkd9pSLYZwb16OTW3s0s6rDUQ=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CP2PR80MB4499BF4766D2D11AF842E6F1C7419CP2PR80MB4499lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB4499.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be813200-8d11-45c8-6154-08d9097c2017
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2021 12:58:16.7134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +RLn9KRHSnSzPEQpDhlqpG04Q1w9LbI/QBTKaDIH6WIzKfG8SwomiDlexz7qlYmHhW0Fp3aqeDvkYpor3AXcR2IQQfuVkkw9XjaICCP/rro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB5412
Received-SPF: pass client-ip=40.107.82.125;
 envelope-from=bruno.larsen@eldorado.org.br;
 helo=NAM01-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_KAM_HTML_FONT_INVALID=0.01 autolearn=ham autolearn_force=no
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
Cc: "farosas@linux.ibm.com" <farosas@linux.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CP2PR80MB4499BF4766D2D11AF842E6F1C7419CP2PR80MB4499lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> The 2 fscr functions below aren't readers and writers for the FSCR.
> Instead they're used by instructions related to facilities the FSCR
> can enable and disable - this generates the code to check the FSCR and
> generate an exception if the units are disabled.
>
> That doesn't mean they don't belong here, but it does mean

I think something got lost here... anyway, I just checked that these functi=
ons
and they're only used in spr_tcg.c.inc at this point, so I think I'll remov=
e it
from the .h and make them static. And mention it in the commit message
as well

I could also put it in translate.c, but whoever needs to refactor this code=
 next
would have as big a headache as we're having now.


Bruno Piazera Larsen

Instituto de Pesquisas ELDORADO<http://clickemailmkt.eldorado.org.br/ls/cli=
ck?upn=3DUPoxpeIcHnAcbUZyo7TTaswyiVb1TXP3jEbQqiiJKKGsxOn8hBEs5ZsMLQfXkKuKXZ=
7MVDg0ij9eG8HV4TXI75dBzDiNGLxQ8Xx5PzCVNt6TpGrzBbU-2Biu0o69X5ce-2FW-2FOk1uUi=
puK0fZnWXJEgbRw-3D-3DJY4T_wWk-2BG6VvNBoa1YzxYjhCdFS9IfANIaBzDSklR1NyyrKOI1w=
j0P-2BdBFcuO4FnHcsA1MyHu0ly1Yt3oDMp7KKdJPM68iKuI2jiRH5v4B0d8wf3chU3qy5n5iXW=
nW1QjSaNFHOgELzxaP-2FnesTeBgJ5dFkjH4f279sVQpOtyjw5xAqj34M6pgNRAxVvuXif4IWDc=
VzXg1FzfYlEfkKzr9vvpA3Hg8kitwMtlU3zwbQUBCgL30fQoJPcRPMGKyOY8RmoAlXNqTJYDYIv=
qmfnI7KLUvw6vKB5R-2B5q1FJRAzX7H-2BmF0NnDET6jMLuIqtCcVIch>

Departamento Computa=E7=E3o Embarcada

Analista de Software Trainee

Aviso Legal - Disclaimer<https://www.eldorado.org.br/disclaimer.html>

--_000_CP2PR80MB4499BF4766D2D11AF842E6F1C7419CP2PR80MB4499lamp_
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
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; The 2 fscr functions b=
elow aren't readers and writers for the FSCR.<br>
&gt; Instead they're used by instructions related to facilities the FSCR<br=
>
&gt; can enable and disable - this generates the code to check the FSCR and=
<br>
&gt; generate an exception if the units are disabled.<br>
&gt; <br>
&gt; That doesn't mean they don't belong here, but it does mean <br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">I think something got lost =
here... anyway, I just checked that these functions</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">and they're only used in sp=
r_tcg.c.inc at this point, so I think I'll remove it</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">from the .h and make them s=
tatic. And mention it in the commit message</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">as well<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">I could also put it in tran=
slate.c, but whoever needs to refactor this code next</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">would have as big a headach=
e as we're having now.<br>
</span></font></div>
<div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont">Bruno Piazer=
a Larsen<span style=3D"color:#1F497D"></span></span></p>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont"><a href=3D"h=
ttp://clickemailmkt.eldorado.org.br/ls/click?upn=3DUPoxpeIcHnAcbUZyo7TTaswy=
iVb1TXP3jEbQqiiJKKGsxOn8hBEs5ZsMLQfXkKuKXZ7MVDg0ij9eG8HV4TXI75dBzDiNGLxQ8Xx=
5PzCVNt6TpGrzBbU-2Biu0o69X5ce-2FW-2FOk1uUipuK0fZnWXJEgbRw-3D-3DJY4T_wWk-2BG=
6VvNBoa1YzxYjhCdFS9IfANIaBzDSklR1NyyrKOI1wj0P-2BdBFcuO4FnHcsA1MyHu0ly1Yt3oD=
Mp7KKdJPM68iKuI2jiRH5v4B0d8wf3chU3qy5n5iXWnW1QjSaNFHOgELzxaP-2FnesTeBgJ5dFk=
jH4f279sVQpOtyjw5xAqj34M6pgNRAxVvuXif4IWDcVzXg1FzfYlEfkKzr9vvpA3Hg8kitwMtlU=
3zwbQUBCgL30fQoJPcRPMGKyOY8RmoAlXNqTJYDYIvqmfnI7KLUvw6vKB5R-2B5q1FJRAzX7H-2=
BmF0NnDET6jMLuIqtCcVIch" target=3D"_blank" rel=3D"noopener noreferrer"><spa=
n style=3D"color:windowtext">Instituto
 de Pesquisas ELDORADO</span></a></span></p>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont">Departamento=
 Computa=E7=E3o Embarcada<br>
</span></p>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont">Analista de =
Software Trainee<br>
</span></p>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont"><a href=3D"h=
ttps://www.eldorado.org.br/disclaimer.html" target=3D"_blank" rel=3D"noopen=
er noreferrer"><span style=3D"color:windowtext">Aviso
 Legal - Disclaimer</span></a></span></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_CP2PR80MB4499BF4766D2D11AF842E6F1C7419CP2PR80MB4499lamp_--

