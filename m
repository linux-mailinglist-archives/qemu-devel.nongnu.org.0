Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E1E56AC41
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 21:53:58 +0200 (CEST)
Received: from localhost ([::1]:52892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9XZV-0001Sl-9M
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 15:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Gregg.Allison@lasp.colorado.edu>)
 id 1o9Vxk-0005va-Er; Thu, 07 Jul 2022 14:10:52 -0400
Received: from mail-bn8nam11on2041.outbound.protection.outlook.com
 ([40.107.236.41]:31939 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Gregg.Allison@lasp.colorado.edu>)
 id 1o9Vxh-0002V6-Ox; Thu, 07 Jul 2022 14:10:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqSqCeVdWzH9XIFjKzJDjSWMrVhDUY3N+pF4L2He4xOKl7D6f0dXQ6nLo+h9SISp8JZYaP3P202sYTFxgSMS0CT5M5ak/LonlOREsf82PxjZGbzlncM8dVbf8fv92bnLj9RHedYAlyKCp7lHHV0t4w/zrdzzoT1uAZiqyvnMz2JihVBFJnJCAG05MJSwVVLnUF+cLTZ75XNKzNPFwKuB3fLnhM4izvPwMjsOSfYNhCEitQK5/884kFo67mA+Ko97K2bAywCDhhMUxRHL0M57P+BnLlEHfXV1UrwJLAj4ezNT53fL1Z+TT778MDTuBcTUEFDeNGVyrJCPT/sZ5DWdNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o64K/xFfvThm/aD3rNa8wdXX8Hpc9mNKU+VO9JU0cyI=;
 b=a+zyh2MRL2hFqZrYsOXqogDGpQk+zuUkJHbClaYMKBcX+7AQkV0C+IerH6jYzT4vYl7CKAzXV2n5/ZB+wyRpW3pcDc/6JmsgIPF4du5yzoTU1S1Wao7emGfc/N/Z54QyzXcBr4PqyLe8Nn+XlFomiIdIPmGg7EcdgIqZE2F1qr8Ykeixy80BB9vwQz1nEuL3cGBSyJ+6fg9g7EG66Iqy3sTmI+bGCddrUogN6BUwuGAmC0dHrb6upY8geObE3HWX4qZG6TewIXvwL3uqVHseMCArJ+zXbvtkMvRERNUJCtZ8OX6vd75wFeoKxZ0k/qnnW360vTRA9RSRsF5huJdoaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lasp.colorado.edu; dmarc=pass action=none
 header.from=lasp.colorado.edu; dkim=pass header.d=lasp.colorado.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=laspcolorado.onmicrosoft.com; s=selector1-laspcolorado-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o64K/xFfvThm/aD3rNa8wdXX8Hpc9mNKU+VO9JU0cyI=;
 b=uBTQla/Va3SvMYafXd2NEyDFiEIAlTHemmlgMSKzcBHjlOHNaKqj5alkDVoIEbUUTJWpoxAagX8GEMlZMf5qzEhsh07Cm0UT1uhoKA2FixOZK823lHzrRUSvNKQXIdLFa0EwgMPenJXUgZEpIan7YnsVb30RjfwioIddcjcem7k=
Received: from CY1PR03MB2137.namprd03.prod.outlook.com
 (2a01:111:e400:c616::18) by PH0PR03MB6653.namprd03.prod.outlook.com
 (2603:10b6:510:b7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 18:10:43 +0000
Received: from CY1PR03MB2137.namprd03.prod.outlook.com
 ([fe80::a93b:1a22:89cd:26c9]) by CY1PR03MB2137.namprd03.prod.outlook.com
 ([fe80::a93b:1a22:89cd:26c9%11]) with mapi id 15.20.5395.022; Thu, 7 Jul 2022
 18:10:43 +0000
From: Gregg Allison <Gregg.Allison@lasp.colorado.edu>
To: "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Gregg Allison <Gregg.Allison@lasp.colorado.edu>
Subject: Support for Gaisler multicore LEONx SoCs
Thread-Topic: Support for Gaisler multicore LEONx SoCs
Thread-Index: AdiSLN9FTMiS5FQaTAG/rFjEoaVVLg==
Date: Thu, 7 Jul 2022 18:10:43 +0000
Message-ID: <CY1PR03MB213764AFCA6F51DC5558C1AEB3839@CY1PR03MB2137.namprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lasp.colorado.edu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6eafc7a4-33cb-49c3-11ec-08da604401d1
x-ms-traffictypediagnostic: PH0PR03MB6653:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fjOON+r9LdFAXHWVzbtcmYCRah7y9YJ/kRJDjB0m+9QKYuVX4nsijc+9dSjMz9DjpqSGwnTkxgD9GhiSPG8pEO9eVRu5fUl80I7bEWkD7rujTZ5essOnHxP6lpIObdX9eD4TfKUN1iO1sk/83eJukLXcWGcg4L5rG0KTXto4ZHcGM9+ykOldWD2vqWV/HJH+sLaGzjWXib7vfC2i6b/C1G2KRF0wPff/eTI+gms9bxxttXlB2Z2+FVnu/AcxwdML5SkQauw3wlBBG/Q9u0dDx0Y4iyQ6mYemrZWltIVTV1JKDmsI+ktEYNTI2H1hyLnx0n2GGGHBFTW6I6m13R4fi0h4WiHoFNVmvuHxTx4xPOOv384aVQla8yWHzjgEqjBeEHycFfiIZC2hH6flQzsQBrqlddIzgnAIqH0MHa0fGaPeI1Vl9nlBq+Mrm4wuLmsMTch9jCLumcU4bCAWC0F3tXbw63PtbeVugl5Nr8uNoXPjWI2f8eU0T9Fa5TGJjmuBIPbPFC3crV6R05/V/EQgWrko76PirZEc5Ir4umNjrb9SP+xcYmBDgpGIcKHH6VTM20pn8T2xb8qgjBXfm6BFwdA8l8/mONC/rk1teQiKe7TR6YxR2clP1lvVOb/5/Ob+PqezoaTntYP3UlaLGX4fpF2vjp57rXXBWysp2W7Z4UuRRibrG+LQY2vgCASKSDnwqFT5JeuysRdMrGPNqSCesxhGTTNVceFlTW0S942pO/ectXisaZtlAWn6An/5CDKt8rGRHi7HD54VMaJR/mq8FbJjJyGrLgH3iTwsAbsQBM8BNbm8XIu/SQQJCVBdJ5PJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY1PR03MB2137.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(6029001)(4636009)(39850400004)(396003)(346002)(376002)(366004)(136003)(7696005)(6506007)(9686003)(26005)(8936002)(186003)(4326008)(66446008)(41300700001)(71200400001)(107886003)(66946007)(66556008)(64756008)(8676002)(316002)(786003)(76116006)(450100002)(66476007)(52536014)(110136005)(5660300002)(4744005)(2906002)(41320700001)(38070700005)(55016003)(38100700002)(478600001)(99936003)(86362001)(122000001)(40140700001)(33656002)(75432002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hYw8eQBvjyNDoqaun55ANO5NgN4ezGcAm9jyw2Yrpbeqb/nqvObi5NoavCFD?=
 =?us-ascii?Q?N3yksBk91Bf+VETf2TWO8pGvASLBmRWPjcphbffIeFes9+yx9OGEKweXoet+?=
 =?us-ascii?Q?Dq0xMwoj58Hf64+ebYtIUha3l0yvE+pg8IjOliTM1wt07WSeQdl3t2XCZ3W5?=
 =?us-ascii?Q?AB9N4S5upWR029HbiFzrmVoBqDxEsxryST43N5SeFb9e2r15FixDrJfBxCW2?=
 =?us-ascii?Q?N49ywtssRUibx2lz6mSZIBc6KwCE2hO6sLBZo80tfq4baAAPXW0w8wzdGnEl?=
 =?us-ascii?Q?cwwjVKxvfWLzDLaIxiAAxZ5Me5aGg/JP9FRwHDfUcHG4Jo4RUuK2U8+TukHd?=
 =?us-ascii?Q?LZmQ6XPmxMrBu6htbDNMSpvTrTOh5QryfsIKtsA65B6Ucua2YZEUzURlSb1Y?=
 =?us-ascii?Q?gPVAuaNLiQOtYEEf13k1YTtniA9Jc2wGY9AmOuAezTVnBjCHYk/IKXYICX6B?=
 =?us-ascii?Q?Xpda8Dj6u63mWJe4OffxcuTDpYNxa56zsD6y0UaxUx6rDQPzsKIQZu/uVOoj?=
 =?us-ascii?Q?GV/HpVlk/ZHLiDUHtrzRCzuUoGGh57yZ4W73V5eXQe5JZR0W0MUQW7F9kJS2?=
 =?us-ascii?Q?SHv1YZzPOdaEpXJ+RrdG+AhVS9rnwU9Z13mCc1nMWJHEGs45UwO7WrcGzFj0?=
 =?us-ascii?Q?7bqQ83GPusZ7jycgUOP3UBlhypo0amVz83o0rMQoNl8OeMLqe8uDUifZE7GX?=
 =?us-ascii?Q?dLpEZ0+G79CrxS87KbWWWpvrhhtkmLPXHHdz5iLUp+J07j316g4kruyunO+Z?=
 =?us-ascii?Q?7gZlsD625jSXabhaudFk3INuix9RFbD0TY2/NxkV3f73Zn/Xs3lnEjUHNQ0i?=
 =?us-ascii?Q?PQ20d9tbEjRTteQb/sFVBb8/jx4rxvgwNfjrBDeTXHGXORf7K0ITLw/ccl6p?=
 =?us-ascii?Q?u6VKRRAeHxogHzQNmR2DvUtrF9/cUm/ULomlbtwzAiYycE/bde0Zxtf+1wC6?=
 =?us-ascii?Q?l7+7VDVJjxRX+j33uQrWI44wl/6W2JnoLiMjBZ4n7ESbB88bYol1XUxx0R2B?=
 =?us-ascii?Q?cVSOnh6XYPLkVE9v297ptfnE7W4743Gn6uNv4mTGCTWeh3ptGm4bXJbr5E5x?=
 =?us-ascii?Q?3lt90uR99AJOYhE0dN8AQLOt04OK4/+JBFtT+urpGfRWq+Aig/hpIxhGxLXN?=
 =?us-ascii?Q?Qg6Ypmldb3qSa9eXD5C3nYgNIUWaEDoQz02JP1D0taqJbmlmXIED0mkrhAk3?=
 =?us-ascii?Q?99g0v6z+s7nhf/zM5/bBB4XzdL2Wy6zUinrg305/6N+vpEZ9RQVtZCbi7r08?=
 =?us-ascii?Q?sVqrH9MV2zIMkMOTqRT1ov5TabVpTBuH36NqhI1zyzYFjufK1tX2+NeGd7yF?=
 =?us-ascii?Q?gY7RpFmwGWqzzeeWLyyLUzTFE4cLtk2IGbLkXBuR7C4SLXD39zVM/6Kt/X5f?=
 =?us-ascii?Q?tbveg2PBbhKGX3ihggRR2OZBt2Nn6XPUmWU8Wxrl4QHAaeyUviHlBR8eljA6?=
 =?us-ascii?Q?VqJsB/Rimn6/9dMesHkpY4lIN1Dp5IBxdEiU7zsoVJydT9CPtCDBnX3JMaie?=
 =?us-ascii?Q?xvmMqeBRlTiPouPIjQ8LzXp9jdIs3UPLFPkE4G8qXwrYzmOFVNuvuoJCdNhi?=
 =?us-ascii?Q?qYrkunBb+OJkEoln2k8MQ0bZCO4OsfX+admhr+ejZLPxpajj8M8CMsNqaQiL?=
 =?us-ascii?Q?TA=3D=3D?=
Content-Type: multipart/related;
 boundary="_004_CY1PR03MB213764AFCA6F51DC5558C1AEB3839CY1PR03MB2137namp_";
 type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: lasp.colorado.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY1PR03MB2137.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eafc7a4-33cb-49c3-11ec-08da604401d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 18:10:43.0711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b1ddd783-1dbc-446b-878f-a7b03478ea9e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mM4IRa8I2+7XTrqyuiE2X5lWqbF6rOR1xPymlPZyey6dnBi+jby5PBzLYn9F73q7FOuHY77rJ4kj2y08UGXv8e49d7M5cZPE5AWoF28Tz4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6653
Received-SPF: pass client-ip=40.107.236.41;
 envelope-from=Gregg.Allison@lasp.colorado.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 07 Jul 2022 15:51:50 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_004_CY1PR03MB213764AFCA6F51DC5558C1AEB3839CY1PR03MB2137namp_
Content-Type: multipart/alternative;
	boundary="_000_CY1PR03MB213764AFCA6F51DC5558C1AEB3839CY1PR03MB2137namp_"

--_000_CY1PR03MB213764AFCA6F51DC5558C1AEB3839CY1PR03MB2137namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We are considering the Gaisler GR712RC (2 core LEON3) and GR740 (4 core LEO=
N4) SoCs for a new deep space mission.
Does QEMU support these two multicore configurations at present? Is there a=
n effort planned to provide multicore LEONx emulation?

Gregg Allison

[signature_1890048335]
Senior Professional Research Assistant
Flight Software Engineering Department
Laboratory for Atmospheric and Space Physics
University of Colorado Boulder
1234 Innovation Drive
Boulder CO 80303
303-735-0500 (o)
303-435-7491 (c)
gregg.allison@lasp.colorado.edu<mailto:gregg.allison@lasp.colorado.edu>


--_000_CY1PR03MB213764AFCA6F51DC5558C1AEB3839CY1PR03MB2137namp_
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
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">We are considering the Gaisler GR712RC (2 core LEON3=
) and GR740 (4 core LEON4) SoCs for a new deep space mission.<o:p></o:p></p=
>
<p class=3D"MsoNormal">Does QEMU support these two multicore configurations=
 at present? Is there an effort planned to provide multicore LEONx emulatio=
n?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:12.0pt;font-family:Conso=
las">Gregg Allison<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif"><br>
</span><span style=3D"font-family:&quot;Tahoma&quot;,sans-serif;color:#1919=
19"><img width=3D"149" height=3D"33" style=3D"width:1.552in;height:.3437in"=
 id=3D"Picture_x0020_1" src=3D"cid:image001.png@01D891FA.94BB8B40" alt=3D"s=
ignature_1890048335"></span><span style=3D"font-family:Consolas"><o:p></o:p=
></span></p>
<p class=3D"MsoNormal">Senior Professional Research Assistant<o:p></o:p></p=
>
<p class=3D"MsoNormal">Flight Software Engineering Department<o:p></o:p></p=
>
<p class=3D"MsoNormal">Laboratory for Atmospheric and Space&nbsp;Physics<br=
>
University of Colorado Boulder<o:p></o:p></p>
<p class=3D"MsoNormal">1234 Innovation Drive<o:p></o:p></p>
<p class=3D"MsoNormal">Boulder CO 80303<br>
303-735-0500 (o)<br>
303-435-7491 (c)<br>
<u><span style=3D"color:#0563C1"><a href=3D"mailto:gregg.allison@lasp.color=
ado.edu">gregg.allison@lasp.colorado.edu</a></span></u><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_CY1PR03MB213764AFCA6F51DC5558C1AEB3839CY1PR03MB2137namp_--

--_004_CY1PR03MB213764AFCA6F51DC5558C1AEB3839CY1PR03MB2137namp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=9000;
	creation-date="Thu, 07 Jul 2022 18:10:42 GMT";
	modification-date="Thu, 07 Jul 2022 18:10:42 GMT"
Content-ID: <image001.png@01D891FA.94BB8B40>
Content-Transfer-Encoding: base64

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

--_004_CY1PR03MB213764AFCA6F51DC5558C1AEB3839CY1PR03MB2137namp_--

