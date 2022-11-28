Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EAF63A286
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 09:13:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozZEe-0001nN-HE; Mon, 28 Nov 2022 03:11:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1ozZEI-0001iQ-IC
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:11:09 -0500
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1ozZED-0001Ij-HK
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:11:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669623061; x=1701159061;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qVKjKrG2WZxQpiGUZnpq+D8t/xdnuY73PRH9ZEuJjTc=;
 b=lygH/nlA2PN9MijpPB9rYP/X9Aka3mDd3fwR9zTCauvXUhf5ygd3wU73
 D1anEkXy9/vZR4gNhOcyLMK8IcGevJ9G8l97xcL68IFV2WkgxQP4FNCV4
 +Bo7kG3ArFvd9EKMOvf9eKoHsY+qpu4ByJvF/itX4wPjoYSTVZgug7EeF
 RhA3lPUqWGz1FnrosSpdds0Z9obNaCWK+1EKiiCFkemszVfJYO0P/PfQw
 hZsfXDoCvDdMoeHTwWI15IbabudtetfV+VcFfjGcEU9to/VGuMS9UIKQR
 Is4eBiElRFT7vsLIhXw+xt5Vav5Vgb1MLeK1okuusZcuE4bO88nBy6zKE g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="376914172"
X-IronPort-AV: E=Sophos;i="5.96,199,1665471600"; d="scan'208";a="376914172"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 00:10:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="711868579"
X-IronPort-AV: E=Sophos;i="5.96,199,1665471600"; d="scan'208";a="711868579"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 28 Nov 2022 00:10:55 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 28 Nov 2022 00:10:55 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 28 Nov 2022 00:10:55 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 28 Nov 2022 00:10:55 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 28 Nov 2022 00:10:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2zAk9ibQY9nwUReRNLmN1jEgqCgVqaGHV5VgZePEPMZnyb10JKZ3XHOSxJVZSUtXdffgWKl7JLrxEB67tc16Js/StjaYa39cngVtxU8Zjy+pbz/L4ZrVwlfgFWRTuRT4f3N1w/Qr6tFOOLS4NyUvZ5lIAWtdzWW/rxiTPy+u/pyqfQItpxvZJTMYVYgb7LlTJnMi160xrA12J0p9v9R3d0tHXZqC/7wgPx8dRdJ6vhWPkxjYBbv6GAGjjS4k4qbq6qah40TbJvCH9RxOqpOBO/txDwXQUWvroPyzoScPsj5ovtqEL8TCxYpdxN9UUVL6md3FmHxeQGRdpzzy/1tlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVKjKrG2WZxQpiGUZnpq+D8t/xdnuY73PRH9ZEuJjTc=;
 b=TP8BoNwyiXrIoqNeqDjYov1Pui7ntUficq7NSwUwpiaIdzQ2eychFV55PADqpepb50ap3vG3sQbRIFiaA8+W14Jj5GDNAFFngd6pPiItbYjbfmYymfS2n8+PlOgwnWTe9Jbo1jwMDFgibQsh5OI8aVtIAxPKDhzjrLWSwf+Uhwaj4lZRbi06Y+tqnl/IrehEcHLDfxhc+j8PLnDfqQtLwvfxyn8A5KDjeueh/ZkEPJatfb7FZLTiRcnbBkazh2V/ppxV9N9zBJjT+RzYcQbOjIuHNpU1m2REA8AfPzWkkmdpddADUSjuI8suB9rGU1LlYACfrgdi35tp2RP6jQkm0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4090.namprd11.prod.outlook.com (2603:10b6:5:195::10)
 by CY5PR11MB6463.namprd11.prod.outlook.com (2603:10b6:930:31::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Mon, 28 Nov
 2022 08:10:53 +0000
Received: from DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::caa8:f626:10c8:9ae2]) by DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::caa8:f626:10c8:9ae2%2]) with mapi id 15.20.5857.022; Mon, 28 Nov 2022
 08:10:53 +0000
From: "Wang, Wenchao" <wenchao.wang@intel.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: haxm-team <haxm-team@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: RE: [PATCH] target/i386/hax: Add XCR0 support
Thread-Topic: [PATCH] target/i386/hax: Add XCR0 support
Thread-Index: AdkAvHco0a5CAnUYQy+c+kGSr8NH7wAFo4SAABncpzA=
Date: Mon, 28 Nov 2022 08:10:53 +0000
Message-ID: <DM6PR11MB40908952D28C7C0CDD4D469E87139@DM6PR11MB4090.namprd11.prod.outlook.com>
References: <DM6PR11MB40909B4A33D66A3100F6D219870E9@DM6PR11MB4090.namprd11.prod.outlook.com>
 <4e35a2b6-12ca-e43c-6ee7-7090280c9341@linaro.org>
In-Reply-To: <4e35a2b6-12ca-e43c-6ee7-7090280c9341@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4090:EE_|CY5PR11MB6463:EE_
x-ms-office365-filtering-correlation-id: 12147473-7186-4098-2bc3-08dad11811d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P1A33IgZvbqG8APzqhv7MKzyQoaBgvtdL38gLIV8/p0eI8z2vP9KEr85G25WpYfYxxwKZGmDPoSuWTXKUAfblmrAI2JINNmzVftQi43LgH0cdWX/jVCqYkagWbk7ez/Tnj14OUjsgY/7TfFQl6CRgdrQdgH/ZVqRjCY0jas9rcckrzCahOgBYkxfZzYi8IGD457g9feHmTAmZwH2S63fKR8CcaIypCG81cx8iDs1IMsTXtnN57TLX5rEJofNL0Ucwx8oF2Ox4/dIAlB4/8bIT38rrULWuyjtCNivAWF/xwr+SqdjSuPt1FsI/fYHvyRP5jQ2pLoyUZWqeu+SEB44AGTyNZUAJHHHyCb6OotPjrN8s7FwPJNiQYwDKsern2JpoWnTJKDkAYw1NElk7YI2fB6ttJ8UL66dGA6xZ5VT1O0r/hFyfx8ptk5+eQCx2b+E8UDRAatdietgXIqY58pv922+c3D9LGqFXHuoxMZgLZCyCHJau1loAnQEaOrGi+iqEgP0+KLTEHeFNM1+fsBXGAhnbMQDoBwVQVpMUUvXeJZrsWk0Ga6l/e8nSgeFfx/7CPU+MAg4CkWoklTZ3HF/+mL1VJ6SAxCjAXOXboH+x/azqY/v6a/Ri7VzqsEUUniwHRq2D6l4zmn513HSzaGPlI3mh6sRQxvdnb5gd/xEuqxPORTTSacAXG6b63YvzyjmDindxo1EGOPtdQQeIvrvnT1DzA5ELkiG2sObpD8OU1o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4090.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199015)(66946007)(66476007)(8676002)(64756008)(82960400001)(4326008)(66446008)(122000001)(38100700002)(83380400001)(52536014)(66556008)(33656002)(55016003)(41300700001)(38070700005)(8936002)(86362001)(966005)(2906002)(478600001)(76116006)(54906003)(5660300002)(53546011)(316002)(110136005)(186003)(71200400001)(6506007)(26005)(9686003)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0JqbVVHTVpXdjBhVWFYT0Z3THZFaHhScWdtRFd1dFArbDMwRDBsMElIVGdB?=
 =?utf-8?B?QXdHcUxIM1U2SXA2aEFLQ042dk1EcmVoU0ZISDFNdWtiK1NtbmhsU2VrRXFa?=
 =?utf-8?B?SWJ6YjdrcGlXeDY1U0NWS0hXYzRPblQ3MVZLRE16cTJ0aThVeFBRTUR3Ny9L?=
 =?utf-8?B?TGI1Uk5vNGxBK3BzSjhYdENSdnc1QkJMVmhxbUt6dmJrNlZja2d6bjhuWkVs?=
 =?utf-8?B?Q0hub2JsOFB0V28wMnFEcEo4SVY5TWZjOHVGalZuMVdEcGpyYk9CUW9iVWhE?=
 =?utf-8?B?Nlk5V0ZzZ2NQaUcrQmx4MjIwZmFMcjlNWFJqditRN3M4VXB2OWprRFNqZkds?=
 =?utf-8?B?aGdhM08wQWN6YnUzRDlaamcxY0tIUXZUODZIb0Q4ZGZPQ0lwRlhQN2pyZ3Q1?=
 =?utf-8?B?MEhCdllJbEVQTFp5NExSRWlzUjZXMXlCbmNJY004dnhUYzlyWVovMHhNZVhC?=
 =?utf-8?B?ZWlaWlJPVVN2V1ZLdlpXQ0I1NE4wSkFNWUkyeHNJbUJMSVNwQzBIUkhEVWtN?=
 =?utf-8?B?Vk1nemdjQlY3RWdGTTB4UUpjbnd4RkpTWm52TzcyUGJQblQzQ0d5OUhiK3U2?=
 =?utf-8?B?Q2VSb3VQR0wwNHMzTXd4c09DSjhlakFWYVg0ZXhDdGRqYmtrcTA2WW82dk1P?=
 =?utf-8?B?endCY09sS09sVndBTEUwbVIvQUNKKzBvSlpIb0wrWTNkU2c0YXAvVTRVaXJC?=
 =?utf-8?B?VUsxRTRjVHBBeVl0RnkyQ0dVbTlCbVAxbm9IN21vVkY0QWF2eE1aMmlmWmZ5?=
 =?utf-8?B?STlYb0ptVVBVcHdianVDS2kyZEluMTV1c0V1eURGaDQwTmtPS0FiWnpEbzhM?=
 =?utf-8?B?VjdYOFA0VHpvYW50MTFmb0dpL2plRWRDeU1rdmNHdkNDV3M2cVV5WmYvb05l?=
 =?utf-8?B?dVJoYWs3eVlDVzdreGxMU3JDUE5ZKzVrTHRLcjdXRHB5TjQzckg4SEgxYk5t?=
 =?utf-8?B?UTNUemY4djlpWnBkd3hSZWVBZkVScktUTkhSNElJd3VBVyt2V1VVaXUxby9S?=
 =?utf-8?B?NGhWK1ZNS1JCK1pJc0tXTXVPOVU3aW5zb2QxcHVMRTZkR0w2K2hseHFXUk5a?=
 =?utf-8?B?ZmM0MkhQbWtzSE5JNnV0am9GbU0xZUtjL1Q3YVZ3ZWRwbHZlRHdUdGRFTHdO?=
 =?utf-8?B?bFV2UUJ4djN1Z0tLRkVOUU1CSDdObndTRG02aWorNzlYMVVicGVCQTR5ZGVl?=
 =?utf-8?B?cXQ4OTlEb1ZseG9leGRGT1hYUHlPVjhYcFVnNWxUWWFFdm9aZHp4bEVka1pZ?=
 =?utf-8?B?RlZGWG9Wd0xwT1VQL0toUkZvQUlrY2UwKzZvejJKZnVnZWxURmZjaGJDSnBu?=
 =?utf-8?B?aEErQTJxdGFFSHNsdi9KVEk3N0s1T2VKUTZLYUFOcU1QQlQzM1ZnMUVVSWg1?=
 =?utf-8?B?eGsxWjljMUJVaVE3dFhMWDZsTWRNUVR5NTFsOUhQeEI5aTJubldqYVlXOEVr?=
 =?utf-8?B?K09vQk5Sby9TMWlNODVreGRCdWJWa041V1VteXBHUDJwSXBhRXBzMjAzRUsv?=
 =?utf-8?B?NzFKc0RpMjliMEliVkJ6TFY0ZFRRd3Iwa080MGtGMDRRbjBya0lNakxPQUV1?=
 =?utf-8?B?ZXlqY3pFcHQ0Mm5nVHRRcFFrelJLVnUwbTRyZnpUaisvNjR5Y2xKRjNkT3lr?=
 =?utf-8?B?SlBPS3VUZmRXbFhOY2o2WmdLclpIcGJLTzJ4ZktnaS85UFdBeEFzS3BSeUhO?=
 =?utf-8?B?MGNLMk1GNTA4MGhLcWlHZVNEQmRTWGtERUd5a1NmclZFYjNKOVE1OEFWTHhV?=
 =?utf-8?B?NGxGZkkxQUR3aG8yWURQbjFZclNtaytnQVFSZmV1aVdqMTk2UlBLV3JZd3NB?=
 =?utf-8?B?Y2hJQzFBODA1U0pjanVNRStFQVZJN0Vxc2xLNzNZNWx5Ri93RFZUZHFaT0dx?=
 =?utf-8?B?OGtCSWVwbVVMejR5UkJpL1M1UkU1SXp3eURSb1BsWXRaZWwrMGlJT05wOS9x?=
 =?utf-8?B?RHNGQXl2ZmFBdnB4UDVOcTN5V2NKdnBib1dkVXRXSkNtR1Era3REcDZYOS8v?=
 =?utf-8?B?VmdBZ1NqUlNyWlZ1bXFyejY5RGNMNzRkbThUbm4ySkVHd2hORytEK2xFbC9l?=
 =?utf-8?B?MVBJQ1A3TzdWbGdod0pqUFVBdlA3c2Jlelh1NWdxM0pqWkMvVXRsSTc3N1Iz?=
 =?utf-8?Q?Tr+FpuoiraT39k65sEf245pJO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4090.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12147473-7186-4098-2bc3-08dad11811d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2022 08:10:53.4677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qlAxYV7bJc3zZz2JXvyB39QKJs59qD+ZkbQnXB8j7vG+NCWu8qAFNorAh/JnsZzTJ+P2pUr4hHkE8ucwwUk/Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6463
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=wenchao.wang@intel.com; helo=mga06.intel.com
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

SGksIFBoaWxpcHBlLA0KDQpJdCBpcyBqdXN0IHRoZSBmdWxsIHBhdGNoLiBDdXJyZW50bHksIHRo
ZSBpbXBsZW1lbnRhdGlvbiBvZiBIQVhNIGlzIHNpbXBsZSwgd2UgZGlkIG5vdCBzeW5jaHJvbml6
ZSB0aGUgdkNQVSByZWdpc3RlciBmb3IgeGNyMCBmcm9tIFFFTVUuIEhBWE0gd2lsbCBoYW5kbGUg
dGhlIHhjcjAgc3RhdGUgd2l0aGluIHRoZSBrZXJuZWwgc3BhY2UsIGluY2x1ZGluZyBpbml0aWFs
aXphdGlvbiwgdXBkYXRlLCBldGMuIFRoaXMgcGF0Y2ggYWRkcyB0aGUgeGNyMCB2YXJpYWJsZSBm
b3IgYWxsb2NhdGluZyBleHRyYSA4LWJ5dGUgYnVmZmVyIG9jY3VwYXRpb24sIHdoaWNoIHdpbGwg
YmUgcGFzc2VkIGJldHdlZW4gUUVNVSBhbmQgSEFYTSB3aGVuIGhheF9zeW5jX3ZjcHVfc3RhdGUo
KSBpcyBpbnZva2VkLiBXZSBoYXZlIHZlcmlmaWVkIHRoZSBwYXRjaGVkIFFFTVUgYW5kIGl0IGNh
biBsYXVuY2ggYWxsIGd1ZXN0IE9TZXMuIFRoYW5rcyBmb3IgeW91ciBjb21tZW50cy4NCg0KDQpC
ZXN0IFJlZ2FyZHMsDQpXZW5jaGFvDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+IA0KU2VudDogRnJp
ZGF5LCBOb3ZlbWJlciAyNSwgMjAyMiAyMTozNw0KVG86IFdhbmcsIFdlbmNoYW8gPHdlbmNoYW8u
d2FuZ0BpbnRlbC5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCkNjOiBoYXhtLXRlYW0gPGhh
eG0tdGVhbUBpbnRlbC5jb20+OyBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPg0K
U3ViamVjdDogUmU6IFtQQVRDSF0gdGFyZ2V0L2kzODYvaGF4OiBBZGQgWENSMCBzdXBwb3J0DQoN
CkhpLA0KDQpPbiAyNS8xMS8yMiAxMzoxOCwgV2FuZywgV2VuY2hhbyB3cm90ZToNCj4gSGksIG1h
aW50YWluZXJzLA0KPiANCj4gQXMgSEFYTSB2Ny44LjAgaXMgcmVsZWFzZWQgYW5kIGl0IGFkZGVk
IFhDUjAgc3VwcG9ydCwgY291bGQgeW91IGhlbHAgDQo+IHRvIG1lcmdlIHRoaXMgcGF0Y2ggdG8g
YWRkIGNvcnJlc3BvbmRpbmcgc3VwcG9ydCBpbnRvIEhBWCB1c2VyIHNwYWNlIA0KPiBvZiBRRU1V
PyBUaGUgcGF0Y2ggaGFzIGJlZW4gaW5jbHVkZWQgaW4gdGhlIGF0dGFjaG1lbnQuIFRoYW5rcy4N
Cg0KU2VlDQpodHRwczovL3d3dy5xZW11Lm9yZy9kb2NzL21hc3Rlci9kZXZlbC9zdWJtaXR0aW5n
LWEtcGF0Y2guaHRtbCNzdWJtaXR0aW5nLXlvdXItcGF0Y2hlcw0Kb24gaG93IHRvIHNlbmQgcGF0
Y2hlcyB0byBhIG1haWxpbmcgbGlzdC4NCg0KPiANCj4gQmVzdCBSZWdhcmRzLA0KPiANCj4gV2Vu
Y2hhbw0KPiANCj4gIEZyb20gYjE3ODlmMjUyM2QwNjc5OGI4ODgzNjY0YmZhOWE5ZGY3OTdiZmNj
ZiBNb24gU2VwIDE3IDAwOjAwOjAwIA0KPiAyMDAxDQo+IA0KPiBGcm9tOiBXZW5jaGFvIFdhbmcg
PHdlbmNoYW8ud2FuZ0BpbnRlbC5jb20+DQo+IA0KPiBEYXRlOiBGcmksIDI1IE5vdiAyMDIyIDE4
OjM3OjM0ICswODAwDQo+IA0KPiBTdWJqZWN0OiBbUEFUQ0hdIHRhcmdldC9pMzg2L2hheDogQWRk
IFhDUjAgc3VwcG9ydA0KPiANCj4gSW50cm9kdWNlIGV4dGVuZGVkIGNvbnRyb2wgcmVnaXN0ZXIg
WENSMCB0byBzdXBwb3J0IFhTQVZFIGZlYXR1cmUgc2V0Lg0KPiANCj4gTm90ZTogVGhpcyBjaGFu
Z2UgcmVxdWlyZXMgYXQgbGVhc3QgSEFYTSB2Ny44LjAgdG8gc3VwcG9ydC4NCj4gDQo+IFJldmll
d2VkLWJ5OiBIYW5nIFl1YW4gPGhhbmcueXVhbkBpbnRlbC5jb20+DQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBXZW5jaGFvIFdhbmcgPHdlbmNoYW8ud2FuZ0BpbnRlbC5jb20+DQo+IA0KPiAtLS0NCj4g
DQo+IHRhcmdldC9pMzg2L2hheC9oYXgtaW50ZXJmYWNlLmggfCAyICsrDQo+IA0KPiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L2kzODYv
aGF4L2hheC1pbnRlcmZhY2UuaCANCj4gYi90YXJnZXQvaTM4Ni9oYXgvaGF4LWludGVyZmFjZS5o
DQo+IA0KPiBpbmRleCA1MzdhZTA4NGU5Li4xZDEzYmIyMzgwIDEwMDY0NA0KPiANCj4gLS0tIGEv
dGFyZ2V0L2kzODYvaGF4L2hheC1pbnRlcmZhY2UuaA0KPiANCj4gKysrIGIvdGFyZ2V0L2kzODYv
aGF4L2hheC1pbnRlcmZhY2UuaA0KPiANCj4gQEAgLTIwMSw2ICsyMDEsOCBAQCBzdHJ1Y3QgdmNw
dV9zdGF0ZV90IHsNCj4gDQo+ICDCoMKgwqDCoCB1aW50NjRfdCBfY3IzOw0KPiANCj4gIMKgwqDC
oMKgIHVpbnQ2NF90IF9jcjQ7DQo+IA0KPiArwqDCoMKgIHVpbnQ2NF90IF94Y3IwOw0KPiANCj4g
Kw0KPiANCj4gIMKgwqDCoMKgIHVpbnQ2NF90IF9kcjA7DQo+IA0KPiAgwqDCoMKgwqAgdWludDY0
X3QgX2RyMTsNCj4gDQo+ICDCoMKgwqDCoCB1aW50NjRfdCBfZHIyOw0KPiANCj4gLS0NCj4gDQo+
IDIuMTcuMQ0KPiANCg0KSXMgdGhhdCB0aGUgZnVsbCBwYXRjaD8gSXQgaXMgbWlzc2luZyB0aGUg
cmVnaXN0ZXIgdXNlIGluIGhheF9zeW5jX3ZjcHVfcmVnaXN0ZXIoKS4uLg0KDQpSZWdhcmRzLA0K
DQpQaGlsLg0K

