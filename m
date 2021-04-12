Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A93835C4CB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 13:16:19 +0200 (CEST)
Received: from localhost ([::1]:60294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVuYE-0000AO-3e
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 07:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lVuV8-0007p7-2w; Mon, 12 Apr 2021 07:13:06 -0400
Received: from mail-eopbgr820098.outbound.protection.outlook.com
 ([40.107.82.98]:21088 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lVuV5-00086t-It; Mon, 12 Apr 2021 07:13:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J14CcBdgz5j8yP+l3oPF8BThuqKInPe7ml/KNXt25+rOas6GzPBvHJ59EjXTQFJwCZuL9L+JE6MsqacEBYq/VrWE5JmVETVojnlS7lOG6eCnfSWOkNd6SAZgnWJOzEuX7PEd3VOjP210NoZB7YO/7gmYKM7iBtu9RZ5rG5fJ4tLI9iTgE0DvjqoRiyrCK9M3wq6ue7BDTyCg/zJeCk7gxNBsGUPvmBQcBMY3+kTFPAD8NFkS+mhD2q7UpttvATgCzyIlrkokrsP2Eibp7F8WoCwK4/34VjoC0SPNxbgtKrddh9War6nXOKegunwI8jDX2XuWqgVenYhkXzuOKFSpRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4m1Itj820f33fuC/ILi0DJwxgbFRZpxtEpUiSUkt3Vs=;
 b=lQ0uYlXVAfLJLWvXa2a+KlkcWrVR5wrlYmVmpnkD+U/Zbwo0de8/Sb0GCGesj+gVjQc4ZdxZ53ejx+k7IQU2oGzs5GRD6C2dsw4jsPSSJ4L1v1MvWHagRFB14qIxQNDO5X/6NnDqCIDjBX8zsOaLylyO2AJQbSUY+P6EZu7JAjzoD4LsVR2cv/LBgptgfokyog6CkigNSwsbiwJ87RSI2sr+bx7Cp8lYbN/y1Y9gXkX7fbHbtoLB47ESA0Xm2+/rqFcvsrzXVncq9kj4frOHQgJMXfnLHC6OISKmpHVj8Zvat1IYUPcTLNyHI8xReDEpE5qKPzzfrWfAYHVRXTkgKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4m1Itj820f33fuC/ILi0DJwxgbFRZpxtEpUiSUkt3Vs=;
 b=Z1VCekrR1HucEUCnMgLTKISSreDMc4Y9WipvS/dLmppKKOFs5eEux9WVNOR8YW6Whb3xAikEdWr+J2zLcKQLjQm/qZW8tdCCHp8FNwxyFkhTeMtdge5+L75nzj1EVYgVX+YJ6127VOisNLNEQLO3Z8S+abNbEEd99bgu9+XRrWyV7d7+6scz30hBQVCOw5/1/RfkPX/MlgiuuAYaecMSbe+VnzM8/y6nxFIg1R5C9xtHaQkhDM5CzeRy9JaQdYW+V9Jaz03wGw5KVwH7OufoG7TSe72C54Mvw9PL3x5FSTJrserL7dD5AA2XO3ynzm0oWp6kM8m9n9x18kDbFrNXsQ==
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com (2603:10d6:102:45::19)
 by CP2PR80MB1907.lamprd80.prod.outlook.com (2603:10d6:101:7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Mon, 12 Apr
 2021 11:12:59 +0000
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b]) by CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b%7]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 11:12:58 +0000
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
To: David Gibson <david@gibson.dropbear.id.au>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [RFC PATCH 0/4] target/ppc: add disable-tcg option
Thread-Topic: [RFC PATCH 0/4] target/ppc: add disable-tcg option
Thread-Index: AQHXL4xTKgssisZpY0qJbUooKhltbw==
Date: Mon, 12 Apr 2021 11:12:58 +0000
Message-ID: <CP2PR80MB44996FA9E3200DD8C70F827DC7709@CP2PR80MB4499.lamprd80.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gibson.dropbear.id.au; dkim=none (message not signed)
 header.d=none; gibson.dropbear.id.au;
 dmarc=none action=none header.from=eldorado.org.br;
x-originating-ip: [201.82.34.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e8b2d69-319e-488a-0733-08d8fda3ee13
x-ms-traffictypediagnostic: CP2PR80MB1907:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB19070F7E79C1114865ADA59BC7709@CP2PR80MB1907.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OD6eV38YZx+r/KqbqGy5OAiBBmfSMiz1e6C5naYjS+FiStIIYMpOL1LUBfH/mMwFDSB5LzmxicyeCdFapxiKo80z96bDHdHli5W6Zpw9LeUWOjC8rmIYGwKciJ+g2oQOFm53+XIbMyBpU05Iax22EpVctk9jmS3Qud18oY+RzNVblBV4MmcICaRteweibLmuXLh2BGV01FNuAATGhKpiMMo3aV7QVbPJPKTLNUeXZ8wyNgI2y9ZDpfVIChJmgI2VoQ3LhKHs+w7DigzQYoFET9COSSpLazuu6cB6QMhKRJk7DrqyyHJQjMO87fV7M1pOiJ2akkdeNqtNHR3YJQuBV4VcFPb0GsN9M1ASF1ZEoQhnem3a/HADdTnnVSeps9dH6xqFqMlFe09o+PlkntmMruWFv8mEMyrRvWuO6ng2iWCo6p5Q0KrDv1Vvpt6/mIvLtHLPIOeLYt2wub/Jotl5nJnBlZ2W0oC25zH+LC70TbOVFnEGO+ARDRp0a2+mSIAJExGyS70HpyLr9wjC5BNZggTCpoK6YzEdQSMd+znodOL9LPhcPSgl34IlzF4geYvZBKMnDyuRcMqVZlKF9QgOQobacgoi4SxTUo8tEpSSJR3f0LJXXX2pq02AdgCL+igM3wQFbX2gpQ+9l5h4Ghj7N0tAqNeHedZyp0IcxdbOHxzqbUkLRDXyd9iwJCZB6jGC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB4499.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(366004)(39830400003)(136003)(376002)(64756008)(66946007)(66476007)(54906003)(66446008)(316002)(66556008)(76116006)(19627405001)(166002)(110136005)(8936002)(52536014)(71200400001)(8676002)(9686003)(38100700002)(21615005)(107886003)(2906002)(33656002)(7696005)(4326008)(26005)(478600001)(186003)(4744005)(6506007)(55016002)(86362001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?d9uBUo07sY31VuJpckiUwQDdMBsmJSrkwTToLHmXfGfjHZg6WrTdfjkyiB?=
 =?iso-8859-1?Q?SZNGiLCslb35dAb3kzy9bTwidflJip2Cu9qqkLztWPpitxjNxExVC/4TbW?=
 =?iso-8859-1?Q?UHMXklBYWjWGkCZ74rbjZHnQI7M1am+yoDDxK6wi7vPSnWp80blvcM9qL7?=
 =?iso-8859-1?Q?m3TshvG45AF+5LSgQsaffiQxjZbIJNf+bIvwgln2h/BcEVNlEMEpT/ocaY?=
 =?iso-8859-1?Q?iM68VfEGbP+8Js+1bsFPVfxhSa1Ye5xHz85l+givLrauDOJLDNBtpY+S9s?=
 =?iso-8859-1?Q?SjUI90y4qjwzSLJlDTGN6kPc/qaPEsg4QrH7mboGnXiVs9klHXk9T+M+C3?=
 =?iso-8859-1?Q?hww1pIVGPTte4CF25yUqrED4HomxMbR2jGUZn/gqe7Rt5DPVmQkgcWPfzI?=
 =?iso-8859-1?Q?9u0+A12l8Y+/KLVV+GwKkFmaV5RCBU81D5crPiElqCb0c6AxOKy7u+sceb?=
 =?iso-8859-1?Q?rB+7AxPziCmtH4hzl1RL/I8vEWym970yRA2DXyz1vpNiegqHKRnCPg6Fiq?=
 =?iso-8859-1?Q?bqm15LWZ56GSb5uzZD6FG8IDA0llPKD//JH8K1ceseJWGgAmmen74m+1H4?=
 =?iso-8859-1?Q?JEbmSsspmFHAcfdkA6FDUrLZKRKAkXc3luHsrJFqpbh4iuqaIlB751TXcX?=
 =?iso-8859-1?Q?j03m+XJLIAd5mH7v1CcPPhgydBgb98TdB4Nx6IBTO97IS+9DVPnhhNCgMb?=
 =?iso-8859-1?Q?Z+GVDeLMWNzZ0VOFMYJKHg88udIXe82wXJq2nc82pRsuSXYnzQKJCV6vOn?=
 =?iso-8859-1?Q?iWcXzX4ylkGcXA1jw9TUybJYe0JfzopT/PXIcr3agAOOmDVOP3F5cMdBez?=
 =?iso-8859-1?Q?hZDa+hLApDKzYYNKp+Oz/RSbaAtxVf6GJPhC6yOxXku/1I+LgmSnlevbeW?=
 =?iso-8859-1?Q?6wZByTRWCUZ0c4EUSzg11+Kzzw1iuOHfYUaPyfRYLxGhQC3+SJn0MJgCty?=
 =?iso-8859-1?Q?aOpuHIzS4gx/dne+Hy6dt/ezRbFJ3EXv1FpQKhS2+O5U8QKsqBrobnda1r?=
 =?iso-8859-1?Q?scERjUaOCI8MPcxYG+65Od350+4CCMf26aIbte4px32JWmoQSOCW8VQH3T?=
 =?iso-8859-1?Q?y4b0xuw5MjiOJ2X6JDulQjVIAmWWSEmijMAvN7X8QARveSAlW3l+k3WVrz?=
 =?iso-8859-1?Q?ShBKaphQxb4OAWZThSh2k7nFj2LoieIrnw4iEKdoDzMNeG0Lg4uOSHWkj3?=
 =?iso-8859-1?Q?LwJF0viy1NzIBuJSEZIvS5KfIqKNuk84KPimpyJr7oNnhLYUlR4GPOeMQ3?=
 =?iso-8859-1?Q?nia+atYmQh6JBx88SZEOuhpOj4UqyzOC4obCuz/fKxaseSxfwusMZ3GfjS?=
 =?iso-8859-1?Q?ZIdVbs3y0eh8P3Q2sEv5lUExoFAMW178lPkl9spE+EeQ004=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CP2PR80MB44996FA9E3200DD8C70F827DC7709CP2PR80MB4499lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB4499.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8b2d69-319e-488a-0733-08d8fda3ee13
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2021 11:12:58.4218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x5cXdWN7GiXHZBnca4EAhaiekeTNqXPw9/y2sW3Ym/XSkNm1f33IarLrXCwG75vu45KeDVJvWkLgrvijHHKJQnqTZj65bmAXrd1a/7RhcRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB1907
Received-SPF: pass client-ip=40.107.82.98;
 envelope-from=bruno.larsen@eldorado.org.br;
 helo=NAM01-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
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
Cc: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CP2PR80MB44996FA9E3200DD8C70F827DC7709CP2PR80MB4499lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> You will need to fix these style errors.

Yeah, I was using the checkpatch on a manually generated diff, so I could c=
ommit everything with the correct style, but it didn't go over the new file=
, and I forgot to run it after all the commits -.-'

> For future reference, please CC me explicitly on things you'd like me
> to review.  I do scan the qemu-ppc@nongnu.org list, but it makes it
> easier for me to find (and less likely that I'll accidentally overlook it=
) if I'm also CCed directly

Will do! It was just my first time with send-email, I guess I got a bit ner=
vous....


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

________________________________

--_000_CP2PR80MB44996FA9E3200DD8C70F827DC7709CP2PR80MB4499lamp_
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
<font size=3D"2"><span style=3D"font-size:11pt">&gt; You will need to fix t=
hese style errors.</span></font><b><br>
</b></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<b><br>
</b>Yeah, I was using the checkpatch on a manually generated diff, so I cou=
ld commit everything with the correct style, but it didn't go over the new =
file, and I forgot to run it after all the commits -.-'<b><br>
</b></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
&gt; <font size=3D"2"><span style=3D"font-size:11pt">For future reference, =
please CC me explicitly on things you'd like me<br>
&gt; to review.&nbsp; I do scan the qemu-ppc@nongnu.org list, but it makes =
it<br>
&gt; easier for me to find (and less likely that I'll accidentally overlook=
 it) if I'm also CCed directly</span></font><b><br>
</b></div>
<div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Will do! It was just my first time with send-email, I guess I got a bit ner=
vous....<br>
</div>
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
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%;">
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_CP2PR80MB44996FA9E3200DD8C70F827DC7709CP2PR80MB4499lamp_--

