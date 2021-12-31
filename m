Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB97F482273
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 07:21:15 +0100 (CET)
Received: from localhost ([::1]:37182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3BHu-0006WN-OL
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 01:21:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1n3B9N-0003u3-54
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 01:12:29 -0500
Received: from mga18.intel.com ([134.134.136.126]:1116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1n3B9K-0000AM-Ca
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 01:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640931142; x=1672467142;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YZOQKs6vTVWYOszY9CSDBEAZj+ZeDzA14puI5xYnQA4=;
 b=nNRvXOsDtWPI3lWP5/3C1to8mqkRydZTkXhAQCKWjdStyzjdYrhQSP9b
 T7uCST9YhPomMIlz9YcUXIxSlrMbZt979z4xD83hnqTJcB5k2n4b9JvnI
 KWy++Nk49RaOvfQDeOWMG+mTJJ902lHnD2BK2RtDqV1lHEo4fFuYYpXBL
 I72M6UNK/Etw+XFvU4GL9fqcUNWvFIExPkgnsjUQlds2xEWArAyOiu09Z
 pM06gHDZzSL9dxvM1ABYkdoRWwASld3O/XZOT5910ZGSExkXTcVBq0i55
 Fri8m1VzW2yOvGX3jdHc4lhUjs/XoW5F7MeenAqdL6DAJxxoS4cg/rAtd Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="228601612"
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600"; d="scan'208";a="228601612"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 22:12:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600"; d="scan'208";a="525267951"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga007.fm.intel.com with ESMTP; 30 Dec 2021 22:12:20 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 30 Dec 2021 22:12:19 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 30 Dec 2021 22:12:19 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 30 Dec 2021 22:12:19 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 30 Dec 2021 22:12:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8BPhVhudJmdh8mF3kAutxRS375zqH1BwpWfdqs52xmp6ixobaCyfxjLiJ4B+FGgq4IABqCKaTK+kHxwyM+h+VWu0VJh9jXwmzuOLkzaFxO8ppfHqfDOFUmMUWXJ/y146kvl/li93f0XRNSj7AhkABriV3OjwVuyD66FUujLaYK1E4ayNxy/oAxadlTdp1BLTiYxnth7AFRcm53gGCz3bLEDUluCk8DynUyRpv421UPy5qIcbn9LkfIq1P+Jk1CHgJxmVndQe5FdexwUnTLzH4NjQ1YWc11XtGkhxIaMWCrQEAdxcDyvfjnuMs8SLRCcUIL8CCY0DSi8EGAQXqs4nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVrKgBfkcyRf46wWw6YQAmh+1pJTJEGn0cPpHenYZDA=;
 b=LxTR3b6Lt4Xw+3Or/ZpkHhTN7wsd7dzQad8quDUJavWiry3DzysYcn4OuGJDuIfHXlEn6fyqH1be72412ug/Pv+rjkTNXBSzT5t0vzBQDdwCbTx0Pq2YGXuPKDMoY4CjmifdCMIMG0FV0j++7au7H0D4427f0yAkkfgwWEbMobKSzDpZ/hSQY7ZR5krgxOpIZ4AferrRYnCVA2DtxK27YSsRq1evXXKiiMvlp6PHxdeIRKfK2NbEFXsQWO2ZxyYWZy41PcgsyIqeDEZcnZqx2naacuJ25KhNP9AEWWQ6M/IKpmB0Fz50/ik5VndPUQuOVykZkUjTABhhVhyNApvjWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by CO1PR11MB5043.namprd11.prod.outlook.com (2603:10b6:303:96::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 31 Dec
 2021 06:12:17 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::cc10:db9c:6cb8:d54c]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::cc10:db9c:6cb8:d54c%5]) with mapi id 15.20.4844.014; Fri, 31 Dec 2021
 06:12:17 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>, "thuth@redhat.com"
 <thuth@redhat.com>, "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Subject: RE: [PATCH] MAINTAINERS: email address change
Thread-Topic: [PATCH] MAINTAINERS: email address change
Thread-Index: AQHX/gSOuYOFSlzJKEi9cS8903WygqxMHjWA
Date: Fri, 31 Dec 2021 06:12:17 +0000
Message-ID: <MWHPR11MB00315B24AFD67FB669B8A1B89B469@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211231050901.360-1-lizhijian@cn.fujitsu.com>
In-Reply-To: <20211231050901.360-1-lizhijian@cn.fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6b07cfe-4b5c-4e7f-a205-08d9cc247f5d
x-ms-traffictypediagnostic: CO1PR11MB5043:EE_
x-microsoft-antispam-prvs: <CO1PR11MB5043760879D85A190523B01E9B469@CO1PR11MB5043.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ImAYmDgEuDFqaSY/J5Mt4KT8RyEAxDc+kInJ6jA7Ye+KSVFU60qaZHOqQFYs1bsGPRhfLko4fpbAjNwxbTf/EpKLBxH7QfMW3VEby3vLeC0tVlB6xKAYBS818AGI8CTp3LEhcMLxhWdyboNI1OHx4elmucIyn0h9UFWt8H7IcC8PAJPgZcq2bNel8vfgwhn2kXNma0KuuPNr1lD0tbhV9Q0vEbt6Xf1LBegSDJ4unglr49pSEVMznKUZQyYZMyEepft8z1tBhRs3gniqAqCRNcV0bemEXjduc9sI5C8zUEgXpBiSvcpr+OFyIElfdJiX0WTiYAaqwuSaFCKO3E2z98dYmFwfVdtIeQU1mrgWL+JXUP+i4/tHEu5VK4zzyoJeYxI/uskXJ5cMCNvTHk3ct0x5maocI93pHdRZvPF3iMVyvLVf4zjGa1DXAEmHVwFvkRRSZSXr0nxCrv8rZ9MIUoUTNtDAGGr1Tq58k+q0a0zsBINlnelYrqd5EYQn0MLl/Z4Nse4rbcMiNkn3NRrQcu9JEwce1paNauxePVJsnUp1KNsl7DGrtJX/MRz6j9PyKU1mSfScDQUjjvNOGS4E7AcVktMYDEfWTwjQ+xf4qeZSrttTxsrLEEQKpWWgpxd/HEVl6Lg3JAqZqQy8HhgAIe45WSOT+kGxZvQSW2r/v5l9GVZGnZAVvv9uaBIFVzSNjXQwtyyce1vAUasAo92lyw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(53546011)(52536014)(26005)(76116006)(316002)(186003)(4744005)(64756008)(66946007)(86362001)(2906002)(7696005)(71200400001)(82960400001)(8676002)(66476007)(8936002)(66446008)(9686003)(38100700002)(6506007)(38070700005)(66556008)(508600001)(33656002)(122000001)(5660300002)(110136005)(55016003)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?l9aX/lV1Iva9hntHksov0InaghLuG/RnX9k/Qzwxd/VxECXYhBAvSn9347V4?=
 =?us-ascii?Q?c8GeaWG2KG1f1yuLgrtuKnHrHSioNnqnUxT0isH13ie7VJ3T4peK+xW3ydzk?=
 =?us-ascii?Q?IkU2i1JTQfOZx6tCOKT6jw7TGIeYKWo2Gwplr3AkxBYYwHmmbD0gu55qjlsJ?=
 =?us-ascii?Q?n9KiWuu8QwokvNuAug1suJZKuMZZjWWlv/NdQz3O7nyTOmCFnlBUXmCVjP43?=
 =?us-ascii?Q?eCaEw1i7mckuXR2f8qijjHXrKtDxtZbfaJnY5D26v41SJsgqmxFiLNZutYVL?=
 =?us-ascii?Q?PruiWI5FiI9w13nxCEECiE35lA/zF2wkeSJ2tabrN6H7fxZKA2QjXV7OiIeT?=
 =?us-ascii?Q?ba4I9joo6+QW7TDcXZKenc6RwqqD4BnZxn8QoJLJKZ8m5/PhP3STwt/r7fkL?=
 =?us-ascii?Q?StYC+ql9ar8MRECcWIeT2JEYN5foFvblIapulgycXvV37V8KMiBmSOxyswT5?=
 =?us-ascii?Q?yue/+mu6S5L8os+8PBHdwcpEHNd4IpBxfUYJkRFPILx1EQ2vLWUOJBVcUrCi?=
 =?us-ascii?Q?pPuU/z9G7c7FLq1PNwaM8nNNftTwv0+56xbra+xLOcWDv3t/1TGpw/1DLJfB?=
 =?us-ascii?Q?tXfSAxcihtrr/u+gJDFvQqvmp0b5kdZ1Fi73WFKv4/TUnggUDAPyvy3/+Gab?=
 =?us-ascii?Q?Mg9fKqDuOFftYbXGiviwYOF2qtQfzSEd5wSFgBs4LNRSlXfuQrm1V8DFnK5I?=
 =?us-ascii?Q?5KMGNnd0mq3kGCiiSK2h6Q9ZeSW+4ROYasu6xuzbnmeb4TpRHTZOa+ne250T?=
 =?us-ascii?Q?NDgJbiVmI5AOa0Er9X6+TDtXzVxCskAPPq+NaWudfi/jIVtOAC4JqxfmVBq3?=
 =?us-ascii?Q?UL3Br4McE7XzbtvOPKH+TvT/vXUxJq6B6oV8HjkLl8YhIAzYRZD2cd8dZehU?=
 =?us-ascii?Q?b86Mp0mOE4350GYO2OzPSr4kh0inLxC2AnWpOj5vyIsmLhhH9KyfkJa4iM/q?=
 =?us-ascii?Q?DpmdsgtGdd2+ryiz125fdANKFqG5zXAKhTkyTYg9DrAnwV9KlrIWeTt56MOk?=
 =?us-ascii?Q?zDaCUJig1dt1EvVR8RgZBK3P/WE/n8XKUWyubtemnhoNk8CEhKZaVmPDvBuk?=
 =?us-ascii?Q?3spch0fKrd6MBYZy/kWTdehyNbT9nURTldjCaF4oFVcqoK37qNIAE5GvKK7W?=
 =?us-ascii?Q?R5O2nx8cd/c1KbiptvHUzOJCMPPsta1IAtMB/zG+XfzF2D0Sy2HVM56GQMtf?=
 =?us-ascii?Q?62djcxQ++QBzpp2Ddcjyk5tGDJO7zrp09o9uvqiBpPiOXBe2OQAOVzQJ2bLu?=
 =?us-ascii?Q?2Mb2RmXznEFsUJ9E7FNKlkFJSml+v2/nQqVlHoRtD4xQoNBmCoid7KEcF6Gt?=
 =?us-ascii?Q?DZPIzNKbGgTF1yShr5oedR8E9uHa79B9b4UWq5KhOqgpoOchxmI3uJBK3+lv?=
 =?us-ascii?Q?jDdCRb/AcrnI2gdOJjXB5P7ub+AvOkiUVpkSZ0PZUVX9vuIf7HNwfRo1WPCo?=
 =?us-ascii?Q?WVLabILcVF9Wdfc0d/WInNNwjmbtYeUC0gR+wizhPkszmKdKWNjHWJSirtAr?=
 =?us-ascii?Q?dm+8DgXzR55maL3M/F42btTPSmmC7dyj2Uq1AXTC6QcAyyb/3fj1YSf38npw?=
 =?us-ascii?Q?26pnKbtcZaunNul2TN5Wr9lQPpRU+RN3TrbRvIADFasnz0ODTNAAMXqsr207?=
 =?us-ascii?Q?8w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b07cfe-4b5c-4e7f-a205-08d9cc247f5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2021 06:12:17.6586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3q/Aflf3b6lplsfiGWFVwZm8F6halc4hSptOgRscalys33fwuRHTinZEYxFMMEDKOp31LAeaGGfVkMXT9fpwog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5043
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Li Zhijian <lizhijian@cn.fujitsu.com>
> Sent: Friday, December 31, 2021 1:09 PM
> To: thuth@redhat.com; peter.maydell@linaro.org; f4bug@amsat.org
> Cc: qemu-devel@nongnu.org; Zhang, Chen <chen.zhang@intel.com>; Li
> Zhijian <lizhijian@cn.fujitsu.com>
> Subject: [PATCH] MAINTAINERS: email address change
>=20
> Fujitsu's mail service has migrated to O365 months ago, the
> lizhijian@cn.fujitsu.com address will stop working on 2022-06-01, change =
it to
> my new email address lizhijian@fujitsu.com.
>=20
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>

Acked-by: Zhang Chen <chen.zhang@intel.com>

Thanks
Chen

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 50435b8d2f5..e5cda5886d4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2943,7 +2943,7 @@ F: docs/COLO-FT.txt
>=20
>  COLO Proxy
>  M: Zhang Chen <chen.zhang@intel.com>
> -M: Li Zhijian <lizhijian@cn.fujitsu.com>
> +M: Li Zhijian <lizhijian@fujitsu.com>
>  S: Supported
>  F: docs/colo-proxy.txt
>  F: net/colo*
> --
> 2.33.0
>=20
>=20


