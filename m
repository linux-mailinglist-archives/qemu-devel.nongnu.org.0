Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE583E8CC9
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 11:04:04 +0200 (CEST)
Received: from localhost ([::1]:35060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDk9b-0001Zr-Gq
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 05:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <satyeshwar.singh@intel.com>)
 id 1mDdLV-00076i-Hq
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 21:47:53 -0400
Received: from mga07.intel.com ([134.134.136.100]:2891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <satyeshwar.singh@intel.com>)
 id 1mDdLS-0003QL-AB
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 21:47:53 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="278780929"
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; 
 d="scan'208,217";a="278780929"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 18:47:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; 
 d="scan'208,217";a="516265359"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Aug 2021 18:47:41 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 10 Aug 2021 18:47:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 10 Aug 2021 18:47:41 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 10 Aug 2021 18:47:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fmb/ySAzWL1/rjZ4wsjw3me8ptI7XsZtibUIecNCNnz/j/vxgy8rS45a5PmRojxYp7BTpUYh2UQRON/jToXmIsxHN6X4uYwjaZgb5vfxMCVuviEvSFsS3ZkLP4Ha6XPrIijFumj79dAp/TTU0iGK6E8ZTktsKDE4SQ/JldR1oC4xAWIZyVoFlxuhjFBzXnEZTBe7Bp2mYdSAXbjbgWr/BPPRsPFd1V5aY1Hgk6eGEFnL9hnhfICjq64OwTYNg1RWKg2okDGoufqOVdwdAGvaqbC/pkDrJQJJuk6NbceV8WADnYoOHiKNx/xMR2uGC+oz+c3gkC0HUS2zCYsrHKeZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwtd4+xMyKDBbI8ijRuB6E6T+IlQPcsv9n5NNk6af9E=;
 b=nWJZRXmOIjZNgk5gk24tfskYvvVEJC68DX3iNwSrmGIw/yC4mUczbIGonIOHmDE0atpPKQehF+Yf+RAfkMfXDgcJ6DslD6Mp2okj+db8f7ka58Nd8+SrJLnOdIGikeX+h0qTWv7LpUml44kzCO/qHYIqMq5XSBwbLErXdpcBd1hRoP+Vn0mn0s6hV/tpIcmHu/fcIwt6DAHur1eR+NQkN+DQY5fmyarkYz77RCssB6zbmELwKtvDB2TitU9g0WW3zFfEhbiqtAU5X+VxqwaZpPEkSQcwYmp8E+AtXwHopnEt+iiWA/O1jxypgY+0PLygXD+be6hD0IatKskzfFCKdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwtd4+xMyKDBbI8ijRuB6E6T+IlQPcsv9n5NNk6af9E=;
 b=Z6flzLsy8VssSV3oJOxHc7fiC6bPX7dJJ92NtQpQ6Oc7yTnVKZxJcBDk6vZR8IZAK5lINBj7twyYbB4vRPNRGop/BeIZzuiD8BoQgNbCVCZ8BrY5R+YSCKEf3SbNGrmpEcZrCICUToOmZWvr4PdVKhJcMQO530YQqDsurgI43PA=
Received: from MW3PR11MB4684.namprd11.prod.outlook.com (2603:10b6:303:5d::14)
 by MWHPR11MB1968.namprd11.prod.outlook.com (2603:10b6:300:113::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 01:47:37 +0000
Received: from MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::1866:d2fc:73f9:8ef4]) by MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::1866:d2fc:73f9:8ef4%6]) with mapi id 15.20.4394.023; Wed, 11 Aug 2021
 01:47:37 +0000
From: "Singh, Satyeshwar" <satyeshwar.singh@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [PATCH 1/1] edid: Added support for 4k@60 Hz monitor
Thread-Topic: [PATCH 1/1] edid: Added support for 4k@60 Hz monitor
Thread-Index: AdeOUoTv/iY1fMiTSt295tkAW4i9eQ==
Date: Wed, 11 Aug 2021 01:47:37 +0000
Message-ID: <MW3PR11MB4684F405F2C56138D2FE83DE9FF89@MW3PR11MB4684.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.0.76
dlp-product: dlpe-windows
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 762d025a-f9ce-4a09-ec0c-08d95c69ff92
x-ms-traffictypediagnostic: MWHPR11MB1968:
x-microsoft-antispam-prvs: <MWHPR11MB19683EBF9D7AFAE4D9D6BABA9FF89@MWHPR11MB1968.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VIO6c19LCPpUycDPPVp2Hkw/LJaoicT05gspKJREhqsOUwNfV+5BWiwSfzO2SzG32KvF8R6xc9WsDOUuhGs7zRNsqvUViyNAWUSCHYaJNkwmV6nffNzyvfEwi/Yi+pxCy0heSbb5cFL0X9IwoBarI1MqC6+ONmUhPc+y30OpLzdW/u5x6q0Y3HYImvv6mzxdTraoNCjfa/bXH9aJfsV97ZqzfRy5S9pBMCeB+/5RC/GiwrwlktV5N8Twfna7xFLroT0x8cKLkx5BsnAoyNcz44spsH3GPMmtE+kWiennj3iLs7O1kItfBufmSq9hUYoTy1CYNyxY3KQcR2LDIXKrNQRtZWPWCb2/+kvkUgXIcSiF4+FKRXwqrOQFlYKReOF3gFzUD88vfoH7/ho+sbrX39Ns3ZTjI64JqdbYs3JcAogDWtlm822l6aO+bs9pLTyCaE9mtNT9o+hNl5nxo3eLx1ZWAzSjA51Bujepuvvyx4O9K/BbziAsPVltaBmoOSLEn2o7zLrM/qYxfj6cRq0z4HpCOvncM/H3SjxrZ5OMq2HMck05X13lcorw0FwdIPn2V/+eUkE5WthjIBFHQSc336o6/GUtidJTLVAX99F8rBAq+bWiYVFZ/Vp1KvY9kXm7Rrg6uZp5vsyQDg50BVRNCLKZyE9WvjVj8ICffVAyb/8o07zKwM1Ce43YdXhcMYmElK2GynXw61jLFzjDXlfSIQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4684.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(6916009)(38070700005)(2906002)(52536014)(66556008)(66446008)(186003)(64756008)(8676002)(316002)(71200400001)(66476007)(38100700002)(9686003)(7696005)(55016002)(33656002)(4326008)(66946007)(76116006)(26005)(6506007)(122000001)(86362001)(5660300002)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e0tTYzC8+SOOO+GO5b9Q17MvaLgV8bsxXIsVyenF74a0A+xV2Ty4aGef4s7Z?=
 =?us-ascii?Q?QrtXaJtsgJxs+FX1IAiWJ2+md89emS5WzKd4vu/WIlTEiLv3SD2GqxeMQI3z?=
 =?us-ascii?Q?rvEYYHQkA1c4ou1eNFT2O9KOrVUiNItrCPIIc1Y1ZMcxgi8x7gjToWg+DnnJ?=
 =?us-ascii?Q?6/BqwY4Z46GZVlIHWe5X/krXchNule99otXHXZIRpLdrozJMZt6Y3LXTQQS7?=
 =?us-ascii?Q?/51rbTi76o5DpccubhYHUN7JluWS6tJGkZOpaXGKn2G0JuNXdpH9rTxdj9r4?=
 =?us-ascii?Q?eLPDCKVSAlVTkRhVH5o5v9bPwP4B8A2wNdGmTqbGokv4XD9tKw9dtB1JSyFn?=
 =?us-ascii?Q?XU+o6sOZQ7bCDrrNbWo1eAB2v5xSo6oKvezSz5i9tPK/p46MT0ysuRCxgHuy?=
 =?us-ascii?Q?L3Q4083M457Sskbxe86eZcTF9PM9d+Q0nnHdcq3S6ra+a9FnM1cf/wx54elG?=
 =?us-ascii?Q?CjBTWX+MshpcjfiHvm01Q/p8azg80/IMJ/x5g7i7snOCqArL/0zYAGyqp/j0?=
 =?us-ascii?Q?FzoLXRXSdEOht9VX0wIcLeVqlAMiPfdWBRrcgWs6jm6xfCsOJTDI3uIOls4z?=
 =?us-ascii?Q?g+Lkkol03A3T5i9vj0VemkvqYOx1jHVvmZEPwKZ12ACSUaPZR1mt4qc2LrDG?=
 =?us-ascii?Q?QFnS5i92KXqPkgx66MKqUNPQwD/y9ByaLGkB10T+mmovvqILGtlSWs4u4WYq?=
 =?us-ascii?Q?Wn/s5pqvO5K+BErZ/Femujp6bneDO9OKb1HUBCYKGJY6ywPvnQDGUHejHiun?=
 =?us-ascii?Q?Rh1UfFs5vxTYGBlN5QxcdAcZze+KgGiZTInMoiIGokHS0aAfUGRxHTg1YHW7?=
 =?us-ascii?Q?gUZ1WL264hyfHjclLh82Y/+lW2wjE9JTYh/RycOyhfbNYmLU2daAp+S06ZSR?=
 =?us-ascii?Q?ktzwvZD9coO5m1XmZZ1Gf0K/AxNDDpj8Yen2tlGHHbiRrKVEBUvfT/uIHyex?=
 =?us-ascii?Q?gLMJ8BFpg7p+NOIjRVPcyfJ0P1P88EqsH6Z52TB6UE8QdoaxghQJnUcgvcHv?=
 =?us-ascii?Q?Af2y9tpt00ozd+Ga6nKncUoNXRhOKNliO++hRzAW3+dQAbOMIHDnsdStDYLW?=
 =?us-ascii?Q?Y1y+7+sCLr81XShRcQxzCmP5qm+toVUtbOemHEqu5otZ0BXbk9Z7DdQRisnM?=
 =?us-ascii?Q?IJkZftrIoDk3GH0sXczdYCKuT6bt0W5i64qsYSsMG5Jxar68Re2lHU6LWSUT?=
 =?us-ascii?Q?RH7jw0yxc5yWSf+xn/FqKP5AaJOarSTa1hbSxviLF1i1ne6DF/bMEZD+rtIe?=
 =?us-ascii?Q?9+BPnHYRXe6v/tt4Q+cyOvJ6hic48SdD+6ckpc+wCsCX+lqKY2iCiwss40Af?=
 =?us-ascii?Q?hVwW3C03yPtVwOr+r5+XP7D1?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MW3PR11MB4684F405F2C56138D2FE83DE9FF89MW3PR11MB4684namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4684.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 762d025a-f9ce-4a09-ec0c-08d95c69ff92
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 01:47:37.7830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: guid9dWJSyIRHxKXyHSAMg/pxpoEec0GHGO9VwOxiPcPNQjaFIKkA02a/lAFfei/zsIVhox7yrGuxUaNqWb/Ocg8cbUyBSwaWQ2EIPuzg8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1968
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=satyeshwar.singh@intel.com; helo=mga07.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 11 Aug 2021 05:02:41 -0400
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
Cc: "kraxel@redhat.com" <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_MW3PR11MB4684F405F2C56138D2FE83DE9FF89MW3PR11MB4684namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Previously, the large modes (>1080p) that were generated by Qemu in its EDI=
D
were all 50 Hz. If we provide them to a Guest OS and the user selects
one of these modes, then the OS by default only gets 50 FPS. This is
especially true for Windows OS. With this patch, we are now exposing a
3840x2160@60 Hz which will allow the guest OS to get 60 FPS.

Cc: Gerd Hoffmann kraxel@redhat.com<mailto:kraxel@redhat.com>
Signed-off-by: Satyeshwar Singh satyeshwar.singh@intel.com<mailto:satyeshwa=
r.singh@intel.com>
---
hw/display/edid-generate.c | 3 +++
1 file changed, 3 insertions(+)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index f2b874d5e3..397af0bd63 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -24,6 +24,9 @@ static const struct edid_mode {
     { .xres =3D 2048,   .yres =3D 1152 },
     { .xres =3D 1920,   .yres =3D 1080,   .dta =3D  31 },
+    /* dea/dta extension timings (all @ 60 Hz) */
+    { .xres =3D 3840,   .yres =3D 2160,   .dta =3D  97 },
+
     /* additional standard timings 3 (all @ 60Hz) */
     { .xres =3D 1920,   .yres =3D 1200,   .xtra3 =3D 10,   .bit =3D 0 },
     { .xres =3D 1600,   .yres =3D 1200,   .xtra3 =3D  9,   .bit =3D 2 },
--
2.21.3


--_000_MW3PR11MB4684F405F2C56138D2FE83DE9FF89MW3PR11MB4684namp_
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
	font-family:"Arial",sans-serif;
	color:blue;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
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
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">Previously, the large modes (&gt;1080p) th=
at were generated by Qemu in its EDID<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">were all 50 Hz. If we provide them to a Gu=
est OS and the user selects<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">one of these modes, then the OS by default=
 only gets 50 FPS. This is<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">especially true for Windows OS. With this =
patch, we are now exposing a<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">3840x2160@60 Hz which will allow the guest=
 OS to get 60 FPS.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">Cc: Gerd Hoffmann
<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a><o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">Signed-off-by: Satyeshwar Singh
<a href=3D"mailto:satyeshwar.singh@intel.com">satyeshwar.singh@intel.com</a=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">---<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">hw/display/edid-generate.c | 3 +++<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">1 file changed, 3 insertions(+)<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">diff --git a/hw/display/edid-generate.c b/=
hw/display/edid-generate.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">index f2b874d5e3..397af0bd63 100644<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">--- a/hw/display/edid-generate.c<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">+++ b/hw/display/edid-generate.c<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">@@ -24,6 +24,9 @@ static const struct edid=
_mode {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">&nbsp;&nbsp;&nbsp;&nbsp; { .xres =3D 2048,=
&nbsp;&nbsp; .yres =3D 1152 },<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">&nbsp;&nbsp;&nbsp;&nbsp; { .xres =3D 1920,=
&nbsp;&nbsp; .yres =3D 1080,&nbsp;&nbsp; .dta =3D&nbsp; 31 },<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">+&nbsp;&nbsp;&nbsp; /* dea/dta extension t=
imings (all @ 60 Hz) */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">+&nbsp;&nbsp;&nbsp; { .xres =3D 3840,&nbsp=
;&nbsp; .yres =3D 2160,&nbsp;&nbsp; .dta =3D&nbsp; 97 },<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">+<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">&nbsp;&nbsp;&nbsp;&nbsp; /* additional sta=
ndard timings 3 (all @ 60Hz) */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">&nbsp;&nbsp;&nbsp;&nbsp; { .xres =3D 1920,=
&nbsp;&nbsp; .yres =3D 1200,&nbsp;&nbsp; .xtra3 =3D 10,&nbsp;&nbsp; .bit =
=3D 0 },<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">&nbsp;&nbsp;&nbsp;&nbsp; { .xres =3D 1600,=
&nbsp;&nbsp; .yres =3D 1200,&nbsp; &nbsp;.xtra3 =3D&nbsp; 9,&nbsp;&nbsp; .b=
it =3D 2 },<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">--
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue">2.21.3<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_MW3PR11MB4684F405F2C56138D2FE83DE9FF89MW3PR11MB4684namp_--

