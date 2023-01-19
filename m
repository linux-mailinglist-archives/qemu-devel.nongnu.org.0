Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E986738D3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 13:41:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIUE5-0008Qn-BZ; Thu, 19 Jan 2023 07:41:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1pIUDm-0008H0-QP
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:40:54 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1pIUDh-0008VW-Kw
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674132041; x=1705668041;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TTc8yYn256WvxuV1x3qSTfg82EL1FVsPnvjQtojiVLc=;
 b=i69Jshd7o5c42Uw0/BjFrb7gbCwxxhAI33dTOS0kI9ZQRjhyMjyp5xtm
 4OiVBPL7BSvuYgNLwy/DCiYdIqrDl0hwaLQgxaZoUVcg3dfQut9aadcV6
 uhwaBbUJ9chU68ZbdBln5IrLHNSrEG3RsL18uCKkoNdWrI9nX9UN5KdP7
 cPxEHfAEFmmgphb78ZIIAbT1dqFVdhIusumwkKOfMgdqF81+w34fVp8Pf
 lMEi0bnYhMcH9lRyXkglKKoCFUai3wqCvIH9oxArFRLsk9pEfqMEnD9MI
 mJ3HAPStgdbxLPIaG6Nl2lSONJWiM2HNCjQg7vBjCn2A7RnZLy71wNiWX g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="313149895"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="313149895"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 04:40:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="988979324"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="988979324"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 19 Jan 2023 04:40:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 04:40:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 04:40:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 04:40:37 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 04:40:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRsep7eehRFWccrMwmoJheoBVQ1JNEUqxmS6ScdVbrEYRKr+JvxHbyB4jCSofvCijlamAHgrQg1oju5X6/QvjZZvzLw5GoYkbxe5HqNy0IDhGDDMQBvQC3GsiCMoOU+toRyTjAzeYTNVro08kuSegFxjVAjwx3Z3VqAGr/uHmHUm+EddxKNNLnhjxTp5RZp/TH+ZmpxMpGhoidrOZWnBDEE/3XowOR5LybF/B/dFnVeeg0eWeLh2yqkK4cEfrMZf2qUEb2jlTRWUdGQC4EUz8E1Eg0MnPuZNZQO2VrsBlZbLdPEEsmj4STxp1Xr7vh5Cg2fPwaLIJ9VRVGkL2Rmdog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTc8yYn256WvxuV1x3qSTfg82EL1FVsPnvjQtojiVLc=;
 b=Hm/JDT0fWaJH5jJszeZ+3+LJ1hNIZpKDu4Vp8+xIPMQj8Yd07gOwbHudiUWRZJAgwURheXNmhoHWOlhRy8pkSgMR494nyOaXFp7jezByuqu+p5+5jwzuvG5g3ExeyVBaT8h0Y9t1J5oZaMvS1IhtW/DS5x3hNu9pcZOx+OeWlihkro7hFJjlEzYeZ90a9Xt56NB2c5zuG1IXOUDY0U2nD3Mf30MbPSzN17haU2hINKbDH9NXrDDzoSvdrEp+nUW4pKDlG08aRCQvsyljAfIbbh8X28JUVmVecuffZf5LwkwQpzjR9yaZE2EpCesyiFYUVqGL6f8rDOy4aKgrVCV7Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4090.namprd11.prod.outlook.com (2603:10b6:5:195::10)
 by BL1PR11MB5317.namprd11.prod.outlook.com (2603:10b6:208:309::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 12:40:36 +0000
Received: from DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::e97c:4feb:6b7c:b7b3]) by DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::e97c:4feb:6b7c:b7b3%5]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 12:40:36 +0000
From: "Wang, Wenchao" <wenchao.wang@intel.com>
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>
CC: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, "Thomas
 Huth" <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, qemu-devel
 <qemu-devel@nongnu.org>, "Yuan, Hang" <hang.yuan@intel.com>
Subject: RE: Announcement of aborting HAXM maintenance
Thread-Topic: Announcement of aborting HAXM maintenance
Thread-Index: AdkruWN7/corCmiuS9Sltr/aEfp0IQANSEOAAAQbGJA=
Date: Thu, 19 Jan 2023 12:40:36 +0000
Message-ID: <DM6PR11MB40903B55C23D5140E5BEF17687C49@DM6PR11MB4090.namprd11.prod.outlook.com>
References: <DM6PR11MB40903663BB06C7A64136DF3587C49@DM6PR11MB4090.namprd11.prod.outlook.com>
 <Y8kXhd2EcRU2QxVC@redhat.com>
In-Reply-To: <Y8kXhd2EcRU2QxVC@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4090:EE_|BL1PR11MB5317:EE_
x-ms-office365-filtering-correlation-id: 976087aa-88f8-4de1-71b9-08dafa1a5ce2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1Eg6VUqqdRjKxk+Tj9/nv5xUq7M3ANFqWUjVSwkNh7X6qbvryt3wCWxq6v2scS188qQCCApBwu6B1sW2D7/MZeOMknOu9+tQAihgLPUE7zsLCdj+TCJeYnadK5mPR41kkxqETbqyySZurNGhnwOAMf64bHKHwED7nVQCFCsb5anxrGJuM2XrzSZTlxzitgcW9nxQN0ANTsEsx2y97ZJiUMw6Tvy1RnqMhtKPP+ZnsqigHJ/IfCET5vdHVZXGw4B0BC7XmPGV5OloB8tED9c3I6u5amrm9FlnuTuVuLOAB7lKC3BUHZuwUv9VnDKXnWfk3irLvqei+rlsfF5z6VrX1duXgJpvoPBsWj+6x4mpRroAm4LxDfU7E9n1ZI8V+aT+KOCesYTYz/1zhkensdylYSntCjT8ifi1mV+w6Faw3lJrTfNsSQ3rV22knWYpksL1wdkzjAfyTmOtXbsu0KlmxITEfqgLSUMJgr5YXdMMIdOZSEYNO+Gus8jppsZRRntSWUrZRk9HYujnfEfKhNm5m92HBM7CPhmKZMSYqfhmgyLb+Eh3p/QaCVmx5Kq3wjcmQB6ZBIwNwDKQHGzLFmy2ggkIKfsltv6PmKZT7wM2spD+pyN9iLU3hYDBE02m+WIDqvufiYadFm79D2p4lHefpAEP0qC/gbiL7lgiVNXfqlSI1ikCt1ho1BDYVpwumyBKaC6QSaUSHMSzyngksm+1+cL+73j0eSkn7lK9e5xMOH5nSzSe7PHHovjpFDFJq6HafEpVZaFajYuNkaNytmfEVQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4090.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(396003)(366004)(346002)(376002)(451199015)(38070700005)(86362001)(41300700001)(5660300002)(52536014)(8936002)(122000001)(82960400001)(33656002)(38100700002)(186003)(7696005)(966005)(71200400001)(54906003)(478600001)(83380400001)(53546011)(26005)(6506007)(9686003)(107886003)(8676002)(6916009)(316002)(64756008)(4326008)(66446008)(76116006)(66946007)(66476007)(66556008)(2906002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHNTMEQ3N0dRQVZ2czVWRFpZeVI3K3BuZkd1NzVqRmVvejk5T21XemFNd1ZC?=
 =?utf-8?B?eHdVV0ZaSENBRk1LUEUzYkZtaG1EWFUzVHoxR25oNnhXMmxmSXl5UzNrQnIv?=
 =?utf-8?B?MlFKaVFGNTU2NjFHK1R4Tno4dnk5MTE1WWF3NmJnKzhKQ1l2NG4wRVAwb3FD?=
 =?utf-8?B?QU9JYXkzRitJb1o4N0paRjdvNHBKZ0dDSnRTbVpHL1UrejRNVk5rcVVpeDMw?=
 =?utf-8?B?QTlrQ0VGbFlyTWt3VXlsL1k5WWhZc1BrVHFIcWdtU1daVG9zN2lGSFdCeDU2?=
 =?utf-8?B?ZUdhckVNU1VMUlVhanRlOXl5YWFhLzBqVzJNWExpRTlldjk5V3ZNRTVtcFoz?=
 =?utf-8?B?UktkdXUyeE9hMlh1aGN5UWpWV2ZKckJ0dTNlNEtYT0NHWWlYdytBbHoxS0ZU?=
 =?utf-8?B?UHJXL2pUdVJybm5LOFVYODFiNzY5ZGxsZFBFVzNJUmhNd1psdkoyUEduRTF3?=
 =?utf-8?B?NjNPWEFKMUZ0ZmwzTkJxakFudUQ2ZFQ3V0pvSnRWTWxRVVZyWlptNmtEOFJB?=
 =?utf-8?B?QmR0d2lkTXh3eUJ1SUZ3RlgzVmxUVFEwTlJtMW9tZEFCUGMwL3NzZFlhaXdU?=
 =?utf-8?B?QVVFZHhyam8vN1VkTlRpbzBPR25ORDJpdDh4L21jSVdWU0tvaFcxZWNreFpu?=
 =?utf-8?B?NmtDT1Nsd3QySnBvOWIvajU4R2hWR3JmcUpTeUtKYWJpcnRpZU5QNHdtNHZ6?=
 =?utf-8?B?RnFSSjZzMjBHWVdIYUx5WFFCY3lEbWhYWG11bzkzVTRpVU9Ub1ZtUTBCUEtM?=
 =?utf-8?B?WERyZFNRczhaUE93T3lZaHFtUTRCQWowQTRuTTNBR2o3YVdidlQyWm4rOEdy?=
 =?utf-8?B?MmZOek5VTnJoYng2UlVZQ3Rzem1vL1A1NlN1TGlibzZrVzdvYTZVTmNETllB?=
 =?utf-8?B?ZUdhZ0pDdWFKLzdOV3JOSlc4RkZCWTd0MlNYKzBXK0dMK1dWWlh6WWZ6Z25q?=
 =?utf-8?B?eXNpSjFaTWN5NUxBblNZMjRXYlVCVmUrZHJBMGlZR0puVnp0dWU3clFqT1FO?=
 =?utf-8?B?UHUxZ3B0NXV5YlVNdm5aWHVjdnhlSWJ4bVUwSTZIUWdoZ1k3QVNKVEVHcFNL?=
 =?utf-8?B?SlQ1VHBQa1JoSllEakdRUTZDUkVycVNtd3FxY3BmQzhGZjVCMjE1QzUvWGRL?=
 =?utf-8?B?RXVtRTRweFZwalpzWmJITU5ZSTBIbGVteHhhOFBUUXdwSXY4NUJHaENBMHdC?=
 =?utf-8?B?VXBabGFnWnNMTVNzcXB4aytlbEJLMDhzYTM0d2w2OCt3bDZOODg2QWFLM1NN?=
 =?utf-8?B?Nk9SNENtVFNjVExKQXJUZmMrb0VKdVVRMnFUcmJjUDIxbU9KSzBGT3NyU1Mz?=
 =?utf-8?B?b1BhWUZuYWszK2dnTlFqaW9sTUk5S3BITTErR3YzOXpEQms1R3NEYU9RaXhH?=
 =?utf-8?B?SE82Y3V2Nm9SOS96Y3dTMTJzTGZxdERWS21QSjMvak4vSjNRQnRpa2Vxbkoz?=
 =?utf-8?B?bmI4MFByZjREcnZ6SmFnUk9iSjkvWWQ4NkdENGFncldKKytDVGhwbWNwM1hh?=
 =?utf-8?B?QjhHRlB0cjIwdlFNelQrR0EwZC80T1pVbTlBeTU0WHdqTHptZ0FoYnVmODlP?=
 =?utf-8?B?WVVQS2lTcHowaHVWOGRzQlUwV2d1ODlTUUgzLzRYNTdnZllwbDZvdVZjMGdm?=
 =?utf-8?B?a1pwVXh2WFBQY09raEI4Y05SbXZGaDFPYjlZblVCOVZ1Z09xRytleDBBbFBv?=
 =?utf-8?B?YjRIR0pYaWo4N013dElmbXVBdFhZbEdQZXI1bmRTS0xDc0JhTVpqRHN5YlBy?=
 =?utf-8?B?TFZPN1ZIZ0xtTmoxUnhRVTU3NjV3T21RQTJxRXhoZE4xKzZsSGRBSi9XVHZ4?=
 =?utf-8?B?cjYvNURyQVpsWERRNUQ4bzlyZ0xZS3J0QWdmdk9PczZSdmpXTnZ1YUFrOXNX?=
 =?utf-8?B?eXhpeEplVkp4VmpvMXV6NXBzKzlVaVUzN2F2bFNuQzQ2TlpMV1FnMHEzSzN6?=
 =?utf-8?B?RElsMllILzR4L3FEazJUYnVZRXRObi9PK3hMcWpwVzZoODFOcGE5Kzhzc3lK?=
 =?utf-8?B?dUZHTVRWV1QzeVk0S2pIcTBXTCtlZG5aeEo3My9pamQ1U1ArM3RiS0JsVEVH?=
 =?utf-8?B?elNvbkVUa0FLWGthWFFPeC9naFcvVmZIQnM4dVgrMHZTWGl1R1N5b1dzOWQ0?=
 =?utf-8?Q?+S5vzRXl9VzFAtWwjSkg8nFbC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4090.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 976087aa-88f8-4de1-71b9-08dafa1a5ce2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 12:40:36.0315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1iNE9b8PppArJhx40kiPJ7+eBUGXfi0h8PjHOVma6j9K9zYmUYoga1VR+o5jPS5/uTJfcaJPb0M7DRYTr/7kww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5317
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=wenchao.wang@intel.com; helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

SGksIERhbmllbCwNCg0KVGhhbmtzIGZvciB5b3VyIHJlcGx5LiBDb3VsZCB5b3UgcGxlYXNlIGhl
bHAgdG8gbWVyZ2UgYmVsb3cgYXR0YWNoZWQgcGF0Y2ggdG8gdXBkYXRlIHRoZSBzdGF0dXMgb2Yg
SEFYTSBpbiBRRU1VPyBUaGFua3MgYSBsb3QuDQoNCg0KQmVzdCBSZWdhcmRzLA0KV2VuY2hhbw0K
DQotLS0tLS0tLS0tDQpGcm9tIGQ4OGJhOWFiM2UzMmM5OTE1NjY0NDNmM2I1MmM0NWRlNjdiZjEw
YzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxDQpGcm9tOiBXZW5jaGFvIFdhbmcgPHdlbmNoYW8u
d2FuZ0BpbnRlbC5jb20+DQpEYXRlOiBUaHUsIDE5IEphbiAyMDIzIDIwOjA4OjM3ICswODAwDQpT
dWJqZWN0OiBbUEFUQ0hdIE1BSU5UQUlORVJTOiBBYm9ydCBIQVhNIG1haW50ZW5hbmNlDQoNCkFi
b3J0IHRoZSBtYWludGVuYW5jZSBvZiBHdWVzdCBDUFUgQ29yZXMgKEhBWE0pLg0KDQoqIENsZWFu
IHVwIHRoZSBtYWludGFpbmVyIGxpc3Qgb2YgWDg2IEhBWE0gQ1BVcw0KKiBSZW1vdmUgdGhlIHdl
YiBwYWdlIFVSTCBhbmQgdGhlIG1haWxpbmcgbGlzdA0KKiBDaGFuZ2UgdGhlIHN0YXR1cyB0byBP
cnBoYW4NCg0KUmV2aWV3ZWQtYnk6IEhhbmcgWXVhbiA8aGFuZy55dWFuQGludGVsLmNvbT4NClNp
Z25lZC1vZmYtYnk6IFdlbmNoYW8gV2FuZyA8d2VuY2hhby53YW5nQGludGVsLmNvbT4NCi0tLQ0K
IE1BSU5UQUlORVJTIHwgNSArLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
NCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMN
CmluZGV4IDBmZTUwZDAxZTMuLjA5NTAwNjFkYzQgMTAwNjQ0DQotLS0gYS9NQUlOVEFJTkVSUw0K
KysrIGIvTUFJTlRBSU5FUlMNCkBAIC01MDAsMTAgKzUwMCw3IEBAIEY6IHN0dWJzL3hlbi1ody1z
dHViLmMNCiBHdWVzdCBDUFUgQ29yZXMgKEhBWE0pDQogLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQog
WDg2IEhBWE0gQ1BVcw0KLU06IFdlbmNoYW8gV2FuZyA8d2VuY2hhby53YW5nQGludGVsLmNvbT4N
Ci1MOiBoYXhtLXRlYW1AaW50ZWwuY29tDQotVzogaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2hh
eG0vaXNzdWVzDQotUzogTWFpbnRhaW5lZA0KK1M6IE9ycGhhbg0KIEY6IGFjY2VsL3N0dWJzL2hh
eC1zdHViLmMNCiBGOiBpbmNsdWRlL3N5c2VtdS9oYXguaA0KIEY6IHRhcmdldC9pMzg2L2hheC8N
Ci0tIA0KMi4xNy4xDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IERhbmll
bCBQLiBCZXJyYW5nw6kgPGJlcnJhbmdlQHJlZGhhdC5jb20+IA0KU2VudDogVGh1cnNkYXksIEph
bnVhcnkgMTksIDIwMjMgMTg6MTINClRvOiBXYW5nLCBXZW5jaGFvIDx3ZW5jaGFvLndhbmdAaW50
ZWwuY29tPg0KQ2M6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz47
IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPjsgUGFvbG8gQm9uemluaSA8cGJvbnppbmlA
cmVkaGF0LmNvbT47IHFlbXUtZGV2ZWwgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz4NClN1YmplY3Q6
IFJlOiBBbm5vdW5jZW1lbnQgb2YgYWJvcnRpbmcgSEFYTSBtYWludGVuYW5jZQ0KDQpPbiBUaHUs
IEphbiAxOSwgMjAyMyBhdCAwMzo1NjowNEFNICswMDAwLCBXYW5nLCBXZW5jaGFvIHdyb3RlOg0K
PiBIaSwgUGhpbGlwcGUsDQo+IA0KPiBJbnRlbCBkZWNpZGVkIHRvIGFib3J0IHRoZSBkZXZlbG9w
bWVudCBvZiBIQVhNIGFuZCB0aGUgbWFpbnRlbmFuY2Ugb2YgDQo+IGl0cyBRRU1VIHBhcnQuIFNo
b3VsZCB3ZSBzdWJtaXQgYSBwYXRjaCB0byBtYXJrIHRoZSBHdWVzdCBDUFUgQ29yZXMgDQo+IChI
QVhNKSBzdGF0dXMgYXMgT3JwaGFuIGFuZCByZW1vdmUgdGhlIG1haW50YWluZXJzIGZyb20gdGhl
IA0KPiBjb3JyZXNwb25kaW5nIGxpc3Q/IE1lYW53aGlsZSwgc2hvdWxkIHRoZSBjb2RlIGVuYWJs
aW5nIEhBWCBpbiBRRU1VIA0KPiBvbmNlIGNvbW1pdHRlZCBieSB0aGUgY29tbXVuaXR5IGJlIHJl
dGFpbmVkPw0KDQpJZiB5b3Ugbm8gbG9uZ2VyIGludGVuZCB0byB3b3JrIG9uIFFFTVUgYml0cyBy
ZWxhdGVkIHRvIEhBWE0sIHRoZW4geWVzLCB5b3Ugc2hvdWxkIHNlbmQgYSBwYXRjaCBmb3IgdGhl
IE1BSU5UQUlORVJTIGZpbGUgdG8gcmVtb3ZlIHlvdSBuYW1lIGFuZCBtYXJrIGl0IGFzICJPcnBo
YW4iIHN0YXR1cy4NCg0KV2Ugd291bGQgbm90IG5vcm1hbGx5IGRlbGV0ZSBjb2RlIGZyb20gUUVN
VSwgbWVyZWx5IGJlY2F1c2UgaXQgaGFzIGJlZW4gb3JwaGFuZWQuIElmIGl0IGlzIHN0aWxsIGtu
b3duIHRvIHdvcmsgdGhlbiB3ZSB3b3VsZCByZXRhaW4gaXQgaW5kZWZpbml0ZWx5LCB1bmxlc3Mg
c29tZSBjb21wZWxsaW5nIHJlYXNvbiBhcmlzZXMgdG8gZHJvcCBpdC4NClRoaXMgZ2l2ZXMgdGlt
ZSBmb3IgYW55IHBvdGVudGlhbCB1c2VycyB0byBhZGp1c3QgdGhlaXIgcGxhbnMsIGFuZC9vciBv
cHBvcnR1bml0eSBmb3Igb3RoZXIgaW50ZXJlc3RlZCBwZW9wbGUgdG8gdGFrZSBvdmVyIHRoZSBt
YWludGVuYW5jZSByb2xlLg0KDQpXaXRoIHJlZ2FyZHMsDQpEYW5pZWwNCi0tIA0KfDogaHR0cHM6
Ly9iZXJyYW5nZS5jb20gICAgICAtby0gICAgaHR0cHM6Ly93d3cuZmxpY2tyLmNvbS9waG90b3Mv
ZGJlcnJhbmdlIDp8DQp8OiBodHRwczovL2xpYnZpcnQub3JnICAgICAgICAgLW8tICAgICAgICAg
ICAgaHR0cHM6Ly9mc3RvcDEzOC5iZXJyYW5nZS5jb20gOnwNCnw6IGh0dHBzOi8vZW50YW5nbGUt
cGhvdG8ub3JnICAgIC1vLSAgICBodHRwczovL3d3dy5pbnN0YWdyYW0uY29tL2RiZXJyYW5nZSA6
fA0KDQo=

