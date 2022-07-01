Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEE6562B61
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 08:18:38 +0200 (CEST)
Received: from localhost ([::1]:38548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o79zA-0007uR-IR
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 02:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o79vc-0006x1-37
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 02:14:56 -0400
Received: from mga05.intel.com ([192.55.52.43]:34601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o79vX-0003Og-Gb
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 02:14:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656656091; x=1688192091;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CPXe28V9Yl0zOUmDgpsUgRC9IP+5TjErAteH7sEw0j8=;
 b=bA45zX6426QUfjOtGtW25pwHq7AZtnLC2jaC0BpqI/t+hwP6beLZjHEh
 TicIhdUZalDh/3mlcCEboUNwIWDbH100pwu4AESSA0zVpGnQ5s6zfl9X7
 HKoqz7PBs3o7Bq+SYtttsYgE3vrFgTRy+0F3oe5LK/TnVqTTPXUINni2x
 6KVPbmTm6Zc5eWCUjiU8BKpiC0Dr7cuMLyxKDEcixYwncfpcr46yvaE5i
 J++rdxGo/mIJggrmroo/IlMSKVCT5uPRdSFf1tANOet7mgttaZRThFMdZ
 QrVyQk2eTmSUKEJvMVVbESyM9CA6j9QiRctb6tbNi67ij/b78jMuClYUH Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="368880215"
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="368880215"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 23:14:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="648208085"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 30 Jun 2022 23:14:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 30 Jun 2022 23:14:34 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 30 Jun 2022 23:14:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 30 Jun 2022 23:14:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 30 Jun 2022 23:14:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+dE0Y9pW12Gz4qQjYmpAeE6hZIRlRDGoXrH9T9s6kF2ATVpz/k+LrCg0yFT+KWyjxhwoqHCQKUTtzvXA+gu/W199oL/GIRLQ1Bg5JKsq/dMqKQoOjBWEjyIU9/n2HloCdF7E+C2KKakEf+4yLIIpJsixm3GlgrJ7Bz2SkIzeNiD6i+lGRDdIcDXMP0L0kQmcaALxxcgucswiOZ4nrZHunVV4DUDHt40M+ZIVYZE7CE2HX35YgqRsFRLCP1SL0xFU6EIQdSLtZ06LyHdZmvNxRBloRnsLuSIubvq6/OJ/C0caiP6g0hyOayjaqDx6qTkq6JqFjJiKNgHv0EnPRBsOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPXe28V9Yl0zOUmDgpsUgRC9IP+5TjErAteH7sEw0j8=;
 b=NdZCNW5z5pSWllCzXz5VtSwmxe9H1ogx0JHnDyoAfzrGJN4YUXRe89Fepaiq3H6B0BwjMhY9sP04P9CUDTyTUY/Aht+BA0DN5uUZ1ora1f8OQIf7YjsHXQwtyov7DVDma8I/U21Q4AB8lQ8upLMMkLAGJxswGh6pNqdu+OY1PdOcYcaBkJ8Sq21IYCuwniQ2s4p6uBO45KCbKxw4p3JxX1xtVCNrl6J4qNt6wwlIOM2SX/ILEre1m5nZvVCg1mIBf42GsOBpIhbUB10JM3Gzbalqn2mpD2zNYISgu7Tn5Xc87gDZruEsLLxBaR+hMP4n6YIhlsOJ9DcDHFG6OIhTJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by SA2PR11MB5084.namprd11.prod.outlook.com (2603:10b6:806:116::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 06:14:32 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e1f5:a0f0:bccf:9c42]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e1f5:a0f0:bccf:9c42%7]) with mapi id 15.20.5373.022; Fri, 1 Jul 2022
 06:14:32 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Andrew Melnichenko <andrew@daynix.com>
CC: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>, "Paolo
 Bonzini" <pbonzini@redhat.com>, =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Eric Blake
 <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: RE: [RFC PATCH 00/12] Introduce QEMU userspace ebpf support
Thread-Topic: [RFC PATCH 00/12] Introduce QEMU userspace ebpf support
Thread-Index: AQHYgh8DOTjK4uQS5EmBF0IZm2Klsa1mRc4AgAD2LuA=
Date: Fri, 1 Jul 2022 06:14:32 +0000
Message-ID: <MWHPR11MB00312C9A373F41E073CDC98E9BBD9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
 <CABcq3pFZ_LZpWgpyLUOf2a=h0X4YunEH601oRN71Ui=YrO=4EQ@mail.gmail.com>
In-Reply-To: <CABcq3pFZ_LZpWgpyLUOf2a=h0X4YunEH601oRN71Ui=YrO=4EQ@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 6484cc64-6940-4233-6665-08da5b28f6dc
x-ms-traffictypediagnostic: SA2PR11MB5084:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0ee9tWuJKKPwxAE1/1sAL8JEJ5+kmBbSYTi7VlDK6MVI0mH0LzuG1epZuYmtA3RVF/oIbhAb9i90Fm6gwpfT67XvnOoNak6mm74RMXH0bVVVSmuWGvIKVsLqK5SuwwEDakdDGhtKmJX661P9QwD++oNeTmdc+PYnPXV9Rgrd5p0LLuiWaX17fnfMHsPDzQ+k25j+REmZjLCNqJQUcXdqimG1uArDg3JrL0+yuJuA/L2lsFHUPs5kS6nJxkUz2Ya+wEjOxOL/cll0x2Ia4/ybeaQ40y8uwelhms7bEg76R5m76XvM1D1w9xhbpLirFvOA0gsL3XVaKVLuJ8PDOaJn4Y0Y6mK8oiGu9/XwT/IGNdHWV9EKxzTHihA96qVY1aA7rj063QZPYue6AO48oAO6QDgn3pen1ZwiwEKBT2G6MbMY3tFDYOdc8Tfayj5bOwNi6kIdwrstuQfSqXji05QWw93r2+UJy3wEjfyztaZDi3i0SfwUn/wee4ggDTynPmWWphreorFZGGsEp4v58RiDNvVzN37orftj/21ff1cOcP/tqoXtmednTDGMU7cq71LCcgFtnuAvXAexh3PnH7xBzNSx5FH9dexs4jB+5JK5Rtfh1LpPzVZCYF6hxzkCNXW5y4Zr2PFQkM0ZeUFxOeSDZGZPykqOlWPssuikOY/DhGGlycdyLpeFVLha776GTnkFufdXDniGQfaCvPrd/KCm4TAA5g9NPGBaYuKbWzdVv0FrR/aCpPQYnS9RCim9mGqfWKzkIbRxUshK3FGXBzbF2qUghMQ1GQwXxPOcOv0CsaLsMXGk2lK5EVNcJhG4Ht/mYnJ9ZAy5NsLmgET3HmpavRPED5+biFFCmZHUQ4XotYewmYusV70S0+81eStLhDVP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(39860400002)(396003)(366004)(376002)(122000001)(41300700001)(7416002)(6916009)(76116006)(66946007)(66446008)(478600001)(2906002)(966005)(33656002)(38070700005)(316002)(86362001)(6506007)(71200400001)(54906003)(53546011)(186003)(83380400001)(5660300002)(26005)(9686003)(66556008)(8936002)(64756008)(4326008)(52536014)(7696005)(38100700002)(55016003)(82960400001)(8676002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHZFa04vUG9OTTFteFZSNzlGLzAyVDQ0dlE2MThVVm93SHA0UEY2eGNyMENO?=
 =?utf-8?B?Vm9WRHdOM1h3WWF1eGxxSnY1NWF6WjAvZ2gzcFh6cEtScXVOTzI1ZllER2hm?=
 =?utf-8?B?K0E4OVZTTURlMzNsMldyOWFYSzhBYVBEQVpuYm0xallFNk9EbGVMelQ1WmZK?=
 =?utf-8?B?ekZzTHJrODNPNW5NREVqK3AxU1A3TDF3cEJySUtxV0JRcTY0eEloamtWOGU0?=
 =?utf-8?B?Z1JRMTlrYTM5d3NNT0YwUFlaNmNZK1VaQzc2TUZ4VHVrRU5iZTNpLzhXUG1a?=
 =?utf-8?B?SFVpbnZZMHIvOFR4S0VGN1VaQ0RqRWlXa2JBd0Z2ajkyK0Y0K0tkMU0yZy9p?=
 =?utf-8?B?dlVwa3VndzZndkhZS25sMWJUV3Avd0hQOE9VYzh5TmYxUFZRaWJKL2VYTzZM?=
 =?utf-8?B?dnlRWUZUMFBnNjJ5b3R4R3NEK1piVEZnckRQUGp1bk5zM3dzMEJWVnpwd2FQ?=
 =?utf-8?B?d0h4MmFQS2VvZm5WYm5WU3pEeUNQbDlsc0c5QmJiUnJqTDM5SEJacWxPTXh3?=
 =?utf-8?B?UXM0YkxObHBJMkkyR0ZYTnk3cit5UXYzOUtqcmU2OExDczVzWGJmMDdMOElW?=
 =?utf-8?B?TW1mZ0c0VDltdU5Hb0pLaC9GcG9kdUg4bEw4TkhWVlpieG1GNS9NdHZadzkw?=
 =?utf-8?B?MHpXZHMzbnZmcjE3YmlDRTRQTkR2c2UwOGMrU1FNQ1pPckd4eWFJWkdMVGti?=
 =?utf-8?B?NU1kb2E5OXpXWE5VaElXS2RuZWVoMGRNcmtHdVRoRlNLMUdXYWhrcXJrTVBk?=
 =?utf-8?B?eWZPSEg5WjNSekNqelNzV0FvWVRUK1VmRHdGSmFpVXNkUUh5VndlWVp3NVFx?=
 =?utf-8?B?YTNBNEd2VGh1Y1JhbFRsSnJIZVNKbjlpL21FZnlTSXN3M3dLT1M2Nk9pNFBs?=
 =?utf-8?B?VlF5K2dPNHhDOHNOc1FLa2EzcDJULzl5L3NBMWJJRGErQk1qWWc4K2l3VVVE?=
 =?utf-8?B?M1hVRVdMNjVkOG41N0xZSXZHWUFRMVYwRFplZVRTWW5ld1pHbEdtUk43TVdD?=
 =?utf-8?B?aUlhMkFMMkh0UytxZ21rTmRWWGRTcUNMT2hMTWVacE0rbzA2OWpkWVJ5ZXlW?=
 =?utf-8?B?eW5LYXVsM2tCYjdGcUJGUDNRenRLSHptNDBWelNDS08vU1BLYk42R3l6bUo5?=
 =?utf-8?B?T3NLemlZc3JlR3lhbjBITEtWa2IzUWMyYUlhdXFKNDNDN3hkd0tHRXdDY2FJ?=
 =?utf-8?B?elVQMHNxaGdIb0VDK2ZqclRyamNqdjZSdGpkaWl5dzAxZmRmOFNZRnBiZ045?=
 =?utf-8?B?RjNBWGo0STRFVWVhNGZsSDEzV096Z2hzMTNtTHRCa3pnek40cmNlKy9LN2do?=
 =?utf-8?B?T2cxcHAyZVBTOW0rVkxJVmd0KzAyU0VWWjIvVllsQk5OYmJ5NmxrUC92ell5?=
 =?utf-8?B?T1pYSXM3a2FLWFZMK1hOZzlOeHBob2NOUlRZTWpRRUFqaFF1WFhwS25KM3FX?=
 =?utf-8?B?SXR6dUpNR200MTFjRUFtTzg2VW1TYUtoQm1aSjBUNlNUOHhGWXNCcmFuRTFK?=
 =?utf-8?B?dDI5SEZwekZFUW9Od25Wb0RBUUhPSWplMHErWmhta2pHV1NzVTZ1UzZDVXJZ?=
 =?utf-8?B?ME1HRVQyTmEzZm1tU3JKMzh2d1Y0K0xxeFBHc3FIV2JUUk50TS9DcFZCQWg1?=
 =?utf-8?B?c2d2QW5zbHViNkViQWxlc0xYUDhaN2JiakNNeWkvdS9FRUY2WHRFYnhJRDFI?=
 =?utf-8?B?blhmSFM4aENhL0RFVjhtMG9SV2l0bmJ3bVhSR2VnUmIrY0tISFViZkZjVnZr?=
 =?utf-8?B?ZGV0ZmV1eFY0eGNTWnU4QzZkbkdQb3lwS0tId0NUckIxZy84NlEwWEtWdUVx?=
 =?utf-8?B?WFl4bUVRNFlVNWF4ajB0Yll2WGJjOWpJZ2V1K1R1N2RxV2dlTk5neHQrVzY5?=
 =?utf-8?B?VnJhVFFwdE9kQ2lJRzhhaUx3UWlVc0w5UExkMGJhUVZIQVBxRnpjRStVenQ0?=
 =?utf-8?B?R2lmdVg5Zk84SFpRN0F4ZGlZVTRkbCswWVJzWGdUbUNzbXRySU12Q3lTUVNP?=
 =?utf-8?B?cFJMaUsyNWxvTm42Vko4MVphT2l5YlVhbnE0RklINVl1RWtkWHd6RHJJZ3l4?=
 =?utf-8?B?ZDF4V1l4UWJxZ2dDV0NOdklVZFdoTUQyMVFFSkxjR20zR2xwb3QwRmZ3N0Rz?=
 =?utf-8?Q?SO1o2Z6VhrevIZjSuM46Ywn5K?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6484cc64-6940-4233-6665-08da5b28f6dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 06:14:32.4492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MC0gRyGCbQSDDkdKsFadZUaLDDiqfNHgj1sCchrOQqdS5LqY7JiPMTETqlWl3OV9J7cTjk+wTXSD3laVU+jS7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5084
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IE1lbG5pY2hl
bmtvIDxhbmRyZXdAZGF5bml4LmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDI5LCAyMDIy
IDY6NDMgUE0NCj4gVG86IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4gQ2M6
IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+OyBxZW11LWRldiA8cWVtdS0NCj4gZGV2
ZWxAbm9uZ251Lm9yZz47IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+OyBEYW5p
ZWwgUC4NCj4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPjsgRWR1YXJkbyBIYWJrb3N0
DQo+IDxlZHVhcmRvQGhhYmtvc3QubmV0PjsgRXJpYyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+
OyBNYXJrdXMNCj4gQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+OyBQZXRlciBNYXlkZWxs
DQo+IDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+OyBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0
LmNvbT47IExhdXJlbnQNCj4gVml2aWVyIDxsdml2aWVyQHJlZGhhdC5jb20+OyBZdXJpIEJlbmRp
dG92aWNoDQo+IDx5dXJpLmJlbmRpdG92aWNoQGRheW5peC5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UkZDIFBBVENIIDAwLzEyXSBJbnRyb2R1Y2UgUUVNVSB1c2Vyc3BhY2UgZWJwZiBzdXBwb3J0DQo+
IA0KPiBIaSBhbGwsDQo+IE5pY2UgaWRlYS4NCj4gSXQgd291bGQgYmUgZ3JlYXQgaWYgZnV0dXJl
IHBhdGNoZXMgd291bGQgYWRkIHRoZSBCUEYgbWFwIHN1cHBvcnQoaWYgdUJQRg0KPiBhbGxvd3Mg
aXQpLg0KDQpUaGUgQlBGIG1hcCBzdXBwb3J0IGlzIHZlcnkgdXNlZnVsLiAgQnV0IGN1cnJlbnQg
dUJQRiBwcm9qZWN0IGRvbid0IHN1cHBvcnQgdGhpcyB5ZXQuDQpBY2NvcmRpbmcgdG8gdGhlIHBy
ZXZpb3VzIGRpc2N1c3Npb24gd2l0aCBUaG9tYXMgYW5kIERhbmllbCwgd2Ugc2hvdWxkIGF2b2lk
DQpJbnRyb2R1Y2UgbmV3IGdpdCBzdWJtb2R1bGUgZm9yIFFFTVUuIEFuZCByZWxhdGVkIGdlbmVy
YWwgZGlzY3Vzc2lvbjoNCldoeSB3ZSBzaG91bGQgYXZvaWQgbmV3IHN1Ym1vZHVsZXMgaWYgcG9z
c2libGU6DQpodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL3FlbXUtZGV2ZWxAbm9uZ251Lm9y
Zy9tc2c4OTczMzkuaHRtbA0KDQpJIHRoaW5rIGZvciB0aGUgZnV0dXJlIGRldmVsb3BtZW50LCB3
ZSBoYXZlIHRvIHN1Ym1pdCBwYXRjaCB0byB0aGUgdUJQRiBwcm9qZWN0Lg0KDQpUaGFua3MNCkNo
ZW4NCg0KPiANCj4gT24gRnJpLCBKdW4gMTcsIDIwMjIgYXQgMTA6NTEgQU0gWmhhbmcgQ2hlbiA8
Y2hlbi56aGFuZ0BpbnRlbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkgQWxsLA0KPiA+DQo+ID4g
ICAgIFRoZSBnb2FsIG9mIHRoaXMgc2VyaWVzIGlzIHRvIGJyaW5nIHRoZSBwb3dlciBvZiBlYnBm
IHRvIFFFTVUuDQo+ID4gSXQgbWFrZXMgUUVNVSBoYXZlIHRoZSBhYmlsaXR5IHRvIGV4dGVuZCB0
aGUgY2FwYWJpbGl0aWVzIHdpdGhvdXQNCj4gPiByZXF1aXJpbmcgY2hhbmdpbmcgc291cmNlIGNv
ZGUuIEp1c3QgbmVlZCB0byBsb2FkIHRoZSBlQlBGIGJpbmFyeSBmaWxlDQo+ID4gZXZlbiBhdCBW
TSBydW50aW1lLiBBbmQgYWxyZWFkeSBoYXZlIHNvbWUgdXNlcnNwYWNlIGVicGYNCj4gPiBpbXBs
ZW1lbnRhdGlvbiBsaWtlOiBJbnRlbCBEUERLIGVCUEYsIHdpbmRvd3MgZUJQRiwgZXRjLi4NCj4g
PiBUaGUgb3JpZ2luYWwgaWRlYSBzdWdnZXN0ZWQgYnkgSmFzb24gV2FuZy4NCj4gPg0KPiA+ICAg
ICBlQlBGIGlzIGEgcmV2b2x1dGlvbmFyeSB0ZWNobm9sb2d5IHdpdGggb3JpZ2lucyBpbiB0aGUg
TGludXgNCj4gPiBrZXJuZWwgdGhhdCBjYW4gcnVuIHNhbmRib3hlZCBwcm9ncmFtcyBpbiBhbiBv
cGVyYXRpbmcgc3lzdGVtIGtlcm5lbC4NCj4gPiBJdCBpcyB1c2VkIHRvIHNhZmVseSBhbmQgZWZm
aWNpZW50bHkgZXh0ZW5kIHRoZSBjYXBhYmlsaXRpZXMgb2YgdGhlDQo+ID4ga2VybmVsIHdpdGhv
dXQgcmVxdWlyaW5nIHRvIGNoYW5nZSBrZXJuZWwgc291cmNlIGNvZGUgb3IgbG9hZCBrZXJuZWwN
Cj4gPiBtb2R1bGVzLihmcm9tIGh0dHBzOi8vZWJwZi5pby8pDQo+ID4NCj4gPiAgICAgS1ZNIGFs
cmVhZHkgZ290IGJlbmVmaXRzIGZyb20gaXQsIGJ1dCBRRU1VIGRpZCBub3QuIEhlbmNlIHdlIHdh
bnQNCj4gPiB0byBicmluZyB0aGUgcG93ZXIgb2YgZUJQRiB0byBRRU1VLiBJdCBjYW4gbG9hZCBi
aW5hcnkgZUJQRiBwcm9ncmFtDQo+ID4gZXZlbiB3aGVuIFZNIHJ1bm5pbmcuIEF0IHRoZSBzYW1l
IHRpbWUsIGFkZCBzb21lIGhvb2tzIGluIFFFTVUgYXMNCj4gdGhlDQo+ID4gdXNlciBzcGFjZSBl
QlBGIGxvYWQgcG9pbnQuIERvIHRoZSB0aGluZ3Mgb24gZGlmZmVyZW50IGxheWVycy4NCj4gPg0K
PiA+ICAgIFRoYXTigJlzIHRoZSBhZHZhbnRhZ2VzIG9mIGtlcm5lbCBlQlBGLiBNb3N0IG9mIHRo
ZSBmdW5jdGlvbnMgY2FuIGJlDQo+ID4gaW1wbGVtZW50ZWQgaW4gUUVNVS4gVGhpcyBzZXJpZXMg
anVzdCBhIHN0YXJ0IG9mIHRoZSBQb3dlciBvZg0KPiBQcm9ncmFtbWFiaWxpdHkuDQo+ID4NCj4g
PiAgICAgMSkuIFNhZmV0eToNCj4gPg0KPiA+ICAgICBCdWlsZGluZyBvbiB0aGUgZm91bmRhdGlv
biBvZiBzZWVpbmcgYW5kIHVuZGVyc3RhbmRpbmcgYWxsIHN5c3RlbQ0KPiA+ICAgICBjYWxscyBh
bmQgY29tYmluaW5nIHRoYXQgd2l0aCBhIHBhY2tldCBhbmQgc29ja2V0LWxldmVsIHZpZXcgb2Yg
YWxsDQo+ID4gICAgIG5ldHdvcmtpbmcgb3BlcmF0aW9ucyBhbGxvd3MgZm9yIHJldm9sdXRpb25h
cnkgbmV3IGFwcHJvYWNoZXMgdG8NCj4gPiAgICAgc2VjdXJpbmcgc3lzdGVtcy4NCj4gPg0KPiA+
ICAgICAyKS4gVHJhY2luZyAmIFByb2ZpbGluZzoNCj4gPg0KPiA+ICAgICBUaGUgYWJpbGl0eSB0
byBhdHRhY2ggZUJQRiBwcm9ncmFtcyB0byB0cmFjZSBwb2ludHMgYXMgd2VsbCBhcyBrZXJuZWwN
Cj4gPiAgICAgYW5kIHVzZXIgYXBwbGljYXRpb24gcHJvYmUgcG9pbnRzIGFsbG93cyB1bnByZWNl
ZGVudGVkIHZpc2liaWxpdHkgaW50bw0KPiA+ICAgICB0aGUgcnVudGltZSBiZWhhdmlvciBvZiBh
cHBsaWNhdGlvbnMgYW5kIHRoZSBzeXN0ZW0gaXRzZWxmLg0KPiA+DQo+ID4gICAgIDMpLiBOZXR3
b3JraW5nOg0KPiA+DQo+ID4gICAgIFRoZSBjb21iaW5hdGlvbiBvZiBwcm9ncmFtbWFiaWxpdHkg
YW5kIGVmZmljaWVuY3kgbWFrZXMgZUJQRiBhIG5hdHVyYWwNCj4gPiAgICAgZml0IGZvciBhbGwg
cGFja2V0IHByb2Nlc3NpbmcgcmVxdWlyZW1lbnRzIG9mIG5ldHdvcmtpbmcgc29sdXRpb25zLg0K
PiA+DQo+ID4gICAgIDQpLiBPYnNlcnZhYmlsaXR5ICYgTW9uaXRvcmluZzoNCj4gPg0KPiA+ICAg
ICBJbnN0ZWFkIG9mIHJlbHlpbmcgb24gc3RhdGljIGNvdW50ZXJzIGFuZCBnYXVnZXMgZXhwb3Nl
ZCBieSB0aGUNCj4gPiAgICAgcGVyYXRpbmcgc3lzdGVtLCBlQlBGIGVuYWJsZXMgdGhlIGNvbGxl
Y3Rpb24gJiBpbi1rZXJuZWwgYWdncmVnYXRpb24NCj4gPiAgICAgb2YgY3VzdG9tIG1ldHJpY3Mg
YW5kIGdlbmVyYXRpb24gb2YgdmlzaWJpbGl0eSBldmVudHMgYmFzZWQgb24gYSB3aWRlDQo+ID4g
ICAgIHJhbmdlIG9mIHBvc3NpYmxlIHNvdXJjZXMuDQo+ID4NCj4gPiAgICAgUUVNVSB1c2Vyc3Bh
Y2UgZWJwZiBkZXNpZ24gYmFzZWQgb24gdWJwZiBwcm9qZWN0DQo+IChodHRwczovL2dpdGh1Yi5j
b20vaW92aXNvci91YnBmKS4NCj4gPiBUaGUgbW9zdCBtYXR1cmUgdXNlcnNwYWNlIGVicGYgaW1w
bGVtZW50YXRpb24uIFRoaXMgcHJvamVjdCBvZmZpY2lhbGx5DQo+ID4gc3VwcG9ydCBieSBpb3Zp
c29yKExpa2UgQkNDIGFuZCBicGZ0cmFjZSkuIFRoaXMgcHJvamVjdCBpbmNsdWRlcyBhbg0KPiA+
IGVCUEYgYXNzZW1ibGVyLCBkaXNhc3NlbWJsZXIsIGludGVycHJldGVyIChmb3IgYWxsIHBsYXRm
b3JtcyksIGFuZCBKSVQNCj4gPiBjb21waWxlciAoZm9yIHg4Ni02NCBhbmQgQXJtNjQgdGFyZ2V0
cykuIFFlbXUgdXNlcnNwYWNlIGVicGYgbWFrZSB0aGUNCj4gPiB1YnBmIHByb2plY3QgYXMgdGhl
IGdpdCBzdWJtb2R1bGUuDQo+ID4NCj4gPiAgICAgQ3VycmVudCBpbXBsZW1lbnRhdGlvbiBzdXBw
b3J0IGxvYWQgZWJwZiBwcm9ncmFtIGFuZCBydW4gaXQgaW4NCj4gPiBuZXQvZmlsdGVyLXVicGYg
bW9kdWxlLCB0aGlzIGZpbHRlciBjYW4gc3VwcG9ydCBhbnkgdXNlciBkZWZpbmVkIHJ1bGVzDQo+
ID4gdG8gaGFubGUgbmV0d29yayBwYWNrZXQuIEF0IHRoZSBzYW1lIHRpbWUsIGl0J3MgZWFzeSBm
b3Igb3RoZXINCj4gPiBkZXZlbG9wZXJzIHRvIHVzZSB0aGUgdWJwZiBpbmZyYXN0cnVjdHVlIGlu
IFFFTVUncyBvdGhlciBtb2R1bGVzIGZyb20NCj4gPiB0aGUgZnVuY3Rpb24gaW4gL2VicGYvdWJw
Zi5jLCBhbmQgaXQgc3VwcG9ydCBKSVQuDQo+ID4NCj4gPiAgICAgRm9yIHRoZSB1QlBGIExpY2Vu
c2UgaXMgQXBhY2hlIExpY2Vuc2UgMi4wLCBJdCdzIE9LIHRvIGNvbXBhdGlibGUNCj4gPiB3aXRo
IFFFTVXigJlzIEdQTHYyIExJQ0VOU0Ugc2FtZSBhcyBtYXNvbi4NCj4gPg0KPiA+ICAgICBUT0RP
OiBOZWVkIHRvIGFkZCBtb3JlIGNvbW1lbnRzIGFuZCB0ZXN0LWNhc2UgZm9yIHVicGYsIGN1cnJl
bnQNCj4gPiBpbXBsZW1lbnRhdGlvbiBub3QgaW5jbHVkZSBlYnBmIHZlcmlmaWVyLiBCdXQgSSB0
aGluayBtYXliZSBpdCdzIG5vdCBhDQo+ID4gYmlnIHByb2JsZW0sIGN1cnJlbnQgZWJwZiBsb2Fk
L3VubG9hZCBBUEkgZXhwb3NlZCBieSBRTVAgY29tbWFuZC4NCj4gPiBRZW11IGlzIGEgdXNlcnNw
YWNlIHByb2dyYW0sIGlmIHNvbWVvbmUgd2FudCB0byBoYWNrIFFFTVUsIG5vIG5lZWQgdG8NCj4g
PiBsb2FkIGEgbWFsaWNpb3VzIHVicGYgcHJvZ3JhbSwgaXQgY2FuIGhhY2sgUUVNVSBjb2RlIG9y
IGNyYXNoIFFFTVUgb24NCj4gPiBob3N0IGRpcmVjdGx5KGRpZmZlcmVudCBmcm9tIGtlcm5lbCBl
YnBmIG5lZWRzIHN0cmljdCBpbnNwZWN0aW9uLCBidXQNCj4gPiB5ZXMsIGl0IHN0aWxsIG5lZWQg
YmFzaWMgY2hlY2spLg0KPiA+DQo+ID4gQW55IGNvbW1lbnRzIGFyZSB3ZWxjb21lLg0KPiA+DQo+
ID4gVGhhbmtzDQo+ID4gQ2hlbg0KPiA+DQo+ID4NCj4gPiBaaGFuZyBDaGVuICgxMik6DQo+ID4g
ICBjb25maWd1cmU6IEFkZCBpb3Zpc29yL3VicGYgcHJvamVjdCBhcyBhIHN1Ym1vZHVsZSBmb3Ig
UUVNVQ0KPiA+ICAgbWVzb246IEFkZCB1YnBmIGJ1aWxkIGNvbmZpZyBhbmQgbWlzYw0KPiA+ICAg
ZWJwZi91QlBGOiBJbnRyb2R1Y2UgdXNlcnNwYWNlIGVicGYgZGF0YSBzdHJ1Y3R1cmUNCj4gPiAg
IGVicGYvdUJQRjogSW50cm9kdWNlIHVicGYgaW5pdGlhbGl6ZSBmdW5jdGlvbnMNCj4gPiAgIGVi
cGYvdUJQRjogQWRkIHFlbXVfcHJlcGFyZV91YnBmIHRvIGxvYWQgZWJwZiBiaW5hcnkNCj4gPiAg
IGVicGYvdUJQRjogQWRkIHFlbXVfdWJwZl9ydW5fb25jZSBleGN1dGUgcmVhbCBlYnBmIHByb2dy
YW0NCj4gPiAgIG5ldC9maWx0ZXI6IEludHJvZHVjZSBmaWx0ZXItdWJwZiBtb2R1bGUNCj4gPiAg
IHFhcGk6IEFkZCBGaWx0ZXJVYnBmUHJvcGVydGllcyBhbmQgcWVtdS1vcHRpb25zDQo+ID4gICBz
b2Z0bW11L3ZsLmM6IEFkZCBmaWx0ZXItdWJwZiBmb3IgbmV0ZGV2IGFzIG90aGVyIG5ldGZpbHRl
cnMNCj4gPiAgIG5ldC9maWx0ZXItdWJwZi5jOiBydW4gdGhlIHVicGYgcHJvZ3JhbSB0byBoYW5k
bGUgbmV0d29yayBwYWNrZXQNCj4gPiAgIGRvY3MvZGV2ZWw6IEFkZCB1c2Vyc3BhY2UtZWJwZi5y
c3QNCj4gPiAgIHRlc3QvcXRlc3Q6IEFkZCB1YnBmIGJhc2ljIHRlc3QgY2FzZQ0KPiA+DQo+ID4g
IC5naXRtb2R1bGVzICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzICsNCj4gPiAgY29uZmln
dXJlICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMjAgKysrDQo+ID4gIGRvY3MvZGV2ZWwv
dXNlcnNwYWNlLWVicGYucnN0ICAgICAgIHwgMTA2ICsrKysrKysrKysrKysrDQo+ID4gIGVicGYv
bWVzb24uYnVpbGQgICAgICAgICAgICAgICAgICAgIHwgICAxICsNCj4gPiAgZWJwZi91YnBmLXN0
dWIuYyAgICAgICAgICAgICAgICAgICAgfCAgMzUgKysrKysNCj4gPiAgZWJwZi91YnBmLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAyMTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
PiA+ICBlYnBmL3VicGYuaCAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0NCArKysrKysNCj4g
PiAgbWVzb24uYnVpbGQgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNDcgKysrKysrDQo+ID4g
IG1lc29uX29wdGlvbnMudHh0ICAgICAgICAgICAgICAgICAgIHwgICAzICsNCj4gPiAgbmV0L2Zp
bHRlci11YnBmLmMgICAgICAgICAgICAgICAgICAgfCAxODUgKysrKysrKysrKysrKysrKysrKysr
KysrDQo+ID4gIG5ldC9tZXNvbi5idWlsZCAgICAgICAgICAgICAgICAgICAgIHwgICAxICsNCj4g
PiAgcWFwaS9xb20uanNvbiAgICAgICAgICAgICAgICAgICAgICAgfCAgMTggKysrDQo+ID4gIHFl
bXUtb3B0aW9ucy5oeCAgICAgICAgICAgICAgICAgICAgIHwgICA2ICsNCj4gPiAgc2NyaXB0cy9j
b3Zlcml0eS1zY2FuL0NPTVBPTkVOVFMubWQgfCAgIDMgKw0KPiA+ICBzY3JpcHRzL21lc29uLWJ1
aWxkb3B0aW9ucy5zaCAgICAgICB8ICAgNSArDQo+ID4gIHNvZnRtbXUvdmwuYyAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAzICstDQo+ID4gIHRlc3RzL3F0ZXN0L2RlbW9fdWJwZi5vICAgICAg
ICAgICAgIHwgQmluIDAgLT4gNTQ0IGJ5dGVzDQo+ID4gIHRlc3RzL3F0ZXN0L2ludGVnZXJfNS5t
ZW0gICAgICAgICAgIHwgQmluIDAgLT4gNCBieXRlcw0KPiA+ICB0ZXN0cy9xdGVzdC9tZXNvbi5i
dWlsZCAgICAgICAgICAgICB8ICAgMyArLQ0KPiA+ICB0ZXN0cy9xdGVzdC91YnBmLXRlc3QuYyAg
ICAgICAgICAgICB8ICA2NCArKysrKysrKw0KPiA+ICB1YnBmICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMSArDQo+ID4gIDIxIGZpbGVzIGNoYW5nZWQsIDc2MyBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKSAgY3JlYXRlIG1vZGUNCj4gPiAxMDA2NDQgZG9jcy9kZXZlbC91
c2Vyc3BhY2UtZWJwZi5yc3QgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IGVicGYvdWJwZi1zdHVi
LmMgIGNyZWF0ZSBtb2RlIDEwMDY0NCBlYnBmL3VicGYuYyAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+
ID4gZWJwZi91YnBmLmggIGNyZWF0ZSBtb2RlIDEwMDY0NCBuZXQvZmlsdGVyLXVicGYuYyAgY3Jl
YXRlIG1vZGUgMTAwNjQ0DQo+ID4gdGVzdHMvcXRlc3QvZGVtb191YnBmLm8gIGNyZWF0ZSBtb2Rl
IDEwMDY0NA0KPiB0ZXN0cy9xdGVzdC9pbnRlZ2VyXzUubWVtDQo+ID4gY3JlYXRlIG1vZGUgMTAw
NjQ0IHRlc3RzL3F0ZXN0L3VicGYtdGVzdC5jICBjcmVhdGUgbW9kZSAxNjAwMDAgdWJwZg0KPiA+
DQo+ID4gLS0NCj4gPiAyLjI1LjENCj4gPg0K

