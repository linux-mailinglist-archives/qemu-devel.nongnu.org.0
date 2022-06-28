Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A74E55BFBF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:19:17 +0200 (CEST)
Received: from localhost ([::1]:36836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67NL-0002Q9-Rf
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7178e17cfc=pdel@fb.com>)
 id 1o65DM-0002xX-KD; Tue, 28 Jun 2022 03:00:48 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:26858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7178e17cfc=pdel@fb.com>)
 id 1o65DF-0008K5-K3; Tue, 28 Jun 2022 03:00:47 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RJ1QIw024725;
 Tue, 28 Jun 2022 00:00:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=w8qcA0DFsLx7jAJFuMVM8RK3FhibNAIVlIT3Xw+FQXo=;
 b=bVrB/KSq13Zi40Qt5o+SooLWQIScylOXLwtMqFnbGzfYcBSUXG6ohe1C5iYh1a/jWvda
 9GSPNwr2RTuhJ6QwnAuHf3V6tHJE8WJ2no4ubyVEC7HfrnZWdW0ozcjfoXzdoAyAhWnk
 QBIKGBz7HPhAV33Iu6dGpx4MkthqQouaLf8= 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gwyfsgc6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jun 2022 00:00:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1aW8UF+eVHP2XU5lVfb/tmRB3+XP05IH0VkFg8oFIXQ8tjf3H6UvhoHkGQeWyZsQNTDuXCdfE5tYaqMhqrS06CTHjjsxwgHrVgZIyRIDinPai8RCW5bIkTol+MK0JcHOdgFvAECRLZOGeJtRn365Yp9a0oKcRMSgMYhZX6YnrOzMwQ8XQdJJd+YAMmLu2P/SKr0pTfNEB4gldFVr0mW+n3dALgvGJ3AH5cLKXM6eP1Qbtqq6PX/HX7QnoR6LUXP7cqCCqdlxxjoohSr5LmEJzNDZzoUqh3yKOtHvpAPqnNDeI1jXtSfhTnkbIEK6IZSSZMLEZyjtWgRDexDTdzJAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8qcA0DFsLx7jAJFuMVM8RK3FhibNAIVlIT3Xw+FQXo=;
 b=R1yVqoEyJa3nmgkxH20i58ekDVXP+eT1vJdbS3agGIvY5k+QTKD1zDVuO3Fsyz1Evt+lVd48PaBeJkpVpfoLi6jEAs0iHMfmRleqNmzz0BTulkes7rLr04bDDgLyQ1/+OvgJhnsHposuOIcJmeVPJdGHXagl+5UgJ1TI8hFfGx1ZROxFIMlSP8SgIeUXkaGbznX66l/5BRpmRXoPFDdg4m8t3RbZ/0zlL6tEJsb8JF8z2FH7XHjMAGoJK7zqDz84L4F0YhHJ6FA95xIcgrlTUaJ+T87FNGr/iLFQBu44d2Uof+CEAcbZTQ2vve2DTcFrwpPCpuY8i+A6c/eJDiqGKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by MWHPR15MB1453.namprd15.prod.outlook.com (2603:10b6:300:bd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 07:00:24 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134%6]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 07:00:24 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Peter Delevoryas <pdel@fb.com>, Dan Zhang <zhdaniel@fb.com>, Cameron
 Esfahani via <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "komlodi@google.com" <komlodi@google.com>, "titusr@google.com"
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Subject: Re: [PATCH 08/14] hw/misc: Add fby35-cpld
Thread-Topic: [PATCH 08/14] hw/misc: Add fby35-cpld
Thread-Index: AQHYil/espMnRQ/bAkaXd0GEyr1onq1kYgkAgAACrwA=
Date: Tue, 28 Jun 2022 07:00:24 +0000
Message-ID: <B89D73DC-4CF3-4C41-AF7E-12AAE052D2B5@fb.com>
References: <20220627195506.403715-1-pdel@fb.com>
 <20220627195506.403715-9-pdel@fb.com>
 <88ee447f-8e9d-82ad-5be9-555d0dbd9931@kaod.org>
In-Reply-To: <88ee447f-8e9d-82ad-5be9-555d0dbd9931@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5cf8b4e-ca0d-46ac-0ef3-08da58d3e018
x-ms-traffictypediagnostic: MWHPR15MB1453:EE_
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F7T++dcCC/ATUSX/JWQvXb01fwnj32ZChwqJrg5qXywrUy4/hoeb/ZeeC04cUpqcaXbsMONQgbygDLEEgCX1KVc+yZbWJjr7OhvR1/3HyjKVzawHTMidRiSaUPYObb3uqwXVgXSwGbh7mwWImk51AD5qYm3LzHKdm2clvw+j2suhLjgvxxJtWSJlw8Zg5ZePZaOw0v8I5JIDZuJBEXeGQls/s3DQODCYq7a2+CBA6MfFfW0XXZFlPS7PfRQVTpcsF2Y4ZpJLi4aB78gdKnchu6oB5VwK9OVa9X27mtQ49YiKELlWwztw7fOMX1F/gljwoAC5aDejGV6Y8VWTQIR5Xkaywuu+ewSTa3fgxjpjA+66GRnBXhz/5pvY31bb3wIzUfD+/Ix7ccvzrDKuuLqtsbLiZTARb/Pp+wJqthdtz7gSInDFyn79E/EFOUwyBGZzgZHGZmOP3ZY88KjmVGXKBQ3gbqXEvvVQmvn3+LH30P+tkVbPwdei4IWoE1UXxT1FYsDjDJJxz/YVdxoUmze7Kslo8jioxWIBkbq7cxSa2TNJPKNeJNBrYs6Jeec9Tbfpi6KUH5xLa88i6HEko+TQYoXZro0bGipIQDp0vCQ6C44EHNGWzvMPJuLaGaFh0UFbA9yTZ+S3k9ZqZZnTCl+NDV3A6JZKzBZFpmWeoDZiITUfLB39f1QMpcd01MOHJBNKI9Frw38VaH5zKzLeVbGG4pw9cwZYnmyOId7+sXvjIFs2mMivZ0F1/6z8sCqCUKICtwIr65dcMx7vayR33Mq6m/wjwwZC63E7QzVb71G2fS+f5zvLyPUXhRAE6nfuKUaTy20rranKMswRbzyR61nfYsgev8tt4IYLb7CP59o0Q1k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(4326008)(33656002)(38070700005)(6506007)(41300700001)(316002)(66446008)(8936002)(122000001)(66574015)(64756008)(66476007)(8676002)(76116006)(66946007)(66556008)(6512007)(6486002)(186003)(53546011)(478600001)(36756003)(26005)(71200400001)(109986005)(86362001)(54906003)(2616005)(38100700002)(5660300002)(2906002)(83380400001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWs1MFdpVi8rcDcrOCs0MWdwSkZxSjFvSmpjUzJ0ODg1amtUWk5wWmU1Yzda?=
 =?utf-8?B?bkw1bXZJMlFhMDFJNzFDa3M5ZzVQNS96MllsTVRDNVZmaUJoQ0xTbDBKZWFk?=
 =?utf-8?B?ZEN4UEFnb05yc0xHZUxjbGtaTDd5OGdYMHZtZmhZSVNzUWdidGRiUDlFN0RM?=
 =?utf-8?B?ait5Vmk4YWppeVo4WWJpWnRnazBpWE9tc0xsOXhOeDFGODZnTXB6eGhNVVBl?=
 =?utf-8?B?ZmpYUFRHaFFWdS9MYXFlNlRLQXkxQ1JYb3RxMGhEREFFKzgxYjZUdFNEQlJO?=
 =?utf-8?B?eVN1UnlZSkdBS0RZRGRHaEtUWnVXTFFEUm14dm50RnhTSmFSZ0s5WjhzOGkx?=
 =?utf-8?B?bE5rc2xxVnNPa1VDR25CcGxpTjBXZ1c4aDZVakZWYmRpeEVzc0dxb3JYdkRk?=
 =?utf-8?B?TTJrdUZXU0k5dE5ucHlwMFJKVFRFMzlTbWRrVXNIMEdTbjEwWmJ1MVNJbEd3?=
 =?utf-8?B?Y0NBTHdEMjhqR2FQeDJDK2ZGRnpoajZJeXZrU0ZZenNHaFdITkluSkNqM241?=
 =?utf-8?B?bExLVVhlZ2Q5cm1HY1JKTUczQ0VoR2dTRVZia1p4RXkwQWJ2Z25OUWxGR3Js?=
 =?utf-8?B?Ym1Ob2pEZWxHY041Wmp0c2Vxc2VmQm0xZ1Z4S2FxRTMrTHdJUmNzRlpISDNk?=
 =?utf-8?B?K3owZytoNTYrOXhtblJxb0FtZ24vSUJ5K3libkJrRkRaWE5hTmMrRVZxc0lY?=
 =?utf-8?B?eHNYdXZ1S2QvdUgyWi96Q0J2WW9TTDFIL1BmMCs4QVYzZjFzNFE4R0pnS0Va?=
 =?utf-8?B?TlZYZWZWN29NVmx4NTZYNDU4bGRWS3dsOUV4OTc2QjU4Tyt4U21UUkF2YlRF?=
 =?utf-8?B?VDR5aTJoT1JYeEFyaFcvTmFwUXBHVTJPWG5IS2k5UE9zK2Zva1VqaGNYL3VN?=
 =?utf-8?B?L3hJczIzUjFBN1dMZllXbk9GQnZsMzg4VmtpRDRyTnNGcjFzTlR2dTdYWFc0?=
 =?utf-8?B?cWdSUEcxdk96OVRCVit2VGJBUzRmQXdjM3NnQm1icmE4MGtIUkFEWHI2ZURy?=
 =?utf-8?B?YUY0Q2hiaFB4RUJZQjMvMVRqY1NRd0dNUjNYVUxXaXN6UVRaeCtkS3RSRDB3?=
 =?utf-8?B?UTJ5OE9FM0xVSFd0QjY2aEwxcmF4Z3JpRmdMWDhxVk15MDU1RDBTSjZuMWd3?=
 =?utf-8?B?Ymw3Q3J6ZG1QMlZwWU85OVRJbW9CbmMvUTl4dmhFZjM1d05DR2pWbktlWE8y?=
 =?utf-8?B?RnpzVTluUzlvSWhRS3UyOWlqNW0wRGpaNzRvWi9rM2lJN0ZKMnVPK0V2SzI4?=
 =?utf-8?B?T1NMOWdCa2h0RjlUaUpnaXMvRmYrOXRlZVFJblR0cHlad3BXQXF6UjJIQkZ0?=
 =?utf-8?B?dWNLWFJkdEFza0ZjWDAxMG1TT1poVlkrRGhERzNaRE1LWmx4VzI4MHN1dnEz?=
 =?utf-8?B?Sk84bmFhTzNONkZmR2NsMFl4TVkwbzNBWEJvYVlHWUhuOXN0VFN3M2tFWVZp?=
 =?utf-8?B?K3ZpL0FCeHpaQWpLRVhxZUJ0YVpmMzVReVk0VTZmYi81RThvZXltT0ZncEF1?=
 =?utf-8?B?Q2N6MGxwQmp5SnZzelBmNzBqcDAraU5MUGpKdklUK0xJU3F3cExiQkJMUDZU?=
 =?utf-8?B?czVSUjFabFZZODVCMEJocWRQS2N4THN0RTJnN3MxbTRObUxEMHZBVHhZcDVK?=
 =?utf-8?B?ZzZlWjFGNmRsV1pxQ0lBbzVWWmhUNlJlai9DODlGc0p2clZjTktxK21xQ2Rm?=
 =?utf-8?B?OFU2RlBHQnR2cWdNbmhJWGhROFplcEdKOEFmVEtEOFFvcDdqcEFDaUdmK25T?=
 =?utf-8?B?b1pNM3JzY0RGWTd3RXZNclBRRjkyalZqR01uK3pLYTgxVEFTY3VRcFlIaEla?=
 =?utf-8?B?VTJqamxoQ2R3U2Y2ek8zUzFzM29WVGJmOWFXWEpvRjNXR0wyTTZzNGY2aldV?=
 =?utf-8?B?YWtZNSsvMDFSY3owbFRha3RmZ1Z4cUJSdjVUUWZFbVlJNkV2d1RVUGtXS3du?=
 =?utf-8?B?ZzBucXFEbFZ0UWtKVlVnZVlPY2pVL3ByUFJVMFNDQ2NHN1VML2Rub014bnd6?=
 =?utf-8?B?dnRpWFAvMVhnS2lzczExSEdjKzYxRzRKanBWRjlYL0hTOWd0ZVIwdEJvQmNt?=
 =?utf-8?B?RXpWU3JEY01jT2hQYTY4K2pabVF6TDdXWUIzdEc0NEVlZ1dBNWlaTEkyVk9z?=
 =?utf-8?Q?woUpz8N7ryOC0tqOW6x49zSy+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEB9E0DCDB3C39489130925B46ACE9B1@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5cf8b4e-ca0d-46ac-0ef3-08da58d3e018
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 07:00:24.7207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TMo0DwBebHAeEgRzmOfoDP5oQ5sMzFm17g+9Q0aqOFugBfMjMBQ9ajaGk9Cb5Rz4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1453
X-Proofpoint-GUID: QwDml0A7mqXsp6_DrMCQw3q4qpdHCYLX
X-Proofpoint-ORIG-GUID: QwDml0A7mqXsp6_DrMCQw3q4qpdHCYLX
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_09,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=7178e17cfc=pdel@fb.com; helo=mx0a-00082601.pphosted.com
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

DQoNCj4gT24gSnVuIDI3LCAyMDIyLCBhdCAxMTo1MCBQTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNs
Z0BrYW9kLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiA2LzI3LzIyIDIxOjU1LCBQZXRlciBEZWxldm9y
eWFzIHdyb3RlOg0KPj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgRGVsZXZvcnlhcyA8cGRlbEBmYi5j
b20+DQo+IA0KPiANCj4gc29tZSBpbnRybyA/DQoNCldpbGwgZG8uDQoNCj4gDQo+PiAtLS0NCj4+
ICBody9taXNjL2ZieTM1X2NwbGQuYyB8IDEzNyArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+PiAgaHcvbWlzYy9tZXNvbi5idWlsZCAgfCAgIDMgKy0NCj4+ICAy
IGZpbGVzIGNoYW5nZWQsIDEzOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+PiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGh3L21pc2MvZmJ5MzVfY3BsZC5jDQo+PiBkaWZmIC0tZ2l0IGEvaHcv
bWlzYy9mYnkzNV9jcGxkLmMgYi9ody9taXNjL2ZieTM1X2NwbGQuYw0KPj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAuLmE3ODNhMGEyYzgNCj4+IC0tLSAvZGV2L251
bGwNCj4+ICsrKyBiL2h3L21pc2MvZmJ5MzVfY3BsZC5jDQo+PiBAQCAtMCwwICsxLDEzNyBAQA0K
Pj4gKy8qDQo+PiArICogQ29weXJpZ2h0IChjKSBNZXRhIFBsYXRmb3JtcywgSW5jLiBhbmQgYWZm
aWxpYXRlcy4gKGh0dHA6Ly93d3cubWV0YS5jb20pDQo+PiArICoNCj4+ICsgKiBQZXJtaXNzaW9u
IGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5p
bmcgYSBjb3B5DQo+PiArICogb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVu
dGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwNCj4+ICsgKiBpbiB0aGUgU29m
dHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0
aGUgcmlnaHRzDQo+PiArICogdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBk
aXN0cmlidXRlLCBzdWJsaWNlbnNlLCBhbmQvb3Igc2VsbA0KPj4gKyAqIGNvcGllcyBvZiB0aGUg
U29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZSBTb2Z0d2FyZSBpcw0K
Pj4gKyAqIGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRp
dGlvbnM6DQo+PiArICoNCj4+ICsgKiBUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhp
cyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbg0KPj4gKyAqIGFsbCBjb3Bp
ZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLg0KPj4gKyAqDQo+PiAr
ICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0Yg
QU5ZIEtJTkQsIEVYUFJFU1MgT1INCj4+ICsgKiBJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBM
SU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwNCj4+ICsgKiBGSVRO
RVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiBJTiBOTyBF
VkVOVCBTSEFMTA0KPj4gKyAqIFRIRSBBVVRIT1JTIE9SIENPUFlSSUdIVCBIT0xERVJTIEJFIExJ
QUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SIE9USEVSDQo+PiArICogTElBQklMSVRZLCBX
SEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJ
TkcgRlJPTSwNCj4+ICsgKiBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FS
RSBPUiBUSEUgVVNFIE9SIE9USEVSIERFQUxJTkdTIElODQo+PiArICogVEhFIFNPRlRXQVJFLg0K
Pj4gKyAqLw0KPiANCj4gSSBwcmVmZXIgdGhlIHNob3J0IHZlcnNpb24gb2YgdGhlIGxpY2Vuc2Uu
DQoNCk9oLCB5ZXMsIEkgY2FuIHNlZSBpZiBJIGNhbiByZWR1Y2UgdGhpcy4gVG8gYmUgaG9uZXN0
IEkgd2FzIGNvcHlpbmcgdGhpcw0KZnJvbSBvdXIgbGVnYWwgd2lraSwgYW5kIEnigJltIG5vdCB0
aGF0IGZhbWlsaWFyIHdpdGggbGljZW5zaW5nIG9yIHdoYXQNCnNob3J0ZW5pbmcgaXQgaW1wbGll
cywgYnV0IEkgY2FuIGxvb2sgaW50byB0aGF0Lg0KDQo+IA0KPj4gKyNpbmNsdWRlICJxZW11L29z
ZGVwLmgiDQo+PiArI2luY2x1ZGUgImh3L2kyYy9pMmMuaCINCj4+ICsjaW5jbHVkZSAiaHcvcmVn
aXN0ZXJmaWVsZHMuaCINCj4+ICsNCj4+ICsjZGVmaW5lIEJPQVJEX0lEX0NMQVNTMSAwYjAwMDAN
Cj4+ICsjZGVmaW5lIEJPQVJEX0lEX0NMQVNTMiAwYjAwMDENCj4+ICsNCj4+ICsjZGVmaW5lIFRZ
UEVfRkJZMzVfQ1BMRCAiZmJ5MzUtY3BsZCINCj4+ICtPQkpFQ1RfREVDTEFSRV9TSU1QTEVfVFlQ
RShGYnkzNUNwbGRTdGF0ZSwgRkJZMzVfQ1BMRCk7DQo+PiArDQo+PiArUkVHOChDTEFTU19UWVBF
LCAweDUpOw0KPj4gKyAgICBGSUVMRChDTEFTU19UWVBFLCBSRVNFUlZFRCwgMCwgMik7DQo+PiAr
ICAgIEZJRUxEKENMQVNTX1RZUEUsIDFPVV9FWFBBTlNJT05fTk9UX1BSRVNFTlQsIDIsIDEpOw0K
Pj4gKyAgICBGSUVMRChDTEFTU19UWVBFLCAyT1VfRVhQQU5TSU9OX05PVF9QUkVTRU5ULCAzLCAx
KTsNCj4+ICsgICAgRklFTEQoQ0xBU1NfVFlQRSwgQk9BUkRfSUQsIDQsIDQpOw0KPj4gK1JFRzgo
Qk9BUkRfUkVWSVNJT04sIDB4OCk7DQo+PiArICAgIEZJRUxEKEJPQVJEX1JFVklTSU9OLCBWQUxV
RSwgMCwgNCk7DQo+PiArICAgIEZJRUxEKEJPQVJEX1JFVklTSU9OLCBSRVNFUlZFRCwgNCwgNCk7
DQo+PiArDQo+PiArc3RydWN0IEZieTM1Q3BsZFN0YXRlIHsNCj4+ICsgICAgSTJDU2xhdmUgcGFy
ZW50X29iajsNCj4+ICsNCj4+ICsgICAgdWludDhfdCB0YXJnZXRfcmVnOw0KPj4gKyAgICB1aW50
MzJfdCByZWdzWzEwXTsNCj4+ICt9Ow0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIGZieTM1X2NwbGRf
cmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApDQo+PiArew0KPj4gKyAgICBG
YnkzNUNwbGRTdGF0ZSAqcyA9IEZCWTM1X0NQTEQoZGV2KTsNCj4+ICsNCj4+ICsgICAgbWVtc2V0
KHMtPnJlZ3MsIDAsIHNpemVvZihzLT5yZWdzKSk7DQo+PiArICAgIHMtPnRhcmdldF9yZWcgPSAw
Ow0KPj4gKw0KPj4gKyAgICBBUlJBWV9GSUVMRF9EUDMyKHMtPnJlZ3MsIENMQVNTX1RZUEUsIEJP
QVJEX0lELCAwYjAwMDApOw0KPj4gKyAgICBBUlJBWV9GSUVMRF9EUDMyKHMtPnJlZ3MsIENMQVNT
X1RZUEUsIDFPVV9FWFBBTlNJT05fTk9UX1BSRVNFTlQsIDEpOw0KPj4gKyAgICBBUlJBWV9GSUVM
RF9EUDMyKHMtPnJlZ3MsIENMQVNTX1RZUEUsIDJPVV9FWFBBTlNJT05fTk9UX1BSRVNFTlQsIDEp
Ow0KPj4gKyAgICBBUlJBWV9GSUVMRF9EUDMyKHMtPnJlZ3MsIEJPQVJEX1JFVklTSU9OLCBWQUxV
RSwgMHgxKTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGludCBmYnkzNV9jcGxkX2kyY19ldmVu
dChJMkNTbGF2ZSAqaTJjLCBlbnVtIGkyY19ldmVudCBldmVudCkNCj4+ICt7DQo+PiArICAgIEZi
eTM1Q3BsZFN0YXRlICpzID0gRkJZMzVfQ1BMRChpMmMpOw0KPj4gKw0KPj4gKyAgICBzd2l0Y2gg
KGV2ZW50KSB7DQo+PiArICAgIGNhc2UgSTJDX1NUQVJUX1JFQ1Y6DQo+PiArICAgICAgICBicmVh
azsNCj4+ICsgICAgY2FzZSBJMkNfU1RBUlRfU0VORDoNCj4+ICsgICAgICAgIHMtPnRhcmdldF9y
ZWcgPSAwOw0KPj4gKyAgICAgICAgYnJlYWs7DQo+PiArICAgIGNhc2UgSTJDX1NUQVJUX1NFTkRf
QVNZTkM6DQo+PiArICAgIGNhc2UgSTJDX0ZJTklTSDoNCj4+ICsgICAgY2FzZSBJMkNfTkFDSzoN
Cj4+ICsgICAgICAgIGJyZWFrOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIHJldHVybiAwOw0K
Pj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdWludDhfdCBmYnkzNV9jcGxkX2kyY19yZWN2KEkyQ1Ns
YXZlICppMmMpDQo+PiArew0KPj4gKyAgICBGYnkzNUNwbGRTdGF0ZSAqcyA9IEZCWTM1X0NQTEQo
aTJjKTsNCj4+ICsNCj4+ICsgICAgc3dpdGNoIChzLT50YXJnZXRfcmVnKSB7DQo+PiArICAgIGNh
c2UgUl9DTEFTU19UWVBFOg0KPj4gKyAgICBjYXNlIFJfQk9BUkRfUkVWSVNJT046DQo+PiArICAg
ICAgICByZXR1cm4gcy0+cmVnc1tzLT50YXJnZXRfcmVnXTsNCj4+ICsgICAgZGVmYXVsdDoNCj4+
ICsgICAgICAgIHByaW50ZigiJXM6IHVuZXhwZWN0ZWQgcmVnaXN0ZXIgcmVhZCAweCUwMnhcbiIs
IF9fZnVuY19fLCBzLT50YXJnZXRfcmVnKTsNCj4gDQo+IHBsZWFzZSB1c2UgdGhlICBxZW11IGxv
Z2dpbmcgc3lzdGVtDQoNClllcywgc29ycnkgYWJvdXQgdGhhdCwgSeKAmWxsIGZpeCB0aGlzLiBJ
biB0aGUgZnV0dXJlIEnigJlsbCBwcm9iYWJseQ0KdHJ5IHRvIGp1c3QgdXNlIHFlbXVfbG9nIGZy
b20gdGhlIHN0YXJ0LCB0byBhdm9pZCB0aGVzZS4NCg0KPiANCj4+ICsgICAgICAgIHJldHVybiAw
eGZmOw0KPj4gKyAgICB9DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbnQgZmJ5MzVfY3BsZF9p
MmNfc2VuZChJMkNTbGF2ZSAqaTJjLCB1aW50OF90IGRhdGEpDQo+PiArew0KPj4gKyAgICBGYnkz
NUNwbGRTdGF0ZSAqcyA9IEZCWTM1X0NQTEQoaTJjKTsNCj4+ICsNCj4+ICsgICAgaWYgKHMtPnRh
cmdldF9yZWcgPT0gMCkgew0KPj4gKyAgICAgICAgcy0+dGFyZ2V0X3JlZyA9IGRhdGE7DQo+PiAr
ICAgICAgICByZXR1cm4gMDsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBzd2l0Y2ggKHMtPnRh
cmdldF9yZWcpIHsNCj4+ICsgICAgY2FzZSBSX0NMQVNTX1RZUEU6DQo+PiArICAgIGNhc2UgUl9C
T0FSRF9SRVZJU0lPTjoNCj4+ICsgICAgICAgIHMtPnJlZ3Nbcy0+dGFyZ2V0X3JlZ10gPSBkYXRh
Ow0KPj4gKyAgICAgICAgYnJlYWs7DQo+PiArICAgIGRlZmF1bHQ6DQo+PiArICAgICAgICBwcmlu
dGYoIiVzOiB1bmV4cGVjdGVkIHJlZ2lzdGVyIHdyaXRlIDB4JTAyeCAweCUwMnhcbiIsIF9fZnVu
Y19fLCBzLT50YXJnZXRfcmVnLCBkYXRhKTsNCj4+ICsgICAgICAgIGJyZWFrOw0KPj4gKyAgICB9
DQo+PiArDQo+PiArICAgIHJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBm
YnkzNV9jcGxkX2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKm9jLCB2b2lkICpkYXRhKQ0KPj4gK3sN
Cj4+ICsgICAgRGV2aWNlQ2xhc3MgKmRjID0gREVWSUNFX0NMQVNTKG9jKTsNCj4+ICsgICAgSTJD
U2xhdmVDbGFzcyAqaTJjID0gSTJDX1NMQVZFX0NMQVNTKG9jKTsNCj4+ICsNCj4+ICsgICAgZGMt
PnJlYWxpemUgPSBmYnkzNV9jcGxkX3JlYWxpemU7DQo+PiArICAgIGkyYy0+ZXZlbnQgPSBmYnkz
NV9jcGxkX2kyY19ldmVudDsNCj4+ICsgICAgaTJjLT5yZWN2ID0gZmJ5MzVfY3BsZF9pMmNfcmVj
djsNCj4+ICsgICAgaTJjLT5zZW5kID0gZmJ5MzVfY3BsZF9pMmNfc2VuZDsNCj4+ICt9DQo+PiAr
DQo+PiArc3RhdGljIGNvbnN0IFR5cGVJbmZvIHR5cGVzW10gPSB7DQo+PiArICAgIHsNCj4+ICsg
ICAgICAgIC5uYW1lID0gVFlQRV9GQlkzNV9DUExELA0KPj4gKyAgICAgICAgLnBhcmVudCA9IFRZ
UEVfSTJDX1NMQVZFLA0KPj4gKyAgICAgICAgLmluc3RhbmNlX3NpemUgPSBzaXplb2YoRmJ5MzVD
cGxkU3RhdGUpLA0KPj4gKyAgICAgICAgLmNsYXNzX2luaXQgPSBmYnkzNV9jcGxkX2NsYXNzX2lu
aXQsDQo+PiArICAgIH0sDQo+PiArfTsNCj4+ICsNCj4+ICtERUZJTkVfVFlQRVModHlwZXMpOw0K
Pj4gZGlmZiAtLWdpdCBhL2h3L21pc2MvbWVzb24uYnVpbGQgYi9ody9taXNjL21lc29uLmJ1aWxk
DQo+PiBpbmRleCA5NTI2OGVkZGMwLi4xZWRhZDQ0YjZiIDEwMDY0NA0KPj4gLS0tIGEvaHcvbWlz
Yy9tZXNvbi5idWlsZA0KPj4gKysrIGIvaHcvbWlzYy9tZXNvbi5idWlsZA0KPj4gQEAgLTExNyw3
ICsxMTcsOCBAQCBzb2Z0bW11X3NzLmFkZCh3aGVuOiAnQ09ORklHX0FTUEVFRF9TT0MnLCBpZl90
cnVlOiBmaWxlcygNCj4+ICAgICdhc3BlZWRfc2JjLmMnLA0KPj4gICAgJ2FzcGVlZF9zZG1jLmMn
LA0KPj4gICAgJ2FzcGVlZF94ZG1hLmMnLA0KPj4gLSAgJ2FzcGVlZF9wZWNpLmMnKSkNCj4+ICsg
ICdhc3BlZWRfcGVjaS5jJywNCj4+ICsgICdmYnkzNV9jcGxkLmMnKSkNCj4+ICAgIHNvZnRtbXVf
c3MuYWRkKHdoZW46ICdDT05GSUdfTVNGMicsIGlmX3RydWU6IGZpbGVzKCdtc2YyLXN5c3JlZy5j
JykpDQo+PiAgc29mdG1tdV9zcy5hZGQod2hlbjogJ0NPTkZJR19OUkY1MV9TT0MnLCBpZl90cnVl
OiBmaWxlcygnbnJmNTFfcm5nLmMnKSkNCj4gDQoNCg==

