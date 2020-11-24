Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70E22C2286
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 11:10:09 +0100 (CET)
Received: from localhost ([::1]:55380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khVGz-00062i-06
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 05:10:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tu.guoyi@h3c.com>)
 id 1khVCV-0003SD-Jl; Tue, 24 Nov 2020 05:05:32 -0500
Received: from smtp.h3c.com ([60.191.123.50]:61097 helo=h3cspam02-ex.h3c.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tu.guoyi@h3c.com>)
 id 1khVCH-0003Fq-SZ; Tue, 24 Nov 2020 05:05:31 -0500
Received: from DAG2EX09-IDC.srv.huawei-3com.com ([10.8.0.72])
 by h3cspam02-ex.h3c.com with ESMTP id 0AOA4kBs046634;
 Tue, 24 Nov 2020 18:04:46 +0800 (GMT-8)
 (envelope-from tu.guoyi@h3c.com)
Received: from DAG2EX03-BASE.srv.huawei-3com.com (10.8.0.66) by
 DAG2EX09-IDC.srv.huawei-3com.com (10.8.0.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 24 Nov 2020 18:04:49 +0800
Received: from DAG2EX03-BASE.srv.huawei-3com.com ([fe80::5d18:e01c:bbbd:c074])
 by DAG2EX03-BASE.srv.huawei-3com.com ([fe80::5d18:e01c:bbbd:c074%7])
 with mapi id 15.01.2106.002; Tue, 24 Nov 2020 18:04:49 +0800
From: Tuguoyi <tu.guoyi@h3c.com>
To: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Subject: [PATCH] block: Don't inactivate bs if it is aleady inactive
Thread-Topic: [PATCH] block: Don't inactivate bs if it is aleady inactive
Thread-Index: AdbCSQxswlhoF8V3RjCLABUwyacY/A==
Date: Tue, 24 Nov 2020 10:04:48 +0000
Message-ID: <b6caaaf3bfa84e3d913c81361b32ddae@h3c.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.125.108.131]
x-sender-location: DAG2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: h3cspam02-ex.h3c.com 0AOA4kBs046634
Received-SPF: pass client-ip=60.191.123.50; envelope-from=tu.guoyi@h3c.com;
 helo=h3cspam02-ex.h3c.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Wangyong <wang.yongD@h3c.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBzdGVwcyB3aWxsIGNhdXNlIHFlbXUgYXNzZXJ0aW9uIGZhaWx1cmU6DQot
IHBhdXNlIHZtDQotIHNhdmUgbWVtb3J5IHNuYXBzaG90IGludG8gbG9jYWwgZmlsZSB0aHJvdWdo
IGZkIG1pZ3JhdGlvbg0KLSBkbyB0aGUgYWJvdmUgb3BlcmF0aW9uIGFnYWluIHdpbGwgY2F1c2Ug
cWVtdSBhc3NlcnRpb24gZmFpbHVyZQ0KDQpUaGUgYmFja3RyYWNlIGxvb2tzIGxpa2U6DQojMCAg
MHgwMDAwN2ZiZjk1OGM1YzM3IGluIHJhaXNlICgpIGZyb20gL2xpYi94ODZfNjQtbGludXgtZ251
L2xpYmMuc28uNg0KIzEgIDB4MDAwMDdmYmY5NThjOTAyOCBpbiBhYm9ydCAoKSBmcm9tIC9saWIv
eDg2XzY0LWxpbnV4LWdudS9saWJjLnNvLjYNCiMyICAweDAwMDA3ZmJmOTU4YmViZjYgaW4gPz8g
KCkgZnJvbSAvbGliL3g4Nl82NC1saW51eC1nbnUvbGliYy5zby42DQojMyAgMHgwMDAwN2ZiZjk1
OGJlY2EyIGluIF9fYXNzZXJ0X2ZhaWwgKCkgZnJvbSAvbGliL3g4Nl82NC1saW51eC1nbnUvbGli
Yy5zby42DQojNCAgMHgwMDAwNTVjYThkZWNkMzlkIGluIGJkcnZfaW5hY3RpdmF0ZV9yZWN1cnNl
IChicz0weDU1Y2E5MGM4MDQwMCkgYXQgL2J1aWxkL3FlbXUtNS4wL2Jsb2NrLmM6NTcyNA0KIzUg
IDB4MDAwMDU1Y2E4ZGVjZTk2NyBpbiBiZHJ2X2luYWN0aXZhdGVfYWxsICgpIGF0IC9idWlsZC8v
cWVtdS01LjAvYmxvY2suYzo1NzkyDQojNiAgMHgwMDAwNTVjYThkZTU1MzlkIGluIHFlbXVfc2F2
ZXZtX3N0YXRlX2NvbXBsZXRlX3ByZWNvcHlfbm9uX2l0ZXJhYmxlIChpbmFjdGl2YXRlX2Rpc2tz
PXRydWUsIGluX3Bvc3Rjb3B5PWZhbHNlLCBmPTB4NTVjYTkwNzA0NGIwKQ0KICAgIGF0IC9idWls
ZC9xZW11LTUuMC9taWdyYXRpb24vc2F2ZXZtLmM6MTQwMQ0KIzcgIHFlbXVfc2F2ZXZtX3N0YXRl
X2NvbXBsZXRlX3ByZWNvcHkgKGY9MHg1NWNhOTA3MDQ0YjAsIGl0ZXJhYmxlX29ubHk9aXRlcmFi
bGVfb25seUBlbnRyeT1mYWxzZSwgaW5hY3RpdmF0ZV9kaXNrcz1pbmFjdGl2YXRlX2Rpc2tzQGVu
dHJ5PXRydWUpDQogICAgYXQgL2J1aWxkL3FlbXUtNS4wL21pZ3JhdGlvbi9zYXZldm0uYzoxNDUz
DQojOCAgMHgwMDAwNTVjYThkZTRmNTgxIGluIG1pZ3JhdGlvbl9jb21wbGV0aW9uIChzPTB4NTVj
YThmNjRkOWYwKSBhdCAvYnVpbGQvcWVtdS01LjAvbWlncmF0aW9uL21pZ3JhdGlvbi5jOjI5NDEN
CiM5ICBtaWdyYXRpb25faXRlcmF0aW9uX3J1biAocz0weDU1Y2E4ZjY0ZDlmMCkgYXQgL2J1aWxk
L3FlbXUtNS4wL21pZ3JhdGlvbi9taWdyYXRpb24uYzozMjk1DQojMTAgbWlncmF0aW9uX3RocmVh
ZCAob3BhcXVlPW9wYXF1ZUBlbnRyeT0weDU1Y2E4ZjY0ZDlmMCkgYXQgL2J1aWxkL3FlbXUtNS4w
L21pZ3JhdGlvbi9taWdyYXRpb24uYzozNDU5DQojMTEgMHgwMDAwNTVjYThkZmM2NzE2IGluIHFl
bXVfdGhyZWFkX3N0YXJ0IChhcmdzPTxvcHRpbWl6ZWQgb3V0PikgYXQgL2J1aWxkL3FlbXUtNS4w
L3V0aWwvcWVtdS10aHJlYWQtcG9zaXguYzo1MTkNCiMxMiAweDAwMDA3ZmJmOTVjNWYxODQgaW4g
c3RhcnRfdGhyZWFkICgpIGZyb20gL2xpYi94ODZfNjQtbGludXgtZ251L2xpYnB0aHJlYWQuc28u
MA0KIzEzIDB4MDAwMDdmYmY5NTk4Y2JlZCBpbiBjbG9uZSAoKSBmcm9tIC9saWIveDg2XzY0LWxp
bnV4LWdudS9saWJjLnNvLjYNCg0KV2hlbiB0aGUgZmlyc3QgbWlncmF0aW9uIGNvbXBsZXRlcywg
YnMtPm9wZW5fZmxhZ3Mgd2lsbCBzZXQgQkRSVl9PX0lOQUNUSVZFIGZsYWcNCmJ5IGJkcnZfaW5h
Y3RpdmF0ZV9yZWN1cnNlKCksIGFuZCBkdXJpbmcgdGhlIHNlY29uZCBtaWdyYXRpb24gdGhlDQpi
ZHJ2X2luYWN0aXZhdGVfcmVjdXJzZSBhc3NlcnQgdGhhdCB0aGUgYnMtPm9wZW5fZmxhZ3MgaXMg
YWxyZWFkeSBCRFJWX09fSU5BQ1RJVkUNCmVuYWJsZWQgd2hpY2ggY2F1c2UgY3Jhc2guDQoNClRo
aXMgcGF0Y2gganVzdCBtYWtlIHRoZSBiZHJ2X2luYWN0aXZhdGVfYWxsKCkgdG8gZG9uJ3QgaW5h
Y3RpdmF0ZSB0aGUgYnMgaWYgaXQgaXMNCmFscmVhZHkgaW5hY3RpdmUNCg0KU2lnbmVkLW9mZi1i
eTogVHVndW95aSA8dHUuZ3VveWlAaDNjLmNvbT4NCi0tLQ0KIGJsb2NrLmMgfCA3ICsrKysrKy0N
CiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYg
LS1naXQgYS9ibG9jay5jIGIvYmxvY2suYw0KaW5kZXggZjFjZWRhYy4uMDIzNjFlMSAxMDA2NDQN
Ci0tLSBhL2Jsb2NrLmMNCisrKyBiL2Jsb2NrLmMNCkBAIC01OTM4LDYgKzU5MzgsMTEgQEAgc3Rh
dGljIGludCBiZHJ2X2luYWN0aXZhdGVfcmVjdXJzZShCbG9ja0RyaXZlclN0YXRlICpicykNCiAg
ICAgcmV0dXJuIDA7DQogfQ0KIA0KK3N0YXRpYyBib29sIGJkcnZfaXNfaW5hY3RpdmUoQmxvY2tE
cml2ZXJTdGF0ZSAqYnMpDQorew0KKyAgICByZXR1cm4gYnMtPm9wZW5fZmxhZ3MgJiBCRFJWX09f
SU5BQ1RJVkU7DQorfQ0KKw0KIGludCBiZHJ2X2luYWN0aXZhdGVfYWxsKHZvaWQpDQogew0KICAg
ICBCbG9ja0RyaXZlclN0YXRlICpicyA9IE5VTEw7DQpAQCAtNTk1OCw3ICs1OTYzLDcgQEAgaW50
IGJkcnZfaW5hY3RpdmF0ZV9hbGwodm9pZCkNCiAgICAgICAgIC8qIE5vZGVzIHdpdGggQkRTIHBh
cmVudHMgYXJlIGNvdmVyZWQgYnkgcmVjdXJzaW9uIGZyb20gdGhlIGxhc3QNCiAgICAgICAgICAq
IHBhcmVudCB0aGF0IGdldHMgaW5hY3RpdmF0ZWQuIERvbid0IGluYWN0aXZhdGUgdGhlbSBhIHNl
Y29uZA0KICAgICAgICAgICogdGltZSBpZiB0aGF0IGhhcyBhbHJlYWR5IGhhcHBlbmVkLiAqLw0K
LSAgICAgICAgaWYgKGJkcnZfaGFzX2Jkc19wYXJlbnQoYnMsIGZhbHNlKSkgew0KKyAgICAgICAg
aWYgKGJkcnZfaGFzX2Jkc19wYXJlbnQoYnMsIGZhbHNlKSB8fCBiZHJ2X2lzX2luYWN0aXZlKGJz
KSkgew0KICAgICAgICAgICAgIGNvbnRpbnVlOw0KICAgICAgICAgfQ0KICAgICAgICAgcmV0ID0g
YmRydl9pbmFjdGl2YXRlX3JlY3Vyc2UoYnMpOw0KLS0gDQoyLjcuNA0KDQoNCi0tDQpCZXN0IHJl
Z2FyZHMsDQpHdW95aQ0KDQoNCg==

