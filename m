Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBB93FF563
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 23:11:29 +0200 (CEST)
Received: from localhost ([::1]:41600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLtzc-0006YQ-BF
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 17:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mLtwG-00030N-U8; Thu, 02 Sep 2021 17:08:01 -0400
Received: from mail-dm3nam07on2135.outbound.protection.outlook.com
 ([40.107.95.135]:23808 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mLtwF-0001j8-9f; Thu, 02 Sep 2021 17:08:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDYd8+w8JTgJARJB7KXXyIb3qX0Xv5JG3WEIkWVnPYOjhWPG3ohFpvK5uD01xEJVDlIG274MYFKQ743zbwIfbrvAMmbBp4iq5wpvfRVR1IncDzSI/99bohPgH4yGYrwJX2q/uABBRT/0jTW0QLY9lZrylUziSa3/yS/7wSBIK41TpTeOjYRlBNG6phORCulJNwKipY92sawZYTCsF7TsfbjB1I53eXkpB97X+zyYFQLdik8RgI5Mnsw4wH8JDaSfPTlLaeYhBogMXIowq1eu0gTw+10UoG6io5oo6qNh4X0LWuEaCNCnJVHpAjMtuXgc2FaAVWhkgsjxnXaobgbNUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=r/D5QbI9DY3HsdKX3B5nZq38a7rqXBtyNYpgg9d1aag=;
 b=idsmwb2hUoRDzpFMZNsshW8bGtyaQAJNA8L5dpjL/puzLoD3QPOAmCmGKTTKE39729n7WK+EzDfW123zPjM7wEGhENfMNdFULs5isnNrj/AWIJuvF/bCcUWJ1c97vS6BQBg6P+UmwXQ+YFq6M5/fB/vRid2bTJO7LgKASmVdhk/XL7qyRWwbx6HJaV+7klN+zwW+92vG25smiMHjuA/s5wKyZYqDn2gsWi+OMLTK4i2ol0+suZ3TfbrzyVPINRCbFGxCj9n2T8sBpTWSNb9pgKqkcrtUXMoQBgpd7EopTR6CZw70Vxm4X3rLWIgPRX4MehQVPG51tngYqhoGhHrYGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/D5QbI9DY3HsdKX3B5nZq38a7rqXBtyNYpgg9d1aag=;
 b=oG9bT4DqjJjQFMy7dK4RFX30uGTpojDMon7v1YxXL1Z4+RtVvtHoakupJDqr8XUjgU/EVwta7/Pae66Rzf3mINl4xGQIbg/A6P32EV4OVWevATzxCtZCaMGiQe0LksUKpAI/dJfwowGEsSgcdZSxFNGSPo+LKRuIysvkqQ2EbxirCapymhZAj7bOuRM5MMz0eyNBP9VbrBVC3LE3zIvurnH44lMG3qRnIaLdOEGCk6xHKA+uaPuzgxNdHTl615tpfmVf+YKQigkv5l3A/Z6R532V1mpW4TfItDErNS1P4zKvxagg9L30OZE3iRbolewPwMvcb8G6l0d1ZzOyfn55WQ==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP0PR80MB4850.lamprd80.prod.outlook.com (2603:10d6:103:21::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Thu, 2 Sep
 2021 21:07:52 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::9c41:722:8b7b:8a76]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::9c41:722:8b7b:8a76%5]) with mapi id 15.20.4457.026; Thu, 2 Sep 2021
 21:07:52 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
Subject: RE: [PATCH v2 04/19] host-utils: add 128-bit quotient support to
 divu128/divs128
Thread-Topic: [PATCH v2 04/19] host-utils: add 128-bit quotient support to
 divu128/divs128
Thread-Index: AQHXnodNE5+lYtGXkEG2Cu0t8OYr46uN5sIAgANUuEA=
Date: Thu, 2 Sep 2021 21:07:51 +0000
Message-ID: <CP2PR80MB36682CDF56098C1E9DE99437DACE9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
 <20210831164007.297781-5-luis.pires@eldorado.org.br>
 <c6a29b77-1187-a06b-6c2e-ede5dc8a1037@linaro.org>
In-Reply-To: <c6a29b77-1187-a06b-6c2e-ede5dc8a1037@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbb1ad50-9698-4e46-451a-08d96e55b9ed
x-ms-traffictypediagnostic: CP0PR80MB4850:
x-microsoft-antispam-prvs: <CP0PR80MB485021D354D4FE4C3893A920DACE9@CP0PR80MB4850.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ggimZOdnjEN255frLowCV1Prh5eOoA7+sHOCK84tyuXZFCVQ8annzyJgAzyiu0mIgjV13ljAb8KRVppoy1QKYmCyRsEGbO6UHsY/iKAhQRXAVYVnfDs07JMwINqCCnXNLQcSuyEP2I7n9JYYS5QjV3pdYZdb8X+Jyn+Dr/COB7k/RoA4NJ8WE8ULGTdiWgccFk9ZsHqV9WuHHRNQNcSiW4ebj89B7J8IijzR176liS4uOjKgegmUsb6LMk80zf42ZLzliQ+xeGHMF32LGgwc20H//acaSu0GxiHABmSe2MQmDpd1kkQsKBdpLl7DEwB7iIciVuT6WwiEDl7ezbXhjblbjsyUZfacXIJ1z8vXVQRwS0WHly85AbQN0Q5i45seeSv4fQTgwJnIZv7eMyEdfVCxZEN8OYwRftOMbqSuW513DU98wiEnFIR8v46M3LpYVwJNcFgy01mBre/1HVTQEkjGXTVKdjuVdBNgEWRMEiA+RALsIK5jdrtL9d/FNLsU8ykBwQE3iuWZGELnr9cyYqM+x/sz31JzsVcqhcMGx8b+Ni6JRD/fX49CbQVG2KayQ601lcIy1QTeipaL9k5keR4i0SyjfmNeJaFK8/cQeuX5eKRf+XB97c165KwgDkgwcai7FEAZw6klgGsSdMd9CtPFAEpxWnKscpep1jxc3I4+FINFgeu9AjP3ADbVV31Ww16IPuHpsE56/hhZfx+ntgi++mCmRBgBRUhFAmdsvUTcLVYRIL+pq6fBYdsTGrlrNILj3RUEaQIk7dJydWae9v/qcJmUdkjsIyMtJEEF4+U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(54906003)(2906002)(55016002)(9686003)(508600001)(52536014)(7696005)(110136005)(316002)(4326008)(5660300002)(33656002)(86362001)(71200400001)(66946007)(76116006)(66476007)(66556008)(64756008)(66446008)(8936002)(38100700002)(186003)(38070700005)(26005)(6506007)(122000001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzkzdU1Uei9MUm5jQWU5Q0dJS2tuUWFsOUpReXp6OUEzdjYraE02T0hzWGtx?=
 =?utf-8?B?RGxKY0ZmMHNxd1lBWDl2R3ZtQTljWHJqZW0rbWFoeG5GVXlUNEZ2Y2NmZFhJ?=
 =?utf-8?B?WHREN0RXSW9JTlZGVDZxcTNqNGw1cTVkS29JbVQxT0Fsei9iVW95bU8yaHRX?=
 =?utf-8?B?dWRFRmJIUjgxckVmaGp4eXdaQXFLWllNQTVZM0J6b1lPMVhFYTY4RTVDZDgv?=
 =?utf-8?B?dlZDOENSL2p2cmU2RzRNSGF0Rnd2YUVRcndVM1Jscjl5YjNBWFJMdUQxNy9O?=
 =?utf-8?B?ZnBBUFBBNDhlWlZFbGZQRG9QUTVSdkhiNWRoM1FVc0xudWlpZWhoMGk4VzFi?=
 =?utf-8?B?TTVJWDlGalh1TVFRcVZTZHpESFlSWURoQ0ppa3BkM01rdEMzSEFXcEFucGxr?=
 =?utf-8?B?WW1Ba2poV2dBOFhDTFZESGN1WUFzMVRuVGxXeW8zNDFHTGM3YzA2Z0tlNXFM?=
 =?utf-8?B?QUVDbU9RSVpHTmZydGpMeHF6OTcrYVdYeGxNdm80VENDSHdnNU50akMycU9G?=
 =?utf-8?B?SWdUVGJqcXFDWEp5OTdPSmFoamZ4dnUxOWd6QlRaVnBLbkRqeE1NUFRHbzlD?=
 =?utf-8?B?cVpRRng0aWt5eHh0SUxGQzB4dmV0WFlpWUZ0ck13dXRSV25NbXEyZ0IxTDZx?=
 =?utf-8?B?dHkwck0xVHoxZFhWWHRsK01zNWFwVlBRZVYxd2RWWnVMTFRFemE0d3dHYkpC?=
 =?utf-8?B?SXEvcFoxOWZXUVdyT3ptRldlWG5ZVjBPZzhkcVVLelFWRUlsRDg0QW9kbHVh?=
 =?utf-8?B?Z1RZbTRzTmRINE1LM08zUnVqTHFBbVk0V1NLTDF0eHcreUdTeGlRbzN1V1ZO?=
 =?utf-8?B?NHZDNjg0T0p0K0VYTHFvQWpYd0NlMkxmQjBwM2RCN2x5WTZtR2NHeTVIVXZ2?=
 =?utf-8?B?MEd1SDVtRmxZTmc2UEdLNHNIaW40MW1HRkhxKzltVGpsSXRiczhoeW1PNWlz?=
 =?utf-8?B?eEZYVnNmVW9LN2c5OHdoSUF3TTluQXduZzQ1RUNISTNvNENaWTA0Q0R5WDc5?=
 =?utf-8?B?WGMrTXY4RzdUQ0hPK21iamFXY1JidzN1dHJ3dXJYRDd0bWd4UC94TTU0VUNP?=
 =?utf-8?B?Q0lKZVhOcXVGNDR3VWdpQk5OMkU0TC9qOUpYRUJ4VnhxSkc4dnFUVFI5b3FV?=
 =?utf-8?B?Z3ZvZ2Nsb0JpaVJ3WXA3cWRuNEVhTytOOExNcmd0Q0VCRkxuVkI5Y0pMa1hL?=
 =?utf-8?B?clV2bU1abHJkbnlvK3V3QmtJMVJ1b1liQ1BqeUszeVVhbkprTVp2U1FuWXRl?=
 =?utf-8?B?ZjNpSnJDcy9iZm0xaWUyZ2grdTdCKzFqWnBxeVdpV3dBQjFDbW1VQnBXejNP?=
 =?utf-8?B?dzhQcjhKRzJNQ3AyUEY4MmErdVAyRDlieXFUS0o4WjF0T1VSMVQ0N0U4NE4z?=
 =?utf-8?B?ZE41UDZyZDFxUFBXaTF4SEZrMXhwU1BmeXdITEkwamdZUW1NM0xXOTVKaUxh?=
 =?utf-8?B?cmRjVWVFRGVQdmsrSjY5czdBY0dCdWh4Z0JrWUZDZFNqSE0rbkN3NERDUHJm?=
 =?utf-8?B?Q21CcTdDMERhSktGempIcVh2NmV6akhCM2MvMVBxbzdhNWdWYU5lc2Z6bnFr?=
 =?utf-8?B?eWlwakY1WGE1d01uL2Q4UXAxbUhJRHAzQlcxUWUzMmliTndiY1kzTWcxVDFx?=
 =?utf-8?B?dHpaMUl5NU1veW9PRWZRTnVqOVhRT1htaFE4NFZ4cXlKUjZxcTlvRVRlSFdT?=
 =?utf-8?B?UldIMEtkUGRWSnZHT3JmWllGV2dNVFNrUnZGaUV4M2FLR3NxNFZqTGk2Njha?=
 =?utf-8?Q?GzvXn0Wt7G4AcqFil9uF1hA6lkIvpA8DPa+IIC0?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb1ad50-9698-4e46-451a-08d96e55b9ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2021 21:07:51.9486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +HcKX1+t3PKyZ6Bv0X/kAc5nfIx+tLCg6BWtlLNequlD5O6VXxRxxGK3c6PTPSdRpF7IZOgme+aFpv6chNG+qA==
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
IEhtbS4gIEknbGwgbm90ZSB0aGF0IHdlIGhhdmUgYSBiZXR0ZXIgZGl2bW9kIHByaW1pdGl2ZSBp
biB0cmVlLCBidXQgd2UgYXJlbid0DQo+IHVzaW5nIGl0DQo+IGhlcmU6IHVkaXZfcXJubmQgaW4g
aW5jbHVkZS9mcHUvc29mdGZsb2F0LW1hY3Jvcy5oLg0KDQpHb29kIHRvIGtub3chIEknbGwgY2hh
bmdlIHRvIGEgKG11Y2ggc2ltcGxlcikgaW1wbGVtZW50YXRpb24gdXNpbmcgdWRpdl9xcm5uZC4N
CkFueSBwb2ludGVycyBvbiB3aGF0IHdvdWxkIGJlIGEgZ29vZCBwbGFjZSB0byBwdXQgdWRpdl9x
cm5uZCwgc28gaXQgY2FuIGJlIHVzZWQgYnkgc29mdGxvYXQuYyBhbmQgaG9zdC11dGlscy5jPyBX
b3VsZCBob3N0LXV0aWxzLmggYmUgb2s/DQoNCj4gR2l2ZW4gdGhhdCBub25lIG9mIHRoZSBleGlz
dGluZyB1c2VzIHJlcXVpcmUgdGhlIGhpZ2ggcGFydCwgc2hvdWxkIHdlIGJlIGNyZWF0aW5nDQo+
IGEgbmV3IGludGVyZmFjZT8gIFRoZSBidWcgeW91IGhpZ2hsaWdodCB3cnQgdHJ1bmNhdGlvbiBj
b3VsZCBiZSBmaXhlZCBzZXBhcmF0ZWx5Lg0KDQpBbHRob3VnaCBpdCBkb2VzIGZpeCB0aGUgYnVn
LCB0aGUgbW90aXZhdGlvbiBmb3IgdGhlIG5ldyBpbnRlcmZhY2UgaXMgbm90IHJlYWxseSB0aGF0
IGJ1Zy4gSSB3YW50ZWQgYSAxMjgtYml0IGRpdmlzaW9uIHRoYXQgY291bGQgcmV0dXJuIHF1b3Rp
ZW50cyBsYXJnZXIgdGhhbiA2NC1iaXQsIHNvIEkgY291bGQgdXNlIGl0IGluIGRlY051bWJlckZy
b21bVV1JbnQxMjgsIGludHJvZHVjZWQgaW4gdGhlIG5leHQgY29tbWl0Lg0KDQo+ID4gLXZvaWQg
ZGl2czEyOChpbnQ2NF90ICpwbG93LCBpbnQ2NF90ICpwaGlnaCwgaW50NjRfdCBkaXZpc29yKQ0K
PiA+ICt2b2lkIGRpdnMxMjgodWludDY0X3QgKnBsb3csIGludDY0X3QgKnBoaWdoLCBpbnQ2NF90
ICpwcmVtLCBpbnQ2NF90DQo+ID4gK2Rpdmlzb3IpDQo+ID4gICB7DQo+ID4gLSAgICBpbnQgc2du
X2R2ZG5kID0gKnBoaWdoIDwgMDsNCj4gPiAtICAgIGludCBzZ25fZGl2c3IgPSBkaXZpc29yIDwg
MDsNCj4gPiArICAgIGludCBuZWdfcXVvdGllbnQgPSAwLCBuZWdfcmVtYWluZGVyID0gMDsNCj4g
DQo+IFlvdSBtaWdodCBhcyB3ZWxsIHVzZSBib29sLg0KDQpTdXJlLCB3aWxsIGRvLg0KDQotLQ0K
THVpcyBQaXJlcw0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETw0KQXZpc28gTGVnYWwg
LSBEaXNjbGFpbWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1s
Pg0K

