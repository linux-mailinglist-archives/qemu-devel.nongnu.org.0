Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C320B600B7B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 11:46:43 +0200 (CEST)
Received: from localhost ([::1]:42986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okMhm-0001pz-MH
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 05:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1okMQq-0003ZY-NO
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:29:15 -0400
Received: from mga07.intel.com ([134.134.136.100]:5714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1okMQm-0003CE-VR
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:29:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665998948; x=1697534948;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=79TpUEOnlwrmZci90CV2tQEzpxMRjMGew3Rr27uJ2kY=;
 b=A3MPGIuJbzvJDrKSTYDTmIFCkyFbLDNl8rGyPaD/GxxX7/LhdXWrPYCL
 grr1if/hWdOHU/EANAX9c/lsJrKAP2Ql/+kvbfuy7lAg9IWN5MODhkFc7
 KFr9Jgu67y2wtnQ3r9av5KTZJNlfjwGY+KPa1X4VTfWwQHxybsBMvZxVA
 8oBtFBTY9BblWOMGtzYPtfDwgGt3uWc55RnrIZtfiumTnE7L95i24BKsb
 Up15XkuioCeJsToTokq3ztUjCZ1USqeoAILgxY6H2cWYlzZZkyv4uCCZI
 A8lLejDo+VEFOswIJh0Ek7U6S7lppQPM1LM2i+U4C7A5yOD4MYn9hM9TM g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="369942328"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="369942328"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 02:28:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="873403085"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="873403085"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 17 Oct 2022 02:28:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 02:28:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 02:28:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 02:28:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 02:28:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHWnBu6ALGd+Q3ln2aGbnY1C4/85VaMod715T5NhQKCmXBWOrz40ZpzVBSiNzvCZ8c/3ekT2PLZDg2SEctoHQx68DYQa9Vst1FYQjDnl9cWUa5dwrm5wvYQf2SffQH4po/yQ0X+utCsgzMdoy6mrtJRp4gNSIATenXtEJ2vzx43J2ggogjFIBPMgAlTkAcL1aHMhkwh51+k5icVILiXPi7U79XGv5acYPwBVq6JBSQxlOZzRRMh/hUOl/O6AHM6Ru55FbFIle2bCZA0Qie7N0rerFPyVXIAj5Xb7YuMIQpbM/KLJtwf3hp6GOiCUABzyl+M+NlETYecAwF6+iai8sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ggPbXtyXqG2IQjHxtzhPf5Wu7QsUaP9FeZ7JgQo7Fo=;
 b=Ks5/2hhagybtlY2hXmtGFuyD1hyI4ihbLExfizQ4gekP1LTUFjZJY+rFGRls3btiqz+UWe12HO9BbntXjY2ENg18OGcmNcHZ17TSetHoLkUn3LtszrIvR4kRgcUHByWMmt9NCoNziQB3Uq6OvXyLSHILHR3YTVHUCiRegtvbgMrZQ5T/BN4B+2Ti6uWII9DBMu8QtedVdUi+J6N/499erlazYgEFcu+Q2+HaHpGPV1l1/QpWD+/Wl0zXgWu/ZBg4lT//cav5Wuw27eTfr67D50fIX5ln5MonxcqOrW3dSIexVgrrtCEtoTfQnJKLdhqQ4OYH2YPnQKb1ZC3SzriFuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MW4PR11MB5912.namprd11.prod.outlook.com (2603:10b6:303:18a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 17 Oct
 2022 09:28:49 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::500a:9fb6:7396:f43c]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::500a:9fb6:7396:f43c%7]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 09:28:49 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Thomas Huth <thuth@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Laurent Vivier <lvivier@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH] tests/qtest/cxl-test: Remove temporary directories after
 testing
Thread-Topic: [PATCH] tests/qtest/cxl-test: Remove temporary directories after
 testing
Thread-Index: AQHY3hyDM1fYD5eGtkq6HYGiWwSm5q4SWOcw
Date: Mon, 17 Oct 2022 09:28:49 +0000
Message-ID: <MWHPR11MB0031B2975B8CE5E6752904059B299@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20221012091435.893570-1-thuth@redhat.com>
In-Reply-To: <20221012091435.893570-1-thuth@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|MW4PR11MB5912:EE_
x-ms-office365-filtering-correlation-id: 861483de-a829-44b4-dfc2-08dab021ff75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SJnR2LidW4941fJPUn1U8IGxkJ5epgE5Ff1nEYuttC10wIoZ2gm7RzN2lpqcau9oj6tbnQqrMmiJ0a2Q3LQZIqDXZPT9H93agqORs8qat0d6L/d3QG3kL6OOlEldX7Zbxr3sGpV2ADN8fYKMbbpFprjwL/ogZtkUCd7TcSb0UaTb8CKIX8l+mxi1c6ZJGFqg2y+CwASzBD3Tky3mVRlr/Ta1rPFNRUmx2h2j3Dzb3mKBATM7TYUWLnj7TdDjzLEby3WSj2WEIwzqD2p+yNSLAtKUGmCbWdvs2Kt1WA7+vagwZpcYEjde6PrbJ1QK+HViAPfXoI9y7weVBlXGALWfPyoI1ca5ZIxnPYlrcXrQGJb/ZEMpjWuJmO0LA0jDGtMQwamvGuOJFQNBlMfP3IO72TaL7DydLGH4ad/s5+z8BjJN0q9rpsnXmiTpfRWlApwrhWm4TdygmMwdZZyBIkoi4eAZDON34hz6zsPXJqA6boUDk9TK1kXJew9BwtmZgMe8TJjH3+QlB/inQZF/CpmCAT7Np/A4m6v4VKvszCz3054E3OufZno6wk50UYA6eYoHCz1OsNu45pv3IMtSpM3yd9zI1IwUZDDm6dZLIai+yOcShZPv8iiMYRRVdkeIq3+rZESxyTumeTnc8mzFZRBspK1kRtoTm8ptG4A0G8PxyBMbusbluv3MpHVfXigAHWhXp4YsVvMABHnQEzAdvdLxZNvt9/LWIYTiCPGOL3LjxIYzbozqSCBQ3tUYMgCuLCFqhqoUqtMOHiZu4UhEnLlZ/w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199015)(83380400001)(38070700005)(82960400001)(55016003)(33656002)(86362001)(122000001)(38100700002)(76116006)(66946007)(66556008)(316002)(110136005)(54906003)(5660300002)(8936002)(66476007)(2906002)(71200400001)(186003)(6506007)(7696005)(64756008)(9686003)(8676002)(52536014)(26005)(66446008)(4326008)(41300700001)(53546011)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FcAqui3sFbW4mOBplAZLkjm8t0u1IPePWRkHfFqH4bL3aYy31SbHTmW5iwB1?=
 =?us-ascii?Q?QYT1O9UklgBp6YDqTW8ykkywIUTCi5t9RvfZBmZAsSfIwEE4JzZ4Sp0WCyNW?=
 =?us-ascii?Q?N00jZw5OgkES0croO2mJavSjoFdrT4N+mT6KBeGo3ygmHAw2m+g4Ku7s7m5C?=
 =?us-ascii?Q?7p7aL6ZeDt3Sw4YqIVEFdpZvqGyNPCZDdMwwKCd6KkIlBMNBD7oX8g2PSHEI?=
 =?us-ascii?Q?krEbJwgzd4iD6p8+80IBctUHCa/uJeiRCxRqwgYQwLSXij23iF7w+ZHWZqU5?=
 =?us-ascii?Q?G7gc7Au6LUDwz7eldknAlUwvqNPgkeMKsH5q4X1j3kJXTnyJnGBk4L5Y0IRs?=
 =?us-ascii?Q?s5DBk7bbfRCYikgZn6hQkNgo3JWDHdbb3ryA4KsxcnCfwTfljzwmEeLnShEU?=
 =?us-ascii?Q?Ek36BI2WE8vUo/evCF2mgr5NLEkMbcpY9U6hmPxEjm4dhhKkd6M0prZwIQ3k?=
 =?us-ascii?Q?uw3buGWrfi8w+3ngPMosfTL5Hb/StshfA2KXlF8j2Ao7v0jLbVrmEwNr+nwn?=
 =?us-ascii?Q?Dxsh1ewJdQlpt5JdVSQPwkjbB1riWXwLOt5VyPd4JmjnJIFEGy57UYMiQ2dF?=
 =?us-ascii?Q?7CFv5bwlcKd5JtHrXrKguE52C1oPeMXniaGjR5E/5W2FzzdJTlKN5hWHRpNy?=
 =?us-ascii?Q?HnyuVQBKdw+01284W4ppmrFgilQuSQCxjTlDb1vF3WSxSl7hBLWpbnrW4+Vu?=
 =?us-ascii?Q?anzv3BY9NYW2qA94MWY0g+DunyrBnsZN6jyiffSnj4qylpDIOAMClf5Llm8v?=
 =?us-ascii?Q?G3R6Tfu1vjcIqMPsfCpJ9c6MRr1Dr9qQCK9bxJmryJu8pYIQweKbopY1RIEY?=
 =?us-ascii?Q?86hjmgOd4LVpCH+EVknGFz9vtvUrmv5tHqNB7RuRS8C2NGwBmcvKwf69DHcK?=
 =?us-ascii?Q?eTnr2qCmlGhnmgjcdFEKVooksftWNAXn3KDpVo3ld5Zp7LQVH9AtUOacO+6o?=
 =?us-ascii?Q?EEakOwTKlvo4DaHbT5XQ9D2d3Nyi7q550XudX4//+yzphUmpudsLxp3B4vF2?=
 =?us-ascii?Q?n7Mn43DH/rv/QeFVmxi1fMHvgH8o1Wz36B1/uPlSoAvIBCN03PDGcs151g4C?=
 =?us-ascii?Q?wcDHAPETW79dNcMvGrtBxxH5Jpl43YjwpAZw/Fn1raL9eqORnxg1CCCIzM2r?=
 =?us-ascii?Q?4q/1J4OF7XSorfeOGCDqnBvM9k7X+jJJ2zAX4oRBxdG0lAZQuqNGYIif8eym?=
 =?us-ascii?Q?YyjLQo2GOJp03FiFZnbvHgFnZZsvinKrlomfUHjovhuQ7NAPUuXoLq0nH+QW?=
 =?us-ascii?Q?t4IXRx2hgl0nIDc6O9H9oG9nkZCMSeZRUl3yQ8a5tPLtRFJbBBNBAdFhaBkt?=
 =?us-ascii?Q?N+PqwmK9cTd0nRKnXMeECXWBwbur2+iCprjUENkioAitxLTTDKKddrcHSMIq?=
 =?us-ascii?Q?PharIv1f4OdYJVQGi2IqcOz6Oy5ZWdQkEWisSxU2Gi7xEXRpv9p+oo5NqbAa?=
 =?us-ascii?Q?YNOeVHg38M6jyb2EutCLleD3MgMUxnXknrFTG6fwHV9AejkISrPY22iIRZ99?=
 =?us-ascii?Q?S6MtxIsPbvETPQy3JpNQkl7F1U/DW79IcFlV74YsQx0rwAauxSeyJ6OA+CRj?=
 =?us-ascii?Q?4Bp7X9YFw3LQeVFxS/4GBUM0jllErppj3KDFrbBM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 861483de-a829-44b4-dfc2-08dab021ff75
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 09:28:49.2514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GfBb3j68hqm3bRp4D8sVtid2ouJPZtiiL6NMxyIx6N0u0KkYpLwSF0l+YJGjGio8ZYdIdYL+j4aHSurFsd8rJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5912
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=chen.zhang@intel.com; helo=mga07.intel.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Qemu-devel <qemu-devel-bounces+chen.zhang=3Dintel.com@nongnu.org>
> On Behalf Of Thomas Huth
> Sent: Wednesday, October 12, 2022 5:15 PM
> To: qemu-devel@nongnu.org; Jonathan Cameron
> <Jonathan.Cameron@huawei.com>
> Cc: Laurent Vivier <lvivier@redhat.com>; Michael S . Tsirkin <mst@redhat.=
com>
> Subject: [PATCH] tests/qtest/cxl-test: Remove temporary directories after
> testing
>=20
> The cxl-test leaves some temporary directories behind. Let's clean them u=
p
> now!
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>

LGTM.
Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Thanks
Chen

> ---
>  tests/qtest/cxl-test.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c index
> cbe0fb549b..61f25a72b6 100644
> --- a/tests/qtest/cxl-test.c
> +++ b/tests/qtest/cxl-test.c
> @@ -101,6 +101,7 @@ static void cxl_t3d(void)
>=20
>      qtest_start(cmdline->str);
>      qtest_end();
> +    rmdir(tmpfs);
>  }
>=20
>  static void cxl_1pxb_2rp_2t3d(void)
> @@ -115,6 +116,7 @@ static void cxl_1pxb_2rp_2t3d(void)
>=20
>      qtest_start(cmdline->str);
>      qtest_end();
> +    rmdir(tmpfs);
>  }
>=20
>  static void cxl_2pxb_4rp_4t3d(void)
> @@ -130,6 +132,7 @@ static void cxl_2pxb_4rp_4t3d(void)
>=20
>      qtest_start(cmdline->str);
>      qtest_end();
> +    rmdir(tmpfs);
>  }
>  #endif /* CONFIG_POSIX */
>=20
> --
> 2.31.1
>=20


