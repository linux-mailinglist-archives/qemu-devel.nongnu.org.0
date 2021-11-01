Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CDE44140B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 08:16:53 +0100 (CET)
Received: from localhost ([::1]:42074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhRYq-00016p-Hg
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 03:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mhRXZ-0000LV-KR
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 03:15:33 -0400
Received: from mga05.intel.com ([192.55.52.43]:14589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mhRXT-0005Ni-7y
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 03:15:32 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="317159561"
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="317159561"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 00:15:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="488529048"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 01 Nov 2021 00:15:18 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 1 Nov 2021 00:15:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 1 Nov 2021 00:15:17 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 1 Nov 2021 00:15:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToY5BH/ODvf6buWYYR1F9fhsmCIC71Y1Ashq6VVJfaHJZFS2h6gx2fBhOZiMcEtMQU0xWZQl+u6aaXi8xoWQEB59gCOf1qQjxKrqmUUwVjxBKTxZqSmR1RhUTjJ/TemqH9FzW40mIL1p4+woC/L4IjptHFzwEBO9K8oaPWLDeGk+0yvZsmLHOeqK5iIL4SXfjheeyHzRlQ5ZNlpuhRghsVYBKZV2GPfT4MfSBPKAOibKeDcgnV9puUUYnK3PsuC+Agv5XxoU6q8FjjTUXl5Knurtk0AhYxfOV2qC/6asxgMTx8BNF604YQbawSky1HI0Se/+daxt3ibQIGCtlfMRGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFhMslEe0QEAUIFAVwXlVHfnHMLAMiVyx+aH5kcKM3w=;
 b=FF4ExZvIzlQfVG+lg+BfKliVpL6NtpONseBMxvnkK/PkAgPxnGNYOQg9dr0Y3AHdizo5wT8cwmNhxgS4JL5iXb0ok6xI+GAdDFGFsMhNFuNG59LIhDXw97MzbcOeJ1G0/warRUw/7ELY9ejq8gUuI/qtr00GAlDGxryZ43lPaSFQ/JFcogTqsw2eFqUrFFJibovarru7fvuImQsW/ISWqcIlx8yf9Oj/vo2hAPwaBJlwahWQgI0winuIMuLI3Ym8R6qfYsyF9OfLHrpCePcVyf8KjNkQzq3XLBDYWw9JKeF4SnLRd77DmkfPkJYDzAVhHaBpIfIJ67ZzhSc9IE5z0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFhMslEe0QEAUIFAVwXlVHfnHMLAMiVyx+aH5kcKM3w=;
 b=zIJC5jGY0HM3sfqkQrdnXBwU3isuJ9kZLyz78ouPN0Fbj4z9XHGksQ5JML4z8u+ukt4lGfj+6Ud99WMxOjHWZfW9aGjGx4CA7mslN3/gEFSHkLN1ncWwYEX7APSElcl5VGRpfLISYvpnpbyHQufgcOCcelwviJXMtibUHabINbo=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MWHPR11MB1662.namprd11.prod.outlook.com (2603:10b6:301:e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Mon, 1 Nov
 2021 07:15:16 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::359f:549e:18bf:fa8b]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::359f:549e:18bf:fa8b%4]) with mapi id 15.20.4649.015; Mon, 1 Nov 2021
 07:15:16 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
Thread-Topic: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
Thread-Index: AQHXy9x7gE+VGPrLuEuUpJeh4vPmyavpTZSAgABPWuCABHFUgIAAMzPw
Date: Mon, 1 Nov 2021 07:15:16 +0000
Message-ID: <MWHPR11MB00315CFF0E7854146B5C9AE69B8A9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211028090556.3168043-1-chen.zhang@intel.com>
 <20211028090556.3168043-2-chen.zhang@intel.com>
 <c603b048-1cee-1396-811d-8be857aa932b@redhat.com>
 <MWHPR11MB0031A0311824C3DF060B64E39B879@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsjn0nz4N+O4s9Y0m0gEYXu9WKstP9LHE4F=m5mOR3dcA@mail.gmail.com>
In-Reply-To: <CACGkMEsjn0nz4N+O4s9Y0m0gEYXu9WKstP9LHE4F=m5mOR3dcA@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 8f6da5d5-eae4-4442-ff8f-08d99d075aba
x-ms-traffictypediagnostic: MWHPR11MB1662:
x-microsoft-antispam-prvs: <MWHPR11MB1662D2217D3FFAB3736C9E2A9B8A9@MWHPR11MB1662.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xTuHZOPjW/YMz55FxgRF2alYbmTkoLajdLk1f2bj4zWs8kqX7okLgpVi1GAklhN8S19lc1fj8eyJIM17R+mMlrmbNxxcGM+jdt85y68/JGWQejzqqGwIx6Oh23d/cWeA4Wu+2fSS3EpTxKB/9ZVeSiWxtVgwIBHH3n05l8yBkMIBbmHSh5MZQn8tT2OkTERsNrtlA0DYr3i6++DVkBRy4oW/87RpV0yweOeJWBE8WE1c1sSC0iQkYFoWJild3bCE45byq8GgtFn3g4v6vgRkLKPR4Um85hT9KM+TWZ5jNd7KZ72bDKcuD40lqQzWbHCX5wEtropxsQ44DHM23y2tibZ32x1th7IPExP3OLSC2EZMqqFOqmoDkPraHZsom40LCpiFikGh+fFtPgmIL9Z1a4V0iGuW3F1x0CTxpQJhsvlaDxg+IVsZ6EalS9ffPGnkwLtLZT389cCS6JdhAcQQkd3iYzQBrsOYxS38hj5qfdoivmfKaAxZP6XkmlDzsgDQ2FIvVwGZgXt15vTEsTB45bG7J2NE7+pvh6ppoC2iE8DNB4idA7njWlt5on03F1ZcTsAIU/2cDBPbgvDTNYo6+SYDXfQTBtQzJKPKCEp2YXVF/+A1aCboUckuImJj8Jxf2bq6w/8/RAg4l0zrZVtjkrffFKoL4SPOhnW0nB8UBsvCKtstdhqozNwYTTdGXoOFVSQx6BsCXJTurG23xKdw0Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(71200400001)(2906002)(83380400001)(6916009)(316002)(33656002)(52536014)(66946007)(9686003)(55016002)(54906003)(64756008)(66476007)(8676002)(82960400001)(66446008)(8936002)(7696005)(66556008)(508600001)(4326008)(6506007)(5660300002)(26005)(53546011)(122000001)(38070700005)(76116006)(38100700002)(86362001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjlXK0tBREdIREhyYWd1OUp6Smw3WFRMSTRXZGFOWXBQcVFVOVIxUmVNQy9T?=
 =?utf-8?B?YlJ4K3BiVWwvUk5ENVZ2eVI3TGU5MlRzdExORWkwcmZDZStzT2tnZmpDSlpr?=
 =?utf-8?B?ZFFDdm8vcDhCS1ZLcDZwOENUdUp6M2l1RElzaWRvQnRXMXZvVisra25mR2Rv?=
 =?utf-8?B?ZFZxZm91UXR2MkNSQXdvVjJyNG5mckR4dXgxNVFFZXpzeEZDai81S1pDMDM0?=
 =?utf-8?B?a01kbEJtdlpWZko3L3BUakV0Ni9xaHd6dGtwMVZkSkpjdm5EeXRZZE9VK083?=
 =?utf-8?B?NXc3UFp3YU5jeEhzaUlmV2xVdnRYRVdFSnUxVVlFcEtPODlUNDJiSWVMVVA2?=
 =?utf-8?B?d2RkWnJ4M01IUVV0ZldJWlhWay9sd3Vad1VWaGN3aW1lVm8xTlo1WlRMK3JK?=
 =?utf-8?B?T0hBSU5kemlzaXV0Um9iekZ3L2N3dXAyQkNDd0w3MjhxM3NCZUhhRUM4a1VD?=
 =?utf-8?B?YituZ0FzZGxXUzJjc0N3ZmtBWXptT2ttVWI0N1BoY2Y1VXFrdFJOdDg5aFJn?=
 =?utf-8?B?Nzd5clVocWF4ekdpUnRWZmJTWmhFQlBsL08yT0xmT281NitObVRibERkdEpO?=
 =?utf-8?B?SVN6MFVZWnNiT0FNSnJsVHNhaEVMOFZZN0FVSFQ4K2hiRTk5aTZFZjZaUkd4?=
 =?utf-8?B?cm15Ni9GOG45VVk1TEVNQTVhMEh0SmhQcGVPbW1OY2pPeXF4Nk8yTDBYa0tW?=
 =?utf-8?B?Q1NvT2Y2bEp3NiszeElIVC9NY3lJdWg3OEJYcnBpQ2t5TTVZQlZLWElIOWFV?=
 =?utf-8?B?eGFoTmNaczc4V1VQUWpKd1lsSUNHdDJISW5sOTdGWDZhQTZXbmd4WW9rd3pM?=
 =?utf-8?B?cUlVNXk3aDNKWHJFQ3ZOZEg2dHNDR1kvbUNMSUJaaXpYOVZaS0Q4MHQyODAr?=
 =?utf-8?B?MzlNT1VFU2srTFN5cU4xa011UHBBcVBUMVRGMGNtZVRTWVpqcVNkNGtRWnFv?=
 =?utf-8?B?V09LRlZrUDVLM2V3VExaVFdWbmlkVzVuVTM2bzdsbWozSEJGZ0pyN2cyRVVU?=
 =?utf-8?B?aUNmRktMb2FqRHJvdVZWam90Y2ptRUptcTVUT2VhcUxJYmRpOEM4U1Rualhu?=
 =?utf-8?B?K3BSenJCNUcrVnhFTlZVd3M5RGtQZ1cybWlHZElhNTNQOFNaczNBaTc1Ri9k?=
 =?utf-8?B?aW5Ua2NsdmtMb0MrRUJ3R1FScUVOam9RS0liWThFL0lJMXN1UTVwMHhUVUtm?=
 =?utf-8?B?Y25Da3ZhSWVkckc2TWJHRVJRcW91bkVZay9OdWtCMzJTQkVsV0xWQXJiQWdo?=
 =?utf-8?B?cmQ0VWdqaTNlV3BobFM1TGlKWHlxTEtPSWpKaGxxcVFFNDJxb1puU3ZVZHVy?=
 =?utf-8?B?UDY3ZEpVOW9nUmQrUllpMW8yNW1yUjR1WHA5Y1JjaVQrWHovQ3RHakI5UlY1?=
 =?utf-8?B?MFA5V1U0QkJhQndtM1RkeG45dU9Ebm5GQ28xOXI2SXlvSEd4dU12cHIzZ2Fq?=
 =?utf-8?B?TG1OS0pITjhhYU9KaEYyYjJiVjJRQWZwNlNySTI2dlU4Q0RnNDlCSEN5a3ZH?=
 =?utf-8?B?bUFObjM4dmNGdE5zS1ViL3gxSzczOUU0UitmZlJ5bDJvMDJNWW5iUU5lejFk?=
 =?utf-8?B?dzVhY3d3UTErQkh5L1NPOEJzNmxuMWpwNGFWMVU5Q1Q1M2pWNm9XSGNnOTRL?=
 =?utf-8?B?MGlBREhYUlZXV1BMcUpETTlKQzJuN3BYVTVLVW5wK0N1STQ3bnBVUlMzUXg2?=
 =?utf-8?B?NStVNkR1d25mamlOcTlSR2xEUkdPMnJGdFBDUjNuek9GbXVsamNDTHR2ejVi?=
 =?utf-8?B?SjJiVHd2YVN3V1lvV2pJUFhlWXhQeG9aZ3JwV05QbTJreWZGMk5QSFZ5eGEz?=
 =?utf-8?B?MmtwOXFQeStiOWRmTDlpZXkxVDR1T3NxdVFsdWVsWHBKdXBvenlsN1dLTXh0?=
 =?utf-8?B?U0lpcVhEUlNvUGM2Sm1FUGtSL01pakNFMHV6WGR2cy9IdjBDVFdMdFRyNkQ2?=
 =?utf-8?B?MlhmcWhxV0U3Y2ErNGhzRHhBUCtkQWdyV3NJYWhGTnR6a3FQRjVIWkRPRGk5?=
 =?utf-8?B?em9ma2NUdC96SndZczJzQ3hXdUVubVlDdWJvQlBuRVlUTDdvSWNnNldPcm1v?=
 =?utf-8?B?ZmdrRzZINXA4dko3Ym1iSytKSWx6RFNGN0JUNVhNclBCb0o1NnRaQkRLTk1I?=
 =?utf-8?B?WHNIRDc5SFJQV0gwZzNxYnFLdy9PLzJ6d2ZCRnN5dmFqbHRwR1ZhQ2s3cDQy?=
 =?utf-8?Q?oNJkLoJG2ysX5feo2m/HcKs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6da5d5-eae4-4442-ff8f-08d99d075aba
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2021 07:15:16.0713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M82/CJNDfsVIlI6tvTi539SnriRcc+nARkJDAlqoofuHEQwvmoUMd6ES4N/AYzyU/UOOHoRgBhI96XkHBtFvzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1662
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciAxLCAyMDIxIDExOjQ2
IEFNDQo+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+DQo+IENjOiBxZW11
LWRldiA8cWVtdS1kZXZlbEBub25nbnUub3JnPjsgTWFya3VzIEFybWJydXN0ZXINCj4gPGFybWJy
dUByZWRoYXQuY29tPjsgTGkgWmhpamlhbiA8bGl6aGlqaWFuQGNuLmZ1aml0c3UuY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIFY1IDEvM10gbmV0L2ZpbHRlcjogT3B0aW1pemUgdHJhbnNmZXIg
cHJvdG9jb2wgZm9yIGZpbHRlci0NCj4gbWlycm9yL3JlZGlyZWN0b3INCj4gDQo+IE9uIEZyaSwg
T2N0IDI5LCAyMDIxIGF0IDQ6MDggUE0gWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29t
PiB3cm90ZToNCj4gPg0KPiA+DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4gPiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiA+ID4gU2Vu
dDogRnJpZGF5LCBPY3RvYmVyIDI5LCAyMDIxIDExOjExIEFNDQo+ID4gPiBUbzogWmhhbmcsIENo
ZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPg0KPiA+ID4gQ2M6IHFlbXUtZGV2IDxxZW11LWRldmVs
QG5vbmdudS5vcmc+OyBNYXJrdXMgQXJtYnJ1c3Rlcg0KPiA+ID4gPGFybWJydUByZWRoYXQuY29t
PjsgTGkgWmhpamlhbiA8bGl6aGlqaWFuQGNuLmZ1aml0c3UuY29tPg0KPiA+ID4gU3ViamVjdDog
UmU6IFtQQVRDSCBWNSAxLzNdIG5ldC9maWx0ZXI6IE9wdGltaXplIHRyYW5zZmVyIHByb3RvY29s
DQo+ID4gPiBmb3IgZmlsdGVyLSBtaXJyb3IvcmVkaXJlY3Rvcg0KPiA+ID4NCj4gPiA+DQo+ID4g
PiDlnKggMjAyMS8xMC8yOCDkuIvljYg1OjA1LCBaaGFuZyBDaGVuIOWGmemBkzoNCj4gPiA+ID4g
TWFrZSB0aGUgdm5ldCBoZWFkZXIgYSBuZWNlc3NhcnkgcGFydCBvZiBmaWx0ZXIgdHJhbnNmZXIg
cHJvdG9jb2wuDQo+ID4gPiA+IEl0IG1ha2Ugb3RoZXIgbW9kdWxlcyhsaWtlIGFub3RoZXINCj4g
PiA+ID4gZmlsdGVyLXJlZGlyZWN0b3IsY29sby1jb21wYXJlLi4uKQ0KPiA+ID4gPiBrbm93IGhv
dyB0byBwYXJzZSBuZXQgcGFja2V0IGNvcnJlY3RseS4gSWYgbG9jYWwgZGV2aWNlIGlzIG5vdCB0
aGUNCj4gPiA+ID4gdmlydGlvLW5ldC1wY2ksIHZuZXRfaGRyX2xlbiB3aWxsIGJlIDAuDQo+ID4g
PiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFpoYW5nIENoZW4gPGNoZW4uemhhbmdAaW50ZWwu
Y29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gICBuZXQvZmlsdGVyLW1pcnJvci5jIHwgMzQgKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ID4gPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxNiBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkNCj4gPiA+ID4NCj4gPiA+ID4gZGlm
ZiAtLWdpdCBhL25ldC9maWx0ZXItbWlycm9yLmMgYi9uZXQvZmlsdGVyLW1pcnJvci5jIGluZGV4
DQo+ID4gPiA+IGYyMDI0MGNjOWYuLjI0ZDNlNDk4ZTkgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL25l
dC9maWx0ZXItbWlycm9yLmMNCj4gPiA+ID4gKysrIGIvbmV0L2ZpbHRlci1taXJyb3IuYw0KPiA+
ID4gPiBAQCAtMzksNiArMzksNyBAQCBzdHJ1Y3QgTWlycm9yU3RhdGUgew0KPiA+ID4gPiAgICAg
ICBDaGFyQmFja2VuZCBjaHJfaW47DQo+ID4gPiA+ICAgICAgIENoYXJCYWNrZW5kIGNocl9vdXQ7
DQo+ID4gPiA+ICAgICAgIFNvY2tldFJlYWRTdGF0ZSByczsNCj4gPiA+ID4gKyAgICAvKiBLZWVw
IGNvbXBhdGliaWxpdHkgZm9yIHRoZSBtYW5hZ2VtZW50IGxheWVyICovDQo+ID4gPiA+ICAgICAg
IGJvb2wgdm5ldF9oZHI7DQo+ID4gPiA+ICAgfTsNCj4gPiA+ID4NCj4gPiA+ID4gQEAgLTQ4LDcg
KzQ5LDcgQEAgc3RhdGljIGludCBmaWx0ZXJfc2VuZChNaXJyb3JTdGF0ZSAqcywNCj4gPiA+ID4g
ICB7DQo+ID4gPiA+ICAgICAgIE5ldEZpbHRlclN0YXRlICpuZiA9IE5FVEZJTFRFUihzKTsNCj4g
PiA+ID4gICAgICAgaW50IHJldCA9IDA7DQo+ID4gPiA+IC0gICAgc3NpemVfdCBzaXplID0gMDsN
Cj4gPiA+ID4gKyAgICBzc2l6ZV90IHNpemUgPSAwLCB2bmV0X2hkcl9sZW4gPSAwOw0KPiA+ID4g
PiAgICAgICB1aW50MzJfdCBsZW4gPSAwOw0KPiA+ID4gPiAgICAgICBjaGFyICpidWY7DQo+ID4g
PiA+DQo+ID4gPiA+IEBAIC02MywyMSArNjQsMTggQEAgc3RhdGljIGludCBmaWx0ZXJfc2VuZChN
aXJyb3JTdGF0ZSAqcywNCj4gPiA+ID4gICAgICAgICAgIGdvdG8gZXJyOw0KPiA+ID4gPiAgICAg
ICB9DQo+ID4gPiA+DQo+ID4gPiA+IC0gICAgaWYgKHMtPnZuZXRfaGRyKSB7DQo+ID4gPiA+IC0g
ICAgICAgIC8qDQo+ID4gPiA+IC0gICAgICAgICAqIElmIHZuZXRfaGRyID0gb24sIHdlIHNlbmQg
dm5ldCBoZWFkZXIgbGVuIHRvIG1ha2Ugb3RoZXINCj4gPiA+ID4gLSAgICAgICAgICogbW9kdWxl
KGxpa2UgY29sby1jb21wYXJlKSBrbm93IGhvdyB0byBwYXJzZSBuZXQNCj4gPiA+ID4gLSAgICAg
ICAgICogcGFja2V0IGNvcnJlY3RseS4NCj4gPiA+ID4gLSAgICAgICAgICovDQo+ID4gPiA+IC0g
ICAgICAgIHNzaXplX3Qgdm5ldF9oZHJfbGVuOw0KPiA+ID4gPiAtDQo+ID4gPiA+IC0gICAgICAg
IHZuZXRfaGRyX2xlbiA9IG5mLT5uZXRkZXYtPnZuZXRfaGRyX2xlbjsNCj4gPiA+ID4gKyAgICAv
Kg0KPiA+ID4gPiArICAgICAqIFRoZSB2bmV0IGhlYWRlciBpcyB0aGUgbmVjZXNzYXJ5IHBhcnQg
b2YgZmlsdGVyIHRyYW5zZmVyIHByb3RvY29sLg0KPiA+ID4gPiArICAgICAqIEl0IG1ha2Ugb3Ro
ZXIgbW9kdWxlKGxpa2UgY29sby1jb21wYXJlKSBrbm93IGhvdyB0byBwYXJzZSBuZXQNCj4gPiA+
ID4gKyAgICAgKiBwYWNrZXQgY29ycmVjdGx5LiBJZiBkZXZpY2UgaXMgbm90IHRoZSB2aXJ0aW8t
bmV0LXBjaSwNCj4gPiA+ID4gKyAgICAgKiB2bmV0X2hkcl9sZW4gd2lsbCBiZSAwLg0KPiA+ID4g
PiArICAgICAqLw0KPiA+ID4gPiArICAgIHZuZXRfaGRyX2xlbiA9IG5mLT5uZXRkZXYtPnZuZXRf
aGRyX2xlbjsNCj4gPiA+ID4NCj4gPiA+ID4gLSAgICAgICAgbGVuID0gaHRvbmwodm5ldF9oZHJf
bGVuKTsNCj4gPiA+ID4gLSAgICAgICAgcmV0ID0gcWVtdV9jaHJfZmVfd3JpdGVfYWxsKCZzLT5j
aHJfb3V0LCAodWludDhfdCAqKSZsZW4sDQo+ID4gPiBzaXplb2YobGVuKSk7DQo+ID4gPiA+IC0g
ICAgICAgIGlmIChyZXQgIT0gc2l6ZW9mKGxlbikpIHsNCj4gPiA+ID4gLSAgICAgICAgICAgIGdv
dG8gZXJyOw0KPiA+ID4gPiAtICAgICAgICB9DQo+ID4gPiA+ICsgICAgbGVuID0gaHRvbmwodm5l
dF9oZHJfbGVuKTsNCj4gPiA+ID4gKyAgICByZXQgPSBxZW11X2Nocl9mZV93cml0ZV9hbGwoJnMt
PmNocl9vdXQsICh1aW50OF90ICopJmxlbiwNCj4gPiA+ID4gKyBzaXplb2YobGVuKSk7DQo+ID4g
Pg0KPiA+ID4NCj4gPiA+IEkgd29uZGVyIGlmIHdlIG5lZWQgdG8gaW50cm9kdWNlIG5ldyBwYXJh
bWV0ZXIsIGUuZyBmb3JjZV92bmV0X2hkcg0KPiA+ID4gaGVyZSwgdGhlbiB3ZSBjYW4gYWx3YXlz
IHNlbmQgdm5ldF9oZHIgd2hlbiBpdCBpcyBlbmFibGVkLg0KPiA+ID4NCj4gPiA+IE90aGVyd2lz
ZSB0aGUgInZuZXRfaGRyX3N1cHBvcnQiIHNlZW1zIG1lYW5pbmdsZXNzLg0KPiA+DQo+ID4gWWVz
LCBDdXJyZW50ICJ2bmV0X2hkcl9zdXBwb3J0IiAgZGVmYXVsdCBlbmFibGVkLCBhbmQgdm5ldF9o
ZHJfbGVuDQo+IGFscmVhZHkgZm9yY2VkIGZyb20gYXR0YWNoZWQgbmYtPm5ldGRldi4NCj4gPiBN
YXliZSB3ZSBjYW4gaW50cm9kdWNlIGEgbmV3IHBhcmFtZXRlciAiZm9yY2Vfbm9fdm5ldF9oZHIi
IGhlcmUgdG8NCj4gbWFrZSB0aGUgdm5ldF9oZHJfbGVuIGFsd2F5cyBrZWVwIDAuDQo+ID4gSWYg
eW91IHRoaW5rIE9LLCBJIHdpbGwgdXBkYXRlIGl0IGluIG5leHQgdmVyc2lvbi4NCj4gDQo+IExl
dCBtZSBleHBsYWluLCBpZiBJIHdhcyBub3Qgd3Jvbmc6DQo+IA0KPiAidm5ldF9oZHJfc3VwcG9y
dCIgbWVhbnMgd2hldGhlciBvciBub3QgdG8gc2VuZCB2bmV0IGhlYWRlciBsZW5ndGguIElmDQo+
IHZuZXRfaGRyX3N1cHBvcnQ9ZmFsc2UsIHdlIHdvbid0IHNlbmQgdGhlIHZuZXQgaGVhZGVyLiBU
aGlzIGxvb2tzIHRoZQ0KPiBzYW1lIGFzIHlvdSAiZm9yY2Vfbm9fdmVudF9oZHIiIGFib3ZlLg0K
DQpZZXMsIEl0IHdhcy4gIEJ1dCB0aGlzIHNlcmllcyBjaGFuZ2VkIGl0Lg0KQ3VycmVudCAidm5l
dF9oZHJfc3VwcG9ydCIgY2FuJ3QgZGVjaWRlIHdoZXRoZXIgc2VuZCB2bmV0IGhlYWRlciBsZW5n
dGgsIHdlIGFsd2F5cyBzZW5kIGl0IGV2ZW4gMC4NCkl0IHdpbGwgYXZvaWQgc2VuZGVyL3JlY2Vp
dmVyIHRyYW5zZmVyIHByb3RvY29sIHBhcnNlIGlzc3VlczoNCldoZW4gc2VuZGVyIGRhdGEgd2l0
aCB0aGUgdm5ldCBoZWFkZXIgbGVuZ3RoLCBidXQgcmVjZWl2ZXIgY2FuJ3QgZW5hYmxlIHRoZSAi
dm5ldF9oZHJfc3VwcG9ydCIuDQpGaWx0ZXJzIHdpbGwgYXV0byBzZXR1cCB2bmV0X2hkcl9sZW4g
YXMgbG9jYWwgbmYtPm5ldGRldiBhbmQgZm91bmQgdGhlIGlzc3VlIHdoZW4gZ2V0IGRpZmZlcmVu
dCB2bmV0X2hkcl9sZW4gZnJvbSBvdGhlciBmaWx0ZXJzLg0KDQo+IA0KPiBBbmQgbXkgImZvcmNl
X3ZuZXRfaGRyIiBzZWVtcyBkdXBsaWNhdGVkIHdpdGggdm5ldF9oZHJfc3VwcG9ydD10cnVlLg0K
PiBTbyBpdCBsb29rcyB0byBtZSB3ZSBjYW4gbGVhdmUgdGhlIG1pcnJvciBjb2RlIGFzIGlzIGFu
ZCBqdXN0IGNoYW5nZSB0aGUNCj4gY29tcGFyZT8gKGRlcGVuZHMgb24gdGhlIG1nbXQgdG8gc2V0
IGEgY29ycmVjdCB2bmV0X2hkcl9zdXBwb3J0KQ0KDQpPSywgSSB3aWxsIGtlZXAgdGhlIGZpbHRl
ci1taXJyb3IvZmlsdGVyLXJlZGlyZWN0b3IvZmlsdGVyLXJld3JpdGVyIHNhbWUgYXMgdGhpcyB2
ZXJzaW9uLg0KRm9yIHRoZSBjb2xvLWNvbXBhcmUgbW9kdWxlLCBJdCB3aWxsIGdldCBwcmltYXJ5
IG5vZGUncyBmaWx0ZXIgZGF0YSdzIHZuZXRfaGRyX2xlbiBhcyB0aGUgbG9jYWwgdmFsdWUsDQpB
bmQgY29tcGFyZSB3aXRoIHNlY29uZGFyeSBub2RlJ3MsIGJlY2F1c2UgaXQgaXMgbm90IGF0dGFj
aGVkIGFueSBuZi0+bmV0ZGV2Lg0KU28sIGl0IGxvb2tzIGNvbXBhcmUgbW9kdWxlJ3MgInZuZXRf
aGRyX3N1cHBvcnQiIGJlZW4gYXV0byBjb25maWd1cmF0aW9uIGZyb20gdGhlIGZpbHRlciB0cmFu
c3BvcnQgcHJvdG9jb2wuICANCklmIHRoZSAiZm9yY2Vfdm5ldF9oZHIiIG1lYW5zIGhhcmQgY29k
ZSBhIGNvbXBhcmUncyBsb2NhbCB2bmV0X2hkcl9sZW4gcmF0aGVyIHRoYW4gY29tZSBmcm9tIGlu
cHV0IGZpbHRlcidzIGRhdGE/DQoNClRoYW5rcw0KQ2hlbg0KDQo+IA0KPiBUaGFua3MNCj4gDQo+
ID4NCj4gPiBUaGFua3MNCj4gPiBDaGVuDQo+ID4NCj4gPiA+DQo+ID4gPiBUaGFua3MNCj4gPiA+
DQo+ID4gPg0KPiA+ID4gPiArICAgIGlmIChyZXQgIT0gc2l6ZW9mKGxlbikpIHsNCj4gPiA+ID4g
KyAgICAgICAgZ290byBlcnI7DQo+ID4gPiA+ICAgICAgIH0NCj4gPiA+ID4NCj4gPiA+ID4gICAg
ICAgYnVmID0gZ19tYWxsb2Moc2l6ZSk7DQo+ID4gPiA+IEBAIC0yNTIsNyArMjUwLDcgQEAgc3Rh
dGljIHZvaWQNCj4gPiA+ID4gZmlsdGVyX3JlZGlyZWN0b3Jfc2V0dXAoTmV0RmlsdGVyU3RhdGUN
Cj4gPiA+ICpuZiwgRXJyb3IgKiplcnJwKQ0KPiA+ID4gPiAgICAgICAgICAgfQ0KPiA+ID4gPiAg
ICAgICB9DQo+ID4gPiA+DQo+ID4gPiA+IC0gICAgbmV0X3NvY2tldF9yc19pbml0KCZzLT5ycywg
cmVkaXJlY3Rvcl9yc19maW5hbGl6ZSwgcy0+dm5ldF9oZHIpOw0KPiA+ID4gPiArICAgIG5ldF9z
b2NrZXRfcnNfaW5pdCgmcy0+cnMsIHJlZGlyZWN0b3JfcnNfZmluYWxpemUsIHRydWUpOw0KPiA+
ID4gPg0KPiA+ID4gPiAgICAgICBpZiAocy0+aW5kZXYpIHsNCj4gPiA+ID4gICAgICAgICAgIGNo
ciA9IHFlbXVfY2hyX2ZpbmQocy0+aW5kZXYpOyBAQCAtNDA2LDE0ICs0MDQsMTQgQEANCj4gPiA+
ID4gc3RhdGljIHZvaWQgZmlsdGVyX21pcnJvcl9pbml0KE9iamVjdCAqb2JqKQ0KPiA+ID4gPiAg
IHsNCj4gPiA+ID4gICAgICAgTWlycm9yU3RhdGUgKnMgPSBGSUxURVJfTUlSUk9SKG9iaik7DQo+
ID4gPiA+DQo+ID4gPiA+IC0gICAgcy0+dm5ldF9oZHIgPSBmYWxzZTsNCj4gPiA+ID4gKyAgICBz
LT52bmV0X2hkciA9IHRydWU7DQo+ID4gPiA+ICAgfQ0KPiA+ID4gPg0KPiA+ID4gPiAgIHN0YXRp
YyB2b2lkIGZpbHRlcl9yZWRpcmVjdG9yX2luaXQoT2JqZWN0ICpvYmopDQo+ID4gPiA+ICAgew0K
PiA+ID4gPiAgICAgICBNaXJyb3JTdGF0ZSAqcyA9IEZJTFRFUl9SRURJUkVDVE9SKG9iaik7DQo+
ID4gPiA+DQo+ID4gPiA+IC0gICAgcy0+dm5ldF9oZHIgPSBmYWxzZTsNCj4gPiA+ID4gKyAgICBz
LT52bmV0X2hkciA9IHRydWU7DQo+ID4gPiA+ICAgfQ0KPiA+ID4gPg0KPiA+ID4gPiAgIHN0YXRp
YyB2b2lkIGZpbHRlcl9taXJyb3JfZmluaShPYmplY3QgKm9iaikNCj4gPg0KDQo=

