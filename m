Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA79392249
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:48:11 +0200 (CEST)
Received: from localhost ([::1]:52896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1Nq-0006f5-SE
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lm14J-0007vx-RR; Wed, 26 May 2021 17:28:00 -0400
Received: from mail-eopbgr790133.outbound.protection.outlook.com
 ([40.107.79.133]:10784 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lm14H-0004Uj-Ij; Wed, 26 May 2021 17:27:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mk55VY3FOmZ+xIJPbqa6jlliUlYJtMkKoxA6Jz/RPuoqvOkaAuAcedg4QGKx0HHWViXpZjxYd280FzA/O5QQWhyu0c3oZw5YN1SOYULJ3OcNtoepY6CGIm1YaKkhGEC0WApVVvVIuN8upHpgddWEhCy7Jx8CVR29ZbXp+f7n67pA15ZeMBmkX9bTizVbpn9ccxwKn72EhEnoVJTzo/yCvIONjU+WmD8TcvOPL9KqmJ11g+EVpbOQAXa30zVr0C2xKHgcp1oEXDwU+w/Sdxw5bpPzCKEMDWnZX23O5Uoh1b89/vE7e+4TfaljKd9iOX8gdTP8n3xHGyH1vZdiNLE/qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWBPOBoF1uNDVIiNo3sFMa0lZas5SDF1It+Gx4OMwOs=;
 b=dTs8wAOu1HXFjv6UKSShEmZ/H+i5MtK229OYiInaFylJLNZRAMjkvegIroPz1i4d0Nh0+W7qh5vU5tcRJx+d0kyQNKTLiHs7W+dLeGrZKgDpKexBQSnrz2RrTn5grRTjGqqntnDXmzagx4LI1Wo0w2Wag+4qT/vF1KRdy3jclKaV27hHEZ+ntMDYgASiQ7kXWBcjrVB37AUZyQ9gxzQPwPTaNw9e5nuhuhwBpLh+nvPre/qyr7tXymAJsmuDennjYfjGnOXAtXH7Vjpz8D5hiCs4g+UT0tcV82xQi5bZQkQ/4aj9b6CSMdf89k1JEEO5WHgGOiALSK+/lCwcjsgjRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWBPOBoF1uNDVIiNo3sFMa0lZas5SDF1It+Gx4OMwOs=;
 b=aRbRsgrTZakPrDYKdQXfch/0dodo+6S79XXRTVrPvbdqds+ir+lohnhMkMVIDpNW15NbKorS13Als9GLnmGKQWTIv45WMxFnyJRh9JO8/PBXXk7x65kCsQnqPoMIEAa9EDveQaIgcaUYYBpVafZWsn7Vk+zSXhKpuqTz1Vg7/v8uNFMINn5TUqJ2VfhUqH4W5o7MSQfnVEiZuUwFqD3d3X9pR+qrXA8pw+qKWrlkAcheaQSVslw7++1CWhjVmJGBfwBLp7A4/V676j0YktS2ip4AT3qQVcclB9iJ2m2aw+KzcIZOOfki7STPJRG15aLIq6OgonuLLFjKqVBpqB70yA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP0PR80MB5313.lamprd80.prod.outlook.com (2603:10d6:103:55::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Wed, 26 May
 2021 21:27:51 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4173.020; Wed, 26 May 2021
 21:27:51 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 2/5] target/ppc: remove ppc_cpu_dump_statistics
Thread-Topic: [PATCH 2/5] target/ppc: remove ppc_cpu_dump_statistics
Thread-Index: AQHXUmzYwrgAbqaiJEKJpbsSF70VFKr2Q3dQ
Date: Wed, 26 May 2021 21:27:51 +0000
Message-ID: <CP2PR80MB3668A3BEA6CEAFE769C122ADDA249@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-3-bruno.larsen@eldorado.org.br>
In-Reply-To: <20210526202104.127910-3-bruno.larsen@eldorado.org.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: eldorado.org.br; dkim=none (message not signed)
 header.d=none;eldorado.org.br; dmarc=none action=none
 header.from=eldorado.org.br;
x-originating-ip: [177.9.76.236]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57a8871c-8a2a-4245-8174-08d9208d1e37
x-ms-traffictypediagnostic: CP0PR80MB5313:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP0PR80MB5313BE0470EC84E50732010BDA249@CP0PR80MB5313.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nMOKZ6po06k25ZAjL4nBXY7eZO56LRhijTzyKIV5RddX3HhRTu9W/B6LmFKAIXKIrbYxMcToKTmJLLTmKGNAD94j0VehtzGERWJVlogjBMTxfPIM6phjNXM8XTW4xEQRN+Zyss8TQeUZPzXXxTUAaHT3CAEUW80vUgSSgr/ETxP+E4HLWddbzLnvMfqXq1jsm4dDOvAUn6LcFtPiWwbd2pxvmjwXnBrjb0U7PlR5hDqKq02DgpWRDxxC4Hl0TTTUhWKMv0iw/1tvUSpTAlnkOfMpxqnfUx9CUbr6IkHQCUh6Xz3ttB1EkCn7w9J69FUULt5XTf37qYYqkE8TpnavpOo5WKNtXn1Z7U6MDrdQnyHtc9MYoXQgoEfIKIeR0Qsgsq3aNONSbSmV3kAFN9IgBVEkIiiUWwd0YwjtMrB+Tib06xsWG3YL6FpgdacytoR9kYVo6uEO5Dm3QD1U3CZgOLzFXabIkSMPIoQZC3Au6QvBx7HVgnI1W96EE6yK8W1otQhULrWGaq1mwJxSaDjFfq5zUwR/Hbwa1gsAIrEDg6btXO9WItf/vMMnS3ridnyA6aibNe68ixnlCKGiGnEQl7dGWVVYCEflZIKwYmaLfZRWanQYpvHhILhddT5sSVgvk7U0J+JT0dlAycJ/rjFetSa2Dn2QJpx73Lc4wQhkWgC+r2xELdSpJqNdUfFGUAHeLGJenICa0JGAujfByuQvGhRsu2XD42ygRgt5769J+m4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39850400004)(136003)(376002)(346002)(366004)(55016002)(66946007)(2906002)(52536014)(21615005)(122000001)(4326008)(66476007)(86362001)(166002)(54906003)(76116006)(83380400001)(110136005)(8936002)(38100700002)(316002)(64756008)(33656002)(6506007)(71200400001)(186003)(66446008)(26005)(9686003)(4744005)(478600001)(5660300002)(8676002)(7696005)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?bFn2/qmyZu78X2StbqFdQfvr7Vz+Y6zChGXCffIchZlTD9dX4w2dPIqlNH?=
 =?iso-8859-1?Q?H8pht1eKYTlwQwvzDdWqMP8xXnBeWcXXAm9EuwZLxmqpfhTcOfUqIsLYBr?=
 =?iso-8859-1?Q?8s5umdTmAmWVBUVVMq9Pgwgh3qmksOnnCnFyzDQl5HMH3DQTiotFZmbVml?=
 =?iso-8859-1?Q?7O/JwLmnQS6A6RMPx4WtexxqCZG4KNbFB2ZL2+q0vbWNMlIPIzF92R6hSx?=
 =?iso-8859-1?Q?6Fl0jsP98XbfjBN2bqIZYGexXRITFQCIAIfn6uqpP8XoMw2dWqJ/PD7BcW?=
 =?iso-8859-1?Q?ZFRKfj4j125DAZgZwYTgP13JcZ8Gq9rS2KtbzcBIFJz7ItJwdBJiE73pZR?=
 =?iso-8859-1?Q?14UmDvRiQw2NnfR8HVr8lOQc2KU8MD8TzbPQmT8Ih8Rr5JbVqg/XVtZKcT?=
 =?iso-8859-1?Q?8jBoBnK5ch8zKQPh38bL0MMB3tx+vPjAWNWnfSrmXz45PRiJQO2FSzCCDs?=
 =?iso-8859-1?Q?G81sXiETIQVSKD4MTfOsmbEN7HJdJPmj823yG3kKa7vckVwFC+RMaBQSah?=
 =?iso-8859-1?Q?BN2suc+bB4+uY5Hhii/11/6F/+YR6Qr7nCORmj0dfkKJ5r804iqf32FJYW?=
 =?iso-8859-1?Q?VmHJxfmxHn/wCgsECgvcOXAvUF2pRtnl1ikXUVUlHNQddmelJHmavHQerj?=
 =?iso-8859-1?Q?9+0UfPLX0WtWSkDSTunGqbH8xqUn/tBYgyE8mM0F0vfUEBcdHqM5XaVDQ7?=
 =?iso-8859-1?Q?c2r4FK7DVBBJhtNaVHGyJfM1+wJxiINUFs/aV65JO8zBhVx/3xU/o9X8fS?=
 =?iso-8859-1?Q?l2WYLR61t950CpPPsItp18n8ejDExve7AUteWr5TAit7WBFFI/Sw3nQYet?=
 =?iso-8859-1?Q?VGt5s7z4jg+0wH3rGytjuxrggwWPdAByAOaYlGnkY7yMzosYHIEZG1glTU?=
 =?iso-8859-1?Q?DPpw/Sy5lDc2AHpLotC27IAdOwC4+N7ChHfUvZQd6m7Eh029CetJ5B9Lba?=
 =?iso-8859-1?Q?HRcwhA3VneO84jk08rgtQ5YBfoZBWEJ74kBLHd/OE+17OHRcGDaomXdCuU?=
 =?iso-8859-1?Q?vd+BVH2Eke1V6rWO51woAtdY6hOT8ocWwZfnMtzM1CXGBs/yRNjbHbF+Ol?=
 =?iso-8859-1?Q?qisFsyLJI+vN4AGpzjlR/4u5p8WGBhlOTSsaaWvGHagf03Ws8VHtAKvvdw?=
 =?iso-8859-1?Q?chbOZZ2DIfWwwtI58k6HN2eMdxvrgN33VJL+TZB/4dyLOKi4WnnwI0rrAU?=
 =?iso-8859-1?Q?N5nANe/giHoFrA+mszv5tcyKWLB2Hj0DiH7aGTbq6M8hKT9Aexk1ixHFZ1?=
 =?iso-8859-1?Q?XLbOt7VPEDruoDk+gMpHfij6FcuncUdU1W+U0lpsoROy8X2uChgbtE/PVL?=
 =?iso-8859-1?Q?cVdi/VEnMJ/w3EKAcrpiMQoHxwJngeaDG7ZyupIuTFodsgY=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CP2PR80MB3668A3BEA6CEAFE769C122ADDA249CP2PR80MB3668lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a8871c-8a2a-4245-8174-08d9208d1e37
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2021 21:27:51.6159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rq038GP9gxg5Z550gHiTFiU3W8LLxDADdpi91AOZ2oUYf67UIB7evdXgU8HD1jiF20cOASCzNzuQHJ3JvLIWkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB5313
Received-SPF: pass client-ip=40.107.79.133;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CP2PR80MB3668A3BEA6CEAFE769C122ADDA249CP2PR80MB3668lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>

> This function requires surce code modification to be useful, which means =
it

> probably is not used often, and the move to using decodetree means the

> statistics won't even be collected anymore.

>

> Also removed setting dump_statistics in ppc_cpu_realize, since it was onl=
y useful

> when in conjunction with ppc_cpu_dump_statistics.

>

> Suggested-by: Richard Henderson<richard.henderson@linaro.org<mailto:richa=
rd.henderson@linaro.org>>

> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br<mai=
lto:bruno.larsen@eldorado.org.br>>

> ---

>  target/ppc/cpu.h       |  1 -

>  target/ppc/cpu_init.c  |  3 ---

>  target/ppc/translate.c | 51 ------------------------------------------

>  3 files changed, 55 deletions(-)



It's not just that ppc_cpu_dump_statistics() wouldn't be useful, but it wou=
ldn't even compile.

The change looks good.



Reviewed-by: Luis Pires <luis.pires@eldorado.org.br<mailto:luis.pires@eldor=
ado.org.br>>


Luis Pires
Instituto de Pesquisas ELDORADO<http://www.eldorado.org.br/>
Departamento de Computa=E7=E3o Embarcada
Aviso Legal - Disclaimer<https://www.eldorado.org.br/disclaimer.html>

--_000_CP2PR80MB3668A3BEA6CEAFE769C122ADDA249CP2PR80MB3668lamp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 129.75pt 72.0pt 129.7pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"PT-BR" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"mso-fareast-languag=
e:PT-BR">From: Bruno Larsen (billionai) &lt;bruno.larsen@eldorado.org.br&gt=
;</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; This function requires =
surce code modification to be useful, which means it</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; probably is not used of=
ten, and the move to using decodetree means the</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; statistics won't even b=
e collected anymore.</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; </span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; Also removed setting du=
mp_statistics in ppc_cpu_realize, since it was only useful</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; when in conjunction wit=
h ppc_cpu_dump_statistics.</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; </span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; Suggested-by: Richard H=
enderson&lt;<a href=3D"mailto:richard.henderson@linaro.org"><span style=3D"=
color:windowtext;text-decoration:none">richard.henderson@linaro.org</span><=
/a>&gt;</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; Signed-off-by: Bruno La=
rsen (billionai) &lt;<a href=3D"mailto:bruno.larsen@eldorado.org.br"><span =
style=3D"color:windowtext;text-decoration:none">bruno.larsen@eldorado.org.b=
r</span></a>&gt;</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; ---</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &nbsp;target/ppc/cpu.h&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 -</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &nbsp;target/ppc/cpu_in=
it.c&nbsp; |&nbsp; 3 ---</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &nbsp;target/ppc/transl=
ate.c | 51 ------------------------------------------</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &nbsp;3 files changed, =
55 deletions(-)</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:black"><o:p>&=
nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:black">It's n=
ot just that ppc_cpu_dump_statistics() wouldn't be useful, but it wouldn't =
even compile.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:black">The ch=
ange looks good.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:black"><o:p>&=
nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:black">Review=
ed-by: Luis Pires &lt;<a href=3D"mailto:luis.pires@eldorado.org.br">luis.pi=
res@eldorado.org.br</a>&gt;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:black"><o:p>&=
nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black;mso-fareast-language:PT-B=
R">Luis Pires<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black;mso-fareast-language:PT-B=
R"><a href=3D"http://www.eldorado.org.br/">Instituto de Pesquisas ELDORADO<=
/a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black;mso-fareast-language:PT-B=
R">Departamento de Computa=E7=E3o Embarcada<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black;mso-fareast-language:PT-B=
R"><a href=3D"https://www.eldorado.org.br/disclaimer.html">Aviso Legal - Di=
sclaimer</a><o:p></o:p></span></p>
</div>
</body>
</html>

--_000_CP2PR80MB3668A3BEA6CEAFE769C122ADDA249CP2PR80MB3668lamp_--

