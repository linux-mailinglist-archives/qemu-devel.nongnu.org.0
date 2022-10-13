Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D2D5FD6D4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 11:16:47 +0200 (CEST)
Received: from localhost ([::1]:45946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiuKc-0005ck-HI
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 05:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kai.huang@intel.com>)
 id 1oitsr-0002di-On
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 04:48:15 -0400
Received: from mga03.intel.com ([134.134.136.65]:34526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kai.huang@intel.com>)
 id 1oitsn-0007SD-BV
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 04:48:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665650881; x=1697186881;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QDfU7VyDNwihJoA1/Swch20+4yg7aIB+su5evgeuwac=;
 b=UZ3b8uwL7eMD+6gIQ/Oy4WSeaVu8mmNVN7Ggi92s/P6G9MMGwfBr/Xmk
 UQSchss17L+R4jkZV7SGnMy1kutYugC/iSstMVRENz42Lf2WV1XscVNeI
 yHgW6lvAPODpXF+yLAFtNV2LB3u7ILD2wvoMoIs99Dx7bOD8mxU+CvJ3Z
 +6yMiObqwY4RghjHNmfGmVGCpbNVnGNGYT2euMvV55El6uVm37/9ncKlz
 VdcdfeR34TjC5/kaBaHcl+hyMKdJ8CID9Fb+lAQVhFo+uxtVqP/zC01ri
 vDWCYDjjZj86l/cLXe/eNiL4Ccz5Usm7BwcUY70UpYvpG0crTD4Gk+FXs g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="306656950"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="306656950"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 01:47:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="716252742"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="716252742"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Oct 2022 01:47:58 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 01:47:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 01:47:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 13 Oct 2022 01:47:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 13 Oct 2022 01:47:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+Fpi+DLRpz8PW0D/FmV/UYxwCAnDcq2O7V/DqxA/vLAPEmQfF8xbxD1De39sR+d7WZGQ8Nc0B9K+bdcO7l/XqEp5zYCyFKar5IgFxRAXVRMVIcZ7Vmra6eFgUevIUae+Sh/CLzCHrxzV39W+KxoY86cFp5iTEksdHlz4LVAWzUfW1R0GNqDm5DtSDHbNwthB9OgCufi7KeRfZ7E7bGk+FVr9poA/kqI1bCzbajIg+5H+MIfV4oRRHAS5Am5WLb66kIQl4b/Hbd4hS2RilWEFTqc68ZgEhaEgiD9Rm3POwF+uOJJdiKQfpqoTUbI1pFaTKIPNhv1pyWIOcLik75azg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDfU7VyDNwihJoA1/Swch20+4yg7aIB+su5evgeuwac=;
 b=dcw3LgK2qrgPVmhZrJYODhnD88OyBml/5WO9y4NErl/xVpkPOASa5u/koM2dRdPWi5Z66NAdpGAbvR2u3O93IWn0e6wbmggtAE6s4yqgNV/559AxWAXNDCX8U1FcwvETwkfUGr8AwXUryRviz3UBnTURG/UiIIHbvjDMdg6b9yAgSxeOcaIv3ps/yL8wFzBj7SFjjlFWZYSFriwcqTympSvK2YSkPqyi6XcUonftLT+MaNc3BY5ldPn+z3D+6nLJuNl1tah0PFo+m2wVDEF7dehrOKsfa4PHufKP1TV24bOw1rwcK7k2nFpJHLKWyyE7ha2o08/4xvMz8pkKF3DAxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by MW4PR11MB6786.namprd11.prod.outlook.com (2603:10b6:303:20b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Thu, 13 Oct
 2022 08:47:55 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::6eb:99bf:5c45:a94b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::6eb:99bf:5c45:a94b%3]) with mapi id 15.20.5676.032; Thu, 13 Oct 2022
 08:47:55 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "yang.zhong@linux.intel.com" <yang.zhong@linux.intel.com>
CC: "pbonzini@redhat.com" <pbonzini@redhat.com>, "Yang, Weijiang"
 <weijiang.yang@intel.com>, "Zhong, Yang" <yang.zhong@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] target/i386: Switch back XFRM value
Thread-Topic: [PATCH] target/i386: Switch back XFRM value
Thread-Index: AQHY3hS042J7brQJD0unJ5PY0M7GAK4KhlqAgAFWMQCAAChDAA==
Date: Thu, 13 Oct 2022 08:47:55 +0000
Message-ID: <0582a898ae1b6423be498201a77c4f1927dd1f27.camel@intel.com>
References: <20221012082609.922631-1-yang.zhong@intel.com>
 <3a08ba1b681315cc1062d68f86392bb7d94eb680.camel@intel.com>
 <Y0eu9Nq/fhZLKwCt@yangzhon>
In-Reply-To: <Y0eu9Nq/fhZLKwCt@yangzhon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|MW4PR11MB6786:EE_
x-ms-office365-filtering-correlation-id: 9b102c08-0da8-495b-a20c-08daacf79f06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sx8oCZW2cfkjiyvRyRdW9Dlb0c8ngqEH028GgYJftyhRZVzH3gs8dNBZKWzOvqoMPoMubztmlIRwGtzR0WQoO3DQrBkvxAkN5fp0zOdSquqXvw7YVZOgKP2DllJFp+VzHr6fK2Lf1+LmjJIghED3xsL3bRg2UIbpgageCT0k4ozDy8C6R1gWizf9icG9WNKqnwpzuUkIIcYc5+xI+hVrgLfz229f5Z04WBpH7wV/rKRCV4D5UXMHNoCYKOXuI28wAOy0gd2S+aJqByRfvQPHo65BB5n4XbIUJdSwibcetdxdadd8+489gVlRCkLyp0VvdkcxUJtFDgCP5a5sMa4JDKk4xf/ZcnDlhMZvvXNlL7AEXq96aHjw4COTJG8aVOSLVZfkRXJJXlIAVVdZCDi8Dh5Hvm9dzE1v/pZR3MImlFJu87WOddg5B8NmZF5uJwvahrnJbsF5JP0P8aU6MUpN6ZrLY+R57ioD4Bi1rXdYe6i0d6ZWuP0Miahma0jdMIyfSn6h9NIj/+JaSyccnZrIJxfLxDzM0OiBLPaDEud5nfaiHG00acdbxza8W9Wz7yfpRnl5bdZTrgKlW7OPad58XKqqRi6m7q0flpJIkyCY/72d/IJWlU2kw0pu2co2HLdzbRx3Bnc/l1p4R4zTB5ARl/cFcPGlShzgfbCdpQpJyuTFTk77p4SjffbJBxAb561IUadi5ru/tvq/ehN7E6pbOGFKLBQ0lVwbKDUbTihOl4FZa/kwkxZhVrCKW7fmYfVWAt0DxR9UyOQ1SdGxwQtpEw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5978.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199015)(54906003)(66446008)(4326008)(8676002)(8936002)(76116006)(82960400001)(36756003)(41300700001)(122000001)(66946007)(91956017)(66476007)(4001150100001)(26005)(6512007)(64756008)(86362001)(2906002)(66556008)(4744005)(6506007)(38070700005)(5660300002)(71200400001)(478600001)(186003)(6486002)(316002)(2616005)(38100700002)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFNhbDR1UVBSNk1qZjJvM0lQL1gzQnFqL05TdGp2VitHYzlrMVpwOThyTkpR?=
 =?utf-8?B?c01nWXBmQ3VwSGdBc0Y4cnRVd2hSUjd6WnoycURzS0k4YXRhaFdyOUxPcVJ2?=
 =?utf-8?B?Y1I3Vjc5REdGUDk0dE5PZkQ4VVNxWnFhL2tzY3psdEVJZXhnaFZyMWVEd1ds?=
 =?utf-8?B?ZkhCeHVESit4VXVaQnNJMXd4Q0wrRmxJWWkrVE8rNkZCNmxmaEdVVmZDaUlV?=
 =?utf-8?B?WUxEUWI4cjBCK1F5amE1ZTAvRklsYjZNOXVDMCtpcjB5b1F3am5ZRmQ3dDhY?=
 =?utf-8?B?SHpOcFFZOC8xV1BtT3NGRkMxL1BqWmlsNTZXMkd4ei8wUGM0bEg0dVJ0dHFJ?=
 =?utf-8?B?WVFGMVlLdmdZZFp2cXlUYTZ2V3dwRTVxZVNGRTlQMXVMOWgyNGxFYmM3cWF0?=
 =?utf-8?B?cTlqY3o3dFlMb3pScFR6emYvKzdjbUtQY1FiKy84YU90TzQ1bUIvQnZKVnJQ?=
 =?utf-8?B?YVZTYnp3ckF3bUFqQ0tGRzM4ZDZNcFk1eHNSaFRVUEVXMkdKdnFzY0NEYkd1?=
 =?utf-8?B?ZjRveGZPWjQ4WVNJUkM2Uk9BbUUwdmVCclZIeFhVeDVoNElrQnpENldZQ1hp?=
 =?utf-8?B?T2hvNlUxNmhjTzBHM3ZYcmczK1B2N0hjRW8zbCtNbXBERFVpejZlZ0orTEM3?=
 =?utf-8?B?b2FyY3dSckpNeDA4dlVDVkZ1czV3cG43cnhmVldqcWNCZmhJQUxleVo1bjVt?=
 =?utf-8?B?bUh5cU5wQ0dmQ2Yvc3BGeWgrNGlOUUFDSTBvbDdweFhsMUhlK2dUVWVWU001?=
 =?utf-8?B?QUs5Vzh1RTJPZTNpL29CQlEvc3ZxZm9hSElzUkxpdEtYQVQrdDRWeVE5RDRn?=
 =?utf-8?B?Z0hnUWxmQ1pCY0swWUp3aTloZ3BHRmh4TFh5ZHhwaGFiSFl5eHVBM0o1V09i?=
 =?utf-8?B?WXp3TFpYRUp2Wk1pTXBMajlxSzArRFVHNjM5SldSc3FXKzVsZE1CWHBLNWRS?=
 =?utf-8?B?R2c1bENWZ0d2bk5zOHJGODd1dXJJa2ZQOTZpVlNNR2NoQ1NVTERKWWw5K2d3?=
 =?utf-8?B?Ymt1Syt5MWV6cU1wZHNoWDk3WUlUc2V2OFZWYjRXYXVSRW5NV3V5N3BlUnRP?=
 =?utf-8?B?NEdTQ2U1KzVSbEJFSVQ5UzhOa0J3US9Dc0lydzFOcjJ2YTI1em5ybGJRRlcz?=
 =?utf-8?B?dlhpUDV4WEx2b1kweVlFOU04Qzhjb1Q1dDYrTjQwSTlqajdFMFBMR1lCVExQ?=
 =?utf-8?B?OC9RT21iSlRsVzhOT3l2MGd1V29Vbkt2VjlBRGRaSzJDUmIyKzJPOGg2KzRT?=
 =?utf-8?B?WDErOUVteElDZ2o3Rk1XalNsM3R3TVNYMlBzTG9OS09TcjVGK1FCc2R5dmFK?=
 =?utf-8?B?WWxPZVl5RTRjcG9TM3dXdWljaHdRQjRQaEdDWE1KeWhJaWdTOGI5RWNlSk12?=
 =?utf-8?B?TFlWc0F1RGc4Y0ZNS0wyOUdva0cxL3dvRnEzYW02bDloTlZ0bDlYK0hCMlM1?=
 =?utf-8?B?SjBQM09vQW9sSUU4blVtSzkvOEVXMmU0UWhFdjJiMzM1K3NHcFJrLzdndE5y?=
 =?utf-8?B?aVo3YzBtTzh6RmYrN1BVd1BKYXMxanZBY1BXNjFiRWJlbUIweTg4SDF6cTQ4?=
 =?utf-8?B?OG14QjF4SklRcUNrbG5NQjR0WXhrUnhNWjZLRzBQT0lPL3NFWmNNWUIvNWFr?=
 =?utf-8?B?YkRZb2FtY2NGbXV4NG5NcUpmekdQenRhVWphTCtQZUVyMWFaNU93TVJsQksx?=
 =?utf-8?B?RndYNHg0OWx4bzR4aWx3ODBrSGg0elBqK0NRZmZBajIyK2RTWVdPSnpURXpC?=
 =?utf-8?B?d1lvcmpZUGM3WXFCZFRnS2w0dmYxRW1ua2tQVk5ubktVd2h0NmlWaFhLY3VI?=
 =?utf-8?B?M0FocTBSNVFrWUtNRDAybCt5c1JOdEpmeVhlOHZ0Zm56V1VHQVhhYS9YV3Ix?=
 =?utf-8?B?TDQ0WndSZnVtVnlhV2pSQXQyY1RpQ3IwSis3b1hzbjljYWhBeE81ZWpOZytl?=
 =?utf-8?B?ZUk0ZjFjOE51MTZnYldHOEV2VmVNUStXVEV4aWV2TE1FWStBTmlwR0NJUEcz?=
 =?utf-8?B?UWt4a3dHdE1IRVNHUnZ4NmFVdU5TY1FTQnlUMEJ3SUsyQTEzUTFTZ3Q1bG9N?=
 =?utf-8?B?SW9PWEhCODJUajF2V2h6ZjVuZHpVWHpEQjc5Z1luM1FlUndlRzc0ZmJhbVp6?=
 =?utf-8?B?K0F3R1FmMWk1ZytwRmxRWm9SN0RCTjRTQi9sMjBucytpTHpwZ1pJZkJyallP?=
 =?utf-8?B?RUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6A96BED4180BB4CB6B6CFC33E138C38@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b102c08-0da8-495b-a20c-08daacf79f06
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2022 08:47:55.0633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hy4w/2WsTNfvJIe4nfrZu1UYE0lPfMPQ7cCHJ6b8EqmkLON7un8jpR8YUGp/Cqi77inMbMQTDPt0AIT9Ib9liw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6786
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=kai.huang@intel.com;
 helo=mga03.intel.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVGh1LCAyMDIyLTEwLTEzIGF0IDAyOjIzIC0wNDAwLCBZYW5nIFpob25nIHdyb3RlOg0KPiA+
ID4gZW5jbGF2ZSBvbmx5IHN1cHBvcnRlZCBTU0UgYW5kIHg4NyBmZWF0dXJlKHhmcm09MHgzKS4N
Cj4gPiANCj4gPiBJcyB0aGlzIHRydWU/wqAgUGVyaGFwcyBJIGFtIG1pc3Npbmcgc29tZXRoaW5n
LCBidXQgaXQgc2VlbXMgZW52LQ0KPiA+ID4gZmVhdHVyZXNbRkVBVF9YU0FWRV9YQ1IwX0xPXSBv
bmx5IGluY2x1ZGVzIExCUiBiaXQsIHdoaWNoIGlzIGJpdCAxNS4NCj4gDQo+IMKgIFdlIHByaW50
ZWQgdGhlIFhGUk0gdmFsdWUgZnJvbSBTR1ggU0RLIHRvIGZpbmQgdGhpcyBpc3N1ZS4NCg0KSSBk
b24ndCBrbm93IGhvdyB5b3UgYWRkZWQgdGhlIHByaW50LCBidXQgdGhlIGV4YWN0IHZhbHVlIHRo
YXQgc2V0IHRvIFNHWCBDUFVJRA0KaXMgaXJyZWxldmFudCwgYXMgaXQgaXMgd3JvbmcgYW55d2F5
LiAgVGhlIHZhbHVlIGNhbiBhbHNvIGRpZmZlciB3aGVuIHlvdSBydW4gb24NCmRpZmZlcmVudCBt
YWNoaW5lcywgZXRjLiAgSU1ITyBpbiBjaGFuZ2Vsb2cgd2UganVzdCBuZWVkIHRvIHBvaW50IG91
dCB0aGUgZmFjdA0KdGhhdCB0aGUgWFNBVkUgZW5hYmxpbmcgcGF0Y2ggd3JvbmdseSBtZXNzZWQg
dXAgd2l0aCBTR1ggQ1BVSUQgYW5kIHRoaXMgcGF0Y2gNCmZpeGVzIHRoYXQuDQo=

