Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20C26D95F5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 13:39:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkNrX-0007W2-Or; Thu, 06 Apr 2023 07:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kai.huang@intel.com>)
 id 1pkNrW-0007Vh-22
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 07:33:06 -0400
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kai.huang@intel.com>)
 id 1pkNrS-0005Hs-Ul
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 07:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680780782; x=1712316782;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=SCadNGBjBvzdxYyL1Ppf4OyolQBBSpXEiwDXIIaycyw=;
 b=Z6E8m58t8US7MIOK7u/LRq2HSyLr083OhgyLpZUjWKN7zHJF/vOuHWRm
 zS8jOoZkJD/UJv0W9DfNTO/9U+qMHmWV7vtB9M0VCRSMMTXp8LhUFM6Ru
 Iy+yzPIixGnqh5izgXkfXO4adKBxUF183LX2AVmjxW8diRqhxilgBZZOy
 CEdZ10tlNqooEx6E+7AvM8jmWb4V/DP2k5/VjWGivxuH9vthuoNnu0wDD
 SNewCpb9Qnucmnq3giX5J5sNWjWo4zQqvVmjTtTQnRwr11CxuZIemdQer
 DvBkdcfcrTo0SmCbhhfS5kLSOxsgP8sycbfSOG75ckzilyKOlQDQD9Kla A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322362854"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="322362854"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 04:32:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="751611047"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="751611047"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 06 Apr 2023 04:32:52 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 04:32:52 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 04:32:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 04:32:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 04:32:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRHKgwso3DhA+I1TfsI3zxQecfm5hz496ZZfvWRt7nBogZ52nn4QBuU4uWOF4DirVQ6ymyVC92+FPyL9rKr3SQMfW+gXhWRnTXsEdCN5OlVASYZ3j22VG99z9HpqAhvVrL3/Q9YLZTv3C78GnvvIXHYdCG/1+XzDExsfB899meOD669erzkVz9vW4130ZKl8qxlD7g+GXvs55ihuK2jhhu/6lkfn+d7PJEF1E6u4hXw8z21KjufCHl/ZlTyA/srBp6Tb1Pwvtq/f6eQBHKXiSckMXCdPncn8O+r3dU6sQVe3eZxZmK5ZEaP0ElOq4wfDMwHIzW24MWzB5oa5WbS6sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCadNGBjBvzdxYyL1Ppf4OyolQBBSpXEiwDXIIaycyw=;
 b=PhjndsP1VFbbwhlBTp2b2Rccv2csjR7mIjqK8EjGAJiKgXE7nQ+Z+hIgqC4UtE667HYv5StcF44gAcYUK8FM4MRQQ094HKAadQdOKzyjBC8WiGuNuswIHwh8TgzegxAphsdOBoYvyj2/5I08XWo3UfDtlBG9iQ7WMNq6AVE1MzTPqaCT1kBKi3tR9yderkonhcZSyX1rT0RG+Zj+z6nIEY2q3Bi1N8vBzB2A+iAVnF+4SPX8k1G6eysoFJCaz912il1Jt9cA9lV0fw6qhAZUpztPghUDRwaV+WqS5eUZNnEkNqv9pdms45ELsoxYuEBv7hkNdhohWYidkxrTGniSSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by MW3PR11MB4651.namprd11.prod.outlook.com (2603:10b6:303:2c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 11:32:49 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::f403:a0a2:e468:c1e9]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::f403:a0a2:e468:c1e9%5]) with mapi id 15.20.6254.033; Thu, 6 Apr 2023
 11:32:49 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "pbonzini@redhat.com" <pbonzini@redhat.com>, "yang.zhong@linux.intel.com"
 <yang.zhong@linux.intel.com>
CC: "christian.ehrhardt@canonical.com" <christian.ehrhardt@canonical.com>,
 "Yang, Weijiang" <weijiang.yang@intel.com>, "Christopherson,, Sean"
 <seanjc@google.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3] target/i386: Change wrong XFRM value
Thread-Topic: [PATCH v3] target/i386: Change wrong XFRM value
Thread-Index: AQHZaFLEn59PUZj92kWq2tWWgOGlLq8eJl8A
Date: Thu, 6 Apr 2023 11:32:49 +0000
Message-ID: <813b7d9269ae8b4df14dd122b0d3708a04a82931.camel@intel.com>
References: <20230406064041.420039-1-yang.zhong@linux.intel.com>
In-Reply-To: <20230406064041.420039-1-yang.zhong@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|MW3PR11MB4651:EE_
x-ms-office365-filtering-correlation-id: e46d9432-b0e0-4eca-6add-08db3692a6dc
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mwtp7XBuoCyD1AfJHQukRiQIwzKOb4Wl69ZKMtC1u9z4o1VYUPEwgoMtZL1VvNOn68toLMeFYn7HuKJa61uw08BgbD2XdnQflXPjE4Ze5yAIX7xVZE3RcvHJgGecGFn2mS2KmlgVXmY/HzZTHHVgt1kGQKc270Yio8So/oc/zHCfP5zBlJa1MIn5hHFBxIyXMWA9lK2M9Wchnusc/DsNqwTkvm64lE0W1OK5JndAc5Z3x6d9N0EV1VDHRTpxvDGQv/av1oo38LZOec9l47/7azNpm+OElDHFY6QjnOVrU73x+B7XaxyoK9zi8bKSr/Dl1QKRiX2hdJWUKILb5Xbl4efcY1QHg8v8GxhZkxMN6o9JjFjx0H8b6NNW+U1RRV53xGJjt3lS4MLVxKS8kBdWPorZaRQ8HrV1f5bTP/1AnmANyjdF0agqHcI8KzunDFp8ONRRGc+YLAyLx61jv5lzYhAkrVNQ9l4nnhEy1iDg4g8q5kWqhGhGm3l7tuvqNWIZ1C/+iVasAi5RWoOtXkmkeyigDkZJVD+4paUpjHrlBV9OP4a0JUlY19+VO1ZtH6xqlmUNTacTJUxoNEzpoN408+mnlyHIAOm0DMgwpvQTddzuMbi52QyAuuiENubvF2q4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5978.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199021)(122000001)(2906002)(8936002)(8676002)(66946007)(71200400001)(83380400001)(478600001)(110136005)(54906003)(316002)(66556008)(66476007)(91956017)(76116006)(66446008)(86362001)(6512007)(186003)(26005)(36756003)(6506007)(6486002)(5660300002)(38070700005)(41300700001)(64756008)(4326008)(2616005)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDQxZU5tUytKWWQzeWNDeGdTZGVXOWJmTlJtVzRMVG9wRXF2Y1Q0RERaSmF2?=
 =?utf-8?B?N3JFam4vTThzVm5GcnFqaFZyNUNwa25pdVRBaW9FWXhsVEJZRUxIZGxFR2wz?=
 =?utf-8?B?NkZzYXhmWFBTa3RVZHJpclVia3RISXEzcUdGRk12aW96UzBMNWU2WUJhVkE2?=
 =?utf-8?B?YXBuWEg2VGhiRGRJbUI0MGMyWkpkcDJENUVCZEE3d0hjSWJLWWphdUUzTEZE?=
 =?utf-8?B?Tkcrekw1ZGplMWswSDM0NXliTldDOERHNkVvR1JTbnVaUUkwRkZ2QmFRNHVB?=
 =?utf-8?B?SnF6eXZrS0xTRGxTQmVDUmh6T1NqYWxLYjFQY2hFU2wyRnZEMFJGejNSL3da?=
 =?utf-8?B?bkRFM2trU2Q2UkxsTkNXQmNjWXpYQ1hOR3hLWCtWUFlwY2dzNGtlOWNaVWdv?=
 =?utf-8?B?S0lhY25RaDFxWmcyMnNmMmQ3cFhrdjl0aWdoTWdPUkh0cGJlVGxzdWRsZmRt?=
 =?utf-8?B?cWF5K1pEcEUxNFR0WU10MmdsdW5tU0EweE45VGJJY0I3UldRYURGdWdJRCtp?=
 =?utf-8?B?K1lNK3I0akNTU0s0dlNpRGFjbU5mTEl3TllZaDVHWGxwenhWN0dZV2ZtYkd4?=
 =?utf-8?B?WTlyRHgreEdXeFl5T2NILy91d0RUT0ZRS2htU1dqTU5XUGdwMjJJcWtSRHpT?=
 =?utf-8?B?UnByWGQ2dE84QnpTSHFKM0l0amRTSndQMFQwMDIwUUdLVlJsZXhGd2RKdEt3?=
 =?utf-8?B?dVBsT3Zib2VNb2ZRNW1NaW9iY3ZIY2FvT0dMUzc0cXRYbXRVRllQQU1kWG1y?=
 =?utf-8?B?OEdMQnZKYU55NjNIR3EwdFlXZEdFMmsyRXJLYzBoRkkzTFhXMWRhb2trOEMw?=
 =?utf-8?B?TExyVnlnQzlNdWZhd2NvYlJXR3RCNjkzZUxWSDMzNWY0dTUvMXVBOGJXTEFa?=
 =?utf-8?B?OTlWM094c1YyQ0NZRDFISjFNNXdVZ084SGU5QktLZUVYMkxxbTRmbUI4dXFD?=
 =?utf-8?B?dTcvd203ZWF6L1ZGb2dUaGYzYXRPekdBc04zajIvOVBOVjk1UlA5L0FuRmcv?=
 =?utf-8?B?ZnM3OEttNzV6Q1ZVM0xVOTNscFR2WkNwOEI1V3c2OUhlbDZVTW5mMkQ5bkh5?=
 =?utf-8?B?RHdrYkVKTXlnV25UQlhCczZySVNFOUYwVkJING92ZlVncnRHc0lXM2QrMm9Q?=
 =?utf-8?B?M2ZKbE1OdVFMNDFvZmN5YnpNNmUzL3IydVlPU3NiQTFDQmNTaEIxRXhlOWgr?=
 =?utf-8?B?VjBEMGhJTWMyN1lGbi9qR1Z5Q3NRQlpBVFNSRVRhSkhjeXZSYmZQV3QvUGE1?=
 =?utf-8?B?Vjhza3NTNVR3NkpuTE5ET2hNcW9DakQ3aldCc1lCNkZtUWFyZ2dLN1liUkVM?=
 =?utf-8?B?NUFqRStTWHRvZXlQWlpGL3czeUhjM1gzcXVGVVoxaFU5UkFEanVDNEpMQlNL?=
 =?utf-8?B?dExUVXFJd3dwVUw1WHZIQXJBQy9vaVd3dFliYkpSTStJUGV5emZNNERPTmF3?=
 =?utf-8?B?Q0JwVGlIOERGRXJ0OExLR3YxNW01dmNhMEw1TjFuVHIwMzBCNi9NNmMzN3Bm?=
 =?utf-8?B?RXlKaTIwVHhKek51RCtWeDlZaGNsQ1Q2UXhxUnU5NU5DSGZhTmE4Vnp0VEMr?=
 =?utf-8?B?TG8zSVdZRythcFVZeUF0SStOVWNSV3ZYbkdJejlWS0tjLzZwczhKckd6RHNG?=
 =?utf-8?B?emZsRytPc3ZBYWxhTjkrM2JFeHgxbW40M1A0c3VEUzNranpWZWt6Q0Rkd2Qy?=
 =?utf-8?B?bFEwQVMwdnFQTEhwaVpERG8zTE1BZldwRzdvRE1WRVluYTZ4S2RMUDVGTzg2?=
 =?utf-8?B?WDNaSzJsN3VQMXo4Z0VFcWpJZHZSeDdGZ3dxaG9RSm9LUU5qanFmdHcrQmhj?=
 =?utf-8?B?OFM0cTVNK3pEV2l4Wkd1U1RJaXBtSi9kdEZjQm5NRWtDOUJkT1hDb2ZDVHZz?=
 =?utf-8?B?QXdGTncydWNWNUJWZkhvUm9MWGVvRi9PM3ZHN293NGZ2eEpxRVk5LzZMek1F?=
 =?utf-8?B?bzRuWW1oN29CVUlyQjhNYkpWRnh6WFpCU1BwVk1WNXp5bnZyZEUrVUMzT280?=
 =?utf-8?B?eEYzUU9qcW5hZUV4Z0RGM25vU09KdGdXTTJQQ3hPdEMyVTZITEs3M0FYRW1V?=
 =?utf-8?B?bmRPVHBMbGl1dENvR3B5UFBXT3lLc28xeGI2bzFNUUp3Z2FpMTNGdXR5bklm?=
 =?utf-8?Q?SNOGae1OdHYwEYrUayABchGQJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3042A689C5A8E94195EED9BDA3FA3DC6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e46d9432-b0e0-4eca-6add-08db3692a6dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2023 11:32:49.5207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aMHHlPn0I84fBY0KTGJKFlydu4qYavgXNt+lOkev6yRo/Fe8pDnSij2b6cSV3hIUqayZxosdD6uuuBpIsY3i2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4651
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136; envelope-from=kai.huang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

T24gVGh1LCAyMDIzLTA0LTA2IGF0IDAyOjQwIC0wNDAwLCBZYW5nIFpob25nIHdyb3RlOg0KPiBU
aGUgcHJldmlvdXMgcGF0Y2ggd3JvbmdseSByZXBsYWNlZCBGRUFUX1hTQVZFX1hDUjBfe0xPfEhJ
fSB3aXRoDQo+IEZFQVRfWFNBVkVfWFNTX3tMT3xISX0gaW4gQ1BVSUQoRUFYPTEyLEVDWD0xKTp7
RUNYLEVEWH0sIHdoaWNoIG1hZGUNCj4gU0dYIGVuY2xhdmUgb25seSBzdXBwb3J0ZWQgU1NFIGFu
ZCB4ODcgZmVhdHVyZSh4ZnJtPTB4MykuDQoNCkkgZG9uJ3QgcGFydGljdWxhcmx5IGxpa2UgdGhl
IHNlbnRlbmNlJ3Mgc2Vjb25kIGhhbGYsIGFuZCBsb29rcyBpdCdzIGJldHRlciB0bw0KYWxzbyBj
YWxsIG91dCAid3JvbmcgWEZSTSB2YWx1ZSBpbiBTR1ggQ1BVSUQgbGVhZiIgaW4gdGhlIHBhdGNo
IHRpdGxlLiDCoA0KDQpBbnl3YXkgLi4uDQoNCj4gDQo+IEZpeGVzOiAzMDFlOTA2NzVjM2YgKCJ0
YXJnZXQvaTM4NjogRW5hYmxlIHN1cHBvcnQgZm9yIFhTQVZFUyBiYXNlZCBmZWF0dXJlcyIpDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBZYW5nIFpob25nIDx5YW5nLnpob25nQGxpbnV4LmludGVsLmNv
bT4NCj4gUmV2aWV3ZWQtYnk6wqBZYW5nIFdlaWppYW5nIDx3ZWlqaWFuZy55YW5nQGludGVsLmNv
bT4NCg0KLi4uDQoNClJldmlld2VkLWJ5OiBLYWkgSHVhbmcgPGthaS5odWFuZ0BpbnRlbC5jb20+
DQoNCj4gLS0tDQo+ICB0YXJnZXQvaTM4Ni9jcHUuYyB8IDQgKystLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90
YXJnZXQvaTM4Ni9jcHUuYyBiL3RhcmdldC9pMzg2L2NwdS5jDQo+IGluZGV4IDY1NzYyODdlNWIu
LmYwODNmZjQzMzUgMTAwNjQ0DQo+IC0tLSBhL3RhcmdldC9pMzg2L2NwdS5jDQo+ICsrKyBiL3Rh
cmdldC9pMzg2L2NwdS5jDQo+IEBAIC01NzE4LDggKzU3MTgsOCBAQCB2b2lkIGNwdV94ODZfY3B1
aWQoQ1BVWDg2U3RhdGUgKmVudiwgdWludDMyX3QgaW5kZXgsIHVpbnQzMl90IGNvdW50LA0KPiAg
ICAgICAgICB9IGVsc2Ugew0KPiAgICAgICAgICAgICAgKmVheCAmPSBlbnYtPmZlYXR1cmVzW0ZF
QVRfU0dYXzEyXzFfRUFYXTsNCj4gICAgICAgICAgICAgICplYnggJj0gMDsgLyogZWJ4IHJlc2Vy
dmUgKi8NCj4gLSAgICAgICAgICAgICplY3ggJj0gZW52LT5mZWF0dXJlc1tGRUFUX1hTQVZFX1hT
U19MT107DQo+IC0gICAgICAgICAgICAqZWR4ICY9IGVudi0+ZmVhdHVyZXNbRkVBVF9YU0FWRV9Y
U1NfSEldOw0KPiArICAgICAgICAgICAgKmVjeCAmPSBlbnYtPmZlYXR1cmVzW0ZFQVRfWFNBVkVf
WENSMF9MT107DQo+ICsgICAgICAgICAgICAqZWR4ICY9IGVudi0+ZmVhdHVyZXNbRkVBVF9YU0FW
RV9YQ1IwX0hJXTsNCj4gIA0KPiAgICAgICAgICAgICAgLyogRlAgYW5kIFNTRSBhcmUgYWx3YXlz
IGFsbG93ZWQgcmVnYXJkbGVzcyBvZiBYU0FWRS9YQ1IwLiAqLw0KPiAgICAgICAgICAgICAgKmVj
eCB8PSBYU1RBVEVfRlBfTUFTSyB8IFhTVEFURV9TU0VfTUFTSzsNCg0K

