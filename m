Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FAB54BC8E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 23:12:31 +0200 (CEST)
Received: from localhost ([::1]:49962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Dpu-0004NG-40
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 17:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eddie.dong@intel.com>)
 id 1o1Dnj-0001Nv-Oy
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 17:10:17 -0400
Received: from mga06b.intel.com ([134.134.136.31]:51372 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eddie.dong@intel.com>)
 id 1o1Dnf-00084P-NK
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 17:10:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655241011; x=1686777011;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8pLQKR3dgNJtaOMTd3au1NLr6f4p3HeZxwNkRdzzzxY=;
 b=IQ4a1zaiXmqCSkuJjBwS3CNoWmtND7FdERC75qWmJLdnfY8FiZgllMJN
 oySswgolyinsLTxJt+ZfvpNFNpg3yqWMnImNGv5qrEs6S6cnlTbK16ivF
 ZNVFuSUNSBILGZwdh2b2UI/GURSNQlde6LGMhc6JPSlYpRDJ5Eh1+X2ye
 UxxHKAkkUwO/lzWFCjI+3YPt3PSKiOtXUEpggmyYVjqhSF42N6xEyL+Hy
 hQxOA5KcerTBLjp0paaqTjDDmENhDM2/Gb1dcB/bwHTmFkaMpDDW/u2OL
 9W3iUWlQaJZE9DhkL6tXdunlmLK6J9RohWJj6Brj9Vdl5Fz5CpjU8Lotx w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="340407092"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="340407092"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 14:10:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="612419533"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga008.jf.intel.com with ESMTP; 14 Jun 2022 14:10:07 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 14 Jun 2022 14:10:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 14 Jun 2022 14:10:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 14 Jun 2022 14:10:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBmZYOupWdZ0HUBfH4QrcCawLQuBYsMsO/U0bYDPDlqdnRukArLcOvvAY27X1eAukO+Ri6MiSk6WKQ2//Ewiwo9OlEWTqD5z8F73ngPr62FwMSRfkggu8z5gsknCBMb+rjPw3uHbcBOFRghKnKzryFi+aw+DPttcOtZBWiIRA979mkzoQLxmKnVnSBaFPQZMcFj0bOVeFL9kY2JHZmEgUnma+Ue2nLYonL1VZKkWdS/6N7AGJbK9vAO3JA9gC966fLJowDrDTqVtWDpzhki3ZiGuTu3NTfmhbbGq4odFDdu6gxAbF3CQq5wGDHurPTJ3rJOpTbm27NankfbgotKSyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pLQKR3dgNJtaOMTd3au1NLr6f4p3HeZxwNkRdzzzxY=;
 b=XUUA5GTTLo1LURatkc8KN/krKqC8rG2zE8fYWHs6TDMZR42my3wBbPnW010zvousKVeqqDCevXpemd8HQKQwAjlplQI/FQKZ6lc9shCtzdHv9AXoD0BblyTIRV6hsiOViH4yIGsnK6MIeIXyvrlhBhL3lVjj/WCLXiuVQpc6IxDmYtCTAyGuLu6ac13vlSCLoc1ncV1vcLM44flLE3gzcPDEo3SO+QrMbItFn8Er5E5QtcEvaoyZexmO/dEXD7m0cYRxaZLmWE4gtyo6Z2Hqudn4PKh/qTziDa8VBUyiCPmuFhshppZekUB3WbKSP5yZWuhDp1cr/D/NfkTGE1rIBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL0PR11MB3042.namprd11.prod.outlook.com (2603:10b6:208:78::17)
 by BYAPR11MB3031.namprd11.prod.outlook.com (2603:10b6:a03:8d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Tue, 14 Jun
 2022 21:10:04 +0000
Received: from BL0PR11MB3042.namprd11.prod.outlook.com
 ([fe80::514c:9c82:e633:1274]) by BL0PR11MB3042.namprd11.prod.outlook.com
 ([fe80::514c:9c82:e633:1274%7]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 21:10:04 +0000
From: "Dong, Eddie" <eddie.dong@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
CC: "Rao, Lei" <lei.rao@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 "Zeng, Jason" <jason.zeng@intel.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>, "Li,
 Yadong" <yadong.li@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [RFC PATCH 00/13] Add a plugin to support out-of-band live
 migration for VFIO pass-through device
Thread-Topic: [RFC PATCH 00/13] Add a plugin to support out-of-band live
 migration for VFIO pass-through device
Thread-Index: AQHYbzYuYfm0qwV+L0K9qSt48Olwo60xgtSAgAGaBTCAB8fsAIAUmScw
Date: Tue, 14 Jun 2022 21:10:04 +0000
Message-ID: <BL0PR11MB304236B77DB2CAA20174ED268AAA9@BL0PR11MB3042.namprd11.prod.outlook.com>
References: <20220524061848.1615706-1-lei.rao@intel.com>
 <20220526124427.3f23708f.alex.williamson@redhat.com>
 <BL0PR11MB30424D25A1C7C5544AF643868ADF9@BL0PR11MB3042.namprd11.prod.outlook.com>
 <20220601120120.46c7a057.alex.williamson@redhat.com>
In-Reply-To: <20220601120120.46c7a057.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7914d3b-f1ea-4355-de39-08da4e4a4066
x-ms-traffictypediagnostic: BYAPR11MB3031:EE_
x-microsoft-antispam-prvs: <BYAPR11MB303111C8F0E38EAB16825A548AAA9@BYAPR11MB3031.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3jmIcqm2wEGdtyoK5DvMRO0v+OGXMv64mLjVAn+VcOIHSnAbzWmVOdaWQE8iKntUX3im2uovgKXywbLqYz+QDuc+zNUf29eiV6qTJGjYscEt6TZhWD3HRJv92B9aGqncNTXLxnCPtkZyi+d4TRGXW2cQXXonN5C/FlNKKhYPqFCKGIk3/0KY3o08aBdX+sPoTFUG2kRJIlzFXVxxcPzKz7IIB0HKFmSh4k4I8IXXFpFMkqD6ff+5usnYPNZWPVCxl6ssfgjZUbqUSDZoYtj0x+vMDib5KQOTUpTo2nUNFM1mmZHJ+0zahr+b1eWDkMRkqDgsP39R23Z5p0CZYwjHn4bm9JXIpZK/CEyWAqAijJ+OZoXz8kyVDxB0JC9iCUeER2sFdjctVANwTiRRfA3EZjopiUHCL2HA3NklKPdOWiIoOp9b8lZjnAriykK/GAbnbDIy5FcUM4b/2WULMyE70sIkdnAeC63C5va1ISAk1EEgt1J7hCpakkRhssCeVVT7Dq9ez4/cnzPhURN9CHBngxtDQ+XX2SQXU8ZZWv8WWKAsI6xgVYSDzXUBNNcKZHVqoSAJnabM6hDjX76wqkhJHUEHX8Bh1Zl413miafUWpluou5rjKwXfqdPx1Gh/9tDdkSHJx0BU/K/hWMAidisxa272bpeR4Vgil5WI1Uqpcji2PR/lB1MsfDQRimRHMYcgGNtaFh6HO2FATMpawVsy8A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3042.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(316002)(122000001)(82960400001)(83380400001)(8676002)(66946007)(66556008)(7696005)(6506007)(4326008)(66476007)(64756008)(54906003)(76116006)(66446008)(26005)(38070700005)(38100700002)(52536014)(508600001)(8936002)(71200400001)(33656002)(186003)(2906002)(86362001)(9686003)(53546011)(55016003)(5660300002)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anRzVG1OOXk2MG1yc3FPYisrVEVhQzdjNUtqYWdGR3dPdEZtQTAxU1hzdlc0?=
 =?utf-8?B?ZDltRlpxVE5CampaWmZlRllxeGFaMGtqUmlZN0dPR0FlN3Y1MUlnMWl2MHFJ?=
 =?utf-8?B?c0RyOGZvZ3JjWE5XUTRsQUE4WE5Ea3hzdVAya3ROVGVPTlRhYkFncTl4Y29I?=
 =?utf-8?B?Z2JUK010S0M1WEJiRzVvQnBCbW5WZjZXdjl5cDRnbnoxemxpOVl5OVUyRFRz?=
 =?utf-8?B?REFseGxKOXZaUW8rTU1NR1dvU20zM0M5K0FrSFBOMFNYQk9DYlpvZUlVNzZN?=
 =?utf-8?B?YS9vbWxIc3FBbmpqNWNMemFFdnY2bEYyVVd5Wk53TStQL2pVWFpCRDN3R0FO?=
 =?utf-8?B?dDRsQ1dlQjRwdzljOW1yMjNZelhjeDlOaG1JOWpCMzYyeXhFaERHVElSUVJJ?=
 =?utf-8?B?OHZjb05vTExqQmhEdUlWMDlDVlo1bTBUK1RRVVJub2VGaHl5cm1iNlR0S1l3?=
 =?utf-8?B?bytJbGUzRlJUUCs0VE96U2llbEl6d0p5NmpUcnhxcXFUYXFDTzRpaUY5ejNv?=
 =?utf-8?B?WU5OQzBjT2RxQ1p3Sm9wZ1Fya3hscEF1MlpYWS9uVnZiZThpeEF0NFBQQ01r?=
 =?utf-8?B?c2tPdFpZRndwZVBrMzVhblhVWHh1My9yU1BMbmZsUldPQlEwbFlvVGpUUXVM?=
 =?utf-8?B?ZXBXUExsS0NsRzMvYnptSVM4UlZ2bVVBM0prS1pSTlZqbmI5OEFjamFNOU5L?=
 =?utf-8?B?M09tZm1XN2IxSEJnVDJYUVB5T3M4NU80NThpbFRKNWwwVTBrZmdWN1B4U1lH?=
 =?utf-8?B?YndNVks2RHI5V3BLYTVGTEpKMkcvd0lDSjFabzNReW5KNmdrcUxheFVYTitx?=
 =?utf-8?B?bnF2UGZ6MmttTzlrMWQzb0JVSTFINjZrMGludHFwOWdKRE16aXJ0TkEwTVVB?=
 =?utf-8?B?eCszWlFaNUkyRGw2TnZOLzZPbUtwQXprQi9aQWE4UERyTTU2Y2puOWExK08r?=
 =?utf-8?B?a3lhd1JuS0t2TWRMb095T0hwWXc4QlJ3M3pQeDY5aFJjNTVsNGRTQ2FROHBW?=
 =?utf-8?B?ZjVGV0poa2cvQ1A1V2Y5ZmFNMlhuSXo5ditjNkR3dkpkM0JEckdlcFZobGFI?=
 =?utf-8?B?cHlwMFp6SkNsK2M0ejNCM3c0RDFNWFdkcTlnTzB0dkREU3E2NDJXNnBKYWpk?=
 =?utf-8?B?ckhzT0tsVzZyK21OajVPMkhYRzFxUWJUOXRLbWpYbUZtTWJOdllvb0RDU0p6?=
 =?utf-8?B?Y3IrU0pINGpHZzVjUXJlYkp4b3JVWWFwdC9aVEpSeko2SnBNWUFCcHBlcm85?=
 =?utf-8?B?eHZoS1VGQ0xVR244QkNsK0ZIK2tURWtRQWhFRVZ3ektuaERseUo5c25wUUlk?=
 =?utf-8?B?WjVmTG1PbDFSbVFmUVFQVnVKNlpENVVLblBSTHZnSkEyU1ZlUVJtYlRhdkdB?=
 =?utf-8?B?dmd4L1FUSGlkaVBVVW5YMTdJaDlna3ZrMWs4RG9jVW9sZFIrMHNzOTcwVDhU?=
 =?utf-8?B?TTBWUnM4NHdxdGxHcHZjR0pkMXhaMnFFcXJrVjBhODBNdm5DUEhCZkNzTExP?=
 =?utf-8?B?bWpwNEhhQUQ3SDZ0Nk1LdUk3V2llK3c5S0FNZkpUai9McWlwUHdBUkRCamVh?=
 =?utf-8?B?emhwMlB2T0N2aG1jeXh5bWZDQ3NLclZKNlY3RzI3WU5qcGtMVGhHTnliSFZ3?=
 =?utf-8?B?NkxhZFFKTTV5Smh3VTNyV3BZdUVCZ28vM29KdzQwTEJlOXArMHFNMk9icXBt?=
 =?utf-8?B?YVI1bC84b3BRV3ZQVkxzcmxjSCtOWHl2M3ZpNU1BazBlak5RRGtEMHc3ZE40?=
 =?utf-8?B?TFB6R0g1WmZUOGJ2TzAzNXdMcXBJeHNSamk3Zjl6NGlQSTd6MTdkVXV4cEl6?=
 =?utf-8?B?TDhEL3Vtd01CRE5BeFRmU2RGUEN2Ym1WSEp0QkNmM1FIU3l1N09vcTFScG9x?=
 =?utf-8?B?ZE55Y3loT3IybXJxeVFwSmFoSnhsWnRNbEFLN2JKNDUxWk5GR08vNjZXNG1Q?=
 =?utf-8?B?K1QxUzA5UTUvU3U3YXAzZnhUN1pJL01ETXAzZmVua3B4VWd1QzduVVd3TXFm?=
 =?utf-8?B?aU9kYzNic2JGSzFnSklOUndzT0Myc1FmbWxnekFoakQzZy8xOWpJWDM3U0JW?=
 =?utf-8?B?dTJsaXJMNnEvWW9nT3BSK3pkcHowYmZ5TGlWcjdodjZDUWxNdFdLbEdVU0RW?=
 =?utf-8?B?V2pqdnYzdEo4OEx1YVpHTkNCMWFud1NFaTNMWmlvc0xXZWlXS3lCaHl2bDIy?=
 =?utf-8?B?dWlYV2NZNzBlN0pkdUpCOU1iU2w1Q2RveWgzalUwckJ2QzRvSEE1WWVic1o2?=
 =?utf-8?B?OE8zT3orR3dLcG1Md0pGaEZ1dFNHNnJvczdPakdFZ3N6N0U1aWE1M011cUFp?=
 =?utf-8?B?YlNXZkRpeVdobkllY2ZiQkZkNkFJZm5Ja2xMZ3YxSnlSL0V2NDFpZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3042.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7914d3b-f1ea-4355-de39-08da4e4a4066
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 21:10:04.1220 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vyKcJ1wdLDmW+CwmFfraEC3DWcfsdtgMebuwZL/tzi2IiRQH4cfzVfhQtCrtN7xwkbNG8wInyN1WnLq3a2uQOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3031
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=eddie.dong@intel.com;
 helo=mga06.intel.com
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleCBXaWxsaWFtc29u
IDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDEs
IDIwMjIgMTE6MDEgQU0NCj4gVG86IERvbmcsIEVkZGllIDxlZGRpZS5kb25nQGludGVsLmNvbT4N
Cj4gQ2M6IFJhbywgTGVpIDxsZWkucmFvQGludGVsLmNvbT47IFRpYW4sIEtldmluIDxrZXZpbi50
aWFuQGludGVsLmNvbT47IFplbmcsDQo+IEphc29uIDxqYXNvbi56ZW5nQGludGVsLmNvbT47IHF1
aW50ZWxhQHJlZGhhdC5jb207IGRnaWxiZXJ0QHJlZGhhdC5jb207DQo+IExpLCBZYWRvbmcgPHlh
ZG9uZy5saUBpbnRlbC5jb20+OyBMaXUsIFlpIEwgPHlpLmwubGl1QGludGVsLmNvbT47IHFlbXUt
DQo+IGRldmVsQG5vbmdudS5vcmcNCj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMDAvMTNdIEFk
ZCBhIHBsdWdpbiB0byBzdXBwb3J0IG91dC1vZi1iYW5kIGxpdmUNCj4gbWlncmF0aW9uIGZvciBW
RklPIHBhc3MtdGhyb3VnaCBkZXZpY2UNCj4gDQo+IE9uIFdlZCwgMSBKdW4gMjAyMiAxNzowOToy
NSArMDAwMA0KPiAiRG9uZywgRWRkaWUiIDxlZGRpZS5kb25nQGludGVsLmNvbT4gd3JvdGU6DQo+
IA0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IFFlbXUtZGV2
ZWwgPHFlbXUtZGV2ZWwtDQo+ID4gPiBib3VuY2VzK2VkZGllLmRvbmc9aW50ZWwuY29tQG5vbmdu
dS5vcmc+IE9uIEJlaGFsZiBPZiBBbGV4DQo+ID4gPiBib3VuY2VzK1dpbGxpYW1zb24NCj4gPiA+
IE9uIFR1ZSwgMjQgTWF5IDIwMjIgMTQ6MTg6MzUgKzA4MDANCj4gPiA+IExlaSBSYW8gPGxlaS5y
YW9AaW50ZWwuY29tPiB3cm90ZToNCj4gPiA+ID4gVGhpcyBwcm9wb3NhbCBhZG9wdHMgYSBwbHVn
aW4gbWVjaGFuaXNtIChhbiBleGFtcGxlIGNhbiBiZSBmb3VuZA0KPiA+ID4gPiBpbg0KPiA+ID4g
PiBbMV0pIGdpdmVuIHRoYXQgSVBVL0RQVSB2ZW5kb3JzIHVzdWFsbHkgaW1wbGVtZW50IHByb3By
aWV0YXJ5DQo+ID4gPiA+IG1pZ3JhdGlvbiBpbnRlcmZhY2VzIHdpdGhvdXQgYSBzdGFuZGFyZC4g
QnV0IHdlIGFyZSBhbHNvIG9wZW4gaWYNCj4gPiA+ID4gYW4gYWx0ZXJuYXRpdmUgb3B0aW9uIG1h
a2VzIGJldHRlciBzZW5zZSwgZS5nLiB2aWEgbG9hZGFibGUNCj4gPiA+ID4gbW9kdWxlcyAod2l0
aCBRZW11IHN1cHBvcnRpbmcgZ1JQQyBvciBKU09OLVJQQyBzdXBwb3J0KSBvciBhbiBJUEMNCj4g
PiA+ID4gbWVjaGFuaXNtIHNpbWlsYXINCj4gPiA+IHRvIHZob3N0LXVzZXIuDQo+ID4gPg0KPiA+
ID4gQUZBSVUsIFFFTVUgaXMgbm90IGludGVyZXN0ZWQgaW4gc3VwcG9ydGluZyBwbHVnaW4gbW9k
dWxlcywNCj4gPiA+IGVzcGVjaWFsbHkgcHJvcHJpZXRhcnkgb25lcy4gIEkgZG9uJ3Qgc2VlIHRo
YXQgYSBjYXNlIGhhcyByZWFsbHkNCj4gPiA+IGJlZW4gbWFkZSB0aGF0IHRoaXMgY2Fubm90IGJl
IGRvbmUgaW4tYmFuZCwgdGhyb3VnaCBhIHZmaW8tcGNpDQo+ID4gPiB2YXJpYW50IGRyaXZlciwg
cG9zc2libHkgbWFraW5nIHVzZSBvZiBwcm9wcmlldGFyeSBpbnRlcmZhY2VzIHRvIGENCj4gPiA+
IHVzZXJzcGFjZSBhZ2VudCBpZiBuZWNlc3NhcnkgKHRob3VnaCBwbGVhc2UgZG9uJ3QgYXNrIHN1
Y2ggdG8gYmUNCj4gPiA+IGFjY2VwdGVkIGluLXRyZWUgZm9yIHRoZSBrZXJuZWwgZWl0aGVyKS4g
IEEgdmZpby0gdXNlciBkZXZpY2Ugc2VydmVyDQo+ID4gPiBtaWdodCBhbHNvIGhvc3Qgc3VjaCBw
cm9wcmlldGFyeSwgZGV2aWNlIHNwZWNpZmljIGFnZW50cyB3aGlsZQ0KPiA+ID4gc3VwcG9ydGlu
ZyB0aGUgc3RhbmRhcmQsIGluLWJhbmQgbWlncmF0aW9uIGludGVyZmFjZS4gIFRoYW5rcywNCj4g
PiA+DQo+ID4NCj4gPiBUaGFua3MgQWxleC4gUmVtb3ZpbmcgcGx1Zy1pbiBtb2R1bGUgaXMgbm90
IGEgcHJvYmxlbS4NCj4gPg0KPiA+IERvIHlvdSBtZWFuIHRvIGltcGxlbWVudCB0aGUgbWlncmF0
aW9uIGFuZCBwcm90b2NvbCBoYW5kbGluZyBpbnNpZGUNCj4gPiBRZW11LWNsaWVudCAocHJvYmFi
bHkgdmZpby1jbGllbnQgYWZ0ZXIgdGhlIFZGSU8tdXNlciBpcyBtZXJnZWQpPyBPcg0KPiA+IHRv
IGJ1aWxkIGFzIHBhcnQgb2YgbGlidmZpby11c2VyPyBXZSBjYW4gYWxzbyBidWlsZCBpdCBhcyBh
IHNlcGFyYXRlDQo+ID4gcHJvY2VzcyBvZiBRZW11LXNlcnZlciBhcyBwYXJ0IG9mIE11bHRpLVBy
b2Nlc3MgUWVtdS4NCj4gDQo+IEFJVUksIHRoZSBRRU1VICJjbGllbnQiIGluIGEgdmZpby11c2Vy
IGNvbmZpZ3VyYXRpb24gaXMgc2ltcGx5IFFFTVUgaXRzZWxmLg0KPiBUaGUgdmZpby11c2VyICJz
ZXJ2ZXIiIHByb3ZpZGVzIHRoZSBhY3R1YWwgZGV2aWNlIGltcGxlbWVudGF0aW9uLCB3aGljaA0K
PiBjb3VsZCBzdXBwb3J0IGRpZmZlcmVudCBsaWNlbnNlIG1vZGVscywgZGVwZW5kaW5nIG9uIHdo
YXQgbGlicmFyaWVzIG9yDQo+IGV4aXN0aW5nIGNvZGUgaXMgaW5jb3Jwb3JhdGVkIHRvIGltcGxl
bWVudCB0aGF0IHNlcnZlci4gIFRoZSBRRU1VIHJlbW90ZQ0KPiBtYWNoaW5lIHR5cGUgaXMgc2lt
cGx5IGEgUUVNVS1iYXNlZCBpbXBsZW1lbnRhdGlvbiBvZiBhIHZmaW8tdXNlciBzZXJ2ZXIuDQo+
IFRoZSB2ZmlvLXVzZXIgc2VydmVyIGlzIGFuYWxvZ291cyB0byBhIHZmaW8tcGNpIHZhcmlhbnQg
ZHJpdmVyIGluIHRoZQ0KPiBrZXJuZWwvaW9jdGwgaW50ZXJmYWNlIG1vZGVsLiAgVGhlIHZmaW8t
dXNlciBjbGllbnQgc2hvdWxkIGJlIGRldmljZSBhZ25vc3RpYywNCj4gcG9zc2libHkgd2l0aCBz
aW1pbGFyIGV4Y2VwdGlvbnMgd2UgaGF2ZSB0b2RheSB2aWEgZGV2aWNlIHNwZWNpZmljIHF1aXJr
DQo+IGhhbmRsaW5nIGZvciB0aGUgdmZpbyBrZXJuZWwgaW50ZXJmYWNlLg0KPiANCj4gPiBJbiBo
ZXJlLCB0aGUgcHJvdG9jb2wgYmV0d2VlbiBob3N0IENQVSBhbmQgU29DIGlzIGJhc2VkIG9uIGdS
UEMsIHdoaWNoDQo+ID4gc3VwcG9ydCBSdXN0IGNvZGUgaW4gY2xpZW50IChIb3N0IENQVSBzaWRl
IGhlcmUpIG1vcmUgdGhhbiBDL0MrKy4gRG8NCj4gPiB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbiB0
byBiZXR0ZXIgc3VwcG9ydCBSdXN0IGNvZGUgd2l0aCBRZW11IEMvQysrDQo+ID4gY29kZT8NCj4g
DQo+IEknbSBub3QgcXVhbGlmaWVkIHRvIHByb3ZpZGUgc3VnZ2VzdGlvbnMgcmVnYXJkaW5nIFJ1
c3QgY29kZSBpbnRlZ3JhdGlvbiB3aXRoDQo+IFFFTVUsIGJ1dCBJIHRoaW5rIHRoYXQncyBvbmx5
IHJlcXVpcmVkIGlmIHRoZSBkZXZpY2Ugc3BlY2lmaWMgbWlncmF0aW9uDQo+IHN1cHBvcnQgaXMg
b24gdGhlICJjbGllbnQiLiAgQXMgYWJvdmUsIEkgZG9uJ3QgdGhpbmsgdGhhdCdzIHRoZSBjb3Jy
ZWN0IG1vZGVsLA0KPiB0aGUgdmZpbyBtaWdyYXRpb24gcHJvdG9jb2wgaXMgbWVhbnQgdG8gc3Vw
cG9ydCBhbnkgZGV2aWNlIHNwZWNpZmljDQo+IHJlcXVpcmVtZW50cyBvbiB0aGUgZGV2aWNlIGVu
ZCBvZiB0aGUgY29ubmVjdGlvbiwgaWUuIHRoZSAic2VydmVyIiBlbmQgZm9yDQo+IHZmaW8tdXNl
ciwgd2hpY2ggY2FuIGJlIGFuIGVudGlyZWx5IHNlcGFyYXRlLCBub24tUUVNVSBiYXNlZCBwcm9j
ZXNzLiAgSQ0KPiB0aGluayB0aGVyZSBhcmUgYWxzbyB3YXlzIHRvIHdyaXRlIGtlcm5lbCBkcml2
ZXJzIGluIFJ1c3QsIHNvIHBvc3NpYmx5IGEga2VybmVsDQo+IGludGVyZmFjZSB2ZmlvLXBjaSB2
YXJpYW50IGRyaXZlciBjb3VsZCBhbHNvIHdvcmsuICBUaGFua3MsDQo+IA0KDQoNCkFsZXg6DQoJ
VGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uIFllcywgYWdyZWUgUWVtdSAoY2xpZW50KSBpcywg
YnkgbmF0dXJlLCBuZXV0cmFsIHRvIHBoeXNpY2FsIGRldmljZSBrbm93bGVkZ2UuDQoJV2l0aCBt
b3JlIHRoaW5raW5nLCBpdCBzZWVtcyB0aGF0Og0KCTE6IFNvbHV0aW9uIHRvIGhhdmUgYSBzZXBh
cmF0ZSBrZXJuZWwgZHJpdmVyOiAgIA0KCQlUaGUgd2F5IHRoZSBob3N0IENQVSB0YWxraW5nIHdp
dGggdGhlIFNvQyBjaGlwIG9mIHRoZSBkZXZpY2UgaXMgZ29pbmcgdGhydSBUQ1AvSVAgbmV0d29y
aywgcGx1cyBoaWdoIGxldmVsIHByb3RvY29sIChnUlBDIG9yIEpzb24uLikuIFRoaXMgaXMgZ29p
bmcgdG8gYmUgdmVyeSBjb21wbGljYXRlZCBhbmQgbWlnaHQgYmUgaGFyZCB0byBiZSBhY2NlcHRl
ZCBieSBjb21tdW5pdHkuDQoNCgkyOiBJbXBsZW1lbnQgYXMgYSBmdWxsIHFlbXUtc2VydmVyIGRl
dmljZSBtb2RlbC4NCgkJVGhpcyB3YXkgd29ya3MgaWYgd2UgaW1wbGVtZW50IGEgZnVsbCBkZXZp
Y2UgbW9kZWwgaW4gdmZpby11c2VyLCBidXQgZ2l2ZW4gdGhhdCB0aGUgZGV2aWNlIChOVk1FIGZv
ciBub3cpIHdvcmtzIGluIFZGSU8gcGFzc3RocnUgbW9kZSBmb3IgcGVyZm9ybWFuY2UsIHRoZSBp
c3N1ZSBLZXZpbiBUaWFuIHJhaXNlZCBpbiBhbm90aGVyIGVtYWlsIGlzIGEgcmVhbCBjb25jZXJu
IHRvby4NCg0KCTM6IEltcGxlbWVudCBwYXJ0aWFsIChvciBzdXBwbGVtZW50YWwpIGZlYXR1cmUg
aW4gUWVtdS1zZXJ2ZXIgZGV2aWNlIG1vZGVsLg0KCQlUaGlzIHNvbHV0aW9uIGRlZmluZXMgYSBR
ZW11L1ZGSU8gbWlncmF0aW9uIGludGVyZmFjZSBiZXR3ZWVuIHRoZSBjbGllbnQgYW5kIHNlcnZl
ciBmb3IgbWlncmF0aW9uLiAgQ2xpZW50IG1pZ3JhdGlvbi1wcm94eSB1c2VzIGhhcmR3YXJlIHRy
YW5zcGFyZW50IGludGVyZmFjZSB0byB0YWxrIHdpdGggdGhlIHJlbW90ZS1taWdyYXRpb24gc2Vy
dmVyLiBUaGUgcmVtb3RlIHNlcnZlciBtYXkgbWFuYWdlIGRldmljZS1zcGVjaWZpYyAocHJvdG9j
b2wgc3BlY2lmaWMgdG8gYmUgbW9yZSBwcmVjaXNlbHkpIGNvbXBvbmVudHMgdG8gdGFsayB3aXRo
IGRpZmZlcmVudCBoYXJkd2FyZSBiYWNrZW5kLiBJbiB0aGlzIGNhc2UsIHdlIHJlbHkgb24gdG9k
YXkncyBWRklPIG1vZHVsZSB0byBtYW5hZ2UgdGhlIGRldmljZSBhbmQgbWFuaXB1bGF0ZSB0aGUg
ZGV2aWNlIHRocnUga2VybmVsIGRyaXZlci4gRHVyaW5nIG1pZ3JhdGlvbiwgaXQgd2lsbCB1c2Ug
dGhlIG1pZ3JhdGlvbi1wcm94eSB0byBnZXQvc2V0IHN0YXRlIGV0Yy4uLiAgIA0KCQlVc2VycyBj
YW4gY29uZmlndXJlIHRoZSBhZGRpdGlvbmFsIFFlbXUgY29tbWFuZCBsaW5lIHBhcmFtZXRlciB0
byBjaG9vc2UgYSByZW1vdGUgbWlncmF0aW9uLXByb3h5IGZvciBhIFZGSU8gZGV2aWNlLiANCg0K
DQoJQ2FuIHlvdSBzdWdnZXN0Pw0KDQpUaHggRWRkaWUNCg0K

