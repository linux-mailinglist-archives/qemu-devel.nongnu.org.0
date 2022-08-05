Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE29D58A8CC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 11:29:19 +0200 (CEST)
Received: from localhost ([::1]:52882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJtdu-0001lg-PH
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 05:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oJtb3-0006bP-Ai
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:26:21 -0400
Received: from mga12.intel.com ([192.55.52.136]:12344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oJtb0-0007au-MK
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:26:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659691578; x=1691227578;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Qf+LYt5iSkjQ27VXBcRjQeiRWfsZxjX3vSUbol1+fQo=;
 b=gmQle41/kU3QHgCE/IMYJbaazpV4dRBpEKfQqcu0wNqSwj1Qkb8kgTG0
 UtJ41SKPaLOiz1FDlHiUR4zdWviiKGnnWiQQ3SPhrOeGKh2X3g+hH3Akh
 hJAzFYGNJjztOsc5lcvWu2cQozktY/XYZ53afhCOv6aVxmlUUCl4oo4Lj
 erqwbJwEF4eGxt2usiVTlDhqX8MIlbKJmGx7rkptBWZE8ZmtuFtyQyR6D
 GiGWRqRhujPJvmgdVm7c27IesCdB2vnuhsPKdn4kzwwXMwvXJI8aOs09d
 QGTfbybjNmWxqfJyOdsNzfZ+Eam2gZ175sLlNyo4aYI34+X8Ol3QwgsDL A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="269934721"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="269934721"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 02:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="671632872"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga004.fm.intel.com with ESMTP; 05 Aug 2022 02:23:13 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 5 Aug 2022 02:23:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Fri, 5 Aug 2022 02:23:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 5 Aug 2022 02:23:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaMCU0M3jM4+giMthcZgGCvSR7Xk3+Fisy/CaqfHswSYM0w4x81xXEaTmYirlsZz7UggH+OXCfZ3iTt4VogQp2FWNsXfP+wcHYGHEn+MW23q7d9UB+bUuMmFtmSyhtlBqJhQnOt75pEROIPPAqgCStMmVhmYbhniZXQv8G/I9ugXFfcpMmp9R0+AGSrVhqn2HsSVXekmiKbqeZIkKm2h62Q14JPzd349xJ0LXIebwuYDgV9fB2SNznlafV/jfATKNQrHmDqaa0Ycx062tcj2u/SP5/++FJghzdB1+8K/AuKZ8Om4VREflNpxEn2iopcbn9ylRWnuRdrd+Eg5UKyA1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qf+LYt5iSkjQ27VXBcRjQeiRWfsZxjX3vSUbol1+fQo=;
 b=WoGfoLtXy8kFNJ+Ig9XXOEPl0lWv2AjGNByKzPgAPfec0xBDanAPUax1Xo3nTAJiVjmmvAEvCmyCR9DTg4evYjzUuoS+TnKgY5SSe4m/kB6b/PrnC6pxshznXbVAXKYnfdRzwHut7l7tLqKzmmS7b5wTiRTcVx7mMnq6AUCyvk33mUMn3Scrn0+f40boTjOnMEr2UqcQ5ht7v6AcMW2J03zq57AlSmSNxc0adwV/V903eDcZrms6+MuHX2DfhIP44j3DpTyP6VIIQ+VLC4Nfrk9r+5tpcRkp5HpMQ92RVv/AeBhcThVaMM6ToCYDC6MfMP4GFe9eOtGNDCAUlQAB8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by BYAPR11MB2696.namprd11.prod.outlook.com (2603:10b6:a02:c5::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 09:22:56 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee%7]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 09:22:56 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: Jason Wang <jasowang@redhat.com>, Li Zhijian <lizhijian@fujitsu.com>,
 qemu-dev <qemu-devel@nongnu.org>
Subject: RE: [PATCH] net/colo.c: Fix the pointer issuse reported by Coverity.
Thread-Topic: [PATCH] net/colo.c: Fix the pointer issuse reported by Coverity.
Thread-Index: AQHYpklRU0QZL7ruVEObzo84ffvE1K2frz6AgAAg59CAADS4AIAACD6w
Date: Fri, 5 Aug 2022 09:22:56 +0000
Message-ID: <MWHPR11MB00312CA9D5EF1FA0B3F41A829B9E9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220802080948.37426-1-chen.zhang@intel.com>
 <CACGkMEs4Ypb+WcKTX-YqxrRUJW65fWokuBaMAkBp9eznXNDGTw@mail.gmail.com>
 <MWHPR11MB00313220A2758E74C1098E539B9E9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CAFEAcA-91NQT1ETPqygSF45irYf5Wf6uFWocUp0qZ0Yu0JsGgg@mail.gmail.com>
In-Reply-To: <CAFEAcA-91NQT1ETPqygSF45irYf5Wf6uFWocUp0qZ0Yu0JsGgg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e70c4ef4-cebc-46a3-ba52-08da76c414dd
x-ms-traffictypediagnostic: BYAPR11MB2696:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UCGqqqtYpxpmLrbtRxVG9uXu+178IO1akfu6JT0C9z0Aymd48rsdzl3bj6UY1zN7qdPHNht7qElkBui1YA8x9mVmEqdBxAm0tTZgdjjxsKxewbCzOQh5w1GXyTne8oW5DUc0vyqp8NHetTuLcKBxCmxN7wxSKfZz5NidmROROAXqiMSfweS7v9IqsYemLqMBvZ4IYKC9fXPNhyeihBVBcGnQ4YrIpd3tWBjLS1Y8t92dGZzL/+7EevVAMbOFGQK7pgZICKYTG5Au1QmEfqow+YH8NUdUELe/pRJ4tqWmj8bU+pUYLxT9i+tf6EbbYK2JSzayba3pob69GOykHDtDk5qSiqa8urJT373vApsRJ0V+dFwz/xDsnGFlciwn+sjNc1LCjsAcNO1zLKngR3s9RL9JCW5Gv8hPpML+aHmwrWjzyMq6BUitfBaTiaVHHtnTaznv2MrQpqPAWPiSdpvYoyHoXTQBe5I45u2ANBsBIfUQwSE7dTt0LCHHilZ0KyxAWmXNjNXiFJXhL/MQSg3+kCJzJ1EUiBfgSSn7Kz+QrAIe3l6Ljw5Sic/ab6QiRyuFI5FAVJyWBK+Xjh91ADTyoTNbx6XvyxyTQjPSlPLkzHF1IUSB1gnDo8jmw6SqGeI9qRsutZPndJoHTNTnEBHCs+jUZpnHNyfslbRENbzHZpN1AQz521t/8X9w8rcBWhMOIwOzp+5lkLWUqvxboNqWBMqnOkgsFfismhYXVVdrISLHk/ZQGfRHZbjal23F2BOAKhRVa0CTDohc1iNSAeGMRNqmeqCrhGVEqa7UVkamL0V0V1QbHd9Pm2lgTLF1t7N8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(39860400002)(376002)(366004)(396003)(54906003)(316002)(6916009)(71200400001)(478600001)(66446008)(64756008)(2906002)(4326008)(55016003)(66556008)(52536014)(66476007)(5660300002)(76116006)(66946007)(8936002)(4744005)(8676002)(33656002)(82960400001)(83380400001)(122000001)(186003)(86362001)(38100700002)(7696005)(26005)(41300700001)(9686003)(53546011)(6506007)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHg0aDhHWnVEODZaUzhBT3QrVjIwNkwvSjg2bGkwM1g5SWdIS0wrSHpxMjFr?=
 =?utf-8?B?V21hSHdtTjl2T01rdXJ4VlhCM0JBSDFDNWlsZFQvblpHeldGNFRudEJJSUZH?=
 =?utf-8?B?akdWQXpHdHYwZGZZeUJ1VTJkZWtrd3lpSFMyMWc0Rk5uZWU3Vis3WXI0SkVj?=
 =?utf-8?B?WktoSGhZam12ZnlKTncreGtwZC9ON0Q4OEIvaTJTMVRtN1pUbEVJeGtkd0Nk?=
 =?utf-8?B?YWNwM2p3YnBTeFRhZll0QzdKRldqbS95dDJ5L0ZHZHFSOExjWHhsME1Db0Fj?=
 =?utf-8?B?bWM5T005TGpRbzRaRUlyUUNFUEhRNS9MYnl1ck1IbDlmS2h4KzdMNTZiOU1R?=
 =?utf-8?B?TUxyYVRLNy9HUy9uNTJ2aDU1djUxN2V6WUNQeEVnYlRta01Bam5raWZOS3pD?=
 =?utf-8?B?ZXhOTHZ0K0xFZkFCbDZ1cjhaMmVjUEU4V1BLUDM3aTNNMXp5a3N6UXJjbEhT?=
 =?utf-8?B?T09YL1RsQ0I1RnBVQVhtSE1iYzYyNkpvQzBaYVJEVEkxQmloamlvZVQ0S25C?=
 =?utf-8?B?QVNralRVdDY3OEhxczB1WTEvaFNkREJtSC8wNStZTnZrUG9NWWZOM1NONzc3?=
 =?utf-8?B?alUrZ2o1bzlnL0wvUTdNdlFXZEEzN2VsOFZvTk5jaUxMV1RJWDV2cDhTcEVZ?=
 =?utf-8?B?ek9lZ25PMnFtNkFwbDBhS1lQR3lNM3B5NjZoWGp3b3k4NFdyWE92eGtMNnUw?=
 =?utf-8?B?T01CVUgxa2oyUTlhVEtjVlpwazRDYk1vcFh3TEJwd1ltazJkSzA1SzNBM3Jo?=
 =?utf-8?B?ejBmRTZnOGtYNXVCTzVidFJwWS92NHVXMTdZTXBIazF6R0ZraExRMTB2T0c5?=
 =?utf-8?B?aHl2SGRVN2hXSk1naGtLRnRmU0MwenhEMUxDWGVaZ3NYcFc4WUZycENYWnZC?=
 =?utf-8?B?MFVUWUNLUTVxTmJ1aXpabWY4Ykl2bHlGU1o3bXloTk9KTE5TQ1RUYjZ4aWZq?=
 =?utf-8?B?UHlYREs4aGk3clZmTk9iVGdVeFJWRUViVTRKUXJkS05PQzl5Z3k1cU5wQm5C?=
 =?utf-8?B?cGNvZTVaT29mWDh3cjBDdDlWakNpNVNBRTJzMTZrdUd4bWwxZnhraEFYT0NG?=
 =?utf-8?B?NnlscTBoWU51Y0hoV240Z0xEb3BhekZwTmEyUHlxK1VPQVlvNENKSGY4SUpz?=
 =?utf-8?B?SmxxUm1MUlJocTlEYzkwb0k2VFgwOHVFQXhQNm9QMWpvcWdJVWlPVXRCWXNV?=
 =?utf-8?B?RUVnemF6Y3NhZThmQzNXMzlHYzVDTS9GajM0eW96MnZmTk5FWVZzWlZIT0h4?=
 =?utf-8?B?R1JyUFlIeWIrZEI5eXRQT3E0Q3MrU2JyYTlWdm55K2diSHVMYXdSUlh5WXU5?=
 =?utf-8?B?cDJJZ01JUE93bUFKMkh4Sk5Db0o0eERiV0pHMVR6R1lDcUxKamdKME0zSlVC?=
 =?utf-8?B?dFh1RDJBckdWcWJQOHR4WHVhdUM4dzQzc2JWUGFLcUcxNTM3Tm1kdExvM3dQ?=
 =?utf-8?B?djB4dG5tYTFrU1FJNlZMUnhNcm8zamNPR2d6WVBRQVp5Ylg1T25LWFROK2VK?=
 =?utf-8?B?SUYvbHd1UnZjY0lwRUFBK2hRYXFzMURKNHM3dE5VZmR3VHdvVGdOcWh1cFM3?=
 =?utf-8?B?aEJkdmFYRU5QNFpxV0E1Y0craUxTM3RhRmZJSVdtdUdIUTEwdVB0U3IveGNx?=
 =?utf-8?B?ZVdud24zVE0xNTNUTHRQNGFzL1hqaE9aS0tlSElPWXV2MkNtUlNYOUpiUm5E?=
 =?utf-8?B?SHF4N3R2c3Y1U0pzVXVzOU5ZMVh0MERMNnlVdWlWNG9CRTltM2grbmFXRVRW?=
 =?utf-8?B?cWduSlJQd0g1ckNEQllvZlJTZUR6dGo0MzZlOWg3YWNpSS85cXpucEVXYXd6?=
 =?utf-8?B?MDcrSEtleFZETHdHbEFFQXhBMU1MWFgxR2xqOHFxM3NiM3h1R2l6VGkyUU8w?=
 =?utf-8?B?QzZSQWRTNHJaS2E1SnI0Y3A3V2d4Z3J3QWlSM3NNdHhkU2taQUFNTEJOTnBH?=
 =?utf-8?B?Nlkwbkc3djNBd3d4MVlSVndhb28zRXU4QVMwTWZJNU5zUkZJbTBFMWNsYmZB?=
 =?utf-8?B?S1VGSGh3UUVkck1qdTVpTVd5cThXeDJucTB5L0J2NGdOdzVDWXpHZG1mRFFP?=
 =?utf-8?B?cncxYUVqbk54eG41T3VsVlZxclJ6elFubFFhRE5CTHI2OExMUi9LVGR6dWtV?=
 =?utf-8?Q?anFc7r/9l0nPw2ME+4y7amFMC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e70c4ef4-cebc-46a3-ba52-08da76c414dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2022 09:22:56.1464 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P1NyXAmqlbRIHjAv0AMb1UymMVdDqF5dkFOjH6+gH5+TkY7ajCgYf1/RF/g/EkxN7n1BCVr6osi+cldtVYlg6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2696
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136; envelope-from=chen.zhang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgTWF5ZGVsbCA8
cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiBTZW50OiBGcmlkYXksIEF1Z3VzdCA1LCAyMDIy
IDQ6NTMgUE0NCj4gVG86IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4gQ2M6
IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+OyBMaSBaaGlqaWFuIDxsaXpoaWppYW5A
ZnVqaXRzdS5jb20+Ow0KPiBxZW11LWRldiA8cWVtdS1kZXZlbEBub25nbnUub3JnPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIXSBuZXQvY29sby5jOiBGaXggdGhlIHBvaW50ZXIgaXNzdXNlIHJlcG9y
dGVkIGJ5IENvdmVyaXR5Lg0KPiANCj4gT24gRnJpLCA1IEF1ZyAyMDIyIGF0IDA2OjU2LCBaaGFu
ZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4NCj4gPg0KPiA+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEphc29uIFdhbmcgPGph
c293YW5nQHJlZGhhdC5jb20+IEkgd29uZGVyIHVuZGVyIHdoaWNoIGNhc2UNCj4gd2UNCj4gPiA+
IGNhbiBzZWUgZGF0YSA9PSBOVUxMPw0KPiA+ID4NCj4gPiA+IEFGQUlLLCBkYXRhIGlzIGVpdGhl
ciBkdXAgdmlhIHBhY2tldF9uZXcoKSBvciBhc3NpZ25lZCB0byBhIHBvaW50ZXINCj4gPiA+IHRv
IHRoZSBidWYgaW4gcGFja2V0X25ld19ub2NvcHkoKS4NCj4gPg0KPiA+IFllcywgeW91IGFyZSBy
aWdodC4gSSBqdXN0IGNoZWNrZWQgaXQgZm9yIGhpbnQgb2YgYnVncy4NCj4gPiBEbyB5b3UgdGhp
bmsgbm8gbmVlZCB0byBkbyBpdD8NCj4gDQo+IElmIHlvdSB0aGluayBpdCBpcyBhICJzaG91bGQg
bmV2ZXIgaGFwcGVuIHVubGVzcyBRRU1VIGlzIGJ1Z2d5IiBjYXNlLCB0aGVuDQo+IGFzc2VydChk
YXRhKS4NCg0KT0ssIEkgd2lsbCBjaGFuZ2UgaXQgdG8gYXNzZXJ0KCkgaW4gVjIuDQoNClRoYW5r
cw0KQ2hlbg0KDQo+IA0KPiB0aGFua3MNCj4gLS0gUE1NDQo=

