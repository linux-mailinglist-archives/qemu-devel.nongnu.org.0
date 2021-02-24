Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4293240E5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:41:15 +0100 (CET)
Received: from localhost ([::1]:57884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwHq-0001W2-9c
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:41:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1lEwG0-0000fV-Jw; Wed, 24 Feb 2021 10:39:21 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1lEwFw-0002rJ-Bg; Wed, 24 Feb 2021 10:39:20 -0500
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Dm0Qf6N5sz5Vhc;
 Wed, 24 Feb 2021 23:36:58 +0800 (CST)
Received: from dggpemm100012.china.huawei.com (7.185.36.212) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 24 Feb 2021 23:38:59 +0800
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 dggpemm100012.china.huawei.com (7.185.36.212) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 24 Feb 2021 23:38:58 +0800
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.2106.006; Wed, 24 Feb 2021 15:38:56 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
 <eric.auger.pro@gmail.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>
Subject: RE: [RFC v7 26/26] vfio/pci: Implement return_page_response page
 response callback
Thread-Topic: [RFC v7 26/26] vfio/pci: Implement return_page_response page
 response callback
Thread-Index: AQHWvEUTUiE9WTe+7E+ovBX+zyeIRqpeRGbwgAAIYwCAAA9WoIAAIHCAgAlxCQCAAB3dwA==
Date: Wed, 24 Feb 2021 15:38:56 +0000
Message-ID: <0c74eadade7b45c7b59cf38a205af396@huawei.com>
References: <20201116181349.11908-1-eric.auger@redhat.com>
 <20201116181349.11908-27-eric.auger@redhat.com>
 <494e4bdf5ecd4b528a016d4545d45f71@huawei.com>
 <f11ef533-da64-3d6a-24f5-79d5e7a205da@redhat.com>
 <5f85d8999c0c40a29c32ac63b8730fa8@huawei.com>
 <679c5696-c73f-517d-f555-90ec2c767fbb@redhat.com>
 <41b9d3a2-1199-5dad-876b-10efa51638bb@redhat.com>
In-Reply-To: <41b9d3a2-1199-5dad-876b-10efa51638bb@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.95.44]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=shameerali.kolothum.thodi@huawei.com; helo=szxga03-in.huawei.com
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jacob.jun.pan@linux.intel.com" <jacob.jun.pan@linux.intel.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "tn@semihalf.com" <tn@semihalf.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "vivek.gautam@arm.com" <vivek.gautam@arm.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 "zhangfei.gao@gmail.com" <zhangfei.gao@gmail.com>,
 yuzenghui <yuzenghui@huawei.com>, qubingbing <qubingbing@hisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgRXJpYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBdWdlciBF
cmljIFttYWlsdG86ZXJpYy5hdWdlckByZWRoYXQuY29tXQ0KPiBTZW50OiAyNCBGZWJydWFyeSAy
MDIxIDEzOjQ0DQo+IFRvOiBTaGFtZWVyYWxpIEtvbG90aHVtIFRob2RpIDxzaGFtZWVyYWxpLmtv
bG90aHVtLnRob2RpQGh1YXdlaS5jb20+Ow0KPiBlcmljLmF1Z2VyLnByb0BnbWFpbC5jb207IHFl
bXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1hcm1Abm9uZ251Lm9yZzsNCj4gYWxleC53aWxsaWFt
c29uQHJlZGhhdC5jb20NCj4gQ2M6IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgamFjb2IuanVu
LnBhbkBsaW51eC5pbnRlbC5jb207DQo+IHpoYW5nZmVpLmdhb0BnbWFpbC5jb207IGplYW4tcGhp
bGlwcGVAbGluYXJvLm9yZzsgdG5Ac2VtaWhhbGYuY29tOw0KPiBwZXRlcnhAcmVkaGF0LmNvbTsg
bmljb2xlb3RzdWthQGdtYWlsLmNvbTsgdml2ZWsuZ2F1dGFtQGFybS5jb207DQo+IHlpLmwubGl1
QGludGVsLmNvbTsgWmVuZ3RhbyAoQikgPHByaW1lLnplbmdAaGlzaWxpY29uLmNvbT47IHl1emVu
Z2h1aQ0KPiA8eXV6ZW5naHVpQGh1YXdlaS5jb20+OyBxdWJpbmdiaW5nIDxxdWJpbmdiaW5nQGhp
c2lsaWNvbi5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUkZDIHY3IDI2LzI2XSB2ZmlvL3BjaTogSW1w
bGVtZW50IHJldHVybl9wYWdlX3Jlc3BvbnNlIHBhZ2UNCj4gcmVzcG9uc2UgY2FsbGJhY2sNCj4g
DQo+IEhpIFNoYW1lZXIsDQpbLi4uXQ0KIA0KPiBJIHNlbnQgdGhlIHJlc3BpbiBvbiB0b3Agb2Yg
bWFzdGVyIGJyYW5jaCArIEplYW4tUGhpbGlwcGUncw0KPiBbUEFUQ0ggdjEyIDAwLzEwXSBpb21t
dTogSS9PIHBhZ2UgZmF1bHRzIGZvciBTTU1VdjMuDQo+IGJlY2F1c2UgSSB0aG91Z2h0IGl0IG1h
a2VzIG1vcmUgc2Vuc2UgdG8gcG9zdCBvbiBtYXN0ZXIgKyBzb21lIG5lYXJseQ0KPiAicmVhZHkg
dG8gZ28iIHN0dWZmLg0KDQpZZXMuIEkgc2VlIHRoYXQuIFRoYW5rcyBmb3IgdGhlIHJlc3Bpbi4g
V2lsbCB0YWtlIGEgbG9vayBhdCB0aGlzIHNvb24uDQoNCj4gDQo+IE5ldmVydGhlbGVzcyBJIHdp
bGwgZG8gbXkgYmVzdCB0byBwcmVwYXJlIGFzYXAgYSBicmFuY2ggYmFzZWQgb24gSmVhbidzDQo+
IHN2YS9jdXJyZW50IGJyYW5jaCAoYmFzZWQgb24gNS4xMS1yYzUpDQoNCk9rLg0KDQpDaGVlcnMs
DQpTaGFtZWVyDQoNCg0K

