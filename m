Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015EA523EF3
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 22:32:04 +0200 (CEST)
Received: from localhost ([::1]:37810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1not06-0005jq-EI
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 16:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6130bb5c82=pdel@fb.com>)
 id 1nosyl-0004iH-QC; Wed, 11 May 2022 16:30:39 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:59972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6130bb5c82=pdel@fb.com>)
 id 1nosyj-0002Rj-N8; Wed, 11 May 2022 16:30:39 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24BJgBgC015206;
 Wed, 11 May 2022 13:30:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=Arcb63Za4SJjyFDoryCkIlp0qlTLOYrxnXTP5gsvCJ4=;
 b=RcpGlnCfC5fLUuyPN6DqD6HeaPmWeC9k2zYsxW6n6CcEq88Zk3LX3nz3GtsL1sIlCPUG
 oEDbaMOx9YHDS8MO56ai4dMVZgDATJ/q4JPyUi61UWrxJ75WvQztcz7wDqeMu5TTzQvW
 DhthXjCDyQY4GIGBWadvrev2Nlmro+GkZtw= 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2040.outbound.protection.outlook.com [104.47.57.40])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3g04tb5s57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 13:30:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThUH4D9lkebiT6gk7aaup4FtPsnX596AFD5gXIRrhVaeYv2Zh114Myy+27lXYyBQPsRmwcIDsfTIScZHJEv6NbEwW0Wy6rtw7K1qcT7I87YzV3K0F9TgyMZPcLKJr0RJ7jGdeG6XZjwxq83n4pxcDBGUHpeM8/uZeuSbDwmb3gQcKmhDyfzI6yU9aw3E3TcTuryxQbYdMbuPXy3LA9l5kAyqzKgkH4MwO9FnoZfovs3+QwmgDtq2rc9pQReNb4ZaYvkf9UArmIhr+COBDapFHVQaJcAJBNqFSoUkXzD7AGtpiAr2f/51y1WQDZa9CjyfCK5e29z4WWRmaF0UWaQ3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Arcb63Za4SJjyFDoryCkIlp0qlTLOYrxnXTP5gsvCJ4=;
 b=KLRv7WpxjDu9oksc3YXhMMikLIpbS5/+q4/XfNnziFQ89VqFJwCwXu7pT1YYK02EeWCrSMekk1HkcfKFFLV6o76S6o0LePs0HoV17miw/lVea5Dl1z5ADBwxWn9Skurv/s1lmKSagW9uXhP3dVBcpTz0gYfoNoNxpUfKee2BMOlkLtbqyg0euWB7Us8s0h5wypXk05l/v8l0XhtN/RSZJtlIufRzIPMBcf+Z109eYWqIe51EWI6cjoIuwW086As620CD04LA47cizkSAO+q6s47+29DDsYos2ChFrtUcLiXoQA+LVSiReRva0Cm1k6XW60CvsjV2o9jy4zboifhrYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by CO1PR15MB5066.namprd15.prod.outlook.com (2603:10b6:303:ed::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Wed, 11 May
 2022 20:30:24 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb%5]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 20:30:24 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Cameron Esfahani via <qemu-devel@nongnu.org>, qemu-arm
 <qemu-arm@nongnu.org>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Iris Chen <irischenlj@fb.com>,
 Peter Delevoryas <pdel@fb.com>
Subject: Re: [PATCH 1/1] hw: allow write_enable latch get/set
Thread-Topic: [PATCH 1/1] hw: allow write_enable latch get/set
Thread-Index: AQHYZWdcZrw9XegkA0iBvR+hq6+epK0aIRKA
Date: Wed, 11 May 2022 20:30:24 +0000
Message-ID: <1AFE2250-0FC6-4341-9D10-262DEB506050@fb.com>
References: <irischenlj@fb.com> <20220511184539.1099161-1-irischenlj@fb.com>
 <20220511184539.1099161-2-irischenlj@fb.com>
In-Reply-To: <20220511184539.1099161-2-irischenlj@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ebacac19-76e7-4f9d-4041-08da338d1406
x-ms-traffictypediagnostic: CO1PR15MB5066:EE_
x-microsoft-antispam-prvs: <CO1PR15MB50668B8B0E84BB9426696AB5ACC89@CO1PR15MB5066.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iTvYQgU6R5iZtCtoRPX73Iq7Xa8AJrblBqlRXpHDactTP8EDb9Gny8LAT4A1rYg+Y7Sy+6qG3uc3KNFYljuWeKFbRV/i+fT2FGU+JkovNu94Pcuao8DJh0kgzSxYGpHs92rFzbdVUIcqrFxjwYpmXoUiNQWyU1jp5t84dCPsE9txL1lWQDiF1ukkMwFQzEH81vw9QxCYB8TKByj7i509DtfOvoOGEVO9vSXQZewaZGXyELRa0dDZ6fp+vepUplT2/09+7avOigrLSTHhGkVFRTTdbBLfhAvYr2Um00XR73qapmvGyhjAIEjrpodttl+6/2BX+VdRJJ+6bMCmIlLJOd2Vb3s/ibMgDe0AbJoAHn/dwcLNQeW/ykc05F2671/GyrRmlMFh3+9UOGdfOMeOR5sPW7ZdNruKkaKz5OXZSbOfP1shylEz5z8X6Cg3rUTQ8aPjnuG/ntEspNa/hGMk0PD8yOY2r8ff9+KBDtTiKGoAqrvGwWUe/aHh3lp22p6KwV8Sx7t8Auwf/xTlvsFbrY8lnhO6PEWpGnoow2dku2fjmTHwDVmSlvdy41KMEcIxLzZmek8C9iuTl1HRynJCxb8U6UPkK6RvH+0FfSgXzySqYqEDTqTxbh32eGc8J3ug5fSHz+Oa6pAj1xwrfRf9y8p7n2ZHx3K91EQ0NVPlBem2HoMv1q+vj7hFo34+iOe+1P9+19L42sO91x1lv87JxpAS3YaSOvYfnnXaV1vQu5GzSYk3TwytoZOBGWIpX37L
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(91956017)(316002)(36756003)(122000001)(66446008)(8936002)(33656002)(8676002)(64756008)(76116006)(66476007)(66946007)(54906003)(66556008)(4326008)(38070700005)(38100700002)(2616005)(6512007)(109986005)(6486002)(71200400001)(508600001)(53546011)(2906002)(5660300002)(186003)(6506007)(86362001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGFxUHk1SE5KTjlqWTJMcDg0bzd5eVppekxPSU9GSHZWdnM0M092QWVENy9y?=
 =?utf-8?B?SGhyRjF1OC9HMnlmTUZqRzN1NU9meTBZYXdOQ0RmZTM0SWE5ZGFIQUkxdWhk?=
 =?utf-8?B?R3hlOWNlRTl4MytUSk9WeEw3WFhWa3NkcC9JaElBbHYzbUltbjFzZmNCSFcy?=
 =?utf-8?B?Y09mSnRtTjJPTldHbi8zdWsxOHkvRzFMTXgwaTgrakFCNnlpd2kveDZyOVcz?=
 =?utf-8?B?MHJrWXoyN3JQZ0QwbG9CRVFycEJNODBJUXB6Mm1rMTF3dDR2M0NsREZnRGhv?=
 =?utf-8?B?OWptQloyRk82QVY3Y1pKVVdSNDBldGMvS3VEbXRyV0FSdTRjNU1wOGdZb2Ur?=
 =?utf-8?B?Y2FXaEo3ZHNBSzVNU1JFR0ZVT0k4bDRUZHVTcW4yYlFnRksrK3ZOdHVhZWZZ?=
 =?utf-8?B?czdJRG9HTGg0NmZXa29nNmVvOTZiWUFydmV1blU5QnFZZWR2MXB1MU9iTkFZ?=
 =?utf-8?B?cmRDR0piS2lDazQrSHFMQW5kYzhocGJPeFBUb1VLQ1YvSjhZK09hMnFzVnJy?=
 =?utf-8?B?VU1ncThtTHBzcnZIdnJOK0k1eGRzN2laUEl5Sm9UUjhtOUNRSnlhYVRNNitC?=
 =?utf-8?B?OGJFdktkSnVNNVVwc2tJbi9xK2Y5UjdJdHBoOEhTMmlpQjBUK1JtNjJvNFgy?=
 =?utf-8?B?TURGWlV1Vm43elNHUkw1Y3pHYldXZ2tSazBnblRNY2RDeDAwbm9YcUVweE1R?=
 =?utf-8?B?b2dqN1pIRkxlb0VzbFFubk1FOVVtUmJOUDdPQmNmeXN1YmNPM1NlWWtkK3d2?=
 =?utf-8?B?VTBtckhDd091cUh1bWdKUGwwajNONjQ5UUNCeEdQNFlTWHFZMUt6Um5qT0Jv?=
 =?utf-8?B?STBSNmg1WDVqcWdqd1pOZkhma2poTStGejY3V254MUQ0ZnpsR3pxTUNrbTZk?=
 =?utf-8?B?dDdYSzFOeDVHN0hVSk0zelFST1ZUNUkrQ0ZNeXF3b0NXWDhEc2hVNTA1WFFG?=
 =?utf-8?B?djZscUJSZm1rallkZHAvbGNad3BONExXL2V4REtKU1dKUytnMi9JemUxenI4?=
 =?utf-8?B?WFJqS3NhSCtQNWhhMHlKZTZ4d1lrTDVWWTBPNnQvVFNmSHBtWERoUjFIbEd5?=
 =?utf-8?B?dzJFZUNLM2NzRDNxUmhEdDVONGZWMTdKVm11Y0QwalB0eDNRQ3VBT0pkdXRJ?=
 =?utf-8?B?Q21VK1l4YS9qbG9FNnlKaXlpQzBHVWJWL3BIVjkxVldCQ1cwVHVMQW9JWG52?=
 =?utf-8?B?Y3lOMzJ2ZTFnQ05DaEhLNVRJbyt6YkVrdENxbzN5M2pkbk1PbFB2Q0RILzhv?=
 =?utf-8?B?cXZheTVxeHF5blcyOW1KaVVGcnAyU1NiV1N3S0o4aEhra1RQTk80STAzQzlH?=
 =?utf-8?B?N0tDTFhPR0RvRVFheUdCbnQ4RFFXbWJBOHJIdlo2KzcwVCtONjQ1WnpRT2dT?=
 =?utf-8?B?NmdURUJDTmpEb2oxanFkUnNub0cwTlMrK05yV2tGSXVaR1NhSnhicXFGSS9R?=
 =?utf-8?B?ODMwc3k3a1FuZExTMlNZZXNMaVpnOURuZTVQZjZuRVVZaVdWQWFyTVVqWmZO?=
 =?utf-8?B?UE5YTmt2MTdWbllTcGEzNE03cUtjNEFsTGpSQXNLdDNZVVF3QWx6QTlIMnNZ?=
 =?utf-8?B?c1N6UkFXdTFuWjVkZnkrV1JGRmJFVDl0YWhXVW9ML0ExSEgxeUIycDJUV3Ax?=
 =?utf-8?B?Z014dDNHMkhRa3BTTENMcDJDY0cwTlh2KysvcFkxdzhSM0h5ZERLakFRR2cx?=
 =?utf-8?B?WUJYV3Njb29Qbm14Y1dIQXpkanI5VmMyeEFvSlo2QXg1UDVScUxCM2dnQXJs?=
 =?utf-8?B?Mkd1WG1LWXI0MDBvdVBsL1JZZjA0Z2dXbmxPalVzV09Od1J6d2szczFBOSsz?=
 =?utf-8?B?L1lsK1FCWlJ5SzZoTlFHekt1Nk95Y0tLd29jb2lvaDliaXBVM0laaUYya3RM?=
 =?utf-8?B?Qy94TGRNR1h6N21DZE1qd25RT0RVcm1nNUoxRWNvTnFPZ3hMVkpLNVV5UEhN?=
 =?utf-8?B?SXVDR29DYXJkbFphWlgxRXROdERRQnF0bEtXcGdtdnAva3lrL3h6U0RJQWVI?=
 =?utf-8?B?U0syVFB1bzRHSGp0bGJ3V08wc0VUeGlUSCsxc0RKcnFVUEZwb25Iak9xcTFr?=
 =?utf-8?B?V3NoRVBVcDI2TDhBWSt5L0haclNXOWUwWnNuU2VFV2JiMEZranIxdnMycWJ6?=
 =?utf-8?B?WXVDaEdLN1d1anpBdkxpclNzV3p0MWJhWW96S2w5dWhYd0UyZ2p4TXhvV1pX?=
 =?utf-8?B?ZDd1ZCtMc3BsTEYzVnQ1SU02RXFyNU1ZaTg2aHhRSm1RUWU0NC9wL3NsbHNz?=
 =?utf-8?B?aDRSYlM1akxvbDZ4MkwwVis4WnZBenpBL0Z1ZHpVUlBhVitlM1hGRkpxVGJr?=
 =?utf-8?B?NHNqWE5iTmk1cFdQNGluNHFYQkxYd2dIVkhPUlJCeDREZ0ViWDNTR1lJQ01x?=
 =?utf-8?Q?1HgNNweu9yXUj+OA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9F7F43D70BC964CB91228D0F1C15D55@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebacac19-76e7-4f9d-4041-08da338d1406
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2022 20:30:24.5237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 23HHdsASNJema2ZMz/jRZYFt30Aywy7w9RU5RfVvIGnu4JKImf5o2zyFPcUPqZDf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR15MB5066
X-Proofpoint-GUID: 3jmCPb84BFK6aaryEpHxw5zRHbuzxd3i
X-Proofpoint-ORIG-GUID: 3jmCPb84BFK6aaryEpHxw5zRHbuzxd3i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-11_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=6130bb5c82=pdel@fb.com; helo=mx0b-00082601.pphosted.com
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

DQoNCj4gT24gTWF5IDExLCAyMDIyLCBhdCAxMTo0NSBBTSwgSXJpcyBDaGVuIHZpYSA8cWVtdS1k
ZXZlbEBub25nbnUub3JnPiB3cm90ZToNCj4gDQo+IC0tLQ0KPiBody9ibG9jay9tMjVwODAuYyAg
ICAgICAgICAgICB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiB0ZXN0cy9x
dGVzdC9hc3BlZWRfc21jLXRlc3QuYyB8IDIwICsrKysrKysrKysrKysrKysrKysrDQo+IDIgZmls
ZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2h3L2Jsb2Nr
L20yNXA4MC5jIGIvaHcvYmxvY2svbTI1cDgwLmMNCj4gaW5kZXggNDMwZDEyOThhOC4uZmI3Mjcw
NGU1YSAxMDA2NDQNCj4gLS0tIGEvaHcvYmxvY2svbTI1cDgwLmMNCj4gKysrIGIvaHcvYmxvY2sv
bTI1cDgwLmMNCj4gQEAgLTM1LDYgKzM1LDcgQEANCj4gI2luY2x1ZGUgInFhcGkvZXJyb3IuaCIN
Cj4gI2luY2x1ZGUgInRyYWNlLmgiDQo+ICNpbmNsdWRlICJxb20vb2JqZWN0LmgiDQo+ICsjaW5j
bHVkZSAicWFwaS92aXNpdG9yLmgiDQo+IA0KPiAvKiBGaWVsZHMgZm9yIEZsYXNoUGFydEluZm8t
PmZsYWdzICovDQo+IA0KPiBAQCAtMTY0Niw2ICsxNjQ3LDMxIEBAIHN0YXRpYyBjb25zdCBWTVN0
YXRlRGVzY3JpcHRpb24gdm1zdGF0ZV9tMjVwODAgPSB7DQo+ICAgICB9DQo+IH07DQo+IA0KPiAr
c3RhdGljIHZvaWQgbTI1cDgwX2dldF93ZWwoT2JqZWN0ICpvYmosIFZpc2l0b3IgKnYsIGNvbnN0
IGNoYXIgKm5hbWUsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqb3BhcXVl
LCBFcnJvciAqKmVycnApDQo+ICt7DQo+ICsgICAgRmxhc2ggKnMgPSBNMjVQODAob2JqKTsNCj4g
Kw0KPiArICAgIGFzc2VydChzdHJjbXAobmFtZSwgIldFTCIpID09IDApOw0KPiArDQo+ICsgICAg
dmlzaXRfdHlwZV9ib29sKHYsIG5hbWUsICZzLT53cml0ZV9lbmFibGUsIGVycnApOw0KPiArfQ0K
PiArDQo+ICtzdGF0aWMgdm9pZCBtMjVwODBfc2V0X3dlbChPYmplY3QgKm9iaiwgVmlzaXRvciAq
diwgY29uc3QgY2hhciAqbmFtZSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lk
ICpvcGFxdWUsIEVycm9yICoqZXJycCkNCj4gK3sNCj4gKyAgICBGbGFzaCAqcyA9IE0yNVA4MChv
YmopOw0KPiArICAgIGJvb2wgdmFsdWU7DQo+ICsNCj4gKyAgICBhc3NlcnQoc3RyY21wKG5hbWUs
ICJXRUwiKSA9PSAwKTsNCj4gKw0KPiArICAgIGlmICghdmlzaXRfdHlwZV9ib29sKHYsIG5hbWUs
ICZ2YWx1ZSwgZXJycCkpIHsNCj4gKyAgICAgICAgcmV0dXJuOw0KPiArICAgIH0NCj4gKw0KPiAr
ICAgIHMtPndyaXRlX2VuYWJsZSA9IHZhbHVlOw0KPiArfQ0KPiArDQo+IHN0YXRpYyB2b2lkIG0y
NXA4MF9jbGFzc19pbml0KE9iamVjdENsYXNzICprbGFzcywgdm9pZCAqZGF0YSkNCj4gew0KPiAg
ICAgRGV2aWNlQ2xhc3MgKmRjID0gREVWSUNFX0NMQVNTKGtsYXNzKTsNCj4gQEAgLTE2NjAsNiAr
MTY4NiwxMCBAQCBzdGF0aWMgdm9pZCBtMjVwODBfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqa2xh
c3MsIHZvaWQgKmRhdGEpDQo+ICAgICBkZXZpY2VfY2xhc3Nfc2V0X3Byb3BzKGRjLCBtMjVwODBf
cHJvcGVydGllcyk7DQo+ICAgICBkYy0+cmVzZXQgPSBtMjVwODBfcmVzZXQ7DQo+ICAgICBtYy0+
cGkgPSBkYXRhOw0KPiArDQo+ICsgICAgb2JqZWN0X2NsYXNzX3Byb3BlcnR5X2FkZChrbGFzcywg
IldFTCIsICJib29sIiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBtMjVwODBfZ2V0
X3dlbCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBtMjVwODBfc2V0X3dlbCwgTlVM
TCwgTlVMTCk7DQoNCkkgdGhpbmsgdGhlIHNwYWNpbmcgaGVyZSBtaWdodCBiZSBzbGlnaHRseSBv
ZmYsIHRyeSBtYWtpbmcgdGhlIDJuZCBhbmQgM3JkIGxpbmVzDQphbGlnbiB3aXRoIOKAnGtsYXNz
4oCdIGluIHRoZSBmaXJzdCBsaW5lLg0KDQo+IH0NCj4gDQo+IHN0YXRpYyBjb25zdCBUeXBlSW5m
byBtMjVwODBfaW5mbyA9IHsNCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL3F0ZXN0L2FzcGVlZF9zbWMt
dGVzdC5jIGIvdGVzdHMvcXRlc3QvYXNwZWVkX3NtYy10ZXN0LmMNCj4gaW5kZXggODdiNDBhMGVm
MS4uYWY4ODVhOWM5ZCAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvcXRlc3QvYXNwZWVkX3NtYy10ZXN0
LmMNCj4gKysrIGIvdGVzdHMvcXRlc3QvYXNwZWVkX3NtYy10ZXN0LmMNCj4gQEAgLTQ5LDYgKzQ5
LDcgQEANCj4gICovDQo+IGVudW0gew0KPiAgICAgSkVERUNfUkVBRCA9IDB4OWYsDQo+ICsgICAg
UkRTUiA9IDB4NSwNCj4gICAgIEJVTEtfRVJBU0UgPSAweGM3LA0KPiAgICAgUkVBRCA9IDB4MDMs
DQo+ICAgICBQUCA9IDB4MDIsDQo+IEBAIC0zNDgsNiArMzQ5LDI0IEBAIHN0YXRpYyB2b2lkIHRl
c3Rfd3JpdGVfcGFnZV9tZW0odm9pZCkNCj4gICAgIGZsYXNoX3Jlc2V0KCk7DQo+IH0NCj4gDQo+
ICtzdGF0aWMgdm9pZCB0ZXN0X3JlYWRfc3RhdHVzX3JlZyh2b2lkKQ0KPiArew0KPiArICAgIHVp
bnQ4X3QgcjsNCj4gKw0KPiArCXFtcCgieyAnZXhlY3V0ZSc6ICdxb20tc2V0JywgJ2FyZ3VtZW50
cyc6ICINCj4gKyAgICAgICAieydwYXRoJzogJy9tYWNoaW5lL3NvYy9mbWMvc3NpLjAvY2hpbGRb
MF0nLCAncHJvcGVydHknOiAnV0VMJywgJ3ZhbHVlJzogdHJ1ZX19Iik7DQoNClNwYWNpbmcgaXMg
b2ZmIGhlcmUsIG1ha2Ugc3VyZSB0aGUgaW5kZW50YXRpb24gaXMgc2V0IHRvIDQgc3BhY2VzLg0K
DQo+ICsNCj4gKyAgICBzcGlfY29uZihDT05GX0VOQUJMRV9XMCk7DQo+ICsJc3BpX2N0cmxfc3Rh
cnRfdXNlcigpOw0KPiArCXdyaXRlYihBU1BFRURfRkxBU0hfQkFTRSwgUkRTUik7DQo+ICsJciA9
IHJlYWRiKEFTUEVFRF9GTEFTSF9CQVNFKTsNCj4gKwlzcGlfY3RybF9zdG9wX3VzZXIoKTsNCg0K
U3BhY2luZyBpcyBvZmYgaGVyZSB0b28uDQoNCj4gKw0KPiArCWdfYXNzZXJ0X2NtcGhleChyLCA9
PSwgMHgyKTsNCg0KTWF5YmUgY29uc2lkZXIgdXNpbmcgYSBjb25zdGFudCBpbnN0ZWFkIG9mIDB4
MiwgbGlrZToNCg0KLi4uDQojaW5jbHVkZSDigJxxZW11L2JpdG9wcy5oIiANCi4uLg0KI2RlZmlu
ZSBTUl9XRUwgQklUKDEpDQrigKYNCmdfYXNzZXJ0X2NtcGhleChyLCA9PSwgU1JfV0VMKTsNCg0K
QWRkaXRpb25hbGx5LCBzaW5jZSB3ZSBvbmx5IGNhcmUgYWJvdXQgdGVzdGluZyB0aGUgd3JpdGUg
ZW5hYmxlDQpsYXRjaCBzdGF0ZSAoYW5kIG5vdCB0aGUgb3RoZXIgYml0cyBpbiB0aGUgc3RhdHVz
IHJlZ2lzdGVyKSwNCml0IGNvdWxkIGJlOg0KDQpnX2Fzc2VydF9jbXBoZXgociAmIFNSX1dFTCwg
PT0sIFNSX1dFTCk7DQoNCj4gKw0KPiArCWZsYXNoX3Jlc2V0KCk7DQo+ICt9DQo+ICsNCj4gc3Rh
dGljIGNoYXIgdG1wX3BhdGhbXSA9ICIvdG1wL3F0ZXN0Lm0yNXA4MC5YWFhYWFgiOw0KPiANCj4g
aW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQ0KPiBAQCAtMzczLDYgKzM5Miw3IEBAIGlu
dCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikNCj4gICAgIHF0ZXN0X2FkZF9mdW5jKCIvYXN0
MjQwMC9zbWMvd3JpdGVfcGFnZSIsIHRlc3Rfd3JpdGVfcGFnZSk7DQo+ICAgICBxdGVzdF9hZGRf
ZnVuYygiL2FzdDI0MDAvc21jL3JlYWRfcGFnZV9tZW0iLCB0ZXN0X3JlYWRfcGFnZV9tZW0pOw0K
PiAgICAgcXRlc3RfYWRkX2Z1bmMoIi9hc3QyNDAwL3NtYy93cml0ZV9wYWdlX21lbSIsIHRlc3Rf
d3JpdGVfcGFnZV9tZW0pOw0KPiArICAgIHF0ZXN0X2FkZF9mdW5jKCIvYXN0MjQwMC9zbWMvcmVh
ZF9zdGF0dXNfcmVnIiwgdGVzdF9yZWFkX3N0YXR1c19yZWcpOw0KPiANCj4gICAgIHJldCA9IGdf
dGVzdF9ydW4oKTsNCj4gDQo+IC0tIA0KPiAyLjMwLjINCj4gDQo+IA0KPiANCg0K

