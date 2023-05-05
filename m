Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 135976F7E3C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 09:57:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puqIz-00026m-ML; Fri, 05 May 2023 03:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puqIx-00026P-7h
 for qemu-devel@nongnu.org; Fri, 05 May 2023 03:56:39 -0400
Received: from mga01.intel.com ([192.55.52.88])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puqIv-0008E1-1K
 for qemu-devel@nongnu.org; Fri, 05 May 2023 03:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683273397; x=1714809397;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k/hq2H79GqAF02Is4V2WcKYGoYyrevfTDhFZj/AX8m0=;
 b=ChfBu6WAMfbsJMpxzZWRLfCrryLpArVQDi2VfDnbjJFGYWpa5Np+xQZP
 LArprxDQ9YAg72MOgJV8/UzCKjTPlYTxFaARgUaK9TK/GQ6XXuT8CZzJe
 TNkh5n5QoIbBgtZXueTinNwLNfOjAkD+1hyKkgW3IdfEc3oiID9j6fHpX
 klaveZsfTlKm3r+w2NwntSNwvvGAZS7gA8Ns6FVHjcIbFCJFGxuX6I9OZ
 qI3Vowmhahv7+yKYzSxrgsXBSksLxBDK3T2RmwqH5ZUiThQgsadWNJciK
 Bz21sJdC4VYTRO3tZyftC+lyYNynJVIQGxQtyxOXJB9Gog4XRDReoVmg6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="377233362"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="377233362"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 00:56:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="871713328"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="871713328"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 05 May 2023 00:56:33 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 5 May 2023 00:56:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 5 May 2023 00:56:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 5 May 2023 00:56:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdGSATasU1HaUSfR2RJzzEi61ZgAAFUze/btjbhe50z/+nm02vX1SBf1fj0pthHgJ3KnbX7i8ebn/oTT60eJMg7lbGOru8VHuVX9+z7yFyQkvWs4FPSUA4WMAYC5kP9DXUJRIePH1a2mxMWT0MMk+2UBSa+xzXg2gWli541IcWGhN7xZkYWdtiOY2oL2YhMwNKI/Io1EpYtHJrKcgOr3DzabKSLrs9kOlv66qGYsM4OSUja+Awogqkjyz/mtzjWsY5EDkuHICuXXPoslbwS8QNac/UbSk5Hj6eCuyY0KpSSt7XddPpm5gPjVMCrY/GwHIXVK1+eAIVMSVa/9syURgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/hq2H79GqAF02Is4V2WcKYGoYyrevfTDhFZj/AX8m0=;
 b=UZwP3VtdnMkqvBoGtgCWhrQ3ca63v191lzN9MaXoWoCFLO5tdsIcs6Uwc34W7cPMfbkxUArAjGTrklQSR3FarmNNTuwjN/9Wtg8lQhVaxQgBHHcjC+PwQnyUFjzlj7xcTNX1x9sRtB0DjHjFb3CNzb6SV0Dbsn/zpOS5VwhUiLTVniBvXGFkPccxAPPZ/XQku5GsiqRsHuR1ia7pNZSngpfdTOHXvtVMg4dg0Z1QQD2s1kvTxE3hpfVHLzEZBs6Yy+XiHnG7MZDWhyECFfI81u0GW0QPpe/tCSgtz9/bwCcLX+WMtX76affhABulTevhh7YgQyv1QnR2EwvRuulPGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by CH0PR11MB5297.namprd11.prod.outlook.com (2603:10b6:610:bc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 07:56:30 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0%3]) with mapi id 15.20.6363.026; Fri, 5 May 2023
 07:56:30 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "lukasstraub2@web.de" <lukasstraub2@web.de>, "quintela@redhat.com"
 <quintela@redhat.com>
Subject: RE: [PATCH v4 00/10] COLO: improve build options
Thread-Topic: [PATCH v4 00/10] COLO: improve build options
Thread-Index: AQHZegsXIzv6xetSvEmQeFMTGAY1+a9LWPzQ
Date: Fri, 5 May 2023 07:56:30 +0000
Message-ID: <MWHPR11MB0031058F5CA0B21EAE6443EE9B729@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
In-Reply-To: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|CH0PR11MB5297:EE_
x-ms-office365-filtering-correlation-id: 0816620e-82de-479d-d2c4-08db4d3e3c7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VAi4fR0pQyjPzAOb4e1qW536iYtjqbip/u/ZCRlWYCFdQukv2CQZcglgxQ6ZrGTUmHXGcvY5BKQ/5iLnfknL4GkvSbVQ1ALwIMvkaUsJPFLA7iDXkxwCMpO1t2QsIp4mv5fpVkbKfVC5KB2NworqySC6UFyBA79dJMEoWvFb/BiI5qf+MPutTy8yDNKOzAa9i2p/ut+tZ0ufzoto09/KdHJEFMuRtNjfEFWtts85psu49c4yCPVhrVUvxgt9U48h4CsQ8s4HzYF9m62KMAmuKPDyX/q4Ykz8NP+hEj+zZGYYjau1paMQb7OipPSNlz9G6W3aGe7wL7ZGywmbNhudpas5Dx2B8t50Bd5er7rlBSFYZqpAuIP45wz2xehsX6DtOjjg/s6bchfGCjuiIemxJw/QXMJXWt79My+eMO4uWK7xB4jTMj/6Vk9o/xVcVF4him44BFIuO7sjuAcFC6omYO1+pjkJwdgSVyJ4rd4AxDohk0oRhHmBGiboBDdO07scDCHNO+Sm6asDp7+kJILQ5S4MG7vpWvSMSpLPBZS0riB4YQBmOOytaBSVvwDo0NnPQp0xegbpeFtUuHk2IPjPji2nutQmtNAKLvkFib9KfmJcr66oGaXOHNWc9dQW1z3m
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(376002)(366004)(396003)(39850400004)(451199021)(86362001)(33656002)(71200400001)(110136005)(54906003)(316002)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(4326008)(7696005)(478600001)(41300700001)(55016003)(8676002)(8936002)(5660300002)(52536014)(2906002)(38070700005)(82960400001)(38100700002)(122000001)(186003)(9686003)(6506007)(26005)(53546011)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWRpTXJDTTk0Yk9acHg4QVZQUE1pODF5eDl4TWZJZU5RNVMvOGJTRVdFVDJK?=
 =?utf-8?B?Q0p3RDEwOFlYTHd5czBjZjM5M3VQY1FvK2p6dzBtU2ZWUFBpNkU1cmprS1RP?=
 =?utf-8?B?VmRqQjB3L0RTcnJsbFQ2SXkzTU10L2xmT3Nzck5oN09JZjhkbjE0QStPWmlj?=
 =?utf-8?B?Y2QzUlM1VjVRSVN1V0dvNCtYL2RYUzRmOWExUkJxR2hjU3BDREpMN2pBWkZo?=
 =?utf-8?B?QzFXUlloSDM1S1krSmxvMUZySzZuVXpLZFBpaHhQcDRtcG45aG9xQmNQRTBB?=
 =?utf-8?B?WDU0eDA2QlVFMVl2WUptYTFrREFDc0pqWDJLT0RlWUMzZEpNM0thM3ZRRzNO?=
 =?utf-8?B?RkxXMWRoaWZzMDdWYmF4VEJieGh4L0JzbXYvZzg4a1hmdEpxQklEb2tWa0lQ?=
 =?utf-8?B?V3dOTnNORThaNHpGWkt3cVYxeVg2djFoQ0FoK2xCYlhZd29McWJvNTRnRnVF?=
 =?utf-8?B?WXBQdks2QlczK1JleHNTOEIxZUxoOHhseUdSUS9ramN3c1RySXVBTUZDckx5?=
 =?utf-8?B?cDZRRHBwN1hNL1pkTG82Zm5lVjZXbTZQMSs2Tm1MbElDRVMxQ1dIWHAvTlRJ?=
 =?utf-8?B?U291b0FtTWFvVTJvL1RKeCt2S0w5VzNORjJLbDNlOHJZMW1UemgwSURlNWJE?=
 =?utf-8?B?TW9LZjdYR1hTdVJRR3MvMEEvRkt3b3doSDFJSHFGTzlhRENUSHJWLzh1OVBa?=
 =?utf-8?B?MkI1NzAveC91cXBnYnpXSTg4V09meXp4NDFjYUNCaUtqOXZBRm04TXNDb3Vv?=
 =?utf-8?B?RVVsbXh6UUZHTy9ISDJ1RUI4MDBsVVNIa215eTNMNXpEM2NleXVTNlFHNVEx?=
 =?utf-8?B?cmlQUmx0OU5mV2o5aWpSV0g2NVNiRkxkTWNiTWxEZTcyN0tReG1HMU0waDVa?=
 =?utf-8?B?Wll5ank2cTcvNHMydExtQUtWZjZyWkdETHNKQVVNWWNST21hcWlIRWxCRU5T?=
 =?utf-8?B?MllpL1BsS0I4aGVHanBSdE9sSGlxaWE3cnljT2dCWVV3ZXRBekhWNTE1Z3pm?=
 =?utf-8?B?UnhOV3dlcVZGMEZVUy9TZ29xVTBZcS90S2FtczRxamJnclhWM2xibFZXTmxX?=
 =?utf-8?B?VFVBeHczVHY4YkZMejJEWmJDc2REZGpFNTdKamt4ZHZBOCs5Tyt2OXF4NEdN?=
 =?utf-8?B?ajVRcEFnQ1piYTMvcEhRUnJRODI4NXZXbXFUQWdJUURmaW9pcjNQcXpGcm9v?=
 =?utf-8?B?eGEvNzVyd01abVBKS2FCVEpoVmZsWWYwWG5ub2M2dHVHd3ZqemNBV0FBM00w?=
 =?utf-8?B?eXdZNmE1U05hdjJVRkV5Vm1MNEpUb1U5dzBDeUticE1uM0dRUnBORkozWnMv?=
 =?utf-8?B?N0wwZ29BdTlJbU5NT3Y1R0VjMm5pbnExS3RLUHgzMTJIQlV3elUwRHZVZ1hk?=
 =?utf-8?B?SlFCbk9zRTh0K1NNd0dCTTNsditTV0E1M1h4M1BkZHNLaVFvMGVHVElLMTd2?=
 =?utf-8?B?QUNpYXh0QmlMMnNIMHczc3gxQUp2YTQyUXJKNjd1NVpqVTBxY1JLZWxmSHdW?=
 =?utf-8?B?Z0dsaDVwa1RHL1lLVW9taVpqYVNQTDk0N1lKbmhIT2NMMmJLbFpqWFJTaHp2?=
 =?utf-8?B?WlFoYk13QmttNS9XV0ZqT1RnZ3lIRmFiZ2NaVWN2OCtSOGZFcFpYR3VFcVRS?=
 =?utf-8?B?K1VSdXk5RFJ3bzhMdGNVbVB6UXltS05xTU1NOWlHSExNWmkvTFhvTFlpcVh6?=
 =?utf-8?B?ZSs0ZVVjNTYrQ3R4YTB2b0pxR0F3a3BPbVNoMC9zL29sQkphZjJLMFhoU3lM?=
 =?utf-8?B?bWtSSU9Xem15UkRoMUV0RHI0UDZ5LytpcTk3T05WaUdUeCtacGxzYSt0SzVH?=
 =?utf-8?B?OTJJbENIbXBDeStaSzV6TUJJQ04yS2llQXV2Vk1ERUNiTHJDV1Y5Z09HTEdr?=
 =?utf-8?B?c0NVNzFzYzBKbGFNKytDYlNSeGZWajVxMW1RZVprVmdrMUV0U1ZmaFN3dC9o?=
 =?utf-8?B?WUZCU2xTUzVkMSttdVIxODgrVTk2MGxJeFl2Z2NHd0hkbmFLRXVMaGhKczBS?=
 =?utf-8?B?ckJJTkZ3cmNvUE5vaGpyZWdQU05HQmtPaDRQTWFqV2pXckNlWEhyaUR5WVlJ?=
 =?utf-8?B?QjVad2w3QzBrakViMmNFY01URG1WUTZ3RGxEam1WdUdKVUlzenRFY2ZwQU5u?=
 =?utf-8?Q?KJrbw0SoOy7paQZ8QibQJGnTS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0816620e-82de-479d-d2c4-08db4d3e3c7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 07:56:30.1077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gJ3YY0W3hzg7wav8JVo4NGJpU0S152YkaRec5VTvSIPZyGZJjdGqRZSpISvf7qcjg9lVCUu129mAh5//Twh+bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5297
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88; envelope-from=chen.zhang@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVmxhZGltaXIgU2VtZW50
c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB5YW5kZXgtdGVhbS5ydT4NCj4gU2VudDogU2F0dXJk
YXksIEFwcmlsIDI5LCAyMDIzIDM6NDkgQU0NCj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0K
PiBDYzogbHVrYXNzdHJhdWIyQHdlYi5kZTsgcXVpbnRlbGFAcmVkaGF0LmNvbTsgWmhhbmcsIENo
ZW4NCj4gPGNoZW4uemhhbmdAaW50ZWwuY29tPjsgdnNlbWVudHNvdkB5YW5kZXgtdGVhbS5ydQ0K
PiBTdWJqZWN0OiBbUEFUQ0ggdjQgMDAvMTBdIENPTE86IGltcHJvdmUgYnVpbGQgb3B0aW9ucw0K
PiANCj4gdjQ6DQo+IDAxOiBhZGQgci1iIGJ5IEx1a2FzDQo+IDAyOiBuZXcNCj4gMDM6IC0ga2Vl
cCB4LWNvbG8gY2FwYWJpbGl0eSBlbnVtIHZhbHVlIHVuY29uZGl0aW9uYWwNCj4gICAgIC0gZHJv
cCBpZmRlZnMgaW4gb3B0aW9ucy5jIGFuZCBrZWVwIGNhcGFiaWxpdHkgY2hlY2sgaW5zdGVhZA0K
PiAgICAgLSB1cGRhdGUgc3R1YnMNCj4gICAgIC0gYWRkIG1pc3NlZCBhLWIgYnkgRHIuIERhdmlk
DQo+IDA0OiBrZWVwIGZpbHRlci1taXJyb3IgdW50b3VjaGVkLCBhZGQgci1iIGJ5IEp1YW4NCj4g
DQo+IG90aGVyczogbmV3LiBTb21lIGZ1cnRoZXIgaW1wcm92ZW1lbnRzIG9mIENPTE8gbW9kdWxl
IEFQSS4gTWF5IGJlDQo+IG1lcmdlZCBzZXBhcmF0ZWx5Lg0KPiANCj4gSGkgYWxsIQ0KPiANCj4g
Q09MTyBzdWJzdGVtIHNlZW1zIHRvIGJlIHVzZWxlc3Mgd2hlbiBDT05GSUdfUkVQTElDQVRJT04g
aXMgdW5zZXQsIGFzDQo+IHdlIHNpbXBseSBkb24ndCBhbGxvdyB0byBzZXQgeC1jb2xvIGNhcGFi
aWxpdHkgaW4gdGhpcyBjYXNlLiBTbywgbGV0J3Mgbm90IGNvbXBpbGUNCj4gaW4gdW5yZWFjaGFi
bGUgY29kZSBhbmQgaW50ZXJmYWNlIHdlIGNhbm5vdCB1c2Ugd2hlbg0KPiBDT05GSUdfUkVQTElD
QVRJT04gaXMgdW5zZXQuDQo+IA0KPiBBbHNvLCBwcm92aWRlIHBlcnNvbmFsIGNvbmZpZ3VyZSBv
cHRpb24gZm9yIENPTE8gUHJveHkgc3Vic3lzdGVtLg0KDQpUaGlzIHNlcmllcyBsb29rcyBnb29k
IHRvIG1lLg0KUGxlYXNlIGFkZCB0aGUgbmV3IGNvbmZpZ3VyZSBvcHRpb24gcmVsYXRlZCBjb21t
ZW50cyB0byBkb2NzL0NPTE8tRlQudHh0LCBibG9jay1yZXBsaWNhdGlvbi50eHQsIGNvbG8tcHJv
eHkudHh0Lg0KDQpUaGFua3MNCkNoZW4NCg0KPiANCj4gVmxhZGltaXIgU2VtZW50c292LU9naWV2
c2tpeSAoMTApOg0KPiAgIGJsb2NrL21lc29uLmJ1aWxkOiBwcmVmZXIgcG9zaXRpdmUgY29uZGl0
aW9uIGZvciByZXBsaWNhdGlvbg0KPiAgIGNvbG86IG1ha2UgY29sb19jaGVja3BvaW50X25vdGlm
eSBzdGF0aWMgYW5kIHByb3ZpZGUgc2ltcGxlciBBUEkNCj4gICBidWlsZDogbW92ZSBDT0xPIHVu
ZGVyIENPTkZJR19SRVBMSUNBVElPTg0KPiAgIGNvbmZpZ3VyZTogYWRkIC0tZGlzYWJsZS1jb2xv
LXByb3h5IG9wdGlvbg0KPiAgIG1pZ3JhdGlvbjogZHJvcCBjb2xvX2luY29taW5nX3RocmVhZCBm
cm9tIE1pZ3JhdGlvbkluY29taW5nU3RhdGUNCj4gICBtaWdyYXRpb246IHByb2Nlc3NfaW5jb21p
bmdfbWlncmF0aW9uX2NvOiBzaW1wbGlmeSBjb2RlIGZsb3cgYXJvdW5kDQo+ICAgICByZXQNCj4g
ICBtaWdyYXRpb246IHNwbGl0IG1pZ3JhdGlvbl9pbmNvbWluZ19jbw0KPiAgIG1pZ3JhdGlvbjog
cHJvY2Vzc19pbmNvbWluZ19taWdyYXRpb25fY28oKTogbW92ZSBjb2xvIHBhcnQgdG8gY29sbw0K
PiAgIG1pZ3JhdGlvbjogZGlzYWxsb3cgY2hhbmdlIGNhcGFiaWxpdGllcyBpbiBDT0xPIHN0YXRl
DQo+ICAgbWlncmF0aW9uOiBibG9jayBpbmNvbWluZyBjb2xvIHdoZW4gY2FwYWJpbGl0eSBpcyBk
aXNhYmxlZA0KPiANCj4gIGJsb2NrL21lc29uLmJ1aWxkICAgICAgICAgICAgICB8ICAgMiArLQ0K
PiAgaG1wLWNvbW1hbmRzLmh4ICAgICAgICAgICAgICAgIHwgICAyICsNCj4gIGluY2x1ZGUvbWln
cmF0aW9uL2NvbG8uaCAgICAgICB8ICAxOCArKysrKy0NCj4gIG1lc29uX29wdGlvbnMudHh0ICAg
ICAgICAgICAgICB8ICAgMiArDQo+ICBtaWdyYXRpb24vY29sby5jICAgICAgICAgICAgICAgfCAx
MDAgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tDQo+ICBtaWdyYXRpb24vbWVzb24u
YnVpbGQgICAgICAgICAgfCAgIDYgKy0NCj4gIG1pZ3JhdGlvbi9taWdyYXRpb24taG1wLWNtZHMu
YyB8ICAgMiArDQo+ICBtaWdyYXRpb24vbWlncmF0aW9uLmMgICAgICAgICAgfCAgNTEgKysrKysr
Ky0tLS0tLS0tLS0NCj4gIG1pZ3JhdGlvbi9taWdyYXRpb24uaCAgICAgICAgICB8ICAxMSArKyst
DQo+ICBtaWdyYXRpb24vb3B0aW9ucy5jICAgICAgICAgICAgfCAgIDYgKy0NCj4gIG5ldC9tZXNv
bi5idWlsZCAgICAgICAgICAgICAgICB8ICAxMyArKysrLQ0KPiAgcWFwaS9taWdyYXRpb24uanNv
biAgICAgICAgICAgIHwgICA5ICsrLQ0KPiAgc2NyaXB0cy9tZXNvbi1idWlsZG9wdGlvbnMuc2gg
IHwgICAzICsNCj4gIHN0dWJzL2NvbG8tY29tcGFyZS5jICAgICAgICAgICB8ICAgNyArKysNCj4g
IHN0dWJzL2NvbG8uYyAgICAgICAgICAgICAgICAgICB8ICAzNyArKysrKysrKysrKysNCj4gIHN0
dWJzL21lc29uLmJ1aWxkICAgICAgICAgICAgICB8ICAgMiArDQo+ICAxNiBmaWxlcyBjaGFuZ2Vk
LCAxODEgaW5zZXJ0aW9ucygrKSwgOTAgZGVsZXRpb25zKC0pICBjcmVhdGUgbW9kZSAxMDA2NDQN
Cj4gc3R1YnMvY29sby1jb21wYXJlLmMgIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdHVicy9jb2xvLmMN
Cj4gDQo+IC0tDQo+IDIuMzQuMQ0KDQo=

