Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCD24DD35D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 03:59:14 +0100 (CET)
Received: from localhost ([::1]:47018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV2pd-00051B-Fu
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 22:59:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haiyue.wang@intel.com>)
 id 1nV2oE-0004CW-Um; Thu, 17 Mar 2022 22:57:46 -0400
Received: from mga18.intel.com ([134.134.136.126]:13514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haiyue.wang@intel.com>)
 id 1nV2oC-0007K9-2Q; Thu, 17 Mar 2022 22:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647572264; x=1679108264;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p4LWszBfoBZaANj2zqYsqJZ0mv3m1+QJ4NFj5DYyO4E=;
 b=QwS7zQjUcrde5Jk9ybX3QpkqA/HDQBbm3VJarp1q9gO8Z6OTi47MDw/i
 8opBSlRVjoHZ5zjAiPUrM0HbJ6CoYHWjsRJ2+KpM7m1deex8QPpiHloyw
 juEb3xh67MOGGTw+9wOO8XGqGSjpGDUCOoEtVv1pI29mS7nGEUuWCW9HZ
 xf7DsDNdDXu/jNehthyy397nxsXIsqxyMe0TD18M4XjCG19xW4GS3oA7V
 V5yblkHAFx9pELQLBeDtWbpkPkN7og5zNo/vICH7YG/w6GABt99d9OVps
 IwpEX43w3rstcix1h8scsuyuiUEyfMNvp3ELOIBTn0OBu/58cc9c+Uhzx A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="239196491"
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400"; d="scan'208";a="239196491"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 19:57:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400"; d="scan'208";a="647287616"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 17 Mar 2022 19:57:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 17 Mar 2022 19:57:39 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 17 Mar 2022 19:57:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 17 Mar 2022 19:57:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 17 Mar 2022 19:57:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XV9wpHpKeP8hG1ill4nrZUKKgce8AyJPU/4/VECjurqXKV0e1LEJC5JvxmRcWBnAbp2GnmsAwdD8LmhqObeirQQXpcoUVO/8cvRyzC5w03Cec+PTz2Y/EjYeciIKovyS80qAlVSsk0oy0zdTKif/S+9iO5MneuSYBIceNjxRjDJGYswR5S+0SDmyBYvXCuQelwf2dZajZAy+H+QPQbAgd8zuPoMZQQBhmWWTdyCS/OfyQAboUOkyee4IQuxlJJBvgHhpeRZStpJI9oJPWCjmR31Tp4XpjegIfshhZCDRW91h/4dkf7Is1yg81VS+uZLjANoCOiX5cIdtEXo0QCtoAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4LWszBfoBZaANj2zqYsqJZ0mv3m1+QJ4NFj5DYyO4E=;
 b=dFhoyjkZCTZzADiJrRRIqg41lAJRsok6bix+6FQ6Kps2yQ8ijL9h2hL3qlmdL0IJmiDHwj32a//iclD8GEKYgAD8qwqDQ5mASLfMwkvmOnCvRZJBt92zmORCqyJp91FLKFlHwWcQxxT35X0pzGMihSknRVtAj1QVXItSKl1mf61Zrow5e7+buhuyIvi69VcuSicTRfGclnrzEyRp23N0NEkWsJeJi9zZevb8YKLbRRrgE3XmcmGfFNnoTxsRTDd/zq83zGIRph31+ORM7akAH7+s28VDlXrqaLHCXVn5xl2EgkSDxtjLVcca7kIzbeH3fqIB7F4bV3/+slGhCUG/bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3495.namprd11.prod.outlook.com (2603:10b6:a03:8a::14)
 by DM4PR11MB5342.namprd11.prod.outlook.com (2603:10b6:5:391::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.16; Fri, 18 Mar
 2022 02:57:37 +0000
Received: from BYAPR11MB3495.namprd11.prod.outlook.com
 ([fe80::cc6f:9806:bca7:2297]) by BYAPR11MB3495.namprd11.prod.outlook.com
 ([fe80::cc6f:9806:bca7:2297%7]) with mapi id 15.20.5061.032; Fri, 18 Mar 2022
 02:57:36 +0000
From: "Wang, Haiyue" <haiyue.wang@intel.com>
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>, "Stefan
 Hajnoczi" <stefanha@redhat.com>
Subject: RE: [PULL for-7.0 1/2] aio-posix: fix build failure io_uring 2.2
Thread-Topic: [PULL for-7.0 1/2] aio-posix: fix build failure io_uring 2.2
Thread-Index: AQHYOiAx7r5HRT89OUCE+fXjX/baKKzD0KAAgACh32A=
Date: Fri, 18 Mar 2022 02:57:36 +0000
Message-ID: <BYAPR11MB3495ECDCFD982D453113A6C3F7139@BYAPR11MB3495.namprd11.prod.outlook.com>
References: <20220317165743.238662-1-stefanha@redhat.com>
 <20220317165743.238662-2-stefanha@redhat.com> <YjNsbJcTkoxdPE4P@redhat.com>
In-Reply-To: <YjNsbJcTkoxdPE4P@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9845c194-8e6e-45b1-bfb8-08da088b0ec8
x-ms-traffictypediagnostic: DM4PR11MB5342:EE_
x-microsoft-antispam-prvs: <DM4PR11MB5342EE5CE95E416D6D0FEB7DF7139@DM4PR11MB5342.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DdApkRfZm4rXp87KfTg7bagFs1eoHzbnAETG15loXnmRuV80UhC7+anYwU8fg90yX7PDfRHadEBuqSTpaibK6W6F72+RZn+tmI48ghOY8ak9x1aqI/5u3czt2HAhhIsPl4kzBmHJSrTQppiNO7eokJcb256X2sv0KMjb9ZFLySx7EiE8ATxZLZKIAUXsyEI1/Y2tFn8Dp3rN58vK3znZ/mnro9bTjz3JMAMGNAZ/tvjqpqHx6YO3EQdsS6yZxKffdxJ3Lo4pq8S8JRlCdElgdnxm2gWqNYbf2kLAOqqJHYWIQnEuAvUgzrVDhjE9HYez8/WcqH/OtZm8zY39p9UAGZe0u7u1qX3eslwhyGa6YK8OTy3WF98qVB5kiRZATqs/FmPafELtAHdvSJ5B6M3XKA9eKmTkeZqECByf1iL4aac7Aw8fxivfCuLy4K7PBYjkI7X+MgMS8+mrVGohNvkKEwwRNThWIhc0W1vdXQUDVJuEKIo+Bja73n1MglPieWfnJpoGWVDSSLD4C34ThF/Btd+J2n5rUrFfvhYmeI3hOfq1IVVPt1tVlAjUyNmXnHsZGIwUcvfygk/q8V1QKGbm3pcPOHkI/PpbkNlWHtkobCzbNWHAzoYMXzPZnWaQKSRp6qeUWfJTLFHhtYCNzGv1dcOqsRfnUFbTYjqRmw0s1POFW5Kv7dtQBv2juL5QZcwqajEafGgxycRhULgm/BynzV93FqjHBQGqmp84JDzX+STfvboyiA7Bk0Bvb3q/eegVcmguGXh7Vk6l22ZMi2UWWlQTkTGCXxa3kUvw0w6VrZ/6MiAj0ldfSja7hulXD8QvTwEFN+4FuDah0mctu6VWGQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3495.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(71200400001)(38070700005)(2906002)(55016003)(53546011)(186003)(26005)(966005)(9686003)(122000001)(38100700002)(8936002)(52536014)(82960400001)(508600001)(5660300002)(83380400001)(110136005)(54906003)(316002)(33656002)(4326008)(66556008)(66476007)(66946007)(8676002)(66446008)(76116006)(64756008)(7696005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Uk1rczNWUlM1a200emFrTlNMcFN1c1pkUzhJYURnVkhPSzBzY0l6R294RkFT?=
 =?utf-8?B?U3lQQzA0R3Z0L2xWQUI3RXllczBlejZBSHZUeDRXZ1RKbUN5eGZvY045b3pI?=
 =?utf-8?B?YXR5SE9CeWFkTVZSL0ZSQWtRZjB4Z0pLZVk3QkJpWWxJUERzTEdWMHhuUHBR?=
 =?utf-8?B?bTRtaC91cXBhR1E5UFhrVWZtMStxYUpDT0lKanJDRHc2VEE5NHJ0eTRDNG4r?=
 =?utf-8?B?N3UyMWZxUWE0ZW5BdmppSk5MV3B4a1FTajc0by9HRVo0RUoyd0tVZisreDNn?=
 =?utf-8?B?T3dKaFFxOVdUMXdzaXpVTFFoQ2lGa0JEKzhBSE54elczT3V2WEd6QnFtV1dY?=
 =?utf-8?B?NEllWUZvZjNRNThualkxUm8ybXE1dllzcGM0dithSjNPYTNMLzFuSjFpTXA4?=
 =?utf-8?B?ZGFJVUpBMFNNc2d0d2Q3RWVyOFVOMWQreWJzMWxwa3EzVFQ4QU5renhEcGpo?=
 =?utf-8?B?eEtIT0dsU0tvREs5bTJROW43K2tacFZWYVQ2YitQdXBaRTlWUVdoQVlLWFZo?=
 =?utf-8?B?RjgvNUxKMjJPc0h2TkJBSEtKYXg4K3ZQNnRicEVJUGVSZUNsOWswU20zakdG?=
 =?utf-8?B?cXhkeW8xaWd2UlpqcUJoTmxjdU1jV0h3STdUZlJWSVU1VndNM2tHanlOL0tY?=
 =?utf-8?B?QjI1MEhaTXdMd0lmODI3Qi9QUThCWXhWTkJMSVhteTNFbGJsSy9jSFQxN0I3?=
 =?utf-8?B?TTYweFBaazVLTkhoNENuMW9DbFVSeXljVGo2dWgvVkhJU1NwYWRNZkZ6L25k?=
 =?utf-8?B?eWJ6RWxYeFNXZ1pRSDVpR2dOUUV3cktVbEwzbHMva3F4cXhMUDNUcHhWbVds?=
 =?utf-8?B?bzI2dldOM21DOXM2WFBKMlhvcEorbFBiSmhhUUZ5VWJ2UWxzS1F6SnhyNXdn?=
 =?utf-8?B?Zlkxc3lWU01QVVFxS3NrK2JsYk1XZy9TcjBacjBzczlqMmJ4WHJTejZiN0tO?=
 =?utf-8?B?dGJBSWpVWjR3UUlZZDN2UHZ2ZTRJVjJoUDlKcmthWmFlSVJVR3VqeTk2T25p?=
 =?utf-8?B?N3RhK3Z4VlN1eHFlV0ptTWtXY1hTb2N4MmdjbUtFTlErYS84cWwyQWVQVEh5?=
 =?utf-8?B?b3lLMVU5NEpNSUt3ZEVxUncrcXo2bGJuZnh6WUFzckhtNFdwWlJSTFMzQmtH?=
 =?utf-8?B?dmRRL1dGeFphNTlHOXdZWmdKcXdjRXZXbC8wVytqRnpUdjBueVQ0NnFKZUlk?=
 =?utf-8?B?L01OV3A4SVpUem9VUVFnYUJzVGxuYldFSnNreXNWTnA3Ym1mN2JwYVVIcjNj?=
 =?utf-8?B?bWdHMU54RU9sWlBGeFFtZnZOOUlMQXdjK21hMC9RTS94Tk5sR3EwV2Y1aWlD?=
 =?utf-8?B?U1FTbEVkVWg2RTFUMkR5a2tBZU5DVW5LcFdHdDdrRkVHNUkzcDBoNlI4eVNX?=
 =?utf-8?B?NmJEblY5dmFxTHFYR2NSRUlTbnJvRlJtZkVrSEo1RWdwRGFYUHFMaHUrWENS?=
 =?utf-8?B?aGFCTHIxTysvSUE4Wkk1UHdVU05CenVVM2pjMXh6TEF0MjJqTW5GWmIxODdq?=
 =?utf-8?B?bmJyaEVpZ0YrYlZDdlpRNEpzLzl4WUV1Y0Y3QjdjTC9Kd3RHNW1VbzRnb243?=
 =?utf-8?B?UmFOY2tDeVlyQkVmS2tQQzJqbVo3Y2RZTTFONWZjN0pMVUlaTVVIUkJCUnQ0?=
 =?utf-8?B?T1hSMERJREtCam41aW9iZVJYdVVkc0tnWFFRaU9MSTd6VEk4NDJ6QnVkdEJp?=
 =?utf-8?B?dDNUVWdoYnNxVm9hUW5EN3lkUFdWa1hTWUZoQVNONERTTWpITm9va0R1aUVO?=
 =?utf-8?B?SllHQVI5eVVhMTVONko1TmJySkZFQ09CSzNsaUZkd3JqSU9KeVpIczliNmlr?=
 =?utf-8?B?WFNQdUoySkx2YWxTRnNMN1EvNFR4NUFTcVJKVzZUSWt4VUhpQ1B1SDJiUzdx?=
 =?utf-8?B?REJMbjJMYk1RSGlXWGNDeDdybmFEdWRpWEozK1B1ZDlFWnpoc2ZRWXN1cldT?=
 =?utf-8?Q?RYlzhHPNgFVjkkTRzyHGt7rGPhI7PY0A?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3495.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9845c194-8e6e-45b1-bfb8-08da088b0ec8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2022 02:57:36.6766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qXYjkTqvt3X5vLkYKKEGcarWrbvWdXIGRs3rgvKfA0LVaHZjAsREhj+lts7NzvwYMqva4aXJOdCkkOcQw+WphQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5342
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=haiyue.wang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEYW5pZWwgUC4gQmVycmFuZ8Op
IDxiZXJyYW5nZUByZWRoYXQuY29tPg0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDE4LCAyMDIyIDAx
OjE0DQo+IFRvOiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+DQo+IENjOiBx
ZW11LWRldmVsQG5vbmdudS5vcmc7IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJv
Lm9yZz47IEZhbSBaaGVuZyA8ZmFtQGV1cGhvbi5uZXQ+OyBQYW9sbw0KPiBCb256aW5pIDxwYm9u
emluaUByZWRoYXQuY29tPjsgV2FuZywgSGFpeXVlIDxoYWl5dWUud2FuZ0BpbnRlbC5jb20+OyBx
ZW11LWJsb2NrQG5vbmdudS5vcmcNCj4gU3ViamVjdDogUmU6IFtQVUxMIGZvci03LjAgMS8yXSBh
aW8tcG9zaXg6IGZpeCBidWlsZCBmYWlsdXJlIGlvX3VyaW5nIDIuMg0KPiANCj4gT24gVGh1LCBN
YXIgMTcsIDIwMjIgYXQgMDQ6NTc6NDJQTSArMDAwMCwgU3RlZmFuIEhham5vY3ppIHdyb3RlOg0K
PiA+IEZyb206IEhhaXl1ZSBXYW5nIDxoYWl5dWUud2FuZ0BpbnRlbC5jb20+DQo+ID4NCj4gPiBU
aGUgaW9fdXJpbmcgZml4ZWQgIkRvbid0IHRydW5jYXRlIGFkZHIgZmllbGRzIHRvIDMyLWJpdCBv
biAzMi1iaXQiOg0KPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5kay9jZ2l0L2xpYnVyaW5nL2NvbW1p
dC8/aWQ9ZDg0YzI5YjE5ZWQwYjEzMDAwMDYxOWNmZjQwMTQxYmIxZmMzNjE1Yg0KPiANCj4gRXd3
dywgdGhhdCBjaGFuZ2VzIHRoZSBwdWJsaWMgQUJJIG9mIHRoZSBsaWJyYXJ5IG9uIDMyLWJpdA0K
PiBwbGF0Zm9ybXMsIGJ1dCBmYWlsZWQgdG8gYnVtcCB0aGUgc29uYW1lIHZlcnNpb24sIGV4Y2Vw
dC4uLi4NCj4gDQo+IC4uLmludmVzdGlnYXRpbmcgdGhpcyBJIG5vdGljZWQgYSBmdXJ0aGVyIGNo
YW5nZSB0aGF0IGhhcHBlbmQNCj4gYSBmZXcgd2Vla3MgZWFybGllciBpbiBsaWJ1cmluZyB0aGF0
IGFjdHVhbGx5IGRyb3BwZWQgdGhlDQo+IHZlcnNpb24gZnJvbSB0aGUgc29uYW1lIGVudGlyZWx5
IG1ha2luZyBpdCBhbiB1bnZlcnNpb25lZA0KPiBsaWJyYXJ5Lg0KPiANCj4gVGhpcyBpcyB0aGUg
Y3VycmVudCBzaGlwcGluZyAyLjEgdmVyc2lvbjoNCj4gDQo+ICQgZXUtcmVhZGVsZiAtYSBsaWJ1
cmluZy5zby4yLjAuMCAgfCBncmVwIFNPTkFNRQ0KPiAgIFNPTkFNRSAgICAgICAgICAgIExpYnJh
cnkgc29uYW1lOiBbbGlidXJpbmcuc28uMl0NCj4gDQo+IGFuZCBpbiBnaXQgbWFzdGVyOg0KPiAN
Cj4gJCBldS1yZWFkZWxmIC1hIHNyYy9saWJ1cmluZy5zby4yLjIgfCBncmVwIFNPTkENCj4gICBT
T05BTUUgICAgICAgICAgICBMaWJyYXJ5IHNvbmFtZTogW2xpYnVyaW5nLnNvXQ0KPiANCj4gU3Vy
ZWx5IHRoYXQncyBhIG1pc3Rha2UuDQo+IA0KPiBBZnRlciB0aGUgQUJJIGluY29tcGF0aWJpbGl0
eSBhYm92ZSwgSSB3b3VsZCBoYXZlIGV4cGVjdGVkDQo+IGl0IHRvIGJ1bXAgdG8gbGlidXJpbmcu
c28uMw0KPiANCg0KSXQncyBub3QgQUJJIGlzc3VlOg0KDQpodHRwczovL2dpdGh1Yi5jb20vYXhi
b2UvbGlidXJpbmcvaXNzdWVzLzQ5MA0KDQpyYmVybm9uIGNvbW1lbnRlZCBvbiBEZWMgNSwgMjAy
MQ0KV2VsbCB0aGUgZG9jdW1lbnRhdGlvbiBzYXlzIHRoYXQsIGlvX3VyaW5nX3ByZXBfdGltZW91
dF91cGRhdGUsIGlvX3VyaW5nX3ByZXBfdGltZW91dF9yZW1vdmUsDQppb191cmluZ19wcmVwX3Bv
bGxfdXBkYXRlLCBpb191cmluZ19wcmVwX3BvbGxfcmVtb3ZlLCBpb191cmluZ19wcmVwX2NhbmNl
bCwgYWxsIHRhcmdldCBhIHByZXZpb3VzbHkNCnN1Ym1pdHRlZCBzcWUgd2l0aCBhIG1hdGNoaW5n
IHVzZXJfZGF0YSwgYnV0IHRoZXkgYWxsIHRha2UgYSB2b2lkICogdG8gbWF0Y2ggaXQsIHdoaWNo
IGlzbid0IGNvcnJlY3QNCmFzIHRoZSBtYXRjaCBpcyBnb2luZyB0byBoYXBwZW4gb24gdGhlIDY0
Yml0IHZhbHVlLg0KDQpUaGUgcHJldmlvdXNseSBzdWJtaXR0ZWQgc3FlIHVzZXJfZGF0YSBtYXkg
YmUgYW55IDY0Yml0IHZhbHVlLCBpbmNsdWRpbmcgb24gMzJiaXQgYXMgdGhlIHN1Ym1pdHRlcg0K
bWF5IGhhdmUgc2V0IHRoZSB2YWx1ZSBpdHNlbGYsIHdpdGhvdXQgZ29pbmcgdGhyb3VnaCB0aGUg
aW9fdXJpbmdfc3FlX3NldF9kYXRhIGhlbHBlcnMuIEZvciBpbnN0YW5jZQ0KaWYgeW91IG9ubHkg
bmVlZCBhbiBpbmRleCAob3IgZmQpIGFuZCBvcGVyYXRpb24gdHlwZSwgd2hpY2ggZml0IHdlbGwg
b24gNjRiaXRzLCB5b3UgZG9uJ3QgcmVhbGx5IHdhbnQNCnRvIHVzZSBhIHBvaW50ZXIgdGhlcmUu
DQoNCj4gDQo+ID4NCj4gPiBUaGlzIGxlYWRzIHRvIGJ1aWxkIGZhaWx1cmU6DQo+ID4gLi4vdXRp
bC9mZG1vbi1pb191cmluZy5jOiBJbiBmdW5jdGlvbiDigJhhZGRfcG9sbF9yZW1vdmVfc3Fl4oCZ
Og0KPiA+IC4uL3V0aWwvZmRtb24taW9fdXJpbmcuYzoxODI6MzY6IGVycm9yOiBwYXNzaW5nIGFy
Z3VtZW50IDIgb2Yg4oCYaW9fdXJpbmdfcHJlcF9wb2xsX3JlbW92ZeKAmSBtYWtlcw0KPiBpbnRl
Z2VyIGZyb20gcG9pbnRlciB3aXRob3V0IGEgY2FzdCBbLVdlcnJvcj1pbnQtY29udmVyc2lvbl0N
Cj4gPiAgIDE4MiB8ICAgICBpb191cmluZ19wcmVwX3BvbGxfcmVtb3ZlKHNxZSwgbm9kZSk7DQo+
ID4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn4NCj4gPiAg
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiA+ICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBaW9IYW5kbGVyICoNCj4gPiBJbiBm
aWxlIGluY2x1ZGVkIGZyb20gL3Jvb3QvaW8vcWVtdS9pbmNsdWRlL2Jsb2NrL2Fpby5oOjE4LA0K
PiA+ICAgICAgICAgICAgICAgICAgZnJvbSAuLi91dGlsL2Fpby1wb3NpeC5oOjIwLA0KPiA+ICAg
ICAgICAgICAgICAgICAgZnJvbSAuLi91dGlsL2ZkbW9uLWlvX3VyaW5nLmM6NDk6DQo+ID4gL3Vz
ci9pbmNsdWRlL2xpYnVyaW5nLmg6NDE1OjE3OiBub3RlOiBleHBlY3RlZCDigJhfX3U2NOKAmSB7
YWthIOKAmGxvbmcgbG9uZyB1bnNpZ25lZCBpbnTigJl9IGJ1dCBhcmd1bWVudA0KPiBpcyBvZiB0
eXBlIOKAmEFpb0hhbmRsZXIgKuKAmQ0KPiA+ICAgNDE1IHwgICAgICAgICAgIF9fdTY0IHVzZXJf
ZGF0YSkNCj4gPiAgICAgICB8ICAgICAgICAgICB+fn5+fn5efn5+fn5+fn4NCj4gPiBjYzE6IGFs
bCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycw0KPiA+DQo+ID4gVXNlIExJQlVSSU5H
X0hBVkVfREFUQTY0IHRvIGNoZWNrIHdoZXRoZXIgdGhlIGlvX3VyaW5nIHN1cHBvcnRzIDY0LWJp
dA0KPiA+IHZhcmlhbnRzIG9mIHRoZSBnZXQvc2V0IHVzZXJkYXRhLCB0byBjb252ZXJ0IHRoZSBw
YXJhbXRlciB0byB0aGUgcmlnaHQNCj4gPiBkYXRhIHR5cGUuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBIYWl5dWUgV2FuZyA8aGFpeXVlLndhbmdAaW50ZWwuY29tPg0KPiA+IE1lc3NhZ2UtSWQ6
IDwyMDIyMDIyMTE2MjQwMS40NTQxNS0xLWhhaXl1ZS53YW5nQGludGVsLmNvbT4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+DQo+ID4gLS0t
DQo+ID4gIHV0aWwvZmRtb24taW9fdXJpbmcuYyB8IDQgKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdXRpbC9mZG1vbi1pb191
cmluZy5jIGIvdXRpbC9mZG1vbi1pb191cmluZy5jDQo+ID4gaW5kZXggMTQ2MWRmYTQwNy4uYWI0
MzA1MmRkNyAxMDA2NDQNCj4gPiAtLS0gYS91dGlsL2ZkbW9uLWlvX3VyaW5nLmMNCj4gPiArKysg
Yi91dGlsL2ZkbW9uLWlvX3VyaW5nLmMNCj4gPiBAQCAtMTc5LDcgKzE3OSwxMSBAQCBzdGF0aWMg
dm9pZCBhZGRfcG9sbF9yZW1vdmVfc3FlKEFpb0NvbnRleHQgKmN0eCwgQWlvSGFuZGxlciAqbm9k
ZSkNCj4gPiAgew0KPiA+ICAgICAgc3RydWN0IGlvX3VyaW5nX3NxZSAqc3FlID0gZ2V0X3NxZShj
dHgpOw0KPiA+DQo+ID4gKyNpZmRlZiBMSUJVUklOR19IQVZFX0RBVEE2NA0KPiA+ICsgICAgaW9f
dXJpbmdfcHJlcF9wb2xsX3JlbW92ZShzcWUsIChfX3U2NCkodWludHB0cl90KW5vZGUpOw0KPiA+
ICsjZWxzZQ0KPiA+ICAgICAgaW9fdXJpbmdfcHJlcF9wb2xsX3JlbW92ZShzcWUsIG5vZGUpOw0K
PiA+ICsjZW5kaWYNCj4gPiAgfQ0KPiA+DQo+ID4gIC8qIEFkZCBhIHRpbWVvdXQgdGhhdCBzZWxm
LWNhbmNlbHMgd2hlbiBhbm90aGVyIGNxZSBiZWNvbWVzIHJlYWR5ICovDQo+ID4gLS0NCj4gPiAy
LjM1LjENCj4gPg0KPiA+DQo+IA0KPiBXaXRoIHJlZ2FyZHMsDQo+IERhbmllbA0KPiAtLQ0KPiB8
OiBodHRwczovL2JlcnJhbmdlLmNvbSAgICAgIC1vLSAgICBodHRwczovL3d3dy5mbGlja3IuY29t
L3Bob3Rvcy9kYmVycmFuZ2UgOnwNCj4gfDogaHR0cHM6Ly9saWJ2aXJ0Lm9yZyAgICAgICAgIC1v
LSAgICAgICAgICAgIGh0dHBzOi8vZnN0b3AxMzguYmVycmFuZ2UuY29tIDp8DQo+IHw6IGh0dHBz
Oi8vZW50YW5nbGUtcGhvdG8ub3JnICAgIC1vLSAgICBodHRwczovL3d3dy5pbnN0YWdyYW0uY29t
L2RiZXJyYW5nZSA6fA0KDQo=

