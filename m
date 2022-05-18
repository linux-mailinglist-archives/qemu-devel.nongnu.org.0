Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB1052BDB0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 17:14:48 +0200 (CEST)
Received: from localhost ([::1]:50366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrLNv-0005m6-5G
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 11:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6137400755=pdel@fb.com>)
 id 1nrLIN-0001GG-8V; Wed, 18 May 2022 11:09:03 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:7460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6137400755=pdel@fb.com>)
 id 1nrLIK-00020G-UM; Wed, 18 May 2022 11:09:02 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24I9jA7s032083;
 Wed, 18 May 2022 08:08:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=yP/my+CNe7knHJz20JqkHjM2Wb1J2UGPqJh1GpOA8sw=;
 b=JyKFtX4MZNV+TL8yGKPYpqVjfmCdudcwyDrvhXZ5UPqP60iiXW/YTPD0/rzisz1OCE/l
 cEzAdUXPoEgAWn6fL1MtSmGRtDt7XQi0V0y0FIXKrPJyJI2y22/PbyGq2b5XuAT/ko76
 cC72D88JMy+uxG4mXc0762TnTK+TslXWM+4= 
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2046.outbound.protection.outlook.com [104.47.51.46])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3g4ck0gq3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 08:08:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xtcr1vQB2AjBLOjoOcBLCd98I9+pbFaRNJGbY7exdwgUcD1idlIs6ZWfMMyzKH29mR1J8tJIWmTjaLIbAjphY5XNBdk+Y8N8oUc5J4oIh/6qKI4+ixaoQ839OAsQZA50r5X7YGuIWJ6bn6VUjKSLNaka7Tvyt7BGcZpYHoHy0yQO/vzeMEiNjROvBgJso+CHL51woKCXf84mzcoFRTPehKa3ip07kaV9c99TN5Fac0hyPpU85yoem6okzvUsJi4CJ3hzV1idC1nq9sZsGT9SVDyE0IQMs/laVXSLKZekhef06XYFfiGASzyJTkIijGwq42qJurB30fbkqvgM0y1r7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yP/my+CNe7knHJz20JqkHjM2Wb1J2UGPqJh1GpOA8sw=;
 b=RlLP6sPlH4/vzP6yFpQwobEMwAi35/CJ9VUJljFz9ixkGoFAcb2skf7tkFaBH5opSvJ8x3kIM24y1UTFn0WtYZkwQqGC0krMOayiDWEg1KkrgdF7j4003U09h4RAEMllRhZA19cqdsrs8ra59DgOV8GybOi9cnnY5g8Wydy93tKfeNvVQCDeXPGROL/T/hmNj0Y9s3/ftNnCgcl5Fw5KF3PmosvBuFsZpOqQ+Vn8YaC2d645/lZEqVYNupiFZ5mLCkO893dLg0tV4Cc2CTdKUk9/zC9UaYEeuy06N+a5lOcNH+/c9O6QAsrHCYRFs5QjWKd639Rg9FrdoNjcgOrOvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BYAPR15MB3448.namprd15.prod.outlook.com (2603:10b6:a03:103::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Wed, 18 May
 2022 15:08:48 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb%5]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 15:08:48 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "clg@kaod.org" <clg@kaod.org>, "andrew@aj.id.au"
 <andrew@aj.id.au>, Peter Delevoryas <pdel@fb.com>, "rashmica.g@gmail.com"
 <rashmica.g@gmail.com>
Subject: Re: [PATCH] hw/gpio/aspeed_gpio: Fix QOM pin property
Thread-Topic: [PATCH] hw/gpio/aspeed_gpio: Fix QOM pin property
Thread-Index: AQHYXfvi7TaWOBdaX0Szd5g0vhERsK0kVn+AgAB/49I=
Date: Wed, 18 May 2022 15:08:48 +0000
Message-ID: <88DECE40-4D4A-462E-B96B-A6FF8BF67EA8@fb.com>
References: <20220502080827.244815-1-pdel@fb.com>
 <09776fe6d855338ace01e57dc780c107b8f635bf.camel@linux.ibm.com>
In-Reply-To: <09776fe6d855338ace01e57dc780c107b8f635bf.camel@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ab9269a-7f17-4d93-417b-08da38e04f80
x-ms-traffictypediagnostic: BYAPR15MB3448:EE_
x-microsoft-antispam-prvs: <BYAPR15MB344886A99B9EC56B2751E6E7ACD19@BYAPR15MB3448.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C3maKEmJR6c7MLz/EtQje73/t81TloieyK3e2wbWz5zirniIAW3BkA1HgLn+GLfxNN/VgAdv5hAB00IAExLs9/fZS/+SRWYVEm+FmV2tHGnA0j1E248CGcrdHL3tvvUgj10l02oJzRgF0SsEKkFcVLjkh0KIxtf+rX7+cWoJ5RX8vKq5KJZVTtLxbiNP91Ovp1LYJBoAZzA6jPCRr/uvK4bVYmdH4aiqoyk8ZTROi4Y4fmqIptZx7NHYdR2q1SvX1iNBKCrLzKgVKB6g4L4s+U81YRGFit2jUNp6zntqiZ3GHHCRCmYV++gcZtDWSX9+KPiFEN5eA8hP79JZ8ruc+0bjjSehJd6fSfLdKziCPuczLRwfDtc90Q2pZw9bXhAsp7PqClnTYIXFDaLxJ6zF/4Dg6Hysy32Jm+SL4vrbvg8Ua5Q7naXbO6/2lz3kf5al9v68+pVUmupQwP8yx4GMXcz/LjyNS2mUZzKzZ7G6rIjNSLrVrOPpkF/Dx6IaFocUjAaaPJ/dv1Ea7BKH5qcqoF7hA8M1jxpZ4Mpl8GifKe0/AH5LprqqOqS0Ed9/EOa6CMt3mgcjTmpfRmU6Dvi8G+x2KyG5HL9h9Zdm5WiOOtYpla2AuXy9OvZv6potQzHKKTBuEEGprvKOt45deCo1IuvuwpussvpFHOYcsZhvK2dhcDfPSnJmKrY2+kUi0uX74SKpFWuCMIZnUCBxhKfjBrRaJmceyYqaeRUvlAA8Adwck2WYLO4oejBEXsvnJB6c
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(53546011)(83380400001)(54906003)(66946007)(186003)(71200400001)(6506007)(76116006)(66556008)(66446008)(64756008)(26005)(8936002)(508600001)(33656002)(38070700005)(5660300002)(122000001)(316002)(36756003)(66476007)(2616005)(6486002)(38100700002)(86362001)(4326008)(8676002)(109986005)(2906002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHhVbUZYVVloOUZBUjRINTNHbDNOS2IwelNseXIxZ0FBTGpBQmx1c0RtMXYw?=
 =?utf-8?B?YjBMZlhGMFJyaUxBUVE5Z1ZFeEE4SythTHFKQVk1L2ZEbWpGVXZhUmpUWEM5?=
 =?utf-8?B?Ump4UnZlVHpiU1pwZU9MU1h3RG9LZjZCWTlPK0wzczNqVjhDZzhOZm1yMFpi?=
 =?utf-8?B?QTR1bjZ0OHB4NUNoV01tOElTK2diSW16aWpDUzE4RVhjL3JwZU1lNTczUVRS?=
 =?utf-8?B?ei9XSU85V041eFdkTUhScFQzV0J0MmpyUHl3SlpEZTlsdVdRUFFyYlJpQUgw?=
 =?utf-8?B?OFhmZVFHdGpBY3N4OFNWeVVFS1l6TnJveDM1R0pKeXNhclFvakVFSTNxNk9E?=
 =?utf-8?B?Qk1MNDJFM1dCK1cxVDZXUmVzTzc1Rm1Qa2pud0JXdXZlWXlVSU5VNjFGT0c0?=
 =?utf-8?B?aGk3TDlhWkl5S0lhL0M1RjdmUzJ2eUo1WTRBUU4zdnczcnd6aEkvOWRxR0lK?=
 =?utf-8?B?ejAxM0F0NWIyd3BGcW85RFlYNUlnQnpFZEo0NFlkL2VkdkYySWltQ0hCUjNE?=
 =?utf-8?B?SFkzLzlmckpoUkJIbUFnM00vQk5ZOG91SUtwL3dyTlNDajJIYWpJeEIrY1h3?=
 =?utf-8?B?dTlKTTFLNFNOSTdRSE41MUp1b3ptWjN4R2hWZjNHQkJMeEZsdEM2VDRKS0hO?=
 =?utf-8?B?R1BtOG1URWc4L05nbEo2cTA5cWorc0pCZUN3QmY3QWcyZTdKUEgvVWNPUWhw?=
 =?utf-8?B?T2dtZGhIY1N1YzR0Vk4rdmtxL2hDRFlZdDVrb0tMRHdFRzlQMzZrRTI5bllD?=
 =?utf-8?B?NmNqS2pBS1NhRnZVYkRIc0F0UUV2Q3lCSjBIQlVmZUJHQU52QzlTNGYrS1dN?=
 =?utf-8?B?OEswZlA5OFZpWm5FdnVXMTVHWFNXaWhUMFRlRFdvVTUrYzdkc2pHald0bXVt?=
 =?utf-8?B?MGVZYVNJZjNaSUlLSDI3T3RFdHd5bmxzc3lKYXQ3dG1sWGFMUW5qbG9NbzY1?=
 =?utf-8?B?TUNDVlAwNVZYRGg4MFBZZFE4dGZFcVYyMy9NYktCQVFWUkhPaExyOVQrUVU2?=
 =?utf-8?B?UXRTK29EeEJ6Q0ZyYzNRREtQOWN3NFBBbThhRGZOQktRRGJLcFZlQ1hGdG5h?=
 =?utf-8?B?c3Y1K3pZQTE2TlV6dHhtS3p4R0RiYXBQeVhFUGdoK0VLRnVyeTh3OENjNEdT?=
 =?utf-8?B?T2ZTWFZrMEY4NzhIOFR5M2p2dWRXWDBwbjhZUGFNWG5IV0M0OHhwTVZRRnNL?=
 =?utf-8?B?L01GeUZMY3oyRVJVa3ZsR21CZ2huYU10Umo4bUk3b2xKRmFuYmtRWTZBejdV?=
 =?utf-8?B?SUdOaXE1ZkdOWkdlaHZ3UkFTc0xKU1VlZ2swRG9zTzhVRFhvSldMelE1NCtE?=
 =?utf-8?B?anRvYTBZZk1Fd0RnQ1lLbGk4TXRyeG1iZWZZNGdwVytoT29IOW8vaTdsbWYr?=
 =?utf-8?B?bVlBcjMraUVwYU5jZnZRK3pQRHpCT2RPRUhnZGNKMVhlMitSZTBrQ1M0NFpy?=
 =?utf-8?B?dldUUGk2eVVjdkx4dU9HM09JT0owYSs4cmtzZDNGWlcycHQ5czAwREViQ2FW?=
 =?utf-8?B?UG95WklGM0x2WENEaGpIZTJCdHFlV0U4ZWowRjRwdjFmZmZBSlZZdVdCQXRP?=
 =?utf-8?B?dkJEajZIUzBIV3VYL3ZBaFNOR0xrVWZKVVZQMlJiKzZsVlhZQ2hhYkk4OG5m?=
 =?utf-8?B?d0hmeURlSE5VajlTSVg2STV1cStJNWs3VlppZktqZ3g3NWNEMVhQMi9HYVFY?=
 =?utf-8?B?bDhOVEFlZERGaFVDdWVWbUloQkpmUHBuVUoxNll3Q2VqaUZBelFPbnhiaGF0?=
 =?utf-8?B?N0pLb1Z6azdmYURkY1BuSmdZS3hKQS9ZSFFva010RGNLdkNhaExVdktIQzFl?=
 =?utf-8?B?Ull4Ty9IOUplcjBlb0xoMjUyeHBkUTRmcDBkUThDZk5qSE5neVU5dnZKMVoy?=
 =?utf-8?B?RGxmZnhaako3VlFzZlVyeTJMWG5RaFk5ZDJMTmFmQjRzT3l1eEt2ZXh4eDRr?=
 =?utf-8?B?TGFjSHR3NVZJaHh0dDIrejdGeXEyUnBiUFJ6ZmhMeU81UTNidWdRNXRoT2ZZ?=
 =?utf-8?B?M2FRaEhoYlZteFQweEFqWW1MZjdDR2g1ZnJ5OCtXdUw0TUZ2MkNaV01leDk1?=
 =?utf-8?B?alhuUGNOMnY5SmZDcVM5N0QxdFRFYXB2T2FmcFFDRkIxZVBzODUxY1FYM3RT?=
 =?utf-8?B?TnRsdDZ4ZDZGNUgvaCtMT1VJenFOMXk3TjE3ZVRKM1JpbnY2SndJTGpUWmUw?=
 =?utf-8?B?S1lYbUhSZFlrUm56UlBqUElxL1Eyamh1MERRT04zMmhFRTB1U1AyR2pwTEhv?=
 =?utf-8?B?a3dMaGFhKzlWT3N5UDc3RU9VSmRacXdJYUZ1WWVmMWJxZk8zQkh2STBaVDRL?=
 =?utf-8?Q?Watti8L2bUXGUWmTih?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab9269a-7f17-4d93-417b-08da38e04f80
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 15:08:48.3825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iwH1MXK9VewmYrNXhnNi5rN7HETnTWAjm8kJzituLlfLtsM3BNqkZQRProsK732G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3448
X-Proofpoint-GUID: 7uHBXB6CzPzNFhHYxA2xY5yFyi_2mrzm
X-Proofpoint-ORIG-GUID: 7uHBXB6CzPzNFhHYxA2xY5yFyi_2mrzm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_05,2022-05-17_02,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=6137400755=pdel@fb.com; helo=mx0a-00082601.pphosted.com
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

DQoNCj4gT24gTWF5IDE4LCAyMDIyLCBhdCAxMjozMSBBTSwgUmFzaG1pY2EgR3VwdGEgPHJhc2ht
aWNhQGxpbnV4LmlibS5jb20+IHdyb3RlOg0KPiANCj4g77u/T24gTW9uLCAyMDIyLTA1LTAyIGF0
IDAxOjA4IC0wNzAwLCBQZXRlciBEZWxldm9yeWFzIHdyb3RlOg0KPj4gSSB3YXMgc2V0dGluZyBn
cGlvVjQtNyB0byAiMTExMCIgdXNpbmcgdGhlIFFPTSBwaW4gcHJvcGVydHkgaGFuZGxlcg0KPj4g
YW5kDQo+PiBub3RpY2VkIHRoYXQgbG93ZXJpbmcgZ3Bpb1Y3IHdhcyBpbmFkdmVydGVudGx5IGxv
d2VyaW5nIGdwaW9WNC02IHRvby4NCj4+IA0KPj4gICAgIChxZW11KSBxb20tc2V0IC9tYWNoaW5l
L3NvYy9ncGlvIGdwaW9WNCB0cnVlDQo+PiAgICAgKHFlbXUpIHFvbS1zZXQgL21hY2hpbmUvc29j
L2dwaW8gZ3Bpb1Y1IHRydWUNCj4+ICAgICAocWVtdSkgcW9tLXNldCAvbWFjaGluZS9zb2MvZ3Bp
byBncGlvVjYgdHJ1ZQ0KPj4gICAgIChxZW11KSBxb20tZ2V0IC9tYWNoaW5lL3NvYy9ncGlvIGdw
aW9WNA0KPj4gICAgIHRydWUNCj4+ICAgICAocWVtdSkgcW9tLXNldCAvbWFjaGluZS9zb2MvZ3Bp
byBncGlvVjcgZmFsc2UNCj4+ICAgICAocWVtdSkgcW9tLWdldCAvbWFjaGluZS9zb2MvZ3BpbyBn
cGlvVjQNCj4+ICAgICBmYWxzZQ0KPj4gDQo+PiBBbiBleHByZXNzaW9uIGluIGFzcGVlZF9ncGlv
X3NldF9waW5fbGV2ZWwgd2FzIHVzaW5nIGEgbG9naWNhbCBOT1QNCj4+IG9wZXJhdG9yIGluc3Rl
YWQgb2YgYSBiaXR3aXNlIE5PVCBvcGVyYXRvcjoNCj4+IA0KPj4gICAgIHZhbHVlICY9ICFwaW5f
bWFzazsNCj4+IA0KPj4gVGhlIG9yaWdpbmFsIGF1dGhvciBwcm9iYWJseSBpbnRlbmRlZCB0byBt
YWtlIGEgYml0d2lzZSBOT1QNCj4+IGV4cHJlc3Npb24NCj4+ICJ+IiwgYnV0IG1pc3Rha2VubHkg
dXNlZCBhIGxvZ2ljYWwgTk9UIG9wZXJhdG9yICIhIiBpbnN0ZWFkLiBTb21lDQo+PiBwcm9ncmFt
bWluZyBsYW5ndWFnZXMgbGlrZSBSdXN0IHVzZSAiISIgZm9yIGJvdGggcHVycG9zZXMuDQo+PiAN
Cj4+IEZpeGVzOiA0YjdmOTU2ODYyZGMgKCJody9ncGlvOiBBZGQgYmFzaWMgQXNwZWVkIEdQSU8g
bW9kZWwgZm9yDQo+PiBBU1QyNDAwIGFuZA0KPj4gQVNUMjUwMCIpDQo+PiBTaWduZWQtb2ZmLWJ5
OiBQZXRlciBEZWxldm9yeWFzIDxwZGVsQGZiLmNvbT4NCj4gDQo+IA0KPiBPb3BzISBUaGFua3Mg
Zm9yIGNhdGNoaW5nIHRoaXMuIFRoZSB0ZXN0cyBsb29rIGdvb2QuDQoNClRoYW5rcyENCg0KPiAN
Cj4gDQo=

