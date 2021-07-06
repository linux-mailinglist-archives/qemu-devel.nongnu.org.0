Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A7F3BDD4C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 20:33:56 +0200 (CEST)
Received: from localhost ([::1]:34722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0ptL-0005x3-9y
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 14:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m0psO-0005F1-Ot
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 14:32:56 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:30167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m0psM-0000Zm-AS
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 14:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625596372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rsm+xU7LO2TlvxNVvks1ffBIGni/gDwxAS4Svh09Rg8=;
 b=KUDRCNI4dKj5nrkMmnRZKOlQEQM9NMIWna5XaT8TejxKVRQeBVWsYgPka4Svex8kA9+CDz
 4V0naiLYI/YeQG9HJg64H4YDSM7rYiQlqBUSpgONeCKmZqYbaZyGL+bb5WNxIFdOwsVGUR
 JBnC3U0WwnzjxzcvjJ+9WMw+74WCaEA=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-rMiuIHryNFCAU0_-g6H1SA-1; Tue, 06 Jul 2021 20:32:50 +0200
X-MC-Unique: rMiuIHryNFCAU0_-g6H1SA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UihhK7K2XzyvsGLXdTAVS6CGUKtQ+QIKJa5teBxm89xajSgRU7csdZorsbyHMdfUxH4fLWwbz9IEOpRukxfoea0uiRBZgCTFUyJzX0JLW/IZRXilKVdYKTko4Izv6kjlft2s7EQ/bWweWMvRBNyoD3sEwL1YJ7wRZ3x5Yo0TSFgP6K65eAUBO3s/H5FfrkF+Lqjxbb1/Q2l3kBLxMzWN5R0OffmobCZ1yonzM7mrBCBZ/+qBhgFomdoUP1s98/5UJjXpaLa7aeZ+B0sXVjY6x9AAfc2BCIoWcAcUpyUIIsK9BNkMVkmgBzwEV6oYZaMCO3PL+tHoCM7dMfPjpCgneA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rsm+xU7LO2TlvxNVvks1ffBIGni/gDwxAS4Svh09Rg8=;
 b=m6U7URyKXRDBIoll/d+IpQUBeU3mLeOOtPLrqvAQTQipg/BbGWMKbqBO648oDmtZBN2ogrPMUQAHR84ps6KRlTi3GcWSsor1cCYFCZNOatjZ/HzKDVnAWzcGM9dNuPxErQfV1WRI9ILV7IzFv+S7sFb79xNXZMfhYskIfzPWre4bkKXz8rOCQHFukdC8tWuYfYgvdfDMIl4NmjU8ph4asAwWY6GfBxfW2OvfcFwlS0xYpOwox9tU0/UpdyY7q7nn1G9uNLQxR7F5On3U0X8URXt4hVyG037jKMl5gPvPXDbVJDS3Lgt4YGHYeS6ZruTtXgwmjDqTgCuYIPKxcAApug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB4573.eurprd04.prod.outlook.com
 (2603:10a6:803:73::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Tue, 6 Jul
 2021 18:32:48 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 18:32:48 +0000
From: Al Cho <ACho@suse.com>
To: "thuth@redhat.com" <thuth@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>
CC: Claudio Fontana <Claudio.Fontana@suse.com>,
 =?utf-8?B?Sm9zw6kgUmljYXJkbyBaaXZpYW5p?= <jose.ziviani@suse.com>,
 "cfontana@suse.de" <cfontana@suse.de>
Subject: Re: [RFC v6 12/13] target/s390x: move kvm files into kvm/
Thread-Topic: [RFC v6 12/13] target/s390x: move kvm files into kvm/
Thread-Index: AQHXbPH4sJ2XE9zKbEa4Fjcc5mr2NasuhS8AgAfLj4A=
Date: Tue, 6 Jul 2021 18:32:48 +0000
Message-ID: <20d3da0cd48d87cc11085bbd7183b335fd0a2420.camel@suse.com>
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-13-acho@suse.com>
 <fc895bf1-409c-cb89-e4c3-0c9324c0ebf5@redhat.com>
In-Reply-To: <fc895bf1-409c-cb89-e4c3-0c9324c0ebf5@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.2 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 827d7c96-6cb7-4548-83bd-08d940ac74c4
x-ms-traffictypediagnostic: VI1PR04MB4573:
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB45731F7151DB4AD8062B5190A01B9@VI1PR04MB4573.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bvma/elMyojUCtrk3qpCz9t1z4wB0qid15hjPsYixE+VQPTr5MJAzAbRB+T0gDuvl19WLS1lhV0zv+cpKEl93DM+8biJH5AxVm5LqCjcUBrBxlwL7AQ6nr0bkw1mwdC1e2iewOzBVA7bALD/K2DL07YYK2TiADFVE9KHVIeslGYYKdaUQLlpYyImx3qlfhrDhpvzjWR1hek9H1BLLE5xEE/rOB7Ryzcx/NXPTOu3IAs49NKBFA8yGZ70eHW4KYPtgyIgETJz87+QEuj/2TF8HuQtnjkbXkL3TatpbBI1n7zMlIU2hDQcreCo375C4fdcLE8w7jZddQSUw0Ojydol6qJyY+uytjKuO9tQi2/3UNbJOELthusM13WQW6AveYTIwaIuodXdWBiiAON5G3+C3sckwGXxxm82RaB+V2VjrO+o5pEvqpCAgm4eYjSOy83STqzvTFhB7mMgy8qdPYLeMp589R5ZP9RgQK0EFWrLAOqfJpFTsdFTgDnQE3IwWNCkTcuixLi4Qk2T1FIzDSaTVSi5DEuPBXIBiSEUKS6CKqS8VzstAUl/BoOQf+/Ru47bKBrEqck8NKwYYsEBWv+Ugw3FIhKTP0/kvXtQQl2PpV8tbypW4nmQ4uD8KWldgAm2Mv3aHeYkTTnpnzbbc/5QfQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(136003)(39860400002)(396003)(6486002)(71200400001)(316002)(66476007)(66556008)(64756008)(66946007)(2906002)(4326008)(54906003)(186003)(110136005)(26005)(6512007)(6506007)(8676002)(66446008)(8936002)(5660300002)(478600001)(36756003)(38100700002)(76116006)(86362001)(83380400001)(91956017)(122000001)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWNOZHpmL1laYy9ZdnE0Rnh0WHhWL2NUMkdwZTRoeE5YWFNmbmxUOVpheVhq?=
 =?utf-8?B?d1Q3NkErYXJkN2lnbzRqMXlhWngrZDZOM0p0WFFxcDV6YlBiOGFndFkwZFJp?=
 =?utf-8?B?dDN4bklKb1REUGdRejFOakhSK3kyNXQxelQxYUF0SnhaSzhuQVprV0pWYmpv?=
 =?utf-8?B?Zmo5SEQ1RzVRb0tnWGtaT3l6ZXdIRUkrM1ordEhhZ0lHVGgwK0J2bThIS2dO?=
 =?utf-8?B?ano5Y2hlZ2lDaDBJaTIzWUVDV1NSZHU0bWg2TngxMVFPSkNrZTZsK0lEZDNN?=
 =?utf-8?B?Y1ZLNlBHeURnZEllbGNCSVJ1Z2I2bGlrVlJiMWZUL0g5VDdMT2E1YjlvY25T?=
 =?utf-8?B?bXVDbGhyN2Qwa0dFT2hmUXE4SUFoQ3IzczlqbmlkMDBTSHFmcG54c0cvck1H?=
 =?utf-8?B?aWI2VHZZYUxxVEFWdWc1YmdiNENrSTV2KzBJakdja2IzcGNxY1I1MWNEd3Yx?=
 =?utf-8?B?ZEhmN2YwYjJKOTFuNUNDUk9aMW5QNGFUZU5EUENnUHhIV1FsWC8veEorS3ov?=
 =?utf-8?B?am1iNmlJZzhmYjVCZDJoTm9ZL0dja1NldjFvWllOTzZlUEd0b2dFamZwTHV3?=
 =?utf-8?B?MlVLekEwUlJzYlR5cWlSNG10ZktxMkQ0cmNDelFqMURBTWVoWE1LMjJCMjBv?=
 =?utf-8?B?YlI5dEN4bW5zSStudEltb0toTUtzQU1uZXNHZG1LbGh3eHVEZlA2TytBL0JP?=
 =?utf-8?B?THRXbjA0ajIrcWR6MFk1bXBRYi91Sjd6STlCY0tCQ0IzVGtObHFoeFRBY2xs?=
 =?utf-8?B?WW1BOTFTbk1kcWZ0a1VLY0N6S0xoTURmVGJwSGNRaXdkaXZiaE9RRjM4Vmhn?=
 =?utf-8?B?OWNFRkxuUjVSTUw2d1NnWkxyd0FGdTc1VVkzVy9lRFdzWm1yUzl2cjRxSEd4?=
 =?utf-8?B?aE44S2J1c3hIMHlHUmZrSHpNd3haMm1SbG9yUURvbmVvVnlPYnl0aVVlSDJ0?=
 =?utf-8?B?U1g4YWRpZzZPUE5OZ21adjZaQVlRbzVjK1NhejNuV2pENEt4SlQwTVNnWXF0?=
 =?utf-8?B?MDNMUW1WNzJnUUF4elFKZ0ozWFdVRld3UXppRHBKcmVqTFJwc2Z3eGsvMUpG?=
 =?utf-8?B?NGY3QncwTlJCTGE1N1NENCsydlFjVDE1SUpHa1o5cnAxOXlGeVZibzNHTWlN?=
 =?utf-8?B?NEt2T2pFak1YdVY4NjRQb212cVJJREV0NU9LRGNXSkFpMGJoM0xyUzNPaTBw?=
 =?utf-8?B?NEpjK0h5RFNOTHpjN1VlL0gzV3FkVVIvTGhpYTUyQVVRbm5MelBqMUltRzM3?=
 =?utf-8?B?VXRYYU1TQ2NNYmQ0TzBqa2JIbVh5NnpzUE0zQ3FsYkkzTU5SMXhQcnFZb25C?=
 =?utf-8?B?RXJVTGJ5Ymx1NW5UT251Ni9QMUhIcllxRUF0L1U0UDNlaVRCSnE2dGFEWWYx?=
 =?utf-8?B?Z0ZCaDVSZDdKdWk5bVJQbUVRV0xhaWVtak1WZTFhOVBoeWJUUTRXWmFNRDRl?=
 =?utf-8?B?T2treWNPM2NyQkFJNHdLeVJkRDU4alZnS1VWMDA1RE1vZUw5OTdCUXNZc25F?=
 =?utf-8?B?eEVXdURQeThWdVhHME8rRHVCN3U1aGprSmMrZWNvTXJnYWhUNjdjNUtmb0VT?=
 =?utf-8?B?RGgyU2UrcDdwaXZLU0pQaW0wdCs2QnlNK0N5cTJQS21Tb3o0djhRSzVCbnk1?=
 =?utf-8?B?UCtPV2I5emlyNFJTOWM2TFIrdUJ5ZGMyTU9wTWFGbndpNTlZcFFMUWV1NG5Z?=
 =?utf-8?B?OWo0RjBFd1cvaW0rdUZ2YzR5amNBYUVWYlZ2V2NUTzI4R2FjMUdadWZWNWVW?=
 =?utf-8?Q?7ZlF2CoQAr4U1z/ldezeK4noRn4+vSuwmnycWDB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <996EE90D616EF94DB7061808EAE690F1@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 827d7c96-6cb7-4548-83bd-08d940ac74c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2021 18:32:48.5835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V4JHZ+/nd1IAcEm8piDZzdUuuTpwZUzYMO9lEFILXpi3L9qC147yznb856vaUyzs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4573
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

T24gVGh1LCAyMDIxLTA3LTAxIGF0IDIxOjMwICswMjAwLCBUaG9tYXMgSHV0aCB3cm90ZToNCj4g
T24gMjkvMDYvMjAyMSAxNi4xOSwgQ2hvLCBZdS1DaGVuIHdyb3RlOg0KPiA+IG1vdmUga3ZtIGZp
bGVzIGludG8ga3ZtLw0KPiA+IEFmdGVyIHRoZSByZXNodWZmbGluZywgdXBkYXRlIE1BSU5UQUlO
RVJTIGFjY29yZGluZ2x5Lg0KPiA+IE1ha2UgdXNlIG9mIHRoZSBuZXcgZGlyZWN0b3J5Og0KPiA+
IA0KPiA+IHRhcmdldC9zMzkweC9rdm0vDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQ2xhdWRp
byBGb250YW5hIDxjZm9udGFuYUBzdXNlLmRlPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENobywgWXUt
Q2hlbiA8YWNob0BzdXNlLmNvbT4NCj4gPiAtLS0NCj4gWy4uLl0NCj4gPiBkaWZmIC0tZ2l0IGEv
bWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZA0KPiA+IGluZGV4IGE5MWIzOTQ2NWMuLjI5M2Q1MDlj
N2UgMTAwNjQ0DQo+ID4gLS0tIGEvbWVzb24uYnVpbGQNCj4gPiArKysgYi9tZXNvbi5idWlsZA0K
PiA+IEBAIC0xODg2LDYgKzE4ODYsNyBAQCBpZiBoYXZlX3N5c3RlbSBvciBoYXZlX3VzZXINCj4g
PiDCoMKgwqDCoMKgICd0YXJnZXQvcHBjJywNCj4gPiDCoMKgwqDCoMKgICd0YXJnZXQvcmlzY3Yn
LA0KPiA+IMKgwqDCoMKgwqAgJ3RhcmdldC9zMzkweCcsDQo+ID4gK8KgwqDCoCAndGFyZ2V0L3Mz
OTB4L2t2bScsDQo+IA0KPiBZb3UndmUgYWRkZWQgdGhpcyB0byB0aGUgImhhdmVfc3lzdGVtIG9y
IGhhdmVfdXNlciIgc2VjdGlvbiAuLi4NCj4gaG93ZXZlciwgSSANCj4gdGhpbmsgdGhlIEtWTSBj
b2RlIHNob3VsZCBub3QgYmUgcmVxdWlyZWQgYXQgYWxsIGlmIGNvbXBpbGluZyB3aXRoIA0KPiAt
LWRpc2FibGUtc3lzdGVtLCBzaW5jZSB0aGUgbGludXgtdXNlciBidWlsZHMgcmVxdWlyZSBUQ0cg
b25seS4NCj4gDQo+IFNvIGl0IG1pZ2h0IGJlIGNsZWFuZXIgdG8gYWRkIHRoaXMgaW4gdGhlICJp
ZiBoYXZlX3N5c3RlbSIgc2VjdGlvbg0KPiBpbnN0ZWFkPw0KPiANCg0KWWVzLCBJIGFncmVlIHdp
dGggeW91IHRoZSBLVk0gY29kZSBkb2VzIG5vdCBiZSByZXF1aXJlZCBhdCBhbGwgaWYNCmNvbXBp
bGluZyB3aXRoIC0tZGlzYWJsZS1zeXN0ZW0uDQpCdXQgSSB0aGluayBpdCdzIGZpbmUgdG8gYWRk
IHRoaXMgaGVyZSwgaWYgd2Ugd2FudCB0byBjaGFuZ2UgdG8gdGhlICJpZg0KaGF2ZV9zeXN0ZW0i
IHNlY3Rpb24sIGl0IG1pZ2h0IGJlIGJldHRlciBpbiBhbm90aGVyIHBhdGNoIGFuZCBpbmNsdWRl
DQp0YXJnZXQvaTM4Ni9rdm0uDQoNCg0KPiA+IMKgwqDCoMKgwqAgJ3RhcmdldC9zcGFyYycsDQo+
ID4gwqDCoMKgIF0NCj4gPiDCoCBlbmRpZg0KPiBbLi4uXQ0KPiA+IGRpZmYgLS1naXQgYS90YXJn
ZXQvczM5MHgva3ZtLmMgYi90YXJnZXQvczM5MHgva3ZtL2t2bS5jDQo+ID4gc2ltaWxhcml0eSBp
bmRleCA5OSUNCj4gPiByZW5hbWUgZnJvbSB0YXJnZXQvczM5MHgva3ZtLmMNCj4gPiByZW5hbWUg
dG8gdGFyZ2V0L3MzOTB4L2t2bS9rdm0uYw0KPiA+IGluZGV4IDViMWZkYjU1YzQuLjA3ZGFlMDZk
ZTggMTAwNjQ0DQo+ID4gLS0tIGEvdGFyZ2V0L3MzOTB4L2t2bS5jDQo+ID4gKysrIGIvdGFyZ2V0
L3MzOTB4L2t2bS9rdm0uYw0KPiA+IEBAIC0yNyw3ICsyNyw3IEBADQo+ID4gwqAgI2luY2x1ZGUg
InFlbXUtY29tbW9uLmgiDQo+ID4gwqAgI2luY2x1ZGUgImNwdS5oIg0KPiA+IMKgICNpbmNsdWRl
ICJzMzkweC1pbnRlcm5hbC5oIg0KPiA+IC0jaW5jbHVkZSAia3ZtX3MzOTB4LmgiDQo+ID4gKyNp
bmNsdWRlICJrdm0va3ZtX3MzOTB4LmgiDQo+IA0KPiBObyBuZWVkIHRvIGFkZCB0aGUga3ZtLyBw
cmVmaXggaGVyZSBzaW5jZSB0aGUgZmlsZSBpcyBpbiB0aGUgc2FtZQ0KPiBmb2xkZXIuDQo+IA0K
DQppbmRlZWQsIHdpbGwgcmVtb3ZlIHRoaXMuDQoNClRoYW5rcywNCiAgICAgIEFMDQoNCg==


