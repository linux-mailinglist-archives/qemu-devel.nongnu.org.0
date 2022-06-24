Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33B255A2D7
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 22:37:49 +0200 (CEST)
Received: from localhost ([::1]:50814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4q3o-0005fP-En
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 16:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4q17-0003fm-9o
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 16:35:02 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:60570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4q15-0004UA-7y
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 16:35:00 -0400
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25OK9vuF030241;
 Fri, 24 Jun 2022 13:34:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=43N5G4EbFlJZtydhbNeo97afyuihhqQks2sFM/kEtTA=;
 b=PsLy99/GkaTY7+euScgjGzH2B2KWVvPhQYzs2ETuJRFMQH65XiPo/Tf37QRRsmb3X4mz
 VeEio74/c+JJy8ORQgoKEwfUTbVVCMLFyGdPDxdGrRfKrebaMSJctxAS142has5CLXua
 a/Tbim6erRXiPqRDOAAWU3kyshZUW4xtjuw= 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gvua9gmat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jun 2022 13:34:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imFpcyuPY4d0cUBDWiFXn/XzYOJnCI7Qa0YlSDAKpIXK+Nw82xoxy6r9TFphsrhp3pX8sIu4RRhCLocaYsnO4LonStqgsRSuiqXCcG5jweeTv4LEK/pidfxB1Swepqjt0BPRKz4jfAuSIEYVMb5gPGg6xaDDfHq3l60WludY2wGqZSNmPCw8eLzG1R/+pxNdRJXkbzWKRnWJsbMe6cB3Va1oxO3QwVn1/92xiq3ii+DXbCSib16b7yn5sXDhubIzlF1sW+SKf5XV/NmTCMfYZ0JoI/Kkq11Lv/F+bKi04oidB+YO1BqdiQ7Dr1AG/bJTakYlcoyHEAM+lbSo/U47hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43N5G4EbFlJZtydhbNeo97afyuihhqQks2sFM/kEtTA=;
 b=TJuqKVyL8yhEg5wzmR54SFNy5W9bpm3fpSy9Rfh4gX9YZAUsGuz242mv6/fux+z0HTsb3HPu7veu/gdfGzeDU3ETEx6YiIw7q4F/EyWpBtIGnDza9DWVC8Fqx9hHnh46VzTPhXr2jLAHC2P9BNlo6+793bzSUsNHqtos40bUyjDFnJT51Zbg/+G6bfHBxg5t60owEH1mVXoN9IAaEBH2jGbAloeANLdD6YQg78J+s4g2UDzHW3DYFSRGfGNcy4g4/73AE3KN0+WZFEGIcrWVyMnh3SUqNDtBahkoGYk1TYbXI3ZV2mx8bVZTKVPMxk1Nx+4WtCeJz2ayV+3CBOSF6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BN8PR15MB3428.namprd15.prod.outlook.com (2603:10b6:408:a9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 20:34:43 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134%6]) with mapi id 15.20.5373.017; Fri, 24 Jun 2022
 20:34:43 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Peter Delevoryas <pdel@fb.com>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?=
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "qemu-arm-nongnu.org@devvm9194.prn0.facebook.com"
 <qemu-arm-nongnu.org@devvm9194.prn0.facebook.com>, Cameron Esfahani via
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH] aspeed: i2c: Fix DMA len write-enable bit handling
Thread-Topic: [PATCH] aspeed: i2c: Fix DMA len write-enable bit handling
Thread-Index: AQHYiAl2Ug5GUTcub0qp3/Gu775GOK1fA5cA
Date: Fri, 24 Jun 2022 20:34:43 +0000
Message-ID: <A705D254-804B-49CD-99BB-D5152F6ABB41@fb.com>
References: <20220624203151.2026355-1-pdel@fb.com>
In-Reply-To: <20220624203151.2026355-1-pdel@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ea2f8b3-1d77-4330-3c1b-08da5620f843
x-ms-traffictypediagnostic: BN8PR15MB3428:EE_
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XS6uDEklWKxs94Cr1Kg4xANuU5iikAY3z2+eXy9liYAv/osFXcmleB7DoBmwievTzpjBtzhVODrFQsyeWFnNzNhu1icmS/ooqwQB9xufOjhIjPpLMPubhFpHBEkQd4uAU4BB/aYrZjrAhXGS1vpzDln+4ITk/pwZBl1fK6YKt1Eo/b7BQcpP8RM7/ltKYJTNO53At+YgxvIUaI4STnD7r9IPB9D9zpbvERgXki5BNCRIu8Ou/hrWkpdsQ0LQfpBibuEMEST+j+foRbTguNuKscDzm2QHepgVSZtSJjXQl4j2WlrZCzoxhomGhqBxwiRJqYKsErKp5lyslTMOU/qCQRwdqjcKR0m7d2DjmjGzN+tIxp69Nzo1EQjhEW+E6BeEwtMbk+MFezfzS9dRmi2FOF3/JHeVld+TCvhW4mGc1VN5lRsuMhPoYhxM/qL7HjPmg4aQnv3no53LsbegwXzwT68wiujOrcztbs2IEAa4PDFnGsE4JPG37ae4NNRTfhC3PAXEfwFZyVyYn1y8Bqr8GIxbv7JEoppn9Yf7PoR29ltqr/KDfBtwtAqPsRPjPjHckua4jzH48uozK1UYLJt3mlc81v8NJ/IV1ENNdAUWR7hcpe8HtrdzcknIeUhNoaj6Qgse+7Oj/DSkgs4wGEUPQbFV70dI6q5RtTzsvZWZw9GkvjwP4Q4Xadg4zt2rpSjiFag52etnztqKCnrO7qYHgCxoXGa047Pbhpy3xBVRWqPOcI3GT7w/HNi1+b7W0b7HH484kHsXP+Iflyyv4FsPiDT2iTV9+6fGWtzzNTqAr2+j91aDQffRU3G4S7zyaZfpDaGYzwUYM8tPNBiQ6U9toL9+Z9/SegYrA9qJijxfoBY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(66476007)(76116006)(64756008)(66946007)(8676002)(71200400001)(2616005)(66556008)(66446008)(478600001)(2906002)(54906003)(4326008)(109986005)(186003)(5660300002)(122000001)(8936002)(6506007)(38070700005)(83380400001)(86362001)(6512007)(41300700001)(36756003)(316002)(6486002)(966005)(53546011)(33656002)(38100700002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2llT3A0MjdzQkdzRUJJQmQ1ak1oV1RTbDBDMGkrVFBpOEdiQjNnLzRVT2U1?=
 =?utf-8?B?WFd1bW5IVnE5b0RzTU85YlZPRUJJZzBadmN3aG5CMUNFL1pDOFR1ZEJWcUZB?=
 =?utf-8?B?MThWK0tER1dReVRtdEVCWUhHRWoxL2tONXhQRzcyQzVxajF1RGtzWlYyQ0hX?=
 =?utf-8?B?VSsvelI0WjUwbVN1VS9FNFF4NXhKamdGUjlOSWVnZ3ZLU0dCMXh2eFd1QUxt?=
 =?utf-8?B?MGdlLzFWc2ZpQkFkSG1IZStycllxMmhhL0c0OXBGcTlLL1Z4Q3hvSkNPNmVZ?=
 =?utf-8?B?Tkk2dzVxSjZxeTlFbXhHZUlnaUZGNUFuaDNzYnN5Vk41ejdtUm5zbW9IRjFS?=
 =?utf-8?B?MzBudGMwVHRpZXNCS2xhOVFjMnB2djNNSmh0ZGZKUWg2eWtsOUZBckkvbDFj?=
 =?utf-8?B?a3p3UDJqd25oaWp6cXN1eWdITERIVGJsRGFNVGRyQUFZOW5TVXJhRlZ0eGxn?=
 =?utf-8?B?RzhEYktoRC96cnRlK1dweVhjN1VnNnVUVkVSVXRjOUJ0Q2xobGUrMDJCK28w?=
 =?utf-8?B?TXR2SDk2Q2EySlU3WWdTanVTQWRXVDlGekptcnUwbFBqVVgzRDFQTWtFeGxI?=
 =?utf-8?B?RmxzcVNNajF6NmZ1S2RIaDQ4dm1oZFdacnIvcmIwaUdSYW5NQXJqWHNMUXhM?=
 =?utf-8?B?WHJ6NXZZVU5hd01YSkU2bFFMVTk5MFZ2UGFtb20wMGdKWkNTc3Y0bm9tdkVj?=
 =?utf-8?B?MC9yaGgrcENpZUdlWkl0TzhUanMzQXVjK0E4Q3BKUjBMNDBzSHpSUmM4RzZK?=
 =?utf-8?B?Uit5SS9ua0V0MXZIVWZqSUpsQzlmQm40MmwwNjJMcVk5QkdZTm9qQmF6c0RF?=
 =?utf-8?B?dUxVYTdzVmdiNzAxcmpIaUpMbTNuR0gyeEdSNG5URHJkSUY1Mnp6b3hMMUtl?=
 =?utf-8?B?OURScGNnVnN3SVhYbzNHU0ZqM29rZy9NWjVCeEF4cDZHY1JvNnROVEdNZEox?=
 =?utf-8?B?ZWwwMVFNL2hXZmhBZWJxR2ZaQWFSQWVKN3pLODA5OU5Vai9uRGtJcGdYQitT?=
 =?utf-8?B?Rys1R2QrRk9NUXRVQ2hGSnBRTWJmS2lBRXlGd0RnMXhhSXNZSXpOcEJJZDhx?=
 =?utf-8?B?c0dKemlpWVFhTXVmQkRqVEQ3MEtTSHFOb3hUYXVyRE9kU1lpTlBhSGpvOUE4?=
 =?utf-8?B?UitkaTBiemQ1blQzK05DRmtEbTVqbk5qc0lJVkpmQ1ptb0RmY0lOMlhyTjBD?=
 =?utf-8?B?TFJ4cWUzU1NrNlFtVUNwdHdlTVJZMmlCQng5Rzl0d1NVK0dPV1hva0FSTnkw?=
 =?utf-8?B?VERZd3JBNFp2TmU0d1JsdmUvNXJOeC8rakhMVWRwdE9nd0N4VjRpQ1J2VHJO?=
 =?utf-8?B?OGJqUjBBc01qWERnQjVZWk9mY2E1NDVJbmZWMlN6TVpnaFhVNmdkeFNvaytj?=
 =?utf-8?B?WWNvSUVpaTY3T296YzA4T3h1dVJlNmd0QUpwZGFubFoyeDVlTEg3c2M3Wmps?=
 =?utf-8?B?R2xXaWhudkVLYkZFVVlaS0JGeHlldnJMMVpQcitKM0dGRDhOdjJvQStqRzlR?=
 =?utf-8?B?blhudHl5bWJaOHdOYmg5bHJmVW1kVXRPeUFNbGNVb3UvVW0vMitwM3o5Yklt?=
 =?utf-8?B?YStuRFJBU1hJUlA3SHd0bmcxZDlNcks3c1VWOVFaL08wZUtGelVOQlloYkxX?=
 =?utf-8?B?Vm43QjlTSGxRVWZOcmdUMCttMVpFRTM1MGNxRTd5bmJ4dFFzSW80QXhlOG5a?=
 =?utf-8?B?S0lab0E3VThWaFNLYzdpaXFRZG5IYnVqVXd1ZXhuTi8yZEdZdFRKSFNHM2JE?=
 =?utf-8?B?aDB3TGhWSXkzNE8reCtjeXJGdDd6YjlLZ3lzNmRoelkwcUl6VFpJT1pkdFFU?=
 =?utf-8?B?M2tNOU43RlhYcndBUlNIKys4aDJQdStScGJYTTQ2c2hQa0VQeUJLcDE3WWRJ?=
 =?utf-8?B?QjIwQi9XTXpXeStxZndWcVBpVzlOWUtvM2NKNk84WEtVaGhLK3dCWjhia3NB?=
 =?utf-8?B?dS8zNmRma25nNUJjRzhyWG4zVDhwNlhXaVdTYithUENiUEpZbFBDc3pCcXpR?=
 =?utf-8?B?NjdZeUs4TElzRlZZM3VYMzdGU2dER0lKUzZBY0ZKT1FoU1hFTWVBMXlWSUJO?=
 =?utf-8?B?RWVVaUZoRzF4dlJwTGhjNkdiaEUyalJQOFZFTDRDNldQTUZFRlQ3OFdKdWl5?=
 =?utf-8?B?SDY2NHZHSlNlNitFbDlnYUpFaWpVWVYyVnhiVEdUUWpzRlJXSlNKUEdkUUZ2?=
 =?utf-8?B?dkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <33E8A804EA6C42469EC7A224D36302A9@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea2f8b3-1d77-4330-3c1b-08da5620f843
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 20:34:43.0288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VnZBhKdmoL1aK8sgFfJRs44mfYUM1BpXT1nE6/ouQ7p5riislZrJiO6k+ZjMo0VU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR15MB3428
X-Proofpoint-ORIG-GUID: fsg8Ln6g7f0vBepcV3b_fYOpX8KYi48N
X-Proofpoint-GUID: fsg8Ln6g7f0vBepcV3b_fYOpX8KYi48N
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-24_09,2022-06-24_01,2022-06-22_01
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

DQoNCj4gT24gSnVuIDI0LCAyMDIyLCBhdCAxOjMxIFBNLCBQZXRlciBEZWxldm9yeWFzIDxwZGVs
QGZiLmNvbT4gd3JvdGU6DQo+IA0KPiBJIG5vdGljZWQgaTJjIHJ4IHRyYW5zZmVycyB3ZXJlIGdl
dHRpbmcgc2hvcnRlbmVkIHRvICIxIiBvbiBaZXBoeXIuIEl0DQo+IHNlZW1zIHRvIGJlIGJlY2F1
c2UgdGhlIFplcGh5ciBpMmMgZHJpdmVyIHNldHMgdGhlIFJYIERNQSBsZW4gd2l0aCB0aGUNCj4g
UlggZmllbGQgd3JpdGUtZW5hYmxlIGJpdCBzZXQgKGJpdCAzMSkgdG8gYXZvaWQgYSByZWFkLW1v
ZGlmeS13cml0ZS4gWzFdDQo+IA0KPiAvKiAweDFDIDogSTJDTSBNYXN0ZXIgRE1BIFRyYW5zZmVy
IExlbmd0aCBSZWdpc3RlciAgICovDQo+IA0KPiBJIHRoaW5rIHdlIHNob3VsZCBiZSBjaGVja2lu
ZyB0aGUgd3JpdGUtZW5hYmxlIGJpdHMgb24gdGhlIGluY29taW5nDQo+IHZhbHVlLCBub3QgY2hl
Y2tpbmcgdGhlIHJlZ2lzdGVyIGFycmF5LiBJJ20gbm90IHN1cmUgd2UncmUgZXZlbiB3cml0aW5n
DQo+IHRoZSB3cml0ZS1lbmFibGUgYml0cyB0byB0aGUgcmVnaXN0ZXIgYXJyYXksIGFjdHVhbGx5
Lg0KPiANCj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9Bc3BlZWRUZWNoLUJNQy96ZXBoeXIvYmxv
Yi9kYjNkYmNjOWM1MmU2N2E0NzE4MDg5MGFjOTM4ZWQzODBiMzNmOTFjL2RyaXZlcnMvaTJjL2ky
Y19hc3BlZWQuYyNMMTQ1LUwxNDgNCg0KQXJnLCBmb3Jnb3QgdGhpczoNCg0KRml4ZXM6IGJhMmNj
Y2Q2NGU5MGYzNCAoImFzcGVlZDogaTJjOiBBZGQgbmV3IG1vZGUgc3VwcG9ydOKAnSkNCg0KU2hv
dWxkIEkgcmVzZW5kIGFzIHYyPw0KDQpUaGFua3MsDQpQZXRlcg0KDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBQZXRlciBEZWxldm9yeWFzIDxwZGVsQGZiLmNvbT4NCj4gLS0tDQo+IGh3L2kyYy9hc3Bl
ZWRfaTJjLmMgfCA4ICsrKystLS0tDQo+IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaHcvaTJjL2FzcGVlZF9pMmMuYyBi
L2h3L2kyYy9hc3BlZWRfaTJjLmMNCj4gaW5kZXggMzdhZTFmMmUwNC4uYzRmY2U3NDc0YSAxMDA2
NDQNCj4gLS0tIGEvaHcvaTJjL2FzcGVlZF9pMmMuYw0KPiArKysgYi9ody9pMmMvYXNwZWVkX2ky
Yy5jDQo+IEBAIC02NDQsMTggKzY0NCwxOCBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfaTJjX2J1c19u
ZXdfd3JpdGUoQXNwZWVkSTJDQnVzICpidXMsIGh3YWRkciBvZmZzZXQsDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUlhfQlVGX0xFTikgKyAx
Ow0KPiAgICAgICAgIGJyZWFrOw0KPiAgICAgY2FzZSBBX0kyQ01fRE1BX0xFTjoNCj4gLSAgICAg
ICAgdzF0ID0gQVJSQVlfRklFTERfRVgzMihidXMtPnJlZ3MsIEkyQ01fRE1BX0xFTiwgUlhfQlVG
X0xFTl9XMVQpIHx8DQo+IC0gICAgICAgICAgICAgICAgICAgQVJSQVlfRklFTERfRVgzMihidXMt
PnJlZ3MsIEkyQ01fRE1BX0xFTiwgVFhfQlVGX0xFTl9XMVQpOw0KPiArICAgICAgICB3MXQgPSBG
SUVMRF9FWDMyKHZhbHVlLCBJMkNNX0RNQV9MRU4sIFJYX0JVRl9MRU5fVzFUKSB8fA0KPiArICAg
ICAgICAgICAgICBGSUVMRF9FWDMyKHZhbHVlLCBJMkNNX0RNQV9MRU4sIFRYX0JVRl9MRU5fVzFU
KTsNCj4gICAgICAgICAvKiBJZiBub25lIG9mIHRoZSB3MXQgYml0cyBhcmUgc2V0LCBqdXN0IHdy
aXRlIHRvIHRoZSByZWcgYXMgbm9ybWFsLiAqLw0KPiAgICAgICAgIGlmICghdzF0KSB7DQo+ICAg
ICAgICAgICAgIGJ1cy0+cmVnc1tSX0kyQ01fRE1BX0xFTl0gPSB2YWx1ZTsNCj4gICAgICAgICAg
ICAgYnJlYWs7DQo+ICAgICAgICAgfQ0KPiAtICAgICAgICBpZiAoQVJSQVlfRklFTERfRVgzMihi
dXMtPnJlZ3MsIEkyQ01fRE1BX0xFTiwgUlhfQlVGX0xFTl9XMVQpKSB7DQo+ICsgICAgICAgIGlm
IChGSUVMRF9FWDMyKHZhbHVlLCBJMkNNX0RNQV9MRU4sIFJYX0JVRl9MRU5fVzFUKSkgew0KPiAg
ICAgICAgICAgICBBUlJBWV9GSUVMRF9EUDMyKGJ1cy0+cmVncywgSTJDTV9ETUFfTEVOLCBSWF9C
VUZfTEVOLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEZJRUxEX0VYMzIodmFsdWUs
IEkyQ01fRE1BX0xFTiwgUlhfQlVGX0xFTikpOw0KPiAgICAgICAgIH0NCj4gLSAgICAgICAgaWYg
KEFSUkFZX0ZJRUxEX0VYMzIoYnVzLT5yZWdzLCBJMkNNX0RNQV9MRU4sIFRYX0JVRl9MRU5fVzFU
KSkgew0KPiArICAgICAgICBpZiAoRklFTERfRVgzMih2YWx1ZSwgSTJDTV9ETUFfTEVOLCBUWF9C
VUZfTEVOX1cxVCkpIHsNCj4gICAgICAgICAgICAgQVJSQVlfRklFTERfRFAzMihidXMtPnJlZ3Ms
IEkyQ01fRE1BX0xFTiwgVFhfQlVGX0xFTiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBGSUVMRF9FWDMyKHZhbHVlLCBJMkNNX0RNQV9MRU4sIFRYX0JVRl9MRU4pKTsNCj4gICAgICAg
ICB9DQo+IC0tIA0KPiAyLjMwLjINCj4gDQoNCg==

