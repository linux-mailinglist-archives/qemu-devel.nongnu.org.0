Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C00672FBD
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 04:52:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pILwl-0003DM-VC; Wed, 18 Jan 2023 22:50:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1pILwk-0003DD-G5
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 22:50:38 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1pILwi-0004mP-Oa
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 22:50:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674100236; x=1705636236;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=zc3I+1DQDOJe0C3EHpz1NPWJgjmCF50c/4bWY5E2WEY=;
 b=l/CTI/Nxa4aUDKRc1S4c18NEdMXHG79GtK2wLWXWXeFCwznLXgzDH6IA
 sh+oea3vZvE1TmCWN6wF2H0eD9UfqkGPp2IsquKi/vZvWVUXt9bYP0WzR
 uXQh5QpqnkYgxfEpb/KqzGHxKXkKAxt1kKxezTFiIcUg2pEns7z4wi4xM
 neMLDHnOxlqkaxRL2jBqXaAOMXLwwuan5NgJO2RMlrBzOWnF2U9u5/bf6
 Q9Tu3wEkduzNfnAY1dXrWksZzkVPAi+7cYsZaojYVHH3xsteZMP4k9ckg
 ShBgb1Ww4NKAhL/Wqa/IS5g7lfYSMCblJoONQZeJPs2L9g6abtXZ6L0wx g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="304869036"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
 d="scan'208,217";a="304869036"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 19:50:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="609921571"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
 d="scan'208,217";a="609921571"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 18 Jan 2023 19:50:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 19:50:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 19:50:26 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 19:50:26 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 19:50:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9p3VAfJrrn2V+s8hrtA7brdWtSVIwXE9Yqj2f4T9xwbfkbWPxydwo2UlLpZ/Rai4QTTq1SLr6CGoEF/Fl10qT7r8bKBzprkqPVWi5D3hUHIGeNPt7ssGJs2JWeaD7llcZeMtjS2uWi2SGkcOHREZ1U1RJGtqywBmaPmu4hbqW5NyMKXmX+HMo6QBxjD3XZMM0qhlCCNGYvaZ+0T7oFVI3vFolSijAFV7BMjHp55+bPLGbGt3A4JPH0/Rl6d4DRm0SCGCNWPWHI6pr1eHOlBrxsz21sAr2B3SIoVfBGCtgDE1RP3E30t9r6IeCCsyTrrTz2ghh5e5hNnLH5/fmoCuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=np1vhwLXoWwm9c3Lv0hm2jYxzAMWvmnxeK73SThkgzQ=;
 b=hCKF26bCjNFmE7yMsvvteOcrZaTRA41KwiwUIh20jDgMNL12hr6PYUuTbdGv9y8ZfSe4Pv+dETn2F8USZe6lg00qnHhwSDgR44xqi/Me0chA70MH1vGd7POQKG1I2wosdAotGt6++Ma6EgPMFtaOo8pqOv1nfsoXb49ujojGgivMgEnDDCf2IybI2a743MGddA6JV17sBg3TLZPj5fQM8geCN+0wZCLIChU5ALJwteRnWoQCsfUloOhhFK7aba1wO7aTg/4xVKbOeXObZbLkBBN+OXFrHfCagRswZO5rimNJBiIzgGtalM1p9iZENVmnnYNT9OGyS5RH4LHxBqtzfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4090.namprd11.prod.outlook.com (2603:10b6:5:195::10)
 by IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 03:50:20 +0000
Received: from DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::e97c:4feb:6b7c:b7b3]) by DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::e97c:4feb:6b7c:b7b3%5]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 03:50:19 +0000
From: "Wang, Wenchao" <wenchao.wang@intel.com>
To: =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
CC: qemu-devel <qemu-devel@nongnu.org>
Subject: Announcement of aboring HAXM maintenance
Thread-Topic: Announcement of aboring HAXM maintenance
Thread-Index: AdkruGaFagoxlwaURUOFDiiA74RJ9A==
Date: Thu, 19 Jan 2023 03:50:19 +0000
Message-ID: <DM6PR11MB4090FB181F89365AAD35AF8087C49@DM6PR11MB4090.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4090:EE_|IA1PR11MB7775:EE_
x-ms-office365-filtering-correlation-id: 1da24112-39eb-4751-ac8f-08daf9d048e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LFElthKLb5OSKIqS+ofPSdSoiyryTCYyT9eViCtsCmY6qrXGg94k8yyPiEx9UmbCIaBTCBqY+ZwZhS3c45dNtSMUAkqnBFaU0NCF4bS9od0J2cv83So/WwcmxReZMLxJu4rWGMW1VRCQ7RVgM0mylyCkDJUwqlhzKxKJJaYA9r4RsLtPeP9ldaLzWPB2sWsR0oTGDJu1wNgTeMv4vy1Kr5leV/hb8zejd5EcR5V+YFFeJrba0G90kV1+aLorbeIn+OEig1LZCa0mON0TYLHClDDnGLGNz5AoPLJRz63MNn8P2loWkYjezFE1zHWlbItT5LeOXD1GhAuVag62KTWIKixD7qh+ppxvfXiISdvt80SEFkdgnBN/y/IbW4Fz48BgGO3mFKnhwydr9n+AKrac/ShLAe5bJO6hgAF2UKFDNLFVD9IxH3mJXygegPkDfwQPbGNpj/MrPJQYwXykPBNAXOdmfRmwFliKUqFqE0UeTDExocoMDiTlNPKGGjWe4YEDS9VvNLZTck6Mf80xL4ICLYg0OXNFNmbhONRsu56j0FhVqYgrRm4jltc6SQdmycZ0rRvVXIAHwWfNh6rS4tUiIlGfYQGkqYGqSoJTHGBKr1vD6XF9yE6wwb4tdJ2YYxMgi3jmhNM035UL8mPZToMBMokrXtLZS8UB7CjFI4OPR9skFANoSY+A9tqGuozL9l5wF+TwqJ7fcMBQxoAJhq2N1w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4090.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199015)(86362001)(33656002)(66556008)(186003)(26005)(66476007)(4326008)(76116006)(66946007)(41300700001)(64756008)(66446008)(9686003)(8676002)(6506007)(55016003)(2906002)(71200400001)(110136005)(316002)(38100700002)(7696005)(478600001)(38070700005)(122000001)(4744005)(82960400001)(52536014)(83380400001)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?fVI8d4q0Z8/hIqWhO6alkBnfVuGN8gjkgdUJn+kPa57gYRRMJa15y0S/rr?=
 =?iso-8859-1?Q?9+grF3Oh1izbwh6Svz1IPZDWGNXaME2+p3PR1HPH+kv7Xs/2DlVik7GopW?=
 =?iso-8859-1?Q?xihu1pJCez0sayJvqokJFr8+kvux0MNoh3sb76fEH/PhJIhr9I5NHi/JHl?=
 =?iso-8859-1?Q?5GlvQ/joHbVMuJTuKtswNvoDb2w7wgnZEFUEPbn01NNwVVmpdTKqt/qMb8?=
 =?iso-8859-1?Q?d2ZlqmcQTFbPqZULwTmVQVjCVjna01oihoQkmkJ4f9Jj/3U2mBEbimX7Xm?=
 =?iso-8859-1?Q?rR6+H0eHVtpyCPd3tE9gY8OdIcYLLfGxIj+Swxs2YCJwYJ7wkSD6D0XJqT?=
 =?iso-8859-1?Q?hgfg2m6Xaef0XlyGyyMREYphDQGqlsbEADi5bW9Y/Ee0TUbiNRkU7yBWBU?=
 =?iso-8859-1?Q?wqEVu+ur9uQPZtDwi4Q8Zd2gWgEUF73u288hy4TvNhJ/lB416IpStJsKe8?=
 =?iso-8859-1?Q?r3gaHlBqNERghSaQTyN7rbtwXF9QnS65O1GJskXEwor9wsgfUHDYIfKl/u?=
 =?iso-8859-1?Q?gcck6EyMZBJbj41ogc7r6v1T5Cl6XnXuqYvDAnikmUbGY0M39uuJnghSIc?=
 =?iso-8859-1?Q?D7C+xwLNyjfZSOem2r7h/U48Ou3h1ciKtWwaYW3ESbwWmr7mIJvvDqyvyq?=
 =?iso-8859-1?Q?1+xxDTcddkUTrKbH1fe34CdCctmJ8mh2gJcqCVvePOXJ3eUI2nJFAdL6S9?=
 =?iso-8859-1?Q?KcLYOl96ZxlTOQ+fl1KsL1AljuaNGfvypZ2ojEX7PYFd3CukfB8ltXR/Es?=
 =?iso-8859-1?Q?mwWwh709LkvAalVZiOR/KzzlNbieZnqBsOBVAagpaMZxfiJ5K0Z+GM1pUj?=
 =?iso-8859-1?Q?ep45py2ltdmtCeMQPd0ouSGnwFOd/kZO1l2oRwN684o+TJv/urINQOO8af?=
 =?iso-8859-1?Q?LQfsLEwV6uH+F8K3lkrfUyJi0qDiigO610NPFYxii112mzAVkOYFDAcU8R?=
 =?iso-8859-1?Q?PRqF2YLyjdyaa4CVQbuZ67tvACF2n8oRI6x+EDPLbv6lHguWP6M4/0xNrd?=
 =?iso-8859-1?Q?5JhyOOgDOd75lpUZT9sEaCI1Q/KId849LLgdsAVS8SyVtWJ3rWnZrbZakZ?=
 =?iso-8859-1?Q?ba18NC30rwfUpdwaQtOFfC7GK8O6t0YmmiB/T6wrDV58sHj058kNifBiev?=
 =?iso-8859-1?Q?jB3Wr+90YWpNstB80G+2vUr7zAWEQwGHTbPl0ulHIslN74Q2ZUH3JFrj5k?=
 =?iso-8859-1?Q?KghG4f9MW8gON892D8PePX9dBe8cnnNDtUuMU2Ch+iF0eipI1gMeHlSvev?=
 =?iso-8859-1?Q?AORcniUj7g5pQJArmEz4c+rS4vFySC+3ATdfWDNwRZ3Hf57ZS3MHnO0nz0?=
 =?iso-8859-1?Q?/4gyOQPM4rCgb2NIIdkW2QiG1HghYuOWzhTX3Y6nnVEZOUVVTIBw/xtvft?=
 =?iso-8859-1?Q?K/wHpyeVX3eurVhJovH4cbgDyu+aCaGEvPAC8PrHBXXtY7f/4Tglwc/0PR?=
 =?iso-8859-1?Q?mDXqlKlB5hStS7F5KCBK1PLnryzI/nAqS7u2u7iC6LFvRRf1ZBASqAHPXu?=
 =?iso-8859-1?Q?vEjpXBdoVe9LjmltJS6s8pS1r7wHZssoIMH2tpVX8P78PTer16e+gB6JJt?=
 =?iso-8859-1?Q?/4mc9eK83rCkU2GBg8aAYh99p6Q7r9zniceNtHe8pc1X2I78WMGtq7p5Se?=
 =?iso-8859-1?Q?h+oQ8OOG+My2Mu8OLSd50+EQ9ZVPBdE5yt?=
Content-Type: multipart/alternative;
 boundary="_000_DM6PR11MB4090FB181F89365AAD35AF8087C49DM6PR11MB4090namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4090.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da24112-39eb-4751-ac8f-08daf9d048e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 03:50:19.7337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 95tTCFhaDSbvjtR3uIaUZ+rtHBiXu/bwue62IvxW3Q6B8IdXpmzLusyZlu1XjDfkQ32re+BSK9hUCMsHKnpRJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7775
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=wenchao.wang@intel.com; helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

--_000_DM6PR11MB4090FB181F89365AAD35AF8087C49DM6PR11MB4090namp_
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


--_000_DM6PR11MB4090FB181F89365AAD35AF8087C49DM6PR11MB4090namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
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
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
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

--_000_DM6PR11MB4090FB181F89365AAD35AF8087C49DM6PR11MB4090namp_--

