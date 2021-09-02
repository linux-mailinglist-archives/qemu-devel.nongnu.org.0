Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 005C23FF562
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 23:11:12 +0200 (CEST)
Received: from localhost ([::1]:40706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLtzL-0005rk-I5
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 17:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mLtwF-00030M-3o; Thu, 02 Sep 2021 17:07:59 -0400
Received: from mail-dm3nam07on2135.outbound.protection.outlook.com
 ([40.107.95.135]:23808 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mLtw8-0001j8-Cu; Thu, 02 Sep 2021 17:07:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTIn4ZBwd5WE0WAycpo8L9RALa0D2pZYf+O1pW3KuIK+QW0pMoOq/xgxA95PdTkbXAUfxVw+LtRyZFrcBUvxlErUs1jh98kXaMy4hoA9Ag9Y+KtIAm/Itki6PKaBDMiGXrFbwENU5Iop1lnKAK+xCbs0KXheQTlXWFvx6FCmIhM0EDPk6kAGM7bSBPLvY0aohKk5hbfRaURYoYpiGMWsEOq9qwz5h6Xdx9KKMmHK7bOBAtsRetN6Yz9FbR1+yjNOSs5pKLZ/UFLRrztYFkwoJzpCtNFWaBQfeLkxH29isg0VaaxFmY6Vvmpe3EOlmsvHdR7TkjZWMm4OzoUioC0HBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=bU8mxW9AjE1BV9GAsFliaycfF6AA6gTgzeOyMNvm2g4=;
 b=HBHf2yUoIC03ymNLvH9NHK4fMyClqcSl6KSkBmCI1alCaEB7oeH37bR1bLndYTV+CD3zwi/7zSie0PAIcRNjFv1ls/iBDJm9xesopK7JabQPms9SDGNMDGfwgo15PI8tzcgMgNwkNwQ0kyLXW4dH2x3ZbkTgfVj0q5FhOpjmI13gU242uvaTKyhEAjYocvNvXThb/TYK8stJHNKcCHf6YsnidzekjchlgpHU3ZNBKh3DlSzz/PMgE6khmoFrtjRPOa6pglX8N+T7XEOiV3EsV860Uuk090ZfROGntYVlzCjX6t8+fbsDZQC8afYgMWm5aTFG6qooSVzsIWurVXIUsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bU8mxW9AjE1BV9GAsFliaycfF6AA6gTgzeOyMNvm2g4=;
 b=jGvmlDOGNexVE5J0N9jywRAH8A8mviqCo/pdBvyPaIHkCq00blejkWYnyU2dqdzbg/UTvxU/STHh9CGxn8mq6zNrmf6IG1ZrwcA0hPA8pr6bhOCBlt33qU8pp6DR3XMvN0mO8y5hhCqrpS231ccO8a6khoMgGWH+1GqvAVZfRdrT0G2WnDwIjbMMKM9tLF2lCEKQ8rtllBuZzNU189WYgzU8mkBIIVtLi1xLgapaHMMwQYdF9W7FpxWnikzrms8iNN9niUsovk3df/uj/QT3fuxHVIztUeZU/pN4xX4v7YXpxPTvQ8kadA0KxuU1/tTANyXASs4LmIdL3v6BYdOhDw==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP0PR80MB4850.lamprd80.prod.outlook.com (2603:10d6:103:21::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Thu, 2 Sep
 2021 21:07:46 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::9c41:722:8b7b:8a76]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::9c41:722:8b7b:8a76%5]) with mapi id 15.20.4457.026; Thu, 2 Sep 2021
 21:07:46 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
Subject: RE: [PATCH v2 03/19] host-utils: move checks out of divu128/divs128
Thread-Topic: [PATCH v2 03/19] host-utils: move checks out of divu128/divs128
Thread-Index: AQHXnodMPzkRIkTsU0mDla07y7Xn4quN3FWAgANeUDA=
Date: Thu, 2 Sep 2021 21:07:46 +0000
Message-ID: <CP2PR80MB36686B0030807BB340C2FAE3DACE9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
 <20210831164007.297781-4-luis.pires@eldorado.org.br>
 <984687eb-4d74-38e4-70ef-b8c527fe828b@linaro.org>
In-Reply-To: <984687eb-4d74-38e4-70ef-b8c527fe828b@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e3e1c5d-720a-4fb6-490e-08d96e55b6b9
x-ms-traffictypediagnostic: CP0PR80MB4850:
x-microsoft-antispam-prvs: <CP0PR80MB4850AAB1DEB501C51B1E811CDACE9@CP0PR80MB4850.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c5TDXURz3ebUurTrkSQLSouzMpDr+CN+6Uuh6CPO1hSzzoX+QlIkjGbSOwCalEgVSh8bv8ZK5tV7zXn52M2+F36mJV+LQE5h2oaxYQsWq00/qbNelzTfXMkFERBpKflrXW8dCx7hvxE0VCqfxQpmx7SRE867mX1QCobGf37KdLrpsIg/aFKeZP6UXOlF3Oq7JNaR/VB3XTxCXTojpCUgYTyrgF2ETBmc21eREyxY89xnb2v88EmK6e+9bejDyNYcvzmr1XHVkcBJnbQ3ehdaRBGxa0Q88fIoRJTyDD9EbW1mHFGFczwhPODqtM1YW3zwuc3CG5xnxOw/S1NT7NtJxCiQt2jozoX2uCj3/GOXvhFHQsMPBFiGK/P001LIMkDv5vfryKBEkYEF7NpioySWTxezsC5xQ8mlHzx0swbg9CpVvbWiVKVf+dr3VhdExMNO4CFCTBxiSK+d7QtFS3iBXHNoDA+T6jqamEpoJODOYDSQ1jz3Pyt6RHeg/dYT0a9jQWmjqwHkmYe/oHvgkh2nSYChCUBOXC4jx3yAc1678ubjQIICNEqOi/hl75XkxAR348gKfEWAMzjujvoQbSqqoiI9Q3A//oej7J5FI0CxppxbMYk/pOOXdwoVpF2+DT/51cYpx4BI/HvEflQFulyCEgTEUdXwmj5YvBjl8KxWaO7+i1KpSlzLZPbJ9HGGyINruAxfiWeGrNfyZHQOLcFbdAtFGkO/QiUAkk/f3fuG9FPiSCUbvgv4WOOfDStnp18SA+lGZtSmhfEYCSJIP/OilLgnJnVqEUh7RTA9EgqTFzw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(54906003)(2906002)(55016002)(9686003)(508600001)(52536014)(7696005)(110136005)(316002)(4326008)(5660300002)(33656002)(86362001)(71200400001)(66946007)(76116006)(66476007)(66556008)(64756008)(66446008)(8936002)(38100700002)(186003)(38070700005)(26005)(6506007)(122000001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnJ6UDZTZWdkQ1BIT0RBSFVuTEc3b1RUR0hMTmc1WGJBSm0rVkp5N2dzU09U?=
 =?utf-8?B?K09xNm5zWEZhbFRySUdzYmIrSllWYmh6ZVhHVEJKaTF1S0hoNkR6RHc0RzlF?=
 =?utf-8?B?bHY2MCsrU25xR2hEUGl0UVJrSk9UUGRJTUJCNy9Sa29Cd1BhQ25TZTFvSmxp?=
 =?utf-8?B?SzhLSTZzbG1ORm9ZMDZkVTBQVndmMzdIejRyRjdSb3Z6TGVsSlpib0FaY0pW?=
 =?utf-8?B?RmgrdXo0dVhkblMwZTViL0R2M3dyR25DcmswWklNb2RoTllLZDlPNkRpQkRI?=
 =?utf-8?B?cnFTbUpOT1BBNVNsR3dUT2NCTjh1MGZ1UXg3WVdaYS9Palc0VFlnUkpRQkFo?=
 =?utf-8?B?YWIzL01Cenk1dTBwQ0N1Unlsb1RndGtOYVFOMGs1aVNELzQ5YTBMbjBhOG5Y?=
 =?utf-8?B?WE9GV1lacFpXR0p3T2t2Mkl1Y0tBWm1CTDJITUQwZy9lYjhtd2FYR2pkRitG?=
 =?utf-8?B?U01wVmFGRXdEa0Y4cFRPVjhITWttWDBFaTRvSzUvSHY1ZWIveTNwMjJpVnFl?=
 =?utf-8?B?N1o1OUh0aUVUN2txQTVSYnQzeVVzRWdBejhabVkycEVEVHhVMEx1NkdqOEhh?=
 =?utf-8?B?MWFLNlY0ZlBkVklCenNGTllyU2VKTFo0YkNIdnFQSDRtVmZ6S0FXWXFjRWNv?=
 =?utf-8?B?VUlsMlJ6eVB0SFdJbFZYcmYycFdRK1k4WW4zdlhOZW9mZ2JuRHBCVjltOUJQ?=
 =?utf-8?B?VjhVaG5zMzBSRU1aeVBDSTJxS0dvQXBGdUovUW1PK1hrTzNwbnNkN0xFT1hs?=
 =?utf-8?B?dUhLcFN4ZjB6NG9GRHZIWGZzaUFCS0hodFBQM1ZRc1NaMGFjdG9uOENCL1Na?=
 =?utf-8?B?R2crd2Q4UmRGQnNZS0NSY3lQWU4zY3Q4dEV3N3BxV0JNUkwyM0NkWFk3ZVJC?=
 =?utf-8?B?bUN6b0F1MHdTWUNFcFNpVTZBZFRsYzlCMXdqN3Q4UUJtUnFiZ1p2dUdBYmxx?=
 =?utf-8?B?cUhaa3pHcnJBU09JM0U5M1hMMnViekJUWGpib0Vxb0l0NmRURk5sRjAwZFg2?=
 =?utf-8?B?czF3UERuaXhYZjQ5WnFsV01Bdm5CV1NaaU1zWitUR3Y2bFRBUDNYT0h5ckZk?=
 =?utf-8?B?Zkt1ZnltNmJLWm8yYklzMXp2dnhyZUhpWlR5RTdhRGdpN0V1REtNMEtQeVFl?=
 =?utf-8?B?eklIRC9KcEwySUg5bnVUQnVETFlRN1dPSzc3S2w0YnczejNlSVo0VGlFbFAy?=
 =?utf-8?B?YXBPTFVrd09lMHFhYmJVcXV0MTRDNFlVM1U0NjNiQlVKODRIeEdPYW5SeXMy?=
 =?utf-8?B?NXU5U2J0ZitMcjNrZ3FFa2VIY3dvSnArMGdtemdDUWJIU1NLeENsQUpCOURp?=
 =?utf-8?B?aHpyVkppWDZxOUNmcVFsWUJxZXZ5cmFJdG5HcVVZM1FNVGhGcFpLRUNzb0Q4?=
 =?utf-8?B?YldjRUo4WEo0Z1c2cll0ZCtHVmVjc3F1OUdpS2ZFS25xdGhzMEhjSE0xZGdS?=
 =?utf-8?B?SndnK2YydjFFZEVQVEpYMmQ0Y2xnZ0xzR3B5WHdNeHFnOHBiaDQ0ajJDZlF2?=
 =?utf-8?B?REZBdWJ3K1dvN25UUjUrSERIRjk3Nm5BdXoxekR6MWh4QlNMZzRzQVVxRTA4?=
 =?utf-8?B?ZHNYbEpibHNLb2tYV2hyRE9FU3hKalA4aE9qcGRxeFV3MGNtS0ZrMElnQWYv?=
 =?utf-8?B?RktKQ1JMM1JaUVJVM1dMMzNzZi9KOVZUZTR2LzhhMjg5VXZ5c2xoY0cxdERx?=
 =?utf-8?B?M2hWZXEram1qMC9qSVlrdWNmckdlb2gzcW9FUnZEbDdZOFFXMkZoUjhlcklK?=
 =?utf-8?Q?Rb7iSgVxvVUSfcGVXlwdojLc5g02abXHQf231gU?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e3e1c5d-720a-4fb6-490e-08d96e55b6b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2021 21:07:46.6017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rJik5CjEczFfYpnbWTFbqkQfPZGSdiO2XQDcmf715FKtGuXNJf/sG75Khe+UhVwBa5E7bAqenAMxbmNvXeXh0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB4850
Received-SPF: pass client-ip=40.107.95.135;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
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
Cc: "groug@kaod.org" <groug@kaod.org>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
ID4gLXN0YXRpYyBpbmxpbmUgaW50IGRpdnMxMjgoaW50NjRfdCAqcGxvdywgaW50NjRfdCAqcGhp
Z2gsIGludDY0X3QNCj4gPiBkaXZpc29yKQ0KPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgZGl2czEy
OChpbnQ2NF90ICpwbG93LCBpbnQ2NF90ICpwaGlnaCwgaW50NjRfdA0KPiA+ICtkaXZpc29yKQ0K
PiA+ICAgew0KPiA+IC0gICAgaWYgKGRpdmlzb3IgPT0gMCkgew0KPiA+IC0gICAgICAgIHJldHVy
biAxOw0KPiA+IC0gICAgfSBlbHNlIHsNCj4gPiAtICAgICAgICBfX2ludDEyOF90IGRpdmlkZW5k
ID0gKChfX2ludDEyOF90KSpwaGlnaCA8PCA2NCkgfCAqcGxvdzsNCj4gPiAtICAgICAgICBfX2lu
dDEyOF90IHJlc3VsdCA9IGRpdmlkZW5kIC8gZGl2aXNvcjsNCj4gPiAtICAgICAgICAqcGxvdyA9
IHJlc3VsdDsNCj4gPiAtICAgICAgICAqcGhpZ2ggPSBkaXZpZGVuZCAlIGRpdmlzb3I7DQo+ID4g
LSAgICAgICAgcmV0dXJuIHJlc3VsdCAhPSAqcGxvdzsNCj4gPiAtICAgIH0NCj4gPiArICAgIF9f
aW50MTI4X3QgZGl2aWRlbmQgPSAoKF9faW50MTI4X3QpKnBoaWdoIDw8IDY0KSB8ICpwbG93Ow0K
Pg0KPiBUaGlzIGlzIGluY29ycmVjdCwgYmVmb3JlIGFuZCBhZnRlcjogKnBsb3cgbXVzdCBiZSB6
ZXJvLWV4dGVuZGVkIGhlcmUuDQoNClRoaXMgd2lsbCBubyBsb25nZXIgYmUgYSBwcm9ibGVtIGFm
dGVyIHBhdGNoIDQsIHdoZW4gcGxvdyBpcyBjaGFuZ2VkIHRvIGJlIHVpbnQ2NF90KiwgYnV0IEkg
Y2FuIGZpeCBpdCBoZXJlLCB0b28uDQoNCj4gPiBAQCAtOTcsMTMgKzEwMSwxMSBAQCBpbnQgZGl2
dTEyOCh1aW50NjRfdCAqcGxvdywgdWludDY0X3QgKnBoaWdoLCB1aW50NjRfdA0KPiBkaXZpc29y
KQ0KPiA+ICAgICAgIHVpbnQ2NF90IGNhcnJ5ID0gMDsNCj4gPg0KPiA+ICAgICAgIGlmIChkaXZp
c29yID09IDApIHsNCj4gPiAtICAgICAgICByZXR1cm4gMTsNCj4gPiArICAgICAgICAvKiBpbnRl
bnRpb25hbGx5IGNhdXNlIGEgZGl2aXNpb24gYnkgMCAqLw0KPiA+ICsgICAgICAgICpwbG93ID0g
MSAvIGRpdmlzb3I7DQo+ID4gICAgICAgfSBlbHNlIGlmIChkaGkgPT0gMCkgew0KPiA+ICAgICAg
ICAgICAqcGxvdyAgPSBkbG8gLyBkaXZpc29yOw0KPiA+ICAgICAgICAgICAqcGhpZ2ggPSBkbG8g
JSBkaXZpc29yOw0KPiANCj4gTGV0J3Mgbm90IGRvIHR3byB1bmRlZmluZWQgdGhpbmdzIGFuZCBs
ZWF2ZSAqcGhpZ2ggdW5pbml0aWFsaXplZCAoZS5nLiByaXNjdiBob3N0LA0KPiB3aGVyZSBkaXYt
YnktemVybyBkb2VzIG5vdCB0cmFwKS4gIEp1c3QgZm9sZCB0aGUgZGl2LWJ5LXplcm8gY2FzZSBp
bnRvIHRoZSBkaGkgPT0gMA0KPiBjYXNlLg0KDQpXaWxsIGRvLg0KDQotLQ0KTHVpcyBQaXJlcw0K
SW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETw0KQXZpc28gTGVnYWwgLSBEaXNjbGFpbWVy
IDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

