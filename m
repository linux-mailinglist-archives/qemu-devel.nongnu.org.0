Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A2E44D035
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 04:11:38 +0100 (CET)
Received: from localhost ([::1]:46116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml0Uz-0006P6-7E
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 22:11:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ml0U1-0005bn-CJ
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 22:10:37 -0500
Received: from mga01.intel.com ([192.55.52.88]:25822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ml0Tw-0006U0-1i
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 22:10:35 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="256536149"
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="256536149"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 19:10:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="452558406"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga003.jf.intel.com with ESMTP; 10 Nov 2021 19:10:27 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 10 Nov 2021 19:10:26 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 10 Nov 2021 19:10:26 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 10 Nov 2021 19:10:26 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 10 Nov 2021 19:10:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cW2plZNPCIwwm4Aij6c2ykeovyb66Rm375hLmeerFYy0aiVXWVGP0SpoyACeCEnln+nlGHifstN8xGo2y7/5x8z2FNE/zPEQI27utpCKbcOB4vOjjBZq8kDZYVGeZvXBDU8mxwv39ZlqkO32gTYqtF6RQhH8AoyDKptBwePcS+ARuCFGuN+h4LSN7N6ivGvZCrZ2d1XSGfapbPvuU1Hr3omYlNaPwpDEpAkzacAT/qb+vM8zKW6OCCrTi5YYpK2lK3MbwFGVnZuNYVw4pfCJ/1roHYVAmVIckBcFn47YyYaO1J49oyAHwUyEdVb1dJf77eDbyIC0fG+zHpZ8NcLaEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zq5KF/NCf2ChRWEIrUVb7G/j9FG2qWatu9ULn8Wt8Ho=;
 b=U17eRNujttKLvL44/9lvcPaIPmENPGuSBBJYUwOKMeDL4f7pn1T/VeFzO2SF4SgxNhLOfH41FBi737gnDTS87g5gSTlCq6lt6HfdOxbHEIsmo4BEooNP12S56NqUKkyfZLsH9jYVrmX5rs+EvuHzGG8rDrOkZSLaf77l+e6MjDPqSy/ZxvMJTbjq8m3+rLVBsLEFr8UYttiFlc1kqiZ1n7pe7WH+J8kzN1mYKq4T3vxZIyIbF20ONosUsQoWcud84rKMX5lOMw5ZCQd8gCpTIAXpj1SwNj2XvLC6M6DbKel7rRg5YI/XfE7R2mX4VwfLU1Cle71p3oj1ZFo0zLLd+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zq5KF/NCf2ChRWEIrUVb7G/j9FG2qWatu9ULn8Wt8Ho=;
 b=XXFjqGmZ5PnQ+1D8f1wROor1zFsB4aWzDjd0l3Vrad8sMnp+X2u6mUVIawUDdfJh6WxrVgns++nwRaOd1fB1yMjYRvQn4bEzahe1Pe3FZYL4MHtMHjmhnOMQ6mvChADVeIuBYZypxpZjtTGtRxTRF7G8DUctDaJvdm9TAZ8Iyvc=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MWHPR11MB1839.namprd11.prod.outlook.com (2603:10b6:300:10e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 11 Nov
 2021 03:10:24 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814%3]) with mapi id 15.20.4669.016; Thu, 11 Nov 2021
 03:10:24 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH] net/filter: Enable the vnet_hdr_support by default
Thread-Topic: [PATCH] net/filter: Enable the vnet_hdr_support by default
Thread-Index: AQHX1d14LCgu6/0Qh0SCPdXTBPAUvav8NfnPgAABTACAABNY8IAAAHQAgAAlQPuAATF/AIAABY6g
Date: Thu, 11 Nov 2021 03:10:24 +0000
Message-ID: <MWHPR11MB0031EBA38E0E8E8EAE0150449B949@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211110023915.3797141-1-chen.zhang@intel.com>
 <87czn88uqc.fsf@dusky.pond.sub.org>
 <MWHPR11MB00319C2B4ED872EDDB5D43539B939@MWHPR11MB0031.namprd11.prod.outlook.com>
 <87v9104jlb.fsf@dusky.pond.sub.org>
 <MWHPR11MB0031DA3FF0E560F0A83C9B759B939@MWHPR11MB0031.namprd11.prod.outlook.com>
 <87czn82ys4.fsf@dusky.pond.sub.org>
 <CACGkMEt0UcaOupg3NPM4GZGUWDXrsm9AVnkQ1-bZZM3duuhocQ@mail.gmail.com>
In-Reply-To: <CACGkMEt0UcaOupg3NPM4GZGUWDXrsm9AVnkQ1-bZZM3duuhocQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a477f8a-68be-4277-3676-08d9a4c0ce24
x-ms-traffictypediagnostic: MWHPR11MB1839:
x-microsoft-antispam-prvs: <MWHPR11MB1839090E1BDE4C3F0E1D592B9B949@MWHPR11MB1839.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /bVjueV+z6phP46ZyjWxcnbXs8aI3PKH5NQRdTNPLk7PnIHXgjW/FxnBZ4j+H79JL3wZ/YdXndkzkpVz0AHjNd9GxrhxvCd3WzpZaUDRcpZQXxdWKbrNM0DB42ARYPGI9Mb/LVg65zW2USGf8doVYDws0vPDaJQMKIbkkTeKYUzsWkUXSO0PQUgEQDTm68jVMrgYG0cjRr0EAWISF3UHASkNyJbswwg+EUMwZSIji3h4KQNyj06MaLpH2DcjtOJEKv0jQxgnlKj+fuPcc1FIsIq9bIUEJTBmsbv6Glo0IlhZ3R2dxiinZEjScAxz/GPJWdRHr85EqarQCs/PzaWnYYmti79t/0FOjjkaRX0yFFAszOKxnwlL26I/Z2ylONFZQm+RCfX2AiBwu4KC34Uo9coe+gjY1srNm5Cz00dADPMDYTaRBtvrEIN5+p6MlTmWNGLMTe7AcvyKcyo2ezkjH71b/RKczS0RlIK/OaUiQ7//l3a4UjfaRz/K1YoKkGJndYetx5LEuPigM7tzE4fbJenq9e10XoVyqt2LNyd8YatYULO/yce8B+V5REs4R94C1JxCqZ6YFcH9AhEg0w+95JF/2W2U9IK+tPnQQWIOy8tnCNoQG+C0lN+UarUIUBCogtlp2y3uvEv6YdRBpAOeQkfiCgO1DJYX8HD6OxSuNshiksuFc+XCdOGGPFren0PN8G5e7JDNU+rP4yne1/jA2pDoT1HjPvjuvqqMq4JwfSNCb2YiSSeGWttHrHJaa4INlDsgsYyyVMv/k86fTrxD+dRYUUEwQygGV7tMiAQly4Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(64756008)(55016002)(71200400001)(8676002)(38070700005)(4326008)(508600001)(66446008)(26005)(8936002)(6506007)(38100700002)(9686003)(53546011)(316002)(86362001)(66946007)(66556008)(110136005)(54906003)(52536014)(83380400001)(82960400001)(7696005)(2906002)(76116006)(5660300002)(966005)(122000001)(33656002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2o1Vk5lZ05DZzZ1d1NyLzIvdmZIdTFQcFI3T0NsZXI0aUVPMkdBSjdjKzhQ?=
 =?utf-8?B?NTRoTVN5WUlHcjlBYWI5Tm1xNGg1TkQ2RG81VXRWdTJ5UWRoSXI0b2RjblU0?=
 =?utf-8?B?bEJhNWJVdHIvTUZIQ2Z0R3ZjZ09UZFgzSlhiZlAwVlpoanR5aGxjdnYxVUtM?=
 =?utf-8?B?VHEwbjZ6U0g0RmFvdlM4NEV3L3haSUZqbnR3bTUwTmtOSjljdWZESkV6TlM4?=
 =?utf-8?B?WUYxTEVIaEJmM3lGN3VLUzlsUnBuckl1Y2hMZHdyS3Nmcy9ZVmh3OHJZeDhG?=
 =?utf-8?B?QXFtSVFoT3Q2eVVrcWI2ZjJyQjNOOUlPL0hSU2NBMmROc3BFcDNBOFVmeWY0?=
 =?utf-8?B?WkVVVjVCM05wQzB4ZXNyNkN0VGFPODgzeDRNdVlWbklmY2t6R3NWV1hxcEEv?=
 =?utf-8?B?RjVEZ2lKNUplM25OU0VoTjJ5blJMaW0zOWZ6SWlpRFQ5OWlocWY0cGMvcUJo?=
 =?utf-8?B?NmdLMklXN1lYS2hzekxHYlJnTVdYUDFSSzNEOXAyU0NqNVB4N0Y0b0xLK2xO?=
 =?utf-8?B?bG04ZGdvb0MyZHd1bElscVFkR0tCN29XMHBqVittbHp3TmVYTDNLd0w5R28z?=
 =?utf-8?B?ajd5TmZoQSs4OG9EcDViV1BwREVSNjhYbXczRHdXL29RVC90ekNXSUpkNHA4?=
 =?utf-8?B?ajlGZzh4eDZYRW1oZGR6TWhMckhlZXNiS09NU3ZpOFdpS2xaMGtsenF5SEdx?=
 =?utf-8?B?MjBPbm5SVFI4eElHWWlISVVnWnZGblN4eXJudHNqblI0Tm51S1lHaWRrd2Y3?=
 =?utf-8?B?WlFzUlJVNUFUZWpoQXQ4ZWNWbVdXY2ZyMUJRYW9YWENORWgrVis4Q3VmTWM2?=
 =?utf-8?B?Q1BKbHVKMTZ0VGg1MXVJY01NMWpzbFZoVzF1VmFXb0NOS0pHc094NDFRWmox?=
 =?utf-8?B?c0x0TWw2c2hodkVxb2N2TE9vemRaMDdmRGJaczBTTE5tTWpIeGdnRG5VTGxk?=
 =?utf-8?B?c0RCSGxSR013MDc4ZGNrUVYyTTBTc2RTdDV3MXEwYzNjMm9OVnRQMXJ3ajhU?=
 =?utf-8?B?TTRnQTBlaUJNamlZdDhQUFpSZi9WRXB1L3VYVVJQdUZORkRTV3pRSzBIMjd0?=
 =?utf-8?B?c3RQS0xsTG5JWmVlYmZHeEF4ZjE4NEVxS1BURGwzT2EyYm00Rk1sbEFUVkhW?=
 =?utf-8?B?SHNod29UeWw4bzZ3L1R4c0VMTUlvZmRIbmh1RXdQb2hreWFld2dpQUNVay9q?=
 =?utf-8?B?b1RsSllOSWx5LzllRXgrTGFsNkpFM2xGekc0dGRzZ3dDV0lDb2Z1NlNyU1lx?=
 =?utf-8?B?Z3dxaE5OT0tabjAyWEdFVThoK1cwRjdoa0hnVGhwUXNhOHFMZFNXWWxabUZM?=
 =?utf-8?B?bzBJSW5aQ0E3di9uSHhneDZDa2NrUmRMY3VEYXI4VHVlbGZuZWc4Rk53a2U0?=
 =?utf-8?B?REJTMGdXdjZEQWUvcE9JRFdxekV6VWpYVXVJMEdHcWRKVzBQd3h1TVU0dmVq?=
 =?utf-8?B?MHptM0oyWTN4WlVHYVZrL0phekVlT01ybFZ5YU9HYlBUQzNKNS9maXNzTlZy?=
 =?utf-8?B?UUFRTzRLTUNLRzRQYWpDL3l0TVMyTXU1aVIzSitETitYWEtWMkE1bGt4UXRF?=
 =?utf-8?B?ZVNjeHJ0VDF6bjlzV25sVkwxeHhOTXBtd1AvQTFDY0s5MlpBRUlFL3EzaWdq?=
 =?utf-8?B?N1BiTlB2b2tuUWJkeWVwUmt2ZG4yeHhRR3lTTFN0aHBrTysxTWwvQnQ1eTZI?=
 =?utf-8?B?ODEyWWdwZVpDSjJ2YVdtT1JiekVSYnlWaThMMWhjRGlmRm1qc0NFSHNrbWoz?=
 =?utf-8?B?OFR2emtsZVpid3RjRW0rN1RvOHFLT3JnbVRmS0tzU1VWdHRKdDFYZ1JYa3JQ?=
 =?utf-8?B?Tk1Za3phbDFvSDg4WnVpRWdFcTdmVEFudkJZOE1uemQvMCtQOWNUV24wM1Ax?=
 =?utf-8?B?dFRITnFHTG5BWDJKUzFtTWU1cmVFdTNJanUza3d2Qkp3YmlTT2Q1MmVvaDBu?=
 =?utf-8?B?VkVjM3lJMitMbDQ3Uy8xWlZoL080SzVTQnU4WkV1VVdqdHJVNUsyQjJBbEZE?=
 =?utf-8?B?UVRVcmJIempZZUZvbmVsQU9XV00rZSt4SnNRY3p0UFJLeWtRZnhJUEIzZERs?=
 =?utf-8?B?NnFMWjVOYWtMWFlIemg0WWJ3NlNrc0dCVTBIMG82aUg5anVYMnZMTHZjMFRx?=
 =?utf-8?B?ZllydGVNZEJUai8zTzM0MzNhK1Y4QSt3YTJGVjhLbVRXNHJ5SkRoNFlNR2R2?=
 =?utf-8?Q?t8wrrvf4Fe/6+VT8nGX77So=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a477f8a-68be-4277-3676-08d9a4c0ce24
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2021 03:10:24.8441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pJcrbLmfH3W1cWfChjsZhRsRWLFDcg70t6aLw+akhdlsnzzmBMFGU5j/xdI1gPCOuMjOgkr88KV/BDtkeL+ZMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1839
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88; envelope-from=chen.zhang@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDExLCAyMDIxIDEw
OjUwIEFNDQo+IFRvOiBNYXJrdXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+DQo+IENj
OiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+OyBxZW11LWRldiA8cWVtdS0NCj4g
ZGV2ZWxAbm9uZ251Lm9yZz47IExpIFpoaWppYW4gPGxpemhpamlhbkBjbi5mdWppdHN1LmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSF0gbmV0L2ZpbHRlcjogRW5hYmxlIHRoZSB2bmV0X2hkcl9z
dXBwb3J0IGJ5IGRlZmF1bHQNCj4gDQo+IE9uIFdlZCwgTm92IDEwLCAyMDIxIGF0IDQ6MzYgUE0g
TWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+
ICJaaGFuZywgQ2hlbiIgPGNoZW4uemhhbmdAaW50ZWwuY29tPiB3cml0ZXM6DQo+ID4NCj4gPiA+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4+IEZyb206IE1hcmt1cyBBcm1icnVz
dGVyIDxhcm1icnVAcmVkaGF0LmNvbT4NCj4gPiA+PiBTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVy
IDEwLCAyMDIxIDI6MjEgUE0NCj4gPiA+PiBUbzogWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50
ZWwuY29tPg0KPiA+ID4+IENjOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPjsgcWVt
dS1kZXYgPHFlbXUtDQo+ID4gPj4gZGV2ZWxAbm9uZ251Lm9yZz47IExpIFpoaWppYW4gPGxpemhp
amlhbkBjbi5mdWppdHN1LmNvbT4NCj4gPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBuZXQvZmls
dGVyOiBFbmFibGUgdGhlIHZuZXRfaGRyX3N1cHBvcnQgYnkNCj4gPiA+PiBkZWZhdWx0DQo+ID4g
Pj4NCj4gPiA+PiAiWmhhbmcsIENoZW4iIDxjaGVuLnpoYW5nQGludGVsLmNvbT4gd3JpdGVzOg0K
PiA+ID4+DQo+ID4gPj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+PiA+PiBG
cm9tOiBNYXJrdXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+DQo+ID4gPj4gPj4gU2Vu
dDogV2VkbmVzZGF5LCBOb3ZlbWJlciAxMCwgMjAyMSAxOjA3IFBNDQo+ID4gPj4gPj4gVG86IFpo
YW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4gPiA+PiA+PiBDYzogSmFzb24gV2Fu
ZyA8amFzb3dhbmdAcmVkaGF0LmNvbT47IHFlbXUtZGV2IDxxZW11LQ0KPiA+ID4+ID4+IGRldmVs
QG5vbmdudS5vcmc+OyBMaSBaaGlqaWFuIDxsaXpoaWppYW5AY24uZnVqaXRzdS5jb20+DQo+ID4g
Pj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSF0gbmV0L2ZpbHRlcjogRW5hYmxlIHRoZSB2bmV0X2hk
cl9zdXBwb3J0IGJ5DQo+ID4gPj4gPj4gZGVmYXVsdA0KPiA+ID4+ID4+DQo+ID4gPj4gPj4gWmhh
bmcgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+IHdyaXRlczoNCj4gPiA+PiA+Pg0KPiA+ID4+
ID4+ID4gVGhpcyBwYXRjaCBtYWtlIGZpbHRlcnMgYW5kIGNvbG8tY29tcGFyZSBtb2R1bGUgc3Vw
cG9ydA0KPiA+ID4+ID4+ID4gdm5ldF9oZHIgYnkgZGVmYXVsdC4gQW5kIGFsc28gc3VwcG9ydCAt
ZGV2aWNlIG5vbi12aXJ0aW8tbmV0KGxpa2UNCj4gZTEwMDAuKS4NCj4gPiA+PiA+PiA+IEJ1dCBp
dCBjYW4ndCBhdm9pZCB1c2VyIG1hbnVhbCBjb25maWd1cmF0aW9uIGVycm9yIGJldHdlZW4NCj4g
PiA+PiA+PiA+IGRpZmZlcmVudCBmaWx0ZXJzIHdoZW4gZW5hYmxlL2Rpc2FibGUgdmlydGlvLW5l
dC1wY2kuDQo+ID4gPj4gPj4gPg0KPiA+ID4+ID4+ID4gU2lnbmVkLW9mZi1ieTogWmhhbmcgQ2hl
biA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+DQo+ID4gPj4gPj4NCj4gPiA+PiA+PiBIYXZlIHlvdSBj
b25zaWRlcmVkIGJhY2t3YXJkIGNvbXBhdGliaWxpdHk/ICBDYW4gaXQgYnJlYWsgdXNhZ2UNCj4g
PiA+PiA+PiB0aGF0IG5vdyB3b3Jrcz8NCj4gPiA+PiA+DQo+ID4gPj4gPiBZZXMsIHRoaXMgcGF0
Y2ggZnVsbHkgZ3VhcmFudGVlcyB0aGUgY29tcGF0aWJpbGl0eSBhcyBKYXNvbidzIGNvbW1lbnRz
Lg0KPiA+ID4+ID4gT3JpZ2luYWwgdXNhZ2Ugc3RpbGwgd29ya3MuDQo+ID4gPj4NCj4gPiA+PiBX
b3J0aCBhIGJyaWVmIGV4cGxhbmF0aW9uIGluIHRoZSBjb21taXQgbWVzc2FnZT8NCj4gPiA+DQo+
ID4gPiBPSy4gQWRkIGZvbGxvd2luZyBzdGF0ZW1lbnQgdG8gY29tbWl0IG1lc3NhZ2U6DQo+ID4g
PiBUaGlzIHBhdGNoIG1ha2UgZmlsdGVycyBhbmQgY29sby1jb21wYXJlIG1vZHVsZSBzdXBwb3J0
IHZuZXRfaGRyIGJ5DQo+ID4gPiBkZWZhdWx0LiBBbmQgYWxzbyBzdXBwb3J0IC1kZXZpY2Ugbm9u
LXZpcnRpby1uZXQobGlrZSBlMTAwMC4pLg0KPiA+ID4gQmVjYXVzZSB3aGVuIGVuYWJsZWQgdGhl
IHN1cHBvcnQgd2lsbCBtYWtlIHRoZSB2bmV0X2hkcl9sZW4gZmllbGQNCj4gPiA+IGJlY29tZSBt
dXN0LWRlbGl2ZXJ5IHBhcnQgb2YgZmlsdGVyIHRyYW5zZmVyIHByb3RvY29sKGV2ZW4gMCBpbiB1
c2UNCj4gPiA+IC1kZXZpY2UgZTEwMDApLiBJdCBmdWxseSBndWFyYW50ZWVzIHRoZSBjb21wYXRp
YmlsaXR5IGZvciBtYW5hZ2VtZW50DQo+IGxheWVyIGxpa2UgbGlidmlydC4NCj4gPiA+IEJ1dCBp
dCBzdGlsbCBjYW4ndCBhdm9pZCB1c2VyIG1hbnVhbCBjb25maWd1cmF0aW9uIGVycm9yIGJldHdl
ZW4NCj4gPiA+IGRpZmZlcmVudCBmaWx0ZXJzIGNvbm5lY3RlZCB3aGVuIGVuYWJsZS9kaXNhYmxl
IHZuZXRfaGRyX3N1cHBvcnQuDQo+ID4gPg0KPiA+ID4gSG93IGFib3V0IHRoaXMgZXhwbGFuYXRp
b24/DQo+ID4NCj4gPiBJJ20gZGVmZXJyaW5nIHRvIEphc29uLCBiZWNhdXNlIEkgY2FuJ3QganVk
Z2UgdGhpcyBmb3IgdGVjaG5pY2FsDQo+ID4gYWNjdXJhY3kuDQo+IA0KPiBJIHRoaW5rIGl0IHNo
b3VsZCBiZSBmaW5lLg0KDQpPSywgSSB3aWxsIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UuDQoN
ClRoYW5rcw0KQ2hlbg0KDQo+IA0KPiBUaGFua3MNCj4gDQo+ID4NCj4gPiA+IEJ5IHRoZSB3YXks
IHBsZWFzZSBsZXQgbWUga25vdyB5b3VyIGNvbW1lbnRzIG9uIGZpbHRlciBwYXNzdGhyb3VnaA0K
PiBzZXJpZXM6DQo+ID4gPiBodHRwczovL21haWwuZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1k
ZXZlbC8yMDIxLTA4L21zZzAxMzkzLmh0bWwNCj4gPiA+IElmIE9LLCBJIHdpbGwgdXBkYXRlIGl0
Lg0KPiA+DQo+ID4gVWgsIEkgd2FzIHVuZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQgeW91J2QgcmVz
cGluIHdpdGggbXkgY29tbWVudHMNCj4gPiBhZGRyZXNzZWQgYXMgcGVyIHlvdXIgcmVwbHkgdG8g
bXkgcmV2aWV3Lg0KPiA+DQo+ID4gSXQncyB0b28gbGF0ZSBmb3IgNi4yIG5vdy4gIFN1Z2dlc3Qg
dG8gcmVzcGluLCBhbmQgYWRqdXN0IHRoZSAic2luY2U6Ig0KPiA+IHRhZ3MgdG8gNy4wLg0KPiA+
DQoNCg==

