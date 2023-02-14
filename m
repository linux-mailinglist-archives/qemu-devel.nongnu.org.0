Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8DF69568D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 03:17:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRkrG-00079y-V6; Mon, 13 Feb 2023 21:15:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dapeng1.mi@intel.com>)
 id 1pRjs4-0000uX-93
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 20:12:36 -0500
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dapeng1.mi@intel.com>)
 id 1pRjs0-0004m6-U7
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 20:12:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676337152; x=1707873152;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KRuyOKZ2iRKyZtNOkv21Q7qzNtPUlA+CxIbhaEPK8ew=;
 b=g0xNqy3HuJP58MIGAo2IeyHtnc2x/cCaMoZCvJxvs3gt5EZaBSvRlnTh
 csBnuO7iEVxOB/+AC93c33Zv/kemves8co1lXCWfGReV0MOUPhlqpOpse
 O8doirBs7AK7YWpizIHxKQo9aDwtLnR8WC+tzLpA0KPkvJMHgnloRJ3r7
 1++YRxQzUHf2XDsbIRn7dZ5sEcnEBvD6i/fKLwhN4NHHmDk/KJHOPa2+t
 Agw3/kzo2wG6oYjnZzN2ZSvLzBtYNF8luOL7weeHlt2SeQ6W4V1VGhgI+
 oFU9W8ZYajMLkQ5h5/Z5RH+tV5MiaDrn1/tpL48T0HecX0P/n9xntGag8 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="331047826"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="331047826"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 17:12:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="671049798"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="671049798"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 17:12:18 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 13 Feb 2023 17:12:18 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 13 Feb 2023 17:12:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 13 Feb 2023 17:12:17 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 13 Feb 2023 17:12:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfyTwuxmIHxJju2hIz62JbVRhtxQi9up5cCt+I/iU5damzCmomBywq25cgjzrUX26rx1nVbVceZhXKKJkX1rD48JCXFbgoIJ3ErbFXM8RcGzGqBTmwbns1w6zi8YHKrHjXwBUbBQI+/t5zcRESEgRfG9kdMAZ53+9Wzs3FOsYTQc5tuZ6GXpeaaTclux//uxwGDU6sHdjqzD6bkeVLmJ26O/MvZHbWvw1FhzrO9fFPS8ScbLirKFlv2pYUcnwljNeAGmyVgNGBFaEAewyqIMzTd6gGsPmd2y284zVsBDy/w5EHON5c6b1ZDaOV2Y7zaWpW8uiFJd5RpaSgcuBOnLvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EGiTIZtExkXVUZma+wq5YF/sHwpu/HJwdrT1MIvgIA=;
 b=gs+DR4PevvDKGm6y9C5F59mM5WDih+naWNSD4hTbqrsQM/NLNMoXEh8mridzy8o9J5wxQ2Mv+hOOzq7U0xEkn6f5WCTekydx1H0o22jYsjwyIcw8kYXY7yYNe7DsbyJUEneUmg9RqzzcqrsesINsqpRm4XokhxU63Q17mEtj64SzLta01t7/usj+Ze+/zwl816u7oqUQMwMkVj+v5Jo97+3B6nfsu6BDmL+atl8K9q/hOI4DU7X/0VqOMyIzqiig4vFXJF4+1joaGlJGYc64qv2uOYnDE28gsw0fUpbFFrMF9LbJlS0JHY7LPM7c1Gr9U5uWJ+qW/laPmzYsDHYR8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4824.namprd11.prod.outlook.com (2603:10b6:510:38::13)
 by SA3PR11MB8001.namprd11.prod.outlook.com (2603:10b6:806:2f5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Tue, 14 Feb
 2023 01:12:12 +0000
Received: from PH0PR11MB4824.namprd11.prod.outlook.com
 ([fe80::6b21:a6a4:3b0c:8aa0]) by PH0PR11MB4824.namprd11.prod.outlook.com
 ([fe80::6b21:a6a4:3b0c:8aa0%9]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 01:12:12 +0000
From: "Mi, Dapeng1" <dapeng1.mi@intel.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang
 <wangyanan55@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Richard
 Henderson" <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Wang, Zhenyu Z"
 <zhenyu.z.wang@intel.com>, "Ding, Zhuocheng" <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>, "Christopherson,, Sean"
 <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>, "Liu, Zhao1"
 <zhao1.liu@intel.com>
Subject: RE: [RFC 08/52] machine: Add helpers to get cpu topology info from
 MachineState.topo
Thread-Topic: [RFC 08/52] machine: Add helpers to get cpu topology info from
 MachineState.topo
Thread-Index: AQHZP4+mkrkOxt/gCE2Os1evjVu5sq7Norwg
Date: Tue, 14 Feb 2023 01:12:11 +0000
Message-ID: <PH0PR11MB4824873E281A747152F25AFDCDA29@PH0PR11MB4824.namprd11.prod.outlook.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-9-zhao1.liu@linux.intel.com>
In-Reply-To: <20230213095035.158240-9-zhao1.liu@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4824:EE_|SA3PR11MB8001:EE_
x-ms-office365-filtering-correlation-id: ff806318-627d-4751-f040-08db0e288068
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vNSW/x2aqvg7f0qL9qNItHaOakFbZ3mBefhn3aOxmWGpwsrghD5B7IRQXQiQdyR3eajaHbyD4YWVV0aUyZVlrGCqqG2Bs7XODNYxEil+cPJqkclIF/bN4wcp5d0jXzkC8E0fFgUYowLwqMBhmPyrYYFdjpFfmq7kBZ02PmJWMwkPFEB+0vSzhK3IbImsq9Sq/RxLw9SJcz5auauSOpnDak1hTEs5bVQls2wmEveOMdZhPngAqvKopDju7SlChn16HHzuFJMCvJU2LnUDV2bjREdC2sz5N+xlwHmbgs3uwl1a1H4uvLj3AZkdXWFDfrnzu1TCqfHOwgkRDg41n4iWwh161nsuOppvdAgQKHGY34PJMHXItFe/dKhztq/kE/W25ksKG8zSzCk5O6vq92xFSkKvqXatEdQO7DnTRmuhyPqmBQXKpHY4MlnEJ6ijwMRSRT53tmvalDrbgJYm3VX4aqghpHYfdmPr4MDfYaxvvXtNryW/2Yy66w+8clAdG9O/9ZGLGfIHZauV7CxNVstlTNAUiH8wsfKQ4+EA4H4jAkkHWh3CqwPRY1oRlaP7ewgJ4eb14eyNlT8h4pyWJ+7lhT/urVBeAKJ+nFsUXs+BJU05q9mpxc9++vJNqIFYjA+tP67nE0hJu6nC3QR1pFIiMYNVRfd89S3orNhvKSiaeyXInk9ybE5D3mQrbuHhcGjoEd47hNKKt9/xu5X+DQKBmQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4824.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199018)(53546011)(52536014)(9686003)(2906002)(110136005)(6506007)(921005)(186003)(38070700005)(316002)(26005)(478600001)(8936002)(71200400001)(55016003)(33656002)(7696005)(83380400001)(54906003)(5660300002)(7416002)(64756008)(66946007)(76116006)(66556008)(66476007)(86362001)(4326008)(8676002)(66446008)(38100700002)(41300700001)(82960400001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Um9iCFKOBagHUlEwDdcptKXAnV0zLt+yV26Fljm8Hwc4jOP6m1en104bxy?=
 =?iso-8859-1?Q?3OjBN+SSrUQbKZdlZ7QlCnZYwRnmQ/j/CNYwTvn/5DxKMhQOUcsG0aYyvR?=
 =?iso-8859-1?Q?4j87F9rCuIO4jSPaUbsa8i+zIfmioALRqYmYwLzVfbTEL02J0yCoB5pOyr?=
 =?iso-8859-1?Q?EB9mCGCD0HzOuhW+Do5L3lEFU0ej1maGt3QpRbbwDpgraHv0GqnVqjcOHs?=
 =?iso-8859-1?Q?Z2CNA2NqLBUAShi6aSomLIpyzADnOyPaGgcmumrWo3i0xpx6qn0lmYdLo1?=
 =?iso-8859-1?Q?Ndo4yWjuR/heb1Qm5gg0sX8ZoUGTxWx/2j2vVeWybMi7ibRauzjemDGdCK?=
 =?iso-8859-1?Q?Jp+A6yM3qqfgaF17C3nDH9DC+j3XrPnfDLEdQZdq6p4NG4Cys8lyKfpAIz?=
 =?iso-8859-1?Q?HRWgOyuSXBAbcmPaH7oAkQzGS3f4SRGtV1bd0n+SU2GT2BrtZuNjO8opPG?=
 =?iso-8859-1?Q?Z34GvF6YZ1SW0WsuhO6wRmGeTZ2dFrUJg4KuvU73nTdI46yd2H7XQ1gv0k?=
 =?iso-8859-1?Q?s6/pkIM3slRzKye62TZ2GmxuUSJF17nQCwp8IUkp2mVNmzLL0LvFniaPoI?=
 =?iso-8859-1?Q?7r/+qIig3CGRVRJz9RbOoLkiDsn0+0TCG7m+5HkfKo7swPk1ZA45K30KmI?=
 =?iso-8859-1?Q?L09c59VGE42LrNEf1SnIrspJcJ/9UF2m953F5W+xTMvPOWcuF9xYaetnEB?=
 =?iso-8859-1?Q?Cl77XTAy4TnQ36RgHAjJ86OctLjFO3upsVVsjYLy+9MfKduHpBhDQrGTlq?=
 =?iso-8859-1?Q?9e1J/bTOV7NXhRZJyh+nzdeFcaZJhyI9LqOiOg1dHiMxCzW4TRYHLiH4QF?=
 =?iso-8859-1?Q?C/2oe2UnFZh7s59zf/QH2adV4bESNEdriStbegCjMMDXS09Wk7U8thaGJc?=
 =?iso-8859-1?Q?QpIsYnsiukm2dajPH8zoD0K98RgozdBCRWSGvp2yH4UosEhEWbPgvE7P53?=
 =?iso-8859-1?Q?4PKdjwiFlQP6AdrLfn/yET8UzMHfQDynSikZ39oWLJ2aFDCXFYaBwMif7L?=
 =?iso-8859-1?Q?RNy1qzKta3R+FjzhMLobHYnELqwT2zJAjocYrJhNyNgVBgW24hLqCBQlw+?=
 =?iso-8859-1?Q?QaFsU4HdFVRWvmnfHLigdmDi5OMvDvrOv/taEHdymD84KiPIYGvDkja2gr?=
 =?iso-8859-1?Q?lcCup0RSKXUpxndewUonAI4mHDCSzeaU3IEpK439lg3mw/A1GuOseqZt0U?=
 =?iso-8859-1?Q?PlnTow/KKATCwr+m8dMWtqNc9XdGYMCBo6clHyfTA5n9LIST57sNNr8o2o?=
 =?iso-8859-1?Q?fb8HUl7Dd4GlwHdDpSQMlr6hKJ1wYjV9ALuJc0AfBiyKKP0x4KSqM9BBud?=
 =?iso-8859-1?Q?e3j0KH+iQ6QbwgEOBe2TCBPpJAzZbDyk2ht8Ty1vpiov+YKK+OdgFT5wRw?=
 =?iso-8859-1?Q?0b49l2oqE+g56TVqmh/t0hU9ccQZGRPDBhN8M4EP2PqvuMHe8tAM4R2HM7?=
 =?iso-8859-1?Q?03VNXcNf3Z69Ztc8ichgwOR4k3FBh8Be3ybx2FugokCz+2r4SvbOXDKlpw?=
 =?iso-8859-1?Q?r4yaxn0X5AToHDWYCqMh4qHrYwl1nS6jO537wdFEcZftD7f2bT5Mrk8FOQ?=
 =?iso-8859-1?Q?NuFqLoQt7W9mcbshbIXrCR9o8ITP+Jnb8uw6C9ZHlHHGT6lO9fWvoDwlTD?=
 =?iso-8859-1?Q?wgkFJLvYEOrhWZm/cR/FfXCtV4pX22cURt?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff806318-627d-4751-f040-08db0e288068
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 01:12:11.8273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aquUgW0DWZA5SvVaqroXooHzb+//zH/Ev45FUbMLXFXTGvmnhKP8atNYWiCLItK0DoQlzAWIcXUDvORXjcneaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8001
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=dapeng1.mi@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 13 Feb 2023 21:15:45 -0500
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

> From: Zhao Liu <zhao1.liu@linux.intel.com>
> Sent: Monday, February 13, 2023 5:50 PM
> To: Eduardo Habkost <eduardo@habkost.net>; Marcel Apfelbaum
> <marcel.apfelbaum@gmail.com>; Philippe Mathieu-Daud=E9 <philmd@linaro.org=
>;
> Yanan Wang <wangyanan55@huawei.com>; Michael S . Tsirkin
> <mst@redhat.com>; Richard Henderson <richard.henderson@linaro.org>; Paolo
> Bonzini <pbonzini@redhat.com>; Eric Blake <eblake@redhat.com>; Markus
> Armbruster <armbru@redhat.com>
> Cc: qemu-devel@nongnu.org; Wang, Zhenyu Z <zhenyu.z.wang@intel.com>; Mi,
> Dapeng1 <dapeng1.mi@intel.com>; Ding, Zhuocheng
> <zhuocheng.ding@intel.com>; Robert Hoo <robert.hu@linux.intel.com>;
> Christopherson,, Sean <seanjc@google.com>; Like Xu
> <like.xu.linux@gmail.com>; Liu, Zhao1 <zhao1.liu@intel.com>
> Subject: [RFC 08/52] machine: Add helpers to get cpu topology info from
> MachineState.topo
>=20
> From: Zhao Liu <zhao1.liu@intel.com>
>=20
> When MachineState.topo is introduced, the topology related structures bec=
ome
> complicated. In the general case (hybrid or smp topology), accessing the
> topology information needs to determine whether it is currently smp or hy=
brid
> topology, and then access the corresponding MachineState.topo.smp or
> MachineState.topo.hybrid.
>=20
> The best way to do this is to wrap the access to the topology to avoid ha=
ving to
> check each time it is accessed.
>=20
> The following helpers are provided here:
>=20
> - General interfaces - no need to worry about whether the underlying
>   topology is smp or hybrid:
>=20
> * machine_topo_get_cpus()
> * machine_topo_get_max_cpus()
> * machine_topo_is_smp()
> * machine_topo_get_sockets()
> * machine_topo_get_dies()
> * machine_topo_get_clusters()
> * machine_topo_get_threads();
> * machine_topo_get_cores();
> * machine_topo_get_threads_by_idx()
> * machine_topo_get_cores_by_idx()
> * machine_topo_get_cores_per_socket()
> * machine_topo_get_threads_per_socket()
>=20
> - SMP-specific interfaces - provided for the cases that are clearly known=
 to be
> smp topology:
>=20
> * machine_topo_get_smp_cores()
> * machine_topo_get_smp_threads()
>=20
> Since for hybrid topology, each core may has different threads, if someon=
e
> wants "cpus per core", the cpu_index is need to target a specific core
> (machine_topo_get_threads_by_idx()). But for smp, there is no need to be =
so
> troublesome, so for this case, we provide smp-specific interfaces.
>=20
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>  hw/core/machine-topo.c | 142
> +++++++++++++++++++++++++++++++++++++++++
>  include/hw/boards.h    |  35 ++++++++++
>  2 files changed, 177 insertions(+)
>=20
> diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c index
> 7223f73f99b0..b20160479629 100644
> --- a/hw/core/machine-topo.c
> +++ b/hw/core/machine-topo.c
> @@ -21,6 +21,148 @@
>  #include "hw/boards.h"
>  #include "qapi/error.h"
>=20
> +unsigned int machine_topo_get_sockets(const MachineState *ms) {
> +    return machine_topo_is_smp(ms) ? ms->topo.smp.sockets :
> +                                     ms->topo.hybrid.sockets; }
> +
> +unsigned int machine_topo_get_dies(const MachineState *ms) {
> +    return machine_topo_is_smp(ms) ? ms->topo.smp.dies :
> +                                     ms->topo.hybrid.dies; }
> +
> +unsigned int machine_topo_get_clusters(const MachineState *ms) {
> +    return machine_topo_is_smp(ms) ? ms->topo.smp.clusters :
> +                                     ms->topo.hybrid.clusters; }
> +
> +unsigned int machine_topo_get_smp_cores(const MachineState *ms) {
> +    g_assert(machine_topo_is_smp(ms));
> +    return ms->topo.smp.cores;
> +}
> +
> +unsigned int machine_topo_get_smp_threads(const MachineState *ms) {
> +    g_assert(machine_topo_is_smp(ms));
> +    return ms->topo.smp.threads;
> +}
> +
> +unsigned int machine_topo_get_threads(const MachineState *ms,
> +                                      unsigned int cluster_id,
> +                                      unsigned int core_id) {
> +    if (machine_topo_is_smp(ms)) {
> +        return ms->topo.smp.threads;
> +    } else {
> +        return ms->topo.hybrid.cluster_list[cluster_id]
> +                   .core_list[core_id].threads;
> +    }
> +
> +    return 0;
> +}
> +
> +unsigned int machine_topo_get_cores(const MachineState *ms,
> +                                    unsigned int cluster_id) {
> +    if (machine_topo_is_smp(ms)) {
> +        return ms->topo.smp.cores;
> +    } else {
> +        return ms->topo.hybrid.cluster_list[cluster_id].cores;
> +    }
> +}
> +
> +unsigned int machine_topo_get_threads_by_idx(const MachineState *ms,
> +                                             unsigned int cpu_index) {
> +    unsigned cpus_per_die;
> +    unsigned tmp_idx;
> +    HybridCluster *cluster;
> +    HybridCore *core;
> +
> +    if (machine_topo_is_smp(ms)) {
> +        return ms->topo.smp.threads;
> +    }
> +
> +    cpus_per_die =3D ms->topo.max_cpus / (ms->topo.hybrid.sockets *
> +                            ms->topo.hybrid.dies);
> +    tmp_idx =3D cpu_index % cpus_per_die;
> +
> +    for (int i =3D 0; i < ms->topo.hybrid.clusters; i++) {
> +        cluster =3D &ms->topo.hybrid.cluster_list[i];
> +
> +        for (int j =3D 0; j < cluster->cores; j++) {
> +            core =3D &cluster->core_list[j];
> +
> +            if (tmp_idx < core->threads) {
> +                return core->threads;
> +            } else {
> +                tmp_idx -=3D core->threads;
> +            }
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +unsigned int machine_topo_get_cores_by_idx(const MachineState *ms,
> +                                           unsigned int cpu_index) {
> +    unsigned cpus_per_die;
> +    unsigned tmp_idx;
> +    HybridCluster *cluster;
> +    HybridCore *core;
> +
> +    if (machine_topo_is_smp(ms)) {
> +        return ms->topo.smp.cores;
> +    }
> +
> +    cpus_per_die =3D ms->topo.max_cpus / (ms->topo.hybrid.sockets *
> +                            ms->topo.hybrid.dies);
> +    tmp_idx =3D cpu_index % cpus_per_die;
> +
> +    for (int i =3D 0; i < ms->topo.hybrid.clusters; i++) {
> +        cluster =3D &ms->topo.hybrid.cluster_list[i];
> +
> +        for (int j =3D 0; j < cluster->cores; j++) {
> +            core =3D &cluster->core_list[j];
> +
> +            if (tmp_idx < core->threads) {
> +                return cluster->cores;
> +            } else {
> +                tmp_idx -=3D core->threads;
> +            }
> +        }
> +    }
> +
> +    return 0;
> +}
> +

It looks most code of this function is same with previous function. Could w=
e extract
the same part code and define a low level function?

> +unsigned int machine_topo_get_cores_per_socket(const MachineState *ms)
> +{
> +    unsigned int cores_per_die =3D 0;
> +
> +    if (machine_topo_is_smp(ms)) {
> +        return ms->topo.smp.cores * ms->topo.smp.clusters * ms->topo.smp=
.dies;
> +    }
> +
> +    for (int i =3D 0; i < ms->topo.hybrid.clusters; i++) {
> +        cores_per_die +=3D ms->topo.hybrid.cluster_list[i].cores;
> +    }
> +
> +    return cores_per_die * ms->topo.hybrid.dies; }
> +
> +unsigned int machine_topo_get_threads_per_socket(const MachineState
> +*ms) {
> +    unsigned int sockets =3D machine_topo_is_smp(ms) ? ms->topo.smp.sock=
ets :
> +                           ms->topo.hybrid.sockets;
> +    return ms->topo.max_cpus / sockets; }
> +
>  /*
>   * Report information of a machine's supported CPU topology hierarchy.
>   * Topology members will be ordered from the largest to the smallest dif=
f --git
> a/include/hw/boards.h b/include/hw/boards.h index
> 0a61855499e3..34b64b012022 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -461,4 +461,39 @@ extern const size_t hw_compat_2_2_len;  extern
> GlobalProperty hw_compat_2_1[];  extern const size_t hw_compat_2_1_len;
>=20
> +static inline
> +unsigned int machine_topo_get_cpus(const MachineState *ms) {
> +    return ms->topo.cpus;
> +}
> +
> +static inline
> +unsigned int machine_topo_get_max_cpus(const MachineState *ms) {
> +    return ms->topo.max_cpus;
> +}
> +
> +static inline
> +bool machine_topo_is_smp(const MachineState *ms) {
> +    return ms->topo.topo_type =3D=3D CPU_TOPO_TYPE_SMP; }
> +
> +unsigned int machine_topo_get_sockets(const MachineState *ms); unsigned
> +int machine_topo_get_dies(const MachineState *ms); unsigned int
> +machine_topo_get_clusters(const MachineState *ms); unsigned int
> +machine_topo_get_smp_cores(const MachineState *ms); unsigned int
> +machine_topo_get_smp_threads(const MachineState *ms); unsigned int
> +machine_topo_get_threads(const MachineState *ms,
> +                                      unsigned int cluster_id,
> +                                      unsigned int core_id); unsigned
> +int machine_topo_get_cores(const MachineState *ms,
> +                                    unsigned int cluster_id); unsigned
> +int machine_topo_get_threads_by_idx(const MachineState *ms,
> +                                             unsigned int cpu_index);
> +unsigned int machine_topo_get_cores_by_idx(const MachineState *ms,
> +                                           unsigned int cpu_index);
> +unsigned int machine_topo_get_cores_per_socket(const MachineState *ms);
> +unsigned int machine_topo_get_threads_per_socket(const MachineState
> +*ms);
> +
>  #endif
> --
> 2.34.1


