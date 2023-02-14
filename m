Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ED269599A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 08:06:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRpNd-0004GH-PA; Tue, 14 Feb 2023 02:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1pRpNQ-0004Cu-2G
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 02:05:27 -0500
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1pRpNN-0004uy-SL
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 02:05:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676358317; x=1707894317;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XJ70P7lnlqX2pCkXuEKokR3A63LDZ4MiIegq8w2XcLo=;
 b=V5X8hdzuNt1HwvsExn+FfXRlqU+bA9RXoNqdBBLvB1dbb6/3lPg8ahfj
 fJfhZi4FnatWjKF1rN+97WlgFtoAt5helLtq7IQkOVt8RYoF7Wm6KNI7L
 2xhfIghPACYolyvuORX897zQESNrouPeD4NAZ7x7Q7sw36dL4jga+4sn6
 vzn14gPI1jw5R7kw3IpK12V/mRkjpb5AFL6MgF4dT5wISSi1SNuwlsR8A
 C/WcqCQMZrD/gL6seHf94dXgLzBIZtJDUR3adq0OTYdqAJ8/AVgix+IkP
 VVQcDL75dDQaN1Gdt11qz5SUMbIh520obUxNgTfajBiiaS19XHEi8VtYC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="328804101"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="328804101"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 23:05:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="793014393"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="793014393"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 13 Feb 2023 23:05:00 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 13 Feb 2023 23:05:00 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 13 Feb 2023 23:05:00 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 13 Feb 2023 23:04:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XT8FLkU9wRN73xXdMO1+OiMd/ZyLWuPHPbOadQc36RaxYISXPkvDUtd+FqnWiRgtDyqXDOnOtVDWlAfdVtHdkvkpAQg+CGcLwReyv9ZOLqiKJpuGQmYWWr4fjGEouTw93CaaJtPy2ahBDeh/96iWd/HENxE08ZrVJLTqgevKKZVU9gLoWt/0KsKWEBLq9b/vCceU4ZMRJZpajzrlbTr6SFu/rg6LycAvMtLl34VUhmLdULZ5XJZ4BpheHq4uo5gLYIFdiu7Hp2MTj+oD4/n3E1XXuMI1ZAvrLl3wuM/pymcCPJ1MO5wN8bTgqwB1NrZA9heOCFdTUIdniu5XfY5zKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJ70P7lnlqX2pCkXuEKokR3A63LDZ4MiIegq8w2XcLo=;
 b=Src+Udi5IaSawNUw7qHu0ibzxj+f06K02DqUBvcibZOfFx5EpBXHbjfSfL1etBLsTtUFMOD3NhibfAGMwNJYIYs7mA0xLgjp00DakYkktVKHqcvecGWrbuPAp+Gy064W+1y5s0JAvGoDats46jm/E+MsIWk4VXdykIJKG8d8WD8g3vbKYLXIiahcaoU984xuNXRWdoKEHJP6aniUwqm1fRqOYxwatUuXdnPvmjrJeL59ql1/s9hpPFitqaV/CxG2aWXrxcmqw95uSX+MWNUEDlfKZdyXhleMVcVLoN7EFNSRdPhseD88mLMULFxBtkJAKM5vwuemPUqiDOA2pzRkcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 07:04:58 +0000
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::f42a:63d9:2c7:356a]) by SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::f42a:63d9:2c7:356a%4]) with mapi id 15.20.6086.026; Tue, 14 Feb 2023
 07:04:57 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Jason Wang <jasowang@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "eduardo@habkost.net" <eduardo@habkost.net>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>, "david@redhat.com"
 <david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>
Subject: RE: [PATCH] memory: Optimize replay of guest mapping
Thread-Topic: [PATCH] memory: Optimize replay of guest mapping
Thread-Index: AQHZQCZutfT/VxSah0G4zWGZxxF26a7N+ekAgAAChtA=
Date: Tue, 14 Feb 2023 07:04:56 +0000
Message-ID: <SJ0PR11MB6744F710B0E621272A35060892A29@SJ0PR11MB6744.namprd11.prod.outlook.com>
References: <20230214034211.683203-1-zhenzhong.duan@intel.com>
 <CACGkMEse_BFRaTV0NkvsGD_ptsTzrBGKLBZg59NtSCR_Z-=V1w@mail.gmail.com>
In-Reply-To: <CACGkMEse_BFRaTV0NkvsGD_ptsTzrBGKLBZg59NtSCR_Z-=V1w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6744:EE_|SJ0PR11MB5087:EE_
x-ms-office365-filtering-correlation-id: f06b6ea1-b107-4680-9c1d-08db0e59c7be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gg4yHTiO7wr4UtPIVAhk3fMmsrQ9FFI9k7qyJs8Q00vwqHAeuuZ24QW8hQ7ftNWpIgiylI1pdJldeFWQgdsBV6hndesd42Okq5UrF/IvvYtEW5hvpZjuODJtbk2lNsLw29EIoTbfUuKfKmXKdY92kr8NPyX+FlG3iOO49Kltqylcv3DxbM8ANORXuXP3/rIPg9ciaK16mSBdQnYEh+3zzJpTbxFxos9UJe2ngE5t/n79yEY+vzp2xAbmUufsQGCoi8Okgo5/wGt5hhXf7U4VelfdmVnVVfV73ZJqlerphjh44X9d1Mc/IfSdWFUjlPV7f1jVzTklWuJCbr4ZgynN5bHBrLQN8pwHwXInbEx8hAm4wC1s1u6Bn9WP/ulxK1ZRx7jipuAtzHCNnyeXjWOqcU41yzFF4EPhxgs0k4/ohvGwhrKb3UAoE2PLxdWnApaFw/lbTf1rCBvgSyv8GylHDoZ3XrhpRbpYzi6f/voDYExs5mMXtwc/41sTou4HYaqBB2S3JgI90FMQQFuRk0GeqVScUg8uIlfkhRlVa4Ul+6dd5Pj/zHzfFzk4IMefjIXGPV5F9wlfJcaqsg+rx0SqCuTUnZ9Abcuvx2VszzljBsPDIGiY2ohHXmnaBEnMDXEVWEqMAIUjTgTrMH5VzgclopZuIbanLIBildzKf8EPomaxz7GVXH60/DigqIUjNI+7pSs/Y7v57E4e6oflLR9Vgw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6744.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199018)(478600001)(316002)(38070700005)(86362001)(33656002)(54906003)(9686003)(2906002)(66556008)(66476007)(7416002)(5660300002)(4326008)(8676002)(66446008)(66946007)(6916009)(41300700001)(186003)(26005)(6506007)(71200400001)(7696005)(55016003)(64756008)(38100700002)(82960400001)(8936002)(76116006)(52536014)(122000001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3oyeFJQTnUvcXB6SkRwV1lDbDRZNUlabHl0eCtKUHlpWEdZa1RoblBhRGJa?=
 =?utf-8?B?MVRtSlEvbzd4VTZ1VnJ4RjhwQzg1cktNbHg1Wjcyb1M4ZUhBYTQyVFN6dUcz?=
 =?utf-8?B?ZHlLVXpGcVJmREpHKzhiRzdLNWxkNWtGZHZweXdwQk9IZWVrQ3p1TnR6dS9w?=
 =?utf-8?B?WUF6YjNxZHZ2WGpERXVPQTZ4bW0vUVNmWlpGNEcvSXlDanpSNWV6TG9aSFZ0?=
 =?utf-8?B?Mm9uODlPVG5Vdk5ZRlVMZ2xXeEUzL3ZzREJHTGNQcXl1aHE3dGVCQ0EwRld3?=
 =?utf-8?B?SnplcVFoTTdCWVZEdFF4c3lLQzVLZyswalFTb3VWV3ZvM3oxb2x3b1lBWXlz?=
 =?utf-8?B?MmJjVngrWUY3b3d5WW5YenRneS9KNFhiOU5LVTNWSUlmRG9Zc21VRFRyQWp1?=
 =?utf-8?B?cDBPbW1ZZDhEQ2FaTWhkaVg2ZUl0cENUTzRFMVdoMllibUFuTkQwb3B5aEdx?=
 =?utf-8?B?Y0x5N0FWYkE2UHNsR1kvQmxnRkFvUUxGMFhRVWJOQ0twMTExd1RWT0JRdzdt?=
 =?utf-8?B?MkQrSFRIbjJjWGtlR2NZN2FWVkhmWmRMbjd3N2UxUGxJMzArN2tBSS93MENT?=
 =?utf-8?B?TXErdjNyek1sWk93cHkySTRjRk1jcGdCM3U4NDQ4Q2s0czBUQW9VSTJFOHp4?=
 =?utf-8?B?dkRBRURJS0FVTEtvVjFwaDMvZVc2T21waFAweG5GTHh2b0hQVFlRWjhZN1NM?=
 =?utf-8?B?ZkdGSzY0NVh6alYrMjhodkVRbU83YlR3Q2E2a044cEJIR2E3d0lCVE1VYUhw?=
 =?utf-8?B?SG5VakN6QUZRRFNOeGpaNnRWR0E0YXI5OXEybUxIYU56dDA3b0xobmp5Zmli?=
 =?utf-8?B?ODNncTc4dm1reGN5TnZjcFRCaUZpeTN1MW1WTkhFZEtFN0NTNGlFSy9QMnJP?=
 =?utf-8?B?enhsZGJWTFRMWEN6dUpqTkNjOWNMQ0RQTlVXYitRcnJXZHJlYWk1RHFVOEZs?=
 =?utf-8?B?R0FLTzNET1crNWNiOXN6WVVMRTUzWTE4MlV2MVhkaVdwRklZWCtrb015UThJ?=
 =?utf-8?B?WGxqcTJXZkZWekUwUXRRTktra3I2THVxSzJNdFhHbzJ6dnhLWFk4VWtOaWgx?=
 =?utf-8?B?dzk2ajlPbkw0UkRkVFNkdC9rMERDOWlJYWx4blNNREtDLzI1aGJZa0RUc1U4?=
 =?utf-8?B?ZFpwTjVmUnlUTjF3dElqVDgrdm5GSGFBU2cwR3BicVRNeHllT3U4c01Oa1Rx?=
 =?utf-8?B?eDR6M052TWVkR1BZaTZoQUFuc05tS1lTYlJvalJZY1dvbzNURldqbnRyRzFX?=
 =?utf-8?B?RFZINFJheThjaWdzaW9xeDZIVTdkNW5KQm90NkxsckduRmZzVUlSUHB6V0g0?=
 =?utf-8?B?TDNkd1FCYWpQQlhldktvaFhJM3lMVkRYem9ucldQQnM4QXRZV0lsQWlHamFR?=
 =?utf-8?B?eFE1b2M2QUptMEpiWm5RVUMzRTl2dytwM1QzUVI3N1VMY0RreGVSb2dlRk5j?=
 =?utf-8?B?WTZoWFU5T3hiU3RmQ3hTOVRlcHV3VDZPL1pydXNETUJNbE56eHZXSVJvSDhq?=
 =?utf-8?B?aVBxa05PNHVFU0RDbnBPUXBUUmZldlU1ckJSZ0R4cGhlOU1lSlpLOTVQb01o?=
 =?utf-8?B?YUdwYXBEUEIrMmxReVRXNnF6Z1kvNEVZY1I1MWxhMTM5a1Awa3FTVEk2blNV?=
 =?utf-8?B?NHNlMGxtek80SlNueklLOElsVFcwSXllK1lkSFpBQ250WHNCREZMQ0FxcDh3?=
 =?utf-8?B?SVI4aXFzeUZRa001M255K1dnM3BZMXRraXpFc1pFZFJVSWtLYWlqckN1enBi?=
 =?utf-8?B?U0VZY2NsVUg5anBUVk13TC80alZoUm1EdXVUYXFUR2lIUEtIMXNtK3NEM2I4?=
 =?utf-8?B?ZXBpTlp0QWhYRXE0Tm1lNlBkQVlhMDlkUnl0MWFxNWNpbGwvclBKaFU1QWpo?=
 =?utf-8?B?L1o5RndlU2xLZllLOXJyNElQbDJRN1h6b0x6eUJBcWo5bzNza01EaUNuT09B?=
 =?utf-8?B?V2h6NUR4YVhCT1J0TERqcTVmRW9xeHNKbG9DSVNqNm9pNm50SmRuaDZqSnF2?=
 =?utf-8?B?U3IyZm16UE9NanU1Nm9XeHVSNWUxT0ljSXlpN2wxb25acGVsWWNheE5tbHN5?=
 =?utf-8?B?ODU0YWFBNi9pZFZkemZjOE15QURiR3FzR09SRWFYakJGTmQwNTNZOHFTT0tH?=
 =?utf-8?Q?BNr/732TGEM1WOn7HX9/+UX7f?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6744.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f06b6ea1-b107-4680-9c1d-08db0e59c7be
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 07:04:56.8468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8ZUvI0lqzvVR7U7h9gMDf6UT/t03/4fwYk9c48DGrKz3wBZr9fZT/PtqbDD2wMeioy1bOVOdYc3t8nSM4fU/pEnInQnod9qYrJPsaIHMA6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.93;
 envelope-from=zhenzhong.duan@intel.com; helo=mga11.intel.com
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEphc29uIFdhbmcgPGphc293
YW5nQHJlZGhhdC5jb20+DQo+U2VudDogVHVlc2RheSwgRmVicnVhcnkgMTQsIDIwMjMgMjoyNSBQ
TQ0KPlRvOiBEdWFuLCBaaGVuemhvbmcgPHpoZW56aG9uZy5kdWFuQGludGVsLmNvbT4NCj5DYzog
cWVtdS1kZXZlbEBub25nbnUub3JnOyBtc3RAcmVkaGF0LmNvbTsgcGV0ZXJ4QHJlZGhhdC5jb207
DQo+cGJvbnppbmlAcmVkaGF0LmNvbTsgcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZzsgZWR1
YXJkb0BoYWJrb3N0Lm5ldDsNCj5tYXJjZWwuYXBmZWxiYXVtQGdtYWlsLmNvbTsgZGF2aWRAcmVk
aGF0LmNvbTsgcGhpbG1kQGxpbmFyby5vcmcNCj5TdWJqZWN0OiBSZTogW1BBVENIXSBtZW1vcnk6
IE9wdGltaXplIHJlcGxheSBvZiBndWVzdCBtYXBwaW5nDQo+DQo+T24gVHVlLCBGZWIgMTQsIDIw
MjMgYXQgMTE6NDMgQU0gWmhlbnpob25nIER1YW4NCj48emhlbnpob25nLmR1YW5AaW50ZWwuY29t
PiB3cm90ZToNCj4+DQo+PiBPbiB4ODYsIHRoZXJlIGFyZSB0d28gbm90aWZpZXJzIHJlZ2lzdGVy
ZWQgZHVlIHRvIHZ0ZC1pciBtZW1vcnkgcmVnaW9uDQo+PiBzcGxpdHRpbmcgdGhlIHdob2xlIGFk
ZHJlc3Mgc3BhY2UuIER1cmluZyByZXBsYXkgb2YgdGhlIGFkZHJlc3Mgc3BhY2UNCj4+IGZvciBl
YWNoIG5vdGlmaWVyLCB0aGUgd2hvbGUgYWRkcmVzcyBzcGFjZSBpcyBzY2FubmVkIHdoaWNoIGlz
DQo+PiB1bm5lY2Vzc29yeS4NCj4+DQo+PiBXZSBvbmx5IG5lZWQgdG8gc2NhbiB0aGUgc3BhY2Ug
YmVsb25nIHRvIG5vdGlmaWVyIG1vbnRpb3JlZCBzcGFjZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBaaGVuemhvbmcgRHVhbiA8emhlbnpob25nLmR1YW5AaW50ZWwuY29tPg0KPj4gLS0tDQo+PiBU
ZXN0ZWQgb25seSBvbiB4ODYgd2l0aCBhIG5ldCBjYXJkIHBhc3NlZCB0byBndWVzdCwgcGluZy9z
c2ggcGFzcy4NCj4+DQo+PiAgaHcvaTM4Ni9pbnRlbF9pb21tdS5jIHwgMiArLQ0KPj4gIHNvZnRt
bXUvbWVtb3J5LmMgICAgICB8IDMgKy0tDQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2h3L2kzODYvaW50ZWxf
aW9tbXUuYyBiL2h3L2kzODYvaW50ZWxfaW9tbXUuYyBpbmRleA0KPj4gOThhNWMzMDRhN2Q3Li42
YjFkZTgwZTg1NzMgMTAwNjQ0DQo+PiAtLS0gYS9ody9pMzg2L2ludGVsX2lvbW11LmMNCj4+ICsr
KyBiL2h3L2kzODYvaW50ZWxfaW9tbXUuYw0KPj4gQEAgLTM4MzEsNyArMzgzMSw3IEBAIHN0YXRp
YyB2b2lkDQo+dnRkX2lvbW11X3JlcGxheShJT01NVU1lbW9yeVJlZ2lvbiAqaW9tbXVfbXIsIElP
TU1VTm90aWZpZXIgKm4pDQo+PiAgICAgICAgICAgICAgICAgIC5kb21haW5faWQgPSB2dGRfZ2V0
X2RvbWFpbl9pZChzLCAmY2UsIHZ0ZF9hcy0+cGFzaWQpLA0KPj4gICAgICAgICAgICAgIH07DQo+
Pg0KPj4gLSAgICAgICAgICAgIHZ0ZF9wYWdlX3dhbGsocywgJmNlLCAwLCB+MFVMTCwgJmluZm8s
IHZ0ZF9hcy0+cGFzaWQpOw0KPj4gKyAgICAgICAgICAgIHZ0ZF9wYWdlX3dhbGsocywgJmNlLCBu
LT5zdGFydCwgbi0+ZW5kLCAmaW5mbywNCj4+ICsgdnRkX2FzLT5wYXNpZCk7DQo+PiAgICAgICAg
ICB9DQo+PiAgICAgIH0gZWxzZSB7DQo+PiAgICAgICAgICB0cmFjZV92dGRfcmVwbGF5X2NlX2lu
dmFsaWQoYnVzX24sIFBDSV9TTE9UKHZ0ZF9hcy0+ZGV2Zm4pLA0KPj4gZGlmZiAtLWdpdCBhL3Nv
ZnRtbXUvbWVtb3J5LmMgYi9zb2Z0bW11L21lbW9yeS5jIGluZGV4DQo+PiA5ZDY0ZWZjYTI2OWIu
LmYwOTY3MTZlNmU3OCAxMDA2NDQNCj4+IC0tLSBhL3NvZnRtbXUvbWVtb3J5LmMNCj4+ICsrKyBi
L3NvZnRtbXUvbWVtb3J5LmMNCj4+IEBAIC0xOTIzLDcgKzE5MjMsNiBAQCB1aW50NjRfdA0KPj4g
bWVtb3J5X3JlZ2lvbl9pb21tdV9nZXRfbWluX3BhZ2Vfc2l6ZShJT01NVU1lbW9yeVJlZ2lvbg0K
Pippb21tdV9tcikNCj4+DQo+PiAgdm9pZCBtZW1vcnlfcmVnaW9uX2lvbW11X3JlcGxheShJT01N
VU1lbW9yeVJlZ2lvbiAqaW9tbXVfbXIsDQo+PiBJT01NVU5vdGlmaWVyICpuKSAgew0KPj4gLSAg
ICBNZW1vcnlSZWdpb24gKm1yID0gTUVNT1JZX1JFR0lPTihpb21tdV9tcik7DQo+PiAgICAgIElP
TU1VTWVtb3J5UmVnaW9uQ2xhc3MgKmltcmMgPQ0KPklPTU1VX01FTU9SWV9SRUdJT05fR0VUX0NM
QVNTKGlvbW11X21yKTsNCj4+ICAgICAgaHdhZGRyIGFkZHIsIGdyYW51bGFyaXR5Ow0KPj4gICAg
ICBJT01NVVRMQkVudHJ5IGlvdGxiOw0KPj4gQEAgLTE5MzYsNyArMTkzNSw3IEBAIHZvaWQNCj4+
IG1lbW9yeV9yZWdpb25faW9tbXVfcmVwbGF5KElPTU1VTWVtb3J5UmVnaW9uICppb21tdV9tciwN
Cj5JT01NVU5vdGlmaWVyDQo+PiAqbikNCj4+DQo+PiAgICAgIGdyYW51bGFyaXR5ID0gbWVtb3J5
X3JlZ2lvbl9pb21tdV9nZXRfbWluX3BhZ2Vfc2l6ZShpb21tdV9tcik7DQo+Pg0KPj4gLSAgICBm
b3IgKGFkZHIgPSAwOyBhZGRyIDwgbWVtb3J5X3JlZ2lvbl9zaXplKG1yKTsgYWRkciArPSBncmFu
dWxhcml0eSkgew0KPj4gKyAgICBmb3IgKGFkZHIgPSBuLT5zdGFydDsgYWRkciA8IG4tPmVuZDsg
YWRkciArPSBncmFudWxhcml0eSkgew0KPg0KPklzIFtuLT5zdGFydCwgbi0+ZW5kXSBndWFyYW50
ZWVkIHRvIGJlIHRoZSBzdWJzZXQgb2YgbWVtb3J5X3JlZ2lvbl9zaXplKG1yKT8NCg0KSW4gY3Vy
cmVudCBpbXBsZW1lbnRhdGlvbiBpdCBpcy4NCltuLT5zdGFydCwgbi0+ZW5kXSBvZiBub3RpZmll
ciBpcyBkZXJpdmVkIGZyb20gaW9tbXUgbWVtb3J5IHJlZ2lvbidzIHNlY3Rpb24NCndoaWNoIGlz
IGEgc3Vic2V0IG9mIGlvbW11IG1lbW9yeSByZWdpb24gaXRzZWxmLg0KDQpUaGFua3MNClpoZW56
aG9uZw0KDQo=

