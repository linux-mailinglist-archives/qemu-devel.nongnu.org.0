Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C9D2E1A7A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 10:22:10 +0100 (CET)
Received: from localhost ([::1]:58726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks0LR-0004iX-BT
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 04:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ks0KK-000413-Mw
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 04:21:02 -0500
Received: from mail-oln040092255070.outbound.protection.outlook.com
 ([40.92.255.70]:7497 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ks0K8-00073B-PW
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 04:20:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCgGby+ZcWb9B1P7reAWA2k2Cf1RWxm3dYAr7Mz6+VId2CfAW+BjVjQuT6S7rlzK9AtIQ+zSASVJl1sS+0k33KwCzOKx9GxmH2pc3db6iRQUHk2fl1BUj3BNUyhp1NC+XvKYhpvSNloqL10eo9yEJ5QYWDusJzoTPKcscTdWRy16nClT7EK8+zaoNkqCNctxXeaWdve0gIBy2xDklTZmswXSZSYrn7AtOPWSAjAlsXg1AG+l8zZCkmsN3SVlwSTaGN3/5/bEvE+gYiUGvlsXzV+1VmbmyLHqPholPtja4Ca16xyFYhJa3IKNN9YJrcxa/oP2+xpxS9eV5C4Kyr67pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukvoG9iKQzdRMYX6O9vLI1BS2b10E2ulpUQzXKCAO6w=;
 b=Y0XZ/1sYFmZcGYJ2Gs9G0HZZ9gqbcbp17bjHd2QfR37At+M+tOhtB+2K94XABxnU3EuDKLwJgQIHsjeugpmat1uyleDjSf9cWSQ+M4lh4/EJ66iKrO5dDggvOaELTtcPjJzvOMWUZ34Myga3Sst+H4VhucPpnEQwjalpRSD3E/5KdCWfxgnr84p691lvZohP9doE/AXgYmka9yqIsmb3FwSQxTX1lA/UQqM/urAAYilGyBN7J47UYMEj/Gsh6UL5lh8Bj8bjuvqarlz7siAvy7kmUJdiN8bjZXfSsmPdWrTLi9Fpx26V+1+fhXwZv1ZkePL47eHRPAaaTRBK3zRPwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukvoG9iKQzdRMYX6O9vLI1BS2b10E2ulpUQzXKCAO6w=;
 b=CpXzhrGSvPLQLZCPm1/B3nxHG5pL46l/tKl2Dh1Q/ndYDvaDtG3tvIpGNJCtWJtDMwyZv7Q+J/z3Vd/9XTi/NWe4lXwz0gLkn37kR83mSodqmo9yh1LCyEUNSmGcHyBE8lsUsq8VWvAmXDJ3/uXdeKNQ0jQL+e4OzayZT6K6JSAtwrA7nnYK2NyML97kM+ft1m2c2Uq7gIddxR0hxBO2FtosUd6XsKhzR6HiM0nRA1ZT2GvbFnLO8wc+ByFYbUeZR2SLh/nRJIPm1+od7CVoTikRbnaP0rknHkXLrmbSGBxh6Y8qsPlHR9Rwsnal+e6yV2ltIn34peyVtwD2PcONbg==
Received: from PU1APC01FT036.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::45) by
 PU1APC01HT003.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::117)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Wed, 23 Dec
 2020 09:20:35 +0000
Received: from SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM (10.152.252.58) by
 PU1APC01FT036.mail.protection.outlook.com (10.152.252.207) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.22 via Frontend Transport; Wed, 23 Dec 2020 09:20:35 +0000
Received: from SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM
 ([fe80::55ae:9314:d035:d6d2]) by SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM
 ([fe80::55ae:9314:d035:d6d2%8]) with mapi id 15.20.3700.026; Wed, 23 Dec 2020
 09:20:35 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH 4/4] fuzz: delay IO until they can't trigger the crash
Thread-Topic: [PATCH 4/4] fuzz: delay IO until they can't trigger the crash
Thread-Index: AQHW1jizw71YAmZtX0usAH+wLDTeXqoCENAAgADsSICAAHdvgIABffCA
Date: Wed, 23 Dec 2020 09:20:35 +0000
Message-ID: <7df9cce0033de87f3f7e8b0019f71b4c0428e68c.camel@outlook.com>
References: <ME3P282MB1492BFA2302041F2AB420EBEFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB14920C8592A1D04D4A5685D9FCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
 <20201221211704.qiai5j75fmcqrueo@mozz.bu.edu>
 <SYYP282MB150122E885AC35FD9E63E851FCDF0@SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM>
 <20201222183013.k2zrmdyziv722lj3@mozz.bu.edu>
In-Reply-To: <20201222183013.k2zrmdyziv722lj3@mozz.bu.edu>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM
 (15.20.3700.026)
user-agent: Evolution 3.36.4-0ubuntu1 
x-incomingtopheadermarker: OriginalChecksum:CC5477889A3B750C29B39FF8EBFD82AEBBD8DDF65FCDBA63344688F3213DAFA3;
 UpperCasedChecksum:DBEF4E5234E29D8D197AECB5C8ACA493CFDD7E64E46A705456AC08A622901914;
 SizeAsReceived:7494; Count:47
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [21b/TFCFxhe5qbuk1bWZipIcgK4iEyGn]
x-ms-publictraffictype: Email
x-incomingheadercount: 47
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 7c547fc4-60e9-48f4-929b-08d8a724016d
x-ms-traffictypediagnostic: PU1APC01HT003:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8tFPcgy5YRTR5/dyp47lL4NvK7bHOl8ZdqAEiBoqKFInN690JhsKECo1qsgRy6vbtLOyCBPv6aJuWKz/3LUp73K3fj5uu/a+u9eOwmnl7dzA3g779epLYQKElH0s6PaJmPA63rCYdOkFYLbP9WluUMlIGfs8XZ5FicvIiTiAf/jUslPycrAWNvrTyQdFjZYdEPFwpaQxgUQnUpzI3FdnITfJdHB85BNFwPUcYjZj7NfL8FJSaxm1xa+GMY5cOPIrmp4BF9eWQF9NpScUDHu4fpOH65Sj1TIlM1WLJsrfijk=
x-ms-exchange-antispam-messagedata: Ow/Pa11qzGKgGodE4kcRF+nlegUTUGLINiFXeqj53nn05YDzHiQmnZ5nyutXP/3k8dFN31NP0SgIbghqYJ//Z/chYQN34SU0lbfG5N7EKLgIc1OPP0G4tEU7Z+/3QgG4LeNlWJ7pmTZut3/NwNqAfQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_7df9cce0033de87f3f7e8b0019f71b4c0428e68ccameloutlookcom_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT036.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c547fc4-60e9-48f4-929b-08d8a724016d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2020 09:20:35.7285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT003
Received-SPF: pass client-ip=40.92.255.70; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-HK2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "thuth@redhat.com" <thuth@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "darren.kenny@oracle.com" <darren.kenny@oracle.com>,
 "bsd@redhat.com" <bsd@redhat.com>, "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_7df9cce0033de87f3f7e8b0019f71b4c0428e68ccameloutlookcom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIwLTEyLTIyIGF0IDEzOjMwIC0wNTAwLCBBbGV4YW5kZXIgQnVsZWtvdiB3cm90
ZToNCj4gT24gMjAxMjIyIDE5MjIsIFFpdWhhbyBMaSB3cm90ZToNCj4gPiBPbiBNb24sIDIwMjAt
MTItMjEgYXQgMTY6MTcgLTA1MDAsIEFsZXhhbmRlciBCdWxla292IHdyb3RlOg0KPiA+ID4gT24g
MjAxMjIwIDAyNTYsIFFpdWhhbyBMaSB3cm90ZToNCj4gPiA+ID4gU2luY2UgcHJvZ3JhbW1lcnMg
dXN1YWxseSB0cmlnZ2VyIGFuIElPIGp1c3QgYmVmb3JlIHRoZXkgbmVlZA0KPiA+ID4gPiBpdC4N
Cj4gPiA+ID4gVHJ5IHRvDQo+ID4gPiA+IGRlbGF5IHNvbWUgSU8gaW5zdHJ1Y3Rpb25zIG1heSBo
ZWxwIHVzIGJldHRlciB1bmRlcnN0YW5kaW5nIHRoZQ0KPiA+ID4gPiB0aW1pbmcNCj4gPiA+ID4g
Y29udGV4dCB3aGVuIGRlYnVnLg0KPiA+ID4gPg0KPiA+ID4gPiBUZXN0ZWQgd2l0aCBCdWcgMTkw
ODA2Mi4gUmVmaW5lZCB2cy4gT3JpZ2luYWwgcmVzdWx0Og0KPiA+ID4gPg0KPiA+ID4gPiBvdXRs
IDB4Y2Y4IDB4ODAwMDA4MWMgICAgICAgICAgICBvdXRsIDB4Y2Y4IDB4MA0KPiA+ID4gPiBvdXRi
IDB4Y2ZjIDB4YzMgICAgICAgICAgICAgICAgfCBvdXRsIDB4Y2Y4IDB4ODAwMDA4MWMNCj4gPiA+
ID4gb3V0bCAweGNmOCAweDgwMDAwODA0ICAgICAgICAgIHwgb3V0YiAweGNmYyAweGMzDQo+ID4g
PiA+IG91dGwgMHhjZmMgMHgxMDAwMDAwNiAgICAgICAgICB8IG91dGwgMHhjZjggMHg4MDAwMDgw
NA0KPiA+ID4gPiB3cml0ZSAweGMzMDAwMDEwMjggMHgxIDB4NWEgICAgfCBvdXRsIDB4Y2ZjIDB4
MTAwMDAwMDYNCj4gPiA+ID4gd3JpdGUgMHhjMzAwMDAxMDI0IDB4MiAweDEwICAgIHwgd3JpdGUg
MHhjMzAwMDAxMDI4IDB4MSAweDVhDQo+ID4gPiA+IHdyaXRlIDB4YzMwMDAwMTAxYyAweDEgMHgw
MSAgICB8IHdyaXRlbCAweGMzMDAwMDEwMGMgMHgyYTZmNmM2Mw0KPiA+ID4gPiB3cml0ZSAweGMz
MDAwMDMwMDIgMHgxIDB4MCAgICAgdiB3cml0ZSAweGMzMDAwMDEwMjQgMHgyIDB4MTANCj4gPiA+
ID4gd3JpdGUgMHg1YyAweDEgMHgxMCAgICAgICAgICAgICAgd3JpdGUgMHhjMzAwMDAxMDFjIDB4
MSAweDAxDQo+ID4gPiA+IHdyaXRlbCAweGMzMDAwMDEwMGMgMHgyYTZmNmM2MyAgIHdyaXRlIDB4
YzMwMDAwMTAxOCAweDEgMHg4MA0KPiA+ID4gPiB3cml0ZSAweGMzMDAwMDEwMTggMHgxIDB4ODAg
ICAgICB3cml0ZSAweDVjIDB4MSAweDEwDQo+ID4gPiA+IG91dGwgMHhjZjggMHgwICAgICAgICAg
ICAgICAgICAgIHdyaXRlIDB4YzMwMDAwMzAwMiAweDEgMHgwDQo+ID4gPiA+DQo+ID4gPg0KPiA+
ID4gSW4gdGhpcyBleGFtcGxlLCBJIGNhbiByZW1vdmUgdGhlIG91dGwgMHhjZjggMHgwLCBhbmQg
SSBzdGlsbCBzZWUNCj4gPiA+IHRoZQ0KPiA+ID4gY3Jhc2gsIHNvIG1heWJlIHRoZSAxc3Qgc3Rl
cCBpbiB0aGUgbWluaW1pemVyIGlzIGZhaWxpbmcNCj4gPiA+IHNvbWV3aGVyZS4uDQo+ID4NCj4g
PiBJIHRoaW5rIGl0IG1pZ2h0IGJlY2F1c2Ugb2Ygb3VyIG9uZS10aW1lIHNjYW4gYW5kIHJlbW92
ZSBzdHJhdGVneSwNCj4gPiB3aGljaCBpcyBub3Qgc3VpdGFibGUgZm9yIHRpbWluZyBkZXBlbmRl
bnQgaW5zdHJ1Y3Rpb25zLg0KPiA+DQo+ID4gRm9yIGV4YW1wbGUsIGluc3RydWN0aW9uIEEgd2ls
bCBpbmRpY2F0ZSBhbiBhZGRyZXNzIHdoZXJlIHRoZQ0KPiA+IGNvbmZpZw0KPiA+IGNodW5rIGxv
Y2F0ZXMsIGFuZCBpbnN0cnVjdGlvbiBCIHdpbGwgbWFrZSB0aGUgY29uZmlndXJhdGlvbg0KPiA+
IGFjdGl2ZS4gSWYNCj4gPiB3ZSBoYXZlIHRoZSBmb2xsb3dpbmcgaW5zdHJ1Y3Rpb24gc2VxdWVu
Y2U6DQo+ID4NCj4gPiAuLi4NCj4gPiBBMQ0KPiA+IEIxDQo+ID4gQTINCj4gPiBCMg0KPiA+IC4u
Lg0KPiA+DQo+ID4gQTIgYW5kIEIyIGFyZSB0aGUgYWN0dWFsIGluc3RydWN0aW9ucyB0aGF0IHRy
aWdnZXIgdGhlIGJ1Zy4NCj4gPg0KPiA+IElmIHdlIHNjYW4gZnJvbSB0b3AgdG8gYm90dG9tLCBh
ZnRlciB3ZSByZW1vdmUgQTEsIHRoZSBiZWhhdmlvciBvZg0KPiA+IEIxDQo+ID4gbWlnaHQgYmUg
dW5rbm93YWJsZSwgaW5jbHVkaW5nIG5vdCB0byBjcmFzaCB0aGUgcHJvZ3JhbS4gQnV0IHdlDQo+
ID4gd2lsbA0KPiA+IHN1Y2Nlc3NmdWxseSByZW1vdmUgQjEgbGF0ZXIgY2F1c2UgQTIgYW5kIEIy
IHdpbGwgY3Jhc2ggdGhlIHByb2Nlc3MNCj4gPiBhbnl3YXk6DQo+ID4NCj4gPiAuLi4NCj4gPiBB
MQ0KPiA+IEEyDQo+ID4gQjINCj4gPiAuLi4NCj4gPg0KPiA+IE5vdyBvbmUgbW9yZSB0cmltbWlu
ZyB3aWxsIHJlbW92ZSBBMS4NCj4gPg0KPiA+IEFzIGZvciB0aGUgZXhhbXBsZSBJIGdhdmUsIHRo
ZSBpbnN0cnVjdGlvbnMgYmVmb3JlIHRoZSBkZWxheWluZw0KPiA+IG1pbmltaXplciBhcmUgbGlr
ZSB0aGlzOg0KPiA+DQo+ID4gb3V0bCAweGNmOCAweDgwMDAwODFjDQo+ID4gb3V0YiAweGNmYyAw
eGMzDQo+ID4gb3V0bCAweGNmOCAweDAgICAgICAgICAgICAgICAgPC0tLSBUaGUgQSBpbnN0cnVj
dGlvbiwgZGlkbid0IGJlDQo+ID4gcmVtb3ZlZA0KPiA+IChvdXRsIDB4Y2ZjIDB4MCkgICAgICAg
ICAgICAgIDwtLS0gVGhlIEIgaW5zdHJ1Y3Rpb24sIHJlbW92ZWQNCj4gPiBvdXRsIDB4Y2Y4IDB4
ODAwMDA4MDQNCj4gPiBvdXRsIDB4Y2ZjIDB4MTAwMDAwMDYNCj4gPiB3cml0ZSAweGMzMDAwMDEw
MjQgMHgyIDB4MTANCj4gPiB3cml0ZSAweGMzMDAwMDEwMjggMHgxIDB4NWENCj4gPiB3cml0ZSAw
eGMzMDAwMDEwMWMgMHgxIDB4MDENCj4gPiB3cml0ZWwgMHhjMzAwMDAxMDBjIDB4MmE2ZjZjNjMN
Cj4gPiB3cml0ZSAweGMzMDAwMDEwMTggMHgxIDB4ODANCj4gPiB3cml0ZSAweDVjIDB4MSAweDEw
DQo+ID4gd3JpdGUgMHhjMzAwMDAzMDAyIDB4MSAweDANCj4gPg0KPiA+IElmIHdlIHJ1biB0aGUg
cmVtb3ZlIG1pbmltaXplciBhZ2FpbiwgVGhlIEEgaW5zdHJ1Y3Rpb24gb3V0bCAweGNmOA0KPiA+
IDB4MA0KPiA+IHdpbGwgYmUgcmVtb3ZlZC4NCj4gPg0KPiA+IFNpbmNlIHdlIG9ubHkgcmVtb3Zl
IGluc3RydWN0aW9ucywgdGhpcyBpdGVyYXRpdmUgYWxnb3JpdGhtIGlzDQo+ID4gY29udmVyZ2lu
Zy4gTWF5YmUgd2UgY2FuIGtlZXAgcmVtb3ZpbmcgdGhlIHRyYWNlIHVudGlsIHRoZQ0KPiA+IGxl
bihuZXd0cmFjZSkgYmVjb21lIHVuY2hhbmdlZC4NCj4gPg0KPg0KPiBJIGZvdW5kIGEgYnVuY2gg
b2Ygd29yayByZWxhdGVkIHRvIHRoaXMgInRlc3QtY2FzZSBtaW5pbWl6YXRpb24iLg0KPiBUaGVy
ZQ0KPiBhcmUgYWxnb3JpdGhtcyBzdWNoIGFzICJkZG1pbiIgdGhhdCB0cnkgdG8gdGFja2xlIHRo
aXMuIFRoZXJlIG1pZ2h0DQo+IGJlDQo+IHNvbWUgaW50ZXJlc3RpbmcgaWRlYXMgdGhlcmUuDQoN
ClRoYW5rcywgSSB3aWxsIGhhdmUgYSBsb29rLg0KDQo+IEkgdGhpbmsgaW4gdGhlIHBlcmZlY3Qg
Y2FzZSwgd2Ugd291bGQgbmVlZCB0byBiZSBhYmxlIHRvIHJlbW92ZSBBIGFuZA0KPiBCDQo+IGF0
IHRoZSBzYW1lIHRpbWUuIFlvdSBkZXNjcmliZWQgdGhlIHNpdHVhdGlvbiB3aGVyZSBCMSBtaWdo
dCBsZWFkIHRvDQo+IGENCj4gYmFkIHN0YXRlIHdpdGhvdXQgQTEsIGJ1dCB0aGVyZSBpcyBhbHNv
IHRoZSBwb3NzaWJpbGl0eSB0aGF0IEExIG1pZ2h0DQo+IGxlYXZlIGJhZCBzdGF0ZSBhcm91bmQs
IHdpdGhvdXQgQjEuIEFuZCBib3RoIG9mIHRoZXNlIG1pZ2h0IGJlIHRydWUNCj4gYXQNCj4gdGhl
IHNhbWUgdGltZSA6KSBQcm9iYWJseSBub3Qgc29tZXRoaW5nIHdlIGVuY291bnRlciB2ZXJ5IG9m
dGVuLA0KPiB0aG91Z2guDQoNCllvdSBhcmUgcmlnaHQsIGFuZCBldmVuIHRoZXJlIGNhbiBiZSB0
aHJlZSBpbnN0cnVjdGlvbnMgd2hpY2ggbXVzdCBiZSByZW1vdmVkIHRvZ2V0aGVyIDspIEJ1dCBm
b3Igbm93LCBob3cgYWJvdXQgd2UganVzdCBhZGQgYSBpZihsZW4obmV3dHJhY2UpID09IG9sZF9s
ZW4pIGxvb3AgIGFyb3VuZCByZW1vdmUgbWluaW1pemVyPyBObyBoYXJtLg0KDQpEbyB5b3UgdGhp
bmsgdGhpcyBraW5kIG9mIGRlcGVuZGVuY2Ugd2lsbCBleGlzdCBpbiBiaXRzIG9mIHRoZSB3cml0
ZS9vdXQgY29tbWFuZHM/IEhvdyBhYm91dCBhZGRpbmcgaWYobnVtX2JpdHMoZGF0YSkgPT0gb2xk
X251bSkgbG9vcCBhcm91bmQgdGhlIHNldHRpbmcgemVybyBtaW5pbWl6ZXI/DQoNCj4gPiA+IElz
IHRoZSBSZWZpbmVkIG9uZSBiZXR0ZXI/IFRvIG1lIHRoZSBvcmlnaW5hbCBvbmUgcmVhZCBhczoN
Cj4gPiA+ICJEbyBhIGJ1bmNoIG9mIFBDSSBjb25maWd1cmF0aW9uIHRvIG1hcCBhbiBNTUlPIEJB
UiwgdGhlbg0KPiA+ID4gaW50ZXJhY3QNCj4gPiA+IHdpdGgNCj4gPiA+IHRoZSBNTUlPIHJhbmdl
IGFuZCB0cmlnZ2VyIHNvbWUgRE1BIGFjdGl2aXR5Ii4gSSBhbHNvIGtub3cNCj4gPiA+IGV4YWN0
bHkNCj4gPiA+IHRoZQ0KPiA+ID4gbGluZSB0aGF0IHdpbGwgdHJpZ2dlciB0aGUgRE1BIGFjdGl2
aXR5IGFuZCBhY2Nlc3MgMHg1Yy4gV2l0aCB0aGUNCj4gPiA+IHJlZmluZWQgb25lLCBJJ20gbm90
IHNvIHN1cmUuIFdoaWNoIGxpbmUgbm93IGNhdXNlcyB0aGUgRE1BIHJlYWQNCj4gPiA+IGZyb20N
Cj4gPiA+IDB4NWM/IHdyaXRlbCAweGMzMDAwMDEwMGM/IHdyaXRlIDB4YzMwMDAwMTAxOD8NCj4g
PiA+IElzIHRoZXJlIGFub3RoZXIgZXhhbXBsZSB3aGVyZSB0aGlzIHR5cGUgb2YgcmVvcmRlcmlu
ZyBtYWtlcyB0aGUNCj4gPiA+IHJlc3VsdA0KPiA+ID4gZWFzaWVyIHRvIHJlYWQ/DQo+ID4gPg0K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBRaXVoYW8gTGkgPFFpdWhhby5MaUBvdXRsb29rLmNvbT4N
Cj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBzY3JpcHRzL29zcy1mdXp6L21pbmltaXplX3F0ZXN0X3Ry
YWNlLnB5IHwgMjENCj4gPiA+ID4gKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0
IGEvc2NyaXB0cy9vc3MtZnV6ei9taW5pbWl6ZV9xdGVzdF90cmFjZS5weQ0KPiA+ID4gPiBiL3Nj
cmlwdHMvb3NzLWZ1enovbWluaW1pemVfcXRlc3RfdHJhY2UucHkNCj4gPiA+ID4gaW5kZXggZjNl
ODgwNjRjNC4uZGE3YWE3M2IzYyAxMDA3NTUNCj4gPiA+ID4gLS0tIGEvc2NyaXB0cy9vc3MtZnV6
ei9taW5pbWl6ZV9xdGVzdF90cmFjZS5weQ0KPiA+ID4gPiArKysgYi9zY3JpcHRzL29zcy1mdXp6
L21pbmltaXplX3F0ZXN0X3RyYWNlLnB5DQo+ID4gPiA+IEBAIC0yMTQsNiArMjE0LDI3IEBAIGRl
ZiBtaW5pbWl6ZV90cmFjZShpbnBhdGgsIG91dHBhdGgpOg0KPiA+ID4gPg0KPiA+ID4gPiAgICAg
IGFzc2VydChjaGVja19pZl90cmFjZV9jcmFzaGVzKG5ld3RyYWNlLCBvdXRwYXRoKSkNCj4gPiA+
ID4NCj4gPiA+ID4gKyAgICAjIGRlbGF5IElPIGluc3RydWN0aW9ucyB1bnRpbCB0aGV5IGNhbid0
IHRyaWdnZXIgdGhlIGNyYXNoDQo+ID4gPiA+ICsgICAgIyBOb3RlOiBPKG5eMikgYW5kIG1hbnkg
dGltZW91dHMsIGtpbmRhIHNsb3cNCj4gPiA+DQo+ID4gPiBNYXliZSBkbyBhIGJpbmFyeSBzZWFy
Y2ggaW5zdGVhZCBvZiBhIGxpbmVhciBzY2FuIGZvciB0aGUgb3B0aW1hbA0KPiA+ID4gcG9zaXRp
b24NCj4gPiA+IHRvIHNhdmUgc29tZSB0aW1lPw0KPiA+ID4gQWxzbywgaWYgeW91IHJlLXJ1biB0
aGlzIG11bHRpcGxlIHRpbWVzLCB5b3UgY2FuIGVuZCB1cCB3aXRoDQo+ID4gPiBkaWZmZXJlbnQN
Cj4gPiA+IHJlc3VsdHMsIHNpbmNlIHNvbWUgbGluZXMgbWlnaHQgbm90IHJlYWxseSBiZSB0aWVk
IHRvIGEgcG9zaXRpb24NCj4gPiA+IChlLmcuDQo+ID4gPiB0aGUgb3V0bCBjZjggMHgwIGluIHlv
dXIgZXhhbXBsZSkuIE1heWJlIGl0J3Mgbm90IGEgcHJvYmxlbSwgYnV0DQo+ID4gPiBpJ20NCj4g
PiA+IHN0aWxsIG5vdCBzdXJlIHRoYXQgdGhpcyBpcyBtYWtpbmcgdGhlIHJlc3VsdCBlYXNpZXIg
dG8gcmVhZC4NCj4gPiA+IC1BbGV4DQo+ID4NCj4gPiBJJ20gbm90IGZhbWlsaWFyIHdpdGggdGhl
IFBDSSBjb25maWd1cmF0aW9uIGFuZCBETUEgbWVjaGFuaXNtIGluDQo+ID4gUUVNVS4NCj4gPiBU
aGlzIHBhdGNoIGlzIGp1c3QgcmFuZG9tIHRoaW5raW5nIGJhc2VkIG9uIGVtcGlyaWNpc20uIE1h
eWJlIEkNCj4gPiBzaG91bGQNCj4gPiBhZGQgdGhlICJSRkMiIHRhZyA6KS4gSW4gdmVyc2lvbiAy
LCBJIHdvbid0IHBvc3QgdGhpcyBwYXRjaC4NCj4gPg0KPiA+IEJUVywgbWF5IEkgYXNrIHdoZXJl
IEkgY2FuIGxlYXJuIGFib3V0IHRoZXNlIElPIGVtdWxhdGlvbnM/IEhvdyBkbw0KPiA+IHlvdQ0K
PiA+IGtub3cgdGhlIGFkZHJlc3MgY29ycmVzcG9uZGluZyB0byB0aGUgUENJIGJhciBhbmQgRE1B
Pw0KPg0KPiBPbiBQQ3MsIHRoZSBQQ0kgY29uZmlndXJhdGlvbiBzcGFjZSBpcyBhY2Nlc3NlZCB1
c2luZyB0d28gSS9PIHBvcnRzOg0KPiAweGNmYyBhbmQgMHhjZjguIFRvIGludGVyYWN0IGZ1cnRo
ZXIgd2l0aCBhICBQQ0kgZGV2aWNlLCB5b3UgaGF2ZSB0bw0KPiBjb25maWd1cmUgaXRzIEJBUnMg
KGkuZS4gdGhlIFBvcnQgSU8gYW5kIG1lbW9yeSByYW5nZXMgdGhhdCB3aWxsIG1hcA0KPiB0bw0K
PiBkZXZpY2UgcmVnaXN0ZXJzKS4NCj4gaHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvUENJ
X2NvbmZpZ3VyYXRpb25fc3BhY2UjQnVzX2VudW1lcmF0aW9uDQo+DQo+IFNvIHdlIGNhbiBsb29r
IGF0IHRoZSB0cmFjZSBhZ2Fpbi4gRmlyc3QgdGhlcmUgYXJlIG5vIHZpcnRpby12Z2ENCj4gTU1J
Ty9QSU8NCj4gcmFuZ2VzIGFjY2Vzc2libGUsIHNvIHRoZSBvbmx5IHRoaW5nIHRoZSBmdXp6ZXIg
Y2FuIGRvIGlzIGludGVyYWN0DQo+IHdpdGgNCj4gaXRzIFBDSSBjb25maWd1cmF0aW9uIHNwYWNl
IHVzaW5nIDB4Q0Y4L0NGQzoNCj4NCj4gb3V0bCAweGNmOCAweDgwMDAwODFjDQo+IG91dGIgMHhj
ZmMgMHhjMw0KPiBeXl4gVGhlIGFib3ZlIHR3byBsaW5lcyB3cml0ZSB0aGUgdmFsdWUgMHhjMyB0
byBQQ0kgY29uZmlnIGFkZHJlc3MNCj4gMHgxYw0KPiBmb3IgdGhlIHZnYSBkZXZpY2UuIFlvdSBj
YW4gY29uZmlybSB0aGlzIGJ5IHJ1bm5pbmcgdGhlIHRlc3RjYXNlIHdpdGgNCj4gLXRyYWNlIHBj
aVwqLiAweDFjIGlzIHRoZSBsb2NhdGlvbiBvZiB0aGUgUENJIHJlZ2lzdGVyIHRoYXQNCj4gcmVw
cmVzZW50cw0KPiBCQVIgIzMgZm9yIHRoZSBkZXZpY2UuDQo+IG91dGwgMHhjZjggMHg4MDAwMDgw
NA0KPiBvdXRiIDB4Y2ZjIDB4MDYNCj4gXl5eIFRoZXNlIHR3byBsaW5lcyB3cml0ZSB0byB0aGUg
UENJIGNvbW1hbmQgcmVnaXN0ZXIgKDB4MDQpIHRvIGFsbG93DQo+IHRoZSBkZXZpY2UgdG8gcmVz
cG9uZCB0byBtZW1vcnkgYWNjZXNzZXMuDQo+DQo+IHdyaXRlIDB4YzMwMDAwMTAyNCAweDIgMHgw
MDQwDQo+IHdyaXRlIDB4YzMwMDAwMTAyOCAweDEgMHg1YQ0KPiB3cml0ZSAweGMzMDAwMDEwMWMg
MHgxIDB4MDENCj4gd3JpdGVsIDB4YzMwMDAwMTAwYyAweDIwMDAwMDAwDQo+IHdyaXRlIDB4YzMw
MDAwMTAxNiAweDMgMHg4MGEwODANCj4gd3JpdGUgMHhjMzAwMDAzMDAyIDB4MSAweDgwDQo+IF5e
XiBOb3cgd2Ugc3RhcnQgdG8gc2VlIHdoYXQgbG9va3MgbGlrZSBNTUlPIGFjY2Vzc2VzLiBBbmQg
aWYgd2UgbG9vaw0KPiBhdA0KPiB0aGUgb3V0cHV0IG9mIC10cmFjZSBwY2lcKiB3ZSB3aWxsIGZp
bmQgdGhhdCB0aGUgMHhjMyB2YWx1ZSB3ZSB3cm90ZQ0KPiBhYm92ZSwgY29uZmlndXJlZCBhbiBN
TUlPIHJhbmdlIGF0IDB4YzMwMDAwMDAwMC4gVGhhdCBpcyB3aHkgdGhlIE1NSU8NCj4gYWNjZXNz
ZXMgYXJlIGNsb3NlIHRvIHRoYXQgYWRkcmVzcy4NCj4NCj4gd3JpdGUgMHg1YyAweDEgMHgxMA0K
PiBeXl4gVGhpcyBJIGFtIGd1ZXNzaW5nIGlzIGEgRE1BIGNvbW1hbmQuIFVzdWFsbHkgSSBrbm93
IHRoaXMgc2ltcGx5DQo+IGJ5DQo+IGxvb2tpbmcgYXQgdGhlIFtETUFdIGFubm90YXRpb25zIGlu
IHRoZSBpbnB1dCBmaWxlIHRvDQo+IHJlb3JkZXJfZnV6emVyX3F0ZXN0X3RyYWNlLnB5LiBUaGlz
IGp1c3QgbWVhbnMgdGhhdCB0aGUgZGV2aWNlIHRyaWVkDQo+IHRvDQo+IHJlYWQgZnJvbSB0aGlz
IGxvY2F0aW9uIGluIG1lbW9yeSwgc28gdGhlIGZ1enplciBwbGFjZWQgc29tZSBkYXRhDQo+IHRo
ZXJlLg0KPg0KPiBCZXlvbmQganVzdCBicm9hZGx5IHNlZWluZyB0aGF0IHRoZXJlIGFyZSBzb21l
IGluaXRpYWwgUENJDQo+IGNvbmZpZ3VyYXRpb25zIG9uIHJlZ2lzdGVycyAweENGOC8weENGQywg
c29tZSBhY2Nlc3NlcyB0byBhZGRyZXNzZXMNCj4gdGhhdA0KPiBsb29rIGxpa2UgYW4gTU1JTyBy
YW5nZSwgYW5kIG9uZSBsaW5lIHRoYXQgcHJvYmFibHkgcHV0cyBvbmUgYnl0ZSBhdA0KPiBhZGRy
ZXNzIDB4NWMgaW4gcmFtLCBJIGNhbid0IHJlYWxseSB0ZWxsIGFueXRoaW5nIGVsc2UganVzdCBi
eQ0KPiBsb29raW5nDQo+IGF0IHRoZSB0cmFjZS4gVG8gd3JpdGUgdGhlIGRlc2NyaXB0aW9ucyBh
Ym92ZSwgSSBoYWQgdG8gbG9vayBhdA0KPiBQQ0ktcmVsYXRlZCByZXNvdXJjZXMuIEltIG5vdCBj
b252aW5jZWQgdGhhdCByZW9yZGVyaW5nIHRoZSBhY2Nlc3Nlcw0KPiB3aWxsIHJlYWxseSBoZWxw
IG11Y2ggd2l0aCB0aGlzLiBQcm9iYWJseSB0aGUgYmVzdCBhaWQgSSBmb3VuZCBmb3INCj4gdW5k
ZXJzdGFuZGluZyB0cmFjZXMgYXJlIGdvb2QgdHJhY2UgZXZlbnRzICh3aGVuIHRoZXkgZXhpc3Qp
Lg0KPg0KPiAtQWxleA0KDQpUaGFuayB5b3Ugc28gbXVjaCBmb3Igc3VjaCBhIGRldGFpbGVkIGFu
ZCBwYXRpZW50IGV4cGxhbmF0aW9uISBJIHdpbGwgdXNlIHRyYWNpbmcgdG8gYW5hbHl6ZSBJTyBl
dmVudHMgaW4gdGhlIGZ1dHVyZS4NCg0KVGhlIGRlbGF5aW5nIG1pbmltaXplciBzZWVtcyBub3Qg
Y29uc3RydWN0aXZlLiBJIHdvbid0IHBvc3QgaXQgaW4gdmVyc2lvbiAyLg0KDQpUaGFua3MgYWdh
aW4gOikNCg0KPiA+ID4gPiArICAgIGkgPSBsZW4obmV3dHJhY2UpIC0gMQ0KPiA+ID4gPiArICAg
IHdoaWxlIGkgPj0gMDoNCj4gPiA+ID4gKyAgICAgICAgdG1wX2kgPSBuZXd0cmFjZVtpXQ0KPiA+
ID4gPiArICAgICAgICBpZiBsZW4odG1wX2kpIDwgMjoNCj4gPiA+ID4gKyAgICAgICAgICAgIGkg
LT0gMQ0KPiA+ID4gPiArICAgICAgICAgICAgY29udGludWUNCj4gPiA+ID4gKyAgICAgICAgcHJp
bnQoIkRlbGF5aW5nICIsIG5ld3RyYWNlW2ldKQ0KPiA+ID4gPiArICAgICAgICBmb3IgaiBpbiBy
ZXZlcnNlZChyYW5nZShpKzEsIGxlbihuZXd0cmFjZSkrMSkpOg0KPiA+ID4gPiArICAgICAgICAg
ICAgbmV3dHJhY2UuaW5zZXJ0KGosIHRtcF9pKQ0KPiA+ID4gPiArICAgICAgICAgICAgZGVsIG5l
d3RyYWNlW2ldDQo+ID4gPiA+ICsgICAgICAgICAgICBpZiBjaGVja19pZl90cmFjZV9jcmFzaGVz
KG5ld3RyYWNlLCBvdXRwYXRoKToNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICBicmVhaw0KPiA+
ID4gPiArICAgICAgICAgICAgbmV3dHJhY2UuaW5zZXJ0KGksIHRtcF9pKQ0KPiA+ID4gPiArICAg
ICAgICAgICAgZGVsIG5ld3RyYWNlW2pdDQo+ID4gPiA+ICsgICAgICAgIGkgLT0gMQ0KPiA+ID4g
PiArDQo+ID4gPiA+ICsgICAgYXNzZXJ0KGNoZWNrX2lmX3RyYWNlX2NyYXNoZXMobmV3dHJhY2Us
IG91dHBhdGgpKQ0KPiA+ID4gPiArICAgICMgbWF5YmUgYW5vdGhlciByZW1vdmluZyByb3VuZA0K
PiA+ID4gPiArDQo+ID4gPiA+DQo+ID4gPiA+ICBpZiBfX25hbWVfXyA9PSAnX19tYWluX18nOg0K
PiA+ID4gPiAgICAgIGlmIGxlbihzeXMuYXJndikgPCAzOg0KPiA+ID4gPiAtLQ0KPiA+ID4gPiAy
LjI1LjENCj4gPiA+ID4NCg==

--_000_7df9cce0033de87f3f7e8b0019f71b4c0428e68ccameloutlookcom_
Content-Type: text/html; charset="gb2312"
Content-ID:  <740B10227D14134989DF9B005AE346D3@sct-15-20-3174-20-msonline-outlook-8dac2.templateTenant>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div>On Tue, 2020-12-22 at 13:30 -0500, Alexander Bulekov wrote:<br>
</div>
<div>&gt; On 201222 1922, Qiuhao Li wrote:<br>
</div>
<div>&gt; &gt; On Mon, 2020-12-21 at 16:17 -0500, Alexander Bulekov wrote:<=
br>
</div>
<div>&gt; &gt; &gt; On 201220 0256, Qiuhao Li wrote:<br>
</div>
<div>&gt; &gt; &gt; &gt; Since programmers usually trigger an IO just befor=
e they need<br>
</div>
<div>&gt; &gt; &gt; &gt; it.<br>
</div>
<div>&gt; &gt; &gt; &gt; Try to<br>
</div>
<div>&gt; &gt; &gt; &gt; delay some IO instructions may help us better unde=
rstanding the<br>
</div>
<div>&gt; &gt; &gt; &gt; timing<br>
</div>
<div>&gt; &gt; &gt; &gt; context when debug.<br>
</div>
<div>&gt; &gt; &gt; &gt; <br>
</div>
<div>&gt; &gt; &gt; &gt; Tested with Bug 1908062. Refined vs. Original resu=
lt:<br>
</div>
<div>&gt; &gt; &gt; &gt; <br>
</div>
<div>&gt; &gt; &gt; &gt; outl 0xcf8 0x8000081c &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;outl 0xcf8 0x0<br>
</div>
<div>&gt; &gt; &gt; &gt; outb 0xcfc 0xc3 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;| outl 0xcf8 0x8000081c<br>
</div>
<div>&gt; &gt; &gt; &gt; outl 0xcf8 0x80000804 &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;| outb 0xcfc 0xc3<br>
</div>
<div>&gt; &gt; &gt; &gt; outl 0xcfc 0x10000006 &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;| outl 0xcf8 0x80000804<br>
</div>
<div>&gt; &gt; &gt; &gt; write 0xc300001028 0x1 0x5a &nbsp; &nbsp;| outl 0x=
cfc 0x10000006<br>
</div>
<div>&gt; &gt; &gt; &gt; write 0xc300001024 0x2 0x10 &nbsp; &nbsp;| write 0=
xc300001028 0x1 0x5a<br>
</div>
<div>&gt; &gt; &gt; &gt; write 0xc30000101c 0x1 0x01 &nbsp; &nbsp;| writel =
0xc30000100c 0x2a6f6c63<br>
</div>
<div>&gt; &gt; &gt; &gt; write 0xc300003002 0x1 0x0 &nbsp; &nbsp;&nbsp;v wr=
ite 0xc300001024 0x2 0x10<br>
</div>
<div>&gt; &gt; &gt; &gt; write 0x5c 0x1 0x10 &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;write 0xc30000101c 0x1 0x01<br>
</div>
<div>&gt; &gt; &gt; &gt; writel 0xc30000100c 0x2a6f6c63 &nbsp;&nbsp;write 0=
xc300001018 0x1 0x80<br>
</div>
<div>&gt; &gt; &gt; &gt; write 0xc300001018 0x1 0x80 &nbsp; &nbsp; &nbsp;wr=
ite 0x5c 0x1 0x10<br>
</div>
<div>&gt; &gt; &gt; &gt; outl 0xcf8 0x0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;write 0xc300003002 0x1 0x0<br>
</div>
<div>&gt; &gt; &gt; &gt; <br>
</div>
<div>&gt; &gt; &gt; <br>
</div>
<div>&gt; &gt; &gt; In this example, I can remove the outl 0xcf8 0x0, and I=
 still see<br>
</div>
<div>&gt; &gt; &gt; the<br>
</div>
<div>&gt; &gt; &gt; crash, so maybe the 1st step in the minimizer is failin=
g<br>
</div>
<div>&gt; &gt; &gt; somewhere..&nbsp;<br>
</div>
<div>&gt; &gt; <br>
</div>
<div>&gt; &gt; I think it might because of our one-time scan and remove str=
ategy,<br>
</div>
<div>&gt; &gt; which is not suitable for timing dependent instructions.<br>
</div>
<div>&gt; &gt; <br>
</div>
<div>&gt; &gt; For example, instruction A will indicate an address where th=
e<br>
</div>
<div>&gt; &gt; config<br>
</div>
<div>&gt; &gt; chunk locates, and instruction B will make the configuration=
<br>
</div>
<div>&gt; &gt; active. If<br>
</div>
<div>&gt; &gt; we have the following instruction sequence:<br>
</div>
<div>&gt; &gt; <br>
</div>
<div>&gt; &gt; ...<br>
</div>
<div>&gt; &gt; A1<br>
</div>
<div>&gt; &gt; B1<br>
</div>
<div>&gt; &gt; A2<br>
</div>
<div>&gt; &gt; B2<br>
</div>
<div>&gt; &gt; ...<br>
</div>
<div>&gt; &gt; <br>
</div>
<div>&gt; &gt; A2 and B2 are the actual instructions that trigger the bug.<=
br>
</div>
<div>&gt; &gt; <br>
</div>
<div>&gt; &gt; If we scan from top to bottom, after we remove A1, the behav=
ior of<br>
</div>
<div>&gt; &gt; B1<br>
</div>
<div>&gt; &gt; might be unknowable, including not to crash the program. But=
 we<br>
</div>
<div>&gt; &gt; will<br>
</div>
<div>&gt; &gt; successfully remove B1 later cause A2 and B2 will crash the =
process<br>
</div>
<div>&gt; &gt; anyway:<br>
</div>
<div>&gt; &gt; <br>
</div>
<div>&gt; &gt; ...<br>
</div>
<div>&gt; &gt; A1<br>
</div>
<div>&gt; &gt; A2<br>
</div>
<div>&gt; &gt; B2<br>
</div>
<div>&gt; &gt; ...<br>
</div>
<div>&gt; &gt; <br>
</div>
<div>&gt; &gt; Now one more trimming will remove A1.<br>
</div>
<div>&gt; &gt; <br>
</div>
<div>&gt; &gt; As for the example I gave, the instructions before the delay=
ing<br>
</div>
<div>&gt; &gt; minimizer are like this:<br>
</div>
<div>&gt; &gt; <br>
</div>
<div>&gt; &gt; outl 0xcf8 0x8000081c<br>
</div>
<div>&gt; &gt; outb 0xcfc 0xc3<br>
</div>
<div>&gt; &gt; outl 0xcf8 0x0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;&lt;--- The A instruction, didn't be<br>
</div>
<div>&gt; &gt; removed<br>
</div>
<div>&gt; &gt; (outl 0xcfc 0x0) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;&lt;--- The B instruction, removed<br>
</div>
<div>&gt; &gt; outl 0xcf8 0x80000804<br>
</div>
<div>&gt; &gt; outl 0xcfc 0x10000006<br>
</div>
<div>&gt; &gt; write 0xc300001024 0x2 0x10<br>
</div>
<div>&gt; &gt; write 0xc300001028 0x1 0x5a<br>
</div>
<div>&gt; &gt; write 0xc30000101c 0x1 0x01<br>
</div>
<div>&gt; &gt; writel 0xc30000100c 0x2a6f6c63<br>
</div>
<div>&gt; &gt; write 0xc300001018 0x1 0x80<br>
</div>
<div>&gt; &gt; write 0x5c 0x1 0x10<br>
</div>
<div>&gt; &gt; write 0xc300003002 0x1 0x0<br>
</div>
<div>&gt; &gt; <br>
</div>
<div>&gt; &gt; If we run the remove minimizer again, The A instruction outl=
 0xcf8<br>
</div>
<div>&gt; &gt; 0x0<br>
</div>
<div>&gt; &gt; will be removed.<br>
</div>
<div>&gt; &gt; <br>
</div>
<div>&gt; &gt; Since we only remove instructions, this iterative algorithm =
is<br>
</div>
<div>&gt; &gt; converging. Maybe we can keep removing the trace until the<b=
r>
</div>
<div>&gt; &gt; len(newtrace) become unchanged.<br>
</div>
<div>&gt; &gt; <br>
</div>
<div>&gt; <br>
</div>
<div>&gt; I found a bunch of work related to this &quot;test-case minimizat=
ion&quot;.<br>
</div>
<div>&gt; There<br>
</div>
<div>&gt; are algorithms such as &quot;ddmin&quot; that try to tackle this.=
 There might<br>
</div>
<div>&gt; be<br>
</div>
<div>&gt; some interesting ideas there.<br>
</div>
<div><br>
</div>
<div>Thanks, I will have a look.<br>
</div>
<div><br>
</div>
<div>&gt; I think in the perfect case, we would need to be able to remove A=
 and<br>
</div>
<div>&gt; B<br>
</div>
<div>&gt; at the same time. You described the situation where B1 might lead=
 to<br>
</div>
<div>&gt; a<br>
</div>
<div>&gt; bad state without A1, but there is also the possibility that A1 m=
ight<br>
</div>
<div>&gt; leave bad state around, without B1. And both of these might be tr=
ue<br>
</div>
<div>&gt; at<br>
</div>
<div>&gt; the same time :) Probably not something we encounter very often,<=
br>
</div>
<div>&gt; though.<br>
</div>
<div><br>
</div>
<div>You are right, and even there can be three instructions which must be =
removed together ;) But for now, how about we just add a if(len(newtrace) =
=3D=3D old_len) loop &nbsp;around remove minimizer? No harm.<br>
</div>
<div><br>
</div>
<div>Do you think this kind of dependence will exist in bits of the write/o=
ut commands? How about adding if(num_bits(data) =3D=3D old_num) loop around=
 the setting zero minimizer?<br>
</div>
<div><br>
</div>
<div>&gt; &gt; &gt; Is the Refined one better? To me the original one read =
as:<br>
</div>
<div>&gt; &gt; &gt; &quot;Do a bunch of PCI configuration to map an MMIO BA=
R, then<br>
</div>
<div>&gt; &gt; &gt; interact<br>
</div>
<div>&gt; &gt; &gt; with<br>
</div>
<div>&gt; &gt; &gt; the MMIO range and trigger some DMA activity&quot;. I a=
lso know<br>
</div>
<div>&gt; &gt; &gt; exactly<br>
</div>
<div>&gt; &gt; &gt; the<br>
</div>
<div>&gt; &gt; &gt; line that will trigger the DMA activity and access 0x5c=
. With the<br>
</div>
<div>&gt; &gt; &gt; refined one, I'm not so sure. Which line now causes the=
 DMA read<br>
</div>
<div>&gt; &gt; &gt; from<br>
</div>
<div>&gt; &gt; &gt; 0x5c? writel 0xc30000100c? write 0xc300001018?<br>
</div>
<div>&gt; &gt; &gt; Is there another example where this type of reordering =
makes the<br>
</div>
<div>&gt; &gt; &gt; result<br>
</div>
<div>&gt; &gt; &gt; easier to read?<br>
</div>
<div>&gt; &gt; &gt; <br>
</div>
<div>&gt; &gt; &gt; &gt; Signed-off-by: Qiuhao Li &lt;Qiuhao.Li@outlook.com=
&gt;<br>
</div>
<div>&gt; &gt; &gt; &gt; ---<br>
</div>
<div>&gt; &gt; &gt; &gt; &nbsp;scripts/oss-fuzz/minimize_qtest_trace.py | 2=
1<br>
</div>
<div>&gt; &gt; &gt; &gt; +++++++++++++++++++++<br>
</div>
<div>&gt; &gt; &gt; &gt; &nbsp;1 file changed, 21 insertions(+)<br>
</div>
<div>&gt; &gt; &gt; &gt; <br>
</div>
<div>&gt; &gt; &gt; &gt; diff --git a/scripts/oss-fuzz/minimize_qtest_trace=
.py<br>
</div>
<div>&gt; &gt; &gt; &gt; b/scripts/oss-fuzz/minimize_qtest_trace.py<br>
</div>
<div>&gt; &gt; &gt; &gt; index f3e88064c4..da7aa73b3c 100755<br>
</div>
<div>&gt; &gt; &gt; &gt; --- a/scripts/oss-fuzz/minimize_qtest_trace.py<br>
</div>
<div>&gt; &gt; &gt; &gt; +++ b/scripts/oss-fuzz/minimize_qtest_trace.py<br>
</div>
<div>&gt; &gt; &gt; &gt; @@ -214,6 +214,27 @@ def minimize_trace(inpath, ou=
tpath):<br>
</div>
<div>&gt; &gt; &gt; &gt; &nbsp;<br>
</div>
<div>&gt; &gt; &gt; &gt; &nbsp; &nbsp; &nbsp;assert(check_if_trace_crashes(=
newtrace, outpath))<br>
</div>
<div>&gt; &gt; &gt; &gt; &nbsp;<br>
</div>
<div>&gt; &gt; &gt; &gt; + &nbsp; &nbsp;# delay IO instructions until they =
can't trigger the crash<br>
</div>
<div>&gt; &gt; &gt; &gt; + &nbsp; &nbsp;# Note: O(n^2) and many timeouts, k=
inda slow<br>
</div>
<div>&gt; &gt; &gt; <br>
</div>
<div>&gt; &gt; &gt; Maybe do a binary search instead of a linear scan for t=
he optimal<br>
</div>
<div>&gt; &gt; &gt; position<br>
</div>
<div>&gt; &gt; &gt; to save some time?<br>
</div>
<div>&gt; &gt; &gt; Also, if you re-run this multiple times, you can end up=
 with<br>
</div>
<div>&gt; &gt; &gt; different<br>
</div>
<div>&gt; &gt; &gt; results, since some lines might not really be tied to a=
 position<br>
</div>
<div>&gt; &gt; &gt; (e.g.<br>
</div>
<div>&gt; &gt; &gt; the outl cf8 0x0 in your example). Maybe it's not a pro=
blem, but<br>
</div>
<div>&gt; &gt; &gt; i'm<br>
</div>
<div>&gt; &gt; &gt; still not sure that this is making the result easier to=
 read.<br>
</div>
<div>&gt; &gt; &gt; -Alex<br>
</div>
<div>&gt; &gt; <br>
</div>
<div>&gt; &gt; I'm not familiar with the PCI configuration and DMA mechanis=
m in<br>
</div>
<div>&gt; &gt; QEMU.<br>
</div>
<div>&gt; &gt; This patch is just random thinking based on empiricism. Mayb=
e I<br>
</div>
<div>&gt; &gt; should<br>
</div>
<div>&gt; &gt; add the &quot;RFC&quot; tag :). In version 2, I won't post t=
his patch.<br>
</div>
<div>&gt; &gt; <br>
</div>
<div>&gt; &gt; BTW, may I ask where I can learn about these IO emulations? =
How do<br>
</div>
<div>&gt; &gt; you<br>
</div>
<div>&gt; &gt; know the address corresponding to the PCI bar and DMA?<br>
</div>
<div>&gt; <br>
</div>
<div>&gt; On PCs, the PCI configuration space is accessed using two I/O por=
ts:<br>
</div>
<div>&gt; 0xcfc and 0xcf8. To interact further with a &nbsp;PCI device, you=
 have to<br>
</div>
<div>&gt; configure its BARs (i.e. the Port IO and memory ranges that will =
map<br>
</div>
<div>&gt; to<br>
</div>
<div>&gt; device registers).<br>
</div>
<div>&gt; https://en.wikipedia.org/wiki/PCI_configuration_space#Bus_enumera=
tion<br>
</div>
<div>&gt; <br>
</div>
<div>&gt; So we can look at the trace again. First there are no virtio-vga<=
br>
</div>
<div>&gt; MMIO/PIO<br>
</div>
<div>&gt; ranges accessible, so the only thing the fuzzer can do is interac=
t<br>
</div>
<div>&gt; with<br>
</div>
<div>&gt; its PCI configuration space using 0xCF8/CFC:<br>
</div>
<div>&gt; <br>
</div>
<div>&gt; outl 0xcf8 0x8000081c<br>
</div>
<div>&gt; outb 0xcfc 0xc3<br>
</div>
<div>&gt; ^^^ The above two lines write the value 0xc3 to PCI config addres=
s<br>
</div>
<div>&gt; 0x1c<br>
</div>
<div>&gt; for the vga device. You can confirm this by running the testcase =
with<br>
</div>
<div>&gt; -trace pci\*. 0x1c is the location of the PCI register that<br>
</div>
<div>&gt; represents<br>
</div>
<div>&gt; BAR #3 for the device.&nbsp;<br>
</div>
<div>&gt; outl 0xcf8 0x80000804<br>
</div>
<div>&gt; outb 0xcfc 0x06<br>
</div>
<div>&gt; ^^^ These two lines write to the PCI command register (0x04) to a=
llow<br>
</div>
<div>&gt; the device to respond to memory accesses.<br>
</div>
<div>&gt; <br>
</div>
<div>&gt; write 0xc300001024 0x2 0x0040<br>
</div>
<div>&gt; write 0xc300001028 0x1 0x5a<br>
</div>
<div>&gt; write 0xc30000101c 0x1 0x01<br>
</div>
<div>&gt; writel 0xc30000100c 0x20000000<br>
</div>
<div>&gt; write 0xc300001016 0x3 0x80a080<br>
</div>
<div>&gt; write 0xc300003002 0x1 0x80<br>
</div>
<div>&gt; ^^^ Now we start to see what looks like MMIO accesses. And if we =
look<br>
</div>
<div>&gt; at<br>
</div>
<div>&gt; the output of -trace pci\* we will find that the 0xc3 value we wr=
ote<br>
</div>
<div>&gt; above, configured an MMIO range at 0xc300000000. That is why the =
MMIO<br>
</div>
<div>&gt; accesses are close to that address.<br>
</div>
<div>&gt; <br>
</div>
<div>&gt; write 0x5c 0x1 0x10<br>
</div>
<div>&gt; ^^^ This I am guessing is a DMA command. Usually I know this simp=
ly<br>
</div>
<div>&gt; by<br>
</div>
<div>&gt; looking at the [DMA] annotations in the input file to<br>
</div>
<div>&gt; reorder_fuzzer_qtest_trace.py. This just means that the device tr=
ied<br>
</div>
<div>&gt; to<br>
</div>
<div>&gt; read from this location in memory, so the fuzzer placed some data=
<br>
</div>
<div>&gt; there.<br>
</div>
<div>&gt; <br>
</div>
<div>&gt; Beyond just broadly seeing that there are some initial PCI<br>
</div>
<div>&gt; configurations on registers 0xCF8/0xCFC, some accesses to address=
es<br>
</div>
<div>&gt; that<br>
</div>
<div>&gt; look like an MMIO range, and one line that probably puts one byte=
 at<br>
</div>
<div>&gt; address 0x5c in ram, I can't really tell anything else just by<br=
>
</div>
<div>&gt; looking<br>
</div>
<div>&gt; at the trace. To write the descriptions above, I had to look at<b=
r>
</div>
<div>&gt; PCI-related resources. Im not convinced that reordering the acces=
ses<br>
</div>
<div>&gt; will really help much with this. Probably the best aid I found fo=
r<br>
</div>
<div>&gt; understanding traces are good trace events (when they exist).<br>
</div>
<div>&gt; <br>
</div>
<div>&gt; -Alex<br>
</div>
<div><br>
</div>
<div>Thank you so much for such a detailed and patient explanation! I will =
use tracing to analyze IO events in the future.<br>
</div>
<div><br>
</div>
<div>The delaying minimizer seems not constructive. I won't post it in vers=
ion 2.<br>
</div>
<div><br>
</div>
<div>Thanks again :)<br>
</div>
<div><br>
</div>
<div>&gt; &gt; &gt; &gt; + &nbsp; &nbsp;i =3D len(newtrace) - 1<br>
</div>
<div>&gt; &gt; &gt; &gt; + &nbsp; &nbsp;while i &gt;=3D 0:<br>
</div>
<div>&gt; &gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;tmp_i =3D newtrace[i]=
<br>
</div>
<div>&gt; &gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;if len(tmp_i) &lt; 2:=
<br>
</div>
<div>&gt; &gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i -=3D =
1<br>
</div>
<div>&gt; &gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;continu=
e<br>
</div>
<div>&gt; &gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;print(&quot;Delaying =
&quot;, newtrace[i])<br>
</div>
<div>&gt; &gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;for j in reversed(ran=
ge(i+1, len(newtrace)+1)):<br>
</div>
<div>&gt; &gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;newtrac=
e.insert(j, tmp_i)<br>
</div>
<div>&gt; &gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;del new=
trace[i]<br>
</div>
<div>&gt; &gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if chec=
k_if_trace_crashes(newtrace, outpath):<br>
</div>
<div>&gt; &gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;break<br>
</div>
<div>&gt; &gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;newtrac=
e.insert(i, tmp_i)<br>
</div>
<div>&gt; &gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;del new=
trace[j]<br>
</div>
<div>&gt; &gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;i -=3D 1<br>
</div>
<div>&gt; &gt; &gt; &gt; +<br>
</div>
<div>&gt; &gt; &gt; &gt; + &nbsp; &nbsp;assert(check_if_trace_crashes(newtr=
ace, outpath))<br>
</div>
<div>&gt; &gt; &gt; &gt; + &nbsp; &nbsp;# maybe another removing round<br>
</div>
<div>&gt; &gt; &gt; &gt; +<br>
</div>
<div>&gt; &gt; &gt; &gt; &nbsp;<br>
</div>
<div>&gt; &gt; &gt; &gt; &nbsp;if __name__ =3D=3D '__main__':<br>
</div>
<div>&gt; &gt; &gt; &gt; &nbsp; &nbsp; &nbsp;if len(sys.argv) &lt; 3:<br>
</div>
<div>&gt; &gt; &gt; &gt; --&nbsp;<br>
</div>
<div>&gt; &gt; &gt; &gt; 2.25.1<br>
</div>
<div>&gt; &gt; &gt; &gt; <br>
</div>
</body>
</html>

--_000_7df9cce0033de87f3f7e8b0019f71b4c0428e68ccameloutlookcom_--

