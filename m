Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F866424C2
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 09:37:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p26xL-0002K8-4h; Mon, 05 Dec 2022 03:36:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1p26wc-0002Ho-Ll
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 03:35:23 -0500
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1p26wZ-0004vy-LH
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 03:35:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670229319; x=1701765319;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=zCm38+PoYtpL964qP/l3nYZ4XQBQssMnJu5qsqMq5wI=;
 b=XNotDaYzrpJH/8mxjezIyTzz2QX9sPZEP5AANcqqbmx1dRVW00VlOuvl
 uUr2Jcxb7jXieacNjoARzQ6ntyrVDsWqMcMN9vLwEs9fn/A7EPFxmZKJP
 xcjIgTiZ1PRndJYnGO1tmvBiEWQa4tHryWzpMEf3yIt4Rk60hnKFCOC8a
 iw/jVqP2WtuWf6Q1fk2YKm26vDM5rG4aJZuaA2XJHN3t6LlpTZenmU+uE
 L32LE57jOj6SZnpF0wA2N1cni+mGgoLwcpOPq6yd8bMiSLB2oHA3hSv+s
 ARM48uoxfOFXyPbAgL8Qla8WxMQa8jJW9pG/Ki3+7eHRL8aDu4cf/4DT8 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="316322744"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; d="scan'208";a="316322744"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 00:35:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="752099940"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; d="scan'208";a="752099940"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2022 00:35:10 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 5 Dec 2022 00:35:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 5 Dec 2022 00:35:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 5 Dec 2022 00:35:09 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 5 Dec 2022 00:35:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U09CT3OpM2+0l8CW0gCzxTGPa9QXkUBtfrQP7MMv4RcOEpWzR0Q6cfT0l6hgXiYb6xoV7c/X0z0qVR4DT/v+FrciEo/Ua0McWVsY/M5U4W6mqB2zg5cRVZjCPSoCjp1EBq2ju391ucUzvSl+RTOoUjvBjvh1CapBIpQlYi1z/hsc4cOes+RZF5f/FYsopEPF9TK2V3AIypAIvxSx/Uq+6XMWtIr9StSANlpoDtiZCdjolExi41QUTh9jqJnCLRcJqxNV2RM2Qv91Q2qmmnsfzDUTskA6xqlp2IKo92PYuUqIf7E7nSZtCZ1+DwD1jpNl5KZBk+LXGGWhLmbpNI3y0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCm38+PoYtpL964qP/l3nYZ4XQBQssMnJu5qsqMq5wI=;
 b=hFF+CRASje6bVGa0Z+S5dJsp0FphD1Nk/iPKsaBG4P53SrbB2Q2hhWG5EL+1NoYMgxps+vPqyNIUKB9FyTu+rjp8N/yjt///fqMAuuDzQXwLgrttDaHB9tmPLZTD6BE7aN08tTpiyWoly0d0H+vCwQC63W02wsvrfoFcq+kn98Sz176xUpJzNtivDNWtewJHsZzu9BKniUAVjK/YXK7kDKIyxWHoMvWuul3ET6u3QrYKXzAtnvQF6wKu4ZnbPdlrGVxMYAwNH50hVCc2MWhOXm+sc4oWH/2WNHSMFxjKSXxwpp0Ii4o8/UGrQskupOUFMYY4fSAoSL+aSPbkkrmdsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4090.namprd11.prod.outlook.com (2603:10b6:5:195::10)
 by MN0PR11MB6033.namprd11.prod.outlook.com (2603:10b6:208:374::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 08:35:06 +0000
Received: from DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::caa8:f626:10c8:9ae2]) by DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::caa8:f626:10c8:9ae2%2]) with mapi id 15.20.5880.013; Mon, 5 Dec 2022
 08:35:06 +0000
From: "Wang, Wenchao" <wenchao.wang@intel.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: haxm-team <haxm-team@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: RE: [PATCH] target/i386/hax: Add XCR0 support
Thread-Topic: [PATCH] target/i386/hax: Add XCR0 support
Thread-Index: AdkAvHco0a5CAnUYQy+c+kGSr8NH7wAFo4SAABncpzAB0e1YoA==
Date: Mon, 5 Dec 2022 08:35:05 +0000
Message-ID: <DM6PR11MB40906BFDB7E263064C1BBC4587189@DM6PR11MB4090.namprd11.prod.outlook.com>
References: <DM6PR11MB40909B4A33D66A3100F6D219870E9@DM6PR11MB4090.namprd11.prod.outlook.com>
 <4e35a2b6-12ca-e43c-6ee7-7090280c9341@linaro.org> 
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4090:EE_|MN0PR11MB6033:EE_
x-ms-office365-filtering-correlation-id: 99b27eed-09ae-4624-354c-08dad69b9c7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4FYJ+ye96ldSwjcujpNi6wPKzA2C0oJiin0PG08I9Je3yIZfXSoXmH4haTRcGvJ2U5BsMoQ4ddXwaV9TClTJw6VZhRVGUhJkelUN3+Fn8MiBl82urfe5HahDy9vQY4qGkIuVo7i80YGRwkHcrXWSMErbEMin4qoL+wNWYZJXf4OKgg1aoC07PeNKxnFsumXOic1bOPFMD9yjoT9RUGpRe+vxlHzl+L0EowZEYT4oCj5SPx5SLAKqzJq8oG4K8nqLY+I3irA7uzwseJtfIpyxcwzJyO09sHGRmFwyGoByx3ibsFNnze9R7moSz2sCEJJxPPZJtHDb/MUV8HxMO9NuKCBX39KLL6aoAC/uGIbKxkeq7Iw38HUbJWVleMvOwb4SIhuIpDgWR8I7sFBn38nlSTxnXZqI5Bs0shCeebBB7s0sBqYgF9PLhZvS8QrDf70Of2FtDQ5DZfBbxzRCO+U4NJRRmboZQ7tbE/gB0fP3oXlsxDyYrhUx69LwbHm29Ryi1BpwsWMbyXW+hRMhbSSONEPA/vcIvfpfDcbrHU1B+eKWDnB/B6taFC+oP6S3wmiEW6kPYNaY9huj0bHpQaKfmWx9wn4DrDGxyYtO0enDadRYkvHjq+Oc31USv8OmG2mDJU2O5qRsxViL5kv4t3sw/kReIrXQ+omZaT+ULcmP0U1938W5KW2s19SzoBqBnjqFPfT2Jz/FaB7rQK7hr8HH09eBeGlkfRqd3WhgqAGQx/U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4090.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199015)(38100700002)(122000001)(83380400001)(33656002)(86362001)(38070700005)(2906002)(66476007)(66446008)(64756008)(76116006)(8676002)(66556008)(66946007)(4326008)(41300700001)(8936002)(5660300002)(52536014)(55016003)(53546011)(9686003)(6506007)(26005)(7696005)(71200400001)(186003)(316002)(54906003)(110136005)(478600001)(966005)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0FIUWNPSys5c3huV2pjRkZOU01LRldXb2JqMzVtQVIxaFdXQlZscUdNb0x0?=
 =?utf-8?B?MFZnV1BZckI4R2dYcWVkbVQ3MWZKLzBJeW5iME9vcFhCQWJMRkJEMDM2UkFv?=
 =?utf-8?B?dDJxV0pKcnIxdkgwbjF1YU1kdG0ySUhSc3NyRGNZOGJvSnlrWDlUaEVYdXc4?=
 =?utf-8?B?dWhuNkFENGtSbTVjYkhlZDliTjBZTVhPaGUzazk5Q04zZ1puUWhnc3FJSTRz?=
 =?utf-8?B?QnFGRTIrakNFUjBjTHhCSDB6clM2NklJOFlyKzMrS0k1TzcwVGpJTVQ5aGRy?=
 =?utf-8?B?RFZuZWZoZ21PTVRCbDZERUowUkducndvUHRsTTNNM0lvRjJzaWM5NWExTWN3?=
 =?utf-8?B?OTd5SzJnQkVVd0VsT3Z4WDkrVHVCOTQzTmpheDVJUnlDRmliRGl2MUoxNHM0?=
 =?utf-8?B?NG9RZHZQdEdNNzRrMnRSbVNuTXNSMThYRWgxRGlvUGU3aGFHQWhDeE1RNXVy?=
 =?utf-8?B?d05RTlZXdUkxZFVRZzNTaFpoMFloekZRdWM3czFiQjBYQmdtdEppZjl3ZWU4?=
 =?utf-8?B?VCtaZmpMV1lJY0JxUHoyaVc1Q3QyNnBLMlhXT1l0TDJhOFg2b3hsK3loZ25B?=
 =?utf-8?B?UjNEU2hIeXdrYStBN1hEbjRoblk5blp0UnV2enVDcDc0VTQvSEljYTlLQU5U?=
 =?utf-8?B?VzBMNGJ2amdJdjVNQzBNNGdUUFJrcVc2ZDFEZXp3U3VsQmlhVjBmcThKWFJS?=
 =?utf-8?B?WkRIb0l1RFBEdlNaQzBPNUFRTjdHc3Q1b1I1N0ZEb3d1WEtER2Fza1FxRWVw?=
 =?utf-8?B?ZjNVZUtTNUN1dVRPU2tlQlVCcU8wK284Qng3YXl3aCtrMUVhT3IycStOYWRC?=
 =?utf-8?B?T1VSanI5VGQ3bjFTWG84V3AyRVlVYVZxRFIxZnRFRHczOXRCdFdRVHhyclYr?=
 =?utf-8?B?SktaK3BBVmZWd2U3NnRnNktsUmdLZW5UNjBoY3RwMVo2WUljRXBKMS9nWkpu?=
 =?utf-8?B?bE55WFJOL0N4c0sra08zQ29FVFRPVmpzb3dGSHl5b3U1Z3lkSG80SEs0YmNO?=
 =?utf-8?B?SThBN0dHNXl6ODhMb05pWG1nT1VhSlhSUHR0enAwcE9oZlI2S0hGVVhRL3hO?=
 =?utf-8?B?VGRPTnVkdU03aHdCNitUMmVqbDVFTzcxcXJlck9aWHBWM2FUWlA5UElqTlNZ?=
 =?utf-8?B?TW1hSCtBckRucHR1dUpwbE40Zld3L3RIRlBCb0NVeEZYRXQ0Wm5HdFJDZUk0?=
 =?utf-8?B?OS82Rm9rdXkxSGhGUjZublMydUJ6U0E5TWU5a1F2UkwwaGdDalR4Y01lYkUr?=
 =?utf-8?B?VWlOaHA2N0dvcEFFVDd1eGpYTWJlZkRYQ2dSNkMvRGtsZ0gzcmkxVEl1WFpC?=
 =?utf-8?B?L1gwcWd0L240UlA4d2UxWXFvcVgrbUcrMy9UeGhrVlZ4NUtUckJDc2t4VXNN?=
 =?utf-8?B?Zjd5L3Y1OUpWaUhKZmNkV0xQNmNlNXg4eEJDdDVmL0JjQUFCV2VkQktTdTQ2?=
 =?utf-8?B?OWdDc091eTEyTEIvR3pxbHFqcGs3akkya0FhVlYwdGwwYkRyc0F6VFJxdEhv?=
 =?utf-8?B?aFpSTXFhSmp6S3dPSWQ1YTBzTlFMNzBZS2pkN25sVU13TnBSTEsrVGkvVjNo?=
 =?utf-8?B?OGNtQlFZQWF5dlZSOWNhaFdKQ1NRNUFER2RtR1VhZUc5S2Z2T093alI5QVpw?=
 =?utf-8?B?TERRZ2xyeXQ0RHk4b1E4ZzhFaVowVHE1dXZsUlBmS1RQa2owNXhtTHkvRjFy?=
 =?utf-8?B?RVF6OXZZMG5wSzcyT1orT0x0T0JUQk5hUkt2Q0FJRTBNOU1LV0lPWkloRGdI?=
 =?utf-8?B?L2JHdFlNVUYrV0J2bkcrMmdFRWtiM21hWDIraWtWTW05SnoxOTZjamZocUZU?=
 =?utf-8?B?OXpkMHRuRElQTzBMckdzRDJUaEFab3VXdFV0aE9uSW1VVDd5YlF2MEFkZDNK?=
 =?utf-8?B?SUZoTjBBMFFPenZIUE5WVGJ4YytGVHBLSTlkTmJaUGZDSHNQdTJsemhxUDda?=
 =?utf-8?B?TkRuWWFoT2pwZEhZNEk2L21MYU5XQVRIcFpmYi9sYVNZT1hqWW0zSDdQUUxQ?=
 =?utf-8?B?KzR2YWdyWjRBdW1BNlhJenE1OExIcnRNSmUzWjZQZklTZUkyZ0E3YkRzV2Na?=
 =?utf-8?B?L1FKVnBJSXZiVDBJeENKK00wM0o1MmVCeEw2T0h5Q3doNjAxWkw4Mk5ja1FI?=
 =?utf-8?Q?PVrw6tIFzLAHN71+6pmKZaGEs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4090.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b27eed-09ae-4624-354c-08dad69b9c7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 08:35:05.9316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FPT30gthqtsOT1X/8nK3ZnjbpGSDdOlaR+6YG0WfgN4Me+V482a1ahe72qcr6VIOWVcAhIBtSSdhCB9bqYKs4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6033
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=wenchao.wang@intel.com; helo=mga14.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

SGksIFBoaWxpcHBlLA0KDQpEbyB5b3UgYWdyZWUgd2l0aCBteSBvcGluaW9uIGFuZCBpcyB0aGVy
ZSBhbnkgZnVydGhlciBwcm9jZXNzIHRoYXQgSSBuZWVkIHRvIGZvbGxvdyB0byBnZXQgdGhpcyBw
YXRjaCBtZXJnZWQ/IFRoYW5rcyBhIGxvdC4NCg0KDQpCZXN0IFJlZ2FyZHMsDQpXZW5jaGFvDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBXYW5nLCBXZW5jaGFvIA0KU2VudDog
TW9uZGF5LCBOb3ZlbWJlciAyOCwgMjAyMiAxNjoxMQ0KVG86IFBoaWxpcHBlIE1hdGhpZXUtRGF1
ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KQ2M6IGhheG0t
dGVhbSA8aGF4bS10ZWFtQGludGVsLmNvbT47IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhh
dC5jb20+DQpTdWJqZWN0OiBSRTogW1BBVENIXSB0YXJnZXQvaTM4Ni9oYXg6IEFkZCBYQ1IwIHN1
cHBvcnQNCg0KSGksIFBoaWxpcHBlLA0KDQpJdCBpcyBqdXN0IHRoZSBmdWxsIHBhdGNoLiBDdXJy
ZW50bHksIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBIQVhNIGlzIHNpbXBsZSwgd2UgZGlkIG5vdCBz
eW5jaHJvbml6ZSB0aGUgdkNQVSByZWdpc3RlciBmb3IgeGNyMCBmcm9tIFFFTVUuIEhBWE0gd2ls
bCBoYW5kbGUgdGhlIHhjcjAgc3RhdGUgd2l0aGluIHRoZSBrZXJuZWwgc3BhY2UsIGluY2x1ZGlu
ZyBpbml0aWFsaXphdGlvbiwgdXBkYXRlLCBldGMuIFRoaXMgcGF0Y2ggYWRkcyB0aGUgeGNyMCB2
YXJpYWJsZSBmb3IgYWxsb2NhdGluZyBleHRyYSA4LWJ5dGUgYnVmZmVyIG9jY3VwYXRpb24sIHdo
aWNoIHdpbGwgYmUgcGFzc2VkIGJldHdlZW4gUUVNVSBhbmQgSEFYTSB3aGVuIGhheF9zeW5jX3Zj
cHVfc3RhdGUoKSBpcyBpbnZva2VkLiBXZSBoYXZlIHZlcmlmaWVkIHRoZSBwYXRjaGVkIFFFTVUg
YW5kIGl0IGNhbiBsYXVuY2ggYWxsIGd1ZXN0IE9TZXMuIFRoYW5rcyBmb3IgeW91ciBjb21tZW50
cy4NCg0KDQpCZXN0IFJlZ2FyZHMsDQpXZW5jaGFvDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQpT
ZW50OiBGcmlkYXksIE5vdmVtYmVyIDI1LCAyMDIyIDIxOjM3DQpUbzogV2FuZywgV2VuY2hhbyA8
d2VuY2hhby53YW5nQGludGVsLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KQ2M6IGhheG0t
dGVhbSA8aGF4bS10ZWFtQGludGVsLmNvbT47IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhh
dC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIXSB0YXJnZXQvaTM4Ni9oYXg6IEFkZCBYQ1IwIHN1
cHBvcnQNCg0KSGksDQoNCk9uIDI1LzExLzIyIDEzOjE4LCBXYW5nLCBXZW5jaGFvIHdyb3RlOg0K
PiBIaSwgbWFpbnRhaW5lcnMsDQo+IA0KPiBBcyBIQVhNIHY3LjguMCBpcyByZWxlYXNlZCBhbmQg
aXQgYWRkZWQgWENSMCBzdXBwb3J0LCBjb3VsZCB5b3UgaGVscCANCj4gdG8gbWVyZ2UgdGhpcyBw
YXRjaCB0byBhZGQgY29ycmVzcG9uZGluZyBzdXBwb3J0IGludG8gSEFYIHVzZXIgc3BhY2UgDQo+
IG9mIFFFTVU/IFRoZSBwYXRjaCBoYXMgYmVlbiBpbmNsdWRlZCBpbiB0aGUgYXR0YWNobWVudC4g
VGhhbmtzLg0KDQpTZWUNCmh0dHBzOi8vd3d3LnFlbXUub3JnL2RvY3MvbWFzdGVyL2RldmVsL3N1
Ym1pdHRpbmctYS1wYXRjaC5odG1sI3N1Ym1pdHRpbmcteW91ci1wYXRjaGVzDQpvbiBob3cgdG8g
c2VuZCBwYXRjaGVzIHRvIGEgbWFpbGluZyBsaXN0Lg0KDQo+IA0KPiBCZXN0IFJlZ2FyZHMsDQo+
IA0KPiBXZW5jaGFvDQo+IA0KPiAgRnJvbSBiMTc4OWYyNTIzZDA2Nzk4Yjg4ODM2NjRiZmE5YTlk
Zjc5N2JmY2NmIE1vbiBTZXAgMTcgMDA6MDA6MDANCj4gMjAwMQ0KPiANCj4gRnJvbTogV2VuY2hh
byBXYW5nIDx3ZW5jaGFvLndhbmdAaW50ZWwuY29tPg0KPiANCj4gRGF0ZTogRnJpLCAyNSBOb3Yg
MjAyMiAxODozNzozNCArMDgwMA0KPiANCj4gU3ViamVjdDogW1BBVENIXSB0YXJnZXQvaTM4Ni9o
YXg6IEFkZCBYQ1IwIHN1cHBvcnQNCj4gDQo+IEludHJvZHVjZSBleHRlbmRlZCBjb250cm9sIHJl
Z2lzdGVyIFhDUjAgdG8gc3VwcG9ydCBYU0FWRSBmZWF0dXJlIHNldC4NCj4gDQo+IE5vdGU6IFRo
aXMgY2hhbmdlIHJlcXVpcmVzIGF0IGxlYXN0IEhBWE0gdjcuOC4wIHRvIHN1cHBvcnQuDQo+IA0K
PiBSZXZpZXdlZC1ieTogSGFuZyBZdWFuIDxoYW5nLnl1YW5AaW50ZWwuY29tPg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogV2VuY2hhbyBXYW5nIDx3ZW5jaGFvLndhbmdAaW50ZWwuY29tPg0KPiANCj4g
LS0tDQo+IA0KPiB0YXJnZXQvaTM4Ni9oYXgvaGF4LWludGVyZmFjZS5oIHwgMiArKw0KPiANCj4g
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rhcmdl
dC9pMzg2L2hheC9oYXgtaW50ZXJmYWNlLmggDQo+IGIvdGFyZ2V0L2kzODYvaGF4L2hheC1pbnRl
cmZhY2UuaA0KPiANCj4gaW5kZXggNTM3YWUwODRlOS4uMWQxM2JiMjM4MCAxMDA2NDQNCj4gDQo+
IC0tLSBhL3RhcmdldC9pMzg2L2hheC9oYXgtaW50ZXJmYWNlLmgNCj4gDQo+ICsrKyBiL3Rhcmdl
dC9pMzg2L2hheC9oYXgtaW50ZXJmYWNlLmgNCj4gDQo+IEBAIC0yMDEsNiArMjAxLDggQEAgc3Ry
dWN0IHZjcHVfc3RhdGVfdCB7DQo+IA0KPiAgwqDCoMKgwqAgdWludDY0X3QgX2NyMzsNCj4gDQo+
ICDCoMKgwqDCoCB1aW50NjRfdCBfY3I0Ow0KPiANCj4gK8KgwqDCoCB1aW50NjRfdCBfeGNyMDsN
Cj4gDQo+ICsNCj4gDQo+ICDCoMKgwqDCoCB1aW50NjRfdCBfZHIwOw0KPiANCj4gIMKgwqDCoMKg
IHVpbnQ2NF90IF9kcjE7DQo+IA0KPiAgwqDCoMKgwqAgdWludDY0X3QgX2RyMjsNCj4gDQo+IC0t
DQo+IA0KPiAyLjE3LjENCj4gDQoNCklzIHRoYXQgdGhlIGZ1bGwgcGF0Y2g/IEl0IGlzIG1pc3Np
bmcgdGhlIHJlZ2lzdGVyIHVzZSBpbiBoYXhfc3luY192Y3B1X3JlZ2lzdGVyKCkuLi4NCg0KUmVn
YXJkcywNCg0KUGhpbC4NCg==

