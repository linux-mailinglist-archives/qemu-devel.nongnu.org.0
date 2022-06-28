Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F4A55BF36
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:45:22 +0200 (CEST)
Received: from localhost ([::1]:56310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65uT-0004M1-RR
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7178e17cfc=pdel@fb.com>)
 id 1o658j-0004iK-Qn; Tue, 28 Jun 2022 02:56:03 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:31060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7178e17cfc=pdel@fb.com>)
 id 1o658h-0007aE-8y; Tue, 28 Jun 2022 02:56:01 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RJ1QdL004932;
 Mon, 27 Jun 2022 23:55:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=huFV5jErtTEBjxg4sBmnRj/mh/ttPuYgK/Ru6EMocXo=;
 b=l4DkkHVAXPobNfZuNLhMvVwg+zkUSJp5R1mL3jc93HO4HHSnza9KH5HQh4LMhjgh9q//
 vPY75B6a0O+an/V5uzDutNWJrP5RST6Y2JGWcdDkotDkpwQ1o7yqLCRmN3dpJOFegWNF
 uXMUQBJxUeBNbH9tv8o9fmjuNVTM3ct/PRI= 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gx03yysqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 23:55:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpGy/EzehVQ2yElpgBEGyyCxjxE7pc57QAkUE2pJWJoSo5MrhtLD2JVVZSc27+yml3FMwce2Auub+9bkhWEsheIM7Olcm0V6n8PTRCOPk5CUkPq7PQgKts7pPRVwxSWiAu40zYhnA1fXxbY7zOpYWPyJB6LEBfaJmXehckafw3RhIJP6f/Uuir6OwmOHsZ73+8Cb1I53j3GaP1oEDOYbiVYdoU7XA66EVU84hz3xWLDFskM25IHiwg+uHLVKcGdz8lvamueXKrLq1abDoGjOtCqTWRw+VLvaP6u4DV5895xmZYYdSae666CnrTnevR9D5sCaf5SosyXJrV8eeNoxIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huFV5jErtTEBjxg4sBmnRj/mh/ttPuYgK/Ru6EMocXo=;
 b=dwRJe0ZfWB8U1hBPfG/Td5HXGsP+WZGWO+pym+RjcECcOUfHPaMYaBEvxNkxDNIn/z3IyNkk4S2YfSRY4D9xaZYdl3RQRd8PEwun/zpH85VYTyv0YrWGxHYW05S33l0i0FLCsg3iJRU8EkFfRWjdm++k8KfrBMRgR4Uuer4F9UAejCDX1NCS7+vmwX5vx0G+1aKMHIsjjQg1xRwLO5BkZQhlLpOcj/C3ruy/98NjrhaoEmoBivy5kCUj+rxAE87ZWeDtruLnneWVGT22rYdZcmbIudyaxDCG+hYN4UM6GAPnHOYC1JpEozIJL782Jy7TOQytfY2KG/Jf/MOmP9V5ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by DM6PR15MB3433.namprd15.prod.outlook.com (2603:10b6:5:168::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 06:55:50 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134%6]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 06:55:50 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Peter Delevoryas <pdel@fb.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Subject: Re: [PATCH v2 8/8] aspeed: Add AST2600 (BMC) to fby35
Thread-Topic: [PATCH v2 8/8] aspeed: Add AST2600 (BMC) to fby35
Thread-Index: AQHYh2KVPq5d76ll3kacA2BxwBJv1q1kSXuAgAAf8QA=
Date: Tue, 28 Jun 2022 06:55:50 +0000
Message-ID: <1BA0BC18-0108-4766-BB22-9158356598A0@fb.com>
References: <20220624003701.1363500-1-pdel@fb.com>
 <20220624003701.1363500-9-pdel@fb.com>
 <ca9813f5-50f6-4391-8ec9-824d38b697d0@kaod.org>
In-Reply-To: <ca9813f5-50f6-4391-8ec9-824d38b697d0@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b448ae8a-a582-40c5-4ed3-08da58d33caa
x-ms-traffictypediagnostic: DM6PR15MB3433:EE_
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: grajCqRLFVMgrxbhJNR5q2u8QtOlV5TswaNKngY3zztNBHZ0CVXtvI/Gce+Wc9lonFGa6Q8kT38fNR5FGqtCuJ5PtpSZndk7l7O/ul+J0ECvA6kiyUefkzUauXg95ua3cpr7d/TIjpxJ34tW+RfQ7iPWTVuolJzXoFF3yuOJZCMMzRFyJvUdD5dUajyTU2gQTBXbvSdBpVixgV3Vp7Yr9hP1QSy/PXVOLUDMR6A3IF8WsFCH7MdERVt7eno2NELJRWD+ePmE7sKL7v1zNhPzWBg0Eu2e7/uqKySflgQ0HSmM1pPj211uBpuyjcGoMSlGrBsky8TbBNo89DMP3FXRD79Oet7aCiuZpjT7qfMBcdW60d4gFSrgbwXqjVxWtXzIZYSa3/B7+7ykuU/iH1hxyOfbGOa9G81VKQdy92NMW3BoIn79bgAmJU9HErfKaRJOswXA1y0ZiM4S1ABZt3HfvvpYgh4zMmc88K0aGWH51qTlA0GT0xKvVOL4zfBGP81pdNa7knieBAs/eB0EV7PKsh4ycBEIq3YPygtZxe+kHvhtpaYk1lltoqfeR89TNrrA/psu9FNIqP0C1wnLHgifetno0LodRisw5C/jsTH98Us5NVfXq+3oQG0PM+m6vk8YRS48Sqv07qEpJmYikgzMj7wWZCdQgiSlqTSUtxHV6GC3bJMfOo02ULSn9ggXpQk3l//LJnGqsYQ9r/tMjdcsWWkSVf94TUU7Bd6EQ+50P6vNwcL6lhfqjcSeAVgaquV51/9nqiA8eya8nLiTN+D+87QMkvCCCOFszNhcmUI8GiJ2QBLPenwV2KNisgDKxX7JhAnwX+m67g6ufGB1Cqd1bs40wHTzEy1pTvz9GV41V30=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(5660300002)(64756008)(71200400001)(2616005)(54906003)(2906002)(36756003)(122000001)(66574015)(4326008)(186003)(8936002)(41300700001)(83380400001)(66446008)(66556008)(86362001)(109986005)(6486002)(8676002)(966005)(38070700005)(33656002)(478600001)(53546011)(66476007)(6506007)(66946007)(6512007)(76116006)(38100700002)(316002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2FCTk8zWEVTUzlEQTJuSFk1ZU5pWE5jeWw3anFzcGVrdURoTHFucFdXZEpT?=
 =?utf-8?B?TmpDckl4MGdvQkFBOWhiTWxRR3dxMHBRSDJoeTdKaG16V0tONTZmMWdkQWcr?=
 =?utf-8?B?eWZ4VDFaaW9zbCtMekRGdE1EU1B6N280aXRjV2NWb0VsNEpIcXBtM0J6L3FP?=
 =?utf-8?B?WGppSjFrbDk5YXl0bXdWUk1nZExIWmFndGxuZzVTM2E3Y0JnV3RPT0RYY1k3?=
 =?utf-8?B?c1lrY2RkM3JVNFhlZE5EUG1ROVl6NzBOeHcycTNpcEpQRHNqTkFnak1TS1FY?=
 =?utf-8?B?NS84ZTBwK2dRZWV2YzlSSDJaSTBFMEw0ZmUyQ1lDazVFb0VzN3VBVzhMdW1Z?=
 =?utf-8?B?ZURxOTlyd1VlVVU5clU5cmo5OEJSYU9lSldMMVJ1dFBMMlJkWVVMZmZDQnBP?=
 =?utf-8?B?dGhDQkpBbVNBTWUvcGxqR2FPSkxFaW9sOTlkeExuWmFXM2FmQnNVdHVWOFVJ?=
 =?utf-8?B?bUt6RE5UdnhCZTh5cFFKYWJPKzFwR0lVWS9lU3NJK1ZGcU9SRERtZ01Fa0Va?=
 =?utf-8?B?bFRwWmRBZTdwZkdXVHA2Q25IZ25iYWthNXF0NXJVTTJsWWJLNVFNbU9wVzli?=
 =?utf-8?B?Qmt0cHNabXR6eFRsRmRMaGdaeXZPUDZHNGtHK1AvWS93QkJGQ21ySFhkZExR?=
 =?utf-8?B?SHM4dkdjc1VSTFVCNmNoeG9PdENwZnBHaEwvTGE3UUVKL0xYWXIxaWlvUmFE?=
 =?utf-8?B?ZndFWHBGR25oMHZEYkR5eitkWVNGM21ZcmN5YytidldueEt6aHVTUzRGWkRr?=
 =?utf-8?B?Vk9RR2dyMVREcFZmVDBnd0pDb3B4WGxycHZKZGZCa3RXQ01mTHovcm5VeWlD?=
 =?utf-8?B?ajM4Vy85SStaY0JraDh3bVVMUTBlQWtqWVM0bmcvd3VHbHEvNWhnZ1dRRWxD?=
 =?utf-8?B?NlhEVExaTnFJdUFWWklGd1oyb3M0cVkzbTl0L0d3cTZhT3hSR3FVTWhBN1pP?=
 =?utf-8?B?eVZuMTI0dW5SWHk1SWxzUkNvQ0RaZEpLb3JiYUFEOW16ODFPK29vMWk0WHgr?=
 =?utf-8?B?QzBPbVRNZk9yMjlWQ3Nsd1Urb084NFM5VVJuUTdPUGxjUmJ6NDUrOGZXU0JP?=
 =?utf-8?B?TkcvcG5ZcXB4VytkdmF3eC90S01Qd2tXeWRDUkRBMk42L0ZpQlpaS3pvSU13?=
 =?utf-8?B?K3E0ektvbkVnc0Q3eExMQ2pGTXpvRDl4SFJJYmFEL0NMUHAxdVJ6cytBRkhu?=
 =?utf-8?B?cUpsSmZKaHNTTEx3RmtOckpvRlFRSHN5SVVHL1Q3Q0JlWmMyVWdaMGpZWHdB?=
 =?utf-8?B?bFZRaG5SUjlRbTBVbERpSTd0akQ2Y1hERlFDRnprbVp4dEN4dUFHN3hjS1Jl?=
 =?utf-8?B?anVyaXQ1UllucTR2WUdJSHBicDdYNzZEQ1VhS2owTkc2MDNLSjZlTU0xeSsy?=
 =?utf-8?B?cUxiVVJoMFRJNC9xSE9yRExoMVBUTEUvemVGV2R2aXczVE1mSGp6K3dZQjJt?=
 =?utf-8?B?MHc4eEduSVdXT2pVUko1RlN0WHZaUFYvVGhEZ1BHNUFQcWNpM0JiOXhUMmlO?=
 =?utf-8?B?UG0yR0gwZDc2MVo0UmZMbWk5WnVCTEVKbFAweFZxUCtkMEU3d2FaUWlvR2t2?=
 =?utf-8?B?RUVKM0dYVC9kSVhWOWhRTzQydkJHTHA1UHNpeC9ZRXRLVjhPRjVIcU0xcmRz?=
 =?utf-8?B?UUNuL1YwYUZyMlFVSHhLMGxTRzEvWWk4T1FWaFdLTTg0cXgrcDRNWGZsUUhi?=
 =?utf-8?B?SktFcjV1ajc3MWdCckR0K092eHBrZE9nbW1kQ2hYTmxZWGs2aExEV2ROYnhy?=
 =?utf-8?B?RHpldWszRWVVd2hZelVHb2htVVVGTGw3aEJhVmkycW5jL3ZtSXRmaVFvUVRJ?=
 =?utf-8?B?OUI1Yjl2WitFZkZMZDVXOUZRVDZZWXh4QVo4eHJzeSt6SDNBTEE5OGErZnBz?=
 =?utf-8?B?ZkFBZjNyRjFiM3dTUzhmelAzSC9JK1B3SmFYV21IK1hlK09wSmlZRW90VVUx?=
 =?utf-8?B?K1VLVTZQK0JXVCtLSk15NUJPSWJQaHJ5cFFMd0FVK0FkZUlrRWYwb2pId2Vq?=
 =?utf-8?B?QTdVaVJXOXFRQUE2MDBMV0VlYkZ1UzUvNk9NMk5tMTRRZkxvMFllVnlWZURw?=
 =?utf-8?B?RnZJVDRnL3VoR1N3Y0x4RXg2UzhOZFR3UnNFbnppOW5WNzU5ekhuWTl0cGw3?=
 =?utf-8?B?WDZLN1hQNTAyZlBuYUpuWUUzQlh5b1ZNdFhBSW4rcDlyYWlwS0NkZUliU25C?=
 =?utf-8?B?MXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D55BB8F3D97FC14C99B8F826BA2E29E2@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b448ae8a-a582-40c5-4ed3-08da58d33caa
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 06:55:50.4859 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sdvZ6zsoCZUiRG8NAsi5p9FYCvJRYgDzR0YqtZNztKtg02oZXHIpH6MESlTGAvun
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR15MB3433
X-Proofpoint-GUID: 48p5wP7cKEjCQghxz5SGivF4zm8y8jYx
X-Proofpoint-ORIG-GUID: 48p5wP7cKEjCQghxz5SGivF4zm8y8jYx
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_09,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=7178e17cfc=pdel@fb.com; helo=mx0b-00082601.pphosted.com
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

DQoNCj4gT24gSnVuIDI3LCAyMDIyLCBhdCAxMDowMSBQTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNs
Z0BrYW9kLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiA2LzI0LzIyIDAyOjM3LCBQZXRlciBEZWxldm9y
eWFzIHdyb3RlOg0KPj4gWW91IGNhbiB0ZXN0IGJvb3RpbmcgdGhlIEJNQyB3aXRoIGJvdGggJy1k
ZXZpY2UgbG9hZGVyJyBhbmQgJy1kcml2ZQ0KPj4gZmlsZScuIFRoaXMgaXMgbmVjZXNzYXJ5IGJl
Y2F1c2Ugb2YgaG93IHRoZSBmYi1vcGVuYm1jIGJvb3Qgc2VxdWVuY2UNCj4+IHdvcmtzIChqdW1w
IHRvIDB4MjAwMDAwMDAgYWZ0ZXIgVS1Cb290IFNQTCkuDQo+PiANCj4+ICAgICB3Z2V0IGh0dHBz
Oi8vZ2l0aHViLmNvbS9mYWNlYm9vay9vcGVuYm1jL3JlbGVhc2VzL2Rvd25sb2FkL29wZW5ibWMt
ZTIyOTRmZjVkMzFkL2ZieTM1Lm10ZA0KPj4gICAgIHFlbXUtc3lzdGVtLWFybSAtbWFjaGluZSBm
YnkzNSAtbm9ncmFwaGljIFwNCj4+ICAgICAgICAgLWRldmljZSBsb2FkZXIsZmlsZT1mYnkzNS5t
dGQsYWRkcj0wLGNwdS1udW09MCAtZHJpdmUgZmlsZT1mYnkzNS5tdGQsZm9ybWF0PXJhdyxpZj1t
dGQNCj4+IFNpZ25lZC1vZmYtYnk6IFBldGVyIERlbGV2b3J5YXMgPHBkZWxAZmIuY29tPg0KPj4g
LS0tDQo+PiAgaHcvYXJtL2ZieTM1LmMgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysNCj4+ICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKQ0KPj4gZGlm
ZiAtLWdpdCBhL2h3L2FybS9mYnkzNS5jIGIvaHcvYXJtL2ZieTM1LmMNCj4+IGluZGV4IGRjMWFl
OGU2MmEuLjFlMjRjYmYzZjggMTAwNjQ0DQo+PiAtLS0gYS9ody9hcm0vZmJ5MzUuYw0KPj4gKysr
IGIvaHcvYXJtL2ZieTM1LmMNCj4+IEBAIC0yMSwxNyArMjEsNTMgQEANCj4+ICAgKi8NCj4+ICAg
ICNpbmNsdWRlICJxZW11L29zZGVwLmgiDQo+PiArI2luY2x1ZGUgInFlbXUvdW5pdHMuaCINCj4+
ICsjaW5jbHVkZSAicWFwaS9lcnJvci5oIg0KPj4gICNpbmNsdWRlICJody9ib2FyZHMuaCINCj4+
ICsjaW5jbHVkZSAiaHcvYXJtL2FzcGVlZF9zb2MuaCINCj4+ICAgICNkZWZpbmUgVFlQRV9GQlkz
NSBNQUNISU5FX1RZUEVfTkFNRSgiZmJ5MzUiKQ0KPj4gIE9CSkVDVF9ERUNMQVJFX1NJTVBMRV9U
WVBFKEZieTM1U3RhdGUsIEZCWTM1KTsNCj4+ICAgIHN0cnVjdCBGYnkzNVN0YXRlIHsNCj4+ICAg
ICAgTWFjaGluZVN0YXRlIHBhcmVudF9vYmo7DQo+PiArDQo+PiArICAgIE1lbW9yeVJlZ2lvbiBi
bWNfbWVtb3J5Ow0KPj4gKyAgICBNZW1vcnlSZWdpb24gYm1jX2RyYW07DQo+PiArICAgIE1lbW9y
eVJlZ2lvbiBibWNfYm9vdF9yb207DQo+PiArDQo+PiArICAgIEFzcGVlZFNvQ1N0YXRlIGJtYzsN
Cj4+ICB9Ow0KPj4gICtzdGF0aWMgdm9pZCBmYnkzNV9ibWNfaW5pdChGYnkzNVN0YXRlICpzKQ0K
Pj4gK3sNCj4+ICsgICAgdWludDMyX3QgYm9vdF9yb21fc2l6ZTsNCj4+ICsNCj4+ICsgICAgbWVt
b3J5X3JlZ2lvbl9pbml0KCZzLT5ibWNfbWVtb3J5LCBPQkpFQ1QocyksICJibWMtbWVtb3J5Iiwg
VUlOVDY0X01BWCk7DQo+PiArICAgIG1lbW9yeV9yZWdpb25faW5pdF9yYW0oJnMtPmJtY19kcmFt
LCBPQkpFQ1QocyksICJibWMtZHJhbSIsIDIgKiBHaUIsICZlcnJvcl9hYm9ydCk7DQo+PiArDQo+
PiArICAgIG9iamVjdF9pbml0aWFsaXplX2NoaWxkKE9CSkVDVChzKSwgImJtYyIsICZzLT5ibWMs
ICJhc3QyNjAwLWEzIik7DQo+PiArICAgIG9iamVjdF9wcm9wZXJ0eV9zZXRfaW50KE9CSkVDVCgm
cy0+Ym1jKSwgInJhbS1zaXplIiwgcy0+Ym1jX2RyYW0uc2l6ZSwgJmVycm9yX2Fib3J0KTsNCj4g
DQo+IFRoaXMgZmFpbHMgdG8gY29tcGlsZSBvbiBzb21lIHBsYXRmb3JtcyA6DQo+IA0KPiAuL2h3
L2FybS9mYnkzNS5jOiBJbiBmdW5jdGlvbiDigJhmYnkzNV9ibWNfaW5pdOKAmToNCj4gLi4vaHcv
YXJtL2ZieTM1LmM6NTA6Njk6IGVycm9yOiBpbmNvbXBhdGlibGUgdHlwZSBmb3IgYXJndW1lbnQg
MyBvZiDigJhvYmplY3RfcHJvcGVydHlfc2V0X2ludOKAmQ0KPiAgIDUwIHwgICAgIG9iamVjdF9w
cm9wZXJ0eV9zZXRfaW50KE9CSkVDVCgmcy0+Ym1jKSwgInJhbS1zaXplIiwgcy0+Ym1jX2RyYW0u
c2l6ZSwgJmVycm9yX2Fib3J0KTsNCj4gICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+fn5+fn5+fn5+Xn5+fn4NCj4gICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfA0KPiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJbnQxMjgNCj4gSW4gZmlsZSBpbmNs
dWRlZCBmcm9tIC9idWlsZHMvbGVnb2F0ZXIvcWVtdS9pbmNsdWRlL2V4ZWMvbWVtb3J5Lmg6Mjgs
DQo+ICAgICAgICAgICAgICAgICBmcm9tIC9idWlsZHMvbGVnb2F0ZXIvcWVtdS9pbmNsdWRlL2h3
L2JvYXJkcy5oOjYsDQo+ICAgICAgICAgICAgICAgICBmcm9tIC4uL2h3L2FybS9mYnkzNS5jOjI2
Og0KPiAvYnVpbGRzL2xlZ29hdGVyL3FlbXUvaW5jbHVkZS9xb20vb2JqZWN0Lmg6MTM0MjozODog
bm90ZTogZXhwZWN0ZWQg4oCYaW50NjRfdOKAmSB7YWthIOKAmGxvbmcgbG9uZyBpbnTigJl9IGJ1
dCBhcmd1bWVudCBpcyBvZiB0eXBlIOKAmEludDEyOOKAmQ0KPiAxMzQyIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBpbnQ2NF90IHZhbHVlLCBFcnJvciAqKmVycnApOw0KPiAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+fn5+fn5+fl5+fn5+DQo+IA0KPiANCg0KT2gg
eWlrZXMsIEnigJlsbCBmaXggdGhpcy4gSG9wZWZ1bGx5IHdpdGhvdXQgY2FzdGluZyBmcm9tIElu
dDEyOCB0byBpbnQ2NF90IG9yIGRlZmluaW5nIGEgbmV3IGNvbnN0YW50Lg0KDQo+IFlvdSBkb24n
dCBuZWVkIHRvIHJlc2VuZCB0aGUgcGF0Y2hlcyAxLTcuIEkgaGF2ZSBwdWxsZWQgdGhlbSBpbiBt
eSBicmFuY2gNCj4gZm9yIHRoZSBuZXh0IFBSLg0KDQpHb3QgaXQsIEnigJlsbCBqdXN0IHJlc2Vu
ZCB0aGlzIG9uZSBhcyB2MyB0aGVuLg0KDQo+IA0KPj4gKyAgICBvYmplY3RfcHJvcGVydHlfc2V0
X2xpbmsoT0JKRUNUKCZzLT5ibWMpLCAibWVtb3J5IiwgT0JKRUNUKCZzLT5ibWNfbWVtb3J5KSwg
JmVycm9yX2Fib3J0KTsNCj4+ICsgICAgb2JqZWN0X3Byb3BlcnR5X3NldF9saW5rKE9CSkVDVCgm
cy0+Ym1jKSwgImRyYW0iLCBPQkpFQ1QoJnMtPmJtY19kcmFtKSwgJmVycm9yX2Fib3J0KTsNCj4+
ICsgICAgb2JqZWN0X3Byb3BlcnR5X3NldF9pbnQoT0JKRUNUKCZzLT5ibWMpLCAiaHctc3RyYXAx
IiwgMHgwMDAwMDBDMCwgJmVycm9yX2Fib3J0KTsNCj4+ICsgICAgb2JqZWN0X3Byb3BlcnR5X3Nl
dF9pbnQoT0JKRUNUKCZzLT5ibWMpLCAiaHctc3RyYXAyIiwgMHgwMDAwMDAwMywgJmVycm9yX2Fi
b3J0KTsNCj4gDQo+IFdlIGNvdWxkIHNoYXJlIGNvbW1vbiBkZWZpbml0aW9ucyB3aXRoIHRoZSBC
TUMgbWFjaGluZSBpbiAuaCBmaWxlLg0KDQpHb29kIHBvaW50LCBJ4oCZbGwgcHV0IHRoZW4gaW4g
YXNwZWVkLmggdGhlbi4NCg0KPiANCj4+ICsgICAgb2JqZWN0X3Byb3BlcnR5X3NldF9pbnQoT0JK
RUNUKCZzLT5ibWMpLCAidWFydC1kZWZhdWx0IiwgQVNQRUVEX0RFVl9VQVJUNSwgJmVycm9yX2Fi
b3J0KTsNCj4+ICsgICAgcWRldl9yZWFsaXplKERFVklDRSgmcy0+Ym1jKSwgTlVMTCwgJmVycm9y
X2Fib3J0KTsNCj4+ICsNCj4+ICsgICAgYm9vdF9yb21fc2l6ZSA9IEFTUEVFRF9TTUNfR0VUX0NM
QVNTKCZzLT5ibWMuZm1jKS0+c2VnbWVudHNbMF0uc2l6ZTsNCj4+ICsNCj4+ICsgICAgbWVtb3J5
X3JlZ2lvbl9pbml0X3JvbSgmcy0+Ym1jX2Jvb3Rfcm9tLCBPQkpFQ1QocyksICJibWMtYm9vdC1y
b20iLCBib290X3JvbV9zaXplLCAmZXJyb3JfYWJvcnQpOw0KPj4gKyAgICBtZW1vcnlfcmVnaW9u
X2FkZF9zdWJyZWdpb24oJnMtPmJtY19tZW1vcnksIDAsICZzLT5ibWNfYm9vdF9yb20pOw0KPj4g
Kw0KPj4gKyAgICBhc3BlZWRfYm9hcmRfaW5pdF9mbGFzaGVzKCZzLT5ibWMuZm1jLCAibjI1cTAw
IiwgMiwgMCk7DQo+IA0KPiBJIGFtIG5vdCB0b3RhbGx5IGNvbnZpbmNlZCB3aXRoIHRoZSBST00g
YmVjYXVzZSBpdCBjb21wbGV4aWZpZXMgaG93IHRoZQ0KPiBtYWNoaW5lIGlzIHN0YXJ0ZWQgYnV0
IEkgaGF2ZW4ndCB0cmllZCB0aGUgb3RoZXIgd2F5IHVzaW5nIHRoZSBsb2FkZXINCj4gZWl0aGVy
LiBJdCBpcyBteSBUT0RPIGxpc3QuDQoNClllcCwgdG90YWxseSBhZ3JlZTogaWYgSSBjYW4gZml4
IHRoaXMgc29vbiBJ4oCZbGwgc2VuZCBvdXQgYSBmaXggb3Igc29tZXRoaW5nLCBvdGhlcndpc2UN
CmZlZWwgZnJlZSB0byBzdWJtaXQgYSBjaGFuZ2Ugb2YgeW91ciBvd24uDQoNClRoYW5rcyBmb3Ig
dGhlIHJldmlldyENCg0KPiANCj4gVGhhbmtzLA0KPiANCj4gQy4NCj4gDQo+PiArfQ0KPj4gKw0K
Pj4gIHN0YXRpYyB2b2lkIGZieTM1X2luaXQoTWFjaGluZVN0YXRlICptYWNoaW5lKQ0KPj4gIHsN
Cj4+ICsgICAgRmJ5MzVTdGF0ZSAqcyA9IEZCWTM1KG1hY2hpbmUpOw0KPj4gKw0KPj4gKyAgICBm
YnkzNV9ibWNfaW5pdChzKTsNCj4+ICB9DQo+PiAgICBzdGF0aWMgdm9pZCBmYnkzNV9jbGFzc19p
bml0KE9iamVjdENsYXNzICpvYywgdm9pZCAqZGF0YSkNCj4+IEBAIC00MCw2ICs3Niw5IEBAIHN0
YXRpYyB2b2lkIGZieTM1X2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKm9jLCB2b2lkICpkYXRhKQ0K
Pj4gICAgICAgIG1jLT5kZXNjID0gIk1ldGEgUGxhdGZvcm1zIGZieTM1IjsNCj4+ICAgICAgbWMt
PmluaXQgPSBmYnkzNV9pbml0Ow0KPj4gKyAgICBtYy0+bm9fZmxvcHB5ID0gMTsNCj4+ICsgICAg
bWMtPm5vX2Nkcm9tID0gMTsNCj4+ICsgICAgbWMtPm1pbl9jcHVzID0gbWMtPm1heF9jcHVzID0g
bWMtPmRlZmF1bHRfY3B1cyA9IDI7DQo+PiAgfQ0KPj4gICAgc3RhdGljIGNvbnN0IFR5cGVJbmZv
IGZieTM1X3R5cGVzW10gPSB7DQo+IA0KDQo=

