Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855866E0AAA
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 11:54:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmtdX-00045G-9A; Thu, 13 Apr 2023 05:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1pmtdU-00044T-AB; Thu, 13 Apr 2023 05:53:00 -0400
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1pmtdQ-00051H-UE; Thu, 13 Apr 2023 05:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681379576; x=1712915576;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1NPmbSPfb5DmzQkRH6PWyDu3CwMRo4cXTPltCmbI7Fs=;
 b=YdkIdNH3kKXv6nD890Aakjn6nbtU1yXjkPyv6Fw76Puo/dgwLXbKrYGR
 cK6GMPCGAks6q/SxnKaIJaqgSrElRuilMF05dcdBhP28iXvzJpzwLHC1A
 j3GfGC9TsrgP53uRD3j8IQ3lG1/Tci4KA1gUnbnvPXuY84vCZdx3Kkf/E
 XctY+aN9lRJeXrpW+zrEHPRq4qUqVPgdWOP2myq6A2+JK/UQEBOrxLd9m
 gXHrnIbEijQt71flQK/f/j3MvfxBuAYIasev/VvTjktT1oao1dcT/nN+G
 CkjK+YsrJYucJ+iQyP9Vl3jBcKWzn86uH3cpeduvxp1pV6itIYoECIfIs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="406978265"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; d="scan'208";a="406978265"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 02:52:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="935531358"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; d="scan'208";a="935531358"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 13 Apr 2023 02:52:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 02:52:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 13 Apr 2023 02:52:40 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 13 Apr 2023 02:52:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+uesGma8y5nqyp2DVcngjwJargjFeUR5Y8RmV3KVBJDL4Cuj/TsspmM1DhnlmduDdRp9CECYESlAocGYM/fCEpgi3ND+cicx55HglwMBB7tUOoeZyqy1wvfB9Yt9OMsnkgsZo83FwBdlemjViuL+SHK7+1vl6rrcD5fJnIATT81Mp0mPXIvBvUb2LzlaWBfC+s+3mHytqv5UEQULtg+WihVwD8xEmcVZ78GiOlUav70PHfcGvHHGk50XZej6AbCbP2XRyCnonWg891SQqcs4W5bVT4BJsHssRSHqxCwJemAvAKSOKyRlon5PoGW2Fx3uCzRtkcC3owLmyM1ZT5S0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgCJmCFvFILlnX7zVYrnzTKZ/6bfqR+ttWpLS4JwNK0=;
 b=amlVwpLDimtozGdlo97xO/McAmNtSrq0tILqNmz18oHiHKb+yo/V+DHm1tFKGKcC27AYsPrpIcFn+20B2FRtLwghm01cX5gjo287QdFhMyqNRyeb4kDQXXh+7KvvUTsff/ANDURIzBLIRairHwVTCaeybiG5mZm8a2w+7xjBqXUmy+UB+tHxITXNoiUnpKCToz+rmyGjDZNEDLF2TdHK+zQT7yX6dJpBKagJK1CkV3HChwtD0awyGg+2SxBolylytPpsbWYWy8TbPo7YdTEDoDL1B+V0bGtKxV9VaeQhZu7EIaG4FSiVL7LO6lfdnWSRx6uyGSK6QC4GSaEBGEfN1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by SN7PR11MB7568.namprd11.prod.outlook.com (2603:10b6:806:34e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Thu, 13 Apr
 2023 09:52:37 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e%4]) with mapi id 15.20.6298.028; Thu, 13 Apr 2023
 09:52:37 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>, "hreitz@redhat.com"
 <hreitz@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>, "Zhang, Hailiang"
 <zhanghailiang@xfusion.com>, "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>, 
 "wencongyang2@huawei.com" <wencongyang2@huawei.com>,
 "xiechanglong.d@gmail.com" <xiechanglong.d@gmail.com>,
 "den-plotnikov@yandex-team.ru" <den-plotnikov@yandex-team.ru>
Subject: RE: [PATCH] replication: compile out some staff when replication is
 not configured
Thread-Topic: [PATCH] replication: compile out some staff when replication is
 not configured
Thread-Index: AQHZbIUrWGe87sFjyEi3Ix51+Xqenq8o85bw
Date: Thu, 13 Apr 2023 09:52:37 +0000
Message-ID: <MWHPR11MB003181F7E37662CE2F22C17F9B989@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230411145112.497785-1-vsementsov@yandex-team.ru>
In-Reply-To: <20230411145112.497785-1-vsementsov@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|SN7PR11MB7568:EE_
x-ms-office365-filtering-correlation-id: d4e6414c-07eb-4d35-f14d-08db3c04d010
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u78XRhi97OFq62kGHBcuET1NHi20cYMZNvIf7RKEYVMLQsoVXoiu3t7T6o8RPkDgsrVBaya+P+YdXN2bgrOs8POd/3ltqFMcoStNgn2EqmuE+AKBvZTWH7MfWwfaiD/mmj7G60XeNc8I8BepIDWfqcSWltulmPdSvo62qzxbnjLu7NAyWdrGdSDTTBB6cuIpF+bWib6FzsP47qUbxUw8ZkdPJS1KgrQI60vlW6kQSE/EclYN6Ag8OKzHAggQYoXftNg7XCv2msYaoe3AFf8YxaitYb/WeN4YCyq6cR2Ixi50W2LlainVe/7rkMh4YTYNaz4c5m3oHqek1kst8rZyK8HS79USsZb2u4puv2FrSdbsJPhVg8/OA4HcR6PthOLgHsu25W7mfa/iflY/rnej1sn9iFk74ocTx6LqKXalR6HrTJP3+/MBZbq7I+hicCeoU/O9sPAD7KU3NGN99KKaCO38LDT+p+NMZPP8mrRLx1HrVYmQgAx+R0F84sVw+94AH4vE/mAL7+4Bz2N83I2pU9gvMVBQImiY+3tY4kfZin0wSsA8S0ty64R3MPw+4wia65fSCnxtmL8NnJjyr52Fr1/2Okm43QTToSWV4y6XnZ8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(366004)(346002)(396003)(136003)(451199021)(478600001)(7696005)(71200400001)(83380400001)(55016003)(82960400001)(122000001)(33656002)(38070700005)(86362001)(38100700002)(966005)(2906002)(53546011)(316002)(6506007)(9686003)(26005)(110136005)(186003)(66446008)(54906003)(5660300002)(64756008)(66946007)(66476007)(52536014)(8936002)(41300700001)(66556008)(7416002)(8676002)(4326008)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6EB1AzoGZRYS6XAetKmQQiYutAvNJ1mxBJrvjlTII9jdsT4cW2BvRbZG62En?=
 =?us-ascii?Q?guosX6Klu4eETnjTVK8Yjdw4NubqIDmGvPRRPzT4PSyTaL6TvfpGfo8TPqDr?=
 =?us-ascii?Q?NTvMlILdKcHK+1UZKHAW+q1hvMfqDL/LBw+aWB1G78kofBqo+ptXFBcDkKMR?=
 =?us-ascii?Q?OqrPpUj8EHA5zc6g8U9yXp98ZmDxP78c+fJ9ZsNtJHYrxEr8xpbKQbz4Gjwf?=
 =?us-ascii?Q?rK4TPohwEf/j+UoNgWAFwcGVkqL2wo3WSgqxrpIr2wiEy4mzF2e8JlsyGlS/?=
 =?us-ascii?Q?iKkDx+fC9RzyNn4RWYgzdj9z9PffEa7FxSc8/fVxwfXvtZWG39g2rkVsbF7N?=
 =?us-ascii?Q?aPR53gy2L3oVQlokTU3fsPZ78rGBmNpoRbDsqsqMgLT6sHD3LFXPZF1jnTX/?=
 =?us-ascii?Q?XJP+V8hvkUbzIc3g7td8oI6HuKgc/ixrQwThPNnPXBjmEzKA8QQD//xiCNHU?=
 =?us-ascii?Q?VIK3V1npX3REokg5Ch4VOe4Ca+bprlmx5prazR6tB8hm8KR2ta6WtNiYh0AP?=
 =?us-ascii?Q?L5xnqo9Y1+qWHH09F1uknlneIhkg+3T/iQVQeQmxkbCGRjtBYZX1yAc7FoGr?=
 =?us-ascii?Q?EpJQKkkjJssmOQLGRyJxknhe5oeU51q5MWzRV7HV14WtFgURxhtRi0thnFZk?=
 =?us-ascii?Q?t8gyuQc3nF5nzp7bnxu4gzQFBPfssQjOqtRtYgxc8iZ6JuiphiW3oe9uykn0?=
 =?us-ascii?Q?ioMVyxMPbeF2Un0JEd0wskn2a45uw+VrJJCV9SKKYOyYmEU7x4647hgL4K8O?=
 =?us-ascii?Q?F688/nuEJki53LDXvK5EI17YlspD0icZ9fYWNSkuuE+zZ0Ux4+zmFQcwZIf6?=
 =?us-ascii?Q?JXU+mBhPZJcUcCGuRFmVw6CZHcbKajQVHfHNKyzjgeoZunIc0gVI0IhW4pve?=
 =?us-ascii?Q?srSxFSCW3ZaXComEasRIxHzoATBDO+v1Jgl3LDoYsnMgHtjeqkAstzmO10Gx?=
 =?us-ascii?Q?Z30QvBNhjpkvjRhZxtHV0H8/Vmp7SLi5fLoZFN6b7NQIXYF+k2+ZH2nAVHhK?=
 =?us-ascii?Q?fLJnhTbH9j+LADiOu4Rpcc65l8Q7oqhpiAni0lemPZrYj9L/BXs1IQ7X1owI?=
 =?us-ascii?Q?2ULJ+uLJhjMLb1lgXdPHC48VoXUmXW8syYgABR/IF+50WSIHER8adpCL3a6q?=
 =?us-ascii?Q?QzecTGSIsAe9/gORRokMFp8Odr2uGthTUr/elyWx4R38OklK2PjYX/9NISCo?=
 =?us-ascii?Q?zmfZRD/9Rauzb2uLdxg0j3a81y1ziwHIs8wslOFrKLCWGEhkqnRlhR6FWHbV?=
 =?us-ascii?Q?+5D+Bor7K9+KpaHSp6/XOKrTzTcIz2OvpJm7QjSpxNg+ljSOUe4fIqaHoMff?=
 =?us-ascii?Q?+F6NYTl9IYqkOz4279x4ujJzaWJh6vNdIyzTW2LIzEQo91KtlCvH71lfy50X?=
 =?us-ascii?Q?1ZXpKfWU+5IiB/j7drHO72Syh3CaT4MWKwkOeS6cmqgPzB/1Z1RgUPvrvZDE?=
 =?us-ascii?Q?bLJBHhd6g63Ay5sI9nZf11X+g1oLBPxblBM2Vv2fFrKTQDoz5V4HmMvpLVtW?=
 =?us-ascii?Q?4784aE5Z5j6j9ikmL7Nt+qdmk4f+/27poAAdD52G1DvAYVmLWazMAZkg0XYD?=
 =?us-ascii?Q?lINK/FlP4lus8VgejrSn92ycDue4+T/MqtzBhNeW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e6414c-07eb-4d35-f14d-08db3c04d010
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2023 09:52:37.0759 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZovRy7IblR+J4RS3AyaRLtIu5FTUO2XazZpbnxzL/Ju976PGEr64nFME7/FS901rb/0X6+fyQGNi+yiPiVD+BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7568
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Sent: Tuesday, April 11, 2023 10:51 PM
> To: qemu-devel@nongnu.org
> Cc: qemu-block@nongnu.org; pbonzini@redhat.com; armbru@redhat.com;
> eblake@redhat.com; jasowang@redhat.com; dgilbert@redhat.com;
> quintela@redhat.com; hreitz@redhat.com; kwolf@redhat.com; Zhang,
> Hailiang <zhanghailiang@xfusion.com>; Zhang, Chen
> <chen.zhang@intel.com>; lizhijian@fujitsu.com;
> wencongyang2@huawei.com; xiechanglong.d@gmail.com; den-
> plotnikov@yandex-team.ru; Vladimir Sementsov-Ogievskiy
> <vsementsov@yandex-team.ru>
> Subject: [PATCH] replication: compile out some staff when replication is =
not
> configured
>=20
> Don't compile-in replication-related files when replication is disabled i=
n
> config.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>=20
> Hi all!
>=20
> I'm unsure, should it be actually separate --disable-colo / --enable-colo
> options or it's really used only together with replication staff.. So, I =
decided
> to start with simpler variant.
>=20

For replication, I think there's nothing wrong with the idea.
But not so for COLO.  COLO project consists of three independent parts: Rep=
lication, migration, net-proxy.
Each one have ability to run alone for other proposals. For example we can =
just run filter-mirror/redirector for networking
Analysis/debugs. Although the best practice of COLO is to make the three mo=
dules work together, in fact, we can also
use only some modules of COLO for other usage scenarios. Like COLO migratio=
n + net-proxy for shared disk, etc...
So I think no need to disable all COLO related modules when replication is =
not configured.
For details:
https://wiki.qemu.org/Features/COLO

Thanks
Chen

>=20
>  block/meson.build     |  2 +-
>  migration/meson.build |  6 ++++--
>  net/meson.build       |  8 ++++----
>  qapi/migration.json   |  6 ++++--
>  stubs/colo.c          | 46 +++++++++++++++++++++++++++++++++++++++++++
>  stubs/meson.build     |  1 +
>  6 files changed, 60 insertions(+), 9 deletions(-)  create mode 100644
> stubs/colo.c
>=20
> diff --git a/block/meson.build b/block/meson.build index
> 382bec0e7d..b9a72e219b 100644
> --- a/block/meson.build
> +++ b/block/meson.build
> @@ -84,7 +84,7 @@ block_ss.add(when: 'CONFIG_WIN32', if_true: files('file=
-
> win32.c', 'win32-aio.c')
>  block_ss.add(when: 'CONFIG_POSIX', if_true: [files('file-posix.c'), core=
f, iokit])
>  block_ss.add(when: libiscsi, if_true: files('iscsi-opts.c'))
>  block_ss.add(when: 'CONFIG_LINUX', if_true: files('nvme.c')) -if not
> get_option('replication').disabled()
> +if get_option('replication').allowed()
>    block_ss.add(files('replication.c'))
>  endif
>  block_ss.add(when: libaio, if_true: files('linux-aio.c')) diff --git
> a/migration/meson.build b/migration/meson.build index
> 0d1bb9f96e..8180eaea7b 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -13,8 +13,6 @@ softmmu_ss.add(files(
>    'block-dirty-bitmap.c',
>    'channel.c',
>    'channel-block.c',
> -  'colo-failover.c',
> -  'colo.c',
>    'exec.c',
>    'fd.c',
>    'global_state.c',
> @@ -29,6 +27,10 @@ softmmu_ss.add(files(
>    'threadinfo.c',
>  ), gnutls)
>=20
> +if get_option('replication').allowed()
> +  softmmu_ss.add(files('colo.c', 'colo-failover.c')) endif
> +
>  softmmu_ss.add(when: rdma, if_true: files('rdma.c'))  if
> get_option('live_block_migration').allowed()
>    softmmu_ss.add(files('block.c'))
> diff --git a/net/meson.build b/net/meson.build index
> 87afca3e93..634ab71cc6 100644
> --- a/net/meson.build
> +++ b/net/meson.build
> @@ -1,13 +1,9 @@
>  softmmu_ss.add(files(
>    'announce.c',
>    'checksum.c',
> -  'colo-compare.c',
> -  'colo.c',
>    'dump.c',
>    'eth.c',
>    'filter-buffer.c',
> -  'filter-mirror.c',
> -  'filter-rewriter.c',
>    'filter.c',
>    'hub.c',
>    'net-hmp-cmds.c',
> @@ -19,6 +15,10 @@ softmmu_ss.add(files(
>    'util.c',
>  ))
>=20
> +if get_option('replication').allowed()
> +  softmmu_ss.add(files('colo-compare.c', 'colo.c', 'filter-rewriter.c',
> +'filter-mirror.c')) endif
> +
>  softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
>=20
>  if have_l2tpv3
> diff --git a/qapi/migration.json b/qapi/migration.json index
> c84fa10e86..5b81e09369 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1685,7 +1685,8 @@
>  ##
>  { 'struct': 'COLOStatus',
>    'data': { 'mode': 'COLOMode', 'last-mode': 'COLOMode',
> -            'reason': 'COLOExitReason' } }
> +            'reason': 'COLOExitReason' },
> +  'if': 'CONFIG_REPLICATION' }
>=20
>  ##
>  # @query-colo-status:
> @@ -1702,7 +1703,8 @@
>  # Since: 3.1
>  ##
>  { 'command': 'query-colo-status',
> -  'returns': 'COLOStatus' }
> +  'returns': 'COLOStatus',
> +  'if': 'CONFIG_REPLICATION' }
>=20
>  ##
>  # @migrate-recover:
> diff --git a/stubs/colo.c b/stubs/colo.c new file mode 100644 index
> 0000000000..5a02540baa
> --- /dev/null
> +++ b/stubs/colo.c
> @@ -0,0 +1,46 @@
> +#include "qemu/osdep.h"
> +#include "qemu/notify.h"
> +#include "net/colo-compare.h"
> +#include "migration/colo.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-migration.h"
> +
> +void colo_compare_cleanup(void)
> +{
> +    abort();
> +}
> +
> +void colo_shutdown(void)
> +{
> +    abort();
> +}
> +
> +void *colo_process_incoming_thread(void *opaque) {
> +    abort();
> +}
> +
> +void colo_checkpoint_notify(void *opaque) {
> +    abort();
> +}
> +
> +void migrate_start_colo_process(MigrationState *s) {
> +    abort();
> +}
> +
> +bool migration_in_colo_state(void)
> +{
> +    return false;
> +}
> +
> +bool migration_incoming_in_colo_state(void)
> +{
> +    return false;
> +}
> +
> +void qmp_x_colo_lost_heartbeat(Error **errp) {
> +    error_setg(errp, "COLO support is not built in"); }
> diff --git a/stubs/meson.build b/stubs/meson.build index
> b2b5956d97..8412cad15f 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -45,6 +45,7 @@ stub_ss.add(files('target-get-monitor-def.c'))
>  stub_ss.add(files('target-monitor-defs.c'))
>  stub_ss.add(files('trace-control.c'))
>  stub_ss.add(files('uuid.c'))
> +stub_ss.add(files('colo.c'))
>  stub_ss.add(files('vmstate.c'))
>  stub_ss.add(files('vm-stop.c'))
>  stub_ss.add(files('win32-kbd-hook.c'))
> --
> 2.34.1


