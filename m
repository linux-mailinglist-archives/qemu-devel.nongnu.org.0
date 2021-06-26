Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883303B4F30
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 17:23:59 +0200 (CEST)
Received: from localhost ([::1]:42540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxAA2-0004IZ-LI
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 11:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wentong.wu@intel.com>)
 id 1lxA8R-0002rM-IF; Sat, 26 Jun 2021 11:22:19 -0400
Received: from mga14.intel.com ([192.55.52.115]:23539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wentong.wu@intel.com>)
 id 1lxA8J-0000JW-TP; Sat, 26 Jun 2021 11:22:18 -0400
IronPort-SDR: bM0AMJKqf7JYsP+UWTVn+hZMD/IzTcWY2rpId8sB42tD2/AEF0FeS3MOVVXFjFVmkO26IBF5GN
 q6Em2kDnykJA==
X-IronPort-AV: E=McAfee;i="6200,9189,10027"; a="207614454"
X-IronPort-AV: E=Sophos;i="5.83,301,1616482800"; 
 d="scan'208,217";a="207614454"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2021 08:22:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,301,1616482800"; 
 d="scan'208,217";a="445957061"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 26 Jun 2021 08:22:06 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Sat, 26 Jun 2021 08:22:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Sat, 26 Jun 2021 08:22:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Sat, 26 Jun 2021 08:22:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIoA8NpxlPI80uwYqkQ+AmeuB7pECqcGvI4LPn6xnNmncxhLe891EvDIOAmGZRVvRD3nfn/axshuXB/Gw+AYBLTiJ1+YkJyer3+frVyY5g+/I8bQmR4O3XbAAGBLgK83CSuMA2C8H9yikQNNSHyEDUOP90eeqsv7CwEttG5olpxHTkKUcouHX8YsZowhFljNL294IfksIbqNqejywdh6ClJwvSJEvpcj2muLMGvEBu/aNj/0TCXmZZBVWpGAM4+/vAFREtxEsg8IU+vh31jxJk3LXJh0LndFg4FSUWj1R/nsdfPRDLP349vEiGA9y9Leo9iot9zKblch24z0I4Cq0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeXWLLpdZ2WObeJer7Zlln27bFyIIa4KxbxfLNaKgTI=;
 b=i+W3TbG17EabK/Q69qQkWT9vEYzMIqAKGZ+Px1ctXDdY4Ea2iPusS99AvFYIJ6Bg4MG3gH5iDS5mb5GGj/KGMGhnvQGxY65iIA4ovcxMIDmpBYBk4dsQX3gf64oMvwwioLXVLak8Zqryy2wuhISA1kJC7Ko+hOMWOFnUcLEb/GE5PRHbRV7OtO5pD5uJbUXwhsSUqdBP10fzh5XcvSYmfAcjxDC46AkPHnYt9IZVQBIXtUxTc0wFlCGsLNDg3M74RRKDVCBjavkHftUbSGvxQNQrKV/dSJiz8bQYVqQX4jLXEFMYM/2dSVZYW5btPnoQVYpxFmGtG0LI9LgzjuK7SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeXWLLpdZ2WObeJer7Zlln27bFyIIa4KxbxfLNaKgTI=;
 b=Q4MyMxAZoVWGMbTPTy1atDL5dbqQVvYa1G5ZJP1/z+GF/3AfSccHRqCNq2lUToLPqJGbrd56sXwx/V7vZujL68hNm20X4sml65AYeOawjNy7HaeZH5HpS7gTuVa5metoBhBdNPBh0X1ldph+gy5/OQI3CktIDCEGIyk5RvS2kqw=
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DM6PR11MB3036.namprd11.prod.outlook.com (2603:10b6:5:6f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Sat, 26 Jun
 2021 15:22:05 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::a0e9:c0aa:eaa8:cfa7]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::a0e9:c0aa:eaa8:cfa7%4]) with mapi id 15.20.4264.024; Sat, 26 Jun 2021
 15:22:05 +0000
From: "Wu, Wentong" <wentong.wu@intel.com>
To: "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: the dll dependency of qemu.exe
Thread-Topic: the dll dependency of qemu.exe
Thread-Index: AddqndKQ1hgpHc0cRkimaS+iX87EPA==
Date: Sat, 26 Jun 2021 15:22:04 +0000
Message-ID: <DM6PR11MB4316413177086220473B74308D059@DM6PR11MB4316.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.143.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ebbf717-6461-4035-004e-08d938b627b4
x-ms-traffictypediagnostic: DM6PR11MB3036:
x-microsoft-antispam-prvs: <DM6PR11MB3036878C8F1D36C6DF8D69388D059@DM6PR11MB3036.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p+lb0y8x6UXC5VXi2RLsUYHKVn/MfNGqSt0OLVmKcReJWHlKXZbB2WpAUN6LgXfeZpGPrHd21QExZN7SfPzmWN6Df/NJx9XnYcfkWlfYIHjk+Zm7YYu9g0dU/KE/oRuwYv5LBpCrOyteYJNilynhsrTtMT7oFPie8/H+l0z86ryV6vlG+hcYCgqXHu3jWkGgEUxiyI5LP6DGzPnmFhIRm8to60q/xljzTolos9yJX5amePKb729wV68xw2rbGS/2CWENu2pG2sFK0rg7WZ0qtYYp0QazKLEKiN0vTxRuljEgufFWz3bU9wDrv6GK7t8LxNHstdDgXmDIawHNoBdEuGARxrC6uQ0tWzQcv6MptOEzn68Oc1ASzvYqcP+u8fa5w6Z0A7gqMKX2E1EB2pg/bBoOfz5LiF/SuTprLmucfUVCyOpXj4chXnXeko0VzV2IDcfbYdVbqegPtmKDzW2j73yvFtOiRJBTm33BRctoLnq/cyiCVA/5E6kJwaSqo92FqP9lvr5O68Nf1ELd7Sw8kgq6kL3Jnk7/BqYsc2MrYrkTIb9vrua6fMz6w5QD9BWfFAnOaj0NwsH3fTOtO6VBHv+WxeXl/8P6iKJ4Mc9a1WfK85zylYEasj86ARfvDDxcHRjCx4o6h2RtSdNW0+hJCadMSplZW4EfFs/Fr4acj5GBPdb0r2wTQkb15t/o7gq0dK7RMFvJAo3qMIObjUmzsg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4316.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(366004)(376002)(346002)(39860400002)(71200400001)(110136005)(316002)(26005)(9326002)(9686003)(8676002)(38100700002)(33656002)(52536014)(6506007)(86362001)(478600001)(55016002)(186003)(4744005)(8936002)(66446008)(5660300002)(450100002)(66556008)(76116006)(7696005)(66946007)(64756008)(66476007)(122000001)(2906002)(460985005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RWYHO3DsolEtyxBcCuVa8NLVg1MVJsXQwI55JpCpHN1WMarZ+x1DpnMpmLU9?=
 =?us-ascii?Q?bhmYk6kL/rCfsY6EdHKZh/R0rW8pIS8wjsbqsmwWpykw4wW7vPqO3oUlrP9s?=
 =?us-ascii?Q?+J+B3pkkS6vSlQak4U8NZTYnhNF1Evz3kP5STSkVgoRbAQTAHo1yB90LY85B?=
 =?us-ascii?Q?pUHeHU0BmfdNS0MgTwJK/mipmjatCXtLJbLGIxFM9ExU4UcYkMY7A5QUFl8I?=
 =?us-ascii?Q?NyZA9qyhYuAQ+sPp3FlHa6WEIuFwE3ZgsfEOtSbaVv69bt1sLSiGXUgacvb4?=
 =?us-ascii?Q?i7v35aLmv898JkIS2V5m65BIiEXIFGBNd2bLpXd5Xcq4bDTfPIKKouXLy3Qf?=
 =?us-ascii?Q?nKlbIG3l7UIp4rrrTfzXKCc1ajUnXsgmREIWgVQbm6rn71WThsOIwzyk8GcM?=
 =?us-ascii?Q?OfailcRezc1VB2MAq4GPeGu+hCKtGlhic+vs5f1jKrOxnZLOT7DXyJBTIHrs?=
 =?us-ascii?Q?D+AIzxWTfIpjoXmIezHfgEIJ+Xz4m8+MopwwhaAEmDOi4keGhNNiTaOy/CsU?=
 =?us-ascii?Q?rj0M+bbLMKsE5G1Sc5s5jmmSLszz49LX7qxXgmdPtxUDHW4fF/W5VwwjlrYq?=
 =?us-ascii?Q?yymcqxGOPHGLZNUPNYRZpIZc1xMaOxBGD/qW7uyInRS7SYVtxZamA12FaY5k?=
 =?us-ascii?Q?rvwKt4F+FjD4nGm/b5jp+VLddbMhaKT7248X71+pq8ZMYFUKAxlnal6Lw0vM?=
 =?us-ascii?Q?wMBm3jDWosasZEyPUIpWeoLAjijoPmrArDJSULFZcYaS85/oBhuM8Dusy8L7?=
 =?us-ascii?Q?M3Qer2O2dyt5X+IjPbKqzM96JFScubk9Fo3reMKNwc1xRuIR9nVxToJGEuTn?=
 =?us-ascii?Q?00ZrGZl8ylBLhxU5DhDBzSGoLbP9PTH4FOqrA9ysSHONqK8UeTrnNEn/ty/w?=
 =?us-ascii?Q?rVB9s2Pu6eoi6JklVhq6B+Je4H6h7gA9ND1gDvtHc71ZaNPZ1mLoR/TZOcDd?=
 =?us-ascii?Q?n91xd//A4kUQjjMtlw/Nq6erX3zAFeSrwc4Bc69d2xXbnww4HODAcG6OOBX8?=
 =?us-ascii?Q?lCDG2eY+3RMBO/+//k4EFICI0Q2G3Lwc2WYah9x5K3xS9aJfPwucUC48vRMn?=
 =?us-ascii?Q?ZxQF09EdophIiV6xHu5Do96o6SoF1NQ+JcEp2vbJXcX707e4dX+vcVfKmeOc?=
 =?us-ascii?Q?UdwsXegHULAQ6sVnWyOgtvovcCEdA1G83inZLZvw0iUYghnYYWA4EhYvjbnE?=
 =?us-ascii?Q?f15FlVyZ/M14bdg6JkyQu06TrchnYSd6wJsZHAnsMqp1aQ1q1vqW7MnxaB79?=
 =?us-ascii?Q?9MwCFfYXJNZViZ2E+3y170wXe/Q1RGmRdK9b+q2t+VDIkSDDPAiEr/t/VQ8F?=
 =?us-ascii?Q?mrY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR11MB4316413177086220473B74308D059DM6PR11MB4316namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ebbf717-6461-4035-004e-08d938b627b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2021 15:22:04.9497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kfjlpYk3EAzpMUxvo2C/T/apYYOan2dShEtBMUqSJc9xsnEQiKGZ2yfyfARyNR2VnQ8eW1/omUKR2fB420bq0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3036
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=wentong.wu@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

--_000_DM6PR11MB4316413177086220473B74308D059DM6PR11MB4316namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
I build qemu with MingW, and after the linking, I find the qemu.exe depends=
 on some dlls like below, I understand the glib dependencies, but why qemu =
uses libffi-6.dll, libiconv-2.dll, libpcre-1.dll libssp-0.dll, libintl-8.dl=
l, libpixman-1-0.dll, zlib1.dll? I just want to use TCG function and don't =
want so much dll dependencies, can I remove those dependencies by disable s=
ome configurations?

libffi-6.dll libgio-2.0-0.dll  libgmodule-2.0-0.dll  libiconv-2.dll  libpcr=
e-1.dll libssp-0.dll libgcc_s_seh-1.dll  libglib-2.0-0.dll  libgobject-2.0-=
0.dll  libintl-8.dll   libpixman-1-0.dll  libwinpthread-1.dll  zlib1.dll

Thanks
Wentong

--_000_DM6PR11MB4316413177086220473B74308D059DM6PR11MB4316namp_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal">I build qemu with MingW, and after the linking, I fi=
nd the qemu.exe depends on some dlls like below, I understand the glib depe=
ndencies, but why qemu uses libffi-6.dll, libiconv-2.dll, libpcre-1.dll lib=
ssp-0.dll, libintl-8.dll, libpixman-1-0.dll,
 zlib1.dll? I just want to use TCG function and don&#8217;t want so much dl=
l dependencies, can I remove those dependencies by disable some configurati=
ons?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">libffi-6.dll libgio-2.0-0.dll&nbsp; libgmodule-2.0-0=
.dll&nbsp; libiconv-2.dll&nbsp; libpcre-1.dll libssp-0.dll libgcc_s_seh-1.d=
ll&nbsp; libglib-2.0-0.dll&nbsp; libgobject-2.0-0.dll&nbsp; libintl-8.dll&n=
bsp;&nbsp; libpixman-1-0.dll&nbsp; libwinpthread-1.dll&nbsp; zlib1.dll
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal">Wentong<o:p></o:p></p>
</div>
</body>
</html>

--_000_DM6PR11MB4316413177086220473B74308D059DM6PR11MB4316namp_--

