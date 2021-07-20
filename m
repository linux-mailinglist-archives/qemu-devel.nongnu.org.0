Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988E63CFEFC
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 18:13:59 +0200 (CEST)
Received: from localhost ([::1]:54608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5sNa-0002qb-N4
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 12:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1m5sMK-0002Az-8Z
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 12:12:40 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:16472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1m5sMH-0000XL-3M
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 12:12:39 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KGCBOM013948; Tue, 20 Jul 2021 09:12:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=GPnTLHHYGpdImrjDSnxqjE4N2Dr1iG+E7xmITMOzY+4=;
 b=o+kIeU72aufQyvmCaUNMBCDFBrZqlfH5sGhV90/dBF6OWc12REFDkqcTnUtjhHhlUq3c
 0aZxuvtTzXpJyaHDixthupViaEsW14lbJmV9ii+6I+sTX5FPhvAtN3Q+7iD8aQVl2eYY
 cAhv79GgRd/2ZbX9zRhcvfRdh0KleSbP/bp8KsuOilqs7eSHerun0rgBBE7LPTdrIGuJ
 Kn8mcxmkEe4trBKDuJC8dkXTpPZqqvKDJX6CZJ+ul2RWte1Y8ZyCQDljEPSw5YgqPkEI
 mYE7xjOlOIxCvZQEd0JeGdD85Z5zpxIPNwc9LY8b96T/fySmtJtltrY3MVXZUpKuWYTr Ag== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by mx0a-002c1b01.pphosted.com with ESMTP id 39w4j4bf4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 09:12:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0w1cEitUMwc95r+s5xB3u6LNol2l/3oWtUMaHqddD2uGuxeeWBLRwqMuGa3hTJQOzYHedOm08ghuejCUOUyH5bthfaYivCVxQG1tEh7mVEH5qbXRSbM2QT8uUPrZvNmR1A0VNPoBjdGPNDZFhbXnNmTv34hG7rUf1xsRPeiwI56X703Mj6OI8rA+99D2D8nHF/kv/cNgWEhfgVW78ngpL70/XYgu5Q1atHuLI5/KDiPSacbyRsy23BCUd7rexwc3JviPOTTfFa4TBaBJRvRqOKygaxtiIFWBhBY9HocCZ1MFKY2XixwTRr3UNtEuYHfktc3Fqs6u6PH4qCIKNh3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPnTLHHYGpdImrjDSnxqjE4N2Dr1iG+E7xmITMOzY+4=;
 b=ViR62UO0sBeyyEnpxRy9+ZY70p1cXvKxQWgM91uVUx3UqrSrG0DT526lb61jCP95zyKyUIbx8U0sgz78OXFoH+gS14LOVC6XZWte3uIK5ykEVqFSRLahh40+zQ92MGfyC1mTkItge4p+5RFpxewrkObu6r8yfdA0DgGekR/y2MEulOrGlEQHEA0iGOombV+jQRHwstfd3YLInz4TsYkxCIhO9VAETvfSylcDVYIoWjgigN4FpvrINJ/865PkjgKYm6YMInu+Arf2DX5B0fZMrb3NSnohiTT5uqrsRUiSJkCq/GHOyItUO+1FMhgVC1sa/stbtyw8ZDbT+AUwwr4Oxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from CH0PR02MB7898.namprd02.prod.outlook.com (2603:10b6:610:113::5)
 by CH2PR02MB6998.namprd02.prod.outlook.com (2603:10b6:610:88::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 16:12:30 +0000
Received: from CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::3167:f3a5:5f8c:284b]) by CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::3167:f3a5:5f8c:284b%9]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 16:12:30 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: Jagannathan Raman <jag.raman@oracle.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH RFC server 11/11] vfio-user: acceptance test
Thread-Topic: [PATCH RFC server 11/11] vfio-user: acceptance test
Thread-Index: AQHXfNjCEMdgT5vHhUeudYMttWzzbatMCUpw
Date: Tue, 20 Jul 2021 16:12:30 +0000
Message-ID: <CH0PR02MB78983837D0170905FE6F19428BE29@CH0PR02MB7898.namprd02.prod.outlook.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cover.1626722742.git.jag.raman@oracle.com>
 <0ed2315f59965380ffbbfb01556e18075fc654b2.1626722742.git.jag.raman@oracle.com>
In-Reply-To: <0ed2315f59965380ffbbfb01556e18075fc654b2.1626722742.git.jag.raman@oracle.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dcaf0094-245b-4951-5747-08d94b992cf3
x-ms-traffictypediagnostic: CH2PR02MB6998:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR02MB6998748D21DE0E745204F9288BE29@CH2PR02MB6998.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:336;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zt9UzCwzChRlXtAHG+sGEpdzi4yyGQHO0c5OeCKkULn+6IOXNmYxUkDBdaARhUuOFYNjFYk9GZHJUdK+dDTjrn7lj+zI2DzmyCQmFpHjMq2ic0BcJ5zWcF0uQB5B56GluKx5maX7hWVAK4+OTLo3Fprq2M9cnLQaAYKEUokLP8jO5VTFMgDpOvYTGDZ3Go4aBzVSQ0+KvZMsrHPSCo6FveBCC4a7VHNCNYdijmK7hhWnw8EI9cPv/H6qR4q0gvIa/0kaGnzbO8haaRUgGdhss1SlwUkiPJ6DS+o1pyUneVp0PTDbkzh4k+eWRUfSKz2DqdhpcMx3XB+4eKF05Sn03QbVuTM+ydU5oOlihAiF7R29nl03bOo3hUgDmXYj7eFh9CPyTGTpFuABoSSPr3oHv4KtMc68ooqIS/gyootUCFSSpdHdW5aIa4A0RJgs6LA3TastgUF2itLtVoboQ8Hgi661O8T8e0AIAq6vyEec5Dxwr2jijU1ooewvQA+z51uqjHAaTM7SS706sCTBBwPGQEKoCtAiBOsrxHeIQ0dLGZvCFdKb7mwEmZk3wpFeXkxzni90UqtOTMc1nRj8wdQK8oh5dmAmDAYkZcaipuZRl2ROcZ3Y38ITHKG45rkmxM6Azdd+EksjjMUsZzyKFnECHFhWtjucKs3CRtBYo2PA1hFonFbzlc9N2wUDgaZHZU33flMA5CJQOndKl/cEVxhh6XY1aqhhRwZWE4oxzHBBGE93q4uN0uZDQAiFyTgMlIT5ewvNQvB9mzee3r7gF9Gzx2rmlOHU/KqbqSoKsGrSCk4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR02MB7898.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(136003)(366004)(39860400002)(4326008)(19627235002)(8676002)(54906003)(9686003)(7696005)(6506007)(26005)(38100700002)(478600001)(33656002)(71200400001)(53546011)(186003)(55016002)(122000001)(110136005)(64756008)(66446008)(66476007)(66556008)(44832011)(66946007)(83380400001)(316002)(8936002)(107886003)(2906002)(76116006)(86362001)(5660300002)(52536014)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bE90NEpsSXJZK0l2U0Q2aVlham9uNGE5cWE2ZEVORUxGRGRFUjBEaUZSbVg2?=
 =?utf-8?B?MEpDdkk3NFVUbTFPd0Z0MDlzZGh3R3ZRTkxLK25DYnIxTHcrTkljMXpFM0JL?=
 =?utf-8?B?a3NybStJdFhIaEFRK2JvZUQxbUdPZ004YmZjRktWZHN3Wmg0cGZGMHM0Qk9I?=
 =?utf-8?B?REdvUW1CMzhhYTN0VUIwaDJxc0dSLzM3aUpJYlEyWVV4THN5YzUvQVZwQVcy?=
 =?utf-8?B?YTN6eFFUeG9oaDRIdnRaZGh5YzdCYVR0RWZoK3BJemVEa05TeDN1Y3FjVjd2?=
 =?utf-8?B?eUczRWJUUVo0U3d2cnBVald6UXNrcTdMK0hCUnNiRFI5elhLaTRHUU1aTHE5?=
 =?utf-8?B?Z09WMFZBcmlJbnNBSjI1TzNhRlBoNXliWDZHZjFmMUphbmdpMkJzTVZaUjBF?=
 =?utf-8?B?dmZ5UWg5VTdwcmhUQ1lkeFhDcmpTSVh5aTEwc2xScmQ0VDdpS1k5UUFQSExB?=
 =?utf-8?B?RzlNZE9BVGhjNkd2S3VpenlvQllQVWVqakF5MlR0bTBrU1JCRlBNMlp6ZExj?=
 =?utf-8?B?MExWRkVyU0tOdWdtYlYxNUc1M0l0RnpyQmtiR2dwRXY1Q2t2UW9rcEJ6dG5s?=
 =?utf-8?B?bmhKaGxlakNzTmZab25QbTh0dCt6UlJOdVNQdEFZcjJwY01CbXZ0UW1OYlVH?=
 =?utf-8?B?VkFSYmU2UDdGSVFya2tNUHJhUU5qQ3RiVHdqaUNURkJtUk9XZnRPdVlWVzJv?=
 =?utf-8?B?YTRkdzFNYk9lOWhrOGlqelVBRVdpaHdMaGhmK3ZsRHhZbDRnSWtQYzVIeWpF?=
 =?utf-8?B?ampIMFBtTjE3K2ZQWHlab05zckRieDJOeHNkNG5UczBJek5CNTVNYzYzNE5E?=
 =?utf-8?B?NW9rUVdRQXdsL0F3ZERZYnVuOGJFdTR1bnVLVU5qMWN6T0pzYWR1ZENkZlha?=
 =?utf-8?B?RVBJVDVTd2F1S2FYUWNublNnbTlBMHVoVnR1cFV4VnNtKy9ERjZZVWJmeTQw?=
 =?utf-8?B?Nnl4THVVcmtyQno5SXZrWCtKY2J6RlM4bjY2QTBtOHdlS0NNZHkwZjA0SEF3?=
 =?utf-8?B?NzhtVDZOZEFVMkpYUExia0YxL2pmYkwweHQ2Ymc3b0pkQ3YzSXY0QWUrUGtI?=
 =?utf-8?B?QmRvbFpXUjU0bVF0dEl4MEcxV1lOWmwzaisrM2hRUkYwaTRISHFCWktNL2cr?=
 =?utf-8?B?ZFJocTFkR2FzN3RXRmFWd2FGOHhlR0prS3lQdWVtbURnc0t2bnpXU3piQnFW?=
 =?utf-8?B?blRob0hIUllUL0lkMG0ycGRDeUVhTktMNnlkMFN4M3VsSk9wY0RhR1FBUmpz?=
 =?utf-8?B?aEkwMjZtTzdyV0JRdmdONHdsNWlRN0JHOTYzRzZweHh3UXdWdEtWazhTdHZF?=
 =?utf-8?B?d1U3LytPb3MxSnQ4Q2lxbWlqOEM0Z1NEKytEQUo4K2VOdVRxVXNINkNCTUZ3?=
 =?utf-8?B?a2xFcnB0RWpHVWdKd01BWnoyQlNDSU9pTnVHQU0wZmVSMG9wUUtDdWdyQWp6?=
 =?utf-8?B?NlJRemswUzZDVzRpWkhuaUpjNys1bVZ6YnZLRkhSejdEajdLY0Vya1piSlQx?=
 =?utf-8?B?RWhYZ1lOcnZabDdhMDVIcGtRRE5yZHVHUjZDbU5pNWl4RWsrakNiTW5EVk4v?=
 =?utf-8?B?YU5CY0crdmZaT3kyOFFJT0EwdnNvSENuSnliRWllMXYxVGlPUXVOeVh3Z3BQ?=
 =?utf-8?B?dEdSNU03SGdzaGRKMVRDemlyM0g2WnJmVVBWMXhIRUNZc2lDVWhnVmFKMURv?=
 =?utf-8?B?WmpiM1pmem13c0ZLSDZNWi9ZQU1nTzUrQ3lydFBGZFh3bWlGR2VQYlVBL3pG?=
 =?utf-8?Q?MyLtK1c/wdkeZW0fV0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7898.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcaf0094-245b-4951-5747-08d94b992cf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 16:12:30.4725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zuq8cX8F8GWxGNafzq1JOUa74ubA+hfhBClUyXENcW9PTVdkjpOhAyeLHlsjFRjUOeSs7tvWFR3h44CuXS/sE6a4HKggyXaE8ZijesuONBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6998
X-Proofpoint-ORIG-GUID: xVARVEYPB9h_L6aA6LRh2EdDGecsbrMP
X-Proofpoint-GUID: xVARVEYPB9h_L6aA6LRh2EdDGecsbrMP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_12:2021-07-19,
 2021-07-20 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "elena.ufimtseva@oracle.com" <elena.ufimtseva@oracle.com>,
 "john.g.johnson@oracle.com" <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>, John Levon <john.levon@nutanix.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFnYW5uYXRoYW4gUmFt
YW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPg0KPiBTZW50OiAxOSBKdWx5IDIwMjEgMjE6MDANCj4g
VG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogc3RlZmFuaGFAcmVkaGF0LmNvbTsgYWxl
eC53aWxsaWFtc29uQHJlZGhhdC5jb207DQo+IGVsZW5hLnVmaW10c2V2YUBvcmFjbGUuY29tOyBK
b2huIExldm9uIDxqb2huLmxldm9uQG51dGFuaXguY29tPjsNCj4gam9obi5nLmpvaG5zb25Ab3Jh
Y2xlLmNvbTsgVGhhbm9zIE1ha2F0b3MNCj4gPHRoYW5vcy5tYWthdG9zQG51dGFuaXguY29tPjsg
U3dhcG5pbCBJbmdsZQ0KPiA8c3dhcG5pbC5pbmdsZUBudXRhbml4LmNvbT47IGphZy5yYW1hbkBv
cmFjbGUuY29tDQo+IFN1YmplY3Q6IFtQQVRDSCBSRkMgc2VydmVyIDExLzExXSB2ZmlvLXVzZXI6
IGFjY2VwdGFuY2UgdGVzdA0KPiANCj4gQWNjZXB0YW5jZSB0ZXN0IGZvciBsaWJ2ZmlvLXVzZXIg
aW4gUUVNVQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogRWxlbmEgVWZpbXRzZXZhIDxlbGVuYS51Zmlt
dHNldmFAb3JhY2xlLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSm9obiBHIEpvaG5zb24gPGpvaG4u
Zy5qb2huc29uQG9yYWNsZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEphZ2FubmF0aGFuIFJhbWFu
IDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4NCj4gLS0tDQo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAg
ICAgICAgICB8ICAxICsNCj4gIHRlc3RzL2FjY2VwdGFuY2UvdmZpby11c2VyLnB5IHwgOTQNCj4g
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCA5NSBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvYWNj
ZXB0YW5jZS92ZmlvLXVzZXIucHkNCj4gDQo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01B
SU5UQUlORVJTDQo+IGluZGV4IDQ2YWI2YjYuLjY0NGJkMzUgMTAwNjQ0DQo+IC0tLSBhL01BSU5U
QUlORVJTDQo+ICsrKyBiL01BSU5UQUlORVJTDQo+IEBAIC0zMzgxLDYgKzMzODEsNyBAQCBGOiBp
bmNsdWRlL2h3L3JlbW90ZS9wcm94eS1tZW1vcnktbGlzdGVuZXIuaA0KPiAgRjogaHcvcmVtb3Rl
L2lvaHViLmMNCj4gIEY6IGluY2x1ZGUvaHcvcmVtb3RlL2lvaHViLmgNCj4gIEY6IGh3L3JlbW90
ZS92ZmlvLXVzZXItb2JqLmMNCj4gK0Y6IHRlc3RzL2FjY2VwdGFuY2UvdmZpby11c2VyLnB5DQo+
IA0KPiAgRUJQRjoNCj4gIE06IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IGRp
ZmYgLS1naXQgYS90ZXN0cy9hY2NlcHRhbmNlL3ZmaW8tdXNlci5weSBiL3Rlc3RzL2FjY2VwdGFu
Y2UvdmZpby11c2VyLnB5DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAu
LmVmMzE4ZDkNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi90ZXN0cy9hY2NlcHRhbmNlL3ZmaW8t
dXNlci5weQ0KPiBAQCAtMCwwICsxLDk0IEBADQo+ICsjIHZmaW8tdXNlciBwcm90b2NvbCBzYW5p
dHkgdGVzdA0KPiArIw0KPiArIyBUaGlzIHdvcmsgaXMgbGljZW5zZWQgdW5kZXIgdGhlIHRlcm1z
IG9mIHRoZSBHTlUgR1BMLCB2ZXJzaW9uIDIgb3INCj4gKyMgbGF0ZXIuICBTZWUgdGhlIENPUFlJ
TkcgZmlsZSBpbiB0aGUgdG9wLWxldmVsIGRpcmVjdG9yeS4NCj4gKw0KPiArDQo+ICtpbXBvcnQg
b3MNCj4gK2ltcG9ydCBzb2NrZXQNCj4gK2ltcG9ydCB1dWlkDQo+ICsNCj4gK2Zyb20gYXZvY2Fk
b19xZW11IGltcG9ydCBUZXN0DQo+ICtmcm9tIGF2b2NhZG9fcWVtdSBpbXBvcnQgd2FpdF9mb3Jf
Y29uc29sZV9wYXR0ZXJuDQo+ICtmcm9tIGF2b2NhZG9fcWVtdSBpbXBvcnQgZXhlY19jb21tYW5k
DQo+ICtmcm9tIGF2b2NhZG9fcWVtdSBpbXBvcnQgZXhlY19jb21tYW5kX2FuZF93YWl0X2Zvcl9w
YXR0ZXJuDQo+ICsNCj4gK2NsYXNzIFZmaW9Vc2VyKFRlc3QpOg0KPiArICAgICIiIg0KPiArICAg
IDphdm9jYWRvOiB0YWdzPXZmaW91c2VyDQo+ICsgICAgIiIiDQo+ICsgICAgS0VSTkVMX0NPTU1P
Tl9DT01NQU5EX0xJTkUgPSAncHJpbnRrLnRpbWU9MCAnDQo+ICsNCj4gKyAgICBkZWYgZG9fdGVz
dChzZWxmLCBrZXJuZWxfdXJsLCBpbml0cmRfdXJsLCBrZXJuZWxfY29tbWFuZF9saW5lLA0KPiAr
ICAgICAgICAgICAgICAgIG1hY2hpbmVfdHlwZSk6DQo+ICsgICAgICAgICIiIk1haW4gdGVzdCBt
ZXRob2QiIiINCj4gKyAgICAgICAgc2VsZi5yZXF1aXJlX2FjY2VsZXJhdG9yKCdrdm0nKQ0KPiAr
DQo+ICsgICAgICAgIGtlcm5lbF9wYXRoID0gc2VsZi5mZXRjaF9hc3NldChrZXJuZWxfdXJsKQ0K
PiArICAgICAgICBpbml0cmRfcGF0aCA9IHNlbGYuZmV0Y2hfYXNzZXQoaW5pdHJkX3VybCkNCj4g
Kw0KPiArICAgICAgICBzb2NrZXQgPSBvcy5wYXRoLmpvaW4oJy90bXAnLCBzdHIodXVpZC51dWlk
NCgpKSkNCj4gKyAgICAgICAgaWYgb3MucGF0aC5leGlzdHMoc29ja2V0KToNCj4gKyAgICAgICAg
ICAgIG9zLnJlbW92ZShzb2NrZXQpDQo+ICsNCj4gKyAgICAgICAgIyBDcmVhdGUgcmVtb3RlIHBy
b2Nlc3MNCj4gKyAgICAgICAgcmVtb3RlX3ZtID0gc2VsZi5nZXRfdm0oKQ0KPiArICAgICAgICBy
ZW1vdGVfdm0uYWRkX2FyZ3MoJy1tYWNoaW5lJywgJ3gtcmVtb3RlJykNCj4gKyAgICAgICAgcmVt
b3RlX3ZtLmFkZF9hcmdzKCctbm9kZWZhdWx0cycpDQo+ICsgICAgICAgIHJlbW90ZV92bS5hZGRf
YXJncygnLWRldmljZScsICdsc2k1M2M4OTVhLGlkPWxzaTEnKQ0KDQpJSVVDIHRoZSBMU0kgY29u
dHJvbGxlciB3aWxsIG5vdyBiZSBhIG1pZ3JhdGFibGUgZGV2aWNlIGFuZCBtaWdyYXRpb24gd2ls
bCBiZSBoYW5kbGVkIGJ5IHZmdV9taWdfdHJhbnNpdGlvbigpIGludHJvZHVjZWQgaW4geW91ciAi
dmZpby11c2VyOiByZWdpc3RlciBoYW5kbGVycyB0byBmYWNpbGl0YXRlIG1pZ3JhdGlvbiIgcGF0
Y2guIEluIHZmdV9taWdfdHJhbnNpdGlvbigpLCB5b3UgZG9u4oCZdCBjb3B5IG1pZ3JhdGlvbiBk
YXRhIGluIHRoZSBWRlVfTUlHUl9TVEFURV9TVE9QX0FORF9DT1BZIGNhc2UgYnV0IG9ubHkgaW4g
VkZVX01JR1JfU1RBVEVfUFJFX0NPUFksIGhvd2V2ZXIgSSBiZWxpZXZlIHRoYXQgaW4gVkZJTyBp
dCdzIHBvc3NpYmxlIHRvIGp1bXAgZnJvbSB0aGUgcnVubmluZyBzdGF0ZSBzdHJhaWdodCB0byB0
aGUgc3RvcC1hbmQtY29weSBzdGF0ZS4gQXJlIHlvdSByZWx5aW5nIG9uIFFFTVUgbm90IGRvaW5n
IHRoaXM/DQoNCj4gKyAgICAgICAgcmVtb3RlX3ZtLmFkZF9hcmdzKCctb2JqZWN0JywgJ3ZmaW8t
dXNlcixpZD12Zmlvb2JqMSwnDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAnZGV2aWQ9
bHNpMSxzb2NrZXQ9Jytzb2NrZXQpDQo+ICsgICAgICAgIHJlbW90ZV92bS5sYXVuY2goKQ0KPiAr
DQo+ICsgICAgICAgICMgQ3JlYXRlIHByb3h5IHByb2Nlc3MNCj4gKyAgICAgICAgc2VsZi52bS5z
ZXRfY29uc29sZSgpDQo+ICsgICAgICAgIHNlbGYudm0uYWRkX2FyZ3MoJy1tYWNoaW5lJywgbWFj
aGluZV90eXBlKQ0KPiArICAgICAgICBzZWxmLnZtLmFkZF9hcmdzKCctYWNjZWwnLCAna3ZtJykN
Cj4gKyAgICAgICAgc2VsZi52bS5hZGRfYXJncygnLWNwdScsICdob3N0JykNCj4gKyAgICAgICAg
c2VsZi52bS5hZGRfYXJncygnLW9iamVjdCcsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
J21lbW9yeS1iYWNrZW5kLW1lbWZkLGlkPXN5c21lbS1maWxlLHNpemU9MkcnKQ0KPiArICAgICAg
ICBzZWxmLnZtLmFkZF9hcmdzKCctLW51bWEnLCAnbm9kZSxtZW1kZXY9c3lzbWVtLWZpbGUnKQ0K
PiArICAgICAgICBzZWxmLnZtLmFkZF9hcmdzKCctbScsICcyMDQ4JykNCj4gKyAgICAgICAgc2Vs
Zi52bS5hZGRfYXJncygnLWtlcm5lbCcsIGtlcm5lbF9wYXRoLA0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICctaW5pdHJkJywgaW5pdHJkX3BhdGgsDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgJy1hcHBlbmQnLCBrZXJuZWxfY29tbWFuZF9saW5lKQ0KPiArICAgICAgICBzZWxmLnZt
LmFkZF9hcmdzKCctZGV2aWNlJywNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAndmZpby11
c2VyLXBjaSwnDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgJ3NvY2tldD0nK3NvY2tldCkN
Cj4gKyAgICAgICAgc2VsZi52bS5sYXVuY2goKQ0KPiArICAgICAgICB3YWl0X2Zvcl9jb25zb2xl
X3BhdHRlcm4oc2VsZiwgJ2FzIGluaXQgcHJvY2VzcycsDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAnS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmcnKQ0KPiArICAgICAgICBl
eGVjX2NvbW1hbmQoc2VsZiwgJ21vdW50IC10IHN5c2ZzIHN5c2ZzIC9zeXMnKQ0KPiArICAgICAg
ICBleGVjX2NvbW1hbmRfYW5kX3dhaXRfZm9yX3BhdHRlcm4oc2VsZiwNCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICdjYXQgL3N5cy9idXMvcGNpL2RldmljZXMv
Ki91ZXZlbnQnLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
J1BDSV9JRD0xMDAwOjAwMTInKQ0KPiArDQo+ICsgICAgZGVmIHRlc3RfbXVsdGlwcm9jZXNzX3g4
Nl82NChzZWxmKToNCj4gKyAgICAgICAgIiIiDQo+ICsgICAgICAgIDphdm9jYWRvOiB0YWdzPWFy
Y2g6eDg2XzY0DQo+ICsgICAgICAgICIiIg0KPiArICAgICAgICBrZXJuZWxfdXJsID0gKCdodHRw
czovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtDQo+IDNBX19hcmNo
aXZlcy5mZWRvcmFwcm9qZWN0Lm9yZ19wdWJfYXJjaGl2ZV9mZWRvcmEmZD1Ed0lCQWcmYz1zODgz
Rw0KPiBwVUNPQ2hLT0hpb2NZdEdjZyZyPVhUcFlzaDVQczJ6SnZ0dzZvZ3R0aTQ2YXRrNzM2U0k0
dmdzSmlVS0l5REUmbT0NCj4gNG5BWlhlQTl4ZDgyVE9ONkg3Q1hGNUxWYTBqS0JBSmt5dTBZLQ0K
PiBjdXJTZDQmcz1oUDZJa3RkbUlWbHczZ011WmxXUmtQdkZxOU96alVqaTZzYl8yOHNhcHdrJmU9
ICcNCj4gKyAgICAgICAgICAgICAgICAgICAgICAnL2xpbnV4L3JlbGVhc2VzLzMxL0V2ZXJ5dGhp
bmcveDg2XzY0L29zL2ltYWdlcycNCj4gKyAgICAgICAgICAgICAgICAgICAgICAnL3B4ZWJvb3Qv
dm1saW51eicpDQo+ICsgICAgICAgIGluaXRyZF91cmwgPSAoJ2h0dHBzOi8vdXJsZGVmZW5zZS5w
cm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0NCj4gM0FfX2FyY2hpdmVzLmZlZG9yYXByb2pl
Y3Qub3JnX3B1Yl9hcmNoaXZlX2ZlZG9yYSZkPUR3SUJBZyZjPXM4ODNHDQo+IHBVQ09DaEtPSGlv
Y1l0R2NnJnI9WFRwWXNoNVBzMnpKdnR3Nm9ndHRpNDZhdGs3MzZTSTR2Z3NKaVVLSXlERSZtPQ0K
PiA0bkFaWGVBOXhkODJUT042SDdDWEY1TFZhMGpLQkFKa3l1MFktDQo+IGN1clNkNCZzPWhQNklr
dGRtSVZsdzNnTXVabFdSa1B2RnE5T3pqVWppNnNiXzI4c2Fwd2smZT0gJw0KPiArICAgICAgICAg
ICAgICAgICAgICAgICcvbGludXgvcmVsZWFzZXMvMzEvRXZlcnl0aGluZy94ODZfNjQvb3MvaW1h
Z2VzJw0KPiArICAgICAgICAgICAgICAgICAgICAgICcvcHhlYm9vdC9pbml0cmQuaW1nJykNCj4g
KyAgICAgICAga2VybmVsX2NvbW1hbmRfbGluZSA9IChzZWxmLktFUk5FTF9DT01NT05fQ09NTUFO
RF9MSU5FICsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAnY29uc29sZT10dHlT
MCByZGluaXQ9L2Jpbi9iYXNoJykNCj4gKyAgICAgICAgbWFjaGluZV90eXBlID0gJ3BjJw0KPiAr
ICAgICAgICBzZWxmLmRvX3Rlc3Qoa2VybmVsX3VybCwgaW5pdHJkX3VybCwga2VybmVsX2NvbW1h
bmRfbGluZSwNCj4gbWFjaGluZV90eXBlKQ0KPiArDQo+ICsgICAgZGVmIHRlc3RfbXVsdGlwcm9j
ZXNzX2FhcmNoNjQoc2VsZik6DQo+ICsgICAgICAgICIiIg0KPiArICAgICAgICA6YXZvY2Fkbzog
dGFncz1hcmNoOmFhcmNoNjQNCj4gKyAgICAgICAgIiIiDQo+ICsgICAgICAgIGtlcm5lbF91cmwg
PSAoJ2h0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0NCj4g
M0FfX2FyY2hpdmVzLmZlZG9yYXByb2plY3Qub3JnX3B1Yl9hcmNoaXZlX2ZlZG9yYSZkPUR3SUJB
ZyZjPXM4ODNHDQo+IHBVQ09DaEtPSGlvY1l0R2NnJnI9WFRwWXNoNVBzMnpKdnR3Nm9ndHRpNDZh
dGs3MzZTSTR2Z3NKaVVLSXlERSZtPQ0KPiA0bkFaWGVBOXhkODJUT042SDdDWEY1TFZhMGpLQkFK
a3l1MFktDQo+IGN1clNkNCZzPWhQNklrdGRtSVZsdzNnTXVabFdSa1B2RnE5T3pqVWppNnNiXzI4
c2Fwd2smZT0gJw0KPiArICAgICAgICAgICAgICAgICAgICAgICcvbGludXgvcmVsZWFzZXMvMzEv
RXZlcnl0aGluZy9hYXJjaDY0L29zL2ltYWdlcycNCj4gKyAgICAgICAgICAgICAgICAgICAgICAn
L3B4ZWJvb3Qvdm1saW51eicpDQo+ICsgICAgICAgIGluaXRyZF91cmwgPSAoJ2h0dHBzOi8vdXJs
ZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0NCj4gM0FfX2FyY2hpdmVzLmZl
ZG9yYXByb2plY3Qub3JnX3B1Yl9hcmNoaXZlX2ZlZG9yYSZkPUR3SUJBZyZjPXM4ODNHDQo+IHBV
Q09DaEtPSGlvY1l0R2NnJnI9WFRwWXNoNVBzMnpKdnR3Nm9ndHRpNDZhdGs3MzZTSTR2Z3NKaVVL
SXlERSZtPQ0KPiA0bkFaWGVBOXhkODJUT042SDdDWEY1TFZhMGpLQkFKa3l1MFktDQo+IGN1clNk
NCZzPWhQNklrdGRtSVZsdzNnTXVabFdSa1B2RnE5T3pqVWppNnNiXzI4c2Fwd2smZT0gJw0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICcvbGludXgvcmVsZWFzZXMvMzEvRXZlcnl0aGluZy9hYXJj
aDY0L29zL2ltYWdlcycNCj4gKyAgICAgICAgICAgICAgICAgICAgICAnL3B4ZWJvb3QvaW5pdHJk
LmltZycpDQo+ICsgICAgICAgIGtlcm5lbF9jb21tYW5kX2xpbmUgPSAoc2VsZi5LRVJORUxfQ09N
TU9OX0NPTU1BTkRfTElORSArDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJ3Jk
aW5pdD0vYmluL2Jhc2ggY29uc29sZT10dHlBTUEwJykNCj4gKyAgICAgICAgbWFjaGluZV90eXBl
ID0gJ3ZpcnQsZ2ljLXZlcnNpb249MycNCj4gKyAgICAgICAgc2VsZi5kb190ZXN0KGtlcm5lbF91
cmwsIGluaXRyZF91cmwsIGtlcm5lbF9jb21tYW5kX2xpbmUsDQo+IG1hY2hpbmVfdHlwZSkNCj4g
LS0NCj4gMS44LjMuMQ0KDQo=

