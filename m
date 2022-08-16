Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3A6595765
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 12:02:49 +0200 (CEST)
Received: from localhost ([::1]:57548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNtPM-0007vU-K2
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 06:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1oNtBU-0002hJ-A1; Tue, 16 Aug 2022 05:48:28 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:5170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1oNtBS-0007RE-6e; Tue, 16 Aug 2022 05:48:27 -0400
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4M6RBK4H39zGpVy;
 Tue, 16 Aug 2022 17:46:49 +0800 (CST)
Received: from kwepemm600016.china.huawei.com (7.193.23.20) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 16 Aug 2022 17:48:20 +0800
Received: from kwepemm600016.china.huawei.com ([7.193.23.20]) by
 kwepemm600016.china.huawei.com ([7.193.23.20]) with mapi id 15.01.2375.024;
 Tue, 16 Aug 2022 17:48:20 +0800
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>, Peter Xu <peterx@redhat.com>, "Igor
 Mammedov" <imammedo@redhat.com>, "Wanghaibin (D)"
 <wanghaibin.wang@huawei.com>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIGFjcGlfZ2VkOiBBZGQgb3NwbV9zdGF0dXMgaG9v?=
 =?utf-8?Q?k_implementation?=
Thread-Topic: [PATCH] acpi_ged: Add ospm_status hook implementation
Thread-Index: AQHYsVJa+vqGTE7yt0qRXZ8lKONLy62wvNAAgACG/8D//3xFgIAAh8JQ
Date: Tue, 16 Aug 2022 09:48:20 +0000
Message-ID: <bd7cf21fa43541bb8d52801e928d7312@huawei.com>
References: <20220816092624.15168-1-zhukeqian1@huawei.com>
 <CAFEAcA8UN=NABfNzzP-m5b3ki5mKH1qyfwgi6_yiT__6u_-1ng@mail.gmail.com>
 <47f60df98b514502b422adee6b970880@huawei.com>
 <CAFEAcA-DtHrfCF0nfvnrW6bTmjRco_rxu=vj3yNciBkM_0iUog@mail.gmail.com>
In-Reply-To: <CAFEAcA-DtHrfCF0nfvnrW6bTmjRco_rxu=vj3yNciBkM_0iUog@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.187.224]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=zhukeqian1@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  zhukeqian <zhukeqian1@huawei.com>
From:  zhukeqian via <qemu-devel@nongnu.org>

T0ssIEknbGwgc2VuZCB2MiBzb29uLg0KDQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrlj5Hku7bk
uro6IFBldGVyIE1heWRlbGwgW21haWx0bzpwZXRlci5tYXlkZWxsQGxpbmFyby5vcmddIA0K5Y+R
6YCB5pe26Ze0OiAyMDIy5bm0OOaciDE25pelIDE3OjQyDQrmlLbku7bkuro6IHpodWtlcWlhbiA8
emh1a2VxaWFuMUBodWF3ZWkuY29tPg0K5oqE6YCBOiBxZW11LWRldmVsQG5vbmdudS5vcmc7IHFl
bXUtYXJtQG5vbmdudS5vcmc7IHFlbXUtdHJpdmlhbEBub25nbnUub3JnOyBQaGlsaXBwZSBNYXRo
aWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+OyBFcmljIEF1Z2VyIDxlcmljLmF1Z2VyQHJl
ZGhhdC5jb20+OyBQZXRlciBYdSA8cGV0ZXJ4QHJlZGhhdC5jb20+OyBJZ29yIE1hbW1lZG92IDxp
bWFtbWVkb0ByZWRoYXQuY29tPjsgV2FuZ2hhaWJpbiAoRCkgPHdhbmdoYWliaW4ud2FuZ0BodWF3
ZWkuY29tPg0K5Li76aKYOiBSZTogW1BBVENIXSBhY3BpX2dlZDogQWRkIG9zcG1fc3RhdHVzIGhv
b2sgaW1wbGVtZW50YXRpb24NCg0KT24gVHVlLCAxNiBBdWcgMjAyMiBhdCAxMDo0MCwgemh1a2Vx
aWFuIDx6aHVrZXFpYW4xQGh1YXdlaS5jb20+IHdyb3RlOg0KPg0KPiBIaSBQZXRlciwNCj4NCj4g
U2V0dXAgYW4gQVJNIHZpcnR1YWwgbWFjaGluZSBvZiBtYWNoaW5lIHZpcnQgYW5kIGV4ZWN1dGUg
cW1wICJxdWVyeS1hY3BpLW9zcG0tc3RhdHVzIiBjYW4gdHJpZ2dlciB0aGlzIGJ1Zy4NCg0KVGhh
bmtzLiBUaGF0IGlzIHdvcnRoIHN0YXRpbmcgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLCBJIHRoaW5r
Lg0KDQotLSBQTW0NCg==

