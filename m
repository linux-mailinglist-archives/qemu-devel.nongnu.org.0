Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EF6559BBA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:36:23 +0200 (CEST)
Received: from localhost ([::1]:35512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kQ1-0000VQ-Oj
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4jrU-0005V1-DJ; Fri, 24 Jun 2022 10:00:44 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:61640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4jrR-000881-5d; Fri, 24 Jun 2022 10:00:39 -0400
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25OC3BOT017180;
 Fri, 24 Jun 2022 07:00:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=bq40Rg2ndVfEu3icf6sBzTTf8VFClGATyLsxklQmCig=;
 b=Nbzvm8gWq09UPFYoYrGfyz+ZM1++mudknCNeXh3rAPX6QMtnWxwS7WHBMx0CnPKeHGR0
 0t668YzXYOCb7uCSwrimXvoDiMBOLkNJQzs+0NBDyHdtYHdvCi4a5IN3UVzVZI27rWb0
 VOlwfTpQspOLi9GRxQlrnaPObYKkTHYC9VQ= 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gvvmjdm71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jun 2022 07:00:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nppA6CjVGTVk4YTBetzCoqOsc5cUCQLUk66x9EF+gwVO2h2g8cohm/JSJqlDcfb4767fLVucIsC0KcePCoM2s+Vi7SEmRiQKAGbrjwQPpSxp9z42e8K9wXgzLyrAcfYRz/MPOaDsTvvc8j/8OYzSLlqy+ufeJxfbFzQ8ViVaEhYFzSOeBfIfQ8dkdaGHF36hrH6gpCa6LBCmMxgJJoEz5n2XCbjmy5oXCRiTJT3azAwWoknqdJYbHQOV7Rsg44QTPfffzPA87hPVM7x358oWcUq24pPUgD9zWjw5QHWy6TW7x4H/3QtZHlGElIY8Db46SfJ8RaSI/yL/ASeZxb7+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bq40Rg2ndVfEu3icf6sBzTTf8VFClGATyLsxklQmCig=;
 b=LgYAZQ+X/zBz1kCHEKj5hBDhI8BD53Pm6UevNj1q+DVgqCRh8G0nsoo1qBxUB7Zce/b9uzwBunyskZomRRqsuOctr6Tiicv+8TF7WCGvt20V6oQlHYbNrK/NdIsTgDvBsQpCToVwYTjcfLpVhsnNtyxGb0NwSqUp0ouhfY729Ngu3xeIPkxIRg1lQYQRmc/NJl+GqCxaiwPKSmaRSbgkiiDPc1+Go01tv+kNx5c0W7QCAK1HuTrR28ydBWQn84YHvP7kxBXZfR7Kfg2gyF6IdO/p37yBt7QsL5q0krPaDjNNVu0eEIW563v7DFV1NadIfG8hOR6rwIT0Sw9BLErbuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by SJ0PR15MB4170.namprd15.prod.outlook.com (2603:10b6:a03:2c9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 14:00:20 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134%6]) with mapi id 15.20.5373.017; Fri, 24 Jun 2022
 14:00:19 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Peter Delevoryas <pdel@fb.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Subject: Re: [PATCH v2 1/8] aspeed: Set CPU memory property explicitly
Thread-Topic: [PATCH v2 1/8] aspeed: Set CPU memory property explicitly
Thread-Index: AQHYh2KQqgVE5mGeUEKo6PpVBo6g8a1eGrqAgAAFKACAAHbSgA==
Date: Fri, 24 Jun 2022 14:00:19 +0000
Message-ID: <A7819461-C494-4B06-80CB-21473A3C6E28@fb.com>
References: <20220624003701.1363500-1-pdel@fb.com>
 <20220624003701.1363500-2-pdel@fb.com>
 <3ba89576-b482-14da-9a23-22c0e652e148@kaod.org>
 <9093f275-8062-7992-293e-1c5c129fd228@kaod.org>
In-Reply-To: <9093f275-8062-7992-293e-1c5c129fd228@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a36815e-c5ef-427d-0b12-08da55e9dfde
x-ms-traffictypediagnostic: SJ0PR15MB4170:EE_
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l5hD3LFnRHEYpHvcQ8Uy4Ox5pQ1xyFBjHJOZ7JJq97hfWAZkeiHbbDHmo9mpCdsTBC3zC/W380ASx+dv3oiYkk6dT9LqEi6rSqYhDo3HkeuaG+003TdXNGpTAJSqCLeRZTGfVRcmD7P2Zx8lv0iNP2bEtFK6BDdnlAuExpoCCboA8S/NURpGkH/8VhrurjJHXATSBFZ/cso/taX2hOauzLzkZDue2ehz1SuCiV9b0zBymfz0OtUfrjIVD5pzZM0nCw0K5BqMkDBvX5Bztb/eDhAa8akSRzCv77GYX+Np195kpRkqVO7qK45PH3BSQRAN4ldB6bXbK0id1ST3pWCaVe2OgHxeyURTf8d8IzWrP9dm7YQii5tO3xV34OztmgJToISVJubS+N4Q/54ju+/Lq9kQCsJWBl89mvH6uJy+HJqeXgZbnXapSlFRRVQW06I7BLRnMXbm2eyFctP7sWnJVP1S8axMKUnjnw8QhThQkHFacWTQxeYb1YvBeVyLt2mOpriuMKnZZpiwlpp1zJaTBgQ1BeNc5IN+OmYDPZx185PyZ5KatQ7kMHahPeGRQJONaL6g9POxvncQ9G/xTMN8wm6AIBe7BZqPLz2uptHogqKSpiaG8S3Qwc2xY0CgE++mvB9CmneL3paLtQnGjcuA9gspajG2DBu//i0+r3vmGk7trnu4YqDEOMvXSu4GrY3zRPOTsEzrzhpecsFACDVoVh3AGkcS6EFvK9zNdoIb3wnNT5xYtam3KyqPdEZCKme1sw/lTX0ddNh1hIR4nw3JUoxvMG19G04+iDaW6ikC3aUDl4Z5mjXNoMGdIU23/gZlcX2zDitEOfdwcPg+mdUngQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(6506007)(41300700001)(478600001)(36756003)(2616005)(33656002)(54906003)(53546011)(109986005)(71200400001)(38100700002)(186003)(316002)(6512007)(6486002)(66446008)(38070700005)(4326008)(66556008)(122000001)(66946007)(86362001)(64756008)(8676002)(66476007)(5660300002)(2906002)(76116006)(8936002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXYrZG5iek1EaXd5RHJrZ2NGd2ZRUUVRZHRxcytGZURWRzhSNVRmdjVUM2Rm?=
 =?utf-8?B?RHdhMUtDMlFJNDZCNEdIaHVEVytiZkVVWHo0dDNoemY3NU5mTms4ZDJELzVm?=
 =?utf-8?B?VWRhTXE1MVFza3FSNzNMbURiYTQrSjdVMWVnbXNMS1VXTXJOemhvYkIrWWJN?=
 =?utf-8?B?L2t2VjdDSXV5aEpoQ0VmTytaUjd2Y1FYTHVPaU43UkhjVFZMOHZ4OEpVZWt0?=
 =?utf-8?B?cGU2R0RJYW4xQjhEZnZFc1pUYmxRblpmTmcxMmpDNGdZTU4zK29oQlBVQVM2?=
 =?utf-8?B?VjgzV0pqQ3g2M0FCRXdqdEpiSzF6T0ZqUCt2VUZqQ3pWWmZiSEFEdWJHbU12?=
 =?utf-8?B?blRicFFGRDJLaG9PMThnK2tiMC9QSEdmVXlRQnVhaURTcjFxSDdOcFlIY1Bx?=
 =?utf-8?B?V0xzMDVSSEZySjljUGIxaXFsVXIvSVFtYnJsQjVNbmNqeGpwRDE5eWdycklw?=
 =?utf-8?B?aXR6bHUrUG1HSFUwWTcydndJME52OE5BOFpkNjFBSUtJK2RKRGUzT3lSOGFV?=
 =?utf-8?B?Mk0xcTZPOVV5dysxSU5vYnp6TGhzVitONmdlSWlna0l3V2VvUkNCR25wU0tq?=
 =?utf-8?B?TDFEb0E4UHJhcllpci9hRUhiWXozcjZyTkZ5NC9OTWtLY3lTYTJZeFJZbVNm?=
 =?utf-8?B?YkhlczN0MnB0bG1HOFlza0I1K2VjVFljRXRjWGtJdE5iTzVSZ1ZIc0p2MFJj?=
 =?utf-8?B?ZUhGU0NqMHkyWUFQSlprOGFxandXcnZ1S2ludk5DMisycXVRcm41REJ0MGlk?=
 =?utf-8?B?L0xzNmlZM3psUkZLK25LUGJxWWl1WlhzU3ZuT1dlenphSFN3TFVaNG1YTWRt?=
 =?utf-8?B?QWZCajRrNmxNTVYzbkl2eHhtcllsenhsNXpDeUF0RmpQazFzdWpqNmdKa2M4?=
 =?utf-8?B?YnMwS21SRDNKcnpIcVRtS1g0MTlNUk9ScW1QdU95M1FpYjE2b2dYVmM4dGRz?=
 =?utf-8?B?Q0RIVU4vRWlDaTUrZzRpR1J1R3FTTkdxNWtNb0x3OXlZYU9NMmdMK2lDdlZ5?=
 =?utf-8?B?UHhIeENYYXloVmFyUnlCM2d5UW1IcVJBQmVFYjRvWVBleVFqZ2kyeHFySHFD?=
 =?utf-8?B?SWl3c085QVUvMVZKdnJzeHhoOXNRd1loNU0wSk1JWkRtakozcXhFcldYZ1po?=
 =?utf-8?B?Yk56dlpiTDZzWlNJTTVZRkRHSFIyOUlNWlJITkszZ1JpcmExMlp3Tm5lZmtn?=
 =?utf-8?B?KzBvcFBPdCtFOElpbUM5RHRKNzRLOW42L2tTNHhVdHllZHhsVkM2N2RlTldF?=
 =?utf-8?B?SzB4OHJEU00yUEp6V25sWURja0k2SHpuME9RaXM3L0l4ek16ZlUrMzhuM1R1?=
 =?utf-8?B?RHp1SEJFWSs2SnVHcWkyelZtTWVUUmJCbGJDcDYvWkNTQUNMRGQ5citPUDM4?=
 =?utf-8?B?N1dIUTBjY0ZCVUVzeFpUVjBMa25rNVFZa25LQmc5U1pPTUd3QVR2azFKOU90?=
 =?utf-8?B?V2NydUtmQTVkVWY5WHRwejl6U3dlVko0d3Uwd2MxdHcwWXBaVWVLUktDR09B?=
 =?utf-8?B?UWF6ZUpwemFkK3hGeUhNb3JHYnJiaENjQWovQ0h6aTAyN3c2VFVoZEloN2Fh?=
 =?utf-8?B?b1hQbUtqVlRUTnlvelU1M0R0YUZ3NjN5d3d1elZ3QWVXY1dZUGtJczhqTEYz?=
 =?utf-8?B?R3lRY1ZMOVdwblMzV2ZVMDJCZ05TdExkdmdNTXVxc1VMd1RWNkhvcVRxKzJj?=
 =?utf-8?B?MXo3enBKOGdGK2l2MjRRQ3RwOWlMaFlidzJxVE5ldit2cU9VejBRYTZHM0pi?=
 =?utf-8?B?NmJ5MTBFakUwZURINytTWUhZM0xQOVJsV1gxaCtMMXEyZ1RWTDM1SmtlNmlG?=
 =?utf-8?B?K21IWjR3Zk5GdWJ1L2MzYUdJRWVWd3FRZjBKS3N0M1o2Q0xHSVhHRjFjYnM1?=
 =?utf-8?B?ZVZHNEFwL1VleFVVYW9BY05LQ3F1OVFyYU1DNFZ1SU00NGtTVGQ5WE1UaVJx?=
 =?utf-8?B?QVdpZjNQNzRsVnAyT1Y4MjdLNWpsQURDUHpGOFo4d09lSWc0bHpuRXhaZWZP?=
 =?utf-8?B?V05DT1NtbVlDc3pkOUpxTUNVNjRyZTF2bW52Y2tkcXIwN3pVWjFtd2FWMkN1?=
 =?utf-8?B?c3dlNmwxTEIvTFhCTVZuZ0NQbXFNeHIrZnBXTFNPTXkvdUxZR3poSVNOK25G?=
 =?utf-8?B?NjBvWXZmRUw2dUlkZU5KaDlVeFlBcGlsTmtCTk42b2Zmb3B5UmVwUXY1MHdq?=
 =?utf-8?B?cmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D54D50D4332474181F5EC50FFD7AB77@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a36815e-c5ef-427d-0b12-08da55e9dfde
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 14:00:19.7333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: grJRHen7sehEe5Tns0Tako7yZeBluR5l3u3K09oUaKo98NQTq7mw9LO1frTaWNxk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4170
X-Proofpoint-ORIG-GUID: ZbDgnWHPLiAFqrjiujwPP1TmV9ewPk2C
X-Proofpoint-GUID: ZbDgnWHPLiAFqrjiujwPP1TmV9ewPk2C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-24_07,2022-06-23_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=717463a23e=pdel@fb.com; helo=mx0a-00082601.pphosted.com
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

DQoNCj4gT24gSnVuIDIzLCAyMDIyLCBhdCAxMTo1NSBQTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNs
Z0BrYW9kLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiA2LzI0LzIyIDA4OjM2LCBDw6lkcmljIExlIEdv
YXRlciB3cm90ZToNCj4+IE9uIDYvMjQvMjIgMDI6MzYsIFBldGVyIERlbGV2b3J5YXMgd3JvdGU6
DQo+Pj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgRGVsZXZvcnlhcyA8cGRlbEBmYi5jb20+DQo+PiBQ
bGVhc2UgbWVyZ2UgdGhpcyBwYXRjaCB3aXRoIHBhdGNoIDIgaW4gd2hpY2ggdGhlICJtZW1vcnki
IHByb3BlcnR5DQo+PiBpcyBkZWZpbmVkLg0KPiANCj4gQWggbm8uIFRoYXQncyBhbm90aGVyIGxp
bmsuIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGVyZSB0aGF0IHdhcyBkb25lDQo+IGJlZm9yZS4NCg0K
WWVhaCwgc29ycnkgaWYgdGhpcyB3YXMgY29uZnVzaW5nOg0KDQpJbiB0aGUgQVNUMTAzMCwgd2Ug
c2V0IHRoZSBtZW1vcnkgcHJvcGVydHkgb24gdGhlIGFybXY3bSBjb3JlIGV4cGxpY2l0bHkuDQoN
CkluIHRoZSBBU1QyNDAwLCBBU1QyNTAwLCBhbmQgQVNUMjYwMCwgd2UgaGF2ZSBiZWVuIHJlbHlp
bmcgb24gdGhlDQpDUFUgaW5pdCBjb2RlIGltcGxpY2l0bHkgc2V0dGluZyBpdCB0byBnZXRfc3lz
dGVtX21lbW9yeSgpLg0KDQpUaGUgZ29hbCBvZiB0aGlzIHBhdGNoIHdhcyBqdXN0IHRvIG1ha2Ug
aXQgY29uc2lzdGVudCBhY3Jvc3MgYWxsIG9mIHRoZQ0KQXNwZWVkIFNvQ+KAmXMsIHNvIHRoYXQg
dGhlIG5leHQgcGF0Y2ggKDIvOCkgY2FuIGludHJvZHVjZSBhbiBTb0MNCm1lbW9yeSBwcm9wZXJ0
eSBhdCB0aGUgbWFjaGluZTpTb0MgbGV2ZWwgd2l0aG91dCBjaGFuZ2luZyBhbnl0aGluZw0KYXQg
dGhlIFNvQzpDUFUgbGV2ZWwuDQoNCj4gDQo+IEMuDQo+IA0KPiANCj4+IFRoYW5rcywNCj4+IEMu
DQo+Pj4gLS0tDQo+Pj4gICBody9hcm0vYXNwZWVkX2FzdDI2MDAuYyB8IDIgKysNCj4+PiAgIGh3
L2FybS9hc3BlZWRfc29jLmMgICAgIHwgMiArKw0KPj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykNCj4+PiANCj4+PiBkaWZmIC0tZ2l0IGEvaHcvYXJtL2FzcGVlZF9hc3QyNjAw
LmMgYi9ody9hcm0vYXNwZWVkX2FzdDI2MDAuYw0KPj4+IGluZGV4IGY3MGIxN2QzZjkuLmY5NTBm
ZmYwNzAgMTAwNjQ0DQo+Pj4gLS0tIGEvaHcvYXJtL2FzcGVlZF9hc3QyNjAwLmMNCj4+PiArKysg
Yi9ody9hcm0vYXNwZWVkX2FzdDI2MDAuYw0KPj4+IEBAIC0yOTQsNiArMjk0LDggQEAgc3RhdGlj
IHZvaWQgYXNwZWVkX3NvY19hc3QyNjAwX3JlYWxpemUoRGV2aWNlU3RhdGUgKmRldiwgRXJyb3Ig
KiplcnJwKQ0KPj4+ICAgICAgICAgICBvYmplY3RfcHJvcGVydHlfc2V0X2ludChPQkpFQ1QoJnMt
PmNwdVtpXSksICJjbnRmcnEiLCAxMTI1MDAwMDAwLA0KPj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAmZXJyb3JfYWJvcnQpOw0KPj4+ICsgICAgICAgIG9iamVjdF9wcm9wZXJ0
eV9zZXRfbGluayhPQkpFQ1QoJnMtPmNwdVtpXSksICJtZW1vcnkiLA0KPj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBPQkpFQ1QoZ2V0X3N5c3RlbV9tZW1vcnkoKSksICZlcnJv
cl9hYm9ydCk7DQo+Pj4gICAgICAgICAgIGlmICghcWRldl9yZWFsaXplKERFVklDRSgmcy0+Y3B1
W2ldKSwgTlVMTCwgZXJycCkpIHsNCj4+PiAgICAgICAgICAgICAgIHJldHVybjsNCj4+PiBkaWZm
IC0tZ2l0IGEvaHcvYXJtL2FzcGVlZF9zb2MuYyBiL2h3L2FybS9hc3BlZWRfc29jLmMNCj4+PiBp
bmRleCBmNTMwMDI4ODc0Li4wNmU1NjI5ODAwIDEwMDY0NA0KPj4+IC0tLSBhL2h3L2FybS9hc3Bl
ZWRfc29jLmMNCj4+PiArKysgYi9ody9hcm0vYXNwZWVkX3NvYy5jDQo+Pj4gQEAgLTI0Nyw2ICsy
NDcsOCBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfc29jX3JlYWxpemUoRGV2aWNlU3RhdGUgKmRldiwg
RXJyb3IgKiplcnJwKQ0KPj4+ICAgICAgIC8qIENQVSAqLw0KPj4+ICAgICAgIGZvciAoaSA9IDA7
IGkgPCBzYy0+bnVtX2NwdXM7IGkrKykgew0KPj4+ICsgICAgICAgIG9iamVjdF9wcm9wZXJ0eV9z
ZXRfbGluayhPQkpFQ1QoJnMtPmNwdVtpXSksICJtZW1vcnkiLA0KPj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBPQkpFQ1QoZ2V0X3N5c3RlbV9tZW1vcnkoKSksICZlcnJvcl9h
Ym9ydCk7DQo+Pj4gICAgICAgICAgIGlmICghcWRldl9yZWFsaXplKERFVklDRSgmcy0+Y3B1W2ld
KSwgTlVMTCwgZXJycCkpIHsNCj4+PiAgICAgICAgICAgICAgIHJldHVybjsNCj4+PiAgICAgICAg
ICAgfQ0KPiANCg0K

