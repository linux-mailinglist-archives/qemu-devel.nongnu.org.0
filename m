Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8483FE0B7
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 19:01:59 +0200 (CEST)
Received: from localhost ([::1]:43074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTcc-0008NO-2y
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 13:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8878769573=pdel@fb.com>)
 id 1mLTG4-0007sI-Lv; Wed, 01 Sep 2021 12:38:40 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:60776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8878769573=pdel@fb.com>)
 id 1mLTG0-0002D0-Ml; Wed, 01 Sep 2021 12:38:40 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181GZ48b005090; Wed, 1 Sep 2021 09:38:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=y2iSmavf14BfNpvrqfpoCeMIod3tdCJRyTepbaWeteQ=;
 b=qBo9s/g9AAZS8pF5jjVK62n6x6xUv5OxKCXsEhB9rHqndn+tEpsQHMk/G+xCyI7BKbtC
 E4fLnE865b9cvWH9DTDekUwDo3Atxk73Rul9nz3Qcpagt33fBuMH3wSRj05PDSknhdl2
 /fwV6DKlP3CfpWLiSVSBpScO1H1O8/NMbMs= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3asuxuq6b3-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 01 Sep 2021 09:38:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Wed, 1 Sep 2021 09:38:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/nxse1xfE/kq8q6a6p5fNgOQVP5Kz38VnWnEuvdT6A2dNcuFzATKe1SADneqO1PW27k0SqKOVkpIMbxwH9iQowFDRngONfr535Ptinvy5QvMBn2dAdCtanOQ8NCPevB7DC/g0swxmyGPlagWlK2kcXvUKz/DyESLPoWSK5cc7LALgkaZs0aNqTtG2WMrqwG8ZpWpDaC64SMtvyg0kzIlgXEnMYgygAqAwK86xkujZMeom7dUYdiCF1PLvzVnqWYI8E0pgZZhadRSTFaeasoN7v2JCLLSFzxJbH9skMnM7XaZYJr5OxQMFNW/zI3gj9eUhhKXyFegebJWi8FzxgSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2iSmavf14BfNpvrqfpoCeMIod3tdCJRyTepbaWeteQ=;
 b=N9A6DyHunVDobUTAYI3W7ZGAua6Vh9uVJk06D1GCycmrX1N+2c38KmsuiPyS7TzxG7SeBSjpdmMNWTpHUsJRjizuf5dBnDerYyQElyFwKT9qHNWz0D++QDMAfiX76KH+5465cr77IPwaWFRvjO4lN1SoIRjs3NB7vQ804pb7yxyaxpNRRX1ZzYtgLx4VAzCOCFrc+Y4Ondqo8/TXNVtChCbTNPyBj6PiJVps1daf/vjrzitgf+HTs2x6TztBBX6KARra86ggfyV0K4mY+c7eMZkClNxmyhN8YsN5spQcJGPVKgc+K5jcJk7hrc2TpfC63KZguspGw+GpNpRKov4y4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by SJ0PR15MB4758.namprd15.prod.outlook.com (2603:10b6:a03:37b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Wed, 1 Sep
 2021 16:38:16 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368%7]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 16:38:16 +0000
From: Peter Delevoryas <pdel@fb.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
CC: "joel@jms.id.au" <joel@jms.id.au>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "andrew@aj.id.au"
 <andrew@aj.id.au>, "f4bug@amsat.org" <f4bug@amsat.org>, "patrick@stwcx.xyz"
 <patrick@stwcx.xyz>
Subject: Re: [PATCH v2 1/1] hw/arm/aspeed: Allow machine to set UART default
Thread-Topic: [PATCH v2 1/1] hw/arm/aspeed: Allow machine to set UART default
Thread-Index: AQHXn0cimCUb+MA1TUuM3sqNcice4auPW9CAgAAFKLY=
Date: Wed, 1 Sep 2021 16:38:16 +0000
Message-ID: <C390CCCB-A1C0-4B5E-8197-F417F7D5849E@fb.com>
References: <20210901153615.2746885-1-pdel@fb.com>
 <20210901153615.2746885-2-pdel@fb.com>
 <d7c98ab7-1ebd-d18c-8d49-a7429fc7940a@kaod.org>
In-Reply-To: <d7c98ab7-1ebd-d18c-8d49-a7429fc7940a@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 282ecb25-c7b4-4dcd-3d03-08d96d66e5fa
x-ms-traffictypediagnostic: SJ0PR15MB4758:
x-microsoft-antispam-prvs: <SJ0PR15MB47580464BD56DC1B06D3255FACCD9@SJ0PR15MB4758.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:202;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UJ7Uygmtdyo85jKOzLDi7WVDm798JmoFHTDeqfTlpIOcswA7zpY88PZVQ6F5lgIzXtxW1YY49UK3zGpWEyA8oJcPDhqFdQW//D/1DYXhKli3Ravmjl2zaLiiFWNgUdMgEOOyKT1GhO1X8Q/Y/cCGTQ8WdUw2zM5gdHfsGCY2jMFgWTe5CJYJnSqaWaI3RZ02X1OLqHr+NdIgQw0WldDPMZ4zzVKtwYKHlg2psV6iCI8TfaQnX7P0lYk5Yoix7fIAO7FVkVZvlS84xLecGmPahUy+uPQO+lJ2i+hB0L3r62IslBTEPg1hO0XltBT+iVP9Euv2kOsLjTjo0eD3mYvPPttXHzpvOCLR9bhmsXCKgiq0X12pQ3OudMZMEKxj7/cSs42XYN7TYTe1emRKE4MXEmvDJVSMuuXgPhne1edEHrJ46fWiFpeDkmABD55G1xpra1/pakWgj0f6n8Jv5UKLiYZXEM4PRraAFvpTiqoZLPP3udPUpWlAFPugvcHSJuUXG7vjUGMEGBDnnOoIawDZceP2X6G9vCqrPOExrOIAgicp//UP+B/gBhxnNj2RedBb8xORKDQoNaX35GD7xT8grPrh694Mwy8Ngm/aXeXEMgYkBACu0g2v6kKf5PPiAqOeCV5drx2ze6Yex05azDSVllpn12nKqNDkAFGwuZ497USeWLDV7Xm97T+AFJomDPM7IxWtsL85JADciVYyZpXiIwQ8ABGVfTA14e3u210e/po=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(76116006)(8936002)(38100700002)(478600001)(316002)(71200400001)(6916009)(66946007)(5660300002)(66476007)(6486002)(66446008)(64756008)(66556008)(122000001)(2616005)(4326008)(186003)(8676002)(83380400001)(86362001)(53546011)(33656002)(38070700005)(36756003)(6512007)(6506007)(54906003)(26005)(2906002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ylkyb00xWlNtVEYzTHcrNE5nQ3dTU1owa1d0ZmlDSU4xOEFDMjhUU041NkMr?=
 =?utf-8?B?azBTZmJGZ012VUFQd2d1Nzh6dXdQOFc1U2pxQVlCQTJPQ3YzaTNoZGJyeHlm?=
 =?utf-8?B?c29SVW5ZNEN3cXd2VlovNC9KR05vamthWjRQZS83UnVxaWFvczhaU2NVd3Fr?=
 =?utf-8?B?UEtqNHUvSWE1Rjg2dmRUNFdodU5BQUJTa3hHdjJqNEYwaGlTSi9IcnNRRDFs?=
 =?utf-8?B?UTBnQ1cxVFJHQ1BlRHFlVUt4Q1NPREcvZkZJejIrdmpjMzJ3RWx0cS83Uk1Z?=
 =?utf-8?B?elhoVUNTRGViQmNuQUdoUHFSeE9mVWwyZFEyRFJYRW1hY3g1QUpLaU41b2E2?=
 =?utf-8?B?TTFwR051VXViTDhYR1UrMlAxY1lkQW9rZS9rRkQ2MUNveHBOd0JLS3ZXZmxS?=
 =?utf-8?B?eEptVk05ZEtLQkZBcDlwNmlBKzJzVVE0MVlZOU9Bc2lOYzc4VGJiSnJxZWIw?=
 =?utf-8?B?UHZiRzZTR0dKMjRVOXBqYUVOZDBRUlVrd3JXLzhHSndwT2Jua0l6dy8zeUpn?=
 =?utf-8?B?TDV1Z0I4VEFJSjF0a1lZdU1ERkZFUGF2K05WdGxZUGR3WG5lN3ZTMTJma20x?=
 =?utf-8?B?TWpFb0RrYm9hTy9xUFJhVDZHMUJNOGMwNklLN1NPclE2UGtNNzlBQzBzazZ2?=
 =?utf-8?B?cElzZk9xOVhDTm1SYXhoMWZYMzE1TG56d3RXTlV0cXV2RlMvL25QUU1ENFhQ?=
 =?utf-8?B?OVpPQU0wdms4bXNNei9oVE8yMk1TWWJOdzhHV2JUaHVSSmU0S3R2OGw2Mk5p?=
 =?utf-8?B?eElkTW1QSWlvUG9SQmZ0ZjZPN2lhRVRwSGtONjV5blJ5R0pGaWtleC9keXMv?=
 =?utf-8?B?cU0yMDJzck9lMUdlektQeTdOWEYvU2NwYWNycFBsWFdOdHZONTgrend0bk9L?=
 =?utf-8?B?SUFrRUVyUFpJTnVqTTdKR1Y2S1BjTFI1MFRYYVpMZ0ZMV2lyZ21rcHczckhy?=
 =?utf-8?B?cHJvK1Z4U0ExTG1oTGptNHVObTVGSkFyemtwMHM5OVhsem9YSzUvVDk2L2t0?=
 =?utf-8?B?LzZ2UGtPOGw4SWR6Y3k4K1dXTSthSURKWmlYSzBYcXplR0szbXBpR3NvNWhQ?=
 =?utf-8?B?S2doNXZoaENvTm04NUQwQXcwZGFaMlR6TlR1L21oTEF1QkExSHZXeTVSOE5y?=
 =?utf-8?B?RnZ4R2lPM1VQQ0hKdnpPZnY3UjY4Ky9ic0cwMHFjWmdaYVVVQjB4UFc0Y21t?=
 =?utf-8?B?OXByeW9GMXBKVDJicUxkRzZBNVd6ZXRYVXhLZ0RzSXp1dndqcm1ULzMrRFpw?=
 =?utf-8?B?K1lPc3dwT3RKREVmKzYrYUFmZ0ZlUk9TNUFUeXM4MittdUR5SzVxZXo1cW45?=
 =?utf-8?B?U2NiMDdTeDNMdkNHM1R2dk5WcEhTS1ZVTzArak9LOVpDMTVpa1l2NHpmWElu?=
 =?utf-8?B?RWlGRmFBM2phUDlaY3ltbWRRT2x1VXl2V0FMaVZmRDlyeDlTKzFoak1JclJw?=
 =?utf-8?B?RHVmamtrd1FZcUNFYWU2d0o3MVNPVnBPbFVFYi9yV2pVUXdaOXhvMm94OEVh?=
 =?utf-8?B?aFArR2YzTm9sUEQyV1dsWGxscW9ZcGdPMXNTbjNHaGVoWjdsU2lPaWNQaU1K?=
 =?utf-8?B?a2FGSjE2OXNwZlJpNEJCalVBVmRmV2tUbWRTUDNXNVBaYkg1K1VyclVoVzF3?=
 =?utf-8?B?eVN4WmlKOGcyUFA0a1VnQ0Q2V1NQZVpyUitKRW1Gd3RRZFdHTmo5dEhYeHBJ?=
 =?utf-8?B?VFJaOW9vcGxiMU5QcDVQeUpUK1VBZTAxd1p3bzJSMFhCNFV3aUo4NkN4MFBv?=
 =?utf-8?Q?IUZUYBWWxGoDcRn2L4=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282ecb25-c7b4-4dcd-3d03-08d96d66e5fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 16:38:16.0470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8SgJo5AQbaOcpsusJasksifr4kfWgjIdLEtNAmB1jsXQo9eTGc/BlP/JNMm93Abm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4758
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: ETRcmRD3JMjmnlKhZT8ALePdS2QOwbcB
X-Proofpoint-ORIG-GUID: ETRcmRD3JMjmnlKhZT8ALePdS2QOwbcB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_05:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0
 mlxlogscore=999 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2109010096
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=8878769573=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

DQo+IE9uIFNlcCAxLCAyMDIxLCBhdCA5OjE5IEFNLCBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGth
b2Qub3JnPiB3cm90ZToNCj4gDQo+IO+7v09uIDkvMS8yMSA1OjM2IFBNLCBwZGVsQGZiLmNvbSB3
cm90ZToNCj4+IEZyb206IFBldGVyIERlbGV2b3J5YXMgPHBkZWxAZmIuY29tPg0KPj4gDQo+PiBX
aGVuIHlvdSBydW4gUUVNVSB3aXRoIGFuIEFzcGVlZCBtYWNoaW5lIGFuZCBhIHNpbmdsZSBzZXJp
YWwgZGV2aWNlDQo+PiB1c2luZyBzdGRpbyBsaWtlIHRoaXM6DQo+PiANCj4+ICAgIHFlbXUgLW1h
Y2hpbmUgYXN0MjYwMC1ldmIgLWRyaXZlIC4uLiAtc2VyaWFsIHN0ZGlvDQo+PiANCj4+IFRoZSBn
dWVzdCBPUyBjYW4gcmVhZCBhbmQgd3JpdGUgdG8gdGhlIFVBUlQ1IHJlZ2lzdGVycyBhdCAweDFF
Nzg0MDAwIGFuZA0KPj4gaXQgd2lsbCByZWNlaXZlIGZyb20gc3RkaW4gYW5kIHdyaXRlIHRvIHN0
ZG91dC4gVGhlIEFzcGVlZCBTb0MncyBoYXZlIGENCj4+IGxvdCBtb3JlIFVBUlQncyB0aG91Z2gg
KEFTVDI1MDAgaGFzIDUsIEFTVDI2MDAgaGFzIDEzKSBhbmQgZGVwZW5kaW5nIG9uDQo+PiB0aGUg
Ym9hcmQgZGVzaWduLCBtYXkgYmUgdXNpbmcgYW55IG9mIHRoZW0gYXMgdGhlIHNlcmlhbCBjb25z
b2xlLiAoU2VlDQo+PiAic3Rkb3V0LXBhdGgiIGluIGEgRFRTIHRvIGNoZWNrIHdoaWNoIG9uZSBp
cyBjaG9zZW4pLg0KPj4gDQo+PiBNb3N0IGJvYXJkcywgaW5jbHVkaW5nIGFsbCBvZiB0aG9zZSBj
dXJyZW50bHkgZGVmaW5lZCBpbg0KPj4gaHcvYXJtL2FzcGVlZC5jLCBqdXN0IHVzZSBVQVJUNSwg
YnV0IHNvbWUgdXNlIFVBUlQxLiBUaGlzIGNoYW5nZSBhZGRzDQo+PiBzb21lIGZsZXhpYmlsaXR5
IGZvciBkaWZmZXJlbnQgYm9hcmRzIHdpdGhvdXQgcmVxdWlyaW5nIHVzZXJzIHRvIGNoYW5nZQ0K
Pj4gdGhlaXIgY29tbWFuZC1saW5lIGludm9jYXRpb24gb2YgUUVNVS4NCj4+IA0KPj4gSSB0ZXN0
ZWQgdGhpcyBkb2Vzbid0IGJyZWFrIGV4aXN0aW5nIGNvZGUgYnkgYm9vdGluZyBhbiBBU1QyNTAw
IE9wZW5CTUMNCj4+IGltYWdlIGFuZCBhbiBBU1QyNjAwIE9wZW5CTUMgaW1hZ2UsIGVhY2ggdXNp
bmcgVUFSVDUgYXMgdGhlIGNvbnNvbGUuDQo+PiANCj4+IFRoZW4gSSB0ZXN0ZWQgc3dpdGNoaW5n
IHRoZSBkZWZhdWx0IHRvIFVBUlQxIGFuZCBib290aW5nIGFuIEFTVDI2MDANCj4+IE9wZW5CTUMg
aW1hZ2UgdGhhdCB1c2VzIFVBUlQxLCBhbmQgdGhhdCB3b3JrZWQgdG9vLg0KPj4gDQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBQZXRlciBEZWxldm9yeWFzIDxwZGVsQGZiLmNvbT4NCj4gDQo+IE9uZSBjb21t
ZW50LCBhbnkgaG93IA0KPiANCj4gUmV2aWV3ZWQtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdA
a2FvZC5vcmc+DQo+IA0KPj4gLS0tDQo+PiBody9hcm0vYXNwZWVkLmMgICAgICAgICAgICAgfCAz
ICsrKw0KPj4gaHcvYXJtL2FzcGVlZF9hc3QyNjAwLmMgICAgIHwgOCArKysrLS0tLQ0KPj4gaHcv
YXJtL2FzcGVlZF9zb2MuYyAgICAgICAgIHwgOSArKysrKystLS0NCj4+IGluY2x1ZGUvaHcvYXJt
L2FzcGVlZC5oICAgICB8IDEgKw0KPj4gaW5jbHVkZS9ody9hcm0vYXNwZWVkX3NvYy5oIHwgMSAr
DQo+PiA1IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+
PiANCj4+IGRpZmYgLS1naXQgYS9ody9hcm0vYXNwZWVkLmMgYi9ody9hcm0vYXNwZWVkLmMNCj4+
IGluZGV4IDlkNDNlMjZjNTEuLmE4MWU5MGM1MzkgMTAwNjQ0DQo+PiAtLS0gYS9ody9hcm0vYXNw
ZWVkLmMNCj4+ICsrKyBiL2h3L2FybS9hc3BlZWQuYw0KPj4gQEAgLTM1MCw2ICszNTAsOCBAQCBz
dGF0aWMgdm9pZCBhc3BlZWRfbWFjaGluZV9pbml0KE1hY2hpbmVTdGF0ZSAqbWFjaGluZSkNCj4+
ICAgICAgICAgb2JqZWN0X3Byb3BlcnR5X3NldF9pbnQoT0JKRUNUKCZibWMtPnNvYyksICJody1w
cm90LWtleSIsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFTUEVFRF9TQ1Vf
UFJPVF9LRVksICZlcnJvcl9hYm9ydCk7DQo+PiAgICAgfQ0KPj4gKyAgICBxZGV2X3Byb3Bfc2V0
X3VpbnQzMihERVZJQ0UoJmJtYy0+c29jKSwgInVhcnQtZGVmYXVsdCIsDQo+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgIGFtYy0+dWFydF9kZWZhdWx0KTsNCj4+ICAgICBxZGV2X3JlYWxpemUo
REVWSUNFKCZibWMtPnNvYyksIE5VTEwsICZlcnJvcl9hYm9ydCk7DQo+PiANCj4+ICAgICBtZW1v
cnlfcmVnaW9uX2FkZF9zdWJyZWdpb24oZ2V0X3N5c3RlbV9tZW1vcnkoKSwNCj4+IEBAIC04MDQs
NiArODA2LDcgQEAgc3RhdGljIHZvaWQgYXNwZWVkX21hY2hpbmVfY2xhc3NfaW5pdChPYmplY3RD
bGFzcyAqb2MsIHZvaWQgKmRhdGEpDQo+PiAgICAgbWMtPm5vX3BhcmFsbGVsID0gMTsNCj4+ICAg
ICBtYy0+ZGVmYXVsdF9yYW1faWQgPSAicmFtIjsNCj4+ICAgICBhbWMtPm1hY3NfbWFzayA9IEFT
UEVFRF9NQUMwX09OOw0KPj4gKyAgICBhbWMtPnVhcnRfZGVmYXVsdCA9IEFTUEVFRF9ERVZfVUFS
VDU7DQo+PiANCj4+ICAgICBhc3BlZWRfbWFjaGluZV9jbGFzc19wcm9wc19pbml0KG9jKTsNCj4+
IH0NCj4+IGRpZmYgLS1naXQgYS9ody9hcm0vYXNwZWVkX2FzdDI2MDAuYyBiL2h3L2FybS9hc3Bl
ZWRfYXN0MjYwMC5jDQo+PiBpbmRleCBlMzAxMzEyOGM2Li5iMDdmY2YxMGEwIDEwMDY0NA0KPj4g
LS0tIGEvaHcvYXJtL2FzcGVlZF9hc3QyNjAwLmMNCj4+ICsrKyBiL2h3L2FybS9hc3BlZWRfYXN0
MjYwMC5jDQo+PiBAQCAtMzIyLDEwICszMjIsMTAgQEAgc3RhdGljIHZvaWQgYXNwZWVkX3NvY19h
c3QyNjAwX3JlYWxpemUoRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKQ0KPj4gICAgICAg
ICBzeXNidXNfY29ubmVjdF9pcnEoU1lTX0JVU19ERVZJQ0UoJnMtPnRpbWVyY3RybCksIGksIGly
cSk7DQo+PiAgICAgfQ0KPj4gDQo+PiAtICAgIC8qIFVBUlQgLSBhdHRhY2ggYW4gODI1MCB0byB0
aGUgSU8gc3BhY2UgYXMgb3VyIFVBUlQ1ICovDQo+PiAtICAgIHNlcmlhbF9tbV9pbml0KGdldF9z
eXN0ZW1fbWVtb3J5KCksIHNjLT5tZW1tYXBbQVNQRUVEX0RFVl9VQVJUNV0sIDIsDQo+PiAtICAg
ICAgICAgICAgICAgICAgIGFzcGVlZF9zb2NfZ2V0X2lycShzLCBBU1BFRURfREVWX1VBUlQ1KSwN
Cj4+IC0gICAgICAgICAgICAgICAgICAgMzg0MDAsIHNlcmlhbF9oZCgwKSwgREVWSUNFX0xJVFRM
RV9FTkRJQU4pOw0KPj4gKyAgICAvKiBVQVJUIC0gYXR0YWNoIGFuIDgyNTAgdG8gdGhlIElPIHNw
YWNlIGFzIG91ciBVQVJUICovDQo+PiArICAgIHNlcmlhbF9tbV9pbml0KGdldF9zeXN0ZW1fbWVt
b3J5KCksIHNjLT5tZW1tYXBbcy0+dWFydF9kZWZhdWx0XSwgMiwNCj4+ICsgICAgICAgICAgICAg
ICAgICAgYXNwZWVkX3NvY19nZXRfaXJxKHMsIHMtPnVhcnRfZGVmYXVsdCksIDM4NDAwLA0KPj4g
KyAgICAgICAgICAgICAgICAgICBzZXJpYWxfaGQoMCksIERFVklDRV9MSVRUTEVfRU5ESUFOKTsN
Cj4+IA0KPj4gICAgIC8qIEkyQyAqLw0KPj4gICAgIG9iamVjdF9wcm9wZXJ0eV9zZXRfbGluayhP
QkpFQ1QoJnMtPmkyYyksICJkcmFtIiwgT0JKRUNUKHMtPmRyYW1fbXIpLA0KPj4gZGlmZiAtLWdp
dCBhL2h3L2FybS9hc3BlZWRfc29jLmMgYi9ody9hcm0vYXNwZWVkX3NvYy5jDQo+PiBpbmRleCAz
YWQ2YzU2ZmE5Li4wOWMwZjgzNzEwIDEwMDY0NA0KPj4gLS0tIGEvaHcvYXJtL2FzcGVlZF9zb2Mu
Yw0KPj4gKysrIGIvaHcvYXJtL2FzcGVlZF9zb2MuYw0KPj4gQEAgLTI4Nyw5ICsyODcsOSBAQCBz
dGF0aWMgdm9pZCBhc3BlZWRfc29jX3JlYWxpemUoRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKipl
cnJwKQ0KPj4gICAgICAgICBzeXNidXNfY29ubmVjdF9pcnEoU1lTX0JVU19ERVZJQ0UoJnMtPnRp
bWVyY3RybCksIGksIGlycSk7DQo+PiAgICAgfQ0KPj4gDQo+PiAtICAgIC8qIFVBUlQgLSBhdHRh
Y2ggYW4gODI1MCB0byB0aGUgSU8gc3BhY2UgYXMgb3VyIFVBUlQ1ICovDQo+PiAtICAgIHNlcmlh
bF9tbV9pbml0KGdldF9zeXN0ZW1fbWVtb3J5KCksIHNjLT5tZW1tYXBbQVNQRUVEX0RFVl9VQVJU
NV0sIDIsDQo+PiAtICAgICAgICAgICAgICAgICAgIGFzcGVlZF9zb2NfZ2V0X2lycShzLCBBU1BF
RURfREVWX1VBUlQ1KSwgMzg0MDAsDQo+PiArICAgIC8qIFVBUlQgLSBhdHRhY2ggYW4gODI1MCB0
byB0aGUgSU8gc3BhY2UgYXMgb3VyIFVBUlQgKi8NCj4+ICsgICAgc2VyaWFsX21tX2luaXQoZ2V0
X3N5c3RlbV9tZW1vcnkoKSwgc2MtPm1lbW1hcFtzLT51YXJ0X2RlZmF1bHRdLCAyLA0KPj4gKyAg
ICAgICAgICAgICAgICAgICBhc3BlZWRfc29jX2dldF9pcnEocywgcy0+dWFydF9kZWZhdWx0KSwg
Mzg0MDAsDQo+PiAgICAgICAgICAgICAgICAgICAgc2VyaWFsX2hkKDApLCBERVZJQ0VfTElUVExF
X0VORElBTik7DQo+PiANCj4+ICAgICAvKiBJMkMgKi8NCj4+IEBAIC00MzksNiArNDM5LDggQEAg
c3RhdGljIHZvaWQgYXNwZWVkX3NvY19yZWFsaXplKERldmljZVN0YXRlICpkZXYsIEVycm9yICoq
ZXJycCkNCj4+IHN0YXRpYyBQcm9wZXJ0eSBhc3BlZWRfc29jX3Byb3BlcnRpZXNbXSA9IHsNCj4+
ICAgICBERUZJTkVfUFJPUF9MSU5LKCJkcmFtIiwgQXNwZWVkU29DU3RhdGUsIGRyYW1fbXIsIFRZ
UEVfTUVNT1JZX1JFR0lPTiwNCj4+ICAgICAgICAgICAgICAgICAgICAgIE1lbW9yeVJlZ2lvbiAq
KSwNCj4+ICsgICAgREVGSU5FX1BST1BfVUlOVDMyKCJ1YXJ0LWRlZmF1bHQiLCBBc3BlZWRTb0NT
dGF0ZSwgdWFydF9kZWZhdWx0LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgQVNQRUVEX0RF
Vl9VQVJUNSksDQo+PiAgICAgREVGSU5FX1BST1BfRU5EX09GX0xJU1QoKSwNCj4+IH07DQo+PiAN
Cj4+IEBAIC00NDksNiArNDUxLDcgQEAgc3RhdGljIHZvaWQgYXNwZWVkX3NvY19jbGFzc19pbml0
KE9iamVjdENsYXNzICpvYywgdm9pZCAqZGF0YSkNCj4+ICAgICBkYy0+cmVhbGl6ZSA9IGFzcGVl
ZF9zb2NfcmVhbGl6ZTsNCj4+ICAgICAvKiBSZWFzb246IFVzZXMgc2VyaWFsX2hkcyBhbmQgbmRf
dGFibGUgaW4gcmVhbGl6ZSgpIGRpcmVjdGx5ICovDQo+PiAgICAgZGMtPnVzZXJfY3JlYXRhYmxl
ID0gZmFsc2U7DQo+PiArDQo+IA0KPiBVbm5lZWRlZCBjaGFuZ2UsDQo+IA0KPiBUaGFua3MsDQo+
IA0KPiBDLiANCg0KRGFuZyBpdCwgeWVhaCBJIG5vdGljZWQgdGhhdCBqdXN0IGFmdGVyIEkgc2Vu
dCB0aGUgcGF0Y2gsIG15IGJhZC4gSeKAmWxsIHJlbW92ZSBpdCwgSeKAmW0ganVzdCBhd2F5IGZy
b20gbXkgY29tcHV0ZXIsIHNvIHByb2JhYmx5IHdvbuKAmXQgZ2V0IGl0IGluIHRpbWUgZm9yIHlv
dSBndXlzIHRvIHJldmlldyBvdmVyIGluIHlvdXIgdGltZWxpbmUuDQoNClNlbnQgZnJvbSBteSBp
UGhvbmUNCg0KPiANCj4+ICAgICBkZXZpY2VfY2xhc3Nfc2V0X3Byb3BzKGRjLCBhc3BlZWRfc29j
X3Byb3BlcnRpZXMpOw0KPj4gfQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9hcm0v
YXNwZWVkLmggYi9pbmNsdWRlL2h3L2FybS9hc3BlZWQuaA0KPj4gaW5kZXggYzk3NDdiMTVmYy4u
Y2JlYWNiMjE0YyAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvaHcvYXJtL2FzcGVlZC5oDQo+PiAr
KysgYi9pbmNsdWRlL2h3L2FybS9hc3BlZWQuaA0KPj4gQEAgLTM4LDYgKzM4LDcgQEAgc3RydWN0
IEFzcGVlZE1hY2hpbmVDbGFzcyB7DQo+PiAgICAgdWludDMyX3QgbnVtX2NzOw0KPj4gICAgIHVp
bnQzMl90IG1hY3NfbWFzazsNCj4+ICAgICB2b2lkICgqaTJjX2luaXQpKEFzcGVlZE1hY2hpbmVT
dGF0ZSAqYm1jKTsNCj4+ICsgICAgdWludDMyX3QgdWFydF9kZWZhdWx0Ow0KPj4gfTsNCj4+IA0K
Pj4gDQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9hcm0vYXNwZWVkX3NvYy5oIGIvaW5jbHVk
ZS9ody9hcm0vYXNwZWVkX3NvYy5oDQo+PiBpbmRleCBkOTE2MWQyNmQ2Li44N2Q3NmM5MjU5IDEw
MDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9ody9hcm0vYXNwZWVkX3NvYy5oDQo+PiArKysgYi9pbmNs
dWRlL2h3L2FybS9hc3BlZWRfc29jLmgNCj4+IEBAIC02NSw2ICs2NSw3IEBAIHN0cnVjdCBBc3Bl
ZWRTb0NTdGF0ZSB7DQo+PiAgICAgQXNwZWVkU0RIQ0lTdGF0ZSBzZGhjaTsNCj4+ICAgICBBc3Bl
ZWRTREhDSVN0YXRlIGVtbWM7DQo+PiAgICAgQXNwZWVkTFBDU3RhdGUgbHBjOw0KPj4gKyAgICB1
aW50MzJfdCB1YXJ0X2RlZmF1bHQ7DQo+PiB9Ow0KPj4gDQo+PiAjZGVmaW5lIFRZUEVfQVNQRUVE
X1NPQyAiYXNwZWVkLXNvYyINCj4+IA0KPiANCg==

