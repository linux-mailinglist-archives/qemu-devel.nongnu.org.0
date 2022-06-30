Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C45D560EC1
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 03:46:24 +0200 (CEST)
Received: from localhost ([::1]:55054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6jGA-0006YQ-OR
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 21:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8180d05c58=pdel@fb.com>)
 id 1o6jDr-0005c6-FW; Wed, 29 Jun 2022 21:43:59 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:33334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8180d05c58=pdel@fb.com>)
 id 1o6jDo-0002OE-H0; Wed, 29 Jun 2022 21:43:58 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25U0LsqM022527;
 Wed, 29 Jun 2022 18:43:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=V125amGS0dn00Fcj8WZvWO1uxkYjLFkrHcvxSUWY5UU=;
 b=T8d0ZHe9l89BVV6i+F5/1C3XzIxQ/wh6GNujRPbI4x3lmp7grgg6PUcaFhpGOU3/i3H8
 oAepYbyDjrj/P4ASCRiyFBnzi7Y8/ETIH5S0qBzQniVnysmiRmdPeZEI0FOSr80Jb2Iv
 i4ddjFXvI7Y/cpwMwyXETelrnLpe8w1okN0= 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2048.outbound.protection.outlook.com [104.47.73.48])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3h0dgqqc79-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jun 2022 18:43:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URCDwVJqqzB3OmDkmw4y58FBlKNGe5qvLzCNR22VOuNIatpZzm03OC3/BX1owiMeLaKt/QEwgL7JZz6GnEZNICmS1QhJb9p5tD6gThi68bm8RotjoFc4YmQCfYDjuE+7FzaSaG5Hd/33Qxi8P+a9a0kcypdoS+PSZxrCQldPzFmVc+Im9InmDZCe/EI0Ol1DtU5FX3s/96YF2koiBcU9lyoqun1LeDCtR9wH627uH+7rZfQpEOrcq563N+n9cTvcwqQT6Mn/Wjzf3ga7gstt1RfmAM4ibdtDEJs2l3EvA5ijwyTu28Aae9ldUW4uKL/epu5Tz2C4hHOWk4VPj8U9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V125amGS0dn00Fcj8WZvWO1uxkYjLFkrHcvxSUWY5UU=;
 b=LhP6lkadq/XDlX7VkDmi1dggFbWuCG3hl7ds1T6VkBWdsLmV3mTVVMGFA03cKusQO4deQOvwc2zeXefs0rhcsi/MYvlYLemrHxGIfzVeiLUr4+MYG/SL3011H/TQxQtjXhgLnhL8e907O5rMOr1mIFaCc6IMKxBBz9pAxPPfJy9zhxaRB0MnF7oBIuWw0gMBZDDrInGRSRA4HNrQGwS9l24L2uPSuqr0NitBwmXfoWjdm9fnMMxdte+3662DyPEFd5mGby9tLOvePs8Xc5sWGtaegAUMZXteUhIdghp9/m+WESQVu6R+cCCx4M3WA4WE5w6mxPtVT/3xxSeDJm8Zlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BN6PR15MB1201.namprd15.prod.outlook.com (2603:10b6:404:ef::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 01:43:33 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134%6]) with mapi id 15.20.5373.018; Thu, 30 Jun 2022
 01:43:33 +0000
From: Peter Delevoryas <pdel@fb.com>
To: Titus Rwantare <titusr@google.com>
CC: Peter Delevoryas <pdel@fb.com>, Peter Delevoryas
 <peterdelevoryas@gmail.com>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Corey Minyard
 <cminyard@mvista.com>, Cameron Esfahani via <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Dan Zhang <zhdaniel@fb.com>
Subject: Re: [PATCH v2 08/13] hw/i2c/pmbus: Reset out buf after switching pages
Thread-Topic: [PATCH v2 08/13] hw/i2c/pmbus: Reset out buf after switching
 pages
Thread-Index: AQHYi2l1yvqyqeIKnkisbiT1qXOryq1mrrUAgAAGpYCAAHlvAA==
Date: Thu, 30 Jun 2022 01:43:32 +0000
Message-ID: <A63336DA-4740-4115-9733-B9AB53961848@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
 <20220629033634.3850922-9-pdel@fb.com>
 <CAMvPwGqWr2yj6nZAnFn_pXnH+dNRHtJ_qTsaJQv_OqR5sgf3yA@mail.gmail.com>
 <07AE0263-98F0-4739-8CC6-0361A30D1C53@fb.com>
In-Reply-To: <07AE0263-98F0-4739-8CC6-0361A30D1C53@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33edbe7a-ed9c-4e53-58b7-08da5a39f112
x-ms-traffictypediagnostic: BN6PR15MB1201:EE_
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IN0+IC6PB37aaBDRDMZjDPEvJs2ROSV+Q9xsTV4jkgzbahe5ui4c+NgkBEMK8/SEAFAML2Ca6X+PTCoW38OO+jLpQJcjIQvDsZoG7ZVrW6cIKxp3rxe/BqFjReFKZQVdXeMACvp696n3xm7EXNd4J9nFY++R0Yz0lIbKpBEvUsw7KTADxr8wFXliZyxxpJe3/hKLAJr1xzZ3Ucd5aRfO8dQePePgJvHLlxqlMHqIpmtEn8JEgEB07CMhkNPapJ7xpS37CD6H1ega1ri2vhhYTsIVE34J585+reT4JbQKmD0fnp987Osqs12Gc8w1nJ/u5SEmr5glzgrPLmOsJK976eTHHKbkZv0At9gtc49tmPoS/gvPiBkw+pg029DP+6mg6LHYAIAMVhnkOulS/QvmXobYveR97NUeECm8qXf7NgEK98Jjj3HxB97BpRjiWtBPkzh4MNYxLpm622CXahlB9QAU7b89wQauLfO764P30SWPZQrqkRt5at2pEpnubKTC/czF0/UPME8NKChsldr4LTfeF32V3AF8mOUFWq23gTf6s7ZDbJHK/q3ht8Hkh4LZbiKwOLHHxZwgTGCZznzKBZ524kNwe/0VQIXmfsU/ZKK06KE9PGoqAHIGc/6m21Ca5S839MrfnGMUk0+FlkB71ZLP+o4Sny/A8yxjcyH0v9+AAnc/3MfeNWmBkvdnHhUTJCWZsYDLOSa8Q1WO0qa5h72oiNFIqxH5+rzI9bhcyacGjoU+3Zyeadv1/Pnbvn6vsoNIeHohdFaJFH0l1etcvJYkrMyQo+KiOw11zeDWUB0WzTadvibA6SBOfwOVXkj8J/VpqjJZVMrEbQm42hsKCjBLvGhEfrJsytr+DnxyBTw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(8936002)(64756008)(8676002)(66946007)(5660300002)(66476007)(4326008)(66446008)(6512007)(66556008)(2906002)(86362001)(36756003)(6486002)(122000001)(966005)(38100700002)(478600001)(71200400001)(76116006)(316002)(38070700005)(6916009)(33656002)(186003)(54906003)(41300700001)(2616005)(53546011)(6506007)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VksyaTNYS0FzT3JmbC9LVU1NVzZTcEhyVjJoSG5NV3BhUmYxbnRkRnhIUHVG?=
 =?utf-8?B?dWhQakJtWmVaVTBtUmErR01ibzIrUHBhdkJTR3BlL2JlRDZLUEdldTJhcThR?=
 =?utf-8?B?SHVud0JOTzhBeWpWUkR1Qk9QbFZ6MC9zcGtQeEVBRzhMY3U4a3F6U1huUkt0?=
 =?utf-8?B?ZVZLM1lzMnBqS1JyYkw5UFNNaStEVkplU1c4cnR0YnRDUG5aYmIvdjhiYmxL?=
 =?utf-8?B?WWhEQk16WGNoSkNNRHdKU1V3em9RKzJ0Zk5sQWp5ZnJRWWl3RVJCbkFCcEVq?=
 =?utf-8?B?Z1pCSFlGTGtCRGMreDFHZzd0VUtZeWx4bFdTUHpYZW1QOXBTVW1WRWNQbmtr?=
 =?utf-8?B?bXdvR0JFVFN5alZDMnA5N0Y5YmZhc1k1ZUkyNDJqQkdESHh0Yms3bEYxbVJz?=
 =?utf-8?B?Y09Nb3pBZk9uNU1Ma2gxRHpEZDNCL052N05ka2w0ayswV0Q5TFNJdUVLZTdT?=
 =?utf-8?B?cTBLS0VUenkrOTk3WVpwMjEzVTE0aitTenZqQWZTTFFIaWRuT2I1OGh6VSsz?=
 =?utf-8?B?NzNQeDYrcVE2VVFjTHVQeEZYTHZva3ZuWjlxN3Vlc2ZQaEN6enVucnBLQ1c2?=
 =?utf-8?B?SlA4Q29IZWFkblhiaTV4TitwVHErTE15alp0NTZKZmlIQi9kb1A3aXlMR3J1?=
 =?utf-8?B?WUdOVTNNNEIrK3V2UlViRW1GWjB4QXhseFNKamxnT2VSMjhnMkJNTXNPZ05O?=
 =?utf-8?B?MG9QalVxNHFUK25TaG81c0czWG9DSDZGSnFTNEdLQk5OR1hBazNGWVBrekdD?=
 =?utf-8?B?N2c2SDhHd09ReFdSYzdsclRHUFdzc3kzcStoWEFUejJxMWVVM1JrVlRYOElp?=
 =?utf-8?B?WFgyZGpvY1NkUVh3V2lxVTVobVJKRVk3K1NwSTAzb3VDR3hhYTdTbU54akd0?=
 =?utf-8?B?cHF4STFzUzlhVCt2Tnd4eU5XUzRDZDVMa1A4b0dOUkF5WWtKdG9CQWpaZ1Bh?=
 =?utf-8?B?R2dlOU02ckVRS0VBOGI4T1R3SjYzQTNYTHVrNm51U293Z21DZW16MFpBUWtT?=
 =?utf-8?B?djFkVzQvcEFmZEIwUDI3eGtWZGo4VjZzVUEzeVB5TzE1L0QvRVdXZzZQL0xV?=
 =?utf-8?B?U2t6QmNQbHkwT01LVXBYV1U2K2FWT3pFNUlGU1RDRThabzZZanc1WDdkTXBY?=
 =?utf-8?B?RFhVVGZRZFMxdlRJOG5PLzJGaXRxTmFWY1BiVWpxU3dXeEpQYitCTHZXZURF?=
 =?utf-8?B?NzdLMW9ubVV0RXhUcStaMGVSdmZaK1NoRmx0TVRTdzQvZm81RTRyMGpCM2Ez?=
 =?utf-8?B?NlFzMHZlNU5Yc2JpTTBOOHg3Smd5RzFwWTJRbW5OcEg3MmJZSTF3dnBhelJM?=
 =?utf-8?B?MnNHZHJab0pJZlNKMXlteEhwSmxVWWNWdTdZRGk3ZlU5NGI3ZVJNd2I0QldS?=
 =?utf-8?B?YTUrMEVZeGN0MlVqaGRONndYRFdoNGJkZ3NWU2Y0dUEra0J0TUJOVzdtLzdi?=
 =?utf-8?B?VDFvVlFPQWd4NUkyNVQ1RFRia05XWWtwaXFkcmN3Z3NjMUZ1SzFTZlJOTVZh?=
 =?utf-8?B?OGhha2tnbDdHY3M3OWdZa2pxMmc1M3hZVjZkaithMk5QOGo1RXc0d1JkWGN1?=
 =?utf-8?B?aDB0UHBFUHpyVkxGZ1BqRkhKeWxpa09tbjVBSVhpWTErNWl5eERyM0JoNHF0?=
 =?utf-8?B?ZWR0anBKMnpKUGZMeS9TQ05YOG1mSzVHYTRSMHBySzdwSW1xNEVNR1hCcHFp?=
 =?utf-8?B?REFoZHZRNGFUb2xhcStvN1AySUhoODRGMWs4Y0sxRmw5b01jK2RaUWh5TEVH?=
 =?utf-8?B?cjVSWFAzYUFSMEI2dUdYa0N2MUJIK3dURDJ2WEZMQW9UNklUSXFkdTV6VGV2?=
 =?utf-8?B?MU4ranEvcWxTRy9kb0E2MC8xMDJra1VwSzVUMnJKcW9LeXhFVFA4MWxOZGVM?=
 =?utf-8?B?N1ZqUVlkczVJMHZORys1bVlLTkZ0c3hPM05nYXlRVER0RW5RR3B4K245Y1E0?=
 =?utf-8?B?a3V3Y1pmNkFTa3I3ODFzcnpmT2c4OTdqbW1OV25tZmpKSlM4b2hCdG9hYXlQ?=
 =?utf-8?B?WWFGNE54MTBQVjJlZFZqTzRlUkc1RGJTMDVKM1lDRVk2Rk5kRFhnWWpzZGJS?=
 =?utf-8?B?N01nNm84TE1LN3FDam5iU1JHaEtVK1EvaGlCQ3MzdGt5MjYxbURuOVRzcDNV?=
 =?utf-8?B?eXRsZ0h5eGpTNjMra2w3UjE0cHpobmx4VG5Fdm5yc1B0by94bS9ISzFFakFk?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5495431DB827DC41A7D0AE379F7784A3@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33edbe7a-ed9c-4e53-58b7-08da5a39f112
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 01:43:32.9868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cXeg+Co7rbQ1M1PgUIrKM5vZFMOxth2Jg9g2WDrDLgCdkZ6NEUD3eDuYNZNIGV48
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR15MB1201
X-Proofpoint-ORIG-GUID: cHzrJpoHXnMyib3zKvZfae7Wu4cIu6lN
X-Proofpoint-GUID: cHzrJpoHXnMyib3zKvZfae7Wu4cIu6lN
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-29_24,2022-06-28_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=8180d05c58=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

DQoNCj4gT24gSnVuIDI5LCAyMDIyLCBhdCAxMToyOCBBTSwgUGV0ZXIgRGVsZXZvcnlhcyA8cGRl
bEBmYi5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gSnVuIDI5LCAyMDIyLCBhdCAxMTow
NSBBTSwgVGl0dXMgUndhbnRhcmUgPHRpdHVzckBnb29nbGUuY29tPiB3cm90ZToNCj4+IA0KPj4g
T24gVHVlLCAyOCBKdW4gMjAyMiBhdCAyMDozNiwgUGV0ZXIgRGVsZXZvcnlhcw0KPj4gPHBldGVy
ZGVsZXZvcnlhc0BnbWFpbC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IFdoZW4gYSBwbWJ1cyBkZXZp
Y2Ugc3dpdGNoZXMgcGFnZXMsIGl0IHNob3VsZCBjbGVhcnMgaXRzIG91dHB1dCBidWZmZXIgc28N
Cj4+PiB0aGF0IHRoZSBuZXh0IHRyYW5zYWN0aW9uIGRvZXNuJ3QgZW1pdCBkYXRhIGZyb20gdGhl
IHByZXZpb3VzIHBhZ2UuDQo+Pj4gDQo+Pj4gRml4ZXM6IDM3NDZkNWMxNWU3MDU3MGIgKCJody9p
MmM6IGFkZCBzdXBwb3J0IGZvciBQTUJ1c+KAnSkNCj4+PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBE
ZWxldm9yeWFzIDxwZGVsQGZiLmNvbT4NCj4+PiAtLS0NCj4+PiBody9pMmMvcG1idXNfZGV2aWNl
LmMgfCAxICsNCj4+PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4+PiANCj4+PiBk
aWZmIC0tZ2l0IGEvaHcvaTJjL3BtYnVzX2RldmljZS5jIGIvaHcvaTJjL3BtYnVzX2RldmljZS5j
DQo+Pj4gaW5kZXggNjI4ODVmYTZhMS4uZWZkZGMzNmZkOSAxMDA2NDQNCj4+PiAtLS0gYS9ody9p
MmMvcG1idXNfZGV2aWNlLmMNCj4+PiArKysgYi9ody9pMmMvcG1idXNfZGV2aWNlLmMNCj4+PiBA
QCAtMTA4OCw2ICsxMDg4LDcgQEAgc3RhdGljIGludCBwbWJ1c193cml0ZV9kYXRhKFNNQnVzRGV2
aWNlICpzbWQsIHVpbnQ4X3QgKmJ1ZiwgdWludDhfdCBsZW4pDQo+Pj4gDQo+Pj4gaWYgKHBtZGV2
LT5jb2RlID09IFBNQlVTX1BBR0UpIHsNCj4+PiBwbWRldi0+cGFnZSA9IHBtYnVzX3JlY2VpdmU4
KHBtZGV2KTsNCj4+PiArIHBtZGV2LT5vdXRfYnVmX2xlbiA9IDA7DQo+Pj4gcmV0dXJuIDA7DQo+
Pj4gfQ0KPj4+IA0KPj4gDQo+PiBJIHN1c3BlY3QgeW91IHdlcmUgcnVubmluZyBpbnRvIHRoaXMg
YmVjYXVzZSBpY19kZXZpY2VfaWQgd2FzIHB1dHRpbmcNCj4+IHRvbyBtdWNoIGRhdGEgaW4gdGhl
IG91dHB1dCBidWZmZXIuIFN0aWxsLCBJIHdvdWxkbid0IHdhbnQgdGhlIGJ1ZmZlcg0KPj4gY2xl
YXJlZCBpZiB0aGUgcGFnZSBoYXNuJ3QgY2hhbmdlZC4gU29tZSBkcml2ZXJzIHdyaXRlIHRoZSBz
YW1lIHBhZ2UNCj4+IGJlZm9yZSBldmVyeSByZWFkLg0KPiANCj4gWWVzIHlvdeKAmXJlIGNvcnJl
Y3Q6IHRoaXMgaXMgdGhlIGNvZGUgdGhhdCB3YXMgcXVlcnlpbmcgdGhlIGljX2RldmljZV9pZCBb
MV06DQo+IA0KPiBtZW1zZXQoJm1zZywgMCwgc2l6ZW9mKG1zZykpOw0KPiBtc2cuYnVzID0gc2Vu
c29yX2NvbmZpZ1tpbmRleF0ucG9ydDsNCj4gbXNnLnRhcmdldF9hZGRyID0gc2Vuc29yX2NvbmZp
Z1tpbmRleF0udGFyZ2V0X2FkZHI7DQo+IG1zZy50eF9sZW4gPSAxOw0KPiBtc2cucnhfbGVuID0g
NzsNCj4gbXNnLmRhdGFbMF0gPSBQTUJVU19JQ19ERVZJQ0VfSUQ7DQo+IGlmIChpMmNfbWFzdGVy
X3JlYWQoJm1zZywgcmV0cnkpKSB7DQo+IHByaW50ZigiRmFpbGVkIHRvIHJlYWQgVlIgSUNfREVW
SUNFX0lEOiByZWdpc3RlcigweCV4KVxuIiwgUE1CVVNfSUNfREVWSUNFX0lEKTsNCj4gcmV0dXJu
Ow0KPiB9DQo+IA0KPiBCeSBzZW5kaW5nIGEgYnVmZmVyIHRoYXQgd2FzIHdheSBsYXJnZXIgdGhh
biB0aGUgcnggYnVmZmVyIG9mIDcsIGl0IHdhcw0KPiBsZWF2aW5nIHN0dWZmIGx5aW5nIGFyb3Vu
ZCBmb3IgdGhlIG5leHQgcXVlcnkuDQo+IA0KPiBJ4oCZbGwgdGVzdCBpdCBvdXQgYW5kIHNlZSB3
aGF0IGhhcHBlbnMgaWYgSSBmaXggdGhlIElDX0RFVklDRV9JRCBsZW5ndGgNCj4gdHJhbnNtaXR0
ZWQgYnkgdGhlIElTTDY5MjU5IHRvIDQsIG1heWJlIHdlIGRvbuKAmXQgbmVlZCB0aGlzIHBhdGNo
LiBCdXQsDQo+IGF0IHRoZSB2ZXJ5IGxlYXN0LCBJ4oCZbGwgbWFrZSBzdXJlIHRvIGdhdGUgdGhp
cyBvbiB0aGUgcGFnZSB2YWx1ZSBjaGFuZ2luZywNCj4gbm90IGp1c3QgYmVpbmcgc2V0Lg0KDQpI
bW1tLCBhY3R1YWxseSBJ4oCZbSBub3QgZ29pbmcgdG8gY2hhbmdlIHRoaXMuIEl0IHNlZW1zIHRo
YXQgb3VyIFplcGh5ciBjb2RlDQppcyBhY3R1YWxseSBxdWVyeWluZyBvbmUgb2Ygb3VyIGRldmlj
ZXMgbXVsdGlwbGUgdGltZXMsIHNldHRpbmcgdGhlIHBhZ2UNCnRvIHplcm8gYmVmb3JlIGVhY2gg
cmVhZCwgYW5kIGV4cGVjdGluZyBpdCB0byByZXR1cm4gdGhlIGRldmljZSBJRCB3aXRob3V0DQph
bnkgd3JhcHBpbmcuIElmIGl0IHdhcyBvbmx5IHJlc2V0dGluZyB0aGUgb3V0cHV0IGJ1ZmZlciBv
biBwYWdlDQpjb21tYW5kcyB0aGF0IGNoYW5nZSB0aGUgdmFsdWUgb2YgdGhlIHBhZ2UsIHRoZW4g
dGhlIFplcGh5ciBjb2RlDQp3b3VsZG7igJl0IHdvcmsuIEkgYWxzbyBhZGRlZCBzb21lIHByaW50
aW5nIGFuZCB0ZXN0ZWQgaXQgb24gc29tZSBoYXJkd2FyZToNCg0KY2hlY2tfdnJfdHlwZTogaTJj
NCA3NiBwYWdlIDAwIFswNCAwMCA4MSBkMiA0OSA1NiBmZl0NCmVuZHBvaW50DQpjaGVja192cl90
eXBlOiBpMmM0IDc2IHBhZ2UgMDEgWzA0IDAwIDgxIGQyIDQ5IDU2IGZmXQ0KDQpbMDA6MDA6MDAu
DQpjaGVja192cl90eXBlOiBpMmM0IDYwIHBhZ2UgMDAgWzA0IDAwIDgxIGQyIDQ5IDNjIGZmXQ0K
MDAzLDAwMF0NCmhlY2tfdnJfdHlwZTogaTJjNCA2MCBwYWdlIDAxIFswNCAwMCA4MSBkMiA0OSAz
YyBmZl0NCm08aW5mPiB1c2JfZA0KY2hlY2tfdnJfdHlwZTogaTJjNCA2MiBwYWdlIDAwIFswNCAw
MCA4MSBkMiA0OSBkNCBmZl0gPDw8PDwNCmNfYXNwZWVkOiBzZQ0KY2hlY2tfdnJfdHlwZTogaTJj
NCA3NiBwYWdlIDAwIFswNCAwMCA4MSBkMiA0OSA1NiBmZl0NCmxlY3QgZXBbMHgzXQ0KY2hlY2tf
dnJfdHlwZTogaTJjNCA3NiBwYWdlIDAxIFswNCAwMCA4MSBkMiA0OSA1NiBmZl0NCiBhcyBPVVQg
ZW5kcA0KY2hlY2tfdnJfdHlwZTogaTJjNCA2MCBwYWdlIDAwIFswNCAwMCA4MSBkMiA0OSAzYyBm
Zl0NCm9pbnQNClswDQpjaGVja192cl90eXBlOiBpMmM0IDYwIHBhZ2UgMDEgWzA0IDAwIDgxIGQy
IDQ5IDNjIGZmXQ0KMDowMDowMC4wNTksDQpjaGVja192cl90eXBlOiBpMmM0IDYyIHBhZ2UgMDAg
WzA0IDAwIDgxIGQyIDQ5IGQ0IGZmXSA8PDw8PA0KMDAwXSA8aW4NCmNoZWNrX3ZyX3R5cGU6IGky
YzQgNzYgcGFnZSAwMCBbMDQgMDAgODEgZDIgNDkgNTYgZmZdDQpmPiBrY3NfYXNwZWUNCmNoZWNr
X3ZyX3R5cGU6IGkyYzQgNzYgcGFnZSAwMSBbMDQgMDAgODEgZDIgNDkgNTYgZmZdDQpkOiBLQ1Mz
OiBhZGQNCmNoZWNrX3ZyX3R5cGU6IGkyYzQgNjAgcGFnZSAwMCBbMDQgMDAgODEgZDIgNDkgM2Mg
ZmZdDQpyPTB4Y2EyLCBpZHINCmNoZWNrX3ZyX3R5cGU6IGkyYzQgNjAgcGFnZSAwMSBbMDQgMDAg
ODEgZDIgNDkgM2MgZmZdDQo9MHgyYywgb2RyPTANCmNoZWNrX3ZyX3R5cGU6IGkyYzQgNjIgcGFn
ZSAwMCBbMDQgMDAgODEgZDIgNDkgZDQgZmZdDQp4MzgsIHN0cj0weDQNCmNoZWNrX3ZyX3R5cGU6
IGkyYzQgNzYgcGFnZSAwMCBbMDQgMDAgODEgZDIgNDkgNTYgZmZdDQo0DQoNClswMDoNCmNoZWNr
X3ZyX3R5cGU6IGkyYzQgNzYgcGFnZSAwMSBbMDQgMDAgODEgZDIgNDkgNTYgZmZdDQowMDowMC4w
NTksMDANCmNoZWNrX3ZyX3R5cGU6IGkyYzQgNjAgcGFnZSAwMCBbMDQgMDAgODEgZDIgNDkgM2Mg
ZmZdDQowXSA8ZQ0KY2hlY2tfdnJfdHlwZTogaTJjNCA2MCBwYWdlIDAxIFswNCAwMCA4MSBkMiA0
OSAzYyBmZl0NCg0KQ29ycmVjdCBtZSBpZiBJ4oCZbSB3cm9uZywgYnV0IEkgdGhpbmsgdGhlIFZS
IGF0IDB4NjINCmlzIGdldHRpbmcgcXVlcmllZCBtdWx0aXBsZSB0aW1lcywgYW5kIHJlc2V0dGlu
ZyB0aGUNCnBhZ2UgaXMgY2F1c2luZyBpdCB0byBnbyBiYWNrIHRvIHRoZSBzdGFydC4NCg0KQWxz
bywgaGVyZeKAmXMgYW4gZXhhbXBsZSB3aGVyZSBJIHJlbW92ZWQgdGhlIHByZS1yZWFkDQpwYWdl
LXNldCBjb21tYW5kIGFuZCBpbmNyZWFzZWQgdGhlIG91dHB1dCBidWZmZXIgc2l6ZQ0KdG8gNjQ6
DQoNCmhlY2tfdnJfdHlwZTogaTJjNCA2MiBwYWdlIDAwIFswNCAwMCA4MSBkMiA0OSBkNCBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmDQpmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
XQ0KMDA6MDA6MDAuMDAzLDAwMF0gPGluZj4gdXNiX2RjX2FzcA0KY2hlY2tfdnJfdHlwZTogaTJj
NCA3NiBwYWdlIDAwIFswNCAwMCA4MSBkMiA0OSA1NiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmDQpmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmXQ0KZWVkOiBzZWxlY3QgZXBbMHgz
XSBhcyBPVVQgZW5kcG9pbnQNCmhlY2tfdnJfdHlwZTogaTJjNCA3NiBwYWdlIDAwIFswNCAwMCA4
MSBkMiA0OSA1NiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZg0K
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmXQ0KbQ0KWzAwOjAwOjAwLjA1OSwwMDBdIDxpbmY+IGtjc19hc3ANCmNo
ZWNrX3ZyX3R5cGU6IGkyYzQgNjAgcGFnZSAwMCBbMDQgMDAgODEgZDIgNDkgM2MgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZg0KZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZl0NCmVl
ZDogS0NTMzogYWRkcj0weGNhMiwgaWRyPTB4MmMsIG9kcj0wDQpjaGVja192cl90eXBlOiBpMmM0
IDYwIHBhZ2UgMDAgWzA0IDAwIDgxIGQyIDQ5IDNjIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGYNCmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmZdDQp4MzgsIHN0cj0weDQ0DQoNClsw
MDowMDowMC4wNjAsMDAwXQ0KY2hlY2tfdnJfdHlwZTogaTJjNCA2MiBwYWdlIDAwIFswNCAwMCA4
MSBkMiA0OSBkNCBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmDQpm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmXQ0KIDxlcnI+IHNwaV9ub3JfbXVsdGlfZGV2OiBbMTIxNg0KY2hlY2tf
dnJfdHlwZTogaTJjNCA3NiBwYWdlIDAwIFswNCAwMCA4MSBkMiA0OSA1NiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmDQpmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmXQ0KXVtzcGkx
X2NzMF1TRkRQIG1hZ2ljIDAwMDAwMDAwIGludmFsaWQNCmNoZWNrX3ZyX3R5cGU6IGkyYzQgNzYg
cGFnZSAwMCBbMDQgMDAgODEgZDIgNDkgNTYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZg0KZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZl0NCg0KWzAwOjAwOjAwLjA2MCwwMDBdIDxl
cnI+IHMNCmNoZWNrX3ZyX3R5cGU6IGkyYzQgNjAgcGFnZSAwMCBbMDQgMDAgODEgZDIgNDkgM2Mg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZg0KZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZl0NCnBpX25vcl9tdWx0aV9kZXY6IFsxNDU2XVNGRFAgcmVhZCBmYWlsZQ0KY2hlY2tfdnJf
dHlwZTogaTJjNCA2MCBwYWdlIDAwIFswNCAwMCA4MSBkMiA0OSAzYyBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmDQpmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmXQ0KDQpTbywgYWN0
dWFsbHksIGl0IHNlZW1zIGxpa2UgdGhlIElDX0RFVklDRV9JRA0KaXMgNiBieXRlcyAoSSBvbmx5
IGhhZCA1KSwgYW5kIHRoZXJl4oCZcyBubw0Kd3JhcHBpbmcgYmVoYXZpb3IuIFBlcmhhcHMgSSBk
b27igJl0IG5lZWQgdG8NCmFkZCB0aGlzLCBhbmQgaW5zdGVhZCBJIHNob3VsZCByZW1vdmUgdGhl
DQp3cmFwcGluZyBiZWhhdmlvciBmb3IgdGhlIElTTDY5MjU5PyBJ4oCZbSBub3QNCnN1cmUgd2hh
dCB0aGUgYmVoYXZpb3IgaXMgZm9yIG90aGVyIGtpbmRzDQpvZiBQTUJVUyBkZXZpY2VzIG9yIHZv
bHRhZ2UgcmVndWxhdG9ycy4NCg0KVGhhbmtzLA0KUGV0ZXINCg0KPiANCj4gVGhhbmtzIGZvciB0
aGUgcmV2aWV3LCB0aGlzIHdhcyByZWFsbHkgdXNlZnVsLiBJ4oCZbSBub3QgdmVyeSBmYW1pbGlh
cg0KPiB3aXRoIHBtYnVzIGRldmljZXMuDQo+IA0KPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2Zh
Y2Vib29rL09wZW5CSUMvYmxvYi9jZGE0YzAwYjAzMmIxZDljOWI5NGM0NWZhYTJjMGVjYTQ4ODZh
MGEzL21ldGEtZmFjZWJvb2sveXYzNS1jbC9zcmMvcGxhdGZvcm0vcGxhdF9zZW5zb3JfdGFibGUu
YyNMMzMyLUwzNTUNCj4gDQo+PiANCj4+IFRpdHVzDQoNCg==

