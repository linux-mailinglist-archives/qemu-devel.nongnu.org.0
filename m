Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BC65FC35F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 12:02:41 +0200 (CEST)
Received: from localhost ([::1]:43932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiYZU-0006WT-FL
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 06:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kai.huang@intel.com>)
 id 1oiYWG-0004Tc-Ew
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:59:20 -0400
Received: from mga09.intel.com ([134.134.136.24]:47351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kai.huang@intel.com>)
 id 1oiYWE-00008a-0L
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:59:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665568758; x=1697104758;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CoRvrgF/ejGKGZp+a8FQTml4bBi1mEZyJ1mXlRGPWkA=;
 b=fEKKyrukoyTlXkHgy9QPsPPJkpIEc+spjRNKV1ya3HAyEWDbiILZjwyG
 58EYEQt8OA50fLEpv6sRANbyONoW9YghXGKzPJz/L/e5dSYEal1ReNoG4
 lR/HLFs7WbwzKBX86SGHlMMKs+B8FrlzV9E36g9G+QDsiBz2NOr37XoZk
 YGH2rK7+YTHgnlkjWTAl2RUPn8+KcgY/EWMGVDBGx+f2nMh0bpHDjnr8C
 x4kcYUB9PxTZYQ5tgIQnZliEKpRSNijQVbq11wwQRaQXVqGhEvFqoF5r5
 e22KgiGGIEHPbvlPM6FEHcMYMd4iVcJdAakBbI537QdqwYLOrhnf/k4lO w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="305810998"
X-IronPort-AV: E=Sophos;i="5.95,178,1661842800"; d="scan'208";a="305810998"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 02:59:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="659875000"
X-IronPort-AV: E=Sophos;i="5.95,178,1661842800"; d="scan'208";a="659875000"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 12 Oct 2022 02:59:09 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 12 Oct 2022 02:59:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 12 Oct 2022 02:59:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 12 Oct 2022 02:59:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 12 Oct 2022 02:59:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STWOeZkYaby8G8vvT6ZcO+eYicQQqBkpAqW57MfxcFqgpjeE+ua+JrhsLKt1bjuC6GP1JqwNr6Y4N56ccQUuGCRSwZljWTWIIzObnvLjTSjalILR0OX7RJB/nTLbTK8/xw8jeRfM10IPOO4lxG4i7aL5qQT2sKRi7G0lUavtHAY96mHdUYyjeq76rlVwxlovXGX+LYa+mclqkO3QgdR4OzSg1+EyDqdeeaOB3X6zKHcoMUoba0l20g4QBWnmSeeb3dW9x+tnJ3S1XkO0yQ+JwrsR/d3lqdyWlCvdo9F40nq7LXpx5po/vDyknvd845XSjOREjOwtoV0VtMYByIZ+dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CoRvrgF/ejGKGZp+a8FQTml4bBi1mEZyJ1mXlRGPWkA=;
 b=LNC4yBGzx0EOKKH1WhZJ0rBOUQfQzURwQRzAF8c8aEYfZLYUXowQf8E7UdydXs1Iu9tKiSYrp1mqZmCd9C1iA5oVwEiS7ibIO/ymSbjq5RKktCYg4LtRWbAF74OX57nX0oxMmiy34YRtAfNr1uSPj2imdSJ/xhDfFkasCe9qKMEIWFq4kkcQActtI6I1rQSj5U1YgGwFDilcfKcxzU9dcLECnIZgdNYTgCOqWr/RXuZtAS4SGuZYhdP32sLEXHVfpL64xWnZrCrukqsTNhYkm8Eg5oxrfvs1hhhJFjZkaOI1KYG5y0UHreisPjhMjIwz8Hda+CynRXoerWIGCZfB8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by CO1PR11MB5108.namprd11.prod.outlook.com (2603:10b6:303:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Wed, 12 Oct
 2022 09:59:04 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::6eb:99bf:5c45:a94b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::6eb:99bf:5c45:a94b%3]) with mapi id 15.20.5676.032; Wed, 12 Oct 2022
 09:59:04 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "Zhong, Yang" <yang.zhong@intel.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "pbonzini@redhat.com" <pbonzini@redhat.com>, "Yang, Weijiang"
 <weijiang.yang@intel.com>, "yang.zhong@linux.intel.com"
 <yang.zhong@linux.intel.com>
Subject: Re: [PATCH] target/i386: Switch back XFRM value
Thread-Topic: [PATCH] target/i386: Switch back XFRM value
Thread-Index: AQHY3hS042J7brQJD0unJ5PY0M7GAK4KhlqA
Date: Wed, 12 Oct 2022 09:59:04 +0000
Message-ID: <3a08ba1b681315cc1062d68f86392bb7d94eb680.camel@intel.com>
References: <20221012082609.922631-1-yang.zhong@intel.com>
In-Reply-To: <20221012082609.922631-1-yang.zhong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|CO1PR11MB5108:EE_
x-ms-office365-filtering-correlation-id: bbe24a24-7283-4198-a396-08daac38657e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VxCdaPiw1AbCr39m1EUme+9gpqnBB8YDrpwt0GMIhfaphtHWxM9vN+qLhzHzdP8BDxT9SXEn1GSGsbLYJFm+rSxkrXm1aynbcwGVO50nVDN8yiEFFdGQlkzUNz5oPvlZszHm9Nm6Xd3h9FhDfDEMuAXTes3HSdDVRba7UPCM763/iAy07J7R4DUB2yGzmXSG9U0rkhWk2Wkx0KyaUZzbVG81KR2Z8MXTKaxLI9Aip8BiiCi7D+hAru6lZ+xiqQ4yUVB8n7b9BSM8CRqgBlpS94JxXNzWKpK3S3F2PyBSbRNaqixbX/Avrs+8ZJROHfRHp66mfzNwRFG4jHVymvLYI8czaOadZypWe6oM8sLmJCPYFMATuJRWlhanUvdjwp1+czAg0Ha/wCNR41MvZ1vdzsi2Zixfv7CY+krb7Hsz6caCfkkm/LU1PgqVzFPV1m0NChtFDWQvKA0tHQ/xRl6XyzyAey+hQGEbQfXXDqhtj23E73TbQh0ck5B4z3ayjAfAdaLE4//yUp8fM3l0yXiLvreguLN70LvXGl9X+2LJAHHiLOSStBPIWIYRVoNVQPP3mTeiQ199SExonUGBP8xR8gA1vwMnU/dMIR+nrfhuX5XAUmv6R51nmj395uhL8a6A8zH1y2pLCp6T2Jf/ZeOCtY+/3oXya/nf9EQZPoPds6CH3csaTwga1hWaXfzuwVfzoW/tnw/p8fiUxszdf5eLuIxaZGVmDfxSynqbL1RIRWpUC8BrecDV/6scP4i6cPIie0y7BZRlDKiIYqDH0s6qLw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5978.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199015)(186003)(2616005)(2906002)(38070700005)(82960400001)(41300700001)(5660300002)(122000001)(38100700002)(4326008)(110136005)(6512007)(26005)(6486002)(8676002)(6506007)(83380400001)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(316002)(8936002)(54906003)(4001150100001)(91956017)(71200400001)(478600001)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ym5PNkFUbjYwTFFkZVNlbjBoMUVoazBISlUrY09xZVA2QzNhNzRGMkpKbUdx?=
 =?utf-8?B?UzhHTG1taVovanh2TkJHOFlaeWxIWVlGa2wwRDRYbDlMQUhJQlFIMERaVjhI?=
 =?utf-8?B?SEJ0L0RBbWtoM29wTHZMdTgwSGh4VlRxOHBhRnhQZW1VVllpTWxPdmd2SEJD?=
 =?utf-8?B?ZDhLRTlFTXlaU0g2M2lzckZiTWRTNlhVOGlFZDd3am1vdnhYTjQwWkdyL1lW?=
 =?utf-8?B?bHI3V0g0aysrYXNzc2pBbFdKTUI4cmJOMHMraFQvckxSQzBQM0tKTmZuU1lo?=
 =?utf-8?B?SlYyOCt0bEs1NC9CVWNoVEtqa1BlZnN0SWljRE1wK1A4YUZvMGx5aitoaGNr?=
 =?utf-8?B?ZllleE4vVlBxSi9hNENsenVwN29tWUYwQUMwOERWTEJNaVRaY2RSSzNMNC9h?=
 =?utf-8?B?aEY5aFJGWGJWRE0wWmZzRW9aM3E4NUVWVUFjem1sNG4rcThrNFRqZUNod0xB?=
 =?utf-8?B?R2grOFh6SzQxRUNPNUVaQm9mdkxWK0loUXNWb3pqemtLQmVWQWVGbElORGxK?=
 =?utf-8?B?Mnlka3VaZk13bDJEb0ZxbDdwbUZZa29yS0VQQjEvNTZOanU1Yk1JZUN2djVU?=
 =?utf-8?B?TEZxemhDTUxwM1BxTTAzRnptTFNwVzRjVDJuZVZSSzNQdjhXUnh3cnBDZ0g3?=
 =?utf-8?B?SkVHY3lRWXBmUFNTSDZUYUdIdHU1eUJoYmNBOFE4L2JpaDZGWUlnbkU5RFFw?=
 =?utf-8?B?cWxsR09DOS9paHk3cXBiN3JuTzEzM29DZXRyaTBLZlFvS0VUNHY0dEtFaEJO?=
 =?utf-8?B?Y2VvaXJ6elZPWWxvZk1SZWgrQ213VXJFdmc3eEsrN21RU2ZkWXlTd1dZcDFv?=
 =?utf-8?B?SnY5aVYzNTA1K3l4eTUyRStaaElWM1JsQVdrK3ZtSk5zSXRtRWp0TzE5Q2I1?=
 =?utf-8?B?SUZQRlFUOHBZbW0vRERvNElUK0Qvc0xEVHpaZ3poRS9vNGVIMTlYbXExNldp?=
 =?utf-8?B?bFIvMm9hZGo4K0NURVA2c2RlcHZoR0FJajNFTGZDSzVzZk02dXQzeFNZQnl1?=
 =?utf-8?B?bElXREFjUUNIS2lxNndXOGhLOENJZGxMU2U3VVdtVjRXMUg1cEpyNUdJR1F2?=
 =?utf-8?B?aXp5ZjYzSUZEYlFaZGg0R0FoRUlMQVczN0d4SWd2aU9QTmhjNis1RVhaUmFl?=
 =?utf-8?B?SzZrTDFRQjNKWGFZSnpRbVRRZVd0enlqeitnRzJCdk5hVHRibGF3TXNZNTdO?=
 =?utf-8?B?bWdnb3BPdmpVekJTL0NhbnNJWGEvODNMeWkyRGVSTmtmaERmVW9GU1hpRnh2?=
 =?utf-8?B?c3FJcnBrVXFhNVk4WlJqNERRNkJkdUdYSTB0SXVONVVuMTV1ZjBVZFhpSHJ3?=
 =?utf-8?B?OCtYeVNlaDZFWVpJRy9KeFZzZzg3SC9Yd3RHZ290VHZIcHRQc3lOQXNHRm1G?=
 =?utf-8?B?d3ZZNFAzbTV1VXJqYk96dzBTeFFQTDMxRWh6bjJockh1REs4Sm1QcndGeCtm?=
 =?utf-8?B?Rjl0QlhLV0daSDlkQWFKYmtlelE2Ujdsc3MzcTZyMjRTaFN2TkdZTFFwNm1u?=
 =?utf-8?B?OHV1RkllWE5XbWxNdjNTRXlrbzIxbk9yZ0JYWDJObU9MUFBBYk5DYnlEMFVi?=
 =?utf-8?B?elpZZmJ5Zm8wSElwQndTYlpYZ1N2UzdZU3hnaUNrRDcybUo0bEI3NFlqZ3Vv?=
 =?utf-8?B?ZnpoYm5mL1g4QW0vZC9YUGJGVk83QmVaVEM5UTJka1FjcUNoMC9yem1GeG92?=
 =?utf-8?B?dXdFQ0VpNDVZSnBmWDh3TGJ0dE1uR3lPNDRJRVBSY0VheFJuVnErRXZ5UnNn?=
 =?utf-8?B?RnJ3V2EyTDhwdGkrbnVKZTRSbFpSeEdXRDFJNEdoYVUxV3gvUVE3dTRvaVpt?=
 =?utf-8?B?TzB6UGtRVWFDYjJEVFRSbXJ4QTgrNDZybWJNM3l6U0NBY0M3NXJ5WENTWXNZ?=
 =?utf-8?B?Q2RCK1RxcnB5aUlxZy9POGhzMENqWWxDUVNjcnpOMVhFTHllUTFRa3YvUDVm?=
 =?utf-8?B?VzZEbDBObU04R0R4c0tUT0FRZFRpa3dPRHhjOWhLOVBjSldHNEcyOHh6V1Zn?=
 =?utf-8?B?Z1E5M0hMajVDLzYrK3BaSzdiWlhQYmcvdmc4aHAwN1NkN3RHSXQ0bXJTeWY3?=
 =?utf-8?B?bzVxTG5ubHZ0MG1oYWNHUzI3K2R0TXRuWGtvRU9NTysrQWg1MEQ2S1pQWlBG?=
 =?utf-8?B?UG4vaVVMRGlxQTlUZDZ6U3ZRNXUreHlSeXNxRUNPWDNBT3pMTnFNc0J4NFd3?=
 =?utf-8?B?S3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <88464CE128C1354190BA59BBEC043FE9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe24a24-7283-4198-a396-08daac38657e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2022 09:59:04.6665 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QvaPrvYTv+pK4NeU+xVUmVipqqe3MfwripmpN6vGQOvOD4bKFzqAjlrXe3o6QsajJg6gLcjHNn05RbHXVG0gwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5108
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24; envelope-from=kai.huang@intel.com;
 helo=mga09.intel.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gV2VkLCAyMDIyLTEwLTEyIGF0IDA0OjI2IC0wNDAwLCBZYW5nIFpob25nIHdyb3RlOg0KPiBU
aGUgcHJldmlvdXMgcGF0Y2ggd3JvbmdseSByZXBsYWNlZCBGRUFUX1hTQVZFX1hDUjBfe0xPfEhJ
fSB3aXRoDQo+IEZFQVRfWFNBVkVfWFNTX3tMT3xISX0gaW4gQ1BVSUQoRUFYPTEyLEVDWD0xKTpF
Q1gsIHdoaWNoIG1hZGUgU0dYDQoJCQkJCQleDQoNCk5pdDogYm90aCBFQ1ggYW5kIEVEWCBhcmUg
d3JvbmdseSBzZXQsIGJ1dCBub3Qgb25seSBFQ1guDQoNCj4gZW5jbGF2ZSBvbmx5IHN1cHBvcnRl
ZCBTU0UgYW5kIHg4NyBmZWF0dXJlKHhmcm09MHgzKS4NCg0KSXMgdGhpcyB0cnVlPyAgUGVyaGFw
cyBJIGFtIG1pc3Npbmcgc29tZXRoaW5nLCBidXQgaXQgc2VlbXMgZW52LQ0KPmZlYXR1cmVzW0ZF
QVRfWFNBVkVfWENSMF9MT10gb25seSBpbmNsdWRlcyBMQlIgYml0LCB3aGljaCBpcyBiaXQgMTUu
DQoNCi8qIENhbGN1bGF0ZSBYU0FWRSBjb21wb25lbnRzIGJhc2VkIG9uIHRoZSBjb25maWd1cmVk
IENQVSBmZWF0dXJlIGZsYWdzICovDQpzdGF0aWMgdm9pZCB4ODZfY3B1X2VuYWJsZV94c2F2ZV9j
b21wb25lbnRzKFg4NkNQVSAqY3B1KQ0KeyAgICANCiAgICAuLi4NCiAgICBlbnYtPmZlYXR1cmVz
W0ZFQVRfWFNBVkVfWFNTX0xPXSA9IG1hc2sgJiBDUFVJRF9YU1RBVEVfWFNTX01BU0s7DQogICAg
Li4uDQp9DQoNCi8qIENQVUlEIGZlYXR1cmUgYml0cyBhdmFpbGFibGUgaW4gWFNTICovDQojZGVm
aW5lIENQVUlEX1hTVEFURV9YU1NfTUFTSyAgICAoWFNUQVRFX0FSQ0hfTEJSX01BU0spDQoNCj4g
DQo+IEZpeGVzOiAzMDFlOTA2NzVjM2YgKCJ0YXJnZXQvaTM4NjogRW5hYmxlIHN1cHBvcnQgZm9y
IFhTQVZFUyBiYXNlZCBmZWF0dXJlcyIpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBZYW5nIFpob25n
IDx5YW5nLnpob25nQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICB0YXJnZXQvaTM4Ni9jcHUu
YyB8IDQgKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90YXJnZXQvaTM4Ni9jcHUuYyBiL3RhcmdldC9pMzg2
L2NwdS5jDQo+IGluZGV4IGFkNjIzZDkxZTQuLjE5YWFlZDg3N2IgMTAwNjQ0DQo+IC0tLSBhL3Rh
cmdldC9pMzg2L2NwdS5jDQo+ICsrKyBiL3RhcmdldC9pMzg2L2NwdS5jDQo+IEBAIC01NTg0LDgg
KzU1ODQsOCBAQCB2b2lkIGNwdV94ODZfY3B1aWQoQ1BVWDg2U3RhdGUgKmVudiwgdWludDMyX3Qg
aW5kZXgsIHVpbnQzMl90IGNvdW50LA0KPiAgICAgICAgICB9IGVsc2Ugew0KPiAgICAgICAgICAg
ICAgKmVheCAmPSBlbnYtPmZlYXR1cmVzW0ZFQVRfU0dYXzEyXzFfRUFYXTsNCj4gICAgICAgICAg
ICAgICplYnggJj0gMDsgLyogZWJ4IHJlc2VydmUgKi8NCj4gLSAgICAgICAgICAgICplY3ggJj0g
ZW52LT5mZWF0dXJlc1tGRUFUX1hTQVZFX1hTU19MT107DQo+IC0gICAgICAgICAgICAqZWR4ICY9
IGVudi0+ZmVhdHVyZXNbRkVBVF9YU0FWRV9YU1NfSEldOw0KPiArICAgICAgICAgICAgKmVjeCAm
PSBlbnYtPmZlYXR1cmVzW0ZFQVRfWFNBVkVfWENSMF9MT107DQo+ICsgICAgICAgICAgICAqZWR4
ICY9IGVudi0+ZmVhdHVyZXNbRkVBVF9YU0FWRV9YQ1IwX0hJXTsNCj4gIA0KPiAgICAgICAgICAg
ICAgLyogRlAgYW5kIFNTRSBhcmUgYWx3YXlzIGFsbG93ZWQgcmVnYXJkbGVzcyBvZiBYU0FWRS9Y
Q1IwLiAqLw0KPiAgICAgICAgICAgICAgKmVjeCB8PSBYU1RBVEVfRlBfTUFTSyB8IFhTVEFURV9T
U0VfTUFTSzsNCg0KVGhlIGNvZGUgbG9va3MgZ29vZDoNCg0KUmV2aWV3ZWQtYnk6IEthaSBIdWFu
ZyA8a2FpLmh1YW5nQGludGVsLmNvbT4NCg0K

