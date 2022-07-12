Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD025712F1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 09:18:54 +0200 (CEST)
Received: from localhost ([::1]:44424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBAAW-0007Zx-Pe
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 03:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shirley.zhao@intel.com>)
 id 1oB9zJ-0000YK-FV
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:07:21 -0400
Received: from mga07.intel.com ([134.134.136.100]:24003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shirley.zhao@intel.com>)
 id 1oB9zG-0004Yu-21
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:07:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657609634; x=1689145634;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ipSWuqq6Jw5o3vwjGQdEgI3eA2MV7bw+GZ3fB+v3JW4=;
 b=mYaBi62XyqHjsLzPF1pxt+4Co8oX/EtHzdNzJgOOaWML33kyUMUT0/wJ
 bARJmCc3FKUCIOhDYbVO299MqV415oSZ2NRht9v+yps6TmwvazHKDvj2r
 mCH6skv4CajDx+gPUk7gmo2jdh7kC+RXmKJkzfJUDw9qf793qDsDiQO0K
 qS8XVWvkYW2Ad4aBDHhsXIFbkCBpW9DMXaFDTHBnGH/I0CaFwdkvaKI+i
 AXLUb28z4vBIchE0Fkezl309TBFsi6412N/chttmEZznJVXYn5PxyxkCz
 AKHuyWGSjBOlhWOXA5oN+2gVI9ikI6IecgI/7EDT87y9Utbv5wq7GraRu g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="348834494"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="348834494"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 00:06:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="662844967"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2022 00:06:53 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Jul 2022 00:06:52 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Jul 2022 00:06:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 12 Jul 2022 00:06:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 12 Jul 2022 00:06:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AeK8PY45uu/wv1CjQJJWwsx3TqVGKcB372SRZ+tsT6FlqXVcN+Snofe5QAi6DesqCsUe9CvO6+PYUwD4/674C2g0+YOoJHHL6HOqor6EYF9J5krrIpK+vT0kUrkIlbGbIAIuU7RaGJVvr1pG4h0XLD1OtnKqUV9iLXxzrPvhFQJjYdnii3Fem0qxPJFd4ioxDxp0fxWrSUNZ64Oa0fxVJtTeleWsjbttvLIvZkxpJqaW9JdnCLdEl+skVzhVcqad9q5okcN1gCI5xrT1jxKXlbZYcSMoslXZlUmmLB1HRpdI+FjG+T7+sTR7qUZFrRwfHK08wX49FjihQso4LfWQrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipSWuqq6Jw5o3vwjGQdEgI3eA2MV7bw+GZ3fB+v3JW4=;
 b=G4hGIbATI9l5VLZquyD+jp2WG3H4FyG+S/e8Gjx+EdNWZpdHl4yrvWL4wuT9iI4H3LGUTDTG+BC4nRfjUNLfCP2zVeC1Qpul36hTbYsk6HuMPolQSglicOZKPCjz/j78xlWjmyo6uPO6NamBGE+vje9FYPXEAjSHVcQkwcUHgu+hIIDoaTumD9ka4LRkTSmGY0VwawKn/D1k3PmKOPIKoAOgS55uBx8DtP8cGfliLycblKGTxxZEPJxn90hWznJ/yVHDpyZSgARrAmUaTUsVSmhG4g204HxigwiwIiPpBuZMy18TZQA0q3hRlVM9JSQGenCSCoRw0iHojOgdDNPFwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4291.namprd11.prod.outlook.com (2603:10b6:a03:1c2::12)
 by DM6PR11MB3657.namprd11.prod.outlook.com (2603:10b6:5:143::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 07:06:50 +0000
Received: from BY5PR11MB4291.namprd11.prod.outlook.com
 ([fe80::1d37:60c1:cfd1:b192]) by BY5PR11MB4291.namprd11.prod.outlook.com
 ([fe80::1d37:60c1:cfd1:b192%4]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 07:06:50 +0000
From: "Zhao, Shirley" <shirley.zhao@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
CC: Thomas Huth <thuth@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "virtio-fs@redhat.com" <virtio-fs@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: RE: [Qemu] how to use viriofs in qemu without NUMA
Thread-Topic: [Qemu] how to use viriofs in qemu without NUMA
Thread-Index: AdiQCpaHJJlwUwhPRyeyoMxZnaNd+wAOQjsAAACJ1oAAAdWNIAABaX0AAIQUiAAA1liOUA==
Date: Tue, 12 Jul 2022 07:06:50 +0000
Message-ID: <BY5PR11MB42914FD092B4312B76417A9C8D869@BY5PR11MB4291.namprd11.prod.outlook.com>
References: <BY5PR11MB42911D5BF55D9FAF501F64F68D819@BY5PR11MB4291.namprd11.prod.outlook.com>
 <3b6c8e16-3712-3402-3ab2-17bf53ec64a8@redhat.com> <YsPwbbiuxtkD6HSp@work-vm>
 <BY5PR11MB42912BFEA77F94B5B20D6F258D819@BY5PR11MB4291.namprd11.prod.outlook.com>
 <YsQGNk5hLv8b6DJS@work-vm>
 <BY5PR11MB4291BCA40054FB484003D4278D829@BY5PR11MB4291.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB4291BCA40054FB484003D4278D829@BY5PR11MB4291.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e047c92-a4b9-447b-d501-08da63d517c6
x-ms-traffictypediagnostic: DM6PR11MB3657:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mJE9tz1xzSq7YI5WZvKUhO1EwCuEzRPTNpdiRPtWFQ6QBbJQjb+Njg8e5T51TiTV9FsLiZ7UcW5JNtJAiNdna051xORsXqqECgufHpFyTj22AHutpRIhd5pXKf9TBpBSGJMR4zknvMgA/zSgQA523K7JFXAUTb3gSbz0jqUEl75JSZT31+PFqZB0il2GRz4GTS+PpuXqh3GJmgcqIwQ7Y5OG9A3Zxt9AyGVD3ZYwjJS+DZOW1VDk8zqZTvVrLgtVSAnskFhoaSmtMt5qZp9VIF5FY0DAo+CctZCWmttZ5JBzrG/xXMsepRWBCz4TDstpRfzWrVj2f7nMQ347AnUZ8LO3Jvf6+lmjThDavVc2bPsoUrQfOh+VSf28EGY83i1dDPh4yQsza/cvlO0GiXGEh+xR/3Gpedeo5nPvToyAYtFzPZeDb6VYzv5k4QYtXwwqgGdMAy6NlhMMtKKxBRiNqzKs19XQnVZ/tJeRDQKO+1k+P9a8TyBVUolWwqtX23sjOGqWzHcHDWaAZeb59/frdZBypOVAwIScf7J8Lf3gPW6f+8ElshYk2riw3MFChJfq7k9rABxPkyGYnhUdEJZuEtpPn/go/VTpUzfjk077eY7pbQppJltlrQt4xEmRA7ZPRDMhMPCxq7hwvo7GpDN4IqdXI/tFLWo2c42mvd7C0lRFgWA+zXO6/vN3FpfYNSizuNk5OShhmUNHIUemCWHaXZEk1tfSP9F1RhOnVdadtY+cmZPNydq3M6XKYBssnV6dV+ZZT4UO6rAT8qfJsZ1fog==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4291.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(346002)(39860400002)(366004)(396003)(2906002)(33656002)(186003)(966005)(6506007)(55016003)(83380400001)(82960400001)(38100700002)(71200400001)(8936002)(5660300002)(66476007)(66946007)(64756008)(4326008)(76116006)(26005)(66556008)(8676002)(66446008)(53546011)(478600001)(86362001)(6916009)(38070700005)(54906003)(41300700001)(122000001)(316002)(52536014)(9686003)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTFQTEJZV0RhSU9DUU1VRFMrcTUreWhSTU9pdTlPa2xackdQSUVUWFpiY2NQ?=
 =?utf-8?B?VUxDY0N5eVZrNlJWMFVYd01wOXB6UjV1bkF6aHJwRHBBbko1T3ZodStXSTEv?=
 =?utf-8?B?ZHBncEsrMGlRTFZ0b0VTWlpGNmg4REFocXNRaWhJQnRjbFZJeS9vTityZ0xl?=
 =?utf-8?B?VnNiR2hnS2dxelc4SnY3YjJhV2JNamV5MGdKY09ad3c3T1YyRnJrU1NLWXRy?=
 =?utf-8?B?TFN6anpFbTloMk9ZVk5mOFdwZGxmZzF2RFYxTnZnclNpQTBGMDdZWlZTWjlM?=
 =?utf-8?B?eEVCcG5pT0hnaWNpQllRamdWUStLOWxTSHlVQi9hemRHb3J5cC9mSVFJS0JL?=
 =?utf-8?B?d1pZcGgwbGdzcHVJaTlBOG5HNkpMTkFLTng5aVNRS21iaFVTYjBuejh2Uml0?=
 =?utf-8?B?WS9zWGwwWWJVOC9IbW5xTXV5SThTaU5GSFNXOG90Rk5MejB3RzU3cUdlSzF1?=
 =?utf-8?B?U0ZNamtodXJBWWFCUXhhOGlXbzJnVTV1a0JkRDc4OHpoSlZuNlR2bVJENURC?=
 =?utf-8?B?bjJkT3FBZjRGcFprYkFwSk1nUHE5b2FOWmdQRkE0MWRSbTFkUEQzeU5Sd25o?=
 =?utf-8?B?dkpGeVFSVkVRcHVLYVpvSEZwaldkVTJJd3JFT0dzU3VueGJHS3E2RTBnOCtV?=
 =?utf-8?B?L2dXV2kxNlV4dThDb0NEU0NLNG9BQ3Iyd243YnBLRTViNDJRZHNvNWRxZUJp?=
 =?utf-8?B?aGlRZWV6ZzQvcVk5V2JXRWhUY0RFTGp1WERJZlRMRmhUeVdtb1ZOblluSE0z?=
 =?utf-8?B?RElZVWlXVWtzUko2V2ZLdk04T1drTFNsd0g0M2lXRVJvc3BDSmFOTG41OHR6?=
 =?utf-8?B?YTNZSE00T2Q2RUh0S05sR0pBREdpOUx1M3REVFJXN2xmMDZnV3pwcFNoWEl3?=
 =?utf-8?B?U2U4TTVxbGNVQndtTTVpWEFTV1pQbHZxbmpJanR1ZktMVXk2SXlwTDFhU3BB?=
 =?utf-8?B?clNNWGFUMS9XcHM1TUpUL05SOFYrNHlUK1NJK3pkaHZUd3hqZ0FvT0t5UGVr?=
 =?utf-8?B?ckxFWWVMYk5nZ04xMTZhdDJCRjNsb3ljSGFEQmZ4VTRja3lCRThJS2ZKNFZ6?=
 =?utf-8?B?TGl3MlU5eFV4bUtuS3ZxOHZCSVY2UnZFUFFGRmU1WFJkV3VEeEFxMDQvVkVW?=
 =?utf-8?B?emhlUWpuSFB6MGpHTlBidDJucktjbW1IRUk3cGgyM05KeGlkMTdkT0xZdGU1?=
 =?utf-8?B?WmJITU5OaEVuVndrWDh6N3MvdStxYXo5ZHk4OVB0aFpCeXhkWFBuWXhvN1JM?=
 =?utf-8?B?Nk1NdlpRNFFjV29HM0hPY3BsNHpVVkt0dnJWMGVhS1lUUzNhblJ6YVUwNWFZ?=
 =?utf-8?B?NGlsMVBzbUF4SkdacUJ6SjFkL3NkRlZndjJSeWpTVnplZ0JWblJybG1jYmR1?=
 =?utf-8?B?Y3d4TTVyVjRVUmVDSGF2akFKOVp5SkE4QW9JMkxucGkyMllLa3cySElFekpN?=
 =?utf-8?B?NnJCODdkQkw5TU9xSW15Qk40MWhkNlMzZ3NUVDVUR2xqZTRZdGFoWXF5N1FG?=
 =?utf-8?B?MGM0RXBSK1E0TDhPL0Z2di9yWVJCVkZkYzZmK25uY3BaZmplVk1CRDgrWjhI?=
 =?utf-8?B?eWhGWEVad2NpYy9jYm4vVlhvb2hSbzYwNmFIQWMyaUlHSU55dkJBV2pGSHRp?=
 =?utf-8?B?TlZ1MUhSaURPRnhhNWd5U3cxQXdvM2g3dGZCWnJuN3N0UE5UTU9KV1YrTkln?=
 =?utf-8?B?T0FYTHZTYVBMeUxCbFBlRzZHYXErTVNBd0QvVWRodG5mM2Vhb0dsaVBaRGdY?=
 =?utf-8?B?M0RZY0pnYllSSDRRSS9uVEVXUDRiSzBIelBReGxGdFRvbURsQU9Yam1iSkVh?=
 =?utf-8?B?K05QUndCWnErS1IwbDB4dG5lMzgwcjJ3c3JJOE5MVWJmUTlpTVNMc0dtQlFC?=
 =?utf-8?B?cE95RWF1VkFaSDNPSGJNUnJmZk1kUnZwV3QzdXNnaUZiUVFyVUxpU2xxWDk5?=
 =?utf-8?B?NXNlOTFwTlZmOG05bE80bDhIU3hwcHo1Z2FqQ3piVGlLeVVrUm41V1l6Zkls?=
 =?utf-8?B?dWFpa01iT3BleC84cExXTlZ2SCt2U1FXaitaT2NmanlsMzlaOGx6SCtYaXpi?=
 =?utf-8?B?MGZHQXJoSVNFa09veXV0M2tXcCs5WjA3ejBIanhWdTh0SmhjQjg2Qy9TRU1t?=
 =?utf-8?Q?jLc5Qn7Bk1f3SxltVh/OUitdK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4291.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e047c92-a4b9-447b-d501-08da63d517c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2022 07:06:50.3968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qM/zULCO6EfJnJVBsLieQFRpZz0s2/3V46VETt1BMPxHo+pTn2sa031Nlt3YPL2H7MlwqZvB+Fdzt4UAM7PMWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3657
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=shirley.zhao@intel.com; helo=mga07.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

SGksIGFsbCwgDQoNCkkgaGF2ZSBhbm90aGVyIHF1ZXN0aW9uIHdhbnQgdG8gY29uc3VsdCB5b3Uu
IA0KVG8gZW5hYmxlIERBWCBpbiB2aXJ0aW9mcywgYWNjb3JkaW5nIHRvIHRoZSBtZW11IGh0dHBz
Oi8vdmlydGlvLWZzLmdpdGxhYi5pby9ob3d0by1xZW11Lmh0bWwuIA0KSSBuZWVkIHRvIGFkZCAi
Y2FjaGUtc2l6ZT0yRyIgYXMgYmVsb3cuIA0KLWRldmljZSB2aG9zdC11c2VyLWZzLXBjaSxxdWV1
ZS1zaXplPTEwMjQsY2hhcmRldj1jaGFyMCx0YWc9bXlmcyxjYWNoZS1zaXplPTJHDQoNCk15IHFl
bXUgY29tbWFuZCBpczogDQpzdWRvIHFlbXUtc3lzdGVtLXg4Nl82NCAtTSBwYyAtY3B1IGhvc3Qg
LS1lbmFibGUta3ZtIC1zbXAgMiAtbSA0RyAtZHJpdmUgaWY9dmlydGlvLGZpbGU9dWJ1bnR1Lmlt
ZyAtb2JqZWN0IG1lbW9yeS1iYWNrZW5kLWZpbGUsaWQ9bWVtLHNpemU9NEcsbWVtLXBhdGg9L2Rl
di9zaG0sc2hhcmU9b24gLW1hY2hpbmUgcTM1LG1lbW9yeS1iYWNrZW5kPW1lbSAtY2hhcmRldiBz
b2NrZXQsaWQ9Y2hhcjAscGF0aD0vdG1wL3Zob3N0cWVtdSAtZGV2aWNlIHZob3N0LXVzZXItZnMt
cGNpLHF1ZXVlLXNpemU9MTAyNCxjaGFyZGV2PWNoYXIwLHRhZz1teWZzX3Jvb3QsY2FjaGUtc2l6
ZT0yRyAtY2hhcmRldiBzdGRpbyxtdXg9b24saWQ9bW9uIC1tb24gY2hhcmRldj1tb24sbW9kZT1y
ZWFkbGluZSAtZGV2aWNlIHZpcnRpby1zZXJpYWwtcGNpIC1kZXZpY2UgdmlydGNvbnNvbGUsY2hh
cmRldj1tb24gLXZnYSBub25lIC1kaXNwbGF5IG5vbmUNCg0KQW5kIHZpcnRpb2ZzZCBjb21tYW5k
IGlzOg0Kc3VkbyAuL3ZpcnRpb2ZzZCAtLXNvY2tldC1wYXRoPS90bXAvdmhvc3RxZW11IC1vIHNv
dXJjZT0vaG9tZS9zaGlybGV5L3Rlc3RkaXIgLW8gY2FjaGU9YWx3YXlzDQoNCkJ1dCB0aGVyZSBp
cyBubyBvcHRpb24gb2YgImNhY2hlLXNpemUiIGluIHFlbXUgNi4wLCBsaWtlIGJlbG93LiBTbyBo
b3cgdG8gZW5hYmxlIGl0PyANCnFlbXUtNi4wLjAkIHFlbXUtc3lzdGVtLXg4Nl82NCAtZGV2aWNl
IHZob3N0LXVzZXItZnMtcGNpLGhlbHANCnZob3N0LXVzZXItZnMtcGNpIG9wdGlvbnM6DQogIGFj
cGktaW5kZXg9PHVpbnQzMj4gICAgLSAgKGRlZmF1bHQ6IDApDQogIGFkZHI9PGludDMyPiAgICAg
ICAgICAgLSBTbG90IGFuZCBvcHRpb25hbCBmdW5jdGlvbiBudW1iZXIsIGV4YW1wbGU6IDA2LjAg
b3IgMDYgKGRlZmF1bHQ6IC0xKQ0KICBhZXI9PGJvb2w+ICAgICAgICAgICAgIC0gb24vb2ZmIChk
ZWZhdWx0OiBmYWxzZSkNCiAgYW55X2xheW91dD08Ym9vbD4gICAgICAtIG9uL29mZiAoZGVmYXVs
dDogdHJ1ZSkNCiAgYXRzPTxib29sPiAgICAgICAgICAgICAtIG9uL29mZiAoZGVmYXVsdDogZmFs
c2UpDQogIGJvb3RpbmRleD08aW50MzI+DQogIGNoYXJkZXY9PHN0cj4gICAgICAgICAgLSBJRCBv
ZiBhIGNoYXJkZXYgdG8gdXNlIGFzIGEgYmFja2VuZA0KICBldmVudF9pZHg9PGJvb2w+ICAgICAg
IC0gb24vb2ZmIChkZWZhdWx0OiB0cnVlKQ0KICBmYWlsb3Zlcl9wYWlyX2lkPTxzdHI+DQogIGlu
ZGlyZWN0X2Rlc2M9PGJvb2w+ICAgLSBvbi9vZmYgKGRlZmF1bHQ6IHRydWUpDQogIGlvbW11X3Bs
YXRmb3JtPTxib29sPiAgLSBvbi9vZmYgKGRlZmF1bHQ6IGZhbHNlKQ0KICBtaWdyYXRlLWV4dHJh
PTxib29sPiAgIC0gb24vb2ZmIChkZWZhdWx0OiB0cnVlKQ0KICBtb2Rlcm4tcGlvLW5vdGlmeT08
Ym9vbD4gLSBvbi9vZmYgKGRlZmF1bHQ6IGZhbHNlKQ0KICBtdWx0aWZ1bmN0aW9uPTxib29sPiAg
IC0gb24vb2ZmIChkZWZhdWx0OiBmYWxzZSkNCiAgbm90aWZ5X29uX2VtcHR5PTxib29sPiAtIG9u
L29mZiAoZGVmYXVsdDogdHJ1ZSkNCiAgbnVtLXJlcXVlc3QtcXVldWVzPTx1aW50MTY+IC0gIChk
ZWZhdWx0OiAxKQ0KICBwYWNrZWQ9PGJvb2w+ICAgICAgICAgIC0gb24vb2ZmIChkZWZhdWx0OiBm
YWxzZSkNCiAgcGFnZS1wZXItdnE9PGJvb2w+ICAgICAtIG9uL29mZiAoZGVmYXVsdDogZmFsc2Up
DQogIHF1ZXVlLXNpemU9PHVpbnQxNj4gICAgLSAgKGRlZmF1bHQ6IDEyOCkNCiAgcm9tYmFyPTx1
aW50MzI+ICAgICAgICAtICAoZGVmYXVsdDogMSkNCiAgcm9tZmlsZT08c3RyPg0KICByb21zaXpl
PTx1aW50MzI+ICAgICAgIC0gIChkZWZhdWx0OiA0Mjk0OTY3Mjk1KQ0KICB0YWc9PHN0cj4NCiAg
dXNlLWRpc2FibGVkLWZsYWc9PGJvb2w+IC0gIChkZWZhdWx0OiB0cnVlKQ0KICB1c2Utc3RhcnRl
ZD08Ym9vbD4gICAgIC0gIChkZWZhdWx0OiB0cnVlKQ0KICB2ZWN0b3JzPTx1aW50MzI+ICAgICAg
IC0gIChkZWZhdWx0OiA0Mjk0OTY3Mjk1KQ0KICB2aXJ0aW8tYmFja2VuZD08Y2hpbGQ8dmhvc3Qt
dXNlci1mcy1kZXZpY2U+Pg0KICB2aXJ0aW8tcGNpLWJ1cy1tYXN0ZXItYnVnLW1pZ3JhdGlvbj08
Ym9vbD4gLSBvbi9vZmYgKGRlZmF1bHQ6IGZhbHNlKQ0KICB4LWF0cy1wYWdlLWFsaWduZWQ9PGJv
b2w+IC0gb24vb2ZmIChkZWZhdWx0OiB0cnVlKQ0KICB4LWRpc2FibGUtbGVnYWN5LWNoZWNrPTxi
b29sPiAtICAoZGVmYXVsdDogZmFsc2UpDQogIHgtZGlzYWJsZS1wY2llPTxib29sPiAgLSBvbi9v
ZmYgKGRlZmF1bHQ6IGZhbHNlKQ0KICB4LWlnbm9yZS1iYWNrZW5kLWZlYXR1cmVzPTxib29sPiAt
ICAoZGVmYXVsdDogZmFsc2UpDQogIHgtcGNpZS1kZXZlcnItaW5pdD08Ym9vbD4gLSBvbi9vZmYg
KGRlZmF1bHQ6IHRydWUpDQogIHgtcGNpZS1leHRjYXAtaW5pdD08Ym9vbD4gLSBvbi9vZmYgKGRl
ZmF1bHQ6IHRydWUpDQogIHgtcGNpZS1mbHItaW5pdD08Ym9vbD4gLSBvbi9vZmYgKGRlZmF1bHQ6
IHRydWUpDQogIHgtcGNpZS1sbmtjdGwtaW5pdD08Ym9vbD4gLSBvbi9vZmYgKGRlZmF1bHQ6IHRy
dWUpDQogIHgtcGNpZS1sbmtzdGEtZGxsbGE9PGJvb2w+IC0gb24vb2ZmIChkZWZhdWx0OiB0cnVl
KQ0KICB4LXBjaWUtcG0taW5pdD08Ym9vbD4gIC0gb24vb2ZmIChkZWZhdWx0OiB0cnVlKSANCg0K
DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogWmhhbywgU2hpcmxleSANClNlbnQ6
IEZyaWRheSwgSnVseSA4LCAyMDIyIDg6NDAgQU0NClRvOiBEci4gRGF2aWQgQWxhbiBHaWxiZXJ0
IDxkZ2lsYmVydEByZWRoYXQuY29tPg0KQ2M6IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29t
PjsgcWVtdS1kZXZlbEBub25nbnUub3JnOyB2aXJ0aW8tZnNAcmVkaGF0LmNvbTsgU3RlZmFuIEhh
am5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPg0KU3ViamVjdDogUkU6IFtRZW11XSBob3cgdG8g
dXNlIHZpcmlvZnMgaW4gcWVtdSB3aXRob3V0IE5VTUENCg0KWWVzLCB0aGUgcWVtdSB2ZXJzaW9u
IGlzIHRvbyBvbGQuIA0KTXkgcHJldmlvdXMgcWVtdSB2ZXJzaW9uIGlzIDQuMiwgYW5kIEkgdXBn
cmFkZWQgaXQgaW50byA2LjAsIGFuZCBpdCB3b3JrZWQgbm93LiANClRoYW5rcyBhIGxvdC4gDQoN
Ci0gU2hpcmxleSANCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IERyLiBEYXZp
ZCBBbGFuIEdpbGJlcnQgPGRnaWxiZXJ0QHJlZGhhdC5jb20+DQpTZW50OiBUdWVzZGF5LCBKdWx5
IDUsIDIwMjIgNTozNyBQTQ0KVG86IFpoYW8sIFNoaXJsZXkgPHNoaXJsZXkuemhhb0BpbnRlbC5j
b20+DQpDYzogVGhvbWFzIEh1dGggPHRodXRoQHJlZGhhdC5jb20+OyBxZW11LWRldmVsQG5vbmdu
dS5vcmc7IHZpcnRpby1mc0ByZWRoYXQuY29tOyBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJl
ZGhhdC5jb20+DQpTdWJqZWN0OiBSZTogW1FlbXVdIGhvdyB0byB1c2UgdmlyaW9mcyBpbiBxZW11
IHdpdGhvdXQgTlVNQQ0KDQoqIFpoYW8sIFNoaXJsZXkgKHNoaXJsZXkuemhhb0BpbnRlbC5jb20p
IHdyb3RlOg0KPiBUaGFua3MgZm9yIHRoZSBpbmZvcm1hdGlvbi4gDQo+IFllcywgSSBhbHNvIGZv
dW5kIHRoZSBtZW1vcnkgYmFja2VuZCBvcHRpb25zIG9uIHMzOTB4LCBhbmQgYWxzbyBjb3B5IHRo
ZSBjb21tYW5kIHRvIHg4NiwgYnV0IGZhaWxlZC4gDQo+IA0KPiBUaGUgZm9sbG93aW5nIGlzIHRo
ZSBjb21tYW5kIHVzZWQgdG8gc3RhcnQgcWVtdSArIHZpcnRpb2ZzICsgdWJ1bnR1IDIwLjA0LiAN
Cj4gT25lIGlzIHdvcmtlZCB3ZWxsIHVzaW5nIE5VTUEsIGFub3RoZXIgb25lIGlzIGZhaWxlZCB3
aXRob3V0IE5VTUEuIA0KPiBJcyB0aGVyZSBhbnl0aGluZyB3cm9uZz8gDQo+IA0KPiBUaGUgd29y
a2VkIG9uZSB3aXRoIE5VTUEgb3B0aW9uczogDQo+IA0KPiBxZW11LXN5c3RlbS14ODZfNjQgLU0g
cGMgLWNwdSBob3N0IC0tZW5hYmxlLWt2bSAtc21wIDIgLW0gNEcgLW9iamVjdCANCj4gbWVtb3J5
LWJhY2tlbmQtZmlsZSxpZD1tZW0sc2l6ZT00RyxtZW0tcGF0aD0vZGV2L3NobSxzaGFyZT1vbiAt
bnVtYSANCj4gbm9kZSxtZW1kZXY9bWVtIC1jaGFyZGV2IHNvY2tldCxpZD1jaGFyMCxwYXRoPS90
bXAvdmZzZC5zb2NrIC1kZXZpY2UgDQo+IHZob3N0LXVzZXItZnMtcGNpLHF1ZXVlLXNpemU9MTAy
NCxjaGFyZGV2PWNoYXIwLHRhZz1teWZzIC1jaGFyZGV2IA0KPiBzdGRpbyxtdXg9b24saWQ9bW9u
IC1tb24gY2hhcmRldj1tb24sbW9kZT1yZWFkbGluZSAtZGV2aWNlIA0KPiB2aXJ0aW8tc2VyaWFs
LXBjaSAtZGV2aWNlIHZpcnRjb25zb2xlLGNoYXJkZXY9bW9uIC12Z2Egbm9uZSAtZGlzcGxheSAN
Cj4gbm9uZSAtZHJpdmUgaWY9dmlydGlvLGZpbGU9dWJ1bnR1LmltZw0KPiANCj4gVGhlIGZhaWxl
ZCBvbmUgd2l0aG91dCBOVU1BIG9wdGlvbnM6IA0KPiANCj4gcWVtdS1zeXN0ZW0teDg2XzY0IC1N
IHBjIC1jcHUgaG9zdCAtLWVuYWJsZS1rdm0gLXNtcCAyIC1tIDRHIC1vYmplY3QgDQo+IG1lbW9y
eS1iYWNrZW5kLWZpbGUsaWQ9bWVtLHNpemU9NEcsbWVtLXBhdGg9L2Rldi9zaG0sc2hhcmU9b24g
LW1hY2hpbmUgDQo+IHEzNSxtZW1vcnktYmFja2VuZD1tZW0gLWNoYXJkZXYgc29ja2V0LGlkPWNo
YXIwLHBhdGg9L3RtcC92ZnNkLnNvY2sNCj4gLWRldmljZSB2aG9zdC11c2VyLWZzLXBjaSxxdWV1
ZS1zaXplPTEwMjQsY2hhcmRldj1jaGFyMCx0YWc9bXlmcw0KPiAtY2hhcmRldiBzdGRpbyxtdXg9
b24saWQ9bW9uIC1tb24gY2hhcmRldj1tb24sbW9kZT1yZWFkbGluZSAtZGV2aWNlIA0KPiB2aXJ0
aW8tc2VyaWFsLXBjaSAtZGV2aWNlIHZpcnRjb25zb2xlLGNoYXJkZXY9bW9uIC12Z2Egbm9uZSAt
ZGlzcGxheSANCj4gbm9uZSAtZHJpdmUgaWY9dmlydGlvLGZpbGU9dWJ1bnR1LmltZw0KDQpXaGF0
IGVycm9yIGRpZCBpdCBnaXZlPw0KDQoyMC4wNCBpcyBxdWl0ZSBvbGQsIHdoYXQgcWVtdSB2ZXJz
aW9uIGlzIGl0Pw0KDQpJJ2QgaGF2ZSB0byBjaGVjayB3aGVuIHRoZSBtZW1kZXY9IHdlbnQgaW4u
DQoNCkRhdmUNCg0KPiANCj4gVGhhbmtzLiANCj4gLSBTaGlybGV5DQo+IA0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IDxkZ2lsYmVy
dEByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKdWx5IDUsIDIwMjIgNDowNCBQTQ0KPiBU
bzogVGhvbWFzIEh1dGggPHRodXRoQHJlZGhhdC5jb20+DQo+IENjOiBaaGFvLCBTaGlybGV5IDxz
aGlybGV5LnpoYW9AaW50ZWwuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOyANCj4gdmlydGlv
LWZzQHJlZGhhdC5jb207IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4NCj4g
U3ViamVjdDogUmU6IFtRZW11XSBob3cgdG8gdXNlIHZpcmlvZnMgaW4gcWVtdSB3aXRob3V0IE5V
TUENCj4gDQo+ICogVGhvbWFzIEh1dGggKHRodXRoQHJlZGhhdC5jb20pIHdyb3RlOg0KPiA+IE9u
IDA1LzA3LzIwMjIgMDMuMDIsIFpoYW8sIFNoaXJsZXkgd3JvdGU6DQo+ID4gPiBIaSwgYWxsLA0K
PiA+ID4gDQo+ID4gPiBJIHdhbnQgdG8gdXNlIHZpcnRpb2ZzIHRvIHNoYXJlIGZvbGRlciBiZXR3
ZWVuIGhvc3QgYW5kIGd1ZXN0Lg0KPiA+ID4gDQo+ID4gPiAgRnJvbSB0aGUgZ3VpZGUsIGl0IG11
c3Qgc2V0IHRoZSBOVU1BIG5vZGUuDQo+ID4gPiBodHRwczovL3ZpcnRpby1mcy5naXRsYWIuaW8v
aG93dG8tcWVtdS5odG1sDQo+ID4gPiANCj4gPiA+IEJ1dCBteSBndWVzdCBkb2VzbuKAmXQgc3Vw
cG9ydCBOVU1BLg0KPiA+ID4gDQo+ID4gPiBJcyB0aGVyZSBhbnkgZ3VpZGUgdG8gdXNlIHFlbXUg
KyB2aXJ0aW9mcyB3aXRob3V0IE5VTUE/DQo+ID4gPiANCj4gPiA+IE9yIGRvZXMgcWVtdSBoYXZl
IGFueSBwbGFuIHRvIHN1cHBvcnQgaXQ/DQo+ID4gDQo+ID4gIEhpIQ0KPiA+IA0KPiA+IEF0IGxl
YXN0IG9uIHMzOTB4LCB5b3UgY2FuIGFsc28gc3BlY2lmeSB0aGUgbWVtb3J5IGJhY2tlbmQgdmlh
IHRoZSANCj4gPiAtbWFjaGluZSBvcHRpb24gaW5zdGVhZCBvZiB1c2luZyB0aGUgLW51bWEgb3B0
aW9uLCBlLmcuOg0KPiA+IA0KPiA+ICBxZW11LXN5c3RlbS1zMzkweCAtbWFjaGluZSBtZW1vcnkt
YmFja2VuZD1tZW0gXA0KPiA+ICAgLW9iamVjdCBtZW1vcnktYmFja2VuZC1maWxlLGlkPW1lbSwu
Li4NCj4gPiANCj4gPiBOb3Qgc3VyZSB3aGV0aGVyIHRoYXQgd29ya3Mgb24gb3RoZXIgYXJjaGl0
ZWN0dXJlcywgdG9vLCB0aG91Z2guIA0KPiA+IFN0ZWZhbiwgRGF2aWQsIGRvIHlvdSBrbm93Pw0K
PiANCj4gUmlnaHQsIHRoYXQncyB0aGUgd2F5IEkgZG8gaXQgb24geDg2Lg0KPiBXZSB3cm90ZSB2
aXJ0aW9mcyBiZWZvcmUgdGhlIG1lbW9yeS1iYWNrZW5kIG9wdGlvbiBleGlzdGVkLCB3aGljaCBp
cyB3aHkgdGhlIG9sZCBkb2NzIHRhbGsgYWJvdXQgdXNpbmcgdGhlIE5VTUEgc3R1ZmYuDQo+IA0K
PiBEYXZlDQo+IA0KPiA+ICBUaG9tYXMNCj4gPiANCj4gLS0NCj4gRHIuIERhdmlkIEFsYW4gR2ls
YmVydCAvIGRnaWxiZXJ0QHJlZGhhdC5jb20gLyBNYW5jaGVzdGVyLCBVSw0KPiANCi0tDQpEci4g
RGF2aWQgQWxhbiBHaWxiZXJ0IC8gZGdpbGJlcnRAcmVkaGF0LmNvbSAvIE1hbmNoZXN0ZXIsIFVL
DQoNCg==

