Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5746F6652
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 09:52:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puTkZ-00024X-Qh; Thu, 04 May 2023 03:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puTkX-00024P-8i
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:51:37 -0400
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puTkV-0002y9-BI
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:51:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683186695; x=1714722695;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kI1NGJr0wG99sQcT3VHUX/MJge0I91MN3ZxSSpQzr4c=;
 b=a/BBfowLqN1byMck+RTUn9vzyqLAngOLGeaqTB/apyjR+Y2Go36HYtwt
 9GwN4oMtH7kaq6cwwxYT1mo7m9Q0yYtNmkxraIF08b8S2cQpfH7VQnzta
 gu3y/Vacn6LtnxXojSayh0qFXkbIlS3CJ2Pm4d+urYimDRjz5l8THNqzJ
 znh0Ey5lmf6nX+wrK0plGmJKCiXUflozSwAHE2x+ekO8pA9iUDXjFCopz
 c3xTcx/5L0GZ0dxWsy3TeTqvIB0KI+3jZY097UyxfoFu7GMY24V8qjikP
 1nVJOOUIq8pVm87bD6Uqb9PE/cuZeSEb+9TDSeK1zwMU4vKvBYwpcz64z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="328476942"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="328476942"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:51:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="841030042"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="841030042"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 04 May 2023 00:51:33 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 00:51:33 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 00:51:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 00:51:32 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 00:51:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8rdL76VUklRt2+mLxeMUdXMPWQnaFJu1AOI3ZHH4li2iE840AZX12hpL96FOSNv5sW6866S9Sh22M867UDDAzWBT4RfYz8hbNYZfhkmRTAPpQwxPFp6anAp0L7nnIOcALpbIGo/WZ4yYNKvFyApoxqyzyJLRm1QEbdtAAsd94gXPMS06iwMHdz19So+TqZ1gVqngBXStKiDOz2xPcuO8lI6HHk3Q2b20dIg8iJwYLKTrCLU4rWlLUi4hE9GBGwZ1YPVdegxVxqHNzetSkRzm6mGAHaWXv7aXyY4CmH7+DMMX1DEzmHCln3mZUcUCFO24RIErpcAc7KyO3H5yVqf0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kI1NGJr0wG99sQcT3VHUX/MJge0I91MN3ZxSSpQzr4c=;
 b=odLPi7Ls7W23e1yBtVZcDgrf8uATWTR7mSww7753gzELvMOc6vRxFgSzF7UwjGkN5oDxLTWADOzVgNeYq0Fo7yh9CDNuSIXpKYqFWroggvlm6JSvr0xnRVfSI4fCg1j/NAQDfjeP+NlO61bT7hQKVRYgaQNuQni6Uxc8/vw5gxRkSD3yoO1MZeqfHU50n9d6tNuCXtK5vqX/c28cdIWrg9kwLzfVREzXw+uvf+vNtVn3e8FeV5oz/ksGUItFzjchzo2waQyNBNubaPHmvk5Gjy414BIdgCFOOfYwXjNVSJ4RkDzVwjv2ZqhqAy+QXsALMJ+yfU4vRZMNbm+mp/fMXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by DS0PR11MB7191.namprd11.prod.outlook.com (2603:10b6:8:139::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 07:51:30 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 07:51:30 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Peter Xu
 <peterx@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "lukasstraub2@web.de"
 <lukasstraub2@web.de>, "quintela@redhat.com" <quintela@redhat.com>, "Zhang,
 Hailiang" <zhanghailiang@xfusion.com>, Leonardo Bras <leobras@redhat.com>
Subject: RE: [PATCH v4 07/10] migration: split migration_incoming_co
Thread-Topic: [PATCH v4 07/10] migration: split migration_incoming_co
Thread-Index: AQHZegsrQJXFOQvoEEW08Uu7459wAK9HersAgAG01YCAAJZDUA==
Date: Thu, 4 May 2023 07:51:30 +0000
Message-ID: <MWHPR11MB0031E2DB46FDB75DDC590D1E9B6D9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-8-vsementsov@yandex-team.ru> <ZFF3DJ9BpFAYEVGV@x1n>
 <68dbd97f-df39-9521-5a8e-7d013f1d81c1@yandex-team.ru>
In-Reply-To: <68dbd97f-df39-9521-5a8e-7d013f1d81c1@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|DS0PR11MB7191:EE_
x-ms-office365-filtering-correlation-id: cc362ae3-99e4-4441-61b5-08db4c745f7c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8etUZ+3bOxm0PHj3Lmj6KNZO4KV1OlDmUJJ4vWKKPYca13Wb3tLEodFsdBfRVZqWUvmpje7a6G54JNTa5uJqHgdcjlHj5covY3TSxh3vCnPXI5tRRyE8YztGmoroH5fxswFrweBz3LbED7p7NZD2Vwm0IEl16J9JD4MmsdEFLWLG4WekBy+J8w8icccEnUzf5CnNdqmunI6g54x4j0lwbftC0C13EGfEWHKbEAHufZWDzOBker7sJf7WVfHPy2I783jVTP1UfPc7cM3IiQp+OCfwPOwV6U5SrtZcDWIbZyPzgv+A1doXZVOkwsbbPr67AnLsj7jlfLBzr1mBPzd8cNlyEp/B1qk+awVaOHI8TLa7B39sv2jozDeZdnaQL0wJve827suClzq6dYhM0IDJtUcwkH8P3pVeGOUiedwJYpMyh5dqSSTekyP231WosZWpTm3QPHvLxngvQQf8RtaXEamXIT+A0U4Y8fgAWZa06W8HRj3cxlJ5sBtC9WsbMFqPELzFSfVhuk9nANU3ah6MIrlMyOkKuDnC20+D/fDl8ByLWS5JeK7O/D0Id7Gylnxs2qArExb+xX8KabcL5yHxYGHf+2k7btVIKbsvPNEgrjRcncticOzVq4wnxS3ozP6c
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199021)(83380400001)(2906002)(5660300002)(33656002)(8676002)(8936002)(110136005)(66446008)(66476007)(41300700001)(86362001)(66946007)(66556008)(52536014)(76116006)(71200400001)(478600001)(4326008)(54906003)(316002)(7696005)(64756008)(55016003)(122000001)(38100700002)(82960400001)(186003)(53546011)(38070700005)(26005)(6506007)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVNDY1p2NmJ0dkI2My9IblorRzFWMk1iU1FRNldMY21vQjc4Q0I2VzBxN0JL?=
 =?utf-8?B?YUhoaGh4SVdwMkhNeVoxRmh1WUJNKzRaT09PZnRQL0hqdWFZMlJaT3YrRHZX?=
 =?utf-8?B?amdZUUZ3bFhsdERBeCt4L3JvS0J5Vmx3dWN0OVFnYlVYWmg0MldkaTNCb1da?=
 =?utf-8?B?Nk9IdC91aUc0TGtKak1YbGdHQm1SZ3lNejZ4MXRZYWdFUW1lek1WM2dWVmRY?=
 =?utf-8?B?ak5ocUtycFYwbVdUNE55QzlyUnlHakpyUnNwbGEzanVFUTJ5SEx0bHRnSE1M?=
 =?utf-8?B?Rmd1bnprZU05ZDhJUXNLd1p3SlJjTU5pdE9oanpBNDNsS25CMlBMdldNRjl6?=
 =?utf-8?B?Q09temYvM2kxeUlxRUVKUWV4M3lKT3ozZU01NG5WYkN3NksweHNPQXNDQTEx?=
 =?utf-8?B?ZWQrVGVaQ2pRNXB3VmhMbkZWVngzREU4UFBOTUREU1krd2xLL3JjbVdKSkhB?=
 =?utf-8?B?MTZaeHU2aXQxSE5ydnAvN1RNYUV1c0ZBbDB2SFBxU204WjFYWHEvREZwYWpn?=
 =?utf-8?B?c2llL0lrR1E3VmtsVEpzUDh4QVZmWERxeTZHNmJNYmw5amNxNU1YZ1l5WWN2?=
 =?utf-8?B?RHpkZzE5cnBmTGxIN3JCT3pvU3BqOVNZK3FtVWZCN0t4K3RkaGJ4Z2NnQTZ1?=
 =?utf-8?B?VGdyR3Q5dlhLUDBRdnI0MnFWQVlDaWNLUGZBcTRnWGs3UENjc2pPNnZmRjR2?=
 =?utf-8?B?emNXcDFhYjg1VEp0dVk3aE54Mzk0ZjJCVytUQXJYdmZsN2tjL3RCZ0lNQWV3?=
 =?utf-8?B?QlcwY2ZDeDdYOHlOa0hUd05kNG92VWs1dlRzZWhWbWhUYURmNStjbTd4R3RD?=
 =?utf-8?B?ZGxCOWNsMmJKb24yNkJFblpHSkorZmk3T044VjEvVkJIS2J5czNPZjBtWFVS?=
 =?utf-8?B?cXNlNmozc1pxa3FJR3pOVC94OTdDUXZaVGI1N1plYlB0b2pDUzJpSkZSK2Iw?=
 =?utf-8?B?QngrWTFnSzE5OXRFbTZpN2t5cVdGQzZ3ODFDME43QjBtdGhmNk9Wb2VoeU44?=
 =?utf-8?B?MDJNK2JMVGYyY3M2N2pTeGora2t6dWRaUE5zZWZEM3FPY21hQ01UWG8zc3kz?=
 =?utf-8?B?L0Z0QW51czY3UC9maUExdlNCWUFSWFZCbTQrdHFLdXFqM3RPZnAza2dxRmJN?=
 =?utf-8?B?L0RjUFdic0hac3hOMUd4T0NwSk54TWt0ZWRQWHpNQnlrWHNuTmpiZWo5K3VX?=
 =?utf-8?B?MVFkVlFUSjUvcEJLeGR0ZFFCT2YrVVpTaE9uYTY1M3ZhWUFUaFpBeVJsUDBz?=
 =?utf-8?B?LzZIbU9nZlowUnlxYW9Ya0hVRHdvNEIrc0cwR2ZjVG9SZE9IQWdocEU4SkxW?=
 =?utf-8?B?ekxPeENkWG5aa2ZsajJwMjNsRXVmbTNpb3dhL0ZYNXo2SFJBLy96R2dtdDR5?=
 =?utf-8?B?YTNlYVNPa2YraDRYSDh3VjVqa0hUbittNHZIMjhLbkZkTlRJaHpTUDEvVVpt?=
 =?utf-8?B?VDRhSEFEeG5oSENQWGJGcWpDaHlJSDBveml3K2I1enRXa3dNSmpHZkpqeUk2?=
 =?utf-8?B?YWlWQTlQZzhNeGp1NmdFTU1JR1hQanlPSEpWS3NrVE9EVlZIL0JyQ0ZLS3dG?=
 =?utf-8?B?K29hWERtR25pSDl3L3hVNXlmclFFN0xxOWR3WW53dmtCN3NOYU54amZlK1lK?=
 =?utf-8?B?ZlpZZFJCVmJxUXBzRnhOcjJ3WCswRkxqejNxZG9SOEFTblhPanFOanhCdGM2?=
 =?utf-8?B?RStMa1J3TVBaWEpvUzNSZXVaVit1MUdTRW5RbS9LcGU5MTEwcHVtK3h0b1dR?=
 =?utf-8?B?TC93YkVDUnhrZGdVK3VZZGJ2RDhBaHZNU1VjbU9XS3Y0QzVFTyswSCt5K3pJ?=
 =?utf-8?B?MFA3aXI1WStxSVdabW50Nmc4cFZOcXJkWWVieXlIdzR3U0hSWGdXdnNlVVVP?=
 =?utf-8?B?MzFBR1NKTXFNWUR5ekZnemw1WnAySW9iNnlma2llZDhaZlRIM0s4c25oZGQy?=
 =?utf-8?B?eU1vSklwNlh2L3FqaE5Qc1J4V0Y4dHJCTXhraVZLWlBOYW1VSFJ5bkNjaTJw?=
 =?utf-8?B?QXErN3F5ajFUSDNuRW9QYk9TaDYxYWN4aDJSSW1lZzRncFZTOXZaTkJBdWVi?=
 =?utf-8?B?TmpZaFUwMzVNRmZITUNKUkd2QVhVZnl1UHpKMjRXUkVocEtvaHA1ZElFKzBC?=
 =?utf-8?Q?reHShU5wgarfOczHEq2h4UimA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc362ae3-99e4-4441-61b5-08db4c745f7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 07:51:30.4458 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7/v8cxUU0DBsvFe/YGxHKTpD9VpiKYdqJec2X/nLB3gkRU95JY1gtVUCC+aiwNWKLUWbzFajD0kv4fRTz0ex1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7191
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136; envelope-from=chen.zhang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVmxhZGltaXIgU2VtZW50
c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB5YW5kZXgtdGVhbS5ydT4NCj4gU2VudDogVGh1cnNk
YXksIE1heSA0LCAyMDIzIDY6NTIgQU0NCj4gVG86IFBldGVyIFh1IDxwZXRlcnhAcmVkaGF0LmNv
bT4NCj4gQ2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgbHVrYXNzdHJhdWIyQHdlYi5kZTsgcXVp
bnRlbGFAcmVkaGF0LmNvbTsNCj4gWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPjsg
WmhhbmcsIEhhaWxpYW5nDQo+IDx6aGFuZ2hhaWxpYW5nQHhmdXNpb24uY29tPjsgTGVvbmFyZG8g
QnJhcyA8bGVvYnJhc0ByZWRoYXQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDA3LzEw
XSBtaWdyYXRpb246IHNwbGl0IG1pZ3JhdGlvbl9pbmNvbWluZ19jbw0KPiANCj4gT24gMDIuMDUu
MjMgMjM6NDgsIFBldGVyIFh1IHdyb3RlOg0KPiA+IE9uIEZyaSwgQXByIDI4LCAyMDIzIGF0IDEw
OjQ5OjI1UE0gKzAzMDAsIFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkNCj4gd3JvdGU6DQo+
ID4+IE9yaWdpbmFsbHksIG1pZ3JhdGlvbl9pbmNvbWluZ19jbyB3YXMgaW50cm9kdWNlZCBieQ0K
PiA+PiAyNWQwYzE2ZjYyNWZlYjNiNg0KPiA+PiAgICAgIm1pZ3JhdGlvbjogU3dpdGNoIHRvIENP
TE8gcHJvY2VzcyBhZnRlciBmaW5pc2hpbmcgbG9hZHZtIg0KPiA+PiB0byBiZSBhYmxlIHRvIGVu
dGVyIGZyb20gQ09MTyBjb2RlIHRvIG9uZSBzcGVjaWZpYyB5aWVsZCBwb2ludCwgYWRkZWQNCj4g
Pj4gYnkgMjVkMGMxNmY2MjVmZWIzYjYuDQo+ID4+DQo+ID4+IExhdGVyIGluIDkyMzcwOTg5NmIx
YjANCj4gPj4gICAibWlncmF0aW9uOiBwb2xsIHRoZSBjbSBldmVudCBmb3IgZGVzdGluYXRpb24g
cWVtdSINCj4gPj4gd2UgcmV1c2VkIHRoaXMgdmFyaWFibGUgdG8gd2FrZSB0aGUgbWlncmF0aW9u
IGluY29taW5nIGNvcm91dGluZSBmcm9tDQo+ID4+IFJETUEgY29kZS4NCj4gPj4NCj4gPj4gVGhh
dCB3YXMgZG91YnRmdWwgaWRlYS4gRW50ZXJpbmcgY29yb3V0aW5lcyBpcyBhIHZlcnkgZnJhZ2ls
ZSB0aGluZzoNCj4gPj4geW91IHNob3VsZCBiZSBhYnNvbHV0ZWx5IHN1cmUgd2hpY2ggeWllbGQg
cG9pbnQgeW91IGFyZSBnb2luZyB0byBlbnRlci4NCj4gPj4NCj4gPj4gSSBkb24ndCBrbm93IGhv
dyBtdWNoIGlzIGl0IHNhZmUgdG8gZW50ZXIgZHVyaW5nIHFlbXVfbG9hZHZtX3N0YXRlKCkNCj4g
Pj4gd2hpY2ggSSB0aGluayB3aGF0IFJETUEgd2FudCB0byBkby4gQnV0IGZvciBzdXJlIFJETUEg
c2hvdWxkbid0IGVudGVyDQo+ID4+IHRoZSBzcGVjaWFsIENPTE8tcmVsYXRlZCB5aWVsZC1wb2lu
dC4gQXMgd2VsbCwgQ09MTyBjb2RlIGRvZXNuJ3Qgd2FudA0KPiA+PiB0byBlbnRlciBkdXJpbmcg
cWVtdV9sb2Fkdm1fc3RhdGUoKSwgaXQgd2FudCB0byBlbnRlciBpdCdzIG93bg0KPiA+PiBzcGVj
aWZpYyB5aWVsZC1wb2ludC4NCj4gPj4NCj4gPj4gQXMgd2VsbCwgd2hlbiBpbiA4ZTQ4YWM5NTg2
NWFjOTdkDQo+ID4+ICAgIkNPTE86IEFkZCBibG9jayByZXBsaWNhdGlvbiBpbnRvIGNvbG8gcHJv
Y2VzcyIgd2UgYWRkZWQNCj4gPj4gYmRydl9pbnZhbGlkYXRlX2NhY2hlX2FsbCgpIGNhbGwgKG5v
dyBpdCdzIGNhbGxlZCBhY3RpdmF0ZV9hbGwoKSkgaXQNCj4gPj4gYmVjYW1lIHBvc3NpYmxlIHRv
IGVudGVyIHRoZSBtaWdyYXRpb24gaW5jb21pbmcgY29yb3V0aW5lIGR1cmluZyB0aGF0DQo+ID4+
IGNhbGwgd2hpY2ggaXMgd3JvbmcgdG9vLg0KPiA+Pg0KPiA+PiBTbywgbGV0J3QgbWFrZSB0aGVz
ZSB0aGluZ3Mgc2VwYXJhdGUgYW5kIGRpc2pvaW50OiBsb2Fkdm1fY28gZm9yDQo+ID4+IFJETUEs
IG5vbi1OVUxMIGR1cmluZyBxZW11X2xvYWR2bV9zdGF0ZSgpLCBhbmQgY29sb19pbmNvbWluZ19j
byBmb3INCj4gPj4gQ09MTywgbm9uLU5VTEwgb25seSBhcm91bmQgc3BlY2lmaWMgeWllbGQuDQo+
ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkNCj4g
Pj4gPHZzZW1lbnRzb3ZAeWFuZGV4LXRlYW0ucnU+DQo+ID4+IC0tLQ0KPiA+PiAgIG1pZ3JhdGlv
bi9jb2xvLmMgICAgICB8IDQgKystLQ0KPiA+PiAgIG1pZ3JhdGlvbi9taWdyYXRpb24uYyB8IDgg
KysrKysrLS0NCj4gPj4gICBtaWdyYXRpb24vbWlncmF0aW9uLmggfCA5ICsrKysrKysrLQ0KPiA+
PiAgIDMgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4g
Pg0KPiA+IFRoZSBpZGVhIGxvb2tzIHJpZ2h0IHRvIG1lLCBidXQgSSByZWFsbHkga25vdyBtb3N0
bHkgbm90aGluZyBvbg0KPiA+IGNvcm91dGluZXMgYW5kIGFsc28gcmRtYStjb2xvLi4NCj4gPg0K
PiA+IElzIHRoZSBvdGhlciByZWYgaW4gcmRtYS5jIChyZG1hX2NtX3BvbGxfaGFuZGxlcigpKSBz
dGlsbCBtaXNzaW5nPw0KPiA+DQo+IA0KPiBPb3BzIHJpZ2h0Li4gSSB3YXMgYnVpbGRpbmcgd2l0
aCByZG1hIGRpc2FibGVkLiBXaWxsIGZpeC4NCj4gDQo+IFRoYW5rcyBhIGxvdCBmb3IgcmV2aWV3
aW5nIQ0KPiANCg0KWWVzLCBJIGtub3cgc29tZSBwZW9wbGUgYW5kIGNvbXBhbnkgdHJ5IHRvIGVu
YWJsZSBDT0xPIHdpdGggUkRNQS4NCkJ1dCBpbiBteSBzaWRlLCBJIGhhdmVuJ3QgdHJpZWQgdGhp
cyB3YXkgeWV0Lg0KDQpUaGFua3MNCkNoZW4NCg0KPiAtLQ0KPiBCZXN0IHJlZ2FyZHMsDQo+IFZs
YWRpbWlyDQoNCg==

