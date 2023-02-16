Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 635AB6999BC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:18:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgxi-00064h-H2; Thu, 16 Feb 2023 11:18:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1pSgxg-00062q-KX
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:18:20 -0500
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1pSgxe-0004uS-Dg
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:18:20 -0500
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
 by mta-01.yadro.com (Proxmox) with ESMTP id E8A8E341DC2;
 Thu, 16 Feb 2023 19:18:15 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
 :cc:content-id:content-transfer-encoding:content-type
 :content-type:date:from:from:message-id:mime-version:reply-to
 :subject:subject:to:to; s=mta-01; bh=NbQ22chFNcHrTG4fGMJGKGCYJ6a
 C4/XmzbiljAuBXTI=; b=EW1M0zeww2pL6HxpB2hT0nNvh1nbgjigCrDY+vNIVa0
 98ZAIKfylxJVu8s7lALcA9NNnN4Mlbr5HOS7LBeU9VzrrIa2oTYrJv5DVaJBqGq5
 g7Y6Q1DDU6EG7FefE/24pZulHbJa1q3Iv3a4w17mxFciu92YOr5gQoT3IJxPTKKQ
 =
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Proxmox) with ESMTPS id DD193341D71;
 Thu, 16 Feb 2023 19:18:15 +0300 (MSK)
Received: from T-Exch-05.corp.yadro.com (172.17.10.109) by
 T-EXCH-08.corp.yadro.com (172.17.11.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Thu, 16 Feb 2023 19:18:15 +0300
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-Exch-05.corp.yadro.com (172.17.10.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Thu, 16 Feb 2023 19:18:15 +0300
Received: from T-EXCH-08.corp.yadro.com ([172.17.11.58]) by
 T-EXCH-08.corp.yadro.com ([172.17.11.58]) with mapi id 15.02.1118.009; Thu,
 16 Feb 2023 19:18:15 +0300
From: Mikhail Tyutin <m.tyutin@yadro.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "alex.bennee@linaro.org" <alex.bennee@linaro.org>, "erdnaxe@crans.org"
 <erdnaxe@crans.org>, "ma.mandourr@gmail.com" <ma.mandourr@gmail.com>
Subject: [PATCH] TCG plugin API extension to read guest memory content by an
 address
Thread-Topic: [PATCH] TCG plugin API extension to read guest memory content by
 an address
Thread-Index: AQHZQiJFFLHBBoEMdkSyQJ0m9+QggA==
Date: Thu, 16 Feb 2023 16:18:15 +0000
Message-ID: <209f0f05-b982-eecd-f4e2-70da12e91892@yadro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.17.10.14]
Content-Type: text/plain; charset="utf-8"
Content-ID: <22706CAB80392C48ADCEBB25C1C56455@yadro.com>
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

VENHIHBsdWdpbiBBUEkgZXh0ZW5zaW9uIHRvIHJlYWQgZ3Vlc3QgbWVtb3J5IGNvbnRlbnQuIHFl
bXVfcGx1Z2luX3ZjcHVfcmVhZF9waHlzX21lbSgpDQpmdW5jdGlvbiBjYW4gYmUgdXNlZCBieSBU
Q0cgcGx1Z2luIGluc2lkZSBvZiBxZW11X3BsdWdpbl92Y3B1X21lbV9jYl90IGNhbGxiYWNrIHRv
IGFkanVzdA0KcmVjZWl2ZWQgYWRkcmVzcyBhY2NvcmRpbmcgdG8gaW50ZXJuYWwgbWVtb3J5IG1h
cHBpbmdzIGFuZCByZWFkIGNvbnRlbnQgb2YgZ3Vlc3QgbWVtb3J5Lg0KV29ya3MgZm9yIGJvdGgg
dXNlci1sZXZlbCBhbmQgc3lzdGVtLWxldmVsIGVtdWxhdGlvbiBtb2Rlcy4NCg0KU2lnbmVkLW9m
Zi1ieTogTWlraGFpbCBUeXV0aW4gPG0udHl1dGluQHlhZHJvLmNvbT4NClNpZ25lZC1vZmYtYnk6
IEFsZWtzZXkgVGl0b3YgPGEudGl0b3ZAeWFkcm8uY29tPg0KLS0tDQpRRU1VX1BMVUdJTl9SRUFE
X1BIWVNfTUVNX0VOQUJMRUQgZGVmaW5lIGJlbG93IGlzIHRvIGxldCBwbHVnaW5zIHRvIGNoZWNr
IGlmIHRoaXMgQVBJDQppcyBhdmFpbGFibGUgaW4gUWVtdSBidWlsZC4NCg0KICBpbmNsdWRlL3Fl
bXUvcWVtdS1wbHVnaW4uaCAgIHwgMTggKysrKysrKysrKysrKysrKysrDQogIHBsdWdpbnMvYXBp
LmMgICAgICAgICAgICAgICAgfCAyMCArKysrKysrKysrKysrKysrKysrKw0KICBwbHVnaW5zL3Fl
bXUtcGx1Z2lucy5zeW1ib2xzIHwgIDEgKw0KICAzIGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlv
bnMoKykNCg0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvcWVtdS9xZW11LXBsdWdpbi5oIGIvaW5jbHVk
ZS9xZW11L3FlbXUtcGx1Z2luLmgNCmluZGV4IGQwZTlkMDNhZGYuLjU3NjU5N2Y2MDEgMTAwNjQ0
DQotLS0gYS9pbmNsdWRlL3FlbXUvcWVtdS1wbHVnaW4uaA0KKysrIGIvaW5jbHVkZS9xZW11L3Fl
bXUtcGx1Z2luLmgNCkBAIC02MjUsNCArNjI1LDIyIEBAIHVpbnQ2NF90IHFlbXVfcGx1Z2luX2Vu
ZF9jb2RlKHZvaWQpOw0KICAgKi8NCiAgdWludDY0X3QgcWVtdV9wbHVnaW5fZW50cnlfY29kZSh2
b2lkKTsNCiAgDQorDQorI2RlZmluZSBRRU1VX1BMVUdJTl9SRUFEX1BIWVNfTUVNX0VOQUJMRUQN
CisvKioNCisgKiBxZW11X3BsdWdpbl92Y3B1X3JlYWRfcGh5c19tZW0oKSAtIHJlYWRzIGd1ZXN0
J3MgbWVtb3J5IGNvbnRlbnQNCisgKg0KKyAqIEB2Y3B1X2luZGV4OiB2Y3B1IGluZGV4DQorICog
QGFkZHI6IGd1ZXN0J3MgdmlydHVhbCBhZGRyZXNzDQorICogQGJ1ZjogZGVzdGluYXRpb24gYnVm
ZmVyIHRvIHJlYWQgZGF0YSB0bw0KKyAqIEBsZW46IG51bWJlciBvZiBieXRlcyB0byByZWFkDQor
ICoNCisgKiBBZGp1c3RzIGFkZHJlc3MgYWNjb3JkaW5nIHRvIGludGVybmFsIG1lbW9yeSBtYXBw
aW5nIGFuZCByZWFkcw0KKyAqIGNvbnRlbnQgb2YgZ3Vlc3QgbWVtb3J5Lg0KKyAqLw0KK3ZvaWQg
cWVtdV9wbHVnaW5fdmNwdV9yZWFkX3BoeXNfbWVtKHVuc2lnbmVkIGludCB2Y3B1X2luZGV4LA0K
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90IGFkZHIsDQorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqYnVmLA0KKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90IGxlbik7DQorDQogICNlbmRpZiAvKiBR
RU1VX1FFTVVfUExVR0lOX0ggKi8NCmRpZmYgLS1naXQgYS9wbHVnaW5zL2FwaS5jIGIvcGx1Z2lu
cy9hcGkuYw0KaW5kZXggMjA3OGIxNmVkYi4uOTU3NTNiY2U5NSAxMDA2NDQNCi0tLSBhL3BsdWdp
bnMvYXBpLmMNCisrKyBiL3BsdWdpbnMvYXBpLmMNCkBAIC00NDIsMyArNDQyLDIzIEBAIHVpbnQ2
NF90IHFlbXVfcGx1Z2luX2VudHJ5X2NvZGUodm9pZCkNCiAgI2VuZGlmDQogICAgICByZXR1cm4g
ZW50cnk7DQogIH0NCisNCit2b2lkIHFlbXVfcGx1Z2luX3ZjcHVfcmVhZF9waHlzX21lbSh1bnNp
Z25lZCBpbnQgdmNwdV9pbmRleCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1aW50NjRfdCBhZGRyLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZv
aWQgKmJ1ZiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCBs
ZW4pIHsNCisjaWZuZGVmIENPTkZJR19VU0VSX09OTFkNCisgICAgY3B1X3BoeXNpY2FsX21lbW9y
eV9ydyhhZGRyLCBidWYsIGxlbiwgZmFsc2UpOw0KKyNlbHNlDQorICAgIENQVUNsYXNzICpjYzsN
CisgICAgQ1BVU3RhdGUgKmNwdTsNCisNCisgICAgY3B1ID0gcWVtdV9nZXRfY3B1KHZjcHVfaW5k
ZXgpOw0KKyAgICBjYyA9IENQVV9HRVRfQ0xBU1MoY3B1KTsNCisgICAgaWYgKGNjLT5tZW1vcnlf
cndfZGVidWcpIHsNCisgICAgICAgIGNjLT5tZW1vcnlfcndfZGVidWcoY3B1LCBhZGRyLCBidWYs
IGxlbiwgZmFsc2UpOw0KKyAgICB9IGVsc2Ugew0KKyAgICAgICAgY3B1X21lbW9yeV9yd19kZWJ1
ZyhjcHUsIGFkZHIsIGJ1ZiwgbGVuLCBmYWxzZSk7DQorICAgIH0NCisjZW5kaWYNCit9DQpcIE5v
IG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUNCmRpZmYgLS1naXQgYS9wbHVnaW5zL3FlbXUtcGx1Z2lu
cy5zeW1ib2xzIGIvcGx1Z2lucy9xZW11LXBsdWdpbnMuc3ltYm9scw0KaW5kZXggNzFmNmM5MDU0
OS4uZjBjZThjNzMwZiAxMDA2NDQNCi0tLSBhL3BsdWdpbnMvcWVtdS1wbHVnaW5zLnN5bWJvbHMN
CisrKyBiL3BsdWdpbnMvcWVtdS1wbHVnaW5zLnN5bWJvbHMNCkBAIC00Miw0ICs0Miw1IEBADQog
ICAgcWVtdV9wbHVnaW5fdGJfdmFkZHI7DQogICAgcWVtdV9wbHVnaW5fdW5pbnN0YWxsOw0KICAg
IHFlbXVfcGx1Z2luX3ZjcHVfZm9yX2VhY2g7DQorICBxZW11X3BsdWdpbl92Y3B1X3JlYWRfcGh5
c19tZW07DQogIH07DQotLSANCjIuMzQuMQ0K


