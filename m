Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF4B3D5227
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 06:05:30 +0200 (CEST)
Received: from localhost ([::1]:49210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7rrt-0007tj-6b
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 00:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1m7rp2-0006DN-C4
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 00:02:32 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:61812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1m7roy-00073Y-Tv
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 00:02:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1627272148; x=1627876948;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cWoKlVdpsNBDHvUR9JqPGRiTT3cynhXXZAWQp9dHNbU=;
 b=Agc2pFi0r0p2JAPFCsCDGHQkLsXJa5awT87R8ABktDHyuZYSwxnwyTZJ
 A4BV58e12rwN1KSKHUpUzT9AFxNa14OILOErCWezvlS8vq11fhCi4ghLC
 PBB995itjMbrSxpC94ypE/iHisjAYza/R+EcP6Lekpjp6e4YTTZljNY8S Y=;
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 04:02:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2WIqXvl0qwBy7dGHcJTYnqMSnQx3oe2uOhNTjmeM1VAux4Kx4DnigJjGgNuQGDlcJ+02CCk64SSUZHPhL6j2UTzE4fFOjFjbz6/5SGZr/v/nXh6p+WzOIxX/emqdZTL4jvqb1s+qA8eD6s2nTg0oArvc/aK2lJ4TJLMUbC/edDKPLrwq7hdborJZCql1BdEW2MdeP5Ne35+/qQ4X3EZoVgTcOXKxRGk6TYuLYhHPAte7ytoWOef4YBOP2rA/nO6bQ1jpx04WZO27CfFpo/TrJU2EABjIQ1KKMxPZEhANiWZs7kGud1s1nkWKEjgbpcsS6QdqjPeavfLN4aAGlr+Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWoKlVdpsNBDHvUR9JqPGRiTT3cynhXXZAWQp9dHNbU=;
 b=aj60H4BJtablQRZwN2PAgbFNZclVz0D2tEAm5TCTUQC0t5h9uN2l06hr6JN0L0lR1k45jvrQxBIC9zhlGYmCDIt1Np/HmNVUXXETtJXO8THiv/5LPzRVCov2D33FBeaNG03w/FwE8JGcfbZaISYu2TEi3Aa9I5PNYt7XgUaLx4JipnKG+aUbJ8G10IJxllEie2nmiAhlNP5LVPn5dOGYsdmaoAW71VW8aO3M4g1S61KG5F8YnJ7Gn9sxC4GVfMxVWbZR5mdOIoxZWSx156Ns0OJ7iGfXG0u/nWopcq1UZ03uRPCBxfvRn1Zis0l9+U2gfOlXTAWYWA+89LU826eASw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB5928.namprd02.prod.outlook.com (2603:10b6:a03:123::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Mon, 26 Jul
 2021 04:02:25 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5%6]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 04:02:25 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 02/20] Hexagon HVX (target/hexagon) add Hexagon Vector
 eXtensions (HVX) to core
Thread-Topic: [PATCH 02/20] Hexagon HVX (target/hexagon) add Hexagon Vector
 eXtensions (HVX) to core
Thread-Index: AQHXcfZYpSSqEe5fDUGe1KlX9n47JKtTyEuAgACQ1ZA=
Date: Mon, 26 Jul 2021 04:02:25 +0000
Message-ID: <BYAPR02MB4886FB40A259261C7E10A2EBDEE89@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
 <1625528074-19440-3-git-send-email-tsimpson@quicinc.com>
 <9d5e6225-4ffa-d394-17b9-518c58842186@linaro.org>
In-Reply-To: <9d5e6225-4ffa-d394-17b9-518c58842186@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dee293a4-8960-47fa-c246-08d94fea2d6b
x-ms-traffictypediagnostic: BYAPR02MB5928:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB59289E7B912B3DF413758892DEE89@BYAPR02MB5928.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g+rWJIYBNuEemf95YPNBbwjKuXkSmxkpwhZLKjwrA1ZPJKlyIEFB4XulSvk6eWZOZqVtifiFC6aqI7zEXYP8PblJ5xYkZe3oQrGxQ3D2jW6VM1nkWrb9f4VMpPKF0eH+zEdZ4PfPhh4rSP/F/ApH2GLB4yr5t5xoG1UjCRkt+CKR0tXuesCct3DGScVJblW71OhemT/r2dJDfMNv9iOwsGHIoNP2QUUnuGdBnLPlzi+f+1agekakWppifE3rcwpoB7OIjWgTRwWmEMdcnoAF8GBunHOXtzk63aZ/DXb8Vw39ToISkow1DsrXalYBF81S3/F8rqq+uEEFftokX8h1JfnwqLFnbjRGMVCUn6Q4cK4Wnj6C6kJYY9eIMF9vzaPwMTs6Ropd9B9mNd4JfKUqJjSr0JOQ55kmdZqOErrnUUTc6Tw1BBDP7hFrI9Fxh8CifeTx6ioxMAd33X8p5uyJ20bHL8rK5vKoSw57nU9RsI9Q4ZAPfTDJ3VGD1sgeD9hsc+E7RvLbryiGbU6EM7ZbBxamKmv1t2e2qiwThH6HumAr9YGPdh3efAgIAMsEK3UxIlslq/nFFcH4N6il4NF06X63o7fPD7asEvZuYU6yLSezxLglWBAhEaE66Id8ZH+W3/9hxu5HJBqG+9bX9/MAtl3qEe5qBF3+2TOjIfsna51OY9HbnKyRAkuWoRTuiONM1n3nWfyMJ3hf/E7evMi3/w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(9686003)(508600001)(186003)(26005)(71200400001)(66556008)(122000001)(55016002)(66476007)(66946007)(33656002)(64756008)(4326008)(5660300002)(8936002)(38100700002)(66446008)(6506007)(110136005)(316002)(8676002)(54906003)(2906002)(83380400001)(7696005)(52536014)(86362001)(53546011)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXg2OTRlVDkrZ1FXRG5MUnE0T25UNXpUakJkNC9UUDEwWlcyZklLaXA4K0Vr?=
 =?utf-8?B?MUdSOFY1dkFsZlE2YmhWZ3djQVhNVUJkSU5sckJBaGFlMHFmN0pIQzFSOCt5?=
 =?utf-8?B?NkxDZ0FaMEFpd0tWV042cWk3RVpaY3IyWFFJSWlWM2ZSUHVXV3lkT29ubDg3?=
 =?utf-8?B?VFNiSGNEeVRyaUF2OXJ6cmE1L1NYNDh5WE0wc3lWNVU0dGVPNVdhMUNzRDJa?=
 =?utf-8?B?aFo5YThuQTBoM1pLNDlvTUg5RlZRVU82aW5OYTlEWTZMU0VJc0dBclBXWHo4?=
 =?utf-8?B?UXhzQmJFMEFxK1FyOGlWUkpMY3V4emhkOVFFNnBVTFpqcnArM21lbWYxRnJP?=
 =?utf-8?B?QXJEV0lnMzNSeTdUWnIwbE9HYUdJY0ZSeldIZ05UbjZNOVBTUTFsOUh5SUZS?=
 =?utf-8?B?akJTQkk5Qk03ZUx0VjNyWG50VFcrclNCYzdsQ2dGVkZLYUo0YVdCY2Z3eE9r?=
 =?utf-8?B?SEwrT050YVUyYnRBM2FtUlg2NER1dFEwTlpZcDFmUEEzUEZlUUV4bWVpeXZy?=
 =?utf-8?B?YW5kV1U2RVU0NlQ4VFl6ZWlvU1A0K0s3MXNvY3FxU2J4aldiODE3TGVxcThN?=
 =?utf-8?B?N3QvcjhDUGRyWkE1ZUlRRzhtYU81RHliUElDT1pYOVNNbkEwRktTa0tleENp?=
 =?utf-8?B?OTVJdWtVVm5xUjVUeFBsWHViOEpXbWNza0tuVm5xQ1dYeEZZMTM4UVF5R055?=
 =?utf-8?B?MDRGZlRyY1E1NzgyMERQaVJXL0pZa2tTbG5nNUlEQUZtSGFvM0oxRSthM1lr?=
 =?utf-8?B?R0U2OUx2K0hpeGJGam0rclIzNHVuUTZ6eVRJb3BaZkkxbjVYM09hRU1LNVpL?=
 =?utf-8?B?M0UvaGV1VjREWC9DUDBQSUViUEFjVWZlaDVVbTRta2JmKzJnRjAzR1FSVVRr?=
 =?utf-8?B?eGNxNHZWa3FzVm0vMzNsSjE0N2d1QUR5SUgvaVk1ZlpnbFRKaGdFODRlQ3VC?=
 =?utf-8?B?NGxTc1dDcG8vZVdDZDN1SDFmU2JCajMxS1d2Q0xDR25YNWVHTjZCbjFsdHpB?=
 =?utf-8?B?cmRnOExIaGhWQWk5TzNsRDMyVmU1K0g5MC9pOTREVnFOYmtDRGsxb1ZWa2V3?=
 =?utf-8?B?Y2FITjhqRndnem9iOG8wY0p6Z0pRQ3dMeVkvL3VDS0swbUpmbHZTYXBpb0ho?=
 =?utf-8?B?bkk2ZGRGYzV1QXdhMzhaaHFvakhKVFZoUHB1MXV1U0pvdzFJMFJZQlpoM0M5?=
 =?utf-8?B?MHh3UlV1cWhKMlV1dXlOcHU2U24rUkZHN0VvQU9PTkFFV0xyT1NGMVVoWnll?=
 =?utf-8?B?dUJnZC9yZVgxT1J0NElNZ2RBeEd1OVRlRjFRNmJsZk9FVWRaY0Y2THg1ZjhX?=
 =?utf-8?B?Y1hBcjhUQ0hPellNNnpSbnNFUU8vQ2Jlam9pZ1FzbVdqbDQrNjdGUTg3bHQ4?=
 =?utf-8?B?d0kzR2JEd2t3TWlLUmVKRG1WVDU4cTczSUhYb1BGdEdGOVVraDdIdFI1cVBi?=
 =?utf-8?B?RkYweXUzZHovMGpieU5ObUxMVWpLYVJQNC9WQ3BNYndEQkZvaENhVWtxZTdq?=
 =?utf-8?B?cEVFZkNZdlp5emxRTThSRnMreHROTisrakMxc3BxMklJZGFPUHZzemdLcUN2?=
 =?utf-8?B?aWxLM3NhREpPeW1aUUhKWEE2ajluT0g4bmxiR2tTRld1T2dHSE5XTDZWU0U5?=
 =?utf-8?B?S0pId1RYNm5Ld1l2emhmVllHaFZaMDhHUWFKeDczZS9iYkg4a1p5NVhSNW1z?=
 =?utf-8?B?eGQ3NjVmZE5kK0pqamp6WXpGa1dGTDdKbjVoQzlXMHRtZ1UrcmJhUzYzTzhC?=
 =?utf-8?Q?WLGXNxBFiZzLMvbNvpd53S2l/U47evm5go0EHEm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee293a4-8960-47fa-c246-08d94fea2d6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 04:02:25.0855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mDgLUaib0dSh31eUhDyhkodAVoN8D3VgwHbL0bwZFqu8rAfl+KvAAsGNxg3QZly97kd94SIOr/W8UqA5QrrlPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5928
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFN1bmRheSwgSnVseSAy
NSwgMjAyMSA4OjA4IEFNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5j
b20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IHBoaWxtZEByZWRoYXQuY29tOyBhbGVA
cmV2Lm5nOyBCcmlhbiBDYWluIDxiY2FpbkBxdWljaW5jLmNvbT47DQo+IHBldGVyLm1heWRlbGxA
bGluYXJvLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDAyLzIwXSBIZXhhZ29uIEhWWCAodGFy
Z2V0L2hleGFnb24pIGFkZCBIZXhhZ29uDQo+IFZlY3RvciBlWHRlbnNpb25zIChIVlgpIHRvIGNv
cmUNCj4gDQo+IE9uIDcvNS8yMSAxOjM0IFBNLCBUYXlsb3IgU2ltcHNvbiB3cm90ZToNCj4gPiBI
VlggaXMgYSBzZXQgb2Ygd2lkZSB2ZWN0b3IgaW5zdHJ1Y3Rpb25zLiAgTWFjaGluZSBzdGF0ZSBp
bmNsdWRlcw0KPiA+ICAgICAgdmVjdG9yIHJlZ2lzdGVycyAoVlJlZ3MpDQo+ID4gICAgICB2ZWN0
b3IgcHJlZGljYXRlIHJlZ2lzdGVycyAoUVJlZ3MpDQo+ID4gICAgICB0ZW1wb3JhcnkgcmVnaXN0
ZXJzIGZvciBpbnRlcm1lZGlhdGUgdmFsdWVzDQo+ID4gICAgICBzdG9yZSBidWZmZXIgKG1hc2tl
ZCBzdG9yZXMgYW5kIHNjYXR0ZXIvZ2F0aGVyKQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVGF5
bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPg0KPiA+IC0tLQ0KPiA+ICAgdGFyZ2V0
L2hleGFnb24vY3B1LmggICAgICAgICAgICB8IDM1ICsrKysrKysrKysrKysrKystDQo+ID4gICB0
YXJnZXQvaGV4YWdvbi9oZXhfYXJjaF90eXBlcy5oIHwgIDUgKysrDQo+ID4gICB0YXJnZXQvaGV4
YWdvbi9pbnNuLmggICAgICAgICAgIHwgIDMgKysNCj4gPiAgIHRhcmdldC9oZXhhZ29uL2ludGVy
bmFsLmggICAgICAgfCAgMyArKw0KPiA+ICAgdGFyZ2V0L2hleGFnb24vbW12ZWMvbW12ZWMuaCAg
ICB8IDgzDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4g
ICB0YXJnZXQvaGV4YWdvbi9jcHUuYyAgICAgICAgICAgIHwgNzINCj4gKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0NCj4gPiAgIDYgZmlsZXMgY2hhbmdlZCwgMTk4IGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgdGFyZ2V0L2hl
eGFnb24vbW12ZWMvbW12ZWMuaA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29u
L2NwdS5oIGIvdGFyZ2V0L2hleGFnb24vY3B1LmggaW5kZXgNCj4gPiAyODU1ZGQzLi4wYjM3N2Mz
IDEwMDY0NA0KPiA+IC0tLSBhL3RhcmdldC9oZXhhZ29uL2NwdS5oDQo+ID4gKysrIGIvdGFyZ2V0
L2hleGFnb24vY3B1LmgNCj4gPiBAQCAtMjYsNiArMjYsNyBAQCB0eXBlZGVmIHN0cnVjdCBDUFVI
ZXhhZ29uU3RhdGUgQ1BVSGV4YWdvblN0YXRlOw0KPiA+ICAgI2luY2x1ZGUgInFlbXUtY29tbW9u
LmgiDQo+ID4gICAjaW5jbHVkZSAiZXhlYy9jcHUtZGVmcy5oIg0KPiA+ICAgI2luY2x1ZGUgImhl
eF9yZWdzLmgiDQo+ID4gKyNpbmNsdWRlICJtbXZlYy9tbXZlYy5oIg0KPiA+DQo+ID4gICAjZGVm
aW5lIE5VTV9QUkVHUyA0DQo+ID4gICAjZGVmaW5lIFRPVEFMX1BFUl9USFJFQURfUkVHUyA2NA0K
PiA+IEBAIC0zNCw2ICszNSw3IEBAIHR5cGVkZWYgc3RydWN0IENQVUhleGFnb25TdGF0ZSBDUFVI
ZXhhZ29uU3RhdGU7DQo+ID4gICAjZGVmaW5lIFNUT1JFU19NQVggMg0KPiA+ICAgI2RlZmluZSBS
RUdfV1JJVEVTX01BWCAzMg0KPiA+ICAgI2RlZmluZSBQUkVEX1dSSVRFU19NQVggNSAgICAgICAg
ICAgICAgICAgICAvKiA0IGluc25zICsgZW5kbG9vcCAqLw0KPiA+ICsjZGVmaW5lIFZTVE9SRVNf
TUFYIDINCj4gPg0KPiA+ICAgI2RlZmluZSBUWVBFX0hFWEFHT05fQ1BVICJoZXhhZ29uLWNwdSIN
Cj4gPg0KPiA+IEBAIC01Miw2ICs1NCwxMyBAQCB0eXBlZGVmIHN0cnVjdCB7DQo+ID4gICAgICAg
dWludDY0X3QgZGF0YTY0Ow0KPiA+ICAgfSBNZW1Mb2c7DQo+ID4NCj4gPiArdHlwZWRlZiBzdHJ1
Y3Qgew0KPiA+ICsgICAgdGFyZ2V0X3Vsb25nIHZhOw0KPiA+ICsgICAgaW50IHNpemU7DQo+ID4g
KyAgICBNTVZlY3RvciBtYXNrIFFFTVVfQUxJR05FRCgxNik7DQo+ID4gKyAgICBNTVZlY3RvciBk
YXRhIFFFTVVfQUxJR05FRCgxNik7DQo+ID4gK30gVlN0b3JlTG9nOw0KPiANCj4gRG8geW91IHJl
YWxseSBuZWVkIGEgTU1WZWN0b3IgbWFzaywgb3Igc2hvdWxkIHRoaXMgYmUgYSBRUmVnTWFzaz8N
Cg0KWW91IGFyZSBjb3JyZWN0LiAgSSdsbCBjaGFuZ2UgdGhpcy4NCg0KPiANCj4gPiAtICAgIHRh
cmdldF91bG9uZyBnYXRoZXJfaXNzdWVkOw0KPiA+ICsgICAgYm9vbCBnYXRoZXJfaXNzdWVkOw0K
PiANCj4gU3VyZWx5IHVucmVsYXRlZCB0byBhZGRpbmcgc3RhdGUuDQoNClRoaXMgd2FzIHVuaW50
ZW50aW9uYWxseSBpbmNsdWRlZCBpbiB0aGUgcGF0Y2ggc2VyaWVzIGZvciB0aGUgc2NhbGFyIGNv
cmUuICBCYXNlZCBvbiBwcmV2aW91cyBmZWVkYmFjaywgSSBrbm93IGl0IHNob3VsZCBiZSBhIGJv
b2wuICBIb3dldmVyLCB0aGlzIGNhbiBhY3R1YWxseSBiZSByZW1vdmVkIGFsdG9nZXRoZXIuICBT
bywgaW4gdGhlIG5leHQgaXRlcmF0aW9uIG9mIHRoaXMgc2VyaWVzLCB5b3UnbGwgc2VlIGl0IHJl
bW92ZWQuDQoNCj4gDQo+ID4gKyAgICBNTVZlY3RvciBWUmVnc1tOVU1fVlJFR1NdIFFFTVVfQUxJ
R05FRCgxNik7DQo+ID4gKyAgICBNTVZlY3RvciBmdXR1cmVfVlJlZ3NbTlVNX1ZSRUdTXSBRRU1V
X0FMSUdORUQoMTYpOw0KPiA+ICsgICAgTU1WZWN0b3IgdG1wX1ZSZWdzW05VTV9WUkVHU10gUUVN
VV9BTElHTkVEKDE2KTsNCj4gDQo+IE9rLCB0aGlzIGlzIHdoZXJlIEknbSBub3Qga2VlbiBvbiBo
b3cgeW91IGhhbmRsZSB0aGlzIGZvciBpbnRlZ2VyIGNvZGUsIGFuZA0KPiBmb3IgdmVjdG9yIGNv
ZGUgaGFzIGdvdCB0byBiZSBwYXN0IHRoZSByZWFsbSBvZiBhY2NlcHRhYmxlLg0KPiANCj4gWW91
IGhhdmUgZXhhY3RseSA0IHNsb3RzIGluIHlvdXIgdmxpdyBwYWNrZXQuICBZb3UgY2Fubm90IHBv
c3NpYmx5IHVzZSAzMg0KPiBmdXR1cmUgb3IgdG1wIHNsb3RzLiAgRm9yIGludGVnZXJzIHRoaXMg
d2FzdGFnZSB3YXMgYXQgbGVhc3Qgc21hbGwsIGJ1dCBmb3INCj4gdmVjdG9ycyB0aGVzZSB3YXN0
ZSBqdXN0IHNoeSBvZiA4ay4NCj4gDQo+IEFsbCB5b3UgbmVlZCB0byBkbyBpcyB0byBiZSBzbWFy
dGVyIGFib3V0IG1hcHBpbmcgZS5nLiA1IHRvIDggdGVtcCBzbG90cw0KPiBkdXJpbmcgdHJhbnNs
YXRpb24uDQoNCk9LDQoNCj4gDQo+ID4gKyAgICBNTVFSZWcgUVJlZ3NbTlVNX1FSRUdTXSBRRU1V
X0FMSUdORUQoMTYpOw0KPiA+ICsgICAgTU1RUmVnIGZ1dHVyZV9RUmVnc1tOVU1fUVJFR1NdIFFF
TVVfQUxJR05FRCgxNik7DQo+IA0KPiBMaWtld2lzZS4NCj4gDQo+ID4gKyAgICAvKiBUZW1wb3Jh
cmllcyB1c2VkIHdpdGhpbiBpbnN0cnVjdGlvbnMgKi8NCj4gPiArICAgIE1NVmVjdG9yIHplcm9f
dmVjdG9yIFFFTVVfQUxJR05FRCgxNik7DQo+IA0KPiBZb3UgbXVzdCBiZSBkb2luZyBzb21ldGhp
bmcgd3JvbmcgdG8gbmVlZCB6ZXJvIGluIG1lbW9yeS4NCg0KVGhlIGFyY2hpdGVjdHVyZSBzcGVj
aWZpZXMgdGhhdCBpZiB5b3UgdXNlIGEgLm5ldyBpbiBhIHBhY2tldCB3aGVyZSB0aGUgdmVjdG9y
IHJlZ2lzdGVyIGlzbid0ICBkZWZpbmVkLCBpdCBnZXRzIHplcm8uICBTbywgdGhlIGdlbmVyYXRv
ciBwcm9kdWNlcyB0aGUgZm9sbG93aW5nIGZvciAubmV3IHJlZmVyZW5jZXMNCiAgICBjb25zdCBp
bnRwdHJfdCBPc05fb2ZmID0NCiAgICAgICAgdGVzdF9iaXQoT3NOX251bSwgY3R4LT52cmVnc191
cGRhdGVkKQ0KICAgICAgICAgICAgPyBvZmZzZXRvZihDUFVIZXhhZ29uU3RhdGUsIGZ1dHVyZV9W
UmVnc1tPc05fbnVtXSkNCiAgICAgICAgICAgIDogb2Zmc2V0b2YoQ1BVSGV4YWdvblN0YXRlLCB6
ZXJvX3ZlY3Rvcik7DQoNCj4gDQo+ID4gKy8qDQo+ID4gKyAqIFRoZSBIVlggcmVnaXN0ZXIgZHVt
cCB0YWtlcyB1cCBhIHRvbiBvZiBzcGFjZSBpbiB0aGUgbG9nDQo+ID4gKyAqIERvbid0IHByaW50
IGl0IHVubGVzcyBpdCBpcyBuZWVkZWQgICovICNkZWZpbmUgRFVNUF9IVlggMCAjaWYNCj4gPiAr
RFVNUF9IVlgNCj4gPiArICAgIHFlbXVfZnByaW50ZihmLCAiVmVjdG9yIFJlZ2lzdGVycyA9IHtc
biIpOw0KPiA+ICsgICAgZm9yIChpbnQgaSA9IDA7IGkgPCBOVU1fVlJFR1M7IGkrKykgew0KPiA+
ICsgICAgICAgIHByaW50X3ZyZWcoZiwgZW52LCBpKTsNCj4gPiArICAgIH0NCj4gPiArICAgIGZv
ciAoaW50IGkgPSAwOyBpIDwgTlVNX1FSRUdTOyBpKyspIHsNCj4gPiArICAgICAgICBwcmludF9x
cmVnKGYsIGVudiwgaSk7DQo+ID4gKyAgICB9DQo+ID4gKyAgICBxZW11X2ZwcmludGYoZiwgIn1c
biIpOw0KPiA+ICsjZW5kaWYNCj4gDQo+IFVzZSBDUFVfRFVNUF9GUFUsIGNvbnRyb2xsZWQgYnkg
LWQgZnB1Lg0KDQpUaGVzZSBhcmVuJ3QgRlAgcmVnaXN0ZXJzLCBidXQgT0suDQoNCg0KPiANCj4g
PiAtICAgIGNjLT5nZGJfbnVtX2NvcmVfcmVncyA9IFRPVEFMX1BFUl9USFJFQURfUkVHUzsNCj4g
PiArICAgIGNjLT5nZGJfbnVtX2NvcmVfcmVncyA9IFRPVEFMX1BFUl9USFJFQURfUkVHUyArIE5V
TV9WUkVHUw0KPiArDQo+ID4gKyBOVU1fUVJFR1M7DQo+IA0KPiBUaGV5J3JlIG5vdCByZWFsbHkg
Y29yZSByZWdzIHRob3VnaCBhcmUgdGhleT8NCj4gU3VyZWx5IGdkYl9yZWdpc3Rlcl9jb3Byb2Nl
c3NvciBpcyBhIGJldHRlciByZXByZXNlbnRhdGlvbi4NCg0KSSdsbCBsb29rIGludG8gdGhpcy4N
Cg0KDQpUaGFua3MsDQpUYXlsb3INCg0K

