Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD5A6E3345
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Apr 2023 21:10:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnlGc-0000V5-Vk; Sat, 15 Apr 2023 15:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pnlGb-0000Ui-0J
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 15:08:57 -0400
Received: from mail-db5eur02on20727.outbound.protection.outlook.com
 ([2a01:111:f400:fe12::727]
 helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pnlGZ-0007N3-5Z
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 15:08:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7eR/Fjx/V/gjdRjt03rmtxDu7vWMWfSpsV03Q1d/q9jCWPYKW8JhvSUmMc9W7iAa9aDi1wD3bxIaEGt13qsaP3Ah6Aewzk7fJNG3BCvpTN1Tnv4sW6n8RDiFhLEOOsuAUNXHNaW8hiXMflzbzmzsdBDO/Tf/4Md046qx8OR03Weq3zE/Ix2P7Ywobw+Mo+47jE28bBFBNph4uYVIi9gGgXTo4pfEZIeekGnH6BD0ZHWU6B1Lg5btxZ5IM2Eheg7b/KGLgBjssmtXupNTgEDrEhClVt7sM9wcZ+BDtAZF5NNt9tXCS4vPXc5LIufliULtd87SW67ie2GVBp5kjq06g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0V9kkKUjhCKcpzFe8TU0WB2Xxe15HUFTK8zjjpq+SRE=;
 b=HR3TS8jGe1v9SPadgiqJXbjKmQMP5SDEbqJGbX/VV/CqzHWJbhZ7lIvK/0WpgwJ1HikM2cnbHlsrS5jieYPg1/CjrikFq27CO+/raH8KT3JBHOsYipkArqxfBwVShl4QolIOMcgsPUE1DgF4ZymYY5nb0lmeRCRxMFV5mOyFWEVB49SYXx29RVKBVWouceD40ycOf+IWyCx/zUxVru/5a1oDNVmuH7muwgWdTr7gpsK7p9a171+PJTCg3g6PSOR2HufXJbYY74AdCjK37rGQYNSn3R6ESuXK5537E69mwRi4Re5Op4Zt2DkshdKXVnWOijHKv5Zsz7Am0nSJ+PaenQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0V9kkKUjhCKcpzFe8TU0WB2Xxe15HUFTK8zjjpq+SRE=;
 b=ccyv/TJyCPF8DXD2dYtG0Rt0DtMQ5GOrEHQ3ltiu3cW7i35p1QFbitYxRrKhs2iKLTqMJwMHljf2u/vkBu/hiqexn5MR1FkiD+wDpEHqeJmNTa/7QvtSy2Ct67n1vxQoNxqwfGo+L10lZRkEJYosfiJA2K0HDhIkYT1i0WmCXy0=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB4P189MB2239.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Sat, 15 Apr
 2023 19:08:35 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6298.030; Sat, 15 Apr 2023
 19:08:35 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
CC: Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 03/40] igb: Fix Rx packet type encoding
Thread-Topic: [PATCH 03/40] igb: Fix Rx packet type encoding
Thread-Index: AQHZbsWX3KB6jGsnFEaonCzZD/iMG68sSQuA
Date: Sat, 15 Apr 2023 19:08:35 +0000
Message-ID: <DBBP189MB14336A661762471F4436AECA959E9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-4-akihiko.odaki@daynix.com>
In-Reply-To: <20230414113737.62803-4-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DB4P189MB2239:EE_
x-ms-office365-filtering-correlation-id: 52a64b48-0789-4c91-5b88-08db3de4d024
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DkyNemMhbXeubPxwK1HncyXODnxqcmvLoDvdnmwOKs7irPJEcDwOuLL7EIrfUdnLYSMbaj+pfAvxmd4uxjyq5ub2fqHQdnHlks8e8Zmj35wfqpDBXItfs7vQPDuM6IVTIB3mrUTp8F3H5am4kqp1oAAIwSj7swVrBgzKM/AHLZTrUKb/KBosEquhfTNbiwTCWwlbnlsY66Tg+aw5FyPZYU3G/NXYKh4yiA/p2L7sBu5+1lpTdq3ZiXA3Juo2WQyfEVxmssEzbON2uQ4lR1dej/WEIQUZrFuGx0gyQM3TLRn1DsTsJtTe+SNRRyYLWVGTo80pQvSpkB6pZJV8NVHHqQRtQut93bohm6+WLlUjt21pG6Rcm8nL79ucRf4KlZ1850HLlJsCEVu3QsFWDjhMZUIFQE0lnzV2tU1jgIfQG2mZ8LYplsfKjr+3hhP7O3MPVSsWEUd7nQOfb0s1KrQdcCbpabKVkQmF9bJ3/LmWwl22fiTu9NHFhB5oM+0xqWgu0sgpKD3e0oVJGpZcuigciKz0KO/PNjJgl2Qe8yq0SDVnAqNukS73BtkLl8uiLxM/wmk/6W7o65/OZq+WpfKVXD59C1OfnXOxp5QJXxPZlLZRxryQXpQAieMqVSi4lZTi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(39830400003)(376002)(366004)(136003)(346002)(396003)(451199021)(55016003)(71200400001)(7696005)(38070700005)(2906002)(33656002)(26005)(6506007)(9686003)(86362001)(122000001)(54906003)(8676002)(6916009)(4326008)(41300700001)(66446008)(316002)(64756008)(76116006)(66946007)(66556008)(66476007)(38100700002)(5660300002)(44832011)(7416002)(478600001)(8936002)(52536014)(186003)(66574015)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGNkdy9uUElyMi9LQmo4eVNSU0lNYU5aMnZQcHVITGFTY2xHOS9XSmJ1THRx?=
 =?utf-8?B?VWczZGF4TUNVUUlITUpoNnN0YW51VFRiVTg3Z3NJWU84c2U4UkwySzNVY0Yx?=
 =?utf-8?B?Q3lrZURJZTJSUXhBc2xaTWZiWUtCaXFYRm0rQ1Z6TWJMVEwzYzNsVDB0a3JM?=
 =?utf-8?B?WWFoTjZKYzJUYTExNmtZVnRVLzVlYnVaNGc3NFhxdXNscGd6RkF4TFZHRmxJ?=
 =?utf-8?B?eGdNcEJEQWp2MU1LQWNUd0JITnVWa1RHNHFDRGZpZTJ2VFl5dGx3NVNhS2F4?=
 =?utf-8?B?S1RDNmYxOXQ4emZCZnVyVXZBcTFiYjM1ODF0b3ZkSUk2T3IzUklyRTM5OG9P?=
 =?utf-8?B?S1kyZkIvWjgwRm9xT2FGUWx3OG5xU21ucVYxU0FubTFXY0hRWXZyY1hlN1I1?=
 =?utf-8?B?SGo0V3lQY2VNNDJKdjNoaXN3dTlpd3BKWFd6cFBUbVAyZ0lNWG8xOUVVN1Js?=
 =?utf-8?B?Vk8rU2xjM0tKN3MrWmlOdWk5UmM3T01LVXhKalpyTUowei9qZGlySXRPUmZx?=
 =?utf-8?B?V01LUjBENnZmS0FybGxTeDhsZGdGcTNaRFU0RHlVWlhqRUd0dUtXNHJJdlIv?=
 =?utf-8?B?VGt1dXhmb3FnZlo1RWxWblpiMHhUMVppczhhTmI4bk8vRlJNNWpNY2wzVGpy?=
 =?utf-8?B?RjRyYkpZUDNXQWpLbS9BSzZKaDdiVUsrc1BQSHQxTUtaT3hzNjc1MlgvWm1L?=
 =?utf-8?B?MmNlbms5eHF5bnFCZjZSL2FVMDZCU0gyK2I3T3lKQzgyT0pPVVcyV0ZuSklR?=
 =?utf-8?B?cEcyTzRESEd5OS9jYy9yY1F6YXNheVlVRWdMQzQ1blJXbUdNQmQzN0FsNTB5?=
 =?utf-8?B?T0dzb01hNlZBWW9weUI5VmpFaURKNUsxV2J6YU00Q2s4VjNBRXA5Y3J6SThs?=
 =?utf-8?B?V3pTRjNYMTBBTVZud29GbHhBbVlqRXVNbzViRzFkUUJpVFRhQzdsUGNxRlZ3?=
 =?utf-8?B?NFY5TWlUNFFGdmNTWVVvTlQ2dmV4YUQ4MmgwTzhRNHk5OHFRc2lqdDc4OVgx?=
 =?utf-8?B?YjdXV3JPZFJzbDJQd1JYV3FFUGVaQXgxcmZIY01LM1ZLUFBLTlEySGQyQlpp?=
 =?utf-8?B?ejZUOEp4WTV6MEtlSmN5aDVaUS92M29tNEYyT25CNVZsS3pHc1hidDJWYk1Q?=
 =?utf-8?B?TDA4R2Qxek1Sd1dVbS9heEc0RVZxbHJoejg1TmR4UDBZMTVXWFBreTBlS0Zo?=
 =?utf-8?B?VGxYdzFvb2dXbE9qajBEQ3I3R0twT2FoOENqMDVwZmg4S3ZoelRzbVZHUWho?=
 =?utf-8?B?YUUzT3cwbUU2RjdMMDFQVnloWGwrNGptejhOVHJaMUc3ci9BWXVycFlUaFoz?=
 =?utf-8?B?aEhSL253Y1FmY1BTTUF1dnJuT1RjVlM2eUpYVG50UWZmdDdKWTFWM09tcVN6?=
 =?utf-8?B?Q1lGSFFUV1JYSlMwRDhyUXlzaFdzaDR1clFWK1hqSnZZbndHbzEwb1ZIK2J4?=
 =?utf-8?B?aHI4S256cXFZMEV3TjF4YmxaMTZ5Y3hGSDFaRkFPK0cyZWtLekhyRkxTWjg0?=
 =?utf-8?B?WUhZME9OcExBd0FpTzhZcFZ0UWFURDQ5NVh6VVdpUkwrbVgxN0NicGlUQXo3?=
 =?utf-8?B?OE5zbnFtNlN6UmtDRklNVTkzbURCWVJneCt1ekliTXRuM0xFZEw0TEJFV25j?=
 =?utf-8?B?OElFMmQ2R0Z2OXlGbEJoQ2ZORmxHWWZiN3JubHRPYmNnQ01FblNSRUQ2M2JY?=
 =?utf-8?B?OVJJOVNTTEpEaS9pcWF5bFh5anoyRDByQi96YWEvMGt0UmU0d1ViUE9JRjZK?=
 =?utf-8?B?ZmgvSVI0RjNMTjk1akxaek51L2dFc3YyVzJSU01TejlOZXlidzFiMC9XNVJM?=
 =?utf-8?B?Tm5YR0U3K2RmQXYvbElsZWVNQ0tReWYzcTFhQnNxbjhNaU5mL0VsNjN1eDdI?=
 =?utf-8?B?R3NDSU91cVBvVkU1dGpUdzF1Ym9kYkQ2MUlUcGE1UHBTVnZwRldzblgwMWhv?=
 =?utf-8?B?c0FhMkZobk1qZkowRnVPMkZsNXV5WGUyTTRhRlE0NjRZRjZCUHVIVUNWd2pN?=
 =?utf-8?B?OEpqcmxndzJBQTg0QzVIeTB3WXJqaTFEY1F6MDBnb2o2WWZxaEt6MmJjbnJ6?=
 =?utf-8?B?ckIvL2RaV2crNFhDUFN3eVRLSDBiMVRXbkhhUVB5bnQ4bEYxTVpKQ0h6QmpQ?=
 =?utf-8?B?RUF4TXYwMGRmTlZuRlR4Mk9ZZ21pVlZOTG5lcEJZOVBrWnlmZmNja2svLzRX?=
 =?utf-8?B?SWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a64b48-0789-4c91-5b88-08db3de4d024
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2023 19:08:35.6440 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jIYBJkf+MWLfQ+USNcflkfeGlLrMcfwK7yQ+9c8/cTkGggfunEgYmSDkF8of46oyejkZHxGz8LiGRDlqjnkvCSt2RNdXHBFH4hBb7FWTvS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2239
Received-SPF: pass client-ip=2a01:111:f400:fe12::727;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR02-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBa2loaWtvIE9kYWtpIDxha2lo
aWtvLm9kYWtpQGRheW5peC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgMTQgQXByaWwgMjAyMyAxMzoz
Nw0KPiBDYzogU3JpcmFtIFlhZ25hcmFtYW4gPHNyaXJhbS55YWduYXJhbWFuQGVzdC50ZWNoPjsg
SmFzb24gV2FuZw0KPiA8amFzb3dhbmdAcmVkaGF0LmNvbT47IERtaXRyeSBGbGV5dG1hbiA8ZG1p
dHJ5LmZsZXl0bWFuQGdtYWlsLmNvbT47DQo+IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhh
dC5jb20+OyBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Ow0KPiBQaGlsaXBw
ZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+OyBUaG9tYXMgSHV0aA0KPiA8dGh1
dGhAcmVkaGF0LmNvbT47IFdhaW5lciBkb3MgU2FudG9zIE1vc2NoZXR0YQ0KPiA8d2FpbmVyc21A
cmVkaGF0LmNvbT47IEJlcmFsZG8gTGVhbCA8YmxlYWxAcmVkaGF0LmNvbT47IENsZWJlciBSb3Nh
DQo+IDxjcm9zYUByZWRoYXQuY29tPjsgTGF1cmVudCBWaXZpZXIgPGx2aXZpZXJAcmVkaGF0LmNv
bT47IFBhb2xvIEJvbnppbmkNCj4gPHBib256aW5pQHJlZGhhdC5jb20+OyBxZW11LWRldmVsQG5v
bmdudS5vcmc7IEFraWhpa28gT2Rha2kNCj4gPGFraWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4g
U3ViamVjdDogW1BBVENIIDAzLzQwXSBpZ2I6IEZpeCBSeCBwYWNrZXQgdHlwZSBlbmNvZGluZw0K
PiANCj4gaWdiJ3MgYWR2YW5jZWQgZGVzY3JpcHRvciB1c2VzIGEgcGFja2V0IHR5cGUgZW5jb2Rp
bmcgZGlmZmVyZW50IGZyb20gb25lIHVzZWQNCj4gaW4gZTEwMDBlJ3MgZXh0ZW5kZWQgZGVzY3Jp
cHRvci4gRml4IHRoZSBsb2dpYyB0byBlbmNvZGUgUnggcGFja2V0IHR5cGUNCj4gYWNjb3JkaW5n
bHkuDQo+IA0KPiBGaXhlczogM2E5NzdkZWViZSAoIkludHJkb2N1ZSBpZ2IgZGV2aWNlIGVtdWxh
dGlvbiIpDQo+IFNpZ25lZC1vZmYtYnk6IEFraWhpa28gT2Rha2kgPGFraWhpa28ub2Rha2lAZGF5
bml4LmNvbT4NCj4gLS0tDQo+ICBody9uZXQvaWdiX2NvcmUuYyB8IDM4ICsrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9u
cygrKSwgMTkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaHcvbmV0L2lnYl9jb3Jl
LmMgYi9ody9uZXQvaWdiX2NvcmUuYyBpbmRleA0KPiA0NjRhNDFkMGFhLi41NWRlMjEyNDQ3IDEw
MDY0NA0KPiAtLS0gYS9ody9uZXQvaWdiX2NvcmUuYw0KPiArKysgYi9ody9uZXQvaWdiX2NvcmUu
Yw0KPiBAQCAtMTIyNyw3ICsxMjI3LDYgQEAgaWdiX2J1aWxkX3J4X21ldGFkYXRhKElHQkNvcmUg
KmNvcmUsDQo+ICAgICAgc3RydWN0IHZpcnRpb19uZXRfaGRyICp2aGRyOw0KPiAgICAgIGJvb2wg
aGFzaXA0LCBoYXNpcDY7DQo+ICAgICAgRXRoTDRIZHJQcm90byBsNGhkcl9wcm90bzsNCj4gLSAg
ICB1aW50MzJfdCBwa3RfdHlwZTsNCj4gDQo+ICAgICAgKnN0YXR1c19mbGFncyA9IEUxMDAwX1JY
RF9TVEFUX0REOw0KPiANCj4gQEAgLTEyNjYsMjggKzEyNjUsMjkgQEAgaWdiX2J1aWxkX3J4X21l
dGFkYXRhKElHQkNvcmUgKmNvcmUsDQo+ICAgICAgICAgIHRyYWNlX2UxMDAwZV9yeF9tZXRhZGF0
YV9hY2soKTsNCj4gICAgICB9DQo+IA0KPiAtICAgIGlmIChoYXNpcDYgJiYgKGNvcmUtPm1hY1tS
RkNUTF0gJiBFMTAwMF9SRkNUTF9JUFY2X0RJUykpIHsNCj4gLSAgICAgICAgdHJhY2VfZTEwMDBl
X3J4X21ldGFkYXRhX2lwdjZfZmlsdGVyaW5nX2Rpc2FibGVkKCk7DQo+IC0gICAgICAgIHBrdF90
eXBlID0gRTEwMDBfUlhEX1BLVF9NQUM7DQo+IC0gICAgfSBlbHNlIGlmIChsNGhkcl9wcm90byA9
PSBFVEhfTDRfSERSX1BST1RPX1RDUCB8fA0KPiAtICAgICAgICAgICAgICAgbDRoZHJfcHJvdG8g
PT0gRVRIX0w0X0hEUl9QUk9UT19VRFApIHsNCj4gLSAgICAgICAgcGt0X3R5cGUgPSBoYXNpcDQg
PyBFMTAwMF9SWERfUEtUX0lQNF9YRFAgOg0KPiBFMTAwMF9SWERfUEtUX0lQNl9YRFA7DQo+IC0g
ICAgfSBlbHNlIGlmIChoYXNpcDQgfHwgaGFzaXA2KSB7DQo+IC0gICAgICAgIHBrdF90eXBlID0g
aGFzaXA0ID8gRTEwMDBfUlhEX1BLVF9JUDQgOiBFMTAwMF9SWERfUEtUX0lQNjsNCj4gLSAgICB9
IGVsc2Ugew0KPiAtICAgICAgICBwa3RfdHlwZSA9IEUxMDAwX1JYRF9QS1RfTUFDOw0KPiAtICAg
IH0NCj4gKyAgICBpZiAocGt0X2luZm8pIHsNCj4gKyAgICAgICAgKnBrdF9pbmZvID0gcnNzX2lu
Zm8tPmVuYWJsZWQgPyByc3NfaW5mby0+dHlwZSA6IDA7DQo+IA0KPiAtICAgIHRyYWNlX2UxMDAw
ZV9yeF9tZXRhZGF0YV9wa3RfdHlwZShwa3RfdHlwZSk7DQo+ICsgICAgICAgIGlmIChoYXNpcDQp
IHsNCj4gKyAgICAgICAgICAgICpwa3RfaW5mbyB8PSBCSVQoNCk7DQoNCkRQREsgc2VlbXMgdG8g
Y2FyZSBhYm91dCB0aGUgcGFja2V0IHR5cGUuIPCfmIoNCldvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8g
aW50cm9kdWNlIGEgbmV3IHNldCBvZiBtYWNyb3Mgc2ltaWxhciB0byBFMTAwMF9SWERfUEtUKiBm
b3IgaWdiIGluc3RlYWQgb2YgdGhlc2UgbWFnaWMgbnVtYmVycz8NCkluIGFueSBjYXNlLCANClJl
dmlld2VkLWJ5OiBTcmlyYW0gWWFnbmFyYW1hbiA8c3JpcmFtLnlhZ25hcmFtYW5AZXN0LnRlY2g+
DQoNCj4gKyAgICAgICAgfQ0KPiANCj4gLSAgICBpZiAocGt0X2luZm8pIHsNCj4gLSAgICAgICAg
aWYgKHJzc19pbmZvLT5lbmFibGVkKSB7DQo+IC0gICAgICAgICAgICAqcGt0X2luZm8gPSByc3Nf
aW5mby0+dHlwZTsNCj4gKyAgICAgICAgaWYgKGhhc2lwNikgew0KPiArICAgICAgICAgICAgKnBr
dF9pbmZvIHw9IEJJVCg2KTsNCj4gICAgICAgICAgfQ0KPiANCj4gLSAgICAgICAgKnBrdF9pbmZv
IHw9IChwa3RfdHlwZSA8PCA0KTsNCj4gLSAgICB9IGVsc2Ugew0KPiAtICAgICAgICAqc3RhdHVz
X2ZsYWdzIHw9IEUxMDAwX1JYRF9QS1RfVFlQRShwa3RfdHlwZSk7DQo+ICsgICAgICAgIHN3aXRj
aCAobDRoZHJfcHJvdG8pIHsNCj4gKyAgICAgICAgY2FzZSBFVEhfTDRfSERSX1BST1RPX1RDUDoN
Cj4gKyAgICAgICAgICAgICpwa3RfaW5mbyB8PSBCSVQoOCk7DQo+ICsgICAgICAgICAgICBicmVh
azsNCj4gKw0KPiArICAgICAgICBjYXNlIEVUSF9MNF9IRFJfUFJPVE9fVURQOg0KPiArICAgICAg
ICAgICAgKnBrdF9pbmZvIHw9IEJJVCg5KTsNCj4gKyAgICAgICAgICAgIGJyZWFrOw0KPiArDQo+
ICsgICAgICAgIGRlZmF1bHQ6DQo+ICsgICAgICAgICAgICBicmVhazsNCj4gKyAgICAgICAgfQ0K
PiAgICAgIH0NCj4gDQo+ICAgICAgaWYgKGhkcl9pbmZvKSB7DQo+IC0tDQo+IDIuNDAuMA0KDQo=

