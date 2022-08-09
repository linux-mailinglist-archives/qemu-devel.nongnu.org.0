Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C491C58D572
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 10:34:49 +0200 (CEST)
Received: from localhost ([::1]:49816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLKhM-0005z9-TY
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 04:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oLKbn-0000cu-UA
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:29:04 -0400
Received: from mga06b.intel.com ([134.134.136.31]:23993 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oLKbk-0007rC-LD
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:29:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660033740; x=1691569740;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6NU4mVVkrb94be3j69rIKO/QqN5HkHyuypdA7hjRGec=;
 b=OL2KQozAsz+JyIoERWxjWzJD59b4vlU+e0cS94HyUUhSrWnJHc/aol3E
 tdVNmTrj/Jv9wsEaWy+JYMZleNXhvGMZgCs1QpexvKBxbcgT74o90uGXr
 LWrrZ2r+riSjDELooRgt+lAnG9NpxvNMClKZaZnIrDD8tkw/J7Jlio7w2
 rMZHCsU71R1Rmr+4gqB1LG+8fDxzfhUULDqVlbYFIktijw10cCymONT0M
 7yQzQ7bddXw52bCXHb0y8yRFS9+LDIOh/AdH4LeFL8DlTJI3TXLZ9QjQD
 HVlUPF8iSU6S7qDQXo3xrrm8fU9ZQhIfNGW3wQG9jEKwg+VneIlrOm9Dd Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="352514804"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="352514804"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 01:28:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="633249856"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 09 Aug 2022 01:28:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 01:28:56 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 01:28:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 01:28:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 01:28:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxdWrmWFknQAR+pCRkuk6SSJq+P51oSiuPG1oSLLnfpK9KZRvUyF3bWKwVzYw7+KebK/zgLuXeAaWl01RBvkfYeYqJUH7ZyKDlhuXlrNixM5zfwWiJXEHH7i+80C3zlJIgfBO68wxZUZKWuDrdVYY5RA4MwhjAxfeRDZWx0h4IiXaiFBjW1CN2aHh+HXXP5+wKXYQsuDbsWkbR9YC10PGpsnKrCSjtujMgs0c5Fu0sdLden+Z9eVcYhZA2zeWulyvWM9K4HXNTDhmE3nWMSZEXcsdShdU9d/vafUHp1OAawtmzXSO+ssCsqm6Y+ryYXaiByN9ujsylPCgZBDrVxH+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NU4mVVkrb94be3j69rIKO/QqN5HkHyuypdA7hjRGec=;
 b=DaFyl41ujG81PVOrpc53hJXYzul3nWDujSaYK1LoM4tDToqiegmx1H5gBGA+/IcM+Qa+TRMvm6OCaP4Brv840pUmH4gfqBfxWAsdIt4kHzITgoB+6yvCqXg73+1n8zdnA38k6s03QH5sxvj5nEkcFiqhIiXdq8Yf0tciEFLfGtbthloYoJks/8PEPx1tn/atvvQn9dG5ZoZpt7yj9uzVKE/El5TGWh3F5+VfujxXMJfAeguMB1gSU/SKjPGPzkOqYRMwrWxTRyivsELKxIz0WJ/xVXCXCtDxG11o5eogEYsw+e7hwsmABv4vwjJRWspb+M5wu+W4LJMwq+z60JupDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by BN0PR11MB5760.namprd11.prod.outlook.com (2603:10b6:408:169::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 08:28:49 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee%7]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 08:28:49 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
CC: Peter Maydell <peter.maydell@linaro.org>, Li Zhijian
 <lizhijian@fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Subject: RE: [PATCH V3] net/colo.c: Fix the pointer issue reported by Coverity.
Thread-Topic: [PATCH V3] net/colo.c: Fix the pointer issue reported by
 Coverity.
Thread-Index: AQHYq5zPRShnsJI/PU2fXfF1C5tE5K2mOB+AgAADEVA=
Date: Tue, 9 Aug 2022 08:28:48 +0000
Message-ID: <MWHPR11MB0031AF520C6EEA63C544D5EE9B629@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220809025010.200289-1-chen.zhang@intel.com>
 <CACGkMEuWcLuGBfJ3zyEw2qi8=C80f13Tt1_t1fJj1D4k8PNRiw@mail.gmail.com>
In-Reply-To: <CACGkMEuWcLuGBfJ3zyEw2qi8=C80f13Tt1_t1fJj1D4k8PNRiw@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 7b2bd79b-19af-457b-1480-08da79e12ee9
x-ms-traffictypediagnostic: BN0PR11MB5760:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EWaOfYGNe5ozClSrrlkIh7spN4KytCoqmCbdnGoEcIKoe640nSZ5T9uWwq9GFHZrP5j7wECLK9ffs4qZezBh6q+o3NQvttYP6Wa+kjOYJYQ8d65Moj/wfL607V40HvB/W56Uhn3z0kMYF8yKkKNNuzh1s2oAlL+SS8j1HvSecKB+L5sDPrppB6tlg8KrUR5lf5rtROr2JbmaEuublHddJYbEmVRcKYksoDBXqoiP6PcBedKfQYlPMDUPBdl3XHzUrYTAedps4N5kD5p5vC4oF96CwQgjGhs0gGR10FUzB3DG8NUB427BWBzaBXyR1VPjEKt4LnIYSxEWnHA1WHs3qqNZ7ETLoaT39v97+6jjUCE0c7ECgIQ8HwHCjh9poPTfpsvjtsqocIvHK+kHx8d4aoE5rxDInVxw/PhDe0qUtZWyh2rKTxI7vu+vzRvqgzUDdplnMT83NAEu5XEYvGP3KOOyeKlrINg95EiI6asQAeX2MlufHgU1O3XuHfrwWJusAwqLv/RmcUEdaghsLfD00ytH5mj9AokB4rR8TZ3Z3PptabJKpj/sJvEGDkA+R4Tlcqaev8BY8/sZ6QSL+o8qSKdm+fD2Dkow3QwRlKHDisgwHDzeSadwNa3jTdYWVIB/r/tJhqiAWi2iV65Z+v8CQn3iLGc3paLwlA+a7jiolj6+LLWszB/bKEE7SU2oxrWuTEMannwUvl6s5rxpmZU03XIKXTaz4HT1UNetBR1JY6PakwNHXWmePDOhYE6t7j35JG7858dJlFen/51lsb4nMf2iG3j2Qzd6gusKKzrUNyKgpRYlzLadrdw83bw3eqSS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39860400002)(376002)(346002)(136003)(396003)(5660300002)(8936002)(52536014)(478600001)(33656002)(7696005)(6506007)(26005)(53546011)(41300700001)(9686003)(2906002)(38100700002)(55016003)(122000001)(186003)(86362001)(82960400001)(38070700005)(83380400001)(66556008)(76116006)(8676002)(54906003)(4326008)(66446008)(64756008)(66476007)(316002)(71200400001)(6916009)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEF6alczMHNHbGVjZ20zUW9zRDFaeS85M09kVmNIRE5vMm1JNUdxcmlrUnFx?=
 =?utf-8?B?ZW8zWEFYU2V6Rm9yRjhxT0Q1UlF6Smg1Y0lYN09DMEs3a3VUaW9JYVZBZzNF?=
 =?utf-8?B?UWZBU250MHBtdXp1QjJUTEZMVXFtdU5ncDJrOTVVd01KSlc5WGJFSFBHSzhl?=
 =?utf-8?B?ZWFzUFJBeVlxSlJZVjdva3ZmNWNlRnNxeHJuWXJUM1dsVDZ3KytsU0Z1UVFp?=
 =?utf-8?B?UklCS1N6cXdPRzFqaHE1VTFlQ0RuZWx4STkrTnpacE83UDBTVjZ5akVJYkdC?=
 =?utf-8?B?UWxOdys5NUpjR2s3clJrTmZkalRNajQvVS92TzFVc2tVQW16ak1nRHNpOXFT?=
 =?utf-8?B?VWhVQll2UGUwUjM2RDhOY1d1alpqWDRubGQ5aVU5L3gyMGNEM0twbEcyQTdV?=
 =?utf-8?B?SERuWi9ycDBlUzJ4NnhXVjBtWVRqVTFFQ1NESWphOEZVSnlYdW9FWXd1NUdZ?=
 =?utf-8?B?WWd1cC9DQ28yQklDMVpjc2RTUzRHVnZtNWtYVXl5MFdvZXpzWHA3cThqVlNP?=
 =?utf-8?B?T0MzZmdFZk11dllZZ1VsQUZSRVR1QmFxdzZyb0VpUGd4S01jaWc2UE5OR1dN?=
 =?utf-8?B?b2h0U1ZMc3VUa0pZc2xEWmc4TUZWeGtpaDNTMUdTQS92eC93VEhqMFQ2OGIv?=
 =?utf-8?B?SXVNRk9jWW55bDBDNklwWFpKM2FEempMRXJVNFBxeC9veXJIYmoveGFKdlRk?=
 =?utf-8?B?VzhWL2NWUjc3bXpud1VxSzU0dFY5TWpEZllpb0xodUtWOHVvSFYzcDVLemU4?=
 =?utf-8?B?b3ViVDA2L2R3Z1VSTjBLTWRUdUZ0MkFTU0U0T1d2YjFEQlI1NExvcXc0OXNU?=
 =?utf-8?B?NEVtclIzSFR4aS9rNjRNSXI5UFh1UVNoSlp2T1FqbGswVDdkRTRIV1FXQUM0?=
 =?utf-8?B?ZStPSDF5SDdXOWRtNzdZVmpZUVl0WDk1by90T0FicW9PZFJRb1UweVRBaTBQ?=
 =?utf-8?B?OFpNU2l2OXVGbmJ1R0NRRFFFOU0zOUw1V202cm9wM05seCtBZTJoK2Nwb2dF?=
 =?utf-8?B?Y0ZTMUh4dXNWSDdMMjVsK0VzaVBRMHFGN1Bya3RhMG5MRithWjhsY0dGOVVN?=
 =?utf-8?B?V3AxdkNvU09LVThjSmNqbWo1MGRJYlNReWF1d2R5TmxxY1liNWJJc1dBOWxi?=
 =?utf-8?B?RUl4eDJnQlNmdHhYRkNtNTRpc2VDMHhjb0ZHcSs2UTEzNVQ3SC80aFVDYUlv?=
 =?utf-8?B?UEsxaUN5elpaVVdDVWVBWnQ0SVZDMTlBYnBKVEt5K3E1VkMrY0pPcmI4dk9x?=
 =?utf-8?B?RXV5bkRSM1pWVW54ZnA1N3VNNFhvYTBIRXp1c3NmaGlJZ0ZiM3dlaWFzR3dk?=
 =?utf-8?B?VWxnNlhKcXIvMlRQM2thT1l1YVREZGQ3OFBtajV4bUMzdXFET0dRanYrdG43?=
 =?utf-8?B?dDd5NWpyTW8yVVArNU41N1RPcmpEUlErZ2hMZlRwNytiL04vV0JDLytaTWJx?=
 =?utf-8?B?bWEyNzhWNlk5N0RYL1RwNHZvTlZCaVUvM3NtR0EwSC9DQmRzUzA5aEtUdEtC?=
 =?utf-8?B?UnR4K1lYNkM3bUEwdGF3QmpkT3FmQWFhZ3owWXpBb2NIZ0VaRldOOUYrUENZ?=
 =?utf-8?B?ZEZNK2ZKa1R5dlduQXJoQWZyaGZ6NjhoRFFUemFNVmVvUlVscDVsMmxBOXho?=
 =?utf-8?B?eDRNc29nbExoOXA2eUxWSk50Ty80QXpoOVZCZ3lPRm50R1I1T2NSODcvOWR2?=
 =?utf-8?B?MWNobG9kUzdEbDgwNnluOENhTmh4bVBsb1M0UWIrMEw1Ty9kRGVwZTJObXFj?=
 =?utf-8?B?TVJNRjNJZlFnODhUdGJVUzFXcWxnQm1WanphZ3ZSMWs5WUlLNVdteDBFdUVL?=
 =?utf-8?B?eG9kZ0JBMUI4RSt0ZWhTLzd4SThOZFI3aWFWU25wdG9pRHlON3JXYmdxTUNG?=
 =?utf-8?B?WG01SUxNeWE2ZHlNWThKZERadVNJSzFtMXgzM29VWUJUWHJrbmorVDVISVJr?=
 =?utf-8?B?VWZOdkQ0M3VNeVo2bzdQOHZBU1IxNkNzZGl0NnIyTUxDY1Nja3VUT2xadzJy?=
 =?utf-8?B?VmM2OUp0UUJZNTlEWlMxTEdldW5zaTErcDVkemd1U3BCbGx1T3JicmNWR0Vq?=
 =?utf-8?B?WlJ6TXpiL3dvZnltQmhsblNxMERlYVhnaXIwdFlnZFRKbThmUjZJbWI0eVg3?=
 =?utf-8?Q?D7ndvhcV4nJM2c2XVxkjDAZD3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2bd79b-19af-457b-1480-08da79e12ee9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 08:28:48.7663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hmBtXoPIBB2ITk6h48wMUVsS11KmRWR7kJoy9RglM3e1RXDigthGs2Nord67p1hKFvpGxaEfcjMmudMJxNfjzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5760
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDksIDIwMjIgNDoxMiBQ
TQ0KPiBUbzogWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPg0KPiBDYzogUGV0ZXIg
TWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPjsgTGkgWmhpamlhbg0KPiA8bGl6aGlq
aWFuQGZ1aml0c3UuY29tPjsgcWVtdS1kZXYgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCBWM10gbmV0L2NvbG8uYzogRml4IHRoZSBwb2ludGVyIGlzc3VlIHJl
cG9ydGVkIGJ5IENvdmVyaXR5Lg0KPiANCj4gT24gVHVlLCBBdWcgOSwgMjAyMiBhdCAxMTowNSBB
TSBaaGFuZyBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBXaGVu
IGVuYWJsZSB0aGUgdmlydGlvLW5ldC1wY2ksIGd1ZXN0IG5ldHdvcmsgcGFja2V0IHdpbGwgbG9h
ZCB0aGUNCj4gPiB2bmV0X2hkci4gSW4gQ09MTyBzdGF0dXMsIHRoZSBwcmltYXJ5IFZNJ3MgbmV0
d29yayBwYWNrZXQgbWF5YmUNCj4gPiByZWRpcmVjdCB0byBhbm90aGVyIFZNLCBpdCBuZWVkIGZp
bHRlci1yZWRpcmVjdCBlbmFibGUgdGhlIHZuZXRfaGRyDQo+ID4gZmxhZyBhdCB0aGUgc2FtZSB0
aW1lLCBDT0xPLXByb3h5IHdpbGwgY29ycmVjdGx5IHBhcnNlIHRoZSBvcmlnaW5hbA0KPiA+IG5l
dHdvcmsgcGFja2V0LiBJZiBoYXZlIGFueSBtaXNjb25maWd1cmF0aW9uIGhlcmUsIHRoZSB2bmV0
X2hkcl9sZW4gaXMNCj4gPiB3cm9uZyBmb3IgcGFyc2UgdGhlIHBhY2tldCwgdGhlIGRhdGErb2Zm
c2V0IHdpbGwgcG9pbnQgdG8gd3JvbmcgcGxhY2UuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBa
aGFuZyBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgbmV0L2NvbG8u
YyB8IDE4ICsrKysrKysrKystLS0tLS0tLQ0KPiA+ICBuZXQvY29sby5oIHwgIDEgKw0KPiA+ICAy
IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvbmV0L2NvbG8uYyBiL25ldC9jb2xvLmMNCj4gPiBpbmRleCA2YjBmZjU2
MmFkLi40ZjFiNGE2MWY2IDEwMDY0NA0KPiA+IC0tLSBhL25ldC9jb2xvLmMNCj4gPiArKysgYi9u
ZXQvY29sby5jDQo+ID4gQEAgLTQ0LDIxICs0NCwyMyBAQCBpbnQgcGFyc2VfcGFja2V0X2Vhcmx5
KFBhY2tldCAqcGt0KSAgew0KPiA+ICAgICAgaW50IG5ldHdvcmtfbGVuZ3RoOw0KPiA+ICAgICAg
c3RhdGljIGNvbnN0IHVpbnQ4X3QgdmxhbltdID0gezB4ODEsIDB4MDB9Ow0KPiA+IC0gICAgdWlu
dDhfdCAqZGF0YSA9IHBrdC0+ZGF0YSArIHBrdC0+dm5ldF9oZHJfbGVuOw0KPiA+ICsgICAgdWlu
dDhfdCAqZGF0YSA9IHBrdC0+ZGF0YTsNCj4gPiAgICAgIHVpbnQxNl90IGwzX3Byb3RvOw0KPiA+
ICAgICAgc3NpemVfdCBsMmhkcl9sZW47DQo+ID4NCj4gPiAtICAgIGlmIChkYXRhID09IE5VTEwp
IHsNCj4gPiAtICAgICAgICB0cmFjZV9jb2xvX3Byb3h5X21haW5fdm5ldF9pbmZvKCJUaGlzIHBh
Y2tldCBpcyBub3QgcGFyc2VkIGNvcnJlY3RseSwgIg0KPiA+ICsgICAgYXNzZXJ0KGRhdGEpOw0K
PiA+ICsNCj4gPiArICAgIC8qIENoZWNrIHRoZSByZWNlaXZlZCB2bmV0X2hkcl9sZW4gdGhlbiBh
ZGQgdGhlIG9mZnNldCAqLw0KPiA+ICsgICAgaWYgKChwa3QtPnZuZXRfaGRyX2xlbiA+IHNpemVv
ZihzdHJ1Y3QgdmlydGlvX25ldF9oZHIpKSB8fA0KPiANCj4gVmlydGlvLW5ldCBzdGFydHMgdG8g
c3VwcG9ydCBSU1Mgc28gaXQgbWVhbnMgdGhlIHZuZXRfaGRyIHNpemUgY291bGQgYmUgZ3JlYXRl
cg0KPiB0aGFuIHZpcnRpb19uZXRfaGRyIG5vdy4NCj4gDQo+IE9yIGRpZCB5b3UgYWN0dWFsbHkg
bWVhbiAiPCIgaGVyZT8NCg0KTm8sIEkganVzdCB0cnkgdG8gYXZvaWQgb3ZlcmZsb3cgd2l0aCBh
IG1hbGljaW91c2x5IG92ZXItbGFyZ2UNCnZuZXRfaGRyX2xlbiB2YWx1ZSBhcyBQZXRlcidzIGNv
bW1lbnRzLg0KSWYgZW5hYmxlZCB0aGUgUlNTLCBob3cgdG8gZ2V0IHRoZSBtYXhpbXVtIG9mIHZu
ZXRfaGRyIHNpemU/DQoNClRoYW5rcw0KQ2hlbg0KDQo+IA0KPiBUaGFua3MNCj4gDQo+ID4gKyAg
ICAgICAgKHBrdC0+c2l6ZSA8IHNpemVvZihzdHJ1Y3QgZXRoX2hlYWRlcikgKyBzaXplb2Yoc3Ry
dWN0IHZsYW5faGVhZGVyKQ0KPiA+ICsgICAgICAgICsgcGt0LT52bmV0X2hkcl9sZW4pKSB7DQo+
ID4gKyAgICAgICAgdHJhY2VfY29sb19wcm94eV9tYWluX3ZuZXRfaW5mbygiVGhpcyBwYWNrZXQg
bWF5IGJlIGxvYWQgd3JvbmcgIg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgInBrdC0+dm5ldF9oZHJfbGVuIiwgcGt0LT52bmV0X2hkcl9sZW4pOw0KPiA+ICAg
ICAgICAgIHJldHVybiAxOw0KPiA+ICAgICAgfQ0KPiA+IC0gICAgbDJoZHJfbGVuID0gZXRoX2dl
dF9sMl9oZHJfbGVuZ3RoKGRhdGEpOw0KPiA+ICsgICAgZGF0YSArPSBwa3QtPnZuZXRfaGRyX2xl
bjsNCj4gPg0KPiA+IC0gICAgaWYgKHBrdC0+c2l6ZSA8IEVUSF9ITEVOICsgcGt0LT52bmV0X2hk
cl9sZW4pIHsNCj4gPiAtICAgICAgICB0cmFjZV9jb2xvX3Byb3h5X21haW4oInBrdC0+c2l6ZSA8
IEVUSF9ITEVOIik7DQo+ID4gLSAgICAgICAgcmV0dXJuIDE7DQo+ID4gLSAgICB9DQo+ID4gKyAg
ICBsMmhkcl9sZW4gPSBldGhfZ2V0X2wyX2hkcl9sZW5ndGgoZGF0YSk7DQo+ID4NCj4gPiAgICAg
IC8qDQo+ID4gICAgICAgKiBUT0RPOiBzdXBwb3J0IHZsYW4uDQo+ID4gZGlmZiAtLWdpdCBhL25l
dC9jb2xvLmggYi9uZXQvY29sby5oDQo+ID4gaW5kZXggOGIzZThkNWE4My4uMjJmYzMwMzFmNyAx
MDA2NDQNCj4gPiAtLS0gYS9uZXQvY29sby5oDQo+ID4gKysrIGIvbmV0L2NvbG8uaA0KPiA+IEBA
IC0xOCw2ICsxOCw3IEBADQo+ID4gICNpbmNsdWRlICJxZW11L2poYXNoLmgiDQo+ID4gICNpbmNs
dWRlICJxZW11L3RpbWVyLmgiDQo+ID4gICNpbmNsdWRlICJuZXQvZXRoLmgiDQo+ID4gKyNpbmNs
dWRlICJzdGFuZGFyZC1oZWFkZXJzL2xpbnV4L3ZpcnRpb19uZXQuaCINCj4gPg0KPiA+ICAjZGVm
aW5lIEhBU0hUQUJMRV9NQVhfU0laRSAxNjM4NA0KPiA+DQo+ID4gLS0NCj4gPiAyLjI1LjENCj4g
Pg0KDQo=

