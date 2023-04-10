Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1E26DC7F2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 16:39:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plsf8-00046h-Fx; Mon, 10 Apr 2023 10:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=4573449bb=pbartell@amazon.com>)
 id 1plsf5-000465-Nm; Mon, 10 Apr 2023 10:38:27 -0400
Received: from smtp-fw-80006.amazon.com ([99.78.197.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=4573449bb=pbartell@amazon.com>)
 id 1plsf3-0006Ao-2K; Mon, 10 Apr 2023 10:38:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1681137505; x=1712673505;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version:subject;
 bh=lMgpz7TN2zYYscEM0VkU9KiDX61CJDtKuwGhjsVSIrA=;
 b=HIltyRgCQm6MNzOKfzNJEujs+AaGmzz7NNHZSMX8QwHSAfx/yeIVmTLT
 X7i85KxUuez4ZbJjiJ3gnTrldGgufztwqO/mZdywbyinY4p1ijVOQnC+x
 V51pvP9WUtJqgetJvDvYVDWDS8YH3EefhqUkAfu0ClSt6ePXSWJweoIl0 U=;
X-IronPort-AV: E=Sophos;i="5.98,333,1673913600"; d="scan'208";a="202808351"
Subject: Re: [PATCH] target/arm: Fix debugging of ARMv8M Secure code
Thread-Topic: [PATCH] target/arm: Fix debugging of ARMv8M Secure code
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2c-m6i4x-fa5fe5fb.us-west-2.amazon.com)
 ([10.25.36.210]) by smtp-border-fw-80006.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 14:38:18 +0000
Received: from EX19D002EUA003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2c-m6i4x-fa5fe5fb.us-west-2.amazon.com (Postfix)
 with ESMTPS id 72CAB41464; Mon, 10 Apr 2023 14:38:17 +0000 (UTC)
Received: from EX19D031EUC001.ant.amazon.com (10.252.61.162) by
 EX19D002EUA003.ant.amazon.com (10.252.50.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 10 Apr 2023 14:38:16 +0000
Received: from EX19D031EUC003.ant.amazon.com (10.252.61.172) by
 EX19D031EUC001.ant.amazon.com (10.252.61.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 10 Apr 2023 14:38:16 +0000
Received: from EX19D031EUC003.ant.amazon.com ([fe80::dad0:4f18:bddd:d966]) by
 EX19D031EUC003.ant.amazon.com ([fe80::dad0:4f18:bddd:d966%3]) with
 mapi id 15.02.1118.026; Mon, 10 Apr 2023 14:38:15 +0000
From: "Bartell, Paul" <pbartell@amazon.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>
Thread-Index: AQHZaa1L7iNpTV5R00K3KIarsp7cMK8gzriAgANcvgA=
Date: Mon, 10 Apr 2023 14:38:15 +0000
Message-ID: <E3A05628-86C2-42B7-B17B-64972FE60834@amazon.com>
References: <20230408000118.50854-1-pbartell@amazon.com>
 <c56f4f56-6cba-ceaa-9f89-228fafcbc2ac@linaro.org>
In-Reply-To: <c56f4f56-6cba-ceaa-9f89-228fafcbc2ac@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.252.50.216]
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F38554B30B9AA4699469ABB79DCE1EB@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk
Received-SPF: pass client-ip=99.78.197.217;
 envelope-from=prvs=4573449bb=pbartell@amazon.com;
 helo=smtp-fw-80006.amazon.com
X-Spam_score_int: -118
X-Spam_score: -11.9
X-Spam_bar: -----------
X-Spam_report: (-11.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

WW91IGNhbiByZXByb2R1Y2UgdGhlIHByb2JsZW0gYnkgcnVubmluZyBnZGIgYWdhaW5zdCBhbiBB
Uk12OE0gdGFyZ2V0IHJ1bm5pbmcgc2VjdXJlIG1vZGUgY29kZSAodGhlIGRlZmF1bHQpLg0KDQpS
dW5uaW5nIHFlbXUgd2l0aCB0aGUgZm9sbG93aW5nIGFyZ3VtZW50cyA6IHFlbXUtc3lzdGVtLWFy
bSAtbWFjaGluZSBtcHMyLWFuNTA1IC1tIDE2TSAtY3B1IGNvcnRleC1tMzMgLW5vZ3JhcGhpYyAt
c2VtaWhvc3RpbmcgLW1vbml0b3IgbnVsbCAtLXNlbWlob3N0aW5nLWNvbmZpZyBlbmFibGU9b24s
dGFyZ2V0PW5hdGl2ZSAtZCBndWVzdF9lcnJvcnMgLWtlcm5lbCAvcGF0aC90by9iaW5hcnkuZWxm
DQoNCldpdGggdGhlIGZvbGxvd2luZyAuZ2RiaW5pdCBmaWxlOg0KdGFyZ2V0IGV4dGVuZGVkLXJl
bW90ZSA6MTIzNA0KY29tcGFyZS1zZWN0aW9ucw0KDQpVcG9uIHN0YXJ0dXAsIGV2ZXJ5IHN5bWJv
bCBpbiB0aGUgZWxmIGZpbGUgcmVwb3J0cyB0aGUgZm9sbG93aW5nIGVycm9yOg0KDQpTZWN0aW9u
IC50ZXh0LCByYW5nZSAweDEwMDAwMDAwIC0tIDB4MTAwMDkyOTg6IE1JUy1NQVRDSEVEIQ0KU2Vj
dGlvbiAudGV4dC5tYWluLCByYW5nZSAweDEwMDA5Mjk4IC0tIDB4MTAwMDkzMDA6IE1JUy1NQVRD
SEVEIQ0KU2VjdGlvbiAudGV4dC5wcnZRdWV1ZVNlbmRUYXNrLCByYW5nZSAweDEwMDA5MzAwIC0t
IDB4MTAwMDkzMzg6IE1JUy1NQVRDSEVEIQ0KDQpBdHRlbXB0aW5nIHRvIGRlYnVnIHJlc3VsdHMg
aW4gZXJyb3JzIGNvbnN0YW50bHkgKHVuYWJsZSB0byByZWFkIG9yIHdyaXRlIG1lbW9yeSBhdCBh
bGwpLg0KDQppbml0X2RhdGFfc2VjdGlvbnMgKCkgYXQgL3Byb2plY3QvRGVtby9BUk1fTVBTL3N0
YXJ0dXAuYzo5NQ0KOTUgICAgICB7DQooZ2RiKSBpbmZvIGxvY2Fscw0KcENvcHlUYWJsZSA9IDxl
cnJvciByZWFkaW5nIHZhcmlhYmxlIHBDb3B5VGFibGUgKENhbm5vdCBhY2Nlc3MgbWVtb3J5IGF0
IGFkZHJlc3MgMHgzODFmZmZlYyk+DQpkYXRhSW5kZXggPSA8ZXJyb3IgcmVhZGluZyB2YXJpYWJs
ZSBkYXRhSW5kZXggKENhbm5vdCBhY2Nlc3MgbWVtb3J5IGF0IGFkZHJlc3MgMHgzODFmZmZlOCk+
DQoNCkRvZXMgdGhhdCBjbGFyaWZ5IG15IHJlcG9ydCBzdWZmaWNpZW50bHk/DQoNCu+7v09uIDQv
Ny8yMywgOToxOCBQTSwgIlJpY2hhcmQgSGVuZGVyc29uIiA8cmljaGFyZC5oZW5kZXJzb25AbGlu
YXJvLm9yZyA8bWFpbHRvOnJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+PiB3cm90ZToNCg0K
T24gNC83LzIzIDE3OjAxLCBwYmFydGVsbEBhbWF6b24uY29tIDxtYWlsdG86cGJhcnRlbGxAYW1h
em9uLmNvbT4gd3JvdGU6DQo+IEZyb206IFBhdWwgQmFydGVsbCA8cGJhcnRlbGxAYW1hem9uLmNv
bSA8bWFpbHRvOnBiYXJ0ZWxsQGFtYXpvbi5jb20+Pg0KPg0KPiBSZXZlcnQgY2hhbmdlcyB0byBh
cm1fY3B1X2dldF9waHlzX3BhZ2VfYXR0cnNfZGVidWcgbWFkZSBpbiBjb21taXQNCj4gNGEzNTg1
NTY4MmNlYmI4OWY5NjMwYjA3YWE5ZmQzN2M0ZThjNzMzYi4NCj4NCj4gQ29tbWl0IDRhMzU4NTU2
ODIgbW9kaWZpZXMgdGhlIGFybV9jcHVfZ2V0X3BoeXNfcGFnZV9hdHRyc19kZWJ1ZyBmdW5jdGlv
bg0KPiBzbyB0aGF0IGl0IGNhbGxzIGdldF9waHlzX2FkZHJfd2l0aF9zdHJ1Y3QgcmF0aGVyIHRo
YW4gZ2V0X3BoeXNfYWRkciwgd2hpY2gNCj4gbGVhZHMgdG8gYSB2YXJpZXR5IG9mIG1lbW9yeSBh
Y2Nlc3MgZXJyb3JzIHdoZW4gZGVidWdnaW5nIHNlY3VyZSBzdGF0ZQ0KPiBjb2RlIG9uIHFlbXUg
QVJNdjhNIHRhcmdldHMgd2l0aCBnZGIuDQo+DQo+IFRoaXMgY29tbWl0IGZpeGVzIGEgdmFyaWV0
eSBvZiBnZGIgbWVtb3J5IGFjY2VzcyBlcnJvcnMgaW5jbHVkaW5nOg0KPiAiZXJyb3IgcmVhZGlu
ZyB2YXJpYWJsZSIgYW5kICJDYW5ub3QgYWNjZXNzIG1lbW9yeSBhdCBhZGRyZXNzIiB3aGVuDQo+
IGF0dGVtcHRpbmcgdG8gcmVhZCBhbnkgbWVtb3J5IGFkZHJlc3MgdmlhIGdkYi4NCj4NCj4gU2ln
bmVkLW9mZi1ieTogUGF1bCBCYXJ0ZWxsIDxwYmFydGVsbEBhbWF6b24uY29tIDxtYWlsdG86cGJh
cnRlbGxAYW1hem9uLmNvbT4+DQo+IC0tLQ0KPiB0YXJnZXQvYXJtL3B0dy5jIHwgOCArKy0tLS0t
LQ0KPiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPg0K
PiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L2FybS9wdHcuYyBiL3RhcmdldC9hcm0vcHR3LmMNCj4gaW5k
ZXggZWMzZjUxNzgyYS4uNWExMzM5ZDM4ZiAxMDA2NDQNCj4gLS0tIGEvdGFyZ2V0L2FybS9wdHcu
Yw0KPiArKysgYi90YXJnZXQvYXJtL3B0dy5jDQo+IEBAIC0yOTk5LDE2ICsyOTk5LDEyIEBAIGh3
YWRkciBhcm1fY3B1X2dldF9waHlzX3BhZ2VfYXR0cnNfZGVidWcoQ1BVU3RhdGUgKmNzLCB2YWRk
ciBhZGRyLA0KPiB7DQo+IEFSTUNQVSAqY3B1ID0gQVJNX0NQVShjcyk7DQo+IENQVUFSTVN0YXRl
ICplbnYgPSAmY3B1LT5lbnY7DQo+IC0gUzFUcmFuc2xhdGUgcHR3ID0gew0KPiAtIC5pbl9tbXVf
aWR4ID0gYXJtX21tdV9pZHgoZW52KSwNCj4gLSAuaW5fc2VjdXJlID0gYXJtX2lzX3NlY3VyZShl
bnYpLA0KPiAtIC5pbl9kZWJ1ZyA9IHRydWUsDQoNCg0KTmFjay4gVGhpcyB3aWxsIG5vdyBhZmZl
Y3QgdmNwdSBzdGF0ZSBieSBjaGFuZ2luZyB0aGUgY29udGVudHMgb2YgdGhlIHNvZnRtbXUgdGxi
LCBhcw0Kd2VsbCBhcyBjaGFuZ2luZyB0aGUgY29udGVudHMgb2YgbWVtb3J5ICghKSB2aWEgUFRF
IGFjY2Vzcy9kaXJ0eSBiaXQgdXBkYXRlcy4NCg0KDQpBIG1vcmUgY29tcGxldGUgZGVzY3JpcHRp
b24gb2YgImEgdmFyaWV0eSBvZiAuLi4gZXJyb3JzIiwgYW5kIHRoZSBjb25kaXRpb25zIHVuZGVy
IHdoaWNoDQp0aGV5IGFyZSBwcm9kdWNlZCwgd291bGQgYmUgYXBwcmVjaWF0ZWQuDQoNCg0Kcn4N
Cg0KDQoNCg==

