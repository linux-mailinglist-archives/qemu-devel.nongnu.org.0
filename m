Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B6E6C5E56
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 06:03:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfD4q-000317-OT; Thu, 23 Mar 2023 01:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1pfD4n-00030j-C6
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 01:01:25 -0400
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1pfD4k-00006p-QB
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 01:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679547682; x=1711083682;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s0vzwVtDhFUvarEcMV26yyyMKca3LgbaaY72KATg8RI=;
 b=JeOqIxKK74LkcEW8Rm/PDzfDZ9PIv+f5GqivYsD4jpFhnLmMbI2VtgXq
 OFpH/SMqNAEIXfWhrxBXtNdNZoh0atZcvfU3JYJ/bApgeTXT1ku1D8KNq
 T7gGyPe+vxy1yErPk44VGGcAvvZe4s/1gYAAp62cn1qBvFBHUFbv6Ktro
 w1IK2mz4BnuHi2cz64TRwrlQ5YcPI+4yQ7vfodIdiSmn9um/T+1Y6IL4D
 mSpGhIpjVyP/qa5zQjjpM0UMzFdt/3pKxuu1fU+NpTw9Oh4EdDQbska11
 CYWkfJXVC14Fy8GFbpsy7+7ieCT9JH2sDqAs9c2qMOk8j5oIeZ+mtHwfv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="339432641"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="339432641"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:01:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="632242965"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="632242965"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 22 Mar 2023 22:01:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 22:01:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 22:01:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 22:01:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CCLgoCVdeYjL0VMCRVL17vkvDzMy3+pbJQwIXLuPl4xPb0luluxYGLpbz9/FrJUmq0K/eQFH1cODA+VIPVJZ1Kzgaepw8ceqHo1KTQnGtAgKzLe32eehHpo2dbmeDOsaJwsq6CB9GSaD8hwKC/urmMX/gJm+GYZFYyi9Tyh1fvT5SGCjhUoeLGLpX4LPkDjUjFGw9Ak/VD7n1CANFfFreQ0oT+Cc2jCg4LhuUJBjfG4XyR0yOWysYcSV6PEqK0PZYITjYb+kr8qKdwSKhEufPxsnBOAVDqIt8395QavbtITp1B2pn6MBQmKSRktK4/xZbN0KJux/udyuTAVpFbed7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0vzwVtDhFUvarEcMV26yyyMKca3LgbaaY72KATg8RI=;
 b=GSZq3vj/hjFWSTx/9VwidaSQLIFH6YGuIr9IMmbr/POCWheZseujEXdKqUiQmvgkGEW6RY8+DIcneu4W0qW2xTyVsK7+wwySwUiqzN5Q4p0LIMx21I1G7lUB+v8S4xSjMpnDab1cbyE9RMOd4J3K2Flreq2+/SMMKJPQw6Ho71Kt2QzJvry9i5imB4YT9GpjYRRoVccx6AQr5LnDxmxhr1mFlWfxSwpviXZTvFIq9MKCAqiy0Wtk3PnFOJvhw+Z+/mGfsx2gcnlSLlSKSunWaCTkixDncTgMcAPhB3t3tm71+xmkBnQZj9z0KA9yEBD5RfgUIirA4j3F5iN80HGi3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:443::14)
 by MW4PR11MB7128.namprd11.prod.outlook.com (2603:10b6:303:22b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 05:01:14 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::9772:88b6:6667:559]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::9772:88b6:6667:559%3]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 05:01:14 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Erico Nunes <ernunes@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Subject: RE: [PATCH 1/2] ui/gtk: use widget size for cursor motion event
Thread-Topic: [PATCH 1/2] ui/gtk: use widget size for cursor motion event
Thread-Index: AQHZW11nDmafDcRMRkiuLudMXmslka8EkibAgAJot4CAAMDFYA==
Date: Thu, 23 Mar 2023 05:01:14 +0000
Message-ID: <IA0PR11MB7185E1E1B14D97797D672C2EF8879@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230320160856.364319-1-ernunes@redhat.com>
 <IA0PR11MB71850EDD187027261A5D260BF8819@IA0PR11MB7185.namprd11.prod.outlook.com>
 <a38996cb-1ca9-6bfd-3fb8-2ba037243472@redhat.com>
In-Reply-To: <a38996cb-1ca9-6bfd-3fb8-2ba037243472@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|MW4PR11MB7128:EE_
x-ms-office365-filtering-correlation-id: 4cb36e03-2092-44a7-29b4-08db2b5ba0f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RpGi50T5yo53CytQ7Soruj0ztEjgSyPcUG3bQW/rbI7v2iktvvwZhOd63/0QqpBz4eNLsNkYN1KXNJJx8SwnrsUWGJFwbMDSTSlfyXabqzJpMNLnMFTdWbsa0opFYNKfAv9r28NU/BK5MF8zUCq3Ypng55SGVlHYfmqRVCfcdFz8GhKJznTzI9YgWk1xKtyteV5jpPNTywD2IPPmJ+WJXoIWUUMyrLYH22jDHEBzuLUKvDM7OR4JyL8bd7rL2m3mc0HCxb2N6bDfaK+SZYj1CHebXVXVoAOH45i1dUMHXRcKXgpzcRr65aX/hZZfaAfCTAOxxPZU5WNkF7urSKM5M+GE9seVdDa8u/igBAa3d/eEk5yalpqXKqxAiQixRRk1Rkp+C93/kEeBFesbg2vK3EyudK+dyN9mfK503keH8t2Rw1oL+ZQtPv5BRKP3amjWvqH5o8W4kmWDdMb3QPgb1cZDvIIIVKjcOF83A58+Ak5KdCl0sQ/heIUQOmPw/K3tnm3h+mvsoX0dsqrlejLyCoRDUaWdvVyKyzGeQVoaJ9E2xgCkZyQqG/HbI5Rc28bWNolDpvKjuVvwuya2s9yfbKsrHG5Ms3ERH1wFdQHW/1aGeutOJOP5PdzhUg81HYlTjPkCwGxDYNRnnJfR9kAjtpV/Zcu2H5xvOWN1/efa1rN6uOmhx0o+TFP90VQlUOdaQwLnZy9DQJBWwaBx04y3hMVf19ypjdjPJcOYR9T9fhj+tU33nWj6umTeG9uvUVBx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39860400002)(346002)(366004)(136003)(451199018)(83380400001)(478600001)(7696005)(71200400001)(9686003)(186003)(966005)(33656002)(110136005)(66476007)(66446008)(66556008)(64756008)(66899018)(8676002)(4326008)(316002)(66946007)(76116006)(6506007)(26005)(52536014)(41300700001)(5660300002)(86362001)(82960400001)(8936002)(2906002)(122000001)(38100700002)(38070700005)(55016003)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHdrVG5sLzBrKzBWaHFpVkFYbjRTQlJHTVdOa0YrVGNEVUJBVVhocElxY3F2?=
 =?utf-8?B?NW1pU25ReU8yRGlCQTVNcE5XS0pzWVY0WkZMMWl3MUw2Y1hnZEpYOXVneTJh?=
 =?utf-8?B?NlFaUDB3bnpkTW5GSzM0WlBnb2ZuQ0o0Qm9lYVBPb0M0QjdvR1ppUU11Skp2?=
 =?utf-8?B?eElRYUxCY3psOWZWMlFtdHBSK0t0K0VnRkRZV2o3TG5tcDJYOFlKNkhNSnZx?=
 =?utf-8?B?dXFsWE03a2pXN1NhVzhnYnhTUFJ3cFB3UU43bGR5d3FibC9NOWdqODlJZmZI?=
 =?utf-8?B?a011RkFzQkxxTjIrMk4vMmIzZGVzU2ZrSkI5aXdJR0gzOGM1clg4cVFFZFdB?=
 =?utf-8?B?V0dUTTJ1UlZLTWs3YkdXNW9nalhvdU5mSHlwTnRlOFJuTkpKZVJ6dkk1ajRW?=
 =?utf-8?B?R2ZnSkxOaTM3NEhkZGZxVkR0SEtreEwzVVRKZGpZbDFyclltekNvRmtNM1Ru?=
 =?utf-8?B?RzRoWU1FdXNGVUNBMWFiTlM4Y3JOWEZ4WDhSd2d2UkxsTllvSFNzL3BIb2lu?=
 =?utf-8?B?ZHF2Z2o2V1JHYkE2TENNNWliVi9HZDhMbWdKM3gyWVExSzNRcHBvZFlpQjNC?=
 =?utf-8?B?WDRCdGVPUkhXakV0NGUwR3k4WVdVMjNPOENZU0lsdGhFT2Z3TUloTTgzcVdl?=
 =?utf-8?B?SDhkZU44SHhMUDNXWVFQb1lIcHR5dldMRlBLay9YUzFHUDh2Q1Jpa3MzWGpw?=
 =?utf-8?B?ZjJMNGVLT0JsOUVwWFFCU1Fnamh3MnBJQ1NKSlpLb2t2NFlVcW5JbXpCU093?=
 =?utf-8?B?T1lyQkVTZjZHK244SVova0J4NkF3YkFvcGNjYlM4MVNONWxPSXpaZC9IaURY?=
 =?utf-8?B?a3pRSDhoZ0dGREx2a1RlaG1PR2wybzZhbm5JUmJUSnVDSzkrOTZONkgyczRR?=
 =?utf-8?B?R25LYnFzckdrbVlqZnIrendFNUpOdm5PcThjYURBV29TTHREaHNYM0FJQklT?=
 =?utf-8?B?WFdaN01HM1BjRS94eDgvOFg1TGdpS1phaWFLazFKV3pMUEI5cDVMb0daSzhU?=
 =?utf-8?B?MmxmVTQ0eVhsSnlQTmMxQWQ0eG51bThIQnVqM0pLczFuNnU3N1QrTm13WkYy?=
 =?utf-8?B?bnMrUXMzSCt4MUtNektHVXVGaFpoUTl5QS8xdE1Dd1dxWnBqaFkrRStvaSt1?=
 =?utf-8?B?MnNlTHovZkl3QlVMYzdrN1BQbTF0SVRHSzF2K0t5Q0pUTy81VEhBK1d1eWpH?=
 =?utf-8?B?c0ZTVEpUWGZ4UmtvNExCWEJiVk5QWis2c29DZ1RkMFZvTlhvOXF4b3Y2Tmt4?=
 =?utf-8?B?WUx3ZFZ0M1daRFN1VzdoWWtlVmlxdFpINTlNczdldTc5VjZLSkFTQU5LUmpk?=
 =?utf-8?B?TFl3VWF3d1lOS2QwM0swSlYzaTJJK0VmdnRCRDllMW9yTW9JVzY5MU9lSmtk?=
 =?utf-8?B?WndMQzBRcmRYc2U4blJwRnJaRzhkZjdxRzNlTDVBSnVRYU1EeUZGRVNjOGRD?=
 =?utf-8?B?NlNMVU9sUDFwV3F3eEpFQ0lmcWFpc1A1SUMzQlRRT2NHeHozOEhEeVErNm8y?=
 =?utf-8?B?SkVrSVZSTVhCN2ZuaXhJS1RqeHU5MnVzUGZMbHBVUGZzRS8vWDV6OWIvYzIv?=
 =?utf-8?B?L0dqbElnd1hybkFMb2lORkI4MTI3SExyNUFnaHZicWVkNEc3L1hWU2hkdm1W?=
 =?utf-8?B?WGlmWXNhdjVBMVVOeWlwT1c1UHA5SWc0SVNBVFNJd3ZjS3RLN2RvWW1wZkxw?=
 =?utf-8?B?Ty9OazZmV0VyREpFN1ljSlI2aUlnUFNBTkN0UU9IZ0JkNkJOc1MrV2RVbS9L?=
 =?utf-8?B?QUtrTU9nM1orczgyWlE4Ujk0cmp0QWlEbG1jYUErbkR0OHhmUnk0NHNzS1RW?=
 =?utf-8?B?U0hVOHRrWk9iYTFQbGVYb09jbm9QY1ovNzlaWko3cnVwUEd5RzEvWmEvTnVh?=
 =?utf-8?B?ODBLYzJYU2FESUE2SWwrUUdpQXhrWStWbzBhNjFqTEcveEF1YUs4azhXQmdI?=
 =?utf-8?B?c2dUVHdRL0FZR1kxY0ZHY1FZZlpuWWtKa2ZKUFlnbUd0SUd2RTcraFkrY3hQ?=
 =?utf-8?B?WVNTWDYzTFp6WTY3aEVuUGZOd2orbkhncHI5ZjIxcGx6dG5ycXF1U1greU0r?=
 =?utf-8?B?cllBK1NrU0drbmx2TllNZDZkeTlldEdFR0ptTkZOMlhRZXBuWGcvRHk4QTMr?=
 =?utf-8?B?c3Y1UUlJQ3ZWbXJqTS94THEzY0NjL0IzTlVqbUdhbVFnZGlKY2R4d0lreGto?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb36e03-2092-44a7-29b4-08db2b5ba0f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2023 05:01:14.5275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4k4yMhnUDApOgkrzH+GDF1LT81ZpCWIDdiNiaFGOmFtjDOK/UTOXmy0DrqI4NeZ0Gbq29RkZugwD4QGrAM2c0Ut4BSirKKAFIOFOOQCDAsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7128
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=vivek.kasireddy@intel.com; helo=mga14.intel.com
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

SGkgRXJpY28sDQoNCj4gPg0KPiA+Pg0KPiA+PiBUaGUgZ2RfbW90aW9uX2V2ZW50IHNpemUgaGFz
IHNvbWUgY2FsY3VsYXRpb25zIGZvciB0aGUgY3Vyc29yIHBvc2l0aW9uLA0KPiA+PiB3aGljaCBh
bHNvIHRha2UgaW50byBhY2NvdW50IHRoaW5ncyBsaWtlIGRpZmZlcmVudCBzaXplIG9mIHRoZQ0K
PiA+PiBmcmFtZWJ1ZmZlciBjb21wYXJlZCB0byB0aGUgd2luZG93IHNpemUuDQo+ID4+IFRoZSB1
c2Ugb2Ygd2luZG93IHNpemUgbWFrZXMgdGhpbmdzIG1vcmUgZGlmZmljdWx0IHRob3VnaCwgYXMg
YXQgbGVhc3QNCj4gPj4gaW4gdGhlIGNhc2Ugb2YgV2F5bGFuZCBpbmNsdWRlcyB0aGUgc2l6ZSBv
ZiB1aSBlbGVtZW50cyBsaWtlIGEgbWVudSBiYXINCj4gPj4gYXQgdGhlIHRvcCBvZiB0aGUgd2lu
ZG93LiBUaGlzIGxlYWRzIHRvIGEgd3JvbmcgcG9zaXRpb24gY2FsY3VsYXRpb24gYnkNCj4gPj4g
YSBmZXcgcGl4ZWxzLg0KPiA+PiBGaXggaXQgYnkgdXNpbmcgdGhlIHNpemUgb2YgdGhlIHdpZGdl
dCwgd2hpY2ggYWxyZWFkeSByZXR1cm5zIHRoZSBzaXplDQo+ID4+IG9mIHRoZSBhY3R1YWwgc3Bh
Y2UgdG8gcmVuZGVyIHRoZSBmcmFtZWJ1ZmZlci4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTog
RXJpY28gTnVuZXMgPGVybnVuZXNAcmVkaGF0LmNvbT4NCj4gPj4gLS0tDQo+ID4+ICB1aS9ndGsu
YyB8IDggKysrLS0tLS0NCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS91aS9ndGsuYyBiL3VpL2d0ay5j
DQo+ID4+IGluZGV4IGZkODJlOWIxY2EuLmQxYjJhODBjMmIgMTAwNjQ0DQo+ID4+IC0tLSBhL3Vp
L2d0ay5jDQo+ID4+ICsrKyBiL3VpL2d0ay5jDQo+ID4+IEBAIC04NjgsNyArODY4LDYgQEAgc3Rh
dGljIGdib29sZWFuIGdkX21vdGlvbl9ldmVudChHdGtXaWRnZXQgKndpZGdldCwNCj4gPj4gR2Rr
RXZlbnRNb3Rpb24gKm1vdGlvbiwNCj4gPj4gIHsNCj4gPj4gICAgICBWaXJ0dWFsQ29uc29sZSAq
dmMgPSBvcGFxdWU7DQo+ID4+ICAgICAgR3RrRGlzcGxheVN0YXRlICpzID0gdmMtPnM7DQo+ID4+
IC0gICAgR2RrV2luZG93ICp3aW5kb3c7DQo+ID4+ICAgICAgaW50IHgsIHk7DQo+ID4+ICAgICAg
aW50IG14LCBteTsNCj4gPj4gICAgICBpbnQgZmJoLCBmYnc7DQo+ID4+IEBAIC04ODEsMTAgKzg4
MCw5IEBAIHN0YXRpYyBnYm9vbGVhbiBnZF9tb3Rpb25fZXZlbnQoR3RrV2lkZ2V0DQo+ICp3aWRn
ZXQsDQo+ID4+IEdka0V2ZW50TW90aW9uICptb3Rpb24sDQo+ID4+ICAgICAgZmJ3ID0gc3VyZmFj
ZV93aWR0aCh2Yy0+Z2Z4LmRzKSAqIHZjLT5nZnguc2NhbGVfeDsNCj4gPj4gICAgICBmYmggPSBz
dXJmYWNlX2hlaWdodCh2Yy0+Z2Z4LmRzKSAqIHZjLT5nZnguc2NhbGVfeTsNCj4gPj4NCj4gPj4g
LSAgICB3aW5kb3cgPSBndGtfd2lkZ2V0X2dldF93aW5kb3codmMtPmdmeC5kcmF3aW5nX2FyZWEp
Ow0KPiA+PiAtICAgIHd3ID0gZ2RrX3dpbmRvd19nZXRfd2lkdGgod2luZG93KTsNCj4gPj4gLSAg
ICB3aCA9IGdka193aW5kb3dfZ2V0X2hlaWdodCh3aW5kb3cpOw0KPiA+PiAtICAgIHdzID0gZ2Rr
X3dpbmRvd19nZXRfc2NhbGVfZmFjdG9yKHdpbmRvdyk7DQo+ID4+ICsgICAgd3cgPSBndGtfd2lk
Z2V0X2dldF9hbGxvY2F0ZWRfd2lkdGgod2lkZ2V0KTsNCj4gPj4gKyAgICB3aCA9IGd0a193aWRn
ZXRfZ2V0X2FsbG9jYXRlZF9oZWlnaHQod2lkZ2V0KTsNCj4gPiBbS2FzaXJlZGR5LCBWaXZla10g
Q291bGQgeW91IHBsZWFzZSBjb25maXJtIGlmIHRoaXMgd29ya3MgaW4gWC1iYXNlZCBjb21wb3Np
dG9yDQo+ID4gZW52aXJvbm1lbnRzIGFzIHdlbGw/IExhc3QgdGltZSBJIGNoZWNrZWQgKHdpdGgg
RmVkb3JhIDM2IGFuZCBHbm9tZSArIFgpLCB0aGUNCj4gPiBnZXRfYWxsb2NhdGVkX3h4eCBBUElz
IHdlcmUgbm90IGFjY3VyYXRlIGluIFgtYmFzZWQgZW52aXJvbm1lbnRzLiBUaGVyZWZvcmUsDQo+
ID4gSSByZXN0cmljdGVkIHRoZSBhYm92ZSBjaGFuZ2UgdG8gV2F5bGFuZC1iYXNlZCBlbnZpcm9u
bWVudHMgb25seToNCj4gPiBodHRwczovL2xpc3RzLm5vbmdudS5vcmcvYXJjaGl2ZS9odG1sL3Fl
bXUtZGV2ZWwvMjAyMi0xMS9tc2cwMzEwMC5odG1sDQo+IA0KPiBZZXMsIEkgdGVzdGVkIGFnYWlu
IGFuZCBpdCBzZWVtcyB0byB3b3JrIGZpbmUgZm9yIG1lIGV2ZW4gd2l0aCB0aGUgZ3RrDQo+IHVp
IHJ1bm5pbmcgb24gWC4gSSdtIHVzaW5nIEZlZG9yYSAzNy4NCltLYXNpcmVkZHksIFZpdmVrXSBP
aywgaW4gdGhhdCBjYXNlLCB0aGlzIHBhdGNoIGlzIA0KQWNrZWQtYnk6IFZpdmVrIEthc2lyZWRk
eSA8dml2ZWsua2FzaXJlZGR5QGludGVsLmNvbT4NCg0KPiANCj4gSSB3YXMgbm90IGF3YXJlIG9m
IHRoYXQgcGF0Y2ggc2VyaWVzIHRob3VnaCBhbmQganVzdCBzcGVudCBzb21lIHRpbWUNCj4gZGVi
dWdnaW5nIHRoZXNlIHVpIGlzc3Vlcy4gSXQgbG9va3MgbGlrZSB5b3VyIHNlcmllcyB3YXMgbWlz
c2VkPw0KW0thc2lyZWRkeSwgVml2ZWtdIFllYWgsIG5vdCBzdXJlIHdoeSBteSBzZXJpZXMgd2Fz
IG1pc3NlZCBidXQgaW4gDQpyZXRyb3NwZWN0LCBJIHByb2JhYmx5IHNob3VsZCBoYXZlIHNlcGFy
YXRlZCBvdXQgYnVnIGZpeCBwYXRjaGVzDQpmcm9tIG5ldyBmZWF0dXJlIGVuYWJsZW1lbnQgcGF0
Y2hlcy4NCg0KPiANCj4gSSdtIHN0aWxsIGRlYnVnZ2luZyBhZGRpdGlvbmFsIGlzc3VlcyB3aXRo
IGN1cnNvciBwb3NpdGlvbiBjYWxjdWxhdGlvbiwNCj4gZXNwZWNpYWxseSBpbiB3YXlsYW5kIGVu
dmlyb25tZW50cyAoYW5kIGluIHBhcnRpY3VsYXIgd2l0aA0KPiB2aG9zdC11c2VyLWdwdSBub3cp
LiBEbyB0aG9zZSBwYXRjaGVzIGFkZHJlc3MgbW9yZSBjdXJzb3IgaXNzdWVzPw0KW0thc2lyZWRk
eSwgVml2ZWtdIFRoZXkgZG8gYWRkcmVzcyBtb3JlIGN1cnNvciBpc3N1ZXMgYnV0IG5vdCBzdXJl
IGhvdw0KaGVscGZ1bCB0aGV5IHdvdWxkIGJlIGZvciB5b3UgYXMgbW9zdCBvZiB0aGVtIGRlYWwg
d2l0aCByZWxhdGl2ZSBtb2RlICsNCldheWxhbmQgZW52aXJvbm1lbnQuIEhvd2V2ZXIsIHRoZXJl
IGlzIGFub3RoZXIgb25lIHRoYXQgZGVhbHMgd2l0aA0KY3Vyc29yL3BvaW50ZXIgaW4gYWJzb2x1
dGUgbW9kZSArIG11bHRpcGxlIG1vbml0b3JzOg0KaHR0cHM6Ly9saXN0cy5ub25nbnUub3JnL2Fy
Y2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMjItMTEvbXNnMDMwOTcuaHRtbA0KDQpUaGFua3MsDQpW
aXZlaw0KPiANCj4gVGhhbmsgeW91DQo+IA0KPiBFcmljbw0KPiANCg0K

