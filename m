Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB6D354506
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 18:17:00 +0200 (CEST)
Received: from localhost ([::1]:58382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTRuN-0005qg-3i
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 12:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lTPL8-0004El-Fx; Mon, 05 Apr 2021 09:32:26 -0400
Received: from mail-eopbgr770129.outbound.protection.outlook.com
 ([40.107.77.129]:24325 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lTPL5-00080o-Or; Mon, 05 Apr 2021 09:32:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6Hrup2l7pbz/XrG8TgA8bTLjHRO58o6TL9HMHkjnIwD6QO2dievnoaZacojPEGsJNG9bLFfGdYNf8kE6R6cFFaAe3w92ITSXvjvpeDBvnvJgYLlhcXrxfGWapPG34TJJx97eHfeEMFx7lvAmreADs2oYyCFFGjJQjERJw5yvFIGQzn7zuAggXICcjAxIS2/3+yhq7dTNCSgwIIjhfps78uC0e7/MaM4tVmAgTCDe3eu88o9iZshy/03OXZFpzKO7DWD4daRR7WjpjM6lKo3nw49HergeGMzSSy9iR+ParvyYrt/cLR0ZsG2Lp5X2nDn/6VWKmqD5S+B5JpenSIkgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5eErhwBIPi5wabJhzXuoGCDvulFQujMjoInSTXaoMk=;
 b=IKqg/089VuffSsi9JhTUCq/V1gGg2/oWH5UlbUtznCaWO7fMYaVglROHKuDopgqyUK9QCq3cK93CC1HZEN0KLC+Oq4PVH2NF+xTlqM0pt9DvdwOgLJ8rOjNraGkpF7l/nnNRFY6dTsqPMMiChC/Y8dndmWZqpN2tFFHEiD/ru+B7IsnUGrPG3cMTLaZFW4kka/g++BWJG1TGucuQFlNk3eSPRP9Dv+OcOT+rXVHCNQvfYjU4BnfBlV2sf4pyf75qDKfQc+F+6CxIi/lr3PKPutz96e/MDOJmB6USAGk4qCdqHi9qclW+6OotjfBPSfUIfBKE+OJr1L1YMXtTzUUX/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5eErhwBIPi5wabJhzXuoGCDvulFQujMjoInSTXaoMk=;
 b=VZIbGjyaxIo/n1tfzUQPVpOiwAUjXa5AB4r3z89s0vI5jA8LGUeBMwoEJcI1+u0jphfXA+mXwgdB29dmcjJWCvWtiz/Mp9v6YJP2wzCWEpw7XFtUCzvaZkjgfm7EhpyCUzTs0uowpXPFDPUbOs/sHEOITMpiXcMsao2qCA5Sk/g07jisWBtlpUUkNE3NyGpX/iKl84ywOOqwohk9wX7GH1vZ7fJ9cb6T+kQb9VslYTV6uAP3H6fyX/ZDbG+PqsooYZKUXcCzLRjYmk8iEdKYPoOLwk1xmMSh1aO58fqiOD6dN+bZCBaWYTHwWtByvZTG0J3Y13S+ttxIwEgmBrkktw==
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com (2603:10d6:102:45::19)
 by CP0PR80MB5313.lamprd80.prod.outlook.com (2603:10d6:103:55::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Mon, 5 Apr
 2021 13:32:18 +0000
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::aca2:c55e:bb3f:5a3b]) by CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::aca2:c55e:bb3f:5a3b%3]) with mapi id 15.20.3999.032; Mon, 5 Apr 2021
 13:32:18 +0000
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
To: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
Subject: Discussion: Patch series that adds disable-tcg option for ppc targets
Thread-Topic: Discussion: Patch series that adds disable-tcg option for ppc
 targets
Thread-Index: AQHXKhS87ihStEYHxEOPEr3le9CIRw==
Date: Mon, 5 Apr 2021 13:32:18 +0000
Message-ID: <CP2PR80MB44990766F1D104E630ADFDDAC7779@CP2PR80MB4499.lamprd80.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none; nongnu.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [201.82.34.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ccd3dfb3-01f6-4f37-d886-08d8f8373bea
x-ms-traffictypediagnostic: CP0PR80MB5313:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP0PR80MB53138107D95E710FAF01D810C7779@CP0PR80MB5313.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L10uQyzDHuPYbDv/SDGCD+zqqhBEwP+vGe3YaaFf7Gn4yYCdQviVjoP1wfmqYc2jolz9ZxcXj/3Ta/uoPNWENvSUxHGca3d9McFt97tTJOL7flSSo6E+B4KI1T91d8EEylVJbkjJX8kScm6igHik+QenVeEEsWvUTCkN0Z/xifPjlEgOOnamj1+MZE55ooikun8m5i1flz5NcQGFo+IwQvpX960R9HUBdk55bmAIaZkf4Y0ley0uSa44q8SYDwOGWagL3+f6TdsgxGW6sYR/8MxvQz1t73ZA6zmB+mH2sUQ/IvBzFOI03GrhIZyVp2uyiPPxS3ghI+9b9vMTNyiHD12RhGmCdnb6cKTCpiLvp0Hk1PCqoEL8VwKpB3wCzOHtqJv85F5PlPzhJRSjSU6mdKnoNr0+YROoRiFuWlz8T6FNuxngZwsjR5N63jFDdg9ashAfLODukHf7OFS4xbu6QDWtvSNpxlcZqhbZGc0xcaUyfznSfRbUFsjFOp/Hl6+m7v19BAHicFOokBlcQUSHuek777eRYTuXKe7lCmtmIRYYWDF65O6LhdrUEdpNbAJqouyIe2PkXBotro+7S7fDbi7CqwaURp6ccm0MLMRbYdVx4lPZZS90gELj1/F6/l77mtVRUR8YJs2lIGT68iZ5ccvHZ9zvTcov5z84poi8Bb4xiZVNq5UFUDiUjGzbqTC2p0zr+SCeEicLYrjiA4BcdzmAGcAuapONXAG5WcqPSlz+QGkHvGc5Yicz4zKrkcDn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB4499.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39840400004)(396003)(136003)(366004)(376002)(66446008)(6916009)(54906003)(19627405001)(64756008)(83380400001)(66556008)(52536014)(4326008)(66476007)(8676002)(76116006)(5660300002)(166002)(55016002)(107886003)(66946007)(86362001)(8936002)(71200400001)(9686003)(186003)(7696005)(2906002)(316002)(6506007)(21615005)(478600001)(33656002)(26005)(38100700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?dfhWoetref4QBX4BYLN1b7ixotdZOvnrDGvXVBOSsejXckEabW3QhXUOaj?=
 =?iso-8859-1?Q?8TJmbjOBx6hqOrCr1vX/BUCblFsktPr+mjnTSpJe2pbc7YePH18qWfpuYS?=
 =?iso-8859-1?Q?zSI4D/XkiuclKHuy63/X867LLHOMzWJT6Z016ls1YYEBAY/JOVWJ1V1lCx?=
 =?iso-8859-1?Q?eJLK7eZBN4yK3Yby1/qjY7gJN6wYtiPH3UcvPm/zsf03mv233aKfSqkt4k?=
 =?iso-8859-1?Q?6Mg/zIgF0vGL7Ax4TybzpNpEeSxWLmOl8NlWdi8oJJh3jprHAzfOoN7u12?=
 =?iso-8859-1?Q?kMM4kMD7aeQSt9szXOOP72o8jrZoHXWQbX7G5uCdVbF4bnueFVTE4Gwlcb?=
 =?iso-8859-1?Q?JyUbRASXHp693CXjqenX6oOPY3P4fyyuaIwWHVoTUtELfBH9KXDeNebDXY?=
 =?iso-8859-1?Q?lL/5W4dT+6QoFgCO2E6Dv0KB5rkH4PACh2Oa5KW0ZBiXP74q/+Em1I3m9Q?=
 =?iso-8859-1?Q?TXwNPxyNx++z7Agl8JN5QtlVpwVNXFdvjTBr9nQotN8g6t43gB0i16f+dX?=
 =?iso-8859-1?Q?Ro/QMM3q+pMTJFChdmnMDMr2Lc4gu+96yQvSnaCQEN7D0BZs1F+j7Kg2+N?=
 =?iso-8859-1?Q?SC0Suqq+uuKLjh41zpXCs5kwh4dENyNyJujJc+mP6QH0dTZu77z6NWWbh8?=
 =?iso-8859-1?Q?aV/rX/2PzVbpYQNfnlqekEFmAUiwL57Vx+WDAVmt7Aq8U+BPuTV56VJcwO?=
 =?iso-8859-1?Q?39ilKJc2558AcPbICvIFelyOt9DLDJYWQ0K8sSHg9eyJfZv2kHUG9k8K49?=
 =?iso-8859-1?Q?i0/HrB9BWTiJjIRRi+CLJTEtiJZAgtI5HaY/QhDs2nLB382P0SJ1p+Ioox?=
 =?iso-8859-1?Q?7/un6FsvWRl5u1yJs5BsNdYfcP/MktE5+g3AOXvGm6oJoDai73ygW1GNzL?=
 =?iso-8859-1?Q?r2WvMQCjNrA1ABz/sU2ajIrUrGYz6PmbiQoNI+y9QeNHKgRpvhTD88zPxh?=
 =?iso-8859-1?Q?+evj9fcjJdlh/K5MUp0Ts0MvuVpotwTcf5MV0WnwgVPCGcuQQ0S/p9jTxg?=
 =?iso-8859-1?Q?2iS2JzDizdUeN93PYr/CdoVb1P4iAOFovcKRQ6S+C8t66Jl53Vuk6GBRzW?=
 =?iso-8859-1?Q?S5zHMRqBEUOKT6UlEEppm30guozK8FZRhEhqP/XjpvEU41APnsJ2PSGD7L?=
 =?iso-8859-1?Q?8BDDJFQHMsVN13v23TnJ1aGDRXK7+rKr4wRPJNap3NgsRrM95VvLryxxDu?=
 =?iso-8859-1?Q?AAWQ/YOTQsu1h5CvnRZqWbDoKs/FtgUnfgHwDlFBKsWIAv+xnWYH3QSbcH?=
 =?iso-8859-1?Q?IICnD5ExP2PxckQ6inMIfCNgVaMetmYrP8clR7o3YS1eE0y2TwJpbzJK1r?=
 =?iso-8859-1?Q?AKLjck/zbPVGcBISV73pEm/qWwirPXQ4hEdp4Y8uSTuBTv4=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CP2PR80MB44990766F1D104E630ADFDDAC7779CP2PR80MB4499lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB4499.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd3dfb3-01f6-4f37-d886-08d8f8373bea
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2021 13:32:18.2742 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sfApSf7X4lBR/uQfQoqjHvfaserVNsWWoOydARFJRCyUw2V0mEdGwtzQjeGFcaJh11+1qlLV6Hw5syz1fm53ykFh+LEa5oE6rsa4CtLBoRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB5313
Received-SPF: pass client-ip=40.107.77.129;
 envelope-from=bruno.larsen@eldorado.org.br;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_KAM_HTML_FONT_INVALID=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 05 Apr 2021 12:13:51 -0400
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CP2PR80MB44990766F1D104E630ADFDDAC7779CP2PR80MB4499lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

The team I'm working on started to work on adding support for building the =
ppc target with the disable-tcg option. However, we're not quite sure on wh=
ere to start with such a big patch.

    * Should we focus first on changing the .c files, so that it will build=
 when we finally patch the meson.build everything build correctly? Or shoul=
d we start by changing the meson file, so that everyone agrees that the exc=
luded files can indeed be excluded?
    * Should we first finish the whole series to then mail it, or should we=
 send one file at a time, as soon as we have them ready?

So far we're thinking we'll need to:
    * change 6 files (arch_dump.c, machine.c, mmu-hash32.c, mmu-hash64.c, m=
mu-radix64.c and meson.build);
    * exclude 8 files from the build (dfp_helper.c, excp_helper.c, fpu_help=
er.c, int_helper.c, mem_helper.c, misc_helper.c, translate.c, timebase_help=
er.c);
    * create a new one that holds stubs.
Does this sound about right? This is mostly guesswork based on how x86, s39=
0x and ARM are doing it.

Thank in advance


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

--_000_CP2PR80MB44990766F1D104E630ADFDDAC7779CP2PR80MB4499lamp_
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
Hi all,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
The team I'm working on started to work on adding support for building the =
ppc target with the disable-tcg option. However, we're not quite sure on wh=
ere to start with such a big patch.
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
&nbsp;&nbsp;&nbsp; * Should we focus first on changing the .c files, so tha=
t it will build when we finally patch the meson.build everything build corr=
ectly? Or should we start by changing the meson file, so that everyone agre=
es that the excluded files can indeed be excluded?</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
&nbsp;&nbsp;&nbsp; * Should we first finish the whole series to then mail i=
t, or should we send one file at a time, as soon as we have them ready?</di=
v>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
So far we're thinking we'll need to:</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
&nbsp;&nbsp;&nbsp; * change 6 files (arch_dump.c, machine.c, mmu-hash32.c, =
mmu-hash64.c, mmu-radix64.c and meson.build);
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
&nbsp;&nbsp;&nbsp; * exclude 8 files from the build (dfp_helper.c, excp_hel=
per.c, fpu_helper.c, int_helper.c, mem_helper.c, misc_helper.c, translate.c=
, timebase_helper.c);</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
&nbsp;&nbsp;&nbsp; * create a new one that holds stubs. <br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Does this sound about right? This is mostly guesswork based on how x86, s39=
0x and ARM are doing it.<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Thank in advance</div>
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

--_000_CP2PR80MB44990766F1D104E630ADFDDAC7779CP2PR80MB4499lamp_--

