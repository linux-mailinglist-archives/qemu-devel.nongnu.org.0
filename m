Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A5F65A796
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Dec 2022 23:54:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBkim-0006Fi-0B; Sat, 31 Dec 2022 17:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eddie.dong@intel.com>)
 id 1pBkik-0006FI-7V; Sat, 31 Dec 2022 17:52:54 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eddie.dong@intel.com>)
 id 1pBkii-0007hg-8v; Sat, 31 Dec 2022 17:52:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672527172; x=1704063172;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9RG0ZH89+p3jDB2mcint2hcoFOPkKbicSN2vjDmQvVE=;
 b=KjLTl/ZxWjVndwwIm/5DjPYENYhHeRl+iGzzT33d0YVQHCE/bH3jEdNk
 vQz+LrcyYED9OYEpykILE+TbMHJwW/0jHbPIZDK2C4keWICb9vkNf5tGY
 +b+jnCkrHtlfCGWRtqVQ4C2SwDVXSgHm2oGuYyk/w3ivVPYbLTrMDpWma
 +n1REXhmYtQdTau/tGTD2MCBAvLOhxQeH0twag/TQi1ypv6TZsbyV30+t
 QBZ+B2vTSf2ry3dQfRR8sHkv0yTHP4lyNzsAlx1xizwIrQwAyqEv6RqVr
 fq55wuwCUYu35NEIxDPMHRJw3QBoLSvvH8rKLXW1WxldpIkfy1LtFIUbW g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="309103181"
X-IronPort-AV: E=Sophos;i="5.96,291,1665471600"; d="scan'208";a="309103181"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2022 14:52:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="982949220"
X-IronPort-AV: E=Sophos;i="5.96,291,1665471600"; d="scan'208";a="982949220"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 31 Dec 2022 14:52:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 31 Dec 2022 14:52:45 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Sat, 31 Dec 2022 14:52:45 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Sat, 31 Dec 2022 14:52:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYr0+qhPOflBfSm2eQqE09giSNm93rEeAKBFgdIifLuqfvLkMjKk8p0YDRwUsSvr8BzYPwvnBxNS/ChEYgeuHyHXIlVfJo5sO0zBLF8Rq6a/8pd60Mlxx3/9bmf0JsLxnYBL99SH4QeACM90qzwwwTGVRfOrbKOS+x0IOL3MWMQZL44l2eeyFQp+d/f3U/Apmz40ORhWgQP/NG7xCiy987DNcMsvKNld6dQKFvuXlkcXZ7x4p7oCzvYAfQvTHs67sjIHdgLJFrYz3vsrCdNP7eHasB1p56xVPaPQGhVWFdXqC+MMpGyXRWbHy5OORbIBBXDTiAlcuHoXieXbus7wUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RG0ZH89+p3jDB2mcint2hcoFOPkKbicSN2vjDmQvVE=;
 b=OVWmTQQXqxoKe2H7PybKdqwdfcw54cocBMYUlrR712vtknN5VxsZJOnSVUHqpWQCWNzbOlYctiBfy8A7k+Gg0tZ3UaPrtvvcHvxqf530EYhTGJe8JjJdEaQETj/LSZWXFB9VHiVno5QTpRiLd9/JhT+XwUAc6RYGjv4FeV8uOrGJwTmJgzOxrrMNp5O/8Sfz+238Fm7UIpyUXbMztYIMwAg07Bcon5H/XePqEdAUVaolamg/MumlgBdZe51nZv9+hFecs0UCdBrL57naiYQ/8FxWSyeBw3uqGKE0ZBvPXXsGfimzx0xbZbDFOa0v58btQMfvU2FmLmWXqXHhFe5NPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL0PR11MB3042.namprd11.prod.outlook.com (2603:10b6:208:78::17)
 by MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.18; Sat, 31 Dec
 2022 22:52:38 +0000
Received: from BL0PR11MB3042.namprd11.prod.outlook.com
 ([fe80::f270:c97a:887a:384]) by BL0PR11MB3042.namprd11.prod.outlook.com
 ([fe80::f270:c97a:887a:384%7]) with mapi id 15.20.5944.016; Sat, 31 Dec 2022
 22:52:38 +0000
From: "Dong, Eddie" <eddie.dong@intel.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>, Beraldo
 Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, "Peter Delevoryas"
 <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>, Peter Delevoryas
 <pdel@meta.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Cleber Rosa
 <crosa@redhat.com>
Subject: RE: [PATCH v2 02/11] hw/watchdog/wdt_aspeed: Extend MMIO range to
 cover more registers
Thread-Topic: [PATCH v2 02/11] hw/watchdog/wdt_aspeed: Extend MMIO range to
 cover more registers
Thread-Index: AQHZHEMgGXHByEJA8kqiH05uAuW8jK6Im1Sg
Date: Sat, 31 Dec 2022 22:52:38 +0000
Message-ID: <BL0PR11MB30427F00C5A2058197E9B6488AF19@BL0PR11MB3042.namprd11.prod.outlook.com>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-3-philmd@linaro.org>
In-Reply-To: <20221230113504.37032-3-philmd@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR11MB3042:EE_|MW5PR11MB5764:EE_
x-ms-office365-filtering-correlation-id: d8d770c2-cb41-43bb-b982-08daeb81b71e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0pEu65ou/ae3lWTXJmQD0jsatNlGTS548JLVGYGsCHEypu0h18W8+TX0chvVy3g3ijTtxUJ6ymf7Q/zZEpBZMSYJsdF3CSPZ5lQ+s7MMVleX7OwwI7ErcLlWJwq4+VHrE0rC2bqnIPiIUqVuGk46DNllp+v+lSmn02JZy4vN97qmgXF0a4fxm702B2/RuPGShpmd+Vke1n0EnHQuNA8QjJ01BeXWD7IreQ5m7/GHSlKNb4TX9cpTL3Mv+tMVwNS0Z//m2+biaOYcI6BTxdJOHoWEHF57lmEPfVKlktli71aM9DLsj5CIPfp/WCXK4ea4m+TocohMicty6Q4bSbdD3jDg7T+8QD5acNxnKcib/RybeyiCXN1bx+RYRZeAsJ6xZZ2P9fU9/HkngQ0zYpMlyu9C4ufwnrp6VNI78ToIF9J7q+44y6QYUqZFpdjc/xqACxLBrlGx7O067LSRUeorUjQOTys9bN/BNJSlK2X3NEM64+V20WG/zvF7m60U7sCtk1ZVxh3t69g4YyCYhtt+EedFD6BLyAoc/q8TEDr4D5Equv5eAcorkQ4lj7k6fh9gx5oEJGfNY7VK5Xj/6MjhCLyy9XqHv8wiYEDn4MK91ZfE2474lVgdfibNt00XSLrEEockeC1lid1cpcKKg+Ev0svDSvBqlYsznjEqBRDZdUewR+PfClpCL64U/VNAQGP8izk17z+yPC+zN58zwW2DrBoH4E11wdv58aWfHZaFAZ8ZXrez+TyTQUlXobM+fBDjvk1zhVcVGHyuPYQIGf9FsA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3042.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(39860400002)(376002)(346002)(396003)(451199015)(83380400001)(8936002)(86362001)(55016003)(33656002)(38070700005)(38100700002)(122000001)(82960400001)(52536014)(316002)(54906003)(110136005)(2906002)(66946007)(5660300002)(7416002)(66446008)(66476007)(4326008)(66556008)(8676002)(64756008)(76116006)(6506007)(26005)(186003)(41300700001)(9686003)(7696005)(71200400001)(966005)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TEtITCtMZlJTYk9uOFNqbHJRY2RPQ2lFRFVGUTZLU1ZwdmxSL3JTanpUNzNy?=
 =?utf-8?B?NnJQNHFvYTNmVHZlYS9WSnBaa3RET1RJd1dSd0lITjBNWTJ3czh0b3NMTnZW?=
 =?utf-8?B?ZkU2K0syZFYrS0JUYlpLZTg1bVRNRWpROFlWYWx6aXpMZ1NaK0crRmVQVkJH?=
 =?utf-8?B?OTUwVXNhbVh3RzNvRmZiczUyYVF1bWxGVFZVNDVYNFRkRW56OFE2bHRIemdu?=
 =?utf-8?B?dlg5UW03WFg1U3NQWE9IaXlsRU9yZFRsWU5wbll3YzZhYnVKQnJRNXNYSkEw?=
 =?utf-8?B?RGZVUjhzbHJaWUlmU2QwSnlsRmt0UXRFK0tEbXdMekZsQU1QOXhPTWQrVWxZ?=
 =?utf-8?B?MXNhcWJQaU5nbGhTREZSN3Ivdjc2b2VFaEZ1WEVtUU10WHNVS1l1UFNvY1ZD?=
 =?utf-8?B?YVdWb0RsaXkxUWVvV3M1eXlzbFlMelZZWmFUT1dqR2dPdTMxWGlPbWtzZGJC?=
 =?utf-8?B?Q3htU2p3VmRUTDJTWXBuNXJFRGhmKzg1T21qcXR3d2tISm54bEE4SEQ2dEM3?=
 =?utf-8?B?TVBUWWJuNGMvS3ZrRHltbmhrUzl6VW9aSm0zdThSbWwxVG1zek9wWkhsYnds?=
 =?utf-8?B?WVhmaktlVGZDZXFpMFljOHUxM2JyM2FwUjFjUmk0Y1R3SWVDKy9zL1k1UFpw?=
 =?utf-8?B?Zmx3SWpYTzF0dFVMbkcvT1VVNjg5QjhwWG4xNy9XcjFhaW9pK1ZoM3k3dmta?=
 =?utf-8?B?RWZrLzQ2bHZQWW9zNnJmaDBYb0FqeXd4Q1hqWENNTWtBYTR6bk1ib1Q4RnZX?=
 =?utf-8?B?dkhPRk9OUDZHcHdSWEtXalR6SEZseFpPNU1Qc0w2VWl5a3JRSnBZY0FPODJz?=
 =?utf-8?B?NGlIQU9XdmxuRzNaaVM2eFEzalZFbWpDTGVqWjB2dkxzYnRPdDZFQk50UjJI?=
 =?utf-8?B?L2hpQnVXWUZ3NjVoaXZHOXBPdFNHWEJKMXIwa0E4aDBOVm9OMHh5TmxQRkNn?=
 =?utf-8?B?UWhJRjZrUHZNOHl3RFZPOWxBMFFyblNpRkhVRXloazBxRHpSZS82dEovdVR5?=
 =?utf-8?B?VS9mR3BLeFlSKy9NZFUyd2hBTTVydEI2Y0xOMzMzeHJtaE43U3R1eXM5eWdV?=
 =?utf-8?B?ZTFHK0lRQTU2eDlWRDBqc0VZM0g4eFB5dXJhRUM3WHIyaTJlZmx0eExvRXJr?=
 =?utf-8?B?TEo3eWl0cm5MUGtqWDB6WHUwMFhqS3BXZG5QQmUrZmZ3SE1Xd0E3S3pMc0pV?=
 =?utf-8?B?a0t6Kzl4VVVCL0EybXpHZlBPbzBoWW1Da05sZGZJamIxMHBMRGEwb2tVMkJD?=
 =?utf-8?B?dWxtRlRNdUNjbUtEVDRJY3B3YklFNy9hQWV1NUdtR3d0aWZRL1hkME5UOUJ1?=
 =?utf-8?B?a0Jkam5xUlZlcWQvaWgvL0hpK3pwQnVNclFsVEVEVUZmeDlDZkJkZGRSaFha?=
 =?utf-8?B?ZVQ4VVVPWVNmOFMwMDlmQTVzL3VDbm4reURhc2RwQWI0QlUxbTdaaWZQcDl1?=
 =?utf-8?B?OE1PMGtFN0p0bVJzQUFkb05qNEwvUWcwR0NzWWFoYnZoKy90ajNHb0V2TjRK?=
 =?utf-8?B?bitwRHNzUVdqTGhhZWdLZSt6andaejJ0cU5ob3VJS3B5NTVzUG9McER5ZXU5?=
 =?utf-8?B?V2NGNTRCWW04cnNxYWh4WklBa2tSYTJldVhwVWNmM3U3NmFWQ01NUGhjYjIv?=
 =?utf-8?B?ZGo4K3JNSldkWlF0QkxGOFAwQ2FBdkQyNDIvQ3Z0eEpQUUQxWDVISEN4L3ZQ?=
 =?utf-8?B?cE85ZnN2V2N6a0kxa01TQXdMVWwrUUgyRGpuWExOc25uUU1tbmpTblVtMDhr?=
 =?utf-8?B?cmYwTkZDNnpwSk9WZTQxOVhucWFxaDNMSGVXcTlmdXhGNzhSeUVQdDMydndZ?=
 =?utf-8?B?d1VSeWJ1aXU0MGIrTWMxT0VYNXBGaERMMW9JaENPOFlxcFNPRVlDZXltSHFr?=
 =?utf-8?B?TUxvWWZVT3JtNGJLbGczcU5yZSsySnBvU0RIbzBtcmJrRGI2TUZVWjI1L2FV?=
 =?utf-8?B?bE1EVkZKNE14aTJCbUZyanltYi9Gc3dYUkc2TWljRE93dVp2V05DcWRBSzBB?=
 =?utf-8?B?OG9RR1NNYnpubkkrM2JYZE5zYlJmd1pueGZtWCtZMG9zZFNVcCtlemxEMzll?=
 =?utf-8?B?VkMza3VqenlCSlhlcVIyMVdoR3VaWFloVGNuK0FoK2UxNlY1Rm1CTWNlQjJ3?=
 =?utf-8?Q?Xhkcy4rMbiPgHqN9gxlC8Hn09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3042.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d770c2-cb41-43bb-b982-08daeb81b71e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2022 22:52:38.1274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /jX6B3d44Dz/zfgYn07vuh5R3IP964/atLpWy5ZSHj9cdIx1aCTM9zbtpFbIZ2a4FGYNN+RTSopYrv8STuTnag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5764
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20; envelope-from=eddie.dong@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

PiBXaGVuIGJvb3RpbmcgdGhlIFplcGh5ciBkZW1vIGluIFsxXSB3ZSBnZXQ6DQo+IA0KPiAgIGFz
cGVlZC5pbzogdW5pbXBsZW1lbnRlZCBkZXZpY2Ugd3JpdGUgKHNpemUgNCwgb2Zmc2V0IDB4MTg1
MTI4LCB2YWx1ZQ0KPiAweDAzMGYxZmYxKSA8LS0NCj4gICBhc3BlZWQuaW86IHVuaW1wbGVtZW50
ZWQgZGV2aWNlIHdyaXRlIChzaXplIDQsIG9mZnNldCAweDE4NTEyYywgdmFsdWUNCj4gMHgwM2Zm
ZmZmMSkNCj4gDQo+IFRoaXMgY29ycmVzcG9uZHMgdG8gdGhpcyBaZXBoeXIgY29kZSBbMl06DQo+
IA0KPiAgIHN0YXRpYyBpbnQgYXNwZWVkX3dkdF9pbml0KGNvbnN0IHN0cnVjdCBkZXZpY2UgKmRl
dikNCj4gICB7DQo+ICAgICBjb25zdCBzdHJ1Y3QgYXNwZWVkX3dkdF9jb25maWcgKmNvbmZpZyA9
IGRldi0+Y29uZmlnOw0KPiAgICAgc3RydWN0IGFzcGVlZF93ZHRfZGF0YSAqY29uc3QgZGF0YSA9
IGRldi0+ZGF0YTsNCj4gICAgIHVpbnQzMl90IHJlZ192YWw7DQo+IA0KPiAgICAgLyogZGlzYWJs
ZSBXRFQgYnkgZGVmYXVsdCAqLw0KPiAgICAgcmVnX3ZhbCA9IHN5c19yZWFkMzIoY29uZmlnLT5j
dHJsX2Jhc2UgKyBXRFRfQ1RSTF9SRUcpOw0KPiAgICAgcmVnX3ZhbCAmPSB+V0RUX0NUUkxfRU5B
QkxFOw0KPiAgICAgc3lzX3dyaXRlMzIocmVnX3ZhbCwgY29uZmlnLT5jdHJsX2Jhc2UgKyBXRFRf
Q1RSTF9SRUcpOw0KPiANCj4gICAgIHN5c193cml0ZTMyKGRhdGEtPnJzdF9tYXNrMSwNCj4gICAg
ICAgICAgICAgICAgIGNvbmZpZy0+Y3RybF9iYXNlICsgV0RUX1NXX1JFU0VUX01BU0sxX1JFRyk7
ICAgPC0tLS0tLQ0KPiAgICAgc3lzX3dyaXRlMzIoZGF0YS0+cnN0X21hc2syLA0KPiAgICAgICAg
ICAgICAgICAgY29uZmlnLT5jdHJsX2Jhc2UgKyBXRFRfU1dfUkVTRVRfTUFTSzJfUkVHKTsNCj4g
DQo+ICAgICByZXR1cm4gMDsNCj4gICB9DQo+IA0KPiBUaGUgcmVnaXN0ZXIgZGVmaW5pdGlvbnMg
YXJlIFszXToNCj4gDQo+ICAgI2RlZmluZSBXRFRfUkVMT0FEX1ZBTF9SRUcgICAgICAgICAgMHgw
MDA0DQo+ICAgI2RlZmluZSBXRFRfUkVTVEFSVF9SRUcgICAgICAgICAgICAgMHgwMDA4DQo+ICAg
I2RlZmluZSBXRFRfQ1RSTF9SRUcgICAgICAgICAgICAgICAgMHgwMDBDDQo+ICAgI2RlZmluZSBX
RFRfVElNRU9VVF9TVEFUVVNfUkVHICAgICAgMHgwMDEwDQo+ICAgI2RlZmluZSBXRFRfVElNRU9V
VF9TVEFUVVNfQ0xSX1JFRyAgMHgwMDE0DQo+ICAgI2RlZmluZSBXRFRfUkVTRVRfTUFTSzFfUkVH
ICAgICAgICAgMHgwMDFDDQo+ICAgI2RlZmluZSBXRFRfUkVTRVRfTUFTSzJfUkVHICAgICAgICAg
MHgwMDIwDQo+ICAgI2RlZmluZSBXRFRfU1dfUkVTRVRfTUFTSzFfUkVHICAgICAgMHgwMDI4ICAg
PC0tLS0tLQ0KPiAgICNkZWZpbmUgV0RUX1NXX1JFU0VUX01BU0syX1JFRyAgICAgIDB4MDAyQw0K
PiAgICNkZWZpbmUgV0RUX1NXX1JFU0VUX0NUUkxfUkVHICAgICAgIDB4MDAyNA0KPiANCj4gQ3Vy
cmVudGx5IFFFTVUgb25seSBjb3ZlciBhIE1NSU8gcmVnaW9uIG9mIHNpemUgMHgyMDoNCj4gDQo+
ICAgI2RlZmluZSBBU1BFRURfV0RUX1JFR1NfTUFYICAgICAgICAoMHgyMCAvIDQpDQo+IA0KPiBD
aGFuZ2UgdG8gbWFwIHRoZSB3aG9sZSAnaW9zaXplJyB3aGljaCBtaWdodCBiZSBiaWdnZXIsIGNv
dmVyaW5nIHRoZSBvdGhlcg0KDQpUaGUgcm9vdCBjYXVzZSBpcyB0aGF0IEFTUEVFRF9XRFRfUkVH
U19NQVggaXMgdG9vIHNtYWxsLCByaWdodD8NClByb2JhYmx5IHRoZSBRZW11IGlzIGVtdWxhdGlu
ZyBhbiBvbGQgdmVyc2lvbiBvZiB0aGUgaGFyZHdhcmUuDQoNCkdpdmVuIHRoZSBtZWFuaW5nIG9m
IEFTUEVFRF9XRFRfUkVHU19NQVgsIGl0IHNob3VsZCBiZSBsYXJnZXIgdGhhbiBpb3NpemUsIG5v
dD8NClByb2JhYmx5IEFTUEVFRF9XRFRfUkVHU19NQVggc2hvdWxkIGJlIHBlciBkZXZpY2UgdHlw
ZSAoYXNwZWVkXzI0MDAvMjUwMCksDQp3aGlsZSBpb3NpemUgaXMgZm9yIGFsbCBkZXZpY2VzLCBh
bmQgaXRzIGluaXRpYWwgdmFsdWUgY29tZXMgZnJvbSB0aGUgcGVyIGRldmljZSB0eXBlIFJFR1Nf
TUFYLg0KDQo+IHJlZ2lzdGVycy4gVGhlIE1lbW9yeVJlZ2lvbk9wcyByZWFkL3dyaXRlIGhhbmRs
ZXJzIHdpbGwgcmVwb3J0IHRoZSBhY2Nlc3Nlcw0KPiBhcyBvdXQtb2YtYm91bmRzIGd1ZXN0LWVy
cm9ycywgYnV0IHRoZSBuZXh0IGNvbW1pdCB3aWxsIHJlcG9ydCB0aGVtIGFzDQo+IHVuaW1wbGVt
ZW50ZWQuDQo+IA0KPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL0FzcGVlZFRlY2gtQk1DL3plcGh5
ci9yZWxlYXNlcy90YWcvdjAwLjAxLjA3DQo+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vQXNwZWVk
VGVjaC1CTUMvemVwaHlyL2NvbW1pdC8yZTk5ZjEwYWMyN2INCj4gWzNdIGh0dHBzOi8vZ2l0aHVi
LmNvbS9Bc3BlZWRUZWNoLQ0KPiBCTUMvemVwaHlyL2Jsb2IvdjAwLjAxLjA4L2RyaXZlcnMvd2F0
Y2hkb2cvd2R0X2FzcGVlZC5jI0wzMQ0KPiANCj4gUmV2aWV3ZWQtYnk6IFBldGVyIERlbGV2b3J5
YXMgPHBldGVyQHBqZC5kZXY+DQo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1
ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICBody93YXRjaGRvZy93ZHRfYXNwZWVk
LmMgfCAzICsrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2h3L3dhdGNoZG9nL3dkdF9hc3BlZWQuYyBiL2h3L3dh
dGNoZG9nL3dkdF9hc3BlZWQuYyBpbmRleA0KPiA5NTg3MjVhMWI1Li5lZWZjYTMxYWU0IDEwMDY0
NA0KPiAtLS0gYS9ody93YXRjaGRvZy93ZHRfYXNwZWVkLmMNCj4gKysrIGIvaHcvd2F0Y2hkb2cv
d2R0X2FzcGVlZC5jDQo+IEBAIC0yNjAsNiArMjYwLDcgQEAgc3RhdGljIHZvaWQgYXNwZWVkX3dk
dF9yZWFsaXplKERldmljZVN0YXRlICpkZXYsDQo+IEVycm9yICoqZXJycCkgIHsNCj4gICAgICBT
eXNCdXNEZXZpY2UgKnNiZCA9IFNZU19CVVNfREVWSUNFKGRldik7DQo+ICAgICAgQXNwZWVkV0RU
U3RhdGUgKnMgPSBBU1BFRURfV0RUKGRldik7DQo+ICsgICAgQXNwZWVkV0RUQ2xhc3MgKmF3YyA9
IEFTUEVFRF9XRFRfR0VUX0NMQVNTKGRldik7DQo+IA0KPiAgICAgIGFzc2VydChzLT5zY3UpOw0K
PiANCj4gQEAgLTI3MSw3ICsyNzIsNyBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfd2R0X3JlYWxpemUo
RGV2aWNlU3RhdGUgKmRldiwNCj4gRXJyb3IgKiplcnJwKQ0KPiAgICAgIHMtPnBjbGtfZnJlcSA9
IFBDTEtfSFo7DQo+IA0KPiAgICAgIG1lbW9yeV9yZWdpb25faW5pdF9pbygmcy0+aW9tZW0sIE9C
SkVDVChzKSwgJmFzcGVlZF93ZHRfb3BzLCBzLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICBUWVBFX0FTUEVFRF9XRFQsIEFTUEVFRF9XRFRfUkVHU19NQVggKiA0KTsNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgVFlQRV9BU1BFRURfV0RULCBhd2MtPmlvc2l6ZSk7DQo+ICAgICAg
c3lzYnVzX2luaXRfbW1pbyhzYmQsICZzLT5pb21lbSk7DQo+ICB9DQo+IA0KPiAtLQ0KPiAyLjM4
LjENCj4gDQoNCg==

