Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D02BF4478AD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 03:52:27 +0100 (CET)
Received: from [::1] (port=58178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjulm-0003GH-VJ
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 21:52:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mjuk5-0002P0-7j
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 21:50:41 -0500
Received: from mga09.intel.com ([134.134.136.24]:58669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mjuk1-0000Cw-2a
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 21:50:40 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10161"; a="231997215"
X-IronPort-AV: E=Sophos;i="5.87,217,1631602800"; d="scan'208";a="231997215"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2021 18:50:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,217,1631602800"; d="scan'208";a="730953700"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 07 Nov 2021 18:50:32 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 7 Nov 2021 18:50:32 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 7 Nov 2021 18:50:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Sun, 7 Nov 2021 18:50:31 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Sun, 7 Nov 2021 18:50:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltNkAnihi/60NA/xq0Z88VogNTZILxFauOme4hiSdukn5IW9Cr8b2mWT716507A9YQzVXtUk9duEpYD9BVo84iYXKslL8jzQDAFjg7uL8YMt+B1tAQTyK2c85k6DXXpaWA5lhp/n1nXRj7aHDf83lpxTMTgMq5O1MrTUeEZ8+zAH+3vZS8QYGyu0JDUuIloHw+J/2/7RHQ+skWjLOTFjMYR4KxJrIvX+FRmYFxkyCrnPsWtsaJGUF07DVUFH/x3jxgQ1w621iMd7lVjM7OZ/KQcgsvMIhTUfSF8kYquJ+3FUB1YpMWXi7dzTzFHeU1RBc3sNUdrsj7WOA3ed/YHnsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYhMB/pziOI1wR1NRt1aFDayUw0ATdbQTOvtDdjAGSM=;
 b=cn1kC2fCTTElt7PFbf9Jl4PzVCeO9FQk2lW/cT0EjzzRdUjDdKwKL0yNXuJga3g+9UExa+29z1aGkv17Jv3sHPXSgAMe5xD9hGoHaTYw3jNlBCbP3/PVnjSOGMn8qumEH06c+DKGfb6CCVKMbDBrbhlSxUIpzjx3x7Zg0sB9YJVZOkOFD31Ew1PZP5NIuWouaq2VrQ+A20oEh8v3AiW6Bfx7xCGCA6H8QKtFN3B8vjaoN2KvX5R4/hCZ24K6P4JVf1QyU1ack4SFD49uyB8XfD+NFR/cqbWG+btZrZ9QpyQR+IqU9ThYKgdin6wqcHEEOYL+aLCa4AxKIbMCvr3lBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYhMB/pziOI1wR1NRt1aFDayUw0ATdbQTOvtDdjAGSM=;
 b=xrKL8Zd9VNLdGSJT1RAAXuMWxQ303IPxi4DrKYdS/IXHoOnO/JVhHd/6wZqMWzO70BEyY1I5wnaCXu9L35X478yjSFReFDYJ3/+mFVWqGA3W5KH65nvDSDykCwXnRDjTV2Z52Q3PtCL2WrsldUX3r5Dgg0YI7wWV654iWzl7mR0=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MWHPR11MB1277.namprd11.prod.outlook.com (2603:10b6:300:29::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Mon, 8 Nov
 2021 02:50:29 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 02:50:29 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
Thread-Topic: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
Thread-Index: AQHXy9x7gE+VGPrLuEuUpJeh4vPmyavpTZSAgABPWuCABHFUgIAAMzPwgAShnTCAAWxkAIAAAISAgAAMYICAABYMEIAANIUAgAACC2CABFOtAIAAAGiw
Date: Mon, 8 Nov 2021 02:50:29 +0000
Message-ID: <MWHPR11MB00315078A1A7329E96FAA8F79B919@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211028090556.3168043-1-chen.zhang@intel.com>
 <20211028090556.3168043-2-chen.zhang@intel.com>
 <c603b048-1cee-1396-811d-8be857aa932b@redhat.com>
 <MWHPR11MB0031A0311824C3DF060B64E39B879@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsjn0nz4N+O4s9Y0m0gEYXu9WKstP9LHE4F=m5mOR3dcA@mail.gmail.com>
 <MWHPR11MB00315CFF0E7854146B5C9AE69B8A9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <MWHPR11MB0031B626425E7815EB78A9E49B8D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <94f96089-f8a8-d3d4-18c3-26917952fc14@redhat.com>
 <DM5PR11MB00276DF408F0DBC3C6EFADB89B8E9@DM5PR11MB0027.namprd11.prod.outlook.com>
 <CACGkMEvuXhuzSiTebOQqvriD5UnaiPzaY37AOR8bihTC4FTa4Q@mail.gmail.com>
 <DM5PR11MB002701BF07DCC15BF968A1749B8E9@DM5PR11MB0027.namprd11.prod.outlook.com>
 <CACGkMEs5q4E3yK_ZjUQsvJ=Ojd6hmTVEwQeh1N0QDPNaPoM7Dw@mail.gmail.com>
 <MWHPR11MB0031EBF5ACACF7455EA9F4779B8E9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsLF6VUDNgnUngrE4LePkM8pFe3fYrPd2W6O8RUpcprNQ@mail.gmail.com>
In-Reply-To: <CACGkMEsLF6VUDNgnUngrE4LePkM8pFe3fYrPd2W6O8RUpcprNQ@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: fc9c1fb9-536a-4fa7-818b-08d9a26286a2
x-ms-traffictypediagnostic: MWHPR11MB1277:
x-microsoft-antispam-prvs: <MWHPR11MB12772407594F6D77D7C3CE2B9B919@MWHPR11MB1277.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +CNNWEqUe61C/rtopTYIEQUec0uwQxiJBj2hfphu4Zi1ZL0pQBAeOZcfTGbwWd35vv/hokmCs/yqGvDJGyijcslhuUphKdgQU4b4Tv3QjyaWPvjFZQagjbD/mSVT5J7cQo2wo8qib87F5Nj6GXO3ioo6sgdPxGUztmf5rmaekO47vLnKLRr31EF+GwYeL9WUF/zr93uZA9Jny5o7zXHQl+gZRAo3AUipZDmPRrDKTuX9bhv2OBwYb26bkTruNrSedRYf5/suzZYeVxjJ7AAnyzreT6KPBmhpN8Bf3v3MRM0X+vVMUf3l+9IkJJYR0JRHlqUNSj6ZgNVYSjCXMjqtcP0WQjqrfL2BfjUmfEpgws4d+aH40BN+vwN/xbZKi4OCwM4VQ3h7QlVqto0iCaCN1M80tHGZAAvhzPirm83XSXN4Ti6lEdC+KSTZuKx+XDY/fT2nFMO7gnuLNU512ml5elyfT8XapRCml1umLMSalhjIHLiS7HrBvwQSYCc4Pw0NDKUXYKWDh/ZXE/VrSNLmkpoxv9uhI8QVlrITmYCbmbFh5YnQwQ9msUJJpYVnkWaH9NuPRa34Y4jyyoTwSl0AYXw4AUhSpZ04wGVXX5gBjDoxD6UMLpiHD6983tCLGdKFujLj1IP0QbIBtF8x4tQhjbMizhE9ecOAAJxkwtVYEkeH2pzVpsMojmF+Z4nuBsbRSvglT92JqP/wQXq/B7muCw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(83380400001)(82960400001)(8936002)(71200400001)(54906003)(52536014)(5660300002)(38070700005)(8676002)(55016002)(9686003)(186003)(6916009)(316002)(7696005)(86362001)(508600001)(38100700002)(6506007)(53546011)(4326008)(2906002)(122000001)(76116006)(66946007)(33656002)(66476007)(66446008)(64756008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUFjaHQvM3gzY1RYTmdmKzRwSWVXL3pjVWRiN21NK3d2RDNEVWxzcC9KNTV1?=
 =?utf-8?B?R3hCZVQ3QWZrcXBySWxlSTNQQzZMekYrSGJINFgrMVdhMTNFeG82VnBoL1Bn?=
 =?utf-8?B?K2ViVjB5dHRKVlNwdGJVYlZnV2NZUCswc1RuaFlvcDBjajczMTNvZm9YQlBW?=
 =?utf-8?B?MWVJUVhtbk9wQlBld0Vzd05zWVZ0UWZZVEZwNThhelUvNEd3TEROZjVDay83?=
 =?utf-8?B?U0JQZlEvYVR6S3Z0MU9weGhaWVFPOVFWSnFWVkxPdjlQMWxhUEVSaUFEYWg2?=
 =?utf-8?B?ekZMN2pFZm9BTS9XeS9rWXZpdmhUa1RsbTVZSU4xQ3R6MlhOQnEvSTZoS1du?=
 =?utf-8?B?MWlITjRQNXZtSklLMUNVbS8xSCtiYWE2dy9MdmV2K09ZZDA1YTJJczh5TFRM?=
 =?utf-8?B?aEN6UExyRjFWL1VWM3VGR2dlZ1BtcU9EQkdnbTFjb3ptMjNJdG9hdzdGaUJF?=
 =?utf-8?B?THNSaUprL1BWVXdTUVBjQ0pmdUZvQmNaNkxLbUYrbktBWjV5RGx4NTllc2Z0?=
 =?utf-8?B?QUlIdHQ5bDNZd1k4OTN2ZTVtV1lldlkrOXppNU15RStjSHQ3Ky8wNCtUTzRF?=
 =?utf-8?B?UUZXSjJUL1FYandoYlRDZlFMamZMbTY3WE5DZEpjK1NBSUwxMExwdHJiOFhS?=
 =?utf-8?B?YmFFUVpYRXRidDRLTXhTKzRDaDdIdVpUak9INS9JcURnajZCU1dIVWN0bDlW?=
 =?utf-8?B?SU9OTnY1MHNLK2l2d0t3Qm5BdjVnYU4rNDQzeEVrMnNCKy80VzhUSlY4d1o4?=
 =?utf-8?B?ZmZ3Ti9GYzJrbXV2NWZkVXpVM0xDaEJ2RFhwbTViRS9OalgrM3RCRTU5Q05V?=
 =?utf-8?B?RFcvOUlWdzE1WWRTZmtwdmViUjhxOGZITmpucXczMEtLL01kMGcvdzJmdFIx?=
 =?utf-8?B?QXlzRURrNHhNbENuNlZCZnhWemhLbm9kSXFRQ2xUdDFpMTFFUkNDWnRYL1Zy?=
 =?utf-8?B?em8zTk5MSnBvOE1jQ0tpdldNSThwNUNCa0svdkNKQ2h6NG9YQmplRGZuUUdY?=
 =?utf-8?B?bnQ3emdSNTRvQ0FLaWlJSllVZjc1UGZkMmtvUFJBaDU4UUpXdWlESndmV2s4?=
 =?utf-8?B?SnFrN2tmWWtlTEtINS9RVHNNa1FoZ0RMeVBHeUJDZUZuemxLR3kyL1lPVlh6?=
 =?utf-8?B?WW9GRHBGaGxqWnNLTFFyak1MQjZkdjNjL3dSQTR1bmo4Q2UzaWpTdUcvNURy?=
 =?utf-8?B?ZWlldnV1WFdnZmZndjVzRUFGTW9VS2dORjJyRUVHc3k3U1A1aTZBaGhVcFBH?=
 =?utf-8?B?eTUrVVNwQUt1dzAvZHQ2YjFIRkwxR1QwNGJmUFBYQWphcHdtVHdNbjNvN2lE?=
 =?utf-8?B?YVp6RG5hN290NTIzOCtPTXVnV2ZjMzEzcFI4Zmc5dWc1Q1pwdUV2MGZkVGRS?=
 =?utf-8?B?b0c0Z3lpMGtKQU9WVDI4dmF3Tm9qNUNXM0t1STRTYndJRHVFTHRuN1Z1eFlB?=
 =?utf-8?B?Z3hNUGg5OWhjSkphU3Iycm9lbkcwcGw0UzZEVmRsNFNDNk8rYSsxYVltQmIv?=
 =?utf-8?B?VnFhTlFPTCs4QVhoZ3NRaDVMY2lMb3hLdWdpcGpha3RNSWVPSkY2NkxZY1JY?=
 =?utf-8?B?VjVQaWFJWEJqRGpoeldOVnlBUkVRTjJEbVlPWUVuYml0UEJvUkpiL3J2U25E?=
 =?utf-8?B?NTBRK1BOcUtFVTg0M21yb3lpQ0ZVaWlMMGtvVWo2cTNRM2JCbFF2d2hPQWo1?=
 =?utf-8?B?Q2tlcW5xYnYrTm5lbnBQM0hXUFBwcSsvbDVjcVMwanpGckRSY0VaeG9pMUNo?=
 =?utf-8?B?SjljZ3hld1NoRzM4aGVDV3FYcXEwMjhjVmY3SDhDdzExVUFNSUNwSUhmYlBh?=
 =?utf-8?B?UWd0TDl5bDJxNWNDQ2t3aVZFdUtCM3hWNktYTWk1SGdVdFEzT0R2a0IxUmFn?=
 =?utf-8?B?d2JXVVdBYmR1YVF3d1lSNjZCajBUaVFaeVNuT1o3bE9hMmxLSDhuNU54WGJL?=
 =?utf-8?B?c0NMNGhhMW5oKzF6L0xFVzV6cUtOOGp0SjY0cW8zanNyMDl1Ri8vWk5JdTlE?=
 =?utf-8?B?dE05Vm5Lc2U4M2M4MDN4MWVFY1A1T2pGRFFIY1dBWGdVNGlHbEZINVNNYWJ4?=
 =?utf-8?B?NnNBeHk5QWVWSUlaS0hmd1B6dlRFV0l5S2Vna2VQMCtYMFJLNXhSOXdYdmJx?=
 =?utf-8?B?Q2t1WUFJRXN4eittSitqa3lXUDR3bEYyN2dQWXRHTmNLMzd2MVhqODB0b0JN?=
 =?utf-8?Q?GoIgoHQ1RdKVO7XUhj/BHLE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9c1fb9-536a-4fa7-818b-08d9a26286a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2021 02:50:29.7938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W3xdBSem6CP96GjZ4w3oXSyZ6UaJ+fP59szSm1KwIJzrh4Ye1M6G/Z8DPgq/nJIuJvuYKh/KVaB+Km6eXluBeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1277
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24; envelope-from=chen.zhang@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciA4LCAyMDIxIDEwOjQy
IEFNDQo+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+DQo+IENjOiBNYXJr
dXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+OyBxZW11LWRldiA8cWVtdS0NCj4gZGV2
ZWxAbm9uZ251Lm9yZz47IExpIFpoaWppYW4gPGxpemhpamlhbkBjbi5mdWppdHN1LmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCBWNSAxLzNdIG5ldC9maWx0ZXI6IE9wdGltaXplIHRyYW5zZmVy
IHByb3RvY29sIGZvciBmaWx0ZXItDQo+IG1pcnJvci9yZWRpcmVjdG9yDQo+IA0KPiBPbiBGcmks
IE5vdiA1LCAyMDIxIGF0IDQ6NDMgUE0gWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29t
PiB3cm90ZToNCj4gPg0KPiA+DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4gPiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiA+ID4gU2Vu
dDogRnJpZGF5LCBOb3ZlbWJlciA1LCAyMDIxIDQ6MzAgUE0NCj4gPiA+IFRvOiBaaGFuZywgQ2hl
biA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+DQo+ID4gPiBDYzogTWFya3VzIEFybWJydXN0ZXIgPGFy
bWJydUByZWRoYXQuY29tPjsgcWVtdS1kZXYgPHFlbXUtDQo+ID4gPiBkZXZlbEBub25nbnUub3Jn
PjsgTGkgWmhpamlhbiA8bGl6aGlqaWFuQGNuLmZ1aml0c3UuY29tPg0KPiA+ID4gU3ViamVjdDog
UmU6IFtQQVRDSCBWNSAxLzNdIG5ldC9maWx0ZXI6IE9wdGltaXplIHRyYW5zZmVyIHByb3RvY29s
DQo+ID4gPiBmb3IgZmlsdGVyLSBtaXJyb3IvcmVkaXJlY3Rvcg0KPiA+ID4NCj4gPiA+IE9uIEZy
aSwgTm92IDUsIDIwMjEgYXQgMToyOSBQTSBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5j
b20+DQo+IHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiA+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+ID4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dh
bmdAcmVkaGF0LmNvbT4NCj4gPiA+ID4gPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDUsIDIwMjEg
MTI6MDMgUE0NCj4gPiA+ID4gPiBUbzogWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29t
Pg0KPiA+ID4gPiA+IENjOiBNYXJrdXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+OyBx
ZW11LWRldiA8cWVtdS0NCj4gPiA+ID4gPiBkZXZlbEBub25nbnUub3JnPjsgTGkgWmhpamlhbiA8
bGl6aGlqaWFuQGNuLmZ1aml0c3UuY29tPg0KPiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
VjUgMS8zXSBuZXQvZmlsdGVyOiBPcHRpbWl6ZSB0cmFuc2Zlcg0KPiA+ID4gPiA+IHByb3RvY29s
IGZvciBmaWx0ZXItIG1pcnJvci9yZWRpcmVjdG9yDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBPbiBG
cmksIE5vdiA1LCAyMDIxIGF0IDExOjI3IEFNIFpoYW5nLCBDaGVuDQo+ID4gPiA+ID4gPGNoZW4u
emhhbmdAaW50ZWwuY29tPg0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4N
Cj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gPiA+ID4gPiA+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+ID4g
PiA+ID4gPiA+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgNSwgMjAyMSAxMToxNyBBTQ0KPiA+ID4g
PiA+ID4gPiBUbzogWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPjsgTWFya3VzIEFy
bWJydXN0ZXINCj4gPiA+ID4gPiA+ID4gPGFybWJydUByZWRoYXQuY29tPg0KPiA+ID4gPiA+ID4g
PiBDYzogcWVtdS1kZXYgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz47IExpIFpoaWppYW4NCj4gPiA+
ID4gPiA+ID4gPGxpemhpamlhbkBjbi5mdWppdHN1LmNvbT4NCj4gPiA+ID4gPiA+ID4gU3ViamVj
dDogUmU6IFtQQVRDSCBWNSAxLzNdIG5ldC9maWx0ZXI6IE9wdGltaXplIHRyYW5zZmVyDQo+ID4g
PiA+ID4gPiA+IHByb3RvY29sIGZvciBmaWx0ZXItIG1pcnJvci9yZWRpcmVjdG9yDQo+ID4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IOWcqCAyMDIxLzExLzQg5LiL5Y2I
MTozNywgWmhhbmcsIENoZW4g5YaZ6YGTOg0KPiA+ID4gPiA+ID4gPiA+Pj4+Pg0KPiA+ID4gPiA+
ID4gPiA+Pj4+PiBJIHdvbmRlciBpZiB3ZSBuZWVkIHRvIGludHJvZHVjZSBuZXcgcGFyYW1ldGVy
LCBlLmcNCj4gPiA+ID4gPiA+ID4gPj4+Pj4gZm9yY2Vfdm5ldF9oZHIgaGVyZSwgdGhlbiB3ZSBj
YW4gYWx3YXlzIHNlbmQgdm5ldF9oZHINCj4gPiA+IHdoZW4NCj4gPiA+ID4gPiA+ID4gPj4+Pj4g
aXQNCj4gPiA+ID4gPiBpcyBlbmFibGVkLg0KPiA+ID4gPiA+ID4gPiA+Pj4+Pg0KPiA+ID4gPiA+
ID4gPiA+Pj4+PiBPdGhlcndpc2UgdGhlICJ2bmV0X2hkcl9zdXBwb3J0IiBzZWVtcyBtZWFuaW5n
bGVzcy4NCj4gPiA+ID4gPiA+ID4gPj4+PiBZZXMsIEN1cnJlbnQgInZuZXRfaGRyX3N1cHBvcnQi
ICBkZWZhdWx0IGVuYWJsZWQsIGFuZA0KPiA+ID4gPiA+ID4gPiA+Pj4+IHZuZXRfaGRyX2xlbg0K
PiA+ID4gPiA+ID4gPiA+Pj4gYWxyZWFkeSBmb3JjZWQgZnJvbSBhdHRhY2hlZCBuZi0+bmV0ZGV2
Lg0KPiA+ID4gPiA+ID4gPiA+Pj4+IE1heWJlIHdlIGNhbiBpbnRyb2R1Y2UgYSBuZXcgcGFyYW1l
dGVyDQo+ID4gPiAiZm9yY2Vfbm9fdm5ldF9oZHIiDQo+ID4gPiA+ID4gaGVyZQ0KPiA+ID4gPiA+
ID4gPiB0bw0KPiA+ID4gPiA+ID4gPiA+Pj4gbWFrZSB0aGUgdm5ldF9oZHJfbGVuIGFsd2F5cyBr
ZWVwIDAuDQo+ID4gPiA+ID4gPiA+ID4+Pj4gSWYgeW91IHRoaW5rIE9LLCBJIHdpbGwgdXBkYXRl
IGl0IGluIG5leHQgdmVyc2lvbi4NCj4gPiA+ID4gPiA+ID4gPj4+IExldCBtZSBleHBsYWluLCBp
ZiBJIHdhcyBub3Qgd3Jvbmc6DQo+ID4gPiA+ID4gPiA+ID4+Pg0KPiA+ID4gPiA+ID4gPiA+Pj4g
InZuZXRfaGRyX3N1cHBvcnQiIG1lYW5zIHdoZXRoZXIgb3Igbm90IHRvIHNlbmQgdm5ldA0KPiA+
ID4gPiA+ID4gPiA+Pj4gaGVhZGVyDQo+ID4gPiA+ID4gbGVuZ3RoLg0KPiA+ID4gPiA+ID4gPiA+
Pj4gSWYgdm5ldF9oZHJfc3VwcG9ydD1mYWxzZSwgd2Ugd29uJ3Qgc2VuZCB0aGUgdm5ldCBoZWFk
ZXIuDQo+ID4gPiA+ID4gPiA+ID4+PiBUaGlzIGxvb2tzIHRoZSBzYW1lIGFzIHlvdSAiZm9yY2Vf
bm9fdmVudF9oZHIiIGFib3ZlLg0KPiA+ID4gPiA+ID4gPiA+PiBZZXMsIEl0IHdhcy4gIEJ1dCB0
aGlzIHNlcmllcyBjaGFuZ2VkIGl0Lg0KPiA+ID4gPiA+ID4gPiA+PiBDdXJyZW50ICJ2bmV0X2hk
cl9zdXBwb3J0IiBjYW4ndCBkZWNpZGUgd2hldGhlciBzZW5kIHZuZXQNCj4gPiA+ID4gPiA+ID4g
Pj4gaGVhZGVyIGxlbmd0aCwgd2UgYWx3YXlzIHNlbmQgaXQgZXZlbiAwLg0KPiA+ID4gPiA+ID4g
PiA+PiBJdCB3aWxsIGF2b2lkIHNlbmRlci9yZWNlaXZlciB0cmFuc2ZlciBwcm90b2NvbCBwYXJz
ZSBpc3N1ZXM6DQo+ID4gPiA+ID4gPiA+ID4+IFdoZW4gc2VuZGVyIGRhdGEgd2l0aCB0aGUgdm5l
dCBoZWFkZXIgbGVuZ3RoLCBidXQNCj4gPiA+ID4gPiA+ID4gPj4gcmVjZWl2ZXIgY2FuJ3QgZW5h
YmxlIHRoZSAidm5ldF9oZHJfc3VwcG9ydCIuDQo+ID4gPiA+ID4gPiA+ID4+IEZpbHRlcnMgd2ls
bCBhdXRvIHNldHVwIHZuZXRfaGRyX2xlbiBhcyBsb2NhbCBuZi0+bmV0ZGV2DQo+ID4gPiA+ID4g
PiA+ID4+IGFuZCBmb3VuZCB0aGUgaXNzdWUgd2hlbiBnZXQgZGlmZmVyZW50IHZuZXRfaGRyX2xl
biBmcm9tDQo+ID4gPiA+ID4gPiA+ID4+IG90aGVyDQo+ID4gPiBmaWx0ZXJzLg0KPiA+ID4gPiA+
ID4gPiA+Pg0KPiA+ID4gPiA+ID4gPiA+Pj4gQW5kIG15ICJmb3JjZV92bmV0X2hkciIgc2VlbXMg
ZHVwbGljYXRlZCB3aXRoDQo+ID4gPiA+ID4gPiA+IHZuZXRfaGRyX3N1cHBvcnQ9dHJ1ZS4NCj4g
PiA+ID4gPiA+ID4gPj4+IFNvIGl0IGxvb2tzIHRvIG1lIHdlIGNhbiBsZWF2ZSB0aGUgbWlycm9y
IGNvZGUgYXMgaXMgYW5kDQo+ID4gPiA+ID4gPiA+ID4+PiBqdXN0IGNoYW5nZSB0aGUgY29tcGFy
ZT8gKGRlcGVuZHMgb24gdGhlIG1nbXQgdG8gc2V0IGENCj4gPiA+ID4gPiA+ID4gPj4+IGNvcnJl
Y3QNCj4gPiA+ID4gPiA+ID4gPj4+IHZuZXRfaGRyX3N1cHBvcnQpDQo+ID4gPiA+ID4gPiA+ID4+
IE9LLCBJIHdpbGwga2VlcCB0aGUNCj4gPiA+ID4gPiA+ID4gPj4gZmlsdGVyLW1pcnJvci9maWx0
ZXItcmVkaXJlY3Rvci9maWx0ZXItcmV3cml0ZXINCj4gPiA+ID4gPiA+ID4gPj4gc2FtZSBhcyB0
aGlzIHZlcnNpb24uDQo+ID4gPiA+ID4gPiA+ID4+IEZvciB0aGUgY29sby1jb21wYXJlIG1vZHVs
ZSwgSXQgd2lsbCBnZXQgcHJpbWFyeSBub2RlJ3MNCj4gPiA+ID4gPiA+ID4gPj4gZmlsdGVyIGRh
dGEncyB2bmV0X2hkcl9sZW4gYXMgdGhlIGxvY2FsIHZhbHVlLCBBbmQNCj4gPiA+ID4gPiA+ID4g
Pj4gY29tcGFyZSB3aXRoIHNlY29uZGFyeSBub2RlJ3MsIGJlY2F1c2UgaXQgaXMgbm90IGF0dGFj
aGVkIGFueQ0KPiBuZi0+bmV0ZGV2Lg0KPiA+ID4gPiA+ID4gPiA+PiBTbywgaXQgbG9va3MgY29t
cGFyZSBtb2R1bGUncyAidm5ldF9oZHJfc3VwcG9ydCIgYmVlbg0KPiA+ID4gPiA+ID4gPiA+PiBh
dXRvIGNvbmZpZ3VyYXRpb24gZnJvbSB0aGUgZmlsdGVyIHRyYW5zcG9ydCBwcm90b2NvbC4NCj4g
PiA+ID4gPiA+ID4gPj4gSWYgdGhlICJmb3JjZV92bmV0X2hkciIgbWVhbnMgaGFyZCBjb2RlIGEg
Y29tcGFyZSdzIGxvY2FsDQo+ID4gPiA+ID4gPiA+ID4+IHZuZXRfaGRyX2xlbiByYXRoZXIgdGhh
biBjb21lIGZyb20gaW5wdXQgZmlsdGVyJ3MgZGF0YT8NCj4gPiA+ID4gPiA+ID4gPj4NCj4gPiA+
ID4gPiA+ID4gPj4gVGhhbmtzDQo+ID4gPiA+ID4gPiA+ID4+IENoZW4NCj4gPiA+ID4gPiA+ID4g
Pj4NCj4gPiA+ID4gPiA+ID4gPiBIaSBKYXNvbi9NYXJrdXMsDQo+ID4gPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+ID4gPiBSZXRoaW5rIGFib3V0IGl0LCBIb3cgYWJvdXQga2VlcCB0aGUgb3JpZ2lu
YWwNCj4gInZuZXRfaGRyX3N1cHBvcnQiDQo+ID4gPiA+ID4gPiA+ID4gZnVuY3Rpb24sIEFuZCBh
ZGQgYSBuZXcgb3B0aW9uYWwgcGFyYW1ldGVyICJhdXRvX3ZuZXRfaGRyIg0KPiA+ID4gPiA+ID4g
PiA+IGZvcg0KPiA+ID4gPiA+ID4gPiBmaWx0ZXJzL2NvbXBhcmU/DQo+ID4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IEl0J3MgYSB3YXkgYnV0IHJldGhpbmsgb2YgdGhl
IHdob2xlIHRoaW5nLiBJIHdvbmRlciB3aGF0IGlmDQo+ID4gPiA+ID4gPiA+IHdlIGp1c3QgZW5h
YmxlICJ2bmV0X2hkcl9zdXBwb3J0IiBieSBkZWZhdWx0IGZvciBmaWx0ZXIgYW5kDQo+ID4gPiA+
ID4gPiA+IGNvbG8tDQo+ID4gPiBjb21wYXJlPw0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEl0
J3Mgd29ya3MgYnkgZGVmYXVsdCBmb3IgdXNlciB1c2UgLWRldmljZSB2aXJ0aW8tbmV0LXBjaSBh
bmQgZTEwMDAuLi4NCj4gPiA+ID4gPiA+IEJ1dCBpdCBjYW4ndCByZXNvbHZlIHRoaXMgc2VyaWVz
IG1vdGl2YXRpb24sIGhvdyB0byBmaXgvY2hlY2sNCj4gPiA+ID4gPiA+IHVzZXINCj4gPiA+ID4g
PiBjb25maWd1cmF0aW9uIGlzc3VlOg0KPiA+ID4gPiA+ID4gRm9yIGV4YW1wbGUgdXNlciBlbmFi
bGUgIiB2bmV0X2hkcl9zdXBwb3J0ICIgZmlsdGVyLW1pcnJvciBhbmQNCj4gPiA+ID4gPiA+IGRp
c2FibGUgIiB2bmV0X2hkcl9zdXBwb3J0IiBmaWx0ZXItcmVkaXJlY3RvciBBbmQgY29ubmVjdCBi
b3RoDQo+ID4gPiA+ID4gPiBmaWx0ZXIgbW9kdWxlcyBieQ0KPiA+ID4gPiA+IGNoYXJkZXYgc29j
a2V0Lg0KPiA+ID4gPiA+ID4gSW4gdGhpcyBjYXNlIGd1ZXN0IHdpbGwgZ2V0IHdyb25nIG5ldHdv
cmsgd29ya2xvYWQgYW5kIGZpbHRlcnMNCj4gPiA+ID4gPiA+IGRpZG7igJl0IHBlcmNlaXZlIGFu
eSBhYm5vcm1hbGl0aWVzLCBidXQgaW4gZmFjdCwgdGhlIHdob2xlDQo+ID4gPiA+ID4gPiBzeXN0
ZW0gaXMgbm8gbG9uZ2VyDQo+ID4gPiA+ID4gd29ya2luZy4NCj4gPiA+ID4gPiA+IFRoaXMgc2Vy
aWVzIHdpbGwgcmVwb3J0IGVycm9yIGFuZCB0cnkgdG8gY29ycmVjdCBpdC4NCj4gPiA+ID4gPg0K
PiA+ID4gPiA+IFRoZSBwcm9ibGVtIGlzIGhvdyAiYXV0b192bmV0X2hkciIgaGVscCBpbiB0aGlz
IGNhc2UuIEl0J3MgYSBuZXcNCj4gPiA+ID4gPiBwYXJhbWV0ZXIgd2hpY2ggbWF5IGxlYWQgdG8g
bW9yZSB3cm9uZyBjb25maWd1cmF0aW9uPw0KPiA+ID4gPg0KPiA+ID4gPiBObywgdGhlICJhdXRv
X3ZuZXRfaGRyIiB3aWxsIGZpeCBtb3N0IHRoZSB3cm9uZyBjb25maWd1cmF0aW9uDQo+ID4gPiA+
IGlzc3VlcyBhcw0KPiA+ID4gInZuZXRfaGRyX3N1cHBvcnQiIGNvcnJlY3Qgc2V0dGluZy4NCj4g
PiA+ID4gV2hlbiB3ZSBlbmFibGUgdGhlICJhdXRvX3ZuZXRfaGRyIiwgdGhlIG9yaWdpbmFsDQo+
ICJ2bmV0X2hkcl9zdXBwb3J0Ig0KPiA+ID4gd2lsbCBubyBlZmZlY3QuDQo+ID4gPg0KPiA+ID4g
U28gaXQgbG9va3MgdG8gbWUgaXQgc3RpbGwgZGVwZW5kcyBvbiB0aGUgbWFuYWdlbWVudCB0byBz
ZXQNCj4gImF1dG9fdm5ldF9oZHIiDQo+ID4gPiB0byBiZSB0cnVlPyAob3IgbWFrZSBpdCBlbmFi
bGVkIGJ5IGRlZmF1bHQpDQo+ID4NCj4gPiBZZXMsIEkgcGxhbiB0byBtYWtlICJhdXRvX3ZuZXRf
aGRyIiBlbmFibGVkIGJ5IGRlZmF1bHQgaW4gbmV4dCB2ZXJzaW9uLg0KPiA+DQo+ID4gPg0KPiA+
ID4gSWYgd2UgY2FuIGRvIHRoYXQsIGlzbid0IGl0IG11Y2ggbW9yZSBzaW1wbGVyIHRvIG1ha2UN
Cj4gPiA+IHZuZXRfaGRyX3N1cHBvcnQgYnkgZGVmYXVsdD8NCj4gPg0KPiA+IFllcywgRm9yIGNv
bXBhdGliaWxpdHkgZmlsdGVycyBhbmQgQ09MTyBzdGlsbCB3b3JrIHdpdGggdGhlIG9yaWdpbmFs
DQo+ICJ2bmV0X2hkcl9zdXBwb3J0Ii4NCj4gPiBGb3IgbmV3IHVzZXJzLCB0aGV5IGNhbiBlbmFi
bGUgdGhlIG5ldyAiYXV0b192bmV0X2hkciIgdG8gYXZvaWQgc29tZQ0KPiBpc3N1ZXMuDQo+IA0K
PiBRdWVzdGlvbiBzdGlsbCwgc28gd2UgaGF2ZQ0KPiANCj4gMSkgZW5hYmxlIHZuZXRfaGRyX3N1
cHBvcnQgYnkgZGVmYXVsdA0KPiAyKSBhZGQgYXV0b192bmV0X2hkciBhbmQgZW5hYmxlIGl0IGJ5
IGRlZmF1bHQNCj4gDQo+IFVzaW5nIDEpIHNlZW1zIG11Y2ggbW9yZSBzaW1wbGVyIGFuZCBjYW4g
c29sdmUgdGhpcyBpc3N1ZS4gSWYgd2UgZGVwZW5kcw0KPiBvbiB0aGUgZGVmYXVsdCBiZWhhdmlv
dXIsIGl0IHNob3VsZCBiZSBhbG1vc3QgdGhlIHNhbWUuIElmIHdlIHdhbnQgdG8gdGVhY2gNCj4g
dGhlIG1nbXQsIGJvdGggc2hvdWxkIHdvcmsuIEFueSBvdGhlciBhZHZhbnRhZ2VzIG9mIDIpPw0K
DQpVc2luZyAxKSB3ZSBjYW4ndCBlbnN1cmUgdXNlciBjb25maWd1cmUgcGFydHMgb2YgbW9kdWxl
IGJ5IGl0c2VsZi4gKHZuZXRfaGRyX3N1cHBvcnQgPSBvZmYpLg0KSW4gdGhpcyBjYXNlLCBmaWx0
ZXIgZGF0YSBhbHJlYWR5IHdyb25nIGFuZCB0aGUgZmlsdGVycyBjYW4ndCByZXBvcnQgYW55IHRy
YW5zZmVyIGVycm9yIGhlcmUuDQoNClVzaW5nIDIpIGZpbHRlcnMgd2lsbCBmaW5kL3JlcG9ydCB0
aGlzIGlzc3VlIGFuZCB0cnkgdG8gZml4IGl0IGZyb20gbG9jYWwgdm5ldF9oZHJfbGVuLg0KDQpU
aGFua3MNCkNoZW4NCg0KPiANCj4gVGhhbmtzDQo+IA0KPiA+DQo+ID4gVGhhbmtzDQo+ID4gQ2hl
bg0KPiA+DQo+ID4gPg0KPiA+ID4gSSB0aGluayBJIG1heSBtaXNzIHNvbWV0aGluZy4NCj4gPiA+
DQo+ID4gPiBUaGFua3MNCj4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IFRoYW5rcw0KPiA+ID4gPiBD
aGVuDQo+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGFua3MNCj4gPiA+ID4gPg0KPiA+
ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFRoYW5rcw0KPiA+ID4gPiA+ID4gQ2hlbg0KPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gVGhhbmtzDQo+ID4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBUaGFua3MNCj4g
PiA+ID4gPiA+ID4gPiBDaGVuDQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPg0KPiA+
ID4gPiA+ID4gPiA+Pj4gVGhhbmtzDQo+ID4gPiA+ID4gPiA+ID4+Pg0KPiA+ID4gPiA+ID4gPiA+
Pj4+IFRoYW5rcw0KPiA+ID4gPiA+ID4gPiA+Pj4+IENoZW4NCj4gPiA+ID4gPiA+ID4gPj4+Pg0K
PiA+ID4gPiA+ID4gPiA+Pj4+PiBUaGFua3MNCj4gPiA+ID4gPiA+ID4gPj4+Pj4NCj4gPiA+ID4g
PiA+ID4gPj4+Pj4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+DQo+ID4NCg0K

