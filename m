Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747D569AF6D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:24:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT2aF-0000HD-3e; Fri, 17 Feb 2023 10:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1pT2aD-0000Gx-Ck
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:23:33 -0500
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1pT2aB-0005VM-3P
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:23:33 -0500
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
 by mta-01.yadro.com (Proxmox) with ESMTP id 54956341E6A;
 Fri, 17 Feb 2023 18:23:26 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=mta-01; bh=CscEokhDmmflwLi8d1
 GLOZ99qZk24c2AWA/MJ3s8o9Q=; b=n+cEEfC/mVb9JJK7um2KVSSVn2gS3PP+yt
 beuOifBJPkcFRwIx3d+K6NG09Dqv8yl1mOj7v4EWDG/TibL1DIyfeT0PRo7GK+Ji
 mz0TPwiaxETTfCjyhQLj09tzpYtLKJWEMPw+azwEqLdrIwfNu2IPKpe8rsTru9XV
 OZC9W+uxg=
Received: from T-EXCH-07.corp.yadro.com (unknown [172.17.10.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Proxmox) with ESMTPS id 4A3E9341DA5;
 Fri, 17 Feb 2023 18:23:26 +0300 (MSK)
Received: from T-Exch-05.corp.yadro.com (172.17.10.109) by
 T-EXCH-07.corp.yadro.com (172.17.11.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.9; Fri, 17 Feb 2023 18:23:26 +0300
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-Exch-05.corp.yadro.com (172.17.10.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Fri, 17 Feb 2023 18:23:25 +0300
Received: from T-EXCH-08.corp.yadro.com ([172.17.11.58]) by
 T-EXCH-08.corp.yadro.com ([172.17.11.58]) with mapi id 15.02.1118.009; Fri,
 17 Feb 2023 18:23:25 +0300
From: Mikhail Tyutin <m.tyutin@yadro.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "alex.bennee@linaro.org" <alex.bennee@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: RE: TCG asserts on some of translation blocks with plugin memory
 callback
Thread-Topic: TCG asserts on some of translation blocks with plugin memory
 callback
Thread-Index: AQHZQpCQZUyYKKfKzUKg+ugTeuoVKK7TQNjw
Date: Fri, 17 Feb 2023 15:23:25 +0000
Message-ID: <697e7edb1f554fb789082fe8943ead7b@yadro.com>
References: <13fc40e4-2637-02bc-5f83-4fb9f04cd730@yadro.com>
In-Reply-To: <13fc40e4-2637-02bc-5f83-4fb9f04cd730@yadro.com>
Accept-Language: en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.178.120.230]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=89.207.88.252; envelope-from=m.tyutin@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

PiBJIGhhdmUgYmVlbiB0ZXN0aW5nIFRDRyBwbHVnaW4gcGF0Y2ggb24gbGF0ZXN0IFFlbXUgYnVp
bGQgYnV0IG5vdGljZWQgdGhhdCBpdA0KPiBmYWlscyB3aXRoIGFzc2VydCBvbiBzb21lIG9mIHRo
ZSBhcHBsaWNhdGlvbnMuDQo+IA0KPiAgICBFUlJPUjouLi9hY2NlbC90Y2cvY3B1LWV4ZWMuYzo5
ODM6Y3B1X2V4ZWNfbG9vcDoNCj4gICAgICAgIGFzc2VydGlvbiBmYWlsZWQ6IChjcHUtPnBsdWdp
bl9tZW1fY2JzID09ICgodm9pZCAqKTApKQ0KPiANCg0KSXQgc2VlbXMgdGhhdCB0aGUgcHJvYmxl
bSBpcyBhcm91bmQgdGNnX2N0eC0+cGx1Z2luX3RiLT5tZW1faGVscGVyIGZsYWcuIEl0IGlzIHNl
dCB0byB0cnVlDQpieSBpbmplY3RfbWVtX2VuYWJsZV9oZWxwZXIoKSBpZiBwbHVnaW4gcmVxdWVz
dHMgbWVtb3J5IGNhbGxiYWNrcyBpbmplY3Rpb24gYW5kIGNoZWNrZWQNCmJ5IGluamVjdF9tZW1f
ZGlzYWJsZV9oZWxwZXIoKSB0byBpbnNlcnQgYXBwcm9wcmlhdGUgY2xlYW51cCBjb2RlIGF0IHRo
ZSBlbmQuIEl0IHdvcmtzIGlmDQp0cmFuc2xhdGlvbiBibG9jayBoYXMgc2luZ2xlIGV4aXQgcG9p
bnQuIEhvd2V2ZXIgaWYgdHJhbnNsYXRpb24gYmxvY2sgaGFzIGJyYW5jaGVzIG9yIGV4aXRzLA0K
aW5qZWN0X21lbV9kaXNhYmxlX2hlbHBlcigpIGlzIGNhbGxlZCBkdXJpbmcgY29kZSBnZW5lcmF0
aW9uIHByZXBlbmRpbmcgYWxsIHRiIGV4aXRzLg0KVW5mb3J0dW5hdGVseSBpdCBoYXBwZW5zIGJl
Zm9yZSBpbmplY3RfbWVtX2VuYWJsZV9oZWxwZXIoKSBpbml0aWFsaXplcyBtZW1faGVscGVyIGZs
YWcgZm9yDQp0aGF0IGJsb2NrLg0KDQpJ4oCZdmUgdHJpZWQgcXVpY2sgZml4IGJ5IGNvbW1lbnRp
bmcgb3V0IHRoaXMgY2hlY2sgaW4gaW5qZWN0X21lbV9kaXNhYmxlX2hlbHBlcigpIHNvIHRoYXQg
Y2xlYW4NCnVwIGNvZGUgaXMgaW5zZXJ0ZWQgdW5jb25kaXRpb25hbGx5IG9uIGV2ZXJ5IGV4aXQu
IFRoZSBhc3NlcnQgaXMgZ29uZS4NCldoYXQgd291bGQgYmUgYSBiZXR0ZXIgd2F5IHRvIGZpeCBp
dD8NCg0KDQpkaWZmIC0tZ2l0IGEvYWNjZWwvdGNnL3BsdWdpbi1nZW4uYyBiL2FjY2VsL3RjZy9w
bHVnaW4tZ2VuLmMNCmluZGV4IDE3YTY4NmJkOWUuLjY2NTE4NzRjMGYgMTAwNjQ0DQotLS0gYS9h
Y2NlbC90Y2cvcGx1Z2luLWdlbi5jDQorKysgYi9hY2NlbC90Y2cvcGx1Z2luLWdlbi5jDQpAQCAt
NjM3LDkgKzYzNyw5IEBAIHZvaWQgcGx1Z2luX2dlbl9kaXNhYmxlX21lbV9oZWxwZXJzKHZvaWQp
DQogICAgICAqIE5vdGU6IHdlIGRvIG5vdCByZXNldCBwbHVnaW5fdGItPm1lbV9oZWxwZXIgaGVy
ZTsgYSBUQiBtaWdodCBoYXZlIHNldmVyYWwNCiAgICAgICogZXhpdCBwb2ludHMsIGFuZCB3ZSB3
YW50IHRvIGVtaXQgdGhlIGNsZWFyaW5nIGZyb20gYWxsIG9mIHRoZW0uDQogICAgICAqLw0KLSAg
ICBpZiAoIXRjZ19jdHgtPnBsdWdpbl90Yi0+bWVtX2hlbHBlcikgew0KLSAgICAgICAgcmV0dXJu
Ow0KLSAgICB9DQorICAgIC8vIGlmICghdGNnX2N0eC0+cGx1Z2luX3RiLT5tZW1faGVscGVyKSB7
DQorICAgIC8vICAgICByZXR1cm47DQorICAgIC8vIH0NCiAgICAgcHRyID0gdGNnX2NvbnN0X3B0
cihOVUxMKTsNCiAgICAgdGNnX2dlbl9zdF9wdHIocHRyLCBjcHVfZW52LCBvZmZzZXRvZihDUFVT
dGF0ZSwgcGx1Z2luX21lbV9jYnMpIC0NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBvZmZzZXRvZihBcmNoQ1BVLCBlbnYpKTsNCg==


