Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 537822884F8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 10:13:03 +0200 (CEST)
Received: from localhost ([::1]:56996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQnWQ-0004or-D5
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 04:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kQnUs-0003ss-M5; Fri, 09 Oct 2020 04:11:28 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:33210 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kQnUp-0002lL-8E; Fri, 09 Oct 2020 04:11:26 -0400
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id 85CE5910DEC40175DEA9;
 Fri,  9 Oct 2020 16:11:17 +0800 (CST)
Received: from dggemm754-chm.china.huawei.com (10.1.198.60) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Fri, 9 Oct 2020 16:11:16 +0800
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggemm754-chm.china.huawei.com (10.1.198.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Fri, 9 Oct 2020 16:11:16 +0800
Received: from dggpemm000001.china.huawei.com ([7.185.36.245]) by
 dggpemm000001.china.huawei.com ([7.185.36.245]) with mapi id 15.01.1913.007;
 Fri, 9 Oct 2020 16:11:16 +0800
From: Jiangyifei <jiangyifei@huawei.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: RE: [PATCH 1/5] target/riscv: Add basic vmstate description of CPU
Thread-Topic: [PATCH 1/5] target/riscv: Add basic vmstate description of CPU
Thread-Index: AQHWlgTPXzkF3VtIQkeKFYSkPm7jUqmCfPUAgAx+QoA=
Date: Fri, 9 Oct 2020 08:11:16 +0000
Message-ID: <8882324c7f3d46e08d9c2fb902c14cac@huawei.com>
References: <20200929020337.1559-1-jiangyifei@huawei.com>
 <20200929020337.1559-2-jiangyifei@huawei.com>
 <b70824e1-aed9-1d72-21e8-ac444ccc9a09@linaro.org>
In-Reply-To: <b70824e1-aed9-1d72-21e8-ac444ccc9a09@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.47]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=jiangyifei@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 04:03:28
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>,
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
 "Zhangxiaofeng \(F\)" <victor.zhangxiaofeng@huawei.com>,
 "Alistair.Francis@wdc.com" <Alistair.Francis@wdc.com>,
 yinyipeng <yinyipeng1@huawei.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "Wubin \(H\)" <wu.wubin@huawei.com>, "dengkai \(A\)" <dengkai1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gW21haWx0bzpyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnXQ0KPiBTZW50OiBGcmlkYXks
IE9jdG9iZXIgMiwgMjAyMCAxOjIzIEFNDQo+IFRvOiBKaWFuZ3lpZmVpIDxqaWFuZ3lpZmVpQGh1
YXdlaS5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmc7DQo+IHFlbXUtcmlzY3ZAbm9uZ251Lm9y
Zw0KPiBDYzogWmhhbmdoYWlsaWFuZyA8emhhbmcuemhhbmdoYWlsaWFuZ0BodWF3ZWkuY29tPjsN
Cj4gc2FnYXJrQGVlY3MuYmVya2VsZXkuZWR1OyBrYmFzdGlhbkBtYWlsLnVuaS1wYWRlcmJvcm4u
ZGU7IFpoYW5neGlhb2ZlbmcNCj4gKEYpIDx2aWN0b3Iuemhhbmd4aWFvZmVuZ0BodWF3ZWkuY29t
PjsgQWxpc3RhaXIuRnJhbmNpc0B3ZGMuY29tOyB5aW55aXBlbmcNCj4gPHlpbnlpcGVuZzFAaHVh
d2VpLmNvbT47IHBhbG1lckBkYWJiZWx0LmNvbTsgV3ViaW4gKEgpDQo+IDx3dS53dWJpbkBodWF3
ZWkuY29tPjsgZGVuZ2thaSAoQSkgPGRlbmdrYWkxQGh1YXdlaS5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggMS81XSB0YXJnZXQvcmlzY3Y6IEFkZCBiYXNpYyB2bXN0YXRlIGRlc2NyaXB0aW9u
IG9mIENQVQ0KPiANCj4gT24gOS8yOC8yMCA5OjAzIFBNLCBZaWZlaSBKaWFuZyB3cm90ZToNCj4g
PiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvdGFyZ2V0L3Jpc2N2L21hY2hpbmUuYw0KPiA+IEBA
IC0wLDAgKzEsNTkgQEANCj4gPiArI2luY2x1ZGUgInFlbXUvb3NkZXAuaCINCj4gPiArI2luY2x1
ZGUgImNwdS5oIg0KPiANCj4gQWxsIG5ldyBmaWxlcyBtdXN0IGNvbnRhaW4gbGljZW5zZSBib2ls
ZXJwbGF0ZS4NCj4gDQo+IE90aGVyd2lzZSwgY29uc2lkZXJpbmcgdGhlIGZvbGxvd3VwcywgdGhp
cyBzZWVtcyBvay4NCj4gDQoNClRoYW5rcywgSSdsbCBhZGQgbGljZW5zZSBib2lsZXJwbGF0ZSBp
biB0aGUgbmV4dCBzZXJpZXMuDQoNCllpZmVpDQoNCj4gDQo+IHJ+DQo=

