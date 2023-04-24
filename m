Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CEB6EC917
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:35:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsb7-0000aE-Lh; Mon, 24 Apr 2023 05:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pqsb0-0000SX-Nt
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:34:56 -0400
Received: from mail-ve1eur01on2135.outbound.protection.outlook.com
 ([40.107.14.135] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pqsay-0007uE-Gz
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:34:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjBkUGKwK6BIoyZcpdcv0og3FbCwe2G9wB9AuI+GNqE8mgtMcKfBQIKLeRgi99D07l6+2VWmjGe+3YCq4MShJOGcXkkOyue3y7TKDWvyfpEF8uVcdLwrgLO9E8W0ez8co7XWSNktfgHvOhvAgtLDlWncAntJ7kUm+gNGE5M6k5dDoFnz57IlwMge1VgKdwIF3qhohuU7cpBYAQPRx684iqQv6DFLL265Aoo/MoUHDd/ZXeXCB7BCGnx4KikOWg5t7tU3zoKC27ckKR2XNo1meWilQPlzk0IvK5F6Iyfa3jjO4GtuXEUNUUbYozIlUqciDLB6lNLwMtx0snDrb2n3rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQwo2waYInkbPaK504TmE950bXeKKRmttka4pbIrc5U=;
 b=kjgiQytkxJq9JlqlTVMDCvgtA2FkLEY6GelpocIHdOQbnF60TCO11TPgALjX6mc0D1s7iDzOLmzMrm4D5a0ToLkpKKy2WvY0uSfUfNwuS/eCiY6x6OJIMT51JGtFXTaGGGj+wL5d2eucfJ4o0I90U3nm8G7tGwMeJR4UDOLTjoWM1CpVCaqZR6iSpDidjemK8K7V33JgvexX/D4ia5KIxQn3TyB+MraEz4m/PUKQjJEcLzLghfy2C2zUpFlnh7YC5ZgAURPZjIggvgLBvpy8DH3+pyTYdJzvi+Av0P3oZWkUxITTFCjONe5u1lWSa3EaKCW7fTyw7Ob4bQkZuV17UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQwo2waYInkbPaK504TmE950bXeKKRmttka4pbIrc5U=;
 b=mc76/NLd+S4Xecs6FSHtevZ2F4FYNXEQgSSIK92XKfnEQ9PI+yn9Xeu1HjSwwGKE+TBgPedJ1B/tMhIKMQHnzBI59bDRbtvzTtTvwNq/zjezoDEGG2EgwyUQMe3rF7cvl2dLVo1Qf8FBnbUF1Fy/uuvLrNzTNFZJZ/vQhXBvdmI=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB8P189MB0793.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:12d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:29:47 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:29:47 +0000
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
Subject: RE: [PATCH v3 06/47] igb: Clear IMS bits when committing ICR access
Thread-Topic: [PATCH v3 06/47] igb: Clear IMS bits when committing ICR access
Thread-Index: AQHZdZq/2Z1oGREstkmQglJixNV+h686LrGQ
Date: Mon, 24 Apr 2023 09:29:46 +0000
Message-ID: <DBBP189MB1433159BD5A688E92C00BA8595679@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
 <20230423041833.5302-7-akihiko.odaki@daynix.com>
In-Reply-To: <20230423041833.5302-7-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DB8P189MB0793:EE_
x-ms-office365-filtering-correlation-id: e8ded7a4-7ecc-4c69-40ab-08db44a671f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4tokmH9npWoCPenDvaEy9pm0bYb0X3sZ1Ezn8fpSD3RYyeAPSzn33EV1GXRMWKEBzsQBCfuEyH8t30Of21HkCK+q42bE8IN+SlAT0U/KsQ3lJS7058SpSMLgwewrFDesWoCQS/Tr9CpF8esYnBb9O5o9kXguPhUp/hQqa10LW62Xwyx3XFEtEAqDyjdRFbY58ZccHqBylOHklrgkqXHTo9YRwhgYX9pQiOSCslGFo3crlGpAJord3P+Z41CNmtkKnYLbEhewZ7tQdNx5Lm1xwUL5bMdv2BXYOGDxKbPR35W7aHpDR+or/joke1PuB9VsCdALOklryqCluy+0Xoo7+liE+bJ2kOm16QUJe1z/bbo48RMRy8ixUDGIQpFbrUOLFTsCY12pZZWTbqukSeQ2pAFTdbBTlqUFwnJrXdP5iqjG856/H7+KkN5qyDP8XHBFOXvtMOyOq8Qzh4sD2VBewaT1/xIFpDXGhttKpHASqwO/BAxbF3x51rm/fT+WlfW0gIdWfseGpKEfNYDsSEOzUpsBJMV9Kv6U1VUih+xbB8agbENRpv1HKUcUc6SnLtqpL6ZwkoAYM+r9b9YcfdOsI840c+lGkBV0LdsUXjCWCy0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(376002)(346002)(39830400003)(396003)(451199021)(2906002)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(6916009)(316002)(4326008)(52536014)(44832011)(7416002)(8676002)(8936002)(5660300002)(38070700005)(41300700001)(33656002)(86362001)(55016003)(9686003)(26005)(186003)(122000001)(71200400001)(38100700002)(478600001)(966005)(7696005)(66574015)(83380400001)(6506007)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3lTMEZtNnMvcjVhMkRKUnZJcmxIb2tuaENwRWJ3Q09pUnBhYlFMbXFzZEll?=
 =?utf-8?B?cTNMNVA0ZTFVUGRBemhuSUJXWlQ5dWdVeDd1d25tUmd1UWNnMjM2TVl6Z3R3?=
 =?utf-8?B?RVRJb0xqa3RMaUZhRHdrZG5MM29iaGJkOSsvZ1kzcG8vdG0yRjg3Q21UTUZT?=
 =?utf-8?B?bWFUdjA1azVkUGtqdmtBbWZ6eDhJU1BUbmhJWFVFUjhwSjkzSmlhL3labDhW?=
 =?utf-8?B?WXVPMDFOYUVDemlYcE9yWFYxZUMvWnEzNnYzTDJnQlM5SWxNd3dwUXh5K242?=
 =?utf-8?B?Wk0xY1F0bmY4cDg2VHk5RTZIY0tNdnFHYklwVlBuenN1QW5RWmtxQXRRMGZH?=
 =?utf-8?B?aTVHTmR0dlkyUjh4ckxSb1FsQjRlTWc1MnEvTmM1c3RPM1NWUVNraFpUZnFU?=
 =?utf-8?B?NUNMckJ2MGJUZVpVRmx5eGdMQlJSbVAxaGszdEpGcW96R0lvcXlkdkFZNHU0?=
 =?utf-8?B?S2krZXNSUHRVN0pPL3ZneTNWTGJOQXlRbVNzWjgydDNBRHBqTzFiTFJqY09Q?=
 =?utf-8?B?am1mbWM2VzdjTC9CN3lKaEV5KzJQNnh1MkRmNU1OQkI4bWV2WFlIMFdzWCtj?=
 =?utf-8?B?M1gra2hLNTB2YWcwVStNa3VqOGovNU9KWk96TW5mSmlNUzF4NnBnbUx5Q2Zo?=
 =?utf-8?B?VXhiNzZqSnVuMnRwVDlkVWErL0VuS2tuT0tqUDVIeWZnMFh5RHRrUUd3TmVq?=
 =?utf-8?B?ZERUazgxajhHMjJwd1VKN0dFcUdJd3lsSCtsRzAxdU9Wd052Vk54NGJuc2xS?=
 =?utf-8?B?L0xGdGc4SEdXc2RaRkc1aUtMcmlEVWYyMFBhVmpGclZ2SDRPK0pkSWp5b3o1?=
 =?utf-8?B?NGM2MU05SWVQZW9SeHJxbU9PUXE2aUN6ZWNVTTB5cXJQbWVkRXpEaUNWcmFa?=
 =?utf-8?B?blAzMk4vT1RwMDk3TnBKd1ZTWjlPc1dOU3Y1WlErQXlqZTRta2pQbDJ4L21Q?=
 =?utf-8?B?aUxFUnhab0FDSzRYS0twT0g0QWRQT2RCd3d2ZElDNlNaeGtyTTYxeHc1ZnpQ?=
 =?utf-8?B?Um1iNUFpamdSNFBOanZwTFpqb3BKM0tBcUpPV04xa3BJeHY1dXR0WDBSSFpp?=
 =?utf-8?B?ZjNHZjNvWG9taHFGVlBLbDRrZmZtK1dsazJ0TDhoc1JsSEs2M25mSzlZWmJK?=
 =?utf-8?B?bFJURjI5RmcyTzRTVTVDUEtDZjFYUUI2TFhvNW52Y2NxNHZXcDNCMnFqaHBk?=
 =?utf-8?B?Qjg3OVB3a3VFeHpmWmpOa3B2NncwSUhDbHJ6ZnpOTUFlTVpQUHBaV2xOQkZa?=
 =?utf-8?B?bS9IQ28wOXVzVng3d1VTOC94WnlTZXlGWUw2VzQrU0RubEVoaVhqei9wQmpR?=
 =?utf-8?B?SXRmVG5IL0ZzSm5GNjBVbEtDd3JnRnNVU0NmamFpbVVVVHNXWFU0ZjhhUWl2?=
 =?utf-8?B?S1NIWGVkcFNFNy82b1hTU0NzZ3ZxbkJMV1V0NTVHbkZLUTRld2dCSk9BcGQx?=
 =?utf-8?B?Z0p6L3F5TTRiNjJhWEd5YmdLZzhnb0g3K0tFU0QzRVhYS1ptMXgrbDlwdWlJ?=
 =?utf-8?B?M09sSEJGT0JNMVFjcE9DdEtLc09RaUtWaDVVZzhmYkpzNUhydnExb1VGeGlZ?=
 =?utf-8?B?TjBUdllScnNNMzEyVTlwR1J5K3pJL01KN1o1NTdpbjE0bjhXY2pVejZ4QTkv?=
 =?utf-8?B?R3pvMCttaU9DandTN2l1K2txQzBjNmt5VkRQR2hFa0p1UDZFcmFsZGxPV2sv?=
 =?utf-8?B?S2RJMzdVUnRxUjRFT0prRGs5bnBNaEQ4WXd0dERtYmUwZFpGZytybzlqUHVF?=
 =?utf-8?B?Y2o5RndWeERxcE1peitIL2x0d0plVW5VeWI3Qkt6WjgvVDJRWittTXJRdFEx?=
 =?utf-8?B?Q1kvek8zNDQ2TWZBNzRuS0YzcXJLdWlYOTdBdXJCSmt5aWxXaXdZYldoWHZN?=
 =?utf-8?B?L2twcFBGWXN0eGJMZUl5RGt1aC82Y1ZrSHZaWUJ1QnNIM2VvS2ZjcGpwVlhO?=
 =?utf-8?B?WnBmbmdmd096WFRUTnY4ZS8zOTNYL0NBRDNTbkxMUnpjdGx3UlVpeW4yTVg2?=
 =?utf-8?B?TklkaDdLbVd1UG54dmR2Zk1iUTZ2YVdFS0ZXOU56OUhJRVNRRzJ5dkVWVnQ0?=
 =?utf-8?B?UUFLTmswMXVGRG8vU0FUM1VwblNqMkVEK0JRaGc0M1F5dFRXMTUxaTZUNHJq?=
 =?utf-8?Q?ci7EazdK4/z9ZGMnq5PtDK+7I?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ded7a4-7ecc-4c69-40ab-08db44a671f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 09:29:46.9852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4gSCAviN8M2NJ7+eBlpv84QFdZqTaPYRgXgnbRwmIYB5ONMdT/rcEw6Je0/7jn31dt7xGRj6m7ha64aQzL/UUj4hM0Ug4LLJiH2JY7I9JQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0793
Received-SPF: pass client-ip=40.107.14.135;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBa2loaWtvIE9kYWtpIDxha2lo
aWtvLm9kYWtpQGRheW5peC5jb20+DQo+IFNlbnQ6IFN1bmRheSwgMjMgQXByaWwgMjAyMyAwNjox
OA0KPiBDYzogU3JpcmFtIFlhZ25hcmFtYW4gPHNyaXJhbS55YWduYXJhbWFuQGVzdC50ZWNoPjsg
SmFzb24gV2FuZw0KPiA8amFzb3dhbmdAcmVkaGF0LmNvbT47IERtaXRyeSBGbGV5dG1hbiA8ZG1p
dHJ5LmZsZXl0bWFuQGdtYWlsLmNvbT47DQo+IE1pY2hhZWwgUyAuIFRzaXJraW4gPG1zdEByZWRo
YXQuY29tPjsgQWxleCBCZW5uw6llDQo+IDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPjsgUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPjsNCj4gVGhvbWFzIEh1dGggPHRo
dXRoQHJlZGhhdC5jb20+OyBXYWluZXIgZG9zIFNhbnRvcyBNb3NjaGV0dGENCj4gPHdhaW5lcnNt
QHJlZGhhdC5jb20+OyBCZXJhbGRvIExlYWwgPGJsZWFsQHJlZGhhdC5jb20+OyBDbGViZXIgUm9z
YQ0KPiA8Y3Jvc2FAcmVkaGF0LmNvbT47IExhdXJlbnQgVml2aWVyIDxsdml2aWVyQHJlZGhhdC5j
b20+OyBQYW9sbyBCb256aW5pDQo+IDxwYm9uemluaUByZWRoYXQuY29tPjsgcWVtdS1kZXZlbEBu
b25nbnUub3JnOyBUb21hc3ogRHppZWNpb2wNCj4gPHQuZHppZWNpb2xAcGFydG5lci5zYW1zdW5n
LmNvbT47IEFraWhpa28gT2Rha2kNCj4gPGFraWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4gU3Vi
amVjdDogW1BBVENIIHYzIDA2LzQ3XSBpZ2I6IENsZWFyIElNUyBiaXRzIHdoZW4gY29tbWl0dGlu
ZyBJQ1IgYWNjZXNzDQo+IA0KPiBUaGUgZGF0YXNoZWV0IHNheXMgY29udHJhZGljdGluZyBzdGF0
ZW1lbnRzIHJlZ2FyZGluZyBJQ1IgYWNjZXNzZXMgc28gaXQgaXMgbm90DQo+IHJlbGlhYmxlIHRv
IGRldGVybWluZSB0aGUgYmVoYXZpb3Igb2YgSUNSIGFjY2Vzc2VzLiBIb3dldmVyLCBlMTAwMGUg
ZG9lcw0KPiBjbGVhciBJTVMgYml0cyB3aGVuIHJlYWRpbmcgSUNSIGFjY2Vzc2VzIGFuZCBMaW51
eCBhbHNvIGV4cGVjdHMgSUNSIGFjY2Vzc2VzDQo+IHdpbGwgY2xlYXIgSU1TIGJpdHMgYWNjb3Jk
aW5nIHRvOg0KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzLw0KPiBuZXQvZXRoZXJuZXQvaW50ZWwv
aWdiL2lnYl9tYWluLmM/aD12Ni4yI244MDQ4DQo+IA0KPiBGaXhlczogM2E5NzdkZWViZSAoIklu
dHJkb2N1ZSBpZ2IgZGV2aWNlIGVtdWxhdGlvbiIpDQo+IFNpZ25lZC1vZmYtYnk6IEFraWhpa28g
T2Rha2kgPGFraWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4gLS0tDQo+ICBody9uZXQvaWdiX2Nv
cmUuYyB8IDggKysrKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaHcvbmV0L2lnYl9jb3JlLmMgYi9ody9u
ZXQvaWdiX2NvcmUuYyBpbmRleA0KPiA5NmExMThiNmMxLi5lYWNhNWJkMmI2IDEwMDY0NA0KPiAt
LS0gYS9ody9uZXQvaWdiX2NvcmUuYw0KPiArKysgYi9ody9uZXQvaWdiX2NvcmUuYw0KPiBAQCAt
MjQ1MiwxNiArMjQ1MiwxNiBAQCBpZ2Jfc2V0X2ltcyhJR0JDb3JlICpjb3JlLCBpbnQgaW5kZXgs
IHVpbnQzMl90DQo+IHZhbCkgIHN0YXRpYyB2b2lkIGlnYl9jb21taXRfaWNyKElHQkNvcmUgKmNv
cmUpICB7DQo+ICAgICAgLyoNCj4gLSAgICAgKiBJZiBHUElFLk5TSUNSID0gMCwgdGhlbiB0aGUg
Y29weSBvZiBJQU0gdG8gSU1TIHdpbGwgb2NjdXIgb25seSBpZiBhdA0KPiArICAgICAqIElmIEdQ
SUUuTlNJQ1IgPSAwLCB0aGVuIHRoZSBjbGVhciBvZiBJTVMgd2lsbCBvY2N1ciBvbmx5IGlmIGF0
DQo+ICAgICAgICogbGVhc3Qgb25lIGJpdCBpcyBzZXQgaW4gdGhlIElNUyBhbmQgdGhlcmUgaXMg
YSB0cnVlIGludGVycnVwdCBhcw0KPiAgICAgICAqIHJlZmxlY3RlZCBpbiBJQ1IuSU5UQS4NCj4g
ICAgICAgKi8NCj4gICAgICBpZiAoKGNvcmUtPm1hY1tHUElFXSAmIEUxMDAwX0dQSUVfTlNJQ1Ip
IHx8DQo+ICAgICAgICAgIChjb3JlLT5tYWNbSU1TXSAmJiAoY29yZS0+bWFjW0lDUl0gJiBFMTAw
MF9JQ1JfSU5UX0FTU0VSVEVEKSkpIHsNCj4gLSAgICAgICAgaWdiX3NldF9pbXMoY29yZSwgSU1T
LCBjb3JlLT5tYWNbSUFNXSk7DQo+IC0gICAgfSBlbHNlIHsNCj4gLSAgICAgICAgaWdiX3VwZGF0
ZV9pbnRlcnJ1cHRfc3RhdGUoY29yZSk7DQo+ICsgICAgICAgIGlnYl9jbGVhcl9pbXNfYml0cyhj
b3JlLCBjb3JlLT5tYWNbSUFNXSk7DQo+ICAgICAgfQ0KPiArDQo+ICsgICAgaWdiX3VwZGF0ZV9p
bnRlcnJ1cHRfc3RhdGUoY29yZSk7DQo+ICB9DQo+IA0KPiAgc3RhdGljIHZvaWQgaWdiX3NldF9p
Y3IoSUdCQ29yZSAqY29yZSwgaW50IGluZGV4LCB1aW50MzJfdCB2YWwpDQo+IC0tDQo+IDIuNDAu
MA0KDQpSZXZpZXdlZC1ieTogU3JpcmFtIFlhZ25hcmFtYW4gPHNyaXJhbS55YWduYXJhbWFuQGVz
dC50ZWNoPg0KDQpBbiBhZGRpdGlvbmFsIHF1ZXN0aW9uLCBzaG91bGQgSUNSIGJlIGNsZWFyZWQg
aWYgYW4gYWN0dWFsIGludGVycnVwdCB3YXMgYXNzZXJ0ZWQ/DQooQWNjb3JkaW5nIHRvIDcuMy4y
LjExIEdQSUU6IE5vbiBTZWxlY3RpdmUgSW50ZXJydXB0IGNsZWFyIG9uIHJlYWQ6IFdoZW4gc2V0
LCBldmVyeSByZWFkIG9mIElDUiBjbGVhcnMgaXQuIFdoZW4gdGhpcyBiaXQgaXMgY2xlYXJlZCwg
YW4gSUNSIHJlYWQgY2F1c2VzIGl0IHRvIGJlIGNsZWFyZWQgb25seSBpZiBhbiBhY3R1YWwgaW50
ZXJydXB0IHdhcyBhc3NlcnRlZCBvciBJTVMgPSAwYi4pDQpTb21ldGhpbmcgbGlrZSB0aGlzPw0K
DQpkaWZmIC0tZ2l0IGEvaHcvbmV0L2lnYl9jb3JlLmMgYi9ody9uZXQvaWdiX2NvcmUuYw0KaW5k
ZXggZWFjYTViZDJiNi4uYWFhZjgwZTRhMyAxMDA2NDQNCi0tLSBhL2h3L25ldC9pZ2JfY29yZS5j
DQorKysgYi9ody9uZXQvaWdiX2NvcmUuYw0KQEAgLTI1MjksNiArMjUyOSw5IEBAIGlnYl9tYWNf
aWNyX3JlYWQoSUdCQ29yZSAqY29yZSwgaW50IGluZGV4KQ0KICAgICB9IGVsc2UgaWYgKGNvcmUt
Pm1hY1tJTVNdID09IDApIHsNCiAgICAgICAgIHRyYWNlX2UxMDAwZV9pcnFfaWNyX2NsZWFyX3pl
cm9faW1zKCk7DQogICAgICAgICBjb3JlLT5tYWNbSUNSXSA9IDA7DQorICAgIH0gZWxzZSBpZiAo
Y29yZS0+bWFjW0lDUl0gJiBFMTAwMF9JQ1JfSU5UX0FTU0VSVEVEKSB7DQorICAgICAgICBlMTAw
MGVfaXJxX2ljcl9jbGVhcl9pYW1lKCk7DQorICAgICAgICBjb3JlLT5tYWNbSUNSXSA9IDA7DQog
ICAgIH0gZWxzZSBpZiAoIW1zaXhfZW5hYmxlZChjb3JlLT5vd25lcikpIHsNCiAgICAgICAgIHRy
YWNlX2UxMDAwZV9pcnFfaWNyX2NsZWFyX25vbm1zaXhfaWNyX3JlYWQoKTsNCiAgICAgICAgIGNv
cmUtPm1hY1tJQ1JdID0gMDsNCg==

