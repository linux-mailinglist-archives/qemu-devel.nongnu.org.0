Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4DC66A153
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:59:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGOIw-0005L1-9z; Fri, 13 Jan 2023 12:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul.c.lai@intel.com>)
 id 1pGOIk-00058E-Ko
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:57:16 -0500
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul.c.lai@intel.com>)
 id 1pGOIi-0002RK-7O
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673632632; x=1705168632;
 h=from:to:subject:date:message-id:mime-version;
 bh=i5vA9RNJHiE1puDl5sXzdGSMUBvheF8E050kdaVCkuk=;
 b=GM+42kGGr+pNeM8RfvbaW/czgMahrcVacF5GWGvoBi4TJf5uc/Dvdbew
 znA5qmsXHqdWFvASxGfPrxC0uEG8zx3O46/lOK9MgutgdNc/+SrGxHcsX
 9IFggoq60WHKoTMTsPaRayX4yOmjW+UnL1+TCw4WjQJMI1OOJqzd1HfJ0
 b2XrBw0oFa5IXIgetNFsynA2hFEPHVKEva4HI60WAlXAjt7TRW8P7RXPU
 AQBS/XGDKDhrf4yZZSdknhtYQTbkjuyqF7lTC7Jib47q8hyU1eFaEbiRj
 CJI/CHqn4Ifwgqkats40qTb8aZRoZrOkkpYSe9lCFr7VoBRkvUUo2yzy9 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="321753817"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; 
 d="scan'208,217";a="321753817"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 09:56:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="903644816"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; 
 d="scan'208,217";a="903644816"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 13 Jan 2023 09:56:46 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 13 Jan 2023 09:56:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 13 Jan 2023 09:56:46 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 13 Jan 2023 09:56:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnNhvsvf1LN1bRqarKJFePRVqeQf/uGLK1hKqjtLSbmX0Ekwj2SqISf7VbNaf4u8f2531Ch71GSzYepibrAYesfRNe3taanvgz1pwPMFVcrlXdQhCeqzVLSxlUilrEqqr4h/eMXZkeJwSLL58gRS3XiNeBcWBWe++PrBQAkyuF2nLOQVLND66yre2xOP5eAs+KKgIIW40Kyl3MsnZFSEblq2wsnT4HN2p163Zj+zQroxJ2ldnt7YWudiqAvLMeKDT9mvk3oR/5K2IhPH70M9F50BfZbDuRYh3wK0WCx8C7wj+lHNU11+lGLenb1vYJom1CDvsLesPbokE4rKXT0uvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6eCVD+JSnbWFDVlsMw0hzdzvCo8WMaGANq/gHzJgHU=;
 b=CDCoFGJSL/Rr/au4M6gd0nAfdkIB9Qd9iNVZBcAngE31IdElTahHaWhlhEUDVDk8DvSHtgjWzlh2MoNIpPpL1NMDTZVawalaz5WtR2U4CVEJTVEDgmGabTthMTSz1cdLvTPASuR4JletjihHYHyJ6IMWrHyFbDqIoyyylTfkMyDEIg6YJ7Wq6DK4XcUsatWh2Br6W+tZjp9ZIPTtFldvz7bdgEBN9EYHaKdMqnQpc7rE3nYnVwbhr0PllBw6VT4wVNo3Jk8MXDKOvoLwx1Pdcon+UjTlSDxBO3RY+dRI9iCMg7TFCh5Hu774Muw4cGqcjDN47D1lhhGIqBHTOo+NPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1740.namprd11.prod.outlook.com (2603:10b6:3:112::7) by
 MW4PR11MB7127.namprd11.prod.outlook.com (2603:10b6:303:219::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Fri, 13 Jan 2023 17:56:43 +0000
Received: from DM5PR11MB1740.namprd11.prod.outlook.com
 ([fe80::5f4f:4fe6:7aa1:b280]) by DM5PR11MB1740.namprd11.prod.outlook.com
 ([fe80::5f4f:4fe6:7aa1:b280%8]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 17:56:43 +0000
From: "Lai, Paul C" <paul.c.lai@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: unsubscribe qemu-devel@nongnu.org
Thread-Topic: unsubscribe qemu-devel@nongnu.org
Thread-Index: AdkneGM6NKteIChVTQajGGXxCf7vaQ==
Date: Fri, 13 Jan 2023 17:56:43 +0000
Message-ID: <DM5PR11MB17405FCBDCB64287773CA11AC0C29@DM5PR11MB1740.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR11MB1740:EE_|MW4PR11MB7127:EE_
x-ms-office365-filtering-correlation-id: a6d0a9de-f850-4484-4bc1-08daf58f87f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4JzD9aBMutplRQTHCcKEb4K0Hm9lcEYmCAwDmFR4z8liVZJHyMLAvXTBzM8Ap0iZa/cTsrHzvVZ/50PGyD9J1rU6t8kWvMJeGM+IRlXK5d5WJ+0Rw+XY6SLzArCqoNzE6isitvUkyM763tehY8ro/hlrYvks4q02HP5nyr+LVwnm56a9gH8UBCZ6SA4Rgnq7O+Mh1ObIyjeZNt6JfHhVYXfGi6/W9tZZVoA8oLV/WYhjLMT2NwWmwibzaUYHwBBlJlCtG+UiFA6uz7rnFM58tUaMKcFLKAk7gcyPS5TYIMVXbOY6Rqre5Nz1GyqTG6j7YcCdHSqq12cyu0yrXMVg1HbBoUr7AVf+2NVcr+R/nzA0AkkGMvdcwaxwbNe4UQ5GK2++tbfSGqMlf9ql8LwHAa+MwV3GZR/DflbNW+I7Cf1HqgM8eHYL8rQJw7l9m1ONLOXhr7e9at1PU9jOKYqIefs7isZmM5Xn1dNkJLR2SpbNKbMdHyO+QdmjMsLAOkedRnTzaf857dBfdq/v8Q9RkLUZM2tMlcbXc6EGqhabHHS/CX1RtMvQUYNw1QeJFFCjred3wy2hiCKjcqa9xhe07svYRDn7iXum3qj5LXWPnPvNfGzVCtOgdwiP9iKrNW8HF/LIf/OYSH9fl7pAakai81Br9q/Geeq64x0L9KzuxSjeD4zW7KCyaxLzQlMBRHE9gQqHhCD4yw8q1FUwaaNMDQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1740.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(136003)(39860400002)(396003)(346002)(451199015)(4270600006)(66899015)(2906002)(71200400001)(558084003)(6506007)(26005)(7696005)(9686003)(186003)(478600001)(8676002)(66946007)(76116006)(316002)(66556008)(66476007)(6916009)(64756008)(41300700001)(66446008)(33656002)(38100700002)(82960400001)(122000001)(52536014)(55016003)(86362001)(8936002)(38070700005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?evKlpamP9tKpE7fZ+kxtfCCB8rlFeBa4qEcmLEdz62rimuIg346RmR3tNj82?=
 =?us-ascii?Q?pgVngNsTjWbAXWsFQrSVymqzvcPFEVIMle46H+Kz+wJ3R2t/N+GEpFlnJlVR?=
 =?us-ascii?Q?Gpur//XVdSwzB3jjT5zeg7XyfDulw1HkzYEMR9PbcBPdWIhG5ka5gbZ2CJp8?=
 =?us-ascii?Q?f6nYAoPFoBfM54oF27kkY8X0mAqLJVbaSaJCAJ4R4RxDiOiMDvi8g0/De/Lf?=
 =?us-ascii?Q?PnxMl39P/fLnrsG61nq3Z+iXH0y51bB+FyFsL7bTHPnsIt1LbEML+BI4wZB6?=
 =?us-ascii?Q?cfr1PNJRE4zHcmnK1/gdvasC6VqibIKg87Z80laMMquzjJi0zstFJazMLvPZ?=
 =?us-ascii?Q?B3Im3tJZFeffc2uw/GppkgNb+lZWiKVWAJySQ4xW9DdIoAg03Yn7+VFu94hK?=
 =?us-ascii?Q?pOCSQ83TCGwTO6c2lJlD8TK3AiKBxjk8wo77EFAC+FC28V702Rp6yQ70pHDN?=
 =?us-ascii?Q?qbqe3WIwLh/9VanFUTYDTnPFmhACigUQYPnKVREbDv6km3vlFSkMsJAfjUSv?=
 =?us-ascii?Q?/jSYLMGCo4+FRF/Kbe3Ife2t651Kr+rKH3j5YaoX0zQcrUTuivcvo7WLnv+1?=
 =?us-ascii?Q?wDujGK/1q8x6toWbdsUEuAReJIt6OmP3yje+dzhfEaDIvG4cmH28OsZkoImD?=
 =?us-ascii?Q?/mOK6W+HmRRWWU9WqIWzkWUjmDXPP4Ns3JxxATbddp5HuRZK6Khb7XMA2bvV?=
 =?us-ascii?Q?VbHLY5P57Qak6ZXBMyIeLbrQQ77A0jjcChinBk1wdEtV28nxPuVUrmDU7E0/?=
 =?us-ascii?Q?gC7XjC4MIC6wN0XNqixVviKiYCe8bFaOq+ouGD+4MQPUiwr4jNMynxO1+bdf?=
 =?us-ascii?Q?RpdJsrJRLSBqNbkQYI2XoeUFl2epn+1iOwEqP95XBhqw0Q38S8nqxOmVUANE?=
 =?us-ascii?Q?Z7K3ZxBTTFnBk8lpQDupgzvXH4LG50mv+V8lXcNU71yVXx8Yjr4zZSydgrdI?=
 =?us-ascii?Q?tTB7hj5ro/nhkJCfpzFY0QX1Q5hSS/iuPJzoD7xMeHW5eHzRkIK5vd31qZ4a?=
 =?us-ascii?Q?oHTWs/CgWOgGcE3plsUX5V7tYUl+fE76YKSjaBtGZ5J4Utb1uYh78/FsVa0W?=
 =?us-ascii?Q?nyFkQ+FKV8/1189pn3HbosUAuQ2OoZO6F1aOzK/NC42pRKmURbt0QWhHAfSH?=
 =?us-ascii?Q?vuCh0SRE4AZtFTBq1J9dhsFYPgqodOPLnRViqybqzqeFxLq3+Ojh/9+sREvc?=
 =?us-ascii?Q?ZvlKW+cVuddtIUjhtPArHu+fqzsjFy8nXragWC6iqrnyQeFYR9g57+yVKuBz?=
 =?us-ascii?Q?qgZHbtDkisYJMK12PwsvWUw7CSF5XScd93WEjFSi6eo65o3HBkj1AoV5XXMh?=
 =?us-ascii?Q?eNKYSmoKqJnGcjolKZh2g6gfFoEsImgVT7+csaX9lRXaLkgeuBYywd8danvu?=
 =?us-ascii?Q?4AtiJzl2xA8hMbuLgQTh/iPVVvBEHCUMcOWzqMMt6ngxAlPgofr8hq79SLtW?=
 =?us-ascii?Q?i6sQlRPJ9Cy6xEAWGT/kLnfebBj8ISL0eiEB/Ksu7xXv1RNpnEXq1kPjMi2d?=
 =?us-ascii?Q?2IClEN/bTzzas5mdkUMBld0my7pbFvH9s5ajFuRZV/3KDuF3XnHiJ3CHIdg8?=
 =?us-ascii?Q?AV+xiz15aNEATX8TEPNQ3svzDm+RZcodIgbme2sN?=
Content-Type: multipart/alternative;
 boundary="_000_DM5PR11MB17405FCBDCB64287773CA11AC0C29DM5PR11MB1740namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1740.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d0a9de-f850-4484-4bc1-08daf58f87f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2023 17:56:43.5965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BL7U1s7rlM7AmQ7VunIn7siJv5YigtIGakOXjRqa9yeFZdyizeby3c38aCWbvHG/9kmJkk+lhvoWGlSZYxdZbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7127
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.93; envelope-from=paul.c.lai@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, PYZOR_CHECK=1.392, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=ham autolearn_force=no
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

--_000_DM5PR11MB17405FCBDCB64287773CA11AC0C29DM5PR11MB1740namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

unsubscribe qemu-devel@nongnu.org<mailto:qemu-devel@nongnu.org>

--_000_DM5PR11MB17405FCBDCB64287773CA11AC0C29DM5PR11MB1740namp_
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
<p class=3D"MsoNormal">unsubscribe <a href=3D"mailto:qemu-devel@nongnu.org"=
>qemu-devel@nongnu.org</a><o:p></o:p></p>
</div>
</body>
</html>

--_000_DM5PR11MB17405FCBDCB64287773CA11AC0C29DM5PR11MB1740namp_--

