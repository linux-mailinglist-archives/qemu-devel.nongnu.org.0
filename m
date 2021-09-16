Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE7C40E9CE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 20:26:21 +0200 (CEST)
Received: from localhost ([::1]:58178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQw5U-0000oe-Vo
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 14:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mQw1o-0006e4-Va; Thu, 16 Sep 2021 14:22:33 -0400
Received: from mail-eopbgr820120.outbound.protection.outlook.com
 ([40.107.82.120]:3477 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mQw1m-0005Am-Iz; Thu, 16 Sep 2021 14:22:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcBejwq4obEj561ywtujHl/Wn9LPk9j/diWCNkizPcgDe9GMIPiAI5ttyGXiPuOLHb5JHazgQsYEjbtyh5otC6ZpBh8uDQYOSFEHjdgW8hXAbJ4o93TwklqqBkR8WaeHTaQ/5ni+5y4nEpvnD3SOWhiuT2emjbRWZs/iiIFBoweCLSZmHic/kp4Crj4q9+AEQ/QFQgTiLeI8hkZTXOrrvvgdTrTNGtyri66cuVOrCjM0vebMd0ENwkj8kOskxm3L8tipcSQNYLaBuEymBpcWFUTaHF+Ar26f4eM5ymAKEEkmyWBSSkyBGtAWudrlO2cmlQEj/zHR/3bR15RgpQjn8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=sE/VqjFpUOeOS8Bp0sebERtAd9KPBYXEfYlQE2XuZ7s=;
 b=FKZ/0Dc+DOzDJTl3yqUBMo42YlDp8BjKaAU/xmhqnk4UBAhVR0s7HSeMeS3Kf4MAK5Tb/ymKbqtx97cSFfKU4HeGWYNBMzci7u6zc/lNZ2eKDYo4iMxWKeVuDu0K2A0mV+s2tk/146oZYGGuoQPIe36ghajX8cK0mMJVybgoaVLlGviCF+1uqI1OJFejO2w0GI960t5eVXPJoPAiIMgnAI9MklAMaB3lyWkZ7sXx6GnB34E4RCGMsvqYej/PDJH+F+475SkODkDYJYP/zwOsamm5nTs+wqJ5qD4kb6VMBTx2zNNSqseQFziY74jvATVhWJlLYjRvJ5L8QhIM7om+2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sE/VqjFpUOeOS8Bp0sebERtAd9KPBYXEfYlQE2XuZ7s=;
 b=PszsMzuCMYnVuZCAVIX+XuakVpygmLixipc7hLMhEKUfolMnBJJfSRJrfN4sZ83Z+5WHBAS2iE0xRqgzSRaL/XzDM0U54AQaIWtTPSNLI445UedHwPux29XhWndtPrFEDAyjSp2nkTAGDU0xQy3Y6rWxb9b9smkkStpKiU1rAQ8zJcoYsAKLjV48y7KJhXos3djDUkK8dRVGMkRH64eKYzjOgKxrOGYu23bJElYcuRDHG4jqyS23AavzW+327UwKT3sZuJNMtoDhrOm/90HkboxtbZfSgQxjLrIX6l7B3BNjQNoyP60ZvsGtZBDtdy4Bii85He5oOmoWxi9cTE7tIQ==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB3666.lamprd80.prod.outlook.com (2603:10d6:102:38::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Thu, 16 Sep
 2021 18:22:22 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::506a:7080:4ca3:6c91]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::506a:7080:4ca3:6c91%5]) with mapi id 15.20.4500.019; Thu, 16 Sep 2021
 18:22:21 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: RE: [PATCH v3] target/ppc: Fix 64-bit decrementer
Thread-Topic: [PATCH v3] target/ppc: Fix 64-bit decrementer
Thread-Index: AQHXqwhZI/R4DXJmgka1h1TWuiGAa6um98jw
Date: Thu, 16 Sep 2021 18:22:21 +0000
Message-ID: <CP2PR80MB36680A1BE91AFABE9DD3295BDADC9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210916143710.236489-1-clg@kaod.org>
In-Reply-To: <20210916143710.236489-1-clg@kaod.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=eldorado.org.br;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7bf329b-b3ac-46e6-4068-08d9793eecf4
x-ms-traffictypediagnostic: CP2PR80MB3666:
x-microsoft-antispam-prvs: <CP2PR80MB366670BE14ACC4D61992B0FBDADC9@CP2PR80MB3666.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yiwnNcDAyH3mLMdseMHexVen68fP5pnl0X7K8Wh+4bv2ROdxq+eujx0TPH7adRhT4cZXciPWHb9sY8mxnaQ2gEjlu+WaYVwcFgEk8T35czO4bS3AhBbiU9frsu+y53q4ErkekoQOW/UjpVyivfSwHiLi9m81gPiBGHw7GN2spJa0/HFBF+P+Xx4kyh7dIwcbf/2msw2BBYQL94aaxuRZ40+T0kQIRaFPQfqXOqy/GEYJ9RuT4owwHeZE0HbzETFZ+V7D65pJZeCSXyvzJ1dPyk36DRqK5T+KxQFJbxnm0DZ/dn9MMY6E5eKrE+db9zKOHadTKwACqYlwWw12v1nb2LxMamTakywEq/avcRk1DpZ1wk7w6ZpgnNRXu1XhJyTBBvouqPp91q1C9LPEaa4b23G2hkglfp1+c+WhKDkRnn4UmeYkPMKV8Ajg7SeWBRdFcxKBgUsjdepGDhwjUqun07Dhv4KOoTHEih10PsbL5NTN+q3dIS3RV8SWxe8YLV8RbMMH5LWpEjZxdQrHZ7oqtr2ckq/+i9jQrvMqiGei386d4m19Ve/fB32iT6Q3LRA0zP7yWSgpl73Ku9flUmPtLTEmu51il8YzVspY6eeX5ilMMrvijvFEwTBGDxS3CslwBljMHtaqFzAJR7nAB5kiK57QwxbIzg7MUlYehWqddpL0rJYj4c34TXLb9/YzVU6cxrvXZAwnwvOY7kTZG74nGofu6N9B6iKYn+zuJOkwiXCYx470Dx43DvjVXwv1q5kKxV3F7m31b27ysQiSlNjjjj0HuCTxKrq05ys2FKwV1A0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(136003)(396003)(39850400004)(366004)(2906002)(5660300002)(8936002)(478600001)(316002)(66556008)(66476007)(76116006)(7696005)(64756008)(52536014)(66946007)(38100700002)(33656002)(38070700005)(71200400001)(26005)(122000001)(8676002)(6506007)(4326008)(110136005)(55016002)(54906003)(9686003)(86362001)(66446008)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXBGL0VINWhWc0FGc3E3RGNwQ2Vna2l1RTdjZTF3MFdzbzQ4RDFTQWFPdENk?=
 =?utf-8?B?aGtjemJsZWl5N3Yyc0NuZUNlQlo0bEx3TTB4VXBCVG5YMlRqaUJuQkNYVEx5?=
 =?utf-8?B?WGNvVDNpRExUcFdUVHdKVnBNVXJic3RyK2hDcjdLVnhyZ29tZjl0OTdNSEhW?=
 =?utf-8?B?MnBMZU5jMHFLZTBlRTJGS3JvbWVMdmVHcWxKTnpzYi9QQ1FoK0JzWFNjWkJP?=
 =?utf-8?B?c294K0RiQnM2YUt6Vmt5KzA3QXNKSFlUL0ZpU3doSVYwS0MxTmRld0R3Z0xn?=
 =?utf-8?B?QVk0ZGdVazdlREc4RThrZHJkSDZqSnRRV1lsT3NZaGh3emdlcGhKNXdTbVBK?=
 =?utf-8?B?Sy9IYUNETmtQOG1SOE5DemI4SHFuMHJydUlmT1RaLzg3a1V3eW9WaHRQZ1Nw?=
 =?utf-8?B?QkV1MmxHQ3ZRKyt3a2tCL2s0aUJMR1piYU0ySnNtV3drZ0NOdzVPUy9EQjlR?=
 =?utf-8?B?b0s5UVpjUkFpWEkwbnY2bDNCcDBqL3BUWElHMm1OQWJ4dUkyck9qVXRpNjRq?=
 =?utf-8?B?aTdraFo1UTdERHRjWk4wVVlQcGlibXhHWExmYm43bmhuNUZJUjRmU0JkenlF?=
 =?utf-8?B?cHJDWE16eWl2aHlRQ2ZSOVdDU0c0UFNxRDlITC9sTWd5dzlvSHRqY2FjZTZj?=
 =?utf-8?B?QXZHVGlmRHFFSCtodlZUREtQQ2JmdnlRYi9hYitJdEUwZzFKdzJSZVVSNkZx?=
 =?utf-8?B?YjJZb2xPSyszS1NLUFhZWXlkNzhPNVN3VHp4RWdyTlJyR29iSGJIcjROaU9M?=
 =?utf-8?B?eG1xVThGenQySEYzNUE2amtBVFpJdGhrbnJMMGliM0xRSTR4dWl2N2ljQm9V?=
 =?utf-8?B?OHRCTGgySGM0Z2JmQXFXQ0dZUWhmczJpQWxDL1IzcDhhY0RqdWNrMTBta0pJ?=
 =?utf-8?B?UXJFT0JtY3VtWWxwd0QyUGl5YkM2U2lFUFduN0VNcE8rVjd6K2dLdVhTZnRz?=
 =?utf-8?B?KzN6V3hlUE9mbkl5SXhJb1Qycm1raFI2akZaZWcrcGlzcDIzekpCRXRmVndx?=
 =?utf-8?B?M3V1VDBGL3M3UFZPL3l1L0hOcnd3Smp6NGFWYTd1K2RLT1dHZmdKR3FlM0NS?=
 =?utf-8?B?YWVSSjhXZnVvTVZqbk5QRlpscFRma0FZeWYwbE9jdjZ6aWY5TUt0YVV2Um9o?=
 =?utf-8?B?NWRCbUU1c3hIQ01CYjcvOFk3aDM0SW1jem8wNlNlZzJ4VnJFa1V0Z1lWUmdQ?=
 =?utf-8?B?WHRYbFVvQ1dQODIxNGZwcWU5QUcxYkRWU0J0UVlnUFFTSFM3dmcrQ0NHZzZu?=
 =?utf-8?B?L0xyQ042WFpLdnRjZmhzTDhTaHJ5UU1ydllCUVo2azk4WjVDSVlnV2hsVllP?=
 =?utf-8?B?UFlPVVpDN3RFT0wrN2ZnM2l0bHlVZU5pbXcranJjZ1VHQ1o1TUVNMTg1eGoy?=
 =?utf-8?B?ODVVSTk0Nkl2YWNuaDdId2UyODBpKzBDVUxRZXU2RFhFRmhKbmxXOHlMZ0lj?=
 =?utf-8?B?VUZ6SXJESGl3bkMwdlJDRnhhNms0aWpmcmxXYWNEOFFlMmZmbGt2Tk9pY1pS?=
 =?utf-8?B?cEkvaEZrOVdZMGQrQlN6dGVpMjhmalhaclN1bXVPcXlRZ1dhbUpIaTNzbnZL?=
 =?utf-8?B?Y2FWZ3NRbmZSbmpTRUV3b2hvUFBNYnRUQm04SCtyblBpeE9CVWZ1SkFBaVpo?=
 =?utf-8?B?eVJtbXJMMjVUckwvaWlxblYwOWVZY3BCaVNLWUlVbTdJSkpJWUd2MVYxencw?=
 =?utf-8?B?Y3hTbi94azEyT3VWM2x0QTgxeGpIQUVaZHpaQUNZMERSamdVeHRHaXRsYmIr?=
 =?utf-8?Q?nDo6gICq/zHLfYkEomxIukucPJyKsGSiYxcG79u?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7bf329b-b3ac-46e6-4068-08d9793eecf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2021 18:22:21.8320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hEBxo5shDswprCY/C9Ry2dhc+6NkSXva0Tp0LcXBlgCVsgZfKjGj+KTmSiPH3tRSfYnlEkBe3epxp6K22MZtuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3666
Received-SPF: pass client-ip=40.107.82.120;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-SN1-obe.outbound.protection.outlook.com
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgQ8OpZHJpYywNCg0KVGhlc2UgY2hhbmdlcyBsb29rIGdvb2QgYW5kIHNlZW0gdG8gcmVwbGlj
YXRlIHRoZSBleGFjdCBiZWhhdmlvciB3ZSBoYWQgYmVmb3JlLCB3aGlsZSBmaXhpbmcgdGhlIDY0
LWJpdCBkZWMgZnJvbSBNaWNyb1dhdHQuDQoNCkEgZmV3IG5vdGVzLCBpbiBjYXNlIHRoZXkgaGVs
cCBvdGhlcnMsIHRvbzoNCg0KQWNjb3JkaW5nIHRvIHRoZSBQb3dlciBJU0E6DQogIFdoZW4gbm90
IGluIExhcmdlIERlY3JlbWVudGVyIG1vZGU6DQogICAgLSB0aGUgbWF4aW11bSBwb3NpdGl2ZSB2
YWx1ZSBmb3IgdGhlIGRlY3JlbWVudGVyIGlzIHRoZSBtYXhpbXVtIHBvc3NpYmxlIHNpZ25lZCAz
Mi1iaXQgaW50ICgyXjMxIC0gMSkNCiAgICAtIHRoZSBtaW5pbXVtIHBvc3NpYmxlIHZhbHVlIGZv
ciB0aGUgZGVjcmVtZW50ZXIgaXMgMHgwMDAwMDAwMEZGRkZGRkZGDQogIFdoZW4gaW4gTGFyZ2Ug
RGVjcmVtZW50ZXIgbW9kZToNCiAgICAtIHRoZSBtYXhpbXVtIHBvc2l0aXZlIHZhbHVlIGZvciB0
aGUgZGVjcmVtZW50ZXIgaXMgMl4obnJfYml0cyAtIDEpIC0gMQ0KICAgIC0gdGhlIG1pbmltdW0g
cG9zc2libGUgdmFsdWUgZm9yIHRoZSBkZWNyZW1lbnRlciBpcyAweEZGRkZGRkZGRkZGRkZGRkYN
Cg0KQW5kIHRoZSBkZWNyZW1lbnRlciBpcyBkZWNyZW1lbnRlZCB1bnRpbCBpdHMgdmFsdWUgYmVj
b21lcyAwLCBhbmQgdGhlbiBvbmNlIG1vcmUsIHRvIHRoZSBtaW5pbXVtIHBvc3NpYmxlIHZhbHVl
ICgweDAwMDAwMDAwRkZGRkZGRkYgb3IgMHhGRkZGRkZGRkZGRkZGRkZGLCBkZXBlbmRpbmcgb24g
dGhlIExhcmdlIERlY3JlbWVudGVyIG1vZGUpLg0KDQpGcm9tIHdoYXQgSSB1bmRlcnN0b29kIGZy
b20gdGhlIGNvZGUsIHRoZSAnZGVjcicgdmFsdWUgcGFzc2VkIHRvIF9fY3B1X3BwY19zdG9yZV9k
ZWNyIGlzIHRoZSB2YWx1ZSBvZiBERUNSIGJlZm9yZSB0aGUgY2hhbmdlLCBhbmQgJ3ZhbHVlJyBp
cyB0aGUgbmV3IG9uZS4NCg0KTm93LCBiYWNrIHRvIHRoZSBjb2RlLi4uIDopDQoNCj4gKyAgICB0
YXJnZXRfbG9uZyBzaWduZWRfdmFsdWU7DQo+ICsgICAgdGFyZ2V0X2xvbmcgc2lnbmVkX2RlY3I7
DQoNClNpbmNlIHRoZXNlIHZhbHVlcyB3aWxsIGJlIHRoZSByZXN1bHRzIG9mIHNleHRyYWN0NjQs
IGl0J3MgcHJvYmFibHkgYmV0dGVyIHRvIGRlZmluZSB0aGVtIGFzIGludDY0X3QuDQoNCj4gICAg
ICBMT0dfVEIoIiVzOiAiIFRBUkdFVF9GTVRfbHggIiA9PiAiIFRBUkdFVF9GTVRfbHggIlxuIiwg
X19mdW5jX18sDQo+IC0gICAgICAgICAgICAgICAgZGVjciwgdmFsdWUpOw0KPiArICAgICAgICAg
ICAgICAgIGRlY3IsIHNpZ25lZF92YWx1ZSk7DQoNCldoaWxlIHRoaXMgcmVwcm9kdWNlcyB0aGUg
YmVoYXZpb3Igd2UgcHJldmlvdXNseSBoYWQsIEkgdGhpbmsgaXQgd291bGQgYmUgbW9yZSBjb25z
aXN0ZW50IGlmIHdlIGxvZ2dlZCB3aGF0IHdlIGhhZCBiZWZvcmUgdGhlIHNpZ24tZXh0ZW5zaW9u
ICgndmFsdWUnIGluc3RlYWQgb2YgJ3NpZ25lZF92YWx1ZScpLiBBbmQgJ2RlY3InIGlzIG9rYXks
IHdoaWNoIGlzIGFsc28gbm90IHNpZ24tZXh0ZW5kZWQuDQoNCj4gfHwNCj4gKyAgICAgICAgKCh0
Yl9lbnYtPmZsYWdzICYgUFBDX0RFQ1JfVU5ERVJGTE9XX1RSSUdHRVJFRCkgJiYgc2lnbmVkX3Zh
bHVlDQo+IDwgMA0KPiArICAgICAgICAgICYmIHNpZ25lZF9kZWNyID49IDApKSB7DQoNClRoZSAn
c2lnbmVkX2RlY3IgPj0gMCcgaXMgb2suIEl0IGNhdGNoZXMgdGhlIGNhc2Ugd2hlcmUgdGhlIHBy
ZXZpb3VzIHZhbHVlIChub3cgc2lnbi1leHRlbmRlZCBhcyBzaWduZWRfZGVjcikgd2FzID49IDAg
YW5kIHdlIHNpZ25lZF92YWx1ZSBqdXN0IGdvdCBuZWdhdGl2ZSAod2hpY2ggc2hvdWxkIGJlIGV4
YWN0bHkgMHhGRkZGRkZGRkZGRkZGRiwgYWZ0ZXIgYmVpbmcgc2lnbi1leHRlbmRlZCB0byA2NCBi
aXRzKS4NCg0KT25lIHBvaW50IHRoYXQgSSBmb3VuZCBvZGQsIGJ1dCBub3QgZGlyZWN0bHkgcmVs
YXRlZCB0byB5b3VyIHBhdGNoLCBpcyB0aGUgaW1wbGVtZW50YXRpb24gb2YgX2NwdV9wcGNfbG9h
ZF9kZWNyOg0KDQpzdGF0aWMgaW5saW5lIGludDY0X3QgX2NwdV9wcGNfbG9hZF9kZWNyKENQVVBQ
Q1N0YXRlICplbnYsIHVpbnQ2NF90IG5leHQpDQp7DQogICAgcHBjX3RiX3QgKnRiX2VudiA9IGVu
di0+dGJfZW52Ow0KICAgIGludDY0X3QgZGVjciwgZGlmZjsNCg0KICAgIGRpZmYgPSBuZXh0IC0g
cWVtdV9jbG9ja19nZXRfbnMoUUVNVV9DTE9DS19WSVJUVUFMKTsNCiAgICBpZiAoZGlmZiA+PSAw
KSB7DQogICAgICAgIGRlY3IgPSBtdWxkaXY2NChkaWZmLCB0Yl9lbnYtPmRlY3JfZnJlcSwgTkFO
T1NFQ09ORFNfUEVSX1NFQ09ORCk7DQogICAgfSBlbHNlIGlmICh0Yl9lbnYtPmZsYWdzICYgUFBD
X1RJTUVSX0JPT0tFKSB7DQogICAgICAgIGRlY3IgPSAwOw0KICAgIH0gIGVsc2Ugew0KICAgICAg
ICBkZWNyID0gLW11bGRpdjY0KC1kaWZmLCB0Yl9lbnYtPmRlY3JfZnJlcSwgTkFOT1NFQ09ORFNf
UEVSX1NFQ09ORCk7DQogICAgfQ0KICAgIExPR19UQigiJXM6ICUwMTYiIFBSSXg2NCAiXG4iLCBf
X2Z1bmNfXywgZGVjcik7DQoNCiAgICByZXR1cm4gZGVjcjsNCn0NCg0KVGhlIGRpZmYgPCAwIGNh
c2U6DQogICAgICAgIGRlY3IgPSAtbXVsZGl2NjQoLWRpZmYsIHRiX2Vudi0+ZGVjcl9mcmVxLCBO
QU5PU0VDT05EU19QRVJfU0VDT05EKTsNCnNob3VsZCBwcm9iYWJseSBqdXN0IGJlOg0KICAgICAg
ICBkZWNyID0gLTE7DQp0byBjb21wbHkgd2l0aCB0aGUgbWluaW11bSBwb3NzaWJsZSB2YWx1ZXMg
c3BlY2lmaWVkIGJ5IHRoZSBJU0EuDQpCdXQsIGFnYWluLCB0aGlzIGRvZXNuJ3QgaW1wYWN0IHlv
dXIgcGF0Y2ggZGlyZWN0bHkuDQoNCkFuZCBhbHNvOg0KUmV2aWV3ZWQtYnk6IEx1aXMgUGlyZXMg
PGx1aXMucGlyZXNAZWxkb3JhZG8ub3JnLmJyPg0KDQotLQ0KTHVpcyBQaXJlcw0KSW5zdGl0dXRv
IGRlIFBlc3F1aXNhcyBFTERPUkFETw0KQXZpc28gTGVnYWwgLSBEaXNjbGFpbWVyIDxodHRwczov
L3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

