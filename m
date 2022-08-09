Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B7B58D235
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 05:02:21 +0200 (CEST)
Received: from localhost ([::1]:44180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLFVc-0003lm-Vj
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 23:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oLFTK-00024S-NN
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 22:59:58 -0400
Received: from mga17.intel.com ([192.55.52.151]:57732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oLFTH-0002i6-RE
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 22:59:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660013995; x=1691549995;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ARe4hErKP1m7u+aBky+qsxKmzY7JoJfxwEH/nQXxlxg=;
 b=NE5qeLoBbsViTGx2KSGPy0+VjYvmD4onR0iOW0eUVA+WKarLxlzHMVOM
 YQhjRWUNYPR/ocTiO4RG4/rtqKV9Y/4f17AIbvSZPv5kxp+q+Ucap5PWz
 sFuTqXisvI3zX3QFBcPMPlkzZzJDaTUIWsNysZL7DYJyQL7k9957OQSeJ
 bs7qopzpDrbXKe+4vhGYlqoqATq+FODCgXo2Xu2q+LSOFOyyGb4bs8ziK
 ECrIH1xvd7B2oy7EmGof65FoypY2AKee7rB+D12tl8gMSzLL+5hsFiAaj
 QuybzH5Z71/NsQdlLXucfmA22SMtvnjm6ndVFSBLEBn1cViBkJXtE8HRH Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="271126751"
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; d="scan'208";a="271126751"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 19:59:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; d="scan'208";a="850311924"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 08 Aug 2022 19:59:47 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 8 Aug 2022 19:59:47 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 8 Aug 2022 19:59:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 8 Aug 2022 19:59:44 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 8 Aug 2022 19:59:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdWAMIBoCvTcGmuGhxupM8PsaCUVzzu6tabP3V6uRzCgjrUwiws775T0VK5eRaPoz3LJUDnMSCkTDwJm0ZYLoa4a+w8qy4QKDbwlH/yboT1WHbE+eFUTbcYSpwF0KJ3bLdX6S3hH8AM8c/yWDwvDnKdzOSMegNzHCh0WTXdjW6YfTHXPQJP0nQJAMBqirz9YJiy3x/YCx1Y8TyRXXYEhNJqSfGnADCdmRbPqDOQnGJUfFzRvs693p48QWnfHWm+LjHeHGZuSftzDBV55TKzlVLw9qqfRVPXlgEzEUOYNYvX9eC+t9sy58NGkl8ysO2gzPiFQU4SPTOxE85UjSsfdlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARe4hErKP1m7u+aBky+qsxKmzY7JoJfxwEH/nQXxlxg=;
 b=h0Fb5mJeJhfQ/GdCyfheyNqwJUDjXfI7oqfMkLOuTa9WfCi1MYz9KFfVMlWiGXfzywxbtwPwHUsVKziT6lMJqsavdCae52cJTbwheMqzCbt/H713PqB/MUuN+ZVd1Se364cb+9wSN8/hGHElgFBv+ejQGSeBYJZV6wV8hxqOKXFGckexyhwJQl16a14zb+MA67lsub0dEsLvk6u00QEj2rC68cJNpDAnmBbW9YhY+VO34bOYIvI/deQ7wvm+cvO2H5IuaVJ/RIYw4NxVvVuMXdNkv2/UikyOXW3zFPiw9YhODMaOQXn+gMEABmkVGfSvJmM3p4sDVRvjygxZRDQgyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by DM6PR11MB4458.namprd11.prod.outlook.com (2603:10b6:5:14f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Tue, 9 Aug
 2022 02:59:42 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee%7]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 02:59:42 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: Jason Wang <jasowang@redhat.com>, Li Zhijian <lizhijian@fujitsu.com>,
 qemu-dev <qemu-devel@nongnu.org>
Subject: RE: [PATCH V2] net/colo.c: Fix the pointer issuse reported by
 Coverity.
Thread-Topic: [PATCH V2] net/colo.c: Fix the pointer issuse reported by
 Coverity.
Thread-Index: AQHYqLEld+dIpYIOF0qaMjum4GGSLK2gEfEAgAXTkVA=
Date: Tue, 9 Aug 2022 02:59:41 +0000
Message-ID: <MWHPR11MB00313088C02D645B2DCFD5379B629@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220805093813.119839-1-chen.zhang@intel.com>
 <CAFEAcA-xwDEX2EMC1DUP0vBvx_sGLvT5zAN2FnDi0DWwOSWWUg@mail.gmail.com>
In-Reply-To: <CAFEAcA-xwDEX2EMC1DUP0vBvx_sGLvT5zAN2FnDi0DWwOSWWUg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3154fd4b-51ae-4b0b-1f54-08da79b334e2
x-ms-traffictypediagnostic: DM6PR11MB4458:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 46hbAbxXJhdkdZXVabAVFG+yVFBrTqpZIaVHOhtrzYoxEo2B3beyHWk8yzpMWIhviKXXDysK6iKiiwnzGM4NXA6MN5cMTfoUsuqJmBZqZ/Y8a5tM1DxRg2QSOoWnyaJ6oJa+p9Phphyz0D3tPmf8z50ETVHqRPrU3uu0lPsPKFN1WsWImNcojSu/y20ESxKAHK+2imJHDC28yrJS+XmuYRnY43FhLZ3IzAlEelYWTTrPofr3t6XWzY20Zp9fftOrMHRHJ5MfRniuag162aymhRixPX9s+N1DAo/vNvuoIZgGS/GTX1ydNiW8Ms7OX8co8qcZOkW1jzzKQsnHl2NrsRnhQF2QYEIqPgZ5NEw99aZG01+yTzmvVz8TrDSgFG8rO0RCandVNwmt10cWsUcnp5hvIRJOiEgeAyHF9fVcuI8NlFcvfU3VCVm8nPMbpSy5HY8CXvZnu1PsvIH/v7nvEsB6J+ybtyzkBiNMJ3MnXgp7CCaHXudugIoKDwNeU5OffQME9erowgfm143JJxGebPxTDjeCx5mJDEo86bFgvYhoqaR2e92/wfL4xdq/UJd6WoVFVtvWujUemf7Ms7DenCqdK9IeYTs3E11BYHB1FFhMVfc9OVoApHhIgBPSAZtinONnAnXmfRrDSjao8LnT/l04ptp7llxWZ9Hae7V1YQ0WCV7L38U13wcimIklle1PhAUVKzVBXDleT62N4G6S4XSem4sW+NBcrQZvoCLaOlfTIPTMSG8iRk/ajfHhEO7d0dns/URpjq+LcPFe+IPFReaSROcTD7lh9HvRvWE+Twbny6TG16O6tmr7CUjU/5An
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(39860400002)(346002)(396003)(366004)(376002)(5660300002)(52536014)(2906002)(76116006)(66946007)(33656002)(71200400001)(55016003)(316002)(478600001)(54906003)(8936002)(6916009)(122000001)(38100700002)(82960400001)(38070700005)(86362001)(41300700001)(26005)(53546011)(6506007)(7696005)(9686003)(4326008)(66556008)(66476007)(64756008)(8676002)(66446008)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkN4alNvZDZIMEFNOEVNYTZ0VFViRThUVXU1eFJOcTBaT3MvNnprd1VQZFBr?=
 =?utf-8?B?eURnd3NTd2ZFcEdqaTFFek93OWJZdXczZG8wYmw0eG1aNmRsTGxRRVZTdVh6?=
 =?utf-8?B?NDN1ZlorZDRwdFFzSEtUeWRwYzJzeHJEK21MUllBMHB1Nk5rR24wOTVVTkVV?=
 =?utf-8?B?aFdIbWgwRkVnQUNHVHFyS3dVRVJsVHJrZFlEQXFCVEY3cEU3SGxnb0JiY3Jr?=
 =?utf-8?B?cHhQWk91cHNMNHJmcHRZMHRwcE00b0xuQUlESjAzeDFubEdFWUtLcW4xVE1S?=
 =?utf-8?B?bkFDZU5hRVZNSk1LOXVMVjh0Vml3WDdELzhWMWVQSEJoVEMrTURPZ0YwWEdG?=
 =?utf-8?B?eUVMS0VwaS9COUUxZHM5T2xEci9Ma3hTUzR1U0JnclFFd0tMbzQ0UFZVSWRq?=
 =?utf-8?B?SWMrVTRwamJ1U05HYitNTm1mV2pEOEkwU2xtNk9BOVFrUEdCeW1EaVRNL1NZ?=
 =?utf-8?B?NHMyRHo5bkliSll4RlRFdDVicDB6bnBjQnluVlhyN0dQLzBDNkRldW1LVU9z?=
 =?utf-8?B?R1VYMk0yMHBRcjRDOTFySEpTaTBod1oyMkpVYWdraUdGYjJyZkhobzc0NUlS?=
 =?utf-8?B?QUJzdm5hY3U5Nm0xSVh1Q0VHWTdoV3lGZDBIS0RPVnRPbDRuSTJtM2RnRFVU?=
 =?utf-8?B?YjQyVExFaWxrN2pmTlF1OWM2eHFSVkhXQjBTWHZjMmkraWl1Zy9zOFZ5cnd0?=
 =?utf-8?B?UW1qUWhlemo3TkhtYzluanpWM0lRU2FlRkhhZmVsRldyOWxaMHNXYWliSVNo?=
 =?utf-8?B?a1Z2czM3WlJNTXphQ0lBSDlwTHFNRXpVbWlCNmRIU3BVZ0VLYWlxcjNHUFVD?=
 =?utf-8?B?TjdlVVB6cUV3eFBicEpxYzdDcm4xN0diclNUOUFaQ08yNVFWckcra3A2VU15?=
 =?utf-8?B?N3ZUcWFTWkowQ1crNXIzTlg1UVVJMGlRYWtmTGloQjRzaWpkL0kwb0JSWFNs?=
 =?utf-8?B?c2xmcnErVEI5NTNSUjBkN0pYSjJmTEV3WGVYVUJWbmdjNEE5eS9hM3NPU1U5?=
 =?utf-8?B?Y0JpYlJsd0RzREFHUDZNenJxMzkzNlZrZkFNZk16aWQ4NVdWbGVMQXF4MGNT?=
 =?utf-8?B?MEc3c2VPbjBzcUVKVGhBcXNhU1plUVZ5bm05ODFZVFRQenBPVU96Y1VkQ2pN?=
 =?utf-8?B?OUpnR2hYTWNNK0gyS3FTYWwzUWZ6U3VjcUZZcE92a0xUZUJBN09LUjBGbXhu?=
 =?utf-8?B?YkgxUUc0T2lXRThjYUYxM1Iyc3VxVWdhOENUVmx3Ylk4czBzTE1RanRwWEZu?=
 =?utf-8?B?Skh3L2RIM0p0SDh2Vm1FcTE1bUllTjBmaUZFWWhWM0YzOHpVdklKNUFESFdW?=
 =?utf-8?B?Y3BEZ1Q5S3JuTTRyWFQzc3VsMjl4RmRSZmd2U3RZbVRkNnpmU3NRLzdVR3FD?=
 =?utf-8?B?VWtlQmJQc1dHM2xqTmh6UXhoYjVIRmo0RGJkQXoxNGRvVHg2WE5EZHhvR0RQ?=
 =?utf-8?B?Umg5RU9GcmFPR0tTMFZyRExUMVduOExlcG11emx5WHlsSVJUR1NabDJqUVVN?=
 =?utf-8?B?RjhkczU1dEgyc2FwNTNZb3huZ3JRQkQ2QjVrc3B0eUd6S0xKWVdzK3VVRy9K?=
 =?utf-8?B?SFhpbm03T1dtWVhmVUlWQ2p1ODBWQ3lVQ3JJT2F4TjBMNWhkeEpoaTFnS1Ez?=
 =?utf-8?B?WUowcUhDajgvUlZyOC9OcDJXTnc3RlF5bXlHYlNBMWJuTGtXdmJVVWJJZWU1?=
 =?utf-8?B?VUc1UGZmZ1g1Szl2SVF4TGpWNzhoNmlQVXZ1V2h2Y2NBSHI2VlR0TDNuYXlO?=
 =?utf-8?B?d0k0WUJkTUxyQWRlTU1BaUN2SCtXRlAzZFNmaHpzWjUxOTZYa3Ywc1o4a2FY?=
 =?utf-8?B?cS9Wam1XQnU0bUtyODZNa2d3V2hQUm9YWjd5WlJad25xMytETExLWjVjVnFk?=
 =?utf-8?B?aEszekVEbkJjbkM4MmxWbFY5dWFJQ3VHRGJhUFhQVmNYZGplZmhzVEpqVVJV?=
 =?utf-8?B?dzRqNjg4RTFma0FiSDY4V1I3czcyUXkxUVhBTkRJencxQTVkMFpkUU0zemRY?=
 =?utf-8?B?NXY3K3FJSEFqRkN0UlN3VVZqbGg4b0pyY3lXQm1QdFRNbjdNYWk1QUo4VmpG?=
 =?utf-8?B?MXJXTjYwVVo3NU9KUktMM3Y3SktQZWowWllpRHhmZjZoQTBIMWlaOC80S1Q0?=
 =?utf-8?Q?VZJ3pNLVfRg8KSsss08elcsvI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3154fd4b-51ae-4b0b-1f54-08da79b334e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 02:59:41.9219 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z1aHCcQoG047WaAD7CJfnG8EMIdQReL0gQKAJRorSog6mS3oMGEt7bDo26Eqt7OC6ZQRHHVMmNCWi5qDtYT7YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4458
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.151; envelope-from=chen.zhang@intel.com;
 helo=mga17.intel.com
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgTWF5ZGVsbCA8
cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiBTZW50OiBGcmlkYXksIEF1Z3VzdCA1LCAyMDIy
IDU6NTcgUE0NCj4gVG86IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4gQ2M6
IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+OyBMaSBaaGlqaWFuIDxsaXpoaWppYW5A
ZnVqaXRzdS5jb20+Ow0KPiBxZW11LWRldiA8cWVtdS1kZXZlbEBub25nbnUub3JnPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIFYyXSBuZXQvY29sby5jOiBGaXggdGhlIHBvaW50ZXIgaXNzdXNlIHJl
cG9ydGVkIGJ5DQo+IENvdmVyaXR5Lg0KPiANCj4gT24gRnJpLCA1IEF1ZyAyMDIyIGF0IDEwOjUz
LCBaaGFuZyBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBXaGVu
IGVuYWJsZSB0aGUgdmlydGlvLW5ldC1wY2ksIGd1ZXN0IG5ldHdvcmsgcGFja2V0IHdpbGwgbG9h
ZCB0aGUNCj4gPiB2bmV0X2hkci4gSW4gQ09MTyBzdGF0dXMsIHRoZSBwcmltYXJ5IFZNJ3MgbmV0
d29yayBwYWNrZXQgbWF5YmUNCj4gPiByZWRpcmVjdCB0byBhbm90aGVyIFZNLCBpdCBuZWVkIGZp
bHRlci1yZWRpcmVjdCBlbmFibGUgdGhlIHZuZXRfaGRyDQo+ID4gZmxhZyBhdCB0aGUgc2FtZSB0
aW1lLCBDT0xPLXByb3h5IHdpbGwgY29ycmVjdGx5IHBhcnNlIHRoZSBvcmlnaW5hbA0KPiA+IG5l
dHdvcmsgcGFja2V0LiBJZiBoYXZlIGFueSBtaXNjb25maWd1cmF0aW9uIGhlcmUsIHRoZSB2bmV0
X2hkcl9sZW4gaXMNCj4gPiB3cm9uZyBmb3IgcGFyc2UgdGhlIHBhY2tldCwgdGhlIGRhdGErb2Zm
c2V0IHdpbGwgcG9pbnQgdG8gd3JvbmcgcGxhY2UuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBa
aGFuZyBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgbmV0L2NvbG8u
YyB8IDE3ICsrKysrKysrKy0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbmV0L2NvbG8uYyBi
L25ldC9jb2xvLmMNCj4gPiBpbmRleCA2YjBmZjU2MmFkLi41MjRhZmEzZDliIDEwMDY0NA0KPiA+
IC0tLSBhL25ldC9jb2xvLmMNCj4gPiArKysgYi9uZXQvY29sby5jDQo+ID4gQEAgLTQ0LDIxICs0
NCwyMiBAQCBpbnQgcGFyc2VfcGFja2V0X2Vhcmx5KFBhY2tldCAqcGt0KSAgew0KPiA+ICAgICAg
aW50IG5ldHdvcmtfbGVuZ3RoOw0KPiA+ICAgICAgc3RhdGljIGNvbnN0IHVpbnQ4X3Qgdmxhbltd
ID0gezB4ODEsIDB4MDB9Ow0KPiA+IC0gICAgdWludDhfdCAqZGF0YSA9IHBrdC0+ZGF0YSArIHBr
dC0+dm5ldF9oZHJfbGVuOw0KPiA+ICsgICAgdWludDhfdCAqZGF0YSA9IHBrdC0+ZGF0YTsNCj4g
PiAgICAgIHVpbnQxNl90IGwzX3Byb3RvOw0KPiA+ICAgICAgc3NpemVfdCBsMmhkcl9sZW47DQo+
ID4NCj4gPiAtICAgIGlmIChkYXRhID09IE5VTEwpIHsNCj4gPiAtICAgICAgICB0cmFjZV9jb2xv
X3Byb3h5X21haW5fdm5ldF9pbmZvKCJUaGlzIHBhY2tldCBpcyBub3QgcGFyc2VkIGNvcnJlY3Rs
eSwNCj4gIg0KPiA+ICsgICAgYXNzZXJ0KGRhdGEpOw0KPiA+ICsNCj4gPiArICAgIC8qIENoZWNr
IHRoZSByZWNlaXZlZCB2bmV0X2hkcl9sZW4gdGhlbiBhZGQgdGhlIG9mZnNldCAqLw0KPiA+ICsg
ICAgaWYgKHBrdC0+c2l6ZSA8IHNpemVvZihzdHJ1Y3QgZXRoX2hlYWRlcikgKyBzaXplb2Yoc3Ry
dWN0IHZsYW5faGVhZGVyKQ0KPiA+ICsgICAgICAgICsgcGt0LT52bmV0X2hkcl9sZW4pIHsNCj4g
DQo+IEkgdGhpbmsgdGhpcyBleHByZXNzaW9uIG5lZWRzIG1vcmUgY2FyZSB0byBhdm9pZCBvdmVy
ZmxvdyB3aXRoIGEgbWFsaWNpb3VzbHkNCj4gb3Zlci1sYXJnZSB2bmV0X2hkcl9sZW4gdmFsdWUu
DQo+IA0KPiBDYXN0aW5nIHBrdC0+dm5ldF9oZHJfbGVuIHRvIGludDY0X3Qgd291bGQgYmUgb25l
IHdheSB0byBkbyB0aGF0OyB0aGVyZQ0KPiBtYXkgYmUgYmV0dGVyIGFwcHJvYWNoZXMuDQoNClll
cywgeW91IGFyZSByaWdodC4gQW5kIEkgZm91bmQgYmV0dGVyIHRvIHVzZSB0aGlzIGNoZWNrIHRv
IGF2b2lkIG92ZXJmbG93Og0KInBrdC0+dm5ldF9oZHJfbGVuIDwgc2l6ZW9mKHN0cnVjdCB2aXJ0
aW9fbmV0X2hkcikiDQpJIHdpbGwgZml4IGl0IGluIG5leHQgdmVyc2lvbi4NCg0KVGhhbmtzDQpD
aGVuDQoNCg0KPiANCj4gdGhhbmtzDQo+IC0tIFBNTQ0K

