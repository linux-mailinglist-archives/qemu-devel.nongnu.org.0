Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3433443421
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:57:11 +0100 (CET)
Received: from localhost ([::1]:46502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhx5y-0007Yz-JT
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mhx2z-000347-0w
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:54:05 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:40563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mhx2w-0007bB-Sp
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1635872042; x=1636476842;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fXD/qWQIvuVaJmzTP9+IENIsXDSzjlofEcHTkNQCT24=;
 b=uAFpxbCXO3hTmt36Q0pxK6ZlDOs5qz7eeqasy2UkESbL7PpyrmY0sgAJ
 2VZMDdVp+Tg82Z2r8HJ8HewZBz1N74gEk7tOSszFbvry5tVoXha0BC36Z
 k09+sJn2Dpo8fx6hFOxyngLylyiqG7qlDsk1XUBkXUG676cXWbYv9UoaW U=;
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 16:54:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ob9ORGXW1wdlsDxmjkVCQYGtXH0Ly7wRavbxzYRPFaCaxxjXgzpxb1drTdobiVzj/xjSmxj4OdJO/NoD5CsNhs+YEZcbR/6+G6Yb18VmEj26HDmPAWxS4m9fq3r0WToxZirVvGM14hMg9YHXUquvArloKnf+pMlQrWYp6eW1qKC7GjnGekKTw8nHGq2mFV/Kt5omk8OmDQCnBmOfdAclJticLXXJ2hIM3hxA6zzWy3F8zcg1iAHBmXCSIJcZXUheWfIWYBt7rZxIfPbGUX27cDEricBqC/rKMXiQQM1wxsh7iw/JPDuUkYH1jly3VQmcWOeOAIyVGTHpjuM6GDTXrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXD/qWQIvuVaJmzTP9+IENIsXDSzjlofEcHTkNQCT24=;
 b=ktqe1ZK4kBkxhP7zXcp1S0IMgLKpFQ7MhL8b9BFnm6voEPXw012DMTHMp9lUqk2vaK/ztF/C38eihgZOjg/bh4r37FJNue+V54h/qgmkU3s31ZdbTTI1M4bgDdS54Ej5DoASNBbKHqmydw6nNrmmKOmJysbwwIFwSV6o2GQO/SI6vQVAqych8YzGqV/nA/fNkEY/2DelaXSNqyCCM5QhsNJRO5OyZ5/VFykPGOBc2ojonAoKDR1aGIgrdblS0ELEF/EaLC6g+nFT0Q82mR7UQYHzd21uUXxBpm1W31HU8yvQsYdoeWP8f+Co1dWGuQGH2N9gY9RtjFlvd1gUJXbBGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN4PR0201MB3438.namprd02.prod.outlook.com
 (2603:10b6:803:48::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 16:53:56 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04%5]) with mapi id 15.20.4649.018; Tue, 2 Nov 2021
 16:53:56 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Subject: RE: [PULL 28/30] Hexagon HVX (tests/tcg/hexagon) hvx_misc test
Thread-Topic: [PULL 28/30] Hexagon HVX (tests/tcg/hexagon) hvx_misc test
Thread-Index: AQHXznZ17I9Od8eOSkWYgK05UEqDb6vuet4AgAA1MoCAAAbMIIAAApEAgAAMooCAAZ7voIAADx8AgAABtwA=
Date: Tue, 2 Nov 2021 16:53:56 +0000
Message-ID: <SN4PR0201MB880807096E4D98700320E4FFDE8B9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <1635698589-31849-1-git-send-email-tsimpson@quicinc.com>
 <1635698589-31849-29-git-send-email-tsimpson@quicinc.com>
 <e1d3d003-f287-7f82-d604-6f43b0d9c55c@amsat.org>
 <2f35d0c6-0ba7-b911-56db-c1ed9ae4afbc@linaro.org>
 <SN4PR0201MB8808814113CBE84889CD5234DE8A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <3e93e507-da92-0a1c-346b-ebfde27168fc@amsat.org>
 <d2395c92-4ece-31a3-8bd6-24345c946780@linaro.org>
 <SN4PR0201MB8808870B218F0DFCE1AE4B20DE8B9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87zgqmjypq.fsf@linaro.org>
In-Reply-To: <87zgqmjypq.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5d25824-4bc7-44f9-664b-08d99e215bea
x-ms-traffictypediagnostic: SN4PR0201MB3438:
x-microsoft-antispam-prvs: <SN4PR0201MB3438462022CF501FCA41ED11DE8B9@SN4PR0201MB3438.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HX9OWqt9aUGppaPaFUKYGbKTdZMaHNrRs/GJpR7Z/xBSor2OxCZ6E8EHcz38mM19kjoXy4B400LM3HgrPyZNnOCJfYe7gZxbDEx5WbkR16Q4coJvTM3CAHVMrvkxLEeLaffsuitXdtS1yc0hsveG6uOv7IriRup/lWC+GWrETE2Cwm10VblZGevQ84XcKmgI/fUjRF2/ptwV1Abv6OVxjXKU60jT6MN0iYsJt4QKXRI+ZB4M0b/zpUNTkryehGTgtQz9ZL3WtUXGSA5Y8dHP+0qMtFJvP9NNQ7gIBANb/FMIdEdhPwxAg92C38kTxfVcK+mD5FCSmF1rbWlpasn1J7w5J4guNarLlkO7UXA3AY8BmmrcI9ukXERxe+f3JET2SuyCmddVQ/c1pdzDnP+dTtJ64PcC3x0hTitr+TwTK8E7lkL7FQ+AyTUvL16/vDqm+LBmEPkDyZNymrJiXShd6v1ijd8mmcvnUZNGJU9L3WjIlIlh+W7yhpkLjz1GHaP+eCFXaGJL0smNIt+LbpETRYXMzr9Ih2e1vS/cSuult4Q+QV0oE+Mc0pZ0cd8Rd4hjZZLRmJyUZWnVkjJH908FewmPdbX7J+E7LdJtPZpAqRmBeletfjvqNJ2qMlglez4zZP4KPjDwc+Sa9NKz1Qu4dKNaqtzHaeqOphZKwbA8CaE9TlJcrZHNiJ+tE4Mtd9vDGoFkRH14MrQVyFl8C8xzi7ZUAi5+vO6H7X7J/vjc9nRtiP6iIkGAbijhjAqAbsdBExWYx6sRx0EvIet1HNYwVUpcc6gtMgFzsEHn9URlWWg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(64756008)(66556008)(66946007)(2906002)(8676002)(66446008)(186003)(76116006)(55016002)(6916009)(9686003)(66574015)(38070700005)(966005)(38100700002)(26005)(6506007)(7696005)(86362001)(107886003)(508600001)(122000001)(83380400001)(53546011)(54906003)(52536014)(5660300002)(33656002)(8936002)(316002)(4326008)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUJCRXpVZ2gxOWVuUTh1TkNOWXFPRS9aKzdRdHpVTmxhTDNrbnVHeHFMK0sw?=
 =?utf-8?B?akRzMS80dDFGLzA0RjZSUFZWeFRhUlB4bDc0cHROUXNXWFd3djZ1WFZ6QkNB?=
 =?utf-8?B?MzJLM2JPUlBUWnF6Z2d4ZldlNTQvc3BsazlXeXhIQlB0QnRjYnBDMURwUVgz?=
 =?utf-8?B?d0owYSttNVZIdk5sNlBFc0FhNkJwQ1lTSHhTSGZSZFVQMlFubnhqTE5uYWU0?=
 =?utf-8?B?Y0k5ZWl2S2tsOHl5WXg0QXZYTFRXdFpPL3hVQ0oyRHpwSzZsbWxMM0hEVkh6?=
 =?utf-8?B?Z0hYQk82Ykp1VjAyczlYYXJnVmI3NU1QTGRid3Z3RVJkc0daaC9JRXJjN3dr?=
 =?utf-8?B?WkN5S2xVQmV4bUVBY3BDNWZ1MW5aRlRQV2Q4WHlNeExuc3RTL2Y4MndWaUp0?=
 =?utf-8?B?LytyaU8xNW1jbEdQaTlJWGVhR2J4N29sRWZYVk53M25oV2NLN28vajFlWEN5?=
 =?utf-8?B?dlJjdnBiYzZWM2syaWMxaFF3bmNtZzVNcmZMWlhBbEVhMnkxVmUybVdFbmRk?=
 =?utf-8?B?bkFaaTNzYm0xUEFZWGZCUGhxNUJhSXlKZTRZbDMvVFVuNmxxbTVjaGxDRGFM?=
 =?utf-8?B?VmRiTzVXcXF5RHp3Z3BWbFNpVENWQWJDNWRwSkxUb0RzbWg3S0tpazVyalVF?=
 =?utf-8?B?UVBodFdoa0Y2WXp5N0ppN0pqbm54WTBQbmZqaXVrTUs0VVBVdmlURUludWVV?=
 =?utf-8?B?N1MzUkFxeWlZcjdBenk1Y0tUUkhOVjZLRWd4RmJ6cE5hWlFKODhoQTVLZHMv?=
 =?utf-8?B?a2VNRndSYUw5WXZPeS92K2Q0aXE4RC8vRUsyVTBCa29IUnQyQ2Z1N3UwdkZM?=
 =?utf-8?B?K3o3dDVBMDhrMnk3ZTZyY25QaHJvVWpmWmNLVDBhdzNBcWtOdENGU1JiOVZ1?=
 =?utf-8?B?YmZjOEpNUHNRWTFTVk53VlNpQnZxTTlQL3lzQ2h4ODlhQlk2Mm5GSzdXcnNN?=
 =?utf-8?B?VFB3VTZzaHZNejRYRW44bnJReTZaaVJFamlaVms0SzRpelJ2bHB4QlhEQ1c3?=
 =?utf-8?B?MXBHM1A5MGJTci83SlRIK093NE9ab2NBTDZiZWV6R2ZpdzVJa1c5b1NnZkN5?=
 =?utf-8?B?K3o0TjVUMjE2dTNzVGpJNkdQeHNJTUtqYTVmSm5tWkMvaENSTm1hMElxcWl6?=
 =?utf-8?B?dkZRUlJKeFVLd3MwM3Rmdzc2MkdjeUdGSm1hKytpRkFEOHhnZG43VElKL0Y2?=
 =?utf-8?B?WCtjemp3Rk9NV3JYZDBhd0lxbDNxYk9TU2xVN3FxOU44UlFkNHZud3I1aE9l?=
 =?utf-8?B?cklGN1VSQU5NbDhWRmM0V3oyV0hOMFdkSWNjdWVxWEpCakNPNXBjblZWUjBi?=
 =?utf-8?B?WTdrLzBZZjBpYTkvNkxGY2U1M3dRdDdiZnZKVTZMUGViRTBKVk1QdmZuY0pC?=
 =?utf-8?B?WldLUi9zM2FWbFBJQWdFS0xoRkV2TzFIT3EvZXN3SVNTVnJPYWNOMTdyVzJw?=
 =?utf-8?B?S2dra1N4V2wrVlBwZkpEYS9GMlhBbkNOVnRxL3NVc1NPYnRsY3hjZGFNVDNN?=
 =?utf-8?B?Z0NHMHV6NXJMZTBPT2tWRG5RTXBQUG1KeGdxY1JZN0JIMmpRNVJ1SlBFTHdZ?=
 =?utf-8?B?djJoTEJsOE1TSnd6S2p5K3VkQkVRR0gvQ1ZRNkhxcjRsMW43MmQrVVJQTU1E?=
 =?utf-8?B?ZzI1WHBTTTYzNW5MVlBnZGF2QmlWRXNzaVpGa3hxSCtlMFA2OE9pT29jUzNM?=
 =?utf-8?B?QTRTSW5LMnErQjhWckF2d0NRcUpxNUZwVnZIbHlvNGNFZnVaaHZDQWlDZXo4?=
 =?utf-8?B?WmNvUVlONDRwZTQ3OHBacFd2YW9vNUhxVTA4L285S3YwMFBxSHFXNUJRckJ2?=
 =?utf-8?B?b0ZoTks5NmJwUy9ianY2Ni8xWk9FYzlmRkw4cVl4czZibGRlT0xJWDBHTkhT?=
 =?utf-8?B?TWJnWm1qYk9XcmVkTnFJUHBHS3ZScGxSSDd3RXRMZGdETGhyZGZ5Q1M2RlU4?=
 =?utf-8?B?R0lOdS9kQlBEMi9EeVpFdjNuRm5DVXljbm02cGV2LzlhVkFUMytXaWpVVVhQ?=
 =?utf-8?B?ejZDalVVQVZWM2pRWVBSWEdyUEVmTlM3UnNaZUwrRlpGalkybk9GU1g1cmlV?=
 =?utf-8?B?NVRuR1NmNzhXY0w2S0ZsRTFYMlZkWG5Kd0J5QVVkak8wU2kzdjd6YmdBaDBj?=
 =?utf-8?B?OXJGZmo2QTlETjJndjNKNDA0MUdrbTR4L2NHaFVJSjEzdzhBZVZaaHdKNXg0?=
 =?utf-8?Q?/zysKq0L564WKZavkXXb8Pc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d25824-4bc7-44f9-664b-08d99e215bea
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2021 16:53:56.1559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nwjlmO38K3wZPZ1edvaM7Y0+9BCnyoXg73rcWo/F/fmqNSR9mel5KWoJNaXwqc/aY9go7y2ZTc9nAmr1NyA9vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3438
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brian Cain <bcain@quicinc.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleCBCZW5uw6llIDxh
bGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAyLCAyMDIx
IDExOjQyIEFNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQo+
IENjOiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz47IFBo
aWxpcHBlIE1hdGhpZXUtDQo+IERhdWTDqSA8ZjRidWdAYW1zYXQub3JnPjsgcWVtdS1kZXZlbEBu
b25nbnUub3JnOw0KPiBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmcNCj4gU3ViamVjdDogUmU6IFtQ
VUxMIDI4LzMwXSBIZXhhZ29uIEhWWCAodGVzdHMvdGNnL2hleGFnb24pIGh2eF9taXNjIHRlc3QN
Cj4gDQo+IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4gd3JpdGVzOg0KPiAN
Cj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogUmljaGFyZCBIZW5k
ZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+ID4+IFNlbnQ6IE1vbmRheSwg
Tm92ZW1iZXIgMSwgMjAyMSAxMDowMyBBTQ0KPiA+PiBUbzogUGhpbGlwcGUgTWF0aGlldS1EYXVk
w6kgPGY0YnVnQGFtc2F0Lm9yZz47IFRheWxvciBTaW1wc29uDQo+ID4+IDx0c2ltcHNvbkBxdWlj
aW5jLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgQWxleCBCZW5uw6llDQo+ID4+IDxhbGV4
LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiA+PiBDYzogcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnDQo+
ID4+IFN1YmplY3Q6IFJlOiBbUFVMTCAyOC8zMF0gSGV4YWdvbiBIVlggKHRlc3RzL3RjZy9oZXhh
Z29uKSBodnhfbWlzYw0KPiA+PiB0ZXN0DQo+ID4+DQo+ID4+IE9uIDExLzEvMjEgMTA6MTcgQU0s
IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPiA+PiA+IE9uIDExLzEvMjEgMTU6MDks
IFRheWxvciBTaW1wc29uIHdyb3RlOg0KPiA+PiA+PiBQbGFuLUEgc2hvdWxkIGJlIHRvIHVwZGF0
ZSB0aGUgY29udGFpbmVyIHdpdGggdGhlIG5ldyB0b29sY2hhaW4uDQo+ID4+ID4NCj4gPj4gPiBJ
SVVDIFJpY2hhcmQgaXMgZ29pbmcgd2l0aCBQbGFuLUE6IHdhaXQgQWxleCBxdWV1ZSBnZXQgbWVy
Z2VkLCB0aGVuDQo+ID4+ID4gcmV0cnkgbWVyZ2luZyB0aGlzIHB1bGwgcmVxdWVzdC4NCj4gPj4N
Cj4gPj4gQ29ycmVjdC4NCj4gPg0KPiA+IEFncmVlZC4gIEp1c3QgbGV0IG1lIGtub3cgaWYgQWxl
eCBpc24ndCBnb2luZyB0byBnZXQgdGhlIG5ldyB0b29sY2hhaW4NCj4gPiBtZXJnZWQgaW4gdGlt
ZSwgYW5kIEkgY2FuIGdvIHRvIHBsYW4gQi4NCj4gDQo+IFRoZSBQUiBoYXMgYmVlbiBhIHBhaW4g
dG8gZ2V0IHdvcmtpbmcgYnV0IGl0IHNob3VsZCBiZSBpbiBzb29uLiBKdXN0IG5lZWQgdG8NCj4g
d29yayBvdXQgd2h5IHRoZSBzaWduYWxzIHRlc3QgaGFzIGJyb2tlbiBiZXR3ZWVuIG1hc3RlciBh
bmQgbXkNCj4gUFI6DQo+IA0KPiAgaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11
Ly0vam9icy8xNzM5Mjg4NTEwI0wxMzE4DQo+IA0KPiB2cw0KPiANCj4gIGh0dHBzOi8vZ2l0bGFi
LmNvbS9zdHNxdWFkL3FlbXUvLS9qb2JzLzE3NDAwNDgwMzQjTDEzMTYNCj4gDQo+IENvdWxkIGl0
IGJlIGEgdG9vbGNoYWluIHRoaW5nPw0KDQpOb3QgbGlrZWx5IGEgdG9vbGNoYWluIHByb2JsZW0u
ICBJZiBJIGNhbiBhY2Nlc3MgYm90aCBvZiB0aGUgc2lnbmFscyBiaW5hcmllcywgSSBjYW4gY29u
ZmlybS4NCg0KUmljaGFyZCB3YXMgZG9pbmcgc29tZSBjaGFuZ2VzIGluIHFlbXUgcmVsYXRlZCB0
byBzaWduYWxzLiAgQXJlIGhpcyBjaGFuZ2VzIGF2YWlsYWJsZSBpbiBib3RoIHJlcG9zPw0KDQoN
ClRheWxvcg0K

