Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE6E4DA718
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 01:50:41 +0100 (CET)
Received: from localhost ([::1]:58400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUHs8-0005to-9U
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 20:50:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1nUHpa-0004bl-KN
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 20:48:02 -0400
Received: from mga12.intel.com ([192.55.52.136]:55401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1nUHpY-0002LN-2u
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 20:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647391680; x=1678927680;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=BJvpNXGjgfL1+bvChzAGk00GBE5ma7dAfHl1KBaUmes=;
 b=j5HG0kJup2XjcRiyM4Ey3oV0ljJefiCvqKKAJlZ3nvdZw406W1v2FCvf
 1tJLzX4FPgPDf6yXljB5X31IkxBTZJeOq0UT0BWEMJr946D06mB+l8Ui6
 yRuoQ2/fyE937GGvi7eoxMl3QjJwAZNvGlHAdHDNRt4W90tv/1oTu4iLe
 CxB5oTWNnlYoFFQ7PLomEQnhzRTPoiNHu8iDB+qZ4sW0chGc8i/ucu7Ms
 o7IwxwVjwstcgIgFABA+5Gl5SHQDJpY3UoaP38dMUbVzsJZVl2DSzBDKz
 mkF5ZtgRiF+f7k77CLHd3si6syixTrpRFusxWLH8KznRK4M4Z+sLzdcxf A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="236401941"
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; 
 d="scan'208,217,223";a="236401941"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 17:47:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; 
 d="scan'208,217,223";a="783274943"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga006.fm.intel.com with ESMTP; 15 Mar 2022 17:47:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 15 Mar 2022 17:47:54 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 15 Mar 2022 17:47:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 15 Mar 2022 17:47:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 15 Mar 2022 17:47:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AM5QfX4NnrJwzG6UDOFb4QrgyG60CMiF1a62G4Cni4i4PRLP+cFdFj36MWkpOOrNtbhEgznyBCv5wtadG6KBeknqnAw5EBJ7j4cefAsCFWexUFeohzhv7Hyg07fL5O8qZUHwGdTpohyZHWhnS6Jk9HpvFgHjRIw0FLkkPXIE/Ko4zV673P/dktkIhnPi0BCMVaAVZjmEasWhAo6JzuSVZ/NRTOM3fSilYbnnZNOywwEfUROZeWm+iISPfe1SHiyqZ4d5KpGhpU4DATILOL+Z7mpZeDA6JJZOwuDQMVo+HwtZl8C876lXyWoTr3krlhXpcl2lT5EOHjR2s0B1rr1JhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ns0xR6NSRdiFqXTuAA0brZpE+6Amdm6vU7e23xDgvbI=;
 b=OPlNymV1IMW6uLcQ5YfQz1pulmlFMWoewtBwI9eTMEOWI8dO32gsffvBSdxF1mOYFv+fTHmIllN/k8cloT6gjJRzdeMQlglE9IaJeDc5seMh4XaZ6NqoKT3V2GVq+LxqJJUcyBhjFRaBff6G0bdrfukHokp70p8SiF8bGIcWUtI43VMTgw3q8g11b2uhOky4hNwwkrHkuamHQ6tiYOjq0Cjum1Du30ff6rybUJIgw4XmyIhSKoKghLaVQCkVrlXAnQTPt89q+Rpa6YRz3YZve983mwquWUJIhyuXMhVhvosqJStHjX3vmD6Ae8pjKXQuHuuUsAFkC0iM35Yk6vj25Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4090.namprd11.prod.outlook.com (2603:10b6:5:195::10)
 by BN6PR11MB3873.namprd11.prod.outlook.com (2603:10b6:405:83::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Wed, 16 Mar
 2022 00:47:52 +0000
Received: from DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::857b:f12a:9c5f:e9de]) by DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::857b:f12a:9c5f:e9de%3]) with mapi id 15.20.5061.028; Wed, 16 Mar 2022
 00:47:52 +0000
From: "Wang, Wenchao" <wenchao.wang@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: [PATCH 1/1] MAINTAINERS: Update maintainers for Guest x86 HAXM CPUs
Thread-Topic: [PATCH 1/1] MAINTAINERS: Update maintainers for Guest x86 HAXM
 CPUs
Thread-Index: Adg4zt2a7QwPZGltSoa0MyKlq+7jgA==
Date: Wed, 16 Mar 2022 00:47:52 +0000
Message-ID: <DM6PR11MB40905967203E4917E78C773487119@DM6PR11MB4090.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf4d7950-d702-46a9-ee12-08da06e69a1a
x-ms-traffictypediagnostic: BN6PR11MB3873:EE_
x-microsoft-antispam-prvs: <BN6PR11MB3873EA6AD31208B80C9B98A587119@BN6PR11MB3873.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PrrgYcnT5PmHPs/vP221wavaO5X3PV3ZSsy2yc2znWFUJGLbO1dkrNs4VVMCKigv64ggVO3q9Bbx3WN7NY+uNBg33pssWbASvuCzMexOw17Ck4TbSew5Mf/TqVMrrqyb5VBaXsJrktEPOXOTzn5CrgcX/UYNLQLwRQXJrJHIS+8QlEBeTqAqk0D2vI48sNLG4GVf/JqSB8FkoVkY0VnNJYE6ZPja3dD7yYc5rNPYpxUHkrhbNkCr1sDbVFwyZfC+fOo7gH0y4nDFM4w2VSBF/+AHcCUtANkOc5JGHxuA5N0YwbnRfqwPlyyl5lmVG2JhvTUU8ZAgZzRQrugNAJi3bgC8RuXLnBcincobmNxZBYI1lYoGZVkJMR7kSmDfj4H9Mxb5psyK83Ff8u7SBVpN9GXydckGqmdS+Jd9eMeI89dtH/szzpkjdpYPfilLM21nrft+gLFhH7MN41q8TdG4sufvijGJ+kopz5OK60/kd083j9PRFYzsZR2lAdWvt5AHP3mtNwbfy2MgJuB7jQ8dX3bYJ1RvdkRqptwdYpNm95+YA3dDANQWoY2b5u3J6Y3Z0z7lezWLWYO7yDHOpGRppSI3sxyJX6WDlL/W2ZxorXSOqaJzLxWzOam7Q7yYc8AGB/9jbr73qq6HvQIU0kfKAdiUHxO5uT5g5Ywplxs0xjIasYBPwEEq4GAIoHO27QABvLdd33C1pGzeM+++61jJ3Q/I0VBZWn8sJ0mmvtVpuHVJgu1syqFs3F4OaL8GxqEFr48KmTYtD2byB0QUsWIltZCQSfN+Dpa2pK8wMyIi4w8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4090.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(54906003)(110136005)(966005)(33656002)(8676002)(316002)(508600001)(8936002)(7696005)(9686003)(86362001)(6506007)(76116006)(66946007)(66556008)(66476007)(52536014)(66446008)(4326008)(55016003)(5660300002)(64756008)(186003)(26005)(2906002)(38070700005)(4744005)(99936003)(82960400001)(38100700002)(71200400001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YAPLOyS+Rrkh0AV3uixf9X4hIe7PqEiF1gD3s962FGfC/6s3KEtlOgpUYpXU?=
 =?us-ascii?Q?fIXpcxbURmorPVwKXPC2BwlNsXYcKJXHzJgRbCI7Bm7TS8JLLLTXQ0l1dVL9?=
 =?us-ascii?Q?/efqvp4+AamDiiYJoGycI7oyIQZRwDg/5NtySzpIzZxSEpCW1a3vA6vtoGZe?=
 =?us-ascii?Q?zOMMC2RXZy/qx7KMs/1RAOXDlaH0JkwG1D7b7QJSbgDo2VOtLq0tUSal/N8V?=
 =?us-ascii?Q?DuAbtsWRMUlBzUHKyfYvTeH+P2ZYu3gg4byCU+FewhaydkwGWWt1PcLnQ63A?=
 =?us-ascii?Q?q1Cj1wMhTfur024pe6eY6Na8IuddeLmguJ0zmdF/3kpYztCfKqKetFZoYHbC?=
 =?us-ascii?Q?PQKWKKJ6xX09U2k7CL5tvmvRqFWuhu9nYPBPb7V10TrN54xs/2OcwTpUM5LS?=
 =?us-ascii?Q?/WG8xZfMIkAgsiiSuvw+yYcbzVLwn2irFofunwvU0+Ah4JUSoDDl7ojXZana?=
 =?us-ascii?Q?sWxOkBx3iA3kc3xnlXYQGmQdM+w3nggAvRSemHJ4xl/bxO+tQaefDP0GXEIR?=
 =?us-ascii?Q?UUzB1HCUIZw2Yu3N0uK2O42xNjpNF69rQBYwaWZp+onyvdeTwAm62Kb2ZLbu?=
 =?us-ascii?Q?TI5vecfO4hFfHl3wUOE/X6u6ayuDGEqj570HpCwTg6QioZ+6vClAiIJuYRAB?=
 =?us-ascii?Q?l4gIrX61fIYZ8cr33djxzQ4BqRYgb2AySjQrCBYuA9xe0O/Qz2jN/MIs/UZk?=
 =?us-ascii?Q?UY/R4YQQSIh01P82QLICelB0wzJUiAooYmQUBwbbJyTv/r8gqpQGZv0O1ZFh?=
 =?us-ascii?Q?3QsrWCvUmGUhRU+xc35N8e0By/GHV9UWm+YUS0e/x6aBdb8iatdTMgT8dzEd?=
 =?us-ascii?Q?a/3vrR+Jg+++AZZUJ61ZcUHT7wGovV7xsMiSLBAAN6UFEVcEeEHzBGcQf7hM?=
 =?us-ascii?Q?tKZ1L5ANJeMlvh2+II02r3y5ScML5EmcF/Ne0M8vjdg6wW9SXrFIcLD4ZYdh?=
 =?us-ascii?Q?EfP5OBSGYLm6hfBdDiJMw1dC2TaghqE+0B9UMOOuZTkEFZwpLOS5Dj15hZPl?=
 =?us-ascii?Q?ElQbyiVxf78wO9chRbqclK/5dilNI5BlF1F/sjGjKe5obA+iOcWZ5GmYUCgR?=
 =?us-ascii?Q?ruTdOGhufLS1Dfc3Qu6/SEluYCQc1ju2BkRY8k5mOeXFqq4RGiV0MP+uxKjs?=
 =?us-ascii?Q?WG04WmPWtXUk66Mkt+B31reGHiH5VfaepoS/gysx1RULQ5NY1y6hXfRZ74xc?=
 =?us-ascii?Q?OypAagqaTUKpsqMi2344R2wnH+jxPUd6lgpXrTsKgCWrrJAsi6/dggdx8OBX?=
 =?us-ascii?Q?cfYWm2MGIvhP+QMKRWNzOJPXK/1ZEMMpTK4/AYciZF9Ngv/ZYItIcOeD9xCr?=
 =?us-ascii?Q?BRtF9Lad31kOrPeJcMY23mroTeV4/M1qgigPMEu227Y+Zf0gOb3fGJ5InxGn?=
 =?us-ascii?Q?sTYa2WNfgKhDlLByiEO0B1dxbLP0yVcx5jhwFLsXgF8vlWIxKWIuunm/bcA1?=
 =?us-ascii?Q?9N7jlK2csv7Q99bYwEzBXl1/97Og4REx?=
Content-Type: multipart/mixed;
 boundary="_004_DM6PR11MB40905967203E4917E78C773487119DM6PR11MB4090namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4090.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4d7950-d702-46a9-ee12-08da06e69a1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 00:47:52.3109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e3KHiSRZkCCo6uVQfcwBCH4PIxyhbk+RZK5cnapwyrX+jQuttZE2mBTd2qRApsbWrmDqKqufchBzF3BpriOJWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3873
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=wenchao.wang@intel.com; helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, "Yuan, Hang" <hang.yuan@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_004_DM6PR11MB40905967203E4917E78C773487119DM6PR11MB4090namp_
Content-Type: multipart/alternative;
	boundary="_000_DM6PR11MB40905967203E4917E78C773487119DM6PR11MB4090namp_"

--_000_DM6PR11MB40905967203E4917E78C773487119DM6PR11MB4090namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

diff --git a/MAINTAINERS b/MAINTAINERS
index f2e9ce1da2..36f877cf74 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -492,7 +492,6 @@ Guest CPU Cores (HAXM)
---------------------
X86 HAXM CPUs
M: Wenchao Wang <wenchao.wang@intel.com>
-M: Colin Xu <colin.xu@intel.com>
L: haxm-team@intel.com
W: https://github.com/intel/haxm/issues
S: Maintained
--
2.17.1


Best Regards,
Wenchao


--_000_DM6PR11MB40905967203E4917E78C773487119DM6PR11MB4090namp_
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
<p class=3D"MsoNormal">diff --git a/MAINTAINERS b/MAINTAINERS<o:p></o:p></p=
>
<p class=3D"MsoNormal">index f2e9ce1da2..36f877cf74 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/MAINTAINERS<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/MAINTAINERS<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -492,7 +492,6 @@ Guest CPU Cores (HAXM)<o:p></o:p=
></p>
<p class=3D"MsoNormal">---------------------<o:p></o:p></p>
<p class=3D"MsoNormal">X86 HAXM CPUs<o:p></o:p></p>
<p class=3D"MsoNormal">M: Wenchao Wang &lt;wenchao.wang@intel.com&gt;<o:p><=
/o:p></p>
<p class=3D"MsoNormal">-M: Colin Xu &lt;colin.xu@intel.com&gt;<o:p></o:p></=
p>
<p class=3D"MsoNormal">L: haxm-team@intel.com<o:p></o:p></p>
<p class=3D"MsoNormal">W: https://github.com/intel/haxm/issues<o:p></o:p></=
p>
<p class=3D"MsoNormal">S: Maintained<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.17.1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Wenchao<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR11MB40905967203E4917E78C773487119DM6PR11MB4090namp_--

--_004_DM6PR11MB40905967203E4917E78C773487119DM6PR11MB4090namp_
Content-Type: application/octet-stream;
	name="0001-MAINTAINERS-Update-maintainers-for-Guest-x86-HAXM-CP.patch"
Content-Description: 0001-MAINTAINERS-Update-maintainers-for-Guest-x86-HAXM-CP.patch
Content-Disposition: attachment;
	filename="0001-MAINTAINERS-Update-maintainers-for-Guest-x86-HAXM-CP.patch";
	size=807; creation-date="Wed, 16 Mar 2022 00:44:00 GMT";
	modification-date="Wed, 16 Mar 2022 00:47:51 GMT"
Content-Transfer-Encoding: base64

RnJvbSAyMjU3MjcyYzA4MjkxMDA2YmFkNWU5YTQ0ZjQ4ZTczNjVmMzMwNjQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBXZW5jaGFvIFdhbmcgPHdlbmNoYW8ud2FuZ0BpbnRlbC5jb20+
CkRhdGU6IFR1ZSwgMTUgTWFyIDIwMjIgMjA6NTE6MjIgKzA4MDAKU3ViamVjdDogW1BBVENIXSBN
QUlOVEFJTkVSUzogVXBkYXRlIG1haW50YWluZXJzIGZvciBHdWVzdCB4ODYgSEFYTSBDUFVzCgpD
bGVhbiB1cCB0aGUgbWFpbnRhaW5lciBsaXN0LgoKQ2M6IEhhbmcgWXVhbiA8aGFuZy55dWFuQGlu
dGVsLmNvbT4KUmV2aWV3ZWQtYnk6IEhhbmcgWXVhbiA8aGFuZy55dWFuQGludGVsLmNvbT4KU2ln
bmVkLW9mZi1ieTogV2VuY2hhbyBXYW5nIDx3ZW5jaGFvLndhbmdAaW50ZWwuY29tPgotLS0KIE1B
SU5UQUlORVJTIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggZjJlOWNlMWRhMi4uMzZmODc3Y2Y3
NCAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTQ5Miw3ICs0
OTIsNiBAQCBHdWVzdCBDUFUgQ29yZXMgKEhBWE0pCiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0KIFg4
NiBIQVhNIENQVXMKIE06IFdlbmNoYW8gV2FuZyA8d2VuY2hhby53YW5nQGludGVsLmNvbT4KLU06
IENvbGluIFh1IDxjb2xpbi54dUBpbnRlbC5jb20+CiBMOiBoYXhtLXRlYW1AaW50ZWwuY29tCiBX
OiBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvaGF4bS9pc3N1ZXMKIFM6IE1haW50YWluZWQKLS0g
CjIuMTcuMQoK

--_004_DM6PR11MB40905967203E4917E78C773487119DM6PR11MB4090namp_--

