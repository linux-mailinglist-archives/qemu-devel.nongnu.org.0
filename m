Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32642E3587
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 10:35:13 +0100 (CET)
Received: from localhost ([::1]:55426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktovp-0007NW-0b
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 04:35:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1ktosY-00062l-VY; Mon, 28 Dec 2020 04:31:55 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1ktosU-0006hf-41; Mon, 28 Dec 2020 04:31:50 -0500
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4D4C2v4whhz58Cd;
 Mon, 28 Dec 2020 17:30:47 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Mon, 28 Dec 2020 17:31:35 +0800
Received: from dggeme770-chm.china.huawei.com (10.3.19.116) by
 dggpemm000001.china.huawei.com (7.185.36.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.1913.5; Mon, 28 Dec 2020 17:31:35 +0800
Received: from dggeme770-chm.china.huawei.com ([10.8.68.58]) by
 dggeme770-chm.china.huawei.com ([10.8.68.58]) with mapi id 15.01.1913.007;
 Mon, 28 Dec 2020 17:31:34 +0800
From: gaojinhao <gaojinhao@huawei.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: RE: [PATCH 4/8] spapr_pci: Fix memory leak of vmstate_spapr_pci
Thread-Topic: [PATCH 4/8] spapr_pci: Fix memory leak of vmstate_spapr_pci
Thread-Index: AQHW3OcZQWt+nwvkI0aSp0n3c7YGkqoMIswg//+EnICAAI/2MA==
Date: Mon, 28 Dec 2020 09:31:34 +0000
Message-ID: <6416730c88794a97b48ea03b2ea9416c@huawei.com>
References: <20201226103347.868-1-gaojinhao@huawei.com>
 <20201226103347.868-5-gaojinhao@huawei.com>
 <20201228065824.GB6952@yekko.fritz.box>
 <013a231c9cab4f3da7be9d88d87f34ae@huawei.com>
 <20201228083013.GM6952@yekko.fritz.box>
In-Reply-To: <20201228083013.GM6952@yekko.fritz.box>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.187.50]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=gaojinhao@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Juan Quintela <quintela@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 =?gb2312?B?TWFyYy1BbmRyqKYgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 zhukeqian <zhukeqian1@huawei.com>, "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhhbmsgeW91IGZvciB5b3UgcmVwbHksIEkgdW5kZXJzdGFuZC4NCg0KSmluaGFvIEdhbw0KDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogRGF2aWQgR2lic29uIFttYWlsdG86ZGF2
aWRAZ2lic29uLmRyb3BiZWFyLmlkLmF1XSANClNlbnQ6IDIwMjDE6jEy1MIyOMjVIDE2OjMwDQpU
bzogZ2FvamluaGFvIDxnYW9qaW5oYW9AaHVhd2VpLmNvbT4NCkNjOiBxZW11LWRldmVsQG5vbmdu
dS5vcmc7IHFlbXUtcHBjQG5vbmdudS5vcmc7IE1hcmMtQW5kcqimIEx1cmVhdSA8bWFyY2FuZHJl
Lmx1cmVhdUByZWRoYXQuY29tPjsgU3RlZmFuIEJlcmdlciA8c3RlZmFuYkBsaW51eC52bmV0Lmli
bS5jb20+OyBNaWNoYWVsIFMgLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT47IEphc29uIFdhbmcg
PGphc293YW5nQHJlZGhhdC5jb20+OyBHcmVnIEt1cnogPGdyb3VnQGthb2Qub3JnPjsgSnVhbiBR
dWludGVsYSA8cXVpbnRlbGFAcmVkaGF0LmNvbT47IERyIC4gRGF2aWQgQWxhbiBHaWxiZXJ0IDxk
Z2lsYmVydEByZWRoYXQuY29tPjsgV2FuZ2hhaWJpbiAoRCkgPHdhbmdoYWliaW4ud2FuZ0BodWF3
ZWkuY29tPjsgemh1a2VxaWFuIDx6aHVrZXFpYW4xQGh1YXdlaS5jb20+DQpTdWJqZWN0OiBSZTog
W1BBVENIIDQvOF0gc3BhcHJfcGNpOiBGaXggbWVtb3J5IGxlYWsgb2Ygdm1zdGF0ZV9zcGFwcl9w
Y2kNCg0KT24gTW9uLCBEZWMgMjgsIDIwMjAgYXQgMDg6MTA6MzFBTSArMDAwMCwgZ2FvamluaGFv
IHdyb3RlOg0KPiBIaSBEYXZpZCwNCj4gRmlyc3RseSwgdGhhbmsgeW91IGZvciB5b3UgcmV2aWV3
LiBBbmQgdGhlbiBmb3IgeW91ciByZXZpZXcsIEkgd29ycnkgDQo+IHRoYXQgYSBtZW1vcnkgbGVh
ayB3aWxsIG9jY3VyIGlmIFFFTVUgZXhpdHMgYWZ0ZXIgc2F2ZXMgdm1zZC4gU28sIHdlIA0KPiBm
cmVlIGl0IGluIHBvc3Rfc2F2ZSBmdW5jLg0KDQpJZiBxZW11IGV4aXRzLCBhbGwgaXRzIG1lbW9y
eSB3aWxsIGJlIGZyZWVkLCBzbyB3ZSBkb24ndCBjYXJlLg0KDQo+IA0KPiBKaW5oYW8gR2FvDQo+
IA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEYXZpZCBHaWJzb24gW21h
aWx0bzpkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXVdDQo+IFNlbnQ6IDIwMjAtMTItMjggMTQ6
NTgNCj4gVG86IGdhb2ppbmhhbyA8Z2FvamluaGFvQGh1YXdlaS5jb20+DQo+IENjOiBxZW11LWRl
dmVsQG5vbmdudS5vcmc7IHFlbXUtcHBjQG5vbmdudS5vcmc7IE1hcmMtQW5kcqimIEx1cmVhdSAN
Cj4gPG1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbT47IFN0ZWZhbiBCZXJnZXIgDQo+IDxzdGVm
YW5iQGxpbnV4LnZuZXQuaWJtLmNvbT47IE1pY2hhZWwgUyAuIFRzaXJraW4gPG1zdEByZWRoYXQu
Y29tPjsgDQo+IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+OyBHcmVnIEt1cnogPGdy
b3VnQGthb2Qub3JnPjsgSnVhbiANCj4gUXVpbnRlbGEgPHF1aW50ZWxhQHJlZGhhdC5jb20+OyBE
ciAuIERhdmlkIEFsYW4gR2lsYmVydCANCj4gPGRnaWxiZXJ0QHJlZGhhdC5jb20+OyBXYW5naGFp
YmluIChEKSA8d2FuZ2hhaWJpbi53YW5nQGh1YXdlaS5jb20+OyANCj4gemh1a2VxaWFuIDx6aHVr
ZXFpYW4xQGh1YXdlaS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNC84XSBzcGFwcl9wY2k6
IEZpeCBtZW1vcnkgbGVhayBvZiANCj4gdm1zdGF0ZV9zcGFwcl9wY2kNCj4gDQo+IE9uIFNhdCwg
RGVjIDI2LCAyMDIwIGF0IDA2OjMzOjQzUE0gKzA4MDAsIGcwMDUxNzc5MSB3cm90ZToNCj4gPiBG
cm9tOiBKaW5oYW8gR2FvIDxnYW9qaW5oYW9AaHVhd2VpLmNvbT4NCj4gPiANCj4gPiBXaGVuIFZN
IG1pZ3JhdGUgVk1TdGF0ZSBvZiBzcGFwcl9wY2ksIHRoZSBmaWVsZChtc2lfZGV2cykgb2YgDQo+
ID4gc3BhcHJfcGNpIGhhdmluZyBhIGZsYWcgb2YgVk1TX0FMTE9DIG5lZWQgdG8gYWxsb2NhdGUg
bWVtb3J5LiBJZiB0aGUgDQo+ID4gc3JjIGRvZXNuJ3QgZnJlZSBtZW1vcnkgb2YgbXNpX2RldnMg
aW4gU2F2ZVN0YXRlRW50cnkgb2Ygc3BhcHJfcGNpIA0KPiA+IGFmdGVyIFFFTVVGaWxlIHNhdmUg
Vk1TdGF0ZSBvZiBzcGFwcl9wY2ksIGl0IG1heSByZXN1bHQgaW4gbWVtb3J5IGxlYWsgb2YgbXNp
X2RldnMuDQo+ID4gV2UgYWRkIHRoZSBwb3N0X3NhdmUgZnVuYyB0byBmcmVlIG1lbW9yeSwgd2hp
Y2ggcHJldmVudHMgbWVtb3J5IGxlYWsuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSmluaGFv
IEdhbyA8Z2FvamluaGFvQGh1YXdlaS5jb20+DQo+IA0KPiBOb3QgcmVhbGx5IGEgbWVtb3J5IGxl
YWssIHNpbmNlIGl0IHdpbGwgZ2V0IGZyZWVkIG9uIHRoZSBuZXh0IA0KPiBwcmVfc2F2ZS4gIEJ1
dCwgd2UgbWlnaHQgYXMgd2VsbCBmcmVlIGl0IGVhcmxpZXIgaWYgd2UgY2FuICxzbw0KPiANCj4g
QWNrZWQtYnk6IERhdmlkIEdpYnNvbiA8ZGF2aWRAZ2lic29uLmRyb3BiZWFyLmlkLmF1Pg0KPiAN
Cj4gPiAtLS0NCj4gPiAgaHcvcHBjL3NwYXByX3BjaS5jIHwgMTEgKysrKysrKysrKysNCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEv
aHcvcHBjL3NwYXByX3BjaS5jIGIvaHcvcHBjL3NwYXByX3BjaS5jIGluZGV4DQo+ID4gNzZkN2M5
MWU5Yy4uMWIyYjk0MDYwNiAxMDA2NDQNCj4gPiAtLS0gYS9ody9wcGMvc3BhcHJfcGNpLmMNCj4g
PiArKysgYi9ody9wcGMvc3BhcHJfcGNpLmMNCj4gPiBAQCAtMjE3Myw2ICsyMTczLDE2IEBAIHN0
YXRpYyBpbnQgc3BhcHJfcGNpX3ByZV9zYXZlKHZvaWQgKm9wYXF1ZSkNCj4gPiAgICAgIHJldHVy
biAwOw0KPiA+ICB9DQo+ID4gIA0KPiA+ICtzdGF0aWMgaW50IHNwYXByX3BjaV9wb3N0X3NhdmUo
dm9pZCAqb3BhcXVlKSB7DQo+ID4gKyAgICBTcGFwclBoYlN0YXRlICpzcGhiID0gb3BhcXVlOw0K
PiA+ICsNCj4gPiArICAgIGdfZnJlZShzcGhiLT5tc2lfZGV2cyk7DQo+ID4gKyAgICBzcGhiLT5t
c2lfZGV2cyA9IE5VTEw7DQo+ID4gKyAgICBzcGhiLT5tc2lfZGV2c19udW0gPSAwOw0KPiA+ICsg
ICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gIHN0YXRpYyBpbnQgc3BhcHJfcGNpX3Bv
c3RfbG9hZCh2b2lkICpvcGFxdWUsIGludCB2ZXJzaW9uX2lkKSAgew0KPiA+ICAgICAgU3BhcHJQ
aGJTdGF0ZSAqc3BoYiA9IG9wYXF1ZTsNCj4gPiBAQCAtMjIwNSw2ICsyMjE1LDcgQEAgc3RhdGlj
IGNvbnN0IFZNU3RhdGVEZXNjcmlwdGlvbiB2bXN0YXRlX3NwYXByX3BjaSA9IHsNCj4gPiAgICAg
IC52ZXJzaW9uX2lkID0gMiwNCj4gPiAgICAgIC5taW5pbXVtX3ZlcnNpb25faWQgPSAyLA0KPiA+
ICAgICAgLnByZV9zYXZlID0gc3BhcHJfcGNpX3ByZV9zYXZlLA0KPiA+ICsgICAgLnBvc3Rfc2F2
ZSA9IHNwYXByX3BjaV9wb3N0X3NhdmUsDQo+ID4gICAgICAucG9zdF9sb2FkID0gc3BhcHJfcGNp
X3Bvc3RfbG9hZCwNCj4gPiAgICAgIC5maWVsZHMgPSAoVk1TdGF0ZUZpZWxkW10pIHsNCj4gPiAg
ICAgICAgICBWTVNUQVRFX1VJTlQ2NF9FUVVBTChidWlkLCBTcGFwclBoYlN0YXRlLCBOVUxMKSwN
Cj4gDQoNCi0tIA0KRGF2aWQgR2lic29uCQkJfCBJJ2xsIGhhdmUgbXkgbXVzaWMgYmFyb3F1ZSwg
YW5kIG15IGNvZGUNCmRhdmlkIEFUIGdpYnNvbi5kcm9wYmVhci5pZC5hdQl8IG1pbmltYWxpc3Qs
IHRoYW5rIHlvdS4gIE5PVCBfdGhlXyBfb3RoZXJfDQoJCQkJfCBfd2F5XyBfYXJvdW5kXyENCmh0
dHA6Ly93d3cub3psYWJzLm9yZy9+ZGdpYnNvbg0K

