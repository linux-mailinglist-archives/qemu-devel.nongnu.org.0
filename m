Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CF4445EEA
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 04:56:18 +0100 (CET)
Received: from localhost ([::1]:56642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miqKu-0006id-He
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 23:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1miptM-0001Jm-Tr
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:27:48 -0400
Received: from mga03.intel.com ([134.134.136.65]:62033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1miptJ-0005E1-MX
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:27:48 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="231786644"
X-IronPort-AV: E=Sophos;i="5.87,210,1631602800"; d="scan'208";a="231786644"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 20:27:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,210,1631602800"; d="scan'208";a="501798168"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga008.jf.intel.com with ESMTP; 04 Nov 2021 20:27:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 4 Nov 2021 20:27:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 4 Nov 2021 20:27:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 4 Nov 2021 20:27:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OEGASN/DfQB1FkPfNRs8gAr2BIY1hb5CxWxJg+4KUGnwoI6qUMmyb6EFFqijhcZewdTDZIf6+/TCixRFCjSzkgqG3nJVHP/NA2i9CK5Bmq0/AWotSEFSjwd8B+gQfosQdP8I2ZSLJgEHtUc6liVyim5xRFT65QgKK4WvcdO8NCtH6D5ZpjE+3TbpH1CQbpB8S9rZ4UdidbTuU6daYS/KFluYt+DqGTTZq0wrpDq3ya3YYZGkB6OfauJC1CHfTJOFhPcmFI0vsZB0bcA6iyYghVTgBQ4VbecNigeWJzhKvEQXlZDkqa8nBsWk2sanku68CbvUPavzBLcfuUBfHfevkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaNlUjLAEqiJnfW6+6fM8cZQtI2DtM3qIR8VFxzTflg=;
 b=KuPx3pIkRQ7tC9jRLAmv/AeJUWWO9Or1Q7zzCZ14ztnF5+69sfCpSuSV72EAjYkntRWjzOo6FA8j662hApm38X7Xfmaa60ApzFltKqdmEaWIqi8TEz/O+QLgDeK5qkyGhgg/LNzUMxYfAj/WfDMxA8CGaDYJ07/VbYsTV9GN8aEIfERRWYRQqY9PX22SiRMuA2k18W6KgmPwsrQR6v4C2e50gVxDiodpmmYb2K97bP5rC2AhvIEf82UU6GCVvpPB8Dak7mW07j98+TXBk21gyVQfMfoc86kHMePYM8FeQMh0V75wdiREoTcZpbONLlBB9zckf+1VanC1iSpGtKBr4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaNlUjLAEqiJnfW6+6fM8cZQtI2DtM3qIR8VFxzTflg=;
 b=B5MFMOudDzXKwWFwFbS7XoaUtBszICbvXSuoFVzeExHpl2lRYC3Wo4WC4HJx3Xr88PrsRh2GUpP78n8607F51bQi8TPjD4C66qL2ubcVAh0ax9PIGMOMwWLTuyA94mBbv74sxKLkB4QV8XqYZmbG4bgggvi2hS1hQ1aJGPYoNyo=
Received: from DM5PR11MB0027.namprd11.prod.outlook.com (2603:10b6:4:6b::33) by
 DM4PR11MB5471.namprd11.prod.outlook.com (2603:10b6:5:39d::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11; Fri, 5 Nov 2021 03:27:36 +0000
Received: from DM5PR11MB0027.namprd11.prod.outlook.com
 ([fe80::3958:5a94:4db3:a878]) by DM5PR11MB0027.namprd11.prod.outlook.com
 ([fe80::3958:5a94:4db3:a878%7]) with mapi id 15.20.4649.021; Fri, 5 Nov 2021
 03:27:36 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
Thread-Topic: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
Thread-Index: AQHXy9x7gE+VGPrLuEuUpJeh4vPmyavpTZSAgABPWuCABHFUgIAAMzPwgAShnTCAAWxkAIAAAISA
Date: Fri, 5 Nov 2021 03:27:36 +0000
Message-ID: <DM5PR11MB00276DF408F0DBC3C6EFADB89B8E9@DM5PR11MB0027.namprd11.prod.outlook.com>
References: <20211028090556.3168043-1-chen.zhang@intel.com>
 <20211028090556.3168043-2-chen.zhang@intel.com>
 <c603b048-1cee-1396-811d-8be857aa932b@redhat.com>
 <MWHPR11MB0031A0311824C3DF060B64E39B879@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsjn0nz4N+O4s9Y0m0gEYXu9WKstP9LHE4F=m5mOR3dcA@mail.gmail.com>
 <MWHPR11MB00315CFF0E7854146B5C9AE69B8A9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <MWHPR11MB0031B626425E7815EB78A9E49B8D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <94f96089-f8a8-d3d4-18c3-26917952fc14@redhat.com>
In-Reply-To: <94f96089-f8a8-d3d4-18c3-26917952fc14@redhat.com>
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
x-ms-office365-filtering-correlation-id: 68e9ce3b-5282-40c4-5967-08d9a00c3668
x-ms-traffictypediagnostic: DM4PR11MB5471:
x-microsoft-antispam-prvs: <DM4PR11MB5471989DE8FD1C897C285C109B8E9@DM4PR11MB5471.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OwQpWm2/VSnSvoA/3yCnXqAZhkWvlXL8JuP8UYkV3qW+RmA981jGoa5guWLWWmQIpy2kahQeVHzGYJ7hlnq1Uhuc9dSsObK9/q2T6w1oG8lmR20cGaHSuZxI/fGv7ASVfYLS06NtYJN86voRrezaHECJE95zFdsuFCDAsLB2xJAzY3rFHntOwztDpBb99NKyqG0LCeBYlRpwvrZwn/udT2eufUQxwMVWyMaIiU2II36cjeLA+12e69rUlUQYaUtLBda95OEZtu7oclM1j++/E2T4Gl9W4xSk+e6bHnqTuPVLSuwAERZlDdou+3nSVkIRaB0uJSaK5x0h1QIc2pi4ZSHEEmdN0IcYamLeQwyS8wZNfUfE/gWrvlbPHpCy8V7RVW+O0TLHYGqUgTFxeH5fKWAxIiv7t09l3kHOxOgrKl3UUXm0z03M7DBphRCCkqNnREyiko6dwgrgJU9ScLeZ9DBtthK/l81octBPrDf3sISYPxEDRp2SynKcx0jBA9ZbOQ4hVxeeHEJM2qpVbz4hB4IlW7s+UYX+vh0ikBDKeDN1PJdigNR1zprwQmmapMJ4avbCiLKqbGoXUXmN3obN9XkolHcv8bs2iCSLDq6+UuY1hRtdOskz0txWm676mzUpb+DzV+8JyXXOnwv2aKWpGhBcYBPRpJ0c57VNuivMxxF6W3kQy/CAC0PnHMOgaaDnoYQJo8uMYM2OXW3g58u2Kw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB0027.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(82960400001)(55016002)(5660300002)(26005)(8676002)(83380400001)(54906003)(316002)(110136005)(52536014)(7696005)(4326008)(71200400001)(33656002)(186003)(66476007)(508600001)(38070700005)(86362001)(66446008)(66946007)(64756008)(122000001)(38100700002)(9686003)(76116006)(8936002)(2906002)(53546011)(6506007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzNYd1JsRjZLMjlGV1kxUmM0cHdNblUzMGs0QlRNVkVZbjdhUlowN0dLZ1NN?=
 =?utf-8?B?SE9hZ0VCSENBT3RRUndRSDIzeGVJY1pFQ3BDRUVydVRNMTgvTnZuaWVDVXd4?=
 =?utf-8?B?cExnNnBTeTA5RzRyeWszbGR3S0QzVDlqcEkvYTk4cFYvQlVvLzhXQ3NUaXhh?=
 =?utf-8?B?cjRKcjZqanZLYVJSdVJzQkl6UFl3R1Zwd21RSUtpNEhQNFpvTklnSVdSMGRE?=
 =?utf-8?B?eXE5NGhLVEJIOVZXNTJTU0lvMm1iR2krK3FhQzNXSzF3M3lmOFlXK2cyOWxs?=
 =?utf-8?B?b2pOU1FZNFk5c21xR0F5SWJWekpHdjl4WXJBZlJFenNNWExrVithZkNRUHRi?=
 =?utf-8?B?UkJmYm5jUnM2YVEwNmNuVUZxd3hZZ3h5MStwQzMrNjU0ekd2VFRKTVlkYUd3?=
 =?utf-8?B?ZEZkZFV4U1lvMlJFd1d1RkhXSnZzRzhlTnlvc1l2eTBaVlQxV2UrUnRhWjVq?=
 =?utf-8?B?TUNTWkY3am1VNGJYbXl6dmlUZGl0YUpHTWdGekhKQUVIMkpnSjkrQmoxRWIy?=
 =?utf-8?B?Z1Q5Rk1vcEx2a09LNVd4bFIwVUg3SmIxRDg2UmFyZlFYaFpEWFBBRnpldHVZ?=
 =?utf-8?B?Zzd1dGlkaWxMRG5pRkZHbFg2ajdBUUs4M3hHZkgvR2J0Q1FoY0diaGVKSGI0?=
 =?utf-8?B?dXFaRCtxd0V3R29BSW1OUkl1MFhXRmQrbXRiQmlqM2J2T3Q2L3Y2U1hXQU1D?=
 =?utf-8?B?ZkZyeTduck5Mc1M5Yjl6TlFUSUJSaEJ6RzFhZ05NM0IrRkxHVm5kWjh2a3RM?=
 =?utf-8?B?QWhOdzU2aGtvRGxocit3ditnb3lteGxRRU5ObldiYS91MnJNRmtGUzVvWnlL?=
 =?utf-8?B?ZENYSmNoWHNVa1JUeTdQRm5hYmY5RUxENDZPUFNxNGxSNDY3NXpIUkZYZVF1?=
 =?utf-8?B?UnVjelVJL0NEck44M0Zvek1NOU5IMHpCOXpIRzlsUWcvdW94Vnd1ZzJNRjlF?=
 =?utf-8?B?U0JZbHloRy9MOXlYR2Y2ekRxQTZRRzJaK0xZcDRMcEEvRSs4ekF3ZEw4UWcv?=
 =?utf-8?B?bUNHZWFUNDYraVh6MXl0ditpV2FCazhnRkQ4SFdaMUVwNjFsZlVxRVJZV0FQ?=
 =?utf-8?B?RGhwQktJM3hQRDI1elRiVTBSY3hCdHhoS3pkR1NPZ2RrNG11MU9ud0g4U0wy?=
 =?utf-8?B?enVxVWx4QmxkTDJTNllVM09qbXVSSjA5VlVSTnBCNWVuNkQyWFI1dXNobFVs?=
 =?utf-8?B?VVZVL2xQbzhjcmx0VjNHeWRoL3R5dnZ6NnlDRlQ3U2h1NWJyVnBrTDE3bHdH?=
 =?utf-8?B?THl1NXAwcjZmdC81TklaSGI0MHJoNmJ6ZEdzUks5clQvNUxJQjFDOGwrYVBp?=
 =?utf-8?B?RVRMRFZ6RktRR29MdlVzT1ZkM0JUdkoyTFVwT2pjZzZXZVp6MTJyMGcra3o3?=
 =?utf-8?B?YUJSSEVvb05NdmJoNUFxd1c2YVd1YURiQkU1Z0Rqd3Zsc2RzTHRNUzE3Z01D?=
 =?utf-8?B?bVNESFZYMXhNR0tMcXExKytCa0tBT09Gck40UjkxV1J2dmFwdXdRUzNTeVQr?=
 =?utf-8?B?dnVwYisvRjliOU1CUWNGTGcxUk1NM2pGYjMvcTFzbWhVTVphNUF3Y1JJRU9L?=
 =?utf-8?B?ZnpIQ05DSGNEeFdOWlo2ajZyTWE1cjZEdjZUY2pPRFVqZmpUckNqdkljZGpU?=
 =?utf-8?B?Y3FGSnBmWmZobXlVNWNxZE13ZjMybFFlZHVPUDliUFRzelc5L05rYU5QLzdm?=
 =?utf-8?B?OExlMUMzRTVkTUpWLzgvTnhEbDFrQy9DeTVnSUdxWGRGN0R0Qk0xbzZ3aWVa?=
 =?utf-8?B?clFQaTdvNDV5d3JDUUNrU3hYOGNKRlFHWnZKSW5RaWVmd1FEYk83Sk04V1R3?=
 =?utf-8?B?ZWE1SHd4VFUwZi9WbFdEcFFURjdWa0FNUXJkbkhlNHhpOUlxUmFuZFV0blJH?=
 =?utf-8?B?aFlQclBOYm54eXl1dW56cURLbkJlYmV1d1FKenMrekNYNDVpOXlpbjJabnpW?=
 =?utf-8?B?ZWhBQnhIWDBKR0dKQVhzSkNiejF3QnV0NnlBclo4Vk5EeGJYRTg4VHQyd3FY?=
 =?utf-8?B?OVE2NnZHN21xUW15elpNZlFGS0xTV1V1THNLVFpzYjFCVzJWeFgrREdhK2pj?=
 =?utf-8?B?dUNwcWpPekRLT2pTenFpOFlyRGFPRkdER3h6MWsyRytFeUkvSDBCeXptQ3lk?=
 =?utf-8?B?bmlNUUFUOGN6SlNucTRRMkdTTjAxUmdqME9kM2tNRGJHZnUxWllyMndaaGFP?=
 =?utf-8?B?MXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0027.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e9ce3b-5282-40c4-5967-08d9a00c3668
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2021 03:27:36.0746 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V7P1lTyPY1N71icYWtJc8Pr/7Od8kThdFRw7XJM0nrlKsRMeHJ/1jDwsyji7aV6VpFPneJUB/6FJbd5ate/jPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5471
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciA1LCAyMDIxIDExOjE3
IEFNDQo+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+OyBNYXJrdXMgQXJt
YnJ1c3Rlcg0KPiA8YXJtYnJ1QHJlZGhhdC5jb20+DQo+IENjOiBxZW11LWRldiA8cWVtdS1kZXZl
bEBub25nbnUub3JnPjsgTGkgWmhpamlhbg0KPiA8bGl6aGlqaWFuQGNuLmZ1aml0c3UuY29tPg0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIFY1IDEvM10gbmV0L2ZpbHRlcjogT3B0aW1pemUgdHJhbnNm
ZXIgcHJvdG9jb2wgZm9yIGZpbHRlci0NCj4gbWlycm9yL3JlZGlyZWN0b3INCj4gDQo+IA0KPiDl
nKggMjAyMS8xMS80IOS4i+WNiDE6MzcsIFpoYW5nLCBDaGVuIOWGmemBkzoNCj4gPj4+Pj4NCj4g
Pj4+Pj4gSSB3b25kZXIgaWYgd2UgbmVlZCB0byBpbnRyb2R1Y2UgbmV3IHBhcmFtZXRlciwgZS5n
IGZvcmNlX3ZuZXRfaGRyDQo+ID4+Pj4+IGhlcmUsIHRoZW4gd2UgY2FuIGFsd2F5cyBzZW5kIHZu
ZXRfaGRyIHdoZW4gaXQgaXMgZW5hYmxlZC4NCj4gPj4+Pj4NCj4gPj4+Pj4gT3RoZXJ3aXNlIHRo
ZSAidm5ldF9oZHJfc3VwcG9ydCIgc2VlbXMgbWVhbmluZ2xlc3MuDQo+ID4+Pj4gWWVzLCBDdXJy
ZW50ICJ2bmV0X2hkcl9zdXBwb3J0IiAgZGVmYXVsdCBlbmFibGVkLCBhbmQgdm5ldF9oZHJfbGVu
DQo+ID4+PiBhbHJlYWR5IGZvcmNlZCBmcm9tIGF0dGFjaGVkIG5mLT5uZXRkZXYuDQo+ID4+Pj4g
TWF5YmUgd2UgY2FuIGludHJvZHVjZSBhIG5ldyBwYXJhbWV0ZXIgImZvcmNlX25vX3ZuZXRfaGRy
IiBoZXJlDQo+IHRvDQo+ID4+PiBtYWtlIHRoZSB2bmV0X2hkcl9sZW4gYWx3YXlzIGtlZXAgMC4N
Cj4gPj4+PiBJZiB5b3UgdGhpbmsgT0ssIEkgd2lsbCB1cGRhdGUgaXQgaW4gbmV4dCB2ZXJzaW9u
Lg0KPiA+Pj4gTGV0IG1lIGV4cGxhaW4sIGlmIEkgd2FzIG5vdCB3cm9uZzoNCj4gPj4+DQo+ID4+
PiAidm5ldF9oZHJfc3VwcG9ydCIgbWVhbnMgd2hldGhlciBvciBub3QgdG8gc2VuZCB2bmV0IGhl
YWRlciBsZW5ndGguDQo+ID4+PiBJZiB2bmV0X2hkcl9zdXBwb3J0PWZhbHNlLCB3ZSB3b24ndCBz
ZW5kIHRoZSB2bmV0IGhlYWRlci4gVGhpcyBsb29rcw0KPiA+Pj4gdGhlIHNhbWUgYXMgeW91ICJm
b3JjZV9ub192ZW50X2hkciIgYWJvdmUuDQo+ID4+IFllcywgSXQgd2FzLiAgQnV0IHRoaXMgc2Vy
aWVzIGNoYW5nZWQgaXQuDQo+ID4+IEN1cnJlbnQgInZuZXRfaGRyX3N1cHBvcnQiIGNhbid0IGRl
Y2lkZSB3aGV0aGVyIHNlbmQgdm5ldCBoZWFkZXINCj4gPj4gbGVuZ3RoLCB3ZSBhbHdheXMgc2Vu
ZCBpdCBldmVuIDAuDQo+ID4+IEl0IHdpbGwgYXZvaWQgc2VuZGVyL3JlY2VpdmVyIHRyYW5zZmVy
IHByb3RvY29sIHBhcnNlIGlzc3VlczoNCj4gPj4gV2hlbiBzZW5kZXIgZGF0YSB3aXRoIHRoZSB2
bmV0IGhlYWRlciBsZW5ndGgsIGJ1dCByZWNlaXZlciBjYW4ndA0KPiA+PiBlbmFibGUgdGhlICJ2
bmV0X2hkcl9zdXBwb3J0Ii4NCj4gPj4gRmlsdGVycyB3aWxsIGF1dG8gc2V0dXAgdm5ldF9oZHJf
bGVuIGFzIGxvY2FsIG5mLT5uZXRkZXYgYW5kIGZvdW5kDQo+ID4+IHRoZSBpc3N1ZSB3aGVuIGdl
dCBkaWZmZXJlbnQgdm5ldF9oZHJfbGVuIGZyb20gb3RoZXIgZmlsdGVycy4NCj4gPj4NCj4gPj4+
IEFuZCBteSAiZm9yY2Vfdm5ldF9oZHIiIHNlZW1zIGR1cGxpY2F0ZWQgd2l0aA0KPiB2bmV0X2hk
cl9zdXBwb3J0PXRydWUuDQo+ID4+PiBTbyBpdCBsb29rcyB0byBtZSB3ZSBjYW4gbGVhdmUgdGhl
IG1pcnJvciBjb2RlIGFzIGlzIGFuZCBqdXN0IGNoYW5nZQ0KPiA+Pj4gdGhlIGNvbXBhcmU/IChk
ZXBlbmRzIG9uIHRoZSBtZ210IHRvIHNldCBhIGNvcnJlY3Qgdm5ldF9oZHJfc3VwcG9ydCkNCj4g
Pj4gT0ssIEkgd2lsbCBrZWVwIHRoZSBmaWx0ZXItbWlycm9yL2ZpbHRlci1yZWRpcmVjdG9yL2Zp
bHRlci1yZXdyaXRlcg0KPiA+PiBzYW1lIGFzIHRoaXMgdmVyc2lvbi4NCj4gPj4gRm9yIHRoZSBj
b2xvLWNvbXBhcmUgbW9kdWxlLCBJdCB3aWxsIGdldCBwcmltYXJ5IG5vZGUncyBmaWx0ZXIgZGF0
YSdzDQo+ID4+IHZuZXRfaGRyX2xlbiBhcyB0aGUgbG9jYWwgdmFsdWUsIEFuZCBjb21wYXJlIHdp
dGggc2Vjb25kYXJ5IG5vZGUncywNCj4gPj4gYmVjYXVzZSBpdCBpcyBub3QgYXR0YWNoZWQgYW55
IG5mLT5uZXRkZXYuDQo+ID4+IFNvLCBpdCBsb29rcyBjb21wYXJlIG1vZHVsZSdzICJ2bmV0X2hk
cl9zdXBwb3J0IiBiZWVuIGF1dG8NCj4gPj4gY29uZmlndXJhdGlvbiBmcm9tIHRoZSBmaWx0ZXIg
dHJhbnNwb3J0IHByb3RvY29sLg0KPiA+PiBJZiB0aGUgImZvcmNlX3ZuZXRfaGRyIiBtZWFucyBo
YXJkIGNvZGUgYSBjb21wYXJlJ3MgbG9jYWwNCj4gPj4gdm5ldF9oZHJfbGVuIHJhdGhlciB0aGFu
IGNvbWUgZnJvbSBpbnB1dCBmaWx0ZXIncyBkYXRhPw0KPiA+Pg0KPiA+PiBUaGFua3MNCj4gPj4g
Q2hlbg0KPiA+Pg0KPiA+IEhpIEphc29uL01hcmt1cywNCj4gPg0KPiA+IFJldGhpbmsgYWJvdXQg
aXQsIEhvdyBhYm91dCBrZWVwIHRoZSBvcmlnaW5hbCAidm5ldF9oZHJfc3VwcG9ydCINCj4gPiBm
dW5jdGlvbiwgQW5kIGFkZCBhIG5ldyBvcHRpb25hbCBwYXJhbWV0ZXIgImF1dG9fdm5ldF9oZHIi
IGZvcg0KPiBmaWx0ZXJzL2NvbXBhcmU/DQo+IA0KPiANCj4gSXQncyBhIHdheSBidXQgcmV0aGlu
ayBvZiB0aGUgd2hvbGUgdGhpbmcuIEkgd29uZGVyIHdoYXQgaWYgd2UganVzdCBlbmFibGUNCj4g
InZuZXRfaGRyX3N1cHBvcnQiIGJ5IGRlZmF1bHQgZm9yIGZpbHRlciBhbmQgY29sby1jb21wYXJl
Pw0KDQpJdCdzIHdvcmtzIGJ5IGRlZmF1bHQgZm9yIHVzZXIgdXNlIC1kZXZpY2UgdmlydGlvLW5l
dC1wY2kgYW5kIGUxMDAwLi4uDQpCdXQgaXQgY2FuJ3QgcmVzb2x2ZSB0aGlzIHNlcmllcyBtb3Rp
dmF0aW9uLCBob3cgdG8gZml4L2NoZWNrIHVzZXIgY29uZmlndXJhdGlvbiBpc3N1ZToNCkZvciBl
eGFtcGxlIHVzZXIgZW5hYmxlICIgdm5ldF9oZHJfc3VwcG9ydCAiIGZpbHRlci1taXJyb3IgYW5k
IGRpc2FibGUgIiB2bmV0X2hkcl9zdXBwb3J0IiBmaWx0ZXItcmVkaXJlY3Rvcg0KQW5kIGNvbm5l
Y3QgYm90aCBmaWx0ZXIgbW9kdWxlcyBieSBjaGFyZGV2IHNvY2tldC4NCkluIHRoaXMgY2FzZSBn
dWVzdCB3aWxsIGdldCB3cm9uZyBuZXR3b3JrIHdvcmtsb2FkIGFuZCBmaWx0ZXJzIGRpZG7igJl0
IHBlcmNlaXZlIGFueSBhYm5vcm1hbGl0aWVzLA0KYnV0IGluIGZhY3QsIHRoZSB3aG9sZSBzeXN0
ZW0gaXMgbm8gbG9uZ2VyIHdvcmtpbmcuDQpUaGlzIHNlcmllcyB3aWxsIHJlcG9ydCBlcnJvciBh
bmQgdHJ5IHRvIGNvcnJlY3QgaXQuDQoNClRoYW5rcw0KQ2hlbg0KDQo+IA0KPiBUaGFua3MNCj4g
DQo+IA0KPiA+DQo+ID4gVGhhbmtzDQo+ID4gQ2hlbg0KPiA+DQo+ID4NCj4gPj4+IFRoYW5rcw0K
PiA+Pj4NCj4gPj4+PiBUaGFua3MNCj4gPj4+PiBDaGVuDQo+ID4+Pj4NCj4gPj4+Pj4gVGhhbmtz
DQo+ID4+Pj4+DQo+ID4+Pj4+DQoNCg==

