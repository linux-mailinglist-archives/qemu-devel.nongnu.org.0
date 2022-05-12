Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED6C524221
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 03:39:14 +0200 (CEST)
Received: from localhost ([::1]:56936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noxnN-0007zG-BV
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 21:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=613189c29a=pdel@fb.com>)
 id 1noxmU-0007Hq-BD; Wed, 11 May 2022 21:38:18 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:49638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=613189c29a=pdel@fb.com>)
 id 1noxmS-0005H6-AP; Wed, 11 May 2022 21:38:17 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24BMwki0012995;
 Wed, 11 May 2022 18:38:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=MGyt92l2WSvzKZAVGmW5OarmMBMQ4WgVza2jKlVn1Ek=;
 b=Aep6TUMKhdj7fluwql7FKJfy3N2zfPEK6MxboMnermAIFwh8mjPv13J7JWWDa9VTNJxU
 RtEHEL6LAG05Z2cybX7tMFWqe85zJHIzLzsvrYi00kINwZEwexKzPHvfiCIwH8DTHAeA
 CvyMLpGub0KZksipZLQIEL4QmW2YrIO5AYg= 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2175.outbound.protection.outlook.com [104.47.73.175])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3fyx8p9xq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 18:38:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPmCSPSn02mFrtu9f7cFDaFu6kmjvsMcHDgB82RaBLzVrHxlqNLl40UmUod54E+VG8TFii6bzg77+G6oYE5ELw1/yLuSC6XYyJBw3nF/gKl53qnYjRBO2vaNXpMwSzbXu4rtgvm0uBwh3w9ccwyGqlXZ307Nx/XnEVcOCFLRSKFjEbtYIQJW3EGne8l7m+THb1wsClnVtdYAuVNB3eVeoIaHYVea81YX34NRQe/hQwuGaQFKJnavtzo4EWiYYa0mIglwx/FzZXFME/1RkFZ/M07EFDpj6yMecs7CLwJXsozPvtR/itIhX44IQxAZ3sOmHQVQbQiYAf18TLal29o0dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGyt92l2WSvzKZAVGmW5OarmMBMQ4WgVza2jKlVn1Ek=;
 b=noQy2PU83Gz9ikXHryAl9eakxyfp904NRlHzBUG5KXwxQdbMjxHn1lC+SmODcOEFJoy6x0ofvFqpCAckqdmj687AQ0hKjPbxz4twtT7Y0qAB1SV1uK03jgfXpPjshn+nBCRkLxfSOv8J9V4IZJ7GGiwRj5/4tdeV5m71V1TOq/7ODoY80JunvvmcVmrjnd20phGG+DAud3VpGbUO2r4Zt1DSebijr5h3NqpYTib40PuKhwZMymsy/psY6QeIs4mqpYL1w2u2xLHPrQdkew1zx0eRCNLAv8FaqVcqpZn5asgmb7+qhYMR5jSFchkWzbBBMkh55q0Da4Udzv8vsoaEGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BN7PR15MB2402.namprd15.prod.outlook.com (2603:10b6:406:8c::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Thu, 12 May
 2022 01:38:03 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb%5]) with mapi id 15.20.5227.023; Thu, 12 May 2022
 01:38:02 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Cameron Esfahani via <qemu-devel@nongnu.org>, qemu-arm
 <qemu-arm@nongnu.org>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Alistair Francis
 <alistair@alistair23.me>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "hreitz@redhat.com" <hreitz@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "huth@redhat.com" <huth@redhat.com>, "lvivier@redhat.com"
 <lvivier@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, Iris Chen
 <irischenlj@fb.com>, Peter Delevoryas <pdel@fb.com>
Subject: Re: [PATCH v2] hw: m25p80: allow write_enable latch get/set
Thread-Topic: [PATCH v2] hw: m25p80: allow write_enable latch get/set
Thread-Index: AQHYZZ5ZWw2cAfFTiUOhGwZ1HOByLq0adpkA
Date: Thu, 12 May 2022 01:38:02 +0000
Message-ID: <B576A90F-3C37-494B-98A8-5EF21F47FB70@fb.com>
References: <irischenlj@fb.com> <20220512005411.2503971-1-irischenlj@fb.com>
In-Reply-To: <20220512005411.2503971-1-irischenlj@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44a55ed3-b185-41c6-d941-08da33b80e12
x-ms-traffictypediagnostic: BN7PR15MB2402:EE_
x-microsoft-antispam-prvs: <BN7PR15MB2402664D73AC7BB704B80281ACCB9@BN7PR15MB2402.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: akTHxulT7O9lOFVvyKBQ8wd9w5M761TjFRtpJRyHCVByvgGgZgwB/VLGRAINWOMfYqeGqVNFJimDbrqoLvLUJo4lssVBchEoDjVKLy166l6o1lHADsZ7dHXDLNMTp26nnSn6G5/pQKZxcf7TpCTPpRWeMs24fSMTiDxeMA9RQhUmNuYG50NGgv2+t4IdLKKk/ChGvUBv8zl2pbjcskV6kjqzWsQoY4L0Q1DsbLyW3njI7ILZulfYoOllv/YUofKUjtJ49zrs+ROA7eAOPSxp1GAUjZUspMz+HDlXkCZgpANP5x1JrFsXB6lfiLcHf3NpE8sQ1zWjnnamxKBv1+Epbmw4+A7sy63xbYcCwy88jsIHuiX9zpuZbtxDikxVox9RZR0KOQNNgosviQ4eQJqTMYn9lIO45CZIIDOPmtWGOeDlkn7j0jYt9uQoC8Lm7kXGn53kEWUKVwnDog1FRobpF6j3WgbWi/GtvrF+TuWGqksExzu85fB/brIKCbL9CK37OtvWxpaxDS/sOQFwAnXkPpzVI8MHcjeNfihOSb81cT6IGO/WYchp3PoZyeNGJK3txcZlqK4DHxv278/GIqHwsw9du3WZpL+imrQRKt9Ra4k2u5fyGA2Bbu6qz0HjDd+fkYUF0TtWHEkVFwdQcRz+ftg1jNfVpMS/LbxmVqZM0JeyTq+Jb2bc2adLvXC7WrWuRy1VuSIJIGzJATYU113IFgz+ynpFh0Zdl677vcrWGFn+wwQV6SRmP/SddJ6r3WY6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(8676002)(86362001)(38070700005)(66556008)(71200400001)(66446008)(64756008)(76116006)(66946007)(66476007)(508600001)(83380400001)(122000001)(316002)(54906003)(186003)(6486002)(38100700002)(6506007)(53546011)(109986005)(2616005)(6512007)(5660300002)(2906002)(7416002)(8936002)(36756003)(33656002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjhKRzFPbDR3MHUwUHhQKzVLWUxFWWhvd0NLc3U5RDNTR0g1UjFZZDBTSGJu?=
 =?utf-8?B?VHcvRVp6bWlMa3B1czJLdDlwOGtpRkUyZnM1L0JPczRxcmcrMjRIMEFsZ1BD?=
 =?utf-8?B?eWRuUXYybURZWis4Mk56NDdtVk5iUjFoRkNNeldVWlZ2N3J4cXF1SUxkZ3JH?=
 =?utf-8?B?SDlIUGNmTEsyZHl0MTBhRW1aSEg3ejZZYlJ0dFhpNjlTWEE3TGZEQVdmczQr?=
 =?utf-8?B?cXAyT1prNVpGKzRLZTFHZmp3TlFmL1dKMURIWUJWNnJXK1o2TjZnY29QdWti?=
 =?utf-8?B?anAyejN4K3o3K0J0Q05obkJ1SFBtazNjK0VjK00wMTlZQ2VLZDlPajBhSnhi?=
 =?utf-8?B?WTYxbTZTd0Fjclc3U09ESmhrcEZITW02RmpEamNRVkdxV3k4a2JyOWl2bFpp?=
 =?utf-8?B?aDBGNG9ZSndzSmtsUW9HZ0RUTTVGc2VhaS82TDRvTnFqOXBwUTcrTWZxdmwr?=
 =?utf-8?B?S1VKUE5haTc0cEFtOWlRVjJSdkJjcHIvRXJwdkhMeS9zMEFNRDlRQWFaOFZm?=
 =?utf-8?B?b1lQTzdwOEl3cW1UUlg3NkhTSlFpUFdpZXc4YlRrUm02VGFjckx0T29sSWFR?=
 =?utf-8?B?dHVhNDZ4alFYTjhHQTZoVndHcXFmNWUrNlpwaitNSGlBdkxmdnJuZmNHa2lQ?=
 =?utf-8?B?UmI4enRmUlJNdHBYaXJPL1ZXY0JxalkwT05yQTFCdVNZZlRlcXk1aUZ2Um5I?=
 =?utf-8?B?TDhpN0VUdkdvb2QzWlV3RDl0Zk1GcCtLdng2RDdCS3BlY0pzQUlqTElnUXlO?=
 =?utf-8?B?dEdGY0dVbU1rWVFsUGM2Z3FCYjNuY0U3VThiY09vWGZFV24yTmRqQVpYcHNG?=
 =?utf-8?B?TFZtYzkycVVMb2E2SWxpWWhKKzBOZ3pFQlNPWlZaVnJuY0Z4Z01Jd1Bpblhv?=
 =?utf-8?B?S3F5U0Y5RC9CUXV1aVlxek0zQnFTd3pwUDhFVy9YWCs3aFVYUkhYanhOV1pM?=
 =?utf-8?B?MGY0VkUxMDNMVXM5S01IbkQ0bmdETm9iMlRJWi9Icmd0cm9Ra1dyZW0rRWN5?=
 =?utf-8?B?NHo4bEdwWWNDQVg1N0FSZDJ6MnY0NlhlbE5xM2FGajhTZFBUZ3IyK0JLNHRt?=
 =?utf-8?B?NERmZEwvQndocWsrUWwrdFBGNmVXeWVqNmVKNHNvNGJ0MDI1dVRxSS9pZG55?=
 =?utf-8?B?cG0zL1dlZXZQWmxKbEJyVWlWZnJ3ZHhIa0xxUGR3bFhYYmVvVmN6VGhlRFJY?=
 =?utf-8?B?SXhaci9temRKRmY3SEVjczN1a1N5bGVpbkdzMEtyNTVZYy9ZNkpucy85Y2F6?=
 =?utf-8?B?enVLNzRzZ1ozb0RIWldFOUdqVmVlemNhemE1N0lZc3pmTHE1NGZnWEkvdy8r?=
 =?utf-8?B?bENtUU54ZkJzbjZIUWxOWFhVUjIxZVg4Q09GaDlxZWZEU2gwZHBBbkxvYzl0?=
 =?utf-8?B?aGZRQ2F2cUM3N3ltNDFYOGRndzYrVDY4UUVnZ2xwWlVNeGhJa3BzRHphbTFm?=
 =?utf-8?B?dzZ3UUVLYkludldiMU5oNys1K0pXMjZ0TGZzZmtzMjhuOWNNbVBUSUN3OUZj?=
 =?utf-8?B?ZEpzeW56cjVLdnlleVdSUUJBOUwrNzJMZUVjZjVJcy9raTRCK2ZEVXV4d1k4?=
 =?utf-8?B?MnMzeXJGV0NYQTJBNEMySjdYVGYzTWdRQlh3SlpVRWc1MUlzQm1lL1grcU5h?=
 =?utf-8?B?MFpCTUhyUHFEZm9EbEJVK1BxVVFEaXl5UlhnSEY2dnQwaDg1RUxvMTNCTmdS?=
 =?utf-8?B?NUxjZzc0T3g4aXA4QllVZGd4UjFEUHE4aG5uRUFxcjhtU21rMWMzVS9DbDNl?=
 =?utf-8?B?dGdIOEFDOVJURUx4ZmR6WldRRk12L0N1NHRibTh2RlN6MkVkU1QxUzEvczBC?=
 =?utf-8?B?eFM3cTk1WjNLeXpaZ1o3aU5sZFZSOVc1aFFVaDBHcEVJTnpiUUVyM2JqYnFI?=
 =?utf-8?B?YjFSRmp1VjBaS1hlQWRRYWZ4MVZXL3dnb2tWQW8xeU4xL1hVa2FnR041b0Vn?=
 =?utf-8?B?MTI2Sm5YSTE5ZWNLZE9zbCtGY0JtRGN5azA4aUduL0dqcEVJSW9kNDZOVjZO?=
 =?utf-8?B?YkF5RTZtclFxOTRybjJWbmc2K2tZTDFKaU5UTnIvQUZWeEhYQWE1S2FES1Ax?=
 =?utf-8?B?cSs3ekZDTEFKbituai9MTnVvUUFTZXg2MVJML2l0blZQNkxjZys2cXpudzlo?=
 =?utf-8?B?bXFwSXpLWlVZNGpDbmxEUjErSWdENk5keDZkWXEwVEtCekRMdTF1L0lMY0Vm?=
 =?utf-8?B?clY3ZUhEUDh4YnpQQVVHL0xObURJaXlCU0NwazNMak1jemk2dDBMV3ZIeVRu?=
 =?utf-8?B?Z0djRGdmaEphSVFJYm9DWC9SdmlPOUFiU09WdjBQWmNVd3hXY2dJb2RtUDF0?=
 =?utf-8?B?dmNzdmd4Z1FwV3d1Y2hGUFBaNERnYmh6T25tbWtTcTBvNXhjdE5taFZGbEQy?=
 =?utf-8?Q?z/8LV6srsZL0d0lg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22DE07548A410E4487D997220F6F25AE@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a55ed3-b185-41c6-d941-08da33b80e12
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2022 01:38:02.8836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XJSYW7yUDL9rycGqfajll4IAA2ognKcmGTBYcbqPShZx8r/lLEU5q4DJtU9SOPMq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR15MB2402
X-Proofpoint-GUID: vRHW5cswtCF9gilEmyFD0gSw_sHI3jzf
X-Proofpoint-ORIG-GUID: vRHW5cswtCF9gilEmyFD0gSw_sHI3jzf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-11_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=613189c29a=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

DQoNCj4gT24gTWF5IDExLCAyMDIyLCBhdCA1OjU0IFBNLCBJcmlzIENoZW4gPGlyaXNjaGVubGpA
ZmIuY29tPiB3cm90ZToNCj4gDQo+IFRoZSB3cml0ZV9lbmFibGUgbGF0Y2ggcHJvcGVydHkgaXMg
bm90IGN1cnJlbnRseSBleHBvc2VkLg0KPiBUaGlzIGNvbW1pdCBtYWtlcyBpdCBhIG1vZGlmaWFi
bGUgcHJvcGVydHkgdXNpbmcgZ2V0L3NldCBtZXRob2RzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
SXJpcyBDaGVuIDxpcmlzY2hlbmxqQGZiLmNvbT4NCj4gLS0tDQo+IFJhbiAuL3NjcmlwdHMvY2hl
Y2twYXRjaC5wbCBvbiB0aGUgcGF0Y2ggYW5kIGFkZGVkIGEgZGVzY3JpcHRpb24uIEZpeGVkIGNv
bW1lbnRzIHJlZ2FyZGluZyBERUZJTkVfUFJPUF9CT09MLg0KPiANCj4gaHcvYmxvY2svbTI1cDgw
LmMgICAgICAgICAgICAgfCAgMiArKw0KPiB0ZXN0cy9xdGVzdC9hc3BlZWRfc21jLXRlc3QuYyB8
IDIzICsrKysrKysrKysrKysrKysrKysrKysrDQo+IDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0
aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2h3L2Jsb2NrL20yNXA4MC5jIGIvaHcvYmxvY2sv
bTI1cDgwLmMNCj4gaW5kZXggNDMwZDEyOThhOC4uMDE5YmViNWI3OCAxMDA2NDQNCj4gLS0tIGEv
aHcvYmxvY2svbTI1cDgwLmMNCj4gKysrIGIvaHcvYmxvY2svbTI1cDgwLmMNCj4gQEAgLTM1LDYg
KzM1LDcgQEANCj4gI2luY2x1ZGUgInFhcGkvZXJyb3IuaCINCj4gI2luY2x1ZGUgInRyYWNlLmgi
DQo+ICNpbmNsdWRlICJxb20vb2JqZWN0LmgiDQo+ICsjaW5jbHVkZSAicWFwaS92aXNpdG9yLmgi
DQoNCkkgdGhpbmsgeW91IG1pZ2h0IGJlIGFibGUgdG8gcmVtb3ZlIOKAnCNpbmNsdWRlIHFhcGkv
dmlzaXRvci5oIiBub3cgdGhhdCB5b3XigJlyZSB1c2luZyBERUZJTkVfUFJPUF9CT09MLg0KDQo+
IA0KPiAvKiBGaWVsZHMgZm9yIEZsYXNoUGFydEluZm8tPmZsYWdzICovDQo+IA0KPiBAQCAtMTU1
OCw2ICsxNTU5LDcgQEAgc3RhdGljIGludCBtMjVwODBfcHJlX3NhdmUodm9pZCAqb3BhcXVlKQ0K
PiANCj4gc3RhdGljIFByb3BlcnR5IG0yNXA4MF9wcm9wZXJ0aWVzW10gPSB7DQo+ICAgICAvKiBU
aGlzIGlzIGRlZmF1bHQgdmFsdWUgZm9yIE1pY3JvbiBmbGFzaCAqLw0KPiArICAgIERFRklORV9Q
Uk9QX0JPT0woIndyaXRlLWVuYWJsZSIsIEZsYXNoLCB3cml0ZV9lbmFibGUsIGZhbHNlKSwNCj4g
ICAgIERFRklORV9QUk9QX1VJTlQzMigibm9udm9sYXRpbGUtY2ZnIiwgRmxhc2gsIG5vbnZvbGF0
aWxlX2NmZywgMHg4RkZGKSwNCj4gICAgIERFRklORV9QUk9QX1VJTlQ4KCJzcGFuc2lvbi1jcjFu
diIsIEZsYXNoLCBzcGFuc2lvbl9jcjFudiwgMHgwKSwNCj4gICAgIERFRklORV9QUk9QX1VJTlQ4
KCJzcGFuc2lvbi1jcjJudiIsIEZsYXNoLCBzcGFuc2lvbl9jcjJudiwgMHg4KSwNCj4gZGlmZiAt
LWdpdCBhL3Rlc3RzL3F0ZXN0L2FzcGVlZF9zbWMtdGVzdC5jIGIvdGVzdHMvcXRlc3QvYXNwZWVk
X3NtYy10ZXN0LmMNCj4gaW5kZXggODdiNDBhMGVmMS4uZmNjMTU2YmMwMCAxMDA2NDQNCj4gLS0t
IGEvdGVzdHMvcXRlc3QvYXNwZWVkX3NtYy10ZXN0LmMNCj4gKysrIGIvdGVzdHMvcXRlc3QvYXNw
ZWVkX3NtYy10ZXN0LmMNCj4gQEAgLTI2LDYgKzI2LDcgQEANCj4gI2luY2x1ZGUgInFlbXUvb3Nk
ZXAuaCINCj4gI2luY2x1ZGUgInFlbXUvYnN3YXAuaCINCj4gI2luY2x1ZGUgImxpYnF0ZXN0LXNp
bmdsZS5oIg0KPiArI2luY2x1ZGUgInFlbXUvYml0b3BzLmgiDQo+IA0KPiAvKg0KPiAgKiBBU1BF
RUQgU1BJIENvbnRyb2xsZXIgcmVnaXN0ZXJzDQo+IEBAIC00MCw2ICs0MSw3IEBADQo+ICNkZWZp
bmUgICBDVFJMX0ZSRUFETU9ERSAgICAgICAweDENCj4gI2RlZmluZSAgIENUUkxfV1JJVEVNT0RF
ICAgICAgIDB4Mg0KPiAjZGVmaW5lICAgQ1RSTF9VU0VSTU9ERSAgICAgICAgMHgzDQo+ICsjZGVm
aW5lIFNSX1dFTCBCSVQoMSkNCj4gDQo+ICNkZWZpbmUgQVNQRUVEX0ZNQ19CQVNFICAgIDB4MUU2
MjAwMDANCj4gI2RlZmluZSBBU1BFRURfRkxBU0hfQkFTRSAgMHgyMDAwMDAwMA0KPiBAQCAtNDks
NiArNTEsNyBAQA0KPiAgKi8NCj4gZW51bSB7DQo+ICAgICBKRURFQ19SRUFEID0gMHg5ZiwNCj4g
KyAgICBSRFNSID0gMHg1LA0KPiAgICAgQlVMS19FUkFTRSA9IDB4YzcsDQo+ICAgICBSRUFEID0g
MHgwMywNCj4gICAgIFBQID0gMHgwMiwNCj4gQEAgLTM0OCw2ICszNTEsMjUgQEAgc3RhdGljIHZv
aWQgdGVzdF93cml0ZV9wYWdlX21lbSh2b2lkKQ0KPiAgICAgZmxhc2hfcmVzZXQoKTsNCj4gfQ0K
PiANCj4gK3N0YXRpYyB2b2lkIHRlc3RfcmVhZF9zdGF0dXNfcmVnKHZvaWQpDQo+ICt7DQo+ICsg
ICAgdWludDhfdCByOw0KPiArDQo+ICsgICAgcW1wKCJ7ICdleGVjdXRlJzogJ3FvbS1zZXQnLCAn
YXJndW1lbnRzJzogIg0KPiArICAgICAgICJ7J3BhdGgnOiAnL21hY2hpbmUvc29jL2ZtYy9zc2ku
MC9jaGlsZFswXScsICdwcm9wZXJ0eSc6ICdXRUwnLCAndmFsdWUnOiB0cnVlfX0iKTsNCj4gKw0K
PiArDQo+ICsgICAgc3BpX2NvbmYoQ09ORl9FTkFCTEVfVzApOw0KPiArICAgIHNwaV9jdHJsX3N0
YXJ0X3VzZXIoKTsNCj4gKyAgICB3cml0ZWIoQVNQRUVEX0ZMQVNIX0JBU0UsIFJEU1IpOw0KPiAr
ICAgIHIgPSByZWFkYihBU1BFRURfRkxBU0hfQkFTRSk7DQo+ICsgICAgc3BpX2N0cmxfc3RvcF91
c2VyKCk7DQo+ICsNCj4gKyAgICBnX2Fzc2VydF9jbXBoZXgociAmIFNSX1dFTCwgPT0sIFNSX1dF
TCk7DQo+ICsNCj4gKyAgICBmbGFzaF9yZXNldCgpOw0KPiArfQ0KPiArDQo+IHN0YXRpYyBjaGFy
IHRtcF9wYXRoW10gPSAiL3RtcC9xdGVzdC5tMjVwODAuWFhYWFhYIjsNCj4gDQo+IGludCBtYWlu
KGludCBhcmdjLCBjaGFyICoqYXJndikNCj4gQEAgLTM3Myw2ICszOTUsNyBAQCBpbnQgbWFpbihp
bnQgYXJnYywgY2hhciAqKmFyZ3YpDQo+ICAgICBxdGVzdF9hZGRfZnVuYygiL2FzdDI0MDAvc21j
L3dyaXRlX3BhZ2UiLCB0ZXN0X3dyaXRlX3BhZ2UpOw0KPiAgICAgcXRlc3RfYWRkX2Z1bmMoIi9h
c3QyNDAwL3NtYy9yZWFkX3BhZ2VfbWVtIiwgdGVzdF9yZWFkX3BhZ2VfbWVtKTsNCj4gICAgIHF0
ZXN0X2FkZF9mdW5jKCIvYXN0MjQwMC9zbWMvd3JpdGVfcGFnZV9tZW0iLCB0ZXN0X3dyaXRlX3Bh
Z2VfbWVtKTsNCj4gKyAgICBxdGVzdF9hZGRfZnVuYygiL2FzdDI0MDAvc21jL3JlYWRfc3RhdHVz
X3JlZyIsIHRlc3RfcmVhZF9zdGF0dXNfcmVnKTsNCj4gDQo+ICAgICByZXQgPSBnX3Rlc3RfcnVu
KCk7DQo+IA0KPiAtLSANCj4gMi4zMC4yDQo+IA0KDQo=

