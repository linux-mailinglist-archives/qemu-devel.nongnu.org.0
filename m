Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AFA6FD727
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 08:37:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwdRM-0007es-Kg; Wed, 10 May 2023 02:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1pwdQz-0007ZS-EY
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:36:21 -0400
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1pwdQw-0002gN-BP
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683700578; x=1715236578;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GB54c+blPfDGcQe3r6R439cuXMsSxb4JbEk+40a5E98=;
 b=fR69hDsQN0UIM2DQKe3/1kxNM2X7VkI8f4/UgOUmDFvlqE9W+NhW/e9T
 Y0l2q7d+nOEjWdx4riil7ZSN0exKpx5cwDM98fBcGeXEs11QTzIvVxDVo
 7WDGJS6GKVmSn76UK6Fa+YzQWGnVPeMjDkGUySF6dJGRYTwelWo5N6zLc
 s34xGszlL69EvcFMqlWRuIVEjsKp9i2pcinEBgyEmp9bdGQ9P+DyJTpC+
 5r5Jb6Fipvd6M/Pb52z+LQOjde8Zj6Y8UypfoTpEgZ5YTmDa44tQWTh3h
 Aec7+t2roQ4A3LqnPNsMlPJMZXl3kS+eiBUfs3oj/26gMnZKQrVpsQ5sK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="329759254"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; d="scan'208";a="329759254"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 23:36:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="732036653"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; d="scan'208";a="732036653"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 09 May 2023 23:36:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 23:36:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 23:36:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 23:36:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bykyITgcihFrxivyBfvYjDGt5QCxpa8N8CM9p357+EcMpYB4BcHqIjLJqn+7FsSgVAIH28d5Bu+/XYnX3vd9sZzMF0acUxqN33tQUoiYqmnTt498xldh5A3PcrxvFbgNhd0v9xR1gPIsB0L3TeP0autKxpWyufwNHqlc0sS6uP2KHSTnaP5dLnECxLBuRCA9/AH1aYRpu8CHeMN/68RSWrPrTkYAf+6q518huRpDrFKH9JBThVYFCtfTF9K3aaUw2+0okADgAIaCUpvkqdZK+cOm25mZdGmUQPQpSxLmdy80kwSXapQ3Hm+u+BDGlfG2lu89G9fSL13MzJFI+0q89Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GB54c+blPfDGcQe3r6R439cuXMsSxb4JbEk+40a5E98=;
 b=lxossJ6Xi1oLMlyxO5ntPU45vl3DTGSjX4zIn4+N0IF5wLX73iKZ7c4eT84A721+EkMuctUDHpBo/80VSlUmczIgBAqaPyJg2BsKgOxlgw1FMNeAEGjMWgUGjjkTO+5+SSFXiF/CIZCTF5jxm1y9eqm/cXIDt35IfMBfRO0D4VoYCU7X04fe9RJ1NIqSQaGDGUJLkjnbLy/k1GZG3kYW7tJgjxlISj28zHLDQKP/Ucv85ls3QCk9gDUMf72Lg0yEVM/SzmlMRFQOLBBFmYwuGhquF69c+aFr5T81WDgPGZOgIxLqG52eewUephaDTlohhqaOdiGrWG/8qnga04WN/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 by CO1PR11MB5011.namprd11.prod.outlook.com (2603:10b6:303:6d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Wed, 10 May
 2023 06:36:06 +0000
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::da0a:8aab:d75b:55f1]) by SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::da0a:8aab:d75b:55f1%7]) with mapi id 15.20.6363.032; Wed, 10 May 2023
 06:36:06 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "peterx@redhat.com"
 <peterx@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "eduardo@habkost.net" <eduardo@habkost.net>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>
Subject: RE: [PATCH] intel-iommu: Set status bit after operation completed
Thread-Topic: [PATCH] intel-iommu: Set status bit after operation completed
Thread-Index: AQHZgwi4Jvqz/de/VUKAoez6hBj/y69TDOtQ
Date: Wed, 10 May 2023 06:36:05 +0000
Message-ID: <SJ0PR11MB67440C7043AB2C8535E4319D92779@SJ0PR11MB6744.namprd11.prod.outlook.com>
References: <20230309092319.29229-1-zhenzhong.duan@intel.com>
 <20230510022854-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230510022854-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6744:EE_|CO1PR11MB5011:EE_
x-ms-office365-filtering-correlation-id: b3e23792-e060-4cd7-e9ee-08db5120d515
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yt4Cb+huOgDHhxIxfASCPmpyUK88bSjfpH/w6e2I91wCjDAWZb9pHCRxQDZTsh0viMxMHUFSz1dzQ6TZzJLnWyMin6tFfKZuTLbJ47FEpHwE7w2vmb+0JjliKCenbyT5O6kFUuEW4Q+6HubL8QtxEGYhMx+SjL1WmnTYJD7Z5wnW27r4ab7OdpkG3pnYqHQ6fNyx4jRLRyuR+RiIZBX3xgMTU+woKodk8EUXRlVS8WyIYZA/TT7qaRXFKnCg8BxGtqwePCaoSVw6pAj19Nl3rMP7zOBQpvI3QyNEXnEZPUfHZQDoK7VkSorrmebtKmyAtyVq8mVjgKnIrRtTlPCAR3XgYfARr1A3FiZENBUO/I6LZGiCkwAzwjKTG0bRcROQz+iZJ6fOeYMitfNlMxAEYbMF2Bm+8DLSrk+7HWuAHL6zd8fFd18QRfKDGnMx467yGbPu5ivvIFxMleXPfLPg++VRZMZoq6fRy6/djjbVTC7g9iqz1Xypo4vxpqwah0ElpEoX+n1j2DrWZBeWglV0Fib24rMBuDLlHuU+UcTfqhbFGqLOW8EAGMylvhCr/Qeajzyqbk3n4xkj9IemBDDXk7DBNL0lT1P0URE9B/2RAD1F6fsTnnzKfJi5xtMkRI1q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6744.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199021)(55016003)(9686003)(2906002)(83380400001)(186003)(41300700001)(6506007)(4326008)(66946007)(66446008)(66476007)(76116006)(66556008)(316002)(6916009)(71200400001)(64756008)(54906003)(478600001)(5660300002)(26005)(52536014)(8936002)(7696005)(8676002)(38100700002)(38070700005)(122000001)(82960400001)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0NKTVJBZ0IvOFJkOUx3ZzlyQkdvSlN6ajBQcUU4SnNwNGFnaUZYQkZQODli?=
 =?utf-8?B?OHFsc0dueWg1QkZlSVU1bmZWODk1eE5PemRONVF2L0RJdjZqSlNqQ0d1UGFw?=
 =?utf-8?B?U2pzY3JOenNwMmZsUm91UmxuemxSTVl2RFVoMGYzdnJ1NzlWZFVBZGtyOTgz?=
 =?utf-8?B?NFRSTmdLYm4wRC9CbytBSmVnak5xS2UrTlFyY1JoUWtPYW1zdzVBMmpSc0Vy?=
 =?utf-8?B?NWEzUTJXTTNpR0JWY2xMY3pvVEhPSTRheCsxc1YxQW9UZkNYQnQyMDJ6K2JL?=
 =?utf-8?B?SmIySno0Yis2VC8wNVdiMFFCdlJzb2hVaGRpYlI2ZVhlSXVsTUZtZkx6aEdV?=
 =?utf-8?B?ODI2cE8wS2RuQWE4cUxZdWZGMStJRDJCVDNiUW0xcVNGTzNTVWxIc08rNzRZ?=
 =?utf-8?B?ayt5bEVSREdKUnpMVjBBWmVuUkw2MFlaZ2h6V1prTWsvZ29SdmRrc3kyME05?=
 =?utf-8?B?NDUwb1VUNGdBMGFDZW1wdE5peHFxSUNTdFVadEE4YXUwU3AvaWNhbG13c1ZW?=
 =?utf-8?B?cElVUzlnNW5sK3pqZWJMdDBWWk5haFBoNTU1b0YrNkxxL1p2anhTVkUxM0lk?=
 =?utf-8?B?NFVSdnNpWUhDZTgyVCtGZ1hzWU9BOHp3NVZ5L0UyM1MyUXF5ZWU4MHBZU3BE?=
 =?utf-8?B?MStaVmNiL2M0d0J4WGgvY3RHRHMvS2xWbDJzTmlzWVhFeDJkTk1sQmVXRHky?=
 =?utf-8?B?TXFHVlFiVmtCd0YxSUU3YlIxL0dUOE81N1FNOWhha3BYeVFlaFFndTZzc2RU?=
 =?utf-8?B?WEtpb2haV2VVU296ZHR0WEU2VjVqZnFRT3hOeUFzNHZNUHdCcnVyb1B4WlZH?=
 =?utf-8?B?dkFRUDNCb3krSnJFL3dHMk5DYkFhNFcwTlRiTU5GeWQ4OXU3N3BrUHNuU1VL?=
 =?utf-8?B?SlRXUXlPOFE0UEUyWmNMV1dOZzU2RXhseE0xWFV5ZXBhYmJwTkpOcnRXVWQw?=
 =?utf-8?B?TmZVU05XNitNTStmemIzL015RUNoQ09FaEk0d0ZtaFhzMDFWZk5kMGNzN3FV?=
 =?utf-8?B?TXhxNGc0WXRYMXFEbzZXU1hMd2JzYkdUSUNFVUhpT1NpTEliTHFmMmU5c3BX?=
 =?utf-8?B?RFRWQ0RaYUpTS2dXbFlkTmMyemxrK2QyY1BGQzJmaUxUK0pYT2gvY1pqWTJB?=
 =?utf-8?B?clkvMnZqdVgweXpoU2poYUFOMjFocWJTSmZCMW0vb2FSTkVET0MzbXVnOHhT?=
 =?utf-8?B?NkdQZC9ISDhjRkx0a292eko1TXRNSHk0ekVpd0tJK2t6K0lCQ1RjSnR2VE4z?=
 =?utf-8?B?NjROSFUyV1lCeHpSRlhvYmFYWjczS2tJa0Q3VUZ4Z0Myc0E0OTFjVXJRWnVw?=
 =?utf-8?B?U2h1TjVBbG5LWWp5RkVoOGNNMmtqR09rVi9BbnRYekt2eG1Ya3ZvcERZV3BI?=
 =?utf-8?B?bWQ1d3hLUzl4c3JYV1lUV2lSUFNjYUw2aUNjR0p3dmJMTmZ6V1hodndUSUhk?=
 =?utf-8?B?VG8yZzljb1RYcUJFalN0Q1N2YlEya0gyN0Vzdm9ZNS9weUhVK2xCMGE4cXNP?=
 =?utf-8?B?bEdIcWx5emdTai93SlZXZkJyblBXcWZhN0hkWlFjQUVBRXgrNlpYWVFEZDh6?=
 =?utf-8?B?cXNWMTJBcXJPNzdoNHZJV3FQZWlqWFpMck1JeWduc3BIdzBXM2RrMjUwalJv?=
 =?utf-8?B?bEM5YTJIU2RHR0oyMnZPZFdvaVgwZXlGMVNSbXlCcDY5aUFtQXVYbDJUOE9x?=
 =?utf-8?B?Sm1lODJQbjFkOTJQenliS3RsZ2t2cm5MQzFsV0RyKzBmWlE0WjlUSktFaE04?=
 =?utf-8?B?QVYrTEVXMHUzOUJiL05jeVp3b1pYS0syaTh0ZHh0dlZDUCtSTHFwMmJrWmVh?=
 =?utf-8?B?Q09qcTNHeWFRdlBlRGlMeUoybmx4ME1tOThFL2t0RS9uL2VMVmV2VkYxbE5N?=
 =?utf-8?B?d1o3N0tSYm94WDZvMjNwRytxS3dDMHQ4VTRUSHo3SERPWGR5OFRIS0NMMWhj?=
 =?utf-8?B?OEJ6REpXS2lXYW5hak8rTndsRG45L0VMTjVLMlF5Y3crU2QvUFk0d0NIV0pZ?=
 =?utf-8?B?ZXV0QW9Ubmk2OVQ3R0luZDdDNDZiNHROMFJiTER1Z3JtaDIySEdNYXhqMVVO?=
 =?utf-8?B?cnpYNmh0SWMrMjNYMDRKa0JWT3RiQ0s1a1hNcjR4d3pKMUduN0tVWUhUS1c3?=
 =?utf-8?Q?b7CL+u0A3orUAPGSkNzl018Au?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6744.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e23792-e060-4cd7-e9ee-08db5120d515
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2023 06:36:05.8839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nBpoEsU+sRCH+ufIemRqsjXOSUu4Ih3riw+7EPrWlKDYwrHdLvHhkl2Edrfn9pSBo+0gUD2aij5S3S2n3uxBfBvYBsSwDrrB7wGwhkORT6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5011
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=zhenzhong.duan@intel.com; helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IE1pY2hhZWwgUy4gVHNpcmtp
biA8bXN0QHJlZGhhdC5jb20+DQo+U2VudDogV2VkbmVzZGF5LCBNYXkgMTAsIDIwMjMgMjoyOSBQ
TQ0KPlRvOiBEdWFuLCBaaGVuemhvbmcgPHpoZW56aG9uZy5kdWFuQGludGVsLmNvbT4NCj5DYzog
cWVtdS1kZXZlbEBub25nbnUub3JnOyBwZXRlcnhAcmVkaGF0LmNvbTsgamFzb3dhbmdAcmVkaGF0
LmNvbTsNCj5wYm9uemluaUByZWRoYXQuY29tOyByaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3Jn
OyBlZHVhcmRvQGhhYmtvc3QubmV0Ow0KPm1hcmNlbC5hcGZlbGJhdW1AZ21haWwuY29tDQo+U3Vi
amVjdDogUmU6IFtQQVRDSF0gaW50ZWwtaW9tbXU6IFNldCBzdGF0dXMgYml0IGFmdGVyIG9wZXJh
dGlvbiBjb21wbGV0ZWQNCj4NCj5PbiBUaHUsIE1hciAwOSwgMjAyMyBhdCAwNToyMzoxOVBNICsw
ODAwLCBaaGVuemhvbmcgRHVhbiB3cm90ZToNCj4+IEFjY29yZGluZyB0byBTRE0gMTEuNC40LjIg
R2xvYmFsIFN0YXR1cyBSZWdpc3RlcjoNCj4+ICJUaGlzIGZpZWxkIGlzIGNsZWFyZWQgYnkgaGFy
ZHdhcmUgd2hlbiBzb2Z0d2FyZSBzZXRzIHRoZSBTUlRQIGZpZWxkDQo+PiBpbiB0aGUgR2xvYmFs
IENvbW1hbmQgcmVnaXN0ZXIuIFRoaXMgZmllbGQgaXMgc2V0IGJ5IGhhcmR3YXJlIHdoZW4NCj4+
IGhhcmR3YXJlIGNvbXBsZXRlcyB0aGUg4oCYU2V0IFJvb3QgVGFibGUgUG9pbnRlcuKAmSBvcGVy
YXRpb24gdXNpbmcgdGhlDQo+PiB2YWx1ZSBwcm92aWRlZCBpbiB0aGUgUm9vdCBUYWJsZSBBZGRy
ZXNzIHJlZ2lzdGVyIg0KPj4NCj4+IEZvbGxvdyBhYm92ZSBzcGVjIHRvIGNsZWFyIHRoZW4gc2V0
IFJUUFMgYWZ0ZXIgZmluaXNoIGFsbCB3b3JrcywgdGhpcw0KPj4gd2F5IGhlbHBzIGF2b2lkaW5n
IHBvdGVudGlhbCByYWNlIHdpdGggZ3Vlc3Qga2VybmVsLiBUaG91Z2ggbGludXgNCj4+IGtlcm5l
bCBpcyBzaW5nbGUgdGhyZWFkZWQgaW4gd3JpdGluZyBHQ01EX1JFRyBhbmQgY2hlY2tpbmcgR1NU
U19SRUcuDQo+Pg0KPj4gU2FtZSByZWFzaW9uIGZvciBHU1RTX1JFRy5URVMNCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBaaGVuemhvbmcgRHVhbiA8emhlbnpob25nLmR1YW5AaW50ZWwuY29tPg0KPg0K
Pg0KPlNvIEkgYW0gZHJvcHBpbmcgdGhpcz8NCg0KWWVzLCBwbGVhc2UuIEFzIFBldGVyIHBvaW50
IG91dCwgdGhlcmUgaXMgbm8gc3VjaCByYWNlIGFzIEJRTCBzZXJpYWxpemUgdGhhdC4NCg0KVGhh
bmtzDQpaaGVuemhvbmcNCg==

