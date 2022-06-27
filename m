Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5C855BBFD
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 22:26:13 +0200 (CEST)
Received: from localhost ([::1]:36294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5vJE-0003nf-Rb
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 16:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5uyG-0005FD-VL; Mon, 27 Jun 2022 16:04:33 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:14854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5uyE-0001tI-F2; Mon, 27 Jun 2022 16:04:32 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RJ1RVG007138;
 Mon, 27 Jun 2022 13:04:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=zX0xPeH1M6l02MsTt2YN6z9eBv8g5wBXGVf5r29wpkM=;
 b=pcGhuURU9TLhosUXGkxwnYIdg9G21GnggBDVbWnI8WqOVhFF9aZEv3rclLbczMbAHUwI
 5IUYbEGQDKkH5RRikaV3lakM3pIRIkq4xBlbJRFiIhF8o0C0Lfy+ejwFOC0jB2IGHD/7
 JSFc3LaMEPnSoHXZpkrWk0T9PChdnoBY4rA= 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gwxdn5htq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 13:04:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCCt6dhpBL6n+/m1EflYvAYUj/itnE5I2hnveioCBucDCfoLmRKrsDtp2+/mbXIfNPxnoyiY/wL4iBL7m7xV1OrwEKQyePjkKN+aVS8DzQEVaQGVcyDmmv1UMYtqdRIGlebAiZ4sptKX0hub4B5lWUNn8N3MZkBAWqbtj8z/saqe4KdgVuclhCInpwNslUc0aiK+0niQjPOFrnoF/RsCdwuGYpWLq2e4r5M5h/RUC1xu6iU6AXCYDotSmcONj/gxx4H8efGfZa2asa+pLpQbLODookPIbPAd5g6PHy3N5POQYEDSAufRSM8SjkYgmtYK380IRePmZN2V3pROhtgxxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zX0xPeH1M6l02MsTt2YN6z9eBv8g5wBXGVf5r29wpkM=;
 b=Y1OFWYpspmd4BuLzXqJnH7gG8xHtFfeBlwAX0Tj2rIaPCJvyUnrxkesrQYojzdTueCyGyNViAP/5XiLRQpuUP/iOEKBefDOdbp/efEU/OfQBfDJbm+VJPcsxm26wxoOB4imBHO4kdXjXIPrhvD5n8dGNVIU+Wai1GQQaZ/PQqlOIVAaLlTr3IQ1QD/wiFb5Q3GEU9fT4Y7zL9bGSVCb+2pC5T0+FZ3W6/i0xt9VLvVpvjxisFDeLAnaPDOnJSTFGfJ/+kITuVZQ58d8R4EveC8kdDOFEZEg8TK83QrN0K/N8JpPzjoqedgHMMmBXLov7aGHQmycJYA7Ca4vR1OIyNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by DM6PR15MB3226.namprd15.prod.outlook.com (2603:10b6:5:16b::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 20:04:12 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134%6]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 20:04:12 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Peter Delevoryas <pdel@fb.com>, Dan Zhang <zhdaniel@fb.com>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Cameron Esfahani via
 <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "komlodi@google.com" <komlodi@google.com>,
 "titusr@google.com" <titusr@google.com>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 00/14] aspeed: Add I2C new register DMA slave mode support
Thread-Topic: [PATCH 00/14] aspeed: Add I2C new register DMA slave mode support
Thread-Index: AQHYil/W7ZvhxdBEVUmbdlk0gMVBHq1jrWKA
Date: Mon, 27 Jun 2022 20:04:12 +0000
Message-ID: <FAB4293E-64FB-43CE-955D-B32430869EBC@fb.com>
References: <20220627195506.403715-1-pdel@fb.com>
In-Reply-To: <20220627195506.403715-1-pdel@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a4f90ea-4a98-4f59-cabc-08da5878349d
x-ms-traffictypediagnostic: DM6PR15MB3226:EE_
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QjN15Ay9i5Hxz3/rHcH7FXPjVqflWVYLwulVP5Y2s/aeQ+RxtvnxlQrBwLs6rEYp9vu5DSgSxkhZ5KkPYkEbzvcpVAvHt2Yp1Bc3PrwCCtFH0rbavBYoE0pf/725kNT0kNOV2v79pCwQ0Zvad/wE98YRMvKAv9AE51aPZ+ElfgU860kDulMiN4n19lJO38ZmoOsvy2EZQjo9c+fPiYdvPNEDJXCTZ2bNSIvBUbP0Z5pDCj5wBICAnT0iM2IUe/txPNl/+AIUoK2rtemVxfNgIbOoP6R+EeDW/Sr0cw838O07PE95RcLPC/Ae0OyMfJmfmJv6CVLMXaiY0HprgwXMTMnKoMBzCQ77s3Vdsxg/WKZkZ845vfF7QjVm1+mNW4R+61rK4OUsas9sgHTLLy3axCnxgfPI7aU6dnpS24vVieOQRTeQ02AW8711PdgDOUV3LeAZLFmUM/qJEg/v31zF04kVhIEPsBOPKAc/SphFbkTHQDHrE4hgPDgcD+4HrJVhYzQhRE5DV1SR0HQ/fxS5VOMpZoJ47uGX2t0xEYYBJotAY2RpQENyQ8FRcxnJ4jrox2e3DvwS23tA/ePFcN4MOAdauu9uRqe8W+YhdoP3ye/KJxsAwruz8tD3BHYEb2HefpSu8MDPk/gldEd+VB4/uEYBl5Ov6xEIeGrOYhy7BYyZgIQrZDWQNmGr3JPjjrhIULHiX1oVedPCV9KYF7JGlnbGi2xMYFHvmkEusn1hvva0Ouu0iYiKTAJDFkMMjCsUjyp4XC4cIH03KuXSg+LiO4UdSHLxeD64s8exwVG80Qkc4wYkcyV+pSDZzaTOTeOqor1u4TBZF1u32SjVxx/FGQ6voA9RENc23+So0RFpxd8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(966005)(6486002)(6512007)(5660300002)(8936002)(6506007)(53546011)(478600001)(2906002)(71200400001)(316002)(54906003)(83380400001)(41300700001)(64756008)(33656002)(38100700002)(66556008)(186003)(4326008)(91956017)(86362001)(36756003)(38070700005)(2616005)(109986005)(76116006)(66946007)(66476007)(8676002)(66446008)(122000001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1JDamZTYk1kNStYK3k5aDJUUzNGN2hLUlM0UTZ1M0pJajlZNkk4OTYrN3pC?=
 =?utf-8?B?VW9ra01ITXZpT1FEbzZsWGVPZ0VlVkNUWTlDbXlnQ01SR2xaL2NjTUpDaTNh?=
 =?utf-8?B?SHR2MnRsZU1Ddmx2WlpwWFNLbGV4cEZwTjJud3YxZnZwUmR1ZUErSFJ2dm43?=
 =?utf-8?B?RDVKQkxnWC9zRUJBUHJkQnA0Qi9qTG9PR2djWCtUKzlZcEJCUmM2MFJ1SUE1?=
 =?utf-8?B?cWlqSWlOZTZCTTNDUk9zcTdRT3REb0QyMXdCVlJSdkVJVnNUNHp0eTB4cHEw?=
 =?utf-8?B?UzJOMzM1M0N6d3hZaWN6Y3ZjdE1mWG50OVBKTU40ZllFV0VhMENvL3AzZjBJ?=
 =?utf-8?B?Y2U4L29oWGFmSllnMjAvd2N3WndMWHhxMEltZXkycmUrZFY1TUZSei9YWXhH?=
 =?utf-8?B?WlF5ejBYalE0MWJtVTBDQWJzbmlhbWRIbC8zUkhadnpqZ0xvOGcyWXN1T29u?=
 =?utf-8?B?SENsazMrbUFadFBKTWNSVWJ6YVBMek5EZWFRYk1Tb21NSXplcENmOERKbW0z?=
 =?utf-8?B?MjF0Q3N5OCsvZW9RamJ1RWtPNWdlc1UwYnNySks5TFI1Y3NQVHlzdXVBY09I?=
 =?utf-8?B?cm1NSHNNUDJmOHZjY0d3VmxubDl2NGpjdi80N1BFSndXcW9BQXlQbmNZRWdj?=
 =?utf-8?B?eXhMcnVwK205TTBPQUQ5NVErdlh2eS9GRGxrQzVjK2ZmeUNGcVI2ZFFQbk5s?=
 =?utf-8?B?TDZCK0U0b2Vla1FwcitOTWxvYitzUnFlVmdmMXJrajJub0x2RDcxZ0dxbmhp?=
 =?utf-8?B?ZFNlWDJvTU9ncXJ5MFhVeHJSZDFLb2V2VEppeGxKbkNoYUtudWJrOU1odlho?=
 =?utf-8?B?bnBLd3RQM3ErVWZrb2VNTGxHSHgwaHdxaDVQM0laeis5RXJ2SmhiTUFsZ0Y3?=
 =?utf-8?B?ZWRPYjRVeG9qZTdLcDk0SjJyNTJxWU5sUUJSUC91THpkMEE1eENqMVE5ODhC?=
 =?utf-8?B?a2JkYi9EQk5vTHhMalRWSk1Ra3FZZGxsRDRaeFdVajM3dk13VFBsM1NkY2do?=
 =?utf-8?B?OGQvSmpTaE1JM1prYm4rVXNydXZtTmY1ckhUK3paTG1kcUtqdkNkY3RndFlT?=
 =?utf-8?B?bWF4THI0TmR6UGRwTGxXNWdvYS9xL0paVk5LdTFKY0lRYkpTVDVOT2VTU0tG?=
 =?utf-8?B?RllEenQ2ZTJNSStGMnFTbGRYdU91OWsvRlU1aWxIQzNTRjR1RHN4VG9zeDdK?=
 =?utf-8?B?OWE4T09kb3pGZDZ6cXNUM1NWcW9IdUhqd1l2aXE5NHB6cWU1eUlLai8vSERP?=
 =?utf-8?B?c2tIaFFYR0dSS1hnTzhoQ25tdDlibHRKMTJxbzd5aElOT3NsUHFoSys4SllM?=
 =?utf-8?B?ZlFieS9rRXA3MGp2b1dPMEc0ZWVZL3Uvd1dHNTRlTWRTaGNtRzRqQUYweWtC?=
 =?utf-8?B?K2Q5YTFVbjVCVHVmeHkwQ0JXSlFvcm00TWd2Q3IzSDc2QWdTUDRySmZzVDA0?=
 =?utf-8?B?Q0dKbGtQMFR0R3ZJb0JVeVYxZk1kSzF4R01wOVlENTFWcW55RncwK1ErNjlh?=
 =?utf-8?B?a0JBQVE3ZTJCQWRCVEhvK2RmN3hXT3F3OFBCZmo2RlpXWVRRQklWQ1NsdEFm?=
 =?utf-8?B?TzlVckxZV1lEZjhQMmdBZ2YzVkU1RFhWNHlwQ2RDbEx5YnNGL3ZGK0hsdHNp?=
 =?utf-8?B?MUFad1FaNUdOZGVkVDBObkFac1U4Y2o3azEzSGN3OTVTbFdTKzMySFVYOFB1?=
 =?utf-8?B?dURCeFFpcVI4VWs5TnZoQm5pRUdWSUhqQlhWZUFpWjgwTUJZUFhUb3lFWFpT?=
 =?utf-8?B?dHlhVkpLQmlSZ1FMOGZpdHBtcldBUjFBSHhWSTBhUlVRc0l4QnhwUnN0MzRh?=
 =?utf-8?B?YVIrK0VXQTRBcVZmVnRSaVRnK3NGbXBnd1k1YWpXd3BNamQ3RFVJWkkyNzNu?=
 =?utf-8?B?cnFuZmJpSDZLTks4WGdZaytueVdoUHMveEpncFdESFpkZGY4a0NiRDVwSWFK?=
 =?utf-8?B?d3BXVEJQSExCNlNNMld0dVdSdVFXREFTSDZKd2lZZUM1N2pOQ2pTSnVNT2dp?=
 =?utf-8?B?VGhsbVFMK2RvRGlWRE1zWWNzTWVFaXR5aXhXaDNHMnNYY2szODRpVUZKaTF1?=
 =?utf-8?B?eUk1aG93Q051Uis0MWEyN2dnVGQzUGdJYW1zeHJ0am1oTVhZQUdERW1KVCtz?=
 =?utf-8?B?VUovc0RHSzZmanljaDRhcWc5MUdUNTRUUEk2RlhYcFNZR3dyM3RNRHNwOTRl?=
 =?utf-8?B?NFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1ABE7AB327FE043BB01D9344FE48EE6@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4f90ea-4a98-4f59-cabc-08da5878349d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 20:04:12.8110 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PfLag2DB5BKUznG5Xe5StuMXjbBJitqFA+jRSKmZ4/lMO2i62svxRHjbVlht/YOL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR15MB3226
X-Proofpoint-GUID: iU_SB4P6PyeKIl3cnqzpBRJFmNfwyzxt
X-Proofpoint-ORIG-GUID: iU_SB4P6PyeKIl3cnqzpBRJFmNfwyzxt
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=71779173e5=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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

DQoNCj4gT24gSnVuIDI3LCAyMDIyLCBhdCAxMjo1NCBQTSwgUGV0ZXIgRGVsZXZvcnlhcyA8cGRl
bEBmYi5jb20+IHdyb3RlOg0KPiANCj4gSGV5IGV2ZXJ5b25lLA0KPiANCj4gSSdtIHNlbmRpbmcg
YSBiaWcgcGF0Y2ggc2VyaWVzIGZvciB0aGlzLCBidXQgb25seSB0aGUgbGFzdCBjb21taXQgaXMg
cmVhbGx5DQo+IGludGVuZGVkIHRvIGJlIGFjY2VwdGVkIHJpZ2h0IG5vdy4gSSdtIGp1c3QgaW5j
bHVkaW5nIHRoZSByZXN0IG9mIHRoZW0NCj4gYmVjYXVzZSBpdCBkZXBlbmRzIG9uIHRoZW0gZm9y
IHRlc3RpbmcuDQo+IA0KPiBLbGF1cydzIGNoYW5nZXMgaW5jbHVkZSB0aGUgbXVsdGktbWFzdGVy
IHN0dWZmIGluIGh3L2kyYy9jb3JlLmMsIGFuZCB0aGUgb2xkDQo+IHJlZ2lzdGVyIG1vZGUgc2xh
dmUgbW9kZSBzdXBwb3J0Lg0KPiANCj4gTXkgc2VyaWVzIG9mIHBhdGNoZXMgaW5jbHVkZXMgYSBi
dW5jaCBvZiBjaGFuZ2VzIHRvIGVsaW1pbmF0ZSBtb3N0IChpZiBub3QNCj4gYWxsKSBvZiB0aGUg
STJDIGVycm9ycyByZXBvcnRlZCBieSB0aGUgZmIgT3BlbkJJQyBmaXJtd2FyZSBmb3IgZmJ5MzUN
Cj4gQ3JhdGVyTGFrZSBCcmlkZ2UgSW50ZXJjb25uZWN0IChCSUMpIChzaG9ydG5hbWU6IG9ieTM1
LWNsKSB1cG9uIHN0YXJ0dXAuDQo+IA0KPiBJbiBwYXJ0aWN1bGFyLCBJIG5lZWRlZCB0byBhZGQg
dGhlIElDX0RFVklDRV9JRCB0byB0aGUgaXNsIHZvbHRhZ2UgcmVndWxhdG9yDQo+IGltcGxlbWVu
dGF0aW9uLCB3aGljaCByZXF1aXJlZCBhIGZpeCB0byB0aGUgcG1idXMgaW1wbGVtZW50YXRpb24g
d2hlbg0KPiBzd2l0Y2hpbmcgcGFnZXMuIFdlIHdlcmVuJ3QgcmVzZXR0aW5nIHRoZSBidWZmZXIg
c3RhdGUgd2hlbiBzd2l0Y2hpbmcNCj4gcGFnZXMgdGhlcmUuDQo+IA0KPiBJIGFsc28gYWRkZWQg
YSBwbGFjZWhvbGRlciBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgUEVDSSBjb250cm9sbGVyLCB0aGF0
IGRvZXMNCj4gYWxtb3N0IG5vdGhpbmcsIGJ1dCBkb2Vzbid0IHByb2R1Y2UgZXJyb3JzLg0KPiAN
Cj4gSSBhZGRlZCB0aGUgZmJ5MzUtY3BsZCwgd2hpY2ggb2J5MzUtY2wgcXVlcmllcyB1c2luZyBt
YXN0ZXItbW9kZSBUWCBhbmQgUlgNCj4gY29tbWFuZHMuDQo+IA0KPiBBbmQgZmluYWxseSwgSSBh
ZGRlZCBhbiAiaW50ZWwtbWUiIGRldmljZSAoSW50ZWwgTWFuYWdlbWVudCBFbmdpbmUpIHRoYXQN
Cj4gYXR0ZW1wdHMgdG8gcmVzcG9uZCB0byB0aGUgZmlyc3QgSVBNQiBtZXNzYWdlIHNlbnQgYnkg
dGhlIEJJQy4gSSB1c2VkIHRoaXMNCj4gdG8gdGVzdCB0aGUgZmluYWwgcGF0Y2gsIHdoaWNoIEkg
YWN0dWFsbHkgd2FudCB0byBtZXJnZSwgdGhlIEkyQyBuZXcNCj4gcmVnaXN0ZXIgRE1BIHNsYXZl
IG1vZGUgc3VwcG9ydC4NCj4gDQo+IEFsbCB0aGUgcGF0Y2hlcyBleGNlcHQgdGhlIGxhc3Qgb25l
IGNhbiBiZSBpZ25vcmVkIGZvciBub3cgaWYgeW91IHdhbnQsDQo+IGFnYWluLCBJIGp1c3QgaW5j
bHVkZWQgdGhlbSBmb3IgdGVzdGluZyBwdXJwb3Nlcy4NCj4gDQo+IFRoZSBmaW5hbCBwYXRjaCBp
cyBwcmV0dHkgcm91Z2gsIGJ1dCBJIHdhbnRlZCB0byBzdGFydCB0aGUgcmV2aWV3IGluc3RlYWQg
b2YNCj4gd2FpdGluZyB0b28gbG9uZy4gSSBleHBlY3QgdGhlIGludGVycnVwdCBoYW5kbGluZyBw
YXJ0IHdpbGwgYmUNCj4gdGhlIG1haW4gYmxvY2tlci4NCj4gDQoNCkFyZywgSSBmb3Jnb3QgdG8g
c2VuZCBhIGxpbmsgdG8gdGhlIHJlZmVyZW5jZSBpbWFnZSBmb3Igb2J5MzUtY2w6DQoNCndnZXQg
aHR0cHM6Ly9naXRodWIuY29tL3BldGVyZGVsZXZvcnlhcy9PcGVuQklDL3JlbGVhc2VzL2Rvd25s
b2FkL29ieTM1LWNsLTIwMjIuMTcuMDEvWTM1QkNMLmVsZg0KDQpxZW11LXN5c3RlbS1hcm0gLW1h
Y2hpbmUgb2J5MzUtY2wgLWtlcm5lbCBZMzVCQ0wuZWxmIC1ub2dyYXBoaWMNCg0KV2hlbiBpdCBi
b290cywgaXQgc2hvdWxkIGxvb2sgbGlrZSB0aGlzOg0KDQpbMDA6MDA6MDAuMDA2LDAwMF0gPGlu
Zj4gdXNiX2RjX2FzcGVlZDogc2VsZWN0IGVwWzB4ODFdIGFzIElOIGVuZHBvaW50DQpbMDA6MDA6
MDAuMDA2LDAwMF0gPGluZj4gdXNiX2RjX2FzcGVlZDogc2VsZWN0IGVwWzB4ODJdIGFzIElOIGVu
ZHBvaW50DQpbMDA6MDA6MDAuMDA2LDAwMF0gPHdybj4gdXNiX2RjX2FzcGVlZDogcHJlLXNlbGVj
dGVkIGVwWzB4MV0gYXMgSU4gZW5kcG9pbnQNClswMDowMDowMC4wMDYsMDAwXSA8d3JuPiB1c2Jf
ZGNfYXNwZWVkOiBwcmUtc2VsZWN0ZWQgZXBbMHgyXSBhcyBJTiBlbmRwb2ludA0KWzAwOjAwOjAw
LjAwNiwwMDBdIDxpbmY+IHVzYl9kY19hc3BlZWQ6IHNlbGVjdCBlcFsweDNdIGFzIE9VVCBlbmRw
b2ludA0KKioqIEJvb3RpbmcgWmVwaHlyIE9TIGJ1aWxkIHYwMC4wMS4wNSAgKioqDQpIZWxsbywg
d2VsY29tZSB0byB5djM1IGNyYXRlcmxha2UgMjAyMi4yNS4xDQpCSUMgY2xhc3MgdHlwZShjbGFz
cy0xKSwgMW91IHByZXNlbnQgc3RhdHVzKDApLCAyb3UgcHJlc2VudCBzdGF0dXMoMCksIGJvYXJk
IHJldmlzaW9uKDB4MSkNCltpbml0X2RyaXZlX3R5cGVdIHNlbnNvciAweDE0IHBvc3Qgc2Vuc29y
IHJlYWQgZmFpbGVkIQ0KDQoNCltpbml0X2RyaXZlX3R5cGVdIHNlbnNvciAweDMwIHBvc3Qgc2Vu
c29yIHJlYWQgZmFpbGVkIQ0KW2luaXRfZHJpdmVfdHlwZV0gc2Vuc29yIDB4MzkgcG9zdCBzZW5z
b3IgcmVhZCBmYWlsZWQhDQppcG1pX2luaXQNCltzZXRfRENfc3RhdHVzXSBncGlvIG51bWJlcigx
NSkgc3RhdHVzKDApDQpbc2V0X3Bvc3Rfc3RhdHVzXSBncGlvIG51bWJlcigxKSBzdGF0dXMoMSkN
CnVhcnQ6fiQgWzAwOjAwOjAwLjY4MCwwMDBdIDxpbmY+IGtjc19hc3BlZWQ6IEtDUzM6IGFkZHI9
MHhjYTIsIGlkcj0weDJjLCBvZHI9MHgzOCwgc3RyPTB4NDQNCg0KWzAwOjAwOjAwLjY4NiwwMDBd
IDxlcnI+IHNwaV9ub3JfbXVsdGlfZGV2OiBbMTIxNl1bc3BpMV9jczBdU0ZEUCBtYWdpYyAwMDAw
MDAwMCBpbnZhbGlkDQpbMDA6MDA6MDAuNjg2LDAwMF0gPGVycj4gc3BpX25vcl9tdWx0aV9kZXY6
IFsxNDU2XVNGRFAgcmVhZCBmYWlsZWQ6IC0yMg0KWzAwOjAwOjAwLjY4MCwwMDBdIDxpbmY+IGtj
c19hc3BlZWQ6IEtDUzM6IGFkZHI9MHhjYTIsIGlkcj0weDJjLCBvZHI9MHgzOCwgc3RyPTB4NDQN
Cg0KWzAwOjAwOjAwLjY4NiwwMDBdIDxlcnI+IHNwaV9ub3JfbXVsdGlfZGV2OiBbMTIxNl1bc3Bp
MV9jczBdU0ZEUCBtYWdpYyAwMDAwMDAwMCBpbnZhbGlkDQpbMDA6MDA6MDAuNjg2LDAwMF0gPGVy
cj4gc3BpX25vcl9tdWx0aV9kZXY6IFsxNDU2XVNGRFAgcmVhZCBmYWlsZWQ6IC0yMg0KdWFydDp+
JCBCSUMgUmVhZHkNCg0KSWYgdGhlIGkyYyBwYXRjaGVzIGFyZW7igJl0IGluY2x1ZGVkLCB0aGVu
IHRoZSBCSUMgd2lsbCBiZQ0KdW5hYmxlIHRvIGdldCB0aGUgaW5pdGlhbCBNRSBJUE1CIHJlc3Bv
bnNlIGFuZCBwcmludA0KYW4gZXJyb3IgbWVzc2FnZToNCg0KdWFydDp+JCBCSUMgUmVhZHkNCkZh
aWxlZCB0byBnZXQgTUUgc2VsZiB0ZXN0IHJlc3VsdCwgcmV0OiAweDgNCg0KPiBUaGFua3MsDQo+
IFBldGVyDQo+IA0KPiBLbGF1cyBKZW5zZW4gKDMpOg0KPiAgaHcvaTJjOiBzdXBwb3J0IG11bHRp
cGxlIG1hc3RlcnMNCj4gIGh3L2kyYzogYWRkIGFzeW5jaHJvbm91cyBzZW5kDQo+ICBody9pMmMv
YXNwZWVkOiBhZGQgc2xhdmUgZGV2aWNlIGluIG9sZCByZWdpc3RlciBtb2RlDQo+IA0KPiBQZXRl
ciBEZWxldm9yeWFzICgxMSk6DQo+ICBhc3BlZWQ6IGkyYzogRml4IERNQSBsZW4gd3JpdGUtZW5h
YmxlIGJpdCBoYW5kbGluZw0KPiAgYXNwZWVkOiBpMmM6IEZpeCBSX0kyQ0RfRlVOX0NUUkwgcmVm
ZXJlbmNlDQo+ICBhc3BlZWQ6IGkyYzogRml4IE1BU1RFUl9FTiBtaXNzaW5nIGVycm9yIG1lc3Nh
Z2UNCj4gIGFzcGVlZDogQWRkIFBFQ0kgY29udHJvbGxlcg0KPiAgaHcvbWlzYzogQWRkIGZieTM1
LWNwbGQNCj4gIHBtYnVzOiBSZXNldCBvdXQgYnVmIGFmdGVyIHN3aXRjaGluZyBwYWdlcw0KPiAg
cG1idXM6IEFkZCByZWFkLW9ubHkgSUNfREVWSUNFX0lEIHN1cHBvcnQNCj4gIGFzcGVlZDogQWRk
IG9ieTM1LWNsIG1hY2hpbmUNCj4gIGh3L21pc2M6IEFkZCBpbnRlbC1tZQ0KPiAgYXNwZWVkOiBB
ZGQgaW50ZWwtbWUgb24gaTJjNiBpbnN0ZWFkIG9mIEJNQw0KPiAgYXNwZWVkOiBBZGQgSTJDIG5l
dyByZWdpc3RlciBETUEgc2xhdmUgbW9kZSBzdXBwb3J0DQo+IA0KPiBody9hcm0vYXNwZWVkLmMg
ICAgICAgICAgICAgICAgICB8ICA0MiArKysrKysNCj4gaHcvYXJtL2FzcGVlZF9hc3QxMHgwLmMg
ICAgICAgICAgfCAgMTEgKysNCj4gaHcvYXJtL3B4YTJ4eC5jICAgICAgICAgICAgICAgICAgfCAg
IDIgKw0KPiBody9kaXNwbGF5L3NpaTkwMjIuYyAgICAgICAgICAgICB8ICAgMiArDQo+IGh3L2Rp
c3BsYXkvc3NkMDMwMy5jICAgICAgICAgICAgIHwgICAyICsNCj4gaHcvaTJjL2FzcGVlZF9pMmMu
YyAgICAgICAgICAgICAgfCAyMzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQ0KPiBo
dy9pMmMvY29yZS5jICAgICAgICAgICAgICAgICAgICB8ICA3MCArKysrKysrKy0NCj4gaHcvaTJj
L3BtYnVzX2RldmljZS5jICAgICAgICAgICAgfCAgIDYgKw0KPiBody9pMmMvc21idXNfc2xhdmUu
YyAgICAgICAgICAgICB8ICAgNCArDQo+IGh3L2kyYy90cmFjZS1ldmVudHMgICAgICAgICAgICAg
IHwgICAyICsNCj4gaHcvbWlzYy9hc3BlZWRfcGVjaS5jICAgICAgICAgICAgfCAyMjUgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gaHcvbWlzYy9mYnkzNV9jcGxkLmMgICAgICAgICAg
ICAgfCAxMzcgKysrKysrKysrKysrKysrKysrDQo+IGh3L21pc2MvaW50ZWxfbWUuYyAgICAgICAg
ICAgICAgIHwgMTc2ICsrKysrKysrKysrKysrKysrKysrKysrDQo+IGh3L21pc2MvbWVzb24uYnVp
bGQgICAgICAgICAgICAgIHwgICA1ICstDQo+IGh3L252cmFtL2VlcHJvbV9hdDI0Yy5jICAgICAg
ICAgIHwgICAyICsNCj4gaHcvc2Vuc29yL2lzbF9wbWJ1c192ci5jICAgICAgICAgfCAgMzAgKysr
Kw0KPiBody9zZW5zb3IvbHNtMzAzZGxoY19tYWcuYyAgICAgICB8ICAgMiArDQo+IGluY2x1ZGUv
aHcvYXJtL2FzcGVlZF9zb2MuaCAgICAgIHwgICAzICsNCj4gaW5jbHVkZS9ody9pMmMvYXNwZWVk
X2kyYy5oICAgICAgfCAgMTEgKysNCj4gaW5jbHVkZS9ody9pMmMvaTJjLmggICAgICAgICAgICAg
fCAgMzAgKysrKw0KPiBpbmNsdWRlL2h3L2kyYy9wbWJ1c19kZXZpY2UuaCAgICB8ICAgMSArDQo+
IGluY2x1ZGUvaHcvbWlzYy9hc3BlZWRfcGVjaS5oICAgIHwgIDM0ICsrKysrDQo+IGluY2x1ZGUv
aHcvc2Vuc29yL2lzbF9wbWJ1c192ci5oIHwgICAxICsNCj4gMjMgZmlsZXMgY2hhbmdlZCwgMTAw
MiBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkNCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGh3
L21pc2MvYXNwZWVkX3BlY2kuYw0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgaHcvbWlzYy9mYnkzNV9j
cGxkLmMNCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGh3L21pc2MvaW50ZWxfbWUuYw0KPiBjcmVhdGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS9ody9taXNjL2FzcGVlZF9wZWNpLmgNCj4gDQo+IC0tIA0KPiAy
LjMwLjINCj4gDQoNCg==

