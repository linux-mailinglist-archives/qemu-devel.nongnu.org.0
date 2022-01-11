Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AB848A5AA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 03:32:39 +0100 (CET)
Received: from localhost ([::1]:59544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n76xh-00068w-Qp
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 21:32:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1n76vi-0004ma-2l
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 21:30:36 -0500
Received: from mga04.intel.com ([192.55.52.120]:55267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1n76vd-0000n5-N7
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 21:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641868229; x=1673404229;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IUKIQGAQGEuZfQDnd8w+E5U0BuBgn+dwU6L0TuLOEOk=;
 b=ljf2LbBesCVfaHUOGp24KOB6amBSafJow3gORjHJxVn+tVwKZbcVdyiU
 cMyhuMyT0JQzJtzi4/scBaARWSB8TQpRp46N+lisRjh0AqCtwRtZlnTYS
 EOv+brvDqS0QlGrxKYMWho1opSdAT56K+nXAibh7U8cZ9dW91H+wyRX7P
 8GRAm/DzrtF37R/k31d1a7WSqXjpO5p0GF2gN4L7mzIqiZ6rIfkYqgqKU
 3CKCmxp398+pHUmwLDkb4UqRMOmfZr5v6RSRBPtO67ZN5LtTZJGC5MTTA
 KWx81sb690mY7F7TqfVdMQon6Gu6mG1T79swpZ4XAztscOYunlwjMw7Nf Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="242198113"
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; d="scan'208";a="242198113"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 18:30:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; d="scan'208";a="622898285"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga004.jf.intel.com with ESMTP; 10 Jan 2022 18:30:23 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 10 Jan 2022 18:30:22 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 10 Jan 2022 18:30:22 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 10 Jan 2022 18:30:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I70jo4fUTSstPe3bWcVG2EWgt9gzDzb2GtKk3Zvq8W1SmW9TDxk1Y4SJDrKk2+l5kVL8U3BzgnskWfKPElaxkZrLQ8y8ygvGMDbNunhs1YKGsNUxLqidUrodLfb0l5TgJbvjS5QtqTffbbfYeeC1WOziEyFzpWf42hb7tT1SdNh5sARnJSZBi+dDsXyqIzkm+UEQBiCCpnF+iQ7dFaRcvnup1BOX7D4rLyKuzzv83hnDOFl3ejRVNxLrNTYxe8iaGPdnKvraZxgTcliOETdS98pL1yliC2kyKImAk85lRHJ43kN9fTZ/RoxvcuUzocfXZp6kF9Lnj4m3irh1Xg7fpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUKIQGAQGEuZfQDnd8w+E5U0BuBgn+dwU6L0TuLOEOk=;
 b=hMgcGBFZMc/EYiBcY2ZkONpMCTqsVOXST10v7X0PWIcYlklq4ZX/kj9IEPBT6UhyIxhZQJM3Z3r4m9AzkMK4Nq3uzQbmxABZK1fmXdwlJGoH9p7lqAWzVcY8YD0Wo1R/fwpH9lPM76jgn6FPg4hRA0Qg+62uL0HFnCVSbY9tP+TmLJfgZEM2rIxXy8YeH7nyqpXg6c6o1Mg+mtL8AtpjM/w9vGs9/HNpH/WWERNwaffxrn7m9r84Ha/CSelqvKEUxlBUEzFnwPfFFCseB3MzOkJlGsxX7DBmNHFRlGVckWi+t9rJF6Ajdf5E75RwixrVK4RIPVeW9xZ2tXqv3HRtww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN6PR1101MB2196.namprd11.prod.outlook.com (2603:10b6:405:52::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Tue, 11 Jan
 2022 02:30:19 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04%2]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 02:30:19 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Zeng, Guang" <guang.zeng@intel.com>, "Zhong, Yang"
 <yang.zhong@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [RFC PATCH 6/7] x86: Use new XSAVE ioctls handling
Thread-Topic: [RFC PATCH 6/7] x86: Use new XSAVE ioctls handling
Thread-Index: AQHYA6lrudKRVK0NLkej/6hKJ3aX6axb85QAgAATJACAARgl8A==
Date: Tue, 11 Jan 2022 02:30:19 +0000
Message-ID: <BN9PR11MB52764527D9BD25EAFD54C8888C519@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220107093134.136441-1-yang.zhong@intel.com>
 <20220107093134.136441-7-yang.zhong@intel.com>
 <BN9PR11MB527600E4DD1EA7BE7638A0518C509@BN9PR11MB5276.namprd11.prod.outlook.com>
 <6976bcbe-ba64-3c33-a445-fe29ace41ff3@intel.com>
In-Reply-To: <6976bcbe-ba64-3c33-a445-fe29ace41ff3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8d056d2-0111-4255-0b2c-08d9d4aa4f8d
x-ms-traffictypediagnostic: BN6PR1101MB2196:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR1101MB2196C7DBFCF159B74AD21A5B8C519@BN6PR1101MB2196.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k5+ME4W8YRCk82hgmZX+KInDklgcP8vEPEJ/MWnWWJC1OAQy9vCtnv8yOJCWhk6STtpg4F10pKnU9n2rtlf95SJu4n9t9KD2aPW7mMj6QUXXDLOt5PkloMTIyfa0mUg+RQuYQSxVS2hQkdyCdU7PNu6oFpRYYbyK8nKockekRQYVk/MHxnP4To3D44dTikTPGd0MX7QmLaCNKZxlxhfsrszEW0kt44qtjUWVoWzimaHl/EXLyLjpHz0d5PftCvhIOqNmD0gGvG7T6+FpX9ba4om7g+zEWa6UxrP5rSb7U9A8bx8SpAadIcYcr1yNkMWTxphkpcCR86XMT5FeNCHKNNTC9s8GE8ozaNRp1CXwVb3YRi9u0XBuaPhCkgCXmIWRsyseYEgdPEfOWF1EbdsMAU7ApDMiuTJD04/6U7+Bd8XVKFjAZSz9vqQM0x383AjXSbySb07MSSPMvjilqg3K334I5k4NPuZgsJwTwLcNIYDip+64EOASJe8vALqE4GkylqDLjTojKTT894VD35SXRcFcjz/SwNJMugw4lSUTL+xGBx/oS+mNtRS3DeyuwaubQdzJPyGGaJbzRuKdkTjLB2vWO25hHN3u7vWpdfu5d5lieUVI6IB9VvnZwBK4AiUFIlBTBMKfE7dBtooQX45EtggHyulxxPblGRZghYlftPRwNKzsOnPGJJbZJHNuN2SgSv2/lDbF6cPy/J3bUMUv8Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(76116006)(66946007)(2906002)(82960400001)(71200400001)(54906003)(66446008)(66476007)(64756008)(110136005)(66556008)(122000001)(508600001)(4326008)(55016003)(86362001)(83380400001)(9686003)(52536014)(6506007)(53546011)(26005)(7696005)(186003)(316002)(33656002)(8936002)(5660300002)(38070700005)(38100700002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnBXcUc4N2xia0psSDFFVVBKOUF5SHArejRoeVRldGwwYXpFOFk5ejIwU2tj?=
 =?utf-8?B?eS9JVUhwWFNEc1A0S3J3a1hJdkJNRDdYRVpRVEgyZithK0pGeG5UekxDcHNM?=
 =?utf-8?B?MlBiMURkVTdRQnZnWkY4TEthRXgvZFYwd3Y2amUzb1puKzV0SlVMcXl5Y05n?=
 =?utf-8?B?UUoxNzhMVFdwWUZrL295Q2dWZVFkMGlRMGpqcWJKSlAyQnozSDRNN09HcFFl?=
 =?utf-8?B?dys3RWFpRy9IQVZRdm9qU3dKMkdmY3ltWUVYVnhoc1pxTGRjTlJWaHhZUy9B?=
 =?utf-8?B?MzlsdUg0WCtPSExHZmUxR3p2b3ZDbFFSZENScTJHbGRuY0lNcHQxR0N1Wmgr?=
 =?utf-8?B?cUgvbFNMOHYxejFwbVpHMHhIZng1OStIenp4RGdxQnhKZlZlL0o0UEZUZHpa?=
 =?utf-8?B?S3RPS3ZXdlVMSFIwQThYcXA5YVh3b0o2YUYyUGNNMEhqOTdNcTE2R0pwVGN5?=
 =?utf-8?B?S3EyNi8vV0srRGlQRnhYYXB3Y3IwVjhCRmNjSEUyKzNUeWNWRmdWem1Hcyt0?=
 =?utf-8?B?ZWsxTkRaYXdISzhHZUM0ZWdXcHBESVVDME5pbUx2R1M1MzRObVRyL2V5V0hE?=
 =?utf-8?B?TzVKQ3YybjhhWVdTRWZTYmU1eHRiT21ybVFXd1JxSC9EeWdTRnhIY2VURmFa?=
 =?utf-8?B?eW5mTTJBUXpkbTRxWURGelY5ZUF6S3JBazl2ZmZQOUR5T3hySzBheEJLMlhs?=
 =?utf-8?B?SVBsSGw1ZnBXZ2pYQjY4SUJvTTE4UWdTcCtMK2NvWmRsK0xnN0xmYTFSZGkr?=
 =?utf-8?B?MU5BRjlURGYyVXM0Ri92ZnBnMDhwVEE5Wm5MUUUyQi83aENHVkw3d1oxa0Ns?=
 =?utf-8?B?SDFtaVN5QXNUUTRqUDFVV3FwWjVDZHN0RkhvdTlpdVB2QjM5Z2ZZRVVGU2Mz?=
 =?utf-8?B?dmh1Q1FiMXhwY0VPV1ppTnJXOXRWM3ZiLzFGUzZLWEZJMUI2d0QrT1lhNUcw?=
 =?utf-8?B?S1hLeVVlbUFYYTkvNHZZZDk5THZjNFF5Y1BmT29ROUVnbWNIQ1BWU2R2SEFJ?=
 =?utf-8?B?N2hVVzl6ZG5FaFFSUWVxU0V4QitRYjl2QXEyZXFkc1VuWVgrV0FGdit6eDNj?=
 =?utf-8?B?YzhrZkVBVnR2Mnhwa3h6c2FWUmtEc09qK3NUd3cwSms2bU51ZU5wZC9lakJ5?=
 =?utf-8?B?a3NFU3JpOTBGcmJMYng4cVJZVUFseW5oRTFHU0ZITzV0bFY3S0o4bVhKbUdL?=
 =?utf-8?B?NDdqa0FyWWJjS2d0Qzc0R2c1dURSYW5hT0JHaDFUTmszSTdITlhob2UzM0hm?=
 =?utf-8?B?Y3MrcDFaTVYyQ3hhS21MOXVyUFl0d1dUakZjdm13ZVA4UHp1cmRFdmZQZVZh?=
 =?utf-8?B?UjhTeXk3L092bkRIR1dWbVZ0L3pNMzNORWJNMll3ZittcXBCQlZzemZHNEF5?=
 =?utf-8?B?Y1l2RVNrSmpVQ3dyc3R2Tjlja2MycktMdU90SDlnOWhjWGtJN3hoZEtGbjNF?=
 =?utf-8?B?SFErT2xoOWd3Ri9KZFNMRHgxcWtqZ1Nvck5KOVNtM29tdFNaanhnSW00andX?=
 =?utf-8?B?bjMvbStJSHRTbW1uSisxS3hvdmE2UEtLdTA1YldNbVVRQ01samNKZzFtZWd0?=
 =?utf-8?B?c0lNSE9wMHgzdEZaK2g5Wkp1L01BY2hlVzdZcGgyTWdMVzNNaUtiR1c4ekd4?=
 =?utf-8?B?T0RwcHFUZGFGOFY3ZXRKemlHbDVNc0hMSUdOblIyK3ByOVIxYVBXZ1FiT2ww?=
 =?utf-8?B?N3FvQzFJaXZXL2ZDNlFCUlhBSXgyd0ZNRy85REQ1dVEvcW1WRG5VNFBjWm9a?=
 =?utf-8?B?bjY3UUJZK3NmVzFQaU96dGlQUVVML2hmYmV4SXhzelIzWi9xV1c5dmZCeCs1?=
 =?utf-8?B?Rng0aWNtRFMwc3k1UDZWVG1xMVh3eGh4Qnp4cjhjQlN1ekZWTGhoYUdJN0RJ?=
 =?utf-8?B?UlN2RnJIZlZ3ZzgvdGZNekFWS2tGSW5iN1V4ZkppM0NhS0hsakI3M3dTblpl?=
 =?utf-8?B?VHlvZE53enlxcnl4UGRHY1pZU0ZjVDlJcGppcWZQc1AvZWtFY1Bxd0YxSnAr?=
 =?utf-8?B?TlNtYVBhaFZuL0M2NGdrVUpxZmI2SkJGR0VRTyttMlE3ZGwwUmNnaGlCQjRr?=
 =?utf-8?B?M3ZrdjFVRklOS0RzMFB6aHQ5MlB6dnN1WkZLTDF6d01nQ1JqY1RBSm1Jelk3?=
 =?utf-8?B?UG5qS3F0MklOdHprd2VUY2xubEwxWDlyOGYvVDUycm9WNGdmYnVacGFNZmNY?=
 =?utf-8?Q?gPOrP9KgpiWn9rxJZJxgrtE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d056d2-0111-4255-0b2c-08d9d4aa4f8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 02:30:19.1846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l6iO2S78S/lRJdfkKS2xdGpq/TqUlqzBCXxeipkfsKR5BSW7q1dm180sM6KV91bfwJR7sDb3xheP9MRopMM1KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2196
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120; envelope-from=kevin.tian@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "Wang,
 Wei W" <wei.w.wang@intel.com>,
 "jing2.liu@linux.intel.com" <jing2.liu@linux.intel.com>, "Christopherson, ,
 Sean" <seanjc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBaZW5nLCBHdWFuZyA8Z3VhbmcuemVuZ0BpbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRh
eSwgSmFudWFyeSAxMCwgMjAyMiA1OjQ3IFBNDQo+IA0KPiBPbiAxLzEwLzIwMjIgNDo0MCBQTSwg
VGlhbiwgS2V2aW4gd3JvdGU6DQo+ID4+IEZyb206IFpob25nLCBZYW5nIDx5YW5nLnpob25nQGlu
dGVsLmNvbT4NCj4gPj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDcsIDIwMjIgNTozMiBQTQ0KPiA+
Pg0KPiA+PiBGcm9tOiBKaW5nIExpdSA8amluZzIubGl1QGludGVsLmNvbT4NCj4gPj4NCj4gPj4g
RXh0ZW5kZWQgZmVhdHVyZSBoYXMgbGFyZ2Ugc3RhdGUgd2hpbGUgY3VycmVudA0KPiA+PiBrdm1f
eHNhdmUgb25seSBhbGxvd3MgNEtCLiBVc2UgbmV3IFhTQVZFIGlvY3Rscw0KPiA+PiBpZiB0aGUg
eHN0YXRlIHNpemUgaXMgbGFyZ2UgdGhhbiBrdm1feHNhdmUuDQo+ID4gc2hvdWxkbid0IHdlIGFs
d2F5cyB1c2UgdGhlIG5ldyB4c2F2ZSBpb2N0bHMgYXMgbG9uZyBhcw0KPiA+IENBUF9YU0FWRTIg
aXMgYXZhaWxhYmxlPw0KPiANCj4gDQo+IENBUF9YU0FWRTIgbWF5IHJldHVybiBsZWdhY3kgeHNh
dmUgc2l6ZSBvciAwIHdvcmtpbmcgd2l0aCBvbGQga3ZtDQo+IHZlcnNpb24gaW4gd2hpY2ggaXQn
cyBub3QgYXZhaWxhYmxlLg0KPiBRRU1VIGp1c3QgdXNlIHRoZSBuZXcgeHNhdmUgaW9jdGxzIG9u
bHkgd2hlbiB0aGUgcmV0dXJuIHZhbHVlIG9mDQo+IENBUF9YU0FWRTIgaXMgbGFyZ2VyIHRoYW4g
bGVnYWN5IHhzYXZlIHNpemUuDQoNCkNBUF9YU0FWRTIgIGlzIHRoZSBzdXBlcnNldCBvZiBDQVBf
WFNBVkUuIElmIGF2YWlsYWJsZSBpdCBjYW4gc3VwcG9ydA0KYm90aCBsZWdhY3kgNEsgc2l6ZSBv
ciBiaWdnZXIuDQoNCj4gDQo+ID4+IFNpZ25lZC1vZmYtYnk6IEppbmcgTGl1IDxqaW5nMi5saXVA
aW50ZWwuY29tPg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBaZW5nIEd1YW5nIDxndWFuZy56ZW5nQGlu
dGVsLmNvbT4NCj4gPj4gU2lnbmVkLW9mZi1ieTogV2VpIFdhbmcgPHdlaS53LndhbmdAaW50ZWwu
Y29tPg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBZYW5nIFpob25nIDx5YW5nLnpob25nQGludGVsLmNv
bT4NCj4gPj4gLS0tDQo+ID4+ICAgbGludXgtaGVhZGVycy9hc20teDg2L2t2bS5oIHwgMTQgKysr
KysrKysrKysrKysNCj4gPj4gICBsaW51eC1oZWFkZXJzL2xpbnV4L2t2bS5oICAgfCAgMiArKw0K
PiA+PiAgIHRhcmdldC9pMzg2L2NwdS5oICAgICAgICAgICB8ICA1ICsrKysrDQo+ID4+ICAgdGFy
Z2V0L2kzODYva3ZtL2t2bS5jICAgICAgIHwgMTYgKysrKysrKysrKysrKystLQ0KPiA+PiAgIHRh
cmdldC9pMzg2L3hzYXZlX2hlbHBlci5jICB8IDM1DQo+ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ID4+ICAgNSBmaWxlcyBjaGFuZ2VkLCA3MCBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvbGludXgtaGVhZGVycy9hc20t
eDg2L2t2bS5oIGIvbGludXgtaGVhZGVycy9hc20teDg2L2t2bS5oDQo+ID4+IGluZGV4IDVhNzc2
YTA4ZjcuLjMyZjJhOTIxZTggMTAwNjQ0DQo+ID4+IC0tLSBhL2xpbnV4LWhlYWRlcnMvYXNtLXg4
Ni9rdm0uaA0KPiA+PiArKysgYi9saW51eC1oZWFkZXJzL2FzbS14ODYva3ZtLmgNCj4gPj4gQEAg
LTM3Niw2ICszNzYsMjAgQEAgc3RydWN0IGt2bV9kZWJ1Z3JlZ3Mgew0KPiA+PiAgIC8qIGZvciBL
Vk1fQ0FQX1hTQVZFICovDQo+ID4+ICAgc3RydWN0IGt2bV94c2F2ZSB7DQo+ID4+ICAgCV9fdTMy
IHJlZ2lvblsxMDI0XTsNCj4gPj4gKwkvKg0KPiA+PiArCSAqIEtWTV9HRVRfWFNBVkUyIGFuZCBL
Vk1fU0VUX1hTQVZFIHdyaXRlIGFuZCByZWFkIGFzIG1hbnkNCj4gPj4gYnl0ZXMNCj4gPj4gKwkg
KiBhcyBhcmUgcmV0dXJuZWQgYnkgS1ZNX0NIRUNLX0VYVEVOU0lPTihLVk1fQ0FQX1hTQVZFMikN
Cj4gPj4gKwkgKiByZXNwZWN0aXZlbHksIHdoZW4gaW52b2tlZCBvbiB0aGUgdm0gZmlsZSBkZXNj
cmlwdG9yLg0KPiA+PiArCSAqDQo+ID4+ICsJICogVGhlIHNpemUgdmFsdWUgcmV0dXJuZWQgYnkN
Cj4gPj4gS1ZNX0NIRUNLX0VYVEVOU0lPTihLVk1fQ0FQX1hTQVZFMikNCj4gPj4gKwkgKiB3aWxs
IGFsd2F5cyBiZSBhdCBsZWFzdCA0MDk2LiBDdXJyZW50bHksIGl0IGlzIG9ubHkgZ3JlYXRlcg0K
PiA+PiArCSAqIHRoYW4gNDA5NiBpZiBhIGR5bmFtaWMgZmVhdHVyZSBoYXMgYmVlbiBlbmFibGVk
IHdpdGgNCj4gPj4gKwkgKiBgYGFyY2hfcHJjdGwoKWBgLCBidXQgdGhpcyBtYXkgY2hhbmdlIGlu
IHRoZSBmdXR1cmUuDQo+ID4+ICsJICoNCj4gPj4gKwkgKiBUaGUgb2Zmc2V0cyBvZiB0aGUgc3Rh
dGUgc2F2ZSBhcmVhcyBpbiBzdHJ1Y3Qga3ZtX3hzYXZlIGZvbGxvdw0KPiA+PiArCSAqIHRoZSBj
b250ZW50cyBvZiBDUFVJRCBsZWFmIDB4RCBvbiB0aGUgaG9zdC4NCj4gPj4gKwkgKi8NCj4gPj4g
KwlfX3UzMiBleHRyYVswXTsNCj4gPj4gICB9Ow0KPiA+Pg0KPiA+PiAgICNkZWZpbmUgS1ZNX01B
WF9YQ1JTCTE2DQo+ID4+IGRpZmYgLS1naXQgYS9saW51eC1oZWFkZXJzL2xpbnV4L2t2bS5oIGIv
bGludXgtaGVhZGVycy9saW51eC9rdm0uaA0KPiA+PiBpbmRleCAwMmM1ZTdiN2JiLi45N2Q1YjZk
ODFkIDEwMDY0NA0KPiA+PiAtLS0gYS9saW51eC1oZWFkZXJzL2xpbnV4L2t2bS5oDQo+ID4+ICsr
KyBiL2xpbnV4LWhlYWRlcnMvbGludXgva3ZtLmgNCj4gPj4gQEAgLTExMzAsNiArMTEzMCw3IEBA
IHN0cnVjdCBrdm1fcHBjX3Jlc2l6ZV9ocHQgew0KPiA+PiAgICNkZWZpbmUgS1ZNX0NBUF9CSU5B
UllfU1RBVFNfRkQgMjAzDQo+ID4+ICAgI2RlZmluZSBLVk1fQ0FQX0VYSVRfT05fRU1VTEFUSU9O
X0ZBSUxVUkUgMjA0DQo+ID4+ICAgI2RlZmluZSBLVk1fQ0FQX0FSTV9NVEUgMjA1DQo+ID4+ICsj
ZGVmaW5lIEtWTV9DQVBfWFNBVkUyICAyMDcNCj4gPj4NCj4gPj4gICAjaWZkZWYgS1ZNX0NBUF9J
UlFfUk9VVElORw0KPiA+Pg0KPiA+PiBAQCAtMTU1MCw2ICsxNTUxLDcgQEAgc3RydWN0IGt2bV9z
MzkwX3VjYXNfbWFwcGluZyB7DQo+ID4+ICAgLyogQXZhaWxhYmxlIHdpdGggS1ZNX0NBUF9YU0FW
RSAqLw0KPiA+PiAgICNkZWZpbmUgS1ZNX0dFVF9YU0FWRQkJICBfSU9SKEtWTUlPLCAgMHhhNCwg
c3RydWN0DQo+ID4+IGt2bV94c2F2ZSkNCj4gPj4gICAjZGVmaW5lIEtWTV9TRVRfWFNBVkUJCSAg
X0lPVyhLVk1JTywgIDB4YTUsIHN0cnVjdA0KPiA+PiBrdm1feHNhdmUpDQo+ID4+ICsjZGVmaW5l
IEtWTV9HRVRfWFNBVkUyCQkgIF9JT1IoS1ZNSU8sICAweGNmLCBzdHJ1Y3QNCj4gPj4ga3ZtX3hz
YXZlKQ0KPiA+PiAgIC8qIEF2YWlsYWJsZSB3aXRoIEtWTV9DQVBfWENSUyAqLw0KPiA+PiAgICNk
ZWZpbmUgS1ZNX0dFVF9YQ1JTCQkgIF9JT1IoS1ZNSU8sICAweGE2LCBzdHJ1Y3Qga3ZtX3hjcnMp
DQo+ID4+ICAgI2RlZmluZSBLVk1fU0VUX1hDUlMJCSAgX0lPVyhLVk1JTywgIDB4YTcsIHN0cnVj
dCBrdm1feGNycykNCj4gPj4gZGlmZiAtLWdpdCBhL3RhcmdldC9pMzg2L2NwdS5oIGIvdGFyZ2V0
L2kzODYvY3B1LmgNCj4gPj4gaW5kZXggMjQ1ZThiNWExYS4uNjE1M2M0YWIxYSAxMDA2NDQNCj4g
Pj4gLS0tIGEvdGFyZ2V0L2kzODYvY3B1LmgNCj4gPj4gKysrIGIvdGFyZ2V0L2kzODYvY3B1LmgN
Cj4gPj4gQEAgLTE1MTksNiArMTUxOSwxMSBAQCB0eXBlZGVmIHN0cnVjdCBDUFVYODZTdGF0ZSB7
DQo+ID4+ICAgICAgIFlNTVJlZyB6bW1oX3JlZ3NbQ1BVX05CX1JFR1NdOw0KPiA+PiAgICAgICBa
TU1SZWcgaGkxNl96bW1fcmVnc1tDUFVfTkJfUkVHU107DQo+ID4+DQo+ID4+ICsjaWZkZWYgVEFS
R0VUX1g4Nl82NA0KPiA+PiArICAgIHVpbnQ4X3QgeHRpbGVjZmdbNjRdOw0KPiA+PiArICAgIHVp
bnQ4X3QgeHRpbGVkYXRhWzgxOTJdOw0KPiA+PiArI2VuZGlmDQo+ID4+ICsNCj4gPj4gICAgICAg
Lyogc3lzZW50ZXIgcmVnaXN0ZXJzICovDQo+ID4+ICAgICAgIHVpbnQzMl90IHN5c2VudGVyX2Nz
Ow0KPiA+PiAgICAgICB0YXJnZXRfdWxvbmcgc3lzZW50ZXJfZXNwOw0KPiA+PiBkaWZmIC0tZ2l0
IGEvdGFyZ2V0L2kzODYva3ZtL2t2bS5jIGIvdGFyZ2V0L2kzODYva3ZtL2t2bS5jDQo+ID4+IGlu
ZGV4IDNmYjNkZGJlMmIuLjk3NTIwZTlkZmYgMTAwNjQ0DQo+ID4+IC0tLSBhL3RhcmdldC9pMzg2
L2t2bS9rdm0uYw0KPiA+PiArKysgYi90YXJnZXQvaTM4Ni9rdm0va3ZtLmMNCj4gPj4gQEAgLTE5
ODMsNyArMTk4MywxMiBAQCBpbnQga3ZtX2FyY2hfaW5pdF92Y3B1KENQVVN0YXRlICpjcykNCj4g
Pj4gICAgICAgfQ0KPiA+Pg0KPiA+PiAgICAgICBpZiAoaGFzX3hzYXZlKSB7DQo+ID4+IC0gICAg
ICAgIGVudi0+eHNhdmVfYnVmX2xlbiA9IHNpemVvZihzdHJ1Y3Qga3ZtX3hzYXZlKTsNCj4gPj4g
KyAgICAgICAgdWludDMyX3Qgc2l6ZSA9IGt2bV92bV9jaGVja19leHRlbnNpb24oY3MtPmt2bV9z
dGF0ZSwNCj4gPj4gS1ZNX0NBUF9YU0FWRTIpOw0KPiA+PiArICAgICAgICBpZiAoIXNpemUpIHsN
Cj4gPj4gKyAgICAgICAgICAgIHNpemUgPSBzaXplb2Yoc3RydWN0IGt2bV94c2F2ZSk7DQo+ID4+
ICsgICAgICAgIH0NCj4gPj4gKw0KPiA+PiArICAgICAgICBlbnYtPnhzYXZlX2J1Zl9sZW4gPSBR
RU1VX0FMSUdOX1VQKHNpemUsIDQwOTYpOw0KPiA+PiAgICAgICAgICAgZW52LT54c2F2ZV9idWYg
PSBxZW11X21lbWFsaWduKDQwOTYsIGVudi0+eHNhdmVfYnVmX2xlbik7DQo+ID4+ICAgICAgICAg
ICBtZW1zZXQoZW52LT54c2F2ZV9idWYsIDAsIGVudi0+eHNhdmVfYnVmX2xlbik7DQo+ID4+DQo+
ID4+IEBAIC0yNTgwLDYgKzI1ODUsNyBAQCBzdGF0aWMgaW50IGt2bV9wdXRfeHNhdmUoWDg2Q1BV
ICpjcHUpDQo+ID4+ICAgICAgIGlmICghaGFzX3hzYXZlKSB7DQo+ID4+ICAgICAgICAgICByZXR1
cm4ga3ZtX3B1dF9mcHUoY3B1KTsNCj4gPj4gICAgICAgfQ0KPiA+PiArDQo+ID4+ICAgICAgIHg4
Nl9jcHVfeHNhdmVfYWxsX2FyZWFzKGNwdSwgeHNhdmUsIGVudi0+eHNhdmVfYnVmX2xlbik7DQo+
ID4+DQo+ID4+ICAgICAgIHJldHVybiBrdm1fdmNwdV9pb2N0bChDUFUoY3B1KSwgS1ZNX1NFVF9Y
U0FWRSwgeHNhdmUpOw0KPiA+PiBAQCAtMzI0NywxMCArMzI1MywxNiBAQCBzdGF0aWMgaW50IGt2
bV9nZXRfeHNhdmUoWDg2Q1BVICpjcHUpDQo+ID4+ICAgICAgICAgICByZXR1cm4ga3ZtX2dldF9m
cHUoY3B1KTsNCj4gPj4gICAgICAgfQ0KPiA+Pg0KPiA+PiAtICAgIHJldCA9IGt2bV92Y3B1X2lv
Y3RsKENQVShjcHUpLCBLVk1fR0VUX1hTQVZFLCB4c2F2ZSk7DQo+ID4+ICsgICAgaWYgKGVudi0+
eHNhdmVfYnVmX2xlbiA8PSBzaXplb2Yoc3RydWN0IGt2bV94c2F2ZSkpIHsNCj4gPj4gKyAgICAg
ICAgcmV0ID0ga3ZtX3ZjcHVfaW9jdGwoQ1BVKGNwdSksIEtWTV9HRVRfWFNBVkUsIHhzYXZlKTsN
Cj4gPj4gKyAgICB9IGVsc2Ugew0KPiA+PiArICAgICAgICByZXQgPSBrdm1fdmNwdV9pb2N0bChD
UFUoY3B1KSwgS1ZNX0dFVF9YU0FWRTIsIHhzYXZlKTsNCj4gPj4gKyAgICB9DQo+ID4+ICsNCj4g
Pj4gICAgICAgaWYgKHJldCA8IDApIHsNCj4gPj4gICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4+
ICAgICAgIH0NCj4gPj4gKw0KPiA+PiAgICAgICB4ODZfY3B1X3hyc3Rvcl9hbGxfYXJlYXMoY3B1
LCB4c2F2ZSwgZW52LT54c2F2ZV9idWZfbGVuKTsNCj4gPj4NCj4gPj4gICAgICAgcmV0dXJuIDA7
DQo+ID4+IGRpZmYgLS1naXQgYS90YXJnZXQvaTM4Ni94c2F2ZV9oZWxwZXIuYyBiL3RhcmdldC9p
Mzg2L3hzYXZlX2hlbHBlci5jDQo+ID4+IGluZGV4IGFjNjFhOTYzNDQuLjA5MDQyNGU4MjAgMTAw
NjQ0DQo+ID4+IC0tLSBhL3RhcmdldC9pMzg2L3hzYXZlX2hlbHBlci5jDQo+ID4+ICsrKyBiL3Rh
cmdldC9pMzg2L3hzYXZlX2hlbHBlci5jDQo+ID4+IEBAIC01LDYgKzUsNyBAQA0KPiA+PiAgICNp
bmNsdWRlICJxZW11L29zZGVwLmgiDQo+ID4+DQo+ID4+ICAgI2luY2x1ZGUgImNwdS5oIg0KPiA+
PiArI2luY2x1ZGUgPGFzbS9rdm0uaD4NCj4gPj4NCj4gPj4gICB2b2lkIHg4Nl9jcHVfeHNhdmVf
YWxsX2FyZWFzKFg4NkNQVSAqY3B1LCB2b2lkICpidWYsIHVpbnQzMl90IGJ1ZmxlbikNCj4gPj4g
ICB7DQo+ID4+IEBAIC0xMjYsNiArMTI3LDIzIEBAIHZvaWQgeDg2X2NwdV94c2F2ZV9hbGxfYXJl
YXMoWDg2Q1BVICpjcHUsDQo+IHZvaWQNCj4gPj4gKmJ1ZiwgdWludDMyX3QgYnVmbGVuKQ0KPiA+
Pg0KPiA+PiAgICAgICAgICAgbWVtY3B5KHBrcnUsICZlbnYtPnBrcnUsIHNpemVvZihlbnYtPnBr
cnUpKTsNCj4gPj4gICAgICAgfQ0KPiA+PiArDQo+ID4+ICsgICAgZSA9ICZ4ODZfZXh0X3NhdmVf
YXJlYXNbWFNUQVRFX1hUSUxFX0NGR19CSVRdOw0KPiA+PiArICAgIGlmIChlLT5zaXplICYmIGUt
Pm9mZnNldCkgew0KPiA+PiArICAgICAgICBYU2F2ZVhUSUxFX0NGRyAqdGlsZWNmZyA9IGJ1ZiAr
IGUtPm9mZnNldDsNCj4gPj4gKw0KPiA+PiArICAgICAgICBtZW1jcHkodGlsZWNmZywgJmVudi0+
eHRpbGVjZmcsIHNpemVvZihlbnYtPnh0aWxlY2ZnKSk7DQo+ID4+ICsgICAgfQ0KPiA+PiArDQo+
ID4+ICsgICAgaWYgKGJ1ZmxlbiA+IHNpemVvZihzdHJ1Y3Qga3ZtX3hzYXZlKSkgew0KPiA+PiAr
ICAgICAgICBlID0gJng4Nl9leHRfc2F2ZV9hcmVhc1tYU1RBVEVfWFRJTEVfREFUQV9CSVRdOw0K
PiA+PiArDQo+ID4+ICsgICAgICAgIGlmIChlLT5zaXplICYmIGUtPm9mZnNldCkgew0KPiA+PiAr
ICAgICAgICAgICAgWFNhdmVYVElMRV9EQVRBICp0aWxlZGF0YSA9IGJ1ZiArIGUtPm9mZnNldDsN
Cj4gPj4gKw0KPiA+PiArICAgICAgICAgICAgbWVtY3B5KHRpbGVkYXRhLCAmZW52LT54dGlsZWRh
dGEsIHNpemVvZihlbnYtPnh0aWxlZGF0YSkpOw0KPiA+PiArICAgICAgICB9DQo+ID4+ICsgICAg
fQ0KPiA+PiAgICNlbmRpZg0KPiA+PiAgIH0NCj4gPj4NCj4gPj4gQEAgLTI0Nyw1ICsyNjUsMjIg
QEAgdm9pZCB4ODZfY3B1X3hyc3Rvcl9hbGxfYXJlYXMoWDg2Q1BVICpjcHUsDQo+IGNvbnN0DQo+
ID4+IHZvaWQgKmJ1ZiwgdWludDMyX3QgYnVmbGVuKQ0KPiA+PiAgICAgICAgICAgcGtydSA9IGJ1
ZiArIGUtPm9mZnNldDsNCj4gPj4gICAgICAgICAgIG1lbWNweSgmZW52LT5wa3J1LCBwa3J1LCBz
aXplb2YoZW52LT5wa3J1KSk7DQo+ID4+ICAgICAgIH0NCj4gPj4gKw0KPiA+PiArICAgIGUgPSAm
eDg2X2V4dF9zYXZlX2FyZWFzW1hTVEFURV9YVElMRV9DRkdfQklUXTsNCj4gPj4gKyAgICBpZiAo
ZS0+c2l6ZSAmJiBlLT5vZmZzZXQpIHsNCj4gPj4gKyAgICAgICAgY29uc3QgWFNhdmVYVElMRV9D
RkcgKnRpbGVjZmcgPSBidWYgKyBlLT5vZmZzZXQ7DQo+ID4+ICsNCj4gPj4gKyAgICAgICAgbWVt
Y3B5KCZlbnYtPnh0aWxlY2ZnLCB0aWxlY2ZnLCBzaXplb2YoZW52LT54dGlsZWNmZykpOw0KPiA+
PiArICAgIH0NCj4gPj4gKw0KPiA+PiArICAgIGlmIChidWZsZW4gPiBzaXplb2Yoc3RydWN0IGt2
bV94c2F2ZSkpIHsNCj4gPj4gKyAgICAgICAgZSA9ICZ4ODZfZXh0X3NhdmVfYXJlYXNbWFNUQVRF
X1hUSUxFX0RBVEFfQklUXTsNCj4gPj4gKw0KPiA+PiArICAgICAgICBpZiAoZS0+c2l6ZSAmJiBl
LT5vZmZzZXQpIHsNCj4gPj4gKyAgICAgICAgICAgIGNvbnN0IFhTYXZlWFRJTEVfREFUQSAqdGls
ZWRhdGEgPSBidWYgKyBlLT5vZmZzZXQ7DQo+ID4+ICsNCj4gPj4gKyAgICAgICAgICAgIG1lbWNw
eSgmZW52LT54dGlsZWRhdGEsIHRpbGVkYXRhLCBzaXplb2YoZW52LT54dGlsZWRhdGEpKTsNCj4g
Pj4gKyAgICAgICAgfQ0KPiA+PiArICAgIH0NCj4gPj4gICAjZW5kaWYNCj4gPj4gICB9DQo=

