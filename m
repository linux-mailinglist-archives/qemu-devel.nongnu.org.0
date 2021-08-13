Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38CC3EB730
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 16:58:58 +0200 (CEST)
Received: from localhost ([::1]:53390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEYe9-0000CR-GK
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 10:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mEYdC-0007xy-FD
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 10:57:58 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:45229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mEYdA-00075L-DL
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 10:57:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1628866676; x=1629471476;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n5dbBvtJTU2KPEMFbOUv1DHI0FEP4sWihjOb57p3VX0=;
 b=oCxb88S2bwkY8Lek12rikeul5mRILPIpSAlFpSQ3KYGA1a5QfRXNjWZN
 lcz+ZX9+Pyo2CYp1O02JYxxLq0iaam/1oPMyOMSEHnL0cEU5/nnIYTcD3
 sWOMCJZUaqFwJ7YIifpNqeaRU2AzEGMttD92dURnXVMekjptNxNQYRxpJ Q=;
Received: from mail-sn1anam02lp2048.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.48])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 14:57:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbxlz61XxjnLaSF340ZbtaJqjlRkJuhtgUwyZN3mOjbP5HqTd4QlTgpTswpJztJcrZEu6EmZ7wgDhopfwyeqRGy4cRK4j+8lgtwB9y/NciD4DnZM4ABtm0NbB7EGJHCBorVAip2G6+HjE7X3Ze0C7AUq28XkFwu5lCpJ+wX/28WzhkcKaOgw6qJ0Xy15aygpm+2ztLkA8nzu28cIj89KG39Yr17qi0EQBvail5tyl9FbAJ65+sv1uvKiDoLsCBFMAEdEr0aToQaGprmiuCGHmPvHO3am91o+XRYDhvVI0QL7cGbn5sootBG2dPUWYAew5oaQi5PuQFVP5Qn5OJ4zUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5dbBvtJTU2KPEMFbOUv1DHI0FEP4sWihjOb57p3VX0=;
 b=c2le5h/XDJJIktaGHX0FSOqMsyPoW82vzcG8ThQ+YUMbqzv4LfcEGlKNKDzC5Exzu/kpGvIu1Y7I+fVKN6wxmaqYw1hUPbZ1ySjgUSq0Nh9742XWlcDOHiBgmYtCSSEhXCGYxHu6de3PV9mk31vE1vG/ltgYzbtyb0Q4yC/j7T7tlotZ/XDN3XSqWvgmhMDcVegDUak11t3bRuNmvpdjotlKxOdjUl4XXgM2L+IgG8HE1QCFsJAPa8QhcuyApHaZ8kFFpj6KamP4wOsoi3/oNX7fBnWAQyfoWj2XOEqM02E/e/aAzSJ1aX7njGUqSrMWLeeaqOBe0/IiS93YPYQn+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (52.135.234.160) by
 BY5PR02MB6788.namprd02.prod.outlook.com (52.135.52.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17; Fri, 13 Aug 2021 14:57:51 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5%6]) with mapi id 15.20.4394.023; Fri, 13 Aug 2021
 14:57:51 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PULL 0/1] Hexagon (disas/hexagon) fix memory leak for early exit
Thread-Topic: [PULL 0/1] Hexagon (disas/hexagon) fix memory leak for early exit
Thread-Index: AQHXj/Bl6HGw/70qtkKNn15NBcMSw6txKS+AgABd27A=
Date: Fri, 13 Aug 2021 14:57:51 +0000
Message-ID: <BYAPR02MB4886DD6C4FE1414AC3BA40E3DEFA9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1628824050-15249-1-git-send-email-tsimpson@quicinc.com>
 <CAFEAcA9s7FC13r8mZEdE+Y4X1ZofMd37x7m=7TDL-BK_HR_SqA@mail.gmail.com>
In-Reply-To: <CAFEAcA9s7FC13r8mZEdE+Y4X1ZofMd37x7m=7TDL-BK_HR_SqA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 577ba69d-1dee-4957-c065-08d95e6ab925
x-ms-traffictypediagnostic: BY5PR02MB6788:
x-microsoft-antispam-prvs: <BY5PR02MB6788051D34627C6C477E92C2DEFA9@BY5PR02MB6788.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vqP63JNIEOafac1/6CuT6Bsi4QcLs+THzQN8KGxXfPKHh/A4Loay5m7ELH/vuDypQvv7zuROb5I9oNvlbTi7qW8HzvoQTuBJXC/7cm9mriFu5pRo2ugC/B3Lc2USWmO92hnZWs38yvPsV0nKkByQBYreZLccEDX1iSWo8sX0ZVfQdyMBKEVF8Cezryo/nAFFN4zb3Sisgd2Uk9M7cDXXxvycj6vKyN+X3k3CJf9NYxCd1zpD9t6yHR0WhYi7CLZSZqicIPSrmnCli8mG9OlGMe/WZ+tzSsSd3GyzvCEdGonyAYV2ETWiZYzi7r9xLZqcoaAhNE15vwFt7RZUhn7lQoNplTdTsVfAjmLzHopOBEXpGaoN9cUY67NUHPd/Gz7FPR+j36H6Zt18Am4zNDw5w92By7pwJBUaoxPs0OTO9ht5OjjCgfRfHgJg9k7mnX/hP9js4zr6Hwmne7dRbRoepxRibhF6t2C/ZyYe6zr6eyhcP09eRE4oGkFnJtB1FPwaIdNWY4aGN4jm8+Yl9acKPZ2MxMpVCO5YdtcZeYlscXgu/KpBLUpzqOvedOUb52z7iY14vNlZSOYo20AbYdTIX4x0mGFthb9Wh4Mw1M307CIgYGLIE32TU1uAa3nikoFZwk9WMq0mWjsRXKm5Wh+WNBU6OK0jCceJye/YVl3cRexfxJwbYy/H0MC/3+Xap4G14Y+UyDa6BXt5di5djHq7CQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(53546011)(186003)(8936002)(33656002)(6506007)(122000001)(54906003)(71200400001)(38100700002)(83380400001)(26005)(38070700005)(316002)(5660300002)(7696005)(6916009)(8676002)(508600001)(4744005)(76116006)(9686003)(86362001)(66946007)(66476007)(64756008)(66446008)(66556008)(55016002)(4326008)(52536014)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0dGRDVxWmVjZ1FXZUE2bVhQZk9wK1lWcFVRVG9ScUV0UmJLVWRhdDNwbS9n?=
 =?utf-8?B?cHBBOVZ2dGhtUVIyZjc2ZFN4b3Z3dnFoRTR1MWVRWHptVVpYaEZTOEJDOGxz?=
 =?utf-8?B?M0d1WkcwZ1kvU3RHN0dqZTJtQ2FoenIvZWtWSWE2b2FwenN4UmdxMkZmZ0tN?=
 =?utf-8?B?cEsxejZKd0RlQjdYeHdrNkllOUVaM2EreWx2ZUU4N1dDUzRMYTRES1V3ZlFL?=
 =?utf-8?B?bU04QStoUHdwOG1RUVplZGFpOVNOYlVMTGJMcC9IZFA4NjFEVTd0L3BMdVl2?=
 =?utf-8?B?aS9NdWtxVTRaOUFhcXgwZGxlQ3BOK0tGVzdZR3RkVkVJVHhXVVZGZE1wOWZW?=
 =?utf-8?B?WlFBNXBlUHo1ODA0aFhGZFBoaTBOL0R5bkc5bzVtcm9ZN2FuSzVOcWJOY1BJ?=
 =?utf-8?B?N2txQTNDNEJIM21zT2pmMXNGQ0lUMHNzVWZOMi9tNjBLbjB6c0pZMWthZVUz?=
 =?utf-8?B?V21OcE5ZOThURFZkS1BqNjdoek9CdVl0UTNIQlF4Skg0SWNYTU16ODc3THBh?=
 =?utf-8?B?R3FlWGs2SWRka0kwMlB4ZWtNWVAxTTFEczBpRkVFbXkwZ1o4b2R3eE54UmxV?=
 =?utf-8?B?M21IMVlkbjczTk40N01kTVFreHdMaE1KVk16anJnTTBvV1FmN3JmMjhFUjBB?=
 =?utf-8?B?VHZaUXZuOVlkWXZVWlVrNG5mZnNheUkwa1B2YytwQlpGNVFlYjZaWml2TUNG?=
 =?utf-8?B?eDVmclEwWXNJY1FlclV3ei8vR25jUVRISTV1OHdUYndzOVB3N05PWFJPNE9o?=
 =?utf-8?B?ZjNNejhOWUN3Q3hRN2QrN3RSOHVXNER4MXZZZVFkN3I3cExBaUF2TVNsUi9M?=
 =?utf-8?B?K3Rrcy9aV1ZiWFhWY3YxRjZwQmFBYWN1OUxFaFRJNEFNWldxdVl4WVRMVXdF?=
 =?utf-8?B?UkMvT0wyelVmMXV3VW1qY2xCSlZiaFhFZGxYaU1ML2d0aWNXQm1UR0krQjF1?=
 =?utf-8?B?ek14cHlNN0RrK3IwYkJVTHN0U3ZOM0ErSXFFVVVHUWdSMzdiVk1wcm5jVHdo?=
 =?utf-8?B?VDVSakhYRmdaZGF4TXBxWkVDdUdmNkZvUjVaNmE4WDlNNW0rTWRnbnp5S2tR?=
 =?utf-8?B?VTNheWFNWXpkUnNxS0RlRDhJT0tTR216OGRucWR1ekZUYmlYSGVZZkVESnZ6?=
 =?utf-8?B?Z0FWaURvMHFiZXY4MUZxMjl1c29TbFErSERWcjljY1lSU204MUNhU2I3RHdx?=
 =?utf-8?B?dFQwY3NYMm1LS0ZXdUVrbkFOR0EzWDhqbGVXNWt4Z0VYbXdUYUhzYzFwQWRR?=
 =?utf-8?B?cDdSeC9jY1VxZ2FxSWRGOTBQODJnV2VGekRienBiemNVSVh3aVNndTdpR2xr?=
 =?utf-8?B?MXM0M0lsVmNNZm9IbmlTNkhoYld2aHVzemZya0ZTdXd3WGJxTXBodHBMUXVZ?=
 =?utf-8?B?NW16QUFkQnBQaFpLMVJBQktWTjgyd2VNeG1MOTBTUWlUTVNsOCtnUFZTczZG?=
 =?utf-8?B?Ui8yeEtMTlo4NElQKzZ0R3NvcVlpSHdnZHFyNHlqYkRyVFhRN0I2cFhxRlp0?=
 =?utf-8?B?cHNoemI2NnNVRVJJcmtxK1NXdHprN1NFL2NKcWdmazVrVzhhc3BlSFVMZTRW?=
 =?utf-8?B?U2h4OVA1UFBORVBxdFB1RnU3WVQ2UTZodFYwaUQyM003UWlWdm1jcWx5OU8r?=
 =?utf-8?B?a0lBckFSTWV5ZUtJWDVtNGhyTzZaSUFtdkdxUFdaQ25pQnB1R2V3SGtPY3Vx?=
 =?utf-8?B?cUJ2MytlQ2dUODVRNmZJT2Z4VUpNeVNmUmxvSEZ1dUpySzA0K2w5RzVLYWJS?=
 =?utf-8?Q?GPYHIrPM18u69C12fDV6KTSYZKmoDGhNzYno8SQ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 577ba69d-1dee-4957-c065-08d95e6ab925
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2021 14:57:51.4329 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: felTcEwGpRCVOJb+Xgn/9Qfz57p9J7cvXg5RN0WDf5IE7ocShNATM0HUZHFyI8UTsywW0RX+LmSaXBBkpShY7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6788
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBldGVyIE1heWRlbGwgPHBl
dGVyLm1heWRlbGxAbGluYXJvLm9yZz4NCj4gU2VudDogRnJpZGF5LCBBdWd1c3QgMTMsIDIwMjEg
MzoyMSBBTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPg0KPiBD
YzogUUVNVSBEZXZlbG9wZXJzIDxxZW11LWRldmVsQG5vbmdudS5vcmc+OyBSaWNoYXJkIEhlbmRl
cnNvbg0KPiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz47IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpDQo+IDxmNGJ1Z0BhbXNhdC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUFVMTCAwLzFdIEhl
eGFnb24gKGRpc2FzL2hleGFnb24pIGZpeCBtZW1vcnkgbGVhayBmb3IgZWFybHkNCj4gZXhpdA0K
PiAgDQo+IA0KPiBJJ2xsIHB1dCB0aGlzIG9uIG15IGxpc3QgdG8gYXBwbHkgaWYgd2UgaGF2ZSBh
biByYzQsIGJ1dCBJIGRvbid0IHRoaW5rIHRoaXMgYnVnIGlzDQo+IG1ham9yIGVub3VnaCB0byBq
dXN0aWZ5IGFuIHJjNCBpZiBub3RoaW5nIGVsc2UgbWVhbnMgd2UgbmVlZCBvbmUuDQoNCg0KQWdy
ZWVkLiAgVGhhbmtzIFBldGVyIQ0KDQpUYXlsb3INCg==

