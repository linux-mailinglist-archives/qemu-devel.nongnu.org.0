Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AA3366002
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 21:06:39 +0200 (CEST)
Received: from localhost ([::1]:60452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYvhm-0004Lh-NG
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 15:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lYve1-0003Bm-Lv; Tue, 20 Apr 2021 15:02:45 -0400
Received: from mail-eopbgr790098.outbound.protection.outlook.com
 ([40.107.79.98]:40106 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lYvdy-0007gm-0i; Tue, 20 Apr 2021 15:02:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPec34mPun7lFlAA9eBRpJLx90sEQzwuf5ZAUGEk/3A249v3/tMZuozTml1ty+EvQybLQOjkEEvizulrtue3q7YBttzw+ut8rlB3usiwD08IqO6oGSsWYv1auFVn3Nf8X1mmPuVDbPe6dgJpRDv6VOlUK4vVc3Jtmm4eH4R71NP+SOKGsOULBfQGuYQtgsTpYJkQM8P5r2Xk/2nVxcka+Jupknjt6viw3MAqzJzk02iTIBMjeB57LsGlfrBbm9e+Q3IqWYR2m342kzra5+evJlZmzAXriCRkFduEVfFKhpaKoVWucaWq3DGURcIC3GmSgW6h1l22OK7Z5WILMjOFVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmmeRPS5lIDr22DR/JsEdPpSoHWwMGCR2sFRi/JsouA=;
 b=kFwSGQ6UYMkPTujhpv0RIL5LHncfVmqle+cXwXH7nE4p+UHtsTnHq71XM1ArlgmksmKtHDDnK/xsU3u4g7udL6YRPjh3DS4Z9TL9uh2vJTHd6DtLaKLKIqvWjjbPsK2Y4PX12D7KWI+LnG6lM3G+Bd0uFDZcHlIoil6pF5dr26iOvq9VkH60RMlZWqL+CGcVLbLm8E+M63EFMwhuy4vs2UQ6medpYkkmQ9cqXnPL7nJyza0U21/i2j4eFVcuZlhpHQ1jjuD0WRiPIO5KaLGZMhvMFg4f+rMS9juh0E11egpmqxxprY7GycjSVr1OMxHeFaCTwp4sD3iv3w7ddnkHlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmmeRPS5lIDr22DR/JsEdPpSoHWwMGCR2sFRi/JsouA=;
 b=TQILDqaB+0wGtvNlmHo/kWFNhZ9Qa/Llc53uRApUcMi+thoB2r7ZzYJ/XNttIzJSjrRbs1btFBtis0pY4tCTn2ITAFF4wqdkjlgJLZwVA5qNKbwhENwTUOPHCk+EHcfe/cAWrSDuOX71H/nv1iqkx54H2AdArRgofA4P1RbnftEKrPQ7wpVShIdLjMf4Uol0Jyki5AwVq3su4eInrcctotF8pRA+RJDk1KPjV5wMvA8HXdqb3N210ct0A4y42O5Kffie2HDX4yrEqskVL2920nt3L04zs0cQ0La1n9YW7DyL6DgVLzVro4kIRre2fRkHq90OTTu4VEZI4yWeYB5Bnw==
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com (2603:10d6:102:45::19)
 by CP2PR80MB5700.lamprd80.prod.outlook.com (2603:10d6:102:3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Tue, 20 Apr
 2021 19:02:37 +0000
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b]) by CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b%7]) with mapi id 15.20.4065.020; Tue, 20 Apr 2021
 19:02:36 +0000
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: RE: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Thread-Topic: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Thread-Index: AQHXNhS2GB462+mBrkiRiwNTo2+kGA==
Date: Tue, 20 Apr 2021 19:02:36 +0000
Message-ID: <CP2PR80MB4499C22B7C564141EB06812EC7489@CP2PR80MB4499.lamprd80.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gibson.dropbear.id.au; dkim=none (message not signed)
 header.d=none; gibson.dropbear.id.au;
 dmarc=none action=none header.from=eldorado.org.br;
x-originating-ip: [2804:14c:482:7ed1:913f:66c2:f85a:a1a0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b74cfbce-8a91-4216-af90-08d9042edcb3
x-ms-traffictypediagnostic: CP2PR80MB5700:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB570088C4252789F03B8686B7C7489@CP2PR80MB5700.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gmF4T1Rs4xO7chY/X1EHgO1MOBclfQvUxQ+S6W1hLeTSUjiuZhXY7AA6qzHHRfU79PNuuvYgpPDrsU/ZFXg5GZP2zL8M7/TxhhsxhR32xH9ohnb2rcr8+iXAGGqJOztFq5fEnvZLSs2fk0KXU35+DzNmx1+y3ZVyvzDvSqtKCzDYVhuM8nu9BKEL0EbgcJbjVmtvk7RcTK0xcUVhHrGYQn0iN5MvyA8Adv3zl7sxCTIdg4+0dkgL2BYwlhQHoseOAmoMaFAWn5nGx4axlBqQMawi0cCP36Yg2yhyzv+X93FnB1QhSQ4SCqUHksAuTwpvGpKCtsHom1wA17ADJ5I0hPcLU46cOoxg5i9iQXz0EBXdIQw3hkHi+mYSDm5r8M+vf6rq4ZtjVdjn7UWjdmLNDWK4gv58gathUcgeIhLw8mbSqm17efEyC9yFcSkAVe4aK8A8HGaQglGi3jIbG86xpXJVyK/WuRC8ZREbVwzg7i3MlcD9XM7wB50Al8RS5qIJZJ3a//9+oetXlNzwRBraRtdv0P+e2x6xGmsqu/Yw7lW/Vt6p5450Sk8XAieJZjrfB0Bo2Wn10ZRH9xzNi51PffoTdMHW0N62u/6pZWh7pVel/xMbjySym2GLRbG7dhBKjK2AJe4LzyxcD126unxNN5EbFHrCYUbGe/N0GsUSsFRKRCCXLYsq0WMnPbKCDO9O
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB4499.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(39840400004)(136003)(376002)(366004)(66476007)(8676002)(64756008)(66946007)(66446008)(76116006)(38100700002)(66556008)(55016002)(71200400001)(6916009)(4326008)(19627405001)(166002)(186003)(7696005)(8936002)(2906002)(52536014)(5660300002)(316002)(86362001)(6506007)(9686003)(478600001)(107886003)(33656002)(122000001)(21615005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?mG9VI9QfkSI8DukAqedKqH93f/rTKsVLZzHlBGsi0yK4ULjqjnb+4rErfu?=
 =?iso-8859-1?Q?+qFRfOwcmo6jaDB/6fFv3RTWSTK/Z522Tl6J2+JvkmXP7izQeQwYYWMh53?=
 =?iso-8859-1?Q?wE56RjNA3RDSoI2FHn47zZbwWEh8eZRqRHhIH6MSCFhPvCUTjVen9dXpiq?=
 =?iso-8859-1?Q?uN0qVCtQBUDRsshCoJ7o5o8R2IbgQNFViAkp25ivMn+sV45I3tq99Xnceb?=
 =?iso-8859-1?Q?cZsLJWYN3YneSf4idj/Ukd0utCYWeBrgDdmQt3US3+RcP1DYHars3lG9uD?=
 =?iso-8859-1?Q?cdeE/PVCuL3W4AKoK0fimkFUavZY8j+xXNXxt7zjoAVbf9F9SszDacFTcV?=
 =?iso-8859-1?Q?EsT0bjI0UpN4cg63mZfYSPLpnXTwkcyY2yXRHhu0VvlbfI4kFJktpIMJRG?=
 =?iso-8859-1?Q?EavFJ74Av+Vh7sRcy8uIVOn3yGT3uykdZEuivrcRmqLu+yVGKArf7JXj7t?=
 =?iso-8859-1?Q?g5bJB1wptteZR1yQokIBWuA0j7kZXdXKmeb0syTdgDjWj6ynW4+msAIivw?=
 =?iso-8859-1?Q?Ysa+xwvNuhJDg07ibRUOlaj/HEUCY/S6JbPQ2k1ME/I/v4WS8jRvHaT78m?=
 =?iso-8859-1?Q?sOfXLpMO4kD/TlUsc+SL4MwqaXZe0Kd/suTDOzKC3n4i9EiMCNAbbBZatG?=
 =?iso-8859-1?Q?O/A6lUMVA/3TDJ+OcUJwuZ8c64uLTQR6YaP36qnrVkuqsOdooruRF0BZzN?=
 =?iso-8859-1?Q?JOAeJInknJRbtQsCHzGio4VfP3PFE70aAb9Fn/r4K+tgidVjLHheSmGmQb?=
 =?iso-8859-1?Q?w3nR9/0eL4WOOwfncJWXXC3vOG1Wy/fhgSh8afpOd1icjs25i16jeJdRa0?=
 =?iso-8859-1?Q?+p7UwWtsqzuGh5lGl7ZXOhxWunywdobCQxRqfj0p4cMxW47GSIn+q1KKZP?=
 =?iso-8859-1?Q?XvSwEYXOijBRcBoItt9GABAzJFAd8fgDWaMJAkafbsMT5CjOX7VKG+zpi/?=
 =?iso-8859-1?Q?TvfBEcDBtvEvcprnkp16oAG7LGY/zJSRnr4+2rk4xAfKi/pBCjvMsIe+OL?=
 =?iso-8859-1?Q?gvJAUQWUgB/2tq830Omx4b7OmwKdzVUt3BMFGxjYebljUlfGpCWXlfOeoI?=
 =?iso-8859-1?Q?CqaiDrkPQIZs6XPGSn3CYjadIZB3kzgbsi150WIF8Qt2zVFotIkUOh0Gz3?=
 =?iso-8859-1?Q?ShuvgGv9JrtHoK+rzWHNR3xGbb5DKtuspmqs2sjB5x8xRiZDlan2T6ABjd?=
 =?iso-8859-1?Q?EWBTdA2OFmVk40LZaE8nycWrdmSeLBDUSqnfQL2+MPnyCmgQ+n7IpJOwzI?=
 =?iso-8859-1?Q?lJ8aPKtT5St9z7NXMvCDu3YCqdKGFnRVxCcCTH1wUShBnF+pR8w2HkKs1x?=
 =?iso-8859-1?Q?9HcUBU3gvmCn48AXyHmi3aK6EuwLAgoW+rwG0NpSgx4oj1bFH0HZc5INcq?=
 =?iso-8859-1?Q?DOcaTIGHQS4wGIOg1qLsTV+f8lD3xqPkxS1yNNcR4GpAxXg1jPyKg=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CP2PR80MB4499C22B7C564141EB06812EC7489CP2PR80MB4499lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB4499.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b74cfbce-8a91-4216-af90-08d9042edcb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2021 19:02:36.4637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MGZkpVhSkXhC+lDbwO0npTYxwHMS1b9PGbfagAmNNEp4gjoiWH1thpBjSffSczVQaHrzy9CHC1R4U/pOv4pXFZHRx3/GH9pYwGol4xRkTQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB5700
Received-SPF: pass client-ip=40.107.79.98;
 envelope-from=bruno.larsen@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
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
Cc: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CP2PR80MB4499C22B7C564141EB06812EC7489CP2PR80MB4499lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> > What I was doing was to only register the spr once, and use the
> > accel-specific functions to set the relevant attributes, so spr_common
> > wouldn't need to where (and if) spr_read_* exists or not.
> > Would this work?
> >
> > Just ignoring the read and write functions means we still need
> > to compile them, or at least stub them, otherwise we'd get linker
> > problems.
>
> Not if you use a macro which will simply elide the references in the
> !TCG case.  Actually I think even an inline wrapper will do it, I'm
> pretty sure the compiler is smart enough to optimize the references
> out in that case.

You are correct! I've just tweaked the code that defines spr_register and
it should be working now. I'm still working in splitting the SPR functions
from translate_init, since I think it would make it easier to prepare the
!TCG case and for adding new architectures in the future, and I found a
few more problems:

1. Global variables being defined in translate.c and used both there and
in spr functions. The variables in question are: cpu_gpr, cpu_so, cpu_ov,
cpu_ca, cpu_ov32, cpu_ca32, cpu_xer, cpu_lr and cpu_ctr. The easy way
out is to have global "getters" and "setters" for those, but I'm not sure
it's a good solution.

2. Static functions defined in translate.c, used there and TCG-related
spr functions. They are: gen_load_spr, gen_store_spr, gen_stop_exception,
gen_inval_exception. The easy solution is adding a prototype to internal.h
and removing the static, but again, not sure it's a good solution

3. gen_read_xer (currently in spr_common) calls is_isa300, defined in
include/disas/disas.h, which is a macro that dereferences DisasContext.
However, the struct is defined in translate.c. This one is pretty easy, I t=
hink,
it's just turning the macro into a function, but since I'm already e-mailin=
g,
I figured I might as weel ask.

Finally, since most read and write functions are static, I added them to
spr_tcg.c.inc to be included only with TCG, as a quick fix, but I would rea=
lly
prefer some other solution if there is anything better. Any thoughts on thi=
s?

IIRC, this is the last thing holding me back from an RFC with this motion
patch


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

--_000_CP2PR80MB4499C22B7C564141EB06812EC7489CP2PR80MB4499lamp_
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
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt; What I was doing =
was to only register the spr once, and use the<br>
&gt; &gt; accel-specific functions to set the relevant attributes, so spr_c=
ommon<br>
&gt; &gt; wouldn't need to where (and if) spr_read_* exists or not.<br>
&gt; &gt; Would this work?<br>
&gt; &gt; <br>
&gt; &gt; Just ignoring the read and write functions means we still need<br=
>
&gt; &gt; to compile them, or at least stub them, otherwise we'd get linker=
<br>
&gt; &gt; problems.<br>
&gt; <br>
&gt; Not if you use a macro which will simply elide the references in the<b=
r>
&gt; !TCG case.&nbsp; Actually I think even an inline wrapper will do it, I=
'm<br>
&gt; pretty sure the compiler is smart enough to optimize the references<br=
>
</span></font>
<div><font size=3D"2"><span style=3D"font-size:11pt">&gt; out in that case.=
</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">You are correct! I've =
just tweaked the code that defines spr_register and</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">it should be working n=
ow. I'm still working in splitting the SPR functions</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">from translate_init, s=
ince I think it would make it easier to prepare the</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">!TCG case and for addi=
ng new architectures in the future, and I found a</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">few more problems:</sp=
an></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">1. Global variables be=
ing defined in translate.c and used both there and</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">in spr functions. The =
variables in question are: cpu_gpr, cpu_so, cpu_ov,</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">cpu_ca, cpu_ov32, cpu_=
ca32, cpu_xer, cpu_lr and cpu_ctr. The easy way</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">out is to have global =
&quot;getters&quot; and &quot;setters&quot; for those, but I'm not sure</sp=
an></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">it's a good solution.<=
/span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">2. Static functions de=
fined in translate.c, used there and TCG-related</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">spr functions. They ar=
e: gen_load_spr, gen_store_spr, gen_stop_exception,</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">gen_inval_exception. T=
he easy solution is adding a prototype to internal.h</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">and removing the stati=
c, but again, not sure it's a good solution</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">3. gen_read_xer (curre=
ntly in spr_common) calls is_isa300, defined in</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">include/disas/disas.h,=
 which is a macro that dereferences DisasContext.
<br>
</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">However, the struct is=
 defined in translate.c. This one is pretty easy, I think,</span></font></d=
iv>
<div><font size=3D"2"><span style=3D"font-size:11pt">it's just turning the =
macro into a function, but since I'm already e-mailing,</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">I figured I might as w=
eel ask.<br>
</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">Finally, since most re=
ad and write functions are static, I added them to</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">spr_tcg.c.inc to be in=
cluded only with TCG, as a quick fix, but I would really</span></font></div=
>
<div><font size=3D"2"><span style=3D"font-size:11pt">prefer some other solu=
tion if there is anything better. Any thoughts on this?<br>
</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">IIRC, this is the last=
 thing holding me back from an RFC with this motion</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt">patch<br>
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

--_000_CP2PR80MB4499C22B7C564141EB06812EC7489CP2PR80MB4499lamp_--

