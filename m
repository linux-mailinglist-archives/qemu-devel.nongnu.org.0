Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555614A3D73
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 06:33:36 +0100 (CET)
Received: from localhost ([::1]:55058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEPJm-0006Lr-PT
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 00:33:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wayne.gao@intel.com>)
 id 1nEM4A-0004yF-Un
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 21:05:15 -0500
Received: from mga18.intel.com ([134.134.136.126]:31521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wayne.gao@intel.com>)
 id 1nEM45-0005j1-Gb
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 21:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643594709; x=1675130709;
 h=from:to:subject:date:message-id:mime-version;
 bh=rkYP8jl9jfrnqDa7TMBCu9fcAlfEokXoquUjgHNsYNE=;
 b=X58t3uRHWOC6atSNPC4HiZf4ESa6fNAS0ph7ittaWve5WK78wzB7Hgrv
 IJNQd8wLBptrigK9bvYpfjTEOYYkRbBGFt2csLkiFP7Wgjf58QT70Y2iH
 QGkkFdDFmbgZlozCNb3McETBR+YL7IKsFUETl7x3pxsdIPuyZIxHqR+Ca
 3tq/POcnwJv5GuNRVSU9Zrh9EYSKRT+9BNgdDekHROhRAI2hG565Pkq7n
 wL3DzHgj93mUaBnYzIuPcZgWcwKDBpvZPzuqKW98oN3eKioED7QbKEbjE
 CJ+d/qJbBtX54C3DsDXWm0KvhMUBJpTN8h165jwgJVBq6ei260anYNKaH w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="230961787"
X-IronPort-AV: E=Sophos;i="5.88,329,1635231600"; 
 d="scan'208,217";a="230961787"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2022 18:05:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,329,1635231600"; 
 d="scan'208,217";a="619256064"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 30 Jan 2022 18:05:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 30 Jan 2022 18:05:01 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 30 Jan 2022 18:05:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Sun, 30 Jan 2022 18:05:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Sun, 30 Jan 2022 18:05:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+1xo0FBbYouzEMu6QEmqAa5ArW30uqC7hsDYA9KXnN2CG0OG/m0gELedk1jF/HdYJSZRI69eGy3HFFrLtVKLeHxANI8GwmQuG9KiZxbHVhmRm3BN5hjuhlV8uHB6X7JHSxMLhKyeNl/z6fwWgBfq7lgGOjbayIa8Ee4wgTbGK4jz1aGXpc9glbG2EqKGzP2CN04I7sCuSGVdNdzVFPQuDHTlJo2NCbDneJ8AHvgj0kOAsMeB+qVJJAqCJeGcP/Pt0g6ePvSwbkkoYbCuun05izQNeuhqproHRcNax0wDfaJ1L17ZG0p3HC6qt/ddqwufwiJouLp8e0NCa68tk58+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3OuBA3eosZOJJOdepACf5eqhyIJZY4nH9YMoNPn8MQ=;
 b=c3czv2Rrl6O3lT+O0QH82TvTgO9Bj8Y780XZyJAKgeKCsTqOfeImApH+reByg0g1JU/YevKdwXvwjm09rpaONt7IL1SV0/uMfmcIa4lBFIuneIBHOhTWUMxZdXjPOmZmY2h5WGkp7Szpeyvs7USJTL5DMhSrkcOI0cAL4E48v5H9YN0gyKPjyC0rWZwBDAnIGn1nKBvBKMFFztWBcosLOvUY1uBv8AQnjJNf8m8G/BzY+3uq1OYfhdgUHLu0dGHhCd/SBjmSm21EXXO4cyQ+BmEq1Vf7wpHqmV/MLkGFmIoAJIgfAMKpPkcB8O6zItPmeTCDcDz5Cnz5EfouTpyveg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6PR11MB2570.namprd11.prod.outlook.com (2603:10b6:5:ce::17) by
 BYAPR11MB2984.namprd11.prod.outlook.com (2603:10b6:a03:8b::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.21; Mon, 31 Jan 2022 02:04:59 +0000
Received: from DM6PR11MB2570.namprd11.prod.outlook.com
 ([fe80::7137:be36:b30:af3f]) by DM6PR11MB2570.namprd11.prod.outlook.com
 ([fe80::7137:be36:b30:af3f%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 02:04:59 +0000
From: "Gao, Wayne" <wayne.gao@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [FAQ] how to build and play vhost-user-blk with qemu code
Thread-Topic: [FAQ] how to build and play vhost-user-blk with qemu code
Thread-Index: AdgWRsWorMWy/dZ8Q8Oe82ObcqsXFw==
Date: Mon, 31 Jan 2022 02:04:59 +0000
Message-ID: <DM6PR11MB2570A82B1C94EBE31267F42FEC259@DM6PR11MB2570.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 599bf68a-1917-4a69-e8b2-08d9e45e15ec
x-ms-traffictypediagnostic: BYAPR11MB2984:EE_
x-microsoft-antispam-prvs: <BYAPR11MB298457A1C61CC374DC724C17EC259@BYAPR11MB2984.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t3RDccsoH2S+/VRrdhz/Zt4pX2Lx3pdUH59VT5SiXus6IUdUQjmCQFSqjzNBa0GXZhCZbz4RuYOILwkrjSl2jsuiUUQI+ocWWTfmpKPPSZOv1ePVeKKLYItSHDhyaz+RS5dSfjNXUvJ84iSD07SVE7Mx5LobnEiroi1Dvl8F2wr8OUQWm7QzPzYNudMP/15t566mFozlptu+f6ifyDA+p3+1USrCoBBDWaJbJ3dhCNNr0Tx6j063d8IaS44h0ypiOA1c85RErVhmcfls0odiWWBbtUbnhNyaWwHnxVPlFNOzhRcaRSlY/nxIy6rSZZAuFwuAXbKrYbUQMQt3FHLpR1ggecdSsFVphSxSHF3NTXYNI3WlY9Mlt5l7+SMpapPTtjLGepgF348O3ha0R7yrEVBggJjjfBeqifkDiREvkzLeCDTkwKWpFlNVXWo+wJ+f3aT1kMFiNDHhkaHDtuM8gzClbifUCi3Eww0+OaMlc7GT6giBupf4LPTgyy+DY4bZeQ+wf8rPJatf5beKtYvLfoMTvVpWUlp2fQOVb0NJHsP96a8JLV6yJKX08miN9FkjGz29UbTQXJv8Zx09+WRfQT3mnKVsxCfzbQ7iRrP6na8jy+G5eUAAKv2CRZuZlLGnFX1umQYHCURouZpRjlt8q1FdkexOgvxh2djsnrBvwdqJY7WVxfv3J81hysfBjkbtinlzf38ZACPWmH9UvuQfqYDjREb4L4WCei0FBQH7RcHDn2HxC0YYBUaweHrZxcvI/58iqH8jYOoltvZGTDzhXtcnAdM0GNPOfbej1EZdXN0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2570.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(8936002)(66476007)(66556008)(66446008)(76116006)(66946007)(33656002)(508600001)(7696005)(9686003)(64756008)(86362001)(71200400001)(55016003)(38070700005)(966005)(6506007)(38100700002)(83380400001)(558084003)(52536014)(316002)(6916009)(82960400001)(186003)(2906002)(5660300002)(26005)(122000001)(166002)(20210929001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FRrlpLEiinitjCsbNhJJB9MmSHhNHtHLRxGPBSuWS/8q5JVOH/xvjGqwjlO6?=
 =?us-ascii?Q?47SuVAh1Mw6di9FCY+ChVc3952WA6ZhyeyZYE23njK7z20YjY0Tc4W77qVXU?=
 =?us-ascii?Q?RQcTYYkznyJ0xOATIZFitaYZ1x2opuU+wIlAJGB7w/FV4uKP/8ZRnTiHQEcz?=
 =?us-ascii?Q?oRFIupBqykSN/sWBf+0XXg1Gk8+v8tlKQV6Gll0DamiuTg0rXU89wGlw9eaM?=
 =?us-ascii?Q?yNjD4V364jclG1a2SN+Lnx4eRZyIJzqkuQI8EOMlg6shsTyINewW1cfnptu5?=
 =?us-ascii?Q?KaxwWMKaWrnEqPO0yMJxarGZiYtxN3QwBIliSq2Rln26st6797eQli2ytruP?=
 =?us-ascii?Q?DjTEgPsn70pGwqKqb+YwDg/D3EPdzzfKOT9fhocXWtLqMpVa9xUiZ3TQthKy?=
 =?us-ascii?Q?RBoAmcaUsuFxLg9S6sb1dqbdpMMYQLnZSrQifKDF6+K0LfI436MtF8kuF8ot?=
 =?us-ascii?Q?0t0z1ozEye5Xx9257Xiy5/dndJ5Hdx2xB1PF6CBZaTtzu0i+D1rmPhWqFs9Q?=
 =?us-ascii?Q?0nBCAHFB8kKkISSXj1wXNuRVk9+xm6FFuiXwM4ggsecfTUBO6ErmEK99pEeD?=
 =?us-ascii?Q?tJ9drde4ft1TuQueoSGEd+wrifea+L/OdlCUKWYmNe3GIeStE0feRbeyLgFF?=
 =?us-ascii?Q?ttcNMRi8dy1nIy54qkS3UIfZ2tIqgfgPer7EUlDO/SdJnaNzZOrpuoD0Zlap?=
 =?us-ascii?Q?anV+XkpsSMnt2bb7rOSeNgf/41kCSsHcFJat/iqbYOpcqmU+QiPMgYIlLmAT?=
 =?us-ascii?Q?bLjonbym8uDfLeMPgl8xUy7glsc+3Eg1On6LVuJk7+AzJVuTaIiPAd5x6fCw?=
 =?us-ascii?Q?96bs0+3vtOJjk7kbIJZ61xDPqxiUUrCSwRY+tG33StPLuaDF2kv8pcBFHTx9?=
 =?us-ascii?Q?BQLxOlb5GfIftZbMxq1XexymaAzjT67gn2uzhPSJyzWX4CsO+UVgr9a118Jm?=
 =?us-ascii?Q?GPVX5r92+2gHm3IcrM/HsaQegN3WfrZqZU1/SrB5aqDnwOgxi1n45ZlGcVFn?=
 =?us-ascii?Q?LGH4sKg9f9eCTwoJR1i6PUeoJxmJTCvYCTegE2OppOtoILF+xIacS4ciAasj?=
 =?us-ascii?Q?0v/VZo6q8nKrHiaJER8F+Kq1xghO3pg07PYHHSfVnCinaVWoAB1wP2yMpakW?=
 =?us-ascii?Q?qt6ivNFS4n1kz0ke95DrN9y630/CePeSHBm/oMCggqHGhRcB+cH/zNphBRBH?=
 =?us-ascii?Q?VV7/wHreOYyAtLRdz9P1LkjlQv8HbIwDHCJeiTK1HWppPTOFWiKjxtF5qyQp?=
 =?us-ascii?Q?ao644GzQG9rE6glqAwvYaJqiasOLftT+1JI7a1W4iaqtGpYiAMQLVhcl9ygy?=
 =?us-ascii?Q?WnASr6xTzW6dS8QFjHMR/0lM5y04T2Uad/9r1FUdh/mQ4fvTuEMs3tKLwOEX?=
 =?us-ascii?Q?1busnnZJj0/sJglOmnltwLMzeGdrU4FOjeh/S0ida0HN5srOBYnlSvfeq8HR?=
 =?us-ascii?Q?uuT+IA1j066qxnqVgPoyVcE6t3Z8D+g4qtvikTWj6qF1Vp/uqL8NB0MScs2m?=
 =?us-ascii?Q?fZeahKq/dltkszEZjBwSHOdiaE5yCIKQ357kMnmBfa+fxGMpQQvqSici+V26?=
 =?us-ascii?Q?VHcGe8bvEC4sqTUqgHmkqxWRngHzsRqSyOtFfgIlUa7CanHgCthHZvB0Ra5V?=
 =?us-ascii?Q?ew=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM6PR11MB2570A82B1C94EBE31267F42FEC259DM6PR11MB2570namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2570.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 599bf68a-1917-4a69-e8b2-08d9e45e15ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 02:04:59.4292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G/GXAgE5LeVq9D/++18QGYERc7ZZch9/sLVx2aXMR7OnbXAmNpXJ/kwYAA4d322XBwv81HANak2t+dbUxWecoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2984
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126; envelope-from=wayne.gao@intel.com;
 helo=mga18.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.098,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 31 Jan 2022 00:26:14 -0500
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

--_000_DM6PR11MB2570A82B1C94EBE31267F42FEC259DM6PR11MB2570namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello dear experts.

I would like to try vhost-user-blk, may I know what is the guide for this?
For now I do not know how to build and run it, and how to start one vhost t=
arget emulator?

https://github.com/qemu/qemu/tree/master/contrib/vhost-user-blk

--_000_DM6PR11MB2570A82B1C94EBE31267F42FEC259DM6PR11MB2570namp_
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
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
<p class=3D"MsoNormal">Hello dear experts. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I would like to try vhost-user-blk, may I know what =
is the guide for this?
<o:p></o:p></p>
<p class=3D"MsoNormal">For now I do not know how to build and run it, and h=
ow to start one vhost target emulator?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/qemu/qemu/tree/master/=
contrib/vhost-user-blk">https://github.com/qemu/qemu/tree/master/contrib/vh=
ost-user-blk</a><o:p></o:p></p>
</div>
</body>
</html>

--_000_DM6PR11MB2570A82B1C94EBE31267F42FEC259DM6PR11MB2570namp_--

