Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1520864257C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 10:11:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p27Ur-000830-Vc; Mon, 05 Dec 2022 04:10:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1p27Ui-000821-Nr
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:10:36 -0500
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1p27Uf-0005Y8-Im
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:10:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670231433; x=1701767433;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ivES5lWZTGoAd94QudDd1nhO9JacbNrc2REi80ykupU=;
 b=F9QgD0jQH1nIajklyEI6SHmdzjStye9lLC/AEa1SsjybYCnxgD5Tb+32
 hTJ73y/cAJOmFS85zgzocYp3xZgifN11OtMZq+ce/a96/Nim73oRgIJup
 x3MUAq79Lj1e7t7NN4vniiRnUcD1+PyqbGukrDInYjUYkOejkkdhkGYmR
 1tCFljebewjj3Om4nzsHK0TskxuF0ia8IeeJbdf1Ab5iGa+KXHCt03Erj
 RL2J6bQn7+Q64sMcwSgrhEs+WoX0tvriKCBbPHLXKPUGPF/n2pECosWVO
 Sksqi1kezHntgGi3EA1ZhsrRP2BHus+ZI9zpTd8iFgITxlreHPRe57U6E w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="299727297"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; d="scan'208";a="299727297"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 01:10:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="890888978"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; d="scan'208";a="890888978"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2022 01:10:20 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 5 Dec 2022 01:10:20 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 5 Dec 2022 01:10:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 5 Dec 2022 01:10:19 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 5 Dec 2022 01:10:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYbuovLHJcIQO+pWNAsENxus569DI0MT8jTnPwfxsi3VVPYCq6ifX9HUMWyi18g2BRePX2duPixkfIS6icBky05yd9sn/tHo3Il5ZXocWj/q6tE92znz34EmNNApmNLdHjpach7OXsMzCYrPVtWX9RU2rWSd6tuyrzoUwuAQPVRRzxet1h8Uk7g9u6ztM+Dq8HE5mqzdc4Z+R/iVQTSCLYSwSu5xMM7cjUzLRs9z2HDXh+rx8uDT372E7v3SsLEDw7P3mFcv1yWhBTPVWdy3uj31oYllYetSDrRgZpY1nFs1XQEc4GlieyGOPDBBSptYrkDEg1yQYS6P2FIBy5jZTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivES5lWZTGoAd94QudDd1nhO9JacbNrc2REi80ykupU=;
 b=cwlF5nSheONjOBzuJX+x9PLHpYxaDKr9NtENcjyzOzt1Y9+sd6j591t3jlfZ1hBs/ZAT5nhWtsFemJjQ1RokSYUKbwj3a9GDofBZoI3W+3zOpVt3im0XHQa1nzi5gT/HZN1hy+L/Lyef8JRLpvce9DKCFXUxtdh3gFzjenWioWQSLJqFzw+H4s+bW15OHyrA0/sU/f98ceJzZ+GpND+BQDmOgImLuhdhziLXBreONhe+ReaMM60dqRhwtQstf1vNpduRNSw8MlD8+8oWrUABLCjCfXBxHfNUPHMCT7u9pZsTzn+fNOhnS0NXbnVrqWga61YnUR0VGogqtg3bZUMbEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4090.namprd11.prod.outlook.com (2603:10b6:5:195::10)
 by MW3PR11MB4586.namprd11.prod.outlook.com (2603:10b6:303:5e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 09:10:17 +0000
Received: from DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::caa8:f626:10c8:9ae2]) by DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::caa8:f626:10c8:9ae2%2]) with mapi id 15.20.5880.013; Mon, 5 Dec 2022
 09:10:17 +0000
From: "Wang, Wenchao" <wenchao.wang@intel.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: haxm-team <haxm-team@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: RE: [PATCH] target/i386/hax: Add XCR0 support
Thread-Topic: [PATCH] target/i386/hax: Add XCR0 support
Thread-Index: AdkAvHco0a5CAnUYQy+c+kGSr8NH7wAFo4SAABncpzAB0e1YoAABn9+AAAAL14A=
Date: Mon, 5 Dec 2022 09:10:17 +0000
Message-ID: <DM6PR11MB4090752DD956AB0B2AA356C387189@DM6PR11MB4090.namprd11.prod.outlook.com>
References: <DM6PR11MB40909B4A33D66A3100F6D219870E9@DM6PR11MB4090.namprd11.prod.outlook.com>
 <4e35a2b6-12ca-e43c-6ee7-7090280c9341@linaro.org>
 <DM6PR11MB40906BFDB7E263064C1BBC4587189@DM6PR11MB4090.namprd11.prod.outlook.com>
 <04484bf1-c6fc-d430-9939-474c0dab158f@linaro.org>
In-Reply-To: <04484bf1-c6fc-d430-9939-474c0dab158f@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4090:EE_|MW3PR11MB4586:EE_
x-ms-office365-filtering-correlation-id: 249f9199-8ab6-4402-655a-08dad6a086ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WF4+XXIB24UT8apjc5YxBZ9SzPgOajWlDiy3wH3cie5QnsON03G4FI8Y3br58Osy1SZLUdi85n6lhmHzX2/HM5xVXOcuY4ES969/ZkhFhUTWs+ylChEWbzr944tCFDcjWo5fKwo8iEAXjg9vKEWVv53mFe3fJXHjGTvrIRB9xbZzTdp3ENfpTRUbjPEhJo3PO4xLeDc1bjFu3ItZvCQceg5fPHO/CrL0YE9SMeq150ceYfG526KYkizi9Cf890uMLUQQp1lp3av4xfSxLv5rpNWbZVSBMoWOLVBotsRSRT5bKABB6+VmYc68LQ0Jy+mZk0pIf/lUY9a9Q+c94Dn3HV1GnV9FS3a5oIew5AIptRQb/avFstoJ5l03d2bcRxMhq55KO2/ca+kR2IBcYrZGwRIhVG5AuDlAcdW5olPXAj/MqoxQvh3FqnLkO7563fwAw4Aw+CfQMSZqpPdd3Ovkse8n8/PC4/5W3bY15E/axTnCgwgz+UNACXZYO4v6M/50QwLmEf5otTK8ClTFXsXKVtBklnVCEoT7Yj8Inwe7guemQjFdxNTYcAJIC+3exL0coxR5phsUqoOZS+cdL19R3hQyEq//71dypMBf8+eKzpFo6T9GkILqQ8ttqnWbiWXPWMARfw0Gv1YfIitWBInlNW9L3rQdwoVxv944rnbgU/lrpEA3U0QFXpquglXD06cdEpy3RBNM3XJCzqsw5YL/XV7Vg7/nSuZuKbrUikmRtP8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4090.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(376002)(136003)(39860400002)(396003)(451199015)(2906002)(83380400001)(66946007)(41300700001)(76116006)(33656002)(55016003)(186003)(86362001)(66556008)(38100700002)(122000001)(110136005)(9686003)(26005)(38070700005)(82960400001)(52536014)(5660300002)(4326008)(66476007)(64756008)(66446008)(8676002)(8936002)(316002)(478600001)(966005)(53546011)(71200400001)(54906003)(6506007)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXFHMzNRdG5HWGJwMGhHUG9CYk8zaFZoZWQySDlXNUVOclR5a1E2c3JzMEh2?=
 =?utf-8?B?QmxGZE9DOUVlTmE0c3kwcEJOb1piQjIxeXJoSzVXZUZ0RDBtRmlTZTl5UlpG?=
 =?utf-8?B?VVRrbWUydTlGa1hEbFB2OVJzOS80emc0bXNNQzlxYldaWjN4SXJaUGYwRWQ2?=
 =?utf-8?B?clhqVE9IU2RxTDZoYXBvR1N5bGpCSGpNVy9RWEJJaUhoZjNxM0w3SlZIVS9K?=
 =?utf-8?B?b1dJTmlBWk1xM0Njblo0Q0dpeE5GMlE1bzQrK3JjTllkODNLL1NBeVVyQ1V5?=
 =?utf-8?B?MVRpRDNodU9rQ2lTeW9OanpSd3B6MXh5UHdSb0FYUEtMK1ZtUndQS1FicmZM?=
 =?utf-8?B?RFlldmpveHlMcWxkelc5bWgvSHlxTG90Ykh6ODY4aTVOS1VmYXYvaFRCV2Z6?=
 =?utf-8?B?RW10RUFuZmtPcU82QWVwais2RkZjWklVcThycDduNDYxclQwOHRiV2p4ZWh0?=
 =?utf-8?B?T3RZZFJUenA0eDVvTGhYVXZzellDa2pNYWVnTzJNQ2Zlb2pRS3RQckFsSFZ4?=
 =?utf-8?B?RE5CWTAvVlpGcWFxajFMd0FNbmpkeEdZUlBLMWpvUC9WUXU4OWFkajVKakpB?=
 =?utf-8?B?RWsvWFNTQ3RCc3FQajVNUXFoT2EwMlN4aXYwNjVndnFnRGFNUXdHMnpLRGc0?=
 =?utf-8?B?SVBSZnd5bDN2d1hTUjFOcmdwenIwNEFrc2hMbVIyY2xITUNkd1JpZlJHY0Za?=
 =?utf-8?B?dm5OSndHeE5iRi9vU25PalpDZFV2MmlUVkE1bWNpUHZEeG42TXZrL0FhZjRP?=
 =?utf-8?B?d1FENE1pVFZuYmtHMmw5bWhCVStRU0RpLzZPdUpJT0wzOUFPcUJ0QmV6V2Iy?=
 =?utf-8?B?dnY0NndqQXpvQkljK3piZEdFU2g1MVNFRGdrNFloL1FQWmxzT1V2WDYyNG1F?=
 =?utf-8?B?NzlDQ2RseDdzOFRsdFBUVU9XZWc0NkFJUVJDUUNtOVYzTmxSVDR0bm41Y1lP?=
 =?utf-8?B?N1lSRkd0a1FpRitzTkVqeTlVd1B1cDE5ZlU3L0xvS2krb0FpdW5CMmlLdG5n?=
 =?utf-8?B?a2gvVW1JOUJPV3Vnak5DMHRmUjYyc2xQc1I3TEdMSnRkMHUveUlaWjgzUGlM?=
 =?utf-8?B?MHNNWkdhdGZMWmFGZHlqWVo5Yk1IWHJGRmFxSENGSUpTV3E4dVkzVXRRTmtn?=
 =?utf-8?B?Wk1YSXBJM3dnRUFRSDdUZHduRlhsS3dpWUkzMUVrL1NjcHM1dEl6RVVTT1hr?=
 =?utf-8?B?bmpqRitEeUdUMUMyOFVMK25XNThJQ21qNXk0UjdENUpyWmZnNUtnSTIrL0xr?=
 =?utf-8?B?YWk4c1BjVkxBMStIVjdxVmRQREIyMXA4RmFFL25lTXBjRW9sTTNKblp3cXFs?=
 =?utf-8?B?RzRWYVp1UG9VTGlyYWhRRVVsb3lnQU94MXd0ZlloSXVtcS8ybEFlUzFCS0Nh?=
 =?utf-8?B?cWRVQW1ZZy94dU8wSTBCaGgyY0JVRFdSTWRrNFJSeUtnRjNlOWNKclhUZ0h4?=
 =?utf-8?B?RnhCUUFBTCtZVk5JK2UvTTZsNk9LK1BzOURwVlpBRHN1NHRSY2txVnE5SW5W?=
 =?utf-8?B?dkYrU0pXSnMxMjNjcjR1OWx0amRrZ2pEREp3N3BqZy8rOVpiMVhXMm5uQU52?=
 =?utf-8?B?SVBFZGxhVjNLYjlGOTJILzBmR1IwVlY1d25neEhZQ0haUHg2eHhnSjZRMDF2?=
 =?utf-8?B?dDhZanl5RGpnR1Evb2poTXZUV3FEeUJXeEJCdWdQS3B5WUJDNTVhQk5ISlRR?=
 =?utf-8?B?Vk5BWmRTc09nZm5aNlVKR3RxWTlFaTZYQ3dUc0xmV0tqZDNFUHdrVnQwNEQy?=
 =?utf-8?B?YTV3WThBSTkxT2lJQmExOFZ2MVVPMWxXR1cwOEQ2bVFCUXVXZlNjQS9QTnU0?=
 =?utf-8?B?WFdCNjY3UXpYeHE3QU9yWVpGdzVuTnpCbEpEYTFZbm16ZkZQTkRTQUI5NDVj?=
 =?utf-8?B?MUtpblNaazUxL25BZDMzZ0Qwb210NS8yWUQwcTA5dUpVL0dsSUhMQks5UkZH?=
 =?utf-8?B?Zm4rNkxDeVlkalB0UWQrRFFrSUF5MEFWSEllU3Bkd3R5K09sN3EydEMxdi9E?=
 =?utf-8?B?VEM4UWtKWEt4d3JGcUZoL1Z2OHhuaXNZQ2llak5rejhDNFdhOTU3MTNXdnF5?=
 =?utf-8?B?Y2Y4eXBRb21XNnNpUDBmWitzcDJXcVhIbEQ1L09DemZscHVGbWVzSC9uNW1p?=
 =?utf-8?Q?6SxdxtWCH2Ei0OaAQyT1zYXek?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4090.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 249f9199-8ab6-4402-655a-08dad6a086ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 09:10:17.0974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t6GrqmSsS1g4M+64u+SFhrJZAn8R6DAbtbeEk8+AhBzzdn6UtzOifZIRsqACYQmhVNErT1qMukSJJ3RFKObZxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4586
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=wenchao.wang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

VGhhbmtzIGZvciBQaGlsbGlwcGUncyByZXBseS4NCg0KSGksIFBhb2xvLA0KDQpDb3VsZCB5b3Ug
aGVscCB0byByZXZpZXcgdGhlIHBhdGNoIG9mIEhBWD8gSWYgdGhlcmUgaXMgYW55IGNvbmNlcm4g
YWJvdXQgaXQsIGZlZWwgZnJlZSB0byBkaXNjdXNzIHdpdGggbWUuIFRoYW5rcyBhIGxvdC4NCg0K
DQpCZXN0IFJlZ2FyZHMsDQpXZW5jaGFvDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpG
cm9tOiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+IA0KU2VudDog
TW9uZGF5LCBEZWNlbWJlciA1LCAyMDIyIDE3OjA1DQpUbzogV2FuZywgV2VuY2hhbyA8d2VuY2hh
by53YW5nQGludGVsLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KQ2M6IGhheG0tdGVhbSA8
aGF4bS10ZWFtQGludGVsLmNvbT47IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+
DQpTdWJqZWN0OiBSZTogW1BBVENIXSB0YXJnZXQvaTM4Ni9oYXg6IEFkZCBYQ1IwIHN1cHBvcnQN
Cg0KSGkgV2VuY2hhbywNCg0KT24gNS8xMi8yMiAwOTozNSwgV2FuZywgV2VuY2hhbyB3cm90ZToN
Cj4gSGksIFBoaWxpcHBlLA0KPiANCj4gRG8geW91IGFncmVlIHdpdGggbXkgb3BpbmlvbiBhbmQg
aXMgdGhlcmUgYW55IGZ1cnRoZXIgcHJvY2VzcyB0aGF0IEkgbmVlZCB0byBmb2xsb3cgdG8gZ2V0
IHRoaXMgcGF0Y2ggbWVyZ2VkPyBUaGFua3MgYSBsb3QuDQoNCkkgZG9uJ3QgdW5kZXJzdGFuZCB0
aGlzIHBhcnQgb2YgSEFYTSBlbm91Z2gsIGJ1dCBwZXIgeW91ciBleHBsYW5hdGlvbiwgeW91ciBj
aGFuZ2UgbG9va3MgY29ycmVjdC4gSSdsbCBsZXQgUGFvbG8gZGVjaWRlIDopDQoNClJlZ2FyZHMs
DQoNClBoaWwuDQoNCj4gQmVzdCBSZWdhcmRzLA0KPiBXZW5jaGFvDQo+IA0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBXYW5nLCBXZW5jaGFvDQo+IFNlbnQ6IE1vbmRheSwg
Tm92ZW1iZXIgMjgsIDIwMjIgMTY6MTENCj4gVG86IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxw
aGlsbWRAbGluYXJvLm9yZz47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogaGF4bS10ZWFt
IDxoYXhtLXRlYW1AaW50ZWwuY29tPjsgUGFvbG8gQm9uemluaSANCj4gPHBib256aW5pQHJlZGhh
dC5jb20+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIHRhcmdldC9pMzg2L2hheDogQWRkIFhDUjAg
c3VwcG9ydA0KPiANCj4gSGksIFBoaWxpcHBlLA0KPiANCj4gSXQgaXMganVzdCB0aGUgZnVsbCBw
YXRjaC4gQ3VycmVudGx5LCB0aGUgaW1wbGVtZW50YXRpb24gb2YgSEFYTSBpcyBzaW1wbGUsIHdl
IGRpZCBub3Qgc3luY2hyb25pemUgdGhlIHZDUFUgcmVnaXN0ZXIgZm9yIHhjcjAgZnJvbSBRRU1V
LiBIQVhNIHdpbGwgaGFuZGxlIHRoZSB4Y3IwIHN0YXRlIHdpdGhpbiB0aGUga2VybmVsIHNwYWNl
LCBpbmNsdWRpbmcgaW5pdGlhbGl6YXRpb24sIHVwZGF0ZSwgZXRjLiBUaGlzIHBhdGNoIGFkZHMg
dGhlIHhjcjAgdmFyaWFibGUgZm9yIGFsbG9jYXRpbmcgZXh0cmEgOC1ieXRlIGJ1ZmZlciBvY2N1
cGF0aW9uLCB3aGljaCB3aWxsIGJlIHBhc3NlZCBiZXR3ZWVuIFFFTVUgYW5kIEhBWE0gd2hlbiBo
YXhfc3luY192Y3B1X3N0YXRlKCkgaXMgaW52b2tlZC4gV2UgaGF2ZSB2ZXJpZmllZCB0aGUgcGF0
Y2hlZCBRRU1VIGFuZCBpdCBjYW4gbGF1bmNoIGFsbCBndWVzdCBPU2VzLiBUaGFua3MgZm9yIHlv
dXIgY29tbWVudHMuDQo+IA0KPiANCj4gQmVzdCBSZWdhcmRzLA0KPiBXZW5jaGFvDQo+IA0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMjUsIDIwMjIg
MjE6MzcNCj4gVG86IFdhbmcsIFdlbmNoYW8gPHdlbmNoYW8ud2FuZ0BpbnRlbC5jb20+OyBxZW11
LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IGhheG0tdGVhbSA8aGF4bS10ZWFtQGludGVsLmNvbT47
IFBhb2xvIEJvbnppbmkgDQo+IDxwYm9uemluaUByZWRoYXQuY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIXSB0YXJnZXQvaTM4Ni9oYXg6IEFkZCBYQ1IwIHN1cHBvcnQNCj4gDQo+IEhpLA0KPiAN
Cj4gT24gMjUvMTEvMjIgMTM6MTgsIFdhbmcsIFdlbmNoYW8gd3JvdGU6DQo+PiBIaSwgbWFpbnRh
aW5lcnMsDQo+Pg0KPj4gQXMgSEFYTSB2Ny44LjAgaXMgcmVsZWFzZWQgYW5kIGl0IGFkZGVkIFhD
UjAgc3VwcG9ydCwgY291bGQgeW91IGhlbHAgDQo+PiB0byBtZXJnZSB0aGlzIHBhdGNoIHRvIGFk
ZCBjb3JyZXNwb25kaW5nIHN1cHBvcnQgaW50byBIQVggdXNlciBzcGFjZSANCj4+IG9mIFFFTVU/
IFRoZSBwYXRjaCBoYXMgYmVlbiBpbmNsdWRlZCBpbiB0aGUgYXR0YWNobWVudC4gVGhhbmtzLg0K
PiANCj4gU2VlDQo+IGh0dHBzOi8vd3d3LnFlbXUub3JnL2RvY3MvbWFzdGVyL2RldmVsL3N1Ym1p
dHRpbmctYS1wYXRjaC5odG1sI3N1Ym1pdHQNCj4gaW5nLXlvdXItcGF0Y2hlcyBvbiBob3cgdG8g
c2VuZCBwYXRjaGVzIHRvIGEgbWFpbGluZyBsaXN0Lg0KPiANCj4+DQo+PiBCZXN0IFJlZ2FyZHMs
DQo+Pg0KPj4gV2VuY2hhbw0KPj4NCj4+ICAgRnJvbSBiMTc4OWYyNTIzZDA2Nzk4Yjg4ODM2NjRi
ZmE5YTlkZjc5N2JmY2NmIE1vbiBTZXAgMTcgMDA6MDA6MDANCj4+IDIwMDENCj4+DQo+PiBGcm9t
OiBXZW5jaGFvIFdhbmcgPHdlbmNoYW8ud2FuZ0BpbnRlbC5jb20+DQo+Pg0KPj4gRGF0ZTogRnJp
LCAyNSBOb3YgMjAyMiAxODozNzozNCArMDgwMA0KPj4NCj4+IFN1YmplY3Q6IFtQQVRDSF0gdGFy
Z2V0L2kzODYvaGF4OiBBZGQgWENSMCBzdXBwb3J0DQo+Pg0KPj4gSW50cm9kdWNlIGV4dGVuZGVk
IGNvbnRyb2wgcmVnaXN0ZXIgWENSMCB0byBzdXBwb3J0IFhTQVZFIGZlYXR1cmUgc2V0Lg0KPj4N
Cj4+IE5vdGU6IFRoaXMgY2hhbmdlIHJlcXVpcmVzIGF0IGxlYXN0IEhBWE0gdjcuOC4wIHRvIHN1
cHBvcnQuDQo+Pg0KPj4gUmV2aWV3ZWQtYnk6IEhhbmcgWXVhbiA8aGFuZy55dWFuQGludGVsLmNv
bT4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBXZW5jaGFvIFdhbmcgPHdlbmNoYW8ud2FuZ0BpbnRl
bC5jb20+DQo+Pg0KPj4gLS0tDQo+Pg0KPj4gdGFyZ2V0L2kzODYvaGF4L2hheC1pbnRlcmZhY2Uu
aCB8IDIgKysNCj4+DQo+PiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL3RhcmdldC9pMzg2L2hheC9oYXgtaW50ZXJmYWNlLmggDQo+PiBiL3Rhcmdl
dC9pMzg2L2hheC9oYXgtaW50ZXJmYWNlLmgNCj4+DQo+PiBpbmRleCA1MzdhZTA4NGU5Li4xZDEz
YmIyMzgwIDEwMDY0NA0KPj4NCj4+IC0tLSBhL3RhcmdldC9pMzg2L2hheC9oYXgtaW50ZXJmYWNl
LmgNCj4+DQo+PiArKysgYi90YXJnZXQvaTM4Ni9oYXgvaGF4LWludGVyZmFjZS5oDQo+Pg0KPj4g
QEAgLTIwMSw2ICsyMDEsOCBAQCBzdHJ1Y3QgdmNwdV9zdGF0ZV90IHsNCj4+DQo+PiAgIMKgwqDC
oMKgIHVpbnQ2NF90IF9jcjM7DQo+Pg0KPj4gICDCoMKgwqDCoCB1aW50NjRfdCBfY3I0Ow0KPj4N
Cj4+ICvCoMKgwqAgdWludDY0X3QgX3hjcjA7DQo+Pg0KPj4gKw0KPj4NCj4+ICAgwqDCoMKgwqAg
dWludDY0X3QgX2RyMDsNCj4+DQo+PiAgIMKgwqDCoMKgIHVpbnQ2NF90IF9kcjE7DQo+Pg0KPj4g
ICDCoMKgwqDCoCB1aW50NjRfdCBfZHIyOw0KPj4NCj4+IC0tDQo+Pg0KPj4gMi4xNy4xDQo+Pg0K
PiANCj4gSXMgdGhhdCB0aGUgZnVsbCBwYXRjaD8gSXQgaXMgbWlzc2luZyB0aGUgcmVnaXN0ZXIg
dXNlIGluIGhheF9zeW5jX3ZjcHVfcmVnaXN0ZXIoKS4uLg0KPiANCj4gUmVnYXJkcywNCj4gDQo+
IFBoaWwuDQoNCg==

