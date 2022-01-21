Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1440F4965D2
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 20:42:15 +0100 (CET)
Received: from localhost ([::1]:55370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAznW-0001mH-UV
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 14:42:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmillwood@masten.aero>)
 id 1nAz34-0001Dh-Rl
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 13:54:11 -0500
Received: from mail-cy1usg02on0095.outbound.protection.office365.us
 ([23.103.209.95]:61664 helo=USG02-CY1-obe.outbound.protection.office365.us)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmillwood@masten.aero>)
 id 1nAz33-0001oN-3j
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 13:54:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=ilwvVeSp8hL+KJkXCzGRK2Lr6tlohNT0QaFpAepp5x2Wf8O0jRgo23FqvM8mm5Ty1I2NY3jN4w84rHYs5tGxOw15hB0F95ZFukhtRG5m+AD9mpHiZlvgAnzlHBKQeQxPAFUGwaPJFgHDsAoz+pNqguEK8v3PcpqdLNvxQ048B2OJplLBrq+kiGQ+ArssxpaBAdQv4MtadfC2tT0q4v0mOmmawobU//rOtygnGEm90Gb5hZ5jqQ53QafhH4kPN8atzkBB/ffbJ6C7w6NG3fYVdz+oFq99zRcvwyvfIEJFpQ1C2BblqfBmvjr57LysP/LIyE1bK28OzzDPl5ZHKAxsvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbuL2Pd/M+UTiLsQ+5BS5KYYBlYYmOuCqyZEitBkkzw=;
 b=FXLOdvF7gg9IByVHI2i9I9bRzPC07yq5LZw/5+1WHk+R8UpE1FMa2Iunawa0d45Xrq1h6gQpzv5kjtNxnVbv2ZRB44PxbNVEKUx/q+KB0tbonqhoerOnglvED9MtWW2Fxx56qmdLmDVVjk/iJ+sy/DderMhuhhA1Lex/XHFh38XVxdoeCy69PtL4oINeqYA7v+CrmCJuzUbDGw5WMeQtmBkSJq6F11x3iGEPV+rMu5WqcRJV9bOciI4l27WZpcF3U99f9w9ZyOhQOtM/CjZanxnJBkquyHT+fShijv3hTc7Vvv5ubsP9ExChMsbbU4BgR9cP681UMUefRQSG81RrCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=masten.aero; dmarc=pass action=none header.from=masten.aero;
 dkim=pass header.d=masten.aero; arc=none
Received: from SA1P110MB1293.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:192::10)
 by SA1P110MB1375.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:197::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 21 Jan
 2022 18:38:38 +0000
Received: from SA1P110MB1293.NAMP110.PROD.OUTLOOK.COM
 ([fe80::d0bb:65d2:3de0:118c]) by SA1P110MB1293.NAMP110.PROD.OUTLOOK.COM
 ([fe80::d0bb:65d2:3de0:118c%5]) with mapi id 15.20.4909.010; Fri, 21 Jan 2022
 18:38:38 +0000
From: Jesse Millwood <jmillwood@masten.aero>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Subject: Re: [EXT] - Re: Help with ppc e500 tlb usage
Thread-Topic: [EXT] - Re: Help with ppc e500 tlb usage
Thread-Index: AQHYDu71bG3VHneYgE+lgFPWApAJIqxtwtsA//+3coA=
Date: Fri, 21 Jan 2022 18:38:38 +0000
Message-ID: <SA1P110MB12933786AEDA2EDF031C2D39B05B9@SA1P110MB1293.NAMP110.PROD.OUTLOOK.COM>
References: <PH1P110MB12849EB7B10C757A6B9FEA4FB0589@PH1P110MB1284.NAMP110.PROD.OUTLOOK.COM>
 <a05a8a93-3d82-2703-f509-c0e047e6b00d@kaod.org>
 <SA1P110MB1293AF07B83EE30F41B8DD58B05B9@SA1P110MB1293.NAMP110.PROD.OUTLOOK.COM>
 <f7fc4a74-2f20-451e-6a4f-d89c395c24ff@kaod.org>
In-Reply-To: <f7fc4a74-2f20-451e-6a4f-d89c395c24ff@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: SA1P110MB1293.NAMP110.PROD.OUTLOOK.COM
 (15.20.4909.010)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=masten.aero;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5dff1ce5-59d2-4ffc-2e6b-08d9dd0d3d60
x-ms-traffictypediagnostic: SA1P110MB1375:EE_
x-microsoft-antispam-prvs: <SA1P110MB13752836B265EB8513D9F316B05B9@SA1P110MB1375.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8GSDm/aPSZs8hHAIWNNFW+d6l2waTs9gd01y4p/jyEhY7XMnlJD1ivxyrfRSPrhfMb+/qC8VVUjYitjjmViT4oOPySqhySIqtzjGpB5L7yfSrS4Yi9sCpy8c7/Ma1gKAF53z9ItFNI8OJlz3X9lmaCq9YGQUTvj/doIr+kvh4r9j9eRCru5PfkoDTAAEZDRKfRH3O7Utapwbw3gtpGDumrVkUMiiI2FWMv/ycQxkbijwhyFhpzXuDzc6toueB8PTNbpJUtrGExGTd0F9HvuFTex2SM1M5hFHFX5B8dyjKLh4bRN6P7fgJNVILTG+aGJ0RhccMxC8L2NIQZi+cLo4YdPvTWz/1ToEc2qVgv589CEfXKz+/aI/qVW9UlwFrMptiAdbAkrznspdd9gPgq6DyPPXRMXSiyiU5LhLYGjjOimdFfh2w0qFJrHQLGKL4XPuA6941crSAZN06eNtJ3mkwwb9N1KOvwjsiwQJEvqf02i1g9uxezbzBk5lguZEuOHosbx4rh8KA5y+EOVKQLH4VQnd0Hof2G8cvp/bGi1fjOXdn4VpKj4TCXiegOQW3018erYGTqIpZjoyWQ8ZRutYtXF4oPnm9CjrbosBXe1gAgJbGNAG6GaLTI4uVN763FHT5Z9zIp6w7Sz0FVCRLafA/Ppwt0z8FpWJiPMH/KAxhNoZ5yKab/oTCjbGWQjHkSCHKDTctxDtrQDK8v7kQonZHw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1P110MB1293.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39830400003)(66446008)(122000001)(64756008)(8936002)(4326008)(66556008)(66946007)(83380400001)(38070700005)(86362001)(26005)(6506007)(186003)(66574015)(5660300002)(8676002)(66476007)(38100700002)(508600001)(33656002)(55016003)(2906002)(7696005)(316002)(132210200001)(6916009)(54906003)(52536014)(71200400001)(76116006)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHgzRmJGcitKZDRENHU4SEJ5eDArWTNnVDVuQWY3d25IQ01VRnRvT0tNS3kx?=
 =?utf-8?B?UnVrMjErdkRPYUdIOTl1eVhnS1JrYkU0U25QejJYd0RNUVRqRkNDeFhKU0U3?=
 =?utf-8?B?aWk3MnJzZHpjSytjMHJFeURXZmdhQk13K2NKYkwxeVNhL1R3a3oxZnRFbkp4?=
 =?utf-8?B?T1hPTEc5N1ladDdQNjY4NWVLeUcydW5WVHgwQ0UvNHNSUHhUdWhoWWFYaWhV?=
 =?utf-8?B?L01PYkthaWk3R1BEcUlhSTd3eXJBSXkwdyticGtmWmpQdHlLa0VBQ292Vm5p?=
 =?utf-8?B?VTh1R2Yyemp3ZWIwb01CcU9qcTM4SUxka1dhdlowQjZmZnc4KzAzVG5Zemt3?=
 =?utf-8?B?UkNqcEczVnFPcDFyS1huRklQNW42aURvZ2RNQnFnWXBZcExHWGZkRUxSaWw0?=
 =?utf-8?B?Qjl5MHhmeEpyWlFyeFB6Rll6U1RlSXd2dzBldC9zbXBZa2wyNlVYRjlIL1l1?=
 =?utf-8?B?RUVmZGFhYnpqaWpJME9jUUk3cURGVW92RVRoV1pCTys0YUtKSE9nRk1SVGZp?=
 =?utf-8?B?SEZma0VwRTh6VlA1VlM2dUhXcjFBQVJCY2UxQ0FMekQrWFM2WHBWejdIZDVH?=
 =?utf-8?B?eTM3L3JwNENoT0RXVVZjU2lEeGYwY240Qmp1Nzl5OWpFc3k3TmNxZ2JFTXM2?=
 =?utf-8?B?Zkd6cHRabmx0bm15TzVrMGRkNFNMc2FVS1BRYm9idWNoL2JYWFJBT1dabDha?=
 =?utf-8?B?dnI2RzFzYUNCcVhLL1RmV1E3SGFxRXJ3U3ovMWRzQmh1NENrYWMvTDJhK0tj?=
 =?utf-8?B?VXk5ZU13Q2tBaTE5QW1DdTRTNzVyYWR3TVRic25TRVAvSDNkdEMyelBrUldo?=
 =?utf-8?B?N1pNTm44NUJId25BUy9kOC8xVnVZaWFESzVZS1ZKV2pWYUh3d2k3aDlkeFJK?=
 =?utf-8?B?KzZidTJ3THBwcUdhVjZUQ0tkeEttNHZyaTI1dFVNcUNLVVRiZXFXdTJ0dHQv?=
 =?utf-8?B?VXh2b2hoQ00rTjBTQkl2a0lad2VMRUc5REkyQnplaThUN2s2aTBqZDJIU2Va?=
 =?utf-8?B?MVJBT2IwRzRnVlpLOU9BUEpsSXRTOGU1K2xsVUxsbU1Xa2tETDJVQU9VTHBZ?=
 =?utf-8?B?ckFvd0Zodk1Sckxla0xJUFVTOU9XSlJlV256b1puTnpub1o2eUtpZ00ySjU1?=
 =?utf-8?B?cmxJL3JVYWtTQ0lGdUk1RXNHMzJpWEVMOGVBNlpZdzI1VEplQkJoVFk0MTZi?=
 =?utf-8?B?LzExMDJOeHhMZ2xLQ1VxcENxZzZCeE4wLzRvZE8rUUROTXVQM1Vhalk0Q1k4?=
 =?utf-8?B?WkhpNEp2Z1FYdDkzTEtYdzZmT29NMGgzNDZ6UFZWV0F3SW56VFRnRW5jWmYv?=
 =?utf-8?B?NXJXUnRCdmd0dFlOL1BWR3NTNTZydVc1N2RsV3N1d1E4VHZHQ3cxeEJVY3dt?=
 =?utf-8?B?allNaFlXblE0WEJ5VDhzQlBaOUkxSzlQUEUvRURtak5EenIySzlKOTJQU1dw?=
 =?utf-8?B?VFpWd21pZ21jRzIwWnRjeEl2NUozdDFjMHhIWm03NVFXaHVULzU4Q2M2RFcz?=
 =?utf-8?B?bHRUb1gwRG5pb0FsTnlvcnV4OFQyRGs1SVpWQVBaYW9QbkM2WWc3OE9XQjNW?=
 =?utf-8?B?bXREZFgwbmRjdEJ1SG1icXB0VUs1QzNIQ3ZjSFhnY25DOUZ3RkNNOGtyYUVU?=
 =?utf-8?Q?L8i5DYN0XKj5GDVcXo3SMbhM1Mr96On5KH0Ck3ms/siI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <99080C17C4C17F4C8DC19D56FD802712@masten.aero>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: masten.aero
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB1293.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dff1ce5-59d2-4ffc-2e6b-08d9dd0d3d60
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 18:38:38.2725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ae73226-ddd7-46a7-b25b-7338e0555d53
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB1375
Received-SPF: pass client-ip=23.103.209.95; envelope-from=jmillwood@masten.aero;
 helo=USG02-CY1-obe.outbound.protection.office365.us
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 21 Jan 2022 14:36:22 -0500
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
Cc: David Gibson <dgibson@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gRnJpLCAyMDIyLTAxLTIxIGF0IDE4OjU3ICswMTAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToNCj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUg
b3JnYW5pemF0aW9uLg0KPiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNo
bWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUNCj4gdGhlIHNlbmRlcidzIGVtYWlsIGFkZHJlc3Mg
YW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0KPiA+IFRoYW5rcyBmb3IgdGhl
IGJhY2tncm91bmQgaW5mbyBDw6lkcmljLCBJIHdhc24ndCBhd2FyZSBvZiB0aGUgTU1VdjIuDQo+
ID4gSSBzZWUgbm93IHRoYXQgaW4gdGFyZ2V0L3BwYy9jcHVfaW5pdC5jIHRoZSBlNTAwdjIgYW5k
IGU1NTAwIGhhdmUNCj4gPiB0aGUgc2FtZSBtbXVfbW9kZWwsIHRoZSBQT1dSRVBDX01NVV9CT09L
RTIwNi4NCj4gPiBJJ2QgbGlrZSB0byBiZSBhYmxlIHRvIHNldCB0aGUgaW5pdGlhbCB0bGIgZW50
cnkgc2l6ZSBmcm9tIHRoZQ0KPiA+IHBsYXRmb3JtIGRlZmluaXRpb24gYnkgaW5kaWNhdGluZyB0
aGUgc2l6ZSBpbiBraWIuIEknbGwganVzdCB1c2UNCj4gPiB0aGUgMl5UU0laRSB0aGVuLg0KPiAN
Cj4gV2VsbCwgdGhlIGFwcHJvYWNoIG9mIGFkZGluZyBhIGNsYXNzIGF0dHJpYnV0ZSBhbmQgZm9y
IGEgbmV3IG1hY2hpbmUNCj4gaXMgdGhlIHJpZ2h0IG9uZS4NCg0KQXJlIHlvdSBzYXlpbmcgdGhp
cyBzbyB0aGF0IEkgY2FuIGNvbmRpdGlvbmFsbHkgY29tcHV0ZSB0aGUgYWNjdXJhdGUgVFNJWkUg
dmFsdWUgdGhhdCBtYXRjaGVzIHRoZSByZWFsIHdvcmxkIG1hY2hpbmU/IA0KDQpJJ20gc3RpbGwg
dHJ5aW5nIHRvIGdldCBteSBoZWFkIHdyYXBwZWQgYXJvdW5kIHRoZSBRT00uIFdvdWxkIHlvdSBh
ZHZpc2UgYWRkaW5nIGEgY2xhc3MgYXR0cmlidXRlIHRvIHRoZSBDUFVQUENTdGF0ZSBvciB0aGUg
UFBDRTUwME1hY2hpbmVDbGFzcz8gVGhlIENQVVBQQ1N0YXRlIGhhcyB0aGUgbW11X21vZGVsIGZp
ZWxkLiBIb3dldmVyLCB0aGF0IGlzIHRoZSBQT1dFUlBDX01NVV9CT09LRTIwNi4gSXMgdGhlcmUg
c29tZXdoZXJlIGVsc2UgeW91IGhhZCBpbiBtaW5kIGFkZGluZyBhbiBhdHRyaWJ1dGU/IA0KDQo+
ID4gPiBUaGUgZTUwMCBvbmx5IHN1cHBvcnRzIHRoZSBmb2xsb3dpbmcgcGFnZSBzaXplczoNCj4g
PiA+IA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDBiMDAwMSA0S0INCj4gPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwYjAwMTAgMTZLQg0KPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIDBiMDAxMSA2NEtCDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMGIw
MTAwIDI1NktCDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMGIxMDExIDRHQg0KPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDBiMDEwMSAxTUINCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAwYjAxMTAgNE1CDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
MGIwMTExIDE2TUINCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwYjEwMDAgNjRNQg0K
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDBiMTAwMSAyNTZNQg0KPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDBiMTAxMCAxR0INCj4gPiA+IA0KPiA+IA0KPiA+IElzIHRoYXQg
aG93IG11Y2ggdGhlIGVtdWxhdGVkIGU1MDAgc3VwcG9ydHM/IFRoZSBFNTAwIENvcmUNCj4gPiBS
ZWZlcmVuY2UgbWFudWFsIHN0YXRlcyB0aGF0IGl0IHN1cHBvcnRzIHVwIHRvIDRHaUIuDQo+IA0K
PiBZZXMgdGhlIGxpc3QgaXMgb3V0IG9mIG9yZGVyICEgOikNCg0KT2ggc2hvb3QsIHllYWggSSBt
aXNzZWQgdGhhdC4NCg0KPiANCj4gVGhhbmtzLA0KPiANCj4gQy4NCg0K

