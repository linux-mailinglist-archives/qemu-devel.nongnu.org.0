Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B9458C4EE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 10:33:43 +0200 (CEST)
Received: from localhost ([::1]:34658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKyCa-0003IO-7a
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 04:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oKy9Y-0001Tj-9K
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 04:30:25 -0400
Received: from mga09.intel.com ([134.134.136.24]:13777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oKy9V-000631-Bc
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 04:30:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659947421; x=1691483421;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Hmenlw2cNzw1wBt1Rh2xBGDFG5gDCdd/NIyRdVsV2sc=;
 b=V3GWdQiRjXqHOnzPVeR7s0hRKwrp2Hvviq2QsRn7y+WwI9/nOOXPi8CP
 8sHAMR7Z2xz5jmnLnyuon7YBNXHxmaohFV4tvVf1Rg/nTnXkf4Sh+WuD4
 pud89NRKZzdRyo7SsApcQkyWkli0M5RocKW4Y9k8ISJjGKu+OQXVLC3cm
 dw+vsWTHK1xCzWzehe+i/wpkGRICnFEs2mGXMuCc3bIh5EvoB0JKnMRdi
 aCYDsGlCkXIK1zeKO8HmUyo9uPCgylIvBl4tUWDjAC8J5bCrUHHQv8mhz
 AGSRQfcQbozQHLnBZXeBhQiwLcajelK7KSre5K6pcrFDshdrx7nwE1C3U Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10432"; a="291314265"
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; d="scan'208";a="291314265"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 01:30:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; d="scan'208";a="746548098"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 08 Aug 2022 01:30:18 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 8 Aug 2022 01:30:17 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 8 Aug 2022 01:30:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 8 Aug 2022 01:30:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 8 Aug 2022 01:30:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJvG6BvdM1c7lSEE67dyntBSexVJFzOjaUQ9/Ft4QXU/ULYevfV6w4+5gXWg4oRU2yYt4VgM0Eck1IkhYRod91mjKe+YOJdKsSNkhj9mFg37/azqOoK5dPg+l1drCz4ht2BcsssHBBJ5BN2+T3ULwvswQV2wiYxCmiQ8oaidLDY2KnuOVLaXfa7a+GrglWDFO5LnlZKN8YZJtrcj12o2tcsFrwocuEXZ+4IxQ27VwFupZFEbxSfIWR+B0EKlAw4qEt4gztagdxw1O5OUO7jpAhRsS/aSs0y1eLZLsdHcaJzE43UbmAFsd9yyipZB6Wprn7jG8M0rJxT6VSBzrnLjxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hmenlw2cNzw1wBt1Rh2xBGDFG5gDCdd/NIyRdVsV2sc=;
 b=J58EeeXcUamzA2fNc/rqDKJcvqvvtU/58VMlrBHAC1AE3Oxcqk3CmpiLQiBLFWQliKimgf7JZ/7nWa+UxRU/WvsH6PoTwKtKkSJMPp4PgI0Z/VBlAOVdZ82jtYwgAGb4O69wmE9SoYlRzhNugk1OpdLpFMk3RrcWnSL++vZEn089GDZVVXil5wlwlauBjbFgpqRV+KyXNlwnT7YldiV++5z7qvMOkktjMBsuH3wTk/Jy2ZVEbOPZ6nc2FuSkjB84XxhQ6cu9Ft62nfsivNrlV4rLlxZuqg1Q42IkMP3m26hoGJMGuyBxjDE5clido9UPIh20N0m+kZ1D6INxPEF0Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5465.namprd11.prod.outlook.com (2603:10b6:408:11e::18)
 by DM6PR11MB3290.namprd11.prod.outlook.com (2603:10b6:5:59::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Mon, 8 Aug
 2022 08:30:14 +0000
Received: from BN9PR11MB5465.namprd11.prod.outlook.com
 ([fe80::e9b7:c3cd:e2d3:6d99]) by BN9PR11MB5465.namprd11.prod.outlook.com
 ([fe80::e9b7:c3cd:e2d3:6d99%3]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 08:30:11 +0000
From: "Xu, Ling1" <ling1.xu@intel.com>
To: Thomas Huth <thuth@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "quintela@redhat.com" <quintela@redhat.com>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>, "Zhao, Zhou" <zhou.zhao@intel.com>, "Jin, Jun I"
 <jun.i.jin@intel.com>
Subject: RE: [PATCH v3 2/2] Test code for AVX512 support for
 xbzrle_encode_buffer
Thread-Topic: [PATCH v3 2/2] Test code for AVX512 support for
 xbzrle_encode_buffer
Thread-Index: AQHYqvtX5prsI6nc/EyQiR66TXzv+62kpiIAgAACHzA=
Date: Mon, 8 Aug 2022 08:30:10 +0000
Message-ID: <BN9PR11MB54659C1296445DF1060B3B99D1639@BN9PR11MB5465.namprd11.prod.outlook.com>
References: <20220808074837.1484760-1-ling1.xu@intel.com>
 <20220808074837.1484760-3-ling1.xu@intel.com>
 <4a5c4a35-908d-4cb5-e90d-13d4eb8ab551@redhat.com>
In-Reply-To: <4a5c4a35-908d-4cb5-e90d-13d4eb8ab551@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e32717e5-b0e3-4376-9c5d-08da7918357e
x-ms-traffictypediagnostic: DM6PR11MB3290:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HM10l39gCX+jajdVG+9O+X97w+GCvzmS1c1wbs7Hq3aNM7kuhfYGoHQvhR/o4/hKjSMViYGPHWd3/Fwjc1aFLRArGRB2sWucLrcEAsprQVbW1c0OJOSZCnEM96fEDtIjCKruEEK2nZMHyxkWf2ye5DzN3juZ7T0dFDM3eQOq+J9wBUpLLcl+XvRQx1ZqRx+Xq1yEfpi00B+fPejBdf86PXYRxRxy8Q72DyBNGqh+7ZtPwbDueT8NvhK2i8a0hFYpCQJbjYugqn7Tyb3+Bv+H7ljbykhJM5zb0gsTxkc2mZu1c2/PYz9SgKWdy9Z1nTM6Wpz0rRDEVI8nJISx+vPKnHVlOQ0t39fl50T2+n5eGpbjwQMI8d9xFecS0P5MAdoE5eut7xlcxY0+Cgl9+daxaj5z1hMfXipUZd/ghmTFoZvyD9NwQr5JOKoYlq6jQ2P885iemSWdYf71SBb83G9+EAHkD+NQ22diI1t+n2ujENgWQJGgEg93izTkrjfQycFD59KNHgLoYiv3SJYXEk5/TK4co3ZPmw9uLCUS9xVptWS6wiSM4Fwp7c4v/5EpSmRcNG5ThDoW9TonA8f1D1ff4+ljd8dDcgrYb4PcD7vmvqt0ZbF8ciXPBOxWWQCBrFG4u18wn2A+QHVJB/ampKFM6Aifjr9W+CIpiJs600Fw3zCtFq776bzD6EvymCgd+U8LBoShSUYbe72qof/vDuTT3upBPKE0ZfhnxBgDgjtDhBKISlu/WUAiCTOKkr5fivBD4gSsa7PaeR3+vxzTUF4GgqS8v+Hto6Oj4jJltDI05s8/0IWErK8N1yrGXR//XpSr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5465.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(39860400002)(376002)(396003)(136003)(9686003)(53546011)(38070700005)(26005)(33656002)(478600001)(5660300002)(82960400001)(38100700002)(2906002)(7696005)(6506007)(41300700001)(86362001)(122000001)(4326008)(66946007)(64756008)(66446008)(66476007)(66556008)(76116006)(52536014)(83380400001)(8936002)(8676002)(110136005)(107886003)(54906003)(71200400001)(316002)(55016003)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEZrSUVnSnpOTmIvWWJHNmJsRXZMd2Y2ZnpUMWhHejAxYVlCa2FqTlpzTjB5?=
 =?utf-8?B?VGh0dFdsaWdlOEExSXV3TUs5Sk43REhONVlQOForekl6RytVNzV6Z1J3MmR4?=
 =?utf-8?B?bUNKVWFUTzNXemJmUG95QmxxRlI3cXhFWldSVXI2VUhOME9BSVUzbjErQk9V?=
 =?utf-8?B?NEdieFU1dzROSE9SNWVHS3o2dFNRNkU2VGFLVEd4T1ZldGpXUjFRT1EweEh2?=
 =?utf-8?B?TGViMWY2VldUdm1SZ0dFdkRySnBYYjV5Uitra0dkYU1YMk5zQ1czWmo5dXZQ?=
 =?utf-8?B?dGxrUjBKMzBIS3hsaDQ2Y1FnQ2JyMjZNV0ZMVnZvTlN5UGpvemlzVlpDNnZh?=
 =?utf-8?B?Ukt4ZU9hd3UwMkxUb3QxYW5xTGVlelh3dmJYUnhrYVZvYzgyT0JkVlU5MW54?=
 =?utf-8?B?L1FMRWl4QkxCRFdlYi9uazhLd1hCWTZvTFJQbW8vMElZaVdCYS9kSmtmeUFi?=
 =?utf-8?B?NTRKK0VsWGhFeExDV094NnZZcndWWHZtZkx1K1V1Q1pRcjMxRkppeWkxU2xp?=
 =?utf-8?B?Wk1uTU9RamZ6TnVIM1J5N2puSVk3MzFQUFNES3laZ0dheWpzV1FYcHo4VDZY?=
 =?utf-8?B?YW1KaXNDM2VTNlQ5VjVhaVVyT29yK0NlMU8yYk5jdWNLWkpmTU8zRFV6eVdV?=
 =?utf-8?B?WDBjUWRCYUVvYXM4elNIVzJpZGVQc3pKQVFFZ2E5eTNTOXgxUkNyYkZPRW5V?=
 =?utf-8?B?eUp3VUpKbVVnUDVSZFZleXFPclJWazlMb2pCVE5qVUR5YWs2bGVubnJLUmQz?=
 =?utf-8?B?aWl5ZFRJNmhOVlpvczJvN0xKTnZHTXNZWFc5WG5ZNmQ1SFVCWTNHbVNMdjVL?=
 =?utf-8?B?aFJ5cE5XL3kzbUJrMHBXTGJXRkhoQURJUmtZUXVpTEoxZWp1di9RM3h4WVV1?=
 =?utf-8?B?MjVRSDZsUDJtUVhsaDZRZ0VUVXJSbm9NckI4djBWZVkza1NaQzJNZUpEWUlF?=
 =?utf-8?B?bUY1bzhCY0JmQUxtNlNpNm1CVmxNY3hRd3hMTmVKSHVVWmEzVU1EMU9KN1dJ?=
 =?utf-8?B?cVg1c0s1UTlscWpURlo3VG0rcFNpcjhCT2J1eUpNZXB4Q1dKb0VXbjdJMlJQ?=
 =?utf-8?B?MnAyVHliN3BGNDRjNTgrWXkyWHlYWW0raDAwZ2tYT1JBMEJRa0pQTGR6TVF6?=
 =?utf-8?B?VDk1M0g0ei9UQ3ZJSTg3MlpIZjVCVlV3eGs3SDJQRUg3OTJTRmpSdGFxSFZD?=
 =?utf-8?B?VXQ4bHNIRWNnSjhJNU9rR3NzOG1LaFgvWE9UanNUeHpWSXNEOXpRK0xGSVNv?=
 =?utf-8?B?WUxMUXdlKzhkeGNEUzNFUGZoTGdsTDJXWEd4VW82Q2xRSEpCV0owNHBzRUFB?=
 =?utf-8?B?ZVhITkZVbGJCSmgxL0krMVdDU2RzczV6cUQ2YnppWkNVRXFtODZZdGp0Wmhm?=
 =?utf-8?B?cDdzSW1jWDBZQU9Gcmh6SGNIUVBoYzBCdGRtMlJhWFBETlVtNGFHbklQYW5Y?=
 =?utf-8?B?MGZnWEFzMkc5OUtKNWIzL0p0UW40OWxscWMreitkMDkzK0gzdm55Zys5SlEx?=
 =?utf-8?B?dmJJcHZQckRJcGxVWm5TTHNON1FWRnMrM0N6QWpSRUlBMUliUm5zR01raDFU?=
 =?utf-8?B?N1k1eFk3YlMydVVyYTFsUTZWK0kwMTZkTlYvcW84K0lEK1VpL1B3ZDd3OGRQ?=
 =?utf-8?B?M2cyVTAzYmU2OXBYbU9KN1pqSkhIR3JKZmVvNnR6S1FoSFQ5VmJmK1oybHkv?=
 =?utf-8?B?elhzMlZxc1BITzNiMEpkVDd3Q0JPTW90SkpqbXdPQ1Z2RCs2VlJ2R1duU1l4?=
 =?utf-8?B?WEQ0Wk9OVUlHT2Y2MXJBMUUxYkJCdW5DS1FHdk1sTHNmbFpYbmthOWJ5Y1Y5?=
 =?utf-8?B?THg5dE91TEhTSlpMUnVURStWNU5HL0liMFg3WHJKdzFYSldFamkyV003eDhF?=
 =?utf-8?B?S25TOVBuMHdKZis3eWNxWnFTWndKU3pmaUZDKzBGc0xIS1V0MVpLaXJQMFBN?=
 =?utf-8?B?c29RNUVZZ3dGMEpybVg1aGZRdlZuRXNTMHl4OFVCYVpTcHlOVFJXT1FHZnB1?=
 =?utf-8?B?S2IwYkZEdXorMk4zUWFKYU1yWVBDL3BZZGlBdkxVanp2YlF4c0J6dTBvbFp6?=
 =?utf-8?B?NUQ0UzBNUGJSZ3F5eUVEbDh2SkpnYlpiVCtROHZrT2l0eEMxWnVSQXJCbS9V?=
 =?utf-8?Q?fujEuXDkinGveQsGes9LmDnRq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5465.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e32717e5-b0e3-4376-9c5d-08da7918357e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 08:30:10.7669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kLIn7TOCRGz+ptAzh3PTvT1+GujnxUt4w14ZW7nUygyptrW2BspxYYieU0x/UVsYkTo9Pqo4XK1WVyxkIdjiBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3290
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24; envelope-from=ling1.xu@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

SGksIFRob21hcywNCiAgICAgIFRoYW5rcyBmb3IgeW91ciByZXBseS4gVGhpcyB0ZXN0IGNvZGUg
Y2FuIG9ubHkgd29yayBvbiBzeXN0ZW0gc3VwcG9ydGluZyBhdng1MTIuIEl0J3MgcmVhc29uYWJs
eSB0byBhZGQgY29uZGl0aW9uIGNoZWNrIGluIHRlc3QgY29kZSB0bywgYWdyZWUgdG8geW91ciBz
dWdnZXN0aW9uLiBJJ2xsIGFkZCBjb25kaXRpb24gY2hlY2sgaW4gdGVzdCBjb2RlIGxhdGVyLiAN
Cg0KQmVzdCBSZWdhcmRzDQpMaW5nDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4gDQpTZW50OiBNb25kYXksIEF1Z3VzdCA4
LCAyMDIyIDQ6MDkgUE0NClRvOiBYdSwgTGluZzEgPGxpbmcxLnh1QGludGVsLmNvbT47IHFlbXUt
ZGV2ZWxAbm9uZ251Lm9yZw0KQ2M6IHF1aW50ZWxhQHJlZGhhdC5jb207IGRnaWxiZXJ0QHJlZGhh
dC5jb207IFpoYW8sIFpob3UgPHpob3Uuemhhb0BpbnRlbC5jb20+OyBKaW4sIEp1biBJIDxqdW4u
aS5qaW5AaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCB2MyAyLzJdIFRlc3QgY29kZSBm
b3IgQVZYNTEyIHN1cHBvcnQgZm9yIHhienJsZV9lbmNvZGVfYnVmZmVyDQoNCk9uIDA4LzA4LzIw
MjIgMDkuNDgsIGxpbmcgeHUgd3JvdGU6DQo+IFNpZ25lZC1vZmYtYnk6IGxpbmcgeHUgPGxpbmcx
Lnh1QGludGVsLmNvbT4NCj4gQ28tYXV0aG9yZWQtYnk6IFpob3UgWmhhbyA8emhvdS56aGFvQGlu
dGVsLmNvbT4NCj4gQ28tYXV0aG9yZWQtYnk6IEp1biBKaW4gPGp1bi5pLmppbkBpbnRlbC5jb20+
DQo+IC0tLQ0KPiAgIHRlc3RzL3VuaXQvdGVzdC14YnpybGUuYyB8IDMwNyArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMjkwIGluc2Vy
dGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL3VuaXQv
dGVzdC14YnpybGUuYyBiL3Rlc3RzL3VuaXQvdGVzdC14YnpybGUuYyBpbmRleCANCj4gZWY5NTFi
NmU1NC4uNjUzMDE2ODI2ZiAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvdW5pdC90ZXN0LXhienJsZS5j
DQo+ICsrKyBiL3Rlc3RzL3VuaXQvdGVzdC14YnpybGUuYw0KPiBAQCAtMzgsMTExICszOCwyODAg
QEAgc3RhdGljIHZvaWQgdGVzdF91bGViKHZvaWQpDQo+ICAgICAgIGdfYXNzZXJ0KHZhbCA9PSAw
KTsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgdm9pZCB0ZXN0X2VuY29kZV9kZWNvZGVfemVybyh2
b2lkKQ0KPiArc3RhdGljIGZsb2F0ICp0ZXN0X2VuY29kZV9kZWNvZGVfemVybyh2b2lkKQ0KPiAg
IHsNCj4gICAgICAgdWludDhfdCAqYnVmZmVyID0gZ19tYWxsb2MwKFhCWlJMRV9QQUdFX1NJWkUp
Ow0KPiAgICAgICB1aW50OF90ICpjb21wcmVzc2VkID0gZ19tYWxsb2MwKFhCWlJMRV9QQUdFX1NJ
WkUpOw0KPiArICAgIHVpbnQ4X3QgKmJ1ZmZlcjUxMiA9IGdfbWFsbG9jMChYQlpSTEVfUEFHRV9T
SVpFKTsNCj4gKyAgICB1aW50OF90ICpjb21wcmVzc2VkNTEyID0gZ19tYWxsb2MwKFhCWlJMRV9Q
QUdFX1NJWkUpOw0KPiAgICAgICBpbnQgaSA9IDA7DQo+IC0gICAgaW50IGRsZW4gPSAwOw0KPiAr
ICAgIGludCBkbGVuID0gMCwgZGxlbjUxMiA9IDA7DQo+ICAgICAgIGludCBkaWZmX2xlbiA9IGdf
dGVzdF9yYW5kX2ludF9yYW5nZSgwLCBYQlpSTEVfUEFHRV9TSVpFIC0gDQo+IDEwMDYpOw0KPiAg
IA0KPiAgICAgICBmb3IgKGkgPSBkaWZmX2xlbjsgaSA+IDA7IGktLSkgew0KPiAgICAgICAgICAg
YnVmZmVyWzEwMDAgKyBpXSA9IGk7DQo+ICsgICAgICAgIGJ1ZmZlcjUxMlsxMDAwICsgaV0gPSBp
Ow0KPiAgICAgICB9DQo+ICAgDQo+ICAgICAgIGJ1ZmZlclsxMDAwICsgZGlmZl9sZW4gKyAzXSA9
IDEwMzsNCj4gICAgICAgYnVmZmVyWzEwMDAgKyBkaWZmX2xlbiArIDVdID0gMTA1Ow0KPiAgIA0K
PiArICAgIGJ1ZmZlcjUxMlsxMDAwICsgZGlmZl9sZW4gKyAzXSA9IDEwMzsNCj4gKyAgICBidWZm
ZXI1MTJbMTAwMCArIGRpZmZfbGVuICsgNV0gPSAxMDU7DQo+ICsNCj4gICAgICAgLyogZW5jb2Rl
IHplcm8gcGFnZSAqLw0KPiArICAgIHRpbWVfdCB0X3N0YXJ0LCB0X2VuZCwgdF9zdGFydDUxMiwg
dF9lbmQ1MTI7DQo+ICsgICAgdF9zdGFydCA9IGNsb2NrKCk7DQo+ICAgICAgIGRsZW4gPSB4Ynpy
bGVfZW5jb2RlX2J1ZmZlcihidWZmZXIsIGJ1ZmZlciwgWEJaUkxFX1BBR0VfU0laRSwgY29tcHJl
c3NlZCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIFhCWlJMRV9QQUdFX1NJWkUpOw0KPiAr
ICAgIHRfZW5kID0gY2xvY2soKTsNCj4gKyAgICBmbG9hdCB0aW1lX3ZhbCA9IGRpZmZ0aW1lKHRf
ZW5kLCB0X3N0YXJ0KTsNCj4gICAgICAgZ19hc3NlcnQoZGxlbiA9PSAwKTsNCj4gICANCj4gKyAg
ICB0X3N0YXJ0NTEyID0gY2xvY2soKTsNCj4gKyAgICBkbGVuNTEyID0geGJ6cmxlX2VuY29kZV9i
dWZmZXJfNTEyKGJ1ZmZlcjUxMiwgYnVmZmVyNTEyLCBYQlpSTEVfUEFHRV9TSVpFLA0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcHJlc3NlZDUxMiwgDQo+ICsg
WEJaUkxFX1BBR0VfU0laRSk7DQoNCkRvZXMgdGhpcyBhbHNvIHN0aWxsIHdvcmsgb24gc3lzdGVt
cyB3aXRob3V0IEFWWD8gSWYgSSd2ZSBnb3QgcGF0Y2ggMS8yIHJpZ2h0LCB0aGlzIGZ1bmN0aW9u
IGlzIG9ubHkgZGVmaW5lZCBpZiBDT05GSUdfQVZYNTEyQldfT1BUIGhhcyBiZWVuIHNldCwgc28g
dXNpbmcgaXQgdW5jb25kaXRpb25hbGx5IGhlcmUgc2VlbXMgdG8gYmUgd3Jvbmc/DQoNCiAgVGhv
bWFzDQoNCg==

