Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F014BDA57
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 15:42:56 +0100 (CET)
Received: from localhost ([::1]:60196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM9tv-0000Zy-K3
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 09:42:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nM9qu-0006Fv-8y
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:39:50 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nM9qT-00050G-Vr
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:39:34 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4K2Pzj0tJJzdZTv;
 Mon, 21 Feb 2022 22:38:09 +0800 (CST)
Received: from dggpemm500005.china.huawei.com (7.185.36.74) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Feb 2022 22:39:19 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpemm500005.china.huawei.com (7.185.36.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Feb 2022 22:39:19 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.021;
 Mon, 21 Feb 2022 22:39:18 +0800
To: Paolo Bonzini <pbonzini@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "mst@redhat.com" <mst@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Gonglei (Arei)"
 <arei.gonglei@huawei.com>
Subject: RE: [RFC 2/2] sem-posix: use monotonic clock instead
Thread-Topic: [RFC 2/2] sem-posix: use monotonic clock instead
Thread-Index: AQHYJwlKMLRAJGpccki8YPN/ZcmI5KydXAMAgAC3NdA=
Date: Mon, 21 Feb 2022 14:39:18 +0000
Message-ID: <1f7b0ebec553434495aad5945b0c4634@huawei.com>
References: <20220221095617.1974-1-longpeng2@huawei.com>
 <20220221095617.1974-3-longpeng2@huawei.com>
 <5e92a220-eb61-c510-0cdc-bf418b9025bc@redhat.com>
In-Reply-To: <5e92a220-eb61-c510-0cdc-bf418b9025bc@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.148.223]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
From: longpeng2--- via <qemu-devel@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGFvbG8gQm9uemluaSBb
bWFpbHRvOnBhb2xvLmJvbnppbmlAZ21haWwuY29tXSBPbiBCZWhhbGYgT2YgUGFvbG8gQm9uemlu
aQ0KPiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDIxLCAyMDIyIDc6NDIgUE0NCj4gVG86IExvbmdw
ZW5nIChNaWtlLCBDbG91ZCBJbmZyYXN0cnVjdHVyZSBTZXJ2aWNlIFByb2R1Y3QgRGVwdC4pDQo+
IDxsb25ncGVuZzJAaHVhd2VpLmNvbT47IGJlcnJhbmdlQHJlZGhhdC5jb207IG1zdEByZWRoYXQu
Y29tDQo+IENjOiBxZW11LWRldmVsQG5vbmdudS5vcmc7IEdvbmdsZWkgKEFyZWkpIDxhcmVpLmdv
bmdsZWlAaHVhd2VpLmNvbT4NCj4gU3ViamVjdDogUmU6IFtSRkMgMi8yXSBzZW0tcG9zaXg6IHVz
ZSBtb25vdG9uaWMgY2xvY2sgaW5zdGVhZA0KPiANCj4gT24gMi8yMS8yMiAxMDo1NiwgTG9uZ3Bl
bmcoTWlrZSkgdmlhIHdyb3RlOg0KPiA+ICsgICAgbG9uZyBub3dfbnNlYzsNCj4gPiArI2lmZGVm
IENPTkZJR19QVEhSRUFEX0NPTkRBVFRSX1NFVENMT0NLDQo+ID4gKyAgICBzdHJ1Y3QgdGltZXNw
ZWMgbm93Ow0KPiA+ICsgICAgY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUMsICZub3cpOw0K
PiA+ICsgICAgbm93X3NlYyA9IG5vdy50dl9zZWM7DQo+ID4gKyAgICBub3dfbnNlYyA9IG5vdy50
dl9uc2VjOw0KPiA+ICsjZWxzZQ0KPiA+ICAgICAgIHN0cnVjdCB0aW1ldmFsIHR2Ow0KPiA+ICAg
ICAgIGdldHRpbWVvZmRheSgmdHYsIE5VTEwpOw0KPiA+IC0gICAgdHMtPnR2X25zZWMgPSB0di50
dl91c2VjICogMTAwMCArIChtcyAlIDEwMDApICogMTAwMDAwMDsNCj4gPiAtICAgIHRzLT50dl9z
ZWMgPSB0di50dl9zZWMgKyBtcyAvIDEwMDA7DQo+ID4gKyAgICBub3dfc2VjID0gdHYudHZfc2Vj
Ow0KPiA+ICsgICAgbm93X25zZWMgPSB0di50dl91c2VjICogMTAwMDsNCj4gPiArI2VuZGlmDQo+
ID4gKw0KPiANCj4gUGVyaGFwcyB0aGlzIG1pZ2h0IG1pbmltaXplIHRoZSBhbW91bnQgb2YgY29u
ZGl0aW9uYWwgY29kZSwgdG9vOg0KPiANCj4gZGlmZiAtLWdpdCBhL3V0aWwvcWVtdS10aHJlYWQt
cG9zaXguYyBiL3V0aWwvcWVtdS10aHJlYWQtcG9zaXguYw0KPiBpbmRleCA5MDNmYTMzOTY1Li40
NzQzZDdiNzE0IDEwMDY0NA0KPiAtLS0gYS91dGlsL3FlbXUtdGhyZWFkLXBvc2l4LmMNCj4gKysr
IGIvdXRpbC9xZW11LXRocmVhZC1wb3NpeC5jDQo+IEBAIC00MCwxMCArNDAsMTQgQEAgc3RhdGlj
IHZvaWQgZXJyb3JfZXhpdChpbnQgZXJyLCBjb25zdCBjaGFyICptc2cpDQo+IA0KPiAgIHN0YXRp
YyB2b2lkIGNvbXB1dGVfYWJzX2RlYWRsaW5lKHN0cnVjdCB0aW1lc3BlYyAqdHMsIGludCBtcykN
Cj4gICB7DQo+IC0gICAgc3RydWN0IHRpbWV2YWwgdHY7DQo+IC0gICAgZ2V0dGltZW9mZGF5KCZ0
diwgTlVMTCk7DQo+IC0gICAgdHMtPnR2X25zZWMgPSB0di50dl91c2VjICogMTAwMCArIChtcyAl
IDEwMDApICogMTAwMDAwMDsNCj4gLSAgICB0cy0+dHZfc2VjID0gdHYudHZfc2VjICsgbXMgLyAx
MDAwOw0KPiArI2lmZGVmIENPTkZJR19QVEhSRUFEX0NPTkRBVFRSX1NFVENMT0NLDQo+ICsgICAg
Y2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUMsIHRzKTsNCj4gKyNlbHNlDQo+ICsgICAgY2xv
Y2tfZ2V0dGltZShDTE9DS19SRUFMVElNRSwgdHMpOw0KPiArI2VuZGlmDQo+ICsNCj4gKyAgICB0
cy0+dHZfbnNlYyArPSAobXMgJSAxMDAwKSAqIDEwMDAwMDA7DQo+ICsgICAgdHMtPnR2X3NlYyAr
PSBtcyAvIDEwMDA7DQo+ICAgICAgIGlmICh0cy0+dHZfbnNlYyA+PSAxMDAwMDAwMDAwKSB7DQo+
ICAgICAgICAgICB0cy0+dHZfc2VjKys7DQo+ICAgICAgICAgICB0cy0+dHZfbnNlYyAtPSAxMDAw
MDAwMDAwOw0KPiANCj4gDQo+IEZpbmFsbHksIHRoZSBjb25kaXRpb25hbCB2YXJpYWJsZXMgaW5p
dGlhbGl6YXRpb24gcWVtdV9jb25kX2luaXQgbXVzdA0KPiBhbHNvIHVzZSBwdGhyZWFkX2NvbmRh
dHRyX3NldGNsb2NrLg0KPiANCg0KTWFrZSBzZW5zZSEgV2lsbCBvcHRpbWl6ZSB0aGUgY29kZSBp
biB0aGUgbmV4dCB2ZXJzaW9uLiBUaGFua3MuDQoNCj4gUGFvbG8NCg==

