Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7C7602143
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 04:40:55 +0200 (CEST)
Received: from localhost ([::1]:39310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okcXF-00048j-99
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 22:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1okcUN-0000oj-T8
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 22:37:57 -0400
Received: from mga12.intel.com ([192.55.52.136]:17109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1okcUK-000181-N5
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 22:37:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666060672; x=1697596672;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qEshvQNLMSmaMyA9F2m7wGwbeDgS6/NqfGzI/INboSE=;
 b=Oa4f2YQsFKXQtg7hWDW67+1rPlPoz4TdRosTM4Y+gNjKWsE75kIhJXc3
 eQTJ6aw9fUCWxk5Qqh9+krlhSg+AdGrMkBOT4lx2xhkOZMHEJnPi6N1eE
 G8J0pNPXvhbzEroLdgdfvi6Ku+ysU00aQrsV7cRG05AYMpH+QOscvMx0S
 3cRSYajamg9cD8dCZ5swCBU7Pvs3+nfo9yVvVI0R3l8udu7MmdRAYwqbL
 5qnogzJCbb9REkE3v2J2vfMXDOzOwFhZTSYM7lBYNn+ebyKW+TPWKHOht
 m4XPILlxqLu6ijHeAxciqrx2l6lb/dq6qqdStsWQZbeaqykMvCO/D6MCg Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="285699696"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="285699696"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 19:37:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="957579170"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="957579170"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 17 Oct 2022 19:37:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 19:37:25 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 19:37:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 19:37:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 19:37:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhcehOgB8neVQiwyYm1YzuN0mSln4xk+Ack3liIR9vypu0Ztq6NILC3RtsVDE/SH1cYhGfM30dPug9uuc5+V6/IW+0WM5ZmlpPuE76RH8caehvv2l9QlYc7x+iieIwknkFA32fh3FVscGUL59FrdslFzbpz5p5A8u7qhbPXTmqHBjn0p/0woeXFV2KsFGBDzOwl+n39BZ2E70/wQ62QgB3Td56Bw4PFcH0dwDnueyiIzd8AyLKGq10C849HsvmTTYbRhIbcCRrFHuYawArl2CQeX21BBjPkCBfi3oK4+kIJWMlriTDIDpg+LoZFKpEL4B2Zfd2eJz8YX+GJtNf/2ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMUZGtHD0bvqZyFairI8cG9bk3O7vxzr1ua6g53MveY=;
 b=Rd0tQeFdAPSPpuQnY0i0SdS6shwlbX6xfmydsmS3MXjbcylhz40ehvgmsMi2ALC0Rnm5qetcvvyijWpTUD7BIVdtDzobVWCXkBW6TOyufoZQeIkpzzgHPT/Q5vRQBhZ+BTL4UX87ck1IhbdXeRzwmXzWvrj5px8mrPUMbdRJ2r51budAxo0e7FyKcSdNAAqNIAwvK9/MWli9GnAsBq1/JfxOfYkBwxx7AMBKdp+55WFd04/7TRq8b4Dxyw1jYFb83190ghvgHZOYPGBQm2QxuytYZIkPHCy38UiRnBlPPCmhAliFof8Y0i2IWMUOljVbiYBWkqX5oq915HjdI7J70w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MN0PR11MB6232.namprd11.prod.outlook.com (2603:10b6:208:3c3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 18 Oct
 2022 02:37:22 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::500a:9fb6:7396:f43c]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::500a:9fb6:7396:f43c%7]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 02:37:22 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Avihai Horon <avihaih@nvidia.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Alex Williamson <alex.williamson@redhat.com>,
 "Kunkun Jiang" <jiangkunkun@huawei.com>
Subject: RE: [PATCH] vfio/migration: Fix wrong enum usage
Thread-Topic: [PATCH] vfio/migration: Fix wrong enum usage
Thread-Index: AQHY4T6qbDLNYCMovk61+O4Fo5BDJa4Tbbjg
Date: Tue, 18 Oct 2022 02:37:22 +0000
Message-ID: <MWHPR11MB003134E104A73113165B23FC9B289@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20221016085752.32740-1-avihaih@nvidia.com>
In-Reply-To: <20221016085752.32740-1-avihaih@nvidia.com>
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
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|MN0PR11MB6232:EE_
x-ms-office365-filtering-correlation-id: 97df934e-ab59-433b-4106-08dab0b1af7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DH4ewk46pYuqQRXZptt1uyOU/hUdTsd55dcnm6pw3UmfgSfsCXstKYH/ik8/8CaZkVEJ3074np6NVGKUPty4YudDqhErnXN5tqQtmfh3OjwyZj9SB5cXaD22IwVBw3491TZ/3qYG810dxM+RxziMw5aIGSaoSS/r+5iQNzRqXKaXWDRiCL/JCq3G0IuUmg8Iex+NpuW0TXJpQV+RUQN5YOGTq0knFZ54bCPirQPEVvTcxD/x2vQ5Y+VGoh3cYHfpDQ6h7F/op+K9HfOV7lDC4JLYt9hH4FxcuR9lWIYQ1MZINYcMTWC61Z9eX3Z1yo9L5b/R5nP4iN/Pi74hg9xcyRqoQTy6A7+aXW+frydwR07H6w3Cy6Uz7HGHSX4djXhRqnjY7U8W+bqWuFSPk+oE5LW8GN9rvlqIhqKr2J6xRrS1zoF4oBm510VhpmKbTrcdP6iYoPKErER1WKPrfd6zKyrqD+ceiHwoIN+gqy0oB1tDDd6yWXhcvTXtjdiiIiaHhmGTkg9fPAfOBH1fggw3hCpG0g//0HBhITWKt6nGWblIwoB6WYT9bJHiT0AZbub6AgnMGHhyEMg7RkJzOYUGGy0d/qMVHRjGFNomsUJPvYodcVkxtCfR9Nfl9W0OrDwGzCv8lezc5rlabOQFH14mhbmTKeEyAHNHkDpD7kJv96hp9Mi5DQpv4eR6hAz8Wy7KaSBTDPeZjf5JUnDbUcjdltR4LAz45wj59rlPOgV0uAyToEJNWcZjyxYbveKCLvx1lJpPq2hARj7KcBwbDdDqVg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199015)(66476007)(66946007)(8676002)(86362001)(38070700005)(41300700001)(66556008)(64756008)(33656002)(38100700002)(76116006)(71200400001)(82960400001)(66446008)(316002)(55016003)(83380400001)(122000001)(8936002)(5660300002)(52536014)(110136005)(9686003)(478600001)(2906002)(186003)(26005)(53546011)(7696005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cKlee/a8683J2yu409dqP+UrMSfUqy3MO8U5/ABE1bGpmeR4CV4bbzgXa87I?=
 =?us-ascii?Q?OXo5mjfsp+USEFudSwomvII+gUpeIUH4FcylkDYcnD4+QfAY7yk7fH1aVh+S?=
 =?us-ascii?Q?+yQihYH/SFKCly+TZFdvhh5iiy/yUmLjQjljRq/vpaDpiT57n6boYjtKlS2y?=
 =?us-ascii?Q?VqxuveKU6Ac+Oc31C5w3ujywD1B5lzMEFRJJZONgK80xDklUhccYvrtLrC4x?=
 =?us-ascii?Q?/+MB5hz8CC9XtbrQK77xKlvA0oe4jTpu2nfTtrgz73iVKiO8JoI7ee7A+2VH?=
 =?us-ascii?Q?v++kAjvvHYaS8UsBnHXOJuQG7T8m2jWUTOf54SIfTOVPuPYi86bZjloDbSCR?=
 =?us-ascii?Q?COiuMl375Urd4rGg4xMrRxiZCi2LsMCC4n2Lgfk5gzGdKTmAObSyU9kH/nP2?=
 =?us-ascii?Q?XgzDMKV7ASHkBo0hB+L2e9ADCDlYZJ4YV/sjF2k4tbcPWaQLUDOpYwabJ+gD?=
 =?us-ascii?Q?QxKTdJukJtANc9UipTBP/mu1hDyeF6WTsc3BQJ4MjsxUWTanipudg74wgh4M?=
 =?us-ascii?Q?VDqwkJ6TuhjRhaKKTH86MHSy4CzPfOEjAnoeCTxw9sGyyOi1YHhGt0Bah40W?=
 =?us-ascii?Q?yNxpzIeqv9gYUG4lr8PnFGwmqJOe76CoAloUtlnSaEsc1VD2DTJhZyDdiFLI?=
 =?us-ascii?Q?iT72zIwrtC3K19b1dizEpU4BEjPyKVxsFas89viOGo/c+YzZZpVhzyPFKx5v?=
 =?us-ascii?Q?yeCUaFl1eDi4Le0DpCfpoRkiaXQTbuEyFlgGzoHFFKcXjnWr4faDffizt2uh?=
 =?us-ascii?Q?HjDpp/luLG48axb4Fwf5kAlHWWvG7g9iBvqSLXWh2Y0Tnb7Z2jCZkDmy2nMu?=
 =?us-ascii?Q?DiTD7nNXG1QIjDk/9qD6jAyU4r3X1SFzOevBPK7uNznQYpVE1gzw9BsfaN64?=
 =?us-ascii?Q?W2ORZrUTY8GwJRdRhcnyij896h7IQ0q7oV6KoVrigW4loAmJCug6+bg4kcQg?=
 =?us-ascii?Q?/7SbwkobFSWBKfYcJz5a+0/k1Qeq+CVZM0bITM7qVvBPLYWJR1g3unBS2R2A?=
 =?us-ascii?Q?Xm+y17mNgGrgHFEw83dYDdAC/mrM1kZwK9SNhoiPs71fgbUv49w07krE6M+5?=
 =?us-ascii?Q?l5jQyhXBUxlB5KtYEuXJaZO4K7AnF19MczVbNDLryTl068FpdLLAap2/IzEA?=
 =?us-ascii?Q?hpQcvvI5340VlYw5nrdCJvw4tksTDdcOvul2Y5ffhGVCFH2uQpjNE9qTJUgS?=
 =?us-ascii?Q?vA3AXu6lHhVk/Rn2Y0hwhz8C44JVKTQeQ4UOs9yMAMfYoI7jwnEqDJBA4afg?=
 =?us-ascii?Q?fl+xkREPf6irDXgK1WLE4Ep715YEo5Ux9XEtwf2XcGV5rsQ+InXYaonfFKPt?=
 =?us-ascii?Q?MfyXC/1i8jUvxX5Es6slk9PH+BokFsTi+cfJR5U3EvEIaUktfHlBuN2VofwE?=
 =?us-ascii?Q?LOoPXgTRfHSZBk/8dEcA2Ht/+lTBwHx3hWqUC1q1dmuKS1wSHD9pqQzIxIfE?=
 =?us-ascii?Q?cf3epKeS1qHpp3TE6oeIDXiU85xuK3BhT+InaLX+nY0U2LODE7fdDrAq89T6?=
 =?us-ascii?Q?TTs46pPUT2Ziw/5FOd33MX9mWFEkCwIVCyu25QfSvac5WgmFB8uDUMfpZj3L?=
 =?us-ascii?Q?hpesb4cTig9mTFh0zqIvKNHQjz6cAzkOF3lBe6Li?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97df934e-ab59-433b-4106-08dab0b1af7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2022 02:37:22.6046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L1qC6yFYUx760CsmTXJXklJ0SM+FVTI//ZT1HDyyTvKuZzPnB33Bg2Y/O4q7tmKAiCXhob9Qf5gbF1rYsDqzKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6232
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136; envelope-from=chen.zhang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
> On Behalf Of Avihai Horon
> Sent: Sunday, October 16, 2022 4:58 PM
> To: qemu-devel@nongnu.org; Alex Williamson
> <alex.williamson@redhat.com>; Kunkun Jiang <jiangkunkun@huawei.com>
> Cc: Avihai Horon <avihaih@nvidia.com>
> Subject: [PATCH] vfio/migration: Fix wrong enum usage
>=20
> vfio_migration_init() initializes VFIOMigration->device_state using enum =
of
> VFIO migration protocol v2. Current implemented protocol is v1 so v1 enum
> should be used. Fix it.
>=20
> Fixes: 429c72800654 ("vfio/migration: Fix incorrect initialization value =
for
> parameters in VFIOMigration")
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>

Looks good to me.
Reviewed-by: Zhang Chen <chen.zhang@intel.com>

But I found nowhere using the enum of VFIO migration protocol v2 (vfio_devi=
ce_mig_state).
I don't know more about the background, should we remove the  redundancy de=
finition or add full support for
the VFIO migration protocol v2 ?

Thanks
Chen

> ---
>  hw/vfio/migration.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c index
> d9598ce070..8dbbfa2c56 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -803,7 +803,7 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>      }
>=20
>      vbasedev->migration =3D g_new0(VFIOMigration, 1);
> -    vbasedev->migration->device_state =3D VFIO_DEVICE_STATE_RUNNING;
> +    vbasedev->migration->device_state =3D VFIO_DEVICE_STATE_V1_RUNNING;
>      vbasedev->migration->vm_running =3D runstate_is_running();
>=20
>      ret =3D vfio_region_setup(obj, vbasedev, &vbasedev->migration->regio=
n,
> --
> 2.21.3
>=20


