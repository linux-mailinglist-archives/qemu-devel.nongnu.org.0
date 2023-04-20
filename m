Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7026E8DB0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:12:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQIx-0000dO-HJ; Thu, 20 Apr 2023 05:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ppQIr-0000bI-I6; Thu, 20 Apr 2023 05:10:10 -0400
Received: from mga01.intel.com ([192.55.52.88])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ppQId-00046C-O8; Thu, 20 Apr 2023 05:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681981795; x=1713517795;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gXvKtTdSderIJskP6DEJIt/7AKK32NbpQtnSO5Mo4o8=;
 b=V+k1nJuBiWZAttiiEBug5gdRdyrh3lLdiz9KNSxcEw+T5KjZDsQPti/y
 Vs4sFBVn2Vy9uuI1jneIznoaGI+uYOqpggsgclOhhMThKbc6d9gzYJDMG
 BFAEwPusauwglJdWBO3pzRnPISwf8FMuhetihenA7PtN9SCTpJj9xnmEP
 RpZxijwRHVPMUx7lHVfmR76oZdVQ4G+lDfF7lowN3xANsG8gHLfKGvNxh
 LC1DSaJUHf2/SMYKgmSRg1fFXehGqBVgt7nwZogpzep+SL6/+yj4QbMXe
 Pcq92OS6MBZjXtB23ORUyo23KbTJ8bMJpQGqkPBHQdFX/7kzsErVm8snO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="373574576"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="373574576"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 02:09:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="1021521101"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="1021521101"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 20 Apr 2023 02:09:50 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 02:09:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 02:09:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 02:09:50 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 02:09:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZrrKSa0uTqeMmJ7/hzpM6W+tLFYwIQ68VGMIsGL8XEH5i9JB4M23pvMbijJ6+X0w1aPDuJBHUHhPkzATSgV3xK9R0N73edpp9YwMiG4LzckNexDE1lyduKPU18av/IEL1AP2cwApnWlaryuonMtZ0w71Z9TChueaVwfP2XbahlhR+LRlFKKR59xgcna/aTMTpsowrLv3QfstBQ7DDJyQc29C3DwPZltfovS9y+OMxMz8YiUFcKkjcuPHpcHACLS4xfnsa6lnmd58aqrcnZE27DHcoymhAJDvPAoyhcpA6JYO9O1hSkzXBgrD70Pbmwd21nmGVqFC90rf3YA/EYutw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5zN1bQ5Bq3YmmZaFIpD48uF74FFALkNYAq9JnlHujo=;
 b=bmKxs3AEI/piBjmu1AqLOZXvkOKFBhcmEfuEhRj0d3/2vYGBPByugs63asNHyZDr5NQb0qnX/Zoy9RdyH6ICeC0ycX1Fp0fHJswtiFSp7A+uwmXvvIIswE/yPaGG7ibsN5vrnwbCsOCOzrL7QBJe4dEpOyiipH5wHRb70sxF0+Ij/qggI0QKIqae8A+/mlcOzBLoaeS4hy9zdfDdaDdb0LROqj95sVIM5bxxQ/Zi3T+jXVoxDDxXSiilHNtzN+7jXMIeLXBnePoihQolumPqvc4scvxQgje9NBYWL5G8Uelw7RPt+2mO2vhBGyvL7YmCS+DxcoclbX/q/+B7ALj20w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by CY5PR11MB6116.namprd11.prod.outlook.com (2603:10b6:930:2b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 09:09:48 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e%4]) with mapi id 15.20.6298.045; Thu, 20 Apr 2023
 09:09:48 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "michael.roth@amd.com"
 <michael.roth@amd.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>, "Zhang,
 Hailiang" <zhanghailiang@xfusion.com>, "philmd@linaro.org"
 <philmd@linaro.org>, "thuth@redhat.com" <thuth@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "dave@treblig.org" <dave@treblig.org>, "hreitz@redhat.com"
 <hreitz@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
Subject: RE: [PATCH v2 4/4] configure: add --disable-colo-filters option
Thread-Topic: [PATCH v2 4/4] configure: add --disable-colo-filters option
Thread-Index: AQHZcxHF8JmBz3Zr1EC3tnLXcpte268z5aQg
Date: Thu, 20 Apr 2023 09:09:48 +0000
Message-ID: <MWHPR11MB0031567319A3C4CE499F3CF99B639@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
 <20230419225232.508121-5-vsementsov@yandex-team.ru>
In-Reply-To: <20230419225232.508121-5-vsementsov@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|CY5PR11MB6116:EE_
x-ms-office365-filtering-correlation-id: 2fc5490e-d0a1-4637-c86f-08db417efdb1
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pk5mx6XL0KlJqwfKkdBjxrgjgxHsmCAbdJEAOZT9OBfpkVyQwW0yv7GwaHzdz+8YDQs/Yzmb/iStTu4pXRDjP4vZK8BV+/QbzaAens2Uy2BjsG/PaHEYVRm029PzTzjaTpa/Hdxa3OC77xqTUDVSzuL3lI9XRiRMchI2QXAmRvBTCpIUL2f6KMttayVe1J0ASMm7AtPBjgpuPzQyEmIQt6Lf34lKBdL4IxdQpH9dkQzYiTqkyia7GgQ3JaiNx4LwUjR4ubBY3aZpNdWZaUMw84x7T5/ZLx2zspt/7afP6fB048Be9wXXkx9HyApKk5wTm/8FQkYQ24uFi/Q5wPhJ6awdMLp1d2JYUG14A4oIoCB56dnL7I6KSYCE/wHJgHVMpBeSa2RFn2vogpnJFhVGd0z0z9M83BG7iBOR7lpyrAcpTH2tpShkYCdOJIbItPB422BRxsZsjmQ4upaeSqInJmcWIn+JljH5BDC3FV3g94NTcKCcpeE/F2SKg2N3ZVZxoRumCZWlgHFjoOMD0/xP4LnDNFJZ2ZG/qVbLjn2xrH6L5YHYuyPiNcwHZdqkYkVUC+eTgdH4bX4jLfbXAPu2coBjOOtyb71ghvJA8h9VkVlpQlLpG3hqGAw1plu8LCzA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199021)(8676002)(8936002)(38100700002)(55016003)(122000001)(64756008)(66446008)(66946007)(66556008)(66476007)(4326008)(82960400001)(41300700001)(316002)(38070700005)(76116006)(2906002)(52536014)(5660300002)(7416002)(186003)(53546011)(9686003)(26005)(6506007)(33656002)(110136005)(86362001)(83380400001)(54906003)(71200400001)(7696005)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VRfIr4EeTOAKkd0i9VG87eshttV9QBTXAnMpTZAQyY1jbJizJpDNXXuYWiJ4?=
 =?us-ascii?Q?s1+ysTVS5F+m9YH66/cFwdcO8niAJObiwqo8wj0cJtEOU0kHXiPQ7w+r8owp?=
 =?us-ascii?Q?3p966JF8PRAFjcTqlJNrSWDc8yTev1qe0vFCDT3N4YejfaYX3Fmh37k7jaNb?=
 =?us-ascii?Q?q1mYt3JtxkdO8bDw8wPlgEPuo6F9eiEijzoObHm5wxDfSIeiHi6C/bDU2541?=
 =?us-ascii?Q?ouGwLjMEE/DP2pFohkN5B9Fp3qYa/KOm3JLcQ2sY1D5qAJ7FlSJPS+vDiEjw?=
 =?us-ascii?Q?9i5PvQU9TmFebQppHTdqt+0/YM97QRUSzRhyhgTHqwCAFBSNscUJqpal5KAF?=
 =?us-ascii?Q?VKMdoyLT1RCQ6Q/NKf67i1vT+PWx5U0IDdkTktaGSudK5GPont6eoGOhhyED?=
 =?us-ascii?Q?YI/6nWTTilYA+qfn1dHzqLxW3FTm9cym5EOJC14FR0hP0i8J+7oXWjB4AlHg?=
 =?us-ascii?Q?f1ELcUNCelXKbtKY6ekYH0IhDtehp103MaW5nz7UJ4ar+aYBMMIduYGcQjnF?=
 =?us-ascii?Q?FWoE1cwz4I8m4b3ap3dfKmAGA8N4+aP7RChjx4jkrd/4q9ZU0533BEEqmEZA?=
 =?us-ascii?Q?2hBt/SdSRpVIcqA3Zi42OhfDXHCgE7qTGDXEBplJDDDXKgfch/wvJ2gVcMXz?=
 =?us-ascii?Q?IpDNpkSWolSHa9AbZfYf6bUMAsfKOqkixyLBt6p636oH48ArRzHq7WpTXp4Z?=
 =?us-ascii?Q?4MdCao71yMYZQHcdYThsJfay57HiMh5yQX4Fw120LaQ1vK5XpfcQBy+SLv45?=
 =?us-ascii?Q?e9Z1liO5ri2yuX0FrDOl0paLQgqL1O3vauejXz/poN6sH5b4FxlCCp66cl+M?=
 =?us-ascii?Q?G7klpsEIww2S0L3SXAdX0nNEnH5xuQ7sgqVqRO6suSRRerWlGkL2MjszlD+D?=
 =?us-ascii?Q?YcmzNdGZWV63EsvbaSAzabF9Dzqq2oOqpcccSQE2BYinEeTRSLNgtxT/Kyu3?=
 =?us-ascii?Q?kTnGF/E57q2O/5YG5h6kIInjs2GAGMV+0E2DruQ49pPEF1TCMLZ48b/6yrWU?=
 =?us-ascii?Q?zXjYWn0bsUFuPsm4uTWsegDP23o1cE3ymFb3mU4Xhs8d3jNLqzTNTqEYB6Va?=
 =?us-ascii?Q?Kj04ltJApZ+TqFhdBnXIY233sy/DN3TfnD5fvrbPuAZxOAnmauPY/Eia3UgO?=
 =?us-ascii?Q?HRG5jV9D0Cm0i7ythKg7neEU0vwWkJ5FmGjolG1aHw21U91/itpbxuPksRaL?=
 =?us-ascii?Q?jaUd84IFbJJm0JXZlsXKwEI1RlShNUwF9gLlJmjrdr6LbzeLEgt/tR4umPek?=
 =?us-ascii?Q?b6cWA2WT7QuJq3nxlIhpiB9GzcJSRnhdV3sJQMfn8PeOx3kYjO3HjGFISWqG?=
 =?us-ascii?Q?a2InWJ0GeYibds+R6x6PtxRa0cmmLPfFbThIy45DKhfE9FxyvIpZ4Eo0JAi9?=
 =?us-ascii?Q?SMi2KFA105JhISpBbRltBcAL7ownN8eISxJgUQXqn0vKco8sk924UoamFEUk?=
 =?us-ascii?Q?DmJuNrR2I2w1I5V5SVVcF1BzaPWzowJKf26NOsqB/gqAb5V2yIBRqwSz5IqF?=
 =?us-ascii?Q?Kg/x2ezHtd/P0HIFv62pWGCqZDn2NFQJr0De81lM1cEgLzm3b+hmUa0guCue?=
 =?us-ascii?Q?VTwK+kov3sU+UpNC9Z8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc5490e-d0a1-4637-c86f-08db417efdb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 09:09:48.0657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7MUsoQHssSHwwqpouqqDlML9m4waPhI9aKQ53FVbxcIxlPLxXlfIJYuT7z5z1pxOv6KNEuOus352AaLlR/37mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6116
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88; envelope-from=chen.zhang@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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



> -----Original Message-----
> From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Sent: Thursday, April 20, 2023 6:53 AM
> To: qemu-devel@nongnu.org
> Cc: qemu-block@nongnu.org; michael.roth@amd.com; armbru@redhat.com;
> eblake@redhat.com; jasowang@redhat.com; quintela@redhat.com; Zhang,
> Hailiang <zhanghailiang@xfusion.com>; philmd@linaro.org;
> thuth@redhat.com; berrange@redhat.com; marcandre.lureau@redhat.com;
> pbonzini@redhat.com; dave@treblig.org; hreitz@redhat.com;
> kwolf@redhat.com; Zhang, Chen <chen.zhang@intel.com>;
> lizhijian@fujitsu.com; Vladimir Sementsov-Ogievskiy <vsementsov@yandex-
> team.ru>
> Subject: [PATCH v2 4/4] configure: add --disable-colo-filters option
>=20
> Add option to not build COLO Proxy subsystem if it is not needed.

I think no need to add the --disable-colo-filter option.
Net-filters just general infrastructure. Another example is COLO also
use the -chardev socket to connect each filters. No need to add the --disab=
le-colo-chardev....
Please drop this patch.=20
But for COLO network part, still something need to do:
You can add --disable-colo-proxy not to build the net/colo-compare.c  if it=
 is not needed.
This file just for COLO and not belong to network filters.

Thanks
Chen

>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  meson.build                   |  1 +
>  meson_options.txt             |  2 ++
>  net/meson.build               | 11 ++++++++---
>  scripts/meson-buildoptions.sh |  3 +++
>  4 files changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/meson.build b/meson.build
> index c44d05a13f..5b2fdfbd3a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1962,6 +1962,7 @@ config_host_data.set('CONFIG_GPROF',
> get_option('gprof'))
> config_host_data.set('CONFIG_LIVE_BLOCK_MIGRATION',
> get_option('live_block_migration').allowed())
>  config_host_data.set('CONFIG_QOM_CAST_DEBUG',
> get_option('qom_cast_debug'))
> config_host_data.set('CONFIG_REPLICATION',
> get_option('replication').allowed())
> +config_host_data.set('CONFIG_COLO_FILTERS',
> +get_option('colo_filters').allowed())
>=20
>  # has_header
>  config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h')) diff =
--git
> a/meson_options.txt b/meson_options.txt index fc9447d267..ffe81317cb
> 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -289,6 +289,8 @@ option('live_block_migration', type: 'feature', value=
:
> 'auto',
>         description: 'block migration in the main migration stream')
> option('replication', type: 'feature', value: 'auto',
>         description: 'replication support')
> +option('colo_filters', type: 'feature', value: 'auto',
> +       description: 'colo_filters support')
>  option('bochs', type: 'feature', value: 'auto',
>         description: 'bochs image format support')  option('cloop', type:=
 'feature',
> value: 'auto', diff --git a/net/meson.build b/net/meson.build index
> 38d50b8c96..7e54744aea 100644
> --- a/net/meson.build
> +++ b/net/meson.build
> @@ -1,12 +1,9 @@
>  softmmu_ss.add(files(
>    'announce.c',
>    'checksum.c',
> -  'colo.c',
>    'dump.c',
>    'eth.c',
>    'filter-buffer.c',
> -  'filter-mirror.c',
> -  'filter-rewriter.c',
>    'filter.c',
>    'hub.c',
>    'net-hmp-cmds.c',
> @@ -22,6 +19,14 @@ if get_option('replication').allowed()
>    softmmu_ss.add(files('colo-compare.c'))
>  endif
>=20
> +if get_option('replication').allowed() or
> +get_option('colo_filters').allowed()
> +  softmmu_ss.add(files('colo.c'))
> +endif
> +
> +if get_option('colo_filters').allowed()
> +  softmmu_ss.add(files('filter-mirror.c', 'filter-rewriter.c')) endif
> +
>  softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
>=20
>  if have_l2tpv3
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index 009fab1515..cf9d23369f 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -83,6 +83,7 @@ meson_options_help() {
>    printf "%s\n" '  capstone        Whether and how to find the capstone =
library'
>    printf "%s\n" '  cloop           cloop image format support'
>    printf "%s\n" '  cocoa           Cocoa user interface (macOS only)'
> +  printf "%s\n" '  colo-filters    colo_filters support'
>    printf "%s\n" '  coreaudio       CoreAudio sound support'
>    printf "%s\n" '  crypto-afalg    Linux AF_ALG crypto backend driver'
>    printf "%s\n" '  curl            CURL block device driver'
> @@ -236,6 +237,8 @@ _meson_option_parse() {
>      --disable-cloop) printf "%s" -Dcloop=3Ddisabled ;;
>      --enable-cocoa) printf "%s" -Dcocoa=3Denabled ;;
>      --disable-cocoa) printf "%s" -Dcocoa=3Ddisabled ;;
> +    --enable-colo-filters) printf "%s" -Dcolo_filters=3Denabled ;;
> +    --disable-colo-filters) printf "%s" -Dcolo_filters=3Ddisabled ;;
>      --enable-coreaudio) printf "%s" -Dcoreaudio=3Denabled ;;
>      --disable-coreaudio) printf "%s" -Dcoreaudio=3Ddisabled ;;
>      --enable-coroutine-pool) printf "%s" -Dcoroutine_pool=3Dtrue ;;
> --
> 2.34.1


