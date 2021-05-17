Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5873829BA
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 12:22:28 +0200 (CEST)
Received: from localhost ([::1]:45276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liaOJ-0005uX-Ai
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 06:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1liaDO-0003b9-Cu
 for qemu-devel@nongnu.org; Mon, 17 May 2021 06:11:10 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:20877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1liaDL-000544-TL
 for qemu-devel@nongnu.org; Mon, 17 May 2021 06:11:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1621246264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TzHCo3YtpzNPPASsi1RGGpMCFc0XVvjP70aaA+89iFU=;
 b=asqrp8YHOw7xCTjy3lAAHN/8O+75So+Db/3Az7EosvDIjI/ZlHjp51hyQTx5TMf9W/my4a
 VXttxWnYK2TxPmVohyQvvjRaAbI2PrVHLtsUEvzeSWmqs94a1sdUarEEO8IWQfkqpu4VOa
 GR0JV4xml5SLT2tXxt/+IZxwwmwoVUk=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-InQ3MYt3OZSA933v7GCZGQ-1; Mon, 17 May 2021 12:11:03 +0200
X-MC-Unique: InQ3MYt3OZSA933v7GCZGQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KoMECJxacaKzofE+nToIyfbPjUwsFrlG9w7JoP3p+o7r54BvsLiwYvz4gEsewDUCtfxSR2lU4em25vFyP5h7+Ch5xaiITwPjiow9q0P+P+4NB+gZfs//g5cDAoj1Ww29jW/yyVodzqgRTNRdAOmafXOrMa1fRg3ZK1xZa1gwb896qcPGRuBypG6cNns8hrxk3c0r7iOajQv3p9OeLBBY7Vn6uUsbKbiUVM5of8+bxqY7BhK7SqPGrq/Q8qSpSbk/+zO6oPB8tiyGo+cLWfNyF1PY20Vm0TRIen8DVoXd51wB6sSnDtXSoQIJ+ZnlgjpgzKdScLeqHPa5nQ+U9Qk5Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzHCo3YtpzNPPASsi1RGGpMCFc0XVvjP70aaA+89iFU=;
 b=exz7+AWYxjSaWtXvBzasS3FCNrKjE8mfwmAUReKa3JGbBYjbBC/VC0TQeCtsxT4p3wtbJWiRPqdC2LyVm5pjEmxgQPjwT4m894bFgUWmPzFpb6D00sWnenpil7frOUglUBjlRsk9fct4DlkQRUXI+8IB/vUTU11DYUawQTmqPkOVrNeF83roLNc3abDxu+M/28RbpJavnF4l7n3GauwJETw31mC7xcMO1inK9uJZ+XhvtKnGeF3Hjch2d2ABChJfew31RxEEhHY4kEvuU6mn9kKKJEUD07WH8QI5F/LqSMNmUphVWN2iIMxIs/pHelEnNZglx2uaAt1J0e/tT3Cb9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VE1PR04MB6591.eurprd04.prod.outlook.com
 (2603:10a6:803:123::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Mon, 17 May
 2021 10:11:01 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 10:11:01 +0000
To: Claudio Fontana <cfontana@suse.de>, Richard Henderson
 <richard.henderson@linaro.org>, =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?=
 <f4bug@amsat.org>, Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
CC: qemu-devel <qemu-devel@nongnu.org>, Liang Yan <LYan@suse.com>, Alex Bennee
 <alex.bennee@linaro.org>
Subject: Re: latest GOOD state of series i386 cleanup, arm cleanup, s390
 cleanup
Thread-Topic: latest GOOD state of series i386 cleanup, arm cleanup, s390
 cleanup
Thread-Index: AQHXSwJwvhGn3Q+j/ES+UgCONCZj/6rnbyoAgAADe20=
Date: Mon, 17 May 2021 10:11:00 +0000
Message-ID: <VI1PR0402MB3744903ABF204EF2B289CA9FA02D9@VI1PR0402MB3744.eurprd04.prod.outlook.com>
References: <466cf154-cabf-2e8f-021f-a82cf7b88b31@suse.de>,
 <20be5f7e-f475-4f3c-0fca-fff1750c08fe@suse.de>
In-Reply-To: <20be5f7e-f475-4f3c-0fca-fff1750c08fe@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=suse.com;
x-originating-ip: [114.36.115.208]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90667985-8a28-42fa-d0d4-08d9191c128c
x-ms-traffictypediagnostic: VE1PR04MB6591:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB65911970A1DA79CCD292CB5CA02D9@VE1PR04MB6591.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z1HbsAgv+AAOE950ghfzLjMpOg+BUfjMpjulwyoTep1I9Bb1QDphNQPscPhJu/52px7qt+wc96uJybGpsE7L7o7YoUEZQO+L8mFLaLC7ZZT+XUGoLxADPhzkQsKTkMA1GEW2xfvf9sg6RqtQLD9uQDZXHSM7Uc4yzmqDs4w8y80z+wiMqQsE5CxXKH4e72Nt2lJYsTimmezTmrxSR+ePxVP43pCF2ucWwCwGW1wdDPaubVBnVgHwsWeZvuybfaVcuCgdRJ5LJDpW9TV/VDQqJXIbgUy1CYSrc23loGbyzQLHiBbgQhIet5+lzIvMj/AHhw+cV1VPgWEFYXI9ysmVJDBuyrw9Jaym01BuYrvoOA6Vs/nD78BAID40PS6XLrxBvvf29+i7Dj06Hjbq4sxb3azhiLut/OL6idkz60NoE+tTPqprhGrpeT1TpPX5usNJz6BacLKcbzevDYV0W/RgVTODYszI9uBfAFdxvwxRCy0FqsJNjnfKMo0R/nlstNq8sWXbya/0+xZC9ZTrG4SCpEIssv2xVH2KBFYQzhKDc8PX/INu6UwrDSNUVEv1F0zt/kjWqH3aUA03ct5w1S0QoxdTNLBAz+Yz0xsRNni4NaawPqQoCZMXYvC9+Vo5UPgusBdpl7cCohpiFp6qRluEWTiledWE3znujVrjptgaxJgsK2Wix05DQSl20P7EAIRAbwwfziAbrRk5GkhVCaMr5CRkAwfapqLKyJDBPamVjyKlnlH1V4fGlKq99MeR+ikWrr1sOepO9mPW7JIVBgHBag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(136003)(396003)(376002)(39850400004)(6506007)(33656002)(966005)(53546011)(71200400001)(19627405001)(52536014)(166002)(5660300002)(2906002)(186003)(8676002)(316002)(38100700002)(4326008)(122000001)(66556008)(54906003)(91956017)(7696005)(76116006)(66476007)(64756008)(66446008)(55016002)(8936002)(26005)(66946007)(478600001)(110136005)(86362001)(9686003)(11716005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?WHzs3/wlX/y2rZ59+Gdz9K8cqP+UYf1ly+3BYPy5TnOEObyJUheFdsuO3v?=
 =?iso-8859-1?Q?HaBUU+0ygYYS09b5kMc+07lRjejZtTNqUnO9m3ASowB81fhnNuWhBOZPFt?=
 =?iso-8859-1?Q?GVRB+iGzGWVvhCW+SdttBvsIUuIi/GqOrLb0tcAZ00+RUXPpcQvVljHOsI?=
 =?iso-8859-1?Q?zz2oXQ2HnPNP9eVlPGVRlHZpPyortkPY9fBQjjaZcLaJiQO4ZOXLobcnpr?=
 =?iso-8859-1?Q?jy2xMSBuQqOxXa4aen+0J1aQs+MeKiyezjpcM+3gYUSr6FwhOy2xE8/odw?=
 =?iso-8859-1?Q?Clhr7kBCFOz0isvJPShGEgxAoD7i/FUhIw88T8oZxL73cXvb0klYsb7s0a?=
 =?iso-8859-1?Q?BB5lAbSKtENgqfaAXioRn0KzWJ2leCbuK1oVzHmLEpvzqcKwoXphOQx+lQ?=
 =?iso-8859-1?Q?giedF923JyI3zguFsKAYP9IOrZRuqSZ8ubejN89DaSNQmixPQ6HPrt4aKL?=
 =?iso-8859-1?Q?neIxtOlDiVrKUxv2W9nwDQzmcAvRrPc0cP7EpGUY+9Z5+3hPKVMsu+9Vtz?=
 =?iso-8859-1?Q?i7WPGATn33xlb9yI2vHK0j5JIDUa2x/rYlDh0XEaGSP1KEMG6GaML9MIR/?=
 =?iso-8859-1?Q?1KhyJTk+dL/FjohwrznxE1GT6y/7QTtGOXGBjo2Rs1ZAZ/6WlLoC9odosX?=
 =?iso-8859-1?Q?R5ZOKjCgF2lLLMEoOUw/jztY/xA1xNEK9fvF1kq0LuqppDISvn8CvbW/bK?=
 =?iso-8859-1?Q?i2srHm6QQXxoOJ9TwpACNEHIXdqTQA/RSTkFUzQ8lgxbPsw4ehm3OpJat9?=
 =?iso-8859-1?Q?Ot7rs7MbDSLN6ZGsMNgU2rjAclDMN4PfaUwH7OCg/r3zFtQyrTh0EsrKT1?=
 =?iso-8859-1?Q?AIR8SRlOoWyCc+BMKVmpZHJxnJ2Xev4jpuWodwlU7UI6vI4yH8Y0m4xxjd?=
 =?iso-8859-1?Q?zdTRzng0PfAfe2Ntg2tMwh1aIFle01ayzE3ZgxEcs8XN/eeqQIeoorP/8V?=
 =?iso-8859-1?Q?T0fMM+htyteYJUaN5CwvIkIVSxRkvxwlzGLUdIse4WuEnRG9Oi6B/eDzmu?=
 =?iso-8859-1?Q?mTzNMbRv95/TGSTLs7dI7E6cZdlorVMW/31VG1J4OeG5+A0iHfAxSlyDD1?=
 =?iso-8859-1?Q?WVlIq2rUXLWxDXTp1bHiFFvXh56+4RPxfApePKWqpvLRFU8YQlshXM7msf?=
 =?iso-8859-1?Q?aY9dF5p0jChIRNyefjJQJsRLsS+Hm+Z4DyC7yl8/P11AKYLlrptqi1eNEQ?=
 =?iso-8859-1?Q?l6qvoB7lLP/VuOzKYMYgisnIamrvpD2m6Jjo/vorJ1Aiqvg+quVFyPFgh1?=
 =?iso-8859-1?Q?d4UNYuTNlle+3bMp0SBYKD+P7JjdWDWqJ6MWE1jYx2szv6zjo6llqP4VsQ?=
 =?iso-8859-1?Q?fmletjFHjtaK4Ftgnj5D9nffChLFDRTYOkleWhvjPrggUr/3FEadECB3jf?=
 =?iso-8859-1?Q?NjcE1k6lct?=
Content-Type: multipart/alternative;
 boundary="_000_VI1PR0402MB3744903ABF204EF2B289CA9FA02D9VI1PR0402MB3744_"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90667985-8a28-42fa-d0d4-08d9191c128c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2021 10:11:00.9673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yxb1rMpVXdbq23lEvu9VsqAh4vm53kjje02ty4XBhrX7Hja/7lJVtxEs6Ev84fvE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6591
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Al Cho <ACho@suse.com>
From:  Al Cho via <qemu-devel@nongnu.org>

--_000_VI1PR0402MB3744903ABF204EF2B289CA9FA02D9VI1PR0402MB3744_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Claudio,

> https://gitlab.com/hw-claudio/qemu/-/pipelines/293603379
>
> https://github.com/qemu/qemu.git branch "s390_cleanup_v1"
>
> Al, can you take this one to the finish line?

Yes, I will take it.

Cheers,
             AL
________________________________
From: Claudio Fontana <cfontana@suse.de>
Sent: Monday, May 17, 2021 5:54 PM
To: Richard Henderson <richard.henderson@linaro.org>; Philippe Mathieu-Daud=
=E9 <f4bug@amsat.org>; Paolo Bonzini <pbonzini@redhat.com>; Peter Maydell <=
peter.maydell@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>; Al Cho <ACho@suse.com>; Liang Yan <=
LYan@suse.com>; Alex Bennee <alex.bennee@linaro.org>
Subject: Re: latest GOOD state of series i386 cleanup, arm cleanup, s390 cl=
eanup

On 5/17/21 11:53 AM, Claudio Fontana wrote:
> Hello all,
>
> due to my inactivity for a few weeks coupled likely with the upstream pro=
cesses around qemu-6.0 now the series:
>
> 1) i386 cleanup
> 2) arm cleanup and experimental kvm-only build
> 3) s390 cleanup
>
> have become stale and hard to rebase on latest master.
> This effect is compounded by the fact that lots of broken tests in master=
 have been added.
>
> In the interest of not losing work,
> I provide here the latest known good state of these series:
>
> For the i386 cleanup:
> https://gitlab.com/hw-claudio/qemu/-/pipelines/293603386
>
> Tests started breaking horribly since about 1/2 weeks.
> The latest version of the cleanup is reachable here:
>
> https://github.com/qemu/qemu.git branch "i386_cleanup_9"
>
> In my understanding, Paolo has now picked up this one.
>
> For the ARM cleanup and experimental kvm-only build:
>
> https://gitlab.com/hw-claudio/qemu/-/pipelines/293603376
>
> https://github.com/qemu/qemu.git branch "arm_cleanup_v15"
>
> Again here tests started misbehaving in the same timeframe.
>
> The state of ARM cleanup is still experimental, maybe Liang or Philippe y=
ou can adopt this one?
>
> For the s390x cleanup:
>
> https://gitlab.com/hw-claudio/qemu/-/pipelines/293603379
>
> https://github.com/qemu/qemu.git branch "s390_cleanup_v1"
>
> Al, can you take this one to the finish line?
>
> Thanks,
>
> Claudio
>

Adding also Alex Bennee in Cc:

Thanks,

Claudio


--_000_VI1PR0402MB3744903ABF204EF2B289CA9FA02D9VI1PR0402MB3744_
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
: 12pt; color: rgb(0, 0, 0);">
Hi Claudio,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; <a href=3D"https://git=
lab.com/hw-claudio/qemu/-/pipelines/293603379">
https://gitlab.com/hw-claudio/qemu/-/pipelines/293603379</a><br>
&gt; <br>
&gt; <a href=3D"https://github.com/qemu/qemu.git">https://github.com/qemu/q=
emu.git</a> branch &quot;s390_cleanup_v1&quot;<br>
&gt; <br>
&gt; Al, can you take this one to the finish line?</span></font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Yes, I will take it.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Cheers,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AL=
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Claudio Fontana &lt;c=
fontana@suse.de&gt;<br>
<b>Sent:</b> Monday, May 17, 2021 5:54 PM<br>
<b>To:</b> Richard Henderson &lt;richard.henderson@linaro.org&gt;; Philippe=
 Mathieu-Daud=E9 &lt;f4bug@amsat.org&gt;; Paolo Bonzini &lt;pbonzini@redhat=
.com&gt;; Peter Maydell &lt;peter.maydell@linaro.org&gt;<br>
<b>Cc:</b> qemu-devel &lt;qemu-devel@nongnu.org&gt;; Al Cho &lt;ACho@suse.c=
om&gt;; Liang Yan &lt;LYan@suse.com&gt;; Alex Bennee &lt;alex.bennee@linaro=
.org&gt;<br>
<b>Subject:</b> Re: latest GOOD state of series i386 cleanup, arm cleanup, =
s390 cleanup</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 5/17/21 11:53 AM, Claudio Fontana wrote:<br>
&gt; Hello all,<br>
&gt; <br>
&gt; due to my inactivity for a few weeks coupled likely with the upstream =
processes around qemu-6.0 now the series:<br>
&gt; <br>
&gt; 1) i386 cleanup<br>
&gt; 2) arm cleanup and experimental kvm-only build<br>
&gt; 3) s390 cleanup<br>
&gt; <br>
&gt; have become stale and hard to rebase on latest master.<br>
&gt; This effect is compounded by the fact that lots of broken tests in mas=
ter have been added.<br>
&gt; <br>
&gt; In the interest of not losing work,<br>
&gt; I provide here the latest known good state of these series:<br>
&gt; <br>
&gt; For the i386 cleanup:<br>
&gt; <a href=3D"https://gitlab.com/hw-claudio/qemu/-/pipelines/293603386">h=
ttps://gitlab.com/hw-claudio/qemu/-/pipelines/293603386</a><br>
&gt; <br>
&gt; Tests started breaking horribly since about 1/2 weeks.<br>
&gt; The latest version of the cleanup is reachable here:<br>
&gt; <br>
&gt; <a href=3D"https://github.com/qemu/qemu.git">https://github.com/qemu/q=
emu.git</a> branch &quot;i386_cleanup_9&quot;<br>
&gt; <br>
&gt; In my understanding, Paolo has now picked up this one.<br>
&gt; <br>
&gt; For the ARM cleanup and experimental kvm-only build:<br>
&gt; <br>
&gt; <a href=3D"https://gitlab.com/hw-claudio/qemu/-/pipelines/293603376">h=
ttps://gitlab.com/hw-claudio/qemu/-/pipelines/293603376</a><br>
&gt; <br>
&gt; <a href=3D"https://github.com/qemu/qemu.git">https://github.com/qemu/q=
emu.git</a> branch &quot;arm_cleanup_v15&quot;<br>
&gt; <br>
&gt; Again here tests started misbehaving in the same timeframe.<br>
&gt; <br>
&gt; The state of ARM cleanup is still experimental, maybe Liang or Philipp=
e you can adopt this one?<br>
&gt; <br>
&gt; For the s390x cleanup:<br>
&gt; <br>
&gt; <a href=3D"https://gitlab.com/hw-claudio/qemu/-/pipelines/293603379">h=
ttps://gitlab.com/hw-claudio/qemu/-/pipelines/293603379</a><br>
&gt; <br>
&gt; <a href=3D"https://github.com/qemu/qemu.git">https://github.com/qemu/q=
emu.git</a> branch &quot;s390_cleanup_v1&quot;<br>
&gt; <br>
&gt; Al, can you take this one to the finish line?<br>
&gt; <br>
&gt; Thanks,<br>
&gt; <br>
&gt; Claudio<br>
&gt; <br>
<br>
Adding also Alex Bennee in Cc:<br>
<br>
Thanks,<br>
<br>
Claudio<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR0402MB3744903ABF204EF2B289CA9FA02D9VI1PR0402MB3744_--


