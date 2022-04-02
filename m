Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 483A44EFF4F
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 09:29:40 +0200 (CEST)
Received: from localhost ([::1]:35804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naYCZ-0005N1-Da
	for lists+qemu-devel@lfdr.de; Sat, 02 Apr 2022 03:29:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1naYAd-0004bz-2H
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 03:27:39 -0400
Received: from mga03.intel.com ([134.134.136.65]:40537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1naYAa-00080R-Fk
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 03:27:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648884456; x=1680420456;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WeIlDbZxqhHMVoUc/76qDbSBrrLJT+lkusbsWDcWqYs=;
 b=ALHEA14y+7o6QgESZd+Sx9Izq3Pn+EQXC193R1NM2NFofu0abIQy4nxc
 Rdj88bs6eMkOrWNeL7WQvoULdD+akWA0UhRNla7dwWy5I58LjfT8Oxtla
 1aFci9DvT4pi/uiGqSDXuLKS9YX0RJt415Qc7BFv3x/kAKqrYLH5/1SU4
 LphIdBcxqMpAT4P9Jq+gKucWc3Z3QTDkuwIejtfsmsXIbMpw+uak1lCrR
 XgVJ4VPmNhlMdgHDcJ0tk7CxmLICBWgDY0wdpM/NqVyZtTbigtUyEum55
 58p2x6hMoU1re7paNMF3Grlo1ZdngxoJCFW9PAE+6rhmRf979K5sB37HM Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="260271681"
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="260271681"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2022 00:27:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="640762121"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Apr 2022 00:27:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sat, 2 Apr 2022 00:27:17 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sat, 2 Apr 2022 00:27:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sat, 2 Apr 2022 00:27:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sat, 2 Apr 2022 00:27:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m95+XWJBvw45ppcu2Zb+/1E/KkwAycUTsnRNowUMUjLLBgI2tjxuUqN4TEiwUUwrQbwPtHZrQ5mFa/JulzjzsHGWJsJpD9HLPQ35oAxugWe2DJrCkw1NLGuPnID+/z9TqfWGAeymYi7EkZTGw3lBBn/Qv03zWgzF51tysBoYocJry03QHAl1VD2PwQf80iCaajmVwbn/LRwpyHbd7ahQ7D5SA3o2Bp98sNFP15IKI4hTnqLSerWelsUisTE6xWdCtF5u0ZZuFAqBWyGSBzyFq5YfCUDxnci0YKvncZPbXPnQzqT3m2qMFN6dbwvOTkk/dEXCbMNQ16r07l9lct0rog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WeIlDbZxqhHMVoUc/76qDbSBrrLJT+lkusbsWDcWqYs=;
 b=mPLRxrpBtGBqSjdR9VcbeZY4Um3LsXZls8wPrNSWiuiVWSiF72EPi9p52cfbQPrCGont2hmhyp7FpkcrD8RckkWd0YOrJCKF9T2wf//xZuGJzizsVJxQcrDpSZQuPnhFFnl/FNjOrNR29fXaLqEAxi1nvGgxnnyU+gmpS15fBEgvcY3n+sCF+fOkV1Sop1CUm+wTawerd80nnII+i/qsZPVR8+GIhzJpFvYgERY5Wx6e7K58ISXfLrhIqEl0NZ9eZ5pLNo2DSLrXHY85kTuEm9SNK5Z22rcj6Xfy0TDTa0W4ALfrSd4lts6wrRJcIG5OutlrK0+XqPXdR3256QfjYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5271.namprd11.prod.outlook.com (2603:10b6:208:31a::21)
 by MN2PR11MB4663.namprd11.prod.outlook.com (2603:10b6:208:26f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Sat, 2 Apr
 2022 07:27:15 +0000
Received: from BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::3c5c:b7a7:ca9e:88f5]) by BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::3c5c:b7a7:ca9e:88f5%9]) with mapi id 15.20.5123.030; Sat, 2 Apr 2022
 07:27:15 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH V2 4/4] intel-iommu: PASID support
Thread-Topic: [PATCH V2 4/4] intel-iommu: PASID support
Thread-Index: AQHYPOjLkFETw43vekSHA4amP0dz7KzOPTaQgAXgw4CAAD9wkIABeLQAgAHB1vCAAA+QAIAEpAjA
Date: Sat, 2 Apr 2022 07:27:15 +0000
Message-ID: <BL1PR11MB5271E349257909AB5754E7A78CE39@BL1PR11MB5271.namprd11.prod.outlook.com>
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-5-jasowang@redhat.com>
 <BN9PR11MB52762D1CDE8F5417370762CE8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEtr5byTaRFQT-ut6=ziyOTKBgne_Xa2qu4Nu9Z7sDDmBg@mail.gmail.com>
 <BN9PR11MB52767EA8BF5EA39488D149408C1D9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEtCAra8SbubYbqMVO8E6MUwNUaJLM5bVJ32rA31uemVAA@mail.gmail.com>
 <BN9PR11MB52765ACF64CE589365DD7F778C1F9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEsFd=tzta103cOyhyRvhHWKvLrTwttGwAh+GPBrxNYTiw@mail.gmail.com>
In-Reply-To: <CACGkMEsFd=tzta103cOyhyRvhHWKvLrTwttGwAh+GPBrxNYTiw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6259d0b-64e7-4c2c-c28e-08da147a364e
x-ms-traffictypediagnostic: MN2PR11MB4663:EE_
x-microsoft-antispam-prvs: <MN2PR11MB4663CC4B4081C14849BBA2238CE39@MN2PR11MB4663.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iI06oIsEbC4Y8LovtNdoS9SJOLUBtHisfK1ubAP8lhYaWEIJCIW2g0OMeYG5t64xQZZXZwY2uan80+VGG7MPXKt7o3SPWfp9vGjvvjLAOp5IRly2KpZfpboZa2hEjqOqct5eypTw+3YkBW3ljYeBImWXypvHkggr2/0tiRcAI6vrKDwJ3gw7iz32tKCsbyUin0eOqYwNc2N761D1/ErQZu8UdWO60/FIYKW2ks10e+F/t0yPgVueV7hku90MZcSULwma0KfIBlex9g7SGrLp5wMYRslQpljDHF1wA03irbzoh/E7XWuVjwa6XGnRjNedjgM/BxBUmc42gZoKuLhb9UgKQHfDbdR3/9437LfuZLthimkGksWUgbQh+JnF8fg+9m7E0muVaLksO5YJGEWPf9kvZXb3JyGCGJZRuEvPQNRM/iDpv9owxdr3KMJCgY+buQw7jHrzm0jzqYNvgKUaDkFFyTWkI8IAr+R+Up9e3B0rTi1t3zIWn5dUAEtgyp3DcIQgsul57xPmgesDQVXbTwshRU8YNW+wBVGNjguJJEQSn+9I7L3otCCZhLLSdrygCGVIuooQjDJiolMv9pVF3uiLLvWV5ouQ6g89PI/yxO0h8bOHLKCQMqHk4ya0WxEx8p9iUrjH4bKrIK3/U55EyjFDtJ8vYm17kgM3qMVBLrG2eH7pTa+xQvSGmbxGxFE41jPaI1xB+68VYup1FHZdmZiWG27nMyVs/roPCp+O8IppkmYV0P1miCFjR859yozp5PI0WRz1KDyHSnMtye3cJgYCLHHpJxiaQ70XpODW8Bs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5271.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(186003)(38100700002)(52536014)(8936002)(38070700005)(5660300002)(71200400001)(2906002)(6506007)(33656002)(7696005)(9686003)(83380400001)(55016003)(82960400001)(122000001)(86362001)(508600001)(76116006)(66556008)(66446008)(66476007)(66946007)(64756008)(966005)(54906003)(6916009)(316002)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXdXRU91cG5jN0ZKUlBNNUdVOU5abGdONEI1ZmNWek1BVGhodkQ1MXpzdkll?=
 =?utf-8?B?TnJYY00weXNEOUsxYkJTTFhjck5idFFUWDhUVU1OS253eFc0dG9KUno1eGJr?=
 =?utf-8?B?MzRqdHBEcCtaQkNubUpVS0RGTmEzVHUwN2kvcUJnS0RSeS9HdHpFM3Rva2c4?=
 =?utf-8?B?MXRYSC83M0tMQ2tKYWxUNEk4YTdEY0tocmMxS2ZncElkeWo4Yy9LNUpyM3lq?=
 =?utf-8?B?Y2JwajhsQThVRVBWRjM0anp0alR5LytBM2NUd1hVU2FoRitOeDE2OGc2VXhp?=
 =?utf-8?B?TmxubkIyaTR2UDlBMlliSm9CUmVVRXlxTnFXOWVBZVNCZzc2ZC8xTndtUVQ1?=
 =?utf-8?B?TmtmdlJ4L3U2S2cyaUpydlU2ZUVpQ3NNTyt2NUY0bXRNL3RBUWs1bG1hZXRT?=
 =?utf-8?B?RER5YnBLdnk3TFNSM3F0UWw0QTRJeG8walVGdXNpQ1U1a1haZHhzcUJ3RThu?=
 =?utf-8?B?ZFFzQkZzNEl6RzdsNzc5eGszVjBQMG9sMEU5aUFYY0dNR0lzbE56WFpBQzF6?=
 =?utf-8?B?Z3JEM0JEbVAwbmJSOFIvL09OeFhPM1Q0U0tDYUlxSVNROGJ4Rm9KMTROTXVU?=
 =?utf-8?B?b2FDVUlVNlc5bTE1ZlprT0ltemZPM0pSQ3NkM2wvR3N1a3dwU0xkMktZT0dt?=
 =?utf-8?B?bUJFdTJqalFMT2k4K0tXV2xHU21ibXcwMkhST3FzRWVUdGFud3IrWEtyZW9F?=
 =?utf-8?B?U21kYzZNYk1RUE5ad0ZpV3R4dGQxa0w5RlUxZldNcmFyd1lORUN1M1c2L3Iw?=
 =?utf-8?B?dndpNnFWYkNteWQwdEpvaE5wd0ZGaUJvUTB3VzgzdjczRVJPMWFOWTJJOEwz?=
 =?utf-8?B?ckV1blcwSVV4M1JRQXBXaTFQb2ZMcyt4azREbm9tY0x3alhiTHVlMzhTMnd4?=
 =?utf-8?B?THNvTnM0ZWw2VkNwU25sYXAzMmRuRkZOZWVhNHMvV05XUkFLM3ZPT3RTNjFr?=
 =?utf-8?B?d2pjbUcrMHFHNGJ4cVAyVzlqdXRmTEh2YzNFZUwxRkNNSHd2Q1FRelBQUXk2?=
 =?utf-8?B?SUVPTytUL0Z4WVUzdUt0VEo5cGJHVGxDSC9EdENxWWxnYVprM1h4TXJHU2NS?=
 =?utf-8?B?Ry9KaDl1LzJ0QXZERzI2ckp4TmR2d2FsdW9kM1BrdHppQnB3UlJ4a3VwNzhy?=
 =?utf-8?B?WEkyU0VHWGNUVGVIbGVKL1B2MUNaQjdLRFpVZFZsbjJIVXFnclNxQ0s4QnVC?=
 =?utf-8?B?dUNQeVhzTHI2SndFREVrT0F6aG1USzV6Unp0bTJndFFVdi84N1dhMVRLWnRY?=
 =?utf-8?B?KzNMYjJSWEkrN1dUdlRLNXMrM21USGxSVmZZVVZEM1gwYW5mWUxGcFBXVm9l?=
 =?utf-8?B?dU5JSndCaEwvVHNZSm5VbDBtVWxYbFFiUFR1UWRiUlBvZ3hXaE1sZS9zNXNx?=
 =?utf-8?B?L0JSV2ljQXd2OHNhcXpERzUwRkxIcHN4a3NCYnNlRnllZHdpVzkwOTd6c0Rn?=
 =?utf-8?B?T3c1ZFBrcGErbVB4aERNMDVMbno5N0lzV01UUElDV1d4SUJ3dmlONHlQVFNw?=
 =?utf-8?B?SHA2NURMbHpmWE5GT3A0VGlzem92eWZPWmxYOFFsZ3llU1JYWHRGelIvUlNh?=
 =?utf-8?B?cHo0bi96UGc2NEJvdzBBR25oNzVSQytRS0UrckV2ZXB1SXBZc3ZaaGgwSVh4?=
 =?utf-8?B?TWVZN3d1RlIyWmJOY0x5ZXAvNXZsVTV4QnZnQWxET2xBVVFTVm5rS2EzNFo4?=
 =?utf-8?B?dDJ5NlRmb0ZyUDk0WVdCVC9hZiswaWdNMnZNaURGRmJ3eTh1a3pGMTJTR3N0?=
 =?utf-8?B?T3NPTUpwMTlQTWg3cURDcFcxYTdwKzVTZkJpWVI2VmVsa2FyZ0YwVjQ0cGg5?=
 =?utf-8?B?aGppUnY3RzZvMHJLelYxTk8zbWFPUTB0Y1JpYXJSbDg4RjJSMWRxajFpZkNC?=
 =?utf-8?B?dFBxOU0yY2pwRFJwa3pYVThUYU1rclJvdVNjTUxCMEFMUEZITlp2d3ZUTHdN?=
 =?utf-8?B?bDJZMUpwWGY2TkVvRHl0L0xKMGw0VDJib3owOG9STktWTjFvV09MWWlPQjlq?=
 =?utf-8?B?OXRGTXplUmNEV1VaaEp3c1hhQVBJYVFOVFNwemVzQ1kveFVGa2dIenVSbGky?=
 =?utf-8?B?RURvb2NLdmtiUzZySWdnbGRZWkhzcGJnYVV5M2lCSmdhYWVyLzlPemZIOUZi?=
 =?utf-8?B?VTZWYnpTQ0NWNHRETmdmc1Z1VHpaa1VNWkhoOVovOEg0eHNCWDIvemhGT3BM?=
 =?utf-8?B?NDI4RHQ0dENGYzJ1Zm83VFBBTG45aHpEWVcxZ3FVRllobW4xYmd5Wmk1UGZt?=
 =?utf-8?B?Ritrd0lnUnVJQU10QkpUbDV3UngzWTV4TFJibHJtamZJeG8xVDRtNUlPb3Zw?=
 =?utf-8?B?amV6Nit0NnpDdllKdkhYd1FXOW9IanJGZEJvZmtrYkdaUlg3eVFMQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6259d0b-64e7-4c2c-c28e-08da147a364e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2022 07:27:15.5262 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xQV6XreUgJQ5VvVrEynHd5rhucvdaA1xu8vcSlJOfhvg6kuohfBk5SAJyB6Ums/n7PohZl4HEyhbXwmn+KPQKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4663
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=kevin.tian@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiBTZW50OiBXZWRuZXNk
YXksIE1hcmNoIDMwLCAyMDIyIDQ6MzIgUE0NCj4gDQo+ID4NCj4gPiA+DQo+ID4gPiA+IElmIHRo
ZXJlIGlzIGNlcnRhaW4gZmF1bHQNCj4gPiA+ID4gdHJpZ2dlcmVkIGJ5IGEgcmVxdWVzdCB3aXRo
IFBBU0lELCB3ZSBkbyB3YW50IHRvIHJlcG9ydCB0aGlzDQo+IGluZm9ybWF0aW9uDQo+ID4gPiA+
IHVwd2FyZC4NCj4gPiA+DQo+ID4gPiBJIHRlbmQgdG8gZG8gaXQgaW5jcmVhc2luZ2x5IG9uIHRv
cCBvZiB0aGlzIHNlcmllcyAoYW55aG93IGF0IGxlYXN0DQo+ID4gPiBSSUQyUEFTSUQgaXMgaW50
cm9kdWNlZCBiZWZvcmUgdGhpcyBzZXJpZXMpDQo+ID4NCj4gPiBZZXMsIFJJRDJQQVNJRCBzaG91
bGQgaGF2ZSBiZWVuIHJlY29yZGVkIHRvbyBidXQgaXQncyBub3QgZG9uZSBjb3JyZWN0bHkuDQo+
ID4NCj4gPiBJZiB5b3UgZG8gaXQgaW4gc2VwYXJhdGUgc2VyaWVzLCBpdCBpbXBsaWVzIHRoYXQg
eW91IHdpbGwgaW50cm9kdWNlIGFub3RoZXINCj4gPiAieC1wYXNpZC1mYXVsdCcgdG8gZ3VhcmQg
dGhlIG5ldyBsb2dpYyByZWxhdGVkIHRvIFBBU0lEIGZhdWx0IHJlY29yZGluZz8NCj4gDQo+IFNv
bWV0aGluZyBsaWtlIHRoaXMsIGFzIHNhaWQgcHJldmlvdXNseSwgaWYgaXQncyBhIHJlYWwgcHJv
YmxlbSwgaXQNCj4gZXhpc3RzIHNpbmNlIHRoZSBpbnRyb2R1Y3Rpb24gb2YgcmlkMnBhc2lkLCBu
b3Qgc3BlY2lmaWMgdG8gdGhpcw0KPiBwYXRjaC4NCj4gDQo+IEJ1dCBJIGNhbiBhZGQgdGhlIGZh
dWx0IHJlY29yZGluZyBpZiB5b3UgaW5zaXN0Lg0KDQpJIHByZWZlciB0byBpbmNsdWRpbmcgdGhl
IGZhdWx0IHJlY29yZGluZyBnaXZlbiBpdCdzIHNpbXBsZSBhbmQgbWFrZXMgdGhpcw0KY2hhbmdl
IG1vcmUgY29tcGxldGUgaW4gY29uY2VwdC4g8J+Yig0KDQo+ID4gPiA+DQo+ID4gPiA+IEVhcmxp
ZXIgd2hlbiBZaSBwcm9wb3NlZCBRZW11IGNoYW5nZXMgZm9yIGd1ZXN0IFNWQSBbMV0gaGUgYWlt
ZWQgZm9yDQo+IGENCj4gPiA+ID4gY29hcnNlLWdyYWluZWQga25vYiBkZXNpZ246DQo+ID4gPiA+
IC0tDQo+ID4gPiA+ICAgSW50ZWwgVlQtZCAzLjAgaW50cm9kdWNlcyBzY2FsYWJsZSBtb2RlLCBh
bmQgaXQgaGFzIGEgYnVuY2ggb2YNCj4gY2FwYWJpbGl0aWVzDQo+ID4gPiA+ICAgcmVsYXRlZCB0
byBzY2FsYWJsZSBtb2RlIHRyYW5zbGF0aW9uLCB0aHVzIHRoZXJlIGFyZSBtdWx0aXBsZQ0KPiBj
b21iaW5hdGlvbnMuDQo+ID4gPiA+ICAgV2hpbGUgdGhpcyB2SU9NTVUgaW1wbGVtZW50YXRpb24g
d2FudHMgc2ltcGxpZnkgaXQgZm9yIHVzZXIgYnkNCj4gcHJvdmlkaW5nDQo+ID4gPiA+ICAgdHlw
aWNhbCBjb21iaW5hdGlvbnMuIFVzZXIgY291bGQgY29uZmlnIGl0IGJ5ICJ4LXNjYWxhYmxlLW1v
ZGUiIG9wdGlvbi4NCj4gPiA+IFRoZQ0KPiA+ID4gPiAgIHVzYWdlIGlzIGFzIGJlbG93Og0KPiA+
ID4gPiAgICAgIi1kZXZpY2UgaW50ZWwtaW9tbXUseC1zY2FsYWJsZS1tb2RlPVsibGVnYWN5Inwi
bW9kZXJuIl0iDQo+ID4gPiA+DQo+ID4gPiA+ICAgICAtICJsZWdhY3kiOiBnaXZlcyBzdXBwb3J0
IGZvciBTTCBwYWdlIHRhYmxlDQo+ID4gPiA+ICAgICAtICJtb2Rlcm4iOiBnaXZlcyBzdXBwb3J0
IGZvciBGTCBwYWdlIHRhYmxlLCBwYXNpZCwgdmlydHVhbCBjb21tYW5kDQo+ID4gPiA+ICAgICAt
ICBpZiBub3QgY29uZmlndXJlZCwgbWVhbnMgbm8gc2NhbGFibGUgbW9kZSBzdXBwb3J0LCBpZiBu
b3QgcHJvcGVyDQo+ID4gPiA+ICAgICAgICBjb25maWd1cmVkLCB3aWxsIHRocm93IGVycm9yDQo+
ID4gPiA+IC0tDQo+ID4gPiA+DQo+ID4gPiA+IFdoaWNoIHdheSBkbyB5b3UgcHJlZmVyIHRvPw0K
PiA+ID4gPg0KPiA+ID4gPiBbMV0gaHR0cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9x
ZW11LWRldmVsLzIwMjAtDQo+IDAyL21zZzAyODA1Lmh0bWwNCj4gPiA+DQo+ID4gPiBNeSB1bmRl
cnN0YW5kaW5nIGlzIHRoYXQsIGlmIHdlIHdhbnQgdG8gZGVwbG95IFFlbXUgaW4gYSBwcm9kdWN0
aW9uDQo+ID4gPiBlbnZpcm9ubWVudCwgd2UgY2FuJ3QgdXNlIHRoZSAieC0iIHByZWZpeC4gV2Ug
bmVlZCBhIGZ1bGwNCj4gPiA+IGltcGxlbWVudGF0aW9uIG9mIGVhY2ggY2FwLg0KPiA+ID4NCj4g
PiA+IEUuZw0KPiA+ID4gLWRldmljZSBpbnRlbC1pb21tdSxmaXJzdC1sZXZlbD1vbixzY2FsYWJs
ZS1tb2RlPW9uIGV0Yy4NCj4gPiA+DQo+ID4NCj4gPiBZb3UgbWVhbnQgZWFjaCBjYXAgd2lsbCBn
ZXQgYSBzZXBhcmF0ZSBjb250cm9sIG9wdGlvbj8NCj4gPg0KPiA+IEJ1dCB0aGF0IHdheSByZXF1
aXJlcyB0aGUgbWFuYWdlbWVudCBzdGFjayBvciBhZG1pbiB0byBoYXZlIGRlZXANCj4gPiBrbm93
bGVkZ2UgYWJvdXQgaG93IGNvbWJpbmF0aW9ucyBvZiBkaWZmZXJlbnQgY2FwYWJpbGl0aWVzIHdv
cmssIGUuZy4NCj4gPiBpZiBqdXN0IHR1cm5pbmcgb24gc2NhbGFibGUgbW9kZSB3L28gZmlyc3Qt
bGV2ZWwgY2Fubm90IHN1cHBvcnQgdlNWQQ0KPiA+IG9uIGFzc2lnbmVkIGRldmljZXMuIElzIHRo
aXMgYSBjb21tb24gcHJhY3RpY2Ugd2hlbiBkZWZpbmluZyBRZW11DQo+ID4gcGFyYW1ldGVycz8N
Cj4gDQo+IFdlIGNhbiBoYXZlIGEgc2FmZSBhbmQgZ29vZCBkZWZhdWx0IHZhbHVlIGZvciBlYWNo
IGNhcC4gRS5nDQo+IA0KPiBJbiBxZW11IDguMCB3ZSB0aGluayBzY2FsYWJsZSBpcyBtYXR1cmUs
IHdlIGNhbiBtYWtlIHNjYWxhYmxlIHRvIGJlDQo+IGVuYWJsZWQgYnkgZGVmYXVsdA0KPiBpbiBx
ZW11IDguMSB3ZSB0aGluayBmaXJzdC1sZXZlbCBpcyBtYXR1cmUsIHdlIGNhbiBtYWtlIGZpcnN0
IGxldmVsIHRvDQo+IGJlIGVuYWJsZWQgYnkgZGVmYXVsdC4NCj4gDQoNCk9LLCB0aGF0IGlzIGEg
d29ya2FibGUgd2F5Lg0KDQpUaGFua3MNCktldmluDQo=

