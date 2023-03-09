Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D726B1B3B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 07:16:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa9YX-0000ie-AH; Thu, 09 Mar 2023 01:15:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangming73@huawei.com>)
 id 1pa9YT-0000iU-Bz
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 01:15:09 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangming73@huawei.com>)
 id 1pa9YQ-0004xi-OB
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 01:15:09 -0500
Received: from dggpemm100004.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PXJkg6sdxzKq7C;
 Thu,  9 Mar 2023 14:12:43 +0800 (CST)
Received: from dggpemm500010.china.huawei.com (7.185.36.134) by
 dggpemm100004.china.huawei.com (7.185.36.189) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 14:14:49 +0800
Received: from dggpemm500010.china.huawei.com ([7.185.36.134]) by
 dggpemm500010.china.huawei.com ([7.185.36.134]) with mapi id 15.01.2507.021;
 Thu, 9 Mar 2023 14:14:49 +0800
To: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "wangzhigang (O)"
 <wangzhigang17@huawei.com>, "zhangliang (AG)" <zhangliang5@huawei.com>, xiqi
 <xiqi2@huawei.com>
Subject: Reply: [PATCH v2] virtio-balloon: optimize the virtio-balloon on the
 ARM platform
Thread-Topic: Reply: [PATCH v2] virtio-balloon: optimize the virtio-balloon on
 the ARM platform
Thread-Index: AdlSTll2RbBbWgbQQnGmOBsVVB0T7w==
Date: Thu, 9 Mar 2023 06:14:49 +0000
Message-ID: <9544c4fe084c4bf281b744eb4e0c998b@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.184.140]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=yangming73@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Yangming <yangming73@huawei.com>
From:  Yangming via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

PiBPbiAwOC4wMy4yMyAwMTo0MiwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOg0KPiA+IE9uIFdl
ZCwgTWFyIDAxLCAyMDIzIGF0IDA2OjM4OjEzQU0gKzAwMDAsIFlhbmdtaW5nIHdyb3RlOg0KPiA+
PiBPcHRpbWl6ZSB0aGUgdmlydGlvLWJhbGxvb24gZmVhdHVyZSBvbiB0aGUgQVJNIHBsYXRmb3Jt
IGJ5IGFkZGluZyBhDQo+ID4+IHZhcmlhYmxlIHRvIGtlZXAgdHJhY2sgb2YgdGhlIGN1cnJlbnQg
aG90LXBsdWdnZWQgcGMtZGltbSBzaXplLA0KPiA+PiBpbnN0ZWFkIG9mIHRyYXZlcnNpbmcgdGhl
IHZpcnR1YWwgbWFjaGluZSdzIG1lbW9yeSBtb2R1bGVzIHRvIGNvdW50DQo+ID4+IHRoZSBjdXJy
ZW50IFJBTSBzaXplIGR1cmluZyB0aGUgYmFsbG9vbiBpbmZsYXRpb24gb3IgZGVmbGF0aW9uDQo+
ID4+IHByb2Nlc3MuIFRoaXMgdmFyaWFibGUgY2FuIGJlIHVwZGF0ZWQgb25seSB3aGVuIHBsdWdn
aW5nIG9yDQo+ID4+IHVucGx1Z2dpbmcgdGhlIGRldmljZSwgd2hpY2ggd2lsbCByZXN1bHQgaW4g
YW4gaW5jcmVhc2Ugb2YNCj4gPj4gYXBwcm94aW1hdGVseSA2MCUgZWZmaWNpZW5jeSBvZiBiYWxs
b29uIHByb2Nlc3Mgb24gdGhlIEFSTSBwbGF0Zm9ybS4NCj4gPj4NCj4gPj4gV2UgdGVzdGVkIHRo
ZSB0b3RhbCBhbW91bnQgb2YgdGltZSByZXF1aXJlZCBmb3IgdGhlIGJhbGxvb24gaW5mbGF0aW9u
DQo+IHByb2Nlc3Mgb24gQVJNOg0KPiA+PiBpbmZsYXRlIHRoZSBiYWxsb29uIHRvIDY0R0Igb2Yg
YSAxMjhHQiBndWVzdCB1bmRlciBzdHJlc3MuDQo+ID4+IEJlZm9yZTogMTAyIHNlY29uZHMNCj4g
Pj4gQWZ0ZXI6IDQyIHNlY29uZHMNCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogUWkgWGkgPHhp
cWkyQGh1YXdlaS5jb20+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IE1pbmcgWWFuZyB5YW5nbWluZzcz
QGh1YXdlaS5jb20NCj4gPj4gLS0tDQo+ID4+IFJlZmFjdG9yIHRoZSBjb2RlIGJ5IGFkZGluZyBj
b21tZW50cyBhbmQgcmVtb3ZpbmcgdW5uZWNlc3NhcnkgY29kZS4NCj4gPj4NCj4gPj4gICBody9t
ZW0vcGMtZGltbS5jICAgICAgICAgICB8ICA3ICsrKysrKysNCj4gPj4gICBody92aXJ0aW8vdmly
dGlvLWJhbGxvb24uYyB8IDMzICsrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+
PiAgIGluY2x1ZGUvaHcvYm9hcmRzLmggICAgICAgIHwgIDIgKysNCj4gPj4gICAzIGZpbGVzIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiBkaWZm
IC0tZ2l0IGEvaHcvbWVtL3BjLWRpbW0uYyBiL2h3L21lbS9wYy1kaW1tLmMgaW5kZXgNCj4gPj4g
NTBlZjgzMjE1Yy4uM2YyNzM0YTI2NyAxMDA2NDQNCj4gPj4gLS0tIGEvaHcvbWVtL3BjLWRpbW0u
Yw0KPiA+PiArKysgYi9ody9tZW0vcGMtZGltbS5jDQo+ID4+IEBAIC04MSw2ICs4MSwxMCBAQCB2
b2lkIHBjX2RpbW1fcGx1ZyhQQ0RJTU1EZXZpY2UgKmRpbW0sDQo+IE1hY2hpbmVTdGF0ZQ0KPiA+
PiAqbWFjaGluZSkNCj4gPj4NCj4gPj4gICAgICAgbWVtb3J5X2RldmljZV9wbHVnKE1FTU9SWV9E
RVZJQ0UoZGltbSksIG1hY2hpbmUpOw0KPiA+PiAgICAgICB2bXN0YXRlX3JlZ2lzdGVyX3JhbSh2
bXN0YXRlX21yLCBERVZJQ0UoZGltbSkpOw0KPiA+PiArICAgIC8qIGNvdW50IG9ubHkgInJlYWwi
IERJTU1zLCBub3QgTlZESU1NcyAqLw0KPiA+PiArICAgIGlmICghb2JqZWN0X2R5bmFtaWNfY2Fz
dChPQkpFQ1QoZGltbSksIFRZUEVfTlZESU1NKSkgew0KPiA+PiArICAgICAgICBtYWNoaW5lLT5k
ZXZpY2VfbWVtb3J5LT5kaW1tX3NpemUgKz0gdm1zdGF0ZV9tci0+c2l6ZTsNCj4gPj4gKyAgICB9
DQo+ID4+ICAgfQ0KPiA+Pg0KPiA+PiAgIHZvaWQgcGNfZGltbV91bnBsdWcoUENESU1NRGV2aWNl
ICpkaW1tLCBNYWNoaW5lU3RhdGUgKm1hY2hpbmUpDQo+ID4NCj4gPiB2bXN0YXRlX21yLT5zaXpl
IGlzIEludDEyOCB5b3UgYXJlIG5vdCBzdXBwb3NlZCB0byBkbyBtYXRoIG9uIGl0Lg0KPiA+DQo+
ID4gQW5kIGdlbmVyYWxseSBwb2tpbmcgYXQgdGhpcyBzdHJ1Y3QgaXMgYSBiYWQgaWRlYS4NCj4g
Pg0KPiA+IEkgdGhpbmsgbWVtb3J5X3JlZ2lvbl9zaXplIHdpbGwgZG8gd2hhdCB5b3Ugd2FudCBi
dXQgbm90IDEwMCUgc3VyZS4NCj4gPiBNYXliZSB5b3UgbmVlZCB0byBsb29rIGF0IHRoZSBmbGF0
dmlldyAuLi4NCj4gDQo+IEdvb2QgcG9pbnQsIHdlIHNob3VsZCB1c2UgbWVtb3J5X3JlZ2lvbl9z
aXplKCkuDQo+IA0KPiAtLQ0KPiBUaGFua3MsDQo+IA0KPiBEYXZpZCAvIGRoaWxkZW5iDQoNClRo
YW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24uIFRoZSBwcm9ibGVtIHdpbGwgYmUgZml4ZWQgaW4gdGhl
IHVwY29taW5nIHRoaXJkIHZlcnNpb24gYnkgdXNpbmcgJ21lbW9yeV9yZWdpb25fc2l6ZSgpJy4N
Cg0KQnkgdGhlIHdheSwgd2UgZm91bmQgdGhhdCB0aGUgc2l6ZSBvZiB0aGUgb2JqZWN0IGlzIGFs
aWduZWQgd2l0aCAncWVtdV9ob3N0X3BhZ2Vfc2l6ZScgYmVmb3JlIGFsbG9jYXRpbmcgdGhlIG1l
bW9yeSAoc2VlIGRldGFpbHMgaW4gJ3FlbXVfcmFtX2FsbG9jX2ludGVybmFsKCknIGZyb20gc29m
dG1tdS9waHlzbWVtLmMpLiBUaGlzIG1lYW5zIHRoYXQgdGhlIGFjdHVhbCBhbGxvY2F0ZWQgbWVt
b3J5IG1heSBkaWZmZXIgZnJvbSB0aGUgc2l6ZSBkZWZpbmVkIGluIHRoZSBPYmplY3QuIEFzIGEg
cmVzdWx0LCBpbiAnZ2V0X2N1cnJlbnRfcmFtX3NpemUoKScsIHRoZSBvcmlnaW5hbCBtZXRob2Qg
b2YgY291bnRpbmcgaG90LXBsdWdnZWQgbWVtb3J5IGZyb20gdGhlIE9iamVjdCBtYXkgbm90IGJl
IGFjY3VyYXRlLiBOb3csIHdlIGNvdW50IHRoZSBzaXplIGZyb20gdGhlIG1lbW9yeSByZWdpb24s
IHdoaWNoIGlzIGEgcHJvcGVyIHdheSB0byBnZXQgdGhlIGFjdHVhbCBzaXplIG9mIG1lbW9yeSBh
bGxvY2F0ZWQuDQoNClRoYW5rcywNCg0KWGlRaQ0K

