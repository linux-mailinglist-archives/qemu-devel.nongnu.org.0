Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C7F3C2001
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 09:27:14 +0200 (CEST)
Received: from localhost ([::1]:52776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1kun-0007v0-W9
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 03:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m1ksd-0006L6-4O
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 03:24:59 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:36872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m1ksZ-0003X9-3Y
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 03:24:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625815490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8xrMmJfDHv2kkCbS953f4pU58KYIowWT3zkfMfOTzuA=;
 b=MgrVcTj5MNcVcrbKCo+4rlax0LSgb5FfxD6tYuXg3TSHbM3+Agzxlgh71V4xJsjcgYkKEh
 xt8zYBHx+D1crmZSWxlctkdS2hStUexGqNw+ks2FVN1p/kCNoF/jTmSu74DrbW5v+bmR3O
 bM71Jp4lXng+MZGlsR45tKNvF1znhYA=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-oio4DCnAP5G5MjSzD2gunA-1; Fri, 09 Jul 2021 09:24:49 +0200
X-MC-Unique: oio4DCnAP5G5MjSzD2gunA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NylwbtvUjCzhP5AScwYV/nRvKndBw13AMTaeVWA8ZwvX2dhmGfN11S+kIMZf5iLiGvD0i4H20XJXTQBJ6Oi5bs8RFtBkGaE7hjw5biTPui9uWOoo7/qOkEjnNg7+hAK1CH50as3AlsH3mkp5GdbcY560cuN2hHmC6DwtNgYaGFnk2ohdmBXo5jWKIJGyV4azVg9C4xIwHEbo3t2aj+XPZxrBdYyirZsmragalfbnQQ6H4YKwT9qZ6F9sz13bIXEWZ6wnNvqGOuMHhVrtwP0oTxewMJrWrlZBrqykwbuiOMOGRDjnJDwgVb/47h34XibRA3mG5s4Az1p/xtLScfL1bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xrMmJfDHv2kkCbS953f4pU58KYIowWT3zkfMfOTzuA=;
 b=ChWuEjNB3+L49SMpU+X/X5BNA9NV47RLEps+pORm9EzTbWkIWRChf4acSFeDHPLzNsO/IoqMxYzozSI2HCOwDYRO2tDF5sTm32O9RX1th+/XQWVTmcWG6sePdVql1id2ckJtV+ihHT2ScKcHm7jsSvILRJyxZLoXg/plYAxnzBGugDXPSEF21hrwoeyVZV2i13Jgf9NAP8Ch4o38rm9AowWmoQDfoLcGBAsvVgjyhLpyRN4oDlXA+sivsMKfXMKdFIRvklMwvLQxUwj3EeaEG+M0dIL20lp58qegsg0iJ3rDZGEQKSPyCoX+w71OUbXaVm02E9kZYIhqnNyypdnq0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VE1PR04MB7214.eurprd04.prod.outlook.com
 (2603:10a6:800:1a6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.22; Fri, 9 Jul
 2021 07:24:46 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4308.022; Fri, 9 Jul 2021
 07:24:46 +0000
From: Al Cho <ACho@suse.com>
To: "cohuck@redhat.com" <cohuck@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>
CC: Claudio Fontana <Claudio.Fontana@suse.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, =?utf-8?B?Sm9zw6kgUmljYXJkbyBaaXZpYW5p?=
 <jose.ziviani@suse.com>, "cfontana@suse.de" <cfontana@suse.de>
Subject: Re: [PATCH v7 01/14] target/s390x: meson: add target_user_arch
Thread-Topic: [PATCH v7 01/14] target/s390x: meson: add target_user_arch
Thread-Index: AQHXcx5Vw4DxHpCYCUOymuEP7DIUNKs5VMSAgADr+QA=
Date: Fri, 9 Jul 2021 07:24:46 +0000
Message-ID: <7be24c318aed9e762360a00a75340939568b3dea.camel@suse.com>
References: <20210707105324.23400-1-acho@suse.com>
 <20210707105324.23400-2-acho@suse.com> <871r88g1ti.fsf@redhat.com>
In-Reply-To: <871r88g1ti.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.2 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e036b78-079b-4a3a-8c64-08d942aaa157
x-ms-traffictypediagnostic: VE1PR04MB7214:
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB72147EC04F5F36EB7B402694A0189@VE1PR04MB7214.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yS/eZthtlN76c2zB/QFRcfskeJdq/g8YikKfY69LQ46T4ua5rhT5yg8MW0iTjcCEN1KT8CpC4JjTvxgDD2a+T4E+TeEcq2pGeINM47Z7PaGXCsQX/HyKWqiZbLEgL9bevHTxgbRdlyo1rNWkm5SvxqA80gIX5TDBaZuo/YMfLSjTHkpF/ZYpt0iTmeEtNClAV95u39L6LfhP81ChJNdB8oY7fmtZsB1rV5jYOQ39YLEUfJd6248emsNo5ERCb3b1JCojiqMm7+LUVlCiVFB0aZqHk3lopbFsSeX2EYP8hikSOWBsljgJZUfXnYZKA0gwLfu0t2q26ZN5t0kjf2vmc7C4SKDbAS+JygCx5IadvDEp9b6YPkZrEu0csWe2thHhz6P2eNLzCGIJ/GN18E28u5jfxZtcSDw4k4npEQon53OGGbGu8Tl/fXL7XDINowms4iGnDnYqbunVKeYIR9XTnRLWGLgqO8s4l0rIPG73LmLAB1YkePo0qCk842mpsBtMDx4Fgbw9oPpda/8RtHLI9QJUW/G3vFa7h5gY7Mp3zLoPzFwK/zjUHVb86KHpDf6tBipRCuWQm7sij7WNhzRGTIV5oVaeA9hMk+GnxkCSB/ZcSzj6fp0a7Co0huEMaS0kYrlEiWLbnZAtK0ar+J3gFg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(366004)(376002)(136003)(396003)(346002)(6486002)(36756003)(6512007)(8936002)(4326008)(186003)(26005)(86362001)(71200400001)(316002)(83380400001)(478600001)(66476007)(2906002)(8676002)(91956017)(54906003)(66556008)(5660300002)(64756008)(66446008)(2616005)(6506007)(66946007)(38100700002)(122000001)(110136005)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGJRdjg1Qi96aE9jRzRGV01Xc0JHcFg5QTU0SnF6QXVOOUFyUnh0czVvRzVW?=
 =?utf-8?B?VTh2NDFqU3BWZU1adDd5aXo5SGNJa01BcjZmNGlWQzhLc3ZJeU52OHBiank1?=
 =?utf-8?B?TWkyUDZabXcrSXVTbWtoRWZGTi9WVmZmNUtoVTJ2d3lnZk15Sk90YXZJU3Rt?=
 =?utf-8?B?SUh6cFQ1R0d1RXhJWTlndzhPVzFrbTFzSlVDQ0w1R0wxc2kwTE5Ca3BxVmQ4?=
 =?utf-8?B?cFVMTEFIWElEOVVTYXBYYnFuNk9mMzFESVpLRm5sUHd2Z0ZlcmYrMm1oekVW?=
 =?utf-8?B?NGJIWWZjRmhLU2F2Nm1ra1d5RE5jR0ltdGo2a3RManR5MXhqRXdpQjVHK0NE?=
 =?utf-8?B?MWplTldkT1FPTG0zOStPQzcwOHVtcDZvZnV4c0VXVjRuVFl3TTYrR29udVNp?=
 =?utf-8?B?Wlo1RzYxZDNTT1pjMllHQWNLbE1MSFdOdlkzTUtIbWRhQkMrNFNqNVVyVjYz?=
 =?utf-8?B?bWw3TmpuZ0VQLzFzK2ZBQm5JQ0FyVGp1ejdyZXBrWGNUMTNLalJ0bU9CWDFS?=
 =?utf-8?B?WHNFc0RSS0xHOHJtNlJ3blNWRXM0dXNFZGZReDVkc2EvcDh3RUlDZGY3Ui9Y?=
 =?utf-8?B?bENVRS9VU1VHaGtNMkpCbjJrRjVFNUxyWlBvNHY3RmRKZnMyV2htdktHRWlZ?=
 =?utf-8?B?UGRlZTNEYUlHZmxMQzdzRWhIUi9mUkxmai9GV216MXNJZHlPenpWZmViS3pF?=
 =?utf-8?B?TW5tU2k1SkF6bDRlM3kvbFFPTXNlV2FNclIwSURrSEZOZTNlbFp1V2ZvVkJK?=
 =?utf-8?B?TVBtYUJpaGhXbVdzTndLbXdNWVVKdDJpZ1lKdC96WWVFdUVRK2JuTTdITEdX?=
 =?utf-8?B?MTBUMXZIK05oRGFuenYrcDFkOElnZHZiRUZ0bnl0L0FnVmtrQVBKeVJUdEhM?=
 =?utf-8?B?TVA2WDRUY1hVbXdYWEJCUlZzbmVhd3JGS0F4cHo3WlpQSHVwYzNtRDNFQk9O?=
 =?utf-8?B?WFFzTTlXYmQxOWFuT2dBQnJsNGNzbTZFdjVFeFpCbFZSbmg5SjhiTWFwSjBE?=
 =?utf-8?B?aTROYUMzck5NRnRXamVSTHVzU3Z3bkZqMG1jTEx0MTRFekFJUnM0dTdOanpV?=
 =?utf-8?B?RE5KYjdwNy9aSVVUaGRsSFNTYTArYXovNlBYU2NmU0RSL0x2YVNLT3JJNkFG?=
 =?utf-8?B?Zk00SWwwazdFRTl4SlRyU09KN2VhZHNBejlrZkplQ1ZjTUc5ckFRRzFxaFlX?=
 =?utf-8?B?b01GdkxVUU1CdFNDVTJaQko1c2dLQityd3lwazIyOTZJOUkzM1RTcU5KNGQ5?=
 =?utf-8?B?RTVsK1NMZnFDTlM4N1pxVUNuc2liMGhETWJMQXlwRmkwc3RBaTJzWXRLamNn?=
 =?utf-8?B?bVZ4NDAvdUN3dUdlaXFka08vSUpaWk9LOURKSlVLLzhjWDl4dXhraStoSmxO?=
 =?utf-8?B?VGQwNThFTmxSRU5BVi9wWms3QThWUFZ6S2dUZ0V6bEJtQ0gvTGtCY2cyZzZO?=
 =?utf-8?B?OHA1NHZWWU56dnRDUjF1ZCt2eTBoQnVqZnNTZ3FzSTBlOEltWnFKY3hHMURy?=
 =?utf-8?B?anBOSitmLys5YlVSbUFpUU1xTjg2aTlSOHdTcFh0QUNEY2Q5djBiT0wrWGN0?=
 =?utf-8?B?RHkrcVFTV0wzK2wrUVpTNW5mcjRXaVJVclUycDQ0VGNoL2MzZEhrMTRxQU9M?=
 =?utf-8?B?ckhhZENHQTFzSGpLbDIwWHdaVnRZdjF2QXZLMEtKUkhDaTRKT1djOXVFUGVI?=
 =?utf-8?B?ck03UVRiaEF3MkZ5U3BLMzNwU2I1RkswNXkzamEyNFRDK2JwcnVUVitFZmN1?=
 =?utf-8?Q?D2l2P6daloBg3Cb/FK0xBk3tdx3zxxPx9LVexft?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A3972F1B1344984DBD629DCEF73DD191@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e036b78-079b-4a3a-8c64-08d942aaa157
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2021 07:24:46.7889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H2TYbh2UkV4kB4HU1y8/mx8PIMnxEcnQg5Yz9sp+arUkFl4QOlw6EV/UYQ8SE34i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7214
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

T24gVGh1LCAyMDIxLTA3LTA4IGF0IDE5OjIwICswMjAwLCBDb3JuZWxpYSBIdWNrIHdyb3RlOg0K
PiBPbiBXZWQsIEp1bCAwNyAyMDIxLCAiQ2hvLCBZdS1DaGVuIiA8YWNob0BzdXNlLmNvbT4gd3Jv
dGU6DQo+IA0KPiA+IHRoZSBsYWNrIG9mIHRhcmdldF91c2VyX2FyY2ggbWFrZXMgaXQgaGFyZCB0
byBmdWxseSBsZXZlcmFnZSB0aGUNCj4gPiBidWlsZCBzeXN0ZW0gaW4gb3JkZXIgdG8gc2VwYXJh
dGUgdXNlciBjb2RlIGZyb20gc3lzZW11IGNvZGUuDQo+ID4gDQo+ID4gUHJvdmlkZSBpdCwgc28g
dGhhdCB3ZSBjYW4gYXZvaWQgdGhlIHByb2xpZmVyYXRpb24gb2YgI2lmZGVmDQo+ID4gaW4gdGFy
Z2V0IGNvZGUuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQ2xhdWRpbyBGb250YW5hIDxjZm9u
dGFuYUBzdXNlLmRlPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENobywgWXUtQ2hlbiA8YWNob0BzdXNl
LmNvbT4NCj4gDQo+IEp1c3Qgbm90aWNlZCB3aGVuIEkgd2FzIHNlbmRpbmcgYSBwdWxsIHJlcXVl
c3Q6IHlvdXIgdW5xdW90ZWQgbmFtZSBpbg0KPiB0aGUgcy1vLWIgY29uZnVzZXMgZ2l0IHNlbmQt
ZW1haWwgd2hlbiBpdCBpcyBkb2luZyBpdHMgYXV0b21hdGljIGNjOnMNCj4gKGl0IGFkZHMgYSAn
Y2M6Q2hvJywgd2hpY2ggaXMgb2J2aW91c2x5IGJvZ3VzIGFuZCBsZWFkcyB0byB0aGUgbWFpbA0K
PiBiZWluZyByZWplY3RlZCBieSB0aGUgbGlzdCBzZXJ2ZXIuKSBOb3Qgc3VyZSB3aGV0aGVyIGdp
dCBzZW5kLWVtYWlsDQo+IHNob3VsZCBhZGQgcHJvcGVyIHF1b3RpbmcgaXRzZWxmLCBidXQgcHV0
dGluZyBxdW90aW5nIGluIHRoZSBzLW8tYg0KPiBsaW5lDQo+IGlzIHByb2JhYmx5IGEgZ29vZCBp
ZGVhIChJJ20gd29uZGVyaW5nIHdoeSBnaXQgZGlkbid0IGFkZCBpdCBpbiB0aGUNCj4gZmlyc3Qg
cGxhY2UuKQ0KPiANCg0KTm90IHN1cmUgd2hhdCBoYXBwZW5lZCBoZXJlLCBidXQgSSBkaWRuJ3Qg
Z2V0IGFueSB3cm9uZyBmcm9tIGdpdCBzZW5kLQ0KZW1haWwgYmVmb3JlLg0KDQo+IEFyZSB5b3Ug
ZmluZSB3aXRoIG1lIG1vZGlmeWluZyB5b3VyIHMtby1iIGxpbmVzIGluIHRoZSBjb21taXRzIHRv
DQo+IGluY2x1ZGUgcXVvdGluZywgaWYgSSBuZWVkIHRvIHJlc2VuZCB0aGUgcHVsbCByZXE/DQo+
IA0KDQp5ZXMsIHBsZWFzZSBhbmQgdGhhbmtzLg0KDQpDaGVlcnMsDQogICAgICBBTA0KDQoNCj4g
PiBBY2tlZC1ieTogQ29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+DQo+ID4gUmV2aWV3
ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0K
PiA+IC0tLQ0KPiA+IMKgdGFyZ2V0L3MzOTB4L21lc29uLmJ1aWxkIHwgMyArKysNCj4gPiDCoDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQoNCg==


