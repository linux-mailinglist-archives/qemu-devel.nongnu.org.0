Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04886E997A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 18:24:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppX3Q-0004eP-Pd; Thu, 20 Apr 2023 12:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1ppX3O-0004e6-77
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:22:38 -0400
Received: from mail-he1eur01on0718.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::718]
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1ppX3L-0001R3-BY
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:22:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWW6NTzbCUmiE6HbetPFNhSgAuhCevUpOEOxpfs11odeJft2xH9UHwlnRifmMBjvxAtMMjfkUNMK+W8DJLTTHuxFmQCLYqBmXLJmRmZums7bik0HG7znKUFdu1kIng+ss9IPOnj5dB9FG+0L933W5XTlZESPcc8l73shpe9oCbBMaj+hXyMjSL9vIccTfwqKQ8KDvuissF3xjuUdC9uxJHf7Dq+mf44O9XWE6y9ClP3yllJSrN222ybduHi0wgXhl1DnR5QpIand4tY1RDneCmuqWA3mbBMFA3pto/MHQa/t+w3DVDuFRCXQ83MjLTIwal/2XEWj/g7Um2F0HZn3vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBnkjCMW27ET9s7e9iv/zxwRl6uh6ciFaFAgQPbD9U8=;
 b=bY/iJeWIvYN/P3gvp0Lf2WVP+bBLHbg4vOGcFQymaEsD8e3q9noXEwWkgVhfQRHnDmeVAy0Ajm0pD5Uh8RK647EFjr/LDRn016nBtR8r5geSTeRnWCy6SAQdCM++Ig9u7Rp5sWrqfdZTPmHaHHE9F/gD9RunAm/CTw2FvMp8PgWuKKDyHBGTdDOeOsK7jUQJ2lX6uJCLr1TqpwMZ8VEhjh0DsZs76BPGp6JAfWuOk8K4sdzVYC7ns/d4ADEQMWJWd9VzGBaekz715ATFY1dNj2GHTakYf9lI0/kji4/Wnnqh6PpHBkRVksZfIGgotvOiUFXQ+62J/fu0RNt4Fq955w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBnkjCMW27ET9s7e9iv/zxwRl6uh6ciFaFAgQPbD9U8=;
 b=W1scFZBC5D8xpbSxC6a6nVwPV0Lv012D0I3jRKRusvrlmKHjlLDljQBjCb8R1eoPbpszfrwmbEkr3mIk1AR2oQR4HTxqyhE3Oku1tma/T35Ic1721w+I8/mkenBiVdnvrRexbfHz8888wJaNDF6QH5um60Hju3WnP44M1NqtcH8=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DU0P189MB1867.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:347::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 16:22:29 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 16:22:28 +0000
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
Subject: RE: [PATCH v2 28/41] hw/net/net_rx_pkt: Enforce alignment for
 eth_header
Thread-Topic: [PATCH v2 28/41] hw/net/net_rx_pkt: Enforce alignment for
 eth_header
Thread-Index: AQHZc0vYSeenN5hXR0iwHbB3Bn9kX680W9cw
Date: Thu, 20 Apr 2023 16:22:28 +0000
Message-ID: <DBBP189MB14330F9294FCA8AF387508A495639@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
 <20230420054657.50367-29-akihiko.odaki@daynix.com>
In-Reply-To: <20230420054657.50367-29-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DU0P189MB1867:EE_
x-ms-office365-filtering-correlation-id: 38f05a6c-d7e7-4613-3fab-08db41bb6f93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ++BGwsriOBjaeL+hzExuZXmLgH3RJ0VNT2fTqh5Ny1nFt9AUYnIAVtEiRphhIWVqE/EcvSOqRKaJ8N3Sr5mA1WwBfnWsQwJm5G8hNR59ILfAUlA2DAq+oWYMZqbhg+KNzrZutVXL90Nil/CjCMPlpeEQxuvUZ2CXVvitG1+S3DnD0tPXOPRM65QL5xiFpra61WfNGo/fbTELRfbViFQGNlWv/vN/21Nwxz5KchaNgRy7fJYemVAubRD6pixewWLX91nOpZXqEhqH3p05vsyW3AlOuxYz/PVHezdC2WtvOmgGGaKBoTYgy4pD0Zx0owWIDa7VpIXFEC5lVcU9GD69a8NnJMOVJfcy+iIAaFq5tAR1o8EoYTPmWobAvey7QZQeUggLEMMY62SB+opX1QPTyEMNWyYinm2yZCt1JVlr7UcEE5R/AwSukza/jt/JoWc0n/3dkbL7JlZDegyLxWhuyJjoH8Broj4eljvdtHuXn7aPwy34wFrFVSFwfDdGAj1dCIU//Xn/v4bQb6CxdMLpxI/565QumtUSmxBCKVcrvzZ05UZXlZouVkFZ5tUfod66fYJYcFkv1ODawFUcBJRB2NCzCn8fuIofLcccoX1Lo+rrekJvPbm8so75IMUChlNo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(396003)(136003)(39840400004)(346002)(451199021)(33656002)(6916009)(4326008)(54906003)(316002)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(186003)(478600001)(71200400001)(7696005)(55016003)(8936002)(41300700001)(5660300002)(8676002)(52536014)(2906002)(7416002)(44832011)(38070700005)(86362001)(122000001)(38100700002)(9686003)(6506007)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjNoRnVoaFZ4R0Y4SnJEZnBJQ1c3WkFnNHFnYnJoaDYrczF3aUZuSHR2Zm4z?=
 =?utf-8?B?U0t0bC9tYmQxaEdBOUkwd3R3QjdCWXlscUpaVW9iTnAwSk8zNFEreFZkSTNJ?=
 =?utf-8?B?WUZtNnZURi9xaEVkbG5DNGl0SGdzejhBTGZIYmRyRFZDTUhrUFVMeUsvVWlJ?=
 =?utf-8?B?Wk01enc1V0xQL3k5a3Q1UkNyU3phNWJCTklmR0dXZzA2SGFRRFBDS1dwOTZ5?=
 =?utf-8?B?Vnh1UDUwdDAydUMxOFBHS2xHYS8wd1NxVHBTSGx4Z2ZSK01qSHRPQ0l3Rjho?=
 =?utf-8?B?WGZ2R2xaRU8rOHdaUGtzMDJvUjB1THNjM3A4N0Jla2JFZlREN0RIRTc4a2dI?=
 =?utf-8?B?NitHN2VzempPaWRFZll3RzhEY3hYOExNdHJsM0NVdzQ4OE9TbDNFUjJOWU82?=
 =?utf-8?B?bGsxaGw4ZFdDTjF1Vm1rYkJNT0hKZS9SMURkYVZFbGNhc0cxVFdNZDRIK1M4?=
 =?utf-8?B?dXBaZmdibm5kVDhRd2dLampXOWN0WXNqVzJrTmxKczlVVEI3Qnc0Q0Zkam5R?=
 =?utf-8?B?MTNSeFFqeWZiV1JwYi9jUUp0ZWpOSFY5NjBUTWdBcnF0YmUrV2J1WHJzR28y?=
 =?utf-8?B?bWcvNFUrTFZPa2xUVWNQUWZGc1JRQWozcnozeUpqamlwZVVWUW1SVllnajJF?=
 =?utf-8?B?bGZaeTZjbWNONVhEOUFEclBkdURWeThkcVF4YWdjVi8zbHNmRjk5SHhIVlZp?=
 =?utf-8?B?bTM0aUZ5SGhHbndHcXdMSE04RmkxbWxkSncwVDkwSzE2N1ZwRzRmY2k4VWRL?=
 =?utf-8?B?NzhUQ2lwaTE2djlHY1lpTWs1K2ZHY21ZTFRtdGdaMXNZTURFNmlkL3RSTkdV?=
 =?utf-8?B?Q0lBejY3ZHFONzFOMHhUUXBjQjkvV3RZcjRNOVBVMDFjcHVGelRhajNoQWYr?=
 =?utf-8?B?akp0Zy8vRDBiU2psdUhRZWhBbFcyYWRSQ2tRYnE2ZEtuSGhDQnlPcVN4cFNG?=
 =?utf-8?B?OTQ4OHdtakFwZHJvdm1zU0NTSTJXQTlsNnNTMTFqOUF6SlZmMUhWaHYwZTIy?=
 =?utf-8?B?YkwwVGJNTHZqUkFkRnBRSkk2WjVVNDhhSVVDU0JST0ozU1dHSWVZc2MxRTdv?=
 =?utf-8?B?TDhEclhpSFEvNGk5TlVLdFdnZEc5dmY0a0tDcXZ3U001MElFRlp2MUN3Zllk?=
 =?utf-8?B?SFl5STJqYWhOQlNPOFNIbXgwQjNPUi8rRlV1bkhxVDlQbXFicC9xSWZuRjZ1?=
 =?utf-8?B?MkhpVXNMWkIrL2pTenMxQmViWHR2M3FVSE8weFlRaEJVRzJqZWk5bnRDS0Ja?=
 =?utf-8?B?QWJveThIdnNLcEFlL2pCd2FUMGJxZFNUSUhJdFpqUG9hUDBMZ1Zjck80TGtH?=
 =?utf-8?B?TjZTaEJJZkhCRlpIdFhMcVJVdXp0UlRYaTNsOVNwS29PdkVXQVlRbUFicnU4?=
 =?utf-8?B?allBcy80Y3FJbXFwditvNkJlSHNVZnJzeDNzRmk4ZFRoWjQ2eHVORHpDdVVz?=
 =?utf-8?B?WGlHYUJEMWpxb1pxcUpGdG9Hd2txczZnNkdEcU5rTUM3eXc4SzRLRDBKNXJN?=
 =?utf-8?B?QXRwaFdkWUZFWDJMQzk0WmF1bGVFRlV2ZXpMUTFsVDZwUkxLTmpTMllJVVVq?=
 =?utf-8?B?VzU4S1RjS2Z5RlFVYTA2bkVTZmsvWGp0UGlaaWdrYjhZRkRrZ2RselB3Vzli?=
 =?utf-8?B?Z2ZuMm1uclpnbHV4Tll1RmdZMmRUenBQWElZYnlnMDBQNVV1T2FFODc5Tm9n?=
 =?utf-8?B?OXYwbS8vaDFYMmVtN0pmS2MxQnY5VTVwOFdldnBxTTFsbmJYZU1WQ3p6ZDZ5?=
 =?utf-8?B?TGdkVHhNMitVUVhJRHZBTXNJWGdLRlVYRkRCSkJlVUw2VlN5SWpmWkdoR1Uw?=
 =?utf-8?B?V3FrTTF6YXhrcXNWNzZFaU8ycHY4dkM0dE1MRWYzS2dnZS9CRnZXczlyWEk2?=
 =?utf-8?B?OUJGMHFwYmxlWUJac1BSVzdBQXpLVm1pNEhpMEpWNndvL0R3ejR0TUxVZFZo?=
 =?utf-8?B?Rno0THVnWHFvd2RxSEY5M0NBMStlejFJOWp4UmZrbWdiSWNBbWlabko5QStr?=
 =?utf-8?B?RkRBa2dkUjNaMHpwaVl3ajlmQ255aXFwaENYVHlKNTBMRGQvKysrNVJoRXd5?=
 =?utf-8?B?WnltdlRHZzd2TFY0aEZDTnJadWpzTnl3dWp2OEN1emJOYmNQek5xTHR4WTY4?=
 =?utf-8?Q?FSg7mFn4jm+AlL5bhitrZZtmu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f05a6c-d7e7-4613-3fab-08db41bb6f93
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 16:22:28.9577 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kJEKKgHwPSbvTcjk48FMABJpmoBUv8Lg9oiXgrpcIg/vOUyoCaUJYLtY7D6XXzRZgF6tHDJ4MH0FG/Jn0uF+Phkz8v2J9bVAOyDpBUjlMgs=
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
Cj4gU3ViamVjdDogW1BBVENIIHYyIDI4LzQxXSBody9uZXQvbmV0X3J4X3BrdDogRW5mb3JjZSBh
bGlnbm1lbnQgZm9yDQo+IGV0aF9oZWFkZXINCj4gDQo+IGV0aF9zdHJpcF92bGFuIGFuZCBldGhf
c3RyaXBfdmxhbl9leCByZWZlcnMgdG8gZWhkcl9idWYgYXMgc3RydWN0IGV0aF9oZWFkZXIuDQo+
IEVuZm9yY2UgYWxpZ25tZW50IGZvciB0aGUgc3RydWN0dXJlLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQWtpaGlrbyBPZGFraSA8YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0KPiAtLS0NCj4gIGh3
L25ldC9uZXRfcnhfcGt0LmMgfCAxMSArKysrKysrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9ody9uZXQv
bmV0X3J4X3BrdC5jIGIvaHcvbmV0L25ldF9yeF9wa3QuYyBpbmRleA0KPiA2MTI1YTA2M2Q3Li4x
ZGU0MmI0ZjUxIDEwMDY0NA0KPiAtLS0gYS9ody9uZXQvbmV0X3J4X3BrdC5jDQo+ICsrKyBiL2h3
L25ldC9uZXRfcnhfcGt0LmMNCj4gQEAgLTIzLDcgKzIzLDEwIEBADQo+IA0KPiAgc3RydWN0IE5l
dFJ4UGt0IHsNCj4gICAgICBzdHJ1Y3QgdmlydGlvX25ldF9oZHIgdmlydF9oZHI7DQo+IC0gICAg
dWludDhfdCBlaGRyX2J1ZltzaXplb2Yoc3RydWN0IGV0aF9oZWFkZXIpICsgc2l6ZW9mKHN0cnVj
dCB2bGFuX2hlYWRlcildOw0KPiArICAgIHN0cnVjdCB7DQo+ICsgICAgICAgIHN0cnVjdCBldGhf
aGVhZGVyIGV0aDsNCj4gKyAgICAgICAgc3RydWN0IHZsYW5faGVhZGVyIHZsYW47DQo+ICsgICAg
fSBlaGRyX2J1ZjsNCj4gICAgICBzdHJ1Y3QgaW92ZWMgKnZlYzsNCj4gICAgICB1aW50MTZfdCB2
ZWNfbGVuX3RvdGFsOw0KPiAgICAgIHVpbnQxNl90IHZlY19sZW47DQo+IEBAIC04OSw3ICs5Miw3
IEBAIG5ldF9yeF9wa3RfcHVsbF9kYXRhKHN0cnVjdCBOZXRSeFBrdCAqcGt0LA0KPiAgICAgIGlm
IChwa3QtPmVoZHJfYnVmX2xlbikgew0KPiAgICAgICAgICBuZXRfcnhfcGt0X2lvdmVjX3JlYWxs
b2MocGt0LCBpb3ZjbnQgKyAxKTsNCj4gDQo+IC0gICAgICAgIHBrdC0+dmVjWzBdLmlvdl9iYXNl
ID0gcGt0LT5laGRyX2J1ZjsNCj4gKyAgICAgICAgcGt0LT52ZWNbMF0uaW92X2Jhc2UgPSAmcGt0
LT5laGRyX2J1ZjsNCj4gICAgICAgICAgcGt0LT52ZWNbMF0uaW92X2xlbiA9IHBrdC0+ZWhkcl9i
dWZfbGVuOw0KPiANCj4gICAgICAgICAgcGt0LT50b3RfbGVuID0gcGxsZW4gKyBwa3QtPmVoZHJf
YnVmX2xlbjsgQEAgLTEyMCw3ICsxMjMsNyBAQCB2b2lkDQo+IG5ldF9yeF9wa3RfYXR0YWNoX2lv
dmVjKHN0cnVjdCBOZXRSeFBrdCAqcGt0LA0KPiAgICAgIGFzc2VydChwa3QpOw0KPiANCj4gICAg
ICBpZiAoc3RyaXBfdmxhbikgew0KPiAtICAgICAgICBwa3QtPmVoZHJfYnVmX2xlbiA9IGV0aF9z
dHJpcF92bGFuKGlvdiwgaW92Y250LCBpb3ZvZmYsIHBrdC0+ZWhkcl9idWYsDQo+ICsgICAgICAg
IHBrdC0+ZWhkcl9idWZfbGVuID0gZXRoX3N0cmlwX3ZsYW4oaW92LCBpb3ZjbnQsIGlvdm9mZiwN
Cj4gKyAmcGt0LT5laGRyX2J1ZiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmcGxvZmYsICZ0Y2kpOw0KPiAgICAgIH0gZWxzZSB7DQo+ICAgICAgICAgIHBr
dC0+ZWhkcl9idWZfbGVuID0gMDsNCj4gQEAgLTE0Miw3ICsxNDUsNyBAQCB2b2lkIG5ldF9yeF9w
a3RfYXR0YWNoX2lvdmVjX2V4KHN0cnVjdCBOZXRSeFBrdA0KPiAqcGt0LA0KPiANCj4gICAgICBp
ZiAoc3RyaXBfdmxhbikgew0KPiAgICAgICAgICBwa3QtPmVoZHJfYnVmX2xlbiA9IGV0aF9zdHJp
cF92bGFuX2V4KGlvdiwgaW92Y250LCBpb3ZvZmYsIHZldCwNCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwa3QtPmVoZHJfYnVmLA0KPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwa3QtPmVoZHJfYnVmLA0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwbG9mZiwgJnRj
aSk7DQo+ICAgICAgfSBlbHNlIHsNCj4gICAgICAgICAgcGt0LT5laGRyX2J1Zl9sZW4gPSAwOw0K
PiAtLQ0KPiAyLjQwLjANCg0KTEdUTQ0K

