Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22DC650901
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 10:03:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7C2S-0000B4-Ko; Mon, 19 Dec 2022 04:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1p7C2L-0000AX-ST
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:02:18 -0500
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1p7C2J-000278-E4
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:02:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671440535; x=1702976535;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=GKgKH0STi+ZCwo1se2rbvyuiAhhbVzi+tn0JRqY6jyY=;
 b=lEzWFbphvP4zO4oMm1Yfat5FILPfeth7Nkl63gypT7wRaMa6r7n1EIFa
 I9d/IC9v80uGdmy2sCjceb4Aubzp/bbAPh4AQZVDwY/TnaZsBqrV6KyqW
 LfZ2jlv5g++xWn5rdXN567QGc1RKlXx39ZxirDvYpVP7+6kzwKVTu5D/6
 9SwP+WQdsksqBh+lcIbXqZmFylyOKZzGjrzIhPCwz7tneEvOSTR/RLTmc
 IE/B3DAWiOeWpd1mm6ymv6DlkOpK+Is5R5YCE57Upj3Js49NncFROUUB7
 mn7iHCmumThz8muPEk402HWGwTViU1cvMi2KERY3EoKzW0/XvskEka/o2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="383648547"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="383648547"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2022 01:02:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="682948763"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="682948763"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 19 Dec 2022 01:02:00 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 19 Dec 2022 01:01:59 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 19 Dec 2022 01:01:59 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 19 Dec 2022 01:01:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TjL1YQG2s2B9QGD4i8cyTgbDC10dPq044VOM4S+lCzMdqQTVBmqQbvLotSEiaKNte0Lffs8nG1oRLojHOaVBMRXhRkgYsVGoaBhmxlfHEwwOzRLrtXZuX1ouGMo1JPQnQiQp/LM24b/WkNTnZ1bUF+fP9fmYmdlDjXkvDBiEWXPJSoPWpJRjmKTOzGIwSVu3SnMXNWSWLfrNLue9njWntltdzwRzVDDdO+Tgn+I5EoB6cxE8UAUzylFWdSnlC4dSx2nG77hw2l4R+UdbgFnm4W+fDo4QkTo0JUj7VqbscS3Jb5BS6A6jEErgJZH9zyxZEWCeYlzSrJfhgbsFmsE4tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKgKH0STi+ZCwo1se2rbvyuiAhhbVzi+tn0JRqY6jyY=;
 b=VljfKcjIiqVj1ruvCnLevjgc6BbyrLnkXFd8gKgpeTbtRvZaD+z+j2slSl6jEOqnNLMgAO9iyJ+0JXQbs9hGA79aLl19tdhyEQwRi+fuyoBS6iv6TOOk+tei5H80zDE/LypKMuWSa4atN+ICnO8uH9FsdwTTngOVeAIVnvSzCf5JgOTwhlOTYBP7ELcQVB0Iddpucs7AWPziRQ5JTvU/QeOMkLsVVovVoBkpGVzgt+QAx23MiKUqhkZcjbWvcbl9RnqvVrGtsTtBdwXOBRXNlWIsT8s4cZt5xfjAjbuWmGQUgDGvcVHpPe+JOZZ767ybOcTWbNo6YuMcioOf1J1O6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4090.namprd11.prod.outlook.com (2603:10b6:5:195::10)
 by PH7PR11MB7452.namprd11.prod.outlook.com (2603:10b6:510:27d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 09:01:55 +0000
Received: from DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::e97c:4feb:6b7c:b7b3]) by DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::e97c:4feb:6b7c:b7b3%5]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 09:01:54 +0000
From: "Wang, Wenchao" <wenchao.wang@intel.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Paolo Bonzini <pbonzini@redhat.com>
Subject: RE: [PATCH] target/i386/hax: Add XCR0 support
Thread-Topic: [PATCH] target/i386/hax: Add XCR0 support
Thread-Index: AdkAvHco0a5CAnUYQy+c+kGSr8NH7wAFo4SAABncpzAB0e1YoAABn9+AAAAL14ACv7QkMA==
Date: Mon, 19 Dec 2022 09:01:54 +0000
Message-ID: <DM6PR11MB40901A46FA5D76F2FCA47E9B87E59@DM6PR11MB4090.namprd11.prod.outlook.com>
References: <DM6PR11MB40909B4A33D66A3100F6D219870E9@DM6PR11MB4090.namprd11.prod.outlook.com>
 <4e35a2b6-12ca-e43c-6ee7-7090280c9341@linaro.org>
 <DM6PR11MB40906BFDB7E263064C1BBC4587189@DM6PR11MB4090.namprd11.prod.outlook.com>
 <04484bf1-c6fc-d430-9939-474c0dab158f@linaro.org> 
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4090:EE_|PH7PR11MB7452:EE_
x-ms-office365-filtering-correlation-id: 313d3676-3b83-4c78-cd26-08dae19facdb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HIJAKge6z9kWvwXeU3ntnbD2hkEVrE6doRPjiPiCs163KaKINTMyUJFBxg3MT1/HlRnD5CNeNOiLP60/7SG2X5M9uMNVokGrhiEWUroyfddzVSMudmaxvKA/7Y1f16XHOlAkPM+l1nz9aVhltJ/II09xdR0dKjSafZPB5zzjz7QAmtUMb9x570mlEbViwxsdko3DsSycn//sgXN5D2zB62Y45cKIR3Lv2VlmM8NWdeiGWduDtns8TGkRIUBtkNrOBmWE6vEuN1P/I73uXZ2im5hQlUjGEQc+QTMRNlR0SHKePJQpZaOFwMkaMcWdN3t5EbInLFU1BRTNdn36YTg0EUeaK6d4Lq3XfAUyM+eA2sERsPoYYJNVpVrUx7QIqU1Nkj3hCzXRFuhSebTzXvg4g2fH7ydgFXhM17cSgdNNntSo9Zm8nDpShhyWNMLQWNds3tZhAWUE/EKoU8rUNaMd7lv0yuVONevNbpCJagRYn6lVb2JCHaL36UZwFZr7QTeJSe4G0XtAWSbYN+Ze1RyCrrsdHBCkTbnz4xLNPIS6rvXbmUGFsJLuGFD2VsVaFdcov4Sv0o0ooYXT8MHr7bOEvX1vLj3wjK+RjZTpavQeANk6/74qoXIkXoC/oS0npVYuh2UW0W+qHvE8AG+3CY3c/Eay8Q7K5rVgVKS7r+7exbOxvIVhZ1LpJAh/k+3KrCU7L1RJvKQB9vJs5SetIp3GFwX12i9kiVdYUrW9BUTLIe4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4090.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199015)(478600001)(966005)(33656002)(71200400001)(7696005)(6506007)(55016003)(86362001)(186003)(9686003)(66556008)(26005)(316002)(66476007)(66946007)(66446008)(64756008)(76116006)(110136005)(38100700002)(41300700001)(8676002)(4326008)(83380400001)(82960400001)(2906002)(52536014)(53546011)(122000001)(8936002)(38070700005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUpSamFXNkFTZjIzbVRrbTl0SFQwRk9qWjZSWkFITGljQXg0NkNxbHBxWmt2?=
 =?utf-8?B?ODhrcFRBMnl3UzBmUlo3RVBrOThJVU0vb3Q1OVFpZ3lxNUJpcXhiY29DSi9B?=
 =?utf-8?B?bS9CSlYyZlYrdFhvQmJsZ29ITkpZdGc5cHB6aGkzQ3dYcXdRa25zbUJwTmdm?=
 =?utf-8?B?SENCcnh4NU5zSGNIZnovUXNZUVJDNnNrSEE3Nk5lVjZ5VGtRaVllS0F5c0Q1?=
 =?utf-8?B?aW9ZYnhPT0tvcXQ2L2tUc2VMZEFrbGxmMVpOUmYrRzMvT1cyTnZObFZaTEZD?=
 =?utf-8?B?bXRsam9SZ1V0UmFxalFDcVIxUWdpc2ZXTUd0UWl1UFFZTXlPWG9UazVhYk1I?=
 =?utf-8?B?L09keFNwZnhwVyttdE5tZTZRcy9LNmMzNFBkWjc5S1l1aXN2VWRxSDNsT1Zh?=
 =?utf-8?B?NjErQWhtUkpFNXZ6d2NQQjJsOEhUOTBMQVVVeGlEU3pNdDNxSXJUNk50NlVO?=
 =?utf-8?B?aTZuTHdhdUljVDdMVVBJdE5sWnB0eEVTWDZqMThraGd2c2dYdSsyOUU0S2Jk?=
 =?utf-8?B?Z0lNOFV5V0MwbHNVZ0hjdFk0RnZ1LzJxNk9YcVNOc2RPMWhIaWVNWDVhNGsw?=
 =?utf-8?B?TEFZVkJZSUo3YTVoS3A5S3NlNjdTZjY5YjhOQkk1aDJLdHdWVXhya1FWU3Zm?=
 =?utf-8?B?eXJiRmVLUkhNZEtLLzZoZkM5eWR4TDVqR3pnOUdiOHh6a3lSd0ovK2lpQ0Ir?=
 =?utf-8?B?Uk4wbk5zRXgvbkg0NkRlV1BQQ1c3c3ZBa2lweEtlT1BIT1hETmozMzRrbi9J?=
 =?utf-8?B?RlBxczd5ZWtmd3VzR0owVkZtU3IxQjBoWnpscGFZZHFnNk9YcG5zSGNudmVH?=
 =?utf-8?B?S1NSNDFVY3JCSjFHaWllQlBzcU85a0cxdU4rdUs1ZXMxRHA1d29laUFIWnll?=
 =?utf-8?B?cnBLK3Y0UlpxL2hkVHkwUnpJc01QQ1RyeXpCM2x4Y0JRVjNaNW1hU0dtb3pM?=
 =?utf-8?B?YzExUkliaG9FWHNra0hFQVJnSGFFSGU0b0lrR0ZaWFloTm1rcGtwSitYNjlU?=
 =?utf-8?B?c0tHR29vcjFWakJqR1ZybDBKOFM1NDg3NWxQeVRwY2RweDZnN2N1ZW53anBO?=
 =?utf-8?B?a2NZc3AyeEY3cjR0QmZYd1lrK1pkbWRBekJ5aHZ2M3YvajAvMHgyMjZXS1F5?=
 =?utf-8?B?ZTA4b09HdkJybTBwejZnZjVjWjNFT0hvVkNqYUNQK3ZzQVh3NzBMNlIvZWt1?=
 =?utf-8?B?aUdUbU1oS0E5S2Q2eVU4RTBqazF1dldua2dkdkRWdW9PVGZuUU5HTzUvaURN?=
 =?utf-8?B?MEJnN2ZNdHpVYzdwdzFMbGJTWVdNZ2FtRzNBbm5xcGpqWkp6d3N0SXpJY1Vl?=
 =?utf-8?B?aGk2dWJjNHdpMFpTVHAzamlIc1lTNFJnaDIvNDVHZ1p0OSs0K09QRDFIS25x?=
 =?utf-8?B?Ly9MYnhMZnF3WmJGVVUzc0s0M2NWZzFZaFJldGZEVEVzY2k3bUkvMVZGUjBo?=
 =?utf-8?B?azFqSUF3clZuRUQ2b2lSMWlrbW9haTFadkJwQzE5WlR3ek5HNWFjK3hCZERT?=
 =?utf-8?B?azZiekNTaTl3SXV2blYxelYrN3dQZkdNUEx2Ti9sTGpEOTQrSkIzRXJtcXRs?=
 =?utf-8?B?TVlndjY0TlBjbm9CK1kyLzY0eExnSDVkbHdpSE51WXNKbVFYYkNwM1VFTmx2?=
 =?utf-8?B?T3pjZ2l4cVhoeG5NNkJUVk5yL2J3NkZ3RWZkZDIrM1M5alpYOS9JaWlqT1lK?=
 =?utf-8?B?V3lpVC9Id1VxUTBBN2JzcWFqOGF6ZTN4TktwV0Vkd0FHQWlmK3g4d1dKTzAw?=
 =?utf-8?B?RVQ2UXFPaElTQ1FBMXlkQ240NkZLaDFPMWRuNzk2YnNFZzhxbnVaWnU0aVoz?=
 =?utf-8?B?YnVJeHdBNlc3RzR1MFpuV1BDalc0N2hWdjlKNVNMQ0liQnZCZkY2Vkd6Rzc3?=
 =?utf-8?B?bjJER2IrVm9GNTVOczY4RDE4V3hDekRLMTN6MmFzeDBpOHhCUlc0ZmhkVnVw?=
 =?utf-8?B?WWZDT0VnSk1FempkN0FLTk5XVFY4MERMUXJNU1VWc1ZUYmNmTnM3a3Jpb0dQ?=
 =?utf-8?B?SzFBSGxwN2U0bGpRN21FQ2ViMUhyMzRQTmhKN0R0UWk1VjkyQ2h1TG9KU0h0?=
 =?utf-8?B?dGJuNnkzNk9QUW9UTFNWNzFiZUxROWpxbW5uajJCQ0NoV05RVkMyVHRyV1Nw?=
 =?utf-8?Q?Dah+4qt36NLQPi4h2A2Fwh5or?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4090.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 313d3676-3b83-4c78-cd26-08dae19facdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2022 09:01:54.2169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wjPXYN+W8yowEl/2z7gEaP9fUxh5Q5FRRx2A/Z50+JSpJ+jnupcopjmcFs2erCFphg/xEqCyf0/o/jPiPdIVKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7452
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=wenchao.wang@intel.com; helo=mga07.intel.com
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

SGksIFBoaWxpcHBlLA0KDQpBcyBQYW9sbyBkaWQgbm90IGNvbW1lbnQgd2l0aCB0aGlzIHBhdGNo
LCBhcyB5b3UgdXNlZCB0byB0aGluayBpdCBsb29rcyBjb3JyZWN0LCBjb3VsZCB5b3UgaGVscCB0
byBtZXJnZSB0aGlzIG9uZS1saW5lIHBhdGNoIGFzIG5vIG9uZSBwaWNrZWQgaXQgdXAgc28gZmFy
PyBUaGFua3MgYSBsb3QuDQoNCg0KQmVzdCBSZWdhcmRzLA0KV2VuY2hhbw0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogV2FuZywgV2VuY2hhbyANClNlbnQ6IE1vbmRheSwgRGVj
ZW1iZXIgNSwgMjAyMiAxNzoxMA0KVG86IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRA
bGluYXJvLm9yZz47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KQ2M6IGhheG0tdGVhbSA8aGF4bS10
ZWFtQGludGVsLmNvbT47IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+DQpTdWJq
ZWN0OiBSRTogW1BBVENIXSB0YXJnZXQvaTM4Ni9oYXg6IEFkZCBYQ1IwIHN1cHBvcnQNCg0KVGhh
bmtzIGZvciBQaGlsbGlwcGUncyByZXBseS4NCg0KSGksIFBhb2xvLA0KDQpDb3VsZCB5b3UgaGVs
cCB0byByZXZpZXcgdGhlIHBhdGNoIG9mIEhBWD8gSWYgdGhlcmUgaXMgYW55IGNvbmNlcm4gYWJv
dXQgaXQsIGZlZWwgZnJlZSB0byBkaXNjdXNzIHdpdGggbWUuIFRoYW5rcyBhIGxvdC4NCg0KDQpC
ZXN0IFJlZ2FyZHMsDQpXZW5jaGFvDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQpTZW50OiBNb25k
YXksIERlY2VtYmVyIDUsIDIwMjIgMTc6MDUNClRvOiBXYW5nLCBXZW5jaGFvIDx3ZW5jaGFvLndh
bmdAaW50ZWwuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQpDYzogaGF4bS10ZWFtIDxoYXht
LXRlYW1AaW50ZWwuY29tPjsgUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4NClN1
YmplY3Q6IFJlOiBbUEFUQ0hdIHRhcmdldC9pMzg2L2hheDogQWRkIFhDUjAgc3VwcG9ydA0KDQpI
aSBXZW5jaGFvLA0KDQpPbiA1LzEyLzIyIDA5OjM1LCBXYW5nLCBXZW5jaGFvIHdyb3RlOg0KPiBI
aSwgUGhpbGlwcGUsDQo+IA0KPiBEbyB5b3UgYWdyZWUgd2l0aCBteSBvcGluaW9uIGFuZCBpcyB0
aGVyZSBhbnkgZnVydGhlciBwcm9jZXNzIHRoYXQgSSBuZWVkIHRvIGZvbGxvdyB0byBnZXQgdGhp
cyBwYXRjaCBtZXJnZWQ/IFRoYW5rcyBhIGxvdC4NCg0KSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMg
cGFydCBvZiBIQVhNIGVub3VnaCwgYnV0IHBlciB5b3VyIGV4cGxhbmF0aW9uLCB5b3VyIGNoYW5n
ZSBsb29rcyBjb3JyZWN0LiBJJ2xsIGxldCBQYW9sbyBkZWNpZGUgOikNCg0KUmVnYXJkcywNCg0K
UGhpbC4NCg0KPiBCZXN0IFJlZ2FyZHMsDQo+IFdlbmNoYW8NCj4gDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IFdhbmcsIFdlbmNoYW8NCj4gU2VudDogTW9uZGF5LCBOb3Zl
bWJlciAyOCwgMjAyMiAxNjoxMQ0KPiBUbzogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxt
ZEBsaW5hcm8ub3JnPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBoYXhtLXRlYW0gPGhh
eG0tdGVhbUBpbnRlbC5jb20+OyBQYW9sbyBCb256aW5pIA0KPiA8cGJvbnppbmlAcmVkaGF0LmNv
bT4NCj4gU3ViamVjdDogUkU6IFtQQVRDSF0gdGFyZ2V0L2kzODYvaGF4OiBBZGQgWENSMCBzdXBw
b3J0DQo+IA0KPiBIaSwgUGhpbGlwcGUsDQo+IA0KPiBJdCBpcyBqdXN0IHRoZSBmdWxsIHBhdGNo
LiBDdXJyZW50bHksIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBIQVhNIGlzIHNpbXBsZSwgd2UgZGlk
IG5vdCBzeW5jaHJvbml6ZSB0aGUgdkNQVSByZWdpc3RlciBmb3IgeGNyMCBmcm9tIFFFTVUuIEhB
WE0gd2lsbCBoYW5kbGUgdGhlIHhjcjAgc3RhdGUgd2l0aGluIHRoZSBrZXJuZWwgc3BhY2UsIGlu
Y2x1ZGluZyBpbml0aWFsaXphdGlvbiwgdXBkYXRlLCBldGMuIFRoaXMgcGF0Y2ggYWRkcyB0aGUg
eGNyMCB2YXJpYWJsZSBmb3IgYWxsb2NhdGluZyBleHRyYSA4LWJ5dGUgYnVmZmVyIG9jY3VwYXRp
b24sIHdoaWNoIHdpbGwgYmUgcGFzc2VkIGJldHdlZW4gUUVNVSBhbmQgSEFYTSB3aGVuIGhheF9z
eW5jX3ZjcHVfc3RhdGUoKSBpcyBpbnZva2VkLiBXZSBoYXZlIHZlcmlmaWVkIHRoZSBwYXRjaGVk
IFFFTVUgYW5kIGl0IGNhbiBsYXVuY2ggYWxsIGd1ZXN0IE9TZXMuIFRoYW5rcyBmb3IgeW91ciBj
b21tZW50cy4NCj4gDQo+IA0KPiBCZXN0IFJlZ2FyZHMsDQo+IFdlbmNoYW8NCj4gDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxw
aGlsbWRAbGluYXJvLm9yZz4NCj4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciAyNSwgMjAyMiAyMToz
Nw0KPiBUbzogV2FuZywgV2VuY2hhbyA8d2VuY2hhby53YW5nQGludGVsLmNvbT47IHFlbXUtZGV2
ZWxAbm9uZ251Lm9yZw0KPiBDYzogaGF4bS10ZWFtIDxoYXhtLXRlYW1AaW50ZWwuY29tPjsgUGFv
bG8gQm9uemluaSANCj4gPHBib256aW5pQHJlZGhhdC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0hdIHRhcmdldC9pMzg2L2hheDogQWRkIFhDUjAgc3VwcG9ydA0KPiANCj4gSGksDQo+IA0KPiBP
biAyNS8xMS8yMiAxMzoxOCwgV2FuZywgV2VuY2hhbyB3cm90ZToNCj4+IEhpLCBtYWludGFpbmVy
cywNCj4+DQo+PiBBcyBIQVhNIHY3LjguMCBpcyByZWxlYXNlZCBhbmQgaXQgYWRkZWQgWENSMCBz
dXBwb3J0LCBjb3VsZCB5b3UgaGVscCANCj4+IHRvIG1lcmdlIHRoaXMgcGF0Y2ggdG8gYWRkIGNv
cnJlc3BvbmRpbmcgc3VwcG9ydCBpbnRvIEhBWCB1c2VyIHNwYWNlIA0KPj4gb2YgUUVNVT8gVGhl
IHBhdGNoIGhhcyBiZWVuIGluY2x1ZGVkIGluIHRoZSBhdHRhY2htZW50LiBUaGFua3MuDQo+IA0K
PiBTZWUNCj4gaHR0cHM6Ly93d3cucWVtdS5vcmcvZG9jcy9tYXN0ZXIvZGV2ZWwvc3VibWl0dGlu
Zy1hLXBhdGNoLmh0bWwjc3VibWl0dA0KPiBpbmcteW91ci1wYXRjaGVzIG9uIGhvdyB0byBzZW5k
IHBhdGNoZXMgdG8gYSBtYWlsaW5nIGxpc3QuDQo+IA0KPj4NCj4+IEJlc3QgUmVnYXJkcywNCj4+
DQo+PiBXZW5jaGFvDQo+Pg0KPj4gICBGcm9tIGIxNzg5ZjI1MjNkMDY3OThiODg4MzY2NGJmYTlh
OWRmNzk3YmZjY2YgTW9uIFNlcCAxNyAwMDowMDowMA0KPj4gMjAwMQ0KPj4NCj4+IEZyb206IFdl
bmNoYW8gV2FuZyA8d2VuY2hhby53YW5nQGludGVsLmNvbT4NCj4+DQo+PiBEYXRlOiBGcmksIDI1
IE5vdiAyMDIyIDE4OjM3OjM0ICswODAwDQo+Pg0KPj4gU3ViamVjdDogW1BBVENIXSB0YXJnZXQv
aTM4Ni9oYXg6IEFkZCBYQ1IwIHN1cHBvcnQNCj4+DQo+PiBJbnRyb2R1Y2UgZXh0ZW5kZWQgY29u
dHJvbCByZWdpc3RlciBYQ1IwIHRvIHN1cHBvcnQgWFNBVkUgZmVhdHVyZSBzZXQuDQo+Pg0KPj4g
Tm90ZTogVGhpcyBjaGFuZ2UgcmVxdWlyZXMgYXQgbGVhc3QgSEFYTSB2Ny44LjAgdG8gc3VwcG9y
dC4NCj4+DQo+PiBSZXZpZXdlZC1ieTogSGFuZyBZdWFuIDxoYW5nLnl1YW5AaW50ZWwuY29tPg0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IFdlbmNoYW8gV2FuZyA8d2VuY2hhby53YW5nQGludGVsLmNv
bT4NCj4+DQo+PiAtLS0NCj4+DQo+PiB0YXJnZXQvaTM4Ni9oYXgvaGF4LWludGVyZmFjZS5oIHwg
MiArKw0KPj4NCj4+IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvdGFyZ2V0L2kzODYvaGF4L2hheC1pbnRlcmZhY2UuaCANCj4+IGIvdGFyZ2V0L2kz
ODYvaGF4L2hheC1pbnRlcmZhY2UuaA0KPj4NCj4+IGluZGV4IDUzN2FlMDg0ZTkuLjFkMTNiYjIz
ODAgMTAwNjQ0DQo+Pg0KPj4gLS0tIGEvdGFyZ2V0L2kzODYvaGF4L2hheC1pbnRlcmZhY2UuaA0K
Pj4NCj4+ICsrKyBiL3RhcmdldC9pMzg2L2hheC9oYXgtaW50ZXJmYWNlLmgNCj4+DQo+PiBAQCAt
MjAxLDYgKzIwMSw4IEBAIHN0cnVjdCB2Y3B1X3N0YXRlX3Qgew0KPj4NCj4+ICAgwqDCoMKgwqAg
dWludDY0X3QgX2NyMzsNCj4+DQo+PiAgIMKgwqDCoMKgIHVpbnQ2NF90IF9jcjQ7DQo+Pg0KPj4g
K8KgwqDCoCB1aW50NjRfdCBfeGNyMDsNCj4+DQo+PiArDQo+Pg0KPj4gICDCoMKgwqDCoCB1aW50
NjRfdCBfZHIwOw0KPj4NCj4+ICAgwqDCoMKgwqAgdWludDY0X3QgX2RyMTsNCj4+DQo+PiAgIMKg
wqDCoMKgIHVpbnQ2NF90IF9kcjI7DQo+Pg0KPj4gLS0NCj4+DQo+PiAyLjE3LjENCj4+DQo+IA0K
PiBJcyB0aGF0IHRoZSBmdWxsIHBhdGNoPyBJdCBpcyBtaXNzaW5nIHRoZSByZWdpc3RlciB1c2Ug
aW4gaGF4X3N5bmNfdmNwdV9yZWdpc3RlcigpLi4uDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gUGhp
bC4NCg0K

