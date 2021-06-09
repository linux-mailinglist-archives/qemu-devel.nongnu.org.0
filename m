Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5C93A18E9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:14:49 +0200 (CEST)
Received: from localhost ([::1]:46226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzuq-0005QG-Qk
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzeu-0005z7-NE
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:58:21 -0400
Received: from mail-eopbgr800122.outbound.protection.outlook.com
 ([40.107.80.122]:10497 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzes-0004wH-8K
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:58:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7PyQGo/ZiPqyLQ2y74jX7vBruayJtKtze7pXrO8bAzak67PlkFnau+FgAJ9D3fBmEui1Zh45uxUJdvYWZivbdePJqHjXX7uOe3Vc/3epfMu9nniCDZk4S/27X09bIqsyrzzD/9f3xhD9rferZx4/7huaLJSBigFCjU7mkp6dpJISe4IvJ12+PZKHfbenOD/tqaAZo46Aw/YqsTtaKWVE5sNtpzq3ja50TaC2t4Z3dP/0krw+3j+eY64//siozsy39J1pMorwoUGbZAP/ZQ1f5rGSAOMjqn6VZpS1A3Yja3+waEAnzB5NRO9FzfqfiLdX1omC8yN6AQ1kvqJGLAnVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqZSqFT8CFDeQnpFOfnBQwDf7upFeJbnnx8Qc1a+zSU=;
 b=nvKx6jGwFkTVyBvEJHt3M/cPnN4un4DtcrWwSHOYF6O1yiLvihUQvxXsVh4iXf09cZ7M0ld/mY50hstNssYAEveYA+ppi/kKI77wfpoUGvsjRWmG6ZYrESvUDtcEyKwjtQ6IgtrNcaGEGV8P/ZjtoM9R/+/72TAOFFiVKWpx95sSqqqJWRFFHNPYOklZrn/Tm4vinaWKgcOTMAVNAg0kefgQ/FRJ5c4ehqlBp9VXFR7tCwtwWD6Jy7Jl159U0jrVkROK4WAUvnKVnbFVfyA3sKPC+wFFd+js6QZ+/DnkXP2IHuYUW0iM6L6hYASz0+QL/BYBUlABpQXW6d6Acb09iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqZSqFT8CFDeQnpFOfnBQwDf7upFeJbnnx8Qc1a+zSU=;
 b=oEGBe+39e4C3w/LBBLxz1Ge+UMwQ6qlE1ONYpMlARgc0/2EmYAYxWVL2rSdjQpMruj8UK7AzvvJvFE/AsV7Ihb0jNIoOOMzp9OPqgg0mPkxkQn71MoBJRDuuVH+kFFFWjmzXxmyOsRzWqAPSVuyZS7VAcEgMqMp6/1GZo007sX1vsNRJ6mfl75BSJ2c2eWSFi6Zce0vK0NP6ZMFTRcnG+nZb4EnQvDzs8oUs1uN7pVfFbpwevXFrjnVF840FnjO0EwYXGRXoF82EWiQz6zATOtf1/m2VY924mkyEJr2tz0zJfEMajkCCQnF0KpoqQ/dZR4hkJVWxp5YW3qZtrrUFmg==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB0017.lamprd80.prod.outlook.com (2603:10d6:102:1d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 14:58:16 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:58:16 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 13/28] accel/tcg: Pass down max_cpus to tcg_init
Thread-Topic: [PATCH v3 13/28] accel/tcg: Pass down max_cpus to tcg_init
Thread-Index: AQHXP6pfDwdk7sbdmkyIOH/3JRLSwasL+9og
Date: Wed, 9 Jun 2021 14:58:15 +0000
Message-ID: <CP2PR80MB36688E1A7BA0C96905A114A3DA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-14-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-14-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4cef485e-2829-4057-792f-08d92b5702fe
x-ms-traffictypediagnostic: CP2PR80MB0017:
x-microsoft-antispam-prvs: <CP2PR80MB0017C62E50A024CC65E0680DDA369@CP2PR80MB0017.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lUzKbPSn4yO7VqUctIogNmTwUhhEmKyRRjNKUiK/X7iDFykQkBN2/rmSE0FtA2CQUTYNz6YD5rjp9fuoY+cdcv5u2oEvhy6QRQCoN6Bz8lIXUS/INrckV7MhG32Iy+k9KD5gb4oMyWOIWNYltapzfUNO6sn8Da6WgygBakKkJ/rnIt/PdAeO92TrSqfbbaPgINZzt36phOMd1Z0T9pR8fket1SVtl+bZWLYTwjSDGNhYNsc75k0RqCRLWXCUUNykCZo8KcWbTlpxWy7lzDgxmALCl7T85wWIv9oynWijCB6V048wSU0mLelxuAj8Z1L3k+wv/OX3NVGXZ63tcvRaHjqyfaTb8KxVRg8ocfMjNU1GMnj2Tk+BDMj0swTOIm7NboRFyT+jP2SI28u57mMYigkj9ahmiH822P7Ff+ThTbiOdzncu6TS7qf6JWwCEQ6NBAt6FhB70HwxU/uLrie/97BZqozndqkuMuzwMqz/db96gYBI7ve6vZNWsSfG3WmaChAfamU+c2D7fhXZrESX4eGOdRAnN367qgRrhiP1Sr/10JD/13rA+ibfZ7fzJRuH3VCjH734rorwZTYUB+PbKJqqzSXB6rq0zkcUp1OlnuI7sGk1GKoceV1cE7R84mtNJNZCHF2uS8O7HEcHLwAx1+dRpcPflczXs8eYs+7l4guKJy3NhFKCvGbOd6MVkOKWiqQnsF6P2rOHeD6qx6ffvhUcCY1GTblX0gVvvKvl9/I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(396003)(346002)(136003)(376002)(366004)(122000001)(86362001)(2906002)(26005)(8936002)(55016002)(4744005)(5660300002)(7696005)(33656002)(83380400001)(316002)(186003)(66946007)(66446008)(8676002)(110136005)(64756008)(66556008)(76116006)(66476007)(478600001)(52536014)(4326008)(71200400001)(9686003)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Wkt0aWFWT0pPTjFJTHhaME5xeG9DUmhMVzRhN1JuQ2xSaTBKbVo4WGZwY3JW?=
 =?utf-8?B?alJMV1RGcFJ3T0djUElpT0dEU0lHMnl4ZEo5Z3FFMzAyODhSeXFwNGVrTFE3?=
 =?utf-8?B?OTVSZ2JIRldYYnhhUEkzeHl4bEMrUlZSWVZ2cTJCNVIzZ0c5UXpZRTNSNmxj?=
 =?utf-8?B?MVBIUUQ4bnd3SlZlYTNGcFN4L2lHTCtDTS83bm5KN0pYZHhnSEdDQ1hXTmUr?=
 =?utf-8?B?NUVGMHFneWxhRHpVVFVDdEIrUmZvUFVKN0pGNXg4OE5wdjJwNHEydStxN1Za?=
 =?utf-8?B?aDY2OGJFU3FVTW4wbXBEaWpNU0xGUHJOd05Lb3d2TjdVZEVESDh4Z0lxUUE3?=
 =?utf-8?B?VWpyWTVib0c2RE9oZjdTOFVZMG5veW5vSkU2d2tJeThNcFl2bzBmNTJ0QVNP?=
 =?utf-8?B?T2ROMW1EbUt4eFBFc21MekRVdjRXRUpBWFZVNE9SMnlHenRtWTc5VWVlVGhr?=
 =?utf-8?B?RTc4QnI4dHBqWGQvekxkWHhINkRJT1NoQThDK0VRZjlUZWpkV002NDZGRXk5?=
 =?utf-8?B?TytXVVhRZGx6RkZYNXhIdjBFZkpkL2k1UzI1Z0VxaHZDMi9zc1F2UC9MOGxq?=
 =?utf-8?B?Q3VYYlZwTHh0N0puM2E5Vy9LQlg5OXUzM29YWTNBT2FpeWtTZjI3dnV6a0sv?=
 =?utf-8?B?b3VHNzY1S2lEbEtjOW9tVFpoUjZINUtxOFRYZHF1OWMxNXhwcjRyUXlYTG9o?=
 =?utf-8?B?WnhOWkFxaWJDZkF0TSsrczAvYVptUlJKbXdiaFFGSWJFYTAzTTZPRGpzL3py?=
 =?utf-8?B?bjZvdlZqN2lMMk5PbG9YczUwOFJHWE53RDMwTXFqUFhCbWhCd1ZvZUlYSmFa?=
 =?utf-8?B?SDhZbUs2bEFKbDUyUGNadlU4dzJMVnQ2SnpNQ05zd044WjZ2MmRWSVdCZWpX?=
 =?utf-8?B?VFQwQlg5c2MxRUFONzJycWlGMmp2bHE0cGZ5a09ZRUEwYlAzdmlITm5RRUta?=
 =?utf-8?B?WU42bk4zYTFJYzBqdWtwTjVVYzFHSUlYdVdkczc3eHY2YXlFN3NQZW5rWHZs?=
 =?utf-8?B?c1NqMUNPT3E0RzRTeDBsV2lXRGoyZjdFcDMzdWhpeGJQb1EyL1A5L2Q2SG5R?=
 =?utf-8?B?TXlvTU1QWTJ4b3JWV0E5UzROcHRNU2g1dGIxOURSY21UMk80V2M4eHdoTUZ3?=
 =?utf-8?B?VUUxM3RGaTVkaFFqbHBTZXhQMVZ0MDQ3YTRWZVJ3dk1CV3RDZXF3aUxtcmlQ?=
 =?utf-8?B?S0p6RHlKWGFKUmRwZnRqZUdYelE1YnZCY1hTMjk5SkhRUlMvOU9HeTNQMHBz?=
 =?utf-8?B?SHg2bjJHL2VtOGdnbVhWalc3NHhqUEVkc3dKYjV3K2d0SUFIOGpUZzM4VWwv?=
 =?utf-8?B?Z2Y3ZElLc0JSbEY0RWdnQmhIMlVnL0k2cGpSMHQyOTlYUjdtOWNBYktmRklq?=
 =?utf-8?B?MlBySmlHZWFJTDlzZmF1N0RRNVVKZWt5OXZwMTFHbTJQWHdENEdwUWpnb1Vv?=
 =?utf-8?B?biszdnNINEFVWktKc2dwZjVRVUNia3piYWgvdVpCMXR4QmxUTnVpZGE4czFw?=
 =?utf-8?B?eUMvaEl1YTFCaHpqdk05QWd3N3FHbWNqRWJ2VDhUY3pLZlBsdUgwZ1F2c2JS?=
 =?utf-8?B?VE5mYTNIc3J0NU1EN05uaHFoVU9pRFkxVmEvMXU5aDAvMi95bjU1emdIVlpp?=
 =?utf-8?B?OEhrS2s1L3Q2MFRaU1JNQTNSbHdCSEFGU0l0bkVSSEFINXlxNHlFR1VBQmsw?=
 =?utf-8?B?K3Rqb2xZeEM2QW5rNW1nSlZpeUpiUGlORHNreENIZW5qVmdlL1NJU2JnUkln?=
 =?utf-8?Q?dSlZ1vGttBLkSL56fb74o0y/vraBTIHeiwS9OR8?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cef485e-2829-4057-792f-08d92b5702fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:58:16.0207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pSoF6GqpBkwfTCDocT75C3pwHaDC4EQJdU3ExtafugujD9BxFO/NznWOkTm78uCuGDbecvbOuWjVK5k8Jz4Y7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB0017
Received-SPF: pass client-ip=40.107.80.122;
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
Cc: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IFN0YXJ0IHJlbW92aW5nIHRoZSBpbmNsdWRlIG9mIGh3L2JvYXJkcy5oIGZyb20gdGNnLy4NCj4g
UGFzcyBkb3duIHRoZSBtYXhfY3B1cyB2YWx1ZSBmcm9tIHRjZ19pbml0X21hY2hpbmUsIHdoZXJl
IHdlIGhhdmUgdGhlDQo+IE1hY2hpbmVTdGF0ZSBhbHJlYWR5Lg0KPiANCj4gUmV2aWV3ZWQtYnk6
IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+DQo+IFNpZ25lZC1vZmYt
Ynk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KPiAt
LS0NCj4gIGluY2x1ZGUvdGNnL3RjZy5oICAgfCAgMiArLQ0KPiAgdGNnL2ludGVybmFsLmggICAg
ICB8ICAyICstDQo+ICBhY2NlbC90Y2cvdGNnLWFsbC5jIHwgMTAgKysrKysrKysrLQ0KPiAgdGNn
L3JlZ2lvbi5jICAgICAgICB8IDMyICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
ICB0Y2cvdGNnLmMgICAgICAgICAgIHwgMTAgKysrKy0tLS0tLQ0KPiAgNSBmaWxlcyBjaGFuZ2Vk
LCAyNiBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkNCg0KUmV2aWV3ZWQtYnk6IEx1aXMg
UGlyZXMgPGx1aXMucGlyZXNAZWxkb3JhZG8ub3JnLmJyPg0KDQotLQ0KTHVpcyBQaXJlcw0KSW5z
dGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETw0KQXZpc28gTGVnYWwgLSBEaXNjbGFpbWVyIDxo
dHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

