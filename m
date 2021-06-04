Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B7939B8B9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 14:07:03 +0200 (CEST)
Received: from localhost ([::1]:58994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp8bP-0000fh-0Z
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 08:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Aleksandar.Rikalo@syrmia.com>)
 id 1lp8aA-0008P5-6h
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 08:05:46 -0400
Received: from mail-am5eur03on0709.outbound.protection.outlook.com
 ([2a01:111:f400:fe08::709]:38286
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Aleksandar.Rikalo@syrmia.com>)
 id 1lp8Zy-0006NI-M5
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 08:05:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYX5MVR8Ejx0nsX8yyJfBRpGuD/qjUI7om7ON5ijQmNI0UpmKSrXp5UhI6+csLWMuC6W2qy1zQ7r50Gdzl/vfwvRrBWqIGCLdxKBthJ35uIJgGa0h3tPXLVPml+v28GOyN+U7PABsG596IQycqWGl8lSn4DgFbO1ad7a9jkYsDk1Roq55YAEZfS4ciB3pVJnTra4PIxOi8+Nq5ZIneXfWsq+/CcRgMcMiHjBDUoPhh975DG3KYeKo/WWdHWhFQu2DcGHiThaDfLVwLZZ/uqoxYUAWnua/Z3sSnCaNcKdR0ukQV0buuZII+fgydwLKLWUvG7uM5qGAZv1ysPddNo6Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jK8pl/4KicmCMDjlgN6MNquRGW+TOYKYbI8ax4TGFfM=;
 b=HJLlm/BFlpEUeY8StQvwX294wh1QbeJ8Dq17UkCJd+YcZ1u+dcTW4A6aID4wqJtU24Jd1iho3djVTwCA88tRkBBruV5o0oCoWV7lbdFGiU5w3YW4Wk7IEGC+KUK8p+4h1jx+b3jNmuQPIw8pwQu5p4PrqAbl0s2htV/kPQxaSSVXXQLsjRkMnBzJXoL3q59S6ZVxqlSUZqOCmWMPekPN1P/hG+VvOJFWjAIlU5fNJ5X+IwsrAmtBduv/5NCM/GLXV/wCcCwex8Jbs/YgHrGz/rUuT/W3UxA56WQ2JkJ5F/Dp50XSjvQa7WxN0mQlidLUIgytwzUxX7WUwr2HLG/VVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jK8pl/4KicmCMDjlgN6MNquRGW+TOYKYbI8ax4TGFfM=;
 b=Le9a8GaW61T3alS+2/aomYF51UcV/AlkcKKUWUotqrcnCE99E4gqcAOde7glJCYkCubI6JzkxX1ULDhnQUVDDqHR336nYS3IEh28aHANvIx49c8lXhKo9OiWH82wwP4bJbZXxhAr1+yRNEWBG8H7Z02Gk2e8bEtTnx7UuOfYcko=
Received: from VI1PR0302MB3486.eurprd03.prod.outlook.com
 (2603:10a6:803:1e::32) by VI1PR0302MB3310.eurprd03.prod.outlook.com
 (2603:10a6:803:24::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 4 Jun
 2021 12:00:29 +0000
Received: from VI1PR0302MB3486.eurprd03.prod.outlook.com
 ([fe80::78bc:f514:ba61:78bf]) by VI1PR0302MB3486.eurprd03.prod.outlook.com
 ([fe80::78bc:f514:ba61:78bf%6]) with mapi id 15.20.4173.030; Fri, 4 Jun 2021
 12:00:29 +0000
From: Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>
To: =?Windows-1252?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, Filip
 Vidojevic <Filip.Vidojevic@Syrmia.com>, Vince Del Vecchio
 <Vince.DelVecchio@mediatek.com>, Petar Jovanovic
 <petar.jovanovic@syrmia.com>, Aleksandar Markovic
 <Aleksandar.Markovic@syrmia.com>, Aleksandar Rikalo
 <Aleksandar.Rikalo@syrmia.com>
Subject: Re: [PATCH v11 08/46] target/mips: Add emulation of nanoMIPS 16-bit
 branch instructions
Thread-Topic: [PATCH v11 08/46] target/mips: Add emulation of nanoMIPS 16-bit
 branch instructions
Thread-Index: AQHXVJXaFORkw1Kd+0KFbTFfscIHvqsDxAXi
Date: Fri, 4 Jun 2021 12:00:29 +0000
Message-ID: <VI1PR0302MB348663160F0A7DDFF87AE1869C3B9@VI1PR0302MB3486.eurprd03.prod.outlook.com>
References: <1534789014-8310-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1534789014-8310-9-git-send-email-aleksandar.markovic@rt-rk.com>
 <CAAdtpL7jGOxhaqA-gLSRX_6FktEm89AMW-xkV=n+mEjWd-O1iA@mail.gmail.com>,
 <e208f68d-969a-0a07-a24c-25b6a0bbdb42@amsat.org>
In-Reply-To: <e208f68d-969a-0a07-a24c-25b6a0bbdb42@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=syrmia.com;
x-originating-ip: [109.245.227.202]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f8f2483-5c5b-4350-58a0-08d9275058f0
x-ms-traffictypediagnostic: VI1PR0302MB3310:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0302MB3310C524C493878AED8FFF979C3B9@VI1PR0302MB3310.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nW3wFVzz88gA7nqrWx0GrYhNRrSeEBSEEuCHyKgagWCXRIqwx1L7Op/jgBwaUWJc6DY2KNskBLvtGRY6YaBi1+hARb13FzYmYSqKEBwDYSQJK0rxDUJnPPmddJY147KwC0zWI8Ki6/yPdo5fGgblMNeMKdHkBuCsU4DQIOosZjaUYvHWomBvO/Gvpqusq/A9bY+YULeld2sd700ni+tHiEnb6RBngv/icY252OEKw15I27hYA71rSgjiqsTOMS8kDMUpfOgjqVdSdnm9haqlhNcasxzzGH6+sV3jQx9fAm1q7LWcLKx9MvDmwiE2ERBxiJzW5dd/841Z2oVnkrnai0gjOBy/4uQyhPHhnEGJ+v//HfS18/7N/3XUFzIpWPx8cu32OHrt9bpylQFZ+NzEJnNYFYHvVtFQ5fYVb8hd9wXe3ndzcERfLuZ+mcYLBUwWdSz9T3RcwmZrUCCzomRFNi9PiA0+dYJ2u2o3NgLd8Wm8yU96Q/+048f94bSfsX56JyNolVT/XrYYcIQdBFtNguYX3NeIzWLiayZwh+gc/V4e7CUEuToz8lF53rNp9P/fdhzX0EjDUSQfsq6OMuA+06nbql8MOe430fXA+jagEhI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3486.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(366004)(396003)(346002)(39830400003)(122000001)(38100700002)(64756008)(66946007)(4326008)(478600001)(110136005)(54906003)(86362001)(52536014)(316002)(76116006)(4744005)(7696005)(6506007)(186003)(66556008)(2906002)(55016002)(53546011)(8936002)(71200400001)(19627405001)(66476007)(8676002)(66446008)(26005)(5660300002)(33656002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?QLFdRGMqprdRqbsTAr6B8OljSWO9kQMQshXWoBwDZMIvmTDeCWjZDqvG?=
 =?Windows-1252?Q?srXW6BVZmFTyuCaIhWo/4bKHpMwad3+UeZFhkMz0rxjMtawdCZfmXdwF?=
 =?Windows-1252?Q?yh0gXZzrImoREX0f8gJ3DGMI2yqwirmCiuuhXzQ9UdTwVrEQnF7Clcch?=
 =?Windows-1252?Q?LqPT+PqfsMWVH+6x4jvgTWHDSP+IBaHwvTBLVSFvuq4q1R+Np8AMunfN?=
 =?Windows-1252?Q?e1aG0mry6Pttz3CrW/Yi/BD3R03hTb73h8p4uemJPmQLTLYElnOhUsoF?=
 =?Windows-1252?Q?eXfGP1ccwDeCVcpiJnXAcJ7723aYhEoVWy6B7jqd4J8lG21sigkjdU6b?=
 =?Windows-1252?Q?K9nunXXNJa1ARkSu11wOimrl4JWTev7i3MVbVNusDOVUobz+gOdFrMa7?=
 =?Windows-1252?Q?X7JKnnelQd6sphb94MqV//jLmYM86xORKypAS3DA3Fb/ltkzz420mmMf?=
 =?Windows-1252?Q?gSPwW52dLh12F+oVSyHU0IfsmaarKieV9PucOfuXS1kBwnN0dCtBH0zn?=
 =?Windows-1252?Q?jPBnX/GaNDsjBSbl0A/xGjI7+RDzVs1du1L1J5WCD2lQhlWU14vsAA4z?=
 =?Windows-1252?Q?6eGPtLU2vtpJ1kdIDjr3CG9IPTQ7p47RyA2ZmPlTRvvltxCPe1ohYo35?=
 =?Windows-1252?Q?m3xE3lk8Yc2rKMc+MYVaNpo34+OdcncX3eBGskCqJ3OXKNdyw3vwFiAS?=
 =?Windows-1252?Q?OwcLJ++dB1awZGHTf0CvxhXHOrRHQXHSgTh6eXltxwjXI1OlAGzcY3FX?=
 =?Windows-1252?Q?A20C7ibIOjivSivgZczucaG8jgWCO39K2TSrlksp4ci2eGnKYn4KfXLi?=
 =?Windows-1252?Q?AYKfJIFJwOJoBW1r0VAL/sXBwm1tA21ZYozn0kpyFKOtHOJfJIbnLJHM?=
 =?Windows-1252?Q?9NEXRug1/UqX/aH781lp0bJL0lVhxQfXYhm7FJ5B5AVxGr2HOJzfc9Pr?=
 =?Windows-1252?Q?9SLzcBRbYJ5GtTSHhasZe0j+32reUX5R16WTeRo8wlmunbmoP03DJFsT?=
 =?Windows-1252?Q?nMWLOxzwtXy8TbpwMKAemV3SO32jtIP0i9TNdy1iSqlUczQf4GEEhL1z?=
 =?Windows-1252?Q?H/ixXWkvRSyqr0WD8mwarotzMFtpW5Tcl+3BhO2W5vCSfi3UOswouWNO?=
 =?Windows-1252?Q?5WWTG/8200YSE1UXrM30U9vqrelVuCX7gfvzoinPF7pUbjpDVdHX1d8z?=
 =?Windows-1252?Q?amKR0sQPp/WMWVEXLtFwjyYA8X49H/qbSMeJmaTri5jsYC/duKa6U7mU?=
 =?Windows-1252?Q?UJN9INybnXXvUQKweAlwGPQYHHSrev2XFy/Y7lT7KGgY30BsiwgJP9gL?=
 =?Windows-1252?Q?qlg+hHPBpUS+1qMNRnZ1OSG4iY6tfFyu+Jg2X+y/pdEYvhwoLeECAn3j?=
 =?Windows-1252?Q?2tR5WMGTPW3mx8i1uCSBzQ71BWKZVHijM18=3D?=
Content-Type: multipart/alternative;
 boundary="_000_VI1PR0302MB348663160F0A7DDFF87AE1869C3B9VI1PR0302MB3486_"
MIME-Version: 1.0
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0302MB3486.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8f2483-5c5b-4350-58a0-08d9275058f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 12:00:29.0260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1d5omFNbOsFtJV+hN+udZdoPHayzeO90UqeF/FMzqsHSJ0TJ3NU7GipyFQXSPAe4kdfhysGTzJV9K+ylRrBFEoWEq3v9aRqvT/qcp31+UaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3310
Received-SPF: pass client-ip=2a01:111:f400:fe08::709;
 envelope-from=Aleksandar.Rikalo@syrmia.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <pburton@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_VI1PR0302MB348663160F0A7DDFF87AE1869C3B9VI1PR0302MB3486_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,


On 5/29/21 3:52 PM, Philippe Mathieu-Daud=E9 wrote:

> I think this opcode never worked correctly.
>
> Per the "MIPS=AE Architecture Extension: nanoMIPS32 DSP Technical
> Reference Manual =97 Revision 0.04" p. 88 "BPOSGE32C":
>
>   "First, the offset argument is left-shifted by one bit to form
>    a 17-bit signed integer value."
>
> The caller, decode_nanomips_32_48_opc(), doesn't shift the offset:
>
>     case NM_BPOSGE32C:
>         check_dsp_r3(ctx);
>         {
>             int32_t imm =3D extract32(ctx->opcode, 1, 13) |
>                           extract32(ctx->opcode, 0, 1) << 13;
>
>             gen_compute_branch_nm(ctx, OPC_BPOSGE32, 4, -1, -2,
>                                   imm);
>         }
>         break;


You're right. We will prepare a patch very soon.

-- Aleksandar R.

--_000_VI1PR0302MB348663160F0A7DDFF87AE1869C3B9VI1PR0302MB3486_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
Hi Philippe,
<div><br>
</div>
<div>&nbsp;</div>
<div>On 5/29/21 3:52 PM, Philippe Mathieu-Daud=E9 wrote:</div>
<div>&nbsp;</div>
<div>&gt; I think this opcode never worked correctly.</div>
<div>&gt; </div>
<div>&gt; Per the &quot;MIPS=AE Architecture Extension: nanoMIPS32 DSP Tech=
nical</div>
<div>&gt; Reference Manual =97 Revision 0.04&quot; p. 88 &quot;BPOSGE32C&qu=
ot;:</div>
<div>&gt; </div>
<div>&gt; &nbsp; &quot;First, the offset argument is left-shifted by one bi=
t to form</div>
<div>&gt; &nbsp; &nbsp;a 17-bit signed integer value.&quot;</div>
<div>&gt; </div>
<div>&gt; The caller, decode_nanomips_32_48_opc(), doesn't shift the offset=
:</div>
<div>&gt; </div>
<div>&gt; &nbsp; &nbsp; case NM_BPOSGE32C:</div>
<div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; check_dsp_r3(ctx);</div>
<div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; {</div>
<div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int32_t imm =3D extract=
32(ctx-&gt;opcode, 1, 13) |</div>
<div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; extract32(ctx-&gt;opcode, 0, 1) &lt;&lt; 13;</div=
>
<div>&gt; </div>
<div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gen_compute_branch_nm(c=
tx, OPC_BPOSGE32, 4, -1, -2,</div>
<div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; imm);</div>
<div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; break;</div>
<div><br>
</div>
<div><br>
</div>
<div>You're right. We will prepare a patch very soon.</div>
<div><br>
</div>
-- Aleksandar R.<br>
</body>
</html>

--_000_VI1PR0302MB348663160F0A7DDFF87AE1869C3B9VI1PR0302MB3486_--

