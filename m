Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF4B6CCFFC
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 04:32:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phLaq-0001OU-EI; Tue, 28 Mar 2023 22:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangming73@huawei.com>)
 id 1phLZC-0007lr-Py
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 22:29:38 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangming73@huawei.com>)
 id 1phLZ9-0007gm-6P
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 22:29:38 -0400
Received: from dggpemm100002.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4PmVq56SSKzKnST;
 Wed, 29 Mar 2023 10:28:49 +0800 (CST)
Received: from dggpemm500010.china.huawei.com (7.185.36.134) by
 dggpemm100002.china.huawei.com (7.185.36.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 10:29:18 +0800
Received: from dggpemm500010.china.huawei.com ([7.185.36.134]) by
 dggpemm500010.china.huawei.com ([7.185.36.134]) with mapi id 15.01.2507.021;
 Wed, 29 Mar 2023 10:29:18 +0800
To: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "wangzhigang (O)"
 <wangzhigang17@huawei.com>, "zhangliang (AG)" <zhangliang5@huawei.com>, xiqi
 <xiqi2@huawei.com>
Subject: Reply: [PATCH v2] virtio-balloon: optimize the virtio-balloon on the
 ARM platform
Thread-Topic: Reply: [PATCH v2] virtio-balloon: optimize the virtio-balloon on
 the ARM platform
Thread-Index: AdlSTll2RbBbWgbQQnGmOBsVVB0T7///rCsA/+B8xIA=
Date: Wed, 29 Mar 2023 02:29:18 +0000
Message-ID: <38eb932af8f8438b9984295957943d91@huawei.com>
References: <9544c4fe084c4bf281b744eb4e0c998b@huawei.com>
 <66f9d36a-3095-5854-5004-030c963166b0@redhat.com>
In-Reply-To: <66f9d36a-3095-5854-5004-030c963166b0@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.184.140]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=yangming73@huawei.com; helo=szxga03-in.huawei.com
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

PiBPbiAwOS4wMy4yMyAwNzoxNCwgWWFuZ21pbmcgd3JvdGU6DQo+ID4+IE9uIDA4LjAzLjIzIDAx
OjQyLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6DQo+ID4+PiBPbiBXZWQsIE1hciAwMSwgMjAy
MyBhdCAwNjozODoxM0FNICswMDAwLCBZYW5nbWluZyB3cm90ZToNCj4gPj4+PiBPcHRpbWl6ZSB0
aGUgdmlydGlvLWJhbGxvb24gZmVhdHVyZSBvbiB0aGUgQVJNIHBsYXRmb3JtIGJ5IGFkZGluZyBh
DQo+ID4+Pj4gdmFyaWFibGUgdG8ga2VlcCB0cmFjayBvZiB0aGUgY3VycmVudCBob3QtcGx1Z2dl
ZCBwYy1kaW1tIHNpemUsDQo+ID4+Pj4gaW5zdGVhZCBvZiB0cmF2ZXJzaW5nIHRoZSB2aXJ0dWFs
IG1hY2hpbmUncyBtZW1vcnkgbW9kdWxlcyB0byBjb3VudA0KPiA+Pj4+IHRoZSBjdXJyZW50IFJB
TSBzaXplIGR1cmluZyB0aGUgYmFsbG9vbiBpbmZsYXRpb24gb3IgZGVmbGF0aW9uDQo+ID4+Pj4g
cHJvY2Vzcy4gVGhpcyB2YXJpYWJsZSBjYW4gYmUgdXBkYXRlZCBvbmx5IHdoZW4gcGx1Z2dpbmcg
b3INCj4gPj4+PiB1bnBsdWdnaW5nIHRoZSBkZXZpY2UsIHdoaWNoIHdpbGwgcmVzdWx0IGluIGFu
IGluY3JlYXNlIG9mDQo+ID4+Pj4gYXBwcm94aW1hdGVseSA2MCUgZWZmaWNpZW5jeSBvZiBiYWxs
b29uIHByb2Nlc3Mgb24gdGhlIEFSTSBwbGF0Zm9ybS4NCj4gPj4+Pg0KPiA+Pj4+IFdlIHRlc3Rl
ZCB0aGUgdG90YWwgYW1vdW50IG9mIHRpbWUgcmVxdWlyZWQgZm9yIHRoZSBiYWxsb29uDQo+ID4+
Pj4gaW5mbGF0aW9uDQo+ID4+IHByb2Nlc3Mgb24gQVJNOg0KPiA+Pj4+IGluZmxhdGUgdGhlIGJh
bGxvb24gdG8gNjRHQiBvZiBhIDEyOEdCIGd1ZXN0IHVuZGVyIHN0cmVzcy4NCj4gPj4+PiBCZWZv
cmU6IDEwMiBzZWNvbmRzDQo+ID4+Pj4gQWZ0ZXI6IDQyIHNlY29uZHMNCj4gPj4+Pg0KPiA+Pj4+
IFNpZ25lZC1vZmYtYnk6IFFpIFhpIDx4aXFpMkBodWF3ZWkuY29tPg0KPiA+Pj4+IFNpZ25lZC1v
ZmYtYnk6IE1pbmcgWWFuZyB5YW5nbWluZzczQGh1YXdlaS5jb20NCj4gPj4+PiAtLS0NCj4gPj4+
PiBSZWZhY3RvciB0aGUgY29kZSBieSBhZGRpbmcgY29tbWVudHMgYW5kIHJlbW92aW5nIHVubmVj
ZXNzYXJ5DQo+IGNvZGUuDQo+ID4+Pj4NCj4gPj4+PiAgICBody9tZW0vcGMtZGltbS5jICAgICAg
ICAgICB8ICA3ICsrKysrKysNCj4gPj4+PiAgICBody92aXJ0aW8vdmlydGlvLWJhbGxvb24uYyB8
IDMzICsrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+Pj4+ICAgIGluY2x1ZGUv
aHcvYm9hcmRzLmggICAgICAgIHwgIDIgKysNCj4gPj4+PiAgICAzIGZpbGVzIGNoYW5nZWQsIDE0
IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQ0KPiA+Pj4+DQo+ID4+Pj4gZGlmZiAtLWdp
dCBhL2h3L21lbS9wYy1kaW1tLmMgYi9ody9tZW0vcGMtZGltbS5jIGluZGV4DQo+ID4+Pj4gNTBl
ZjgzMjE1Yy4uM2YyNzM0YTI2NyAxMDA2NDQNCj4gPj4+PiAtLS0gYS9ody9tZW0vcGMtZGltbS5j
DQo+ID4+Pj4gKysrIGIvaHcvbWVtL3BjLWRpbW0uYw0KPiA+Pj4+IEBAIC04MSw2ICs4MSwxMCBA
QCB2b2lkIHBjX2RpbW1fcGx1ZyhQQ0RJTU1EZXZpY2UgKmRpbW0sDQo+ID4+IE1hY2hpbmVTdGF0
ZQ0KPiA+Pj4+ICptYWNoaW5lKQ0KPiA+Pj4+DQo+ID4+Pj4gICAgICAgIG1lbW9yeV9kZXZpY2Vf
cGx1ZyhNRU1PUllfREVWSUNFKGRpbW0pLCBtYWNoaW5lKTsNCj4gPj4+PiAgICAgICAgdm1zdGF0
ZV9yZWdpc3Rlcl9yYW0odm1zdGF0ZV9tciwgREVWSUNFKGRpbW0pKTsNCj4gPj4+PiArICAgIC8q
IGNvdW50IG9ubHkgInJlYWwiIERJTU1zLCBub3QgTlZESU1NcyAqLw0KPiA+Pj4+ICsgICAgaWYg
KCFvYmplY3RfZHluYW1pY19jYXN0KE9CSkVDVChkaW1tKSwgVFlQRV9OVkRJTU0pKSB7DQo+ID4+
Pj4gKyAgICAgICAgbWFjaGluZS0+ZGV2aWNlX21lbW9yeS0+ZGltbV9zaXplICs9IHZtc3RhdGVf
bXItPnNpemU7DQo+ID4+Pj4gKyAgICB9DQo+ID4+Pj4gICAgfQ0KPiA+Pj4+DQo+ID4+Pj4gICAg
dm9pZCBwY19kaW1tX3VucGx1ZyhQQ0RJTU1EZXZpY2UgKmRpbW0sIE1hY2hpbmVTdGF0ZQ0KPiAq
bWFjaGluZSkNCj4gPj4+DQo+ID4+PiB2bXN0YXRlX21yLT5zaXplIGlzIEludDEyOCB5b3UgYXJl
IG5vdCBzdXBwb3NlZCB0byBkbyBtYXRoIG9uIGl0Lg0KPiA+Pj4NCj4gPj4+IEFuZCBnZW5lcmFs
bHkgcG9raW5nIGF0IHRoaXMgc3RydWN0IGlzIGEgYmFkIGlkZWEuDQo+ID4+Pg0KPiA+Pj4gSSB0
aGluayBtZW1vcnlfcmVnaW9uX3NpemUgd2lsbCBkbyB3aGF0IHlvdSB3YW50IGJ1dCBub3QgMTAw
JSBzdXJlLg0KPiA+Pj4gTWF5YmUgeW91IG5lZWQgdG8gbG9vayBhdCB0aGUgZmxhdHZpZXcgLi4u
DQo+ID4+DQo+ID4+IEdvb2QgcG9pbnQsIHdlIHNob3VsZCB1c2UgbWVtb3J5X3JlZ2lvbl9zaXpl
KCkuDQo+ID4+DQo+ID4+IC0tDQo+ID4+IFRoYW5rcywNCj4gPj4NCj4gPj4gRGF2aWQgLyBkaGls
ZGVuYg0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbi4gVGhlIHByb2JsZW0gd2ls
bCBiZSBmaXhlZCBpbiB0aGUgdXBjb21pbmcgdGhpcmQNCj4gdmVyc2lvbiBieSB1c2luZyAnbWVt
b3J5X3JlZ2lvbl9zaXplKCknLg0KPiA+DQo+ID4gQnkgdGhlIHdheSwgd2UgZm91bmQgdGhhdCB0
aGUgc2l6ZSBvZiB0aGUgb2JqZWN0IGlzIGFsaWduZWQgd2l0aA0KPiAncWVtdV9ob3N0X3BhZ2Vf
c2l6ZScgYmVmb3JlIGFsbG9jYXRpbmcgdGhlIG1lbW9yeSAoc2VlIGRldGFpbHMgaW4NCj4gJ3Fl
bXVfcmFtX2FsbG9jX2ludGVybmFsKCknIGZyb20gc29mdG1tdS9waHlzbWVtLmMpLiBUaGlzIG1l
YW5zIHRoYXQNCj4gdGhlIGFjdHVhbCBhbGxvY2F0ZWQgbWVtb3J5IG1heSBkaWZmZXIgZnJvbSB0
aGUgc2l6ZSBkZWZpbmVkIGluIHRoZSBPYmplY3QuDQo+IEFzIGEgcmVzdWx0LCBpbiAnZ2V0X2N1
cnJlbnRfcmFtX3NpemUoKScsIHRoZSBvcmlnaW5hbCBtZXRob2Qgb2YgY291bnRpbmcgaG90LQ0K
PiBwbHVnZ2VkIG1lbW9yeSBmcm9tIHRoZSBPYmplY3QgbWF5IG5vdCBiZSBhY2N1cmF0ZS4gTm93
LCB3ZSBjb3VudCB0aGUNCj4gc2l6ZSBmcm9tIHRoZSBtZW1vcnkgcmVnaW9uLCB3aGljaCBpcyBh
IHByb3BlciB3YXkgdG8gZ2V0IHRoZSBhY3R1YWwgc2l6ZSBvZg0KPiBtZW1vcnkgYWxsb2NhdGVk
Lg0KPiANCj4gWW91J2QgaGF2ZSB0byBoYXZlIGEgbWVtb3J5IGJhY2tlbmQgc2l6ZSB0aGF0IGlz
IG5vdCBhbGlnbmVkIHRvIHRoZSBob3N0DQo+IHBhZ2Ugc2l6ZS4NCj4gDQo+IHFlbXUtc3lzdGVt
LXg4Nl82NCAtbm9ncmFwaGljIC1ub2RlZmF1bHRzIC1vYmplY3QgbWVtb3J5LWJhY2tlbmQtDQo+
IHJhbSxpZD10bXAsc2l6ZT0xSw0KPiANCj4gV2hpbGUgdGhhdCBzZWVtcyB0byBiZSBwb3NzaWJs
ZSwgaXQncyBzb21ldGhpbmcgdmVyeSBvZGQgdG8gaGFwcGVuIChJIGNhbm5vdA0KPiB0aGluayBv
ZiBhIHJlYXNvbmFibGUgdXNlIGNhc2UpLg0KPiANCj4gDQo+IA0KPiAtLQ0KPiBUaGFua3MsDQo+
IA0KPiBEYXZpZCAvIGRoaWxkZW5iDQoNClllcywgSSBhZ3JlZS4gQmVzaWRlcywgYSBuZXdlciB2
ZXJzaW9uW1BBVENIIHYzXSBoYXMgYmVlbiBzZW50LiBJIGFtIHdvbmRlcmluZyBjb3VsZCB5b3Ug
cGxlYXNlIGhhdmUgYSBsb29rIGF0IHRoYXTvvJ8NCg0KQmVzdA0KUWkNCg0K

