Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9810C3D6BE9
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 04:22:53 +0200 (CEST)
Received: from localhost ([::1]:58572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Ck8-0000A8-9P
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 22:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <AIERPATIJIANG1@kingsoft.com>)
 id 1m8CjP-0007xk-MY
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 22:22:07 -0400
Received: from [114.255.44.146] (port=39367 helo=mail.kingsoft.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <AIERPATIJIANG1@kingsoft.com>) id 1m8CjL-00050P-RE
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 22:22:07 -0400
X-AuditID: 0a580157-8b5ff700000015d4-ff-60ff6dbc702a
Received: from mail.kingsoft.com (localhost [10.88.1.78])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mail.kingsoft.com (SMG-1-NODE-87) with SMTP id 4B.28.05588.CBD6FF06;
 Tue, 27 Jul 2021 10:21:48 +0800 (HKT)
Received: from KSbjmail3.kingsoft.cn (10.88.1.78) by KSBJMAIL3.kingsoft.cn
 (10.88.1.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 27 Jul
 2021 10:21:48 +0800
Received: from KSbjmail3.kingsoft.cn ([fe80::7d5f:5fcb:9c30:789b]) by
 KSBJMAIL3.kingsoft.cn ([fe80::7d5f:5fcb:9c30:789b%6]) with mapi id
 15.01.2176.014; Tue, 27 Jul 2021 10:21:48 +0800
From: =?utf-8?B?QUlFUlBBVElKSUFORzEgW+iJvuWwlOW4leaPkOaxn8K36Zi/5biD6YO96LWb?=
 =?utf-8?B?5Lmw5o+QXQ==?= <AIERPATIJIANG1@kingsoft.com>
To: "lvivier@redhat.com" <lvivier@redhat.com>, "amit@kernel.org"
 <amit@kernel.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Subject: [PATCH] hw/char/virtio-serial-bus: fix: Unpop throttled
 VirtQueueElement to queue before discard vq data
Thread-Topic: [PATCH] hw/char/virtio-serial-bus: fix: Unpop throttled
 VirtQueueElement to queue before discard vq data
Thread-Index: AQHXfhCIoeZCoIzDgkWI30flJ82In6tWICuA
Date: Tue, 27 Jul 2021 02:21:48 +0000
Message-ID: <330EE4BB-DE8D-4D4A-9E6E-08E50BDA5E45@kingsoft.com>
References: <2904D378-AA27-4510-A3C8-7E2E34DF37EF@kingsoft.com>
In-Reply-To: <2904D378-AA27-4510-A3C8-7E2E34DF37EF@kingsoft.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.88.2.22]
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F75A6B234C88348B35D5366FB4F3411@kingsoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphkeLIzCtJLcpLzFFi42LhimD0092T+z/BYOMiY4vPd+ewW3xqkLI4
 3ruDxeL1pP+sDiwem1Z1snk8ubaZyeP9vqtsAcxRXDYpqTmZZalF+nYJXBkLumezFUyQqNi4
 aiFrA+MB8S5GTg4JAROJiWvvMHUxcnEICUxnklg0/TULhPOCUeL0pmvsEM4eRomnFxcygjhs
 Au2MEocPT2cFcUQEtjBK/G1rZAUZJixQLPH093/mLkYOoESFxK0/KSBhEQEjian3FzKD2CwC
 qhIdDQ/AbF4Be4kna54zgpQLAdm7FtuAhDkFHCQ+tV4EK2EUkJWY9ug+E4jNLCAuMXfaLFaI
 swUkluw5zwxhi0q8fPwPKi4nseFEJzvISGYBTYn1u/QhWq0ldsx8zQ5hK0pM6X7IDnGBoMTJ
 mU9YJjCKzUKyYRZC9ywk3bOQdM9C0r2AkXUVI0txbrrhJkZIRIXvYJzX9FHvECMTB+MhRgkO
 ZiURXocVvxOEeFMSK6tSi/Lji0pzUosPMUpzsCiJ85Yc/JcgJJCeWJKanZpakFoEk2Xi4JRq
 YKpS/bTuY8DkqI1HpYJinWsXXJHePT9+h7a2XzqbvWdEwGbpG9rZjDvqrIM3N1bJJ4ge6Zu8
 vs2jzPrnk5uvTm3KyExrTOdJWNaRwGzTYKj16fz1mDdRRj4zde/t2OliUZJ93+xif6RqImuW
 66qS7RzL+q89jol3cVkXJZe2am+Fg+WHa/dNpGMqgretkDBaon5VKLf14qJpdw0cK+b+nPpo
 DfvZOUsl63zaZpnem7T6SFKqxZewGVXLnZ/srfp9I/zUPD4HAzGtfZHMypcOfdS/eTbwZeF0
 TaX7vM0XSuZlRcZd35S9o6dya/ekR8mJl46s2and3RNhF1QTv6678NOzmqu2PDOsmr6wB1x9
 p8RSnJFoqMVcVJwIAPdPZAcXAwAA
X-Host-Lookup-Failed: Reverse DNS lookup failed for 114.255.44.146 (failed)
Received-SPF: pass client-ip=114.255.44.146;
 envelope-from=AIERPATIJIANG1@kingsoft.com; helo=mail.kingsoft.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UG9ydHMgZW50ZXIgYSAidGhyb3R0bGVkIiBzdGF0ZSB3aGVuIHdyaXRpbmcgdG8gdGhlIGNoYXJk
ZXYgd291bGQgYmxvY2suDQpUaGUgY3VycmVudCBvdXRwdXQgVmlydFF1ZXVlRWxlbWVudCBpcyBr
ZXB0IGFyb3VuZCB1bnRpbCB0aGUgY2hhcmRldg0KYmVjb21lcyB3cml0YWJsZSBhZ2Fpbi4NCsKg
DQpCZWNhdXNlIGNsb3NpbmcgdGhlIHZpcnRpbyBzZXJpYWwgZGV2aWNlIGRvZXMgbm90IHJlc2V0
IHRoZSBxdWV1ZSwgd2UgY2Fubm90DQpkaXJlY3RseSBkaXNjYXJkIHRoaXMgZWxlbWVudCwgwqBv
dGhlcndpc2UgdGhlIGNvbnRyb2wgdmFyaWFibGVzIG9mIHRoZSBmcm9udA0KYW5kIGJhY2sgZW5k
cyBvZiB0aGUgcXVldWUgYXJlIGluY29uc2lzdGVudCBzdWNoIGFzIHVzZWRfaW5kZXguIFdlIHNo
b3VsZCB1bnBvcCB0aGUNClZpcnRRdWV1ZUVsZW1lbnQgdG8gcXVldWUsIGxldCBkaXNjYXJkX3Zx
X2RhdGEgcHJvY2VzcyBpdC4NCsKgDQpUaGUgdGVzdCBlbnZpcm9ubWVudDoNCmtlcm5lbDogbGlu
dXgtNS4xMg0KUWVtdSBjb21tYW5kOg0KUWVtdS1zeXN0ZW0teDg2IC1tYWNoaW5lIHBjLGFjY2Vs
PWt2bSBcDQrCoMKgwqAgLWNwdSBob3N0LGhvc3QtcGh5cy1iaXRzIFwNCsKgwqDCoCAtc21wIDQg
XA0KwqDCoMKgIC1tIDRHIFwNCsKgwqDCoCAta2VybmVsIC4va2VybmVsIFwNCsKgwqDCoCAtZGlz
cGxheSBub25lIFwNCsKgwqDCoCAtbm9kZWZhdWx0cyBcDQrCoMKgwqAgLXNlcmlhbCBtb246c3Rk
aW8gXA0KwqDCoMKgIC1hcHBlbmQgInBhbmljPTEgbm9fdGltZXJfY2hlY2sgbm9yZXBsYWNlLXNt
cCByb290ZmxhZ3M9ZGF0YT1vcmRlcmVkIHJvb3Rmc3R5cGU9ZXh0NCBjb25zb2xlPXR0eVMwIHJl
Ym9vdD1rIHJvb3Q9L2Rldi92ZGExIHJ3IiBcDQrCoMKgwqAgLWRyaXZlIGlkPW9zLGZpbGU9Li9k
aXNrLGlmPW5vbmUgXA0KwqDCoMKgIC1kZXZpY2UgdmlydGlvLWJsay1wY2ksZHJpdmU9b3MgXA0K
wqDCoMKgIC1kZXZpY2UgdmlydGlvLXNlcmlhbC1wY2ksaWQ9dmlydGlvLXNlcmlhbDAsYnVzPXBj
aS4wLGFkZHI9MHg0IFwNCsKgwqDCoCAtY2hhcmRldiBzb2NrZXQsaWQ9Y2hhcmNoYW5uZWwwLHBh
dGg9L3RtcC9jaGFyLWRldi10ZXN0LHNlcnZlcixub3dhaXQgXA0KICAtZGV2aWNlIHZpcnRzZXJp
YWxwb3J0LGJ1cz12aXJ0aW8tc2VyaWFsMC4wLG5yPTEsY2hhcmRldj1jaGFyY2hhbm5lbDAsaWQ9
Y2hhbm5lbDAsbmFtZT1vcmcucWVtdS5ndWVzdF9hZ2VudC4wDQrCoA0KZnVsbCB1cCB2aXJ0aW8g
cXVldWUgYWZ0ZXIgVk0gc3RhcnRlZDoNCkNhdCAvbGFyZ2UtZmlsZSA+IC9kZXYvdnBvcnQxcDEN
CsKgDQpIb3N0IHNpZGU6DQpPcGVuIGFuZCBjbG9zZSBjaGFyYWN0ZXIgZGV2aWNlIHNvY2tldHMg
cmVwZWF0ZWRseQ0KwqANCkFmdGVyIGF3aGlsZSB3ZSBjYW7igJl0IHdyaXRlIGFueSByZXF1ZXN0
IHRvIC9kZXYvdnBvcnQxcDEgYXQgVk0gc2lkZSwgVk0ga2VybmVsIHNvZnQgbG9ja3VwIGF0IGRy
aXZlcnMvY2hhci92aXJ0aW9fY29uc29sZS5jOiBfX3NlbmRfdG9fcG9ydA0KwqANCsKgDQpTaWdu
ZWQtb2ZmLWJ5OiBBcmFmYXRtcyA8YWllcnBhdGlqaWFuZzFAa2luZ3NvZnQuY29tPg0KwqANCmRp
ZmYgLS1naXQgYS9ody9jaGFyL3ZpcnRpby1zZXJpYWwtYnVzLmMgYi9ody9jaGFyL3ZpcnRpby1z
ZXJpYWwtYnVzLmMNCmluZGV4IGRkNmJjMjdiM2IuLjM2MjM2ZGVmZGYgMTAwNjQ0DQotLS0gYS9o
dy9jaGFyL3ZpcnRpby1zZXJpYWwtYnVzLmMNCisrKyBiL2h3L2NoYXIvdmlydGlvLXNlcmlhbC1i
dXMuYw0KQEAgLTE1MCw4ICsxNTAsMTIgQEAgc3RhdGljIHZvaWQgZGlzY2FyZF92cV9kYXRhKFZp
cnRRdWV1ZSAqdnEsIFZpcnRJT0RldmljZSAqdmRldikNCsKgDQpzdGF0aWMgdm9pZCBkaXNjYXJk
X3Rocm90dGxlX2RhdGEoVmlydElPU2VyaWFsUG9ydCAqcG9ydCkNCnsNCivCoMKgwqAgaWYgKCF2
aXJ0aW9fcXVldWVfcmVhZHkocG9ydC0+b3ZxKSkgew0KK8KgwqDCoMKgwqDCoMKgIHJldHVybjsN
CivCoMKgwqAgfQ0KKw0KwqDCoMKgwqAgaWYgKHBvcnQtPmVsZW0pIHsNCi3CoMKgwqDCoMKgwqDC
oCB2aXJ0cXVldWVfZGV0YWNoX2VsZW1lbnQocG9ydC0+b3ZxLCBwb3J0LT5lbGVtLCAwKTsNCivC
oMKgwqDCoMKgwqDCoCB2aXJ0cXVldWVfdW5wb3AocG9ydC0+b3ZxLCBwb3J0LT5lbGVtLCAwKTsN
CsKgwqDCoMKgwqDCoMKgwqAgZ19mcmVlKHBvcnQtPmVsZW0pOw0KwqDCoMKgwqDCoMKgwqDCoCBw
b3J0LT5lbGVtID0gTlVMTDsNCsKgwqDCoMKgIH0NCg0K

