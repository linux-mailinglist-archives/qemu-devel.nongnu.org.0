Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137BA638997
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 13:19:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyXez-0000Ct-Hy; Fri, 25 Nov 2022 07:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1oyXex-0000Cd-C1
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 07:18:23 -0500
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1oyXeu-0003Na-2o
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 07:18:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669378700; x=1700914700;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=agBJZMHI13mfKMYtjyyKkdLctdMqqFea+NrgTFO6+Cs=;
 b=DeqBZqcic7A83d3vYtf8JsCxhoOXdk1CwYHSLAX1x/NHrOdOaTS6ysoK
 6fQ+8W1pVOey4KeybFFvn1oUc7yIeXRwRwvCvWd/lvFniab3HFBJfHEJh
 txgHOHGBY8Xpzl3ozdvBixqyKTaJx7Ep/Ijlc/Zd+wpVYazDks+eVdIeR
 wPTKKkJ8FoSNTCthyho+Ta1LGHLSJNNvZ9Exgn0FWLhV735TOwGcHNd5W
 FLZ3htaG0YY30E2mRwHS7C6Cm8sAr0hszU6PG+qg1OyTPCiCuG4qh1onj
 ll8lKPNeycOJvk89aPJcRJkN6B7nWEKKfNc6mce0Z0/3LNlkMSs/jUnjK A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="315630271"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
 d="scan'208,217,223";a="315630271"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 04:18:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="711260509"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
 d="scan'208,217,223";a="711260509"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 25 Nov 2022 04:18:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 25 Nov 2022 04:18:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 25 Nov 2022 04:18:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 25 Nov 2022 04:18:11 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 25 Nov 2022 04:18:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzylkNJGzLNImzO8qDDa9Iqtv3y/j8V6YjyYAKGv9W3EzZNFynQvp747WrTMvTTts97Oc0h3H56aDPhpCuUHKud6llDPO2hIaPU9becaPlPpBBI1D3c07sNQk6c5jXOaLpRtIvC8KbjJNwDRhXQm8y8o3+8at0TWfjBLGZVnEBiAyml/Q6RjqRG3MFzMTc2fHcSqk1W9rh3+VzRjaNhYIr32cXemNpNGuqukjKyOuLYxuHC66vILuGX4YRPAJlH6OrdFEUStuGub5cvygXYQ4Q6HmdD+l7q9iR95PfYAXO0pNe3n5QMFR3Aom/ERWDGpd7Ycaia2/g2FsFa/1ff8Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5wk/FOf6kIXSLNCOTgXsIYT/5ZoPjO0ft1NkhRkzgo=;
 b=f3bNnBm09Z0hMkLZMqn2qeIOLzvCGMexQ4MEdY15t9YOhd+ssdhgoctVoRXt6zkJx+o/NTd6S99z8a2D3Q2alt0OPWpk2rQKQX1RfZHlnUslV5ieuwdeUGL256a5cYGNxC9uFSAixwj0bMpwq+RJZdAsBHJi04ipC7uFBVyxDS45CUwgPAJDhhibePQvGtYFk6T8WU0XwkDq+GR20hHbf0/9TQN8KnC+TPU86yr5WMeXL5V05jI8YywixoW6yvhyuiIFYJV7QNq6Ds2xPXCoN5/jbVOZ3ohU2DUVwgfcT9ZCpVcvFXrMPCVYvu6Wfm4XK4LiB7D0HNEc15B6YDX/+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4090.namprd11.prod.outlook.com (2603:10b6:5:195::10)
 by BN9PR11MB5323.namprd11.prod.outlook.com (2603:10b6:408:118::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Fri, 25 Nov
 2022 12:18:09 +0000
Received: from DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::caa8:f626:10c8:9ae2]) by DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::caa8:f626:10c8:9ae2%2]) with mapi id 15.20.5857.019; Fri, 25 Nov 2022
 12:18:09 +0000
From: "Wang, Wenchao" <wenchao.wang@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: haxm-team <haxm-team@intel.com>
Subject: [PATCH] target/i386/hax: Add XCR0 support
Thread-Topic: [PATCH] target/i386/hax: Add XCR0 support
Thread-Index: AdkAvHco0a5CAnUYQy+c+kGSr8NH7w==
Date: Fri, 25 Nov 2022 12:18:09 +0000
Message-ID: <DM6PR11MB40909B4A33D66A3100F6D219870E9@DM6PR11MB4090.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4090:EE_|BN9PR11MB5323:EE_
x-ms-office365-filtering-correlation-id: d4aae076-5be2-4db4-0199-08dacedf1d5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lh+t65D4g4dYZ3+Ru6jZeu5a++N3gVzCNOgCQXnYho9E76yKaTdPkIcChPkEXYF2vnsO/xmJYgAP2dbjE0EV6KVlPXs1Um2QnqNRl1Nh0yxsRgLCniMUz1RpQnVqTw//xhNQQgld4OuKoDLxJTWJO5a4OrcxfpgCpt3Y9R8X8Lf8Ydk9Qe0sbT8eBqtIJyj/aHjMhIfK5qWFj8qOw46M4DdBaNQTZgVwTHy1farPxpz30GWLb94YxeyVJKOzzgU7bRMflpamyiPg88uF5AGZ36T+fQeojNc7ZCYms5AF2A4SO1J2yudIQL41uwJ50stkPtyCtAw/RUGo0l3ph3Bx2F4UjKhgKBF4agvankQqVUn3tUPXIl0sEcWIcTKPl1b8Pt6yJ06ZyaGhvaS+avsKuSQ/ZKLWNqknd1NR+FOk5ePcyZVtJlGgvoBn/Ivv1p188nwwK8zssy1WMlm2e9vzBKMWo3uAgXigdubAqEm9LJoPpVCETDLCVuXIcvff/PPaPoZQoYXyg06JeJo48V7SEckJVXuJW0GUocAogSKOiok9Kbbn0iYLEjxT09aq+SOhvi03FxlmGHZQJIy01jqH1/X4B89fWNBzQBbqRcq+wIPSSMjV3w78qJdSAFbH5EPqWlfjL9tnX+KbD01gYUUAhRIpz+J3sTqO+EngYFlh6sYBjj9DkD9GYzwJ9pvuMvCsXGd3Mrq83wiMJCqrgcKaeQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4090.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199015)(52536014)(66946007)(76116006)(41300700001)(8936002)(4326008)(66446008)(66556008)(64756008)(8676002)(66476007)(53546011)(26005)(9686003)(71200400001)(478600001)(38070700005)(33656002)(55016003)(86362001)(6506007)(2906002)(7696005)(186003)(6916009)(107886003)(316002)(38100700002)(5660300002)(99936003)(82960400001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LGq0faJSdo3pjDeZdgAPa5xUUS2LuwSWWm7Fah/cXBtXlD/1F9xPxIeDAnPH?=
 =?us-ascii?Q?lDbioJX8cXZHzNUu9C9/yzk8RMBsawYEafriQK0mRZiZuf5USh6B0qhUTyph?=
 =?us-ascii?Q?AbawgRdwG2OWQsblsAOBmz+VKUh+kDMsPx4B7eD7NqIB5n3YmW9+Z+6SHgVg?=
 =?us-ascii?Q?xsaTkA4+DI0HsqXJ3Y3x9tzfAx+PMRMk8A2ARgvq/oCGg2tBv0AbLu3TKOvn?=
 =?us-ascii?Q?i80yrO1OsNe946iGNoKUcQ/6lBPS5Q/ewOQVdCQohZ4/mukQU/n1jrbVOnXm?=
 =?us-ascii?Q?aOAWnM3QTnliEkw0Kz9N7sVnT4RyWdJYt07u1DZtJihWGYP0Xsbh02t/juQH?=
 =?us-ascii?Q?DpK7A6/hLuIR74z/kYQOX8u+vUxlJz6JN0luK5rt2ocEI/IjVuwGZ8/1jr96?=
 =?us-ascii?Q?ayWth/di99rZUMFSwI9q7CUubGYGkPk4WDxzHTyKFx1twr0g5IzSrDEEdESi?=
 =?us-ascii?Q?C/waGyN1juqrRAIsMdQC//KCvagMHysYuOaY4NSf/rbRH2ipggCIg5ywzV41?=
 =?us-ascii?Q?2QTqTfWpfh3Emy4wbBmpCxEM1nspsaqTHzNWZksHhRoWpQhIoh8Ow46C/vLy?=
 =?us-ascii?Q?8L7TWzLRsJoxoxmu31EuS6V2afTjWGMwXh+znLbQ+QcQismQ6MZFWnjDFk8q?=
 =?us-ascii?Q?HAxa6hH03ou963BTJANWetgZPzw89NG9DiiaZwZpcpCuf01tVZiJ2K+JTxVH?=
 =?us-ascii?Q?zH4PessnONTBH2/3o9SH3NFImbF0EOFP5jTkGdIr3k+F/IyBlajJUrGVPxfw?=
 =?us-ascii?Q?ckDLf1xnfy+TqvKIyIzhZpZ4YRr6rpxmvnlhS6te6TdVry1RtksV7mhhe2yN?=
 =?us-ascii?Q?6Hg0ECs5UFXsexlnMWI/1TLhexJ4bzzNoOuXREeBndOkDttazfnSXn75E8N/?=
 =?us-ascii?Q?xVspYoJQG00j1CTIhKT3CKq3mdtO6p0yeJ1ttoD+PiinM26tp6L1nD3G9Bue?=
 =?us-ascii?Q?WbbRy/epPn21ygi/an77BC/DpM3PJpqyh+BbIQteNNbw3DJhJC5x797pL17v?=
 =?us-ascii?Q?/pZYFgNyiNgo1OKDZ/QGOvBz7gr1Y/izb2qekGFOGl0zHP7Khz1ltsAATXiH?=
 =?us-ascii?Q?+nr9+hgR0sT60FG6XeLkPohJWU5i1ZgARStBeYFcRVLtUhVaw8lGKdfp6DEd?=
 =?us-ascii?Q?uNVBfofPvqnjTrCwgZbiie5yDWZmOkSUQYBBvJg+6QaS3/YfkcOMZbuTTE3U?=
 =?us-ascii?Q?I59iSISHonFuubXm8Gi/gW/qB1eM9yddIVCwGAA3YL1KrPSWSBsGkAfgZiey?=
 =?us-ascii?Q?fVhzo3Ou0aV4XsNur5WddezTT8BmWu1BMr12+/KoEVJXGOvbhK4kjJXqZNWX?=
 =?us-ascii?Q?xIHJmH9jc8yxTn6yMatTV6nm9lJs5Ewe059yMqrXm0OQTNUfyZpgcToitr6b?=
 =?us-ascii?Q?dV309TL2Ia+IzaeI3lu4HT5z7dGQqLrFMdE6W2NRitFd7OkbWFYm698asbnm?=
 =?us-ascii?Q?goakoyMOT9O/HqgmzsfWyhLc38QSamikK5M296+3ku4EyFuSoxA14R3HxFrR?=
 =?us-ascii?Q?7pgwS8l03bXSo2NKczn5BjGNoX2Ox6rY+inN7T20GOYs3wI34j4C74h4fESU?=
 =?us-ascii?Q?1uNRKMM7y+BwXb+/xJUGoZgBcC81BYuMOQFUC1ge?=
Content-Type: multipart/mixed;
 boundary="_004_DM6PR11MB40909B4A33D66A3100F6D219870E9DM6PR11MB4090namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4090.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4aae076-5be2-4db4-0199-08dacedf1d5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2022 12:18:09.1657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 07eYr6/o7t52LwbGq84Po6JPgxzAk2dZHnnTBIzhVOOmbqFQf8z0B87TFdUqZwxBiQIYzbyjUBm7uonZvDXhFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5323
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=wenchao.wang@intel.com; helo=mga09.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

--_004_DM6PR11MB40909B4A33D66A3100F6D219870E9DM6PR11MB4090namp_
Content-Type: multipart/alternative;
	boundary="_000_DM6PR11MB40909B4A33D66A3100F6D219870E9DM6PR11MB4090namp_"

--_000_DM6PR11MB40909B4A33D66A3100F6D219870E9DM6PR11MB4090namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, maintainers,

As HAXM v7.8.0 is released and it added XCR0 support, could you help to mer=
ge this patch to add corresponding support into HAX user space of QEMU? The=
 patch has been included in the attachment. Thanks.


Best Regards,
Wenchao


From b1789f2523d06798b8883664bfa9a9df797bfccf Mon Sep 17 00:00:00 2001
From: Wenchao Wang <wenchao.wang@intel.com>
Date: Fri, 25 Nov 2022 18:37:34 +0800
Subject: [PATCH] target/i386/hax: Add XCR0 support

Introduce extended control register XCR0 to support XSAVE feature set.

Note: This change requires at least HAXM v7.8.0 to support.

Reviewed-by: Hang Yuan <hang.yuan@intel.com>
Signed-off-by: Wenchao Wang <wenchao.wang@intel.com>
---
target/i386/hax/hax-interface.h | 2 ++
1 file changed, 2 insertions(+)

diff --git a/target/i386/hax/hax-interface.h b/target/i386/hax/hax-interfac=
e.h
index 537ae084e9..1d13bb2380 100644
--- a/target/i386/hax/hax-interface.h
+++ b/target/i386/hax/hax-interface.h
@@ -201,6 +201,8 @@ struct vcpu_state_t {
     uint64_t _cr3;
     uint64_t _cr4;
+    uint64_t _xcr0;
+
     uint64_t _dr0;
     uint64_t _dr1;
     uint64_t _dr2;
--
2.17.1


--_000_DM6PR11MB40909B4A33D66A3100F6D219870E9DM6PR11MB4090namp_
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
	{font-family:DengXian;
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
<p class=3D"MsoNormal">Hi, maintainers,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">As HAXM v7.8.0 is released and it added XCR0 support=
, could you help to merge this patch to add corresponding support into HAX =
user space of QEMU? The patch has been included in the attachment. Thanks.<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Wenchao<o:p></o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-bottom:double =
windowtext 2.25pt;padding:0in 0in 1.0pt 0in">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><o:p>&nbsp;</o:p><=
/p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">From b1789f2523d06798b8883664bfa9a9df797bfccf Mon Se=
p 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">From: Wenchao Wang &lt;wenchao.wang@intel.com&gt;<o:=
p></o:p></p>
<p class=3D"MsoNormal">Date: Fri, 25 Nov 2022 18:37:34 +0800<o:p></o:p></p>
<p class=3D"MsoNormal">Subject: [PATCH] target/i386/hax: Add XCR0 support<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Introduce extended control register XCR0 to support =
XSAVE feature set.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Note: This change requires at least HAXM v7.8.0 to s=
upport.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Reviewed-by: Hang Yuan &lt;hang.yuan@intel.com&gt;<o=
:p></o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Wenchao Wang &lt;wenchao.wang@intel.c=
om&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">target/i386/hax/hax-interface.h | 2 ++<o:p></o:p></p=
>
<p class=3D"MsoNormal">1 file changed, 2 insertions(+)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/target/i386/hax/hax-interface.h b/targe=
t/i386/hax/hax-interface.h<o:p></o:p></p>
<p class=3D"MsoNormal">index 537ae084e9..1d13bb2380 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/target/i386/hax/hax-interface.h<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/target/i386/hax/hax-interface.h<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -201,6 +201,8 @@ struct vcpu_state_t {<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; uint64_t _cr3;<o:p></o:p></=
p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; uint64_t _cr4;<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp; uint64_t _xcr0;<o:p></o:p></p>
<p class=3D"MsoNormal">+<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; uint64_t _dr0;<o:p></o:p></=
p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; uint64_t _dr1;<o:p></o:p></=
p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; uint64_t _dr2;<o:p></o:p></=
p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.17.1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR11MB40909B4A33D66A3100F6D219870E9DM6PR11MB4090namp_--

--_004_DM6PR11MB40909B4A33D66A3100F6D219870E9DM6PR11MB4090namp_
Content-Type: application/octet-stream;
	name="0001-target-i386-hax-Add-XCR0-support.patch"
Content-Description: 0001-target-i386-hax-Add-XCR0-support.patch
Content-Disposition: attachment;
	filename="0001-target-i386-hax-Add-XCR0-support.patch"; size=884;
	creation-date="Fri, 25 Nov 2022 10:57:00 GMT";
	modification-date="Fri, 25 Nov 2022 12:18:08 GMT"
Content-Transfer-Encoding: base64

RnJvbSBiMTc4OWYyNTIzZDA2Nzk4Yjg4ODM2NjRiZmE5YTlkZjc5N2JmY2NmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBXZW5jaGFvIFdhbmcgPHdlbmNoYW8ud2FuZ0BpbnRlbC5jb20+
CkRhdGU6IEZyaSwgMjUgTm92IDIwMjIgMTg6Mzc6MzQgKzA4MDAKU3ViamVjdDogW1BBVENIXSB0
YXJnZXQvaTM4Ni9oYXg6IEFkZCBYQ1IwIHN1cHBvcnQKCkludHJvZHVjZSBleHRlbmRlZCBjb250
cm9sIHJlZ2lzdGVyIFhDUjAgdG8gc3VwcG9ydCBYU0FWRSBmZWF0dXJlIHNldC4KCk5vdGU6IFRo
aXMgY2hhbmdlIHJlcXVpcmVzIGF0IGxlYXN0IEhBWE0gdjcuOC4wIHRvIHN1cHBvcnQuCgpSZXZp
ZXdlZC1ieTogSGFuZyBZdWFuIDxoYW5nLnl1YW5AaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBX
ZW5jaGFvIFdhbmcgPHdlbmNoYW8ud2FuZ0BpbnRlbC5jb20+Ci0tLQogdGFyZ2V0L2kzODYvaGF4
L2hheC1pbnRlcmZhY2UuaCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS90YXJnZXQvaTM4Ni9oYXgvaGF4LWludGVyZmFjZS5oIGIvdGFyZ2V0L2kz
ODYvaGF4L2hheC1pbnRlcmZhY2UuaAppbmRleCA1MzdhZTA4NGU5Li4xZDEzYmIyMzgwIDEwMDY0
NAotLS0gYS90YXJnZXQvaTM4Ni9oYXgvaGF4LWludGVyZmFjZS5oCisrKyBiL3RhcmdldC9pMzg2
L2hheC9oYXgtaW50ZXJmYWNlLmgKQEAgLTIwMSw2ICsyMDEsOCBAQCBzdHJ1Y3QgdmNwdV9zdGF0
ZV90IHsKICAgICB1aW50NjRfdCBfY3IzOwogICAgIHVpbnQ2NF90IF9jcjQ7CiAKKyAgICB1aW50
NjRfdCBfeGNyMDsKKwogICAgIHVpbnQ2NF90IF9kcjA7CiAgICAgdWludDY0X3QgX2RyMTsKICAg
ICB1aW50NjRfdCBfZHIyOwotLSAKMi4xNy4xCgo=

--_004_DM6PR11MB40909B4A33D66A3100F6D219870E9DM6PR11MB4090namp_--

