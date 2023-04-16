Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B6C6E3B4D
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Apr 2023 20:46:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1po7MQ-0004XR-7D; Sun, 16 Apr 2023 14:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1po7MN-0004X2-E2; Sun, 16 Apr 2023 14:44:23 -0400
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1po7MK-0005re-8p; Sun, 16 Apr 2023 14:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681670660; x=1713206660;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7Ni/v/zLxR++eI+J8XrVUQb7oYXrRuiPFEDr93+52K4=;
 b=dUSBRcsTswrIMS1e1YaI8poMTJqvq/JcBn3vr7zCsd4pwnDJmJ2rD6Rd
 nxy3ciGAjbBMbzRd78akuvuJO5eoNfP7+Km/2TO5N0xl5SzKRD9Bd4P+O
 S/v+F1BtLMqn1hSOkjpvB6tjV6jkLkamp4rHzFTE892fUaICePCj9LZ8F
 xOBWtIaCXgT6Z3NKZPOW3g3YwopieN6PUjU5tSEL67rkCeBbphABPtAGM
 9Y55AZWP5JtUj3marnMbhJYpA5EkpKx/Qm6inhUkZrbGo/UaONP7NKHyk
 OgC4/hXCZh14Q/Rqbd2pkWwNh4xQKGOXutY218CvSh6h8I5OmFFK2QgyG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="346599377"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; d="scan'208";a="346599377"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2023 11:44:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="720889038"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; d="scan'208";a="720889038"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 16 Apr 2023 11:44:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 16 Apr 2023 11:44:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 16 Apr 2023 11:44:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 16 Apr 2023 11:44:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DyDtulvVnewA4mZVZDrAU/wFCMFTNp9tXoc7vwLPv+UGDfnW3P9RS6VDexilj8u0I+I5Xf7tFKPQ2Ezso9Q3/gJcIcjANGVA9wuYw6TlSZibmZ3IwofJdOPeHNJXHp1ftct3IKKgmXRLn0tR+3rowKKIV3by+omdya5CrZGCTUWmOChyNLGDGoQLb3V87RbpkSj8kZ8VLMya3i/7DcCH9NUqh4n58RQnXUMlDG6bBnIcwh33u83CXeVU98jrWJ+l9HiInUMyVT50TvCK2PZmgYi6vEfodojKekhqi/RTsav6+0MKkmoG5kquz/OEAf+d+9x4jON8G5FlIA8vsQc1jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ni/v/zLxR++eI+J8XrVUQb7oYXrRuiPFEDr93+52K4=;
 b=Fz27pA+ai4Z1W/JedC8m0SU0qtMJ7ob3CoOOYyenXRWYXwqYxutV6XdOAPv2VJSJLYOpNM1e4sPfUXSc/Qud5bYTlRv4Js8YmR3VbQ/Hiv0hNMDyeqsuOXf4kuMWUdHMIaY/a1tT6iUKSVPfGuogLlYkmQgscB14LuDXBE5UBjOLsRroimUpLFbQERNLYWXP9X5yIwKOQVQIZ8KkDTwOko4SiedecMC5OI9zgSz0mqKu/iLlfhdT5f0Xf1TTG0B7FmeFs1IX5+xG+VicZScRAOAm8xMjoT8R1QMMReXfHRCpKf4TCi0C+ICt14T5ShopDfcO2/g3rWagl+bqXcHYDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Sun, 16 Apr
 2023 18:44:08 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e%4]) with mapi id 15.20.6298.045; Sun, 16 Apr 2023
 18:44:07 +0000
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
Thread-Index: AQHZbIUrWGe87sFjyEi3Ix51+Xqenq8o85bwgABQVgCAAMEdYIAAjwkAgAOwn/A=
Date: Sun, 16 Apr 2023 18:44:06 +0000
Message-ID: <MWHPR11MB0031431DF411113A4B6D6AF99B9F9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230411145112.497785-1-vsementsov@yandex-team.ru>
 <MWHPR11MB003181F7E37662CE2F22C17F9B989@MWHPR11MB0031.namprd11.prod.outlook.com>
 <e7e7e3c6-c4f5-aa9c-c4ee-f3f28555b81b@yandex-team.ru>
 <MWHPR11MB0031A6CAE72D321F342205F09B999@MWHPR11MB0031.namprd11.prod.outlook.com>
 <7f743d75-5474-6c87-439f-5513675fae1f@yandex-team.ru>
In-Reply-To: <7f743d75-5474-6c87-439f-5513675fae1f@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|SN7PR11MB8264:EE_
x-ms-office365-filtering-correlation-id: 623e0eae-7382-46f1-4132-08db3eaa8ee4
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aihL4mF+4HDLEJrag/GU9k0LDMqPxq2pMgjETIfOHUP4foBKBFeasprZUqLqAfk1hNJyji/A56HpeSOm7a9E8bod12uySwY2TsFHAkASzo2qqdtGOuTkh3FnM3Y4X1YyB+bP6jS25q6qzGh0JfC2KsJm+G/53pNPb8wElGfDNlrLXzWvPRWAv49DrCyUm7PkyvflOoCpCihLcgD8aLMkQmvsWJxSowip3jV2He+QYQNuPD7x7szqjG0nsypwCYfqTlY+NDMeOx88abSD7ZkpDXlbbbY8wFjgSkvhq70NfHrOEYmfey948Qb6i2rd/BiXgB57Ez8Lb552GnY6WbWxpP7FL6o7J3ixty8WdBdm64ewbSGcsMSBdFC6axCT6w+1jjhxP4K1Flu2ZiIz/0ovQESn5tRrzMjkgOAyQumZWCVCSCfCaUbfMHPYbtVhLuIS0KtyVRxCQJbp5BJ9Xp/jkNnLb3fqp2qVyE1KTfDOB6FixW8TBKC4OAxXNcmtM+ME91dZj1k3ZQxN9zQrUsRaLslSCCEjeEEtJqP8cvf6HbQ8A77xEjaUsZo2u7hSonC/6LhZOVozqOwGn171EPXqlBUIZkFH8v8wp8anQFCebj5dKMmrSgmmKhz+YErg3+1c
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(136003)(376002)(39860400002)(366004)(451199021)(33656002)(54906003)(110136005)(4326008)(316002)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(478600001)(7696005)(71200400001)(55016003)(8936002)(8676002)(5660300002)(41300700001)(52536014)(2906002)(7416002)(38070700005)(86362001)(122000001)(82960400001)(38100700002)(6506007)(26005)(9686003)(186003)(53546011)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YThLN2hwanVGeHJONUZpYjVHQnVYdUhLRytsSnlDQ05qbnJlMy9BZm4vRjFT?=
 =?utf-8?B?MVRqSVFQMGozRmlrdmFWcHU1VTRDWm9XanVoNWZYcy9EZGV5ZVREL3NNN3Fq?=
 =?utf-8?B?dmJIVnR4bytrMm9hVEt1ZWNWRzBBOSs4bkFBNkpUYXJxc09Nb1BydXYrYlFo?=
 =?utf-8?B?bktQVW1VUTlEeEgrTXAwSE04WE5SUmE3VHFFbG5ja0tYVXpHZ2tUdndlVmFo?=
 =?utf-8?B?SjllWnBIWHNKeWk0K3FOUHRBdW9MUThXaGZJYWdqRzdEUndtcm1naEdKQ21a?=
 =?utf-8?B?ajhBaGw5b2NrRW96VjNuQXM0c0VUdjJMZTVsclZaUzZDL25OcjhzVG8xYmdU?=
 =?utf-8?B?d3I0RHg2K2h4YUFwOUk5OE9YMWplOHBoQnFRSzdISnhLN09QZmdhTFVRSUpY?=
 =?utf-8?B?a1hDOTBURDlTTXU3SjI1c3NiMmloRm1VYXFnUG5ockpTOU5zT3BZQnJ4UmpI?=
 =?utf-8?B?aSs1YmRlVEtaN2luZmhPYXZvSlRJZkoxcmZJc0hEYWdmMDRHZjBSYkFJd2Jh?=
 =?utf-8?B?MlF6czZKTnlHTCtFUi9iZk95MTYyMzVGYzRjZDR4c2xMbUplaGE1YUpLYiti?=
 =?utf-8?B?clNhN0dXNGErUUNJSnQzTElZUjRhWW5xQUlRc0FwRzZ5VHk1VGdQTlc4MS81?=
 =?utf-8?B?VC9sWkRzSGlvSy83c0QrQWEyTlJ4ZHRFOVhCaHc5U2pmZ3BaSisxY3hiVk1j?=
 =?utf-8?B?YUNacHpMZEpiSTcvbGVYdnkreXlPQm5oajVwVlJEU0R6RU40bmk2WkE0NW1M?=
 =?utf-8?B?eFhmcUVtL0FwK0xralp1aW90MCtHMmQyck11d3FKWG4wNlN5eTUvTERRbll2?=
 =?utf-8?B?YXR1TlZiM1pTZllnblhEOUdjVGNyVkxBeEJIRVlMY0V3WDQyRGhBaUp2RHlS?=
 =?utf-8?B?T1A2SFVnYlZYeTA5RWh1Ry92UlBuOHdIUHVyeFM5WENnTmdNSHVGaFhHZCtn?=
 =?utf-8?B?WnJBU211TU51V1k4WllCeDV0S3kxODc5bnYxL2VwZGU1WWY4Wk51NklXZmEw?=
 =?utf-8?B?OFNzZCtDMDU1TExOS0N1WndXNFRvbTNab3hBZERvRFBhK2lGbFA1dFNlellH?=
 =?utf-8?B?aTViaFlpODh0SjlPcW54SW5KUXZyMEVFZjhqSXU4SjVOL3dSbUlTdVBYYnZJ?=
 =?utf-8?B?UWwvZklxNlhEVkExaGcwN2R6ZGRuT3FGcnBjTnhIZUpYUXdTTHJVbEVVRWJS?=
 =?utf-8?B?UVBKbVJUdTAxcEpxN3hCc2ZEU1dnRVlHUEU3Ykc3RmxLcGV5ZGpsYzdsTC9M?=
 =?utf-8?B?TENScmphVVVYQ2RUZ2crZ3RUbXZKSS8xUDFiRDBZUTgrY21uMXRvbXh3ZVN2?=
 =?utf-8?B?MDBBUHJhSWZ3cDc0Wi83QjNOZUM5WHFyeVpSYlBqenEzcDdneXRmV2QxMC8x?=
 =?utf-8?B?dzFaU3FGZlVSempQVkhMU2xZR0Naa0pXQllhTDJkUVR6RHVTVytGMXNzeWxG?=
 =?utf-8?B?TDREY2FhQ0FRT0Y5V0ROWUY5eTBvZTgwZGF4ZGpySkdaRmE2V0FiWFVhQ0tI?=
 =?utf-8?B?VVpvdFlIV1FHNU15OU52eWJDYkFMMW1BSmtDTlJCU1B6c3Q1RHhBT09WT1p0?=
 =?utf-8?B?RHI5aisyMy9nVzd3K2d1SmM5VnpPSjJ0WmYwa3dDZW9RU1AwaUFCeFZIQW9I?=
 =?utf-8?B?M0JQSzR6SVoxRDg4V3RHQnJ2cWdHQkx2NzVQcTVUSDVoY3NFbHRQdHRTYnhy?=
 =?utf-8?B?cStkOXFtQXpaTGlYVnQ3enpnRENRcm92ankyenQxV1FoaUo5SDJwRVM0NXZE?=
 =?utf-8?B?R296QzU0Y2RYeldXRElSc3A2bWRSSjArNDU2QUhvd0FSSzZvU255NDdtREla?=
 =?utf-8?B?OVF5ektuU01lRUcyNmJ4T0Y3bHRQNTVReWszS2hGZXVyajJ5Zzcvajl5dERx?=
 =?utf-8?B?QUtONWI2TFd1RE5WMm1pRXlrNUQ0dkVBRzltS2hMMTdNd1NGcFRMNWhjZlFF?=
 =?utf-8?B?ZjdZV2xINXpjdDVZTVVXMEgyb0FmOURLVW9hL2Q2eTFuNHpDN3pKRzc3Ynpw?=
 =?utf-8?B?aUlYT25IamFxc3A2eDE4UkpubmM4ZWpYa0ZiRjdkbENNVnd1c2R5SHlxaGZY?=
 =?utf-8?B?cFpPcHNNRENtamFzQVB6NEplS0xzZ1hVR2NxbFVjVVF0d0Z2c3ZxK1BaU0lE?=
 =?utf-8?Q?iVlBGc9Oief05oFcXFtGphlfW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623e0eae-7382-46f1-4132-08db3eaa8ee4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2023 18:44:06.5333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KlS9/zhfS56bx6vgPtF9sCDRlrDnM3c2O4eMHyDywapxCYg/bZ0YLzHT5GjVfqmDNBTryyOhbYyWw3vH8ANaKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8264
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24; envelope-from=chen.zhang@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB5YW5kZXgtdGVhbS5ydT4NCj4gU2VudDogRnJpZGF5
LCBBcHJpbCAxNCwgMjAyMyA1OjUxIFBNDQo+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0Bp
bnRlbC5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IHFlbXUtYmxvY2tAbm9uZ251
Lm9yZzsgcGJvbnppbmlAcmVkaGF0LmNvbTsgYXJtYnJ1QHJlZGhhdC5jb207DQo+IGVibGFrZUBy
ZWRoYXQuY29tOyBqYXNvd2FuZ0ByZWRoYXQuY29tOyBkZ2lsYmVydEByZWRoYXQuY29tOw0KPiBx
dWludGVsYUByZWRoYXQuY29tOyBocmVpdHpAcmVkaGF0LmNvbTsga3dvbGZAcmVkaGF0LmNvbTsg
WmhhbmcsDQo+IEhhaWxpYW5nIDx6aGFuZ2hhaWxpYW5nQHhmdXNpb24uY29tPjsgbGl6aGlqaWFu
QGZ1aml0c3UuY29tOw0KPiB3ZW5jb25neWFuZzJAaHVhd2VpLmNvbTsgeGllY2hhbmdsb25nLmRA
Z21haWwuY29tOyBkZW4tDQo+IHBsb3RuaWtvdkB5YW5kZXgtdGVhbS5ydQ0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIXSByZXBsaWNhdGlvbjogY29tcGlsZSBvdXQgc29tZSBzdGFmZiB3aGVuIHJlcGxp
Y2F0aW9uIGlzDQo+IG5vdCBjb25maWd1cmVkDQo+IA0KPiBPbiAxNC4wNC4yMyAwNDoyNCwgWmhh
bmcsIENoZW4gd3JvdGU6DQo+ID4+IFNvLCBpZiBJIHdhbnQgdG8gaGF2ZSBhbiBvcHRpb24gdG8g
ZGlzYWJsZSBhbGwgQ09MTyBtb2R1bGVzLCBkbyB5b3UNCj4gPj4gbWVhbiBpdCBzaG91bGQgYmUg
YWRkaXRpb25hbCAtLWRpc2FibGUtY29sbyBvcHRpb24/IE9yIGJldHRlciBrZWVwDQo+ID4+IG9u
ZSBvcHRpb24gLS0gZGlzYWJsZS1yZXBsaWNhdGlvbiAoYW5kLCBtYXliZSBqdXN0IHJlbmFtZSB0
byB0byAtLWRpc2FibGUtDQo+IGNvbG8pPw0KPiA+IEkgdGhpbmsga2VlcCB0aGUgb3B0aW9uIC0t
ZGlzYWJsZS1yZXBsaWNhdGlvbiBpcyBlbm91Z2guDQo+ID4gR2VuZXJhbGx5IHNwZWFraW5nLCB0
aGVzZSB0aHJlZSBtb2R1bGVzIGRvIG5vdCBiZWxvbmcgdG8gQ09MTywgSXQgaGFzDQo+IGJlZW4g
ZGVjb3VwbGVkIGF0IHRoZSB0aW1lIG9mIGRlc2lnbi4NCj4gPiBJbnN0ZWFkLCBDT0xPIGlzIGZv
cm1lZCB3aGVuIHRoZXNlIHRocmVlIG1vZHVsZXMgYXJlIHVzZWQgaW4NCj4gY29tYmluYXRpb24u
DQo+IA0KPiBCdXQgaXQncyBub3QgZW5vdWdoIHRvIG1lLCBJIHdhbnQgdG8gaGF2ZSBhIHBvc3Np
YmlsaXR5IHRvIG5vdCBidWlsZCB0aGUNCj4gc3Vic3lzdGVtIEkgZG9uJ3QgbmVlZC4NCg0KQXMg
SSBzYWlkLCBDT0xPIG5vdCBhIHNwZWNpZmljIHN1YnN5c3RlbSwgSXQgaXMgYSB1c2FnZSBvZiB0
aHJlZSBnZW5lcmFsIHN1YnN5c3RlbXMuDQpMZXQncyBiYWNrIHRvIHRoaXMgcGF0Y2gsIGl0IHRy
eSB0byBub3QgYnVpbGQgYmxvY2sgcmVwbGljYXRpb24gd2hlbiBub3QgY29uZmlndXJlZC4gSXQn
cyBPSy4NCkFsdGhvdWdoIENPTE8gbWF5IGJlIHRoZSBvbmx5IHVzZXIgb2YgcmVwbGljYXRpb24s
ICBidXQgY2FuJ3QgYXNzdW1lIGFsbCB0aGUgQ09MTyB1c2VkIHN1YnN5c3RlbQ0Kbm90IG5lZWRl
ZCwgZXZlbiBoYXZlIGEgLS1kaXNhYmxlLWNvbG8uIEZvciBleGFtcGxlIGluIHRoaXMgcGF0Y2gg
ZGlzYWJsZWQgdGhlIG5ldC9maWx0ZXItbWlycm9yL3JlZGlyZWN0b3IuLi4uDQpRZW11IG5ldHdv
cmsgZmlsdGVyIGlzIGEgZ2VuZXJhbCBmcmFtZXdvcmsgd2l0aCBtYW55IHN1Ym1vZHVsZXM6IGZp
bHRlci1idWZmZXIvcmVwbGF5L21pcnJvci9yZXdyaXRlci4uLi4uDQpMb2dpY2FsbHkgc3BlYWtp
bmcsIEl0IGlzIGNvbXBsZXRlbHkgaXJyZWxldmFudCB3aXRoIENPTE8uDQoNClRoYW5rcw0KQ2hl
bg0KDQoNCj4gDQo+IC0tDQo+IEJlc3QgcmVnYXJkcywNCj4gVmxhZGltaXINCg0K

