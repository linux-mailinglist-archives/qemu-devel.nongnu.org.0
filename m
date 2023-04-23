Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDC26EBC5E
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 04:06:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqP6W-0001df-Qw; Sat, 22 Apr 2023 22:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1pqP6N-0001d4-Cj; Sat, 22 Apr 2023 22:05:20 -0400
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1pqP6F-0005Vr-6z; Sat, 22 Apr 2023 22:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682215511; x=1713751511;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3QJQHbR59w0yPYjE5qxCq6ek9n9Az9QAaenjTQVsJuM=;
 b=Ls2OhEmoZKvzd014hAPa2Y9X7URZ5XZpq7BgK3H/Dgm1i9keZNE/nCz8
 ZaVnLnCrIc4eP6uhiqPrzI/UtIqDI40Pr3LNMUYvJqnoYwEqwlxduRWQm
 2WEpNR8Rilm/VE/7sMCuYEa/5k87TV88MNAWZAv0PZspBNRb3XjHoDCrW
 Q+nCcPAsfS9jGQIXhTwpGvHeCfkjDzIV465S2GYUSs+DS+/LL4R6XbPbr
 FQUQfWk8X8UwYUOQ0A5PcQQ3SW233XoJA619vvqWNJES8vFS6Q3T/6AEr
 +nXcLO6ePOjGudfhHjpbJWMZx1avZi4XVMx0UlfpeOshGidL6+Ra7S2p8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="344979811"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; d="scan'208";a="344979811"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2023 19:05:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="695334531"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; d="scan'208";a="695334531"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 22 Apr 2023 19:05:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 22 Apr 2023 19:05:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 22 Apr 2023 19:05:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sat, 22 Apr 2023 19:05:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sat, 22 Apr 2023 19:05:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/MQHnd0HKIZrSKMwbCNuv90LJFmwNwvJkp3x4ki/snyg8ti4Bz5QExBaqZh20J/FDr7fed3SvhduO14efy/rFCF+35mY+Kz71EC1VQZTXSQHgZPiyGk3Y29POxpUAsTrHMfG3moZqrk+ATAGrUYUVvA3FaXjb7Lua56T08wXyeqMZvnuAhJY/YQHVZtqVx+eDqJlWzBanTbtgHpUWgMZnA/DdYcRXw5d10Cg+ztAGWrd0jFM0hvPhLyZyGDgbk5xTyB8WXzscrJgxJC3u+kP3ZcGLvDNLbcaRUFO7BvjP2qK+YF1mzrqzrSx4PUIE95gVP1alfG4YE2ikYHArrWJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QJQHbR59w0yPYjE5qxCq6ek9n9Az9QAaenjTQVsJuM=;
 b=lWKnz8eRLKPWTtzgq0rxObsAmbfWm1QHN0OickSCE9Dh1WOMau31lDhTseg/sMb4My7Ca1DTJR0iDlHqQeTRUDH4Ty5JqE3HixctFkHw5+5kaSsapFbNAfV1PUg/7oHhYxxn3v6seP86FDDiedgM/p2z66sMBs1+ONW8or/n3h523a+rKYPy2z7VIpX8RaqDxgmEXYnI7+BokDCSVY4oLc2UJNLKz4D3IjDGsPXhxZD5ccJ5Ye4hEUebeUcXq8h3cHl9j/AqFkvJ054EWOMWlMXRJIudIuGqpaiKZHfb0agHnIHxn6WvVo/ekWbenGt8jmVp8I6EQfW7lQWovdo+FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by PH7PR11MB6930.namprd11.prod.outlook.com (2603:10b6:510:205::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.29; Sun, 23 Apr
 2023 02:05:01 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e%4]) with mapi id 15.20.6319.022; Sun, 23 Apr 2023
 02:05:01 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "michael.roth@amd.com"
 <michael.roth@amd.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>, "Zhang,
 Hailiang" <zhanghailiang@xfusion.com>, "philmd@linaro.org"
 <philmd@linaro.org>, "thuth@redhat.com" <thuth@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "dave@treblig.org" <dave@treblig.org>, "hreitz@redhat.com"
 <hreitz@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
Subject: RE: [PATCH v2 4/4] configure: add --disable-colo-filters option
Thread-Topic: [PATCH v2 4/4] configure: add --disable-colo-filters option
Thread-Index: AQHZcxHF8JmBz3Zr1EC3tnLXcpte268z5aQggAAp6wCAAPO0cIAAc+GAgAKwh0A=
Date: Sun, 23 Apr 2023 02:05:01 +0000
Message-ID: <MWHPR11MB0031F179B129F80270E9166B9B669@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
 <20230419225232.508121-5-vsementsov@yandex-team.ru>
 <MWHPR11MB0031567319A3C4CE499F3CF99B639@MWHPR11MB0031.namprd11.prod.outlook.com>
 <3c5aa49f-ca2a-5c73-befc-81377cc331b0@yandex-team.ru>
 <MWHPR11MB00315E99ED447760E8DF6A1E9B609@MWHPR11MB0031.namprd11.prod.outlook.com>
 <7f576196-db7e-e359-1285-8cc474486312@yandex-team.ru>
In-Reply-To: <7f576196-db7e-e359-1285-8cc474486312@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|PH7PR11MB6930:EE_
x-ms-office365-filtering-correlation-id: e84e663f-ad0a-456d-041d-08db439f25a9
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /GuFoBmKcdoDYJ6czHyWc4pSgVxZdWTAZP3Wsu8skeQtfT8rJrY43GysJJ6MyOVv5vRFMh79O99YDBVee0e69Wlm8vcJNgGhPkx2dmtmhh77BvVGvMOVvNV9NqUFIWd1TcXrtlx5wJFLDHa8qDGQ1rkugOu3IP8zAAoWjq3rHQ+d0IQ8S6XYCTmc0LYYc1lJNxWCzSHXfeGadoz5OZ6mRa3TI4Htq1gYsd3DhQmbpN29vHg+4bJ8TbRZXYBs11zz0uFNVwnXXRt8/Q8LiHFrHhphMtj9+HFEN0lA32/iwR0FYxtL98Shnv5XBMVXcptztV5xVfqTWolF9B+HB4UJ69VmhzV+zRfrMNj/jhjwbkPv0GbBvbhGeaZfIBBnRd9DLcRLdvmEnbkUiegZISQu1kkCJ/tQ/a+n4oGPtu9zghUK0Mjrhm5YHBDFJETgD6wlezZBVNIv3/7EgBlS3e38nh15AdSOPpBdGt77ol/Pi0sy17FcRpJ/7vougx/kbsq07uIw0j7PZwfcSP41N0/Kv7YSksFFxScZbfh56lRnXWlH7/JZza0abap5mJpMe2BH+l7H038RiEa0RNiaWAaaQBpqpQKwjOnsTma4QnETIvrKUWUnsk2cR5NNQ3nx9Haz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199021)(71200400001)(33656002)(110136005)(66446008)(66556008)(54906003)(66476007)(64756008)(66946007)(4326008)(2906002)(186003)(316002)(7696005)(53546011)(52536014)(7416002)(41300700001)(5660300002)(55016003)(478600001)(122000001)(82960400001)(8676002)(8936002)(86362001)(83380400001)(9686003)(6506007)(38100700002)(76116006)(38070700005)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1V4N2l2Zm9YS05ER3hjWURzNFNEYWNJZHhBSGxoMjhkSzM3cEpWMlp2a0ZQ?=
 =?utf-8?B?NDYrVEFqdEhVRlhjRXAvZkpkMEFFSGI0cElITFZ4TTh3UTdtay9yaHpsUmNv?=
 =?utf-8?B?aWU2S2VpZmp4NDJJc2lIN2hrNFkzMFFjWUxvdzc3YzlHamM2cFYxMTVhZmE1?=
 =?utf-8?B?ZzdrYWJZSTJtNUVyU055b2hScmc5VzVPR2p6WUlsQkNweGNGc2gwbitPcTJP?=
 =?utf-8?B?aU9KQkxkM0k3QXRQWnNFMnNFN0Z6M0xGQUpRQnRoNVZnNXZhZFNHZHNjTjd6?=
 =?utf-8?B?dFdpdlRnRTF0ZXN4d0c5NWsrRkdRVVhnREpIeS8yRHQ4L2F2S3oydURNUHJH?=
 =?utf-8?B?TlMyTEhkd1FMcXdPUlBFdzBoLzM2Mnc2Tkxhdmt5c3A5dWI0M3NTTmlNYXZD?=
 =?utf-8?B?QjBXZVFaV2V4aE42OXUvL3loTmgralhha2YyZklXU3NPUlhnaHcyVmJaUWl4?=
 =?utf-8?B?c0ZUK1E2TVF5bzBFdnhXRUJhYjk2QzBMdjZlS3lVMUIvY1N1Zjh2SWQwRXd6?=
 =?utf-8?B?TG54R2xudFRrYms0ZTRiNDd5QmN5OFRUQU4waEI0RzlYUm10aDRvMUtYSkEr?=
 =?utf-8?B?ZFpZejR2dHh5ZUJ0Mml6bG9XUm81WlBOeHhpOEx4aW9hRDZ0S1VSY0dQbEVG?=
 =?utf-8?B?dGlvclFvL3F4d3h6L0l5bk43elBrdzZuelFxVDd4N1FYSFdrQ1JraDNuckFa?=
 =?utf-8?B?MjZiSGVrT0l0bkhwWHdBL1hKV3VpaE50VWIyYzYwOWdNbTRnZDc2cDV5Y04r?=
 =?utf-8?B?bjlodGVXTTVpZkFkRjM3U1NOR3AwVVNNOU5OLzB5VExxWDdwVjBveHNiWS9N?=
 =?utf-8?B?aHRHNnlKTGdsMHR1L29ZZnlabUI2eUF3V0phVEhPbmY1UTlTeGRicXdKbnUz?=
 =?utf-8?B?MHpDN3dDVFdlQWJaODRSeGc5OHQyRzNmbTIwRlk3ZGlVZWdvY1F1bjJ3VGRi?=
 =?utf-8?B?ajg4VnZXU0M2TlB1elRBQXFhVlFyTU4zSG5nZ0JNNFhCNUp6UE9yUFdxTFVX?=
 =?utf-8?B?Yk1yenlwMUt5SDV4Tk5GcFhSdVJ5K0NOQnYvUWtjVmI1elhTNnYvWkM2Qktj?=
 =?utf-8?B?a3UrVjZIODNFeEp6OGFwZElncW81VHcxUnRObS9yS0cveDFxTGl1cVNzUTB4?=
 =?utf-8?B?R1VWejlnQU04ei9sNWVyc2hXWUdFZUlYME5KMDlWZkEyZVJzOGg2Nnp0N0Ew?=
 =?utf-8?B?MmtQMW9NVFJ0ZWgwRDY0OFdlanZtMUhXY0RKTmdZbzVBOW9MQ0ttRDFoY3ND?=
 =?utf-8?B?V2YraXRBWGpyNTRybUZ5NXJVWUFyZ1E4MVh0cWlVVitUVjlxL1JaOWJNOVVP?=
 =?utf-8?B?Ty80bmlBYUNwYmdHMGk1ZmJUZnluZUZOeXgzWFBZa1F0czVid09KN1QyeHFx?=
 =?utf-8?B?a0dJWWhkeFlGSmRGeERnRklhMFZpcHRLazFQWlFzTlF2bXI4bUkrTm02Qzhj?=
 =?utf-8?B?VDlqbTIvWCtHNUlYVFh1ci9vc2xZNTZSNXhLS091YVE3VkFiT3NRN084Nkxz?=
 =?utf-8?B?OExkUnlTbS9lNkc1SGgrT0dUMExwRTRYaDZ0Vnd6VmU1MWxQRVhaQlZ1WlQz?=
 =?utf-8?B?QVI1SG51ZW9qZ2Y1YVJGMzRaOHJkcVVHdVdrU1RuTmdFVlE3TlgwT0xEcy9L?=
 =?utf-8?B?UWNCNlpnTUN0WDcyVlpVdXhVTFVkRG1kNUlYcVFxSzJDRkI2ZmNFbW83Vjlk?=
 =?utf-8?B?dHl3TXFRaTM2TmtySGNKdVEvUTgzTWY4dE9MTmFEQjM1bGU2K3lMUlR0bExB?=
 =?utf-8?B?SFdNbGVVb1B6TXF4eDhSaURkcGgxQ0RuYmoyWlVxQWxxTy9JSTlOZ3dCV3l5?=
 =?utf-8?B?aHN6b2crQysxMitLSHgvREttbmpWNGJiTU9CRzVmdzJFK3FmZGRsNG8wVEhw?=
 =?utf-8?B?MVBWV3J5V3hobmdqNlVJT2R2Q0s2NEtkWWtIY0MvMmpjbThRTDJaYUdlbG5u?=
 =?utf-8?B?REIyRE50OEtHVGI5VHhwaXFwRGRMK1UwelFucS9CK1d3NGdvQlJoOCtiemc5?=
 =?utf-8?B?KzQzZW03WStTLzlMeHdOSXlpZ3BqTGJpb2c5NTFibGk1UUNPVFpaQ1poeU9z?=
 =?utf-8?B?cG1SdStSOW9nVnFuNzl2TStiYzVvOWpLcm1ialFVYzVoNmg4amZEbzROL25C?=
 =?utf-8?Q?DAig=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e84e663f-ad0a-456d-041d-08db439f25a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2023 02:05:01.3717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GLRkRmPZ5gGmtjrCI2kSGhq8Jj8BIAZ+0ST5X+hK1MXVpTITj67EOqy60vqMuM6fYkBoinXHzI3ejOD7AYBupA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6930
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120; envelope-from=chen.zhang@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVmxhZGltaXIgU2VtZW50
c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB5YW5kZXgtdGVhbS5ydT4NCj4gU2VudDogRnJpZGF5
LCBBcHJpbCAyMSwgMjAyMyA0OjUzIFBNDQo+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0Bp
bnRlbC5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IHFlbXUtYmxvY2tAbm9uZ251
Lm9yZzsgbWljaGFlbC5yb3RoQGFtZC5jb207IGFybWJydUByZWRoYXQuY29tOw0KPiBlYmxha2VA
cmVkaGF0LmNvbTsgamFzb3dhbmdAcmVkaGF0LmNvbTsgcXVpbnRlbGFAcmVkaGF0LmNvbTsgWmhh
bmcsDQo+IEhhaWxpYW5nIDx6aGFuZ2hhaWxpYW5nQHhmdXNpb24uY29tPjsgcGhpbG1kQGxpbmFy
by5vcmc7DQo+IHRodXRoQHJlZGhhdC5jb207IGJlcnJhbmdlQHJlZGhhdC5jb207IG1hcmNhbmRy
ZS5sdXJlYXVAcmVkaGF0LmNvbTsNCj4gcGJvbnppbmlAcmVkaGF0LmNvbTsgZGF2ZUB0cmVibGln
Lm9yZzsgaHJlaXR6QHJlZGhhdC5jb207DQo+IGt3b2xmQHJlZGhhdC5jb207IGxpemhpamlhbkBm
dWppdHN1LmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDQvNF0gY29uZmlndXJlOiBhZGQg
LS1kaXNhYmxlLWNvbG8tZmlsdGVycyBvcHRpb24NCj4gDQo+IE9uIDIxLjA0LjIzIDA1OjIyLCBa
aGFuZywgQ2hlbiB3cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4+IEZyb206IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZA
eWFuZGV4LXRlYW0ucnU+DQo+ID4+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAyMCwgMjAyMyA3OjI2
IFBNDQo+ID4+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+OyBxZW11LWRl
dmVsQG5vbmdudS5vcmcNCj4gPj4gQ2M6IHFlbXUtYmxvY2tAbm9uZ251Lm9yZzsgbWljaGFlbC5y
b3RoQGFtZC5jb207DQo+IGFybWJydUByZWRoYXQuY29tOw0KPiA+PiBlYmxha2VAcmVkaGF0LmNv
bTsgamFzb3dhbmdAcmVkaGF0LmNvbTsgcXVpbnRlbGFAcmVkaGF0LmNvbTsNCj4gWmhhbmcsDQo+
ID4+IEhhaWxpYW5nIDx6aGFuZ2hhaWxpYW5nQHhmdXNpb24uY29tPjsgcGhpbG1kQGxpbmFyby5v
cmc7DQo+ID4+IHRodXRoQHJlZGhhdC5jb207IGJlcnJhbmdlQHJlZGhhdC5jb207DQo+IG1hcmNh
bmRyZS5sdXJlYXVAcmVkaGF0LmNvbTsNCj4gPj4gcGJvbnppbmlAcmVkaGF0LmNvbTsgZGF2ZUB0
cmVibGlnLm9yZzsgaHJlaXR6QHJlZGhhdC5jb207DQo+ID4+IGt3b2xmQHJlZGhhdC5jb207IGxp
emhpamlhbkBmdWppdHN1LmNvbQ0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDQvNF0gY29u
ZmlndXJlOiBhZGQgLS1kaXNhYmxlLWNvbG8tZmlsdGVycw0KPiA+PiBvcHRpb24NCj4gPj4NCj4g
Pj4gT24gMjAuMDQuMjMgMTI6MDksIFpoYW5nLCBDaGVuIHdyb3RlOg0KPiA+Pj4NCj4gPj4+DQo+
ID4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+PiBGcm9tOiBWbGFkaW1pciBT
ZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHlhbmRleC10ZWFtLnJ1Pg0KPiA+Pj4+IFNl
bnQ6IFRodXJzZGF5LCBBcHJpbCAyMCwgMjAyMyA2OjUzIEFNDQo+ID4+Pj4gVG86IHFlbXUtZGV2
ZWxAbm9uZ251Lm9yZw0KPiA+Pj4+IENjOiBxZW11LWJsb2NrQG5vbmdudS5vcmc7IG1pY2hhZWwu
cm90aEBhbWQuY29tOw0KPiA+PiBhcm1icnVAcmVkaGF0LmNvbTsNCj4gPj4+PiBlYmxha2VAcmVk
aGF0LmNvbTsgamFzb3dhbmdAcmVkaGF0LmNvbTsgcXVpbnRlbGFAcmVkaGF0LmNvbTsNCj4gPj4g
WmhhbmcsDQo+ID4+Pj4gSGFpbGlhbmcgPHpoYW5naGFpbGlhbmdAeGZ1c2lvbi5jb20+OyBwaGls
bWRAbGluYXJvLm9yZzsNCj4gPj4+PiB0aHV0aEByZWRoYXQuY29tOyBiZXJyYW5nZUByZWRoYXQu
Y29tOw0KPiA+PiBtYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb207DQo+ID4+Pj4gcGJvbnppbmlA
cmVkaGF0LmNvbTsgZGF2ZUB0cmVibGlnLm9yZzsgaHJlaXR6QHJlZGhhdC5jb207DQo+ID4+Pj4g
a3dvbGZAcmVkaGF0LmNvbTsgWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPjsNCj4g
Pj4+PiBsaXpoaWppYW5AZnVqaXRzdS5jb207IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkN
Cj4gPj4+PiA8dnNlbWVudHNvdkB5YW5kZXgtIHRlYW0ucnU+DQo+ID4+Pj4gU3ViamVjdDogW1BB
VENIIHYyIDQvNF0gY29uZmlndXJlOiBhZGQgLS1kaXNhYmxlLWNvbG8tZmlsdGVycw0KPiA+Pj4+
IG9wdGlvbg0KPiA+Pj4+DQo+ID4+Pj4gQWRkIG9wdGlvbiB0byBub3QgYnVpbGQgQ09MTyBQcm94
eSBzdWJzeXN0ZW0gaWYgaXQgaXMgbm90IG5lZWRlZC4NCj4gPj4+DQo+ID4+PiBJIHRoaW5rIG5v
IG5lZWQgdG8gYWRkIHRoZSAtLWRpc2FibGUtY29sby1maWx0ZXIgb3B0aW9uLg0KPiA+Pj4gTmV0
LWZpbHRlcnMganVzdCBnZW5lcmFsIGluZnJhc3RydWN0dXJlLiBBbm90aGVyIGV4YW1wbGUgaXMg
Q09MTw0KPiA+Pj4gYWxzbyB1c2UgdGhlIC1jaGFyZGV2IHNvY2tldCB0byBjb25uZWN0IGVhY2gg
ZmlsdGVycy4gTm8gbmVlZCB0byBhZGQNCj4gPj4+IHRoZSAtLQ0KPiA+PiBkaXNhYmxlLWNvbG8t
Y2hhcmRldi4uLi4NCj4gPj4+IFBsZWFzZSBkcm9wIHRoaXMgcGF0Y2guDQo+ID4+DQo+ID4+IEkg
ZG9uJ3QgZm9sbG93IHlvdXIgcmVhc29uaW5nLiBPZiBjb3Vyc2UsIHdlIGRvbid0IG5lZWQgYW55
IG9wdGlvbg0KPiA+PiBsaWtlIHRoaXMsIGFuZCBjYW4gc2ltcGx5IGluY2x1ZGUgdG8gYnVpbGQg
YWxsIHRoZSBjb21wb25lbnRzIHdlDQo+ID4+IGRvbid0IHVzZS4gU28gIm5vIG5lZWQiIGlzIGNv
cnJlY3QgZm9yIGFueSAtLWRpc2FibGUtKiBvcHRpb24uDQo+ID4+IFN0aWxsLCBJIHRoaW5rLCBp
dCdzIGdvb2QsIHdoZW4geW91IGNhbiBleGNsdWRlIGZyb20gYnVpbGQgdGhlDQo+ID4+IHN1YnN5
c3RlbXMgdGhhdCB5b3UgZG9uJ3QgbmVlZCAvIGRvbid0IHdhbnQgdG8gbWFpbnRhaW4gb3Igc2hp
cCB0byB5b3VyDQo+IGVuZCB1c2Vycy4NCj4gPg0KPiA+IFllcywgSSBhZ3JlZSB3aXRoIHlvdXIg
aWRlYS4NCj4gPg0KPiA+Pg0KPiA+PiBJbiBNQUlOVEFJTkVSUyB0aGVzZSB0d28gZmlsdGVycyBh
cmUgaW4gIkNPTE8gUHJveHkiIHN1c2JzeXN0ZW0uIElzDQo+ID4+IGl0IGNvcnJlY3Q/IFdoYXQn
cyB3cm9uZyB3aXRoIGFkZGluZyBhbiBvcHRpb24gdG8gbm90IGJ1aWxkIHRoaXMNCj4gPj4gc3Vi
c3lzdGVtPyBJIGNhbiByZW5hbWUgaXQgdG8gLS1kaXNhYmxlLWNvbG8tcHJveHkuDQo+ID4NCj4g
PiBUaGUgaGlzdG9yeSBpcyBDT0xPIHByb2plY3QgY29udHJpYnV0ZWQgUUVNVSBmaWx0ZXIgZnJh
bWV3b3JrIGFuZCBmaWx0ZXItDQo+IG1pcnJvci9yZWRpcmVjdG9yLi4uZXRjLi4NCj4gPiBBbmQg
dGhlICJDT0xPIFByb3h5IiBzdXNic3lzdGVtIGNvdmVyZWQgdGhlIGZpbHRlcnMgZG8gbm90IG1l
YW5zIGl0DQo+IGJlbG9uZyB0byBDT0xPLg0KPiA+IFNvLCBJdCBpcyB1bnJlYXNvbmFibGUgdG8g
dGVsbCB1c2VycyB0aGF0IHlvdSBjYW5ub3QgdXNlDQo+ID4gZmlsdGVyLW1pcnJvci9yZWRpcmV0
b3IgZm9yIG5ldHdvcmsgZGVidWdnaW5nIE9yIG90aGVyIHB1cnBvc2UgYmVjYXVzZQ0KPiB5b3Ug
aGF2ZSBub3QgZW5hYmxlZCBDT0xPIHByb3h5Lg0KPiANCj4gQnV0IHdlIGRvbid0IHNheSBpdCB0
byB1c2VycywgYXMgdGhlc2UgZmlsdGVycyBhcmUgZW5hYmxlZCBieSBkZWZhdWx0Lg0KPiANCj4g
QnV0IEkgc2VlIHlvdXIgcG9pbnQuIEFuZCBsb29raW5nIGF0IGZpbHRlci1taXJyb3IuYyBJIHNl
ZSB0aGF0IHRoZXJlIGlzIG5vDQo+IHJlbGF0aW9ucyB3aXRoIGNvbG8uIENhbid0IHNheSB0aGlz
IGFib3V0IGZpbHRlci1yZXdyaXRlci5jDQo+IA0KPiBTbywgYWJzb2x1dGVseSBjb3JyZWN0IHdv
dWxkIGJlIGp1c3QgaGF2ZSBzZXBhcmF0ZSBvcHRpb25zDQo+IA0KPiAtLWRpc2FibGUtbmV0LWZp
bHRlci1taXJyb3INCj4gLS1kaXNhYmxlLW5ldC1maWx0ZXItcmV3cml0ZXINCj4gDQo+IGFuZCBm
b3IgYW55IG90aGVyIGZpbHRlciB3ZSB3YW50IHRvIGJlICJkaXNhYmxlLWFibGUiLCBsaWtlIG9w
dGlvbnMgZm9yIGJsb2NrDQo+IGRyaXZlcnMgKEkgbWVhbiAtLWRpc2FibGUtcGFyYWxsZWxzLCAt
LWRpc2FibGUtcWNvdzEsIC0tZGlzYWJsZS1xZWQsIGV0YyBmb3INCj4gZmlsZXMgZGVzY3JpYmlu
ZyB0aGVzZSBkcml2ZXJzIGluIGJsb2NrLykNCj4gDQoNClllcy4NCg0KPiANCj4gPg0KPiA+Pg0K
PiA+Pj4gQnV0IGZvciBDT0xPIG5ldHdvcmsgcGFydCwgc3RpbGwgc29tZXRoaW5nIG5lZWQgdG8g
ZG86DQo+ID4+PiBZb3UgY2FuIGFkZCAtLWRpc2FibGUtY29sby1wcm94eSBub3QgdG8gYnVpbGQg
dGhlIG5ldC9jb2xvLWNvbXBhcmUuYw0KPiA+Pj4gaWYgaXQgaXMNCj4gPj4gbm90IG5lZWRlZC4N
Cj4gPj4+IFRoaXMgZmlsZSBqdXN0IGZvciBDT0xPIGFuZCBub3QgYmVsb25nIHRvIG5ldHdvcmsg
ZmlsdGVycy4NCj4gPj4NCj4gPj4gbmV0L2NvbG8tY29tcGFyZS5jIGlzIHVzZWQgb25seSBvbmx5
IGZvciBDT0xPLCB3aGljaCBpbiB0dXJuIHVzZWQNCj4gPj4gb25seSB3aXRoIENPTkZJR19SRVBM
SUNBVElPTiBlbmFibGVkLCBzZWUgcGF0Y2ggMy4gU28sIG5vIHJlYXNvbiB0bw0KPiA+PiBhZGQg
c2VwYXJhdGUgb3B0aW9uIGZvciBpdCwgaXQgc2hvdWxkIGJlIGRpc2FibGVkIHdpdGggLS1kaXNh
YmxlLXJlcGxpY2F0aW9uLg0KPiA+DQo+ID4gWWVzLCBhbmQgYXMgTHVrYXMgc2FpZCwgQ09MTyBp
cyB0aGUgb25seSB1c2VyIGZvciB0aGUgZmlsdGVyLXJld3JpdGVyIGN1cnJlbnRseS4NCj4gDQo+
IFNvLCBtYXliZSBzaW1wbHkgbW92ZSBmaWx0ZXItcmV3cml0ZXIuYyB1bmRlciBDT05GSUdfUkVQ
TElDQVRJT04sIGlmIGl0J3MNCj4gbmVlZGVkIG9ubHkgZm9yIENPTE8/DQo+IA0KDQpBcyBJIGtu
b3csIGluIFFFTVUgc2lkZSwgQ09MTyBpcyB0aGUgb25seSB1c2VyIGZvciBmaWx0ZXItcmV3cml0
ZXIuDQpCdXQgUUVNVSB1c2VyKGxpYnZpcnQuLi5ldGMuLi4pIG1heSB0cnkgdG8gdXNlIGl0IGZv
ciBvdGhlciBwcm9wb3NhbC4NCg0KPiA+IEl0IGlzIG1vcmUgYXBwcm9wcmlhdGUgdG8gYWRkIGZp
bHRlci1yZXdyaXRlciByZXBsYWNlIHRoZSBmaWx0ZXItbWlycm9yIGhlcmUuDQo+ID4gSSBzYXcg
dGhlIHBhdGNoIDMsIGl0IGlzIGJldHRlciB0byBtb3ZlIGl0IHRvIHRoaXMgcGF0Y2guDQo+IA0K
PiBIbW0gd2hhdCBkbyB5b3UgbWVhbj8gQm90aCBmaWx0ZXItcmV3cml0ZXIgYW5kIGZpbHRlci1t
aXJyb3IgYXJlIG5vdw0KPiBoYW5kbGVkIGluIHRoaXMgcGF0Y2gsIHNvIHdoYXQgdG8gcmVwbGFj
ZT8NCg0KSSBtZWFucyBpdCdzIGJldHRlciB0byBtYWtlIHRoZSBuZXQvY29sby1jb21wYXJlLmMg
YW5kIG5ldC9maWx0ZXItcmV3cml0ZXIuYyB0byB0aGlzIHBhdGNoIGZvcg0KVGhlIG9wdGlvbjog
LS1kaXNhYmxlLWNvbG8tcHJveHkNCg0KVGhhbmtzDQpDaGVuDQoNCj4gDQo+ID4NCj4gPiBUaGFu
a3MNCj4gPiBDaGVuDQo+ID4NCj4gPj4NCj4gPj4gLS0NCj4gPj4gQmVzdCByZWdhcmRzLA0KPiA+
PiBWbGFkaW1pcg0KPiA+DQo+IA0KPiAtLQ0KPiBCZXN0IHJlZ2FyZHMsDQo+IFZsYWRpbWlyDQoN
Cg==

