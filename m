Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EB948452A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 16:48:24 +0100 (CET)
Received: from localhost ([::1]:55958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4m2w-0008Ly-R0
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 10:48:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n4m1Q-0006d3-9Q
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 10:46:48 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:11942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n4m1N-000233-P5
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 10:46:47 -0500
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 204873eL000550;
 Tue, 4 Jan 2022 07:46:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=u1KxyVzyPR8h0N+CUt3eTA/nmpx54KmSvOvzJqo26B0=;
 b=HPaxw21DD5hFKs0rFtxeANikGrmfL3DjI89cJKwvDUyUvKWsPPJgeeY4A59Ciz/1Gir+
 arArSLsv7V3taZS+5YTy8nVcBCqcJqjVuDbpon0QRt3Z2aySoPAfbQ1ZfujPJqTyqW0c
 Jx4kbPU9yly7d3ZcBx7afU37JmVP9iB0ZzoX/Pr3Mt3NFGb1bXHeCxMkuMG6sFScCMWN
 TNbApNnoFXT3Kvz0y07YJpir2US+vqmfoipGtNXzyLp1JSIPI/UzsK77mgaYua8I8qWm
 1cwkr2Icz6WNYwDmL9YAP8t0cwlozbCyV6bA3mpM4kxm9t95k8vnFX8xTdR7ta3cGiu4 dg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3dbu752rub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:46:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edR8c4RKBNGIkJoJX1sRsdW/UuGtvaiIos6GG29G5sq/BWzfj6pEvIbYtrOOKHU9EWgucoxslw7+OH8WKzOBzkEagkSO22z4I5NgVOSOJKNI3IpcAlAV41Iv5g5IHoqm2qwFuRZvLEWPkPZFN6QyEys434rF/HZFl/WPdR1NkbYQcfyKz3cQAwKoPzvXUe/vkbzxzwg6LXc3eD7vDi54J5Cn/Xz8dAMnhcVzHt3PFaPcjZBHeph1g0h0MjJCgz7ijRuxwVs7/Jhi5MXQuVIxtdmfSFUPRBt0REaIdT0MDv1eaXGQGUVO5krGxXiKo7BtkgFkv7S2Hcycwv4JcW1A1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1KxyVzyPR8h0N+CUt3eTA/nmpx54KmSvOvzJqo26B0=;
 b=dWQ0aEQrKtbfIic2aGBnZMpv1i7zZaMILwHStJSmIw6GrbDVAytCjA3xJD3l/y9LiPUvQoItOa+NcuD2mH7ExmNqlKSeadmtqiRGAiYb5lUWi6i9bCrvv84Se3i2/yIoNIQD4IFw6hz2cP6GVEJT2jGblgpGsdQcxzkK9eFkFgUK71fu5uhp2ZrmwOSXnu6vrzr1Dr6JqqEsAl7UvppSuoKvUqw0SPiazBRyo0PSg5IdVypn+e2lVEqOGoagPFbc4vki93YHvMlA/or2I4NpX0Hx2q8cfsw53uKliJ8BE32JujwLb0VJsCE7fznDij9AdMRtBet75U5SXdaYr7X4gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB5587.namprd02.prod.outlook.com (2603:10b6:208:8e::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Tue, 4 Jan
 2022 15:46:37 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da%5]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 15:46:37 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "mst@redhat.com" <mst@redhat.com>
Subject: Re: [RFC 0/5] Clean up error handling in libvhost-user memory mapping
Thread-Topic: [RFC 0/5] Clean up error handling in libvhost-user memory mapping
Thread-Index: AQHX8gNDpGtXsOkIkUmuyd0RrsddvaxTIHQA
Date: Tue, 4 Jan 2022 15:46:37 +0000
Message-ID: <20220104154630.GA26497@raphael-debian-dev>
References: <20211215222939.24738-1-raphael.norwitz@nutanix.com>
In-Reply-To: <20211215222939.24738-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5574f1c2-3cf1-4868-0e61-08d9cf9964a8
x-ms-traffictypediagnostic: BL0PR02MB5587:EE_
x-microsoft-antispam-prvs: <BL0PR02MB5587772824F1C8510BDF0D22EA4A9@BL0PR02MB5587.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RzNlP7pehwoTEcNPxnaxcab+qvH4FWX2rv1HGMEc3dtZFWdv6fcxVlZpzlWf4L3uNRk3FHuegGNy+BllhDKBjQKgdJjqilMXlPJhVzkBeni6ocgRhrEMmNFyeapfFHR65CD73Vg6Y2DOo2Fdfr/s1YQiTkqD1LeO0TlwpFRPliIWZ/IUTdZ5SI6rS1nLY08DYqZgMgl59sNOv4UhxIeXzcB1jcCribU/lxS2Li4+kQUEmybecnRGDqAN+3FUkCTJw4GzHlw/2YPF6QSYXYQsEHHu96ayecLJo83nXoifvEDqCeczU3l4HOMaeLFGK0NWliGc2XjK3hv2UyW/63nfU0MaU3jYnXruReRHVYEeB7gXfd0Q5Pw6acsmX1T6HwEB/yBxxhZsWYLpzgQ1stRBdtbGD74OGwgDam/r+LHq9I1LPJwDvfEMGFSczolGEyP9XNoYhJjTXKOq5G2eHWSh+lBg/g0wDCPVPGb/FS9R+ErDGNXUXq1eQd6lFa3AU2KjqGHAltHkTEulsl04eYIDuCt3i3wnPphhzgJJvtXnLFEkDTLK8qzcsSzN/SBa4VlwD6QKCUg45B7eCzFWy9qORYquqvVQusfBrU2QDXaGl47K2Gi4VEDGC7L6NEHfL7AURLnatacuhvu5/Gdawf/gyPLAQwwGc4dP6RJk83fi/lcPRlVVenbupxn40jU9tdyfPCLMFBwL7vGj7Ln6GdOUOU/xTs0WOSaeD7ZoHWyFv2YpCuIe7U27kflkZPk+iI7U77MEUJtgU3aGaRFcAfcI6m23N+MWgdy6Tzbsb/mnvbe5vb/np5CoIoiIMx74lAjWnUiG/p+EFRD/Xp4BXe3XBA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(26005)(5660300002)(4326008)(64756008)(66476007)(186003)(66556008)(66446008)(2906002)(44832011)(316002)(966005)(83380400001)(508600001)(33716001)(8936002)(1076003)(33656002)(9686003)(38070700005)(66946007)(122000001)(6916009)(54906003)(71200400001)(8676002)(6512007)(6506007)(76116006)(6486002)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UnRDZ01nWEx0bVplS0phTU9zdFhNaDFTT2xGanE4ZWJ5Rk5WSXJOY3Q2YWM5?=
 =?utf-8?B?UjFydEtZc0l2L0dQQ2xUMGhPUFBaQzdPWFhIQVhWWE9rMUFPczUrZTQ0YjN3?=
 =?utf-8?B?WGJ3WHptZ1J2L09nSTZCTFlSeDdZNjNyNTZKYkZqSC9yTHk1VTJFVGFBcWV2?=
 =?utf-8?B?eS9OZnlFZEhoMUVGWHB5ZC9oYWlKNFBuUVJET1NJWnRhMWhxczBNaUc2VjBv?=
 =?utf-8?B?OVFIb01nYVNiVnpMWitPRGhGUGN6UjRvaTg2T3QvOVhENlR6OUNtTFlHdzlt?=
 =?utf-8?B?TWpEY01oSGxXWXZVSlg0enZEWk8vNGo0K0pTd1VyTytFZllpS2tiVXdEcVRv?=
 =?utf-8?B?eUFCYWRRd3hQTG83YXRkeE8raCtoSHl2ZDdaWVQxRW1uc2lOeVdDTkZJQ2U0?=
 =?utf-8?B?b0Q2Uzl4WkNuOUtiUjU1NlBSajFjR0c5SG13VTM2NWJYTi9wdEJUT3M5UXFt?=
 =?utf-8?B?ejVUcll0TGtGV01rTmF2WkhVeXpIcURPYUFrM0pKL0JnbEU4ZXg2dTVzZ0hh?=
 =?utf-8?B?SGl3SXR5R3dnazB1Z3VFU1p1Yzk4TFhpTXAyNjk3cjhXd1pGb2p5Y25TYjNF?=
 =?utf-8?B?NjBTODVZZTQzYXg4YnVRN3dRSmVLdmNKcE9pQkZWUWpkQ2pOS2lqNVhUOHRU?=
 =?utf-8?B?QjdwdWJqTnNmZ3JOS3cvY1IveXVRUUtmYUttVnp2TStjcnRseUlCc2NCOUVW?=
 =?utf-8?B?S1BEdVovc1d4dkxBSHZSbEgybmUySjN4bUVUWGw5aFk4NmRsVUlrQU80bitZ?=
 =?utf-8?B?R0FDWk1NbHNUU1lncE92RFBIb1NEaWczTlRSSytUUC9CSnc5YktqZVlxVk01?=
 =?utf-8?B?MGg0MEJHTUxOS2g3UnRDUXBUM0xoOG5Gc1Q2cU5HcFJYYlJUclpjMlRuVXVa?=
 =?utf-8?B?UFJpQ0VSUjNqSUtvYjNaVHVuTnlueWlNQUtBUnZ0R3FGckU4eGdLY3ZrcnZ3?=
 =?utf-8?B?cUV6U0RrWXZjclRBTmhqcENNcFdZZ0ptQmgzUUJzUjVvbkI1WlJQcFJKeU82?=
 =?utf-8?B?VzJ2eGZVb1ppS3FkVnY1QktKVi9sZjBvVmRaMXBjZThzOWQzRElrdVR3Q2NE?=
 =?utf-8?B?RGVmSzcxNGF4RGMvK2taUkpwaEtHdklsVys5R2NFNzhWRUg3L2hMSVVJWi9w?=
 =?utf-8?B?U1ZXZVM1MUw3dmRUK1l3MFpSYWc2Q0dnQWtNOVZnY0NDRElXUzk2SHJ4L04w?=
 =?utf-8?B?UmVBVVdyLzB3eW1TTVYvK3U0amhRTlo5Mzhic2wrdXBzcXhLSWFsVmNVaFRY?=
 =?utf-8?B?Mk1jSy9YNGtqd1hET2VpclJpa2UvYlNqT0JNcURZeGxXSjlPd2VCVDBZeVJD?=
 =?utf-8?B?bGIyNFZvdVp6NzhKUVhoOXJGb1I5a2xJT1FrSEd4NlJqUXVUTHJhS24xVmo0?=
 =?utf-8?B?TlhzSXp4dGs3aTZYSzNjdE4yRitQQWVBYjN0ZC96ZXZzb2hnQzFxblduTG51?=
 =?utf-8?B?L1ovNjZOdXRud2pPa2lBa2xuNGlxcm5OL3QzU2E0d2FmOC9SYnppNWNRY2tp?=
 =?utf-8?B?cnA4ZXpMQkM2dnNLelV6QWtLUHd1WEVBOExIUS9ENHJSYnk0d1I2N3p5TTFD?=
 =?utf-8?B?SnFJTU9FSkQ4Sm5BL1g2dWRLOUc5ZlVDeHl4MmpnSzV3ekNSR040TWd6amRh?=
 =?utf-8?B?aWJZVlB0T2JCM1BNTENyVUtURzErQm9WeW5aNkFITjlFQmRvcEpSU1VPdzN5?=
 =?utf-8?B?OCtQU0svUStoQmpMSW9aMzdkdFZoR0tUYjlGQ09vK01XeHZMa1dzU1dOUDBP?=
 =?utf-8?B?a29FQVZWNnplY2FDN0xCMDdIbnQ5ekhlckxBM3JvQ2pBUUFWYWlQUVErL3pL?=
 =?utf-8?B?MGJibkY3bHcyK09zaXN6anBEVVU4cDZMbGlwNlRQem5XTjlDRGpJMDRiak16?=
 =?utf-8?B?em4xRU9RcFpWMXZTVCtJclcvVk56K3ZCSFlFL2VzKytvM0xQUkJuNk9LWWJ2?=
 =?utf-8?B?dFdFZVplN3JZMVpmZVdSYVdKQUNEczlBQkJ0ODNYRnpzOUZxcEZUbkt3RWxR?=
 =?utf-8?B?MkkxQVRPZ05qQ1ZOcm4rU3ZnM2lKdG9iRnRlZ0VPSHArbVh5TWl4eUtyNVR3?=
 =?utf-8?B?UDVxT1NxbS9xcFpxQzZnMVlnZDFDU3hNbUtlek9TZVBaM3ZNU1hYMW5FR0Nq?=
 =?utf-8?B?UkdyUnVuOW5MMTF5WTN1bkVCRnROSXhKRFpKM1FuWUdNQkQxelBmemdxMnc2?=
 =?utf-8?B?eXpZZGM5SDRzMUs5WWN1NUsvTFJTQ0kvRk1Kb1BrS1N5bElxbDFNaUJBRFhl?=
 =?utf-8?Q?bdZMI+JOXsq7gHti5eBEKq/IsHPhMJPB0BgthgasdY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7F6B9DDDAA5704795D8B5CBA1194A28@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5574f1c2-3cf1-4868-0e61-08d9cf9964a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2022 15:46:37.4223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U3EdSqShAu24I6Quk343YvjJ1XHiSZ2JP8Iw0QnI1Mm61NTID/g4ZoP+aPbwcTNn16EwiH/5E9WyUtwZuQWg6QwaOiz1eIIjdBeTxAGbhUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5587
X-Proofpoint-ORIG-GUID: ANdFrGy5c-mLvmeIrjPEYsFg_atrcYYA
X-Proofpoint-GUID: ANdFrGy5c-mLvmeIrjPEYsFg_atrcYYA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_07,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "david@redhat.com" <david@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGluZw0KDQpPbiBXZWQsIERlYyAxNSwgMjAyMSBhdCAxMDoyOTo0NlBNICswMDAwLCBSYXBoYWVs
IE5vcndpdHogd3JvdGU6DQo+IEhleSBTdGVmYW4sIE1hcmMtQW5kcmUsIE1TVCwgRGF2aWQgLQ0K
PiANCj4gQXMgcHJvbWlzZWQgaGVyZSBpcyBhIHNlcmllcyBjbGVhbmluZyB1cCBlcnJvciBoYW5k
bGluZyBpbiB0aGUNCj4gbGlidmhvc3QtdXNlciBtZW1vcnkgbWFwcGluZyBwYXRoLiBNb3N0IG9m
IHRoZXNlIGNsZWFudXBzIGFyZQ0KPiBzdHJhaWdodGZvcndhcmQgYW5kIGhhdmUgYmVlbiBkaXNj
dXNzZWQgb24gdGhlIG1haWxpbmcgbGlzdCBpbiB0aHJlYWRzDQo+IFsxXSBhbmQgWzJdLiBIb3Bl
ZnVsbHkgdGhlcmUgaXMgbm90aGluZyBzdXBlciBjb250cm92ZXJzaWFsIGluIHRoZSBmaXJzdA0K
PiA0IHBhdGNoZXMuDQo+IA0KPiBJIGFtIGNvbmNlcm5lZCBhYm91dCBwYXRjaCA1IOKAnGxpYnZo
b3N0LXVzZXI6IGhhbmRsZSByZW1vdmFsIG9mDQo+IGlkZW50aWNhbCByZWdpb25z4oCdLiBGcm9t
IG15IHJlYWRpbmcgb2YgU3RlZmFuJ3MgY29tbWVudHMgaW4gWzFdLCB0aGUNCj4gcHJvcG9zYWwg
c2VlbWVkIHRvIGJlIHRvIHJlbW92ZSBhbnkgZHVwbGljYXRlIHJlZ2lvbnMuIEnigJlkIHByZWZl
ciB0bw0KPiBwcmV2ZW50IGR1cGxpY2F0ZSByZWdpb25zIGZyb20gYmVpbmcgYWRkZWQgaW4gdGhl
IGZpcnN0IHBsYWNlLiBUaG91Z2h0cz8gDQo+IA0KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvcWVtdS1kZXZlbC8yMDIxMTAxODE0MzMxOS5HQTExMDA2QHJhcGhhZWwtZGViaWFuLWRldi8N
Cj4gWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3FlbXUtZGV2ZWwvOTM5MWY1MDAtNzBiZS0y
NmNmLWJjZmMtNTkxZDNlZTg0ZDRlQHJlZGhhdC5jb20vDQo+IA0KPiBTb3JyeSBmb3IgdGhlIGRl
bGF5LA0KPiBSYXBoYWVsDQo+IA0KPiBEYXZpZCBIaWxkZW5icmFuZCAoMSk6DQo+ICAgbGlidmhv
c3QtdXNlcjogU2ltcGxpZnkgVkhPU1RfVVNFUl9SRU1fTUVNX1JFRw0KPiANCj4gUmFwaGFlbCBO
b3J3aXR6ICg0KToNCj4gICBsaWJ2aG9zdC11c2VyOiBBZGQgdnVfcmVtX21lbV9yZWcgaW5wdXQg
dmFsaWRhdGlvbg0KPiAgIGxpYnZob3N0LXVzZXI6IEFkZCB2dV9hZGRfbWVtX3JlZyBpbnB1dCB2
YWxpZGF0aW9uDQo+ICAgbGlidmhvc3QtdXNlcjogcHJldmVudCBvdmVyLXJ1bm5pbmcgbWF4IFJB
TSBzbG90cw0KPiAgIGxpYnZob3N0LXVzZXI6IGhhbmRsZSByZW1vdmFsIG9mIGlkZW50aWNhbCBy
ZWdpb25zDQo+IA0KPiAgc3VicHJvamVjdHMvbGlidmhvc3QtdXNlci9saWJ2aG9zdC11c2VyLmMg
fCA1MiArKysrKysrKysrKysrKystLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDM0IGluc2Vy
dGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQ0KPiANCj4gLS0gDQo+IDIuMjAuMQ==

