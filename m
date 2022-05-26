Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA28453560E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 00:19:28 +0200 (CEST)
Received: from localhost ([::1]:34966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLpH-0002P2-Oo
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 18:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6145d9b475=pdel@fb.com>)
 id 1nuLg8-0000m6-8x; Thu, 26 May 2022 18:10:00 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:46574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6145d9b475=pdel@fb.com>)
 id 1nuLg6-00052K-31; Thu, 26 May 2022 18:09:59 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24QJ6pc7007168;
 Thu, 26 May 2022 15:09:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=++FfyRe2z/nO26g+WkH8/8qwP4zs0oVyiftHMniZyPQ=;
 b=jGURs7yc8whbG/8eapsqykR+GyMWL/K6IrsH4SAu5vqJc77ESZ1WQdG7TKWRNsmKegGV
 kQNxJgXQ70/B5aV7iTxlLorANNv2hHwaNZFh9RIJCkxqybkSG3arC8nu+yXYSvqA0zSC
 nhe+H2n0/1/vMo/rPgXso6ay/0B9WmVJedA= 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3ga5x8w3f9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 May 2022 15:09:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UShXonhOXTwYsclajHOwyPFYAmILKXpo+M9BulZylD+KGIccV8120PxfnBC6wmdx0ZSiSNNtkBCnSTGejNB2OIQEomajaOpy3vGlCggYdXTa4vjf2n2iodTFekgn/9KnSZMr7QhnGMc5Zm9a1zhNLuqY2CgECdsGDWoazHnZsHRnMBU4yqH4G4xfFfWMjEAerbJKD3isqmcxw0zYrtu5PNBmWdaG2dMFoa/Gz46ax41mTsZR/qg1opIsvAFAhReBj/ZV9jp+HCPDu+2NZD8XdIHh6i2Z+kUW4YXHZoZwzgQw2D1gd/tCtQl5vzrKp3skoefdXZKgwuubs/WRw/Mq9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++FfyRe2z/nO26g+WkH8/8qwP4zs0oVyiftHMniZyPQ=;
 b=NhqwomPt8uJflKOp9pzFb4X4BAkq5Ta1PTzBrPU4n7ppz/wkwfrT8UxKri4wYQ2WHjbTLNBH0ilrnjlzN9diseY0ARaZIjo8hexVrj5EiLwYQuPi7fEFCvL37y/lYquEAIN1ypJyURmDhyTX8APyJQ91ZEjBM1+RktQGpshsFpxVO+6uwDEyOHVbMSy9SKh+PvsqU6MmMU8TutHfZ5vBlUqtvyaXX1iuvJ6aLp1FAUPvXBI1AT5LJUdZQkNs7Ab1HwUAlTM9cVf9NwJCv7d1R9MdtYsfZoMPZYHEaZ6rU7GXKG0/LAPktn0SB+cq6Oi0xHgOMP/o2Y2wu5qF3M4Qnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by SN6PR1501MB2192.namprd15.prod.outlook.com (2603:10b6:805:12::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 22:09:44 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::5812:71cc:63fb:1081]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::5812:71cc:63fb:1081%6]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 22:09:44 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Cameron Esfahani via <qemu-devel@nongnu.org>, qemu-arm
 <qemu-arm@nongnu.org>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>
Subject: Help: How do I make a machine with 2 separate ARM SoC's?
Thread-Topic: Help: How do I make a machine with 2 separate ARM SoC's?
Thread-Index: AQHYcU1NEvk32KdziUK000R8vl+Hpg==
Date: Thu, 26 May 2022 22:09:43 +0000
Message-ID: <8C1AB09A-AFB3-469A-8333-C3D1802D14AE@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eaff486a-a584-4041-1a02-08da3f647050
x-ms-traffictypediagnostic: SN6PR1501MB2192:EE_
x-microsoft-antispam-prvs: <SN6PR1501MB21925A613FD3EFEB7FA8194AACD99@SN6PR1501MB2192.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rloYS9hsZVIfAPk3ePbDDxICO3rigPASx5yNitX6wtdvW+eVcwQ222I+qGzI4Sn8cSdWOklyks+bU2gjT1hxU8BIl29s1IssLf6GTvSkTOrcslN13QVd92UEfnR35Gs9lgQ1E/ddgKH1meCs5uHRMz2vtIdbLDkZndNVYXB3L45Pyn1zWyrq1wq9zNOnExrokgcQO9AIsutLN14L+NVL6dxQWeuy4JjxueJZ8OzZMTL1y7kC3WI49RAqoO6+Z0ltbycgBQP/kblQ+WGBN26hXh5lB4n/hKYtd6zkkSa9BJPtGJdLKMULilxfQFGniDCYC+NnDBzd2Zae49K1kvEsHGKJwD8fscHG0FbyCOJOPdWdRSVUIgwJQYqklCSXCV3RZHfq3MEAeaNLUwmYuJJRrk2l6Gj10rghqkBKHdwiLEdTZ7XmNOn0HY06HixPT5ncMbQyanQgiW8uH3GdelUbVFSQMZxjkjWm9c72/y/VR9ID0gl+ICSgBbDs+tdSS9TeTDAOMQfKqorNrBCJnBv6yVZPsMS2GnhmMMNCfegdwUSqU1/RoAqUeGpU8qgSt+uWtWHCy8CbM49G0miJ/LM6aQH8im/8R9Fm3K8QwhJH3fsgHHjeI9KprsNWdk/B0DR9AaOQ4Km05itd4h668vNmprBTa995drCjVm12KjUKcB2Z+gwRua2/w7azrNuB4L+8KkA1xnd5epoPoqJ3P8DKvXrWjzJhSr83Ny3wT+MoZZ6pDImFp5mOiRTssSr2gkdU+7KVsAVPZuM+0afOfV0nFje5Q6Ijqrz+lO+TB81NPmTOxuZ58QXMoP7Q9HjZ2VRf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(6506007)(316002)(38100700002)(122000001)(36756003)(83380400001)(54906003)(66946007)(66476007)(64756008)(66556008)(66446008)(8676002)(76116006)(2616005)(2906002)(186003)(4326008)(109986005)(71200400001)(33656002)(966005)(8936002)(86362001)(5660300002)(508600001)(6512007)(6486002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXh4M2hURFUxc0J1M0NUdnQvUEs1WjdpdkRWWCs5L0JCeXc4N0Nuc0IyVjR3?=
 =?utf-8?B?RWpLWVp5MjZSM0EvUVFuaHpJSXgxK2JqSWdHUnZqUm80ZWFMM3RaTG1yYzRC?=
 =?utf-8?B?REpwaktwSHNESUU2TVZNd2JyTGdvaUxKYzhCMkJtOFpYMHB3N0ZTZ0FheGxD?=
 =?utf-8?B?UEd0bjlWS2pKejZ1TTRnN01aN3RwTks5UnNicTdPS29VYm1FeEtxTEJxL0J6?=
 =?utf-8?B?RGVlL0d0RTRQdUlUdDZGZTRRYmR4UUFWUGdyb1VzazEwQ3ErdWxNdHFqRzRT?=
 =?utf-8?B?ZUtGTTBpK0pLZlF5SnMvS29YZzdXV0ZEL2pTMkZUVmxua1Ntc1ZnRGxoRjZt?=
 =?utf-8?B?bVdVSFlYTzNDWHZHNVVna3lsd0oyUTlNV28xQW9tL3F4N1lFNmhuWFhmODBr?=
 =?utf-8?B?blFkNVhJbUxackQ1b0ZzZEdNbXpITUpIUVZrTzNOSjRqUGV4ZHA3b0RyUUxZ?=
 =?utf-8?B?eHBycUV1dUtGQ1pxOWFCS1I5bXV1VmdtQ29xbmJuNWNHekVla0lEQkplNUNP?=
 =?utf-8?B?ZkJXSkVHc0NYWXg1YXBtaXIzUGUzTFRybTFsTWtZTFlGNWFCcmJMVHFvK2lC?=
 =?utf-8?B?VktIZW12MTI4MVBpb2QyWDhITGkydVFuSnRKeEYraVJkTGJCblBqUzdXanhh?=
 =?utf-8?B?SkJVaEdFTHRxT1dWcHpaUlAyWDN1NkZ2aWE1bHRCdHVmTHNGWXFzRGlTOElW?=
 =?utf-8?B?c1RJZjNHOTMrcHVzYVhDNTJLZEVkbXdjY0Q2SEFzYlR3MHkwNzBHV3BvdjF3?=
 =?utf-8?B?UkNON0hvd3JHb09rOUduaStERGZVOEVtY09ob0c5TDdtaUQrNXN0ekZES291?=
 =?utf-8?B?a3R1Z2ZtTExRZnBYK2JRdmdYWTd1UDdmUWU1Mm5JRWtYMmZ2WnU5R1NXa3ho?=
 =?utf-8?B?UnJTbE9kazlBbTB2dVlrZVl0U3czYmd1eXRSUXMzVWtZTWdjbU9UdlJQMXdu?=
 =?utf-8?B?V3grUHU4VXNXbGZhZEsyM2NXSEp3SjNhR21Ud253TEdaOU9Tb082WFNHVHFG?=
 =?utf-8?B?MHJ5UmpxUmxzcS9lUHdlUVg0bm5RaWtaVEJET3hSMUlMSHdURUU3eklWRnE0?=
 =?utf-8?B?OEkxc0dNamt0QkljejExM0pkSmc5OFF4Z0FRWWtMY0J3NTFtQkRmb29IVWxK?=
 =?utf-8?B?VEtPa29qUjBnTlFHT0p1dSt4aVlzRCtxM2dONzZxY3RrclF3ZnlvcGFhamwv?=
 =?utf-8?B?dU11ZUIvY1BidkJCMDJ1OEloeW8xeGUzeFZjZ0ZpNENnUllxejl4NTBXcTBo?=
 =?utf-8?B?TWVveFh6NVAwYzhDb2czL241Q0ZXYVkxQTdDSmNBbjBXZEhLY0Q0ZEdiamc2?=
 =?utf-8?B?b2tOT0pLT2VZVmhxOHhVOGU2VEVSYXgzVmMzUGNBVnFQblZXTkpNUU1uRkdm?=
 =?utf-8?B?WFd2UnFzdURMdTBza0xLYlpoRFV2T1hQZnhMVitKRWxNL2ExNHNHQmRhbUxm?=
 =?utf-8?B?ZTFJQk41dkMzaFhTZXRWSWdnUWtCSjRzUFVtSGlzenFhQW5VT0x2c0pxSjR4?=
 =?utf-8?B?bXBUUHBURlRHeTI1bWtpWUtoVzZWTkRhL0RMVVZvYWwwdjVGaG5oVXRiT3BD?=
 =?utf-8?B?Q3kweEc4ZVM3QWpUd3A1cUM5SnVSWDFFSTVvSGlRMWN3clB2VW5QWVkwcERZ?=
 =?utf-8?B?b1dHUUg0aWpWY3ZVQXNObU0vbHJWM0NKM2s3YUMwTkE4OGhxQi83REVhRmk0?=
 =?utf-8?B?enpTUjFVRFJNcTFUbGZzYkQwQkhHUml4Rkp2NmVIVlltS2tlMVVEKzRVRUpE?=
 =?utf-8?B?dmZHZkxVSHZPUUpnak56NWJjNnFVNS9ZdTNZNU9XWk43b09YTEFSM2lJbUgz?=
 =?utf-8?B?MDRjNUp4K2Fzekl5dzdhWVlibzl1cG5BL2o1VWtwU3NRRVpJcTBFbnVyTkZI?=
 =?utf-8?B?ejRiRThoRDJnOUQxcThlUGUrTXQ2N2lNT3FFOEN4b1VrandRQVdhNnlVRjZX?=
 =?utf-8?B?Y0JDY0tnN2lLVjUvRFNmdnJPTit0Tm54ZnlLZCs5VU5HMVM0Tmk4TVVZa25Q?=
 =?utf-8?B?MEZvc0xVc2VCZXNRekdVcEZlOUo4cTl1OTh3amhqcU5ZQ3R3YXR1aVU0MWhu?=
 =?utf-8?B?eXVkLzE2Rm1jbFhrbnJZZU55UXR3RWQrSkdzUUE5TXpEdUtzaTArNytYT2ZI?=
 =?utf-8?B?VWYrVmw5SThjVDU1ekFFUVRVa3RiY2ZzT1lnbVVUclJRa2RkNHk1VGk2SU54?=
 =?utf-8?B?TDhOUHZUVUYyS2MrZ1gvSEc2VUI2TWsvUGtPVUVkVENJRDBGanlJS2pobjJu?=
 =?utf-8?B?Rkh6VDVldXlNNkQyUHRHYkpQMkhDVnVaL3BDeDJ0K3BxaHFBdUtlbk9xMkxz?=
 =?utf-8?B?eC9tYlUzTWJTckpRLzJzcWZWZnNqcENyU2tKSGhrNEp4SXZPdHZjQ2ljMmhy?=
 =?utf-8?Q?Ujfltehsw30v+8N8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C154325FCEAC34B8F16E19BAB845997@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaff486a-a584-4041-1a02-08da3f647050
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2022 22:09:43.9611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k99WbapTWPckdHIrPDqadlqHYU1rHdkMQ6oyxbVsRf1rmYrQoSnv+gml9UYLaTBU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR1501MB2192
X-Proofpoint-ORIG-GUID: FRvDffIacWslBu0QOYALpAzow7uugnGq
X-Proofpoint-GUID: FRvDffIacWslBu0QOYALpAzow7uugnGq
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-26_11,2022-05-25_02,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=6145d9b475=pdel@fb.com; helo=mx0b-00082601.pphosted.com
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

SGV5IFFFTVUgZGV2ZWxvcGVycywNCg0KQ2VkcmljIG1lbnRpb25lZCBoZXJlWzFdIHRoYXQgUUVN
VSBjYW4gc3VwcG9ydCBlbXVsYXRpbmcgYQ0KbW9yZSBjb21wbGV0ZSBib2FyZCwgZS5nLiBhIG1h
Y2hpbmUgd2l0aCBhbiBBU1QyNjAwICphbmQqIGFuIEFTVDEwMzAuDQoNCkkgcmVhZCB0aHJvdWdo
IHRoZSBtZW1vcnkgQVBJIGRvY3NbMl0gYW5kIGl0IG1vc3RseSBtYWtlcyBzZW5zZSB0byBtZSwN
CmJ1dCB3aGF0IEkgZG9u4oCZdCB1bmRlcnN0YW5kIGlzLCB3aGF0IGRvZXMgc3lzdGVtX21lbW9y
eSByZXByZXNlbnQ/DQpPciwgd2hhdCBzaG91bGQgdGhlIGxheW91dCBiZSBmb3IgYSBzaXR1YXRp
b24gbGlrZSBJ4oCZbSBpbnRlcmVzdGVkIGluLA0Kd2hlcmUgeW91IGhhdmUgYW4gQVNUMjYwMCBh
bmQgYW4gQVNUMTAzMCAoYW5kIGFjdHVhbGx5LCBtYXliZSBldmVuDQphbiB4ODYgQ1BVIHRvbz8g
aWRrIGlmIHRoYXQgd291bGQgYmUgcG9zc2libGUpLg0KDQpJIG5lZWQgdG8gbWFrZSBzdXJlIGVh
Y2ggU29DIHJ1bnMgaW4gYSBkaWZmZXJlbnQgYWRkcmVzcyBzcGFjZSwgcmlnaHQ/DQpCdXQsIGhv
dyBkbyBJIGFjdHVhbGx5IGRvIHRoYXQ/IERvIEkgbW9kZWwgaXQgYXMgdHdvIGNvbnRhaW5lcnMg
aW5zaWRlDQp0aGUgbGFyZ2Ugc3lzdGVtX21lbW9yeSBjb250YWluZXIsIG9yIGFzIHR3byBkaWZm
ZXJlbnQgY29udGFpbmVycw0KdGhhdCBnZXQgc3dhcHBlZCBpbiBmb3Igc3lzdGVtX21lbW9yeSB3
aGVuIGV4ZWN1dGluZyB0aGVpciBhc3NvY2lhdGVkDQpDUFU/DQoNCkkgd2FzIGhhdmluZyB0cm91
YmxlIGZpZ3VyaW5nIG91dCB3aGF0IHRoZSBYaWxpbnggYm9hcmRzIGFyZSBhY3R1YWxseQ0KZG9p
bmcgaW4gdGhpcyBjYXNlLiBEb2VzIGVhY2ggQ1BVIHNoYXJlIHBlcmlwaGVyYWxzLCBvciBhcmUg
dGhlDQpBICsgUiBjcHXigJlzIGFjdHVhbGx5IGluIHNlcGFyYXRlIGFkZHJlc3Mgc3BhY2VzPyBJ
4oCZbSB2ZXJ5IGNvbmZ1c2VkIGxvbC4NCg0KSWYgYW55b25lIGNhbiBwcm92aWRlIHN1Z2dlc3Rp
b25zLCB0aGV5IHdvdWxkIGJlIGdyZWF0bHkgYXBwcmVjaWF0ZWQhDQoNClRoYW5rcywNClBldGVy
DQoNClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9xZW11LWRldmVsLzJhYjQ5MGEyLTg3NWQt
YWU4Mi0zOGQwLTQyNTQxNWY5ODE4Y0BrYW9kLm9yZy8NClsyXSBodHRwczovL3d3dy5xZW11Lm9y
Zy9kb2NzL21hc3Rlci9kZXZlbC9tZW1vcnkuaHRtbA==

