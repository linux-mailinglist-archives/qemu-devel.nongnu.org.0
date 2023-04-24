Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A866EC79C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 10:07:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqrDw-0003vx-Fu; Mon, 24 Apr 2023 04:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1pqrDn-0003kb-3M; Mon, 24 Apr 2023 04:06:54 -0400
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1pqrDj-0001hC-Sb; Mon, 24 Apr 2023 04:06:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682323607; x=1713859607;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qAigwZi9Zw3EltmgiZ/qsHXUGAvMKTlwe3OR7AD9X7I=;
 b=giuDOs/enCY/husxEtCO7y9OMsUACnN+pihvXdYXCAJ+ZKMadID3YROL
 qpcUxsjXZUsslm9TLh1qHUwIKWyZtGNGuGF5rhdp57YPzNQ12uGmSZKSy
 HckOSzV/VwgCVCBmbb35FsHNPiQ6VKjjb7iQM44SfCmoNdTBPz/KUW+yg
 U9I+9ITWR5GUznuobvJhIK1MjrsQF0aTHtO4561mNXTtLYAqhqNGJXRfH
 qLKDHavMsZVrjRKGMruYWQwSUcd7Y3V03KNWY4hzQEnfOtv9GQzzgiGTP
 ddijPwmfB0y2SdTIPELu3UREaH1HnsSWU1zjCcgLaNsOenCtnU86oqEBY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="326710940"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="326710940"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 01:06:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="725601907"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="725601907"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 24 Apr 2023 01:06:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 01:06:44 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 01:06:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 01:06:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 01:06:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLRSlToM0hGUKIUTF3p6BB4lIiuL2g0wTLVs4WtAl+tU+tY1S0um0uNLBn1wNFQgrz8YteDHNfTDOgBj6DVMueIgexc+fWE4dqh0rpIpk/w1docQaHl+iZGm4OkX9DDhQDt5Pu7qLqt2A0qiRCs/IcE+cSZDwj/6lLLv8TNMCu3afMnS8fM/Jtb45gC90Ei/7sKZ58+eyNEd3Y4ns6XwH7o3+N4QaNKBezcpC/RWiE9gS/IQdZTuHHzelmgXuYGGoCgx6T6K5ZtiMuunGYUbynSEY7PPRO/JMtlpBWoIcX/WEcO2wOkgLkck8zSnnz876YiusC/n5goqa6tCpmWRlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z55rcYqTe1vn4Dyd/VxW90jybILaJXcKSeuIqSExtmw=;
 b=IGPSTpx0d5QYpga2m6VVyxDjtrmZf9IZFXVfWBZthzpNHAZAVVLMkupsqdTI94z/tcx1n1EtP0PGkyoAKKgHCEDLILVrj11D58QMvgSwIE7d0Rn3Gtry55teFyVxb7bRCsY3WEldwdeZbNKrG9xPsvKOU5NHLkyqR4WEtxC3Lfs/+ePCYTwDONZqkiVAy3FG/5zoU7sziUGL1SZH4ePGtHGdyfNiZECXGvqTVrH9NJsQt1I8vEjwlOr1DP+X5rss405ztq5LzHPVKoGagoTy8XLaM6fSQYuuqa4jiCMyOLr6oREHqf+GSYISwzm3KjJeIiGVyM1VbqAVIxUl1LZaHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by PH0PR11MB5174.namprd11.prod.outlook.com (2603:10b6:510:3b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.31; Mon, 24 Apr
 2023 08:06:42 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e%4]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 08:06:42 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "qemu-block@nongnu.org" <qemu-block@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, John Snow
 <jsnow@redhat.com>, Li Zhijian <lizhijian@fujitsu.com>, Juan Quintela
 <quintela@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>
Subject: RE: [PATCH v2 6/6] tests/migration: Only run auto_converge in slow
 mode
Thread-Topic: [PATCH v2 6/6] tests/migration: Only run auto_converge in slow
 mode
Thread-Index: AQHZdHTKShhY+wqne0aVVDdWYPck2a86HkxQ
Date: Mon, 24 Apr 2023 08:06:41 +0000
Message-ID: <MWHPR11MB00315D9A7DD90682374638AB9B679@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230421171411.566300-1-berrange@redhat.com>
 <20230421171411.566300-7-berrange@redhat.com>
In-Reply-To: <20230421171411.566300-7-berrange@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|PH0PR11MB5174:EE_
x-ms-office365-filtering-correlation-id: 4b068d61-5eb2-4521-9514-08db449ad6a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fwhsOc2C1zrRWeBSdDSSu0SGKkcA03aqowlw6ftSEZFXRW/LYcPnGXEjrVuYF5uyfPSNQDdUheXVIgG2A+8nozVE/t4QrXHX5gNc5S3qV1pvVlsWXSLOwMUY2pdYf6hQHGfJTgJze0canrz3RgJUNK3d9Meen3mzy8d9O8dmCTr0PcYqZ6PrV8CeDrlEkYFOeo2iv+vP092tL8fvimq7uxtprUuRBEQF8Dfb/nX3NG5IViDBI44hJTIYqHTsCCklXqGVikDRAL/5GImNsRs5JHIljLha445WpFk4gMhK0ito3KM30X7tHgZMc2dQnn0v45A7udLmTVqO5ZV2TnQB9bIcow1S8cJuje2F3eI3yL8xh7rHHFQwnK21U3cqueFSlpqg5rpSFMnfHY3Y6iHDpaOn6rOgjYARAUf7C6WuAIIsu92d2TwB2ErnBnoczy3YOy83RPQQvOQmvBq2U2mBDC6jSKLgSvSLYHv7vJq2hsJD2t6frkiWbixsofUd/0ZYb4bhfx3gWOhbCjXjv3f5tW2jbSOm5D/A9GUFRe5Mt5UfBVftWndy+GX8VhP7JVdwj2p3h+BaaDQ3UeIrJuD2h3u8vhu34HMkv6GrrZt1U/IQ/1jcKCybJw+JjOyJZUgk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199021)(83380400001)(76116006)(66946007)(64756008)(66446008)(66476007)(66556008)(4326008)(5660300002)(52536014)(55016003)(53546011)(6506007)(9686003)(26005)(186003)(71200400001)(7696005)(82960400001)(54906003)(122000001)(110136005)(478600001)(2906002)(4744005)(7416002)(38100700002)(38070700005)(86362001)(33656002)(316002)(8936002)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?5PSqcT/dtJVJ62qam/Y1SsGSZt0Wz+E626hBRq5KVxlxVCqnmDWQ7GSqkC?=
 =?iso-8859-1?Q?vLkVWxk4lb9k5TZzeESej5QNlmvI+/TlAjA2H3etSvwCX/L9Tcx4kUYKVH?=
 =?iso-8859-1?Q?wtNbSQKGgAUbE112QkEu/w4p9acCv0ma2WNRd9PBwwnXJDKS9McQMASK8N?=
 =?iso-8859-1?Q?HC+2SvKnKDejpEUj6OI+fFbtKKtPpcUwRZ1FoCYbOtfmmOx118bSAgvFyQ?=
 =?iso-8859-1?Q?23IUFJQvuLkKr65ZDGiFAVH7v1mgHXdt3+V5JjjCSKtpXpB+CSeajiG5s+?=
 =?iso-8859-1?Q?GMuMenaLOJjoEX+LNd2NLgtog1LpPaF85ucidenyhGV4wrkO+g+AA9jprd?=
 =?iso-8859-1?Q?+WoPB8S33wlwKZ373/H6JLWa/k66tPZ2r//PTEaVneXjZqdAQOaWvy/3xW?=
 =?iso-8859-1?Q?LhFMipuSHRjGnlYJzCqAw5FluvxgDrXM1BCNc7YdEyrwlmA2AQImPW6SaY?=
 =?iso-8859-1?Q?ol8lLsQ/aweNH6HlMLpy6lyb5sMjx5bUH3Wnz23Ok5F+jMhyCeW3ZKngOD?=
 =?iso-8859-1?Q?jTvaiW1v4iqrAM4P0fss3kRpBmmsjHCPPi75IDqJIwzeGrf6BhYn3sRP9g?=
 =?iso-8859-1?Q?7dhwqkJLWXQwVhzESBuIorHk2OuibLXzPQ5vq/Ajqm+wmjUJuQUKJErvXW?=
 =?iso-8859-1?Q?Mib1rl+QCx/9bCjQduZKyKzc24xs09ZhleRRVFDMzUntAGs8bRZseMtFxF?=
 =?iso-8859-1?Q?xb5pugMyYJDDv6ruLnueteZ1WjOokKCqbg+CGIK3q8ckwzGhKoT3at9ui9?=
 =?iso-8859-1?Q?lOjnYQt8P6OMEwOELP2Ga3ezstWCfCNdM7YBZ3QPCRYP9iRUi1DXPjcnIG?=
 =?iso-8859-1?Q?HGj7ZDBKTiwQGy4YBSUZGiNTvbYfbym7u/rRI4nZJ6MV2Kx8h391fhjTl5?=
 =?iso-8859-1?Q?FOEVm6i92hOCGZ54U8qJyKspbUtiifPmBqgsU4jVqjLq/KJWAnYcwr3ULl?=
 =?iso-8859-1?Q?xPgpyGOxIYAeGyMSAYdwM2oaydfTnth1BYQjXBNO3XwDgJxiFAqccz0WmW?=
 =?iso-8859-1?Q?qIqneHVnRGH3E0SpADEDV7gTWesMTrrr4Wmw1KY0URRronkyayd9s19uCF?=
 =?iso-8859-1?Q?cWHwll2aUW3HMG210S6lTUD1ZHCSGr5vr5Bpq7f1bldxSF7jimucAsp8ib?=
 =?iso-8859-1?Q?51RcoiyeVLJhZueu9JrSS4F2H9it5X1Cz08RYaWzjObgAsysPCabhm35rT?=
 =?iso-8859-1?Q?/A1Hkt62O79w8ZLjaJdqsOFXWH98NbFWmrer0inwoTA7PfaRjLPn8CkjAw?=
 =?iso-8859-1?Q?yygWKSxy9JJXgoZYDFW6pKphh1ypmQ5fchermjWIy0VLrQdH6CyDZ8WB43?=
 =?iso-8859-1?Q?DvXEO7FwHtIY5552r0vcExfpT4MnQYVM8QPMKHIAxNF6l1bcSD4MLKy/KK?=
 =?iso-8859-1?Q?HHKN+h4CRLJG5I937ozBSTrqehg1gJL97fQI/75gTybEhVGSTQIGKEcN9C?=
 =?iso-8859-1?Q?HVw3tb92lUjvfFnd6Qd6+fObC+qXLH2gEdTzU0616dx5dBkzGrIt4ikrDR?=
 =?iso-8859-1?Q?riiXTPn1B2DCWjkBrUM2oLmMp4VH2P8G/2vNlQrMB0ZTJCuAYDByHRnP/n?=
 =?iso-8859-1?Q?LckNKwws8XBNcuupWWMfi310Otnip6/fvQitDEfNkKoi+dB4VYY9swJBQh?=
 =?iso-8859-1?Q?U48fCTwz/x2xacPc5SJPFmUX4xtU23mFtl?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b068d61-5eb2-4521-9514-08db449ad6a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 08:06:41.9135 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xSzIV3D5QHoV8HR2dL7yvnnF2p7xH61itF7+qI7ATo2gM/BbxKFWwFgnKe2mehsMesQsRMNsx81yDBYOms4i5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5174
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.151; envelope-from=chen.zhang@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.172,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> From: Daniel P. Berrang=E9 <berrange@redhat.com>
> Sent: Saturday, April 22, 2023 1:14 AM
> To: qemu-devel@nongnu.org
> Cc: qemu-block@nongnu.org; Paolo Bonzini <pbonzini@redhat.com>;
> Thomas Huth <thuth@redhat.com>; John Snow <jsnow@redhat.com>; Li
> Zhijian <lizhijian@fujitsu.com>; Juan Quintela <quintela@redhat.com>;
> Stefan Hajnoczi <stefanha@redhat.com>; Zhang, Chen
> <chen.zhang@intel.com>; Laurent Vivier <lvivier@redhat.com>
> Subject: [PATCH v2 6/6] tests/migration: Only run auto_converge in slow
> mode
>=20
> From: Juan Quintela <quintela@redhat.com>
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>

LGTM.
Reviewed-by: Zhang Chen <chen.zhang@intel.com>

> ---
>  tests/qtest/migration-test.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)


