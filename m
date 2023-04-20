Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9C56E9975
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 18:24:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppX3Y-0004h8-LB; Thu, 20 Apr 2023 12:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1ppX3W-0004gs-Ow
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:22:46 -0400
Received: from mail-he1eur01on0718.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::718]
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1ppX3V-0001R3-BQ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:22:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDZBaMTy9S93FUPbG2ctI4Ex5xn+irMzvT6SUYRq6mp6Sir7mo2wpE6bueSsz1Ykgsb7HK7ev3LLSKLvckx5zK1z3eWdSk6eW1ChyNuSapKjpQhU9ZB2kOUbzuXmMRYbougnRbOjrSU4J1TMqrDEJ/FTMxOf8Ugsa3iBcoXVqt2uyQx5QAPyeOBeMBIcJ+rHwIZecUtDZRs2xv8ubXpRiorQEFgV26VcbiaBSKOM+Irxa2OliBDuBQ/1pyMRFZCfjXlrjalAANVZRl7TQiVOoMZIpedbYAl+Pv5sBMg85IpgKhYTQHSW0ToRWDQFFxldREsrStxSw6hQgTtAgob1bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktJmGPXsl73ex1WziYtEj9HjF2orOMq6+49q8pvHBj4=;
 b=Y7Q+ONw0cA1Esq3E0RHZ4RNfhNt62lqr1Z/TiAndaOLGP0QU8RNunugAAyFesRj+c1XagzXx4L8/aiy3dtJ2OHZg4roj0TEp9ga6Rsisz6wBF0UJ82U+UFw5UAkbeFWZ2wPKyDw1MBGmJl07AjIyblQkJAO2wIKfHJxezx1KhiHSgSKMdJ9gk48zlo+EIRFOy2vfv8GyKLeBviD3/HOPlZQy+ArKOn/6GEQZ3OTOc0QiMU7EKfB4qU0Ti4EHMdk8OjPg2hcM+g3JyOVFRE4FRv+P0qwhws9WuylERzRXl2qA9hhrVmGAIjHS15OGXv7Y1HTqwAEaLmR28HfInCIilw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktJmGPXsl73ex1WziYtEj9HjF2orOMq6+49q8pvHBj4=;
 b=VIOkK/kqUdYNCOVjpdtFzdEiThwBhQYbOtAp1TgebNvrP52VAJn+3+rK7+mryOVLS9aBYRb0AXNt3MTXi9C4WLuu3J7+Z4bJb5KtaR8P7HvK+qX+ew3XDSeLioAsmO6Wek+a5pV/7xgEPzcOqCe1RI/JeYY/x23Ljql6daw/r/A=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DU0P189MB1867.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:347::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 16:22:39 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 16:22:39 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
CC: Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Tomasz Dzieciol
 <t.dzieciol@partner.samsung.com>
Subject: RE: [PATCH v2 38/41] igb: Implement Tx timestamp
Thread-Topic: [PATCH v2 38/41] igb: Implement Tx timestamp
Thread-Index: AQHZc0vtc/DYiMU6B0mz6Hz5U0zOya80Yblw
Date: Thu, 20 Apr 2023 16:22:39 +0000
Message-ID: <DBBP189MB14337ED200878E8D26F86CDF95639@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
 <20230420054657.50367-39-akihiko.odaki@daynix.com>
In-Reply-To: <20230420054657.50367-39-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DU0P189MB1867:EE_
x-ms-office365-filtering-correlation-id: 20e2ae05-7a5a-4aed-df0f-08db41bb75d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4AuYvY9sw3L+/kkbSiR9//aPZmMm1yQApAgJT2mPV6VW05bIu5Uu3bk2YRJ+bBKGL6EzvwikOWl1hEUM/ug/7Malqd4DRGLacZSmJuQ90MmttCd6zNWRaK1Yo1SS9s6wsPin2ciCJeuQgZ+cKIXhz0O5RtFCBlD8B9YXorf0pQxDuCPx4MQFsFp+4Rr/bWzxuWK9o/AOTUj+W9pUqCTujQsXgvJFxmRDsWRAXFXSVasJjHZb0HVUltlTSHcJ7k0E8CQAO0NCOc6JXJu/dtQldON8ms/QmMitmWk8Oo/PMYmQQlRbaraxfpB9ALD3Fn2gSCdX2hKJw1z45wrIQcHUPibslxl8F0mAJwoPa+y41zgxnbkmZIwP4oSAP/BX4bEnRT1Vo6mVOR8+cLESn3oNkeZZTclu+ZJAF31H+OC7naQa1/tKje+nvyvZpUgQr9Gk8QfNtEgtlEh4FyZaUEScYfkJFgvD3h6aRLoW8ZEuQwmnvs/g9cQyzlAAJJiTpQzP6Wa5VegW6Wkc6kgvK/FJiaG1jrGKbY6IkFSt3tWBm/ojJ1HWZWkboRsv8dipLcYzFMY7e7r0Ux/myanizhOfq5QLaZkORrJVbIFAL5QYQvdqF0pMkebjnYWS83gNGuYn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(396003)(136003)(39840400004)(346002)(451199021)(33656002)(6916009)(4326008)(54906003)(316002)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(186003)(478600001)(71200400001)(7696005)(55016003)(8936002)(41300700001)(5660300002)(8676002)(52536014)(2906002)(7416002)(44832011)(4744005)(38070700005)(86362001)(122000001)(38100700002)(9686003)(6506007)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2ZHSWppelRCUTlrQ1lKVHVRZUlKdkdBeHZXYk5jaXcybklDMno2K1BQRGEv?=
 =?utf-8?B?b0hocWwrVTUramRDUVBkNzRLZmd4bll1MkFiZElwQ1JmUjYzd1VZUDNpV2gy?=
 =?utf-8?B?cmRaSzM2clNISjNOVE5vZmNBdGdRbzNtTkwxcTJoQ1YvREI3SlR6YWVHekth?=
 =?utf-8?B?bEczdG90U29aRTVPQ3ZIakF3VEV4eXBudWNCVWw5ZVBkY1djdjdqaVBiNkJk?=
 =?utf-8?B?cThoVXBBZlcrTllhUUh1WHdEelJxZ2lQYkFBT3VzdVl6L2xQUk9QdGc5em03?=
 =?utf-8?B?K21kMHN4M2liNy83bUN3Y1dmcDI5TFRFWThMcktPWmtiNHhqeTVGeGNNZm00?=
 =?utf-8?B?Tmh0WklwN21BVlhEL2VFd1l0dnZVd1JwQ09mUktNSGdRTEtmU25HTHF6Tkhy?=
 =?utf-8?B?NGp3eGQxcXZ2S3prMHJDZktKWmpsUXd1T3djblJlbzNZcE1rZjZTS1VuZ0g3?=
 =?utf-8?B?WWZsSzdsdW95ZzJEclE2SXhDdG5HdG9nMzY3NnkyTlArNWtpVndVaGNwK0FR?=
 =?utf-8?B?QTNMQ3diYUtsK3dwQXBBbUV3UzNzbXNHcHFVVndMdTdBbVZLdFBsZ1krQlR2?=
 =?utf-8?B?TkRFelkrRjdUV3I0ckplT0o5b0JLMytQeEdkYitUYWdpZ2d5UWZQckQ0d3lo?=
 =?utf-8?B?M0J1ZloxYkNsMnpGTnErZndYdksyVzBNN0JZeGRlbnl6dW5FcHl5Um1nWWJX?=
 =?utf-8?B?U0lkM2M2WUZnaDNNaEx3RVVsdVNEQm9ha3ljUFhxeW5jRnJHYmJSVHhIeEF6?=
 =?utf-8?B?emYwMzJGMERkL2dPNzhoRTZLM1d0ZCtYVHlUSE9RZzNUVURGaTVDT21PRnBP?=
 =?utf-8?B?TTVzdjBZM3oxT1RrRjJHZnY5ZG5FcUZDNmlSZ0pnb0J6MThPenRRWXl1a1Bj?=
 =?utf-8?B?S2hmUjR2c3VTQy81R3UycDdOOGMrZTEwRVRRTTVhMjdoQ3dlcEFKTDRLVmN2?=
 =?utf-8?B?aE82MlNjZzUzZGo0THlMU2dEREh2MC9UV2tWREFuaXhKeVdjV003bXkrV1Bp?=
 =?utf-8?B?RnhUb3RUYkVwZUgwYUgvVjZLNG5yT1hkSjgzdWFzR3VHNjFZNDFqNmJ0eDkz?=
 =?utf-8?B?TDNYVlUxYzR1YWJkRGNEVWJtb3ZrMXh5M0Rzek9kMnpGNlBXbGpUVGU1ZTZF?=
 =?utf-8?B?eDRQNmZrdHFmU2tEQkYrSlRuSFhwb2R0SHVSSjFPNjRXcHJMYXhIaXc0Uy9s?=
 =?utf-8?B?WmVKSXVBR2hkc2UwWjhidm5Xb24xck5OVWlIcGVIbS9ldVE2UFdXMEdhQWZo?=
 =?utf-8?B?dFZnME5VU28vanFYZTlzQm9NN0U4dGdWR0ZxZGozZUlJTTlZTVBwVDMxR1Jw?=
 =?utf-8?B?bE9oVzhsN1pTdUM4cm5Od0YxaUJEYkZpUzNGakVEZXF2L0hRVmJHM2hYbVla?=
 =?utf-8?B?cTkrb0V4Ym1VTkFuUU96RzVJTmdaRU5Xb2JQaTNOMFhac0phNUU4cWcxWnRL?=
 =?utf-8?B?OFhZUjBHcWxublFKUEVaR0JVSFZHRDI4ZnpMMHQ3TGNLQkIzSzFCbkptNkFZ?=
 =?utf-8?B?ZndFVWxKQ09aaHQ2WDBhcElyRTFzcEhic1FaVkVBKzhJbHV1REE2bVBQOG9I?=
 =?utf-8?B?dWNzcjhLL3NuRnN0c2xUMlhqcE42clNVNCtxZWJ0aGpxaGpyTW5kRnQ4ZkhH?=
 =?utf-8?B?QzBJK25ZSGgyOTBEYzFtQlJmMHR2bXFTTDdyanFFTW0zSDk0ZHpPN0owbzBN?=
 =?utf-8?B?TWVzVTJYMzA3M2ZIY1U1T0IwZUZtRzZZeGRDWlFIYk1xZTY3T2pHNzliM0Z0?=
 =?utf-8?B?a0xSRUpKeThSSW5xeThYRitKYkY2aHpRc0dPdVRrSmV3ZDNaT2UwZW44SFpH?=
 =?utf-8?B?VzNYdEFYMmV4V2dCRVVqb2JyYUJMUjR5WXBxRG1rOEJsUklpRVdxdENSWjBZ?=
 =?utf-8?B?SnpUOXNTOC93WkN4dnJWNFNCT1JrZ0ZrZjZ3dFREWnlhUHNrczJGOERMa3A4?=
 =?utf-8?B?WlFWRVhTZExJck9reGpXNnN6VGlUUVZFU0xBQ3ZsK1BHWjNSWW5DMnZYNXFU?=
 =?utf-8?B?MUhGUEZWNklUNGpnRkhBZ2Jwek5OTWE4dHIxZXR3alVMc2V6SkU2c2VKenRR?=
 =?utf-8?B?RU5DbWRqSzc0eDNoUjNxMEU5M2FIaTE5SnpaK09KaDlldUpaeGNzMkl6cTJ6?=
 =?utf-8?Q?fUa85irmwcOvLIi/sno0BPFy1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e2ae05-7a5a-4aed-df0f-08db41bb75d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 16:22:39.4440 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pzZFF3O2Eh5mGe7yq5E1n8khMsq8I1oMw9Hg+SlXkbDZHwshZRpwD0QK289IXkyVeVFffdLSbBwaiOhZINT0hlncK43ULUctFMQIem/f2iI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB1867
Received-SPF: pass client-ip=2a01:111:f400:fe1e::718;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWtpaGlrbyBPZGFraSA8
YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0KPiBTZW50OiBUaHVyc2RheSwgMjAgQXByaWwgMjAy
MyAwNzo0Nw0KPiBDYzogU3JpcmFtIFlhZ25hcmFtYW4gPHNyaXJhbS55YWduYXJhbWFuQGVzdC50
ZWNoPjsgSmFzb24gV2FuZw0KPiA8amFzb3dhbmdAcmVkaGF0LmNvbT47IERtaXRyeSBGbGV5dG1h
biA8ZG1pdHJ5LmZsZXl0bWFuQGdtYWlsLmNvbT47DQo+IE1pY2hhZWwgUyAuIFRzaXJraW4gPG1z
dEByZWRoYXQuY29tPjsgQWxleCBCZW5uw6llDQo+IDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPjsg
UGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPjsNCj4gVGhvbWFzIEh1
dGggPHRodXRoQHJlZGhhdC5jb20+OyBXYWluZXIgZG9zIFNhbnRvcyBNb3NjaGV0dGENCj4gPHdh
aW5lcnNtQHJlZGhhdC5jb20+OyBCZXJhbGRvIExlYWwgPGJsZWFsQHJlZGhhdC5jb20+OyBDbGVi
ZXIgUm9zYQ0KPiA8Y3Jvc2FAcmVkaGF0LmNvbT47IExhdXJlbnQgVml2aWVyIDxsdml2aWVyQHJl
ZGhhdC5jb20+OyBQYW9sbyBCb256aW5pDQo+IDxwYm9uemluaUByZWRoYXQuY29tPjsgcWVtdS1k
ZXZlbEBub25nbnUub3JnOyBUb21hc3ogRHppZWNpb2wNCj4gPHQuZHppZWNpb2xAcGFydG5lci5z
YW1zdW5nLmNvbT47IEFraWhpa28gT2Rha2kNCj4gPGFraWhpa28ub2Rha2lAZGF5bml4LmNvbT4N
Cj4gU3ViamVjdDogW1BBVENIIHYyIDM4LzQxXSBpZ2I6IEltcGxlbWVudCBUeCB0aW1lc3RhbXAN
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFraWhpa28gT2Rha2kgPGFraWhpa28ub2Rha2lAZGF5bml4
LmNvbT4NCj4gLS0tDQo+ICBody9uZXQvaWdiX3JlZ3MuaCB8IDMgKysrDQo+ICBody9uZXQvaWdi
X2NvcmUuYyB8IDcgKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
DQo+IA0KDQpSZXZpZXdlZC1ieTogU3JpcmFtIFlhZ25hcmFtYW4gPHNyaXJhbS55YWduYXJhbWFu
QGVzdC50ZWNoPg0KDQo=

