Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B900B6ECB5F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 13:32:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pquPv-0007Te-Lt; Mon, 24 Apr 2023 07:31:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pquPn-0007TR-F1
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:31:28 -0400
Received: from mail-ve1eur01on0721.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::721]
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pquPk-00076k-MO
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:31:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fs9lGFQynICUPKrMZ+A6zhXgxPSecYg/hsy9Kf7yI0Vz+biMlfIYRR5gdna7eyDwvFGZ+8rEpIbxfFTeIOBXQe7afb9ISiIeSB4M1IVlm7sug/bweL9wzTn7JGYPpBics48SxiUmFwI+MlUA0/Qwr4ABA7nU7BvvevZ9PM0vSDkIrPZb3DxG+SEDvRcOPu2HD0TpEvjkK9zgsBvZCB3dzMveVWA/GM/I79eXtoh8NfXM0PHiPoZBOwFLqgFyKkVJdsFJ9ZlIc2V8FlQc6iGNbP79mzYq3Jx3DjftJWthWyziJNE5yP4YGj+p1fwpCDQYO6oGRU7z+HkkTm8fR2F/8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBcs3uNKzXYThNTVvQF0ifd7WoCpdPDI+MfoyzwrKiw=;
 b=AXJFWKXy1Tsi3sqF4qzdnFH885Tux9NMvKV9HBjDlr/yrKHYrhYYIkB0UV2xp18YiaK/1nSUSBuQRqb+V1eFF62ONI45k9Frg3lk2JQdvvZZUs1HXCVBrh3kISIOJiV+qKNqkRaSxGWf4BwWiW6PBK5LWRbirFQLAqC+TQjLBtCN69IFnuhi6hSPvBOc9lPhhfVU0oM6bwWkxnOAPVbqooT25Yu0wnguFh0yrXSnAcK6vtL64Lm7RJfWBoScTDL67iuNFVMAwGaKHiPrbYw9jCjkItxJftdCPzHTascF0mVvlzb8mZrjTGX2/0c+Pn3IUbvS+iCuWr12NahnWkaGZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBcs3uNKzXYThNTVvQF0ifd7WoCpdPDI+MfoyzwrKiw=;
 b=La7OcDclcxdfHytRTjxM+0YBQbearXss6J9O+GSY7SGQaXePc3OOLkyYoxUiKgPL4tkqw5RYLT4kgHn1BBwnT44SlBIXlBcsXnDK1f7vsG1MJTSQqbSKGBTVqWp48sdL/+Ay670zvlerRUWCkHeekkVnzKywBgE9zgOZG/eXSX8=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB3P189MB2623.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:437::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 11:31:19 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 11:31:19 +0000
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
Subject: RE: [PATCH v3 09/47] igb: Always copy ethernet header
Thread-Topic: [PATCH v3 09/47] igb: Always copy ethernet header
Thread-Index: AQHZdZrF4G76IhN6ME2yuFY3RCVtDK86VLhQ
Date: Mon, 24 Apr 2023 11:31:19 +0000
Message-ID: <DBBP189MB1433008FCA7DA827DD8F546295679@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
 <20230423041833.5302-10-akihiko.odaki@daynix.com>
In-Reply-To: <20230423041833.5302-10-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DB3P189MB2623:EE_
x-ms-office365-filtering-correlation-id: e1ba6e94-03c9-48cf-f6e0-08db44b76cb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ONhkF6DICZpr+bakD9LTjIAaTavwuKfglvv651K91Bv35RW9161CAN6X+LtJdXwGEKj4HYx271yOrEZEYr00C0yBzkh6u77XNRWBt+5wuwy8onlxEE2pwAtr/uBqb3+4PG+3yiWJ5TqReVvTH8kuLN56m8UMHb2z90RYhh9O0xcYe4+OT8KfVbgZYqqxVvN1fcqpDWe8iPjNCUtqzh4hiUf4SWWeBETPHNN3o3oxXeDiS6PDn42XKU6SVgFzDxkanz+ToiTBaVSpIPvySNErbZumpBUMm5Mpjf9XZLw/uUgCyg6tvnI2vmu0Bnp43MDasYTbJjmGhpXqlos461lTdvp5Ni+JDO4ygEjBdNIsl3M8JEmMwWHrhLiv1I3oyZlw5Q77JBM1LVlWONBqMz67+GBb1WYBX2z7nAdOXmTH0Z28dw8EMQ37sqaftuMVforGmPYVupGqhPnAlJW20R++YdwyTkNnjqfGPPAtnB3Cgrcf1VZVSifDj1/ekl3MvX1fcR/+diabZ5/3MPjUfZk7TSyPHBMKqneSMGG+LR+nDJIMsyO+Xqb7vn+JiutdXJOr91ewdl09bBPi7SDVDlmjkjZuIkNFr4X5LANe8PU/XX5e8Wgd4DYmKfT5Z/u2oBKL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(39830400003)(376002)(346002)(136003)(396003)(366004)(451199021)(54906003)(38070700005)(478600001)(316002)(4326008)(6916009)(76116006)(64756008)(66446008)(66476007)(66556008)(55016003)(66946007)(122000001)(7416002)(41300700001)(44832011)(2906002)(8936002)(8676002)(52536014)(5660300002)(38100700002)(9686003)(6506007)(26005)(86362001)(186003)(33656002)(83380400001)(71200400001)(66574015)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OStyZWgydEtic25XaXpaOXM5eWFoTktVUC9BTE40OTFoYll3QUpYUlJ4Nmdj?=
 =?utf-8?B?eWp6TTVBS1VDQjgzaUk1aDlXaEx5V2ZvMWJpbmZCVUYrSFZkcDRyWVFYZHhX?=
 =?utf-8?B?elhFYVdnT1c2Wi9JUDEzMnlRbTZZV3hTMmdYSGJlOU9kQ2FXYWtGZ243bUJt?=
 =?utf-8?B?dEtuSGVuMU1IQThkbGdwQjMyRW5ka2hLdksvVnIzdVlpUHFnaGErdW50WmNV?=
 =?utf-8?B?SmFmZWZyWHhadmsvcHFvdUhOZ0txMVJTaUZMLzRuMUZQUEwrczJNZ3ZUVzQ4?=
 =?utf-8?B?MENmSTN6MzNVMklDTmtLQXFIY1oza1NQK2ZFUWFEVE1BWUowOTJlUEZKYzNQ?=
 =?utf-8?B?YjBpRkVGZVlHczl3cEw2WVZlYW03ejlORG5MUWVMcU1YOXg0ZjNWZU5SWDlv?=
 =?utf-8?B?RjZ2K1N3QkQ5dHByc3NuZnJ6emlOd29oTVJuT2hDOFpVd1NyN0F5WGZaRGk2?=
 =?utf-8?B?Y2V6NURacGNKbkNwM0NtZFpNQmJmK1pVVUJUcFJzbDIxSlZiNXNhQ01sRXhQ?=
 =?utf-8?B?T1BtYTE0cHVZZ090OEdGaWp0UEpaZHFHc0txTEdCZ0JoclpkMzYxbHdpQWRL?=
 =?utf-8?B?Y2NEaHU4T0FvZmlqSG9OQXlLOFZHbWRFQ20rT1RpcGQ5TG8ycm5TVlMvOWZa?=
 =?utf-8?B?RlFSSE4rdldDWW04VURZUERVTnA4MFV0KzJMZTMycU13dHkySVY1RHpIN0w3?=
 =?utf-8?B?eEpScnFtRnpoNEdnQi9xb005dGFUczkvTXIwT3RYMVZMYzMrd3dWN240ZVZB?=
 =?utf-8?B?UHh5d00vcmlRV0lFZ0lIVmwwVVdsTHIwUGN6RFdSdEc3aVVOYUJGNTRLemdC?=
 =?utf-8?B?eTFrRWtybGhiOGQ0c1Q4NTVKMjR2aGhpN3JzNWNac3NwUmRVM3h0V1pxWTZj?=
 =?utf-8?B?QzE1MHY4L24zTllBREJKUlVZWUdRSG10aGN5Nk5hYXg5bU92L0Q2c3ljdlUw?=
 =?utf-8?B?M1JTUlFMVnpheUpMTUlFUzE5Zk4rcXFmeSsrWVJHbXEyQUU0NEVNSHZKTXRo?=
 =?utf-8?B?MlVqdnlpdnorS3E1SlFoSmM0Y2ZiS0FXb01oNXhmZ1BPOXZIZXZHNUhXYlpE?=
 =?utf-8?B?WEpVcXFQU2JnM3ZibXFrSHk4VTErS3VLaGQ2ZE9tZ3VlaFl4RXQzZXlPcWQw?=
 =?utf-8?B?QU1NZDZxUUVxbjF4RCs0N2Exa1dPT05rd0JYZ3pPdENTQ0tkUzZRR3NHcEJk?=
 =?utf-8?B?K0hPWGdSS0J5UnZ4allVUHJPZXMvVEZiTnBVY2t2RTNBK2FIVkZhR0JpOFVt?=
 =?utf-8?B?N3I0U2diOUlLc0Zwd0VWaUtCa2NrMVRUSXA3aExsRFNkMnluL0lvMzFYYVd3?=
 =?utf-8?B?eTZlQkJsemVzekVGYTFIUFhrVWRmSWZCdFVseFhlcnhKSi96NU1MbTV1QVVU?=
 =?utf-8?B?S1NiNnpOb3h2Y0VBOWRaNXBPeEtFb2lVMzc4bDVrZ2lRZ2xDdmgzRmFlV2lr?=
 =?utf-8?B?S1B0em1DdW5URC95S3RsR1l4K1pKdzBCc1ppY3N1N1NRUGxPMVhHWU9SMXBK?=
 =?utf-8?B?RDgwUFBlQXdMd2ViekZHa0VrZ0d0WWRpZ2psUzFDaFpWTTkvcnBmYkFQY0Jx?=
 =?utf-8?B?Zi9vRGRpZFk4bERXajFpOEphZkwrRmI4Skpxc0dxZ1B2TlRQVXZyMU9rMFpj?=
 =?utf-8?B?OWZWbDFjTFFYSmxwbDNkSHl1dkJrMzRHVHB0aVZCeWdrcTg0NFhrQzVSZFZ2?=
 =?utf-8?B?NEJVanBvazB5TEVRRWJvc245bU9TVk9tZjhSdCs4K3NoVUEwcUZnMjJzdHNB?=
 =?utf-8?B?R0pRQjN5cjFoRnF3R0pmQmVRdlh2N1VSUnRMUkRibVQzZ2ZPNDNZUGhCTnlN?=
 =?utf-8?B?T1BFRW1PdDJYeG5TZXlZSUUwV0xBejhOTW5vS3ZVcHBuRTNadkoyUDlkV2FF?=
 =?utf-8?B?SkFqZDlMcFNCV1NlajJLb1BhMXljQ0lkbFcwME95bm1lNnRXbFlCWWU0TFFL?=
 =?utf-8?B?ZWpUcVNBN0IxWHduQWdySVhpVHRxTkxVUDlTU1FXdHBBL3VuWnVKV0Z2bCs5?=
 =?utf-8?B?R2gzdjVuNW9zVVNKQnp6VldFOVhWSXNtWENwSW41YVJqb3IrNVNxalBvRHJm?=
 =?utf-8?B?WUgranFQaVgyaHZUVEZaN3k5bTREcFp2ajUwcDRiV1NseEwyQS9kSGtaeGdE?=
 =?utf-8?Q?dzsykDpgaAc6xrMziOQh8MfXC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ba6e94-03c9-48cf-f6e0-08db44b76cb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 11:31:19.6357 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kto4LCrCQc/iCeaB53jycAMs1wsQTVnsur1Q0taeQVEAOkmO5E1LhTVlw/5A1awHfQ683HNF84NIujraSWhole6uNvmlXek9jMrb+X50LZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3P189MB2623
Received-SPF: pass client-ip=2a01:111:f400:fe1f::721;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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
YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0KPiBTZW50OiBTdW5kYXksIDIzIEFwcmlsIDIwMjMg
MDY6MTgNCj4gQ2M6IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1hbkBlc3QudGVj
aD47IEphc29uIFdhbmcNCj4gPGphc293YW5nQHJlZGhhdC5jb20+OyBEbWl0cnkgRmxleXRtYW4g
PGRtaXRyeS5mbGV5dG1hbkBnbWFpbC5jb20+Ow0KPiBNaWNoYWVsIFMgLiBUc2lya2luIDxtc3RA
cmVkaGF0LmNvbT47IEFsZXggQmVubsOpZQ0KPiA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz47IFBo
aWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz47DQo+IFRob21hcyBIdXRo
IDx0aHV0aEByZWRoYXQuY29tPjsgV2FpbmVyIGRvcyBTYW50b3MgTW9zY2hldHRhDQo+IDx3YWlu
ZXJzbUByZWRoYXQuY29tPjsgQmVyYWxkbyBMZWFsIDxibGVhbEByZWRoYXQuY29tPjsgQ2xlYmVy
IFJvc2ENCj4gPGNyb3NhQHJlZGhhdC5jb20+OyBMYXVyZW50IFZpdmllciA8bHZpdmllckByZWRo
YXQuY29tPjsgUGFvbG8gQm9uemluaQ0KPiA8cGJvbnppbmlAcmVkaGF0LmNvbT47IHFlbXUtZGV2
ZWxAbm9uZ251Lm9yZzsgVG9tYXN6IER6aWVjaW9sDQo+IDx0LmR6aWVjaW9sQHBhcnRuZXIuc2Ft
c3VuZy5jb20+OyBBa2loaWtvIE9kYWtpDQo+IDxha2loaWtvLm9kYWtpQGRheW5peC5jb20+DQo+
IFN1YmplY3Q6IFtQQVRDSCB2MyAwOS80N10gaWdiOiBBbHdheXMgY29weSBldGhlcm5ldCBoZWFk
ZXINCj4gDQo+IGlnYl9yZWNlaXZlX2ludGVybmFsKCkgdXNlZCB0byBjaGVjayB0aGUgaW92IGxl
bmd0aCB0byBkZXRlcm1pbmUgY29weSB0aGUgaW92cw0KPiB0byBhIGNvbnRpZ3VvdXMgYnVmZmVy
LCBidXQgdGhlIGNoZWNrIGlzIGZsYXdlZCBpbiB0d28NCj4gd2F5czoNCj4gLSBJdCBkb2VzIG5v
dCBlbnN1cmUgdGhhdCBpb3ZjbnQgPiAwLg0KPiAtIEl0IGRvZXMgbm90IHRha2UgdmlydGlvLW5l
dCBoZWFkZXIgaW50byBjb25zaWRlcmF0aW9uLg0KPiANCj4gVGhlIHNpemUgb2YgdGhpcyBjb3B5
IGlzIGp1c3QgMjIgb2N0ZXRzLCB3aGljaCBjYW4gYmUgZXZlbiBsZXNzIHRoYW4gdGhlIGNvZGUg
c2l6ZQ0KPiByZXF1aXJlZCBmb3IgY2hlY2tzLiBUaGlzICh3cm9uZykgb3B0aW1pemF0aW9uIGlz
IHByb2JhYmx5IG5vdCB3b3J0aCBzbyBqdXN0DQo+IHJlbW92ZSBpdC4gUmVtb3ZpbmcgdGhpcyBh
bHNvIGFsbG93cyBpZ2IgdG8gYXNzdW1lIGFsaWduZWQgYWNjZXNzZXMgZm9yIHRoZQ0KPiBldGhl
cm5ldCBoZWFkZXIuDQo+IA0KPiBGaXhlczogM2E5NzdkZWViZSAoIkludHJkb2N1ZSBpZ2IgZGV2
aWNlIGVtdWxhdGlvbiIpDQo+IFNpZ25lZC1vZmYtYnk6IEFraWhpa28gT2Rha2kgPGFraWhpa28u
b2Rha2lAZGF5bml4LmNvbT4NCj4gLS0tDQo+ICBody9uZXQvaWdiX2NvcmUuYyB8IDM5ICsrKysr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIx
IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2h3L25l
dC9pZ2JfY29yZS5jIGIvaHcvbmV0L2lnYl9jb3JlLmMgaW5kZXgNCj4gMjFhOGQ5YWRhNC4uMWQ3
ZjkxM2U1YSAxMDA2NDQNCj4gLS0tIGEvaHcvbmV0L2lnYl9jb3JlLmMNCj4gKysrIGIvaHcvbmV0
L2lnYl9jb3JlLmMNCj4gQEAgLTY3LDYgKzY3LDExIEBAIHR5cGVkZWYgc3RydWN0IElHQlR4UGt0
Vm1kcUNhbGxiYWNrQ29udGV4dCB7DQo+ICAgICAgTmV0Q2xpZW50U3RhdGUgKm5jOw0KPiAgfSBJ
R0JUeFBrdFZtZHFDYWxsYmFja0NvbnRleHQ7DQo+IA0KPiArdHlwZWRlZiBzdHJ1Y3QgTDJIZWFk
ZXIgew0KPiArICAgIHN0cnVjdCBldGhfaGVhZGVyIGV0aDsNCj4gKyAgICBzdHJ1Y3Qgdmxhbl9o
ZWFkZXIgdmxhbjsNCj4gK30gTDJIZWFkZXI7DQo+ICsNCj4gIHN0YXRpYyBzc2l6ZV90DQo+ICBp
Z2JfcmVjZWl2ZV9pbnRlcm5hbChJR0JDb3JlICpjb3JlLCBjb25zdCBzdHJ1Y3QgaW92ZWMgKmlv
diwgaW50IGlvdmNudCwNCj4gICAgICAgICAgICAgICAgICAgICAgIGJvb2wgaGFzX3ZuZXQsIGJv
b2wgKmV4dGVybmFsX3R4KTsgQEAgLTk2MSwxNSArOTY2LDE2IEBADQo+IGlnYl9yeF9pc19vdmVy
c2l6ZWQoSUdCQ29yZSAqY29yZSwgdWludDE2X3QgcW4sIHNpemVfdCBzaXplKQ0KPiAgICAgIHJl
dHVybiBzaXplID4gKGxwZSA/IG1heF9ldGhlcm5ldF9scGVfc2l6ZSA6IG1heF9ldGhlcm5ldF92
bGFuX3NpemUpOyAgfQ0KPiANCj4gLXN0YXRpYyB1aW50MTZfdCBpZ2JfcmVjZWl2ZV9hc3NpZ24o
SUdCQ29yZSAqY29yZSwgY29uc3Qgc3RydWN0IGV0aF9oZWFkZXINCj4gKmVoZHIsDQo+ICtzdGF0
aWMgdWludDE2X3QgaWdiX3JlY2VpdmVfYXNzaWduKElHQkNvcmUgKmNvcmUsIGNvbnN0IEwySGVh
ZGVyDQo+ICsqbDJfaGVhZGVyLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzaXplX3Qgc2l6ZSwgRTEwMDBFX1JTU0luZm8gKnJzc19pbmZvLA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBib29sICpleHRlcm5hbF90eCkgIHsNCj4gICAgICBzdGF0
aWMgY29uc3QgaW50IHRhX3NoaWZ0W10gPSB7IDQsIDMsIDIsIDAgfTsNCj4gKyAgICBjb25zdCBz
dHJ1Y3QgZXRoX2hlYWRlciAqZWhkciA9ICZsMl9oZWFkZXItPmV0aDsNCj4gICAgICB1aW50MzJf
dCBmLCByYVsyXSwgKm1hY3AsIHJjdGwgPSBjb3JlLT5tYWNbUkNUTF07DQo+ICAgICAgdWludDE2
X3QgcXVldWVzID0gMDsNCj4gICAgICB1aW50MTZfdCBvdmVyc2l6ZWQgPSAwOw0KPiAtICAgIHVp
bnQxNl90IHZpZCA9IGxkdXdfYmVfcCgmUEtUX0dFVF9WTEFOX0hEUihlaGRyKS0+aF90Y2kpICYN
Cj4gVkxBTl9WSURfTUFTSzsNCj4gKyAgICB1aW50MTZfdCB2aWQgPSBiZTE2X3RvX2NwdShsMl9o
ZWFkZXItPnZsYW4uaF90Y2kpICYgVkxBTl9WSURfTUFTSzsNCj4gICAgICBib29sIGFjY2VwdGVk
ID0gZmFsc2U7DQo+ICAgICAgaW50IGk7DQo+IA0KPiBAQCAtMTU5MCwxNCArMTU5NiwxMyBAQCBz
dGF0aWMgc3NpemVfdA0KPiAgaWdiX3JlY2VpdmVfaW50ZXJuYWwoSUdCQ29yZSAqY29yZSwgY29u
c3Qgc3RydWN0IGlvdmVjICppb3YsIGludCBpb3ZjbnQsDQo+ICAgICAgICAgICAgICAgICAgICAg
ICBib29sIGhhc192bmV0LCBib29sICpleHRlcm5hbF90eCkgIHsNCj4gLSAgICBzdGF0aWMgY29u
c3QgaW50IG1heGltdW1fZXRoZXJuZXRfaGRyX2xlbiA9IChFVEhfSExFTiArIDQpOw0KPiAtDQo+
ICAgICAgdWludDE2X3QgcXVldWVzID0gMDsNCj4gICAgICB1aW50MzJfdCBuID0gMDsNCj4gLSAg
ICB1aW50OF90IG1pbl9idWZbRVRIX1pMRU5dOw0KPiArICAgIHVuaW9uIHsNCj4gKyAgICAgICAg
TDJIZWFkZXIgbDJfaGVhZGVyOw0KPiArICAgICAgICB1aW50OF90IG9jdGV0c1tFVEhfWkxFTl07
DQo+ICsgICAgfSBtaW5fYnVmOw0KDQpJIHdvdWxkIGNhbGwgdGhpc14gYnVmL2ZpbHRlcl9idWYg
aW5zdGVhZCBvZiBtaW5fYnVmLiBCdXQgaXQgaXMgdXB0byB5b3UgdG8gZGVjaWRlLg0KSW4gYW55
IGNhc2UsIA0KUmV2aWV3ZWQtYnk6IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1h
bkBlc3QudGVjaD4NCg0KPiAgICAgIHN0cnVjdCBpb3ZlYyBtaW5faW92Ow0KPiAtICAgIHN0cnVj
dCBldGhfaGVhZGVyICplaGRyOw0KPiAtICAgIHVpbnQ4X3QgKmZpbHRlcl9idWY7DQo+ICAgICAg
c2l6ZV90IHNpemUsIG9yaWdfc2l6ZTsNCj4gICAgICBzaXplX3QgaW92X29mcyA9IDA7DQo+ICAg
ICAgRTEwMDBFX1J4UmluZyByeHI7DQo+IEBAIC0xNjIzLDI0ICsxNjI4LDIxIEBAIGlnYl9yZWNl
aXZlX2ludGVybmFsKElHQkNvcmUgKmNvcmUsIGNvbnN0IHN0cnVjdA0KPiBpb3ZlYyAqaW92LCBp
bnQgaW92Y250LA0KPiAgICAgICAgICBuZXRfcnhfcGt0X3Vuc2V0X3ZoZHIoY29yZS0+cnhfcGt0
KTsNCj4gICAgICB9DQo+IA0KPiAtICAgIGZpbHRlcl9idWYgPSBpb3YtPmlvdl9iYXNlICsgaW92
X29mczsNCj4gICAgICBvcmlnX3NpemUgPSBpb3Zfc2l6ZShpb3YsIGlvdmNudCk7DQo+ICAgICAg
c2l6ZSA9IG9yaWdfc2l6ZSAtIGlvdl9vZnM7DQo+IA0KPiAgICAgIC8qIFBhZCB0byBtaW5pbXVt
IEV0aGVybmV0IGZyYW1lIGxlbmd0aCAqLw0KPiAgICAgIGlmIChzaXplIDwgc2l6ZW9mKG1pbl9i
dWYpKSB7DQo+IC0gICAgICAgIGlvdl90b19idWYoaW92LCBpb3ZjbnQsIGlvdl9vZnMsIG1pbl9i
dWYsIHNpemUpOw0KPiAtICAgICAgICBtZW1zZXQoJm1pbl9idWZbc2l6ZV0sIDAsIHNpemVvZiht
aW5fYnVmKSAtIHNpemUpOw0KPiArICAgICAgICBpb3ZfdG9fYnVmKGlvdiwgaW92Y250LCBpb3Zf
b2ZzLCAmbWluX2J1Ziwgc2l6ZSk7DQo+ICsgICAgICAgIG1lbXNldCgmbWluX2J1Zi5vY3RldHNb
c2l6ZV0sIDAsIHNpemVvZihtaW5fYnVmKSAtIHNpemUpOw0KPiAgICAgICAgICBlMTAwMHhfaW5j
X3JlZ19pZl9ub3RfZnVsbChjb3JlLT5tYWMsIFJVQyk7DQo+IC0gICAgICAgIG1pbl9pb3YuaW92
X2Jhc2UgPSBmaWx0ZXJfYnVmID0gbWluX2J1ZjsNCj4gKyAgICAgICAgbWluX2lvdi5pb3ZfYmFz
ZSA9ICZtaW5fYnVmOw0KPiAgICAgICAgICBtaW5faW92Lmlvdl9sZW4gPSBzaXplID0gc2l6ZW9m
KG1pbl9idWYpOw0KPiAgICAgICAgICBpb3ZjbnQgPSAxOw0KPiAgICAgICAgICBpb3YgPSAmbWlu
X2lvdjsNCj4gICAgICAgICAgaW92X29mcyA9IDA7DQo+IC0gICAgfSBlbHNlIGlmIChpb3YtPmlv
dl9sZW4gPCBtYXhpbXVtX2V0aGVybmV0X2hkcl9sZW4pIHsNCj4gLSAgICAgICAgLyogVGhpcyBp
cyB2ZXJ5IHVubGlrZWx5LCBidXQgbWF5IGhhcHBlbi4gKi8NCj4gLSAgICAgICAgaW92X3RvX2J1
Zihpb3YsIGlvdmNudCwgaW92X29mcywgbWluX2J1ZiwgbWF4aW11bV9ldGhlcm5ldF9oZHJfbGVu
KTsNCj4gLSAgICAgICAgZmlsdGVyX2J1ZiA9IG1pbl9idWY7DQo+ICsgICAgfSBlbHNlIHsNCj4g
KyAgICAgICAgaW92X3RvX2J1Zihpb3YsIGlvdmNudCwgaW92X29mcywgJm1pbl9idWYsDQo+ICsg
c2l6ZW9mKG1pbl9idWYubDJfaGVhZGVyKSk7DQo+ICAgICAgfQ0KPiANCj4gICAgICAvKiBEaXNj
YXJkIG92ZXJzaXplZCBwYWNrZXRzIGlmICFMUEUgYW5kICFTQlAuICovIEBAIC0xNjQ4LDExICsx
NjUwLDEyDQo+IEBAIGlnYl9yZWNlaXZlX2ludGVybmFsKElHQkNvcmUgKmNvcmUsIGNvbnN0IHN0
cnVjdCBpb3ZlYyAqaW92LCBpbnQgaW92Y250LA0KPiAgICAgICAgICByZXR1cm4gb3JpZ19zaXpl
Ow0KPiAgICAgIH0NCj4gDQo+IC0gICAgZWhkciA9IFBLVF9HRVRfRVRIX0hEUihmaWx0ZXJfYnVm
KTsNCj4gLSAgICBuZXRfcnhfcGt0X3NldF9wYWNrZXRfdHlwZShjb3JlLT5yeF9wa3QsIGdldF9l
dGhfcGFja2V0X3R5cGUoZWhkcikpOw0KPiArICAgIG5ldF9yeF9wa3Rfc2V0X3BhY2tldF90eXBl
KGNvcmUtPnJ4X3BrdCwNCj4gKw0KPiArIGdldF9ldGhfcGFja2V0X3R5cGUoJm1pbl9idWYubDJf
aGVhZGVyLmV0aCkpOw0KPiAgICAgIG5ldF9yeF9wa3Rfc2V0X3Byb3RvY29scyhjb3JlLT5yeF9w
a3QsIGlvdiwgaW92Y250LCBpb3Zfb2ZzKTsNCj4gDQo+IC0gICAgcXVldWVzID0gaWdiX3JlY2Vp
dmVfYXNzaWduKGNvcmUsIGVoZHIsIHNpemUsICZyc3NfaW5mbywgZXh0ZXJuYWxfdHgpOw0KPiAr
ICAgIHF1ZXVlcyA9IGlnYl9yZWNlaXZlX2Fzc2lnbihjb3JlLCAmbWluX2J1Zi5sMl9oZWFkZXIs
IHNpemUsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZyc3NfaW5mbywgZXh0
ZXJuYWxfdHgpOw0KPiAgICAgIGlmICghcXVldWVzKSB7DQo+ICAgICAgICAgIHRyYWNlX2UxMDAw
ZV9yeF9mbHRfZHJvcHBlZCgpOw0KPiAgICAgICAgICByZXR1cm4gb3JpZ19zaXplOw0KPiAtLQ0K
PiAyLjQwLjANCg0K

