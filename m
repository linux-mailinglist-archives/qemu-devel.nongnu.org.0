Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE3455944E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 09:43:24 +0200 (CEST)
Received: from localhost ([::1]:50670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4dyM-0007WA-Vx
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 03:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o4dsE-0004Jz-D0
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 03:37:03 -0400
Received: from mga12.intel.com ([192.55.52.136]:13974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o4dra-0003rM-Mk
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 03:36:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656056182; x=1687592182;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/XQY5TfTJbhdP7SOHw2gFfB127KrA7b3tbhYdSATo6w=;
 b=YgjfgRHFlz7SielkwgCH3n2V6OhJuF2/2gHbohvLrbDoDuY7iPorqSm9
 n8DdF9OwHLAC8iddjqBypkWcZuD2UYm92GYJnWFFXxdh5m3ra6WokhBVK
 6kLk/dEcCtVXgxjsDHkb3uwTiCdgDueyM1Myd8zC9X+DkiiIs+DARdX79
 /6YfHAJZKzFCmCI9yrvXrdd/MdUE5TIau5Ubrd0JM5DpzJUuUZy/f963R
 D86WO+DCw+M/xdFh21fFgoBniu76qiu01rRv5ABMdfxaeb0UGYwgkG+lV
 sJnhsmdNXZ+qicnGqp9Oy3X3/62K5BGekhH7LWaT4nFGmiCVlZTb+q+mo Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="260761793"
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="260761793"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 00:36:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="645153612"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 24 Jun 2022 00:36:13 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 24 Jun 2022 00:36:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 24 Jun 2022 00:36:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 24 Jun 2022 00:36:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 24 Jun 2022 00:36:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHZTdrJ+FUSRchXlRKvj6wFTtYAPbpvU347k9nO1GknH8Cdw3XvGN7YeGTXx+XUb84rYV37DEVTpw1JBf3D4qYK1t3YcquhDow9YNQtS1AumjfAvhrdnuqA8MxABvUL3G5dgDUZWyfhoISk9RGRmC/Jkl1u78t/ml4wv5ZaVSMDmNBQpbGyqO7FFIKhs5AD8Gey7HU5zpWiKKJY0PY4z7JpDUdaC86LrUgQwcs0nT8NKAODmwljJPU7iLQ2f0bOOvXAGGkcosBXK1q56uYmzkupZ2Loqiok4YIswaAdp2vPxUF7mxJH2zsnbCd+MbzPekkNUIes1ib8PPBP9nNZfRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XQY5TfTJbhdP7SOHw2gFfB127KrA7b3tbhYdSATo6w=;
 b=JRjU5voKV2YDD62Ncr2rCImb9Gq9gmYKAoegk+I4m4fuwh78x8Bmeom2waPnFO5CogPX5PDhrv4yGRZ5ptr5nfYazLOibTbqNuP18+gqaOHb+TUKwvTcICzBjDhLATkNVG/OTvuVJ7isYZaQ1hvKgS1nfXBaGelVAQljGaHGEFTVD48Ma2Ndj0fDJE0XD9gdu8AkjonvmQbstvMqq5XRX3nRZ5c/E3unmP3sGuhL/yZ/oyyi+0rTx5uEkaJ3oYHYZuTvGxWAWFzaV636rre+azPP2yrjQWfcJVU9FczVOpoYyCu/fLjQTZ4rMVpuhtO1ta0G0AfxG1DBbKmr84KJww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 (2603:10b6:301:4f::15) by MN2PR11MB4415.namprd11.prod.outlook.com
 (2603:10b6:208:192::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Fri, 24 Jun
 2022 07:36:09 +0000
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::7958:c658:d5:5e22]) by MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::7958:c658:d5:5e22%6]) with mapi id 15.20.5373.017; Fri, 24 Jun 2022
 07:36:09 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "eric.auger@redhat.com" <eric.auger@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "Zhang, Yu C"
 <yu.c.zhang@intel.com>, "Dong, Chuanxiao" <chuanxiao.dong@intel.com>, "Zhang, 
 Tina" <tina.zhang@intel.com>
Subject: RE: [PATCH 0/3] Add bypass mode support to assigned device
Thread-Topic: [PATCH 0/3] Add bypass mode support to assigned device
Thread-Index: AQHYhyGqr4JhakstWUac+Yuspmo//a1eJvWQ
Date: Fri, 24 Jun 2022 07:36:09 +0000
Message-ID: <MWHPR1101MB21107BBA7721EFCD3716CD5492B49@MWHPR1101MB2110.namprd11.prod.outlook.com>
References: <20220613061010.2674054-1-zhenzhong.duan@intel.com>
 <88019eba-fae7-71d4-47ec-6c3084a45b16@redhat.com>
In-Reply-To: <88019eba-fae7-71d4-47ec-6c3084a45b16@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b0c10ff-d114-427a-7091-08da55b434e0
x-ms-traffictypediagnostic: MN2PR11MB4415:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A/egXsGc0k3RRa0L3e08SChrUu80U708Uca9TFU0SsltkBiQQItW82+Yo8Qhv70LqDqnbDeV0Y8mjd8KfC8eW4L1KtcevdTkg5K+ru9lbsVVq/DM8VFnrxqTiwI25J6QOjuorSF5Ll4idqeAxVYKZ4ETHvWX8cMyLkX/7YhUCu8Qxh0BO3I4yZf16g5BPY/mTIoZ6WWZcWdrX20BLsgFXmWJIPUPVrKqmgZk6vDByT/uXpc0PLYYpEIAAavpWzIPVu1oSZJ0+KvTftR0TmlKG+5WZyu/rB89ZOfutcsirs83IkzzRiiH5ZlSvpcyQAwAarMhFDJZq6MsuRiVL585f0xlr+sdc2y+SYGxwqfmIdrw2n/kgPxZFL8mwmw/2IT0N1uFnhYjI6k9Q8VPxiDooSV09yxBZdyUvjd04evJdIDk9ZkY/8APFcz6imfSzucoHyD+90lc18av15c4bqeNEgLYdYm3b1BKBikFVgTyYE2NgnD7jq51ikKNBJEyIb63p2QGxS99sWy53buqPmhyjMEfYKImC6fJ71zTl7dvl0v0mwK3Ulj7hY0WYoPifO8Q7ZLikQx6ga6RFD6AJ9iIiB2JnBz5rZnAUMEbruIAY1o/aBEMg/2+vBTB23CUnktQ6BGhvthfn7+GR9tE1iwTC1b1YcaetjHS9f4urOhjuQP3WasfQdyQuAELpqT9H22de7WsKNUZKejH4Xt1iE6NYEIpNedrAlZ+VCwYV+eMe1fk8eZqQ+LhLPjcGFTLDHA7lJyiQhuYoccH7JgueXIcuRLPZXnzaNvZtvWP5IiGuPU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2110.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(376002)(366004)(346002)(136003)(39860400002)(55016003)(52536014)(54906003)(8936002)(66556008)(2906002)(33656002)(478600001)(5660300002)(64756008)(8676002)(66946007)(66446008)(316002)(86362001)(7696005)(4326008)(66476007)(6916009)(26005)(107886003)(71200400001)(76116006)(9686003)(6506007)(186003)(82960400001)(41300700001)(83380400001)(38070700005)(122000001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NW5GejVmTG01NkRxais5ZnI0TXJBTUtCUTI2aHFIdkVaUCs0bHJ4ZTdFRmN6?=
 =?utf-8?B?RWU1Y0RrSXk2VjZrZms3d29tQnBER0RoOVVjMk1SNW1NZ0tmUXl0dEQwRmdH?=
 =?utf-8?B?UmQyQXFZeWVFRDQ4S1RMZ1IvU2lKd3FCbWR1aTlmSnNZcHN2Z3lVaXh3U2pC?=
 =?utf-8?B?enhON3VmUkJmMXQrejdodldkTjlLWXVheHhGNGVqbVoyV2kyR3drMnlXNEV6?=
 =?utf-8?B?dkthY0EyMzBOVkpHbXRieGFjYnZ2M0d6alV4R2lxTjVjcUlFcDdsVnpaQ2E1?=
 =?utf-8?B?TWVmVDhFNW1ZL1h6V3FYQmJpaDFCejJYYUNpVU8wMGZnWDFoVUx4VkxYdTg4?=
 =?utf-8?B?bFpXSVlJV2toUjh3Rm1DRkdtTll4L1c4Rkk5U04yNVJ4WVF6M1ZXTnovSm43?=
 =?utf-8?B?MXVMeldscC9jUVZwUVl5YTVTRncxRkhraVpLMVUvRjhQVzVBandGS2NoV3Vv?=
 =?utf-8?B?VksvMDZQdXVxY1dmWkVWMXNRZVM2c3c4R1ZUYk1kem1CQlJwSHdZcVVSOU54?=
 =?utf-8?B?dVZCT3JmWlNSS1NOaWlmUHJuMi85ODc5SnhYdEU4R25WcmRvenRCbDh4QUtV?=
 =?utf-8?B?UDdDVTNwNk9vSnZBeStBNy85dlgvVmNCSU9ZTWRMbjBXMDdVOXV3d2g3RCtm?=
 =?utf-8?B?ajJQclFTZVo2dnp3TUU4bndsSXBzNEtMb2FGc0dId3ptOHo0cHIwZTM4aUVB?=
 =?utf-8?B?VkduSDVtS3dkRkxldlpya1M5TWZ4OVFOZVRWanRZNXhUZElJdWU5elZLakhI?=
 =?utf-8?B?UFhaVXRnOFdyaU1IOVdCZ3hRWlRBUDE5R2t0UUF2SUE0RlhaRWFndmdja1VF?=
 =?utf-8?B?dEJrUUx5TDB1VTVRbzVMMXhXWWNtNzFtZElzaDlta3Y3SnB5cFlFWHdvL3pr?=
 =?utf-8?B?Z2lPRHBYMDh1UzBOWnA2ZW96c3NuOGhsMENwUFp5VFRWSm0rWXlXZEZYSlBr?=
 =?utf-8?B?aG5FZTE4UnNnRXpSRkJTWFpRVkJBc1lEZTVkM1F4amR2Zm5uWjFQN1Q0OXdI?=
 =?utf-8?B?TWVZd05BUURCTjhEM3lCd3pmUFd1eWNXSlVTUGJaQ2JSK2hlVTIzV0c0a3J0?=
 =?utf-8?B?VUhjNkM3c0VuQ2VWNWdpR1pCaFc0cGZVb1c3ZkVOTFNCenFmcVZnMHRxaFNK?=
 =?utf-8?B?T25iUmdOSERBZEgvYXRReFN1Z3ZRMFRFZGdzSU1ZdnRQbFB0T2UwTnA5Z28z?=
 =?utf-8?B?a1VabUpoTHlac2E3ZEZWMFp2KzVmNHlicmpFcWNvK0wvZVhIVlVMSGRZQ1ht?=
 =?utf-8?B?YXp6MHY4WEtrbUVrRkxSY1piT2J5aHltSVpzZGRtbjZJeXplYWJ4dFVWREtM?=
 =?utf-8?B?L3FiNVB3SG9mZWVSKy9maUxxSm8xS0tBdWdtV05IWER3WmYyczhkQjlBNEhi?=
 =?utf-8?B?Y0lneUVqd0s0NU16d00ySTNxZndVWFJjZ0dWTktVcXZiakZQU2xqd2xTbnZR?=
 =?utf-8?B?UnFrS1JLSHNpRVZ2TmtReEJXcVpFVytvOE0xTzExakxxWmVWQTIxVHUzMCt2?=
 =?utf-8?B?NnUxa0paRm00OEcwY3YzWlNqSDZ1cE84QnJjVitKZWg3cGxxNVpubHhwbUQz?=
 =?utf-8?B?UzgwTEFpbHJXVFRZR2JNTWw0WENGWVlLZ1VSRmRldEZaNWxLTWg0SFJQblhv?=
 =?utf-8?B?YTJtWE1laE1IekhBUlVuMHF6MDdrOS9HVStlUnduYWVNdWZHNlp4a01RUlMx?=
 =?utf-8?B?QUFIdnMxQnJ5TjR4YlQycWV2WVA3bzNqUHJMUFFCYUczaGFVaXQybGRobm4z?=
 =?utf-8?B?RUVqM0xTMGtZYWlXeEJ6eGZLMkN6aDEwOVloZTl4SnM1bEZOTEdWejFneC9z?=
 =?utf-8?B?MUQxUXBCZUNwWFJMZHdZZ1VXM0ErMHIrOVVGVUZZQ0FnOVZtQ0FKVTF4V0FU?=
 =?utf-8?B?anE4M2Exakx0WDRmeGxOWWtqcTFYZlF4UGhNaGI0YjJBOVpNTDFvVlJFK1RK?=
 =?utf-8?B?OGsxSmJweUcwUTNuOG5DYUROVFBLWHZPVmhvRXV6RzNEVnNFN3ViTlRyR0JF?=
 =?utf-8?B?OGgzcWZoN2taZDhobmdZN2ZMY2RMUmlUZ1RWcEhrSFFXV1A4b3NSeU8xSmpp?=
 =?utf-8?B?ckxIQXVWRnJ2VmJHbGxkSGc4U0NaTVRqcmZubzZqR1VXL21YbklZVzQ4dWRj?=
 =?utf-8?Q?mXwJhYrJgIWzCwKibCvnmHFDJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2110.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0c10ff-d114-427a-7091-08da55b434e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 07:36:09.5319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a+TKCA5EoJmYcfoWIKm41LnsQLf39GY0P3zLWU9kwTZHP45yv0FVDbW17QcBHQgt9dvcspt8AKn9yNGbSPFTiH6JfIjwV4i+atDmzuyjHtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4415
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=zhenzhong.duan@intel.com; helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

SGkgRXJpYywNCg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogRXJpYyBBdWdl
ciA8ZXJpYy5hdWdlckByZWRoYXQuY29tPg0KPlNlbnQ6IEZyaWRheSwgSnVuZSAyNCwgMjAyMiAx
Mjo1MiBBTQ0KPlRvOiBEdWFuLCBaaGVuemhvbmcgPHpoZW56aG9uZy5kdWFuQGludGVsLmNvbT4N
Cj5DYzogcWVtdS1kZXZlbEBub25nbnUub3JnOyBtc3RAcmVkaGF0LmNvbTsgamVhbi1waGlsaXBw
ZUBsaW5hcm8ub3JnOw0KPnBib256aW5pQHJlZGhhdC5jb207IFpoYW5nLCBZdSBDIDx5dS5jLnpo
YW5nQGludGVsLmNvbT47IERvbmcsDQo+Q2h1YW54aWFvIDxjaHVhbnhpYW8uZG9uZ0BpbnRlbC5j
b20+OyBaaGFuZywgVGluYQ0KPjx0aW5hLnpoYW5nQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTog
W1BBVENIIDAvM10gQWRkIGJ5cGFzcyBtb2RlIHN1cHBvcnQgdG8gYXNzaWduZWQgZGV2aWNlDQo+
DQo+SGkgRHVhbiwNCj4NCj5PbiA2LzEzLzIyIDA4OjEwLCBaaGVuemhvbmcgRHVhbiB3cm90ZToN
Cj4+IEN1cnJlbnRseSB2aXJ0aW8taW9tbXUncyBsb2dpYyB0byBzdXBwb3J0IGJ5cGFzcyBtb2Rl
IHdvcmtzIG9ubHkgZm9yDQo+PiBlbXVsYXRlZCBkZXZpY2UuIEZvciBhc3NpZ25lZCBkZXZpY2Us
IG5vIEdQQSAtPiBIUEEgbWFwcGluZyBpcyBzZXR1cA0KPj4gaW4gSU9NTVUgcGFnZSB0YWJsZS4N
Cj4+DQo+PiBIb3N0IHJlcG9ydCBiZWxvdyBlcnJvcjoNCj4+IFszNzEzNDgxLjc1MDk0NF0gZG1h
cl9mYXVsdDogMTkxIGNhbGxiYWNrcyBzdXBwcmVzc2VkIFszNzEzNDgxLjc1MDk1M10NCj4+IERN
QVI6IERSSEQ6IGhhbmRsaW5nIGZhdWx0IHN0YXR1cyByZWcgMzAyIFszNzEzNDgxLjc1MDk2Ml0g
RE1BUjogW0RNQQ0KPj4gUmVhZCBOT19QQVNJRF0gUmVxdWVzdCBkZXZpY2UgWzJmOjAwLjFdIGZh
dWx0IGFkZHIgMHg3ZWJiMDAwMCBbZmF1bHQNCj4+IHJlYXNvbiAweDA2XSBQVEUgUmVhZCBhY2Nl
c3MgaXMgbm90IHNldCBbMzcxMzQ4MS43NTEwMDNdIERNQVI6IERSSEQ6DQo+PiBoYW5kbGluZyBm
YXVsdCBzdGF0dXMgcmVnIDQwMiBbMzcxMzQ4MS43NTEwMDddIERNQVI6IFtETUEgUmVhZA0KPj4g
Tk9fUEFTSURdIFJlcXVlc3QgZGV2aWNlIFsyZjowMC4xXSBmYXVsdCBhZGRyIDB4N2ViYjAwMDAg
W2ZhdWx0IHJlYXNvbg0KPj4gMHgwNl0gUFRFIFJlYWQgYWNjZXNzIGlzIG5vdCBzZXQgWzM3MTM0
ODEuNzUxMDIzXSBETUFSOiBEUkhEOiBoYW5kbGluZw0KPj4gZmF1bHQgc3RhdHVzIHJlZyA1MDIg
WzM3MTM0ODEuNzUxMDI2XSBETUFSOiBbRE1BIFdyaXRlIE5PX1BBU0lEXQ0KPj4gUmVxdWVzdCBk
ZXZpY2UgWzJmOjAwLjFdIGZhdWx0IGFkZHIgMHg3ZWJiMDAwMCBbZmF1bHQgcmVhc29uIDB4MDVd
IFBURQ0KPj4gV3JpdGUgYWNjZXNzIGlzIG5vdCBzZXQgWzM3MTM0ODEuNzUxMDcyXSBETUFSOiBE
UkhEOiBoYW5kbGluZyBmYXVsdA0KPj4gc3RhdHVzIHJlZyA2MDINCj4+DQo+PiBHdWVzdCBrZXJu
ZWwgcmVwb3J0IGJlbG93IGVycm9yOg0KPj4gWyAgICAzLjQ2MTcxNl0gaTQwZTogSW50ZWwoUikg
RXRoZXJuZXQgQ29ubmVjdGlvbiBYTDcxMCBOZXR3b3JrIERyaXZlcg0KPj4gWyAgICAzLjQ2MjYw
NV0gaTQwZTogQ29weXJpZ2h0IChjKSAyMDEzIC0gMjAxOSBJbnRlbCBDb3Jwb3JhdGlvbi4NCj4+
IFsgICAgMy40NjQ2MzBdIGk0MGUgMDAwMDowMDowNC4wOiBBZGRpbmcgdG8gaW9tbXUgZ3JvdXAg
NQ0KPj4gWyAgICAzLjQ4MjA5M10gaTQwZSAwMDAwOjAwOjA0LjA6IGZ3IDAuMC4wMDAwMCBhcGkg
MC4wIG52bSAwLjAwIDB4MTc2OTUzY2UNCj4yOC41MC4xIFs4MDg2OjM3ZDNdIFs4MDg2OjM1ZDBd
DQo+PiBbICAgIDMuNDg0Mjk1XSBpNDBlIDAwMDA6MDA6MDQuMDogZWVwcm9tIGNoZWNrIGZhaWxl
ZCAoLTYyKSwgVHgvUnggdHJhZmZpYw0KPmRpc2FibGVkDQo+PiBbICAgIDMuNDg3MjY4XSBpNDBl
IDAwMDA6MDA6MDQuMDogY29uZmlndXJlX2xhbl9obWMgZmFpbGVkOiAtNDkNCj4+IFsgICAgMy40
ODkwNjZdIGk0MGU6IHByb2JlIG9mIDAwMDA6MDA6MDQuMCBmYWlsZWQgd2l0aCBlcnJvciAtMg0K
Pj4NCj4+IEZpeCBpdCBieSBhZGRpbmcgc3dpdGNoIGJld2VlbiBieXBhc3MgYW5kIGlvbW11IGFk
ZHJlc3Mgc3BhY2UganVzdA0KPj4gbGlrZSB0aGUgdmlydHVhbCBWVC1kIGltcGxlbWVudGF0aW9u
LCBzbyB0aGF0IGluIGJ5cGFzcyBtb2RlLCB2ZmlvDQo+PiBtYXBwaW5nIGlzIHNldHVwLg0KPj4N
Cj4+IFRlc3RlZCB3aXRoIGZvdXIgY29tYmluYXRpb24gb2YgcWVtdSdzDQo+PiB2aXJ0aW8taW9t
bXUuYm9vdC1ieXBhc3M9dHJ1ZS9mYWxzZQ0KPj4gd2l0aCBndWVzdCBrZXJuZWwncyBpb21tdT1w
dC9ub3B0IG9uIHg4Nl82NCBwbGF0Zm9ybS4NCj4NCj5JIGtub3cgdGhpcyBoYXMgYWxyZWFkeSBs
YW5kZWQgdXB0cmVhbSAoSSB3YXMgb2ZmIGxhc3Qgd2VlaykgYnV0IEkgaGF2ZSBmZXcNCj5jb21t
ZW50cy9xdWVzdGlvbnMgcmVsYXRlZCB0byB0aGUgc2VyaWVzLg0KDQpTdXJl8J+Yig0KDQo+Pg0K
Pj4gWmhlbnpob25nIER1YW4gKDMpOg0KPj4gICB2aXJ0aW8taW9tbXU6IEFkZCBieXBhc3MgbW9k
ZSBzdXBwb3J0IHRvIGFzc2lnbmVkIGRldmljZQ0KPj4gICB2aXJ0aW8taW9tbXU6IFVzZSByZWN1
cnNpdmUgbG9jayB0byBhdm9pZCBkZWFkbG9jaw0KPlRoaXMgcGF0Y2ggbWF5IGhhdmUgYmVlbiBz
cXVhc2hlZCBpbnRvIHRoZSBwcmV2aW91cyBvbmUsIGFzDQo+InZpcnRpby1pb21tdTogQWRkIGJ5
cGFzcyBtb2RlIHN1cHBvcnQgdG8gYXNzaWduZWQgZGV2aWNlIiBkZWFkbG9ja3MuDQoNClllcywg
dGhhdCBtYXkgYmUgYmV0dGVyLiBNeSBpbml0aWFsIHRob3VnaHQgaXMgdG8gbWFrZSAxc3QgcGF0
Y2ggc2xpbSBhIGJpdCwNCndoaWNoIG1heSBiZSBtb3JlIGNsZWFyIGZvciBtYWludGFpbmVycyB0
byByZXZpZXcuDQoNClRoYW5rcw0KWmhlbnpob25nDQo=

