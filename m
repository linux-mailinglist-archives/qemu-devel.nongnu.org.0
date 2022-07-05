Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D21F5566072
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 03:06:09 +0200 (CEST)
Received: from localhost ([::1]:41802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8X0y-0007tz-VU
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 21:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shirley.zhao@intel.com>)
 id 1o8WxN-0005O2-7q
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 21:02:25 -0400
Received: from mga07.intel.com ([134.134.136.100]:39368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shirley.zhao@intel.com>)
 id 1o8WxJ-00089I-Kg
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 21:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656982941; x=1688518941;
 h=from:to:subject:date:message-id:mime-version;
 bh=Y0me+T/AumdqUJmQngXef9aYozXgKa7iKFRBBCUkO1s=;
 b=gXUXdmX7dNkeROGOBbybuweXBpOQQwfurNtD7vEYIXv38F0uz1AZJGvP
 jVE+Sg4fEkDULAnex0d1q+IxEhZX+YfMHuMVHuUgn2R4inUzS8caSiLaM
 ibjxHrsVNyq541+bgeGToeSr92xvkdoAwc7jiKH9GPJDll/PBW5v1GMcW
 u6TA3Fhz8la2BVrYk78SKDVzam46nP6fUcWG2LHIWYSupJ/HblwYw0Mm4
 QM35cWr7joKxKn7j0DUHU6GCgVIl7TgralNFXqsgF8JLnw2RihBwjWlnC
 +GhCZSMg4so3FW/maaiGQqoEheazaG8kex8A+bK0KNKy/BTLKcWtDKnO4 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="347198902"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
 d="scan'208,217";a="347198902"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 18:02:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
 d="scan'208,217";a="769468301"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 04 Jul 2022 18:02:17 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 4 Jul 2022 18:02:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 4 Jul 2022 18:02:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 4 Jul 2022 18:02:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvMPQ1CQ01TrPNSSbvXpUK7dpG9HPwPwxhcB4SBGrqhwRM4wEjbZ6gUMrxfdXloZMQJa7MG9wJG1S19QEkl3paxDVJcMTiPmHkOjaPg323kRvsb4kkVKRSNVWsQu8Ou2lW6yuIVextEEJt3OWGvkIFDVj0w3uASAA7Pg502NJUsQeKWFOtMKL3oLpdGSEJVX4xisSgbSB05E7bS5P0+lBKcZO8HYRSwUxadSzUbCSAhS65LggRTCGcFXJW2Jd96q4jddhwyg0j+lZ07e01bg31h4j2VPm4QZSp341fm3eOnrkeoThoyuvF/2ckWvPjd3x6Oog6NBGoEmqW9qO24hdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rJnLrdzIE2cSFG2jDoXwmyietNBK4QfbaQst37It30=;
 b=LWsIpooxnsfQseWhUcUR1WAI3u0Lf46OnqiDjKdgtcdXNgT45hc72mHJhDtSmcn9i66nFNR+G6q3gjnfSf9EAQnuOGL7i0+pOG+UjVsXZG0k0adGsZW3Jii3prbCUAEUnSWE94w/zNABYtYWryUdwuAf+9DDrNBnebndR7sDADv6do5tIXfzuoawZihlk90W3Y17QTmKaIlu3EbOIQT6utyYAoDySXPnZfpzifXK6dLFilsBBCmYhhS52oNbKg2QaXAcd0FqWo+sCUkxdb8D6g99irh71goovghROxbTli/tAcCJe6gt7QJLT7lRb94KKNQTF51lg1Ru4XsNCMYj8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4291.namprd11.prod.outlook.com (2603:10b6:a03:1c2::12)
 by MN2PR11MB4046.namprd11.prod.outlook.com (2603:10b6:208:13b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 5 Jul
 2022 01:02:15 +0000
Received: from BY5PR11MB4291.namprd11.prod.outlook.com
 ([fe80::1d37:60c1:cfd1:b192]) by BY5PR11MB4291.namprd11.prod.outlook.com
 ([fe80::1d37:60c1:cfd1:b192%4]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 01:02:15 +0000
From: "Zhao, Shirley" <shirley.zhao@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [Qemu] how to use viriofs in qemu without NUMA
Thread-Topic: [Qemu] how to use viriofs in qemu without NUMA
Thread-Index: AdiQCpaHJJlwUwhPRyeyoMxZnaNd+w==
Date: Tue, 5 Jul 2022 01:02:14 +0000
Message-ID: <BY5PR11MB42911D5BF55D9FAF501F64F68D819@BY5PR11MB4291.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6fe710d-542e-4bb6-e305-08da5e22001a
x-ms-traffictypediagnostic: MN2PR11MB4046:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aHDTvvmvA+VTw3N11AZ+EUlmxzaCYAYbRxR42x5aDyKvQDYjse3r8nNHpKQxmTv5zw3EUoDt5m0p30VHcLX43qHKcqzLZHy7SSfJsPS7Cmj3iSL5Ht4AGj/AOz+xNrp0yFKtqQhJwKJMPAu9hf+abddAC6O1mwkLPSbXlgPbVqju3xyOrSgSYV2UtBvhyXqEcFKfit8rDMNifJLQCITJc+2rP+oi5DfazTGGwjDRkLNhOaUy4lImhkFG3+92yBu6Hwi+PsFmYURxs5+ApIe1HO1wu0wIC5c++KOcxNKzOhCqKLDlim1pNPniCyqeBBQ6LjJTSSOseYRL3DrQ3AT5j32/IDc6gWECEnGHKSqNeQTwqiH8+wCXh0y9VUqdsuoWVJyZr9fQFjQfXsviR+k2cEIFwdO6CtAfpCq6RfpAYKILtbIHQnFPMvKPlRy0dkYnIS6vCivuV0m6u0JI9ohup/6bAfGXHqWtAjtfGfflK9G4eGpkI4oLCcPdgB5U9cQTL9bjaLzGHUDseMJXzhIoEpndCsUqvBtplLRiBUJ7pBw+UiI0PRDPxeoU0jcUlEmeQ8+3OV7eGeA/fdbu6abAQ9NZTl0m5pTSVGu+9Sw1N1vwP8w4ky8O01G6eAku5aIQNNITHQIuLvE9Vgfdi/KBLEMziX0V10WjBWOQNzTOfRG1WNvKoO/04UjvRtigUBnKHIyy/jsuHFWE5CT/5SyVKynEiQNeLhNXyTqszoWML8pT94iqEZLGRSG9MEpWc66407dUDPuTArO7ssvCaS3mmA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4291.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39860400002)(396003)(346002)(376002)(136003)(186003)(55016003)(6506007)(66446008)(966005)(5660300002)(41300700001)(7696005)(66946007)(66556008)(9686003)(26005)(86362001)(76116006)(66476007)(6916009)(8936002)(82960400001)(478600001)(316002)(52536014)(122000001)(71200400001)(38070700005)(64756008)(8676002)(33656002)(2906002)(4744005)(38100700002)(21615005)(166002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zfLvGjxL/3YYHGmD09BfprznP5zz7/M12bzq7A4ax2ERXOUdzCE1TZ+uIDww?=
 =?us-ascii?Q?6rb/0Oe7xXGstYn6W936c1EfI+hvrRckhh30fpJQnGllHnmB5xaFuxop9tc8?=
 =?us-ascii?Q?zsUbonCvp+B3wO/HQSA74xhCPFRyzA42plnQOoNu0p0jYYdhod0nLDdgxlCw?=
 =?us-ascii?Q?vmCl5Q4Po/bd0njJFT/tSq17KgpDZQglxxkD+y6XcLDkuIJQQi3oco49kZpf?=
 =?us-ascii?Q?4dX5wnbDbgzQL28OK0PRE8hZbcD6LBl4nNbwFsxMqnyODB/Ij1HPIBdH+4zn?=
 =?us-ascii?Q?ERALy6yGP0e54WEeWlnYj9Hc3Hu8Yv9/aK/OdUQiWIvZboogAsIKdwfNcrvE?=
 =?us-ascii?Q?3qJ5w7DAGmjqPAJfCwvqsPFgKVvTMJOeZm7DlFuUw7U/Vq4D+OiaURG8HcYx?=
 =?us-ascii?Q?oRVKf9xnsa4dBDmQbIs12aNHUb1OJcCDPI0DZko8Vm7qST8TzjiwqoJAxbOI?=
 =?us-ascii?Q?2wXhH7irZ7BDQfquK8Hu0uUM3UI0Kd9VjRBPix3W+r/GUZU/p/4KPgXSoU2z?=
 =?us-ascii?Q?Om8xTjtIXnhM69Kb+Ei89liUtc9caGfxsJPR2ZfPGD0eGmO0iK1JkNiNZmQr?=
 =?us-ascii?Q?cQ6DpQWnP3RGW8ABX9R84BelhmmHFQVD6J8Al44pW4yLXNRL7XRobP4XW5Lm?=
 =?us-ascii?Q?o898i2WPG3I6iFQMh19kVz23/izR55YkvPut97N+u/TpKWwmHxMNagwY+34g?=
 =?us-ascii?Q?kgbYYVuy0TOTi0xc1bF+zWV9XvU2OzVaP4snIoPx9Cr2TTY6uN7LQAhWmVqb?=
 =?us-ascii?Q?wRkSL42W4A9Z6jboZcR9w0uggvgSbabWQMQoZYH3U+MMfMOQWgynsznm5O2A?=
 =?us-ascii?Q?3G+LyNvk3qsErVWnQuCZ3Mm4RgQ8FA4ET1zl5pRXL3anp/fKozViYQgyeS4g?=
 =?us-ascii?Q?UhYrJ3+0uTfaI0SeeNv2O+kK7klJ6iFLglfPJ6mN6k2ymPBQcdjFYn79Xjvh?=
 =?us-ascii?Q?+ClB/kPP0EsJ9T362fv3nEx9C9Aec4evMBI5/wg8pF1bn8oEme011jsIR4Tq?=
 =?us-ascii?Q?50HeMYeO2b2Yz0nTEYPdDKRbBWaPZufR9lZsqCfYlTovKYTgKgf0/2dJXLfI?=
 =?us-ascii?Q?mBcTRAX1qgnOxWz03SX1KJ2IGulzEC2Qqoa/iTstftT3KSLC66VEzmTOIzpf?=
 =?us-ascii?Q?GDd5HP4CKKC0whVOfL9MXnsFkyQi59RjNeWSQKB7peujIBQRmxsNFaAIpId5?=
 =?us-ascii?Q?9aia+eQmcJG3786QQ5XY8bMT2yqhDe1d/BCb3PAYFkfn3pJim6ywfN/YzOBb?=
 =?us-ascii?Q?v3M+//U4N2RvBTNPVjzfmUrVV8HECyuAUbyRjYW4J6gF6jfSGwENZNVqxvoL?=
 =?us-ascii?Q?Ry1qFs2ruDc9gITRzoZauSjliogjxdtXOMsImmeTZb72ZGAj+tVWTrG9yQDY?=
 =?us-ascii?Q?ORYtCjlOstnrGAFyR0rbqNsEy6RSt20bQJGo4YGlg8ZkhUC0E8NjqwgkpQCL?=
 =?us-ascii?Q?gLW0/BVbAGVFpUw5rsNTnXn2FLB05cHWHXn+EHclXB74plKBk9rKfuh2rsqW?=
 =?us-ascii?Q?UK84XO3p+IyiamAV/prKC9cKZphYUHaSrjUBcTIHx/sPMt2DO5X4dZnUl9Nh?=
 =?us-ascii?Q?nFkzxpJq606C3bvUbuzYGhAOAyaUzzPMXasyhWTd?=
Content-Type: multipart/alternative;
 boundary="_000_BY5PR11MB42911D5BF55D9FAF501F64F68D819BY5PR11MB4291namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4291.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6fe710d-542e-4bb6-e305-08da5e22001a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 01:02:14.9382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IQl0hRW4i+f6WrDpyt61fv8DTRQTXqKe5zaxyl+DX8Uy/qu/SKvMI8E0eDmgE7K1Bzkd1QV7eKb7s/eP9Tcgeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4046
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=shirley.zhao@intel.com; helo=mga07.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_BY5PR11MB42911D5BF55D9FAF501F64F68D819BY5PR11MB4291namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, all,

I want to use virtiofs to share folder between host and guest.
From the guide, it must set the NUMA node. https://virtio-fs.gitlab.io/howt=
o-qemu.html

But my guest doesn't support NUMA.

Is there any guide to use qemu + virtiofs without NUMA?
Or does qemu have any plan to support it?

Thanks.

  *   Shirley

--_000_BY5PR11MB42911D5BF55D9FAF501F64F68D819BY5PR11MB4291namp_
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
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
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
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:343015835;
	mso-list-type:hybrid;
	mso-list-template-ids:1888376514 106565326 67698691 67698693 67698689 6769=
8691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:DengXian;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
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
<p class=3D"MsoNormal">Hi, all, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I want to use virtiofs to share folder between host =
and guest.
<o:p></o:p></p>
<p class=3D"MsoNormal">From the guide, it must set the NUMA node. <a href=
=3D"https://virtio-fs.gitlab.io/howto-qemu.html">
https://virtio-fs.gitlab.io/howto-qemu.html</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">But my guest doesn&#8217;t support NUMA. <o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is there any guide to use qemu + virtiofs without NU=
MA? <o:p>
</o:p></p>
<p class=3D"MsoNormal">Or does qemu have any plan to support it? <o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks. <o:p></o:p></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 =
lfo1">Shirley
<o:p></o:p></li></ul>
</div>
</body>
</html>

--_000_BY5PR11MB42911D5BF55D9FAF501F64F68D819BY5PR11MB4291namp_--

