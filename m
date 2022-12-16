Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED1764E84C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 09:48:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p66Ni-0000dD-TL; Fri, 16 Dec 2022 03:47:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1p66Ng-0000cx-Jn
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 03:47:48 -0500
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1p66Nd-0003tG-9f
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 03:47:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671180465; x=1702716465;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4wmdbJpESuEmCjHSayomfvLz8rlIgmVaBOwetipxfGk=;
 b=FfAKiyLZlzXsk8WZBcwDu18ReorZuvRo9ERP3s8Ps9J52bFGsXBNt2vW
 aGCUnp0ngKJ57kuvKr4NNlvwo0cZLna1LuAg5EprnHLf1VkNH09DN7UrU
 Od5F5DZLjDlyyI54bfkUazWFX0foFQU8N5VBnb+vn9GNCQYCL6MeWur7K
 GOJPdhBa/Lib1FkTiLIG98zAHiRXV2ITMkQWnYaYr6kqQzgmeEvRDnEq+
 k6s6Inw/hmc4r29O/hJFKpPdRM5lItQh5ijTc9eJQ7S35aWPhY3SIt3Pi
 UWIERw1rpzuw6voiEU5+0gRw9kD0o/6xG+BwQXo5XKXjQuQpmm1snS2Vr Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="299260475"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="299260475"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 00:47:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="713215049"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="713215049"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 16 Dec 2022 00:47:42 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 16 Dec 2022 00:47:42 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 16 Dec 2022 00:47:42 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 16 Dec 2022 00:47:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWpp6MaCUcXcNmfxKOlZ7nHTx7RZeMS4LoGnJaV8wOrT8O27qbd4KSbAlwyz6jPWqlOIgYTWg/rOULV9B78qv9+yd4AWdOjlzQasnXgaBcDqrHENCYyLask0OLmZlqLQ5gEhTFdR36Gy0KBatyVS0mivgaz1VUnR09zEo8rCy5+mWde3lNh4bWzwLBa1nNwPdK2FneZvyB6iFomDDLbxTMmIoJnUy4TxhH8MlKYY6ydYrSu6B280NpL5wgvLipcfKsUDaIW0vYtlNLsXSu9o5wQcP427e5G586FLEmgC5U0bthK70BbxDiPdOP6c9FEvcMdQMgRU1HZiU7YQGVMhuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wmdbJpESuEmCjHSayomfvLz8rlIgmVaBOwetipxfGk=;
 b=G50l/TAXN5y22fyAYKZdYXZYiuW1pLAgXBsOJK5vP3pR5ZPOhK95ZUe8zi9ytBuBJVTH4SDHL+6/qqM8kuT4YmlRgU6cvl+JmP5VfiR/ccd5lFmLkNY3XpMAKwt3wN2dw/aHAxM6ExatSM+TG7r+YFy1N1I7KKyiz5uEFsx2IhBOdnua82CUlAAGj0kFHefNZcoGnt6q24T1OFiv53gSRXqEttgKECfgbdWUs7EscMfWWCN1Z1Ec4zu4uo8NIaYrPiN2kMKN8ChDaWU1uMbojoxoMwJp1tHy758xdb/pHZNmn9ex6BGf0fWskYFPclW7+f/S/EwIiH3rG3waaW/CCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN6PR11MB4081.namprd11.prod.outlook.com (2603:10b6:405:78::38)
 by DS0PR11MB6400.namprd11.prod.outlook.com (2603:10b6:8:c7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.11; Fri, 16 Dec 2022 08:47:38 +0000
Received: from BN6PR11MB4081.namprd11.prod.outlook.com
 ([fe80::a0e4:e3b1:7170:f40a]) by BN6PR11MB4081.namprd11.prod.outlook.com
 ([fe80::a0e4:e3b1:7170:f40a%7]) with mapi id 15.20.5924.012; Fri, 16 Dec 2022
 08:47:38 +0000
From: "Wang, Wenchao" <wenchao.wang@intel.com>
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
CC: Thomas Huth <thuth@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>
Subject: RE: [PATCH] target/i386/hax: Add XCR0 support
Thread-Topic: [PATCH] target/i386/hax: Add XCR0 support
Thread-Index: AdkLtcw/di6dL/H4TWa/2VV8k407TwD6h9KAAC98J1AABHdJAAAhhcLQ
Date: Fri, 16 Dec 2022 08:47:37 +0000
Message-ID: <BN6PR11MB408165E8D759049FF90B093D87E69@BN6PR11MB4081.namprd11.prod.outlook.com>
References: <DM6PR11MB4090F9D06DC171C4B9C7D97587E09@DM6PR11MB4090.namprd11.prod.outlook.com>
 <073f7d3e-c7cc-084d-2848-c8a9490e6c69@redhat.com>
 <DM6PR11MB40908AA444148E892A0F8B0D87E19@DM6PR11MB4090.namprd11.prod.outlook.com>
 <CAFEAcA-kdF64fzX8Qx4NHstqaTVpqufmiRmCio5V33Lv_xWBBA@mail.gmail.com>
In-Reply-To: <CAFEAcA-kdF64fzX8Qx4NHstqaTVpqufmiRmCio5V33Lv_xWBBA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: pbonzini@redhat.com,stefanha@redhat.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB4081:EE_|DS0PR11MB6400:EE_
x-ms-office365-filtering-correlation-id: 6baeaabf-baba-42b4-b014-08dadf422f37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gQEyWcm4ZRSKtTynIOHugWyOUrv2w6yGYr2CcyRXmQZQGKhlMlEkQwGZFyvGSvyWtmI5BwDxxrZgJ6+4Z7IaurBhd9CxAAD9RRL3QBh8upN5nnHIUlhsc6KI4JMkYU3YvAfcBUkoEemJHgk2/nsu53Udg60Kv3oGeJxfwG9UmA29SesQITra5wgFynPZs9/Bj4ORT8np1os0p0Pu+psbco1RP4sKJiO1Tan5StNIrs7VVVkbfJfsP8vaWJjwINfQklQlQZ6jVGItJqbIt7uw2HnhrnTMqCrJskqlcc/HATN+YT4r1cd5Ucdt2Sn743LmnutgjitnMW1IqomISzdC/wPlr7YjeEzr3FK+/YkPspLawg3iWjIxGsZCUqLbTCqbsd/WmvdMW5AzBLLf9xEBtkVA5Zzy0wHbzMprelXEA0q+6WuTpSY9WQ9BjfhE5L13ULxJNiHa3cH4oVuMzgEROFH3CPBkdrK7isBNRgpOZwZEWSLgn0jqV+ebygAfHj3NsRYN1ZjbNwcj6sq8QqJsu1WdliWP6dJWXVBuwLzPlmOpNhJAdolT7FAc94b+Tu/53xtjLTF3buDTXhHq+4tf74ddqgppAtraHeujEjmvnB87aq5SPqNS7jXpSlJsJPJjrBprrV7a8EwxQr+a/9KFzgxG4CvLoGs/5RomQwWfhWx/T6V8mjNwk8G8aOTR1634
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4081.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(366004)(396003)(346002)(39860400002)(451199015)(8936002)(33656002)(52536014)(66476007)(66446008)(122000001)(2906002)(38070700005)(76116006)(66556008)(8676002)(4326008)(66946007)(5660300002)(41300700001)(64756008)(86362001)(38100700002)(82960400001)(83380400001)(71200400001)(478600001)(66899015)(9686003)(186003)(26005)(53546011)(6506007)(7696005)(55016003)(54906003)(316002)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3RjRlk2bTNVaHN0eFZFUFBnemZ6T0RYa09xZEtXa2tTVG0xR1cvOTI4bjFo?=
 =?utf-8?B?TzRnZ1M1QmR6MVBweDU2QUtDRlE5TUcvRTFET3JXM2c3aTMxcXRvamFpbkY0?=
 =?utf-8?B?anpOSW9ybGFXRElOUDV3aGtDQ1RhcXRjZWtmSkl4eGxnVk5scHZzNUluVUpD?=
 =?utf-8?B?WlFZNkFEZTJSVk1CMWxKTGhhL0JPMUxTYlFOTUdsQUVEbFkxOHdNc1gxd3Bp?=
 =?utf-8?B?VDZZYWpQcEIzb2pOTGFSUjNndUlQOERnRG9sL3hGUGh2RFJ0ZnQ5Ulo3THlk?=
 =?utf-8?B?WGQxeHhFNUxoekdkTWhydDEvNTE3NkxNdkRnazBuT1lndGhieWRRRjVuMzZR?=
 =?utf-8?B?NGdBd0FRaUxwVTZQMFJjdzJRNjBwMlFlS05KZkNhTXVxSWRtNnJTL0tDVVlS?=
 =?utf-8?B?cnh3cGFVVVV3OGRvdkliS1FLVTdFaURWTUhmYVhCQW1jbG9NdjZMWThYNjdJ?=
 =?utf-8?B?MGpudXpTYWhXTi9ZbnF4NjBhTWVuYmNDcm0wY0FlTjV1QWxBSU9BK2EwRGVo?=
 =?utf-8?B?MUtZQkVWMjN4a0U1UTI2UVFHeHpqOHpJN3cyZ09rTG9GUHNMQk84dUQ3QTBy?=
 =?utf-8?B?MjBpL3ZtdFlyMGtka2ZFbzlkcXNyQyt0dUE0SmZDRFl1N2lrcUxVSW1rSXov?=
 =?utf-8?B?OCs4RHJ0YjcrTTdoRC9uV3hHR0lPNllma2lmbTV2TjU0L2RnVnRDSXFkQ1pa?=
 =?utf-8?B?d1BVZWNkcndJdGVuSU16a0wyQ0FkbHYzN2dLV3RkM2E0QU42WUsxSjkwR01R?=
 =?utf-8?B?YWNRS1lmNFJlTUxPS3ZqbkVhZmZJTklCTWRIUm5yeXlHRVhQM1hsbHpZRVVV?=
 =?utf-8?B?bTViWEtOZk1sV2tma3hTUGFIRGo1SHhXMFlzMWs3Ui8wUzNXVE5rQ1BVMUVX?=
 =?utf-8?B?THduYXpPZ0pndWFQZWN0azlFTzhOazlEZHN6SDE4cWdzTkFvc1dPQko2OVl0?=
 =?utf-8?B?c3VMUEM2QU4zOHFWR09qVnk0SHVaRk8waURxK0QyTUpjdEJUUFVOOWxBdENq?=
 =?utf-8?B?UFpOaWkraTl1TzRWRzBMb01YeHlHa0YvSE5EdEFPeVlJb3RPSDFja3lGZXJh?=
 =?utf-8?B?Q1RPRUt3K1N2cDBhemNCMkFORVRqdkRvTEo1WE1OZCtycDNRbXRKM05sdzJM?=
 =?utf-8?B?THdIUzU2ZG5mZm4xVWZJTHZWT1UySTZMQWEyWmZkOE1NQ3JCTDF6ZXRwREZt?=
 =?utf-8?B?cUFiT09jTzBIZlc5a2YzcmlzanpLaUVVaGNWbWVENFNxL05xQUxJSkx5RHh2?=
 =?utf-8?B?SUVPanI3TkxMRUgrL1lIQ3p5SzE2NXhVL0Nrd1hacDJBZ2w2UGJNNTVvV3o4?=
 =?utf-8?B?andFSGpRdzRBTFY4ZWQ3eDFNNXdxMGxjNWJzSXVuNXQ5TEorWkVOQmg4MnI4?=
 =?utf-8?B?RFNhY05iWmNCNm90ZDdJQ29JdEJwWTVTdlFXWEEwK3NEOTAwQm9TaTJYVUNG?=
 =?utf-8?B?ZFVDVHp6M25DODI1QzJ2Sm50ZkJJYXdOUWptWTk3TWtoUDV5aTF0clBWRUtK?=
 =?utf-8?B?T1BFTkxJTU5ZSVNMUTlRU1VaQ0pmZmJxQm9BWFptN2tCMEcyUGVKODlhL2d5?=
 =?utf-8?B?VEdZQ25tSFlqd1NFK1RPRkFKbWxSd1FFYWhERGJyQkpiNnZ6WmE0OEdvdFZL?=
 =?utf-8?B?WkNTKzhMWEhpVGUwUE5WYUlwb0ViNHVuOUhrdW5YVHlhTGpyMHExNU1yekdD?=
 =?utf-8?B?WkZEYmF6OUsxZCtvOWhmVm9yV0ZOS2UzczdYUWFEUkNnY0Y5NjZaY3JuNWE5?=
 =?utf-8?B?cWVGdndpcUFCV2xNVmhhdk5wNFdCTWVuSjhyU0YzaHNSV3ZMNlBZc2pGSURv?=
 =?utf-8?B?OEZxeFFwNDYrOVlMMC9SU2lFSmFRTnZDMmtYODk1TGs2NlBmaTZQdzA1cVB2?=
 =?utf-8?B?WENnc1FNOFVwWFhKRkFkc1RJblZvTTdkVGE3UWJBOTMzTkdhbXJLODlPRkpW?=
 =?utf-8?B?Rzl5cVlXWkZjUEJhemFwWGxZYUFYSFR0bm0vV05WUERVeVFPNEJIVHF1VVkw?=
 =?utf-8?B?MWdudVhldVZIa21PMEllOTVKVnJ5QnFlUlppdkdtT1ZTNGR3d3JKVUFGKzkv?=
 =?utf-8?B?SW05dFZDM0NGdHN0bVhOQno5SytuYVFwN05zVzZ3Q0lXR0pZUlVqbW15cmVZ?=
 =?utf-8?Q?oS51XZBeJUsuSFAjgvsOZHurc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4081.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6baeaabf-baba-42b4-b014-08dadf422f37
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2022 08:47:37.8892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a7Jux2iismigVqviw6riKvJRQbUSWIz3lrxZ5R/adFYCY4Zw3/MVOrfyHpT1ywe5Cf0EnNE1OOzLctR61g6Arw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6400
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=wenchao.wang@intel.com; helo=mga17.intel.com
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

VGhhbmtzIGZvciBQZXRlcidzIHJlcGx5LiBTaW5jZSBpdCBpcyBiZXR0ZXIgdG8gcHVsbCB0aGUg
cGF0Y2ggYnkgeDg2IG1haW50YWluZXJzLCBjb3VsZCBhbnkgbWFpbnRhaW5lciBoZWxwIHRvIG1l
cmdlIGl0LCBAUGFvbG8gQm9uemluaSBvciBAU3RlZmFuIEhham5vY3ppPyBUaGUgb3JpZ2luYWwg
cGF0Y2ggaXMgYXR0YWNoZWQgYmVsb3cuIFRoYW5rcyBhIGxvdC4NCg0KDQpCZXN0IFJlZ2FyZHMs
DQpXZW5jaGFvDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpGcm9tIGIx
Nzg5ZjI1MjNkMDY3OThiODg4MzY2NGJmYTlhOWRmNzk3YmZjY2YgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxDQpGcm9tOiBXZW5jaGFvIFdhbmcgPHdlbmNoYW8ud2FuZ0BpbnRlbC5jb20+DQpEYXRl
OiBGcmksIDI1IE5vdiAyMDIyIDE4OjM3OjM0ICswODAwDQpTdWJqZWN0OiBbUEFUQ0hdIHRhcmdl
dC9pMzg2L2hheDogQWRkIFhDUjAgc3VwcG9ydA0KDQpJbnRyb2R1Y2UgZXh0ZW5kZWQgY29udHJv
bCByZWdpc3RlciBYQ1IwIHRvIHN1cHBvcnQgWFNBVkUgZmVhdHVyZSBzZXQuDQoNCk5vdGU6IFRo
aXMgY2hhbmdlIHJlcXVpcmVzIGF0IGxlYXN0IEhBWE0gdjcuOC4wIHRvIHN1cHBvcnQuDQoNClJl
dmlld2VkLWJ5OiBIYW5nIFl1YW4gPGhhbmcueXVhbkBpbnRlbC5jb20+DQpTaWduZWQtb2ZmLWJ5
OiBXZW5jaGFvIFdhbmcgPHdlbmNoYW8ud2FuZ0BpbnRlbC5jb20+DQotLS0NCnRhcmdldC9pMzg2
L2hheC9oYXgtaW50ZXJmYWNlLmggfCAyICsrDQoxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspDQoNCmRpZmYgLS1naXQgYS90YXJnZXQvaTM4Ni9oYXgvaGF4LWludGVyZmFjZS5oIGIvdGFy
Z2V0L2kzODYvaGF4L2hheC1pbnRlcmZhY2UuaCBpbmRleCA1MzdhZTA4NGU5Li4xZDEzYmIyMzgw
IDEwMDY0NA0KLS0tIGEvdGFyZ2V0L2kzODYvaGF4L2hheC1pbnRlcmZhY2UuaA0KKysrIGIvdGFy
Z2V0L2kzODYvaGF4L2hheC1pbnRlcmZhY2UuaA0KQEAgLTIwMSw2ICsyMDEsOCBAQCBzdHJ1Y3Qg
dmNwdV9zdGF0ZV90IHsNCiAgICAgdWludDY0X3QgX2NyMzsNCiAgICAgdWludDY0X3QgX2NyNDsN
Cg0KKyAgICB1aW50NjRfdCBfeGNyMDsNCisNCiAgICAgdWludDY0X3QgX2RyMDsNCiAgICAgdWlu
dDY0X3QgX2RyMTsNCiAgICAgdWludDY0X3QgX2RyMjsNCi0tDQoyLjE3LjENCg0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBs
aW5hcm8ub3JnPiANClNlbnQ6IFRodXJzZGF5LCBEZWNlbWJlciAxNSwgMjAyMiAxODoyNw0KVG86
IFdhbmcsIFdlbmNoYW8gPHdlbmNoYW8ud2FuZ0BpbnRlbC5jb20+DQpDYzogVGhvbWFzIEh1dGgg
PHRodXRoQHJlZGhhdC5jb20+OyBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPjsg
U3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPjsgcWVtdS1kZXZlbEBub25nbnUu
b3JnOyBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NClN1
YmplY3Q6IFJlOiBbUEFUQ0hdIHRhcmdldC9pMzg2L2hheDogQWRkIFhDUjAgc3VwcG9ydA0KDQpP
biBUaHUsIDE1IERlYyAyMDIyIGF0IDA5OjQ1LCBXYW5nLCBXZW5jaGFvIDx3ZW5jaGFvLndhbmdA
aW50ZWwuY29tPiB3cm90ZToNCj4NCj4gSGksIFRob21hcywNCj4NCj4gVGhhbmtzIGZvciB5b3Vy
IHJlcGx5LiBJIGhhdmUgYXR0ZW1wdGVkIHRvIGZvbGxvdyB5b3Ugc3VnZ2VzdGlvbnMgYnV0IGl0
IGFsd2F5cyBmYWlsZWQgb24gdGFnZ2luZyBhIEdQRy1zaWduZWQgdGFnIGJlZm9yZSBzdWJtaXR0
aW5nIHRoZSBwdWxsIHJlcXVlc3QuIEkgaGF2ZSB1c2VkIEdQRyAyLjIuNCB0byBnZW5lcmF0ZSBh
IFJTQTQwOTYgR1BHIHNlY3JldCBrZXkgYW5kIHBhc3RlZCB0aGUgcHVibGljIGtleSBvbiBHaXRI
dWIgc3VjY2Vzc2Z1bGx5Lg0KPg0KPiAkIGdpdCB0YWcgLXMgcHVsbC1yZXF1ZXN0LWhheCAtbSAn
dGFyZ2V0L2kzODYvaGF4OiBBZGQgWENSMCBzdXBwb3J0Jw0KPiBlcnJvcjogZ3BnIGZhaWxlZCB0
byBzaWduIHRoZSBkYXRhDQo+IGVycm9yOiB1bmFibGUgdG8gc2lnbiB0aGUgdGFnDQo+DQo+IE1l
YW53aGlsZSwgY291bGQgQFBhb2xvIEJvbnppbmkgb3IgQFN0ZWZhbiBIYWpub2N6aSBoZWxwIHRv
IHBpY2sgdGhlIHBhdGNoIHVwIGFzIHRoZXJlIGlzIG9ubHkgb25lLWxpbmUgY2hhbmdlIGZvciBI
QVggYW5kIHdlIGhhdmUgdmVyaWZpZWQgaXQgZm9yIGFsbCBndWVzdCBsYXVuY2hpbmc/IFRoYW5r
cyBhIGxvdC4NCg0KWWVzLCBwbGVhc2UuIEZvciBhIHNpbmdsZSB0cml2aWFsIHBhdGNoIEkgc3Ry
b25nbHkgcHJlZmVyIHRoYXQgc29tZSBleGlzdGluZyAoaW4gdGhpcyBjYXNlIHg4NikgbWFpbnRh
aW5lciB0YWtlcyBpdCBpbiB0aGVpciBwdWxscmVxLCByYXRoZXIgdGhhbiBteSBoYXZpbmcgdG8g
ZGVhbCB3aXRoIGEgcHVsbHJlcSBzdWJtaXNzaW9uIGZyb20gYSBuZXctdG8tdGhlLXByb2Nlc3Mg
cGVyc29uLg0KKEl0J3MgZXh0cmEgd29yayB0byBjaGVjayBzdWJtaXNzaW9ucyBmcm9tIG5ldyBw
ZW9wbGUsIHdoaWNoIGlzIGZpbmUgaWYgdGhleSdyZSBnb2luZyB0byBiZSBkb2luZyB0aGVtIGEg
bG90IGluIGZ1dHVyZSwgYnV0IGZvciBhIG9uZS1vZmYgaXQncyBhIHdhc3RlIG9mIHRoZWlyIHRp
bWUgYW5kIG1pbmUuKQ0KDQp0aGFua3MNCi0tIFBNTQ0K

