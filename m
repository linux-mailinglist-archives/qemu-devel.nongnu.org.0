Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73656E19A8
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 03:26:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn8BS-0002p1-Ok; Thu, 13 Apr 2023 21:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1pn8BP-0002of-PH; Thu, 13 Apr 2023 21:24:59 -0400
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1pn8BI-0006IA-Ce; Thu, 13 Apr 2023 21:24:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681435492; x=1712971492;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VdD0XAlg7+3NZcqlS8/Rxt0f7x1E6MqNzGsS7zPOkO0=;
 b=ky+TchZIR9Q7gfEkih4o8H+zhKSJu9IvmEia+hgQrocPn0u/4UZM0TnI
 JRNsxh96n0CJgG7byGcDITVBMk2ZbvzY9BuKGRf6XWM7TjHN8+ZU7zGOw
 WMoT68mxcZ6ElDZkiolJslay0W1i9+U3ilRtltWgIPTq5Jt7wDsI2qnPS
 P/HVUQ4nonCfdPp5KEQF5JH3f0Qmd/RqXpGqzCix4qltMyB3c3LHaRT+R
 dkcuLm5y92aOnBWaft/dLAJbvK2sBga4SKZ/Gt2AEqWmmU9Yij2CwiJJC
 sWRa/6XL2FwQqwsVcp80ue1jP8jkRAoJpBK+nO24veYGVItomGyTphmTt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="344352064"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="344352064"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 18:24:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="864019627"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="864019627"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 13 Apr 2023 18:24:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 18:24:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 13 Apr 2023 18:24:41 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 13 Apr 2023 18:24:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irih6SLI+puL6tZ34K0ROgtZGa9w2Ss82xXg5LubjKdRA3l7ZRYo1S2BlY8ikB3CZO+1JKtWp++SwbhWyfSi3UTaYbGVwpAZW5tsA2aBIbEtUa3S48TPCHGnuASRyeIN2mQIcoeFi/T45PJ+wWwj72vPwiOdYdw5akr/s7VBe8wu1KGjH1haESpZwKRXfs6AzQr/rcmbdNahgxV8F+/ewRkDjghj84kvX3cmLDqQ49h32d4YLAOuNIaYT3oM7aj/JhJPn06S+X0dE080FrCQYfA0V+O3vCzuaun5PXc/VgybYDyhCGVWxBK7x6QzlhBCuNpWKeY/zUqAmP2QUln/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdD0XAlg7+3NZcqlS8/Rxt0f7x1E6MqNzGsS7zPOkO0=;
 b=aN/IN34m8/gX3Iqzb5JcPtx++lz8RISIBm0/y8+tQTBtgBiWrE8qRE88mMm58l8ospqfAHL8fT8cUM0CXBUr5PCl+mFxZ6RUqGRzCfvwmdcHS2zei/wV6qgLckZNhwpymCqmR/0KfFfCtLZaYYyBWbQkspYspYi2dHY9YvFWUfZDHz3XmS55VaY0fW0N4DuPTfDVx3Q6DjQMMcWVWdn/ZsoAVCT94CwRcdvfWuceK5+APFCXWvkGJoFLHa8JAbqOuZvztiQVD6CbWqiShUta1pQvEOmZl/0nx4kguvNBT2Pz8itdgqwwSdR+EufBzIRWIp9H7Qf17hz3ach7oEpngw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by PH0PR11MB7710.namprd11.prod.outlook.com (2603:10b6:510:298::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 01:24:38 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e%4]) with mapi id 15.20.6298.028; Fri, 14 Apr 2023
 01:24:38 +0000
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
Thread-Index: AQHZbIUrWGe87sFjyEi3Ix51+Xqenq8o85bwgABQVgCAAMEdYA==
Date: Fri, 14 Apr 2023 01:24:37 +0000
Message-ID: <MWHPR11MB0031A6CAE72D321F342205F09B999@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230411145112.497785-1-vsementsov@yandex-team.ru>
 <MWHPR11MB003181F7E37662CE2F22C17F9B989@MWHPR11MB0031.namprd11.prod.outlook.com>
 <e7e7e3c6-c4f5-aa9c-c4ee-f3f28555b81b@yandex-team.ru>
In-Reply-To: <e7e7e3c6-c4f5-aa9c-c4ee-f3f28555b81b@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|PH0PR11MB7710:EE_
x-ms-office365-filtering-correlation-id: 791cba04-842c-494b-0b90-08db3c87037c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Uw+ZObmHPt5k0Fj1rvlPn7VgCVU+5b+QmHN4wPLeEqreLcYnkLdJ3X80pSQCE7jWSnJ2mYMtinMWUGYnlhlNO75x9foxQlLJewoBRx++TpqexOxqekAOTzIZDUEqOMVWHyfo/hElwuXrgAFyueYP3DFW2scLgrHBUUEclmFS+Eq5vGbGDhLt/1FJsE1+GFQmFeR91B7T3pEq4AxbngZkk0xnYrPscrRrxtgX7sNjaK54SVxnfpVpSoeTTaX9AlMCiEzHkj2OnSlLf33cPd6AtkG27IvCid7cglf4gcWOamddB88cGZ1Y1IUVf3vEO6VECyqxUbDFQgLf6S2qVZFPA2Rw7FuYpdLVaFth24KXf4aUpl8SzB9riv/aEHVULOHJ0epu0VI85HTNgwHz+reddf7R932enwEHnTjiwzMF8/50B64vb3Z7ZK36Lsc+z2CmUcTOcnKO1amGHYX1+WJlNIW8Xp62AgaKNDzwBCk4bnO56ci1Ryqihk3hdu/76D75T3VED+gj1+GeoujSQn4YB86kKXNGHIBttbiU+B+Egu9qDxrzRnEHc8F+7mDTU3dg1mxRh8bVGFYpKBEORqmlckQR03V3XKYWHEzZm+d2uaU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199021)(8936002)(33656002)(122000001)(38100700002)(52536014)(5660300002)(38070700005)(2906002)(7416002)(66476007)(86362001)(316002)(8676002)(55016003)(66446008)(41300700001)(64756008)(66946007)(4326008)(82960400001)(66556008)(966005)(76116006)(83380400001)(110136005)(186003)(26005)(54906003)(9686003)(478600001)(53546011)(71200400001)(6506007)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmlxWmpQMzB5aFNVQ0xFM0lrR3lLdEpqUzh5UFNDK0w5eXlyaWp4YVRDcWVM?=
 =?utf-8?B?M2NtZFpvV2N2bmZ2WGJ2QXFZQnpxcWFRcnAraVRDYVo5ZnZNT2hiOU14dUdP?=
 =?utf-8?B?MVExNnkwZ2pUTjR6bVdvaUgrR0UrOTdmSUZPRFc3N2hteEo5a29YRHYzSjNC?=
 =?utf-8?B?SkJaRWZHRmU4NC9tdGp5ZXZQNWVJSnkrUGZOeHdXalhNTFJqQm9VYmVhUlJu?=
 =?utf-8?B?dWZRU0MyYi9ZaXIyUUpPRG9sREoxTmZicmZEbElucE9veUJsWE5QeWxhUXcw?=
 =?utf-8?B?aHNielJUbUVyaktOSHlqZlFTYXkycXNjMDZhTGJyd1ZGSm9pUnVMZ2VzSTdZ?=
 =?utf-8?B?KzZ5dzNSQkxFbkFNUHhtcnIxSHJ4OGNFczhyN3d5N3Myak1JRUQxUGdRRUZX?=
 =?utf-8?B?Y0hBaWlDN29qQ1V3MktSS3NQMEU3ODBYUjdJSHU2SFppVUd1RUhIdHdCajAy?=
 =?utf-8?B?UXd6NE5RNjMwYXBna3BlbFJFUFR3T3p1ZzdMeVJnTnZoMDQ5Q21Bd2pPN3J2?=
 =?utf-8?B?eDRCcWtBdW5RQnE5d1lHY3hwRGNleEhvcHRZcW5veXJub1Q1QUpGTFpua0xC?=
 =?utf-8?B?R3EwMmtGeThwMkpPb3NheFFrQ1ZITzl2S3k2Mms4VUZkNmw3R29jSXpJYjB2?=
 =?utf-8?B?RjAyaHZJbWxKYlQvL2E3emtiWlAraDBjMFlXMmtXN1VCSXFTUkQvWWZCK3Rl?=
 =?utf-8?B?NE83bTQ1YzFzWDVRNXRNdjRhenRwRlpVdDVFSEhQamJLK0VtQitsUGtnZnRX?=
 =?utf-8?B?L0J2TWRETEVaVTcwMzZ3bzlKLzk4RXgzZllBM0RTVG85dXBNUk1DZEw2S2s4?=
 =?utf-8?B?d0p1RU5Kc3RwSmdOOCtMYkxwbWRqQnlSemFmK0xncmJXK21Ed2RVWXhuZTky?=
 =?utf-8?B?UlptNWl0S21FTWxPY0xXZXRNU05oY3B1OU5pVVpHTUVId1FNNmdhd1YybThi?=
 =?utf-8?B?YmNrUDduRzVhd2svenpZa1RJVC8zWGw3K1MxTVJ0bGM0OFpPTjFyVFdDRmZY?=
 =?utf-8?B?emNZTXRKaDhVdDRGYmtPMFlYZU1oY1EwaXM2UFdxMFBPdzZLdEsrNXNxdEZY?=
 =?utf-8?B?MlhvQUdtY2J6VnRsZ1Fydk13V0xJZHNWYjhYeC8rSXRqWllScmp3UXFlN25G?=
 =?utf-8?B?NjZJZXUySVF3MVhYK2RxVFpiVytvVzVzRVBSemZObjN6a1RPdk1LVnZkTVZj?=
 =?utf-8?B?em5XMXVDT1FrWkVieFlISWtPWlVuWWRsQ0hNR1drY0tDR2pCZURSTWZFUFFJ?=
 =?utf-8?B?YkdtbFVSMmZuWUFXbnpGaWdKcGM3SjZZdzBEUDRpZDVWWk1lU3hKWDNjM1hq?=
 =?utf-8?B?eEpxWEVDNDduSFg0ck1ZSEZDdTlMODdmekF4dDBpMGF0OHhrSlV6SHFiUHBq?=
 =?utf-8?B?RytFcThBSm1YcU83T2pQZ2I2aVlNWnVTanFHdE5Nbm1yWHdXUzJ5cm1aT2s2?=
 =?utf-8?B?ek15L2hJZVNsRnVUWTVoODVQaVdibXVDbElqNHVmUUhHTE1UNTd2R3pWYzRv?=
 =?utf-8?B?WDJWNUdvN1JSdElkR2REejBMZ3RIV2NQMlFHS21RTTVJbHV4WkVXd2x1NXJL?=
 =?utf-8?B?V3gwMmpsOFIzaG1wL2txMHNCSDZ3S0FBcFo4QnhsSWxrdU83WG9FTWRhdnVF?=
 =?utf-8?B?SEhXaHR1MUtnQk90aWhPaUtzZXlVNUNRWHMwZnRubjgrMG53WWlvdGZwR3FX?=
 =?utf-8?B?R3RSVmphS2kxWjlYdk5XRUFQT1pPOGNDVlFjZjZ3TGhSQjBJWGx3QXdaVlZH?=
 =?utf-8?B?LytqZXNHZGRVOGFjM2sza3ovNW12UUhjOW0yRWVsZXN4LzZEYkprajVUcUd5?=
 =?utf-8?B?RnF3V2ZRaVFOaG84V09ickVLRHNFQnc4WlhuR1JlNDV4dFgvVHNyOWtWcjBK?=
 =?utf-8?B?Vk96amcyN3NrbTJ4SkFpUnV6TDBHVXBtUVNjcElaZXIvRFNwUW1lZnZ5Qmdr?=
 =?utf-8?B?K01OK05ITDlvbU91bXJQb2JUTS94enl2RzR1M0lJSUIxSXpQRW1ueTZjaXVm?=
 =?utf-8?B?MDMvUmtxSEZVRXdjbmZmQ1hSQmMyUnA1U2tQVWpaNVo1aUlRQUkrVUNaNlNs?=
 =?utf-8?B?REZXT016RGpSL3oremhvZFErZUNxSFJwaWtVR1NzYWZRZzdtaFJzeXpocTg0?=
 =?utf-8?Q?dELU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 791cba04-842c-494b-0b90-08db3c87037c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2023 01:24:37.9466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FyQyLqKuUPJlrLVwFsJH4nbonRdDAzdbapTbAGsJJUHSAW3lsN5eNHA67CvbyR4HUWdTK7Z4NRxf7sKL9rdbtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7710
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=chen.zhang@intel.com;
 helo=mga14.intel.com
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogcWVtdS1kZXZlbC1ib3Vu
Y2VzK2NoZW4uemhhbmc9aW50ZWwuY29tQG5vbmdudS5vcmcgPHFlbXUtDQo+IGRldmVsLWJvdW5j
ZXMrY2hlbi56aGFuZz1pbnRlbC5jb21Abm9uZ251Lm9yZz4gT24gQmVoYWxmIE9mIFZsYWRpbWly
DQo+IFNlbWVudHNvdi1PZ2lldnNraXkNCj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDEzLCAyMDIz
IDk6NDcgUE0NCj4gVG86IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT47IHFlbXUt
ZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogcWVtdS1ibG9ja0Bub25nbnUub3JnOyBwYm9uemluaUBy
ZWRoYXQuY29tOyBhcm1icnVAcmVkaGF0LmNvbTsNCj4gZWJsYWtlQHJlZGhhdC5jb207IGphc293
YW5nQHJlZGhhdC5jb207IGRnaWxiZXJ0QHJlZGhhdC5jb207DQo+IHF1aW50ZWxhQHJlZGhhdC5j
b207IGhyZWl0ekByZWRoYXQuY29tOyBrd29sZkByZWRoYXQuY29tOyBaaGFuZywNCj4gSGFpbGlh
bmcgPHpoYW5naGFpbGlhbmdAeGZ1c2lvbi5jb20+OyBsaXpoaWppYW5AZnVqaXRzdS5jb207DQo+
IHdlbmNvbmd5YW5nMkBodWF3ZWkuY29tOyB4aWVjaGFuZ2xvbmcuZEBnbWFpbC5jb207IGRlbi0N
Cj4gcGxvdG5pa292QHlhbmRleC10ZWFtLnJ1DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHJlcGxp
Y2F0aW9uOiBjb21waWxlIG91dCBzb21lIHN0YWZmIHdoZW4gcmVwbGljYXRpb24gaXMNCj4gbm90
IGNvbmZpZ3VyZWQNCj4gDQo+IE9uIDEzLjA0LjIzIDEyOjUyLCBaaGFuZywgQ2hlbiB3cm90ZToN
Cj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IFZs
YWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAeWFuZGV4LXRlYW0ucnU+DQo+
ID4+IFNlbnQ6IFR1ZXNkYXksIEFwcmlsIDExLCAyMDIzIDEwOjUxIFBNDQo+ID4+IFRvOiBxZW11
LWRldmVsQG5vbmdudS5vcmcNCj4gPj4gQ2M6IHFlbXUtYmxvY2tAbm9uZ251Lm9yZzsgcGJvbnpp
bmlAcmVkaGF0LmNvbTsNCj4gYXJtYnJ1QHJlZGhhdC5jb207DQo+ID4+IGVibGFrZUByZWRoYXQu
Y29tOyBqYXNvd2FuZ0ByZWRoYXQuY29tOyBkZ2lsYmVydEByZWRoYXQuY29tOw0KPiA+PiBxdWlu
dGVsYUByZWRoYXQuY29tOyBocmVpdHpAcmVkaGF0LmNvbTsga3dvbGZAcmVkaGF0LmNvbTsgWmhh
bmcsDQo+ID4+IEhhaWxpYW5nIDx6aGFuZ2hhaWxpYW5nQHhmdXNpb24uY29tPjsgWmhhbmcsIENo
ZW4NCj4gPj4gPGNoZW4uemhhbmdAaW50ZWwuY29tPjsgbGl6aGlqaWFuQGZ1aml0c3UuY29tOw0K
PiA+PiB3ZW5jb25neWFuZzJAaHVhd2VpLmNvbTsgeGllY2hhbmdsb25nLmRAZ21haWwuY29tOyBk
ZW4tDQo+ID4+IHBsb3RuaWtvdkB5YW5kZXgtdGVhbS5ydTsgVmxhZGltaXIgU2VtZW50c292LU9n
aWV2c2tpeQ0KPiA+PiA8dnNlbWVudHNvdkB5YW5kZXgtdGVhbS5ydT4NCj4gPj4gU3ViamVjdDog
W1BBVENIXSByZXBsaWNhdGlvbjogY29tcGlsZSBvdXQgc29tZSBzdGFmZiB3aGVuIHJlcGxpY2F0
aW9uDQo+ID4+IGlzIG5vdCBjb25maWd1cmVkDQo+ID4+DQo+ID4+IERvbid0IGNvbXBpbGUtaW4g
cmVwbGljYXRpb24tcmVsYXRlZCBmaWxlcyB3aGVuIHJlcGxpY2F0aW9uIGlzDQo+ID4+IGRpc2Fi
bGVkIGluIGNvbmZpZy4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogVmxhZGltaXIgU2VtZW50
c292LU9naWV2c2tpeQ0KPiA+PiA8dnNlbWVudHNvdkB5YW5kZXgtdGVhbS5ydT4NCj4gPj4gLS0t
DQo+ID4+DQo+ID4+IEhpIGFsbCENCj4gPj4NCj4gPj4gSSdtIHVuc3VyZSwgc2hvdWxkIGl0IGJl
IGFjdHVhbGx5IHNlcGFyYXRlIC0tZGlzYWJsZS1jb2xvIC8NCj4gPj4gLS1lbmFibGUtY29sbyBv
cHRpb25zIG9yIGl0J3MgcmVhbGx5IHVzZWQgb25seSB0b2dldGhlciB3aXRoDQo+ID4+IHJlcGxp
Y2F0aW9uIHN0YWZmLi4gU28sIEkgZGVjaWRlZCB0byBzdGFydCB3aXRoIHNpbXBsZXIgdmFyaWFu
dC4NCj4gPj4NCj4gPg0KPiA+IEZvciByZXBsaWNhdGlvbiwgSSB0aGluayB0aGVyZSdzIG5vdGhp
bmcgd3Jvbmcgd2l0aCB0aGUgaWRlYS4NCj4gPiBCdXQgbm90IHNvIGZvciBDT0xPLiAgQ09MTyBw
cm9qZWN0IGNvbnNpc3RzIG9mIHRocmVlIGluZGVwZW5kZW50IHBhcnRzOg0KPiBSZXBsaWNhdGlv
biwgbWlncmF0aW9uLCBuZXQtcHJveHkuDQo+ID4gRWFjaCBvbmUgaGF2ZSBhYmlsaXR5IHRvIHJ1
biBhbG9uZSBmb3Igb3RoZXIgcHJvcG9zYWxzLiBGb3IgZXhhbXBsZSB3ZQ0KPiA+IGNhbiBqdXN0
IHJ1biBmaWx0ZXItbWlycm9yL3JlZGlyZWN0b3IgZm9yIG5ldHdvcmtpbmcgQW5hbHlzaXMvZGVi
dWdzLg0KPiA+IEFsdGhvdWdoIHRoZSBiZXN0IHByYWN0aWNlIG9mIENPTE8gaXMgdG8gbWFrZSB0
aGUgdGhyZWUgbW9kdWxlcyB3b3JrDQo+IHRvZ2V0aGVyLCBpbiBmYWN0LCB3ZSBjYW4gYWxzbyB1
c2Ugb25seSBzb21lIG1vZHVsZXMgb2YgQ09MTyBmb3Igb3RoZXINCj4gdXNhZ2Ugc2NlbmFyaW9z
LiBMaWtlIENPTE8gbWlncmF0aW9uICsgbmV0LXByb3h5IGZvciBzaGFyZWQgZGlzaywgZXRjLi4u
DQo+ID4gU28gSSB0aGluayBubyBuZWVkIHRvIGRpc2FibGUgYWxsIENPTE8gcmVsYXRlZCBtb2R1
bGVzIHdoZW4gcmVwbGljYXRpb24gaXMNCj4gbm90IGNvbmZpZ3VyZWQuDQo+ID4gRm9yIGRldGFp
bHM6DQo+ID4gaHR0cHM6Ly93aWtpLnFlbXUub3JnL0ZlYXR1cmVzL0NPTE8NCj4gPg0KPiANCj4g
U28sIGlmIEkgd2FudCB0byBoYXZlIGFuIG9wdGlvbiB0byBkaXNhYmxlIGFsbCBDT0xPIG1vZHVs
ZXMsIGRvIHlvdSBtZWFuIGl0DQo+IHNob3VsZCBiZSBhZGRpdGlvbmFsIC0tZGlzYWJsZS1jb2xv
IG9wdGlvbj8gT3IgYmV0dGVyIGtlZXAgb25lIG9wdGlvbiAtLQ0KPiBkaXNhYmxlLXJlcGxpY2F0
aW9uIChhbmQsIG1heWJlIGp1c3QgcmVuYW1lIHRvIHRvIC0tZGlzYWJsZS1jb2xvKT8NCg0KSSB0
aGluayBrZWVwIHRoZSBvcHRpb24gLS1kaXNhYmxlLXJlcGxpY2F0aW9uIGlzIGVub3VnaC4NCkdl
bmVyYWxseSBzcGVha2luZywgdGhlc2UgdGhyZWUgbW9kdWxlcyBkbyBub3QgYmVsb25nIHRvIENP
TE8sIEl0IGhhcyBiZWVuIGRlY291cGxlZCBhdCB0aGUgdGltZSBvZiBkZXNpZ24uDQpJbnN0ZWFk
LCBDT0xPIGlzIGZvcm1lZCB3aGVuIHRoZXNlIHRocmVlIG1vZHVsZXMgYXJlIHVzZWQgaW4gY29t
YmluYXRpb24uDQoNClRoYW5rcw0KQ2hlbg0KDQo+IA0KPiA+IFRoYW5rcw0KPiA+IENoZW4NCj4g
Pg0KPiA+Pg0KPiA+PiAgIGJsb2NrL21lc29uLmJ1aWxkICAgICB8ICAyICstDQo+ID4+ICAgbWln
cmF0aW9uL21lc29uLmJ1aWxkIHwgIDYgKysrKy0tDQo+ID4+ICAgbmV0L21lc29uLmJ1aWxkICAg
ICAgIHwgIDggKysrKy0tLS0NCj4gPj4gICBxYXBpL21pZ3JhdGlvbi5qc29uICAgfCAgNiArKysr
LS0NCj4gPj4gICBzdHVicy9jb2xvLmMgICAgICAgICAgfCA0Ng0KPiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4+ICAgc3R1YnMvbWVzb24uYnVpbGQgICAg
IHwgIDEgKw0KPiA+PiAgIDYgZmlsZXMgY2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKSwgOSBkZWxl
dGlvbnMoLSkgIGNyZWF0ZSBtb2RlDQo+ID4+IDEwMDY0NCBzdHVicy9jb2xvLmMNCj4gPj4NCj4g
Pj4gZGlmZiAtLWdpdCBhL2Jsb2NrL21lc29uLmJ1aWxkIGIvYmxvY2svbWVzb24uYnVpbGQgaW5k
ZXgNCj4gPj4gMzgyYmVjMGU3ZC4uYjlhNzJlMjE5YiAxMDA2NDQNCj4gPj4gLS0tIGEvYmxvY2sv
bWVzb24uYnVpbGQNCj4gPj4gKysrIGIvYmxvY2svbWVzb24uYnVpbGQNCj4gPj4gQEAgLTg0LDcg
Kzg0LDcgQEAgYmxvY2tfc3MuYWRkKHdoZW46ICdDT05GSUdfV0lOMzInLCBpZl90cnVlOg0KPiA+
PiBmaWxlcygnZmlsZS0gd2luMzIuYycsICd3aW4zMi1haW8uYycpDQo+ID4+ICAgYmxvY2tfc3Mu
YWRkKHdoZW46ICdDT05GSUdfUE9TSVgnLCBpZl90cnVlOiBbZmlsZXMoJ2ZpbGUtcG9zaXguYycp
LCBjb3JlZiwNCj4gaW9raXRdKQ0KPiA+PiAgIGJsb2NrX3NzLmFkZCh3aGVuOiBsaWJpc2NzaSwg
aWZfdHJ1ZTogZmlsZXMoJ2lzY3NpLW9wdHMuYycpKQ0KPiA+PiAgIGJsb2NrX3NzLmFkZCh3aGVu
OiAnQ09ORklHX0xJTlVYJywgaWZfdHJ1ZTogZmlsZXMoJ252bWUuYycpKSAtaWYNCj4gPj4gbm90
DQo+ID4+IGdldF9vcHRpb24oJ3JlcGxpY2F0aW9uJykuZGlzYWJsZWQoKQ0KPiA+PiAraWYgZ2V0
X29wdGlvbigncmVwbGljYXRpb24nKS5hbGxvd2VkKCkNCj4gPj4gICAgIGJsb2NrX3NzLmFkZChm
aWxlcygncmVwbGljYXRpb24uYycpKQ0KPiA+PiAgIGVuZGlmDQo+ID4+ICAgYmxvY2tfc3MuYWRk
KHdoZW46IGxpYmFpbywgaWZfdHJ1ZTogZmlsZXMoJ2xpbnV4LWFpby5jJykpIGRpZmYNCj4gPj4g
LS1naXQgYS9taWdyYXRpb24vbWVzb24uYnVpbGQgYi9taWdyYXRpb24vbWVzb24uYnVpbGQgaW5k
ZXgNCj4gPj4gMGQxYmI5Zjk2ZS4uODE4MGVhZWE3YiAxMDA2NDQNCj4gPj4gLS0tIGEvbWlncmF0
aW9uL21lc29uLmJ1aWxkDQo+ID4+ICsrKyBiL21pZ3JhdGlvbi9tZXNvbi5idWlsZA0KPiA+PiBA
QCAtMTMsOCArMTMsNiBAQCBzb2Z0bW11X3NzLmFkZChmaWxlcygNCj4gPj4gICAgICdibG9jay1k
aXJ0eS1iaXRtYXAuYycsDQo+ID4+ICAgICAnY2hhbm5lbC5jJywNCj4gPj4gICAgICdjaGFubmVs
LWJsb2NrLmMnLA0KPiA+PiAtICAnY29sby1mYWlsb3Zlci5jJywNCj4gPj4gLSAgJ2NvbG8uYycs
DQo+ID4+ICAgICAnZXhlYy5jJywNCj4gPj4gICAgICdmZC5jJywNCj4gPj4gICAgICdnbG9iYWxf
c3RhdGUuYycsDQo+ID4+IEBAIC0yOSw2ICsyNywxMCBAQCBzb2Z0bW11X3NzLmFkZChmaWxlcygN
Cj4gPj4gICAgICd0aHJlYWRpbmZvLmMnLA0KPiA+PiAgICksIGdudXRscykNCj4gPj4NCj4gPj4g
K2lmIGdldF9vcHRpb24oJ3JlcGxpY2F0aW9uJykuYWxsb3dlZCgpDQo+ID4+ICsgIHNvZnRtbXVf
c3MuYWRkKGZpbGVzKCdjb2xvLmMnLCAnY29sby1mYWlsb3Zlci5jJykpIGVuZGlmDQo+ID4+ICsN
Cj4gPj4gICBzb2Z0bW11X3NzLmFkZCh3aGVuOiByZG1hLCBpZl90cnVlOiBmaWxlcygncmRtYS5j
JykpICBpZg0KPiA+PiBnZXRfb3B0aW9uKCdsaXZlX2Jsb2NrX21pZ3JhdGlvbicpLmFsbG93ZWQo
KQ0KPiA+PiAgICAgc29mdG1tdV9zcy5hZGQoZmlsZXMoJ2Jsb2NrLmMnKSkNCj4gPj4gZGlmZiAt
LWdpdCBhL25ldC9tZXNvbi5idWlsZCBiL25ldC9tZXNvbi5idWlsZCBpbmRleA0KPiA+PiA4N2Fm
Y2EzZTkzLi42MzRhYjcxY2M2IDEwMDY0NA0KPiA+PiAtLS0gYS9uZXQvbWVzb24uYnVpbGQNCj4g
Pj4gKysrIGIvbmV0L21lc29uLmJ1aWxkDQo+ID4+IEBAIC0xLDEzICsxLDkgQEANCj4gPj4gICBz
b2Z0bW11X3NzLmFkZChmaWxlcygNCj4gPj4gICAgICdhbm5vdW5jZS5jJywNCj4gPj4gICAgICdj
aGVja3N1bS5jJywNCj4gPj4gLSAgJ2NvbG8tY29tcGFyZS5jJywNCj4gPj4gLSAgJ2NvbG8uYycs
DQo+ID4+ICAgICAnZHVtcC5jJywNCj4gPj4gICAgICdldGguYycsDQo+ID4+ICAgICAnZmlsdGVy
LWJ1ZmZlci5jJywNCj4gPj4gLSAgJ2ZpbHRlci1taXJyb3IuYycsDQo+ID4+IC0gICdmaWx0ZXIt
cmV3cml0ZXIuYycsDQo+ID4+ICAgICAnZmlsdGVyLmMnLA0KPiA+PiAgICAgJ2h1Yi5jJywNCj4g
Pj4gICAgICduZXQtaG1wLWNtZHMuYycsDQo+ID4+IEBAIC0xOSw2ICsxNSwxMCBAQCBzb2Z0bW11
X3NzLmFkZChmaWxlcygNCj4gPj4gICAgICd1dGlsLmMnLA0KPiA+PiAgICkpDQo+ID4+DQo+ID4+
ICtpZiBnZXRfb3B0aW9uKCdyZXBsaWNhdGlvbicpLmFsbG93ZWQoKQ0KPiA+PiArICBzb2Z0bW11
X3NzLmFkZChmaWxlcygnY29sby1jb21wYXJlLmMnLCAnY29sby5jJywNCj4gPj4gKydmaWx0ZXIt
cmV3cml0ZXIuYycsDQo+ID4+ICsnZmlsdGVyLW1pcnJvci5jJykpIGVuZGlmDQo+ID4+ICsNCj4g
Pj4gICBzb2Z0bW11X3NzLmFkZCh3aGVuOiAnQ09ORklHX1RDRycsIGlmX3RydWU6DQo+ID4+IGZp
bGVzKCdmaWx0ZXItcmVwbGF5LmMnKSkNCj4gPj4NCj4gPj4gICBpZiBoYXZlX2wydHB2Mw0KPiA+
PiBkaWZmIC0tZ2l0IGEvcWFwaS9taWdyYXRpb24uanNvbiBiL3FhcGkvbWlncmF0aW9uLmpzb24g
aW5kZXgNCj4gPj4gYzg0ZmExMGU4Ni4uNWI4MWUwOTM2OSAxMDA2NDQNCj4gPj4gLS0tIGEvcWFw
aS9taWdyYXRpb24uanNvbg0KPiA+PiArKysgYi9xYXBpL21pZ3JhdGlvbi5qc29uDQo+ID4+IEBA
IC0xNjg1LDcgKzE2ODUsOCBAQA0KPiA+PiAgICMjDQo+ID4+ICAgeyAnc3RydWN0JzogJ0NPTE9T
dGF0dXMnLA0KPiA+PiAgICAgJ2RhdGEnOiB7ICdtb2RlJzogJ0NPTE9Nb2RlJywgJ2xhc3QtbW9k
ZSc6ICdDT0xPTW9kZScsDQo+ID4+IC0gICAgICAgICAgICAncmVhc29uJzogJ0NPTE9FeGl0UmVh
c29uJyB9IH0NCj4gPj4gKyAgICAgICAgICAgICdyZWFzb24nOiAnQ09MT0V4aXRSZWFzb24nIH0s
DQo+ID4+ICsgICdpZic6ICdDT05GSUdfUkVQTElDQVRJT04nIH0NCj4gPj4NCj4gPj4gICAjIw0K
PiA+PiAgICMgQHF1ZXJ5LWNvbG8tc3RhdHVzOg0KPiA+PiBAQCAtMTcwMiw3ICsxNzAzLDggQEAN
Cj4gPj4gICAjIFNpbmNlOiAzLjENCj4gPj4gICAjIw0KPiA+PiAgIHsgJ2NvbW1hbmQnOiAncXVl
cnktY29sby1zdGF0dXMnLA0KPiA+PiAtICAncmV0dXJucyc6ICdDT0xPU3RhdHVzJyB9DQo+ID4+
ICsgICdyZXR1cm5zJzogJ0NPTE9TdGF0dXMnLA0KPiA+PiArICAnaWYnOiAnQ09ORklHX1JFUExJ
Q0FUSU9OJyB9DQo+ID4+DQo+ID4+ICAgIyMNCj4gPj4gICAjIEBtaWdyYXRlLXJlY292ZXI6DQo+
ID4+IGRpZmYgLS1naXQgYS9zdHVicy9jb2xvLmMgYi9zdHVicy9jb2xvLmMgbmV3IGZpbGUgbW9k
ZSAxMDA2NDQgaW5kZXgNCj4gPj4gMDAwMDAwMDAwMC4uNWEwMjU0MGJhYQ0KPiA+PiAtLS0gL2Rl
di9udWxsDQo+ID4+ICsrKyBiL3N0dWJzL2NvbG8uYw0KPiA+PiBAQCAtMCwwICsxLDQ2IEBADQo+
ID4+ICsjaW5jbHVkZSAicWVtdS9vc2RlcC5oIg0KPiA+PiArI2luY2x1ZGUgInFlbXUvbm90aWZ5
LmgiDQo+ID4+ICsjaW5jbHVkZSAibmV0L2NvbG8tY29tcGFyZS5oIg0KPiA+PiArI2luY2x1ZGUg
Im1pZ3JhdGlvbi9jb2xvLmgiDQo+ID4+ICsjaW5jbHVkZSAicWFwaS9lcnJvci5oIg0KPiA+PiAr
I2luY2x1ZGUgInFhcGkvcWFwaS1jb21tYW5kcy1taWdyYXRpb24uaCINCj4gPj4gKw0KPiA+PiAr
dm9pZCBjb2xvX2NvbXBhcmVfY2xlYW51cCh2b2lkKQ0KPiA+PiArew0KPiA+PiArICAgIGFib3J0
KCk7DQo+ID4+ICt9DQo+ID4+ICsNCj4gPj4gK3ZvaWQgY29sb19zaHV0ZG93bih2b2lkKQ0KPiA+
PiArew0KPiA+PiArICAgIGFib3J0KCk7DQo+ID4+ICt9DQo+ID4+ICsNCj4gPj4gK3ZvaWQgKmNv
bG9fcHJvY2Vzc19pbmNvbWluZ190aHJlYWQodm9pZCAqb3BhcXVlKSB7DQo+ID4+ICsgICAgYWJv
cnQoKTsNCj4gPj4gK30NCj4gPj4gKw0KPiA+PiArdm9pZCBjb2xvX2NoZWNrcG9pbnRfbm90aWZ5
KHZvaWQgKm9wYXF1ZSkgew0KPiA+PiArICAgIGFib3J0KCk7DQo+ID4+ICt9DQo+ID4+ICsNCj4g
Pj4gK3ZvaWQgbWlncmF0ZV9zdGFydF9jb2xvX3Byb2Nlc3MoTWlncmF0aW9uU3RhdGUgKnMpIHsN
Cj4gPj4gKyAgICBhYm9ydCgpOw0KPiA+PiArfQ0KPiA+PiArDQo+ID4+ICtib29sIG1pZ3JhdGlv
bl9pbl9jb2xvX3N0YXRlKHZvaWQpDQo+ID4+ICt7DQo+ID4+ICsgICAgcmV0dXJuIGZhbHNlOw0K
PiA+PiArfQ0KPiA+PiArDQo+ID4+ICtib29sIG1pZ3JhdGlvbl9pbmNvbWluZ19pbl9jb2xvX3N0
YXRlKHZvaWQpDQo+ID4+ICt7DQo+ID4+ICsgICAgcmV0dXJuIGZhbHNlOw0KPiA+PiArfQ0KPiA+
PiArDQo+ID4+ICt2b2lkIHFtcF94X2NvbG9fbG9zdF9oZWFydGJlYXQoRXJyb3IgKiplcnJwKSB7
DQo+ID4+ICsgICAgZXJyb3Jfc2V0ZyhlcnJwLCAiQ09MTyBzdXBwb3J0IGlzIG5vdCBidWlsdCBp
biIpOyB9DQo+ID4+IGRpZmYgLS1naXQgYS9zdHVicy9tZXNvbi5idWlsZCBiL3N0dWJzL21lc29u
LmJ1aWxkIGluZGV4DQo+ID4+IGIyYjU5NTZkOTcuLjg0MTJjYWQxNWYgMTAwNjQ0DQo+ID4+IC0t
LSBhL3N0dWJzL21lc29uLmJ1aWxkDQo+ID4+ICsrKyBiL3N0dWJzL21lc29uLmJ1aWxkDQo+ID4+
IEBAIC00NSw2ICs0NSw3IEBAIHN0dWJfc3MuYWRkKGZpbGVzKCd0YXJnZXQtZ2V0LW1vbml0b3It
ZGVmLmMnKSkNCj4gPj4gICBzdHViX3NzLmFkZChmaWxlcygndGFyZ2V0LW1vbml0b3ItZGVmcy5j
JykpDQo+ID4+ICAgc3R1Yl9zcy5hZGQoZmlsZXMoJ3RyYWNlLWNvbnRyb2wuYycpKQ0KPiA+PiAg
IHN0dWJfc3MuYWRkKGZpbGVzKCd1dWlkLmMnKSkNCj4gPj4gK3N0dWJfc3MuYWRkKGZpbGVzKCdj
b2xvLmMnKSkNCj4gPj4gICBzdHViX3NzLmFkZChmaWxlcygndm1zdGF0ZS5jJykpDQo+ID4+ICAg
c3R1Yl9zcy5hZGQoZmlsZXMoJ3ZtLXN0b3AuYycpKQ0KPiA+PiAgIHN0dWJfc3MuYWRkKGZpbGVz
KCd3aW4zMi1rYmQtaG9vay5jJykpDQo+ID4+IC0tDQo+ID4+IDIuMzQuMQ0KPiA+DQo+IA0KPiAt
LQ0KPiBCZXN0IHJlZ2FyZHMsDQo+IFZsYWRpbWlyDQo+IA0KDQo=

