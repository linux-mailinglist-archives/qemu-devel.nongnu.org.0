Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE3C35F477
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 15:05:39 +0200 (CEST)
Received: from localhost ([::1]:56916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWfD8-0001ZU-KQ
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 09:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lWf7q-00081m-PE; Wed, 14 Apr 2021 09:00:10 -0400
Received: from mail-eopbgr800127.outbound.protection.outlook.com
 ([40.107.80.127]:6073 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lWf7o-0003MX-7R; Wed, 14 Apr 2021 09:00:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2YIYApnbmXh27Tlx8P9m2+6XBCy2s2hHlqBMjAbZh9Q8bWh3ptZzKSDstE1gOtPiLCBBwz1NNjOpbsreFspnEQyQZ6ZN//UW5qPY7VHPeT4JTJR1FKve6s7w946aACHHTutLAXD90lynUgtuS12jIqoSozoRyvAMuSmOkcG4Mj4tkc1wJ++LpYMu3OOFfj22eG8wNgfgCeVIqQ7b7I+JkTyTKvKhl7Gq8D8ClSSiReZA3kOJ7JO/Eqd8bSDooud5A5eyQK21vxGwoQWU4JNrOEgnxoYBT5Xy3Vz6HRgLK4S5LkdpohVHhEFOXqCJhUcPKB7PQ6OPPLr9So1TpitBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuB9HUto4TixPhcwPSbw143TqzAy6PyVuBMPTjAqqck=;
 b=Uqqt3SOmTON4ekAuDl0KnmnCzR56YSFZtSVqHZm2hxSgFK37zr8u0u2iJ1KtyXIXuyzsd0OaABiLO96NG1/eXy09I8Wxly+7f6E0TuRpUOYWmZkDjW7UDehM1FKF61q5VEX8FmSxEZqaK1ajhrYwXdQ/n1NhmKjTKXIXF2XNZ4ydU4HM+eaY50jyEfZ8IgExKywLjxUR/5a9hvfLkSLBW7hwKJaRCrtvoHkIOj1BTGEY7RW89T/s/vYjRhfCYh8b6PoWRuzi9eNmQjbWAa+w41Lyn78Y537F5EMxrbequ1mVn7sJLNqp7xdvheSR3w6swKDUdED3NufSFb6xGbk9Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuB9HUto4TixPhcwPSbw143TqzAy6PyVuBMPTjAqqck=;
 b=OAmFlnxIrLo5yoqysTOAAxAhV1792SB/Q8s5N665jgUJSXeHWFYGPDXGW8FAWJnrf2BqW9JucS2pwDjxafHDLPenppHTbExRA+Z+bfqZpDem9rH6EdCB5Y+2DU9OK9glPIBseOQMGi9KTO3wphM6mTa+ZyfSOeRursXob6Nu2pHBqe0E35spJfHXUWstk5EK7JTATnV/oOpMhGOPUtHWDC4EsRFs5jFROsP2TsyXBKXUjWnRrUswg6Jhn+QIyIJv9p83KdBhDhW1zMHe+iuwgLFAAYiEedvFunQeLCNndfFMYVU71HLBmM4viuB0wk8DVVIph1VfH+SCtwhVME5ZFw==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4082.lamprd80.prod.outlook.com (2603:10d6:102:31::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.20; Wed, 14 Apr
 2021 13:00:03 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d%2]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 13:00:03 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-ppc@nongnu.org"
 <qemu-ppc@nongnu.org>
Subject: RE: [PATCH 5/5] target/ppc: Implement paddi and replace addi insns
Thread-Topic: [PATCH 5/5] target/ppc: Implement paddi and replace addi insns
Thread-Index: AQHXMKnqbgq8u/Qjt0em8PupUUF6TKqzCuyAgADqlGA=
Date: Wed, 14 Apr 2021 13:00:02 +0000
Message-ID: <CP2PR80MB3668EB73292A9D659AA4117DDA4E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210413211129.457272-1-luis.pires@eldorado.org.br>
 <20210413211129.457272-6-luis.pires@eldorado.org.br>
 <866f5277-60e9-3934-2465-e93c6d5f74b0@amsat.org>
In-Reply-To: <866f5277-60e9-3934-2465-e93c6d5f74b0@amsat.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=eldorado.org.br;
x-originating-ip: [189.0.171.137]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9bdb08f-5bed-4f32-dfcb-08d8ff453807
x-ms-traffictypediagnostic: CP2PR80MB4082:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB4082CBCD9362E7B235DB003EDA4E9@CP2PR80MB4082.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MMYkQ3UKrT/crpb4HvoWKHIwrh8IaW7gy8tHHnM3lq5mz19H3JtG/GmZ9zTwMH1LU2qdntgAJdu7bDadNCVzpQcaocETTl2HOW3DiyHr32wdNaFBNcUAAK8Eh33sCa4aIMXrdA3hOo498OnSRQ++yh/ZDB4O8iGq4kEK+XxldO+Eh7GI113QSSlAHtJCMk61Q10GwVW/aFSjUtut7P4Cy+Tyf2AiXwu7+qJQnvuQXVoYBuycEomWS7MkL/0LJbDQGH92oi2TkJfbp4jhoqW0FTMMOez/Aq5nmvxo+rAv9IfOImmzfViIDjCFZov02jNG+rBml2nPXp6tnvdcp4i6mWp+ZdTdI2jXOoCQdVoRlQ8kKX88xAA1FlekY5AmwScLzx81ftsSDqQbIUpp2OtsNUf7tseZlC57zcBIATim0CiNR1zaHly5zGo4lHqPpn/6ICttLwXUnXGRamwlhodQ2lx02IdpXo1BBGtGif9QRo00v3z+lwDYm91IECysXYyDo77uk13uQmH3A8z11gH3bstxQxbdFvMfHp3C3H+9Y6OVOilMNLtD+tFx6ZizFV9JoYVb+TkLitHhbeaKEw/5v03KKHjNb1m3MmS4b9beXEQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(366004)(39840400004)(396003)(376002)(8936002)(55016002)(478600001)(316002)(52536014)(86362001)(66946007)(8676002)(71200400001)(122000001)(7696005)(66446008)(2906002)(66556008)(33656002)(76116006)(186003)(26005)(54906003)(110136005)(38100700002)(4326008)(9686003)(64756008)(6506007)(5660300002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dllWNFE4TzJiMTQ4eUc1TEdjNmszTnFkQ2NuSm9xZDBPQjIrVTZvSnd2MFZn?=
 =?utf-8?B?VC91aGt3ZG5DRVVHNVMwWmRvbENESldhZmVmMjc1ZmlRQzk2ZnZEUFY0cFow?=
 =?utf-8?B?ZG5VL2pCVUd4dmZ4UTVyY2NtYkhSUmNBMWNabGdPOUtFV2pYOWhUdmZjYlNm?=
 =?utf-8?B?ditBNTlZeDR4ZDdxTzJiWTRWaTN4QkZKZ0FEcmtFYjJvMUhNaE1RQWNFUi9G?=
 =?utf-8?B?MDhYUWt4Q2tGSmRZQkRLUzRvRnFOZXFaMVVMU3cvYlNQMkp0VnZtWUV1RHNw?=
 =?utf-8?B?SXZTd2p5NTFlbkpkbStuSTZ2YWpqMUhUQmxoU3VOOUprYk5GTUZHMTR3ditk?=
 =?utf-8?B?U3FjczdSd20zVHRIL1dXeFJlVDQ5MzZCdXpRdHFXUXlqOUFxNzhHNjgrMGdq?=
 =?utf-8?B?TjdjZGNmclIybnFBMW05Tkw1YUZEb1poOVBlUW0vYkNLYnhFdlFEcXhFUlp3?=
 =?utf-8?B?YUpNYnlRZWZiYTd6bUxoL3ZoQW9SNjkraEd0d0hZN2N3R0RTS3o5UHh2d0Na?=
 =?utf-8?B?eVJhU0pCd2ZvVUdEdEsxNmdkTkc4VUoxcGhFaTBqUDZ4dEVMTGt3QTVRbWNv?=
 =?utf-8?B?Nm5JZW14bFI5VHI5NXlKT1p4aUIrSmlsTWJObUZac3pMOHlrdHhvcm80OERM?=
 =?utf-8?B?eis1TkIxL2JyRWlld2xubGdweS9uUXdGZWVhVTVSYURCeWcxZHFHTUhNT083?=
 =?utf-8?B?UDMzVmQ2REJ2bC9zUGV5b1hjWjBFWmU3L0s2OHh0amUxZ0twczhmT3g2MUZt?=
 =?utf-8?B?ZXFJZ2pzVEJWd3g5UDkwMXkwKzNuUzZoa2ZrSXZuVjJ6QW1oSVBreU5DUXlU?=
 =?utf-8?B?dWNDV0dJekVuaklpWERrOUVITnVFOFE3TnVEK3Zyd1ZVWGpGVnl6d3VKTEd5?=
 =?utf-8?B?UmFhL0owRDNxMENhajVreHd0Qk4xeHNmUUJISVVKZU1Yank5dVc1QUhjNnlY?=
 =?utf-8?B?NVJQRUZoVVdSaUprSVhUNC9zVk5WeVUxUitFOTdycnN2NTBQbktlZlJlWi9R?=
 =?utf-8?B?OWM5M09mMlhIV3hRQmdDcjNsVUpqSmw1RlZPWDBhV2VYWDdiVlNOTFVZRXRs?=
 =?utf-8?B?TmxjbGV2NUtTUTY1YVFiU3YvSmduYnhiQ1FjaXY5dEo0WG82dkxmb1dtM2c5?=
 =?utf-8?B?N1JkazVENUtsdWtYZW1oSWJ1ZHN0dS93My95UlhwWHZCUjl3bHdHVEtUSTRu?=
 =?utf-8?B?RmZlYjlMaTRHaEx3Z1hDM0wzSXdlZWVxUFhvZDl6STg2U2N3QUFzTlNtR1JZ?=
 =?utf-8?B?YUZDUDdEeEw0YW04Um42ZzVQUDFvNStJUkMzZXhyRkU4eWFuTnNGcHcwZWpR?=
 =?utf-8?B?bU8zSmdFMWs4YUpRb1RTRkd4eDdtRE4wZnlBVU9aUUtEMDg0ei8rT2t4aExP?=
 =?utf-8?B?K3BmOUxoY2RaNWVOdjE0amthdThBV3pEekNDN09MRTcySFB3cHpCaFFTUzdT?=
 =?utf-8?B?Nm8yTkg3VjluSWw1dmFDb3NudWZTZnlIUk1sMVF5WFBZUHdtaC9TZEF2OEdn?=
 =?utf-8?B?aXNLZVFPbjJMMUNjVmh1RzVSeHpPelZZR1U3TzVFeTJKbitYbGlydGdsa0ND?=
 =?utf-8?B?M3doUVRnVkxzNS9ORlJlUnE5c29uOFlSNkJBVGp4U1lwdVphTG1RaTBqa2FP?=
 =?utf-8?B?dS9VR2J6TVg2SEhSRlZ5eTdkZUw4VXpuUHMrNVc0NnRqUTMzd1lVZ1ZxYlJn?=
 =?utf-8?B?M0U1bFp2TXFtSjNhL1l4Zm0xZDNDMjZIYVUrU1pqYWNvMXBOUVhyUXhSRG5B?=
 =?utf-8?Q?eEw8i/Em8MmI8Uf+B7E44Qp2BjhQRshAuM18cBv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9bdb08f-5bed-4f32-dfcb-08d8ff453807
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2021 13:00:02.9342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ED+5dPUgDBVzwdahvWYDKrsmzV62GHWh5ZwW04gnXRWNhxXH8B1pxoEzt/c4xanQ3H50ZGfzuovB9mcbAnlDdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4082
Received-SPF: pass client-ip=40.107.80.127;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgUGhpbCwNCg0KPiA+ICsNCj4gPiArJXBfRDhfU0kgICAgICAgIDMyOnMxOCAwOjE2DQo+ID4g
Kw0KPiA+ICsjIEZpeGVkLVBvaW50IEZhY2lsaXR5IEluc3RydWN0aW9ucw0KPiA+ICsmYWRkaSAg
IHIgcnQgcmEgc2kNCj4gPiArDQo+ID4gK3BhZGRpICAgMDAwMDAxIDEwIDAgLS0gcjoxIC0tIC4u
Li4uLi4uLi4uLi4uLi4uLiAwMDExMTAgcnQ6NSByYTo1IC4uLi4uLi4uLi4uLi4uLi4NCj4gc2k9
JXBfRDhfU0kgJmFkZGkNCj4gDQo+IElJVUMgeW91IHNob3VsZCBiZSBhYmxlIHRvIGRvIHNvbWV0
aGluZyBsaWtlIGNhdGNoIHJhPTAgZmlyc3QgLi4uOg0KPiANCj4gew0KPiAgIGFkZGlfbW92aSAg
IDAwMDAwMSAxMCAwIC0tIHI6MSAtLSAuLi4uLi4uLi4uLi4uLi4uLi4gMDAxMTEwIHJ0OjUgLi4u
Li4NCj4gLi4uLi4uLi4uLi4uLi4uLiBzaT0lcF9EOF9TSSAmYWRkaSByYT0wDQo+ICAgYWRkaSAg
IDAwMDAwMSAxMCAwIC0tIHI6MSAtLSAuLi4uLi4uLi4uLi4uLi4uLi4gMDAxMTEwIHJ0OjUgcmE6
NQ0KPiAuLi4uLi4uLi4uLi4uLi4uIHNpPSVwX0Q4X1NJICZhZGRpDQo+IH0NCg0KPiA+ICsrKyBi
L3RhcmdldC9wcGMvdHJhbnNsYXRlL2ZpeGVkcG9pbnQtaW1wbC5jLmluYw0KPiA+IEBAIC0wLDAg
KzEsMjYgQEANCj4gPiArc3RhdGljIGJvb2wgdHJhbnNfcGFkZGkoRGlzYXNDb250ZXh0ICpjdHgs
IGFyZ19wYWRkaSAqYSkNCj4gDQo+IChOaXRwaWNrLCB1c2UgdGhlIGZvcm1hdDogYXJnX2FkZGks
IG5vdCBhcmdfcGFkZGkpLg0KDQpTdXJlLCB3aWxsIGRvISBJIHdhcyB1c2luZyB0aGUgZXhhY3Qg
ZnVuY3Rpb24gc2lnbmF0dXJlIGdlbmVyYXRlZCBieQ0KZGVjb2RldHJlZSwgYnV0IHVzaW5nICdh
cmdfYWRkaScgbWFrZXMgbW9yZSBzZW5zZSwgYXMgaXQgd2lsbCBtYWtlDQppdCBjbGVhcmVyIHRo
YXQgaXQncyB0aGUgc2FtZSBzdHJ1Y3QuDQoNCj4gDQo+ID4gK3sNCj4gPiArICAgIGlmIChhLT5y
ID09IDApIHsNCj4gPiArICAgICAgICBpZiAoYS0+cmEgPT0gMCkgew0KPiA+ICsgICAgICAgICAg
ICAvKiBsaSBjYXNlICovDQo+ID4gKyAgICAgICAgICAgIHRjZ19nZW5fbW92aV90bChjcHVfZ3By
W2EtPnJ0XSwgYS0+c2kpOw0KPiA+ICsgICAgICAgIH0gZWxzZSB7DQo+ID4gKyAgICAgICAgICAg
IHRjZ19nZW5fYWRkaV90bChjcHVfZ3ByW2EtPnJ0XSwNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNwdV9ncHJbYS0+cmFdLCBhLT5zaSk7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsg
ICAgfSBlbHNlIHsNCj4gPiArICAgICAgICBpZiAoYS0+cmEgPT0gMCkgew0KPiA+ICsgICAgICAg
ICAgICB0Y2dfZ2VuX2FkZGlfdGwoY3B1X2dwclthLT5ydF0sIGNwdV9uaXAsIGEtPnNpKTsNCj4g
PiArICAgICAgICB9IGVsc2Ugew0KPiA+ICsgICAgICAgICAgICAvKiBpbnZhbGlkIGZvcm0gKi8N
Cj4gPiArICAgICAgICAgICAgZ2VuX2ludmFsaWQoY3R4KTsNCj4gPiArICAgICAgICB9DQo+ID4g
KyAgICB9DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIHRydWU7DQo+ID4gK30NCj4gPiArDQo+ID4g
K3N0YXRpYyBib29sIHRyYW5zX2FkZGkoRGlzYXNDb250ZXh0ICpjdHgsIGFyZ19hZGRpICphKSB7
DQo+ID4gKyAgICByZXR1cm4gdHJhbnNfcGFkZGkoY3R4LCBhKTsNCj4gPiArfQ0KPiANCj4gLi4u
IHdoaWNoIHRoZW4gc2ltcGxpZmllcyB0aGUgdHJhbnNfT1BDT0RFKCkgbG9naWM6DQo+IA0KPiBz
dGF0aWMgYm9vbCB0cmFuc19hZGRpX21vdmkoRGlzYXNDb250ZXh0ICpjdHgsIGFyZ19hZGRpICph
KSB7DQo+ICAgICBpZiAoYS0+ciA9PSAwKSB7DQo+ICAgICAgICAgLyogbGkgY2FzZSAqLw0KPiAg
ICAgICAgIHRjZ19nZW5fbW92aV90bChjcHVfZ3ByW2EtPnJ0XSwgYS0+c2kpOw0KPiAgICAgfSBl
bHNlIHsNCj4gICAgICAgICB0Y2dfZ2VuX2FkZGlfdGwoY3B1X2dwclthLT5ydF0sIGNwdV9uaXAs
IGEtPnNpKTsNCj4gICAgIH0NCj4gDQo+ICAgICByZXR1cm4gdHJ1ZTsNCj4gfQ0KPiANCj4gc3Rh
dGljIGJvb2wgdHJhbnNfYWRkaShEaXNhc0NvbnRleHQgKmN0eCwgYXJnX2FkZGkgKmEpIHsNCj4g
ICAgIGlmIChhLT5yID09IDApIHsNCj4gICAgICAgICB0Y2dfZ2VuX2FkZGlfdGwoY3B1X2dwclth
LT5ydF0sIGNwdV9ncHJbYS0+cmFdLCBhLT5zaSk7DQo+ICAgICB9IGVsc2Ugew0KPiAgICAgICAg
IC8qIGludmFsaWQgZm9ybSAqLw0KPiAgICAgICAgIGdlbl9pbnZhbGlkKGN0eCk7DQo+ICAgICB9
DQo+IA0KPiAgICAgcmV0dXJuIHRydWU7DQo+IH0NCj4gDQo+IE1heWJlIHlvdSBjYW4gZG8gdGhl
IHNhbWUgd2l0aCB0aGUgciBiaXQgdG8gcmVtb3ZlIHRoZSBkdWFsIGFkZGlfbW92aS4NCg0KUmln
aHQsIHRoYXQgY2FuIGJlIGRvbmUuIE9uIHRoZSBvdGhlciBoYW5kLCBrZWVwaW5nIHRoaXMgbG9n
aWMgaW5zaWRlIHRyYW5zX3BhZGRpDQphbmQgbm90IGluIHRoZSAuZGVjb2RlIGZpbGUgbWFrZXMg
aXQgc2ltcGxlciAoYW5kIGxlc3MgZXJyb3ItcHJvbmUpIHRvIGNoZWNrIHRoYXQNCnRoZSBpbXBs
ZW1lbnRhdGlvbiBtYXRjaGVzIHRoZSBvZmZpY2lhbCBJU0EgZG9jdW1lbnRhdGlvbiwgd2hlbiBv
cGVuaW5nDQpib3RoIHNpZGUgYnkgc2lkZS4NCg0KVGhpcyBpcyBiZWNhdXNlIHRoZSBJU0Egc3Bl
Y2lmaWVzIHRoZSBpbnN0cnVjdGlvbiBmb3JtYXQgZm9yIHBhZGRpIGFzIGEgd2hvbGUNCih3aGlj
aCBjYW4gYmUgZWFzaWx5IG1hdGNoZWQgdG8gd2hhdCB3b3VsZCBiZSBpbiB0aGUgLmRlY29kZSBm
aWxlKSBhbmQsIGFmdGVyDQp0aGF0LCB0aGUgSVNBIHNwZWNpZmllcyBob3cgZWFjaCBjYXNlIHNo
b3VsZCBiZSBoYW5kbGVkICh3aGljaCBjb3VsZCB0aGVuDQpiZSBjaGVja2VkIGJ5IGp1c3QgbG9v
a2luZyBhdCB0aGUgdHJhbnNfcGFkZGkgaW1wbGVtZW50YXRpb24sIHdoaWNoIHdvdWxkDQpiZSBp
biBhIHNpbmdsZSBmdW5jdGlvbikuDQoNClNpbmNlIHRoZSB0cmFuc19wYWRkaSBpbXBsZW1lbnRh
dGlvbiB3aXRoIHRoZSByYS9yIGhhbmRsaW5nIGlzIG5vdCB0aGF0DQpjb21wbGV4IGVpdGhlciwg
SSB3b3VsZCByZWNvbW1lbmQga2VlcGluZyB0aGUgY2xlYXJlciBzZXBhcmF0aW9uDQpiZXR3ZWVu
IHRoZSBpbnN0cnVjdGlvbiBmb3JtYXRzIChpbiB0aGUgLmRlY29kZSBmaWxlKSBhbmQgdGhlDQpo
YW5kbGluZyBvZiBlYWNoIGNhc2UgaW4gdGhlIHRyYW5zX09QQ09ERSgpIGxvZ2ljLiBXaGF0IGRv
IHlvdSB0aGluaz8NCg0KVGhhbmtzLA0KTHVpcw0K

