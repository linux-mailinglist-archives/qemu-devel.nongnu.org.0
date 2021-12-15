Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D1B475AA0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 15:27:21 +0100 (CET)
Received: from localhost ([::1]:37398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxVFU-00052U-4W
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 09:27:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1mxPpE-0000hG-76
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 03:39:48 -0500
Received: from mail-eopbgr50110.outbound.protection.outlook.com
 ([40.107.5.110]:4110 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1mxPpA-0005k9-Ra
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 03:39:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYY573MWgouUY34orEszT9HUPXunVSbvNy2OMVD/MBoG63MIDaFPoh9dnpiKoXyjzM4H28EH2QmMERzAQR4ht1pscLkdy0+4DfVnuzWVLALBAZx1SqAkbzbEhjvwbl3nCt/ZOB6LHW9WFaBVAdWPHmM9kTWHEwCWWgMkpUPlaGJcLdnEk9QG6O6m1bH47l2N5YLR1DPMnGLIlFwunXWpCRSUPfmO+0TAURbEPnLHrKxKJc/eqmI26fMFZ/RcPvpktZQK2NyaSxfusigbtc28QGv25MGHmlArIRhKBgGdSAfEiJ7zgMv5kpSVLrHZqdm2B1uL0ROXJW5HdEtEe2WfEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qd+DPjRUizEloCX+f8egiHZWBG9qdAo7ulCPRsbTjoY=;
 b=VtDdwS2R29ZSZUVglMoX/GxGH1itZaC7wFgf9dYlgQKeQQOBxJyzfI0uWMICNG65eViKlXdJX6PB9igwyBS9owyAF0DY9kp38hpOBmkWrezOm+jxHsdzuUxE7tKNbKNdoS7qDTyaebi7wMk09Q/K9NzFQUE5a62sYncpUYH1uoJUqK3GbsCeyLiB+7s0T4elSv149Ns94Tz9opPUImI7xooY4RuOZEEEug5MmHWBh1Ssm7OlpMwB1X3f02R9/slak9L46//MfVAcBAGZQwNsEBJML3I7nA1vykR8sF01/wfOnPXMnSTPHLKROSGo/kqbENsxsyUZfQw7rqzLkFb5mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=neuroblade.ai; dmarc=pass action=none
 header.from=neuroblade.ai; dkim=pass header.d=neuroblade.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NeuroBlade.onmicrosoft.com; s=selector2-NeuroBlade-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qd+DPjRUizEloCX+f8egiHZWBG9qdAo7ulCPRsbTjoY=;
 b=Ppc452+f9/+nuALzFRZ2x+dZgQxhF+hepBnR2Yba5kxUlplTklmrC7SVC9/+LtYAIVH3hj0PlXTZPPhgrxkKsSVl6Vjk5H3P4vediGICwHPshgunGRydDb+tifXmw+aBj6kyPx4OZL/Um5huvc2VNkiMMUluWd6nSLawQgJnTDo=
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com (2603:10a6:102:e0::15)
 by PA4PR09MB4750.eurprd09.prod.outlook.com (2603:10a6:102:ef::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 08:18:53 +0000
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::e5bc:be6b:e872:f996]) by PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::e5bc:be6b:e872:f996%7]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 08:18:53 +0000
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Building QEMU as a shared library
Thread-Topic: Building QEMU as a shared library
Thread-Index: AdfxivDZBdr179rLSragepxByLQioA==
Date: Wed, 15 Dec 2021 08:18:53 +0000
Message-ID: <PA4PR09MB4880FF47C3A6E249E55B80E2EB769@PA4PR09MB4880.eurprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87554690-5c2c-44b8-1d70-08d9bfa38816
x-ms-traffictypediagnostic: PA4PR09MB4750:EE_
x-microsoft-antispam-prvs: <PA4PR09MB4750888D4BB7B9C791F6F18EEB769@PA4PR09MB4750.eurprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lFwCGQVK6ShiejAW4pR/jDV4k29+Ado/tG7aTxQnPcoGIIzFWDRpyB5dbixWiPBNoZAqUuoMaIUo9FsmmpPapJwcskFKgiQuE7VCxigJpP5sMOheRcy8V8IztVz3BvsPemXhJNEL9bB2kdJnkKkIlvDVdA1mbVZVlzi3O8wxwnwfzb5BYCCt7NoV1TIsLID5NBgWBgQbchCm61h3PGK2ic1lsQ4mmlxGQCbEw9bj3YeLOH2z82haXZDFqvDB3S6NM+e5453UHhb+oFwsv8btylUhrsrDsB3HC7NWwuBvssGWF8txHohYOQqqgeg/Hp276dl0IoJY0fvQ7bkN7376HoP2gFl3QU0nfa9BrTwWhKCTnoTGL2Oc9qq2ZSueGY/vrbb+UIQp8ToLr8tLPws5si1SC+2sfSTWjPQVwOhoR3Hfh92pVLVRQEAW32ChGjicfXZxH41zfMFC5J4iPVgE4HcOwtElV5fMSPDHxOhh2wtr2KQwU4Kw4dfGnseu8jFo5RT2jI6Yo56WndQAPPQVG9TKx/EUbUU8hgAz76W1+EYvGTcvv19vrFE9u/86JTtHtQabL5Bbdd6dnGd6WcT8pdVJOkxXxHqSOtWnRmplOFZYx3ujvhlM9FBv4vomcv3qkKrDyWV4VV5YV33OxY0+ua6+COCbt30//LrunCR55OQJoZoGrS7xuViACzka1SqrAANxgbRsRVku4HX9Idr9yl5ClouRQ+BSY9J6thZv6jCeLTBaiRsCy5eloH2LdqBfPVuOx6nUhL4bjWNGxYZNdLmPJkej+LRWkj1X5Ng1AIM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR09MB4880.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(346002)(376002)(39830400003)(396003)(9686003)(4326008)(38070700005)(122000001)(9326002)(38100700002)(8936002)(71200400001)(966005)(33656002)(83380400001)(316002)(54906003)(8676002)(66946007)(508600001)(6506007)(2906002)(55016003)(52536014)(5660300002)(44832011)(166002)(6916009)(186003)(66476007)(7696005)(66446008)(64756008)(66556008)(86362001)(26005)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YRiP2PVeycE5PXxGI6qM8eyWWQg5hcC1fkGCr0C4IB5naoEgWbMm7Is7fIQJ?=
 =?us-ascii?Q?YvhYpePfZ3dgx7eTGX2Y80scoY4EsAvwxT5FWh6J66TVUpDs+UDlakyTR434?=
 =?us-ascii?Q?6Z1cezCsQBpifUMVuouXGPPsBf4YaVdB/22Tpirax9NoDYLqJTB+iNiAQENa?=
 =?us-ascii?Q?dyvpw/bUpa7mRyScZf2zL1DuSc6FhHT0dS8W4vMExAyi12SllGpvOBMx7fn3?=
 =?us-ascii?Q?6Y8XOZyObPTFqBcismsWgKqWKjsN2zvdDmfl/Hf1IzXFWcbSeGfkLcW50ipB?=
 =?us-ascii?Q?ZQo+g4ptKNNKhIX8CI0NvJDHijEM3vMuhq0Glgh1uEca8yg1laLeWM/7RHwt?=
 =?us-ascii?Q?RnCT5qqSKg465fslBMlpPt4FxOnOB4ZvLNAwLnibkkMLOz7eap9tMx/XGRQt?=
 =?us-ascii?Q?f7VyZHPEpUZoT+yqzHTnOn7iq60wFR09FPbrChudqrpBwrvGnTf3B62tkWdm?=
 =?us-ascii?Q?CxuD3FgWMeRvszOr/usfkDR8ZSktJrx+dSGEHQ2Pn6KYDV/+Z8n6kB2DeEIU?=
 =?us-ascii?Q?h8GxkR2Vnxsg4D4E47bVc2Kmn7JLsLsuO3UE/7NrlMqVRAypbUQPAvGY9cH1?=
 =?us-ascii?Q?wcNqwenE4/qZeMjkYSS7OqliVRwPyyFDwHDOsriZ5lzF7kOU+yUiuLl7DYRF?=
 =?us-ascii?Q?zZs1r8FAsFRHSAAxK1wNLQQCjhfOuL1r5NDxARhS11gb2EEu4BXON9B6JTiL?=
 =?us-ascii?Q?kzJqokxjY11FXpMPdJKPe9Y8KtfnXahNpjzWBVomJmmX+NG/oFcA5jffQR2l?=
 =?us-ascii?Q?WostGwPw15tzMi9sHiOb1IpM4wkqpWDjKeEDonF8V2dXgBn/QVCddzZfqj4q?=
 =?us-ascii?Q?c3w11hKqCf6mrh65MdCC3pzAFSQcOKULSr7d08U4hJ5bcP8NAaeXZsIW9Cb1?=
 =?us-ascii?Q?APXhIXdKa6PAXpDC/ZufzJ2/UCzkEuuGYxQfLsA5GlF67zoLNs1UzmWLRqh7?=
 =?us-ascii?Q?Sc8chKOPp60VatqmCiNf9JMa8dKI6zHk43atqrxNrYkT3Atwb1GFFHPTOqzG?=
 =?us-ascii?Q?sigG0kIhG2kambQteOhoSru5Jf1edX5nbGN9VCd1PLN0BoGN+APtb2fhzdnz?=
 =?us-ascii?Q?iPemao3o1RexORgqyVvdtoki/nedTfTX5Kv82f7Ft1812Zv5z24rPy4ClOOF?=
 =?us-ascii?Q?vCBTYG20aWBeBdwieOwjRLVz0bj29MDQM7d4RC/I0u2rWC8DEzMUOrtnETNt?=
 =?us-ascii?Q?qhenmpnvYXbTMnuz+B0lgmUOEyz2J8N3DwMS9DNT5fTsKuZTqCVUDL6qv926?=
 =?us-ascii?Q?ygYs/h+KbOcILW7RUqUeldA3BQFpG8MlD0Aeoe+OWaubgWqueNXW9sugPnEw?=
 =?us-ascii?Q?sSs3fh5IUqmaXxECGZBOUYN91g9fGNBAe4iArYDiQLRGJ5iOmOeqwHMI/KNS?=
 =?us-ascii?Q?m2lg0OFDeDTO2IbtMRXLDYZN0qEfbtlWjXz+YSdxS2aeohIDIJ7wGGf1din1?=
 =?us-ascii?Q?xnkQsmiaAbAb5v0VzD1Jm9LIIYjiQp1pcllbxZgQ9aWopoVASDQ2TSl/H0ar?=
 =?us-ascii?Q?N3zLv7XdyVZiv7nCcGH2MUUFTlTkmAW7FatmccW5bkI9YxLcoZfkIVyElQzY?=
 =?us-ascii?Q?2iNlqa8ZmsVZynWdQ/XjdurDyfwA6lK6xq0gJQwdQFlmIi4ib5g+E7amiffi?=
 =?us-ascii?Q?flN3TeVAVOXAsVOEuCh5I2GhUM1tZrTkcQTHIJB3nBBuZUzMRF1XnSmflt69?=
 =?us-ascii?Q?Yx5kxA=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PA4PR09MB4880FF47C3A6E249E55B80E2EB769PA4PR09MB4880eurp_"
MIME-Version: 1.0
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR09MB4880.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87554690-5c2c-44b8-1d70-08d9bfa38816
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 08:18:53.2066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C4NwEbxaOnx6cYY3T9mPjKTpm3VKJX4e2NstzKyOii8+B1FbvAv2apC6TG1ccWo9gSWZod6VZxH5KyIF00fuauSPt3SrcWGDWVgPu4v4jxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR09MB4750
Received-SPF: pass client-ip=40.107.5.110;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 15 Dec 2021 09:13:25 -0500
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_PA4PR09MB4880FF47C3A6E249E55B80E2EB769PA4PR09MB4880eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Before sending a patch, I would like to check if it's of interest to the co=
mmunity.

My goal is to simulate a mixed architecture system.
Today QEMU strongly assumes that the simulated system is a *single architec=
ture*.
Changing this assumption and supporting mixed architecture in QEMU proved t=
o be
non-trivial and may require significant development effort. Common code suc=
h as
TCG and others explicitly include architecture specific header files, for e=
xample.

A possible solution, discussed on https://stackoverflow.com/q/63229262/6194=
93 is to
separate the simulation to multiple processes (as done by Xilinx) and to us=
e some form
of Interprocess Communication channel between them.
Such solution has several disadvantages:

- Harder to synchronize simulation between processes
- Performance impact of Interprocess Communication
- Harder to debug, profile and maintain

Instead, I would like to suggest a new approach we use at Neuroblade to ach=
ieve this:
Build QEMU as a shared library that can be loaded and used directly in a la=
rger simulation.
Today we build qemu-system-nios2 shared library and load it from qemu-syste=
m-x86_64 in order
to simulate an x86_64 system that also consists of multiple nios2 cores.
In our simulation, two independent "main" functions are running on differen=
t threads, and
simulation synchronization is reduced to synchronizing threads.

To achieve this, I needed to do the following changes in QEMU:

1. Avoid Glib global context. Use a different context (g_main_context_new) =
for each QEMU instance.
2. Change meson.build to build QEMU as a shared library (with PIC enabled f=
or static libraries)
3. Define a C API for the library and export it (with a -Wl,--version-scrip=
t)

These changes seem enough for simulating mixed architecture system on a sin=
gle process.

If this approach sounds useful, I'll be happy to send patches.
I'd appreciate if you could provide your feedback!

Thanks,
Amir


The contents of this email message and any attachments are intended solely =
for the addressee(s) and may contain confidential and/or privileged informa=
tion and may be legally protected from disclosure. If you are not the inten=
ded recipient of this message or their agent, or if this message has been a=
ddressed to you in error, please immediately alert the sender by reply emai=
l and then delete this message and any attachments. If you are not the inte=
nded recipient, you are hereby notified that any use, dissemination, copyin=
g, or storage of this message or its attachments is strictly prohibited.

--_000_PA4PR09MB4880FF47C3A6E249E55B80E2EB769PA4PR09MB4880eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
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
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Before sending a patch, I would like to check if it'=
s of interest to the community.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">My goal is to simulate a mixed architecture system.<=
o:p></o:p></p>
<p class=3D"MsoNormal">Today QEMU strongly assumes that the simulated syste=
m is a *single architecture*.<o:p></o:p></p>
<p class=3D"MsoNormal">Changing this assumption and supporting mixed archit=
ecture in QEMU proved to be
<o:p></o:p></p>
<p class=3D"MsoNormal">non-trivial and may require significant development =
effort. Common code such as
<o:p></o:p></p>
<p class=3D"MsoNormal">TCG and others explicitly include architecture speci=
fic header files, for example.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">A possible solution, discussed on <a href=3D"https:/=
/stackoverflow.com/q/63229262/619493">
https://stackoverflow.com/q/63229262/619493</a> is to <o:p></o:p></p>
<p class=3D"MsoNormal">separate the simulation to multiple processes (as do=
ne by Xilinx) and to use some form<o:p></o:p></p>
<p class=3D"MsoNormal">of Interprocess Communication channel between them.<=
o:p></o:p></p>
<p class=3D"MsoNormal">Such solution has several disadvantages:<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">- Harder to synchronize simulation between processes=
<o:p></o:p></p>
<p class=3D"MsoNormal">- Performance impact of Interprocess Communication<o=
:p></o:p></p>
<p class=3D"MsoNormal">- Harder to debug, profile and maintain<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Instead, I would like to suggest a new approach we u=
se at Neuroblade to achieve this:<o:p></o:p></p>
<p class=3D"MsoNormal">Build QEMU as a shared library that can be loaded an=
d used directly in a larger simulation.<o:p></o:p></p>
<p class=3D"MsoNormal">Today we build qemu-system-nios2 shared library and =
load it from qemu-system-x86_64 in order
<o:p></o:p></p>
<p class=3D"MsoNormal">to simulate an x86_64 system that also consists of m=
ultiple nios2 cores.<o:p></o:p></p>
<p class=3D"MsoNormal">In our simulation, two independent &quot;main&quot; =
functions are running on different threads, and
<o:p></o:p></p>
<p class=3D"MsoNormal">simulation synchronization is reduced to synchronizi=
ng threads.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">To achieve this, I needed to do the following change=
s in QEMU:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">1. Avoid Glib global context. Use a different contex=
t (g_main_context_new) for each QEMU instance.<o:p></o:p></p>
<p class=3D"MsoNormal">2. Change meson.build to build QEMU as a shared libr=
ary (with PIC enabled for static libraries)<o:p></o:p></p>
<p class=3D"MsoNormal">3. Define a C API for the library and export it (wit=
h a -Wl,--version-script)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">These changes seem enough for simulating mixed archi=
tecture system on a single process.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If this approach sounds useful, I'll be happy to sen=
d patches.<o:p></o:p></p>
<p class=3D"MsoNormal">I'd appreciate if you could provide your feedback!<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Amir<o:p></o:p></p>
</div>
<br>
<p style=3D"font-size:8pt; line-height:10pt; font-family: 'Cambria','times =
roman',serif;">
The contents of this email message and any attachments are intended solely =
for the addressee(s) and may contain confidential and/or privileged informa=
tion and may be legally protected from disclosure. If you are not the inten=
ded recipient of this message or
 their agent, or if this message has been addressed to you in error, please=
 immediately alert the sender by reply email and then delete this message a=
nd any attachments. If you are not the intended recipient, you are hereby n=
otified that any use, dissemination,
 copying, or storage of this message or its attachments is strictly prohibi=
ted. </p>
</body>
</html>

--_000_PA4PR09MB4880FF47C3A6E249E55B80E2EB769PA4PR09MB4880eurp_--

