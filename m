Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F5E527AD2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 01:03:47 +0200 (CEST)
Received: from localhost ([::1]:42630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqNH8-00074G-Ik
	for lists+qemu-devel@lfdr.de; Sun, 15 May 2022 19:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=613436fd99=pdel@fb.com>)
 id 1nqNFO-00064k-97; Sun, 15 May 2022 19:01:58 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:28072
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=613436fd99=pdel@fb.com>)
 id 1nqNFK-0002WG-Uw; Sun, 15 May 2022 19:01:57 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 24FMwKOD026546;
 Sun, 15 May 2022 16:01:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=1bt779Xxi46Rrv2qwakzBZHa1IYFBgmk1bpJ4phcnTc=;
 b=gUonh7A6WV8n8PtdL5twRs3bH2T/77PWSWRzQfR5bTelW8datYQw5Z6p1ec7o2ZXT87Q
 OiXvDu5ahZGmqzretP1tlKhF8ilgdJneIQJTIhgPbZaBCea5hP+4jGaU4vmGjD0of9d+
 XBIG6EInu0MEieqnoByQWo7hQv12apzvi58= 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by m0089730.ppops.net (PPS) with ESMTPS id 3g27x96fdr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 May 2022 16:01:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9idv34Rb/frI9uxR/Sda9K29khqiCbdpyJbCUCwuXcb31aExbRpoYCXLF6A+e11K4q27YyeVjtXTKd5yBLxy8VBWwYLJLgfwmsJupeUGvkxQKjxUrqeMBdkvV3l7E+aI0kSbxFXf7t0Vn3CLNkZgxVhOKRE6OJgYwImTlqi5cwBekqdjKCBl0Yg8A77xsdDlj8NVIYfzTHKjn02ADxE3tW7HWp4kD0JHqVNLRxcT1gucTx9eykl+XzyE7+WAtLi2LVepbTI5tyhP03BXQnC5bRSH/+RVebEV+fE9irv5AnDZ25AGKSjXbGM4gQFEOUNEnwoUHTVltAMsbemuo8RsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bt779Xxi46Rrv2qwakzBZHa1IYFBgmk1bpJ4phcnTc=;
 b=E8lxvqbwAA9sbVw9ZN98VOr8l4xbnDHa82C+9mzqI4T6fSvAN7w51d7fjiUUtZAXiLZ9mGx92ZKLeaEWgdTj7SUNfFEDa6Xnl5BMtb8sQnF/BhzoBlSaa+8sXMnhhYH7aWnPjnseLwYiM9a2UZdA5ouFflzQWnEeNPlh35RCDavXOzhtmWYcwqhPxhKVHleN8PJJ7mq3KcAZlJD6FXB90ZRXv6i1vcTVzK+W1w7K/1xihI1DevqPyO9p0eRMn1DORnyf4Bc6TVcsxZJhGZWxsvzPLPtZrnvN7zsmTPebVmpcpXDQR19MnKtafyf9wys8L1NM+kOg+DmllIXfi1w/Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BY3PR15MB4819.namprd15.prod.outlook.com (2603:10b6:a03:3b6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Sun, 15 May
 2022 23:01:33 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb%5]) with mapi id 15.20.5250.018; Sun, 15 May 2022
 23:01:33 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: qemu-arm <qemu-arm@nongnu.org>, Cameron Esfahani via
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Jamin Lin
 <jamin_lin@aspeedtech.com>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?=
 <clg@kaod.org>, Peter Delevoryas <pdel@fb.com>
Subject: Re: [PATCH] aspeed: Introduce a get_irq AspeedSoCClass method
Thread-Topic: [PATCH] aspeed: Introduce a get_irq AspeedSoCClass method
Thread-Index: AQHYaKBFnbefg8bwGkWtKB9jtuF01K0gji8A
Date: Sun, 15 May 2022 23:01:33 +0000
Message-ID: <353DE7D8-A829-4F80-84A4-A0AA1EF17B29@fb.com>
References: <20220515211042.2332192-1-clg@kaod.org>
In-Reply-To: <20220515211042.2332192-1-clg@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b95f61fc-7571-4bd9-adf6-08da36c6db26
x-ms-traffictypediagnostic: BY3PR15MB4819:EE_
x-microsoft-antispam-prvs: <BY3PR15MB48193ADF0B33A7DE2173C481ACCC9@BY3PR15MB4819.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d81fvJHQXi1aupxdi/GB4prqhDh/qroAr0trop8AyIfWaLl+fN9qcmdlVHtfHO7CByn3CEScBq1Il9rAFcBZd3nVK445NFIVGD9rVQn9jLW6eOhWJxS5sJJjcQpi05I4bTum797Dok2r2B/CZIU8kg7XDaF2Zq8FoEn8o2njpXpzmLYIlugCeo+cbj3t8yrsHkwCU293k73Wbn24vIsR+IHRecEBjK9A623bheo06g1c3pHqmyVZgLHuB+Ml9NiZg+RjzeuB/uKORavmyA1KtKzIHtarlZVmql9TMWrTGcdQJwvOmNiw9lixQVWBz0CNf0FWl/bmOOfm/y+5yWFiXBnf9vJTcj9diy1JCgOA/evbRznGZ/v4QiqcSICFo9BG+AUeYHTqRfR+VFr074xoB86GLJJ44+v1TMmxfwT7RxUvQthowGp+O0Z8CirvldJaUTNqjQaVVZoypiqABcHywnWfxlU9/eX/rCGh6B8kXZrEcXOe7qe1x8Wau7YuCL77VbV3jIihp1V6XQ5QiWVPDsyIIfUQyao7uQeAd6I0K+KP/BPSrEGI0JL3m3JgtxRMNWo12Q47FaUsPg1N52H98ErdiwOS8hRzm8rFxOwzkd6m4k27/gHLmE10virMSrlq/oMUa7ZQWnM4HOYAQaqLOhd37Ru1t0VO7lL4/ASZdtIegyf/b8TKz2yO4BpCBfWzu6+v1hjpJaaxBAwWK8OGzr5iAC5FxW6U9A5QUUk2YZ46N93sg61NIx0cubjGpj6q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(6029001)(4636009)(366004)(2906002)(6486002)(5660300002)(508600001)(66476007)(76116006)(71200400001)(38070700005)(38100700002)(33656002)(316002)(4326008)(66946007)(8676002)(64756008)(66446008)(66556008)(8936002)(54906003)(53546011)(122000001)(83380400001)(186003)(109986005)(6506007)(66574015)(2616005)(6512007)(86362001)(36756003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUpMZG1IdUR4Q1JCbnR4dDJiTzhCU0tVS1VHUTNkTEVncUtzbDFWTU4rdnNP?=
 =?utf-8?B?Rkp3VGJ0aUc5OXVGdHlDYW9MdDRnUkVBdVBPVEkrTmtzanNoTy9iM1ZOYzkr?=
 =?utf-8?B?emdQTzdvK0QvNjZQMW1Ic3JwQnpCRi9yeUpPcDBWYlNad1JTN3pzV2JpSUxL?=
 =?utf-8?B?c2FmY0lZSllxRllUOU4yWEZLMkhmc3ZwdE5weFlUMTdjRGcrZWE3VncrMDk1?=
 =?utf-8?B?VTdsUENwbUp5WVltSVdvRVEvQ3RBaytwcGFmdDNHWWd0UmN3djVHVzhtandq?=
 =?utf-8?B?dmRyTG9yNTZmVjlXRzVRY3lhRVFhbkxrRlBXWFNGQXJwNEg4alNhOGRJeHF5?=
 =?utf-8?B?Z0FFdGx6TTNiR1BuM0o5VVhybkZnRkJBR3c0bTM0a3EzSHRUeS82WFVKdThy?=
 =?utf-8?B?cEZiVVFuaFJKd2kzL2Yvbi9LWGdHeHZZMFVjZFd4SDRiWmx0dERXeFZna2V6?=
 =?utf-8?B?c3Z3Q1MvdTluMERmOUxDTTlUS0ZHOENTNTJ2eE9YTEwvZDZMS2dnd2RHQ01D?=
 =?utf-8?B?dVFtdnlXK244WVU2aDg0YVc3WllTVHNEVC9sZEh4dUV6TkkwWlNxZU9CU01I?=
 =?utf-8?B?aC9CTU0ybVpZRXI5MnNxajNsVE55MDdleWNOMkpoVGJBN3p4SEpaMWFGZW5m?=
 =?utf-8?B?RGUwclR0NzA0MTB0dGxqbnMxMU8xM0NRSjFUK0hkQlFZN2xiT29sd01hUDVv?=
 =?utf-8?B?VkMwNS96eUpMNWYwbXVCVUk4YUx5WUJhM1FGTUV4OUdzL3FRWWNkQjQzMDVU?=
 =?utf-8?B?ZHgwVFdUVlFaLzdDbnp6UDgzQXNOa3Z2VS8yWVBjK1g5Y0xuSlM5OHlLOEg5?=
 =?utf-8?B?ZWgrd2RXVUpvOUxoT2dvKzBtVGp0NlRPSWduQnlJeGRicFNZdndYR2hHNkpS?=
 =?utf-8?B?Vjhwc0tMVjRkcklkdkN2aWN3U1N3T1VPbi9PcFRqUVh1S1IxTkJQUDRnL0Fz?=
 =?utf-8?B?Z0oyVHM4dVk5NEFlM1pNQ0NWVGM5blZ4L2dvYkUwZkhXRkJJUUQvc3JTWmpH?=
 =?utf-8?B?N05DdHZqRXhVWU1pbVE3cFc1dGhrcm1wU2Q4WEZSbUk1c3pybWFJcGpqcVZV?=
 =?utf-8?B?bEdaMi9mQjBUeDkraDlFWGRMQU9YZFZsVStHR2p4SDVDNHh0ak1kWDFsazZN?=
 =?utf-8?B?YnBTaHRsZElVOWpHdDNYQ3AvSUhNbFVSMUZwZlljaWpBR2lzU1Zna2JWTnFp?=
 =?utf-8?B?TkVXdkZZakc2OHVsbHM1b2VQZWE2UGlOYmJKT2tPODNtYjFseTZpdFRrTkhB?=
 =?utf-8?B?Z2dEdmE5S2UrbHJxSU9SLzJuTFRGdllQc0h1K2szZ0FHaFZGUUg0TjlYNmlE?=
 =?utf-8?B?TXZNdGJYWEo2SkVmanNCaFRXT3Arc1ZtNTZzc1BoVUpQdHAwcUFCTXR1OG5R?=
 =?utf-8?B?Wml1MldwbUtQZmxRcldwblZRN2pFcG9yVDNwZkJMa0hJd2tkMDk0WmU1bkpP?=
 =?utf-8?B?NkpBWEw1aFhJdkxPcUFiZkR4c3YrdWZ2RVM2M1NEV3pwNnllL0lsZU8ydHk2?=
 =?utf-8?B?aUR0RkNWaDROdUlFK1cxZUtWb3pjanB1bmhVOGp4T1d6Y3BYMnl1YXlzY1NI?=
 =?utf-8?B?WityK2pVbTFVNHd5NlYvUlRkdnIzbWZwb2VTU2MwdlV5QUpqc1lKNHdmbzFt?=
 =?utf-8?B?VzNZR1Jndlh0MXJ0MTROYklmZXF1TEV2NGJ1OEtYNVVBTGlkb1ZuTkU0VkdJ?=
 =?utf-8?B?V2ZpSURZQTNxd0dUMWg5NUtPaFZMVWlqYVkrWjJRMG9VU0lIOFUxcFkxajV5?=
 =?utf-8?B?MTdNMlJ0ZGI5UnluVkhhaU8yVUFnVG9ON2txbklITG1IditRc3lTYlBVR3Bq?=
 =?utf-8?B?N1VDOHdUWlJDVVZwdGw2YktmK3ZRWEFUS3BZdDZNeXArMVl0c3NwalVzcldK?=
 =?utf-8?B?MWNta0E1M0R0NDUvL2pEQUtXbnFabjQ5MTIwL05xeVJIWlBXY1lLc0VnVEN6?=
 =?utf-8?B?SkRCdmRkZjRxQTV3d0pQRmxvRnVsbVVLaWVvTFdxc3pVT3RybFJtazhBVXBP?=
 =?utf-8?B?VDNUU0VUODg3SmdzYUVSbTV6aVN4ZUd0Mit5QjRYVFRKZEpwMHBldHNBNXJa?=
 =?utf-8?B?TXQvaEJsQ3VLWnBMRnUxZXJiTEpGMGZ1SUl5SE9qbGNpS2gwMjdoQm80dzhB?=
 =?utf-8?B?WXlQa0NBVXRqY3JPaUZQWlhZQk81ZmJXL1lCOVExbHFJNVo0eXJhZzZqbkZU?=
 =?utf-8?B?TnQ5Wmx3U3B2VmpjM0dzUENsN2pyS1NDenF1cGNPQ0JpQmZHWHN1M2dtQmRq?=
 =?utf-8?B?WkdEcTI1MDFDb3hNMjlFdmVNQURnVWpMZTNxTGxETy9Nem1RaHN3WlV6cnIw?=
 =?utf-8?B?K1orSmN2OGRQelEzYXltQXJ4NXRUSEZibXROdkNFVVZoUWVCd0xFQm5qeHo5?=
 =?utf-8?Q?qZvW4JGjOCMKZm8c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5449157A34F9544F9CC777D78BAC91EA@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b95f61fc-7571-4bd9-adf6-08da36c6db26
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2022 23:01:33.3891 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jjd6mzn0ICFthu0L4hELmFGd9OfaOvZiH7q3i7W18/936YtLJFBmmVdSwkvf5lwF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR15MB4819
X-Proofpoint-GUID: f2PNRgNhr6z3wDMjSfo5rGh54hwvGsHC
X-Proofpoint-ORIG-GUID: f2PNRgNhr6z3wDMjSfo5rGh54hwvGsHC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-15_11,2022-05-13_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=613436fd99=pdel@fb.com; helo=mx0a-00082601.pphosted.com
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

DQo+IE9uIE1heSAxNSwgMjAyMiwgYXQgMjoxMCBQTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0Br
YW9kLm9yZz4gd3JvdGU6DQo+IA0KPiBhbmQgbWFrZSByb3V0aW5lIGFzcGVlZF9zb2NfZ2V0X2ly
cSgpIGNvbW1vbiB0byBhbGwgU29Dcy4gVGhpcyB3aWxsIGJlDQo+IHVzZWZ1bCB0byBzaGFyZSBj
b2RlLg0KPiANCj4gQ2M6IEphbWluIExpbiA8amFtaW5fbGluQGFzcGVlZHRlY2guY29tPg0KPiBD
YzogUGV0ZXIgRGVsZXZvcnlhcyA8cGRlbEBmYi5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEPDqWRy
aWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+DQo+IC0tLQ0KPiBpbmNsdWRlL2h3L2FybS9hc3Bl
ZWRfc29jLmggfCAgMyArKysNCj4gaHcvYXJtL2FzcGVlZF9hc3QxMHgwLmMgICAgIHwgIDMgKyst
DQo+IGh3L2FybS9hc3BlZWRfYXN0MjYwMC5jICAgICB8ICAzICsrLQ0KPiBody9hcm0vYXNwZWVk
X3NvYy5jICAgICAgICAgfCAxMSArKysrKysrKystLQ0KPiA0IGZpbGVzIGNoYW5nZWQsIDE2IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9o
dy9hcm0vYXNwZWVkX3NvYy5oIGIvaW5jbHVkZS9ody9hcm0vYXNwZWVkX3NvYy5oDQo+IGluZGV4
IGUxM2FmMzc0YjkyMy4uMzc4OWYzODYwM2U1IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2h3L2Fy
bS9hc3BlZWRfc29jLmgNCj4gKysrIGIvaW5jbHVkZS9ody9hcm0vYXNwZWVkX3NvYy5oDQo+IEBA
IC05NCw2ICs5NCw3IEBAIHN0cnVjdCBBc3BlZWRTb0NDbGFzcyB7DQo+ICAgICBjb25zdCBpbnQg
KmlycW1hcDsNCj4gICAgIGNvbnN0IGh3YWRkciAqbWVtbWFwOw0KPiAgICAgdWludDMyX3QgbnVt
X2NwdXM7DQo+ICsgICAgcWVtdV9pcnEgKCpnZXRfaXJxKShBc3BlZWRTb0NTdGF0ZSAqcywgaW50
IGRldik7DQo+IH07DQo+IA0KPiANCj4gQEAgLTE1Myw0ICsxNTQsNiBAQCBlbnVtIHsNCj4gICAg
IEFTUEVFRF9ERVZfSTNDLA0KPiB9Ow0KPiANCj4gK3FlbXVfaXJxIGFzcGVlZF9zb2NfZ2V0X2ly
cShBc3BlZWRTb0NTdGF0ZSAqcywgaW50IGRldik7DQo+ICsNCj4gI2VuZGlmIC8qIEFTUEVFRF9T
T0NfSCAqLw0KPiBkaWZmIC0tZ2l0IGEvaHcvYXJtL2FzcGVlZF9hc3QxMHgwLmMgYi9ody9hcm0v
YXNwZWVkX2FzdDEweDAuYw0KPiBpbmRleCA0MjcxNTQ5MjgyNTQuLmRkZWM1NzA2ZjNjMSAxMDA2
NDQNCj4gLS0tIGEvaHcvYXJtL2FzcGVlZF9hc3QxMHgwLmMNCj4gKysrIGIvaHcvYXJtL2FzcGVl
ZF9hc3QxMHgwLmMNCj4gQEAgLTYxLDcgKzYxLDcgQEAgc3RhdGljIGNvbnN0IGludCBhc3BlZWRf
c29jX2FzdDEwMzBfaXJxbWFwW10gPSB7DQo+ICAgICBbQVNQRUVEX0RFVl9LQ1NdICAgICAgID0g
MTM4LCAvKiAxMzggLT4gMTQyICovDQo+IH07DQo+IA0KPiAtc3RhdGljIHFlbXVfaXJxIGFzcGVl
ZF9zb2NfZ2V0X2lycShBc3BlZWRTb0NTdGF0ZSAqcywgaW50IGN0cmwpDQo+ICtzdGF0aWMgcWVt
dV9pcnEgYXNwZWVkX3NvY19hc3QxMDMwX2dldF9pcnEoQXNwZWVkU29DU3RhdGUgKnMsIGludCBk
ZXYpDQo+IHsNCj4gICAgIEFzcGVlZFNvQ0NsYXNzICpzYyA9IEFTUEVFRF9TT0NfR0VUX0NMQVNT
KHMpOw0KPiANCj4gQEAgLTI4MCw2ICsyODAsNyBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfc29jX2Fz
dDEwMzBfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqa2xhc3MsIHZvaWQgKmRhdGEpDQo+ICAgICBz
Yy0+aXJxbWFwID0gYXNwZWVkX3NvY19hc3QxMDMwX2lycW1hcDsNCj4gICAgIHNjLT5tZW1tYXAg
PSBhc3BlZWRfc29jX2FzdDEwMzBfbWVtbWFwOw0KPiAgICAgc2MtPm51bV9jcHVzID0gMTsNCj4g
KyAgICBzYy0+Z2V0X2lycSA9IGFzcGVlZF9zb2NfYXN0MTAzMF9nZXRfaXJxOw0KPiB9DQo+IA0K
PiBzdGF0aWMgY29uc3QgVHlwZUluZm8gYXNwZWVkX3NvY19hc3QxMDMwX3R5cGVfaW5mbyA9IHsN
Cj4gZGlmZiAtLWdpdCBhL2h3L2FybS9hc3BlZWRfYXN0MjYwMC5jIGIvaHcvYXJtL2FzcGVlZF9h
c3QyNjAwLmMNCj4gaW5kZXggZWVkZGE3YmFkYzM3Li4yNTVkYmM2Yjk1YWIgMTAwNjQ0DQo+IC0t
LSBhL2h3L2FybS9hc3BlZWRfYXN0MjYwMC5jDQo+ICsrKyBiL2h3L2FybS9hc3BlZWRfYXN0MjYw
MC5jDQo+IEBAIC0xMTQsNyArMTE0LDcgQEAgc3RhdGljIGNvbnN0IGludCBhc3BlZWRfc29jX2Fz
dDI2MDBfaXJxbWFwW10gPSB7DQo+ICAgICBbQVNQRUVEX0RFVl9JM0NdICAgICAgID0gMTAyLCAg
IC8qIDEwMiAtPiAxMDcgKi8NCj4gfTsNCj4gDQo+IC1zdGF0aWMgcWVtdV9pcnEgYXNwZWVkX3Nv
Y19nZXRfaXJxKEFzcGVlZFNvQ1N0YXRlICpzLCBpbnQgY3RybCkNCj4gK3N0YXRpYyBxZW11X2ly
cSBhc3BlZWRfc29jX2FzdDI2MDBfZ2V0X2lycShBc3BlZWRTb0NTdGF0ZSAqcywgaW50IGRldikN
Cj4gew0KPiAgICAgQXNwZWVkU29DQ2xhc3MgKnNjID0gQVNQRUVEX1NPQ19HRVRfQ0xBU1Mocyk7
DQo+IA0KPiBAQCAtNTcyLDYgKzU3Miw3IEBAIHN0YXRpYyB2b2lkIGFzcGVlZF9zb2NfYXN0MjYw
MF9jbGFzc19pbml0KE9iamVjdENsYXNzICpvYywgdm9pZCAqZGF0YSkNCj4gICAgIHNjLT5pcnFt
YXAgICAgICAgPSBhc3BlZWRfc29jX2FzdDI2MDBfaXJxbWFwOw0KPiAgICAgc2MtPm1lbW1hcCAg
ICAgICA9IGFzcGVlZF9zb2NfYXN0MjYwMF9tZW1tYXA7DQo+ICAgICBzYy0+bnVtX2NwdXMgICAg
ID0gMjsNCj4gKyAgICBzYy0+Z2V0X2lycSAgICAgID0gYXNwZWVkX3NvY19hc3QyNjAwX2dldF9p
cnE7DQo+IH0NCj4gDQo+IHN0YXRpYyBjb25zdCBUeXBlSW5mbyBhc3BlZWRfc29jX2FzdDI2MDBf
dHlwZV9pbmZvID0gew0KPiBkaWZmIC0tZ2l0IGEvaHcvYXJtL2FzcGVlZF9zb2MuYyBiL2h3L2Fy
bS9hc3BlZWRfc29jLmMNCj4gaW5kZXggNTg3MTRjYjJhMDFkLi4xNWI2NDFkYTlhMzYgMTAwNjQ0
DQo+IC0tLSBhL2h3L2FybS9hc3BlZWRfc29jLmMNCj4gKysrIGIvaHcvYXJtL2FzcGVlZF9zb2Mu
Yw0KPiBAQCAtMTIxLDcgKzEyMSw3IEBAIHN0YXRpYyBjb25zdCBpbnQgYXNwZWVkX3NvY19hc3Qy
NDAwX2lycW1hcFtdID0gew0KPiANCj4gI2RlZmluZSBhc3BlZWRfc29jX2FzdDI1MDBfaXJxbWFw
IGFzcGVlZF9zb2NfYXN0MjQwMF9pcnFtYXANCj4gDQo+IC1zdGF0aWMgcWVtdV9pcnEgYXNwZWVk
X3NvY19nZXRfaXJxKEFzcGVlZFNvQ1N0YXRlICpzLCBpbnQgY3RybCkNCj4gK3N0YXRpYyBxZW11
X2lycSBhc3BlZWRfc29jX2FzdDI0MDBfZ2V0X2lycShBc3BlZWRTb0NTdGF0ZSAqcywgaW50IGRl
dikNCj4gew0KPiAgICAgQXNwZWVkU29DQ2xhc3MgKnNjID0gQVNQRUVEX1NPQ19HRVRfQ0xBU1Mo
cyk7DQo+IA0KPiBAQCAtNDg3LDYgKzQ4Nyw3IEBAIHN0YXRpYyB2b2lkIGFzcGVlZF9zb2NfYXN0
MjQwMF9jbGFzc19pbml0KE9iamVjdENsYXNzICpvYywgdm9pZCAqZGF0YSkNCj4gICAgIHNjLT5p
cnFtYXAgICAgICAgPSBhc3BlZWRfc29jX2FzdDI0MDBfaXJxbWFwOw0KPiAgICAgc2MtPm1lbW1h
cCAgICAgICA9IGFzcGVlZF9zb2NfYXN0MjQwMF9tZW1tYXA7DQo+ICAgICBzYy0+bnVtX2NwdXMg
ICAgID0gMTsNCj4gKyAgICBzYy0+Z2V0X2lycSAgICAgID0gYXNwZWVkX3NvY19hc3QyNDAwX2dl
dF9pcnE7DQo+IH0NCj4gDQo+IHN0YXRpYyBjb25zdCBUeXBlSW5mbyBhc3BlZWRfc29jX2FzdDI0
MDBfdHlwZV9pbmZvID0gew0KPiBAQCAtNTEyLDYgKzUxMyw3IEBAIHN0YXRpYyB2b2lkIGFzcGVl
ZF9zb2NfYXN0MjUwMF9jbGFzc19pbml0KE9iamVjdENsYXNzICpvYywgdm9pZCAqZGF0YSkNCj4g
ICAgIHNjLT5pcnFtYXAgICAgICAgPSBhc3BlZWRfc29jX2FzdDI1MDBfaXJxbWFwOw0KPiAgICAg
c2MtPm1lbW1hcCAgICAgICA9IGFzcGVlZF9zb2NfYXN0MjUwMF9tZW1tYXA7DQo+ICAgICBzYy0+
bnVtX2NwdXMgICAgID0gMTsNCj4gKyAgICBzYy0+Z2V0X2lycSAgICAgID0gYXNwZWVkX3NvY19h
c3QyNDAwX2dldF9pcnE7DQo+IH0NCj4gDQo+IHN0YXRpYyBjb25zdCBUeXBlSW5mbyBhc3BlZWRf
c29jX2FzdDI1MDBfdHlwZV9pbmZvID0gew0KPiBAQCAtNTI4LDQgKzUzMCw5IEBAIHN0YXRpYyB2
b2lkIGFzcGVlZF9zb2NfcmVnaXN0ZXJfdHlwZXModm9pZCkNCj4gICAgIHR5cGVfcmVnaXN0ZXJf
c3RhdGljKCZhc3BlZWRfc29jX2FzdDI1MDBfdHlwZV9pbmZvKTsNCj4gfTsNCj4gDQo+IC10eXBl
X2luaXQoYXNwZWVkX3NvY19yZWdpc3Rlcl90eXBlcykNCj4gK3R5cGVfaW5pdChhc3BlZWRfc29j
X3JlZ2lzdGVyX3R5cGVzKTsNCj4gKw0KPiArcWVtdV9pcnEgYXNwZWVkX3NvY19nZXRfaXJxKEFz
cGVlZFNvQ1N0YXRlICpzLCBpbnQgZGV2KQ0KPiArew0KPiArICAgIHJldHVybiBBU1BFRURfU09D
X0dFVF9DTEFTUyhzKS0+Z2V0X2lycShzLCBjdHJsKTsNCj4gK30NCg0KSSB0aGluayDigJxkZXbi
gJ0gbmVlZHMgdG8gYmUgY2hhbmdlZCB0byDigJxjdHJs4oCdIG9yIHZpY2UtdmVyc2EuDQooQ29t
cGlsYXRpb24gZmFpbHVyZSkNCg0KPiAtLSANCj4gMi4zNS4xDQo+IA0KDQo=

