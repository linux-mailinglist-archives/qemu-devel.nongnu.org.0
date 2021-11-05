Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 158404465A7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 16:24:20 +0100 (CET)
Received: from localhost ([::1]:38522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj14k-000127-Oi
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 11:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.house@dese.com>)
 id 1mj0D7-0002TC-JE
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 10:28:53 -0400
Received: from mail-bl2gcc02on2073.outbound.protection.outlook.com
 ([40.107.89.73]:2262 helo=GCC02-BL0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.house@dese.com>)
 id 1mj0D4-0002Ah-HQ
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 10:28:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdwuKdbzPNfWla7/JzO29Dmz7EI5/OUsIaiRe4iOv5Kusd0TCeRtPuoyKJxdY6Jr9wgM7diMtNFP9kIUcQgyqrXbYriVvPIbhw6TJ9J5qznlgjMPz9wKD8lz/sCG1CectX/TycsM2501Adf5kR8xVJMwmTVcckR7wFFcxmz86xB9GrjjAx9pL4/2q5oIuHi0Oc7kBXt+HnjbuGKQH814SQxG+R5zXUXzl4r+1ipAD6N/wn//UBm/n+g72onfEKBBhDsVSz21PnBoy7rywijo6f2jyjsIN18N2XoXN5649Q03F1D6tJmw1F4NUgE7SNxy2QYo2dL1UvWQo10W2Bm/Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/MDKoxPGdjtDdvx0bUH4WxTTfdweBL+GKjoMELPSNA=;
 b=WPQBkk5O0iDdaIX3nQ+oTX3sI+Nx8pO6IGj2KEaTOT1Crr5uujAlqWcwcR7GfnCMA82fbGY8Few913c5Y0Q/FTx9SI1kzdyMwP/ZoXdvVlld4zpTYYsJs8lYoX61hBPb7X/ld6W6KjJaOTKkSrAsd1WC9r8YNCH5fpDrNTslQZx8ac8d17hcAU0JUeASdZPWOllA/zhP2jLsvFDIxo2GWJ1Ejn8B9IWiPnp4PznlJ4Aj0x6ZAN5PbBquXhedjD5bjLdEbczTKYX6L330F0UouQa0CUNjTvB2RQ3pQepTWi+XuUIpwb9uBjVkzXQpPBuBu9cdFZUUozV030rtA+eD0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dese.com; dmarc=pass action=none header.from=dese.com;
 dkim=pass header.d=dese.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=desegov.onmicrosoft.com; s=selector1-desegov-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/MDKoxPGdjtDdvx0bUH4WxTTfdweBL+GKjoMELPSNA=;
 b=H3ubgbVQERfGBVwoOdv4cri1l5nRaFq1Fer3k77e90tlZJC7PpI9c/In7soqmkmzP8i2KnXGvJ1S+0WtCDKyZlCkFujVVDd0MHKDtl5v07a5HDtoM/9OrkPXfCugIRvnp6x55YKIvLqEOicfWtPQoMmj1R33KTqMm1xRBPEjZo4=
Received: from SJ0PR09MB6032.namprd09.prod.outlook.com (2603:10b6:a03:26c::20)
 by SJ0PR09MB7357.namprd09.prod.outlook.com (2603:10b6:a03:267::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 14:23:43 +0000
Received: from SJ0PR09MB6032.namprd09.prod.outlook.com
 ([fe80::394b:5b7f:59e5:16c9]) by SJ0PR09MB6032.namprd09.prod.outlook.com
 ([fe80::394b:5b7f:59e5:16c9%3]) with mapi id 15.20.4669.013; Fri, 5 Nov 2021
 14:23:43 +0000
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Pre-built binaries
Thread-Topic: Pre-built binaries
Thread-Index: AdfSUHTJGYstozX3S4GKDt8GsvCMfA==
Date: Fri, 5 Nov 2021 14:23:43 +0000
Message-ID: <SJ0PR09MB6032CFAA829AA63AF31947048F8E9@SJ0PR09MB6032.namprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a5ae83bf-5173-442f-899b-ca1b50b823cd_Enabled=true;
 MSIP_Label_a5ae83bf-5173-442f-899b-ca1b50b823cd_SetDate=2021-11-05T14:23:43Z; 
 MSIP_Label_a5ae83bf-5173-442f-899b-ca1b50b823cd_Method=Privileged;
 MSIP_Label_a5ae83bf-5173-442f-899b-ca1b50b823cd_Name=No Classification;
 MSIP_Label_a5ae83bf-5173-442f-899b-ca1b50b823cd_SiteId=81349428-f52e-4686-aac8-448974b80e31;
 MSIP_Label_a5ae83bf-5173-442f-899b-ca1b50b823cd_ActionId=29961009-27be-4de1-91d0-696648f22255;
 MSIP_Label_a5ae83bf-5173-442f-899b-ca1b50b823cd_ContentBits=0
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=dese.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4eb249c0-5bd6-46b6-75fd-08d9a067df51
x-ms-traffictypediagnostic: SJ0PR09MB7357:
x-microsoft-antispam-prvs: <SJ0PR09MB73570C8DF6CFD44554F63B628F8E9@SJ0PR09MB7357.namprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mNj9S1Of7z+X6c98xNJVuUqnSSgC59lELGFjI1OKmhZSfKZzuNl/WEvuCYgGpNwpMkJzaLWTadDed5oyAt8RrV1dfbpsUAx3xVuBASnSdO+M90zZH6FomOAtNdSNMlDrXQJVLuUyOBYoRRDR26THafMfd7TB/mKIjl9odzPMeE+bU2++67ckiXkHkFpa1u1Ekn2oC7EC3o59kBU306/zJk+iH4faJG6KXG/CpxRdQq7ZkRO1P5AdxN5kEZpxitanCDytRVj18xwHQYU13r3tF6MNzO2Mlkzh/a3j3QjhiKxBoEqv2TiwD2e5HcMsLarKoHcI9eaOqSgMWLRHYUYUt2Q/O+kuCw2tRp6v36P4HsC3TzqlUcsFtrRPM6cq2tB4EW/kznACxGmOfBvvHiBKJacIZk6NR/HgZOC5k7zbeT6JA+8MIZOCgA0JdjDI2Y6hce0LoqglsRnTxefAFzJptgFLZz6cTOL6Viee3ty9DQ4YQJcSk32jFtx82UULuVKmmsBvlDFKwZ+Tvf+w5Fa8wRdpaiz1gICs21pI/0yRetdr3Pih5LOaoZVQN1QMXJtd1PCLI9oU4MUJXC5Y9FGG7mxQPVemOBpYfY1qGfUFVEiZi2Gcwb7h6HE26x0ZaAywU8gzbATRbYpk6ES9fXFmlpxeScIFId5IZXUFDQnlEHWa07C6zc70Ro8Br/8Kw6hDe70Hlg8sUnAFJEWbtihMiw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR09MB6032.namprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39840400004)(376002)(346002)(396003)(558084003)(66476007)(71200400001)(186003)(66446008)(66946007)(40140700001)(5660300002)(64756008)(2906002)(9326002)(316002)(66556008)(38070700005)(8676002)(8936002)(76116006)(33656002)(6916009)(55016002)(122000001)(52536014)(26005)(38100700002)(7696005)(508600001)(3480700007)(9686003)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xxvczJGO9H+pYDHYabSgWsYdsnwioA3Tg6TBzf4tB7BjhnIX3oiwQqIks7Lx?=
 =?us-ascii?Q?vImbc+WFb1WrpWu4mDqu6rdsBTJWvnOz2+4j5u9zXZkyxZgx62WjA0rkbZrw?=
 =?us-ascii?Q?kH9mOtB0BZ6HUWqitItNKa0/ShLZ3hqDHm1xzl0SIukBUv/ZX8Roat6j0mtz?=
 =?us-ascii?Q?htr1XS9SNcMVFBsyXsCVAS0DkkZW1rKVO/CFPy8teHefc1ioQpjHkcd0wZvo?=
 =?us-ascii?Q?TPuIOY5TOSEnjjFaHvTrRNUwk4m10u+FS1t8P7QCkiWqfJ34qhuptwJnl5pG?=
 =?us-ascii?Q?cx1VYXFwhw8tH7bh/KxtNvMuozRu4qFnKnRnj93Uwp3iJYdBUhDJW42Ze6jZ?=
 =?us-ascii?Q?AIyUkcwKavl6A/wOidP+NChrEBcOUZ+ahBKIsPvC1fFdqFmVnoHfgAh4hyLm?=
 =?us-ascii?Q?JeFfGftHyY6Oh1Axyh7g1RZzJfcf1gZc73pUFXxu3PE9qgbLdUdJWaL6jd3W?=
 =?us-ascii?Q?9klIturF6lujZ+0jdD/2En+Ykfj5sf9JvV4GNkJWIdhlK4qLe9EEdKnPQb/Y?=
 =?us-ascii?Q?VyLH2z6EhXi33z5gc6oUXcNqPXQpsl9M1GenZRdgir3O80M694wZoTaJJlLb?=
 =?us-ascii?Q?dvVkErAsSAiBq9mF/7hnbU0jpD847EW7/zN3q/za5PO84Dm0GYTB9saf0KIw?=
 =?us-ascii?Q?F2LnPjYKGQ98qmsRNupIjB6T57u9oLjctX70aYl5FdA1BZSVvhrmcMmVGuel?=
 =?us-ascii?Q?3Gb1BvlvtK1Vf++M1Enw7l/lPaCyZUc6bH0/rxmj/AZycy7F3SZFnkhv2/WF?=
 =?us-ascii?Q?ks+b6G5//YChEPoJ8rkM24MhCuM1gyhN0TBCBuUMQJy5RTE2e2cQdq5vi9Hn?=
 =?us-ascii?Q?47k1nHY6WXvu6V0M7u1dmjJtal/8Ew+RDpl8fymqWB0rmjjplxfKfxYugZtn?=
 =?us-ascii?Q?H2+QfnPzid4gPYJtbvKJRn1wQyMlbciAD1I6zQGVmCMhDHY/X9P0NGn1tUsg?=
 =?us-ascii?Q?iHkQhJO3ZhgLGNpc/lak3uDWFfMGO/l/nwP5FRUpliGTIF9Lzr9E2bcH5lzM?=
 =?us-ascii?Q?2J5TLschtUZtJCut0Ft45ZKZDTcruvIDgevOj/Ip8/0PbZbv4XimehjMTt7h?=
 =?us-ascii?Q?7uJaRBQdTvEIeaDdCsPFco8YcuuDP5VsWEm7D5CsjXJtJ/OMtuVS6HYvFD9i?=
 =?us-ascii?Q?jKFCiGMOb6XcnPD4KR0OPKgnUhMfpFVwufnAiXpZJGpPZrfQLAXbhYUq6sBZ?=
 =?us-ascii?Q?IvZxd1tT0aW7QoEVmJQS+FXrxZRq2t2mjoqylunAgHe52Vwe7t6I4CYXlAAW?=
 =?us-ascii?Q?TuLZagBZGHrUHgqobtfOKwTKVD5HmON2/iFupi/vlOp7ceYya5vzSFnP0i+F?=
 =?us-ascii?Q?Joc=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SJ0PR09MB6032CFAA829AA63AF31947048F8E9SJ0PR09MB6032namp_"
MIME-Version: 1.0
X-OriginatorOrg: dese.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR09MB6032.namprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb249c0-5bd6-46b6-75fd-08d9a067df51
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2021 14:23:43.7383 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 81349428-f52e-4686-aac8-448974b80e31
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR09MB7357
Received-SPF: pass client-ip=40.107.89.73; envelope-from=michael.house@dese.com;
 helo=GCC02-BL0-obe.outbound.protection.outlook.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 05 Nov 2021 11:22:11 -0400
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
Reply-to:  "House, Michael" <michael.house@dese.com>
From:  "House, Michael" via <qemu-devel@nongnu.org>

--_000_SJ0PR09MB6032CFAA829AA63AF31947048F8E9SJ0PR09MB6032namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I've been working with QEMU a bit and I haven't been able to find pre-built=
 binaries for different platforms. Does Xilinx maintain releases, or should=
 I build it from source for my platform?

Thanks!
Michael House
Embedded Software Engineer
DESE Research, Inc.
Cell: (256) 348 5997


--_000_SJ0PR09MB6032CFAA829AA63AF31947048F8E9SJ0PR09MB6032namp_
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
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;ve been working with QEMU a bit and I haven&=
#8217;t been able to find pre-built binaries for different platforms. Does =
Xilinx maintain releases, or should I build it from source for my platform?=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks!<o:p></o:p></p>
<p class=3D"MsoNormal"><i>Michael House<o:p></o:p></i></p>
<p class=3D"MsoNormal">Embedded Software Engineer<o:p></o:p></p>
<p class=3D"MsoNormal">DESE Research, Inc.<o:p></o:p></p>
<p class=3D"MsoNormal">Cell: (256) 348 5997<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SJ0PR09MB6032CFAA829AA63AF31947048F8E9SJ0PR09MB6032namp_--

