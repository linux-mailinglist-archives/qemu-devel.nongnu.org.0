Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B648420326
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 19:48:01 +0200 (CEST)
Received: from localhost ([::1]:54556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX5ah-0002PR-HI
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 13:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9910b4adaa=pdel@fb.com>)
 id 1mX5XP-0000w5-Bh; Sun, 03 Oct 2021 13:44:35 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:55530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9910b4adaa=pdel@fb.com>)
 id 1mX5XM-0005ua-Vt; Sun, 03 Oct 2021 13:44:35 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 193EUxe4032487; 
 Sun, 3 Oct 2021 10:44:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=Q1uSu5wMrLIebXwGkPJE7ONsrp0yFUobtaj7A9Bvt+Y=;
 b=qh0L+dCHFAN6URO4POeOItj8/+n0Zjjq8SVHTMOosIUCCCWYUx4MxC9gnvvHjZX9siA0
 2Igui1u/uQJr6Os7GE/cs1T4f/H5/kk1JH5P7sU5nupFdUvn7/RxbGdgpujUEZAfJrjw
 PA4arEMxMrnZ6IbbQDfOYFulwNVotOPN1Q0= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3bf5fd2w73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sun, 03 Oct 2021 10:44:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Sun, 3 Oct 2021 10:44:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpZGJEXNDTcV7LaydddvR5afn23walbMYIpOAxHfsEHMdNAPq/rvpZXnDILHjLHSV+sjbDfhsw4zDOSLjvvsd2G6VbH8jbupb+Jis/pXdIlGxYyK+rmv/QfjZE8r4kKHf9fwiwqe4Q5HwJ1HnEJT00adBfsQE6tdSp7Jn+O60G0rQz17V+PEWIvpbUWwztM/Ir5zZRZ1u8n4YrFUsz0p+aWQgPQWtSGil46/9RH7/oVp9YA7iDtvUJCQgwLrdM7YTD9GmR+QVQUPiMYFacmRDvR/GoeZkcHJTtXeom5sbOcbKu7dT+fZuNU/rrpbYt3lc/eVpYJltwmHJhbcojnqwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1uSu5wMrLIebXwGkPJE7ONsrp0yFUobtaj7A9Bvt+Y=;
 b=KtXlM1ESVwOxmHWByUO4Rp9w9G+xZiVg6KaX8NLalRexca57yT2R+WBhqC+xadEDn3TTKB5+FSw6l0OZy2Ig3E94fTFlPYfVdnekucknFPYwbsbiamjd6KEO7/Qi/8U5KWC9E5pMFO6pWNmYwU/yx9vIVgMclYfV96WHgMpF1tGYCboayWcAa3mpfMNWeryQinubsK2+9xDnuqYq7ECpUqczWCHcfQc8aZlIxqioHvpaaCB0VBoYMhl4MZ0kwyfbEKuJFe12wNQ+MdKgCiLeT7rGZxIl90rDeiF2xrgk4eQwSE5ffKvOKLhWbSSL0wSbXOUXVFel4IQ1qpUIp4dqXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BYAPR15MB2280.namprd15.prod.outlook.com (2603:10b6:a02:8a::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.21; Sun, 3 Oct
 2021 17:44:11 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::38da:f6f6:bb5c:dd5f]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::38da:f6f6:bb5c:dd5f%7]) with mapi id 15.20.4566.022; Sun, 3 Oct 2021
 17:44:11 +0000
From: Peter Delevoryas <pdel@fb.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
CC: Alistair Francis <alistair@alistair23.me>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "patrick@stwcx.xyz"
 <patrick@stwcx.xyz>, Dan Zhang <zhdaniel@fb.com>
Subject: Re: [PATCH 1/2] hw/adc: Add basic Aspeed ADC model
Thread-Topic: [PATCH 1/2] hw/adc: Add basic Aspeed ADC model
Thread-Index: AQHXt9aqFuSvfwdGS0m9SH96Hd3T/KvBTEsAgAA1PACAAAiuAIAAAqgA
Date: Sun, 3 Oct 2021 17:44:10 +0000
Message-ID: <30891D21-5E3C-42A2-9647-5D1CF8A89C5F@fb.com>
References: <20211002214414.2858382-1-pdel@fbc.om>
 <20211002214414.2858382-2-pdel@fbc.om>
 <168e5568-4cd3-5c4b-35b9-6ba5ced92ece@kaod.org>
 <2670BB23-A44C-42DD-82E9-80C271AC49D6@fb.com>
 <8bc00971-eb7e-9291-f143-e22f0d95caeb@kaod.org>
In-Reply-To: <8bc00971-eb7e-9291-f143-e22f0d95caeb@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4deaf15-d915-4014-e1be-08d986956881
x-ms-traffictypediagnostic: BYAPR15MB2280:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB22807C0E0D3BB3EB688ABE23ACAD9@BYAPR15MB2280.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EvklQt0nvt6m4S94X3DD4POVK3bPP3nSnT2kjYxXIoMP01aodk8scU4GVZNhwsvXTRH81F1QI0GiSDmc2mTuiv5yjUZhGOeRoIXwwwknhkSuvmlP3Qhq9qGw3lC2SgseNS2TFJXz+bo8xHrKlsuYJFWpr0PXtZUQ3BH7QcAuEBQ1DGhyzDeZ3gVy3ZPNc2bTL5Td1LnGudAerWtbhN1qU7SWrag2b6UHasPw0zyO9Q3FQ0DzEyBUvustCOJAt0HZPYQHGaBtdnuWY0qmGaYrONJ3widrDtV8lSMq9SzWgV9GFe8+z9tZx5ItijqJmA/1Xij2CaCArGfh+mlig8gqPS9dkT7eSgqLkiGmzX5pnc1ijSaWoVxjAAYcJ0J7x+Mg3CE5hii0k/5lVmAxfUtMVk0hQiuHuS/y1TAdwvAuN/hxZCuHPWckDKfPoymtxRGMjGlCbS98tMYqm2BJdZPeJgslnwyjmz52bZp2xBv1xxFhasuNtZtVq4ow6wqvEbuC4VXCRm08PDq98B2KXza89hfOyjR2uTiTJn0QbBB5HPX3joxF9fwNGDwpyUHiC3GBPNZ02MPbwNvIdlldUngO/M6iY21B5IFeDdBA0APjhQzzo29i02/KrcrQMUuwfNKiLYwkVpeC2RjhopAE70S0Ei3SoYb4CNZh7YrMwS6Vbskaq5bXcnTQS2tvNKdZ0Aab5Se74SpkpRKU+XITLNNM5IdwkBKcIxvIRAx9P6WNeJ1pTein/U2WyWaMRHz+xpa95MZUjWDtZhXZ9SaL6hFa/g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66446008)(66946007)(316002)(66476007)(4326008)(66556008)(38070700005)(186003)(64756008)(36756003)(76116006)(6486002)(5660300002)(86362001)(8676002)(508600001)(6916009)(6506007)(122000001)(71200400001)(54906003)(53546011)(2616005)(8936002)(66574015)(33656002)(2906002)(83380400001)(38100700002)(6512007)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXFxdTlwSGh0TUZWYVlQeHorMjVmbVo0aGtzL1hncFp2aUpKcDdneWgzS2gy?=
 =?utf-8?B?MjZuWnRQYkp1cUs3QkFnQlBKbFVmU3FmeVJZcklCeTdjM0dEZVcrM05aRVBY?=
 =?utf-8?B?NDYra0hDR09mWFYvSG45WHh1SVo1eEh6dzNyZFVZTXZkWkkvNGRlbjlEcUhi?=
 =?utf-8?B?M0p3V241STFudWZSanZOMzkzME84NFR6TGhEYUdvbXozU1NrcVdKUEhkZkRv?=
 =?utf-8?B?L2tlWU1LKzgxOHpIZ3BOeDNwWkdzeFlLQmFlUVU5RFdRSkxvL0hrWmIwNkl1?=
 =?utf-8?B?b1J5U2M1NnFwZWc4aEZjUkxtRlZCcGxVVWRuYVQ1bTlKdS91T2xlMW5RZkhv?=
 =?utf-8?B?RmJOSkZEM0N2ZzlqTHJmM3doZmRTNDVMaTUwT1hWWjIzMWNzK0I5Skx3cFpS?=
 =?utf-8?B?NkpFTUovMmlld2JCL2FyL0RhUitIY1BYT2FGMUYvTFM3c0J2MWtNL3FXbFAw?=
 =?utf-8?B?ZlEvYldhMWN4M0Fod21YQXNPUnNSNEFrU25ocUxyeFFkcHJFNFg0YUM3eFpk?=
 =?utf-8?B?T2pSUkZUL2xIQkRMaUwxcEtKSHMwZVU2ejlYMnEzeitTV2Z4QjdFOHk4RnZO?=
 =?utf-8?B?WXhzRmRuQzdJRVFlTVFWZE05Sk52c1ZtNWN2Ukd6bkk3OGI0RTNyT3hUSE5N?=
 =?utf-8?B?aG12WEhNZmRxaUxUNnduMTRiTWZsNngzRG0xR1ptdkxFNmthWk1DVGhzY2ZE?=
 =?utf-8?B?U29HTWVYNFhWR01RbFlLaDcrYzhNd1Rjc2l3TllpMU5BQzRxUVNXZFV3dFZL?=
 =?utf-8?B?TFJSQ2xUUU1nZzVGR3UyUGtOZlRiQ1hjSGQyaXVCUUlKeUdrUWlkT3dmdU00?=
 =?utf-8?B?aFptOTJSM3pLRE9OQjU2LzdoclhNV3NWck9WN2dUVU5mbmlvUTdMdWRzdU9w?=
 =?utf-8?B?VlNrTmZGd2JmVXQ1VTFMZllodm0zSlFyczA4blBUak5EaGwyd3JtWTdxOFR6?=
 =?utf-8?B?SHEzQklscUNTN2NEZEl3cW9RUmVSWXhjUnhsVGtWYzZrOFRPL2h0SjRhSkw0?=
 =?utf-8?B?dC9oWDBYZTNRWkVvTVBtekxXWndCWk1mRzhoMDhqV0ZPSTdxSkg4cXNyT3hk?=
 =?utf-8?B?MDUxTzg1OTRmRmZ0c0p3UU5yNmFlZWlIcTZyS2lnVWo3cjhBcXpLbmxwTHJB?=
 =?utf-8?B?NjNuYlRjaWNUVHhqODdsOWsxdkxzMEpnYS9nTUNmSER2MUxDblZlWnplZDZI?=
 =?utf-8?B?SU9ndE1IaEVscXhaa1VNVFptTms2R2xiM293UE1iK3dPUTZ4azRSd3dKMXpL?=
 =?utf-8?B?RmorTlFoKzR4M09BQXQ0bUlEM3VhdTNHZng4dVhmcG5acklIMW9lNm5SaVMr?=
 =?utf-8?B?SEhqa0Y1SzViUXJaL3BnUDI3SUQ2YUQ5Z1NQa2plVTRHclZGdFV5QkhtWkl3?=
 =?utf-8?B?RVM2bGtmbGhlQXJUTEdDVTA4MS9kc20wTXFlRkxTOFhQTTUyVVEzVlJsY0lD?=
 =?utf-8?B?VkdmU09MbHFNRXp6SDY0eENrOTY2OVhDenIrd3NRenBFTitkdmNEbzFEVlRV?=
 =?utf-8?B?bUJGUGxTY3M1aWJnZGd4MHJwcCtyVzJDdUIwSWgzVXdpTFpPTys0RlA5cTJ5?=
 =?utf-8?B?enljZlQzUmxpamgwNHlURHlHb1NtYVp1bDhKbmpMY0RLWDdjdFNiMXZkS0Yz?=
 =?utf-8?B?SWRDSUNzWFlEb2pHdG5OZEltVWUwQUtLZHpxcUZXeUprZndrcExweVI5WlZk?=
 =?utf-8?B?M0s1YU1jb1VEZkpXcURzZ1c1Y2VEVk5lenJWeXV5U2V5bHFKL2RsdGtleUZl?=
 =?utf-8?B?b3MrdVQ3Z3lZM1JieGJWV3dwUzhlR1VOcE5pNTRnS3daM0ZnaGh1WERxMVV4?=
 =?utf-8?Q?aFYwl7FBaE6sHfjbCDyVz5JdV/NIQ7US//Oy8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DAC6A18C76D54146A9AD147B26F091B6@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4deaf15-d915-4014-e1be-08d986956881
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2021 17:44:10.9128 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AkewhbvBkuGGZEMocrPzJ819/rj1CTmfLWqyGe/YMH1/0qIfxv72a01qoz2+b2MA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2280
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: wJuQ-geR01r0s5L6PKM-b8-jpr2PRKUV
X-Proofpoint-ORIG-GUID: wJuQ-geR01r0s5L6PKM-b8-jpr2PRKUV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-03_08,2021-10-01_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=836
 priorityscore=1501 adultscore=0 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110030128
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=9910b4adaa=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

DQoNCj4gT24gT2N0IDMsIDIwMjEsIGF0IDEwOjM0IEFNLCBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QGthb2Qub3JnPiB3cm90ZToNCj4gDQo+Pj4+IA0KPj4+PiArc3RhdGljIHZvaWQgYXNwZWVkX2Fk
Y19pbnN0YW5jZV9pbml0KE9iamVjdCAqb2JqKQ0KPj4+PiArew0KPj4+PiArICAgIEFzcGVlZEFE
Q1N0YXRlICpzID0gQVNQRUVEX0FEQyhvYmopOw0KPj4+PiArICAgIEFzcGVlZEFEQ0NsYXNzICph
YWMgPSBBU1BFRURfQURDX0dFVF9DTEFTUyhvYmopOw0KPj4+PiArICAgIHVpbnQzMl90IG5yX2No
YW5uZWxzID0gQVNQRUVEX0FEQ19OUl9DSEFOTkVMUyAvIGFhYy0+bnJfZW5naW5lczsNCj4+Pj4g
Kw0KPj4+PiArICAgIGZvciAoaW50IGkgPSAwOyBpIDwgYWFjLT5ucl9lbmdpbmVzOyBpKyspIHsN
Cj4+Pj4gKyAgICAgICAgQXNwZWVkQURDRW5naW5lU3RhdGUgKmVuZ2luZSA9ICZzLT5lbmdpbmVz
W2ldOw0KPj4+PiArICAgICAgICBvYmplY3RfaW5pdGlhbGl6ZV9jaGlsZChvYmosICJlbmdpbmVb
Kl0iLCBlbmdpbmUsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRZUEVf
QVNQRUVEX0FEQ19FTkdJTkUpOw0KPj4+PiArICAgICAgICBxZGV2X3Byb3Bfc2V0X3VpbnQzMihE
RVZJQ0UoZW5naW5lKSwgImVuZ2luZS1pZCIsIGkpOw0KPj4+IA0KPj4+IFdoeSBoYXZlIHlvdSBt
b3ZlZCB0aGUgcHJvcGVydHkgaW5pdGlhbGl6YXRpb24gaW4gdGhlIGluc3RhbmNlX2luaXQgcm91
dGluZSA/DQo+PiBJIHRoaW5rIGZvciBzb21lIHJlYXNvbiBJIHRob3VnaHQgdGhpcyB3YXMgbmVj
ZXNzYXJ5LCBvciBtYXliZSBJIHRob3VnaHQgaXQNCj4+IHdhcyBtb3JlIGFwcHJvcHJpYXRlPyBJ
IHRoaW5rIEkgd2FzIGxvb2tpbmcgYXQgYXNwZWVkX3NvYy5jIGFuZCBzYXcNCj4+IG1vc3Qgb2Yg
dGhlIGNoaWxkIGluaXRpYWxpemF0aW9uIGluIHRoZSBpbml0KCkgZnVuY3Rpb25zLCBub3QgcmVh
bGl6ZSgpLCBidXQNCj4gDQo+IFRoZSBvbmx5IG9uZSBpcyAic2lsaWNvbi1yZXYiIHdoaWNoIGlz
IGEgY29uc3RhbnQgZm9yIHRoZSBTb0MuIFRoYXQncyB3aHkNCj4gd2Ugc2V0IGl0IGZyb20gdGhl
IGluc3RhbmNlX2luaXQgcm91dGluZSBhbmQgSSB0aGluayB3ZSBuZWVkIGl0IHRvIGluaXRpYWxp
emUNCj4gb3RoZXIgbW9kZWxzIGFsc28uDQo+IA0KPj4gSeKAmWxsIGp1c3QgcHV0IGJvdGggcHJv
cGVydGllcyBiYWNrIGluIHJlYWxpemUoKSwgSSBkb27igJl0IHRoaW5rIHRoZXJlIHdhcyBhbnkN
Cj4+IGZ1bmN0aW9uYWwgcmVhc29uLg0KPiANCj4gTm8uIEl0IG1ha2VzIHNlbnNlLiAiZW5naW5l
LWlkIiBpcyBhbiBpbnRlcm5hbCBpZCB3aGljaCBoYXMgbm8gcmVhc29uIHRvDQo+IGNoYW5nZSBh
ZnRlciBpbml0LiAibnItY2hhbm5lbHMiIGlzIGNvbnN0YW50IGFuZCBjb3VsZCBiZSBkZXJpdmVk
IGZyb20NCj4gQXNwZWVkQURDQ2xhc3MuIElkZWFseSwgd2Ugd291bGQgY29tcHV0ZSAibnItY2hh
bm5lbHMiIGluIEFzcGVlZEFEQ0VuZ2luZVN0YXRlDQo+IGJ1dCB0aGlzIHdvdWxkIHJlcXVpcmUg
YW5vdGhlciBwcm9wZXJ0eSBvbiB0aGUgb3duaW5nIEFzcGVlZEFEQ1N0YXRlIG9iamVjdC4NCg0K
WWVhaCBpbml0aWFsbHkgSSB3YXMgZ29pbmcgdG8gdHJ5IHRvIGNvbXB1dGUg4oCcbnItY2hhbm5l
bHPigJ0gaW4gQXNwZWVkQURDRW5naW5lU3RhdGUNCmJ1dCBJIGNhbWUgdG8gdGhlIHNhbWUgY29u
Y2x1c2lvbiwgaXQgd291bGQgcmVxdWlyZSBhZGRpbmcgcHJvcGVydGllcyBpbiBvdGhlcg0KcGxh
Y2VzLg0KDQo+IA0KPiBMZXQncyBpdCBrZWVwIGl0LiBVbmxlc3Mgc29tZW9uZSBoYXMgYSBiZXR0
ZXIgaWRlYS4NCg0KT2ggb2sgdGhlbiwgc291bmRzIGdvb2QhDQoNCj4gDQo+IE9uZSBleHRyYSBy
ZW1hcmsgYmVsb3cuDQo+IA0KPj4+PiArICAgICAgICBxZGV2X3Byb3Bfc2V0X3VpbnQzMihERVZJ
Q0UoZW5naW5lKSwgIm5yLWNoYW5uZWxzIiwgbnJfY2hhbm5lbHMpOw0KPj4+PiArICAgIH0NCj4+
Pj4gK30NCj4+Pj4gKw0KPj4+PiArc3RhdGljIHZvaWQgYXNwZWVkX2FkY19zZXRfaXJxKHZvaWQg
Km9wYXF1ZSwgaW50IG4sIGludCBsZXZlbCkNCj4+Pj4gK3sNCj4+Pj4gKyAgICBBc3BlZWRBRENT
dGF0ZSAqcyA9IG9wYXF1ZTsNCj4+Pj4gKyAgICBBc3BlZWRBRENDbGFzcyAqYWFjID0gQVNQRUVE
X0FEQ19HRVRfQ0xBU1Mocyk7DQo+Pj4+ICsgICAgdWludDMyX3QgcGVuZGluZyA9IDA7DQo+Pj4+
ICsNCj4+Pj4gKyAgICAvKiBUT0RPOiB1cGRhdGUgR2xvYmFsIElSUSBzdGF0dXMgcmVnaXN0ZXIg
b24gQVNUMjYwMCAoTmVlZCBzcGVjcykgKi8NCj4+Pj4gKyAgICBmb3IgKGludCBpID0gMDsgaSA8
IGFhYy0+bnJfZW5naW5lczsgaSsrKSB7DQo+Pj4+ICsgICAgICAgIHVpbnQzMl90IGlycV9zdGF0
dXMgPSBzLT5lbmdpbmVzW2ldLnJlZ3NbSU5URVJSVVBUX0NPTlRST0xdICYgMHhGRjsNCj4+Pj4g
KyAgICAgICAgcGVuZGluZyB8PSBpcnFfc3RhdHVzIDw8IChpICogOCk7DQo+Pj4+ICsgICAgfQ0K
Pj4+PiArDQo+Pj4+ICsgICAgcWVtdV9zZXRfaXJxKHMtPmlycSwgISFwZW5kaW5nKTsNCj4+Pj4g
K30NCj4+Pj4gKw0KPj4+PiArc3RhdGljIHZvaWQgYXNwZWVkX2FkY19yZWFsaXplKERldmljZVN0
YXRlICpkZXYsIEVycm9yICoqZXJycCkNCj4+Pj4gK3sNCj4+Pj4gKyAgICBBc3BlZWRBRENTdGF0
ZSAqcyA9IEFTUEVFRF9BREMoZGV2KTsNCj4+Pj4gKyAgICBTeXNCdXNEZXZpY2UgKnNiZCA9IFNZ
U19CVVNfREVWSUNFKGRldik7DQo+Pj4+ICsgICAgQXNwZWVkQURDQ2xhc3MgKmFhYyA9IEFTUEVF
RF9BRENfR0VUX0NMQVNTKGRldik7DQo+Pj4+ICsNCj4+Pj4gKyAgICBxZGV2X2luaXRfZ3Bpb19p
bl9uYW1lZF93aXRoX29wYXF1ZShERVZJQ0Uoc2JkKSwgYXNwZWVkX2FkY19zZXRfaXJxLA0KPj4+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHMsIE5VTEwsIGFhYy0+
bnJfZW5naW5lcyk7DQo+Pj4+ICsNCj4+Pj4gKyAgICBzeXNidXNfaW5pdF9pcnEoc2JkLCAmcy0+
aXJxKTsNCj4+Pj4gKw0KPj4+PiArICAgIG1lbW9yeV9yZWdpb25faW5pdCgmcy0+bW1pbywgT0JK
RUNUKHMpLCBUWVBFX0FTUEVFRF9BREMsIDB4MTAwMCk7DQo+Pj4+ICsNCj4+Pj4gKyAgICBzeXNi
dXNfaW5pdF9tbWlvKHNiZCwgJnMtPm1taW8pOw0KPj4+PiArDQo+Pj4+ICsgICAgZm9yIChpbnQg
aSA9IDA7IGkgPCBhYWMtPm5yX2VuZ2luZXM7IGkrKykgew0KPj4+PiArICAgICAgICBPYmplY3Qg
KmVuZyA9IE9CSkVDVCgmcy0+ZW5naW5lc1tpXSk7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICAgaWYg
KCFzeXNidXNfcmVhbGl6ZShTWVNfQlVTX0RFVklDRShlbmcpLCBlcnJwKSkgew0KPj4+PiArICAg
ICAgICAgICAgcmV0dXJuOw0KPj4+PiArICAgICAgICB9DQo+Pj4+ICsgICAgICAgIHN5c2J1c19j
b25uZWN0X2lycShTWVNfQlVTX0RFVklDRShlbmcpLCAwLA0KPj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcWRldl9nZXRfZ3Bpb19pbihERVZJQ0Uoc2JkKSwgaSkpOw0KPj4+PiArICAg
ICAgICBtZW1vcnlfcmVnaW9uX2FkZF9zdWJyZWdpb24oJnMtPm1taW8sIGkgKiAweDEwMCwgJnMt
PmVuZ2luZXNbaV0ubW1pbyk7DQo+IA0KPiBTaW5jZSB3ZSB1c2UgMHgxMDAgdHdpY2UgKG15IGZh
dWx0KS4gTWF5IGJlIGFkZCBhIGRlZmluZSBmb3IgaXQgPw0KDQpPaCB5ZWFoIHN1cmU6IEkgY2Fu
IGFsc28gYWRkIGEgZGVmaW5lIGZvciB0aGUgcGFyZW50IHJlZ2lvbuKAmXMgc2l6ZSwgMHgxMDAw
LA0KZXZlbiB0aG91Z2ggaXTigJlzIG5vdCB1c2VkIGluIHR3byBwbGFjZXMsIHNpbmNlIHNvbWVi
b2R5IHdob+KAmXMgaW50ZXJlc3RlZA0KaW4gb25lIGlzIHByb2JhYmx5IGludGVyZXN0ZWQgaW4g
a25vd2luZyB0aGUgcGFyZW50IHJlZ2lvbiBzaXplIHRvby4NCg0KI2RlZmluZSBBU1BFRURfQURD
X01FTU9SWV9SRUdJT05fU0laRSAgICAgICAgMHgxMDAwDQojZGVmaW5lIEFTUEVFRF9BRENfRU5H
SU5FX01FTU9SWV9SRUdJT05fU0laRSAweDEwMA0KDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBDLg0K
PiANCj4+Pj4gKyAgICB9DQo+Pj4+ICt9DQo+Pj4+ICsNCj4+Pj4gK3N0YXRpYyB2b2lkIGFzcGVl
ZF9hZGNfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqa2xhc3MsIHZvaWQgKmRhdGEpDQo+Pj4+ICt7
DQo+Pj4+ICsgICAgRGV2aWNlQ2xhc3MgKmRjID0gREVWSUNFX0NMQVNTKGtsYXNzKTsNCj4+Pj4g
KyAgICBBc3BlZWRBRENDbGFzcyAqYWFjID0gQVNQRUVEX0FEQ19DTEFTUyhrbGFzcyk7DQo+Pj4+
ICsNCj4+Pj4gKyAgICBkYy0+cmVhbGl6ZSA9IGFzcGVlZF9hZGNfcmVhbGl6ZTsNCj4+Pj4gKyAg
ICBkYy0+ZGVzYyA9ICJBc3BlZWQgQW5hbG9nLXRvLURpZ2l0YWwgQ29udmVydGVyIjsNCj4+Pj4g
KyAgICBhYWMtPm5yX2VuZ2luZXMgPSAxOw0KPj4+PiArfQ0KPj4+PiArDQo+Pj4+ICtzdGF0aWMg
dm9pZCBhc3BlZWRfMjYwMF9hZGNfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqa2xhc3MsIHZvaWQg
KmRhdGEpDQo+Pj4+ICt7DQo+Pj4+ICsgICAgRGV2aWNlQ2xhc3MgKmRjID0gREVWSUNFX0NMQVNT
KGtsYXNzKTsNCj4+Pj4gKyAgICBBc3BlZWRBRENDbGFzcyAqYWFjID0gQVNQRUVEX0FEQ19DTEFT
UyhrbGFzcyk7DQo+Pj4+ICsNCj4+Pj4gKyAgICBkYy0+ZGVzYyA9ICJBU1BFRUQgMjYwMCBBREMg
Q29udHJvbGxlciI7DQo+Pj4+ICsgICAgYWFjLT5ucl9lbmdpbmVzID0gMjsNCj4+Pj4gK30NCj4+
Pj4gKw0KPj4+PiArc3RhdGljIGNvbnN0IFR5cGVJbmZvIGFzcGVlZF9hZGNfaW5mbyA9IHsNCj4+
Pj4gKyAgICAubmFtZSA9IFRZUEVfQVNQRUVEX0FEQywNCj4+Pj4gKyAgICAucGFyZW50ID0gVFlQ
RV9TWVNfQlVTX0RFVklDRSwNCj4+Pj4gKyAgICAuaW5zdGFuY2VfaW5pdCA9IGFzcGVlZF9hZGNf
aW5zdGFuY2VfaW5pdCwNCj4+Pj4gKyAgICAuaW5zdGFuY2Vfc2l6ZSA9IHNpemVvZihBc3BlZWRB
RENTdGF0ZSksDQo+Pj4+ICsgICAgLmNsYXNzX2luaXQgPSBhc3BlZWRfYWRjX2NsYXNzX2luaXQs
DQo+Pj4+ICsgICAgLmNsYXNzX3NpemUgPSBzaXplb2YoQXNwZWVkQURDQ2xhc3MpLA0KPj4+PiAr
ICAgIC5hYnN0cmFjdCAgID0gdHJ1ZSwNCj4+Pj4gK307DQo+Pj4+ICsNCj4+Pj4gK3N0YXRpYyBj
b25zdCBUeXBlSW5mbyBhc3BlZWRfMjQwMF9hZGNfaW5mbyA9IHsNCj4+Pj4gKyAgICAubmFtZSA9
IFRZUEVfQVNQRUVEXzI0MDBfQURDLA0KPj4+PiArICAgIC5wYXJlbnQgPSBUWVBFX0FTUEVFRF9B
REMsDQo+Pj4+ICt9Ow0KPj4+PiArDQo+Pj4+ICtzdGF0aWMgY29uc3QgVHlwZUluZm8gYXNwZWVk
XzI1MDBfYWRjX2luZm8gPSB7DQo+Pj4+ICsgICAgLm5hbWUgPSBUWVBFX0FTUEVFRF8yNTAwX0FE
QywNCj4+Pj4gKyAgICAucGFyZW50ID0gVFlQRV9BU1BFRURfQURDLA0KPj4+PiArfTsNCj4+Pj4g
Kw0KPj4+PiArc3RhdGljIGNvbnN0IFR5cGVJbmZvIGFzcGVlZF8yNjAwX2FkY19pbmZvID0gew0K
Pj4+PiArICAgIC5uYW1lID0gVFlQRV9BU1BFRURfMjYwMF9BREMsDQo+Pj4+ICsgICAgLnBhcmVu
dCA9IFRZUEVfQVNQRUVEX0FEQywNCj4+Pj4gKyAgICAuY2xhc3NfaW5pdCA9IGFzcGVlZF8yNjAw
X2FkY19jbGFzc19pbml0LA0KPj4+PiArfTsNCj4+Pj4gKw0KPj4+PiArc3RhdGljIHZvaWQgYXNw
ZWVkX2FkY19yZWdpc3Rlcl90eXBlcyh2b2lkKQ0KPj4+PiArew0KPj4+PiArICAgIHR5cGVfcmVn
aXN0ZXJfc3RhdGljKCZhc3BlZWRfYWRjX2VuZ2luZV9pbmZvKTsNCj4+Pj4gKyAgICB0eXBlX3Jl
Z2lzdGVyX3N0YXRpYygmYXNwZWVkX2FkY19pbmZvKTsNCj4+Pj4gKyAgICB0eXBlX3JlZ2lzdGVy
X3N0YXRpYygmYXNwZWVkXzI0MDBfYWRjX2luZm8pOw0KPj4+PiArICAgIHR5cGVfcmVnaXN0ZXJf
c3RhdGljKCZhc3BlZWRfMjUwMF9hZGNfaW5mbyk7DQo+Pj4+ICsgICAgdHlwZV9yZWdpc3Rlcl9z
dGF0aWMoJmFzcGVlZF8yNjAwX2FkY19pbmZvKTsNCj4+Pj4gK30NCj4+Pj4gKw0KPj4+PiArdHlw
ZV9pbml0KGFzcGVlZF9hZGNfcmVnaXN0ZXJfdHlwZXMpOw0KPj4+PiBkaWZmIC0tZ2l0IGEvaHcv
YWRjL21lc29uLmJ1aWxkIGIvaHcvYWRjL21lc29uLmJ1aWxkDQo+Pj4+IGluZGV4IGFjNGYwOTNm
ZWEuLmIyOWFjN2NjZGYgMTAwNjQ0DQo+Pj4+IC0tLSBhL2h3L2FkYy9tZXNvbi5idWlsZA0KPj4+
PiArKysgYi9ody9hZGMvbWVzb24uYnVpbGQNCj4+Pj4gQEAgLTEsNCArMSw1IEBADQo+Pj4+ICBz
b2Z0bW11X3NzLmFkZCh3aGVuOiAnQ09ORklHX1NUTTMyRjJYWF9BREMnLCBpZl90cnVlOiBmaWxl
cygnc3RtMzJmMnh4X2FkYy5jJykpDQo+Pj4+ICtzb2Z0bW11X3NzLmFkZCh3aGVuOiAnQ09ORklH
X0FTUEVFRF9TT0MnLCBpZl90cnVlOiBmaWxlcygnYXNwZWVkX2FkYy5jJykpDQo+Pj4+ICBzb2Z0
bW11X3NzLmFkZCh3aGVuOiAnQ09ORklHX05QQ003WFgnLCBpZl90cnVlOiBmaWxlcygnbnBjbTd4
eF9hZGMuYycpKQ0KPj4+PiAgc29mdG1tdV9zcy5hZGQod2hlbjogJ0NPTkZJR19aWU5RJywgaWZf
dHJ1ZTogZmlsZXMoJ3p5bnEteGFkYy5jJykpDQo+Pj4+ICBzb2Z0bW11X3NzLmFkZCh3aGVuOiAn
Q09ORklHX01BWDExMVgnLCBpZl90cnVlOiBmaWxlcygnbWF4MTExeC5jJykpDQo+Pj4+IGRpZmYg
LS1naXQgYS9ody9hZGMvdHJhY2UtZXZlbnRzIGIvaHcvYWRjL3RyYWNlLWV2ZW50cw0KPj4+PiBp
bmRleCA0NTZmMjFjOGY0Li41YTRjNDQ0ZDc3IDEwMDY0NA0KPj4+PiAtLS0gYS9ody9hZGMvdHJh
Y2UtZXZlbnRzDQo+Pj4+ICsrKyBiL2h3L2FkYy90cmFjZS1ldmVudHMNCj4+Pj4gQEAgLTMsMyAr
Myw2IEBADQo+Pj4+ICAjIG5wY203eHhfYWRjLmMNCj4+Pj4gIG5wY203eHhfYWRjX3JlYWQoY29u
c3QgY2hhciAqaWQsIHVpbnQ2NF90IG9mZnNldCwgdWludDMyX3QgdmFsdWUpICIgJXMgb2Zmc2V0
OiAweCUwNCIgUFJJeDY0ICIgdmFsdWUgMHglMDQiIFBSSXgzMg0KPj4+PiAgbnBjbTd4eF9hZGNf
d3JpdGUoY29uc3QgY2hhciAqaWQsIHVpbnQ2NF90IG9mZnNldCwgdWludDMyX3QgdmFsdWUpICIl
cyBvZmZzZXQ6IDB4JTA0IiBQUkl4NjQgIiB2YWx1ZSAweCUwNCIgUFJJeDMyDQo+Pj4+ICsNCj4+
Pj4gK2FzcGVlZF9hZGNfZW5naW5lX3JlYWQodWludDMyX3QgZW5naW5lX2lkLCB1aW50NjRfdCBh
ZGRyLCB1aW50NjRfdCB2YWx1ZSkgImVuZ2luZVsldV0gMHglIiBQUkl4NjQgIiAweCUiIFBSSXg2
NA0KPj4+PiArYXNwZWVkX2FkY19lbmdpbmVfd3JpdGUodWludDMyX3QgZW5naW5lX2lkLCB1aW50
NjRfdCBhZGRyLCB1aW50NjRfdCB2YWx1ZSkgImVuZ2luZVsldV0gMHglIiBQUkl4NjQgIiAweCUi
IFBSSXg2NA0KPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9hZGMvYXNwZWVkX2FkYy5oIGIv
aW5jbHVkZS9ody9hZGMvYXNwZWVkX2FkYy5oDQo+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+
Pj4+IGluZGV4IDAwMDAwMDAwMDAuLjJmMTY2ZThiZTENCj4+Pj4gLS0tIC9kZXYvbnVsbA0KPj4+
PiArKysgYi9pbmNsdWRlL2h3L2FkYy9hc3BlZWRfYWRjLmgNCj4+Pj4gQEAgLTAsMCArMSw1NSBA
QA0KPj4+PiArLyoNCj4+Pj4gKyAqIEFzcGVlZCBBREMNCj4+Pj4gKyAqDQo+Pj4+ICsgKiBDb3B5
cmlnaHQgMjAxNy0yMDIxIElCTSBDb3JwLg0KPj4+PiArICoNCj4+Pj4gKyAqIEFuZHJldyBKZWZm
ZXJ5IDxhbmRyZXdAYWouaWQuYXU+DQo+Pj4+ICsgKg0KPj4+PiArICogU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXINCj4+Pj4gKyAqLw0KPj4+PiArDQo+Pj4+ICsjaWZu
ZGVmIEhXX0FEQ19BU1BFRURfQURDX0gNCj4+Pj4gKyNkZWZpbmUgSFdfQURDX0FTUEVFRF9BRENf
SA0KPj4+PiArDQo+Pj4+ICsjaW5jbHVkZSAiaHcvc3lzYnVzLmgiDQo+Pj4+ICsNCj4+Pj4gKyNk
ZWZpbmUgVFlQRV9BU1BFRURfQURDICJhc3BlZWQuYWRjIg0KPj4+PiArI2RlZmluZSBUWVBFX0FT
UEVFRF8yNDAwX0FEQyBUWVBFX0FTUEVFRF9BREMgIi1hc3QyNDAwIg0KPj4+PiArI2RlZmluZSBU
WVBFX0FTUEVFRF8yNTAwX0FEQyBUWVBFX0FTUEVFRF9BREMgIi1hc3QyNTAwIg0KPj4+PiArI2Rl
ZmluZSBUWVBFX0FTUEVFRF8yNjAwX0FEQyBUWVBFX0FTUEVFRF9BREMgIi1hc3QyNjAwIg0KPj4+
PiArT0JKRUNUX0RFQ0xBUkVfVFlQRShBc3BlZWRBRENTdGF0ZSwgQXNwZWVkQURDQ2xhc3MsIEFT
UEVFRF9BREMpDQo+Pj4+ICsNCj4+Pj4gKyNkZWZpbmUgVFlQRV9BU1BFRURfQURDX0VOR0lORSAi
YXNwZWVkLmFkYy5lbmdpbmUiDQo+Pj4+ICtPQkpFQ1RfREVDTEFSRV9TSU1QTEVfVFlQRShBc3Bl
ZWRBRENFbmdpbmVTdGF0ZSwgQVNQRUVEX0FEQ19FTkdJTkUpDQo+Pj4+ICsNCj4+Pj4gKyNkZWZp
bmUgQVNQRUVEX0FEQ19OUl9DSEFOTkVMUyAxNg0KPj4+PiArI2RlZmluZSBBU1BFRURfQURDX05S
X1JFR1MgICAgICgweEQwID4+IDIpDQo+Pj4+ICsNCj4+Pj4gK3N0cnVjdCBBc3BlZWRBRENFbmdp
bmVTdGF0ZSB7DQo+Pj4+ICsgICAgLyogPHByaXZhdGU+ICovDQo+Pj4+ICsgICAgU3lzQnVzRGV2
aWNlIHBhcmVudDsNCj4+Pj4gKw0KPj4+PiArICAgIE1lbW9yeVJlZ2lvbiBtbWlvOw0KPj4+PiAr
ICAgIHFlbXVfaXJxIGlycTsNCj4+Pj4gKyAgICB1aW50MzJfdCBlbmdpbmVfaWQ7DQo+Pj4+ICsg
ICAgdWludDMyX3QgbnJfY2hhbm5lbHM7DQo+Pj4+ICsgICAgdWludDMyX3QgcmVnc1tBU1BFRURf
QURDX05SX1JFR1NdOw0KPj4+PiArfTsNCj4+Pj4gKw0KPj4+PiArc3RydWN0IEFzcGVlZEFEQ1N0
YXRlIHsNCj4+Pj4gKyAgICAvKiA8cHJpdmF0ZT4gKi8NCj4+Pj4gKyAgICBTeXNCdXNEZXZpY2Ug
cGFyZW50Ow0KPj4+PiArDQo+Pj4+ICsgICAgTWVtb3J5UmVnaW9uIG1taW87DQo+Pj4+ICsgICAg
cWVtdV9pcnEgaXJxOw0KPj4+PiArDQo+Pj4+ICsgICAgQXNwZWVkQURDRW5naW5lU3RhdGUgZW5n
aW5lc1syXTsNCj4+Pj4gK307DQo+Pj4+ICsNCj4+Pj4gK3N0cnVjdCBBc3BlZWRBRENDbGFzcyB7
DQo+Pj4+ICsgICAgU3lzQnVzRGV2aWNlQ2xhc3MgcGFyZW50X2NsYXNzOw0KPj4+PiArDQo+Pj4+
ICsgICAgdWludDMyX3QgbnJfZW5naW5lczsNCj4+Pj4gK307DQo+Pj4+ICsNCj4+Pj4gKyNlbmRp
ZiAvKiBIV19BRENfQVNQRUVEX0FEQ19IICovDQoNCg==

