Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8355352595A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 03:22:54 +0200 (CEST)
Received: from localhost ([::1]:54332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npK17-00048N-LV
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 21:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=613212e35b=pdel@fb.com>)
 id 1npJyb-0002eX-NN; Thu, 12 May 2022 21:20:17 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:59470
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=613212e35b=pdel@fb.com>)
 id 1npJyY-0001FW-UU; Thu, 12 May 2022 21:20:16 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 24D0abJf029621;
 Thu, 12 May 2022 18:20:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=KSXZsrmts2DXO7HnO8ikV8Mf3HMbgfSfeXU+se8AIdo=;
 b=Aa0VHjRzNSbR4HrkhZFMDUjImnK3wL/0qNhZqR5mCcgc3XXdHAUOVNZFaga6RBG5hZxn
 v4p0hfUuzjxBbirrVBEqdYytAHK7MQp2gI96eG+y2FeKtXL+k9x40Of9DCyZOcXNGHc3
 DY+eIfqTxMEop+ZJ/yzBOjK8KTjuTyCnv/A= 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by m0001303.ppops.net (PPS) with ESMTPS id 3g1cxe85c2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 18:20:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgvRf6GOOJi+4cItUkoFHnieUH4JE2KsWf/Nfqtv+4/sr+zOZlsJ1a8rZML5B0i1sgvAn1BAegPl8UH2wPGc9e1A+cPzSrkseyx89XbbaVSzm6OFxHN1dveMoC52f+lbh47yVgOoCMvSeo+9J4YaeKh/eWueIXYZM7xZy5VNWOtkr/SkNV5X4Ay3t49qLLyg34x504hCx5GYKinVvxmvTvj7n7TuoG9Op18xpXnbEegZRPRMG/097wytHc+a4t5J033j9jOLVV8vueq42Ee/jw0hwHwZrAHYWwAxjCL25bxC7Tu/ApKT0ICvLxpwN8Kaqtt77Poked/mT0L6NfLk/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSXZsrmts2DXO7HnO8ikV8Mf3HMbgfSfeXU+se8AIdo=;
 b=DkcnAD35kUx/hYBC7zfFFBM2PU2PGHuGg7ifMabw3A6HD4U622LJ5fEbVKO/LIvvadrHf/S4lOSYDviUbPMLAjfKZ35u5VZ2ILsOshTawYImebJ/JXxPHGi9YgXR7raneCyxb2g0+rzv2XEVzqOl89TPtAJTN55wKi2zrDoCZVI0NEWm165ZmvL6e2QSFAKlg0HlOjEfwU7GN0D1rqxU6bM5wDdYIsu5O+i/xiW3RJb/cdnAUQSe/msc2AcJn5ffnw/hKo9ZOoyx3sZrwP7UWUqbxVKIYtFMseG5yfWrz0wIX+JpCyzGXGvHVkkDvSj3qM7Y1kniHl9rXuw3KyoApg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by PH0PR15MB4382.namprd15.prod.outlook.com (2603:10b6:510:9f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.15; Fri, 13 May
 2022 01:20:04 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb%5]) with mapi id 15.20.5250.014; Fri, 13 May 2022
 01:20:04 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Iris Chen <irischenlj@fb.com>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "clg@kaod.org" <clg@kaod.org>, Peter Delevoryas
 <pdel@fb.com>
Subject: Re: [PATCH] hw: aspeed_soc: Initialize all UART's with serial devices
Thread-Topic: [PATCH] hw: aspeed_soc: Initialize all UART's with serial devices
Thread-Index: AQHYZmGp97nZV88xv0yAXY4IcvZBba0cAmJJ
Date: Fri, 13 May 2022 01:20:03 +0000
Message-ID: <E6C3FED9-097F-4A7B-A87C-7905BB601F70@fb.com>
References: <20220513003720.2831997-1-pdel@fb.com>
In-Reply-To: <20220513003720.2831997-1-pdel@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea896b41-1633-4dff-92ad-08da347eb566
x-ms-traffictypediagnostic: PH0PR15MB4382:EE_
x-microsoft-antispam-prvs: <PH0PR15MB4382EA0CC30FB0B3F388E249ACCA9@PH0PR15MB4382.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oqX/ox9iqTxTHJRXTt5mQ2+MN1xjctafEHPISQzNLLMUTS2hp52jW3SY08krgQBGNpU4MUGrh94p7uZ/8ByjyxLjDKOxBwtvq62NDPGru2kXI8NXGS8SywJxEw2I7rXg2OL8lt8gvRSgDFT38Gp+x44UY731xUAlOHb47pG034Quifo3g97nJw4yQVemp3nhuSzr5Id9/iIIKcl2WFRq8DQpUd0KpbNJDaPjxgBgdvKHW51K0+W+VWVw2Y8W+vCA23o6dHx081oKdFz+u4Ao0PY+AuWp0MTQdDuGbAM7pzCUSNS04KdtrtiyWFTjhvBivXf5t3IDoAZIoBOV9Ism/VHRzPEhu8p8g/YScnSO9qr8DIfcgDtQdnFtYZGGhnOKTt/CEeX1WZMDCXSspRJMeEY+5VQ1X9v03FADY9elEgnutOrI1N9gDCwkgsHyHNOpsSScc7H6hdYepB8npmDMNIcqgvKE01Rv47osUxo8xNvSVGMv8zXDKKC47chMmkQ5G25eys0SffoX5WFIbsmF1XeXMKnIdTo+G/6Els7kcdkzlHI0+Nv/NS0l2nQDYyOA+/rWVQRz2MCqtrgE/4BboECAkRZdSptfVrXtSLGFhk9BNLf1RABGBo5KzxEHjjbJMqorKy8ZsXSkVB1ZNmbQTgUyOOVje3nhI9SpVKeZyeeey9x800mUU+W+DDXDMmDTrcr63tZ3kpn6FVo+YHqcgMYYICv18SDb6sneMzMWt4fW5yvIooKdyCBJvm+nC3kJCkgkTA2cQ9nWnn5kMW5IisjANPIcB0igpqCL//Md9V6WrrNSw1SSKfmRUz33u3UZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(33656002)(6486002)(966005)(508600001)(4326008)(122000001)(86362001)(66946007)(76116006)(64756008)(66446008)(66476007)(66556008)(8676002)(54906003)(316002)(38070700005)(38100700002)(6512007)(5660300002)(53546011)(2906002)(2616005)(109986005)(6506007)(186003)(83380400001)(36756003)(8936002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXVWeTlUMGlvWHExYnBlWG5RNjBxc0tCRGswbjdtVHlrUjlyQWRqeUpoOFI0?=
 =?utf-8?B?Tk5oc2VnNm54R2YzbE1zeWRFam9jNzJjOW5JZ0FXMEl6VFVKT2t5LzBPNXZa?=
 =?utf-8?B?QU9qYTY3b3BMcmhqMzlhT2JzOVhzRTFGYW9nblpjU2pxdjBYSlNiOFY3L1g0?=
 =?utf-8?B?QVRzVmVJblR4QnJBS3dPMEFvWE12U1FCd2s2bER0TjdSOEIxUkR1NGJncGhL?=
 =?utf-8?B?WFJNSnRocWZDT0VvVU9qZTJ1RlVDeE1uR3RtQUZhb3JnQzMrM2lOK1ZDRmNu?=
 =?utf-8?B?a1hBTTJPQU5FcFFTU0RnS2tNSGF1WVgyU2RaSUl4YnluRVhnaVM0Nm9tcG0v?=
 =?utf-8?B?WEVOQ1dOSEZNMXVycEdyUk5uOElQamRtYUVFWkQrcWg1ZXlaV0xXMUpUY1Ju?=
 =?utf-8?B?WVdMQ09BaUdkcmhZK3U4bk5aVGltdUhnV3dSc1hwaTNPYXBHdmNibnBUZjhP?=
 =?utf-8?B?QmJ4QWRTN0lxMTJoKy9uL25xNmtJZFExZHN3NjVzU1cwSS91QnJqQzVIYVBo?=
 =?utf-8?B?QlZZc1ZmK1diVDZhdkw4aTZBaVpkOFNMeGRIUkxXaTFQMlQ4Y2xJdzc4VTRO?=
 =?utf-8?B?T1JXRkwwT1dLaXZraFpBNDNFL3FIeTh3SzBUS2lmeU13c1AxbE8vbDVJczl6?=
 =?utf-8?B?N0VNWTVPNDNWVDRFMHBwYUNzUHJGdzNHaVNvOVo3YnpPOTVVdE5abWNRSXZ6?=
 =?utf-8?B?TmlxNzlRMGtUNjBqdGxpNnVyUERGTVNJLzN1b0FNd1pHOURuSU1SczY3dVEx?=
 =?utf-8?B?Q1ZUY3FVMFZ4ZVdpQkt5QU5XQjJheStnV3k3VTBFeTNKdE9TeHErSWpCMUdP?=
 =?utf-8?B?dzlJdW1UYnhYTm50NVhtMnpEQ3dsdy9oVnhmNXhFTldqSXdUS0Y4aGFnR1lM?=
 =?utf-8?B?Mi8xMVRodjhVOGRCQXRBQXFjbU9MS3UvMXhKME5JWE9tb29XSWJOenVxKzFI?=
 =?utf-8?B?VE9HN0JpMDZiREVYcXRKSi9RakV4RzRHVmJrWEF4OFVrTHNoQVZLeG5TYzZJ?=
 =?utf-8?B?bUgxN3NZa2d2NnhES0RTdmFNeStudVR2R0tnSVBxMHY2Z1U0VGJNdUh4Y2Z0?=
 =?utf-8?B?RXh3RmVFWmM1MHZMd1FkeGlIL21xZzVBdXR1MEN3K0plUGFMUTNhQjYyaXVp?=
 =?utf-8?B?V3REcU5jc2NkZXhEVEVZeVBlVklKWEZiSW1zKzliY3NGNFF4TkcyYVZ0bEUz?=
 =?utf-8?B?TGRMUGc3QUo5RFB6eW9QY252OUZDM24xUmFKV0xPTkRpUG82b3oyUFRxZHJh?=
 =?utf-8?B?T1pyeVJtdmVpeitPZGdJbkVnekFuaDc5MGhkcStLWDNMeGpJdmJ5d1prVWR6?=
 =?utf-8?B?OTlhRkZGRWEycTJaYkw3WXlFWm01REQyMnQrQVNPVnZDSWVjZ1huMUJRbU93?=
 =?utf-8?B?d2FZNWJNTGYvVWxISHRBWXBQcld3eWUxZGZpWTltd1JTRTBkMEE1d3Y1eklX?=
 =?utf-8?B?UkwyeDErMXZTMjdEQnpEMFpCR1RkZGovbWcyajdLWDJINlg4T3d5V1VhbGcv?=
 =?utf-8?B?dllFRzd5bDMwU3ZhSXQ2STZTS1B1Qno0MDZ0S1BWcys0SFh6d0RaWWU3Wkow?=
 =?utf-8?B?MjJzQkw2NDdmdmx1eHBwT3VVWkwrL1MwdEdKZm5heXRUZy9OVGdFQ1hDLy9a?=
 =?utf-8?B?d0cxTEFXODZqZHZ6VzJLVHY1R01oSkEwbmN5L2lvQW9wSmtTTUFHcEtKSXNF?=
 =?utf-8?B?NFBTVHR6QmlESE1JUlQvRlVZWit2b2JENFNLUmFRemx4MytZQ0dvaG5ER1R6?=
 =?utf-8?B?MklrM2JBenVZenIwcG10Umh2RytydUJyd05kZE5mMnBNUWFmVGlOZWRxRDZU?=
 =?utf-8?B?cDliWGRBUmdZSzVHaVVWTTZuQnR6QnVIdk56WktOVkFpQlFRNXFjM3YvSmpo?=
 =?utf-8?B?SjFYd2R3OGZTVmE0U0hOSy9JQjZ6SHRINC9WTDE2NStWYndTVGl1cEp2em8v?=
 =?utf-8?B?MXlzT2NyNjFRTGY5KzIxWFlvV2cvWEFEVjdWMUtxd1IrQTVybjB2S3dOYXRo?=
 =?utf-8?B?TlFrYlU3M2pOZ3J6azZ3ZTU4aE5wSUxJc3lBZWFhem5kMk9KdElnaW9Ua0Q2?=
 =?utf-8?B?Q3BPcHNWWDRHK25KTXQ0V0NqcEdMT01zOW10U2hVUzMzTUxxaHhJRWIwWkVu?=
 =?utf-8?B?Q2l1TmhORG5NU1QvMTlJMmFCVHJBdk9wd1pMZUhSQTRVQjY0cUpwbkt4amI3?=
 =?utf-8?B?Vk1Lbjk4aHp1SXFWTFQyRHE4cVJnZTlUSVRNUk1vbkMwMXM2ZFpSQ3l2ZFVT?=
 =?utf-8?B?ODdHVjBOVnFrRmNrODZXYjc3U2EvK1NZQXZDdmQvMnh3MUhzYnlGQk1DRWwx?=
 =?utf-8?B?L1hPSStSdHhsbXU1MmtvdWFPMk1JK0pKY2xWKy9iZ1owaWdXNlE5UT09?=
Content-Type: text/plain; charset="utf-8"
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea896b41-1633-4dff-92ad-08da347eb566
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 01:20:03.9955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aEyZbh+Z6ExM7UnjwHOPHZ5HP1FNOFxiGv3XfTTilM9PxfGGGoPt7l0ByKVOTqIm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB4382
X-Proofpoint-ORIG-GUID: MGom7FLq1G8YJ3HkCaOrkaKHKVKfFB3S
X-Proofpoint-GUID: MGom7FLq1G8YJ3HkCaOrkaKHKVKfFB3S
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-12_19,2022-05-12_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=613212e35b=pdel@fb.com; helo=mx0a-00082601.pphosted.com
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

DQoNCj4gT24gTWF5IDEyLCAyMDIyLCBhdCA1OjM3IFBNLCBQZXRlciBEZWxldm9yeWFzIDxwZGVs
QGZiLmNvbT4gd3JvdGU6DQo+IA0KPiDvu79Vc3VhbGx5LCBRRU1VIHVzZXJzIGp1c3QgcHJvdmlk
ZSBvbmUgc2VyaWFsIGRldmljZSBvbiB0aGUgY29tbWFuZCBsaW5lLA0KPiBlaXRoZXIgdGhyb3Vn
aCAiLW5vZ3JhcGhpYyIgb3IgIi1zZXJpYWwgc3RkaW8gLWRpc3BsYXkgbm9uZSIsIG9yIGp1c3Qg
dXNpbmcNCj4gVk5DIGFuZCBwb3BwaW5nIHVwIGEgd2luZG93LiBXZSB0cnkgdG8gbWF0Y2ggd2hh
dCB0aGUgdXNlciBleHBlY3RzLCB3aGljaCBpcw0KPiB0byBjb25uZWN0IHRoZSBmaXJzdCAoYW5k
IHVzdWFsbHkgb25seSkgc2VyaWFsIGRldmljZSB0byB0aGUgVUFSVCBhIGJvYXJkIGlzDQo+IHVz
aW5nIGFzIHNlcmlhbDAuDQo+IA0KPiBNb3N0IEFzcGVlZCBtYWNoaW5lcyBpbiBody9hcm0vYXNw
ZWVkLmMgdXNlIFVBUlQ1IGZvciBzZXJpYWwwIGluIHRoZWlyDQo+IGRldmljZSB0cmVlLCBzbyB3
ZSBjb25uZWN0IFVBUlQ1IHRvIHRoZSBmaXJzdCBzZXJpYWwgZGV2aWNlLiBTb21lIG1hY2hpbmVz
DQo+IHVzZSBVQVJUMSB0aG91Z2gsIG9yIFVBUlQzLCBzbyB0aGUgdWFydF9kZWZhdWx0IHByb3Bl
cnR5IGxldHMgdXMgc3BlY2lmeQ0KPiB0aGF0IGluIGEgYm9hcmQgZGVmaW5pdGlvbi4NCj4gDQo+
IEluIG9yZGVyIHRvIHNwZWNpZnkgYSBub25zdGFuZGFyZCBzZXJpYWwwIFVBUlQsIGEgdXNlciBi
YXNpY2FsbHkgKm11c3QqIGFkZA0KPiBhIG5ldyBib2FyZCBkZWZpbml0aW9uIGluIGh3L2FybS9h
c3BlZWQuYy4gVGhlcmUncyBubyB3YXkgdG8gZG8gdGhpcyB3aXRob3V0DQo+IHJlY29tcGlsaW5n
IFFFTVUsIGJlc2lkZXMgY29uc3RydWN0aW5nIHRoZSBtYWNoaW5lIGNvbXBsZXRlbHkgZnJvbSBz
Y3JhdGNoDQo+IG9uIHRoZSBjb21tYW5kIGxpbmUuDQo+IA0KPiBUbyBwcm92aWRlIG1vcmUgZmxl
eGliaWxpdHksIHdlIGNhbiBhbHNvIHN1cHBvcnQgdGhlIHVzZXIgc3BlY2lmeWluZyBtb3JlDQo+
IHNlcmlhbCBkZXZpY2VzLCBhbmQgY29ubmVjdCB0aGVtIHRvIHRoZSBVQVJUIG1lbW9yeSByZWdp
b25zIGlmIHBvc3NpYmxlLg0KPiBFdmVuIGlmIGEgdXNlciBkb2Vzbid0IHNwZWNpZnkgYW55IGV4
dHJhIHNlcmlhbCBkZXZpY2VzLCBpdCdzIHVzZWZ1bCB0bw0KPiBpbml0aWFsaXplIHRoZXNlIG1l
bW9yeSByZWdpb25zIGFzIFVBUlQncywgc28gdGhhdCB0aGV5IHJlc3BvbmQgdG8gdGhlIGd1ZXN0
DQo+IE9TIG1vcmUgbmF0dXJhbGx5LiBBdCB0aGUgbW9tZW50LCB0aGV5IHdpbGwganVzdCBhbHdh
eXMgcmV0dXJuIHplcm8ncyBmb3INCj4gZXZlcnl0aGluZywgYW5kIHNvbWUgVUFSVCByZWdpc3Rl
cnMgaGF2ZSBhIGRlZmF1bHQgbm9uLXplcm8gc3RhdGUuDQo+IA0KPiBXaXRoIHRoaXMgY2hhbmdl
LCBpZiBhIG5ldyBPcGVuQk1DIGltYWdlIHVzZXMgVUFSVDMgb3Igc29tZSBvdGhlcg0KPiBub25z
dGFuZGFyZCBVQVJUIGZvciBzZXJpYWwwLCB5b3UgY2FuIHN0aWxsIHVzZSBpdCB3aXRoIHRoZSBF
VkIgd2l0aG91dA0KPiByZWNvbXBpbGluZyBRRU1VLCBldmVuIHRob3VnaCB1YXJ0LWRlZmF1bHQ9
VUFSVDUgZm9yIHRoZSBFVkIuDQo+IA0KPiBGb3IgZXhhbXBsZSwgRmFjZWJvb2sncyBXZWRnZTEw
MCBCTUMgdXNlcyBVQVJUMzogeW91IGNhbiBmZXRjaCBhbiBpbWFnZSBmcm9tDQo+IEdpdGh1Ylsx
XSBhbmQgZ2V0IHRoZSBzZXJpYWwgY29uc29sZSBvdXRwdXQgZXZlbiB3aGlsZSBydW5uaW5nIHRo
ZSBwYWxtZXR0bw0KPiBtYWNoaW5lIHR5cGUsIGJlY2F1c2Ugd2UgZXhwbGljaXRseSBzcGVjaWZ5
IHRoYXQgd2Ugd2FudCBVQVJUMyB0byBiZQ0KPiBjb25uZWN0ZWQgdG8gc3RkaW8uDQo+IA0KPiAg
ICBxZW11LXN5c3RlbS1hcm0gLW1hY2hpbmUgcGFsbWV0dG8tYm1jIFwNCj4gICAgICAgIC1kcml2
ZSBmaWxlPXdlZGdlMTAwLm10ZCxmb3JtYXQ9cmF3LGlmPW10ZCBcDQo+ICAgICAgICAtc2VyaWFs
IG51bGwgLXNlcmlhbCBudWxsIC1zZXJpYWwgbnVsbCAtc2VyaWFsIHN0ZGlvIC1kaXNwbGF5IG5v
bmUNCj4gDQo+IFRoaXMgaXMga2luZCBvZiBjb21wbGljYXRlZCwgb2YgY291cnNlOiBpdCBtaWdo
dCBiZSBtb3JlIG5hdHVyYWwgdG8gZ2V0IHJpZA0KPiBvZiB0aGUgdWFydF9kZWZhdWx0IGF0dHJp
YnV0ZSBjb21wbGV0ZWx5LCBhbmQgaW5pdGlhbGl6ZSBVQVJUJ3MNCj4gc2VxdWVudGlhbGx5LiBC
dXQsIGtlZXBpbmcgYmFja3dhcmQgY29tcGF0aWJpbGl0eSBhbmQgdGhlIHdheSBtb3N0IHVzZXJz
DQo+IGtub3cgaG93IHRvIHVzZSBRRU1VIGluIG1pbmQsIHRoaXMgc2VlbXMgdG8gbWFrZSB0aGUg
bW9zdCBzZW5zZS4NCg0KUmVhbGl6ZWQgcmlnaHQgYWZ0ZXIgc2VuZGluZyB0aGlzIEkgbmVlZCB0
byBkbyB0aGUgc2FtZSB0aGluZyBmb3IgdGhlIEFTVDI2MDAgYW5kIDEwMzAuIEnigJlsbCBzdWJt
aXQgYSB2MiB3aXRoIHRob3NlIGNoYW5nZXMuIFNvcnJ5IGZvciB0aGUgbm9pc2UuDQoNCj4gDQo+
IFsxXSBodHRwczovL2dpdGh1Yi5jb20vZmFjZWJvb2svb3BlbmJtYy9yZWxlYXNlcy9kb3dubG9h
ZC92MjAyMS40OS4wL3dlZGdlMTAwLm10ZA0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgRGVs
ZXZvcnlhcyA8cGRlbEBmYi5jb20+DQo+IC0tLQ0KPiBody9hcm0vYXNwZWVkX3NvYy5jIHwgMzAg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+IDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2h3L2FybS9hc3Bl
ZWRfc29jLmMgYi9ody9hcm0vYXNwZWVkX3NvYy5jDQo+IGluZGV4IDU4NzE0Y2IyYTAuLjVlOGZl
YTI1NzcgMTAwNjQ0DQo+IC0tLSBhL2h3L2FybS9hc3BlZWRfc29jLmMNCj4gKysrIGIvaHcvYXJt
L2FzcGVlZF9zb2MuYw0KPiBAQCAtNDgsNiArNDgsOSBAQCBzdGF0aWMgY29uc3QgaHdhZGRyIGFz
cGVlZF9zb2NfYXN0MjQwMF9tZW1tYXBbXSA9IHsNCj4gICAgIFtBU1BFRURfREVWX0VUSDFdICAg
PSAweDFFNjYwMDAwLA0KPiAgICAgW0FTUEVFRF9ERVZfRVRIMl0gICA9IDB4MUU2ODAwMDAsDQo+
ICAgICBbQVNQRUVEX0RFVl9VQVJUMV0gID0gMHgxRTc4MzAwMCwNCj4gKyAgICBbQVNQRUVEX0RF
Vl9VQVJUMl0gID0gMHgxRTc4RDAwMCwNCj4gKyAgICBbQVNQRUVEX0RFVl9VQVJUM10gID0gMHgx
RTc4RTAwMCwNCj4gKyAgICBbQVNQRUVEX0RFVl9VQVJUNF0gID0gMHgxRTc4RjAwMCwNCj4gICAg
IFtBU1BFRURfREVWX1VBUlQ1XSAgPSAweDFFNzg0MDAwLA0KPiAgICAgW0FTUEVFRF9ERVZfVlVB
UlRdICA9IDB4MUU3ODcwMDAsDQo+ICAgICBbQVNQRUVEX0RFVl9TRFJBTV0gID0gMHg0MDAwMDAw
MCwNCj4gQEAgLTgwLDYgKzgzLDkgQEAgc3RhdGljIGNvbnN0IGh3YWRkciBhc3BlZWRfc29jX2Fz
dDI1MDBfbWVtbWFwW10gPSB7DQo+ICAgICBbQVNQRUVEX0RFVl9FVEgxXSAgID0gMHgxRTY2MDAw
MCwNCj4gICAgIFtBU1BFRURfREVWX0VUSDJdICAgPSAweDFFNjgwMDAwLA0KPiAgICAgW0FTUEVF
RF9ERVZfVUFSVDFdICA9IDB4MUU3ODMwMDAsDQo+ICsgICAgW0FTUEVFRF9ERVZfVUFSVDJdICA9
IDB4MUU3OEQwMDAsDQo+ICsgICAgW0FTUEVFRF9ERVZfVUFSVDNdICA9IDB4MUU3OEUwMDAsDQo+
ICsgICAgW0FTUEVFRF9ERVZfVUFSVDRdICA9IDB4MUU3OEYwMDAsDQo+ICAgICBbQVNQRUVEX0RF
Vl9VQVJUNV0gID0gMHgxRTc4NDAwMCwNCj4gICAgIFtBU1BFRURfREVWX1ZVQVJUXSAgPSAweDFF
Nzg3MDAwLA0KPiAgICAgW0FTUEVFRF9ERVZfU0RSQU1dICA9IDB4ODAwMDAwMDAsDQo+IEBAIC0y
MjIsNyArMjI4LDcgQEAgc3RhdGljIHZvaWQgYXNwZWVkX3NvY19pbml0KE9iamVjdCAqb2JqKQ0K
PiANCj4gc3RhdGljIHZvaWQgYXNwZWVkX3NvY19yZWFsaXplKERldmljZVN0YXRlICpkZXYsIEVy
cm9yICoqZXJycCkNCj4gew0KPiAtICAgIGludCBpOw0KPiArICAgIGludCBpLCB1YXJ0Ow0KPiAg
ICAgQXNwZWVkU29DU3RhdGUgKnMgPSBBU1BFRURfU09DKGRldik7DQo+ICAgICBBc3BlZWRTb0ND
bGFzcyAqc2MgPSBBU1BFRURfU09DX0dFVF9DTEFTUyhzKTsNCj4gICAgIEVycm9yICplcnIgPSBO
VUxMOw0KPiBAQCAtMjk3LDEwICszMDMsMzAgQEAgc3RhdGljIHZvaWQgYXNwZWVkX3NvY19yZWFs
aXplKERldmljZVN0YXRlICpkZXYsIEVycm9yICoqZXJycCkNCj4gICAgIHN5c2J1c19jb25uZWN0
X2lycShTWVNfQlVTX0RFVklDRSgmcy0+YWRjKSwgMCwNCj4gICAgICAgICAgICAgICAgICAgICAg
ICBhc3BlZWRfc29jX2dldF9pcnEocywgQVNQRUVEX0RFVl9BREMpKTsNCj4gDQo+IC0gICAgLyog
VUFSVCAtIGF0dGFjaCBhbiA4MjUwIHRvIHRoZSBJTyBzcGFjZSBhcyBvdXIgVUFSVCAqLw0KPiAr
ICAgIC8qDQo+ICsgICAgICogVUFSVCAtIEF0dGFjaCB0aGUgZmlyc3Qgc2VyaWFsIGRldmljZSB0
byB0aGUgbWFjaGluZSdzIGRlZmF1bHQgVUFSVA0KPiArICAgICAqIG1lbW9yeSByZWdpb24sIHVz
dWFsbHkgY29ycmVzcG9uZGluZyB0byB0aGUgc2VyaWFsMCBkZXZpY2UgaW4gdGhlIGRldmljZQ0K
PiArICAgICAqIHRyZWUuDQo+ICsgICAgICovDQo+ICAgICBzZXJpYWxfbW1faW5pdChnZXRfc3lz
dGVtX21lbW9yeSgpLCBzYy0+bWVtbWFwW3MtPnVhcnRfZGVmYXVsdF0sIDIsDQo+ICAgICAgICAg
ICAgICAgICAgICBhc3BlZWRfc29jX2dldF9pcnEocywgcy0+dWFydF9kZWZhdWx0KSwgMzg0MDAs
DQo+ICAgICAgICAgICAgICAgICAgICBzZXJpYWxfaGQoMCksIERFVklDRV9MSVRUTEVfRU5ESUFO
KTsNCj4gKyAgICAvKg0KPiArICAgICAqIFVBUlQgLSBUaGVuLCBpbml0aWFsaXplIHRoZSByZW1h
aW5pbmcgVUFSVCBtZW1vcnkgcmVnaW9ucyB3aXRoIHdoYXRldmVyDQo+ICsgICAgICogb3RoZXIg
c2VyaWFsIGRldmljZXMgYXJlIHByZXNlbnQuIElmIGEgc2VyaWFsIGRldmljZSBpc24ndCBwcmVz
ZW50LCB0aGVuDQo+ICsgICAgICogdGhlIG1lbW9yeSByZWdpb24gc3RpbGwgZ2V0cyBpbml0aWFs
aXplZCBhcyBhIFVBUlQsIGl0IGp1c3Qgd29uJ3QgcmVzcG9uZA0KPiArICAgICAqIHRvIHRoZSBn
dWVzdCBPUy4NCj4gKyAgICAgKi8NCj4gKyAgICBmb3IgKGkgPSAxLCB1YXJ0ID0gQVNQRUVEX0RF
Vl9VQVJUMTsgaSA8IDU7IGkrKywgdWFydCsrKSB7DQo+ICsgICAgICAgIGlmICh1YXJ0ID09IHMt
PnVhcnRfZGVmYXVsdCkgew0KPiArICAgICAgICAgICAgdWFydCsrOw0KPiArICAgICAgICB9DQo+
ICsgICAgICAgIGFzc2VydCh1YXJ0IDw9IEFTUEVFRF9ERVZfVUFSVDUpOw0KPiArDQo+ICsgICAg
ICAgIHNlcmlhbF9tbV9pbml0KGdldF9zeXN0ZW1fbWVtb3J5KCksIHNjLT5tZW1tYXBbdWFydF0s
IDIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGFzcGVlZF9zb2NfZ2V0X2lycShzLCBzLT51
YXJ0X2RlZmF1bHQpLCAzODQwMCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgc2VyaWFsX2hk
KGkpLCBERVZJQ0VfTElUVExFX0VORElBTik7DQo+ICsgICAgfQ0KPiANCj4gICAgIC8qIEkyQyAq
Lw0KPiAgICAgb2JqZWN0X3Byb3BlcnR5X3NldF9saW5rKE9CSkVDVCgmcy0+aTJjKSwgImRyYW0i
LCBPQkpFQ1Qocy0+ZHJhbV9tciksDQo+IC0tIA0KPiAyLjMwLjINCj4gDQo=

