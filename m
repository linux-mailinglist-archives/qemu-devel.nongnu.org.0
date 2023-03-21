Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2765F6C289E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 04:31:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peShS-0005it-KA; Mon, 20 Mar 2023 23:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1peShQ-0005iU-Gz
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 23:30:12 -0400
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1peShN-0004GY-Pb
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 23:30:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679369409; x=1710905409;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7PKH2GLWbGn/4OWex5v250NPBY5njlRY0wV+Vk3Y7Ig=;
 b=dN27KwKBv54d9UiEZ6buWYPh5fieM8NWufT/+m8DDjjIJarhz55DypuE
 ToukiW3oq9IgIsvb3lQdmbq1ZP1rcqUYS7zNcmWbEsw4oMdCqlNsZq5YO
 iMuzFc5zjjPXw75HR2KJ+t3kE5X9Lt/nyyKjV138Jow5ybmvK+68QSFLK
 4XTwH/v/i12KKDZci+AXcJKsNQnnzPHPSixhdlla2W2g/H5d1emlAswAf
 B9mNV6A3Abnz/zOadra5QfFcLdgRoOwuRhoGOwufcFZE5f8n27Gby5ega
 9s2mPUr4Cy0EAAr4NQHyFSOA/gYlw9o50wTxaZqBtUfy2UvyY7T+q24+m Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="341197202"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; d="scan'208";a="341197202"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 20:30:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="805155233"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; d="scan'208";a="805155233"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 20 Mar 2023 20:30:01 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 20:30:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 20 Mar 2023 20:30:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 20 Mar 2023 20:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXCRaPDHGt4cqBARR2egwVTHfwzyZKY+lPwTi7sA0Xl8rcqDkUw3FBmT8XJCPPZnX6731l+71H0PznukOhjc2eV/t2/Y7u4zxLYg+AnRaixHOeUAr1/ixI90WBiYhzw3/TmP0VQs8dT+3ib3IRm1XFnthWEt4zaCKOYjurSzynTnFr4OAANLvtQiQd5Vn5BRnZkTp6IfiTgmCPN4IpmQjKKUBmzSJd59EtAdtAFWtVN1BOAVwUoSKuNaoCzzpslh34v6KUIrOOKw5UQD0+8Ab3fwa/hNEjyny7i8Jc0jU4L/JS3w8soyp6gPeUrCd7ETmlBX4LyQxnVgxgupA21EZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PKH2GLWbGn/4OWex5v250NPBY5njlRY0wV+Vk3Y7Ig=;
 b=ERtTJP3OxhQyqQ4WHrFkLj6dIgriE3pkA4D5xAIZt1i4UO50a1tziLpZcbx6q3EGnUQk+BMD1Ns69+FMA+Au1QlbNto+AY1vOirBQ9VlWCdMHB3G4qT4P8DBZc4XzzQzD51MXzM6Ngo6RHBWhVQRvknYr/ooK1GHXya8H1mCh3Ut+v04VSpRv54X6BD+bcW3dRkaLCJ+4sg74HKtJR2tr75/A6GLwKNdKtsVwHKoI1VHa2SH9tiqdRW8/G3j29Dci1obe11xXR6mTIcr97OxSKLLTILn7GY9ZF5PGrj3H9wN6FKKvwcnSf1cunxrLaTFBdIErwuIXNW2PQmRF82VZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:443::14)
 by SN7PR11MB6798.namprd11.prod.outlook.com (2603:10b6:806:262::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 03:29:58 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::9772:88b6:6667:559]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::9772:88b6:6667:559%3]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 03:29:58 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Erico Nunes <ernunes@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 1/2] ui/gtk: use widget size for cursor motion event
Thread-Topic: [PATCH 1/2] ui/gtk: use widget size for cursor motion event
Thread-Index: AQHZW11nDmafDcRMRkiuLudMXmslka8EkibA
Date: Tue, 21 Mar 2023 03:29:58 +0000
Message-ID: <IA0PR11MB71850EDD187027261A5D260BF8819@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230320160856.364319-1-ernunes@redhat.com>
In-Reply-To: <20230320160856.364319-1-ernunes@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SN7PR11MB6798:EE_
x-ms-office365-filtering-correlation-id: e5038deb-9d5c-4cea-7e31-08db29bc8c11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pjk3V8Bk8lEbeySh3l+xVeNDXgwouToLoJZXRfcfRBfv9krhQ/h2SY6alO9DzvEzC7RU59oZO82KOMDiKdj98Gg5xO+axmxf/bbs/qe+HXPanuzUSQeVDKhbAJGer+e4uL8Bl/6G20JaMAju+vCj8vLyZcmfkBWOCihgVU4zqYC5nf+5aJ0tHlMA0aGuHcZOJsn8DpBoXH7YqlXEZVyrWeMNxGtTeexdbVEpZg54XNdAGJQEDfDsYEwk1tpXfKvgKqtCaIzOd4MW2wuzE2xVe3opATNfRMZZRxkgoWM2qb7H/6nMTOYKT1jSFmZblGeSYv9bUr/qEV3QYfX1J//lEthHpLHGPt9iX33j71O9PpXnIx3j4/ee9ThzlxlAaC6mlEF0SzKzhwNcw0192mmd9pmZTZcQGKPcXYuJTXi0iCjOV0xEf238/bsagCA4PQc0g0zDUZq2HuBRANWR1prsvjTeR+WGsM9t/9t6HNGs39djvgyWF2PyAFP4d/rfepJKVcewcWaB+4YlecY32hPXY/BxEpSn/wv3L7iFpuCLI8SddKqAzSZEnjXiNjHAATIQlijSB9MYxYfxkZnd/Sljc0UAJ9qPgYnjAFLzZs5khTeCnVc7oXMNVm+VELFw8BAaDWK+lxXMlDKliEYbWWdU6tYHZi4dfAt012puizjbRat7LWb8ibsuUcDdU2CK1sCiFp6/zdNikH1r03AUpGhOZA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199018)(38100700002)(71200400001)(7696005)(33656002)(110136005)(8676002)(55016003)(316002)(66946007)(41300700001)(66476007)(76116006)(5660300002)(66556008)(8936002)(64756008)(66446008)(83380400001)(2906002)(52536014)(478600001)(122000001)(82960400001)(86362001)(6506007)(26005)(186003)(38070700005)(966005)(9686003)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVJqdm03NStHZjhBTDl0d3daMDdQczU5VlBVM2ZLRkxyV1RhcVM4R2ZSTXRk?=
 =?utf-8?B?aVo2SjZEVUNiV3NtMnhhV2pHTGJnYVNscVFqU2lHNDk2TWJNM3dZbUlXeEcz?=
 =?utf-8?B?eEFZZWlpYTFNRTlMZVFZRkgzNnFsRlRNa000V0xma0k0NlcvNFY1dFp4bXpC?=
 =?utf-8?B?QkVONmtuaW9Nc0M2dWN0MkcrbTliMFVDUEVwcjRObkFZWUJqTEsycERycEFH?=
 =?utf-8?B?aWFZQmhmM3U1aENycUovVlErUUxlT1U3N1h6ZHNtT2FFR0VOV0lYTmd1Vjdm?=
 =?utf-8?B?VGdMRm5XUEI4cTFra05seTRnUlMxR0NMN0FaYUMxcjB0Vk93QmtmSGhnZkxC?=
 =?utf-8?B?KzhlL2tRZ0pra0NCeitudkpwS2swcnlLdmZQUktuSWhaN3NCUnZwN2lTRDFx?=
 =?utf-8?B?T3JESi9iTUV1YlNmSndqUnMxT2R4aElPTi9pYS9QYUhLRExQY21vQ3VwU0pl?=
 =?utf-8?B?blNjNXpGVC9mNXJPNkJZVndlU3FwaVhlckNuRTZ4bE9aQ2JoMzZCNnhhdENR?=
 =?utf-8?B?ajBGdm1LMklmZTBDbmxVcDkydjlIanN6ek1UWWlrcFY3NC8wZjE5RWl1RHF1?=
 =?utf-8?B?U0sxekhCOEJENW1YN3ZwRytDbHpmTy9MK281cHoxTEVpalhGbEIxWWMyL2Js?=
 =?utf-8?B?Nnc5ZE5vTUlmLzM2d1loZ3M0Mml0RU10Vkt4V0Q2VG9zTEtPN2RWTjIyZ0pw?=
 =?utf-8?B?eWJSVFFiczZmUjYybVNybzJBK3lXOUxMbUcvWXc5eWM0K1hkWE5lWTkvRzIw?=
 =?utf-8?B?eTVFNk52RFZtOGVIcmh5YTlUWWFSK2JQSXBpZ2lWNWxLTGNsMWwvYXFwc2Zp?=
 =?utf-8?B?U3o4Sm1abUNNTHAySGQ1Q25BQldFYUdBc3dkRnRFN3JaUyszck1SM3hpTEFy?=
 =?utf-8?B?Sk1IcmQyYlVqRFViM0V4Z1l6UWtkZ2Z5WGd0cVZMOWZrMHc4eTFLZTlwdUQ3?=
 =?utf-8?B?UmtDek5LcHNOQjc5N1ErRzFLWVh3Q01iY1oyME41bEFNTjJ3TkxCS0UxbzlK?=
 =?utf-8?B?UVhTVklPRW1IT3hPbVdwVWtpdnBINUFZc1pFRGs1RjdaZlJaeEZCOEEwb0FK?=
 =?utf-8?B?MkpSaDZEbEpJOC80SEh1dCs2VVBGSVg0Rk1wOWE4TVlyckdvYmNHQW9VNWlr?=
 =?utf-8?B?THZ2UFowK3p1MytvTzFxd0h6MEo0cGljVW1nSE9FZVlJU0EzcmppaWVRUEVp?=
 =?utf-8?B?V1pHN3JOc2hvUjV4T2VHYWhkZVVhellPZnlVSkNKZVc1NGxUdFlrUFpIaVp6?=
 =?utf-8?B?Qlp0Y2JTaFdaU1p5NCtmYkVmd3VkN0VLWVhJejlmRHljaUY4RkJUaFdHOWNW?=
 =?utf-8?B?Q2ZDeDg3OSs5dFk0aytOWjBkSm0vWi8veURucDNnMENTT0VneExNNlBCT3FZ?=
 =?utf-8?B?WkdTb2NxSzFOOTZ6UGd1b1ljQ21hTi9XK3cxTjlUSXo5QmlxZFNnYW93ZGtu?=
 =?utf-8?B?WVBSV0ZEbDd3aXgvbVRiTDE1SHcvUURyN2ltdm94Zlc2MHpXTHJFMi91NVhs?=
 =?utf-8?B?Z0dGU3d5WXRMNXNtRFBQamhPMFpqcVkvbnhXK3A3SXo0SHUzSWFmVmhDS21p?=
 =?utf-8?B?STNlbmhETVdYdktlWGFyWjE2Ny9oZFZnVUUwWUNEK1hpMXZWMW1mb3lWRG93?=
 =?utf-8?B?czNUYzkvOG5tdFZSelpTM0JOaEF5cms3bE1PaXoyUWd6aHBwSWZFVHJHbE5L?=
 =?utf-8?B?cC96bmdxN0greVBCVmVsZ0s4azZsTDBqdFBkMWxrbXZHNXc0RVlZV0VpYnVX?=
 =?utf-8?B?am9Pb2NZZDFpUVNJZ0pzYWVoMGpPdDMvYzVHRWFvdmsydVl2Y0FMcHdoZDBK?=
 =?utf-8?B?TWQ3aGp3c09UTGZ3MitZbFB4Vm1sSXRkL0lIckowT1JqcUJoaW5yZTBaY3dG?=
 =?utf-8?B?QTQ4dVVoN1VBNDh6QU5qaGJsTElQZjBhTS94dHpyZnRwUXVoZTF0dW9xWitS?=
 =?utf-8?B?YnowdzFQMDlEZks5NG42NlhrRlVhcFNJOVVDT05SUjhNMmdXbGN4ZlNKVWJo?=
 =?utf-8?B?Z2Z0UGkrWnJyRE9IdHhWWi91QlFNSk01NHdIbzVWdkJPM3BsVGxhYjErd2h0?=
 =?utf-8?B?c1BJeHRBMlp3RFIzN2x4SUJxZTlCblhLdTdML0hvSFJtcS9NaCsrODhLVWdD?=
 =?utf-8?B?V0RtRlIwbkpxRkdYM3FLRFhjU01YWGlQRWpCTTI3N1pmY3ZzYmdXbzdvWi9j?=
 =?utf-8?B?a2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5038deb-9d5c-4cea-7e31-08db29bc8c11
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2023 03:29:58.3291 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QRSpe8yVnw8JzSoSCmfvRdgTkLMToiztnt4UJj7K6x005EbunFD/8X+i5m2ZgvuR1vaNBiCGAWl66yU/V/U8iiH9jPfvpIc8/CtP0JsYfJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6798
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=vivek.kasireddy@intel.com; helo=mga03.intel.com
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

SGkgRXJpY28sDQoNCj4gDQo+IFRoZSBnZF9tb3Rpb25fZXZlbnQgc2l6ZSBoYXMgc29tZSBjYWxj
dWxhdGlvbnMgZm9yIHRoZSBjdXJzb3IgcG9zaXRpb24sDQo+IHdoaWNoIGFsc28gdGFrZSBpbnRv
IGFjY291bnQgdGhpbmdzIGxpa2UgZGlmZmVyZW50IHNpemUgb2YgdGhlDQo+IGZyYW1lYnVmZmVy
IGNvbXBhcmVkIHRvIHRoZSB3aW5kb3cgc2l6ZS4NCj4gVGhlIHVzZSBvZiB3aW5kb3cgc2l6ZSBt
YWtlcyB0aGluZ3MgbW9yZSBkaWZmaWN1bHQgdGhvdWdoLCBhcyBhdCBsZWFzdA0KPiBpbiB0aGUg
Y2FzZSBvZiBXYXlsYW5kIGluY2x1ZGVzIHRoZSBzaXplIG9mIHVpIGVsZW1lbnRzIGxpa2UgYSBt
ZW51IGJhcg0KPiBhdCB0aGUgdG9wIG9mIHRoZSB3aW5kb3cuIFRoaXMgbGVhZHMgdG8gYSB3cm9u
ZyBwb3NpdGlvbiBjYWxjdWxhdGlvbiBieQ0KPiBhIGZldyBwaXhlbHMuDQo+IEZpeCBpdCBieSB1
c2luZyB0aGUgc2l6ZSBvZiB0aGUgd2lkZ2V0LCB3aGljaCBhbHJlYWR5IHJldHVybnMgdGhlIHNp
emUNCj4gb2YgdGhlIGFjdHVhbCBzcGFjZSB0byByZW5kZXIgdGhlIGZyYW1lYnVmZmVyLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogRXJpY28gTnVuZXMgPGVybnVuZXNAcmVkaGF0LmNvbT4NCj4gLS0t
DQo+ICB1aS9ndGsuYyB8IDggKysrLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdWkvZ3RrLmMgYi91aS9n
dGsuYw0KPiBpbmRleCBmZDgyZTliMWNhLi5kMWIyYTgwYzJiIDEwMDY0NA0KPiAtLS0gYS91aS9n
dGsuYw0KPiArKysgYi91aS9ndGsuYw0KPiBAQCAtODY4LDcgKzg2OCw2IEBAIHN0YXRpYyBnYm9v
bGVhbiBnZF9tb3Rpb25fZXZlbnQoR3RrV2lkZ2V0ICp3aWRnZXQsDQo+IEdka0V2ZW50TW90aW9u
ICptb3Rpb24sDQo+ICB7DQo+ICAgICAgVmlydHVhbENvbnNvbGUgKnZjID0gb3BhcXVlOw0KPiAg
ICAgIEd0a0Rpc3BsYXlTdGF0ZSAqcyA9IHZjLT5zOw0KPiAtICAgIEdka1dpbmRvdyAqd2luZG93
Ow0KPiAgICAgIGludCB4LCB5Ow0KPiAgICAgIGludCBteCwgbXk7DQo+ICAgICAgaW50IGZiaCwg
ZmJ3Ow0KPiBAQCAtODgxLDEwICs4ODAsOSBAQCBzdGF0aWMgZ2Jvb2xlYW4gZ2RfbW90aW9uX2V2
ZW50KEd0a1dpZGdldCAqd2lkZ2V0LA0KPiBHZGtFdmVudE1vdGlvbiAqbW90aW9uLA0KPiAgICAg
IGZidyA9IHN1cmZhY2Vfd2lkdGgodmMtPmdmeC5kcykgKiB2Yy0+Z2Z4LnNjYWxlX3g7DQo+ICAg
ICAgZmJoID0gc3VyZmFjZV9oZWlnaHQodmMtPmdmeC5kcykgKiB2Yy0+Z2Z4LnNjYWxlX3k7DQo+
IA0KPiAtICAgIHdpbmRvdyA9IGd0a193aWRnZXRfZ2V0X3dpbmRvdyh2Yy0+Z2Z4LmRyYXdpbmdf
YXJlYSk7DQo+IC0gICAgd3cgPSBnZGtfd2luZG93X2dldF93aWR0aCh3aW5kb3cpOw0KPiAtICAg
IHdoID0gZ2RrX3dpbmRvd19nZXRfaGVpZ2h0KHdpbmRvdyk7DQo+IC0gICAgd3MgPSBnZGtfd2lu
ZG93X2dldF9zY2FsZV9mYWN0b3Iod2luZG93KTsNCj4gKyAgICB3dyA9IGd0a193aWRnZXRfZ2V0
X2FsbG9jYXRlZF93aWR0aCh3aWRnZXQpOw0KPiArICAgIHdoID0gZ3RrX3dpZGdldF9nZXRfYWxs
b2NhdGVkX2hlaWdodCh3aWRnZXQpOw0KW0thc2lyZWRkeSwgVml2ZWtdIENvdWxkIHlvdSBwbGVh
c2UgY29uZmlybSBpZiB0aGlzIHdvcmtzIGluIFgtYmFzZWQgY29tcG9zaXRvcg0KZW52aXJvbm1l
bnRzIGFzIHdlbGw/IExhc3QgdGltZSBJIGNoZWNrZWQgKHdpdGggRmVkb3JhIDM2IGFuZCBHbm9t
ZSArIFgpLCB0aGUNCmdldF9hbGxvY2F0ZWRfeHh4IEFQSXMgd2VyZSBub3QgYWNjdXJhdGUgaW4g
WC1iYXNlZCBlbnZpcm9ubWVudHMuIFRoZXJlZm9yZSwNCkkgcmVzdHJpY3RlZCB0aGUgYWJvdmUg
Y2hhbmdlIHRvIFdheWxhbmQtYmFzZWQgZW52aXJvbm1lbnRzIG9ubHk6DQpodHRwczovL2xpc3Rz
Lm5vbmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAyMi0xMS9tc2cwMzEwMC5odG1s
DQoNCg0KVGhhbmtzLA0KVml2ZWsNCg0KPiArICAgIHdzID0gZ3RrX3dpZGdldF9nZXRfc2NhbGVf
ZmFjdG9yKHdpZGdldCk7DQo+IA0KPiAgICAgIG14ID0gbXkgPSAwOw0KPiAgICAgIGlmICh3dyA+
IGZidykgew0KPiAtLQ0KPiAyLjM5LjINCj4gDQoNCg==

