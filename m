Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875FA59934C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 05:04:54 +0200 (CEST)
Received: from localhost ([::1]:34572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOsJY-00069U-IW
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 23:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oOsEq-0002TC-To
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:00:00 -0400
Received: from mga12.intel.com ([192.55.52.136]:48641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oOsEn-0005yr-05
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660877997; x=1692413997;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EEUYUsBdivgQ/Xq+0KjgcpPOBb5G42u1mDY+aql6+7o=;
 b=CtBDgqL5wDVAk5XSi8Xuv5ykZGu8mFXEBwiJnq7YQSRC04dmangSJSE3
 H6qDJ7Ehq4MGr8/byKDeH8AMAjs46C8qmVRqsAeT5+tIvHdATGhjj12mW
 +0C6LLHsv687aZ1YlMoOHOW8hUwNK4lA54EjtrHad1tO85EpfSpsxWglV
 e0OL2GkV1ZSPHx9ZAW6s7Dk7PtbCRruZWZVeAqFMuduxFUmyaoS4UZD4G
 ltuawPDnF/EKH8vqbtP4P0h1yGRlT/IsB0sNPydrXwgpKeVTN/kX69WGR
 qWt31goBs3F89xwRqEDSrExn9Tc59IjLPKaLAFDmUcYQQohqI4BMXn7HL w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="272693858"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="272693858"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 19:59:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="558786019"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 18 Aug 2022 19:59:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 18 Aug 2022 19:59:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 18 Aug 2022 19:59:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 18 Aug 2022 19:59:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 18 Aug 2022 19:59:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xlf/lAZDTjSnBua1T7NH4oG6CXp4DY9pdfZgP548KaT5LI5xSDE6xr1UXpX1redpbfURtJkl5cDC34R/4pz5u3btJGVFuwVr84/y9R+FB2+a55n/SeBH1BL32JBNVcvHQJ6aC6mJNXviihL3lD/rzI0Is/9jgUIR0GPxwaLS5mHkTKsz10Wdnv+2fffYthJMH502PSDgSWcG04SmhICXs4tIj0xurIyox8/Efl5ZTHrmNCA08nWSsBg1OZyo4/WdvBRlCWS/jh75/TWcV/cNeJPT4uCWZfCvjmAcYedcKVBcfvP3GEkeLlixuCho5KMqXgp9syE/ehjAAXvlfK42Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEUYUsBdivgQ/Xq+0KjgcpPOBb5G42u1mDY+aql6+7o=;
 b=UPpvCkIJ6Ni9gUiZCtr5LWiW+WqJkm9fgQlLwnXrmAnXQwsVycNyCKaitqG6s7HiExxuQjDzm14oalo37eMS2P/ILTgTZC3rXLt4x1VzouI0bAXO0WiGnNRoW5JmS2ZR2Z8xAV0MC1+VRTMPeac6uSU4tlDRvmp4t8dVCWWQ4dNKn5yV67/pZqj331E1Wv84Suq1rkGbIIlyYev9ApLo+BLBRNC0LdEqtYlN/zzkk0OaqzfDoQD83VEMATAKe7DFtQkRj562YXKJhCEWBx+4KdmiYF7p33fTxCLeQGAQ73X2I07gYKD6FrpM+x6I5HbMfDo865AIckWIhxaKwe6cdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by DM5PR1101MB2139.namprd11.prod.outlook.com (2603:10b6:4:56::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 19 Aug
 2022 02:59:23 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee%7]) with mapi id 15.20.5504.028; Fri, 19 Aug 2022
 02:59:22 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
CC: Peter Maydell <peter.maydell@linaro.org>, Li Zhijian
 <lizhijian@fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Subject: RE: [PATCH V4 RESEND] net/colo.c: Fix the pointer issue reported by
 Coverity.
Thread-Topic: [PATCH V4 RESEND] net/colo.c: Fix the pointer issue reported by
 Coverity.
Thread-Index: AQHYq87t3Q56oSRNMkypjwO6rW/3aa2ywqEAgAGX6QCAATlZsA==
Date: Fri, 19 Aug 2022 02:59:22 +0000
Message-ID: <MWHPR11MB0031FCEA3B5928A01AF5EAD99B6C9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220809084854.217943-1-chen.zhang@intel.com>
 <MWHPR11MB0031A51C861DF8C6CB520E909B6A9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEteTx2szBPHMPL3UkDxRnf_9DUP3WRD+hxwCo5EgiLjjg@mail.gmail.com>
In-Reply-To: <CACGkMEteTx2szBPHMPL3UkDxRnf_9DUP3WRD+hxwCo5EgiLjjg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a41c2bd7-aac1-4621-346a-08da818ed185
x-ms-traffictypediagnostic: DM5PR1101MB2139:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P9FCiPFsLw+tEAL/u78oILEyFM5wB8PFBhQUuTFj+PhW2oT57zvZClchPKNRsowChePHOIinv/bwjysKjps3uT/mxRtbVlbvLI/phbibSY07A44wOxxEH48e+6SBxzCmQELW8qMOIe5MefwFn1xGcdhxj0SG1bIEK6mFKJXVi6VlOpsRzzuT9bxKvQUQ6Sj65CD5AEoL1U2vmA9I9ga6AXy0NJIp3xPL3CPsIHLm3yCWKW5r7y/CC2tgjbzj/J82npT/hhq9RHBw031r5m35yPQHWqBB/id9xhF5Nh0WjKZxNSbSMJnL311pK78VK1T1r35UyjaGX5MorimQ4XUtBnwhnov0iEyggBqa/o2t5f2DkZ03VYISwGPEsisI/fzcg6eRBr0QRe+4cEhUbe+ezOy4579oj1zWqcrQjFJ/dJxybcJFTBHHAxspo8TCZqw2abR1txLOjYe7wm/4nFl7myT3etMAL3LaE3FbUKhTIzkAiDdeLXbmi1h5EWIHikoBaw2w4WDjH5JzflbmKkXK8iHopx9kdzQKWTd9Vhl92nxqoXmLjSDN/6pu9+btUcppNbJaaLBJR+YlWgpCDK3k8vvc/oLaqXoCFg3Ixktm6R/v88ZFGuSLGwa85G8CyWRMckFuA2CCv2HXErBLSjLPd8/V2ii0UquK9zfkXylGQY7TkwH052O960IxJkY23N2jDjPyoZY426ocW1s41/+p845D1diZpjqjbVg46vCwZT4tTWtbO+DI/ET9VzSzL2o1uNSswP4qmgNCZA2Yo72sEg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(39860400002)(136003)(366004)(376002)(38070700005)(478600001)(82960400001)(186003)(122000001)(26005)(83380400001)(9686003)(7696005)(6506007)(41300700001)(71200400001)(53546011)(38100700002)(2906002)(33656002)(8936002)(5660300002)(52536014)(55016003)(54906003)(66946007)(66556008)(4326008)(64756008)(66476007)(8676002)(86362001)(76116006)(66446008)(316002)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SEphVTRIQk5wSHo0WnBGM2VxT3J3dTVUQXdHc3VodG5pMjdjRUdOUW54ZkhF?=
 =?utf-8?B?REY1M2M5TFd5bUxTT05Kc1BJZlZKNTlQTkliY0x3RjFCVWU3eklkbTBwTkMw?=
 =?utf-8?B?Wm03V2FscUM0TGpaZERHN05qNWdoUHNQRTQzNDBhbHpHOHlWL0tZWjIvUFdO?=
 =?utf-8?B?SWJkMmg4MWlCdVB6eFNXNTV0UGlWcG83MklIWXU1RmpKOVkwYnUyckxxTER4?=
 =?utf-8?B?cHRDSjdBcEUza0VINEV6VmE5WXJGOXlVYnVONGVFdlQxRXMxekdod3NPT2d1?=
 =?utf-8?B?UVByK0pkVnpCcVR4NzVuSWdlN3J6dUgzR1pMYjlRQ0FMRld0SnR6UjJIeHdz?=
 =?utf-8?B?K2VnZDJ4T1pOQk9pOVVMeTNiNXMyZEFsWC9BbEtITGpXL0RqOFR3T0JOUnlV?=
 =?utf-8?B?ZkE3QzB3dTc2N2tQNmxRcUFNUUNIMDJKTHZzT3A4dThXQ0Q4NlI0L3JtcGVJ?=
 =?utf-8?B?UjNNMHBHdC9DcHMzVi80QjhSUFIyaVdzRW5tNlBnbXZDMkNrTHhDeGpkRTVj?=
 =?utf-8?B?TVZ6a2FHeVRIWGVLbG5xUy80UHh5eTVNaVh3U04rMGFrWVNyV2taK0JqZ085?=
 =?utf-8?B?ZnZFdDU0R0Q2cW9pck5GbDRrY2thaS9qME5ZYzJpUDNoY1c5Rk9aQ2t6Umhm?=
 =?utf-8?B?eEgyblpYVHo5L05hVDAwSFBFYUhJdTFnOWs5TGtjU1VFWllYSXIvOTdMYmFi?=
 =?utf-8?B?Q0lLV0pwRERFWi9aRFpCbHlnaHVJYnErTUVxZTV0cFY4WnFaNkFrRGh4L1Q4?=
 =?utf-8?B?RW90S29XVExPdVpuZlBiUDhPZGdvbmN3THJkRWNTMmVyVStIRXZaTVhDcmpO?=
 =?utf-8?B?M0NhM2VOc2FsZEtaTTNzVVlKNE1va1RyMHV4bStKNmhCU2FPNjU5Z2c5VFFo?=
 =?utf-8?B?QUJkeDdXZUthYkZsZ1I2eTI0RG9wYUN5RmVWaW5Gb1pyV1M0Q0VzMWNUZG9i?=
 =?utf-8?B?ME5NcFRsbzVzS1lSbkdZWXR1SUVTNzJ4YUpFVWNBQThyQTc1S3JZZTIyNG5z?=
 =?utf-8?B?Yi9HaXNIaTMySXlPSFZ6NzFLWmNEVW12U2psdTFXQnNzWFh0Qmt0MTY0ZEVI?=
 =?utf-8?B?SVhMMzJsYVFDaG9lTUlzREtLREo4alBwUHhoeGRHaVBzVHVIWkdoYSsyYVdn?=
 =?utf-8?B?dDJHQXVDRXd3S3ZqcTJJSC8rWVpSZ2VSdU00STFlZkk1eEtvK3BUTUxDbHVM?=
 =?utf-8?B?MGxDUFF1U25Qc2I0ZHYycmVQZUJrTmFMdmJZQjBVRnFCekNQamZjbGR0ZEtl?=
 =?utf-8?B?UFlsSlV1ZG52NGZEdE5rVmwyMWJmS3ZMR2pXQXlteEZRTU9PcHRWZkVXamNr?=
 =?utf-8?B?NU9GdXJ2TXlIa0swUkVzZXJQanhlNDBHNVdFY0UzQy96VzhTSWhRS0U1NDJY?=
 =?utf-8?B?M1BvbHhlRGZvUVlrRnB6Y0dVRXJ6ZURZZHN6Yzk3ZkxWaWFFcnlsZDY3aDdp?=
 =?utf-8?B?OTBzMHZxY3I3WStZVEU5cmtmRDNZOHdhdU9SUFc1enpibDJvNHV6am1zU3lW?=
 =?utf-8?B?ODFGUUQ5QTJ3MG5XMlpkY3FmUm45NS9hWGZXRDhqbEl3ZDJab1FoSk9qdG9M?=
 =?utf-8?B?aDV3emJNRnpCelg5V3JiWnhsbTEvV2o4TDZLUW92akJpZm55TG1nMVdtSDc4?=
 =?utf-8?B?NCtjYkxaMUUvU3kvTnIyei90ejBtOTFZK1N3YVY1OVlHRVVHMHNUay82bytr?=
 =?utf-8?B?czZ5dnNtd1ZpWmJ0Yk44ODBnRU1mWHFBWDFIVjVWZEVmZ01sNEN5dWJERUdi?=
 =?utf-8?B?WkxRSUU0SFZ3dWN3b3RUWkY1QWovWlFMZUhoRFJ0dlptZmFFMDBLY0lJSnF4?=
 =?utf-8?B?aklud1ZSTHFGcWZSQkZKdlcvT3JQRzYzVWw0OXdaYXVkazk5RmZjZ1A2ZzJ0?=
 =?utf-8?B?UEV1OUtuUEIxcm8xMmQ4bVU5cyt4SWRVZnUrUTBUa1kzME1rNGVLdkczbU1X?=
 =?utf-8?B?SFhiUFh1em5DTWRRR09WR1lNZEd3YmpDRTNrWnZsODY5WG96Q1BjVURTRFU0?=
 =?utf-8?B?Y2FMS3ZjR0lySGZiSG5YL3JLVUtIbFlZMCtVazJjdWlEL05ZZTd6Ny8yRTBS?=
 =?utf-8?B?MlhDVXl1ZGhwZ0c1ejFUa21ydFh5TU5iWVE4bWdrQXZNQm9kRHo1TmxVZmlL?=
 =?utf-8?Q?tLkCUaqi/ZMiJiVDFynmZD6HJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a41c2bd7-aac1-4621-346a-08da818ed185
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 02:59:22.6697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: myMnNQzLtTBihWPIcG8wNJywR1fnYZubq9Sd6XjgEQQ3xKyOYaDPxNKW32HzBLpb6YOHvcgXxtyQ8VVcaULiCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2139
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136; envelope-from=chen.zhang@intel.com;
 helo=mga12.intel.com
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCAxOCwgMjAyMiA0OjA0
IFBNDQo+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+DQo+IENjOiBQZXRl
ciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+OyBMaSBaaGlqaWFuDQo+IDxsaXpo
aWppYW5AZnVqaXRzdS5jb20+OyBxZW11LWRldiA8cWVtdS1kZXZlbEBub25nbnUub3JnPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIFY0IFJFU0VORF0gbmV0L2NvbG8uYzogRml4IHRoZSBwb2ludGVy
IGlzc3VlIHJlcG9ydGVkIGJ5DQo+IENvdmVyaXR5Lg0KPiANCj4gT24gV2VkLCBBdWcgMTcsIDIw
MjIgYXQgMzo0NSBQTSBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+IHdyb3RlOg0K
PiA+DQo+ID4gUGluZy4uLi4gIEphc29uIGFuZCBQZXRlciwgYW55IGNvbW1lbnRzIGZvciB0aGlz
IHBhdGNoPw0KPiA+DQo+ID4gVGhhbmtzDQo+ID4gQ2hlbg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50
ZWwuY29tPg0KPiA+ID4gU2VudDogVHVlc2RheSwgQXVndXN0IDksIDIwMjIgNDo0OSBQTQ0KPiA+
ID4gVG86IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+OyBQZXRlciBNYXlkZWxsDQo+
ID4gPiA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPjsgTGkgWmhpamlhbiA8bGl6aGlqaWFuQGZ1
aml0c3UuY29tPjsNCj4gPiA+IHFlbXUtZGV2IDxxZW11LWRldmVsQG5vbmdudS5vcmc+DQo+ID4g
PiBDYzogWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPg0KPiA+ID4gU3ViamVjdDog
W1BBVENIIFY0IFJFU0VORF0gbmV0L2NvbG8uYzogRml4IHRoZSBwb2ludGVyIGlzc3VlDQo+ID4g
PiByZXBvcnRlZCBieSBDb3Zlcml0eS4NCj4gPiA+DQo+ID4gPiBXaGVuIGVuYWJsZWQgdGhlIHZp
cnRpby1uZXQtcGNpLCBndWVzdCBuZXR3b3JrIHBhY2tldCB3aWxsIGxvYWQgdGhlDQo+IHZuZXRf
aGRyLg0KPiA+ID4gSW4gQ09MTyBzdGF0dXMsIHRoZSBwcmltYXJ5IFZNJ3MgbmV0d29yayBwYWNr
ZXQgbWF5YmUgcmVkaXJlY3QgdG8NCj4gPiA+IGFub3RoZXIgVk0sIGl0IG5lZWQgZmlsdGVyLXJl
ZGlyZWN0IGVuYWJsZSB0aGUgdm5ldF9oZHIgZmxhZyBhdCB0aGUNCj4gPiA+IHNhbWUgdGltZSwg
Q09MTy0gcHJveHkgd2lsbCBjb3JyZWN0bHkgcGFyc2UgdGhlIG9yaWdpbmFsIG5ldHdvcmsNCj4g
PiA+IHBhY2tldC4gSWYgaGF2ZSBhbnkgbWlzY29uZmlndXJhdGlvbiBoZXJlLCB0aGUgdm5ldF9o
ZHJfbGVuIGlzIHdyb25nDQo+ID4gPiBmb3IgcGFyc2UgdGhlIHBhY2tldCwgdGhlDQo+ID4gPiBk
YXRhK29mZnNldCB3aWxsIHBvaW50IHRvIHdyb25nIHBsYWNlLg0KPiA+ID4NCj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFpoYW5nIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+
ID4gPiAgbmV0L2NvbG8uYyB8IDE4ICsrKysrKysrKystLS0tLS0tLQ0KPiA+ID4gIG5ldC9jb2xv
LmggfCAgMSArDQo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9uZXQvY29sby5jIGIvbmV0L2Nv
bG8uYyBpbmRleCA2YjBmZjU2MmFkLi4yYjU1NjhmZmY0DQo+ID4gPiAxMDA2NDQNCj4gPiA+IC0t
LSBhL25ldC9jb2xvLmMNCj4gPiA+ICsrKyBiL25ldC9jb2xvLmMNCj4gPiA+IEBAIC00NCwyMSAr
NDQsMjMgQEAgaW50IHBhcnNlX3BhY2tldF9lYXJseShQYWNrZXQgKnBrdCkgIHsNCj4gPiA+ICAg
ICAgaW50IG5ldHdvcmtfbGVuZ3RoOw0KPiA+ID4gICAgICBzdGF0aWMgY29uc3QgdWludDhfdCB2
bGFuW10gPSB7MHg4MSwgMHgwMH07DQo+ID4gPiAtICAgIHVpbnQ4X3QgKmRhdGEgPSBwa3QtPmRh
dGEgKyBwa3QtPnZuZXRfaGRyX2xlbjsNCj4gPiA+ICsgICAgdWludDhfdCAqZGF0YSA9IHBrdC0+
ZGF0YTsNCj4gPiA+ICAgICAgdWludDE2X3QgbDNfcHJvdG87DQo+ID4gPiAgICAgIHNzaXplX3Qg
bDJoZHJfbGVuOw0KPiA+ID4NCj4gPiA+IC0gICAgaWYgKGRhdGEgPT0gTlVMTCkgew0KPiA+ID4g
LSAgICAgICAgdHJhY2VfY29sb19wcm94eV9tYWluX3ZuZXRfaW5mbygiVGhpcyBwYWNrZXQgaXMg
bm90IHBhcnNlZCBjb3JyZWN0bHksDQo+ICINCj4gPiA+ICsgICAgYXNzZXJ0KGRhdGEpOw0KPiA+
ID4gKw0KPiA+ID4gKyAgICAvKiBDaGVjayB0aGUgcmVjZWl2ZWQgdm5ldF9oZHJfbGVuIHRoZW4g
YWRkIHRoZSBvZmZzZXQgKi8NCj4gPiA+ICsgICAgaWYgKChwa3QtPnZuZXRfaGRyX2xlbiA+IHNp
emVvZihzdHJ1Y3QgdmlydGlvX25ldF9oZHJfdjFfaGFzaCkpIHx8DQo+ID4gPiArICAgICAgICAo
cGt0LT5zaXplIDwgc2l6ZW9mKHN0cnVjdCBldGhfaGVhZGVyKSArIHNpemVvZihzdHJ1Y3Qgdmxh
bl9oZWFkZXIpDQo+ID4gPiArICAgICAgICArIHBrdC0+dm5ldF9oZHJfbGVuKSkgew0KPiA+ID4g
KyAgICAgICAgdHJhY2VfY29sb19wcm94eV9tYWluX3ZuZXRfaW5mbygiVGhpcyBwYWNrZXQgbWF5
IGJlIGxvYWQgd3JvbmcgIg0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAicGt0LT52bmV0X2hkcl9sZW4iLA0KPiA+ID4gcGt0LT52bmV0X2hkcl9sZW4pOw0K
PiANCj4gTml0OiBJIHRoaW5rIHdlIG5lZWQgdG8gYmUgdmVyYm9zZSBoZXJlLCBlLmcgcHV0IHRo
ZSBwa3Rfc2l6ZSBoZXJlIGF0IGxlYXN0Lg0KDQpPSywgSSB3aWxsIGNoYW5nZSBoZXJlIHRvOg0K
LyoNCiAgKiBUaGUgcmVjZWl2ZWQgcmVtb3RlIHBhY2tldCBtYXliZSBtaXNjb25maWd1cmF0aW9u
IGhlcmUsDQogICogUGxlYXNlIGVuYWJsZS9kaXNhYmxlIGZpbHRlciBtb2R1bGUncyB0aGUgdm5l
dF9oZHIgZmxhZyBhdCB0aGUgc2FtZSB0aW1lLg0KICAqLw0KdHJhY2VfY29sb19wcm94eV9tYWlu
X3ZuZXRfaW5mbygiVGhpcyByZWNlaXZlZCBwYWNrZXQgbG9hZCB3cm9uZyAiDQogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAicGt0
LT52bmV0X2hkcl9sZW4iLCAgcGt0LT52bmV0X2hkcl9sZW4sIHBrdC0+c2l6ZSk7DQoNClRoYW5r
cw0KQ2hlbg0KDQo+IA0KPiBUaGFua3MNCj4gDQo+ID4gPiAgICAgICAgICByZXR1cm4gMTsNCj4g
PiA+ICAgICAgfQ0KPiA+ID4gLSAgICBsMmhkcl9sZW4gPSBldGhfZ2V0X2wyX2hkcl9sZW5ndGgo
ZGF0YSk7DQo+ID4gPiArICAgIGRhdGEgKz0gcGt0LT52bmV0X2hkcl9sZW47DQo+ID4gPg0KPiA+
ID4gLSAgICBpZiAocGt0LT5zaXplIDwgRVRIX0hMRU4gKyBwa3QtPnZuZXRfaGRyX2xlbikgew0K
PiA+ID4gLSAgICAgICAgdHJhY2VfY29sb19wcm94eV9tYWluKCJwa3QtPnNpemUgPCBFVEhfSExF
TiIpOw0KPiA+ID4gLSAgICAgICAgcmV0dXJuIDE7DQo+ID4gPiAtICAgIH0NCj4gPiA+ICsgICAg
bDJoZHJfbGVuID0gZXRoX2dldF9sMl9oZHJfbGVuZ3RoKGRhdGEpOw0KPiA+ID4NCj4gPiA+ICAg
ICAgLyoNCj4gPiA+ICAgICAgICogVE9ETzogc3VwcG9ydCB2bGFuLg0KPiA+ID4gZGlmZiAtLWdp
dCBhL25ldC9jb2xvLmggYi9uZXQvY29sby5oIGluZGV4IDhiM2U4ZDVhODMuLjIyZmMzMDMxZjcN
Cj4gPiA+IDEwMDY0NA0KPiA+ID4gLS0tIGEvbmV0L2NvbG8uaA0KPiA+ID4gKysrIGIvbmV0L2Nv
bG8uaA0KPiA+ID4gQEAgLTE4LDYgKzE4LDcgQEANCj4gPiA+ICAjaW5jbHVkZSAicWVtdS9qaGFz
aC5oIg0KPiA+ID4gICNpbmNsdWRlICJxZW11L3RpbWVyLmgiDQo+ID4gPiAgI2luY2x1ZGUgIm5l
dC9ldGguaCINCj4gPiA+ICsjaW5jbHVkZSAic3RhbmRhcmQtaGVhZGVycy9saW51eC92aXJ0aW9f
bmV0LmgiDQo+ID4gPg0KPiA+ID4gICNkZWZpbmUgSEFTSFRBQkxFX01BWF9TSVpFIDE2Mzg0DQo+
ID4gPg0KPiA+ID4gLS0NCj4gPiA+IDIuMjUuMQ0KPiA+DQoNCg==

