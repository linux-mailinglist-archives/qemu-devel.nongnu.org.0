Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFD83FD9E4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:59:02 +0200 (CEST)
Received: from localhost ([::1]:42606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPpV-0002WA-DO
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mLPh8-0003sr-Rk; Wed, 01 Sep 2021 08:50:22 -0400
Received: from mail-eopbgr740132.outbound.protection.outlook.com
 ([40.107.74.132]:23480 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mLPh6-0005Oe-BB; Wed, 01 Sep 2021 08:50:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k46f8ZIVtvxikDn/RBFREgJJSQUJPOtzI4jEDPvgO83zRFHNqtQGHZiYbDA9Sx1QaWO3Wu1OBQijPDNsFIIoYFvK8otRL7XIIRLGnpE3r8UpTHmlu2QfkY2XnxK+p6THPsKzqxQal49wZYTfcNpW94QTDKAz/w0zua96PWa2P+6uFdkb9Q8d8JpA4cBaRrAJNNW/PPwE77IzZyoix5nVT+TZK8g0/X29iy9A0ArTliSOfCPbLy8F1xjz7/x4ybtkB93aNuX8vxWzKXihhMp/g62QKVzrGbUk4y472fJ0lJakXEC/V5B0lCWDzWOzC4oVrpsJhHSx0foJBJG6dl6Z8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40AafE3HGvKRlfq2dXbcBYaP32QUEFmAytuZwfllQyo=;
 b=gOVE17+T+Koco0fLXHXPREtNEFm2HbnjutXD8uXVaYys9YTVG8/WGe9xIkWES3L2DuTp3SCecMc+BbfiFzF7ko5jHLqBOpn8RvUTogN8RhTlDQzNcG40ANdi/xi4xm7CmUH4MdKVe9IqnBWbzPqA5t1KvSDAnqQQrS/7ReuYuokeJ1d196dyYvISkPTNaLByzgWH1QDLkjTPcbWJ6n5JGTnxjb7clFYWE9xX2Qi1DSYib86nbtnBpQBxGxq6wKcnjSNmyEaCP863dLSsfpkYQVGOJ5UsuD4D0t+rhTMct/RJj9WsZOGAykPrrGalhVXwQGHTj6u2CHReNrHOhLEzOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40AafE3HGvKRlfq2dXbcBYaP32QUEFmAytuZwfllQyo=;
 b=QbimrnZ7u8D0aFAh6c6YVGcWjjXbZ5/LihgYS6ITppdG2FSZZkdLmFSxZeH7zKi8/ijZ8ImRUBjnqH0ZYRozSEvwZof8W+fFAvspBtnNw2uSYQwbYu7jeYqk3h+jQTD5OYf3mnLA7uB/kxsNlqPzzty5+E/aWGpgaUIVMLTZPqcHoSbnYBAIBRBWeTk8QfKDCc3orFsz7DPgfh1S3Rz0hJyBqLKd/bprAykc67P63R2vjCOAB2EAejrG7Hwr49CDyeIi0MYZHorlHM6sB5YRErkPqdNRf5lDx55St6RB6UPRsrisZLhcbdLL+3zNkrpZjoX1Ys1shCm707VtjeNPBA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB5492.lamprd80.prod.outlook.com (2603:10d6:102:b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 12:50:17 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::9c41:722:8b7b:8a76]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::9c41:722:8b7b:8a76%5]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 12:50:17 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>, Richard Henderson
 <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
Subject: RE: [PATCH v2 09/19] target/ppc: Implement DCFFIXQQ
Thread-Topic: [PATCH v2 09/19] target/ppc: Implement DCFFIXQQ
Thread-Index: AQHXnodVTi+hqxg7fEClLlDqOfcRSquN7CCAgAEzPICAAAHaQA==
Date: Wed, 1 Sep 2021 12:50:17 +0000
Message-ID: <CP2PR80MB3668F451370DC461B786E6BADACD9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
 <20210831164007.297781-10-luis.pires@eldorado.org.br>
 <a8950469-9db5-b110-f1ef-1cb0b23a5ed6@linaro.org>
 <59e621b7-1ad8-c6fe-31f2-c93f525dc9cf@eldorado.org.br>
In-Reply-To: <59e621b7-1ad8-c6fe-31f2-c93f525dc9cf@eldorado.org.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: eldorado.org.br; dkim=none (message not signed)
 header.d=none;eldorado.org.br; dmarc=none action=none
 header.from=eldorado.org.br;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 400b5847-e982-45c8-d398-08d96d470cc3
x-ms-traffictypediagnostic: CP2PR80MB5492:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB54923C00053917FB538C8A62DACD9@CP2PR80MB5492.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5rJp2s3FhWxitTKdm76YCk2k89vdEYer7QIKVcfB8DrRylZ6k2l06p9iFdGEQ/5r4NKMp65GQMrdCCM+7iJxE8aqXL+fnjE93nYkfid9PzahiIKsq7j7Xa9gdcYhvGwP0YZzOhqucbjmNP7MSadaXGJtrrQZJgel9uyJXM5D3JSR7OoPVeqLa7ZZGrgolhHsZMAxUWRf33j1k/UnXGUZB3dnddijumCPIkx3SfHlUi24+IYSDhxP9laP1Rd3e7idoDihTYdtFe2bhUA3A8uf+pWtqSccJeJ9UhHMTbCc36Gul6cP32XICNZxK3jftlvj8/Iy+ps428Rm6LkoKv8OzdihkVrUG8YAln6Wd7+sesygFArCXXhDFNYt97WL20t3COuzUg6FXlFw7Nzt0ygAghphbiszOM8WigB+RIQ3yujNec2fJvReBWZE/S180WoWaSlU5tFM6QObLEc2NFClpA8AOZ7tYBYAK3L3erYZW9DXdjxDmrYgK2EE3tQMI62uhIglWPIuOeGLDsUF+2gNWjdZ6C0FuY9VbX8NTQiLqNfg0/XN2UKqum43+ybHoekD/MDthpf7TtZL2W9SzUW8KCpqIif4aTNQCbrlfpzF0eTPVd8I1tQbr4VrioYYpggz0nviHGBCw93fzB/Bbk8Pk+lk13a9vy1p7TSsnpgUZHOeDyW26drJixrSes10PM9uqx4euFkwZmfxPeOUrecNc2Q1M6jNcgI+twID/+Dhoqzmx/htoqVs6xvOCVWyAHrASVmM1ZJq0grsuvIoUcsX/RHpJ9OV/qEE3tpgrntrym0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(396003)(346002)(136003)(39840400004)(66946007)(316002)(54906003)(33656002)(4744005)(66446008)(66556008)(66476007)(38100700002)(8936002)(64756008)(9686003)(55016002)(52536014)(86362001)(110136005)(2906002)(5660300002)(8676002)(38070700005)(76116006)(4326008)(26005)(53546011)(7696005)(186003)(122000001)(478600001)(6506007)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2NKZkpVRTZUdGplcXlzM1lxWXlVYzBTL2RScHg4SW9ndldTYWcwVUhReU5O?=
 =?utf-8?B?bmVvMkc4c3VFNmFVMS80WmtBSmY3cjFCTTNlWG9UT1gzdDE4dTBDclFLektw?=
 =?utf-8?B?THRLNGhwOFdQOU1DNjZGSzduSnZGZmFPYmllRktiU0t5UWt3U1NwODMzNEVh?=
 =?utf-8?B?eUxaNVhxZ2tXa0FHdHRoR0hILzJrWWlWMnQ4TEJOT2tGb1NJR0N0blVqNlVq?=
 =?utf-8?B?QjlFN2IzR1JubzlHcWJSbFlnQUszOWJoQVA5R1dhV0QrUWVCamt3WU0yNTkx?=
 =?utf-8?B?Z1o4RnM1QXVJeXB4TTE5RlFBS1ZwTzB3Y05KbHBORitqMjlJNkw0YXlXNlU3?=
 =?utf-8?B?eklHamphYy82cUs5MFNMMDN5QTF6eCtYSmU2T1NmUGh1MDVBWFRsVU9ZdU5o?=
 =?utf-8?B?dlcySGZVNUhhUFRGcnViU0xRMkdpT0wzc1FObVJJaUQycThMeGZ4OHlMNXlx?=
 =?utf-8?B?dlhvOXBDUHJYTlR2VFJRSGcxZFU5ZmtKRGI4VlFWNnU5Z28vMXpMbC9hcWt5?=
 =?utf-8?B?UnlKL0tPcXFyOUpkU2RPVHI1MlZZTVVGbDRhWDdINUplWHdMcGxLV2xlOThD?=
 =?utf-8?B?SVNWeTE2NXZQdm9DSlBRTWhxN1UvOCtKcm1Kbk5iRkJpWjdnMUkxcldibWVW?=
 =?utf-8?B?TkhMeG11d2ZSUkJRTE8xNjcvMmNHZEdLY0g3cW1DcUtrUXdFNG1LWDdta2xG?=
 =?utf-8?B?U042UW1NNThWaFM2ZkxhVSt1TDlxKytjY2wzalNlOUhZdDlWbEJNeFIxRmNk?=
 =?utf-8?B?eUFkVVl6cXBndXViZWF1SEIwSkNCMlVFdDI1aHpxN1VQQU5iNHdPS290REZD?=
 =?utf-8?B?NjJnR1dMamZ6SXpjYmF4OEs1SDRSamtsaGFmdzhzMktHZm9lL0NVYTIxTndl?=
 =?utf-8?B?NVBFYUw4SERkb0NnWDhQQlBFa3F0TjBZV2VGb3lSZlBpc1Vpa3pWTm5PT2NG?=
 =?utf-8?B?ZFVYTGtLMVArRGtiSHV3ZDNyZXhHdjd3NStQTXU0WURscHFpOGRIZmlldkhS?=
 =?utf-8?B?dW11MGxUbG9wdCsxVE82WGJsekVMWlN6SFdFc3VGQkxGeUtZUjFYSytjV2Nj?=
 =?utf-8?B?SWNITkc5WGJlcHE2aENtdmZ0UHlRS3JxVkVsajh2WVZ3aXBhY2N4cWlpVndY?=
 =?utf-8?B?REUwa2hBQUZXVE9xSzd4L1c1KzdzZ3dERndjN0FoeVc2a3lQb1FJdzMxN1Bm?=
 =?utf-8?B?ZkJDZGFTSDhRa2p3b0txN1dGT3REekxZOE9ZdnQ2a3IzOU5IUGNXNzFrMmhw?=
 =?utf-8?B?bFJmU0NuK1V3WWdScmJWYVJ1WG0wOS9LSlh1eTBWVnNHZCtYQ2Q0RnpsVHlI?=
 =?utf-8?B?Vy96THZQVWdEVUcxWWw4VDEyU0NsNnpjZWFsd0VFd2N6YU8rMHAyS1BWMXB3?=
 =?utf-8?B?OGhWTWtURkNrRjNEVEYxK3ZtYmNIM0wrZEhZbmxQUC9vOGNRemR6NzljMUsx?=
 =?utf-8?B?S01STHdPRmpIUkpockVWdVBwa2txd1oranZGV0F4emZJTG1SaFZuNGVnWDNu?=
 =?utf-8?B?ejlyanZUZWJZT2tldEZrdzZRSWZoYkdGNk5HOXY5cjN0eCs5QTJGQ1kwa2V4?=
 =?utf-8?B?TCtKYy9jUGdNMnJMU29kQkVPSzd4NE5UMmk1a2wrQ0FsS2dpUDdCcENFTlJo?=
 =?utf-8?B?T2dRQzRrcXI3QVhxeXJ6QW55L092cTByQmFLZktDV1ZqN0tWTU5aYW5XZTB3?=
 =?utf-8?B?WWpzbnR6bmkwbW5ZMUt6S0Nyek1SYUZYVUovTFNvVjdocjBRRU1qM3RRSFBq?=
 =?utf-8?Q?hO3Du9dMSDwsKkGDTLu1WecM2xzl3BiKUmsKPjq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 400b5847-e982-45c8-d398-08d96d470cc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 12:50:17.0943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8rSZzCPRccHw9LWcyo0XcKW3WmJ5b0235+NkHBiSbiinpdS1OcS0URj837X7cI1dmzJl1Utb63dKgFyqwFg8Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB5492
Received-SPF: pass client-ip=40.107.74.132;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
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

RnJvbTogTWF0aGV1cyBLLiBGZXJzdCA8bWF0aGV1cy5mZXJzdEBlbGRvcmFkby5vcmcuYnI+DQo+
ID4gT24gOC8zMS8yMSA5OjM5IEFNLCBMdWlzIFBpcmVzIHdyb3RlOg0KPiA+PiArREVGX0hFTFBF
Ul8zKERDRkZJWFFRLCB2b2lkLCBlbnYsIGZwcnAsIGF2cikNCj4gPg0KPiA+IFNob3VsZG4ndCBi
ZSB1cGNhc2UuICBOb25lIG9mIHRoZSBvdGhlcnMgYXJlLg0KPiA+DQo+IA0KPiBUaGUgcmVhc29u
IGZvciB0aGlzIGNoYW5nZSBpcyBvbiBwYXRjaCAxMyBhbmQgb253YXJkcy4gTWF0Y2hpbmcgdGhl
IGNhc2Ugb2YgdGhlDQo+IGluc3RydWN0aW9uIG5hbWUgaW4gdGhlIHRyYW5zXzxJTlNOPiBtZXRo
b2QgYW5kIHRoZSBoZWxwZXIgbWFrZXMgaXQgZWFzaWVyIHRvDQo+IGNyZWF0ZSBtYWNyb3MsIGUu
Zy4gVFJBTlNfREZQX0JGX0FfRENNIG9uIHBhdGNoIDEzLiBUaGUgaWRlYSB3YXMgdG8NCj4gY2hh
bmdlIHRoZSBoZWxwZXJzIGFzIHdlIG1vdmVkIGluc3RydWN0aW9ucyB0byBkZWNvZGV0cmVlLg0K
PiANCj4gQWx0ZXJuYXRpdmVseSwgdGhlIG1hY3JvIGNvdWxkIHJlY2VpdmUgdGhlIGluc3RydWN0
aW9uIG5hbWUgYW5kIHRoZQ0KPiBnZW5faGVscGVyXzxJTlNOPiwgb3Igd2UgY291bGQgZHJvcCB0
aGlzIGtpbmQgb2YgbWFjcm8gdXNhZ2UgaW4gZmF2b3Igb2YNCj4gc29tZXRoaW5nIGVsc2UuIFRo
ZSBmb3JtZXIgaXMgYSBiaXQgcmVwZXRpdGl2ZSwgd2hpbGUgdGhlIGxhdHRlciB3b3VsZCByZXF1
aXJlDQo+IG1vcmUgY2hhbmdlcyBpbiB0aGUgY3VycmVudCBjb2RlIHN0cnVjdHVyZS4NCg0KQW5k
IG91ciBpbnRlbnRpb24gaXMgYWxzbyB0byBzZW5kIGEgc3RhbmRhbG9uZSBwYXRjaCBsYXRlciBv
biwgY2hhbmdpbmcgdG8gdXBwZXJjYXNlIHRoZSBvdGhlciBuZXcgKGRlY29kZXRyZWUpIGhlbHBl
cnMgd2hvc2UgbmFtZXMgYXJlIGRpcmVjdGx5IHJlbGF0ZWQgdG8gaW5zdHJ1Y3Rpb24gbmFtZXMs
IG1ha2luZyB0aGVtIGNvbnNpc3RlbnQuDQoNCi0tDQpMdWlzIFBpcmVzDQpJbnN0aXR1dG8gZGUg
UGVzcXVpc2FzIEVMRE9SQURPDQpBdmlzbyBMZWdhbCAtIERpc2NsYWltZXIgPGh0dHBzOi8vd3d3
LmVsZG9yYWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+DQo=

