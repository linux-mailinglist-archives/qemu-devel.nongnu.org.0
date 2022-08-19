Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 041EB5992A4
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 03:40:21 +0200 (CEST)
Received: from localhost ([::1]:42180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOqzj-0000c1-Op
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 21:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oOqxp-0007di-1P
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 21:38:21 -0400
Received: from mga14.intel.com ([192.55.52.115]:56056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oOqxm-0007sF-K0
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 21:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660873098; x=1692409098;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lV3xrCQ6DUwbjEkgZtxvcesVI73Wykdg7TblmHmFja8=;
 b=Lu64pqHU+CN2G9m6Q+jPvMEdOyUkH2KoemxXIvaJPYW/kdfd+jkAOpKF
 BAdqOUd22tMq12bVOqSbftd4jLSf/Fm4+Raa9biYIZ3pqZkt8n7uHN9Bg
 RvzbLl1eQyoox3dM0Egz9WeJN+4R6hWYntMV4kadNtF0GWsUv6oYKWThg
 ePAkj/rBP2wBjiMe4iD/IEt4SuZv8cFbX2MM7PfTje1fDAAbp9wdMK+8I
 lhB+t6eFBqgRuhu0GN7SWCHGzpWc7oFLEhZsMGMRbenTobkueLYNpqAi3
 hQZ6QbJph3F7EPtpoJwYRjmPG16CxHnQ77UDqs87Jw0M/1RGDHSzj2Y4t Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="292907433"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="292907433"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 18:38:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="584462270"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 18 Aug 2022 18:38:10 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 18 Aug 2022 18:38:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 18 Aug 2022 18:38:09 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 18 Aug 2022 18:38:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZd2psxiWIcqsTr5sGv59pENnINNaCSdY6FIkP8IkK0uGwmR6mcbVC8RxnypWVJKuuswwrxmlis+8ngiaBY4aKl0dnAn7GuDUI8iLMiWBzGwDF8dGLjQrFew5tw8qGZN8p9SLSSCYPNFmsbfJrBOPNOj6+1gAZqlJbFOOyASNkmT9Yr6TL6DR/XQEJh3S33SmLpeX1a8ZpFOMm/xcVdmTi4yibfTjMeJtLBWv1MJJJkIpyme0bU79W2RTzCY1G33/jgy2VPx3ucNI1ONqQGe2WhRCd0yofLthpj4GqA2MLcbHoHbkN20Rl2WwB5eV1bBNd5VJXLGRzuu73cDN2JKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lV3xrCQ6DUwbjEkgZtxvcesVI73Wykdg7TblmHmFja8=;
 b=EcCUNqv/paBk2v66hHntHa4hae7kFKMzMUhzNrkdSloxeNurnXHghEDLHFNOFbntkjDxE4ANHWmG1F8+UMrkW4t+xQwNiaKTl8m0v/pTzbaMXI67usoSO1voGPBrWk5IFmSrD0kRIzpbGvMhIj54iYNPajgZsxYOLnDHUDTaEn2Jp0XsB8SsJD3Ch71FnFmxiB2Yh8bgfl7y/xs4S6nHFkKbjyR6o389nbhjSpe8ok1qDy1KiudgShG/GnIOAmyDmG59ePsP2jxWsfBXDgZZemUmVj0VmFzh8z2jeE1dJocHWJpR4xax6Dugx34k1q6F7H67IPZOX/ffcoLu3vWM7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 (2603:10b6:301:4f::15) by DM5PR1101MB2107.namprd11.prod.outlook.com
 (2603:10b6:4:5a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Fri, 19 Aug
 2022 01:38:06 +0000
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::d73:edaf:8500:a40d]) by MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::d73:edaf:8500:a40d%5]) with mapi id 15.20.5504.027; Fri, 19 Aug 2022
 01:38:06 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, "Christopherson,, Sean"
 <seanjc@google.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "mtosatti@redhat.com"
 <mtosatti@redhat.com>, "likexu@tencent.com" <likexu@tencent.com>, "Ma,
 XiangfeiX" <xiangfeix.ma@intel.com>
Subject: RE: [PATCH] i386: Disable BTS and PEBS
Thread-Topic: [PATCH] i386: Disable BTS and PEBS
Thread-Index: AQHYmlazwj8/cO8xi0SzVzXLZpnnXa2ETJ2AgABEQQCAAXJugIAvnznw
Date: Fri, 19 Aug 2022 01:38:06 +0000
Message-ID: <MWHPR1101MB2110523D62D9965B22191F72926C9@MWHPR1101MB2110.namprd11.prod.outlook.com>
References: <20220718032206.34488-1-zhenzhong.duan@intel.com>
 <a7bccbc5-fcb7-eaa8-ce95-fa7f380b8af9@redhat.com>
 <YtW+ymE654W662X4@google.com>
 <9dbe748c-57b4-eab5-3933-0e9891b031c1@redhat.com>
In-Reply-To: <9dbe748c-57b4-eab5-3933-0e9891b031c1@redhat.com>
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
x-ms-office365-filtering-correlation-id: abdf34c4-0c1e-4c78-fc6e-08da81837702
x-ms-traffictypediagnostic: DM5PR1101MB2107:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YaTl8F0y2leWlmEJKjzb3gDbrDx2K6ulJ0rv415m0gAIGKa9GeEeVZ3kQAZ4Qtp+ldZQqSKLpboOw9/cfVRi5YS5D8kMQzPtGSmh6+FTKb6YJy+LaDAhl3SljCDtiIqgadMRuyl1K+1Bhq4DjDnthHYY8bY6PbDAhCT9WLb8/XTszyh2a1/emijP3p1HLKykLSrF10ZusMWzmohFd2+akv9uaiaUtZuMT180aNWGadRKEBY2NLZQZ1Dk2zPtGn0BIhQoqzUzGIVj95+lyf/bX/DmEy2Y2k6mn9vy5/4SOLwGdqVq4yOHh55VlPz26CvHvtQLsKHfnO+iRy+t+Gwl0HupwJbM2G5zabdwYkwUmwhg7pNX2UfN5ZMyWX4yibwooSogpsN7ikmU08c9w9gyhDg1yywJIsJ81kfzFETCpo7cpv7h7jdhK8QcsJL2jPi3vZySwi32pU32fjE8ZjjrkcalrY23LyTelZJTYhAokAGZ/cwwrE/R8guM40loiSXu/hn3+fn8a+nazo2/YQPSw+y4OH4x+f/LpFeK68id+ei0GlR5kY0hs695NUcM2Q5X8ZP6+5s/9ke+JaBPpAPrgYrZnpAkF2mZqcE6u8v6lfqNgJsRaAdvS1PRSfSwexnE26b/5fpEtfMnXeieJkocxJU6I1yCpiMW5rMilIPlJCKGmDYouxMPZ+8+LeVoGukXIHiWe1RbUv1HFOJ331vSQGzWQGt6HC+yec1a+BsBwmbDdAUQXxNnL7xZ0mtAMUMnKQrBF7hGKEhfn45AdBB2mw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2110.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(346002)(376002)(136003)(39860400002)(26005)(9686003)(38100700002)(2906002)(7696005)(6506007)(107886003)(55016003)(83380400001)(122000001)(186003)(66946007)(82960400001)(4326008)(64756008)(66476007)(66556008)(76116006)(66446008)(8676002)(478600001)(33656002)(71200400001)(110136005)(54906003)(316002)(86362001)(5660300002)(41300700001)(8936002)(38070700005)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3ZacXR0RkI0T1MyL3pSK2FDYTZJc0dlTlQwUkduNGZMVjIzZnZLdUQ0dW1J?=
 =?utf-8?B?KzA5RUxQb1FISnBXOGdHdCtSaFIrSDQydjY5Nm95dlQ3Rlljc1BKT3ZXbHp5?=
 =?utf-8?B?YURBSWlKb3gxeWNZQ2F1SWJLV0JYb3pOTTIvUXJOQVEyMWpyMTdydE9BQzJy?=
 =?utf-8?B?d2p0UzQ2OHpWZzB3ZjlmcHhMQ2VUVktmQVo0bVRKRHdPbmVsU2pYRGk2bk9h?=
 =?utf-8?B?M0FMRThmTjVnU1hVNForUGx1VXcvelpld25JMVhYVkFzMURack5WTm1YKzkr?=
 =?utf-8?B?aENvdHEzbkpNU0ZtVlZKb3BEbGRUeXpsczVOMzVlOWNQT2VBbGJZTUJ2TkpS?=
 =?utf-8?B?Y0NYVmRXS3lyNElPNC9ZdDR6MC9lSFBldjBheHQzSDlMZ2hFQVBMUG5YRk0r?=
 =?utf-8?B?dEpraXdrTjd6RUlyMjVlaHIzd2xIS2RCZ1EwSnh0ZDA2aVcrWmVxekxxMnYr?=
 =?utf-8?B?MlNRdFUyTk82VkVXYTJ0Mi9BZEhvaVE4UmIwL3VWNmthTzN2MHk0ZWZwQ0VC?=
 =?utf-8?B?OUpYZ0J5bExhMCttNEY1Y2p4a2JwKy9tSXNrNmhWVDQ2WGZNYWl6MmswbXpp?=
 =?utf-8?B?bmtKVnlWY3dvTmxHVUVLOEZ5Z0RxQmdZUnhRVTFjUklaOG4wWXN3UDJ6S3Nq?=
 =?utf-8?B?U0R5VWpEd3lENHJ6akROdEZJOG1zYTl5VWtIaS9JNHR5ZmlqaEtRbWNoUGc4?=
 =?utf-8?B?a1RKUkxvRk1jVml6Um50Sy9KaDBrVkJ1elMyYksvVm52dEM1dktSWVpVZ0VW?=
 =?utf-8?B?MVFUOVlaWHB0TVR1Q3pyMmQxVHJpWkRkWGIwb1VGQkdsTUpscGZtd0g1UVpZ?=
 =?utf-8?B?Tm9CYjY4dWlyMnMxU285anFGTndQVGw2aFhGaks4ZjNJd3QwZUNKNC8vT3Jy?=
 =?utf-8?B?VGFwQ0x0akxnSU94aXBGYUFlYVlaR0VWVWRDd0pmYTJxZWQ4QVJwbk1pVWlQ?=
 =?utf-8?B?VURwS1J2eW04NzRodHpsN2NCcmwrem9rTjN3V2g1RFp0N3FURTA4K0hqRXhT?=
 =?utf-8?B?NUg4QWVONzJvaGlCRml1c0xaaXhqRXlwSGJUbkpIdW9MMWdsTU1kMWRza0Vq?=
 =?utf-8?B?L2xzcmVBd1hYVjY5ekxVRDlBQnhSbStlaklsMUROaHNURHJ3RFJMdTIvdHVp?=
 =?utf-8?B?d2FyQ2hWbmVWWWdjNy9QcDlBVzJoWGFUbEg3TmdlZzhwSW1pdnB5Rk5VdDFu?=
 =?utf-8?B?bnlBejJUU2RLZCt6VTlnQ1BJN3gvWHMwbHl2MWN1S0RRV0tZWEkzZ0Y0UFgy?=
 =?utf-8?B?TTFzT2hPUzZhQzdsaDAxRnZDNGJ5czFGL1d2elhtTDkxak4yODFFL01QZm0r?=
 =?utf-8?B?UXo2ekpTWU5iVC9rTHNqYklxKys3a3paM3UyMlNValB2dGlsWTBpSUhzMXlx?=
 =?utf-8?B?YVRKbDlEcml3bWQ4TzZ5WE5LekJ0TTRXL0VrdnQ3QWswc3QwR1RweXZsZUZa?=
 =?utf-8?B?by82VkZaeDN6VVFxM213Q1dSM0l2RFdrWkJkTFdZNStGL25tdTlEUzNrNkRR?=
 =?utf-8?B?ODVwdWs5SmNneUtTb0syL3grVTBxSkw5WmhuUnllWnFudzdFeWQ1Rk5wbXlh?=
 =?utf-8?B?WlNMVEJoOVNiRFBUYitNSDN1MXRFRUdRN1lWaVB3eTVBcDNIcXNDaE5sQ1Fp?=
 =?utf-8?B?RkpOTkJXalpEY1I2VTRYTXBxMFBsbHhlRlFtdlBpQis0VzJiWU44dHJneVJG?=
 =?utf-8?B?L0NoQ0pWM0k2NEc1dHh4ZCtVMjFoajBEaHp3TnRVZkIvNEtrWHFnaGc3U3Bo?=
 =?utf-8?B?Q2NpWXk1dGFtQ2dHNVVPNEhIcnVwMkFTd09tbkRadlI0WWk2T2J1cEFRTlJH?=
 =?utf-8?B?QXVzZzA3QlRZYUk4ZjFScS9jVll5V0UxREVwaFpBalRKekgvWm0yS0hrc3hI?=
 =?utf-8?B?UytKLzBINU1JZTR1aW1yOU93UFlTcjEyUlpYU2RGdEpKbndUUkRFV2VKN01D?=
 =?utf-8?B?UlZWNno2N1plTmM0Z3MxWi9DY0FLVjRkcmVhODB6TXFKZWhMZE4xUnVzQUZE?=
 =?utf-8?B?ek9kZGJKa3ErRDBkUGUyb3FKaDd5ZHNlTHRQYmZRRFBqd1U1dlE1ODhFN0kx?=
 =?utf-8?B?MFRuUGo2WEtZSmFVSHhsUXJETU5OR3Z3UWphSzNDK0NsWDVDdUk5cFB3Ujlm?=
 =?utf-8?Q?GyECRpgXz1R6PJWkrUEgMO89s?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2110.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abdf34c4-0c1e-4c78-fc6e-08da81837702
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 01:38:06.3573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ENorAjQCl+CjOUl5wVkQfOdQAg1qS/aUJW/3bnx+k5eFCCKphTyVjK7nL4s94DVt9sxr3Vu8dEqK0/oB6IihdCLcCqtg9+KHghXcyE2O830=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2107
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=zhenzhong.duan@intel.com; helo=mga14.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFBhb2xvIEJvbnppbmkgPHBh
b2xvLmJvbnppbmlAZ21haWwuY29tPiBPbiBCZWhhbGYgT2YgUGFvbG8gQm9uemluaQ0KPlNlbnQ6
IFdlZG5lc2RheSwgSnVseSAyMCwgMjAyMiAyOjE5IEFNDQo+VG86IENocmlzdG9waGVyc29uLCwg
U2VhbiA8c2VhbmpjQGdvb2dsZS5jb20+DQo+Q2M6IER1YW4sIFpoZW56aG9uZyA8emhlbnpob25n
LmR1YW5AaW50ZWwuY29tPjsgcWVtdS0NCj5kZXZlbEBub25nbnUub3JnOyBtdG9zYXR0aUByZWRo
YXQuY29tOyBsaWtleHVAdGVuY2VudC5jb207IE1hLA0KPlhpYW5nZmVpWCA8eGlhbmdmZWl4Lm1h
QGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1BBVENIXSBpMzg2OiBEaXNhYmxlIEJUUyBhbmQg
UEVCUw0KPg0KPk9uIDcvMTgvMjIgMjI6MTIsIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6DQo+
PiBPbiBNb24sIEp1bCAxOCwgMjAyMiwgUGFvbG8gQm9uemluaSB3cm90ZToNCj4+PiBUaGlzIG5l
ZWRzIHRvIGJlIGZpeGVkIGluIHRoZSBrZXJuZWwgYmVjYXVzZSBvbGQgUUVNVS9uZXcgS1ZNIGlz
DQo+c3VwcG9ydGVkLg0KPj4NCj4+IEkgY2FuJ3Qgb2JqZWN0IHRvIGFkZGluZyBhIHF1aXJrIGZv
ciB0aGlzIHNpbmNlIEtWTSBpcyBicmVha2luZw0KPj4gdXNlcnNwYWNlLCBidXQgb24gdGhlIEtW
TSBzaWRlIHdlIHJlYWxseSBuZWVkIHRvIHN0b3AgInNhbml0aXppbmciDQo+PiB1c2Vyc3BhY2Ug
aW5wdXRzIHVubGVzcyBpdCBwdXRzIHRoZSBob3N0IGF0IHJpc2ssIGJlY2F1c2UgaW5ldml0YWJs
eSBpdCBsZWFkcw0KPnRvIG5lZWRpbmcgYSBxdWlyay4NCj4NCj5UaGUgcHJvYmxlbSBpcyBub3Qg
dGhlIHNhbml0aXppbmcsIGl0J3MgdGhhdCB1c2Vyc3BhY2UgbGl0ZXJhbGx5IGNhbm5vdCBrbm93
DQo+dGhhdCB0aGlzIG5lZWRzIHRvIGJlIGRvbmUgYmVjYXVzZSB0aGUgZmVhdHVyZSBiaXRzIGFy
ZSAiYmFja3dhcmRzIg0KPigxID0gdW5hdmFpbGFibGUpLg0KPg0KPlRoZSByaWdodCB3YXkgdG8g
Zml4IGl0IGlzIHByb2JhYmx5IHRvIHVzZSBmZWF0dXJlIE1TUnMgYW5kLCBieSBkZWZhdWx0LCBs
ZWF2ZQ0KPnRoZSBmZWF0dXJlcyBtYXJrZWQgYXMgdW5hdmFpbGFibGUuICBJJ2xsIHRoaW5rIGl0
IHRocm91Z2ggYW5kIHBvc3QgYSBwYXRjaA0KPnRvbW9ycm93IGZvciBib3RoIEtWTSBhbmQgUUVN
VSAodG8gZW5hYmxlIFBFQlMpLg0KSGkgUGFvbG8sDQoNCkNhbiB3ZSBhc2sgdGhlIHN0YXR1cyBv
ZiB5b3VyIHBhdGNoPyBRQSBzdGlsbCByZXByb2R1Y2Ugd2l0aCBuZXdlc3QgdXBzdHJlYW0gY29k
ZS4NCg0KVGhhbmtzDQpaaGVuemhvbmcNCg==

