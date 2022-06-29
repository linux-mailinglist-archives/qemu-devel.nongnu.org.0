Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B2B56093D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 20:36:02 +0200 (CEST)
Received: from localhost ([::1]:47608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6cXg-0002yM-JM
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 14:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8179e10d56=pdel@fb.com>)
 id 1o6cOf-0007Z0-Fk; Wed, 29 Jun 2022 14:26:41 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:51638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8179e10d56=pdel@fb.com>)
 id 1o6cOZ-0007qE-L1; Wed, 29 Jun 2022 14:26:40 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25TIGKim009211;
 Wed, 29 Jun 2022 11:26:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=wUJRqNdiWYAzJ3CqEqeidodDawTniAwf+togWMAyWJs=;
 b=p+PcOUs3EjHhJwdamjjLmVZJ8ghPtCtPSKoPE7/CEKTeyupf7kVOoh3cZxzRe9PkUdsm
 QaZGyCd4SdQ+kfphtMddJ2fXdeOz/u1ZzBWzR52Y1P/Z6rLIkdMODd3SQGykBhfg8/N/
 ESs/IjRZnLRNKeDS7I87ZfKsSxyIpjYYyT8= 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3h0uv4r25m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jun 2022 11:26:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHNzfMGHgYPApA/STZDbYPZ2EQtkf+Ger2sSHRwzFmVyDyBwryESVsFjBypgEfTnhgr3GDcishxCOZrzgQ1Wp6fSZzEhCPNn5oB3r6jpas/BUr2dAvC5LJIEb7tA9dLFosLsxR5QluKxpwinIzYNPEntP0hwEu2TYUkDFk/gH6HCf8akCBpfaAXjpRXxhJTQy1NMt/M2+nQoQ9YZerQaMLnDwWSPwQfzXR8uKCVdA6WboQU3/mDYpk87b2ROtxGCI6OgEO1mULqxZHn7mJdbgz+uhXr/jRC+FRX2pvelKQyPfFdIxZSzPjALjh1SG47zjiY2J6XJZkuHdqsPAT76QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUJRqNdiWYAzJ3CqEqeidodDawTniAwf+togWMAyWJs=;
 b=SO+TIoLKkRyEv3KPHbQdolISLxvxlkj4ws0E6YE+RMNoMvnwZApvohzc/m4rKtFMk3/eVcdO8WX/eD9aFoiNiO1MdPVbSoRqhWCy224nbXac7If62yCVUrqXHba+yRgBju6EBddj2jsI7LGhUXmIUlgNaW95Ve9NEYp8U942aoeHsqn0S70uWNvdrQp51o/Tm9jhaAMq5RlZg2DBaN3ez89Syptyf8qHvXdk+MzM4krQ+s3z+zsIhx+GDw0Q5hveARahrHBmUc/juKpdQAgreuYVtVffCqsgrx73+A2ASpXwzXTlYHJUZE0wqmFcHobtNmuHooHSc6o/d+GEXlRoSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by MN2PR15MB2590.namprd15.prod.outlook.com (2603:10b6:208:12d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 18:26:22 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134%6]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 18:26:22 +0000
From: Peter Delevoryas <pdel@fb.com>
To: Titus Rwantare <titusr@google.com>
CC: Peter Delevoryas <pdel@fb.com>, Peter Delevoryas
 <peterdelevoryas@gmail.com>, "clg@kaod.org" <clg@kaod.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "andrew@aj.id.au"
 <andrew@aj.id.au>, "joel@jms.id.au" <joel@jms.id.au>, "cminyard@mvista.com"
 <cminyard@mvista.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Dan Zhang <zhdaniel@fb.com>
Subject: Re: [PATCH v2 09/13] hw/i2c/pmbus: Add read-only IC_DEVICE_ID support
Thread-Topic: [PATCH v2 09/13] hw/i2c/pmbus: Add read-only IC_DEVICE_ID support
Thread-Index: AQHYi2l1MJyLzPh9MU2QF3wYBrkl3K1mrpOAgAAGEIA=
Date: Wed, 29 Jun 2022 18:26:22 +0000
Message-ID: <59308513-C87E-4DF9-8191-5F2664E90B85@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
 <20220629033634.3850922-10-pdel@fb.com>
 <CAMvPwGqmU+bsDb1fHraiTzdg14An5QiKUazSweyzVvbwHeCM=g@mail.gmail.com>
In-Reply-To: <CAMvPwGqmU+bsDb1fHraiTzdg14An5QiKUazSweyzVvbwHeCM=g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e3031e1-a2be-4ffc-0e36-08da59fcde92
x-ms-traffictypediagnostic: MN2PR15MB2590:EE_
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: idT0JxYiS2h4NXpMW+ouvC+xJP7A3ij1clKNinr9+kvqSvWKlTLtAirK1Tv7eU0xeQc1ZG42zmccAdSxdrcwv2t7Sx5u7mgDel5f0dKwi5JTUhP89OgpNDwp4jywod7wjULa+OgE6q/g/b7ccL/0A/tCao8gWI4kl1fKhN1Gc+12GIY7bKKOMiSye+nZHBtGdQioUZja1ryDBEKnuuG7hXt9Qhw3dA5eAy3qdEYFBKYcW4hp5a1v9s/AVOc8bHBzo7piwKyfBuPVMp3iz7rtTG6Zby2raU4thTrDYMo5tVyM9KBSDS2ub5FNwCfmLXGTnTBVTxmWOn54TLRF5SAq8mEmyY/TFSbHy0+SV8nd3R4XMon4RQTTQ1sjuolgk5KLwdavWW9hjMdnIk+bAHq4i1xJcr0qUy9nTxY3+FCjzJdpEp0UY99XAy7tsqbqP8AVMPwqUYlCzaTjcdas6b+IkdqMpyTlvUy/WsR3MYU+3Wy0Xx/rJb7/Z8aWswxNFkHKGD0M7s3fb92Hr9It1AcU06+rtGY6gW4UwFpXUdXR+TfybJj0G87Ra/9A47cXEL17yEWPSgUHFX2am6fx8f9K5d6PAkG9ZR9IDU+/DhD/30bO38aulYQBvOlXBzMvmgiVMuiwd9qLyN9b/nPZgi89hKehsP7+DS/0rIi7OdjX4GEcVWg9fNZ4t0oBKa8shHsR/fotcdycUlNirj+/VnY61+eCWFr1cAM97/GNX8kz1bwiEoHLnSXTBaJ0oVvVAtQIr2GdVD09E9PApTeSdr9Bq7SVvY3y2/ylic2DHpYd/eM+UDTbGhynf56qtweIOVY3NoPgnjUGbR3SC4cV20gP2SqkIQiI+aWULbJD3g14TCk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(186003)(54906003)(66446008)(8676002)(71200400001)(66946007)(6916009)(76116006)(66556008)(66476007)(64756008)(4326008)(6512007)(2616005)(36756003)(6506007)(83380400001)(53546011)(38070700005)(122000001)(966005)(38100700002)(33656002)(86362001)(41300700001)(2906002)(316002)(8936002)(478600001)(6486002)(5660300002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1BMcmYwcHA3RUZoZWVCb2tOeWhCYkYwRFZIMnNiRkxDVkNyakc1dVdKV3FY?=
 =?utf-8?B?LzlNY3pWcUQ5ZFQ1a1hmdWt2ZEwzUDdIMEU3ckxyRENTWEJNb3pkc0dHVHlm?=
 =?utf-8?B?N1Rnb3pWK0VTbmNqUUNmR2prZm1GR1pBeU4zeVBDY0ptN0tGTUJLcE5LT2R5?=
 =?utf-8?B?ekRMOGdkN2ovUjJjQ1RDZXFubFBERUFmUkhabzhZMXNVOWtwaUthR2ZYN0hk?=
 =?utf-8?B?aXFOVFRDb3pNWUpYTTNoR0VrZEpkMHFydXFGQXVSU3NPWnJNTVdvUndoNmZO?=
 =?utf-8?B?RDhQL1B1bUpSUkdHWUxaZHhMYm5rRElYSUd2QUNMcWZMSWdtcFZJcHlXVGJG?=
 =?utf-8?B?SnJlUU54RkZmTlZUWG53UmxBU1pJdHh6TzFla0VyQ0N6UW5qOWcvWkl3eFpI?=
 =?utf-8?B?WUI3UGRUbThlSHdMcDVHaFIzaU5IMUc2MGUvd0Jsa0tRWGxucHpSeFUwa2x0?=
 =?utf-8?B?SDBnYlI5OGlUYmMvRjNhM2lmWnJkOC93SlZnYkRBYUs2MDNmQTkrTzg5YWxm?=
 =?utf-8?B?NGtiVGNUMGNwb3k3alhpM05TN0RwaUFhRlp3N1ZNNXkzY2dnNVZxNkhsQmMw?=
 =?utf-8?B?dEFoRTF5RVhyanRxVVBHYjdiVkozdktIOVZXUmM4UWJhVnpPaUx4ZnRmbklw?=
 =?utf-8?B?ei9DZ1lxU1hCZnNNZk15Zmlod2xKOFdwSjl0VEhxTVNRUWt6TTRkbXBUbmVO?=
 =?utf-8?B?SC9kOW1Renl6QVk5NTIvNlhVQ3o1UTRBRHdGNW1oWkN1SFBGMFZESE9aSUNy?=
 =?utf-8?B?MGIreUxoYlIrYXJhcW5kY2dZYXZvZ0hpdVVYWlprZnZ2cDN4MEV2Q1NNUnZD?=
 =?utf-8?B?a2xhaE5kTVJCdXU4T3FoTHZ2Z09QWVo2N2hKK1ZwS1FCRmtKUzVBaUZPVFpU?=
 =?utf-8?B?dE5wcXFJTU8yZHdZMjRuNi9nS0ZhSkZ1WDF2ZWpOR1R5V0ZvbnphaVAvbWhF?=
 =?utf-8?B?dVpPSElQeDJOSFJ2dW16L2VpNHllR3NQTjQ5ZnhoNkpKSmdkQjdCRmQySU9T?=
 =?utf-8?B?dFRqcHhoa1piekhvLzZkWlAyYlAwYjFvN1pGWHpJVDE2VjJLOFJxQjk3VU82?=
 =?utf-8?B?d3BlMEdoT3JFVTYzYlREOEZCOTJRTCtyOWFkSWZWZko5ZXdYRGV2WW1BU0tR?=
 =?utf-8?B?RnUxOW5pVjhDVmIyc1o3dS9ySzlNRHhDenVnSUlQaFluNEgzejAwZXBTdS90?=
 =?utf-8?B?RU0rVm5ORXRPaCtzUTBZdDJiRFFjUVI4c0JrUVk3enJ5aC9mc1pwdEpwT1R5?=
 =?utf-8?B?R0NEVnZJbWtnajFVeTBmdElIa2RkdkZ3a2pQSXMrck52MEFPbmM5SjY3OGFY?=
 =?utf-8?B?Tm9NbUNwNWlpclFFcWlNRnVieTJJN2l2NnROa1dON1Vka3cvaFpvOUVleW9H?=
 =?utf-8?B?aXViNlEzZkdEeGxZbkQ1eDF4M3BVbG9qZzhwMm1EcGI0Q09PalU2djQvTGxi?=
 =?utf-8?B?K3VBS2R5SUNlb2RrZW5ueXMzaDkzNkFaMlI0bm1teVhPU2NFZlEwVlZIUnFn?=
 =?utf-8?B?SjY0NlkwZThpWXlONjlZV20xNHY3Y25RVmMrendqTCtyd0VPdzBsTUxsRmVN?=
 =?utf-8?B?aTB5blFOdDBrZlQyTE10WU9ibHYxMkRndWJCRklSbzRsR01BaGxkTHVkL01P?=
 =?utf-8?B?clpKWW5VaFFKOEd0dFFRVzVuU0JoVnRWaGJyTnJBQWx4eExGdFFpRTF3WDZ4?=
 =?utf-8?B?aFlVM1RsbTZKSUhzM0tTWjlyVWtyWTJLYXZIbHErckFHRHo5UFpxSHhIa3lF?=
 =?utf-8?B?Y0YyYnRnNXhhT0RZYTFsN0RENVd1WkxUdHE3TkF6K2R4ckQxM0NPNWlsbG9l?=
 =?utf-8?B?K2dHMnNjZXNQMGEraWdpYWpXZ1dBbnNETkRuS2pFUkErczNMUzFCaE1TbC83?=
 =?utf-8?B?YWtpVjRzOVo4TytJTWRsNlVvZjdWa1B0cjR2anRZTXRaODJmbk9ldmlLNzAw?=
 =?utf-8?B?ZEZhUnFwT1o2ZjFpNi9wMlQyOEowTm8ycVJzYS9Mc3JBbklzL0NXa3NBZTNJ?=
 =?utf-8?B?MjI5WkNhZG9yWjZUTHJrTGZ0eTRzR1JoT0c5MFNBcjBkUERkVVl5UVIyS3oz?=
 =?utf-8?B?WWd1a1hHRWNlQ1NwbEk0azNZYnh2UElJTlhudXEybzVUbXBvbUhsYU5GSVB0?=
 =?utf-8?B?YzU3aXJwRUZ1OVl6NXJYT3ZYbjdQTDRtWnBrVkNuR0FoWlE2MjRFZlUvZTZD?=
 =?utf-8?B?V1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94B947CCC6D217489CDB752C45FE49FB@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e3031e1-a2be-4ffc-0e36-08da59fcde92
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 18:26:22.6778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3IYjkVvAJ3f+tP4git8PieARzt04194iryhDSSNe1+SMiZ/dEZ6tOc7JWOjtaEr2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB2590
X-Proofpoint-ORIG-GUID: 38dMJM0nagTs-LHY17iWGhKmxQXZPS4y
X-Proofpoint-GUID: 38dMJM0nagTs-LHY17iWGhKmxQXZPS4y
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-29_19,2022-06-28_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=8179e10d56=pdel@fb.com; helo=mx0b-00082601.pphosted.com
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

DQoNCj4gT24gSnVuIDI5LCAyMDIyLCBhdCAxMTowNCBBTSwgVGl0dXMgUndhbnRhcmUgPHRpdHVz
ckBnb29nbGUuY29tPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgMjggSnVuIDIwMjIgYXQgMjA6MzYs
IFBldGVyIERlbGV2b3J5YXMNCj4gPHBldGVyZGVsZXZvcnlhc0BnbWFpbC5jb20+IHdyb3RlOg0K
Pj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBEZWxldm9yeWFzIDxwZGVsQGZiLmNvbT4NCj4+
IC0tLQ0KPiANCj4+IC0tLSBhL2h3L2kyYy9wbWJ1c19kZXZpY2UuYw0KPj4gKysrIGIvaHcvaTJj
L3BtYnVzX2RldmljZS5jDQo+PiBAQCAtOTg0LDYgKzk4NCwxMSBAQCBzdGF0aWMgdWludDhfdCBw
bWJ1c19yZWNlaXZlX2J5dGUoU01CdXNEZXZpY2UgKnNtZCkNCj4+ICAgICAgICAgfQ0KPj4gICAg
ICAgICBicmVhazsNCj4+IA0KPj4gKyAgICBjYXNlIFBNQlVTX0lDX0RFVklDRV9JRDoNCj4+ICsg
ICAgICAgIHBtYnVzX3NlbmQocG1kZXYsIHBtZGV2LT5wYWdlc1tpbmRleF0uaWNfZGV2aWNlX2lk
LA0KPj4gKyAgICAgICAgICAgICAgICAgICBzaXplb2YocG1kZXYtPnBhZ2VzW2luZGV4XS5pY19k
ZXZpY2VfaWQpKTsNCj4+ICsgICAgICAgIGJyZWFrOw0KPj4gKw0KPiANCj4gSSBkb24ndCB0aGlu
ayBpdCdzIGEgZ29vZCBpZGVhIHRvIGFkZCB0aGlzIGhlcmUgYmVjYXVzZSB0aGlzIHNlbmRzIDE2
DQo+IGJ5dGVzIGZvciBhbGwgUE1CdXMgZGV2aWNlcy4gSSBoYXZlIGF0IGxlYXN0IG9uZSBkZXZp
Y2UgdGhhdCBmb3JtYXRzDQo+IElDX0RFVklDRV9JRCBkaWZmZXJlbnRseSB0aGF0IEkndmUgbm90
IGdvdCBwZXJtaXNzaW9uIHRvIHVwc3RyZWFtLg0KPiBUaGUgc3BlYyBsZWF2ZXMgdGhlIHNpemUg
YW5kIGZvcm1hdCB1cCB0byB0aGUgbWFudWZhY3R1cmVyLCBzbyB0aGlzIGlzDQo+IGJlc3QgZG9u
ZSBpbiBpc2xfcG1idXNfdnIuYyBpbiBpc2xfcG1idXNfdnJfcmVhZF9ieXRlKCkuDQo+IExvb2sg
YXQgdGhlIGFkbTEyNzJfcmVhZF9ieXRlKCkgd2hpY2ggaXMgbW9yZSBpbnRlcmVzdGluZyB0aGFu
DQo+IGlzbF9wbWJ1c192ciBvbmUgYXMgYW4gZXhhbXBsZS4NCg0KQXJnaCwgeWVzLCB5b3XigJly
ZSBhYnNvbHV0ZWx5IHJpZ2h0LiBJIGRpZG7igJl0IHJlYWQgdGhlIHNwZWMgaW4gdmVyeQ0KbXVj
aCBkZXRhaWwsIEkgc2VlIG5vdyB0aGF0IHRoZSBsZW5ndGggaXMgZGV2aWNlLXNwZWNpZmljLiBG
b3IgdGhlDQpJU0w2OTI1OSBJIHNlZSB0aGF0IGl04oCZcyA0IGJ5dGVzLCB3aGljaCBtYWtlcyBz
ZW5zZSBub3cuIFRoaXMNCmlzIG5vdCB0aGUgZXhhY3QgZGF0YXNoZWV0IGZvciB0aGUgSVNMNjky
NTksIGJ1dCBJIHRoaW5rIHRoZSBJQ19ERVZJQ0VfSUQNCnBhcnQgaXMgdGhlIHNhbWUuDQoNCglo
dHRwczovL3d3dy5yZW5lc2FzLmNvbS91cy9lbi9kb2N1bWVudC9kc3QvaXNsNjgyMjktaXNsNjgy
MzktZGF0YXNoZWV0DQoNClB1dHRpbmcgdGhlIGxvZ2ljIGluIGlzbF9wbWJ1c192cl9yZWFkX2J5
dGUoKSBpcyBhIGdvb2QgaWRlYSwgSSBoYWRu4oCZdA0Kc2VlbiB0aGUgaW1wbGVtZW50YXRpb24g
aW4gYWRtMTI3Ml9yZWFkX2J5dGUoKSwgdGhhdCBsb29rcyBncmVhdCwNCknigJlsbCBqdXN0IGFk
ZCBhIHN3aXRjaCBvbiB0aGUgY29tbWFuZCBjb2RlIGFuZCBtb3ZlIHRoZSBlcnJvciBtZXNzYWdl
DQp0byB0aGUgZGVmYXVsdCBjYXNlLg0KDQo+IA0KPiANCj4+ICAgICBjYXNlIFBNQlVTX0NMRUFS
X0ZBVUxUUzogICAgICAgICAgICAgIC8qIFNlbmQgQnl0ZSAqLw0KPj4gICAgIGNhc2UgUE1CVVNf
UEFHRV9QTFVTX1dSSVRFOiAgICAgICAgICAgLyogQmxvY2sgV3JpdGUtb25seSAqLw0KPj4gICAg
IGNhc2UgUE1CVVNfU1RPUkVfREVGQVVMVF9BTEw6ICAgICAgICAgLyogU2VuZCBCeXRlICovDQo+
PiBkaWZmIC0tZ2l0IGEvaHcvc2Vuc29yL2lzbF9wbWJ1c192ci5jIGIvaHcvc2Vuc29yL2lzbF9w
bWJ1c192ci5jDQo+PiBpbmRleCBlMTFlMDI4ODg0Li5iMTJjNDZhYjZkIDEwMDY0NA0KPj4gLS0t
IGEvaHcvc2Vuc29yL2lzbF9wbWJ1c192ci5jDQo+PiArKysgYi9ody9zZW5zb3IvaXNsX3BtYnVz
X3ZyLmMNCj4+IEBAIC0yMTgsNiArMjE4LDI4IEBAIHN0YXRpYyB2b2lkIGlzbF9wbWJ1c192cl9j
bGFzc19pbml0KE9iamVjdENsYXNzICprbGFzcywgdm9pZCAqZGF0YSwNCj4+ICAgICBrLT5kZXZp
Y2VfbnVtX3BhZ2VzID0gcGFnZXM7DQo+PiB9DQo+PiANCj4+ICtzdGF0aWMgdm9pZCBpc2w2OTI1
OV9pbml0KE9iamVjdCAqb2JqKQ0KPj4gK3sNCj4+ICsgICAgc3RhdGljIGNvbnN0IHVpbnQ4X3Qg
aWNfZGV2aWNlX2lkW10gPSB7MHgwNCwgMHgwMCwgMHg4MSwgMHhEMiwgMHg0OX07DQo+PiArICAg
IFBNQnVzRGV2aWNlICpwbWRldiA9IFBNQlVTX0RFVklDRShvYmopOw0KPj4gKyAgICBpbnQgaTsN
Cj4+ICsNCj4+ICsgICAgcmFhMjJ4eF9pbml0KG9iaik7DQo+PiArICAgIGZvciAoaSA9IDA7IGkg
PCBwbWRldi0+bnVtX3BhZ2VzOyBpKyspIHsNCj4+ICsgICAgICAgIG1lbWNweShwbWRldi0+cGFn
ZXNbaV0uaWNfZGV2aWNlX2lkLCBpY19kZXZpY2VfaWQsDQo+PiArICAgICAgICAgICAgICAgc2l6
ZW9mKGljX2RldmljZV9pZCkpOw0KPj4gKyAgICB9DQo+PiArfQ0KPj4gKw0KPiANCj4gV2UgdGVu
ZCB0byBzZXQgZGVmYXVsdCByZWdpc3RlciB2YWx1ZXMgaW4gZXhpdF9yZXNldCgpIGNhbGxzLiBZ
b3UgY2FuDQo+IGRvIHNvbWV0aGluZyBsaWtlIGluIHJhYTIyODAwMF9leGl0X3Jlc2V0KCkNCg0K
T2ggZ290IGl0LiBJZiBJIGNhbiBtb3ZlIHRoZSBsb2dpYyB0byBpc2xfcG1idXNfdnJfcmVhZF9i
eXRlIHBlcmhhcHMNCkkgY2FuIGF2b2lkIHRoaXMgd2hvbGUgZnVuY3Rpb24gdGhvdWdoLg0KDQo+
IA0KPiANCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L2kyYy9wbWJ1c19kZXZpY2UuaCBiL2lu
Y2x1ZGUvaHcvaTJjL3BtYnVzX2RldmljZS5oDQo+PiBpbmRleCAwZjRkNmIzZmFkLi5hZWQ3ODA5
ODQxIDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9ody9pMmMvcG1idXNfZGV2aWNlLmgNCj4+ICsr
KyBiL2luY2x1ZGUvaHcvaTJjL3BtYnVzX2RldmljZS5oDQo+PiBAQCAtNDA3LDYgKzQwNyw3IEBA
IHR5cGVkZWYgc3RydWN0IFBNQnVzUGFnZSB7DQo+PiAgICAgdWludDE2X3QgbWZyX21heF90ZW1w
XzE7ICAgICAgICAgICAvKiBSL1cgd29yZCAqLw0KPj4gICAgIHVpbnQxNl90IG1mcl9tYXhfdGVt
cF8yOyAgICAgICAgICAgLyogUi9XIHdvcmQgKi8NCj4+ICAgICB1aW50MTZfdCBtZnJfbWF4X3Rl
bXBfMzsgICAgICAgICAgIC8qIFIvVyB3b3JkICovDQo+PiArICAgIHVpbnQ4X3QgaWNfZGV2aWNl
X2lkWzE2XTsgICAgICAgICAgLyogUmVhZC1Pbmx5IGJsb2NrLXJlYWQgKi8NCj4gDQo+IFlvdSB3
b3VsZG4ndCBiZSBhYmxlIHRvIGRvIHRoaXMgaGVyZSBlaXRoZXIsIHNpbmNlIHRoZSBzaXplIGNv
dWxkIGJlDQo+IGFueXRoaW5nIGZvciBvdGhlciBkZXZpY2VzLg0KDQpSaWdodCwgeWVhaCBJIHNl
ZSB3aGF0IHlvdSBtZWFuLg0KDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBuZXcgZGV2aWNlLiBJdCBo
ZWxwcyBtZSBzZWUgd2hlcmUgdG8gZXhwYW5kIG9uIFBNQnVzLg0KDQpUaGFua3MgZm9yIGFkZGlu
ZyB0aGUgd2hvbGUgcG1idXMgaW5mcmFzdHJ1Y3R1cmUhIEl04oCZcyByZWFsbHkgdXNlZnVsLg0K
QW5kIHRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KT2ZmLXRvcGljLCBidXQgSeKAmXZlIGJlZW4g
bWVhbmluZyB0byByZWFjaCBvdXQgdG8geW91IGd1eXMgKEdvb2dsZQ0KZW5naW5lZXJzIHdvcmtp
bmcgb24gUUVNVSBmb3IgT3BlbkJNQykgYWJvdXQgeW91ciBOdXZvdG9uIE5QQ004NDVSDQpzZXJp
ZXMsIG15IHRlYW0gaXMgaW50ZXJlc3RlZCBpbiB1c2luZyBpdC4gSSB3YXMganVzdCBjdXJpb3Vz
IGFib3V0DQp0aGUgc3RhdHVzIG9mIGl0IGFuZCBpZiB0aGVyZeKAmXMgYW55IGZlYXR1cmVzIG1p
c3NpbmcgYW5kIHdoYXQgcGxhbnMNCnlvdSBoYXZlIGZvciB0aGUgZnV0dXJlLCBtYXliZSB3ZSBj
YW4gY29sbGFib3JhdGUuDQoNClRoYW5rcyENClBldGVyDQoNCj4gDQo+IA0KPiBUaXR1cw0KDQo=

