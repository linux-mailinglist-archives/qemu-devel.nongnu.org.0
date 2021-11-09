Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808C044A78C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:24:15 +0100 (CET)
Received: from localhost ([::1]:58832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLUL-0005qc-CD
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:24:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mkLQa-0002zQ-O2
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:20:20 -0500
Received: from mga03.intel.com ([134.134.136.65]:54507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mkLQX-0004so-8D
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:20:20 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="232341831"
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; d="scan'208";a="232341831"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 23:20:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; d="scan'208";a="500299639"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga007.fm.intel.com with ESMTP; 08 Nov 2021 23:20:10 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 8 Nov 2021 23:20:09 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 8 Nov 2021 23:20:09 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 8 Nov 2021 23:20:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8QI+e0vOYYRG676tb2Zqa7q/pXzPexKtZ2asMtpzDa/RbNbfzRUqO9AtKGe9pSeL+cTyHYJcCwkaYvsWYe60XMOEpnXe5jog8mIw3M5uHZq6lWUew51I8CDJ1UJcb/ipwDVwQryo+8LQSE88MHWPFfByD1evRisXwq0ZjclOJVkrh1o6dXIa2VnWHoqsA/uE2LuKSUPqi5w52mQNj4dgTUK3kw4EOMVU4Tz5f+v0hYzxiL0Tm2FYuTIfeTCz43gxx4k7cqDXBQ1u0wN/7EI558ZhUnPnRVs6fgUe65cVtrcHXNxX/9pSF9IZLuneCbKOUwNWcM35bZSlqfMyUsQ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDZRkgecj4eRzd4YzxH+qnfKV0pxY5hymE9Mulylooc=;
 b=lidrfPYVn+/cFov0nq0wiOjYZvuo4YwGOtMhhN8WnKmXmEzUGiJKzQEd5hNuvYSN7ixxBO90261VQDzcO5erlLA0fwvB661t6nXjiPOKOtUA1kEgPF3QvZ3+tt6aNl0QjosYrbQclm1E4GWo3hhzxR8hnnBK/TgsDGl285zfy/kTXSh53RR+ZAnxuCRUrIfXxPY8+RoL5k929ctHaijt9Fxdjb1M0hfGIr81tbYdrwP85T3efte1zBrfiFy+MHf1VbeCjtDjWegCFyIbrJTz5xVatYHx4mr/E9wySy/A2Htuo7zUfz9ckJ3yeDgAMqWHwooQlikrSkCHneJogiRGsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDZRkgecj4eRzd4YzxH+qnfKV0pxY5hymE9Mulylooc=;
 b=yPuAVGZ5zVoqLNPQPAk99SeshDhoLj606TLJc40ltmzE5JMSOKjtaN+/tCo11PnBx4wGV477LlCJNTEm/OVO1KKeqZWti2nAQXNAVecoPk9oVlsxYDdf3BaaU51hSHFqQvKEGRSjzbDgDv7QHt1B9xMJohqk61ky0bGTI+14HrM=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MWHPR11MB2061.namprd11.prod.outlook.com (2603:10b6:300:28::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Tue, 9 Nov
 2021 07:20:08 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814%3]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 07:20:07 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
Thread-Topic: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
Thread-Index: AQHXy9x7gE+VGPrLuEuUpJeh4vPmyavpTZSAgABPWuCABHFUgIAAMzPwgAShnTCAAWxkAIAAAISAgAAMYICAABYMEIAANIUAgAACC2CABFOtAIAAAGiwgAHVFICAAAg10A==
Date: Tue, 9 Nov 2021 07:20:07 +0000
Message-ID: <MWHPR11MB0031DA3889B2E94DDF5948229B929@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211028090556.3168043-1-chen.zhang@intel.com>
 <20211028090556.3168043-2-chen.zhang@intel.com>
 <c603b048-1cee-1396-811d-8be857aa932b@redhat.com>
 <MWHPR11MB0031A0311824C3DF060B64E39B879@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsjn0nz4N+O4s9Y0m0gEYXu9WKstP9LHE4F=m5mOR3dcA@mail.gmail.com>
 <MWHPR11MB00315CFF0E7854146B5C9AE69B8A9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <MWHPR11MB0031B626425E7815EB78A9E49B8D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <94f96089-f8a8-d3d4-18c3-26917952fc14@redhat.com>
 <DM5PR11MB00276DF408F0DBC3C6EFADB89B8E9@DM5PR11MB0027.namprd11.prod.outlook.com>
 <CACGkMEvuXhuzSiTebOQqvriD5UnaiPzaY37AOR8bihTC4FTa4Q@mail.gmail.com>
 <DM5PR11MB002701BF07DCC15BF968A1749B8E9@DM5PR11MB0027.namprd11.prod.outlook.com>
 <CACGkMEs5q4E3yK_ZjUQsvJ=Ojd6hmTVEwQeh1N0QDPNaPoM7Dw@mail.gmail.com>
 <MWHPR11MB0031EBF5ACACF7455EA9F4779B8E9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsLF6VUDNgnUngrE4LePkM8pFe3fYrPd2W6O8RUpcprNQ@mail.gmail.com>
 <MWHPR11MB00315078A1A7329E96FAA8F79B919@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsu-1ENupe8xMyKNNpbNjt1aGr5Unr_-4xDwx7OiA0ttQ@mail.gmail.com>
In-Reply-To: <CACGkMEsu-1ENupe8xMyKNNpbNjt1aGr5Unr_-4xDwx7OiA0ttQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f57aad90-4040-426a-d675-08d9a3515be7
x-ms-traffictypediagnostic: MWHPR11MB2061:
x-microsoft-antispam-prvs: <MWHPR11MB2061E85ED3BD451088FC9DA39B929@MWHPR11MB2061.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iqIegGBV17P+tAks+HgKfihCrDN+LW5dVgNfL8QUOXwPxoN9XAnZLEJ/XFkmwyH/bLLxmhX9b33GaasfikQkUIt6CyNIqzI/rLNQyJ2rXZyDzOMAst5AiNvg79Z4kx10b+DPniGh2Krl90y/xoQ252gSqbl/pxU1UyQ93FWLkSj1b+CgI7zSwTnYFpPyfmmlX/KV/XAoSt5tGNbHHW0wMmOvIk282CR0+MOOwQpsLvJe2BKD2eNQ35nBNXZpeMKLuqYD5vS/9UPFUkoD+Bi0ZfXelQ9xvR8FUoHt+xEstqU3y6uhifAHzHAwv43BX6HgJ3TjfY3Sk6TS4dvU73Uhx136HpZ+K24vqr6RAlTQdHfw+Fax3OVWv1jS76E6rXTZikvsu3fDTDrL5BKUGICO6u6mO45umVJT9jFi+YBLTsu3ZzTSt2Z+jfl4FARrfuieZr0Q5jybpoorqdx3p/aMmCL0cDzRtkD6gKh1tkLrtbgOCx3UUJN8N5AxO1QGSpIUW8f3ON/TbnZZhi6W49cwJjvOTWtu0rFgcESeG2puyMg8XtoFBVbD8A5iSkbrawVsHz42bhdqB8BJQzsRcK2TeYXnB1qISTWyxrRYaCmKzWxOyfuRuswRWBofYdm+U5oXM+VjihQrkSdoEnR3yemFdVShhkgZ/8fxak+kg30kDQVTjAgc6qUhXndK0eKOdq6pH0yprV9t0PMMYfYq1e1JAw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(86362001)(186003)(71200400001)(8676002)(6506007)(53546011)(5660300002)(316002)(9686003)(7696005)(8936002)(83380400001)(38100700002)(6916009)(55016002)(33656002)(2906002)(122000001)(54906003)(82960400001)(76116006)(4326008)(52536014)(38070700005)(66946007)(66556008)(64756008)(66446008)(66476007)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmdxZ0orMWpYYmZoaEx6ajRjM1hPeDE1TTRyS3Radlp1czlCeGN2NmlWNklI?=
 =?utf-8?B?S1FkaGJwWDdYMEZNNkxldEpRcGFjOVhkZWt1ak5nRUwzSkU3N1lGOHNNdHd4?=
 =?utf-8?B?S1JhUDFla1FSK3N0V1k3Q2pCdCtLRzgyY0JST1BudmJiOWM3NW9wZlJSNWhj?=
 =?utf-8?B?aXo3MGRUMzhsMlpDaldJWWVHbE9mMGtCeC9aWUZMczZDbjhtK1kzL0hsSVFh?=
 =?utf-8?B?aEVkbjBSSFVHbXhpUE1BTERhdGJBWkpXTmpqaDF1Ky8rbTNoOElMMUl0cmhh?=
 =?utf-8?B?QmpiZU83RzBWSzVkS0VNYk1yOG5CTDJ0Tzc0ak9BVEpKU0dkWFNsanJwWUti?=
 =?utf-8?B?UFRQWUsySlRwdkNKYzZyWWt6QlVMRkNWTTdGejMzd0p3VktHMjlrc3A4dHZu?=
 =?utf-8?B?T1JzcG14ZjRPQ3ZybEgxenpWQUl1bG1OOW1WeUU3WWJvamR5a2c1aVVBWWho?=
 =?utf-8?B?WjJ1L0Mvc0wyT0t6ZTIxVEdIYkU3Lyt6RnBCT01HWk9oa0JJVXRWdmlqNHlj?=
 =?utf-8?B?T0tEWTFua2pLUGhnbzgzelltT1lXVnR5WFZ3ZkE2azBReGsxL2FaTElBWU9M?=
 =?utf-8?B?RU9lZ0hzRVFIR0E0b0xUNHNwRmxOM25vamJQWEdBd1cveFh6LzZSU1NkcFd5?=
 =?utf-8?B?ZzFPMjVuUDNjQ1JlZnp2anA4aUJTN1RjcFRlLzkzM3BnMTcvckhGdm5pOFE4?=
 =?utf-8?B?M2o0V1ZBTEFXMDBidWZFVzZHaTZHSEl4R2tTajNqYlA0cW12WW1CVS8rYkgr?=
 =?utf-8?B?ZjlMdFlTTk1aa2huYmYrUGNFM1IyK0U3aDg2VjQ5TmF3dVdiR0lLR1N1V3pO?=
 =?utf-8?B?bSs0VXJUVmZSZkhIM1ZyS3BSRnRLMHF1ZDAxWG15NnF1QWwyQ3FDeDR1M0Fz?=
 =?utf-8?B?d3JJTklucnVpcnZUUWEzVWN5WGlyODhNMUZSNXBBdWtLaTdleFZ5aExvRnc3?=
 =?utf-8?B?SSt2VVlIc1pwdEJPN3Y5UFkwWGo2b1FoZTZrRDVBMG93cHRFQXlHRDAzc2ww?=
 =?utf-8?B?TS9nRDlBN0VTL0JCNzgxTFp4cGVMTnFpT2lwUUtkeUIrVUxrRnAyKzFSNzR3?=
 =?utf-8?B?RUtpQ0Q0VjFZcFJMQk5iQU5NclBQZVlEZjlzMnFqaDNwM0R2aStzMHQ0TVFM?=
 =?utf-8?B?Vml3WlNpZHNleWFSb0NwS2swc3NZRmp6VTBrR21EaFhFOVphTmlpYXlxdUxP?=
 =?utf-8?B?VWhpYXQ3TTFzK2Q0NXVZRWlBeVJrT1E2WXRaeXBpTWZsaEVMT1ZiZU5yTzdQ?=
 =?utf-8?B?MHRhMFQ4WGZqckVsLzVNVnZMNFJhTTV2bGUrbkJQcWNScXQyRmRLL1JjUzVI?=
 =?utf-8?B?UlprRG5Vc1N0WmF0WnBucE5zUWRjdUtGeHJJVlV3R1U1L3ViS296YjFuR2or?=
 =?utf-8?B?R3J2UTF5N29jcUJteUpIeUY1VFNLcExrVzZmQnMyQ2xRYytMNExuYkprMi93?=
 =?utf-8?B?OHR5eXFiUlBiYmpiVEJZUDZCUEtyZFRKeHpNWGFqKzNMeVM3cENkZXR2aEdK?=
 =?utf-8?B?Z2drVWpDSkdvaFBjRHRhTG9reXg5NytSMC9VWFo0MnBGMXptRytreXpubldX?=
 =?utf-8?B?a0wydzMvUlpQR1VtQjh0T2xLdytpOWJFYlBiTWdLZC8xcHU0VzhvSzBBS1ky?=
 =?utf-8?B?U0F6cU4xajUxaDQwbUVpUDQ5TkFwblB2ZkdhTE52b044SlhoYW5TbHNCZXVV?=
 =?utf-8?B?R21FRUZVU21UaFhzc1NKekp1K241VXErbE5wQSt4UE15S05Rd2dqaW5aT0lL?=
 =?utf-8?B?Rit3cndqOS96WjlSbnA0QW51aU1QMmxLK1B1cFdGVFRCRXUxazVmbDdxdHhF?=
 =?utf-8?B?dkR6MHMyUzRFK2wxNmhLWGV2SnB3RTk1ZVFKdTlDZVdMbkw4L00zNTRUQUp6?=
 =?utf-8?B?QmtDeHFmbVZhYkFqdXh0MUIveFhPWTNjajMxVllWNFZBMUc5L1Fxd0R4NWZN?=
 =?utf-8?B?aVlhTFJmREt6akJYdVJpQjkrSVA1eEZFdW80bGFUM2FxWms1UmtXdXloMTFP?=
 =?utf-8?B?U0lhaFJLajNad1J2NTRGOExiWDRoMW5PREhlR0tDTXQ3SDdzckVyck1pRHhz?=
 =?utf-8?B?SmhuMm15d3o0ckVqTVpNZDZuT1NmQ1B2eHJPR3BUaGNyaHF5c2tQYzJTN3dV?=
 =?utf-8?B?R3UyUG03alhLQ3VOV0UwWWM2WU92aGtKbC9Ya1ZXeU5HQUpVNEtJUTd2WEdz?=
 =?utf-8?Q?3TWnOQRmf8G+qg2cmrL/NyQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f57aad90-4040-426a-d675-08d9a3515be7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 07:20:07.8055 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /AwKyyuABoXuXjV2ndOTttgxW3VuWqv1WtYwNNGhWfALdOn8d0mwrlbbTA0zDu9clS7ltd6ebSyB8qWCSq0tBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2061
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chen.zhang@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIgOSwgMjAyMSAyOjQy
IFBNDQo+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+DQo+IENjOiBNYXJr
dXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+OyBxZW11LWRldiA8cWVtdS0NCj4gZGV2
ZWxAbm9uZ251Lm9yZz47IExpIFpoaWppYW4gPGxpemhpamlhbkBjbi5mdWppdHN1LmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCBWNSAxLzNdIG5ldC9maWx0ZXI6IE9wdGltaXplIHRyYW5zZmVy
IHByb3RvY29sIGZvciBmaWx0ZXItDQo+IG1pcnJvci9yZWRpcmVjdG9yDQo+IA0KPiBPbiBNb24s
IE5vdiA4LCAyMDIxIGF0IDEwOjUwIEFNIFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNv
bT4NCj4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+ID4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gPiA+
IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgOCwgMjAyMSAxMDo0MiBBTQ0KPiA+ID4gVG86IFpoYW5n
LCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4gPiA+IENjOiBNYXJrdXMgQXJtYnJ1c3Rl
ciA8YXJtYnJ1QHJlZGhhdC5jb20+OyBxZW11LWRldiA8cWVtdS0NCj4gPiA+IGRldmVsQG5vbmdu
dS5vcmc+OyBMaSBaaGlqaWFuIDxsaXpoaWppYW5AY24uZnVqaXRzdS5jb20+DQo+ID4gPiBTdWJq
ZWN0OiBSZTogW1BBVENIIFY1IDEvM10gbmV0L2ZpbHRlcjogT3B0aW1pemUgdHJhbnNmZXIgcHJv
dG9jb2wNCj4gPiA+IGZvciBmaWx0ZXItIG1pcnJvci9yZWRpcmVjdG9yDQo+ID4gPg0KPiA+ID4g
T24gRnJpLCBOb3YgNSwgMjAyMSBhdCA0OjQzIFBNIFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGlu
dGVsLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gPiBGcm9tOiBKYXNvbiBXYW5nIDxq
YXNvd2FuZ0ByZWRoYXQuY29tPg0KPiA+ID4gPiA+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgNSwg
MjAyMSA0OjMwIFBNDQo+ID4gPiA+ID4gVG86IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVs
LmNvbT4NCj4gPiA+ID4gPiBDYzogTWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29t
PjsgcWVtdS1kZXYgPHFlbXUtDQo+ID4gPiA+ID4gZGV2ZWxAbm9uZ251Lm9yZz47IExpIFpoaWpp
YW4gPGxpemhpamlhbkBjbi5mdWppdHN1LmNvbT4NCj4gPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BB
VENIIFY1IDEvM10gbmV0L2ZpbHRlcjogT3B0aW1pemUgdHJhbnNmZXINCj4gPiA+ID4gPiBwcm90
b2NvbCBmb3IgZmlsdGVyLSBtaXJyb3IvcmVkaXJlY3Rvcg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4g
T24gRnJpLCBOb3YgNSwgMjAyMSBhdCAxOjI5IFBNIFpoYW5nLCBDaGVuDQo+ID4gPiA+ID4gPGNo
ZW4uemhhbmdAaW50ZWwuY29tPg0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4gPiA+ID4gPiA+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+
ID4gPiA+ID4gPiA+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgNSwgMjAyMSAxMjowMyBQTQ0KPiA+
ID4gPiA+ID4gPiBUbzogWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPg0KPiA+ID4g
PiA+ID4gPiBDYzogTWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPjsgcWVtdS1k
ZXYNCj4gPHFlbXUtDQo+ID4gPiA+ID4gPiA+IGRldmVsQG5vbmdudS5vcmc+OyBMaSBaaGlqaWFu
IDxsaXpoaWppYW5AY24uZnVqaXRzdS5jb20+DQo+ID4gPiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggVjUgMS8zXSBuZXQvZmlsdGVyOiBPcHRpbWl6ZSB0cmFuc2Zlcg0KPiA+ID4gPiA+ID4g
PiBwcm90b2NvbCBmb3IgZmlsdGVyLSBtaXJyb3IvcmVkaXJlY3Rvcg0KPiA+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gPiBPbiBGcmksIE5vdiA1LCAyMDIxIGF0IDExOjI3IEFNIFpoYW5nLCBDaGVu
DQo+ID4gPiA+ID4gPiA+IDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4gPiA+ID4gPiB3cm90ZToN
Cj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+ID4gPiA+ID4g
PiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiA+ID4gPiA+ID4gPiA+
ID4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciA1LCAyMDIxIDExOjE3IEFNDQo+ID4gPiA+ID4gPiA+
ID4gPiBUbzogWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPjsgTWFya3VzDQo+ID4g
PiA+ID4gPiA+ID4gPiBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT4NCj4gPiA+ID4gPiA+
ID4gPiA+IENjOiBxZW11LWRldiA8cWVtdS1kZXZlbEBub25nbnUub3JnPjsgTGkgWmhpamlhbg0K
PiA+ID4gPiA+ID4gPiA+ID4gPGxpemhpamlhbkBjbi5mdWppdHN1LmNvbT4NCj4gPiA+ID4gPiA+
ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjUgMS8zXSBuZXQvZmlsdGVyOiBPcHRpbWl6ZQ0K
PiA+ID4gPiA+ID4gPiA+ID4gdHJhbnNmZXIgcHJvdG9jb2wgZm9yIGZpbHRlci0gbWlycm9yL3Jl
ZGlyZWN0b3INCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gPiA+ID4g5ZyoIDIwMjEvMTEvNCDkuIvljYgxOjM3LCBaaGFuZywgQ2hlbiDlhpnpgZM6DQo+
ID4gPiA+ID4gPiA+ID4gPiA+Pj4+Pg0KPiA+ID4gPiA+ID4gPiA+ID4gPj4+Pj4gSSB3b25kZXIg
aWYgd2UgbmVlZCB0byBpbnRyb2R1Y2UgbmV3IHBhcmFtZXRlciwNCj4gPiA+ID4gPiA+ID4gPiA+
ID4+Pj4+IGUuZyBmb3JjZV92bmV0X2hkciBoZXJlLCB0aGVuIHdlIGNhbiBhbHdheXMgc2VuZA0K
PiA+ID4gPiA+ID4gPiA+ID4gPj4+Pj4gdm5ldF9oZHINCj4gPiA+ID4gPiB3aGVuDQo+ID4gPiA+
ID4gPiA+ID4gPiA+Pj4+PiBpdA0KPiA+ID4gPiA+ID4gPiBpcyBlbmFibGVkLg0KPiA+ID4gPiA+
ID4gPiA+ID4gPj4+Pj4NCj4gPiA+ID4gPiA+ID4gPiA+ID4+Pj4+IE90aGVyd2lzZSB0aGUgInZu
ZXRfaGRyX3N1cHBvcnQiIHNlZW1zIG1lYW5pbmdsZXNzLg0KPiA+ID4gPiA+ID4gPiA+ID4gPj4+
PiBZZXMsIEN1cnJlbnQgInZuZXRfaGRyX3N1cHBvcnQiICBkZWZhdWx0IGVuYWJsZWQsDQo+ID4g
PiA+ID4gPiA+ID4gPiA+Pj4+IGFuZCB2bmV0X2hkcl9sZW4NCj4gPiA+ID4gPiA+ID4gPiA+ID4+
PiBhbHJlYWR5IGZvcmNlZCBmcm9tIGF0dGFjaGVkIG5mLT5uZXRkZXYuDQo+ID4gPiA+ID4gPiA+
ID4gPiA+Pj4+IE1heWJlIHdlIGNhbiBpbnRyb2R1Y2UgYSBuZXcgcGFyYW1ldGVyDQo+ID4gPiA+
ID4gImZvcmNlX25vX3ZuZXRfaGRyIg0KPiA+ID4gPiA+ID4gPiBoZXJlDQo+ID4gPiA+ID4gPiA+
ID4gPiB0bw0KPiA+ID4gPiA+ID4gPiA+ID4gPj4+IG1ha2UgdGhlIHZuZXRfaGRyX2xlbiBhbHdh
eXMga2VlcCAwLg0KPiA+ID4gPiA+ID4gPiA+ID4gPj4+PiBJZiB5b3UgdGhpbmsgT0ssIEkgd2ls
bCB1cGRhdGUgaXQgaW4gbmV4dCB2ZXJzaW9uLg0KPiA+ID4gPiA+ID4gPiA+ID4gPj4+IExldCBt
ZSBleHBsYWluLCBpZiBJIHdhcyBub3Qgd3Jvbmc6DQo+ID4gPiA+ID4gPiA+ID4gPiA+Pj4NCj4g
PiA+ID4gPiA+ID4gPiA+ID4+PiAidm5ldF9oZHJfc3VwcG9ydCIgbWVhbnMgd2hldGhlciBvciBu
b3QgdG8gc2VuZCB2bmV0DQo+ID4gPiA+ID4gPiA+ID4gPiA+Pj4gaGVhZGVyDQo+ID4gPiA+ID4g
PiA+IGxlbmd0aC4NCj4gPiA+ID4gPiA+ID4gPiA+ID4+PiBJZiB2bmV0X2hkcl9zdXBwb3J0PWZh
bHNlLCB3ZSB3b24ndCBzZW5kIHRoZSB2bmV0DQo+IGhlYWRlci4NCj4gPiA+ID4gPiA+ID4gPiA+
ID4+PiBUaGlzIGxvb2tzIHRoZSBzYW1lIGFzIHlvdSAiZm9yY2Vfbm9fdmVudF9oZHIiIGFib3Zl
Lg0KPiA+ID4gPiA+ID4gPiA+ID4gPj4gWWVzLCBJdCB3YXMuICBCdXQgdGhpcyBzZXJpZXMgY2hh
bmdlZCBpdC4NCj4gPiA+ID4gPiA+ID4gPiA+ID4+IEN1cnJlbnQgInZuZXRfaGRyX3N1cHBvcnQi
IGNhbid0IGRlY2lkZSB3aGV0aGVyIHNlbmQNCj4gPiA+ID4gPiA+ID4gPiA+ID4+IHZuZXQgaGVh
ZGVyIGxlbmd0aCwgd2UgYWx3YXlzIHNlbmQgaXQgZXZlbiAwLg0KPiA+ID4gPiA+ID4gPiA+ID4g
Pj4gSXQgd2lsbCBhdm9pZCBzZW5kZXIvcmVjZWl2ZXIgdHJhbnNmZXIgcHJvdG9jb2wgcGFyc2Ug
aXNzdWVzOg0KPiA+ID4gPiA+ID4gPiA+ID4gPj4gV2hlbiBzZW5kZXIgZGF0YSB3aXRoIHRoZSB2
bmV0IGhlYWRlciBsZW5ndGgsIGJ1dA0KPiA+ID4gPiA+ID4gPiA+ID4gPj4gcmVjZWl2ZXIgY2Fu
J3QgZW5hYmxlIHRoZSAidm5ldF9oZHJfc3VwcG9ydCIuDQo+ID4gPiA+ID4gPiA+ID4gPiA+PiBG
aWx0ZXJzIHdpbGwgYXV0byBzZXR1cCB2bmV0X2hkcl9sZW4gYXMgbG9jYWwNCj4gPiA+ID4gPiA+
ID4gPiA+ID4+IG5mLT5uZXRkZXYgYW5kIGZvdW5kIHRoZSBpc3N1ZSB3aGVuIGdldCBkaWZmZXJl
bnQNCj4gPiA+ID4gPiA+ID4gPiA+ID4+IHZuZXRfaGRyX2xlbiBmcm9tIG90aGVyDQo+ID4gPiA+
ID4gZmlsdGVycy4NCj4gPiA+ID4gPiA+ID4gPiA+ID4+DQo+ID4gPiA+ID4gPiA+ID4gPiA+Pj4g
QW5kIG15ICJmb3JjZV92bmV0X2hkciIgc2VlbXMgZHVwbGljYXRlZCB3aXRoDQo+ID4gPiA+ID4g
PiA+ID4gPiB2bmV0X2hkcl9zdXBwb3J0PXRydWUuDQo+ID4gPiA+ID4gPiA+ID4gPiA+Pj4gU28g
aXQgbG9va3MgdG8gbWUgd2UgY2FuIGxlYXZlIHRoZSBtaXJyb3IgY29kZSBhcyBpcw0KPiA+ID4g
PiA+ID4gPiA+ID4gPj4+IGFuZCBqdXN0IGNoYW5nZSB0aGUgY29tcGFyZT8gKGRlcGVuZHMgb24g
dGhlIG1nbXQgdG8NCj4gPiA+ID4gPiA+ID4gPiA+ID4+PiBzZXQgYSBjb3JyZWN0DQo+ID4gPiA+
ID4gPiA+ID4gPiA+Pj4gdm5ldF9oZHJfc3VwcG9ydCkNCj4gPiA+ID4gPiA+ID4gPiA+ID4+IE9L
LCBJIHdpbGwga2VlcCB0aGUNCj4gPiA+ID4gPiA+ID4gPiA+ID4+IGZpbHRlci1taXJyb3IvZmls
dGVyLXJlZGlyZWN0b3IvZmlsdGVyLXJld3JpdGVyDQo+ID4gPiA+ID4gPiA+ID4gPiA+PiBzYW1l
IGFzIHRoaXMgdmVyc2lvbi4NCj4gPiA+ID4gPiA+ID4gPiA+ID4+IEZvciB0aGUgY29sby1jb21w
YXJlIG1vZHVsZSwgSXQgd2lsbCBnZXQgcHJpbWFyeQ0KPiA+ID4gPiA+ID4gPiA+ID4gPj4gbm9k
ZSdzIGZpbHRlciBkYXRhJ3Mgdm5ldF9oZHJfbGVuIGFzIHRoZSBsb2NhbCB2YWx1ZSwNCj4gPiA+
ID4gPiA+ID4gPiA+ID4+IEFuZCBjb21wYXJlIHdpdGggc2Vjb25kYXJ5IG5vZGUncywgYmVjYXVz
ZSBpdCBpcyBub3QNCj4gPiA+ID4gPiA+ID4gPiA+ID4+IGF0dGFjaGVkIGFueQ0KPiA+ID4gbmYt
Pm5ldGRldi4NCj4gPiA+ID4gPiA+ID4gPiA+ID4+IFNvLCBpdCBsb29rcyBjb21wYXJlIG1vZHVs
ZSdzICJ2bmV0X2hkcl9zdXBwb3J0IiBiZWVuDQo+ID4gPiA+ID4gPiA+ID4gPiA+PiBhdXRvIGNv
bmZpZ3VyYXRpb24gZnJvbSB0aGUgZmlsdGVyIHRyYW5zcG9ydCBwcm90b2NvbC4NCj4gPiA+ID4g
PiA+ID4gPiA+ID4+IElmIHRoZSAiZm9yY2Vfdm5ldF9oZHIiIG1lYW5zIGhhcmQgY29kZSBhIGNv
bXBhcmUncw0KPiA+ID4gPiA+ID4gPiA+ID4gPj4gbG9jYWwgdm5ldF9oZHJfbGVuIHJhdGhlciB0
aGFuIGNvbWUgZnJvbSBpbnB1dCBmaWx0ZXIncyBkYXRhPw0KPiA+ID4gPiA+ID4gPiA+ID4gPj4N
Cj4gPiA+ID4gPiA+ID4gPiA+ID4+IFRoYW5rcw0KPiA+ID4gPiA+ID4gPiA+ID4gPj4gQ2hlbg0K
PiA+ID4gPiA+ID4gPiA+ID4gPj4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gSGkgSmFzb24vTWFya3Vz
LA0KPiA+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gPiBSZXRoaW5rIGFib3V0
IGl0LCBIb3cgYWJvdXQga2VlcCB0aGUgb3JpZ2luYWwNCj4gPiA+ICJ2bmV0X2hkcl9zdXBwb3J0
Ig0KPiA+ID4gPiA+ID4gPiA+ID4gPiBmdW5jdGlvbiwgQW5kIGFkZCBhIG5ldyBvcHRpb25hbCBw
YXJhbWV0ZXINCj4gImF1dG9fdm5ldF9oZHIiDQo+ID4gPiA+ID4gPiA+ID4gPiA+IGZvcg0KPiA+
ID4gPiA+ID4gPiA+ID4gZmlsdGVycy9jb21wYXJlPw0KPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBJdCdzIGEgd2F5IGJ1dCByZXRoaW5rIG9m
IHRoZSB3aG9sZSB0aGluZy4gSSB3b25kZXIgd2hhdA0KPiA+ID4gPiA+ID4gPiA+ID4gaWYgd2Ug
anVzdCBlbmFibGUgInZuZXRfaGRyX3N1cHBvcnQiIGJ5IGRlZmF1bHQgZm9yDQo+ID4gPiA+ID4g
PiA+ID4gPiBmaWx0ZXIgYW5kDQo+ID4gPiA+ID4gPiA+ID4gPiBjb2xvLQ0KPiA+ID4gPiA+IGNv
bXBhcmU/DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBJdCdzIHdvcmtzIGJ5IGRl
ZmF1bHQgZm9yIHVzZXIgdXNlIC1kZXZpY2UgdmlydGlvLW5ldC1wY2kgYW5kDQo+IGUxMDAwLi4u
DQo+ID4gPiA+ID4gPiA+ID4gQnV0IGl0IGNhbid0IHJlc29sdmUgdGhpcyBzZXJpZXMgbW90aXZh
dGlvbiwgaG93IHRvDQo+ID4gPiA+ID4gPiA+ID4gZml4L2NoZWNrIHVzZXINCj4gPiA+ID4gPiA+
ID4gY29uZmlndXJhdGlvbiBpc3N1ZToNCj4gPiA+ID4gPiA+ID4gPiBGb3IgZXhhbXBsZSB1c2Vy
IGVuYWJsZSAiIHZuZXRfaGRyX3N1cHBvcnQgIiBmaWx0ZXItbWlycm9yDQo+ID4gPiA+ID4gPiA+
ID4gYW5kIGRpc2FibGUgIiB2bmV0X2hkcl9zdXBwb3J0IiBmaWx0ZXItcmVkaXJlY3RvciBBbmQN
Cj4gPiA+ID4gPiA+ID4gPiBjb25uZWN0IGJvdGggZmlsdGVyIG1vZHVsZXMgYnkNCj4gPiA+ID4g
PiA+ID4gY2hhcmRldiBzb2NrZXQuDQo+ID4gPiA+ID4gPiA+ID4gSW4gdGhpcyBjYXNlIGd1ZXN0
IHdpbGwgZ2V0IHdyb25nIG5ldHdvcmsgd29ya2xvYWQgYW5kDQo+ID4gPiA+ID4gPiA+ID4gZmls
dGVycyBkaWRu4oCZdCBwZXJjZWl2ZSBhbnkgYWJub3JtYWxpdGllcywgYnV0IGluIGZhY3QsDQo+
ID4gPiA+ID4gPiA+ID4gdGhlIHdob2xlIHN5c3RlbSBpcyBubyBsb25nZXINCj4gPiA+ID4gPiA+
ID4gd29ya2luZy4NCj4gPiA+ID4gPiA+ID4gPiBUaGlzIHNlcmllcyB3aWxsIHJlcG9ydCBlcnJv
ciBhbmQgdHJ5IHRvIGNvcnJlY3QgaXQuDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFRo
ZSBwcm9ibGVtIGlzIGhvdyAiYXV0b192bmV0X2hkciIgaGVscCBpbiB0aGlzIGNhc2UuIEl0J3Mg
YQ0KPiA+ID4gPiA+ID4gPiBuZXcgcGFyYW1ldGVyIHdoaWNoIG1heSBsZWFkIHRvIG1vcmUgd3Jv
bmcgY29uZmlndXJhdGlvbj8NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBObywgdGhlICJhdXRv
X3ZuZXRfaGRyIiB3aWxsIGZpeCBtb3N0IHRoZSB3cm9uZyBjb25maWd1cmF0aW9uDQo+ID4gPiA+
ID4gPiBpc3N1ZXMgYXMNCj4gPiA+ID4gPiAidm5ldF9oZHJfc3VwcG9ydCIgY29ycmVjdCBzZXR0
aW5nLg0KPiA+ID4gPiA+ID4gV2hlbiB3ZSBlbmFibGUgdGhlICJhdXRvX3ZuZXRfaGRyIiwgdGhl
IG9yaWdpbmFsDQo+ID4gPiAidm5ldF9oZHJfc3VwcG9ydCINCj4gPiA+ID4gPiB3aWxsIG5vIGVm
ZmVjdC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNvIGl0IGxvb2tzIHRvIG1lIGl0IHN0aWxsIGRl
cGVuZHMgb24gdGhlIG1hbmFnZW1lbnQgdG8gc2V0DQo+ID4gPiAiYXV0b192bmV0X2hkciINCj4g
PiA+ID4gPiB0byBiZSB0cnVlPyAob3IgbWFrZSBpdCBlbmFibGVkIGJ5IGRlZmF1bHQpDQo+ID4g
PiA+DQo+ID4gPiA+IFllcywgSSBwbGFuIHRvIG1ha2UgImF1dG9fdm5ldF9oZHIiIGVuYWJsZWQg
YnkgZGVmYXVsdCBpbiBuZXh0IHZlcnNpb24uDQo+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiBJZiB3ZSBjYW4gZG8gdGhhdCwgaXNuJ3QgaXQgbXVjaCBtb3JlIHNpbXBsZXIgdG8gbWFrZQ0K
PiA+ID4gPiA+IHZuZXRfaGRyX3N1cHBvcnQgYnkgZGVmYXVsdD8NCj4gPiA+ID4NCj4gPiA+ID4g
WWVzLCBGb3IgY29tcGF0aWJpbGl0eSBmaWx0ZXJzIGFuZCBDT0xPIHN0aWxsIHdvcmsgd2l0aCB0
aGUNCj4gPiA+ID4gb3JpZ2luYWwNCj4gPiA+ICJ2bmV0X2hkcl9zdXBwb3J0Ii4NCj4gPiA+ID4g
Rm9yIG5ldyB1c2VycywgdGhleSBjYW4gZW5hYmxlIHRoZSBuZXcgImF1dG9fdm5ldF9oZHIiIHRv
IGF2b2lkDQo+ID4gPiA+IHNvbWUNCj4gPiA+IGlzc3Vlcy4NCj4gPiA+DQo+ID4gPiBRdWVzdGlv
biBzdGlsbCwgc28gd2UgaGF2ZQ0KPiA+ID4NCj4gPiA+IDEpIGVuYWJsZSB2bmV0X2hkcl9zdXBw
b3J0IGJ5IGRlZmF1bHQNCj4gPiA+IDIpIGFkZCBhdXRvX3ZuZXRfaGRyIGFuZCBlbmFibGUgaXQg
YnkgZGVmYXVsdA0KPiA+ID4NCj4gPiA+IFVzaW5nIDEpIHNlZW1zIG11Y2ggbW9yZSBzaW1wbGVy
IGFuZCBjYW4gc29sdmUgdGhpcyBpc3N1ZS4gSWYgd2UNCj4gPiA+IGRlcGVuZHMgb24gdGhlIGRl
ZmF1bHQgYmVoYXZpb3VyLCBpdCBzaG91bGQgYmUgYWxtb3N0IHRoZSBzYW1lLiBJZg0KPiA+ID4g
d2Ugd2FudCB0byB0ZWFjaCB0aGUgbWdtdCwgYm90aCBzaG91bGQgd29yay4gQW55IG90aGVyIGFk
dmFudGFnZXMgb2YNCj4gMik/DQo+ID4NCj4gPiBVc2luZyAxKSB3ZSBjYW4ndCBlbnN1cmUgdXNl
ciBjb25maWd1cmUgcGFydHMgb2YgbW9kdWxlIGJ5IGl0c2VsZi4NCj4gKHZuZXRfaGRyX3N1cHBv
cnQgPSBvZmYpLg0KPiA+IEluIHRoaXMgY2FzZSwgZmlsdGVyIGRhdGEgYWxyZWFkeSB3cm9uZyBh
bmQgdGhlIGZpbHRlcnMgY2FuJ3QgcmVwb3J0IGFueQ0KPiB0cmFuc2ZlciBlcnJvciBoZXJlLg0K
PiANCj4gU28gSSB0aGluayB0aGUgcG9pbnQgaXMgd2UgY2FuJ3QgZW5zdXJlIHRoZSB1c2VyIGNv
bmZpZ3VyZSBwYXJ0cyBvZiBtb2R1bGUgaW4NCj4gYW55IGNhc2UgZXZlbiBpZiBhdXRvX3ZuZXRf
aGRyIGlzIGludHJvZHVjZWQuIEUuZyB1c2VyIGNhbiBjaG9vc2UgdG8gZGlzYWJsZQ0KPiBpdCBt
YW51YWxseS4gVGhhdCdzIHdoeSBJIHRoaW5rIGl0IHNob3VsZCBub3QgZGlmZmVyIHRvbyBtdWNo
IGZyb20gbWFraW5nDQo+IHZuZXRfaGRyX3N1cHBvcnQgZW5hYmxlZCBieSBkZWZhdWx0Lg0KDQpZ
ZXMsIHlvdSBhcmUgcmlnaHQuIFRoZSAiYXV0b192bmV0X2hkciIganVzdCBjYW4gZml4IHBhcnQg
b2YgdXNlciBjb25maWd1cmUgaXNzdWUuDQpBbmQgSSB0aGluayB0aGlzIHNlcmllcyBtYWtlIHRo
ZSBmaWx0ZXJzIGJldHRlciwgaXQgbWFrZSB1c2VyIGtub3cgZmlsdGVycyBoYXZlIHNvbWUgaXNz
dWVzDQp3aGVuIHRoZXkgaGF2ZSB3cm9uZyBtYW51YWwgY29uZmlndXJhdGlvbihjdXJyZW50IGNv
ZGUgbm90KS4NCg0KVGhhbmtzDQpDaGVuDQoNCj4gDQo+IFRoYW5rcw0KPiANCj4gPg0KPiA+IFVz
aW5nIDIpIGZpbHRlcnMgd2lsbCBmaW5kL3JlcG9ydCB0aGlzIGlzc3VlIGFuZCB0cnkgdG8gZml4
IGl0IGZyb20gbG9jYWwNCj4gdm5ldF9oZHJfbGVuLg0KPiA+DQo+ID4gVGhhbmtzDQo+ID4gQ2hl
bg0KPiA+DQo+ID4gPg0KPiA+ID4gVGhhbmtzDQo+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBUaGFu
a3MNCj4gPiA+ID4gQ2hlbg0KPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSSB0aGluayBJ
IG1heSBtaXNzIHNvbWV0aGluZy4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoYW5rcw0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gVGhhbmtzDQo+ID4gPiA+ID4gPiBDaGVuDQo+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBUaGFua3MNCj4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IFRoYW5rcw0KPiA+ID4gPiA+
ID4gPiA+IENoZW4NCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+ID4gPiA+IFRoYW5rcw0KPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+IFRoYW5rcw0KPiA+ID4gPiA+
ID4gPiA+ID4gPiBDaGVuDQo+ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+
DQo+ID4gPiA+ID4gPiA+ID4gPiA+Pj4gVGhhbmtzDQo+ID4gPiA+ID4gPiA+ID4gPiA+Pj4NCj4g
PiA+ID4gPiA+ID4gPiA+ID4+Pj4gVGhhbmtzDQo+ID4gPiA+ID4gPiA+ID4gPiA+Pj4+IENoZW4N
Cj4gPiA+ID4gPiA+ID4gPiA+ID4+Pj4NCj4gPiA+ID4gPiA+ID4gPiA+ID4+Pj4+IFRoYW5rcw0K
PiA+ID4gPiA+ID4gPiA+ID4gPj4+Pj4NCj4gPiA+ID4gPiA+ID4gPiA+ID4+Pj4+DQo+ID4gPiA+
ID4gPiA+ID4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+DQo+ID4NCg0K

