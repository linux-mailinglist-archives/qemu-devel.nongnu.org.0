Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2016672FCF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 04:57:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIM2O-00053x-LK; Wed, 18 Jan 2023 22:56:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1pIM2F-0004rR-JZ
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 22:56:20 -0500
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1pIM2D-0005h8-GR
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 22:56:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674100577; x=1705636577;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=oCvdc+wJuih7Cyhshjpm310Z3MZDmzPwHYdp7rzXLcU=;
 b=mfDS4ArQ/55XKSCN5fxg62YsdON2AcTAwWhvxbTqU4D/lZZBcVjwKGii
 yXWkgevuzOzi4gM+HXlNGT9NrdnKtNRHotHpJIv0Glw0SnLbKRV8kVSsE
 SvlDjfipGMq1zTqNBDWdVJ4lFchBZY29HEfJJ8iJ6Pk7m+45E6eiTPMUW
 G9uqoJYoylQX1jY3bbeUYXIfS7MI4IdE+Q8O/pDp+Fip2HRWYKJuSYNpO
 lhXLTPlvDb1bHmOK61hDh15h77NuRFjipwbgXQKL6OOPh321bsBE+Ek2R
 N06qF/tCEUTsZ2ZeRduYcA6AfBPHG3JQ9idL+KjL+znr+Mao45hnNWQET w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="389682028"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
 d="scan'208,217";a="389682028"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 19:56:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="748737849"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
 d="scan'208,217";a="748737849"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2023 19:56:07 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 19:56:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 19:56:06 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 19:56:06 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 19:56:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgYyLJ8JmPEWE4b07XGpbMoVWleWsG2lgWvachRSX8+kbMhF38eNqTPmXmpnI/MXilJmlvDKg5AceEpHwuGw6EJmMz6v1gMWFD7P1uDxmRyfkBnqKhrAGK34CxTl17NrckCYpGDBWGBy1gpjA63QRqlTGSvVwipsKmBOQ9lmFXknw5zD+6T3sV5AiMAqm1naCdjN7LoeuHp6LxyaWbONvbWNTyEjsrxhoizfW68SPpLejWgachzD+E6DjqnWStodtRT4QbTnLzQ7qGlcmPnJw/fE7kiHaoqW/8BesPR+PCm+FfmzdCP0vUHimbeZynm6K1L51FcABp94DGBI6sEqpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7cRCUhmFWzwkBnXvfoVmfsDHLCLYbh3Bb8MUHUf07o=;
 b=LVIJ9Da7ixrIwtL33dL8VbMjb9LTQJlouYiyyfKAAz1TqKBfoAPDWkLHYy1+QCnpyCbCiq1fuFFEXA6PzotwOB2TX7CJwiWIWdYur210LxPF7PcIAdnsp7unSIOCdSCZ+rPd9W15DHEvqQbeN+HitborxzrJNXAO3sfFMclLHT0pO0SsGx6GpIO6kjIdaIHqqz4XyWyv4XLZggee0OmnoYbmTylcGYN8aud7MFljP9rGmndwwUvOX0ngKa7X8EejE5OTGHFncaFDvBTfSmP1ziREDbZTembMpgXwtbOdb3AJ0hfXqkSXn+glRh/+Iu7hrH2NvqvhQW8/fgtnTV3xsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4090.namprd11.prod.outlook.com (2603:10b6:5:195::10)
 by IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 03:56:04 +0000
Received: from DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::e97c:4feb:6b7c:b7b3]) by DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::e97c:4feb:6b7c:b7b3%5]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 03:56:04 +0000
From: "Wang, Wenchao" <wenchao.wang@intel.com>
To: =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
CC: qemu-devel <qemu-devel@nongnu.org>
Subject: Announcement of aborting HAXM maintenance
Thread-Topic: Announcement of aborting HAXM maintenance
Thread-Index: AdkruWN7/corCmiuS9Sltr/aEfp0IQ==
Date: Thu, 19 Jan 2023 03:56:04 +0000
Message-ID: <DM6PR11MB40903663BB06C7A64136DF3587C49@DM6PR11MB4090.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4090:EE_|IA1PR11MB7775:EE_
x-ms-office365-filtering-correlation-id: 069d78bf-e2b2-4067-8212-08daf9d11675
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9L5NGthQZMc44btZRiodkj2JQvqZOWUgG11+YELwCofYDk9pe8pyLyZThPG2y0+N6RndMQUVBeeq06sKtqjNnj+Px1tmDyYX+wkGjmI+c3m5W80xp+hBGyBMYDc0IGyqMfWIm5g2bUeHl+/FXk2RphFkMRzAMXxb6fwTu6VqkbXRqavDp1Tp5hdo94a12yLRKM8k6sD2r8xbJiRsMdivvH1yXbt2R2bz3eRdLqwrE+YuJEttS06jTOqD8RknBJASFd+tRJKgWtYewmagE0YCxOsGK4mX9dGR1ShHlkxZOPJ/NDN/RiyrARoodNrfX5UEXdtNZQnTst8Rnox0U4vLrC57vlR4U1bhNsPDojuEwFcm8B7z2/99ZsciNHThw0CVzucEDSRUJIUNseYMPRAUxRPBdK3vhQUq/k00vvBRq/ZWA98wg7iu/7d6L+HcUTBdtSLEfLIB/vQzaYMPeKtTnFHMuOmCXjtiUuE4x0y3qPzUPiE+ZFdifeO7GRt3sMMW50j8Mb1HSdhwd3wayfDpMXinXd/fUwLMAICJ9pE82182dbLSQ03JgVcaYc+hy6B8VC5MWyWKUG1Cw0zIch9ttI1sVLRLsqUVmF+EVjmL7ZNKwwtcby2XPTcLMkxTQYEeYyD8uO9hMortxu5yWhGDpKZZXjpC6SaGLb1A+Ba35cPWgCiBh+/XCRLKFaA19jjlqSXY7uHn4R/Qc7d1HiJ/HA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4090.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199015)(86362001)(33656002)(66556008)(186003)(26005)(66476007)(4326008)(76116006)(66946007)(41300700001)(64756008)(66446008)(9686003)(8676002)(6506007)(55016003)(2906002)(71200400001)(110136005)(316002)(38100700002)(7696005)(478600001)(38070700005)(122000001)(4744005)(82960400001)(52536014)(83380400001)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?p0jpNkum4PxgB5MxJtN/5t0LVaOl1BGpQMHlNeOOs963G+OiOhEM4NE5vm?=
 =?iso-8859-1?Q?c4a3HuLkicyEwG4xi+JfwGn+Yi8HiNcKvLE+0iwpnw9Fvi5NA5a9bPSLS8?=
 =?iso-8859-1?Q?Hjs7NjD7h+IVIIWMyMkjswXiT3P6NA45KesBhfTrUHQbCwgPDwL/XYCjtT?=
 =?iso-8859-1?Q?WVN/5BzT0x0VuRa7J+Lq1OZO3MvwMzu7d52qGPcVqnZoPMhdaOAPSTnfd2?=
 =?iso-8859-1?Q?tuoYMEXYf00gjICvRX4GcPNCwwq4rKnxon7ukZ+NlDn2CiVAE7DNVOR9DF?=
 =?iso-8859-1?Q?NGs/aNCvMXwtnBFOLmmPONL3klhsFjdmfcnOs6peHIbpyODeyoIHtiUZra?=
 =?iso-8859-1?Q?Bvzm4LFt/QAhHN3TxT6RRIP0PNWFwTW+rLR10VcA+Idim+sK0pNA6A5ZYN?=
 =?iso-8859-1?Q?ypzty1hw6DRS9pds69JLB+LWWw8TJ+CzPWsXU9Ro2ZXLbgxJolwLbhzWu/?=
 =?iso-8859-1?Q?lceqa2m66rq7kIigH1+W98srtsr+M47Rm7lO+Fn7h/OsQvwWLwsyHwm4Db?=
 =?iso-8859-1?Q?KSwgllQBej2QShiXNiAcrJjAgLqeDqinLJHNn1F0NZHxNSHCV+bvSrdwIu?=
 =?iso-8859-1?Q?gFedYTZ47pZViX5UOMCRYB6tvo1zv4x5YU6XLzD1UTCnCLa3DdQHYknQ/t?=
 =?iso-8859-1?Q?+g/r1GfOCN+PqFbn/QQ+RH4OcZY8p/mWjMMQT3vEBGqWSX2KCKKKudGNHX?=
 =?iso-8859-1?Q?BIAFDq/Ir5cGNrIalqDmsAU2fsrnUCjfCBwdTZAbti0xRU57aU0eZgwlUl?=
 =?iso-8859-1?Q?mo3XCSgWzg461/7A9f7/Ldo1e4D3QzXRs7Q/a4F98KxwDz2zUEaikXEHCS?=
 =?iso-8859-1?Q?iEVGCk22+jzofcprvZj++MIX9LpolyXK66B/abcUbI23TbsBghYwBz7XI0?=
 =?iso-8859-1?Q?XcTO77Abjmxx5wkxmImDox69yifm72Q+envtMKGMX9B0L9QTyv1wn/KScz?=
 =?iso-8859-1?Q?b9SZ1OJ54NTolUsihn5lXoRp/8KI1DmAqd7spilXMIv3wKN/dvezcomjNp?=
 =?iso-8859-1?Q?0DjjKdSb2+e5bbTMaFWqlPc9wHMIfdlzYRg9TWlSUkx6O/sRv+ngqdnzBm?=
 =?iso-8859-1?Q?4+GSrGkG9P3prJiTHa2GF70njxuFVuXoBTHiDp3fPdXqAAX9fMOP2DCcC2?=
 =?iso-8859-1?Q?F3nza/k7+0nwwNZFxXbn8U9MdWDHfaDtqD9lOen7wGXHNwq4j9hFXU197n?=
 =?iso-8859-1?Q?pPHjSp0QthSJhzAQ8eQ0DYNNkmH95GW/wHCFL9gERoNkfSycJlbukPeP9a?=
 =?iso-8859-1?Q?OPgf6Fe7BS35rZoEMoyK9zAB0mP3vwrDY7NYtWrTTYWiETOloXGT4xcBPh?=
 =?iso-8859-1?Q?69INFf8X2pWxmHKfftEnENn2qsJhzL4PyaC3iHjEgbJYR69A6lEo6itg3h?=
 =?iso-8859-1?Q?EOQPikfwU0iCFcw5CAozJDRHNB5sPGL8st1AVOHEZeXkahwKkrKnf/hrSz?=
 =?iso-8859-1?Q?5ZbOEAMXp6YlFMpSg4YM1Caxvq3/Gxp9W1NhIxIqvW9F8VgX3DcCIi7aj1?=
 =?iso-8859-1?Q?rURch0PdZFBvHAOvUqrJTno4OeLHeejSA1WwgqdW3UYHBYCa4B6IU1V93r?=
 =?iso-8859-1?Q?lqbFeakbPI2eKISYdPMh1RXndGSNkSiquhh5TUMsSSW+VneJeGxyQ8/7Jt?=
 =?iso-8859-1?Q?MiWqUk3dQgq0zLDZIjvOE0goqoN/P35g5t?=
Content-Type: multipart/alternative;
 boundary="_000_DM6PR11MB40903663BB06C7A64136DF3587C49DM6PR11MB4090namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4090.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 069d78bf-e2b2-4067-8212-08daf9d11675
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 03:56:04.6471 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VGSX7arhQvN3PH8WIjMfSHrOjPjhaElI8AGdeBe1F+Yld8MbuBXReu6BoQMFcHGI1LxAvPMkivdb2rDoDrskJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7775
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=wenchao.wang@intel.com; helo=mga07.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--_000_DM6PR11MB40903663BB06C7A64136DF3587C49DM6PR11MB4090namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi, Philippe,

Intel decided to abort the development of HAXM and the maintenance of its Q=
EMU part. Should we submit a patch to mark the Guest CPU Cores (HAXM) statu=
s as Orphan and remove the maintainers from the corresponding list? Meanwhi=
le, should the code enabling HAX in QEMU once committed by the community be=
 retained?
You may ignore the patch I submitted two months ago. Please do not merge it=
 into QEMU. The HAXM final release can support any QEMU version, and the fu=
nctionality of the current software are normally available without known se=
curity vulnerabilities. Thanks for your support.


Best Regards,
Wenchao


--_000_DM6PR11MB40903663BB06C7A64136DF3587C49DM6PR11MB4090namp_
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
	{font-family:\7B49\7EBF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@\7B49\7EBF";
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
	margin:1.0in 1.25in 1.0in 1.25in;}
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
<p class=3D"MsoNormal">Hi, Philippe,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Intel decided to abort the development of HAXM and t=
he maintenance of its QEMU part. Should we submit a patch to mark the Guest=
 CPU Cores (HAXM) status as Orphan and remove the maintainers from the corr=
esponding list? Meanwhile, should
 the code enabling HAX in QEMU once committed by the community be retained?=
<o:p></o:p></p>
<p class=3D"MsoNormal">You may ignore the patch I submitted two months ago.=
 Please do not merge it into QEMU. The HAXM final release can support any Q=
EMU version, and the functionality of the current software are normally ava=
ilable without known security vulnerabilities.
 Thanks for your support.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Wenchao<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR11MB40903663BB06C7A64136DF3587C49DM6PR11MB4090namp_--

