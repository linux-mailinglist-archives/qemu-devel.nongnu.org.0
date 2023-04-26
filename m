Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE226EF47C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 14:40:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1preRF-0003SV-Ah; Wed, 26 Apr 2023 08:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1preRD-0003Rm-JF
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 08:39:59 -0400
Received: from mail-db5eur01on0724.outbound.protection.outlook.com
 ([2a01:111:f400:fe02::724]
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1preRA-0001bT-LR
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 08:39:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZuMPw9YUs7R5HGJNyCMNOOo2N1QnuBIEQBtbmUiUPOI0x30Medj4pv2v1DcgFit1q6OUS1n6cS5gy1N+u9yvx6z72x+52mIVogr0U3HTTIeMFEdWQNFxDyD7X8HCocJZhdLIRrGuYbs53VnojO30Xdlym4wkuC0HTSa6umrqObGqpLCEKSkzGC53jbwxSWYTQMcLbStxgBt8GhLS0dE/NlwqyMnxMxUyQvD1mwlLeTDhX3wFuREcDeCeY32apyXDnxMLQid177bKD+nWiZCURlixg5t0pOi+mZTuQeVTZQf/LvYy6zirit5v50v4vAiGxAiWk05d4p4E+f/LMzshNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYJhjKBVlwieJCdRRBpyKmj0yKWL+OcsudOwQWXG8XI=;
 b=ObSCqTRYnaOJoYoSQ/bzfTEiPBZ3DHRV0PN9IzKhWyXoUVKJR/hgbCA+/ZM0+4QCgatTJ65Dtpzw/pH/w9VNoK3AZhjQZ/m/FotkafYV/TZHuJ4+DQuUBUiUg15GZNSM/2QiVzujXIu4FTEoK6hiz6RZrhXAEQXk9VubpwrdcsdVjOuk8GW2i/OCZsmr1szd/z5/U1MpSstgLnzsAI8fc2ZPnTcyMtQ78maiBv/9GbXSWH9Re6HEj5MDJ20JqZNxORt1miwB5TzxCUl7Nu1ls9k1sGv1v90h29X2yN0qenC6FBe6qQTx/NcpBN8sEyfG286LDLMXzwWdg/jqZWIlHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYJhjKBVlwieJCdRRBpyKmj0yKWL+OcsudOwQWXG8XI=;
 b=FpImn96ppXwWE6OCsjbIRtCKsI8xDar49Rjnj6C678b+fIjxcJ9q+KmCePeGHGU5IIzHHuoGK+2Lkg72D2LSgteigSew90Osj/cq2EZOY7V6pppKBzWFOK5sNzPP8wkkuVra4GCCvywjT+oH17mzwFCobidb67j2XOVkkoyPfLs=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AS8P189MB2530.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:635::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 12:39:21 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 12:39:21 +0000
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
Subject: RE: [PATCH v4 44/48] igb: Notify only new interrupts
Thread-Topic: [PATCH v4 44/48] igb: Notify only new interrupts
Thread-Index: AQHZeCt1Qcf7f9KiYEGl4A06MK5v3a89h42g
Date: Wed, 26 Apr 2023 12:39:20 +0000
Message-ID: <DBBP189MB1433DDE41351689276BD14AD95659@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
 <20230426103716.26279-45-akihiko.odaki@daynix.com>
In-Reply-To: <20230426103716.26279-45-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|AS8P189MB2530:EE_
x-ms-office365-filtering-correlation-id: f2211552-50ef-4db8-30e9-08db4653423c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aykRetdkk+LfnYUaoNqiGV6dfS6ano1PR7Kip/nuENyu+tZUw+nkvWWOwFwygn54NI5qadVYh5w2ukMMpkwSB3RTuBH5eg0FNd/XCkRu27xrV764YqJaCXmCMxvlbWbhIAxSqrQBEBC/6VpWG443JDLNNpgs5kbbW/zUS/KNO2+CewMGBTwq/26K9WvminQcaHi4Q6vH2cIlkgCGos24ZkEEZp4tYkkv/cOKDdvRE3Ej7m4XtxP9CXnbu2+Nt5cPZH3yDkvQ4CTCKWXMZn0GoeAxyEJYuI0G9J22QlH9FXEM8o61b+f2zbXPW4rJLpys0t+8vLKRgeTqR+4GkGhgaQoY+Aa6EdNCDw3ix9xJHK9WzPgZqHCd/7mxA9Cnoa6A79wpfcPRRm7LyNh5iV9+zfWRLuU/LjLxvwwQoBJVPdhXKsqsAQQJN+lZKbmljPNiqs7WvzfEhzHF9lZsLSWKslVhp2QvOdQCR3PRF1wLr7tIs8aS2M1B2A2xvHr9BBolXBL6eWlORU2SOrbLwlHRfycEy8vdwgBfsQcFeut55s+pzA66BBJS5dgrqaIsAV/boFftMiQoj+HVVm9gnVPMiTtiYT038N6+YbNYqEfH9FFbHUjZK9aGrLQfjrWXuz63
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(39840400004)(346002)(366004)(136003)(451199021)(38070700005)(33656002)(5660300002)(6916009)(316002)(4326008)(83380400001)(64756008)(4744005)(54906003)(186003)(2906002)(478600001)(9686003)(26005)(6506007)(7696005)(71200400001)(41300700001)(122000001)(8676002)(8936002)(38100700002)(7416002)(55016003)(86362001)(76116006)(44832011)(52536014)(66446008)(66556008)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXdiOVhHbkdUdUNOTXEwaEFQSGwyYmMwbHJ2ODB3L1Z5Sk5yd2xnTURSc1Jp?=
 =?utf-8?B?UFg2MHFKOFhoOHdOdlI5NWU3ZnVCSVV4aGZSYUFiYXQ2SjNodXVJOEVMNGFi?=
 =?utf-8?B?MWcyd3YrdTRnMnNTUWpoL0gwMmE0Nk5SWVNSS1ltcUk3a3JHa0trUVVUazZJ?=
 =?utf-8?B?U3dJSVlBckdrZi9sZ29HOFlYSFBNamJaSVpiUzRlZ3dYUUR4OGFOdmJRRlRL?=
 =?utf-8?B?N2ZYb0JTRzAvd01KV3JRUFlVb054NW1pMFRVdVJYUjhIZ3BhWmdZWHVpS2J4?=
 =?utf-8?B?OEhuaU44bXkxNkRZc01PMDZCVW5xNFp6ZjBHUWxtUnpGV3VZYm4wR25pTEtj?=
 =?utf-8?B?aFhPRnVCNnpIRTduU1hkTzdyTVp6QnRORzNJRFFjMGRnMFFJLzZFVVF6a0l3?=
 =?utf-8?B?bmJEdEdmL0c5NVI0a3NWcDRobUVVYjRJdGlpWkJWK0pwcUE1VnVBQXoxZ3hn?=
 =?utf-8?B?ZldjKzVZbnoweVJ5Tktpc2RIVUxyeS9wYW1VMHNZeTJlaGtmU0dxUExoMFdJ?=
 =?utf-8?B?L1NwQXpwOXVQb2pWc1Y0Q2x4UUY3YzNlK3lkQW9CZlh0cjN3WUhvMG8xaWhS?=
 =?utf-8?B?REROejBvWk1qenZpcVpEZE51OSs4RnJhbkFlc3RqYTQ2RHpGNnNuMGp6dFlK?=
 =?utf-8?B?N09BRUN4SS9ySHo3aDJ6ZlY1R1JraHR2OFoyS29FdkJMUTRDMGl3OGpJTEhQ?=
 =?utf-8?B?YUpwYjlUTEZvK1VzS1R5c2g2RGdHTDhjVXJpMEVjc25hUzZpWEx0czBZK2lM?=
 =?utf-8?B?dVJIUGxNUm1DOUh4MkZpZmFBYWNlN2F0a1RQdENNODZwU1RZOEl5U3ovLzFu?=
 =?utf-8?B?eWk4Q0dGTllhU1hwR3BSTnBZWjV1bExzVmE2Z1JieEtsaThoM09qdGpzTTVi?=
 =?utf-8?B?OEp4aXJXSzkxQ29ONDRYNWNvTkxiRmEvbThXcThYdFdqZmJyZWVuYkpvR3o2?=
 =?utf-8?B?a2VGTGhpS2ViVnU2bDdJenF0dHRTMXQ3MVVLSm9UYVc0Q3QwTE5BK1hrUkU5?=
 =?utf-8?B?Wjk3bVRHb3QwZmdkYzdERE9YZkFSK3p1VXZ5UEh0TWk3c2wxdGx4MGxDTDZj?=
 =?utf-8?B?aE1tOWdGSTZhRTQzRlp3QklBR2phWmxmOEl1N0htREltdmIzRy9GbFI2S0Fy?=
 =?utf-8?B?UDZNeDQrd0hUSFdwbEFWa1pEdVFFRmhhQXNZRHpiRXBiT2VhM0ZmZUp2M3cw?=
 =?utf-8?B?ait3eS8wdzArQk8xT3hsNEVRZno2bXhqL1JpWHNXTEYwM0N2bUliWUJQWmJT?=
 =?utf-8?B?elozemVyM3Q1SDdzM0k2MVNMdkxXbVpvUmtkMXYvQ2lnMGRRaTFsb1hOQ1NU?=
 =?utf-8?B?cFROZVlkZU9GdVpSdjBiSlR5dVg4YVh0SHJtb2tmTXdXTnY5SzIyak5QaEFO?=
 =?utf-8?B?cUJXYU5weEdGd0t0VDBjNGY0cnE4ZEU1M04wSnNSMll6SEplRU04aFBIWjhr?=
 =?utf-8?B?L0tLNWpNOFN5OXhCSWwva054Unc0RnlENkhscXVuRWVsQ3IyMGZGYWYwWmo4?=
 =?utf-8?B?b3FwZVh5QXhYTmRzRFpFTWkwREJ0SGYrbU5VWjZnaytodWhteFRYYlQwN2dD?=
 =?utf-8?B?YWhSMzBiQ0NOZzNleXBmZ28wZ21ZZEFJUlNrY2Uwdm5ZMlA4bElGTkt1ZVd3?=
 =?utf-8?B?QmxwQU54S0VNYVg2WDkwK3dJTk41bENUcCtyLy9ieWQ2N0I1WWx1RlVUYmNI?=
 =?utf-8?B?NVdKUnZjelQ4TlcrSkxyQVlnckkxdWlYRmlWd1djQ0RjcExuRTJjaE9nNk1k?=
 =?utf-8?B?TFRBbkErekVOQTg3MDA3eTdxbzlnMmlneHFGSGhhaFE1b2NqZk12d2xVT0R4?=
 =?utf-8?B?SE9kazVXaUlJdHpZRGpienFOQVZoUjN5dExCcWRqUm93NXZ4YS9hbmRBR1p0?=
 =?utf-8?B?cWxCcHdkVTF5bTlzUGk1UFkwSTAwRWs2aGZqaWx2SlN4aTB4b1liOVdsdWZG?=
 =?utf-8?B?Wk1nUU5UaHV1cjJYeldhUWl1dTc0UjI3dW9xditpWUNTUDJQdXNjbFpLUE04?=
 =?utf-8?B?Rk1JSnphWUxYV25wTXV0cTlHQWdOV1kzZXVNWmRtbDdsdFRYd0tGRXdhOGUy?=
 =?utf-8?B?LzlsdmM2dlNhWE5JOHNKQ3B3Z2EzSFRDOG5wN2E4S3V4Q2VZU2E4N3diTFd0?=
 =?utf-8?Q?UJ5ofyW2o416X4Y/y69smcT7E?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f2211552-50ef-4db8-30e9-08db4653423c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 12:39:21.0032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gH3ruZPLOEJ+g3XWWnG/kdnIiUl5QV3wQcjd5SFwdCPZ/H6W8YsJ7yp9Nr/E868uauE32JTDoJuOiazleSJjxRBiIeBb7aTGlpEvdc9khMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2530
Received-SPF: pass client-ip=2a01:111:f400:fe02::724;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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
YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIDI2IEFwcmlsIDIw
MjMgMTI6MzcNCj4gQ2M6IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1hbkBlc3Qu
dGVjaD47IEphc29uIFdhbmcNCj4gPGphc293YW5nQHJlZGhhdC5jb20+OyBEbWl0cnkgRmxleXRt
YW4gPGRtaXRyeS5mbGV5dG1hbkBnbWFpbC5jb20+Ow0KPiBNaWNoYWVsIFMgLiBUc2lya2luIDxt
c3RAcmVkaGF0LmNvbT47IEFsZXggQmVubsOpZQ0KPiA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz47
IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz47DQo+IFRob21hcyBI
dXRoIDx0aHV0aEByZWRoYXQuY29tPjsgV2FpbmVyIGRvcyBTYW50b3MgTW9zY2hldHRhDQo+IDx3
YWluZXJzbUByZWRoYXQuY29tPjsgQmVyYWxkbyBMZWFsIDxibGVhbEByZWRoYXQuY29tPjsgQ2xl
YmVyIFJvc2ENCj4gPGNyb3NhQHJlZGhhdC5jb20+OyBMYXVyZW50IFZpdmllciA8bHZpdmllckBy
ZWRoYXQuY29tPjsgUGFvbG8gQm9uemluaQ0KPiA8cGJvbnppbmlAcmVkaGF0LmNvbT47IHFlbXUt
ZGV2ZWxAbm9uZ251Lm9yZzsgVG9tYXN6IER6aWVjaW9sDQo+IDx0LmR6aWVjaW9sQHBhcnRuZXIu
c2Ftc3VuZy5jb20+OyBBa2loaWtvIE9kYWtpDQo+IDxha2loaWtvLm9kYWtpQGRheW5peC5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSCB2NCA0NC80OF0gaWdiOiBOb3RpZnkgb25seSBuZXcgaW50ZXJy
dXB0cw0KPiANCj4gVGhpcyBmb2xsb3dzIHRoZSBjb3JyZXNwb25kaW5nIGNoYW5nZSBmb3IgZTEw
MDBlLiBUaGlzIGZpeGVzOg0KPiB0ZXN0cy9hdm9jYWRvL25ldGRldi1ldGh0b29sLnB5Ok5ldERl
dkV0aHRvb2wudGVzdF9pZ2INCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFraWhpa28gT2Rha2kgPGFr
aWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4gLS0tDQo+ICBody9uZXQvaWdiX2NvcmUuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAyMDEgKysrKysrKystLS0tLS0tLS0tDQo+ICBody9u
ZXQvdHJhY2UtZXZlbnRzICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTEgKy0NCj4gIC4u
Li9vcmcuY2VudG9zL3N0cmVhbS84L3g4Nl82NC90ZXN0LWF2b2NhZG8gICB8ICAgMSArDQo+ICB0
ZXN0cy9hdm9jYWRvL25ldGRldi1ldGh0b29sLnB5ICAgICAgICAgICAgICAgfCAgIDQgLQ0KPiAg
NCBmaWxlcyBjaGFuZ2VkLCA4NyBpbnNlcnRpb25zKCspLCAxMzAgZGVsZXRpb25zKC0pDQo+IA0K
DQpMR1RNDQpUZXN0ZWQtYnk6IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1hbkBl
c3QudGVjaD4NCg==

